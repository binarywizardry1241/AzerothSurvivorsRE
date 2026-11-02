// Register/move existing Programs into the shared tree without opening Ghidra.
// Default is an inventory; --apply performs only leased, journaled renames and
// leaves aliases at every legacy path. Unique Program bytes are never deleted.
import {readFile,readdir,mkdir,realpath,lstat,rename} from 'node:fs/promises';
import {resolve,dirname,join,relative} from 'node:path';
import {fileURLToPath} from 'node:url';
import {createHash} from 'node:crypto';
import {acquireLease,releaseLease,atomicJson} from './rea-durable-queries.mjs';
import {queryWorkspaceKey,selectCandidate,selectQueryWorkspace,selectCensusWorkspace,publishDirectoryAlias,digest,censusWorkspaceIdentity,captureDirectoryLinks,rebaseMovedLinks} from './shared-ghidra-programs.mjs';
const ROOT=await realpath(resolve(dirname(fileURLToPath(import.meta.url)),'..')),runtime=join(ROOT,'runtime'),store=join(runtime,'analysis/programs');
const apply=process.argv.includes('--apply'),requested=process.argv.indexOf('--target'),target=requested<0?null:process.argv[requested+1];
if(target&&!/^[a-f0-9]{64}$/.test(target))throw Error('--target requires an exact SHA-256');
for(const argument of process.argv.slice(2))if(argument.startsWith('--')&&!['--apply','--target','--summary'].includes(argument))throw Error('Unknown argument '+argument);
async function json(path){try{return JSON.parse(await readFile(path,'utf8'));}catch(e){if(e.code==='ENOENT'||e.code==='ENOTDIR')return null;throw e;}}
async function names(path){try{return await readdir(path);}catch(e){if(e.code==='ENOENT')return [];throw e;}}
const confined=path=>resolve(path).startsWith(runtime+'/');
async function safeReal(path){const actual=await realpath(path);if(!confined(actual))throw Error('Program registration path escapes runtime: '+path);return actual;}
async function recoverMoves(path){
 for(const name of await names(path)){
  const entry=join(path,name),info=await lstat(entry);if(info.isSymbolicLink())continue;
  if(info.isDirectory()){await recoverMoves(entry);continue;}
  if(!name.endsWith('.moving.json'))continue;
  const intent=await json(entry);if(!confined(intent.source)||!confined(intent.destination)||!confined(intent.alias))throw Error('Program move journal escapes runtime');
  const destination=await lstat(intent.destination).catch(e=>{if(e.code==='ENOENT')return null;throw e;});if(!destination)continue;
  let lease;try{
   const lockPath=intent.kind==='census'?intent.lease_path:join(intent.destination,'program.lock');
   if(!confined(lockPath))throw Error('Program move lease escapes runtime');lease=await acquireLease(lockPath);
   await rebaseMovedLinks(intent.destination,intent.source,intent.links);
   for(const alias of new Set([intent.source,intent.alias]))await publishDirectoryAlias(alias,intent.destination,intent.source);
  }finally{await releaseLease(lease);}
 }
}
const queryGroups=new Map(),censusGroups=new Map(),allQueries=[],allCensus=[];
for(const sha of await names(join(runtime,'ghidra-queries'))){if(!/^[a-f0-9]{64}$/.test(sha)||target&&sha!==target)continue;
 await safeReal(join(runtime,'ghidra-queries',sha));
 for(const key of await names(join(runtime,'ghidra-queries',sha))){const root=join(runtime,'ghidra-queries',sha,key);await safeReal(root);const profile=await json(join(root,'profile.json'));if(!profile)continue;
  const record={root,profile,ready:await json(join(root,'ready.json'))},group=queryWorkspaceKey(profile);
  if(!queryGroups.has(group))queryGroups.set(group,[]);queryGroups.get(group).push(record);allQueries.push(record);
 }
}
for(const sha of await names(join(runtime,'coverage'))){if(!/^[a-f0-9]{64}$/.test(sha)||target&&sha!==target)continue;
 await safeReal(join(runtime,'coverage',sha));
 for(const name of await names(join(runtime,'coverage',sha,'ghidra'))){const root=join(runtime,'coverage',sha,'ghidra',name),plan=await json(join(root,'plan.json')),progress=await json(join(root,'progress.json'));if(!plan)continue;
  const record={root,plan,progress};allCensus.push(record);
  if(progress?.stage==='completed'&&progress.ghidra_version){const key=digest(censusWorkspaceIdentity(plan,progress.ghidra_version));if(!censusGroups.has(key))censusGroups.set(key,[]);censusGroups.get(key).push(record);}
 }
}
const result={apply,query_profiles:allQueries.length,query_compatibility_groups:queryGroups.size,census_passes:allCensus.length,census_compatibility_groups:censusGroups.size,adopted:[],retained:[],skipped:[]};
if(apply){
 await mkdir(store,{recursive:true});let registry;
 try{
  registry=await acquireLease(join(store,'registry.lock'));
  await recoverMoves(join(store,'retained'));
  for(const group of queryGroups.values()){
   const selected=selectCandidate(group,{profile_digest:null});let lease;
   try{const adopted=await selectQueryWorkspace({workspaceRoot:store,legacyRoot:join(runtime,'ghidra-queries'),commitment:selected.profile,runtimeRoot:runtime,
    acquireLegacyLease:async root=>{lease=await acquireLease(join(root,'program.lock'));}});result.adopted.push({kind:'query',root:adopted.root,workspace_id:adopted.key});}
   catch(error){result.skipped.push({root:selected.root,reason:error.message});}
   finally{await releaseLease(lease);}
  }
  for(const group of censusGroups.values()){
   group.sort((a,b)=>(b.plan.seed_count??0)-(a.plan.seed_count??0));const selected=group[0];let lease;
   try{const adopted=await selectCensusWorkspace({workspaceRoot:store,legacyRoot:join(runtime,'coverage'),plan:selected.plan,providerVersion:selected.progress.ghidra_version,runtimeRoot:runtime,
    acquireLegacyLease:async root=>{lease=await acquireLease(join(root,'census.lock'));}});result.adopted.push({kind:'census',root:adopted.root,workspace_id:adopted.key});}
   catch(error){result.skipped.push({root:selected.root,reason:error.message});}
   finally{await releaseLease(lease);}
  }
  // Distinct seed experiments and unfinished legacy Programs retain their exact
  // databases. Centralizing their physical location is not a claim that one
  // decoded state supersedes another. Cold archival can compact them losslessly.
  for(const record of [...allQueries,...allCensus]){
   const query=!!record.profile,sourceLogical=query?record.root:join(record.root,'project');let source;
   try{source=await realpath(sourceLogical);}catch(e){if(e.code==='ENOENT')continue;throw e;}
   if(source.startsWith(store+'/'))continue;
   const sha=query?record.profile.target_sha256:record.plan.target_sha256;
   const key=query?record.profile.profile_digest:createHash('sha256').update(await readFile(join(record.root,'plan.json'))).digest('hex');
   const destination=join(store,'retained',query?'query':'census',sha,key),intentPath=destination+'.moving.json';let lease;
   try{
    lease=await acquireLease(join(record.root,query?'program.lock':'census.lock'));
    if((await json(join(record.root,'active-process.json')))?.active)throw Error('Active or unresolved Program ownership');
    await mkdir(dirname(destination),{recursive:true});
    let intent=await json(intentPath);if(!intent){intent={source,destination,alias:sourceLogical,target_sha256:sha,kind:query?'query':'census',lease_path:join(record.root,query?'program.lock':'census.lock'),links:await captureDirectoryLinks(source)};await atomicJson(intentPath,intent);}
    if(intent.source!==source||intent.destination!==destination)throw Error('Retained Program move intent differs');
    const exists=await lstat(destination).catch(e=>{if(e.code==='ENOENT')return null;throw e;});
    if(!exists)await rename(source,destination);
    await rebaseMovedLinks(destination,source,intent.links);
    for(const alias of new Set([source,sourceLogical]))await publishDirectoryAlias(alias,destination,source);
    if(!query){
     await atomicJson(join(dirname(destination),'retained-'+key+'.json'),{target_sha256:sha,original_project:sourceLogical,project:destination});
     await atomicJson(join(dirname(destination),'workspace.json'),{format:'rea-shared-program-v1',retained:true,identity:{kind:'census',target_sha256:sha}});
     const archiveLease=await acquireLease(join(dirname(destination),'program.lock'));await releaseLease(archiveLease);
    }
    result.retained.push({kind:query?'query':'census',root:destination,original:sourceLogical});
   }catch(error){result.skipped.push({root:record.root,reason:error.message});}
   finally{await releaseLease(lease);}
  }
  await atomicJson(join(store,'registration.json'),result);
 }finally{await releaseLease(registry);}
}
console.log(JSON.stringify(process.argv.includes('--summary')?{...result,adopted:result.adopted.length,retained:result.retained.length}:result,null,2));

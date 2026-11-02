// Guarded, hash-bound saved Programs for REA's individual PE/raw Ghidra queries.
import {createReadStream,createWriteStream,appendFileSync,constants} from 'node:fs';
import {readFile,writeFile,mkdir,realpath,stat,lstat,rename,open} from 'node:fs/promises';
import {createHash,randomUUID} from 'node:crypto';
import {resolve,relative,dirname,basename,join} from 'node:path';
import {fileURLToPath} from 'node:url';
import {spawn,execFile} from 'node:child_process';
import {promisify} from 'node:util';
import {ghidraHeadlessArguments} from '../node_modules/rea-agents/dist/ghidra/GhidraLauncher.js';
import {ghidraJavaLaunch} from '../node_modules/rea-agents/dist/ghidra/GhidraJavaLaunch.js';
import {ghidraJavaEnvironment} from '../node_modules/rea-agents/dist/ghidra/GhidraInstallation.js';
import {snapshotGhidraAnalysisSeeds} from '../node_modules/rea-agents/dist/ghidra/GhidraAnalysisSeeds.js';
import {snapshotGhidraExtensions} from '../node_modules/rea-agents/dist/ghidra/extensions/GhidraExtensions.js';
import {spawnOwnedProviderProcess} from '../node_modules/rea-agents/dist/process/ProviderProcess.js';
import {cleanupOwnedProcessGroup} from '../node_modules/rea-agents/dist/process/ProcessOwnership.js';
import {AnalysisCancelledError} from '../node_modules/rea-agents/dist/domain/analysisErrorCore.js';
import {selectQueryWorkspace,preparationDigest,writeProgramReceipt,sharedJavaToolOptions,acquireFileLease,releaseGhidraLease,acquireNativeSlot,validateNativePermit} from './shared-ghidra-programs.mjs';
const ROOT=await realpath(resolve(dirname(fileURLToPath(import.meta.url)),'..'));
const executeFile=promisify(execFile);
async function ensureProgramAvailable(project){await executeFile('python3',['-B',join(ROOT,'scripts/manage-program-archives.py'),'--ensure',project],{cwd:ROOT,maxBuffer:1024*1024});}
export async function archiveCompletedRawProgram({rawBinary,programRoot,projectRoot,environment=process.env,execute=executeFile}){
 if(!rawBinary||environment.REA_ARCHIVE_RAW_PROGRAMS==='0')return {skipped:true};
 let outcome;
 try{
  const ready=await readJournal(join(programRoot,'ready.json'));if(!ready?.ready)return {skipped:true,reason:'Program is not ready'};
  const args=['-B',join(ROOT,'scripts/manage-program-archives.py'),'--archive',projectRoot,'--automatic-cache'];
  if(environment.REA_NATIVE_REQUEST_WAITERS)args.push('--defer-if-queued',environment.REA_NATIVE_REQUEST_WAITERS);
  const result=await execute('python3',args,{cwd:ROOT,maxBuffer:1024*1024,timeout:30000,killSignal:'SIGTERM'});
  const state=JSON.parse(result?.stdout??'{}');
  outcome=state.skipped?state:{archived:true,kind:'automatic-raw-program-cache'};
 }catch(error){outcome={archived:false,kind:'automatic-raw-program-cache',error:String(error.message??error).slice(0,2048)};}
 // Archival is an optional storage optimization after a completed session. A
 // competing lease or failed compression must leave the query successful and
 // preserve a small actionable diagnostic, never the full command transcript.
 try{await atomicJson(join(programRoot,'archive-status.json'),outcome);}catch{}
 return outcome;
}
export const FORMAT='rea-durable-queries-v1';
export const LOADER_OPTIONS=['-loader-loadLibraries','false','-loader-libraryLoadDepth','0','-loader-ordinalLookup','false','-loader-linkExistingProjectLibraries','false'];
const TOOL_FILES=['scripts/rea-durable-queries.mjs','scripts/shared-ghidra-programs.mjs','scripts/repair-rea-durable-queries.py','scripts/ghidra/ReaDurableQueryPrepare.java','scripts/ghidra/ReaDurableQueryBridge.fragment.java',
 'node_modules/rea-agents/bridge/ghidra/ReaGhidraBridge.java','node_modules/rea-agents/dist/ghidra/GhidraLauncher.js','node_modules/rea-agents/dist/ghidra/GhidraAnalysisProfile.js','node_modules/rea-agents/dist/ghidra/GhidraSessionValues.js',
 'node_modules/rea-agents/bridge/ghidra/ReaGhidraApplySeeds.java','node_modules/rea-agents/bridge/ghidra/ReaGhidraAnalysisOptions.java',
 'node_modules/rea-agents/dist/ghidra/GhidraJavaLaunch.js','node_modules/rea-agents/dist/ghidra/GhidraProviderClient.js','node_modules/rea-agents/dist/cli-runtime/binary-BVOr2mgE.js','node_modules/rea-agents/dist/mcp/main-kBXHZ8S5.js'];
export const canonical=value=>JSON.stringify(value===undefined?null:value,(_,v)=>v&&typeof v==='object'&&!Array.isArray(v)?Object.fromEntries(Object.entries(v).sort(([a],[b])=>a.localeCompare(b))):v);
export const digest=value=>createHash('sha256').update(canonical(value)).digest('hex');
export async function fileHash(path){const h=createHash('sha256');for await(const b of createReadStream(path))h.update(b);return h.digest('hex');}
export async function atomicJson(path,value){const pending=path+'.'+randomUUID()+'.pending';await writeFile(pending,JSON.stringify(value,null,2)+'\n',{flag:'wx',mode:0o600});await rename(pending,path);}
export async function readJournal(path){let file;try{file=await open(path,constants.O_RDONLY|constants.O_NOFOLLOW);if(!(await file.stat()).isFile())throw Error('Query journal is not a regular file');return JSON.parse(await file.readFile('utf8'));}catch(e){if(e.code==='ENOENT')return null;throw e;}finally{await file?.close();}}
const json=readJournal;
function inside(path,base=ROOT){const rel=relative(base,path);return rel!==''&&!rel.startsWith('..')&&!rel.startsWith('/');}
async function directory(path,base=ROOT){path=resolve(path);if(!inside(path,base))throw Error('Durable query path escapes workspace');let parent=path;while(true){try{await stat(parent);break;}catch(e){if(e.code!=='ENOENT')throw e;parent=dirname(parent);}}const actual=await realpath(parent);if(actual!==base&&!inside(actual,base))throw Error('Durable query path resolves outside workspace');await mkdir(path,{recursive:true,mode:0o700});const real=await realpath(path);if(!inside(real,base))throw Error('Durable query symlink escapes workspace');return real;}
async function tooling(){return Object.fromEntries(await Promise.all(TOOL_FILES.map(async name=>[name,await fileHash(resolve(ROOT,name))])));}
export async function durableQueryParameters(target,installation){
 if(!process.env.REA_DURABLE_QUERY_ROOT||process.env.REA_NATIVE_CENSUS_PLAN||!['pe','raw-binary'].includes(target.format))return null;
 if((installation.platform??process.platform)==='win32')throw Error('Durable query Programs require the POSIX ownership/locking contract');
 await directory(process.env.REA_DURABLE_QUERY_ROOT);
 return {format:FORMAT,static_queries_only:process.env.REA_DURABLE_STATIC_QUERIES==='1',checkpoint_authority:'saved-Program-options',tooling:await tooling(),loader_libraries:'disabled-including-ordinal-and-project-lookup',
  analysis:'same-profile-autoanalysis-until-saved-ready',search_checkpoint:'matching-batches-after-inventory-snapshot-v1',decompile_checkpoint:'completed-result-only-v1'};
}
export const acquireLease=acquireFileLease;
export const releaseLease=releaseGhidraLease;
export function processArguments(original,{projectRoot,programName,preparePath,manifestPath,ready}){
 const log=original.indexOf('-log'),bridge=original.lastIndexOf('-postScript');if(log<0||bridge<0)throw Error('Unrecognized headless invocation');
 let tail=ready?original.slice(log,original.indexOf('-scriptPath')+2).concat(original.slice(bridge)):original.slice(log);
 const scripts=tail.indexOf('-scriptPath');tail[scripts+1]+=';'+dirname(preparePath);
 // Init validates a claimed ready marker against Program options. The second
 // pre-script saves all preparation/seeds before the native analysis transaction.
 const pre=['-preScript',preparePath,manifestPath,'init'];
 const post=['-preScript',preparePath,manifestPath,'checkpoint'];
 const firstScript=tail.findIndex(v=>v==='-preScript'||v==='-postScript');tail.splice(firstScript,0,...pre);
 const firstPost=tail.indexOf('-postScript');tail.splice(firstPost,0,...post);
 return [projectRoot,'rea-project','-process',programName,...tail];
}
export async function launchDurableGhidra(options,session,call={}){
 if(!process.env.REA_DURABLE_QUERY_ROOT||process.env.REA_NATIVE_CENSUS_PLAN)return undefined;
 // Other loaders retain their existing declared import semantics.
 if(options.pspExtension||options.dosCom||options.dosMz||options.mipsSoftFloat)return undefined;
 const input=await open(session.targetPath,'r');let header;try{header=Buffer.alloc(2);await input.read(header,0,2,0);}finally{await input.close();}if(!options.rawBinary&&header.toString()!=='MZ')return undefined;
 let lease,registryLease,nativeSlot,launched,manifest,root,cleaning=false;
 try{
  if((options.platform??process.platform)==='win32')throw Error('Durable Ghidra queries currently require POSIX');
  if(!/^[a-f0-9]{64}$/.test(session.targetSha256)||!/^[a-f0-9]{64}$/.test(session.profileDigest))throw Error('Invalid target/profile commitment');
  const legacyStore=await directory(process.env.REA_DURABLE_QUERY_ROOT);
  const selected=await realpath(session.targetPath),reference=await json(resolve(ROOT,'.codex/reference-game.json'));
  if(!inside(selected)&&selected!==await realpath(reference.exe))throw Error('Target is outside authorized input boundary');
  if(options.analysisSeeds&&!inside(await realpath(options.analysisSeeds.path)))throw Error('Query seeds are outside the workspace');
  const expectedTools=await tooling(),seedPath=options.analysisSeeds?await snapshotGhidraAnalysisSeeds(options.analysisSeeds,session.runtimeRoot):undefined;
  const resolved=options.durableQueryProfile;
  if(resolved?.format!==FORMAT||canonical(resolved.tooling)!==canonical(expectedTools)||resolved.static_queries_only!==(process.env.REA_DURABLE_STATIC_QUERIES==='1'))throw Error('Resolved durable profile differs from current tool bytes or static query mode; reopen the target');
  const extensions=await snapshotGhidraExtensions(options.analysisExtensions??[],session.runtimeRoot);
  const commitment={format:FORMAT,target_sha256:session.targetSha256,profile_digest:session.profileDigest,provider_version:session.providerVersion,tooling:expectedTools,
   static_queries_only:resolved.static_queries_only,seeds:options.analysisSeeds??null,extensions:options.analysisExtensions??[],language:options.languageOverride??null,raw_binary:options.rawBinary??null,disabled_analyzers:options.disabledAnalyzers??[],loader_options:LOADER_OPTIONS};
  commitment.preparation_tools=Object.fromEntries(Object.entries(expectedTools).filter(([name])=>/ReaGhidra(?:ApplySeeds|AnalysisOptions)\.java$/.test(name)));
  const programStore=await directory(process.env.REA_SHARED_PROGRAM_ROOT??join(ROOT,'runtime/analysis/programs'));
  let selectedWorkspace;
  while(!lease){
   registryLease=await acquireLease(join(programStore,'registry.lock'),call.signal,{wait:true,label:'registry'});
   let busy;
   try{
    selectedWorkspace=await selectQueryWorkspace({workspaceRoot:programStore,legacyRoot:legacyStore,commitment,runtimeRoot:join(ROOT,'runtime'),variant:process.env.REA_PROGRAM_VARIANT??'shared',ensureAvailable:ensureProgramAvailable,acquireLegacyLease:async path=>{lease=await acquireLease(join(path,'program.lock'),call.signal);}});
    if(!lease){await ensureProgramAvailable(join(selectedWorkspace.root,'project'));lease=await acquireLease(join(selectedWorkspace.root,'program.lock'),call.signal);}
   }catch(error){if(error.code!=='GHIDRA_LEASE_BUSY')throw error;busy=error.leasePath;}
   finally{await releaseLease(registryLease);registryLease=undefined;}
   // Never wait for a Program while holding the global registry or a worker.
   if(busy){const turn=await acquireLease(busy,call.signal,{wait:true});await releaseLease(turn);}
  }
  root=selectedWorkspace.root;
  commitment.workspace_id=selectedWorkspace.key;commitment.preparation_sha256=preparationDigest(commitment);
  commitment.legacy_profile_digest=selectedWorkspace.workspace.legacy_profile_digest;
  const borrowed=process.env.REA_NATIVE_PERMIT;
  if(borrowed){if(!inside(borrowed,join(ROOT,'runtime/analysis/scheduler')))throw Error('Native permit leaves the shared scheduler');await validateNativePermit(borrowed,session.targetSha256,!options.rawBinary);}
  else nativeSlot=await acquireNativeSlot(programStore,call.signal,{exclusive:!options.rawBinary,target:session.targetSha256});
  await writeProgramReceipt(process.env.REA_SHARED_PROGRAM_RECEIPT,{target_sha256:session.targetSha256,profile_digest:session.profileDigest,workspace_id:selectedWorkspace.key,root},join(ROOT,'runtime'));
  async function verify(){call.signal?.throwIfAborted();if(await fileHash(selected)!==session.targetSha256)throw Error('Selected target bytes changed');if(canonical(await tooling())!==canonical(expectedTools))throw Error('Durable query tool bytes changed');if(seedPath&&await fileHash(seedPath)!==options.analysisSeeds.sha256)throw Error('Seed snapshot commitment differs');}
  await verify();
  const profilePath=join(root,'profile.json'),old=await json(profilePath);
  if(old&&old.target_sha256!==commitment.target_sha256)throw Error('Saved Program target commitment differs');
  const profiles=await directory(join(root,'profiles'),root),retainedProfile=join(profiles,session.profileDigest+'.json');
  const existingProfile=await json(retainedProfile);if(existingProfile&&canonical(existingProfile)!==canonical(commitment))throw Error('Saved request profile commitment differs');
  if(!existingProfile)await atomicJson(retainedProfile,commitment);
  await atomicJson(profilePath,commitment);
  const ownershipPath=join(root,'active-process.json'),orphan=await json(ownershipPath);
  if(orphan?.active){if(orphan.target_sha256!==session.targetSha256)throw Error('Orphan JVM identity differs');const {expectedParentPid,...owned}=orphan.ownership;const cleaned=await cleanupOwnedProcessGroup(owned);if(!cleaned.cleaned)throw Error('Cannot clean orphan JVM: '+cleaned.reason);await atomicJson(ownershipPath,{...orphan,active:false,cleanup:cleaned});}
  const projectRoot=await directory(join(root,'project'),root),runtime=await directory(join(root,'runtime'),root),paths={};for(const name of ['home','tmp','cache','config','data','state'])paths[name]=await directory(join(runtime,name),root);
  const attempts=await directory(join(root,'attempts'),root),attempt=await directory(join(attempts,Date.now()+'-'+session.runId),root);
  const packedCache=await directory(join(ROOT,'runtime/analysis/tool-cache/packed-db-cache'));
  const environment={...ghidraJavaEnvironment(options.javaHome,options.environment,process.platform),JAVA_TOOL_OPTIONS:sharedJavaToolOptions(packedCache),TMPDIR:paths.tmp,XDG_CACHE_HOME:paths.cache,XDG_CONFIG_HOME:paths.config,XDG_DATA_HOME:paths.data,XDG_STATE_HOME:paths.state,XDG_RUNTIME_DIR:paths.tmp,REA_DURABLE_QUERY_SESSION:root,REA_DURABLE_STATIC_QUERIES:resolved.static_queries_only?'1':'0'};
  const descriptorPath=join(session.runtimeRoot,'session.json');await atomicJson(descriptorPath,{transport:session.transport,endpoint_path:session.endpointPath,token:session.token,run_id:session.runId,target_sha256:session.targetSha256,provider_version:session.providerVersion,profile_digest:session.profileDigest,...(extensions.length?{analysis_extensions:extensions}:{})});
  const ghidraLogPath=join(attempt,'ghidra.log'),scriptLogPath=join(attempt,'script.log');
  const original=ghidraHeadlessArguments({...options,platform:process.platform,projectRoot,targetPath:selected,descriptorPath,ghidraLogPath,scriptLogPath,...(seedPath?{seedPath}:{})});
  const bootstrapPath=join(root,'bootstrap.json'),bootstrap=await json(bootstrapPath);
  const savedReady=await json(join(root,'ready.json'));
  if(!options.rawBinary&&!(savedReady?.ready&&savedReady.preparation_sha256===commitment.preparation_sha256)&&process.env.REA_GHIDRA_ALLOW_NEW_PE_ANALYSIS!=='1')throw Error('A fresh/unprepared whole-image query requires allow_full_image_analysis:true in its plan. Reuse a ready compatible Program or retained census first.');
  // Immutable raw inputs may now be CAS aliases. Their content hash and mapping
  // still match the imported Program, while the canonical object's basename does
  // not. Keep the saved Ghidra domain-file name when reopening that Program.
  const programName=bootstrap?.program_name??basename(selected),gpr=join(projectRoot,'rea-project.gpr');
  if(programName==='.'||programName==='..'||/[\\/]/.test(programName))throw Error('Saved Ghidra Program name is not a leaf');
  for(const [path,kind] of [[gpr,'file'],[join(projectRoot,'rea-project.rep'),'directory']]){try{const s=await lstat(path);if(s.isSymbolicLink()||(kind==='file'?!s.isFile():!s.isDirectory()))throw Error('Persistent project path is redirected or invalid: '+path);}catch(e){if(e.code!=='ENOENT')throw e;}}
  async function spawnJvm(args,label){await verify();if(borrowed)await validateNativePermit(borrowed,session.targetSha256,!options.rawBinary);if(nativeSlot&&(nativeSlot.exitCode!==null||nativeSlot.signalCode!==null))throw Error('Native capacity custodian was lost');const command=await (options.javaLaunch??ghidraJavaLaunch)({platform:process.platform,analyzeHeadlessPath:options.analyzeHeadlessPath,javaHome:options.javaHome,...(options.javaVmName?{javaVmName:options.javaVmName}:{}),homeRoot:paths.home,tempRoot:paths.tmp,arguments:args,environment,onStderr:(mode,stderr)=>{if(stderr)appendFileSync(join(attempt,label+'-launch-support.log'),mode+'\n'+stderr+'\n',{mode:0o600,flag:constants.O_WRONLY|constants.O_APPEND|constants.O_CREAT|constants.O_NOFOLLOW});},...(call.signal?{signal:call.signal}:{})});const owned=await (options.spawnProcess??spawnOwnedProviderProcess)({command:command.command,arguments:command.arguments,runId:session.runId,expectedCommand:command.command,platform:process.platform,cwd:ROOT,env:command.environment,hostEnvironment:{},...(call.signal?{signal:call.signal}:{})});
   // Attach full diagnostics immediately; GhidraClient also consumes these pipes.
   owned.process.stdout?.pipe(createWriteStream(join(attempt,label+'-stdout.log'),{mode:0o600,flags:'wx'}));owned.process.stderr?.pipe(createWriteStream(join(attempt,label+'-stderr.log'),{mode:0o600,flags:'wx'}));
   manifest={active:true,target_sha256:session.targetSha256,profile_digest:session.profileDigest,ownership:owned.ownership};
   const receipt=nativeSlot?.processReceipt??process.env.REA_NATIVE_PROCESS_RECEIPT;
   if(receipt){if(!inside(receipt,join(ROOT,'runtime')))throw Error('Native process receipt leaves runtime');await atomicJson(receipt,{ownership:owned.ownership,ownership_path:ownershipPath});}
   await atomicJson(ownershipPath,manifest);
   if(borrowed){try{await validateNativePermit(borrowed,session.targetSha256,!options.rawBinary);}catch(error){await cleanupOwnedProcessGroup(owned.ownership);throw error;}}
   nativeSlot?.once('exit',()=>{if(!cleaning)void cleanupOwnedProcessGroup(owned.ownership);});return owned;}
  if(bootstrap&&(bootstrap.target_sha256!==session.targetSha256||bootstrap.program_name!==programName))throw Error('Bootstrap commitment differs');
  if(!bootstrap){
   let exists=false;try{await stat(gpr);exists=true;}catch(e){if(e.code!=='ENOENT')throw e;}
   // A crash can occur after Ghidra saves the import but before this journal.
   // Recover only by reopening it; preparation checks its real source hash and
   // Program options before publishing bootstrap. Never reimport/overwrite it.
   if(!exists){
   const archived=await json(join(projectRoot,'shared-program-archive.json'));if(archived&&['cold','restoring'].includes(archived.state))throw Error('Program was archived while acquiring its lease; retry restoration without overwriting it');
   const prefix=original.slice(0,original.indexOf('-readOnly'));const importArgs=prefix.concat(LOADER_OPTIONS,['-noanalysis','-log',join(attempt,'import-ghidra.log'),'-scriptlog',join(attempt,'import-script.log')]);
   launched=await spawnJvm(importArgs,'import');
   const imported=launched;
   const code=await new Promise((yes,no)=>{const abort=()=>cleanupOwnedProcessGroup(imported.ownership).then(()=>finish(no,call.signal.reason));const finish=(fn,value)=>{call.signal?.removeEventListener('abort',abort);fn(value);};imported.process.once('error',e=>finish(no,e));imported.process.once('exit',code=>finish(yes,code));call.signal?.addEventListener('abort',abort,{once:true});if(call.signal?.aborted)abort();});
   if(code!==0)throw Error('Ghidra bootstrap failed: '+code);await stat(gpr);
   await atomicJson(bootstrapPath,{...commitment,program_name:programName});await atomicJson(ownershipPath,{...manifest,active:false});launched=undefined;
   }
  }
  const ready=await json(join(root,'ready.json'));
  const prepared=ready?.ready===true&&ready.preparation_sha256===commitment.preparation_sha256;
  // Invalidate before preparation can save partial progress. A crash before the
  // bridge publishes its replacement marker must remain resumable, rather than
  // letting an optimistic old ready flag contradict the saved Program options.
  if(!prepared&&ready?.ready)await atomicJson(join(root,'ready.json'),{...ready,ready:false,pending_profile_digest:session.profileDigest});
  const preparePath=join(ROOT,'scripts/ghidra/ReaDurableQueryPrepare.java'),manifestPath=join(attempt,'prepare.json');await atomicJson(manifestPath,{...commitment,run_id:session.runId,claimed_ready:prepared,preparation_changed:!prepared,seed_snapshot_path:seedPath??null});
  const args=processArguments(original,{projectRoot,programName,preparePath,manifestPath,ready:prepared});
  launched=await spawnJvm(args,'bridge');
  const release=async()=>{if(cleaning)return {cleaned:false,reason:'cleanup_in_progress'};cleaning=true;const result=await cleanupOwnedProcessGroup(launched.ownership);if(result.cleaned){await atomicJson(ownershipPath,{...manifest,active:false,cleanup:result});await releaseLease(lease);lease=undefined;await releaseLease(nativeSlot);nativeSlot=undefined;await archiveCompletedRawProgram({rawBinary:options.rawBinary,programRoot:root,projectRoot});}else cleaning=false;return result;};
  lease.once('exit',()=>{if(!cleaning)void cleanupOwnedProcessGroup(launched.ownership);});
  return {ok:true,value:{process:launched.process,ownsProcessLifetime:true,ownership:launched.ownership,cleanup:release,projectRoot,ghidraLogPath,scriptLogPath}};
 }catch(cause){let cleanup;if(launched)cleanup=await cleanupOwnedProcessGroup(launched.ownership);if(!launched||cleanup?.cleaned){await releaseLease(lease);await releaseLease(nativeSlot);}await releaseLease(registryLease);
  return {ok:false,error:call.signal?.aborted?new AnalysisCancelledError('open_binary',{cause}):new Error('Durable Ghidra query launch failed: '+cause.message,{cause})};
 }
}

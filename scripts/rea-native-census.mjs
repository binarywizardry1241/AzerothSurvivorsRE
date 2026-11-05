// Persistent whole-image census through REA's inspected Ghidra JVM launcher.
// The collector is a headless job, not a bridge-startup handshake.
import {createReadStream,createWriteStream} from 'node:fs';
import {readFile,writeFile,realpath,mkdir,rename,stat,readdir,rm} from 'node:fs/promises';
import {createHash,randomUUID} from 'node:crypto';
import {resolve,dirname,basename,relative,join} from 'node:path';
import {fileURLToPath} from 'node:url';
import {spawn,execFile} from 'node:child_process';
import {promisify} from 'node:util';
import {finished} from 'node:stream/promises';
import {ghidraJavaLaunch} from '../node_modules/rea-agents/dist/ghidra/GhidraJavaLaunch.js';
import {ghidraJavaEnvironment,inspectGhidraInstallation} from '../node_modules/rea-agents/dist/ghidra/GhidraInstallation.js';
import {spawnOwnedProviderProcess,ProviderProcessSupervisor} from '../node_modules/rea-agents/dist/process/ProviderProcess.js';
import {cleanupOwnedProcessGroup} from '../node_modules/rea-agents/dist/process/ProcessOwnership.js';
import {selectCensusWorkspace,sharedJavaToolOptions,acquireFileLease,acquireNativeSlot,releaseGhidraLease} from './shared-ghidra-programs.mjs';
const root=await realpath(resolve(dirname(fileURLToPath(import.meta.url)),'..'));
const executeFile=promisify(execFile),cancelled=new AbortController(),started=Date.now();
let lock,programLock,registryLock,legacyLock,nativeSlot,active,output,parameters,profileDigest,attempts=[],resultWritten=false,releasingLock=false;
const STORAGE_PREDECESSORS={
 'scripts/census-native-image.py':'e3cfacf62eb4a49efc06562e3211a1aad2032f889c64ffe1ebb711c4efcf5a51',
 'scripts/rea-native-census.mjs':'234161bf645f2473bfdebea16c9753f2955b7f945236604193536f968670edc4',
 'scripts/ghidra/ReaNativeCensus.java':'d91f77b533a723c6c8ab128b4d55c9aa0d94abc6f3f6e6ae8e54c46f1a045b09'};
const RETAINED_PREDECESSORS={
 'scripts/census-native-image.py':['8eef819cdb2ac9d3b52db40574d25fca77c07a68cc1f11506105950ad22138e4','d82a3403c34190240869e4add97faa71b3212bc9657a0a2999b9828cbbb1b077','52e6f0de2d6706651c0ff5eef6e0e79993e77655e3d162b207db935388326d82','5f3ed21972cd41a1a7842a56d9c660a2ef74d511553d98c39c6798f7c8ab7834'],
 'scripts/rea-native-census.mjs':['14f5884b7354d2713118bd250a7ea19e23b487690ddd2a705979ca15d0dec780','8df8dc3bfa71e20831a8ae0a0163aae92e7680bfbf0ed0c0b1d1c3a4ed98ca70','69da5e89ef57528e5f9a036d32b403a4e78f793b2bf4def28657c64eb8381f61','4df2787ab8a73cc106bf295f0eed9c9d772e61d0474d87c242dffe37d3f96f68'],
 'scripts/ghidra/ReaNativeCensus.java':['3d06fe81ef6d16802020e2b1013c11a6d50fde3090ba277fb2ac161de81b0eb3','9620e0505314b2ce1797f7419c89c9919beac2adfa772289bcfc15006a9be9df']};
const GIT_STORAGE_PREDECESSORS={
 'scripts/census-native-image.py':'96e45cfd9ade2d479e3fe27ad0a483620f8e2ae0c75425e608994ed2ce1b2c37',
 'scripts/rea-native-census.mjs':'9733aa2c5cfd7ec9934a1ad060eba0b8fcaf591bb404333ce6842c4100da5cdb'};
const GIT_SEED_PRODUCERS=new Set([
 'scripts/recover-native-import-thunks.py',
 'scripts/recover-native-unwind-handlers.py']);
async function committedTool(name,expected){
 const current=await realConfined(resolve(root,name));if(await sha256(current)===expected)return current;
 if(GIT_STORAGE_PREDECESSORS[name]===expected){
  const {stdout}=await executeFile('git',['cat-file','blob','0bbcb5f5:'+name],{cwd:root,encoding:'buffer'});
  if(createHash('sha256').update(stdout).digest('hex')!==expected)throw Error('Committed storage predecessor differs: '+name);
  return null; // Verified Git source for provenance only. The collector is never substituted.
 }
 if(GIT_SEED_PRODUCERS.has(name)){
  await executeFile('python3',['-B',resolve(root,'scripts/script_sources.py'),'--show',name,'--sha256',expected],{cwd:root});
  return null;
 }
 if(STORAGE_PREDECESSORS[name]!==expected&&!RETAINED_PREDECESSORS[name]?.includes(expected))throw Error('Census tool digest differs: '+name);
 const archived=await realConfined(resolve(root,'runtime/analysis/tools',expected,basename(name)));await verifyHash(archived,expected,'Retained predecessor '+name);return archived;
}
async function ensureProgramAvailable(project){await executeFile('python3',['-B',resolve(root,'scripts/manage-program-archives.py'),'--ensure',project],{cwd:root,maxBuffer:1024*1024});}
const inside=(path,base)=>path!==base && !relative(base,path).startsWith('..') && !relative(base,path).startsWith('/');
function confined(value,base=root) {
 const path=resolve(value);
 if(!inside(path,base))throw Error('Census path escapes workspace/output boundary: '+value);
 return path;
}
async function realConfined(value,base=root) {
 const path=await realpath(confined(value,base));
 if(!inside(path,base))throw Error('Census path resolves outside workspace/output boundary: '+value);
 return path;
}
async function directory(value,base=root) {
 const path=confined(value,base);let ancestor=path;
 while(true){try{await stat(ancestor);break;}catch(e){if(e.code!=='ENOENT')throw e;ancestor=dirname(ancestor);}}
 const existing=await realpath(ancestor);
 if(existing!==base && !inside(existing,base))throw Error('Census directory parent escapes boundary');
 await mkdir(path,{recursive:true,mode:0o700});return realConfined(path,base);
}
async function json(path) {
 try{return JSON.parse(await readFile(path,'utf8'));}catch(e){if(e.code==='ENOENT')return null;throw e;}
}
async function atomicJson(path,value) {
 const pending=path+'.'+randomUUID()+'.pending';
 await writeFile(pending,JSON.stringify(value,null,2)+'\n',{mode:0o600,flag:'wx'});await rename(pending,path);
}
async function sha256(path) {
 const hash=createHash('sha256');for await(const chunk of createReadStream(path))hash.update(chunk);return hash.digest('hex');
}
async function verifyHash(path,expected,label) {
 if(!/^[a-f0-9]{64}$/i.test(expected??'') || await sha256(path)!==expected.toLowerCase())throw Error(label+' changed or has an invalid hash');
}
function positive(value,label) {
 if(!Number.isSafeInteger(value)||value<=0)throw Error(label+' must be a positive safe integer');return value;
}
// Kernel advisory locking has no stale-PID deletion race. The pipe lease also
// releases it if Node crashes while the tiny existing-Python custodian survives.
async function acquireLock(path) {
 if(process.platform==='win32')throw Error('Persistent census currently requires POSIX advisory locking');
 const source=['import fcntl,sys','lease=open(sys.argv[1],"a+")',
  'try: fcntl.flock(lease.fileno(),fcntl.LOCK_EX|fcntl.LOCK_NB)',
  'except BlockingIOError: sys.stderr.write("Another census runner owns this output\\n"); sys.exit(2)',
  'print("locked",flush=True)','sys.stdin.buffer.read()'].join('\n');
 const child=spawn('python3',['-B','-c',source,path],{cwd:root,env:process.env,stdio:['pipe','pipe','pipe']});
 let diagnostic='';child.stderr.on('data',chunk=>{diagnostic+=chunk.toString();});
 await new Promise((accept,reject)=>{
  child.once('error',reject);
  child.stdout.once('data',chunk=>chunk.toString().trim()==='locked'?accept():reject(Error('Invalid census lock handshake')));
  child.once('exit',code=>reject(Error(diagnostic.trim()||'Census lock helper exited: '+code)));
 });return child;
}
async function releaseLock(child) {
 if(!child)return;releasingLock=true;child.stdin.end();if(child.exitCode===null)await new Promise(resolve=>child.once('exit',resolve));
}
for(const signal of ['SIGINT','SIGTERM'])process.on(signal,()=>{if(!cancelled.signal.aborted)cancelled.abort(Error('Census interrupted by '+signal));});
async function main() {
 if(!process.argv[2])throw Error('Usage: ./scripts/rea census-native-image <plan.json>');
 const planPath=await realConfined(resolve(process.argv[2])),planHash=await sha256(planPath),plan=await json(planPath);
 if(plan.persistence?.format!=='ghidra-program-checkpoint-v1')throw Error('Plan has no durable Program checkpoint profile; create a new persistent plan');
 output=await realConfined(plan.output);
 const persistence=plan.persistence;let projectRoot,shared,ownerRoot;
 const projectName=persistence.project_name,programName=persistence.program_name;
 if(projectName!=='NativeCensus'||!/^[A-Za-z0-9_.-]+$/.test(programName??''))throw Error('Invalid persistent project/program name');
 if(!/^[1-9][0-9]*[kKmMgG]?$/.test(plan.heap??''))throw Error('Invalid census heap');
 const stallTimeout=positive(plan.stall_timeout_ms,'stall_timeout_ms'),checkpointLimit=process.env.REA_CENSUS_CHECKPOINT_LIMIT;
 if(checkpointLimit!==undefined)positive(Number(checkpointLimit),'REA_CENSUS_CHECKPOINT_LIMIT');
 for(const name of ['checkpoint_interval_ms','checkpoint_max_batches'])if(plan[name]!==undefined)positive(plan[name],name);
 const metricsPath=process.env.REA_STAGE_METRICS_PATH?confined(process.env.REA_STAGE_METRICS_PATH,resolve(root,'runtime')):resolve(output,'metrics.json');
 if(dirname(metricsPath)!==resolve(root,'runtime'))await directory(dirname(metricsPath),resolve(root,'runtime'));
 await realConfined(dirname(metricsPath));
 const reference=await json(resolve(root,'.codex/reference-game.json'));
 const targetPath=await realpath(plan.target_path),installedTargetPath=await realpath(reference.exe);
 if(!inside(targetPath,root)&&targetPath!==installedTargetPath)throw Error('Target outside authorized reference/workspace boundary');
 if(programName!==basename(targetPath))throw Error('Program name differs from selected target');
 const script=await committedTool('scripts/ghidra/ReaNativeCensus.java',plan.script_sha256),starts=await realConfined(plan.starts);
 const install=inspectGhidraInstallation({installDir:process.env.GHIDRA_INSTALL_DIR,javaHome:process.env.JAVA_HOME,environment:process.env});
 if(install.status!=='available')throw Error(JSON.stringify(install));
 const retainedTools={},adaptations=[];for(const [name,expected]of Object.entries(plan.tooling??{})){
  const path=await committedTool(name,expected);retainedTools[name]=path;
  if(path!==resolve(root,name))adaptations.push({source:name,requested_sha256:expected,
   ...(path?{retained_path:relative(root,path)}:GIT_SEED_PRODUCERS.has(name)
    ?{retained_source_index:'docs/analysis/script-provenance.json'}:{retained_commit:'0bbcb5f5'}),current_sha256:await sha256(resolve(root,name))});
 }
 const programStore=await directory(resolve(root,'runtime/analysis/programs'));
 if(persistence.shared_workspace){
  registryLock=await acquireFileLease(resolve(programStore,'registry.lock'),cancelled.signal,{wait:true,label:'registry'});
  shared=await selectCensusWorkspace({workspaceRoot:programStore,legacyRoot:resolve(root,'runtime/coverage'),plan,providerVersion:install.providerVersion,runtimeRoot:resolve(root,'runtime'),ensureAvailable:ensureProgramAvailable,
   acquireLegacyLease:async value=>{legacyLock=await acquireLock(resolve(value,'census.lock'));}});
  ownerRoot=shared.root;projectRoot=await directory(resolve(shared.root,'project'));await ensureProgramAvailable(projectRoot);
  await releaseLock(registryLock);registryLock=undefined;releasingLock=false;
  programLock=await acquireFileLease(resolve(shared.root,'program.lock'),cancelled.signal,{wait:true});
 }else{
  if(resolve(persistence.project_root)!==resolve(plan.output,'project'))throw Error('Legacy census project path differs');
  projectRoot=await directory(persistence.project_root,resolve(root,'runtime'));await ensureProgramAvailable(projectRoot);
  const owner=await json(resolve(projectRoot,'..','workspace.json'));
  if(owner?.identity?.kind==='census'){
   if(owner.identity.target_sha256!==plan.target_sha256)throw Error('Legacy shared census target differs');
   ownerRoot=dirname(projectRoot);
   programLock=await acquireLock(resolve(projectRoot,'..','program.lock'));
  }
 }
 const archive=await json(resolve(projectRoot,'shared-program-archive.json'));
 if(archive&&['cold','restoring'].includes(archive.state))throw Error('Program was archived while acquiring its lease; retry restoration without overwriting it');
 for(const held of [programLock,legacyLock])held?.once('exit',()=>{if(!releasingLock&&!cancelled.signal.aborted)cancelled.abort(Error('Shared Program lock lease was lost'));});
 const loaderOptions=['-loader-loadLibraries','false','-loader-libraryLoadDepth','0','-loader-ordinalLookup','false','-loader-linkExistingProjectLibraries','false'];
 parameters={format:plan.format,persistence_format:persistence.format,address_code_leads_sha256:plan.address_leads?.sha256??null,
  guarded_jump_tables_sha256:plan.jump_tables?.sha256??null,diagnostic_code_leads_sha256:plan.diagnostic_leads?.sha256??null,
  target_sha256:plan.target_sha256,script_sha256:plan.script_sha256,starts_sha256:plan.starts_sha256,auto_analysis:false,
  installed_reference_import:targetPath===installedTargetPath?'read-only-in-place':'project-local-analysis-input',
  heap:plan.heap,ghidra_version:install.providerVersion,loader_options:loaderOptions,
  execution:'persistent-headless-process',checkpoint_authority:'saved-Program-options',
  ...(plan.decoder_contract===undefined?{}:{decoder_contract:plan.decoder_contract}),
  ...(plan.incremental_reuse===undefined?{}:{incremental_reuse:plan.incremental_reuse,checkpoint_interval_ms:plan.checkpoint_interval_ms,checkpoint_max_batches:plan.checkpoint_max_batches})};
 profileDigest=createHash('sha256').update(JSON.stringify(parameters)).digest('hex');
 const storageExecution={shared_workspace_id:shared?.key??null,driver_adaptations:adaptations,collector_source_path:relative(root,script)};
 async function verifyInputs() {
  cancelled.signal.throwIfAborted();await verifyHash(planPath,planHash,'Census plan');
  await verifyHash(targetPath,plan.target_sha256,'Selected target');await verifyHash(starts,plan.starts_sha256,'Census starts');
  await verifyHash(script,plan.script_sha256,'Collector source');
  for(const [name,digest] of Object.entries(plan.tooling??{}))if(retainedTools[name])await verifyHash(retainedTools[name],digest,'Census tooling '+name);
  for(const name of ['address_leads','diagnostic_leads','jump_tables','import_thunks','unwind_handlers']) {
   const input=plan[name];if(input?.path)await verifyHash(await realConfined(resolve(root,input.path)),input.sha256,'Census proof '+name);
  }
 }
 lock=await acquireLock(resolve(output,'census.lock'));
 lock.once('exit',()=>{if(!releasingLock&&!cancelled.signal.aborted)cancelled.abort(Error('Census lock lease was lost'));});
 if((await json(resolve(output,'progress.json')))?.stage!=='completed')
  await atomicJson(resolve(output,'storage-execution.json'),storageExecution);
 const profilePath=resolve(output,'persistent-profile.json'),previousProfile=await json(profilePath);
 if(previousProfile&&previousProfile.plan_sha256!==planHash)throw Error('Persistent plan differs from saved profile');
 await verifyInputs();
 if(!previousProfile)await atomicJson(profilePath,{format:persistence.format,plan_sha256:planHash,profile_digest:profileDigest,target_sha256:plan.target_sha256});
 else if(previousProfile.profile_digest!==profileDigest)throw Error('Persistent execution profile changed');
 attempts=(await json(resolve(output,'attempts.json')))?.attempts??[];
 const runtime=await directory(resolve(output,'runner'),output),paths={};
 for(const key of ['home','tmp','cache','config','data'])paths[key]=await directory(resolve(runtime,key),output);
 const attemptsRoot=await directory(resolve(output,'attempts'),output);
 const packedCache=await directory(resolve(root,'runtime/analysis/tool-cache/packed-db-cache'));
 const environment={...ghidraJavaEnvironment(install.javaHome,process.env,process.platform),JAVA_TOOL_OPTIONS:sharedJavaToolOptions(packedCache),
  TMPDIR:paths.tmp,XDG_CACHE_HOME:paths.cache,XDG_CONFIG_HOME:paths.config,XDG_DATA_HOME:paths.data,
  GHIDRA_HEADLESS_MAXMEM:plan.heap,REA_NATIVE_CENSUS_PLAN:planPath,REA_CENSUS_RUNTIME_ROOT:resolve(root,'runtime'),REA_STAGE_METRICS_PATH:metricsPath,
  ...(shared?{REA_CENSUS_WORKSPACE_ID:shared.key,REA_CENSUS_ADOPTED_PLAN_HASH:shared.workspace.legacy_plan_sha256??''}:{})};
 const ownershipPath=resolve(ownerRoot??output,'active-process.json'),orphan=await json(ownershipPath);
 if(orphan?.active) {
  if(orphan.target_sha256!==plan.target_sha256||(!ownerRoot&&orphan.profile_digest!==profileDigest))throw Error('Retained JVM belongs to another target/profile');
  // An orphan's old parent is gone; token, command and group still bind it.
  const {expectedParentPid,...ownership}=orphan.ownership,cleanup=await cleanupOwnedProcessGroup(ownership);
  if(!cleanup.cleaned)throw Error('Cannot release prior owned JVM: '+cleanup.reason);
  await atomicJson(ownershipPath,{...orphan,active:false,recovered_at:new Date().toISOString(),cleanup});
 }
 async function progress() {
  const value=await json(resolve(output,'progress.json'));
  if(value&&value.target_sha256?.toLowerCase()!==plan.target_sha256.toLowerCase())throw Error('Progress belongs to another target');return value;
 }
 async function verifyCompleted(value) {
  if(value?.stage!=='completed')return false;
  if(value.script_sha256!==plan.script_sha256||value.plan_sha256!==planHash)throw Error('Completed collector/plan commitment differs');
  for(const name of ['instructions.tsv.gz','bodies.tsv.gz','references.tsv.gz','externals.tsv.gz','direct-call-helpers.tsv.gz',...(value.reuse_state?['reuse-state.json.gz']:[])]) {
   const record=value.files?.[name];if(!record)throw Error('No completed output commitment: '+name);
   const path=await realConfined(resolve(output,name),output);
   if((await stat(path)).size!==record.bytes)throw Error('Output length differs: '+name);await verifyHash(path,record.sha256,'Census output '+name);
  }await verifyInputs();return true;
 }
 async function writeResult(result) {
  await atomicJson(resolve(output,'session-result.json'),{parameters,profileDigest,storageExecution,elapsed_seconds:(Date.now()-started)/1000,attempts:attempts.length,result});resultWritten=true;
 }
 // Always reopen the saved Program once. An optimistic external JSON journal
 // must never supply the authoritative resume cursor or completed state.
 const priorResult=await json(resolve(output,'session-result.json'));
 nativeSlot=await acquireNativeSlot(programStore,cancelled.signal,{exclusive:true});
 nativeSlot.once('exit',()=>{if(!releasingLock&&!cancelled.signal.aborted)cancelled.abort(Error('Native worker capacity lease was lost'));});
 const workPosition=value=>[value?.decode_cursor??0,value?.body_cursor??0,value?.helper_targets?.length??0,
  Number(value?.disassembly_finished??false),Number(value?.helpers_finished??false),Number(value?.body_repair_finished??false),
  Object.keys(value?.files??{}).length,Number(value?.stage==='completed')];
 async function stackDump(pid,attemptDirectory) {
  try {
   const outcome=await executeFile(join(install.javaHome,'bin','jcmd'),[String(pid),'Thread.print','-l'],{cwd:root,env:environment,timeout:15000,maxBuffer:16*1024*1024});
   await writeFile(resolve(attemptDirectory,'thread-dump.txt'),outcome.stdout+'\n'+outcome.stderr);
  }catch(e){await writeFile(resolve(attemptDirectory,'thread-dump.txt'),String(e.stack??e)+'\n'+(e.stdout??'')+'\n'+(e.stderr??''));}
 }
 async function run(mode) {
  await verifyInputs();const number=attempts.length+1,verifyOnly=mode==='verify';
  const attemptDirectory=await directory(resolve(attemptsRoot,String(number).padStart(4,'0')+'-'+mode+'-'+randomUUID().slice(0,8)),output),support=[];
  const attemptTemp=await directory(resolve(attemptDirectory,'tmp'),attemptDirectory);
  const common=[projectRoot,projectName,...(mode==='import'?['-import',targetPath,...loaderOptions]:['-process',programName]),
   '-noanalysis','-log',resolve(attemptDirectory,'ghidra.log'),'-scriptlog',resolve(attemptDirectory,'script.log')];
  if(mode==='process')common.push('-scriptPath',dirname(script),'-postScript',script);
  if(verifyOnly)common.push('-readOnly','-scriptPath',resolve(root,'scripts/ghidra'),'-postScript','ReaVerifyNativeCensus.java');
  const controller=new AbortController(),abort=()=>controller.abort(cancelled.signal.reason);
  cancelled.signal.addEventListener('abort',abort,{once:true});
  const timer=setTimeout(()=>controller.abort(Error('Ghidra launch helper stalled')),60000);let command;
  try{command=await ghidraJavaLaunch({platform:process.platform,analyzeHeadlessPath:install.analyzeHeadlessPath,javaHome:install.javaHome,
   javaVmName:install.javaVmName,homeRoot:paths.home,tempRoot:attemptTemp,arguments:common,
   environment:{...environment,TMPDIR:attemptTemp},signal:controller.signal,
   onStderr:(phase,stderr)=>{support.push({phase,stderr});}});}
  finally{clearTimeout(timer);cancelled.signal.removeEventListener('abort',abort);}
  const initial=await progress();
  const attempt={number,mode,directory:relative(root,attemptDirectory),started_at:new Date().toISOString(),initial_generation:initial?.generation??0,
   initial_position:workPosition(initial),launch_support:support};
  if(!verifyOnly){attempts.push(attempt);await atomicJson(resolve(output,'attempts.json'),{target_sha256:plan.target_sha256,attempts});}
  const launched=await spawnOwnedProviderProcess({command:command.command,arguments:command.arguments,runId:randomUUID(),platform:process.platform,
   cwd:root,env:command.environment,hostEnvironment:{},expectedCommand:command.command,signal:cancelled.signal});
  const owned={...launched,ownsProcessLifetime:true,cleanup:launched.cleanup??(()=>cleanupOwnedProcessGroup(launched.ownership))};
  active=new ProviderProcessSupervisor(owned,{maxDiagnosticBytes:262144});
  await atomicJson(nativeSlot.processReceipt,{ownership:launched.ownership,ownership_path:ownershipPath});
  await atomicJson(ownershipPath,{active:true,target_sha256:plan.target_sha256,profile_digest:profileDigest,workspace_id:shared?.key??null,ownership:launched.ownership,attempt:number,started_at:attempt.started_at});
  const stdout=createWriteStream(resolve(attemptDirectory,'stdout.log'),{flags:'wx'}),stderr=createWriteStream(resolve(attemptDirectory,'stderr.log'),{flags:'wx'});
 let collectorText='',collectorObserved=false,collectorPaused=false,readonlyVerified=false;
  launched.process.stdout?.on('data',chunk=>{
   collectorText=(collectorText+chunk.toString()).slice(-4096);
   if(/REA census resumed generation|REA native census:/.test(collectorText))collectorObserved=true;
   if(collectorText.includes('REA census read-only checkpoint verified'))readonlyVerified=true;
   if(collectorText.includes('REA census paused after a durable batch'))collectorPaused=true;
  });
  let writeError;stdout.on('error',e=>{writeError=e;});stderr.on('error',e=>{writeError=e;});
  launched.process.stdout?.pipe(stdout);launched.process.stderr?.pipe(stderr);
  const stdoutDone=finished(stdout).catch(e=>{writeError=e;}),stderrDone=finished(stderr).catch(e=>{writeError=e;});
  let changedAt=Date.now(),fingerprint='',lastReport=0,reason='exited';
  try {
   while(!await active.waitForExit(1000)) {
    if(cancelled.signal.aborted){reason='cancelled';break;}if(writeError)throw writeError;
    const current=await progress(),working=await stat(resolve(output,'working.json')).catch(e=>e.code==='ENOENT'?null:Promise.reject(e)),partials=[];
    for(const name of await readdir(output))if(name.endsWith('.pending')&&/(?:tsv|export|instruction|reference|bodies)/.test(name)) {
     const value=await stat(resolve(output,name)).catch(e=>e.code==='ENOENT'?null:Promise.reject(e));
     if(value)partials.push([name,value.size,value.mtimeMs]);
    }
    const snapshot=active.snapshot(),startupActivity=mode==='import'||working===null?[snapshot.stdout.observedBytes,snapshot.stderr.observedBytes]:null;
    // Once native work begins, repeated JVM chatter cannot conceal a stall.
    const next=JSON.stringify([current?.generation??0,working?.mtimeMs??0,partials,startupActivity]);
    if(next!==fingerprint){fingerprint=next;changedAt=Date.now();}
    if(Date.now()-lastReport>=30000){console.log('Ghidra census '+mode+': '+(current?.stage??'import/startup')+' '+(current?.completed??0)+'/'+(current?.total??'?')+
     ', saved generation '+(current?.generation??0)+', '+Math.floor((Date.now()-started)/1000)+'s total');lastReport=Date.now();}
    if(Date.now()-changedAt>=stallTimeout){reason='stalled';await stackDump(launched.ownership.leaderPid,attemptDirectory);break;}
   }
  }finally {
   const stop=await active.stop();await active.waitForOutputClose(5000);
   stdout.end();stderr.end();await Promise.all([stdoutDone,stderrDone]);
   const final=await progress();
   attempt.finished_at=new Date().toISOString();attempt.reason=reason;attempt.stop=stop;attempt.diagnostics=active.snapshot();attempt.final_generation=final?.generation??0;
   attempt.final_position=workPosition(final);attempt.collector_observed=collectorObserved;attempt.pause_observed=collectorPaused;attempt.readonly_verified=readonlyVerified;
   if(!verifyOnly){await atomicJson(resolve(attemptDirectory,'result.json'),attempt);await atomicJson(resolve(output,'attempts.json'),{target_sha256:plan.target_sha256,attempts});}
   if(stop.status==='incomplete')throw Error('Owned JVM cleanup incomplete; database retained: '+stop.reason);
   await rm(attemptTemp,{recursive:true});
   await atomicJson(ownershipPath,{active:false,target_sha256:plan.target_sha256,profile_digest:profileDigest,ownership:launched.ownership,attempt:number,finished_at:attempt.finished_at,stop});active=undefined;
  }
  if(verifyOnly){
   if(readonlyVerified&&attempt.reason==='exited'&&attempt.diagnostics.exitCode===0)
    await rm(attemptDirectory,{recursive:true});
   else console.error('Read-only verification diagnostics: '+relative(root,attemptDirectory));
  }
  if(writeError)throw writeError;cancelled.signal.throwIfAborted();return attempt;
 }
 const bootstrapPath=resolve(output,'bootstrap.json'),bootstrap=await json(bootstrapPath);
 if(bootstrap&&bootstrap.target_sha256!==plan.target_sha256)throw Error('Saved bootstrap target differs');
 if((await progress())?.stage==='completed') {
  resultWritten=true; // Preserve the original receipt if verification fails.
  const verification=await run('verify');
  if(!verification.readonly_verified||verification.reason!=='exited'||verification.diagnostics.exitCode!==0||
     !await verifyCompleted(await progress()))throw Error('Read-only verification of the completed census failed');
  if(priorResult?.result?.ok!==true||priorResult.profileDigest!==profileDigest||
     priorResult.result.value?.generation!==(await progress()).generation)
   await writeResult({ok:true,value:{stage:'completed',generation:(await progress()).generation,outputs_verified:true}});
  console.log('Full-image census completed; saved checkpoint and exports verified read-only');return;
 }
 let noAdvance=0;
 while(true) {
  cancelled.signal.throwIfAborted();
  const bootstrapExists=await json(bootstrapPath);
  const projectExists=await stat(resolve(projectRoot,projectName+'.gpr')).then(value=>value.isFile(),()=>false);
  if(!bootstrapExists&&!projectExists) {
   const attempt=await run('import'),exists=await stat(resolve(projectRoot,projectName+'.gpr')).then(value=>value.isFile(),()=>false);
   if(attempt.reason==='exited'&&attempt.diagnostics.exitCode===0&&exists) {
    await atomicJson(bootstrapPath,{target_sha256:plan.target_sha256,profile_digest:profileDigest,program_name:programName});
    console.log('Ghidra target imported into persistent census project');noAdvance=0;
   }else if(++noAdvance>=3)throw Error('Ghidra import failed three times without a saved Program; project and diagnostics retained');
   continue;
  }
  const attempt=await run('process'),current=await progress();
  // An interrupted import can leave a usable saved Program before bootstrap's
  // journal was published. Probe it through the collector, never overwrite it.
  if(!bootstrapExists&&attempt.collector_observed)await atomicJson(bootstrapPath,{target_sha256:plan.target_sha256,profile_digest:profileDigest,program_name:programName});
  if(attempt.collector_observed&&await verifyCompleted(current)) {
   // An unchanged completed replay verifies saved Program state without
   // changing the final session-result hash already bound by curated reports.
   if(priorResult?.result?.ok===true&&priorResult.profileDigest===profileDigest&&priorResult.result.value?.generation===current.generation)resultWritten=true;
   else await writeResult({ok:true,value:{stage:'completed',generation:current.generation,outputs_verified:true}});
   console.log('Full-image census completed; all output commitments verified');return;
  }
  if(checkpointLimit!==undefined&&attempt.pause_observed&&attempt.reason==='exited'&&attempt.diagnostics.exitCode===0) {
   await writeResult({ok:false,partial:true,kind:'checkpoint-limit',stage:current?.stage??null,generation:current?.generation??0});
   console.log('Census stopped at requested checkpoint limit; saved Program retained');return;
  }
  // The script may checkpoint its unchanged entry cursor. A fresh generation
  // alone is not useful advancement and must not allow endless crash retries.
  if(attempt.final_position.some((value,index)=>value>attempt.initial_position[index]))noAdvance=0;else noAdvance++;
  if(noAdvance>=3)throw Error('Census failed three consecutive attempts without advancing a saved checkpoint; Program and diagnostics retained');
  console.log('Retrying from saved Program after '+attempt.reason+'; '+noAdvance+' consecutive attempts without advancement');
 }
}
try{await main();}
catch(error) {
 console.error(error.stack??String(error));
 if(output&&lock&&!resultWritten)await atomicJson(resolve(output,'session-result.json'),{parameters,profileDigest,elapsed_seconds:(Date.now()-started)/1000,
  attempts:attempts.length,result:{ok:false,kind:cancelled.signal.aborted?'cancelled':'failure',error:{name:error.name,message:error.message}}});
 process.exitCode=cancelled.signal.aborted?130:1;
}finally {
 if(active){const stop=await active.stop();if(stop.status==='incomplete'){console.error('JVM cleanup incomplete; ownership and database retained');process.exitCode=1;}}
 await releaseLock(lock);await releaseLock(programLock);await releaseLock(legacyLock);await releaseLock(registryLock);
 await releaseGhidraLease(nativeSlot);
}

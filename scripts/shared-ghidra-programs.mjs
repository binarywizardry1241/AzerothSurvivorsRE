// One leased Ghidra Program per binary and compatible analysis mode. Task paths
// and seed lists identify requests, never another imported copy of the image.
import {createHash,randomUUID} from 'node:crypto';
import {readFile,writeFile,mkdir,readdir,rename,symlink,lstat,realpath,readlink,unlink} from 'node:fs/promises';
import {resolve,relative,dirname,join} from 'node:path';
import {spawn} from 'node:child_process';

// A pipe custodian owns kernel locks, so a cancelled/crashed caller cannot leave
// a stale PID lease behind. Waiting also observes EOF, including before admission.
async function pipeLease(source,args,signal,label){
 signal?.throwIfAborted();
 const child=spawn('python3',['-B','-c',source,...args],{stdio:['pipe','pipe','pipe']});
 let diagnostic='',buffer='';child.stderr.on('data',b=>{diagnostic+=b.toString();});
 const abort=()=>child.stdin.end();signal?.addEventListener('abort',abort,{once:true});
 try{await new Promise((yes,no)=>{
  child.once('error',no);child.once('exit',code=>{const e=Error(diagnostic.trim()||'Ghidra lease exited '+code);if(code===2){e.code='GHIDRA_LEASE_BUSY';e.leasePath=args[0];}no(signal?.aborted?signal.reason:e);});
  child.stdout.on('data',b=>{buffer+=b.toString();let end;while((end=buffer.indexOf('\n'))>=0){const line=buffer.slice(0,end);buffer=buffer.slice(end+1);if(line==='locked')yes();else if(line.startsWith('ticket:'))child.ticketPath=line.slice(7);else if(line==='waiting')process.stderr.write('[Ghidra queue] waiting for '+label+'\n');else no(Error('Invalid Ghidra lease handshake'));}});
  if(signal?.aborted)abort();
 });signal?.throwIfAborted();return child;}
 catch(e){child.stdin.end();if(child.exitCode===null&&child.signalCode===null)await new Promise(done=>child.once('exit',done));throw e;}
 finally{signal?.removeEventListener('abort',abort);}
}
export async function releaseGhidraLease(child){if(!child)return;child.stdin.end();if(child.exitCode===null&&child.signalCode===null)await new Promise(done=>child.once('exit',done));}
export async function acquireFileLease(path,signal,{wait=false,label='Program'}={}){
 const code=`import fcntl,sys,os,stat,select
fd=os.open(sys.argv[1],os.O_CREAT|os.O_RDWR|os.O_NOFOLLOW,0o600)
if not stat.S_ISREG(os.fstat(fd).st_mode): raise ValueError('Ghidra lease is not a regular file')
waiting=False
while True:
 try:
  fcntl.flock(fd,fcntl.LOCK_EX|fcntl.LOCK_NB); break
 except BlockingIOError:
  if sys.argv[2]!='wait': sys.stderr.write('Ghidra '+sys.argv[3]+' lease is busy: '+sys.argv[1]);sys.exit(2)
  if not waiting: print('waiting',flush=True);waiting=True
  if select.select([sys.stdin],[],[],0.1)[0]: sys.exit(0)
print('locked',flush=True)
sys.stdin.buffer.read()
`;
 return pipeLease(code,[path,wait?'wait':'try',label],signal,label);
}

// One FIFO capacity queue for the primary store, shared by every chat/worktree.
// Tickets are locked by their custodians; the next caller removes crash debris.
export async function acquireNativeSlot(programStore,signal,{exclusive=false,processReceipt='',target=''}={}){
 const queue=join(dirname(programStore),'scheduler');await mkdir(queue,{recursive:true,mode:0o700});
 if((await lstat(queue)).isSymbolicLink())throw Error('Ghidra scheduler is redirected');
 processReceipt||=join(queue,randomUUID()+'.process.json');
 const cleanupModule=new URL('../node_modules/rea-agents/dist/process/ProcessOwnership.js',import.meta.url).href;
 const code=`import fcntl,os,sys,stat,select,time,json,uuid,subprocess
from pathlib import Path
root=Path(sys.argv[1]);capacity=2;weight=capacity if sys.argv[2]=='exclusive' else 1
receipt=sys.argv[3]
def reap_owned(path):
 p=Path(path)
 if not p.exists(): return True
 if p.is_symlink(): raise ValueError('Native ownership receipt is redirected')
 record=json.loads(p.read_text());ownership=dict(record['ownership']);ownership.pop('expectedParentPid',None)
 script="import {readFileSync} from 'node:fs';const {cleanupOwnedProcessGroup}=await import(process.argv[1]);process.stdout.write(JSON.stringify(await cleanupOwnedProcessGroup(JSON.parse(readFileSync(0,'utf8')))));"
 result=subprocess.run([sys.argv[4],'--input-type=module','-e',script,sys.argv[5]],input=json.dumps(ownership),text=True,capture_output=True,timeout=30)
 if result.returncode or not json.loads(result.stdout).get('cleaned'): return False
 manifest=Path(record['ownership_path'])
 if manifest.exists() and not manifest.is_symlink():
  current=json.loads(manifest.read_text())
  if current.get('ownership',{}).get('leaderPid')==ownership.get('leaderPid'):
   current['active']=False;pending=manifest.with_name(manifest.name+'.'+uuid.uuid4().hex+'.pending');pending.write_text(json.dumps(current));pending.replace(manifest)
 p.unlink(missing_ok=True);return True
def reap(path):
 try: return reap_owned(path)
 except Exception as failure:
  sys.stderr.write('Native cleanup unresolved; capacity remains reserved: '+str(failure)+'\\n');return False
def opened(path):
 fd=os.open(path,os.O_CREAT|os.O_RDWR|os.O_NOFOLLOW,0o600)
 if not stat.S_ISREG(os.fstat(fd).st_mode): os.close(fd);raise ValueError('Invalid Ghidra queue file')
 return fd
guard=opened(root/'queue.lock')
name=f'{time.time_ns():020d}-{uuid.uuid4().hex}.ticket';path=root/name
state='waiting';announced=False
def publish():
 os.lseek(fd,0,0);os.ftruncate(fd,0);os.write(fd,json.dumps({'state':state,'weight':weight,'process_receipt':receipt,'target':sys.argv[6]}).encode())
fcntl.flock(guard,fcntl.LOCK_EX)
try: fd=opened(path);fcntl.flock(fd,fcntl.LOCK_EX);publish()
finally: fcntl.flock(guard,fcntl.LOCK_UN)
try:
 while True:
  fcntl.flock(guard,fcntl.LOCK_EX)
  try:
   running=0;pending=[]
   for entry in sorted(root.glob('*.ticket')):
    if entry==path: row={'state':state,'weight':weight}
    else:
     other=opened(entry)
     try:
      try: fcntl.flock(other,fcntl.LOCK_EX|fcntl.LOCK_NB)
      except BlockingIOError:
       os.lseek(other,0,0);row=json.loads(os.read(other,4096))
      else:
       os.lseek(other,0,0);stale=json.loads(os.read(other,4096))
       if reap(stale['process_receipt']): entry.unlink();continue
       row={'state':'running','weight':capacity}
     finally: os.close(other)
    if row['state']=='running': running+=row['weight']
    else: pending.append(entry.name)
   if pending and pending[0]==name and running+weight<=capacity:
    state='running';publish();break
  finally: fcntl.flock(guard,fcntl.LOCK_UN)
  if not announced: print('waiting',flush=True);announced=True
  if select.select([sys.stdin],[],[],0.1)[0]: sys.exit(0)
 print('ticket:'+str(path),flush=True);print('locked',flush=True)
 sys.stdin.buffer.read()
 while not reap(receipt): time.sleep(0.25)
finally:
 fcntl.flock(guard,fcntl.LOCK_EX)
 try: path.unlink(missing_ok=True)
 finally: fcntl.flock(guard,fcntl.LOCK_UN)
`;
 const child=await pipeLease(code,[queue,exclusive?'exclusive':'shared',processReceipt,process.execPath,cleanupModule,target],signal,'native worker capacity');child.processReceipt=processReceipt;return child;
}

export async function validateNativePermit(ticket,target,exclusive=false){
 const source=`import os,fcntl,json,sys,stat
fd=os.open(sys.argv[1],os.O_RDONLY|os.O_NOFOLLOW)
if not stat.S_ISREG(os.fstat(fd).st_mode): raise ValueError('Invalid native permit')
try: fcntl.flock(fd,fcntl.LOCK_EX|fcntl.LOCK_NB)
except BlockingIOError: pass
else: raise ValueError('Native permit no longer has a live custodian')
record=json.loads(os.read(fd,4096))
if record['state']!='running' or record['target']!=sys.argv[2] or (sys.argv[3]=='exclusive' and record['weight']!=2): raise ValueError('Native permit identity differs')
print('locked',flush=True)
sys.stdin.buffer.read()
`;
 // Validation holds no capacity/Program lock; immediately release its pipe.
 const checked=await pipeLease(source,[ticket,target,exclusive?'exclusive':'shared'],undefined,'native permit');await releaseGhidraLease(checked);
}

// The batch runner admits outside MCP/native deadlines, then lends this exact
// locked permit to its serial provider. No daemon or separate analysis store.
if(process.argv[2]==='--native-lease'){
 const [store,receipt,target,mode]=process.argv.slice(3);
 const owner=new AbortController();let held;
 const disconnected=new Promise(done=>process.stdin.once('end',()=>{owner.abort(Error('Native request owner disconnected'));done();}));
 process.stdin.resume();
 try{held=await acquireNativeSlot(store,owner.signal,{processReceipt:receipt,target,exclusive:mode==='exclusive'});process.stdout.write(held.ticketPath+'\n');await disconnected;}
 catch(error){if(!owner.signal.aborted)throw error;}
 finally{await releaseGhidraLease(held);}
}

export const PROGRAM_FORMAT='rea-shared-program-v1';
export const canonical=value=>JSON.stringify(value,(_,v)=>v&&typeof v==='object'&&!Array.isArray(v)?Object.fromEntries(Object.entries(v).sort(([a],[b])=>a.localeCompare(b))):v);
export const digest=value=>createHash('sha256').update(canonical(value)).digest('hex');
export function sharedJavaToolOptions(cacheDirectory){
 if(typeof cacheDirectory!=='string'||!cacheDirectory.startsWith('/')||/[\0\r\n]/.test(cacheDirectory))throw Error('Invalid shared Ghidra cache path');
 // HotSpot tokenizes JAVA_TOOL_OPTIONS itself (there is no shell). Quote the
 // entire -D argument so a supported workspace name containing spaces remains
 // one JVM option. Refuse the rare path requiring unsupported quote escaping.
 const option='-Dpdb.cache.dir='+cacheDirectory;
 const quote=!option.includes('"')?'"':!option.includes("'")?"'":null;
 if(!quote)throw Error('Shared Ghidra cache path contains incompatible quote characters');
 return '-XX:-UsePerfData '+quote+option+quote;
}
const extensionIdentity=extensions=>(extensions??[]).map(({path,configured_path,...semantics})=>semantics);
const inside=(path,root)=>path!==root&&!relative(root,path).startsWith('..')&&!relative(root,path).startsWith('/');
async function json(path){try{const s=await lstat(path);if(!s.isFile()||s.isSymbolicLink())throw Error('Program metadata is redirected: '+path);return JSON.parse(await readFile(path,'utf8'));}catch(e){if(e.code==='ENOENT'||e.code==='ENOTDIR')return null;throw e;}}
async function atomic(path,value){const pending=path+'.'+randomUUID()+'.pending';await writeFile(pending,JSON.stringify(value,null,2)+'\n',{flag:'wx',mode:0o600});await rename(pending,path);}
export async function publishDirectoryAlias(alias,destination,predecessor=destination){
 try{const old=await lstat(alias);if(!old.isSymbolicLink())throw Error('Program alias is occupied by a real file/directory: '+alias);
  const link=resolve(dirname(alias),await readlink(alias));if(link!==resolve(destination)&&link!==resolve(predecessor))throw Error('Program alias points elsewhere: '+alias);
 }catch(e){if(e.code!=='ENOENT')throw e;}
 const pending=alias+'.'+randomUUID()+'.pending';try{await symlink(relative(dirname(alias),destination),pending,'dir');await rename(pending,alias);}finally{await unlink(pending).catch(e=>{if(e.code!=='ENOENT')throw e;});}
}
export async function captureDirectoryLinks(root){
 root=await realpath(root);const links=[];
 async function visit(directory){for(const name of await readdir(directory)){const path=join(directory,name),info=await lstat(path);
  if(info.isSymbolicLink()){
   const value=await readlink(path);if(!value.startsWith('/'))links.push({path:relative(root,path),target:await realpath(path),previous:value});
  }else if(info.isDirectory())await visit(path);
 }}
 await visit(root);return links;
}
export async function rebaseMovedLinks(destination,source,links=[]){
 destination=await realpath(destination);source=resolve(source);
 for(const link of links){
  const path=resolve(destination,link.path);if(!inside(path,destination))throw Error('Moved Program link escapes its directory');
  const info=await lstat(path);if(!info.isSymbolicLink())throw Error('Moved Program link was replaced by a real file: '+path);
  const target=link.target===source||inside(link.target,source)?resolve(destination,relative(source,link.target)):link.target;
  const value=relative(dirname(path),target);if(await readlink(path)===value)continue;
  const pending=path+'.'+randomUUID()+'.pending';try{await symlink(value,pending);await rename(pending,path);}finally{await unlink(pending).catch(e=>{if(e.code!=='ENOENT')throw e;});}
 }
}
export function queryWorkspaceIdentity(commitment,variant='shared'){
 if(!/^[a-f0-9]{64}$/.test(commitment.target_sha256??''))throw Error('Invalid Program target hash');
 if(!/^[A-Za-z0-9_.-]{1,80}$/.test(variant))throw Error('Invalid REA_PROGRAM_VARIANT');
 // The source bytes of launch/logging code do not change decoded native state.
 // Provider/language/loader/analyzer or extension changes do. Explicit variants
 // isolate conflicting boundary experiments; normal seed additions are guarded
 // against the actual saved Program before they are committed.
 return {format:PROGRAM_FORMAT,kind:'query',target_sha256:commitment.target_sha256,
  provider_version:commitment.provider_version,static_queries_only:commitment.static_queries_only,
  language:commitment.language??null,raw_binary:commitment.raw_binary??null,
  disabled_analyzers:[...(commitment.disabled_analyzers??[])].sort(),
  loader_options:commitment.loader_options??[],extensions:extensionIdentity(commitment.extensions),variant};
}
export function queryWorkspaceKey(commitment,variant='shared'){return digest(queryWorkspaceIdentity(commitment,variant));}
export function censusWorkspaceIdentity(plan,providerVersion){
 const decoder=plan.decoder_contract===undefined?'rea-incremental-census-v1':plan.decoder_contract;
 if(!['rea-incremental-census-v1','rea-incremental-census-v2'].includes(decoder))throw Error('Unsupported census decoder contract');
 return {format:PROGRAM_FORMAT,kind:'census',target_sha256:plan.target_sha256,
  provider_version:providerVersion,decoder,
  disabled_analyzers:[...(plan.disabled_analyzers??[])].sort(),variant:plan.persistence?.variant??'shared'};
}
export function preparationDigest(commitment){return digest({seeds:commitment.seeds?.sha256??null,extensions:extensionIdentity(commitment.extensions),preparation_tools:commitment.preparation_tools??{}});}
export function selectCandidate(candidates,commitment){
 return candidates.sort((a,b)=>Number(b.profile.profile_digest===commitment.profile_digest)-Number(a.profile.profile_digest===commitment.profile_digest)||Number(b.ready?.ready===true)-Number(a.ready?.ready===true)||
  (Object.values(b.profile.seeds?.entries??{}).reduce((x,y)=>x+y,0)-Object.values(a.profile.seeds?.entries??{}).reduce((x,y)=>x+y,0))||a.root.localeCompare(b.root))[0];
}
async function ensureConfined(path,root){
 path=resolve(path);root=await realpath(root);if(!inside(path,root))throw Error('Program store escapes runtime');
 let parent=path;while(true){try{await lstat(parent);break;}catch(e){if(e.code!=='ENOENT')throw e;parent=dirname(parent);}}
 const actual=await realpath(parent);if(actual!==root&&!inside(actual,root))throw Error('Program store parent escapes runtime');
 await mkdir(path,{recursive:true,mode:0o700});const actualPath=await realpath(path);if(!inside(actualPath,root))throw Error('Program store resolves outside runtime');return actualPath;
}
export async function selectQueryWorkspace({workspaceRoot,legacyRoot,commitment,runtimeRoot,variant='shared',acquireLegacyLease,ensureAvailable}){
 // Caller holds workspaceRoot/registry.lock while adopting and then takes the
 // stable Program lease. Renames preserve all partial progress without copying.
 const identity=queryWorkspaceIdentity(commitment,variant),key=digest(identity);
 const store=await ensureConfined(workspaceRoot,runtimeRoot),targetRoot=await ensureConfined(join(store,commitment.target_sha256),runtimeRoot),root=join(targetRoot,key);
 const intentPath=join(targetRoot,key+'.adopting.json');let intent=await json(intentPath),workspace,acquiredLegacy=false;
 try{workspace=await json(join(root,'workspace.json'));}catch(e){if(e.code!=='ENOENT')throw e;}
 if(workspace){if(workspace.workspace_id!==key||canonical(workspace.identity)!==canonical(identity))throw Error('Shared Program identity differs');return {root,key,workspace};}
 let candidates=[];
 if(!intent&&variant==='shared'){
  let names=[];try{names=await readdir(join(legacyRoot,commitment.target_sha256));}catch(e){if(e.code!=='ENOENT')throw e;}
  for(const name of names){if(!/^[a-f0-9]{64}$/.test(name))continue;const oldRoot=join(legacyRoot,commitment.target_sha256,name);
   let actual;try{actual=await realpath(oldRoot);}catch(e){if(e.code==='ENOENT')continue;throw e;}
   if(!inside(actual,await realpath(runtimeRoot)))throw Error('Legacy Program escapes runtime');
   const profile=await json(join(oldRoot,'profile.json'));if(!profile||canonical(queryWorkspaceIdentity(profile))!==canonical(identity))continue;
   try{if(!(await lstat(join(actual,'project','rea-project.rep'))).isDirectory())continue;}catch(e){if(e.code==='ENOENT'){if(!await json(join(actual,'project','shared-program-archive.json')))continue;}else throw e;}
   candidates.push({root:oldRoot,profile,ready:await json(join(oldRoot,'ready.json'))});
  }
  const selected=selectCandidate(candidates,commitment);
  if(selected){
   if(ensureAvailable)await ensureAvailable(join(selected.root,'project'));
   if(acquireLegacyLease){await acquireLegacyLease(selected.root);acquiredLegacy=true;}
   // An active lease/ownership descriptor is not removed or guessed stale.
   const active=await json(join(selected.root,'active-process.json'));if(active?.active)throw Error('Legacy Program is owned by an active or unresolved process: '+selected.root);
   intent={format:PROGRAM_FORMAT,source:await realpath(selected.root),alias:selected.root,destination:root,profile_digest:selected.profile.profile_digest,identity,links:await captureDirectoryLinks(selected.root)};await atomic(intentPath,intent);
  }
 }
 if(intent){
  if(intent.destination!==root||canonical(intent.identity)!==canonical(identity)||!inside(resolve(intent.source),await realpath(runtimeRoot)))throw Error('Invalid shared Program adoption intent');
  let exists=false;try{await lstat(root);exists=true;}catch(e){if(e.code!=='ENOENT')throw e;}
  if(!exists){if(!acquiredLegacy){if(ensureAvailable)await ensureAvailable(join(intent.source,'project'));if(acquireLegacyLease)await acquireLegacyLease(intent.source);}await rename(intent.source,root);}
  await rebaseMovedLinks(root,intent.source,intent.links);
  // Both the historical logical path and a previously relocated physical path
  // remain valid after adoption, including a crash between rename and aliases.
  for(const alias of new Set([intent.source,intent.alias??intent.source])){const runtime=await realpath(runtimeRoot),parent=await realpath(dirname(alias));if(!inside(resolve(alias),runtime)||(parent!==runtime&&!inside(parent,runtime)))throw Error('Program adoption alias escapes runtime');await publishDirectoryAlias(alias,root,intent.source);}
 }else await mkdir(root,{recursive:true,mode:0o700});
 workspace={format:PROGRAM_FORMAT,workspace_id:key,identity,adopted_from:intent?.alias??intent?.source??null,legacy_profile_digest:intent?.profile_digest??null};
 await atomic(join(root,'workspace.json'),workspace);return {root,key,workspace};
}

export async function selectCensusWorkspace({workspaceRoot,legacyRoot,plan,providerVersion,runtimeRoot,acquireLegacyLease,ensureAvailable}){
 const identity=censusWorkspaceIdentity(plan,providerVersion),key=digest(identity),store=await ensureConfined(workspaceRoot,runtimeRoot);
 const target=await ensureConfined(join(store,plan.target_sha256),runtimeRoot),root=join(target,'census-'+key),workspacePath=join(root,'workspace.json');
 const existing=await json(workspacePath);if(existing){if(canonical(existing.identity)!==canonical(identity))throw Error('Shared census identity differs');return {root,key,workspace:existing};}
 await mkdir(root,{recursive:true,mode:0o700});const intentPath=join(root,'adopting.json');let intent=await json(intentPath),acquiredLegacy=false;
 if(!intent){
  let names=[];try{names=await readdir(join(legacyRoot,plan.target_sha256,'ghidra'));}catch(e){if(e.code!=='ENOENT')throw e;}
  const candidates=[],unfinished=[];
  for(const name of names){const oldRoot=join(legacyRoot,plan.target_sha256,'ghidra',name);let actual;
   try{actual=await realpath(oldRoot);}catch(e){if(e.code==='ENOENT'||e.code==='ENOTDIR')continue;throw e;}
   if(!inside(actual,await realpath(runtimeRoot)))throw Error('Legacy census resolves outside runtime');
   // The current receipt is already published through a legacy-path alias.
   // It is not an older unfinished Program that must be adopted or resumed.
   if(plan.output&&actual===await realpath(plan.output)&&plan.persistence?.shared_workspace)continue;
   const prior=await json(join(actual,'plan.json')),progress=await json(join(actual,'progress.json'));
   if(!prior||prior.target_sha256!==plan.target_sha256||canonical([...(prior.disabled_analyzers??[])].sort())!==canonical(identity.disabled_analyzers))continue;
   if(censusWorkspaceIdentity(prior,providerVersion).decoder!==identity.decoder)continue;
   if(progress?.stage!=='completed'){
    if(!progress?.ghidra_version||progress.ghidra_version===providerVersion)unfinished.push(oldRoot);
    continue;
   }
   if(progress.ghidra_version!==providerVersion)continue;
   const hot=await lstat(join(actual,'project','NativeCensus.rep')).catch(e=>{if(e.code==='ENOENT')return null;throw e;});
   if(!hot&&!await json(join(actual,'project','shared-program-archive.json')))continue;
   candidates.push({root:oldRoot,plan:prior,progress});
  }
  candidates.sort((a,b)=>(b.plan.seed_count??0)-(a.plan.seed_count??0)||a.root.localeCompare(b.root));
  const selected=candidates[0];if(selected){
   if(ensureAvailable)await ensureAvailable(join(selected.root,'project'));
   if(acquireLegacyLease){await acquireLegacyLease(selected.root);acquiredLegacy=true;}
   const active=await json(join(selected.root,'active-process.json'));if(active?.active)throw Error('Legacy census has active or unresolved ownership');
   intent={source:await realpath(join(selected.root,'project')),alias:join(selected.root,'project'),destination:join(root,'project'),legacy_output:selected.root,links:await captureDirectoryLinks(join(selected.root,'project')),
    legacy_plan_sha256:createHash('sha256').update(await readFile(join(selected.root,'plan.json'))).digest('hex')};await atomic(intentPath,intent);
  }else if(unfinished.length)throw Error('Existing unfinished census must resume its exact saved plan before another Program is imported: '+unfinished[0]+'/plan.json');
 }
 if(intent){
  if(intent.destination!==join(root,'project')||!inside(resolve(intent.source),await realpath(runtimeRoot)))throw Error('Census adoption intent differs');
  let exists=false;try{await lstat(intent.destination);exists=true;}catch(e){if(e.code!=='ENOENT')throw e;}
  if(!exists){if(!acquiredLegacy){if(ensureAvailable)await ensureAvailable(intent.source);if(acquireLegacyLease)await acquireLegacyLease(intent.legacy_output);}await rename(intent.source,intent.destination);}
  await rebaseMovedLinks(intent.destination,intent.source,intent.links);
  for(const alias of new Set([intent.source,intent.alias??intent.source])){const runtime=await realpath(runtimeRoot),parent=await realpath(dirname(alias));if(!inside(resolve(alias),runtime)||(parent!==runtime&&!inside(parent,runtime)))throw Error('Census adoption alias escapes runtime');await publishDirectoryAlias(alias,intent.destination,intent.source);}
 }else await mkdir(join(root,'project'),{recursive:true,mode:0o700});
 const workspace={format:PROGRAM_FORMAT,workspace_id:key,identity,legacy_plan_sha256:intent?.legacy_plan_sha256??null,legacy_output:intent?.legacy_output??null};
 await atomic(workspacePath,workspace);return {root,key,workspace};
}

export async function writeProgramReceipt(path,value,runtimeRoot){
 if(!path)return;const absolute=resolve(path),parent=await realpath(dirname(absolute)),runtime=await realpath(runtimeRoot);
 if(!inside(absolute,runtime)||(parent!==runtime&&!inside(parent,runtime)))throw Error('Program receipt escapes runtime');
 try{if((await lstat(absolute)).isSymbolicLink())throw Error('Program receipt is redirected');}catch(e){if(e.code!=='ENOENT')throw e;}
 await atomic(absolute,value);
}

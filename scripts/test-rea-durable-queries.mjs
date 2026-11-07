// Noncompiling tests: no target analysis or application launch.
import test from 'node:test';
import assert from 'node:assert/strict';
import {mkdir,rm,mkdtemp,stat,writeFile,readFile,readdir,symlink} from 'node:fs/promises';
import {resolve,relative,dirname} from 'node:path';
import {spawn} from 'node:child_process';
import {acquireLease,releaseLease,canonical,digest,processArguments,atomicJson,durableQueryParameters,launchDurableGhidra,fileHash,readJournal,LOADER_OPTIONS,archiveCompletedRawProgram} from './rea-durable-queries.mjs';
import {queryWorkspaceKey,preparationDigest,selectQueryWorkspace,selectCensusWorkspace,sharedJavaToolOptions,acquireNativeSlot,validateNativePermit} from './shared-ghidra-programs.mjs';
import {spawnOwnedProviderProcess} from '../node_modules/rea-agents/dist/process/ProviderProcess.js';
import {cleanupOwnedProcessGroup} from '../node_modules/rea-agents/dist/process/ProcessOwnership.js';
const runtime=resolve('runtime/tests/durable-queries');await mkdir(runtime,{recursive:true});
const pause=ms=>new Promise(done=>setTimeout(done,ms));
test('busy leases wait, preserve the inode, and cancellation removes the waiter',async()=>{
 const dir=await mkdtemp(resolve(runtime,'waiting-'));let first,second;
 try{
  const path=resolve(dir,'program.lock');first=await acquireLease(path);const inode=(await stat(path)).ino;
  const cancel=new AbortController();const rejected=assert.rejects(acquireLease(path,cancel.signal,{wait:true}),/cancel fixture/);
  await pause(80);cancel.abort(Error('cancel fixture'));await rejected;
  let admitted=false;const waiting=acquireLease(path,undefined,{wait:true}).then(value=>{admitted=true;return value;});
  await pause(80);assert.equal(admitted,false);await releaseLease(first);first=null;second=await waiting;assert.equal((await stat(path)).ino,inode);
 }finally{await releaseLease(first);await releaseLease(second);await rm(dir,{recursive:true,force:true});}
});
test('native queue bounds independent workers, admits exclusive work and survives a crashed custodian',async()=>{
 const dir=await mkdtemp(resolve(runtime,'capacity-'));await mkdir(resolve(dir,'programs'));let a,b,heavy,late;
 try{
  const store=resolve(dir,'programs');a=await acquireNativeSlot(store);b=await acquireNativeSlot(store);
  let heavyReady=false,lateReady=false;
  const hp=acquireNativeSlot(store,undefined,{exclusive:true}).then(value=>{heavyReady=true;return value;});await pause(80);
  const lp=acquireNativeSlot(store).then(value=>{lateReady=true;return value;});await pause(80);
  assert.equal(heavyReady,false);assert.equal(lateReady,false);await releaseLease(a);a=null;await pause(80);assert.equal(heavyReady,false);
  await releaseLease(b);b=null;heavy=await hp;assert.equal(lateReady,false);await releaseLease(heavy);heavy=null;late=await lp;
  late.kill('SIGKILL');await new Promise(done=>late.once('exit',done));late=null;
  a=await acquireNativeSlot(store);b=await acquireNativeSlot(store);assert.equal((await readdir(resolve(dir,'scheduler'))).filter(x=>x.endsWith('.ticket')).length,2);
 }finally{for(const held of [a,b,heavy,late])await releaseLease(held);await rm(dir,{recursive:true,force:true});}
});
test('cancelled capacity wait releases its ticket without consuming a worker',async()=>{
 const dir=await mkdtemp(resolve(runtime,'capacity-cancel-'));await mkdir(resolve(dir,'programs'));let a,b,c;
 try{
  const store=resolve(dir,'programs');a=await acquireNativeSlot(store);b=await acquireNativeSlot(store);
  const abort=new AbortController(),pending=assert.rejects(acquireNativeSlot(store,abort.signal),/capacity cancelled/);
  await pause(80);abort.abort(Error('capacity cancelled'));await pending;
  await releaseLease(a);a=null;c=await acquireNativeSlot(store);assert(c);
 }finally{for(const held of [a,b,c])await releaseLease(held);await rm(dir,{recursive:true,force:true});}
});
test('the batch capacity CLI exits on EOF while both worker slots remain occupied',async()=>{
 const dir=await mkdtemp(resolve(runtime,'cli-cancel-'));await mkdir(resolve(dir,'programs'));let a,b,helper;
 try{
  const store=resolve(dir,'programs');a=await acquireNativeSlot(store);b=await acquireNativeSlot(store);
  helper=spawn(process.execPath,[resolve('scripts/shared-ghidra-programs.mjs'),'--native-lease',store,resolve(dir,'pending-process.json'),'fixture','shared'],{stdio:['pipe','pipe','pipe']});
  let output='';helper.stdout.on('data',data=>{output+=data;});helper.stderr.on('data',()=>{});
  const exited=new Promise(done=>helper.once('exit',done));await pause(80);helper.stdin.end();
  let timer;try{assert.equal(await Promise.race([exited,new Promise((_,reject)=>{timer=setTimeout(()=>reject(Error('queued CLI ignored EOF')),2000);})]),0);}finally{clearTimeout(timer);}
  assert.equal(output,'');assert.equal((await readdir(resolve(dir,'scheduler'))).filter(x=>x.endsWith('.ticket')).length,2);
 }finally{for(const held of [a,b])await releaseLease(held);if(helper&&helper.exitCode===null&&helper.signalCode===null){helper.stdin.end();await new Promise(done=>helper.once('exit',done));}await rm(dir,{recursive:true,force:true});}
});
test('permits bind target/mode and reject a released custodian',async()=>{
 const dir=await mkdtemp(resolve(runtime,'permit-'));await mkdir(resolve(dir,'programs'));let slot;
 try{
  slot=await acquireNativeSlot(resolve(dir,'programs'),undefined,{target:'fixture'});const path=slot.ticketPath;
  await validateNativePermit(path,'fixture');await assert.rejects(validateNativePermit(path,'other'),/identity differs/);
  await assert.rejects(validateNativePermit(path,'fixture',true),/identity differs/);
  await releaseLease(slot);slot=null;await assert.rejects(validateNativePermit(path,'fixture'),/No such file|live custodian/);
 }finally{await releaseLease(slot);await rm(dir,{recursive:true,force:true});}
});
test('a crashed capacity custodian is reaped with its owned fixture before admitting replacements',async()=>{
 const dir=await mkdtemp(resolve(runtime,'reaper-'));await mkdir(resolve(dir,'programs'));let slot,owned,a,b;
 try{
  const store=resolve(dir,'programs');slot=await acquireNativeSlot(store);
  owned=await spawnOwnedProviderProcess({command:process.execPath,arguments:['-e','setInterval(()=>{},1000)'],expectedCommand:process.execPath,runId:'native-queue-fixture',platform:process.platform,cwd:dir,env:process.env,hostEnvironment:{}});
  const ownershipPath=resolve(dir,'active-process.json');await atomicJson(ownershipPath,{active:true,ownership:owned.ownership});
  await atomicJson(slot.processReceipt,{ownership:owned.ownership,ownership_path:ownershipPath});
  slot.kill('SIGKILL');await new Promise(done=>slot.once('exit',done));slot=null;
  a=await acquireNativeSlot(store);b=await acquireNativeSlot(store);
  assert.equal((await readJournal(ownershipPath)).active,false);assert(owned.process.exitCode!==null||owned.process.signalCode!==null);
 }finally{for(const held of [slot,a,b])await releaseLease(held);if(owned)await cleanupOwnedProcessGroup(owned.ownership);await rm(dir,{recursive:true,force:true});}
});
test('operation identities are independent of JSON object key order',()=>{assert.equal(digest({b:2,a:{z:0,x:1}}),digest({a:{x:1,z:0},b:2}));assert.notEqual(digest({a:1}),digest({a:2}));});
test('saved Program process args keep declared preparation and omit disposable flags',()=>{
 const original=['/ephemeral','rea-project','-import','/input','-readOnly','-deleteProject','-log','/log','-scriptlog','/scriptlog','-scriptPath','/bridge','-preScript','/bridge/Seeds.java','/seeds','-postScript','/bridge/Fix.java','-postScript','/bridge/Bridge.java','/descriptor'];
 const fresh=processArguments(original,{projectRoot:'/persistent',programName:'input',preparePath:'/scripts/Prepare.java',manifestPath:'/manifest',ready:false});
 assert.deepEqual(fresh.slice(0,4),['/persistent','rea-project','-process','input']);assert(!fresh.includes('-readOnly'));assert(!fresh.includes('-deleteProject'));assert(!fresh.includes('-import'));
 assert(fresh.indexOf('init')<fresh.indexOf('/bridge/Seeds.java'));assert(fresh.indexOf('checkpoint')>fresh.indexOf('/seeds'));assert(fresh.indexOf('checkpoint')<fresh.indexOf('/bridge/Fix.java'));
 const ready=processArguments(original,{projectRoot:'/persistent',programName:'input',preparePath:'/scripts/Prepare.java',manifestPath:'/manifest',ready:true});assert(!ready.includes('/bridge/Seeds.java'));assert(!ready.includes('/bridge/Fix.java'));assert(ready.includes('/bridge/Bridge.java'));
});
test('kernel lease rejects simultaneous writers and releases without deleting its lock inode',async()=>{
 const dir=await mkdtemp(resolve(runtime,'lease-')),path=resolve(dir,'program.lock');let first,second;
 try{first=await acquireLease(path);await assert.rejects(acquireLease(path),error=>error.code==='GHIDRA_LEASE_BUSY'&&error.leasePath===path);const before=await stat(path);await releaseLease(first);first=null;second=await acquireLease(path);assert.equal((await stat(path)).ino,before.ino);}
 finally{await releaseLease(first);await releaseLease(second);await rm(dir,{recursive:true,force:true});}
});
test('atomic journals publish a whole JSON document',async()=>{
 const dir=await mkdtemp(resolve(runtime,'journal-'));try{await atomicJson(resolve(dir,'state.json'),{stage:'complete',nested:{a:1}});const {readFile,readdir}=await import('node:fs/promises');assert.equal(canonical(JSON.parse(await readFile(resolve(dir,'state.json'),'utf8'))),canonical({nested:{a:1},stage:'complete'}));assert.deepEqual(await readdir(dir),['state.json']);}finally{await rm(dir,{recursive:true,force:true});}
});
test('lock and journal leaves refuse symlink redirection without touching the destination',async()=>{
 const dir=await mkdtemp(resolve(runtime,'symlink-'));try{const target=resolve(dir,'protected.json');await writeFile(target,'{"keep":true}');await symlink(target,resolve(dir,'program.lock'));await symlink(target,resolve(dir,'profile.json'));await assert.rejects(acquireLease(resolve(dir,'program.lock')),/Too many levels|Symbolic link|symlink/i);await assert.rejects(readJournal(resolve(dir,'profile.json')),/ELOOP|symbolic/i);assert.equal(await readFile(target,'utf8'),'{"keep":true}');}finally{await rm(dir,{recursive:true,force:true});}
});
test('static-only and authoring modes produce distinct committed profiles',async()=>{
 const before=process.env.REA_DURABLE_QUERY_ROOT,mode=process.env.REA_DURABLE_STATIC_QUERIES;
 try{process.env.REA_DURABLE_QUERY_ROOT=runtime;process.env.REA_DURABLE_STATIC_QUERIES='1';const staticProfile=await durableQueryParameters({format:'raw-binary'},{platform:process.platform});process.env.REA_DURABLE_STATIC_QUERIES='0';const authoringProfile=await durableQueryParameters({format:'raw-binary'},{platform:process.platform});assert.equal(staticProfile.static_queries_only,true);assert.equal(authoringProfile.static_queries_only,false);assert.notEqual(digest(staticProfile),digest(authoringProfile));}
 finally{if(before===undefined)delete process.env.REA_DURABLE_QUERY_ROOT;else process.env.REA_DURABLE_QUERY_ROOT=before;if(mode===undefined)delete process.env.REA_DURABLE_STATIC_QUERIES;else process.env.REA_DURABLE_STATIC_QUERIES=mode;}
});
test('persistence stays inert unless explicitly admitted and never changes census semantics',async()=>{
 const before=process.env.REA_DURABLE_QUERY_ROOT,census=process.env.REA_NATIVE_CENSUS_PLAN;
 try{delete process.env.REA_DURABLE_QUERY_ROOT;assert.equal(await durableQueryParameters({format:'pe'},{}),null);process.env.REA_DURABLE_QUERY_ROOT=runtime;process.env.REA_NATIVE_CENSUS_PLAN='/plan';assert.equal(await durableQueryParameters({format:'pe'},{}),null);delete process.env.REA_NATIVE_CENSUS_PLAN;assert.equal(await durableQueryParameters({format:'elf'},{}),null);}
 finally{if(before===undefined)delete process.env.REA_DURABLE_QUERY_ROOT;else process.env.REA_DURABLE_QUERY_ROOT=before;if(census===undefined)delete process.env.REA_NATIVE_CENSUS_PLAN;else process.env.REA_NATIVE_CENSUS_PLAN=census;}
});
test('inspected Java launcher receives every required callback and retains support diagnostics',async()=>{
 const dir=await mkdtemp(resolve(runtime,'launch-api-')),before=process.env.REA_DURABLE_QUERY_ROOT,sharedBefore=process.env.REA_SHARED_PROGRAM_ROOT,receiptBefore=process.env.REA_SHARED_PROGRAM_RECEIPT;
 try{
  process.env.REA_DURABLE_QUERY_ROOT=resolve(dir,'saved');process.env.REA_SHARED_PROGRAM_ROOT=resolve(dir,'shared');process.env.REA_SHARED_PROGRAM_RECEIPT=resolve(dir,'current-program.json');const source=resolve(dir,'fixture.bin'),sessionRoot=resolve(dir,'session');await writeFile(source,Buffer.from([0xc3]));await mkdir(sessionRoot);
  const profile=await durableQueryParameters({format:'raw-binary'},{platform:process.platform}),sha=await fileHash(source);let invoked=false;
  const outcome=await launchDurableGhidra({durableQueryProfile:profile,rawBinary:{languageId:'x86:LE:64:default',compilerSpecId:'gcc',baseAddr:'0x1000'},environment:process.env,analyzeHeadlessPath:'/unused/support/analyzeHeadless',bridgeScriptPath:resolve('node_modules/rea-agents/bridge/ghidra/ReaGhidraBridge.java'),javaLaunch:async options=>{
   invoked=true;assert.equal(typeof options.onStderr,'function');assert(Array.isArray(options.arguments));assert(options.environment);assert(options.homeRoot.startsWith(dir));assert(options.tempRoot.startsWith(dir));options.onStderr('-vmargs','fixture diagnostic');throw Error('launcher contract checked without a JVM');
  }},{targetPath:source,targetSha256:sha,profileDigest:'a'.repeat(64),providerVersion:'fixture',runtimeRoot:sessionRoot,transport:'unix-socket',endpointPath:resolve(sessionRoot,'bridge.sock'),token:'fixture-token',runId:'fixture-run'});
  assert(invoked);assert.equal(outcome.ok,false);assert.match(outcome.error.message,/launcher contract checked/);
  const pointer=JSON.parse(await readFile(resolve(dir,'current-program.json'),'utf8'));assert.equal(pointer.target_sha256,sha);assert(pointer.root.startsWith(resolve(dir,'shared')));
  const attempts=resolve(pointer.root,'attempts'),names=await readdir(attempts);assert.match(await readFile(resolve(attempts,names[0],'import-launch-support.log'),'utf8'),/fixture diagnostic/);
 }finally{for(const [key,value] of [['REA_DURABLE_QUERY_ROOT',before],['REA_SHARED_PROGRAM_ROOT',sharedBefore],['REA_SHARED_PROGRAM_RECEIPT',receiptBefore]]){if(value===undefined)delete process.env[key];else process.env[key]=value;}await rm(dir,{recursive:true,force:true});}
});
test('compatible tasks and new seed sets use one Program but invalidate preparation receipts',()=>{
 const base={target_sha256:'1'.repeat(64),provider_version:'12.1',static_queries_only:true,seeds:{path:'/task-a/seeds.tsv',sha256:'a'.repeat(64)},disabled_analyzers:['B','A']};
 const another={...base,profile_digest:'different',tooling:{driver:'changed'},seeds:{path:'/task-b/seeds.tsv',sha256:'b'.repeat(64)},disabled_analyzers:['A','B']};
 assert.equal(queryWorkspaceKey(base),queryWorkspaceKey(another));assert.notEqual(preparationDigest(base),preparationDigest(another));
 assert.equal(preparationDigest(base),preparationDigest({...base,seeds:{...base.seeds,path:'/same-bytes-elsewhere'}}));
 const changedSeeder={...base,preparation_tools:{ApplySeeds:'new-semantic-source-hash'}};assert.equal(queryWorkspaceKey(base),queryWorkspaceKey(changedSeeder));assert.notEqual(preparationDigest(base),preparationDigest(changedSeeder));
 for(const changed of [{...base,target_sha256:'2'.repeat(64)},{...base,provider_version:'13'},{...base,static_queries_only:false},{...base,disabled_analyzers:[]}])assert.notEqual(queryWorkspaceKey(base),queryWorkspaceKey(changed));
 assert.notEqual(queryWorkspaceKey(base),queryWorkspaceKey(base,'isolated-boundary-experiment'));
});
test('a ready PE with changed preparation cannot silently start whole-image analysis',async()=>{
 const dir=await mkdtemp(resolve(runtime,'pe-guard-')),saved={};for(const key of ['REA_DURABLE_QUERY_ROOT','REA_SHARED_PROGRAM_ROOT','REA_GHIDRA_ALLOW_NEW_PE_ANALYSIS'])saved[key]=process.env[key];
 try{
  process.env.REA_DURABLE_QUERY_ROOT=resolve(dir,'legacy');process.env.REA_SHARED_PROGRAM_ROOT=resolve(dir,'programs');delete process.env.REA_GHIDRA_ALLOW_NEW_PE_ANALYSIS;
  const target=resolve(dir,'fixture.exe'),sessionRoot=resolve(dir,'session');await writeFile(target,'MZfixture, never analyzed');await mkdir(sessionRoot);
  const sha=await fileHash(target),profile=await durableQueryParameters({format:'pe'},{platform:process.platform});
  const commitment={target_sha256:sha,profile_digest:'a'.repeat(64),provider_version:'fixture',static_queries_only:profile.static_queries_only,loader_options:LOADER_OPTIONS};
  const selected=await selectQueryWorkspace({workspaceRoot:process.env.REA_SHARED_PROGRAM_ROOT,legacyRoot:process.env.REA_DURABLE_QUERY_ROOT,commitment,runtimeRoot:resolve('runtime')});
  await mkdir(resolve(selected.root,'project/rea-project.rep'),{recursive:true});await writeFile(resolve(selected.root,'project/rea-project.gpr'),'fixture container');
  await atomicJson(resolve(selected.root,'bootstrap.json'),{target_sha256:sha,program_name:'fixture.exe'});
  await atomicJson(resolve(selected.root,'ready.json'),{ready:true,preparation_sha256:'stale-preparation'});let invoked=false;
  const result=await launchDurableGhidra({durableQueryProfile:profile,environment:process.env,analyzeHeadlessPath:'/unused/support/analyzeHeadless',bridgeScriptPath:resolve('node_modules/rea-agents/bridge/ghidra/ReaGhidraBridge.java'),javaLaunch:async()=>{invoked=true;throw Error('must not launch');}},
   {targetPath:target,targetSha256:sha,profileDigest:commitment.profile_digest,providerVersion:'fixture',runtimeRoot:sessionRoot,transport:'unix-socket',endpointPath:resolve(sessionRoot,'bridge.sock'),token:'fixture',runId:'fixture-pe-guard'});
  assert.equal(invoked,false);assert.equal(result.ok,false);assert.match(result.error.message,/allow_full_image_analysis/);
 }finally{for(const [key,value]of Object.entries(saved)){if(value===undefined)delete process.env[key];else process.env[key]=value;}await rm(dir,{recursive:true,force:true});}
});
test('legacy adoption moves bytes once, preserves aliases and unfinished state, then reuses the same root',async()=>{
 const dir=await mkdtemp(resolve(runtime,'adopt-'));try{
  const legacy=resolve(dir,'legacy'),store=resolve(dir,'programs'),target='1'.repeat(64),profile='a'.repeat(64),old=resolve(legacy,target,profile),project=resolve(old,'project');
  const commitment={target_sha256:target,profile_digest:profile,provider_version:'fixture',static_queries_only:true,seeds:{sha256:'b'.repeat(64),entries:{function:2}},loader_options:[]};
  await mkdir(resolve(project,'rea-project.rep'),{recursive:true});await writeFile(resolve(project,'rea-project.rep','unfinished.db'),'unique saved checkpoint');await atomicJson(resolve(old,'profile.json'),commitment);await atomicJson(resolve(old,'ready.json'),{ready:false,revision:7});
  const selected=await selectQueryWorkspace({workspaceRoot:store,legacyRoot:legacy,commitment,runtimeRoot:dir});
  assert.equal(selected.workspace.legacy_profile_digest,profile);assert.equal((await stat(old)).ino,(await stat(selected.root)).ino);assert.equal(await readFile(resolve(selected.root,'project/rea-project.rep/unfinished.db'),'utf8'),'unique saved checkpoint');
  assert.deepEqual(JSON.parse(await readFile(resolve(old,'ready.json'),'utf8')),{ready:false,revision:7});
  const next=await selectQueryWorkspace({workspaceRoot:store,legacyRoot:legacy,commitment:{...commitment,profile_digest:'c'.repeat(64),seeds:{sha256:'d'.repeat(64)}},runtimeRoot:dir});assert.equal(next.root,selected.root);
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('unresolved active Program ownership prevents migration rather than deleting a database',async()=>{
 const dir=await mkdtemp(resolve(runtime,'owned-'));try{
  const commitment={target_sha256:'1'.repeat(64),profile_digest:'a'.repeat(64),provider_version:'fixture',static_queries_only:true};
  const old=resolve(dir,'legacy',commitment.target_sha256,commitment.profile_digest);await mkdir(resolve(old,'project/rea-project.rep'),{recursive:true});await atomicJson(resolve(old,'profile.json'),commitment);await atomicJson(resolve(old,'active-process.json'),{active:true});
  await assert.rejects(selectQueryWorkspace({workspaceRoot:resolve(dir,'programs'),legacyRoot:resolve(dir,'legacy'),commitment,runtimeRoot:dir}),/active or unresolved/);assert((await stat(resolve(old,'project/rea-project.rep'))).isDirectory());
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('a content-addressed raw input reopens the saved original Program name',async()=>{
 const dir=await mkdtemp(resolve(runtime,'cas-name-')),saved={};for(const key of ['REA_DURABLE_QUERY_ROOT','REA_SHARED_PROGRAM_ROOT'])saved[key]=process.env[key];
 try{
  process.env.REA_DURABLE_QUERY_ROOT=resolve(dir,'legacy');process.env.REA_SHARED_PROGRAM_ROOT=resolve(dir,'programs');
  const source=resolve(dir,'0'.repeat(64)),sessionRoot=resolve(dir,'session');await writeFile(source,Buffer.from([0xc3]));await mkdir(sessionRoot);
  const sha=await fileHash(source),profileDigest='a'.repeat(64),raw={languageId:'x86:LE:64:default',compilerSpecId:'gcc',baseAddr:'0x1000'},profile=await durableQueryParameters({format:'raw-binary'},{platform:process.platform});
  const old=resolve(process.env.REA_DURABLE_QUERY_ROOT,sha,profileDigest);await mkdir(resolve(old,'project/rea-project.rep'),{recursive:true});await writeFile(resolve(old,'project/rea-project.gpr'),'fixture Program container, never opened');
  await atomicJson(resolve(old,'profile.json'),{target_sha256:sha,profile_digest:profileDigest,provider_version:'fixture',static_queries_only:profile.static_queries_only,raw_binary:raw,loader_options:LOADER_OPTIONS});
  await atomicJson(resolve(old,'bootstrap.json'),{target_sha256:sha,profile_digest:profileDigest,program_name:'original-input.bin'});let observed=false;
  const result=await launchDurableGhidra({durableQueryProfile:profile,rawBinary:raw,environment:process.env,analyzeHeadlessPath:'/unused/support/analyzeHeadless',bridgeScriptPath:resolve('node_modules/rea-agents/bridge/ghidra/ReaGhidraBridge.java'),javaLaunch:async options=>{
   observed=true;assert.equal(options.arguments[options.arguments.indexOf('-process')+1],'original-input.bin');assert(!options.arguments.includes('-import'));throw Error('saved raw Program name verified without JVM');
  }},{targetPath:source,targetSha256:sha,profileDigest,providerVersion:'fixture',runtimeRoot:sessionRoot,transport:'unix-socket',endpointPath:resolve(sessionRoot,'bridge.sock'),token:'fixture',runId:'fixture-cas-name'});
  assert(observed);assert.match(result.error.message,/saved raw Program name verified/);
 }finally{for(const [key,value]of Object.entries(saved)){if(value===undefined)delete process.env[key];else process.env[key]=value;}await rm(dir,{recursive:true,force:true});}
});
test('census adoption shares completed decoded state and keeps its frozen plan/output aliases',async()=>{
 const dir=await mkdtemp(resolve(runtime,'census-adopt-'));try{
  const target='1'.repeat(64),legacy=resolve(dir,'coverage'),old=resolve(legacy,target,'ghidra','completed'),project=resolve(old,'project');await mkdir(resolve(project,'NativeCensus.rep'),{recursive:true});await writeFile(resolve(project,'NativeCensus.rep/state.db'),'decoded state');
  const plan={target_sha256:target,seed_count:10,disabled_analyzers:['Stack'],persistence:{}};await atomicJson(resolve(old,'plan.json'),plan);await atomicJson(resolve(old,'progress.json'),{stage:'completed',ghidra_version:'fixture'});
  const selected=await selectCensusWorkspace({workspaceRoot:resolve(dir,'programs'),legacyRoot:legacy,plan,providerVersion:'fixture',runtimeRoot:dir});
  assert.equal(await readFile(resolve(selected.root,'project/NativeCensus.rep/state.db'),'utf8'),'decoded state');assert((await stat(project)).isDirectory());
  assert.equal(await fileHash(resolve(old,'plan.json')),selected.workspace.legacy_plan_sha256);
  const next=await selectCensusWorkspace({workspaceRoot:resolve(dir,'programs'),legacyRoot:legacy,plan:{...plan,seed_count:20},providerVersion:'fixture',runtimeRoot:dir});assert.equal(next.root,selected.root);
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('an unfinished compatible census prevents importing a competing Program',async()=>{
 const dir=await mkdtemp(resolve(runtime,'census-pending-'));try{
  const target='1'.repeat(64),legacy=resolve(dir,'coverage'),old=resolve(legacy,target,'ghidra','unfinished'),plan={target_sha256:target,seed_count:2,disabled_analyzers:[]};await mkdir(resolve(old,'project/NativeCensus.rep'),{recursive:true});await atomicJson(resolve(old,'plan.json'),plan);await atomicJson(resolve(old,'progress.json'),{stage:'disassembly',ghidra_version:'fixture',decode_cursor:1});
  await assert.rejects(selectCensusWorkspace({workspaceRoot:resolve(dir,'programs'),legacyRoot:legacy,plan,providerVersion:'fixture',runtimeRoot:dir}),/unfinished census must resume/);
  assert((await stat(resolve(old,'project/NativeCensus.rep'))).isDirectory());
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('adopting an already relocated Program moves its physical directory and preserves both aliases',async()=>{
 const dir=await mkdtemp(resolve(runtime,'relocated-'));try{
  const commitment={target_sha256:'1'.repeat(64),profile_digest:'a'.repeat(64),provider_version:'fixture',static_queries_only:true};
  const physical=resolve(dir,'retained','original'),logical=resolve(dir,'legacy',commitment.target_sha256,commitment.profile_digest);await mkdir(resolve(physical,'project/rea-project.rep'),{recursive:true});await atomicJson(resolve(physical,'profile.json'),commitment);await mkdir(resolve(logical,'..'),{recursive:true});await symlink(physical,logical,'dir');
  const selected=await selectQueryWorkspace({workspaceRoot:resolve(dir,'programs'),legacyRoot:resolve(dir,'legacy'),commitment,runtimeRoot:dir});
  assert.equal((await stat(logical)).ino,(await stat(selected.root)).ino);assert.equal((await stat(physical)).ino,(await stat(selected.root)).ino);
  assert((await stat(resolve(selected.root,'project/rea-project.rep'))).isDirectory());
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('moving a Program rebases CAS aliases without changing bytes at old or new paths',async()=>{
 const dir=await mkdtemp(resolve(runtime,'cas-links-'));try{
  const commitment={target_sha256:'1'.repeat(64),profile_digest:'a'.repeat(64),provider_version:'fixture',static_queries_only:true};
  const old=resolve(dir,'legacy',commitment.target_sha256,commitment.profile_digest),object=resolve(dir,'objects/content');await mkdir(dirname(object),{recursive:true});await writeFile(object,'hash-verified shared native bytes');
  await mkdir(resolve(old,'project/rea-project.rep'),{recursive:true});await atomicJson(resolve(old,'profile.json'),commitment);
  const aliases=['results/result.json','instructions.tsv.gz','inputs/raw.bin'];for(const name of aliases){const path=resolve(old,name);await mkdir(dirname(path),{recursive:true});await symlink(relative(dirname(path),object),path);}
  const selected=await selectQueryWorkspace({workspaceRoot:resolve(dir,'analysis/programs'),legacyRoot:resolve(dir,'legacy'),commitment,runtimeRoot:dir});
  const hash=await fileHash(object);for(const name of aliases){assert.equal(await fileHash(resolve(old,name)),hash);assert.equal(await fileHash(resolve(selected.root,name)),hash);}
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('raw close archival is opt-out, bounded and nonfatal; full-image Programs stay hot',async()=>{
 const dir=await mkdtemp(resolve(runtime,'close-archive-'));try{
  const project=resolve(dir,'project');await mkdir(project);await atomicJson(resolve(dir,'ready.json'),{ready:true});let calls=0;
  const execute=async(command,args,options)=>{calls++;assert.equal(command,'python3');assert(args.includes('--automatic-cache'));assert.equal(options.timeout,30000);throw Error('competing Program lease; preserve hot files');};
  const result=await archiveCompletedRawProgram({rawBinary:{},programRoot:dir,projectRoot:project,environment:{},execute});assert.equal(result.archived,false);assert.equal(calls,1);assert.match((await readJournal(resolve(dir,'archive-status.json'))).error,/competing Program lease/);
  await archiveCompletedRawProgram({rawBinary:undefined,programRoot:dir,projectRoot:project,environment:{},execute});
  await archiveCompletedRawProgram({rawBinary:{},programRoot:dir,projectRoot:project,environment:{REA_ARCHIVE_RAW_PROGRAMS:'0'},execute});assert.equal(calls,1);
  const success=await archiveCompletedRawProgram({rawBinary:{},programRoot:dir,projectRoot:project,environment:{},execute:async()=>{calls++;return {stdout:'{}'};}});assert.equal(success.archived,true);
 }finally{await rm(dir,{recursive:true,force:true});}
});
test('one supported packed-database cache path is safely quoted without changing analysis identity',()=>{
 assert.equal(sharedJavaToolOptions('/project/runtime/analysis/tool-cache/packed-db-cache'),'-XX:-UsePerfData "-Dpdb.cache.dir=/project/runtime/analysis/tool-cache/packed-db-cache"');
 assert.equal(sharedJavaToolOptions('/project with spaces/runtime/tool-state/cache'),'-XX:-UsePerfData "-Dpdb.cache.dir=/project with spaces/runtime/tool-state/cache"');
 assert.equal(sharedJavaToolOptions('/project "quoted"/cache'),"-XX:-UsePerfData '-Dpdb.cache.dir=/project \"quoted\"/cache'");
 for(const path of ['relative/cache','/project\n-Dother=true',"/project'\"/cache"] )assert.throws(()=>sharedJavaToolOptions(path),/cache path/);
});

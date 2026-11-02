// Census workspace selection fixtures; no Ghidra, target or compiler execution.
import assert from 'node:assert/strict';
import {mkdtemp,mkdir,writeFile,symlink,rm} from 'node:fs/promises';
import {resolve,join,relative} from 'node:path';
import {selectCensusWorkspace} from './shared-ghidra-programs.mjs';

const tests=resolve('runtime/tests');await mkdir(tests,{recursive:true});
const fixture=await mkdtemp(join(tests,'census-workspaces-'));
try{
 const target='a'.repeat(64),output=join(fixture,'analysis/census',target,'plan');
 const legacyRoot=join(fixture,'coverage'),legacy=join(legacyRoot,target,'ghidra');
 await mkdir(output,{recursive:true});await mkdir(legacy,{recursive:true});
 const plan={target_sha256:target,output,disabled_analyzers:[],persistence:{shared_workspace:true}};
 await writeFile(join(output,'plan.json'),JSON.stringify(plan));
 await symlink(relative(legacy,output),join(legacy,'declared'),'dir');
 const options={workspaceRoot:join(fixture,'analysis/programs'),legacyRoot,plan,providerVersion:'fixture',runtimeRoot:fixture};
 const selected=await selectCensusWorkspace(options);
 assert.equal(selected.workspace.legacy_output,null,'fresh current alias must not be adopted');
 assert.equal((await selectCensusWorkspace(options)).root,selected.root,'same plan must reuse its Program');

 const other=join(legacy,'unfinished');await mkdir(other);
 await writeFile(join(other,'plan.json'),JSON.stringify({...plan,output:other,persistence:{}}));
 await assert.rejects(selectCensusWorkspace({...options,workspaceRoot:join(fixture,'other-programs')}),/Existing unfinished census must resume its exact saved plan/);

 const currentOutput=join(fixture,'analysis/census',target,'v2');await mkdir(currentOutput);
 const currentPlan={...plan,output:currentOutput,decoder_contract:'rea-incremental-census-v2'};
 await writeFile(join(currentOutput,'plan.json'),JSON.stringify(currentPlan));
 const currentOptions={...options,plan:currentPlan};
 const current=await selectCensusWorkspace(currentOptions);
 assert.notEqual(current.root,selected.root,'current decoder must not select or adopt the unfinished legacy Program');
 assert.equal(selected.workspace.identity.decoder,'rea-incremental-census-v1','absent decoder contract retains legacy identity');
 assert.equal(current.workspace.identity.decoder,'rea-incremental-census-v2');
 const moreSeeds={...currentPlan,starts_sha256:'b'.repeat(64),seed_count:99,jump_tables:{sha256:'c'.repeat(64)}};
 assert.equal((await selectCensusWorkspace({...currentOptions,plan:moreSeeds})).root,current.root,'compatible current seed and edge additions share one Program');
 assert.equal((await selectCensusWorkspace({...options,plan:{...plan,decoder_contract:'rea-incremental-census-v1'}})).root,selected.root,'explicit v1 and absent legacy mode select the same Program');
 for(const decoder_contract of [null,'','rea-incremental-census-v3'])
  await assert.rejects(selectCensusWorkspace({...currentOptions,plan:{...currentPlan,decoder_contract}}),/Unsupported census decoder contract/);
 console.log('Census workspaces: legacy identity, v2 isolation, shared seed additions and unfinished-plan guard pass');
}finally{await rm(fixture,{recursive:true,force:true});}

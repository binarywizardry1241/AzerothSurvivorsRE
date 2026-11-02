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
 console.log('Census workspaces: current receipt alias, saved reuse and unrelated unfinished-plan guard pass');
}finally{await rm(fixture,{recursive:true,force:true});}

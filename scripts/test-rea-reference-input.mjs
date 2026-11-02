// Non-compiling regression: exercise installed-reference admission on tiny local fixtures.
import {createHash} from 'node:crypto';
import {mkdtemp,mkdir,writeFile,readFile,readdir,rm,symlink} from 'node:fs/promises';
import {resolve,dirname,join} from 'node:path';
import {fileURLToPath} from 'node:url';
import assert from 'node:assert/strict';
import {createGhidraTargetSnapshot} from '../node_modules/rea-agents/dist/ghidra/GhidraTargetSnapshot.js';
import {GhidraClient} from '../node_modules/rea-agents/dist/ghidra/GhidraClient.js';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
await mkdir(join(root,'runtime/reference-input-tests'),{recursive:true});
const directory=await mkdtemp(join(root,'runtime/reference-input-tests/run-'));
const reference=join(directory,'installed.exe'),raw=join(directory,'range.bin'),config=join(directory,'reference.json');
const bytes=Buffer.from('Synthetic reference bytes; no original game data.');
const digest=createHash('sha256').update(bytes).digest('hex');
const previous=process.env.REA_REFERENCE_GAME_CONFIG;
const previousTemporary=process.env.TMPDIR;
async function verifyClientOpen(source,expected) {
 let launched=false;
 const client=new GhidraClient({targetPath:source,targetSha256:expected,providerVersion:'12.1.4',profileDigest:'0'.repeat(64),startupTimeoutMs:5000,
  launcher:{launch:async session=>{
   launched=true;assert.equal(session.targetPath,source);assert.equal(session.targetSha256,expected);
   assert.equal((await readdir(session.runtimeRoot)).filter(name=>/^target-.*\.(exe|bin)$/.test(name)).length,0);
   throw Error('Intentional stop after verifying actual client launch admission');
  }}});
 try {assert.equal((await client.start()).ok,false);assert.equal(launched,true);} finally {await client.close();}
}
try {
 await writeFile(reference,bytes);await writeFile(raw,bytes);
 await writeFile(config,JSON.stringify({exe:reference}));process.env.REA_REFERENCE_GAME_CONFIG=config;process.env.TMPDIR=directory;
 const inPlace=join(directory,'in-place');await mkdir(inPlace);
 assert.equal((await createGhidraTargetSnapshot(reference,inPlace,digest)).path,reference);
 assert.deepEqual(await readdir(inPlace),[]);
 await verifyClientOpen(reference,digest);
 assert.deepEqual(await readFile(reference),bytes);
 await assert.rejects(createGhidraTargetSnapshot(reference,inPlace,'0'.repeat(64)),/digest mismatch/);
 assert.deepEqual(await readdir(inPlace),[]);
 const alias=join(directory,'reference-alias.exe');await symlink(reference,alias);
 assert.equal((await createGhidraTargetSnapshot(alias,inPlace,digest)).path,alias);
 assert.deepEqual(await readdir(inPlace),[]);
 const local=join(directory,'raw-snapshot');await mkdir(local);
 const observed=await createGhidraTargetSnapshot(raw,local,digest);
 assert.ok(observed.path.startsWith(local+'/target-'));assert.deepEqual(await readFile(observed.path),bytes);
 await writeFile(config,'{}');await assert.rejects(createGhidraTargetSnapshot(reference,inPlace,digest));
 assert.deepEqual(await readdir(inPlace),[]);
 if(process.argv[2]==='--installed') {
  const expected=process.argv[3];assert.match(expected??'',/^[a-f0-9]{64}$/);
  const installedConfig=join(root,'.codex/reference-game.json');const installed=JSON.parse(await readFile(installedConfig,'utf8'));
  process.env.REA_REFERENCE_GAME_CONFIG=installedConfig;
  await verifyClientOpen(installed.exe,expected);
  console.log('Actual configured installed input: client passed its original path and SHA directly to the launcher, with no staged EXE.');
 }
 console.log('Installed reference: no copy, exact hash, read-only bytes, path aliases, raw-input isolation and invalid-config rejection passed.');
} finally {
 if(previous===undefined)delete process.env.REA_REFERENCE_GAME_CONFIG;else process.env.REA_REFERENCE_GAME_CONFIG=previous;
 if(previousTemporary===undefined)delete process.env.TMPDIR;else process.env.TMPDIR=previousTemporary;
 await rm(directory,{recursive:true,force:true});
}

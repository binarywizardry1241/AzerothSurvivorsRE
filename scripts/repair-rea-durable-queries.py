#!/usr/bin/env python3
"""Guarded durable individual-query support for the pinned local REA package.

No effect without REA_DURABLE_QUERY_ROOT. Unknown dependency bytes fail closed.
The same repair covers the standalone provider and bundled CLI/MCP providers.
"""
import argparse
import hashlib
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
PACKAGE=ROOT/'node_modules/rea-agents'
BEGIN='// BEGIN PROJECT DURABLE QUERY LAUNCH'
END='// END PROJECT DURABLE QUERY LAUNCH'
PROFILE_BEGIN='// BEGIN PROJECT DURABLE QUERY PROFILE'
PROFILE_END='// END PROJECT DURABLE QUERY PROFILE'
BUNDLES=('dist/cli-runtime/binary-BVOr2mgE.js','dist/mcp/main-kBXHZ8S5.js')
HASHES={
 'dist/ghidra/GhidraLauncher.js':'739676ebc64bd7b23ed1bc4a9395d596efe7bf8080eb67af1ff3e00d86609a67',
 'dist/ghidra/GhidraAnalysisProfile.js':'b263b099680fb6c4c9543b2220f36a9e03180ead6a702a54834c1ee84deb30ec',
 'dist/ghidra/GhidraSessionValues.js':'92b6a677ba49440a20c772a06fdefa4b1802f76832ba84e7f14625fd9204fcd1',
 'dist/ghidra/GhidraProviderClient.js':'54ab59ce21c3f2329d5e0fbeb3b0a8117527a68b2d9776cc2c24635ec1373184',
 'bridge/ghidra/ReaGhidraBridge.java':'db16aed4d16ab94da883843281ef7a8a33a244cd8379bd4013e8dee479c0a105',
}
REGION_HASHES={
 ('dist/cli-runtime/binary-BVOr2mgE.js','GhidraLauncher'):'5c3e52b434db094ef31b10fd68a61004fe0d1f036521a52b5453ff54261ccb16',
 ('dist/mcp/main-kBXHZ8S5.js','GhidraLauncher'):'3d597d218d4d04db0a477e69bc15c485e9ef309a804529c66b9a67bfbaae0ca2',
 ('profile','GhidraAnalysisProfile'):'3a1d45bed586d6886cb4c6b2750d64d88139a6743a1321d37806f37811667298',
 ('session','GhidraSessionValues'):'bdcc9d9f002de7ff45739c65ffc12fe0cd926c45c67060e2a616339365f8096a',
 ('provider','GhidraProviderClient'):'018408478726e7af6aef7a1db4f20b85f875ca30727bce6498e5e9a421f8c96b',
}
PREVIOUS_REPAIRED={'bridge/ghidra/ReaGhidraBridge.java':{'a3b2746a31ec57ed7b77adb3413018938d14a010062083fc90fcef0c2d18074a','e8b95e85be8fc0ec87de610831c31e451d99089dae2898b8ff68d20e51d11cf6','9655cefb73c8f83915f6336ea6eee0cf5497b4236e57d8b42c2e76f3117b6681'}}
def sha(source):return hashlib.sha256(source.encode()).hexdigest()
def once(source,old,new):
    if source.count(old)!=1:raise ValueError('Pinned source anchor differs: '+old[:80])
    return source.replace(old,new)
def block(source,begin,end):
    if begin not in source:
        if end in source:raise ValueError('Partial durable patch')
        return source
    if source.count(begin)!=1 or source.count(end)!=1:raise ValueError('Duplicate durable patch')
    start=source.rfind('\n',0,source.index(begin))+1
    finish=source.index('\n',source.index(end))+1
    return source[:start]+source[finish:]
def strip_launcher(source):return block(source,BEGIN,END)
def add_launcher(source):
    lines=source.splitlines(keepends=True)
    positions=[i for i,line in enumerate(lines) if 'async launch(session, options = {}) {' in line]
    if len(positions)!=1:raise ValueError('Launcher entry differs')
    i=positions[0];indent=lines[i][:len(lines[i])-len(lines[i].lstrip())]+('    ' if lines[i].startswith(' ') else '\t')
    body=[BEGIN,'if (process.env.REA_DURABLE_QUERY_ROOT && !process.env.REA_NATIVE_CENSUS_PLAN) {',
     '    const { pathToFileURL } = await import("node:url");',
     '    const durable = await import(pathToFileURL(process.cwd() + "/scripts/rea-durable-queries.mjs").href);',
     '    const launched = await durable.launchDurableGhidra(this.options, session, options);',
     '    if (launched !== undefined) return launched;','}',END]
    lines.insert(i+1,''.join(indent+line+'\n' for line in body));return ''.join(lines)
def strip_census(source):
    # Keep the independently guarded existing native-census patch intact.
    import importlib.util
    spec=importlib.util.spec_from_file_location('native_census_repair',ROOT/'scripts/repair-rea-native-census.py')
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return source.replace(module.INSERT,'').replace(module.POST,'').replace(module.PATH_REPLACEMENT,module.PATH_ANCHOR)
def profile_patch(source):
    original=block(source,PROFILE_BEGIN,PROFILE_END)
    original=original.replace('import_mode: durableQueries === null ? "ephemeral-source-immutable" : "persistent-source-immutable-v1",','import_mode: "ephemeral-source-immutable",')
    original=''.join(line for line in original.splitlines(keepends=True) if '...(durableQueries === null ? {} : { durable_queries: durableQueries }),' not in line)
    lines=original.splitlines(keepends=True);indices=[i for i,l in enumerate(lines) if 'const provider = {' in l]
    if len(indices)!=1:raise ValueError('Profile provider anchor differs')
    i=indices[0];indent=lines[i][:len(lines[i])-len(lines[i].lstrip())]
    if not lines[i].rstrip().endswith(';'):
        while not lines[i].rstrip().endswith(';'):i+=1
    body=[PROFILE_BEGIN,'const durableQueries = process.env.REA_DURABLE_QUERY_ROOT && !process.env.REA_NATIVE_CENSUS_PLAN',
     '    ? await (await import((await import("node:url")).pathToFileURL(process.cwd() + "/scripts/rea-durable-queries.mjs").href)).durableQueryParameters(target, installation)',
     '    : null;',PROFILE_END]
    lines.insert(i+1,''.join(indent+l+'\n' for l in body));expected=''.join(lines)
    if expected.count('import_mode: "ephemeral-source-immutable",')!=2:raise ValueError('Profile import anchors differ')
    expected=expected.replace('import_mode: "ephemeral-source-immutable",','import_mode: durableQueries === null ? "ephemeral-source-immutable" : "persistent-source-immutable-v1",\n'+indent+'    ...(durableQueries === null ? {} : { durable_queries: durableQueries }),')
    return original,expected
ACK_OLD='value.project_ephemeral === true;'
ACK_NEW='typeof value.project_ephemeral === "boolean";'
def session_patch(source):
    original=source.replace(ACK_NEW,ACK_OLD)
    return original,once(original,ACK_OLD,ACK_NEW)
def provider_patch(source):
    original=''.join(line for line in source.splitlines(keepends=True) if 'durableQueryProfile: committedProfile.parameters.durable_queries,' not in line)
    lines=original.splitlines(keepends=True);indices=[i for i,line in enumerate(lines) if 'bridgeScriptPath: fileURLToPath(' in line]
    if len(indices)!=1:raise ValueError('Provider launcher profile anchor differs')
    i=indices[0];indent=lines[i][:len(lines[i])-len(lines[i].lstrip())]
    lines.insert(i+1,indent+'durableQueryProfile: committedProfile.parameters.durable_queries,\n')
    return original,''.join(lines)
BRIDGE_EDITS=(
 ('            initializeDecompiler();\n            serve(descriptor);','            initializeDecompiler();\n            durableInitialize(descriptor);\n            serve(descriptor);'),
 ('result.addProperty("project_ephemeral", true);','result.addProperty("project_ephemeral", durableRoot == null);'),
 ('writeSuccess(writer, request.id, handleRequest(request, descriptor));','writeSuccess(writer, request.id, durableHandleRequest(request, descriptor));'),
 ('        JsonArray items = new JsonArray();\n        for (InventoryItem item : inventory) {\n            monitor.checkCancelled();\n            if (!matcher.matches(item.value)) {',
  '        if (durableRoot != null) return durableSearch(inventory, matcher, params, procedureSearch);\n        JsonArray items = new JsonArray();\n        for (InventoryItem item : inventory) {\n            monitor.checkCancelled();\n            if (!matcher.matches(item.value)) {'),
)
def bridge_patch(source):
    original=block(source,'// BEGIN PROJECT DURABLE QUERY SUPPORT','// END PROJECT DURABLE QUERY SUPPORT')
    for old,new in BRIDGE_EDITS:original=original.replace(new,old)
    expected=original
    for old,new in BRIDGE_EDITS:expected=once(expected,old,new)
    anchor='    private List<InventoryItem> nameInventory;'
    fragment=(ROOT/'scripts/ghidra/ReaDurableQueryBridge.fragment.java').read_text()
    expected=once(expected,anchor,fragment+anchor)
    return original,expected
def guard(original,expected,label):
    if sha(original)!=expected:raise ValueError('Unrecognized pinned REA source: '+label+' sha256='+sha(original))
def changes():
    result=[]
    for name,basehash in HASHES.items():
        path=PACKAGE/name;source=path.read_text()
        if name.endswith('GhidraLauncher.js'):
            original=strip_launcher(source);guard(strip_census(original),basehash,name);expected=add_launcher(original)
        elif name.endswith('GhidraAnalysisProfile.js'):original,expected=profile_patch(source);guard(original,basehash,name)
        elif name.endswith('GhidraSessionValues.js'):original,expected=session_patch(source);guard(original,basehash,name)
        elif name.endswith('GhidraProviderClient.js'):original,expected=provider_patch(source);guard(original,basehash,name)
        else:original,expected=bridge_patch(source);guard(original,basehash,name)
        if source not in (original,expected) and sha(source) not in PREVIOUS_REPAIRED.get(name,set()):raise ValueError('Partial durable patch: '+name)
        result.append((path,expected,source!=expected))
    for name in BUNDLES:
        path=PACKAGE/name;source=path.read_text();expected=source
        for region in ('GhidraLauncher','GhidraAnalysisProfile','GhidraSessionValues','GhidraProviderClient'):
            start=expected.index('//#region dist/ghidra/'+region+'.js');end=expected.index('//#endregion',start);current=expected[start:end]
            if region=='GhidraLauncher':original=strip_launcher(current);patched=add_launcher(original);basehash=REGION_HASHES[(name,region)]
            elif region=='GhidraAnalysisProfile':original,patched=profile_patch(current);basehash=REGION_HASHES[('profile',region)]
            elif region=='GhidraSessionValues':original,patched=session_patch(current);basehash=REGION_HASHES[('session',region)]
            else:original,patched=provider_patch(current);basehash=REGION_HASHES[('provider',region)]
            guard(original,basehash,name+':'+region)
            if current not in (original,patched):raise ValueError('Partial bundle patch')
            expected=expected[:start]+patched+expected[end:]
        result.append((path,expected,source!=expected))
    return result
def main():
    p=argparse.ArgumentParser(description=__doc__);mode=p.add_mutually_exclusive_group();mode.add_argument('--apply',action='store_true');mode.add_argument('--check',action='store_true');args=p.parse_args()
    pending=changes() # Validate every source before mutating any installed file.
    for path,expected,changed in pending:
        if changed and args.apply:path.write_text(expected)
        if not args.check:print(('applied' if changed and args.apply else 'pending' if changed else 'present')+': '+str(path.relative_to(ROOT))+' sha256='+sha(expected))
    if args.check and any(changed for _,_,changed in pending):raise SystemExit(1)
if __name__=='__main__':main()

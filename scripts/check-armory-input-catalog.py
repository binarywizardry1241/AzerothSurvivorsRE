#!/usr/bin/env python3
"""Check current gamemode Armory input, navigation and gear name catalog.
No compiler, game, renderer or native IO runs; shared fixtures retain historical provenance.
"""
import ast,sys,json,hashlib,types,argparse,importlib.util,struct
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
OUT=ROOT/'docs/analysis/evidence/0.112.0/armory-input-catalog'
manifest=json.loads((OUT/'manifest.json').read_text());assert manifest['target_sha256']==latest_target(verify=True)['sha256']
for fixture,expected in manifest['fixtures'].items():assert hashlib.sha256((ROOT/fixture).read_bytes()).hexdigest()==expected
mapping={int(a,16):int(b,16)for a,b in manifest['input_addresses'].items()};used={};path=ROOT/'scripts/check-armory-input.py';tree=ast.parse(path.read_text());end=next(i for i,n in enumerate(tree.body)if isinstance(n,ast.Assign)and ast.unparse(n.targets[0])=='selection');tree.body=tree.body[:end]
tree.body=[n for n in tree.body if not(isinstance(n,ast.Assign)and ast.unparse(n.targets[0])in['parser','args'])and not(isinstance(n,ast.Expr)and ast.unparse(n.value).startswith('parser.add_argument'))]
class Rebind(ast.NodeTransformer):
 def visit_Constant(self,n):
  if type(n.value)is int and 0x140000000<=n.value<0x149000000:
   assert n.value in mapping,hex(n.value);used[hex(n.value)]=hex(mapping[n.value]);n.value=mapping[n.value]
  if n.value=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0':n.value=latest_target()['sha256']
  return n
ns=dict(__name__='native_fixture',__file__=str(path),args=types.SimpleNamespace(write=False));exec(compile(ast.fix_missing_locations(Rebind().visit(tree)),str(path),'exec'),ns);result={k:ns[k]for k in ['rows','presses','primary','nav']};assert used==manifest['input_addresses']
input_results=result
path=ROOT/'scripts/recover-armory-names.py';tree=ast.parse(path.read_text());fn=next(n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name=='main');start=next(i for i,n in enumerate(fn.body)if isinstance(n,ast.Assign)and ast.unparse(n.targets[0])=='target');end=next(i for i,n in enumerate(fn.body)if isinstance(n,ast.Assign)and ast.unparse(n.targets[0])=='bounds');tree.body=fn.body[start:end];mapping={int(a,16):int(b,16)for a,b in manifest['name_addresses'].items()}
class Rebind(ast.NodeTransformer):
 def visit_Constant(self,n):
  if type(n.value)is int and 0x140000000<=n.value<0x149000000:n.value=mapping[n.value]
  return n
ns=dict(globals(),SHA=latest_target(verify=True)['sha256']);exec(compile(ast.fix_missing_locations(Rebind().visit(tree)),str(path),'exec'),ns);old=json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory-name-rules-0.109.0.json').read_text());assert ns['rules']==old['classes'] and ns['nouns']==old['nouns'];result=dict(rules=ns['rules'],nouns=ns['nouns'],cases=ns['cases'],spans=ns['spans'])
name_results=result
data=target_bytes(latest_target(verify=True));pe=ns['pe']
for row in manifest['owners']:
 a=int(row['new'],16);offset=pe.rva_offset(a-pe.image_base);assert hashlib.sha256(data[offset:offset+row['size']]).hexdigest()==row['sha256']
row=manifest['table'];a=int(row['va'],16);offset=pe.rva_offset(a-pe.image_base);blob=data[offset:offset+row['byte_count']];assert hashlib.sha256(blob).hexdigest()==row['sha256']
assert [hex(a+v)for v in struct.unpack('<12i',blob)]==row['targets']
source=(ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text()
for text in ['view.selected = gear.worn(class, slot);','view.slot = catalog','state.queue_gear(class);','view.selected = Some(id);']:assert text in source,text
counts={k:len(v)for k,v in input_results.items()};assert counts==dict(rows=180,presses=12,primary=270,nav=112)
def digest(v):return hashlib.sha256(json.dumps(v,separators=(',',':')).encode()).hexdigest()
record=dict(target_sha256=manifest['target_sha256'],native_instructions_executed=True,application_executed=False,rebuilt_code_executed=False,
 input_cases=counts,input_sha256=digest(input_results),name_cases=len(name_results['cases']),name_sha256=digest(name_results['cases']),name_spans=name_results['spans'],
 manifest_sha256=hashlib.sha256((OUT/'manifest.json').read_bytes()).hexdigest(),
 limits=['Current primary/secondary branch fields and registers and complete navigation execute, with account/descriptor/drop getters, tick/query iteration, clone/bytes/free and command publication as explicit seams.',
 'The actual current twelve-entry primary action table executes; upstream ECS action membership/completeness remains a separate #41 boundary.',
 'The current class304-byte records and armor noun pointers reproduce45 set rules,32 nouns,415 ordinary and166 PvP names; all used keys exist in14 current locale catalogs.',
 'Codex selection is separately owned. Current cosmetics, slot production, tabard availability and balance metadata have separate canonical proofs.',
 'No compiler, reconstructed Rust, application, renderer, native IO, complete ECS scheduler or original/rebuilt comparison ran.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args();path=(ROOT/'runtime/native-evidence/0.112.0/armory-input-catalog' if args.stage else OUT)/'cases.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed574 current native Armory input/navigation cases and581 current name catalog comparisons; no build/game')

#!/usr/bin/env python3
"""Verify current binding capture, account handoff and source consumers without compilation."""
from script_sources import load_script
import ast,json,sys,hashlib,importlib.util,struct,argparse
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
from equipment_native import EquipmentProbe
OUT=ROOT/'docs/analysis/evidence/0.112.0/in-run-bindings'
binding=json.loads((OUT/'manifest.json').read_text());assert binding['target_sha256']==latest_target(verify=True)['sha256']
assert hashlib.sha256((ROOT/binding['fixture']).read_bytes()).hexdigest()==binding['fixture_sha256']
mapping={int(a,16):int(b,16)for a,b in binding['addresses'].items()};path=ROOT/'scripts/native_bindings.py';tree=ast.parse(path.read_text());tree.body=[n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name in ['source_checks','vectors']];used={}
class Rebind(ast.NodeTransformer):
 def visit_Constant(self,n):
  if type(n.value)is int and 0x140000000<=n.value<0x149000000:used[hex(n.value)]=hex(mapping[n.value]);n.value=mapping[n.value]
  if n.value == 'extension.binding_writes.append(&mut state.bindings.engine_writes)':n.value='extension.account_bindings = Some(state.bindings.keys.iter()'
  return n
ns=dict(globals());exec(compile(ast.fix_missing_locations(Rebind().visit(tree)),str(path),'exec'),ns);t=latest_target(verify=True);data=target_bytes(t);m = load_script('p', ROOT/'scripts/inventory-executable.py');pe=m.PE(data);cases=ns['vectors'](data,pe);ns['source_checks']();assert used==binding['addresses']
for row in binding['owners']:
 a,b=int(row['va'],16),int(row['end_exclusive'],16);offset=pe.rva_offset(a-pe.image_base);assert hashlib.sha256(data[offset:offset+b-a]).hexdigest()==row['sha256']
 if 'historical_assembly'in row:assert hashlib.sha256((ROOT/row['historical_assembly']).read_bytes()).hexdigest()==row['historical_assembly_sha256']
for row in binding['tables']:
 a=int(row['va'],16);offset=pe.rva_offset(a-pe.image_base);raw=data[offset:offset+row['byte_count']];assert hashlib.sha256(raw).hexdigest()==row['sha256']
 if 'targets'in row:assert [hex(a+v)for v in struct.unpack('<'+'i'*(len(raw)//4),raw)]==row['targets']
 if 'utf8'in row:assert raw.decode()==row['utf8']
assert hashlib.sha256((OUT/binding['canonical_assembly']).read_bytes()).hexdigest()==binding['canonical_assembly_sha256']

class Probe(EquipmentProbe):
 def hook(self,uc,pc,size,unused):
  if pc in [0x14013cc5b,0x14012b381,0x14012b3c6]:self.hit=pc;self.native.emu_stop();return
  if pc==0x145c0a3e7:
   a,b,n=[self.reg(x)for x in ['RCX','RDX','R8']];left,right=bytes(self.native.mem_read(a,n)),bytes(self.native.mem_read(b,n));self.reg('RAX',((left>right)-(left<right))&((1<<64)-1));sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp));return
  return super().hook(uc,pc,size,unused)
c=Probe(data,pe,[(0x14013cb72,0x14013cc5b),(0x14012b378,0x14012b381)]);base=c.cursor;extra=[]
for pending,oldcmd,newcmd,oldslot,newslot in [(False,'JUMP','JUMP',0,0),(True,'JUMP','JUMP',0,0),(True,'JUMP','JUMP',0,1),(True,'JUMP','MOVE',0,0),(True,'JUMP','SHORTER',0,0),(True,'JUMP','JUMP',1,1)]:
 c.cursor=base;frame=c.alloc(0x400)+0x100;options=c.alloc(0x200);entry=c.alloc(32);tick=c.alloc(16);c.output(options+0x90,oldcmd);c.put(options+0xa8,oldslot);c.output(entry,newcmd);c.put(entry+0x18,newslot)
 if not pending:c.put(options+0x90,0xffffffffffffffff)
 c.put(frame+0x70,options+0x98);c.put(frame+0xf8,options);c.put(frame+0xe0,tick);c.native.mem_write(frame+0x104,struct.pack('<I',37));c.native.mem_write(frame,bytes(c.native.mem_read(options+0x98,16)));c.put(frame-0x58,oldslot);c.reg('RBP',frame);c.reg('R15',entry);c.reg('RSP',c.STACK+0x1f0000);c.reg('R8',0);c.hit=None;c.native.emu_start(0x14013cb72,0,count=1000);assert c.hit==0x14013cc5b;cancel=pending and oldcmd==newcmd and oldslot==newslot;got=c.q(options+0x90)==0xffffffffffffffff;assert got==cancel,(pending,oldcmd,newcmd,oldslot,newslot,got)
 if not cancel:assert c.pair(options+0x98)==newcmd and c.q(options+0xa8)==newslot
 extra.append(dict(kind='capture-toggle',pending=pending,oldcmd=oldcmd,newcmd=newcmd,oldslot=oldslot,newslot=newslot,cancelled=cancel))
for running in [0,1]:
 state=c.alloc(0x100);c.native.mem_write(state+0xe8,bytes([running]));c.reg('RAX',state);c.hit=None;c.native.emu_start(0x14012b378,0,count=10);assert c.hit==(0x14012b381 if running else 0x14012b3c6);extra.append(dict(kind='live-commit',in_run=bool(running),live_replace=bool(running)))
assert len(cases)==91 and len(extra)==8
extension=(ROOT/'crates/benilla-app/src/local_client/extension.rs').read_text()
assert 'let Some(bindings) = extension.account_bindings.take() else { return; }' in extension
assert 'custom_menu_edit_publishes_the_file_derived_account_table' in extension
for text in ['script.seed_binding_set(1, Some(keys))','script.seed_binding_set(2, None)',
             'script.load_binding_set(1)','crate::bindings::remove_character_override(&files)',
             'extension.account_bindings = None','inactive_custom_account_request_does_not_defer_or_drop_generic_edits']:
 assert text in extension,text
assert 'SaveBindings(' not in extension.split('fn apply_account_bindings(',1)[1].split('pub(crate) fn discard_',1)[0]
options=(ROOT/'crates/azeroth-survivors-re/src/options.rs').read_text()
assert 'state.bindings.keys = state.bindings.account_keys(state.state_home.as_deref())' in options
assert 'snapshot.keys.iter().cloned().collect()' not in options
assert '.add_systems(PostUpdate,' in options and '.chain().before(bevy::ui::UiSystems::Prepare)' in options
assert 'if state.open && (!state.last_open || state.definitions_pending)' in options
assert 'binding_model_rereads_account_file_over_defaults' in options
assert 'custom_binding_file_commit_does_not_require_a_live_vm' in options
assert 'engine_connected' not in options.split('fn save_bindings(',1)[1].split('fn save_when_quiet(',1)[0]
client=(ROOT/'crates/benilla-app/src/local_client.rs').read_text()
assert 'extension::discard_inactive_account_bindings.in_set(LocalClientSet::Options)\n                    .run_if(not(crate::ui_script::ingame_ui_up))' in client
engine=(ROOT/'crates/benilla-app/src/bindings.rs').read_text()
assert 'Update,' in engine and 'drain_binding_requests.in_set(crate::ui_script::UiDrain)' in engine
record=dict(target_sha256=t['sha256'],application_executed=False,rebuilt_code_executed=False,native_instructions_executed=True,
    native_cases=len(cases)+len(extra),fixture_cases_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest(),
    additional_cases=extra,manifest_sha256=hashlib.sha256((OUT/'manifest.json').read_bytes()).hexdigest(),
    limits=['Current PE branches execute with explicit string-clone/byte/free seams in capture toggling; the91 shared fixture cases stop before external services.',
    'Current Options event owner, actual switch tables, lookup TypeIDs, binding persistence and account replacement calls are statically recovered; complete ECS/VM/IO callbacks do not execute.',
    'Source assertions trace unconditional account file commit, fresh file-model refresh, loaded-VM-only account publication and existing capture/held/repeat/release/layout/mouse/wheel consumers. Rust regressions remain uncompiled.',
    'No compiler, application, device, native filesystem/network/IPC or original/rebuilt comparison. Shared engine and upstream event producer completeness remain #41.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
path=(ROOT/'runtime/native-evidence/0.112.0/in-run-bindings' if args.stage else OUT)/'cases.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed99 current native binding branches and account/capture source consumer checks; no compilation/game')

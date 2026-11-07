#!/usr/bin/env python3
"""Bind treasure presentation owners to 0.100.1 and retain REA/Ghidra evidence.

Candidate mapping only locates exact-fragment leads; reviewed target assembly
and Ghidra output establish recovered behavior. No application is executed.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse, bisect, hashlib, json, subprocess, itertools, struct, sys
from collections import Counter
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
WORK=ROOT/'runtime/analysis/history/native-recovery/treasure-interface/bc4d3872616f'
OUT=ROOT/'runtime/analysis/staging/native-evidence/treasure-interface'
OWNERS={'choice-payload':0x1454f0f10,'cards-root':0x14021aed0,'card-tile':0x1401f47e0,'card-content':0x140109b00,'card-tooltip':0x1401f3210,'cards-layout':0x14010cdf0,'cards-animate':0x14021ce50,'effect-scale-map':0x145544de0,'effect-description-map':0x1455526c0,'amulet-current-description':0x1454251d0,'amulet-comparison-lines':0x145542df0}
LEADS={'jewelry-description':0x145413220,'amulet-worn-description':0x145413bc0,'amulet-new-description':0x145414120,'effect-description':0x145413430}
def load(name,path):
 m = load_script(name, path);return m

def check_confirmation(contract_path):
 """Check the 0.127.0 modal at its scalar UI interfaces, without an app."""
 from coverage_common import latest_target, target_bytes
 from discovery_native_subject import verify_native_query_subject
 proof_path=(ROOT/contract_path).resolve();assert proof_path.is_relative_to(ROOT)
 proof=json.loads(proof_path.read_text());target=latest_target(verify=True)
 assert all(target[k]==v for k,v in proof['target'].items())
 data=target_bytes(target);pe=load('confirmation_pe',ROOT/'scripts/inventory-executable.py').PE(data)
 def raw(a,n):
  off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
 for query in proof['native_queries']:
  envelope=json.loads((ROOT/query['result']['path']).read_text())
  native=envelope.get('structuredContent') or json.loads(envelope['content'][0]['text'])
  verify_native_query_subject(ROOT,native,query,target,image=data,pe=pe)
 for row in proof['ranges']:
  value=raw(int(row['address'],16),row['byte_count'])
  assert hashlib.sha256(value).hexdigest()==row['sha256'],row['role']
  if 'bytes_hex' in row:assert value.hex()==row['bytes_hex']
 locales=json.loads((proof_path.parent/'locales.json').read_text())
 locale_cases=0
 for row in locales['locales']:
  source=json.loads((ROOT/'crates/azeroth-survivors-re/assets/locales'/f"{row['code']}.json").read_text())
  payload=row['payload'];value=data[int(payload['file_offset'],16):int(payload['file_offset'],16)+payload['byte_count']]
  assert hashlib.sha256(value).hexdigest()==payload['sha256']
  original=json.loads(value)
  for key,value in row['entries'].items():
   assert source[key]==original[key]==value;locale_cases+=1
 sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
 from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
 import unicorn.x86_const as reg
 machine=Uc(UC_ARCH_X86,UC_MODE_64)
 for row in proof['ranges'][:2]:
  first=int(row['address'],16)&~4095;last=(int(row['end_exclusive'],16)+4095)&~4095
  machine.mem_map(first,last-first);machine.mem_write(int(row['address'],16),bytes.fromhex(row['bytes_hex']))
 for address in (0x140244000,0x140246000):machine.mem_map(address,4096)
 heap,stack=0x200000000,0x300000000
 machine.mem_map(heap,0x10000);machine.mem_map(stack,0x10000)
 capture,state,keyboard,clock,tick,bus=tuple(heap+n for n in (0,0x100,0x200,0x300,0x400,0x500))
 sp=stack+0x8000;pressed=set();commands=[];queries=[];stops=set()
 def get(name):return machine.reg_read(getattr(reg,'UC_X86_REG_'+name))
 def put(address,value,fmt='Q'):machine.mem_write(address,struct.pack('<'+fmt,value))
 def ret():
  at=get('RSP');dest=struct.unpack('<Q',machine.mem_read(at,8))[0]
  machine.reg_write(reg.UC_X86_REG_RSP,at+8);machine.reg_write(reg.UC_X86_REG_RIP,dest)
 def code(_,address,size,unused):
  if address in stops:machine.emu_stop();return
  if address==0x140244140:
   key=struct.unpack('<I',machine.mem_read(get('R8'),4))[0];queries.append(key)
   assert key in (58,102)
   machine.reg_write(reg.UC_X86_REG_RAX,int(key in pressed));ret();return
  if address==0x140246550:
   pointer=get('RDX');tag=struct.unpack('<I',machine.mem_read(pointer,4))[0]
   index=struct.unpack('<Q',machine.mem_read(pointer+8,8))[0];assert tag==2
   commands.append(index);ret();return
  if not any(int(row['address'],16)<=address< int(row['end_exclusive'],16) for row in proof['ranges'][:2]):
   raise ValueError('Native modal excursion '+hex(address))
 machine.hook_add(UC_HOOK_CODE,code)
 cases=0
 for typing,escape,enter,numpad,pointer,index in itertools.product((0,1),(0,1),(0,1),(0,1),(0,1,2),(0,3,0xffffffffffffffff)):
  machine.mem_write(heap,bytes(0x1000));machine.mem_write(sp-0x100,bytes(0x1000))
  pressed.clear();pressed.update(key for key,yes in ((58,enter),(102,numpad)) if yes)
  commands.clear();queries.clear();put(capture,escape,'B');put(capture+1,typing,'B')
  put(state+16,1);put(state+24,index);put(keyboard+0x38,int(bool(pressed)))
  put(clock+0x5c,12.5,'f');put(sp+0x68,capture);put(sp+0x70,state);put(sp+0x60,keyboard)
  put(sp+0x40,tick);put(sp+0x34,17,'I');put(sp+0x48,clock);put(sp+0x58,index);put(sp+0x50,bus)
  for name,value in (('RSP',sp),('RBX',pointer),('EFLAGS',2)):
   machine.reg_write(getattr(reg,'UC_X86_REG_'+name),value)
  stops.clear();stops.add(0x14028eec8);machine.emu_start(0x14028edcc,0,count=200)
  assert get('RIP')==0x14028eec8
  expected=False if not typing and escape else True if not typing and (enter or numpad) else {0:True,1:False,2:None}[pointer]
  assert commands==([index] if expected is True else []),(typing,escape,enter,numpad,pointer,index,commands)
  assert struct.unpack('<Q',machine.mem_read(state+16,8))[0]==int(expected is None)
  assert struct.unpack('<I',machine.mem_read(state+64,4))[0]==int(expected is True)
  if expected is True:
   assert struct.unpack('<f',machine.mem_read(state+68,4))[0]==12.5
   assert struct.unpack('<Q',machine.mem_read(state,8))[0]==1
   assert struct.unpack('<Q',machine.mem_read(state+8,8))[0]==index
  if typing:assert not queries
  cases+=1
 presence_cases=0
 for capacity in (0,1,255,0xffffffffffffffff):
  put(heap+0x800,heap+0xa00);put(heap+0x808,0)
  machine.reg_write(reg.UC_X86_REG_RBP,heap+0x748)
  machine.reg_write(reg.UC_X86_REG_RDI,capacity)
  stops.clear();stops.add(0x1400c8667);machine.emu_start(0x1400c8650,0,count=20)
  assert machine.mem_read(heap+0xa00,1)[0]==int(capacity!=0xffffffffffffffff)
  presence_cases+=1
 base=ROOT/'crates/azeroth-survivors-re/src/gameplay'
 local=(base/'mod.rs').read_text();guest=(base/'coop_overlay.rs').read_text();modal=(base/'native_overlays/confirmation.rs').read_text()
 assert 'was_confirming' not in local and 'was_confirming' not in guest
 for source in (local,guest):
  assert 'select_or_confirm(index, replacements[index], time.elapsed_secs())' in source
  assert 'opened.confirming.is_none() && !session.paused' in source
  assert 'opened.confirming = None;' in source
  assert 'on_top_pointer' in source
 handler=local.split('fn confirmation_controls(',1)[1].split('const CHOICE_OPENING_SECONDS:',1)[0]
 assert 'confirmation::decision(' in handler and 'retire_stale_confirmation(' in handler
 assert 'opened.signature != offer_signature(game)' in handler and 'loading.covering()' in handler
 assert 'CHOICE_OPENING_SECONDS' not in handler and '!session.paused' not in handler
 assert 'accept_confirmed(runtime, replica, index' in handler
 production=local.split('fn confirmation_controls(',1)[0]
 assert 'confirmation_controls.in_set(RunSet::Input)' in production
 assert 'confirmation_controls.after(' not in production and 'confirmation_controls.before(' not in production
 assert 'if input.custom_game_menu_requested' in modal and 'KeyCode::NumpadEnter' in modal
 assert 'GlobalZIndex(6060)' in modal and 'node.min_width = Val::Px(150.);' in modal
 assert '.filter(|(index, _)|' in modal and 'card.0.replacement.is_some()' in modal
 assert 'if choice.confirming.is_some()' in (base/'run_hud/pause.rs').read_text()
 assert 'retire_stale_confirmation(replica, &session, &mut opened)' in local
 assert 'never drop a newer pick' in guest.lower()
 print(json.dumps(dict(target=target['version'],native_modal_cases=cases,optional_record_cases=presence_cases,native_queries=len(proof['native_queries']),locale_entries=locale_cases,limits=proof['limits'])))

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare',action='store_true');ap.add_argument('--collect',action='store_true');ap.add_argument('--check-confirmation',type=Path);args=ap.parse_args()
 if args.check_confirmation:
  check_confirmation(args.check_confirmation);return
 data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA;p=load('inventory',ROOT/'scripts/inventory-executable.py').PE(data);ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()}
 old=load('inventory_old',ROOT/'scripts/inventory-executable.py').PE((ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe').read_bytes());old_ends={old.image_base+a:old.image_base+b for a,b,_ in old.functions()};functions=sorted(p.functions());starts=[a for a,b,c in functions]
 candidates={};base=p.rva_offset(0x5300000);search=data[base:p.rva_offset(0x5800000)]
 for role,va in LEADS.items():
  at=old.rva_offset(va-old.image_base)
  if va not in old_ends:continue
  payload=old.data[at:at+old_ends[va]-va];votes=Counter()
  for offset in range(0,len(payload)-23,max(16,len(payload)//64//16*16)):
   frag=payload[offset:offset+24];found=search.find(frag)
   if found<0 or search.find(frag,found+1)>=0:continue
   address=p.offset_va(base+found);rva=address-p.image_base;i=bisect.bisect_right(starts,rva)-1
   if i>=0 and rva<functions[i][1]:votes[p.image_base+starts[i]]+=1
  candidates[role]=[{'address':hex(a),'votes':n}for a,n in votes.most_common(3)]
  if candidates[role]:OWNERS[role]=int(candidates[role][0]['address'],16)
 WORK.mkdir(parents=True,exist_ok=True);records=[]
 for role,start in OWNERS.items():
  end=ends[start];offset=p.rva_offset(start-p.image_base);raw=data[offset:offset+end-start]
  record={'role':role,'address':hex(start),'end_exclusive':hex(end),'file_offset':hex(offset),'byte_count':len(raw),'sha256':hashlib.sha256(raw).hexdigest()}
  if args.prepare:
   (WORK/f'{role}.bin').write_bytes(raw)
   plan={'target':str((WORK/f'{role}.bin').relative_to(ROOT)),'output':str((WORK/f'rea-{role}').relative_to(ROOT)),'open_options':{'format':'raw-binary','architecture':'x86_64','entry_point':hex(start)},'timeout':180,'open_timeout':120,'operations':[{'name':'procedure_pseudo_code','arguments':{'procedure':hex(start)}}]}
   (WORK/f'{role}-plan.json').write_text(portable_json(plan,indent=2)+'\n')
  if args.collect:
   path=WORK/f'rea-{role}/003-procedure_pseudo_code.json'
   if path.exists():
    response=json.loads(path.read_text());ev=response['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==record['sha256'];OUT.mkdir(parents=True,exist_ok=True);(OUT/f'{role}.ghidra.c').write_text(ev['normalized_result']);record['rea_evidence']=ev
   OUT.mkdir(parents=True,exist_ok=True)
   (OUT/f'{role}.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',f'--stop-address={end:#x}',str(TARGET)],cwd=ROOT,text=True))
  records.append(record)
 (WORK/'owners.json').write_text(portable_json({'target_sha256':SHA,'candidates':candidates,'owners':records},indent=2)+'\n')
 if args.collect:(OUT/'manifest.json').write_text(portable_json({'target_sha256':SHA,'target_executed':False,'method':__doc__,'owners':records,'limitations':['Raw slices preserve all original instructions; external call/constant meanings require original PE assembly and bounded data reads.','Static or emulated evidence does not establish visual or application-runtime parity.']},indent=2)+'\n')
 print(json.dumps({'owners':{k:hex(v)for k,v in OWNERS.items()},'mode':vars(args)},indent=2))
if __name__=='__main__':main()

#!/usr/bin/env python3
"""Check current raw racial recovery and native stat publication; no build/game."""
from pathlib import Path
import sys,struct,json,hashlib
ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as R
T=latest_target(verify=True);assert T['sha256']=='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
D=target_bytes(T);PE=load_script('cooldown_base_pe',ROOT/'scripts/inventory-executable.py').PE(D)
def raw(a,n):
 o=PE.rva_offset(a-PE.image_base);v=D[o:o+n];assert len(v)==n;return v
def evidence(a,n):return dict(start=hex(a),end=hex(a+n),sha256=hashlib.sha256(raw(a,n)).hexdigest(),bytes=raw(a,n).hex())
def f(v):return struct.unpack('<f',struct.pack('<f',v))[0]
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def value(v):return struct.unpack('<f',struct.pack('<I',v))[0]
OWNER=0x14590d030;END=0x14590dfe9
assert hashlib.sha256(raw(OWNER,END-OWNER)).hexdigest()=='7181b1e8af2cd9f29276ab1e98284e0a685cf295d768d7d9f5f3e8b49e8b9510'
races=[]
race_table=0x147332878
for native_id,address in enumerate([0x146cc1ec8]+list(struct.unpack('<7Q',raw(race_table,56))),1):
 name_ptr,name_len=struct.unpack('<QQ',raw(address,16));ptr,count=struct.unpack('<QQ',raw(address+0x20,16))
 stats=[dict(tag=t,value_bits=bits(v))for t,v in struct.iter_unpack('<If',raw(ptr,count*8))]
 recovery=0.
 for row in stats:
  if row['tag']==2:recovery=f(recovery+value(row['value_bits']))
 races.append(dict(native_id=native_id,name=raw(name_ptr,name_len).decode(),descriptor=evidence(address,0x58),stats=evidence(ptr,count*8),rows=stats,expected_raw_recovery_bits=bits(recovery)))

def fixture(class_id,race_id,level,aura=0.):
 u=Uc(UC_ARCH_X86,UC_MODE_64);u.mem_map(0x20000000,0x20000);u.mem_map(0x30000000,0x10000)
 u.reg_write(R.UC_X86_REG_RSP,0x20010008);u.reg_write(R.UC_X86_REG_RCX,0x30000000)
 u.mem_write(0x3000032c,bytes([class_id,race_id]));u.mem_write(0x300004f0,struct.pack('<I',level))
 if aura:
  u.mem_write(0x300003a0,struct.pack('<QQ',0x30002000,1));u.mem_write(0x30002000,struct.pack('<IfIIff',9,aura,0,0,5.,0.))
 captured={}
 def missing(u,access,a,n,v,_):
  assert PE.image_base<=a<0x149000000,hex(a)
  page=a&~4095;u.mem_map(page,4096);u.mem_write(page,raw(page,4096));return True
 def hook(u,a,n,_):
  # Empty collections skip every allocation/copy call. Stop before post-store code.
  assert raw(a,1)!=b'\xe8',f'unexpected direct call {a:x}'
  if a==0x14590d854:captured['raw_recovery_bits']=u.reg_read(R.UC_X86_REG_XMM4)&0xffffffff
  if a==0x14590da6b:u.emu_stop()
 u.hook_add(UC_HOOK_MEM_UNMAPPED,missing);u.hook_add(UC_HOOK_CODE,hook)
 u.emu_start(OWNER,0,count=10000);assert u.reg_read(R.UC_X86_REG_RIP)==0x14590da6b
 captured['cooldown_bits']=struct.unpack('<I',u.mem_read(0x30000498,4))[0]
 return captured
cases=[]
for class_id in [1,2,3,4,5,7,8,9,11]:
 for race in races:
  for level in [1,60]:
   actual=fixture(class_id,race['native_id'],level)
   expected=race['expected_raw_recovery_bits'];assert actual['raw_recovery_bits']==expected,(class_id,race,actual)
   assert actual['cooldown_bits']==bits(f(1./f(value(expected)+1.)))
   cases.append(dict(class_id=class_id,race_id=race['native_id'],level=level,**actual))
source_entry=json.loads((ROOT/'crates/azeroth-survivors-re/assets/run-entry-0.100.1.json').read_text())
comparisons=[]
for race in races:
 src=next(x for x in source_entry['races']if x['native_id']==race['native_id'])
 multiplier=f(f(source_entry['player']['cooldown_multiplier'])/f(src['cooldown_divisor']))
 old_raw=f(f(1./multiplier)-1.)
 comparisons.append(dict(race_id=race['native_id'],native_raw_bits=race['expected_raw_recovery_bits'],old_source_raw_bits=bits(old_raw),old_source_base_multiplier_bits=bits(multiplier)))
# Gnome with aura exposes the lossy seed at the public Game+498 result.
for aura in [.1,.3,.7]:
 aura=f(aura);native=fixture(1,7,1,aura);old=comparisons[6]
 old_final=f(1./f(f(value(old['old_source_raw_bits'])+aura)+1.))
 comparisons[6].setdefault('aura_examples',[]).append(dict(aura_bits=bits(aura),native_cooldown_bits=native['cooldown_bits'],old_seed_cooldown_bits=bits(old_final)))
record=dict(target_sha256=T['sha256'],native_owner=dict(start=hex(OWNER),end=hex(END),sha256=hashlib.sha256(raw(OWNER,END-OWNER)).hexdigest()),class_table=evidence(0x1473328f0,80),race_table=evidence(race_table,56),race_dispatch=evidence(0x147332a1c,48),races=races,cases=cases,source_seed_comparisons=comparisons,limits=['Original current function entry through Game+498 write with real immutable class/race descriptors, original branches and arithmetic, synthetic empty equipment/stat collections.','No external call, allocator, arithmetic or behavior host seam; no game, reconstructed runtime, compiler or parity validation.','Covers raw base recovery only; other derived stat outputs are not asserted.'])
destination=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/cooldown-base-cases.json'
if '--write' in sys.argv:
 destination.write_text(json.dumps(record,indent=2)+'\n')
else:
 assert json.loads(destination.read_text())==record
print(f'PASS:{len(cases)} original current class/race/level base-recovery cases.');print(json.dumps(comparisons,indent=2))

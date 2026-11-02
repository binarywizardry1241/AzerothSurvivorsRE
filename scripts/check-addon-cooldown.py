#!/usr/bin/env python3
"""Check unchanged current aura/recovery finalization; no compilation or game."""
from pathlib import Path
import sys,struct,json,hashlib,math
ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as R
T=latest_target(verify=True);assert T['sha256']=='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
D=target_bytes(T);PE=load_script('cooldown_input_pe',ROOT/'scripts/inventory-executable.py').PE(D)
def raw(a,n):o=PE.rva_offset(a-PE.image_base);v=D[o:o+n];assert len(v)==n;return v
def f(v):return struct.unpack('<f',struct.pack('<f',v))[0]
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def reciprocal(v):return math.copysign(math.inf,v)if v == 0.0 else f(1./v)
def fixture(recovery,bonus,now,rows):
 u=Uc(UC_ARCH_X86,UC_MODE_64);u.mem_map(0x20000000,0x20000);u.mem_map(0x30000000,0x10000);u.reg_write(R.UC_X86_REG_RBP,0x20001000);u.reg_write(R.UC_X86_REG_RSI,0x30000000)
 u.mem_write(0x30000b9c,struct.pack('<f',now));u.mem_write(0x300003a0,struct.pack('<QQ',0x30002000,len(rows)))
 for i,(tag,value,deadline)in enumerate(rows):u.mem_write(0x30002000+i*24,struct.pack('<IfIIff',tag,value,0,0,deadline,0.))
 u.reg_write(R.UC_X86_REG_XMM4,bits(recovery));u.reg_write(R.UC_X86_REG_XMM11,bits(bonus))
 def missing(u,access,a,n,v,_):
  assert PE.image_base<=a<0x149000000,hex(a)
  page=a&~4095;u.mem_map(page,4096);u.mem_write(page,raw(page,4096));return True
 def hook(u,a,n,_):
  if a==0x14590da6b:u.emu_stop()
 u.hook_add(UC_HOOK_MEM_UNMAPPED,missing);u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x14590d854,0,count=10000);assert u.reg_read(R.UC_X86_REG_RIP)==0x14590da6b
 return struct.unpack('<f',u.mem_read(0x30000498,4))[0]
cases=[]
inputs=[(0.,0.,1.,[]),(.1,.25,1.,[(9,.2,5.)]),(.7,.3,1.,[(9,.1,5.),(9,.15,5.)]),(.7,.3,1.,[(9,.15,5.),(9,.1,5.)]),(.1,.25,5.,[(9,.2,5.)]),(.1,.25,6.,[(9,.2,5.)]),(.1,.25,1.,[(8,.2,5.)]),(.1,.25,1.,[(9,.2,math.nan)]),(.1,.25,math.nan,[(9,.2,5.)]),(.1,math.nan,1.,[(9,.2,5.)]),(-.9999,0.,1.,[(9,.0001,5.)]),(.00001,.73,1.,[(9,.37,5.)])]
inputs.extend((r,0.,1.,[(9,a,5.)]) for r,a in [(.03,.3),(.07,.07),(.1,.07),(.2,.07),(.3,.03),(.4,.03),(.7,.1),(1.2,.1),(2.5,.01)])
for recovery,bonus,now,rows in inputs:
 recovery,bonus,now=map(f,(recovery,bonus,now));rows=[(tag,f(value),f(deadline))for tag,value,deadline in rows]
 expected=recovery
 for tag,value,deadline in rows:
  if tag==9 and not(now>=deadline):expected=f(expected+f(value*f(1.+bonus)))
 expected=reciprocal(f(expected+1.));actual=fixture(recovery,bonus,now,rows)
 assert (math.isnan(actual)and math.isnan(expected))or bits(actual)==bits(expected),(recovery,bonus,now,rows,expected,actual)
 # Existing helper starts from rounded base reciprocal and adds one before auras.
 base=reciprocal(f(recovery+1.));old=reciprocal(base)
 for tag,value,deadline in rows:
  if tag==9 and now<deadline:old=f(old+f(value*f(1.+bonus)))
 old=reciprocal(old)
 def key(v):return 'nan'if math.isnan(v)else v
 cases.append(dict(raw_recovery_bits=bits(recovery),buff_bonus_bits=bits(bonus),now_bits=bits(now),auras=[dict(tag=t,value_bits=bits(v),expires_bits=bits(d))for t,v,d in rows],expected_bits=bits(expected),native_bits=bits(actual),old_helper_bits=bits(old),old_helper_differs=not((math.isnan(old)and math.isnan(actual))or bits(old)==bits(actual))))
record=dict(target_sha256=T['sha256'],native_owner=dict(start='0x14590d030',end='0x14590dfe9',sha256=hashlib.sha256(raw(0x14590d030,0xfb9)).hexdigest()),range=dict(start='0x14590d854',end='0x14590da6b',sha256=hashlib.sha256(raw(0x14590d854,0x217)).hexdigest()),cases=cases,limits=['Original aura/final reciprocal/store instructions only, no compiler/game/reconstructed runtime/parity.','Raw recovery and buff potency accumulators are explicit synthetic inputs; equipment/stat refresh prefix and publication scheduling not replayed.','No external call or arithmetic host seam inside native replay.'])
destination=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/cooldown-input-cases.json'
if '--write' in sys.argv:
 destination.write_text(json.dumps(record,indent=2)+'\n')
else:
 assert json.loads(destination.read_text())==record
print(f'PASS:{len(cases)} original current aura/finalization cases; old helper differs in {sum(c["old_helper_differs"]for c in cases)} cases.')

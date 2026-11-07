#!/usr/bin/env python3
"""Bounded unchanged native timed-cast lifecycle and split cooldown snapshots.

Execute only reviewed no-call instruction fragments. The before/after dispatch
boundary is explicit: fallback captures pre-cast global cooldown, while a
positive override uses post-cast global cooldown. Constructor/refresh Ghidra
and PE owners retain startup1.5, suffix1.0 and base-prefix preservation.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
data = TARGET.read_bytes(); assert hashlib.sha256(data).hexdigest() == SHA
module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
pe = module.PE(data)
u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
MEM, STACK = 0x200000000, 0x300000000
u.mem_map(MEM, 0x10000); u.mem_map(STACK, 0x10000)
SPANS = [(0x1454b0ee7,0x1454b0f1d), (0x1454b0f87,0x1454b0fb1),
         (0x1454b0ffb,0x1454b101e), (0x1454b101e,0x1454b10c7),
         (0x1454b10e0,0x1454b1105), (0x1454b0f3a,0x1454b0fec)]
stops = set()
def hook(_, address, size, unused):
    if address in stops: u.emu_stop()
    elif not any(a <= address < b for a,b in SPANS):
        raise RuntimeError('Unreviewed instruction ' + hex(address))
u.hook_add(UC_HOOK_CODE, hook)
def run(start, *ends):
    global stops
    stops = set(ends); u.emu_start(start, 0, count=1000)
    address = u.reg_read(UC_X86_REG_RIP); assert address in stops
    return address
def bits(value):
    return _shared_bits(value)
def setx(register, value): u.reg_write(register, bits(value))
def reset():
    u.mem_write(MEM, bytes(0x10000)); u.mem_write(STACK, bytes(0x10000))
    for reg,value in [(UC_X86_REG_RSI,MEM), (UC_X86_REG_RDI,0), (UC_X86_REG_R15,0),
                      (UC_X86_REG_RBP,STACK), (UC_X86_REG_RSP,STACK+0x8000),
                      (UC_X86_REG_MXCSR,0x1f80)]: u.reg_write(reg,value)
    u.mem_write(MEM+0xb8,struct.pack('<QQ',MEM+0x2000,1))
intervals = []
for base in [1.5,14.3]:
 for ordinary in [.2,1.3]:
  for talent in [.4,1.7]:
   for before in [.1,1.2]:
    for after in [.3,2.]:
     for override in [-1.,0.,3.,float('nan')]:
      reset(); u.reg_write(UC_X86_REG_RAX,MEM+0x3000)
      u.mem_write(MEM+0x3048,struct.pack('<f',base))
      u.mem_write(MEM+0x478,struct.pack('<f',before))
      u.mem_write(STACK+0x254,struct.pack('<f',ordinary))
      setx(UC_X86_REG_XMM0,talent); setx(UC_X86_REG_XMM8,1.4)
      setx(UC_X86_REG_XMM9,.25); setx(UC_X86_REG_XMM10,override)
      run(0x1454b0f87,0x1454b0fb1)
      fallback = u.reg_read(UC_X86_REG_XMM12)&0xffffffff
      u.mem_write(MEM+0x478,struct.pack('<f',after))
      run(0x1454b0ffb,0x1454b101e)
      intervals.append(dict(base_bits=bits(base),ordinary_bits=bits(ordinary),talent_bits=bits(talent),
         global_before_bits=bits(before),global_after_bits=bits(after),override_bits=bits(override),
         expected_fallback_bits=fallback,expected_interval_bits=u.reg_read(UC_X86_REG_XMM10)&0xffffffff))
due = []
for remaining in [-1.,0.,.3,1.5,float('nan')]:
 for delta in [0.,.1,.3,2.,float('nan')]:
    reset(); u.reg_write(UC_X86_REG_RAX,MEM+0x2000)
    u.mem_write(MEM+0x200c,struct.pack('<f',remaining))
    setx(UC_X86_REG_XMM6,delta); setx(UC_X86_REG_XMM7,0.)
    address = run(0x1454b0ee7,0x1454b0f1d,0x1454b0ec0)
    due.append(dict(remaining_bits=bits(remaining),delta_bits=bits(delta),
        expected_bits=struct.unpack('<I',u.mem_read(MEM+0x200c,4))[0],due=address==0x1454b0f1d))
tails = []
for success in [False,True]:
 for depth in [0,1,0xffffffff]:
  for effect_count in [0,1]:
    reset(); u.reg_write(UC_X86_REG_RAX,int(success)); u.reg_write(UC_X86_REG_R12,MEM+0x3000)
    u.reg_write(UC_X86_REG_R14,STACK+0xd4)
    u.mem_write(STACK+0x368,struct.pack('<Q',MEM)); u.mem_write(STACK+0x358,struct.pack('<Q',MEM+0x400))
    u.mem_write(MEM+0x11c,struct.pack('<I',depth)); u.mem_write(MEM+0x718,struct.pack('<Q',effect_count))
    u.mem_write(MEM+0x3040,struct.pack('<I',585)); u.mem_write(MEM+0x3074,bytes([1]))
    setx(UC_X86_REG_XMM10,2.5)
    address=run(0x1454b101e,0x1454b0ec0,0x1454b10c7)
    tails.append(dict(success=success,depth=depth,effect_count=effect_count,
        expected_remaining_bits=struct.unpack('<I',u.mem_read(MEM+0x200c,4))[0],
        cast_event=address==0x1454b10c7,event_hex=bytes(u.mem_read(STACK+0xb0,40)).hex() if address==0x1454b10c7 else None))
OUT=ROOT/'docs/analysis/evidence/run-effects'; OUT.mkdir(parents=True,exist_ok=True)
owners=[]
for role,lo,hi,session in [('timed-initial-iterator',0x145545650,0x14554573a,'iterator'),
    ('timed-initial-constructor',0x145559c90,0x145559eac,'construct'),
    ('timed-live-stage',0x1454b0e66,0x1454b1105,None),
    ('timed-base-count',0x1454c9c9c,0x1454c9d02,None),
    ('timed-prefix-refresh',0x1454ca1d9,0x1454ca511,None)]:
    offset=pe.rva_offset(lo-pe.image_base); raw=data[offset:offset+hi-lo]
    row=dict(role=role,address=hex(lo),end_exclusive=hex(hi),file_offset=hex(offset),sha256=hashlib.sha256(raw).hexdigest())
    (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(TARGET)],text=True))
    if session:
        path=ROOT/f'runtime/analysis/history/native-recovery/timed-initial/7a360761b460/rea-{session}/003-procedure_pseudo_code.json'
        ev=json.loads(path.read_text())['response']['result']['structuredContent']
        assert ev['subject']['digest']['sha256']==row['sha256'] and ev['provider']['id']=='ghidra'
        row['rea_evidence_id']=ev['evidence_id']; row['analysis_profile']=ev['analysis_profile']
        (OUT/(role+'.ghidra.c')).write_text(ev['normalized_result'])
    owners.append(row)
(OUT/'timed-live-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,
    spans=[dict(start=hex(a),end_exclusive=hex(b)) for a,b in SPANS],intervals=intervals,due=due,tails=tails,
    findings=['Timed startup1.5; refresh preserves base-talent prefix and rebuilds suffix at1.0.',
    'Each slot subtracts delta once, due iff not ordered positive; no catch-up loop or scheduler RNG.',
    'Fresh free-instance fields are used for dispatch with the due timer replacing instance.remaining.',
    'Success writes interval before optional kind3 event; failure writes literal.3; no cooldown packet or cast echoes.']),indent=2)+'\n')
print('Recovered',len(intervals),'split-cooldown intervals,',len(due),'due gates and',len(tails),'timed-cast event tails')

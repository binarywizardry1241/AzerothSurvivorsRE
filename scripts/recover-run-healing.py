#!/usr/bin/env python3
"""Current healing/overheal and class-special source attribution evidence.

Runs only unchanged instruction fragments before/after the healing-meter call.
The two fragments stop at call boundaries; no external call is emulated or
stubbed. Fixture inputs explicitly supply the actual pre-call preserved values.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
from pathlib import Path
import hashlib, importlib.util, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
s=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);pe=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size']) for x in pe.sections);u.mem_map(pe.image_base,(end+4095)&~4095)
for x in pe.sections:u.mem_write(pe.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;STACK=0x300000000;u.mem_map(MEM,0x10000);u.mem_map(STACK,0x10000)
SPANS=[(0x1454a54f2,0x1454a552c),(0x1454a5531,0x1454a5665),(0x1454b110c,0x1454b11ee),(0x1454b1334,0x1454b1339),
 (0x1454af9fc,0x1454afa4b),(0x1454afc3c,0x1454afc57),(0x1454afccf,0x1454afcf5),
 (0x1454afd8d,0x1454afda4),(0x1454afe1f,0x1454aff01)]
STOPS=[0x1454a552c,0x1454a5665,0x1454a56b0,0x1454b11ee,0x1454b13bb,0x1454b1339,
 0x1454afa4b,0x1454afc20,0x1454afc57,0x1454afcc2,0x1454afcf5,0x1454afda4,0x1454afd84,0x1454aff01,0x1454aff2a]
def hook(_,at,size,unused):
 if at in STOPS:u.emu_stop()
 elif not any(a<=at<b for a,b in SPANS):raise RuntimeError('Unreviewed instruction '+hex(at))
u.hook_add(UC_HOOK_CODE,hook)
def bits(v):
    return _shared_bits(v)
def read(off):return struct.unpack('<I',u.mem_read(MEM+off,4))[0]
layouts=[[],[(20,.2)],[(21,3.)],[(20,.2),(21,3.)],[(20,.2),(20,.5),(21,3.)],[(21,3.),(21,5.)]]
cases=[]
for health in [-10.,0.,25.,95.,100.,110.,float('nan')]:
 for requested in [-2.,0.,.5,5.,20.,float('nan')]:
  for absorb in [0.,25.]:
   for rows in layouts:
    for spell in [0,139]:
     u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));u.mem_write(MEM+0x418,struct.pack('<f',health));u.mem_write(MEM+0x470,struct.pack('<f',100.));u.mem_write(MEM+0x41c,struct.pack('<f',absorb));u.mem_write(MEM+0x120,struct.pack('<f',7.));u.mem_write(MEM+0x710,struct.pack('<QQ',MEM+0x2000,len(rows)))
     for i,(tag,value) in enumerate(rows):raw=bytearray(64);raw[0]=tag;struct.pack_into('<f',raw,4,value);u.mem_write(MEM+0x2000+i*64,bytes(raw))
     for reg,val in [(UC_X86_REG_RCX,MEM),(UC_X86_REG_R8,spell),(UC_X86_REG_RSP,STACK+0x7000),(UC_X86_REG_RBP,STACK+0x8000),(UC_X86_REG_XMM1,bits(requested)),(UC_X86_REG_XMM7,bits(requested)),(UC_X86_REG_MXCSR,0x1f80)]:u.reg_write(reg,val)
     u.emu_start(SPANS[0][0],0,count=10000);assert u.reg_read(UC_X86_REG_RIP)==STOPS[0]
     actual=u.reg_read(UC_X86_REG_XMM6)&0xffffffff
     for reg,val in [(UC_X86_REG_RSI,MEM),(UC_X86_REG_RDI,spell),(UC_X86_REG_XMM6,actual),(UC_X86_REG_XMM7,bits(requested))]:u.reg_write(reg,val)
     u.emu_start(SPANS[1][0],0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in STOPS[1:3]
     cases.append(dict(health_bits=bits(health),requested_bits=bits(requested),maximum_bits=bits(100.),absorb_bits=bits(absorb),pool_bits=bits(7.),rows=[dict(tag=t,value_bits=bits(v))for t,v in rows],spell_id=spell,expected=dict(health_bits=read(0x418),actual_bits=actual,absorb_bits=read(0x41c),pool_bits=read(0x120),emit_log=pc==STOPS[1],log_amount=(u.reg_read(UC_X86_REG_RAX)&0xffffffff)if pc==STOPS[1]else None)))
pulses=[]
for layout in [[],[(21,3.,12.,0)],[(30,2.,5.,1),(21,3.,12.,740)],[(21,3.,12.,0),(21,7.,22.,123)]]:
 for clock in [0.,.5,1.,float('nan')]:
  for deadline in [0.,.5,2.,float('nan')]:
   for pool in [0.,.5,1.,20.,float('nan')]:
    u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));u.mem_write(MEM+0x710,struct.pack('<QQ',MEM+0x2000,len(layout)));u.mem_write(MEM+0x934,struct.pack('<f',clock));u.mem_write(MEM+0x120,struct.pack('<ff',pool,deadline))
    for i,(tag,strength,radius,visual)in enumerate(layout):
     raw=bytearray(64);raw[0]=tag;struct.pack_into('<ffI',raw,4,strength,radius,visual);u.mem_write(MEM+0x2000+i*64,bytes(raw))
    for reg,val in [(UC_X86_REG_R13,MEM),(UC_X86_REG_RSP,STACK+0x7000),(UC_X86_REG_RBP,STACK+0x8000),(UC_X86_REG_MXCSR,0x1f80)]:u.reg_write(reg,val)
    u.emu_start(0x1454b110c,0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in STOPS[3:5]
    action=None
    if pc==STOPS[3]:
     index=u.reg_read(UC_X86_REG_RBX);visual=u.reg_read(UC_X86_REG_RDI)&0xffffffff;radius=u.reg_read(UC_X86_REG_XMM3)&0xffffffff
     u.emu_start(0x1454b1334,0,count=1);assert u.reg_read(UC_X86_REG_RIP)==STOPS[5]
     action=dict(index=index,visual=visual,radius_bits=radius,power_bits=u.reg_read(UC_X86_REG_XMM7)&0xffffffff)
    pulses.append(dict(rows=[dict(tag=t,strength_bits=bits(a),radius_bits=bits(b),visual=c)for t,a,b,c in layout],clock_bits=bits(clock),deadline_bits=bits(deadline),pool_bits=bits(pool),expected=dict(action=action,pool_bits=read(0x120),deadline_bits=read(0x124))))
batches=[]
for health in [25.,95.,100.,110.,float('nan')]:
 for regen in [0.,2.,10.,float('nan')]:
  for queued in [[],[(774,1.)],[(774,2.),(139,4.)],[(774,2.),(774,4.)]]:
   for rows in layouts:
    u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000))
    for off,value in [(0x418,health),(0x470,100.),(0x41c,3.),(0x120,7.)]:u.mem_write(MEM+off,struct.pack('<f',value))
    u.mem_write(MEM+0x710,struct.pack('<QQ',MEM+0x2000,len(rows)))
    for i,(tag,value) in enumerate(rows):raw=bytearray(64);raw[0]=tag;struct.pack_into('<f',raw,4,value);u.mem_write(MEM+0x2000+i*64,bytes(raw))
    total=0.
    for _,amount in queued:total=struct.unpack('<f',struct.pack('<f',total+amount))[0]
    u.mem_write(STACK+0x8000+0x368,struct.pack('<Q',MEM))
    for reg,val in [(UC_X86_REG_R13,MEM),(UC_X86_REG_RSP,STACK+0x7000),(UC_X86_REG_RBP,STACK+0x8000),(UC_X86_REG_XMM8,bits(total)),(UC_X86_REG_XMM9,bits(regen)),(UC_X86_REG_MXCSR,0x1f80)]:u.reg_write(reg,val)
    u.emu_start(0x1454af9fc,0,count=10000);updated=u.reg_read(UC_X86_REG_RIP)==0x1454afa4b
    u.reg_write(UC_X86_REG_XMM11,read(0x418));u.reg_write(UC_X86_REG_XMM10,bits(health));u.reg_write(UC_X86_REG_XMM9,bits(regen))
    u.emu_start(0x1454afc3c,0,count=10000);regenerated=u.reg_read(UC_X86_REG_XMM0)&0xffffffff
    credits=[]
    if total>0:
     for reg,val in [(UC_X86_REG_XMM8,bits(total)),(UC_X86_REG_XMM9,bits(regen)),(UC_X86_REG_XMM10,bits(health))]:u.reg_write(reg,val)
     u.emu_start(0x1454afccf,0,count=10000);effective=u.reg_read(UC_X86_REG_XMM7)&0xffffffff
     for spell,amount in queued:
      u.mem_write(MEM+0x3000,struct.pack('<If',spell,amount));u.reg_write(UC_X86_REG_R12,MEM+0x3000);u.reg_write(UC_X86_REG_XMM7,effective);u.reg_write(UC_X86_REG_XMM8,bits(total));u.reg_write(UC_X86_REG_XMM9,bits(0.))
      u.emu_start(0x1454afd8d,0,count=10000)
      if u.reg_read(UC_X86_REG_RIP)==0x1454afda4:credits.append(dict(spell_id=spell,amount_bits=u.reg_read(UC_X86_REG_XMM10)&0xffffffff))
     u.reg_write(UC_X86_REG_XMM7,effective);u.reg_write(UC_X86_REG_XMM8,bits(total));u.reg_write(UC_X86_REG_R13,MEM)
     u.emu_start(0x1454afe1f,0,count=10000)
    batches.append(dict(health_bits=bits(health),regeneration_bits=bits(regen),queued=[dict(spell_id=s,amount_bits=bits(a))for s,a in queued],rows=[dict(tag=t,value_bits=bits(v))for t,v in rows],expected=dict(health_bits=read(0x418),absorb_bits=read(0x41c),pool_bits=read(0x120),regeneration_bits=regenerated,credits=credits,updated=updated)))
OUT=ROOT/'docs/analysis/evidence/0.100.1/run-effects';OUT.mkdir(parents=True,exist_ok=True);owners=[]
for role,lo,hi,session in [('heal-player',0x1454a54c0,0x1454a589c,'rea-heal-player'),('heal-provenance',0x1454a0520,0x1454a08b1,'rea-healing'),('heal-meter',0x1454a53b0,0x1454a54b8,None),('lightwell-source',0x1454b46a0,0x1454b4712,None),('lightwell-bounce-source',0x1454b4aeb,0x1454b4b5d,None),('companion-source',0x1454b24bd,0x1454b2568,None),('healing-pool-pulse',0x1454b110c,0x1454b13bb,None),('healing-frame-batch',0x1454af732,0x1454aff01,None)]:
 off=pe.rva_offset(lo-pe.image_base);raw=data[off:off+hi-lo];row=dict(role=role,address=hex(lo),end_exclusive=hex(hi),file_offset=hex(off),sha256=hashlib.sha256(raw).hexdigest())
 (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(TARGET)],text=True))
 if session:
  response=ROOT/f'runtime/analysis/history/native-recovery/generic-healing/d74f4eab5d63/{session}/003-procedure_pseudo_code.json'
  if response.exists():
   ev=json.loads(response.read_text())['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==row['sha256'];assert ev['provider']['id']=='ghidra';row['rea_evidence_id']=ev['evidence_id'];row['analysis_profile']=ev['analysis_profile'];(OUT/(role+'.ghidra.c')).write_text(ev['normalized_result'])
 owners.append(row)
(OUT/'healing-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,spans=[dict(start=hex(a),end_exclusive=hex(b))for a,b in SPANS],cases=cases,pulses=pulses,batches=batches),separators=(',',':'))+'\n')
print('Recovered',len(cases),'native healing/overheal/pool cases,',len(pulses),'pool-pulse gates,',len(batches),'frame-batch cases and exact source3 Lightwell/source2 companion attribution')

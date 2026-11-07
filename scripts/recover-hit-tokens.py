#!/usr/bin/env python3
"""Bounded selected-target hit-event token producer, without external calls.

Admits only1454d8108..8258 plus its critical-token swap-remove block83c0..83db.
Stops before the generic dispatcher or on the source3/no-effects exit. No game
process, operating-system call, allocation stub or substitute token logic runs.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');pe=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in pe.sections);u.mem_map(pe.image_base,(end+4095)&~4095)
for x in pe.sections:u.mem_write(pe.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;u.mem_map(MEM,0x10000);STACK=0x300000000;u.mem_map(STACK,0x10000)
SPANS=[(0x1454d8108,0x1454d8258),(0x1454d83c0,0x1454d83db)]
STOPS=[0x1454d816a,0x1454d8258]
def hook(_,address,size,unused):
 if address in STOPS:u.emu_stop()
 elif not any(a<=address<b for a,b in SPANS):raise RuntimeError('Unreviewed instruction '+hex(address))
u.hook_add(UC_HOOK_CODE,hook)
spell,other=585,133
vectors=[[],[other],[spell],[spell,other],[other,spell]]
cases=[]
for enabled in [False,True]:
 for source in range(4):
  for critical in [False,True]:
   for periodic in [False,True]:
    for first in vectors:
     for crit in vectors:
      u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));game=bytearray(0x800);game[0x128]=periodic;game[0x129]=source
      struct.pack_into('<QQ',game,0xe8,MEM+0x1000,len(first));struct.pack_into('<QQ',game,0x100,MEM+0x2000,len(crit));struct.pack_into('<Q',game,0x718,int(enabled));u.mem_write(MEM,bytes(game))
      u.mem_write(MEM+0x1000,struct.pack('<'+'I'*len(first),*first));u.mem_write(MEM+0x2000,struct.pack('<'+'I'*len(crit),*crit));frame=STACK+0x8000;u.mem_write(frame+0x290,bytes([2]));u.mem_write(frame+0x298,bytes([critical]))
      for reg,val in [(UC_X86_REG_RSI,MEM),(UC_X86_REG_RBP,frame),(UC_X86_REG_RBX,spell),(UC_X86_REG_RDI,0x1234),(UC_X86_REG_RSP,STACK+0x7000),(UC_X86_REG_R12,0),(UC_X86_REG_R15,0),(UC_X86_REG_MXCSR,0x1f80)]:u.reg_write(reg,val)
      u.emu_start(SPANS[0][0],0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in STOPS
      read=lambda off:struct.unpack('<Q',u.mem_read(MEM+off,8))[0]
      remaining=lambda ptr,count:list(struct.unpack('<'+'I'*count,u.mem_read(ptr,count*4)))
      event=None
      if pc==STOPS[1]:
       raw=bytes(u.mem_read(frame+0x88,35));event=dict(spell_id=struct.unpack_from('<I',raw,8)[0],school=raw[28],kind=raw[29],source_kind=raw[30],critical=raw[31],first_hit=raw[32],first_critical=raw[33],first_periodic=raw[34])
      cases.append(dict(enabled=enabled,source=source,critical=critical,periodic_flag=periodic,first_tokens=first,critical_tokens=crit,event=event,remaining_first=remaining(MEM+0x1000,read(0xf0)),remaining_critical=remaining(MEM+0x2000,read(0x108))))
out=ROOT/'docs/analysis/evidence/0.100.1/treasure-interface';spans=[]
for lo,hi in SPANS:
 off=pe.rva_offset(lo-pe.image_base);raw=data[off:off+hi-lo];spans.append(dict(start=hex(lo),end_exclusive=hex(hi),file_offset=hex(off),sha256=hashlib.sha256(raw).hexdigest()))
 (out/f'hit-token-{lo:x}.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],text=True))
(out/'hit-token-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,native_spans=spans,spell_id=spell,other_spell_id=other,cases=cases),separators=(',',':'))+'\n')
print('Recovered',len(cases),'native token producer cases; source0/1/2/3, enabled/disabled, critical, periodic flag and both ordered token vectors')

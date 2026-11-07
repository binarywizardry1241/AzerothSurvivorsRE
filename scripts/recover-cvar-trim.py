#!/usr/bin/env python3
"""Replay the complete selected-PE Unicode trim helper without imported calls."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import sys, struct, json, hashlib
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64
from unicorn.x86_const import *
m = load_script('iv', R/'scripts/inventory-executable.py')
d=(R/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(d).hexdigest()=='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
u.mem_map(0x200000,0x10000);out=[]
inputs=['','1','0',' 1 ','\t\r\n1\n\r\t',' 0.0 ','00','01','2','false','1 0']
for ch in [0x09,0x0a,0x0b,0x0c,0x0d,0x20,0x85,0xa0,0x1680,*range(0x2000,0x200b),0x2028,0x2029,0x202f,0x205f,0x3000,0x180e,0x200b,0xfeff,0x1c,0x1d,0x1e,0x1f]:
 inputs.append(chr(ch)+'1'+chr(ch))
 inputs.append(chr(ch)+'0'+chr(ch))
for value in inputs:
 raw=value.encode();u.mem_write(0x201000,raw+bytes(8));u.reg_write(UC_X86_REG_RCX,0x201000);u.reg_write(UC_X86_REG_RDX,len(raw));u.reg_write(UC_X86_REG_RSP,0x208000);u.mem_write(0x208000,struct.pack('<Q',0x200000));u.emu_start(0x1400a4890,0x200000,count=10000)
 ptr=u.reg_read(UC_X86_REG_RAX);n=u.reg_read(UC_X86_REG_RDX);trim=bytes(u.mem_read(ptr,n)).decode()
 out.append(dict(input=value,trimmed=trim,store_or_spend=trim=='1',hud=trim!='0'))
(R/'docs/analysis/evidence/0.100.1/target-menu/cvar-trim-native.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),entry='0x1400a4890',end='0x1400a4b09',method='Complete original helper instructions; return address/input UTF8/stack explicitly supplied, no imported calls or arithmetic shims.',cases=out),indent=2,ensure_ascii=True)+'\n')
print(len(out),'original trim cases; non-trimmed whitespace candidates:',[hex(ord(x['input'][0]))for x in out[11::2]if x['trimmed']!= '1'])

import subprocess
def span(a,n):
 o=p.rva_offset(a-p.image_base);raw=d[o:o+n];return dict(address=hex(a),file_offset=hex(o),byte_count=n,sha256=hashlib.sha256(raw).hexdigest())
O=R/'docs/analysis/evidence/0.100.1/target-menu'
(O/'cvar-trim.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn','--start-address=0x1400a4890','--stop-address=0x1400a4b09',str(R/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],cwd=R,text=True).replace(str(R)+'/', ''))
(O/'cvar-trim-proof.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),helper=span(0x1400a4890,0x279),whitespace_table=span(0x146d6a47f,256),table_pointer=span(0x147a37e60,8),cases=len(out),comparison='Rust str::trim Unicode White_Space matches all75 native cases; Python strip differs for001C..001F.',target_executed=False),indent=2)+'\n')

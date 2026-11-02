#!/usr/bin/env python3
"""Bounded original-instruction replay; no application or network execution."""
import hashlib,json,struct,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
if not (ROOT/'scripts').is_dir():
    ROOT=next(p for p in Path(__file__).resolve().parents if (p/'scripts/coverage_common.py').is_file())
sys.path.insert(0,str(ROOT/'scripts'))
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as reg
SHA='291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
t=latest_target(verify=True);assert t['sha256']==SHA
blob=target_bytes(t);pe=load_script('pe',ROOT/'scripts/inventory-executable.py').PE(blob)
ranges=[(0x145af28a0,0x145af297a),(0x145af29b0,0x145af2a8a)]
u=Uc(UC_ARCH_X86,UC_MODE_64);pages=set()
for a,b in ranges:
    for page in range(a&~4095,(b+4095)&~4095,4096):
        if page not in pages:
            u.mem_map(page,4096);off=pe.rva_offset(page-pe.image_base);u.mem_write(page,blob[off:off+4096]);pages.add(page)
H=0x200000000;u.mem_map(H,0x200000);u.mem_map(0x14852b000,4096)
wrapper,obj,vt,callback,stop,global_data,stack=(H+x for x in [0x1000,0x2000,0x3000,0x4000,0x5000,0x6000,0x70000])
put=lambda a,v:u.mem_write(a,struct.pack('<Q',v))
put(0x14852bb78,global_data);put(global_data,0)
state=0;calls=0;instructions=0

def hook(cpu,pc,size,unused):
    global calls,instructions
    if pc==stop:cpu.emu_stop();return
    if pc==callback:
        calls+=1;assert cpu.reg_read(reg.UC_X86_REG_RCX)==obj+0x500
        cpu.reg_write(reg.UC_X86_REG_RAX,state)
        sp=cpu.reg_read(reg.UC_X86_REG_RSP);cpu.reg_write(reg.UC_X86_REG_RIP,struct.unpack('<Q',cpu.mem_read(sp,8))[0]);cpu.reg_write(reg.UC_X86_REG_RSP,sp+8);return
    assert any(a<=pc and pc+size<=b for a,b in ranges),hex(pc)
    instructions+=1
u.hook_add(UC_HOOK_CODE,hook)
cases=[]
for present in [False,True]:
    for primary_state in [0,1,2]:
        for state in [0,1,2]:
            for entry,closed in [(ranges[0][0],True),(ranges[1][0],False)]:
                u.mem_write(obj,bytes(0x600));put(wrapper,obj);put(obj+0x88,obj+0x500);put(obj+0x90,vt)
                u.mem_write(obj+0xa0,struct.pack('<i',0 if present else -1));put(vt+0x28,callback)
                # Primary's transport slots (+a8/+b0) deliberately vary and are
                # never read by either bounded selected-secondary predicate.
                put(obj+0xa8,primary_state);put(obj+0xb0,primary_state)
                put(stack,stop);u.reg_write(reg.UC_X86_REG_RSP,stack);u.reg_write(reg.UC_X86_REG_RCX,wrapper)
                calls=0;u.emu_start(entry,0,count=1000);assert u.reg_read(reg.UC_X86_REG_RIP)==stop
                actual=bool(u.reg_read(reg.UC_X86_REG_RAX)&255)
                expected=present and ((state==2) if closed else (state!=2))
                assert actual==expected and calls==int(present)
                cases.append(dict(present=present,primary_state=primary_state,secondary_state=state,predicate='closed'if closed else'alive',result=actual))
print(json.dumps(dict(target_sha256=SHA,native_cases=len(cases),native_instructions=instructions,callback_seam='transport state byte; ordinary unpoisoned lock only',source_executed=False,target_executed=False,network_executed=False,cases=cases),indent=2))

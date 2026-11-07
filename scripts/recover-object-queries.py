#!/usr/bin/env python3
"""Retain current object template selector/name/packet evidence.

Unicorn executes bounded unchanged instructions. Name construction stops before
Rust formatting/localization. Packet construction starts with sufficient buffer
capacity and an empty name, admitting no allocation/copy/external calls.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
exe = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
data = exe.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
m = load_script('inventory', ROOT / 'scripts/inventory-executable.py'); pe = m.PE(data)
u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for s in pe.sections:
    u.mem_write(pe.image_base+s['rva'], data[s['raw_offset']:s['raw_offset']+s['raw_size']])
MEM, STACK = 0x200000000, 0x300000000
u.mem_map(MEM, 0x10000); u.mem_map(STACK, 0x10000)
SPANS = [(0x145444b41, 0x145444b72), (0x1454208a7, 0x145420a86),
         (0x14546536b, 0x145465d20)]
STOPS = [0x145444b72, 0x1454208e9, 0x145465d1d]
def hook(_, pc, size, unused):
    if pc in STOPS: u.emu_stop()
    elif not any(lo <= pc < hi for lo, hi in SPANS):
        raise RuntimeError('Unreviewed instruction '+hex(pc))
u.hook_add(UC_HOOK_CODE, hook)
def reset():
    u.mem_write(MEM, bytes(0x10000)); u.mem_write(STACK, bytes(0x10000))
    u.reg_write(UC_X86_REG_RBP, STACK+0x7000); u.reg_write(UC_X86_REG_RSP, STACK+0x8000)
def run(start, stop):
    u.emu_start(start, 0, count=10000)
    assert u.reg_read(UC_X86_REG_RIP) == stop
cases = []
for entry in [0, 9000, *range(9001,9015), 0xffffffff]:
    reset(); u.reg_write(UC_X86_REG_RBX, entry)
    run(0x145444b41, 0x145444b72)
    kind = u.reg_read(UC_X86_REG_R14) & 0xffffffff
    display = u.reg_read(UC_X86_REG_R15) & 0xffffffff
    reset(); u.reg_write(UC_X86_REG_RCX, entry)
    run(0x1454208a7, 0x1454208e9)
    ptr, length = struct.unpack('<QQ', u.mem_read(STACK+0x7000-0x18, 16))
    suffix = bytes(u.mem_read(ptr,length)).decode()
    # The selected PE format literal at14672ba57 is the explicit prefix.
    prefix = data[pe.rva_offset(0x14672ba57-pe.image_base):][:7].decode()
    assert prefix == 'object.'
    reset(); bp = STACK+0x7000; output = MEM+0x1000; buf = MEM+0x2000
    u.mem_write(bp-0x30, struct.pack('<QQQH',1024,buf,8,0x5f))
    u.mem_write(buf,struct.pack('<II',entry,kind))
    u.mem_write(bp+0x50,struct.pack('<QQ',MEM,0))
    u.reg_write(UC_X86_REG_RSI,output);u.reg_write(UC_X86_REG_RBX,display)
    u.reg_write(UC_X86_REG_RAX,8);u.reg_write(UC_X86_REG_RCX,1)
    run(0x14546536b,0x145465d1d)
    cap, ptr, length = struct.unpack('<QQQ',u.mem_read(output,24))
    raw = bytes(u.mem_read(ptr,length)); assert length == 113
    assert raw[:12] == struct.pack('<III',entry,kind,display)
    assert raw[12:] == bytes(101)
    cases.append(dict(entry=entry,type_id=kind,display_id=display,key=prefix+suffix,
                      empty_name_packet=raw.hex(),data=[0]*24))
OUT=ROOT/'docs/analysis/evidence/object-queries';OUT.mkdir(parents=True,exist_ok=True)
ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()};owners=[]
for role,start,stop in [('query-name',0x145420890,ends[0x145420890]),
                        ('query-packet',0x145465300,ends[0x145465300]),
                        ('query-entry',0x145444b14,0x145444bb3)]:
    at=pe.rva_offset(start-pe.image_base);raw=data[at:at+stop-start]
    owner=dict(role=role,start=hex(start),end_exclusive=hex(stop),sha256=hashlib.sha256(raw).hexdigest())
    (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',f'--stop-address={stop:#x}',str(exe)],text=True))
    path=ROOT/'runtime/analysis/history/native-recovery/cache-query/881dec4b36ce'/('rea-'+role)/'003-procedure_pseudo_code.json'
    if path.exists():
        ev=json.loads(path.read_text())['response']['result']['structuredContent']
        assert ev['subject']['digest']['sha256']==owner['sha256'];owner['rea']=ev
        (OUT/(role+'.ghidra.c')).write_text('\n'.join(s.rstrip() for s in ev['normalized_result'].splitlines()).strip()+'\n')
    owners.append(owner)
(OUT/'native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,cases=cases),indent=2)+'\n')
print(f'Recovered {len(cases)} native template/name/empty-name packet cases; no external calls')

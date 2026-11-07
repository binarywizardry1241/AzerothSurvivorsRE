#!/usr/bin/env python3
"""Retain current world tuning and unchanged native HP-factor instruction results.

No reference process is launched. Only two reviewed no-call instruction ranges
run with synthetic registers/memory. Remaining constructor arithmetic retains
its separately documented historical provenance.
"""
from native_recovery import bits as _shared_bits
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, sys
ROOT = Path(__file__).resolve().parents[1]
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
data = (ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
iv = load_script('inventory', ROOT/'scripts/inventory-executable.py'); pe = iv.PE(data)
def raw(address, size):
    offset = pe.rva_offset(address-pe.image_base)
    return data[offset:offset+size]
def span(address, size):
    b = raw(address, size)
    return dict(address=hex(address), file_offset=hex(pe.rva_offset(address-pe.image_base)),
                size=size, bytes_hex=b.hex(), sha256=hashlib.sha256(b).hexdigest())
def bits(value):
    return _shared_bits(value)
def text(address, size): return raw(address, size).decode()
zones=[]; bosses=[]
for i in range(12):
    address = 0x146733518+i*240
    b = raw(address,240); key = text(*struct.unpack_from('<QQ',b,8))
    zones.append(dict(key=key, bonus_bits=struct.unpack_from('<I',b,228)[0], source=span(address+228,4)))
    if key == 'naxx':
        pointer,count=struct.unpack_from('<QQ',b,136)
        assert count==5
        for j in range(count):
            record=raw(pointer+j*88,88)
            bosses.append(dict(id=struct.unpack_from('<I',record,48)[0],
                scale_bits=struct.unpack_from('<I',record,56)[0], source=span(pointer+j*88,88)))
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
u=Uc(UC_ARCH_X86,UC_MODE_64)
end=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
u.mem_map(pe.image_base,(end+4095)&~4095)
for s in pe.sections: u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
MEM=0x200000000; u.mem_map(MEM,4096)
ranges=[(0x1454d4384,0x1454d4397),(0x1454d4512,0x1454d453f)]
def hook(_,a,size,unused):
    if not any(start<=a<end for start,end in ranges): raise RuntimeError('Unreviewed instruction '+hex(a))
u.hook_add(UC_HOOK_CODE,hook)
cases=[]
clocks=[bits(x) for x in [-120.,0.,1.,600.,1199.9999,1200.,1800.]]+[0x7f800000,0x7fc00000]
for zone in zones:
    for clock in clocks:
        u.mem_write(MEM+0x934,struct.pack('<I',clock)); u.reg_write(UC_X86_REG_RSI,MEM)
        u.reg_write(UC_X86_REG_MXCSR,0x1f80)
        u.reg_write(UC_X86_REG_XMM2,bits(1.)); u.reg_write(UC_X86_REG_XMM14,zone['bonus_bits'])
        u.reg_write(UC_X86_REG_XMM10,0); u.reg_write(UC_X86_REG_XMM15,0)
        for start,end in ranges: u.emu_start(start,end,count=100)
        cases.append(dict(zone=zone['key'],clock_bits=clock,result_bits=u.reg_read(UC_X86_REG_XMM14)&0xffffffff))
out=ROOT/'docs/analysis/evidence/0.100.1/world-tuning.json'
out.write_text(json.dumps(dict(target_sha256=SHA,method=__doc__,
    owners=[span(a,z-a) for a,z in ranges], constants=[span(0x1459158a4,4),span(0x1459158d8,4)],
    zones=zones,naxx_bosses=bosses,cases=cases,
    limits=['HP factor and five scale words only; not a complete constructor or world/runtime parity result.']),indent=2)+'\n')
print('Recovered',len(cases),'native HP-factor cases and',len(bosses),'Naxxramas records')

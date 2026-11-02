#!/usr/bin/env python3
"""Execute only unchanged 0.97.2 lair/RNG instructions in a bounded emulator."""
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
data = TARGET.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
pe = inventory.PE(data)
uc = Uc(UC_ARCH_X86, UC_MODE_64)
size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
uc.mem_map(pe.image_base, (size + 4095) & ~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
GAME, LAIRS = 0x200000000, 0x200001000
uc.mem_map(GAME, 0x4000)
RANGES = {"due": (0x1454a987c, 0x1454a98b1),
          "death": (0x1454c4235, 0x1454c4278),
          "facing": (0x1454a99bf, 0x1454a9a41)}
kind, stops = None, set()

def hook(_, address, size, __):
    if address in stops:
        uc.emu_stop()
    elif not (RANGES[kind][0] <= address < RANGES[kind][1]):
        raise RuntimeError(f"Out-of-scope native instruction {address:x}")

uc.hook_add(UC_HOOK_CODE, hook)
def bits(value): return struct.unpack("<I", struct.pack("<f", value))[0]
def putq(a,v): uc.mem_write(a,struct.pack("<Q",v))
def putu(a,v): uc.mem_write(a,struct.pack("<I",v))
def getu(a): return struct.unpack("<I",uc.mem_read(a,4))[0]
def execute(which, endpoints):
    global kind, stops
    kind, stops = which, set(endpoints)
    uc.reg_write(UC_X86_REG_EFLAGS, 2)
    uc.reg_write(UC_X86_REG_MXCSR, 0x1f80)
    uc.emu_start(RANGES[which][0], 0, count=1000)
    assert uc.reg_read(UC_X86_REG_RIP) in stops
    return uc.reg_read(UC_X86_REG_RIP)

due=[]
for active,clock,deadline in [(0,0,0),(0,179.999,180),(0,180,180),(0,1000,180),
                             (1,180,180),(1,1000,180),(0,float('nan'),0),(0,0,float('nan'))]:
    uc.mem_write(GAME,bytes(0x4000));putq(GAME+0x588,LAIRS);putq(GAME+0x590,1)
    putu(GAME+0x8e4,bits(clock));putq(LAIRS,active);putu(LAIRS+0x24,bits(deadline))
    uc.reg_write(UC_X86_REG_R13,GAME);uc.reg_write(UC_X86_REG_R14,0)
    end=execute('due',[0x1454a9870,0x1454a98b1])
    due.append(dict(active=bool(active),clock_bits=bits(clock),deadline_bits=bits(deadline),spawn=end==0x1454a98b1))
death=[]
for index,kills,clock in [(0,0,0),(0,3,120),(1,4,600),(8,10,42),(0,0xffffffff,1.25)]:
    uc.mem_write(GAME,bytes(0x4000));putq(GAME+0x588,LAIRS);putq(GAME+0x590,1)
    putq(LAIRS,1);putu(LAIRS+0x24,bits(999));putu(GAME+0x664,kills);putu(GAME+0x8e4,bits(clock))
    uc.reg_write(UC_X86_REG_RSI,GAME);uc.reg_write(UC_X86_REG_RBP,GAME+0x2000)
    putq(GAME+0x2070,index)
    execute('death',[0x1454c4278])
    death.append(dict(lair_index=index,kills=kills,clock_bits=bits(clock),kills_after=getu(GAME+0x664),
                      active_after=bool(getu(LAIRS)),deadline_bits=getu(LAIRS+0x24)))
facing=[]
for state in [[1,2,3,4],[0x123456789abcdef,0xfedcba9876543210,0xabcd,0x6d23],
              [0xffffffffffffffff,0xffffffffffffffff,0xffffffffffffffff,0xffffffffffffffff]]:
    for i,value in enumerate(state):putq(GAME+0x880+i*8,value)
    uc.reg_write(UC_X86_REG_RSI,GAME);uc.reg_write(UC_X86_REG_R13,GAME)
    uc.reg_write(UC_X86_REG_XMM9,bits(-1));uc.reg_write(UC_X86_REG_XMM10,0x40c90fdb)
    execute('facing',[0x1454a9a41])
    facing.append(dict(state=state,state_after=list(struct.unpack('<QQQQ',uc.mem_read(GAME+0x880,32))),
                       facing_bits=uc.reg_read(UC_X86_REG_XMM12)&0xffffffff))
result=dict(version='0.97.2',target_sha256=SHA,ranges={k:[hex(a),hex(b)] for k,(a,b) in RANGES.items()},
            method='Unchanged x86-64 instructions; all external instructions/calls rejected; no OS/game process execution.',
            due=due,death=death,facing=facing)
path=ROOT/'crates/azeroth-survivors-re/tests/fixtures/guardian-lifecycle-native.json'
path.write_text(json.dumps(result,indent=2,allow_nan=False)+'\n')
print(f'{len(due)} due, {len(death)} death, {len(facing)} facing cases; SHA256 {hashlib.sha256(path.read_bytes()).hexdigest()}')

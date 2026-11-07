#!/usr/bin/env python3
"""Bounded native actor aura slots/application words and retained packet owners.

No EXE process is launched. Unicorn executes only original selected-target
slot-selection/application instructions, without any external call stubs.
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
exe=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe';data=exe.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');p=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;STACK=0x300000000;u.mem_map(MEM,0x10000);u.mem_map(STACK,0x10000)
SPANS=[(0x1454e35c2,0x1454e38e9),(0x1454506a0,0x145450a1f),
 (0x145497900,0x145497a59),(0x145487350,0x1454875df),(0x14549f685,0x14549f796),
 (0x1454e4053,0x1454e4080),(0x1454e41c4,0x1454e4274),(0x14544411a,0x1454446d3),
 (0x145444a13,0x145444a1c),(0x14544518a,0x1454451c4),
 (0x1454451e2,0x14544520b),(0x1454453cb,0x1454453d9)]
STOPS=[0x1454e38e9,0x1454e3c16,MEM+0xf000,0x14549f89b,0x1454e4080,0x1454e41b8,0x145447a82,
 0x1454451c4,0x1454ee470,0x1454f0640]
def hook(_,address,size,unused):
 if address in STOPS:u.emu_stop()
 elif not any(lo<=address<hi for lo,hi in SPANS):raise RuntimeError('Unreviewed instruction '+hex(address))
u.hook_add(UC_HOOK_CODE,hook)
def reset():
 u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));u.reg_write(UC_X86_REG_MXCSR,0x1f80)
 u.reg_write(UC_X86_REG_RSP,STACK+0x8000);u.reg_write(UC_X86_REG_RBP,STACK+0x7000)
 u.mem_write(STACK+0x8000,struct.pack('<Q',MEM+0xf000))
slots=[]
layouts=[[0]*16,list(range(1,17)),[1,0,2,0]+[0]*12,[7]*16,[1,2,3,4]*4]
for initial in layouts:
 for spell in [0,1,2,7,16,17]:
  for present in [False,True]:
   reset();actor=MEM+0x1000;u.mem_write(actor+0xb0,struct.pack('<16I',*initial))
   for reg,val in [(UC_X86_REG_RSI,actor),(UC_X86_REG_RCX,MEM),(UC_X86_REG_R8,spell),(UC_X86_REG_R9,int(present))]:u.reg_write(reg,val)
   u.emu_start(SPANS[0][0],0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in STOPS
   slots.append(dict(initial=initial,spell=spell,present=present,changed=pc==STOPS[0],expected=list(struct.unpack('<16I',u.mem_read(actor+0xb0,64)))))
applications=[]
spell_layout=[1,2,0,3,4,1,2,0,0,0,0,0,1,1,2,3]
row_sets=[[],[dict(spell=1,owner_kind=0,remaining=1)],[dict(spell=1,owner_kind=1,remaining=1)],
 [dict(spell=1,owner_kind=0,remaining=1)]*2+[dict(spell=1,owner_kind=1,remaining=1)]*4,
 [dict(spell=1,owner_kind=0,remaining=0)]*3+[dict(spell=1,owner_kind=1,remaining=1)]*4,
 [dict(spell=1,owner_kind=0,remaining=1)]*257,
 [dict(spell=spell,owner_kind=owner,remaining=remaining)for spell in [1,2,3,4]for owner in [0,1]for remaining in [0,1]],
 [dict(spell=2,owner_kind=1,remaining=2)]*3+[dict(spell=3,owner_kind=0,remaining=2)]*4]
for rows in row_sets:
 for group in range(4):
  reset();actor=MEM+0x1000;ptr=MEM+0x2000;u.mem_write(actor+0xb0,struct.pack('<16I',*spell_layout));u.mem_write(actor+8,struct.pack('<QQ',ptr,len(rows)))
  for i,row in enumerate(rows):
   raw=bytearray(48);struct.pack_into('<Q',raw,0,row['owner_kind']);struct.pack_into('<I',raw,16,row['spell']);struct.pack_into('<I',raw,32,row['remaining']);u.mem_write(ptr+i*48,bytes(raw))
  u.reg_write(UC_X86_REG_RCX,actor);u.reg_write(UC_X86_REG_RDX,group);u.emu_start(SPANS[1][0],0,count=100000);assert u.reg_read(UC_X86_REG_RIP)==MEM+0xf000
  applications.append(dict(spells=spell_layout,group=group,periodic=rows,expected=u.reg_read(UC_X86_REG_RAX)&0xffffffff))
player_flags=[]
for group in range(6):
 for mask in range(256):
  reset();context=MEM+0x100;group_ptr=MEM+0x200;ptr=MEM+0x1000
  u.mem_write(context,struct.pack('<QQQ',group_ptr,ptr,48));u.mem_write(group_ptr,struct.pack('<Q',group))
  for bit in range(8):
   if mask&(1<<bit):u.mem_write(ptr+(group*8+bit)*16,struct.pack('<IIII',1,bit+1,0,1))
  u.reg_write(UC_X86_REG_RCX,context);u.emu_start(0x145497900,0,count=10000);assert u.reg_read(UC_X86_REG_RIP)==MEM+0xf000
  player_flags.append(dict(group=group,mask=mask,expected=u.reg_read(UC_X86_REG_RAX)&0xffffffff))
player_applications=[]
for group in range(12):
 for present in [0,1,5,10,15]:
  for counts in [[0,0,0,0],[1,2,3,4],[254,255,256,0xffffffff]]:
   reset();ptr=MEM+0x1000
   for bit,count in enumerate(counts):
    if present&(1<<bit):u.mem_write(ptr+(group*4+bit)*16,struct.pack('<IIII',1,bit+1,0,count))
   u.reg_write(UC_X86_REG_R13,ptr);u.reg_write(UC_X86_REG_R14,group);u.reg_write(UC_X86_REG_R12,0)
   u.emu_start(0x14549f685,0,count=10000);assert u.reg_read(UC_X86_REG_RIP)==0x14549f89b
   player_applications.append(dict(group=group,present=present,counts=counts,expected=u.reg_read(UC_X86_REG_R8)&0xffffffff))
aliases=[]
for name in ['Flurry','Last Stand','Reincarnation','Fortified','Shield Mastery','Ardent Defender','Cheat Death','Blessed Life','Divine Intervention','Unmapped','flurry','Fortified!']:
 for kind in range(3):
  reset();u.mem_write(MEM,name.encode());u.reg_write(UC_X86_REG_RCX,MEM);u.reg_write(UC_X86_REG_RDX,len(name));u.reg_write(UC_X86_REG_R8,kind)
  u.emu_start(0x145487350,0,count=10000);assert u.reg_read(UC_X86_REG_RIP)==MEM+0xf000
  aliases.append(dict(name=name,kind=kind,expected=u.reg_read(UC_X86_REG_RAX)&0xffffffff))
application_updates=[]
for initial in layouts:
 for spell in [0,1,2,7,16,17]:
  reset();actor=MEM+0x1000;u.mem_write(actor+0xb0,struct.pack('<16I',*initial))
  u.reg_write(UC_X86_REG_RCX,actor);u.reg_write(UC_X86_REG_R8,spell)
  u.emu_start(0x1454e4053,0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in [0x1454e4080,0x1454e41b8]
  application_updates.append(dict(initial=initial,spell=spell,group=u.reg_read(UC_X86_REG_RSI) if pc==0x1454e4080 else None))
cancel_aura=[]
for size in [0,1,3,4,8,65535]:
 reset();game=MEM+0x1000;before=bytes(u.mem_read(game,0x1100))
 for reg,value in [(UC_X86_REG_R8,0x136),(UC_X86_REG_R12,size),(UC_X86_REG_RSI,game),
                   (UC_X86_REG_RDI,0),(UC_X86_REG_RBX,MEM+0x4000)]:u.reg_write(reg,value)
 u.emu_start(0x14544411a,0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc==0x145447a82
 assert bytes(u.mem_read(game,0x1100))==before
 cancel_aura.append(dict(opcode=0x136,payload_size=size,jump_table='0x14673eabc',
  jump_index=0x136-0x10a,case='0x145444697',stop=hex(pc),game_unchanged=True))
cast_requests=[]
for payload in [b'',bytes.fromhex('34'),bytes.fromhex('3412'),bytes.fromhex('341256'),
                bytes.fromhex('34125678'),bytes.fromhex('3412567899aa'),bytes.fromhex('ffffffff')]:
 reset();u.mem_write(MEM+0x4000,payload);u.reg_write(UC_X86_REG_RBX,MEM+0x4000);u.reg_write(UC_X86_REG_R12,len(payload))
 u.emu_start(0x145444546,0,count=10000);assert u.reg_read(UC_X86_REG_RIP)==0x1454451c4
 cast_requests.append(dict(payload=payload.hex(),spell_id=u.reg_read(UC_X86_REG_RDX)&0xffffffff,
  reason=u.reg_read(UC_X86_REG_R8)&255,packet_opcode=0x130,status=2))
cast_phases=[]
for state in [0,1,2]:
 for phase in range(6):
  reset();root=MEM+0x1000;u.mem_write(root+0x10,struct.pack('<I',state));u.mem_write(root+0x9c9,bytes([phase]));u.reg_write(UC_X86_REG_RSI,root)
  u.emu_start(0x1454451e2,0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in [0x145447a82,0x1454ee470,0x1454f0640]
  cast_phases.append(dict(core_state=state,phase=phase,next_owner=hex(pc)))
OUT=ROOT/'runtime/analysis/staging/native-evidence/run-presentation';OUT.mkdir(parents=True,exist_ok=True);owners=[]
for role,lo,hi in [('actor-aura',0x1454e3550,0x1454e3c2a),('aura-applications',0x1454506a0,0x145450a1f),('spell-go',0x145466ab0,0x145466f0b),('direct-damage',0x14545f6d0,0x14545f9e6),('periodic-damage',0x145464140,0x1454643a4),('actor-hit-log-gate',0x1454d57cf,0x1454d58ab),('actor-periodic-log',0x1454de810,0x1454de916),('direct-heal',0x14545d980,0x14545db34),('player-aura',0x14549e650,0x14549fa40),('player-aura-flags',0x145497900,0x145497a59),('player-aura-alias',0x145487350,0x1454875df),('player-aura-generic',0x14549b830,0x14549b980),('player-aura-active',0x145538730,0x1455388a9),('appearance',0x1454e75f0,0x1454e77f8),('stopped-movement',0x14545ff20,0x145460030),('aura-applications-publisher',0x1454e3ff0,0x1454e4274),
 ('melee-damage',0x14545c690,0x14545cba2),
 ('incoming-melee-log',0x1454de373,0x1454de405),
 ('incoming-instant-spell',0x1454df26a,0x1454df360),
 ('incoming-area-spell',0x1454b5ba2,0x1454b5c94),
 ('cancel-aura-writer',0x14558a7c0,0x14558a897),
 ('cancel-aura-dispatch',0x14544411a,0x1454446d3),
 ('received-packet-consumer',0x14543fce0,0x14543fd6d),
 ('manual-cast-arguments',0x14544518a,0x14544520b),
 ('cast-result',0x14545a870,0x14545a92e)]:
 off=p.rva_offset(lo-p.image_base);raw=data[off:off+hi-lo];owners.append(dict(role=role,start=hex(lo),end_exclusive=hex(hi),file_offset=hex(off),sha256=hashlib.sha256(raw).hexdigest()))
 (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(exe)],text=True))
(OUT/'aura-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,slots=slots,applications=applications,application_updates=application_updates),separators=(',',':'))+'\n')
(OUT/'player-aura-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,flags=player_flags,applications=player_applications,aliases=aliases),separators=(',',':'))+'\n')
(OUT/'cancel-aura-native.json').write_text(portable_json(dict(target_sha256=SHA,
 method='Unchanged incoming1454440d0 opcode-dispatch instructions; no calls admitted; game memory checked unchanged.',
 cases=cancel_aura,limitations=['This bounds the exact native server dispatch; it does not prove absence of a separate indirect client request interceptor.']),indent=2)+'\n')
(OUT/'manual-cast-native.json').write_text(portable_json(dict(target_sha256=SHA,
 method='Unchanged received CastSpell12e argument and postfailure phase instructions, stopping before native callees.',
 requests=cast_requests,phase_actions=cast_phases),indent=2)+'\n')
print('Recovered',len(slots),'native aura-slot cases and',len(applications),'application-word cases')
print('Recovered',len(player_flags),'player flag words,',len(player_applications),'player application words and',len(aliases),'native aliases')

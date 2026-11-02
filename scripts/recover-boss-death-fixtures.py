#!/usr/bin/env python3
"""Bounded unchanged 0.97.2 boss-death/XP-attraction/completion oracle.

No game launch. Localization, messages/JSON, pickup creation, equipment
candidate generation, allocation, and completion side effects are explicit
stubs. Primary native control flow, counts, reward amounts/positions, due-head
magnet removal, final-phase writes and deferred victory gates run unchanged.
"""
from pathlib import Path
import hashlib,importlib.util,json,struct,sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
EXPECTED='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==EXPECTED
spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py');inv=importlib.util.module_from_spec(spec);spec.loader.exec_module(inv);pe=inv.PE(data)
uc=Uc(UC_ARCH_X86,UC_MODE_64);size=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections);uc.mem_map(pe.image_base,(size+4095)&~4095)
for s in pe.sections:uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
GAME,EVENTS,ACCOUNTS,ACTORS,CANDIDATES,MAGNETS,PICKUPS,MOVES,HEAP=0x200000000,0x200002000,0x200003000,0x200004000,0x200008000,0x200009000,0x20000a000,0x20000c000,0x20000e000
STACK,FRAME=0x300000000,0x300010000
uc.mem_map(GAME,0x20000);uc.mem_map(STACK,0x20000)
RANGES={'death':[(0x1454c41d3,0x1454c422b),(0x1454c44dd,0x1454c487e),(0x1454c48c1,0x1454c48d6),(0x1454c4922,0x1454c4af9)],
        'completion':[(0x1454aa103,0x1454aa235)],'attraction':[(0x1454d23c5,0x1454d24fb)],
        'meter_begin':[(0x1454c35ee,0x1454c3668)],'meter_timing':[(0x145498ab1,0x145498ac0)],'meter_empty':[(0x1454988e5,0x1454988f5)]}
STOPS={'death':0x1454c4d46,'completion':0x1454aa235,'attraction':0x1454d24fb,'meter_begin':0x1454c3668,'meter_timing':0x145498ac0,'meter_empty':0x1454988f5}
active,zone_index,definition,events,pickups,equipment_calls= 'death',0,0,[],[],[]
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def putu(a,v):uc.mem_write(a,struct.pack('<I',v))
def putq(a,v):uc.mem_write(a,struct.pack('<Q',v))
def readu(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
def readq(a):return struct.unpack('<Q',uc.mem_read(a,8))[0]
def ret():
 sp=uc.reg_read(UC_X86_REG_RSP);uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,readq(sp))
def vector(a):putq(a,0);putq(a+8,HEAP);putq(a+16,0)
def hook(_,a,size,__):
 if a==STOPS[active] or (active=='meter_empty' and a==0x14549898b):uc.emu_stop()
 elif any(x<=a<y for x,y in RANGES[active]):return
 elif a==0x14540e4a0:uc.reg_write(UC_X86_REG_RAX,readq(definition));uc.reg_write(UC_X86_REG_RDX,readq(definition+8));ret()
 elif a==0x145452400:uc.reg_write(UC_X86_REG_RAX,0);uc.reg_write(UC_X86_REG_RDX,0);ret()
 elif a==0x145441160:
  events.append('announce');uc.mem_write(uc.reg_read(UC_X86_REG_RCX),bytes(32));ret()
 elif a in (0x145450bf0,0x145451620,0x1454512c0):
  vector(uc.reg_read(UC_X86_REG_RCX));ret()
 elif a==0x1454c8110:
  kind=uc.reg_read(UC_X86_REG_RDX)&0xffffffff;pos=uc.reg_read(UC_X86_REG_R9)
  pickups.append({'kind':kind,'amount':uc.reg_read(UC_X86_REG_R8)&0xffffffff if kind in(0,1)else None,'position_bits':[readu(pos+i*4)for i in range(3)]});ret()
 elif a==0x1455259a0:
  n=readq(GAME+0x688);p=readq(GAME+0x680);uc.mem_write(p,bytes(uc.mem_read(p+4,(n-1)*4)));putq(GAME+0x688,n-1);ret()
 elif a==0x14540e820:uc.reg_write(UC_X86_REG_RAX,zone_index);ret()
 elif a==0x145451160:uc.reg_write(UC_X86_REG_XMM0,bits(1.));ret()
 elif a==0x1454589f0:
  equipment_calls.append({'zone_index':uc.reg_read(UC_X86_REG_R8),'boss_index':uc.reg_read(UC_X86_REG_R9)});vector(uc.reg_read(UC_X86_REG_RCX));ret()
 elif a==0x1454d2380:events.append('attract_idle_experience');ret()
 elif a==0x145492fd0:events.append('complete_run_owner');ret()
 elif a==0x14543fb70:events.append('completion_packet');uc.mem_write(uc.reg_read(UC_X86_REG_RCX),bytes(32));ret()
 elif a==0x1454b6620:vector(uc.reg_read(UC_X86_REG_RCX));events.append('victory_account');ret()
 elif a==0x145757f60:
  p=uc.reg_read(UC_X86_REG_RCX);putq(p,32);putq(p+8,MOVES);ret()
 else:raise RuntimeError(f'Unscoped native instruction {a:x} in {active}')
uc.hook_add(UC_HOOK_CODE,hook)
REGS=[UC_X86_REG_RAX,UC_X86_REG_RBX,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_RSI,UC_X86_REG_RDI,UC_X86_REG_RBP,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_R10,UC_X86_REG_R11,UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15]
def reset():
 global events,pickups,equipment_calls
 events,pickups,equipment_calls=[],[],[];uc.mem_write(GAME,bytes(0x20000));uc.mem_write(STACK,bytes(0x20000))
 for r in REGS:uc.reg_write(r,0)
 for r in range(UC_X86_REG_XMM0,UC_X86_REG_XMM15+1):uc.reg_write(r,0)
 uc.reg_write(UC_X86_REG_MXCSR,0x1f80);uc.reg_write(UC_X86_REG_EFLAGS,2);uc.reg_write(UC_X86_REG_RBP,FRAME);uc.reg_write(UC_X86_REG_RSP,FRAME-0x80)
 for cap,ptr,length,address in [(256,EVENTS,0,0x538),(256,ACCOUNTS,0,0x550)]:putq(GAME+address,cap);putq(GAME+address+8,ptr);putq(GAME+address+16,length)
def execute(kind,start):
 global active
 active=kind;uc.emu_start(start,0,count=100000);assert uc.reg_read(UC_X86_REG_RIP)==STOPS[kind] or (kind=='meter_empty' and uc.reg_read(UC_X86_REG_RIP)==0x14549898b)
SCENARIOS=[('first_last',0,0,0,False,[],False),('other_boss_alive',2,0,0,True,[900.],False),
 ('magnet_due',4,1,0,False,[500.,550.],False),('magnet_future',1,2,1,False,[501.],False),
 ('wrap',0xffffffff,4,0x100,False,[500.],True)]
death_cases=[]
for zone_index in range(12):
 bosses=readq(0x146716438+zone_index*0xf0+0x88)
 for boss_index in range(5):
  definition=bosses+boss_index*0x58
  for label,kills,marker,phase,remaining,deadlines,suppressed in SCENARIOS:
   reset();clock=500.;putu(GAME+0x8e4,bits(clock));putu(GAME+0x668,kills);putu(GAME+0x654,marker);putu(GAME+0x658,bits(123.));putu(GAME+0x858,phase);putu(GAME+0x85c,bits(99.));uc.mem_write(GAME+0x958,bytes([suppressed]))
   putq(GAME+0x4c8,ACTORS);putq(GAME+0x4d0,2);uc.mem_write(ACTORS+0x68,b'\x01');putq(ACTORS+0x18,0)
   uc.mem_write(ACTORS+0x160+0x68,bytes([not remaining]));putq(ACTORS+0x160+0x18,0)
   putq(GAME+0x680,MAGNETS);putq(GAME+0x688,len(deadlines))
   for i,v in enumerate(deadlines):putu(MAGNETS+i*4,bits(v))
   putq(FRAME+0x150,definition);uc.mem_write(FRAME+0x158,struct.pack('<fff',123.,456.,17.));uc.reg_write(UC_X86_REG_RSI,GAME);uc.reg_write(UC_X86_REG_RDI,0xf130000000000001);uc.reg_write(UC_X86_REG_XMM8,bits(clock))
   execute('death',0x1454c41d3)
   death_cases.append({'label':label,'zone_index':zone_index,'boss_index':boss_index,'clock_bits':bits(clock),'kills_before':kills,'marker_before':marker,'marker_time_before_bits':bits(123.),'phase_before':phase,'phase_start_before_bits':bits(99.),'remaining_live_primary_boss':remaining,'magnet_deadlines_before_bits':[bits(v)for v in deadlines],
    'equipment_suppressed':suppressed,'kills_after':readu(GAME+0x668),'marker_after':readu(GAME+0x654),'marker_time_after_bits':readu(GAME+0x658),'phase_after':readu(GAME+0x858),'phase_start_after_bits':readu(GAME+0x85c),
    'magnet_deadlines_after_bits':[readu(MAGNETS+i*4)for i in range(readq(GAME+0x688))],'pickups':pickups,'events':events,'equipment_calls':equipment_calls})
completion_cases=[]
for phase in [0,1,2,0x100]:
 for state in [0,1,3,5]:
  for endless in [False,True]:
   reset();putu(GAME+0x858,phase);uc.mem_write(GAME+0x95f,bytes([state]));uc.mem_write(GAME+0x952,bytes([endless]));putu(GAME+0x4b4,0xffffffff);uc.reg_write(UC_X86_REG_R13,GAME)
   execute('completion',0x1454aa103);completion_cases.append({'phase':phase,'run_state_before':state,'endless':endless,'victories_before':0xffffffff,'run_state_after':uc.mem_read(GAME+0x95f,1)[0],'victories_after':readu(GAME+0x4b4),'events':events})
reset();rows=[]
for i,(x,y,kind,state) in enumerate([(0.,0.,0,0),(3.,4.,0,0),(6.,0.,0,0),(6.001,0.,0,0),(80.,60.,0,0),(80.,60.,1,0),(80.,60.,0,1)]):
 a=PICKUPS+i*0x48;putu(a+0x20,kind);putu(a+0x18,state);putq(a+0x28,i+100);uc.mem_write(a+0x34,struct.pack('<fff',x,y,17.));putu(a+0x1c,bits(123.));rows.append({'guid':i+100,'kind':kind,'state_before':state,'position_bits':[bits(x),bits(y),bits(17.)],'arrives_before_bits':bits(123.)})
putq(GAME+0x528,PICKUPS);putq(GAME+0x530,len(rows));putu(GAME+0x8e4,bits(500.));uc.mem_write(GAME+0x3e8,struct.pack('<fff',0.,0.,9.));uc.reg_write(UC_X86_REG_RCX,GAME);execute('attraction',0x1454d23c5)
for i,row in enumerate(rows):row.update({'state_after':readu(PICKUPS+i*0x48+0x18),'arrives_after_bits':readu(PICKUPS+i*0x48+0x1c)})
moves=[]
for i in range(readq(FRAME+0x20)):
 a=MOVES+i*0x18;moves.append({'guid':readq(a),'from_bits':[readu(a+8+j*4)for j in range(3)],'duration_bits':readu(a+0x14)})
meter_cases=[]
for marker in [0,1,2,3,4,0xffffffff]:
 reset();putu(GAME+0x8e4,bits(500.));putu(GAME+0x654,marker);putu(GAME+0x650,bits(77.));putq(GAME+0x600,MOVES);putq(GAME+0x608,3);putq(MOVES,0);putq(MOVES+0x38,0);putq(MOVES+0x70,0)
 uc.reg_write(UC_X86_REG_RSI,GAME);uc.reg_write(UC_X86_REG_R13,0);execute('meter_begin',0x1454c35ee)
 changed={'marker_after':readu(GAME+0x654),'started_after_bits':readu(GAME+0x650),'line_count_after':readq(GAME+0x608)}
 reset();putu(GAME+0x654,marker);uc.reg_write(UC_X86_REG_R14,GAME);execute('meter_empty',0x1454988e5);empty=uc.reg_read(UC_X86_REG_RIP)==0x1454988f5
 uc.reg_write(UC_X86_REG_RSI,marker);uc.reg_write(UC_X86_REG_XMM8,bits(500.));uc.reg_write(UC_X86_REG_XMM9,bits(77.));uc.reg_write(UC_X86_REG_XMM6,bits(123.));execute('meter_timing',0x145498ab1)
 meter_cases.append({'marker_before':marker,'now_bits':bits(500.),'started_before_bits':bits(77.),'stopped_bits':bits(123.),'line_count_before':3,**changed,'serialized_empty':empty,'seconds_bits':uc.reg_read(UC_X86_REG_XMM6)&0xffffffff})
result={'target_version':'0.97.2','target_sha256':EXPECTED,'target_executed':False,'instruction_emulation':True,'ranges':{k:[[hex(a),hex(b)]for a,b in v]for k,v in RANGES.items()},
 'seams':['Localization/message/JSON creation stubs','Pickup creator captures kind/amount/position','Equipment candidates stubbed empty, admission/index captured; actual equipment roll independently recovered in mob_loot','Magnet schedule vector removal stub preserves remove-first behavior','Completion movement-freeze/packet/account callbacks stubbed','XP-attraction allocation stub, unchanged filter/arithmetic/stores'],
 'death_cases':death_cases,'completion_cases':completion_cases,'meter_cases':meter_cases,'attraction':{'clock_bits':bits(500.),'player_bits':[bits(0.),bits(0.),bits(9.)],'pickups':rows,'moves':moves}}
out=ROOT/'crates/azeroth-survivors-re/tests/fixtures/boss-death-native.json';out.write_text(json.dumps(result,indent=2)+'\n');print(f'Retained {len(death_cases)} native death cases, {len(completion_cases)} completion gates and {len(rows)} XP pickup cases, {len(meter_cases)} meter-state cases')

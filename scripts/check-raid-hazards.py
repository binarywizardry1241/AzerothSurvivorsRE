#!/usr/bin/env python3
"""Check current raid producers, forms, markers and dynamic-object fields.

Only original instructions in synthetic fixtures execute. Terrain, Windows CRT,
cast/hold, allocation and field-map seams are explicit; no Rust/compiler/game.
"""
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from coverage_common import ROOT
sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn.x86_const import *
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
KEPT=ROOT/'docs/analysis/evidence/raid-hazards'
STAGE=ROOT/'runtime/analysis/staging/native-evidence/raid-hazards'
RANGES={
 'dispatcher':(0x14591f790,0x145924bf2),
 'transform-unit':(0x145915340,0x14591599b),
 'marker-kind':(0x14591a007,0x14591a048),
 'marker-motion':(0x145917c91,0x145918022),
 'dynamic-object':(0x14592bcd0,0x14592c4bb),
 'native-spell-radius':(0x14596ca90,0x14596cbb8),
}
def fixture():
 u=Uc(UC_ARCH_X86,UC_MODE_64);mem=0x70000000;u.mem_map(mem,0x10000);mapped=set()
 def demand(uc,access,a,n,value,user):
  page=a&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
 return u,mem

def producers():
 u,mem=fixture()
 # Space for the actual native hazard vector and caller scratch frame.
 u.mem_map(mem+0x10000,0x50000)
 game=mem;actor=mem+0x1000;record=mem+0x2000;bp=mem+0x8000;stack=mem+0xf008;hazards=mem+0x20000
 source=(1.,2.,3.);player=(10.,20.,4.);angle=math.atan2(18.,9.);stops={0x14591f828,0x14599cd20};calls=[]
 def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,u.mem_read(a,struct.calcsize('<'+fmt)))
 def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
 def f32(f):return struct.unpack('<f',struct.pack('<f',f))[0]
 def xf(reg):return struct.unpack('<f',u.reg_read(reg).to_bytes(16,'little')[:4])[0]
 def ret():
  sp=u.reg_read(UC_X86_REG_RSP);target=get(sp,'Q')[0];u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,target)
 def rng_float(low,high):
  while True:
   a,b,c,d=get(game+0x9b8,'4Q');mask=(1<<64)-1;s=(a+d)&mask;out=(((s<<23)|(s>>41))+a)&mask;tmp=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=tmp;d=((d<<45)|(d>>19))&mask;put(game+0x9b8,'4Q',a,b,c,d);unit=f32(struct.unpack('<f',struct.pack('<I',0x3f800000|(out>>41)))[0]-1.);v=f32(f32(unit*f32(high-low))+low)
   if v<high:return v
 def hook(uc,a,n,user):
  if a in stops:u.emu_stop();return
  if a in [0x14591f1d0,0x14591f6a0]:calls.append((a,u.reg_read(UC_X86_REG_R8D),xf(UC_X86_REG_XMM2),xf(UC_X86_REG_XMM3)));ret();return
  if a in [0x1458a0b40,0x14589f770]:u.reg_write(UC_X86_REG_RAX,1);u.reg_write(UC_X86_REG_XMM0,bits(4.));ret();return
  if a in [0x145c0a417,0x145c0a411,0x145c0a42f,0x145c0a447]:
   x=xf(UC_X86_REG_XMM0);y=xf(UC_X86_REG_XMM1);v=math.cos(x)if a==0x145c0a417 else math.sin(x)if a==0x145c0a411 else math.hypot(x,y)if a==0x145c0a42f else math.atan2(x,y);u.reg_write(UC_X86_REG_XMM0,bits(v));ret();return
  if a==0x1459c2d90:u.reg_write(UC_X86_REG_XMM0,bits(rng_float(xf(UC_X86_REG_XMM1),xf(UC_X86_REG_XMM2))));ret();return
  if a==0x145898dc0:u.reg_write(UC_X86_REG_RAX,0);ret();return
  # Stop at an unlisted call instruction before it can enter other code.
  # The common hazard constructor itself executes as current native bytes;
  # the remaining targets are the explicit synthetic seams handled above.
  instruction=next(Cs(CS_ARCH_X86,CS_MODE_64).disasm(bytes(u.mem_read(a,n)),a))
  if instruction.mnemonic=='call':
   targets={0x14591f490,0x14591f1d0,0x14591f6a0,0x1458a0b40,0x14589f770,
            0x145c0a417,0x145c0a411,0x145c0a42f,0x145c0a447,0x1459c2d90,
            0x145898dc0,0x14599cd20}
   assert instruction.op_str.startswith('0x') and int(instruction.op_str,16) in targets,hex(a)
 u.hook_add(UC_HOOK_CODE,hook)
 table=0x146c0c2c8;entries={str(i+3):table+v for i,v in enumerate(struct.unpack('<32i',raw(table,128)))};results=[]
 for row in j['actions']:
  tag=row['native_tag']
  if tag not in [3,6,9,10,11,13,14,15,16,17,25,26,29,31,33]:continue
  u.mem_write(mem,bytes(0x60000));put(game+0x568,'QQ',actor,1);put(game+0x590,'QQQ',1000,hazards,0);put(game+0xa4c,'f',10.);put(game+0x9b8,'4Q',1,2,3,4);put(actor+0xf0,'Q',777);put(record,'12I',*row['words']);put(bp+0x180,'Q',777);put(bp+0xf0,'Q',0);put(bp+0xa8,'3f',*source);put(bp+0x150,'4f',source[0],source[1],0.,0.);put(bp+0xd0,'4f',player[0],player[1],0.,0.);put(bp+0xe0,'4f',player[1],0.,0.,0.);put(bp+0x178,'f',angle)
  for reg,val in [(UC_X86_REG_RSI,game),(UC_X86_REG_RCX,record),(UC_X86_REG_R14,record),(UC_X86_REG_RBP,bp),(UC_X86_REG_RSP,stack),(UC_X86_REG_RBX,0)]:u.reg_write(reg,val)
  for reg,val in [(UC_X86_REG_XMM10,source[1]),(UC_X86_REG_XMM11,player[2]),(UC_X86_REG_XMM12,player[1]-source[1]),(UC_X86_REG_XMM13,player[0]-source[0]),(UC_X86_REG_XMM14,17.),(UC_X86_REG_XMM15,10.)]:u.reg_write(reg,bits(val))
  u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80);calls.clear()
  try:u.emu_start(entries[str(tag)],0,count=100000)
  except Exception as e:print('FAILED',row['index'],tag,hex(u.reg_read(UC_X86_REG_RIP)),e);raise
  assert u.reg_read(UC_X86_REG_RIP)in stops,(row['index'],tag,hex(u.reg_read(UC_X86_REG_RIP)))
  count=get(game+0x5a0,'Q')[0];h=[get(hazards+i*128,'32I')for i in range(count)];w=row['words'];f=lambda i:struct.unpack('<f',struct.pack('<I',w[i]))[0]
  expected_count={3:1,6:1,9:1,11:1,13:1,14:1,15:1,16:4,25:1,26:1}.get(tag)
  if tag==10:expected_count=w[1]
  if tag==17:expected_count=w[1]*w[2]
  if tag==31:expected_count=w[3]
  if tag==33:expected_count=max(w[1],1)
  if tag==29:expected_count=sum(len(range(v&1,max(w[1],1),2))for v in range(max(w[5],1)))
  assert count==expected_count,(row['index'],tag,count,expected_count)
  if tag==3:assert h[0][23]==w[1] and h[0][13]==w[2] and h[0][21]==bits(f32(10.+f(3)))
  if tag==6:assert h[0][23]==w[0] and h[0][13]==w[1] and h[0][31]&255==1
  if tag==17:
   radius=f(3);step=f32(1.6*radius);lane_spacing=f32(2.6*radius);half=f32(f32(w[2]*.5)*step);co=f32(math.cos(f32(1.053301453590393)));si=f32(math.sin(f32(1.053301453590393)))
   # The exact random-angle value is recorded by the selected native producer;
   # count, circular shape/radius, native deadline and damage are independent.
   for lane in range(w[1]):
    for i in range(w[2]):
     r=h[lane*w[2]+i];assert r[12]==0 and r[13]==bits(radius);assert r[21]==bits(f32(f32(i*f(5)+f(4))+10.));assert r[24]==bits(f32(17.*f(6)))
  if tag==26:assert h[0][4]==4 and h[0][13]==bits(2.5)and h[0][5]==bits(10.8)
  results.append(dict(index=row['index'],native_tag=tag,hazard_count=count,hazard_bytes_sha256=hashlib.sha256(u.mem_read(hazards,count*128)).hexdigest(),spell_calls=len(calls)))
 return results

def transforms():
 u,mem=fixture()
 game=mem;actor=mem+0x1000;definition=mem+0x2000;descriptor=mem+0x3000;stack=mem+0xe000;stop=0x14591599b
 captures=[]
 def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
 def hook(uc,a,n,user):
  if a==stop:uc.emu_stop();return
  if a==0x1458de1f0:
   frame=uc.reg_read(UC_X86_REG_RDX);key=struct.unpack('<Q',uc.mem_read(frame+32,8))[0];value=uc.reg_read(UC_X86_REG_R8D);captures.append((key,value));sp=uc.reg_read(UC_X86_REG_RSP);ret=struct.unpack('<Q',uc.mem_read(sp,8))[0];uc.reg_write(UC_X86_REG_RAX,0);uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,ret)
 u.hook_add(UC_HOOK_CODE,hook)
 results=[]
 for r in j['actions']:
  if r['native_tag'] not in [0,1,2,32]:continue
  for base_display,base_scale in [(123,1.35),(321,2.5)]:
   captures.clear();u.mem_write(mem,bytes(0x10000));put(game+0x568,'QQ',actor,1);put(actor+0x18,'Q',0);put(actor+0x30,'Q',definition);put(actor+0xf0,'Q',777);put(definition+0x44,'If',base_display,base_scale);put(descriptor,'7I',*r['words'][5:12]);put(stack,'Q',mem+0xff00)
   u.reg_write(UC_X86_REG_RCX,game);u.reg_write(UC_X86_REG_RDX,777);u.reg_write(UC_X86_REG_R8,descriptor);u.reg_write(UC_X86_REG_RSP,stack);u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80);u.emu_start(0x145915340,0,count=100000);assert u.reg_read(UC_X86_REG_RIP)==stop
   w=r['words'];expected={131:w[5]or base_display,4:w[6]if struct.unpack('<f',struct.pack('<I',w[6]))[0]>0 else struct.unpack('<I',struct.pack('<f',base_scale))[0],133:w[7],164:int(w[8]!=0 or w[10]!=0)}
   for slot,raw in enumerate([w[8]|w[9]<<32,w[10]|w[11]<<32]):
    variant=raw>>40&255
    if variant==2:continue
    item=raw&0xffffffff;info=0 if item==0 else((raw>>24)&0xff00)|(0xd010002 if variant&1==0 else 0x11010002);flags=0 if item==0 else(3 if variant&1==0 else 1);expected.update({37+slot:item,40+slot*2:info,41+slot*2:flags})
   assert dict(captures)==expected,(r['index'],captures,expected);results.append(dict(action_index=r['index'],base_display=base_display,base_scale=base_scale,fields=sorted(captures)))
 return results

def marker_kinds():
 u,mem=fixture()
 row=mem+0x1000
 stops={0x14591a048}
 def hook(uc,a,n,user):
  if a in stops:uc.emu_stop()
 u.hook_add(UC_HOOK_CODE,hook)
 results=[]
 for kind in range(7):
  for active in [0,1]:
   u.mem_write(row,bytes(128));u.mem_write(row+0x10,struct.pack('<I',kind));u.mem_write(row+0x7d,bytes([active]));u.reg_write(UC_X86_REG_R12,row);u.reg_write(UC_X86_REG_EFLAGS,2);u.emu_start(0x14591a007,0,count=10000);p=u.reg_read(UC_X86_REG_RCX);n=u.reg_read(UC_X86_REG_RAX);value=raw(p,n).decode();expected=['danger','tower','pool'if active else'danger','live'if active else'danger','tower','tower','live'if active else'danger'][kind];assert value==expected;results.append(dict(native_kind=kind,active=bool(active),marker_kind=value))
 return results

def marker_motion():
 u,mem=fixture();row=mem+0x1000;stops={0x145917c9c,0x145918022}
 def hook(uc,a,n,user):
  if a in stops:uc.emu_stop()
 u.hook_add(UC_HOOK_CODE,hook);rows=[]
 bits=lambda v:struct.unpack('<I',struct.pack('<f',v))[0]
 for follow in [False,True]:
  for tracking in [0.,1.,2.,math.nan]:
   for drift in [-1.,0.,1.,math.nan]:
    for angular in [0.,1.,math.nan]:
     for kind3 in [False,True]:
      u.mem_write(row,bytes(128));u.mem_write(row+0x7c,bytes([int(follow)]));u.mem_write(row+0x58,struct.pack('<f',tracking));u.mem_write(row+0x50,struct.pack('<f',1.));u.mem_write(row+0x70,struct.pack('<f',drift));u.mem_write(row+0x1c,struct.pack('<f',angular))
      u.reg_write(UC_X86_REG_R13,row);u.reg_write(UC_X86_REG_RAX,int(kind3));u.reg_write(UC_X86_REG_EFLAGS,2);u.emu_start(0x145917c91,0,count=1000);actual=u.reg_read(UC_X86_REG_RIP)==0x145917c9c
      assert actual==(follow or tracking>1. or drift>0. or(kind3 and angular!=0.)),(follow,tracking,drift,angular,kind3)
      rows.append([follow,bits(tracking),bits(drift),bits(angular),kind3,actual])
 return rows

def dynamic_objects():
 """Current14592bcd0/14596ca90 with synthetic field-map and packet owners."""
 u,mem=fixture();u.mem_map(mem+0x10000,0x10000)
 game=mem;point=mem+0x2000;stack=mem+0x10000;stop=mem+0x1ff00
 fields=[];creates=[]
 def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,u.mem_read(a,struct.calcsize('<'+fmt)))
 def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
 def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
 def ret():
  sp=u.reg_read(UC_X86_REG_RSP);end=get(sp,'Q')[0];u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,end)
 def hook(uc,a,n,user):
  if a==0x1458c19b0:
   key=u.reg_read(UC_X86_REG_RDX)&0xffff;value=u.reg_read(UC_X86_REG_R8)
   fields.extend([(key,value&0xffffffff),(key+1,value>>32)]);ret();return
  if a==0x1458de1f0:
   fields.append((get(u.reg_read(UC_X86_REG_RDX)+32,'Q')[0],u.reg_read(UC_X86_REG_R8D)));ret();return
  if a==0x1458c0f20:
   creates.append((u.reg_read(UC_X86_REG_RDX),u.reg_read(UC_X86_REG_R8)&255,get(u.reg_read(UC_X86_REG_R9),'3I')))
   assert get(u.reg_read(UC_X86_REG_RSP)+0x28,'I')[0]==0
   u.mem_write(u.reg_read(UC_X86_REG_RCX),bytes(32));ret();return
  if a==0x1458c1180:
   u.mem_write(u.reg_read(UC_X86_REG_RCX),bytes(32));ret();return
  if a==0x1459c3ba0:ret();return
  assert 0x14592bcd0<=a<0x14592c4bb or 0x14596ca90<=a<0x14596cbb8,hex(a)
 u.hook_add(UC_HOOK_CODE,hook)
 source=(ROOT/'crates/azeroth-survivors-re/src/bosses/abilities.rs').read_text()
 radius_body=source.split('pub fn native_spell_radius(spell_id: u32) -> Option<f32> {',1)[1].split('\n}',1)[0]
 overrides={}
 for ids,value in re.findall(r'([\d |]+) => Some\(([\d.]+)\)',radius_body):
  overrides.update((int(i),float(value))for i in ids.split('|'))
 assert '_ => None'in radius_body and len(overrides)==20
 # Every comparison boundary and interval is covered, including the signed
 # partition and full32-bit IDs. The native leaf contains no other arithmetic.
 md=Cs(CS_ARCH_X86,CS_MODE_64);instructions=list(md.disasm(raw(0x14596ca90,0x128),0x14596ca90))
 assert all(i.mnemonic in {'xor','cmp','jle','jg','je','jne','jmp','mov','movss','ret'}for i in instructions)
 boundaries={int(i.op_str.split(',')[1],0)for i in instructions if i.mnemonic=='cmp'}
 ids={0,1,0x7fffffff,0x80000000,0xffffffff,*overrides}
 ids.update((value+delta)&0xffffffff for value in boundaries for delta in [-1,0,1])
 radius_rows=[]
 for spell in sorted(ids):
  put(stack,'Q',stop);u.reg_write(UC_X86_REG_RSP,stack);u.reg_write(UC_X86_REG_ECX,spell)
  u.reg_write(UC_X86_REG_XMM0,bits(-999.));u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80)
  u.emu_start(0x14596ca90,stop,count=1000);assert u.reg_read(UC_X86_REG_RIP)==stop
  actual=(u.reg_read(UC_X86_REG_XMM0)&0xffffffff)if u.reg_read(UC_X86_REG_EAX)&1 else None
  expected=bits(overrides[spell])if spell in overrides else None
  assert actual==expected,(spell,actual,expected)
  radius_rows.append(dict(spell_id=spell,radius_bits=actual))
 counters=[0,0xfffffe,0xffffff,0xfffffffe,0xffffffff]
 players=[1,0x123456789abcdef];spells=[0,10,120,779,11683,12345]
 radii=[0.,3.5,-2.,math.nan];positions=[(3.,-2.,7.5),(-0.,1024.,-7.)]
 snapshots=[]
 for counter in counters:
  for player in players:
   for spell in spells:
    for radius in radii:
     for position in positions:
      fields.clear();creates.clear();u.mem_write(mem,bytes(0x20000))
      put(game+0xa78,'I',counter);put(game+0x468,'Q',player);put(game+0x620,'QQQ',4,mem+0x4000,0)
      put(point,'3f',*position);put(stack,'Q',stop)
      u.reg_write(UC_X86_REG_RCX,game);u.reg_write(UC_X86_REG_EDX,spell);u.reg_write(UC_X86_REG_R8,point)
      u.reg_write(UC_X86_REG_XMM3,bits(radius));u.reg_write(UC_X86_REG_RSP,stack)
      u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80)
      u.emu_start(0x14592bcd0,stop,count=10000);assert u.reg_read(UC_X86_REG_RIP)==stop
      serial=(counter+1)&0xffffffff;guid=0xf100000000000000|serial
      scale=f32(radius/overrides[spell])if spell in overrides else 1.
      expected={0:serial,1:0xf1000000,2:0x41,3:spell,4:bits(scale),6:player&0xffffffff,7:player>>32,8:1,9:spell,
       10:bits(radius),11:bits(position[0]),12:bits(position[1]),13:bits(position[2]),14:0}
      assert len(fields)==14 and dict(fields)==expected,(spell,fields,expected)
      assert u.reg_read(UC_X86_REG_RAX)==guid and get(game+0xa78,'I')[0]==serial
      assert creates==[(guid,6,tuple(bits(v)for v in position))] and get(game+0x630,'Q')[0]==1
      snapshots.append([counter,player,spell,bits(radius),*[bits(v)for v in position],guid,fields.copy()])
 compact=re.sub(r'\s+','',source.split('pub fn ground_object(',1)[1].split('\n}',1)[0])
 assert [int(key)for key in re.findall(r'\((\d+),',compact)]==[0,1,2,3,4,6,7,8,9,10,11,12,13,14]
 for token in ['0xf100_0000_0000_0000|u64::from(counter.next())','native_spell_radius(spell_id).map_or(1.0,|base|radius/base)',
  '(0,guidas u32)','(1,(guid>>32)as u32)','(2,0x41)','(3,spell_id)','(4,scale.to_bits())',
  '(6,player_guidas u32)','(7,(player_guid>>32)as u32)','(8,1)','(9,spell_id)','(10,radius.to_bits())',
  '(11,position.x.to_bits())','(12,position.y.to_bits())','(13,position.z.to_bits())','(14,0)']:
  assert re.sub(r'\s+','',token)in compact,token
 return radius_rows,dict(cases=len(snapshots),counter_inputs=counters,player_guids=players,spell_ids=spells,
  radius_bits=[bits(v)for v in radii],position_bits=[[bits(v)for v in p]for p in positions],field_keys=sorted(expected),
  snapshots_sha256=hashlib.sha256(json.dumps(snapshots,separators=(',',':')).encode()).hexdigest(),
  seams=['Field-map insertions capture exact keys/values without exercising BTree allocation.',
   'Object-create/queue wrappers use synthetic byte vectors; current helper kind6, GUID, position, orientation0 and one append are checked.'])

def main():
 global raw,j
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--stage',action='store_true');args=p.parse_args()
 mod = load_script('current_raid', ROOT/'scripts/check-raid-target.py')
 target,raw,span,j,headers=mod.recover();mod.check_graph(j,headers)
 producer=producers();forms=transforms();kinds=marker_kinds();motion=marker_motion();radius,objects=dynamic_objects()
 print('Producer cases',len(producer),'forms',len(forms),'kinds',len(kinds),'motion',len(motion),'radius',len(radius),'objects',objects['cases'])
 result=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,
  producers=producer,forms=forms,marker_kinds=kinds,marker_motion=motion,radius_rows=radius,dynamic_objects=objects,
  producer_byte_executed_helpers=['0x14591f490'],
  producer_intercepted_seams=['0x14591f1d0','0x14591f6a0','0x1458a0b40','0x14589f770',
   '0x145c0a417','0x145c0a411','0x145c0a42f','0x145c0a447','0x1459c2d90','0x145898dc0'],
  limits=['Synthetic original-byte fixtures do not execute Rust or launch any game.',
  'Terrain, cast/hold, random-range, field-map, packet allocation and CRT trig helpers are explicit seams.',
  'Connected graph/header/duration/queue evidence remains canonical under ../raid; full gameplay/presentation parity remains unverified.'])
 # Retain byte expectations separately from instruction/decompiler evidence.
 out=STAGE if args.stage else KEPT
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 if not args.stage:mod.verify_rea_operations(raw,out,target['sha256'])
 ranges=[];md=Cs(CS_ARCH_X86,CS_MODE_64)
 for role,(a,b) in RANGES.items():
  ins=list(md.disasm(raw(a,b-a),a));assert sum(i.size for i in ins)==b-a,role
  text=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
  name=role+'.asm'
  if args.stage:(out/name).write_text(text)
  else:assert (out/name).read_text()==text,name
  ranges.append(dict(role=role,**span(a,b-a),assembly=name))
 result['ranges']=ranges
 text=json.dumps(result,indent=2)+'\n'
 if args.stage:(out/'manifest.json').write_text(text)
 else:assert (out/'manifest.json').read_text()==text
 print('Current hazard contracts pass; no compiler/game/Rust execution')
if __name__=='__main__':main()

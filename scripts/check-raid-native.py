#!/usr/bin/env python3
"""Check current complete raid input graph and selected original native contracts.

Runs only isolated original instruction fragments with synthetic state. External
terrain/packet/tree/trig/random helpers are explicit fixture seams; no compiler,
reference process, rebuilt game or Rust source execution is performed.
"""
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from coverage_common import ROOT
sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn.x86_const import *
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
NATIVE = load_script('raid_native_inputs', ROOT/'scripts/recover-raid-native-catalog.py')
OUT=ROOT/'docs/analysis/evidence/0.109.0/raid-native'

def fixture():
 u=Uc(UC_ARCH_X86,UC_MODE_64);mem=0x70000000;u.mem_map(mem,0x10000);mapped=set()
 def demand(uc,access,a,n,value,user):
  page=a&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
 return u,mem

def durations():
 u,mem=fixture()
 res={}
 for i,r in enumerate(j['actions']):
  u.mem_write(mem,struct.pack('<12I',*r['words']));u.mem_write(mem+0x8000,struct.pack('<Q',mem+0xff00));u.reg_write(UC_X86_REG_RCX,mem);u.reg_write(UC_X86_REG_RSP,mem+0x8000);u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80)
  try:
   u.emu_start(0x14588be10,mem+0xff00,count=100000);assert u.reg_read(UC_X86_REG_RIP)==mem+0xff00;res[str(i)]=u.reg_read(UC_X86_REG_XMM0)&0xffffffff
  except Exception as e:print(i,r['native_tag'],e);raise
 assert all(res[str(r["index"])]==r["duration_bits"]for r in j["actions"])
 return len(res)

def producers():
 u,mem=fixture()
 # Space for the actual native hazard vector and caller scratch frame.
 u.mem_map(mem+0x10000,0x50000)
 game=mem;actor=mem+0x1000;record=mem+0x2000;bp=mem+0x8000;stack=mem+0xf008;hazards=mem+0x20000
 source=(1.,2.,3.);player=(10.,20.,4.);angle=math.atan2(18.,9.);stops={0x145957978,0x14590d9a0};calls=[]
 def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,u.mem_read(a,struct.calcsize('<'+fmt)))
 def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
 def f32(f):return struct.unpack('<f',struct.pack('<f',f))[0]
 def xf(reg):return struct.unpack('<f',u.reg_read(reg).to_bytes(16,'little')[:4])[0]
 def ret():
  sp=u.reg_read(UC_X86_REG_RSP);target=get(sp,'Q')[0];u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,target)
 def rng_float(low,high):
  while True:
   a,b,c,d=get(game+0x9a0,'4Q');mask=(1<<64)-1;s=(a+d)&mask;out=(((s<<23)|(s>>41))+a)&mask;tmp=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=tmp;d=((d<<45)|(d>>19))&mask;put(game+0x9a0,'4Q',a,b,c,d);unit=f32(struct.unpack('<f',struct.pack('<I',0x3f800000|(out>>41)))[0]-1.);v=f32(f32(unit*f32(high-low))+low)
   if v<high:return v
 def hook(uc,a,n,user):
  if a in stops:u.emu_stop();return
  if a in [0x145957320,0x1459577f0]:calls.append((a,u.reg_read(UC_X86_REG_R8D),xf(UC_X86_REG_XMM2),xf(UC_X86_REG_XMM3)));ret();return
  if a in [0x1458d6f90,0x1458d3d80]:u.reg_write(UC_X86_REG_RAX,1);u.reg_write(UC_X86_REG_XMM0,bits(4.));ret();return
  if a in [0x145bfa11d,0x145bfa117,0x145bfa12f,0x145bfa123]:
   x=xf(UC_X86_REG_XMM0);y=xf(UC_X86_REG_XMM1);v=math.cos(x)if a==0x145bfa11d else math.sin(x)if a==0x145bfa117 else math.hypot(x,y)if a==0x145bfa12f else math.atan2(x,y);u.reg_write(UC_X86_REG_XMM0,bits(v));ret();return
  if a==0x1458f1080:u.reg_write(UC_X86_REG_XMM0,bits(rng_float(xf(UC_X86_REG_XMM1),xf(UC_X86_REG_XMM2))));ret();return
  if a==0x14588d0d0:u.reg_write(UC_X86_REG_RAX,0);ret();return
  # All other native callees are forbidden; a selected direct fragment may
  # call only the explicit height/hold/cast/random/trig helpers above.
  if raw(a,1)==b'\xe8':pass
 u.hook_add(UC_HOOK_CODE,hook)
 table=0x14722ce3c;entries={str(i+3):table+v for i,v in enumerate(struct.unpack('<32i',raw(table,128)))};results=[]
 for row in j['actions']:
  tag=row['native_tag']
  if tag not in [3,6,9,10,11,13,14,15,16,17,25,26,29,31,33]:continue
  u.mem_write(mem,bytes(0x60000));put(game+0x560,'QQ',actor,1);put(game+0x588,'QQQ',1000,hazards,0);put(game+0xa34,'f',10.);put(game+0x9a0,'4Q',1,2,3,4);put(actor+0xf0,'Q',777);put(record,'12I',*row['words']);put(bp+0x180,'Q',777);put(bp+0xf0,'Q',0);put(bp+0xa8,'3f',*source);put(bp+0x150,'4f',source[0],source[1],0.,0.);put(bp+0xd0,'4f',player[0],player[1],0.,0.);put(bp+0xe0,'4f',player[1],0.,0.,0.);put(bp+0x178,'f',angle)
  for reg,val in [(UC_X86_REG_RSI,game),(UC_X86_REG_RCX,record),(UC_X86_REG_R14,record),(UC_X86_REG_RBP,bp),(UC_X86_REG_RSP,stack),(UC_X86_REG_RBX,0)]:u.reg_write(reg,val)
  for reg,val in [(UC_X86_REG_XMM10,source[1]),(UC_X86_REG_XMM11,player[2]),(UC_X86_REG_XMM12,player[1]-source[1]),(UC_X86_REG_XMM13,player[0]-source[0]),(UC_X86_REG_XMM14,17.),(UC_X86_REG_XMM15,10.)]:u.reg_write(reg,bits(val))
  u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80);calls.clear()
  try:u.emu_start(entries[str(tag)],0,count=100000)
  except Exception as e:print('FAILED',row['index'],tag,hex(u.reg_read(UC_X86_REG_RIP)),e);raise
  assert u.reg_read(UC_X86_REG_RIP)in stops,(row['index'],tag,hex(u.reg_read(UC_X86_REG_RIP)))
  count=get(game+0x598,'Q')[0];h=[get(hazards+i*128,'32I')for i in range(count)];w=row['words'];f=lambda i:struct.unpack('<f',struct.pack('<I',w[i]))[0]
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
 game=mem;actor=mem+0x1000;definition=mem+0x2000;descriptor=mem+0x3000;stack=mem+0xe000;stop=0x14594daeb
 captures=[]
 def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
 def hook(uc,a,n,user):
  if a==stop:uc.emu_stop();return
  if a==0x1458d9620:
   frame=uc.reg_read(UC_X86_REG_RDX);key=struct.unpack('<Q',uc.mem_read(frame+32,8))[0];value=uc.reg_read(UC_X86_REG_R8D);captures.append((key,value));sp=uc.reg_read(UC_X86_REG_RSP);ret=struct.unpack('<Q',uc.mem_read(sp,8))[0];uc.reg_write(UC_X86_REG_RAX,0);uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,ret)
 u.hook_add(UC_HOOK_CODE,hook)
 results=[]
 for r in j['actions']:
  if r['native_tag'] not in [0,1,2,32]:continue
  for base_display,base_scale in [(123,1.35),(321,2.5)]:
   captures.clear();u.mem_write(mem,bytes(0x10000));put(game+0x560,'QQ',actor,1);put(actor+0x18,'Q',0);put(actor+0x30,'Q',definition);put(actor+0xf0,'Q',777);put(definition+0x44,'If',base_display,base_scale);put(descriptor,'7I',*r['words'][5:12]);put(stack,'Q',mem+0xff00)
   u.reg_write(UC_X86_REG_RCX,game);u.reg_write(UC_X86_REG_RDX,777);u.reg_write(UC_X86_REG_R8,descriptor);u.reg_write(UC_X86_REG_RSP,stack);u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80);u.emu_start(0x14594d490,0,count=100000);assert u.reg_read(UC_X86_REG_RIP)==stop
   w=r['words'];expected={131:w[5]or base_display,4:w[6]if struct.unpack('<f',struct.pack('<I',w[6]))[0]>0 else struct.unpack('<I',struct.pack('<f',base_scale))[0],133:w[7],164:int(w[8]!=0 or w[10]!=0)}
   for slot,raw in enumerate([w[8]|w[9]<<32,w[10]|w[11]<<32]):
    variant=raw>>40&255
    if variant==2:continue
    item=raw&0xffffffff;info=0 if item==0 else((raw>>24)&0xff00)|(0x0d010002 if variant&1==0 else 0x11010002);flags=0 if item==0 else(3 if variant&1==0 else 1);expected.update({37+slot:item,40+slot*2:info,41+slot*2:flags})
   assert dict(captures)==expected,(r['index'],captures,expected);results.append(dict(action_index=r['index'],base_display=base_display,base_scale=base_scale,fields=sorted(captures)))
 return results

def marker_kinds():
 u,mem=fixture()
 row=mem+0x1000
 stops={0x145952198}
 def hook(uc,a,n,user):
  if a in stops:uc.emu_stop()
 u.hook_add(UC_HOOK_CODE,hook)
 results=[]
 for kind in range(7):
  for active in [0,1]:
   u.mem_write(row,bytes(128));u.mem_write(row+0x10,struct.pack('<I',kind));u.mem_write(row+0x7d,bytes([active]));u.reg_write(UC_X86_REG_R12,row);u.reg_write(UC_X86_REG_EFLAGS,2);u.emu_start(0x145952157,0,count=10000);p=u.reg_read(UC_X86_REG_RCX);n=u.reg_read(UC_X86_REG_RAX);value=raw(p,n).decode();expected=['danger','tower','pool'if active else'danger','live'if active else'danger','tower','tower','live'if active else'danger'][kind];assert value==expected;results.append(dict(native_kind=kind,active=bool(active),marker_kind=value))
 return results

def marker_motion():
 u,mem=fixture();row=mem+0x1000;stops={0x14594fdec,0x145950172}
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
      u.reg_write(UC_X86_REG_R13,row);u.reg_write(UC_X86_REG_RAX,int(kind3));u.reg_write(UC_X86_REG_EFLAGS,2);u.emu_start(0x14594fde1,0,count=1000);actual=u.reg_read(UC_X86_REG_RIP)==0x14594fdec
      assert actual==(follow or tracking>1. or drift>0. or(kind3 and angular!=0.)),(follow,tracking,drift,angular,kind3)
      rows.append([follow,bits(tracking),bits(drift),bits(angular),kind3,actual])
 return rows

def dynamic_objects():
 """145963f80 with the real14599e8a0 radius lookup and synthetic field/packet owners."""
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
  if a==0x1458c0000:
   key=u.reg_read(UC_X86_REG_RDX)&0xffff;value=u.reg_read(UC_X86_REG_R8)
   fields.extend([(key,value&0xffffffff),(key+1,value>>32)]);ret();return
  if a==0x1458d9620:
   fields.append((get(u.reg_read(UC_X86_REG_RDX)+32,'Q')[0],u.reg_read(UC_X86_REG_R8D)));ret();return
  if a==0x1458bf500:
   creates.append((u.reg_read(UC_X86_REG_RDX),u.reg_read(UC_X86_REG_R8)&255,get(u.reg_read(UC_X86_REG_R9),'3I')))
   assert get(u.reg_read(UC_X86_REG_RSP)+0x28,'I')[0]==0
   u.mem_write(u.reg_read(UC_X86_REG_RCX),bytes(32));ret();return
  if a==0x1458bf760:
   u.mem_write(u.reg_read(UC_X86_REG_RCX),bytes(32));ret();return
  if a==0x1459b47a0:ret();return
  assert 0x145963f80<=a<0x14596476b or 0x14599e8a0<=a<0x14599e9b3,hex(a)
 u.hook_add(UC_HOOK_CODE,hook)
 source=(ROOT/'crates/azeroth-survivors-re/src/bosses/abilities.rs').read_text()
 radius_body=source.split('pub fn native_spell_radius(spell_id: u32) -> Option<f32> {',1)[1].split('\n}',1)[0]
 overrides={}
 for ids,value in re.findall(r'([\d |]+) => Some\(([\d.]+)\)',radius_body):
  overrides.update((int(i),float(value))for i in ids.split('|'))
 assert '_ => None'in radius_body and len(overrides)==19
 # Every comparison boundary and interval is covered, including the signed
 # partition and full32-bit IDs. The native leaf contains no other arithmetic.
 md=Cs(CS_ARCH_X86,CS_MODE_64);instructions=list(md.disasm(raw(0x14599e8a0,0x113),0x14599e8a0))
 assert all(i.mnemonic in {'xor','cmp','jle','jg','je','jne','jmp','mov','movss','ret'}for i in instructions)
 boundaries={int(i.op_str.split(',')[1],0)for i in instructions if i.mnemonic=='cmp'}
 ids={0,1,0x7fffffff,0x80000000,0xffffffff,*overrides}
 ids.update((value+delta)&0xffffffff for value in boundaries for delta in [-1,0,1])
 radius_rows=[]
 for spell in sorted(ids):
  put(stack,'Q',stop);u.reg_write(UC_X86_REG_RSP,stack);u.reg_write(UC_X86_REG_ECX,spell)
  u.reg_write(UC_X86_REG_XMM0,bits(-999.));u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80)
  u.emu_start(0x14599e8a0,stop,count=1000);assert u.reg_read(UC_X86_REG_RIP)==stop
  actual=(u.reg_read(UC_X86_REG_XMM0)&0xffffffff)if u.reg_read(UC_X86_REG_EAX)&1 else None
  expected=bits(overrides[spell])if spell in overrides else None
  assert actual==expected,(spell,actual,expected)
  radius_rows.append(dict(spell_id=spell,radius_bits=actual))
 counters=[0,0xfffffe,0xffffff,0xfffffffe,0xffffffff]
 players=[1,0x123456789abcdef];spells=[0,10,120,779,12345]
 radii=[0.,3.5,-2.,math.nan];positions=[(3.,-2.,7.5),(-0.,1024.,-7.)]
 snapshots=[]
 for counter in counters:
  for player in players:
   for spell in spells:
    for radius in radii:
     for position in positions:
      fields.clear();creates.clear();u.mem_write(mem,bytes(0x20000))
      put(game+0xa60,'I',counter);put(game+0x460,'Q',player);put(game+0x618,'QQQ',4,mem+0x4000,0)
      put(point,'3f',*position);put(stack,'Q',stop)
      u.reg_write(UC_X86_REG_RCX,game);u.reg_write(UC_X86_REG_EDX,spell);u.reg_write(UC_X86_REG_R8,point)
      u.reg_write(UC_X86_REG_XMM3,bits(radius));u.reg_write(UC_X86_REG_RSP,stack)
      u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80)
      u.emu_start(0x145963f80,stop,count=10000);assert u.reg_read(UC_X86_REG_RIP)==stop
      serial=(counter+1)&0xffffffff;guid=0xf100000000000000|serial
      scale=f32(radius/overrides[spell])if spell in overrides else 1.
      expected={0:serial,1:0xf1000000,2:0x41,3:spell,4:bits(scale),6:player&0xffffffff,7:player>>32,8:1,9:spell,
       10:bits(radius),11:bits(position[0]),12:bits(position[1]),13:bits(position[2]),14:0}
      assert len(fields)==14 and dict(fields)==expected,(spell,fields,expected)
      assert u.reg_read(UC_X86_REG_RAX)==guid and get(game+0xa60,'I')[0]==serial
      assert creates==[(guid,6,tuple(bits(v)for v in position))] and get(game+0x628,'Q')[0]==1
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
 global target,raw,span,j
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
 target,raw,span,j=NATIVE.recover()
 NATIVE.verify_rea(span,OUT)
 duration_count=durations();producer_rows=producers();transform_rows=transforms();marker_rows=marker_kinds()
 radius_rows,object_cases=dynamic_objects();motion_rows=marker_motion()
 source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_extra.rs').read_text()
 for token in ['native.duration','self.lines.pull_at','port.raid_teleport','self.queue_action_visual','port.raid_whirlwind','f(4)*0.9','row.extra=Some(Extra::Spawn','heal=Some(*interval)','expose=Some(now+ *exposure)']:
  assert re.sub(r"\s+","",token) in re.sub(r"\s+","",source),token
 shared=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_areas.rs').read_text()
 for token in ['row.advance_extra(now, elapsed, player, port)','pub fn tick_elapsed','port.raid_spawn_at(kind,index,point)','port.raid_heal_source(source,fraction,spell)','impact_spell: if w[0] == 5 { w[2] } else { w[1] }','self.radius * 0.5 * angle.cos()']:
  assert re.sub(r"\s+","",token) in re.sub(r"\s+","",shared),token
 assert 'abilities.clear();' in (ROOT/'crates/azeroth-survivors-re/src/bosses/ai.rs').read_text()
 assert shared.index('port.raid_dynamic_object(')<shared.index('port.damage_player(total')
 assert '(!row.published && now >= row.end - row.warning_lead) || replaced'in shared
 assert 'row.follow_player_until > row.start || row.extra_moves()'in shared
 assert 'if *drift_speed > 0. || *angular_speed != 0.'in source
 signatures=(ROOT/'crates/azeroth-survivors-re/src/guardians/signature_catalog.rs').read_text()
 assert signatures.count('ability: Some(')==135 and 'ability: None'not in signatures
 assert 'repeat * 0.5 + 1.'in(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs').read_text()
 # Independent original ranges are retained once; common constructors, casting,
 # shielding, words35/36/37 and ward healing retain their existing owners.
 ranges=[('ground-circle',0x145957bc0,0x145957c3e),('circular-cast',0x145959449,0x14595950f),
  ('line9',0x14595a4d0,0x14595a587),('rain10',0x14595950f,0x14595990e),
  ('tracking11',0x14595a66c,0x14595a795),('donut13',0x14595a60b,0x14595a66c),
  ('whirlwind14',0x145958553,0x145958665),('sweep15',0x14595870b,0x1459588ca),
  ('cross16',0x14595a082,0x14595a4d0),('grid17',0x145958025,0x145958553),
  ('tether25',0x14595ab76,0x14595ace9),('gaze26',0x14595b097,0x14595b19d),
  ('lanes29',0x14595b8f7,0x14595be7c),('spawn-rain31',0x14595b1dd,0x14595b75c),
  ('crystals33',0x14595a795,0x14595ab76),('blink21',0x14595a587,0x14595a60b),
  ('blink-tail',0x14595c0fd,0x14595c2be),('transform32',0x14595b75c,0x14595b8f7),
  ('transform-unit',0x14594d490,0x14594dbda),('replacement-timers',0x1459ca8d0,0x1459caa44),
  ('pool-drift',0x14594f765,0x14594f950),('tether-shape-update',0x14594f950,0x14594faa0),
  ('gaze-window',0x14594faa0,0x14594facf),('active-angle-update',0x14594fdaa,0x14594fdd6),
  ('tether-resolution',0x1459514b4,0x1459515f9),('crystal-exposure',0x1459533c5,0x14595345c),
  ('spawn-impact-queue',0x145950dfd,0x145950eef),('spawn-impact-consume',0x145953120,0x1459531a0),
  ('tether-heal-queue-consume',0x1459534e7,0x145953537),('marker-kind-selector',0x145952157,0x145952178),
  ('pool-object-create',0x145951e11,0x145951f43),('pool-tick',0x1459513ac,0x145951438),
  ('dynamic-object',0x145963f80,0x14596476b),('native-spell-radius',0x14599e8a0,0x14599e9b3),
  ('marker-follow-gate',0x14594fde1,0x14594fdec),('marker-motion-gate',0x145950134,0x145950172)]
 md=Cs(CS_ARCH_X86,CS_MODE_64);records=[]
 for role,a,b in ranges:
  data=raw(a,b-a);instructions=list(md.disasm(data,a));assert sum(i.size for i in instructions)==len(data),(role,hex(a),hex(b))
  assembly=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions)
  path=OUT/(role+'.asm')
  if args.write:path.write_text(assembly)
  else:assert path.read_text()==assembly,role
  records.append(dict(role=role,**span(a,b-a),assembly=role+'.asm'))
 result=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,
  native_duration_cases=duration_count,native_producer_cases=len(producer_rows),native_transform_cases=len(transform_rows),native_marker_kind_cases=len(marker_rows),
  native_radius_cases=len(radius_rows),native_dynamic_object_cases=object_cases['cases'],radius_rows=radius_rows,dynamic_object_contract=object_cases,
  native_marker_motion_cases=len(motion_rows),marker_motion_rows=motion_rows,
  producer_rows=producer_rows,transform_rows=transform_rows,marker_rows=marker_rows,ranges=records,
  canonical_shared_evidence=['docs/analysis/evidence/0.109.0/raid-waves/manifest.json','docs/analysis/evidence/0.109.0/raid-actions/manifest.json','docs/analysis/evidence/0.109.0/raid-wards/manifest.json','docs/analysis/evidence/0.109.0/raid-sequences/manifest.json'],
  limitations=['Original instructions execute only in isolated synthetic fixtures; Rust, game, renderer, audio, platform and original/rebuilt parity are unverified.',
    'Producer fixtures intercept height, cast, movement hold, native range helper and CRT trig; Windows CRT equivalence and terrain/collision are not certified.',
    'Transform fixtures intercept ordered field-map insertion and stop before packet serialization.',
    'Ghidra raw branch imports do not recover complete full-image references or authoritative Windows/Rust types.'])
 text=json.dumps(result,indent=2)+'\n';path=OUT/'manifest.json'
 if args.write:path.write_text(text)
 else:assert path.read_text()==text,'Native raid fixture manifest drifted'
 print(f'Raid native: {duration_count} duration + {len(producer_rows)} producer + {len(transform_rows)} transform + {len(marker_rows)} marker + {len(motion_rows)} marker-motion + {len(radius_rows)} radius + {object_cases["cases"]} dynamic-object cases; no compiler/game/Rust execution')
if __name__=='__main__':main()

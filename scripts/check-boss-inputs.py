#!/usr/bin/env python3
"""Verify all current boss headers and480 bounded constructor arithmetic cases.

No compiler/game or Rust execution. Windows powf results are injected; current
native caller gates, call order and operand rounding are executed directly.
"""
from script_sources import load_script
import argparse, hashlib, json, math, re, struct
from coverage_common import ROOT
CHECK = load_script('raid_native_checks', ROOT/'scripts/check-raid-native.py')
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import *
OUT=ROOT/'docs/analysis/evidence/boss-inputs'

def arithmetic():
 u,mem=CHECK.fixture()
 frame=mem+0x8000;game=mem;calls=[];injected=[];stop=0
 f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
 bits=lambda v:struct.unpack('<I',struct.pack('<f',v))[0]
 def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
 def xf(reg):return u.reg_read(reg)&0xffffffff
 def hook(uc,a,n,user):
  if a==stop:uc.emu_stop();return
  if a==0x145bfa165:
   value=injected[len(calls)];calls.append([xf(UC_X86_REG_XMM0),xf(UC_X86_REG_XMM1),bits(value)]);uc.reg_write(UC_X86_REG_XMM0,bits(value));sp=uc.reg_read(UC_X86_REG_RSP);ret=struct.unpack('<Q',uc.mem_read(sp,8))[0];uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,ret)
 u.hook_add(UC_HOOK_CODE,hook)
 profiles=[[0.,1.,100,100,100,0,False,0.,7.,9.],[600.,1.5,175,80,140,0,False,0.,1.,1.],[600.,1.,0,0,0,0,False,0.,1.,1.],[1200.,.75,65535,65535,65535,0,False,0.,1.,1.],[817.5,2.25,140,120,75,1,True,720.,1.375,2.],[600.,1.,100,100,100,1,True,720.,1.,1.],[817.5,1.,100,100,100,0,True,720.,3.,4.],[720.,1.,100,100,100,1,True,720.,1.,1.]]
 results=[]
 for zi in range(12):
  zone=0x146bde390+zi*240;ptr,count=struct.unpack('<QQ',raw(zone+0x88,16));scale=struct.unpack('<f',raw(zone+224,4))[0]
  for bi in range(count):
   boss=ptr+bi*104;words=struct.unpack('<26I',raw(boss,104));value=lambda i:struct.unpack('<f',struct.pack('<I',words[i]))[0]
   for pi,p in enumerate(profiles):
    clock,difficulty,hp,damage,speed,phase,endless,start,pdamage,php=p;u.mem_write(mem,bytes(0x10000));put(game+0x970,'If',phase,start);put(game+0xab8,'B',int(endless));put(game+0xa34,'f',clock);put(game+0xaa8,'f',difficulty);put(game+0x2b2,'HHH',hp,damage,speed)
    for reg,val in [(UC_X86_REG_RSI,game),(UC_X86_REG_R13,boss),(UC_X86_REG_R14,zone),(UC_X86_REG_RBP,frame),(UC_X86_REG_RSP,frame-0x200)]:u.reg_write(reg,val)
    u.reg_write(UC_X86_REG_MXCSR,0x1f80);u.reg_write(UC_X86_REG_EFLAGS,2);calls.clear();injected=[pdamage,php];stop=0x14596db66;u.emu_start(0x14596dab9,0,count=1000);assert u.reg_read(UC_X86_REG_RIP)==stop
    u.reg_write(UC_X86_REG_XMM9,words[18]);stop=0x14596e028;u.emu_start(0x14596dec9,0,count=1000);assert u.reg_read(UC_X86_REG_RIP)==stop
    result=[struct.unpack('<I',u.mem_read(frame+o,4))[0]for o in [0x118,0x11c,0x120,0x124,0x12c,0x154,0x16c,0x170]]
    exponent=max(f32(f32(clock-start)/60.),0.)if phase==1 and endless else 0.;assert calls==([[bits(1.096),bits(exponent),bits(pdamage)],[bits(1.22),bits(exponent),bits(php)]]if phase==1 and endless else[])
    pfhp=php if phase==1 and endless else 1.;pfdamage=pdamage if phase==1 and endless else 1.;health=f32(f32(f32(f32(value(21)*5.75)*scale)*difficulty)*pfhp);health=f32(f32(hp/100.)*health);dmg=f32(f32(math.sqrt(f32(scale*difficulty)))*value(22));dmg=f32(f32(dmg*pfdamage)*f32(damage/100.));movement=f32(f32(speed/100.)*value(23));assert result[:4]==[bits(health),bits(health),bits(dmg),bits(movement)],(zi,bi,pi,result[:4]);results.append([zi,bi,pi,calls.copy(),result])
 return dict(profiles=profiles,cases=results)

def replacement_timers(graph):
 """Execute the current list-timer constructor, including its SIMD boundary."""
 u,mem=CHECK.fixture();arena=mem+0x4000;stop=mem+0xff00
 def hook(uc,a,n,user):
  if a not in [0x140002200,0x1400021c0]:return
  if a==0x1400021c0:uc.reg_write(UC_X86_REG_RAX,arena)
  sp=uc.reg_read(UC_X86_REG_RSP);ret=struct.unpack('<Q',uc.mem_read(sp,8))[0];uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,ret)
 u.hook_add(UC_HOOK_CODE,hook);rows=[]
 inputs=[]
 for action in graph['actions']:
  if action['native_tag'] in [0,1,2,32]:
   pointer=action['words'][0]|action['words'][1]<<32
   inputs.append((action['index'],pointer,[graph['actions'][i]['repeat_bits']for i in action['children']]))
 for n in [0,1,7,8,9,16]:
  values=[struct.unpack('<I',struct.pack('<f',float(i)+.75))[0]for i in range(n)]
  inputs.append((f'synthetic-{n}',mem+0x1000,values))
 for identity,pointer,values in inputs:
  u.mem_write(mem,bytes(0x10000))
  if isinstance(identity,str):
   for i,bits in enumerate(values):u.mem_write(pointer+i*56+48,struct.pack('<I',bits))
  u.mem_write(mem+0xe000,struct.pack('<Q',stop))
  for reg,value in [(UC_X86_REG_RCX,mem),(UC_X86_REG_RDX,pointer),(UC_X86_REG_R8,pointer+len(values)*56),(UC_X86_REG_RSP,mem+0xe000)]:u.reg_write(reg,value)
  u.reg_write(UC_X86_REG_EFLAGS,2);u.reg_write(UC_X86_REG_MXCSR,0x1f80);u.emu_start(0x1459ca8d0,stop,count=10000);assert u.reg_read(UC_X86_REG_RIP)==stop
  count,data,length=struct.unpack('<QQQ',u.mem_read(mem,24));assert count==length==len(values)
  actual=list(struct.unpack('<'+'I'*count,u.mem_read(data,count*4)))if count else[]
  expected=[struct.unpack('<I',struct.pack('<f',struct.unpack('<f',struct.pack('<I',v))[0]*.5+1.))[0]for v in values]
  assert actual==expected,(identity,actual,expected);rows.append(dict(action=identity,count=count,timer_bits=actual))
 return rows

def main():
 global raw
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
 target,raw,span,graph=CHECK.NATIVE.recover();CHECK.raw=raw
 CHECK.NATIVE.verify_rea(span,OUT)
 source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
 blocks=re.findall(r'^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)',source,re.M|re.S);assert len(blocks)==60
 rows=[];index=0
 for zi in range(12):
  zva=0x146bde390+zi*240;pointer,n=struct.unpack('<QQ',raw(zva+0x88,16));assert n==5
  for bi in range(n):
   a=pointer+104*bi;words=struct.unpack('<26I',raw(a,104));block=blocks[index];index+=1
   row=dict(zone_index=zi,boss_index=bi,record=span(a,104),words=list(words))
   for field,wi in [('id',16),('model_id',17),('raw_3c',19),('raw_50',24),('flag_54',25)]:
    actual=int(re.search(r'\b'+field+r':\s*(\d+)',block)[1]);assert actual==(words[wi]&255 if field=='flag_54'else words[wi]),(words[16],field)
   for field,wi in [('scale',18),('time_minutes',20),('base_hp',21),('base_damage',22),('raw_4c',23)]:
    actual=int(re.search(r'\b'+field+r':\s*f32::from_bits\(0x([0-9a-f]+)',block)[1],16);assert actual==words[wi],(words[16],field)
   for field,offset in [('name',0),('yell',32)]:
    text_pointer,length=struct.unpack('<QQ',raw(a+offset,16));expected=raw(text_pointer,length).decode();actual=json.loads(re.search(r'\b'+field+r':\s*("(?:\\.|[^"\\])*")',block)[1]);assert actual==expected,(words[16],field);row[field]=expected
   rows.append(row)
 result=arithmetic();result['replacement_timer_cases']=replacement_timers(graph)
 body=(ROOT/'crates/azeroth-survivors-re/src/bosses/scaling.rs').read_text()
 assert 'if input.phase == 1 && input.endless'in body
 assert body.index('powf(1.096, exponent)')<body.index('powf(1.22, exponent)')
 ranges=[('health-endless',0x14596dab9,0x14596db66),('damage-actor-stats',0x14596dec9,0x14596e028),
  ('boss-enrage',0x14597a491,0x14597a4ca),('boss-phase-ratio',0x14597a4ca,0x14597a520),
  ('boss-recurring',0x14597a835,0x14597aa81)]
 md=CHECK.Cs(CHECK.CS_ARCH_X86,CHECK.CS_MODE_64);records=[]
 if args.write:OUT.mkdir(parents=True,exist_ok=True)
 for role,a,b in ranges:
  data=raw(a,b-a);ins=list(md.disasm(data,a));assert sum(i.size for i in ins)==len(data)
  assembly=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins);p=OUT/(role+'.asm')
  if args.write:p.write_text(assembly)
  else:assert p.read_text()==assembly,role
  records.append(dict(role=role,**span(a,b-a),assembly=role+'.asm'))
 result.update(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,boss_headers=rows,ranges=records,
  canonical_graph='../raid-native/catalog.json',canonical_phase_gate='../raid-towers/manifest.json',
  limitations=['All60 semantic input headers agree; this does not validate position, full constructors, actor publication, engine behavior or parity.',
   '480 cases execute current arithmetic fragments with synthetic state and explicit injected Windows powf results. Rust/game/rendering/platform parity remains unverified.',
   'Enrage/phase/recurring assembly is inspected separately from the480 arithmetic fixtures; phase gate native cases retain their original owning report.'])
 text=json.dumps(result,indent=2)+'\n';p=OUT/'manifest.json'
 if args.write:p.write_text(text)
 else:assert p.read_text()==text,'Current boss input/math evidence drifted'
 print(f'Boss inputs:60 exact headers;480 native arithmetic +{len(result["replacement_timer_cases"])} replacement-timer cases; no compiler/game')
if __name__=='__main__':main()

#!/usr/bin/env python3
"""Recover current native Amulet records with bounded constructor execution.

Only145414300,145415f40 and the1454e2bef..2c69 draw span run as original code. Vec reserve, locale
miss, Rust string formatting, memcmp, roundf and deallocation are reviewed
boundaries; unknown calls fail closed. No process, OS or network calls run.
"""
from native_recovery import f32 as _shared_f32
from script_sources import load_script
from native_recovery import effects as decode_effects
from pathlib import Path
import sys, struct, json, hashlib, math
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
m = load_script('inventory', R/'scripts/inventory-executable.py')
d=(R/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe').read_bytes();SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589';assert hashlib.sha256(d).hexdigest()==SHA;p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
calls={}
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,value):u.mem_write(a,struct.pack('<Q',value))
def text(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return text(q(a),q(a+8))
def alloc(n):
 global next_heap
 at=next_heap;next_heap+=(n+15)&~15;u.mem_write(at,bytes(n));return at
def outstr(dest,value):
 raw=value.encode();at=alloc(len(raw)+1);u.mem_write(at,raw);u.mem_write(dest,struct.pack('<QQQ',len(raw),at,len(raw)))
def hook(_,a,size,unused):
 if 0x145414300<=a<0x145415853 or 0x145415f40<=a<0x1454161cb or 0x1454e2bef<=a<0x1454e2c69:return
 calls[a]=calls.get(a,0)+1;rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);r8=u.reg_read(UC_X86_REG_R8)
 if a==0x145764080:
  if q(rcx)==0:wq(rcx+8,alloc(256*64))
  wq(rcx,256)
 elif a==0x145452400:u.reg_write(UC_X86_REG_RAX,0)
 elif a in [0x140002200,0x1400021d0]:pass
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x145756dd7:u.reg_write(UC_X86_REG_RAX,int(u.mem_read(rcx,r8)!=u.mem_read(rdx,r8)))
 elif a==0x145756e1f:
  value=struct.unpack('<f',struct.pack('<I',u.reg_read(UC_X86_REG_XMM0)&0xffffffff))[0]
  rounded=math.copysign(math.floor(abs(value)+.5),value)
  u.reg_write(UC_X86_REG_XMM0,struct.unpack('<I',struct.pack('<f',rounded))[0])
 elif a==0x14570bf80:
  ptr=rdx;argi=0;value=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:value+=text(ptr,op);ptr+=op;continue
   assert op==0xc0,hex(op)
   at,formatter=q(r8+argi*16),q(r8+argi*16+8);argi+=1
   assert formatter==0x1400020c0,hex(formatter)
   value+=pair(at)
  outstr(rcx,value)
 else:raise RuntimeError('Unreviewed native call '+hex(a))
 sp=u.reg_read(UC_X86_REG_RSP);u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
u.hook_add(UC_HOOK_CODE,hook)
def effects(ptr, count):
    return decode_effects(ptr, count, u.mem_read, text, p.image_base, end)
source=json.loads((R/'docs/analysis/evidence/0.97.2/player-abilities/catalog.json').read_text())['definitions'];generated=[]
for definition in source:
 next_heap=HEAP+0x1000;out=HEAP;u.mem_write(out,bytes(112));address=int(definition['record']['virtual_address'],16)
 sp=STACK+0x1f0008;wq(sp,STOP)
 for r,v in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,address)]:u.reg_write(r,v)
 try:u.emu_start(0x145414300,STOP,count=100000)
 except Exception as error:raise RuntimeError(definition['key']+' pc'+hex(u.reg_read(UC_X86_REG_RIP))+': '+str(error))from error
 assert u.reg_read(UC_X86_REG_RIP)==STOP
 generated.append({'ability_key':definition['key'],'key':pair(out+8),'name':pair(out+32),'icon':pair(out+72),'rarity':q(out+96),'effects':effects(q(out+56),q(out+64))})
shared=[]
for i in range(17):
 at=0x14671f7b0+i*80
 shared.append({'key':pair(at),'name':pair(at+16),'icon':pair(at+32),'rarity':q(at+64),'effects':effects(q(at+48),q(at+56)),'record_address':hex(at)})
assert len(generated)==112 and len(shared)==17
def f32(value):
    return _shared_f32(value)
by_key={definition['key']:definition for definition in source}
fixtures=[]
for amulet in generated+shared:
 keys=[amulet['ability_key'],'perception'] if 'ability_key'in amulet else ['cleave','pw_shield','arcane_missiles']
 for key in dict.fromkeys(keys):
  definition=by_key[key];address=int(definition['record']['virtual_address'],16)
  next_heap=HEAP+0x1000;out=HEAP;aggregate=alloc(96);rows=[]
  expected=[1.,1.,0,1.,1.,0.,1.];reduction=0.;targets=0.
  for record in amulet['effects']:
   effect=record['effect']
   if effect['kind']!='spell':continue
   raw=bytes.fromhex(record['raw_hex']);row=bytearray(32);row[:24]=raw[8:32];row[24]=raw[36];row[28:32]=raw[32:36];rows.append(row)
   selector=effect['selector']
   if selector['kind']=='key'and selector['key']!=key:continue
   amount=struct.unpack('<f',struct.pack('<I',effect['amount_bits']))[0];modifier=effect['modifier']
   if modifier==1:reduction=f32(reduction+amount)
   elif modifier==2:targets=f32(targets+amount)
   else:expected[modifier]=f32(expected[modifier]+amount)
  expected[1]=max(f32(1.-reduction),f32(.4));expected[2]=max(0,min(math.floor(targets+.5),0xffffffff))
  if rows:
   pointer=alloc(len(rows)*32);u.mem_write(pointer,b''.join(rows));u.mem_write(aggregate+24,struct.pack('<QQQ',len(rows),pointer,len(rows)))
  sp=STACK+0x1f0008;wq(sp,STOP)
  for register,value in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,aggregate),(UC_X86_REG_R8,address)]:u.reg_write(register,value)
  u.emu_start(0x145415f40,STOP,count=100000)
  assert u.reg_read(UC_X86_REG_RIP)==STOP
  native=bytes(u.mem_read(out,28));model=struct.pack('<ffIffff',*expected)
  assert native==model,(amulet['key'],key,native.hex(),model.hex())
  fixtures.append({'amulet_key':amulet['key'],'ability_key':key,'native_lane_bits':list(struct.unpack('<7I',native))})
payload={'target_sha256':SHA,'legendary_owner':'0x145414300','shared_table':'0x14671f7b0','shared_stride':80,'generated':generated,'shared':shared,'limitations':['Emulated constructors are not original application runtime observations.','Effect tags/raw payloads are retained; complete runtime effect composition and all variant semantics are separate recovery.','Raw pointer words are forensic data only; strings are independently retained as source values.']}
asset=R/'crates/azeroth-survivors-re/assets/native-amulets-0.97.2.json';asset.write_text(json.dumps(payload,indent=2,ensure_ascii=False)+'\n')
evidence=R/'docs/analysis/evidence/0.97.2/native-overlays'
(evidence/'amulet-modifier-fixtures.json').write_text(json.dumps({'target_sha256':SHA,'owner':'0x145415f40','fixture_count':len(fixtures),'mismatches':0,'lane_order':['power:f32','cooldown:f32','targets:u32','area:f32','duration:f32','health_power:f32','effect:f32'],'fixtures':fixtures,'limits':['Finite current catalogue inputs at base empowerment1; source Rust was not compiled/executed by this helper.','Reviewed roundf import is substituted; extreme/nonfinite inputs remain outside the fixtures.']},indent=2)+'\n')
draws=[];mask=(1<<64)-1
def native_step(words):
 a,b,c,d=words;value=(a+d)&mask;value=((value<<23)|(value>>(64-23)))&mask;value=(value+a)&mask
 shifted=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=shifted;d=((d<<45)|(d>>(64-45)))&mask
 return value,[a,b,c,d]
for count in [1,2,3,4,5,7,8,9,17,19,31,63]:
 for initial in [[1,2,3,4],[0x123456789abcdef0,0xfedcba9876543210,0xdeadbeef12345678,0x987654321abcdef0],[mask,1,mask>>1,2]]:
  next_heap=HEAP+0x1000;game=alloc(0x960);u.mem_write(game+0x880,struct.pack('<4Q',*initial))
  u.reg_write(UC_X86_REG_R14,game);u.reg_write(UC_X86_REG_R12,count)
  u.emu_start(0x1454e2bef,0x1454e2c69,count=100000)
  assert u.reg_read(UC_X86_REG_RIP)==0x1454e2c69
  index=u.reg_read(UC_X86_REG_RDX);actual=list(struct.unpack('<4Q',u.mem_read(game+0x880,32)));words=initial.copy();zone=((count<<(64-count.bit_length()))-1)&mask;consumed=0
  while True:
   value,words=native_step(words);consumed+=1;product=value*count
   if product&mask<=zone:expected=product>>64;break
  assert index==expected and actual==words,(count,initial,index,expected,actual,words)
  draws.append({'count':count,'initial_words':[hex(x)for x in initial],'index':index,'consumed_draws':consumed,'final_words':[hex(x)for x in actual]})
(evidence/'amulet-draw-fixtures.json').write_text(json.dumps({'target_sha256':SHA,'range':['0x1454e2bef','0x1454e2c69'],'fixture_count':len(draws),'mismatches':0,'fixtures':draws,'limitations':['Unchanged bounded native sampler instructions with no substituted calls.','No Rust compilation/execution or original application observation.']},indent=2)+'\n')
(evidence/'amulet-construction.json').write_text(json.dumps({'target_sha256':SHA,'source_asset':str(asset.relative_to(R)),'source_sha256':hashlib.sha256(asset.read_bytes()).hexdigest(),'method':__doc__,'generated_count':len(generated),'shared_count':len(shared),'modifier_fixtures':len(fixtures),'calls':{hex(k):v for k,v in calls.items()}},indent=2)+'\n')
print('Recovered',len(generated),'generated native amulets and',len(shared),'shared definitions;',len(fixtures),'modifier vectors and',len(draws),'sampler states match; not runtime effect parity')

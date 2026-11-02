#!/usr/bin/env python3
"""Replay current gear stat descriptions with bounded original x64 instructions.

Default verifies retained text/locale vectors; --write curates them. All seams
are declared in the retained record. No compiler, OS, VM or game runs.
"""
from decimal import Decimal
import argparse,hashlib,sys,struct,json,math,importlib.util
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes
parser=argparse.ArgumentParser();parser.add_argument("--write",action="store_true");args=parser.parse_args()
SHA="76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
assert latest_target(verify=False)["sha256"]==SHA
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
import unicorn.x86_const as r
s=importlib.util.spec_from_file_location('pe',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);data=target_bytes(latest_target(verify=False));pe=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size']) for s in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
heap,stack,done=0x200000000,0x300000000,0x400000000
u.mem_map(heap,0x200000);u.mem_map(stack,0x200000);u.mem_map(done,4096);cursor=heap+0x1000
q=lambda at:struct.unpack('<Q',u.mem_read(at,8))[0]
put=lambda at,*v:u.mem_write(at,struct.pack('<'+'Q'*len(v),*v))
reg=lambda x:u.reg_read(x)
text=lambda at,n:bytes(u.mem_read(at,n)).decode()
pair=lambda at:text(q(at),q(at+8))
locale={};lookups=[];numbers=[];calls={}
f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
fvalue=lambda x:struct.unpack('<f',(reg(x)&0xffffffff).to_bytes(4,'little'))[0]
def alloc(n):
 global cursor
 at=cursor;cursor+=(max(n,1)+15)&~15;assert cursor<heap+0x200000;return at

def output(at,v):
 b=v.encode();p=alloc(len(b)+1);u.mem_write(p,b);put(at,len(b),p,len(b))
def number(at,fmt,precision=None):
 if fmt in [0x1400020c0,0x1400020e0]:return pair(at if fmt==0x1400020c0 else at+8)
 if fmt in [0x145bde8e0,0x145bdf7d0,0x145bdb210]:return str(struct.unpack('<I',u.mem_read(at,4))[0])
 assert fmt==0x145bddbe0,hex(fmt)
 v=struct.unpack('<f',u.mem_read(at,4))[0];numbers.append([v,precision])
 if precision is not None:return format(v,f'.{precision}f')
 short=next(format(v,f'.{n}g') for n in range(1,10) if struct.pack('<f',float(format(v,f'.{n}g')))==struct.pack('<f',v))
 return format(Decimal(short),'f') if 'e' in short.lower() else short
def hook(_,pc,size,unused):
 if 0x1459a0760<=pc<0x1459a0969 or 0x145895e40<=pc<0x145896fc5 or 0x1459a2e90<=pc<0x1459a31c1 or 0x1459a0970<=pc<0x1459a0e10:return
 calls[hex(pc)]=calls.get(hex(pc),0)+1
 rcx,rdx,r8,r9=[reg(v) for v in [r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_R9]]
 if pc in [0x140002200,0x1400021d0]:pass
 elif pc==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,alloc(rcx))
 elif pc==0x145bfa0e7:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(r.UC_X86_REG_RAX,rcx)
 elif pc in [0x145bfa10b,0x145bfa111]:
  v=fvalue(r.UC_X86_REG_XMM0);v=math.copysign(math.floor(abs(v)+.5),v) if pc==0x145bfa10b else math.trunc(v);u.reg_write(r.UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',v),'little'))
 elif pc==0x1458ec500:
  key=text(rcx,rdx);lookups.append(key);v=locale.get(key)
  if v is None:u.reg_write(r.UC_X86_REG_RAX,0);u.reg_write(r.UC_X86_REG_RDX,0)
  else:
   b=v.encode();a=alloc(len(b)+1);u.mem_write(a,b);u.reg_write(r.UC_X86_REG_RAX,a);u.reg_write(r.UC_X86_REG_RDX,len(b))
 elif pc in [0x1458ec4b0,0x1458ec8b0]:
  key=text(rdx,r8);lookups.append(key);v=locale.get(key,key);count=q(reg(r.UC_X86_REG_RSP)+40)
  for i in range(count):
   at=r9+i*32;v=v.replace('{'+pair(at)+'}',number(q(at+16),q(q(at+24)+24)))
  output(rcx,v)
 elif pc==0x145bcce30:
  at,arg,v=rdx,0,''
  while True:
   op=u.mem_read(at,1)[0];at+=1
   if op==0:break
   if op<0x80:v+=text(at,op);at+=op;continue
   precision=None
   if op in [0xc1,0xc5]:
    at+=4;precision=0
    if op==0xc5:precision=struct.unpack('<H',u.mem_read(at,2))[0];at+=2
   else:assert op==0xc0,hex(op)
   v+=number(q(r8+arg*16),q(r8+arg*16+8),precision);arg+=1
  output(rcx,v)
 else:raise RuntimeError(f'Unknown callee {pc:#x} caller {q(reg(r.UC_X86_REG_RSP)):#x}')
 sp=reg(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,q(sp));u.reg_write(r.UC_X86_REG_RSP,sp+8)
u.hook_add(UC_HOOK_CODE,hook)

# Exact current IAT imports bind the two mathematical host seams.
imports=[]
for address,name in [(0x145bfa10b,'roundf'),(0x145bfa111,'truncf')]:
 at=pe.rva_offset(address-pe.image_base);thunk=data[at:at+6]
 assert thunk[:2]==b'\xff\x25'
 iat=address+6+struct.unpack_from('<i',thunk,2)[0]
 matches=[]
 for library in pe.imports():
  index=(iat-int(library['iat_start_address'],16))//8
  if 0<=index<len(library['functions']):matches.append((library['library'],library['functions'][index]))
 assert len(matches)==1 and matches[0][1]==name
 imports.append(dict(thunk=hex(address),iat=hex(iat),library=matches[0][0],symbol=name))
results=[];fixture=[];all_keys=set();bonus_results=[];bonus_fixture=[]
for code in ['en','pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko']:
 locale=json.loads((ROOT/f'crates/azeroth-survivors-re/assets/locales/{code}.json').read_text())
 records=[];bonuses=[]
 for tag in range(13):
  values=[0.,1.,2.] if tag==11 else [0.,.005,.01,.055,.099,.1,.1234,1.,1.5,2.]
  for value in values:
   cursor=heap+0x1000;lookups=[];numbers=[];out=alloc(24);effect=alloc(8)
   bits=int(value) if tag==11 else int.from_bytes(struct.pack('<f',value),'little')
   u.mem_write(effect,struct.pack('<II',tag,bits));sp=stack+0x1f0008;put(sp,done)
   u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,out);u.reg_write(r.UC_X86_REG_RDX,effect)
   u.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
   u.emu_start(0x1459a0760,done,count=100000);assert reg(r.UC_X86_REG_RIP)==done
   result=None if q(out)==0xffffffffffffffff else pair(out+8)
   all_keys.update(lookups)
   row=dict(tag=tag,value=f32(value),native_text=result)
   records.append(row)
   if code=='en':fixture.append(row)
   put(sp,done);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,out);u.reg_write(r.UC_X86_REG_RDX,effect)
   u.emu_start(0x1459a0970,done,count=100000);assert reg(r.UC_X86_REG_RIP)==done
   bonus_text=pair(out+8);brow=dict(tag=tag,value=f32(value),native_text=bonus_text);bonuses.append(brow)
   if code=='en':bonus_fixture.append(brow)
 results.append(dict(language=code,cases=len(records),native_output_sha256=hashlib.sha256(json.dumps(records,ensure_ascii=False,sort_keys=True).encode()).hexdigest()))
 bonus_results.append(dict(language=code,cases=len(bonuses),native_output_sha256=hashlib.sha256(json.dumps(bonuses,ensure_ascii=False,sort_keys=True).encode()).hexdigest()))
lore_results=[]
for code in ['en','pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko']:
 locale=json.loads((ROOT/f'crates/azeroth-survivors-re/assets/locales/{code}.json').read_text());rows=[]
 for cid,key in [(1,'warrior'),(2,'paladin'),(3,'hunter'),(4,'rogue'),(5,'priest'),(7,'shaman'),(8,'mage'),(9,'warlock'),(11,'druid')]:
  for rarity in [1,2,3,4,5]:
   for index in range(8):
    cursor=heap+0x1000;sp=stack+0x1f0008;put(sp,done)
    u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,cid);u.reg_write(r.UC_X86_REG_RDX,index);u.reg_write(r.UC_X86_REG_R8,rarity)
    u.emu_start(0x1459a2e90,done,count=100000);assert reg(r.UC_X86_REG_RIP)==done
    result=text(reg(r.UC_X86_REG_RAX),reg(r.UC_X86_REG_RDX));expected=locale[f"lore.{'plain' if rarity<3 else key}.{index}"];assert result==expected,(code,cid,rarity,index,result,expected)
    rows.append(result)
 lore_results.append(dict(language=code,cases=len(rows),native_output_sha256=hashlib.sha256(json.dumps(rows,ensure_ascii=False).encode()).hexdigest()))
bonus_start,bonus_end=0x1459a0970,0x1459a0e10;bonus_at=pe.rva_offset(bonus_start-pe.image_base)
proof=dict(target_sha256=SHA,equipment_bonus_range=dict(address=hex(bonus_start),end_exclusive=hex(bonus_end),sha256=hashlib.sha256(data[bonus_at:bonus_at+bonus_end-bonus_start]).hexdigest()),owners_manifest='manifest.json',languages=results,bonus_languages=bonus_results,lore_languages=lore_results,locale_keys=sorted(all_keys),
 mathematical_imports=imports,host_calls=calls,
 host_seams=['allocator/deallocator/copy over fixture-owned memory','roundf/truncf with actual current IAT identity',
 'lookup into current source locale catalogs already independently checked against installed EXE',
 'native compact format decoding including u16 C5 precision, and locale placeholder substitution'],
 limits=['Original dispatcher, stat-description arithmetic/key selection, target-count branch and original string composition execute.',
 'Host formatting, locale lookup and mathematical imports are explicit seams; no OS/filesystem/VM/game reaches execution.',
 'These vectors do not compile or execute the reconstructed source or certify gameplay/render parity.'])
outdir=ROOT/'docs/analysis/evidence/0.109.0/armory-pages'
for name,value in [('stat-text-validation.json',proof),('stat-text-fixtures.json',dict(target_sha256=SHA,cases=fixture)),('bonus-text-fixtures.json',dict(target_sha256=SHA,cases=bonus_fixture))]:
 payload=json.dumps(value,ensure_ascii=False,indent=2)+'\n';path=outdir/name
 if args.write:path.write_text(payload)
 else:assert path.read_text()==payload,name
print(f'Checked {sum(r["cases"] for r in results)} stat, {sum(r["cases"] for r in bonus_results)} bonus and {sum(r["cases"] for r in lore_results)} lore cases across 14 locales; no compiler/game.')

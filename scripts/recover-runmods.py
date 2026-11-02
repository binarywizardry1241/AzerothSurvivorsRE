#!/usr/bin/env python3
"""Replay current RunMods parser, normalization, step and reward owners; no build/game."""
from portable_paths import portable_json, portable_record
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import argparse, hashlib, itertools, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path[:0]=[str(ROOT/'runtime/armory-recovery/python-libs'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
OWNERS={'parse':(0x14590e190,0x14590e3bf),'difficulty':(0x14590e3c0,0x14590e420),'adjust':(0x14590e420,0x14590e496),'reward':(0x14590e4a0,0x14590e508),'csv':(0x1459c3dd0,0x1459c4445),'split':(0x1459c7330,0x1459c74ea),'memchr':(0x145bd5860,0x145bd5945),'input':(0x1401cac30,0x1401cb2ab),'frame':(0x1401ca600,0x1401cac22),'canvas':(0x140267da0,0x140268065),'page':(0x140268070,0x140269117),'row-wrapper':(0x1401c0e30,0x1401c10a4),'row':(0x140269200,0x140269d6e),'summary':(0x1401bfcc0,0x1401bff1e),'summary-child':(0x1402678f0,0x140267d31)}
RETAINED=ROOT/'docs/analysis/evidence/0.109.0/runmods'
STAGED=ROOT/'runtime/native-evidence/0.109.0/runmods'
target=latest_target(verify=False);assert target['sha256']==SHA and target['version']=='0.109.0';data=target_bytes(target)
module = load_script('runmods_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
heap,stack,done=0x200000000,0x300000000,0x400000000
for a,size in [(heap,0x100000),(stack,0x10000),(done,4096)]:u.mem_map(a,size)
cursor=heap+0x1000

def reg(n,v=None):
 ident=getattr(r,'UC_X86_REG_'+n)
 if v is not None:u.reg_write(ident,v)
 return u.reg_read(ident)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def put(a,*values):u.mem_write(a,struct.pack('<'+'Q'*len(values),*values))
def allocate(n):
 global cursor
 result=cursor;cursor+=(n+31)&~15;assert cursor<heap+0x100000;return result

def hook(_,pc,size,__):
 if pc==done:u.emu_stop();return
 if any(a<=pc<b for role,(a,b)in OWNERS.items()if role in('parse','difficulty','adjust','reward','csv','split','memchr')):return
 cx,dx,r8,r9=[reg(n)for n in('RCX','RDX','R8','R9')]
 if pc==0x1400021c0:reg('RAX',allocate(cx))
 elif pc in (0x140002200,0x1400021d0):pass
 elif pc==0x145bfa0e1:
  left,right=bytes(u.mem_read(cx,r8)),bytes(u.mem_read(dx,r8));reg('RAX',((left>right)-(left<right))&0xffffffff)
 elif pc==0x145bfa0e7:
  if r8:u.mem_write(cx,bytes(u.mem_read(dx,r8)))
  reg('RAX',cx)
 elif pc==0x145bfa970:
  capacity=max(q(cx)*2,dx+r8,4);at=allocate(capacity*r9)
  if dx:u.mem_write(at,bytes(u.mem_read(q(cx+8),dx*r9)))
  put(cx,capacity,at)
 else:raise ValueError(('callee',hex(pc)))
 sp=reg('RSP');reg('RIP',q(sp));reg('RSP',sp+8)
u.hook_add(UC_HOOK_CODE,hook)

def call(pc):
 sp=stack+0x8000-8;put(sp,done);reg('RSP',sp);u.emu_start(pc,done,count=100000);assert reg('RIP')==done

def parse(raw):
 global cursor
 cursor=heap+0x1000;encoded=raw.encode();at=allocate(len(encoded)+32);u.mem_write(at,encoded+bytes(32));reg('RCX',at);reg('RDX',len(encoded));call(0x14590e190)
 return list(struct.unpack('<4H',reg('RAX').to_bytes(8,'little')))
def formula(values,role):
 u.mem_write(heap,struct.pack('<4H',*values));reg('RCX',heap);call(OWNERS[role][0]);return f'{reg("XMM0")&0xffffffff:08x}'
def adjust(values,index,direction):
 u.mem_write(heap,struct.pack('<4H',*values));reg('RCX',heap);reg('RDX',index);reg('R8',direction&0xffffffff);call(0x14590e420);return list(struct.unpack('<4H',u.mem_read(heap,8)))
def f32(value):
    return _shared_f32(value)
def expected(values):
 terms=[f32(f32(f32(v-100)/100)*f32(weight))for v,weight in zip(values,[.05,.4,.6,2.])]
 return f32(terms[3]+f32(terms[2]+f32(terms[1]+terms[0])))+1.

def collect():
 base=0x14720bb88;definitions=[]
 for index in range(4):
  at=base+48*index;name=bytes(u.mem_read(q(at),q(at+8))).decode();description=bytes(u.mem_read(q(at+16),q(at+24))).decode();weight=struct.unpack('<f',u.mem_read(at+32,4))[0];minimum,maximum,step=struct.unpack('<3H',u.mem_read(at+36,6));definitions.append(dict(name=name,description=description,weight_bits=f'{struct.unpack("<I",u.mem_read(at+32,4))[0]:08x}',minimum=minimum,maximum=maximum,step=step))
 raw_cases=['','100,100,100,100','125,150,110,105','101,124,109,104','0,0,0,0','65535,65535,65535,65535','+125,+150,+110,+105',' 125,150,110,105','125,150,110,105 ','125,,110,105','1,2,3','1,2,3,4,5','65536,100,100,100','-1,100,100,100','١٠٠,100,100,100','100\u00a0,100,100,100','100,100,100,100,']
 for token in ['bad','-1','65536','','500 ','١٠٠']:
  for index in range(5):
   parts=['500','500','300','150'];parts.insert(index,token);raw_cases.append(','.join(parts))
 raw_cases+=['500,500,300,150,100',' 500,500,300,150,100']
 parsed=[]
 for raw in raw_cases:
  values=parse(raw);parsed.append(dict(input=raw,values=values))
 for index in range(4):
  for value in [0,1,99,100,101,104,105,109,110,124,125,149,150,299,300,499,500,65535]:
   values=[100]*4;values[index]=value;raw=','.join(map(str,values));normalized=parse(raw);row=definitions[index];want=[100]*4;clamped=max(row['minimum'],min(row['maximum'],value));want[index]=100+(clamped-100)//row['step']*row['step'];assert normalized==want;(parsed.append(dict(input=raw,values=normalized)))
 formulas=[]
 for values in itertools.product([100,125,150,300,500],repeat=4):
  values=list(values);difficulty=formula(values,'difficulty');reward=formula(values,'reward');want=f32(expected(values));assert difficulty==struct.pack('>f',want).hex(),(values,difficulty,want);assert reward==struct.pack('>f',min(want,2.)).hex();formulas.append(dict(values=values,difficulty_bits=difficulty,reward_bits=reward))
 steps=[]
 for index,row in enumerate(definitions):
  for current in [0,99,100,101,row['maximum']-1,row['maximum'],65535]:
   for direction in [-100,-1,0,1,100]:
    before=[100]*4;before[index]=current;after=adjust(before,index,direction);want=max(100,min(row['maximum'],current+(direction>0)*row['step']-(direction<0)*row['step']));assert after[index]==want;steps.append(dict(before=before,index=index,direction=direction,after=after))
 ranges={}
 for role,(a,b)in OWNERS.items():
  off=pe.rva_offset(a-pe.image_base);ranges[role]=dict(start=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(data[off:off+b-a]).hexdigest())
 queries=[]
 for group,folder in [('runmods-core','rea'),('runmods-ui','rea'),('runmods-ui','rea-input')]:
  for path in sorted((ROOT/'runtime/menu-lifecycle-0.109.0'/group/folder).glob('*procedure_pseudo_code.json')):
   j=json.loads(path.read_text());z=j['response']['result']['structuredContent'];queries.append(dict(procedure=j['params']['arguments']['procedure'],evidence_id=z['evidence_id'],subject_sha256=z['subject']['digest']['sha256'],analysis_profile_digest=z['analysis_profile']['digest']))
 if not queries:queries=json.loads((RETAINED/'manifest.json').read_text())['ghidra']
 manifest=dict(target=dict(version='0.109.0',sha256=SHA),owners=ranges,definitions=definitions,descriptor_range=dict(start=hex(base),byte_count=192,sha256=hashlib.sha256(bytes(u.mem_read(base,192))).hexdigest()),ghidra=queries,canvas=dict(address='0x145deb740',design=[760,560],max_scale_bits='3fb33333'),checks=dict(parse=len(parsed),formulas=len(formulas),steps=len(steps)),limits=['Unchanged native CSV split/u16 parser, normalization, sign-step/clamp, uncapped difficulty and capped reward instructions execute in Unicorn.','Allocation/free, memcpy/memcmp and RawVec growth use explicit scratch-only seams.','UI typed constructors are separately captured; full ECS input and command delivery remain static review.','No compilation, Rust tests, application, gameplay, save writes or original/rebuilt comparisons.'])
 return manifest,dict(parsed=parsed,formulas=formulas,steps=steps)

def main():
 parser=argparse.ArgumentParser(description=__doc__);group=parser.add_mutually_exclusive_group(required=True);group.add_argument('--collect',action='store_true');group.add_argument('--check',action='store_true');args=parser.parse_args();manifest,vectors=collect()
 if args.collect:
  STAGED.mkdir(parents=True,exist_ok=True)
  (STAGED/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n');(STAGED/'native-vectors.json').write_text(portable_json(vectors,separators=(',',':'),ensure_ascii=False)+'\n');md=Cs(CS_ARCH_X86,CS_MODE_64)
  for role,(a,b)in OWNERS.items():
   off=pe.rva_offset(a-pe.image_base);raw=data[off:off+b-a];body=f';0.109.0 SHA256 {SHA}\n;{a:#x}..{b:#x} SHA256 {hashlib.sha256(raw).hexdigest()}\n';body+='\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}'.rstrip()for i in md.disasm(raw,a))+'\n';(STAGED/(role+'.asm')).write_text(body)
 else:
  assert portable_record(json.loads((RETAINED/'manifest.json').read_text()))==portable_record(manifest);assert portable_record(json.loads((RETAINED/'native-vectors.json').read_text()))==portable_record(vectors)
 print('Verified current native RunMods: '+', '.join(f'{v} {k}'for k,v in manifest['checks'].items())+'; no build/game')
if __name__=='__main__':main()

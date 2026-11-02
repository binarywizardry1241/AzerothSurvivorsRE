#!/usr/bin/env python3
"""Check current achievement menu definitions via original constructor and gear iterator.

Explicit boundaries are allocator/Vec growth, locale miss, compact format and
placeholder substitution. Unknown calls fail closed. No OS/game/save is run.
"""
from script_sources import load_script
from pathlib import Path
import sys, struct, json, hashlib
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
m = load_script('iv', R/'scripts/inventory-executable.py')
from coverage_common import latest_target,target_bytes
target=latest_target(verify=True);assert target['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0';d=target_bytes(target);p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
calls={};formats=[];replacements=[];gear_ids={};ADMITTED=[(0x1458dccb0,0x1458e11aa),(0x1459c38b0,0x1459c3d7b)]
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
def text(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return text(q(a),q(a+8))
def alloc(n):
 global next_heap
 a=next_heap;next_heap+=(n+15)&~15;u.mem_write(a,bytes(n));return a
def outstr(dest,v):
 raw=v.encode();a=alloc(len(raw)+1);u.mem_write(a,raw);u.mem_write(dest,struct.pack('<QQQ',len(raw),a,len(raw)))
def fmarg(a):
 at,fun=q(a),q(a+8)
 if fun>=0x145d9c000:fun=q(fun+24)
 if fun==0x1400020c0:return pair(at)
 if fun==0x1400020e0:return pair(at+8)
 if fun==0x145bde8e0:return str(struct.unpack('<I',u.mem_read(at,4))[0])
 if fun==0x145bdf7d0:return str(q(at))
 raise RuntimeError('unreviewed formatter '+hex(fun))
def hook(_,a,n,unused):
 if a==0x1459c3d7a:
  dest=u.reg_read(UC_X86_REG_RAX);values=list(struct.unpack('<'+'I'*q(dest+16),u.mem_read(q(dest+8),q(dest+16)*4)));gear_ids[values[0]//1000%100 if values else 0]=values
 if any(start<=a<end for start,end in ADMITTED):return
 if a==STOP:u.emu_stop();return
 calls[a]=calls.get(a,0)+1
 rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);r8=u.reg_read(UC_X86_REG_R8);r9=u.reg_read(UC_X86_REG_R9);sp=u.reg_read(UC_X86_REG_RSP)
 if a==0x145bffc70:
  if q(rcx)==0:wq(rcx+8,alloc(256*112))
  assert q(rcx+16)<256;wq(rcx,256)
 elif a==0x145bfa970:
  size=q(sp+0x28);new=max(256,q(rcx)*2,rdx+r8);at=alloc(new*size)
  if q(rcx):u.mem_write(at,bytes(u.mem_read(q(rcx+8),q(rcx)*size)))
  wq(rcx,new);wq(rcx+8,at)
 elif a==0x1458ec500:u.reg_write(UC_X86_REG_RAX,0)
 elif a in [0x140002200,0x1400021d0]:pass
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x145bfa0e7:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x145bcce30:
  ptr=rdx;argi=0;value=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:value+=text(ptr,op);ptr+=op;continue
   assert op==0xc0,hex(op)
   value+=fmarg(r8+argi*16);argi+=1
  formats.append(dict(site=hex(q(sp)-5),value=value));outstr(rcx,value)
 elif a==0x1458ec8b0:
  value=text(rdx,r8);original=value;tokens={}
  for i in range(q(sp+0x28)):
   key=pair(r9+i*32);arg=fmarg(r9+i*32+16);tokens[key]=arg;value=value.replace('{'+key+'}',arg)
  replacements.append(dict(original=original,tokens=tokens,value=value));outstr(rcx,value)
 else:raise RuntimeError('Unreviewed native call '+hex(a)+' from'+hex(q(sp)-5))
 u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
hook_id=u.hook_add(UC_HOOK_CODE,hook)
out=HEAP;ptr=HEAP+0x100;ptr2=HEAP+0x108;wq(ptr,ptr2);wq(ptr2,out)
sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,out)
try:u.emu_start(0x1458dccb0,STOP,count=3000000)
except Exception as e:raise RuntimeError('PC'+hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e))from e
assert u.reg_read(UC_X86_REG_RIP)==STOP
catalog_base=q(out+8)
rows=[]
for i in range(q(out+16)):
 at=q(out+8)+i*112;raw=bytes(u.mem_read(at,112))
 row=dict(key=pair(at+8),name=pair(at+32),description=pair(at+56),kind=raw[72],payload=raw[73:88].hex(),icon=pair(at+88),points=struct.unpack_from('<I',raw,104)[0],category=raw[108])
 rows.append(row)

# Menu data is checked independently of gameplay grant/evaluation behavior.
asset=json.loads((R/'crates/azeroth-survivors-re/assets/progression.json').read_text())
labels=json.loads((R/'crates/azeroth-survivors-re/assets/locales/en.json').read_text())
expected={row['key']:row for row in asset['achievements']}
assert len(rows)==len(expected)==73 and sum(row['points'] for row in rows)==1520
checked=[]
for row in rows:
    source=expected[row['key']]
    result={'key':row['key']}
    for field in ['name','description','icon','points','category']:
        value=source[field]
        if isinstance(value,str):
            value=labels.get(value,value)
            for token,arg in source['tokens'].items():
                value=value.replace('{'+token+'}',labels.get(arg,arg))
        assert value==row[field], (row['key'],field,value,row[field])
        result[field]=value
    checked.append(result)
source=(R/'crates/azeroth-survivors-re/src/progression.rs').read_text()
sidebar=(R/'crates/azeroth-survivors-re/src/progression/achievements_sidebar.rs').read_text()
assert 'let total_points: u32 = catalog.achievements.iter().map(|entry| entry.points).sum();' in source
assert 'let total_achievements = catalog.achievements.len();' in source
for expression in ['total_points.to_string()', 'total.to_string()',
                   'points.wrapping_mul(100) / total_points.max(1)',
                   'points as f32 / total_points.max(1) as f32']:
    assert expression in sidebar, expression
assert '"1365"' not in source and '"66"' not in source

def span(a,b):
    at=p.rva_offset(a-p.image_base)
    return dict(va=hex(a),end_exclusive=hex(b),byte_count=b-a,
                sha256=hashlib.sha256(d[at:at+b-a]).hexdigest())
record=dict(target_sha256=target['sha256'],target_executed=False,
            native_constructor=span(0x1458dccb0,0x1458e11aa),
            native_gear_iterator=span(0x1459c38b0,0x1459c3d7b),
            entries=len(rows),points=sum(row['points']for row in rows),
            compared_fields=len(rows)*5,
            fields_digest=hashlib.sha256(json.dumps(checked,ensure_ascii=False,separators=(',',':')).encode()).hexdigest(),
            per_class_gear_counts={str(key):len(value)for key,value in gear_ids.items()},
            limits=['Unchanged current constructor and gear iteration instructions; no game, file operation or rebuilt Rust executes.',
                    'Allocators, Vec growth, memcpy, compact decimal/string formatting, locale-miss lookup and named-token substitution are explicit host seams.',
                    'Only menu keys/text/icons/points/categories are compared. Gameplay grants, achievement predicates and unlock vectors are not certified.'])
import argparse
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
path=R/('runtime/native-evidence/0.109.0/achievements-menu' if args.stage else 'docs/analysis/evidence/0.109.0/achievements-menu')/'catalog.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed365 native menu fields, all73entries/1520points and live summary consumers')

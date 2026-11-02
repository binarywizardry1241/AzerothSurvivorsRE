#!/usr/bin/env python3
"""Replay the current save envelope through original Win64 instructions only.

The native HMAC, scalar SHA-1 compression, keystream, full opener, Unicode trim,
Base64 engine and UTF-8 validator execute. Allocation/copy/free are explicit host
seams; no EXE process, filesystem operation, RNG or application is launched.
"""
from script_sources import load_script
import argparse, ast, base64, hashlib, hmac, json, re, struct, sys
from pathlib import Path
from coverage_common import ROOT as R, latest_target, target_bytes
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--write',action='store_true')
parser.add_argument('--prepare-rea',action='store_true')
args=parser.parse_args()
target=latest_target()
assert target['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
d=target_bytes(target)
module = load_script('save_pe', R/'scripts/inventory-executable.py')
p=module.PE(d)
manifest=json.loads((R/'docs/analysis/evidence/0.109.0/save-core/manifest.json').read_text())
for row in manifest['functions']:
 off=p.rva_offset(int(row['address'],16)-p.image_base)
 assert hashlib.sha256(d[off:off+row['byte_count']]).hexdigest()==row['sha256'],row['name']
 for kind in('assembly','pseudocode'):
  if kind in row:assert hashlib.sha256((R/row[kind]).read_bytes()).hexdigest()==row[kind+'_sha256']
if args.prepare_rea:
 for row in manifest['functions']:
  destination=R/'runtime/save-core-0.109.0/reproduce'/row['name'];destination.mkdir(parents=True,exist_ok=True)
  start=int(row['address'],16);offset=p.rva_offset(start-p.image_base)
  (destination/'owner.bin').write_bytes(d[offset:offset+row['byte_count']])
  plan=dict(target=str((destination/'owner.bin').relative_to(R)),output=str((destination/'rea').relative_to(R)),
   open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),timeout=240,
   operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(start)))])
  (destination/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
 print(f"Prepared {len(manifest['functions'])} current project-local Ghidra plans; no application launch.")
 raise SystemExit(0)
cases=[]
sys.path.insert(0,str(R/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as rr

u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for s in p.sections:u.mem_write(p.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
H,S,STOP=0x200000000,0x300000000,0x400000000;u.mem_map(H,0x100000);u.mem_map(S,0x10000);u.mem_map(STOP,4096);u.mem_write(0x14808a8b0,b'\0')
def get(n):return u.reg_read(getattr(rr,'UC_X86_REG_'+n))
def setr(n,v):u.reg_write(getattr(rr,'UC_X86_REG_'+n),v)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def ret():sp=get('RSP');setr('RIP',q(sp));setr('RSP',sp+8)
allocation=H+0x10000
def hook(_,a,n,__):
 global allocation
 if a==STOP:u.emu_stop();return
 if any(lo<=a<hi for lo,hi in[(0x1458f6280,0x1458f6941),(0x1458f6000,0x1458f627f),(0x145a5dfc0,0x145a5f345),(0x1458f6950,0x1458f6b65),(0x1458e7920,0x1458e7a8b),(0x1459f8370,0x1459f9018),(0x145bd5650,0x145bd5859),(0x140089200,0x140089479)]):return
 if a in(0x145bfa0e7,0x145bfa0ed):u.mem_write(get('RCX'),bytes(u.mem_read(get('RDX'),get('R8'))));setr('RAX',get('RCX'))
 elif a==0x145bfa0db:u.mem_write(get('RCX'),bytes([get('RDX')&255])*get('R8'));setr('RAX',get('RCX'))
 elif a in(0x140002200,0x1400021d0,0x140cb2820):pass
 elif a in(0x1400021c0,0x1400021f0):
  setr('RAX',allocation);u.mem_write(allocation,bytes(get('RCX')));allocation+=(get('RCX')+31)&~15
 else:raise AssertionError(hex(a))
 ret()
u.hook_add(UC_HOOK_CODE,hook)
key=ast.literal_eval(re.search(r'const FORMAT_KEY:.*?=\s*(b"[^"]+")',(R/'crates/azeroth-survivors-re/src/save.rs').read_text(),re.S)[1])
for length in(0,1,19,20,21,55,56,63,64,65,127,128,511):
 parts=(b'tag',bytes(range(16)),b'x'*length)
 u.mem_write(H,bytes(0x10000));pos=H+0x1000
 for i,part in enumerate(parts):u.mem_write(pos,part);put(H+0x100+i*16,'QQ',pos,len(part));pos+=len(part)+16
 sp=S+0x8008;put(sp,'Q',STOP);setr('RSP',sp);setr('RCX',H+0x200);setr('RDX',H+0x100);u.emu_start(0x1458f6280,STOP,count=2000000);assert get('RIP')==STOP
 actual=bytes(u.mem_read(H+0x200,20));assert actual==hmac.digest(key,b''.join(parts),'sha1'),(length,actual.hex())
 cases.append(dict(contract='hmac-native-sha1',length=length,result=actual.hex()))
nonce=bytes(range(16))
def pycrypt(raw):
 out=bytearray(raw)
 for block,start in enumerate(range(0,len(out),20)):
  stream=hmac.digest(key,b'ks'+nonce+block.to_bytes(8,'little'),'sha1')
  for j in range(min(20,len(out)-start)):out[start+j]^=stream[j]
 return bytes(out)
for length in(0,1,19,20,21,39,40,41,55,56,63,64,65,127,128,511):
 raw=bytes(i%256 for i in range(length));u.mem_write(H+0x1000,nonce);u.mem_write(H+0x2000,raw or b'\0')
 sp=S+0x8008;put(sp,'Q',STOP);setr('RSP',sp);setr('RCX',H+0x1000);setr('RDX',H+0x2000);setr('R8',length);u.emu_start(0x1458f6000,STOP,count=2000000);assert get('RIP')==STOP
 actual=bytes(u.mem_read(H+0x2000,length));assert actual==pycrypt(raw),length
 cases.append(dict(contract='crypt',length=length,sha256=hashlib.sha256(actual).hexdigest()))

def native_open(raw):
 global allocation
 allocation=H+0x10000
 u.mem_write(H+0x3000,raw or b'\0');u.mem_write(H+0x4000,bytes(24));sp=S+0x8008;put(sp,'Q',STOP);setr('RSP',sp);setr('RCX',H+0x4000);setr('RDX',H+0x3000);setr('R8',len(raw));u.emu_start(0x1458f6950,STOP,count=4000000);assert get('RIP')==STOP
 if q(H+0x4000)==0xffffffffffffffff:return None
 return bytes(u.mem_read(q(H+0x4008),q(H+0x4010)))
def envelope(raw):
 cipher=pycrypt(raw);return b'RSE1:'+base64.b64encode(nonce+cipher+hmac.digest(key,b'tag'+nonce+cipher,'sha1'))
for raw in(b'',b'hero|1|1|0|0,0,0,0,0\n',bytes(range(128)),b'\xff',b'\xc0\x80',b'\xed\xa0\x80','漢字'.encode()):
 try:raw.decode();expected=raw
 except UnicodeDecodeError:expected=None
 encoded=envelope(raw);actual=native_open(encoded);assert actual==expected,(raw,actual)
 cases.append(dict(contract='open',payload_hex=raw.hex(),accepted=actual is not None))
for raw in(b'',b'RSE1:',b'RSE1:!',b'RSE1:AA==',b'characters',b'rse1:',b'RSE1:'+base64.b64encode(bytes(36))):
 assert native_open(raw)is None,raw
 cases.append(dict(contract='open-reject',input_hex=raw.hex(),accepted=False))
for pad in(b' ',b'\t\r\n','\u2003'.encode()):
 assert native_open(pad+envelope(b'good')+pad)==b'good'
 cases.append(dict(contract='unicode-trim',padding_hex=pad.hex(),accepted=True))
encoded=envelope(b'good')
for changed in(encoded[:-1],encoded[:-2],encoded+b'=',encoded+b'\n',encoded[:15]+b'\n'+encoded[15:]):
 actual=native_open(changed)
 assert actual==(b'good' if changed==encoded+b'\n' else None)
 cases.append(dict(contract='base64-admission',input_hex=changed.hex(),accepted=actual is not None))

# Every authentication byte is independently covered, and decryption occurs only
# after the complete original tag comparison has admitted the body.
original=base64.b64decode(encoded[5:])
for index in range(len(original)):
 altered=bytearray(original);altered[index]^=1
 assert native_open(b'RSE1:'+base64.b64encode(altered)) is None
 cases.append(dict(contract='authenticated-byte',index=index,accepted=False))
record=dict(target_version=target['version'],target_sha256=target['sha256'],
 target_executed=False,compilation=False,case_count=len(cases),cases=cases,
 seams=['allocator/deallocator','memcpy/memmove/memset','failed-UTF8 String drop'],
 scalar_sha1_cpu_cache=0)
output=R/'docs/analysis/evidence/0.109.0/save-core/envelope.json'
if args.write:output.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(output.read_text())==record
print(f"PASS {len(cases)} current native save-envelope cases, including full opener and scalar SHA-1; no compilation or application launch.")

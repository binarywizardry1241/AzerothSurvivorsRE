#!/usr/bin/env python3
"""Replay current active-load/migration/corrupt-copy policy without native file I/O.

Typed parsing, formatting, prefix trim and slot selection run original instructions.
The sealed opener has a separately verified91-case contract; its result and file
reads/writes are declared fixture seams here. No application is launched.
"""
import sys,json,argparse,hashlib,ast,re,base64,hmac
from pathlib import Path
sys.path.insert(0,'scripts')
from native_save_fixture import CPU,ROOT,SHA,RUST_WHITESPACE
from unicorn import x86_const as r
DEST=ROOT/'docs/analysis/evidence/save-load'
ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
cpu=CPU();manifest=json.loads((DEST/'manifest.json').read_text());assert manifest['target_sha256']==SHA
for row in manifest['owners']:
 a,b=int(row['start'],16),int(row['end'],16)
 assert cpu.ends[a]==b and hashlib.sha256(cpu.raw(a,b)).hexdigest()==row['sha256']
 assert hashlib.sha256((DEST/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256']
 cpu.allow_owner(a)
assert hashlib.sha256((DEST/manifest['pseudocode']).read_bytes()).hexdigest()==manifest['pseudocode_sha256']
context={};events=[]
def reg(name):return cpu.reg(getattr(r,'UC_X86_REG_'+name))
def string(c,value):
 if value is None:cpu.put(c,2**64-1,0,0)
 else:
  raw=value.encode();a=cpu.alloc(len(raw)+1);cpu.u.mem_write(a,raw+b'\0');cpu.put(c,len(raw),a,len(raw))
def text(c,d):return bytes(cpu.u.mem_read(c,d)).decode()
def hook(c,a):
 C,D,R8,R9=[reg(n)for n in ('RCX','RDX','R8','R9')]
 if a==0x1458ef570:string(C,context['input'])
 elif a==0x1458f01c0:
  stem=text(D,R8);events.append(['read',stem]);string(C,context['files'].get(stem))
 elif a==0x1458eef30:events.append(['write',text(C,D),text(R8,R9)])
 elif a==0x1458f6950:string(C,context['opened'])
 elif a==0x145bb6590:events.append(['diagnostic'])
 else:return False
 c._return();return True
cpu.extensions.append(hook)
def run(value,files=None,opened=None):
 cpu.heap=cpu.H+0x10000;cpu.u.mem_write(cpu.H,bytes(0x10000));cpu.u.mem_write(cpu.S,bytes(0x200000));events.clear();context.update(input=value,files=files or {},opened=opened)
 cpu.call(0x14589d550,cpu.H);output=cpu.serialize(cpu.H)
 return dict(input=value,files=files or {},opened=opened,result=output,events=events.copy())
rows=[]
stat=lambda n:f'stat|kills={n},gold=0,guardians=0,bosses=0,runs=0,wins=0,caches=0\n'
for value in (None,'','  \u2003\n','rse1:bad','RSE1','RSE1\0:bad'):
 result=run(value);expected=[] if value is None or not value.strip(RUST_WHITESPACE) else [['read','characters.legacy'],['write','characters.legacy',value]]
 assert result['result']=='' and result['events']==expected,(value,result)
 rows.append(dict(contract='empty-or-legacy',input=value,result=result['result'],events=result['events']))
for existing in (None,'','same','different'):
 files={} if existing is None else {'characters.legacy':existing}
 result=run('stat|kills=2\n',files)
 expected=[['read','characters.legacy']]+([['write','characters.legacy','stat|kills=2\n']]if existing is None else [])
 assert result['result']==stat(2) and result['events']==expected
 rows.append(dict(contract='legacy-copy',prior=existing,result=result['result'],events=result['events']))
for mode in ('missing','identical'):
 for slot in range(1,33):
  files={f'characters.unreadable.{i}':'different'for i in range(1,slot)}
  if mode=='identical':files[f'characters.unreadable.{slot}']='RSE1:bad'
  result=run('RSE1:bad',files)
  expected=[['read',f'characters.unreadable.{i}']for i in range(1,slot+1)]+[['write',f'characters.unreadable.{slot}','RSE1:bad'],['diagnostic']]
  assert result['result']=='' and result['events']==expected,(mode,slot,result)
  rows.append(dict(contract='corrupt-copy',mode=mode,slot=slot,result='',events=result['events']))
result=run('RSE1:bad',{f'characters.unreadable.{i}':'different'for i in range(1,33)})
assert result['result']=='' and result['events'][-2:]==[['write','characters.unreadable.32','RSE1:bad'],['diagnostic']]
rows.append(dict(contract='full-corrupt-slots',result='',events=result['events']))
# Compatible valid sealed bytes for a native-open success branch. The opener's
# actual cryptographic instructions are independently covered by check-save-envelope.
key=ast.literal_eval(re.search(r'const FORMAT_KEY:.*?=\s*(b"[^"]+")',(ROOT/'crates/azeroth-survivors-re/src/save.rs').read_text(),re.S)[1]);nonce=bytes(range(16));plain=b'stat|kills=7\n';cipher=bytes(a^b for a,b in zip(plain,hmac.digest(key,b'ks'+nonce+bytes(8),'sha1')));sealed='RSE1:'+base64.b64encode(nonce+cipher+hmac.digest(key,b'tag'+nonce+cipher,'sha1')).decode()
for pad in ('',*RUST_WHITESPACE):
 result=run(pad+sealed+pad,opened=plain.decode())
 assert result['result']==stat(7) and result['events']==[],(repr(pad),result)
 rows.append(dict(contract='sealed-prefix',padding=pad,input=pad+sealed+pad,result=result['result'],events=[]))
record=dict(target_version='0.109.0',target_sha256=SHA,case_count=len(rows),cases=rows,target_executed=False,compilation=False,seams=manifest['limits'])
if args.write:(DEST/'native-vectors.json').write_text(json.dumps(record,separators=(',',':'))+'\n')
else:assert json.loads((DEST/'native-vectors.json').read_text())==record
print(f'PASS {len(rows)} native loader/migration/corrupt-copy/prefix cases; no compilation or native file I/O')

#!/usr/bin/env python3
"""Replay native Discord frame/throttle/nonce contracts with explicit I/O seams."""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
t=latest_target(verify=True);assert t['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
d=target_bytes(t);m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(d)
def raw(a,n):off=p.rva_offset(a-p.image_base);return d[off:off+n]
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for s in p.sections:u.mem_write(p.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
H,S,STOP=0x200000000,0x300000000,0x400000000
u.mem_map(H,0x400000);u.mem_map(S,0x10000);u.mem_map(STOP,4096)
def get(n):return u.reg_read(getattr(r,'UC_X86_REG_'+n))
def setr(n,v):u.reg_write(getattr(r,'UC_X86_REG_'+n),v)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def ret():sp=get('RSP');setr('RIP',q(sp));setr('RSP',sp+8)
def reset():
 u.mem_write(H,bytes(0x400000));sp=S+0x8008;put(sp,'Q',STOP);setr('RSP',sp);return sp
results=[]
# Full read owner executes: only read_exact/allocation/free are fixtures.
for opcode in (0,1,2,3,4,0xffffffff):
 for length in (0,1,8,1048576,1048577):
  for failure in (None,'header','body'):
   reset();calls=[];position=0
   header=struct.pack('<II',opcode,length);body=b'x'*min(length,1048576)
   def read(_,a,n,__):
    global position
    if a==STOP:u.emu_stop();return
    if 0x14006af20<=a<0x14006b038:return
    if a==0x1400b2670:
     phase='header'if position==0 else'body';count=get('R8');calls.append((phase,count))
     if failure==phase:setr('RAX',0x2300000003)
     else:u.mem_write(get('RDX'),header if phase=='header'else body[:count]);setr('RAX',0)
     position+=1
    elif a==0x140002200:pass
    elif a==0x1400021f0:assert get('RCX')==length;setr('RAX',H+0x2000)
    elif a==0x1400021d0:pass
    else:raise AssertionError(hex(a))
    ret()
   hook=u.hook_add(UC_HOOK_CODE,read);setr('RCX',H+0x100);setr('RDX',H+0x200)
   u.emu_start(0x14006af20,STOP,count=200);u.hook_del(hook);assert get('RIP')==STOP
   error=q(H+0x108)==0xffffffffffffffff
   assert error==(failure=='header'or length>1048576 or failure=='body'or opcode==2)
   assert len(calls)==(1 if failure=='header'or length>1048576 else 2)
   if not error:assert q(H+0x108)==length and struct.unpack('<I',u.mem_read(H+0x100,4))[0]==opcode
   results.append(dict(kind='read',opcode=opcode,length=length,failure=failure,error=error,calls=calls))
# Full write owner executes its header/layout/copy/write branch. JSON rendering
# is deliberately a seam; these cases do not certify serde serialization.
for opcode in (0,1,2,0xffffffff):
 for body in (b'',b'{}',b'{"v":1,"client_id":"1559232589020012564"}',b'{"cmd":"SET_ACTIVITY","nonce":"1"}'):
  for fail in (False,True):
   reset();frames=[];cursor=H+0x10000
   def write(_,a,n,__):
    global cursor
    if a==STOP:u.emu_stop();return
    if 0x14006b080<=a<0x14006b1e5:return
    if a==0x142aeb950:
     out=q(get('RDX'));u.mem_write(H+0x2000,body or b'\0');put(out,'QQQ',len(body),H+0x2000,len(body));setr('RAX',0)
    elif a==0x140002200:pass
    elif a==0x1400021c0:setr('RAX',cursor);cursor+=get('RCX')+32
    elif a==0x145bfa0e7:u.mem_write(get('RCX'),bytes(u.mem_read(get('RDX'),get('R8'))));setr('RAX',get('RCX'))
    elif a==0x1400b2680:frames.append(bytes(u.mem_read(get('RDX'),get('R8'))));setr('RAX',0x2300000003 if fail else 0)
    elif a==0x1400021d0:pass
    else:raise AssertionError(hex(a))
    ret()
   hook=u.hook_add(UC_HOOK_CODE,write);setr('RCX',H+0x100);setr('RDX',opcode);setr('R8',H+0x300)
   u.emu_start(0x14006b080,STOP,count=300);u.hook_del(hook);assert get('RIP')==STOP
   assert frames==[struct.pack('<II',opcode,len(body))+body]and get('RAX')==(0x2300000003 if fail else 0)
   results.append(dict(kind='write',opcode=opcode,body=body.decode(),failure=fail,frame_sha256=hashlib.sha256(frames[0]).hexdigest()))
# Original branch uses whole elapsed seconds, not float rounding.
for previous in (False,True):
 for elapsed in (0,1,3,4,5,100):
  reset();bp=H+0x1000;put(bp+0x130,'I',0 if previous else 0xffffffff);setr('RBP',bp);setr('R12',H+0x2000);hit=[]
  def throttle(_,a,n,__):
   if a in(0x140068069,0x1400693dd):hit.append(a);u.emu_stop();return
   if 0x14006938d<=a<0x1400693dd:return
   if a==0x145ba43d0:setr('RAX',elapsed)
   elif a==0x145ba4280:setr('RAX',123);setr('RDX',456)
   else:raise AssertionError(hex(a))
   ret()
  hook=u.hook_add(UC_HOOK_CODE,throttle);u.emu_start(0x14006938d,0,count=100);u.hook_del(hook)
  admitted=hit==[0x1400693dd];assert admitted==(not previous or elapsed>=4)
  results.append(dict(kind='throttle',previous=previous,elapsed=elapsed,admitted=admitted))
for previous in(0,1,18446744073709551614,18446744073709551615):
 reset();bp=H+0x1000;put(bp+0x30,'Q',previous);setr('RBP',bp);setr('RAX',H+0x3000)
 u.emu_start(0x140069726,0x140069765,count=30)
 assert q(bp+0x30)==(previous+1)&0xffffffffffffffff
 results.append(dict(kind='nonce',previous=previous,next=q(bp+0x30)))
assert raw(0x145dcf503,19)==b'1559232589020012564'
source=(ROOT/'crates/azeroth-survivors-re/src/discord/transport.rs').read_text()
for fragment in ['for index in 0..10','from_secs(1)','from_secs(4)','from_secs(20)','1_048_576','nonce.wrapping_add(1)','receiver.try_iter()','opcode == 2','"SET_ACTIVITY"','"1559232589020012564"'] :assert fragment in source,fragment
ranges=[]
for a,b in [(0x140067fc0,0x14006a050),(0x14006af20,0x14006b038),(0x14006b080,0x14006b1e5),(0x1400a91d0,0x1400a933f),(0x14004e850,0x14004e96c),(0x140090800,0x14009080f),(0x1401a5860,0x1401a58d9),(0x140046860,0x140046c91)]:ranges.append(dict(start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest()))
manifest_path=ROOT/'docs/analysis/evidence/0.109.0/discord-transport/manifest.json'
if manifest_path.exists():
 manifest=json.loads(manifest_path.read_text());assert manifest['target_sha256']==t['sha256']
 for row in manifest['owners']:
  current=next(v for v in ranges if v['start']==row['start'])
  assert all(row[k]==v for k,v in current.items())
  for kind in ('assembly','pseudocode'):
   assert hashlib.sha256((manifest_path.parent/row[kind]).read_bytes()).hexdigest()==row[kind+'_sha256']
record=dict(target_sha256=t['sha256'],case_count=len(results),cases=results,ranges=ranges,limits=['Full native frame helpers execute against explicit JSON serializer/read_exact/write_all/allocation/free seams; no OS, pipe, server or application runs.','Throttle and nonce are isolated no-OS worker fragments. Worker endpoint, retry, JSON command, deduplication, channel and reply paths are statically traced, not certified by these fragment cases.','Windows is the only supplied platform artifact. Unix endpoint discovery remains unsupported instead of inventing native behavior.'])
path=ROOT/('runtime/native-evidence/0.109.0/discord-transport'if args.stage else'docs/analysis/evidence/0.109.0/discord-transport')/'native.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==json.loads(json.dumps(record))
print(f'Passed {len(results)} native Discord frame/throttle/nonce cases; no IPC or game')

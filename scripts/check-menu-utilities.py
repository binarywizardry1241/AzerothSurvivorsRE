#!/usr/bin/env python3
"""Replay current language-choice admission and community pixels without a game.

The UI input fragment uses explicit locale/current-code, persistence, rebuild
and memcmp seams. The pixel producer only uses fixture allocation/memcpy.
"""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path[:0]=[str(ROOT/'runtime/armory-recovery/python-libs'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
t=latest_target(verify=True);assert t['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
d=target_bytes(t);m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(d)
ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()}
def raw(a,n):return d[p.rva_offset(a-p.image_base):p.rva_offset(a-p.image_base)+n]
def text(a,n):return raw(a,n).decode()
def span(a,b):return dict(va=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
languages=[]
for i in range(14):
 ptr,n,name,nn=struct.unpack('<4Q',raw(0x146ecf758+i*56,32));languages.append((text(ptr,n),text(name,nn)))
source=(ROOT/'crates/azeroth-survivors-re/src/localization.rs').read_text()
for code,name in languages:assert f'("{code}", "{name}")' in source
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for s in p.sections:u.mem_write(p.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
H,S,STOP=0x200000000,0x300000000,0x400000000
u.mem_map(H,0x200000);u.mem_map(S,0x200000);u.mem_map(STOP,4096)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
def st(a,n):return bytes(u.mem_read(a,n)).decode()
def ret():
 sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,q(sp));u.reg_write(r.UC_X86_REG_RSP,sp+8)
results=[]
for current,_ in languages:
 for selected,_ in languages:
  for interaction in range(3):
   u.mem_write(H,bytes(0x10000));sp=S+0x100008;u.mem_write(sp,bytes(256));u.mem_write(H+0x100,current.encode());u.mem_write(H+0x200,selected.encode())
   wq(H+0x300,H+0x100);wq(H+0x308,len(current));wq(H+0x400,H+0x200);wq(H+0x408,len(selected));u.mem_write(H+0x500,bytes([interaction]));u.mem_write(H+0x600,b'\1')
   wq(sp+0xa0,H+0x600);wq(sp+0x98,H+0x700);u.mem_write(sp+0x64,struct.pack('<I',17))
   wq(sp+0x70,H+0x800);wq(sp+0x78,H+0x900);wq(sp+0x90,H+0xa00);wq(H+0xa00,64);wq(H+0xa08,H+0xb00)
   wq(sp+0x80,H+0xc00);wq(sp+0x88,H+0xd00);u.mem_write(sp+0x60,struct.pack('<I',18));u.mem_write(sp+0x5c,struct.pack('<I',19))
   calls=[]
   def click(_,a,n,unused):
    if a==0x14002fcd0:u.emu_stop();return
    if 0x14002ffea<=a<0x1400300d0:return
    c,d8,r8=[u.reg_read(x)for x in (r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8)]
    if a==0x1458edfc0:u.reg_write(r.UC_X86_REG_RAX,H+0x300)
    elif a==0x145bfa0e1:
     left,right=bytes(u.mem_read(c,r8)),bytes(u.mem_read(d8,r8));u.reg_write(r.UC_X86_REG_RAX,((left>right)-(left<right))&0xffffffffffffffff)
    elif a==0x1458edf70:calls.append(('persist',st(c,d8)))
    elif a in (0x14001f830,0x145890950):calls.append(('refresh',hex(a)))
    else:raise AssertionError('Unreviewed UI callee '+hex(a))
    ret()
   hook=u.hook_add(UC_HOOK_CODE,click);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,H+0x400);u.reg_write(r.UC_X86_REG_RDX,H+0x500)
   u.emu_start(0x14002ffea,0,count=300);u.hook_del(hook);assert u.reg_read(r.UC_X86_REG_RIP)==0x14002fcd0
   pressed=interaction==0;changed=pressed and current!=selected
   assert bool(u.mem_read(H+0x600,1)[0])==(not pressed)
   assert [v for kind,v in calls if kind=='persist']==([selected]if changed else [])
   assert sum(kind=='refresh'for kind,v in calls)==(2 if changed else 0)
   assert q(H+0xa10)==(8 if changed else 0)
   results.append(dict(current=current,selected=selected,interaction=interaction,closed=pressed,persisted=changed))
# The current pixel producer receives an iterator with an exact alpha slice.
mask=json.loads((ROOT/'crates/azeroth-survivors-re/assets/community-icon.json').read_text());alpha=b''.join(bytes.fromhex(row)for row in mask['alpha_rows'])
assert len(alpha)==1200 and mask['width']==40 and mask['height']==30 and raw(0x145dcee6f,1200)==alpha
u.mem_write(H,bytes(0x20000));u.mem_write(H+0x4000,alpha);wq(H+0x40,H+0x4000);wq(H+0x48,H+0x4000+1200);sp=S+0x100008;wq(sp,STOP)
def pixels(_,a,n,unused):
 if a==STOP:u.emu_stop();return
 if 0x1400a9b90<=a<ends[0x1400a9b90]:return
 if a==0x140002200:pass
 elif a==0x1400021c0:
  assert u.reg_read(r.UC_X86_REG_RCX)==4800;u.reg_write(r.UC_X86_REG_RAX,H+0x8000)
 elif a==0x145bfa0e7:
  c,d8,n=[u.reg_read(x)for x in (r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8)];u.mem_write(c,bytes(u.mem_read(d8,n)));u.reg_write(r.UC_X86_REG_RAX,c)
 else:raise AssertionError('Unreviewed pixel callee '+hex(a))
 ret()
hook=u.hook_add(UC_HOOK_CODE,pixels);u.reg_write(r.UC_X86_REG_RCX,H+0x100);u.reg_write(r.UC_X86_REG_RDX,H);u.reg_write(r.UC_X86_REG_RSP,sp)
u.emu_start(0x1400a9b90,0,count=100000);u.hook_del(hook);assert u.reg_read(r.UC_X86_REG_RIP)==STOP
rgba=bytes(u.mem_read(q(H+0x108),q(H+0x110)));assert rgba==b''.join(bytes([255,255,255,a])for a in alpha)
for address,value in [(0x145dced14,b'https://discord.gg/UzxaZuSAk'),(0x145dced30,b'https://wow.aethus.pl/support')]:assert raw(address,len(value))==value
choice=source.split('let mut selected = false;',1)[1].split('// The list is a popover',1)[0]
assert 'if choice.0 != locale.index' in choice and 'locale.select(choice.0, &mut catalog);' in choice and 'selected = true;'in choice
assert choice.index('if selected {')>choice.index('for (choice, interaction)')
assert 'return;' not in choice.split('for (choice, interaction)',1)[1].split('if selected {',1)[0]
record=dict(target_sha256=t['sha256'],target_executed=False,languages=languages,input_cases=len(results),input_result_sha256=hashlib.sha256(json.dumps(results,sort_keys=True).encode()).hexdigest(),pixel_count=len(alpha),alpha_sha256=hashlib.sha256(alpha).hexdigest(),rgba_sha256=hashlib.sha256(rgba).hexdigest(),ranges=[span(0x14002ffea,0x1400300cc),span(0x1400a9b90,ends[0x1400a9b90]),span(0x140270430,ends[0x140270430]),span(0x1400201b0,ends[0x1400201b0]),span(0x140243110,ends[0x140243110])],limits=['Only the current admitted per-row input fragment and complete RGBA producer execute. Bevy query/ticks and UI scheduling are fixtures; locale mutation/persistence, refresh, memcmp, allocation and memcpy are explicit seams.','Current popup/choice/top-right constructors are statically traced separately. This check does not render, open URLs, touch a save/configuration or run a game.'])
path=ROOT/('runtime/native-evidence/0.109.0/menu-utilities'if args.stage else'docs/analysis/evidence/0.109.0/menu-utilities')/'native.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==json.loads(json.dumps(record))
print('Passed588 native language-choice admission cases, all1200 community pixels and current source guards')

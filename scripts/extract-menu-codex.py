"""Bounded native constructor execution: no OS calls, all external calls explicitly stubbed."""
import sys,struct,json,importlib.util,hashlib
from pathlib import Path
R=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(R/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
s=importlib.util.spec_from_file_location('inv',R/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m)
d=(R/'AzerothSurvivors/AzerothSurvivors.exe').read_bytes();p=m.PE(d)
SHA='47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'
assert hashlib.sha256(d).hexdigest()==SHA
base=p.image_base;end=max(s['rva']+max(s.get('virtual_size',0),s['raw_size']) for s in p.sections)
u=Uc(UC_ARCH_X86,UC_MODE_64);u.mem_map(base,(end+4095)&~4095)
for sec in p.sections:u.mem_write(base+sec['rva'],d[sec['raw_offset']:sec['raw_offset']+sec['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096)
next_heap=HEAP+0x1000
menu=json.loads((R/'crates/azeroth-survivors-re/assets/menu.json').read_text());abilities={a['key']:a for a in menu['abilities']}
current=None
allowed=[(0x140322980,0x140322ad7),(0x145406780,0x145407c37),(0x1454f6a50,0x1454f97b0),(0x14540a680,0x14540b3fa),(0x14540b540,0x14540b6f0),(0x14540b730,0x14540ba48),(0x145409e00,0x14540a270),(0x145405940,0x145405ab0),(0x145405ab0,0x145405c8c)]
calls={}
def reg(r):return u.reg_read(r)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
def st(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return st(q(a),q(a+8))
def alloc(n):
 global next_heap
 a=next_heap;next_heap+=(n+15)&~15;u.mem_write(a,bytes(n));return a
def outstr(dest,s):
 b=s.encode();a=alloc(len(b)+1);u.mem_write(a,b);u.mem_write(dest,struct.pack('<QQQ',len(b),a,len(b)))
def hook(uc,a,size,_):
 if any(lo<=a<hi for lo,hi in allowed):return
 calls[a]=calls.get(a,0)+1
 rcx,rdx,r8=reg(UC_X86_REG_RCX),reg(UC_X86_REG_RDX),reg(UC_X86_REG_R8)
 if a==0x14573e2f0:
  # Vec<64-byte Effect> reserve; keep an oversized zeroed arena and a stable pointer.
  if q(rcx)==0:wq(rcx,256);wq(rcx+8,alloc(256*64))
  else:wq(rcx,256)
 elif a==0x14541f030:
  u.reg_write(UC_X86_REG_RAX,rcx);u.reg_write(UC_X86_REG_RDX,rdx) # reviewed native English fallback
 elif a==0x14541f0e0:u.reg_write(UC_X86_REG_RAX,0) # No active locale overrides; native English fallback.
 elif a==0x1400021d0:pass
 elif a==0x140002200:pass
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x1457149f7:
  av,bv=bytes(u.mem_read(rcx,r8)),bytes(u.mem_read(rdx,r8));u.reg_write(UC_X86_REG_RAX,0 if av==bv else 1)
 elif a==0x1457149fd:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x14540a270:outstr(rcx,pair(rdx+8)[:1].upper()+pair(rdx+8)[1:])
 elif a==0x1456c9ba0:
  ptr=rdx;argi=0;s=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:s+=st(ptr,op);ptr+=op;continue
   precision=None
   if op in [0xc1,0xc5]:
    flags=bytes(u.mem_read(ptr,4));ptr+=4;precision=0
    if op==0xc5:precision=u.mem_read(ptr,1)[0];ptr+=1
   elif op!=0xc0:raise RuntimeError('unknown format opcode '+hex(op)+' at '+hex(ptr-1))
   valueptr,formatter=q(r8+argi*16),q(r8+argi*16+8);argi+=1
   if formatter==0x1456daf00:
    v=struct.unpack('<f',u.mem_read(valueptr,4))[0];value=format(v,'.'+str(precision)+'f') if precision is not None else next(format(v,'.'+str(n)+'g') for n in range(1,10) if struct.pack('<f',float(format(v,'.'+str(n)+'g')))==struct.pack('<f',v))
   elif formatter in [0x1456dbc60,0x1456dbce0]:value=str(struct.unpack('<I',u.mem_read(valueptr,4))[0])
   elif formatter in [0x1400020c0,0x146ab2558]:value=pair(valueptr)
   else:raise RuntimeError('unknown argument formatter '+hex(formatter)+' at '+hex(rdx))
   s+=value
  outstr(rcx,s)
 elif a==0x145404cb0:
  text=st(rdx,r8);needle=st(reg(UC_X86_REG_R9),3);replacement=st(q(reg(UC_X86_REG_RSP)+40),q(reg(UC_X86_REG_RSP)+48));outstr(rcx,text.replace(needle,replacement))
 elif a==0x14541f400:
  text=st(rdx,r8);args=reg(UC_X86_REG_R9);n=q(reg(UC_X86_REG_RSP)+40)
  for j in range(n):
   at=args+j*32;key=pair(at);valueptr,formatter=q(at+16),q(at+24)
   method=q(formatter+24)
   if method==0x1400020e0:value=pair(valueptr+8)
   elif method==0x1400020c0:value=pair(valueptr)
   elif method==0x1456dbc60:value=str(struct.unpack('<I',u.mem_read(valueptr,4))[0])
   elif method==0x1456daf00:value=format(struct.unpack('<f',u.mem_read(valueptr,4))[0],'.7g')
   else:raise RuntimeError('unknown replacement formatter '+hex(formatter)+' method '+hex(method))
   text=text.replace('{'+key+'}',value)
  outstr(rcx,text)
 else:raise RuntimeError('unsupported native call '+hex(a))
 rsp=reg(UC_X86_REG_RSP);ret=q(rsp);u.reg_write(UC_X86_REG_RSP,rsp+8);u.reg_write(UC_X86_REG_RIP,ret)
u.hook_add(UC_HOOK_CODE,hook)
def invoke(at,rcx=0,rdx=0,r8=0):
 sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp)
 for register,value in [(UC_X86_REG_RCX,rcx),(UC_X86_REG_RDX,rdx),(UC_X86_REG_R8,r8)]:u.reg_write(register,value)
 u.emu_start(at,STOP,count=100000);assert reg(UC_X86_REG_RIP)==STOP

def describe(ptr,count):
 output=alloc(24);array=alloc(32*24);wq(output,array);wq(output+8,0);wq(output+16,array)
 invoke(0x1454f6a50,ptr,ptr+count*64,output)
 return [pair(array+i*24+8)for i in range(q(output+8))]
rows=[]
for cid,c in zip([1,2,3,4,5,7,8,9,11],menu['classes']):
 for key in c['spell_keys']:
  current=key;next_heap=HEAP+0x1000;out=HEAP;u.mem_write(out,bytes(112));sp=STACK+0x1f0008;wq(sp,STOP)
  at=next(i for i,a in enumerate(menu['abilities'])if a['key']==key)
  u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,out);u.reg_write(UC_X86_REG_RDX,0x1466d5b20+at*120)
  try:u.emu_start(0x145406780,STOP,count=100000)
  except Exception as e:raise RuntimeError(f'{key} pc{reg(UC_X86_REG_RIP):x}: {e}') from e
  assert reg(UC_X86_REG_RIP)==STOP
  # Returned native Amulet owns key/name Strings, effect Vec, and icon &str.
  count=q(out+64);effects=bytes(u.mem_read(q(out+56),count*64))
  strings=alloc(24);array=alloc(32*24);wq(strings,array);wq(strings+8,0);wq(strings+16,array)
  sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,q(out+56));u.reg_write(UC_X86_REG_RDX,q(out+56)+count*64);u.reg_write(UC_X86_REG_R8,strings)
  try:u.emu_start(0x1454f6a50,STOP,count=100000)
  except Exception as e:raise RuntimeError(f'{key} text pc{reg(UC_X86_REG_RIP):x}: {e}') from e
  descriptions=[pair(array+i*24+8) for i in range(q(strings+8))]
  row=dict(descriptions=descriptions,class_id=cid,spell=key,key=pair(out+8),name=pair(out+32),icon=pair(out+72),effects=[effects[i:i+64].hex()for i in range(0,len(effects),64)])
  rows.append(row)

shared=[]
for i in range(22):
 at=0x1466dd368+i*72;current=pair(at);none=alloc(16);by_quality=[]
 for quality in range(5):
  invoke(0x145405940,at,quality,none);value=struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
  output=alloc(24);u.reg_write(UC_X86_REG_XMM2,int.from_bytes(struct.pack('<f',value)+bytes(12),'little'));invoke(0x145405ab0,output,at)
  by_quality.append(pair(output+8))
 invoke(0x140322980,at);tag_label=st(reg(UC_X86_REG_RAX),reg(UC_X86_REG_RDX))
 tag=u.mem_read(at+68,1)[0]
 if tag<=15 and ((0x9b>>tag)&1):growth="Picked again, it grows by nearly the pick's whole worth every time."
 elif tag==15:
  growth="Picked again, it refills its lives; it holds {n} at most.".replace('{n}',str(struct.unpack('<I',u.mem_read(q(0x1458f5aa0+16),4))[0]))
 else:
  if tag<=18 and ((0x19b>>tag)&1): cap=struct.unpack('<f',u.mem_read(0x1458f2d18+(4 if tag==8 else 0),4))[0]
  else:
   factor=0x1458a85b0 if tag<=18 and ((0x24064>>tag)&1) else 0x1458b9aa0
   cap=struct.unpack('<f',u.mem_read(at+64,4))[0]*struct.unpack('<f',u.mem_read(factor,4))[0]
  output=alloc(24);u.reg_write(UC_X86_REG_XMM2,int.from_bytes(struct.pack('<f',cap)+bytes(12),'little'));invoke(0x145405ab0,output,at);ceiling=pair(output+8)
  growth=("Picked again, it grows toward {ceiling}, each pick less as it nears it." if tag==8 else "Picked again, it grows by nearly the pick's whole worth, up to {ceiling}.").replace('{ceiling}',ceiling)
 shared.append(dict(key=current,name=pair(at+16),icon=pair(at+32),group='rings'if i<9 else'trinkets',tag=tag,tag_label=tag_label,descriptions=by_quality,quality=0,growth=growth))
for i in range(17):
 at=0x1466de600+i*80;current=pair(at);descriptions=describe(q(at+48),q(at+56))
 shared.append(dict(key=current,name=pair(at+16),icon=pair(at+32),group='amulets',effects=[bytes(u.mem_read(q(at+48)+j*64,64)).hex()for j in range(q(at+56))],descriptions=descriptions,quality=q(at+64)))
(R/'runtime/tool-state/python/armory/shared-native-results.json').write_text(json.dumps(shared,indent=2)+'\n')
(R/'runtime/tool-state/python/armory/legendary-native-text-results.json').write_text(json.dumps(dict(method='Unicorn x86_64 executes exact native145406780; only Vec reserve, English locale miss, Rust-string formatting, and deallocation are stubbed; no OS/files/network calls',calls={hex(a):n for a,n in calls.items()},entries=rows),indent=2)+'\n')

for item in rows:
 item['group']='legendary'
 item['quality']=4
 item['name']=item['name'].split(':',1)[0]
 item['spell_icon']=abilities[item['spell']]['icon']
assert len(rows)==101 and len(shared)==39
catalog=dict(version='0.92.0',entries=rows+shared)
assert len({item['key']for item in catalog['entries']})==140
(R/'crates/azeroth-survivors-re/assets/codex.json').write_text(json.dumps(catalog,indent=2)+'\n')
evidence=R/'docs/analysis/evidence/codex';evidence.mkdir(parents=True,exist_ok=True)
ranges=[(0x145406780,0x145407c37),(0x1454f6a50,0x1454f97b0),(0x145405940,0x145405ab0),(0x145405ab0,0x145405c8c)]
manifest=dict(target_sha256=SHA,version='0.92.0',method='Bounded Unicorn2.1.4x86-64 execution of nativeconstructor/effectformatter, with reviewed heap/String/locale/floatformat/replace primitives; no OS/files/network are reachable inside emulatedexecution.',functions=[dict(start=hex(a),end=hex(b),sha256=hashlib.sha256(d[p.rva_offset(a-base):p.rva_offset(b-base)]).hexdigest())for a,b in ranges],jewelry_table=dict(address='0x1466dd368',stride=72,count=22),amulet_table=dict(address='0x1466de600',stride=80,count=17),legendary_count=101,shared_count=39,total=140,seen_format='seen|key=highest_quality,...',runtime_checks=['Cleave50%/80%/6sec','Whirlwind60%area/35%damage/1.5sec','Accuria26/36/46/61/82%damage','CommonMarkofFordring15%damage','4/140count,unknownentriesremainundiscovered'],limitations=['Englishnativefallbacktextisimplemented;otherlocaleeffectdescriptionsrequireexplicitnativeformatbinding.','Complete140-entryrebuiltUIparitycomparisonpending.'])
(evidence/'catalog-provenance.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('Recovered native Codex:101legendary +39shared =140entries')

#!/usr/bin/env python3
"""Replay current Discord activity instructions with explicit JSON/host seams.

No compiler, target process, network connection or Discord client is started.
"""
from portable_paths import portable_json, portable_record
from script_sources import load_script
import argparse, hashlib, struct, json, sys, math
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import *
from unicorn import x86_const as r
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
x=latest_target(verify=False);assert x['version']=='0.109.0' and x['sha256']==SHA;data=target_bytes(x);pm = load_script('pe', 'scripts/inventory-executable.py');pe=pm.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
heap,stack,done=0x200000000,0x300000000,0x400000000
u.mem_map(heap,0x800000);u.mem_map(stack,0x200000);u.mem_map(done,4096);cursor=heap+0x10000;maps={};lookups=[];formats=[]
locale=json.loads(Path('crates/azeroth-survivors-re/assets/locales/en.json').read_text())
def get(n):return u.reg_read(getattr(r,'UC_X86_REG_'+n))
def reg(n,v):u.reg_write(getattr(r,'UC_X86_REG_'+n),v)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def put(a,*v):u.mem_write(a,struct.pack('<'+'Q'*len(v),*(x&0xffffffffffffffff for x in v)))
def alloc(n):
 global cursor
 a=cursor;cursor+=(n+31)&~15;assert cursor<heap+0x800000;return a
def text(a,n):
 assert n<100000,(hex(a),n)
 return bytes(u.mem_read(a,n)).decode()
def string(s):
 raw=s.encode();a=alloc(len(raw)+1);u.mem_write(a,raw+b'\0');return a,len(raw)
def owned(a,s):
 p,n=string(s);put(a,n,p,n)
def mapid(a):
 key=q(a)
 if not key:key=alloc(32);put(a,key,0,0);maps[key]={}
 return key
def value(a,v):
 u.mem_write(a,bytes(32))
 if isinstance(v,str):
  p,n=string(v);u.mem_write(a,b'\3');put(a+8,n,p,n)
 elif isinstance(v,bool):u.mem_write(a,bytes([1,int(v)]))
 elif isinstance(v,(int,float)):
  u.mem_write(a,b'\2');put(a+8,0 if isinstance(v,int)and v>=0 else 1 if isinstance(v,int)else 2);u.mem_write(a+16,struct.pack('<Q',v)if isinstance(v,int)and v>=0 else struct.pack('<q',v)if isinstance(v,int)else struct.pack('<d',v))
 elif isinstance(v,list):
  p=alloc(len(v)*32);u.mem_write(a,b'\4');put(a+8,len(v),p,len(v))
  for i,x in enumerate(v):value(p+i*32,x)
 elif isinstance(v,dict):
  u.mem_write(a,b'\5');key=mapid(a+8)
  for k,x in v.items():z=alloc(32);value(z,x);maps[key][k]=z
  put(a+24,len(v))
 elif v is not None:raise ValueError(v)
def decode(a):
 tag=u.mem_read(a,1)[0]
 if tag==255:return None
 if tag==0:return None
 if tag==1:return bool(u.mem_read(a+1,1)[0])
 if tag==2:return struct.unpack('<d'if q(a+8)==2 else '<q'if q(a+8)==1 else '<Q',u.mem_read(a+16,8))[0]
 if tag==3:return text(q(a+16),q(a+24))
 if tag==4:return[decode(q(a+16)+n*32)for n in range(q(a+24))]
 if tag==5:return{k:decode(v)for k,v in maps[q(a+8)].items()}
 raise ValueError(('tag',hex(a),tag,bytes(u.mem_read(a,32)).hex()))
def formatarg(a,formatter=None):
 if formatter==0x145dcf5a0:return text(q(a),q(a+8))
 if formatter==0x145dcf650:return str(q(a))
 if formatter is not None:return text(q(a+8),q(a+16))
 first,second=q(a),q(a+8)
 if first>=0x140000000:return text(first,second)
 if second>=0x140000000:return text(second,q(a+16))
 return str(first)
def ret():
 sp=get('RSP');reg('RIP',q(sp));reg('RSP',sp+8)
def hook(_,pc,n,__):
 if pc==done:u.emu_stop();return
 cx,dx,r8,r9=[get(n)for n in('RCX','RDX','R8','R9')]
 if pc==0x1400021c0:reg('RAX',alloc(cx))
 elif pc in(0x140002200,0x1400021d0,0x14005e410):pass
 elif pc==0x145bfa0e7:
  if r8:u.mem_write(cx,bytes(u.mem_read(dx,r8)))
  reg('RAX',cx)
 elif pc==0x145bfa159:
  v=struct.unpack('<d',(get('XMM0')&((1<<64)-1)).to_bytes(8,'little'))[0];reg('XMM0',int.from_bytes(struct.pack('<d',float(math.trunc(v))),'little'))
 elif pc==0x145bfa0e1:
  a=bytes(u.mem_read(cx,r8));b=bytes(u.mem_read(dx,r8));reg('RAX',(a>b)-(a<b)&0xffffffff)
 elif pc==0x1458ec450:
  key=text(cx,dx);v=locale.get(key,key);p,n=string(v);reg('RAX',p);reg('RDX',n)
 elif pc==0x140062cb0:
  key=text(q(r8+8),q(r8+16));mid=mapid(dx);new=alloc(32);u.mem_write(new,bytes(u.mem_read(r9,32)));maps[mid][key]=new;put(dx+16,len(maps[mid]));u.mem_write(cx,b'\xff')
 elif pc==0x142aeace0:
  key=text(cx,dx);lookups.append((key,decode(r8)));assert u.mem_read(r8,1)[0]==5,(key,decode(r8));reg('RAX',maps[q(r8+8)].get(key,0))
 elif pc==0x145ba7ef0:reg('RAX',current_epoch);reg('RDX',0)
 elif pc==0x145ba7ea0:put(cx,0,current_epoch,0)
 elif pc==0x142aeade0:
  key=text(cx,dx)
  if u.mem_read(r8,1)[0]==0:value(r8,{})
  assert u.mem_read(r8,1)[0]==5,(key,decode(r8));mid=q(r8+8)
  if key not in maps[mid]:a=alloc(32);value(a,None);maps[mid][key]=a;put(r8+24,len(maps[mid]))
  reg('RAX',maps[mid][key])
 elif pc==0x145bfa970:
  cap=max(q(cx)*2,dx+r8,8);new=alloc(cap);old=q(cx+8)
  if dx:u.mem_write(new,bytes(u.mem_read(old,dx)))
  put(cx,cap,new)
 elif pc==0x140060380:
  value(cx,decode(q(dx)))
 elif pc==0x145bcce30:
  out='';at=dx;index=0
  while True:
   op=u.mem_read(at,1)[0];at+=1
   if op==0:break
   if op<128:out+=text(at,op);at+=op;continue
   precision=None
   if op in (193,197):precision=u.mem_read(at+4,1)[0];at+=6
   else:assert op==192,(hex(at-1),op)
   pointer,formatter=q(r8+index*16),q(r8+index*16+8);index+=1
   if formatter in(0x1400020c0,0x1400020e0):out+=formatarg(pointer)
   elif formatter==0x145bdf8a0:out+=str(struct.unpack('<q',u.mem_read(pointer,8))[0])
   elif formatter==0x145bde470:
    out+=format(struct.unpack('<d',u.mem_read(pointer,8))[0],f'.{precision}f')
   else:out+=str(q(pointer))
  owned(cx,out)
 elif pc==0x1458ec8b0:
  template=text(dx,r8);count=q(get('RSP')+40);args={}
  for n in range(count):
   at=r9+n*32;key=text(q(at),q(at+8));args[key]=formatarg(q(at+16),q(at+24))
  formats.append((template,args));v=template
  for k,val in args.items():v=v.replace('{'+k+'}',val)
  owned(cx,v)
 elif 0x14588d770<=pc<0x14588d7b0:return
 elif pc in(0x14588c140,0x14588c300):
  key=text(q(cx+16),q(cx+24));fallback=text(q(cx+32),q(cx+40))if pc==0x14588c140 else text(q(cx),q(cx+8));prefix='class'if pc==0x14588c140 else'race';p,n=string(locale.get(f'{prefix}.{key.lower()}.name',fallback));reg('RAX',p);reg('RDX',n)
 elif pc==0x14588d200:
  reg('RAX',0x146bde390)
 elif pc==0x14588cd50:
  p,n=string(locale.get(f'zone.{current_zone}.name','Elwynn Forest'));reg('RAX',p);reg('RDX',n)
 elif pc==0x145bd3fa0:
  p,n=string(str(cx));reg('RAX',p);reg('RDX',n)
 elif 0x14006b460<=pc<0x14006e9bf or 0x1458edff0<=pc<0x1458ee116:return
 else:raise ValueError(('callee',hex(pc),hex(cx),hex(dx),hex(r8),hex(r9)))
 ret()
u.hook_add(UC_HOOK_CODE,hook)
def run(menu,inrun,live=None,terminal=None,entry=None,selection_name='Hero',class_id=1,race_id=1,zone='elwynn',language='en',epoch=1000,previous_start=None):
 global cursor,maps,lookups,formats,locale,current_epoch,current_zone
 locale=json.loads(Path('crates/azeroth-survivors-re/assets/locales/en.json').read_text())|json.loads(Path(f'crates/azeroth-survivors-re/assets/locales/{language}.json').read_text());current_epoch=epoch;current_zone=zone
 cursor=heap+0x10000;maps={};lookups=[];formats=[];u.mem_write(heap,bytes(0x10000));state,selection,local,out=heap+0x1000,heap+0x2000,heap+0x3000,heap+0x4000
 for a,v in[(state+0x60,live),(state+0xa0,terminal),(state+0xc0,entry)]:
  if v is None:u.mem_write(a,b'\xff')
  else:value(a,v)
 u.mem_write(state+0xe8,bytes([inrun]));owned(selection,selection_name);owned(selection+24,zone);u.mem_write(selection+0x38,bytes([class_id,race_id]));
 if previous_start is not None:put(local,1,previous_start)
 sp=stack+0x180000-8;put(sp,done);put(sp+40,local)
 for name,v in [('RSP',sp),('RCX',out),('RDX',menu),('R8',state),('R9',selection)]:reg(name,v)
 u.emu_start(0x14006b460,done,count=50000);assert get('RIP')==done
 return decode(out),q(local+8) if q(local)==1 else None

OWNERS={
 'activity':(0x14006b460,0x14006e9bf), 'publisher':(0x14007b510,0x14007bea2),
 'value-equality':(0x14007de60,0x14007e3eb), 'game-definition':(0x145928330,0x14592affd),
 'meter-definition':(0x14599cb60,0x14599db10), 'json-f32':(0x1458e6790,0x1458e6878),
 'json-number':(0x1458edff0,0x1458ee116),
}
RETAINED=ROOT/'docs/analysis/evidence/discord-presence'
STAGED=ROOT/'runtime/analysis/staging/native-evidence/discord-presence'

def vectors():
    base={'phase':'playing','endless':False,'level':10,'kills':1000,'time':123,'dealt':24600,'meter':[]}
    entry={'class':'Warrior','race':'Human','hero':'Hero','bg':'Elwynn Forest','subtitle':'Forest'}
    rows=[]
    def case(name,**kw):
        args={'menu':True,'inrun':True,'live':base,'entry':entry}|kw
        actual,start=run(**args);rows.append(dict(name=name,input=args,activity=actual,start=start))
    case('menu',inrun=False);case('no-menus',menu=False,inrun=False)
    case('missing-entry',entry=None,previous_start=800)
    for phase in ('ready','paused','dead','choosing','playing','victory','invalid',''):
        for boss in (None,{}, {'name':'Hogger','hp':55,'hpMax':100}):
            case(f'phase-{phase}-boss-{boss is not None}',live=base|{'phase':phase,'boss':boss,'endless':True})
    for summary in ({},{'type':'victory'},{'type':'other'},{'type':'victory','level':15,'kills':1234567},{'level':'bad','kills':None}):
        case('terminal',terminal=summary,previous_start=877)
    for hp,maximum in [(0,0),(-5,0),(250,100),(2.5,100),(3.5,100),(1,3),(None,None)]:
        case('boss-health',live=base|{'boss':{'name':'','hp':hp,'hpMax':maximum}})
    for meters in [[],[{'name':'Bolt','dmg':10}],[{'name':'Bolt','dmg':10},{'name':'Zap','dmg':10}],[{'name':'Bolt','dmg':20},{'name':'Zap','dmg':10}],[{'name':'','dmg':100},{'name':'Zap','dmg':10}],[{'name':'Bolt'},{'name':'Zap','dmg':-1}]]:
        case('meter-order',live=base|{'meter':meters})
    for dealt,seconds in [(1,0),(999.5,1),(1000,1),(1250500,1),(-10,1),(50,-1),(None,None),(10,4)]:
        case('meter-rate',live=base|{'meter':[{'name':'Bolt','dmg':1}],'dealt':dealt,'time':seconds})
    for previous in (None,873,874,876,877,880,881):
        case('clock-drift',previous_start=previous)
    for phase in ('paused','ready','dead'):
        case('clock-reset',live=base|{'phase':phase},previous_start=877)
    for level,kills in [(0,-1),(-3,999),(1.9,1000.9),(2,1000000000),(None,None),('10','1000')]:
        case('numeric-fallbacks',live=base|{'level':level,'kills':kills})
    for changed in [{'hero':''},{'hero':'名, Étienne'},{'class':'Unknown'},{'class':'Unknown','hero':''},{'subtitle':''},{}]:
        case('entry-fields',entry=entry|changed,live=base|{'meter':[{'name':'Bolt','dmg':20}]})
    catalog=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())
    for ident,row in zip([1,2,3,4,5,7,8,9,11],catalog['classes']):
        case('menu-class',inrun=False,class_id=ident)
        case('run-class',entry=entry|{'class':row['name']})
    for ident in range(1,9):case('menu-race',inrun=False,race_id=ident)
    for row in catalog['zones']:case('menu-zone',inrun=False,zone=row['key'])
    for language in ['pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko']:
        labels=json.loads((ROOT/f'crates/azeroth-survivors-re/assets/locales/{language}.json').read_text())
        case('localized-menu',inrun=False,language=language)
        case('localized-run',language=language,entry=entry|{'class':labels.get('class.warrior.name','Warrior'),'race':labels.get('race.human.name','Human'),'bg':labels.get('zone.elwynn.name','Elwynn Forest')})
    return rows

def numeric_vectors():
    global cursor,maps,lookups,formats
    result=[]
    for n in [0.,-0.,1.,-1.,1.2344,1.2346,123.00049,123.00051,1e15,1e-8]:
        cursor=heap+0x10000;maps={};lookups=[];formats=[];out=heap+0x4000;sp=stack+0x180000-8;put(sp,done)
        reg('RCX',out);reg('RSP',sp);reg('XMM1',int.from_bytes(struct.pack('<d',n),'little'))
        u.emu_start(0x1458edff0,done,count=1000);assert get('RIP')==done
        rendered=text(q(out+8),q(out+16));result.append(dict(input=n,text=rendered))
    return result

def contracts():
    records={}
    for role,(a,b)in OWNERS.items():
        off=pe.rva_offset(a-pe.image_base);records[role]=dict(start=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(data[off:off+b-a]).hexdigest())
    rows=vectors();numbers=numeric_vectors();queries=[]
    for path in [ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/discord-current/rea',ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/145928330/rea-fast',ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/14599cb60/rea',ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/1458e6790/rea']:
        for f in sorted(path.glob('*-procedure_pseudo_code.json')):
            j=json.loads(f.read_text());address=j['params']['arguments']['procedure']
            if int(address,16) not in {a for a,b in OWNERS.values()}:continue
            z=j['response']['result']['structuredContent'];queries.append(dict(procedure=address,evidence_id=z['evidence_id'],analysis_profile_digest=z['analysis_profile']['digest'],subject_sha256=z['subject']['digest']['sha256']))
    if not queries:queries=json.loads((RETAINED/'manifest.json').read_text())['ghidra']
    manifest=dict(target=dict(version='0.109.0',sha256=SHA),owners=records,ghidra=queries,native_activity_cases=len(rows),native_number_cases=len(numbers),
        shared_evidence=['docs/analysis/evidence/0.109.0/discord-transport/manifest.json','docs/analysis/evidence/0.109.0/locale-catalogs.json','docs/analysis/evidence/0.109.0/menu-fidelity/manifest.json','docs/analysis/evidence/0.109.0/options-values/manifest.json'],
        seams=['Original activity and number-format owner instructions execute unchanged in Unicorn.','Heap allocation/free, memcpy/memcmp and String growth use scratch-only host seams.','serde_json lookup/mut-index/BTreeMap insertion/clone use explicit 32-byte Value storage seams.','Translation and argument substitution use retained current catalogs; Rust formatting descriptors decode borrowed/owned strings, integer and precision-controlled float arguments.','Class/race by-ID leaves execute; localized descriptor lookup and zone name resolution use current source catalog seams.','SystemTime returns the fixed case epoch; duration conversion returns it unchanged.','Publisher ECS lookup/channel/thread scheduling, live game JSON construction and shared meter sorting are reviewed statically, not executed in this fixture.','No compilation, Rust tests, application/device launch, IPC server, Discord client or original/rebuilt gameplay comparison.'])
    return manifest,dict(cases=rows,numbers=numbers)

def main():
    p=argparse.ArgumentParser(description=__doc__);g=p.add_mutually_exclusive_group(required=True);g.add_argument('--collect',action='store_true');g.add_argument('--check',action='store_true');args=p.parse_args();manifest,result=contracts()
    if args.collect:
        STAGED.mkdir(parents=True,exist_ok=True)
        (STAGED/'manifest.json').write_text(portable_json(manifest,indent=2,ensure_ascii=False)+'\n')
        (STAGED/'native-vectors.json').write_text(portable_json(result,ensure_ascii=False,separators=(',',':'))+'\n')
        sys.path.insert(0,str(ROOT/'runtime/tool-state/python/camera/python-libs'));from capstone import Cs,CS_ARCH_X86,CS_MODE_64
        decoder=Cs(CS_ARCH_X86,CS_MODE_64)
        for role,(a,b)in OWNERS.items():
            off=pe.rva_offset(a-pe.image_base);raw=data[off:off+b-a]
            body=f';0.109.0 SHA256 {SHA}\n;{a:#x}..{b:#x} SHA256 {hashlib.sha256(raw).hexdigest()}\n'
            body+='\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}'.rstrip()for i in decoder.disasm(raw,a))+'\n';(STAGED/(role+'.asm')).write_text(body)
    else:
        assert portable_record(json.loads((RETAINED/'manifest.json').read_text()))==portable_record(manifest)
        assert portable_record(json.loads((RETAINED/'native-vectors.json').read_text()))==portable_record(result)
    print(f"Verified {manifest['native_activity_cases']} current native activities and {manifest['native_number_cases']} number projections; no build/game/IPC")
if __name__=='__main__':main()

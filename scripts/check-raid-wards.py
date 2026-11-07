#!/usr/bin/env python3
"""Check current native22 ward inputs, construction and actor lifecycle.

Only hash-bound PE decoding and isolated original instructions execute. No
compiler, reference/rebuilt game process or Rust execution is invoked. --stage
stages evidence in ignored runtime for review before canonical promotion.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from coverage_common import ROOT
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
KEPT=ROOT/'docs/analysis/evidence/raid-wards'
STAGE=ROOT/'runtime/analysis/staging/native-evidence/raid-wards'
RANGES={
 'create':(0x145916190,0x145916468),
 'producer':(0x145922b99,0x145922f47),
 'tick-admission':(0x145946259,0x145946311),
 'tick-actions':(0x145949d4a,0x145949fdc),
 'heal':(0x145915be0,0x145915ea0),
 'unit-presentation':(0x14593c570,0x14593d2e2),
 'hatch-creation':(0x14593dd90,0x14593e71b),
 'ward-shield-query':(0x14593f2ed,0x14593f33e),
 'addon-target':(0x1458e5b10,0x1458e5ed8),
}
def dump(value):return json.dumps(value,indent=2,ensure_ascii=False)+'\n'
def f32(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)
def recover(verify_rea=False):
 mod = load_script('ward_graph', ROOT/'scripts/check-raid-target.py')
 target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers);assert target['sha256']==SHA
 if verify_rea:mod.verify_rea_operations(raw,KEPT,SHA)
 historical=json.loads((ROOT/'docs/analysis/evidence/raid-wards-comparison/index.json').read_text())
 oldgraph=json.loads((ROOT/'docs/analysis/evidence/raid-native/catalog.json').read_text())
 by_index={row['index']:row for row in graph['actions']}
 pairs=[(historical[row['record']['va']],by_index[row['index']]) for row in oldgraph['actions'] if row['native_tag']==22]
 rows=[row for index,row in sorted(pairs)]
 index={row['record']['va']:i for i,row in enumerate(rows)}
 assert len(rows)==14 and all(row['native_tag']==22 for row in rows)
 catalog=[]
 for i in range(12):
  a=0x146bf4f18+i*32;pointer,length,entry,display,scale=struct.unpack('<QQIII',raw(a,28))
  catalog.append(dict(index=i,name=raw(pointer,length).decode(),entry=entry,display=display,scale_bits=scale,record=span(a,32),name_source=span(pointer,length)))
 table=0x146c0c2c8;assert table+struct.unpack('<i',raw(table+19*4,4))[0]==0x145922b99
 baselines=[];catalog_source=(ROOT/'crates/azeroth-survivors-re/src/enemies/catalog.rs').read_text()
 sections=re.findall(r'static ([A-Z_]+)_ENEMIES:.*?= &\[(.*?)\n\];',catalog_source,re.S)
 assert len(sections)==12
 for zi,(zone,section)in enumerate(sections):
  definitions=re.findall(r'EnemyDefinition \{(.*?)\n    \}',section,re.S)
  ptr,n=struct.unpack('<QQ',raw(0x146bf2630+zi*240+0x78,16));assert n>=2
  for enemy_index,source in enumerate(definitions[:2]):
   at=ptr+80*enemy_index;v=raw(at,80);w=list(struct.unpack('<20I',v))
   name_ptr,name_len=struct.unpack('<QQ',v[16:32]);name=raw(name_ptr,name_len).decode()
   assert json.loads('"'+re.search(r'name: "([^"\n]+)"',source)[1]+'"')==name,(zone,enemy_index,name,re.search(r'name: "([^"\n]+)"',source)[1])
   assert int(re.search(r'id: (\d+)',source)[1])==w[8]
   assert int(re.search(r'model_id: (\d+)',source)[1])==w[9]
   cast=[int(x,16)for x in re.search(r'raw_cast: \[([^\]]+)\]',source)[1].replace(' ','').split(',')]
   assert cast==w[:4],(zone,enemy_index,'raw_cast')
   for field,offset in [('scale',10),('base_hp',12),('base_damage',13),('raw_38',14),('raw_3c',15),('raw_44',17),('raw_48',18)]:
    assert int(re.search(field+r': f32::from_bits\(0x([0-9a-f]+)\)',source)[1],16)==w[offset],(zone,enemy_index,field)
   for field,expected in [('raw_2c',w[11]),('raw_40',w[16]),('flag_4c',v[76])]:
    assert int(re.search(field+r': (\d+)',source)[1])==expected,(zone,enemy_index,field)
   baselines.append(dict(zone_index=zi,source_zone=zone.lower(),enemy_index=enemy_index,
    entry=w[8],name=name,display=w[9],native_words=w,
    record=span(at,80),name_source=span(name_ptr,name_len)))
 return raw,span,rows,catalog,index,baselines

def native_cases(raw,catalog):
 sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
 from unicorn import x86_const as r
 md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
 game,actors,record,frame,stack,actions=0x71000000,0x71010000,0x71020000,0x71030000,0x71040000,0x71050000
 for a in [game,actors,record,frame,stack,actions]:uc.mem_map(a,0x10000)
 def put(a,fmt,*values):uc.mem_write(a,struct.pack('<'+fmt,*values))
 def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
 def sx(reg,v):uc.reg_write(reg,bits(v))
 def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
 allowed=[];stops=set();calls=[];mode=''
 def ret():
  sp=uc.reg_read(r.UC_X86_REG_RSP);end=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,end)
 def hook(machine,a,size,user):
  if a in stops:uc.emu_stop();return
  if mode=='presentation'and a in [0x1458c19b0,0x1458de1f0,0x145c0a441,0x145c0a447]:
   if a==0x1458c19b0:
    key=uc.reg_read(r.UC_X86_REG_RDX)&0xffff;value=uc.reg_read(r.UC_X86_REG_R8)
    calls.extend([(key,value&0xffffffff),(key+1,value>>32)])
   elif a==0x1458de1f0:calls.append((get(uc.reg_read(r.UC_X86_REG_RDX)+32,'Q')[0],uc.reg_read(r.UC_X86_REG_R8D)))
   elif a==0x145c0a441:sx(r.UC_X86_REG_XMM0,float(math.ceil(xf(r.UC_X86_REG_XMM0))))
   else:sx(r.UC_X86_REG_XMM0,math.atan2(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
   ret();return
  if mode=='actions'and a in [0x145c0a417,0x145c0a411,0x145915be0,0x14593dd90,0x1459c4900]:
   if a in [0x145c0a417,0x145c0a411]:sx(r.UC_X86_REG_XMM0,(math.cos if a==0x145c0a417 else math.sin)(xf(r.UC_X86_REG_XMM0)))
   elif a==0x145915be0:calls.append(('heal',uc.reg_read(r.UC_X86_REG_RDX),xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D)))
   elif a==0x14593dd90:calls.append(('hatch',uc.reg_read(r.UC_X86_REG_RDX),get(uc.reg_read(r.UC_X86_REG_R8)+4,'fff')))
   else:calls.append(('remove',get(uc.reg_read(r.UC_X86_REG_RDX),'Q')[0]));uc.emu_stop();return
   ret();return
  assert any(a0<=a<b for a0,b in allowed),(mode,hex(a))
  i=next(md.disasm(bytes(uc.mem_read(a,size)),a));assert i.mnemonic!='call' or int(i.op_str,16) in stops or mode in ['actions','presentation'],(mode,hex(a),i.op_str)
 uc.hook_add(UC_HOOK_CODE,hook)
 def run(kind,start,ranges,ends):
  nonlocal mode,allowed,stops,calls
  mode=kind;allowed=ranges;stops=set(ends);calls=[]
  uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
  uc.emu_start(start,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP)in stops or (kind=='actions'and uc.reg_read(r.UC_X86_REG_RIP)==0x1459c4900)
 counts={}
 sp=stack+0x8000;stop=stack+0xf000
 cases=0
 for template in list(range(12))+[12,2**64-1]:
  for old_counter in [0,0xffffff,0xffffffff]:
   for hp in [-2.,0.,.25,1.,27.5,math.nan]:
    put(game+0xa78,'I',old_counter);put(sp+0x28,'Q',record+0x100);put(sp+0x30,'ff',hp,12.)
    uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,game);uc.reg_write(r.UC_X86_REG_RDX,77);uc.reg_write(r.UC_X86_REG_R8,template);uc.reg_write(r.UC_X86_REG_R9,record)
    run('create',0x145916190,[RANGES['create']],[0x14593c570]);entry=catalog[min(template,11)]
    counter=(old_counter+1)&0xffffffff;guid=0xf130000000000000|entry['entry']<<24|(counter&0xffffff)
    assert get(game+0xa78,'I')[0]==counter and uc.reg_read(r.UC_X86_REG_RDX)==guid
    assert uc.reg_read(r.UC_X86_REG_R8D)==entry['entry']and uc.reg_read(r.UC_X86_REG_R9D)==entry['display']
    callsp=uc.reg_read(r.UC_X86_REG_RSP);expected=hp if hp>1 else 1.
    assert get(callsp+0x30,'f')[0]==expected and get(callsp+0x28,'I')[0]==entry['scale_bits']and get(callsp+0x38,'B')[0]==0
    cases+=1
 counts['constructor']=cases
 cases=0
 for initial in [0,0xfffffe,0xffffff,0xfffffffe,0xffffffff]:
  put(game+0xa78,'I',initial);uc.reg_write(r.UC_X86_REG_RSI,game)
  run('ordinary-counter',0x14593e0a7,[RANGES['hatch-creation']],[0x14593e0b8])
  ordinary=(initial+1)&0xffffffff;assert get(game+0xa78,'I')[0]==ordinary
  put(sp+0x28,'Q',record+0x100);put(sp+0x30,'ff',2.,12.)
  uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,game);uc.reg_write(r.UC_X86_REG_RDX,77);uc.reg_write(r.UC_X86_REG_R8,0);uc.reg_write(r.UC_X86_REG_R9,record)
  run('create',0x145916190,[RANGES['create']],[0x14593c570]);ward=(ordinary+1)&0xffffffff
  assert get(game+0xa78,'I')[0]==ward
  assert uc.reg_read(r.UC_X86_REG_RDX)==0xf130000000000000|(9600<<24)|(ward&0xffffff)
  uc.reg_write(r.UC_X86_REG_RSI,game)
  run('ordinary-counter',0x14593e0a7,[RANGES['hatch-creation']],[0x14593e0b8])
  assert get(game+0xa78,'I')[0]==(ward+1)&0xffffffff
  cases+=1
 counts['shared_creature_counter']=cases
 cases=0
 for template in catalog:
  for level in [1,63,64]:
   for hp in [1.,27.5]:
    for player_guid in [1,0x123456789abcdef]:
     put(game+0x468,'Q',player_guid);put(game+0x4e0,'I',level);put(game+0x4d0,'fff',3.,8.,9.)
     put(record+0x100,'fff',5.,7.,9.);scale=struct.unpack('<f',struct.pack('<I',template['scale_bits']))[0]
     put(sp+0x28,'f',scale);put(sp+0x30,'f',hp);put(sp+0x38,'B',0)
     put(sp+0x40,'Q',record+0x100)
     uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,game);uc.reg_write(r.UC_X86_REG_RDX,99);uc.reg_write(r.UC_X86_REG_R8D,template['entry']);uc.reg_write(r.UC_X86_REG_R9D,template['display'])
     run('presentation',0x14593c570,[RANGES['unit-presentation']],[0x1458c09b0])
     expected={0:99,1:0,2:9,3:template['entry'],4:template['scale_bits'],16:player_guid&0xffffffff,17:player_guid>>32,22:math.ceil(hp),28:math.ceil(hp),34:min(level,63),35:14,36:0x100,46:0,126:2000,127:2000,129:bits(f32(scale*.5)),130:bits(f32(scale*1.5)),131:template['display'],132:template['display'],134:bits(5.),135:bits(10.),145:bits(1.)}
     assert dict(calls)==expected,(template['index'],calls,expected)
     cases+=1
 counts['unit_presentation']=cases
 # The current selected-target producer classifies a live unheaded ward as
 # normal and reaches the shared actor-name helper, not its creature template.
 put(actors+0x18,'Q',0xffffffffffffffff);put(actors+0x58,'Q',0xffffffffffffffff);put(actors+0x1d4,'B',0)
 uc.reg_write(r.UC_X86_REG_RDI,actors);uc.reg_write(r.UC_X86_REG_RBP,frame)
 run('addon-kind',0x1458e5c9c,[RANGES['addon-target']],[0x1458e5cf5])
 text,n=get(frame+0x40,'QQ');assert raw(text,n)==b'normal'

 counts['addon_ward_kind']=1
 cases=0
 for health,maximum in [(0.,100.),(60.,100.),(100.,100.),(110.,100.)]:
  for fraction in [-1.,0.,.01,.5,2.,math.nan]:
   put(game+0x568,'QQ',actors,1);put(actors+0xf0,'Q',77);put(actors+0xb0,'I',0);put(actors+0x158,'ff',health,maximum);put(sp,'Q',stop)
   uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,game);uc.reg_write(r.UC_X86_REG_RDX,77);uc.reg_write(r.UC_X86_REG_R9D,2054);sx(r.UC_X86_REG_XMM2,fraction)
   run('heal',0x145915be0,[RANGES['heal']],[0x145915cb6,stop])
   requested=f32(fraction*maximum);missing=f32(maximum-health);amount=missing if math.isnan(requested)else min(requested,missing);amount=max(amount,0.)
   assert get(actors+0x158,'f')[0]==f32(health+amount)
   assert (uc.reg_read(r.UC_X86_REG_RIP)==0x145915cb6)==(amount>0)
   cases+=1
 counts['healing']=cases
 cases=0
 for kind in [0,1,2,3,0xffffffff]:
  for dead in [0,1]:
   for parent in [77,88]:
    put(actors+0xb0,'I',dead);put(actors+0xd0,'I',kind);put(actors+0xe0,'Q',parent)
    uc.reg_write(r.UC_X86_REG_R14,actors);uc.reg_write(r.UC_X86_REG_RAX,0x1d8);uc.reg_write(r.UC_X86_REG_RCX,1);uc.reg_write(r.UC_X86_REG_RSI,77)
    run('shield',0x14593f2ed,[RANGES['ward-shield-query']],[0x14593f1f0,0x14593f1f3])
    assert (uc.reg_read(r.UC_X86_REG_RIP)==0x14593f1f0)==(kind==2 and not dead and parent==77);cases+=1
 counts['shield_ownership']=cases
 cases=0
 for expiry in [9.,10.,11.,math.nan]:
  for next_action in [9.,10.,11.,math.nan]:
   put(actors+0xd0,'I',1);put(actors+0xe8,'ff',expiry,next_action);put(frame+0x320,'Q',game)
   uc.reg_write(r.UC_X86_REG_R14,actors);uc.reg_write(r.UC_X86_REG_RBP,frame);sx(r.UC_X86_REG_XMM6,10.);sx(r.UC_X86_REG_XMM12,11.)
   run('tick-admission',0x145946259,[RANGES['tick-admission']],[0x145946293,0x145945cdc])
   due=10>=expiry or 10>=next_action
   assert (uc.reg_read(r.UC_X86_REG_RIP)==0x145946293)==due
   value=get(actors+0xec,'f')[0];assert value==(11. if due else value) or math.isnan(value)and math.isnan(next_action)
   cases+=1
 counts['deadline_admission']=cases
 cases=0
 for kind in [0,1,2,7]:
  for expired in [False,True]:
   for ward_dead,parent_dead,parent_exists in [(False,False,True),(True,False,True),(False,True,True),(False,False,False)]:
    uc.mem_write(actors,b'\0'*0x400);put(game+0x568,'QQ',actors,2 if parent_exists else 1);put(frame+0x320,'Q',game);put(frame+0x60,'Q',game+0x560)
    put(actors+0xf0,'Q',99);put(actors+0xe0,'Q',77);put(actors+0xb0,'I',int(ward_dead));put(actors+0xd0,'I',kind)
    put(actors+0x1d8+0xf0,'Q',77);put(actors+0x1d8+0xb0,'I',int(parent_dead));put(actions,'IIQQfffB',kind,2 if kind==0 else bits(.01),0,99,5.,7.,9.,int(expired))
    uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_R14,actions);uc.reg_write(r.UC_X86_REG_RBX,actions+40);uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_R15,frame+0x260);sx(r.UC_X86_REG_XMM10,f32(math.tau));uc.reg_write(r.UC_X86_REG_XMM11,bits(1.5)|(bits(1.5)<<32))
    run('actions',0x145949dbd,[RANGES['tick-actions']],[0x145949fdc])
    if ward_dead:assert calls==[]
    elif parent_dead or not parent_exists:assert calls==[('remove',99)]
    elif kind==1 and not expired:assert calls==[('heal',77,f32(.01),2054)]
    elif not expired:assert calls==[]
    elif kind==0:
     assert len(calls)==3 and calls[-1]==('remove',99)
     for i,call in enumerate(calls[:-1]):
      assert call[0:2]==('hatch',0);angle=f32(f32(i/2)*f32(math.tau));expected=(f32(f32(math.cos(angle))*1.5+5.),f32(f32(math.sin(angle))*1.5+7.),9.)
      assert call[2]==expected,(call,expected)
    else:assert calls==[('remove',99)]
    cases+=1
 counts['deferred_lifecycle']=cases
 return counts

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--stage',action='store_true');args=p.parse_args()
 raw,span,rows,catalog,index,baselines=recover(not args.stage)
 cases=native_cases(raw,catalog)
 sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs')]
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 md=Cs(CS_ARCH_X86,CS_MODE_64);ranges=[];assemblies={}
 for role,(a,b) in RANGES.items():
  ins=list(md.disasm(raw(a,b-a),a));assert sum(i.size for i in ins)==b-a,role
  text=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
  if role=='producer':
   canonical=(STAGE if args.stage else KEPT).parent/'raid-hazards/dispatcher.asm'
   selected=''.join(line+'\n'for line in canonical.read_text().splitlines() if a<=int(line.split(':')[0],16)<b)
   assert selected==text,'Current ward producer differs from canonical raid dispatcher'
   assembly='../raid-hazards/dispatcher.asm'
  else:
   assembly=role+'.asm';assemblies[assembly]=text
  ranges.append(dict(role=role,**span(a,b-a),assembly=assembly))
 source=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_wards.rs').read_text()
 templates='\n'.join(f'    Template {{ name: {json.dumps(a["name"])}, entry: {a["entry"]}, display: {a["display"]}, scale: f32::from_bits(0x{a["scale_bits"]:08x}) }},'for a in catalog)
 assert source.split('// BEGIN NATIVE WARD TEMPLATES\n')[1].split('// END NATIVE WARD TEMPLATES')[0]==templates+'\n'
 definitions=[]
 for row in rows:
  w=row['words'];flt=lambda v:f'f32::from_bits(0x{v:08x})'
  definitions.append(f'    Definition {{ config: {w[:4]}, template: {w[4]+(w[5]<<32)}, count: {w[6]}, spread: {flt(w[7])}, health_factor: {flt(w[8])}, lifetime: {flt(w[9])} }},')
 assert source.split('// BEGIN NATIVE WARD DEFINITIONS\n')[1].split('// END NATIVE WARD DEFINITIONS')[0]=='\n'.join(definitions)+'\n'
 result=dict(target_version='0.112.0',target_sha256=SHA,target_executed=False,catalog=catalog,ward_actor_baselines=baselines,records=rows,ranges=ranges,cases=cases,
  limits=['Isolated original-byte fixtures do not execute Rust or launch a game.',
  'Trig, field-map, packet allocation, hatch and healing helper calls have explicit synthetic fixture seams.',
  'Shared damage/death and broad actor ordering remain separate contracts; their original/new behavior cannot be inferred from the ward-only fixtures.'])
 out=STAGE if args.stage else KEPT
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 for name,text in [('manifest.json',dump(result)),*assemblies.items()]:
  if args.stage:(out/name).write_text(text)
  else:assert (out/name).read_text()==text,name
 print('Current wards:',len(catalog),'templates;',len(rows),'native22 records;',cases,'; no compilation/game')
if __name__=='__main__':main()

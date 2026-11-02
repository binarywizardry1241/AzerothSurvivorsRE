#!/usr/bin/env python3
"""Compare current ordinary ability, class, talent and gear definitions.

Read-only by default; --write retains compact proof. No compiler/game runs.
The generic 113-record field decoder is reused with explicit current identity
and table, never with its historical addresses or expected results.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT=ROOT/'docs/analysis/evidence/0.112.0/balance/definitions.json'
ASSETS=ROOT/'crates/azeroth-survivors-re/assets'

def load(name,path):
 m = load_script(name, ROOT/path);return m

def f(x):
    return _shared_f32(x)
def bits(x):
    return _shared_bits(x)
def digest(x):return hashlib.sha256(json.dumps(x,sort_keys=True,ensure_ascii=False,separators=(',',':')).encode()).hexdigest()

def recover(apply_gear=False):
 target=latest_target(verify=True);assert target['sha256']==SHA;data=target_bytes(target);pe=load('balance_pe','scripts/inventory-executable.py').PE(data);spans={}
 manifest_path=ROOT/'docs/analysis/evidence/0.112.0/balance/manifest.json';manifest=json.loads(manifest_path.read_text());assert manifest['target']['sha256']==SHA
 for row in manifest['ranges']+manifest['ghidra_observations']:
  a,b=int(row['address'],16),int(row['end_exclusive'],16);off=pe.rva_offset(a-pe.image_base)
  assert hashlib.sha256(data[off:off+b-a]).hexdigest()==row.get('sha256',row.get('raw_input_sha256'))
  for key in ['assembly','pseudocode']:
   if key in row:assert hashlib.sha256((manifest_path.parent/row[key]).read_bytes()).hexdigest()==row[key+'_sha256']

 def raw(a,n):
  off=pe.rva_offset(a-pe.image_base);assert off is not None and 0<=n<1000000
  v=data[off:off+n];assert len(v)==n
  if n:spans[a,n]=dict(address=hex(a),byte_count=n,sha256=hashlib.sha256(v).hexdigest())
  return v
 def unpack(a,fmt):return struct.unpack('<'+fmt,raw(a,struct.calcsize('<'+fmt)))
 def q(a):return unpack(a,'Q')[0]
 def pair(a):return unpack(a,'QQ')
 def text(a):
  p,n=pair(a);assert n<10000
  return raw(p,n).decode() if p else None
 ability=load('ability_fields','scripts/check-ability-definitions.py');ability.SHA=SHA;ability.TABLE=0x146bf5eb0
 ability_proof=ability.check();ability_proof['generator']={'path':'scripts/check-balance-definitions.py'}
 ability_proof['generator_dependencies'].append({'path':'scripts/check-ability-definitions.py','sha256':hashlib.sha256((ROOT/'scripts/check-ability-definitions.py').read_bytes()).hexdigest()})
 ability_proof['range_count']=len(ability_proof['ranges']);ability_proof['range_manifest_sha256']=digest(ability_proof.pop('ranges'))
 source=(ROOT/'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text();menu=json.loads((ASSETS/'menu.json').read_text());talents=json.loads((ASSETS/'talents.json').read_text());entry=json.loads((ASSETS/'run-entry-0.100.1.json').read_text());classes=[]
 for i,cid in enumerate([1,2,3,4,5,7,8,9,11]):
  a=0x146bf4988+i*144;raw(a,144);key=text(a+16);p,n=pair(a+48);pool=[text(p+j*16) for j in range(n)];starter=text(a+64);row=next(c for c in menu['classes'] if c['key']==key)
  assert row['base_health']==unpack(a+128,'f')[0] and row['starting_spell_key']==starter
  assert row['spell_keys']==pool,(key,'menu pool')
  for at,k in [(32,'name'),(96,'icon'),(112,'blurb')]:assert row[k]==text(a+at),(key,k)
  assert 'pool: &['+', '.join(json.dumps(v) for v in pool)+']' in source
  old=next(c for c in talents['classes'] if c['id']==cid);base=next(c for c in entry['classes'] if c['id']==cid)
  baseline=unpack(a+128,'III');assert (bits(base['base_health']),bits(base['armor_fraction']),old['leech_bits'])==baseline
  assert bits(entry['player']['armor_by_class'][key])==baseline[1]
  classes.append(dict(id=cid,key=key,starter=starter,pool=pool,baseline_bits=baseline))
 # Current ordinary magnitude arrays are shared across every definition.
 upgrade_source=(ROOT/'crates/azeroth-survivors-re/src/player_abilities/upgrades.rs').read_text();upgrade_tables=[];upgrade_values={}
 for name,address,fmt in [('POWER',0x14721b0ec,'f'),('COOLDOWN',0x14721b118,'f'),('TARGETS',0x14721b148,'I'),('AREA',0x14721b178,'f'),('DURATION',0x14721b1a8,'f')]:
  values=unpack(address,fmt*5);source_values=[float(v)for v in re.search(r'const '+name+r':\s*\[[^]]+\]\s*=\s*\[([^]]+)\]',upgrade_source)[1].split(',')]
  assert [bits(v)for v in source_values]==[bits(v)for v in values],name;upgrade_values[name]=values;upgrade_tables.append(dict(name=name,address=hex(address),bits=[bits(v)for v in values]))
 # Shared current armor/weapon/extra scaling inputs used by the native item reader.
 armor_offsets=[(0x14721f16c,2),(0x14721f17c,2),(0x14721f18c,2),(0x14721f19c,2),(0x14721f1ac,2),(0x14721f1bc,1),(0x14721f1c4,1),(0x14721f1cc,3)]
 effects=lambda a,n:[unpack(a+j*8,'If') for j in range(n)]
 armor=[effects(a,n) for a,n in armor_offsets];extras=[effects(0x14721f1e4+j*16,2) for j in range(8)]
 scales=unpack(0x147245cfc,'6f');extra_scales=unpack(0x147245d68,'6f');scale=unpack(0x145df1a90,'f')[0]
 def scaled(rows,rarity,extra=False):
  factor=f(scale*(extra_scales if extra else scales)[rarity]);return [(tag,float(math.floor(f(v*factor)+.5)) if tag==2 else f(v*factor)) for tag,v in rows]
 gear=json.loads((ASSETS/'armory.json').read_text());pvp=json.loads((ASSETS/'pvp-gear-0.105.0.json').read_text());gear_values=[];scaler_cases=[];gear_changes=[]
 for catalog in [gear,pvp]:assert catalog['numeric_effects_provenance']['target_sha256']==SHA
 for hero in gear['classes']+pvp['classes']:
  cid=hero['id'];a=q(0x147220868+(cid-1)*8);raw(a,304);assert raw(a+297,1)[0]==cid
  for piece in hero['items']:
   slot,rarity=piece['slot'],piece['rarity']
   if slot<8:rows=armor[slot]
   else:
    w=q(a+120)+(slot-8)*144;raw(w,144);rows=effects(q(w+88),q(w+96))
   extra=extras[(cid*3+slot)%8];calculated=scaled(rows,rarity)
   if rarity:
    calculated+=scaled(extra,rarity,True)
    if rarity==4:calculated.append((11,1.) if slot>=8 else (12,struct.unpack('<f',bytes.fromhex('31082c3d'))[0]))
   merged={}
   for tag,v in calculated:merged[tag]=f(merged.get(tag,0.)+v)
   expected=[dict(tag=t,value=v) for t,v in merged.items()]
   if piece['effects']!=expected:
    gear_changes.append(dict(id=piece['id'],previous=piece['effects'],current=expected))
    if apply_gear:piece['effects']=expected
   gear_values.append(dict(id=piece['id'],effects=expected))
   scaler_cases.append(dict(owner=0x1459f39e0 if slot<8 else 0x1459f3c20,rarity=rarity,rows=rows,expected=scaled(rows,rarity)))
   if rarity:scaler_cases.append(dict(owner=0x1459f3e60,rarity=rarity,rows=extra,expected=scaled(extra,rarity,True)))
 assert len(gear_values)==498
 # Replay each actual piece's shared numeric scaling inputs with current code.
 import native_talent_fixture as n
 vm=n.Machine();native_digest=hashlib.sha256();upgrade_cases=0;upgrade_digest=hashlib.sha256()
 for ai in range(113):
  ability_at=0x146bf5eb0+ai*120;key=text(ability_at);cast_kind=raw(ability_at+117,1)[0]
  for count,cd,area,duration,targets in [(0,1.,1.,1.,0),(1,.5,2.,2.,1),(7,.2,5.,6.,12),(0xffffffff,-1.,6.,7.,0xffffffff)]:
   instance=vm.alloc(128);vm.put(instance,ability_at)
   for at,value in [(0x14,cd),(0x1c,area),(0x20,duration)]:vm.u.mem_write(instance+at,struct.pack('<f',value))
   vm.u.mem_write(instance+0x18,struct.pack('<I',targets))
   for kind in range(5):
    vm.u.mem_write(instance+0x24+kind*4,struct.pack('<I',count))
    for rarity in range(5):
     vm.call(0x145993420,instance,kind,rarity);actual=vm.u.reg_read(n.UC_X86_REG_XMM0)&0xffffffff
     if kind==0:expected=f(upgrade_values['POWER'][rarity]/f(1.+f(f(count)*f(.5))))
     elif kind==1:expected=f(max(f(f(f(cd)+f(-.2))/f(.8)),0.)*upgrade_values['COOLDOWN'][rarity])
     elif kind==2:
      cap=12 if cast_kind!=11 else 2 if key in ['seal_fate','soul_fire','lightwell','faerie_fire'] else 0
      expected=f(min(max(cap-targets,0),upgrade_values['TARGETS'][rarity]))
     elif kind==3:expected=f(max(f(f(f(5.)-f(area))*f(.25)),0.)*upgrade_values['AREA'][rarity])
     else:expected=f(max(f(f(f(6.)-f(duration))/f(5.)),0.)*upgrade_values['DURATION'][rarity])
     assert actual==bits(expected),(key,kind,rarity,count,actual,bits(expected));upgrade_digest.update(struct.pack('<I',actual));upgrade_cases+=1

 for case in scaler_cases:
  source_it=vm.alloc(24);out=vm.alloc(24);target_count=vm.alloc(8);rarity=vm.alloc(8);rows=vm.alloc(8*len(case['rows']));buffer=vm.alloc(8*len(case['rows']))
  vm.u.mem_write(rows,b''.join(struct.pack('<If',*v) for v in case['rows']));vm.put(source_it,rows,rows+len(case['rows'])*8,rarity);vm.put(rarity,case['rarity']);vm.put(out,target_count,0,buffer)
  vm.call(case['owner'],source_it,out);assert vm.q(target_count)==len(case['rows'])
  actual=[struct.unpack('<If',vm.u.mem_read(buffer+j*8,8)) for j in range(len(case['rows']))];assert actual==case['expected'],(case,actual)
  native_digest.update(bytes(vm.u.mem_read(buffer,len(actual)*8)))
 # Revalidate the actual nineteen-word equipment producer and stat consumer,
 # rather than stopping at isolated item scaling. Raw tag11 carries a u32.
 merge_cases=[]
 for hero in gear['classes']:
  for rarity in range(5):
   selected=[piece for piece in hero['items']if piece['rarity']==rarity]
   merge_cases += [selected,[piece for piece in selected if piece['slot']==5]]
 for hero in pvp['classes']:
  selected=hero['items'];merge_cases += [selected,[piece for piece in selected if piece['slot']==5]]
  horde=[dict(piece,id=piece['id']+10)for piece in selected];merge_cases += [horde,[piece for piece in horde if piece['slot']==5]]
 merge_cases.append([])
 composition_digest=hashlib.sha256()
 for selected in merge_cases:
  slots=vm.alloc(76);out=vm.alloc(24);expected=[]
  for piece in selected:
   vm.u.mem_write(slots+piece['slot_id']*4,struct.pack('<I',piece['id']))
   for effect in piece['effects']:
    tag,value=effect['tag'],effect['value']
    existing=next((r for r in expected if r[0]==tag),None)
    if existing:existing[1]=f(existing[1]+value)
    else:expected.append([tag,value])
  vm.call(0x145997a50,out,slots);pointer,count=vm.q(out+8),vm.q(out+16);actual=[]
  for i in range(count):
   tag,word=struct.unpack('<II',vm.u.mem_read(pointer+i*8,8));value=float(word)if tag==11 else struct.unpack('<f',struct.pack('<I',word))[0];actual.append([tag,value])
  assert actual==expected,('equipped merge',selected[0]['id'],actual,expected)
  game=vm.alloc(0xb00);frame=vm.S+0x80000;vm.put(game+0x378,pointer,count)
  initial={12:2.,9:.2,5:.1,1:1.,3:.2,10:.3,13:7.,14:1.,8:0.}
  vm.u.mem_write(frame+0x50,struct.pack('<f',1.))
  for reg,value in initial.items():vm.u.reg_write(getattr(n,'UC_X86_REG_XMM'+str(reg)),bits(value))
  vm.u.reg_write(n.UC_X86_REG_RSI,game);vm.u.reg_write(n.UC_X86_REG_RBP,frame);vm.u.reg_write(n.UC_X86_REG_RAX,0);vm.u.reg_write(n.UC_X86_REG_MXCSR,0x1f80)
  vm.u.emu_start(0x1458f2e01,0x1458f2e6a,count=10000);assert vm.u.reg_read(n.UC_X86_REG_RIP)==0x1458f2e6a
  def scalar(reg):return struct.unpack('<f',vm.u.reg_read(getattr(n,'UC_X86_REG_XMM'+str(reg))).to_bytes(16,'little')[:4])[0]
  # Native gear-stage initialization supplies these four lanes; other baseline
  # lanes are independent synthetic race/class inputs.
  cd=unpack(0x145dad268,'f')[0]
  want={0:f(2.),1:f(.2),2:0.,3:f(.1),4:cd,5:1.,6:f(.2),7:f(.3),8:7.,9:1.,10:1.,11:0,12:0.}
  for tag,value in expected:
   if tag==8:want[tag]=f(want[tag]*f(1.+value))
   elif tag==11:want[tag]=(want[tag]+int(value))&0xffffffff
   else:want[tag]=f(want[tag]+value)
  got={0:scalar(12),1:scalar(9),2:struct.unpack('<f',vm.u.mem_read(frame+0xa8,4))[0],3:scalar(5),4:scalar(6),5:scalar(1),6:scalar(3),7:scalar(10),8:scalar(13),9:scalar(14),10:struct.unpack('<f',vm.u.mem_read(frame+0x50,4))[0],11:vm.u.reg_read(n.UC_X86_REG_EAX),12:scalar(8)}
  assert got==want,('gear composition',selected[0]['id'],got,want)
  composition_digest.update(json.dumps(got,sort_keys=True).encode())
 for path,tokens in [('crates/azeroth-survivors-re/src/armory.rs',['pub fn effects(', 'merged.iter_mut().find', '*total += value']),('crates/azeroth-survivors-re/src/gameplay/mod.rs',['gear.effects(&armory, pick.hero.class)','game.configure_effects(']),('crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs',['self.effect_state.equipped.gear = gear.to_vec()', 'numeric.apply_gear(&self.effect_state.equipped.gear)']),('crates/azeroth-survivors-re/src/run_effects.rs',['5 => self.move_speed += value','8 => self.pickup *= 1.0 + value','11 => self.targets = self.targets.wrapping_add(value as u32)'])]:
  live=(ROOT/path).read_text()
  for token in tokens:assert token in live,(path,token)
 if apply_gear and gear_changes:
  for name,catalog in [('armory.json',gear),('pvp-gear-0.105.0.json',pvp)]:
   (ASSETS/name).write_text(json.dumps(catalog,indent=2,ensure_ascii=False)+'\n')
 elif gear_changes:raise ValueError(json.dumps(gear_changes,indent=2))
 # Every current tree uses160-byte records. Current Warlock/Warrior overlays own
 # their changed rows; compare all retained other definitions/payloads separately.
 talent_values=[];changed=[];mismatches=[];rank_texts=[];follower_grants=[]
 ui=json.loads((ASSETS/'talents-menu-0.109.0.json').read_text());pets_source=(ROOT/'crates/azeroth-survivors-re/src/run_effects/pets.rs').read_text()
 def normalized(payload,strings,native):
  v=bytearray.fromhex(payload) if isinstance(payload,str) else bytearray(payload);v[0]={36:30,37:31}.get(v[0],v[0]) if native else v[0];v[1:4]=bytes(3)
  for r in strings:v[r['offset']:r['offset']+8]=bytes(8)
  if v[0]==29:v[8:16]=bytes(8)
  return v.hex()
 for ci,cls in enumerate(talents['classes']):
  desc=q(0x14723f158+8*(cls['id']-1));raw(desc,200)
  for ti,tree in enumerate(cls['trees']):
   at=desc+ti*64;ptr,count=pair(at+48);raw(ptr,count*160)
   assert [text(at+o) for o in [0,16,32]]==[tree[k] for k in ['name','background','icon']]
   for i in range(count):
    a=ptr+i*160;key=text(a+48)
    if cls['id']==9 or key in ['imp_heroic','unbridled_wrath']:changed.append(key);continue
    row=next(t for t in tree['talents'] if t['key']==key)
    ui_row=next(t for c in ui['classes'] if c['id']==cls['id'] for tr in c['trees'] for t in tr['talents'] if t['key']==key)
    for field,offset in [('key',48),('name',64),('icon',80),('description',112),('prerequisite',0),('alternative_prerequisite',16)]:assert ui_row[field]==text(a+offset),(key,'menu',field)
    assert list(raw(a+152,4))==[ui_row['row'],ui_row['column'],ui_row['max_rank'],int(ui_row['exclusive'])]
    assert bool(vm.call(0x14599e380,a)&255)==ui_row['milestone']
    for rank in range(1,ui_row['max_rank']+1):
     out=vm.alloc(24);vm.call(0x14599ddf0,out,a,rank);actual=bytes(vm.u.mem_read(vm.q(out+8),vm.q(out+16))).decode();value=ui_row['numeric_values'][rank-1];expected=ui_row['description'] if value is None else ui_row['description'].replace('{v}',value)
     assert actual==expected,(key,rank,actual,expected);rank_texts.append([key,rank,actual])

    fields=[('key',48),('name',64),('icon',80),('description',112),('prerequisite',0)]
    for k,offset in fields:
     if row[k]!=text(a+offset):mismatches.append((key,k,row[k],text(a+offset)))
    assert list(raw(a+152,3))==[row['row'],row['column'],row['max_rank']],key
    ep,ec=pair(a+96);assert len(row['effects'])==ec,(key,ec,len(row['effects']))
    values=[]
    for ei,old in enumerate(row['effects']):
     payload=raw(ep+ei*64,64);strings=old['strings']+old.get('lists',[])
     for r in old['strings']:
      assert text(ep+ei*64+r['offset'])==r['value'],(key,'effect string')
     for r in old.get('lists',[]):
      lp,ln=pair(ep+ei*64+r['offset']);assert [text(lp+j*16) for j in range(ln)]==r['values']
     a1=normalized(old['payload'],strings,False);a2=normalized(payload,strings,True)
     if a1!=a2:mismatches.append((key,'effect',a1,a2))
     values.append(a2)
    grants=[]
    for ei in range(ec):
     payload=raw(ep+ei*64,64)
     if payload[0]==29:grants.append(unpack(struct.unpack_from('<Q',payload,8)[0]+32,'I')[0])
    if grants:
     assert f'"{key}" => &[{", ".join(map(str,grants))}]' in pets_source,(key,grants)
     follower_grants.append(dict(key=key,entries=grants))
    talent_values.append(dict(key=key,effects=values))
 if mismatches:raise ValueError(json.dumps(mismatches,indent=2))
 return dict(target={k:target[k] for k in ['version','path','sha256','size_bytes']},ability_fields=ability_proof,classes=classes,gear_count=415,shared_pvp_numeric_rows=83,gear_semantic_sha256=digest(gear_values),native_gear_cases=len(scaler_cases),native_equipment_merge_cases=len(merge_cases),native_gear_composition_cases=len(merge_cases),native_gear_composition_sha256=composition_digest.hexdigest(),native_gear_sha256=native_digest.hexdigest(),ordinary_upgrade_tables=upgrade_tables,native_upgrade_magnitude_cases=upgrade_cases,native_upgrade_sha256=upgrade_digest.hexdigest(),retained_talents=len(talent_values),native_rank_descriptions=len(rank_texts),rank_text_sha256=digest(rank_texts),follower_grants=follower_grants,talent_semantic_sha256=digest(talent_values),separately_owned_current_talents=changed,ranges=[spans[k] for k in sorted(spans) if k[1]>=120 and not any(b<=k[0] and k[0]+k[1]<=b+c and k!=(b,c) for b,c in spans)],range_count=len(spans),range_manifest_sha256=digest([spans[k]for k in sorted(spans)]),seams=['Current native allocator/C-memory/roundf fixture with preallocated numeric output; locale fallback is unused by numeric scalers.'],limits=['All113 ordinary ability fields,9 classes/pools/baselines,415 ordinary gear and83 shared PvP effects and retained non-Warlock talent definitions/effects are compared.','Changed Warlock/Warrior overlays, boss consumers and amulets have separate current proofs. Full arbitrary gameplay consumers/global ownership remain separate.','No compilation, reconstructed Rust execution, game, device, filesystem or original/rebuilt parity.'])

def prepare_rea():
 target=latest_target(verify=True);assert target['sha256']==SHA;data=target_bytes(target);pe=load('balance_prepare_pe','scripts/inventory-executable.py').PE(data)
 manifest=json.loads((OUT.parent/'manifest.json').read_text())
 for row in manifest['ghidra_observations']:
  a,b=int(row['address'],16),int(row['end_exclusive'],16);off=pe.rva_offset(a-pe.image_base);work=ROOT/'runtime/balance-0.112.0/reproduce'/row['role'];work.mkdir(parents=True,exist_ok=True)
  (work/'code.bin').write_bytes(data[off:off+b-a]);entries=[0x1459f39e0,0x1459f3c20,0x1459f3e60]if row['role']=='gear-scalers'else[a]
  (work/'seeds.tsv').write_text(''.join(f'{x:#x}\tcode\n{x:#x}\tfunction\n'for x in entries))
  plan=dict(target=str((work/'code.bin').relative_to(ROOT)),output=str((work/'rea').relative_to(ROOT)),open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),init_timeout=60,timeout=240,environment={'REA_GHIDRA_SEED_FILE':str((work/'seeds.tsv').relative_to(ROOT))},operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(x)))for x in entries])
  (work/'plan.json').write_text(json.dumps(plan,indent=2)+'\n')
 print('Prepared three bounded current gear REA/Ghidra carriers under project runtime/')

def check_class_leech(evidence):
 """Replay the selected leech scalar leaf and check its connected source lanes."""
 from native_terminal import verified_input, NativeReplay
 manifest,target,data,pe=verified_input(evidence)
 vm=NativeReplay(data,pe);registers=vm.registers
 table=int(manifest['class_table']['start'],16)
 identities=[(1,'warrior'),(2,'paladin'),(3,'hunter'),(4,'rogue'),(5,'priest'),
             (7,'shaman'),(8,'mage'),(9,'warlock'),(11,'druid')]
 retained=json.loads((ASSETS/'talents.json').read_text())
 values={}
 for index,(cid,key) in enumerate(identities):
  address=table+index*144;offset=pe.rva_offset(address-pe.image_base)
  pointer,length=struct.unpack_from('<QQ',data,offset+16)
  at=pe.rva_offset(pointer-pe.image_base)
  assert data[at:at+length].decode()==key
  scalar=struct.unpack_from('<I',data,offset+136)[0]
  old=next(row for row in retained['classes']if row['id']==cid)['leech_bits']
  assert scalar==(0x3ba3d70a if cid==8 else old),(cid,scalar,old)
  values[cid]=struct.unpack('<f',struct.pack('<I',scalar))[0]
  pointer_table=pe.rva_offset(int(manifest['class_index']['start'],16)-pe.image_base)
  if cid>=2:assert struct.unpack_from('<Q',data,pointer_table+(cid-2)*8)[0]==address
  else:assert address==table
 ranges=[(int(row['start'],16),int(row['end_exclusive'],16))for row in manifest['ranges']
         if row['role']=='leech-scalar']
 assert ranges==[(0x145c27310,0x145c2751e)]
 temporary=[[],[(15,14,.001,1,11.)],[(15,14,.01,3,10.)],
            [(15,14,.001,2,12.),(15,14,.02,3,13.)],
            [(15,5,.25,1,11.),(14,14,.25,1,11.)]]
 permanent=[[],[(14,.001)],[(5,9.),(14,.02),(14,.03)]]
 jewelry=[[],[(18,.01)],[(17,3.),(18,.02),(18,.001)]]
 cases=0;steps=0;result=hashlib.sha256()
 for cid in values:
  for timed in temporary:
   for stats in permanent:
    for items in jewelry:
     vm.reset('leech-scalar',ranges,[vm.done]);game=vm.app
     vm.put(game+0x354,'<B',cid);vm.put(game+0xcc0,'<f',10.)
     effects=vm.mem+0x8000;entries=vm.mem+0x9000;numeric=vm.mem+0xa000
     item_rows=vm.mem+0xb000;descriptors=vm.mem+0xc000
     vm.put(game+0x58,'<QQ',entries,len(timed))
     vm.put(game+0x8f0,'<QQ',effects,len(timed))
     for index,(tag,stat,amount,stacks,expires) in enumerate(timed):
      vm.put(effects+index*64,'<BB2xf',tag,stat,amount)
      vm.put(entries+index*16,'<QIf',index,stacks,expires)
     vm.put(game+0x8c0,'<QQ',numeric,len(stats))
     for index,(tag,amount) in enumerate(stats):vm.put(numeric+index*8,'<B3xf',tag,amount)
     vm.put(game+0x390,'<QQ',item_rows,len(items))
     for index,(tag,amount) in enumerate(items):
      descriptor=descriptors+index*128
      vm.put(descriptor+0x44,'<B',tag)
      vm.put(item_rows+index*24,'<Q8xf',descriptor,amount)
     vm.machine.reg_write(registers.UC_X86_REG_RCX,game)
     before=vm.instructions;vm.run(ranges[0][0]);steps+=vm.instructions-before
     actual=vm.machine.reg_read(registers.UC_X86_REG_XMM0)&0xffffffff
     timed_sum=-0.
     for tag,stat,amount,stacks,expires in timed:
      if tag==15 and stat==14 and expires>10.:timed_sum=f(timed_sum+f(f(stacks)*f(amount)))
     stat_sum=-0.
     for tag,amount in stats:
      if tag==14:stat_sum=f(stat_sum+f(amount))
     jewelry_sum=-0.
     for tag,amount in items:
      if tag==18:jewelry_sum=f(jewelry_sum+f(amount))
     expected=bits(f(f(f(timed_sum+values[cid])+stat_sum)+jewelry_sum))
     assert actual==expected,(cid,timed,stats,items,hex(actual),hex(expected))
     result.update(struct.pack('<I',actual));cases+=1
 health_range=next((int(row['start'],16),int(row['end_exclusive'],16))for row in manifest['ranges']if row['role']=='leech-health')
 assert health_range==(0x145c3351d,0x145c33594)
 healing_cases=0
 for power in [1.,200.,100000000.]:
  for leech in [.005,.03,0.,-.01,float('nan')]:
   for rank in [0,4,5,255]:
    for health in [-1.,0.,50.,99.9,100.,110.]:
     vm.reset('leech-health',[health_range],[health_range[1],0x145c3363b,0x145c3380a])
     vm.put(vm.app+0x36f,'<B',rank);vm.put(vm.app+0x538,'<f',health);vm.put(vm.app+0x4c8,'<f',100.)
     vm.machine.reg_write(registers.UC_X86_REG_RDI,vm.app)
     vm.scalar(registers.UC_X86_REG_XMM0,leech);vm.scalar(registers.UC_X86_REG_XMM8,power)
     before=vm.instructions;pc=vm.run(health_range[0]);steps+=vm.instructions-before
     requested=f(f(f(power)*f(leech))*f(.5 if rank>=5 else 1.))
     expected=f(min(f(f(health)+requested),100.))if f(leech)>0. else f(health)
     actual=vm.get(vm.app+0x538,'<I')[0]
     assert actual==bits(expected),(power,leech,rank,health,hex(actual),hex(bits(expected)))
     stop=0x145c3380a if not(f(leech)>0.)else health_range[1]if f(expected-f(health))>0. else 0x145c3363b
     assert pc==stop,(power,leech,rank,health,hex(pc),hex(stop))
     result.update(struct.pack('<QI',pc,actual));healing_cases+=1
 paths=['run_effects.rs','run_effects/healing.rs','gameplay/mechanics.rs',
        'gameplay/mechanics/effects.rs','gameplay/mechanics/callbacks.rs',
        'gameplay/mechanics/passives.rs','gameplay/mechanics/bosses.rs',
        'gameplay/mechanics/wards.rs']
 source={name:(ROOT/'crates/azeroth-survivors-re/src'/name).read_text()for name in paths}
 assert 'leech_bits: if class.id == 8 { 0x3ba3d70a } else { class.leech_bits }'in source['run_effects.rs']
 assert '((temporary + self.class) + sum(permanent)) + self.jewelry'in source['run_effects/healing.rs']
 assert 'self.total_from(temporary.iter().copied(), permanent)'in source['run_effects/healing.rs']
 for name in ['gameplay/mechanics/effects.rs','gameplay/mechanics/callbacks.rs']:
  assert '.base_leech.total('in source[name]and'.equipped.stats.len()..]'in source[name]
 for name in ['gameplay/mechanics.rs','gameplay/mechanics/bosses.rs','gameplay/mechanics/wards.rs']:
  assert 'leech_after_hit(result.amount, leech, self.rules.heroic_rank, vitals,'in source[name]
  assert 'let leech = self.current_leech();'in source[name]
  scope=source[name].split('fn hit'+({'gameplay/mechanics.rs':'','gameplay/mechanics/bosses.rs':'_boss','gameplay/mechanics/wards.rs':'_ward'}[name])+'(',1)[1]
  assert scope.index('leech_after_hit(')<scope.index('row.actor.dead = true')
 legacy=source['gameplay/mechanics.rs'].split('impl<W: RunWorld> PassivePort for CombatAdapter',1)[1].split('    fn emit_passive_started',1)[0]
 assert '            rng,\n            None,\n        );'in legacy
 callbacks=source['gameplay/mechanics/callbacks.rs'].split('pub(super) fn hit_with_execution(',1)[1]
 assert callbacks.index('self.resolve_hit(hit, rng, Some(&mut execution.vitals))')<callbacks.index('self.core.flush_leech(&mut execution.vitals)')<callbacks.index('self.generic_event(')
 passive=source['gameplay/mechanics/passives.rs'].split('pub(super) fn resolve_hit(',1)[1]
 assert passive.index('self.core.hit(hit, rng, vitals)')<passive.index('hit_passives::after_damage(')
 assert 'fn mage_leech_heals_full_overkill_for_each_damage_source_and_withering()'in source['gameplay/mechanics.rs']
 assert 'fn mage_leech_reaches_health_gated_freecasts_before_they_are_admitted()'in source['gameplay/mechanics.rs']
 assert 'self.generic.temporary.contributions(&self.equipped.rows, self.now)'in source['gameplay/mechanics.rs']
 assert 'fn ordinary_hit_excludes_expired_leech_before_the_later_stat_compaction()'in source['gameplay/mechanics.rs']
 return dict(target_sha256=target['sha256'],class_descriptors=9,native_scalar_cases=cases,
             native_healing_cases=healing_cases,original_instruction_steps=steps,scalar_output_sha256=result.hexdigest(),
             connected_source_paths=len(paths),compiled=False,target_executed=False,parity=False)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');p.add_argument('--apply-gear',action='store_true');p.add_argument('--prepare-rea',action='store_true');p.add_argument('--class-leech-contract',type=Path,help='Selected hash-bound leech evidence manifest');args=p.parse_args();
 if args.class_leech_contract:
  evidence=(ROOT/args.class_leech_contract).resolve();assert evidence.is_relative_to(ROOT)
  sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
  proof=check_class_leech(evidence.parent);text=json.dumps(proof,indent=2)+'\n'
  if args.write:(evidence.parent/'validation.json').write_text(text)
  else:assert(evidence.parent/'validation.json').read_text()==text,'Selected leech proof missing/stale'
  print(text);return
 if args.prepare_rea:
  prepare_rea();return
 proof=recover(args.apply_gear);s=json.dumps(proof,indent=2,ensure_ascii=False)+'\n'
 if args.write:OUT.parent.mkdir(parents=True,exist_ok=True);OUT.write_text(s)
 else:assert OUT.read_text()==s,'Current balance proof missing/stale'
 print('Checked113 ability fields,9 classes,498 shared gear effects,',proof['native_gear_cases'],'native scaling cases and',proof['retained_talents'],'retained talents; no compiler/game')
if __name__=='__main__':main()

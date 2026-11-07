#!/usr/bin/env python3
"""Check current complete ordinary amulet construction and effect scaling."""
import sys,json,struct,hashlib,argparse,math,re
from pathlib import Path
import native_talent_fixture as n
parser=argparse.ArgumentParser(description='Compare all current amulet construction/scaling without compilation/game');parser.add_argument('--write',action='store_true');args=parser.parse_args()
class Machine(n.Machine):
 def hook(self,u,a,size,unused):
  if a==0x145c0a459: # current floorf import, finite magnitude fixture only
   value=struct.unpack('<f',u.reg_read(n.UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
   assert math.isfinite(value)
   u.reg_write(n.UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',math.floor(value)),'little'))
   sp=u.reg_read(n.UC_X86_REG_RSP);u.reg_write(n.UC_X86_REG_RIP,self.q(sp));u.reg_write(n.UC_X86_REG_RSP,sp+8);self.seams.add(a);return
  return super().hook(u,a,size,unused)
vm=Machine();rows=[]
def text(a):return bytes(vm.u.mem_read(vm.q(a),vm.q(a+8))).decode()
def effects(p,c):
 out=[]
 for i in range(c):
  at=p+i*64;raw=bytearray(vm.u.mem_read(at,64));tag=raw[0];raw[0]={36:30,37:31}.get(tag,tag);strings=[]
  for o in range(0,49,8):
   pointer,length=struct.unpack_from('<QQ',raw,o)
   if (n.pe.image_base<=pointer<n.pe.image_base+0x10000000 or vm.H<=pointer<vm.heap) and 0<length<=256:
    try:value=bytes(vm.u.mem_read(pointer,length)).decode()
    except Exception:continue
    strings.append(dict(offset=o,value=value))
  effect=dict(kind='passive',tag=raw[0])
  if raw[0]==30:effect=dict(kind='stat',stat_tag=raw[8],amount_bits=struct.unpack_from('<I',raw,4)[0])
  elif raw[0]==31:
   selector=dict(kind='all') if raw[8]==0 else dict(kind='key',key=text(at+16));effect=dict(kind='spell',selector=selector,modifier=raw[36],amount_bits=struct.unpack_from('<I',raw,32)[0])
  out.append(dict(tag=tag,raw_hex=raw.hex(),strings=strings,effect=effect))
 return out
for i in range(113):
 a=0x146bf5eb0+i*120;out=vm.alloc(112);vm.call(0x1458a1730,out,a)
 rows.append(dict(ability_key=text(a),key=text(out+8),name=text(out+32),icon=text(out+72),rarity=vm.q(out+96),effects=effects(vm.q(out+56),vm.q(out+64))))

# Names enter both the live Rust spell catalog and the menu/class fallback.
menu=json.loads((n.ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())
ability_source=(n.ROOT/'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text().split('pub static ABILITIES:',1)[1].split('pub static CLASSES:',1)[0]
for i in range(113):
 a=0x146bf5eb0+i*120;key,name=text(a),text(a+16)
 assert re.search(r'key:\s*'+re.escape(json.dumps(key))+r',\s*name:\s*'+re.escape(json.dumps(name)),ability_source),(key,'live name')
 assert next(r['name']for r in menu['abilities']if r['key']==key)==name,(key,'menu name')
for cls in menu['classes']:
 assert cls['spell_names']==[next(r['name']for r in menu['abilities']if r['key']==key)for key in cls['spell_keys']]
assert menu['labels']['ability.soul_fire.name']=='Soulfire'
shared=[]
for i in range(16):
 a=0x146c015c8+i*80;shared.append(dict(key=text(a),name=text(a+16),icon=text(a+32),rarity=vm.q(a+64),effects=effects(vm.q(a+48),vm.q(a+56))))
current=dict(generated=rows,shared=shared);
old=json.load(open('crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json'));old['generated']=[r for r in old['generated'] if r['key']!='legendary:demonic_empowerment'];old['generated'].append(json.load(open('crates/azeroth-survivors-re/assets/legionlord-0.112.0.json'))['definition'])
old['generated']=[dict(r,name='Charm of the Fated Hour: Soulfire') if r['key']=='legendary:soul_fire' else r for r in old['generated']]
source=(n.ROOT/'crates/azeroth-survivors-re/src/loot_rewards/amulets.rs').read_text()
assert '.expect("current Soulfire amulet").name = "Charm of the Fated Hour: Soulfire".into()' in source
assert 'catalog.shared.retain(|row| row.key != "star_of_mystaria")' in source
assert 'legionlord-0.112.0.json' in source

def norm(e):
 b=bytearray.fromhex(e['raw_hex']);b[1:4]=bytes(3)
 for s in e['strings']:b[s['offset']:s['offset']+8]=bytes(8)
 return b.hex(),e['strings'],e['effect']
diff=[]
for group in ['generated','shared']:
 bykey={r['key']:r for r in old[group]}
 for r in current[group]:
  o=bykey[r['key']]
  for k in ['ability_key','key','name','icon','rarity']:
   if r.get(k)!=o.get(k):diff.append((r['key'],k,o.get(k),r.get(k)))
  if [norm(e) for e in r['effects']]!=[norm(e) for e in o['effects']]:diff.append((r['key'],'effects',[norm(e) for e in o['effects']],[norm(e) for e in r['effects']]))
assert not diff,json.dumps(diff,indent=2)
scaling_count=0;scaling_digest=hashlib.sha256()
for row in rows+shared:
 for record in row['effects']:
  for factor in [0.,1.,1.5,2.,2.5]:
   original=bytes.fromhex(record['raw_hex']);expected=bytearray(original);tag=original[0]
   offset=(4 if tag in (0,2,3,4,5,7,11,13,15,16,17,18,22,30) else 8 if tag in (6,9,12) else (12 if original[8:12]==bytes([255])*4 else 4) if tag==8 else 32 if tag==31 else None)
   if offset is not None:
    value=struct.unpack_from('<f',original,offset)[0];value=struct.unpack('<f',struct.pack('<f',value*factor))[0]
    if tag==31 and original[36]==1:value=min(value,.5)
    if tag==31 and original[36]==2:value=math.floor(struct.unpack('<f',struct.pack('<f',value+struct.unpack('<f',struct.pack('<I',0x38d1b717))[0]))[0])
    struct.pack_into('<f',expected,offset,value)
   at=vm.alloc(64);native=bytearray(original);native[0]=record['tag'];vm.u.mem_write(at,bytes(native));scalar=vm.alloc(4);vm.u.mem_write(scalar,struct.pack('<f',factor));it=vm.alloc(24);vm.put(it,at,at+64,scalar);out=vm.alloc(24);
   try:vm.call(0x1459d9940,out,it)
   except Exception as error:raise RuntimeError((row['key'],record['tag'],factor)) from error
   assert vm.q(out+16)==1
   actual=bytearray(vm.u.mem_read(vm.q(out+8),64));actual[0]={36:30,37:31}.get(actual[0],actual[0]);actual[1:4]=expected[1:4]=bytes(3)
   assert actual[0]==expected[0],(row['key'],tag,factor)
   checked=[actual[0]]
   if offset is not None:
    assert actual[offset:offset+4]==expected[offset:offset+4],(row['key'],tag,factor,actual.hex(),expected.hex())
    checked+=list(actual[offset:offset+4])
   for string in record['strings']:
    pointer,length=struct.unpack_from('<QQ',actual,string['offset'])
    assert bytes(vm.u.mem_read(pointer,length)).decode()==string['value']
   if tag==31:assert actual[8:32]==expected[8:32] and actual[36]==expected[36]
   scaling_digest.update(bytes(checked));scaling_count+=1
# Digest semantic values only; forensic original pointers/padding do not define behavior.
semantic={group:[dict(**{k:v for k,v in row.items() if k!='effects'},effects=[norm(e) for e in row['effects']]) for row in current[group]] for group in ['generated','shared']}
proof=dict(target={k:n.target[k] for k in ['version','path','sha256','size_bytes']},generated=113,shared=16,native_ability_name_checks=113,keys=[r['key']for r in rows+shared],semantic_sha256=hashlib.sha256(json.dumps(semantic,sort_keys=True,ensure_ascii=False).encode()).hexdigest(),native_scaling_cases=scaling_count,native_scaling_sha256=scaling_digest.hexdigest(),constructor='docs/analysis/evidence/0.112.0/demonic-empowerment/manifest.json',constructor_role='medallion-constructor',ability_table='0x146bf5eb0',shared_table='0x146c015c8',executed_instruction_addresses=len(vm.executed),seams=[hex(x)for x in sorted(vm.seams)],limits=['All113 current generated descriptors and16shared descriptors compare owned keys/names/icons/rarities and normalized complete effect payloads/strings.','Original current constructor/scaling instructions execute with actual PE data and declared allocator/C-memory/English fallback and finite floorf seams; forensic pointer words and enum padding are excluded from semantic comparison.','Scaling checks variant identity, magnitude, owned strings and numeric spell selector/modifier; unused native enum padding is excluded. The factor model translates source scaled_bytes; it does not execute Rust. Actual native powf factor computation, proc gameplay and all build/game/parity remain separate.'])
path=n.ROOT/'docs/analysis/evidence/balance/amulets.json';serialized=json.dumps(proof,indent=2,ensure_ascii=False)+'\n'
if args.write:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(serialized)
else:assert path.read_text()==serialized,'Current amulet proof missing/stale'
print(f'113current generated+16shared amulet descriptors and{scaling_count}native magnitude/selector scaling cases pass; no compiler/game')

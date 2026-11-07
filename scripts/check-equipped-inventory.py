#!/usr/bin/env python3
"""Replay 0.113.2 equipped item contracts; no compilation or application runs.

Formatting/localization and allocations are fixture seams for numeric descriptor
cases. Actual starter/slot/faction instructions, complete ItemInfo serialization,
quality/armor/health branches and display lookup run from the selected EXE.
"""
import argparse, hashlib, json, math, struct, sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
sys.path[:0] = [str(ROOT/'runtime/tool-state/python/armory/python-libs'),
               str(ROOT/'runtime/tool-state/python/camera/python-libs')]
from equipment_native import EquipmentProbe

SHA='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
OUT=ROOT/'docs/analysis/evidence/equipped-inventory'
target=latest_target(verify=True);assert target['sha256']==SHA
data=target_bytes(target);pe=load_script('inventory_pe',ROOT/'scripts/inventory-executable.py').PE(data)
# Retained Ghidra/assembly ownership and exact byte ranges are checked before
# replay. No whole-file hashes of concurrently edited shared source are used.
manifest=json.loads((OUT/'manifest.json').read_text())
assert manifest['target']['sha256']==SHA
for row in manifest['ranges']:
 a=int(row['address'],16);z=int(row['end_exclusive'],16);at=pe.rva_offset(a-pe.image_base)
 assert hashlib.sha256(data[at:at+z-a]).hexdigest()==row['sha256']
for row in manifest['data_ranges']:
 a=int(row['address'],16);at=pe.rva_offset(a-pe.image_base)
 assert hashlib.sha256(data[at:at+row['size']]).hexdigest()==row['sha256']
assembly=(OUT/manifest['assembly']['path']).read_bytes()
assert hashlib.sha256(assembly).hexdigest()==manifest['assembly']['sha256']
for line in assembly.decode().splitlines():
 if not line or line.startswith(';'):continue
 address,encoded,_=line.split(' ',2);a=int(address,16);at=pe.rva_offset(a-pe.image_base)
 assert data[at:at+len(encoded)//2].hex()==encoded
assert len(manifest['ghidra'])==7
for row in manifest['ghidra']:
 a=int(row['owner'],16);z=int(row['end_exclusive'],16);at=pe.rva_offset(a-pe.image_base)
 assert hashlib.sha256(data[at:at+z-a]).hexdigest()==row['subject_sha256']

ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
def raw(a,n):o=pe.rva_offset(a-pe.image_base);return data[o:o+n]
assert struct.unpack('<4Q',raw(0x14730c050,32))==(10,11,12,13)
roman=[]
for i in range(11):
 pointer,count=struct.unpack('<QQ',raw(0x14730b528+i*16,16));roman.append(raw(pointer,count).decode()if count else '')
assert roman==['','I','II','III','IV','V','VI','VII','VIII','IX','X']
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def digest(x):return hashlib.sha256(json.dumps(x,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()).hexdigest()

class Probe(EquipmentProbe):
 def hook(self,uc,pc,size,unused):
  if pc==self.stop or any(a<=pc and pc+size<=z for a,z in self.ranges):return super().hook(uc,pc,size,unused)
  rcx,rdx,r8,r9=(self.reg(x)for x in ['RCX','RDX','R8','R9'])
  if pc==0x145cf998b:self.native.mem_write(rcx,bytes(self.native.mem_read(rdx,r8)));self.reg('RAX',rcx)
  elif pc==0x145cf9991:
   a,b=bytes(self.native.mem_read(rcx,r8)),bytes(self.native.mem_read(rdx,r8));self.reg('RAX',((a>b)-(a<b))&((1<<64)-1))
  elif pc==0x145ccc6e0:self.output(rcx,'fixture')
  elif pc==0x145895720:self.reg('RAX',0);self.reg('RDX',0)
  elif pc==0x1458956d0:self.output(rcx,'fixture')
  elif pc==0x140016b50:self.put(rcx,0,rdx,self.alloc(rdx*self.q(self.reg('RSP')+40)))
  elif pc==0x145cf99df:
   x=struct.unpack('<f',(self.reg('XMM0')&0xffffffff).to_bytes(4,'little'))[0]
   self.reg('XMM0',int.from_bytes(struct.pack('<f',math.copysign(math.floor(abs(x)+.5),x)),'little'))
  elif pc in [0x145e9bc80,0x145cf9da0,0x145d259f0,0x145cf9e40]:
   stride={0x145e9bc80:1,0x145d259f0:8,0x145cf9e40:24}.get(pc,self.q(self.reg('RSP')+40))
   count=self.q(rcx+16);capacity=max(1024,self.q(rcx)*2,count+(r8 if pc==0x145cf9da0 else 1));at=self.alloc(capacity*stride)
   if count:self.native.mem_write(at,bytes(self.native.mem_read(self.q(rcx+8),count*stride)))
   self.put(rcx,capacity,at)
  elif pc==0x145cccba0:self.output(rcx,self.pair(rdx+8))
  elif pc==0x1458c6d60:
   value=self.text(rcx,rdx)
   if value not in self.texts:self.texts.append(value)
   self.reg('RAX',0xf00000+self.texts.index(value))
  else:return super().hook(uc,pc,size,unused)
  self.calls[hex(pc)]=self.calls.get(hex(pc),0)+1
  sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))

ranges=[(a,ends[a])for a in [0x145825570,0x145824b20,0x145824850,
 0x1459a85c0,0x1459a8800,0x1459a8380,0x1459a7660,
 0x145978690,0x145978710,0x145978790,0x1458237f0,0x14581be10,
 0x145911450,0x1458ff8c0,0x1458d0b00,0x145990480,0x14599e480,0x14584a8c0]]
ranges += [(0x145827080,0x145827099),(0x145826bc0,0x145826bd9)]
p=Probe(data,pe,ranges);p.texts=[]
# Exact IAT identity supports the only float host seam.
a=0x145cf99df;thunk=raw(a,6);assert thunk[:2]==b'\xff\x25';iat=a+6+struct.unpack_from('<i',thunk,2)[0]
assert any(lib['functions'][(iat-int(lib['iat_start_address'],16))//8]=='roundf'
 for lib in pe.imports() if 0<=(iat-int(lib['iat_start_address'],16))//8<len(lib['functions']))
assets=ROOT/'crates/azeroth-survivors-re/assets'
gear=json.loads((assets/'armory.json').read_text());pvp=json.loads((assets/'pvp-gear-0.105.0.json').read_text())
rows=[dict(piece)for cls in gear['classes']+pvp['classes']for piece in cls['items']]
for cls in pvp['classes']:
 for row in cls['items']:
  if row.get('horde'):rows.append(dict(row,id=row['id']+10,display_id=row['horde']['display_id']))
delta={row['id']:row for row in json.loads((assets/'armory-catalog-delta-0.109.0.json').read_text())['pieces']}
for row in rows:row.update({k:v for k,v in delta.get(row['id'],{}).items() if k!='id'})
# Current source's two bounded catalog corrections, independently checked below.
for row in rows:
 if row['id']==104840:row['sheath']=1
for row in gear['starters']:
 if row['class']==3:row['slots'][15]=0
# ItemQuery also resolves known tabards and cosmetics even when not equipped.
# Their template definitions are kept distinct from true inventory instances.
extras=[]
for row in json.loads((assets/'rewards-catalogs-0.112.0.json').read_text())['tabards']:
 extras.append(dict(row,item_class=4,item_subclass=0,inventory_type=19,sheath=0,slot_id=18,expected_rarity=2 if row['zone'] else 1))
for row in json.loads((assets/'armory-cosmetics-0.112.0.json').read_text())['cosmetics']:
 extras.append(dict(row,item_class=4,item_subclass=0,sheath=0,slot_id=row['slot'],expected_rarity=1))
metadata=[];inventory={}
for row in rows+gear['starter_items']+extras:
 p.cursor=p.HEAP+0x1000;out=p.alloc(112);p.invoke(0x145825570,out,row['id']);assert p.q(out)!=2**64-1
 got=struct.unpack('<6I',p.native.mem_read(out+80,24));want=tuple(row[k]for k in ['id','display_id','item_class','item_subclass','inventory_type','sheath'])
 assert got==want,(row['id'],got,want)
 slot=p.native.mem_read(out+104,1)[0];assert slot==row['slot_id']
 if 'expected_rarity'in row:assert p.q(out+48)==row['expected_rarity'],(row['id'],p.q(out+48),row['expected_rarity'])
 count=p.q(out+40);effects=[struct.unpack('<II',p.native.mem_read(p.q(out+32)+i*8,8))for i in range(count)]
 if 'effects'in row:
  expected=[(v['tag'],int(v['value']) if v['tag']==11 else struct.unpack('<I',struct.pack('<f',v['value']))[0])for v in row['effects']]
  assert effects==expected,(row['id'],effects,expected)
 inventory[row['id']]=row['inventory_type']
 metadata.append(dict(id=row['id'],metadata=list(got),slot=slot,effects=effects,rarity=p.q(out+48)))
# The original Game true-item getter applies baseline + frozen gear, and no cosmetics.
baselines=[];truth=[]
class InventoryProbe(Probe):
 def hook(self,uc,pc,size,unused):
  if pc==0x145825570:
   out,id=self.reg('RCX'),self.reg('RDX');self.native.mem_write(out,bytes(112))
   if id in inventory:self.native.mem_write(out+96,struct.pack('<I',inventory[id]))
   else:self.put(out,2**64-1)
   sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp));return
  return super().hook(uc,pc,size,unused)
ip=InventoryProbe(data,pe,[r for r in ranges if r[0]!=0x145825570]);ip.texts=[]
for baseline in gear['starters']:
 ip.cursor=ip.HEAP+0x1000;out=ip.alloc(76);ip.invoke(0x145824850,out,baseline['race'],baseline['class']);got=list(struct.unpack('<19I',ip.native.mem_read(out,76)));
 assert got==baseline['slots'],(baseline['race'],baseline['class'],got,baseline['slots'])
 baselines.append(got)
 native_baseline=got[:]
 for saved in [[0]*19,[101050 if slot==0 and baseline['class']==1 else 0 for slot in range(19)],[101840 if slot==15 and baseline['class']==1 else 101900 if slot==16 and baseline['class']==1 else 0 for slot in range(19)]]:
  game=ip.alloc(0x600);ip.native.mem_write(game+0x31c,bytes([baseline['class'],baseline['race']]))
  ip.native.mem_write(game+0x2d0,struct.pack('<19I',*saved));ip.native.mem_write(game+0x4f4,bytes([255])*76)
  ip.invoke(0x145911450,out,game);got=list(struct.unpack('<19I',ip.native.mem_read(out,76)))
  want=native_baseline[:]
  for slot,id in enumerate(saved):
   if id:want[slot]=id+10 if baseline['race']in[2,5,6,8]and id%100==50 else id
  if inventory.get(want[15])==17:want[16]=0
  assert got==want,(baseline,saved,got,want)
  assert not any(got[slot]for slot in [1,10,11,12,13]);truth.append(dict(race=baseline['race'],class_id=baseline['class'],saved=saved,items=got))
# The actual class/rarity branches. No source formula is substituted in this replay.
armor_cases=[]
qprobe=Probe(data,pe,[(0x1458650f9,0x145865194),(0x145865719,0x14586572b),(0x1458658cf,0x145865916)])
for cls in [2,4]:
 for subtype in range(7):
  for rarity in range(6):
   frame=qprobe.alloc(0x400);qprobe.reg('RBP',frame);qprobe.reg('R13',rarity);qprobe.reg('RSI',101000)
   qprobe.native.mem_write(frame+0x2d0,struct.pack('<I',cls));qprobe.native.mem_write(frame+0x2c0,struct.pack('<I',subtype));qprobe.stop=0x145865916
   qprobe.reg('RSP',qprobe.STACK+0x1f0008);qprobe.native.emu_start(0x1458650f9,qprobe.stop,count=10000)
   quality=struct.unpack('<I',qprobe.native.mem_read(frame+0x2b0,4))[0];armor=qprobe.reg('RAX')&0xffffffff
   expected_q=4 if rarity==5 or (rarity==4 and cls!=2) else rarity+1
   scale=[1,1.7,2.5,3.5,4.6,4][rarity];expected_a=0 if cls!=4 else int(f32(300*f32(scale))) if subtype==6 else int(f32(f32([0,6,12,22,40][min(subtype,4)]*f32(scale))*4))
   assert(quality,armor)==(expected_q,expected_a),(cls,subtype,rarity,quality,armor,expected_q,expected_a)
   armor_cases.append([cls,subtype,rarity,quality,armor])
# The exact current icon table and actual ASCII-insensitive matcher, including missing.
icon_rows=[]
for i in range(51):
 at=0x14700f860+i*24;ptr,n,value=struct.unpack('<QQI4x',raw(at,24));name=raw(ptr,n).decode();icon_rows.append(dict(icon=name,display_id=value))
 for query in [name,name.lower(),name.swapcase()]:
  arg=p.alloc(len(query));p.native.mem_write(arg,query.encode());p.invoke(0x14584a8c0,arg,len(query));assert p.reg('RAX')==value
assert icon_rows==json.loads((assets/'inventory-icons-0.113.2.json').read_text())['rows']
arg=p.alloc(7);p.native.mem_write(arg,b'missing');p.invoke(0x14584a8c0,arg,7);assert p.reg('RAX')==0
# Full ItemInfo serialization runs with explicit fixture-owned names and lines.
# Input88-byte structure: name ptr/len0/8, lines ptr/count16/24, flavor
# ptr/len32/40, then entry/class/subclass/display/quality/inventory/sheath/
# armor/health/reserved at48/52/56/60/64/68/72/76/80/84.
def packet_case(lines,health=23,flavor_text='Flavor'):
 p.cursor=p.HEAP+0x1000;info=p.alloc(88);name=p.alloc(5);p.native.mem_write(name,b'Hello');p.put(info,name,5)
 vec=p.alloc(max(1,len(lines))*24)
 for i,line in enumerate(lines):p.output(vec+i*24,line)
 p.put(info+16,vec,len(lines));flavor=p.alloc(max(1,len(flavor_text)));p.native.mem_write(flavor,flavor_text.encode());p.put(info+32,flavor,len(flavor_text))
 p.native.mem_write(info+48,struct.pack('<8IiI',101000,4,0,30000,1,1,3,44,health,0));out=p.alloc(32);p.invoke(0x1458d0b00,out,info)
 return bytes(p.native.mem_read(p.q(out+8),p.q(out+16)))

def decode_packet(blob):
 offset=0
 def scalar(kind='I'):
  nonlocal offset
  value=struct.unpack_from('<'+kind,blob,offset)[0];offset+=4;return value
 def string():
  nonlocal offset
  end=blob.index(0,offset);value=blob[offset:end].decode();offset=end+1;return value
 result=dict(entry=scalar(),class_id=scalar(),subclass=scalar(),name=string())
 assert [string()for _ in range(3)]==['','','']
 for key in ['display_info_id','quality','flags','buy_price','sell_price','inventory_type','allowable_class','allowable_race','item_level','required_level','required_skill','required_skill_rank','required_spell','required_honor_rank','required_city_rank','required_rep_faction','required_rep_rank','max_count','stackable','container_slots']:
  result[key]=scalar('i' if key in ['allowable_class','allowable_race'] else 'I')
 stats=[(scalar(),scalar('i'))for _ in range(10)];result['stats']=[list(row)for row in stats if row!=(0,0)]
 damage=[dict(min=scalar('f'),max=scalar('f'),school=scalar())for _ in range(5)]
 result.update(dmg_min=damage[0]['min'],dmg_max=damage[0]['max'],dmg_type=damage[0]['school'],damages=[row for row in damage if row['max']>0])
 result.update(armor=scalar(),resistances=[scalar('i')for _ in range(6)],delay_ms=scalar(),ammo_type=scalar(),ranged_mod_range=scalar('f'))
 spells=[];raw_spells=[]
 for index in range(5):
  spell=dict(index=index,spell_id=scalar(),trigger=scalar(),charges=scalar('i'),cooldown_ms=scalar('i'),category=scalar(),category_cooldown_ms=scalar('i'))
  raw_spells.append(spell)
  if spell['spell_id']:spells.append(spell)
 result.update(spells=spells,spell_charges_0=raw_spells[0]['charges'],use_spell=next((dict(spell_id=row['spell_id'],cooldown_ms=row['cooldown_ms'],category=row['category'],category_cooldown_ms=row['category_cooldown_ms'])for row in spells if row['trigger']==0),None))
 result.update(bonding=scalar(),description=string())
 for key in ['page_text','language_id','page_material','start_quest','lock_id','material','sheath','random_property','block','item_set','max_durability','area','map','bag_family']:result[key]=scalar()
 assert offset==len(blob),(offset,len(blob))
 # Empty native spell slots still carry -1 cooldown defaults; parser omits them.
 for row in raw_spells[len(spells):]:
  assert row==dict(index=row['index'],spell_id=0,trigger=0,charges=0,cooldown_ms=-1,category=0,category_cooldown_ms=-1)
 return result

packets=[]
for lines,health,flavor in [([],0,''),([],23,'Flavor'),(['same'],23,'Flavor'),(['same'],23,'Flavor'),(['one','two','three','four','five','six'],0,'Flavor')]:
 blob=packet_case(lines,health,flavor);actual=decode_packet(blob)
 expected=dict(entry=101000,class_id=4,subclass=0,name='Hello',display_info_id=30000,quality=1,
  flags=0,buy_price=0,sell_price=0,inventory_type=1,allowable_class=-1,allowable_race=-1,
  item_level=60,required_level=0,required_skill=0,required_skill_rank=0,required_spell=0,
  required_honor_rank=0,required_city_rank=0,required_rep_faction=0,required_rep_rank=0,
  max_count=0,stackable=1,container_slots=0,stats=[[1,health]],damages=[],dmg_min=0.,dmg_max=0.,dmg_type=0,
  armor=44,resistances=[0]*6,delay_ms=2000,ammo_type=0,ranged_mod_range=0.,spells=[],spell_charges_0=0,
  use_spell=None,bonding=int(bool(lines)),description=flavor,page_text=0,language_id=0,page_material=0,
  start_quest=0,lock_id=0,material=0,sheath=3,random_property=0,block=0,item_set=0,max_durability=0,
  area=0,map=0,bag_family=0)
 joined=lines[:4]+(['\nEquip: '.join(lines[4:])]if len(lines)>4 else [])
 for index,line in enumerate(joined):
  expected['spells'].append(dict(index=index,spell_id=0xf00000+p.texts.index(line),trigger=1,charges=0,cooldown_ms=-1,category=0,category_cooldown_ms=-1))
 assert actual==expected,(lines,actual,expected)
 packets.append(dict(lines=lines,health=health,flavor=flavor,decoded=actual,payload_hex=blob.hex(),sha256=hashlib.sha256(blob).hexdigest()))
assert packets[2]['payload_hex']==packets[3]['payload_hex']
# Native dynamic entry arithmetic and process-lifetime tooltip interning.
counter=Probe(data,pe,[(0x145970ae0,0x145970b09)]);counter_cases=[]
for value in [0,1,2,99_999_999,100_000_000,100_000_001,2**31,2**32-1]:
 counter.native.mem_write(0x1481ed0d8,struct.pack('<I',value));counter.stop=0x145970b09
 counter.native.emu_start(0x145970ae0,counter.stop,count=100)
 entry=counter.reg('RDI')&0xffffffff;assert entry==900_000+value%100_000_000
 assert struct.unpack('<I',counter.native.mem_read(0x1481ed0d8,4))[0]==(value+1)%2**32
 counter_cases.append([value,entry])
registry=Probe(data,pe,[(0x1458c6d60,0x1458c6f62)]);registry.texts=[]
tls=registry.alloc(8);registry.put(0x1481ea9f8,tls)
text_cases=[]
for text in ['first','second','first','','line1\nline2','second','é','first']:
 pointer=registry.alloc(len(text.encode())+1);registry.native.mem_write(pointer,text.encode())
 registry.invoke(0x1458c6d60,pointer,len(text.encode()));spell=registry.reg('RAX')
 if text not in registry.texts:registry.texts.append(text)
 assert spell==0xf00000+registry.texts.index(text)
 text_cases.append([text,spell])
# Native dynamic row identity ignores entry, display and inventory type. Equal
# rows take the clone-old branch; changed slot/name/quality/text take allocate.
class EqualProbe(Probe):
 def hook(self,uc,pc,size,unused):
  if pc in [0x145970968,0x145970ae0]:self.native.emu_stop();return
  return super().hook(uc,pc,size,unused)
equal_probe=EqualProbe(data,pe,[(0x145970891,0x145970968)]);identity_cases=[]
def dynamic(at,slot=10,name='Band',quality=2,lines=('effect',),display=9835,inventory_type=11,entry=900000):
 equal_probe.output(at,name);vec=equal_probe.alloc(max(24,len(lines)*24))
 for i,line in enumerate(lines):equal_probe.output(vec+i*24,line)
 equal_probe.put(at+24,len(lines),vec,len(lines));equal_probe.put(at+48,slot)
 equal_probe.native.mem_write(at+56,struct.pack('<4I',entry,quality,inventory_type,display))
for changes,retains in [({},True),({'display':12345},True),({'inventory_type':12},True),({'entry':900999},True),
 ({'slot':11},False),({'name':'Other'},False),({'quality':3},False),({'lines':('changed',)},False),({'lines':('effect','extra')},False)]:
 frame=equal_probe.alloc(0x500)+0x40;old=equal_probe.alloc(72);dynamic(old);dynamic(frame-0x30,**changes)
 equal_probe.put(frame+0x290,old);equal_probe.put(frame+0x2b8,old+72)
 equal_probe.reg('RBP',frame);equal_probe.reg('RSP',equal_probe.STACK+0x1f0008)
 equal_probe.native.emu_start(0x145970891,0,count=10000)
 actual=equal_probe.reg('RIP')==0x145970968;assert actual==retains,(changes,actual)
 identity_cases.append(dict(changes=changes,retains_previous=actual))
# Actual health conversion uses roundf per native tag2 row, then wrapping ADD.
health_probe=Probe(data,pe,[(0x14586591c,0x145865a04)]);health_cases=[]
for values in [[],[.49],[.5],[1.5,2.5],[1.4,1.6],[-.5,2.5],[2147483520.,2147483520.]]:
 frame=health_probe.alloc(0x400);array=health_probe.alloc(max(8,len(values)*8))
 for i,value in enumerate(values):health_probe.native.mem_write(array+i*8,struct.pack('<If',2,value))
 health_probe.native.mem_write(frame+0x2a0,struct.pack('<Q',len(values)))
 for name,value in [('RBP',frame),('R15',array),('R14',0),('RDI',0),('RAX',0),('RSP',health_probe.STACK+0x1f0008)]:health_probe.reg(name,value)
 health_probe.stop=0x145865a04;health_probe.native.emu_start(0x14586591c,health_probe.stop,count=10000)
 actual=health_probe.reg('RDI')&0xffffffff;expected=sum(int(math.copysign(math.floor(abs(v)+.5),v))for v in values)%2**32
 # The odd trailing row adds EDI to EAX; paired rows already accumulated EDI.
 if len(values)%2:actual=health_probe.reg('RAX')&0xffffffff
 assert actual==expected,(values,actual,expected);health_cases.append([values,actual])

# Trace the actual connected consumers; authored Rust regressions remain unrun.
source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/client/inventory.rs').read_text()
for fragment in ['session.starting_gear','486 + u16::from(slot) * 2','std::mem::take(&mut queries.0)','SessionEvent::ItemCreate','SessionEvent::ItemTemplate','events::flush_events(world)','effect.value.round() as i32','wrapping_add','self.lines[4..].join("\\nEquip: ")']:
 assert fragment in source,fragment
assert 'GearSave::outfit' not in source and 'menu.backend_save' not in source
# Compare every source ItemInfo initializer field to the decoded native model.
# This is source tracing, not execution of the Rust implementation.
body=source.split('        ItemInfo {',1)[1].split('\n        }',1)[0]
fields={};stack=[];start=0
for offset,char in enumerate(body):
 if char in '([{':stack.append(char)
 elif char in ')]}':stack.pop()
 elif char==','and not stack:
  part=body[start:offset].strip();start=offset+1
  key,value=part.split(':',1)if ':'in part else (part,part)
  fields[key.strip()]=''.join(value.split())
model={key:value for key,value in packets[0]['decoded'].items()if key!='entry'}
model['class']=model.pop('class_id')
dynamic_fields=dict(class_='self.class',subclass='self.subclass',name='self.name.clone()',
 display_info_id='self.display',quality='self.quality',inventory_type='self.inventory_type',
 armor='self.armor',sheath='self.sheath',description='self.flavor.clone()',
 stats='vec![(1,self.health)]',spells='spells',damages='Vec::new()',resistances='[0;6]',
 bonding='u32::from(!self.lines.is_empty())',use_spell='None')
dynamic_fields['class']=dynamic_fields.pop('class_')
expected_fields={key:dynamic_fields.get(key,str(value))for key,value in model.items()}
assert fields==expected_fields,(fields,expected_fields)


connections={
 'crates/benilla-app/src/local_client/requests.rs':['pub struct LocalItemQueries','items.0.push((entry, guid))','items.0.clear()','add_systems(PostUpdate, collect)'],
 'crates/benilla-app/src/local_client.rs':['item_descriptions::install(app)','LocalItemQueries'],
 'crates/azeroth-survivors-re/src/gameplay/client.rs':['inventory::install(app)'],
 'crates/benilla-app/src/local_client/item_descriptions.rs':['publish.before(super::events::LocalPresentationDispatch)','insert_tooltip_description','spells.is_added()'],
 'crates/benilla-formats/src/spells/mod.rs':['pub fn insert_tooltip_description','description: Some(text)'],
 'crates/benilla-app/src/net/objects.rs':['SessionEvent::ItemTemplate { entry, info }','sc.items.insert_template(entry, info)'],
 'crates/benilla-app/src/ui_char.rs':['inv.changes.moved()','items.template_epoch()','feed.vm.get_reset(script)'],
 'crates/benilla-app/src/items.rs':['pub(crate) fn clear_session','keep the templates'],
 'crates/azeroth-survivors-re/src/loot_rewards/prose.rs':['Percent(f32)','pub fn render_with_percent','Self::Percent(value) => percent(*value)'],
}
for path,fragments in connections.items():
 content=(ROOT/path).read_text()
 for fragment in fragments:assert fragment in content,(path,fragment)
assert '*item = previous.clone();'in source and 'previous.display == item.display'not in source
armory=(ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text()
assert 'if starter.class == 3 { starter.slots[15] = 0; }' in armory and 'piece.sheath = 1;' in armory
record=dict(target_sha256=SHA,native_instructions_executed=True,application_executed=False,rebuilt_code_executed=False,
 metadata_cases=len(metadata),metadata_sha256=digest(metadata),baseline_cases=len(baselines),true_item_cases=len(truth),true_items_sha256=digest(truth),
 quality_armor_cases=armor_cases,health_cases=health_cases,entry_counter_cases=counter_cases,text_registry_cases=text_cases,dynamic_identity_cases=identity_cases,icon_rows=icon_rows,packets=packets,
 branch_ranges=[dict(address=hex(a),end_exclusive=hex(z),sha256=hashlib.sha256(raw(a,z-a)).hexdigest())for a,z in qprobe.ranges+counter.ranges+registry.ranges+equal_probe.ranges+health_probe.ranges],
 ranges=[dict(address=hex(a),end_exclusive=hex(z),sha256=hashlib.sha256(raw(a,z-a)).hexdigest())for a,z in ranges],
 limits=['Numeric descriptor replay supplies fixed formatter/locale results; it verifies metadata/effects, not localized naming/prose.',
 'True-item getter replays actual baseline, frozen equipment, faction mapping and two-hand clearing with a validated descriptor inventory-type seam.',
 'Complete ItemInfo serializer uses actual native instructions; cloning/allocation/byte operations and synthetic-text registration are explicit seams.',
 'No compiler, rebuilt Rust, Lua VM, renderer, game or original/rebuilt comparison executes.'])
record=json.loads(json.dumps(record))
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
if args.write:OUT.mkdir(parents=True,exist_ok=True);(OUT/'cases.json').write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads((OUT/'cases.json').read_text())==record
print(f'Passed {len(metadata)} current descriptors, {len(truth)} true-item getters, {len(armor_cases)} quality/armor branches, 154 display lookups and five fully decoded ItemInfo serializations; no compiler/game.')

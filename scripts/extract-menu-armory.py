#!/usr/bin/env python3
"""Reconstruct the selected 0.92 gear catalog from native tables and consumers."""
from portable_paths import objdump_output, portable_json
import hashlib, importlib.util, json, math, struct, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parent.parent
SHA='47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'
def main():
 s=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m)
 data=(ROOT/'AzerothSurvivors/AzerothSurvivors.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA;p=m.PE(data)
 labels=json.loads((ROOT/'docs/analysis/evidence/embedded-english-comparison.json').read_text())
 menu=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())
 def off(va):return p.rva_offset(va-p.image_base)
 def u64(va):return struct.unpack_from('<Q',data,off(va))[0]
 def string(va):
  a,n=struct.unpack_from('<QQ',data,off(va));assert 0<n<1000;return data[off(a):off(a)+n].decode()
 def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
 def effects(va,n):return [list(struct.unpack_from('<If',data,off(va)+j*8))for j in range(n)]
 base=list(struct.unpack_from('<5f',data,off(0x146ab2ff0)))
 extra=list(struct.unpack_from('<5f',data,off(0x146ab3058)))
 scale=struct.unpack_from('<f',data,off(0x1458a8588))[0]
 def scaled(rows,factor):return [[tag,float(math.floor(f32(value*factor)+.5)) if tag==2 else f32(value*factor)]for tag,value in rows]
 def merge(rows):
  out={}
  for tag,value in rows:out[tag]=f32(out.get(tag,0)+value)
  return [dict(tag=tag,value=value)for tag,value in out.items()]
 armor_effects=[effects(a,n)for a,n in [(0x1466cd0ac,2),(0x1466cd0bc,2),(0x1466cd0cc,2),(0x1466cd0dc,2),(0x1466cd0ec,2),(0x1466cd0fc,1),(0x1466cd104,1),(0x1466cd10c,3)]]
 extra_effects=[effects(0x1466cd124+j*16,2)for j in range(8)]
 classes=[];records=[]
 for index,cid in enumerate([1,2,3,4,5,7,8,9,11]):
  at=0x1466cc590+index*304;mat,stored=struct.unpack_from('<BB',data,off(at)+296);assert stored==cid
  material=['','Cloth','Leather','Mail','Plate'][mat];sets=[string(at+j*24)for j in range(5)];grammar=[u64(at+j*24+16)for j in range(5)]
  weapons=u64(at+120);weapon_count=u64(at+128);assert weapon_count in [1,2]
  key=menu['classes'][index]['key'];items=[]
  for rarity in range(5):
   for slot in range(8+weapon_count):
    number=100000+cid*1000+slot*100+rarity*10
    rows=[]
    if slot<8:
     noun=labels[f'noun.{material.lower()}.{slot}'];name=labels['item.name_of' if grammar[rarity] else 'item.name_prefix'].replace('{noun}',noun).replace('{set}',sets[rarity])
     display=struct.unpack_from('<I',data,off(at)+136+rarity*32+slot*4)[0]
     if not display:
      for earlier in range(rarity,-1,-1):
       display=struct.unpack_from('<I',data,off(at)+136+earlier*32+slot*4)[0]
       if display:break
     rows=scaled(armor_effects[slot],f32(scale*base[rarity]))
     item_material=material
     item_class=4;item_subclass=mat;inventory_type=[1,3,20 if mat==1 and slot==2 else 5,6,7,8,9,10][slot];sheath=0;slot_id=[0,2,4,5,6,7,8,9][slot]
    else:
     w=weapons+(slot-8)*144;name=string(w+8+rarity*16);display=struct.unpack_from('<I',data,off(w)+120+rarity*4)[0]
     rows=scaled(effects(u64(w+88),u64(w+96)),f32(scale*base[rarity]));item_material=''
     item_class,item_subclass,inventory_type,sheath=struct.unpack_from('<4I',data,off(w)+104)
     if rarity==4 and data[off(w)]:item_subclass=struct.unpack_from('<I',data,off(w)+4)[0]
     slot_id=data[off(w)+140]
    if rarity:
     flavor_index=(cid*3+slot)%8
     rows+=scaled(extra_effects[flavor_index],f32(scale*extra[rarity]))
     if rarity==4:rows.append([11 if slot>=8 else 12,1.0 if slot>=8 else struct.unpack('<f',bytes.fromhex('31082c3d'))[0]])
     if rarity<3:
      va,n=[(0x1466cb89c,52),(0x1466cb8d0,35),(0x1466cb8f3,49),(0x1466cb924,44),(0x1466cb950,41),(0x1466cb979,47),(0x1466cb9a8,40),(0x1466cb9d0,49)][flavor_index];flavor=data[off(va):off(va)+n].decode()
     else:
      a=u64(0x1466d8f48+flavor_index*176+(cid-1)*8);n=u64(0x1466d8fa0+flavor_index*176+(cid-1)*8);flavor=data[off(a):off(a)+n].decode()
    else:flavor=''
    items.append(dict(id=number,slot=slot,rarity=rarity,name=name,material=item_material,display_id=display,item_class=item_class,item_subclass=item_subclass,inventory_type=inventory_type,sheath=sheath,slot_id=slot_id,effects=merge(rows),flavor=flavor))
  classes.append(dict(id=cid,key=key,material=material,items=items));records.append(dict(class_id=cid,va=hex(at),sha256=hashlib.sha256(data[off(at):off(at)+304]).hexdigest(),weapon_count=weapon_count))
 rates=struct.unpack_from('<5f',data,off(0x1466c95d0));tiers=list(struct.unpack_from('<9Q',data,off(0x1466c8c20)))
 zones=[]
 for z,zone in enumerate(menu['zones']):
  tier=tiers[z];same=[i for i,t in enumerate(tiers)if t==tier];rank=same.index(z)
  bosses=[]
  for b,boss in enumerate(zone['bosses']):
   slots=list(range(8,10))if b==4 else [slot for slot in range(8)if slot%(4*len(same))==rank*4+b]
   bosses.append(dict(name=boss['name'],minute=boss['minute'],slots=slots,final_boss=b==4))
  zones.append(dict(key=zone['key'],name=zone['name'],tier=tier,drop_percent=round(rates[tier]*100),bosses=bosses))
 # The native starter getter selects a race table, then a class-indexed Rust Vec.
 starter_items=[]
 slot_lookup=data[off(0x1466d9928):off(0x1466d9928)+23]
 for at in range(0x1466c9970,0x1466ca3c0,40):
  ptr,n,item_id,display_id,inventory_type,item_class,item_subclass,sheath=struct.unpack_from('<QQ6I',data,off(at))
  slot_id=slot_lookup[inventory_type-1] if 1<=inventory_type<=23 else 17
  starter_items.append(dict(id=item_id,name=data[off(ptr):off(ptr)+n].decode(),display_id=display_id,inventory_type=inventory_type,item_class=item_class,item_subclass=item_subclass,sheath=sheath,slot_id=slot_id))
 starters=[]
 race_tables=[0x1466d98d0,0x1466d9668,0x1466d96c0,0x1466d9718,0x1466d9770,0x1466d97c8,0x1466d9820,0x1466d9878]
 item_map={item['id']:item for item in starter_items}
 for race,table in enumerate(race_tables,1):
  for cid in [1,2,3,4,5,7,8,9,11]:
   vector=u64(table+(cid-1)*8);ptr=u64(vector+8);n=u64(vector+16);assert n<=19
   slots=[0]*19
   for j in range(n):
    item_id=struct.unpack_from('<I',data,off(ptr)+j*4)[0];item=item_map[item_id];slots[item['slot_id']]=item_id
   starters.append(dict(race=race,**{'class':cid},slots=slots))
 result=dict(version='0.92.0',classes=classes,zones=zones,starter_items=starter_items,starters=starters)
 (ROOT/'crates/azeroth-survivors-re/assets/armory.json').write_text(portable_json(result,indent=2,ensure_ascii=False)+'\n')
 output=ROOT/'docs/analysis/evidence/armory';output.mkdir(parents=True,exist_ok=True)
 ranges=[('starter-getter',0x1453df460,0x1453df6fa),('starter-item-reader',0x1453df730,0x1453dfc94),('outfit-merge',0x1453dfcf0,0x1453dff31),('gear-reader',0x1453e0030,0x1453e0f88),('gear-drops',0x1453de990,0x1453ded3e),('armor-effect-scaling',0x1454f0c40,0x1454f0e31),('weapon-effect-scaling',0x1454f0e80,0x1454f1071),('extra-effect-scaling',0x1454f10c0,0x1454f12b1)]
 for label,a,b in ranges:
  text=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}','AzerothSurvivors/AzerothSurvivors.exe'],cwd=ROOT,text=True);(output/(label+'.asm')).write_text(text)
 (output/'catalog-provenance.json').write_text(portable_json(dict(sha256=SHA,version='0.92.0',class_records=records,class_record_stride=304,weapon_record_stride=144,starter_record_va='0x1466c9970',starter_record_stride=40,starter_record_count=len(starter_items),starter_race_tables=[hex(a)for a in race_tables],starter_slot_lookup=list(slot_lookup),base_scale=base,extra_scale=extra,item_scale=scale,armor_effects=armor_effects,extra_effects=extra_effects,zone_tiers=tiers,drop_rates=rates,method='PE pointer reads plus native item-id decoding/effect scaling/drop consumers; runtime checked common/uncommon Warrior head and 0/45 and2/45 collection counts.',limitations=['All415syntheticpieces reconstructed; gameplay item acquisition is outside menu scope.','Native stat text formatter, fallback display lookup across rarity, flavor and drop distribution are reconstructed from consumers; only bounded examples checked in original UI.']),indent=2)+'\n')
 print('Recovered',sum(len(c['items'])for c in classes),'gear pieces,',len(zones),'drop tables')
if __name__=='__main__':main()

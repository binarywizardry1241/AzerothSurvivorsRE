#!/usr/bin/env python3
"""Extract Codex text with exact0.92 native formatters and all10 SHA-bound locale maps.

No target OS calls are reachable: reuses the reviewed bounded emulator primitives from
extract-menu-codex.py. Output contains text only; it does not alter140 structural records.
"""
from pathlib import Path
import json,struct,hashlib

ROOT=Path(__file__).resolve().parents[1]
source=(ROOT/'scripts/extract-menu-codex.py').read_text().split('\nrows=[]\n',1)[0]
source=source.replace("elif a==0x14541f030:\n  u.reg_write(UC_X86_REG_RAX,rcx);u.reg_write(UC_X86_REG_RDX,rdx) # reviewed native English fallback\n elif a==0x14541f0e0:u.reg_write(UC_X86_REG_RAX,0) # No active locale overrides; native English fallback.", "elif a in [0x14541f030,0x14541f0e0]:localize(a,rcx,rdx)")
assert 'localize(a,rcx,rdx)' in source
exec(compile(source,str(ROOT/'scripts/extract-menu-codex.py'),'exec'))
allowed += [(0x145405d80,0x145405e14),(0x145408150,0x1454081e4)]
locale={};lookup_keys=set()
def localize(address,ptr,length):
 key=st(ptr,length);lookup_keys.add(key);value=locale.get(key)
 if value is None:
  u.reg_write(UC_X86_REG_RAX,ptr if address==0x14541f030 else 0)
  u.reg_write(UC_X86_REG_RDX,length)
 else:
  data=value.encode();where=alloc(len(data)+1);u.mem_write(where,data)
  u.reg_write(UC_X86_REG_RAX,where);u.reg_write(UC_X86_REG_RDX,len(data))
def translated(template,**values):
 lookup_keys.add(template)
 result=locale.get(template,template)
 for key,value in values.items():result=result.replace('{'+key+'}',str(value))
 return result

def description(record,value):
 output=alloc(24)
 u.reg_write(UC_X86_REG_XMM2,int.from_bytes(struct.pack('<f',value)+bytes(12),'little'))
 invoke(0x145405ab0,output,record)
 return pair(output+8)

entries=json.loads((ROOT/'crates/azeroth-survivors-re/assets/codex.json').read_text())['entries']
structural=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())
ability_index={entry['key']:i for i,entry in enumerate(structural['abilities'])}
jewels={pair(0x1466dd368+i*72):0x1466dd368+i*72 for i in range(22)}
amulets={pair(0x1466de600+i*80):0x1466de600+i*80 for i in range(17)}
results={};locale_provenance=[]
for code in ['en','pl','de','pt','es','fr','tr','ru','zh','ko']:
 path=ROOT/f'crates/azeroth-survivors-re/assets/locales/{code}.json'
 locale=json.loads(path.read_text());lookup_keys=set();localized={}
 for item in entries:
  next_heap=HEAP+0x1000;current=item['key'];row={}
  if item['group']=='legendary':
   out=alloc(112);invoke(0x145406780,out,0x1466d5b20+ability_index[item['spell']]*120)
   row['name']=pair(out+32).split(':',1)[0]
   # Constructor already localized the name; Details drops the spell suffix only.
   row['descriptions']=describe(q(out+56),q(out+64))
  elif item['group']=='amulets':
   at=amulets[item['key']];invoke(0x145408150,at)
   row['name']=st(reg(UC_X86_REG_RAX),reg(UC_X86_REG_RDX))
   row['descriptions']=describe(q(at+48),q(at+56))
  else:
   at=jewels[item['key']];invoke(0x145405d80,at)
   row['name']=st(reg(UC_X86_REG_RAX),reg(UC_X86_REG_RDX))
   none=alloc(16);row['descriptions']=[]
   for quality in range(5):
    invoke(0x145405940,at,quality,none)
    value=struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
    row['descriptions'].append(description(at,value))
   invoke(0x140322980,at);row['tag_label']=st(reg(UC_X86_REG_RAX),reg(UC_X86_REG_RDX))
   tag=u.mem_read(at+68,1)[0]
   if tag<=15 and ((0x9b>>tag)&1):row['growth']=translated("Picked again, it grows by nearly the pick's whole worth every time.")
   elif tag==15:
    lives=struct.unpack('<I',u.mem_read(q(0x1458f5aa0+16),4))[0]
    row['growth']=translated("Picked again, it refills its lives; it holds {n} at most.",n=lives)
   else:
    if tag<=18 and ((0x19b>>tag)&1):cap=struct.unpack('<f',u.mem_read(0x1458f2d18+(4 if tag==8 else 0),4))[0]
    else:
     factor=0x1458a85b0 if tag<=18 and ((0x24064>>tag)&1) else 0x1458b9aa0
     cap=struct.unpack('<f',u.mem_read(at+64,4))[0]*struct.unpack('<f',u.mem_read(factor,4))[0]
    ceiling=description(at,cap)
    template="Picked again, it grows toward {ceiling}, each pick less as it nears it." if tag==8 else "Picked again, it grows by nearly the pick's whole worth, up to {ceiling}."
    row['growth']=translated(template,ceiling=ceiling)
  if code=='en':
   for field in ['name','descriptions','tag_label','growth']:
    if field in row:assert row[field]==item[field],(current,field,row[field],item[field])
  localized[item['key']]=row
 results[code]=localized
 locale_provenance.append(dict(code=code,path=str(path.relative_to(ROOT)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),entries=len(localized),lookup_keys=sorted(lookup_keys)))
 print(f'{code}:140native Codex text records')
output=ROOT/'crates/azeroth-survivors-re/assets/codex-locales.json'
output.write_text(json.dumps(results,ensure_ascii=False,indent=2)+'\n')
manifest=dict(version='0.92.0',target_sha256=SHA,method='Exact same bounded native item/effect/rarity formatters as catalog extraction, with native locale lookup14541f0e0 and fallback14541f030 bound to each10 extracted target catalogs. Explicit native footer branch applies localized native template to native formatted ceiling.',output=str(output.relative_to(ROOT)),output_sha256=hashlib.sha256(output.read_bytes()).hexdigest(),locales=locale_provenance,english_match='All English names/descriptions/tag labels/growth match the140-entry structural catalog byte-for-byte.',limitations=['Reference-runtime non-English text comparison and rebuilt language-switch checks pending.','Only Codex descriptions/names/stat labels/growth are covered; other menu literal bindings are independent.'])
(ROOT/'docs/analysis/evidence/0.92/codex/localized-text-provenance.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')

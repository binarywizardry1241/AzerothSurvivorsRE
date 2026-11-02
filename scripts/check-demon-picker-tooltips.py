#!/usr/bin/env python3
"""Check current AZS demon picker text with original gamemode instructions.

Uses existing bounded equipment String/locale/format services. No compiler,
client, game, filesystem operation or inherited engine implementation runs.
--collect writes candidate evidence beneath ignored runtime only.
"""
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse, hashlib, json, math, struct, sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe

SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
ASSETS=ROOT/'crates/azeroth-survivors-re/assets'
OUT=ROOT/'docs/analysis/evidence/0.112.0/demon-picker-tooltips'
WORK=ROOT/'runtime/menu-page-dependencies-0.112.0/demon-picker-curated'
KEYS=['corruption','immolate','curse_of_agony','hellfire','death_coil','drain_life','demonic_empowerment']
RANGES=[(0x140040d90,0x14004127b),(0x1458994a0,0x145899537),
        (0x14593a1d0,0x14593a294),(0x14597a5d0,0x14597a66f),
        (0x145993690,0x145993695),(0x14597a670,0x14597d86c),
        (0x145980560,0x1459806b7),(0x145897400,0x145897494),
        (0x14598dd80,0x14598ddc5),(0x145988650,0x14598879d)]

class Probe(EquipmentProbe):
    def hook(self,u,pc,size,unused):
        if pc==0x145c0a3e7:
            c,d,count=(self.reg(x)for x in ['RCX','RDX','R8'])
            left,right=bytes(self.native.mem_read(c,count)),bytes(self.native.mem_read(d,count))
            self.reg('RAX',((left>right)-(left<right))&((1<<64)-1))
        elif pc in [0x1400021f0,0x1401aa700,0x145c0d470]:
            c,d,r8,r9=(self.reg(x)for x in ['RCX','RDX','R8','R9'])
            if pc==0x1400021f0:self.reg('RAX',self.alloc(c))
            elif pc==0x1401aa700:
                width=self.q(self.reg('RSP')+40);count=d*width
                assert count<0x100000
                self.put(c,0,d if count else 0,self.alloc(count)if count else r9)
            else:
                width=self.q(self.reg('RSP')+40);cap,ptr,length=[self.q(c+i*8)for i in range(3)]
                assert width==r9==1
                newcap=max(cap*2,length+r8,8);at=self.alloc(newcap)
                self.native.mem_write(at,bytes(self.native.mem_read(ptr,length)));self.put(c,newcap,at,length)
        elif pc in [0x145c0a40b,0x145c0a41d]:
            value=struct.unpack('<f',self.reg('XMM0').to_bytes(16,'little')[:4])[0]
            value=math.trunc(value)if pc==0x145c0a40b else math.copysign(math.floor(abs(value)+.5),value)
            self.reg('XMM0',int.from_bytes(struct.pack('<f',value),'little'))
        else:
            super().hook(u,pc,size,unused);return
        self.calls[hex(pc)]=self.calls.get(hex(pc),0)+1
        sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))

def module(name,path):
    value = load_script(name, path);return value

def digest(value):
    return _shared_digest(value)

def render(expression,locale):
    if 'literal'in expression:return expression['literal']
    if 'concat'in expression:return ''.join(render(value,locale)for value in expression['concat'])
    text=locale.get(expression['template'],expression['template'])
    for key,value in expression['values'].items():text=text.replace('{'+key+'}',render(value,locale))
    return text

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--collect',action='store_true');args=parser.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target);pe=module('demon_picker_pe',ROOT/'scripts/inventory-executable.py').PE(data)
    def raw(a,n):offset=pe.rva_offset(a-pe.image_base);assert offset is not None;return data[offset:offset+n]
    def pair(a):return struct.unpack('<QQ',raw(a,16))
    def text(a):pointer,count=pair(a);return raw(pointer,count).decode()
    def span(a,n):return dict(address=hex(a),byte_count=n,sha256=digest(raw(a,n)))
    locales=module('demon_picker_locales',ROOT/'scripts/recover-codex.py').embedded_locales(data,pe)
    base=json.loads((ASSETS/'ability-tooltips.json').read_text())
    delta=json.loads((ASSETS/'ability-tooltip-delta-0.112.0.json').read_text());assert delta['target_sha256']==SHA
    assert list(delta['entries'])==['demonic_empowerment'];base.update(delta['entries'])
    abilities={text(0x146bf5eb0+i*120):0x146bf5eb0+i*120 for i in range(113)}
    class_at=0x146bf4988+7*144
    assert text(class_at+16)=='warlock' and raw(class_at+140,1)==b'\x09'
    pool,number=pair(class_at+48);pool=[text(pool+i*16)for i in range(number)]
    assert set(KEYS)<=set(pool)
    callers=json.loads((WORK/'callers.json'if args.collect else OUT/'data.json').read_text())
    if not args.collect:callers=callers['callers']
    for row in callers:
        a=int(row['address'],16);assert digest(raw(a,row['byte_count']))==row['sha256']
        site=int(row['call_site'],16);instruction=raw(site,5);assert instruction[0]==0xe8 and site+5+struct.unpack('<i',instruction[1:])[0]==0x140040d90
    identity=json.loads((OUT/'rea.json').read_text());assert identity['target_sha256']==SHA
    assert digest(raw(int(identity['carrier_start'],16),identity['carrier_size']))==identity['carrier_sha256']
    probe=Probe(data,pe,RANGES);cases=[];old=json.loads((ASSETS/'ability-tooltips.json').read_text())
    for code,(locale,_)in locales.items():
        probe.locale=locale
        for key in KEYS:
            probe.cursor=probe.HEAP+0x1000;out=probe.alloc(64);pointer,count=pair(abilities[key]);probe.reg('R9',count)
            probe.put(probe.STACK+0x1f0008+40,0,0);probe.invoke(0x140040d90,out,class_at,pointer)
            actual=dict(name=probe.pair(out+48),subtitle=probe.pair(out+8),body=probe.pair(out+32))
            for field in ['subtitle','body']:assert render(base[key][field],locale)==actual[field],(code,key,field,render(base[key][field],locale),actual[field])
            expected_name=locale.get('ability.'+key+'.name',text(abilities[key]+16));assert actual['name']==expected_name
            cases.append(dict(locale=code,key=key,**actual))
    changed=[key for key in KEYS if any(render(old[key][field],locales['en'][0])!=render(base[key][field],locales['en'][0])for field in ['subtitle','body'])]
    assert changed==['demonic_empowerment']
    de=next(row for row in cases if row['locale']=='en'and row['key']=='demonic_empowerment')
    assert de['subtitle']=='Shadow · 22.4 sec cooldown'and 'for 11 sec.'in de['body']
    ability_at=abilities['demonic_empowerment'];assert struct.unpack('<f',raw(ability_at+72,4))[0]==16.0
    assert struct.unpack('<f',raw(ability_at+88,4))[0]==8.0
    source=(ROOT/'crates/azeroth-survivors-re/src/ability_tooltip.rs').read_text()
    for token in ['assets/ability-tooltips.json','assets/ability-tooltip-delta-0.112.0.json','entries.extend(delta.entries);','let text = entries().get(key)?;','text.subtitle.render(catalog)','text.body.render(catalog)']:assert token in source,token
    picker=(ROOT/'crates/azeroth-survivors-re/src/picker.rs').read_text()
    assert 'crate::ability_tooltip::picker(key, catalog, starting)'in picker and 'let mut icon = spells.spawn(('in picker and 'Interaction::None,\n                tooltip,'in picker
    record=dict(target_sha256=SHA,native_cases=len(cases),native_ranges=[span(a,b-a)for a,b in RANGES],
                callers=callers,artifacts={name:digest((OUT/name).read_bytes())for name in ['picker.c','rea.json','callers.asm']},
                descriptor_inputs=[span(abilities[k],120)for k in KEYS],class_descriptor=span(class_at,144),
                native_scale=span(0x145db1394,4),cases=cases,changed_source_entries=changed,
                locale_payloads=[row[1]for row in locales.values()],seams=sorted(probe.calls),
                source_assets={name:digest((ASSETS/name).read_bytes())for name in ['ability-tooltips.json','ability-tooltip-delta-0.112.0.json']},
                limits=['Current AZS picker constructor, level-zero stats, initial AbilityInstance, school/name/subtitle and description instructions execute.',
                        'Existing allocation/byte/locale/String/Rust-format services and imported truncf/roundf are explicit host seams.',
                        'Seven directly related demon spell keys and all fourteen current locales; no unrelated base tooltip expression refresh.',
                        'No inherited engine implementation, compilation, game, rendering, filesystem or original/rebuilt parity execution.'])
    record=json.loads(json.dumps(record,ensure_ascii=False))
    if args.collect:WORK.mkdir(parents=True,exist_ok=True);(WORK/'data.json').write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n')
    else:assert json.loads((OUT/'data.json').read_text())==record
    print(f'PASS {len(cases)} current demon picker tooltip cases; one source expression correction; no compiler/game')
if __name__=='__main__':main()

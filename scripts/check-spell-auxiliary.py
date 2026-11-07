#!/usr/bin/env python3
"""Current auxiliary spell rows and talent relevance from original instructions.

Runs bounded Win64 owners over synthetic storage; allocation, byte comparison,
locale lookup and Rust formatting are declared seams. No build/game executes.
"""
import argparse, ast, hashlib, itertools, json, math, re, struct, sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
from unicorn import x86_const as R
SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
BASE = ROOT / 'docs/analysis/evidence/0.115.0/coop-spell-text'
ASSET = ROOT / 'crates/azeroth-survivors-re/assets/native-spell-talents-0.115.0.json'


def derive():
    target = latest_target(verify=True); assert target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('aux_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    def raw(a, n):
        off = pe.rva_offset(a - pe.image_base); value = data[off:off+n]
        assert len(value) == n; return value
    def q(a): return struct.unpack('<Q', raw(a, 8))[0]
    def pair(a): return struct.unpack('<QQ', raw(a, 16))
    def text(a):
        ptr, n = pair(a); return raw(ptr, n).decode() if ptr else None
    ends = {pe.image_base+a: pe.image_base+b for a,b,_ in pe.functions()}
    ranges = {a: ends[a] for a in (0x145844b50,0x1458f72c0,0x14586b890,0x145851d00,
        0x145855690,0x145851a00,0x14585bbf0,0x1458551a0)}
    ranges[0x14585c570] = 0x14585c83e
    ranges[0x14585c430] = 0x14585c56f
    ranges[0x14590251a] = 0x14590254d
    native_manifest=json.loads((BASE/'auxiliary-native.json').read_text())
    assert native_manifest['target_sha256']==SHA
    for record in native_manifest['functions']:
        start,end=int(record['start'],16),int(record['end_exclusive'],16)
        assert hashlib.sha256(raw(start,end-start)).hexdigest()==record['sha256']
        assert hashlib.sha256((BASE/record['assembly']).read_bytes()).hexdigest()==record['assembly_sha256']
    old = load_script('aux_native_base', ROOT / 'scripts/check-coop-ui.py')
    seams = (0x145d14601,0x145d151d0,0x145ce7350,0x1458dff90,0x1458e0370,
             0x145d1463d,0x145d14661,0x140002200,0x1400021c0,0x1400021d0,
             0x14584e6b0,0x145d145fb)
    class Probe(old.Native):
        def __init__(self):
            super().__init__(data,pe,list(ranges.items()),seams)
            self.translations = {}; self.executed=set()
        def ret(self):
            stack=self.reg('RSP');self.reg('RIP',self.q(stack));self.reg('RSP',stack+8)
        def read(self,a,n):
            if pe.image_base<=a<pe.image_base+0x10000000:
                for page in range(a&~4095,(a+n+4095)&~4095,4096):self.map_image_page(page)
            return self.cpu.mem_read(a,n)
        def string_value(self,a):
            return bytes(self.read(self.q(a),self.q(a+8))).decode()
        def float(self,a):return struct.unpack('<f',self.cpu.mem_read(a,4))[0]
        def hook(self,cpu,pc,size,extra):
            if any(a<=pc and pc+size<=b for a,b in self.ranges):
                self.executed.add((pc,size));return
            c,d,n,r9=[self.reg(x)for x in ('RCX','RDX','R8','R9')]
            if pc==0x1400021c0:self.reg('RAX',self.alloc(c))
            elif pc in (0x140002200,0x1400021d0):pass
            elif pc==0x145d145fb:cpu.mem_write(c,bytes(self.read(d,n)));self.reg('RAX',c)
            elif pc==0x14584e6b0:
                stack=self.reg('RSP');pattern=bytes(self.read(r9,self.q(stack+40)))
                replacement=bytes(self.read(self.q(stack+48),self.q(stack+56)))
                self.string(c,bytes(self.read(d,n)).replace(pattern,replacement))
            elif pc==0x145d14601:
                self.reg('RAX',int(bytes(self.read(c,n))!=bytes(self.read(d,n))))
            elif pc==0x145d151d0:
                length=self.q(c+16);capacity=max(8,self.q(c)*2);ptr=self.alloc(capacity*16)
                if length:cpu.mem_write(ptr,bytes(cpu.mem_read(self.q(c+8),length*16)))
                self.put(c,capacity,ptr,length)
            elif pc==0x1458dff90:
                key=bytes(self.read(c,d)).decode()
                if key in self.translations:
                    out=self.alloc(24);self.string(out,self.translations[key].encode());self.reg('RAX',self.q(out+8));self.reg('RDX',self.q(out+16))
                else:self.reg('RAX',0);self.reg('RDX',0)
            elif pc in (0x145d1463d,0x145d14661):
                value=struct.unpack('<f',cpu.reg_read(R.UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
                if math.isfinite(value):value=math.copysign(math.floor(abs(value)+.5),value)if pc==0x145d1463d else math.trunc(value)
                cpu.reg_write(R.UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',value),'little'))
            elif pc==0x145ce7350:
                at=d;index=0;result=''
                while True:
                    op=self.read(at,1)[0];at+=1
                    if not op:break
                    if op<128:result+=bytes(self.read(at,op)).decode();at+=op;continue
                    precision=None
                    if op in (0xc1,0xc5):
                        at+=4;precision=0
                        if op==0xc5:precision=struct.unpack('<H',self.read(at,2))[0];at+=2
                    else:assert op==0xc0,hex(op)
                    value,formatter=self.q(n+index*16),self.q(n+index*16+8);index+=1
                    if formatter==0x145cf8100:
                        number=self.float(value);result+=format(number,'.'+str(precision)+'f')if precision is not None else str(number)
                    elif formatter==0x1400020c0:result+=self.string_value(value)
                    else:raise AssertionError(('formatter',hex(formatter)))
                self.string(c,result.encode())
            elif pc==0x1458e0370:
                result=bytes(self.read(d,n)).decode()
                for j in range(self.q(self.reg('RSP')+40)):
                    at=r9+j*32;key=self.string_value(at);value=self.q(at+16);formatter=self.q(self.q(at+24)+24)
                    if formatter==0x1400020e0:replacement=self.string_value(value+8)
                    elif formatter==0x1400020c0:replacement=self.string_value(value)
                    elif formatter==0x145cf8e00:replacement=str(struct.unpack('<I',cpu.mem_read(value,4))[0])
                    else:raise AssertionError(('named formatter',hex(formatter)))
                    result=result.replace('{'+key+'}',replacement)
                self.string(c,result.encode())
            else:return super().hook(cpu,pc,size,extra)
            self.ret()
        def call(self,address,*arguments):
            stack=self.HEAP+0x40008;self.stop=self.HEAP+0x50000;self.put(stack,self.stop)
            self.reg('RSP',stack)
            for name,value in zip(('RCX','RDX','R8','R9'),arguments):self.reg(name,value)
            self.run(address);return self.reg('RAX')
    vm=Probe(); filter_cases=[];shield_cases=[]
    for amount_bits in [0,0x80000000,0xbf800000,0x3efae148,0x3f000000,0x3f028f5c,
        0x3f8ccccd,0x3fbeb852,0x3fc00000,0x3fc147ae,0x4f7fffff,0x4f800000,0x7f800000,0xff800000,0x7fc00000]:
        game,frame=vm.HEAP+0x1000,vm.HEAP+0x3000
        vm.cpu.mem_write(game+0x4fc,struct.pack('<I',amount_bits));vm.reg('RSI',game);vm.reg('RBP',frame);vm.reg('RSP',vm.HEAP+0x40008)
        vm.stop=0x14590254d;vm.run(0x14590251a);actual=struct.unpack('<I',vm.cpu.mem_read(frame-12,4))[0]
        value=struct.unpack('<f',struct.pack('<I',amount_bits))[0]
        expected=0 if math.isnan(value)or value<=0 else 0xffffffff if value>=0xffffffff else int(math.floor(value+.5))
        assert actual==expected,(hex(amount_bits),actual,expected)
        shield_cases.append(dict(amount_bits=amount_bits,value=actual))
    for tags in [[],[15],[18],[19],[20],[31],[18,20,31,19,19,15,3,15],[15,19,15,18],list(range(38))]:
        vm.cursor=vm.HEAP+0x60000;out=vm.alloc(24);items=vm.alloc(64*len(tags))
        for i,tag in enumerate(tags):vm.cpu.mem_write(items+i*64,bytes([tag])+bytes(63))
        vm.call(0x1458f72c0,out,items,len(tags));ptr,count=vm.q(out+8),vm.q(out+16)
        observed=[(vm.q(ptr+i*16),vm.cpu.mem_read(ptr+i*16+8,1)[0])for i in range(count)]
        expected=[]
        for group,kinds in ((0,(18,20,31)),(2,(19,))):
            if any(tag in kinds for tag in tags):expected.append((next(i for i,tag in enumerate(tags)if tag in kinds),group))
        expected.extend((i,1)for i,tag in enumerate(tags)if tag==15)
        assert observed==expected,(tags,observed,expected);filter_cases.append(dict(tags=tags,selected=observed))
    alias_cases=[];aliases={('Fortified',0):871,('Shield Mastery',0):871,('Last Stand',0):2565,('Soul Link',0):19028,
        ('Ardent Defender',0):27778,('Blessed Life',0):27778,('Flurry',1):16280,('Last Stand',2):12975,
        ('Divine Intervention',2):19753,('Cheat Death',2):5384,('Reincarnation',2):20608}
    for name in sorted({a for a,k in aliases}|{'','other','Translated','Rafale','Schlaghagel','Élixir: 能力'}):
        for kind in range(3):
            vm.cursor=vm.HEAP+0x60000;encoded=name.encode();ptr=vm.alloc(len(encoded));vm.cpu.mem_write(ptr,encoded or b'\0')
            actual=vm.call(0x14585c570,ptr,len(encoded),kind);expected=aliases.get((name,kind),(27779,26635,25771)[kind])
            assert actual==expected,(name,kind,actual,expected);alias_cases.append(dict(name=name,kind=kind,id=actual))
    # Independently read all33 current stat templates and compare their exact
    # native formatter results to the connected source's deliberately small model.
    table=0x14700bfcc;targets=[table+n for n in struct.unpack('<33i',raw(table,132))]
    sys.path.insert(0,str(ROOT/'runtime/tests/query-python-deps'))
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    md=Cs(CS_ARCH_X86,CS_MODE_64);md.detail=True;instructions=list(md.disasm(raw(0x145844b50,ends[0x145844b50]-0x145844b50),0x145844b50));indices={i.address:j for j,i in enumerate(instructions)}
    templates=[];literals=[]
    for tag,a in enumerate(targets):
        part=instructions[indices[a]:];literal=None;length=None
        for i in part:
            if i.mnemonic=='lea'and i.op_str.startswith('rdi, [rip '):literal=i.address+i.size+i.operands[1].mem.disp
            if i.mnemonic=='mov'and i.op_str.startswith('edx, '):length=i.operands[1].imm
            if i.mnemonic=='call'and i.op_str=='0x1458dff90':break
        value=raw(literal,length).decode();templates.append(value);literals.append(dict(tag=tag,address=hex(literal),hex=raw(literal,length).hex()))
    source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/coop_spell_auxiliary.rs').read_text()
    mechanics=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text()
    effects_live=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs').read_text()
    display_live=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/spell_display.rs').read_text()
    enter_live=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    coop_live=(ROOT/'crates/azeroth-survivors-re/src/gameplay/coop.rs').read_text()
    assert 'entry.identity.as_deref().unwrap_or("")' in source and 'entry.name.clone().unwrap_or_default()' in source
    assert 'display_locale: Option<crate::localization::Localization>' in effects_live
    assert 'pub display_provenance: Vec<String>' in effects_live and 'self.refresh_spell_display_names();' in effects_live
    assert 'provenance: &provenance' in effects_live and 'display_provenance' in effects_live.split('let provenance =',1)[1]
    assert 'aura_provenance: &\'a [String]' in mechanics and 'provenance: &aura_provenance' in mechanics
    adapter_sources=[mechanics]+[(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics'/name).read_text()for name in ('raid_hits.rs','incoming.rs','demons.rs')]
    assert sum(text.count('aura_provenance: &self.effect_state.display_provenance')for text in adapter_sources)==6
    assert not any('aura_provenance: &self.effect_state.provenance' in text for text in adapter_sources)
    assert 'game.set_spell_display_locale(&locale);' in enter_live
    assert 'locale.for_code(&String::from_utf8_lossy(&profile.bytes_30))' in coop_live
    assert 'game.set_spell_display_locale(&actor_locale);' in coop_live
    assert 'self.effect_state.display_locale = Some(locale.for_code(locale.code()))' in display_live
    assert 'actor_locale_aliases_survive_recipient_translation_and_refresh' in display_live
    source_templates=json.loads('['+source.split('const STAT_TEMPLATES:',1)[1].split('= [',1)[1].split('];',1)[0].rstrip().rstrip(',')+']')
    assert source_templates==templates
    f=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
    rnd=lambda v:math.copysign(math.floor(abs(v)+.5),v)
    def decimal(v):
        result=f(f(rnd(f(v*10)))/10);return format(result,'.0f')if result%1==0 else format(result,'.1f')
    stats=[]
    for tag in range(33):
        for value in [0.,.001,.005,.015,.095,.0996,.1,.555,1.25,-.015,12.55]:
            value=f(value);vm.cursor=vm.HEAP+0x60000;out=vm.alloc(24)
            vm.cpu.reg_write(R.UC_X86_REG_XMM2,int.from_bytes(struct.pack('<f',value),'little'))
            vm.call(0x145844b50,out,tag);actual=vm.string_value(out+8)
            if tag in (6,15,25,26):number=decimal(value)
            else:
                p=f(value*100);number=(decimal(p)if abs(p)<10 else format(rnd(p),'.0f'))+'%'
            expected=templates[tag].replace('{p}',number).replace('{v}',number)
            assert actual==expected,(tag,value,actual,expected);stats.append(dict(tag=tag,amount_bits=struct.unpack('<I',struct.pack('<f',value))[0],text=actual))
    # Current talent descriptions and spell relevance. This projection runs the
    # whole native predicate for every355x113 pair instead of importing historic
    # payload layouts into the presentation layer.
    definitions=[]
    for i in range(113):
        at=0x146cc4580+i*120;definitions.append((at,text(at)))
    vm.cursor=vm.HEAP+0x60000;defref=vm.alloc(8);pair1=vm.alloc(16);pair2=vm.alloc(16);captures=vm.alloc(32);closure=vm.alloc(8);entry=vm.alloc(16);arg=vm.alloc(8)
    vm.put(closure,captures);vm.put(arg,entry);classes=[];permanent=[];projection=[]
    class_table=0x14702be30
    assets=ROOT/'crates/azeroth-survivors-re/assets'
    effects_source=json.loads((assets/'talents.json').read_text())
    source_talents={c['id']:{t['key']:t for tree in c['trees']for t in tree['talents']}for c in effects_source['classes']}
    source_talents[1].update({t['key']:t for t in json.loads((assets/'warrior-talents-0.112.0.json').read_text())['talents']})
    source_talents[9]={t['key']:t for t in json.loads((assets/'warlock-effects-0.112.0.json').read_text())['talents']}
    source_rows=[]
    def relevant(raw_source, source=False):
        tag=raw_source[0]
        if tag==253:tag=raw_source[63]
        elif source and tag in (30,31):return None
        if tag in (18,19,20,31):return (tag,)
        if tag==25:return (tag,struct.unpack_from('<I',raw_source,4)[0])
        if tag==15:return(tag,raw_source[1],struct.unpack_from('<I',raw_source,4)[0])
        return None
    for cls in (1,2,3,4,5,7,8,9,11):
        descriptor=q(class_table+(cls-1)*8);talents=[]
        for tree in range(3):
            ptr,count=pair(descriptor+tree*64+48)
            for i in range(count):
                at=ptr+i*160;key,name=text(at+48),text(at+64);spells=[];vm.put(entry,at,1)
                ep,en=pair(at+96)
                native_display=[value for ei in range(en)if(value:=relevant(raw(ep+ei*64,64)))is not None]
                source_talent=source_talents[cls][key]
                source_display=[value for e in source_talent['effects']if(value:=relevant(bytes.fromhex(e.get('raw_hex',e.get('payload',''))),True))is not None]
                assert native_display==source_display,(cls,key,native_display,source_display)
                if native_display:
                    assert source_talent['name']==name,(cls,key,name,source_talent['name'])
                    source_rows.append(dict(class_id=cls,key=key,name=name,effects=native_display))
                for spell,key_spell in definitions:
                    vm.put(defref,spell);vm.put(pair1,spell,defref);vm.put(pair2,defref,spell);vm.put(captures,pair1,pair2,spell,defref)
                    if vm.call(0x14586b890,closure,arg)&255:spells.append(key_spell)
                talents.append(dict(key=key,name=name,spells=spells))
                for ei in range(en):
                    effect=raw(ep+ei*64,64)
                    if effect[0]==25:
                        assert vm.call(0x14585c430,cls,struct.unpack_from('<I',effect,4)[0])==at
                        out=vm.alloc(24);vm.call(0x145855690,out,at,1);rendered=vm.string_value(out+8)
                        template=text(at+112);values=[]
                        if '{v}'in template:
                            expression=re.escape(template).replace(re.escape('{v}'),r'(.+?)')
                            match=re.fullmatch(expression,rendered);assert match,(key,rendered);values=[match[1]]
                        else:assert rendered==template,(key,rendered,template)
                        permanent.append(dict(class_id=cls,id=struct.unpack_from('<I',effect,4)[0],key=key,name=name,description=template,
                            record=dict(address=hex(at),size=160,sha256=hashlib.sha256(raw(at,160)).hexdigest()),numeric_values=values,rendered_rank1=rendered))
                projection.append(dict(class_id=cls,key=key,record_sha256=hashlib.sha256(raw(at,160)).hexdigest(),effects_sha256=hashlib.sha256(raw(ep,en*64)).hexdigest()))
        classes.append(dict(id=cls,talents=talents))
    assert sum(len(c['talents'])for c in classes)==355
    # Three permanent aura descriptions have only Shadowform's rank1 scalar.
    menu=json.loads((ROOT/'crates/azeroth-survivors-re/assets/talents-menu-0.109.0.json').read_text())
    for row in permanent:
        talent=next(t for c in menu['classes']if c['id']==row['class_id']for tree in c['trees']for t in tree['talents']if t['key']==row['key'])
        assert talent['name']==row['name']and talent['description']==row['description']
        assert [v for v in talent['numeric_values'][:1]if v is not None]==row['numeric_values']
    assert[(r['class_id'],r['id'],r['key'])for r in permanent]==[(5,15473,'shadowform'),(11,9634,'leader_of_pack'),(11,768,'cat_form')]
    for cls in range(12):assert vm.call(0x14585c430,cls,0)==0
    # Reuse the two canonical current constructor probe classes. This examines
    # all129 amulets for display-producing rows, including currently absent tags.
    constructor_path=ROOT/'scripts/check-addon-timer-names.py'
    constructor=load_script('aux_amulet_constructor',constructor_path)
    tree=ast.parse(constructor_path.read_text());main=next(n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name=='main')
    probe_node=next(n for n in main.body if isinstance(n,ast.ClassDef)and n.name=='Probe')
    metadata_path=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/metadata.json';metadata=json.loads(metadata_path.read_text())
    factory=metadata['generated_timer_amulets']['factory'];assert hashlib.sha256(raw(int(factory['va'],16),factory['size'])).hexdigest()==factory['sha256']
    namespace=dict(vars(constructor),pe=pe,raw=raw,factory=factory)
    exec(compile(ast.Module(body=[probe_node],type_ignores=[]),'<canonical-timer-Probe>','exec'),namespace)
    names_path=ROOT/'scripts/check-amulet-names.py';names_tree=ast.parse(names_path.read_text())
    derive_node=next(n for n in names_tree.body if isinstance(n,ast.FunctionDef)and n.name=='derive')
    name_probe=next(n for n in derive_node.body if isinstance(n,ast.ClassDef)and n.name=='Probe')
    derived_namespace=dict(namespace=namespace,m=constructor,struct=struct)
    exec(compile(ast.Module(body=[name_probe],type_ignores=[]),'<canonical-generated-name-Probe>','exec'),derived_namespace)
    amulets=json.loads((assets/'native-amulets-0.100.1.json').read_text());amulets['generated'].append(json.loads((assets/'legionlord-0.112.0.json').read_text())['definition'])
    source_amulets={r['key']:r for group in ('generated','shared')for r in amulets[group]};amulet_rows=[]
    for i in range(113):
        probe=derived_namespace['Probe']({});descriptor=0x146cc4580+i*120;key,name=probe.run(descriptor)
        ep,en=probe.q(0x30000038),probe.q(0x30000040)
        native=[value for ei in range(en)if(value:=relevant(probe.bytes(ep+ei*64,64)))is not None]
        source=source_amulets[key];expected=[value for effect in source['effects']if(value:=relevant(bytes.fromhex(effect['raw_hex']),True))is not None]
        assert native==expected,(key,native,expected)
        if native:
            assert name==source['name'],(key,name,source['name']);amulet_rows.append(dict(key=key,name=name,effects=native))
    for record in metadata['shared_amulets']['descriptors']:
        for role in ('descriptor','effects'):
            span=record[role];assert hashlib.sha256(raw(int(span['va'],16),span['size'])).hexdigest()==span['sha256']
        at=int(record['descriptor']['va'],16);ep,en=pair(at+48);native=[value for ei in range(en)if(value:=relevant(raw(ep+ei*64,64)))is not None]
        source=source_amulets[record['key']];expected=[value for effect in source['effects']if(value:=relevant(bytes.fromhex(effect['raw_hex']),True))is not None]
        assert native==expected,(record['key'],native,expected)
        if native:
            assert text(at+16)==source['name'];amulet_rows.append(dict(key=record['key'],name=source['name'],effects=native))
    assert len(amulet_rows)==7
    asset=dict(target_sha256=SHA,classes=classes,permanent=permanent)
    owners=[]
    for a,b in ranges.items():owners.append(dict(start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest()))
    proof=dict(target_sha256=SHA,owners=owners,shield_cases=shield_cases,filter_cases=filter_cases,alias_cases=alias_cases,stat_templates=literals,
        stat_cases=stats,talent_predicate_pairs=355*113,talent_records=projection,auxiliary_effect_source_rows=source_rows,
        amulet_definitions_checked=129,auxiliary_amulet_source_rows=amulet_rows,
        source_identity=dict(actor_entry_locale=True,remote_profile_locale=True,localized_metadata_cache=True,
            combat_adapter_sites=6,recipient_title_separate_from_actor_alias=True,
            authored_foreign_locale_regression='actor_locale_aliases_survive_recipient_translation_and_refresh'),
        asset_sha256=hashlib.sha256((json.dumps(asset,indent=2,ensure_ascii=False)+'\n').encode()).hexdigest(),
        instruction_bytes_sha256=hashlib.sha256(b''.join(raw(a,n)for a,n in sorted(vm.executed))).hexdigest(),
        limits=['Original bounded selector, alias, stat formatter and talent predicate instructions with synthetic capture/storage inputs.',
          'Locale misses, allocation/vector capacity, std formatting and imported arithmetic/memcmp have explicit host seams.',
          'All three permanent25 descriptions execute the native rank1 formatter and numeric extraction with std string/replace seams.',
          'No Rust compilation, application, UI/render/localization resource loading, network, original/rebuilt runtime or parity.'])
    return asset,proof


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');args=p.parse_args()
    asset,proof=derive()
    for path,value in ((ASSET,asset),(BASE/'auxiliary-contract.json',proof)):
        content=json.dumps(value,indent=2,ensure_ascii=False)+'\n'
        if args.write:path.write_text(content)
        else:assert path.read_text()==content,path
    print(f"PASS: {len(proof['shield_cases'])} shield rounding,{len(proof['filter_cases'])} auxiliary selectors,{len(proof['alias_cases'])} aliases,{len(proof['stat_cases'])} stat outputs,40,115 current talent/spell predicates,129 amulet display inputs,3 rank1 permanent descriptions; no build/game")
if __name__=='__main__':main()

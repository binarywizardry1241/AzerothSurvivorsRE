#!/usr/bin/env python3
"""Check current generated names and inventory name consumption, without a build.

Reuses the canonical timer constructor probe and extracts; adds bounded shared
string-storage seams and the inventory rank/name consumer. --source-root may
point at a project-local prepared patch tree; --stage writes ignored proof.
"""
import argparse
import ast
import hashlib
import json
import platform
import subprocess
from pathlib import Path
import struct
import sys
ROOT=next(p for p in Path(__file__).resolve().parents if(p/'scripts/coverage_common.py').is_file())
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
SHA='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
WORK=ROOT/'runtime/q41-amulet-inventory-0.115.0'
KEEP=ROOT/'docs/analysis/evidence/0.115.0/amulet-names.json'


def sha(raw):return hashlib.sha256(raw).hexdigest()
def artifact(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=sha(path.read_bytes()))


def derive(source_root):
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    t=latest_target(verify=True);assert t['sha256']==SHA
    data=target_bytes(t);pe=load_script('amulet_name_pe',ROOT/'scripts/inventory-executable.py').PE(data)
    ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    def raw(a,n):
        off=pe.rva_offset(a-pe.image_base);value=data[off:off+n];assert len(value)==n;return value
    decoder=Cs(CS_ARCH_X86,CS_MODE_64);decoder.detail=True
    canonical_path=ROOT/'scripts/check-addon-timer-names.py'
    m=load_script('canonical_amulet_timer_probe',canonical_path)
    text=canonical_path.read_text();tree=ast.parse(text)
    main=next(n for n in tree.body if isinstance(n,ast.FunctionDef)and n.name=='main')
    probe_node=next(n for n in main.body if isinstance(n,ast.ClassDef)and n.name=='Probe')
    probe_source=ast.get_source_segment(text,probe_node)
    metadata_path=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/metadata.json'
    metadata=json.loads(metadata_path.read_text());factory=metadata['generated_timer_amulets']['factory']
    assert int(factory['va'],16)==m.FACTORY and sha(raw(m.FACTORY,factory['size']))==factory['sha256']
    canonical_proof_path=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/generated-name-cases.json'
    canonical=json.loads(canonical_proof_path.read_text());assert canonical['target_sha256']==SHA
    assert canonical['case_count']==24
    for record in canonical['formatter_literals']:
        value=bytes.fromhex(record['bytes_hex']);assert raw(int(record['va'],16),len(value))==value
    tail=canonical['common_tail'];assert sha(raw(int(tail['start'],16),int(tail['end'],16)-int(tail['start'],16)))==tail['sha256']
    assert sha((canonical_proof_path.parent/tail['assembly']).read_bytes())==tail['assembly_sha256']
    namespace=dict(vars(m),pe=pe,raw=raw,factory=factory)
    # Reuse the exact canonical class without copying another constructor probe.
    exec(compile(ast.Module(body=[probe_node],type_ignores=[]),'<canonical-timer-name-Probe>','exec'),namespace)
    class Probe(namespace['Probe']):
        def hook(self,machine,address,size,extra):
            if address==0x14001c2a0:
                c,n,r8,r9=[self.reg(v)for v in ['RCX','RDX','R8','R9']]
                assert r8==0 and r9==1 and self.q(self.reg('RSP')+0x28)==1
                assert n<256
                pointer=self.storage;self.storage+=256
                machine.mem_write(pointer,b'\0'*max(1,n));machine.mem_write(c,struct.pack('<QQQ',0,n,pointer))
                machine.reg_write(m.R.UC_X86_REG_RAX,c);self.ret();return
            if address==0x145d145fb:
                c,d,n=[self.reg(v)for v in ['RCX','RDX','R8']]
                machine.mem_write(c,self.bytes(d,n));machine.reg_write(m.R.UC_X86_REG_RAX,c);self.ret();return
            return super().hook(machine,address,size,extra)
        def run(self,descriptor):
            self.u.mem_write(0x20018008,struct.pack('<Q',0x20000000))
            for name,value in [('RSP',0x20018008),('RCX',0x30000000),('RDX',descriptor)]:
                self.u.reg_write(getattr(m.R,'UC_X86_REG_'+name),value)
            self.u.emu_start(m.FACTORY,0,count=100000);assert self.returned
            return self.pair(0x30000008),self.pair(0x30000020)
    assets=ROOT/'crates/azeroth-survivors-re/assets'
    spell_path=assets/'addon-spell-metadata-0.112.0.json';spells=json.loads(spell_path.read_text());assert len(spells)==113
    assert sha(raw(0x146cc4580,113*120))==metadata['spells']['native']['sha256']
    cat_path=assets/'native-amulets-0.100.1.json';legion_path=assets/'legionlord-0.112.0.json'
    definitions=json.loads(cat_path.read_text())['generated']+[json.loads(legion_path.read_text())['definition']]
    definitions={r['ability_key']:r for r in definitions};assert len(definitions)==113
    # Existing current source catalog override, checked below as a selected anchor.
    definitions['soul_fire']['name']='Charm of the Fated Hour: Soulfire'
    cases=[];executed=set();english=[]
    for index,spell in enumerate(spells):
        ability=spell['key'];definition=definitions[ability]
        baseline=Probe({});key,name=baseline.run(0x146cc4580+index*120)
        assert key==definition['key']and name==definition['name'],ability
        assert len(baseline.lookups)in [1,2]
        prefix=baseline.lookups[0]
        ability_lookup=baseline.lookups[1]if len(baseline.lookups)==2 else'ability.'+ability+'.name'
        english.append(dict(ability=ability,name=name,lookups=baseline.lookups))
        wrong={'ability.'+ability+'.name':'Wrong'}if ability in ['renew','rejuvenation','demonic_empowerment']else{spell['name']:'Wrong',name:'Wrong'}
        scenarios=[('missing',{}),('prefix-only',{prefix:'Prefix'}),('ability-only',{ability_lookup:'Ability'}),
            ('both',{prefix:'Prefix',ability_lookup:'Ability'}),('empty-prefix',{prefix:'',ability_lookup:'Ability'}),
            ('empty-ability',{prefix:'Prefix',ability_lookup:''}),('both-empty',{prefix:'',ability_lookup:''}),('wrong-key-only',wrong)]
        for label,translations in scenarios:
            probe=Probe(translations);actual_key,actual=probe.run(0x146cc4580+index*120)
            assert actual_key==key and probe.lookups==baseline.lookups
            expected=translations.get(prefix,prefix)
            if len(baseline.lookups)==2:
                expected+=': '+translations.get(ability_lookup,name.split(': ',1)[1])
            assert actual==expected,(ability,label,actual,expected)
            cases.append(dict(ability=ability,source_name=name,case=label,translations=translations,name=actual))
            executed.update(probe.executed)
    # Additional storage seam is bounded to success-shaped byte-string allocation
    # and memcpy; neither selects names, locale keys, state or arithmetic.
    allocation=ops(decoder,raw,0x14001c2a0,ends[0x14001c2a0])
    assert('mov','qword ptr [rsi + 8], rbx')in allocation and('mov','qword ptr [rsi + 0x10], rax')in allocation
    thunk=raw(0x145d145fb,6);assert thunk[:2]==b'\xff\x25'
    slot=0x145d14601+struct.unpack_from('<i',thunk,2)[0]
    imports=[]
    for library in pe.imports():
        start=int(library['iat_start_address'],16);ix=(slot-start)//8
        if slot>=start and(slot-start)%8==0 and ix<len(library['functions']):imports.append((library['library'],library['functions'][ix]))
    assert len(imports)==1 and imports[0][1]=='memcpy'
    # All current caller names use a localized constructor String. The accepted
    # row copy preserves its name field +0x18, at Game+0x3b0+0x18=+0x3c8.
    owner_start,owner_end=0x14597e730,0x14598081c;assert ends[owner_start]==owner_end
    owner=ops(decoder,raw,owner_start,owner_end)
    assert('lea','rdi, [rsi + 0x3b0]')in owner
    copy=ops(decoder,raw,0x14597f293,0x14597f32b)
    for instruction in [('movups','xmm1, xmmword ptr [rbx + 0x10]'),('movups','xmm2, xmmword ptr [rbx + 0x20]'),
        ('movups','xmmword ptr [rdi + 0x20], xmm2'),('movups','xmmword ptr [rdi + 0x10], xmm1')]:assert instruction in copy
    inventory_start,inventory_end=0x14597f80d,0x14597f91c
    consumer=ops(decoder,raw,inventory_start,inventory_end)
    for instruction in [('mov','eax, dword ptr [r12 + 0x418]'),('lea','rax, [r12 + 0x3c8]'),('call','0x145ce7350')]:assert instruction in consumer
    assert sum(x==('call','0x145ce7350')for x in consumer)==2
    suffix_template=next(i for i in decoder.disasm(raw(0x14597f896,7),0x14597f896));suffix_va=suffix_template.address+suffix_template.size+suffix_template.operands[1].mem.disp
    join_template=next(i for i in decoder.disasm(raw(0x14597f8ff,7),0x14597f8ff));join_va=join_template.address+join_template.size+join_template.operands[1].mem.disp
    assert raw(suffix_va,4)==b'\x01 \xc0\0'and raw(join_va,3)==b'\xc0\xc0\0'
    class InventoryProbe(Probe):
        def hook(self,machine,address,size,extra):
            if inventory_start<=address<inventory_end:
                self.executed.add((address,size));return
            if address==m.FORMAT:
                c,d,r8=[self.reg(v)for v in ['RCX','RDX','R8']]
                if d==suffix_va:value=' '+self.pair(self.q(r8))
                else:
                    assert d==join_va
                    first=self.q(r8);second=self.q(r8+16)
                    value=self.pair(first+8)+self.pair(second+8)
                pointer,n=self.text(value);machine.mem_write(c,struct.pack('<QQQ',n,pointer,n));self.ret();return
            raise AssertionError('Inventory slice escaped reviewed interfaces: '+hex(address))
        def consume(self,name,picks):
            frame,game=0x20010000,0x30000000
            pointer,n=self.text(name);self.u.mem_write(game+0x3c8,struct.pack('<QQQ',n,pointer,n))
            self.u.mem_write(game+0x418,struct.pack('<I',picks))
            for register,value in [('RBP',frame),('R12',game),('RSP',0x20018008)]:
                self.u.reg_write(getattr(m.R,'UC_X86_REG_'+register),value)
            self.u.emu_start(inventory_start,inventory_end,count=10000)
            return self.pair(frame+0x158)
    inventory_cases=[];inventory_executed=set()
    for name in["The Reaper's Amulet: Execute",'Prefix: Ability',': Ability','Prefix: ',': ',
                'The Eternal Talisman: Vampiric Renew',"The Legionlord's Medallion",'Élixir: 能力']:
        for picks in list(range(12))+[0xffffffff]:
            probe=InventoryProbe({});actual=probe.consume(name,picks)
            suffix=''if picks<=1 else' '+(['','I','II','III','IV','V','VI','VII','VIII','IX','X'][picks]if picks<=10 else'X+')
            assert actual==name+suffix,(name,picks,actual)
            inventory_cases.append(dict(input_name=name,picks=picks,name=actual));inventory_executed.update(probe.executed)
    # Current provenance producer and consumer: clone the constructed String
    # into the existing40-byte metadata row, then resolve it without relookup.
    integration_path=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/integration.json'
    integration=json.loads(integration_path.read_text())
    producer=next(r for r in integration['owners']if r['role']=='effect-rebuild')
    append=next(r for r in integration['owners']if r['role']=='effect-metadata-append')
    for record in[producer,append]:
        a,e=int(record['start'],16),int(record['end'],16);assert sha(raw(a,e-a))==record['sha256']
    producer_ops=ops(decoder,raw,0x14593c955,0x14593c9a1)
    assert('lea','rdx, [rsi + 0x3c8]')in producer_ops and('call','0x145ce7810')in producer_ops
    assert('call','0x1458ddbb0')in producer_ops
    resolver_start,resolver_end=0x145908860,0x145908c65;assert ends[resolver_start]==resolver_end
    resolver_ops=ops(decoder,raw,resolver_start,resolver_end)
    assert('mov','r12, qword ptr [rdx + 0x850]')in resolver_ops
    assert('cmp','rcx, qword ptr [rdx + 0x858]')in resolver_ops
    assert('mov','al, 1')in resolver_ops
    class MeterProbe(Probe):
        def hook(self,machine,address,size,extra):
            if resolver_start<=address<resolver_end or int(append['start'],16)<=address<int(append['end'],16):
                self.executed.add((address,size));return
            if address==0x140002200:self.ret();return
            if address==0x1400021c0:
                n,alignment=self.reg('RCX'),self.reg('RDX');assert 0<n<256 and alignment==1
                pointer=self.storage;self.storage+=256;machine.mem_write(pointer,b'\0'*n)
                machine.reg_write(m.R.UC_X86_REG_RAX,pointer);self.ret();return
            return super().hook(machine,address,size,extra)
        def call(self,entry,*arguments):
            self.returned=False;self.u.mem_write(0x20018008,struct.pack('<Q',0x20000000))
            self.u.reg_write(m.R.UC_X86_REG_RSP,0x20018008)
            for register,value in zip(['RCX','RDX','R8'],arguments):self.u.reg_write(getattr(m.R,'UC_X86_REG_'+register),value)
            self.u.emu_start(entry,0,count=10000);assert self.returned
        def resolve(self,metadata,kind):
            game=0x30000000;effect=0x30008000;source=0x30008100;rows=0x30008200;names=0x30009000;out=0x3000a000
            self.u.mem_write(game+0x20,b'\0'*0x40)
            self.u.mem_write(game+0x1ad,bytes([kind]));self.u.mem_write(effect,b'\x0a'+b'\0'*63)
            self.u.mem_write(source,metadata)
            self.u.mem_write(game+0x830,struct.pack('<QQQ',4,rows,0))
            self.u.mem_write(game+0x848,struct.pack('<QQQ',4,names,0))
            self.lookups=[]
            if metadata:
                self.call(0x1458ddbb0,game+0x800,effect,source)
                assert self.q(game+0x858)==1 and bytes(self.u.mem_read(names,40))==metadata
                offset={0:0x40,1:0x30,3:0x20}[kind];self.u.mem_write(game+offset,struct.pack('<QQ',1,0))
            self.call(resolver_start,out,game,0)
            return self.pair(out+8),self.pair(out+24),bool(self.u.mem_read(out+40,1)[0])
    meter_cases=[];meter_executed=set();generated_tuples=set()
    for case_index,case in enumerate(cases):
        index=next(i for i,r in enumerate(spells)if r['key']==case['ability'])
        probe=MeterProbe(case['translations']);_,name=probe.run(0x146cc4580+index*120)
        metadata=bytes(probe.u.mem_read(0x30000018,24))+bytes(probe.u.mem_read(0x30000048,16))
        icon=probe.pair(0x30000048);assert icon==definitions[case['ability']]['icon']
        generated_tuples.add((case['source_name'],icon))
        for kind in[0,1,3]:
            actual,actual_icon,talent=probe.resolve(metadata,kind)
            assert(actual,actual_icon,talent)==(case['name'],icon,True)
            assert probe.lookups==[],(case_index,kind,probe.lookups)
            meter_cases.append([case_index,kind,True,0]);meter_executed.update(probe.executed)
    assert len(generated_tuples)==113
    fallback_cases=[]
    for kind,wanted in[(0,'Melee'),(2,'Pets'),(3,'Talents')]:
        probe=MeterProbe({wanted:'Wrong'})
        actual,icon,talent=probe.resolve(b'',kind)
        assert actual==wanted and talent==(kind==3)and probe.lookups==[]
        fallback_cases.append(dict(kind=kind,name=actual,talent=talent,locale_lookups=[]));meter_executed.update(probe.executed)
    # The existing semantic identity tuple is unambiguous across the current
    # generated catalog and current native/source talent descriptors.
    def pair(a):
        pointer,n=struct.unpack('<QQ',raw(a,16));return raw(pointer,n).decode()
    native_talents=[]
    for class_index in range(9):
        for tree_index in range(3):
            tree=0x147029fc8+class_index*200+tree_index*64
            pointer,n=struct.unpack('<QQ',raw(tree+48,16))
            for index in range(n):native_talents.append((pair(pointer+index*160+64),pair(pointer+index*160+80)))
    assert len(native_talents)==355 and not generated_tuples.intersection(native_talents)
    talent_paths=[assets/'talents.json',assets/'warrior-talents-0.112.0.json',assets/'warlock-effects-0.112.0.json']
    source_classes=json.loads(talent_paths[0].read_text())['classes']
    source_talents={c['key']:[t for tree in c['trees']for t in tree['talents']]for c in source_classes}
    replacements={t['key']:t for t in json.loads(talent_paths[1].read_text())['talents']}
    source_talents['warrior']=[replacements.get(t['key'],t)for t in source_talents['warrior']]
    source_talents['warlock']=json.loads(talent_paths[2].read_text())['talents']
    source_tuples=[(t['name'],t['icon'])for rows in source_talents.values()for t in rows]
    assert len(source_tuples)==355 and not generated_tuples.intersection(source_tuples)
    meter_proof=dict(resolver=dict(start=hex(resolver_start),end_exclusive=hex(resolver_end),sha256=sha(raw(resolver_start,resolver_end-resolver_start))),
        metadata='Game+0x850 pointer, Game+0x858 count,40-byte rows',
        canonical_producer=artifact(integration_path),canonical_producer_assembly=artifact(integration_path.parent/integration['assembly']['path']),
        source_name_clone=dict(start='0x14593c955',end_exclusive='0x14593c9a1',sha256=sha(raw(0x14593c955,0x4c))),
        case_columns=['constructor_case_index','context_kind','talent','resolver_locale_lookup_count'],cases=meter_cases,
        case_count=len(meter_cases),fallback_cases=fallback_cases,
        executed_instruction_count=len(meter_executed),executed_bytes_sha256=sha(b''.join(raw(a,n)for a,n in sorted(meter_executed))),
        identity_adapter=dict(generated_unique_name_icon_tuples=113,native_talent_tuples=355,source_talent_tuples=355,collisions=0,
            source_assets=[artifact(p)for p in talent_paths]),
        limits=['Synthetic generic-effect metadata admits each constructed name to the shared provenance interface; this does not prove every generated amulet has a live generic effect.',
                'Existing metadata append and complete current resolver instructions execute; string storage/copy and constructor locale/format interfaces remain explicit seams.',
                'Source identity adapter matches the retained generated name/icon and talent flag; it does not infer identity from a translated name, current worn item or display substring.'])
    resolver_callers=[]
    for site in[0x14590bae0,0x14594f7ea,0x14594f98d]:
        start,end=next((a,e)for a,e in ends.items()if a<=site<e)
        decoded=list(decoder.disasm(raw(start,end-start),start));index=next(i for i,r in enumerate(decoded)if r.address==site)
        call=decoded[index];assert call.mnemonic=='call'and call.operands[0].imm==resolver_start
        first=decoded[max(0,index-10)].address
        resolver_callers.append(dict(site=hex(site),declared_extent=[hex(start),hex(end)],
            argument_prefix_start=hex(first),end_exclusive=hex(site+call.size),sha256=sha(raw(first,site+call.size-first))))
    meter_proof['current_direct_callers']=resolver_callers
    contracts=source_contracts(source_root)
    return dict(schema_version=1,target={k:t[k]for k in ['version','path','sha256','size_bytes']},gap_ids=[41],
        canonical_constructor=dict(metadata=artifact(metadata_path),factory=factory,original_24_cases=artifact(canonical_proof_path),
            probe_class_source=artifact(canonical_path),probe_class_snippet_sha256=sha(probe_source.encode()),
            common_tail=tail,additional_storage_seams=['0x14001c2a0 success-shaped byte-string storage','0x145d145fb memcpy']),
        source_assets=[artifact(p)for p in [spell_path,cat_path,legion_path]],
        constructor_english_names=english,constructor_cases=cases,constructor_case_count=len(cases),
        constructor_executed_instruction_count=len(executed),constructor_executed_bytes_sha256=sha(b''.join(raw(a,n)for a,n in sorted(executed))),
        inventory_owner=dict(start=hex(owner_start),end_exclusive=hex(owner_end),sha256=sha(raw(owner_start,owner_end-owner_start))),
        inventory_name_slice=dict(start=hex(inventory_start),end_exclusive=hex(inventory_end),sha256=sha(raw(inventory_start,inventory_end-inventory_start)),
            stored_name='Game+0x3c8',picks='Game+0x418',locale_lookup_calls=0),
        accepted_amulet_copy=dict(start='0x14597f293',end_exclusive='0x14597f32b',sha256=sha(raw(0x14597f293,0x98)),
            constructor_name_offset='0x18',worn_payload_offset='Game+0x3b0'),
        inventory_cases=inventory_cases,inventory_case_count=len(inventory_cases),
        inventory_executed_instruction_count=len(inventory_executed),inventory_executed_bytes_sha256=sha(b''.join(raw(a,n)for a,n in sorted(inventory_executed))),
        inventory_templates=[dict(va=hex(suffix_va),bytes_hex=raw(suffix_va,4).hex()),dict(va=hex(join_va),bytes_hex=raw(join_va,3).hex())],
        allocation_interface=dict(start='0x14001c2a0',end_exclusive=hex(ends[0x14001c2a0]),sha256=sha(raw(0x14001c2a0,ends[0x14001c2a0]-0x14001c2a0))),
        copy_import=dict(thunk='0x145d145fb',iat=hex(slot),library=imports[0][0],symbol='memcpy'),
        meter_provenance=meter_proof,source_contracts=contracts,source_execution_verified=False,native_semantics_complete=False,parity_verified=False,
        limits=['Original instructions run with synthetic storage and declared allocation/free/locale/format/copy seams; no reconstructed source or application runs.',
                'All113 current generated English names match current source data after its existing Soulfire override; this is not effect/catalog/combat equivalence.',
                'Inventory replay begins with the constructed localized String and tests its rank/name consumption, not the whole reward/storage/client/item/tooltip lifetime.',
                'The original timer499 native cases and extracts remain canonical and unchanged; this separate proof broadens only generated-name and inventory-consumption coverage.',
                'Selected source statements and order are guarded and snippet-hashed; static source checks do not compile/type-check/execute Rust or establish source/native parity.'])


def ops(decoder,raw,a,e):return[(i.mnemonic,i.op_str)for i in decoder.disasm(raw(a,e-a),a)]


def source_contracts(source_root):
    def read(path):
        candidate=source_root/path
        return(candidate if candidate.exists()else ROOT/path).read_text()
    contracts=[]
    def fragment(path,start,end,guards):
        source=read(path);assert source.count(start)==1
        selected=source[source.index(start):].split(end,1)[0]
        assert end in source[source.index(start):]
        for guard in guards:assert guard in selected,(path,guard)
        contracts.append(dict(path=path,start_anchor=start,end_anchor=end,utf8_bytes=len(selected.encode()),sha256=sha(selected.encode()),guards=guards))
    base='crates/azeroth-survivors-re/src/'
    fragment(base+'localization/amulet_names.rs','pub(super) fn localized(','\n#[cfg(test)]',[
        'None | Some("demonic_empowerment")','return lookup(name).unwrap_or_else(|| name.to_owned());',
        'name.split_once(": ")','lookup(prefix)','"renew" => "Vampiric Renew"',
        '"rejuvenation" => "Vampiric Rejuvenation"','format!("ability.{key}.name")',
        'lookup(&ability_key).unwrap_or_else(|| fallback.to_owned())','format!("{prefix}: {ability}")'])
    fragment(base+'localization.rs','    pub(crate) fn amulet_name(','    pub fn select(',[
        'amulet_names::localized(name, ability_key,','|key| self.lookup(key).map(str::to_owned)'])
    assert'mod amulet_names;'in read(base+'localization.rs')
    fragment(base+'gameplay/client/addon_timers.rs','pub(super) fn snapshot(','\nfn line(',[
        'locale.amulet_name(row.name, row.generated_ability_key)','line(&name, row.icon, row.kind, row.ready, row.wait)'])
    fragment(base+'gameplay/client/inventory.rs','fn temporary(','\n/// Current',[
        'locale.amulet_name(&row.payload.name,','row.payload.ability_key.as_deref()), row.picks)',
        'item.lines = amulet_lines(labels, row.payload, row.rarity, row.picks);'])
    source=read(base+'gameplay/native_overlay_payload.rs');assert'locale.label(&definition.name)'not in source and'locale.label(&item.payload.name)'not in source
    for statement in ['name: locale.amulet_name(&item.payload.name, item.payload.ability_key.as_deref()),',
                      'name: locale.amulet_name(&definition.name, definition.ability_key.as_deref()),']:
        assert source.count(statement)==1
        contracts.append(dict(path=base+'gameplay/native_overlay_payload.rs',selected_statement=statement,sha256=sha(statement.encode())))
    fragment(base+'gameplay/addon_meters.rs','pub(super) fn source_name(','\nfn meter_line(',['if source.talent {',
        'amulets::catalog().generated.iter()','row.name == source.name && row.icon == source.icon',
        'return locale.amulet_name(&amulet.name, amulet.ability_key.as_deref());','locale.label(source.name).to_owned()'])
    meter=read(base+'gameplay/addon_meters.rs');original=(ROOT/(base+'gameplay/addon_meters.rs')).read_text()
    aggregation=meter.split('fn meter_line(',1)[1].split('\nfn taken_line(',1)[0]
    assert aggregation==original.split('fn meter_line(',1)[1].split('\nfn taken_line(',1)[0]
    contracts.append(dict(path=base+'gameplay/addon_meters.rs',symbol='meter_line',sha256=sha(aggregation.encode()),unchanged=True))
    discord=read(base+'gameplay/discord.rs');assert 'super::addon_meters::source_name(row.source, &locale)'in discord
    contracts.append(dict(path=base+'gameplay/discord.rs',selected_statement='super::addon_meters::source_name(row.source, &locale)'))
    catalog=read(base+'loot_rewards/amulets.rs')
    override='.expect("current Soulfire amulet").name = "Charm of the Fated Hour: Soulfire".into();'
    assert override in catalog;contracts.append(dict(path=base+'loot_rewards/amulets.rs',selected_statement=override,sha256=sha(override.encode())))
    bridge=read('scripts/check-addon-timer-bridge.py')
    assert'"locale.amulet_name(row.name, row.generated_ability_key)" in wire'in bridge
    assert'(GAMEPLAY.parent / "localization/amulet_names.rs").read_text()'in bridge
    return contracts



def parse_source(source_root):
    hosts={('Darwin','arm64'):'aarch64-apple-darwin',('Darwin','x86_64'):'x86_64-apple-darwin',
           ('Linux','x86_64'):'x86_64-unknown-linux-gnu',('Linux','aarch64'):'aarch64-unknown-linux-gnu'}
    host=hosts[(platform.system(),platform.machine())]
    parser=ROOT/'.tools/rust'/('1.98.1-'+host)/'bin/rustfmt'
    assert parser.is_file(),'Existing project Rust parser required; no installation is attempted'
    paths=['crates/azeroth-survivors-re/src/localization.rs',
           'crates/azeroth-survivors-re/src/localization/amulet_names.rs',
           'crates/azeroth-survivors-re/src/gameplay/client/addon_timers.rs',
           'crates/azeroth-survivors-re/src/gameplay/client/inventory.rs',
           'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs',
           'crates/azeroth-survivors-re/src/gameplay/addon_meters.rs',
           'scripts/check-addon-timer-bridge.py']
    directory=WORK/'syntax';directory.mkdir(parents=True,exist_ok=True)
    for index,path in enumerate(paths):
        candidate=source_root/path;candidate=candidate if candidate.exists()else ROOT/path
        content=candidate.read_text()
        if path.endswith('.rs'):
            with(directory/(str(index)+'.rs')).open('w')as output:
                process=subprocess.run([str(parser),'--edition','2021','--emit','stdout','--config','skip_children=true'],
                    input=content,text=True,stdout=output,stderr=subprocess.PIPE,cwd=ROOT,timeout=30)
            assert process.returncode==0,(path,process.stderr)
        else:ast.parse(content,filename=path)
    result=dict(status='pass',rust_syntax_files=6,python_syntax_files=1,files=paths,
                limits='Syntax only via rustfmt/stdin and Python AST. No compiler, dependency/module traversal, Rust type check or tests execute.')
    (directory/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    return result


def proof_text(value, level=0):
    """Keep complete native case rows compact and metadata readable."""
    pad = '  ' * level
    child = '  ' * (level + 1)
    if isinstance(value, dict):
        return '{\n' + ',\n'.join(child + json.dumps(key, ensure_ascii=False) + ': ' +
            proof_text(item, level + 1) for key, item in value.items()) + '\n' + pad + '}'
    if isinstance(value, list):
        if not value:
            return '[]'
        return '[\n' + ',\n'.join(child + json.dumps(item, ensure_ascii=False,
            separators=(',', ':')) for item in value) + '\n' + pad + ']'
    return json.dumps(value, ensure_ascii=False)


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true');ap.add_argument('--parse-source',action='store_true');ap.add_argument('--source-root',type=Path,default=ROOT);args=ap.parse_args()
    source=args.source_root.resolve();assert source==ROOT or ROOT in source.parents
    if args.parse_source:
        assert not args.stage;print(json.dumps(parse_source(source),indent=2));return
    result=derive(source)
    if args.stage:
        path=WORK/'amulet-names.json';path.write_text(proof_text(result)+'\n')
        print(json.dumps(dict(status='staged',proof=artifact(path),constructor_cases=result['constructor_case_count'],inventory_cases=result['inventory_case_count'],meter_cases=result['meter_provenance']['case_count'],meter_fallback_cases=len(result['meter_provenance']['fallback_cases'])),indent=2))
    else:
        assert json.loads(KEEP.read_text())==result,'Retained amulet name proof differs'
        print(json.dumps(dict(status='pass',proof=artifact(KEEP),constructor_cases=result['constructor_case_count'],inventory_cases=result['inventory_case_count'],meter_cases=result['meter_provenance']['case_count'],meter_fallback_cases=len(result['meter_provenance']['fallback_cases'])),indent=2))
if __name__=='__main__':main()

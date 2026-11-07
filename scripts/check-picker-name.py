#!/usr/bin/env python3
"""Check current picker name invalidation with bounded native instructions.

--prepare stages exact raw REA/Ghidra inputs; --write curates completed REA
results and native observations. Default only verifies retained evidence and
runs isolated instruction checks with explicit string/allocator/count seams.
No compiler, game, window, save or platform adapter is executed.
"""
from runtime_layout import retained_runtime_path
from portable_paths import portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
WORK = ROOT / 'runtime/analysis/history/interface/portrait/968a66465324'
OUT = ROOT / 'docs/analysis/evidence/picker-name'
RANGES = {
    'content-update': (0x140078c10, 0x140079fa6),
    'name-font-size': (0x140067b70, 0x140067bfb),
    'portrait-node': (0x14024e8a2, 0x14024e9a8),
    'name-and-caret-constructor': (0x14025017d, 0x14025044c),
}
LITERALS = [(0x145dcd0f0, 4), (0x145dccf50, 8), (0x145d9d2a0, 4),
            (0x145deb560, 16)]


def check_ime(write):
    """Current AS commit bridge, frame-boundary filter and caret publication."""
    from native_terminal import verified_input, NativeReplay
    from native_recovery import f32, bits
    sys.path.insert(0, str(ROOT/'runtime/tool-state/python/armory/python-libs'))
    evidence = ROOT/'docs/analysis/evidence/ime-bridge'
    manifest, target, data, pe = verified_input(evidence)
    for query in manifest['queries']:
        for key in ['plan', 'journal', 'result', 'raw_input']:
            row = query[key]; assert hashlib.sha256((retained_runtime_path(ROOT/row['path'], ROOT)).read_bytes()).hexdigest() == row['sha256']
        native = json.loads((ROOT/query['result']['path']).read_text())['structuredContent']
        assert native['provider']['id'] == 'ghidra' and native['evidence_id'] == query['evidence_id']
        assert native['subject']['digest']['sha256'] == query['raw_input']['sha256']
        start = int(query['slice_virtual_address'],16); raw = (ROOT/query['raw_input']['path']).read_bytes()
        off = pe.rva_offset(start-pe.image_base); assert data[off:off+len(raw)] == raw
    # Reproduce the bounded reader census from the shared current inventories.
    # These selectors cover encoded references, not computed global aliasing.
    from shared_native_inventory import open_readonly, historical_file_sha256
    census_row=manifest['reader_census'];census_path=evidence/census_row['path']
    assert hashlib.sha256(census_path.read_bytes()).hexdigest()==census_row['sha256']
    census=json.loads(census_path.read_text());assert census['target']==manifest['target']
    identity=bytes.fromhex(census['identity_hex']);aliases=[];offset=0
    while (offset:=data.find(identity,offset))>=0:
        for section in pe.sections:
            if section['raw_offset']<=offset<section['raw_offset']+section['raw_size']:
                aliases.append(hex(pe.image_base+section['rva']+offset-section['raw_offset']));break
        offset+=1
    assert aliases==census['identity_aliases']
    census_references=0
    for record in census['inventories']:
        # A live #41 summary may be refreshed independently. Its captured hash
        # is provenance; the immutable inventory and embedded target control reuse.
        path=ROOT/record['inventory']['path']
        assert (historical_file_sha256(path)or hashlib.sha256(path.read_bytes()).hexdigest())==record['inventory']['sha256']
        observed=[]
        with open_readonly(path)as db:
            metadata=json.loads(db.execute('SELECT value FROM metadata').fetchone()[0])
            assert metadata.get('target_sha256',metadata.get('target',{}).get('sha256'))==target['sha256']
            for selector in census['selectors']:
                if record['inventory_kind']=='declared_extents':
                    rows=db.execute('SELECT r.site,r.kind,r.target,r.bytes,e.start,e.end FROM refs r JOIN extents e ON e.ordinal=r.extent WHERE r.target=? ORDER BY r.site',(selector,))
                else:
                    rows=db.execute('SELECT r.site,r.kind,r.target,i.bytes,NULL,NULL FROM refs r JOIN instructions i ON i.site=r.site WHERE r.target=? ORDER BY r.site',(selector,))
                for site,kind,selected,raw,owner,end in rows:
                    observed.append(dict(site=hex(site),kind=kind,target=selected,bytes=raw,
                        owner=hex(owner)if owner else None,end_exclusive=hex(end)if end else None))
        assert observed==record['references'];census_references+=len(observed)
    vm = NativeReplay(data, pe); r = vm.registers; semantic = hashlib.sha256(); steps = 0
    def reg(name, value): vm.machine.reg_write(getattr(r, 'UC_X86_REG_'+name), value)
    def get(name): return vm.machine.reg_read(getattr(r, 'UC_X86_REG_'+name))
    heap = vm.mem + 0x10000
    selected_window = 0x100000007
    seam_counts = {}
    def alloc(count):
        nonlocal heap
        at = heap; heap += (count+31)&~15; assert heap < vm.mem+0x30000
        return at
    def seam(pc):
        if pc not in [0x146061b30, 0x14606171b, 0x140002200, 0x1400021c0,
                      0x1400021d0, 0x146034350, 0x1402af600]: return False
        seam_counts[hex(pc)] = seam_counts.get(hex(pc),0)+1
        a,b,c = get('RCX'),get('RDX'),get('R8')
        if pc == 0x146061b30:
            old_cap, old_ptr, old_len = vm.get(a,'<QQQ')
            size = max(8,old_cap*2,b+c); out = alloc(size)
            if old_len: vm.machine.mem_write(out,bytes(vm.machine.mem_read(old_ptr,old_len)))
            vm.put(a,'<QQQ',size,out,old_len)
        elif pc == 0x14606171b:
            assert vm.mem <= a and a+c <= vm.mem+0x30000 or vm.stack <= a and a+c <= vm.stack+0x10000
            vm.machine.mem_write(a,bytes(vm.machine.mem_read(b,c))); reg('RAX',a)
        elif pc == 0x1400021c0: reg('RAX',alloc(a))
        elif pc == 0x146034350: reg('RAX',8); reg('RDX',b+16) # Arc<str> allocation layout seam
        elif pc == 0x1402af600: reg('RAX',selected_window) # selected PrimaryWindow query seam
        vm.return_seam(); return True
    vm.seam = seam
    bridge_cases = 0
    samples = ['', 'abc', '小米', '한국 カナ', '\x00\tA\x7f\x85B\u00a0 ', 'X'*40,
               'é'*20, '😀', '\x00\x1f\x7f\x9f', '  ']
    for sample in samples:
      for split in [False,True]:
       for selected_window in [0,0x100000007]:
        heap = vm.mem+0x10000
        ranges=[(0x1402dde10,0x1402de230),(0x14019ad00,0x14019af6c),(0x140198090,0x14019823b)]
        vm.reset('commit-forwarder',ranges,[vm.done])
        reader,cursor,events,writer,keys,ticks,buffer,string = [vm.mem+x for x in [0x4000,0x4100,0x4200,0x6000,0x6100,0x6200,0x7000,0x8000]]
        commits = [(0,'未確定'),(2,sample[:len(sample)//2]),(1,'ignored'),(2,sample[len(sample)//2:])]
        first = 2 if split else len(commits); second = len(commits)-first
        vm.put(reader,'<QQ',cursor,events);vm.put(cursor,'<Q',0)
        vm.put(events,'<9Q',first,vm.mem+0x9000,first,0,second,vm.mem+0xa000,second,first,len(commits))
        for index,(tag,text) in enumerate(commits):
            record=(vm.mem+0x9000+index*64)if index<first else(vm.mem+0xa000+(index-first)*64)
            raw=text.encode(); loc=string+index*0x100;vm.machine.mem_write(loc,raw)
            vm.put(record,'<I',tag);vm.put(record+8,'<QQQ',len(raw),loc,len(raw))
        vm.put(writer,'<QQQI',keys,0,ticks,17);vm.put(keys+0x20,'<QQQQQ',4,buffer,0,0,10)
        reg('RDX',reader);reg('R8',writer);reg('R9',vm.mem+0x5000)
        before=vm.instructions;vm.run(0x1402dde10);steps+=vm.instructions-before
        expected=''.join(c for c in sample if not(ord(c)<32 or 127<=ord(c)<=159))
        count=vm.get(keys+0x30,'<Q')[0];assert count==(2 if expected and selected_window else 0),(sample,count)
        assert vm.get(cursor,'<Q')[0]==len(commits)
        if count:
            for index in range(2):
                record=buffer+index*88
                assert vm.get(record,'<Q')[0]==10+index
                assert vm.get(record+8,'<I')[0]==0 # logical Key::Character
                def smol(address):
                    tag=vm.get(address,'<B')[0]
                    if tag<=23:return bytes(vm.machine.mem_read(address+1,tag)).decode()
                    assert tag==25
                    pointer,length=vm.get(address+8,'<QQ')
                    return bytes(vm.machine.mem_read(pointer+16,length)).decode()
                assert smol(record+0x10)==expected
                if index==0:assert smol(record+0x28)==expected
                assert vm.get(record+0x40,'<Q')[0]==selected_window
                assert vm.get(record+0x48,'<Q')[0]==0 # physical unidentified, native unidentified
                assert vm.get(record+0x54,'<BB')==(index,0) # pressed/released, not repeat
                text_tag=vm.get(record+0x28,'<B')[0]
                assert (text_tag!=0xff)==(index==0)
            semantic.update(expected.encode());semantic.update(struct.pack('<Q',selected_window))
        bridge_cases+=1
    # Original filter only scans records since the previous PostUpdate boundary.
    vm.seam=None;filter_cases=0
    for tag in range(256):
      for boundary in [0,13,14,15,16,100]:
        vm.reset('process-predicate',[(0x1402dd560,0x1402dd611)],[0x1402dd611,0x1402dd713])
        messages,handle,counter,res,ticks,first,second=[vm.mem+x for x in [0x4000,0x4100,0x4200,0x4300,0x4400,0x5000,0x6000]]
        vm.put(messages,'<9Q',2,first,2,13,1,second,1,15,16)
        vm.put(handle,'<QQQI',messages,0,ticks,17);vm.put(res,'<Q',counter);vm.put(counter,'<Q',boundary)
        for index,value in enumerate([0,tag,0]):vm.put((first+index*88 if index<2 else second)+8,'<I',value)
        reg('RDX',handle);reg('R8',res);before=vm.instructions;pc=vm.run(0x1402dd560);steps+=vm.instructions-before
        assert (pc==0x1402dd611)==(tag==0x4f and boundary<=14)
        assert vm.get(counter,'<Q')[0]==boundary
        filter_cases+=1
    # Direct Window field publication and exact logical-pixel anchor arithmetic.
    focus_cases=0
    for enabled in [0,1]:
      for explicit in [0,1]:
       for scale in [1.,1.25,2.]:
        for override in [0,1]:
         for previous in [0,1,2]:
          vm.reset('focus-publication',[(0x1402ddb1d,0x1402ddc25)],[0x1402ddc25,0x1402ddd12])
          window,ticks=vm.mem+0x4000,vm.mem+0x5000
          vm.put(window+0xb8,'<B',override);vm.put(window+0xbc,'<f',scale);vm.put(window+0xc8,'<f',scale)
          vm.put(window+0xc0,'<II',1600,900);vm.put(window+0xb0,'<2f',0.,0.);vm.put(window+0xe1,'<B',0)
          reg('R8',window);reg('RCX',ticks);reg('R14',17);reg('RBX',enabled);reg('R12',explicit);reg('R15',previous)
          vm.machine.reg_write(r.UC_X86_REG_XMM10,int.from_bytes(struct.pack('<4f',30.,40.,0.,0.),'little'))
          vm.scalar(r.UC_X86_REG_XMM9,0.);vm.scalar(r.UC_X86_REG_XMM8,0.)
          before=vm.instructions;pc=vm.run(0x1402ddb1d);steps+=vm.instructions-before
          want=(30.,40.)if explicit else(f32(f32(1600./scale)*f32(.02)),f32(f32(900./scale)*f32(.8)))
          assert vm.get(window+0xe1,'<B')[0]==enabled
          assert vm.get(window+0xb0,'<2f')==(want if enabled else(0.,0.))
          semantic.update(struct.pack('<B2f',enabled,*vm.get(window+0xb0,'<2f')));focus_cases+=1
    # Publisher requires exactly one matching row, across dense/sparse tables.
    single_cases=0
    for sparse in [False,True]:
      for count in [0,1,2]:
       for later in [0,1]:
        vm.reset('focus-single-admission',[(0x1402dda94,0x1402ddb26)],[0x1402ddb26,0x1402ddd12])
        world,table,ids=vm.mem+0x4000,vm.mem+0x5000,vm.mem+0x6000
        vm.put(world+(0x1a8 if sparse else 0x108),'<Q',table)
        vm.put(table+(0x10 if sparse else 0x58),'<Q',later);vm.put(ids,'<I',0)
        reg('RSI',world);reg('RAX',ids+4);reg('RDX',ids);reg('R10',count);reg('R11',int(count>0));reg('R8',vm.mem+0x7000 if count else 0)
        before=vm.instructions;pc=vm.run(0x1402ddae2 if sparse else 0x1402dda94);steps+=vm.instructions-before
        assert (pc==0x1402ddb26)==(count==1 and later==0)
        single_cases+=1
    snapshot_cases=0
    for start,first,second in [(0,0,0),(13,2,1),(100,0,4),(0xffffffff,5,6)]:
        vm.reset('counter-snapshot',[(0x1400a0c37,0x1400a0c4a)],[0x1400a0c4a])
        messages,counter,metadata=vm.mem+0x4000,vm.mem+0x5000,vm.mem+0x6000
        vm.put(messages+0x10,'<QQ',first,start);vm.put(messages+0x30,'<Q',second)
        reg('RAX',messages);reg('R11',counter);reg('R10',metadata);reg('R9',17)
        before=vm.instructions;vm.run(0x1400a0c37);steps+=vm.instructions-before
        assert vm.get(counter,'<Q')[0]==start+first+second
        assert vm.get(metadata+0x2c,'<I')[0]==17;snapshot_cases+=1
    # Current picker requests typing every focused frame. Missing geometry
    # preserves its prior Option<Vec2>; present geometry uses the lower-left.
    picker_cases=0
    for present in [False,True]:
      for scale in [0.5,1.,2.]:
       for size in [(0.,0.),(200.,30.)]:
        for prior in [False,True]:
         vm.reset('picker-focus-request',[(0x1401f65fd,0x1401f663c)],[0x1401f663c])
         request,node,transform=vm.mem+0x4000,vm.mem+0x5000,vm.mem+0x6000
         vm.put(request,'<I2f',int(prior),8.,9.)
         vm.put(node+0x30,'<2f',*size);vm.put(node+0x64,'<f',scale)
         vm.put(transform+0x10,'<2f',500.,100.)
         reg('RAX',request);reg('RCX',node if present else 0);reg('R10',transform)
         before=vm.instructions;vm.run(0x1401f65fd);steps+=vm.instructions-before
         expected=(1,f32(f32(500.-f32(size[0]*.5))*scale),f32(f32(100.+f32(size[1]*.5))*scale))if present else(int(prior),8.,9.)
         assert vm.get(request,'<I2f')==expected
         assert vm.get(request+0x18,'<B')[0]==1
         semantic.update(struct.pack('<I2f',*expected));picker_cases+=1
    source=(ROOT/'crates/azeroth-survivors-re/src/ime.rs').read_text()
    assert '(discard_process_keys, forward_commits).chain().before(InputSystems)'in source
    assert 'if let Ime::Commit { value, .. } = event'in source and '!c.is_control()'in source
    assert 'windows.iter().next()'in source and 'windows.single_mut()'in source
    assert 'boundary: Res<KeyboardBoundary>'in source and 'let mut cursor = boundary.0.clone()'in source
    assert '(publish, snapshot_keyboard_boundary).chain()'in source and 'boundary.0.clear(&messages)'in source
    assert 'Local<MessageCursor'not in source
    assert 'key_code: KeyCode::Unidentified(NativeKeyCode::Unidentified)'in source
    assert 'logical_key: Key::Character(text.into())'in source and 'repeat: false'in source
    assert 'text: (state == ButtonState::Pressed).then(|| text.into())'in source
    assert 'window.width() * 0.02'in source and 'window.height() * 0.8'in source
    assert 'if let Some(position) = position'in source and 'self.position = Some(position)'in source
    assert 'capture.is_typing()'in source and 'if !enabled { state.position = None; }'in source
    menu=(ROOT/'crates/azeroth-survivors-re/src/menu.rs').read_text()
    name_branch=menu.split('if state.name_focused && state.dialog.is_none() {',1)[1]
    assert name_branch.index('ime.request_typing(position)')<name_branch.index('for event in keyboard.read()')
    assert 'With<crate::picker::HeroNameButton>'in menu
    assert '(center + Vec2::new(-node.size.x * 0.5, node.size.y * 0.5))'in name_branch
    assert '* node.inverse_scale_factor'in name_branch
    picker=(ROOT/'crates/azeroth-survivors-re/src/picker.rs').read_text()
    assert 'pub(crate) struct HeroNameButton'in picker
    assert 'ime::ImePlugin'in(ROOT/'crates/azeroth-survivors-re/src/main.rs').read_text()
    capture=(ROOT/'crates/benilla-app/src/ui_script/mod.rs').read_text()
    assert 'pub fn is_typing(&self) -> bool'in capture
    proof=dict(target_sha256=target['sha256'],native_bridge_cases=bridge_cases,native_filter_cases=filter_cases,
        native_focus_cases=focus_cases,native_single_cases=single_cases,native_snapshot_cases=snapshot_cases,native_picker_cases=picker_cases,original_instruction_steps=steps,semantic_sha256=semantic.hexdigest(),
        verified_queries=len(manifest['queries']),native_reader_census_references=census_references,seams=seam_counts,compiled=False,target_executed=False,parity=False)
    text=json.dumps(proof,indent=2)+'\n'
    if write:(evidence/'validation.json').write_text(text)
    else:assert(evidence/'validation.json').read_text()==text,'IME proof missing/stale'
    print(text)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--prepare', action='store_true')
    mode.add_argument('--write', action='store_true')
    parser.add_argument('--contract', choices=['ime'])
    args = parser.parse_args()
    if args.contract == 'ime':
        check_ime(args.write); return
    target = latest_target(verify=False)
    assert target['sha256'] == SHA, 'Recover changed target before reusing these addresses'
    data = target_bytes(target)
    module = load_script('picker_name_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    raw = lambda a, n: data[pe.rva_offset(a - pe.image_base):pe.rva_offset(a - pe.image_base) + n]
    digest = lambda b: hashlib.sha256(b).hexdigest()
    assert bounds[RANGES['content-update'][0]] == RANGES['content-update'][1]
    assert bounds[RANGES['name-font-size'][0]] == RANGES['name-font-size'][1]
    assert all(0x14024e4d0 <= a < b <= bounds[0x14024e4d0]
               for a, b in [RANGES['portrait-node'], RANGES['name-and-caret-constructor']])
    if args.prepare:
        WORK.mkdir(parents=True, exist_ok=True)
        for a, b in [RANGES['content-update'], RANGES['name-font-size']]:
            stem = f'{a:x}'
            source = WORK / f'{stem}.bin'
            source.write_bytes(raw(a, b - a))
            plan = dict(target=source.relative_to(ROOT).as_posix(),
                output=(WORK / f'rea-{stem}').relative_to(ROOT).as_posix(),
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(a)),
                timeout=240, open_timeout=60, init_timeout=60,
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a)))])
            (WORK / f'{stem}-plan.json').write_text(portable_json(plan, indent=2) + '\n')
        print('Prepared two exact current-target REA/Ghidra inputs; analysis not started.')
        return
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                    str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as reg
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    previous = None if args.write else json.loads((OUT / 'manifest.json').read_text())
    if args.write:
        OUT.mkdir(parents=True, exist_ok=True)
    rows = []
    for role, (a, b) in RANGES.items():
        payload = raw(a, b - a)
        instructions = list(decoder.disasm(payload, a))
        assert sum(i.size for i in instructions) == len(payload), role
        assembly = ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip() + '\n'
                           for i in instructions)
        row = dict(role=role, address=hex(a), end_exclusive=hex(b),
            file_offset=hex(pe.rva_offset(a - pe.image_base)), byte_count=len(payload),
            sha256=digest(payload), assembly=role + '.asm', assembly_sha256=digest(assembly.encode()))
        if role in ('content-update', 'name-font-size'):
            if args.write:
                response = json.loads((WORK / f'rea-{a:x}/003-procedure_pseudo_code.json').read_text())
                evidence = response['response']['result']['structuredContent']
                assert evidence['subject']['digest']['sha256'] == row['sha256']
                assert evidence['provider']['id'] == 'ghidra'
                text = '\n'.join(line.rstrip() for line in evidence['normalized_result'].splitlines()).strip() + '\n'
                (OUT / (role + '.c')).write_text(text)
                row.update(rea_evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                           analysis_profile_digest=evidence['analysis_profile']['digest'],
                           pseudocode=role + '.c', pseudocode_sha256=digest(text.encode()))
            else:
                old = next(v for v in previous['ranges'] if v['role'] == role)
                for key in ('rea_evidence_id', 'provider', 'analysis_profile_digest', 'pseudocode', 'pseudocode_sha256'):
                    row[key] = old[key]
                assert digest((OUT / row['pseudocode']).read_bytes()) == row['pseudocode_sha256']
        else:
            row['parent_function'] = '0x14024e4d0'
        if args.write:
            (OUT / row['assembly']).write_text(assembly)
        else:
            assert (OUT / row['assembly']).read_text() == assembly
        rows.append(row)
    literals = [dict(address=hex(a), file_offset=hex(pe.rva_offset(a-pe.image_base)),
                    byte_count=n, sha256=digest(raw(a,n)), hex=raw(a,n).hex()) for a,n in LITERALS]
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    memory = 0x200000000
    machine.mem_map(memory, 0x100000)
    mapped = set()

    def demand(uc, access, address, size, value, user):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True

    machine.hook_add(UC_HOOK_MEM_UNMAPPED, demand)
    put = lambda a, f, *v: machine.mem_write(a, struct.pack('<' + f, *v))
    get = lambda a, f: struct.unpack('<' + f, machine.mem_read(a, struct.calcsize('<' + f)))
    f32 = lambda v: struct.unpack('<f', struct.pack('<f', v))[0]
    outcome = None
    seams = {0x145bcd2f0: 'String clone: copy the 24-byte record into fixture-owned storage',
             0x145bcd280: 'String clone_from: copy the fixture-owned name record',
             0x145bfa0e1: 'memcmp: compare the two supplied fixture byte spans',
             0x1400021d0: 'deallocate: fixture storage remains mapped',
             0x140007bc0: 'drop cached Pick: fixture storage remains mapped',
             0x145bd5590: 'short string character count supplied by UTF-8 decoding',
             0x145bd4f70: 'long string character count supplied by UTF-8 decoding'}
    seam_calls = {hex(a): 0 for a in seams}

    def hook(uc, address, size, user):
        nonlocal outcome
        if address in (0x1400792dc, 0x140079744):
            outcome = 'rebuild' if address == 0x1400792dc else 'name-only'
            machine.emu_stop()
            return
        if address in seams:
            seam_calls[hex(address)] += 1
            rcx, rdx, r8 = [machine.reg_read(r) for r in (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8)]
            if address in (0x145bcd2f0, 0x145bcd280):
                machine.mem_write(rcx, bytes(machine.mem_read(rdx, 24)))
            elif address == 0x145bfa0e1:
                machine.reg_write(reg.UC_X86_REG_RAX, int(bytes(machine.mem_read(rcx,r8)) != bytes(machine.mem_read(rdx,r8))))
            elif address in (0x145bd5590, 0x145bd4f70):
                machine.reg_write(reg.UC_X86_REG_RAX, len(bytes(machine.mem_read(rcx,rdx)).decode('utf-8')))
            rsp = machine.reg_read(reg.UC_X86_REG_RSP)
            machine.reg_write(reg.UC_X86_REG_RIP, get(rsp,'Q')[0])
            machine.reg_write(reg.UC_X86_REG_RSP, rsp+8)
            return
        assert any(a <= address < b for a,b in [RANGES['content-update'], RANGES['name-font-size']]), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    def string(address, location, value):
        payload = value.encode('utf-8')
        machine.mem_write(location, payload)
        put(address, 'QQQ', len(payload), location, len(payload))

    def pick(address, name):
        string(address, address+0x100, name)
        string(address+0x18, address+0x140, 'northshire')
        put(address+0x30, 'Q', 0x0064006400640064)
        machine.mem_write(address+0x38, bytes([1,1,0,0,0,0,0,0]))

    cases = []
    names = [('same','Old'), ('renamed','New'), ('empty',''), ('twelve','A'*12),
             ('thirteen','A'*13), ('twenty','A'*20), ('utf8-count','Å'*13), ('long-count','A'*40)]
    inputs = names + [(kind,'New') for kind in ['class','race','sex','skin','face','hair','hair-color','facial-hair','zone','mods','entering','snapshot-absent']]
    for kind, name in inputs:
        machine.mem_write(memory, bytes(0x20000))
        old, current, frame = memory+0x1000, memory+0x2000, memory+0x4000
        pick(old,'Old'); pick(current,name)
        for index, field in enumerate(['class','race','sex','skin','face','hair','hair-color','facial-hair']):
            if kind == field:
                machine.mem_write(current+0x38+index, bytes([2]))
        if kind == 'zone': string(current+0x18,current+0x140,'elwynn')
        if kind == 'mods': put(current+0x30,'Q',1)
        if kind == 'snapshot-absent': put(old,'Q',0xffffffffffffffff)
        put(frame+0x200,'Q',current); put(frame+0x308,'Q',old)
        machine.mem_write(frame+0x130,bytes(machine.mem_read(current,64)))
        put(frame+0x170,'B',int(kind=='entering'))
        query, world, archetypes = memory+0x6000, memory+0x7000, memory+0x8000
        components, indices, ids = memory+0x9000, memory+0xa000, memory+0xb000
        text, font, ticks, children = memory+0xc000, memory+0xd000, memory+0xe000, memory+0xf000
        put(query+0xf8,'QQB',ids,1,1); put(query+0x110,'QQQ',0,1,2); put(ids,'I',0)
        put(world+0x1a8,'Q',archetypes); put(archetypes+0x10,'Q',1)
        put(archetypes+0x18,'Q',components); put(archetypes+0x38,'QQ',indices,3)
        put(indices,'3Q',0xffffffffffffffff,0xfffffffffffffffe,0xfffffffffffffffd)
        for i, pointer in enumerate([text,font,children]):
            put(components+i*0x30+0x10,'Q',pointer); put(components+i*0x30+0x28,'Q',ticks+i*4)
        string(text,text+0x100,'Stale'); put(frame+0x11c,'I',43)
        child_query, meta, bitset, child_ids = memory+0x16000, memory+0x17000, memory+0x18000, memory+0x19000
        put(frame+0x108,'QQ',child_query,world); put(world+8,'QQ',meta,1)
        put(meta,'I',1); put(meta+4,'Q',0xfffffffe); put(meta+12,'II',0,1)
        put(child_query+0x38,'Q',1); put(child_query+0x28,'Q',bitset); put(bitset,'Q',1)
        put(child_query+0x110,'Q',1); put(children,'QQQ',1,child_ids,1); put(child_ids,'Q',0x1ffffffff)
        for register,value in [(reg.UC_X86_REG_RBP,frame),(reg.UC_X86_REG_RBX,old),
                (reg.UC_X86_REG_R15,get(old,'Q')[0]),(reg.UC_X86_REG_RDI,int(kind=='entering')),
                (reg.UC_X86_REG_R10,42),(reg.UC_X86_REG_RSP,memory+0x90000),
                (reg.UC_X86_REG_R12,query),(reg.UC_X86_REG_R13,world)]:
            machine.reg_write(register,value)
        outcome = None
        machine.emu_start(0x1400797f8,0,count=3000)
        expected = 'name-only' if (kind,name) in names else 'rebuild'
        assert outcome == expected, (kind,outcome)
        row = dict(case=kind,name=name,native_route=outcome)
        if outcome == 'name-only':
            actual = bytes(machine.mem_read(get(text+8,'Q')[0],get(text+16,'Q')[0])).decode('utf-8')
            size, caret = get(font+0x30,'f')[0], get(font+56+0x30,'f')[0]
            count = len(name)
            expected_size = 23.0 if count < 13 else f32(23.0*f32(1.0+f32(f32(float(count)-12.0)*f32(-0.03))))
            assert actual == name and size == expected_size and caret == size
            assert bytes(machine.mem_read(old,64)) == bytes(machine.mem_read(current,64))
            row.update(text=actual,font_size=size,caret_font_size=caret,snapshot_updated=True)
        cases.append(row)
    menu = (ROOT/'crates/azeroth-survivors-re/src/menu.rs').read_text()
    picker = (ROOT/'crates/azeroth-survivors-re/src/picker.rs').read_text()
    assert menu.index('crate::picker::sync_name') > menu.index('input.run_if')
    assert 'if !matches!(action, Action::RandomName)' in menu
    assert 'mark_dirty' not in menu[menu.index('if edited != state.name'):menu.index('fn persist(')]
    assert 'name:' not in picker[picker.index('struct PickerContentKey'):picker.index('impl ZoneVisibility')]
    assert all(value in picker for value in ['HeroNameText','HeroNameCaret','TextSpan::new',
        'text.0.clone_from(&state.name)','font.font_size = font_size','hero_name_font_size(&state.name)'])
    manifest = dict(target={k:target[k] for k in ('version','path','sha256','size_bytes')},
        ranges=rows,literals=literals,native_instruction_cases=len(cases),cases=cases,
        native_entry='0x1400797f8',native_stops={'name-only':'0x140079744','rebuild':'0x1400792dc'},
        host_seams={hex(a):v for a,v in seams.items()},seam_calls=seam_calls,
        source_trace='Menu input -> in-place picker::sync_name; structural content key excludes name; retained Text and caret font update without changing HeroPreview.',
        limits=['The gate starts after native root/query/Save-change prerequisites; these prerequisites are statically traced, not emulated here.',
            'One synthetic dense ECS row and one caret child exercise retained Text/TextFont writes; complete Bevy scheduling, sparse rows and stale-entity branches are not runtime validation.',
            'String/count/allocation/drop operations use the explicit host seams; allocator ownership, native Unicode counting internals and name-input acceptance are outside these observations.',
            'Raw Ghidra imports omit callees/constants and use generic GCC ABI; original PE Windows x64 instructions govern field/call interpretation.',
            'No compilation, compiling tests, game/UI/platform launch or original/rebuilt rendering comparison; portrait appearance and full menu parity remain unverified.'])
    if args.write:
        (OUT/'manifest.json').write_text(portable_json(manifest,indent=2,ensure_ascii=False)+'\n')
    else:
        assert manifest == previous, 'Retained native name observations changed'
    print(f'Picker-name evidence and {len(cases)} bounded native cases pass; compilation/rendering not run.')


if __name__ == '__main__':
    main()

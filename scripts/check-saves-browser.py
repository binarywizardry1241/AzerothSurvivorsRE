#!/usr/bin/env python3
"""Check current desktop Saves close/input contracts without compiling or a game.

Only bounded, unchanged EXE instructions run in Unicorn. Allocator releases and
owned-definition disposal are recorded host seams; no VM/filesystem/process runs.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
OUT = ROOT / 'docs/analysis/evidence/0.109.0/saves-browser'
STAGE = ROOT / 'runtime/native-evidence/0.109.0/saves-browser'
OWNERS = {'page': 0x1400184d0, 'row': 0x140259810,
          'confirmation': 0x140259c40,
          'close': 0x14000ece0, 'import-save': 0x1458a84b0,
          'export-save': 0x1458a83b0, 'saves-directory': 0x1458a8bd0,
          'extension-filter':0x140025a10, 'short-ordering':0x1400f13b0,
          'entry-filter-map':0x1400a5fb0, 'sort-wrapper':0x1400909c0,
          'data-directory':0x1458ef170}
INTERVALS = {'import-click': (0x14002d667,0x14002d783),
             'confirm-click': (0x14002d841,0x14002d8eb),
             'cancel-click': (0x14002dd08,0x14002ddae),
             'done-click': (0x14002daa0,0x14002db81)}
SHARED = {'options-events': 'docs/analysis/evidence/0.109.0/in-run-bindings/options-events.asm',
          'cancel': 'docs/analysis/evidence/0.109.0/in-run-bindings/cancel.asm'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true', help='stage checked evidence for review')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed target requires fresh recovery'
    data = target_bytes(target)
    module = load_script('save_pe', ROOT/'scripts/inventory-executable.py')
    pe = module.PE(data)
    ends = {pe.image_base+a: pe.image_base+b for a, b, _ in pe.functions()}
    def raw(a, n):
        offset = pe.rva_offset(a-pe.image_base)
        result = data[offset:offset+n]
        assert len(result) == n
        return result
    for path in [ROOT/'runtime/camera-recovery-0.105.0/python-libs', ROOT/'runtime/armory-recovery/python-libs']:
        if path.is_dir(): sys.path.insert(0, str(path))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    records = []
    STAGE.mkdir(parents=True, exist_ok=True)
    for role, (address, end) in (list((role, (a, ends[a])) for role,a in OWNERS.items())+list(INTERVALS.items())):
        body = raw(address, end-address)
        assembly = ''.join(f'{i.address:x}\t{i.mnemonic}\t{i.op_str}'.rstrip()+'\n' for i in md.disasm(body, address))
        records.append(dict(role=role, va=hex(address), end_exclusive=hex(end),
                            byte_count=len(body), sha256=hashlib.sha256(body).hexdigest(),
                            assembly=role+'.asm', assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest()))
        if args.stage: (STAGE/(role+'.asm')).write_text(assembly)
        else: assert (OUT/(role+'.asm')).read_text() == assembly, role
    table = 0x145da8af4
    actions = {str(i): hex(table+struct.unpack('<i', raw(table+4*i, 4))[0]) for i in range(18)}
    assert actions['11'] == '0x14002d667' and actions['14'] == '0x14002d841'
    assert actions['15'] == '0x14002dd08' and actions['17'] == '0x14002daa0'
    # The current importer distinguishes the five-byte prefix before decoding.
    assert raw(0x146ed3242, 5) == b'RSE1:'
    assert raw(0x146beb994, 15) == b'save.not_a_save'
    assert raw(0x146beb9a3, 12) == b'save.damaged'
    assert raw(0x146beb9af, 24) == b'characters.before-import'
    assert raw(0x146beb9c9, 5) == b'Saves'
    cases = []
    scratch, stop = 0x300000000, 0x400000000
    for pending in (-1, 0, 7):
        for opened in (False, True):
            u = Uc(UC_ARCH_X86, UC_MODE_64)
            u.mem_map(0x140190000, 0x1000); u.mem_write(0x140190000, raw(0x140190000, 0x1000))
            u.mem_map(scratch, 0x10000)
            u.mem_write(scratch+0x90, struct.pack('<q', pending))
            u.mem_write(scratch+0x1c0, bytes([opened]))
            u.reg_write(r.UC_X86_REG_RSI, scratch); u.reg_write(r.UC_X86_REG_R12, scratch+0x2000)
            u.reg_write(r.UC_X86_REG_RBP, 42); u.reg_write(r.UC_X86_REG_RSP, scratch+0x8000)
            stopped = []
            def branch(uc, a, size, unused):
                if a in (0x14019021f, 0x14019025b, 0x140190243):
                    stopped.append(a); uc.emu_stop()
                elif a == 0x1400021d0:
                    sp=uc.reg_read(r.UC_X86_REG_RSP)
                    uc.reg_write(r.UC_X86_REG_RIP, struct.unpack('<Q', uc.mem_read(sp, 8))[0])
                    uc.reg_write(r.UC_X86_REG_RSP, sp+8)
                else: assert 0x1401901e2 <= a < 0x140190243, hex(a)
            # Map the recorded deallocation call as a seam, never execute it.
            u.mem_map(0x140002000, 0x1000)
            u.hook_add(UC_HOOK_CODE, branch)
            u.emu_start(0x1401901e2, 0, count=100)
            expected = 0x14019021f if pending != -1 else (0x140190243 if opened else 0x14019025b)
            assert stopped == [expected]
            if pending != -1: assert struct.unpack('<q', u.mem_read(scratch+0x90, 8))[0] == -1
            cases.append(dict(kind='escape-priority', pending_capture=pending, options_open=opened,
                              destination=hex(stopped[0])))
    for capture in (-1, 0, 5):
        for pending in (-1, 0, 9):
            u = Uc(UC_ARCH_X86, UC_MODE_64)
            u.mem_map(0x14000e000, 0x1000); u.mem_write(0x14000e000, raw(0x14000e000, 0x1000))
            for base in (0x140002000, 0x140007000): u.mem_map(base, 0x1000)
            u.mem_map(scratch, 0x10000); u.mem_map(stop, 0x1000)
            def wq(at, value): u.mem_write(at, struct.pack('<q', value))
            wq(scratch, 123); wq(scratch+0x28, 4); wq(scratch+0x88, 6)
            wq(scratch+0x90, capture); wq(scratch+0x98, scratch+0x4000)
            wq(scratch+0x188, pending); wq(scratch+0x190, scratch+0x5000)
            wq(scratch+0x1a0, 8); wq(scratch+0x1a8, scratch+0x6000)
            u.mem_write(scratch+0x1c0, b'\x01')
            wq(scratch+0x8000, stop)
            u.reg_write(r.UC_X86_REG_RCX, scratch); u.reg_write(r.UC_X86_REG_RSP, scratch+0x8000)
            calls=[]
            def close(uc, a, size, unused):
                if a==stop: uc.emu_stop()
                elif a in (0x1400021d0, 0x140007c10):
                    calls.append(hex(a)); sp=uc.reg_read(r.UC_X86_REG_RSP)
                    uc.reg_write(r.UC_X86_REG_RIP, struct.unpack('<Q', uc.mem_read(sp, 8))[0])
                    uc.reg_write(r.UC_X86_REG_RSP, sp+8)
                else: assert OWNERS['close'] <= a < ends[OWNERS['close']], hex(a)
            u.hook_add(UC_HOOK_CODE, close); u.emu_start(OWNERS['close'], 0, count=100)
            assert u.reg_read(r.UC_X86_REG_RIP) == stop
            assert u.mem_read(scratch+0x1c0, 1) == b'\0'
            for at in (0, 0x28, 0x88): assert struct.unpack('<q', u.mem_read(scratch+at, 8))[0] == 0
            for at in (0x90, 0x188, 0xb0): assert struct.unpack('<q', u.mem_read(scratch+at, 8))[0] == -1
            assert calls.count(hex(0x1400021d0)) == int(capture>0)+int(pending>0)+int(pending!=-1)
            assert calls.count(hex(0x140007c10)) == 1
            cases.append(dict(kind='close-content', capture=capture, pending_import=pending, calls=calls))
    # Environment and standard path primitives are explicit host seams. The
    # native owner still chooses every environment probe, fallback and append.
    for environment,parent in [({},None),({'APPDATA':'account'},None),
            ({'XDG_DATA_HOME':'data'},None),({'HOME':'home'},None),
            ({'APPDATA':'','XDG_DATA_HOME':'ignored'},None),
            ({'XDG_DATA_HOME':'','HOME':'ignored'},None),({'HOME':''},None),
            ({'WOW_ROGUE_SAVE':'folder/characters.txt','APPDATA':'ignored'},'folder'),
            ({'WOW_ROGUE_SAVE':'characters.txt','HOME':'ignored'},''),
            ({'WOW_ROGUE_SAVE':'','APPDATA':'ignored'},None),
            ({'WOW_ROGUE_SAVE':'/','APPDATA':'ignored'},None),
            ({'APPDATA':'account','XDG_DATA_HOME':'ignored','HOME':'ignored'},None)]:
        u=Uc(UC_ARCH_X86,UC_MODE_64)
        extent=max(section['rva']+max(section['raw_size'],section['virtual_size'])for section in pe.sections)
        u.mem_map(pe.image_base,(extent+4095)&~4095)
        for section in pe.sections:u.mem_write(pe.image_base+section['rva'],data[section['raw_offset']:section['raw_offset']+section['raw_size']])
        u.mem_map(scratch,0x20000);u.mem_map(stop,4096);heap=[scratch+0x4000];probes=[];joins=[]
        def text(at,n):return bytes(u.mem_read(at,n)).decode()
        def string(value):
            value=value.encode();at=heap[0];heap[0]+=(len(value)+16)&~15
            u.mem_write(at,value or b'\0');return at,len(value)
        def put(at,value):
            ptr,n=string(value);u.mem_write(at,struct.pack('<QQQQ',n,ptr,n,0))
        def directory(uc,a,size,unused):
            if a==stop:uc.emu_stop();return
            if OWNERS['data-directory']<=a<ends[OWNERS['data-directory']]:return
            c,d8,r8,r9=[uc.reg_read(register)for register in (r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_R9)]
            if a==0x145bb9990:
                key=text(d8,r8);probes.append(key)
                if key in environment:put(c,environment[key])
                else:uc.mem_write(c,struct.pack('<q',-1))
            elif a==0x145ba6e70:
                if parent is None:uc.reg_write(r.UC_X86_REG_RAX,0)
                else:
                    ptr,n=string(parent);uc.reg_write(r.UC_X86_REG_RAX,ptr);uc.reg_write(r.UC_X86_REG_RDX,n)
            elif a==0x145bcc5b0:put(c,text(d8,r8))
            elif a==0x145ba6d40:
                sp=uc.reg_read(r.UC_X86_REG_RSP);n=struct.unpack('<Q',uc.mem_read(sp+0x28,8))[0]
                base,part=text(d8,r8),text(r9,n);joins.append(part);put(c,(base+'/' if base else '')+part)
            elif a==0x1400021d0:pass
            else:raise AssertionError('Unreviewed directory callee '+hex(a))
            sp=uc.reg_read(r.UC_X86_REG_RSP);uc.reg_write(r.UC_X86_REG_RIP,struct.unpack('<Q',uc.mem_read(sp,8))[0]);uc.reg_write(r.UC_X86_REG_RSP,sp+8)
        u.hook_add(UC_HOOK_CODE,directory);u.mem_write(scratch+0x18008,struct.pack('<Q',stop))
        u.reg_write(r.UC_X86_REG_RCX,scratch);u.reg_write(r.UC_X86_REG_RSP,scratch+0x18008)
        u.emu_start(OWNERS['data-directory'],0,count=500);assert u.reg_read(r.UC_X86_REG_RIP)==stop
        if 'WOW_ROGUE_SAVE'in environment:expected_probes=['WOW_ROGUE_SAVE'];expected_joins=[]
        elif 'APPDATA'in environment:expected_probes=['WOW_ROGUE_SAVE','APPDATA'];expected_joins=['wenilla-rogue']
        elif 'XDG_DATA_HOME'in environment:expected_probes=['WOW_ROGUE_SAVE','APPDATA','XDG_DATA_HOME'];expected_joins=['wenilla-rogue']
        else:
            expected_probes=['WOW_ROGUE_SAVE','APPDATA','XDG_DATA_HOME','HOME'];expected_joins=['.local','share','wenilla-rogue']if 'HOME'in environment else []
        assert probes==expected_probes and joins==expected_joins,(probes,joins)
        missing=struct.unpack('<q',u.mem_read(scratch,8))[0]==-1
        assert missing==(parent is None if 'WOW_ROGUE_SAVE'in environment else not environment)
        cases.append(dict(kind='data-directory-policy',environment=environment,parent_fixture=parent,probes=probes,joins=joins,missing=missing))
    # The extension producer has already returned an optional byte slice here.
    # Allocated path ownership is empty, so this bounded fragment calls no host.
    for extension in (None,'','sav','SAV','SaV','sAv','sAV','SAv','SA v','saV','s','sa','save','savx','.sav','säv','txt'):
        u=Uc(UC_ARCH_X86,UC_MODE_64);u.mem_map(0x140025000,4096);u.mem_write(0x140025000,raw(0x140025000,4096))
        u.mem_map(scratch,0x10000);value=(extension or '').encode();u.mem_write(scratch+0x2000,value or b'\0')
        u.reg_write(r.UC_X86_REG_RBP,scratch+0x1000);u.reg_write(r.UC_X86_REG_RAX,0 if extension is None else scratch+0x2000)
        u.reg_write(r.UC_X86_REG_RDX,len(value));u.emu_start(0x140025a3e,0x140025abd,count=100)
        result=bool(u.reg_read(r.UC_X86_REG_RSI)&255)
        assert result==(extension is not None and extension.lower()=='sav')
        cases.append(dict(kind='extension',extension=extension,accepted=result))
    for first_time,second_time in ((None,None),(None,10),(10,None),(10,20),(20,10),(10,10)):
        for first,second in (('z.sav','A.sav'),('A.sav','z.sav'),('a.sav','A.sav'),('a.sav','a.sav'),('a.sav','aa.sav')):
            u=Uc(UC_ARCH_X86,UC_MODE_64);u.mem_map(0x1400f1000,4096);u.mem_write(0x1400f1000,raw(0x1400f1000,4096))
            u.mem_map(0x145bfa000,4096);u.mem_map(scratch,0x10000);u.mem_map(stop,4096)
            rows=scratch+0x2000
            for i,(name,mtime)in enumerate(((first,first_time),(second,second_time))):
                at=rows+i*72;ptr=scratch+0x4000+i*256;value=name.encode();u.mem_write(ptr,value)
                u.mem_write(at,struct.pack('<QQQ',len(value),ptr,len(value)))
                u.mem_write(at+24,struct.pack('<Iq',mtime is not None,mtime or 0));u.mem_write(at+68,struct.pack('<I',i))
            def compare(uc,a,size,unused):
                if a==stop:uc.emu_stop()
                elif a==0x145bfa0e1:
                    n=uc.reg_read(r.UC_X86_REG_R8)
                    left=bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_RCX),n));right=bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_RDX),n))
                    uc.reg_write(r.UC_X86_REG_RAX,((left>right)-(left<right))&0xffffffffffffffff)
                    sp=uc.reg_read(r.UC_X86_REG_RSP);uc.reg_write(r.UC_X86_REG_RIP,struct.unpack('<Q',uc.mem_read(sp,8))[0]);uc.reg_write(r.UC_X86_REG_RSP,sp+8)
                else:assert OWNERS['short-ordering']<=a<ends[OWNERS['short-ordering']],hex(a)
            u.hook_add(UC_HOOK_CODE,compare);u.mem_write(scratch+0x8008,struct.pack('<Q',stop))
            u.reg_write(r.UC_X86_REG_RSP,scratch+0x8008);u.reg_write(r.UC_X86_REG_RCX,rows);u.reg_write(r.UC_X86_REG_RDX,rows+72)
            u.emu_start(OWNERS['short-ordering'],0,count=2000);assert u.reg_read(r.UC_X86_REG_RIP)==stop
            order=[struct.unpack('<I',u.mem_read(rows+i*72+68,4))[0]for i in range(2)]
            expected=sorted(range(2),key=lambda i:((first_time,second_time)[i] is None,-((first_time,second_time)[i] or 0),(first,second)[i]))
            assert order==expected,(first_time,second_time,first,second,order,expected)
            cases.append(dict(kind='ordering',first=first,second=second,first_time=first_time,second_time=second_time,order=order))
    source=(ROOT/'crates/azeroth-survivors-re/src/options.rs').read_text()
    body=source.split('fn close(&mut self)', 1)[1].split('fn saves_directory', 1)[0]
    for statement in ('self.open = false;', 'self.bindings.capture = None;',
                      'self.save_confirmation = None;', 'self.save_notice = None;'):
        assert statement in body
    escape=source.split('if keys.just_pressed(KeyCode::Escape)', 2)[2].split('for (entity,', 1)[0]
    assert 'state.close();' in escape and 'save_confirmation.take()' not in escape
    assert 'Action::Done => {\n                state.close();' in source
    assert 'PendingImport::read(path)' in source and 'pending.parse()' in source
    manifest=dict(target_version=target['version'], target_sha256=SHA, target_executed=False,
                  extracts=records, shared_extracts=SHARED, actions=actions,
                  limits=['Raw Ghidra imports omit callees/data and use a generic ABI; original Win64 instructions establish arguments.',
                          'These checks execute selected native close/branch, directory policy, extension and ordering instructions. Disposal, allocation release, environment and path primitives are explicit host seams.',
                          'Page rendering, platform directory iteration/import/export and cryptography are source-traced. Optional extension slices/time fields are fixtures; native comparisons run with a byte-memcmp seam.'])
    result=dict(target_sha256=SHA, cases=cases, case_count=len(cases),
                method='Unchanged native instructions with recorded disposal/release, environment/path and memcmp seams; no game or filesystem execution.')
    if args.stage:
        (STAGE/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
        (STAGE/'native-cases.json').write_text(json.dumps(result, indent=2)+'\n')
    else:
        assert json.loads((OUT/'manifest.json').read_text()) == manifest
        assert json.loads((OUT/'native-cases.json').read_text()) == result
    print(f'Passed {len(cases)} current native Escape/close/list cases, current action/import literals and source delivery guards')

if __name__ == '__main__': main()

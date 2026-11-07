#!/usr/bin/env python3
"""Replay selected startup/stock-link contracts without compiling or launching.

Only current, hash-bound PE instructions execute in scratch Unicorn memory.
Allocator/copy/vector-growth/ASCII comparison and OS-thread outcomes are seams.
Source guards do not execute Rust.
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import itertools
import json
import re
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/0.109.0/stock-lifecycle'
MASK = (1 << 64) - 1


def require(value, why):
    if not value:
        raise ValueError(why)


NAME_SPANS = {
    'name-letter': (0x145b20840,0x145b20954),
    'name-validator': (0x145b20960,0x145b20b00),
    'name-option': (0x145b20be0,0x145b20c2c),
    'name-titlecase': (0x145b20ed0,0x145b21243),
    'name-trim': (0x140207170,0x1402073e9),
    'name-words': (0x145b24730,0x145b248ea),
    'name-letter-extra': (0x145b23e90,0x145b23f31),
    'name-count-short': (0x14603cbd0,0x14603cc8e),
    'name-count-long': (0x14603c5b0,0x14603cbd0),
    'unicode-alphabetic': (0x14603d250,0x14603d34b),
    'unicode-case-lookup': (0x14603d350,0x14603d46d),
    'unicode-lowercase': (0x14603d470,0x14603d4dc),
    'unicode-uppercase': (0x14603d4e0,0x14603d54c),
    'unicode-case-iterator': (0x146046180,0x14604619a),
    'picker-name-append': (0x1401e0ba0,0x1401e0d94),
    'create-name-check': (0x145bc3901,0x145bc3934),
    'create-name-errors': (0x145bc45b1,0x145bc45d9),
}


def current_name_cases(data, pe):
    import functools
    sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
    from native_terminal import NativeReplay
    m=NativeReplay(data,pe);u=m.machine;x=m.registers
    m.raw=functools.lru_cache(maxsize=8192)(m.raw)
    def read(register): return u.reg_read(getattr(x,'UC_X86_REG_'+register))
    def write(register,value): u.reg_write(getattr(x,'UC_X86_REG_'+register),value)
    def blob(address,size): return bytes(u.mem_read(address,size))
    def seam(address):
        if address==0x145b25170:
            needle=blob(read('RCX'),read('RDX'));hay=blob(read('R8'),read('R9'))
            write('RAX',int(needle in hay))
        elif address==0x14603cea0:
            hay=blob(read('RDX'),read('R8'));position=hay.find(bytes([read('RCX')&255]))
            write('RAX',int(position>=0));write('RDX',max(position,0))
        elif address==0x146061721:
            a=blob(read('RCX'),read('R8'));b=blob(read('RDX'),read('R8'))
            write('RAX',int(a!=b))
        elif address==0x1400021c0: write('RAX',m.mem+0x20000)
        elif address in (0x140002200,0x1400021d0): pass
        elif address==0x146061b30:
            row=read('RCX');length=read('RDX');old=m.get(row+8,'<Q')[0]
            pointer=m.mem+0x24000;u.mem_write(pointer,blob(old,length))
            m.put(row,'<2Q',1024,pointer)
        else:return False
        m.return_seam();return True
    m.seam=seam
    m.reset('name-letter',list(NAME_SPANS.values()),[m.done])
    admitted=[];letter_samples=[]
    for scalar in range(0x10000):
        if 0xd800<=scalar<=0xdfff:continue
        write('RCX',scalar);write('RSP',m.sp);m.run(0x145b20840)
        yes=bool(read('RAX')&255)
        if yes: admitted.append(scalar)
        if scalar<256 or scalar in (0x3005,0x3099,0x30fb,0x4e00,0x9fff,0xac00,0xd7a3,0xfaff):
            letter_samples.append([scalar,yes])
    for scalar in [0x10000,0x10400,0x1f600,0x20000,0x30000,0x10ffff]:
        write('RCX',scalar);write('RSP',m.sp);m.run(0x145b20840)
        yes=bool(read('RAX')&255);assert not yes;letter_samples.append([scalar,yes])
    ranges=[]
    for scalar in admitted:
        if ranges and ranges[-1][1]+1==scalar:ranges[-1][1]=scalar
        else:ranges.append([scalar,scalar])
    def legal(ch): return any(a<=ord(ch)<=b for a,b in ranges)
    def title(value):
        result='';capitalize=True
        for ch in value:
            mapped=ch.upper()if capitalize else ch.lower()
            result+=mapped if len(mapped)==1 else ch
            capitalize=ch==' '
        return result
    def validator(value):
        trimmed=value.strip()
        return 0 if not trimmed else 3 if any(not(legal(ch)or ch==' ')for ch in trimmed)else \
            5 if '  'in trimmed else 4 if trimmed.count(' ')>1 else 1 if len(trimmed)==1 else 2 if len(trimmed)>20 else 255
    names=['',' ','A','AB','arYA STAR','A B','A  B','A B C','A1','X'*20+'!',
        '  arYA STAR  ','\u2003aryA STAR\u3000','A\tB','Æthel','A\u00a0B',
        'éLÈNE','ŁUKASZ ŻÓŁĆ','ИВАН ЁЖ','ЇВАН ҐАННА','中文','汉'*20,'汉'*21,
        'あかり サクラ','한글 이름','Straße','ßA','İPEK','Iİ','Greek Ω','Αβ','عربى',
        'e\u0301','田\u200d中','田😀中','𠀀田','ＡＢ','李','李 白','李  白','李 白 花']
    names+=['a'*i for i in range(2,25)]
    normalized=[];casing=[]
    for value in names:
        encoded=value.encode();expected=validator(value)
        m.reset('name-validator',list(NAME_SPANS.values()),[m.done])
        u.mem_write(m.mem+0x6000,encoded or b'\0');write('RCX',m.mem+0x6000);write('RDX',len(encoded))
        m.run(0x145b20960);actual=read('RAX')&255;assert actual==expected,(value,actual,expected)
        m.reset('name-option',list(NAME_SPANS.values()),[m.done])
        u.mem_write(m.mem+0x6000,encoded or b'\0');write('RCX',m.app);write('RDX',m.mem+0x6000);write('R8',len(encoded))
        m.run(0x145b20be0);accepted=m.get(m.app,'<Q')[0] != MASK
        assert accepted==(expected==255),(value,accepted,expected)
        text=blob(m.get(m.app+8,'<Q')[0],m.get(m.app+16,'<Q')[0]).decode()if accepted else None
        assert text==(title(value.strip())if accepted else None),(value,text)
        normalized.append(dict(value=value,status=actual,normalized=text))
    case_inputs=['éLÈNE','ŁUKASZ ŻÓŁĆ','ИВАН ЁЖ','ЇВАН ҐАННА','中文','あかり サクラ','한글 이름',
        'ßETA','STRAßE','İPEK','Iİ','a ß','a İ','a Ÿ','a  b',' ﬃx','\u01f0abc','\u0390x']
    for value in case_inputs:
        encoded=value.encode();m.reset('name-titlecase',list(NAME_SPANS.values()),[m.done])
        u.mem_write(m.mem+0x6000,encoded);write('RCX',m.app);write('RDX',m.mem+0x6000);write('R8',len(encoded))
        m.run(0x145b20ed0);text=blob(m.get(m.app+8,'<Q')[0],m.get(m.app+16,'<Q')[0]).decode()
        assert text==title(value),(value,text,title(value));casing.append([value,text])
    appends=[]
    for initial,ch in itertools.product(['','Ab','A B','a'*18,'a'*19,'a'*20,'汉'*10,'汉'*18,'汉'*19,'汉'*20,'李 白'],
            ['a','Z',' ','1','é','Ж','中','あ','한','Ł','İ','\u0301','😀','𠀀','Ω']):
        encoded=initial.encode();m.reset('name-append',list(NAME_SPANS.values()),[m.done])
        u.mem_write(m.mem+0x6000,encoded or b'\0');m.put(m.app,'<3Q',1024,m.mem+0x6000,len(encoded))
        write('RCX',m.app);write('RDX',ord(ch));m.run(0x1401e0ba0)
        text=blob(m.get(m.app+8,'<Q')[0],m.get(m.app+16,'<Q')[0]).decode()
        accepted=legal(ch)and len(initial)<20 or ch==' 'and 1<=len(initial)<=18 and ' 'not in initial
        assert text==initial+(ch if accepted else ''),(initial,ch,text)
        appends.append([initial,ch,text])
    return dict(letter_ranges=ranges,letter_samples=letter_samples,letter_predicate_scalar_count=0x10000-0x800+6,
        admitted_scalar_count=len(admitted),normalizations=normalized,titlecase=casing,appends=appends,
        instruction_steps=m.instructions)


def current_name_contract(args):
    import subprocess
    from coverage_common import project_path,artifact_path
    target=latest_target(verify=True)
    require(target['sha256']=='3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb','Wrong current name target')
    data=target_bytes(target);pe=load_script('current_name_pe',ROOT/'scripts/inventory-executable.py').PE(data)
    output=project_path(args.work)if args.collect else ROOT/'docs/analysis/evidence/0.127.0/hero-names'
    def digest(b):return hashlib.sha256(b).hexdigest()
    def receipt(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=digest(path.read_bytes()))
    def raw(a,b):at=pe.rva_offset(a-pe.image_base);return data[at:at+b-a]
    manifest=dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},ranges=[])
    for role,(a,b)in NAME_SPANS.items():
        manifest['ranges'].append(dict(role=role,start=hex(a),end_exclusive=hex(b),byte_count=b-a,
            file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=digest(raw(a,b))))
    manifest['name_data']=[]
    for role,a,n in [('script-vectors',0x147044350,32),('extra-letters',0x147045bab,96),
            ('alphabetic-index',0x1477b58c4,212),('alphabetic-offsets',0x1477b2c40,0x5ef),
            ('create-result-table',0x147085c3c,24)]:
        encoded=raw(a,a+n);manifest['name_data'].append(dict(role=role,address=hex(a),byte_count=n,sha256=digest(encoded),
            bytes_hex=encoded.hex()if n<256 else None))
    table=[0x147085c3c+n for n in struct.unpack('<6i',raw(0x147085c3c,0x147085c54))]
    codes=[raw(address+2,address+3)[0]for address in table]
    assert codes==[0x45,0x46,0x47,0x48,0x4f,0x50],codes
    manifest['create_errors']=dict(addresses=[hex(a)for a in table],codes=codes)
    from discovery_native_subject import verify_native_query_subject
    if args.collect:
        output.mkdir(parents=True,exist_ok=True);manifest['queries']=[]
        for key in ['145b20840','145b20960']:
            folder=ROOT/'runtime/analysis/history/interface/names/33127c1b6b32'/key;jp=folder/'rea-v3/journal.json';j=json.loads(jp.read_text())
            op=next(v for v in j['operations'].values()if v['name']=='procedure_pseudo_code');require(op['status']=='completed','Pending name query')
            rp=ROOT/op['result']['path'];native=json.loads(rp.read_text())['structuredContent']
            query=dict(procedure=hex(int(key,16)),slice_virtual_address=hex(int(key,16)),raw_input=receipt(folder/'body.bin'),
                plan=receipt(folder/'plan.json'),journal=receipt(jp),result=receipt(rp),evidence_id=native['evidence_id'],
                provider=native['provider'],analysis_profile_digest=native['analysis_profile']['digest'])
            verify_native_query_subject(ROOT,native,query,manifest['target'],image=data,pe=pe);manifest['queries'].append(query)
        text=''
        for role,(a,b)in NAME_SPANS.items():
            asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',str(artifact_path(target['path']))],text=True)
            text+=f'// {role}\n'+'\n'.join(line for line in asm.splitlines()if line.startswith(('140','145','146')))+'\n'
        (output/'selected-native.asm').write_text(text);manifest['assembly_sha256']=digest(text.encode())
    else:
        retained=json.loads((output/'manifest.json').read_text())
        for key in ['target','ranges','name_data','create_errors']:require(retained[key]==manifest[key],'Changed name evidence '+key)
        require(digest((output/'selected-native.asm').read_bytes())==retained['assembly_sha256'],'Changed name assembly')
        for query in retained['queries']:
            rp=ROOT/query['result']['path']
            if rp.is_file():
                for field in ['raw_input','plan','journal','result']:
                    require(receipt(ROOT/query[field]['path'])==query[field],'Changed name query receipt')
                native=json.loads(rp.read_text())['structuredContent']
                verify_native_query_subject(ROOT,native,query,manifest['target'],image=data,pe=pe)
    cases=current_name_cases(data,pe)
    if args.collect:
        (output/'native-cases.json').write_text(portable_json(cases,ensure_ascii=False,indent=2)+'\n')
        manifest['native_cases_sha256']=digest((output/'native-cases.json').read_bytes())
        (output/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    else:
        require(portable_record(json.loads((output/'native-cases.json').read_text()))==portable_record(cases),'Name native vectors changed')
        require(digest((output/'native-cases.json').read_bytes())==retained['native_cases_sha256'],'Changed name cases')
        source=(ROOT/'crates/azeroth-survivors-re/src/hero_name.rs').read_text()
        for a,b in cases['letter_ranges']:require(f'(0x{a:x}, 0x{b:x})'in source,'Missing exact native letter range')
        for token in ['value.chars().count()','is_name_letter(ch)','single_case','mapped.next().is_none()',
                'capitalize = ch == \' \';','(1..=18).contains(&count)','count < 20']:
            require(token in source,'Current name source '+token)
        for path in ['save.rs','startup.rs','menu_state.rs']:
            require('hero_name::normalize'in(ROOT/'crates/azeroth-survivors-re/src'/path).read_text(),'Missing name input '+path)
        parser=ROOT/'.tools/rust/1.98.1-aarch64-apple-darwin/bin/rustfmt'
        if parser.is_file():
            parsed=subprocess.run([str(parser),'--edition','2024','--emit','stdout','--config','skip_children=true'],input=source,text=True,
                stdout=subprocess.DEVNULL,stderr=subprocess.PIPE,cwd=ROOT,timeout=30);require(parsed.returncode==0,parsed.stderr)
    print(json.dumps(dict(target=target['version'],letter_predicate_scalars=cases['letter_predicate_scalar_count'],
        admitted_scalars=cases['admitted_scalar_count'],letter_ranges=len(cases['letter_ranges']),normalizations=len(cases['normalizations']),
        titlecase_cases=len(cases['titlecase']),append_cases=len(cases['appends']),instruction_steps=cases['instruction_steps'],
        compiled=False,target_executed=False,parity_verified=False),indent=2))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--evidence', default=str(EVIDENCE.relative_to(ROOT)))
    parser.add_argument('--output', default='runtime/analysis/history/findings/gap9-startup/e1a098f8d4fb/checks.json')
    parser.add_argument('--scope', choices=['lifecycle','names','all'], default='lifecycle', help='Separate lifecycle/auth and hero-name source contracts')
    parser.add_argument('--prepare-rea', action='store_true', help='Stage selected-target raw Ghidra plans under runtime/')
    parser.add_argument('--current-names',action='store_true',help='Selected0.127.0 Unicode names, independent of historical lifecycle')
    parser.add_argument('--collect',action='store_true')
    parser.add_argument('--verify',action='store_true')
    parser.add_argument('--work',default='runtime/analysis/history/interface/names/33127c1b6b32/curated')
    args = parser.parse_args()
    if args.current_names: return current_name_contract(args)
    evidence, output = ((ROOT / value).resolve() for value in (args.evidence, args.output))
    require(evidence.is_relative_to(ROOT) and output.is_relative_to(ROOT / 'runtime'), 'Path leaves checkout/runtime')
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    manifest = json.loads((evidence / 'manifest.json').read_text())
    require(all(target[key] == value for key, value in manifest['target'].items()), 'Stale native target')
    data = target_bytes(target)
    module = load_script('stock_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    def raw(address, size):
        off = pe.rva_offset(address - pe.image_base)
        require(off is not None, 'Unmapped native interval')
        return data[off:off + size]
    roles = {row['role']: row for row in manifest['ranges']}
    for row in manifest['ranges']:
        a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
        require(hashlib.sha256(raw(a, b-a)).hexdigest() == row['sha256'], row['role'])
        if 'assembly' in row:
            require(hashlib.sha256((evidence / row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256'], 'Assembly changed')
        if 'bytes_hex' in row:
            require(raw(a, b-a).hex() == row['bytes_hex'], 'Data changed')
    for row in manifest.get('ghidra', []):
        if 'input_range' in row:
            native = row['input_range']; a = int(native['start'],16)
            require(native['sha256'] == row['subject_sha256'] == hashlib.sha256(raw(a,native['byte_count'])).hexdigest(), 'REA input/selected target mismatch')
        if 'pseudocode' in row:
            require(hashlib.sha256((evidence / row['pseudocode']).read_bytes()).hexdigest() == row['pseudocode_sha256'], 'Pseudocode changed')
    if args.prepare_rea:
        directory = ROOT / 'runtime/analysis/history/findings/gap9-startup/e1a098f8d4fb/rea-reproduction'
        directory.mkdir(parents=True, exist_ok=True)
        for row in manifest['ranges']:
            if row['kind'] != 'code':
                continue
            role, start = row['role'], int(row['start'], 16)
            binary = directory / (role + '.bin')
            binary.write_bytes(raw(start, row['byte_count']))
            plan = dict(target=str(binary.relative_to(ROOT)),
                output=str((directory / ('rea-' + role)).relative_to(ROOT)),
                init_timeout=60, timeout=240,
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
            (directory / (role + '-plan.json')).write_text(portable_json(plan, indent=2) + '\n')
        print('Selected-target REA/Ghidra input plans staged; no analysis process or game was started')
        return
    def table(address, n):
        return [address + value for value in struct.unpack('<'+'i'*n, raw(address, 4*n))]
    require(table(0x145EA27A4, 6) == [0x1406268A6, 0x140626F81, 0x140626D7A,
        0x140626E70, 0x140626D6B, 0x140627083], 'Character request table')
    require(table(0x145EA27BC, 4) == [0x140626B27, 0x140626C7F, 0x140626C61, 0x140626C70], 'Realm request table')
    packet_table = table(0x146BEC598, 43)
    require([packet_table[i-0x36] for i in (0x36, 0x37, 0x38, 0x3d)] ==
        [0x1458B2638, 0x1458B287B, 0x1458B28F5, 0x1458B28C0], 'Stock packet dispatch')
    require(raw(0x146ED0740, 29) == b'spawn the rogue server thread', 'Driver panic context')
    require(struct.unpack('<Q', raw(0x146ED0780, 8))[0] == 0x146ED075D, 'Driver source path')
    require(struct.unpack('<II', raw(0x146ED0790, 8)) == (26, 10), 'Driver panic source location')

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        off, size = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[off:off + size])
    scratch, size = 0x200000000, 0x100000
    machine.mem_map(scratch, size)
    stop = scratch + size - 16
    context, vectors, seams = {}, [], set()
    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def word(address): return struct.unpack('<Q', machine.mem_read(address, 8))[0]
    def put(address, value): machine.mem_write(address, struct.pack('<Q', value & MASK))
    def ret():
        sp = read('RSP'); write('RIP', word(sp)); write('RSP', sp+8)
    def allocate(n):
        address = context['arena']; context['arena'] = (address + max(n, 1) + 15) & ~15
        require(context['arena'] < scratch + 0xE0000, 'Scratch exhausted')
        return address
    def hook(_, address, count, unused):
        if address in context['stops']:
            machine.emu_stop(); return
        if address in (0x140002200, 0x1400021C0, 0x1400021D0, 0x145BFA0E7,
                       0x145BFA970, 0x140179390, 0x1458E7260, 0x145BA4B20,
                       0x145BD5860, 0x145BFA0E1, 0x1459CC050):
            seams.add(hex(address))
            if address == 0x1400021C0:
                write('RAX', 0 if context.get('allocation_fails') else allocate(read('RCX')))
            elif address == 0x145BFA0E7:
                machine.mem_write(read('RCX'), bytes(machine.mem_read(read('RDX'), read('R8')))); write('RAX', read('RCX'))
            elif address == 0x145BFA970:
                vector, length, extra = read('RCX'), read('RDX'), read('R8')
                pointer = allocate(length + extra)
                if length: machine.mem_write(pointer, bytes(machine.mem_read(word(vector+8), length)))
                put(vector, length+extra); put(vector+8, pointer)
            elif address == 0x140179390:
                a = bytes(machine.mem_read(read('RCX'), read('RDX')))
                b = bytes(machine.mem_read(read('R8'), read('RDX')))
                write('RAX', int(a.lower() == b.lower()))
            elif address == 0x145BD5860:
                buf = bytes(machine.mem_read(read('RDX'), read('R8')))
                index = buf.find(bytes([read('RCX') & 255]))
                write('RAX', int(index >= 0)); write('RDX', max(index, 0))
            elif address == 0x145BFA0E1:
                a = bytes(machine.mem_read(read('RCX'), read('R8')))
                b = bytes(machine.mem_read(read('RDX'), read('R8')))
                write('RAX', 0 if a == b else 1)
            elif address == 0x145BA4B20:
                name = read('R8')
                require(bytes(machine.mem_read(word(name+8), word(name+16))) == b'rogue-server', 'Thread name')
            elif address == 0x1458E7260:
                out = read('RCX')
                if context['spawn_ok']:
                    first, second = allocate(32), allocate(32)
                    put(first, 2); put(second, 2); put(out, first); put(out+8, second); put(out+16, 0xAABBCCDD)
                else: put(out, 0); put(out+8, 0xBAD)
            ret(); return
        if address == 0x1458EEB0C:
            seams.add('detached thread-handle close import'); write('RIP', address+6); return
        require(any(a <= address and address+count <= b for a,b in context['ranges']), f'Unreviewed instruction {address:#x}')
        require(bytes(machine.mem_read(address, count)) == raw(address, count), 'Instruction changed')
    def on_write(_, access, address, count, value, unused):
        require(scratch <= address and address+count <= scratch+size, f'Write leaves scratch {address:#x}')
    machine.hook_add(UC_HOOK_CODE, hook); machine.hook_add(UC_HOOK_MEM_WRITE, on_write)
    def reset(selected, stops=()):
        machine.mem_write(scratch, bytes(size)); machine.mem_write(stop, b'\xcc')
        for name in ('RAX','RBX','RCX','RDX','RSI','RDI','R8','R9','R10','R11','R12','R13','R14','R15','RBP'):
            write(name,0)
        write('EFLAGS',2); write('RSP',scratch+0x1F008); put(read('RSP'),stop)
        context.clear(); context.update(arena=scratch+0x60000, ranges=[(int(roles[r]['start'],16),int(roles[r]['end_exclusive'],16)) for r in selected],stops={stop,*stops})
    def run(address):
        try: machine.emu_start(address, 0, count=100000)
        except Exception as error: raise RuntimeError(f'Native replay stopped at {read("RIP"):#x}: {error}') from error
        require(read('RIP') in context['stops'], 'Instruction budget exhausted')

    if args.scope != 'names':
        catalog=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())
        source=(ROOT/'crates/azeroth-survivors-re/src/save.rs').read_text()
        allowed={int(k):[int(v) for v in re.findall(r'\d+',values)] for k,values in re.findall(r'(\d+) => &\[([^\]]+)\]',source[:source.index('/// Native appearance order')])}
        for key,cid in [(r['key'],c) for r,c in zip(catalog['classes'],[1,2,3,4,5,7,8,9,11])]+[('UNKNOWN',1),(' warrior',1),('x'*20,1)]:
            for race_name in ['', 'unknown', 'Night Elf', ' NIGHTELF']+[r['name'].replace(' ','') for r in catalog['races']]:
                reset(['tester-factory'])
                a,b=key.upper().encode(),race_name.encode();machine.mem_write(scratch+0x1000,a or b'\0');machine.mem_write(scratch+0x2000,b or b'\0')
                write('RCX',scratch+0x3000);write('RDX',scratch+0x1000);write('R8',len(a));write('R9',scratch+0x2000);put(read('RSP')+0x28,len(b));run(0x1458CF500)
                row=bytes(machine.mem_read(scratch+0x3000,56));ptr,n=struct.unpack_from('<QQ',row,8)
                race=next((i+1 for i,r in enumerate(catalog['races']) if r['name'].replace(' ','').lower()==race_name.lower() and i+1 in allowed[cid]),allowed[cid][0])
                require(bytes(machine.mem_read(ptr,n))==b'Tester','Tester default name')
                require(struct.unpack_from('<Q',row,24)[0]==0xFFFFFF and list(struct.unpack_from('<4I',row,32))==[1,0,0,0],'Tester GUID/counters')
                require(list(row[48:])==[race,cid,0,0,0,0,0,0],'Tester identity')
                vectors.append(dict(kind='tester',class_argument=key.upper(),race_argument=race_name,class_id=cid,race=race))
        zones=[r['key'] for r in catalog['zones']]
        for value in zones+['Elwynn','WSG','','unknown',' naxx','naxx ','AQ','nightelf']:
            reset(['zone-parser','realm-name']);encoded=value.encode();machine.mem_write(scratch+0x1000,encoded or b'\0');write('RCX',scratch+0x1000);write('RDX',len(encoded));run(0x1458D07B0)
            result=bytes(machine.mem_read(read('RAX'),read('RDX'))).decode();expected=catalog['zones'][zones.index(value) if value in zones else 0]['name'];require(result==expected,'Realm-name fallback')
            vectors.append(dict(kind='realm-name',argument=value,result=result))
        for zone,character,glue in itertools.product((False,True),repeat=3):
            stops=[0x14000EB40,0x14000EB86,0x14000EC50,0x14000EC7D]
            reset(['startup-selector'],stops);opts=scratch+0x4000;put(opts,1 if zone else -1);put(opts+0x18,1 if character else -1);put(opts+8,scratch+0x1000);put(opts+0x10,3);put(opts+0x20,scratch+0x2000);put(opts+0x28,7);put(opts+0x30,-1);machine.mem_write(opts+0x61,bytes([glue]));write('RCX',scratch+0x6000);write('RDX',opts);run(0x14000EB00)
            expected=0x14000EB86 if character else 0x14000EB40 if zone else 0x14000EC50 if glue else 0x14000EC7D;require(read('RIP')==expected,'Startup mode precedence')
            vectors.append(dict(kind='startup-route',zone=zone,character=character,glue=glue))
        for value,status,expected in [(b'1',-2,1),(b'0',-2,0),(b'01',-2,0),(b'',-2,0),(b'1',0,0),(b'1 ',-2,0)]:
            reset(['glue-value'],[0x14000179F]);bp=scratch+0x4000;write('RBP',bp);put(bp+0xF0,status);put(bp+0x108,len(value));put(bp+0x100,scratch+0x1000);machine.mem_write(scratch+0x1000,value or b'\0');run(0x140001779);require(read('RAX')&255==expected,'Exact glue switch');vectors.append(dict(kind='glue-value',value=value.decode(),status=status))
        # Native realm Close, Leave and character Abandon return different parked actions.
        for address,action in [(0x140626C61,4),(0x140626C70,6),(0x140626D6B,7)]:
            reset(['client-park-dispatch'],[0x140627758]);run(address);require(read('RSI')==(1<<63)+action,'Parked cancellation action');vectors.append(dict(kind='park-action',address=hex(address),action=action))
        for count in [0,1,9,10,254,255,256,1000,MASK]:
            reset(['auth-count-snapshot'],[0x1458ADA39]);bp=scratch+0x4000;write('RBP',bp);put(bp+0xB0,count);run(0x1458ADA1F);require(machine.mem_read(bp+0x10,1)==bytes([min(count,255)]),'Auth count snapshot clamp');vectors.append(dict(kind='auth-count',count=count))
        for port in [0,3724,8084,*range(8085,8097),8097,65535]:
            reset(['world-zone-port'],[0x1458ADAA5]);write('RCX',port);run(0x1458ADA80);expected=port-8085 if 8085<=port<=8096 else 0;require(read('RAX')==expected*0xF0,'Port-zone boundary');vectors.append(dict(kind='world-zone',port=port,zone=expected))
        for fail,ok in [(True,False),(False,False),(False,True)]:
            reset(['driver'],[0x145D992BB,0x145D995D0]);context.update(allocation_fails=fail,spawn_ok=ok);write('RCX',scratch+0x30000);run(0x1458EEA30);expected=0x145D992BB if fail else stop if ok else 0x145D995D0;require(read('RIP')==expected,'Driver error boundary');vectors.append(dict(kind='driver',allocation_fails=fail,spawn_ok=ok))
            if not fail and not ok:
                require(read('RCX') == 0x146ED0740 and read('RDX') == 29 and word(read('R8')) == 0xBAD,
                        'Driver must retain native spawn error and context')
        # Absent stream resumes into retained-credential reauthentication, not an
        # immediate failed reply or a fabricated retry dialog.
        reset(['realm-query'],[0x140624DA3]);ptr=scratch+0x4000;write('R8',ptr);run(0x140624A31);require(read('RIP')==0x140624DA3,'Closed auth stream reauthentication');vectors.append(dict(kind='closed-realmd-query',destination='retained-credential-redial'))
        # An unknown GUID deliberately returns without producing a login-failed packet.
        reset(['invalid-guid'],[0x1458B31BF]);write('RAX',0);run(0x1458B3141);vectors.append(dict(kind='absent-roster',reply='none'))

    if args.scope != 'names':
        # Current client and server normalize the same accepted credential domain.
        credentials = [chr(i) for i in range(128)] + ['', 'a'*16, 'a'*17,
            'MiXeD account', ' survivor', 'survivor ', 'é', 'aé', '\u0085', '\u2003']
        for role, address in [('server-normalizer', 0x14590C6D0),
                              ('client-normalizer-0x14104b6c0', 0x14104B6C0)]:
            for value in credentials:
                reset([role]); encoded = value.encode(); machine.mem_write(scratch+0x1000, encoded or b'\0')
                write('RCX', scratch+0x3000)
                if role == 'server-normalizer':
                    put(scratch+0x2000,len(encoded)); put(scratch+0x2008,scratch+0x1000); put(scratch+0x2010,len(encoded))
                    write('RDX',scratch+0x2000)
                else:
                    write('RDX',scratch+0x1000);write('R8',len(encoded))
                run(address)
                accepted = 1 <= len(encoded) <= 16 and all(0x20 <= v <= 0x7e for v in encoded)
                require((word(scratch+0x3000) != MASK) == accepted, 'Credential acceptance '+repr(value))
                if accepted:
                    require(bytes(machine.mem_read(word(scratch+0x3008),word(scratch+0x3010))) == encoded.upper(), 'Credential uppercase/no trim')
                vectors.append(dict(kind='credential-normalizer', owner=role, value=value, accepted=accepted))
    if args.scope != 'lifecycle':
        name_table = table(0x146BEDD24,6)
        require(name_table == [0x1458B3AAF,0x1458B5E5C,0x1458B5E54,0x1458B5F71,0x1458B5E4C,0x1458B5E64], 'Name error table')
        require([raw(a+2,1)[0] for a in name_table] == [0x45,0x46,0x47,0x48,0x4f,0x50], 'Name packet result codes')
    if args.scope != 'names':
        # The realmd connection stores fixed survivor at its +0x18 String field.
        require(raw(0x1458ADD6D,8) == b'survivor', 'Server fixed password immediate')
    if args.scope != 'lifecycle':
        # Replay all name-return priorities and word/character limits through the
        # actual validator, trim, counter, space iterator and title-case bodies.
        name_roles=['character-name','name-validator','name-titlecase','name-trim',
                    'name-word-iterator','name-char-count-short']
        names = ['', ' ', 'A', 'AB', 'arYA STAR', 'A B', 'A  B', 'A B C', 'A1',
            'X'*20+'!', 'A B Cdefghijklmnopqrst', '  arYA STAR  ', '\u2003aryA STAR\u3000',
            'A\tB', 'Æthel', 'A\u00a0B'] + ['a'*i for i in range(2,25)]
        for value in names:
            trimmed=value.strip(); invalid=any(not(ch.isascii() and (ch.isalpha() or ch==' ')) for ch in trimmed)
            status=0 if not trimmed else 3 if invalid else 5 if '  ' in trimmed else 4 if trimmed.count(' ')>1 else 1 if len(trimmed)==1 else 2 if len(trimmed)>20 else 255
            encoded=value.encode();reset(name_roles);machine.mem_write(scratch+0x1000,encoded or b'\0');write('RCX',scratch+0x1000);write('RDX',len(encoded));run(0x1458A8710)
            require(read('RAX')&255 == status, 'Native name validation '+repr(value))
            reset(name_roles);machine.mem_write(scratch+0x1000,encoded or b'\0');write('RCX',scratch+0x3000);write('RDX',scratch+0x1000);write('R8',len(encoded));run(0x1458A8CB0)
            require((word(scratch+0x3000) != MASK) == (status==255), 'Native name option')
            if status==255:
                require(bytes(machine.mem_read(word(scratch+0x3008),word(scratch+0x3010))).decode() == trimmed.title(),'Native word titlecase')
            vectors.append(dict(kind='name-normalizer', value=value, status=status))
        for initial in ['', 'Ab', 'A B', 'a'*18, 'a'*19, 'a'*20]:
            for ch in ['a','Z',' ','1','é']:
                reset(['picker-name-append','name-char-count-short']);encoded=initial.encode();ptr=scratch+0x1000;row=scratch+0x3000;machine.mem_write(ptr,encoded or b'\0');put(row,128);put(row+8,ptr);put(row+16,len(encoded));write('RCX',row);write('RDX',ord(ch));run(0x140067E90)
                accepted=ch.isascii() and ch.isalpha() and len(initial)<20 or ch==' ' and 1<=len(initial)<=18 and ' ' not in initial
                expected=initial+(ch if accepted else '')
                require(bytes(machine.mem_read(word(row+8),word(row+16))).decode()==expected,'Native picker name admission')
                vectors.append(dict(kind='picker-name-input', initial=initial, character=ch, accepted=accepted))
    if args.scope != 'names':
        # Test the unchanged M2 comparison/result owner with already-derived M2
        # bytes; no hash calculation, SRP or network peer is substituted as parity.
        expected=bytes(range(20))
        for changed in [None,*range(20)]:
            reset(['client-proof'],[0x145A4C504]);bp=scratch+0x4000;source=scratch+0x1000;put(bp+0x70,source);write('RBP',bp);write('RSI',scratch+0x3000);write('RDI',scratch+0x2000);write('RBX',source+0x38);machine.mem_write(bp-0x34,expected);received=bytearray(expected)
            if changed is not None:received[changed]^=1
            machine.mem_write(scratch+0x2000,bytes(received));run(0x145A4C424)
            require((word(scratch+0x3000)==MASK)==(changed is not None),'Native M2 result boundary')
            vectors.append(dict(kind='client-m2-compare', changed_byte=changed, accepted=changed is None))

    if args.scope != 'lifecycle':
        # Duplicate names include the transient projected row, while capacity
        # is checked against the permanent collection only, after duplicates.
        for saved_count, transient, collision in itertools.product([0,9,10], [False,True], [False,True]):
            reset(['create-duplicate-limit'],[0x1458B2FAF,0x1458B6114]);bp=scratch+0x10000;server=scratch+0x20000;rows=scratch+0x30000;name=b'Startup Hero';put(server+0xB30,saved_count);write('RBP',bp);write('R12',server);write('R15',len(name));machine.mem_write(scratch+0x1000,name);put(bp+0x25e8,scratch+0x1000);put(bp+0x1738,rows);put(bp+0x1740,int(transient));put(bp+0x1730,0)
            if transient:
                row_name=name.lower() if collision else b'Other';machine.mem_write(scratch+0x2000,row_name);put(rows+8,scratch+0x2000);put(rows+16,len(row_name))
            run(0x1458B5ECA)
            expected=0x31 if transient and collision else 0x34 if saved_count>=10 else None
            require((read('RDI')&255)==expected if expected is not None else read('RIP')==0x1458B6114,'Projected duplicate/permanent capacity order')
            vectors.append(dict(kind='create-startup-duplicate', permanent_count=saved_count, transient=transient, collision=collision, result=expected))

    backend=(ROOT/'crates/azeroth-survivors-re/src/stock_frontend.rs').read_text()
    glue=(ROOT/'crates/benilla-app/src/ui_script/glue_mgr.rs').read_text()
    if args.scope != 'names':
        for token in ['connection.close_logon()', 'if !connection.world_open {', 'if !connection.credentials {',
                      'connection.auth_open = false;', 'frontend.replies.clear();', '*connection = Connection::default();',
                      'LocalStockReply::RealmListUnavailable', 'connection.refresh(count)']:
            require(token in backend,'Live backend connection '+token)
        require('if menu.entering && !menu.in_run {' in backend and backend.count('cancel_pending_enter(&mut menu);') == 4,
                'Canceled link must disarm the deferred gameplay entry')
        require('ParkRequest::Realm(RealmRequest::Close) => Local::CloseLogon' in glue,'Close must not become Abandon')
        require('LocalStockReply::RealmListUnavailable => local_lists.push((Vec::new(), true))' in glue,'Missing normal failed-query consumer')
        require('GlueLogin::CloseLink => frontend.requests.push(Local::CloseLogon)' in glue,'Missing close-link forwarding')
    compact_backend=''.join(backend.split())
    for token in ['menu.backend_save.characters().len()', '&menu.backend_save,', 'menu.backend_save.create_roster_character(', 'menu.backend_save.remove_character(guid)']:
        require(token in compact_backend,'Backend account roster connection '+token)
    require('menu.save.'not in compact_backend,'Stock roster must not consume the frontend Save')
    menu_state=''.join((ROOT/'crates/azeroth-survivors-re/src/menu_state.rs').read_text().split())
    for method in ['select_roster_character','selected_roster_guid']:
        body=menu_state.split('fn'+method+'(',1)[1].split('pubfn',1)[0]
        require('.startup_character.iter().cloned().chain(self.backend_save.characters())'in body,'Login optional-first projection '+method)
    menu_source=(ROOT/'crates/azeroth-survivors-re/src/menu.rs').read_text()
    names_source=(ROOT/'crates/azeroth-survivors-re/src/hero_name.rs').read_text()
    save_source=(ROOT/'crates/azeroth-survivors-re/src/save.rs').read_text()
    if args.scope != 'lifecycle':
        for token in ['normalize_roster(value).ok()', '21.. => Err(0x47)', "value.contains(\"  \")", "capitalize = ch == ' ';", '(1..=18).contains(&count)', 'count < 20']:
            require(token in names_source, 'Live name contract '+token)
        require('Key::Space => crate::hero_name::append(&mut edited, \" \")' in menu_source, 'Explicit native Space key input')
        require('crate::hero_name::normalize_roster(name)' in save_source, 'Shared native name failure mapping')
        require('startup.into_iter().chain(rows.iter())' in save_source and 'startup.as_ref(),' in backend and 'let startup = menu.startup_character().cloned();' in backend, 'Projected transient-name duplicate check')
    output.parent.mkdir(parents=True,exist_ok=True)
    output.write_text(portable_json(dict(target=manifest['target'],scope=args.scope,native_vectors=vectors,seams=sorted(seams),source_guards='passed; these do not execute Rust',limits=manifest['limits']),indent=2)+'\n')
    print(f'{len(vectors)} current native {args.scope} boundary cases passed; {len(roles)} ranges rehashed; live source guards checked')


if __name__=='__main__':
    main()

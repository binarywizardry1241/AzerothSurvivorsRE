#!/usr/bin/env python3
"""Replay current updater/lifecycle contracts without builds, networking or games."""
from script_sources import load_script
import argparse
import ast
import hashlib
import importlib.util
import json
import struct
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED = ROOT / 'docs/analysis/evidence/0.109.0/updater'
STAGED = ROOT / 'runtime/native-evidence/0.109.0/updater'
WORK = ROOT / 'runtime/menu-lifecycle-0.109.0/updater-current'


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def eligibility(data, pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    scratch, stack, done = 0x200000000, 0x300000000, 0x400000000
    for at, count in [(scratch, 0x10000), (stack, 0x10000), (done, 4096)]:
        u.mem_map(at, count)
    cursor = scratch + 0x1000

    def q(a):
        return struct.unpack('<Q', u.mem_read(a, 8))[0]

    def put(a, f, *v):
        u.mem_write(a, struct.pack('<' + f, *v))

    def get(n):
        return u.reg_read(getattr(r, 'UC_X86_REG_' + n))

    def setr(n, v):
        u.reg_write(getattr(r, 'UC_X86_REG_' + n), v)

    def owned(at, raw):
        nonlocal cursor
        a = cursor
        cursor += (len(raw) + 31) & ~15
        u.mem_write(a, raw or b'\0')
        put(at, 'QQQ', len(raw), a, len(raw))
        return a

    def hook(_, a, n, __):
        if a == done:
            u.emu_stop()
            return
        if a == 0x145bbd970:
            out = get('RCX')
            if setting is None:
                put(out, 'Q', 0xffffffffffffffff)
            else:
                owned(out + 8, setting.encode())
                put(out, 'Q', 0xfffffffffffffffe)
        elif a == 0x145bb4380:
            owned(get('RCX'), b'AzerothSurvivors.exe')
            put(get('RCX') + 24, 'Q', 0)
        elif a == 0x145ba71c0:
            ptr = owned(scratch + 0xf00, stem.encode())
            setr('RAX', ptr)
            setr('RDX', len(stem.encode()))
        elif a == 0x145bd5650:
            put(get('RCX'), 'QQQ', 0, get('RDX'), get('R8'))
        elif a == 0x140179390:
            left = bytes(u.mem_read(get('RCX'), get('RDX'))).decode()
            right = bytes(u.mem_read(get('R8'), get('R9'))).decode()
            assert right == 'AzerothSurvivors'
            setr('RAX', left.lower() == right.lower())
        elif a == 0x1400021d0:
            pass
        elif 0x140185a30 <= a < 0x140185bc7:
            return
        else:
            raise AssertionError(f'Unreviewed eligibility dependency {a:#x}')
        sp = get('RSP')
        setr('RIP', q(sp))
        setr('RSP', sp + 8)

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for setting in (None, '0', '1', 'false', '00'):
        for stem in ('AzerothSurvivors', 'AZEROTHSURVIVORS', 'AzerothSurvivorsRE', 'AzerothSurvivor', ''):
            cursor = scratch + 0x1000
            u.mem_write(scratch, bytes(0x9000))
            out, sp = scratch + 0x100, stack + 0x8000 - 8
            put(sp, 'Q', done)
            setr('RSP', sp)
            setr('RCX', out)
            u.emu_start(0x140185a30, done, count=500)
            assert get('RIP') == done
            accepted = q(out) != 0xffffffffffffffff
            assert accepted == (setting != '0' and stem.lower() == 'azerothsurvivors')
            cases.append(dict(setting=setting, stem=stem, accepted=accepted))
    return cases


def contracts(data, pe):
    mapping = json.loads((RETAINED / 'address-map.json').read_text())
    amap = {int(k, 16): int(v, 16) for k, v in mapping['addresses'].items()}
    for row in mapping['owners']:
        a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
        off = pe.rva_offset(a - pe.image_base)
        assert hashlib.sha256(data[off:off + b - a]).hexdigest() == row['sha256']
    # Only three stack locals changed in the current lifecycle fragment. Source
    # fields, stores and registers are independently recovered in current ASM.
    fixture = ROOT / 'scripts/native_updater.py'
    source = fixture.read_text().replace('put(bp + 0x100,', 'put(bp + 0xf0,').replace(
        'put(bp + 0x108,', 'put(bp + 0xf8,').replace('put(bp + 0x16c,', 'put(bp + 0x15c,')
    tree = ast.parse(source)
    tree.body = [n for n in tree.body if isinstance(n, (ast.Import, ast.ImportFrom))
                 or isinstance(n, ast.Assign) and isinstance(n.targets[0], ast.Name)
                 and n.targets[0].id in ('ROOT', 'SHA', 'SPANS')
                 or isinstance(n, ast.FunctionDef) and n.name in ('native_vectors', 'source_trace')]

    class Rebind(ast.NodeTransformer):
        def visit_Constant(self, n):
            if isinstance(n.value, int) and 0x140000000 <= n.value < 0x149000000:
                assert n.value in amap, f'Unrecovered updater fixture address {n.value:#x}'
                n.value = amap[n.value]
            return n

    namespace = {'__file__': str(fixture)}
    exec(compile(ast.fix_missing_locations(Rebind().visit(tree)), str(fixture), 'exec'), namespace)
    namespace['SHA'] = SHA
    result = namespace['native_vectors'](pe)
    namespace['source_trace']()
    assert result['case_count'] == 159
    result['eligibility'] = eligibility(data, pe)
    result['case_count'] += len(result['eligibility'])
    queries = []
    for path in sorted((WORK / 'rea').glob('*-procedure_pseudo_code.json')):
        v = json.loads(path.read_text())['response']['result']['structuredContent']
        queries.append(dict(operation=v['parameters'], evidence_id=v['evidence_id'],
                            analysis_profile=v['analysis_profile']['digest'],
                            subject_sha256=v['subject']['digest']['sha256']))
    if not queries and (RETAINED / 'manifest.json').exists():
        queries = json.loads((RETAINED / 'manifest.json').read_text())['ghidra']
    assert len(queries) == 21
    manifest = dict(target=dict(version='0.109.0', sha256=SHA), owners=mapping['owners'],
                    address_map_sha256=hashlib.sha256((RETAINED / 'address-map.json').read_bytes()).hexdigest(),
                    fixture_source_sha256=hashlib.sha256(fixture.read_bytes()).hexdigest(), ghidra=queries,
                    cases=184, limits=['159 selected original instruction cases stop/record calls;25 full eligibility cases use synthetic environment/path/UTF8/case-comparison/free results.',
                                      'Current full metadata/schema/version/start/stage/download/UI owners were independently compared and rebound. Current apply, eligibility, patch-schema and frontend producers were freshly reviewed through Ghidra and original operands.',
                                      'No compilation, Rust execution, OS files/environment, HTTP/TLS/gzip/hash worker, replacement/respawn, game or original/rebuilt comparison.'])
    return manifest, result, namespace['SPANS']


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--collect', action='store_true')
    mode.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=False)
    assert target['version'] == '0.109.0' and target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('native_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    manifest, vectors, spans = contracts(data, pe)
    if args.collect:
        STAGED.mkdir(parents=True, exist_ok=True)
        for name, value in [('manifest.json', manifest), ('native-vectors.json', vectors)]:
            (STAGED / name).write_text(encoded(value))
        sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
        from capstone import Cs, CS_ARCH_X86, CS_MODE_64
        decoder = Cs(CS_ARCH_X86, CS_MODE_64)
        for role, (a, b) in spans.items():
            off = pe.rva_offset(a - pe.image_base)
            raw = data[off:off + b - a]
            body = f'; 0.109.0 SHA256 {SHA}\n; {a:#x}..{b:#x} SHA256 {hashlib.sha256(raw).hexdigest()}\n'
            body += '\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}'.rstrip() for i in decoder.disasm(raw, a)) + '\n'
            (STAGED / (role + '.asm')).write_text(body)
    else:
        assert json.loads((RETAINED / 'manifest.json').read_text()) == manifest
        assert json.loads((RETAINED / 'native-vectors.json').read_text()) == vectors
    print('Verified 184 current native updater cases:159 UI/lifecycle/patch plus 25 eligibility; no build/network/game')


if __name__ == '__main__':
    main()

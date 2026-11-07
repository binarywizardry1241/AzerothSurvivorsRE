#!/usr/bin/env python3
"""Replay current language state, custom parser and lazy overrides without a build.

The historical fixture algorithms are shared through a checked AST address
rebinding. Every executed body is the installed 0.109.0 PE, not historical bytes.
The address map records independent instruction/operand revalidation; it is
never a blanket version offset. Native OS, allocation/hash and fixture storage
seams retain the historical tools' explicit scope.
"""
from script_sources import load_script
import argparse
import ast
import hashlib
import importlib.util
import json
import re
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED = ROOT / 'docs/analysis/evidence/localization'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/localization'
WORK = ROOT / 'runtime/analysis/history/interface/menu-lifecycle/969b671942c0'
FIXTURES = [('native_localization.py', 'native_vectors'),
            ('recover-locale-parser.py', 'replay'),
            ('recover-locale-overrides.py', 'replay')]


def encoded(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + '\n'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def fixture(name, function, address_map):
    """Share the checked, pure fixture body while leaving its old CLI unchanged."""
    path = ROOT / 'scripts' / name
    tree = ast.parse(path.read_text())
    # Select only imports/globals/helpers and the fixture. No historical target
    # guard, collector, old catalog assumptions or filesystem output executes.
    selected = [node for node in tree.body
                if isinstance(node, (ast.Import, ast.ImportFrom, ast.Assign))
                or isinstance(node, ast.FunctionDef) and node.name in (function, 'require')]
    if 'overrides' in name:
        main = next(node for node in tree.body if isinstance(node, ast.FunctionDef) and node.name == 'main')
        first = next(i for i, node in enumerate(main.body)
                     if isinstance(node, ast.Assign) and ast.unparse(node.targets[0]) == 'sys.path[:0]')
        last = next(i for i, node in enumerate(main.body)
                    if isinstance(node, ast.Assign) and ast.unparse(node.targets[0]) == 'manifest')
        body = main.body[first:last] + ast.parse(
            'return dict(vector_count=len(vectors), executed_instructions=instruction_count, vectors=vectors)').body
        selected.append(ast.FunctionDef(name='replay', args=ast.arguments(
            posonlyargs=[], args=[ast.arg(arg='data'), ast.arg(arg='pe')],
            kwonlyargs=[], kw_defaults=[], defaults=[]), body=body, decorator_list=[]))

    class Rebind(ast.NodeTransformer):
        def visit_Constant(self, node):
            if isinstance(node.value, int) and 0x140000000 <= node.value < 0x149000000:
                assert node.value in address_map, f'Unrecovered native fixture address {node.value:#x}'
                node.value = address_map[node.value]
            return node

    tree.body = selected
    tree = ast.fix_missing_locations(Rebind().visit(tree))
    namespace = {'__name__': 'native_fixture', '__file__': str(path)}
    exec(compile(tree, str(path), 'exec'), namespace)
    namespace['SHA'] = SHA
    return namespace, digest(path.read_bytes())


def collect(data, pe):
    mapping = json.loads((RETAINED / 'address-map.json').read_text())
    address_map = {int(k, 16): int(v, 16) for k, v in mapping['addresses'].items()}
    spans = {}
    for row in mapping['structural_revalidation']:
        start, count = int(row['new_start'], 16), row['size']
        off = pe.rva_offset(start - pe.image_base)
        assert digest(data[off:off + count]) == row['current_sha256'], 'Current locale body changed'
        for delta in range(count + 1):
            # Mapping internal fixture constants requires only their exact owner
            # offset; direct calls, RIP data and all external seams use explicit
            # independently recovered entries above.
            address_map.setdefault(int(row['old_start'], 16) + delta, start + delta)
        spans[hex(start)] = dict(start=hex(start), end_exclusive=hex(start + count),
                                byte_count=count, sha256=row['current_sha256'])
    # Unexecuted language file helpers remain individually hash-bound, with
    # current Ghidra recovery; disk operations are fixture seams in state replay.
    for start, end in [(0x1458eef30, 0x1458ef0a3), (0x1458f01c0, 0x1458f0315)]:
        off = pe.rva_offset(start - pe.image_base)
        spans[hex(start)] = dict(start=hex(start), end_exclusive=hex(end), byte_count=end - start,
                                sha256=digest(data[off:off + end - start]))
    results, source_hashes = {}, {}
    for index, (name, function) in enumerate(FIXTURES):
        namespace, source_hashes[name] = fixture(name, function, address_map)
        result = namespace[function](data, pe)
        if isinstance(result, tuple):
            result = dict(cases=result[0], executed_instructions=result[1])
        results[('language', 'parser', 'overrides')[index]] = result
    assert sum(len(results['language'][key]) for key in ('selection', 'startup', 'persistence', 'lookup')) == 129
    assert len(results['parser']['cases']) == 63 and results['overrides']['vector_count'] == 12
    source = (ROOT / 'crates/azeroth-survivors-re/src/localization.rs').read_text()
    parser = (ROOT / 'crates/azeroth-survivors-re/src/localization/catalogs.rs').read_text()
    for fragment in ['crate::save::native_base_directory()', 'base.join("language.txt")',
                     'translated.labels = self.catalogs[0].clone()',
                     'translated.labels.extend(self.catalogs[self.index].clone())']:
        assert fragment in source
    for fragment in ['[executable_directory, save_directory]', 'root.join("lang").join(format!("{code}.json"))',
                     'Ok(entries) => catalog.extend(entries)', "trim_start_matches('\\u{feff}')",
                     "if !key.starts_with('_')", 'self.hex()? & 0x3ff']:
        assert fragment in parser, fragment
    assert 'var_os("BENILLA_HOME")' not in source
    assert re.findall(r'include_str!\("\.\./assets/locales/([a-z]{2})\.json"\)', source) == namespace.get(
        'LANGUAGES', ['en', 'pl', 'cs', 'de', 'pt', 'es', 'fr', 'ro', 'tr', 'ru', 'uk', 'zh', 'ja', 'ko'])
    provenance = []
    for label in ('locale-core', 'locale-maps'):
        directory = WORK / label
        for path in sorted((directory / 'rea').glob('*-procedure_pseudo_code.json')):
            result = json.loads(path.read_text())['response']['result']['structuredContent']
            provenance.append(dict(owner=result['parameters']['procedure'], evidence_id=result['evidence_id'],
                                   analysis_profile=result['analysis_profile']['digest'],
                                   subject_sha256=digest((directory / 'input.bin').read_bytes())))
    if not provenance and (RETAINED / 'manifest.json').exists():
        provenance = json.loads((RETAINED / 'manifest.json').read_text())['ghidra']
    assert len(provenance) == 15, 'Current Ghidra recovery unavailable'
    manifest = dict(target=dict(version='0.109.0', sha256=SHA),
                    address_map_sha256=digest((RETAINED / 'address-map.json').read_bytes()),
                    fixture_source_sha256=source_hashes, native_ranges=spans,
                    ghidra=provenance, native_cases=204,
                    limits=['Original instructions with synthetic file/environment/path, Unicode-trim, allocation/copy, hashing/byte comparison, parser-result/map storage and diagnostic seams as declared by each reused fixture.',
                            'Parser/string/expect/hex execute independently; loader uses explicit parser results. Original callback/initializer traverse all fourteen current descriptors; actual HashMap insertion stores execute separately.',
                            'No compilation, Rust execution, native OS disk/environment calls, Bevy scheduling, game, rendering or original/rebuilt parity.'])
    return manifest, results


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
    manifest, vectors = collect(data, module.PE(data))
    destination = STAGED if args.collect else RETAINED
    if args.collect:
        destination.mkdir(parents=True, exist_ok=True)
        for name, value in [('manifest.json', manifest), ('native-vectors.json', vectors)]:
            (destination / name).write_text(encoded(value))
        sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
        from capstone import Cs, CS_ARCH_X86, CS_MODE_64
        decoder = Cs(CS_ARCH_X86, CS_MODE_64)
        for start, row in manifest['native_ranges'].items():
            start = int(start, 16)
            # Shared canonical data-directory extract belongs to saves-browser.
            if start == 0x1458ef170:
                continue
            off = module.PE(data).rva_offset(start - module.PE(data).image_base)
            raw = data[off:off + row['byte_count']]
            assembly = f'; 0.109.0 SHA256 {SHA}\n; {row["start"]}..{row["end_exclusive"]} SHA256 {row["sha256"]}\n'
            assembly += ''.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}'.rstrip() + '\n' for i in decoder.disasm(raw, start))
            (destination / f'{start:x}.asm').write_text(assembly)
    else:
        # Retained Ghidra metadata is sufficient after disposable imports are
        # removed; when present, collect also checks the original raw imports.
        assert json.loads((destination / 'manifest.json').read_text()) == manifest
        assert json.loads((destination / 'native-vectors.json').read_text()) == json.loads(encoded(vectors))
    print('Verified 204 current native locale cases:129 language,63 parser,12 loader/initializer/map')


if __name__ == '__main__':
    main()

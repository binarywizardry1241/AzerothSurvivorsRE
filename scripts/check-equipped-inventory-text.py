#!/usr/bin/env python3
"""Revalidate shared inventory stat/lore text against installed 0.113.2.

Reuse the reviewed historical fixture body with individually recovered native
addresses. Only selected current instructions execute; the historical CLI and
its evidence writes do not run. No compiler or game is launched.
"""
import argparse
import ast
import hashlib
import json

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
FIXTURE_SHA = 'dc86584441262a59ac8efac6aafe76eb48c6c7337a1cea9b50c8b522505f8971'
OUT = ROOT / 'docs/analysis/evidence/0.113.2/equipped-inventory/text.json'
# No blanket address delta: callers, imports and formatters were resolved
# separately from current PE instructions and compact formatting arguments.
ADDRESSES = {
    0x1459a0760: 0x14581e190, 0x1459a0969: 0x14581e399,
    0x145895e40: 0x145847c90, 0x145896fc5: 0x145848e15,
    0x1459a2e90: 0x1458237f0, 0x1459a31c1: 0x145823b21,
    0x1459a0970: 0x14581e3a0, 0x1459a0e10: 0x14581e840,
    0x145bfa0e7: 0x145cf998b, 0x145bfa10b: 0x145cf99df,
    0x145bfa111: 0x145cf99c1, 0x1458ec500: 0x145895720,
    0x1458ec4b0: 0x1458956d0, 0x1458ec8b0: 0x145895ad0,
    0x145bcce30: 0x145ccc6e0, 0x145bddbe0: 0x145cdd490,
    0x145bde8e0: 0x145cde190, 0x145bdf7d0: 0x145cdf080,
    # String ABI adapters retain these exact addresses in the current EXE.
    0x1400020c0: 0x1400020c0, 0x1400020e0: 0x1400020e0,
    0x140002200: 0x140002200, 0x1400021d0: 0x1400021d0,
    0x1400021c0: 0x1400021c0,
    # This branch is not reached by the current admitted vectors. Leave a
    # poison address, so future reachable uses fail before accepting old code.
    0x145bdb210: 0x4fffff000,
}
RANGES = [(0x14581e190, 0x14581e399), (0x145847c90, 0x145848e15),
          (0x1458237f0, 0x145823b21), (0x14581e3a0, 0x14581e840)]


def digest(blob):
    return hashlib.sha256(blob).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    path = ROOT / 'scripts/check-armory-text.py'
    assert digest(path.read_bytes()) == FIXTURE_SHA, 'Review changed shared fixture body'
    tree = ast.parse(path.read_text())
    end = next(i for i, node in enumerate(tree.body) if isinstance(node, ast.Assign)
               and ast.unparse(node.targets[0]) == '(bonus_start, bonus_end)')
    tree.body = [node for node in tree.body[:end]
                 if not (isinstance(node, ast.Assign)
                         and ast.unparse(node.targets[0]) in ['parser', 'args'])
                 and not (isinstance(node, ast.Expr)
                          and ast.unparse(node.value).startswith('parser.add_argument'))]

    class Rebind(ast.NodeTransformer):
        def visit_Constant(self, node):
            if node.value == '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0':
                node.value = SHA
            elif type(node.value) is int and 0x140000000 <= node.value < 0x149000000:
                assert node.value in ADDRESSES, f'Unreviewed address {node.value:#x}'
                node.value = ADDRESSES[node.value]
            return node

    namespace = {'__name__': 'inventory_text_fixture', '__file__': str(path)}
    exec(compile(ast.fix_missing_locations(Rebind().visit(tree)), str(path), 'exec'), namespace)
    historical = ROOT / 'docs/analysis/evidence/0.109.0/armory-pages'
    references = []
    for key, name in [('fixture', 'stat-text-fixtures.json'),
                      ('bonus_fixture', 'bonus-text-fixtures.json')]:
        fixture = historical / name
        assert namespace[key] == json.loads(fixture.read_text())['cases']
        references.append(dict(path=str(fixture.relative_to(ROOT)), sha256=digest(fixture.read_bytes())))
    old = json.loads((historical / 'stat-text-validation.json').read_text())
    for key, historical_key in [('results', 'languages'), ('bonus_results', 'bonus_languages'),
                                 ('lore_results', 'lore_languages')]:
        assert namespace[key] == old[historical_key]
    data = target_bytes(target)
    pe = load_script('inventory_text_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    ranges = []
    for start, end in RANGES:
        at = pe.rva_offset(start - pe.image_base)
        ranges.append(dict(address=hex(start), end_exclusive=hex(end), sha256=digest(data[at:at + end-start])))
    record = dict(target_sha256=SHA, shared_fixture_sha256=FIXTURE_SHA,
                  addresses={hex(k): hex(v) for k, v in ADDRESSES.items()}, ranges=ranges,
                  stat=namespace['results'], bonus=namespace['bonus_results'], lore=namespace['lore_results'],
                  mathematical_imports=namespace['imports'], historical_fixtures=references,
                  host_seams=['Fixture-owned allocation/copy/deallocation.',
                              'Current source locale lookup and placeholder substitution.',
                              'Decoded compact Rust string/number formatting with current formatter identities.',
                              'roundf/truncf from individually verified current IAT entries.'],
                  limits=['Original current text selection/arithmetic/composition executes; reviewed host services are seams.',
                          'Results match historical fixture values; the historical files retain their original target provenance.',
                          'No Rust, Lua VM, renderer, application or original/rebuilt parity comparison executes.'])
    if args.write:
        OUT.write_text(json.dumps(record, ensure_ascii=False, indent=2) + '\n')
    else:
        assert json.loads(OUT.read_text()) == record
    print('Passed 1722 stat, 1722 bonus and 5040 lore cases across14 locales; no compiler/game.')


if __name__ == '__main__':
    main()

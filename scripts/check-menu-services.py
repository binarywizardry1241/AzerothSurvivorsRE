#!/usr/bin/env python3
"""Verify current updater eligibility and selected owner bytes without OS/network/game.

Nineteen Ghidra queries are acquisition evidence, not nineteen completed behavioral
contracts. Only the eligibility controller executes here, with explicit synthetic
environment/path/UTF8/free seams and the actual current inline ASCII comparison.
"""
import ast
import hashlib
import json
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

KEEP = ROOT / 'docs/analysis/evidence/0.115.0/menu-services.json'
WORK = ROOT / 'runtime/analysis/history/interface/menu-17/868d56353f25'
SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
MAP = {0x140185a30:0x14002b020,0x140185bc7:0x14002b1d0,
       0x145bbd970:0x145cd7e70,0x145bb4380:0x145cce600,
       0x145ba71c0:0x145cc12a0,0x145bd5650:0x145cefb70}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.115.0'
    data = target_bytes(target)
    pe = load_script('menu_services_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    expected = json.loads(KEEP.read_text())
    assert expected['target']['sha256'] == SHA
    for owner in expected['owners']:
        a, b = int(owner['start'],16), int(owner['end'],16)
        at = pe.rva_offset(a-pe.image_base)
        assert at == int(owner['file_offset'],16)
        assert digest(data[at:at+b-a]) == owner['sha256']
    span = expected['raw_input_span']
    a, b = int(span['start'],16), int(span['end'],16)
    at = pe.rva_offset(a-pe.image_base)
    assert digest(data[at:at+b-a]) == span['sha256']
    fixture = ROOT / 'scripts/recover-updater.py'
    assert digest(fixture.read_bytes()) == expected['fixture_sha256']
    tree = ast.parse(fixture.read_text())
    tree.body = [n for n in tree.body if isinstance(n,(ast.Import,ast.ImportFrom)) or
                 isinstance(n,ast.FunctionDef) and n.name == 'eligibility']

    class Rebind(ast.NodeTransformer):
        def visit_Constant(self, node):
            if type(node.value) is int and node.value in MAP:
                node.value = MAP[node.value]
            return node

    namespace = {'__file__':str(fixture)}
    exec(compile(ast.fix_missing_locations(Rebind().visit(tree)),str(fixture),'exec'),namespace)
    cases = namespace['eligibility'](data,pe)
    assert cases == expected['eligibility_cases']
    source = (ROOT / 'crates/azeroth-survivors-re/src/update.rs').read_text()
    check = (ROOT / 'crates/azeroth-survivors-re/src/update_check.rs').read_text()
    assert 'update_setting != Some("0")' in source
    assert 'stem.eq_ignore_ascii_case("AzerothSurvivors")' in source
    assert 'eligible_executable' in check and 'WOW_ROGUE_UPDATE' in check
    assert expected['target_executed'] is False
    print('PASS:25 current native eligibility cases,19 selected owner hashes and live request gate; no OS/network/build/game')


if __name__ == '__main__':
    main()

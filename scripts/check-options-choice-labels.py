#!/usr/bin/env python3
"""Replay the current Options choice-label formatter; no compilation or game IO.

The complete original formatter runs with all three immutable choice-list
descriptors. The shared explicit fixture supplies heap/byte operations and
roundf; the original empty-registry English lookup runs unchanged.
"""
import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, file_sha256, latest_target

sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
               str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
import native_talent_fixture as native

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
RETAINED = ROOT / 'docs/analysis/evidence/options-choice-labels/cases.json'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/options-choice-labels/cases.json'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data, pe = native.data, native.pe
    machine = native.Machine()
    catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/options.json').read_text())
    rows, changed = [], 0
    values = [-math.inf, -1000., -.5, -0., 0., .49, .5, 1., 1.49, 1.5,
              2., 2.5, 1000., math.inf, math.nan]
    for index, row in enumerate(catalog['rows']):
        if row['control'] != 4:
            continue
        descriptor = 0x145dc2250 + index * 152
        count = len(row['choices'])
        assert count and machine.q(descriptor + 64) == 4
        assert machine.q(descriptor + 80) == count
        output = machine.alloc(24)
        for number in values:
            for register, value in [(native.UC_X86_REG_XMM2, row['range'][0]),
                                    (native.UC_X86_REG_XMM3, row['range'][1])]:
                machine.u.reg_write(register, int.from_bytes(struct.pack('<f', value), 'little'))
            bits = int.from_bytes(struct.pack('<f', number), 'little')
            machine.call(0x14012de80, output, descriptor + 64, stack=[bits])
            actual = bytes(machine.u.mem_read(machine.q(output + 8), machine.q(output + 16))).decode()
            # Native roundf followed by saturating float->usize and min(len-1).
            saturated = (0 if math.isnan(number) or number < 0 else
                         (1 << 64) - 1 if math.isinf(number) else math.floor(number + .5))
            selected = min(saturated, count - 1)
            assert actual == row['choices'][selected]['label'], (row['key'], bits, actual)
            previous_fell_back_to_raw_value = saturated >= count
            changed += int(previous_fell_back_to_raw_value)
            rows.append({'key': row['key'], 'descriptor': hex(descriptor),
                         'input_f32_bits': f'{bits:08x}', 'selected_index': selected,
                         'label': actual, 'previous_raw_value_fallback': previous_fell_back_to_raw_value})
    assert len(rows) == 45 and changed == 8
    source = (ROOT / 'crates/azeroth-survivors-re/src/options.rs').read_text()
    assert '.min(self.choices.len().saturating_sub(1))' in source
    assert '.map(|v| row.formatted(v))' in source
    first, last = 0x14012de80, 0x14012e2cb
    offset = pe.rva_offset(first - pe.image_base)
    result = {
        'target_sha256': SHA,
        'generator': {'path': 'scripts/check-options-choice-labels.py',
                      'sha256': file_sha256(ROOT / 'scripts/check-options-choice-labels.py')},
        'fixture': {'path': 'scripts/native_talent_fixture.py',
                    'sha256': file_sha256(ROOT / 'scripts/native_talent_fixture.py')},
        'formatter': {'va': hex(first), 'end_exclusive': hex(last),
                      'sha256': hashlib.sha256(data[offset:offset + last - first]).hexdigest()},
        'counts': {'native_cases': len(rows), 'choice_descriptors': 3,
                   'previous_source_mismatches': changed},
        'native_seams_used': [hex(address) for address in sorted(machine.seams)],
        'cases': rows,
        'limits': [
            'The complete original formatter executes with actual current immutable descriptor pointers.',
            'Shared fixture seams cover heap allocation/free, byte operations and roundf. Localization uses the original empty-registry English fallback.',
            'This does not prove arbitrary incoming control tags or mutable descriptor ancestry at other callers.',
            'The actual source UI calls the corrected Definition::formatted; source guards and syntax parsing do not execute Rust.',
            'No compilation, device/config IO, renderer, game process or original/rebuilt parity comparison.'
        ],
        'gap_ids': [41], 'application_executed': False,
        'rebuilt_code_executed': False, 'parity_verified': False,
    }
    if args.stage:
        STAGED.parent.mkdir(parents=True, exist_ok=True)
        STAGED.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    else:
        assert json.loads(RETAINED.read_text()) == result
    print(f'Passed {len(rows)} current Options choice-label cases; corrected {changed} prior source mismatches')


if __name__ == '__main__':
    main()

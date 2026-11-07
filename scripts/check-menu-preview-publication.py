#!/usr/bin/env python3
"""Replay current menu preview geometry and its nonzero publication gate.

Only bounded installed instructions execute. CRT roundf and the unused rotation
angle are explicit math seams. No game, compiler, renderer or rebuilt Rust runs.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import math
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT = 'docs/analysis/evidence/0.112.0/menu-preview-publication'
RANGES = [(0x1400fd6dd, 0x1400fd7e7), (0x1400fd801, 0x1400fd922)]


def f32(value):
    try:
        return struct.unpack('<f', struct.pack('<f', value))[0]
    except OverflowError:
        return math.copysign(math.inf, value)


def bits(value):
    return struct.pack('<f', value).hex()


def rounded(value):
    return value if not math.isfinite(value) else f32(math.copysign(math.floor(abs(value) + .5), value))


def uint(value):
    if math.isnan(value) or value <= 0:
        return 0
    return 0xffffffff if value >= 0xffffffff else int(value)


class Probe(EquipmentProbe):
    def hook(self, uc, pc, size, unused):
        if pc in [0x1400fd922, 0x1400fd927]:
            self.hit = pc
            self.native.emu_stop()
            return
        if pc in [0x145c0a447, 0x145c0a41d]:
            value = struct.unpack('<f', (self.reg('XMM0') & 0xffffffff).to_bytes(4, 'little'))[0]
            result = rounded(value) if pc == 0x145c0a41d else 0.
            self.reg('XMM0', int.from_bytes(struct.pack('<f', result), 'little'))
            sp = self.reg('RSP')
            self.reg('RSP', sp + 8)
            self.reg('RIP', self.q(sp))
            return
        return super().hook(uc, pc, size, unused)


def recover():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def span(start, end):
        at = pe.rva_offset(start - pe.image_base)
        assert at is not None
        return dict(va=hex(start), end_exclusive=hex(end), byte_count=end - start,
                    sha256=hashlib.sha256(data[at:at + end - start]).hexdigest())

    probe = Probe(data, pe, RANGES)
    node, matrix, frame, request = [probe.alloc(n) for n in [104, 32, 16, 192]]
    probe.native.mem_write(frame, struct.pack('<f', .61))
    canary = bytes(range(192))
    probe.native.mem_write(request, canary)
    matrices = [[1, 0, 0, 1], [2, 0, 0, 3], [0, 1, -1, 0], [-1, 0, 0, 1],
                [1, 0, 0, -1], [-1, 0, 0, -1], [0, 0, 0, 0],
                [math.nan, 0, 0, 1], [math.inf, 0, 0, 1], [.2, .3, .4, .5]]
    dimensions = [[124, 168], [0, 168], [124, 0], [0, 0], [2048.4, 4096.6],
                  [.49, .49], [.5, .5], [math.nan, 1], [1, math.nan], [-1, 20], [1e20, 1e20]]
    cases = []
    for mode, start in [('character', RANGES[0][0]), ('picker', RANGES[1][0])]:
        for values in matrices:
            values = list(map(f32, values))
            a, b, c, d = values
            determinant = f32(f32(a * d) - f32(b * c))
            sign = math.nan if math.isnan(determinant) else math.copysign(1, determinant)
            sx = f32(math.sqrt(f32(f32(a * a) + f32(b * b))) * sign)
            sy = f32(math.sqrt(f32(f32(c * c) + f32(d * d))))
            for width, height in dimensions:
                width, height = map(f32, [width, height])
                probe.native.mem_write(node + 48, struct.pack('<ff', width, height))
                probe.native.mem_write(matrix, struct.pack('<4f', *values))
                for register, value in [('RAX', node), ('RDX', matrix), ('RCX', request),
                                        ('RBP', frame), ('RSP', probe.STACK + 0x1f0000)]:
                    probe.reg(register, value)
                probe.hit = None
                probe.native.emu_start(start, 0, count=1000)
                physical = [uint(rounded(f32(width * sx))), uint(rounded(f32(height * sy)))]
                published = probe.hit == 0x1400fd922
                assert published == (min(physical) > 0), (mode, values, width, height, physical)
                if published:
                    actual = [probe.reg('R9') & 0xffffffff,
                              struct.unpack('<I', probe.native.mem_read(probe.reg('RSP') + 32, 4))[0]]
                    assert actual == physical
                    yaw = .61 if mode == 'character' else .35
                    aspect = f32(100 / 122) if mode == 'character' else f32(width / max(height, 1.))
                    assert (probe.reg('XMM1') & 0xffffffff).to_bytes(4, 'little').hex() == bits(yaw)
                    assert (probe.reg('XMM2') & 0xffffffff).to_bytes(4, 'little').hex() == bits(aspect)
                assert bytes(probe.native.mem_read(request, len(canary))) == canary
                cases.append(dict(mode=mode, matrix_bits=list(map(bits, values)),
                                  dimension_bits=[bits(width), bits(height)], published=published,
                                  physical=physical))
        probe.reg('RAX', 0)
        probe.reg('RSP', probe.STACK + 0x1f0000)
        probe.hit = None
        probe.native.emu_start(start, 0, count=100)
        assert probe.hit == 0x1400fd927
        cases.append(dict(mode=mode, missing_node=True, published=False))
    source = (ROOT / 'crates/azeroth-survivors-re/src/menu.rs').read_text()
    assert 'transform.matrix2.x_axis.length() * transform.matrix2.determinant().signum()' in source
    assert 'else if visible && preview.size != UVec2::ZERO' in source
    source = (ROOT / 'crates/azeroth-survivors-re/src/preview.rs').read_text()
    body = source.split('fn feed_engine_preview(', 1)[1].split('fn copy_engine_preview(', 1)[0]
    gate = 'preview.visible && world.pose.is_none() && (preview.size.x == 0 || preview.size.y == 0)'
    assert gate in body and body.index(gate) < body.index('let look =')
    return dict(target_sha256=SHA, publisher=span(0x1400fc450, 0x1400fd95d),
                geometry_ranges=[span(a, b) for a, b in RANGES], native_cases=len(cases),
                cases_sha256=hashlib.sha256(json.dumps(cases, separators=(',', ':')).encode()).hexdigest(),
                matrix_bits=[list(map(bits, v)) for v in matrices],
                dimension_bits=[list(map(bits, v)) for v in dimensions],
                published_cases=sum(c.get('published', False) for c in cases),
                native_instructions_executed=True, application_executed=False,
                rebuilt_code_executed=False, retained_request_canary_unchanged=True,
                seams=['CRT roundf is a ties-away f32 host seam; the unused atan2f result is zero.',
                       'Typed computed-node/affine query inputs enter at the two actual geometry branches.',
                       'Execution stops before request publication or at the no-publication epilogue.',
                       'The setter cap and complete booth dimension/withdrawal branches have one separate canonical current proof.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    record = recover()
    path = ROOT / ('runtime/analysis/staging/native-evidence/0.112.0/menu-preview-publication' if args.stage else OUT) / 'cases.json'
    if args.stage:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(record, indent=2) + '\n')
    else:
        assert json.loads(path.read_text()) == record
    print('Passed222 current native preview geometry/publication cases and source consumer checks')


if __name__ == '__main__':
    main()

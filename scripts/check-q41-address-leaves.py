#!/usr/bin/env python3
"""Check all newly exposed fixed-address entry candidates; never run/build code."""
from runtime_layout import retained_runtime_path
import argparse
import gzip
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from script_sources import load_script

sys.path.insert(0, str(ROOT/'runtime/tool-state/python/camera/python-libs'))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

SUMMARY = ROOT/'docs/analysis/evidence/0.113.2/native-operand-boundaries.json'
WORK = ROOT/'runtime/analysis/history/findings/q41-address-leaves/ef7c59e5f26b'
KEEP = ROOT/'docs/analysis/evidence/0.113.2/address-leaves'
SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('address_leaf_pe', ROOT/'scripts/inventory-executable.py').PE(image)
    summary = json.loads(SUMMARY.read_text())
    assert summary['target']['sha256'] == SHA
    for item in [summary['generator'], summary['source_census'], summary['diagnostic_input'],
                 summary['inventory'], summary['details'], *summary['generator_dependencies']]:
        assert file_sha256(retained_runtime_path(ROOT/item['path'], ROOT)) == item['sha256']
    details = json.loads((ROOT/summary['details']['path']).read_text())
    missing = {r['destination']: r for r in details['unowned_executable_address_candidates']
               if r['decode_status'] == 'not-observed'}
    assert len(missing) == summary['unowned_executable_candidates']['not_observed'] == 19
    inputs, seen = [], set()
    with gzip.open(ROOT/summary['inventory']['path'], 'rt') as stream:
        for text in stream:
            row = json.loads(text)
            if row['target'] in missing:
                site = int(row['site'], 16)
                at = pe.rva_offset(site-pe.image_base)
                raw = bytes.fromhex(row['instruction_bytes'])
                assert image[at:at+len(raw)] == raw
                inputs.append(row)
                seen.add(row['target'])
    assert seen == set(missing) and len(inputs) == 20
    observations = {}
    for path in sorted((WORK/'rea').glob('*procedure_info*.json')):
        evidence = json.loads(path.read_text())['response']['result']['structuredContent']
        profile = evidence['analysis_profile']
        observations[evidence['parameters']['procedure']] = dict(
            evidence_id=evidence['evidence_id'], provider=evidence['provider'],
            recorded_profile_digest=profile['digest'], result=evidence['normalized_result'])
    labels = {
        '0x144094d80': 'tag12/u32 carrier constructor; observed WGSL-parser context',
        '0x144094d90': 'tag11/u32 carrier constructor; observed WGSL-parser context',
        '0x1448e61d0': 'three-word argument forwarding into observed futures-lite I/O context',
        '0x14517fe00': 'NaN/infinite-unit-power guard followed by the external pow import',
        '0x1457ca250': 'u32 bitwise OR leaf; existing Lua math counterpart candidate',
        '0x1457ca260': 'u32 bitwise XOR leaf; existing Lua math counterpart candidate',
        '0x1457ca270': 'u32 bitwise AND leaf; existing Lua math counterpart candidate',
        '0x1457fb960': 'ASCII/Latin-1 lowercase codepoint mapping; existing Lua string counterpart',
        '0x1457fb980': 'ASCII/Latin-1 uppercase codepoint mapping; existing Lua string counterpart',
        '0x145af18c0': 'indirect formatting carrier; authentication labels in expanded decompilation',
    }
    for address in ['0x1457de290','0x1457de2d0','0x1457de2f0','0x1457de310','0x1457de350',
                    '0x1457de370','0x1457de390','0x1457de3d0','0x1457de3f0']:
        labels[address] = 'packed register/constant arithmetic-op carrier in observed Lua compiler'
    assert set(labels) == set(missing)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    leaves, assembly = [], []
    for address in sorted(missing, key=lambda s:int(s,16)):
        observed = observations[address]
        body = observed['result']['body']
        assert body['available'] and body['contains_entry']
        ranges = []
        for r in body['ranges']:
            a, b = int(r['start'],16), int(r['end'],16)+1
            at = pe.rva_offset(a-pe.image_base)
            raw = image[at:at+b-a]
            assert len(raw) == b-a
            ranges.append(dict(start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw).hexdigest()))
            # Keep the native external pow thunk in metadata, without duplicating
            # an import extract or interpreting the entire thunk-span as a body.
            if int(address,16) <= a < int(address,16)+256:
                instructions = list(decoder.disasm(raw,a))
                assert sum(i.size for i in instructions) == len(raw)
                assembly.extend(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions)
        leaves.append(dict(address=address,question='What is this formerly unobserved formed-address target?',
                           result=labels[address],state='classified bounded supporting interface',
                           AS_contract_established=False,actual_source_type_identity_verified=False,
                           original_decode_status=missing[address]['decode_status'],native_ranges=ranges,
                           ghidra=observed))
    locations = []
    for address, suffix in [(0x146935eb8,'front/wgsl/parse/mod.rs'),
                            (0x146ade1b0,'futures-lite-2.6.1/src/io.rs'),
                            (0x146c98390,'crates/benilla-lua/src/compile.rs')]:
        at = pe.rva_offset(address-pe.image_base)
        pointer, count = struct.unpack_from('<QQ',image,at)
        offset = pe.rva_offset(pointer-pe.image_base)
        raw = image[offset:offset+count]
        assert raw.decode('ascii').replace('\\','/').endswith(suffix)
        locations.append(dict(location_address=hex(address),path_address=hex(pointer),byte_count=count,
                              sha256=hashlib.sha256(raw).hexdigest(),portable_suffix=suffix))
    sources = [ROOT/'crates/benilla-lua/src'/name for name in ['compile.rs','proto.rs','lib_math.rs','lib_string.rs']]
    assert 'a & b' in sources[2].read_text() and '0xc0..=0xde' in sources[3].read_text()
    proof = dict(schema_version=1,target={k:target[k] for k in ['version','path','sha256','size_bytes']},
                 gap_ids=[41],lead_ids=['Q41-A01','Q41-U02','Q41-O01','Q41-M02','Q41-M03'],
                 operand_audit=commitment(SUMMARY),selected_operands=inputs,locations=locations,
                 leaves=leaves,source_counterpart_candidates=[commitment(p) for p in sources],
                 generator=commitment(Path(__file__).resolve()),
                 original_census_populations_unchanged=True,
                 limits=['The complete22,663,778-instruction fixed-operand domain supplies19 formerly unobserved destinations; all20 forming operands and19 fresh Ghidra entry/body observations are retained.',
                         'Seeded function entries are analyst candidates. Scoped new observations do not rewrite original full-image ownership, establish actual AS invocation, or recover arbitrary dynamic type/alias identities.',
                         'Source matches, library diagnostics, primitive instruction behavior and expanded decompilation establish bounded supporting context only. No AS mechanic or missing source operation is inferred.',
                         'Original19 missing-destination candidates remain in their committed audit populations. External calls, containing parsers, I/O/TLS and the surrounding engine are not reconstructed.',
                         'No compiler, application, source execution, OS/network/device or original/rebuilt parity comparison.'])
    text = ''.join(assembly)
    if args.stage:
        out = WORK/'staged';out.mkdir(exist_ok=True)
        (out/'contract.json').write_text(json_text(proof));(out/'leaves.asm').write_text(text)
    else:
        assert proof == json.loads((KEEP/'contract.json').read_text())
        assert text == (KEEP/'leaves.asm').read_text()
    print('Address leaves: all19 destinations/20 forming operands and current bytes pass; supporting context only. No AS source fix, build or game.')


if __name__ == '__main__':
    main()

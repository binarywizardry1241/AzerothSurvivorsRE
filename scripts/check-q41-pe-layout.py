#!/usr/bin/env python3
"""Reproduce bounded PE header/section-tail classification for Q41-B03/B05.

Fresh Ghidra observations are retained by Evidence ID and exact response hash.
No compiler, game, OS loader or DOS program is executed. Zero bytes and absent
static references do not establish padding or computed/dynamic unreachability.
"""
import argparse
import csv
import gzip
import hashlib
import json
import sqlite3
import struct
import sys

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script
from shared_native_inventory import open_readonly_uri as open_native_inventory

WORK = ROOT / 'runtime/q41-layout-0.113.2'
KEEP = ROOT / 'docs/analysis/evidence/0.113.2/pe-layout-classification.json'
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
    base = ROOT / 'runtime/coverage' / SHA
    pe = load_script('q41_layout_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    ledger = json.loads((base / 'file-ranges.json').read_text())
    assert ledger['target']['sha256'] == SHA
    rows = [dict(r) for r in ledger['ranges'] if r['lead_id'] in ['Q41-B03', 'Q41-B05']]
    assert len(rows) == 12
    for row in rows:
        raw = image[row['file_start']:row['file_end_exclusive']]
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        row['preferred_va_start'] = hex(pe.image_base + row.get('rva_start', row['file_start']))
        row['preferred_va_end_exclusive'] = hex(int(row['preferred_va_start'], 16) + len(raw))
        row['observed_references'] = []
        row['encoded_references'] = {}
        if row['lead_id'] == 'Q41-B03' or row['structural_class'] == 'header_slack_unknown':
            assert raw == bytes(len(raw))
            row['classification'] = 'supporting_zero_tail_or_slack_context_not_proven_padding'
        elif row['structural_class'] == 'dos_stub_unknown':
            row['classification'] = 'supporting_16bit_DOS_stub_and_Rich_metadata_context'
        else:
            row['classification'] = 'supporting_PE_header_format_context'
    references_path = ROOT / 'runtime/execheck-0.113.2/ghidra-comprehensive/references.tsv.gz'
    references = 0
    with gzip.open(references_path, 'rt') as stream:
        for ref in csv.DictReader(stream, delimiter='\t'):
            references += 1
            if ':' in ref['to']:
                continue
            address = int(ref['to'], 16)
            for row in rows:
                if int(row['preferred_va_start'], 16) <= address < int(row['preferred_va_end_exclusive'], 16):
                    row['observed_references'].append(ref)
                    break
    assert references == 3919777
    databases = [base / n for n in ['native-instructions.sqlite', 'unwind-complement.sqlite']]
    for path in databases:
        with open_native_inventory(f'file:{path}?mode=ro', uri=True) as db:
            for row in rows:
                row['encoded_references'][path.name] = [list(r) for r in db.execute(
                    'SELECT site,kind,target FROM refs WHERE target>=? AND target<? ORDER BY site,kind,target',
                    (row['preferred_va_start'], row['preferred_va_end_exclusive']))]
    assert sum(len(r['observed_references']) for r in rows) == 3
    assert [len(r['observed_references']) for r in rows] == [3] + [0] * 11
    assert all(not r['encoded_references'][p.name] for r in rows[1:] for p in databases)
    assert sum(len(r['encoded_references'][p.name]) for r in rows for p in databases) == 7
    # Format relationships are established by the actual header fields.
    assert image[:2] == b'MZ'
    pe_offset = struct.unpack_from('<I', image, 0x3c)[0]
    assert pe_offset == 0x108 and image[pe_offset:pe_offset + 4] == b'PE\0\0'
    machine, sections = struct.unpack_from('<HH', image, pe_offset + 4)
    optional_size = struct.unpack_from('<H', image, pe_offset + 20)[0]
    assert (machine, sections, optional_size) == (0x8664, 6, 240)
    optional = pe_offset + 24
    assert struct.unpack_from('<H', image, optional)[0] == 0x20b
    entry_rva, = struct.unpack_from('<I', image, optional + 16)
    assert entry_rva == 0x5cf8df4
    assert optional + optional_size + 40 * sections == 0x300
    assert struct.unpack_from('<I', image, optional + 60)[0] == 0x400
    # Decode only the actual stub prefix. The remaining bytes are not guessed code.
    sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16, CS_MODE_64
    stub = [dict(address=hex(i.address), bytes=bytes(i.bytes).hex(), mnemonic=i.mnemonic, operands=i.op_str)
            for i in Cs(CS_ARCH_X86, CS_MODE_16).disasm(image[0x40:0x4e], 0x40)]
    assert len(stub) == 7 and stub[-1]['mnemonic'] == 'int'
    message = b'This program cannot be run in DOS mode.\r\r\n$'
    assert image[0x4e:0x4e + len(message)] == message
    rich = image.index(b'Rich', 0x40, pe_offset)
    xor_key = struct.unpack_from('<I', image, rich + 4)[0]
    assert struct.unpack_from('<I', image, 0x80)[0] ^ xor_key == int.from_bytes(b'DanS', 'little')
    # The observed image-base reader validates MZ, PE and PE32+, then walks
    # section headers. This is a platform-format boundary; no engine is rebuilt.
    start, end = 0x145cf9054, 0x145cf90ec
    offset = pe.rva_offset(start - pe.image_base)
    reader = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(image[offset:offset + end-start], start))
    assert sum(i.size for i in reader) == end-start
    for address, mnemonic, operands in [(0x145cf905b, 'mov', 'eax, 0x5a4d'),
            (0x145cf907a, 'cmp', 'dword ptr [rcx], 0x4550'), (0x145cf9082, 'mov', 'eax, 0x20b')]:
        assert any(i.address == address and i.mnemonic == mnemonic and i.op_str == operands for i in reader)
    observations = []
    for path in sorted((WORK / 'rea-layout').glob('0*.json')):
        ev = json.loads(path.read_text()).get('response', {}).get('result', {}).get('structuredContent', {})
        if ev.get('operation') not in ['read_bytes', 'xrefs']:
            continue
        assert ev['subject']['digest']['sha256'] == SHA
        result = ev['normalized_result']
        if ev['operation'] == 'read_bytes':
            address = int(ev['parameters']['address'], 16)
            row = next(r for r in rows if int(r['preferred_va_start'], 16) == address)
            assert result['complete'] and result['bytes_hex'] == image[row['file_start']:row['file_end_exclusive']].hex()
            result = dict(complete=True, matched_original_interval_sha256=row['sha256'])
        observations.append(dict(evidence_id=ev['evidence_id'], operation=ev['operation'],
            parameters=ev['parameters'], result=result, response=commitment(path)))
    assert len(observations) == 36
    xrefs = {r['parameters']['address']: r['result'] for r in observations if r['operation'] == 'xrefs'}
    assert {k: v for k, v in xrefs.items() if v} == {
        '0x140000000': ['0x140000138', '0x145cc42a4', '0x145cf9060', '0x145cf9070'],
        '0x140000108': ['0x145cf907a'], '0x140000120': ['0x145cf9087'],
        '0x140000210': ['0x145cf90a7'], '0x140000300': ['0x145cf90a3'],
    }
    # The slack-start xref is a one-past-section-table address bound (LEA),
    # not a dereference of the zero slack bytes.
    assert any(i.address == 0x145cf90a3 and i.mnemonic == 'lea' and
               i.op_str == 'r9, [rdx + rcx*8]' for i in reader)
    result = dict(schema_version=1, target=target, lead_ids=['Q41-B03', 'Q41-B05'], gap_ids=[41],
        inputs=[commitment(p) for p in [base/'file-ranges.json', references_path, *databases]],
        intervals=rows, reference_records_examined=references,
        header=dict(pe_file_offset=pe_offset, machine=machine, sections=sections,
                    optional_header_bytes=optional_size, entry_preferred_va=hex(pe.image_base+entry_rva),
                    section_table_end_file_offset=0x300, size_of_headers=0x400,
                    slack_start_xref='0x145cf90a3 forms one-past-section-table bound, not slack-byte read',
                    dos_stub_instructions=stub, rich_file_offset=rich, rich_xor_key=hex(xor_key),
                    header_reader_extent=[hex(start), hex(end)],
                    header_reader_sha256=hashlib.sha256(image[offset:offset+end-start]).hexdigest()),
        ghidra_observations=observations, AS_contract_established=False, census_bytes_removed=0,
        limits=['Exact file-layout/reference classification only; no recovered AS source consumer or application defect.',
                'Five zero raw tails total1066 bytes; header zero slack totals256. Uniform bytes and no static references do not prove padding or dynamic unreachability.',
                'The full retained reference/encoded inventories are checked. Fresh Ghidra xrefs query interval endpoints only; its disabled analyzers do not establish whole-program alias closure.',
                'DOS prefix is decoded, not executed. Rich metadata boundary is observed; individual toolchain IDs/checksums are not reconstructed.',
                'Native reader classification stops at the PE-format/platform boundary. No engine/OS reconstruction, compilation, game, loader or parity validation.'])
    text = json.dumps(result, indent=2) + '\n'
    if args.stage:
        (WORK / 'pe-layout-classification.json').write_text(text)
    else:
        assert KEEP.read_text() == text
    print(json.dumps(dict(intervals=len(rows), original_reference_records=references,
                         tail_bytes=1066, header_bytes=1024, AS_contract_established=False)))


if __name__ == '__main__':
    main()

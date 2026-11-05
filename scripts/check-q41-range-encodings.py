#!/usr/bin/env python3
"""Classify exact Q41 residual encodings; never infer padding or reachability.

Default operation is read-only. --stage writes only ignored candidate evidence.
U01/U02 and U04 are independent overlapping inventories, never additive totals.
"""
import argparse
from bisect import bisect_right
import collections
import csv
import gzip
import hashlib
import json
from pathlib import Path
import sys

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, load_json, project_path
from script_sources import load_script

sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
import capstone
from shared_native_inventory import open_readonly_uri as open_native_inventory

PROOF = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
KEEP = ROOT / 'docs/analysis/evidence/0.113.2/residual-encodings.json'
WORK = ROOT / 'runtime/q41-all-0.113.2'


def encoding(raw, address, decoder):
    if raw and raw == b'\xcc' * len(raw):
        return 'uniform-INT3-encoding', len(raw)
    if raw and raw == b'\x90' * len(raw):
        return 'uniform-NOP-encoding', len(raw)
    instructions = list(decoder.disasm_lite(raw, address))
    if instructions and sum(row[1] for row in instructions) == len(raw) and all(
            row[2] in ('nop', 'int3') for row in instructions):
        return 'NOP-INT3-instruction-sequence', len(instructions)
    return 'mixed-unclassified', None


def complement_residuals(db):
    merged = []
    for a, b in db.execute('SELECT site,end FROM instructions ORDER BY site'):
        if merged and a <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(b, merged[-1][1]))
        else:
            merged.append((a, b))
    cursor = 0
    for a, b, category in db.execute('SELECT start,end,category FROM regions ORDER BY start'):
        while cursor < len(merged) and merged[cursor][1] <= a:
            cursor += 1
        j, pos = cursor, a
        while j < len(merged) and merged[j][0] < b:
            x, y = merged[j]
            if x > pos:
                yield pos, min(x, b), category
            pos = max(pos, min(b, y))
            j += 1
            if pos >= b:
                break
        if pos < b:
            yield pos, b, category


def selected_census_frontier(census_path, *, details=False):
    """Join every selected residual to the recorded static target populations."""
    target = latest_target(verify=True)
    identity = {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(target)
    native = load_script('range_encoding_pe', 'scripts/inventory-current-target.py')
    pe = native.pe_parser(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    inputs = {}

    def checked(record):
        path = project_path(record['path'])
        assert file_sha256(path) == record['sha256'], path
        inputs[record['path']] = record['sha256']
        return path

    def summary(path):
        path = project_path(path)
        value = load_json(checked({'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}))
        assert value['target'] == identity
        return value

    def rows(record):
        with gzip.open(checked(record), 'rt') as stream:
            yield from csv.DictReader(stream, delimiter='\t')

    census = summary(census_path)
    residual = summary(f"docs/analysis/evidence/{identity['version']}/native-residuals.json")
    assert census['independent_instructions']['exact_source_bytes_verified']
    inventory = census['independent_instructions']['executable_sections']
    ranges, counts, sizes = [], collections.Counter(), collections.Counter()
    for row in rows(inventory['range_inventory']):
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert pe.rva_offset(end - 1 - pe.image_base) == offset + end - start - 1
        raw = image[offset:offset + end - start]
        assert len(raw) == int(row['byte_count']) and hashlib.sha256(raw).hexdigest() == row['sha256']
        role, _ = encoding(raw, start, decoder)
        key = f"{row['location']}:{role}"
        counts[key] += 1
        sizes[key] += len(raw)
        ranges.append((start, end, key))
    ranges.sort()
    assert all(a[1] <= b[0] for a, b in zip(ranges, ranges[1:]))
    assert len(ranges) == inventory['unobserved_ranges'] and sum(sizes.values()) == inventory['unobserved_bytes']
    starts = [row[0] for row in ranges]
    hits = collections.defaultdict(list)

    def incoming(domain, kind, source, value):
        index = bisect_right(starts, value) - 1
        if index >= 0 and value < ranges[index][1]:
            hits[index].append((domain, kind, source, hex(value)))

    reference_counts = {}
    for domain, (source, dest, kind) in {
            'static': ('from', 'to', 'type'),
            'declared': ('site', 'target', 'kind'),
            'complement': ('site', 'target', 'kind'),
    }.items():
        record = residual['artifacts'][f'{domain}-reference-roles.tsv.gz']
        count = 0
        for row in rows(record):
            count += 1
            if row['destination_domain'] == 'executable':
                incoming(domain, row[kind], hex(int(row[source], 16)), int(row[dest], 16))
        assert count == record['rows']
        reference_counts[domain] = count

    relocations, _ = native.relocations(pe)
    for site, kind, target_va in relocations:
        if kind == 10 and target_va is not None:
            incoming('PE', 'DIR64', hex(pe.image_base + site), target_va)
    unwind = load_json(checked(census['unwind_handler_input']))
    guarded = load_json(checked(census['guarded_table_input']))
    assert unwind['target'] == guarded['target'] == identity
    for row in unwind['handlers']:
        incoming('PE', 'unwind-handler', row['handler_rva_field_va'], int(row['entry'], 16))
    for row in unwind['directory_entries']:
        incoming('PE', row['role'], row['metadata']['va'], int(row['entry'], 16))
    for table in guarded['tables']:
        for value in table['case_targets']:
            incoming('guarded', 'applied-case', table['site'], int(value, 16))

    addressed_prefixes = []
    for index, references in sorted(hits.items()):
        start, end, key = ranges[index]
        if not key.startswith('outside-declared:'):
            continue
        destinations = sorted({int(value, 16) for _, _, _, value in references})
        for address, bound in zip(destinations, [*destinations[1:], end]):
            offset = pe.rva_offset(address - pe.image_base)
            raw = image[offset:offset + bound - address]
            instructions = []
            for site, size, mnemonic, operands in decoder.disasm_lite(raw, address):
                instructions.append((site, size, mnemonic, operands))
                if mnemonic in ('jmp', 'ret', 'int3', 'ud2'):
                    break
            length = sum(row[1] for row in instructions)
            terminal = instructions[-1][2] if instructions else None
            if terminal not in ('jmp', 'ret', 'int3', 'ud2'):
                terminal = None
            prefix = dict(address=hex(address), bytes=raw[:length].hex(), terminal=terminal,
                          sources=sorted(row[2] for row in references if int(row[3], 16) == address))
            if raw.startswith(b'\x48\x8b\x09\xe9') and length == 8:
                prefix['role'] = 'dereference-rcx-and-tail-jump'
                prefix['tail_target'] = instructions[-1][3]
            addressed_prefixes.append(prefix)

    by_kind = collections.Counter(f'{domain}:{kind}' for values in hits.values() for domain, kind, *_ in values)
    hit_ranges = [dict(start=hex(ranges[index][0]), end_exclusive=hex(ranges[index][1]),
                       encoding=ranges[index][2], references=sorted(hits[index])) for index in sorted(hits)]
    hit_range_digest = hashlib.sha256(json.dumps(hit_ranges, separators=(',', ':')).encode()).hexdigest()
    result = dict(target=identity, gap_ids=[41], lead_ids=['Q41-B01'],
                generator=dict(path='scripts/check-q41-range-encodings.py', sha256=file_sha256(Path(__file__))),
                readers={name: file_sha256(ROOT / name) for name in (
                    'scripts/inventory-current-target.py', 'scripts/inventory-executable.py',
                    'scripts/coverage_common.py')},
                capstone_version=capstone.__version__, inputs=inputs, range_counts=dict(sorted(counts.items())),
                byte_counts=dict(sorted(sizes.items())), reference_counts=reference_counts,
                incoming_counts=dict(sorted(by_kind.items())), hit_range_count=len(hit_ranges),
                hit_ranges_by_encoding=dict(sorted(collections.Counter(row['encoding'] for row in hit_ranges).items())),
                hit_range_sha256=hit_range_digest, addressed_prefixes=addressed_prefixes,
                dynamic_entry_complete=False, padding_proven=False, source_ownership_complete=False)
    if details:
        result['ranges_with_incoming'] = hit_ranges
    return result


def addressed_formatter_frontier():
    """Check exact local callback operands at the selected formatter boundary."""
    from capstone.x86_const import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP

    target = latest_target(verify=True)
    evidence = ROOT / 'docs/analysis/evidence' / target['version']
    selection = load_json(evidence / 'addressed-formatters.json')
    source = evidence / 'executable-residual-frontier.json'
    assert file_sha256(source) == selection['residual_proof_sha256']
    proof = load_json(source)
    assert proof['target'] == {key: target[key] for key in proof['target']}
    pe = load_script('address_formatter_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    canonical = load_script('address_formatter_regs', 'scripts/classify-native-ownership.py').canonical_register
    project = load_script('address_formatter_projection', 'scripts/check-owned-custom-diagnostics.py').pointer_projection
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    starts = sorted(extents)
    code = {}

    def read(va, count):
        offset = pe.rva_offset(va - pe.image_base)
        assert pe.rva_offset(va + count - 1 - pe.image_base) == offset + count - 1
        return pe.data[offset:offset + count]

    def instructions(start):
        if start not in code:
            raw = read(start, extents[start] - start)
            code[start] = {insn.address: insn for insn in decoder.disasm(raw, start)}
            assert sum(insn.size for insn in code[start].values()) == len(raw)
        return code[start]

    def address_of(flow, register):
        for insn in reversed(flow):
            if register not in {canonical(insn.reg_name(r)) for r in insn.regs_access()[1]}:
                continue
            assert insn.operands[0].type == X86_OP_REG
            source = insn.operands[1]
            if insn.mnemonic == 'mov' and source.type == X86_OP_REG and source.size == 8:
                register = insn.reg_name(source.reg)
                continue
            assert insn.mnemonic == 'lea' and source.type == X86_OP_MEM and not source.mem.index
            base = insn.reg_name(source.mem.base)
            return base, source.mem.disp if base != 'rip' else insn.address + insn.size + source.mem.disp
        raise AssertionError(f'No verified base for {register}')

    for site_hex, mnemonic, operands in selection['interface_instructions']:
        site = int(site_hex, 16)
        insn = next(decoder.disasm(read(site, 15), site))
        assert (insn.mnemonic, insn.op_str) == (mnemonic, operands)
    debug = selection['debug_field']
    vtable = int(debug['vtable'], 16)
    assert int.from_bytes(read(vtable + debug['method_slot'], 8), 'little') == int(debug['method'], 16)

    reviewed, overwritten, counts = set(), set(), collections.Counter()
    for prefix in proof['addressed_prefixes']:
        if prefix.get('role') != 'dereference-rcx-and-tail-jump':
            continue
        entry = int(prefix['address'], 16)
        assert read(entry, 8).hex() == prefix['bytes']
        for source in prefix['sources']:
            site = int(source, 16)
            owner = starts[bisect_right(starts, site) - 1]
            decoded = instructions(owner)
            first = decoded[site]
            operand = first.operands[1]
            assert first.mnemonic == 'lea' and operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP
            assert site + first.size + operand.mem.disp == entry
            flow, seen = [], set()
            while site not in seen and len(flow) < 32:
                insn = decoded[site]
                flow.append(insn)
                seen.add(site)
                if insn.group(capstone.CS_GRP_CALL):
                    break
                assert not insn.group(capstone.CS_GRP_RET) and insn.mnemonic not in ('ud2', 'int3')
                if insn.group(capstone.CS_GRP_JUMP):
                    assert insn.mnemonic == 'jmp' and insn.operands[0].type == X86_OP_IMM
                    site = insn.operands[0].imm
                else:
                    site += insn.size
            call = flow[-1]
            assert call.mnemonic == 'call' and call.operands[0].type == X86_OP_IMM
            destination = hex(call.operands[0].imm)
            pointer = project(flow, canonical, capstone)
            assert not pointer['opaque_pointer_use'] and not pointer['unresolved_memory_alias']
            slots = {(row['base'], row['displacement']) for row in pointer['live_local_pointer_locations']}
            stale = selection['overwritten']
            if destination == stale['callee']:
                assert (hex(entry), hex(first.address), hex(call.address)) == (
                    stale['entry'], stale['source'], stale['first_call'])
                assert slots == {tuple(stale['slot'])}
                assert address_of(flow[:-1], 'rdx') == tuple(stale['rdx'])
                erase = decoded[int(stale['overwrite'], 16)]
                memory = erase.operands[0]
                assert memory.type == X86_OP_MEM and memory.access & capstone.CS_AC_WRITE
                assert erase.reg_name(memory.mem.base) == stale['slot'][0] and not memory.mem.index
                assert memory.mem.disp <= stale['slot'][1] <= memory.mem.disp + memory.size - 8
                overwritten.add(entry)
                continue
            base, offset = address_of(flow[:-1], selection['format_arguments'][destination])
            if destination == debug['entry']:
                assert address_of(flow[:-1], 'r8') == ('rip', vtable)
                store, = [insn for insn in flow if insn.mnemonic == 'mov' and
                          insn.operands[0].type == X86_OP_MEM and
                          insn.reg_name(insn.operands[0].mem.base) == base and
                          insn.operands[0].mem.disp == offset + debug['descriptor_field']]
                base, offset = address_of(flow[:flow.index(store)], store.reg_name(store.operands[1].reg))
            assert slots and all(slot_base == base and displacement >= offset + 8 and
                                 (displacement - offset) % 16 == 8 for slot_base, displacement in slots)
            counts[destination] += 1
            reviewed.add(entry)
    assert counts == selection['formatter_source_sites']
    assert len(reviewed) == selection['formatter_adapters'] and len(overwritten) == 1
    assert not reviewed & overwritten
    return dict(formatter_source_sites=dict(counts), formatter_adapters=len(reviewed),
                overwritten_on_normal_return=list(map(hex, sorted(overwritten))))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    current = ap.add_mutually_exclusive_group()
    current.add_argument('--census-summary', help='Print the selected-target executable residual and incoming-reference join')
    current.add_argument('--addressed-formatters', action='store_true',
                         help='Check the address-taken callback stores at the formatter boundary')
    ap.add_argument('--details', action='store_true', help='Include all incoming reference rows with --census-summary')
    args = ap.parse_args()
    if args.addressed_formatters:
        if args.stage or args.details:
            ap.error('--addressed-formatters only checks retained evidence')
        print(json.dumps(addressed_formatter_frontier(), indent=2))
        return
    if args.census_summary:
        if args.stage:
            ap.error('--stage is only for the historical encoding contract')
        print(json.dumps(selected_census_frontier(args.census_summary, details=args.details), indent=2))
        return
    if args.details:
        ap.error('--details requires --census-summary')
    target = latest_target(verify=True)
    assert target['sha256'] == '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    image = target_bytes(target)
    pe = load_script('residual_pe', 'scripts/inventory-executable.py').PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    proof = json.loads(PROOF.read_text())
    assert proof['target']['sha256'] == target['sha256']
    names = ['missing-executable-ranges.tsv.gz', 'unwind-complement.sqlite']
    inputs = {name: proof['inputs'][name] for name in names}
    for item in inputs.values():
        assert file_sha256(ROOT / item['path']) == item['sha256']

    # Counterexamples distinguish complete encoding from an arbitrary plausible decode.
    for raw, wanted in [(b'\xcc', 'uniform-INT3-encoding'), (b'\x90', 'uniform-NOP-encoding'),
            (bytes.fromhex('660f1f440000cc90'), 'NOP-INT3-instruction-sequence'),
            (bytes.fromhex('90c3'), 'mixed-unclassified'), (b'\xcc\x48', 'mixed-unclassified')]:
        assert encoding(raw, 0x1000, decoder)[0] == wanted

    def classify(rows, filename):
        counts, digest, original_digest = collections.Counter(), hashlib.sha256(), hashlib.sha256()
        output = (WORK / filename).open('w') if args.stage else None
        try:
            for a, b, location, category, expected_hash, original in rows:
                assert a < b
                offset = pe.rva_offset(a - pe.image_base)
                raw = image[offset:offset+b-a]
                assert len(raw) == b-a
                sha = hashlib.sha256(raw).hexdigest()
                if expected_hash is not None:
                    assert sha == expected_hash
                role, count = encoding(raw, a, decoder)
                encoded = json.dumps([hex(a), hex(b), location, category, sha, role, count], separators=(',', ':')) + '\n'
                digest.update(encoded.encode())
                original_digest.update((json.dumps(original, separators=(',', ':')) + '\n').encode())
                counts[location + ':' + role + ':ranges'] += 1
                counts[location + ':' + role + ':bytes'] += b-a
                if output:
                    output.write(encoded)
        finally:
            if output:
                output.close()
        return dict(result_sha256=digest.hexdigest(), original_selector_sha256=original_digest.hexdigest(),
            counts=dict(sorted(counts.items())), records=sum(v for k, v in counts.items() if k.endswith(':ranges')),
            bytes=sum(v for k, v in counts.items() if k.endswith(':bytes')))

    def ghidra_rows():
        with gzip.open(ROOT / inputs[names[0]]['path'], 'rt') as stream:
            for row in csv.DictReader(stream, delimiter='\t'):
                a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
                yield a, b, row['location'], row['category'], row['sha256'], [row[k] for k in
                    ['start', 'end_exclusive', 'byte_count', 'location', 'category', 'sha256']]

    ghidra = classify(ghidra_rows(), 'ghidra-residual-encodings.jsonl')
    assert (ghidra['records'], ghidra['bytes']) == (462533, 8480008)
    with open_native_inventory(f"file:{ROOT / inputs[names[1]]['path']}?mode=ro", uri=True) as db:
        rows = ((a, b, 'complement', category, None, [a, b, category]) for a, b, category in complement_residuals(db))
        complement = classify(rows, 'complement-residual-encodings.jsonl')
    assert (complement['records'], complement['bytes']) == (332690, 4819742)
    assert complement['original_selector_sha256'] == proof['selectors']['Q41-U04']['output_sha256']
    result = dict(schema_version=1, target={k: target[k] for k in ['version', 'path', 'sha256', 'size_bytes']},
        gap_ids=[41], lead_ids=['Q41-U01', 'Q41-U02', 'Q41-U04'],
        input_proof=dict(path=PROOF.relative_to(ROOT).as_posix(), sha256=file_sha256(PROOF)),
        inputs=inputs, capstone_version=capstone.__version__, ghidra_unobserved=ghidra,
        independent_complement=complement, boundary_counterexamples=5,
        limits=['Complete current residual inventories and PE bytes are read. Encoding is not semantic/source/AS ownership, padding, function entry or dynamic unreachability proof.',
            'NOP preserves fallthrough; INT3 traps if executed. Neither establishes whether a caller exists or whether later mutation occurs. Mixed intervals remain unclassified.',
            'The two inventories overlap and their byte/range totals must never be added. Original census and queue selectors/counts are preserved.',
            'No new engine reconstruction, source compilation, application/game execution or original/rebuilt parity comparison.'])
    encoded = json.dumps(result, indent=2) + '\n'
    if args.stage:
        (WORK / 'residual-encodings.json').write_text(encoded)
    else:
        assert KEEP.read_text() == encoded
    print(json.dumps(dict(ghidra_ranges=ghidra['records'], complement_ranges=complement['records'], parity_verified=False)))


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""Classify every mixed residual in declared extents with genuine AS Locations.

This is an original-byte/retained-inventory check, not a new Ghidra census or
semantic ownership proof. It never compiles or launches the target. A separate
inputs checkout is supported for a linked worktree sharing the primary store.
"""

import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
from pathlib import Path
import re
import struct
import sys


PREFIXES = ("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")
HISTORICAL_VERSION = "0.121.0"
DISPATCH_VERSION = "0.141.0"
DISPATCH_SHA256 = "6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa"

# Transfer, RIP-relative base load, cell count, comparison, conditional branch.
# The race accumulator is bounded by its complete descriptor producer.
REVIEWED_DISPATCHES = (
    (0x140372ECE, 0x140372EAF, 7, 0x140372EA5, 0x140372EA9),
    (0x140385DF7, 0x140385DDA, 7, 0x140385DD4, 0x140385DD8),
    (0x1403894FA, 0x1403894E4, 7, 0x1403894DE, 0x1403894E2),
    (0x145EA0B2A, 0x145EA0B0E, 23, 0x145EA0B05, 0x145EA0B08),
    (0x145EA0C38, 0x145EA0C2A, 94, 0x145EA0AF5, 0x145EA0AF8),
    (0x145EA1E59, 0x145EA1E4B, 89, 0x145EA1E2D, 0x145EA1E3E),
    (0x145EA40D5, 0x145EA3F96, 10, 0x145EA40AF, 0x145EA40B3),
    (0x145EB6CCF, 0x145EB6CBA, 6, 0x145EB6CAF, 0x145EB6CB1),
    (0x145F6C05B, 0x145F6C015, 12, None, None),
    (0x145FBF3C5, 0x145FBF3AF, 20, 0x145FBF39D, 0x145FBF3A7),
)
PREVIOUSLY_JOINED = frozenset({
    0x145DD8F0D, 0x145DD9080, 0x145E26778,
    0x145E269D2, 0x145E27318, 0x145F8D9C3,
})


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def address(value):
    return int(value, 16)


def check_jewelry_catalog(root, pe, image):
    path = Path("crates/azeroth-survivors-re/src/loot_rewards/catalog_01120.rs")
    source = (root / path).read_bytes()
    pattern = rb'key: "([^"]+)".*?base: f32::from_bits\(0x([0-9a-f]+)\),\s+tag: (\d+),\s+slot: (\d+)'
    source_rows = [(key, int(bits, 16), int(tag), int(slot))
                   for key, bits, tag, slot in re.findall(pattern, source, flags=re.DOTALL)]
    table = 0x1476F94E8
    start = pe.rva_offset(table - pe.image_base)
    raw = image[start:start + 0x678]
    native_rows = []
    for offset in range(0, len(raw), 0x48):
        key, length = struct.unpack_from("<QQ", raw, offset)
        key_start = pe.rva_offset(key - pe.image_base)
        bits, tag, slot = struct.unpack_from("<IBB", raw, offset + 0x40)
        stable_tag = 19 if tag == 6 else tag - 1 if tag > 6 else tag
        native_rows.append((image[key_start:key_start + length], bits, stable_tag, slot))
    assert len(native_rows) == len(source_rows) == 23 and source_rows == native_rows
    return dict(table=hex(table), file_offset=hex(start), table_sha256=digest(raw),
                matched_rows=len(native_rows), source=path.as_posix(), source_sha256=digest(source))


def check_racial_descriptors(root, pe, image, decoded, cell_count):
    def read(va, size):
        first = pe.rva_offset(va - pe.image_base)
        return image[first:first + size]

    path = Path("crates/azeroth-survivors-re/assets/run-entry-0.100.1.json")
    source = (root / path).read_bytes()
    races = json.loads(source)["races"]
    assert [row["native_id"] for row in races] == list(range(1, 9))
    assert decoded[0x145F6BC79].op_str == "al, 0xfe"
    assert decoded[0x145F6BC7B].op_str == "al, 6" and decoded[0x145F6BC7D].mnemonic == "jbe"
    assert decoded[0x145F6BC96].op_str == "al, 0xfe"
    assert decoded[0x145F6BC98].op_str == "al, 6" and decoded[0x145F6BC9A].mnemonic == "ja"
    assert decoded[0x145F6BFDF].op_str == "rax, qword ptr [rcx + 0x28]"
    assert decoded[0x145F6BFF0].op_str == "rcx, qword ptr [rcx + 0x20]"
    assert decoded[0x145F6BFF4].op_str == "rdx, [rcx + rax*8]"
    table, fallback = 0x147AF2CB0, 0x1473A1960
    native_rows = []
    lanes = ("health_multiplier", "damage_bonus", "cooldown_divisor", "move_bonus",
             "crit_bonus", "armor_bonus", "regeneration_bonus", "pickup_multiplier",
             "experience_multiplier", "gold_multiplier", "luck_bonus", "heal_on_kill")
    multiplicative = {0, 2, 7, 8, 9}
    table_bytes = read(table, 7 * 8)
    descriptors = [fallback, *struct.unpack("<7Q", table_bytes)]
    for descriptor, race in zip(descriptors, races, strict=True):
        rows, count = struct.unpack("<QQ", read(descriptor + 0x20, 16))
        pairs = list(struct.iter_unpack("<If", read(rows, count * 8)))
        assert len(pairs) == count and len({tag for tag, _ in pairs}) == count
        assert all(0 <= tag < cell_count for tag, _ in pairs)
        stats = dict(pairs)
        for tag, name in enumerate(lanes):
            value = stats.get(tag, 0.0) + (1.0 if tag in multiplicative else 0.0)
            assert struct.pack("<f", value) == struct.pack("<f", race[name]), (race["key"], name)
        native_rows.append(dict(native_id=race["native_id"], address=hex(descriptor),
                                row_tags=sorted(stats), rows_sha256=digest(read(rows, count * 8))))
    assert {tag for row in native_rows for tag in row["row_tags"]} == set(range(cell_count))
    return dict(table=hex(table), table_sha256=digest(table_bytes),
                source=path.as_posix(), source_sha256=digest(source), descriptors=native_rows)


def check_tls_cipher_adapter(pe, image, decoder):
    def read(va, count):
        offset = pe.rva_offset(va - pe.image_base)
        return image[offset:offset + count]

    def table(va, cells):
        raw = read(va, cells * 4)
        values = [va + delta for delta, in struct.iter_unpack("<i", raw)]
        return values, dict(address=hex(va), cells=cells, sha256=digest(raw))

    forward, forward_proof = table(0x147B28A84, 256)
    reverse, reverse_proof = table(0x147B29170, 377)
    assert len(set(reverse)) == len(reverse) == 377
    first, end = 0x14612B66B, 0x14612BB81
    known_leaves = set(range(first, end, 7))
    visited = set()
    for code, destination in enumerate(forward):
        if destination not in known_leaves:
            continue
        body = read(destination, 7)
        assert body[:2] == b"\x66\xb8" and body[4:] == b"\x89\xca\xc3"
        discriminant, = struct.unpack("<H", body[2:4])
        inverse = read(reverse[discriminant], 5)
        assert inverse == b"\x66\xb8" + struct.pack("<H", code) + b"\xc3"
        visited.add(destination)
    assert visited == known_leaves and len(visited) == 186
    second, stop = 0x14612BBB5, 0x14612C310
    instructions = list(decoder.disasm(read(second, stop - second), second))
    assert sum(insn.size for insn in instructions) == stop - second
    assert set(reverse) <= {insn.address for insn in instructions}
    assert read(reverse[0], 1) == b"\xc3" and read(reverse[376], 3) == b"\x89\xd0\xc3"
    assert all(read(va, 5).startswith(b"\x66\xb8") and read(va + 4, 1) == b"\xc3"
               for va in reverse[1:376])
    assert read(stop - 5, 5) == b"\xcc" * 5
    label = b"TLS_NULL_WITH_NULL_NULL"
    assert read(0x147B26B70, len(label)) == label
    return dict(forward_table=forward_proof, reverse_table=reverse_proof,
                inverse_pairs=len(visited), reverse_immediate_leaves=375,
                reverse_other_cases=2, reverse_trailing_traps=5)


def review_dispatch_frontier(root):
    import capstone
    from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP
    from coverage_common import latest_target, target_bytes
    from script_sources import load_script

    target = latest_target(verify=True)
    assert (target["version"], target["sha256"]) == (DISPATCH_VERSION, DISPATCH_SHA256)
    path = Path("docs/analysis/evidence/as-residual-ranges.json")
    proof_bytes = (root / path).read_bytes()
    proof = json.loads(proof_bytes)
    assert proof["target"] == {key: target[key] for key in proof["target"]}
    image = target_bytes(target)
    pe = load_script("residual_dispatch_pe", root / "scripts/inventory-executable.py").PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    pending = set(map(address, proof["reference_join"]["ranges_without_incoming_flow_evidence"]))
    assert PREVIOUSLY_JOINED <= pending
    extents = {}
    rows, joined, typed_joined = [], set(), set()
    for site, load_site, count, compare_site, branch_site in REVIEWED_DISPATCHES:
        extent = next(row for row in proof["extents"]
                      if address(row["declared_start"]) <= site < address(row["declared_end_exclusive"]))
        start, end = (address(extent[name]) for name in ("declared_start", "declared_end_exclusive"))
        if start not in extents:
            offset = pe.rva_offset(start - pe.image_base)
            raw = image[offset:offset + end - start]
            assert digest(raw) == extent["extent_sha256"]
            decoded = {insn.address: insn for insn in decoder.disasm(raw, start)}
            assert sum(insn.size for insn in decoded.values()) == end - start
            extents[start] = decoded
        decoded = extents[start]
        jump, load = decoded[site], decoded[load_site]
        assert jump.mnemonic == "jmp" and jump.operands[0].type == X86_OP_REG
        assert load.mnemonic == "lea" and load.operands[1].mem.base == X86_REG_RIP
        table = load.address + load.size + load.operands[1].mem.disp
        cell_load = next(insn for pc, insn in reversed(decoded.items())
                         if load_site < pc < site and insn.mnemonic == "movsxd"
                         and insn.operands[1].type == X86_OP_MEM)
        cell_operand = cell_load.operands[1].mem
        assert cell_operand.base == load.operands[0].reg and cell_operand.scale == 4
        assert cell_operand.disp == 0 and cell_load.operands[0].reg == jump.operands[0].reg
        addition = decoded[cell_load.address + cell_load.size]
        assert addition.mnemonic == "add"
        assert tuple(operand.reg for operand in addition.operands) == (
            jump.operands[0].reg, load.operands[0].reg)
        guard = None
        if compare_site is not None:
            compare, branch = decoded[compare_site], decoded[branch_site]
            assert compare.mnemonic == "cmp" and compare.operands[1].type == X86_OP_IMM
            assert compare.operands[1].imm == count - 1 and branch.mnemonic in {"ja", "jbe"}
            assert branch.operands[0].type == X86_OP_IMM
            guard = dict(compare=hex(compare_site), branch=hex(branch_site),
                         condition=branch.mnemonic, branch_target=hex(branch.operands[0].imm))
        offset = pe.rva_offset(table - pe.image_base)
        table_bytes = image[offset:offset + count * 4]
        targets = [table + delta for delta, in struct.iter_unpack("<i", table_bytes)]
        assert len(targets) == count and all(value in decoded for value in targets)
        if site == 0x145EB6CCF:
            rejection_codes = [decoded[value].operands[1].imm for value in targets]
            assert all(decoded[value].mnemonic == "mov" and decoded[value].op_str.startswith("r15b,")
                       for value in targets)
            assert rejection_codes == [0x45, 0x46, 0x47, 0x48, 0x4F, 0x50]
        if site == 0x145F6C05B:
            race_descriptors = check_racial_descriptors(root, pe, image, decoded, count)
        hits = {}
        for ordinal, begin, finish, *_ in extent["ranges"]:
            first, last = address(begin), address(finish)
            if first not in pending:
                continue
            cells = [index for index, target in enumerate(targets) if first <= target < last]
            if cells:
                hits[str(ordinal)] = cells
                if guard is not None:
                    joined.add(first)
                elif site == 0x145F6C05B:
                    typed_joined.add(first)
        assert hits, hex(site)
        rows.append(dict(site=hex(site), base_load=hex(load_site), guard=guard,
                         table=hex(table), file_offset=hex(offset), sha256=digest(table_bytes),
                         cells=count, distinct_destinations=len(set(targets)),
                         residual_cells_by_ordinal=hits))
    assert not joined & PREVIOUSLY_JOINED and not typed_joined & (joined | PREVIOUSLY_JOINED)
    return dict(target=proof["target"], lead_ids=["Q41-B01", "Q41-U01"],
                input=dict(path=path.as_posix(), sha256=digest(proof_bytes)),
                generator=dict(path="scripts/classify-as-residual-ranges.py",
                               sha256=digest(Path(__file__).read_bytes())),
                capstone_version=capstone.__version__,
                guarded_dispatch_joined=sorted(map(hex, joined)),
                typed_descriptor_joined=sorted(map(hex, typed_joined)),
                still_without_reviewed_entry=sorted(map(hex, pending - joined - typed_joined - PREVIOUSLY_JOINED)),
                dispatches=rows, jewelry_catalog=check_jewelry_catalog(root, pe, image),
                hero_name_rejection_codes=list(map(hex, rejection_codes)),
                race_descriptors=race_descriptors,
                tls_cipher_adapter=check_tls_cipher_adapter(pe, image, decoder),
                limits=["A selected table join establishes static entry geometry. "
                        "It does not prove full typed inputs, observed runtime reachability or source parity.",
                        "The race selector is proved by the exact fixed descriptor inputs, separately from "
                        "other stat, gear and conditional contribution paths."])


def check_entry_frontier(root):
    """Check exact encoded cells for the remainder of the AS Location selector."""
    import capstone
    from capstone.x86 import X86_OP_MEM, X86_OP_REG, X86_REG_RIP
    from coverage_common import latest_target, target_bytes
    from script_sources import load_script

    target = latest_target(verify=True)
    evidence = root / "docs/analysis/evidence"
    selection = json.loads((evidence / "as-residual-entry-frontier.json").read_text())
    assert selection["target"] == {key: target[key] for key in selection["target"]}
    records = {}
    for name, expected in selection["inputs"].items():
        raw = (evidence / name).read_bytes()
        assert digest(raw) == expected, name
        records[name] = json.loads(raw)
        assert records[name]["target"] == selection["target"], name
    pending = set(records["as-residual-dispatch.json"]["still_without_reviewed_entry"])
    ranges = records["as-residual-ranges.json"]["extents"]
    image = target_bytes(target)
    pe = load_script("residual_entry_pe", root / "scripts/inventory-executable.py").PE(image)
    canonical_register = load_script("entry_registers", root / "scripts/classify-native-ownership.py").canonical_register
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True

    def read(start, count):
        offset = pe.rva_offset(start - pe.image_base)
        assert pe.rva_offset(start + count - 1 - pe.image_base) == offset + count - 1
        return image[offset:offset + count]

    entries = {}
    for ordinal, site_hex, load_hex, cell in selection["encoded_entries"]:
        assert ordinal not in entries and cell >= 0
        entries[ordinal] = address(site_hex), address(load_hex), cell
    checked = set()
    for extent in ranges:
        selected = [row for row in extent["ranges"] if row[1] in pending]
        if not selected:
            continue
        start, end = (address(extent[key]) for key in ("declared_start", "declared_end_exclusive"))
        raw = read(start, end - start)
        assert digest(raw) == extent["extent_sha256"]
        decoded = {insn.address: insn for insn in decoder.disasm(raw, start)}
        assert sum(insn.size for insn in decoded.values()) == len(raw)
        for ordinal, first_hex, last_hex, size, expected, *_ in selected:
            site, load_site, cell = entries[ordinal]
            first, last = address(first_hex), address(last_hex)
            assert last - first == size and digest(read(first, size)) == expected
            assert not first <= site < last
            load, jump = decoded[load_site], decoded[site]
            assert load.mnemonic == "lea" and jump.mnemonic == "jmp"
            assert jump.operands[0].type == X86_OP_REG
            assert load.operands[1].type == X86_OP_MEM and load.operands[1].mem.base == X86_REG_RIP
            base_reg, jump_reg = load.operands[0].reg, jump.operands[0].reg
            assert base_reg != jump_reg
            table = load.address + load.size + load.operands[1].mem.disp
            transfer = [insn for pc, insn in decoded.items() if load_site < pc < site]
            cell_load, = [insn for insn in transfer if insn.mnemonic == "movsxd"
                          and insn.operands[0].reg == jump_reg and insn.operands[1].type == X86_OP_MEM]
            cell_operand = cell_load.operands[1].mem
            assert (cell_operand.base, cell_operand.scale, cell_operand.disp) == (base_reg, 4, 0)
            assert cell_operand.index
            addition = decoded[cell_load.address + cell_load.size]
            assert addition.mnemonic == "add"
            assert tuple(operand.reg for operand in addition.operands) == (jump_reg, base_reg)
            for insn in transfer:
                assert not any(insn.group(group) for group in
                               (capstone.CS_GRP_CALL, capstone.CS_GRP_JUMP, capstone.CS_GRP_RET))
                if insn.address not in {cell_load.address, addition.address}:
                    writes = {canonical_register(insn.reg_name(reg)) for reg in insn.regs_access()[1]}
                    if insn.address < addition.address:
                        assert insn.reg_name(base_reg) not in writes, hex(insn.address)
                    if insn.address > cell_load.address:
                        assert insn.reg_name(jump_reg) not in writes, hex(insn.address)
            delta, = struct.unpack("<i", read(table + cell * 4, 4))
            destination = table + delta
            assert first <= destination < last and destination in decoded, hex(site)
            checked.add(ordinal)
    assert checked == entries.keys() and len(checked) == len(pending)
    return {"verified_encoded_entries": len(checked), "runtime_index_admission_inferred": False}


def join_reference_exports(receipt, artifacts, extents):
    ranges = sorted((address(row["start"]), address(row["end_exclusive"]), row)
                    for extent in extents for row in extent["ranges"])
    starts = [first for first, _, _ in ranges]
    counts = {}
    with_static_entry = set()
    for domain in ("static", "declared", "complement"):
        name = domain + "-reference-roles.tsv.gz"
        record = artifacts[name]
        path = receipt(name, record)
        rows_read = 0
        kinds, entered = Counter(), set()
        with gzip.open(path, "rt") as stream:
            for row in csv.DictReader(stream, delimiter="\t"):
                rows_read += 1
                source, destination, kind = ((row["from"], row["to"], row["type"]) if domain == "static"
                                             else (row["site"], row["target"], row["kind"]))
                if not destination or ":" in destination:
                    continue
                site, target = address(source), address(destination)
                index = bisect_right(starts, target) - 1
                if index < 0:
                    continue
                first, last, selected = ranges[index]
                if target >= last or first <= site < last:
                    continue
                kinds[kind] += 1
                entered.add(first)
                selected.setdefault("incoming_reference_exports", {}).setdefault(domain, []).append(row)
                if kind in {"UNCONDITIONAL_CALL", "UNCONDITIONAL_JUMP", "CONDITIONAL_JUMP",
                            "call_direct", "jump_direct"}:
                    with_static_entry.add(first)
        assert rows_read == record["rows"]
        counts[domain] = dict(rows_read=rows_read, entered_ranges=len(entered), reference_kinds=dict(sorted(kinds.items())))
    lacking = [hex(first) for first, _, row in ranges
               if first not in with_static_entry and not row["direct_incoming_from_same_declared_extent"]
               and not row["guarded_table_target_observations"]]
    lacking_starts = set(lacking)
    return dict(exports=counts, ranges_without_incoming_flow_evidence=lacking,
                immediate_predecessors={row["start"]: row["previous_instruction"]
                                        for _, _, row in ranges if row["start"] in lacking_starts})


def derive(root, *, writing=False):
    sys.path.insert(0, str(root / "scripts"))
    import capstone
    from capstone.x86 import X86_OP_IMM
    from artifact_history import has_archived_artifact
    from coverage_common import latest_target, project_bytes, same_artifact, target_bytes
    from script_sources import load_script

    target = latest_target(verify=True)
    version = target["version"]
    historical = version == HISTORICAL_VERSION
    evidence = "docs/analysis/evidence"
    retained_inputs = {}
    if not writing:
        recorded_evidence = f"{evidence}/{version}" if historical else evidence
        retained_inputs = json.loads(project_bytes(
            f"{recorded_evidence}/as-residual-ranges.json", root=root))["inputs"]
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("residual_range_pe", root / "scripts/inventory-executable.py").PE(image)
    inputs = {}

    def receipt(name, record):
        path = root / record["path"]
        assert path.resolve().is_relative_to(root.resolve()), path
        raw = path.read_bytes()
        assert digest(raw) == record["sha256"], path
        inputs[name] = {"path": record["path"], "sha256": record["sha256"]}
        return path

    def source(name):
        raw = project_bytes(name, root=root)
        inputs[name] = {"path": name, "sha256": digest(raw)}
        return json.loads(raw)

    def evidence_source(name):
        current = f"{evidence}/{name}"
        previous = f"{evidence}/{version}/{name}"
        if historical or (previous in retained_inputs and has_archived_artifact(previous, root)
                          and same_artifact(previous, current, retained_inputs[previous]["sha256"], root)):
            return source(previous)
        return source(current)

    summary_name = "docs/analysis/coverage/full-image-selected.json"
    previous_summary = f"docs/analysis/coverage/full-image-selected-{version}.json"
    if historical:
        summary_name = f"docs/analysis/coverage/full-image-execheck-{version}.json"
    elif (previous_summary in retained_inputs and same_artifact(
            previous_summary, summary_name, retained_inputs[previous_summary]["sha256"], root)):
        summary_name = previous_summary
    summary = source(summary_name)
    residuals = evidence_source("native-residuals.json")
    assert summary["target"] == residuals["target"] == identity
    missing_path = receipt("missing-executable-ranges", summary["independent_instructions"]["executable_sections"]["range_inventory"])
    extent_path = receipt("declared-extent-roles", residuals["artifacts"]["declared-extent-roles.tsv.gz"])
    diagnostics_path = receipt("diagnostic-sites", residuals["artifacts"]["diagnostic-sites.jsonl.gz"])
    proposal_review = evidence_source("native-switch-proposal-review.json")
    assert proposal_review["target"] == identity
    proposal_input = next(row for row in proposal_review["inputs"] if row["path"].endswith("/guarded-proposals.json"))
    proposed = json.loads(receipt("guarded-proposals", proposal_input).read_text())
    applied = json.loads(receipt("applied-guarded-tables", summary["guarded_table_input"]).read_text())
    assert proposed["target"] == applied["target"] == identity
    applied_sites = {row["site"] for row in applied["tables"]}
    guarded_targets = []
    for table in proposed["tables"]:
        table_raw = image[address(table["file_offset"]):address(table["file_offset"]) + table["byte_count"]]
        assert digest(table_raw) == table["sha256"]
        assert [hex(address(table["relative_base"]) + value[0]) for value in struct.iter_unpack("<i", table_raw)] == table["case_targets"]
        for ordinal, destination in enumerate(table["case_targets"]):
            guarded_targets.append(dict(site=table["site"], target=destination, case_ordinal=ordinal,
                                        state="applied_in_selected_census" if table["site"] in applied_sites else "unapplied_guarded_proposal"))

    with gzip.open(extent_path, "rt") as stream:
        extents = [dict(row, first=address(row["start"]), last=address(row["end_exclusive"]))
                   for row in csv.DictReader(stream, delimiter="\t")]
    assert len(extents) == residuals["artifacts"]["declared-extent-roles.tsv.gz"]["rows"]
    starts = [row["first"] for row in extents]
    assert starts == sorted(starts) and len(set(starts)) == len(starts)

    def containing(site):
        index = bisect_right(starts, site) - 1
        return index if index >= 0 and site < extents[index]["last"] else None

    contexts, tokens = defaultdict(list), defaultdict(list)
    with gzip.open(diagnostics_path, "rt") as stream:
        for line in stream:
            row = json.loads(line)
            if not row["path"].startswith(PREFIXES):
                continue
            index = containing(address(row["instruction_address"]))
            if index is not None:
                (contexts if row["kind"] == "rust_location" else tokens)[index].append(row)

    selected, excluded_token_ranges, partial_overlaps = defaultdict(list), [], []
    context_indices = sorted(contexts)
    context_starts = [extents[index]["first"] for index in context_indices]
    selected_counts, selected_bytes = Counter(), Counter()
    with gzip.open(missing_path, "rt") as stream:
        for ordinal, row in enumerate(csv.DictReader(stream, delimiter="\t")):
            first, last = address(row["start"]), address(row["end_exclusive"])
            # Account for any range beginning before a selected context or
            # crossing its end before applying the wholly-contained selector.
            # A missing-range producer must not silently split/drop this case.
            scan = max(0, bisect_right(context_starts, first) - 1)
            partial_contexts = []
            while scan < len(context_indices) and context_starts[scan] < last:
                candidate = extents[context_indices[scan]]
                if candidate["last"] > first and not (candidate["first"] <= first and last <= candidate["last"]):
                    partial_contexts.append(dict(declared_start=hex(candidate["first"]),
                                                 declared_end_exclusive=hex(candidate["last"]),
                                                 overlap_start=hex(max(first, candidate["first"])),
                                                 overlap_end_exclusive=hex(min(last, candidate["last"]))))
                scan += 1
            if partial_contexts:
                partial_overlaps.append(dict(row, inventory_ordinal=ordinal, AS_location_extent_intersections=partial_contexts))
            index = containing(first)
            if index is None or last > extents[index]["last"]:
                continue
            if index in contexts:
                assert row["location"] == "declared"
                selected_counts[row["category"]] += 1
                selected_bytes[row["category"]] += int(row["byte_count"])
                if row["category"] == "mixed-unclassified":
                    selected[index].append(dict(row, inventory_ordinal=ordinal))
            elif index in tokens and row["category"] == "mixed-unclassified":
                excluded_token_ranges.append(dict(row, inventory_ordinal=ordinal,
                                                  declared_start=extents[index]["start"]))

    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True

    def raw(first, last):
        offset = pe.rva_offset(first - pe.image_base)
        assert pe.rva_offset(last - 1 - pe.image_base) == offset + last - first - 1
        return image[offset:offset + last - first]

    def instruction(row):
        return dict(site=hex(row.address), bytes=row.size,
                    mnemonic=row.mnemonic, operands=row.op_str)

    rows, instruction_total, decoded_bytes = [], 0, 0
    role_counts = Counter()
    predecessor_counts = Counter()
    incoming_counts = Counter()
    for index, ranges in selected.items():
        extent = extents[index]
        first, last = extent["first"], extent["last"]
        body = raw(first, last)
        decoded = list(decoder.disasm(body, first))
        # Linear native inventory already decodes every declared extent. Do not
        # silently use a partial linear decode to characterize a selected range.
        assert sum(row.size for row in decoded) == last - first, hex(first)
        by_start = {row.address: row for row in decoded}
        by_end = {row.address + row.size: row for row in decoded}
        flow = []
        for insn in decoded:
            if not (insn.group(capstone.CS_GRP_CALL) or insn.group(capstone.CS_GRP_JUMP)):
                continue
            target_value = insn.operands[0].imm if insn.operands and insn.operands[0].type == X86_OP_IMM else None
            item = dict(instruction(insn), target=hex(target_value) if target_value is not None else None)
            flow.append(item)
        extent_row = dict(declared_start=hex(first), declared_end_exclusive=hex(last),
                          extent_sha256=digest(body), linear_instruction_count=len(decoded),
                          AS_location_context=sorted({row["path"] for row in contexts[index]}),
                          context_is_not_semantic_ownership=True,
                          diagnostic_sites=[{key: row[key] for key in
                                             ("path", "source_line", "source_column", "instruction_address", "target_address")}
                                            for row in contexts[index]], ranges=[])
        for row in ranges:
            begin, end = address(row["start"]), address(row["end_exclusive"])
            value = raw(begin, end)
            assert digest(value) == row["sha256"]
            local = [item for item in decoded if begin <= item.address < end]
            assert local and local[0].address == begin and local[-1].address + local[-1].size == end
            assert any(item.mnemonic not in ("nop", "int3") for item in local)
            local_flow = [item for item in flow if begin <= address(item["site"]) < end]
            inbound = [item for item in flow if item["target"] is not None and
                       begin <= address(item["target"]) < end and
                       not begin <= address(item["site"]) < end]
            guarded_inbound = [item for item in guarded_targets if begin <= address(item["target"]) < end]
            assert all(address(item["target"]) in by_start for item in guarded_inbound)
            last_instruction = local[-1]
            role = ("terminal-trap-sequence" if last_instruction.mnemonic in ("ud2", "int3") else
                    "returning-sequence" if last_instruction.group(capstone.CS_GRP_RET) else
                    "branching-sequence" if last_instruction.group(capstone.CS_GRP_JUMP) else
                    "fallthrough-sequence")
            role_counts[role] += 1
            predecessor_counts[by_end[begin].mnemonic if begin in by_end else "extent-entry"] += 1
            if inbound:
                incoming_counts["range_with_direct_incoming_from_same_extent"] += 1
            if guarded_inbound:
                incoming_counts["range_with_guarded_table_target_candidate"] += 1
            if any(item["state"] == "unapplied_guarded_proposal" for item in guarded_inbound):
                incoming_counts["range_with_unapplied_table_target_candidate"] += 1
            if any(item["state"] == "applied_in_selected_census" for item in guarded_inbound):
                incoming_counts["range_with_applied_table_target_candidate"] += 1
            instruction_total += len(local)
            decoded_bytes += len(value)
            excerpt = [instruction(insn) for insn in local[:4]]
            if len(local) > 4:
                excerpt += [instruction(insn) for insn in local[-4:]]
            range_row = dict(inventory_ordinal=row["inventory_ordinal"], start=hex(begin), end_exclusive=hex(end),
                             byte_count=len(value), sha256=row["sha256"], instruction_count=len(local),
                             local_control_shape=role, boundary_excerpt=excerpt,
                             previous_instruction=instruction(by_end[begin]) if begin in by_end else None,
                             next_instruction=instruction(by_start[end]) if end in by_start else None,
                             direct_incoming_from_same_declared_extent=inbound,
                             guarded_table_target_observations=guarded_inbound,
                             calls_and_branches=local_flow,
                             wider_semantic_status="not_inferred_from_diagnostic_context")
            extent_row["ranges"].append(range_row)
        rows.append(extent_row)
    proof = dict(schema_version=1, target=identity, gap_ids=[41],
                lead_id=("Q41-U03:AS-Location-mixed-ranges" if historical else "Q41-U01:AS-Location-mixed-ranges"),
                inputs=inputs,
                generator={"path": "scripts/classify-as-residual-ranges.py", "sha256": digest(Path(__file__).read_bytes())},
                selection="Every missing executable mixed-unclassified row wholly inside a declared extent containing at least one rust_location reference whose path begins crates/wenilla-rogue/ or crates/wenilla-rogue-app/. Literal tokens alone are excluded.",
                decoder=dict(name="Capstone", version=capstone.__version__, architecture="x86-64", mode="linear whole-declared-extent original-byte decode"),
                counts=dict(AS_location_extents=len(contexts), selected_declared_extents=len(rows),
                            selected_mixed_ranges=sum(len(row["ranges"]) for row in rows),
                            selected_mixed_bytes=decoded_bytes, selected_mixed_instructions=instruction_total,
                            all_context_range_categories=dict(sorted(selected_counts.items())),
                            all_context_range_bytes=dict(sorted(selected_bytes.items())),
                            local_control_shapes=dict(sorted(role_counts.items())),
                            immediately_preceding_instructions=dict(sorted(predecessor_counts.items())),
                            incoming_context=dict(sorted(incoming_counts.items())),
                            literal_only_mixed_ranges=len(excluded_token_ranges),
                            partial_overlap_range_records=len(partial_overlaps)),
                partial_overlap_ranges=partial_overlaps,
                excluded_literal_only_ranges=excluded_token_ranges, extents=rows,
                limits=["Whole-extent linear boundaries/encodings and direct branch targets are static observations; they do not prove reachability or function ownership.",
                        "Only genuine AS rust_location context selects ranges. Such context does not assign every instruction a source mechanic or prove source omission.",
                        "No census/body counts are changed, no native application is executed, and no compilation, game/server operation or parity check is performed."])
    if not historical:
        proof["reference_join"] = join_reference_exports(receipt, residuals["artifacts"], rows)
    return proof


def main():
    checkout = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs-root", type=Path, default=checkout)
    parser.add_argument("--write", action="store_true")
    frontier = parser.add_mutually_exclusive_group()
    frontier.add_argument("--dispatch-frontier", action="store_true",
                          help="Check the 0.141.0 reviewed dispatch and residual-range joins")
    frontier.add_argument("--entry-frontier", action="store_true",
                          help="Check the exact encoded entries into the remaining AS residual ranges")
    args = parser.parse_args()
    if args.entry_frontier:
        if args.write:
            parser.error("--entry-frontier verifies retained inputs and does not write output")
        print(json.dumps(check_entry_frontier(args.inputs_root.resolve())))
        return
    if args.dispatch_frontier:
        result = review_dispatch_frontier(args.inputs_root.resolve())
        destination = checkout / "docs/analysis/evidence/as-residual-dispatch.json"
        if args.write:
            destination.write_text(json.dumps(result, indent=2) + "\n")
        else:
            from script_sources import recorded_input_matches
            retained = json.loads(destination.read_text())
            generator = retained["generator"]
            assert recorded_input_matches(generator["path"], generator["sha256"], checkout)
            result["generator"] = generator
            assert retained == result, "Retained dispatch frontier differs"
        print(json.dumps({"dispatches": len(result["dispatches"]),
                          "guarded_joins": len(result["guarded_dispatch_joined"]),
                          "typed_descriptor_joins": len(result["typed_descriptor_joined"]),
                          "open_entries": len(result["still_without_reviewed_entry"])}))
        return
    from coverage_common import project_bytes
    proof = derive(args.inputs_root.resolve(), writing=args.write)
    target = proof["target"]
    historical = target["version"] == HISTORICAL_VERSION
    evidence = checkout / "docs/analysis/evidence"
    destination = (evidence / HISTORICAL_VERSION if historical else evidence) / "as-residual-ranges.json"
    if historical or not args.write:
        from script_sources import recorded_input_matches
        prior_generator = json.loads(project_bytes(destination, root=checkout))["generator"]
        assert recorded_input_matches(prior_generator["path"], prior_generator["sha256"], checkout)
        proof["generator"] = prior_generator
    full_raw = (json.dumps(proof, ensure_ascii=False, separators=(",", ":")) + "\n").encode()
    detail_path = Path("runtime/coverage") / target["sha256"] / "as-residual-ranges/range-details.json"
    details = args.inputs_root.resolve() / detail_path
    compact = {key: value for key, value in proof.items() if key not in ("extents", "excluded_literal_only_ranges")}
    compact["detailed_inventory"] = dict(sha256=digest(full_raw), byte_count=len(full_raw))
    if historical:
        compact["detailed_inventory"]["path"] = detail_path.as_posix()
    compact["range_columns"] = ["inventory_ordinal", "start", "end_exclusive", "byte_count", "sha256", "instruction_count", "local_control_shape", "direct_incoming_same_extent", "applied_guarded_target_records", "unapplied_guarded_target_records"]
    compact["extents"] = [dict(declared_start=row["declared_start"], declared_end_exclusive=row["declared_end_exclusive"],
                               extent_sha256=row["extent_sha256"], AS_location_context=row["AS_location_context"],
                               ranges=[[item["inventory_ordinal"], item["start"], item["end_exclusive"], item["byte_count"], item["sha256"],
                                        item["instruction_count"], item["local_control_shape"], len(item["direct_incoming_from_same_declared_extent"]),
                                        sum(target["state"] == "applied_in_selected_census" for target in item["guarded_table_target_observations"]),
                                        sum(target["state"] == "unapplied_guarded_proposal" for target in item["guarded_table_target_observations"])]
                                       for item in row["ranges"]]) for row in proof["extents"]]
    compact["excluded_literal_only_range_ordinals"] = [row["inventory_ordinal"] for row in proof["excluded_literal_only_ranges"]]
    raw = json.dumps(compact, ensure_ascii=False, indent=2) + "\n"
    if args.write:
        assert not historical, "Frozen historical evidence is read-only"
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(raw)
    else:
        assert json.loads(project_bytes(destination, root=checkout)) == compact, "Retained range classification differs"
        if historical:
            assert details.read_bytes() == full_raw, "Retained detailed range inventory differs"
    print(json.dumps({"counts": proof["counts"], "reference_join": proof.get("reference_join")}, indent=2))


if __name__ == "__main__":
    main()

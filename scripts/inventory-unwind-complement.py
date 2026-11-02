#!/usr/bin/env python3
"""Account executable bytes outside unwind extents and follow encoded flow leads.

No speculative linear sweep, guessed indirect target, target execution or build.
The input leads are the hash-bound declared-extent decoder's observations, not
proof of reachability. All bytes outside decoded candidates remain explicit.
Default reads the summary; --write recreates the ignored SQLite inventory.
"""

import argparse
import bisect
from collections import Counter, deque
import hashlib
import importlib.util
from pathlib import Path
import re
import sqlite3
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes
from shared_native_inventory import open_readonly_uri as open_native_inventory, migrate_inventory

GENERATOR = "scripts/inventory-unwind-complement.py"
SUMMARY = ROOT / "docs/analysis/coverage/unwind-complement-summary.json"
LIMITS = [
    "Seeds are encoded direct-reference leads from a linear unwind census plus PE entry/export metadata; actual reachability and semantic function ownership are unknown.",
    "Only seeded file-backed executable complement bytes are decoded. Each instruction must fit one mapped complement region; invalid encodings, traps, returns, indirect jumps and boundary exits terminate that path.",
    "Conditional branches follow both encoded successors and calls follow their continuation without assuming that either executes. Register/indirect targets, exception flow, computed dispatch and unseeded code remain unknown.",
    "Uniform CC/zero/NOP and exact canonical x86 NOP/CC byte sequences are padding candidates, not proof of noncode. Decoded bytes may overlap candidate padding; only the residual partition is disjoint.",
    "An IAT slot match identifies an encoded imported-pointer transfer, not a runtime callee or the imported implementation. No global aliasing, source equivalence, system/changelog completion or parity is certified.",
    "Full-image Ghidra body/reference recovery and historical source-contract revalidation remain open under #41; this independent decoder does not replace them.",
]

# A byte grammar, not code discovery. Each token is a canonical <=15-byte
# no-op or INT3 encoding; arbitrary operands/LEAs/zero bytes are not admitted.
PADDING = re.compile(rb"(?:\xcc|\x66{0,14}\x90|\x66{0,6}\x2e?\x0f\x1f(?:\x00|\x40\x00|\x44\x00\x00|\x80\x00{4}|\x84\x00{5}))+")


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def mapped_regions(pe, gaps):
    """Partition virtual complement at raw-backed boundaries; never read raw slack."""
    result = []
    for start, end in gaps:
        owners = [s for s in pe.sections if pe.image_base + s["rva"] <= start < end
                  <= pe.image_base + s["rva"] + s["virtual_size"]]
        if len(owners) != 1:
            raise ValueError("Complement range lacks a unique virtual section")
        section = owners[0]
        base = pe.image_base + section["rva"]
        backed_end = base + min(section["raw_size"], section["virtual_size"])
        if start < backed_end:
            right = min(end, backed_end)
            offset = section["raw_offset"] + start - base
            raw = pe.data[offset:offset + right - start]
            if len(raw) != right - start:
                raise ValueError("Truncated executable section bytes")
            uniform = {0xCC: "uniform_cc_candidate", 0: "uniform_zero_candidate",
                       0x90: "uniform_nop_candidate"}.get(raw[0]) if raw.count(raw[:1]) == len(raw) else None
            category = uniform or ("x86_padding_sequence_candidate" if PADDING.fullmatch(raw) else "mixed_or_other")
            result.append(dict(start=start, end=right, file_offset=offset,
                               sha256=hashlib.sha256(raw).hexdigest(), category=category))
        if end > max(start, backed_end):
            result.append(dict(start=max(start, backed_end), end=end, file_offset=None,
                               sha256=None, category="virtual_zero_fill"))
    return result


class Regions:
    def __init__(self, rows):
        self.rows = rows
        self.starts = [row["start"] for row in rows]
        if any(a["end"] > b["start"] for a, b in zip(rows, rows[1:])):
            raise ValueError("Overlapping/unsorted complement mappings")

    def find(self, address):
        index = bisect.bisect_right(self.starts, address) - 1
        return self.rows[index] if index >= 0 and address < self.rows[index]["end"] else None


def trace(pe, regions, seeds, decoder, capstone, native):
    """Decode syntactic flow closure, retaining conflicting overlapping starts."""
    pending = deque(sorted(set(seeds)))
    decoded, references, stops = {}, [], []
    while pending:
        address = pending.popleft()
        while address not in decoded:
            region = regions.find(address)
            if region is None or region["file_offset"] is None:
                stops.append((address, "outside_file_backed_complement"))
                break
            offset = region["file_offset"] + address - region["start"]
            raw = pe.data[offset:offset + min(15, region["end"] - address)]
            instruction = next(decoder.disasm(raw, address, count=1), None)
            if instruction is None:
                stops.append((address, "invalid_or_boundary_truncated"))
                break
            following = address + instruction.size
            decoded[address] = (following, instruction.bytes.hex(), instruction.mnemonic, instruction.op_str)
            refs = native.instruction_references(instruction, capstone)
            references.extend((address, *row) for row in refs)
            for kind, target, operand, access in refs:
                if kind in ("call_direct", "jump_direct") and regions.find(target) is not None:
                    pending.append(target)
            if instruction.group(capstone.CS_GRP_RET) or instruction.group(capstone.CS_GRP_IRET):
                stops.append((address, "return"))
                break
            if instruction.group(capstone.CS_GRP_INT) or instruction.mnemonic in (
                    "int1", "ud0", "ud1", "ud2", "hlt", "sysret", "sysretq", "sysexit"):
                stops.append((address, "trap_or_privileged_exit"))
                break
            if instruction.id in (capstone.x86_const.X86_INS_JMP, capstone.x86_const.X86_INS_LJMP):
                stops.append((address, "jump_no_fallthrough"))
                break
            address = following
    return decoded, references, sorted(set(stops))


def merge(intervals):
    result = []
    for start, end in sorted(intervals):
        if not result or start > result[-1][1]:
            result.append([start, end])
        else:
            result[-1][1] = max(result[-1][1], end)
    return result


def residual_partition(rows, decoded):
    """A disjoint byte partition; overlaps never inflate decoded coverage."""
    intervals = merge((start, row[0]) for start, row in decoded.items())
    ends = [end for start, end in intervals]
    counts = Counter()
    for row in rows:
        start, end = row["start"], row["end"]
        index = bisect.bisect_right(ends, start)
        covered = 0
        while index < len(intervals) and intervals[index][0] < end:
            left, right = intervals[index]
            covered += min(end, right) - max(start, left)
            index += 1
        counts[row["category"]] += end - start - covered
    counts["decoded_candidate_bytes"] = sum(end - start for start, end in intervals)
    return dict(sorted(counts.items()))


def validate_input(summary, target, path):
    if any(summary.get("target", {}).get(key) != target[key]
           for key in ("version", "path", "sha256", "size_bytes")):
        raise ValueError("Declared instruction inventory belongs to another target")
    if (summary.get("declared_extent_pass_complete") is not True
            or summary["counts"]["pending_extents"] != 0
            or summary["counts"]["undecoded_suffix_bytes_summed"] != 0):
        raise ValueError("Complete declared instruction input required")
    if project_path(summary["inventory"]["path"]) != path or file_sha256(path) != summary["inventory"]["sha256"]:
        raise ValueError("Declared instruction inventory path/digest differs")
    for name, digest in ((summary["generator"]["path"], summary["generator"]["sha256"]),
                         ("scripts/inventory-executable.py", summary["generator"]["parser_sha256"])):
        if file_sha256(project_path(name)) != digest:
            raise ValueError("Declared instruction generator/parser differs")


def write_inventory(path, metadata, rows, seeds, decoded, refs, stops):
    pending = path.with_suffix(".pending.sqlite")
    if pending.exists():
        raise ValueError("An unfinished complement inventory exists; preserve/review it before rerunning")
    connection = sqlite3.connect(pending)
    try:
        connection.executescript("""
            CREATE TABLE metadata(value TEXT NOT NULL);
            CREATE TABLE regions(start INTEGER PRIMARY KEY,end INTEGER,file_offset INTEGER,sha256 TEXT,category TEXT);
            CREATE TABLE seeds(target INTEGER,source INTEGER,kind TEXT,source_bytes TEXT);
            CREATE INDEX seeds_target ON seeds(target);
            CREATE TABLE instructions(site INTEGER PRIMARY KEY,end INTEGER,bytes TEXT,mnemonic TEXT,operands TEXT);
            CREATE TABLE refs(site INTEGER,kind TEXT,target TEXT,operand INTEGER,access INTEGER);
            CREATE INDEX refs_target ON refs(target);
            CREATE TABLE stops(site INTEGER,reason TEXT);
        """)
        connection.execute("INSERT INTO metadata VALUES(?)", (json_text(metadata),))
        connection.executemany("INSERT INTO regions VALUES(?,?,?,?,?)",
                               ((r["start"],r["end"],r["file_offset"],r["sha256"],r["category"]) for r in rows))
        connection.executemany("INSERT INTO seeds VALUES(?,?,?,?)", seeds)
        connection.executemany("INSERT INTO instructions VALUES(?,?,?,?,?)", ((site,*r) for site,r in sorted(decoded.items())))
        connection.executemany("INSERT INTO refs VALUES(?,?,?,?,?)",
                               ((site,kind,hex(target) if target is not None else None,operand,access)
                                for site,kind,target,operand,access in refs))
        connection.executemany("INSERT INTO stops VALUES(?,?)", stops)
        connection.commit()
    finally:
        connection.close()
    pending.replace(path)


def run():
    import capstone
    target = latest_target(verify=True)
    source_paths = [ROOT / GENERATOR, ROOT / "scripts/inventory-native-instructions.py",
                    ROOT / "scripts/inventory-executable.py", ROOT / "scripts/inventory-current-target.py"]
    source_hashes = {path:file_sha256(path) for path in source_paths}
    native = module("complement_instructions", "scripts/inventory-native-instructions.py")
    pe = native.pe_module().pe_parser(target_bytes(target))
    records = pe.functions()
    gaps = native.outside_intervals(pe.sections, records, pe.image_base)
    rows = mapped_regions(pe, gaps)
    regions = Regions(rows)
    root = ROOT / "runtime/coverage" / target["sha256"]
    summary_path = ROOT / "docs/analysis/coverage/instruction-summary.json"
    summary_sha = file_sha256(summary_path)
    summary = load_json(summary_path)
    source = project_path(summary["inventory"]["path"])
    validate_input(summary, target, source)
    if sum(end-start for start,end in gaps) != summary["counts"]["executable_bytes_outside_unwind_extents"]:
        raise ValueError("Executable complement differs from declared census")
    seeds = []
    connection = open_native_inventory(source.as_uri() + "?mode=ro", uri=True)
    try:
        for site, raw, kind, value in connection.execute(
                "SELECT site,bytes,kind,target FROM refs WHERE kind IN ('call_direct','jump_direct')"):
            address = int(value, 16)
            if regions.find(address) is not None:
                seeds.append((address, site, kind, raw))
    finally:
        connection.close()
    metadata_seeds = [(pe.image_base + pe.u32(pe.optional + 16), None, "pe_entry", None)]
    metadata_seeds += [(pe.image_base + int(row["rva"], 16), None, "pe_export", None)
                       for row in native.pe_module().exports(pe) if not row["forwarder"]]
    seeds += [row for row in metadata_seeds if regions.find(row[0]) is not None]
    seeds.sort(key=lambda row: (row[0], row[1] or 0, row[2]))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    decoder.skipdata = False
    decoded, refs, stops = trace(pe, regions, (row[0] for row in seeds), decoder, capstone, native)
    partition = residual_partition(rows, decoded)
    ordered = sorted((start,row[0]) for start,row in decoded.items())
    union_bytes = sum(end-start for start,end in merge(ordered))
    slots = {int(row["iat_start_address"],16) + 8*i: (row["library"],name)
             for row in pe.imports() for i,name in enumerate(row["functions"])}
    transfers = [(site,target,*slots[target]) for site,kind,target,operand,access in refs
                 if kind == "memory" and target in slots and decoded[site][2] in ("jmp","call")]
    generator = dict(path=GENERATOR, sha256=source_hashes[ROOT / GENERATOR], decoder="Capstone",
                     decoder_version=capstone.__version__, helper_sha256=source_hashes[ROOT / "scripts/inventory-native-instructions.py"],
                     parser_sha256=source_hashes[ROOT / "scripts/inventory-executable.py"],
                     pe_helper_sha256=source_hashes[ROOT / "scripts/inventory-current-target.py"])
    metadata = dict(target={k:target[k] for k in ("version","path","sha256","size_bytes")}, generator=generator,
                    input_summary_sha256=summary_sha, input_inventory_sha256=summary["inventory"]["sha256"])
    database = root / "unwind-complement.sqlite"
    write_inventory(database, metadata, rows, seeds, decoded, refs, stops)
    # The expanded SQLite is only a publication intermediate. Keep all logical
    # rows and exact original bytes in the shared store before the summary binds
    # this path; future tasks query the same bounded indexed cache.
    migrate_inventory(database, root=ROOT, apply=True)
    # Detect updater/input drift before promoting any tracked result.
    target_bytes(target)
    if (file_sha256(summary_path) != summary_sha or file_sha256(source) != metadata["input_inventory_sha256"]
            or any(file_sha256(path) != digest for path,digest in source_hashes.items())):
        raise ValueError("Census tools or declared input changed during analysis; result not promoted")
    result = dict(schema_version=1, **metadata,
        inventory=dict(path=database.relative_to(ROOT).as_posix(),sha256=file_sha256(database),
                       regenerate="python3 -B scripts/inventory-unwind-complement.py --write"),
        counts=dict(complement_regions=len(gaps), mapped_regions=len(rows),
            executable_complement_bytes=sum(end-start for start,end in gaps),
            file_backed_bytes=sum(r["end"]-r["start"] for r in rows if r["file_offset"] is not None),
            virtual_zero_fill_bytes=sum(r["end"]-r["start"] for r in rows if r["file_offset"] is None),
            incoming_seed_leads=len(seeds), unique_seed_addresses=len({r[0] for r in seeds}),
            seed_kinds=dict(sorted(Counter(row[2] for row in seeds).items())),
            decoded_instruction_records=len(decoded), decoded_bytes_summed=sum(end-start for start,(end,*_) in decoded.items()),
            decoded_bytes_union=union_bytes, overlapping_decode_bytes=sum(end-start for start,(end,*_) in decoded.items())-union_bytes,
            reference_kinds=dict(sorted(Counter(row[1] for row in refs).items())),
            stop_reasons=dict(sorted(Counter(row[1] for row in stops).items())),
            imported_pointer_transfer_sites=len(transfers), imported_pointer_slots=len({row[1] for row in transfers})),
        residual_byte_partition=partition, byte_accounting_complete=True, seeded_flow_pass_complete=True,
        native_semantics_complete=False, parity_verified=False, gap_ids=[41], limits=LIMITS)
    SUMMARY.write_text(json_text(result))
    print(json_text(result))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    try:
        if args.write:
            run()
        else:
            target = latest_target(verify=True)
            summary = load_json(SUMMARY)
            if summary["target"]["sha256"] != target["sha256"]:
                raise ValueError("Complement summary belongs to another target")
            print(json_text(summary))
        return 0
    except (ValueError, OSError, KeyError, ImportError, sqlite3.Error) as error:
        print(f"Unwind complement census: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())

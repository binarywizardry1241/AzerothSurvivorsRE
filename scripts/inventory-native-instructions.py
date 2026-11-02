#!/usr/bin/env python3
"""Decode every declared AMD64 unwind extent, retaining static reference leads.

This supplements REA/Ghidra; a linear decode is neither a recovered function
body nor proof of reachability. No skip-data mode, guessed indirect targets,
compiler, target execution or dependency download is used. The compact tracked
summary commits an ignored SQLite inventory. --write starts/resumes that exact
target/tool/decoder inventory; --limit bounds one pass. Default is read-only.
"""

import argparse
import ctypes
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sqlite3
import sys
import tempfile
import time

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, target_bytes
from shared_native_inventory import DecodeCache, NativeWriter, decoder_contract

SUMMARY = ROOT / "docs/analysis/coverage/instruction-summary.json"
GENERATOR = "scripts/inventory-native-instructions.py"
LIMITS = [
    "Linear instructions start only at declared AMD64 unwind entries; extents are candidates, not semantic function ownership or proof that decoded bytes execute.",
    "Decoding stops at the first invalid/truncated instruction without skip-data recovery. Every remaining suffix and executable region outside declared extents stays explicit.",
    "Only immediate call/jump targets and statically addressed RIP-relative or absolute memory operands are retained. Address formation is separate from reads/writes; computed memory accesses and dispatch remain unresolved.",
    "An indirect call's static memory address is a pointer slot, never its resolved callee. Register targets, aliases, runtime pointers, data types and ID meanings remain unknown.",
    "Counts summed across unwind extents may overlap. Union byte counts remove overlaps but do not measure reachable code, native semantic recovery or reconstruction percentage.",
    "No system/claim recovery, source implementation, runtime validation or original/rebuilt parity is certified. Full-image REA/Ghidra analysis remains independently required under #41.",
]


def pe_module():
    spec = importlib.util.spec_from_file_location("instruction_pe", ROOT / "scripts/inventory-current-target.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def instruction_references(instruction, capstone):
    """Keep typed encoded references; never turn a pointer slot into a callee."""
    x86 = capstone.x86_const
    flow = ("call" if instruction.group(capstone.CS_GRP_CALL) else
            "jump" if instruction.group(capstone.CS_GRP_JUMP) else None)
    rows = []
    if flow:
        first = instruction.operands[0] if instruction.operands else None
        direct = first is not None and first.type == x86.X86_OP_IMM
        rows.append((flow + ("_direct" if direct else "_indirect"),
                     first.imm & ((1 << 64) - 1) if direct else None, 0, 0))
    for index, operand in enumerate(instruction.operands):
        if operand.type != x86.X86_OP_MEM:
            continue
        memory = operand.mem
        # FS/GS bases and indexed expressions cannot be resolved from encoding.
        if memory.segment or memory.index:
            continue
        if memory.base == x86.X86_REG_RIP:
            address = (instruction.address + instruction.size + memory.disp) & ((1 << 64) - 1)
        elif memory.base == 0:
            address = memory.disp & ((1 << (instruction.addr_size * 8)) - 1)
        else:
            continue
        kind = "address" if instruction.mnemonic == "lea" else "memory"
        rows.append((kind, address, index, 0 if kind == "address" else operand.access))
    return rows


class InstructionView:
    """Borrow Capstone 5's native detail until cs_free; never retain a pointer.

    CsInsn copies the entire architecture union and all operand structures per
    instruction. This narrow view uses the same pinned binding ABI and extracts
    only this census's fields. Returned reference rows contain copied values.
    """

    def __init__(self, raw):
        self.raw = raw
        self.address, self.size = raw.address, raw.size
        detail = raw.detail.contents
        x86 = detail.arch.x86
        self.groups = detail.groups[:detail.groups_count]
        self.operands = x86.operands[:x86.op_count]
        self.addr_size = x86.addr_size

    def group(self, value):
        return value in self.groups

    @property
    def mnemonic(self):
        return self.raw.mnemonic.decode("ascii")

    @property
    def bytes(self):
        return bytes(self.raw.bytes[:self.size])


def instructions(raw, address, decoder, capstone):
    # Explicit ABI gate; unfamiliar bindings keep their ordinary public path.
    if capstone.CS_API_MAJOR != 5:
        yield from decoder.disasm(raw, address)
        return
    pointer = ctypes.POINTER(capstone._cs_insn)()
    count = capstone._cs.cs_disasm(decoder.csh, raw, len(raw), address, 0, ctypes.byref(pointer))
    if not count:
        status = capstone._cs.cs_errno(decoder.csh)
        if status != capstone.CS_ERR_OK:
            raise capstone.CsError(status)
        return
    try:
        for index in range(count):
            yield InstructionView(pointer[index])
    finally:
        capstone._cs.cs_free(pointer, count)


def decode_extent(raw, address, decoder, capstone):
    decoded, count, refs = 0, 0, []
    for instruction in instructions(raw, address, decoder, capstone):
        if instruction.address != address + decoded or instruction.size < 1:
            raise ValueError("Non-contiguous decoder output")
        decoded += instruction.size
        count += 1
        for kind, target, operand, access in instruction_references(instruction, capstone):
            refs.append((instruction.address, instruction.bytes.hex(), kind,
                         hex(target) if target is not None else None, operand, access))
    return decoded, count, refs


def union_size(intervals):
    total, cursor = 0, -1
    for start, end in sorted(intervals):
        if end > max(start, cursor):
            total += end - max(start, cursor)
        cursor = max(cursor, end)
    return total


def outside_intervals(sections, records, image_base):
    """Retain executable virtual gaps, including any uninitialized tail."""
    merged = []
    for start, end, _ in sorted(records):
        if not merged or start > merged[-1][1]:
            merged.append([start, end])
        else:
            merged[-1][1] = max(merged[-1][1], end)
    result = []
    for section in sections:
        if not int(section["characteristics"], 16) & 0x20000000:
            continue
        start = section["rva"]
        end = start + section["virtual_size"]
        cursor = start
        for left, right in merged:
            if right <= cursor or left >= end:
                continue
            if left > cursor:
                result.append([image_base + cursor, image_base + min(left, end)])
            cursor = max(cursor, min(right, end))
        if cursor < end:
            result.append([image_base + cursor, image_base + end])
    return result


def open_inventory(path, metadata):
    connection = sqlite3.connect(path)
    try:
        connection.executescript("""
            CREATE TABLE IF NOT EXISTS metadata (id INTEGER PRIMARY KEY CHECK(id=1), value TEXT NOT NULL);
            CREATE TABLE IF NOT EXISTS extents (
                ordinal INTEGER PRIMARY KEY, start INTEGER, end INTEGER, file_offset INTEGER,
                sha256 TEXT, decoded_end INTEGER, instructions INTEGER);
            CREATE TABLE IF NOT EXISTS refs (
                extent INTEGER, site INTEGER, bytes TEXT, kind TEXT, target TEXT,
                operand INTEGER, access INTEGER);
            CREATE INDEX IF NOT EXISTS refs_target ON refs(target);
        """)
        saved = connection.execute("SELECT value FROM metadata WHERE id=1").fetchone()
        if saved is None:
            connection.execute("INSERT INTO metadata VALUES(1,?)", (json_text(metadata),))
            connection.commit()
        elif json.loads(saved[0]) != metadata:
            raise ValueError("Native instruction resume target/tool/decoder differs; use a fresh inventory")
        return connection
    except BaseException:
        connection.close()
        raise


def summarize(connection, target, database, generator, records, gaps):
    rows = connection.execute("SELECT start,end,decoded_end,instructions FROM extents ORDER BY ordinal").fetchall()
    counts = dict(unwind_extents=len(records), processed_extents=len(rows), pending_extents=len(records) - len(rows),
                  completely_decoded_extents=sum(end == decoded for start, end, decoded, count in rows),
                  extents_with_undecoded_suffix=sum(end != decoded for start, end, decoded, count in rows),
                  linear_instruction_records=sum(count for start, end, decoded, count in rows),
                  decoded_bytes_summed=sum(decoded - start for start, end, decoded, count in rows),
                  decoded_bytes_union=union_size((start, decoded) for start, end, decoded, count in rows),
                  undecoded_suffix_bytes_summed=sum(end - decoded for start, end, decoded, count in rows),
                  executable_bytes_outside_unwind_extents=sum(end - start for start, end in gaps),
                  reference_kinds=dict(connection.execute("SELECT kind,count(*) FROM refs GROUP BY kind ORDER BY kind")))
    return dict(schema_version=1, target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                generator=generator, inventory=dict(path=database.relative_to(ROOT).as_posix(),
                    sha256=file_sha256(database), regenerate="python3 -B scripts/inventory-native-instructions.py --write"),
                counts=counts, declared_extent_pass_complete=len(rows) == len(records),
                native_semantics_complete=False, parity_verified=False, gap_ids=[41], limits=LIMITS)


def publish_json(path, value):
    """Publish a changed JSON value atomically, preserving equal aliases/mtime."""
    path = Path(path)
    raw = json_text(value).encode()
    if path.exists() and path.read_bytes() == raw:
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, name = tempfile.mkstemp(prefix="." + path.name + "-", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(raw)
        os.replace(name, path)
    finally:
        Path(name).unlink(missing_ok=True)
    return True


def publish_metrics(value):
    name = os.environ.get("REA_STAGE_METRICS_PATH")
    if name:
        path = Path(name)
        if not path.is_absolute():path = ROOT / path
        if not path.resolve().is_relative_to(ROOT / "runtime"):
            raise ValueError("Stage metrics must remain in project runtime/")
        publish_json(path, value)


def run(args, capstone):
    began = time.perf_counter()
    target = latest_target(verify=True)
    root = ROOT / "runtime/coverage" / target["sha256"]
    root.mkdir(parents=True, exist_ok=True)
    image = target_bytes(target)
    parser = pe_module()
    pe = parser.pe_parser(image)
    records = pe.functions()
    generator = dict(path=GENERATOR, sha256=file_sha256(ROOT / GENERATOR), decoder="Capstone",
                     decoder_version=capstone.__version__, parser_sha256=file_sha256(ROOT / "scripts/inventory-executable.py"))
    metadata = dict(target_sha256=target["sha256"], generator=generator,
                    unwind_records_sha256=hashlib.sha256(json_text(records).encode()).hexdigest(),
                    decoder_contract=decoder_contract((ROOT / GENERATOR).read_text()))
    receipt_id = hashlib.sha256(json.dumps(metadata, sort_keys=True).encode()).hexdigest()[:16]
    database = ROOT / "runtime/analysis/inventories" / target["sha256"] / ("native-instructions-" + receipt_id + ".sqlite")
    connection = NativeWriter(database, metadata, root=ROOT, inherit_from=root / "native-instructions.sqlite")
    cache = DecodeCache(metadata["decoder_contract"], capstone.__version__, root=ROOT)
    decoded_extents = decoded_instructions = 0
    decode_seconds = 0.0
    try:
        saved = connection.execute("SELECT ordinal,start,end,file_offset,sha256 FROM extents ORDER BY ordinal").fetchall()
        for expected, (ordinal, start, end, offset, digest) in enumerate(saved):
            if ordinal != expected or (start, end) != tuple(pe.image_base + n for n in records[ordinal][:2]):
                raise ValueError("Native instruction resume range/order differs")
            if hashlib.sha256(image[offset:offset + end - start]).hexdigest() != digest:
                raise ValueError("Native instruction resume bytes differ")
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        decoder.skipdata = False
        stop = min(len(records), len(saved) + args.limit) if args.limit else len(records)
        for ordinal in range(len(saved), stop):
            start, end, _ = records[ordinal]
            offset = pe.rva_offset(start)
            if end <= start or pe.rva_offset(end - 1) != offset + end - start - 1:
                raise ValueError("Unwind extent crosses a non-contiguous file mapping")
            raw = image[offset:offset + end - start]
            if len(raw) != end - start:
                raise ValueError("Truncated unwind extent")
            address = pe.image_base + start
            raw_sha256 = hashlib.sha256(raw).hexdigest()
            reused = cache.lookup(raw_sha256, address, pe.image_base + end)
            if reused is None:
                started = time.perf_counter()
                decoded, count, refs = decode_extent(raw, address, decoder, capstone)
                decode_seconds += time.perf_counter() - started
                decoded_extents += 1;decoded_instructions += count
            else:
                decoded, count, refs = reused
            connection.store_extent((ordinal, address, pe.image_base + end, offset, raw_sha256, address + decoded, count), refs)
            if (ordinal + 1) % 1000 == 0:
                connection.commit()
                print(f"Decoded {ordinal + 1}/{len(records)} declared extents", flush=True)
        connection.commit()
        # Re-read immutable input identity before promoting a complete result.
        target_bytes(target)
        summary = summarize(connection, target, database, generator, records,
                            outside_intervals(pe.sections, records, pe.image_base))
        if summary["declared_extent_pass_complete"]:
            publish_json(SUMMARY, summary)
        publish_json(root / "native-instructions-progress.json", summary)
        publish_metrics({"stage":"native-instructions", "decode_cache":cache.metrics,
                         "decoded_extents":decoded_extents, "decoded_instructions":decoded_instructions,
                         "resumed_extents":len(saved), "total_extents":len(records),
                         "decode_wall_seconds":decode_seconds, "wall_seconds":time.perf_counter()-began})
        print(json_text(summary))
        return 0
    finally:
        cache.close()
        connection.close()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--limit", type=int, help="Maximum additional declared extents in this pass")
    args = parser.parse_args()
    try:
        if args.limit is not None and args.limit < 1:
            raise ValueError("Limit must be positive")
        if not args.write:
            target = latest_target(verify=True)
            progress = load_json(ROOT / "runtime/coverage" / target["sha256"] / "native-instructions-progress.json")
            if progress["target"]["sha256"] != target["sha256"]:
                raise ValueError("Native instruction progress belongs to another target")
            print(json_text(progress))
            return 0
        import capstone
        return run(args, capstone)
    except (ValueError, OSError, KeyError, sqlite3.Error, ImportError) as error:
        print(f"Native instruction census: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())

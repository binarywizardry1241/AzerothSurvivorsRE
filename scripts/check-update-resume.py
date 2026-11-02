#!/usr/bin/env python3
"""Verify the 0.123 updater resume contract without HTTP, installation or Rust execution.

Unicorn runs only retained original instruction blocks in synthetic memory.
The response Read interface is mocked; no game, server or application runs.
"""

from script_sources import current_path, recorded_input_matches
import argparse
import hashlib
import json
import platform
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.123.0/update-resume/manifest.json"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert {k: target[k] for k in proof["target"]} == proof["target"]
    assert proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("update_resume_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and sha(raw) == row["sha256"]
        if "assembly" in row:
            instructions = list(decoder.disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw)
            text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                           for i in instructions)
            assert receipt(row["assembly"]).read_text() == text
    for query in proof["queries"]:
        result = json.loads(receipt(query["result"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert receipt(query["canonical_extract"]).read_text() == native["normalized_result"]
        verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe)
    for source in proof["source_witnesses"]:
        receipt(source)
    rows = {r["role"]: r for r in proof["native_data"]}
    table = bytes.fromhex(rows["io-kind-debug-table"]["bytes_hex"])
    for kind, expected in [(0, "NotFound"), (35, "Interrupted"), (37, "UnexpectedEof"), (41, "Other")]:
        length, pointer = struct.unpack_from("<Q", table, kind * 8)[0], struct.unpack_from("<Q", table, 344 + kind * 8)[0]
        at = pe.rva_offset(pointer - pe.image_base)
        assert image[at:at + length].decode() == expected
    assert rows["range-format"]["bytes_hex"] == b"\x06bytes=\xc0\x01-\x00".hex()
    assert rows["range-header"]["bytes_hex"] == b"Range".hex()
    # Verify the two four-way guarded representation dispatches actually land
    # inside the retained owner, rather than trusting pseudocode's missing table.
    for role, expected in [("io-kind-dispatch", [0x140062099, 0x140062150, 0x140062160, 0x1400621e0]),
                           ("retry-kind-dispatch", [0x140062283, 0x1400622be, 0x140062292, 0x1400622b0])]:
        row = rows[role]
        base = int(row["virtual_address"], 16)
        assert [base + n for n in struct.unpack("<4i", bytes.fromhex(row["bytes_hex"]))] == expected
    return len(proof["queries"])


def native_cases(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine, mapped = Uc(UC_ARCH_X86, UC_MODE_64), set()

    def put(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, raw)

    for row in proof["native_ranges"] + proof["native_data"]:
        put(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    heap, stack, frame = 0x22000000, 0x23000000, 0x23010000
    put(heap, bytes(0x10000))
    put(stack, bytes(0x20000))
    mask = (1 << 64) - 1
    get = lambda address: struct.unpack("<Q", machine.mem_read(address, 8))[0]
    setq = lambda address, value: machine.mem_write(address, struct.pack("<Q", value & mask))
    mode, stops, result, read_steps, read_calls = None, set(), [], [], []

    def ret(first=0, second=0):
        machine.reg_write(reg.UC_X86_REG_RAX, first)
        machine.reg_write(reg.UC_X86_REG_RDX, second)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, get(sp))
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    read_function, sentinel = heap + 0xf000, stack + 0x1fff0
    put(read_function, b"\xc3")
    put(sentinel, b"\xc3")
    # The only outside call in the bounded discard fixture is stack probing.
    put(0x1460044e0, b"\xc3")

    def hook(uc, address, _size, _context):
        if mode == "discard" and address == read_function:
            buffer = uc.reg_read(reg.UC_X86_REG_RDX)
            capacity, filled = get(buffer + 8), get(buffer + 16)
            step = read_steps.pop(0) if read_steps else 0
            read_calls.append(capacity - filled)
            if step == "interrupted":
                ret((35 << 32) | 3)
            elif step == "error":
                ret((41 << 32) | 3)
            else:
                assert step <= capacity - filled
                setq(buffer + 16, filled + step)
                ret()
        elif mode == "discard" and address == 0x1460044e0:
            # Windows stack probe preserves the caller's allocation size in RAX.
            sp = uc.reg_read(reg.UC_X86_REG_RSP)
            uc.reg_write(reg.UC_X86_REG_RIP, get(sp))
            uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
        elif address in stops:
            result.append(address)
            uc.emu_stop()

    machine.hook_add(UC_HOOK_CODE, hook)

    def run(start, end, kind):
        nonlocal mode, stops
        mode, stops = kind, set(end)
        result.clear()
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x18000)
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        try:
            machine.emu_start(start, 0, count=10000)
        except Exception as error:
            raise AssertionError((kind, hex(machine.reg_read(reg.UC_X86_REG_RIP)),
                                  hex(machine.reg_read(reg.UC_X86_REG_RSP)), read_steps)) from error
        assert len(result) == 1, (kind, hex(start))
        return result[0]

    cases = 0
    for status in [400, 401, 404, 408, 429, 499, 500, 503, 599]:
        machine.mem_write(frame + 0x2d8, struct.pack("<H", status))
        run(0x140061fe7, [0x140062008], "request-status")
        assert machine.reg_read(reg.UC_X86_REG_RCX) == (41 if status == 429 or status >= 500 else 0)
        cases += 1
    for offset, length, count, premature in [(0, 3, 0, True), (2, 3, 0, True),
                                            (3, 3, 0, False), (4, 3, 0, False),
                                            (0, 3, 2, False)]:
        machine.reg_write(reg.UC_X86_REG_R12, offset)
        machine.reg_write(reg.UC_X86_REG_R15, length)
        setq(frame + 0x3a8, count)
        ended = run(0x140061f90, [0x140061fa1, 0x14006200a], "premature-eof")
        assert ended == (0x140061fa1 if premature else 0x14006200a)
        cases += 1
    for failures in range(10):
        machine.reg_write(reg.UC_X86_REG_RDI, heap)
        machine.mem_write(heap + 0x58, struct.pack("<I", failures))
        ended = run(0x140062255, [0x14006226d, 0x1400623e5], "budget")
        assert ended == (0x14006226d if failures + 1 <= 8 else 0x1400623e5)
        assert struct.unpack("<I", machine.mem_read(heap + 0x58, 4))[0] == failures + 1
        cases += 1
    for kind in [0, 1, 35, 37, 41, 42]:
        machine.reg_write(reg.UC_X86_REG_R12, (kind << 32) | 3)
        ended = run(0x1400621e0, [0x140062194, 0x1400621eb], "interrupt")
        assert ended == (0x140062194 if kind == 35 else 0x1400621eb)
        machine.reg_write(reg.UC_X86_REG_R15, (kind << 32) | 3)
        ended = run(0x1400622b0, [0x1400622cc, 0x1400623de], "retry-kind")
        assert ended == (0x1400623de if kind == 0 else 0x1400622cc)
        cases += 2
    for failures in range(1, 9):
        setq(frame + 0x368, heap + 0x58)
        machine.mem_write(heap + 0x58, struct.pack("<I", failures))
        run(0x140062322, [0x140062346], "backoff")
        assert machine.reg_read(reg.UC_X86_REG_RCX) == min(1 << failures, 20)
        assert machine.reg_read(reg.UC_X86_REG_RDX) == 0
        cases += 1
    for active, offset, done, count in [(1, 7, 10, 3), (1, mask - 1, mask, 3), (0, 7, 10, 3)]:
        setq(heap + 0x28, active)
        setq(heap + 0x40, offset)
        setq(heap + 0x20, heap + 0x100)
        setq(heap + 0x100, done)
        machine.mem_write(heap + 0x58, struct.pack("<I", 8))
        machine.reg_write(reg.UC_X86_REG_RDI, heap)
        machine.reg_write(reg.UC_X86_REG_R15, count)
        run(0x1400623f7, [0x140062416], "positive-read")
        assert get(heap + 0x40) == ((offset + count) & mask if active else offset)
        assert get(heap + 0x100) == (done + count) & mask
        assert machine.mem_read(heap + 0x58, 4) == bytes(4)
        cases += 1
    for amount, steps, expected, error in [(0, [], 0, False), (5, [3, 2], 5, False),
                                          (5, [3, 0], 3, False), (5, [3, "interrupted", 2], 5, False),
                                          (5, [3, "error"], (41 << 32) | 3, True)]:
        state, fat, vtable = heap + 0x200, heap + 0x300, heap + 0x400
        setq(state, fat)
        setq(state + 8, amount)
        setq(state + 16, amount)
        setq(fat, heap + 0x500)
        setq(fat + 8, vtable)
        setq(vtable + 0x48, read_function)
        read_steps[:] = steps
        read_calls.clear()
        machine.reg_write(reg.UC_X86_REG_RCX, state)
        setq(stack + 0x18000, sentinel)
        run(0x1402131e0, [sentinel], "discard")
        assert machine.reg_read(reg.UC_X86_REG_RAX) == int(error)
        assert machine.reg_read(reg.UC_X86_REG_RDX) == expected
        assert not read_steps
        assert all(0 < value <= amount for value in read_calls)
        cases += 1
    return cases


def source_checks():
    """Parse the connected source without invoking Cargo, rustc or live adapters."""
    names = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin",
             ("Linux", "aarch64"): "aarch64-unknown-linux-gnu", ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}
    parser = ROOT / ".tools/rust" / ("1.98.1-" + names[(platform.system(), platform.machine())]) / "bin/rustfmt"
    assert parser.is_file(), "Existing non-compiling Rust syntax parser unavailable"
    paths = [ROOT / "crates/azeroth-survivors-re/src" / name for name in ["update_parts.rs", "update_worker.rs", "update_install.rs"]]
    for path in paths:
        parsed = subprocess.run([str(parser), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                                input=path.read_text(), text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, parsed.stderr
    parts, worker, install = [path.read_text() for path in paths]
    # Bind this native contract to its live compressed-body consumer and keep replay
    # out of the source progress publication site. These are source guards, not Rust execution.
    assert "self.host.open_part(active.index, active.offset)?" in parts
    assert "active.offset != 0 && !response.partial" in parts
    discard = parts.split("fn discard_prefix(", 1)[1].split("impl<'a", 1)[0]
    assert "progress" not in discard and "remaining.min(buffer.len() as u64)" in discard
    assert "self.failures > 8 || error.kind() == io::ErrorKind::NotFound" in parts
    assert "Duration::from_secs((1_u64 << self.failures).min(20))" in parts
    assert 'request = request.set("Range", &range);' in worker and "response.status() == 206" in worker
    assert "let reader = PartReader::new(download.parts.len(), &mut parts, progress);" in worker
    assert "install::decode_verified_with(" in worker and "download.size," in worker and "&download.sha256," in worker
    assert "for path in &attempted" in worker and "host.remove_file(path);" in worker
    assert "flate2::read::GzDecoder::new(input)" in install and "decoded_size != expected_size || sha256 != expected_sha256" in install
    return len(paths)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--python-path", action="append", default=[])
    args = parser.parse_args()
    for path in reversed(args.python_path):
        sys.path.insert(0, str(project_path(path)))
    proof = json.loads(MANIFEST.read_text())
    queries = verify(proof)
    cases = native_cases(proof)
    syntax = source_checks()
    print(json.dumps({"target": proof["target"], "verified_queries": queries,
                      "synthetic_original_instruction_cases": cases, "source_syntax_paths": syntax,
                      "authored_Rust_regressions": "uncompiled_unrun",
                      "application_compilation": "not_run", "HTTP_filesystem_server_execution": "not_run",
                      "parity": "unverified"}, indent=2))


if __name__ == "__main__":
    main()

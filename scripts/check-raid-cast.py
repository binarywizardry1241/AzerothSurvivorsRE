#!/usr/bin/env python3
"""Check selected raid cast/hold instructions without compiling or launching.

--write curates exact native ranges and compact REA identity records. Synthetic
actor memory tests execute only no-call instruction spans; terrain, packet
construction, Rust execution and rendered cast bars remain outside this check.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
EVIDENCE = ROOT / "docs/analysis/evidence/raid-cast"
WORK = ROOT / "runtime/analysis/history/combat/cast-presentation/e6d958ff3e6f"
RANGES = {
    "hold": (0x145950630, 0x145950872),
    "actor-hold-gate": (0x1459721A4, 0x1459721B6),
    "cast-block": (0x145950F4E, 0x145950FE8),
    "tag6-start": (0x145952759, 0x14595281F),
    "tag6-follow": (0x1459551FE, 0x145955213),
    "duration": (0x1458850A0, 0x145885294),
    "stop-packet": (0x1458BFDD0, 0x1458BFF19),
}


def serialized(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def f32(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def check_scripted_launch():
    receipt = json.loads((EVIDENCE.parent / "scholomance-launches.json").read_text())
    target = latest_target(verify=False)
    assert all(target[key] == value for key, value in receipt["target"].items())
    data = target_bytes(target)
    module = load_script("scripted_launch_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    intervals = receipt["native_ranges"] + receipt["query_slices"]
    slice_hashes = {row["sha256"] for row in receipt["query_slices"]}
    assert {query["slice_sha256"] for query in receipt["ghidra_queries"]} == slice_hashes
    for row in intervals:
        first, limit, offset = (int(row[key], 0) for key in ("start", "end_exclusive", "file_offset"))
        assert pe.rva_offset(first - pe.image_base) == offset, row["start"]
        assert pe.rva_offset(limit - 1 - pe.image_base) == offset + limit - first - 1, row["end_exclusive"]
        assert hashlib.sha256(data[offset:offset + limit - first]).hexdigest() == row["sha256"], row["start"]
    print(f"Scholomance launch: {len(intervals)} PE ranges verified against {target['version']}; no compiler/game")


def main(write):
    target = latest_target(verify=False)
    assert target["sha256"] == SHA, "Changed target requires fresh recovery"
    data = target_bytes(target)  # Rechecks the complete selected EXE hash.
    module = load_script("cast_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                    str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    def span(address, size):
        value = raw(address, size)
        assert len(value) == size
        return dict(va=hex(address), byte_count=size,
                    file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    sha256=hashlib.sha256(value).hexdigest())

    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    assert extents[0x145950630] == 0x145950872
    assert extents[0x1458850A0] == 0x145885294
    assert extents[0x1458BFDD0] == 0x1458BFF19
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    ranges = []
    EVIDENCE.mkdir(parents=True, exist_ok=True) if write else None
    for name, (a, b) in RANGES.items():
        instructions = list(md.disasm(raw(a, b-a), a))
        assert sum(i.size for i in instructions) == b-a
        assembly = "\n".join(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                             for i in instructions) + "\n"
        row = dict(role=name, **span(a, b-a), assembly=name + ".asm",
                   assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest())
        if write:
            (EVIDENCE / row["assembly"]).write_text(assembly)
        else:
            assert (EVIDENCE / row["assembly"]).read_text() == assembly
        ranges.append(row)

    # Tag3 duration reads payload+12; tag6 selects the fixed 1.3f32 owner.
    table = 0x146BE14D0
    assert table + struct.unpack("<i", raw(table, 4))[0] == 0x1458850DA
    assert table + struct.unpack("<i", raw(table + 12, 4))[0] == 0x145885107
    assert raw(0x145DD0798, 4) == struct.pack("<I", 0x3FA66666)
    assert raw(0x145DCD0AC, 4) == struct.pack("<I", 0x3ECCCCCD)
    assert struct.unpack("<4f", raw(0x1471EF650, 16)) == (0.0, f32(0.3), 0.0, 0.0)

    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def put(address, value):
        for page in range(address & ~4095, (address + len(value) + 4095) & ~4095, 4096):
            if page not in mapped:
                uc.mem_map(page, 4096)
                mapped.add(page)
        uc.mem_write(address, value)

    for a, b in RANGES.values():
        put(a, raw(a, b-a))
    put(0x1471EF650, raw(0x1471EF650, 16))
    put(0x145DCD0AC, raw(0x145DCD0AC, 4))
    put(0x145DD0798, raw(0x145DD0798, 4))
    actor = 0x2000000
    put(actor, bytes(4096))
    uc.reg_write(r.UC_X86_REG_RBX, actor)
    uc.reg_write(r.UC_X86_REG_R14, actor)

    def xmm(reg, values):
        uc.reg_write(reg, int.from_bytes(struct.pack("<4f", *values), "little"))

    def extend(old, request):
        return old if math.isnan(request) or old > request else request

    checked = 0
    values = [0.0, -0.0, -1.0, f32(1.3), 8.0, float("inf"), float("nan")]
    for old in values:
        for seconds in values:
            now = f32(10.0)
            put(actor + 0x1C4, struct.pack("<f", old))
            put(actor + 0x198, struct.pack("<f", old))
            put(actor + 0x194, struct.pack("<f", 999.0))
            xmm(r.UC_X86_REG_XMM6, [seconds, 0.0, 0.0, 0.0])
            xmm(r.UC_X86_REG_XMM8, [now, 0.0, 0.0, 0.0])
            uc.emu_start(0x14595076E, 0x1459507B9, count=100)
            actual = struct.unpack("<I", uc.mem_read(actor + 0x1C4, 4))[0]
            deadline = extend(old, f32(now + seconds))
            assert actual == bits(deadline), (old, seconds, "hold")
            assert bytes(uc.mem_read(actor + 0x194, 4)) == struct.pack("<f", deadline)
            actual = struct.unpack("<I", uc.mem_read(actor + 0x198, 4))[0]
            assert actual == bits(extend(old, f32(seconds + f32(0.3)))), (old, seconds, "attack")
            checked += 1

    global_state = 0x2010000
    put(global_state, bytes(4096))
    put(global_state + 0x560, struct.pack("<Q", actor))
    put(actor + 0x18, struct.pack("<Q", 0))
    uc.reg_write(r.UC_X86_REG_RSI, global_state)
    uc.reg_write(r.UC_X86_REG_RBX, 0)
    block_cases = 0
    for old in values:
        for seconds in values:
            put(actor + 0x48, struct.pack("<f", old))
            xmm(r.UC_X86_REG_XMM0, [seconds, 0.0, 0.0, 0.0])
            xmm(r.UC_X86_REG_XMM15, [10.0, 0.0, 0.0, 0.0])
            uc.emu_start(0x145950F6A, 0x145950FAF, count=100)
            expected = extend(old, f32(f32(seconds + 10.0) + f32(0.4)))
            assert bytes(uc.mem_read(actor + 0x48, 4)) == struct.pack("<f", expected)
            block_cases += 1

    duration_cases = 0
    uc.reg_write(r.UC_X86_REG_RCX, actor)
    for delay in values:
        put(actor + 12, struct.pack("<f", delay))
        for start, end, expected in [(0x1458850DA, 0x1458850DF, delay),
                                     (0x145885107, 0x14588510F, f32(1.3))]:
            uc.emu_start(start, end, count=5)
            assert uc.reg_read(r.UC_X86_REG_XMM0) & 0xFFFFFFFF == bits(expected)
            duration_cases += 1

    # The admission test is strict and ordered. Equality and NaN proceed.
    gate_cases = 0
    def stop_on_exit(machine, address, _size, _user):
        if address in (0x1459716EC, 0x1459721B6):
            machine.emu_stop()
    hook = uc.hook_add(UC_HOOK_CODE, stop_on_exit)
    put(0x1459716EC, b"\x90")
    for now in [0.0, 10.0, float("nan")]:
        for deadline in [0.0, 9.0, 10.0, 11.0, float("nan")]:
            put(actor + 0x1C4, struct.pack("<f", deadline))
            xmm(r.UC_X86_REG_XMM6, [now, 0.0, 0.0, 0.0])
            uc.emu_start(0x1459721A4, 0x1459721B7, count=20)
            expected = 0x1459716EC if deadline > now else 0x1459721B6
            assert uc.reg_read(r.UC_X86_REG_RIP) == expected
            gate_cases += 1
    uc.hook_del(hook)

    # Textual live-path guards supplement, but never replace, source review or
    # type checking. SpellStart uses the existing real-client packet consumer.
    source = (ROOT / "crates/azeroth-survivors-re/src").resolve()
    actor_source = (source / "enemies/ai.rs").read_text()
    assert actor_source.index("if self.stun_until > now") < actor_source.index("if hold_until > now")
    assert actor_source.index("if hold_until > now") < actor_source.index("self.attack_delay -= context.elapsed")
    boss_source = (source / "bosses/ai.rs").read_text()
    assert "actor.tick_with_stage_and_hold" in boss_source
    adapter_source = (source / "gameplay/mechanics/bosses.rs").read_text()
    for guard in ["native::cast_presentation::hold", "row.ai.raid_hold_until",
                  "native::cast_presentation::block_until", "row.ai.raid_cast_until",
                  "serial: self.movement_counter.next()", "RunEvent::RaidCast"]:
        assert guard in adapter_source, guard
    producer_source = (source / "bosses/raid_areas.rs").read_text()
    for guard in ["port.raid_block", "port.raid_hold", "port.raid_cast"]:
        assert guard in producer_source, guard
    client_source = (source / "gameplay/client/events.rs").read_text()
    assert "RunEvent::RaidCast" in client_source and "SessionEvent::SpellStart" in client_source

    manifest = dict(target_version=target["version"], target_sha256=SHA, ranges=ranges,
        constants=[span(a, n) for a, n in [(table, 128), (0x145DD0798, 4),
                   (0x145DCD0AC, 4), (0x1471EF650, 16)]],
        limits=["No-call instruction spans use synthetic actor memory; native Rust code, terrain providers and packet constructors are not executed.",
                "Tag6 starts creature cast presentation; complete boss cast-bar UI and original/rebuilt parity remain unverified."])
    checks = dict(target_sha256=SHA, target_executed=False, native_hold_cases=checked,
                  native_hold_gate_cases=gate_cases, native_block_cases=block_cases,
                  native_duration_cases=duration_cases,
                  limits="Unicorn executes bounded native instructions, not compiled source or the game.")
    if write:
        records = []
        for name in ["hold", "tag6", "duration"]:
            paths = sorted((WORK / ("rea-" + name)).glob("*-procedure_pseudo_code.json"))
            assert paths
            for path in paths:
                response = json.loads(path.read_text())["response"]["result"]
                evidence = json.loads(next(c["text"] for c in response["content"] if c["type"] == "text"))
                records.append({key: evidence[key] for key in ["evidence_id", "subject", "provider",
                    "parameters", "limitations", "relationship_coverage"]})
                profile = evidence["analysis_profile"]
                records[-1]["analysis_profile"] = dict(digest=profile["digest"],
                    compiler_spec_id=profile["parameters"]["compiler_spec_id"],
                    entry_point=profile["parameters"]["entry_point"],
                    analysis_options=profile["parameters"]["analysis_options"])
        # Keep portable identity only; raw tool paths and responses stay ignored.
        for record in records:
            record["subject"].pop("local_path", None)
            record["limitations"] = [value.replace(str(ROOT) + "/", "")
                                     for value in record["limitations"]]
        (EVIDENCE / "rea-records.json").write_text(serialized(records))
        (EVIDENCE / "manifest.json").write_text(serialized(manifest))
        (EVIDENCE / "native.json").write_text(serialized(checks))
    else:
        assert json.loads((EVIDENCE / "manifest.json").read_text()) == manifest
        assert json.loads((EVIDENCE / "native.json").read_text()) == checks
    print(f"Raid cast: {checked} hold + {gate_cases} admission + {block_cases} block + {duration_cases} duration native cases passed; no compiler/game")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--scripted-launch", action="store_true")
    args = parser.parse_args()
    if args.scripted_launch:
        check_scripted_launch()
    else:
        main(args.write)

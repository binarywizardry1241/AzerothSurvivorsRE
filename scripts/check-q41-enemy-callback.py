#!/usr/bin/env python3
"""Check the bounded #41 enemy HP-helper dispatch without compiling or a game.

The original selector and both leaf polynomials run in bounded Unicorn memory.
Synthetic Game/zone/definition fields are declared inputs. Source projections
and connection guards do not execute Rust or validate a complete constructor.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import itertools
import json
import re
import struct

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as reg

from coverage_common import ROOT, latest_target, target_bytes
from native_recovery import f32, bits
from script_sources import load_script

HERE = ROOT / "docs/analysis/evidence/0.120.0/enemy-callback"
TARGET_SHA = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
START, RETURN = 0x145BBF0B1, 0x145BBF153
NONZERO, ZERO = 0x145BF6F80, 0x145BF6FD0
RANGES = [
    ("constructor-selector", START, RETURN),
    ("nonzero-flag-health-polynomial", NONZERO, NONZERO + 69),
    ("zero-flag-health-polynomial", ZERO, ZERO + 69),
]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def query_commitments():
    receipts = json.loads((HERE / "queries.json").read_text())
    assert [row["procedure"] for row in receipts] == ["0x145bbed50", "0x145bf6f80", "0x145bf6fd0"]
    for row in receipts:
        journal = json.loads((ROOT / row["journal"]).read_text())
        assert journal["identity_sha256"] == row["query_identity_sha256"]
        assert digest(json.dumps(journal["identity"], sort_keys=True,
                                 separators=(",", ":")).encode()) == row["query_identity_sha256"]
        assert journal["identity"]["target"]["sha256"] == TARGET_SHA
        operation = journal["operations"][row["operation_id"]]
        assert operation["status"] == "completed" and operation["name"] == "procedure_pseudo_code"
        assert operation["arguments"] == dict(procedure=row["procedure"])
        assert operation["result"] == row["result"]
        raw = (ROOT / row["result"]["path"]).read_bytes()
        assert digest(raw) == row["result"]["sha256"]
        result = json.loads(raw)["structuredContent"]
        assert result["subject"]["digest"]["sha256"] == TARGET_SHA
        assert result["provider"]["id"] == "ghidra"
        assert result["parameters"] == dict(procedure=row["procedure"])
        assert result["evidence_id"] == row["evidence_id"]
        assert result["analysis_profile"]["digest"] == row["analysis_profile_sha256"]
        assert result["normalized_result"]
    return receipts


def source_projection():
    path = ROOT / "crates/azeroth-survivors-re/src/enemies/scaling.rs"
    source = path.read_text()
    function = source.split("pub fn health_polynomial", 1)[1].split("pub fn damage_polynomial", 1)[0]
    expected = """(minutes: f32, zone_difficulty: f32, flag_4c: u8) -> f32 {
        let linear = 0.1 * minutes + 1.0;
        let quadratic = (f32::from_bits(0x3d13_74bc) * minutes) * minutes;
        let partial = quadratic + linear;
        let coefficient = if flag_4c != 0 {
            f32::from_bits(0x3bc2_a455)
        } else {
            f32::from_bits(0x3be6_afcd)
        };
        let cubic = (coefficient * minutes) * minutes;
        let cubic = minutes * cubic;
        (cubic + partial) * zone_difficulty
    }"""
    compact = lambda value: re.sub(r"\s+", "", value)
    assert compact(function) == compact(expected), "Review changed health-polynomial source"

    def project(clock, zone, difficulty, flag):
        minutes = f32(clock / 60.0)
        zone_difficulty = f32(zone * difficulty)
        linear = f32(f32(f32(0.1) * minutes) + 1.0)
        quadratic = f32(f32(f32(0.036) * minutes) * minutes)
        partial = f32(quadratic + linear)
        coefficient = struct.unpack("<f", struct.pack("<I", 0x3BC2A455 if flag else 0x3BE6AFCD))[0]
        cubic = f32(f32(coefficient * minutes) * minutes)
        cubic = f32(minutes * cubic)
        return bits(f32(f32(cubic + partial) * zone_difficulty))

    return project


def source_connections():
    guards = {
        "crates/azeroth-survivors-re/src/enemies/scaling.rs": [
            "let minutes = input.clock_seconds / 60.0;",
            "let zone_difficulty = input.zone_scale * input.difficulty;",
            "let health_scale = health_polynomial(minutes, zone_difficulty, definition.flag_4c);",
            "let health = health_scale * health_base;",
            "let health = health * health_multiplier(minutes, late_health_bonus);",
            "let health = health_endless * health;",
            "let health = (f32::from(input.hp_percent) / 100.0) * health;",
            "health,\n        max_health: health,",
        ],
        "crates/azeroth-survivors-re/src/gameplay/mechanics.rs": [
            "let definition = &self.zone.enemies[index];",
            "let stats = scaling::initial_stats_for_zone(",
            "clock_seconds: self.now,",
            "difficulty: self.rules.difficulty,",
            "zone_scale: self.zone.scalar_e0,",
            "stats.health *= self.party_health_multiplier;",
            "stats.max_health *= self.party_health_multiplier;",
            "health: stats.health,\n            maximum_health: stats.max_health,",
        ],
    }
    receipts = []
    for path, fragments in guards.items():
        source = (ROOT / path).read_text()
        for fragment in fragments:
            assert fragment in source, (path, fragment)
        receipts.append(dict(path=path, fragments=fragments,
                             fragment_sha256=digest("\n".join(fragments).encode())))
    return receipts


def native_ranges(image, pe):
    rows, listings = [], []
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for role, start, end in RANGES:
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        instructions = list(decoder.disasm(raw, start))
        assert sum(row.size for row in instructions) == len(raw)
        listing = "".join(f"{row.address:016x}  {row.bytes.hex():24s} {row.mnemonic} {row.op_str}".rstrip() + "\n"
                          for row in instructions)
        rows.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
                         file_offset=hex(offset), byte_count=len(raw), sha256=digest(raw),
                         instructions=len(instructions), assembly_sha256=digest(listing.encode())))
        listings.append(f"; {role} {hex(start)}..{hex(end)} sha256 {digest(raw)}\n" + listing)
    return rows, "\n".join(listings)


def run_cases(image, pe):
    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(row["rva"] + max(row["virtual_size"], row["raw_size"]) for row in pe.sections)
    cpu.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        cpu.mem_write(pe.image_base + section["rva"],
                      image[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    heap, stack = 0x200000000, 0x300000000
    cpu.mem_map(heap, 0x10000)
    cpu.mem_map(stack, 0x10000)
    definition, zone = heap + 0x2000, heap + 0x3000
    selected, instruction_count = [], 0

    def hook(machine, pc, size, unused):
        nonlocal instruction_count
        if pc == RETURN:
            machine.emu_stop()
            return
        assert any(start <= pc < end for _, start, end in RANGES), hex(pc)
        if pc in (NONZERO, ZERO):
            selected.append(pc)
        instruction_count += 1

    cpu.hook_add(UC_HOOK_CODE, hook)
    project = source_projection()
    cases = []
    clocks = [-60.0, -0.0, 0.0, 30.0, 337.5, 900.0, 1200.0, 3600.0]
    scale_pairs = [(0.0, 1.0), (1.0, 0.0), (0.5, 0.75),
                   (1.0, 1.0), (1.5, 2.25), (3.0, 655.35)]
    for flag, clock, (zone_scale, difficulty) in itertools.product(range(256), clocks, scale_pairs):
        selected.clear()
        clock, zone_scale, difficulty = map(f32, (clock, zone_scale, difficulty))
        cpu.mem_write(heap, bytes(0x10000))
        cpu.mem_write(stack, bytes(0x10000))
        cpu.mem_write(definition + 0x4C, bytes([flag]))
        cpu.mem_write(definition + 0x30, struct.pack("<f", 1.0))
        cpu.mem_write(heap + 0xC54, struct.pack("<f", difficulty))
        cpu.mem_write(zone + 0xE0, struct.pack("<f", zone_scale))
        for index in range(16):
            cpu.reg_write(getattr(reg, f"UC_X86_REG_XMM{index}"), 0)
        for register, value in ((reg.UC_X86_REG_RSI, heap), (reg.UC_X86_REG_R13, definition),
                                (reg.UC_X86_REG_R14, zone), (reg.UC_X86_REG_RBP, stack + 0x2000),
                                (reg.UC_X86_REG_RSP, stack + 0x8000), (reg.UC_X86_REG_EFLAGS, 2),
                                (reg.UC_X86_REG_MXCSR, 0x1F80), (reg.UC_X86_REG_XMM7, bits(clock))):
            cpu.reg_write(register, value)
        cpu.emu_start(START, 0, count=200)
        assert cpu.reg_read(reg.UC_X86_REG_RIP) == RETURN
        assert selected == [NONZERO if flag else ZERO], (flag, selected)
        actual = cpu.reg_read(reg.UC_X86_REG_XMM0) & 0xFFFFFFFF
        expected = project(clock, zone_scale, difficulty, flag)
        assert actual == expected, (flag, clock, zone_scale, difficulty, hex(actual), hex(expected))
        cases.append([flag, bits(clock), bits(zone_scale), bits(difficulty), selected[0], actual])
    return dict(native_cases=len(cases), native_instructions=instruction_count,
                flags=list(range(256)), clock_bits=list(map(bits, clocks)),
                zone_difficulty_bits=[[bits(f32(zone)), bits(f32(difficulty))]
                                      for zone, difficulty in scale_pairs],
                result_stream_sha256=digest(json.dumps(cases, separators=(",", ":")).encode()))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-proof", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == TARGET_SHA, "Target changed; do not reuse these native addresses"
    image = target_bytes(target)
    pe = load_script("enemy_callback_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    ranges, assembly = native_ranges(image, pe)
    owner_start, owner_end = 0x145BBED50, 0x145BBF6C4
    owner_offset = pe.rva_offset(owner_start - pe.image_base)
    owner = image[owner_offset:owner_offset + owner_end - owner_start]
    proof = dict(schema_version=1, target=dict(version=target["version"], sha256=TARGET_SHA),
                 gap_ids=[41], lead_id="Q41-F01:site=0x145bbf151", native_ranges=ranges,
                 constructor=dict(start=hex(owner_start), end_exclusive=hex(owner_end),
                                  file_offset=hex(owner_offset), byte_count=len(owner), sha256=digest(owner)),
                 query_commitments=query_commitments(),
                 source_connections=source_connections(), checks=run_cases(image, pe),
                 limits=["Synthetic current Game/zone/enemy fields and finite f32 inputs at the selected constructor boundary.",
                         "Only original selector and two leaf polynomials execute; the full constructor, allocator, CRT, world and renderer do not.",
                         "Source projection/guards do not compile or execute Rust, validate a whole module or establish gameplay/parity."])
    if args.write_proof:
        HERE.mkdir(parents=True, exist_ok=True)
        (HERE / "native.asm").write_text(assembly)
        (HERE / "proof.json").write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert (HERE / "native.asm").read_text() == assembly
        assert portable_record(json.loads((HERE / "proof.json").read_text())) == portable_record(proof), "Review changed proof before replacing"
    print(f"PASS {proof['checks']['native_cases']} native selector/polynomial cases; "
          f"{proof['checks']['native_instructions']} original instructions; runtime/parity unverified")


if __name__ == "__main__":
    main()

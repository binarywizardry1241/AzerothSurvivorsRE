#!/usr/bin/env python3
"""Check hash-bound party arithmetic without compilation or game execution."""
from runtime_layout import retained_runtime_path
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.127.0/coop-scaling/manifest.json"
INCOMING_MANIFEST = ROOT / "docs/analysis/evidence/0.141.0/coop-incoming/manifest.json"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def verify(proof, selected=None):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    if selected is None:
        selected = latest_target(verify=True)
    assert proof["target"] == {k: selected[k] for k in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(selected)
    pe = load_script("party_scaling_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = 0
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and sha(raw) == row["sha256"]
        if row in proof["native_ranges"]:
            decoded = list(decoder.disasm(raw, address))
            assert sum(i.size for i in decoded) == len(raw), row["role"]
            instructions += len(decoded)
    for query in proof["queries"]:
        for name in ("plan", "journal", "result", "raw_input"):
            receipt = query[name]
            assert sha((retained_runtime_path(ROOT / receipt["path"], ROOT)).read_bytes()) == receipt["sha256"]
        result = json.loads((ROOT / query["result"]["path"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe)
    assert proof["target_executed"] is False
    return instructions


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    rows = {r["role"]: r for r in proof["native_ranges"] + proof["native_data"]}
    for row in rows.values():
        address = int(row["virtual_address"], 16)
        for page in range(address & ~4095, (address + row["byte_count"] + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, bytes.fromhex(row["bytes_hex"]))
    state_address = 0x22000000
    machine.mem_map(state_address, 0x2000)
    total = 0

    def count(_machine, _address, _size, _context):
        nonlocal total
        total += 1
    machine.hook_add(UC_HOOK_CODE, count)

    def run(role, zone, count):
        row = rows[role]
        for register in (reg.UC_X86_REG_RSI, reg.UC_X86_REG_R14, reg.UC_X86_REG_RBX):
            machine.reg_write(register, state_address)
        machine.mem_write(state_address + 0xc28, struct.pack("<Q", max(count, 1)))
        machine.reg_write(reg.UC_X86_REG_RAX, zone)
        start = int(row["virtual_address"], 16)
        # The live-cap range ends at the CRT round call. Its input is checked
        # below; this fixture does not execute or emulate the Windows CRT.
        end = 0x145c14ca0 if role == "live-cap" else start + row["byte_count"]
        machine.emu_start(start, end, count=1000)

    def low(register):
        return machine.reg_read(register) & 0xffffffff

    cases = []
    for zone in range(12):
        for count in range(1, 6):
            extra = f32(f32(count - 1) * f32(0.7 if zone < 3 else 1.0))
            health = [f32(f32(extra * f32(c)) + 1.0) for c in (0.72, 1.04)]
            density = f32(f32(extra * f32(0.48)) + 1.0)
            incoming = f32(f32(extra * f32(0.064)) + 1.0)
            run("health-factor", zone, count)
            packed = machine.reg_read(reg.UC_X86_REG_XMM6)
            assert [packed & 0xffffffff, (packed >> 32) & 0xffffffff] == list(map(bits, health))
            run("health-factor-after-leave", zone, count)
            packed = machine.reg_read(reg.UC_X86_REG_XMM7)
            assert [packed & 0xffffffff, (packed >> 32) & 0xffffffff] == list(map(bits, health))
            run("density-factor", zone, count)
            assert low(reg.UC_X86_REG_XMM0) == bits(density)
            machine.reg_write(reg.UC_X86_REG_XMM6, bits(1.2345))
            run("incoming-damage-factor", zone, count)
            assert low(reg.UC_X86_REG_XMM6) == bits(f32(f32(1.2345) * incoming))
            run("private-reward", zone, count)
            assert low(reg.UC_X86_REG_XMM1) == bits(f32(1.0 / density))
            run("ordinary-health", zone, count)
            assert low(reg.UC_X86_REG_XMM0) == bits(health[0])
            run("boss-health", zone, count)
            assert low(reg.UC_X86_REG_XMM7) == bits(health[1])
            run("live-cap", zone, count)
            assert low(reg.UC_X86_REG_XMM0) == bits(f32(50.0 * density))
            cases.append({"zone": zone, "live_heroes": count,
                          "health_bits": list(map(bits, health)), "density_bits": bits(density),
                          "incoming_factor_bits": bits(incoming)})
    clamp_cases = []
    row = rows["live-count-clamp"]
    start = int(row["virtual_address"], 16)
    for count in range(6):
        machine.reg_write(reg.UC_X86_REG_RBP, state_address + 0x1000)
        machine.reg_write(reg.UC_X86_REG_R14, state_address)
        machine.mem_write(state_address + 0xfe0, struct.pack("<Q", count))
        machine.emu_start(start, start + row["byte_count"], count=100)
        actual = struct.unpack("<Q", machine.mem_read(state_address + 0xc28, 8))[0]
        assert actual == max(count, 1)
        clamp_cases.append({"non_down_count": count, "stored_count": actual})
    rescale_cases = []
    stop = None
    def stop_rescale(uc, address, _size, _context):
        nonlocal stop
        if address in (0x145bc65fb, 0x145bc66ee):
            stop = address
            uc.emu_stop()
    handle = machine.hook_add(UC_HOOK_CODE, stop_rescale)
    for ordinary in (True, False):
        for guardian in (False, True):
            for before, maximum in ((0.0, 10.0), (-1.0, 10.0),
                                    (float("nan"), 10.0), (0.01, 0.1),
                                    (50.0, 100.0), (100.0, 100.0)):
                for ordinary_ratio, special_ratio in ((0.5, 0.75), (1.0, 1.0), (2.0, 3.0)):
                    stop = None
                    machine.reg_write(reg.UC_X86_REG_R12, state_address + 0x1e0)
                    machine.reg_write(reg.UC_X86_REG_R15, state_address + 0x1e0)
                    machine.reg_write(reg.UC_X86_REG_XMM6, 0)
                    machine.reg_write(reg.UC_X86_REG_XMM7, bits(ordinary_ratio))
                    machine.reg_write(reg.UC_X86_REG_XMM8, bits(special_ratio))
                    machine.reg_write(reg.UC_X86_REG_XMM9, bits(1.0))
                    machine.mem_write(state_address + 0x18, struct.pack("<q", -1 if ordinary else 0))
                    machine.mem_write(state_address + 0x58, struct.pack("<q", 0 if guardian else -1))
                    machine.mem_write(state_address + 0x160, struct.pack("<ff", before, maximum))
                    machine.emu_start(0x145bc6570, 0x145bc66ee + 1, count=100)
                    actual = struct.unpack("<ff", machine.mem_read(state_address + 0x160, 8))
                    if before > 0.0:
                        ratio = special_ratio if not ordinary or guardian else ordinary_ratio
                        expected_max = max(f32(f32(maximum) * ratio), 1.0)
                        expected_health = min(expected_max, max(f32(f32(before) * ratio), 1.0))
                        assert list(map(bits, actual)) == list(map(bits, (expected_health, expected_max)))
                        assert stop == 0x145bc65fb
                    else:
                        assert bits(actual[0]) == bits(before) and bits(actual[1]) == bits(maximum)
                        assert stop == 0x145bc66ee
                    rescale_cases.append({"boss": not ordinary, "guardian": guardian,
                                          "health_before_bits": bits(before),
                                          "maximum_before_bits": bits(maximum),
                                          "ratios": [ordinary_ratio, special_ratio],
                                          "health_after_bits": bits(actual[0]),
                                          "maximum_after_bits": bits(actual[1])})
    machine.hook_del(handle)
    return {"cases": cases, "live_count_cases": clamp_cases, "rescale_cases": rescale_cases,
            "original_instruction_steps": total,
            "seams": ["Zone lookup result supplied at its verified return boundary.",
                      "Live count already clamped to at least one by its native producer.",
                      "Population-cap CRT round input checked; no Windows CRT execution."]}


def map_replay_ranges(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    rows = {row["role"]: row for row in proof["native_ranges"] + proof["native_data"]}
    for row in rows.values():
        address = int(row["virtual_address"], 16)
        for page in range(address & ~4095, (address + row["byte_count"] + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, bytes.fromhex(row["bytes_hex"]))
    return machine, rows


def replay_current(proof):
    """Execute the 0.127.0 original SSE factors with synthetic hero/party state."""
    import unicorn.x86_const as reg
    machine, rows = map_replay_ranges(proof)
    game = 0x22000000
    machine.mem_map(game, 0x2000)

    def run(role, zone, count, party):
        for name in ("RSI", "RBX", "R12", "R13", "R9"):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), game)
        machine.mem_write(game + 0xc88, struct.pack("<Q", count))
        machine.mem_write(game + 0xa58, struct.pack("<Q", party))
        machine.reg_write(reg.UC_X86_REG_RAX, zone)
        machine.reg_write(reg.UC_X86_REG_XMM7, bits(1.2345))
        row = rows[role]
        start = int(row["virtual_address"], 16)
        machine.emu_start(start, start + row["byte_count"], count=1000)

    cases = []
    for zone in range(12):
        for count in range(1, 6):
            for party in (0, 1, 4):
                extra = f32(f32(count - 1) * f32(0.7 if zone < 3 else 1.0))
                reduction = f32(0.8 if party else 1.0)
                health = [f32(f32(f32(extra * f32(c)) + 1.0) * reduction) for c in (0.72, 1.04)]
                density = f32(f32(extra * f32(0.312)) + 1.0)
                incoming = f32(f32(f32(extra * f32(0.064)) + 1.0) * reduction)
                run("health-factor", zone, count, party)
                packed = machine.reg_read(reg.UC_X86_REG_XMM7)
                assert [packed & 0xffffffff, (packed >> 32) & 0xffffffff] == list(map(bits, health))
                run("density-factor", zone, count, party)
                assert machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff == bits(density)
                run("incoming-damage-factor", zone, count, party)
                assert machine.reg_read(reg.UC_X86_REG_XMM7) & 0xffffffff == bits(f32(f32(1.2345) * incoming))
                run("ordinary-health", zone, count, party)
                assert machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff == bits(health[0])
                run("private-reward", zone, count, party)
                assert machine.reg_read(reg.UC_X86_REG_XMM1) & 0xffffffff == bits(f32(1.0 / density))
                run("live-cap", zone, count, party)
                assert machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff == bits(f32(50.0 * density))
                cases.append({"zone": zone, "live_heroes": count, "stored_other_heroes": party,
                              "health_bits": list(map(bits, health)), "density_bits": bits(density),
                              "incoming_factor_bits": bits(incoming)})
    return {"cases": cases, "seams": ["Zone lookup supplied at its native return boundary.",
            "Live count supplied after its retained at-least-one producer clamp.",
            "Live-cap round input checked without executing the Windows CRT."]}


def replay_incoming(proof):
    from unicorn import UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine, rows = map_replay_ranges(proof)
    row = rows["cooperative-incoming-damage"]
    start = int(row["virtual_address"], 16)
    zone_call = int(proof["zone_lookup_call"], 16)
    game = 0x22000000
    machine.mem_map(game, 0x2000)

    def supply_zone(machine, address, size, zone):
        machine.reg_write(reg.UC_X86_REG_RAX, zone[0])
        machine.reg_write(reg.UC_X86_REG_RIP, address + size)

    zone = [0]
    machine.hook_add(UC_HOOK_CODE, supply_zone, zone, zone_call, zone_call)
    cases = 0
    for index in range(13):
        zone[0] = index
        for count in range(1, 6):
            extra = f32((count - 1) * f32(0.7 if index < 3 else 1.0))
            factor = f32(f32(f32(extra * f32(0.064)) + 1.0) * f32(0.8))
            for mode in (0, 1, 2):
                machine.reg_write(reg.UC_X86_REG_RBX, game)
                machine.mem_write(game + 0xfe8, struct.pack("<Q", count))
                machine.mem_write(game + 0x10e3, bytes([mode]))
                machine.reg_write(reg.UC_X86_REG_XMM7, bits(1.2345))
                machine.emu_start(start, start + row["byte_count"], count=100)
                expected = f32(f32(1.2345) * (factor if mode == 1 else 1.0))
                assert machine.reg_read(reg.UC_X86_REG_XMM7) & 0xffffffff == bits(expected)
                cases += 1
    return cases


def source_checks(current=False):
    base = ROOT / "crates/azeroth-survivors-re/src"
    scaling = (base / "coop/scaling.rs").read_text()
    for expression in ("live_heroes.max(1) - 1", "zone_index < 3", "extra * 0.72 + 1.0",
                       "extra * 1.04 + 1.0", "extra * 0.312 + 1.0" if current else "extra * 0.48 + 1.0", "extra * 0.064 + 1.0",
                       "1.0 / self.density"):
        assert expression in scaling, expression
    coop = (base / "gameplay/mechanics/coop.rs").read_text()
    assert ("self.coop.live_heroes, zone, has_other_heroes" if current else
            "PartyScaling::new(self.coop.live_heroes, zone)") in coop
    if current:
        assert "let has_other_heroes = !self.coop.remotes.is_empty() || self.coop.active_slot != 0;" in coop
        assert "fn party_scaling_survives_the_single_remote_swap_and_departure()" in coop
        assert "if has_other_heroes { 0.8 } else { 1.0 }" in scaling
        assert "(extra * 0.064 + 1.0) * 0.8" in scaling
        assert "(extra * 0.72 + 1.0) * health_reduction" in scaling
        assert "(extra * 1.04 + 1.0) * health_reduction" in scaling
        assert "if !self.has_party() {\n            return None;\n        }" in coop
    assert "scaling.health" in coop and "scaling.reward()" in coop
    incoming = (base / "gameplay/mechanics/incoming.rs").read_text()
    assert incoming.index("scaling.incoming_damage") < incoming.index("native::apply_damage")
    spawning = (base / "enemies/spawning.rs").read_text()
    for expression in ("(rate * acceleration) * input.cooperative_density.unwrap_or(1.0)",
                       "input.delta_seconds * rate + self.budget",
                       "desired.min(cap) * input.cooperative_density.unwrap_or(1.0)",
                       "(50.0 * factor).round() as usize"):
        assert expression in spawning, expression
    waves = (base / "enemies/waves.rs").read_text()
    assert "port.live_entity_count() >= input.population_limit()" in waves
    assert "cooperative_density: self.party_scaling().map(|scaling| scaling.density)" in (
        base / "gameplay/mechanics.rs").read_text()
    return {"source_connections_checked": True, "compiled": False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--incoming", action="store_true", help="check the 0.141.0 incoming damage lane")
    args = parser.parse_args()
    if args.incoming:
        if args.write:
            parser.error("--incoming reads the retained evidence without writing output")
        proof = json.loads(INCOMING_MANIFEST.read_text())
        print(json.dumps({"target": proof["target"], "decoded_instructions": verify(proof, installed_identity()),
                          "incoming_damage_cases": replay_incoming(proof), **source_checks(current=True)}))
        return
    proof = json.loads(MANIFEST.read_text())
    current = proof["target"]["version"] == "0.127.0"
    result = {"target": proof["target"], "decoded_instructions": verify(proof),
              "synthetic_replay": replay_current(proof) if current else replay(proof), "source": source_checks(current),
              "application_execution": "not_run", "parity": "unverified"}
    destination = MANIFEST.with_name("static-check.json")
    if args.write:
        destination.write_text(portable_json(result, indent=2) + "\n")
    elif destination.exists():
        assert portable_record(result) == portable_record(json.loads(destination.read_text()))
    print(json.dumps({"cases": len(result["synthetic_replay"]["cases"]),
                      "live_count_cases": len(result["synthetic_replay"].get("live_count_cases", [])),
                      "rescale_cases": len(result["synthetic_replay"].get("rescale_cases", [])),
                      "decoded_instructions": result["decoded_instructions"],
                      "original_instruction_steps": result["synthetic_replay"].get("original_instruction_steps"),
                      "source_connections_checked": True, "compiled": False}))


if __name__ == "__main__":
    main()

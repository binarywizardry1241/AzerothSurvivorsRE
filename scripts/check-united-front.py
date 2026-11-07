#!/usr/bin/env python3
"""Verify #118 and optional #164 through static contracts and bounded instructions."""
from runtime_layout import retained_runtime_path
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--native", action="store_true")
    parser.add_argument("--keen-source", action="store_true", help="also require #164's source boundary repair")
    args = parser.parse_args()
    proof = json.loads((ROOT / "docs/analysis/evidence/0.117.0/united-front.json").read_text())
    target = latest_target(verify=True)
    assert target["sha256"] == proof["target"]["sha256"]
    image = target_bytes(target)
    pe = load_script("united_front_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    for row in proof["native_ranges"]:
        at = pe.rva_offset(int(row["va"], 16) - pe.image_base)
        assert hashlib.sha256(image[at:at + row["byte_count"]]).hexdigest() == row["sha256"], row["label"]
    for row in proof["query_receipts"]:
        assert hashlib.sha256((retained_runtime_path(ROOT / row["path"], ROOT)).read_bytes()).hexdigest() == row["sha256"]
    raw = lambda address, count: image[pe.rva_offset(address - pe.image_base):pe.rva_offset(address - pe.image_base) + count]
    assert raw(0x1475c6a18, 9) == b"coop:team"
    assert raw(0x146174a34, 4) == struct.pack("<I", 0x3dcccccd)
    sources = {name: (ROOT / f"crates/azeroth-survivors-re/src/{name}.rs").read_text() for name in
               ["run_progression", "progression", "coop_profile", "coop/server_party",
                "gameplay/mechanics/effects", "gameplay/mechanics/progression", "gameplay/mechanics/coop",
                "gameplay/mechanics", "gameplay/mechanics/callbacks", "gameplay/mechanics/raid_hits",
                "gameplay/mechanics/demons", "gameplay/mechanics/incoming"]}
    for fragment in ['pub cooperative_luck_bits: u32',
                     'out.extend_from_slice(&hero.cooperative_luck_bits.to_le_bytes())',
                     'cooperative_luck_bits: reader.u32()?']:
        assert fragment in sources["coop/server_party"], fragment
    assert 'pub cooperative_luck: f32' in sources["run_progression"]
    assert 'pub fn cooperative_luck(earned: bool)' in sources["run_progression"]
    assert 'if earned { 0.1 } else { 0.0 }' in sources["run_progression"]
    assert 'progress.earned.contains("coop:team")' in sources["progression"]
    assert 'save.earned_achievements().contains("coop:team")' in sources["coop_profile"]
    assert 'cooperative_luck: f32::from_bits(hero.cooperative_luck_bits)' in sources["coop_profile"]
    assert 'hero.cooperative_luck_bits =' not in sources["coop_profile"], "native admission preserves this float's bits"
    assert 'self.effect_state.cooperative_luck = grants.cooperative_luck' in sources["gameplay/mechanics/progression"]
    effects = sources["gameplay/mechanics/effects"]
    assert 'let entering_party = !self.has_party();' in sources["gameplay/mechanics/coop"]
    assert 'if entering_party {\n            self.refresh_effects();' in sources["gameplay/mechanics/coop"]
    assert 'self.has_party().then_some(self.effect_state.cooperative_luck)' in effects
    assert 'if let Some(luck) = self.active_cooperative_luck()' in effects
    assert effects.index('numeric.apply_stats(&stats)') < effects.index('numeric.luck += luck') < effects.index('numeric.finish()')
    callbacks = sources["gameplay/mechanics/callbacks"]
    assert callbacks.index('numeric.apply_stats(&stats)') < callbacks.index('numeric.luck += luck') < callbacks.index('numeric.finish()')
    assert 'cooperative_luck: Option<f32>' in sources["gameplay/mechanics"]
    constructors = 0
    for name in ["gameplay/mechanics", "gameplay/mechanics/raid_hits", "gameplay/mechanics/demons", "gameplay/mechanics/incoming"]:
        text = sources[name]
        count = text.count('let mut port = CombatAdapter {')
        assert count == text.count('let cooperative_luck = self.active_cooperative_luck();')
        assert count == text.count('cooperative_luck,')
        constructors += count
    assert constructors == 6
    assert 'self.with_party_hero(slot, |game| game.refresh_effects())' in sources["gameplay/mechanics/coop"]
    if args.keen_source:
        profile = sources["coop_profile"]
        assert 'if keen < 0.0' in profile and 'else if keen > 0.1' in profile
        assert 'keen.min(0.1)' not in profile
    gate_cases = admission_cases = None
    if args.native:
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
        from unicorn.x86_const import UC_X86_REG_RDI, UC_X86_REG_RBP, UC_X86_REG_RSI, UC_X86_REG_RDX, UC_X86_REG_XMM2, UC_X86_REG_XMM6, UC_X86_REG_XMM13
        machine = Uc(UC_ARCH_X86, UC_MODE_64)
        for page in [0x145ae1000, 0x145ae2000, 0x145b94000, 0x146174000]:
            machine.mem_map(page, 0x1000)
            machine.mem_write(page, raw(page, 0x1000))
        for page in [0x20000000, 0x21000000, 0x22000000]:
            machine.mem_map(page, 0x2000)
        machine.reg_write(UC_X86_REG_RDI, 0x20000000)
        machine.reg_write(UC_X86_REG_RBP, 0x21000000)
        machine.reg_write(UC_X86_REG_RSI, 0x22000000)
        admission_cases = 0
        for row in proof["admission_cases"]:
            bits = int(row["input_bits"], 16)
            machine.mem_write(0x20000178, struct.pack("<I", bits))
            machine.emu_start(0x145ae1d0c, 0x145ae1d17, count=10)
            machine.emu_start(0x145ae20ce, 0x145ae20da, count=10)
            assert machine.reg_read(UC_X86_REG_XMM6) & 0xffffffff == int(row["keen_output_bits"], 16)
            machine.mem_write(0x2000017c, struct.pack("<I", bits))
            machine.emu_start(0x145ae1cf1, 0x145ae1cf7, count=2)
            machine.emu_start(0x145ae2007, 0x145ae200d, count=2)
            machine.emu_start(0x145ae2232, 0x145ae223e, count=3)
            assert struct.unpack("<I", machine.mem_read(0x2200017c, 4))[0] == bits
            admission_cases += 1
        gate_cases = 0
        for flag in range(256):
            for bits in [0, 0x80000000, 0x3f000000, 0x3dcccccd]:
                machine.reg_write(UC_X86_REG_RDX, flag)
                machine.reg_write(UC_X86_REG_XMM13, bits)
                machine.reg_write(UC_X86_REG_XMM2, 0x3dcccccd)
                machine.emu_start(0x145b94b67, 0x145b94b70, count=5)
                base = struct.unpack("<f", struct.pack("<I", bits))[0]
                expected = struct.unpack("<I", struct.pack("<f", base + 0.10000000149011612))[0] if flag else bits
                assert machine.reg_read(UC_X86_REG_XMM13) & 0xffffffff == expected
                gate_cases += 1
    print(json.dumps({"target": "0.117.0", "native_ranges": len(proof["native_ranges"]),
                      "admission_cases": admission_cases, "mode_and_float_cases": gate_cases,
                      "keen_source": args.keen_source,
                      "scope": "bounded instructions and source connections; compilation/game/network/parity unverified"}))


if __name__ == "__main__":
    main()

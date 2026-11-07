#!/usr/bin/env python3
"""Check the current generated timer names using original constructor instructions.

Only storage, locale lookup and the three literal formatting operations have
host seams. No reconstructed Rust, application, addon or build executes.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path

ROOT = next(p for p in Path(__file__).resolve().parents
            if (p / "scripts/coverage_common.py").is_file())
sys.path[:0] = [str(ROOT / "scripts"), str(ROOT / "runtime/tool-state/python/armory/python-libs")]
from coverage_common import latest_target, target_bytes
from script_sources import load_script
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as R

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
FACTORY, FORMAT, LOCALE, RESERVE, FREE = (
    0x14583D3E0, 0x145CE7350, 0x1458DFF90, 0x145D40630, 0x1400021D0)
FORMATS = {0x146CCCD97: b"\x0alegendary:\xc0\x00",
           0x146CB4E80: b"\x08ability.\xc0\x05.name\x00",
           0x146CCCE3C: b"\xc0\x02: \xc0\x00"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("timer_name_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None and 0 <= offset <= len(data) - size
        return data[offset:offset + size]

    for address, value in FORMATS.items():
        assert raw(address, len(value)) == value
    assert raw(0x146CCCD08, 19) == b"The Reaper's Amulet"
    metadata = json.loads((ROOT / "docs/analysis/evidence/addon-timers/metadata.json").read_text())
    factory = metadata["generated_timer_amulets"]["factory"]
    assert int(factory["va"], 16) == FACTORY
    assert hashlib.sha256(raw(FACTORY, factory["size"])).hexdigest() == factory["sha256"]

    class Probe:
        def __init__(self, translations):
            self.u = Uc(UC_ARCH_X86, UC_MODE_64)
            self.u.mem_map(0x20000000, 0x20000)
            self.u.mem_map(0x30000000, 0x20000)
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED, self.missing)
            self.u.hook_add(UC_HOOK_CODE, self.hook)
            self.translations, self.lookups, self.formats = translations, [], []
            self.storage, self.executed, self.returned = 0x30014000, set(), False

        def missing(self, machine, access, address, size, value, _):
            page = address & ~4095
            assert pe.image_base <= page < pe.image_base + 0x10000000
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            return True

        def reg(self, name):
            return self.u.reg_read(getattr(R, "UC_X86_REG_" + name))

        def q(self, address):
            return struct.unpack("<Q", self.u.mem_read(address, 8))[0]

        def bytes(self, address, size):
            return raw(address, size) if address >= pe.image_base else bytes(self.u.mem_read(address, size))

        def pair(self, address):
            pointer, size = struct.unpack("<QQ", self.bytes(address, 16))
            return self.bytes(pointer, size).decode()

        def text(self, value):
            pointer = self.storage
            self.storage += 256
            assert self.storage <= 0x30020000
            self.u.mem_write(pointer, value.encode() or b"\0")
            return pointer, len(value.encode())

        def ret(self):
            stack = self.reg("RSP")
            self.u.reg_write(R.UC_X86_REG_RIP, self.q(stack))
            self.u.reg_write(R.UC_X86_REG_RSP, stack + 8)

        def hook(self, machine, address, size, _):
            if address == 0x20000000:
                self.returned = True
                machine.emu_stop()
                return
            if FACTORY <= address < FACTORY + factory["size"]:
                self.executed.add((address, size))
                return
            c, d, r8 = [self.reg(name) for name in ["RCX", "RDX", "R8"]]
            if address == RESERVE:
                assert self.q(c) == self.q(c + 16) == 0
                machine.mem_write(c, struct.pack("<QQQ", 256, 0x30010000, 0))
            elif address == LOCALE:
                key = self.bytes(c, d).decode()
                self.lookups.append(key)
                if key in self.translations:
                    pointer, count = self.text(self.translations[key])
                    machine.reg_write(R.UC_X86_REG_RAX, pointer)
                    machine.reg_write(R.UC_X86_REG_RDX, count)
                else:
                    machine.reg_write(R.UC_X86_REG_RAX, 0)
            elif address == FORMAT:
                assert d in FORMATS, hex(d)
                first = self.pair(self.q(r8))
                if d == 0x146CCCD97:
                    value = "legendary:" + first
                elif d == 0x146CB4E80:
                    value = "ability." + first + ".name"
                else:
                    value = first + ": " + self.pair(self.q(r8 + 16))
                self.formats.append(dict(template=hex(d), value=value))
                pointer, count = self.text(value)
                machine.mem_write(c, struct.pack("<QQQ", count, pointer, count))
            elif address != FREE:
                raise AssertionError(f"Unreviewed native call {address:#x}")
            self.ret()

        def run(self, descriptor):
            self.u.mem_write(0x20018008, struct.pack("<Q", 0x20000000))
            for name, value in [("RSP", 0x20018008), ("RCX", 0x30000000), ("RDX", descriptor)]:
                self.u.reg_write(getattr(R, "UC_X86_REG_" + name), value)
            self.u.emu_start(FACTORY, 0, count=100000)
            assert self.returned and len(self.formats) == 3
            key, name = self.pair(0x30000008), self.pair(0x30000020)
            return key, name

    spells = json.loads((ROOT / "crates/azeroth-survivors-re/assets/addon-spell-metadata-0.112.0.json").read_text())
    cases, spans = [], set()
    for key in ["execute", "eviscerate", "backstab"]:
        index, spell = next((i, row) for i, row in enumerate(spells) if row["key"] == key)
        lookup = f"ability.{key}.name"
        for label, translations in [
            ("missing", {}),
            ("prefix-only", {"The Reaper's Amulet": "Prefix"}),
            ("ability-only", {lookup: "Ability"}),
            ("both", {"The Reaper's Amulet": "Prefix", lookup: "Ability"}),
            ("empty-prefix", {"The Reaper's Amulet": "", lookup: "Ability"}),
            ("empty-ability", {"The Reaper's Amulet": "Prefix", lookup: ""}),
            ("both-empty", {"The Reaper's Amulet": "", lookup: ""}),
            ("ignore-literal-name", {spell["name"]: "Wrong"}),
        ]:
            probe = Probe(translations)
            native_key, name = probe.run(0x146CC4580 + index * 120)
            expected = translations.get("The Reaper's Amulet", "The Reaper's Amulet") + ": " + translations.get(lookup, spell["name"])
            assert native_key == "legendary:" + key and name == expected
            assert probe.lookups == ["The Reaper's Amulet", lookup]
            spans.update(probe.executed)
            cases.append(dict(ability=key, case=label, translations=translations,
                              lookups=probe.lookups, formats=probe.formats, key=native_key, name=name))
    assembly = ROOT / "docs/analysis/evidence/addon-timers/generated-name.asm"
    record = dict(target_sha256=SHA,
                  factory_reference="metadata.json#/generated_timer_amulets/factory",
                  rea_evidence_id="ev_4ccdd20d98d77b34649f97e4337d60e664812ddc4edbd16462e9886c22ad8b7b",
                  formatter_literals=[dict(va=hex(a), bytes_hex=v.hex(), sha256=hashlib.sha256(v).hexdigest()) for a, v in FORMATS.items()],
                  common_tail=dict(start="0x14583e84a", end="0x14583e9fe", sha256=hashlib.sha256(raw(0x14583E84A, 0x1B4)).hexdigest(),
                                   assembly="generated-name.asm", assembly_sha256=hashlib.sha256(assembly.read_bytes()).hexdigest()),
                  case_count=len(cases), cases=cases,
                  executed_instruction_count=len(spans),
                  executed_bytes_sha256=hashlib.sha256(b"".join(raw(a, n) for a, n in sorted(spans))).hexdigest(),
                  limits=["Original constructor instructions execute with synthetic storage, locale-map and literal formatting seams. No application, addon, reconstructed Rust or build executes.",
                          "Formatting seams assert all three exact current templates and supply their string outputs; allocation and std formatting are not reimplemented as native evidence.",
                          "The broader Ghidra result overextended the containing procedure and has unrelated bad instruction/control-flow warnings. Only the original-address common tail and successful bounded instruction cases support these names.",
                          "The source uses these recovered parts for timer publication. Actual locale selection/reward timing and original/rebuilt runtime parity remain unverified."])
    destination = args.output or ROOT / "docs/analysis/evidence/addon-timers/generated-name-cases.json"
    assert destination.resolve().is_relative_to(ROOT)
    if args.write:
        destination.write_text(portable_json(record, indent=2, ensure_ascii=False) + "\n")
    else:
        assert portable_record(record) == portable_record(json.loads(destination.read_text()))
    print(f"PASS: {len(cases)} current generated timer-name cases; exact prefix/ability lookup, empty/fallback behavior and native name storage; no build/game")


if __name__ == "__main__":
    main()

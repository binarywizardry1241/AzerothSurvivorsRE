#!/usr/bin/env python3
"""Bound current follower producers, showcase selection and expiry without a build/game.

Native instructions use the existing local Unicorn dependency with declared
allocator/Vec-storage seams. Amulet construction reuses its canonical probe.
"""
from script_sources import load_script
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from coverage_common import latest_target

SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/raid/follower-audit/5bbc8003c866"
RETAINED = ROOT / "docs/analysis/evidence/follower-lifecycle"


def module(name, path):
    value = load_script(name, ROOT / path)
    return value


def recover():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    m = module("follower_probe", "scripts/recover-rewards-layout.py")

    def raw(address, size):
        offset = m.pe.rva_offset(address - m.pe.image_base)
        return m.data[offset:offset + size]

    def pair(address):
        return struct.unpack("<QQ", raw(address, 16))

    def text(address):
        pointer, length = pair(address)
        return raw(pointer, length).decode() if length else None

    talents, follower_rows, tags = 0, [], Counter()
    payload_bytes = bytearray()
    for class_index, class_id in enumerate([1, 2, 3, 4, 5, 7, 8, 9, 11]):
        for tree in range(3):
            pointer, count = pair(0x146E74860 + class_index * 200 + tree * 64 + 48)
            for index in range(count):
                record = pointer + index * 120
                effect_pointer, effect_count = pair(record + 80)
                talents += 1
                for effect_index in range(effect_count):
                    address = effect_pointer + effect_index * 64
                    payload = raw(address, 64)
                    tags[payload[0]] += 1
                    payload_bytes.extend(payload)
                    if payload[0] in (2, 29, 30, 31, 32, 33, 34):
                        follower_rows.append(dict(class_id=class_id, key=text(record + 32),
                                                  address=hex(address), tag=payload[0],
                                                  sha256=hashlib.sha256(payload).hexdigest()))
    assert talents == 355 and tags[2] == 0
    equipment = module("follower_equipment", "scripts/recover-equipment-catalog.py")
    amulets, _, _ = equipment.amulets(m.data, m.pe)
    amulet_tags = Counter(row["tag"] for group in amulets.values() for entry in group for row in entry["effects"])
    assert sum(len(group) for group in amulets.values()) == 130 and amulet_tags[2] == 0

    class Probe(m.Probe):
        stops = ()
        allowed = None

        def hook(self, machine, address, size, unused):
            if address in self.stops:
                self.stopped = address
                self.u.emu_stop()
                return
            if self.allowed and self.allowed[0] <= address < self.allowed[1]:
                return
            if self.start <= address < m.bounds[self.start] or address == 0x400000000:
                return super().hook(machine, address, size, unused)
            c, d, sp = [self.reg(reg) for reg in (m.UC_X86_REG_RCX, m.UC_X86_REG_RDX, m.UC_X86_REG_RSP)]
            if address in (0x145bcb370, 0x145bcb2d0):
                capacity, pointer, length = struct.unpack("<3Q", self.read(c, 24))
                stride = 8 if address == 0x145bcb370 else 16
                capacity = max(4, capacity * 2)
                new = self.alloc(capacity * stride)
                if length:
                    self.u.mem_write(new, self.read(pointer, length * stride))
                self.u.mem_write(c, struct.pack("<3Q", capacity, new, length))
            else:
                return super().hook(machine, address, size, unused)
            self.u.reg_write(m.UC_X86_REG_RIP, self.q(sp))
            self.u.reg_write(m.UC_X86_REG_RSP, sp + 8)

    selectors = []
    for class_id in range(13):
        p = Probe(0x1458e62c0)
        output = p.alloc(24)
        p.run([output, class_id])
        _, pointer, count = struct.unpack("<3Q", p.read(output, 24))
        pointers = struct.unpack("<" + "Q" * count, p.read(pointer, count * 8)) if count else []
        selected = [dict(address=hex(address), entry=struct.unpack("<I", p.read(address + 32, 4))[0],
                         special=p.read(address + 57, 1)[0]) for address in pointers]
        selectors.append(dict(class_id=class_id, selected=selected,
                              showcase_entries=[row["entry"] for row in selected if row["special"]]))
    assert selectors[9]["showcase_entries"] == [9512, 9518, 9519, 9520, 9521, 9522, 9523, 9514]
    assert all(not row["showcase_entries"] for row in selectors if row["class_id"] != 9)
    assert struct.unpack("<f", raw(0x145d70c74, 4))[0] == 40.0

    expiry = []
    cases = [(0., []), (10., [(0, 0.), (1, 11.), (1, 10.), (1, 9.)]),
             (10., [(1, float("nan")), (1, float("inf")), (1, float("-inf"))]),
             (float("nan"), [(1, 0.)]), (10., [(1, 1.)] * 6)]
    for now, rows in cases:
        p = Probe(0x1459a1a40)
        output, descriptor, entries, clock = [p.alloc(size) for size in (24, 24, max(1, len(rows)) * 120, 4)]
        p.u.mem_write(clock, struct.pack("<f", now))
        p.u.mem_write(descriptor, struct.pack("<3Q", entries, entries + len(rows) * 120, clock))
        for index, (temporary, deadline) in enumerate(rows):
            p.u.mem_write(entries + index * 120, struct.pack("<IfQQQQ", temporary, 0.,
                0, 0, 0, 100 + index))
            p.u.mem_write(entries + index * 120 + 8, struct.pack("<f", deadline))
            p.wq(entries + index * 120 + 16, index)
        p.run([output, descriptor])
        _, pointer, count = struct.unpack("<3Q", p.read(output, 24))
        selected = [list(struct.unpack("<2Q", p.read(pointer + index * 16, 16))) for index in range(count)]
        assert selected == [[100 + index, index] for index, (temporary, deadline) in enumerate(rows)
                            if temporary == 1 and now >= deadline]
        expiry.append(dict(now_bits=struct.unpack("<I", struct.pack("<f", now))[0],
                           rows=[dict(temporary=temporary, deadline_bits=struct.unpack("<I", struct.pack("<f", deadline))[0])
                                 for temporary, deadline in rows], expired=selected))

    gates = []
    for index, count, tag, slots in [(0, 0, 34, 1), (0, 1, 34, 1), (0, 1, 33, 1),
                                    (0, 1, 34, 0), (1, 2, 34, 1), (1, 2, 34, 2),
                                    (0xffffffffffffffff, 2, 34, 2)]:
        p = Probe(0x1459a1a40)
        p.allowed, p.stops = (0x145904df5, 0x145904e24), (0x145904d60, 0x145904e24)
        game, effects = p.alloc(4096), p.alloc(128)
        p.wq(game + 0x7b0, count)
        p.wq(game + 0x7a8, effects)
        p.wq(game + 0x78, slots)
        for offset in (0, 64):
            p.u.mem_write(effects + offset, bytes([tag]))
        p.u.reg_write(m.UC_X86_REG_R13, game)
        p.u.reg_write(m.UC_X86_REG_R15, index)
        p.u.emu_start(0x145904df5, 0x145904e25, count=30)
        admitted = p.stopped == 0x145904e24
        assert admitted == (index < count and tag == 34 and index < slots)
        gates.append(dict(origin_index=index, effect_count=count, native_tag=tag, deadline_slots=slots, admitted=admitted))

    return dict(target_sha256=SHA, producer_inventory=dict(talent_definitions=talents,
                talent_effects=sum(tags.values()), talent_native_tags=dict(sorted(tags.items())),
                talent_payload_digest=hashlib.sha256(payload_bytes).hexdigest(), follower_rows=follower_rows,
                amulet_definitions=130, amulet_effects=sum(amulet_tags.values()),
                amulet_native_tags=dict(sorted(amulet_tags.items())), raw2_talent_producers=0, raw2_amulet_producers=0),
                class_selector=selectors, expiry=expiry, departure_origin_gate=gates,
                showcase_lifetime_bits=struct.unpack("<I", raw(0x145d70c74, 4))[0],
                limits=["Full current talent/amulet catalog producers are traversed; arbitrary dynamically generated Effect64 values remain outside this negative inventory.",
                        "Unchanged native instructions with allocator/Vec-storage seams; no game process, keyboard/device input, Rust execution or rendering.",
                        "Source callback/special-combat consumers are traced separately; catalog tags and isolated vectors do not establish whole gameplay parity."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = recover()
    WORK.mkdir(parents=True, exist_ok=True)
    if args.check:
        assert json.loads((RETAINED / "native-vectors.json").read_text()) == json.loads(json.dumps(result))
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        pe_module = module("follower_identity", "scripts/inventory-executable.py")
        data = (ROOT / latest_target(verify=True)["path"]).read_bytes()
        pe = pe_module.PE(data)
        for row in manifest["extracts"]:
            offset, size = pe.rva_offset(int(row["virtual_address"], 16) - pe.image_base), row["byte_count"]
            assert hashlib.sha256(data[offset:offset + size]).hexdigest() == row["sha256"]
            assert hashlib.sha256((RETAINED / row["assembly"]).read_bytes()).hexdigest() == row["assembly_sha256"]
    else:
        (WORK / "native-vectors.json").write_text(json.dumps(result, indent=2) + "\n")
    print(f"Verified 355 talent definitions/{result['producer_inventory']['talent_effects']} effects, 130 amulets/{result['producer_inventory']['amulet_effects']} effects, 13 native class selectors, 5 expiry and 7 origin gates; no builds/games")


if __name__ == "__main__":
    main()

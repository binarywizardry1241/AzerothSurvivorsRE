#!/usr/bin/env python3
"""Replay current AS typed collection/instance and packed-GUID boundaries.

The Windows EXE is data for Unicorn, never launched. Explicit allocator and
byte-operation seams do not establish an engine implementation or packet parity.
All inputs, output hashes and limitations belong to the selected target.
"""
import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, json_text, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r

sys.path.insert(0, str(ROOT / "runtime/tool-state/python/camera/python-libs"))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
KEPT = ROOT / "docs/analysis/evidence/0.113.2/as-state-contracts/collections.json"
STAGE = ROOT / "runtime/analysis/history/native-recovery/as-state-contracts/a6cf7f2e1fff/staged/collections.json"
OWNERS = [("packed-guid", 0x1458B6E10, 0x1458B7025),
          ("remove-pickup", 0x14594FD70, 0x14594FF8D),
          ("nearby-pickup-guids", 0x14598AD90, 0x14598AFEE),
          ("linked-pickup-guids", 0x14598B760, 0x14598B91C),
          ("free-instance", 0x145939920, 0x145939B35),
          ("delayed-action-admission", 0x145913FC9, 0x145913FE3),
          ("delayed-action-snapshot-compaction", 0x145914068, 0x1459140C3)]


def digest(value):
    return hashlib.sha256(value).hexdigest()


class Machine:
    def __init__(self, image, pe):
        self.image, self.pe = image, pe
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        size = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
        self.u.mem_map(pe.image_base, (size + 4095) & ~4095)
        for section in pe.sections:
            self.u.mem_write(pe.image_base + section["rva"],
                             image[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
        self.mem, self.stack, self.done = 0x200000000, 0x300000000, 0x400000000
        self.u.mem_map(self.mem, 0x100000)
        self.u.mem_map(self.stack, 0x20000)
        self.u.mem_map(self.done, 4096)
        self.stops = set()
        self.seams = set()
        self.u.hook_add(UC_HOOK_CODE, self.hook)
        self.reset()

    def reset(self):
        self.u.mem_write(self.mem, bytes(0x20000))
        self.u.mem_write(self.stack, bytes(0x20000))
        self.heap = self.mem + 0x10000
        self.stops = {self.done}
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9",
                     "R10", "R11", "R12", "R13", "R14", "R15"):
            self.u.reg_write(getattr(r, "UC_X86_REG_" + name), 0)
        for i in range(16):
            self.u.reg_write(getattr(r, "UC_X86_REG_XMM" + str(i)), 0)
        self.u.reg_write(r.UC_X86_REG_EFLAGS, 2)
        self.u.reg_write(r.UC_X86_REG_MXCSR, 0x1F80)

    def raw(self, first, last):
        at = self.pe.rva_offset(first - self.pe.image_base)
        assert at is not None
        return self.image[at:at + last - first]

    def q(self, at):
        return struct.unpack("<Q", self.u.mem_read(at, 8))[0]

    def put(self, at, *values):
        self.u.mem_write(at, struct.pack("<" + "Q" * len(values), *values))

    def alloc(self, count):
        at = self.heap
        self.heap += (max(count, 1) + 15) & ~15
        assert self.heap < self.mem + 0x100000
        self.u.mem_write(at, bytes(max(count, 1)))
        return at

    def hook(self, u, address, size, context):
        if address in self.stops:
            u.emu_stop()
            return
        if address not in (0x140002200, 0x1400021C0, 0x1400021D0,
                           0x145CF998B, 0x145CF999D, 0x145CF9991, 0x145CF99DF):
            return
        self.seams.add(address)
        c, d, count = (u.reg_read(reg) for reg in
                       (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
        if address == 0x1400021C0:
            u.reg_write(r.UC_X86_REG_RAX, self.alloc(c))
        elif address in (0x145CF998B, 0x145CF999D):
            u.mem_write(c, bytes(u.mem_read(d, count)))
            u.reg_write(r.UC_X86_REG_RAX, c)
        elif address == 0x145CF9991:
            left, right = bytes(u.mem_read(c, count)), bytes(u.mem_read(d, count))
            u.reg_write(r.UC_X86_REG_RAX, ((left > right) - (left < right)) & ((1 << 64) - 1))
        elif address == 0x145CF99DF:
            value = struct.unpack("<f", struct.pack("<I", u.reg_read(r.UC_X86_REG_XMM0) & 0xFFFFFFFF))[0]
            rounded = math.copysign(math.floor(abs(value) + 0.5), value) if math.isfinite(value) else value
            u.reg_write(r.UC_X86_REG_XMM0, int.from_bytes(struct.pack("<f", rounded), "little"))
        sp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, self.q(sp))
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def call(self, first, *arguments):
        sp = self.stack + 0x10008
        self.put(sp, self.done)
        self.u.reg_write(r.UC_X86_REG_RSP, sp)
        for register, value in zip((r.UC_X86_REG_RCX, r.UC_X86_REG_RDX,
                                   r.UC_X86_REG_R8, r.UC_X86_REG_R9), arguments):
            self.u.reg_write(register, value)
        try:
            self.u.emu_start(first, 0, count=100000)
        except Exception as error:
            raise RuntimeError(f"Native fixture {first:#x} stopped at "
                               f"{self.u.reg_read(r.UC_X86_REG_RIP):#x}") from error
        assert self.u.reg_read(r.UC_X86_REG_RIP) in self.stops


def packed_guids(machine):
    cases = []
    for mask in range(256):
        for seed in (1, 127, 255):
            value = bytes(((seed + index * 17 - 1) % 255 + 1) if mask >> index & 1 else 0
                          for index in range(8))
            for prefix in (b"", b"abc"):
                machine.reset()
                vector, buffer = machine.mem, machine.mem + 0x1000
                machine.put(vector, 64, buffer, len(prefix))
                machine.u.mem_write(buffer, prefix + bytes(16))
                machine.call(0x1458B6E10, int.from_bytes(value, "little"), vector)
                expected = prefix + bytes([mask]) + bytes(byte for byte in value if byte)
                assert machine.q(vector + 16) == len(expected)
                assert bytes(machine.u.mem_read(buffer, len(expected))) == expected
                cases.append([value.hex(), prefix.hex(), expected.hex()])
    return dict(cases=len(cases), result_sha256=digest(json_text(cases).encode()))


def pickup_readers(machine):
    linked, nearby = [], []
    for kind in range(256):
        for associated in (0, 1):
            machine.reset()
            game, row, companion, iterator, out = (machine.mem + offset for offset in
                                                  (0, 0x2000, 0x3000, 0x4000, 0x5000))
            value = bytearray(72)
            struct.pack_into("<IQ", value, 32, kind, 0)  # kind and alignment bytes
            struct.pack_into("<Q", value, 40, 0x1234)
            machine.u.mem_write(row, bytes(value))
            machine.put(game + 0x958, companion, 1)
            machine.u.mem_write(companion + 0x18, struct.pack("<I", associated))
            machine.put(companion + 0x20, 0x1234)
            machine.put(iterator, row, row + 72, game)
            machine.call(0x14598B760, out, iterator)
            count = machine.q(out + 16)
            assert count == associated
            assert not count or machine.q(machine.q(out + 8)) == 0x1234
            assert bytes(machine.u.mem_read(row, 72)) == value
            linked.append([kind, associated, count])
    for kind in (*range(256), 0xFFFFFFFF):
        for flying in (0, 1):
            for subtype in range(4):
                for distance in (1.0, 3.0):
                    machine.reset()
                    row, iterator, out, selected, point, radius = (machine.mem + offset for offset in
                                                                  (0, 0x1000, 0x2000, 0x3000, 0x4000, 0x5000))
                    value = bytearray(72)
                    value[24] = flying
                    struct.pack_into("<I", value, 32, kind)
                    struct.pack_into("<Q", value, 40, 0x1234)
                    struct.pack_into("<3f", value, 52, distance, 0.0, 0.0)
                    machine.u.mem_write(row, bytes(value))
                    machine.u.mem_write(selected, bytes([subtype]))
                    machine.u.mem_write(radius, struct.pack("<f", 2.0))
                    machine.put(iterator, row, row + 72, selected, selected, point, radius)
                    machine.call(0x14598AD90, out, iterator)
                    count = machine.q(out + 16)
                    expected = int(not flying and (kind < 2 or (3 <= kind < 6 and subtype == 3))
                                   and distance <= (4.0 if kind == 0 and subtype == 2 else 2.0))
                    assert count == expected, (kind, flying, subtype, distance, count, expected)
                    assert not count or machine.q(machine.q(out + 8)) == 0x1234
                    assert bytes(machine.u.mem_read(row, 72)) == value
                    nearby.append([kind, flying, subtype, distance, count])
    return dict(linked_cases=len(linked), nearby_cases=len(nearby),
                linked_sha256=digest(json_text(linked).encode()),
                nearby_sha256=digest(json_text(nearby).encode()), native_rows_unchanged=True)


def pickup_removal(machine):
    cases = []
    for count in range(9):
        for index in range(count + 1):
            machine.reset()
            game, rows = machine.mem, machine.mem + 0x2000
            value = bytes((i * 43 + 17) % 256 for i in range(count * 72))
            machine.u.mem_write(rows, value if value else b"\0")
            machine.put(game + 0x608, count + 4, rows, count)
            machine.stops.update((0x14594FDEF, 0x14594FF63))
            machine.call(0x14594FD70, game, index)
            admitted = index < count
            assert machine.q(game + 0x618) == count - admitted
            assert machine.q(game + 0x608) == count + 4 and machine.q(game + 0x610) == rows
            expected = value[:index * 72] + value[(index + 1) * 72:] if admitted else value
            assert bytes(machine.u.mem_read(rows, len(expected))) == expected
            assert machine.u.reg_read(r.UC_X86_REG_RIP) == (0x14594FDEF if admitted else 0x14594FF63)
            cases.append([count, index, admitted, digest(expected)])
    return dict(cases=len(cases), result_sha256=digest(json_text(cases).encode()),
                boundary="Stop after native full-record memmove/length store, before destructor packet allocation or panic.")


def free_instances(machine):
    cases = []
    for count in range(7):
        for match in range(-1, count):
            machine.reset()
            game, rows, descriptors, strings, out = (machine.mem + offset for offset in
                                                     (0, 0x2000, 0x4000, 0x6000, 0x8000))
            requested = descriptors + 0x1000
            machine.put(requested, strings + 0x800, 4)
            machine.u.mem_write(strings + 0x800, b"want")
            values = []
            for index in range(count):
                key = b"want" if index == match else b"else"
                descriptor = descriptors + index * 0x100
                machine.put(descriptor, strings + index * 8, len(key))
                machine.u.mem_write(strings + index * 8, key)
                value = bytearray((i * 13 + index * 11 + 5) % 256 for i in range(88))
                struct.pack_into("<Q", value, 0, descriptor)
                struct.pack_into("<f", value, 16, float(index + 1))
                machine.u.mem_write(rows + index * 88, bytes(value))
                values.append(bytes(value))
            machine.put(game + 0x330, rows, count)
            before = bytes(machine.u.mem_read(game, 0x1000))
            machine.call(0x145939920, out, game, requested)
            actual = bytes(machine.u.mem_read(out, 84))
            if match >= 0:
                assert actual == values[match][:84]
            else:
                assert machine.q(out) == requested
                assert struct.unpack("<I", actual[8:12])[0] == 1
                assert struct.unpack("<f", actual[12:16])[0] == 0.5
                assert struct.unpack("<f", actual[16:20])[0] == (max(1.0, (count + 1) / 2) if count else 1.0)
                assert actual[36:56] == bytes(20), "Five neutral upgrade lanes"
            assert bytes(machine.u.mem_read(game, 0x1000)) == before
            assert bytes(machine.u.mem_read(rows, count * 88)) == b"".join(values)
            cases.append([count, match, digest(actual)])
    return dict(cases=len(cases), result_sha256=digest(json_text(cases).encode()),
                semantic_bytes=84, stride=88, game_and_learned_input_unchanged=True,
                limits="Fallback modifier vector is empty; arbitrary aliased output/input pointers are not admitted.")


def hazard_actions(machine):
    gates, snapshots = [], []
    for deadline in (-math.inf, -1.0, 0.0, 1.0, math.inf, math.nan):
        for now in (-math.inf, -1.0, 0.0, 1.0, math.inf, math.nan):
            machine.reset()
            game, row, bp = machine.mem, machine.mem + 0x2000, machine.stack + 0x8000
            machine.put(game + 0x5B0, row)
            machine.u.mem_write(row + 8, struct.pack("<f", deadline))
            machine.u.mem_write(bp + 0x240, struct.pack("<f", now))
            machine.u.reg_write(r.UC_X86_REG_R15, game)
            machine.u.reg_write(r.UC_X86_REG_RSI, 0)
            machine.u.reg_write(r.UC_X86_REG_RBP, bp)
            machine.stops.update((0x145913FE3, 0x145914967))
            machine.call(0x145913FC9)
            due = not deadline > now
            assert machine.u.reg_read(r.UC_X86_REG_RIP) == (0x145913FE3 if due else 0x145914967)
            gates.append([struct.pack("<f", deadline).hex(), struct.pack("<f", now).hex(), due])
    for count in range(1, 7):
        for index in range(count):
            for tag in (0, 1, 12, 26, 35, 36, 37, 255):
                machine.reset()
                game, rows, bp = machine.mem, machine.mem + 0x2000, machine.stack + 0x8000
                values = [bytearray((i * 29 + row * 17) % 256 for i in range(64)) for row in range(count)]
                values[index][61] = tag
                original = b"".join(values)
                machine.u.mem_write(rows, original)
                machine.put(game + 0x5A8, count + 4, rows, count)
                machine.put(bp + 0x248, game)
                machine.u.reg_write(r.UC_X86_REG_RCX, rows + index * 64)
                machine.u.reg_write(r.UC_X86_REG_R14, count)
                machine.u.reg_write(r.UC_X86_REG_RDI, (~index) & ((1 << 64) - 1))
                machine.u.reg_write(r.UC_X86_REG_RBP, bp)
                machine.stops.add(0x1459140C3)
                machine.call(0x145914068)
                snapshot = (bytes(machine.u.mem_read(bp + 0x1E0, 4))
                            + struct.pack("<Q", machine.u.reg_read(r.UC_X86_REG_R13))
                            + bytes(machine.u.mem_read(bp + 0x200, 16))
                            + bytes(machine.u.mem_read(bp + 0x210, 16))
                            + bytes(machine.u.mem_read(bp + 0x220, 1))
                            + bytes([machine.u.reg_read(r.UC_X86_REG_RSI) & 255])
                            + struct.pack("<H", machine.u.reg_read(r.UC_X86_REG_R12) & 65535))
                assert snapshot == values[index][16:64]
                assert machine.u.reg_read(r.UC_X86_REG_R15) == struct.unpack_from("<Q", values[index])[0]
                expected = original[:index * 64] + original[(index + 1) * 64:]
                assert bytes(machine.u.mem_read(rows, len(expected))) == expected
                assert machine.q(game + 0x5B8) == count - 1
                assert machine.q(game + 0x5A8) == count + 4 and machine.q(game + 0x5B0) == rows
                snapshots.append([count, index, tag, digest(snapshot), digest(expected)])
    source = (ROOT / "crates/azeroth-survivors-re/src/bosses/raid_lines.rs").read_text()
    body = "".join(source.split("pub(crate) fn take_due", 1)[1].split("pub(crate) fn apply", 1)[0].split())
    assert "ifself.rows[*index].at>now{*index+=1;continue;}" in body
    assert "letrow=self.rows.remove(*index);" in body
    return dict(admission_cases=len(gates), snapshot_cases=len(snapshots),
                admission_sha256=digest(json_text(gates).encode()),
                snapshot_sha256=digest(json_text(snapshots).encode()),
                layout="Game+5a8/5b0/5b8, stride64, action bytes16..63",
                boundary="Due/admitted local queue prefixes only; tag dispatch, source lookup and payload execution are excluded.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.113.2" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("as_collections_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    machine = Machine(image, pe)
    lines = []
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for role, first, last in OWNERS:
        lines.append(f"// {role}")
        lines.extend(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                     for i in decoder.disasm(machine.raw(first, last), first))
    assembly = "\n".join(lines) + "\n"
    if args.stage:
        STAGE.parent.mkdir(parents=True, exist_ok=True)
        STAGE.with_suffix(".asm").write_text(assembly)
    else:
        assert assembly == KEPT.with_suffix(".asm").read_text(), "Collection assembly drift"

    result = dict(schema_version=1,
                  target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                  owners=[dict(role=role, va=hex(a), end_exclusive=hex(z), byte_count=z-a,
                               sha256=digest(machine.raw(a, z))) for role, a, z in OWNERS],
                  packed_guid=packed_guids(machine), pickup_readers=pickup_readers(machine),
                  pickup_remove=pickup_removal(machine), free_instance=free_instances(machine),
                  hazard_actions=hazard_actions(machine),
                  seams=[hex(address) for address in sorted(machine.seams)],
                  limits=["Synthetic typed inputs do not prove whole-program alias closure, producer-domain closure or native source ownership.",
                          "Allocator/free/memcpy/memmove/memcmp/roundf are explicit host seams; GUID fixtures preallocate capacity.",
                          "No compiler, Rust code, client/game process or original/rebuilt comparison executes."])
    if args.stage:
        STAGE.parent.mkdir(parents=True, exist_ok=True)
        STAGE.write_text(json_text(result))
    else:
        assert result == json.loads(KEPT.read_text()), "Collection evidence drift"
    print(json_text({key: value for key, value in result.items()
                    if key in ("packed_guid", "pickup_readers", "pickup_remove", "free_instance", "hazard_actions", "seams")}))


if __name__ == "__main__":
    main()

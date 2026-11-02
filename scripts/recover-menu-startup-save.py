"""Record native damaged-save startup branches with bounded, filesystem-free emulation."""
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
data = (ROOT / "AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
SHA = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"
assert hashlib.sha256(data).hexdigest() == SHA
pe = inventory.PE(data)
native_ranges = [(0x1453F9D00, 0x1453FA51F), (0x1453F8AD0, 0x1453F8BAE),
                 (0x1453F9130, 0x1453F92C7), (0x1453E23E0, 0x1453E24C1)]
uc = Uc(UC_ARCH_X86, UC_MODE_64)
image_size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
uc.mem_map(pe.image_base, (image_size + 4095) & ~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
HEAP, STACK, STOP = 0x200000000, 0x300000000, 0x400000000
uc.mem_map(HEAP, 0x100000)
uc.mem_map(STACK, 0x20000)
uc.mem_map(STOP, 4096)
next_heap = HEAP + 0x1000
current = None
events = None
calls = {}


def reg(register):
    return uc.reg_read(register)


def q(address):
    return struct.unpack("<Q", uc.mem_read(address, 8))[0]


def putq(address, value):
    uc.mem_write(address, struct.pack("<Q", value))


def text(address, length):
    return bytes(uc.mem_read(address, length)).decode()


def pair(address):
    return text(q(address), q(address + 8))


def allocate(size):
    global next_heap
    address = next_heap
    next_heap += (size + 15) & ~15
    uc.mem_write(address, bytes(size))
    return address


def out_string(address, value):
    if value is None:
        putq(address, 0xFFFFFFFFFFFFFFFF)
    else:
        value = value.encode()
        pointer = allocate(len(value) + 1)
        uc.mem_write(pointer, value)
        uc.mem_write(address, struct.pack("<QQQ", len(value), pointer, len(value)))


def formatted(template, arguments):
    output, index = "", 0
    while True:
        opcode = uc.mem_read(template, 1)[0]
        template += 1
        if opcode == 0:
            return output
        if opcode < 0x80:
            output += text(template, opcode)
            template += opcode
            continue
        assert opcode == 0xC0, hex(opcode)
        value, formatter = q(arguments + index * 16), q(arguments + index * 16 + 8)
        index += 1
        if formatter == 0x1456DCB50:
            output += str(q(value))
        elif formatter == 0x1400020E0:
            output += pair(value + 8)
        elif formatter == 0x1400020C0:
            output += pair(value)
        else:
            raise RuntimeError(f"Unreviewed formatter {formatter:x}")


def hook(_, address, size, user):
    if any(start <= address < end for start, end in native_ranges):
        return
    calls[hex(address)] = calls.get(hex(address), 0) + 1
    rcx, rdx, r8, r9 = [reg(x) for x in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9)]
    if address == 0x145421330:
        # Active reader returns Option<String>; native read/UTF8 errors are None.
        out_string(rcx, current["input"])
    elif address == 0x14104F070:
        # All fixture input is ASCII. Only native prefix detection uses this trim.
        value = text(rcx, rdx)
        leading = len(value) - len(value.lstrip())
        uc.reg_write(UC_X86_REG_RAX, rcx + leading)
        uc.reg_write(UC_X86_REG_RDX, len(value.strip()))
    elif address == 0x1454569F0:
        # These fixtures deliberately use RSE1:broken: invalid Base64/payload length.
        assert text(rdx, r8).strip() == "RSE1:broken"
        out_string(rcx, None)
    elif address == 0x145421620:
        stem = text(rdx, r8)
        events.append({"read_backup": stem})
        out_string(rcx, current["backups"].get(stem))
    elif address == 0x145420CF0:
        events.append({"write_backup": text(rcx, rdx), "raw_text": text(r8, r9)})
    elif address == 0x1456C9BA0:
        out_string(rcx, formatted(rdx, r8))
    elif address == 0x1456B37A0:
        events.append({"stderr": formatted(rcx, rdx)})
    elif address in (0x140002200, 0x1400021D0):
        pass
    elif address == 0x1400021C0:
        uc.reg_write(UC_X86_REG_RAX, allocate(rcx))
    elif address == 0x1457149FD:
        uc.mem_write(rcx, bytes(uc.mem_read(rdx, r8)))
        uc.reg_write(UC_X86_REG_RAX, rcx)
    elif address == 0x1457149F7:
        equal = bytes(uc.mem_read(rcx, r8)) == bytes(uc.mem_read(rdx, r8))
        uc.reg_write(UC_X86_REG_RAX, 0 if equal else 1)
    else:
        raise RuntimeError(f"Unreviewed external call {address:x}")
    stack = reg(UC_X86_REG_RSP)
    destination = q(stack)
    uc.reg_write(UC_X86_REG_RSP, stack + 8)
    uc.reg_write(UC_X86_REG_RIP, destination)


uc.hook_add(UC_HOOK_CODE, hook)
bad = "RSE1:broken"
all_different = {f"characters.unreadable.{i}": f"earlier-{i}" for i in range(1, 33)}
cases = [
    {"label": "read_failure", "input": None, "backups": {}},
    {"label": "first_unused", "input": bad, "backups": {}},
    {"label": "reuse_identical_second", "input": bad, "backups": {"characters.unreadable.1": "different", "characters.unreadable.2": bad}},
    {"label": "skip_to_third", "input": bad, "backups": {"characters.unreadable.1": "different", "characters.unreadable.2": "also-different"}},
    {"label": "all32_occupied", "input": bad, "backups": all_different},
    {"label": "last_unused", "input": bad, "backups": {k: v for k, v in all_different.items() if not k.endswith(".32")}},
]
empty_output = None
for current in cases:
    uc.mem_write(HEAP, bytes(0x100000))
    next_heap = HEAP + 0x1000
    events = []
    stack = STACK + 0x1F008
    putq(stack, STOP)
    uc.reg_write(UC_X86_REG_RSP, stack)
    uc.reg_write(UC_X86_REG_RCX, HEAP)
    uc.emu_start(0x1453F9D00, STOP, count=100000)
    assert reg(UC_X86_REG_RIP) == STOP
    output = bytes(uc.mem_read(HEAP, 0x1B8))
    if empty_output is None:
        empty_output = output
    assert output == empty_output, "Every damaged input returns the same empty account as no readable save"
    current["native_events"] = events
    current["native_account_sha256"] = hashlib.sha256(output).hexdigest()
    current["native_pick_present"] = q(HEAP + 0x138) != 0xFFFFFFFFFFFFFFFF
    current["native_hero_count"] = q(HEAP + 0x130)

zone_cases = []
zone_keys = [pair(0x1466D2A08 + i * 184 + 8) for i in range(9)]
for class_id in (1, 8):
    for unlocked in (None, 0, 1, 2, 3, 8, 9, 10, 0xFFFFFFFFFFFFFFFF):
        for zone in zone_keys:
            uc.mem_write(HEAP, bytes(0x100000))
            next_heap = HEAP + 0x1000
            account, pick, output, records = HEAP, HEAP + 0x400, HEAP + 0x500, HEAP + 0x600
            if unlocked is not None:
                uc.mem_write(records, bytes([class_id]) + bytes(7) + struct.pack("<Q", unlocked))
                uc.mem_write(account + 0x18, struct.pack("<QQQ", 1, records, 1))
            out_string(pick, "Fixture")
            out_string(pick + 24, zone)
            uc.mem_write(pick + 48, struct.pack("<4H", 100, 100, 100, 100))
            hero = bytes([class_id, 1, 0, 0, 0, 0, 0, 0])
            uc.mem_write(pick + 56, hero)
            stack = STACK + 0x1F008
            putq(stack, STOP)
            for register, value in ((UC_X86_REG_RSP, stack), (UC_X86_REG_RCX, output),
                                    (UC_X86_REG_RDX, account), (UC_X86_REG_R8, pick)):
                uc.reg_write(register, value)
            uc.emu_start(0x1453F9130, STOP, count=10000)
            assert reg(UC_X86_REG_RIP) == STOP
            assert bytes(uc.mem_read(output + 56, 8)) == hero
            zone_cases.append({"class": class_id, "unlock": unlocked, "input_zone": zone,
                               "native_zone": pair(output + 32)})
manifest = {
    "target_sha256": SHA,
    "method": "Unchanged native loader, backup-slot helper, zone clamp and zone-index leaf executed in bounded Unicorn x86_64. IO is a declared in-memory stub; no OS/files/network calls are reachable inside emulated execution.",
    "native_ranges": [{"start": hex(a), "end_exclusive": hex(b), "sha256": hashlib.sha256(data[pe.rva_offset(a - pe.image_base):pe.rva_offset(b - pe.image_base)]).hexdigest()} for a, b in native_ranges],
    "stubs": {"active_reader": "Option<String> supplied as None or the declared invalid sealed input", "seal_opener": "Returns None only for the independently invalid RSE1:broken fixture", "auxiliary_reader": "Option<String> from the declared backup map", "auxiliary_writer": "Records attempted stem/raw-text write; native caller ignores its result", "trim": "ASCII fixture trim only", "format": "Reviewed compact Rust string/u64 formatting", "allocation_free": "Project-local emulator heap and no-op deallocation"},
    "calls": calls,
    "cases": cases,
    "startup_zone_cases": zone_cases,
    "limits": ["Native OS reader/UTF8 error-to-None behavior is proved separately from145421330 instructions, not by its stub.", "Fixtures cover native damaged-seal branch/account outputs and slot selection, not valid plaintext parsing or complete legacy migration.", "The original application was not launched. The native25ms Core-worker cadence remains outside this fixture."],
}
destination = ROOT / "docs/analysis/evidence/0.92/save/startup-recovery-fixtures.json"
destination.write_text(json.dumps(manifest, indent=2) + "\n")
print(f"Recorded {len(cases)} native startup and {len(zone_cases)} zone-clamp cases; damaged outputs exactly equal native unreadable-file default.")

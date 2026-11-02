#!/usr/bin/env python3
"""Replay bounded current Rewards input instructions or stage REA/Ghidra plans.

No build/application/OS file operation from the target is executed. Output stays
in runtime/rewards-menu-0.105.0; unreviewed native calls fail closed.
"""
from script_sources import load_script
import argparse
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
module = load_script("rewards_data", ROOT / "scripts/recover-rewards-data.py")
WORK, SHA, load, write = module.WORK, module.SHA, module.load, module.write

def fixtures(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_RBP, UC_X86_REG_R14, UC_X86_REG_RSP, UC_X86_REG_RIP

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (end + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    heap, stack = 0x200000000, 0x300000000
    u.mem_map(heap, 0x100000)
    u.mem_map(stack, 0x100000)
    rbp, sp = stack + 0x10000, stack + 0x8000
    admitted = [(0x140136C54, 0x140136CB8), (0x1401361B8, 0x1401361D1),
                (0x140136751, 0x1401367AC), (0x1401368B8, 0x1401368C8)]
    stop = {0x140136CB8, 0x140135B75, 0x140135B83}

    def q(a): return struct.unpack("<Q", u.mem_read(a, 8))[0]
    def wq(a, value): u.mem_write(a, struct.pack("<Q", value))
    def text(a): return bytes(u.mem_read(q(a + 8), q(a + 16))).decode()
    def hook(_, a, n, unused):
        if a in stop:
            u.emu_stop()
        elif a == 0x1400021D0:  # allocator release only, not a game/state behavior
            rsp = u.reg_read(UC_X86_REG_RSP)
            u.reg_write(UC_X86_REG_RIP, q(rsp))
            u.reg_write(UC_X86_REG_RSP, rsp + 8)
        elif not any(start <= a < end for start, end in admitted):
            raise RuntimeError(f"Unreviewed native instruction/call {a:#x}")
    u.hook_add(UC_HOOK_CODE, hook)
    pet_cases = []
    for pair in [("rabbit", "owl"), ("panda", "sapphiron")]:
        for slot in [0, 1, 7]:
            vec, new = heap + 0x1000, heap + 0x3000
            for i, value in enumerate(pair):
                raw = value.encode(); at = heap + 0x4000 + i * 256
                u.mem_write(at, raw); u.mem_write(vec + i * 24, struct.pack("<QQQ", len(raw), at, len(raw)))
            key = "macaw"; u.mem_write(new, key.encode())
            wq(rbp + 0x250, slot); wq(rbp + 0x258, len(key)); wq(rbp + 0x1B8, new)
            wq(rbp + 0x1C8, vec); wq(rbp + 0x1D0, 2)
            u.reg_write(UC_X86_REG_RBP, rbp); u.reg_write(UC_X86_REG_RSP, sp)
            u.emu_start(0x140136C54, 0, count=1000)
            assert u.reg_read(UC_X86_REG_RIP) == 0x140136CB8
            after = [text(vec + i * 24) for i in range(2)]
            expected = list(pair); expected[int(slot != 0)] = key
            assert after == expected
            pet_cases.append(dict(before=pair, slot=slot, selected=key, after=after))
    navigation = []
    for kind, destinations in [("keep", [3]), ("discard", [0, 3, 255])]:
        for destination in destinations:
            state, tick = heap + 0x8000, heap + 0x9000
            u.mem_write(state, bytes(256)); wq(state + 0x18, 123)
            u.mem_write(state + 0x72, b"\x01"); u.mem_write(state + 0x76, bytes([6, destination]))
            wq(rbp + 0x238, tick); wq(rbp + 0x240, 0); u.mem_write(rbp + 0x264, struct.pack("<I", 42))
            u.mem_write(rbp + 0x26C, struct.pack("<I", 0)); wq(rbp + 0x248, state)
            u.reg_write(UC_X86_REG_RBP, rbp); u.reg_write(UC_X86_REG_RSP, sp); u.reg_write(UC_X86_REG_R14, state)
            u.emu_start(0x1401361B8 if kind == "keep" else 0x140136751, 0, count=1000)
            assert u.reg_read(UC_X86_REG_RIP) in stop
            result = dict(kind=kind, requested=destination, pending=u.mem_read(state + 0x77, 1)[0],
                          armory_open=u.mem_read(state + 0x72, 1)[0], page=u.mem_read(state + 0x76, 1)[0],
                          plan=q(state + 0x18))
            assert result["pending"] == 254
            if kind == "keep": assert result["plan"] == 123 and result["page"] == 6
            else:
                assert result["plan"] == 0xFFFFFFFFFFFFFFFF
                assert result["armory_open"] == int(destination != 255)
                assert result["page"] == (6 if destination == 255 else destination)
            navigation.append(result)
    write(WORK / "input-vectors.json", dict(target_sha256=SHA, companion_selection=pet_cases, navigation=navigation,
          limitations=["Bounded original instruction replay; no app, UI query iteration or file write.",
                       "The incoming two-slot clone and allocated replacement string are fixture inputs; allocator release is a no-op.",
                       "Companion normalization/publication after140136cb8 is not executed.",
                       "Discard vectors start after dropping the owned plan; they cover clearing and navigation continuation. Confirm validation/save is not replayed."]))
    print("Passed6 native companion-selection and4 native navigation vectors")


def prepare(data, pe):
    functions = {pe.image_base + a: pe.image_base + e for a, e, *_ in pe.functions()}
    for name, addresses in [("actions", [0x140135A40]), ("modal", [0x14020CCC0]),
                            ("confirm", [0x1401271F0]), ("tabard-card", [0x140122ED0])]:
        start, end = addresses[0], functions[addresses[-1]]
        at = pe.rva_offset(start - pe.image_base)
        (WORK / f"{name}.bin").write_bytes(data[at:at + end - start])
        write(WORK / f"{name}-plan.json", dict(target=f"runtime/rewards-menu-0.105.0/{name}.bin",
              output=f"runtime/rewards-menu-0.105.0/rea-{name}", init_timeout=60, timeout=240,
              open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
              operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(a))) for a in addresses]))
    print("Staged four exact native slices and REA/Ghidra plans")



def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--fixtures", action="store_true")
    mode.add_argument("--prepare", action="store_true")
    args = parser.parse_args()
    WORK.mkdir(parents=True, exist_ok=True)
    data, pe = load()
    if args.fixtures:
        fixtures(data, pe)
    else:
        prepare(data, pe)


if __name__ == "__main__":
    main()

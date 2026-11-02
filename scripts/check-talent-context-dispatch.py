#!/usr/bin/env python3
"""Replay the selected talentxp dispatch/context and terminal-object guard.

Only unchanged current-target x86 instructions run in Unicorn with synthetic
JSON storage. JSON lookup/index and old-Value drop are explicit library seams.
No compiler, target process, network, save or application is started.
"""
import hashlib
import json
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"


def main():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("talent_dispatch_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from native_terminal import NativeReplay
    n = NativeReplay(data, pe)
    u, r, m, bp = n.machine, n.registers, n.mem, n.bp
    observed = []

    def lookup(address):
        if address == 0x142A769A0:
            key = bytes(u.mem_read(u.reg_read(r.UC_X86_REG_RCX), u.reg_read(r.UC_X86_REG_RDX))).decode()
            assert key == ("talent" if n.context["mode"] == "terminal-object" else "type")
            u.reg_write(r.UC_X86_REG_RAX, m + 0x19000)
            n.return_seam()
            return True
        if address == 0x142A76AA0:
            key = bytes(u.mem_read(u.reg_read(r.UC_X86_REG_RCX), u.reg_read(r.UC_X86_REG_RDX))).decode()
            assert key == "talent"
            assert u.reg_read(r.UC_X86_REG_R8) == m + 0x1A000
            n.context["indexed"] += 1
            u.reg_write(r.UC_X86_REG_RAX, m + 0x1B000)
            n.return_seam()
            return True
        if address == 0x140023810:
            assert u.reg_read(r.UC_X86_REG_RCX) == m + 0x1B000
            n.context["dropped"] += 1
            n.return_seam()
            return True
        return False

    n.seam = lookup
    other_cases = {0x14013E02B, 0x14013E4D1, 0x14013E147, 0x14013E3F3,
                   0x14013E523, 0x14013E571}
    dispatch = []
    # The full PE supplies the actual signed-relative length switch table.
    for kind in [None, False, 1, "", "talentxp", "talentxP", "talentxpX", "unpaused", "drop"]:
        for active in [False, True]:
            for revision in [0, 17, 0xFFFFFFFF]:
                n.reset("dispatch", [(0x14013DFD0, 0x14013E0AB), (0x14013E826, 0x14013E8CC)],
                        {0x14013ED30, 0x14013ED3D} | other_cases)
                n.context.update(indexed=0, dropped=0)
                encoded = kind.encode() if isinstance(kind, str) else b""
                tag = 3 if isinstance(kind, str) else 1 if isinstance(kind, bool) else 2 if isinstance(kind, int) else 0
                n.put(m + 0x19000, "<QQQQ", tag, 0, m + 0x1C000, len(encoded))
                u.mem_write(m + 0x1C000, encoded + bytes(16))
                n.put(m + 0x1A000, "<B", 5 if active else 255)
                n.put(bp + 0x1A0, "<Q", m + 0x1A000)
                n.put(bp + 0x1B0, "<Q", m + 0x1D000)
                n.put(bp + 0x1C0, "<Q", m + 0x18000)
                n.put(bp + 0x1D0, "<I", 12345)
                n.put(m + 0x180E4, "<I", revision)
                payload = bytes(range(32))
                u.mem_write(bp + 0x130, payload)
                u.mem_write(m + 0x1B000, bytes([0xA5]) * 32)
                stopped = n.run(0x14013DFD0)
                admitted = kind == "talentxp" and active
                assert n.context["indexed"] == n.context["dropped"] == int(admitted)
                assert n.get(m + 0x180E4, "<I")[0] == ((revision + int(admitted)) & 0xFFFFFFFF)
                assert bytes(u.mem_read(m + 0x1B000, 32)) == (payload if admitted else bytes([0xA5]) * 32)
                if kind == "talentxp":
                    assert stopped == (0x14013ED3D if active else 0x14013ED30)
                    assert n.get(m + 0x1D000, "<I")[0] == 12345
                dispatch.append(dict(type=kind, active=active, revision=revision, accepted=admitted))

    # The terminal's object guard admits serde_json Object (tag5) only.
    objects = []
    for tag in range(6):
        n.reset("terminal-object", [(0x1402DE2B2, 0x1402DE33A)], {0x1402DE33A, 0x140160020})
        n.put(m + 0x19000, "<QQQQ", tag, 0, 0, 0)
        for offset in [0x778, 0x788]:
            n.put(bp + offset, "<Q", m + 0x1D000)
        n.put(m + 0x1D000, "<Q", m + 0x18000)
        stopped = n.run(0x1402DE2B2)
        assert (stopped == 0x140160020) == (tag == 5)
        objects.append(dict(tag=tag, parser_called=tag == 5))

    for role, start, end in [("type-dispatch", 0x14013DFD0, 0x14013E0AB),
                             ("context-patch", 0x14013E826, 0x14013E8CC),
                             ("terminal-object-guard", 0x1402DE2B2, 0x1402DE33A),
                             ("type-length-table", 0x145F00950, 0x145F00968)]:
        offset = pe.rva_offset(start - pe.image_base)
        observed.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
                             sha256=hashlib.sha256(data[offset:offset + end - start]).hexdigest()))
    output = ROOT / "runtime/gap98-context-0.115.0/dispatch-check.json"
    output.parent.mkdir(parents=True, exist_ok=True)
    proof = dict(target=target["sha256"], ranges=observed, dispatch_cases=len(dispatch),
                 object_guard_cases=len(objects), instructions=n.instructions,
                 cases_sha256=hashlib.sha256(json.dumps([dispatch, objects], sort_keys=True).encode()).hexdigest(),
                 limits=["Synthetic JSON storage and explicit library seams; no whole ECS/library implementation claim.",
                         "No compilation, target application, gameplay, rendering or parity comparison."])
    output.write_text(json.dumps(proof, indent=2) + "\n")
    print(f"Talent context dispatch: {len(dispatch)} type/active/revision cases; {len(objects)} object guards pass")


if __name__ == "__main__":
    main()

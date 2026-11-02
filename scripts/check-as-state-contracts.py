#!/usr/bin/env python3
"""Check hash-bound AS state instructions; no compiler or game executes.

The current enemy-control mode checks shared admission and expiry consumers.
The historical native continuation runs until the notice/return boundary. Its
already-covered
unroot serializer is an explicit opaque 32-byte seam; no packet equivalence is
inferred from that seam. Full Game memory, queue order, clock and flag writes are
compared independently, including every admitted previous-flag byte class.
"""
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, json_text, latest_target, target_bytes
from script_sources import load_script
from discovery_native_subject import verify_native_query_subject

sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r

sys.path.insert(0, str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
KEPT = ROOT / "docs/analysis/evidence/0.113.2/as-state-contracts"
STAGE = ROOT / "runtime/as-state-contracts-0.113.2/staged"
FIRST, LAST = 0x1458F4C30, 0x1458F4DA8


def digest(value):
    return hashlib.sha256(value).hexdigest()


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def check_enemy_control(manifest, write=False):
    """Replay the current enemy-owned shared control admission instructions."""
    proof = json.loads(manifest.read_text())
    target = latest_target(verify=True)
    assert proof["target"] == {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("enemy_control_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert digest(raw) == row["sha256"] and raw == bytes.fromhex(row["bytes_hex"])
        if row in proof["native_ranges"]:
            assert sum(i.size for i in Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start)) == len(raw)
        for page in range(start & ~4095, (start + len(raw) + 4095) & ~4095, 4096):
            if page not in pages:
                u.mem_map(page, 4096)
                pages.add(page)
        u.mem_write(start, raw)
    for query in proof["queries"]:
        result = json.loads((ROOT / query["result"]["path"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe)
    game, actor, stack, stop = 0x200000000, 0x200004000, 0x300000000, 0x30000f000
    u.mem_map(game, 0x10000)
    u.mem_map(stack, 0x10000)
    observed = {}
    endpoints = {stop, 0x145c68bbb, 0x145c6904b, 0x145c68a87}

    def hook(uc, address, _size, _context):
        if address in endpoints:
            observed["end"] = address
            uc.emu_stop()
    u.hook_add(UC_HOOK_CODE, hook)

    def putf(address, value):
        u.mem_write(address, struct.pack("<f", value))

    def getf(address):
        return struct.unpack("<f", u.mem_read(address, 4))[0]

    cases = []
    for kind, start in (("polymorph", 0x145c6cec0), ("root_stun", 0x145c68b54), ("fear", 0x145c68ff4)):
        for resistant in (False, True):
            for applications in (0, 1, 2, 3, 4, 5, 6, 255):
                for immune in (0., 10., 10.001):
                    u.mem_write(game, bytes(0x10000))
                    u.mem_write(stack, bytes(0x10000))
                    u.mem_write(game + 0x5b8, struct.pack("<QQ", actor, 1))
                    putf(game + 0xcc0, 10.)
                    u.mem_write(actor + 0xf0, struct.pack("<Q", 42))
                    u.mem_write(actor + 0x1f4, bytes([resistant, applications]))
                    putf(actor + 0x1dc, immune)
                    for offset, deadline in ((0x1c8, 30.), (0x1d0, 20.), (0x1d8, 40.)):
                        putf(actor + offset, deadline)
                    u.reg_write(r.UC_X86_REG_RCX, game if kind == "polymorph" else 0)
                    u.reg_write(r.UC_X86_REG_RSI, game)
                    u.reg_write(r.UC_X86_REG_RAX, actor)
                    u.reg_write(r.UC_X86_REG_RDX, 42)
                    u.reg_write(r.UC_X86_REG_XMM0, struct.unpack("<I", struct.pack("<f", 10.))[0])
                    u.reg_write(r.UC_X86_REG_XMM3, struct.unpack("<I", struct.pack("<f", 10.))[0])
                    u.reg_write(r.UC_X86_REG_RSP, stack + 0xe008)
                    u.mem_write(stack + 0xe008, struct.pack("<Q", stop))
                    observed.clear()
                    u.emu_start(start, 0, count=500)
                    admitted = immune <= 10. and applications < 5
                    if admitted:
                        result_bits = u.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff
                        expected = f32((1. if resistant else 10.) * [1., f32(.8), f32(.6), f32(.4), f32(.2)][applications])
                        assert result_bits == struct.unpack("<I", struct.pack("<f", expected))[0]
                        assert bytes(u.mem_read(actor + 0x1f5, 1)) == bytes([applications + 1])
                        assert getf(actor + 0x1dc) == immune
                    elif immune <= 10.:
                        assert bytes(u.mem_read(actor + 0x1f5, 1)) == b"\0"
                        assert getf(actor + 0x1dc) == 18.
                        assert all(getf(actor + off) == 10. for off in (0x1c8, 0x1d0, 0x1d8, 0x1b4))
                    else:
                        assert bytes(u.mem_read(actor + 0x1f5, 1)) == bytes([applications])
                        assert getf(actor + 0x1dc) == f32(immune)
                    if kind == "polymorph":
                        assert (u.reg_read(r.UC_X86_REG_RAX) & 0xffffffff) == int(admitted)
                    cases.append(dict(kind=kind, resistant=resistant, applications=applications,
                                      immune_until=immune, admitted=admitted))
    base = ROOT / "crates/azeroth-survivors-re/src"
    state = (base / "player_abilities/behavior/state.rs").read_text()
    for expression in ("self.applications >= 5", "self.immune_until = now + 8.0", "self.applications = 0",
                       "[1.0, 0.8, 0.6, 0.4, 0.2][index]", "window.admit(actor, now, duration)",
                       "window.admit(actor, now, effect.value)"):
        assert expression in state, expression
    expire = state.split("pub fn expire_control", 1)[1].split("///", 1)[0]
    assert "immune_until =" not in expire and "applications =" not in expire
    hit = (base / "player_abilities/behavior/hit_passives.rs").read_text()
    block = hit.split("pub fn try_apply_polymorph", 1)[1].split("///", 1)[0]
    assert block.index("start_passive") < block.index("control.admit") < block.index("set_polymorph_appearance")
    assert "control.polymorph_duration = duration" in block
    assert "actor_and_control_mut" in (base / "gameplay/mechanics/passives.rs").read_text()
    assert "(control.polymorph_duration, actor.fear_until)" in (base / "gameplay/mechanics/addon_lists.rs").read_text()
    result = dict(target=proof["target"], native_cases=len(cases), cases_sha256=digest(json_text(cases).encode()),
                  source_connections_checked=True, compilation_run=False, application_execution="not_run", parity="unverified")
    destination = manifest.with_name("static-check.json")
    if write:
        destination.write_text(json_text(result))
    else:
        assert result == json.loads(destination.read_text())
    print(json_text(result))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true", help="Stage candidate evidence in runtime/")
    parser.add_argument("--enemy-control", action="store_true", help="Check current shared enemy control instead of historical endless state")
    parser.add_argument("--write", action="store_true", help="Retain current enemy-control static result")
    args = parser.parse_args()
    if args.enemy_control:
        return check_enemy_control(ROOT / "docs/analysis/evidence/0.127.0/enemy-control/manifest.json", args.write)
    target = latest_target(verify=True)
    assert target["version"] == "0.113.2" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("as_state_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(first, last):
        offset = pe.rva_offset(first - pe.image_base)
        assert offset is not None
        return image[offset:offset + last - first]

    assembly = "\n".join(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                         for i in Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw(FIRST, LAST), FIRST)) + "\n"
    if args.stage:
        STAGE.mkdir(parents=True, exist_ok=True)
        (STAGE / "endless.asm").write_text(assembly)
    else:
        assert assembly == (KEPT / "endless.asm").read_text(), "Continuation assembly drift"

    assert raw(0x147004000, 0x147004004) == struct.pack("<f", 300.0)
    assert raw(0x1458F4CEE, 0x1458F4CF6) == bytes.fromhex("84db0f85a3000000")
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    u.mem_map(FIRST & ~4095, 4096)
    u.mem_write(FIRST, raw(FIRST, LAST))
    u.mem_map(0x147004000, 4096)
    u.mem_write(0x147004000, raw(0x147004000, 0x147004004))
    mem, stack = 0x200000000, 0x300000000
    game, queue = mem, mem + 0x4000
    u.mem_map(mem, 0x10000)
    u.mem_map(stack, 0x10000)
    opaque_unroot = bytes((i * 17 + 5) % 256 for i in range(32))
    observed = {}

    def hook(uc, address, size, context):
        if address == 0x1458F4CA1:
            # Exact native CALL site: only replace serializer output, not its
            # caller's branch, state stores, Vec append or serial increment.
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX), opaque_unroot)
            uc.reg_write(r.UC_X86_REG_RIP, address + 5)
            observed["unroot"] = True
        elif address in (0x1458F4CF6, 0x1458F4D99):
            observed["notice"] = address == 0x1458F4CF6
            uc.emu_stop()

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for phase in range(7):
        for prior in (0, 1, 2, 255):
            for clock in (0.0, 300.0, 1800.25, 36000.0):
                u.mem_write(mem, bytes(0x10000))
                u.mem_write(stack, bytes(0x10000))
                u.mem_write(game, bytes((i * 37 + 11) % 256 for i in range(0x2000)))
                u.mem_write(game + 0xC00, bytes([prior]))
                u.mem_write(game + 0xC12, bytes([phase]))
                u.mem_write(game + 0xB6C, struct.pack("<f", clock))
                u.mem_write(game + 0x550, struct.pack("<I", 0xFFFFFFFF))
                u.mem_write(game + 0x620, struct.pack("<QQQ", 8, queue, 2))
                u.mem_write(queue, b"P" * 64)
                before = bytes(u.mem_read(game, 0x2000))
                expected = bytearray(before)
                observed.clear()
                u.reg_write(r.UC_X86_REG_RCX, game)
                u.reg_write(r.UC_X86_REG_RSP, stack + 0xF008)
                u.emu_start(FIRST, 0, count=200)
                admitted = phase == 5
                if admitted:
                    expected[0xC00] = expected[0xC12] = 1
                    struct.pack_into("<f", expected, 0xBC8, f32(clock + 300.0))
                    struct.pack_into("<I", expected, 0x550, 0)
                    struct.pack_into("<Q", expected, 0x630, 3)
                assert bytes(u.mem_read(game, 0x2000)) == expected
                assert observed.get("unroot", False) == admitted
                assert observed["notice"] == (admitted and prior == 0)
                assert bytes(u.mem_read(queue, 64)) == b"P" * 64
                assert bytes(u.mem_read(queue + 64, 32)) == (opaque_unroot if admitted else bytes(32))
                cases.append(dict(phase=phase, prior_endless=prior, clock=clock,
                                  admitted=admitted, notice=observed["notice"]))

    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/terminal.rs").read_text()
    block = source.split("if action == TerminalAction::Endless {", 1)[1].split("let stock =", 1)[0]
    compact = "".join(block.split())
    assert "letannounce_endless=session.mechanics.as_ref().is_some_and(|game|!game.rules.endless);" in compact
    assert compact.index("letannounce_endless") < compact.index("Mechanics::continue_endless")
    assert compact.index("player_mover_messages") < compact.index("ifannounce_endless{")
    notice = compact.split("ifannounce_endless{", 1)[1].split("//Victory", 1)[0]
    assert 'sender_name:Some(localized("Endless"))' in notice
    assert 'text:localized("Theonslaughtneverends...")' in notice
    assert compact.index("ifannounce_endless{") < compact.index("SessionEvent::GossipComplete")
    progression = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs").read_text()
    continued = progression.split("pub fn continue_endless", 1)[1].split("///", 1)[0]
    assert "self.rules.endless = true;" in continued and "self.root_player(false);" in continued
    result = dict(schema_version=1,
                  target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                  native_cases=len(cases),
                  cases_sha256=digest(json_text(cases).encode()),
                  owner=dict(va=hex(FIRST), end_exclusive=hex(LAST),
                             byte_count=LAST - FIRST, sha256=digest(raw(FIRST, LAST))),
                  field_contract=dict(phase="Game+c12", endless="Game+c00", clock="Game+b6c",
                                      deadline="Game+bc8", movement_serial="Game+550", queue="Game+620/628/630"),
                  source_refs=["crates/azeroth-survivors-re/src/gameplay/terminal.rs",
                               "crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs"],
                  limits=["Only the continuation caller executes; unroot payload is an explicit opaque seam.",
                          "Preallocated queue excludes allocator growth; notice formatting and later packet delivery do not execute.",
                          "Source assertions establish connected guards/order, not Rust execution or original/rebuilt parity."])
    if args.stage:
        STAGE.mkdir(parents=True, exist_ok=True)
        (STAGE / "endless.json").write_text(json_text(result))
    else:
        assert result == json.loads((KEPT / "endless.json").read_text()), "Continuation evidence drift"
    print(json_text(dict(target_sha256=SHA, native_cases=len(cases), source_guards="pass",
                         compilation_run=False, game_run=False)))


if __name__ == "__main__":
    main()

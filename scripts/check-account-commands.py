"""Bounded current dispatcher ownership/gate replay, never a native process."""

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from native_save_fixture import CPU, SHA
from unicorn.x86_const import *

DISPATCH = 0x1458BB9F0
END = 0x1458BD2A8
RAX, RCX, RDX, R8, R9 = (
    UC_X86_REG_RAX,
    UC_X86_REG_RCX,
    UC_X86_REG_RDX,
    UC_X86_REG_R8,
    UC_X86_REG_R9,
)
MASK = (1 << 64) - 1


def cpu():
    c = CPU()
    a, b = 0x14588D0D0, 0x14588D1F9
    assert (
        hashlib.sha256(c.raw(a, b)).hexdigest()
        == "3153dfef588d9b58208f1cf43dca1d3d3e5b2df67586d3cf64f54146940a9a5c"
    )
    c.admit = {x for x in c.admit if not a <= x < b}
    c.allow_range(a, b)
    return c


def replay(kind, accepted=True, backend="", loaded="", resets=0, perks=0, gear=None):
    c = cpu()
    c.allow_owner(DISPATCH)
    for a in (0x1458A7FC0, 0x14589C030, 0x145BCD2F0, 0x1458A92F0):
        c.allow_owner(a)
    c.parse("perk|rerolls:1\n" if kind == "Reset" and perks else backend)
    server = c.H + 0x8000
    save = server + 0xB20
    c.u.mem_write(save, bytes(c.u.mem_read(c.H, 0x1D0)))
    current = server + 0xCF0
    c.u.mem_write(current, bytes(c.u.mem_read(save + 0x150, 64)))
    if c.q(current) == MASK:
        c.call(0x1458A92F0, current)
    frontend = c.H + 0xC000
    frontend_bytes = bytes([0x5A]) * 0x1D0
    c.u.mem_write(frontend, frontend_bytes)
    command = c.H + 0xB000
    c.u.mem_write(command, bytes(0x100))
    tags = dict(
        Pick=11, Gear=0, Talents=14, Spec=15, Reload=16, Rewards=17, Reset=18, Pets=19
    )
    c.u.mem_write(command, struct.pack("<I", tags[kind]))
    calls = []
    writes = []
    callbacks = []
    payload = {}
    loaded_bytes = None
    # The read seam uses a separately produced real typed Save, not its parser's
    # output scratch address, which subsequent callbacks may reuse.
    if kind == "Reload":
        other = cpu()
        other.parse(loaded)
        # Native vectors may point into the second emulator. Copy its whole
        # heap into a disjoint fixture arena and relocate typed String pointers.
        # These selected reload cases use only Pick/default and scalar stats.
        loaded_bytes = bytes(other.u.mem_read(other.H, 0x1D0))
        if other.q(other.H + 0x150) != MASK:
            raw = bytearray(loaded_bytes)
            for off in (0x158, 0x170):
                ptr, length = other.q(other.H + off), other.q(other.H + off + 8)
                at = c.alloc(max(length, 1))
                c.u.mem_write(
                    at, bytes(other.u.mem_read(ptr, length)) if length else b"\0"
                )
                raw[off : off + 8] = struct.pack("<Q", at)
            loaded_bytes = bytes(raw)
    if kind == "Pick":
        c.u.mem_write(command + 8, bytes(c.u.mem_read(current, 64)))
        payload = dict(class_id=c.u.mem_read(command + 0x40, 1)[0])
    elif kind == "Gear":
        assert gear is not None
        c.u.mem_write(command, bytes(0xE8))
        for slot, value in gear.get("equip", {}).items():
            c.u.mem_write(command + 0x98 + slot * 4, struct.pack("<I", value))
        for slot, value in gear.get("look", {}).items():
            c.u.mem_write(command + slot * 8, struct.pack("<II", 1, value))
        c.u.mem_write(command + 0xE4, bytes([gear.get("class_id", 1)]))
        payload = gear
    elif kind == "Talents":
        c.put(command + 8, 0, 8, 0)
        c.u.mem_write(command + 0x20, b"\x08")
    elif kind == "Spec":
        c.u.mem_write(command + 4, bytes([8, 2]))
    elif kind == "Reset":
        c.u.mem_write(save + 0x1C8, struct.pack("<I", resets))
    elif kind == "Pets":
        c.put(command + 8, 0, 8, 0)
    # Callback itself is only a capture leaf. The formatter is a declared seam.
    callback = c.D + 0x10
    vtable = c.H + 0xD000
    c.put(vtable + 0x18, callback)
    c.put(server + 0x1090, 0xA11CE, vtable)

    def hook(cpu, a):
        x, d, r8, r9 = [c.reg(r) for r in (RCX, RDX, R8, R9)]
        if a == 0x145BF95A0:  # chkstk: stack is already mapped
            pass
        elif a == 0x1458A33C0:
            writes.append(dict(owner=x - server))
        elif a == 0x140009EB0:  # drop prior typed Save: no fixture allocation frees
            pass
        elif a == 0x14589D550:
            calls.append(dict(helper="active-save-read", destination=x))
            c.u.mem_write(x, loaded_bytes)
        elif a == 0x1458E4330:
            calls.append(dict(helper="account-grants", save=d - server, mode=r8))
            c.put(x, 0, 8, int(accepted))
        elif a == 0x14589E130:
            calls.append(dict(helper="gear-ownership", save=d - server))
            count = c.q(d + 0x40)
            ptr = c.q(d + 0x38)
            at = c.alloc(max(4 * count, 4))
            if count:
                c.u.mem_write(at, bytes(c.u.mem_read(ptr, count * 4)))
            c.put(x, count, at, count)
        elif a == 0x1458A7B80:
            calls.append(
                dict(
                    helper="allocation-set",
                    save=x - server,
                    class_id=d,
                    allocation_offset=r8 - command,
                )
            )
        elif a == 0x14589C630:
            calls.append(
                dict(helper="spec-switch", save=x - server, class_id=d, slot=r8)
            )
            c.u.reg_write(RAX, int(accepted))
        elif a == 0x1458D8080:
            calls.append(
                dict(
                    helper="apply-plan",
                    save=d - server,
                    payload_size=48,
                    accepted=accepted,
                )
            )
            c.u.reg_write(RAX, int(accepted))
        elif a == 0x1459C7C20:
            calls.append(dict(helper="pets-collect", save=c.q(d + 0x18) - server))
            c.put(x, 0, 8, 0)
        elif a == 0x145D7E390:  # grow Vec<u64>
            cap, ptr, length = (c.q(x + off) for off in (0, 8, 16))
            newcap = max(cap * 2, length + 1, 4)
            at = c.alloc(newcap * 8)
            if length:
                c.u.mem_write(at, bytes(c.u.mem_read(ptr, length * 8)))
            c.put(x, newcap, at, length)
        elif a == 0x1458EB720:
            at = c.alloc(256)
            key = bytes(c.u.mem_read(r8, r9)).decode()
            ptr, length = c.q(c.reg(UC_X86_REG_RSP) + 40), c.q(
                c.reg(UC_X86_REG_RSP) + 48
            )
            value = bytes(c.u.mem_read(ptr, length)).decode()
            calls.append(dict(helper="json-field", key=key, value=value))
            raw = b"{" + json.dumps(key).encode() + b":" + json.dumps(value).encode()
            c.u.mem_write(at, raw)
            c.put(x, 256, at, len(raw))
        elif a == callback:
            callbacks.append(bytes(c.u.mem_read(d, r8)).decode())
        else:
            return False
        c._return()
        return True

    c.extensions.insert(0, hook)
    c.call(DISPATCH, server, command)
    assert bytes(c.u.mem_read(frontend, 0x1D0)) == frontend_bytes
    assert all(row["owner"] == 0xB20 for row in writes)
    for row in writes:
        row["canonical"] = c.serialize(save)
    result = dict(
        kind=kind,
        accepted=accepted,
        backend=backend,
        loaded=loaded,
        calls=calls,
        writes=writes,
        callbacks=callbacks,
        frontend_unchanged=True,
    )
    if kind == "Reset":
        result.update(
            resets_before=resets,
            perks_before=perks,
            resets_after=c.ui(save + 0x1C8),
            perks_after=c.q(save + 0x100),
        )
    if kind == "Gear":
        result["payload"] = payload
    if kind in ("Reload", "Pick"):
        result["current_pick_class"] = c.u.mem_read(current + 0x38, 1)[0]
        result["current_pick_race"] = c.u.mem_read(current + 0x39, 1)[0]
        result["current_pick_name"] = bytes(
            c.u.mem_read(c.q(current + 8), c.q(current + 16))
        ).decode()
        result["current_pick_zone"] = bytes(
            c.u.mem_read(c.q(current + 0x20), c.q(current + 0x28))
        ).decode()
    return result


def residency_cases():
    """Actual selected blocks; query admission and filesystem are explicit seams."""
    rows = []
    c = cpu()
    for address in (0x14018DC00, 0x140191820, 0x140074B60):
        c.allow_owner(address)
    app, clock, tick, queue = (c.H + x for x in (0x8000, 0x9000, 0xA000, 0xB000))
    frame = c.S + 0x100000
    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    for mode in (0, 1):
        for start in (-1, 0):
            for ready in (0, 1):
                for picked in (0, 1):
                    for now in (0.25, 0.5, 0.5001, 29.999, 30, 30.0001):
                        now = f32(now)
                        c.u.mem_write(
                            app,
                            struct.pack(
                                "<IffBBBB", mode, start, 0, 1, 1, ready, picked
                            ),
                        )
                        c.u.mem_write(clock + 0x5C, struct.pack("<f", now))
                        c.put(queue, 16, c.H + 0xD000, 0)
                        c.u.reg_write(UC_X86_REG_R14, app)
                        c.u.reg_write(UC_X86_REG_R13, clock)
                        c.u.reg_write(UC_X86_REG_RSI, tick)
                        c.u.reg_write(UC_X86_REG_RBX, 7)
                        c.u.reg_write(UC_X86_REG_R15, queue)
                        c.u.reg_write(RCX, 0)
                        c.u.reg_write(UC_X86_REG_RSP, c.S + 0xF0000)
                        c.stops = {0x14018DE41}
                        c.u.emu_start(0x14018DD8F, c.D, count=200)
                        assert c.reg(UC_X86_REG_RIP) == 0x14018DE41
                        active = mode == 1 and start >= 0
                        done = ready == 1 and picked == 1
                        expired = active and f32(now - start) > 30
                        expected_custom = not (active and done and not expired)
                        assert c.u.mem_read(app + 0xD, 1)[0] == int(expected_custom)
                        assert c.ui(app) == (0 if expired else mode)
                        queued = active and done and now > 0.5
                        assert c.q(queue + 16) == 8 * int(queued)
                        if queued:
                            assert c.q(c.H + 0xD000) == 0x140278830
                        rows.append(
                            dict(
                                contract="picked-ready-transition",
                                mode=mode,
                                start=start,
                                ready=ready,
                                picked=picked,
                                now=now,
                                menu_after=expected_custom,
                                mode_after=c.ui(app),
                                deferred_command_queued=queued,
                            )
                        )
    # Existing native menu-return poll restores process custom-mode, independently
    # of the old menu value, and clears Ready. It does not read or publish Save.
    for enabled in (0, 1):
        for old in (0, 1):
            c.u.mem_write(app, struct.pack("<IffBBBB", 1, 0, 0, enabled, old, 1, 1))
            c.put(frame + 0xF0, app, tick)
            c.u.mem_write(frame + 0x15C, struct.pack("<I", 7))
            c.u.reg_write(UC_X86_REG_RBP, frame)
            c.u.reg_write(UC_X86_REG_RSP, c.S + 0xF0000)
            c.stops = {0x140193193}
            c.u.emu_start(0x1401928B1, c.D, count=30)
            assert c.reg(UC_X86_REG_RIP) == 0x140193193
            assert c.u.mem_read(app + 0xD, 2) == bytes([enabled, 0])
            rows.append(
                dict(
                    contract="menu-return",
                    enabled=enabled,
                    old=old,
                    menu_after=enabled,
                    ready_after=0,
                )
            )
    # Replay the explicit root-query-empty and root-query-nonempty branch paths.
    # The canonical owner supplies query/iteration provenance; no fake ECS runs.
    loaded = CPU()
    loaded.parse("stat|kills=123\n")
    disk = bytes(loaded.u.mem_read(loaded.H, 0x1D0))
    frontend = c.H + 0xE000
    reads = []

    def read_hook(cpu, address):
        if address == 0x14589D550:
            reads.append("active-file-read")
            c.u.mem_write(c.reg(RCX), disk)
        elif address == 0x140009EB0:
            pass
        else:
            return False
        c._return()
        return True

    c.extensions.insert(0, read_hook)
    for empty in (False, True):
        for custom in (False, True):
            original = bytes([0x5A]) * 0x1D0
            c.u.mem_write(frontend, original)
            c.u.mem_write(app + 0xD, bytes([custom]))
            c.put(frame + 0x88, frontend)
            c.put(frame + 0x98, tick)
            c.u.mem_write(frame + 0xA4, struct.pack("<I", 7))
            c.u.reg_write(RCX, app)
            c.u.reg_write(UC_X86_REG_RBP, frame)
            c.u.reg_write(UC_X86_REG_RSP, c.S + 0xF0000)
            c.stops = {0x14007616D, 0x140074E0A, 0x14007505B}
            reads.clear()
            c.u.emu_start(0x140074DC2 if empty else 0x140075051, c.D, count=100)
            pc = c.reg(UC_X86_REG_RIP)
            assert pc in c.stops
            should_load = empty and custom
            assert bool(reads) == should_load
            assert bytes(c.u.mem_read(frontend, 0x1D0)) == (
                disk if should_load else original
            )
            assert (pc == 0x14007505B) == (not empty and not custom)
            rows.append(
                dict(
                    contract="frontend-root-residency",
                    query_empty=empty,
                    custom=custom,
                    read_active_file=should_load,
                    replace_frontend_save=should_load,
                    teardown_admitted=not empty and not custom,
                )
            )
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    dest = ROOT / "docs/analysis/evidence/0.109.0/account-commands"
    rows = []
    for kind in ("Talents", "Spec", "Rewards"):
        for accepted in (False, True):
            result = replay(kind, accepted=accepted)
            assert len(result["writes"]) == int(kind == "Talents" or accepted)
            assert not result["callbacks"]
            rows.append(result)
    for before in (0, 1, 2, 0xFFFFFFFF):
        for perks in (0, 1):
            result = replay("Reset", resets=before, perks=perks)
            allowed = before <= 1 and perks != 0
            assert len(result["writes"]) == int(allowed)
            assert result["resets_after"] == before + int(allowed)
            rows.append(result)
    result = replay("Pets")
    assert len(result["writes"]) == 1 and not result["callbacks"]
    rows.append(result)
    for loaded in ("", "pick|8|7|1|naxx|Alric\n"):
        for grants in (False, True):
            result = replay("Reload", accepted=grants, loaded=loaded)
            assert len(result["writes"]) == int(grants)
            assert not result["callbacks"]
            assert result["current_pick_zone"] == ("naxx" if loaded else "elwynn")
            assert result["current_pick_name"] == ("Alric" if loaded else "Hero")
            rows.append(result)
    result = replay("Pick", backend="pick|8|7|1|naxx|Alric\n")
    assert len(result["writes"]) == 1 and result["callbacks"] == ['{"type":"picked"}']
    assert result["current_pick_zone"] == "elwynn"
    rows.append(result)
    for owned in ("", "items|101000\n"):
        result = replay(
            "Gear",
            backend=owned,
            gear=dict(class_id=1, equip={0: 101000, 1: 101000}, look={2: 0}),
        )
        assert len(result["writes"]) == 1 and not result["callbacks"]
        expected = "equip|1|0:101000" if owned else "equip|1|\n"
        assert expected in result["writes"][0]["canonical"]
        rows.append(result)
    for backend, gear, expected in (
        ("", dict(class_id=1, equip={}, look={0: 0}), "look|1|0:0\n"),
        (
            "items|101000,108000\nequip|1|0:101000\nequip|8|0:108000\nlook|1|3:123\n",
            dict(class_id=1, equip={}, look={2: 0}),
            "equip|1|\nlook|1|2:0\nequip|8|0:108000\n",
        ),
        (
            "equip|8|\n",
            dict(class_id=1, equip={}, look={}),
            "equip|8|\nlook|8|\nequip|1|\nlook|1|\n",
        ),
    ):
        result = replay("Gear", backend=backend, gear=gear)
        assert len(result["writes"]) == 1 and not result["callbacks"]
        assert expected in result["writes"][0]["canonical"]
        rows.append(result)
    rows.extend(residency_cases())
    c = cpu()
    canonical = json.loads(
        (
            ROOT / "docs/analysis/evidence/0.109.0/terminal-flow/manifest.json"
        ).read_text()
    )
    owner = next(row for row in canonical["ranges"] if row["role"] == "dispatcher")
    assert (
        int(owner["start"], 16) == DISPATCH and int(owner["end_exclusive"], 16) == END
    )
    assert hashlib.sha256(c.raw(DISPATCH, END)).hexdigest() == owner["sha256"]
    helpers = []
    for address in (
        DISPATCH,
        0x1458A7FC0,
        0x14589C030,
        0x145BCD2F0,
        0x1458A92F0,
        0x14018DC00,
        0x140191820,
        0x140074B60,
    ):
        end = c.ends[address]
        helpers.append(
            dict(
                start=hex(address),
                end=hex(end),
                sha256=hashlib.sha256(c.raw(address, end)).hexdigest(),
            )
        )
    helpers.append(
        dict(
            start="0x14588d0d0",
            end="0x14588d1f9",
            sha256="3153dfef588d9b58208f1cf43dca1d3d3e5b2df67586d3cf64f54146940a9a5c",
            canonical="../stock-lifecycle/manifest.json#zone-parser",
        )
    )
    manifest = dict(
        target_sha256=SHA,
        canonical_dispatcher="../terminal-flow/manifest.json#dispatcher",
        canonical_frontend_pick_binding="frontend-pick-binding.json",
        canonical_gear="../save-gear/manifest.json",
        canonical_talents="../talents-menu/manifest.json",
        canonical_rewards="../rewards-menu/manifest.json",
        canonical_reload="../import-restore/manifest.json",
        canonical_menu_transition="../updater/manifest.json#frontend-keyboard",
        canonical_frontend_poll="../menu-fidelity/manifest.json#frontend-poll",
        canonical_picker_root="../menu-fidelity/manifest.json#picker-root-binding",
        case_counts=dict(
            dispatcher=25, picked_transition=96, menu_return=4, root_residency=4
        ),
        shared_fixture="../save-schema/manifest.json",
        native_helpers=helpers,
        seams=[
            "stack probe (mapped stack)",
            "typed active-save read",
            "account-grants changed/unchanged result",
            "Gear owned membership vector (tabards absent in these cases)",
            "Talents allocation setter capture",
            "Spec/Rewards bool result",
            "Pets empty-vector collector",
            "Vec<u64> growth",
            "JSON field formatting (actual native key/value inputs)",
            "callback capture",
            "ordinary-write capture (actual serializer executes after dispatch)",
        ],
        limits=[
            "Full original dispatcher executes against synthetic typed backend state and a disjoint frontend canary.",
            "Actual Pick normalizer/unlock clamp,19-slot Gear validator, Reset guards/mutations, replacement/write/callback branches execute.",
            "The mutable family helper seams do not revalidate full Talent, Spec, Rewards, Pets, grants or filesystem semantics.",
            "Selected native lifecycle blocks execute96 ready/picked/time gates,4 menu-return branches and4 root-query-branch admissions.",
            "ECS empty/nonempty query outcomes are supplied at their native branch entries; full ECS iteration/despawn/residency timing is not executed.",
            "No original/rebuilt process, Rust compilation, filesystem write or native scheduling runs.",
        ],
    )
    result = dict(target_sha256=SHA, cases=rows)
    if args.write:
        dest.mkdir(parents=True, exist_ok=True)
        (dest / "native-cases.json").write_text(
            json.dumps(result, separators=(",", ":")) + "\n"
        )
        (dest / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    else:
        assert json.loads((dest / "native-cases.json").read_text()) == json.loads(
            json.dumps(result)
        )
        assert json.loads((dest / "manifest.json").read_text()) == manifest

    print(f"Passed {len(rows)} current account dispatcher gate/ownership cases")


if __name__ == "__main__":
    main()

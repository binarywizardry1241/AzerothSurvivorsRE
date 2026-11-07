#!/usr/bin/env python3
"""Check the native Armory star offer, localization and two account dispatches."""
import argparse
import json
import struct

from coverage_common import ROOT
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/armory-star-purchase/manifest.json"


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        for page in range(start & ~4095, (start + row["byte_count"] + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(start, bytes.fromhex(row["bytes_hex"]))
    heap, frame, stack, stop = 0x200000000, 0x300000000, 0x400000000, 0x500000000
    for address, size in ((heap, 0x10000), (frame, 0x10000), (stack, 0x10000), (stop, 4096)):
        machine.mem_map(address, size)
    # Typed call seams have synthetic RET carriers. They never contribute to
    # the count of original decoded/executed instructions.
    for address in (0x145ab44d0, 0x140053860, 0x145ba7310, 0x145aae770,
                    0x14078ae00, 0x14504b400, 0x14504b3b0, 0x145aeaf10, 0x1402b8890,
                    0x145febc1b, 0x1400a6e60, 0x145fbee30, 0x1400c4130, 0x1400a60f0,
                    0x140537180, 0x145a9bef0):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            mapped.add(page)
        if not any(int(row["virtual_address"], 16) <= address < int(row["virtual_address"], 16) + row["byte_count"] for row in proof["native_ranges"]):
            machine.mem_write(address, b"\xc3")
    context, seen, steps = {}, set(), 0
    ranges = [(int(row["virtual_address"], 16), int(row["virtual_address"], 16) + row["byte_count"])
              for row in proof["native_ranges"]]

    def putq(address, value): machine.mem_write(address, struct.pack("<Q", value))
    def qword(address): return struct.unpack("<Q", machine.mem_read(address, 8))[0]
    def text_at(address, length): return bytes(machine.mem_read(address, length)).decode()
    def rust_string(descriptor, text):
        raw = text.encode()
        machine.mem_write(descriptor + 0x1000, raw)
        putq(descriptor, len(raw))
        putq(descriptor + 8, descriptor + 0x1000)
        putq(descriptor + 16, len(raw))

    def hook(uc, address, _size, _context):
        nonlocal steps
        if address in context.get("stops", ()) or address == stop:
            context["stop"] = hex(address)
            uc.emu_stop()
            return
        if address == 0x14078ae00 and not context.get("clear_native"):
            context.setdefault("refresh_calls", []).append(hex(address))
            sp = uc.reg_read(reg.UC_X86_REG_RSP)
            uc.reg_write(reg.UC_X86_REG_RIP, qword(sp))
            uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
            return
        if address == 0x140537180:
            context["cleared_collection"] = uc.reg_read(reg.UC_X86_REG_RCX)
        if any(begin <= address < end for begin, end in ranges):
            steps += 1
            seen.add(address)
            return
        rcx, rdx, r8, r9, sp = [uc.reg_read(register) for register in (
            reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8,
            reg.UC_X86_REG_R9, reg.UC_X86_REG_RSP)]
        if address == 0x145ab44d0:
            context["transaction"] = {"save": rcx, "id": rdx}
            uc.reg_write(reg.UC_X86_REG_RAX, context["rejected"])
        elif address == 0x140053860:
            context["command"] = list(struct.unpack("<II", uc.mem_read(rdx, 8)))
        elif address == 0x145ba7310:
            assert r8 == 0
            context["grants"] = {"save": rdx, "dated": False}
            putq(rcx, 0)
        elif address == 0x145aae770:
            context["written_save"] = rcx
        elif address == 0x140537180:
            context["cleared_collection"] = rcx
        elif address == 0x145a9bef0:
            value = struct.unpack("<f", struct.pack("<I", uc.reg_read(reg.UC_X86_REG_XMM1) & 0xffffffff))[0]
            context["formatted_scalar_bits"] = bits(value)
            rust_string(rcx, format(value, ".7g"))
        elif address in (0x14078ae00, 0x14504b400, 0x14504b3b0):
            context.setdefault("refresh_calls", []).append(hex(address))
        elif address == 0x145aeaf10:
            context["key"] = text_at(rdx, r8)
            arguments = {}
            for index in range(qword(sp + 0x28)):
                name, length, pointer, formatter = struct.unpack("<QQQQ", uc.mem_read(r9 + index * 32, 32))
                name = text_at(name, length)
                if formatter in (0x1461ae268, 0x1461ee470):
                    arguments[name] = int.from_bytes(uc.mem_read(pointer, 1), "little")
                elif formatter == 0x1461ac728:
                    arguments[name] = text_at(qword(pointer), qword(pointer + 8))
                else:
                    assert formatter == 0x1461ac448, hex(formatter)
                    arguments[name] = text_at(qword(pointer + 8), qword(pointer + 16))
            context["arguments"] = arguments
            uc.emu_stop()
            return
        elif address == 0x1402b8890:
            context["ui_action"] = list(struct.unpack("<II", uc.mem_read(frame + 0x50, 8)))
            context["button_font_bits"] = int.from_bytes(uc.mem_read(sp + 0x28, 4), "little")
            uc.emu_stop()
            return
        elif address == 0x145febc1b:
            uc.mem_write(rcx, bytes(uc.mem_read(rdx, r8)))
            uc.reg_write(reg.UC_X86_REG_RAX, rcx)
        elif address == 0x1400a6e60:
            raw = bytes(uc.mem_read(r8 + 8, 384))
            context["delta_node"] = {
                name: [list(struct.unpack_from("<If", raw, offset + index * 8)) for index in range(4)]
                for name, offset in (("padding", 216), ("border", 248), ("border_radius", 280))}
            context["delta_node"].update(
                border_colors=[list(struct.unpack("<Iffff", uc.mem_read(r8 + 0x188 + index * 20, 20))) for index in range(4)],
                background=list(struct.unpack("<Iffff", uc.mem_read(r8 + 0x1d8, 20))))
            uc.mem_write(rcx, bytes(uc.mem_read(rdx, 40)))
        elif address == 0x1400a60f0:
            raw = bytes(uc.mem_read(r8 + 8, 384))
            context["delta_wrapper"] = {"row_gap": list(struct.unpack_from("<If", raw, 320)),
                "column_gap": list(struct.unpack_from("<If", raw, 328)),
                "flex_direction": raw[374], "flex_wrap": raw[372]}
            uc.emu_stop()
            return
        elif address == 0x145fbee30:
            uc.mem_write(rcx, bytes(uc.mem_read(rdx, 24)))
        elif address == 0x1400c4130:
            context["delta_text"] = {"font": struct.unpack("<f", uc.mem_read(rdx + 0x48, 4))[0],
                "color": list(struct.unpack("<Iffff", uc.mem_read(rdx + 0x50, 20)))}
            uc.emu_stop()
            return
        else:
            raise AssertionError(f"Unexpected external native call {address:#x}")
        uc.reg_write(reg.UC_X86_REG_RIP, qword(sp))
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
    machine.hook_add(UC_HOOK_CODE, hook)

    def run(start, stops=(), **values):
        context.clear(); context.update(values, stops=stops)
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0xf008)
        putq(stack + 0xf008, stop)
        machine.emu_start(start, stop, count=1000)
        return {key: value for key, value in context.items() if key not in ("stops", "rejected", "clear_native")}

    offer_cases = []
    for result, error, expected in ((0, 0, 0x1400c50a8), (1, 0, 0x1400c5e15),
                                    (1, 1, 0x1400c51a2), (1, 2, 0x1400c4f27),
                                    (1, 3, 0x1400c5e15), (1, 255, 0x1400c5e15)):
        machine.mem_write(frame + 0x24, bytes((result, error)))
        actual = run(0x1400c4f07, (expected,))
        assert actual["stop"] == hex(expected)
        offer_cases.append({"result": result, "error": error, **actual})

    money_cases = []
    for cost in (0., .1, 1., 1.3, 10., 30.):
        for delta in (-.001, -.0002, -.0001, -.00005, 0., .00005, .001):
            balance = f32(cost + delta)
            putq(frame + 0x1e0, heap)
            machine.mem_write(heap, struct.pack("<f", balance))
            machine.mem_write(frame + 0x1e8, struct.pack("<f", cost))
            expected = 0x1400c5841 if f32(balance + f32(.0001)) < f32(cost) else 0x1400c5613
            actual = run(0x1400c55e7, (0x1400c5841, 0x1400c5613))
            assert actual["stop"] == hex(expected)
            money_cases.append({"balance_bits": bits(balance), "cost_bits": bits(cost), **actual})

    format_cases = []
    for stars in range(6):
        machine.reg_write(reg.UC_X86_REG_RAX, heap)
        machine.mem_write(heap, bytes((stars,)))
        actual = run(0x1400c4d15)
        assert actual["key"] == "armory.stars" and actual["arguments"] == {"n": stars, "of": 5}
        format_cases.append(actual)
    for stars in range(1, 6):
        machine.mem_write(frame + 0x3d5, bytes((stars,)))
        for address, value in ((frame + 0x1c8, "Warrior"), (frame + 0x30, f"Heroic {stars}"),
                               (frame + 0x190, "Elwynn Forest · Duskwood")):
            rust_string(address, value)
        # Class names use borrowed str while the generated rank/zone labels
        # and cost are owned Strings, with their distinct native vtables.
        putq(frame + 0x1c8, frame + 0x11c8)
        putq(frame + 0x1d0, len("Warrior"))
        machine.reg_write(reg.UC_X86_REG_R14, frame + 0x30)
        machine.reg_write(reg.UC_X86_REG_R15, frame + 0x190)
        actual = run(0x1400c4faa)
        assert actual["key"] == "armory.star_locked"
        assert actual["arguments"] == {"stars": stars, "class": "Warrior", "heroic": f"Heroic {stars}", "zones": "Elwynn Forest · Duskwood"}
        format_cases.append(actual)
        machine.mem_write(frame + 0x378, bytes((stars,)))
        rust_string(heap + 0x100, "1.3")
        machine.reg_write(reg.UC_X86_REG_RDI, heap + 0x100)
        actual = run(0x1400c553e)
        assert actual["key"] == "armory.upgrade" and actual["arguments"] == {"stars": stars, "n": "1.3"}
        format_cases.append(actual)
        machine.reg_write(reg.UC_X86_REG_R12, 0x1461ac6c8)
        machine.reg_write(reg.UC_X86_REG_R15, 0x1461ac448)
        machine.reg_write(reg.UC_X86_REG_XMM6, bits(2.6))
        actual = run(0x1400c5b06)
        assert actual["formatted_scalar_bits"] == bits(2.6)
        assert actual["key"] == "armory.marks_short" and actual["arguments"] == {"n": "2.6"}
        format_cases.append(actual)

    dispatch_cases = []
    for item in (101000, 101100, 111560, 0xffffffff):
        machine.reg_write(reg.UC_X86_REG_R14, heap)
        machine.mem_write(heap, struct.pack("<I", item))
        action = run(0x1400c57e3)
        assert action["ui_action"] == [14, item] and action["button_font_bits"] == bits(14.)
        dispatch_cases.append(action)
        for rejected in (0, 1):
            putq(frame + 0x1a8, heap + 0x80)
            putq(frame + 0x220, heap + 0x2000)
            putq(frame + 0x188, heap + 0x100)
            putq(heap + 0x100, 32); putq(heap + 0x108, heap + 0x300); putq(heap + 0x110, 0)
            machine.reg_write(reg.UC_X86_REG_RSI, heap)
            machine.mem_write(heap + 4, struct.pack("<I", item))
            frontend = run(0x1402c1680, (0x1402c11c2, 0x1402c11a6), rejected=rejected)
            assert frontend["transaction"] == {"save": heap + 0x2000, "id": item}
            assert ("command" in frontend) == (not rejected)
            assert qword(heap + 0x110) == (0 if rejected else 8)
            if not rejected:
                assert frontend["command"] == [14, item]
                assert qword(heap + 0x300) == 0x140169f90
            putq(frame + 0x2880, heap)
            machine.reg_write(reg.UC_X86_REG_RSI, heap + 0x4000 - 0x1110)
            backend = run(0x145b2a8c8, (0x145b2a47a,), rejected=rejected)
            assert backend["transaction"] == {"save": heap + 0x4000, "id": item}
            assert ("grants" in backend) == (not rejected)
            assert ("written_save" in backend) == (not rejected)
            if not rejected:
                assert backend["grants"] == {"save": heap + 0x4000, "dated": False}
                assert backend["written_save"] == heap + 0x4000
            dispatch_cases.append({"frontend": frontend, "backend": backend})
    callback_cases = []
    for present in (False, True):
        machine.reg_write(reg.UC_X86_REG_RDX, heap if present else 0)
        actual = run(0x140169f90)
        assert actual.get("refresh_calls", []) == (["0x14078ae00", "0x14504b400", "0x14504b3b0"] if present else [])
        callback_cases.append(actual)
    clear_cases = []
    for present in (False, True):
        world, controls, index, storage, resource = [heap + value for value in (0x4000, 0x5000, 0x6000, 0x7000, 0x8000)]
        putq(world + 0x90, int(present)); putq(world + 0x78, controls); putq(world + 0x80, 15)
        machine.mem_write(controls, bytes([0xff] * 32))
        machine.mem_write(controls + 13, b"\x6f")
        machine.mem_write(controls - 14 * 24, bytes.fromhex("49c8de2b28eb59960d5de8097c00b6df"))
        putq(controls - 14 * 24 + 16, 0)
        putq(world + 0x218, 1); putq(world + 0x210, index); putq(index, 0xffffffffffffffff)
        putq(world + 0x1e0, storage); putq(storage + 0x10, resource)
        machine.mem_write(storage + 0x30, b"\x01")
        machine.reg_write(reg.UC_X86_REG_RCX, world)
        # Remove this helper from the callback seams for this bounded sample.
        actual = run(0x14078ae00, clear_native=True)
        assert actual.get("cleared_collection") == (resource + 0x48 if present else None)
        clear_cases.append(actual)
    # Current shared AS bonus-chip renderer: one preformatted synthetic label,
    # with the actual purchase caller's current green Color and alpha.
    rust_string(heap + 0x800, "+1% damage")
    putq(heap + 0x600, heap + 0x800); putq(heap + 0x608, 1)
    putq(heap + 0x500, heap + 0x600); putq(heap + 0x508, heap + 0x700); putq(heap + 0x510, heap + 0x900)
    machine.mem_write(heap + 0x700, struct.pack("<Iffff", 0, .302, 1., .416, .85))
    machine.mem_write(heap + 0x900, b"\x01")
    machine.reg_write(reg.UC_X86_REG_RCX, heap + 0xa00)
    machine.reg_write(reg.UC_X86_REG_RDX, heap + 0x500)
    delta_renderer = run(0x1401112b0)
    assert delta_renderer["delta_text"]["font"] == 12.
    assert delta_renderer["delta_node"]["padding"] == [[1, 7.], [1, 7.], [1, 3.], [1, 3.]]
    assert delta_renderer["delta_node"]["border"] == [[1, 1.]] * 4
    assert delta_renderer["delta_node"]["border_radius"] == [[1, 10.]] * 4
    assert delta_renderer["delta_text"]["color"] == [0, f32(.302), 1., f32(.416), f32(.85)]
    assert delta_renderer["delta_node"]["border_colors"] == [[0, f32(.302), 1., f32(.416), f32(.35)]] * 4
    assert delta_renderer["delta_node"]["background"] == [0, f32(.302), 1., f32(.416), f32(.08)]
    delta_wrapper = run(0x1400c5317)
    assert delta_wrapper["delta_wrapper"] == {"row_gap": [1, 5.], "column_gap": [1, 5.], "flex_direction": 0, "flex_wrap": 1}
    return {"offer_cases": offer_cases, "affordability_cases": money_cases,
            "localization_argument_cases": format_cases, "dispatch_cases": dispatch_cases,
            "refresh_callback_cases": callback_cases, "delta_renderer": delta_renderer,
            "refresh_resource_clear_cases": clear_cases,
            "delta_wrapper": delta_wrapper,
            "original_instruction_steps": steps,
            "distinct_executed_instructions": len(seen)}


def source_check():
    armory = (ROOT / "crates/azeroth-survivors-re/src/armory.rs").read_text()
    helper = armory[armory.index("fn star_upgrade_control("):armory.index("fn time(")]
    for fragment in ("star_offer(piece.id)", '"armory.stars"', '"armory.star_max"', '"armory.star_locked"',
                     '"armory.next_star"', '"armory.upgrade"', '"armory.marks_short"',
                     "gear_stars::extra_effects(", "offer.rank, true", "+ 0.0001 >= offer.cost",
                     '("n", native_decimal(marks))', "flow_text(ui, art, label, 13., MUTED, false)",
                     "Save::star_zone_indices(", "rank.min(5)", "ArmoryAction::StarUpgrade(piece.id)"):
        assert fragment in helper, fragment
    for fragment in ("flex_wrap: FlexWrap::Wrap", "column_gap: Val::Px(5.)", "row_gap: Val::Px(5.)",
                     "UiRect::axes(Val::Px(7.), Val::Px(3.))", "BorderRadius::all(Val::Px(10.))",
                     "Color::srgba(0.302, 1., 0.416, 0.35)", "Color::srgba(0.302, 1., 0.416, 0.08)"):
        assert fragment in helper, fragment
    action = armory[armory.index("ArmoryAction::StarUpgrade(id) =>"):armory.index("if persist {")]
    assert "state.save.upgrade_star(id).is_ok()" in action and "state.queue_star_upgrade(id)" in action
    backend = (ROOT / "crates/azeroth-survivors-re/src/menu_state/backend.rs").read_text()
    branch = backend[backend.index("Command::StarUpgrade(id) => {"):backend.index("Command::Talents(class, values) =>")]
    for fragment in ("self.backend_save.upgrade_star(id).is_ok()", "grant_account(&mut self.backend_save, None)", "Ok(true)", "Ok(false)"):
        assert fragment in branch, fragment
    assert "self.save =" not in branch and "refresh_frontend_save" not in branch
    locales = sorted((ROOT / "crates/azeroth-survivors-re/assets/locales").glob("*.json"))
    assert len(locales) == 14
    for path in locales:
        values = json.loads(path.read_text())
        for key in ("stars", "star_max", "star_locked", "next_star", "upgrade", "marks_short"):
            assert "armory." + key in values, (path.name, key)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    verifier = load_script("purchase_native_verify", ROOT / "scripts/check-coop-scaling.py")
    decoded = verifier.verify(proof)
    result = replay(proof)
    source_check()
    result.update(target=proof["target"], decoded_instructions=decoded, source_connection_checked=True,
                  compiled=False, target_executed=False, parity="unverified",
                  seams=["Save transaction result is supplied by the separately proved #229 API contract; no native Save allocation or disk IO executes.",
                         "Localization, command queue, account grants/write and UI construction are typed call boundaries.",
                         "Refresh callback's three existing ECS/cache operations are observed as call boundaries, not emulated engine internals."])
    output = MANIFEST.with_name("static-check.json")
    if args.write: output.write_text(json.dumps(result, indent=2) + "\n")
    else: assert result == json.loads(output.read_text())
    print(json.dumps({key: value for key, value in result.items() if not isinstance(value, (list, dict))} |
                     {key: len(value) for key, value in result.items() if key.endswith("cases")}))


if __name__ == "__main__":
    main()

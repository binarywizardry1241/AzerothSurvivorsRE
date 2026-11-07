#!/usr/bin/env python3
"""Check current native binding-capture gates and their live source consumers.

No build, Rust test, VM, game, original filesystem operation or network request.
Unicorn interprets only bounded unchanged x64 branches, stopping before callees.
"""
import argparse
import hashlib
import importlib.util
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
EVIDENCE = ROOT / "docs/analysis/evidence/in-run-bindings-comparison"
WORK = ROOT / "runtime/analysis/history/interface/binding-capture/98c685c1bbc5"


def source_checks():
    options = (ROOT / "crates/azeroth-survivors-re/src/options.rs").read_text()
    client = (ROOT / "crates/benilla-app/src/local_client.rs").read_text()
    dispatch = (ROOT / "crates/benilla-app/src/bindings.rs").read_text()
    feed = (ROOT / "crates/benilla-app/src/ui_script/input.rs").read_text()
    extension = (ROOT / "crates/benilla-app/src/local_client/extension.rs").read_text()
    # Ownership is established before all UI/binding readers, independently of
    # the late snapshot/edit flush. The accepting frame retains that ownership.
    assert "capture_input.in_set(" in options and "LocalClientSet::OverlayCapture" in options
    assert "OverlayCapture.before(crate::ui_script::UiInput)" in client
    capture = options.split("fn capture_input(", 1)[1].split("#[derive", 1)[0]
    assert "state.open && state.page == 6 && state.bindings.capture.is_some()" in capture
    assert "sync_engine.after(benilla_app::local_client::LocalClientSet::Input)" in options
    assert "input.run_if(crate::update_ui::menu_input_enabled)\n                        .after(benilla_app::local_client::LocalClientSet::Input)" in options
    assert ".before(benilla_app::local_client::LocalClientSet::Options)" in options
    assert "pub binding_capture: bool" in extension
    # Existing command-latch reconciliation sees the captured press, but the
    # command body does not. Repeats remain down until the real release.
    start = dispatch.index("fn latch_and_dispatch(")
    body = dispatch[start:dispatch.index("/// The bindings pass once", start)]
    pressed = body.index("ButtonState::Pressed =>")
    released = body.index("ButtonState::Released =>")
    assert pressed < body.index("let repeat = state.down.press(key);") < body.index("if captured ||") < released
    assert "binding_capture || state.captured_keys.contains(&key)" in body
    assert body.index("state.captured_keys.retain(|key| key_physically_down") > released
    release = body[released:body.index("// ── Mouse buttons", released)]
    assert release.index("release(&mut state") < release.index("s.key_up_owned(&name)") < release.index("&& !binding_capture")
    assert "script.note_world_key(&name.to_string())" in body[pressed:released]
    assert "if steps != 0 && !binding_capture" in body
    assert "(5..20).map(MouseButton::Other)" in body
    assert "binding_capture || captured_keys.contains(&event.key_code)" in feed
    assert "pressed.press(event.key_code);" in feed
    assert "captured_keys.retain(|key| *key != event.key_code)" in feed
    assert feed.index("let events: Vec<_> = past_egui") < feed.index("captured_keys.retain(|key| keys.pressed(*key))")
    script = (ROOT / "crates/benilla-ui/src/script/mod.rs").read_text()
    owned = script.split("pub fn key_up_owned(", 1)[1].split("///", 1)[0]
    assert ".key_consumers.contains_key(key)" in owned
    assert "if claimed { keyboard::key_up(&self.lua, key) } else { KeyUp::Unclaimed }" in owned
    assert "world_wheel.0 = 0;" in feed
    assert "names.binding_token(event.key_code)" in options
    assert "MouseButton::Left | MouseButton::Right => None" in options
    assert "MouseButton::Other(number) if (5..20).contains(number)" in options
    assert "state.suppress_wheel || state.page == 6 && state.bindings.capture.is_some()" in options
    chord = (ROOT / "crates/benilla-app/src/bindings/chord.rs").read_text()
    assert '"BUTTON4" => Some(MouseButton::Forward)' in chord
    assert '"BUTTON5" => Some(MouseButton::Back)' in chord
    assert '(MouseButton::Forward, "Button4")' in feed and '(MouseButton::Back, "Button5")' in feed
    assert 'MouseButton::Back => Some("BUTTON5".into())' in options
    assert 'MouseButton::Forward => Some("BUTTON4".into())' in options
    # The existing production update/save APIs, rather than a second table,
    # remain the consumers of custom Options edits and Defaults.
    assert "extension.binding_writes.append(&mut state.bindings.engine_writes)" in options
    assert 'script.run("LoadBindings(0); SaveBindings(GetCurrentBindingSet())")' in extension
    assert 'SetBinding({key:?}, {command:?})' in extension
    assert "SaveBindings(GetCurrentBindingSet())" in extension
    return "Early ownership, press/held/release order, layout/mouse/wheel consumers and active-VM edit/save path traced"


def vectors(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    scratch = 0x300000000
    u.mem_map(scratch, 0x10000)
    stops, allowed = set(), (0, 0)

    def hook(_, address, size, unused):
        if address in stops:
            u.emu_stop()
        elif not allowed[0] <= address < allowed[1]:
            raise RuntimeError("Outside reviewed native branch: " + hex(address))

    u.hook_add(UC_HOOK_CODE, hook)

    def run(start, end, stop_at, registers):
        nonlocal allowed, stops
        allowed, stops = (start, end), set(stop_at)
        for name, value in registers.items():
            u.reg_write(getattr(reg, "UC_X86_REG_" + name), value)
        u.emu_start(start, 0, count=1000)
        pc = u.reg_read(reg.UC_X86_REG_RIP)
        assert pc in stops, hex(pc)
        return pc

    cases = []
    for opened in (False, True):
        for pending in (-1, 7):
            u.mem_write(scratch + 0x1c0, bytes([opened]))
            u.mem_write(scratch + 0x90, struct.pack("<q", pending))
            run(0x14018e8c8, 0x14018e90f, [0x14018e90f], {"R11": scratch})
            actual = bool(u.reg_read(reg.UC_X86_REG_R11) & 0xff)
            assert actual == (opened and pending != -1)
            cases.append(dict(kind="capture-active", opened=opened, pending=pending, active=actual))
    # This branch collects presses to remove before re-emitting the remaining
    # KeyboardInput messages. No allocator/copy/VM code is admitted here.
    context, event, escape_flag, capture_flag = [scratch + n for n in (0x1000, 0x2000, 0x3000, 0x3001)]
    u.mem_write(context, struct.pack("<QQ", escape_flag, capture_flag))
    u.mem_write(escape_flag, b"\x00")
    modifiers = (51, 52, 56, 57, 59, 60, 61, 62)
    for active in (False, True):
        for key in (20, 58, 63, 115, *modifiers):
            for state, repeat in ((0, 0), (1, 0), (0, 1)):
                u.mem_write(capture_flag, bytes([active]))
                u.mem_write(event, bytes(0x50))
                u.mem_write(event + 0x40, struct.pack("<I", key))
                u.mem_write(event + 0x4c, bytes([state, repeat]))
                pc = run(0x1400a2231, 0x1400a2291, [0x1400a2291, 0x1400a242e],
                    {"R13": context, "R15": event, "R14": event + 0x50})
                removed = pc == 0x1400a2291
                assert removed == (active and state == 0 and repeat == 0 and key != 115 and key not in modifiers)
                cases.append(dict(kind="keyboard-removal", active=active, key=key,
                    state=state, repeat=repeat, removed=removed))
    for pending in (-1, 0, 7):
        u.mem_write(scratch + 0x90, struct.pack("<q", pending))
        u.mem_write(scratch + 0xa8, struct.pack("<Q", 1))
        pc = run(0x14001ec42, 0x14001ec65, [0x14001ec65, 0x14001ed0a], {"R10": scratch})
        assert struct.unpack("<q", u.mem_read(scratch + 0x90, 8))[0] == -1
        assert (pc == 0x14001ec65) == (pending != -1)
        cases.append(dict(kind="capture-take", pending=pending, accepted=pending != -1))
    mouse_stops = {0x140722b98: "BUTTON3", 0x140722c22: "BUTTON4",
        0x140722c8f: "BUTTON5", 0x140722c55: "extra", 0x140722c83: None,
        0x140722bcd: "wheel"}
    for button, number, up, expected in [(0, 0, 0, None), (1, 0, 0, None),
            (2, 0, 0, "BUTTON3"), (3, 0, 0, "BUTTON5"), (4, 0, 0, "BUTTON4"),
            (5, 4, 0, None), (5, 5, 0, "extra"), (5, 19, 0, "extra"), (5, 20, 0, None),
            (0xffff, 0, 1, "wheel")]:
        pc = run(0x140722b7d, 0x140722efa, mouse_stops,
            {"RDX": button, "R8": number, "R9": up, "RSP": scratch + 0x8000})
        assert mouse_stops[pc] == expected, (button, number, hex(pc))
        cases.append(dict(kind="mouse-token", button=button, number=number, up=up, token=expected))
    for up in (False, True):
        pc = run(0x140722bd5, 0x140722bdb, [0x140722bdd, 0x140722e23], {"RBX": up})
        assert (pc == 0x140722bdd) == up
        cases.append(dict(kind="wheel-token", up=up, token="MOUSEWHEELUP" if up else "MOUSEWHEELDOWN"))
    return cases

#!/usr/bin/env python3
"""Verify current lobby UI contracts using bytes, receipts and isolated instructions.

No Rust compilation, application, service, network or rendered UI is executed.
Node captures stop before the engine builder. Allocation is a synthetic seam.
"""

from script_sources import current_path, recorded_input_matches
import argparse
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from equipment_native import EquipmentProbe
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/coop-lobby-ui-comparison"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def node_fields(raw):
    value = lambda at: list(struct.unpack_from("<If", raw, at))
    return {
        "width": value(136), "height": value(144), "min_height": value(160),
        "padding": [value(216 + i * 8) for i in range(4)],
        "border": [value(248 + i * 8) for i in range(4)],
        "radius": [value(280 + i * 8) for i in range(4)],
        "row_gap": value(320), "column_gap": value(328),
        "align_bytes": list(raw[360:384]),
    }


def card_capture(probe, party, present=True, eligible=True, heroic=False):
    builder, snapshot = probe.alloc(64), probe.alloc(0x178)
    stack = probe.STACK + 0x1f0008
    probe.put(stack, probe.DONE)
    if party:
        hero = probe.alloc(0x70)
        probe.native.mem_write(hero + 0x6e, bytes([eligible]))
        probe.put(snapshot + 0x90, hero, int(present))
        probe.native.mem_write(snapshot + 0x175, b"\x01")
        start, probe.stop = 0x140147c90, 0x14014834e
    else:
        probe.native.mem_write(snapshot + 0x4b, bytes([heroic]))
        probe.put(stack + 40, probe.alloc(64), snapshot)
        start, probe.stop = 0x14014ba40, 0x14014bcdf
    for name, value in (("RSP", stack), ("RCX", builder),
                        ("RDX", probe.alloc(64)), ("R8", probe.alloc(64)),
                        ("R9", snapshot if party else probe.alloc(64))):
        probe.reg(name, value)
    probe.native.emu_start(start, probe.DONE, count=10000)
    assert probe.reg("RIP") == probe.stop
    bundle = probe.reg("R8")
    out = node_fields(bytes(probe.native.mem_read(bundle + 8, 384)))
    out["border_color"] = list(struct.unpack("<I4f", probe.native.mem_read(bundle + 0x188, 20)))
    out["background"] = list(struct.unpack("<I4f", probe.native.mem_read(bundle + 0x1d8, 20)))
    return out


def instruction_cases(image, pe, ranges, proof):
    probe = EquipmentProbe(image, pe, ranges)
    captures = []
    for heroic in (False, True):
        captures.append({"kind": "run_card", "heroic": heroic,
                         "node": card_capture(probe, False, heroic=heroic)})
    for present, eligible in ((False, False), (True, True), (True, False)):
        captures.append({"kind": "party_slot", "present": present, "eligible": eligible,
                         "node": card_capture(probe, True, present, eligible)})
    assert captures == proof["node_captures"]

    count = len(captures)
    # Exact rank collector: omit every negative signed value, retain duplicates/order.
    for values in itertools.product((-1, -2, 0, 5, 256), repeat=3):
        rows, output = probe.alloc(0x128 * len(values)), probe.alloc(24)
        for index, value in enumerate(values):
            probe.put(rows + index * 0x128 + 0x108, value & ((1 << 64) - 1))
        probe.invoke(0x140085820, output, rows, rows + 0x128 * len(values))
        got = [probe.q(probe.q(output + 8) + i * 8) for i in range(probe.q(output + 16))]
        assert got == [value for value in values if value >= 0], (values, got)
        count += 1

    # The real cycle entry takes an already sorted, deduplicated rank vector.
    for values in ((), (0,), (1, 5), (0, 1, 5, 256)):
        for selected in (None, 0, 1, 3, 5, 256):
            vector, state = probe.alloc(8 * len(values)), probe.alloc(0x178)
            probe.put(vector, *values)
            probe.put(state, int(selected is not None), selected or 0)
            frame, tick = probe.STACK + 0x100000, probe.alloc(4)
            probe.put(frame + 0x2e0, tick)
            probe.native.mem_write(frame + 0x2ec, struct.pack("<I", 37))
            probe.reg("RBP", frame)
            probe.reg("R15", state)
            probe.reg("RDI", tick)
            probe.reg("R14", len(values))
            probe.reg("RCX", vector)
            probe.reg("RDX", 0)  # zero capacity stops before the allocator seam
            probe.stop = 0x140160494
            probe.native.emu_start(0x14016021b, probe.DONE, count=10000)
            assert probe.reg("RIP") == probe.stop
            want = values[0] if selected is None and values else None
            if selected in values:
                index = values.index(selected) + 1
                want = values[index] if index < len(values) else None
            got = probe.q(state + 8) if probe.q(state) else None
            assert got == want, (values, selected, got, want)
            assert struct.unpack("<I", probe.native.mem_read(tick, 4))[0] == 37
            count += 1

    for value in (*range(512), (1 << 63) - 1):
        probe.invoke(0x145be05d0, value)
        assert probe.reg("RAX") == min(value & 255, 5)
        count += 1

    # Event15 writes only the ordinary difficulty resource and its change tick.
    for before in (0, 1):
        frame, target, tick = probe.STACK + 0x100000, probe.alloc(32), probe.alloc(4)
        coop = probe.alloc(0x178)
        probe.native.mem_write(coop, b"\xa5" * 0x178)
        probe.native.mem_write(target, bytes([before]) + b"\x5a" * 31)
        probe.put(frame + 0x130, target, tick)
        probe.native.mem_write(frame + 0x184, struct.pack("<I", 91))
        probe.reg("RBP", frame)
        probe.reg("R15", coop)
        probe.stop = 0x14016056b
        probe.native.emu_start(0x14016004d, probe.DONE, count=100)
        assert probe.reg("RIP") == probe.stop
        assert bytes(probe.native.mem_read(target, 32)) == b"\x01" + b"\x5a" * 31
        assert bytes(probe.native.mem_read(coop, 0x178)) == b"\xa5" * 0x178
        assert struct.unpack("<I", probe.native.mem_read(tick, 4))[0] == 91
        count += 1
    return count


def verify_manifest(proof, target):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    assert target == proof["target"] and proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("coop_lobby_ui_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    ranges, count = [], 0
    for row in proof["functions"]:
        start, end = int(row["start"], 0), int(row["end_exclusive"], 0)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert hex(offset) == row["file_offset"] and sha(raw) == row["sha256"]
        decoded = list(decoder.disasm(raw, start))
        assert sum(item.size for item in decoded) == len(raw), row["role"]
        count += len(decoded)
        assembly = "".join(f"{hex(item.address)}: {item.mnemonic} {item.op_str}\n" for item in decoded)
        assert receipt(row["assembly"]).read_text() == assembly
        ranges.append((start, end))
    for row in proof["data_ranges"]:
        offset = pe.rva_offset(int(row["start"], 0) - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert sha(raw) == row["sha256"] and raw.hex() == row["hex"]
    for row in proof["queries"]:
        result = json.loads(receipt(row["result"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert verify_native_query_subject(ROOT, native, row, target, image=image, pe=pe) == row["subject_verification"]
        assert receipt(row["canonical_extract"]).read_text() == native["normalized_result"]
    return image, pe, ranges, count


def selected_target():
    return {key: value for key, value in latest_target(verify=True).items()
            if key in ("version", "path", "sha256", "size_bytes")}


def check():
    proof = json.loads((BASE / "manifest.json").read_text())
    image, pe, ranges, count = verify_manifest(proof, selected_target())
    data = {row["role"]: row["hex"] for row in proof["data_ranges"]}
    assert data["coop-startup-typeid"] == data["coop-input-typeid"]
    assert data["change-difficulty-typeid"] == data["ordinary-difficulty-typeid"]
    cases = instruction_cases(image, pe, ranges, proof)
    print(f"#258–#260: {len(proof['queries'])} Ghidra queries, {count} byte-verified instructions, {cases} isolated instruction/Node cases passed; no application or UI execution.")


def staff_cases(image, pe, ranges, proof):
    """Replay AS interfaces; allocation, memcmp and CRT sinf are explicit seams."""
    import math

    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    bits = lambda value: struct.unpack("<I", struct.pack("<f", value))[0]

    class StaffProbe(EquipmentProbe):
        stops = ()
        reached = None

        def hook(self, machine, pc, size, unused):
            if pc == self.stop or pc in self.stops:
                self.reached = pc
                machine.emu_stop()
                return
            if pc in (0x1461f0080, 0x146208860, 0x146061b30):
                header = self.reg("RCX")
                capacity, pointer, length = (self.q(header + at) for at in (0, 8, 16))
                added = 1 if pc == 0x146208860 else self.reg("R8")
                capacity = max(capacity * 2, length + added, 16)
                replacement = self.alloc(capacity)
                if length:
                    self.native.mem_write(replacement, bytes(self.native.mem_read(pointer, length)))
                self.put(header, capacity, replacement, length)
            elif pc == 0x146061721:
                left, right, length = (self.reg(register) for register in ("RCX", "RDX", "R8"))
                self.reg("RAX", int(bytes(self.native.mem_read(left, length)) !=
                                    bytes(self.native.mem_read(right, length))))
            elif pc == 0x146061751:
                value = struct.unpack("<f", struct.pack("<I", self.reg("XMM0") & 0xffffffff))[0]
                self.reg("XMM0", bits(math.sin(value)))
            elif pc == 0x14606171b:
                destination, source, length = (self.reg(register) for register in ("RCX", "RDX", "R8"))
                self.native.mem_write(destination, bytes(self.native.mem_read(source, length)))
                self.reg("RAX", destination)
            elif pc == 0x1402fea40:
                # Name-text construction is an engine seam. The following
                # tooltip Node's AS layout/color stores execute unchanged.
                self.native.mem_write(self.reg("RCX"), bytes(0x82))
            else:
                return super().hook(machine, pc, size, unused)
            stack = self.reg("RSP")
            self.reg("RIP", self.q(stack))
            self.reg("RSP", stack + 8)

    probe, cases = StaffProbe(image, pe, ranges), 0
    contract = proof["staff_contract"]
    assert contract["title"]["signature_length"] == 64
    assert contract["title"]["public_key_hex"] == "bc6a6dd554756700632f16e24ddbbdd3ecbe16f30ee96466242b2ccdfcccfc0e"

    # The raw parser copies arbitrary bytes unchanged and admits only64bytes.
    for length in (0, 1, 32, 63, 64, 65, 88, 128):
        raw = bytes((index * 47 + 255) & 255 for index in range(length))
        source, output = probe.alloc(max(length, 1)), probe.alloc(80)
        if raw: probe.native.mem_write(source, raw)
        probe.stops = ()
        probe.invoke(0x145d3d590, output, source, length)
        assert probe.native.mem_read(output, 1)[0] == (0 if length == 64 else 1)
        if length == 64: assert bytes(probe.native.mem_read(output + 1, 64)) == raw
        cases += 1

    # Exact signed preimage: domain, NUL-stripped fields/separators andLEu64s.
    for fields in ((b"PARTY", "朋友".encode(), b"Guide"), (b"", b"", b""),
                   (b"A\0B\0", b"\0N\0", b"\0T\0"),
                   (b"x" * 80, "界🐉".encode() * 20, b"\xff\0\x80")):
        profile, output = probe.alloc(0x70), probe.alloc(24)
        for offset, raw in zip((0, 0x18, 0x30), fields):
            source = probe.alloc(max(len(raw), 1))
            if raw: probe.native.mem_write(source, raw)
            probe.put(profile + offset, len(raw), source, len(raw))
        probe.put(profile + 0x60, 0x0102030405060708, 0x8877665544332211)
        probe.invoke(0x145ec09c0, output, profile)
        expected = b"azeroth-coop vouch v1\0" + b"".join(raw.replace(b"\0", b"") + b"\0" for raw in fields)
        expected += struct.pack("<QQ", 0x0102030405060708, 0x8877665544332211)
        assert bytes(probe.native.mem_read(probe.q(output + 8), probe.q(output + 16))) == expected
        cases += 1

    # Sanitization removes controls before taking24accepted Unicode scalars.
    for title in ("", "Guide", "\0\t\x7f\x9f", "友\x7f🐉\x9f" * 30,
                  "a" * 23 + "\n\0界🐉tail", "\u200b\ufeff" + "é" * 30):
        raw, source, iterator, output = title.encode(), probe.alloc(max(len(title.encode()), 1)), probe.alloc(24), probe.alloc(24)
        if raw: probe.native.mem_write(source, raw)
        probe.put(iterator, source, source + len(raw), 24)
        probe.invoke(0x145b46990, output, iterator)
        expected = "".join(character for character in title if not (
            ord(character) < 32 or 127 <= ord(character) <= 159))[:24].encode()
        assert bytes(probe.native.mem_read(probe.q(output + 8), probe.q(output + 16))) == expected
        cases += 1

    # Identity/context/expiry failures stop before generic cryptography. Valid
    # cases reach the key decoder interface; strict signatures stay library-owned.
    for change in ("valid", "emptycontext", "context", "guid", "name", "expiry", "emptytitle"):
        profile, output, key = probe.alloc(0x70), probe.alloc(24), probe.alloc(32)
        for offset, raw in ((0, b"PARTY"), (0x18, b"Name"), (0x30, b"Guide")):
            source = probe.alloc(len(raw)); probe.native.mem_write(source, raw)
            probe.put(profile + offset, len(raw), source, len(raw))
        probe.put(profile + 0x60, 42, 100)
        context = b"OTHER" if change == "context" else b"PARTY"
        name = b"Other" if change == "name" else b"Name"
        context_at, name_at = probe.alloc(8), probe.alloc(8)
        probe.native.mem_write(context_at, context); probe.native.mem_write(name_at, name)
        if change == "emptytitle": probe.put(profile + 0x40, 0)
        stack = probe.STACK + 0x1f0008; probe.put(stack, probe.DONE)
        probe.put(stack + 40, 0 if change == "emptycontext" else len(context),
                  43 if change == "guid" else 42, name_at, len(name), 100 if change == "expiry" else 99)
        for register, value in (("RSP", stack), ("RCX", output), ("RDX", key), ("R8", profile), ("R9", context_at)):
            probe.reg(register, value)
        probe.stop, probe.stops = 0x145b05d91, (0x145b05eb6,)
        probe.native.emu_start(0x145b05cc0, probe.DONE, count=10000)
        assert probe.reached == (0x145b05d91 if change == "valid" else 0x145b05eb6), change
        cases += 1

    # Full entity bits and unwrapped elapsed time feed the native modulo/phase
    # instructions. The CRT sinf interface is supplied explicitly above.
    probe.stops = ()
    for entity, elapsed in itertools.product(
        (1, 2, 7, 0x100000001, 0xabcdef0123456789, 0xfffffffffffffffe),
        (0., .125, 1., 13.25, 4096., 8192.25),
    ):
        stack = probe.STACK + 0x1f0008; probe.put(stack, probe.DONE)
        probe.reg("RSP", stack); probe.reg("R14", entity)
        for register, value in (("XMM6", f32(elapsed * f32(3.2))), ("XMM7", .6), ("XMM8", .5)):
            probe.reg(register, bits(value))
        probe.stop = 0x144eaabf0
        probe.native.emu_start(0x1402de5c6, probe.DONE, count=10000)
        factor_bits = probe.reg("XMM3") & 0xffffffff
        argument = f32(f32((entity % 7) * f32(.6)) + f32(elapsed * f32(3.2)))
        factor = f32(f32(f32(math.sin(argument)) * .5) + .5)
        assert factor_bits == bits(factor), (hex(entity), elapsed)
        low, high, output = probe.alloc(20), probe.alloc(20), probe.alloc(20)
        a, b = contract["update"]["low_srgba"], contract["update"]["high_srgba"]
        probe.native.mem_write(low, struct.pack("<I4f", 0, *a)); probe.native.mem_write(high, struct.pack("<I4f", 0, *b))
        probe.reg("XMM3", factor_bits)
        probe.invoke(0x144eaabf0, output, low, high)
        expected = [f32(f32(f32(x) * f32(1. - factor)) + f32(f32(y) * factor)) for x, y in zip(a, b)]
        assert bytes(probe.native.mem_read(output, 20)) == struct.pack("<I4f", 0, *expected)
        cases += 1

    # The name wrapper is a plain retained hover source; its tooltip is hidden,
    # above the name, with the same constructor as the directory title hover.
    for tooltip in (False, True):
        stack = probe.STACK + 0x1f0008; probe.put(stack, probe.DONE)
        capture, builder = probe.alloc(128), probe.alloc(128)
        if tooltip:
            font, size = probe.alloc(32), probe.alloc(8)
            probe.native.mem_write(font, b"\x01"); probe.native.mem_write(size, struct.pack("<f", 17.))
            probe.put(capture + 0x18, font, size)
            start, probe.stop = 0x140334b70, 0x1402fe500
        else:
            probe.put(stack + 40, capture, capture)
            start, probe.stop = 0x1402b8eb0, 0x1402f7e50
        for register, value in (("RSP", stack), ("RCX", builder), ("RDX", capture),
                                ("R8", probe.alloc(128)), ("R9", probe.alloc(128)), ("MXCSR", 0x1f80)):
            probe.reg(register, value)
        probe.native.emu_start(start, probe.DONE, count=10000)
        assert probe.reg("RIP") == probe.stop
        bundle = probe.reg("R8")
        raw = bytes(probe.native.mem_read(bundle + 8, 384)); node = node_fields(raw)
        if tooltip:
            assert struct.unpack_from("<If", raw, 104) == (1, 0.)
            assert struct.unpack_from("<If", raw, 128) == (2, 100.)
            assert struct.unpack_from("<If", raw, 208) == (1, 4.)
            assert raw[371] == 1 and raw[373] == 3
            assert node["padding"] == [[1, 8.], [1, 8.], [1, 3.], [1, 3.]]
            assert node["border"] == [[1, 1.]] * 4 and node["radius"] == [[1, 4.]] * 4
            assert bytes(probe.native.mem_read(bundle + 0x188, 20)) == struct.pack("<I4f", 0, .56, .27, .98, 1.)
            assert bytes(probe.native.mem_read(bundle + 0x1d8, 20)) == struct.pack("<I4f", 0, .06, .02, .12, .95)
        else:
            assert node["padding"] == [[1, 0.]] * 4 and node["border"] == [[1, 0.]] * 4
            assert node["row_gap"] == [1, 0.] and node["column_gap"] == [1, 0.]
        cases += 1

    source = (ROOT / "crates/azeroth-survivors-re/src/coop/replication.rs").read_text()
    assert "normalize(&mut profile.bytes_48)" not in source
    source = (ROOT / "crates/azeroth-survivors-re/src/coop/staff.rs").read_text()
    assert "key.verify_strict(&message(profile), &signature)" in source
    assert "Signature::from_slice(&profile.bytes_48)" in source
    import re
    key = re.search(r"const PUBLIC_KEY:\s*\[u8;\s*32\]\s*=\s*\[(.*?)\];", source, re.S)
    assert bytes(int(value, 16) for value in re.findall(r"0x([0-9a-f]{2})", key[1])).hex() == contract["title"]["public_key_hex"]
    for name, field in (("low", "low_srgba"), ("high", "high_srgba")):
        values = re.search(rf"let {name} = \[(.*?)\];", source)[1]
        actual = [float(value.strip()) for value in values.split(",")]
        assert struct.pack("<4f", *actual) == struct.pack("<4f", *contract["update"][field])
    source = (ROOT / "crates/azeroth-survivors-re/src/coop_staff_ui.rs").read_text()
    assert "entity.to_bits() as u32 == 0" in source and "time.elapsed_secs()" in source
    context = json.loads((ROOT / contract["title"]["context_owner"]).read_text())
    assert context["target"] == proof["target"]
    assert context["staff_service_context_contract"]["presence_is_not_readiness"] is True
    source = (ROOT / "crates/azeroth-survivors-re/src/coop_directory.rs").read_text()
    assert "let vouch_code = service.worker.as_ref().and(view.code.clone());" in source
    return cases


def check_chat():
    proof = json.loads((ROOT / "docs/analysis/evidence/coop-lobby-ui/manifest.json").read_text())
    image, pe, ranges, count = verify_manifest(proof, selected_target())
    # Both real admission routes and the footer consume the recovered helper.
    menu = (ROOT / "crates/azeroth-survivors-re/src/menu.rs").read_text()
    picker = (ROOT / "crates/azeroth-survivors-re/src/picker.rs").read_text()
    import re
    admission_sites = list(re.finditer(r"state\.begin_enter\(&catalog, time\.elapsed_secs\(\)\)", menu))
    assert len(admission_sites) == 2
    assert all("!coop.waiting_for_players()" in menu[max(0, site.start()-220):site.start()]
               for site in admission_sites)
    assert "let waiting = coop.waiting_for_players();" in menu
    assert "*previous_waiting == waiting" in menu
    assert "footer(root, art, catalog, state, waiting_for_players)" in picker
    assert re.search(r"fn footer\([^)]*waiting_for_players: bool", picker, re.S)
    assert re.search(r'if waiting_for_players\s*{\s*"Waiting for players"', picker)

    class ChatProbe(EquipmentProbe):
        def hook(self, machine, pc, size, unused):
            if pc == self.stop:
                return super().hook(machine, pc, size, unused)
            if pc in (0x14606171b, 0x1402f4270, 0x140338020, 0x144ea3c40):
                if pc == 0x14606171b:
                    destination, source, length = (self.reg(k) for k in ("RCX", "RDX", "R8"))
                    self.native.mem_write(destination, bytes(self.native.mem_read(source, length)))
                elif pc == 0x1402f4270:
                    destination, source = self.reg("RCX"), self.reg("RDX")
                    self.native.mem_write(destination, bytes(self.native.mem_read(source, 48)))
                    self.reg("RAX", destination)
                elif pc == 0x144ea3c40:
                    color = bytes(self.native.mem_read(self.reg("RDX"), 20))
                    assert struct.unpack_from("<I", color)[0] == 0
                    # Exact input is already Srgba; copy its channels only.
                    self.native.mem_write(self.reg("RCX"), color[4:20])
                # The selected-run header closure is an explicit layout seam.
                stack = self.reg("RSP")
                self.reg("RIP", self.q(stack))
                self.reg("RSP", stack + 8)
                return
            if pc != 0x146061727:
                return super().hook(machine, pc, size, unused)
            # Native Vec::remove delegates only the overlapping byte move.
            destination, source, length = (self.reg(k) for k in ("RCX", "RDX", "R8"))
            self.native.mem_write(destination, bytes(self.native.mem_read(source, length)))
            stack = self.reg("RSP")
            self.reg("RIP", self.q(stack))
            self.reg("RSP", stack + 8)

    probe = ChatProbe(image, pe, ranges)
    cases = 0
    # Modal content keeps its native36/24padding inside the bounded panel.
    stack = probe.STACK + 0x1f0008
    probe.put(stack, probe.DONE)
    for register, value in (("RSP", stack), ("RCX", probe.alloc(128)),
                            ("RDX", probe.alloc(128)), ("MXCSR", 0x1f80)):
        probe.reg(register, value)
    probe.stop = 0x1402180e0
    probe.native.emu_start(0x14033bd80, probe.DONE, count=10000)
    assert probe.reg("RIP") == probe.stop
    modal = node_fields(bytes(probe.native.mem_read(probe.reg("RDX"), 384)))
    assert modal["padding"] == [[1, 36.], [1, 36.], [1, 24.], [1, 24.]]
    assert modal["row_gap"] == [1, 12.]
    cases += 1
    stack = probe.STACK + 0x1f0008
    probe.put(stack, probe.DONE)
    for register, value in (("RSP", stack), ("RCX", probe.alloc(128)),
                            ("RDX", probe.alloc(128)), ("R8", probe.alloc(128)),
                            ("R9", probe.alloc(128)), ("MXCSR", 0x1f80)):
        probe.reg(register, value)
    probe.stop = 0x1402f5b00
    probe.native.emu_start(0x1402b9d10, probe.DONE, count=10000)
    assert probe.reg("RIP") == probe.stop
    bundle = probe.reg("R8")
    panel = node_fields(bytes(probe.native.mem_read(bundle + 8, 384)))
    assert panel["padding"] == [[1, 12.]] * 4
    assert panel["border"] == [[1, 1.]] * 4
    assert panel["radius"] == [[1, 8.]] * 4
    assert panel["row_gap"] == [1, 8.]
    assert struct.unpack_from("<I", probe.native.mem_read(bundle + 0x188, 20))[0] == 0
    cases += 1
    for start, stop, expected in (
        (0x140338a30, 0x1402f4270, {"width": [1, 600.], "row_gap": [1, 8.]}),
        (0x1402bbf60, 0x1402bc431, {"column_gap": [1, 20.], "min_height": [1, 0.]}),
    ):
        stack = probe.STACK + 0x1f0008
        probe.put(stack, probe.DONE)
        for register, value in (("RSP", stack), ("RCX", probe.alloc(256)),
                                ("RDX", probe.alloc(2048)), ("R8", probe.alloc(2048)),
                                ("R9", probe.alloc(2048)), ("MXCSR", 0x1f80)):
            probe.reg(register, value)
        probe.stop = stop
        probe.native.emu_start(start, probe.DONE, count=10000)
        assert probe.reg("RIP") == stop
        captured = node_fields(bytes(probe.native.mem_read(probe.reg("R8") + 8, 384)))
        for key, value in expected.items(): assert captured[key] == value, (hex(start), key, captured)
        cases += 1
    for role, status, members in itertools.product(
        ("", "host", "guest", "Host"),
        ("off", "hosting", "joining", "joined", "left", "closed", "playing"),
        (0, 1, 2, 5),
    ):
        state = probe.alloc(0x200)
        for offset, value in ((0x18, status), (0x48, role)):
            raw = value.encode()
            string = probe.alloc(max(8, len(raw)))
            probe.native.mem_write(string, raw or b"\0")
            probe.put(state + offset, string, len(raw))
        probe.put(state + 0x98, members)
        probe.invoke(0x1402af0d0, state)
        assert bool(probe.reg("RAX") & 255) == (
            role == "host" and status in ("hosting", "joining", "joined", "left") and members < 2
        ), (role, status, members)
        cases += 1
    for length, opened, own, system in itertools.product((0, 79, 80), (False, True), (False, True), (False, True)):
        state, rows, line = probe.alloc(0x200), probe.alloc(82 * 64), probe.alloc(64)
        probe.put(state + 0x148, 82, rows, length)
        probe.put(state + 0x190, 7)
        probe.put(state + 0x1a0, 17)
        probe.native.mem_write(state + 0x1b4, bytes([opened]))
        for index in range(length): probe.put(rows + index * 64 + 0x30, index + 1)
        probe.put(line + 0x30, 999)
        probe.native.mem_write(line + 0x38, bytes([own, system]))
        probe.invoke(0x1402af200, state, line)
        assert probe.q(state + 0x158) == min(length + 1, 80)
        assert probe.q(state + 0x1a0) == 17 + int(not opened and not own and not system)
        assert probe.q(state + 0x190) == 8
        assert probe.q(rows + (min(length + 1, 80) - 1) * 64 + 0x30) == 999
        if length == 80: assert probe.q(rows + 0x30) == 2
        cases += 1

    for visible, content, scale, scroll in ((100., 200., 1., 95.9), (100., 200., 1., 96.),
        (100., 200., 1., 100.), (100., 200., 2., 195.9), (100., 200., 2., 196.),
        (100., 50., 1., 0.), (0., 100., 1., 0.)):
        for own in ((), (False,), (False, False), (True,), (False, True)):
            node, position, rows = probe.alloc(0x68), probe.alloc(8), probe.alloc(max(1, len(own)) * 64)
            probe.native.mem_write(node + 0x3c, struct.pack("<f", content))
            probe.native.mem_write(node + 0x64, struct.pack("<f", scale))
            probe.native.mem_write(position + 4, struct.pack("<f", scroll))
            for index, value in enumerate(own):
                probe.native.mem_write(rows + index * 64 + 0x38, bytes([value]))
            stack = probe.STACK + 0x100008
            probe.put(stack + 0xa0, position)
            probe.put(stack + 0x40, len(own))
            probe.put(stack + 0xd8, rows)
            for register, value in (("RSP", stack), ("RAX", node), ("RDX", 1)):
                probe.reg(register, value)
            for register, value in (("XMM0", visible), ("XMM6", 0.), ("XMM7", -4.)):
                probe.reg(register, int.from_bytes(struct.pack("<f", value), "little"))
            probe.stop = 0x1402e5c70
            probe.native.emu_start(0x1402e5bfe, probe.DONE, count=1000)
            assert probe.reg("RIP") == probe.stop
            expected = visible <= 0. or scroll >= max(content - visible, 0.) * scale - 4. or any(own)
            assert bool(probe.reg("RDX") & 255) == expected, (visible, content, scale, scroll, own)
            cases += 1
    if "staff_contract" in proof: cases += staff_cases(image, pe, ranges, proof)
    print(f"#291 lobby: {len(proof['queries'])} bound Ghidra queries, {count} byte-verified instructions, {cases} isolated lobby/staff interface cases passed; compilation, UI/network execution and parity remain separate.")


def check_kick():
    """Bind the recovered GUID action to live source without executing Rust."""
    import platform
    import subprocess

    target = latest_target(verify=True)
    image = target_bytes(target)
    native = json.loads((ROOT / "docs/analysis/evidence/coop-dispatch/manifest.json").read_text())
    ui = json.loads((ROOT / "docs/analysis/evidence/coop-lobby-ui/manifest.json").read_text())
    assert native["target"]["sha256"] == ui["target"]["sha256"] == target["sha256"]
    contract = native["kick_contract"]
    assert (contract["local_request"], contract["wire_tag"],
            contract["distinct_from_service_request_tag"], contract["distinct_from_service_denied_tag"]) == (26, 3, 7, 23)
    assert bytes.fromhex(contract["reason_bytes_hex"]) == b"the host sent you away"
    assert bytes.fromhex(contract["wire_bytes_hex"]) == b"\x03\x16\0\0\0the host sent you away"
    refused = native["guest_denied_contract"]
    assert refused["wire_tag"] == 3 and refused["joined_zone_or_game_gate"] is False
    assert refused["ordinary_failure_helper_called"] is False
    rows = [row for row in native["ranges"] if row["role"] in ("local-request-arms", "denied-serializer",
        "guest-denied-role-transition", "guest-denied-reason-publication")]
    rows += [row for row in ui["functions"] if row["role"] in ("coop-ui-actions", "coop-member-content")]
    assert len(rows) == 6
    for row in rows:
        offset, size = int(row["file_offset"], 16), row["byte_count"]
        assert sha(image[offset:offset + size]) == row["sha256"], row["role"]
        for kind in ("assembly", "pseudocode"):
            if kind in row:
                artifact = row[kind]
                assert sha((ROOT / artifact["path"]).read_bytes()) == artifact["sha256"]

    base = ROOT / "crates/azeroth-survivors-re/src"
    names = ("coop_forms.rs", "coop_ui.rs", "coop_directory.rs", "coop_runtime.rs",
             "gameplay/coop.rs", "coop/session.rs")
    source = {name: (base / name).read_text() for name in names}
    assert "Kick(u64)" in source["coop_forms.rs"]
    assert 'if view.role == "host" && !hero.host {' in source["coop_ui.rs"]
    assert "Click::Kick(hero.hero_identity)" in source["coop_ui.rs"]
    assert "FormRequest::Kick(hero_identity)" in source["coop_ui.rs"]
    assert "runtime.kick_requests.push(hero_identity);" in source["coop_directory.rs"]
    assert "pub kick_requests: Vec<u64>" in source["coop_runtime.rs"]
    game = source["gameplay/coop.rs"]
    denied = game.split("fn receive_denied(", 1)[1].split("fn kick_member(", 1)[0]
    assert "if client.is_some() { return false; }" in denied and "self.leave();" in denied
    assert not any(effect in denied for effect in (".settle(", "run.", "menu.", "local.", "SessionEnd::", ".end()"))
    admission = game.split("fn kick_member(", 1)[1].split("fn guest_engine_packet(", 1)[0]
    assert "driver.is_hosting()" in admission and "driver.server.clients().iter().find_map" in admission
    assert "self.profiles.get(&client.id)" in admission and "hero.guid == hero_identity" in admission
    assert "driver.kick_client(client, now)" in admission
    assert not any(gate in admission for gate in ("run.", "mechanics", "active", "synchronized"))
    receive = game.split("fn receive(", 1)[1].split("fn queue_delivery(", 1)[0]
    assert receive.index("std::mem::take(&mut runtime.kick_requests)") < receive.index("let Some(guid) = runtime.world_guid")
    assert receive.index("driver.take_party_events()") < receive.index("let mut events =")
    assert "let guest = runtime.driver.as_ref().is_some_and(|driver| !driver.is_hosting());" in receive
    assert "if state.receive_denied(client) { return; }" in receive
    session = source["coop/session.rs"]
    kick = session.split("pub fn kick_client(", 1)[1].split("pub fn send_message(", 1)[0]
    assert "if !self.is_hosting()" in kick
    ordered = ("peer.flush(now)", "encode_lifecycle(&LifecyclePacket::Denied",
               "peer.connection.send(&denied)", "peer.connection.close()",
               "peer.connection.take_relay_commands()", "self.peers.remove(index)", "self.retire_client(client)")
    assert [kick.index(value) for value in ordered] == sorted(kick.index(value) for value in ordered)
    assert 'b"the host sent you away"' in kick
    assert "peer.flush(now);" in session.split("pub fn flush(", 1)[1].split("pub fn kick_client(", 1)[0]
    assert "let receiving = self.denial.is_none();" in session and "if refused { break 'receive; }" in session
    for regression in ("kick_flushes_pending_output_then_denies_closes_and_retires_the_actual_peer",
                       "kick_requires_the_host_role_and_an_actual_connection"):
        assert regression in session
    assert "denied_stops_the_current_decoded_batch_and_later_buffered_frames" in session
    assert "local_kick_resolves_the_admitted_guid_instead_of_client_or_service_numbers" in game
    assert "queued_denial_clears_only_the_guest_cache_after_the_driver_is_off" in game
    assert "kick_controls_keep_the_actual_member_guid_and_only_the_host_can_request_one" in source["coop_ui.rs"]

    host = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin",
            ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}.get((platform.system(), platform.machine()))
    assert host, "Configured Rust syntax parser unavailable on this host"
    parser = ROOT / ".tools/rust" / f"1.98.1-{host}" / "bin/rustfmt"
    assert parser.is_file(), "Configured syntax parser unavailable; no installation attempted"
    for name in names:
        result = subprocess.run([str(parser), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                                input=source[name], text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
        assert result.returncode == 0, (name, result.stderr)
    print(f"#291 Kick: {len(rows)} retained native ranges/hash bindings, GUID/request/flush/retirement source connections and {len(names)} Rust syntax parses passed; six authored regressions uncompiled/unrun, no native/application/network execution.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--contract", choices=("lobby-ui", "lobby-chat", "lobby-kick"), default="lobby-ui")
    args = parser.parse_args()
    {"lobby-ui": check, "lobby-chat": check_chat, "lobby-kick": check_kick}[args.contract]()

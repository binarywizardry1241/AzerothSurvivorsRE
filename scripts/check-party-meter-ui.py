#!/usr/bin/env python3
"""Replay bounded original Party DPS instructions against synthetic HUD rows.

JSON lookup/map/value conversion, allocation, copying, string formatting and
localization are named seams. No Rust compilation or game/server runs occur.
"""
from portable_paths import portable_json, portable_record

import argparse
import hashlib
import json
import math
from pathlib import Path
import platform
import struct
import subprocess
import sys

TARGET = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
PROOF = "docs/analysis/evidence/0.121.0/party-meter-ui.json"
SOURCES = ["crates/azeroth-survivors-re/src/" + path for path in
           ["run_meter.rs", "gameplay/meter.rs", "gameplay/meter/settings.rs",
            "gameplay/meter/view.rs"]]
RANGES = [("settings-mode", 0x1401bf28c, 0x1401bf2ef),
          ("mode-title", 0x1401baf20, 0x1401baf77),
          ("menu-mode-array", 0x1401013c9, 0x1401013d3),
          ("menu-mode-index", 0x140101413, 0x140101423),
          ("menu-mode-action", 0x1401015fb, 0x140101616),
          ("mode-write", 0x1401c8904, 0x1401c893e),
          ("reset-visibility", 0x1401c8a28, 0x1401c8a40),
          ("mode-rows", 0x1401c9878, 0x1401c9914),
          ("empty-text", 0x1400fd691, 0x1400fd745),
          ("elapsed-mode", 0x1401c9978, 0x1401c999c),
          ("elapsed-clamp", 0x1401c9c55, 0x1401c9c6c),
          ("current-rate", 0x1401c9c6c, 0x1401c9cd0),
          ("hero-row-adapter", 0x1401a5180, 0x1401a5f4b),
          ("row-baseline-and-admission", 0x1401a1ed0, 0x1401a2241),
          ("party-row-color", 0x1400fdf0e, 0x1400fdff0),
          ("color-parse", 0x140275b10, 0x140275fac),
          ("RGB-byte-constructor", 0x144e54d30, 0x144e54d65),
          ("RGBA-byte-constructor", 0x144e54d70, 0x144e54da4)]


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def derive(root, source_root):
    sys.path.insert(0, str(root / "scripts"))
    import capstone
    import unicorn
    import unicorn.x86_const as r
    from coverage_common import latest_target, target_bytes
    from discovery_native_subject import verify_native_query_subject
    from script_sources import load_script

    target = latest_target(verify=True)
    assert target["version"] == "0.121.0" and target["sha256"] == TARGET
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("party_meter_pe", root / "scripts/inventory-executable.py").PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    def raw(first, count):
        offset = pe.rva_offset(first - pe.image_base)
        assert pe.rva_offset(first + count - 1 - pe.image_base) == offset + count - 1
        return image[offset:offset + count]

    def binding(path, source=False):
        return dict(path=path, sha256=sha(((source_root if source else root) / path).read_bytes()))

    query_root = "runtime/q41-party-meter-0.121.0"
    journal_path = query_root + "/query/journal.json"
    journal = json.loads((root / journal_path).read_text())
    queries = []
    for address in (0x1401c8e30, 0x1401a5180):
        op = next(row for row in journal["operations"].values()
                  if row.get("name") == "procedure_pseudo_code"
                  and row.get("arguments") == {"procedure": hex(address)})
        assert op["status"] == "completed"
        saved = json.loads((root / op["result"]["path"]).read_text())
        ev = saved.get("structuredContent") or json.loads(saved["content"][0]["text"])
        query = dict(procedure=hex(address), plan=binding(query_root + "/plan.json"),
                     journal=binding(journal_path), result=op["result"],
                     raw_input=binding(query_root + "/code.bin"), slice_virtual_address="0x1401a5180",
                     evidence_id=ev["evidence_id"], provider=ev["provider"],
                     analysis_profile_digest=ev["analysis_profile"]["digest"],
                     normalized_text_sha256=sha(ev["normalized_result"].encode()))
        assert sha((root / op["result"]["path"]).read_bytes()) == op["result"]["sha256"]
        verify_native_query_subject(root, ev, query, identity, image=image, pe=pe)
        queries.append(query)

    machine = unicorn.Uc(unicorn.UC_ARCH_X86, unicorn.UC_MODE_64)
    mapped, allowed, native = set(), set(), []

    def memory(first, count):
        for page in range(first & ~4095, (first + count + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    for role, first, last in RANGES:
        value = raw(first, last - first)
        decoded = list(decoder.disasm(value, first))
        assert sum(item.size for item in decoded) == len(value)
        memory(first, len(value))
        machine.mem_write(first, value)
        allowed.update(item.address for item in decoded)
        native.append(dict(role=role, virtual_address=hex(first), end_exclusive=hex(last),
                           byte_count=len(value), sha256=sha(value), instruction_count=len(decoded)))
    data_ranges = [(0x1461d8208, 52), (0x1461daa44, 32), (0x1461b2020, 16),
                   (0x1461b07a0, 0x70), (0x1461d6700, 0x1a0),
                   (0x1461a8d08, 32), (0x146198650, 48), (0x1461982d0, 16)]
    # Include every directly referenced scalar constant and exact literal/table
    # cell used by the admitted fragments. No neighboring word is another case.
    decoder.detail = True
    for row in native:
        first = int(row["virtual_address"], 16)
        for item in decoder.disasm(raw(first, row["byte_count"]), first):
            for operand in item.operands:
                if operand.type == capstone.x86_const.X86_OP_MEM and operand.mem.base == capstone.x86_const.X86_REG_RIP:
                    dest = item.address + item.size + operand.mem.disp
                    if 0x146100000 <= dest < 0x148000000:
                        data_ranges.append((dest, 32))
    for first, count in data_ranges:
        memory(first, count)
        machine.mem_write(first, raw(first, count))
    assert raw(0x1461d8208, 4) == bytes(range(4))
    assert raw(0x1461d822e, 9) == b"Party DPS"
    assert raw(0x1461b07e8, 16) == b"Only in a party."
    seams = [0x142ccdb60, 0x145aeaeb0, 0x1401bc660, 0x140002200, 0x1400021c0,
             0x1400021d0, 0x145febc1b, 0x145febc27, 0x1401ae1d0, 0x140095d50,
             0x142ccfff0, 0x1401924f0, 0x14026b7b0, 0x140185cd0, 0x145fec6d0,
             0x145fec390, 0x14008b0a0, 0x145fbe970]
    for first in seams + [0x20000000, 0x1401bc94d, 0x1401c8a80]:
        memory(first, 1)
        machine.mem_write(first, b"\xc3")
    memory(0x20000000, 0x100000)
    memory(0x22000000, 0x400000)
    # Guard only for the emulator's block decoder beyond the renderer stop;
    # the code hook rejects any executed instruction outside admitted ranges.
    memory(0x1400fe000, 4096)
    memory(0x14859c338, 8)
    machine.mem_write(0x14859c338, struct.pack("<Q", 0x20008000))
    frame, stack, done = 0x20004000, 0x2000e000, 0x20000000
    state, objects, heap, steps = {}, {}, 0x22000000, 0

    def put(first, *values):
        machine.mem_write(first, struct.pack("<" + "Q" * len(values), *values))

    def word(first):
        return struct.unpack("<Q", machine.mem_read(first, 8))[0]

    def number(register):
        return struct.unpack("<d", struct.pack("<Q", machine.reg_read(register) & ((1 << 64) - 1)))[0]

    def float_register(register, value):
        machine.reg_write(register, struct.unpack("<Q", struct.pack("<d", value))[0])

    def alloc(count):
        nonlocal heap
        address = heap
        heap += (count + 15) & ~15 or 16
        assert heap < 0x22400000
        machine.mem_write(address, b"\0" * max(1, count))
        return address

    def string(text):
        value = text.encode()
        address = alloc(len(value))
        machine.mem_write(address, value or b"\0")
        return address, len(value)

    def encode(value, address=None):
        address = address or alloc(32)
        machine.mem_write(address, b"\0" * 32)
        if value is None:
            return address
        if isinstance(value, bool):
            machine.mem_write(address, bytes([1, int(value)]))
        elif isinstance(value, (int, float)):
            machine.mem_write(address, b"\x02")
            put(address + 8, 2, struct.unpack("<Q", struct.pack("<d", value))[0])
        elif isinstance(value, str):
            pointer, count = string(value)
            machine.mem_write(address, b"\x03")
            put(address + 8, count, pointer, count)
        elif isinstance(value, list):
            pointer = alloc(len(value) * 32)
            for index, row in enumerate(value):
                encode(row, pointer + index * 32)
            machine.mem_write(address, b"\x04")
            put(address + 8, len(value), pointer, len(value))
        else:
            marker = alloc(8)
            objects[marker] = value.copy()
            machine.mem_write(address, b"\x05")
            put(address + 8, marker, 0, len(value))
        return address

    def decode(address):
        tag = machine.mem_read(address, 1)[0]
        if tag == 0:
            return None
        if tag == 1:
            return bool(machine.mem_read(address + 1, 1)[0])
        if tag == 2:
            return struct.unpack("<d", machine.mem_read(address + 16, 8))[0]
        if tag == 3:
            return bytes(machine.mem_read(word(address + 16), word(address + 24))).decode()
        if tag == 4:
            return [decode(word(address + 16) + index * 32) for index in range(word(address + 24))]
        assert tag == 5, tag
        return objects[word(address + 8)].copy()

    def ret(value=None):
        if value is not None:
            machine.reg_write(r.UC_X86_REG_RAX, value)
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        machine.reg_write(r.UC_X86_REG_RIP, word(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, pc, size, __):
        nonlocal steps
        if pc in state["stops"]:
            state["stopped"] = pc
            machine.emu_stop()
            return
        if pc in seams:
            rcx, rdx, r8, r9 = (machine.reg_read(reg) for reg in
                                (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9))
            if pc == 0x142ccdb60:
                key = bytes(machine.mem_read(rcx, rdx)).decode()
                state.setdefault("lookups", []).append(key)
                obj = decode(r8)
                ret(encode(obj[key]) if isinstance(obj, dict) and key in obj else 0)
            elif pc == 0x145aeaeb0:
                key = bytes(machine.mem_read(rcx, rdx)).decode()
                state.setdefault("localized", []).append(key)
                if state["kind"] in ("title", "empty"):
                    state["stopped"] = pc
                    machine.emu_stop()
                else:
                    pointer, count = string("Autres sorts" if key == "Other spells" else key)
                    machine.reg_write(r.UC_X86_REG_RDX, count)
                    ret(pointer)
            elif pc == 0x1401bc660:
                state["saved"] = machine.mem_read(rcx + 0x32, 1)[0]
                ret()
            elif pc in (0x140002200, 0x1400021d0, 0x140185cd0):
                ret()
            elif pc == 0x1400021c0:
                ret(alloc(rcx))
            elif pc == 0x145febc1b:
                if r8:
                    machine.mem_write(rcx, bytes(machine.mem_read(rdx, r8)))
                ret(rcx)
            elif pc == 0x145febc27:
                ret(0 if machine.mem_read(rcx, r8) == machine.mem_read(rdx, r8) else 1)
            elif pc == 0x1401ae1d0:
                count, pointer = word(rdx + 16), word(rdx + 8)
                copied = alloc(count * 32)
                if count:
                    machine.mem_write(copied, bytes(machine.mem_read(pointer, count * 32)))
                put(rcx, count, copied, count)
                ret(rcx)
            elif pc == 0x140095d50:
                marker = word(rdx)
                if not marker:
                    marker = alloc(8)
                    objects[marker] = {}
                    put(rdx, marker, 0, 0)
                key = bytes(machine.mem_read(word(r8 + 8), word(r8 + 16))).decode()
                objects[marker][key] = decode(r9)
                put(rdx + 16, len(objects[marker]))
                machine.mem_write(rcx, b"\xff" + b"\0" * 31)
                ret(rcx)
            elif pc == 0x142ccfff0:
                encode(number(r.UC_X86_REG_XMM1), rcx)
                ret(rcx)
            elif pc == 0x1401924f0:
                machine.mem_write(rcx, b"\x04" + b"\0" * 7 + bytes(machine.mem_read(rdx, 24)))
                ret(rcx)
            elif pc == 0x14026b7b0:
                machine.mem_write(rcx, bytes(machine.mem_read(rdx, 32)))
                ret(rcx)
            elif pc in (0x145fec6d0, 0x145fec390):
                stride = 32 if pc == 0x145fec6d0 else word(machine.reg_read(r.UC_X86_REG_RSP) + 0x28)
                capacity, pointer, count = word(rcx), word(rcx + 8), word(rcx + 16)
                copied = alloc(max(4, capacity * 2) * stride)
                if count:
                    machine.mem_write(copied, bytes(machine.mem_read(pointer, count * stride)))
                put(rcx, max(4, capacity * 2), copied, count)
                ret()
            elif pc == 0x14008b0a0:
                # Copy each original JSON top row into the native parts vector.
                pointer = word(r8 + 16)
                count = (rdx - rcx) // 32
                if count:
                    machine.mem_write(pointer, bytes(machine.mem_read(rcx, count * 32)))
                put(word(r8), count)
                ret()
            elif pc == 0x145fbe970:
                assert rdx == 0x1461d67ef and raw(rdx, 8) == bytes.fromhex("c00420c2b720c000")
                left, right = word(r8), word(r8 + 16)
                text = bytes(machine.mem_read(word(left), word(left + 8))).decode() + " · "
                text += bytes(machine.mem_read(word(right), word(right + 8))).decode()
                pointer, count = string(text)
                put(rcx, count, pointer, count)
                ret(rcx)
            return
        assert pc in allowed, f"Unreviewed instruction/callee {pc:#x}"
        steps += 1

    machine.hook_add(unicorn.UC_HOOK_CODE, hook)

    def reset(kind, stops):
        nonlocal heap
        state.clear()
        state.update(kind=kind, stops=set(stops))
        objects.clear()
        heap = 0x22000000
        machine.mem_write(0x20000000, b"\0" * 0x10000)
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_RSP, stack)
        put(stack, done)

    def run(first):
        try:
            machine.emu_start(first, 0, count=10000)
        except unicorn.UcError as error:
            raise AssertionError((state, hex(machine.reg_read(r.UC_X86_REG_RIP)), str(error))) from error
        assert "stopped" in state, (state["kind"], hex(machine.reg_read(r.UC_X86_REG_RIP)))

    mode_cases = []
    for value, expected in [(0., 0), (1., 1), (2., 2), (3., 3), (3.9, 3), (4., 0), (-1., 0), (math.inf, 0), (math.nan, 0)]:
        reset("settings", [0x1401bc94d])
        machine.mem_write(0x20001014, struct.pack("<f", value))
        machine.reg_write(r.UC_X86_REG_RCX, 0x20001000)
        machine.reg_write(r.UC_X86_REG_XMM0, 0)
        run(0x1401bf28c)
        actual = machine.reg_read(r.UC_X86_REG_R13)
        assert actual == expected, (value, actual)
        mode_cases.append([f"0x{struct.unpack('<I', struct.pack('<f', value))[0]:08x}", actual])
    title_cases, reset_cases, write_cases, menu_cases = [], [], [], []
    for mode, title in enumerate(["Damage Done", "Healing Done", "Boss Damage", "Party DPS"]):
        reset("title", [])
        machine.reg_write(r.UC_X86_REG_RCX, mode)
        run(0x1401baf20)
        assert state["localized"] == [title]
        title_cases.append([mode, title])
        reset("menu", [0x1401013d3, 0x140101423, 0x140101616])
        run(0x1401013c9)
        assert machine.mem_read(frame + 0xb8, 4) == bytes(range(4))
        machine.reg_write(r.UC_X86_REG_R15, mode)
        run(0x140101413)
        assert word(frame + 0xc0) == mode
        run(0x1401015fb)
        action = bytes(machine.mem_read(frame + 0x41c, 3))
        assert action == bytes([2, mode, 0])
        menu_cases.append([mode, action.hex()])
        reset("reset", [0x1401c8a40])
        machine.reg_write(r.UC_X86_REG_RBP, mode)
        machine.reg_write(r.UC_X86_REG_RAX, 0x20002000)
        machine.reg_write(r.UC_X86_REG_RCX, 0x20003000)
        run(0x1401c8a28)
        display = machine.mem_read(0x20002175, 1)[0]
        assert display == (3 if mode >= 2 else 0)
        reset_cases.append([mode, display])
        for previous in (mode, (mode + 1) % 4):
            reset("write", [0x1401c893e, 0x1401c8a80])
            put(stack + 0x68, 0x20002000, 0x20003000)
            machine.mem_write(0x20002031, bytes([1, previous]))
            machine.mem_write(0x20001000, bytes([mode]))
            machine.reg_write(r.UC_X86_REG_RDX, 0x20001000)
            run(0x1401c8904)
            assert machine.mem_read(0x20002031, 2) == bytes([0, mode])
            assert state.get("saved") == (None if mode == previous else mode)
            write_cases.append([previous, mode, "save" if "saved" in state else "unchanged"])

    empty_cases = []
    for mode, value, expected in [(0, None, "No damage yet."), (1, None, "No healing yet."),
                                  (2, None, "No boss fought yet."), (3, None, "Only in a party."),
                                  (3, [], "No damage yet."), (3, [{}], "No damage yet."),
                                  (3, True, "No damage yet.")]:
        reset("empty", [])
        put(frame, 0)
        put(0x20001010, encode({"partyMeter": value}))
        machine.mem_write(0x20002000, bytes([mode]))
        machine.reg_write(r.UC_X86_REG_RSI, 0x20001000)
        machine.reg_write(r.UC_X86_REG_RCX, 0x20002000)
        run(0x1400fd691)
        assert state["localized"] == [expected]
        empty_cases.append([mode, value, expected])

    elapsed_cases = []
    for mode, now, baseline, expected in [(0, 10., 8., 2.), (1, 10., 8., 2.),
                                          (3, 10., 8., 10.), (3, .5, 8., 1.)]:
        reset("elapsed", [0x1401c9c6c])
        machine.reg_write(r.UC_X86_REG_R14, mode)
        machine.reg_write(r.UC_X86_REG_RSI, mode)
        machine.reg_write(r.UC_X86_REG_RDI, 0x20002000)
        machine.mem_write(0x20002030, struct.pack("<d", baseline))
        float_register(r.UC_X86_REG_XMM7, now)
        run(0x1401c9978)
        actual = struct.unpack("<d", machine.mem_read(frame + 0x230, 8))[0]
        assert actual == expected
        elapsed_cases.append([mode, now, baseline, actual])

    selection_cases = []
    for mode, name in enumerate(["Damage", "Healing", "Boss", "Party"]):
        reset("selection", [0x1401c9914])
        hud = encode({"meter":[{"name":"Damage"}], "healing":[{"name":"Healing"}]})
        boss = encode({"lines":[{"name":"Boss"}]})
        encode([{"name":"Party"}], frame + 0x188)
        put(frame + 0x2c8, 0x20002000)
        put(frame + 0x2d8, hud)
        machine.mem_write(0x20002032, bytes([mode]))
        machine.reg_write(r.UC_X86_REG_RBX, boss)
        machine.reg_write(r.UC_X86_REG_R13, 0x20008000)
        run(0x1401c9878)
        actual = decode(machine.reg_read(r.UC_X86_REG_R15))
        assert actual == [{"name":name}], (mode, actual)
        selection_cases.append([mode, state.get("lookups", []), actual])

    rate_cases = []
    for mode, now, total, samples, expected in [
        (3, 10., 400., [[8.,100.,200.,300.,200.]], 100.),
        (0, 10., 400., [[8.,100.,200.,300.,200.]], 150.),
        (3, 10., 400., [[9.5,100.,200.,300.,200.]], 0.),
        (3, 10., 400., [[8.,0.,0.,0.,600.],[9.,0.,0.,0.,200.]], 200.),
        (3, 10., 400., [], 0.),
    ]:
        reset("rate", [0x1401c9cd0])
        machine.reg_write(r.UC_X86_REG_R12, 0x20001000)
        machine.reg_write(r.UC_X86_REG_R8, mode)
        float_register(r.UC_X86_REG_XMM7, now)
        machine.mem_write(frame + 0x238, struct.pack("<d", total))
        put(0x20001008, 0x20002000, len(samples))
        for index, sample in enumerate(samples):
            machine.mem_write(0x20002000 + index * 40, struct.pack("<5d", *sample))
        run(0x1401c9c6c)
        actual = number(r.UC_X86_REG_XMM6)
        assert actual == expected, (mode, actual)
        rate_cases.append([mode, now, total, samples, actual])

    admission_cases = []
    for mode, values, baseline, expected in [
        (0, [80.], 60., [20.]), (1, [80.], 60., [20.]),
        (2, [80.], 60., [80.]), (3, [80.], 60., [80.]),
        (3, [0., .5, 1., math.nan, 2.], 100., [1., 2.]),
        (3, [10., 20.], 100., [10., 20.]),
    ]:
        reset("admission", [done])
        pointer, count = string("Twin")
        rows = alloc(len(values) * 64)
        for index, value in enumerate(values):
            address = rows + index * 64
            put(address, count, pointer, count, 0, 8, 0)
            machine.mem_write(address + 0x30, struct.pack("<d", value))
        put(0x20001000, rows, rows + len(values) * 64, 0x20003000, 0x20002000)
        machine.mem_write(0x20002000, bytes([mode]))
        put(0x20003000, 0x20005000)
        put(0x20005000, 1, 0x20006000, 1, 1, 0x20006000, 1)
        put(0x20006000, count, pointer, count, 0)
        machine.mem_write(0x20006020, struct.pack("<d", baseline))
        machine.reg_write(r.UC_X86_REG_RCX, 0x20007000)
        machine.reg_write(r.UC_X86_REG_RDX, 0x20001000)
        run(0x1401a1ed0)
        actual = [struct.unpack("<d", machine.mem_read(word(0x20007008) + index * 48 + 32, 8))[0]
                  for index in range(word(0x20007010))]
        assert actual == expected, (mode, values, actual, expected)
        admission_cases.append(dict(mode=mode, input_bits=[struct.pack("<d", value).hex() for value in values],
                                    baseline=baseline, admitted_totals=actual, names_all_equal=True))

    row_cases = []
    inputs = [
        {"name":"Twin","color":"#69CCF0","dmg":100.,"top":[{"name":"Éclair","icon":"SpellIcon","dmg":60.}]},
        {"name":"Twin","color":"#FFFFFF","dmg":40.,"top":[]},
        {"name":"No remainder","color":"#FF7D0A","dmg":60.5,"top":[{"name":"One","icon":"I","dmg":60.}]},
        {"name":"Exact remainder","color":"#FFF569","dmg":61.,"top":[{"name":"One","icon":"I","dmg":60.}]},
        {"name":"Multiple","color":"#9482C9","dmg":50.,"top":[{"name":"First","icon":"A","dmg":30.},{"name":"Second","icon":"B","dmg":20.}]},
        {"name":"Zero","color":"#C79C6E","dmg":0.,"top":[]},
        {"name":"Empty name","color":"#ABD473","dmg":1.,"top":[{"name":"","icon":"EmptyNamedIcon","dmg":1.}]},
    ]
    for value in inputs:
        reset("adapter", [done])
        array = encode([value])
        put(0x20001000, 1, array + 8, 0, 0, 0, 0)
        machine.reg_write(r.UC_X86_REG_RDX, 0x20001000)
        machine.reg_write(r.UC_X86_REG_RCX, 0x20002000)
        run(0x1401a5180)
        actual = decode(0x20002000)
        top = value["top"]
        expected = dict(name=value["name"] + (" · " + top[0]["name"] if top else ""),
                        icon=top[0]["icon"] if top else "", dmg=value["dmg"], proc=False,
                        parts=[row.copy() for row in top], color=value["color"])
        other = value["dmg"] - sum(row["dmg"] for row in top)
        if other >= 1.:
            expected["parts"].append(dict(name="Autres sorts", dmg=other))
        assert actual == expected, (value, actual, expected)
        row_cases.append(dict(input=value, native=actual))

    color_cases = []
    colors = [(color, False) for color in ["#F58CBA", "#ABD473", "#FFF569", "#FFFFFF", "#0070DE",
              "#69CCF0", "#9482C9", "#FF7D0A", "#C79C6E", None, False, "#GGGGGG", ""]] + [(None, True)]
    for color, missing in colors:
        reset("color", [0x1400fdfd8, 0x1400fdff0])
        row = dict(name="Twin")
        if not missing:
            row["color"] = color
        native_rows = encode([row])
        name, length = string("Twin")
        machine.reg_write(r.UC_X86_REG_R12, word(native_rows + 16))
        machine.reg_write(r.UC_X86_REG_R13, 32)
        machine.reg_write(r.UC_X86_REG_RSI, name)
        machine.reg_write(r.UC_X86_REG_R14, length)
        run(0x1400fdf0e)
        tag, *rgba = struct.unpack("<I4f", machine.mem_read(frame + 0x2d0, 20))
        expected = ([int(color[index:index+2], 16) / 255.0 for index in (1,3,5)] + [1.0]
                    if isinstance(color, str) and len(color) == 7 and "G" not in color else
                    [0.973, 0.824, 0.416, 1.0] if isinstance(color, str) else [0.78, 0.25, 0.16, 1.0])
        expected = list(struct.unpack("<4f", struct.pack("<4f", *expected)))
        assert tag == 0 and rgba == expected, (color, tag, rgba, expected)
        color_cases.append(dict(input=color, missing=missing, native_tag=tag,
                               native_rgba_bits=[f"0x{word:08x}" for word in struct.unpack("<4I", struct.pack("<4f", *rgba))]))

    source = {path: (source_root / path).read_text() for path in SOURCES}
    assert "    Party," in source[SOURCES[0]]
    settings, view, ui = source[SOURCES[2]], source[SOURCES[3]], source[SOURCES[1]]
    for text in ["3 => MeterMode::Party", "MeterMode::Party => 3"]:
        assert text in settings
    for text in ["party_rows(party_value, locale)", "game.party_meter_hud(locale)", 'hud.get("partyMeter")',
                 "samples: Vec<(f64, [f64; 4])>", "MeterMode::Party => party", "else if index == 3", "rows.retain(|row| row.total >= 1.0)"]:
        assert text in view, text
    for text in ['MeterMode::Party => "Party DPS"', 'MeterMode::Party => "No damage yet."',
                 'MeterMode::Party if !meter.snapshot.party_available => "Only in a party."',
                 "row.color", "MeterMode::Damage | MeterMode::Healing"]:
        assert text in ui, text
    host_path = "crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs"
    host = (source_root / host_path).read_text()
    start = host.index("    pub fn party_meter_hud(")
    end = host.index("    /// Current14590f0f0 JSON", start)
    host_projection = dict(path=host_path, method="Mechanics::party_meter_hud",
                           sha256=sha(host[start:end].encode()))
    assert 'hud["partyMeter"] = serde_json::json!(self.party_meter_hud(locale));' in host
    assert "super::PALETTE[0]" in view and "super::GOLD.to_srgba()" in view
    host_names = {("Darwin", "arm64"): "aarch64-apple-darwin",
                  ("Darwin", "x86_64"): "x86_64-apple-darwin",
                  ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}
    formatter = root / ".tools/rust" / ("1.98.1-" + host_names[(platform.system(), platform.machine())]) / "bin/rustfmt"
    assert formatter.is_file(), "Existing syntax parser unavailable; no installation attempted"
    for path in SOURCES + [host_path]:
        parsed = subprocess.run([str(formatter), "--edition", "2024", "--emit", "stdout",
                                 "--config", "skip_children=true"], input=(source_root / path).read_bytes(),
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, check=False)
        assert parsed.returncode == 0, (path, parsed.stderr.decode())
    data_observations = [dict(role=role, virtual_address=hex(first), byte_count=count, sha256=sha(raw(first, count)))
                         for role, first, count in [("four-mode-bytes",0x1461d8208,4),
                                                    ("four-title-targets",0x1461daa44,16),
                                                    ("four-row-targets",0x1461daa54,16),
                                                    ("four-empty-targets",0x1461b2020,16),
                                                    ("Other-spells",0x1461d67f7,12),
                                                    ("name-format",0x1461d67ef,8)]]
    return dict(schema_version=1, target=identity, gap_ids=[251],
                generator=dict(path="scripts/check-party-meter-ui.py", sha256=sha(Path(__file__).read_bytes())),
                dependencies=[binding(path) for path in ["scripts/coverage_common.py", "scripts/discovery_native_subject.py",
                                                        "scripts/script_sources.py", "scripts/inventory-executable.py"]],
                source_contracts=[binding(path, True) for path in SOURCES], host_projection=host_projection,
                native_ranges=native, data_observations=data_observations, queries=queries,
                syntax=dict(parser="rustfmt", parser_sha256=sha(formatter.read_bytes()),
                            files=SOURCES + [host_path], skip_children=True, compilation=False),
                fixture=dict(settings_cases=mode_cases, title_cases=title_cases, menu_actions=menu_cases,
                             reset_visibility=reset_cases,
                             mode_writes=write_cases, empty_text=empty_cases, elapsed=elapsed_cases,
                             selections=selection_cases, current_rate=rate_cases, admission=admission_cases,
                             party_rows=row_cases, colors=color_cases, original_instruction_steps=steps,
                             seams=["JSON lookup/map/value conversion and immutable clone", "allocation/deallocation and byte copying/comparison",
                                    "native two-string middle-dot format", "localization with Other spells -> Autres sorts", "persistence call receipt"],
                             synthetic_memory=True),
                limits=["The unchanged original x64 instructions govern data/register layout; raw-slice pseudocode omits external data/callees and ends at unknown table branches.",
                        "Source checks inspect connected text; authored Rust regressions are unrun. No compilation, client/server/game execution or original/rebuilt parity check occurred."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs-root", type=Path)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    source_root = Path(__file__).resolve().parents[1]
    root = args.inputs_root.resolve() if args.inputs_root else source_root
    value = derive(root, source_root)
    path = source_root / PROOF
    if args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(portable_json(value, indent=2, allow_nan=False) + "\n")
    else:
        assert portable_record(json.loads(path.read_text())) == portable_record(value), "Party evidence differs; inspect before publishing"
    print(f"Verified native Party DPS settings/title/reset/input/empty/time/row cases; {value['fixture']['original_instruction_steps']} original instruction steps; Rust/client/server/game unrun")


if __name__ == "__main__":
    main()

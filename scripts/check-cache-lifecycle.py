#!/usr/bin/env python3
"""Bounded #49 native replay and source wiring; no compiler or game process.

--prepare stages current raw Ghidra inputs below runtime/.
--collect stages the curated manifest/extracts there after REA has completed.
Default checks the retained current-target manifest and replays original code.
"""
import argparse
import ctypes
import hashlib
import itertools
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/analysis/history/inventory/chest-lifecycle/cf9c18b2353c"
KEPT = ROOT / "docs/analysis/evidence/0.113.2/cache-lifecycle"
RANGES = {
    "create-go": (0x145954610, 0x145954940),
    "purchase": (0x145954A70, 0x145954C6E),
    "interaction": (0x14593DC90, 0x14593DE07),
    "remove": (0x14594FD70, 0x14594FF8D),
    "go-drive": (0x1409D9DC0, 0x1409DADA3),
}
SEAMS = {
    "field-insert": 0x1459A18C0, "field-drop": 0x1459A2120,
    "create-packet": 0x1458A7230, "serialize-packet": 0x1458A7490,
    "memmove": 0x145CF999D, "allocation-gate": 0x140002200,
    "allocate": 0x1400021C0, "free": 0x1400021D0,
    "sinf": 0x145CF99BB, "cosf": 0x145CF99D9,
    "choice-request": 0x145965190,
}
SNIPPETS = {
    "walk-proximity": (0x14594EEA0, 0x14594EEC7),
    "walk-click-policy": (0x14594EFED, 0x14594F014),
}


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False, allow_nan=False) + "\n"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def dependencies():
    for name in ("runtime/tool-state/python/camera/python-libs",
                 "runtime/tool-state/python/armory/python-libs"):
        sys.path.insert(0, str(ROOT / name))


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def replay(pe, data):
    dependencies()
    import unicorn as u
    from unicorn import x86_const as x

    cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    cpu.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        cpu.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    cpu.mem_map(mem, 0x200000)
    cpu.mem_map(stack, 0x20000)
    cpu.mem_map(done, 4096)
    game, pickups, packets = mem, mem + 0x4000, mem + 0x6000
    context = {}
    libm = ctypes.CDLL(None)
    math_functions = {}
    for name in ("sinf", "cosf"):
        function = getattr(libm, name)
        function.argtypes = [ctypes.c_float]
        function.restype = ctypes.c_float
        math_functions[SEAMS[name]] = function

    def reg(name, value=None):
        key = getattr(x, "UC_X86_REG_" + name)
        if value is not None:
            cpu.reg_write(key, value)
        return cpu.reg_read(key)

    def put(address, fmt, *values):
        cpu.mem_write(address, struct.pack("<" + fmt, *values))

    def get(address, fmt):
        return struct.unpack("<" + fmt, cpu.mem_read(address, struct.calcsize("<" + fmt)))

    def ret():
        pointer = reg("RSP")
        reg("RIP", get(pointer, "Q")[0])
        reg("RSP", pointer + 8)

    def hook(_, address, size, unused):
        if address == done or address in context["stops"]:
            context["stopped"] = address
            cpu.emu_stop()
        elif address == SEAMS["field-insert"]:
            context["fields"].append([reg("RDX") & 0xFFFF, reg("R8") & 0xFFFFFFFF])
            ret()
        elif address in (SEAMS["field-drop"], SEAMS["allocation-gate"], SEAMS["free"]):
            ret()
        elif address in math_functions:
            value = struct.unpack("<f", struct.pack("<I", reg("XMM0") & 0xFFFFFFFF))[0]
            reg("XMM0", bits(math_functions[address](value)))
            ret()
        elif address == SEAMS["create-packet"]:
            context["created"].append(dict(
                guid=reg("RDX"), kind=reg("R8") & 0xFF,
                position_bits=list(get(reg("R9"), "III")),
                yaw_bits=get(reg("RSP") + 0x28, "I")[0],
                fields=context["fields"].copy()))
            cpu.mem_write(reg("RCX"), bytes(32))
            ret()
        elif address == SEAMS["serialize-packet"]:
            # Packet composition is an existing client interface. These opaque
            # bytes only let the caller finish its actual queue append.
            cpu.mem_write(reg("RCX"), bytes(32))
            ret()
        elif address == SEAMS["allocate"]:
            value = context["heap"]
            context["heap"] += (reg("RCX") + 15) & ~15
            assert context["heap"] < mem + 0x100000
            reg("RAX", value)
            ret()
        elif address == SEAMS["memmove"]:
            destination, source, count = reg("RCX"), reg("RDX"), reg("R8")
            cpu.mem_write(destination, bytes(cpu.mem_read(source, count)))
            reg("RAX", destination)
            ret()
        elif address == SEAMS["choice-request"]:
            context["choices"].append([reg("RDX") & 0xFF, reg("R8") & 0xFF])
            put(game + 0xC12, "B", 3)
            ret()
        elif not any(a <= address < b for a, b in [*RANGES.values(), *SNIPPETS.values()]):
            raise AssertionError("Unreviewed native call/code: " + hex(address))

    cpu.hook_add(u.UC_HOOK_CODE, hook)

    def reset():
        context.clear()
        context.update(fields=[], created=[], choices=[], heap=mem + 0x10000, stops=set())
        cpu.mem_write(mem, bytes(0x20000))
        cpu.mem_write(stack, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP",
                     "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            reg(name, 0)
        reg("MXCSR", 0x1F80)
        reg("EFLAGS", 2)
        put(stack + 0x10000, "Q", done)
        reg("RSP", stack + 0x10000)
        put(game + 0x620, "QQQ", 64, packets, 0)

    def run(address):
        context.pop("stopped", None)
        put(stack + 0x10000, "Q", done)
        reg("RSP", stack + 0x10000)
        cpu.emu_start(address, done + 1, count=50000)
        assert "stopped" in context, "Native replay exhausted its instruction budget"

    descriptors = []
    for serial, seed in itertools.product((0, 0xFFFFFE, 0xFFFFFFFF), (1, 7, 31, 1024)):
        reset()
        rng = [seed, 2, 3, 4]
        put(game + 0xB98, "I", serial)
        put(game + 0xAC0, "QQQQ", *rng)
        put(mem + 0x3000, "III", 9005, 259, bits(1.0))
        put(mem + 0x3100, "fff", 4.0, -2.0, 17.5)
        put(stack + 0x10028, "I", 0)
        reg("RCX", game)
        reg("RDX", mem + 0x3000)
        reg("R8", mem + 0x3100)
        reg("R9", 3)
        run(RANGES["create-go"][0])
        created, = context["created"]
        fields = dict(created["fields"])
        guid = 0xF11000232D000000 | ((serial + 1) & 0xFFFFFF)
        assert reg("RAX") == created["guid"] == guid
        assert created["kind"] == 5 and fields[14] == 1
        assert fields[3] == 9005 and fields[8] == 259 and fields[21] == 3
        assert fields[9] == 0 and fields[4] == bits(1.0) and fields[20] == 35
        assert len(created["fields"]) == 16 and get(game + 0x630, "Q") == (1,)
        descriptors.append(dict(counter=serial, rng=rng, next_rng=list(get(game + 0xAC0, "QQQQ")),
                                next_counter=get(game + 0xB98, "I")[0], **created))

    def pickup(guid, kind=2, distance=0.0):
        put(pickups, "QQQ", 0, 8, 0)
        put(pickups + 0x20, "I", kind)
        put(pickups + 0x28, "Q", guid)
        put(pickups + 0x30, "Ifff", 9005, distance, 0.0, 0.0)
        put(game + 0x608, "QQQ", 8, pickups, 1)

    def queued():
        result = []
        for i in range(get(game + 0x630, "Q")[0]):
            row = packets + i * 32
            length = get(row + 16, "Q")[0]
            result.append([get(row + 24, "H")[0],
                           bytes(cpu.mem_read(get(row + 8, "Q")[0], length)).hex()])
        return result

    interactions = []
    guid = 0xF11000232D000123
    distances = (0.0, 3.0, 10.0, f32(10.000001), float("inf"), float("nan"))
    for state, matching, kind, distance, gold in itertools.product(
            (0, 1, 2, 3), (False, True), (0, 2), distances, (19, 20, 31)):
        reset()
        pickup(guid, kind, distance)
        put(game + 0xC12, "B", state)
        put(game + 0x4F0, "I", gold)
        put(game + 0xBC4, "I", 20)
        reg("RCX", game)
        reg("RDX", guid if matching else guid + 1)
        run(RANGES["interaction"][0])
        accepted = state == 1 and matching and kind == 2 and not distance > 10.0 and gold >= 20
        events = queued()
        assert events == ([[0xAA, struct.pack("<Q", guid).hex()], [0x2D2, "b4040000"]] if accepted else [])
        assert get(game + 0x618, "Q")[0] == (0 if accepted else 1)
        assert get(game + 0x4F0, "I")[0] == gold - (20 if accepted else 0)
        assert get(game + 0xBC4, "I")[0] == (31 if accepted else 20)
        assert get(game + 0x7A0, "I")[0] == get(game + 0xB84, "I")[0] == int(accepted)
        assert context["choices"] == ([[1, 1]] if accepted else [])
        if accepted:
            # Even after returning to the running state, the consumed GUID is
            # absent: its second click cannot charge/remove/reward again.
            put(game + 0xC12, "B", 1)
            reg("RCX", game)
            reg("RDX", guid)
            run(RANGES["interaction"][0])
            assert queued() == events and len(context["choices"]) == 1
        interactions.append([state, matching, kind, bits(distance), gold, accepted, events])

    removal = []
    for auxiliary in ([], [11], [11, 12]):
        reset()
        pickup(guid)
        put(pickups, "QQQ", len(auxiliary), mem + 0x8000, len(auxiliary))
        for i, value in enumerate(auxiliary):
            put(mem + 0x8000 + i * 8, "Q", value)
        reg("RCX", game)
        reg("RDX", 0)
        run(RANGES["remove"][0])
        events = queued()
        assert events == [[0xAA, struct.pack("<Q", value).hex()] for value in [guid] + auxiliary]
        assert get(game + 0x618, "Q") == (0,)
        removal.append(events)

    poses = []
    for previous, current in itertools.product((None, 0, 1, 2, 3), (0, 1, 2, 3, 0xFFFFFFFF)):
        reset()
        reg("RDI", int(previous is not None))
        reg("RSI", previous or 0)
        reg("R8", current)
        context["stops"] = {0x1409DA5DC, 0x1409DAA70}
        run(0x1409DA537)
        motions = {(1, 0): 148, (0, 1): 146, (2, 1): 152, (1, 2): 150}
        expected = motions.get((previous, current), {0: 149, 1: 147, 2: 151}.get(current))
        actual = None if context["stopped"] == 0x1409DAA70 else reg("RSI") & 0xFFFF
        assert actual == expected, (previous, current, actual, expected)
        poses.append([previous, current, actual])

    walks = []
    for distance in distances + (f32(3.0000002),):
        reset()
        pickup(guid, distance=distance)
        reg("RBP", mem + 0x9000)
        put(mem + 0x9080, "Q", pickups)
        reg("XMM7", 0)
        reg("XMM10", bits(3.0))
        context["stops"] = {0x14594EEC7, 0x14594EF34}
        run(0x14594EEA0)
        admitted = context["stopped"] == 0x14594EF34
        assert admitted == (distance <= 3.0)
        walks.append([bits(distance), admitted])

    closed_fallbacks = []
    for owned_mask, count in itertools.product(range(8), (0, 147, 148, 149, 160)):
        reset()
        model, lookup, go = mem + 0xA000, mem + 0xB000, mem + 0xC000
        put(stack + 0x10090, "Q", model)
        put(stack + 0x10048, "Q", go)
        put(model + 0x48, "QQ", lookup, count)
        cpu.mem_write(lookup, bytes([0xFF]) * 320)
        owned = {146 + index for index in range(3) if owned_mask & (1 << index) and 146 + index < count}
        for animation in owned:
            put(lookup + animation * 2, "H", 0)
        reg("RSI", 147)
        context["stops"] = {0x1409DA787}
        run(0x1409DA5DC)
        expected = (147, False) if 147 in owned or 146 in owned else (
            (148, True) if 148 in owned else (0, False))
        actual = (reg("RBP") & 0xFFFF, bool(reg("RDI") & 0xFF))
        assert actual == expected, (owned_mask, count, actual, expected)
        closed_fallbacks.append([owned_mask, count, list(actual)])

    click_policy = []
    for enabled, hinted in itertools.product((0, 1, 2, 255), (0, 1, 255)):
        reset()
        put(game + 0xC03, "B", enabled)
        put(game + 0xC06, "B", hinted)
        reg("RSI", game)
        reg("R14", 2)
        context["stops"] = {0x14594F090, 0x14594EFB0, 0x14594F014}
        run(0x14594EFED)
        expected = 0x14594F090 if not enabled else (0x14594EFB0 if hinted else 0x14594F014)
        assert context["stopped"] == expected
        assert get(game + 0xC06, "B")[0] == (1 if enabled else hinted)
        click_policy.append([enabled, hinted, hex(expected)])

    groups = dict(descriptors=descriptors, interaction=interactions, removal=removal,
                  poses=poses, closed_fallbacks=closed_fallbacks, walk=walks, click_policy=click_policy)
    return dict(counts={name: len(rows) for name, rows in groups.items()},
                commitments={name: digest(encoded(rows).encode()) for name, rows in groups.items()},
                descriptor_fixtures=descriptors)


def source_checks():
    chest = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/chests.rs").read_text()
    visuals = (ROOT / "crates/azeroth-survivors-re/src/gameplay/visuals.rs").read_text()
    client = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/events.rs").read_text()
    attach = (ROOT / "crates/benilla-app/src/entities/attach/mod.rs").read_text()
    go = (ROOT / "crates/benilla-app/src/go_anim.rs").read_text()
    objects = (ROOT / "crates/benilla-app/src/net/objects.rs").read_text()
    update = (ROOT / "crates/benilla-app/src/net/objects/update.rs").read_text()
    rules = (ROOT / "crates/azeroth-survivors-re/src/treasure_chests/mod.rs").read_text()
    spawn = chest.split("fn spawn_chest_with_rng(", 1)[1].split("fn remove_entities(", 1)[0]
    for part in ("passive_tick::lightwell_object(", "entry: spawn.object_entry", "display: spawn.model_id",
                 "native_kind: u32::from(spawn.object_type)", "native_flags: 0", "self.counter,", "rng,"):
        assert part in spawn, part
    assert spawn.index("RunEvent::PickupObject(object)") < spawn.index("self.spawned.push((id, spawn))")
    assert "game.pickups" not in visuals and "fn cache_visual(" not in visuals
    assert "RunEvent::PickupObject(row)" in client and "SessionEvent::ObjectDestroyed(guid)" in client
    assert "crate::go_anim::GoAnim::default()" in attach and "VisualAttached" in attach
    assert "1 => Some(0x93)" in go and "active.set_repeat(RepeatAnimation::Never)" in go
    buy = rules.split("    fn buy<", 1)[1].split("/// Current world positions", 1)[0]
    assert buy.index("if *gold < self.price") < buy.index("let pickup = field.remove(index)")
    assert buy.index("let pickup = field.remove(index)") < buy.index("client_command(0x2d2, 0x4b4)")
    assert "GameObjectCustomAnim" not in chest and "GameObjectDespawnAnim" not in chest
    destroy = update.split("fn on_object_destroyed(", 1)[1].split("fn deactivate(", 1)[0]
    assert "sc.index.0.remove(&guid)" in destroy and "queue(super::tear_down)" in destroy
    teardown = objects.split("fn tear_down(", 1)[1].split("/// `SMSG_MONSTER_MOVE`", 1)[0]
    assert "ent.remove::<Guid>()" in teardown and "ent.insert(DespawnFade::default())" in teardown
    return "Cache constructor→PickupObject→ObjectCreate→ordinary GO attachment/state; native removal→ObjectDestroyed→Guid removal/fade; host cache rig removed."


def consumer_checks(pe, data):
    """Bind the necessary DestroyObject interface, stopping at generic ECS work."""
    import unicorn as u
    from unicorn import x86_const as x
    import capstone
    from capstone import x86_const as cx

    path = KEPT / "destroy-consumer.json"
    proof = json.loads(path.read_text())
    assert proof["target"]["sha256"] == SHA and proof["target_executed"] is False
    declared = {(a + pe.image_base, b + pe.image_base) for a, b, _ in pe.functions()}
    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        assert len(value) == count
        return value
    def span(row):
        a, b = int(row["va"], 16), int(row["end_exclusive"], 16)
        assert b - a == row["byte_count"]
        assert pe.rva_offset(a - pe.image_base) == int(row["file_offset"], 16)
        assert digest(raw(a, b - a)) == row["sha256"]
        return a, b
    for row in proof["owners"].values():
        assert span(row) in declared
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    md.detail = True
    def instructions(row):
        a, b = span(row)
        return list(md.disasm(raw(a, b - a), a))
    def references(row):
        return {i.address + i.size + op.mem.disp for i in instructions(row)
                for op in i.operands if op.type == cx.X86_OP_MEM and op.mem.base == cx.X86_REG_RIP}
    binding = proof["system_binding"]
    assert raw(int(binding["name_va"], 16), len(binding["name"])) == binding["name"].encode()
    registration_refs = references(proof["owners"]["registration"])
    assert {int(binding["name_va"], 16), int(binding["vtable_va"], 16)} <= registration_refs
    wrapper = int(proof["owners"]["system-run"]["va"], 16)
    assert struct.unpack("<Q", raw(int(binding["vtable_va"], 16) + binding["run_slot_offset"], 8))[0] == wrapper
    handler = int(proof["owners"]["destroy-handler"]["va"], 16)
    assert any(i.mnemonic == "call" and i.operands[0].type == cx.X86_OP_IMM and
               i.operands[0].imm == handler for i in instructions(proof["owners"]["system-run"]))
    for row in proof["typed_components"]:
        a, b = span(row["name_bytes"])
        assert raw(a, b - a) == row["name"].encode()
        a, b = span(row["type_id_bytes"])
        assert raw(a, b - a).hex() == row["type_id_hex"]
        registrar = next(owner for owner in proof["owners"].values() if owner["va"] == row["registration"])
        assert {int(row["name_bytes"]["va"], 16), a} <= references(registrar)
    for record in proof["rea"]:
        assert record["provider"]["id"] == "ghidra"
        assert record["evidence_id"].startswith("ev_") and len(record["analysis_profile_digest"]) == 64
        assert span(record["input"]) in declared
    assembly = ""
    for role, row in proof["selected_windows"].items():
        a, b = span(row)
        instructions = list(md.disasm(raw(a, b - a), a))
        assert sum(i.size for i in instructions) == b - a
        assembly += "# " + role + "\n" + "".join(
            f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip() + "\n"
            for i in instructions)
    assert assembly == (KEPT / "destroy-consumer.asm").read_text()
    assert digest(assembly.encode()) == proof["assembly_sha256"]

    cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    base = 0x72000000
    cpu.mem_map(base, 0x100000)
    mapped = set()
    stops = {0x140A75E50, 0x1410D88D0, 0x14116DA2E}
    def demand(_, access, address, count, value, unused):
        page = address & ~4095
        if page not in mapped:
            cpu.mem_map(page, 4096)
            cpu.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True
    def stop(_, address, count, unused):
        if address in stops:
            cpu.emu_stop()
    cpu.hook_add(u.UC_HOOK_MEM_UNMAPPED, demand)
    cpu.hook_add(u.UC_HOOK_CODE, stop)
    cases = []
    for marker, alive, generation in itertools.product((False, True), (False, True), (6, 7, 8)):
        world, table, fallback = base + 0x10000, base + 0x20000, base + 0x30000
        for address, size in ((world, 0x700), (table, 0x100), (fallback, 0x100)):
            cpu.mem_write(address, bytes(size))
        cpu.mem_write(world + 8, struct.pack("<QQ", table, 1))
        cpu.mem_write(table, struct.pack("<I", int(alive)))
        cpu.mem_write(table + 0x10, struct.pack("<I", generation))
        cpu.mem_write(base + 0xF0048, struct.pack("<Q", world))
        for register, value in (
            (x.UC_X86_REG_RAX, base + 0x40000 if marker else 0),
            (x.UC_X86_REG_RDX, world), (x.UC_X86_REG_RDI, 0), (x.UC_X86_REG_R14, 0),
            (x.UC_X86_REG_R13, fallback), (x.UC_X86_REG_RBX, 7),
            (x.UC_X86_REG_RSI, 0x7FFFFFFFF), (x.UC_X86_REG_RSP, base + 0xF0000),
            (x.UC_X86_REG_EFLAGS, 2),
        ):
            cpu.reg_write(register, value)
        # The component lookup result is a seam. Run the native presence/alive/
        # generation branch, stopping before component insertion/migration/hooks.
        cpu.emu_start(0x14116D740, 0, count=20000)
        actual = cpu.reg_read(x.UC_X86_REG_RIP)
        expected = (0x140A75E50 if marker else 0x1410D88D0) if alive and generation == 7 else 0x14116DA2E
        assert actual == expected
        cases.append(dict(marker_present=marker, entity_live=alive,
                          generation=generation, exit=hex(actual)))
    assert cases == proof["native_marker_branch_cases"]
    assert len(cases) == proof["marker_branch_case_count"] == 12
    return dict(case_count=len(cases), evidence_ref=path.relative_to(ROOT).as_posix(),
                sha256=digest(path.read_bytes()))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "This proof belongs only to 0.113.2's selected bytes"
    data = target_bytes(target)
    pe = load_script("cache_lifecycle_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    spans = []
    dependencies()
    import capstone
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    declared = {(a + pe.image_base, b + pe.image_base) for a, b, _ in pe.functions()}
    WORK.mkdir(parents=True, exist_ok=True)
    for role, (a, b) in RANGES.items():
        assert (a, b) in declared
        offset = pe.rva_offset(a - pe.image_base)
        raw = data[offset:offset + b - a]
        spans.append(dict(role=role, start=hex(a), end_exclusive=hex(b), file_offset=hex(offset),
                          byte_count=len(raw), sha256=digest(raw)))
        if args.prepare:
            (WORK / (role + ".bin")).write_bytes(raw)
            plan = dict(target=str((WORK / (role + ".bin")).relative_to(ROOT)),
                        output=str((WORK / ("rea-" + role)).relative_to(ROOT)), init_timeout=60, timeout=240,
                        open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(a)),
                        operations=[dict(name="analyze_function", arguments=dict(procedure=hex(a)))])
            (WORK / (role + "-plan.json")).write_text(encoded(plan))
    if args.prepare:
        print("Prepared current #49 Ghidra inputs; no application execution")
        return
    result = dict(target_version=target["version"], target_sha256=SHA, target_executed=False,
                  native_ranges=spans, native_replay=replay(pe, data), source_checks=source_checks(),
                  destroy_consumer=consumer_checks(pe, data),
                  seams=SEAMS, limits=[
                      "Original instructions run only in synthetic Unicorn fixtures; no compiled Rust, Bevy application or game process.",
                      "Field-map storage, packet serialization, allocation/copy/free and choice construction are explicit existing-engine seams; callers and packet queue stores execute.",
                      "Sine/cosine use host sinf/cosf outputs; Windows CRT bit parity, MPQ model/render/audio/input and visual removal timing remain unverified.",
                      "Current purchase emits DestroyObject then sound1204; no separate open/custom/despawn command or animation-duration delay was found in this complete interaction/removal route.",
                      "Pose selection covers the current inlined GO state mapping; complete engine animation scheduling and GPU behavior are not claimed."])
    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + count]
    table = 0x14730EC84
    assert table + struct.unpack("<i", raw(table + 8, 4))[0] == 0x145945143
    assert raw(0x145945153, 10) == bytes.fromhex("c785800000002d230000")
    assert raw(0x14594515D, 10) == bytes.fromhex("49bf030100000000803f")
    assert 0x14594587C + struct.unpack("<i", raw(0x145945878, 4))[0] == RANGES["create-go"][0]
    result["cache_input_contract"] = dict(entry=9005, display=259, scale_bits=bits(1.0),
        native_kind=3, flags=0, selector_context="Actual AS pickup kind2; no arbitrary enum-input guard inferred.",
        byte_ranges=[dict(start=hex(a), byte_count=n, hex=raw(a,n).hex(), sha256=digest(raw(a,n)))
                     for a,n in [(table,28),(0x145945143,36),(0x14594584B,49)]])
    result["supporting_native_ranges"] = [dict(role=role, start=hex(a), byte_count=b-a,
        hex=raw(a,b-a).hex(), sha256=digest(raw(a,b-a))) for role,(a,b) in SNIPPETS.items()]
    if args.collect:
        out = WORK / "curated"
        out.mkdir(parents=True, exist_ok=True)
        assembly = []
        rea = []
        for span in spans:
            role = span["role"]
            path = WORK / ("rea-purchase-v2" if role == "purchase" else "rea-" + role) / "003-analyze_function.json"
            record = json.loads(path.read_text())["response"]["result"]["structuredContent"]
            assert record["subject"]["digest"]["sha256"] == span["sha256"]
            assert record["provider"]["id"] == "ghidra"
            rea.append(dict(role=role, evidence_id=record["evidence_id"], input_sha256=span["sha256"],
                            analysis_profile_digest=record["analysis_profile"]["digest"]))
            a, b = int(span["start"], 16), int(span["end_exclusive"], 16)
            # Keep only the relevant GO selector window; full owner identity is
            # committed above and the complete REA dossier remains in runtime/.
            if role == "go-drive":
                a, b = 0x1409DA522, 0x1409DA787
            offset = pe.rva_offset(a - pe.image_base)
            assembly.append("; " + role)
            assembly.extend(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                            for i in md.disasm(data[offset:offset + b - a], a))
        for role,(a,b) in SNIPPETS.items():
            assembly.append("; " + role)
            assembly.extend(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                            for i in md.disasm(raw(a,b-a),a))
        result["rea"] = rea
        (out / "selected-native.asm").write_text("\n".join(assembly) + "\n")
        result["assembly_sha256"] = digest((out / "selected-native.asm").read_bytes())
        (out / "manifest.json").write_text(encoded(result))
        print("Staged #49 curated evidence:", result["native_replay"]["counts"],
              "and", result["destroy_consumer"]["case_count"], "receiver branch cases")
    else:
        retained = json.loads((KEPT / "manifest.json").read_text())
        for key in result:
            assert result[key] == retained[key], key
        assert digest((KEPT / "selected-native.asm").read_bytes()) == retained["assembly_sha256"]
        print("Current #49 native/source checks passed:", result["native_replay"]["counts"],
              "and", result["destroy_consumer"]["case_count"], "receiver branch cases")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Replay current glow admission, getter and setter with synthetic save memory.

Only the recovered original instruction ranges execute; memcmp is a declared
synthetic CRT seam. This neither compiles nor executes a game/client/server.
"""
import argparse
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.121.0/weapon-glow.json"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def retained(row):
    path = project_path(row["path"])
    assert sha(path.read_bytes()) == row["sha256"]
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"]
    image = target_bytes(target)
    pe = load_script("glow_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        at = pe.rva_offset(int(row["virtual_address"], 16) - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and sha(raw) == row["sha256"]
        if "instruction_count" in row:
            instructions = list(decoder.disasm(raw, int(row["virtual_address"], 16)))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
    for query in proof["queries"]:
        raw = json.loads(retained(query["result"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for binding in proof["retained_construction_manifests"]:
        manifest = json.loads((ROOT / binding["path"]).read_text())
        assert manifest["target"] == proof["target"]
        if "procedures" in binding:
            assert set(binding["procedures"]) <= {row["procedure"] for row in manifest["queries"]}
        else:
            assert binding["constructor_selector"] in {row["role"] for row in manifest["native_selectors"]}
    for row in proof["source_bindings"]:
        retained(row)
    assert proof["application_executed"] is False


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    for address, size in ((0x145ab4000, 0x1000), (0x145aa5000, 0x1000),
                          (0x145bd0000, 0x1000), (0x1402c0000, 0x1000),
                          (0x145a9a000, 0x1000),
                          (0x145feb000, 0x1000), (0x146fc8000, 0x1000),
                          (0x22000000, 0x20000)):
        uc.mem_map(address, size)
    for row in proof["native_ranges"] + proof["native_data"]:
        if row["role"] in {"glow-unlock", "glow-getter", "glow-setter", "achievement-keys",
                           "world-weapon-publication", "preview-weapon-publication"}:
            uc.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    uc.mem_write(0x145febc27, b"\xc3")
    uc.mem_write(0x145a9a130, b"\xc3")
    stop = 0x2201fff0
    uc.mem_write(stop, b"\xcc")
    state = {"steps": 0}
    cases = []
    save, strings, glows, stack = 0x22000000, 0x22001000, 0x22004000, 0x22018000

    def ret(value):
        uc.reg_write(reg.UC_X86_REG_RAX, value & 0xffffffffffffffff)
        sp = uc.reg_read(reg.UC_X86_REG_RSP)
        uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(sp, 8))[0])
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(_uc, address, _size, _context):
        state["steps"] += 1
        if address == stop:
            uc.emu_stop()
        elif state.get("gate_mode") == "world" and address == 0x145bd0457:
            uc.emu_stop()
        elif state.get("gate_mode") == "world" and address == 0x145a9a130:
            state["emitted"] = (uc.reg_read(reg.UC_X86_REG_RDX), uc.reg_read(reg.UC_X86_REG_R8))
            assert uc.reg_read(reg.UC_X86_REG_RCX) == 0x22001000
            uc.emu_stop()
        elif state.get("gate_mode") == "preview" and address == 0x1402c07d4:
            uc.emu_stop()
        elif address == 0x145febc27:
            count = uc.reg_read(reg.UC_X86_REG_R8)
            assert count <= 32
            a = bytes(uc.mem_read(uc.reg_read(reg.UC_X86_REG_RCX), count))
            b = bytes(uc.mem_read(uc.reg_read(reg.UC_X86_REG_RDX), count))
            ret((a > b) - (a < b))

    uc.hook_add(UC_HOOK_CODE, hook)

    def setup(achievements, rows=()):
        uc.mem_write(save, bytes(0x300))
        uc.mem_write(save + 0xb0, struct.pack("<QQ", strings, len(achievements)))
        for i, text in enumerate(sorted(achievements)):
            raw = text.encode()
            pointer = strings + 0x100 + i * 0x100
            uc.mem_write(pointer, raw)
            uc.mem_write(strings + i * 24, struct.pack("<QQQ", len(raw), pointer, len(raw)))
        uc.mem_write(save + 0x1e0, struct.pack("<QQQ", 16, glows, len(rows)))
        for i, (hero_class, enchant) in enumerate(rows):
            uc.mem_write(glows + i * 8, struct.pack("<B3xI", hero_class, enchant))

    def call(address, hero_class, enchant=0):
        uc.mem_write(stack, struct.pack("<Q", stop))
        uc.reg_write(reg.UC_X86_REG_RSP, stack)
        uc.reg_write(reg.UC_X86_REG_RCX, save)
        uc.reg_write(reg.UC_X86_REG_RDX, hero_class)
        uc.reg_write(reg.UC_X86_REG_R8, enchant)
        uc.emu_start(address, 0, count=10000)
        assert uc.reg_read(reg.UC_X86_REG_RIP) == stop
        return uc.reg_read(reg.UC_X86_REG_RAX) & 0xffffffff

    def allowed(enchant, achievements):
        return (enchant in (0, 1894) or enchant == 1900 and "heroic:naxx5" in achievements
                or enchant == 803 and "radiantarmory" in achievements)

    for achievements in ([], ["heroic:naxx5"], ["radiantarmory"],
                         ["heroic:naxx5", "radiantarmory"],
                         ["a", "heroic:naxx5!", "radiantarmor", "z"],
                         ["a", "heroic:naxx5", "radiantarmory", "z"]):
        for enchant in (0, 1894, 1900, 803, 1, 1893, 1901, 0xffffffff):
            setup(achievements)
            actual = call(0x145ab4db0, enchant) & 0xff
            assert bool(actual) == allowed(enchant, achievements)
            for rows in ([], [(1, enchant)], [(2, 803), (1, enchant), (1, 1900)]):
                setup(achievements, rows)
                chosen = call(0x145aa57f0, 1)
                saved = next((value for hero_class, value in rows if hero_class == 1), None)
                expected = saved if saved is not None and allowed(saved, achievements) else 1894
                assert chosen == expected
            rows = [(2, 1894), (1, 803), (3, 0), (1, 1900)]
            setup(achievements, rows)
            accepted = call(0x145ab47f0, 1, enchant) & 0xff
            count = struct.unpack("<Q", uc.mem_read(save + 0x1f0, 8))[0]
            result = [struct.unpack("<B3xI", uc.mem_read(glows + i * 8, 8)) for i in range(count)]
            expected = [r for r in rows if r[0] != 1] + [(1, enchant)] if allowed(enchant, achievements) else rows
            assert bool(accepted) == allowed(enchant, achievements) and result == expected
            cases.append({"achievements": achievements, "enchant": enchant,
                          "allowed": bool(actual), "selected": chosen, "stored": result})
    admission_count = len(cases)
    world_count = preview_count = 0
    for enchant in (0, 1894, 1900, 803, 123, 0xffffffff):
        for displayed in (0, 101840):
            for stars in (0, 4, 5, 9):
                for slot in (0, 14, 15, 16, 17, 18, 255):
                    expected = enchant if 15 <= slot <= 17 and displayed and (enchant != 1894 or stars >= 5) else 0
                    uc.mem_write(0x22008020, struct.pack("<Q", save))
                    uc.mem_write(save + 0x35c + slot, bytes([stars]))
                    uc.reg_write(reg.UC_X86_REG_RBP, 0x22008000)
                    uc.reg_write(reg.UC_X86_REG_RSP, stack)
                    uc.reg_write(reg.UC_X86_REG_RBX, enchant)
                    uc.reg_write(reg.UC_X86_REG_R12, displayed)
                    uc.reg_write(reg.UC_X86_REG_R13, slot * 4)
                    uc.reg_write(reg.UC_X86_REG_R14, 0x22001000)
                    uc.reg_write(reg.UC_X86_REG_R15, slot)
                    state.update(gate_mode="world", emitted=None)
                    uc.emu_start(0x145bd049d, 0, count=100)
                    assert state["emitted"] == ((0x105 + slot * 12, expected) if expected else None), (
                        enchant, slot, displayed, stars, state["emitted"], expected)
                    world_count += 1
                    cases.append({"kind": "world", "slot": slot, "displayed": displayed,
                                  "enchant": enchant, "stars": stars, "emitted": state["emitted"]})
                uc.reg_write(reg.UC_X86_REG_RSP, 0x22010000)
                uc.reg_write(reg.UC_X86_REG_RBP, enchant)
                uc.mem_write(0x22010048, struct.pack("<I", displayed))
                uc.mem_write(0x2201015f, bytes([stars]))
                state["gate_mode"] = "preview"
                uc.emu_start(0x1402c07b2, 0, count=100)
                expected = enchant if displayed and (enchant != 1894 or stars >= 5) else 0
                assert uc.reg_read(reg.UC_X86_REG_RBX) == expected
                preview_count += 1
                cases.append({"kind": "preview", "displayed": displayed,
                              "enchant": enchant, "stars": stars, "emitted": expected})
    return {"admission_cases": admission_count, "getter_cases": admission_count * 3,
            "setter_cases": admission_count, "world_gate_cases": world_count,
            "preview_gate_cases": preview_count, "original_instruction_steps": state["steps"],
            "cases_sha256": sha(json.dumps(cases, sort_keys=True).encode()),
            "synthetic_seams": ["save memory and sorted strings", "CRT memcmp", "preallocated glow vector"],
            "application_executed": False, "compilation": "not_run", "parity": "unverified"}


def replay_priority(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    for address in (0x1408fc000, 0x14078b000, 0x1485c6000, 0x1463c1000,
                    0x145e88000, 0x145ccf000, 0x145e6f000):
        uc.mem_map(address, 0x1000)
    uc.mem_map(0x22000000, 0x20000)
    for row in proof["native_ranges"] + proof["native_data"]:
        if row["role"] in {"effective-visual", "priority-setter", "priority-initial-byte", "held-slot-table"}:
            uc.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    for address in (0x145e88010, 0x145ccf530, 0x145e6f110):
        uc.mem_write(address, b"\xc3")
    stop, stack = 0x2201fff0, 0x22018000
    uc.mem_write(stop, b"\xcc")
    state = {"steps": 0}
    cases = []

    def ret(value, second=None):
        uc.reg_write(reg.UC_X86_REG_RAX, value)
        if second is not None:
            uc.reg_write(reg.UC_X86_REG_RDX, second & 0xffffffff)
        sp = uc.reg_read(reg.UC_X86_REG_RSP)
        uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(sp, 8))[0])
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(_uc, address, _size, _context):
        state["steps"] += 1
        if address == stop:
            uc.emu_stop()
        elif address == 0x145e88010:
            assert uc.reg_read(reg.UC_X86_REG_RCX) == 0x22006000
            ret(int(state["base_exists"]))
        elif address == 0x145ccf530:
            assert uc.reg_read(reg.UC_X86_REG_RCX) == 0x22005000
            assert uc.reg_read(reg.UC_X86_REG_RDX) == 15
            index = uc.reg_read(reg.UC_X86_REG_R8)
            assert index < len(state["enchants"])
            ret(1, state["enchants"][index])
        elif address == 0x145e6f110:
            assert uc.reg_read(reg.UC_X86_REG_RCX) == 0x22007000
            enchant = uc.reg_read(reg.UC_X86_REG_RDX)
            visual = {1: 61, 7: 25}.get(enchant)
            ret(int(visual is not None), visual or 0)

    uc.hook_add(UC_HOOK_CODE, hook)

    def call(address, first, second=0, third=0, fourth=0):
        uc.mem_write(stack, struct.pack("<Q", stop))
        uc.reg_write(reg.UC_X86_REG_RSP, stack)
        for register, value in ((reg.UC_X86_REG_RCX, first), (reg.UC_X86_REG_RDX, second),
                                (reg.UC_X86_REG_R8, third), (reg.UC_X86_REG_R9, fourth)):
            uc.reg_write(register, value & 0xffffffffffffffff)
        uc.emu_start(address, 0, count=10000)
        assert uc.reg_read(reg.UC_X86_REG_RIP) == stop
        return uc.reg_read(reg.UC_X86_REG_RAX) & 0xffffffff

    for prefer in (False, True):
        call(0x14078b7d0, int(prefer))
        assert bytes(uc.mem_read(0x1485c6d3c, 1)) == bytes([int(prefer)])
        for base, exists in ((0, False), (0, True), (25, True), (999, False), (-1, False)):
            for have_catalog in (False, True):
                for enchants in ([], [1], [999], [999, 7], [1, 7]):
                    state.update(base_exists=exists, enchants=enchants)
                    iterator = bytearray(0x50)
                    struct.pack_into("<QQ", iterator, 0x20, 0x22005000, 0x22009000)
                    iterator[0x31] = len(enchants)
                    uc.mem_write(0x22008000, bytes(iterator))
                    uc.mem_write(0x22009000, struct.pack("<Q", 0))
                    actual = call(0x1408fc4b0, 0x22006000,
                                  0x22007000 if have_catalog else 0, base & 0xffffffff, 0x22008000)
                    expected = base if exists else 0
                    if (prefer or not exists) and have_catalog:
                        expected = next(({1: 61, 7: 25}[e] for e in enchants if e in (1, 7)), expected)
                    assert actual == expected & 0xffffffff, (prefer, base, exists, have_catalog, enchants, actual)
                    cases.append({"prefer_enchants": prefer, "base": base, "base_exists": exists,
                                  "have_enchant_catalog": have_catalog, "enchants": enchants, "visual": actual})
    return {"cases": len(cases), "original_instruction_steps": state["steps"],
            "cases_sha256": sha(json.dumps(cases, sort_keys=True).encode()),
            "synthetic_seams": ["visual catalog lookup", "ObjectFields enchant lookup", "EnchantCatalog visual lookup"],
            "application_executed": False, "compilation": "not_run", "parity": "unverified"}


def current_unholy():
    """Replay the current gate with synthetic earned-key storage and memcmp."""
    from native_terminal import NativeReplay
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.127.0/party-achievements-insane.json').read_text())
    target = latest_target(verify=True)
    assert all(target[key] == value for key, value in proof['target'].items())
    image = target_bytes(target)
    pe = load_script('unholy_PE', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['ranges']:
        offset = pe.rva_offset(int(row['start'], 16) - pe.image_base)
        raw = image[offset:offset + int(row['end_exclusive'], 16) - int(row['start'], 16)]
        assert sha(raw) == row['sha256'] and raw == bytes.fromhex(row['bytes_hex'])
    for query in proof['queries']:
        result = json.loads(retained(query['result']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
    replay = NativeReplay(image, pe)
    reg = replay.registers
    def seam(address):
        if address != 0x146061721:
            return False
        count = replay.machine.reg_read(reg.UC_X86_REG_R8)
        left = bytes(replay.machine.mem_read(replay.machine.reg_read(reg.UC_X86_REG_RCX), count))
        right = bytes(replay.machine.mem_read(replay.machine.reg_read(reg.UC_X86_REG_RDX), count))
        replay.machine.reg_write(reg.UC_X86_REG_RAX, ((left > right) - (left < right)) & 0xffffffff)
        replay.return_seam()
        return True
    replay.seam = seam
    required = {803: 'radiantarmory', 1899: 'coop:insane', 1900: 'heroic:naxx5'}
    populations = [list(subset) for size in range(4)
                   for subset in itertools.combinations(sorted(required.values()), size)]
    populations += [['coop:insan', 'coop:insanex', 'unrelated'],
                    ['coop:insane', 'coop:insanex', 'unrelated']]
    cases = 0
    for keys in populations:
        for enchant in [0, 803, 1894, 1899, 1900, 1, 1898, 1901, 0xffffffff]:
            replay.reset('current-glow-gate', [(0x145b1f0c0, 0x145b1f209)], [replay.done])
            save, entries, strings = replay.mem + 0x1000, replay.mem + 0x4000, replay.mem + 0x8000
            replay.put(save + 0xb0, '<QQ', entries, len(keys))
            cursor = strings
            for index, key in enumerate(sorted(keys)):
                raw = key.encode()
                replay.machine.mem_write(cursor, raw)
                replay.put(entries + index * 24, '<QQQ', len(raw), cursor, len(raw))
                cursor += len(raw) + 16
            replay.machine.reg_write(reg.UC_X86_REG_RCX, save)
            replay.machine.reg_write(reg.UC_X86_REG_EDX, enchant)
            replay.run(0x145b1f0c0)
            actual = replay.machine.reg_read(reg.UC_X86_REG_EAX) & 0xff
            expected = enchant in (0, 1894) or required.get(enchant) in keys
            assert bool(actual) == expected, (keys, enchant, actual)
            cases += 1
    sources = {
        'armory_cosmetics.rs': ['1899 => achieved("coop:insane")'],
        'save/weapon_glow.rs': ['0 | 803 | 1894 | 1899 | 1900'],
        'armory.rs': ['(1899, "Unholy Weapon")', 'armory.glow_unholy_locked'],
    }
    for name, fragments in sources.items():
        source = (ROOT / 'crates/azeroth-survivors-re/src' / name).read_text()
        for fragment in fragments:
            assert fragment in source, (name, fragment)
    return dict(target=target['version'], native_gate_cases=cases,
                instruction_hook_steps=replay.instructions,
                source_paths_checked=len(sources), compilation=False,
                game_or_service_execution=False, parity_verified=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--current-unholy', action='store_true')
    arguments = parser.parse_args()
    if arguments.current_unholy:
        print(json.dumps(current_unholy(), indent=2))
        return
    proof = json.loads(MANIFEST.read_text())
    verify(proof)
    result = replay(proof)
    result["visual_priority"] = replay_priority(proof)
    result["source_status"] = proof["source_status"]
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

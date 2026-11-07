#!/usr/bin/env python3
"""Replay current Hero/State/private-reward encoding and the Heroic admission gate."""
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/coop-heroic-wire/manifest.json"


def word(value):
    return struct.pack("<I", value)


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def sized(value):
    return word(len(value)) + value


def replay(proof, metadata_only=False):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    rows = {row["role"]: row for row in proof["native_ranges"] + proof["native_data"]}
    for row in rows.values():
        address = int(row["virtual_address"], 16)
        for page in range(address & ~4095, (address + row["byte_count"] + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, bytes.fromhex(row["bytes_hex"]))
    machine.mem_map(0x145e40000, 0x20000)
    writers = {0x145e4ad30: 1, 0x145e4aed0: 4, 0x145e4af30: 8,
               0x145e4ad70: "float", 0x145e4add0: "bytes"}
    for address in writers:
        machine.mem_write(address, b"\xc3")
    memory, stack = 0x22000000, 0x23000000
    machine.mem_map(memory, 0x10000)
    machine.mem_map(stack, 0x10000)
    output = bytearray()
    steps, stop = 0, 0x145afa80c

    def hook(uc, address, _size, _context):
        nonlocal steps
        if address == stop:
            uc.emu_stop()
            return
        elif address in writers:
            kind = writers[address]
            value = uc.reg_read(reg.UC_X86_REG_RDX)
            if kind == "bytes":
                length = uc.reg_read(reg.UC_X86_REG_R8)
                output.extend(word(length))
                if length:
                    output.extend(uc.mem_read(value, length))
            elif kind == "float":
                output.extend(word(uc.reg_read(reg.UC_X86_REG_XMM1) & 0xffffffff))
            else:
                output.extend((value & ((1 << (8 * kind)) - 1)).to_bytes(kind, "little"))
            uc.reg_write(reg.UC_X86_REG_RAX, uc.reg_read(reg.UC_X86_REG_RCX))
        elif address not in (0x145b3574b, 0x145b35787):
            # Explicit synthetic writer RETs and stop destinations are not
            # counted as executed original instructions.
            steps += 1
    machine.hook_add(UC_HOOK_CODE, hook)

    def put(offset, value, form="I"):
        machine.mem_write(memory + offset, struct.pack("<" + form, value))

    def reset():
        machine.mem_write(memory, bytes(0x4000))
        machine.mem_write(stack, bytes(0x10000))
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x8000)
        machine.reg_write(reg.UC_X86_REG_RBP, stack + 0x8100)
        machine.reg_write(reg.UC_X86_REG_RDI, memory)
        output.clear()

    def run(address):
        machine.emu_start(address, 0x145afa80d, count=10000)
        return bytes(output)

    fixtures = []
    for rich in (False, True):
        reset()
        ids = list(range(1, 20)) if rich else [0] * 19
        looks = [None if n % 3 == 0 else (0 if n % 3 == 1 else 1200 + n) for n in range(19)] if rich else [None] * 19
        stars = list(range(19)) if rich else [0] * 19
        pity = [(1001, 255), (1002, 40), (1001, 0)] if rich else []
        unlocks = [0, 1, 2, 3, 4, 5, 255, 5, 4, 3, 2, 1] if rich else [0] * 12
        glow, talents = (1900, b"x,y") if rich else (1894, b"")
        put(8, memory + 0x1000, "Q"); put(0x10, 1, "Q")
        machine.mem_write(memory + 0x1000, b"A")
        put(0x1b8, 0x800000, "Q"); put(0x217, 8, "B"); put(0x218, 1, "B")
        for n, value in enumerate(ids): put(0x1c0 + n * 4, value)
        for n, value in enumerate(looks):
            put(0xe8 + n * 8, int(value is not None))
            put(0xec + n * 8, value or 0)
        machine.mem_write(memory + 0x21f, bytes(stars))
        put(0x20, memory + 0x1800, "Q"); put(0x28, len(pity), "Q")
        for n, (item, count) in enumerate(pity):
            put(0x1800 + n * 8, item); put(0x1804 + n * 8, count, "B")
        put(0x38, memory + 0x2000, "Q"); put(0x40, len(unlocks), "Q")
        machine.mem_write(memory + 0x2000, bytes(unlocks))
        put(0x20c, glow)
        put(0x50, memory + 0x2200, "Q"); put(0x58, len(talents), "Q")
        machine.mem_write(memory + 0x2200, talents)
        put(0x188, 255, "B"); put(0x198, 255, "B")
        put(0x78, 0xffffffffffffffff, "Q"); put(0x232, 1, "B")
        expected = bytearray(b"\x04" + struct.pack("<Q", 0x800000) + sized(b"A") + bytes([8, 1, 0]) + bytes(5))
        expected.extend(b"".join(word(value) for value in ids))
        expected.extend(b"".join(word(0xffffffff if value is None else value) for value in looks))
        expected.extend(bytes(stars) + word(len(pity)))
        expected.extend(b"".join(word(item) + bytes([count]) for item, count in pity))
        expected.extend(sized(bytes(unlocks)) + word(glow) + sized(talents))
        # Perks, skip/opening, keen, absent companions, leash/paws, co-op luck,
        # options, absent roster profile, achievement points, unlock and locale.
        expected.extend(bytes(8 + 2 + 4 + 5 + 5 + 2 + 4 + 3 + 1 + 4) + b"\x01" + word(0))
        actual = run(0x145af9b28)
        assert actual == expected, (rich, actual.hex(), expected.hex())
        fixtures.append({"kind": "hero", "rich": rich, "wire_hex": actual.hex()})

    reset()
    put(0xa0, 0x3f800000); put(0xcb, 2, "B"); put(0xc8, 1, "B")
    put(0xa4, 3); put(0xc9, 1, "B")
    for n, value in enumerate(range(4, 9)): put(0xa8 + n * 4, value)
    put(0xcc, 5, "B"); put(0xbc, 17)
    put(0xc0, 0x3fc00000); put(0xc4, 0x40000000)
    put(0xcd, 4, "B"); put(0xce, 6, "B"); put(0xcf, 8, "B")
    put(0x68, 0xffffffffffffffff, "Q")
    actual = run(0x145af973e)
    expected = (b"\x0f" + word(0x3f800000) + b"\x02\x01" + word(3) + b"\x01"
                + b"".join(word(n) for n in range(4, 9)) + b"\x05" + word(17)
                + word(0x3fc00000) + word(0x40000000) + b"\x04\x06\x00\x08"
                + word(0) * 4 + b"\x00")
    assert actual == expected
    fixtures.append({"kind": "state", "wire_hex": actual.hex()})
    put(0x68, 1, "Q"); put(0x70, memory + 0x1000, "Q"); put(0x78, 1, "Q")
    put(0x1000, 0x11223344); put(0x1004, 8, "B")
    put(0x1005, 254, "B"); put(0x1006, 6, "B")
    put(0x98, 77); put(0x9c, 1, "B")
    output.clear()
    machine.reg_write(reg.UC_X86_REG_RDI, memory)
    machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x8000)
    actual = run(0x145af973e)
    expected = expected[:-1] + b"\x01" + word(1) + b"\x08" + word(0x11223344) + b"\xfe\x06" + word(77) + b"\x01" + word(0)
    assert actual == expected
    fixtures.append({"kind": "state-party", "wire_hex": actual.hex()})
    if metadata_only:
        return {"wire_fixtures": fixtures, "original_instruction_steps": steps,
                "scope": "Hero4 and State15/party member metadata only"}
    for marks in (0, 0x3f800000, 0x7fc01234, 0x80000000):
        reset()
        missed = [17, 18, 17]
        put(0x20, marks); put(0x10, memory + 0x1000, "Q"); put(0x18, len(missed), "Q")
        for n, value in enumerate(missed): put(0x1000 + n * 4, value)
        actual = run(0x145afa4e9)
        assert actual == b"\x14" + word(marks) + word(3) + b"".join(map(word, missed))
        fixtures.append({"kind": "marks-pity", "marks_bits": marks, "wire_hex": actual.hex()})

    collector_cases = 0
    for allowed in ([1], list(range(1, 6)), list(range(1, 18)), list(range(1, 35))):
        for limit in (0, 1, 3, 16):
            reset()
            incoming = [99, 1, 1, 0, 2, 35, 17, 34] * 5
            # In-place filter iterator and borrowed catalog vector; this
            # collector has no allocator, descriptor or other external calls.
            data, catalog, catalog_data, out = memory + 0x1000, memory + 0x2000, memory + 0x2100, memory + 0x3000
            machine.mem_write(data, b"".join(map(word, incoming)))
            machine.mem_write(catalog_data, b"".join(map(word, allowed)))
            machine.mem_write(catalog, struct.pack("<QQQ", len(allowed), catalog_data, len(allowed)))
            machine.mem_write(memory, struct.pack("<QQQQQQ", data, data, len(incoming),
                                                data + len(incoming) * 4, catalog, limit))
            machine.reg_write(reg.UC_X86_REG_RCX, out)
            machine.reg_write(reg.UC_X86_REG_RDX, memory)
            stop = 0x145b615ec
            machine.emu_start(0x145b614a0, stop + 1, count=10000)
            count = struct.unpack("<Q", machine.mem_read(out + 16, 8))[0]
            actual = list(struct.unpack("<" + "I" * count, machine.mem_read(data, count * 4)))
            assert actual == [item for item in incoming if item in allowed][:limit]
            collector_cases += 1
    for count in range(256):
        reset()
        machine.reg_write(reg.UC_X86_REG_RDI, count)
        machine.reg_write(reg.UC_X86_REG_RSI, 1001)
        machine.reg_write(reg.UC_X86_REG_RAX, memory + 0x1000)
        stop = 0x145c78998
        machine.emu_start(0x145c78984, stop, count=100)
        assert struct.unpack("<IB", machine.mem_read(memory + 0x1000, 5)) == (1001, min(count, 40))
    set_cases = 0
    for tier in range(6):
        for native_state in range(3):
            reset()
            machine.reg_write(reg.UC_X86_REG_RAX, tier)
            machine.reg_write(reg.UC_X86_REG_RDX, native_state)
            stop = 0x145bbadf9
            machine.emu_start(0x145bbadd1, stop, count=100)
            expected = ((tier + 1) << 48) if native_state != 2 else 0
            assert machine.reg_read(reg.UC_X86_REG_R15) == expected
            machine.reg_write(reg.UC_X86_REG_RAX, tier)
            machine.reg_write(reg.UC_X86_REG_RDX, native_state)
            machine.reg_write(reg.UC_X86_REG_RBX, 1 << 48)
            machine.reg_write(reg.UC_X86_REG_R13, 255 << 48)
            stop = 0x145c69499
            machine.emu_start(0x145c6947c, stop, count=100)
            assert machine.reg_read(reg.UC_X86_REG_R13) == expected
            set_cases += 2
    for rank in range(256):
        reset()
        put(0x36f, rank, "B")
        machine.reg_write(reg.UC_X86_REG_R12, memory)
        machine.reg_write(reg.UC_X86_REG_R15, memory + 0x1000)
        stop = 0x145bc29ef
        machine.emu_start(0x145bc29b6, stop, count=100)
        assert bytes(machine.mem_read(memory + 0x1034, 1)) == bytes([rank >= 3])
    scalar_cases = 0
    float_bits = (0, 0x80000000, 0x3f800000, 0xbf800000, 0x43c80000,
                  0x457a1000, 0x7fc01234, 0x7f800000, 0xff800000)
    for left in float_bits:
        for right in float_bits:
            reset()
            rank, stars, active = (0, 5, 255)[scalar_cases % 3], (255, 5, 0)[scalar_cases % 3], (0, 6, 255)[scalar_cases % 3]
            put(0xc4, rank, "B"); put(0xc5, stars, "B"); put(0xc6, active, "B")
            put(0xb4, 0xffffffff); put(0xb8, left); put(0xbc, right)
            machine.reg_write(reg.UC_X86_REG_R15, memory)
            machine.reg_write(reg.UC_X86_REG_RDX, 3)
            stop = 0x145b4aaf2
            machine.emu_start(0x145b4a9dd, stop, count=1000)
            bp = stack + 0x8100
            assert struct.unpack("<I", machine.mem_read(bp + 0x64, 4))[0] == 3
            def clamped(raw, cap):
                value = struct.unpack("<f", word(raw))[0]
                # SSE MAXSS(0,x) retains x's negative zero.
                return 0 if raw & 0x7fffffff >= 0x7f800000 else (
                    0 if value < 0 else bits(min(value, cap)))
            assert struct.unpack("<II", machine.mem_read(bp + 0x68, 8)) == (clamped(left, 4000.0), clamped(right, 400.0))
            assert bytes(machine.mem_read(bp + 0x74, 3)) == bytes([min(rank, 5), min(stars, 5), min(active, 6)])
            scalar_cases += 1
    reward_rank_cases = 0
    for rank in range(256):
        for saved_cap in range(6):
            reset()
            machine.mem_write(stack + 0x8100 + 0x134, word(rank | (5 << 8) | (6 << 16) | (8 << 24)))
            machine.reg_write(reg.UC_X86_REG_RAX, saved_cap)
            stop = 0x145b0f52e
            machine.emu_start(0x145b0f51f, stop, count=100)
            assert machine.reg_read(reg.UC_X86_REG_RSI) & 255 == min(rank, saved_cap)
            reward_rank_cases += 1
    swap_cases = 0
    for seed in (0, 1, 17, 255):
        reset()
        game, hero = memory + 0x4000, memory + 0x6000
        game_bytes = bytes((index * 17 + seed) & 255 for index in range(0x2000))
        hero_bytes = bytes((index * 29 + 255 - seed) & 255 for index in range(0x2000))
        machine.mem_write(game, game_bytes)
        machine.mem_write(hero, hero_bytes)
        machine.reg_write(reg.UC_X86_REG_RCX, game)
        machine.reg_write(reg.UC_X86_REG_RDX, hero)
        stop = 0x145be82b6
        machine.emu_start(0x145be6f10, stop, count=1000)
        assert bytes(machine.mem_read(game + 0xcd8, 4)) == game_bytes[0xcd8:0xcdc]
        assert bytes(machine.mem_read(game + 0xc9c, 4)) == hero_bytes[0x99c:0x9a0]
        assert bytes(machine.mem_read(hero + 0x99c, 4)) == game_bytes[0xc9c:0xca0]
        machine.emu_start(0x145be6f10, stop, count=1000)
        assert bytes(machine.mem_read(game, 0x2000)) == game_bytes
        assert bytes(machine.mem_read(hero, 0x2000)) == hero_bytes
        swap_cases += 1
    mark_projection_cases = 0
    for total, maximum in ((0, 0), (bits(13.25), bits(7.5)), (bits(4000.0), bits(400.0)), (0x7fc01234, 0x80000000)):
        reset()
        put(0x7f4, total); put(0x7f8, maximum)
        machine.reg_write(reg.UC_X86_REG_RDX, memory)
        stop = 0x145afaf8e
        machine.emu_start(0x145afaf86, stop, count=100)
        assert machine.reg_read(reg.UC_X86_REG_XMM6) & 0xffffffffffffffff == total | (maximum << 32)
        machine.reg_write(reg.UC_X86_REG_RAX, memory + 0x1000)
        stop = 0x145afb61c
        machine.emu_start(0x145afb615, stop, count=100)
        assert bytes(machine.mem_read(memory + 0x10b8, 8)) == word(total) + word(maximum)
        mark_projection_cases += 1

    # Tester construction independently zeroes its Game rank argument; the
    # later admission metadata still reads the raw Pick and class/zone cap.
    reset()
    machine.reg_write(reg.UC_X86_REG_RDI, 5)
    stop = 0x145b23281
    machine.emu_start(0x145b23215, stop, count=10)
    assert machine.reg_read(reg.UC_X86_REG_RDI) == 0
    host_metadata_cases = 0
    for selected in range(256):
        for cap in range(6):
            reset()
            put(0x13e0, selected)
            machine.reg_write(reg.UC_X86_REG_RSI, memory)
            machine.reg_write(reg.UC_X86_REG_RAX, cap)
            stop = 0x145b2599e
            machine.emu_start(0x145b2598a, stop, count=20)
            actual = int.from_bytes(machine.mem_read(stack + 0x8100 + 0x3010, 1), "little")
            assert actual == min(selected, cap)
            host_metadata_cases += 1

    # Replay the actual received-Hero gate after the effective-host-rank call.
    gate_cases, digest = 0, hashlib.sha256()
    for zone in range(12):
        for normal_unlock in range(14):
            for rank in range(6):
                for remote_rank, length in ((0, 0), (0, 12), (1, 12), (3, 12), (5, 12), (255, 12)):
                    reset()
                    rbp = stack + 0x8100
                    machine.mem_write(rbp + 0x1da, bytes([normal_unlock]))
                    machine.mem_write(rbp - 0x20, struct.pack("<QQ", memory + 0x1000, length))
                    machine.mem_write(memory + 0x1000, bytes([remote_rank] * 12))
                    machine.reg_write(reg.UC_X86_REG_R14, zone)
                    machine.reg_write(reg.UC_X86_REG_RAX, rank)
                    # Stop on the first instruction of either destination.
                    stop = 0x145b3574b
                    outcome = []
                    def gate_hook(uc, address, _size, _context):
                        if address in (0x145b3574b, 0x145b35787):
                            outcome.append(address == 0x145b35787); uc.emu_stop()
                    handle = machine.hook_add(UC_HOOK_CODE, gate_hook)
                    machine.emu_start(0x145b35728, 0x145b35788, count=100)
                    machine.hook_del(handle)
                    expected = zone < normal_unlock and rank <= (remote_rank if zone < length else 0)
                    # The common hook stops rejection before the gate hook may
                    # see it, so absence is the same explicit failure target.
                    actual = outcome[0] if outcome else machine.reg_read(reg.UC_X86_REG_RIP) == 0x145b35787
                    assert actual == expected, (zone, normal_unlock, rank, remote_rank, length)
                    gate_cases += 1
                    digest.update(bytes([zone, normal_unlock, rank, remote_rank, length, actual]))
    return {"wire_fixtures": fixtures, "admission_cases": gate_cases,
            "item_collector_cases": collector_cases, "pity_count_clamp_cases": 256,
            "party_active_set_cases": set_cases, "party_heroic_gate_cases": 256,
            "state_scalar_cases": scalar_cases,
            "private_reward_rank_cases": reward_rank_cases,
            "whole_private_swap_cases": swap_cases,
            "mark_scalar_projection_cases": mark_projection_cases,
            "tester_game_rank_argument_cases": 1,
            "host_admission_metadata_rank_cases": host_metadata_cases,
            "admission_sha256": digest.hexdigest(), "original_instruction_steps": steps}


def source_connections():
    root = ROOT / "crates/azeroth-survivors-re/src"
    required = {
        "coop/server_party.rs": ["pub equipment_stars: [u8; 19]", "pub pity: Vec<(u32, u8)>",
            "pub heroic_unlocks: Vec<u8>", "pub weapon_glow: u32", "pub fn permits_zone(",
            "heroic_rank <= self.heroic_unlocks.get(zone).copied().unwrap_or(0)"],
        "coop/replication.rs": ["MarksAndPity", "out.push(state.heroic_rank)",
            "state.boss_counter.to_le_bytes()", "state.max_equipment_stars, state.active_set",
            "out.push(member.active_set)", "let count = self.count(7)?.min(5)"],
        "coop_profile.rs": ["save.max_heroic_rank", "save.weapon_glow", "hero.heroic_unlocks.resize(12, 0)",
            "count.min(40)", "game.configure_armor_set(hero.words_188, hero.equipment_stars)",
            "game.set_equipment_pity(&hero.pity)"],
        "gameplay/coop.rs": ["hero.permits_zone(zone_index, rank)",
            "hero.permits_zone(zone_index, admission_rank)", "NativeHero::locked_reason",
            "accept_marks_and_pity", "record_boss_rewards", "hero.weapon_glow",
            "self.reward_heroic_rank(&menu.backend_save)", "menu.backend_save.receive_equipment(ids, rank)",
            "RunEvent::GearReceipt", "RunEvent::MarksEarned",
            "let Some(snapshot) = state.state.as_ref() else { return; }",
            "let heroic_rank = snapshot.heroic_rank", "RunRules { heroic_rank,",
            "None, // Guest affix runtime is passive", "Some(menu.heroic_week)"],
        "gameplay/mechanics/coop.rs": ["boss_counter: self.endless_boss_kills()",
            "float_84_bits: self.run_marks().to_bits()", "float_88_bits: self.max_boss_marks().to_bits()",
            "flag_34: self.heroic_rank() >= 3", "self.effect_state.set_descriptor.map_or(0, |set| set.tier + 1)"],
        "gameplay/coop_publish.rs": ["game.drain_boss_rewards()", "NativeMessage::MarksAndPity",
            "if let Some(native) = game.with_party_hero(slot, |game| game.native_state())",
            "publish_recipient_state(&mut runtime, &mut state, client, native, now)"],
        "coop/client_state.rs": ["state.boss_counter.min(boss_limit)", "run_marks.clamp(0.0, 4000.0)",
            "max_boss_marks.clamp(0.0, 400.0)", "marks.clamp(0.0, 400.0)", "4000.0 - *marks_received"],
        "save.rs": ["pub mod gear_rewards;"],
        "save/gear_rewards.rs": [
            "pub struct EquipmentReceipt {", "pub id: u32", "pub is_new: bool", "pub marks_tenths: u32",
            "pub fn receive_equipment(&mut self, ids: &[u32], heroic_rank: u8) -> Vec<EquipmentReceipt>",
            "pub fn record_boss_rewards(&mut self, class: u8, marks: f32, missed_ids: &[u32]) -> u32"],
        "save/gear_progression.rs": ["pub fn class_marks_tenths(&self, class: u8) -> u32"],
        "gameplay/mechanics/progression.rs": [
            "pub fn set_equipment_pity(&mut self, pity: &[(u32, u8)])",
            "pub fn drain_boss_rewards(&mut self) -> (f32, Vec<u32>)"],
        "gameplay/mechanics.rs": ["GearReceipt { id: u32, race: u8, is_new: bool, marks_tenths: u32 }",
            "MarksEarned { earned: f32, total_tenths: u32 }"],
    }
    for path, fragments in required.items():
        source = re.sub(r"\s+", " ", (root / path).read_text())
        for fragment in fragments:
            assert re.sub(r"\s+", " ", fragment) in source, (path, fragment)


def shared_counter_domain(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM, CS_GRP_CALL, CS_GRP_JUMP
    from capstone.x86_const import X86_REG_RCX
    row = next(row for row in proof["native_ranges"] if row["role"] == "complete-private-hero-swap")
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    instructions = list(decoder.disasm(bytes.fromhex(row["bytes_hex"]), int(row["virtual_address"], 16)))
    assert len(instructions) == 733 and instructions[-1].mnemonic == "ret"
    accesses = 0
    for instruction in instructions:
        assert not instruction.group(CS_GRP_CALL) and not instruction.group(CS_GRP_JUMP)
        assert X86_REG_RCX not in instruction.regs_access()[1]
        for operand in instruction.operands:
            if operand.type == CS_OP_MEM and operand.mem.base == X86_REG_RCX:
                accesses += 1
                assert operand.mem.disp + operand.size <= 0xcd8 or operand.mem.disp >= 0xcdc
    return {"boss_counter_domain": "shared-world", "private_swap_instructions": len(instructions),
            "private_swap_game_accesses_checked": accesses}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    verifier = load_script("coop_wire_native_verify", ROOT / "scripts/check-coop-scaling.py")
    instructions = verifier.verify(proof)
    result = replay(proof)
    result.update(shared_counter_domain(proof))
    source_connections()
    result.update(target=proof["target"], decoded_instructions=instructions,
                  source_connections_checked=True, compiled=False, target_executed=False,
                  seams=["Typed append writers collect bytes; allocator/file/network/UI code does not run.",
                         "Admission starts after the effective host rank helper with synthetic Hero fields."],
                  parity="unverified")
    destination = MANIFEST.with_name("static-check.json")
    if args.write:
        destination.write_text(json.dumps(result, indent=2) + "\n")
    else:
        assert result == json.loads(destination.read_text())
    print(json.dumps({key: value for key, value in result.items() if key != "wire_fixtures"}))


if __name__ == "__main__":
    main()

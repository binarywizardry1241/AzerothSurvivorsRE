#!/usr/bin/env python3
"""Recover the selected target's meter accounting without launching the game.

prepare stages exact function slices and REA/Ghidra plans in runtime/.
collect stages reviewed native text and identities; verify executes bounded,
unchanged instruction vectors with explicit allocator/translation seams.
No application compilation, Rust tests or original/rebuilt process is invoked.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/native-recovery/meter-accounting/09505f8efe24"
OUT = ROOT / "runtime/analysis/staging/native-evidence/0.105.0/run-meters/accounting"
OWNERS = {"hit": 0x145933EC0, "source": 0x1458F2EE0,
          "breakdown": 0x1458F27A0, "record": 0x14595F3C0,
          "summary": 0x1458FAD90, "healing-credit": 0x1458F8050,
          "soul-link-credit": 0x1458F3330}
# Keep only the meter-bearing original instructions of the larger hit/summary
# owners. Full disposable decompilations remain in runtime, not duplicated docs.
RETAIN = {"hit": (0x1459343F2, 0x14593489D),
          "summary": (0x1458FCC54, 0x1458FD2D1),
          "soul-link-credit": (0x1458F343E, 0x1458F35CB)}


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + "\n")


def bits(value, fmt="f"):
    return int.from_bytes(struct.pack("<" + fmt, value), "little")


def native_vectors(pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, __version__
    import unicorn.x86_const as reg
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section["rva"], pe.data[
            section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    mem, stack, stop = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(mem, 0x400000)
    u.mem_map(stack, 0x10000)
    u.mem_map(stop, 4096)
    context = {}

    def put(at, fmt, *values):
        u.mem_write(at, struct.pack("<" + fmt, *values))

    def get(at, fmt):
        return struct.unpack("<" + fmt, u.mem_read(at, struct.calcsize("<" + fmt)))

    def ret():
        sp = u.reg_read(reg.UC_X86_REG_RSP)
        u.reg_write(reg.UC_X86_REG_RIP, get(sp, "Q")[0])
        u.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def allocate(size):
        address = context["allocation"]
        context["allocation"] += (size + 15) & ~15
        assert context["allocation"] < mem + 0x400000
        return address

    def hook(uc, address, size, unused):
        if address == stop:
            uc.emu_stop()
        elif any(lo <= address < hi for lo, hi in context["spans"]):
            return
        elif address in (0x140002200, 0x1400021D0):
            ret()  # allocator preflight/deallocation, not meter decisions
        elif address == 0x1400021C0:
            u.reg_write(reg.UC_X86_REG_RAX, allocate(u.reg_read(reg.UC_X86_REG_RCX)))
            ret()
        elif address in (0x145BFB510, 0x145BCB530):
            vector = u.reg_read(reg.UC_X86_REG_RCX)
            capacity, pointer, length = get(vector, "3Q")
            assert length == 0 and capacity == 0, "unexpected vector reallocation"
            put(vector, "3Q", 64, allocate(64 * 80), 0)
            ret()
        elif address == 0x145BC9787:
            lhs, rhs, count = (u.reg_read(r) for r in
                               (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8))
            u.reg_write(reg.UC_X86_REG_RAX,
                        int(bytes(u.mem_read(lhs, count)) != bytes(u.mem_read(rhs, count))))
            ret()
        elif address == 0x1458DA590:
            # Frozen English labels: native translation miss preserves its
            # input pointer/length. Localization itself is outside these vectors.
            u.reg_write(reg.UC_X86_REG_RAX, 0)
            ret()
        elif address == 0x145B9C4D0:
            # Only the localization-key formatter is omitted. A translation
            # miss below still uses the ORIGINAL definition's name and icon.
            put(u.reg_read(reg.UC_X86_REG_RCX), "3Q", 0, 1, 0)
            ret()
        else:
            raise RuntimeError("Unreviewed meter instruction " + hex(address))

    u.hook_add(UC_HOOK_CODE, hook)

    def reset(spans):
        u.mem_write(mem, bytes(0x400000))
        u.mem_write(stack, bytes(0x10000))
        context.update(allocation=mem + 0x10000, spans=spans)
        u.reg_write(reg.UC_X86_REG_MXCSR, 0x1F80)

    def call(address, args=(), floating=None):
        sp = stack + 0x8000
        put(sp, "Q", stop)
        u.reg_write(reg.UC_X86_REG_RSP, sp)
        for r, value in zip((reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX,
                             reg.UC_X86_REG_R8, reg.UC_X86_REG_R9), args):
            u.reg_write(r, value)
        if floating is not None:
            u.reg_write(reg.UC_X86_REG_XMM2, bits(floating, "d"))
        u.emu_start(address, stop, count=20000)

    def label(text):
        blob = text.encode()
        address = allocate(max(1, len(blob)))
        if blob:
            u.mem_write(address, blob)
        return address, len(blob)

    cases = {"hit": [], "source": [], "breakdown": [], "record": [],
             "healing": [], "soul_link": [], "absorb_order": [], "boss_timing": [], "boss_stop": [],
             "definitions": [], "periodic_context": []}
    # Admitted hit arithmetic only. Actor admission, multiplier recovery,
    # packets, procs and deaths are deliberately outside this instruction span.
    for name, health, power in [("ordinary", 80., 12.25), ("overkill", 3.5, 80.),
                                ("empty", 0., 5.), ("negative_hp", -3., 5.),
                                ("minimum", 8., -5.), ("fraction", .25, 1.),
                                ("nan_power", 8., float("nan"))]:
        reset([(0x1459343F2, 0x1459344EB)])
        actor, game = mem + 0x1000, mem + 0x4000
        put(actor + 0xF0, "f", health)
        put(actor + 0x18, "q", -1)
        put(game + 0x6C0, "d", 17.125)
        u.reg_write(reg.UC_X86_REG_R14, actor)
        u.reg_write(reg.UC_X86_REG_R13, 0)
        u.reg_write(reg.UC_X86_REG_RDI, game)
        u.reg_write(reg.UC_X86_REG_XMM6, bits(power))
        u.reg_write(reg.UC_X86_REG_XMM8, bits(1.))
        u.emu_start(0x1459343F2, 0x1459344E3, count=1000)
        amount = struct.unpack("<f", (u.reg_read(reg.UC_X86_REG_XMM8) & 0xFFFFFFFF).to_bytes(4, "little"))[0]
        effective = struct.unpack("<d", (u.reg_read(reg.UC_X86_REG_XMM7) & ((1 << 64) - 1)).to_bytes(8, "little"))[0]
        # Store the total only after the unchanged final movsd executes.
        u.emu_start(0x1459344E3, 0x1459344EB, count=1)
        expected_amount = max(power, 1.) if power == power else 1.
        assert amount == expected_amount
        assert effective == min(amount, max(health, 0.))
        assert get(game + 0x6C0, "d")[0] == 17.125 + effective
        cases["hit"].append(dict(name=name, health_bits=bits(health), power_bits=bits(power),
                                  amount_bits=bits(amount), effective_bits=bits(effective, "d"),
                                  remaining_bits=bits(get(actor + 0xF0, "f")[0]),
                                  total_bits=bits(get(game + 0x6C0, "d")[0], "d")))

    # Current source precedence, including the icon-length gate on named pets.
    for name, kind, descriptor, icon, proc in [
            ("pet_fallback", 2, False, "", False),
            ("pet_no_icon", 2, True, "", False),
            ("named_demon", 2, True, "DemonIcon", False),
            ("melee", 0, False, "", False),
            ("talent_fallback", 3, False, "", False),
            ("proc_over_spell", 0, False, "", True),
            ("reactive_proc", 3, False, "", True),
            ("periodic_proc", 1, False, "", True)]:
        reset([(0x1458F2EE0, 0x1458F32D5)])
        game, output, desc, provenance = [mem + x for x in (0x1000, 0x3000, 0x4000, 0x5000)]
        put(game + 0x195, "B", kind)
        if descriptor:
            put(desc, "4Q", *label("Imp"), *label(icon))
            put(game + 0x170, "Q", desc)
        if proc:
            put(game + 0x7C0, "2Q", provenance, 1)
            put(provenance, "q4Q", -1, *label("Nightfall"), *label("ProcIcon"))
            if kind == 3:
                put(game + 0x20, "2Q", 1, 0)
            elif kind == 1:
                put(game + 0x30, "2Q", 1, 0)
            else:
                put(game + 0x40, "2Q", 1, 0)
        call(0x1458F2EE0, (output, game, 0))
        _, pointer, length, icon_pointer, icon_length = get(output, "5Q")
        result = bytes(u.mem_read(pointer, length)).decode()
        result_icon = bytes(u.mem_read(icon_pointer, icon_length)).decode()
        talent = bool(get(output + 40, "B")[0])
        expected = "Nightfall" if proc else "Imp" if descriptor and icon else "Pets" if kind == 2 else "Talents" if kind == 3 else "Melee"
        assert result == expected and talent == (proc or kind == 3)
        cases["source"].append(dict(name=name, kind=kind, named=descriptor, icon_present=bool(icon),
                                     proc=proc, source=result, icon=result_icon, talent=talent))

    definitions = {}
    for i in range(116):
        address = 0x146BACAD8 + i * 120
        pointer, length = get(address, "2Q")
        if 0 < length < 100:
            key = bytes(u.mem_read(pointer, length)).decode()
            if key in ("holy_shock", "penance", "magma_totem", "searing_totem"):
                definitions[key] = address
    assert len(definitions) == 4
    for name, spell, learned, racial, expected in [
            ("global_alias", 25912, [], [], "Holy Shock"),
            ("learned_alias", 25912, ["penance"], [], "Penance"),
            ("learned_order", 25912, ["penance", "holy_shock"], [], "Penance"),
            ("racial_before_catalog", 25912, [], ["penance"], "Penance"),
            ("magma_pulse", 8187, [], [], "Magma Totem"),
            ("searing_pulse", 3606, [], [], "Searing Totem")]:
        reset([(0x1458F2EE0, 0x1458F32D5)])
        game, output, learned_rows, racial_rows = [mem + x for x in (0x1000, 0x3000, 0x4000, 0x5000)]
        put(game + 0x318, "2Q", learned_rows, len(learned))
        put(game + 0xB8, "2Q", racial_rows, len(racial))
        for i, key in enumerate(learned):
            put(learned_rows + i * 104, "Q", definitions[key])
        for i, key in enumerate(racial):
            put(racial_rows + i * 112, "Q", definitions[key])
        call(0x1458F2EE0, (output, game, spell))
        _, pointer, length, icon_pointer, icon_length = get(output, "5Q")
        result = bytes(u.mem_read(pointer, length)).decode()
        icon = bytes(u.mem_read(icon_pointer, icon_length)).decode()
        assert result == expected, (name, result)
        cases["definitions"].append(dict(name=name, spell_id=spell, learned=learned, racial=racial,
                                          source=result, icon=icon, talent=bool(get(output + 40, "B")[0])))

    # Reuse the already-recovered actor owner rather than duplicate its full
    # native extract. Its current periodic arm forwards the first16 row bytes.
    for kind, owner in [(0, 1), (1, 0), (1, 7), (1, 0x100000003), (0, 0xFFFFFFFFFFFFFFFF)]:
        reset([(0x14593DD6C, 0x14593DD70), (0x14593DF1F, 0x14593DF33)])
        game, row = mem + 0x1000, mem + 0x3000
        put(row, "2Q", kind, owner)
        put(game + 0x195, "B", 3)
        u.reg_write(reg.UC_X86_REG_RDI, row)
        u.reg_write(reg.UC_X86_REG_R13, game)
        u.emu_start(0x14593DD6C, 0x14593DD70, count=1)
        u.emu_start(0x14593DF1F, 0x14593DF33, count=3)
        words = get(game + 0x30, "4I")
        assert get(game + 0x195, "B")[0] == 1
        assert words == (kind, 0, owner & 0xFFFFFFFF, owner >> 32)
        cases["periodic_context"].append(dict(owner_kind=kind, owner_guid=owner, source_kind=1,
                                               source_words=list(words)))

    # Exact f32->f64 split; no primary-name validity check is invented.
    for name, kind, suppressed, primary, secondary, bonus, amount in [
            ("not_pet", 0, False, "Bite", "Echo", .2, 13.25),
            ("suppressed", 2, True, "Bite", "Echo", .2, 13.25),
            ("single", 2, False, "Bite", None, .2, 13.25),
            ("zero_bonus", 2, False, "Bite", "Echo", 0., 13.25),
            ("negative_bonus", 2, False, "Bite", "Echo", -.2, 13.25),
            ("nan_bonus", 2, False, "Bite", "Echo", float("nan"), 13.25),
            ("split", 2, False, "Bite", "Echo", .2, 13.25),
            ("large_split", 2, False, "Shadow Bolt", "Doom Bringer", 4., 17.1),
            ("empty_primary", 2, False, "", "Echo", .2, 13.25),
            ("empty_secondary", 2, False, "Bite", "", .2, 13.25)]:
        reset([(0x1458F27A0, 0x1458F28DA)])
        game, output = mem + 0x1000, mem + 0x3000
        put(game + 0x195, "B", kind)
        put(game + 0x168, "B", 2 if suppressed else 0)
        put(game + 0x140, "4Qf", *label(primary),
            *(label(secondary) if secondary is not None else (0, 0)), bonus)
        call(0x1458F27A0, (output, game), amount)
        _, pointer, length = get(output, "3Q")
        actual = []
        for i in range(length):
            ptr, size, value = get(pointer + i * 24, "2Qd")
            actual.append(dict(name=bytes(u.mem_read(ptr, size)).decode(), total_bits=bits(value, "d")))
        if kind != 2 or suppressed:
            assert not actual
        else:
            assert len(actual) == (2 if secondary is not None and bonus > 0 else 1), (name, actual)
            if len(actual) == 2:
                native_bonus = struct.unpack("<f", struct.pack("<f", bonus))[0]
                fraction = native_bonus / (1. + native_bonus)
                expected = [amount * (1. - fraction), amount * fraction]
            else:
                expected = [amount]
            assert [x["total_bits"] for x in actual] == [bits(x, "d") for x in expected]
        cases["breakdown"].append(dict(name=name, kind=kind, suppressed=suppressed,
                                        primary=primary, secondary=secondary, bonus_bits=bits(bonus),
                                        amount_bits=bits(amount, "d"), output=actual))

    # Run the COMPLETE shared insertion/merge owner with fixed English names.
    reset([(0x14595F3C0, 0x14595F6E5)])
    vector, source, parts = mem + 0x1000, mem + 0x2000, mem + 0x3000
    for name, icon, talent, amount, components in [
            ("Bolt", "First", False, 8., [("Direct", 8.)]),
            ("Bolt", "Different", False, 2., [("Direct", 1.), ("Echo", 1.)]),
            ("Bolt", "Talent", True, 4., [("Echo", 4.)]),
            ("Zero", "ZeroIcon", False, 0., []),
            ("Bolt", "Ignored", False, .125, []),
            ("Empty label", "Icon", False, 1., [("", 1.)])]:
        put(source, "q4QB", -1, *label(name), *label(icon), int(talent))
        for i, (part_name, value) in enumerate(components):
            put(parts + i * 24, "2Qd", *label(part_name), value)
        put(stack + 0x8000 + 0x28, "Q", len(components))
        call(0x14595F3C0, (vector, source, 0, parts), amount)
        _, pointer, length = get(vector, "3Q")
        rows = []
        for i in range(length):
            at = pointer + i * 80
            ptr, size, iptr, ilen, total, flag = get(at + 32, "4QdB")
            _, subptr, sublen = get(at, "3Q")
            breakdown = []
            for j in range(sublen):
                pptr, plen, value = get(subptr + j * 32 + 8, "2Qd")
                breakdown.append(dict(name=bytes(u.mem_read(pptr, plen)).decode(), total_bits=bits(value, "d")))
            rows.append(dict(name=bytes(u.mem_read(ptr, size)).decode(),
                             icon=bytes(u.mem_read(iptr, ilen)).decode(), talent=bool(flag),
                             total_bits=bits(total, "d"), breakdown=breakdown))
        cases["record"].append(dict(name=name, icon=icon, talent=talent,
                                     amount_bits=bits(amount, "d"),
                                     components=[dict(name=n, total_bits=bits(v, "d")) for n, v in components],
                                     rows=rows))
    assert len(rows) == 4
    assert rows[0]["icon"] == "First" and rows[0]["total_bits"] == bits(10.125, "d")
    assert rows[1]["talent"] and rows[1]["total_bits"] == bits(4., "d")
    assert rows[2]["name"] == "Zero"
    assert rows[0]["breakdown"][0]["total_bits"] == bits(9., "d")

    for amount in (-1., 0., .25, 17.125, float("nan")):
        reset([(0x1458F8050, 0x1458F8167), (0x14595F3C0, 0x14595F6E5)])
        game, source = mem + 0x1000, mem + 0x3000
        put(source, "q4QB", -1, *label("Captured heal"), *label("HealIcon"), 0)
        u.reg_write(reg.UC_X86_REG_XMM1, bits(amount))
        call(0x1458F8050, (game, 0, 0, source))
        _, pointer, length = get(game + 0x678, "3Q")
        expected_count = int(not amount <= 0.)
        assert length == expected_count
        total = get(pointer + 64, "d")[0] if length else None
        assert total is None or bits(total, "d") == bits(amount, "d")
        cases["healing"].append(dict(amount_bits=bits(amount), count=length,
                                      total_bits=None if total is None else bits(total, "d")))

    # Soul Link's consumed share is attributed independently of shield gain.
    for name, incoming, shield in [("partial", 10., 4.), ("full", 10., 15.),
                                    ("empty", 10., 0.), ("zero_hit", 0., 8.),
                                    ("negative", -1., 8.), ("nan", float("nan"), 8.)]:
        reset([(0x1458F34D4, 0x1458F3599), (0x14595F3C0, 0x14595F6E5)])
        game = mem + 0x1000
        put(game + 0x190, "f", shield)
        u.reg_write(reg.UC_X86_REG_RDI, game)
        u.reg_write(reg.UC_X86_REG_RBP, stack + 0x8000)
        u.reg_write(reg.UC_X86_REG_RSP, stack + 0x7000)
        u.reg_write(reg.UC_X86_REG_XMM3, bits(incoming))
        u.emu_start(0x1458F34D4, 0x1458F3599, count=20000)
        remaining = get(game + 0x190, "f")[0]
        _, pointer, length = get(game + 0x678, "3Q")
        # MINSS selects its second operand for unordered inputs, followed by
        # the target's explicit original-input fallback if that result is NaN.
        expected = shield if incoming != incoming else min(incoming, shield)
        assert length == int(expected > 0.), (name, incoming, shield, length, remaining)
        assert remaining == shield - (expected if expected > 0. else 0.)
        source_name = source_icon = None
        total = None
        if length:
            ptr, size, iptr, ilen, total, talent = get(pointer + 32, "4QdB")
            source_name = bytes(u.mem_read(ptr, size)).decode()
            source_icon = bytes(u.mem_read(iptr, ilen)).decode()
            assert source_name == "Soul Link" and source_icon == "Spell_Shadow_GatherShadows"
            assert total == expected and not talent
        cases["soul_link"].append(dict(name=name, incoming_bits=bits(incoming), shield_bits=bits(shield),
                                       remaining_bits=bits(remaining), count=length, source=source_name,
                                       icon=source_icon, total_bits=None if total is None else bits(total, "d")))

    # Execute reservation subtraction, Soul Link credit and subset clamp as
    # one unchanged native branch. Total absorb is reduced only once.
    for name, incoming, total, spell, reserved, link in [
            ("unreserved", 8., 20., 0, 0., 10.),
            ("reserved_only", 8., 20., 17, 12., 8.),
            ("reserved_then_link", 15., 20., 17, 12., 8.),
            ("depleted", 30., 20., 17, 12., 8.),
            ("partial_link", 7., 20., 17, 5., 3.),
            ("other_absorb", 18., 20., 0, 0., 3.),
            ("subset_clamp", 5., 10., 17, 10., 8.),
            ("zero", 0., 20., 0, 0., 8.)]:
        reset([(0x1458F343E, 0x1458F35CB), (0x14595F3C0, 0x14595F6E5)])
        game = mem + 0x1000
        put(game + 0x4E4, "f", total)
        put(game + 0x468, "If", spell, reserved)
        put(game + 0x190, "f", link)
        u.reg_write(reg.UC_X86_REG_R13, game)
        u.reg_write(reg.UC_X86_REG_RBP, stack + 0x8000)
        u.reg_write(reg.UC_X86_REG_RSP, stack + 0x7000)
        u.reg_write(reg.UC_X86_REG_XMM7, bits(incoming))
        u.reg_write(reg.UC_X86_REG_XMM9, bits(total))
        u.emu_start(0x1458F343E, 0x1458F35CB, count=20000)
        absorbed = min(incoming, total)
        credit = min(absorbed if spell == 0 else max(absorbed - reserved, 0.), link)
        assert get(game + 0x4E4, "f")[0] == total - absorbed
        assert get(game + 0x190, "f")[0] == min(link - credit, total - absorbed)
        _, pointer, length = get(game + 0x678, "3Q")
        assert length == int(credit > 0.)
        actual_credit = get(pointer + 64, "d")[0] if length else 0.
        assert actual_credit == credit
        cases["absorb_order"].append(dict(
            name=name, incoming_bits=bits(incoming), total_bits=bits(total),
            reserved_spell=spell, reserved_bits=bits(reserved), link_bits=bits(link),
            absorbed_bits=bits(absorbed), credit_bits=bits(credit),
            remaining_total_bits=bits(get(game + 0x4E4, "f")[0]),
            remaining_link_bits=bits(get(game + 0x190, "f")[0]),
            remaining_reserved_spell=get(game + 0x468, "I")[0],
            remaining_reserved_bits=bits(get(game + 0x46C, "f")[0])))

    for marker in (0, 1, 3):
        reset([(0x1458FD151, 0x1458FD160)])
        u.reg_write(reg.UC_X86_REG_RSI, marker)
        u.reg_write(reg.UC_X86_REG_XMM6, bits(18.))
        u.reg_write(reg.UC_X86_REG_XMM8, bits(50.))
        u.reg_write(reg.UC_X86_REG_XMM9, bits(10.))
        u.emu_start(0x1458FD151, 0x1458FD160, count=10)
        result = u.reg_read(reg.UC_X86_REG_XMM6) & 0xFFFFFFFF
        assert result == bits(8. if marker & 1 else 40.)
        cases["boss_timing"].append(dict(marker=marker, start_bits=bits(10.), stop_bits=bits(18.),
                                          now_bits=bits(50.), seconds_bits=result, live=marker != 1))
    for actors in ([], [(0, False)], [(0, True)], [(1, True)], [(1, True), (0, True)]):
        for marker in (0, 1, 2, 3, 4):
            reset([(0x145935431, 0x14593547B), (0x145935728, 0x145935754)])
            game, rows = mem + 0x1000, mem + 0x3000
            put(game + 0x560, "2Q", rows, len(actors))
            put(game + 0x704, "If", marker, 17.)
            put(game + 0x9EC, "f", 100.)
            for i, (state, primary) in enumerate(actors):
                put(rows + i * 0x160 + 0x68, "B", state)
                put(rows + i * 0x160 + 0x18, "q", 0 if primary else -1)
            u.reg_write(reg.UC_X86_REG_RDI, game)
            u.emu_start(0x145935431, 0x145935754, count=1000)
            new_marker, stopped = get(game + 0x704, "If")
            live = any(state == 0 and primary for state, primary in actors)
            changes = not live and not marker & 1 and marker != 2
            assert new_marker == (1 if changes else marker)
            assert stopped == (100. if changes else 17.)
            cases["boss_stop"].append(dict(actors=[dict(state=s, primary=p) for s, p in actors],
                                            marker=marker, now_bits=bits(100.), prior_stop_bits=bits(17.),
                                            result_marker=new_marker, stop_bits=bits(stopped)))
    result = dict(target_sha256=SHA, application_executed=False, engine="Unicorn " + __version__,
                  cases=cases, seams=[
                      "Original PE bytes/data mapped at their original virtual addresses.",
                      "Allocator calls use project-local emulated storage; reserve only allocates empty vectors.",
                      "memcmp compares the supplied byte strings; translation returns the English fallback.",
                      "Ability localization-key formatting returns an empty key; the missing translation retains original definition name/icon data.",
                      "Hit cases enter after admission/multiplier selection and stop before per-spell map insertion.",
                      "Boss timing covers the exact end-selection/subtraction branch; marker2 empty is separately traced in summary."],
                  limits=["Not a Rust source test, game session, rendered or original/rebuilt comparison.",
                          "The corpus does not supply missing special-demon, Soul Link or periodic provenance producers."])
    save(OUT / "native-vectors.json", result)
    print("Verified", sum(len(v) for v in cases.values()), "bounded unchanged 0.105.0 meter cases")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("prepare", "collect", "verify", "check"))
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE hash mismatch"
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    WORK.mkdir(exist_ok=True, parents=True)
    OUT.mkdir(exist_ok=True, parents=True)
    if args.action in ("verify", "check"):
        result = native_vectors(pe)
        if args.action == "check":
            retained = ROOT / "docs/analysis/evidence/0.105.0/run-meters/accounting"
            expected = json.loads((retained / "native-vectors.json").read_text())
            assert result["target_sha256"] == expected["target_sha256"]
            assert result["cases"] == expected["cases"], "Retained native meter vectors drifted"
            manifest = json.loads((retained / "manifest.json").read_text())
            assert manifest["target_sha256"] == SHA
            bounds = {lo + pe.image_base: hi + pe.image_base for lo, hi, _ in pe.functions()}
            for owner in manifest["owners"]:
                lo, hi = int(owner["address"], 16), int(owner["end_exclusive"], 16)
                assert bounds[lo] == hi
                at = pe.rva_offset(lo - pe.image_base)
                assert at == int(owner["file_offset"], 16)
                assert hashlib.sha256(data[at:at + hi - lo]).hexdigest() == owner["sha256"]
                for key, value in owner.get("retained_text_sha256", {}).items():
                    assert hashlib.sha256((retained / key).read_bytes()).hexdigest() == value
                for branch in owner.get("stop_branches", []):
                    lo, hi = [int(x, 16) for x in branch["range"]]
                    assert hashlib.sha256(data[pe.rva_offset(lo - pe.image_base):pe.rva_offset(hi - pe.image_base)]).hexdigest() == branch["sha256"]
            for owner in manifest.get("reused_owners", []):
                lo, hi = int(owner["address"], 16), int(owner["end_exclusive"], 16)
                assert bounds[lo] == hi
                at = pe.rva_offset(lo - pe.image_base)
                assert hashlib.sha256(data[at:at + hi - lo]).hexdigest() == owner["sha256"]
                for branch in owner["branches"]:
                    lo, hi = [int(x, 16) for x in branch["range"]]
                    assert hashlib.sha256(data[pe.rva_offset(lo - pe.image_base):pe.rva_offset(hi - pe.image_base)]).hexdigest() == branch["sha256"]
                    assert hashlib.sha256((retained / branch["assembly"]).read_bytes()).hexdigest() == branch["text_sha256"]
            print("Retained meter vectors, native extents and curated text identities match")
        return
    bounds = {lo + pe.image_base: hi + pe.image_base for lo, hi, _ in pe.functions()}
    owners = []
    for role, start in OWNERS.items():
        end = bounds[start]
        at = pe.rva_offset(start - pe.image_base)
        payload = data[at:at + end - start]
        row = dict(role=role, address=hex(start), end_exclusive=hex(end),
                   file_offset=hex(at), byte_count=len(payload), sha256=hashlib.sha256(payload).hexdigest())
        if args.action == "prepare":
            (WORK / f"{role}.bin").write_bytes(payload)
            save(WORK / f"{role}-plan.json", dict(
                target=str((WORK / f"{role}.bin").relative_to(ROOT)),
                output=str((WORK / f"rea-{role}").relative_to(ROOT)), init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)))]))
        else:
            lo, hi = RETAIN.get(role, (start, end))
            row["assembly"] = f"{role}.asm"
            row["retained_range"] = [hex(lo), hex(hi)]
            row["retained_sha256"] = hashlib.sha256(data[pe.rva_offset(lo - pe.image_base):pe.rva_offset(hi - pe.image_base)]).hexdigest()
            (OUT / f"{role}.asm").write_text(objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={lo:#x}",
                f"--stop-address={hi:#x}", str(TARGET.relative_to(ROOT))], text=True, cwd=ROOT))
            result = json.loads((WORK / f"rea-{role}/003-procedure_pseudo_code.json").read_text())
            evidence = result["response"]["result"]["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == row["sha256"]
            row.update(evidence_id=evidence["evidence_id"],
                       provider=evidence["analysis_profile"]["provider"],
                       analysis_profile_digest=evidence["analysis_profile"]["digest"])
            if role not in RETAIN:
                row["pseudocode"] = f"{role}.ghidra.c"
                text = evidence["normalized_result"]
                (OUT / row["pseudocode"]).write_text("\n".join(line.rstrip() for line in text.strip().splitlines()) + "\n")
            if role == "hit":
                row["stop_branches"] = []
                for name, lo, hi in [("boss-stop-scan", 0x145935431, 0x14593547B),
                                     ("boss-stop-state", 0x145935728, 0x145935754)]:
                    branch = dict(range=[hex(lo), hex(hi)], assembly=f"{name}.asm",
                                  sha256=hashlib.sha256(data[pe.rva_offset(lo - pe.image_base):pe.rva_offset(hi - pe.image_base)]).hexdigest())
                    (OUT / branch["assembly"]).write_text(objdump_output([
                        "objdump", "-d", "--no-show-raw-insn", f"--start-address={lo:#x}",
                        f"--stop-address={hi:#x}", str(TARGET.relative_to(ROOT))], text=True, cwd=ROOT))
                    row["stop_branches"].append(branch)
            text_names = [row["assembly"]]
            if "pseudocode" in row:
                text_names.append(row["pseudocode"])
            text_names.extend(branch["assembly"] for branch in row.get("stop_branches", []))
            row["retained_text_sha256"] = {
                name: hashlib.sha256((OUT / name).read_bytes()).hexdigest() for name in text_names
            }
        owners.append(row)
    reused = []
    if args.action == "collect":
        manifest_path = ROOT / "docs/analysis/evidence/0.105.0/mob-movement/manifest.json"
        current = json.loads(manifest_path.read_text())
        actor = next(row for row in current["rea"] if row["role"] == "actor")
        lo, hi = int(actor["start"], 16), int(actor["end_exclusive"], 16)
        assert hashlib.sha256(data[pe.rva_offset(lo - pe.image_base):pe.rva_offset(hi - pe.image_base)]).hexdigest() == actor["sha256"]
        row = dict(role="actor-periodic-context", address=actor["start"],
                   end_exclusive=actor["end_exclusive"], sha256=actor["sha256"],
                   evidence_id=actor["evidence_id"], provider=actor["provider"],
                   owning_manifest="../../mob-movement/manifest.json", branches=[])
        for name, lo, hi in [("periodic-source-load", 0x14593DD62, 0x14593DD8C),
                             ("periodic-source-forward", 0x14593DF1F, 0x14593DF7C)]:
            branch = dict(range=[hex(lo), hex(hi)], assembly=f"{name}.asm",
                          sha256=hashlib.sha256(data[pe.rva_offset(lo - pe.image_base):pe.rva_offset(hi - pe.image_base)]).hexdigest())
            (OUT / branch["assembly"]).write_text(objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={lo:#x}",
                f"--stop-address={hi:#x}", str(TARGET.relative_to(ROOT))], text=True, cwd=ROOT))
            branch["text_sha256"] = hashlib.sha256((OUT / branch["assembly"]).read_bytes()).hexdigest()
            row["branches"].append(branch)
        reused.append(row)
    save(OUT / "manifest.json", dict(target_version="0.105.0", target_sha256=SHA,
                                    application_executed=False, owners=owners,
                                    reused_owners=reused,
                                    limitations=["Static Ghidra raw imports omit external callees/data and use a generic ABI.",
                                                 "Original-PE instructions and mapped data control vector interpretation.",
                                                 "Large hit/summary extracts retain only their meter-bearing ranges."]))
    print("Staged", len(owners), "current meter owners")


if __name__ == "__main__":
    main()

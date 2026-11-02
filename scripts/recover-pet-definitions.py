#!/usr/bin/env python3
"""Stage hash-bound combat-pet definitions and the bounded current producers.

This does not run the reference or compile the reconstruction. --prepare creates
project-local REA/Ghidra plans; --collect retains their selected textual evidence.
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
WORK = ROOT / "runtime/power-scaling-0.105.0/pet-creation"
OUT = ROOT / "runtime/native-evidence/0.105.0/pet-creation"
DEFINITIONS = {
    "wolf": 0x146E75008, "raptor": 0x146E75058,
    "imp": 0x146E74FC0, "felguard": 0x146E750E8,
    "treant": 0x146E750A0, "spirit_wolf": 0x146E5B268,
    "water_elemental": 0x146E74F78, "felhunter": 0x146E75260,
    "voidwalker": 0x146E5B1F8, "succubus": 0x146E751C0,
    "infernal": 0x146E75130, "doomguard": 0x146E75210,
    "pit_lord": 0x146E75178,
}
TALENTS = {
    "tame_beast": 0x146E61E90, "bestial_wrath": 0x146E62250,
    "stormstrike": 0x146E6AC50, "water_elemental": 0x146E6E338,
    "force_of_nature": 0x146E72840, "demonic_familiar": 0x146E70688,
    "soul_devourer": 0x146E70868, "soul_link": 0x146E708E0,
}
STAT_TALENTS = {"unleashed_fury": 0x146E61F08, "bestial_discipline": 0x146E620E8}
OWNERS = {"create": 0x145928BD0, "follower-selector": 0x14599CD90,
          "summon-wrapper": 0x14594E4F0}
FRAGMENTS = {"initial-followers": (0x1459183DA, 0x145918596),
             "generic2-create": (0x14592CF39, 0x14592D013)}


def save(path, value):
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def verify_native(pe, blob):
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, __version__
    import unicorn.x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section["rva"] + section["raw_size"] for section in pe.sections)
    uc.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], blob[
            section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    stack, state = 0x20000000, 0x30000000
    uc.mem_map(stack, 0x10000)
    uc.mem_map(state, 0x20000)
    bp, rows, origin, pointers = stack + 0x1000, state + 0x4000, state + 0x8000, state + 0x10000

    def bits(value):
        return struct.unpack("<I", struct.pack("<f", value))[0]

    def reset():
        uc.mem_write(stack, bytes(0x10000))
        uc.mem_write(state, bytes(0x20000))
        uc.reg_write(reg.UC_X86_REG_RBP, bp)
        uc.reg_write(reg.UC_X86_REG_RSP, stack + 0xF000)

    angles = []
    for count in (1, 2, 3, 6):
        for index in range(count):
            reset()
            uc.mem_write(bp + 0x190, struct.pack("<Q", pointers))
            uc.mem_write(pointers, struct.pack("<" + "Q" * count, *([DEFINITIONS["wolf"]] * count)))
            uc.reg_write(reg.UC_X86_REG_RAX, count)
            uc.reg_write(reg.UC_X86_REG_RBX, index)
            uc.reg_write(reg.UC_X86_REG_RSI, count * 8)
            uc.emu_start(0x1459184E9, 0x145918545, count=100)
            assert uc.reg_read(reg.UC_X86_REG_RIP) == 0x145918545
            angles.append(dict(index=index, count=count, bits=uc.reg_read(reg.UC_X86_REG_XMM2) & 0xFFFFFFFF))
    states = []
    for now in (0.0, 5.25, 32768.0):
        for temporary in (False, True):
            reset()
            now_bits = bits(now)
            relative = 1.125
            payload = struct.pack("<QfIQ", int(temporary), now + 15.0, 0, 7)
            uc.mem_write(origin, payload)
            uc.mem_write(state + 0xC8, struct.pack("<QQQ", 8, rows, 0))
            uc.mem_write(state + 0x9EC, struct.pack("<I", now_bits))
            uc.reg_write(reg.UC_X86_REG_RSI, state)
            uc.reg_write(reg.UC_X86_REG_RBX, origin)
            uc.reg_write(reg.UC_X86_REG_RDI, DEFINITIONS["wolf"])
            uc.reg_write(reg.UC_X86_REG_R14, 0xF130002526000001)
            uc.reg_write(reg.UC_X86_REG_XMM6, bits(relative))
            uc.reg_write(reg.UC_X86_REG_XMM7, int.from_bytes(struct.pack("<ff", 2.5, -4.0), "little"))
            uc.reg_write(reg.UC_X86_REG_XMM8, bits(9.0))
            uc.emu_start(0x1459297BA, 0x145929870, count=100)
            assert uc.reg_read(reg.UC_X86_REG_RIP) == 0x145929870
            row = bytes(uc.mem_read(rows, 120))
            assert row[:24] == payload
            assert row[0x28:0x3C] == bytes(20)
            assert struct.unpack("<Q", uc.mem_read(state + 0xD8, 8))[0] == 1
            words = struct.unpack_from("<8I", row, 0x58)
            assert words == (now_bits, 0, bits(now + 1.0), now_bits, bits(relative), bits(1.0), 0, 0)
            states.append(dict(now_bits=now_bits, temporary=temporary, expires_bits=bits(now + 15.0),
                               effect_index=7, relative_angle_bits=bits(relative), initial_words=list(words),
                               position_bits=[bits(2.5), bits(-4.0), bits(9.0)]))
    guids = []
    for entry, address in ((9510, DEFINITIONS["wolf"]), (9517, DEFINITIONS["water_elemental"])):
        for previous in (0, 0x00FFFFFF, 0xFFFFFFFF):
            reset()
            uc.mem_write(state + 0xA0C, struct.pack("<I", previous))
            uc.reg_write(reg.UC_X86_REG_RSI, state)
            uc.reg_write(reg.UC_X86_REG_RDI, address)
            uc.emu_start(0x145928CE9, 0x145928D1D, count=100)
            assert uc.reg_read(reg.UC_X86_REG_RIP) == 0x145928D1D
            guids.append(dict(entry=entry, previous=previous,
                              next=struct.unpack("<I", uc.mem_read(state + 0xA0C, 4))[0],
                              guid=uc.reg_read(reg.UC_X86_REG_R14)))
    save(OUT / "construction-native.json", dict(
        target_sha256=SHA, engine="Unicorn " + __version__, application_executed=False,
        angles=angles, states=states, guids=guids,
        seams=["Constructor append starts after external terrain/object-publication work; its exact input position is supplied.",
               "Selected fragments have no external calls and execute unchanged; no allocation/provider hook substitutes behavior."],
        limits=["The original application and reconstructed application were not launched.",
                "These vectors do not prove terrain resolution, actor publication, or gameplay/visual parity."]))
    print(f"Verified {len(angles) + len(states) + len(guids)} unchanged creation/angle/GUID vectors")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["prepare", "collect", "verify"])
    args = parser.parse_args()
    blob = TARGET.read_bytes()
    assert hashlib.sha256(blob).hexdigest() == SHA
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(blob)
    WORK.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)
    if args.action == "verify":
        verify_native(pe, blob)
        return

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return blob[offset:offset + count]

    def text_pair(address):
        pointer, count = struct.unpack("<QQ", raw(address, 16))
        return raw(pointer, count).decode("utf-8") if count else None

    records = []
    for key, address in DEFINITIONS.items():
        payload = raw(address, 64)
        entry, model, scale, damage, period, spell_id = struct.unpack_from("<IIfffI", payload, 32)
        references = []
        needle = struct.pack("<Q", address)
        hit = blob.find(needle)
        while hit >= 0:
            reference_address = pe.offset_va(hit)
            if reference_address is not None:
                references.append(dict(address=hex(reference_address),
                                       raw29_at_minus8=blob[hit - 8] == 29,
                                       raw2_at_minus16=blob[hit - 16] == 2,
                                       context_hex=blob[hit - 16:hit + 16].hex()))
            hit = blob.find(needle, hit + 1)
        records.append(dict(key=key, address=hex(address), name=text_pair(address),
                            icon=text_pair(address + 16), entry=entry, model=model,
                            scale=scale, damage=damage, period=period, spell_id=spell_id,
                            school=payload[56], special=payload[57],
                            scale_bits=struct.unpack_from("<I", payload, 40)[0],
                            damage_bits=struct.unpack_from("<I", payload, 44)[0],
                            period_bits=struct.unpack_from("<I", payload, 48)[0],
                            raw_hex=payload.hex(), sha256=hashlib.sha256(payload).hexdigest(),
                            exact_pointer_references=references))
    talents = []
    for key, address in TALENTS.items():
        assert text_pair(address) == key
        pointer, count = struct.unpack("<QQ", raw(address + 48, 16))
        effects = []
        for index in range(count):
            payload = raw(pointer + index * 64, 64)
            effects.append(dict(address=hex(pointer + index * 64), raw_hex=payload.hex(),
                                sha256=hashlib.sha256(payload).hexdigest(), tag=payload[0]))
        talents.append(dict(key=key, address=hex(address), name=text_pair(address + 16),
                            description=text_pair(address + 64),
                            metadata_hex=raw(address + 80, 8).hex(), effects=effects))
    stat_rows, stat_producers = {}, []
    for key, address in STAT_TALENTS.items():
        assert text_pair(address) == key
        pointer, count = struct.unpack("<QQ", raw(address + 48, 16))
        assert count == 1
        payload = raw(pointer, 64)
        assert payload[0] == 35 and payload[8] == 17
        assert payload[1:4] == bytes(3) and payload[9:] == bytes(55)
        stat_rows.setdefault(hex(pointer), dict(
            address=hex(pointer), byte_count=64, raw_hex=payload.hex(),
            sha256=hashlib.sha256(payload).hexdigest(), native_variant=payload[0], stat=payload[8],
            amount_bits=struct.unpack_from("<I", payload, 4)[0],
            amount=struct.unpack_from("<f", payload, 4)[0]))
        prefix = raw(address, 88)
        metadata = prefix[80:88]
        stat_producers.append(dict(
            key=key, address=hex(address), name=text_pair(address + 16),
            description=text_pair(address + 64), examined_prefix_byte_count=88,
            examined_prefix_sha256=hashlib.sha256(prefix).hexdigest(),
            metadata_hex=metadata.hex(), row=metadata[0], column=metadata[1], max_rank=metadata[2],
            effect_address=hex(pointer)))
    constants = []
    for address, count in [(0x146E785B0, 2), (0x146E785C0, 4),
                           (0x14603E770, 4), (0x145D6D754, 1),
                           (0x145DBF5C0, 1), (0x145D9AF14, 1),
                           (0x145D9AE9C, 1), (0x146E7B158, 7)]:
        payload = raw(address, count * 4)
        constants.append(dict(address=hex(address), raw_hex=payload.hex(),
                              words=list(struct.unpack("<" + "I" * count, payload)),
                              sha256=hashlib.sha256(payload).hexdigest()))
    save(OUT / "definitions.json", dict(target_sha256=SHA, application_executed=False,
                                       definitions=records, selected_talent_producers=talents,
                                       stat_power_producers=dict(
                                           rows=list(stat_rows.values()), talents=stat_producers,
                                           scope="Exact current raw35 stat17 coefficients and selected talent rank caps; native rank-scaling execution is not inferred from data alone."),
                                       constants=constants,
                                       limits=["Only explicitly selected talent rows were decoded; their full owning table/stride is not inferred.",
                                               "No static raw2 producer was found among exact references to these thirteen descriptors; the generic consumer remains separate evidence.",
                                               "Current special1..8 descriptors do not establish implemented special attack parity."]))
    bounds = {a + pe.image_base: b + pe.image_base for a, b, _ in pe.functions()}
    owners = []
    for role, address in OWNERS.items():
        end = bounds[address]
        payload = raw(address, end - address)
        source = dict(address=hex(address), end_exclusive=hex(end), byte_count=len(payload),
                      file_offset=hex(pe.rva_offset(address - pe.image_base)),
                      sha256=hashlib.sha256(payload).hexdigest())
        if args.action == "prepare":
            (WORK / f"{role}.bin").write_bytes(payload)
            save(WORK / f"{role}-plan.json", dict(
                target=str((WORK / f"{role}.bin").relative_to(ROOT)),
                output=str((WORK / f"rea-{role}").relative_to(ROOT)),
                init_timeout=60, open_timeout=60, timeout=180,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(address)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(address)))]))
        record = dict(role=role, source=source)
        response_path = WORK / f"rea-{role}/003-procedure_pseudo_code.json"
        if args.action == "collect" and response_path.exists():
            evidence = json.loads(response_path.read_text())["response"]["result"]["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
            (OUT / f"{role}.ghidra.c").write_text(evidence["normalized_result"])
            record.update(evidence_id=evidence["evidence_id"],
                          analysis_profile=evidence["analysis_profile"], limits=evidence["limitations"])
        else:
            record["rea_status"] = "not-collected"
        if args.action == "collect":
            assembly = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                                                f"--start-address={address:#x}", f"--stop-address={end:#x}",
                                                str(TARGET.relative_to(ROOT))], text=True, cwd=ROOT)
            (OUT / f"{role}.asm").write_text(assembly)
        owners.append(record)
    for role, (address, end) in FRAGMENTS.items():
        payload = raw(address, end - address)
        if args.action == "collect":
            (OUT / f"{role}.asm").write_text(objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={address:#x}",
                f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], text=True, cwd=ROOT))
        owners.append(dict(role=role, source=dict(address=hex(address), end_exclusive=hex(end),
                                                 sha256=hashlib.sha256(payload).hexdigest(), byte_count=len(payload)),
                           scope="bounded caller fragment; complete callee owners listed separately"))
    save(OUT / "manifest.json", dict(target_sha256=SHA, application_executed=False,
                                    owners=owners,
                                    limits=["Ghidra raw imports omit external callees and data; original Win64 assembly and exact target bytes control interpretation.",
                                            "No original/rebuilt gameplay or visual comparison is implied."]))
    print(f"Staged {len(records)} current pet definitions and {len(talents)} selected talent producers")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Capture selected 0.97.2 guardian reward instructions; never execute the game."""
from portable_paths import objdump_output, portable_json

import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
EXPECTED = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OUTPUT = ROOT / "docs/analysis/evidence/guardians"
RANGES = (
    ("guardian-death-rewards", 0x1454C422B, 0x1454C44D8),
    ("guardian-pending-rewards", 0x1454AA235, 0x1454AA34C),
    ("guardian-gold-consumer", 0x1454A5C33, 0x1454A5C89),
    ("guardian-gold-pickup-creation", 0x1454C8F60, 0x1454C8F76),
    ("guardian-scheduled-magnet", 0x1454C16A0, 0x1454C17A6),
    ("guardian-magnet-consumer", 0x1454A5B6D, 0x1454A5DE6),
    ("guardian-json-object-start", 0x145450BF0, 0x145450C44),
    ("guardian-choice-generation-mode", 0x1454DA624, 0x1454DA68A),
    ("guardian-choice-pause", 0x1454DB390, 0x1454DB3B5),
    ("guardian-strength-level-owner", 0x1454B49FA, 0x1454B4A78),
    ("guardian-strength-levelup-choice", 0x1454B5335, 0x1454B5392),
)


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == EXPECTED
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def read(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + length]

    def span(address, length):
        raw = read(address, length)
        assert len(raw) == length
        return dict(va=hex(address), byte_count=length, file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    OUTPUT.mkdir(parents=True, exist_ok=True)
    assembly = []
    for label, start, end in RANGES:
        text = objdump_output(["objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                                        f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
        path = OUTPUT / f"{label}.asm"
        path.write_text(text)
        assembly.append(dict(label=label, **span(start, end - start), end_exclusive=hex(end),
                             assembly=path.name, assembly_sha256=hashlib.sha256(text.encode()).hexdigest()))
    constants = []
    for role, address in (("xp_linear", 0x1458EB4F8), ("xp_constant", 0x1458F8DE4),
                          ("xp_quadratic", 0x1458EB508), ("u32_saturation_boundary", 0x1458EB51C),
                          ("unit24_scale", 0x1459EB3C0), ("magnet_chance", 0x1458EB488),
                          ("guardian_jewelry_generation_parameter", 0x1458ED010),
                          ("guardian_respawn_interval", 0x1459C7C24)):
        constants.append(dict(role=role, **span(address, 4), f32=struct.unpack("<f", read(address, 4))[0]))
    strings = []
    for role, address, length in (("event_type_key", 0x1469AB051, 4), ("event_type_value", 0x1469AA938, 8),
                                 ("event_name_key", 0x1469AB026, 4),
                                 ("magnet_collected_text", 0x1469AB640, 45),
                                 ("guardian_slain_text", 0x1469AC8C0, 94)):
        strings.append(dict(role=role, **span(address, length), text=read(address, length).decode()))
    thunk = 0x145756E1F
    thunk_data = read(thunk, 6)
    assert thunk_data[:2] == b"\xff\x25"
    iat = thunk + 6 + struct.unpack_from("<i", thunk_data, 2)[0]
    imported = [(lib["library"], name) for lib in pe.imports() for i, name in enumerate(lib["functions"])
                if int(lib["iat_start_address"], 16) + i * 8 == iat]
    assert imported == [("api-ms-win-crt-math-l1-1-0.dll", "roundf")]
    result = dict(
        date="2026-10-18", target_version="0.97.2", target=str(TARGET.relative_to(ROOT)), target_sha256=EXPECTED,
        target_executed=False, method="SHA-256 checked original PE bytes, exact table/constants and bounded disassembly. No original or rebuilt process launched.",
        assembly=assembly, constants=constants, strings=strings,
        round_import=dict(**span(thunk, 6), iat=hex(iat), library=imported[0][0], function=imported[0][1]),
        magnet_offset=dict(**span(0x1469AA560, 8), xy=list(struct.unpack("<2f", read(0x1469AA560, 8)))),
        semantics={
            "death": "If slot index is in range, clear its active option and set deadline now+180. Clear Game+0 tracking option; wrapping-increment guardian kills+664; queue localized slain text, sound8174, JSON account event{type:guardian,name:localized name}; request kind1 pickup amount wrapping25+5*postincrementKills at death position; attempt scheduled magnet; wrapping-increment pending guardian deaths+8f8.",
            "gold": "Pickup creation dispatch1469acda4 entry1 selects1454c8f60, object entry9004/model2614/scale0.6. Collection dispatch1469acc54 entry1 selects1454a5c33: roundf(amount*Game+488) saturated to u32; wrapping-add to gold+408 and earned+66c; update field0x498=gold*10000 wrapping. General collection/entity adapters are separate owner work.",
            "scheduled_magnet": "Helper1454c16a0 checks shared queue+680/+688 first deadline only. If empty or head>clock, no draw. Otherwise one native24-bit unit draw; draw>=0.5 leaves queue untouched; success removes first entry preserving order and creates kind6 at deathXY+(-2,+1.5), sameZ. No loop. Kind6 collection emits Magnet! Everything on the field comes to you., proving this is a magnet rather than a soulstone.",
            "pending": "Only when pending+8f8!=0 and runstate+95f==1: capture count, clear+8f8; for each captured death wrapping-increment pending jewelry+8f4 and call shared XP owner with max(1,threshold.saturating_sub(currentXP)). Reevaluate current level and XP on each iteration; no inner runstate recheck. Final jewelry request requires+8f4!=0,+958==0,state1.",
            "threshold": "roundf(0.35*n*n+(4*n+5)) as saturatedu32, n=level.saturating_sub(1), with separate original f32 multiplies/adds in the recorded order.",
            "shared_xp_owner": "1454b4920 wrapping-adds XP, subtracts thresholds and increments level while level<=98 and XP covers threshold. It increments pending level choices+8ec and may open mode0 spell choice with pause=true, changing state2 before final guardian jewelry gate.",
            "jewelry_choice": "1454da5f0 mode2 routes to shared jewelry generator1454e1d00 with parameter0.25 (mode1 cache passes0). pause=true writes state2 and calls pause adapter. General jewelry eligibility/RNG/card construction/selection and choice completion remain shared owner boundaries.",
            "json_helper_correction": "145450bf0 writes ASCII0x7b='{', beginning a JSON object. That byte is not a guardian event or reward enum tag.",
        },
        limitations=["Static recovery is not original/rebuilt runtime parity.",
                     "The schedule queue's construction and general magnet collection implementation are not reconstructed by rewards.rs.",
                     "General XP stat recomputation, spell choices, jewelry RNG/selection, UI and account persistence require the owning engine.",
                     "Native floats and wrapping arithmetic are preserved in source; a roundf import binding is not itself an executed math fixture."])
    (OUTPUT / "guardian-rewards.json").write_text(portable_json(result, indent=2) + "\n")
    print(json.dumps(dict(slices=len(assembly), constants=len(constants), strings=len(strings), round_import=imported[0][1])))


if __name__ == "__main__":
    main()

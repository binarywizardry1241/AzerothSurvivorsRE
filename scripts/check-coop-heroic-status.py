#!/usr/bin/env python3
"""Replay the current native locked-reason parser with synthetic local memory."""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.121.0/coop-heroic-status/manifest.json"
LOCKED_KEY = "you haven't opened {heroic} of {zone} with this class yet"


def sha(value):
    return hashlib.sha256(value).hexdigest()


def main():
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--apply-locales", action="store_true")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    selected = latest_target(verify=True)
    assert proof["target"] == {k: selected[k] for k in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(selected)
    locale_owner = load_script("coop_status_locale_owner", ROOT / "scripts/check-set-localization.py")
    locale_base = json.loads((ROOT / "docs/analysis/evidence/0.121.0/orb-source.json").read_text())
    assert locale_base["target"] == proof["target"]
    table = locale_base["locale_table"]
    at = int(table["file_offset"], 16)
    assert sha(image[at:at + table["byte_count"]]) == table["sha256"]
    locales = []
    for binding in locale_base["locales"]:
        for name in ("descriptor", "payload"):
            row = binding[name]
            at = int(row["file_offset"], 16)
            raw = image[at:at + row["byte_count"]]
            assert sha(raw) == row["sha256"], (binding["code"], name)
        value = json.loads(raw)[LOCKED_KEY]
        path = ROOT / "crates/azeroth-survivors-re/assets/locales" / (binding["code"] + ".json")
        if args.apply_locales:
            locale_owner.append_selected(path, {LOCKED_KEY: value})
        assert json.loads(path.read_text()).get(LOCKED_KEY) == value, path
        locales.append(dict(code=binding["code"], descriptor=binding["descriptor"],
            payload=binding["payload"], source_path=str(path.relative_to(ROOT)), value=value))
    locale_proof = dict(target=proof["target"], gap_ids=[238], key=LOCKED_KEY,
        locale_table=table, locales=locales, native_consumer="0x1402735c3",
        compilation="not_run", application_executed=False, parity_verified=False)
    locale_path = MANIFEST.with_name("localization.json")
    if args.write:
        locale_path.write_text(portable_json(locale_proof, ensure_ascii=False, indent=2) + "\n")
    else:
        assert portable_record(json.loads(locale_path.read_text())) == portable_record(locale_proof)
    pe = load_script("coop_heroic_status_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    query = proof["query"]
    result = json.loads((ROOT / query["result"]["path"]).read_text())
    assert sha((ROOT / query["result"]["path"]).read_bytes()) == query["result"]["sha256"]
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
    verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe)
    assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
    clamp = proof["rank_clamp"]
    clamp_address = int(clamp["virtual_address"], 16)
    at = pe.rva_offset(clamp_address - pe.image_base)
    clamp_code = bytes.fromhex(clamp["bytes_hex"])
    assert at == int(clamp["file_offset"], 16)
    assert image[at:at + len(clamp_code)] == clamp_code and sha(clamp_code) == clamp["sha256"]
    base = int(query["slice_virtual_address"], 16)
    code = (ROOT / query["raw_input"]["path"]).read_bytes()
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(base & ~4095, 0x2000)
    machine.mem_write(base, code)
    machine.mem_map(clamp_address & ~4095, 0x1000)
    machine.mem_write(clamp_address, clamp_code)
    machine.mem_map(0x22000000, 0x10000)
    machine.mem_map(0x23000000, 0x10000)
    observed = {}
    steps = 0

    def hook(uc, address, _size, _context):
        nonlocal steps
        steps += 1
        # Stop before the generic zone/localization interfaces. The actual
        # native parser already selected its zone substring and rank branch.
        if address in (0x140272e8e, 0x1402735a8):
            pointer = uc.reg_read(reg.UC_X86_REG_RCX)
            count = uc.reg_read(reg.UC_X86_REG_RDX)
            observed["zone"] = bytes(uc.mem_read(pointer, count)).decode()
            observed["rank"] = uc.reg_read(reg.UC_X86_REG_R14) & 255 if address == 0x1402735a8 else None
            uc.emu_stop()
    machine.hook_add(UC_HOOK_CODE, hook)

    cases = 0
    digest = hashlib.sha256()
    zones = ("elwynn", "duskwood", "wsg", "ungoro", "ab", "feralas", "arena", "sm", "av", "brm", "aq", "naxx")
    invalid = (None, "", "+", "-0", "-1", "256", "999", "3:4", " 3", "3 ", "x", "++3")
    for zone in zones:
        for suffix in list(invalid) + [str(n) for n in range(256)] + ["+0", "+03", "+255", "003"]:
            raw = ("locked:" + zone + ("" if suffix is None else ":" + suffix)).encode()
            machine.mem_write(0x22001000, raw)
            machine.mem_write(0x22000020, struct.pack("<QQ", 0x22001000, len(raw)))
            machine.reg_write(reg.UC_X86_REG_R8, 0x22000000)
            machine.reg_write(reg.UC_X86_REG_RSP, 0x23007f00)
            observed.clear()
            machine.emu_start(base, base + len(code), count=10000)
            expected_rank = None
            if suffix is not None:
                decimal = suffix[1:] if suffix.startswith("+") else suffix
                if decimal and all("0" <= char <= "9" for char in decimal):
                    value = int(decimal)
                    if value < 256:
                        expected_rank = value
            assert observed == {"zone": zone, "rank": expected_rank}, (raw, observed)
            cases += 1
            digest.update(raw + b"\0" + json.dumps(observed, sort_keys=True).encode())
    for rank in range(256):
        machine.reg_write(reg.UC_X86_REG_RCX, rank)
        machine.emu_start(clamp_address, clamp_address + 14, count=100)
        assert machine.reg_read(reg.UC_X86_REG_RAX) == min(rank, 5)
    source = (ROOT / "crates/azeroth-survivors-re/src/coop_ui.rs").read_text()
    for fragment in ("key.split_once(':')", "rank.parse::<u8>().ok()",
                     "rank.min(azeroth_survivors_re::heroic::MAX_RANK)",
                     "azeroth_survivors_re::heroic::rank_name(",
                     LOCKED_KEY):
        assert fragment in source, fragment
    result = {"target": proof["target"], "parser_cases": cases, "rank_clamp_cases": 256,
              "parser_cases_sha256": digest.hexdigest(), "original_instruction_steps": steps,
              "source_connection_checked": True, "native_locale_values_verified": len(locales), "compiled": False,
              "seams": ["Stop at native zone lookup before localization/formatting; no UI or game runs."],
              "full_admission_wire_or_private_rewards_recovered": False,
              "parity": "unverified"}
    output = MANIFEST.with_name("static-check.json")
    if args.write:
        output.write_text(portable_json(result, indent=2) + "\n")
    elif output.exists():
        assert portable_record(result) == portable_record(json.loads(output.read_text()))
    print(json.dumps(result))


if __name__ == "__main__":
    main()

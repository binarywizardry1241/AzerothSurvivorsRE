#!/usr/bin/env python3
"""Check selected-target local realm bindings without compiling or running a game.

Reuses the canonical addon zone catalog. Fresh Ghidra responses stay ignored;
the reviewed realm constructor and opcode-16 sender ranges own these contracts.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess


ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
CATALOG = ROOT / "crates/azeroth-survivors-re/assets/addon-zones-0.105.0.json"
RANGES = {
    "realm-constructor": (0x1459B1260, 0x1459B1448),
    "realm-count-and-port": (0x1458967E6, 0x1458968F9),
    "realm-list-call": (0x145896A82, 0x145896B23),
    "realm-sender": (0x14596250C, 0x145962871),
    "realm-sender-footer": (0x145962C70, 0x145962D3E),
}
AUTH_RANGES = {
    "auth-client-normalize": (0x140F5C210, 0x140F5C3F4),
    "auth-server-normalize": (0x1458DE850, 0x1458DEA33),
    "auth-fixed-password": (0x145896B4E, 0x145896BE0),
    "auth-server-credentials": (0x145963E3E, 0x145963F4E),
    "auth-server-proof-success": (0x145963A02, 0x145963AC4),
    "auth-client-credential-calls": (0x140EA2481, 0x140EA2512),
    "auth-client-proof-compare": (0x145A1C199, 0x145A1C27D),
    "auth-client-proof-result": (0x140EA4935, 0x140EA4964),
    "auth-client-proof-error": (0x140EA4F34, 0x140EA4F89),
}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def f32(value):
    return _shared_f32(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=ROOT / "runtime/analysis/history/interface/stock-realms/c9f14f3b788e")
    args = parser.parse_args()
    output = args.output.resolve()
    require(output.is_relative_to(ROOT / "runtime"), "Generated output must remain in runtime/")
    data = TARGET.read_bytes()
    require(hashlib.sha256(data).hexdigest() == SHA, "Selected EXE SHA-256 mismatch")
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    def bytes_at(address, expected):
        require(raw(address, len(expected)) == expected, f"Native instruction changed at {address:#x}")

    for address, count, digest in [
        (0x1459B1260, 488, "f9889ab62998890667d96118455a6e0c5a23c9f5c5f48a5d8164d9d922e3ac30"),
        (0x1459623B0, 10370, "27e1535e98f41b38e06bfd08f4a6eb1bd45e4b594735d4e2ae0daa37d07797fd"),
        (0x140F5C210, 484, "4ee7dd203e23a0e59417b528c26ca6f6888cc5cf5afcb6851833a21109ad6d02"),
        (0x1458DE850, 483, "146841ad4be88a8e5c1fd1703b7ed49ce075610753ca816f324028e864805c08"),
        (0x145A1BE80, 1180, "3c5bc226179fc05d7b24f7a51f371a32b8ff3a4e43d93cd0105daee6f41de8f4"),
    ]:
        require(hashlib.sha256(raw(address, count)).hexdigest() == digest,
                f"Ghidra-bound function bytes changed at {address:#x}")

    # These values are instruction operands, not guesses based on the normal WoW protocol.
    bytes_at(0x1459625F2, bytes.fromhex("c7043001000000"))  # realm_type u32 = 1
    bytes_at(0x145962624, bytes.fromhex("c644300400"))  # flags = 0
    bytes_at(0x145962798, bytes.fromhex("c644300501"))  # category = 1
    bytes_at(0x14596259C, bytes.fromhex("4531ff"))  # id accumulator starts at zero
    bytes_at(0x1459625B4, bytes.fromhex("41fec7"))  # increment before id store
    bytes_at(0x1459625BE, bytes.fromhex("44887c3006"))  # id = index + 1
    bytes_at(0x145896826, bytes.fromhex("4981ffff000000"))  # roster count comparison
    bytes_at(0x14589682D, bytes.fromhex("b8ff000000"))
    bytes_at(0x145896832, bytes.fromhex("490f42c7"))  # min(roster count, 255)
    bytes_at(0x1459B12DC, bytes.fromhex("81c7951f0000"))  # initial world port = 8085
    bytes_at(0x1459B13F0, bytes.fromhex("ffc7"))
    bytes_at(0x1459B1394, bytes.fromhex("f3410f104424d0"))  # f32 zone difficulty
    bytes_at(0x1459B139B, bytes.fromhex("f30f59c0"))  # population = difficulty squared
    bytes_at(0x1459B12B1, bytes.fromhex("4d8b742420"))  # zone name length
    bytes_at(0x1459B1309, bytes.fromhex("4d8bbc2408ffffff"))  # zone name pointer
    require(raw(0x1471B52D0, 13) == b"azeroth.local", "Realm host changed")
    bytes_at(0x145896B6B, bytes.fromhex("48b97375727669766f72"))  # fixed survivor
    bytes_at(0x145963A35, bytes.fromhex("c6043001"))  # proof response opcode = 1
    bytes_at(0x145963A61, bytes.fromhex("c644300100"))  # proof result = success
    bytes_at(0x145F949F3, b"\x29server proof mismatch (wrong password?): ")
    catalog = json.loads(CATALOG.read_text())
    require(len(catalog) == 12, "Expected twelve canonical zone rows")
    realms = []
    for index, row in enumerate(catalog):
        address = 0x146BA9450 + index * 0xF0
        record = raw(address, 0xF0)
        key_at, key_len = struct.unpack_from("<QQ", record, 8)
        name_at, name_len = struct.unpack_from("<QQ", record, 0x18)
        difficulty = struct.unpack_from("<f", record, 0xE0)[0]
        require(raw(key_at, key_len).decode() == row["key"], f"Zone key mismatch at {index}")
        require(raw(name_at, name_len).decode() == row["name"], f"Zone name mismatch at {index}")
        require(difficulty == row["difficulty_f32"], f"Zone difficulty mismatch at {index}")
        population = f32(difficulty * difficulty)
        realms.append({"zone_key": row["key"], "name": row["name"],
                       "address": f"azeroth.local:{8085 + index}",
                       "population_f32": population,
                       "population_bits": struct.pack("<f", population).hex(),
                       "realm_type": 1, "flags": 0, "category": 1, "id": index + 1})
    output.mkdir(parents=True, exist_ok=True)
    def extract_ranges(definitions):
        ranges = []
        for role, (start, end) in definitions.items():
            value = raw(start, end - start)
            assembly = objdump_output(
                ["objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                 f"--stop-address={end:#x}", str(TARGET)], cwd=ROOT, text=True)
            (output / f"{role}.asm").write_text(assembly.replace(str(TARGET), str(TARGET.relative_to(ROOT))))
            ranges.append({"role": role, "virtual_address": hex(start), "end_exclusive": hex(end),
                           "file_offset": hex(pe.rva_offset(start - pe.image_base)),
                           "byte_count": len(value), "sha256": hashlib.sha256(value).hexdigest(),
                           "assembly": f"{role}.asm"})
        return ranges

    ranges = extract_ranges(RANGES)
    report = {
        "target": str(TARGET.relative_to(ROOT)), "target_sha256": SHA,
        "canonical_catalog": str(CATALOG.relative_to(ROOT)), "ranges": ranges,
        "rea": [
            {"role": "realm-constructor", "provider": "ghidra", "virtual_address": "0x1459b1260",
             "byte_count": 488, "sha256": "f9889ab62998890667d96118455a6e0c5a23c9f5c5f48a5d8164d9d922e3ac30",
             "evidence_id": "ev_76da8c076af8032ebe5999a300c9cf178c890999f10fa6b1bab57b3e8b3c4342"},
            {"role": "auth-service", "provider": "ghidra", "virtual_address": "0x1459623b0",
             "byte_count": 10370, "sha256": "27e1535e98f41b38e06bfd08f4a6eb1bd45e4b594735d4e2ae0daa37d07797fd",
             "evidence_id": "ev_01407946dd48e46837c3d5792f53acb6ed14200a58fb1d06a83b946214940a69"}],
        "realms": realms,
        "characters": "Every realm receives min(native roster projection length,255), captured when local auth connection is created.",
        "world_zone_selection": "u16 accepted port minus8085 saturates below zero, then index>=12 selects zero; selected zone key is copied to connection+98/+a0.",
        "checks": "Selected EXE hash, exact current instruction operands, all12 canonical zone names/keys/f32 difficulties and derived realm bindings.",
        "limits": ["Source catalog and native static contracts checked; source compilation and runtime behavior remain unverified.",
                   "Fresh Ghidra raw slices omit external callees/data and use generic compiler types. Selected PE instructions corroborate constants and data flow.",
                   "No target or rebuilt application was executed; no original/rebuilt parity comparison."]}
    (output / "contracts.json").write_text(portable_json(report, indent=2) + "\n")
    def normalize(value):
        encoded = value.encode("utf-8")
        if not 1 <= len(encoded) <= 16 or any(byte < 0x20 or byte > 0x7e for byte in encoded):
            return None
        return encoded.upper().decode("ascii")

    cases = [("HERO", "survivor", True), ("Other", "suRViVor", True),
             (" ", "survivor", True), ("1234567890123456", "survivor", True),
             ("", "survivor", False), ("12345678901234567", "survivor", False),
             ("é", "survivor", False), ("HERO\n", "survivor", False),
             ("HERO\x7f", "survivor", False), ("HERO", "wrong", False),
             ("HERO", " survivor", False), ("HERO", "survivor ", False)]
    vectors = []
    for account, password, expected in cases:
        accepted = normalize(account) is not None and normalize(password) == "SURVIVOR"
        require(accepted == expected, "Recovered normalization vector mismatch")
        vectors.append({"account": account, "password": password, "accepted": accepted})
    auth = {
        "target": report["target"], "target_sha256": SHA,
        "ranges": extract_ranges(AUTH_RANGES),
        "rea": [
            {"role": "server-normalize", "provider": "ghidra", "virtual_address": "0x1458de850",
             "byte_count": 483, "sha256": "146841ad4be88a8e5c1fd1703b7ed49ce075610753ca816f324028e864805c08",
             "evidence_id": "ev_edc94c6379a31780c4b2b31a802b3497f38c178ab92d49e8392e3c7bdb4a8911"},
            {"role": "client-proof-verifier", "provider": "ghidra", "virtual_address": "0x145a1be80",
             "byte_count": 1180, "sha256": "3c5bc226179fc05d7b24f7a51f371a32b8ff3a4e43d93cd0105daee6f41de8f4",
             "evidence_id": "ev_253510b0b675e671cf69fedb917d9d5503cf00a959e1ccf8377c814389277e87"},
            report["rea"][1]],
        "normalization": "Both credentials:1..16 UTF-8 bytes, every decoded scalar in printable ASCII0x20..0x7e; uppercase ASCII a..z; no trimming.",
        "server_credentials": "Challenge username is normalized and used for SRP derivation; there is no HERO equality guard. Auth connection stores fixed survivor password, normalized to SURVIVOR. Invalid server normalization falls back to A, but client rejects such input first.",
        "proof_failure": "Local server writes opcode1,result0 with its M2; client computes and compares20 proof bytes. Mismatch returns-1, and caller wraps an ordinary server proof mismatch error rather than an AuthReject protocol code.",
        "adapter_mapping": "Local AuthenticationFailed reuses GlueMgr.on_failed with LoginFailedMessage.refusal=None. Existing Benilla manager maps this to LOGIN_FAILED_STATE5 and RESULT_DISCONNECTED0x14; that manager mapping is source behavior, not a newly recovered native constant.",
        "credential_vectors": vectors,
        "checks": "Selected EXE hash, complete normalizer/proof-verifier hashes, fixed password/opcode/result instructions and error literal;12 model vectors from recovered normalization. These vectors do not execute rebuilt Rust.",
        "limits": report["limits"]}
    (output / "auth-contract.json").write_text(portable_json(auth, indent=2) + "\n")
    print("Verified selected EXE,12 realm bindings, count/wire constants and12 recovered credential vectors")


if __name__ == "__main__":
    main()

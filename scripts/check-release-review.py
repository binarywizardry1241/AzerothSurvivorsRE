#!/usr/bin/env python3
"""Check bounded release evidence; never compile or execute a game.

Configured installed EXE bytes, source receipts and supplied notes are required.
Saved Ghidra query payloads are local optional evidence unless explicitly required.
This checks selected records/references, not gameplay predicates or parity.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, artifact_path, latest_target, project_path, target_bytes
from script_sources import load_script

SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
EVIDENCE = ROOT / "docs/analysis/evidence/release-review.json"
# Exact reviewed populations, not count-only admission or an automatic rebaseline.
# A changed source/native/query receipt requires a new review of that population.
POPULATION_DIGESTS = {
    "discord_invite_repair": "7eb11246842d9efd9d8c739a38166fe39565021bfea6141c9daaf75474f8dbed",
    "target": "c457609663a9fa9154b027f3c88b020b35f63e2640dfa57f00b7a3149d663901",
    "source_receipts": "b92ef8e7cd891352afe008bd580da92f76e88b797301ad76e7338cb474063c12",
    "release_items": "28d122af5fcc160a63d7c5445d58967fb5426633fd01a609fb1a7b6be9ef4e35",
    "source_counts": "bca0e85fb1c08418362f58eec99279bda501c9df6ea06750a67a2e6267290c61",
    "achievement_text": "5d2bebb170f61813409a301820cac116bf6d66ac7bf2d77836ed35a1eab14b80",
    "cosmetics": "04ece4f69caab355119f0e8a066746b8f30fd29f98b90f3ea5df0147b295154a",
    "tabard": "ea1c6cb01c27e010c4f73ca93c3abb8641230186a9977f432119485a437c8e93",
    "companions": "c568a44234d1a924463083d74ebfb845bdcf2bfe8a12ad0ac2d46e8b74801454",
    "literals": "475cae92d66d65aeddb49ce987ca7c7e0609ffaa007ffdeed7d167f742477827",
    "native_leads": "a33051d4b020a51691ea6f6299bea2a9cec543bbd13167ac6de7977855537ac4",
    "query_receipts": "5ddb0fbad701d5d28f74d674bdc02612a4b9d8208c9bc9f41d738b0441af1ff3",
}
ACHIEVEMENT_KEYS = (
    "together", "fiveofakind", "photosynthesis", "odds", "brotherhood", "bump", "team",
    "jurassic", "smoothie", "holyframe", "dragonslayers", "totemly", "oldgods", "end",
)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def validate_populations(evidence):
    """Reject missing, duplicated, substituted or rebound reviewed evidence."""
    def require(condition, message):
        if not condition:
            raise ValueError(message)

    try:
        require([row["id"] for row in evidence["cosmetics"]] == list(range(90108, 90115)),
                "cosmetics population must contain each reviewed ID once in native order")
        companions = evidence["companions"]
        require([row["key"] for row in companions] ==
                ["ancient_protector", "herod", "nefarian", "bigglesworth"] and
                [row["creature_id"] for row in companions] == list(range(9623, 9627)),
                "companions population differs from the four reviewed identities")
        require(evidence["tabard"]["id"] == 90025, "tabard population substitutes its identity")
        require([row["key"]["text"] for row in evidence["achievement_text"]] ==
                ["coop:" + key for key in ACHIEVEMENT_KEYS], "achievement_text population differs")
        sources = evidence["source_receipts"]
        require(len(sources) == len({row["path"] for row in sources}) == 18,
                "source_receipts population must have eighteen distinct paths")
        for kind, copies in [("cosmetics", 3), ("companions", 4), ("tabard", 3)]:
            rows = [evidence[kind]] if kind == "tabard" else evidence[kind]
            offsets = [record["file_offset"] for row in rows for record in row["records"]]
            require(all(len(row["records"]) == copies for row in rows) and
                    len(offsets) == len(set(offsets)), kind + " record population is incomplete or duplicated")
        leads = evidence["native_leads"]["rip_relative_lea_matches"]
        require(len(leads) == len({row["site"] for row in leads}) == 109,
                "native_leads population must have 109 distinct sites")
        queries = evidence["query_receipts"]
        require([(row["extract"]["label"], row["extract"]["va"]) for row in queries] ==
                [("coopbeat-parser", "0x145c0e650"), ("united-front-text", "0x145ac4e00")],
                "query_receipts population substitutes or duplicates a selected query")
        for name, expected in POPULATION_DIGESTS.items():
            raw = json.dumps(evidence[name], sort_keys=True, separators=(",", ":"),
                             ensure_ascii=False).encode()
            require(digest(raw) == expected, name + " reviewed population commitment differs")
    except (KeyError, TypeError) as error:
        raise ValueError("Malformed or missing release-review population") from error


def check_windows_crash_report(require_query):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86 import X86_OP_MEM, X86_REG_RIP

    proof = json.loads(project_path("docs/analysis/evidence/windows-crash-report.json").read_text())
    assert proof["finding_id"] == 326 and proof["schema_version"] == 1
    selected = latest_target(verify=False)
    assert proof["target"] == {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    data = target_bytes(selected)
    pe = load_script("release_review_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    frontier = json.loads(project_path(proof["frontier"]["path"]).read_text())
    assert frontier["target"] == proof["target"]
    ranges = [frontier["native_ranges"][key] for key in proof["frontier"]["native_ranges"]]
    ranges.extend(proof["additional_ranges"].values())
    assert len(ranges) == 8

    def read_at(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        assert pe.rva_offset(address + size - 1 - pe.image_base) == offset + size - 1
        return data[offset:offset + size]

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    instructions = {}
    for row in ranges:
        address = int(row["virtual_address"], 16)
        size = row["byte_count"]
        native = read_at(address, size)
        assert pe.rva_offset(address - pe.image_base) == int(row["file_offset"], 16)
        assert address + size == int(row["end_exclusive"], 16)
        assert digest(native) == row["sha256"]
        decoded = list(decoder.disasm(native, address))
        assert sum(i.size for i in decoded) == size
        instructions.update((i.address, i) for i in decoded)
    assert len(instructions) == proof["static_check"]["verified_instruction_count"]
    assert pe.u64(pe.optional + 72) == 0x800000
    assert pe.u64(pe.optional + 80) == 0x1000

    def rip_target(site, operand):
        instruction = instructions[int(site, 16)]
        memory = instruction.operands[operand]
        assert memory.type == X86_OP_MEM and memory.mem.base == X86_REG_RIP
        return instruction.address + instruction.size + memory.mem.disp

    imports = {int(dll["iat_start_address"], 16) + 8 * i: name
               for dll in pe.imports() for i, name in enumerate(dll["functions"])}
    assert len(proof["windows_import_edges"]) == 12
    for site, name in proof["windows_import_edges"].items():
        assert instructions[int(site, 16)].mnemonic == "call"
        assert imports[rip_target(site, 0)] == name

    def source_order(source, *markers):
        position = 0
        for marker in markers:
            position = source.index(marker, position) + len(marker)

    source = project_path("crates/benilla-app/src/crash/windows.rs").read_text()
    labels = proof["source_contract"]["exception_labels"]
    assert len(labels) == 9
    for value, label in labels.items():
        comparison = instructions[int(label["comparison"], 16)]
        assert comparison.mnemonic == "cmp" and comparison.operands[1].imm == int(value, 16)
        text = label["label"].encode()
        assert read_at(int(label["text_address"], 16), len(text)) == text
        assert f'=> "{label["label"]}"' in source
    text_operands = proof["report_text"] + proof["other_text_operands"]
    assert len(text_operands) == len({row["site"] for row in text_operands}) == 24
    for row in text_operands:
        text = bytes.fromhex(row["bytes"])
        assert read_at(rip_target(row["site"], 1), len(text)) == text
        assert row["source"] in source
    for address, operands in {
        0x14035e955: "r9d, 0x1040", 0x14035ed4e: "r8d, 2", 0x14035ea64: "r15d, 0xc00000fd",
        0x14035f492: "rax, rax", 0x14035f497: "rax, 1", 0x14035f49d: "rax, 8",
        0x14035f9b2: "rax", 0x14035f9b4: "r14d, eax", 0x14035f9b7: "eax, r14d",
    }.items():
        assert instructions[address].op_str == operands
    source_order(source, *(row["source"] for row in proof["report_text"]))
    source_order(source, "REPORTING.swap(true", "reporter.report(exceptions", "previous(exceptions)")
    source_order(source, 'fault-{unix}.dmp', "write_dump(&dump", 'fault-{unix}.txt', "fs::write(&path")
    source_order(source, "fn write_dump(", "File::create(path)", "MiniDumpWriteDump(",
                 "drop(file)", "fs::remove_file(path)")
    assert "MiniDumpWithIndirectlyReferencedMemory | MiniDumpWithThreadInfo" in source
    assert "code != EXCEPTION_STACK_OVERFLOW" in source and "Duration::from_secs(2)" in source
    assert "EXCEPTION_ACCESS_VIOLATION && r.NumberParameters >= 2" in source
    launcher = project_path("crates/azeroth-survivors-re/src/main.rs").read_text()
    source_order(launcher, "install_windows_fault_reporting", "let mut app = App::new()",
                 "benilla_world::log_ring::LogRing", "native_input::device_plugins(plugins)")
    engine = project_path("crates/benilla-app/src/lib.rs").read_text()
    source_order(engine, "pub fn install_windows_fault_reporting", "local_state::diagnostics_dir()",
                 "crash::windows::install")

    query = proof["callback_query"]
    raw = read_at(int(query["raw_base"], 16), query["raw_size_bytes"])
    assert pe.rva_offset(int(query["raw_base"], 16) - pe.image_base) == int(query["raw_file_offset"], 16)
    assert digest(raw) == query["raw_sha256"]
    checksum = query["result_sha256"]
    path = project_path(f"runtime/analysis/objects/{checksum[:2]}/{checksum}")
    if path.is_file():
        payload = path.read_bytes()
        assert digest(payload) == checksum
        record = json.loads(payload)["structuredContent"]
        assert record["evidence_id"] == query["evidence_id"] and record["provider"]["id"] == "ghidra"
        assert record["subject"]["digest"]["sha256"] == query["raw_sha256"]
        assert record["parameters"]["procedure"] == query["procedure"]
    else:
        assert not require_query, "Missing local Windows callback query payload"
    print(f"#326 passed {len(instructions)} instructions, {len(proof['windows_import_edges'])} imports, "
          f"{len(labels)} exception labels, report templates and live source order.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    parser.add_argument("--discord-source-only", action="store_true",
                        help="check only #112's live source receipt; retain every native and query check")
    parser.add_argument("--armory-source-only", action="store_true",
                        help="check only #120/#159's live Armory source receipt; retain every native and query check")
    parser.add_argument("--windows-crash-report", action="store_true",
                        help="check #326's current Windows fault report evidence and live source")
    args = parser.parse_args()
    if args.windows_crash_report:
        if args.discord_source_only or args.armory_source_only:
            parser.error("Windows crash evidence is separate from the 0.117.0 source receipt scopes")
        check_windows_crash_report(args.require_retained_queries)
        return
    if args.discord_source_only and args.armory_source_only:
        parser.error("Choose one source receipt scope")
    evidence = json.loads(EVIDENCE.read_text())
    validate_populations(evidence)
    data = artifact_path("installed-game/AzerothSurvivors.exe").read_bytes()
    assert evidence["schema"] == "as-release-review-v1"
    assert evidence["target"]["version"] == "0.117.0"
    assert evidence["target"]["sha256"] == digest(data) == SHA
    assert evidence["target"]["size"] == len(data) == 145283072
    pe = load_script("release_review_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def offset(address):
        result = pe.rva_offset(address - pe.image_base)
        assert result is not None
        return result

    def pair(at):
        pointer, size = struct.unpack_from("<QQ", data, at)
        if pointer == 0:
            assert size == 0
            return None
        assert 0 < size < 500
        start = offset(pointer)
        return data[start:start + size].decode("utf-8")

    spans = 0

    def verify_spans(value):
        nonlocal spans
        if isinstance(value, dict):
            if {"file_offset", "byte_count", "sha256"} <= value.keys():
                start, size = int(value["file_offset"], 16), value["byte_count"]
                address = int(value["va"], 16)
                assert size > 0 and offset(address) == start
                assert int(value["end_exclusive"], 16) == address + size
                assert digest(data[start:start + size]) == value["sha256"]
                if "text" in value:
                    assert data[start:start + size] == value["text"].encode("utf-8")
                spans += 1
            for item in value.values():
                verify_spans(item)
        elif isinstance(value, list):
            for item in value:
                verify_spans(item)

    verify_spans(evidence)
    assert spans == 95
    assert len(evidence["source_receipts"]) == 18
    source_receipts = evidence["source_receipts"]
    if args.armory_source_only:
        source_receipts = [row for row in source_receipts
                           if row["path"] == "crates/azeroth-survivors-re/src/armory.rs"]
        assert len(source_receipts) == 1
    elif args.discord_source_only:
        source_receipts = [row for row in source_receipts
                           if row["path"] == evidence["discord_invite_repair"]["source_change"]["path"]]
        assert len(source_receipts) == 1
    for row in source_receipts:
        assert digest(project_path(row["path"]).read_bytes()) == row["sha256"], row["path"]

    notes = (ROOT / "docs/CHANGELOG.md").read_text()
    supplied = []
    for release, count in [("0.116.0", 5), ("0.117.0", 9)]:
        section = notes.split("## " + release + "\n", 1)[1].split("\n## ", 1)[0]
        rows = [line.removeprefix("- ") for line in section.splitlines() if line.strip()]
        assert len(rows) == count
        supplied.extend((release, i + 1, line) for i, line in enumerate(rows))
    items = evidence["release_items"]
    assert supplied == [(row["release"], row["item_ordinal"], row["text"]) for row in items]
    assert [row["finding_id"] for row in items] == list(range(108, 122))
    assert items[-1]["status"] == "informational_acknowledgement_no_executable_obligation"
    assert len(evidence["achievement_text"]) == 14

    for kind, stride, copies in [("cosmetics", 64, 3), ("companions", 96, 4), ("tabard", 64, 3)]:
        rows = [evidence[kind]] if kind == "tabard" else evidence[kind]
        assert len(rows) == {"cosmetics": 7, "companions": 4, "tabard": 1}[kind]
        for row in rows:
            assert len(row["records"]) == copies
            for record in row["records"]:
                at = int(record["file_offset"], 16)
                assert record["byte_count"] == stride
                if kind == "companions":
                    got = dict(zip(("key", "name", "model", "icon", "achievement"),
                                   (pair(at + i) for i in (0, 16, 32, 48, 64))))
                    got.update(zip(("display_id", "scale", "creature_id"),
                                   struct.unpack_from("<IfI", data, at + 80)))
                else:
                    gate = "gate" if kind == "tabard" else "achievement"
                    got = dict(zip(("name", "icon", gate), (pair(at + i) for i in (0, 16, 32))))
                    got.update(zip(("id", "display_id", "cost" if kind == "tabard" else "inventory_type"),
                                   struct.unpack_from("<III", data, at + 48)))
                    if kind == "cosmetics":
                        got["slot"] = data[at + 60]
                assert got == {key: value for key, value in row.items() if key != "records"}

    # Recheck exact instruction bytes, displacement and registered unwind owner.
    # The earlier Capstone whole-owner boundary decode is not rerun here.
    unwind = {(pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions()}
    leads = evidence["native_leads"]
    assert leads["target_sha256"] == SHA and len(leads["rip_relative_lea_matches"]) == 109
    for row in leads["rip_relative_lea_matches"]:
        site, target = int(row["site"], 16), int(row["target"], 16)
        owner, end = int(row["owner"], 16), int(row["end"], 16)
        assert (owner, end) in unwind and owner <= site and site + 7 <= end
        raw = data[offset(site):offset(site) + 7]
        assert raw[0] in (0x48, 0x4c) and raw[1] == 0x8d and raw[2] & 0xc7 == 5
        assert site + 7 + struct.unpack_from("<i", raw, 3)[0] == target

    repair = evidence["discord_invite_repair"]
    assert repair["finding_id"] == 112 and repair["action_tag"] == 12
    destination = evidence["literals"][repair["destination_literal_index"]]
    assert destination["text"] == "https://discord.gg/azerothsurvivors"
    table = int(repair["table_base"], 16)
    entry = int(repair["table_entry"]["va"], 16)
    branch = int(repair["community_branch"]["va"], 16)
    assert entry == table + repair["action_tag"] * 4
    assert table + struct.unpack_from("<i", data, offset(entry))[0] == branch
    # Original Windows-x64 registers bind the literal and byte count to the
    # shared URL helper; raw-slice Ghidra cannot resolve this omitted table.
    at = offset(branch)
    assert data[at:at + 6] == b"\xba\x23\x00\x00\x00\x48"
    assert branch + 12 + struct.unpack_from("<i", data, at + 8)[0] == int(destination["va"], 16)
    assert branch + 17 + struct.unpack_from("<i", data, at + 13)[0] == int(repair["shared_call"]["va"], 16)
    assert destination["byte_count"] == 35
    call = int(repair["shared_call"]["va"], 16)
    assert data[offset(call)] == 0xe8
    assert call + 5 + struct.unpack_from("<i", data, offset(call) + 1)[0] == 0x14013fc50
    change = repair["source_change"]
    source = project_path(change["path"]).read_bytes()
    assert digest(source) == change["sha256"]
    assert source.count(change["added"].encode()) == 1 and change["removed"].encode() not in source
    assert digest(source.replace(change["added"].encode(), change["removed"].encode())) == change["prior_sha256"]

    retained = 0
    assert len(evidence["query_receipts"]) == 2
    assert len(repair["query_receipts"]) == 2
    for row in evidence["query_receipts"] + repair["query_receipts"]:
        extract = row["extract"]
        start, size = int(extract["file_offset"], 16), extract["size"]
        assert offset(int(extract["va"], 16)) == start
        assert int(extract["end_exclusive"], 16) == int(extract["va"], 16) + size
        assert digest(data[start:start + size]) == extract["sha256"]
        paths = [project_path(extract["path"]), project_path(row["plan_path"]),
                 project_path(row["result_path"])]
        if not all(path.is_file() for path in paths):
            assert not args.require_retained_queries, f"Missing local query payload: {paths}"
            continue
        assert paths[0].read_bytes() == data[start:start + size]
        assert digest(paths[1].read_bytes()) == row["plan_sha256"]
        assert digest(paths[2].read_bytes()) == row["result_sha256"]
        plan = json.loads(paths[1].read_text())
        assert project_path(plan["target"]) == paths[0]
        assert plan["open_options"]["entry_point"] == extract["va"]
        result = json.loads(paths[2].read_text())["structuredContent"]
        assert result["evidence_id"] == row["evidence_id"]
        assert result["subject"]["digest"]["sha256"] == extract["sha256"]
        assert result["analysis_profile"]["digest"] == row["analysis_profile_digest"]
        assert result["provider"]["id"] == "ghidra"
        code = result["normalized_result"]
        assert isinstance(code, str) and code.strip()
        assert digest(code.encode()) == row["normalized_pseudocode_sha256"]
        retained += 1
    print(f"Passed {spans} native spans, {len(source_receipts)} source hashes, 14 note mappings, 40 reward records "
          "and 109 LEA byte/owner checks.")
    print("Checked Discord action 12, the exact 35-byte destination, shared helper and single source replacement.")
    print(f"Checked {retained}/4 retained query payload/plan/result receipts.")
    if retained < 4:
        print(f"Not run: {4 - retained} local query receipt checks because payloads are unavailable.")
    print("Earlier Capstone boundary decoding, behavior predicates, compilation, execution and parity are not certified.")


if __name__ == "__main__":
    main()

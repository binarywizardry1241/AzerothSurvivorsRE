#!/usr/bin/env python3
"""Replay the bounded Rewards tabard-name contract without executing native/Rust code.

Requires the existing Capstone installation on PYTHONPATH. --stage writes reviewed
extracts under runtime/; the default verifies the curated proof and live wiring.
No compilation, emulation, application, filesystem override or server execution.
"""
from portable_paths import portable_json

import argparse
import hashlib
import json
import re
import struct

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f"
REL = "docs/analysis/evidence/0.119.0/rewards-tabard-localization"
WORK = ROOT / "runtime/analysis/history/interface/rewards-tabard/dade7ef4383b"
# Each extent was independently located in current .pdata; historical addresses
# were routing leads only. Only the name helper/card need full curated assembly.
FUNCTIONS = [
    ("tabard-name", 0x145AAB4A0, 0x145AAB537, True),
    ("tabard-card", 0x1403470A0, 0x1403476CD, True),
    ("rewards-row-owner-0", 0x140203E00, 0x140204910, False),
    ("rewards-pane-0", 0x14034DB40, 0x14034E053, False),
    ("tabard-grid-caller-0", 0x140209D20, 0x14020A430, False),
    ("tabards-pane-caller-0", 0x14034B650, 0x14034BE0E, False),
    ("rewards-dispatch-0", 0x1402073B0, 0x140207C7F, False),
]
EDGES = [
    (0x145AAB4F4, 0x145B29AB0), (0x1403473A3, 0x145AAB4A0),
    (0x1402048C9, 0x1403470A0), (0x14020A3BD, 0x14034DB40),
    (0x14034B96F, 0x140209D20), (0x140207AF3, 0x14034B650),
] + [(0x14034DBC6 + 57 * index, 0x140203E00) for index in range(21)]


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    path = ROOT / path
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=sha(path.read_bytes()))


def derive(stage):
    target = latest_target(verify=True)
    assert target["version"] == "0.119.0" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("rewards_tabard_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    extents = {(start + pe.image_base, end + pe.image_base) for start, end, _ in pe.functions()}
    instructions, spans, queries = {}, [], []
    dest = WORK / "curated" if stage else ROOT / REL
    if stage:
        dest.mkdir(parents=True, exist_ok=True)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert pe.rva_offset(address - pe.image_base + count - 1) == offset + count - 1
        value = image[offset:offset + count]
        assert len(value) == count
        return value

    def span(role, address, count):
        return dict(role=role, va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=count, sha256=sha(raw(address, count)))

    for name, start, end, retain_assembly in FUNCTIONS:
        assert (start, end) in extents
        code = raw(start, end - start)
        decoded = list(md.disasm(code, start))
        assert sum(i.size for i in decoded) == len(code)
        instructions.update({i.address: i for i in decoded})
        item = span(name, start, len(code))
        if retain_assembly:
            assembly = "\n".join(f"{i.address:016x}  {i.bytes.hex():22s} {i.mnemonic} {i.op_str}".rstrip()
                                 for i in decoded) + "\n"
            if stage:
                (dest / (name + ".asm")).write_text(assembly)
            else:
                assert (dest / (name + ".asm")).read_text() == assembly
            item["assembly"] = dict(path=f"{REL}/{name}.asm", sha256=sha(assembly.encode()))
        spans.append(item)
        # Query journals/results remain reusable evidence. The portable proof
        # preserves their commitments; optional --queries verifies local copies.
        if stage:
            folder = WORK / (name + "-query")
            journal = json.loads((folder / "journal.json").read_text())
            assert journal["status"] == "completed"
            assert len(journal["operations"]) == 1
            assert all(op["status"] == "completed" for op in journal["operations"].values())
            results = list((folder / "results").glob("*.json"))
            assert len(results) == 1
            result = json.loads(results[0].read_text())["structuredContent"]
            assert result["parameters"]["procedure"] == hex(start)
            assert result["subject"]["digest"]["sha256"] == sha(code)
            assert result["provider"]["id"] == "ghidra"
            value = result["normalized_result"]
            assert value and result["operation"] == "procedure_pseudo_code"
            if name == "tabard-name":
                exported = "\n".join(line.rstrip() for line in value.splitlines()).strip("\n") + "\n"
                (dest / "tabard-name.c").write_text(exported)
            queries.append(dict(function=name, procedure=hex(start), status="completed",
                                evidence_id=result["evidence_id"],
                                analysis_profile_digest=result["analysis_profile"]["digest"],
                                pseudocode_sha256=sha(value.encode()), raw_input_sha256=sha(code),
                                plan=receipt(folder / "plan.json"), journal=receipt(folder / "journal.json"),
                                result=receipt(results[0])))
            if name == "tabard-name":
                queries[-1]["pseudocode_export"] = dict(sha256=sha(exported.encode()),
                    normalization="Trailing line whitespace and outer blank lines removed; one final LF. Original result hash retained separately.")

    for site, callee in EDGES:
        i = instructions[site]
        assert i.mnemonic == "call" and i.op_str == hex(callee)
    expected = {
        0x145AAB4BA: ("lea", "rax, [rcx + 0x30]"),
        0x145AAB51E: ("test", "rdi, rdi"),
        0x145AAB521: ("cmovne", "rsi, rdi"),
        0x145AAB525: ("cmove", "rdx, rbx"),
        0x14034B6B5: ("movzx", "r12d, byte ptr [r14 + 0x74]"),
        0x14034B6BA: ("cmp", "r12d, 2"),
        0x14034B947: ("jne", "0x14034b979"),
    }
    assert all((instructions[a].mnemonic, instructions[a].op_str) == value for a, value in expected.items())
    for site, target_address in [(0x145AAB4C2, 0x145F789E0), (0x145AAB4CD, 0x1472C8640)]:
        i = instructions[site]
        assert i.mnemonic == "lea" and i.address + i.size + struct.unpack("<i", i.bytes[-4:])[0] == target_address
    # The shared Display adapter's input boundary reads u32 and selects radix 10;
    # surrounding generic integer formatting is outside this AS repair.
    assert raw(0x145F789ED, 8).hex() == "8b0941b80a000000"
    assert raw(0x1472C8640, 10).hex() == "077461626172642ec000"

    assets = ROOT / "crates/azeroth-survivors-re/assets"
    base = json.loads((assets / "rewards-catalogs-0.112.0.json").read_text())["tabards"]
    additions = json.loads((assets / "party-rewards-0.117.0.json").read_text())
    index = additions["tabard_insertion_index"]
    base[index:index] = additions["tabards"]
    rows = []
    for index, entry in enumerate(base):
        address = 0x1461ADA50 + 64 * index
        pointer, size = struct.unpack("<QQ", raw(address, 16))
        item_id = struct.unpack("<I", raw(address + 48, 4))[0]
        name = raw(pointer, size).decode()
        assert (item_id, name) == (entry["id"], entry["name"])
        # Each grid argument is an actual RIP-relative descriptor address.
        site = 0x14034DB98 if index == 0 else 0x14034DBD6 + 57 * (index - 1)
        i = instructions[site]
        assert i.mnemonic == "lea" and i.address + i.size + struct.unpack("<i", i.bytes[-4:])[0] == address
        rows.append(dict(id=item_id, name=name, key=f"tabard.{item_id}", descriptor_va=hex(address)))
    assert len(rows) == 21
    locale_proof = json.loads((ROOT / "docs/analysis/evidence/0.119.0/locale-catalog-review.json").read_text())
    assert locale_proof["target"]["sha256"] == SHA
    locales = []
    for locale in locale_proof["locales"]:
        record = locale["payload"]
        payload = raw(int(record["virtual_address"], 16), record["byte_count"])
        assert sha(payload) == record["sha256"]
        catalog = json.loads(payload)
        source = json.loads((assets / "locales" / (locale["code"] + ".json")).read_text())
        assert all(row["key"] in catalog and source.get(row["key"]) == catalog[row["key"]] for row in rows)
        assert not any(row["name"] in catalog for row in rows)
        values = {row["key"]: catalog[row["key"]] for row in rows}
        locales.append(dict(code=locale["code"], payload_sha256=record["sha256"],
                            tabard_values_sha256=sha(json.dumps(values, ensure_ascii=False, sort_keys=True).encode())))

    source = ROOT / "crates/azeroth-survivors-re/src/progression/rewards.rs"
    text = re.sub(r"\s+", "", source.read_text())
    assert 'text(body,art,labels.labels.get(&format!("tabard.{}",tabard.id)).unwrap_or(&tabard.name),13.,PAPER,);' in text
    assert 'ifview.rewards_tab==2{tabards(right,art,images,labels,catalog,owned,plan,menu);return;}' in text
    progression = (ROOT / "crates/azeroth-survivors-re/src/progression.rs").read_text()
    assert 'Page::Rewards' in progression and 'rewards::draw(ui, &art, &images, &labels, &catalog, &account, &menu, &view)' in progression
    proof = dict(schema_version=1, finding_id=171,
                 target={k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
                 native_spans=spans, data_spans=[span("tabard-ID-format", 0x1472C8640, 10),
                                                span("u32-ID-read-and-radix-10", 0x145F789ED, 8),
                                                span("Rewards-tabard-descriptors", 0x1461ADA50, 21 * 64)],
                 direct_call_edges=[dict(site=hex(a), callee=hex(b)) for a, b in EDGES],
                 descriptors=rows, locales=locales,
                 source=receipt(source), query_receipts=queries,
                 limits="Bounded native name/card/tab-2/grid input contract and source wiring only; raw Ghidra imports omit globals/imports and infer GCC ABI. Independent PE decoding establishes Windows-x64 flow. Complete screen/input/loader behavior, compilation, execution and original/rebuilt parity are unverified.")
    if stage:
        (dest / "contracts.json").write_text(portable_json(proof, ensure_ascii=False, indent=2) + "\n")
    else:
        kept = json.loads((dest / "contracts.json").read_text())
        proof["query_receipts"] = kept["query_receipts"]
        assert proof == kept, "Curated proof/source changed; review --stage output"
        assert sha((dest / "tabard-name.c").read_bytes()) == next(q["pseudocode_export"]["sha256"] for q in kept["query_receipts"] if q["function"] == "tabard-name")
    return proof


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    parser.add_argument("--queries", action="store_true", help="Also verify retained local query receipts")
    args = parser.parse_args()
    proof = derive(args.stage)
    if args.queries:
        for query in proof["query_receipts"]:
            for field in ("plan", "journal", "result"):
                assert receipt(query[field]["path"]) == query[field]
    print(json.dumps(dict(target="0.119.0", native_functions=len(proof["native_spans"]),
                          native_call_edges=len(EDGES), tabards=21, locales=len(proof["locales"]),
                          compilation=False, native_execution=False, parity_verified=False)))


if __name__ == "__main__":
    main()

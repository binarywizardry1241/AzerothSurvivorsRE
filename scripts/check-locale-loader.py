#!/usr/bin/env python3
"""Check bounded AS locale loader/parser/lookup evidence without executing code.

--collect stages a fresh compact manifest and canonical assembly/pseudocode under
runtime for review. Default verifies retained evidence, selected native bytes,
Ghidra receipts, relative control flow and source interface guards. No builds,
emulation, game, server or filesystem-override execution.
"""

import argparse
import hashlib
import json
import re

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f"
WORK = ROOT / "runtime/analysis/history/findings/gap169-loader/a44cb166d16b"
RETAINED = ROOT / "docs/analysis/evidence/localization-loader"
STAGED = ROOT / "runtime/analysis/staging/native-evidence/localization-loader"
FUNCTIONS = [
    ("hex", 0x145B26F00, 0x1458E9020),
    ("expect", 0x145B273B0, 0x1458E94D0),
    ("string", 0x145B275C0, 0x1458E96E0),
    ("override-loader", 0x145B28E50, 0x1458EB8A0),
    ("lookup", 0x145B29AB0, None),
    ("parser", 0x145B2B1D0, 0x1458ED780),
    ("lazy-callback", 0x145B59E40, 0x1458E89D0),
    ("initializer", 0x145C13E00, 0x1459D19A0),
    ("embedded-map", 0x145AA77A0, 0x14599FF20),
    ("override-insert", 0x145B4BFD0, 0x1459A13C0),
]


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=digest(path.read_bytes()))


def encoded(value):
    return (json.dumps(value, ensure_ascii=False, indent=2) + "\n").encode()


def normal(text):
    # Only static address operands are abstracted. Registers, scalar immediates,
    # structure displacements, opcodes, instruction lengths and internal branch
    # destinations retain independent checks; relocated calls/RIP operands are
    # listed in the new manifest rather than assigned historical semantics.
    text = re.sub(r"\[rip [+-] 0x[0-9a-f]+\]", "[rip ADDRESS]", text)
    return re.sub(r"0x[0-9a-f]+", lambda match: "ADDRESS"
                  if 0x140000000 <= int(match[0], 16) < 0x149000000 else match[0], text)


def derive(destination, collect):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP

    selected = latest_target(verify=True)
    assert selected["version"] == "0.119.0" and selected["sha256"] == SHA
    image = target_bytes(selected)
    pe = load_script("locale_loader_PE", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    spans, structure, queries = [], [], []
    functions = {pe.image_base + a: (pe.image_base + b) for a, b, _ in pe.functions()}
    for role, start, historical in FUNCTIONS:
        end = functions[start]
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        instructions = list(decoder.disasm(raw, start))
        assert sum(item.size for item in instructions) == len(raw), role
        assembly = "".join(f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip() + "\n"
                           for item in instructions).encode()
        asm = destination / f"{role}.asm"
        if collect:
            asm.write_bytes(assembly)
        assert asm.read_bytes() == assembly
        calls, references = [], []
        for item in instructions:
            if item.mnemonic == "call" and item.operands[0].type == X86_OP_IMM:
                calls.append(dict(va=hex(item.address), target=hex(item.operands[0].imm), bytes=item.bytes.hex()))
            for operand in item.operands:
                if operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                    references.append(dict(va=hex(item.address), target=hex(item.address + item.size + operand.mem.disp),
                                           bytes=item.bytes.hex()))
        row = dict(role=role, va=hex(start), end_exclusive=hex(end), file_offset=hex(offset),
                   byte_count=len(raw), sha256=digest(raw), instructions=len(instructions),
                   assembly=dict(path=asm.name, sha256=digest(assembly)), calls=calls, RIP_references=references)
        query = WORK / f"{start:x}-query"
        journal = json.loads((query / "journal.json").read_text())
        operations = [value for value in journal["operations"].values()
                      if value.get("name") == "procedure_pseudo_code"]
        assert journal["status"] == "completed" and len(operations) == 1
        assert operations[0]["status"] == "completed"
        assert operations[0]["arguments"] == {"procedure": hex(start)}
        # Result filenames are operation commitments; exactly one is expected in
        # these one-operation plans, and its original content remains retained.
        results = list((query / "results").glob("*.json"))
        assert len(results) == 1, role
        assert operations[0]["result"] == receipt(results[0]), role
        result = json.loads(results[0].read_text())["structuredContent"]
        assert result["parameters"]["procedure"] == hex(start)
        assert result["subject"]["digest"]["sha256"] == digest(raw)
        pseudo = ("/* Ghidra raw-binary import; external memory/callees absent; inferred ABI.\n"
                  " * Original PE instructions govern Windows-x64 arguments and globals. */\n" +
                  result["raw_result"]["value"])
        # Canonical text removes only trailing whitespace; the original result
        # remains hash-bound in the query journal.
        pseudo = ("\n".join(line.rstrip() for line in pseudo.splitlines()).rstrip() + "\n").encode()
        pseudo_path = destination / f"{role}.c"
        if collect:
            pseudo_path.write_bytes(pseudo)
        assert pseudo_path.read_bytes() == pseudo
        row["pseudocode"] = dict(path=pseudo_path.name, sha256=digest(pseudo))
        queries.append(dict(role=role, evidence_id=result["evidence_id"],
                            analysis_profile=result["analysis_profile"]["digest"],
                            plan=receipt(WORK / f"{start:x}-plan.json"), journal=receipt(query / "journal.json"),
                            result=receipt(results[0])))
        if historical:
            old = ROOT / f"docs/analysis/evidence/localization/{historical:x}.asm"
            lines = [re.match(r"(0x[0-9a-f]+): (.*)", line).groups()
                     for line in old.read_text().splitlines() if re.match(r"0x", line)]
            assert len(lines) == len(instructions), role
            for (address, text), item in zip(lines, instructions):
                assert int(address, 16) - historical == item.address - start, role
                assert normal(text) == normal(f"{item.mnemonic} {item.op_str}".strip()), role
                if item.mnemonic.startswith("j") and item.operands[0].type == X86_OP_IMM:
                    previous = re.search(r"0x[0-9a-f]+$", text)
                    if previous and start <= item.operands[0].imm < end:
                        assert int(previous[0], 16) - historical == item.operands[0].imm - start
            structure.append(dict(role=role, historical=receipt(old), current_va=hex(start),
                                  checked_instructions=len(instructions),
                                  limits="Only relative instruction/register/scalar/control structure; current calls and RIP data are separate observed addresses, not historical semantic equivalence."))
        spans.append(row)

    data = []
    for role, address, count in [("locale-filename-format", 0x1472DDF80, 8),
                                  ("locale-directory", 0x1472DDF88, 4),
                                  ("embedded-error-format", 0x1475E7080, 16),
                                  ("diagnostic-format", 0x1472DE048, 10)]:
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + count]
        data.append(dict(role=role, va=hex(address), file_offset=hex(offset), bytes=raw.hex(), sha256=digest(raw)))
    source = (ROOT / "crates/azeroth-survivors-re/src/localization.rs").read_text()
    parser = (ROOT / "crates/azeroth-survivors-re/src/localization/catalogs.rs").read_text()
    for fragment in [".or_else(|| self.catalogs[0].get(key))", "translated.labels = self.catalogs[0].clone()",
                     "translated.labels.extend(self.catalogs[self.index].clone())", "catalogs[0].len(), 2979"]:
        assert fragment in source, fragment
    for fragment in ["[executable_directory, save_directory]", 'root.join("lang").join(format!("{code}.json"))',
                     "Ok(entries) => catalog.extend(entries)", "trim_start_matches('\\u{feff}')",
                     "if !key.starts_with('_')", "self.hex()? & 0x3ff"]:
        assert fragment in parser, fragment
    return dict(schema_version=1, target={key: selected[key] for key in ("version", "path", "sha256", "size_bytes")},
                native_spans=spans, data_spans=data, current_query_receipts=queries,
                historical_structure_comparisons=structure,
                source_interfaces=["Localization::lookup/menu_catalog", "localization::catalogs::load_from/parse/Parser"],
                native_contracts={
                    "lookup": "TLS byte+0x368 chooses index+0x370, otherwise global148519260; index clamps to min(index,map_count-1,13). Selected map is tried before English. Successful pointer/length survives empty value; absent returns null.",
                    "lazy_initialization": "145b59e40 passes exact table1475d7350..1475d7660 and reserves14*48 bytes; initializer145c13e00 traverses56-byte descriptors, parses embedded JSON, loads external entries, inserts them after the embedded map, and publishes48-byte maps.",
                    "parser": "Flat string-object with repeated initial BOM, structural SP/HT/LF/CR, underscore-key exclusion, empty keys/values, trailing text, string escapes and native permissive unicode decode. Malformed files return error before their entries are applied.",
                    "override_loader": "145b28e50 forms code.json, collects executable-parent then save-base roots, appends lang and filename, skips read errors, diagnoses parser errors, returns ordered entries. Identical roots are not deduplicated.",
                },
                limits=["Raw Ghidra imports omit external memory/callees and infer a generic ABI; original Windows-x64 PE instructions govern conclusions.",
                        "Current AS locale call/data/control boundaries are recovered; OS directory/file operations, standard hashing/allocation and arbitrary TLS producers are not executed or reimplemented here.",
                        "Historical parser/loader vectors retain0.109.0 provenance and were not relabeled or rerun; current instruction structure, calls/data and source interfaces are checked independently.",
                        "No compilation, emulation, Rust execution, filesystem-override IO, server/game execution, linguistic/rendering or original/rebuilt parity validation."])


def main():
    args = argparse.ArgumentParser(description=__doc__)
    args.add_argument("--collect", action="store_true")
    collect = args.parse_args().collect
    destination = STAGED if collect else RETAINED
    if collect:
        destination.mkdir(parents=True, exist_ok=True)
    proof = derive(destination, collect)
    path = destination / "contracts.json"
    if collect:
        path.write_bytes(encoded(proof))
    assert json.loads(path.read_text()) == proof
    print(json.dumps(dict(native_spans=len(proof["native_spans"]),
                          native_bytes=sum(row["byte_count"] for row in proof["native_spans"]),
                          instructions=sum(row["instructions"] for row in proof["native_spans"]),
                          structure_checks=sum(row["checked_instructions"] for row in proof["historical_structure_comparisons"]),
                          completed_queries=len(proof["current_query_receipts"]), data_spans=len(proof["data_spans"]))))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Project F01/F02 onto exact AS diagnostic contexts without inventing callees.

Both saved Programs retain separate body/context joins. Local instruction
shapes identify relative-table expressions and callback/loader boundaries;
neither a nearby diagnostic nor a table expression proves a source owner,
admitted index, actual receiver, successful execution or runtime destination.
Default operation verifies the retained compact proof without writing.
"""
import argparse
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
from pathlib import Path

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from script_sources import load_script

PROOF = ROOT / "docs/analysis/evidence/0.115.0/as-indirect-contracts.json"
OUTPUT = ROOT / "runtime/q41-indirect-contracts-0.115.0"
PREFIXES = ("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")


def require(condition, message):
    if not condition:
        raise ValueError(message)


def shape(instructions, transfer, capstone, canonical_register):
    """Only classify a straight-line encoded suffix, never its incoming state."""
    x86 = capstone.x86_const
    if transfer.mnemonic != "jmp" or transfer.operands[0].type != x86.X86_OP_REG:
        return None
    register = transfer.operands[0].reg
    target_family = canonical_register(transfer.reg_name(register))

    def writes(instruction, family):
        return any(canonical_register(instruction.reg_name(reg)) == family
                   for reg in instruction.regs_access()[1])
    suffix = []
    for instruction in reversed(instructions):
        if instruction.group(capstone.CS_GRP_JUMP) or instruction.group(capstone.CS_GRP_CALL):
            break
        suffix.append(instruction)
    suffix.reverse()
    additions = [(i, instruction) for i, instruction in enumerate(suffix)
                 if instruction.mnemonic == "add" and len(instruction.operands) == 2
                 and instruction.operands[0].type == x86.X86_OP_REG
                 and instruction.operands[0].reg == register
                 and instruction.operands[1].type == x86.X86_OP_REG]
    if not additions:
        return None
    addition_index, addition = additions[-1]
    base = addition.operands[1].reg
    base_family = canonical_register(transfer.reg_name(base))
    # No later definition may change either operand of the computed jump.
    for instruction in suffix[addition_index + 1:]:
        if writes(instruction, target_family):
            return None
    for index in range(addition_index - 1, -1, -1):
        instruction = suffix[index]
        if not writes(instruction, target_family):
            continue
        if instruction.mnemonic != "movsxd" or len(instruction.operands) != 2:
            return None
        destination, source = instruction.operands
        if destination.type != x86.X86_OP_REG or destination.reg != register or source.type != x86.X86_OP_MEM:
            return None
        memory = source.mem
        if memory.base != base or not memory.index or memory.scale != 4 or source.size != 4:
            return None
        if any(writes(item, base_family) for item in suffix[index + 1:addition_index]):
            return None
        return dict(kind="signed-relative-table-expression",
                    load_site=hex(instruction.address), add_site=hex(addition.address),
                    table_base_register=transfer.reg_name(base),
                    index_register=transfer.reg_name(memory.index),
                    entry_width_bytes=4, table_displacement=memory.disp,
                    incoming_base_and_index_established=False,
                    bounds_and_runtime_targets_established=False)
    return None


def main():
    import capstone
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    inputs = {}

    def read(path, digest=None):
        path = project_path(path)
        actual = file_sha256(path)
        require(digest is None or actual == digest, "Changed retained input: " + str(path))
        relative = path.relative_to(ROOT).as_posix()
        inputs[relative] = dict(path=relative, sha256=actual)
        return path

    operand_proof = json.loads(read("docs/analysis/evidence/0.115.0/independent-indirects.json").read_text())
    require(operand_proof["target"] == identity, "Indirect target differs")
    artifact = operand_proof["artifact"]
    operands = {}
    with gzip.open(read(artifact["path"], artifact["sha256"]), "rt") as stream:
        for line in stream:
            row = json.loads(line)
            require(row["site"] not in operands, "Duplicate indirect operand")
            operands[row["site"]] = row
    require(len(operands) == artifact["rows"] == 83284, "Incomplete F01/F02 population")
    contexts = defaultdict(list)
    populations = {}
    for profile, filename in (("canonical-declared", "native-residuals"), ("expanded-all-seeds", "execheck-residuals")):
        source = json.loads(read(f"docs/analysis/evidence/0.115.0/{filename}.json").read_text())
        require(source["target"] == identity, "Residual target differs")
        owners = defaultdict(set)
        diagnostic = source["artifacts"]["diagnostic-sites.jsonl.gz"]
        count = 0
        with gzip.open(read(diagnostic["path"], diagnostic["sha256"]), "rt") as stream:
            for line in stream:
                row = json.loads(line)
                count += 1
                if row["actual_body_owner"] and row["path"].startswith(PREFIXES):
                    owners[row["actual_body_owner"]].add(row["path"])
        require(count == diagnostic["rows"], "Incomplete diagnostic population")
        selected = 0
        observed = set()
        for lead, name in (("Q41-F01", "declared-indirect-sites.tsv.gz"), ("Q41-F02", "complement-indirect-sites.tsv.gz")):
            item = source["artifacts"][name]
            count = 0
            with gzip.open(read(item["path"], item["sha256"]), "rt") as stream:
                for row in csv.DictReader(stream, delimiter="\t"):
                    count += 1
                    site = hex(int(row["site"], 16))
                    require(site not in observed, "Duplicate profile site")
                    observed.add(site)
                    original = operands.get(site)
                    require(original and original["lead_id"] == lead and original["kind"] == row["kind"], "Changed indirect selector")
                    if row["source_owner"] in owners:
                        selected += 1
                        contexts[site].append(dict(profile=profile, body_owner=row["source_owner"],
                                                   diagnostic_paths=sorted(owners[row["source_owner"]]),
                                                   diagnostic_context_is_source_ownership=False))
            require(count == item["rows"], "Incomplete indirect profile")
        require(observed == set(operands), "Profile/independent population differs")
        populations[profile] = dict(selected_context_sites=selected, complete_indirect_sites=len(observed))

    image = target_bytes(target)
    pe = load_script("as_indirect_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    registers = load_script("as_indirect_registers", ROOT / "scripts/classify-native-ownership.py")
    # Use original declared extents only to obtain a reproducible linear prefix.
    # A prefix is not silently substituted for the saved Ghidra flow graph.
    extents = pe.functions()
    decoded = {}
    rows = []
    counts = Counter()
    for site in sorted(contexts, key=lambda value: int(value, 16)):
        original = operands[site]
        require(original["extent_ordinal"] is not None, "Context outside declared inventory needs an explicit prefix")
        ordinal = original["extent_ordinal"]
        if ordinal not in decoded:
            start, end, _ = extents[ordinal]
            offset = pe.rva_offset(start)
            decoded[ordinal] = list(decoder.disasm(image[offset:offset + end - start], pe.image_base + start))
        instructions = decoded[ordinal]
        matches = [index for index, instruction in enumerate(instructions) if instruction.address == int(site, 16)]
        require(len(matches) == 1, "Selected site absent from exact declared prefix")
        index = matches[0]
        transfer = instructions[index]
        require(transfer.bytes.hex() == original["instruction_bytes"], "Changed native transfer bytes")
        expression = shape(instructions[:index], transfer, capstone, registers.canonical_register)
        if expression:
            classification = "relative-table-expression"
        elif original["slot_binding"]["kind"] == "declared-import-slot":
            classification = "declared-loader-interface"
        elif original["kind"] == "call_indirect":
            classification = "callback-receiver-state-required"
        else:
            classification = "unresolved-jump-state-required"
        counts[classification] += 1
        prefix_start = instructions[max(0, index - 16)].address
        offset = pe.rva_offset(prefix_start - pe.image_base)
        prefix = image[offset:offset + transfer.address + transfer.size - prefix_start]
        rows.append(dict(site=site, lead_id=original["lead_id"], kind=original["kind"],
                         instruction_bytes=original["instruction_bytes"], operand=original["operand_text"],
                         contexts=contexts[site], classification=classification, expression=expression,
                         slot_binding=original["slot_binding"],
                         prefix=dict(start=hex(prefix_start), end_exclusive=hex(transfer.address + transfer.size), sha256=hashlib.sha256(prefix).hexdigest()),
                         native_source_contract_established=False, runtime_dispatch_verified=False))
    compact = dict(schema_version=1, target=identity,
                   generator=dict(path="scripts/classify-as-indirect-contracts.py", sha256=file_sha256(Path(__file__))),
                   dependencies=[dict(path=path, sha256=file_sha256(ROOT/path)) for path in
                                 ("scripts/coverage_common.py", "scripts/script_sources.py", "scripts/inventory-executable.py",
                                  "scripts/classify-native-ownership.py")],
                   inputs=sorted(inputs.values(), key=lambda item: item["path"]), profiles=populations,
                   counts=dict(independent_sites=len(operands), contextual_sites=len(rows), classifications=dict(counts)),
                   contextual_sites=[row["site"] for row in rows],
                   classification_only=True, source_defect_established=False,
                   incoming_state_complete=False, source_semantics_complete=False, parity_verified=False,
                   gap_ids=[41], lead_ids=["Q41-F01", "Q41-F02"],
                   limitations=["Exact diagnostic body joins are context, not AS ownership or a missing implementation.",
                                "Relative-table expressions do not recover base/index admission, table bounds, dynamic aliases or runtime callees.",
                                "Callbacks require actual receiver/writer identity at the existing engine interface; generic engine reconstruction is outside this scope.",
                                "No compilation, game/network execution or original/rebuilt parity comparison."])
    encoded = ("\n".join(json.dumps(row, sort_keys=True, separators=(",", ":")) for row in rows) + "\n").encode()
    artifact_path = OUTPUT / "contextual-indirects.jsonl.gz"
    for item in inputs.values():
        require(file_sha256(ROOT/item["path"]) == item["sha256"], "Input changed during classification")
    require(hashlib.sha256(target_bytes(target)).hexdigest() == identity["sha256"], "Target changed during classification")
    if args.write:
        OUTPUT.mkdir(parents=True, exist_ok=True)
        with artifact_path.open("wb") as raw:
            with gzip.GzipFile(filename="", mode="wb", fileobj=raw, mtime=0) as stream:
                stream.write(encoded)
        compact["artifact"] = dict(path=artifact_path.relative_to(ROOT).as_posix(), sha256=file_sha256(artifact_path), rows=len(rows))
        PROOF.write_text(json.dumps(compact, indent=2) + "\n")
    else:
        retained = json.loads(PROOF.read_text())
        item = retained.pop("artifact")
        require(item["rows"] == len(rows) and item["path"] == artifact_path.relative_to(ROOT).as_posix(), "Changed contextual artifact selector")
        require(file_sha256(artifact_path) == item["sha256"], "Changed contextual artifact")
        with gzip.open(artifact_path, "rb") as stream:
            require(stream.read() == encoded, "Changed contextual rows")
        require(retained == compact, "Changed compact classification")
    print(json.dumps(compact["counts"], sort_keys=True))
    print("Classification only; source semantics, compilation, execution and parity remain unverified.")


if __name__ == "__main__":
    main()

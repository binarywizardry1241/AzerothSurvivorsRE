#!/usr/bin/env python3
"""Classify every mixed residual in declared extents with genuine AS Locations.

This is an original-byte/retained-inventory check, not a new Ghidra census or
semantic ownership proof. It never compiles or launches the target. A separate
inputs checkout is supported for a linked worktree sharing the primary store.
"""

import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
from pathlib import Path
import struct
import sys


TARGET_SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
SUMMARY = "docs/analysis/coverage/full-image-execheck-0.121.0.json"
RESIDUALS = "docs/analysis/evidence/0.121.0/native-residuals.json"
DESTINATION = "docs/analysis/evidence/0.121.0/as-residual-ranges.json"
PREFIXES = ("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def address(value):
    return int(value, 16)


def derive(root):
    sys.path.insert(0, str(root / "scripts"))
    import capstone
    from capstone.x86 import X86_OP_IMM
    from coverage_common import latest_target, target_bytes
    from script_sources import load_script

    target = latest_target(verify=True)
    assert target["version"] == "0.121.0" and target["sha256"] == TARGET_SHA
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(target)
    pe = load_script("residual_range_pe", root / "scripts/inventory-executable.py").PE(image)
    inputs = {}

    def receipt(name, record):
        path = root / record["path"]
        assert path.resolve().is_relative_to(root.resolve()), path
        raw = path.read_bytes()
        assert digest(raw) == record["sha256"], path
        inputs[name] = {"path": record["path"], "sha256": record["sha256"]}
        return path

    def source(name):
        path = root / name
        raw = path.read_bytes()
        inputs[name] = {"path": name, "sha256": digest(raw)}
        return json.loads(raw)

    summary, residuals = source(SUMMARY), source(RESIDUALS)
    assert summary["target"] == residuals["target"] == identity
    missing_path = receipt("missing-executable-ranges", summary["independent_instructions"]["executable_sections"]["range_inventory"])
    extent_path = receipt("declared-extent-roles", residuals["artifacts"]["declared-extent-roles.tsv.gz"])
    diagnostics_path = receipt("diagnostic-sites", residuals["artifacts"]["diagnostic-sites.jsonl.gz"])
    proposal_review = source("docs/analysis/evidence/0.121.0/native-switch-proposal-review.json")
    assert proposal_review["target"] == identity
    proposal_input = next(row for row in proposal_review["inputs"] if row["path"].endswith("/guarded-proposals.json"))
    proposed = json.loads(receipt("guarded-proposals", proposal_input).read_text())
    applied = json.loads(receipt("applied-guarded-tables", summary["guarded_table_input"]).read_text())
    assert proposed["target"] == applied["target"] == identity
    applied_sites = {row["site"] for row in applied["tables"]}
    guarded_targets = []
    for table in proposed["tables"]:
        table_raw = image[address(table["file_offset"]):address(table["file_offset"]) + table["byte_count"]]
        assert digest(table_raw) == table["sha256"]
        assert [hex(address(table["relative_base"]) + value[0]) for value in struct.iter_unpack("<i", table_raw)] == table["case_targets"]
        for ordinal, destination in enumerate(table["case_targets"]):
            guarded_targets.append(dict(site=table["site"], target=destination, case_ordinal=ordinal,
                                        state="applied_in_selected_census" if table["site"] in applied_sites else "unapplied_guarded_proposal"))

    with gzip.open(extent_path, "rt") as stream:
        extents = [dict(row, first=address(row["start"]), last=address(row["end_exclusive"]))
                   for row in csv.DictReader(stream, delimiter="\t")]
    assert len(extents) == residuals["artifacts"]["declared-extent-roles.tsv.gz"]["rows"]
    starts = [row["first"] for row in extents]
    assert starts == sorted(starts) and len(set(starts)) == len(starts)

    def containing(site):
        index = bisect_right(starts, site) - 1
        return index if index >= 0 and site < extents[index]["last"] else None

    contexts, tokens = defaultdict(list), defaultdict(list)
    with gzip.open(diagnostics_path, "rt") as stream:
        for line in stream:
            row = json.loads(line)
            if not row["path"].startswith(PREFIXES):
                continue
            index = containing(address(row["instruction_address"]))
            if index is not None:
                (contexts if row["kind"] == "rust_location" else tokens)[index].append(row)

    selected, excluded_token_ranges, partial_overlaps = defaultdict(list), [], []
    context_indices = sorted(contexts)
    context_starts = [extents[index]["first"] for index in context_indices]
    selected_counts, selected_bytes = Counter(), Counter()
    with gzip.open(missing_path, "rt") as stream:
        for ordinal, row in enumerate(csv.DictReader(stream, delimiter="\t")):
            first, last = address(row["start"]), address(row["end_exclusive"])
            # Account for any range beginning before a selected context or
            # crossing its end before applying the wholly-contained selector.
            # A missing-range producer must not silently split/drop this case.
            scan = max(0, bisect_right(context_starts, first) - 1)
            partial_contexts = []
            while scan < len(context_indices) and context_starts[scan] < last:
                candidate = extents[context_indices[scan]]
                if candidate["last"] > first and not (candidate["first"] <= first and last <= candidate["last"]):
                    partial_contexts.append(dict(declared_start=hex(candidate["first"]),
                                                 declared_end_exclusive=hex(candidate["last"]),
                                                 overlap_start=hex(max(first, candidate["first"])),
                                                 overlap_end_exclusive=hex(min(last, candidate["last"]))))
                scan += 1
            if partial_contexts:
                partial_overlaps.append(dict(row, inventory_ordinal=ordinal, AS_location_extent_intersections=partial_contexts))
            index = containing(first)
            if index is None or last > extents[index]["last"]:
                continue
            if index in contexts:
                assert row["location"] == "declared"
                selected_counts[row["category"]] += 1
                selected_bytes[row["category"]] += int(row["byte_count"])
                if row["category"] == "mixed-unclassified":
                    selected[index].append(dict(row, inventory_ordinal=ordinal))
            elif index in tokens and row["category"] == "mixed-unclassified":
                excluded_token_ranges.append(dict(row, inventory_ordinal=ordinal,
                                                  declared_start=extents[index]["start"]))

    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True

    def raw(first, last):
        offset = pe.rva_offset(first - pe.image_base)
        assert pe.rva_offset(last - 1 - pe.image_base) == offset + last - first - 1
        return image[offset:offset + last - first]

    def instruction(row):
        return dict(site=hex(row.address), bytes=row.size,
                    mnemonic=row.mnemonic, operands=row.op_str)

    rows, instruction_total, decoded_bytes = [], 0, 0
    role_counts = Counter()
    predecessor_counts = Counter()
    incoming_counts = Counter()
    for index, ranges in selected.items():
        extent = extents[index]
        first, last = extent["first"], extent["last"]
        body = raw(first, last)
        decoded = list(decoder.disasm(body, first))
        # Linear native inventory already decodes every declared extent. Do not
        # silently use a partial linear decode to characterize a selected range.
        assert sum(row.size for row in decoded) == last - first, hex(first)
        by_start = {row.address: row for row in decoded}
        by_end = {row.address + row.size: row for row in decoded}
        flow = []
        for insn in decoded:
            if not (insn.group(capstone.CS_GRP_CALL) or insn.group(capstone.CS_GRP_JUMP)):
                continue
            target_value = insn.operands[0].imm if insn.operands and insn.operands[0].type == X86_OP_IMM else None
            item = dict(instruction(insn), target=hex(target_value) if target_value is not None else None)
            flow.append(item)
        extent_row = dict(declared_start=hex(first), declared_end_exclusive=hex(last),
                          extent_sha256=digest(body), linear_instruction_count=len(decoded),
                          AS_location_context=sorted({row["path"] for row in contexts[index]}),
                          context_is_not_semantic_ownership=True,
                          diagnostic_sites=[{key: row[key] for key in
                                             ("path", "source_line", "source_column", "instruction_address", "target_address")}
                                            for row in contexts[index]], ranges=[])
        for row in ranges:
            begin, end = address(row["start"]), address(row["end_exclusive"])
            value = raw(begin, end)
            assert digest(value) == row["sha256"]
            local = [item for item in decoded if begin <= item.address < end]
            assert local and local[0].address == begin and local[-1].address + local[-1].size == end
            assert any(item.mnemonic not in ("nop", "int3") for item in local)
            local_flow = [item for item in flow if begin <= address(item["site"]) < end]
            inbound = [item for item in flow if item["target"] is not None and
                       begin <= address(item["target"]) < end and
                       not begin <= address(item["site"]) < end]
            guarded_inbound = [item for item in guarded_targets if begin <= address(item["target"]) < end]
            assert all(address(item["target"]) in by_start for item in guarded_inbound)
            last_instruction = local[-1]
            role = ("terminal-trap-sequence" if last_instruction.mnemonic in ("ud2", "int3") else
                    "returning-sequence" if last_instruction.group(capstone.CS_GRP_RET) else
                    "branching-sequence" if last_instruction.group(capstone.CS_GRP_JUMP) else
                    "fallthrough-sequence")
            role_counts[role] += 1
            predecessor_counts[by_end[begin].mnemonic if begin in by_end else "extent-entry"] += 1
            if inbound:
                incoming_counts["range_with_direct_incoming_from_same_extent"] += 1
            if guarded_inbound:
                incoming_counts["range_with_guarded_table_target_candidate"] += 1
            if any(item["state"] == "unapplied_guarded_proposal" for item in guarded_inbound):
                incoming_counts["range_with_unapplied_table_target_candidate"] += 1
            if any(item["state"] == "applied_in_selected_census" for item in guarded_inbound):
                incoming_counts["range_with_applied_table_target_candidate"] += 1
            instruction_total += len(local)
            decoded_bytes += len(value)
            excerpt = [instruction(insn) for insn in local[:4]]
            if len(local) > 4:
                excerpt += [instruction(insn) for insn in local[-4:]]
            range_row = dict(inventory_ordinal=row["inventory_ordinal"], start=hex(begin), end_exclusive=hex(end),
                             byte_count=len(value), sha256=row["sha256"], instruction_count=len(local),
                             local_control_shape=role, boundary_excerpt=excerpt,
                             previous_instruction=instruction(by_end[begin]) if begin in by_end else None,
                             next_instruction=instruction(by_start[end]) if end in by_start else None,
                             direct_incoming_from_same_declared_extent=inbound,
                             guarded_table_target_observations=guarded_inbound,
                             calls_and_branches=local_flow,
                             wider_semantic_status="not_inferred_from_diagnostic_context")
            extent_row["ranges"].append(range_row)
        rows.append(extent_row)
    return dict(schema_version=1, target=identity, gap_ids=[41], lead_id="Q41-U03:AS-Location-mixed-ranges",
                inputs=inputs,
                generator={"path": "scripts/classify-as-residual-ranges.py", "sha256": digest(Path(__file__).read_bytes())},
                selection="Every missing executable mixed-unclassified row wholly inside a declared extent containing at least one rust_location reference whose path begins crates/wenilla-rogue/ or crates/wenilla-rogue-app/. Literal tokens alone are excluded.",
                decoder=dict(name="Capstone", version=capstone.__version__, architecture="x86-64", mode="linear whole-declared-extent original-byte decode"),
                counts=dict(AS_location_extents=len(contexts), selected_declared_extents=len(rows),
                            selected_mixed_ranges=sum(len(row["ranges"]) for row in rows),
                            selected_mixed_bytes=decoded_bytes, selected_mixed_instructions=instruction_total,
                            all_context_range_categories=dict(sorted(selected_counts.items())),
                            all_context_range_bytes=dict(sorted(selected_bytes.items())),
                            local_control_shapes=dict(sorted(role_counts.items())),
                            immediately_preceding_instructions=dict(sorted(predecessor_counts.items())),
                            incoming_context=dict(sorted(incoming_counts.items())),
                            literal_only_mixed_ranges=len(excluded_token_ranges),
                            partial_overlap_range_records=len(partial_overlaps)),
                partial_overlap_ranges=partial_overlaps,
                excluded_literal_only_ranges=excluded_token_ranges, extents=rows,
                limits=["Whole-extent linear boundaries/encodings and direct branch targets are static observations; they do not prove reachability or function ownership.",
                        "Only genuine AS rust_location context selects ranges. Such context does not assign every instruction a source mechanic or prove source omission.",
                        "No census/body counts are changed, no native application is executed, and no compilation, game/server operation or parity check is performed."])


def main():
    checkout = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--inputs-root", type=Path, default=checkout)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = derive(args.inputs_root.resolve())
    full_raw = (json.dumps(proof, ensure_ascii=False, separators=(",", ":")) + "\n").encode()
    detail_path = Path("runtime/coverage") / TARGET_SHA / "as-residual-ranges/range-details.json"
    details = args.inputs_root.resolve() / detail_path
    compact = {key: value for key, value in proof.items() if key not in ("extents", "excluded_literal_only_ranges")}
    compact["detailed_inventory"] = dict(path=detail_path.as_posix(), sha256=digest(full_raw), byte_count=len(full_raw))
    compact["range_columns"] = ["inventory_ordinal", "start", "end_exclusive", "byte_count", "sha256", "instruction_count", "local_control_shape", "direct_incoming_same_extent", "applied_guarded_target_records", "unapplied_guarded_target_records"]
    compact["extents"] = [dict(declared_start=row["declared_start"], declared_end_exclusive=row["declared_end_exclusive"],
                               extent_sha256=row["extent_sha256"], AS_location_context=row["AS_location_context"],
                               ranges=[[item["inventory_ordinal"], item["start"], item["end_exclusive"], item["byte_count"], item["sha256"],
                                        item["instruction_count"], item["local_control_shape"], len(item["direct_incoming_from_same_declared_extent"]),
                                        sum(target["state"] == "applied_in_selected_census" for target in item["guarded_table_target_observations"]),
                                        sum(target["state"] == "unapplied_guarded_proposal" for target in item["guarded_table_target_observations"])]
                                       for item in row["ranges"]]) for row in proof["extents"]]
    compact["excluded_literal_only_range_ordinals"] = [row["inventory_ordinal"] for row in proof["excluded_literal_only_ranges"]]
    destination = checkout / DESTINATION
    raw = json.dumps(compact, ensure_ascii=False, indent=2) + "\n"
    if args.write:
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(raw)
        details.parent.mkdir(parents=True, exist_ok=True)
        details.write_bytes(full_raw)
    else:
        assert json.loads(destination.read_text()) == compact, "Retained range classification differs"
        assert details.read_bytes() == full_raw, "Retained detailed range inventory differs"
    print(json.dumps(proof["counts"], indent=2))


if __name__ == "__main__":
    main()

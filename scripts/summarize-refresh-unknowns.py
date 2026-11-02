#!/usr/bin/env python3
"""Commit exact current residual selectors without claiming semantic recovery.

The compact report covers complete input populations. A verified current Ghidra
census adds actual Program-state inventories. Separately verified classifiers
add explicit residual sets; semantic ownership, alias/source closure and
comparisons remain separate work.
"""
import argparse
from collections import Counter
import os
from pathlib import Path
import re
import sqlite3

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json
from native_residual_inputs import verified_classifications
from portable_paths import portable_record
from shared_native_inventory import open_readonly_uri as open_native_inventory, inventory_size

GENERATOR_PATH = 'scripts/summarize-refresh-unknowns.py'
GENERATOR_SHA256 = file_sha256(ROOT / GENERATOR_PATH)


def ghidra_census_input(selected, *, root=None, census_summary=None):
    """Admit only a current, independently verified, immutable census bundle.

    A retained earlier-target summary is useful history, not a missing-input
    failure during a refresh. Once the selected hash is present, broken or
    optimistic commitments fail closed rather than silently reverting to it.
    """
    root = (ROOT if root is None else Path(root)).resolve()
    summary_path = (root / (census_summary or 'docs/analysis/coverage/full-image-census.json')).resolve()
    if not summary_path.is_relative_to(root):
        raise ValueError('Ghidra census summary escapes project')
    if not summary_path.is_file():
        if census_summary is not None:
            raise ValueError('Explicit Ghidra census summary is missing')
        return None
    summary = load_json(summary_path)
    digest = summary.get('target', {}).get('sha256')
    if not isinstance(digest, str) or not re.fullmatch('[0-9a-f]{64}', digest):
        raise ValueError('Ghidra census lacks a valid target identity')
    if digest != selected['sha256']:
        if census_summary is not None:
            raise ValueError('Explicit Ghidra census summary belongs to another target')
        return None  # Historical target, including changed same-version bytes.
    if summary['target'] != selected:
        raise ValueError('Current Ghidra census selected-target identity differs')
    independent = summary.get('independent_instructions', {})
    if (summary.get('whole_image_input') is not True
            or summary.get('seed_scope') not in ('declared', 'all')
            or independent.get('performed') is not True
            or independent.get('exact_source_bytes_verified') is not True):
        raise ValueError('Current Ghidra census lacks independent source-byte verification')

    def bound(record, label):
        if not isinstance(record, dict):
            raise ValueError('Missing Ghidra census commitment: ' + label)
        name, expected = record.get('path'), record.get('sha256')
        if not isinstance(name, str) or not isinstance(expected, str) or not re.fullmatch('[0-9a-f]{64}', expected):
            raise ValueError('Invalid Ghidra census commitment: ' + label)
        path = (root / name).resolve()
        if not path.is_relative_to(root):
            raise ValueError('Ghidra census artifact escapes project: ' + label)
        if not path.is_file() or file_sha256(path) != expected:
            raise ValueError('Ghidra census artifact changed or missing: ' + label)
        if 'bytes' in record and inventory_size(path) != record['bytes']:
            raise ValueError('Ghidra census artifact length differs: ' + label)
        return {'path': path.relative_to(root).as_posix(), 'sha256': expected}

    artifacts = summary.get('artifacts', {})
    directory = (root / artifacts.get('directory', '')).resolve()
    if not directory.is_relative_to(root / 'runtime'):
        raise ValueError('Ghidra census inventories must be inside runtime/')
    committed = {}
    for name, key in (('plan.json', 'plan_sha256'), ('progress.json', 'progress_sha256'),
                      ('session-result.json', 'session_result_sha256')):
        committed[name] = bound({'path': str(directory / name), 'sha256': artifacts.get(key)}, name)
    plan = load_json(root / committed['plan.json']['path'])
    progress = load_json(root / committed['progress.json']['path'])
    session = load_json(root / committed['session-result.json']['path'])
    if (plan.get('target_sha256') != selected['sha256']
            or plan.get('seed_scope') != summary['seed_scope']
            or progress.get('target_sha256', '').lower() != selected['sha256']
            or progress.get('stage') != 'completed'
            or session.get('result', {}).get('ok') is not True
            or session.get('profileDigest') != summary.get('profile_digest')):
        raise ValueError('Current Ghidra census execution identity or completion differs')
    for key, value in summary.get('counts', {}).items():
        if progress.get(key) != value:
            raise ValueError('Current Ghidra census counter differs: ' + key)
    if (independent.get('instruction_records') != summary.get('counts', {}).get('instructions')
            or independent.get('decoded_bytes') != summary.get('counts', {}).get('instruction_bytes')):
        raise ValueError('Current Ghidra census independent instruction counters differ')
    files = artifacts.get('files')
    required = {'instructions.tsv.gz', 'bodies.tsv.gz', 'references.tsv.gz',
                'externals.tsv.gz', 'direct-call-helpers.tsv.gz'}
    if (not isinstance(files, dict) or not required <= files.keys()
            or files != portable_record(progress.get('files'), root=root)):
        raise ValueError('Current Ghidra census export commitments differ')
    for name, record in files.items():
        expected = (directory / name).resolve()
        if (Path(name).name != name
                or (root / record.get('path', str(directory / name))).resolve() != expected):
            raise ValueError('Current Ghidra census export path differs: ' + name)
        committed[name] = bound({**record, 'path': str(directory / name)}, name)

    snapshot = bound(summary.get('full_summary_snapshot'), 'immutable full summary')
    full = load_json(root / snapshot['path'])
    for key in ('target', 'artifacts', 'counts', 'independent_instructions', 'profile_digest', 'seed_scope'):
        if full.get(key) != summary.get(key):
            raise ValueError('Immutable Ghidra census summary differs: ' + key)
    diagnostic = bound(summary.get('diagnostic_binding_audit'), 'per-path diagnostic bindings')
    bindings = load_json(root / diagnostic['path'])
    if bindings.get('target') != selected or bindings.get('diagnostic_bindings') != full.get('diagnostic_bindings'):
        raise ValueError('Current Ghidra diagnostic bindings differ from immutable summary')
    declared_missing = bound(independent.get('unobserved_range_inventory'), 'unobserved declared ranges')
    executable_missing = bound(independent.get('executable_sections', {}).get('range_inventory'),
                               'unobserved executable ranges')
    selectors = [
        dict(lead_ids=['Q41-G01', 'Q41-U01'], artifact=committed['bodies.tsv.gz'],
             selector='all rows with external == false; start/end are inclusive',
             meaning='Actual flow-body intervals in the saved Ghidra Program; source semantics unestablished'),
        dict(lead_ids=['Q41-G01', 'Q41-A01', 'Q41-A02'], artifact=committed['references.tsv.gz'],
             selector='all rows', meaning='Static reference records in this Program state; runtime edges and aliases incomplete'),
        dict(lead_ids=['Q41-G01', 'Q41-U01', 'Q41-U03'], artifact=committed['instructions.tsv.gz'],
             selector='all rows', meaning='Observed instructions independently checked against selected target bytes'),
        dict(lead_ids=['Q41-D01', 'Q41-E01'], artifact=diagnostic,
             selector='diagnostic_bindings[*]', meaning='Per-path site/body-owner counts; no explicit ownerless-site or source-semantic classification'),
        dict(lead_ids=['Q41-U01', 'Q41-B01'], artifact=declared_missing,
             selector='all rows', meaning='Unobserved declared byte ranges; candidate kinds are not certified padding'),
        dict(lead_ids=['Q41-U03', 'Q41-B01'], artifact=executable_missing,
             selector='all rows grouped by location and category', meaning='Unobserved executable byte ranges; code/data/padding roles remain unproved'),
    ]
    return dict(summary=bound({'path': str(summary_path), 'sha256': file_sha256(summary_path)}, 'current summary'),
        full_summary_snapshot=snapshot, execution_artifacts=committed, artifact_selectors=selectors,
        seed_scope=summary['seed_scope'], requested_seeds=summary.get('requested_seeds'), counts=summary['counts'],
        all_seeded_body_operations_complete=summary.get('all_seeded_body_operations_complete') is True,
        diagnostic_binding_counts=summary.get('diagnostic_binding_counts', {}),
        available_inventories=['actual_ghidra_flow_body_intervals', 'observed_instructions_with_verified_source_bytes',
            'static_references_in_saved_program', 'per_path_diagnostic_site_ownership_counts',
            'unobserved_declared_and_executable_byte_ranges'],
        explicit_ownerless_site_inventory_available=False, computed_destination_classification_available=False,
        global_native_semantics_complete=False, global_aliasing_complete=False, parity_verified=False)


def missing_semantic_inventories(census, classifications=None):
    if census is None:
        return ["Complete current Ghidra body/ownerless-instruction and diagnostic-site inventories",
                "Complete computed destination and dynamic alias/type/ID inventory",
                "Complete AS source producer/consumer closure and controlled original/rebuilt comparisons"]
    classifications = classifications or {}
    return [("Complete AS state/type/cycle and outer-consumer meanings for classified diagnostic sites"
             if classifications.get('explicit_ownerless_site_inventory_available') else
             "Explicit ownerless-instruction and ownerless-diagnostic-site inventories; per-path diagnostic counts are available"),
            ("Complete dynamic destination/alias/type/ID inventory; explicit encoded computed-destination classifications are available"
             if classifications.get('computed_destination_classification_available') else
             "Complete computed-destination classification and dynamic alias/type/ID inventory beyond encoded/local static observations"),
            "Complete AS source producer/consumer closure and controlled original/rebuilt comparisons"]


def summarize(census_summary=None):
    (ROOT / 'runtime/tmp').mkdir(parents=True, exist_ok=True)
    os.environ['SQLITE_TMPDIR'] = str(ROOT / 'runtime/tmp')
    target = latest_target()
    selected = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    dependencies = [dict(path=name, sha256=file_sha256(ROOT/name)) for name in (
        'scripts/native_residual_inputs.py', 'scripts/check-native-residuals.py',
        'scripts/check-independent-indirects.py', 'scripts/portable_paths.py')]
    records = {}
    for name in ("native-summary", "diagnostic-ownership", "file-range-summary",
                 "instruction-summary", "unwind-complement-summary"):
        path = f"docs/analysis/coverage/{name}.json"
        record = load_json(path)
        if record["target"] != selected:
            raise ValueError("Stale residual input: " + name)
        binding = record.get("inventory", record.get("ledger"))
        if file_sha256(binding["path"]) != binding["sha256"]:
            raise ValueError("Residual input bytes changed: " + name)
        records[name] = {"summary": {"path": path, "sha256": file_sha256(path)},
                         "inventory": binding, "counts": record["counts"]}
    native = load_json(records["native-summary"]["inventory"]["path"])
    ledger = load_json(records["file-range-summary"]["inventory"]["path"])
    ownership = load_json(records["diagnostic-ownership"]["inventory"]["path"])
    selectors = []

    def query(lead, input_name, sql, question):
        binding = records[input_name]["inventory"]
        with open_native_inventory((ROOT / binding["path"]).as_uri() + "?mode=ro", uri=True) as connection:
            count = connection.execute("SELECT COUNT(*) FROM (" + sql.split(" ORDER BY", 1)[0] + ")").fetchone()[0]
        selectors.append(dict(lead_id=lead, input=input_name, selector=sql, records=count,
                              semantic_status="unknown", question=question))

    query("Q41-U01", "instruction-summary", "SELECT * FROM extents ORDER BY ordinal",
          "All declared ranges are linearly decoded; recover actual body boundaries, role and AS dependency/source ownership.")
    query("Q41-U02", "instruction-summary", "SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal",
          "Any undecoded suffix needs exact range recovery; an empty set does not establish reachable-code completeness.")
    query("Q41-U03", "unwind-complement-summary", "SELECT * FROM regions ORDER BY start",
          "Classify every complement range and its non-padding/leaf/inline/data role; preserve candidate padding as unknown.")
    query("Q41-F01", "instruction-summary", "SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand",
          "Recover computed destinations, guards, dispatch tables and relevant aliases without guessing callees.")
    query("Q41-F02", "unwind-complement-summary", "SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand",
          "Recover complement computed transfers separately from declared-range references.")
    query("Q41-A01", "instruction-summary", "SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand",
          "Classify every encoded direct/address/memory edge; locate ownerless destinations and AS producer/consumer connections.")
    query("Q41-A02", "unwind-complement-summary", "SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand",
          "Classify complement encoded references and imported-pointer slots without promoting dynamic callee identity.")
    query("Q41-U04", "unwind-complement-summary", "SELECT * FROM stops ORDER BY site,reason",
          "Resolve decoding/flow stop boundaries; retain unobserved successors and unknown code/data roles.")
    ranges = []
    for lead in sorted({row["lead_id"] for row in ledger["ranges"]}):
        rows = [row for row in ledger["ranges"] if row["lead_id"] == lead]
        ranges.append(dict(lead_id=lead, selector=f"ranges[lead_id == '{lead}']", ranges=len(rows),
                           bytes=sum(row["byte_count"] for row in rows),
                           structural_classes=dict(Counter(row["structural_class"] for row in rows))))
    candidates = {key: dict(selector=f"embedded_candidates.{key}[*]", records=len(rows))
                  for key, rows in native["embedded_candidates"].items()}
    census = ghidra_census_input(selected, census_summary=census_summary)
    if census is not None:
        records['ghidra-census'] = census
    classifications = verified_classifications(selected, census_summary=census_summary) if census is not None else None
    for binding in dependencies + [dict(path=GENERATOR_PATH, sha256=GENERATOR_SHA256)]:
        if file_sha256(ROOT/binding['path']) != binding['sha256']:
            raise ValueError('Executed selector/admission source changed during analysis: ' + binding['path'])
    return dict(schema_version=1, target=selected,
        generator={"path": GENERATOR_PATH, "sha256": GENERATOR_SHA256},
        classification_dependencies=dependencies,
        inputs=records, sqlite_selectors=selectors, file_range_groups=ranges,
        file_range_partition_bytes=sum(row["byte_count"] for row in ledger["ranges"]),
        data_resources=ledger["data_resources"], embedded_candidate_selectors=candidates,
        diagnostic_selectors={"custom": {"selector": "diagnostics[custom_game_crate == true]", "paths": sum(row["custom_game_crate"] for row in ownership["diagnostics"])},
                              "engine_context": {"selector": "diagnostics[custom_game_crate == false]", "paths": sum(not row["custom_game_crate"] for row in ownership["diagnostics"])},
                              "sites": "diagnostics[*].verified_references[*]"},
        verified_classifications=classifications,
        missing_semantic_inventories=missing_semantic_inventories(census, classifications),
        global_native_semantics_complete=False, parity_verified=False, gap_ids=[41],
        limits="Selectors overlap independent passes and must not be added as disjoint coverage. Byte decoding, a zero undecoded-suffix count and structural range coverage do not establish source semantics, padding, implementation or parity. Generic engine reconstruction remains supporting context. Co-op gameplay/network/server reconstruction is in scope under #63; historical excluded classification labels retain their original collection scope and do not certify current source closure.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--census-summary", help="Exact current verified census; preserves any separate seed-input pointer")
    args = parser.parse_args()
    report = summarize(args.census_summary)
    output = ROOT / f"docs/analysis/evidence/{report['target']['version']}/unknown-recovery.json"
    if args.write:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json_text(report))
    elif load_json(output) != report:
        raise ValueError("Residual selectors changed; inspect before --write")
    print(json_text({"target": report["target"], "selectors": report["sqlite_selectors"],
                     "file_ranges": report["file_range_groups"]}).rstrip())


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Prepare a Ghidra probe of the complement region with most incoming leads.

Preparation verifies the current complement database and exact source bytes.
The bounded raw import cannot establish PE-wide callers or runtime imports.
"""

import argparse
import hashlib
import sqlite3
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes
from shared_native_inventory import open_readonly_uri as open_native_inventory


def select(connection):
    row = connection.execute("""SELECT r.start,r.end,r.file_offset,r.sha256,count(s.target) AS n
        FROM regions r JOIN seeds s ON s.target>=r.start AND s.target<r.end
        WHERE r.file_offset IS NOT NULL GROUP BY r.start ORDER BY n DESC,r.start LIMIT 1""").fetchone()
    if row is None:
        raise ValueError("No seeded file-backed complement region")
    start,end,offset,digest,leads = row
    addresses = [r[0] for r in connection.execute(
        "SELECT DISTINCT target FROM seeds WHERE target>=? AND target<? ORDER BY target",(start,end))]
    if not 0 < end-start <= 65536 or not 0 < len(addresses) <= 128:
        raise ValueError("Most-referenced complement probe exceeds reviewed 64 KiB/128-entry bound")
    return dict(address=hex(start),file_offset=hex(offset),byte_count=end-start,sha256=digest,
                incoming_leads=leads),addresses


def prepare(output, destinations=False):
    target = latest_target(verify=True)
    summary_path = ROOT / "docs/analysis/coverage/unwind-complement-summary.json"
    summary = load_json(summary_path)
    if any(summary.get("target",{}).get(k) != target[k] for k in ("version","path","sha256","size_bytes")):
        raise ValueError("Complement summary belongs to another target")
    database = project_path(summary["inventory"]["path"])
    if not database.is_relative_to(ROOT / "runtime") or file_sha256(database) != summary["inventory"]["sha256"]:
        raise ValueError("Complement inventory path/digest differs")
    for path,digest in ((summary["generator"]["path"],summary["generator"]["sha256"]),
                        ("scripts/inventory-native-instructions.py",summary["generator"]["helper_sha256"]),
                        ("scripts/inventory-executable.py",summary["generator"]["parser_sha256"]),
                        ("scripts/inventory-current-target.py",summary["generator"]["pe_helper_sha256"])):
        if file_sha256(project_path(path)) != digest:
            raise ValueError("Complement generator/helper differs")
    connection = open_native_inventory(database.as_uri()+"?mode=ro",uri=True)
    try:
        selected,addresses = select(connection)
        instructions = [dict(address=hex(site),bytes=encoded) for site,encoded in connection.execute(
            "SELECT site,bytes FROM instructions WHERE site>=? AND site<? ORDER BY site",
            (int(selected["address"],16),int(selected["address"],16)+selected["byte_count"]))]
        targets = sorted({int(row[0],16) for address in addresses for row in connection.execute(
            "SELECT r.target FROM refs r JOIN instructions i ON i.site=r.site WHERE r.site=? AND r.kind='jump_direct' AND i.mnemonic='jmp'",
            (address,))})
    finally:
        connection.close()
    at = int(selected["file_offset"],16)
    image = target_bytes(target)
    raw = image[at:at+selected["byte_count"]]
    if len(raw) != selected["byte_count"] or hashlib.sha256(raw).hexdigest() != selected["sha256"]:
        raise ValueError("Selected complement range bytes differ")
    rule="File-backed complement region with highest incoming seed-lead count, ties by address; all distinct incoming target seeds in that region."
    if destinations:
        parent = project_path("scripts/inventory-current-target.py")
        import importlib.util
        spec=importlib.util.spec_from_file_location("complement_probe_pe",parent)
        pe_module=importlib.util.module_from_spec(spec)
        spec.loader.exec_module(pe_module)
        pe=pe_module.pe_parser(image)
        records={pe.image_base+start:(start,end) for start,end,unwind in pe.functions()}
        if not targets or any(address not in records for address in targets):
            raise ValueError("Forwarding destinations must be current declared unwind entries")
        start=min(records[address][0] for address in targets)
        end=max(records[address][1] for address in targets)
        if not 0<end-start<=65536 or len(targets)>128:
            raise ValueError("Forwarding destination probe exceeds reviewed bounds")
        at=pe.rva_offset(start)
        if pe.rva_offset(end-1)!=at+end-start-1:
            raise ValueError("Noncontiguous forwarding destination mapping")
        raw=image[at:at+end-start]
        selected=dict(address=hex(pe.image_base+start),file_offset=hex(at),byte_count=len(raw),
                      sha256=hashlib.sha256(raw).hexdigest(),forwarded_from=selected)
        addresses=targets
        instructions=[]
        rule="All encoded unconditional direct-jump destinations at the selected most-referenced complement seeds; require exact current unwind starts."
    seeds = ''.join(f'{hex(address)}\tfunction\n{hex(address)}\tcode\n' for address in addresses)
    operations = []
    for address in addresses:
        queries=[("read_function_instructions",{},"instructions"),
                                ("procedure_info",{},"info"),
                                ("procedure_references",dict(direction="outgoing"),"outgoing")]
        if destinations:
            queries.append(("procedure_pseudo_code",{},"pseudocode"))
        for name,extra,label in queries:
            operations.append(dict(name=name,arguments=dict(procedure=hex(address),**extra),
                label=f'{hex(address)}-{label}',timeout=240 if not operations else 60))
    plan = dict(target=(output/"range.bin").relative_to(ROOT).as_posix(),
        output=(output/"session").relative_to(ROOT).as_posix(),
        open_options=dict(format="raw-binary",architecture="x86_64",entry_point=selected["address"]),
        init_timeout=60,open_timeout=120,cleanup_timeout=60,
        environment=dict(REA_GHIDRA_STARTUP_TIMEOUT_MS="180000",
            REA_GHIDRA_SEED_FILE=(output/"seeds.tsv").relative_to(ROOT).as_posix(),
            REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables"),
        operations=operations)
    manifest = dict(target=summary["target"],
        rule=rule,
        source_summary_sha256=file_sha256(summary_path),source_inventory_sha256=summary["inventory"]["sha256"],
        input_range=selected,seeds=[hex(a) for a in addresses],seed_sha256=hashlib.sha256(seeds.encode()).hexdigest(),
        expected_candidate_instructions=instructions,
        generator=dict(path="scripts/prepare-unwind-complement-probe.py",sha256=file_sha256(__file__)),
        whole_image_input=False,native_semantics_complete=False,parity_verified=False,gap_ids=[41])
    output.mkdir(parents=True,exist_ok=False)
    (output/"range.bin").write_bytes(raw)
    (output/"seeds.tsv").write_text(seeds)
    (output/"plan.json").write_text(json_text(plan))
    (output/"selection.json").write_text(json_text(manifest))
    print(json_text(dict(plan=(output/"plan.json").relative_to(ROOT).as_posix(),
        entries=len(addresses),bytes=len(raw),analysis_started=False)))


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output",help="New ignored project-local output directory")
    parser.add_argument("--destinations",action="store_true",help="Probe declared destinations of the selected direct-jump stubs")
    args=parser.parse_args()
    try:
        target=latest_target(verify=True)
        name="complement-forwarder-destinations-replay" if args.destinations else "complement-most-referenced"
        output=project_path(args.output) if args.output else ROOT/"runtime/coverage"/target["sha256"]/"ghidra"/name
        if not output.is_relative_to(ROOT/"runtime"):
            raise ValueError("Probe artifacts must remain under ignored runtime")
        prepare(output,args.destinations)
        return 0
    except (ValueError,OSError,KeyError,sqlite3.Error) as error:
        print(f"Complement probe preparation: {error}",file=sys.stderr)
        return 1


if __name__ == '__main__':
    sys.exit(main())

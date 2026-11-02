#!/usr/bin/env python3
"""Keep bulk diagnostic bindings in runtime while preserving exact full summaries.

Original full-summary bytes remain available for already executed seed/profile
commitments. Tracked reports retain counts, important ownership exceptions and
hash-bound artifact paths; no native evidence or old plan is rewritten.
"""
import argparse
import hashlib
from coverage_common import ROOT,latest_target,load_json,json_text,project_path,file_sha256
from instruction_facts import derived_json, derived_bytes, artifact_path, HELPER_SHA256 as FACTS_SHA256

def compact(report,original,*,artifact_directory=None,publish=True):
    if 'diagnostic_bindings' not in report:return report
    directory=project_path(artifact_directory or report['artifacts']['directory'])
    snapshot=directory/'full-summary.json'
    if snapshot.exists() and snapshot.read_bytes()!=original:raise ValueError('Refusing to replace an immutable full-summary snapshot')
    # Preserve the original byte stream, including historical serialization.
    derived_bytes(snapshot,original,publish=publish)
    bindings=report['diagnostic_bindings'];audit=directory/'diagnostic-bindings.json'
    derived_json(audit,{'target':report['target'],'diagnostic_bindings':bindings},publish=publish)
    result={key:value for key,value in report.items() if key!='diagnostic_bindings'}
    result['curation_generator']={'path':'scripts/compact-native-census.py','sha256':file_sha256(ROOT/'scripts/compact-native-census.py')}
    result['curation_generator']['dependencies']=[{'path':'scripts/instruction_facts.py','sha256':FACTS_SHA256}]
    result['diagnostic_binding_counts']={
        'paths':len(bindings),'custom_paths':sum(row['custom_game_crate'] for row in bindings),
        'paths_with_verified_diagnostic_sites':sum(bool(row['verified_sites']) for row in bindings),
        'paths_with_actual_native_owners':sum(bool(row['actual_native_body_owners']) for row in bindings),
        'verified_sites':sum(row['verified_sites'] for row in bindings),
        'sites_without_actual_native_owner':sum(row['sites_without_actual_ghidra_owner'] for row in bindings)}
    exceptions=[row for row in bindings if row['verified_sites'] and row['sites_without_actual_ghidra_owner']]
    result['diagnostic_owner_exceptions']={
        'paths_with_unowned_verified_sites':len(exceptions),
        'custom_paths':[{'path':row['path'],'unowned_sites':row['sites_without_actual_ghidra_owner']} for row in exceptions if row['custom_game_crate']],
        'whole_queue_paths_without_any_owner':[row['path'] for row in exceptions if not row['actual_native_body_owners']] if report['seed_scope'] in ('all','declared') else [],
        'complete_exception_records_in_diagnostic_binding_audit':True}
    result['diagnostic_binding_audit']={'path':audit.relative_to(ROOT).as_posix(),'sha256':file_sha256(audit)}
    result['full_summary_snapshot']={'path':snapshot.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(original).hexdigest()}
    return result

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('reports',nargs='*');args=parser.parse_args()
    target=latest_target()
    reports=args.reports or [str(path.relative_to(ROOT)) for path in sorted((ROOT/'docs/analysis/coverage').glob('full-image-*.json')) if 'artifacts' in load_json(path)]
    for name in reports:
        path=artifact_path(name);before=path.stat().st_size;original=path.read_bytes();report=load_json(path)
        if 'diagnostic_bindings' not in report and report.get('full_summary_snapshot'):
            retained=report['full_summary_snapshot'];source=project_path(retained['path'])
            if file_sha256(source)!=retained['sha256']:raise ValueError('Original summary snapshot differs')
            original=source.read_bytes();report=load_json(source)
        if report['target']['sha256']!=target['sha256']:raise ValueError('Only the current target is compacted')
        result=compact(report,original)
        if result is not report:derived_json(path,result,publish=True)
        print(f'{name}: {before:,} -> {path.stat().st_size:,} bytes')
if __name__=='__main__':main()

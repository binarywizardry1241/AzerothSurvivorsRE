#!/usr/bin/env python3
"""Retain exact current native residual sets without inferring source semantics.

This joins the independently verified saved Ghidra Program with the separate
linear/complement inventories. A body owner, encoded pointer or diagnostic path
is an observation; none establishes a runtime alias or an AS implementation.
"""
import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import sqlite3
import sys

from coverage_common import ROOT, latest_target, target_bytes, load_json, file_sha256, project_path, json_text
from derived_gzip import derived_gzip_text
from shared_native_inventory import open_readonly_uri as open_native_inventory

GENERATOR_SHA256 = file_sha256(Path(__file__))
DEPENDENCY_PATHS = ('scripts/summarize-native-image.py', 'scripts/inventory-current-target.py',
                    'scripts/inventory-executable.py', 'scripts/derived_gzip.py', 'scripts/coverage_common.py')


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output-directory', required=True)
    parser.add_argument('--summary-output', required=True)
    parser.add_argument('--census-summary', default='docs/analysis/coverage/full-image-selected.json')
    args = parser.parse_args()
    out = project_path(args.output_directory)
    if not out.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Bulk residual output must stay in project runtime/')
    out.mkdir(parents=True, exist_ok=True)
    dependencies = [dict(path=p, sha256=file_sha256(ROOT/p)) for p in DEPENDENCY_PATHS]
    target = latest_target(verify=True)
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    root = ROOT / 'runtime/coverage' / target['sha256']
    selected = project_path(args.census_summary)
    census = load_json(selected)
    if census['target'] != identity or not census['independent_instructions']['exact_source_bytes_verified']:
        raise ValueError('A current independently verified full-image census is required')
    helpers = module('residual_census', 'scripts/summarize-native-image.py')
    pe_helpers = module('residual_pe', 'scripts/inventory-current-target.py')
    pe = pe_helpers.pe_parser(target_bytes(target))
    directory = project_path(census['artifacts']['directory'])
    commitments = [dict(path=selected.relative_to(ROOT).as_posix(), sha256=file_sha256(selected))]
    for name, record in census['artifacts']['files'].items():
        path = directory / name
        if file_sha256(path) != record['sha256']:
            raise ValueError('Census artifact differs: ' + name)
        commitments.append(dict(path=path.relative_to(ROOT).as_posix(), sha256=record['sha256']))
    diagnostic_path = root / 'diagnostic-ownership.json'
    independent_inputs = {}
    for summary_name, inventory_path in [('diagnostic-ownership', diagnostic_path),
                                         ('instruction-summary', root/'native-instructions.sqlite'),
                                         ('unwind-complement-summary', root/'unwind-complement.sqlite')]:
        summary_path = ROOT/'docs/analysis/coverage'/f'{summary_name}.json'
        source_summary = load_json(summary_path)
        binding = source_summary['inventory']
        inventory_path = project_path(binding['path'])
        if source_summary['target'] != identity or not inventory_path.is_relative_to(ROOT / 'runtime'):
            raise ValueError('Independent inventory binding differs: '+summary_name)
        if file_sha256(inventory_path) != binding['sha256']:
            raise ValueError('Independent inventory bytes differ: '+summary_name)
        summary_binding = dict(path=summary_path.relative_to(ROOT).as_posix(), sha256=file_sha256(summary_path))
        commitments.extend([summary_binding, dict(path=binding['path'],sha256=binding['sha256'])])
        independent_inputs[summary_name] = dict(summary=summary_binding, inventory=dict(path=binding['path'],sha256=binding['sha256']))
    diagnostic = load_json(diagnostic_path)
    if diagnostic['target']['sha256'] != target['sha256']:
        raise ValueError('Diagnostic target differs')
    ranges = [(int(r['start'],16), int(r['end'],16), int(r['entry'],16))
              for r in helpers.rows(directory/'bodies.tsv.gz') if r['external']=='false']
    owner = helpers.owner_lookup(ranges)
    sections = sorted((pe.image_base+s['rva'], pe.image_base+s['rva']+s['virtual_size'], s) for s in pe.sections)
    starts = [r[0] for r in sections]
    def domain(address):
        if address is None:
            return 'external-or-unencoded'
        if pe.image_base <= address < pe.image_base+pe.u32(pe.optional+60):
            return 'PE-headers'
        i = bisect_right(starts,address)-1
        if i < 0 or address >= sections[i][1]:
            return 'outside-loaded-sections'
        s = sections[i][2]
        return 'executable' if int(s['characteristics'],16)&0x20000000 else 'data:'+s['name']
    def hx(value):
        return hex(value) if value is not None else ''
    def stream(name, columns):
        handle = derived_gzip_text(out/name, publish=True)
        return handle, columns
    artifacts = {}
    def retain(name, count):
        p = out/name
        artifacts[name] = dict(path=p.relative_to(ROOT).as_posix(), sha256=file_sha256(p), rows=count)

    # Keep every raw diagnostic record, including duplicate path/site records.
    # Context is path evidence only, and does not assign generic body semantics.
    by_owner = defaultdict(set)
    diagnostic_counts, diagnostic_context = Counter(), Counter()
    with derived_gzip_text(out/'diagnostic-sites.jsonl.gz', publish=True) as f:
        for path in diagnostic['diagnostics']:
            context = 'AS-custom-path' if path['custom_game_crate'] else 'shared-engine-or-other-path'
            for reference in path['verified_references']:
                site = int(reference['instruction_address'],16)
                actual = owner(site)
                if actual is not None:
                    by_owner[actual].add(path['path'])
                row = dict(path=path['path'], context=context, actual_body_owner=hx(actual) or None,
                           body_ownership_is_semantics=False, **reference)
                f.write(json.dumps(row,separators=(',',':'))+'\n')
                diagnostic_counts['records'] += 1
                diagnostic_counts['ownerless' if actual is None else 'owned'] += 1
                diagnostic_context[context+(':ownerless' if actual is None else ':owned')] += 1
    retain('diagnostic-sites.jsonl.gz', diagnostic_counts['records'])
    reference_counts, ownerless_destinations = Counter(), Counter()
    count = missing = 0
    with derived_gzip_text(out/'static-reference-roles.tsv.gz', publish=True) as all_refs, \
         derived_gzip_text(out/'ownerless-reference-sources.tsv.gz', publish=True) as absent:
        header='ordinal\tfrom\tto\ttype\tsource_owner\tdestination_owner\tdestination_domain\n'
        all_refs.write(header); absent.write(header)
        for i,row in enumerate(helpers.rows(directory/'references.tsv.gz')):
            source,destination=helpers.address(row['from']),helpers.address(row['to'])
            a,b=owner(source),owner(destination)
            kind=domain(destination)
            line=f"{i}\t{row['from']}\t{row['to']}\t{row['type']}\t{hx(a)}\t{hx(b)}\t{kind}\n"
            all_refs.write(line); count += 1
            reference_counts[row['type']+':'+kind] += 1
            if a is None:
                absent.write(line); missing += 1
            if kind=='executable' and b is None:
                ownerless_destinations[destination] += 1
    retain('static-reference-roles.tsv.gz',count)
    retain('ownerless-reference-sources.tsv.gz',missing)
    with derived_gzip_text(out/'unowned-executable-destinations.tsv.gz',publish=True) as f:
        f.write('destination\treference_records\n')
        for site,n in sorted(ownerless_destinations.items()):
            f.write(f'{site:x}\t{n}\n')
    retain('unowned-executable-destinations.tsv.gz',len(ownerless_destinations))
    print(f'Joined {count} Ghidra references; {missing} have sources outside bodies.',flush=True)

    # Exact independent reference sets preserve all source rows. Fixed encoded
    # destinations can be classified spatially; None stays a computed unknown.
    for name,label in [('native-instructions.sqlite','declared'),('unwind-complement.sqlite','complement')]:
        source_summary = 'instruction-summary' if label == 'declared' else 'unwind-complement-summary'
        inventory_path = project_path(independent_inputs[source_summary]['inventory']['path'])
        connection=open_native_inventory(f'file:{inventory_path}?mode=ro',uri=True)
        meta=json.loads(connection.execute('select value from metadata').fetchone()[0])
        if meta.get('target_sha256',meta.get('target',{}).get('sha256')) != target['sha256']:
            raise ValueError('Independent inventory target differs: '+name)
        indirect=ordinary=0
        with derived_gzip_text(out/(label+'-reference-roles.tsv.gz'),publish=True) as f, \
             derived_gzip_text(out/(label+'-indirect-sites.tsv.gz'),publish=True) as g:
            header='site\tkind\ttarget\toperand\taccess\tsource_owner\tdestination_owner\tdestination_domain\n'
            f.write(header);g.write(header)
            for site,kind,value,operand,access in connection.execute('select site,kind,target,operand,access from refs'):
                try:destination=int(value,16) if value is not None else None
                except ValueError:destination=None
                line=f'{site:x}\t{kind}\t{value or ""}\t{operand}\t{access}\t{hx(owner(site))}\t{hx(owner(destination))}\t{domain(destination)}\n'
                f.write(line);ordinary+=1
                if kind in ('call_indirect','jump_indirect'):
                    g.write(line);indirect+=1
            retain_name=label+'-reference-roles.tsv.gz'
        retain(retain_name,ordinary);retain(label+'-indirect-sites.tsv.gz',indirect)
        if label=='declared':
            n=0
            with derived_gzip_text(out/'declared-extent-roles.tsv.gz',publish=True) as f:
                f.write('ordinal\tstart\tend_exclusive\tdecoded_end\tentry_body_owner\tentry_diagnostic_paths\n')
                for ordinal,start,end,decoded_end in connection.execute('select ordinal,start,end,decoded_end from extents order by ordinal'):
                    actual=owner(start)
                    f.write(f'{ordinal}\t{start:x}\t{end:x}\t{decoded_end:x}\t{hx(actual)}\t{json.dumps(sorted(by_owner.get(actual,[])),separators=(",",":"))}\n');n+=1
            retain('declared-extent-roles.tsv.gz',n)
        else:
            n=0;stop_counts=Counter()
            refs_by_site=defaultdict(list)
            for site,kind,value in connection.execute('select site,kind,target from refs'):
                refs_by_site[site].append(dict(kind=kind,target=value))
            with derived_gzip_text(out/'complement-stops.jsonl.gz',publish=True) as f:
                for site,reason,end,raw,mnemonic,operands in connection.execute('select s.site,s.reason,i.end,i.bytes,i.mnemonic,i.operands from stops s left join instructions i on i.site=s.site order by s.site,s.reason'):
                    row=dict(site=hx(site),reason=reason,observed_body_owner=hx(owner(site)) or None,
                             instruction_end=hx(end),bytes=raw,mnemonic=mnemonic,operands=operands,
                             references=refs_by_site.get(site,[]),semantic_role='unestablished',stop_is_semantic_completion=False)
                    f.write(json.dumps(row,separators=(',',':'))+'\n');n+=1;stop_counts[reason]+=1
            retain('complement-stops.jsonl.gz',n)
            n=0
            with derived_gzip_text(out/'complement-region-roles.tsv.gz',publish=True) as f:
                f.write('start\tend_exclusive\tcategory\tstart_body_owner\n')
                for start,end,category in connection.execute('select start,end,category from regions order by start'):
                    f.write(f'{start:x}\t{end:x}\t{category}\t{hx(owner(start))}\n');n+=1
            retain('complement-region-roles.tsv.gz',n)
        connection.close()
        print(f'Joined all {label} reference and range records.',flush=True)

    n=total=0
    with derived_gzip_text(out/'ownerless-instructions.tsv.gz',publish=True) as f:
        f.write('address\tlength\tbytes\tflow\n')
        for row in helpers.rows(directory/'instructions.tsv.gz'):
            site=int(row['address'],16);total+=1
            if owner(site) is None:
                f.write('\t'.join(row[k] for k in ('address','length','bytes','flow'))+'\n');n+=1
    retain('ownerless-instructions.tsv.gz',n)
    if total != census['counts']['instructions'] or count != census['counts']['references']:
        raise ValueError('Complete selected inventory counts differ')
    for record in commitments:
        if file_sha256(project_path(record['path'])) != record['sha256']:
            raise ValueError('Source changed during classification: '+record['path'])
    if file_sha256(Path(__file__)) != GENERATOR_SHA256 or any(file_sha256(ROOT/r['path']) != r['sha256'] for r in dependencies):
        raise ValueError('Executed generator/dependencies changed during classification; preserve output and rerun in a new directory')
    report=dict(schema_version=1,target=identity,
                generator=dict(path='scripts/classify-native-residuals.py',sha256=GENERATOR_SHA256),
                dependencies=dependencies,inputs=commitments,independent_inputs=independent_inputs,artifacts=artifacts,
                counts=dict(instruction_records=total,ownerless_instruction_records=n,static_reference_records=count,
                            reference_records_with_ownerless_sources=missing,
                            distinct_unowned_executable_destinations=len(ownerless_destinations),
                            diagnostic_sites=dict(diagnostic_counts),diagnostic_contexts=dict(sorted(diagnostic_context.items())),
                            reference_roles=dict(sorted(reference_counts.items())),complement_stops=dict(stop_counts)),
                lead_ids=['Q41-U01','Q41-U02','Q41-U03','Q41-U04','Q41-F01','Q41-F02','Q41-A01','Q41-A02','Q41-D01','Q41-E01','Q41-G01','Q41-M01','Q41-B01'],
                explicit_residual_sets_available=True,computed_runtime_targets_complete=False,
                source_semantics_complete=False,global_aliasing_complete=False,parity_verified=False,gap_ids=[41],
                limits=['All source rows are retained, without a sampling cap. Joins describe the saved Program and independent inventories only.',
                        'A Location/path is context, not complete function/source ownership. Header/data reference sources outside code do not imply missing executable instructions.',
                        'Spatial body/data/import classifications do not prove reachable calls, runtime values, data types, padding or native/source equivalence.',
                        'Generic engine reconstruction remains supporting context. AS diagnostic counts include cooperative gameplay/network/server paths under #63. No application compilation or execution.'])
    destination=project_path(args.summary_output)
    destination.parent.mkdir(parents=True,exist_ok=True)
    destination.write_text(json_text(report))
    print(json_text(report['counts']))


if __name__=='__main__':
    main()

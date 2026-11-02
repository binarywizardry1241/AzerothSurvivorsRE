#!/usr/bin/env python3
"""Select current diagnostic-associated dispatch without inventing body owners.

The existing whole-image collector can replay these exact, bounded switch edges
and custom diagnostic code starts.  Declared extents only bound the selection;
they never become function bodies or incoming control-flow edges.
"""
import argparse
from bisect import bisect_right
from collections import Counter
import importlib.util

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path


def select_tables(tables, spans):
    """Retain whole already-proved tables; never trim individual case indices."""
    ordered = sorted(spans)
    starts = [start for start, _ in ordered]
    selected = []
    for table in tables:
        site = int(table['site'], 16)
        index = bisect_right(starts, site) - 1
        if index >= 0 and site < ordered[index][1]:
            selected.append(table)
    return selected


def select_leads(records, custom_paths):
    return [record for record in records
            if record['classification'] == 'undecoded-exact-diagnostic-lead'
            and set(record['diagnostic_paths']) & custom_paths]


def committed(path):
    return {'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary', required=True)
    parser.add_argument('--jump-summary', required=True)
    parser.add_argument('--diagnostic-leads', required=True)
    parser.add_argument('--output', required=True, help='New project-local directory')
    args = parser.parse_args()
    target = latest_target(verify=True)
    census_path = project_path(args.census_summary)
    census = load_json(census_path)
    jump_path = project_path(args.jump_summary)
    jump = load_json(jump_path)
    proposal_path = project_path(jump['inventory']['path'])
    if file_sha256(proposal_path) != jump['inventory']['sha256']:
        raise ValueError('Jump proposal inventory commitment differs')
    proposal = load_json(proposal_path)
    lead_path = project_path(args.diagnostic_leads)
    leads = load_json(lead_path)
    diagnostic_path = project_path(leads['diagnostic_input']['path'])
    if file_sha256(diagnostic_path) != leads['diagnostic_input']['sha256']:
        raise ValueError('Diagnostic source commitment differs')
    diagnostics = load_json(diagnostic_path)
    for payload in (census, jump, proposal, leads, diagnostics):
        if payload['target']['sha256'] != target['sha256']:
            raise ValueError('All selected inputs must name the installed target')
    for payload in (jump, proposal, leads):
        if payload['census_summary_sha256'] != file_sha256(census_path):
            raise ValueError('Selected inputs do not share the exact source census')
    if not census['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Independent exact-byte census is required')
    spec = importlib.util.spec_from_file_location('custom_dispatch_pe', ROOT / 'scripts/inventory-current-target.py')
    helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(helper)
    pe = helper.pe_parser(target_bytes(target))
    declared = {(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()}
    custom_paths = set()
    spans = set()
    references = []
    for row in diagnostics['diagnostics']:
        if not row['custom_game_crate']:
            continue
        custom_paths.add(row['path'])
        for reference in row['verified_references']:
            site = int(reference['instruction_address'], 16)
            raw = bytes.fromhex(reference['instruction_bytes'])
            offset = pe.rva_offset(site - pe.image_base)
            if pe.data[offset:offset + len(raw)] != raw:
                raise ValueError('Custom diagnostic instruction bytes differ')
            if reference.get('runtime_function_start') is not None:
                span = (int(reference['runtime_function_start'], 16), int(reference['runtime_function_end'], 16))
                if span not in declared or not span[0] <= site < span[1]:
                    raise ValueError('Custom diagnostic declared-extent binding differs')
                spans.add(span)
                references.append({'path': row['path'], 'site': hex(site),
                                   'declared_start': hex(span[0]), 'declared_end_exclusive': hex(span[1])})
    tables = select_tables(proposal['tables'], spans)
    code_leads = select_leads(leads['records'], custom_paths)
    output = project_path(args.output)
    output.mkdir(parents=True, exist_ok=False)
    generator = committed(ROOT / 'scripts/select-custom-native-dispatch.py')
    parents = [committed(path) for path in (census_path, jump_path, proposal_path, lead_path, diagnostic_path)]
    selection = {'generator': generator, 'inputs': parents,
                 'rule': 'Whole proved tables whose dispatch site is inside a current declared extent containing a verified custom diagnostic reference.',
                 'declared_extents_are_only_selection_bounds': True,
                 'native_body_or_incoming_edges_inferred_from_diagnostics': False,
                 'custom_paths': len(custom_paths), 'diagnostic_associated_declared_extents': len(spans),
                 'selected_tables': len(tables), 'unselected_tables': len(proposal['tables']) - len(tables),
                 'custom_code_only_seeds': len(code_leads)}
    selected = dict(proposal, tables=tables, candidate_tables=[], custom_selection=selection)
    selected['counts'] = {'guarded-relative-tables': len(tables)}
    inventory = output / 'guarded-jump-tables.json'
    inventory.write_text(json_text(selected))
    summary = {key: value for key, value in jump.items()
               if key not in ('inventory', 'counts', 'case_entries', 'unique_target_addresses', 'edge_digest',
                              'rejected_scalar_domain_tables', 'alias_guard_tables')}
    edges = sorted({(int(table['site'], 16), int(value, 16)) for table in tables for value in table['case_targets']})
    spec = importlib.util.spec_from_file_location('custom_dispatch_census', ROOT / 'scripts/summarize-native-image.py')
    census_helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(census_helper)
    summary.update(inventory=committed(inventory), counts=selected['counts'],
                   case_entries=sum(len(table['case_targets']) for table in tables),
                   unique_target_addresses=len({value for table in tables for value in table['case_targets']}),
                   edge_digest=census_helper.flow_edge_digest(edges), rejected_scalar_domain_tables=0,
                   alias_guard_tables=sum(table['selector_alias_proof'] is not None for table in tables),
                   custom_selection=selection)
    (output / 'guarded-jump-tables-summary.json').write_text(json_text(summary))
    code = dict(leads, records=code_leads, code_only_seeds=code_leads,
                counts=dict(Counter(record['classification'] for record in code_leads)), custom_selection=selection)
    (output / 'diagnostic-code-leads.json').write_text(json_text(code))
    (output / 'selection.json').write_text(json_text(dict(target=census['target'], selection=selection, references=references)))
    print(json_text(selection))


if __name__ == '__main__':
    main()

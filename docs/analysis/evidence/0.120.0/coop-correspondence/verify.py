#!/usr/bin/env python3
"""Recheck bounded 0.120.0 correspondence receipts; no compilation or game."""
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

ROOT = next(p for p in Path(__file__).resolve().parents if (p / 'scripts/coverage_common.py').is_file())
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target, target_bytes

HERE = Path(__file__).resolve().parent
proof = json.loads((HERE / 'manifest.json').read_text())
target = latest_target(verify=True)
assert {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')} == proof['target']
blob = target_bytes(target)
spec = importlib.util.spec_from_file_location('correspondence_pe', ROOT / 'scripts/inventory-executable.py')
pe_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pe_module)
pe = pe_module.PE(blob)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = ROOT / row['path']
    assert path.is_relative_to(ROOT)
    raw = path.read_bytes()
    assert digest(raw) == row['sha256'], row['path']
    return raw


receipt(proof['predecessor'])
for row in proof['ranges'] + proof['data_ranges']:
    start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
    offset = pe.rva_offset(start - pe.image_base)
    assert offset == int(row['file_offset'], 16)
    raw = blob[offset: offset + end - start]
    assert len(raw) == row['byte_count'] and digest(raw) == row['sha256'], row['role']
    if 'bytes_hex' in row:
        assert raw.hex() == row['bytes_hex']
    if 'assembly' in row:
        receipt(row['assembly'])
diagnostics = json.loads(receipt(proof['current_module_anchor_input']))
assert diagnostics['target'] == proof['target']
for anchor in proof['native_module_anchors']:
    owners = [row for row in diagnostics['diagnostics']
              if row['path'] == anchor['diagnostic_path'] and row['system_id'] == anchor['system_id']]
    assert len(owners) == 1 and anchor['bounded_owners']
    assert all(row in owners[0]['verified_references'] for row in anchor['bounded_owners'])
assert set(proof['bounded_contract_system_ids']) == {row['system_id'] for row in proof['native_module_anchors']}
for row in proof['queries']:
    data = json.loads(receipt(row['result']))['structuredContent']
    assert data['subject']['digest']['sha256'] == proof['target']['sha256']
    assert data['parameters']['procedure'] == row['procedure']
    assert data['evidence_id'] == row['evidence_id']
    assert data['analysis_profile']['digest'] == row['analysis_profile_digest']
    assert digest(data['normalized_result'].encode()) == row['normalized_text_sha256']
    receipt(row['plan'])
    journal = json.loads(receipt(row['journal']))
    assert journal['status'] == 'completed'
for row in proof['source_slices']:
    source = (ROOT / row['path']).read_text()
    start = source.index(row['start_marker'])
    end = source.index(row['end_marker'], start)
    assert digest(source[start:end].encode()) == row['sha256'], row['path']
result = json.loads(receipt(proof['liveness_replay']))
receipt(proof['replay_tool'])
assert result['target_sha256'] == proof['target']['sha256']
assert result['native_cases'] == len(result['cases']) == 36
assert result['native_instructions'] == 1458
print(f"Verified {len(proof['ranges'])} current code ranges, {len(proof['data_ranges'])} guarded table, "
      f"{len(proof['queries'])} saved Ghidra results, {len(proof['source_slices'])} source slices and 36 liveness receipts. "
      "No compilation, source/game/network/server execution or parity check.")

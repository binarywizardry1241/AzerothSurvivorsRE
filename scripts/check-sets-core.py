#!/usr/bin/env python3
"""Verify current set core evidence and source-owned descriptor data without builds."""
from runtime_layout import retained_runtime_path
import hashlib
import json
from pathlib import Path
import platform
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / 'docs/analysis/evidence/0.121.0/sets-core'


def sha(value):
    return hashlib.sha256(value).hexdigest()


def retained(row):
    path = retained_runtime_path(ROOT / row['path'], ROOT)
    assert sha(path.read_bytes()) == row['sha256'], row['path']
    return path


def main():
    proof = json.loads((BASE / 'manifest.json').read_text())
    target = latest_target(verify=True)
    assert {k: target[k] for k in ('version','path','sha256','size_bytes')} == proof['target']
    image = target_bytes(target)
    pe = load_script('sets_check_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['native_ranges'] + proof['native_data']:
        address = int(row['virtual_address'],16)
        offset = pe.rva_offset(address-pe.image_base)
        value = image[offset:offset+row['byte_count']]
        assert offset == int(row['file_offset'],16)
        assert value == bytes.fromhex(row['bytes_hex']) and sha(value) == row['sha256']
    for query in proof['queries']:
        saved = json.loads(retained(query['result']).read_text())['structuredContent']
        assert sha(saved['normalized_result'].encode()) == query['normalized_text_sha256']
        verify_native_query_subject(ROOT,saved,query,proof['target'],image=image,pe=pe)
    for row in proof['source_bindings']:
        retained(row)
    recover = load_script('sets_replay',ROOT/'scripts/recover-sets-core.py')
    replay = recover.recover()
    expected=[]
    for row in replay['cases']:
        if row['present'] and row['multiplier'] in (1.0,1.5):
            expected.append(dict(class_id=row['class_id'],tier=row['tier'],empowered=row['multiplier']==1.5,
                spell_key=row['name'],description=row['description'],display_values=row['display_values'],effects=row['effects']))
    asset = json.loads((ROOT/'crates/azeroth-survivors-re/assets/sets-0.121.0.json').read_text())
    assert asset == dict(target_sha256=target['sha256'],entries=expected)
    assert len(expected)==108
    assert len({(row['class_id'],row['tier'],row['empowered']) for row in expected})==108
    source = (ROOT/'crates/azeroth-survivors-re/src/sets.rs').read_text()
    # These anchors bind the reviewed live interfaces, not Rust execution.
    for anchor in ('pub fn active(', 'pub fn item_set_id(', 'pub fn equipped_descriptor(',
                   'pub fn descriptor(', 'pub struct NativeEffect',
                   'lookup(canonical_item(id))','minimum[piece.tier].min(rank)',
                   'minimum[tier] >= 3','minimum[tier] >= 5'):
        assert anchor in source, anchor
    host={('Darwin','arm64'):'aarch64-apple-darwin',('Darwin','x86_64'):'x86_64-apple-darwin',
          ('Linux','aarch64'):'aarch64-unknown-linux-gnu',('Linux','x86_64'):'x86_64-unknown-linux-gnu'}
    parser=ROOT/'.tools/rust'/('1.98.1-'+host[(platform.system(),platform.machine())])/'bin/rustfmt'
    assert parser.is_file()
    syntax=subprocess.run([str(parser),'--edition','2024','--emit','stdout','--config','skip_children=true'],
        input=source,text=True,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE,timeout=30,cwd=ROOT)
    assert syntax.returncode==0,syntax.stderr
    print(json.dumps(dict(target_sha256=target['sha256'],native_ranges=len(proof['native_ranges']),
        native_data_spans=len(proof['native_data']),query_subjects=len(proof['queries']),
        descriptor_cases=len(replay['cases']),consumer_cases=len(replay['consumer_cases']),
        source_descriptors=len(expected),original_instruction_steps=replay['original_instruction_steps'],
        rust_syntax_parsed=True,compilation='not_run',application_executed=False,parity_verified=False),indent=2))


if __name__=='__main__':
    main()

#!/usr/bin/env python3
"""Verify the current AS category-to-art table and its source consumer."""
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

proof = json.loads((ROOT / 'docs/analysis/evidence/0.121.0/achievement-category-icons.json').read_text())
target = latest_target(verify=True)
assert all(target[key] == value for key, value in proof['target'].items())
image = target_bytes(target)
pe = load_script('category_icons_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
for row in proof['native_ranges']:
    address = int(row['virtual_address'], 16)
    offset = pe.rva_offset(address - pe.image_base)
    assert hashlib.sha256(image[offset:offset + row['byte_count']]).hexdigest() == row['sha256']
a = int(proof['relative_table'], 16)
o = pe.rva_offset(a - pe.image_base)
p = pe.rva_offset(int(proof['length_table'], 16) - pe.image_base)
relative = struct.unpack('<8i', image[o:o + 32])
lengths = struct.unpack('<8Q', image[p:p + 64])
for index, (relative, length, row) in enumerate(zip(relative, lengths, proof['icons'])):
    address = a + relative
    offset = pe.rva_offset(address - pe.image_base)
    raw = image[offset:offset + length]
    assert row['category'] == index - 1 and row['virtual_address'] == hex(address)
    assert row['byte_count'] == length and row['value'] == raw.decode('utf8')
    assert row['sha256'] == hashlib.sha256(raw).hexdigest()
query = proof['query']
native = json.loads(project_path(query['result']['path']).read_text())['structuredContent']
verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
source = (ROOT / 'crates/azeroth-survivors-re/src/progression.rs').read_text()
match = re.search(r'const CATEGORY_ICONS: \[&str; 7\] = \[([^]]+)\]', source)
assert re.findall(r'"([^"]+)"', match[1]) == [row['value'] for row in proof['icons'][1:]]
assert 'const CATEGORIES: [&str; 7]' in source
sidebar = (ROOT / 'crates/azeroth-survivors-re/src/progression/achievements_sidebar.rs').read_text()
assert 'CATEGORY_ICONS[index]' in sidebar and '"INV_Misc_Note_01"' in sidebar
assert 'names.extend(CATEGORY_ICONS)' in source
print(json.dumps(dict(categories=7, summary_icons=1, target_verified=True,
                     compilation='not_run', application_executed=False), indent=2))

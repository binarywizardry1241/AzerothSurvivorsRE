#!/usr/bin/env python3
"""Check current Warlock definitions/descriptions with original x64 instructions.

No compiler or application is launched. The shared fixture supplies explicit
allocation/C-memory/roundf seams and English localization fallback.
"""
import argparse
import hashlib
import json
import re
import struct

import native_talent_fixture as native

ROOT = native.ROOT
SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
ASSET = ROOT/'crates/azeroth-survivors-re/assets/warlock-talents-0.112.0.json'
PROOF = ROOT/'docs/analysis/evidence/warlock-talents/definitions.json'
DESCRIPTORS = 0x14723e9d8
FORMATTER = 0x14599ddf0
MILESTONE = 0x14599e380


def raw(address, size):
    offset = native.pe.rva_offset(address-native.pe.image_base)
    if offset is None or size < 0 or offset+size > len(native.data):
        raise ValueError('Unmapped current target range')
    return native.data[offset:offset+size]


def pair(address):
    return struct.unpack('<QQ', raw(address, 16))


def text(address):
    pointer, size = pair(address)
    return raw(pointer, size).decode() if pointer else None


def span(address, size):
    return dict(address=hex(address), byte_count=size,
                sha256=hashlib.sha256(raw(address, size)).hexdigest())


def values(template, rendered):
    names = re.findall(r'\{(v2?)\}', template)
    expression = re.escape(template)
    for name in names:
        expression = expression.replace(re.escape('{'+name+'}'), r'(?P<'+name+r'>[^\n]*?)', 1)
    match = re.fullmatch(expression, rendered)
    if not match:
        raise ValueError((template, rendered))
    return match.groupdict()


def recover():
    if native.target['sha256'] != SHA:
        raise ValueError('Exact installed 0.112.0 target required')
    vm = native.Machine()
    trees, definitions, cases = [], [], []
    for tree_index in range(3):
        descriptor = DESCRIPTORS+tree_index*64
        pointer, count = pair(descriptor+48)
        tree = dict(name=text(descriptor), background=text(descriptor+16),
                    icon=text(descriptor+32), talents=[])
        if not 10 <= count <= 20:
            raise ValueError('Unexpected current Warlock definition count')
        for index in range(count):
            address = pointer+index*160
            row = {key: text(address+offset) for key, offset in [
                ('key',48), ('name',64), ('icon',80), ('description',112),
                ('prerequisite',0), ('alternative_prerequisite',16),
                ('supremacy_description',128)]}
            row.update(zip(('row','column','max_rank','exclusive'), raw(address+152,4)))
            row['exclusive'] = bool(row['exclusive'])
            row['milestone'] = bool(vm.call(MILESTONE,address)&255)
            row['numeric_values'],row['secondary_numeric_values'],row['supremacy_numeric_values'] = [],[],[]
            rendered_ranks = []
            for rank in range(1,row['max_rank']+1):
                out = vm.alloc(24)
                vm.call(FORMATTER,out,address,rank)
                rendered = bytes(vm.u.mem_read(vm.q(out+8),vm.q(out+16))).decode()
                base, separator, supremacy = rendered.partition('\nSupremacy:')
                numeric = values(row['description'],base)
                row['numeric_values'].append(numeric.get('v'))
                row['secondary_numeric_values'].append(numeric.get('v2'))
                if row['supremacy_description'] is not None:
                    if not separator:
                        raise ValueError('Missing current Supremacy line')
                    extra = values(row['supremacy_description'],'Supremacy:'+supremacy)
                    row['supremacy_numeric_values'].append(extra.get('v'))
                elif separator:
                    raise ValueError('Unexpected Supremacy line')
                rendered_ranks.append(rendered)
                cases.append(dict(key=row['key'],rank=rank,description=rendered))
            effects_pointer,effects_count = pair(address+96)
            definitions.append(dict(key=row['key'],record=span(address,160),
                                    effects=span(effects_pointer,effects_count*64),
                                    native_effects=[raw(effects_pointer+i*64,64).hex() for i in range(effects_count)]))
            tree['talents'].append(row)
        trees.append(tree)
    asset = dict(target_sha256=SHA,id=9,trees=trees)
    proof = dict(target_sha256=SHA,version='0.112.0',descriptors=span(DESCRIPTORS,3*64),
                 formatter=span(FORMATTER,0x14599e1ee-FORMATTER),milestone=span(MILESTONE,73),
                 definitions=definitions,descriptions=cases,
                 executable_instruction_addresses=len(vm.executed),
                 seams=[hex(a) for a in sorted(vm.seams)],
                 limits=['Bounded native definitions/rank formatting; not rendered UI, localization resource lookup, gameplay or parity.'])
    return asset,proof


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    args=parser.parse_args()
    manifest_path = PROOF.parent/'manifest.json'
    manifest = json.loads(manifest_path.read_text())
    if manifest['target_sha256'] != SHA:
        raise ValueError('Warlock extraction target differs')
    for row in manifest['ranges']:
        if hashlib.sha256(raw(int(row['address'],16),row['byte_count'])).hexdigest() != row['sha256']:
            raise ValueError('Warlock native range differs: '+row['role'])
        for field in ('assembly','pseudocode'):
            if field in row:
                path = manifest_path.parent/row[field]
                if hashlib.sha256(path.read_bytes()).hexdigest() != row[field+'_sha256']:
                    raise ValueError('Warlock canonical extract differs: '+row[field])
    asset,proof=recover()
    for path,value in [(ASSET,asset),(PROOF,proof)]:
        serialized=json.dumps(value,indent=2,ensure_ascii=False)+'\n'
        if args.write:
            path.parent.mkdir(parents=True,exist_ok=True)
            path.write_text(serialized)
        elif path.read_text()!=serialized:
            raise ValueError(f'Missing/stale current definitions: {path.relative_to(ROOT)}')
    print(f"40 current Warlock definitions, {len(proof['descriptions'])} rank descriptions and milestone records pass; no build or game run.")


if __name__=='__main__':
    main()

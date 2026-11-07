#!/usr/bin/env python3
"""Extract the SHA-bound0.92 picker name fragments; never execute the reference."""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = '47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'

def main():
    data = (ROOT/'AzerothSurvivors/AzerothSurvivors.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == EXPECTED
    spec = importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    catalog, tables = {}, []
    for kind, address, count in [('prefix',0x1458e4778,20),('middle',0x1458e48e0,16),('suffix',0x1458e49f0,10)]:
        offset = pe.rva_offset(address-pe.image_base)
        values, entries = [], []
        for index in range(count):
            pointer, length = struct.unpack_from('<QQ',data,offset+index*16)
            location = pe.rva_offset(pointer-pe.image_base)
            value = data[location:location+length].decode('utf-8')
            assert value.isascii() and (not value or value.isalpha())
            values.append(value)
            entries.append(dict(index=index,address=hex(pointer),file_offset=hex(location),byte_count=length,value=value))
        catalog[kind] = values
        tables.append(dict(kind=kind,address=hex(address),file_offset=hex(offset),stride=16,count=count,entries=entries))
    output = ROOT/'crates/azeroth-survivors-re/assets/hero-name.json'
    output.write_text(json.dumps(catalog,indent=2)+'\n')
    report = ROOT/'docs/analysis/evidence/picker-name-native.json'
    evidence = json.loads(report.read_text())
    assert evidence['artifact_sha256'] == EXPECTED
    evidence.update(tables=tables,output=str(output.relative_to(ROOT)),output_sha256=hashlib.sha256(output.read_bytes()).hexdigest())
    report.write_text(json.dumps(evidence,indent=2)+'\n')
    print('Recovered20prefixes/16middles/10suffixes from0.92 native name producer tables.')

if __name__ == '__main__':
    main()

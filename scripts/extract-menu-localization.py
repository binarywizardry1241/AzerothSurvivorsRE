#!/usr/bin/env python3
"""Extract the ten JSON locales embedded in the SHA-bound 0.92 executable."""
import hashlib
import importlib.util
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors.exe'
EXPECTED = '47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'
LOCALES = [('en','English'),('pl','Polski'),('de','Deutsch'),('pt','Português (Brasil)'),
           ('es','Español'),('fr','Français'),('tr','Türkçe'),('ru','Русский'),
           ('zh','简体中文'),('ko','한국어')]

def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == EXPECTED
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    inv = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inv)
    pe = inv.PE(data)
    starts = [m.start() for m in re.finditer(rb'\{\r?\n  "game.title":', data)]
    assert len(starts) == len(LOCALES), starts
    out = ROOT / 'crates/azeroth-survivors-re/assets/locales'
    out.mkdir(parents=True, exist_ok=True)
    records = []
    for (code, name), start in zip(LOCALES, starts):
        # Decode a generous window, but retain only the exact successfully parsed JSON prefix.
        text = data[start:start+1_000_000].decode('utf-8', errors='replace')
        catalog, end = json.JSONDecoder().raw_decode(text)
        payload = text[:end].encode('utf-8')
        assert data[start:start+len(payload)] == payload
        assert all(isinstance(k,str) and isinstance(v,str) for k,v in catalog.items())
        assert catalog['picker.language']
        if code != 'en':
            assert data[start-len(name.encode()):start] == name.encode()
            assert data[start-len(name.encode())-2:start-len(name.encode())] == code.encode()
        path = out / f'{code}.json'
        path.write_text(json.dumps(catalog, ensure_ascii=False, indent=2)+'\n')
        records.append(dict(code=code,native_name=name,file_offset=hex(start),
                            virtual_address=hex(pe.offset_va(start)),byte_count=len(payload),
                            embedded_sha256=hashlib.sha256(payload).hexdigest(),labels=len(catalog),
                            output=str(path.relative_to(ROOT)),
                            output_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
        print(f'{code}: {len(catalog)} labels at {start:#x}, {len(payload)} bytes')
    report = dict(date='2026-10-16',target=str(TARGET.relative_to(ROOT)),
                  artifact_sha256=EXPECTED,version='0.92.0',target_executed=False,
                  method='Exact JSON object parse from each embedded locale; code/name byte prefixes validated for nine non-English objects.',
                  locales=records,
                  limitations=['Catalog presence establishes translated source text, not that every owned UI consumer is connected.',
                               'Font coverage and locale-specific runtime rendering require separate validation.'])
    (ROOT/'docs/analysis/evidence/menu-localization.json').write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n')

if __name__ == '__main__':
    main()

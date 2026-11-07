#!/usr/bin/env python3
"""Hash and source guards for recipient item text; no Rust/native execution."""
import hashlib
import importlib.util
import json
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes

PROOF = ROOT / 'docs/analysis/evidence/coop-item-text/manifest.json'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src'


def number(value):
    return int(value, 0) if isinstance(value, str) else int(value)


def native_checks():
    proof = json.loads(PROOF.read_text())
    target = latest_target(verify=True)
    assert target['version'] == proof['target']['version'] == '0.115.0'
    assert target['sha256'] == proof['target']['sha256']
    for field in ('path', 'size_bytes'):
        if field in proof['target']:
            assert proof['target'][field] == target[field], field
    assert proof['target_executed'] is False
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('coop_item_text_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(image)
    count = 4
    assert proof['ranges'], 'item text proof needs bounded native ranges'
    intervals = set()
    for row in proof['ranges']:
        start, end = number(row['start']), number(row['end_exclusive'])
        assert (start, end) not in intervals and start < end, row['start']
        intervals.add((start, end))
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == number(row['file_offset']), row['start']
        assert pe.rva_offset(end - 1 - pe.image_base) == offset + end - start - 1
        data = image[offset:offset + end - start]
        assert len(data) == end - start
        assert hashlib.sha256(data).hexdigest() == row['sha256'], row['start']
        count += 5
        if 'extract' in row:
            extract = row['extract']
            text = project_path(extract['path']).read_bytes()
            assert hashlib.sha256(text).hexdigest() == extract['sha256'], extract['path']
            assert text and all(line == line.rstrip() for line in text.splitlines())
            evidence = row.get('ghidra_evidence_id', extract.get('ghidra_evidence_id'))
            profile = next((entry[key] for entry in (row, extract)
                            for key in ('ghidra_profile', 'ghidra_analysis_profile', 'profile')
                            if key in entry), None)
            assert isinstance(evidence, str) and re.fullmatch(r'ev_[0-9a-f]{64}', evidence)
            assert isinstance(profile, str) and re.fullmatch(r'[0-9a-f]{64}', profile)
            count += 4
    contract = proof['contracts']
    table = number(contract['request_jump_table'])
    table_offset = pe.rva_offset(table - pe.image_base)
    item_case = table + struct.unpack_from('<i', image, table_offset + (0x56 - 0x4b) * 4)[0]
    assert item_case == number(contract['item_branch']) == 0x145873da2
    assert contract['chat_transformer_opcodes'] == ['0x96']
    assert contract['chat_transformer_types'] == ['0xc', '0x5a']
    assert contract['first_text_spell'] == '0xf00000'
    count += 4
    for reference in proof.get('canonical_references', []):
        bound = json.loads(project_path(reference).read_text())
        assert bound['target']['sha256'] == target['sha256'], reference
        count += 1
    return count


def code_mask(source):
    """Mask comments/strings without moving braces or source offsets."""
    pattern = re.compile(
        r'//[^\n]*|/\*.*?\*/|r(?P<hashes>\#*)".*?"(?P=hashes)'
        r'|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])\'', re.S)
    return pattern.sub(lambda match: ''.join('\n' if c == '\n' else ' '
                                            for c in match[0]), source)


def body(source, declaration):
    mask = code_mask(source)
    match = re.search(declaration, mask)
    assert match, declaration
    start = mask.find('{', match.end())
    assert start >= 0, declaration
    depth = 1
    for end in range(start + 1, len(mask)):
        depth += (mask[end] == '{') - (mask[end] == '}')
        if depth == 0:
            return source[start + 1:end]
    raise AssertionError(f'unclosed source body: {declaration}')


def compact(source):
    return re.sub(r'\s+', '', code_mask(source))


def source_checks():
    count = 0

    def require(source, *tokens):
        nonlocal count
        code = compact(source)
        for token in tokens:
            assert compact(token) in code, token
            count += 1

    def nonpersisting(source):
        nonlocal count
        code = compact(source)
        for token in ('.select(', 'std::fs::', 'std::env::set_var(', 'language.txt'):
            assert token not in code, token
            count += 1

    locale = (SOURCE / 'localization.rs').read_text()
    view = body(locale, r'\bfn\s+for_code\s*\(')
    require(view, 'language_index(code).unwrap_or(0)', 'path: None',
            'self.catalogs[0].clone()', 'self.catalogs[index].clone()')
    nonpersisting(view)
    catalog = body(locale, r'\bfn\s+menu_catalog\s*\(')
    require(catalog, 'MenuCatalog::embedded()',
            'translated.labels = self.catalogs[0].clone()',
            'translated.labels.extend(self.catalogs[self.index].clone())')
    nonpersisting(catalog)
    require(body(locale, r'\bfn\s+apply\s*\('), '*catalog = self.menu_catalog()')

    inventory = (SOURCE / 'gameplay/client/inventory.rs').read_text()
    require(inventory, 'static NEXT_JEWELRY: AtomicU32 = AtomicU32::new(0)')
    require(body(body(inventory, r'\bimpl\s+Publisher\b'), r'\bfn\s+publish\s*\('),
            '900_000 + NEXT_JEWELRY.fetch_add(1, Ordering::Relaxed) % 100_000_000')
    assert 'next_jewelry' not in body(inventory, r'\bstruct\s+Publisher\b')
    count += 1
    require(body(inventory, r'\bstruct\s+ItemLocale\b'),
            'code: String', 'locale: Localization', 'labels: MenuCatalog')
    item_locale = body(inventory, r'\bimpl\s+ItemLocale\b')
    require(body(item_locale, r'\bfn\s+new\s*\('), 'host.for_code(code)', 'locale.menu_catalog()')
    nonpersisting(item_locale)
    remote_fields = body(inventory, r'\bstruct\s+RemoteInventory\b')
    require(remote_fields, 'display: Option<ItemLocale>')
    assert 'LocalItemDescriptions' not in remote_fields, 'item text IDs use the shared process registry'
    count += 1
    remote = body(inventory, r'\bimpl\s+RemoteInventory\b')
    require(body(remote, r'\bfn\s+set_locale\s*\('),
            'display.code != code', 'ItemLocale::new(host, code)')
    publish = body(remote, r'\bfn\s+publish\s*\(')
    require(publish, 'self.set_locale(host, &String::from_utf8_lossy(&hero.bytes_30))',
            'equipped(armory, &display.labels, hero.race, hero.class, hero.words_188)',
            'temporary(game, &display.locale, &display.labels)')
    query = body(remote, r'\bfn\s+query\s*\(')
    require(query, 'self.set_locale(host, code)', 'definition(armory, &display.labels, entry)',
            'self.publisher.rows.iter()', 'item.template(texts)',
            'SessionEvent::ItemTemplate')
    nonpersisting(remote)

    commands = (SOURCE / 'gameplay/coop_commands.rs').read_text()
    require(commands, 'state.profiles.get(&client)', 'String::from_utf8_lossy(&hero.bytes_30)')
    assert re.search(r'item_texts\s*:\s*ResMut<[^>]*\bLocalItemDescriptions\s*>', commands)
    count += 1
    item_query = body(commands, r'opcode::CMSG_ITEM_QUERY_SINGLE\s*=>')
    require(item_query, 'state.inventory.entry(client)',
            '.query(entry, &armory, &locale, &language, &mut item_texts)')
    nonpersisting(item_query)
    for path, function in [('coop.rs', 'bootstrap'), ('coop_publish.rs', 'publish')]:
        source = (SOURCE / 'gameplay' / path).read_text()
        live = body(source, rf'\bfn\s+{function}\s*\(')
        require(live, '.inventory.entry(client)',
                '.publish(identity, &hero, game, &armory, &locale)', 'game.with_party_hero(slot')
    print('Rust recipient catalog regressions authored: '
          f'{len(re.findall(r"fn recipient_catalogs_", locale))}; uncompiled/unrun')
    return count


def main():
    native = native_checks()
    source = source_checks()
    print(f'PASS: {native} selected-target byte/extract guards; {source} recipient item-source guards; '
          'no compilation, native instruction execution, network, game or parity validation')


if __name__ == '__main__':
    main()

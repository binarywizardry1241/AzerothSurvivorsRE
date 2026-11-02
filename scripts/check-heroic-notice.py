#!/usr/bin/env python3
"""Verify Heroic clear chat/ignored frontend contracts without compiling."""
import argparse
import hashlib
import itertools
import json
import platform
import re
import struct
import subprocess
from collections import deque

from coverage_common import ROOT, latest_target, target_bytes
from native_terminal import NativeReplay
from script_sources import load_script


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    directory = ROOT / 'docs/analysis/evidence/0.121.0/heroic-notice'
    proof = json.loads((directory / 'manifest.json').read_text())
    target = latest_target(verify=True)
    assert proof['target'] == {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(target)
    pe = load_script('notice_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    common = load_script('notice_common', ROOT / 'scripts/check-boss-prediction.py')
    common.verify(proof, image, pe)
    native = NativeReplay(image, pe)
    u, r = native.machine, native.registers
    source = lambda name: (ROOT / 'crates/azeroth-survivors-re/src' / name).read_text()
    compact = lambda text: re.sub(r'\s+', '', text)
    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return image[at:at + size]
    def text(address, size):
        return bytes(raw(address, size)).decode()
    def string(address):
        pointer, count = struct.unpack('<QQ', raw(address, 16))
        return text(pointer, count)

    catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu.json').read_text())
    tiers = struct.unpack('<12Q', raw(0x147662fc8, 96))
    source_tiers = re.findall(r'key: "([^"]+)",\s*tier: (\d+)', source('mob_loot_catalog.rs'))
    assert len(source_tiers) == 12
    for index, (key, tier) in enumerate(source_tiers):
        assert string(0x146fbe250 + index * 240 + 8) == key
        assert tiers[index] == int(tier)
        zone = next(row for row in catalog['zones'] if row['key'] == key)
        assert string(0x146fbe250 + index * 240 + 0x18) == zone['name']
    class_table = struct.unpack('<10Q', raw(0x147664148, 80))
    for class_id in range(1, 12):
        at = 0x146fc05a0 if class_id == 1 else class_table[class_id - 2]
        key, fallback = string(at + 0x10), string(at + 0x20)
        assert any(row['key'] == key and row['name'] == fallback for row in catalog['classes'])
    for tier in range(6):
        assert string(0x14765c570 + tier * 16) == catalog['labels'][f'rarity.{tier}']
    assert bytes(raw(0x146fb228e, 13)) == b'\x05zone.\xc0\x05.name'
    assert bytes(raw(0x146fb21f0, 14)) == b'\x06class.\xc0\x05.name'
    notice = source('gameplay/heroic_progress.rs')
    assert text(0x147663028, 81) in notice and text(0x147663087, 32) in notice
    assert bytes(raw(0x1476630a7, 16)) == b'\x0a|cff40ff40\xc0\x02|r\0'
    assert 'format!("|cff40ff40{text}|r")' in notice
    localization = proof['localization']
    table = localization['locale_table']
    assert hashlib.sha256(raw(int(table['virtual_address'], 16), table['byte_count'])).hexdigest() == table['sha256']
    dependent_keys = [f"zone.{row['key']}.name" for row in catalog['zones']] + \
        [f"class.{row['key']}.name" for row in catalog['classes']] + [f'rarity.{tier}' for tier in range(6)]
    for row in localization['locales']:
        for kind in ['descriptor', 'payload']:
            receipt = row[kind]
            at = int(receipt['virtual_address'], 16)
            assert pe.rva_offset(at - pe.image_base) == int(receipt['file_offset'], 16)
            payload = raw(at, receipt['byte_count'])
            assert hashlib.sha256(payload).hexdigest() == receipt['sha256']
        native_labels = json.loads(payload)
        labels = json.loads((ROOT / row['source_path']).read_text())
        assert row['values'] == {key: native_labels[key] for key in localization['keys']}
        assert all(key in notice for key in localization['keys'])
        assert all(labels[key] == value for key, value in row['values'].items())
        assert all(labels.get(key) == native_labels[key] for key in dependent_keys)
        for tier in range(6):
            value = native_labels[f'rarity.{tier}']
            assert labels.get(value, value) == native_labels.get(value, value)

    admissions = []
    for changed, mode, connection, synchronized in itertools.product(
            [0, 1], [0, 1, 2, 3], [0, 1, 2, 3, 0xffffffff], [0, 1, 2, 255]):
        native.reset('changed-clear-notice', [(0x145b2e8e3, 0x145b2e90e)],
                     {0x145b2e90e, 0x145b2f1e0})
        u.reg_write(r.UC_X86_REG_RSI, native.app)
        u.reg_write(r.UC_X86_REG_RAX, changed)
        native.put(native.app + 0x10, '<I', mode)
        native.put(native.app + 0xd48, '<I', connection)
        native.put(native.app + 0x10c5, '<B', synchronized)
        admitted = native.run(0x145b2e8e3) == 0x145b2e90e
        assert admitted == bool(changed and (mode != 2 or connection <= 1 and synchronized))
        admissions.append(dict(changed=changed, mode=mode, connection=connection,
                               synchronized=synchronized, admitted=admitted))

    start_ranks = []
    for requested, ceiling, host in itertools.product(range(256), range(6), [False, True]):
        start, end = (0x145b2598a, 0x145b2599e) if host else (0x145b23258, 0x145b23266)
        native.reset('admitted-run-rank', [(start, end)], {end})
        if host:
            u.reg_write(r.UC_X86_REG_RSI, native.app)
            native.put(native.app + 0x13e0, '<I', requested)
            u.reg_write(r.UC_X86_REG_RAX, ceiling)
        else:
            u.reg_write(r.UC_X86_REG_RDI, ceiling)
            u.reg_write(r.UC_X86_REG_R14, requested)
        native.run(start)
        admitted = native.get(native.bp + 0x3010, '<B')[0] if host else u.reg_read(r.UC_X86_REG_RDI)
        assert admitted == min(requested, ceiling)
        if host:
            assert native.get(native.app + 0x13e0, '<I')[0] == requested
        start_ranks.append(dict(requested=requested, ceiling=ceiling, host=host, admitted=admitted))
    testers = []
    for guid, requested in itertools.product([0, 1, 0xfffffe, 0xffffff, 0xffffffffffffffff], range(256)):
        native.reset('transient-tester-rank', [(0x145b231ce, 0x145b23219)],
                     {0x145b23219, 0x145b23281})
        u.reg_write(r.UC_X86_REG_R15, guid)
        u.reg_write(r.UC_X86_REG_RDI, requested)
        stopped = native.run(0x145b231ce)
        tester = guid == 0xffffff
        assert (stopped == 0x145b23281) == tester
        admitted = u.reg_read(r.UC_X86_REG_RDI)
        assert admitted == (0 if tester else requested)
        testers.append(dict(guid=guid, requested=requested, tester=tester, rank_before_ceiling=admitted))

    # Admission belongs to coordinated #219/#238 source in the shared checkout;
    # this checkout owns the notice/persistence hunks below. A clone uses itself.
    owning_source = common.shared_root() / 'crates/azeroth-survivors-re/src'
    enter = compact((owning_source / 'gameplay/mod.rs').read_text().split('fn enter(', 1)[1].split('let rules =', 1)[0])
    assert 'menu.selected_roster_guid()==Some(crate::startup::TESTER_GUID){0}else{' in enter
    assert 'pick.heroic_rank.min(menu.backend_save.max_heroic_rank(pick.hero.class,zone_key))' in enter
    assert 'pick.heroic_rank=' not in enter
    host_source = compact((owning_source / 'gameplay/coop.rs').read_text())
    host_raw_pick = 'pick.heroic_rank.min(menu.backend_save.max_heroic_rank(pick.hero.class,zone.key))' in host_source or (
        'letselected=pick.heroic_rank;' in host_source and
        'letrank=selected.min(menu.backend_save.max_heroic_rank(pick.hero.class,zone.key));' in host_source)
    host_source_status = 'pass' if host_raw_pick else 'pending #238: host metadata must use retained Pick, not effective run rank'
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    cfg = proof['construction_to_host_metadata_cfg']
    procedure = int(cfg['procedure'], 16)
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw(procedure, 0x145b263d0 - procedure), procedure))
    lookup = {item.address: item for item in instructions}
    start, end = int(cfg['path_start'], 16), int(cfg['path_end'], 16)
    queue, previous = deque([start]), {start: None}
    while queue:
        address = queue.popleft()
        if address == end:
            break
        item = lookup[address]
        if item.mnemonic in ['ret', 'ud2', 'int3']:
            continue
        edges = []
        if item.mnemonic.startswith('j'):
            if item.op_str.startswith('0x'):
                edges.append(int(item.op_str, 16))
            if item.mnemonic != 'jmp':
                edges.append(address + item.size)
        else:
            edges.append(address + item.size)
        for target_address in edges:
            if target_address in lookup and target_address not in previous:
                previous[target_address] = address
                queue.append(target_address)
    assert end in previous
    cfg_path, address = [], end
    while address is not None:
        cfg_path.append(address)
        address = previous[address]
    cfg_path.reverse()
    assert len(cfg_path) == cfg['path_instruction_count']
    assert hashlib.sha256(','.join(hex(address) for address in cfg_path).encode()).hexdigest() == cfg['path_addresses_sha256']
    assert all(int(row['at'], 16) in lookup for row in cfg['dataflow'])

    ceilings = []
    for zone, rank, maximum, layout, normal in itertools.product(
            range(12), range(1, 6), range(6), range(4), [False, True]):
        native.reset('post-clear-account-ceiling', [(0x145b2ec6f, 0x145b2edbd)],
                     {0x145b2edbd, 0x145b2eefd})
        u.reg_write(r.UC_X86_REG_RSI, native.app)
        native.put(native.bp + 0x2b0, '<Q', zone)
        native.put(native.bp + 0x2a8, '<B', rank)
        pairs = [(1, (zone + 1) % 12)] + ([(2, zone)] if normal else [])
        normal_at, heroic_at = native.mem + 0x6000, native.mem + 0x8000
        native.put(native.app + 0x11f0, '<QQ', normal_at, len(pairs))
        for index, pair in enumerate(pairs):
            native.put(normal_at + index * 16, '<2Q', *pair)
        other = ((zone + 1) % 12, 1, 5)
        match = (zone, 2, maximum)
        rows = [match] if layout == 0 else [other, match] if layout == 1 else \
            [match, other, (zone, 3, 1), other, match] if layout == 2 else \
            [other, match, other, (zone, 3, 1), other, match]
        if maximum == 0:
            rows = [row for row in rows if row[0] != zone]
        native.put(native.app + 0x12e0, '<QQ', heroic_at, len(rows))
        for index, (key, class_id, cleared) in enumerate(rows):
            native.put(heroic_at + index * 16, '<QBB6x', key, class_id, cleared)
        appended = native.run(0x145b2ec6f) == 0x145b2edbd
        opened = u.reg_read(r.UC_X86_REG_R12) & 255
        expected = 0 if not normal else min(maximum + 1, 5)
        assert opened == expected and appended == (expected > rank), (zone, rank, maximum, layout, normal, opened)
        ceilings.append(dict(zone=zone, cleared=rank, saved_max=maximum, layout=layout,
                             normal_clear=normal, open=opened, append=appended))

    # Both current frontend dispatch stages inspect type. Heroic matches none;
    # the explicit post-chat JSON has no custom banner or notification consumer.
    frontend = []
    for key in ['heroic', 'roster', 'picked', 'paused', 'resume', 'banner', 'defeat', 'logout', 'unused']:
        for first in [True, False]:
            start = 0x14006369d if first else 0x1400639ac
            ranges = [(0x14006369d, 0x1400636cc), (0x1400637f0, 0x140063823)] if first else \
                     [(0x1400639ac, 0x1400639db), (0x140063af7, 0x140063bb3)]
            stops = {0x140063980, 0x140063858} if first else \
                    {0x140063f43, 0x14006427c, 0x1400642e5, 0x140064307,
                     0x1400643f0, 0x140063df8, 0x140063bb3, 0x1400646e0}
            native.reset('frontend-type', ranges, stops)
            pointer = native.mem + 0x5000
            native.put(native.app, '<B', 3)
            native.put(native.app + 0x10, '<QQ', pointer, len(key))
            u.mem_write(pointer, key.encode())
            u.reg_write(r.UC_X86_REG_RAX, native.app)
            pc = native.run(start)
            ignored = pc == (0x140063980 if first else 0x1400646e0)
            if key in ['heroic', 'unused']:
                assert ignored
            frontend.append(dict(type=key, first=first, stop=hex(pc), ignored=ignored))

    save = compact(source('save/heroic.rs'))
    assert 'letrank=rank.min(self.max_heroic_rank(class,zone_key));' in save
    assert '.then(||(rank,self.heroic_zone_max(zone_key)))' in save
    transaction = save[save.index('fnrecord_run_victory_notice('):]
    assert transaction.index('self.record_beaten_zone(class,zone_key)?;') < transaction.index('letrank=rank.min(')
    assert 'ifopen>rank' in compact(notice)
    adapter = compact(source('gameplay/mod.rs'))
    assert 'record_run_victory_notice(result.class,result.zone_key,game.heroic_rank(),' in adapter
    guest = compact(source('gameplay/guest_settlement.rs'))
    assert 'Ok(Some((rank,open)))ifself.notice_ready=>' in guest
    assert 'notice_ready:game.guest_notice_ready()' in guest and 'notice_ready:false' in guest
    assert guest.index('record_run_victory_notice(') < guest.index('grant_run_feats(')
    coop = compact(source('gameplay/coop.rs'))
    assert '.with_notice_ready(self.sync_sent)' in coop
    assert 'game.set_guest_notice_ready(state.sync_sent&&local.active)' in coop
    events = compact(source('gameplay/client/events.rs'))
    assert events.count('heroic_progress::message(') == 2
    assert 'chat_type:0x0a,language:0,sender_guid:0,target_guid:0,sender_name:None,channel:None,text,chat_tag:0' in events
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = common.shared_root() / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    files = ['gameplay/heroic_progress.rs', 'save/heroic.rs', 'gameplay/mod.rs',
             'gameplay/guest_settlement.rs', 'gameplay/coop.rs', 'gameplay/mechanics.rs',
             'gameplay/mechanics/coop.rs', 'gameplay/client/events.rs']
    for path in files:
        parsed = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'],
                                input=source(path), text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (path, parsed.stderr)
    digest = lambda rows: hashlib.sha256(json.dumps(rows, sort_keys=True, separators=(',', ':')).encode()).hexdigest()
    result = dict(target=proof['target'], source_zone_bindings=12, source_class_bindings=11,
                  source_rarity_bindings=6, query_subjects=len(proof['queries']),
                  source_notice_locale_values=len(localization['keys']) * len(localization['locales']),
                  source_existing_locale_dependencies=len(dependent_keys) * len(localization['locales']),
                  notice_admission_cases=len(admissions), ceiling_cases=len(ceilings),
                  start_rank_cases=len(start_ranks), tester_start_cases=len(testers),
                  admitted_rank_source='shared owning checkout: common constructor Tester/ceiling guards pass',
                  host_metadata_source=host_source_status, construction_to_host_metadata_cfg_instructions=len(cfg_path),
                  frontend_cases=len(frontend), native_instruction_steps=native.instructions,
                  rust_syntax_parses=len(files), source_connections='pass', target_executed=False,
                  admission_vectors_sha256=digest(admissions), ceiling_vectors_sha256=digest(ceilings),
                  start_rank_vectors_sha256=digest(start_ranks), tester_start_vectors_sha256=digest(testers),
                  admissions=[row for row in admissions if row['mode'] == 2
                              and row['connection'] in [1, 2] and row['synchronized'] in [0, 1]],
                  ceilings=[row for row in ceilings if row['zone'] == 0 and row['layout'] == 2
                            and row['normal_clear']], frontend=frontend)
    output = directory / 'static-check.json'
    if args.write:
        output.write_text(json.dumps(result, indent=2) + '\n')
    else:
        assert json.loads(output.read_text()) == result
    print(json.dumps({key: value for key, value in result.items() if key not in ['admissions', 'ceilings', 'frontend']}, indent=2))


if __name__ == '__main__':
    main()

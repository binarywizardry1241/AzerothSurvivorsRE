#!/usr/bin/env python3
"""Verify bounded guest addon projection; no compilation or target execution."""
import hashlib
import json
import re

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def main():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('coop_feed_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    directory = ROOT / 'docs/analysis/evidence/0.115.0/coop-game-party'
    manifest = json.loads((directory / 'manifest.json').read_text())
    assert manifest['target']['sha256'] == SHA
    roles = {'hud-json', 'hud-meter-json', 'party-meter', 'meter-format', 'revive-format'}
    checked = set()
    for row in manifest['functions']:
        if row['role'] not in roles:
            continue
        start, size = int(row['start'], 16), row['byte_count']
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert hashlib.sha256(data[offset:offset + size]).hexdigest() == row['sha256']
        checked.add(row['role'])
    assert checked == roles
    for name in ('hud-json.asm', 'hud-meter-json.asm', 'meter-format.c', 'revive-format.c'):
        assert hashlib.sha256((directory / name).read_bytes()).hexdigest() == manifest['extracts'][name]
    api = (ROOT / 'docs/analysis/evidence/0.115.0/embedded-api.lua').read_text()
    for prefix, columns in {
        'AZSSPELLS': ['key', 'spell', 'rank', 'cd', 'cdmax'],
        'AZSBUFFS': ['spell', 'left'],
        'AZSMETER': ['name', 'dmg', 'dps', 'share', 'proc'],
        'AZSPARTY': ['name', 'class', 'dmg', 'dps', 'share', 'top', 'topdps'],
    }.items():
        row = re.search(r'arg1 == "' + prefix + r'".*?AZS_List\(arg2, \{(.*?)\}', api, re.S)
        assert row and re.findall(r'"([^"]+)"', row[1]) == columns, prefix
    base = ROOT / 'crates/azeroth-survivors-re/src/gameplay'
    feed = (base / 'client/coop_feed.rs').read_text()
    body = feed.split('#[cfg(test)]', 1)[0]
    for token in ('addon_scalars::snapshot', 'game.replica_phase().is_none()', '.replica_hud()',
                  'state.addon.due(session.identity, input.ui_time)', 'meter_totals', 'meter_payload',
                  'changed_from(snapshot, game.player_guid)', 'talent_view::publication',
                  'value.is_finite()', 'row["cdMax"]', 'hud["revive"]', 'hud["rescue"]'):
        assert token in body, token
    # These collections require data that is not present in State15/HudJson10.
    for forbidden in ('AZSTIMERS', 'AZSDEBUFFS', 'AZSPETS', 'AZSTAKEN', 'AZSCHESTS', 'AZSLAIRS'):
        assert f'AddonMessage::new("{forbidden}"' not in body, forbidden
    publisher = (base / 'client/addon_feed.rs').read_text()
    assert 'sender_guid: player_guid' in publisher and 'Some(message.packet_from(player_guid))' in publisher
    bridge = (base / 'client.rs').read_text()
    assert 'mod coop_feed;' in bridge and 'coop_feed::publish(' in bridge
    assert feed.count('#[test]') >= 2
    assert 'fn admitted_guest_identity_is_preserved_without_changing_cache_keys()' in publisher
    print(f'PASS: {len(checked)} native HUD/party/revive ranges, four canonical extracts, '
          'four current API list schemas, guest hook and bounded projection guards; '
          'three regressions authored, unrun; no compilation or runtime/parity claim')


if __name__ == '__main__':
    main()

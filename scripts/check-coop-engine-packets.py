#!/usr/bin/env python3
"""Static AS event-feed/encoder boundary check; does not compile or execute Rust."""
import json
import re

from coverage_common import ROOT, latest_target

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def main():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    evidence = json.loads((ROOT / 'docs/analysis/evidence/coop-replication/manifest.json').read_text())
    assert evidence['target']['sha256'] == SHA
    source_root = ROOT / 'crates/azeroth-survivors-re/src'
    encoder = (source_root / 'coop/engine_packets.rs').read_text()
    implementation = encoder.split('#[cfg(test)]', 1)[0]
    supported = set(re.findall(r'SessionEvent::([A-Za-z0-9_]+)', implementation))
    files = [source_root / 'gameplay/client.rs', source_root / 'gameplay/coop.rs', source_root / 'gameplay/coop_commands.rs',
             source_root / 'gameplay/coop_publish.rs',
             *sorted((source_root / 'gameplay/client').glob('*.rs'))]
    emitted = set()
    for path in files:
        source = path.read_text().split('#[cfg(test)]', 1)[0]
        emitted.update(re.findall(r'SessionEvent::([A-Za-z0-9_]+)', source))
    # Disconnected is the local transport-loss notification, not a server packet.
    local_only = {'Disconnected'}
    assert not emitted - supported - local_only, f'Unencoded actual AS event variants: {sorted(emitted - supported - local_only)}'
    # These additional results are generated through the ordinary decoder, or form
    # the initial world/action metadata API, rather than direct enum constructors.
    required = {'SpellBook', 'ActionButtons', 'SpellLearned', 'SpellRemoved',
                'SpellSuperceded', 'AuraDuration', 'CastResult', 'ItemTemplate', 'InventoryFailure',
                'CreatureName', 'GameObjectInfo', 'GameObjectUnknown', 'GossipPoi'}
    assert required <= supported
    for anchor in ('pub fn encode(', 'op::SMSG_INITIAL_SPELLS', 'op::SMSG_ACTION_BUTTONS',
                   'op::SMSG_ITEM_QUERY_SINGLE_RESPONSE', 'op::SMSG_INVENTORY_CHANGE_FAILURE',
                   'op::SMSG_GOSSIP_POI', 'IncompleteAmmo', 'button.action > 0x00ff_ffff',
                   'slots = [0u32; 120]', 'u16::try_from(*id)', 'u64v(&mut b, *id)',
                   'miss.info == 11', 'if let Some(arg) = arg',
                   'spells.get_mut(usize::from(spell.index))', 'use_spell != v.use_spell',
                   '(-1024..=1023).contains(&x)', '(-512..=511).contains(&z)',
                   'return Ok(None)', '_ => return Err(EncodeError::Unsupported)'):
        assert anchor in implementation, anchor
    assert implementation.count('return Err(EncodeError::IncompleteAmmo)') == 2
    assert 'ammo_display_id.ok_or' not in implementation
    for parser in ('action_bar.rs', 'spellbook.rs', 'items.rs', 'gameobject.rs', 'spells.rs',
                   'monster_move.rs', 'combat_log.rs', 'gossip.rs'):
        assert (ROOT / 'crates/benilla-protocol/src/messages' / parser).is_file()
    tests = encoder.count('#[test]')
    assert tests >= 9
    assert 'parse_server_with_tail(packet.opcode, &packet.payload)' in encoder
    assert 'assert_eq!(tail, 0' in encoder
    print(f'PASS:{len(emitted)} current direct AS SessionEvent variants covered;'
          f'{len(supported)} encoder forms including explicit marker no-ops;'
          f'{tests} decoder roundtrip/refusal regressions authored,unrun;'
          'no compilation,Rust execution,live networking or parity claim')


if __name__ == '__main__':
    main()

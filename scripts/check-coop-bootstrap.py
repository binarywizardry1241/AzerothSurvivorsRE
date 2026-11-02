#!/usr/bin/env python3
"""Read-only byte/table/source checks; does not execute native or rebuilt code."""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import importlib.util
import itertools
import json
import re
import struct
from pathlib import Path

from coverage_common import latest_target, project_path, target_bytes

ROOT = Path(__file__).resolve().parents[1]
PROOF = ROOT / 'docs/analysis/evidence/0.115.0/coop-bootstrap/manifest.json'


def check(path=PROOF, stage=False):
    proof = json.loads(path.read_text())
    if proof.get('scope_id') == 'current-player-login-sync':
        return check_current(path, proof, stage)
    target = latest_target(verify=True)
    assert target['sha256'] == proof['target']['sha256']
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('coop_bootstrap_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(image)
    count = 0

    def raw(address, size):
        start = pe.rva_offset(address - pe.image_base)
        return image[start:start + size]

    for row in proof['functions']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        assert pe.rva_offset(start - pe.image_base) == int(row['file_offset'], 16)
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == row['sha256'], row['start']
        count += 1
        if 'extract' in row:
            entry = row['extract']
            data = (ROOT / entry['path']).read_bytes()
            assert hashlib.sha256(data).hexdigest() == entry['sha256']
            assert all(line == line.rstrip() for line in data.splitlines())
            count += 1
    for path in proof['canonical_references']:
        assert json.loads((ROOT / path).read_text())['target']['sha256'] == target['sha256']
        count += 1
    assert struct.unpack('<f', raw(0x145ef0570, 4))[0] == struct.unpack('<f', struct.pack('<f', 0.05))[0]
    assert struct.unpack('<f', raw(0x145ee05c0, 4))[0] == struct.unpack('<f', struct.pack('<f', 0.1))[0]
    assert list(struct.unpack('<4I', raw(0x146ccc670, 16))) == [0x80000002, 0x80000002, 0, 0]
    count += 3

    contract = proof['contracts']
    table = int(contract['private_opcode_table'], 16)
    private = {0xe2 + index for index in range(0x9f)
               if table + struct.unpack('<i', raw(table + index * 4, 4))[0] == 0x14584a718}
    private |= {0x1cb + index for index in range(20) if (0x80021 >> index) & 1}
    private |= {0x24e + index for index in range(42) if (0x20000000005 >> index) & 1}
    private |= {0x224, 0xc7}
    assert sorted(private) == contract['private_opcodes']
    table = int(contract['control_table'], 16)
    assert [hex(table + struct.unpack('<i', raw(table + index * 4, 4))[0])
            for index in range(10)] == contract['control_targets']
    count += 2

    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/server_party.rs').read_text()
    classifier = source[source.index('pub fn owner_only_engine_packet'):source.index('/// Local connection handle')]
    fixed = classifier[classifier.index('match opcode {'):classifier.index('=> true')]
    assert {int(value, 16) for value in re.findall(r'0x[0-9a-f]+', fixed)} == private
    for token in ['payload.get(6..8)', 'payload.get(5)', 'payload.get(6)',
                  'high == 0x4000', 'update == 3', 'payload.get(cursor + 1)',
                  'kind.wrapping_sub(6) & 0xfb == 0']:
        assert token in classifier, token
        count += 1
    for token in ['pub fn native_world_identity(seed: u64)', 'seed >> 46', 'seed >> 23',
                  'seed.wrapping_mul(0x1e3779b97f4a7c15) >> 40', 'mixed & 0x7fffff',
                  'candidate < 0xffff00', 'value + 0x7fff00']:
        assert token in source, token
        count += 1

    profile = (ROOT / 'crates/azeroth-survivors-re/src/coop_profile.rs').read_text()
    for name in ['build', 'sanitize', 'configure', 'outfit']:
        assert 'pub(crate) fn ' + name + '(' in profile
        count += 1
    for token in ['armory::coop_loadout', 'progression::account_loot_companions',
                  'progression::RewardPlan::read', 'progression::earned_points',
                  'save.talent_allocation', 'save.unlock_value', 'validate_hero_identity',
                  'armory::sanitize_coop_loadout', 'save::talents::normalize',
                  '.normalized()', 'hero.words_170.map(|value| value.min(3))',
                  'hero.bytes_17c.map(|value| value.min(3))', 'keen.min(0.1)',
                  'progression::maximum_achievement_points()',
                  'hero.byte_1e3.clamp(1, 12)', 'game.configure_effects',
                  'game.set_account_grants', 'game.set_loot_companions',
                  'game.set_cache_on_click', 'game.set_store_levels',
                  '.outfit(catalog, hero.class, hero.race)']:
        assert token in profile, token
        count += 1
    assert all(('b"' + code + '"') in profile for code in contract['locale_codes'])
    assert re.search(r'&raw,\s*51', profile)
    count += 2
    bootstrap = (ROOT / 'crates/azeroth-survivors-re/src/coop/bootstrap.rs').read_text()
    assert all(('pub fn ' + name + '(') in bootstrap for name in
               ['zone_environment', 'living_speeds', 'action_buttons', 'class_spellbook', 'name_response'])
    assert 'pub fn packets(self)' in bootstrap
    for opcode in contract['initial_opcodes']:
        if opcode == 0xa9:  # actual self object is supplied by the existing engine owner
            continue
        assert re.search(r'packet\(\s*0x' + f'{opcode:x}' + ',', bootstrap), hex(opcode)
        count += 1
    assert 'buttons[11] = slot11_spell' in bootstrap
    assert '[0u32; 120]' in bootstrap
    assert '[0; 64 * 5]' in bootstrap
    assert '0x06539800' in bootstrap and '0x3c888889' in bootstrap
    count += 4
    for zone in contract['zones']:
        match = re.search(r'"' + zone['key'] + r'"\s*=>\s*\((.*?)\),', bootstrap, re.S)
        assert match, zone['key']
        actual = [int(value.replace('_', ''), 0) for value in
                  re.findall(r'0x[0-9a-f_]+|\b\d[\d_]*\b', match[1])]
        expected = [zone['map_id'], zone['zone_id'], zone['hour'], zone['weather_kind'],
                    int(zone['weather_bits'], 16), *[int(v, 16) for v in zone['position_bits']],
                    int(zone['facing_bits'], 16)]
        assert actual == expected, zone['key']
        count += len(actual)
    catalog = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    spell_ids = {key: int(value) for key, value in
                 re.findall(r'key: "([^"\n]+)".*?spell_id: (\d+)', catalog, re.S)}
    pools = {int(class_id): re.findall(r'"([^"]+)"', values)
             for class_id, values in re.findall(
                 r'ClassAbilities\s*\{\s*class_id:\s*(\d+).*?pool:\s*&\[(.*?)\]', catalog, re.S)}
    for entry in contract['class_spellbooks']:
        assert pools[entry['class']] == entry['keys']
        assert [spell_ids[key] for key in entry['keys']] == entry['spells']
        count += 1 + len(entry['keys'])
    mechanics = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text()
    for entry in contract['race_racials']:
        assert f'{entry["race"]} => "{entry["key"]}"' in mechanics
        assert spell_ids[entry['key']] == entry['spell']
        count += 2
    print(f'PASS: {count} current-target byte/extract/table/source guards; '
          'no compilation, native instruction execution, networking, game or parity validation')


def check_current(path, proof, stage=False):
    """Current AS handshake gates/queue ordering; no application is launched."""
    import sys
    sys.path[:0] = [str(ROOT / 'runtime/armory-recovery/python-libs'),
                   str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs')]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    from discovery_native_subject import verify_native_query_subject
    from script_sources import load_script
    selected = latest_target(verify=True)
    assert all(proof['target'][key] == selected[key] for key in ['version', 'sha256', 'size_bytes'])
    image = target_bytes(selected)
    pe = load_script('current_bootstrap_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    def sha(raw): return hashlib.sha256(raw).hexdigest()
    def verified(receipt):
        value = project_path(receipt['path']).read_bytes()
        assert sha(value) == receipt['sha256'], receipt['path']
        return value
    def raw(start, count):
        off = pe.rva_offset(start - pe.image_base)
        return image[off:off + count]
    assembly = []
    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        data = raw(start, end - start)
        assert sha(data) == row['sha256']
        instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(data, start))
        assert sum(i.size for i in instructions) == len(data)
        assembly.append('// ' + row['role'] + '\n')
        assembly.extend(f'{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}'.rstrip() + '\n' for i in instructions)
    assert verified(proof['assembly']).decode() == ''.join(assembly)
    selected_ranges = proof['dispatch_ranges']
    assert [row['role'] for row in selected_ranges] == ['decoded-enum-prefix', 'decoded-enum-arms']
    assert json.loads(verified(proof['relay_manifest']))['target'] == proof['target']
    for row in selected_ranges:
        assert sha(raw(int(row['start'], 16), row['byte_count'])) == row['sha256']
        verified(row['assembly'])
    for query in proof['queries']:
        saved = json.loads(verified(query['result']))
        native = saved.get('structuredContent') or json.loads(saved['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
    assert struct.unpack('<q', raw(0x1470835a0, 8))[0] == -(1 << 63) + 5
    assert 0x147085c1c + struct.unpack('<i', raw(0x147085c1c + 7 * 4, 4))[0] == 0x145bc298e
    assert 0x14771f0c4 + struct.unpack('<i', raw(0x14771f0c4 + 5 * 4, 4))[0] == 0x145d15b7d
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'], image[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    memory, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(memory, 0x20000); machine.mem_map(stack, 0x10000); machine.mem_map(stop, 4096)
    def put(a, fmt, *values): machine.mem_write(a, struct.pack('<' + fmt, *values))
    def get(a, fmt='Q'): return struct.unpack('<' + fmt, machine.mem_read(a, struct.calcsize('<' + fmt)))[0]
    def reg(name, value): machine.reg_write(getattr(r, 'UC_X86_REG_' + name), value)
    def rr(name): return machine.reg_read(getattr(r, 'UC_X86_REG_' + name))
    def ret():
        sp = rr('RSP'); reg('RIP', get(sp)); reg('RSP', sp + 8)
    active, stops, mode, trace = [], set(), '', []
    snapshot_count, actor_count, assigned_actor = 0, 0, 0
    app, clients, packets, queue, vtable, encoded = [memory + offset for offset in [0, 0x5000, 0x8000, 0xa000, 0xc000, 0xd000]]
    def packet(out, opcode): put(out, 'QQQH', 0, 1, 0, opcode)
    def hook(_, address, size, user):
        if address in stops: machine.emu_stop(); return
        if any(a <= address < b for a, b in active): return
        if mode == 'producer':
            assert get(app + 0x11bd, 'B') == 1
            if address == 0x145b91c30: trace.append('flush-engine'); ret(); return
            if address == 0x145d14a90:
                assert rr('RDX') == 0x1470835a0
                put(rr('RCX'), '3Q', 0, encoded, 1); put(encoded, 'B', 6)
                trace.append('encode-sync6'); ret(); return
            if address == stop + 0x100:
                assert rr('RCX') == memory + 0xe000 and get(rr('RDX'), 'B') == 6 and rr('R8') == 1
                trace.append('send-sync6'); ret(); return
            if address == 0x1400021d0: ret(); return
        if mode == 'callback':
            if address == 0x145bed740:
                trace.append('self-snapshot'); put(rr('RCX'), '3Q', 64, packets, snapshot_count)
                for index in range(snapshot_count): packet(packets + index * 32, 0x200 + index)
                ret(); return
            if address == 0x145bec840:
                trace.append('other-hero'); packet(rr('RCX'), 0xa9); packet(rr('RCX') + 32, 0x51)
                ret(); return
            if address == 0x145bf2990: trace.append('hero-context'); ret(); return
            if address == 0x145af7410: trace.append('raid-targets'); packet(rr('RCX'), 0x1ff); ret(); return
            if address == 0x145d14a90:
                assert get(rr('RDX')) == (1 << 63) + 6
                assert get(clients + 0x4e5, 'B') == 0
                trace.append('queue-engine7'); put(rr('RCX'), '3Q', 0, encoded, 1); put(encoded, 'B', 7)
                ret(); return
            if address == 0x145bd3b10:
                assert get(clients + 0x4e5, 'B') == 1
                assert get(clients + 0x288) == snapshot_count + actor_count * 2 + 1
                trace.append('party-metadata'); ret(); return
            if address in [0x145baa5d0, 0x1400021d0]: ret(); return
            if address == 0x14606171b:
                machine.mem_write(rr('RCX'), bytes(machine.mem_read(rr('RDX'), rr('R8')))); ret(); return
        if mode == 'handler' and address == 0x145bd31f0:
            trace.append('callback'); ret(); return
        if mode == 'serializer' and address == 0x145ec0be0:
            assert rr('RDX') & 0xff == 6; trace.append('wire6'); ret(); return
        raise AssertionError((mode, 'unexpected native instruction', hex(address)))
    machine.hook_add(UC_HOOK_CODE, hook)
    def reset():
        machine.mem_write(memory, bytes(0x20000)); machine.mem_write(stack, bytes(0x10000))
        for name in ['RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15']: reg(name, 0)
        reg('RSP', stack + 0xf008); put(stack + 0xf008, 'Q', stop); reg('RBP', stack + 0x8000)
        reg('EFLAGS', 2); reg('MXCSR', 0x1f80); trace.clear()
    def execute(start, end, endpoints):
        nonlocal active, stops
        active, stops = [(start, end)], set(endpoints)
        machine.emu_start(start, 0, count=50000)
        result = rr('RIP'); assert result in stops
        return result
    cases = []
    for app_mode, port, already in itertools.product([0,1,2,3,0xffffffff], [0,1], [0,1]):
        reset(); mode = 'producer'; reg('RAX', app_mode); reg('RSI', app)
        put(app + 0x1190, 'Q', port); put(app + 0x1180, 'QQ', memory + 0xe000, vtable)
        put(vtable + 0x18, 'Q', stop + 0x100); put(app + 0x11bd, 'B', already)
        result = execute(0x145bc298e, 0x145bc2a42, [0x145bc2aaa, 0x145bc2a42])
        admitted = app_mode <= 1 and port != 0
        assert (result == 0x145bc2a42) == admitted
        assert trace == (['flush-engine','encode-sync6','send-sync6'] if admitted else [])
        cases.append(['producer',app_mode,port,already,admitted])
    for hosting, count, client, assigned, game in itertools.product([0,3,4], [0,1,2], [0,1,2,(1<<64)-1], [0,1,2], [0,1,2,3]):
        reset(); mode = ''; reg('RCX', app); reg('RDX', client)
        put(app + 0xd98, 'I', hosting); put(app + 0xdd0, 'QQ', clients, count); put(app + 0x10, 'I', game)
        if client < 3: put(clients + client * 0x4e8, 'I', assigned)
        result = execute(0x145bd31f0, 0x145bd3690, [0x145bed740,stop])
        admitted = hosting == 3 and client < count and assigned == 1 and game != 2
        assert (result == 0x145bed740) == admitted
        cases.append(['callback-gate',hosting,count,client,assigned,game,admitted])
    for actor_count in [0,1,2]:
        for assigned_actor in range(actor_count + 1):
            for snapshot_count in [0,1,3]:
                reset(); mode = 'callback'; reg('RCX',app); reg('RDX',0)
                put(app + 0xd98,'I',3);put(app + 0xdd0,'QQ',clients,1);put(app + 0xa68,'Q',actor_count)
                put(clients,'QQ',1,assigned_actor);put(clients + 0x278,'QQQ',64,queue,0)
                execute(0x145bd31f0,0x145bd3690,[stop])
                expected = snapshot_count + actor_count * 2 + 1
                assert trace.count('queue-engine7') == expected and trace[-1] == 'party-metadata'
                assert trace.count('other-hero') == actor_count
                cases.append(['callback-order',actor_count,assigned_actor,snapshot_count,list(trace)])
    for joined in [0,1]:
        reset();mode='';reg('RBX',clients);put(clients+0x4e4,'B',joined)
        assert (execute(0x145bd6326,0x145bd6334,[0x145bd6334,0x145bd6fd3])==0x145bd6334)==bool(joined)
        cases.append(['joined',joined])
    for assigned,synchronized in itertools.product([0,1,2],[0,1,2]):
        reset();mode='handler';reg('RBX',clients);reg('RSI',app);put(clients,'Q',assigned);put(clients+0x4e5,'B',synchronized)
        execute(0x145bd6904,0x145bd6947,[0x145bd6947,0x145bd6fd3])
        assert bool(trace)==(assigned!=0 and synchronized==0)
        cases.append(['handler',assigned,synchronized,bool(trace)])
    reset();mode='serializer';execute(0x145d15b7d,0x145d15b8e,[0x145d15f90]);assert trace==['wire6'];cases.append(['serializer',6])
    source_guards(proof)
    result = dict(target_sha256=selected['sha256'],native_cases=len(cases),
        case_sha256=sha(json.dumps(cases,sort_keys=True,separators=(',',':')).encode()),
        domains=dict(producer_modes=[0,1,2,3,0xffffffff],upstream_port=[0,1],prior_ready=[0,1],
            host_modes=[0,3,4],client_counts=[0,1,2],client_indices=[0,1,2,(1<<64)-1],assigned_variants=[0,1,2],game_variants=[0,1,2,3],
            other_hero_counts=[0,1,2],snapshot_packets=[0,1,3],synchronized_bytes=[0,1,2]),
        limits=['Original bounded instructions with declared snapshot/serializer/queue/interface seams; reconstructed Rust is not executed.',
            'App+10 variant2 retains its raw discriminant; no speculative typed meaning or application ACK/retry timer is added.',
            'Reliable retry/loss buffering is separately proved by relay-load-0.127.0; compilation, game/server/network execution and parity remain unverified.'])
    if stage:
        out=ROOT/'runtime/analysis/tasks/fixgap-198-203-0.127.0/bootstrap/static-check.json'
        out.write_text(portable_json(result,indent=2)+'\n')
        print(out.relative_to(ROOT))
    else: assert portable_record(json.loads((path.parent/'static-check.json').read_text())) == portable_record(result)
    print(f'PASS: {len(cases)} current bootstrap producer/handler/callback native cases and connected source guards; no compilation/game/network')


def source_guards(proof):
    source = (ROOT/'crates/azeroth-survivors-re/src/gameplay/coop.rs').read_text()
    bootstrap = source[source.index('fn bootstrap('):source.index('fn synchronize(')]
    assert bootstrap.index('local.begin(player)') < bootstrap.index('if !state.sync_sent && local.active')
    send = bootstrap[bootstrap.index('if !state.sync_sent && local.active'):bootstrap.index('loading.set_ready(world.ready)')]
    assert 'LifecyclePacket::Synchronize' in send and 'world.ready' not in send
    local = (ROOT/'crates/benilla-app/src/local_client.rs').read_text()
    begin = local[local.index('pub fn begin('):local.index('pub fn end(')]
    assert 'active: true' in begin and 'player: Some(player)' in begin
    session = (ROOT/'crates/azeroth-survivors-re/src/coop/session.rs').read_text()
    assert 'if joined && assigned && !synchronized' in session
    sync = session[session.index('pub fn synchronize('):session.index('pub fn take_messages(')]
    assert sync.index('for packet in packets') < sync.index('world_synchronization_completed(client)')
    for token in ['row.joined','row.world_hero.is_some()','!row.synchronized','row.closing_since.is_none()',
                  'if !self.send_message(Some(client), packet.into_message())','return false;']:
        assert token in sync
    publish=(ROOT/'crates/azeroth-survivors-re/src/gameplay/coop_publish.rs').read_text()
    assert publish.index('if !synced {') < publish.index('let Some((fields, native, learned, attack, inventory, equipment')
    callback=source[source.index('fn synchronize('):source.index('fn unit_create(')]
    for token in ['.admitted','InitialWorld {','.packets()','units','action_buttons(','driver.synchronize(client, packets)','party_frames::fanout']:
        assert token in callback,token
    assert callback.index('driver.synchronize(client, packets)') < callback.index('party_frames::fanout')
    assert 'pub const MAX_MESSAGES_PER_CLIENT_TICK: usize = 200' in (ROOT/'crates/azeroth-survivors-re/src/coop/server_party.rs').read_text()


if __name__ == '__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof',type=project_path,default=PROOF)
    parser.add_argument('--stage',action='store_true',help='Stage compact current proof output under runtime for review')
    args=parser.parse_args()
    check(args.proof,args.stage)

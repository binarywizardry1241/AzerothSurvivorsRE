#!/usr/bin/env python3
"""Replay current run/party achievement predicates, without compilation or a game.

The selected original predicate instructions run on synthetic run/account/member
memory. Locale selection is a declared seam. Replay stops at the native award
branch, before date acquisition, persistence or notifications.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

PROOF = ROOT / 'docs/analysis/evidence/run-achievements.json'


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def replay(target, image, pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    catalog = load_script('run_achievement_catalog', ROOT/'scripts/check-achievement-catalog.py')
    native = catalog.recover(False, target, image, pe)
    rows = {row['pairs'][8]: bytes.fromhex(row['hex']) for row in native['rows']}
    # Tie normalized source definitions to the actual constructor's variant
    # payloads. The constant zone/tier in variant14 is checked by the complete
    # predicate sweep below, independently of this descriptor projection.
    asset = json.loads((ROOT/'crates/azeroth-survivors-re/assets/run-achievements-0.121.0.json').read_text())
    assert asset['target_sha256'] == target['sha256']
    additions = {row['key']: row for row in asset['achievements']}
    assert len(additions) == 8
    variants = {10:'endless_bosses',11:'run_marks',12:'boss_marks'}
    for key in ('feat:endless3','feat:endless6','feat:marks100','feat:bossmarks50'):
        raw = rows[key]
        assert additions[key]['current_feat'] == dict(type=variants[raw[72]],target=struct.unpack_from('<I',raw,76)[0])
    assert rows['feat:unpolished'][72] == 13
    assert additions['feat:unpolished']['current_feat'] == dict(type='unpolished',rank=rows['feat:unpolished'][73])
    assert rows['feat:humble'][72] == 14
    assert additions['feat:humble']['current_feat'] == dict(type='set_victory',zone=11,tier=0)
    for key,selector,party in [('coop:matching',8,'same_set'),('coop:raidnight',7,'five')]:
        raw = rows[key]
        assert raw[72] == 8 and struct.unpack_from('<Q',raw,96)[0] == selector
        assert additions[key]['cooperative'] == dict(type='victory',zone=None,
            no_deaths=bool(raw[73]),max_modifiers=bool(raw[74]),party=dict(kind=party))
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (size+4095)&~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base+section['rva'], image[section['raw_offset']:section['raw_offset']+section['raw_size']])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x10000)
    machine.mem_map(stack, 0x20000)
    machine.mem_map(stop, 4096)
    def wq(address, value): machine.mem_write(address, struct.pack('<Q', value & 0xffffffffffffffff))
    def q(address): return struct.unpack('<Q', machine.mem_read(address,8))[0]
    state = {'steps': 0}
    def hook(_machine, address, _size, _context):
        if address == 0x145ba71c5:
            state['admitted'] = True
            machine.emu_stop()
            return
        if 0x145ba6470 <= address < 0x145ba7292 or 0x145b90f00 <= address < 0x145b91272:
            state['steps'] += 1
            return
        if address == stop:
            machine.emu_stop()
            return
        if address == 0x145aedf70:
            machine.reg_write(reg.UC_X86_REG_RAX, heap+0x3000)
            sp=machine.reg_read(reg.UC_X86_REG_RSP)
            machine.reg_write(reg.UC_X86_REG_RIP,q(sp))
            machine.reg_write(reg.UC_X86_REG_RSP,sp+8)
            return
        raise AssertionError(f'unreviewed predicate call {address:#x}')
    machine.hook_add(UC_HOOK_CODE,hook)
    machine.mem_write(heap+0x3000,b'\x01')
    wq(heap+0x3008,0)
    wq(0x1485c6780,heap+0x4000)
    wq(0x1485c6788,1)
    machine.mem_write(0x1485c6790,b'\0\0\0\0')
    cases=[]
    def case(key, expected, **values):
        state['admitted']=False
        machine.mem_write(heap+0x1000,bytes(0x1000))
        machine.mem_write(heap+0x2000,bytes(0x100))
        machine.mem_write(heap+0x4000,rows[key])
        wq(heap+0x2048,0 if values.get('members') is not None else -1)
        wq(heap+0x2080,values.get('zone',0))
        for offset,name in [(0x98,'endless_bosses')]:
            machine.mem_write(heap+0x2000+offset,struct.pack('<I',values.get(name,0)))
        for offset,name in [(0x9c,'run_marks'),(0xa0,'max_boss_marks')]:
            machine.mem_write(heap+0x2000+offset,struct.pack('<f',values.get(name,0.)))
        for offset,name in [(0xa4,'won'),(0xa6,'heroic_rank'),(0xa7,'max_equipment_stars'),(0xa8,'active_set'),(0x7c,'heroic_party')]:
            machine.mem_write(heap+0x2000+offset,bytes([int(values.get(name,0))]))
        if values.get('members') is not None:
            members=values['members']
            wq(heap+0x2050,heap+0x5000)
            wq(heap+0x2058,len(members))
            machine.mem_write(heap+0x5000,bytes(8*max(1,len(members))))
            for index,tier in enumerate(members):
                machine.mem_write(heap+0x5000+8*index+6,bytes([tier]))
        if values.get('boss_event') is not None:
            event_members=values['members']
            machine.mem_write(heap+0x6000,bytes(40))
            wq(heap+0x2068,heap+0x6000);wq(heap+0x2070,1)
            wq(heap+0x6008,heap+0x5000);wq(heap+0x6010,len(event_members))
            machine.mem_write(heap+0x6018,struct.pack('<I',values['boss_event']))
        sp=stack+0x1f008
        wq(sp,stop)
        machine.reg_write(reg.UC_X86_REG_RSP,sp)
        machine.reg_write(reg.UC_X86_REG_RCX,heap)
        machine.reg_write(reg.UC_X86_REG_RDX,heap+0x1000)
        machine.reg_write(reg.UC_X86_REG_R8,heap+0x2000)
        machine.emu_start(0x145ba6470,stop,count=10000)
        assert state['admitted']==expected,(key,values,state['admitted'],expected)
        cases.append(dict(key=key,inputs=values,admitted=expected))
    for key,target_count in [('feat:endless3',3),('feat:endless6',6)]:
        for count,won in itertools.product(range(10),(False,True)):
            case(key,count>=target_count,endless_bosses=count,won=won)
    for key,field,threshold in [('feat:marks100','run_marks',100),('feat:bossmarks50','max_boss_marks',50)]:
        values=[0.,threshold-1,threshold-.002,threshold-.0011,threshold-.001,threshold-.0009,threshold,threshold+1]
        for value,won in itertools.product(values,(False,True)):
            value=f32(value)
            case(key,f32(value+f32(.001))>=threshold,**{field:value,'won':won})
    for rank,stars,won in itertools.product(range(6),range(6),(False,True)):
        case('feat:unpolished',won and rank>=2 and stars==0,heroic_rank=rank,max_equipment_stars=stars,won=won)
    for zone,tier,won in itertools.product(range(12),range(7),(False,True)):
        case('feat:humble',won and zone==11 and tier==1,zone=zone,active_set=tier,won=won)
    for count,tier,mismatch,won in itertools.product(range(7),range(7),(False,True),(False,True)):
        members=[tier]*count
        if mismatch and members: members[-1]=(tier+1)%7
        expected=won and count>=3 and bool(members[0]) and len(set(members))==1
        case('coop:matching',expected,members=members,won=won)
    for count,rank,won in itertools.product(range(7),range(6),(False,True)):
        case('coop:raidnight',won and count==5 and rank>=3,members=[0]*count,heroic_party=rank>=3,heroic_rank=rank,won=won)
    # Current catalog variants5/8/9 change the three earlier full-reward
    # achievements to HeroicIII. Their event/victory domains remain separate.
    for rank,won in itertools.product(range(6),(False,True)):
        case('feat:odds',won and rank>=3,heroic_rank=rank,won=won)
    for count,rank,won in itertools.product(range(7),range(6),(False,True)):
        case('coop:odds',won and count>=2 and rank>=3,members=[0]*count,
             heroic_party=rank>=3,heroic_rank=rank,won=won)
    for count,rank,boss in itertools.product(range(7),range(6),(1194,1193)):
        case('coop:oldgods',count>=2 and rank>=3 and boss==1194,members=[0]*count,
             heroic_party=rank>=3,heroic_rank=rank,boss_event=boss)
    return cases,state['steps']


def query_receipt(folder, procedure):
    from discovery_native_subject import verify_native_query_subject
    folder=ROOT/folder
    plan_path=ROOT/json.loads((folder/'journal.json').read_text())['identity']['plan']['plan_path']
    plan=json.loads(plan_path.read_text())
    result_path=None
    for candidate in (folder/'results').glob('*.json'):
        result=json.loads(candidate.read_text())
        native=result.get('structuredContent') or json.loads(result['content'][0]['text'])
        if native['parameters'].get('procedure')==procedure:
            result_path=candidate
            break
    assert result_path is not None,(folder,procedure)
    def ref(path):
        return dict(path=path.relative_to(ROOT).as_posix(),sha256=hashlib.sha256(path.read_bytes()).hexdigest())
    receipt=dict(procedure=procedure,evidence_id=native['evidence_id'],provider=native['provider'],
        analysis_profile_digest=native['analysis_profile']['digest'],
        normalized_text_sha256=hashlib.sha256(native['normalized_result'].encode()).hexdigest(),
        result=ref(result_path),plan=ref(plan_path),journal=ref(folder/'journal.json'),
        raw_input=ref(ROOT/plan['target']),slice_virtual_address=plan['open_options']['entry_point'])
    return receipt,native


def connected_source(rank_only=False):
    """Bind local, replica and cached grant routes, optionally only rank/zone."""
    base = 'crates/azeroth-survivors-re/src/'
    rows = []
    def section(path, start, end, fragments):
        source = (ROOT / (base + path)).read_text()
        at = source.index(start)
        stop = source.index(end, at + len(start))
        selected = source[at:stop]
        for fragment in fragments:
            assert fragment in selected, (path, fragment)
        rows.append(dict(path=base + path, start=start, end=end,
                         sha256=hashlib.sha256(selected.encode()).hexdigest()))
    section('account_progression.rs', 'impl RunSnapshot {', 'pub fn meets_feat(', [
        'pub fn with_heroic_cap', 'self.heroic_rank = self.heroic_rank.min(cap)',
        'self.full_reward = self.heroic_rank >= 3'])
    fields = ['heroic_rank: state.heroic_rank', 'self.heroic_rank()',
        'zone: azeroth_survivors_re::guardians::catalog::ZONES', 'snapshot.zone = ']
    if not rank_only:
        fields += ['endless_bosses: state.boss_counter', 'run_marks: self.run_marks()',
            'max_boss_marks: self.max_boss_marks()', 'max_equipment_stars: state.max_equipment_stars',
            'active_set: state.active_set', 'snapshot.endless_bosses = self.endless_boss_kills()',
            'snapshot.run_marks = self.run_marks()', 'snapshot.max_boss_marks = self.max_boss_marks()',
            'snapshot.max_equipment_stars = self.equipment_stars().into_iter().max()',
            'snapshot.active_set = self.effect_state.set_descriptor.map_or(0, |set| set.tier + 1)']
    section('gameplay/mechanics/progression.rs', '    pub fn feat_snapshot(',
            '    pub fn terminal_delivery(', fields)
    if not rank_only:
        section('gameplay/mechanics/progression.rs', '    pub fn run_marks(',
                '    pub fn record_equipment_receipt(', [
            'self.base_run_marks()', 'self.base_max_boss_marks()',
            '|state| state.run_marks', '|state| state.max_boss_marks'])
    fields = ['zone: Some(zone_index)', 'heroic_rank: projection.heroic_rank']
    if not rank_only:
        fields += ['endless_bosses: projection.boss_counter', 'run_marks: projection.run_marks',
            'max_boss_marks: projection.max_boss_marks',
            'max_equipment_stars: projection.max_equipment_stars', 'active_set: projection.active_set']
    section('gameplay/guest_settlement.rs', '    pub(super) fn from_cached(',
            '    pub(super) fn summary_admitted(', fields)
    section('gameplay/guest_settlement.rs', '    pub(super) fn account(', '#[cfg(test)]', [
        'self.feats.with_heroic_cap(menu.backend_save.max_heroic_rank(',
        'self.result.class, self.result.zone_key)', 'zone, feats, context, now,'])
    section('gameplay/mod.rs', 'fn persist_run_at(', '\nfn hud(', [
        'game.feat_snapshot(starting_gear).with_heroic_cap(',
        'menu.backend_save.max_heroic_rank(game.class.class_id, game.zone.key)'])
    if not rank_only:
        asset = ROOT / 'crates/azeroth-survivors-re/assets/run-achievements-0.121.0.json'
        rows.append(dict(path=str(asset.relative_to(ROOT)), sha256=hashlib.sha256(asset.read_bytes()).hexdigest()))
    return rows


def photosynthesis_current(target, image, pe):
    """Check only the current exact-rank addition and its retained live consumers."""
    from discovery_native_subject import verify_native_query_subject
    proof_path = ROOT / 'docs/analysis/evidence/party-achievements-photosynthesis.json'
    proof = json.loads(proof_path.read_text())
    assert proof['target'] == {key: target[key] for key in proof['target']}
    assert proof['gap_ids'] == [157]
    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert offset == int(row['file_offset'], 16)
        assert raw == bytes.fromhex(row['bytes_hex'])
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
    for row in proof['literals']:
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        raw = image[offset:offset + row['bytes']]
        assert raw.decode() == row['text'] and hashlib.sha256(raw).hexdigest() == row['sha256']
    assert len(proof['locale_bindings']) == 14
    for row in proof['locale_bindings']:
        payload = row['payload']
        offset = int(payload['file_offset'], 16)
        raw = image[offset:offset + payload['byte_count']]
        assert hashlib.sha256(raw).hexdigest() == payload['sha256']
        native = json.loads(raw)
        source = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/locales'
                             / (row['code'] + '.json')).read_text())
        for key, value in row['entries'].items():
            assert native[key] == value == source[key]
    for query in proof['queries']:
        for field in ('result', 'plan', 'journal', 'raw_input'):
            ref = query[field]
            assert hashlib.sha256((ROOT / ref['path']).read_bytes()).hexdigest() == ref['sha256']
        result = json.loads((ROOT / query['result']['path']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        assert native['evidence_id'] == query['evidence_id']
        assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)

    harness = load_script('photosynthesis_terminal', ROOT / 'scripts/native_terminal.py').NativeReplay(image, pe)
    reg, machine = harness.registers, harness.machine
    cases = 0
    for rank, cap, present in itertools.product((0, 1, 2, 3, 4, 5, 6, 7, 255),
                                               (0, 1, 2, 3, 4, 5, 6, 7, 255), (False, True)):
        harness.reset('photosynthesis_rank',
                      [(0x145b3ce43, 0x145b3ce78), (0x145b3d296, 0x145b3d2ca),
                       (0x145b3d66b, 0x145b3d67e)],
                      [0x145b3ce78, 0x145b3d030, 0x145b3d67e])
        machine.reg_write(reg.UC_X86_REG_R15, harness.app)
        harness.put(harness.app + 0x7c, '<I', rank)
        harness.put(harness.app + 0xae, '<B', cap)
        harness.run(0x145b3ce43)
        assert harness.get(harness.bp + 0xdc, '<I')[0] == min(rank, cap)
        harness.put(harness.bp + 0x78, '<Q', 0 if present else 0xffffffffffffffff)
        harness.put(harness.bp + 0x107, '<B', 3)
        machine.reg_write(reg.UC_X86_REG_RAX, 2)
        admitted = harness.run(0x145b3d296) == 0x145b3d67e
        assert admitted == (present and min(rank, cap) == 3), (rank, cap, present)
        cases += 1
    assert cases == proof['native_checks']['isolated_instruction_cases']
    assert harness.instructions == proof['native_checks']['original_instruction_steps']

    base = ROOT / 'crates/azeroth-survivors-re'
    asset = json.loads((base / 'assets/coop-achievements-0.127.0.json').read_text())
    assert asset['target_sha256'] == target['sha256']
    row = next(row for row in asset['achievements'] if row['key'] == 'coop:photosynthesis')
    assert row['cooperative'] == {
        'type': 'boss', 'boss_id': 1494, 'spells': [740], 'max_modifiers': False,
        'heroic_rank': 3, 'party': {'kind': 'talent', 'class': 11, 'key': 'tranquility'}}
    assert {field: row[field] for field in ('name', 'description', 'icon')} == {
        item['role']: item['text'] for item in proof['literals'] if item['role'] != 'key'}
    assert (row['points'], row['category']) == (50, 5)
    source = (base / 'src/account_progression.rs').read_text()
    assert '#[serde(default)]\n        heroic_rank: Option<u8>' in source
    assert 'heroic_rank.is_none_or(|rank| run.heroic_rank == rank)' in source
    assert 'party.matches(&event.members)' in source
    assert 'event.kind_21 != 2 && spells.contains(&event.word_1c)' in source
    for path in ('account_progression.rs', 'progression.rs'):
        content = (base / 'src' / path).read_text()
        assert '../assets/coop-achievements-0.127.0.json' in content
        assert ('.find(|' in content or '.position(|' in content) and '.key == ' in content
        assert ('*prior = ' in content or 'catalog.achievements[index] = ' in content)
        assert 'catalog.achievements.push(' in content
    connected_source(rank_only=True)
    print(json.dumps(dict(status='passed', gap_ids=[157], target=proof['target'],
        native_queries=len(proof['queries']), isolated_original_instruction_cases=cases,
        original_instruction_steps=harness.instructions, rust_regressions_executed=False,
        compilation=False, game_or_service_execution=False, parity_verified=False), indent=2))


def insane_source_connections(proof):
    """Check the connected source without claiming to compile or execute Rust."""
    base = ROOT / 'crates/azeroth-survivors-re'
    paths = ('coop/replication.rs', 'coop/client_state.rs', 'gameplay/mechanics.rs',
             'gameplay/mechanics/coop.rs', 'gameplay/mechanics/progression.rs',
             'gameplay/guest_settlement.rs', 'gameplay/coop.rs', 'account_progression.rs')
    source = {path: (base / 'src' / path).read_text() for path in paths}
    def section(path, start, end, fragments):
        text = source[path]
        at = text.index(start)
        selected = text[at:text.index(end, at + len(start))]
        for fragment in fragments:
            assert fragment in selected, (path, fragment)
        return selected
    encoder = section('coop/replication.rs', '        NativeMessage::State(state) => {',
                      '        NativeMessage::End =>', [
        'out.extend_from_slice(&state.alive_since_bits.to_le_bytes())'])
    assert encoder.index('[state.max_equipment_stars, state.active_set]') < encoder.index(
        'state.alive_since_bits.to_le_bytes()') < encoder.index('[u8::from(state.flag_8e), state.byte_90]')
    decoder = section('coop/replication.rs', '        15 => {', '        18 =>', [
        'let alive_since_bits = reader.word()?',
        'heroic_rank, boss_counter, max_equipment_stars, active_set, alive_since_bits'])
    assert decoder.index('let active_set = reader.byte()?') < decoder.index(
        'let alive_since_bits = reader.word()?') < decoder.index('let flag_8e = reader.flag()?')
    section('coop/client_state.rs', 'impl RunProjection {', 'pub fn run_modifiers(', [
        'alive_since: f32::from_bits(state.alive_since_bits)',
        'state.alive_since_bits = self.alive_since.to_bits()'])
    section('coop/client_state.rs', 'pub fn validate_state(', 'pub fn sanitize_text(', [
        'let clock = f64::from(clock).max(0.0).min(ceiling)',
        'alive_since.is_finite() && alive_since >= 0.0', 'let admitted_clock = clock as f32',
        'if alive_since < admitted_clock { alive_since } else { admitted_clock }', '-1.0'])
    assert 'alive_since: 0.0' in source['gameplay/mechanics.rs']
    section('gameplay/mechanics/coop.rs', 'hero_state! {', '#[derive(Clone, Copy, Debug)]',
            ['alive_since: f32'])
    section('gameplay/mechanics/coop.rs', '    pub(super) fn exported_alive_since(',
            '    pub fn native_state(', [
        'if self.dead && !self.completed { -1.0 } else { self.alive_since }'])
    section('gameplay/mechanics/coop.rs', '    pub fn native_state(',
            '    pub fn apply_replica_state(', [
        'alive_since_bits: self.exported_alive_since().to_bits()'])
    section('gameplay/mechanics/coop.rs', '    pub fn apply_replica_state(',
            '    pub fn apply_replica_native(', ['self.alive_since = state.alive_since'])
    section('gameplay/mechanics/coop.rs', '    fn apply_party_revive(', '\n}', [
        'self.dead = false', 'self.alive_since = self.clock'])
    section('gameplay/mechanics/progression.rs', '    pub fn feat_snapshot(',
            '    pub fn terminal_delivery(', [
        'alive_since: state.alive_since', 'snapshot.alive_since = self.exported_alive_since()'])
    section('gameplay/guest_settlement.rs', '    pub(super) fn from_cached(',
            '    pub(super) fn summary_admitted(', ['alive_since: projection.alive_since'])
    live = section('gameplay/guest_settlement.rs', '    pub(super) fn live_feats(',
                   '    pub(super) fn account(', [
        'guid.is_none_or(|guid| guid == crate::startup::TESTER_GUID)',
        '!(1..=5).contains(&self.phase)',
        'self.feats.with_heroic_cap(menu.backend_save.max_heroic_rank(',
        'crate::progression::grant_run_feats(', 'crate::progression::grant_party_feats(',
        'if !granted.is_empty()', 'menu.commit_account()',
        'granted.into_iter().map(RunEvent::Achievement).collect()'])
    assert live.index('if !granted.is_empty()') < live.index('menu.commit_account()')
    for forbidden in ('apply_run_counts', 'apply_run_totals', 'grant_terminal_xp',
                      'mark_cooperative_victory', 'record_character_', '.summary(',
                      'acknowledge_', 'restore_guest_checkpoints'):
        assert forbidden not in live, ('live feats must not deliver account/summary state', forbidden)
    section('gameplay/coop.rs', 'fn receive_live_feats(', '    pub(crate) fn settle(', [
        'self.entry.filter(|_| self.zone.is_some())', 'self.state.as_ref()',
        'guest_settlement::Snapshot::from_cached(state, entry, &self.checkpoints)',
        '.with_duplicate_marks(&self.duplicate_marks)',
        'snapshot.live_feats(menu, entry.roster_guid, now)',
        'game.events.extend(events)', 'self.pending_events.extend(events)'])
    receive = section('gameplay/coop.rs', '            NativeMessage::State(value) if guest => {',
                      '            NativeMessage::Lifecycle(LifecyclePacket::EventBytes', [
        'client_state::validate_state(', 'state.state = Some(value)',
        'state.receive_live_feats(&mut run, &mut menu, now)',
        'state.receive_victory(&mut run, &mut menu)', 'if terminal_edge {'])
    ordered = ('state.state = Some(value)', 'state.receive_live_feats(',
               'state.receive_victory(', 'if terminal_edge {', 'state.settle(')
    assert [receive.index(value) for value in ordered] == sorted(receive.index(value) for value in ordered)
    assert 'alive_since' not in (base / 'src/gameplay/mechanics/incoming.rs').read_text()
    asset = json.loads((base / 'assets/coop-achievements-0.127.0.json').read_text())
    assert asset['target_sha256'] == proof['target']['sha256']
    row = next(row for row in asset['achievements'] if row['key'] == 'coop:insane')
    assert row['kind'] == 15 and (row['points'], row['category']) == (50, 5)
    assert row['unlocks'] == []
    assert row['cooperative'] == dict(type='survival', zone=11, heroic_rank=5,
                                     seconds=2400, minimum_members=3)
    for role in ('name', 'description', 'icon'):
        assert row[role] == next(value['text'] for value in proof['literals'] if value['role'] == role)
    account = source['account_progression.rs']
    assert 'pub alive_since: f32' in account
    assert 'Some(CooperativeCondition::Survival' in account
    for fragment in ('zone == *required_zone', 'context.members.len() >= *minimum_members',
                     'run.elapsed >= *seconds', 'run.alive_since >= 0.0',
                     'run.alive_since <= *seconds', 'run.heroic_rank == *heroic_rank'):
        assert fragment in account, fragment
    connected_source(rank_only=True)
    return len(paths)


def insane_current(target, image, pe):
    """Replay the current survival predicate and recipient life-marker normalization."""
    import math
    from discovery_native_subject import verify_native_query_subject
    proof = json.loads((ROOT / 'docs/analysis/evidence/party-achievements-insane.json').read_text())
    assert proof['target'] == {key: target[key] for key in proof['target']}
    assert proof['gap_ids'] == [285]
    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert offset == int(row['file_offset'], 16)
        assert raw == bytes.fromhex(row['bytes_hex'])
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
    for row in proof['literals']:
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        raw = image[offset:offset + row['bytes']]
        assert raw.decode() == row['text'] and hashlib.sha256(raw).hexdigest() == row['sha256']
    delivery = proof['guest_live_delivery']
    calls = [(delivery['state_cache_copy_call'], '0x14606171b'),
             (delivery['live_feat_call'], delivery['live_owner']),
             (delivery['terminal_summary_call'], '0x145bc8ce0'),
             (delivery['terminal_account_call'], '0x145bcfeb0')]
    calls.extend((delivery[name]['site'], delivery[name]['target'])
                 for name in ('snapshot_call', 'evaluator_call'))
    for site, target_address in calls:
        site = int(site, 16)
        offset = pe.rva_offset(site - pe.image_base)
        assert image[offset] == 0xe8
        actual = site + 5 + struct.unpack_from('<i', image, offset + 1)[0]
        assert actual == int(target_address, 16), (hex(site), hex(actual), target_address)
    ordered = ('state_cache_copy_call', 'live_feat_call', 'terminal_guard_start',
               'terminal_summary_call', 'terminal_account_call')
    assert [int(delivery[name], 16) for name in ordered] == sorted(int(delivery[name], 16) for name in ordered)
    assert len(proof['locale_bindings']) == 14
    for row in proof['locale_bindings']:
        payload = row['payload']
        offset = int(payload['file_offset'], 16)
        raw = image[offset:offset + payload['byte_count']]
        assert hashlib.sha256(raw).hexdigest() == payload['sha256']
        native = json.loads(raw)
        source = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/locales'
                             / (row['code'] + '.json')).read_text())
        for key, value in row['entries'].items():
            assert native[key] == source[key] == value
    for query in proof['queries']:
        for field in ('result', 'plan', 'journal', 'raw_input'):
            ref = query[field]
            assert hashlib.sha256((ROOT / ref['path']).read_bytes()).hexdigest() == ref['sha256']
        result = json.loads((ROOT / query['result']['path']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        assert native['evidence_id'] == query['evidence_id']
        assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
    for analysis in proof['retained_analysis']:
        references = [analysis['plan'], analysis['journal']]
        references.extend(row['result'] for row in analysis['results'])
        for ref in references:
            assert hashlib.sha256((ROOT / ref['path']).read_bytes()).hexdigest() == ref['sha256']

    harness = load_script('insane_terminal', ROOT / 'scripts/native_terminal.py').NativeReplay(image, pe)
    reg, machine = harness.registers, harness.machine
    cases = 0
    clocks = [2399.9998, 2400., 2400.0002, 2500., math.nan, math.inf]
    markers = [-1., -0., 0., 2399., 2400., 2400.0002, math.nan, math.inf]
    for clock, marker, present, members, rank, zone in itertools.product(
            clocks, markers, (False, True), range(7), range(4, 7), (0, 11)):
        harness.reset('insane_admission', [(0x145b3cd70, 0x145b3de9c)],
                      [0x145b3ddc7, 0x145b3d030])
        for offset, fmt, value in (
                (0x78, '<Q', 0 if present else 0xffffffffffffffff),
                (0xe0, '<Q', 4), (0xf8, '<Q', 0x147048237), (0xc0, '<Q', zone),
                (0x80, '<Q', members), (0x107, '<B', 5), (0xdc, '<I', rank),
                (0xf7, '<B', int(marker >= 0))):
            harness.put(harness.bp + offset, fmt, value)
        for register, value in ((reg.UC_X86_REG_RAX, 2), (reg.UC_X86_REG_RBX, 2),
                                (reg.UC_X86_REG_R8, 2400), (reg.UC_X86_REG_RSI, 3)):
            machine.reg_write(register, value)
        harness.scalar(reg.UC_X86_REG_XMM6, clock)
        harness.scalar(reg.UC_X86_REG_XMM7, marker)
        admitted = harness.run(0x145b3d2f0) == 0x145b3ddc7
        expected = (present and zone == 11 and clock >= 2400 and marker >= 0
                    and marker <= 2400 and rank == 5 and members >= 3)
        assert admitted == expected, (clock, marker, present, members, rank, zone)
        cases += 1
    assert cases == proof['native_checks']['insane_admission_cases']
    assert harness.instructions == proof['native_checks']['insane_admission_steps']
    predicate_steps = harness.instructions
    marker_bits = [0, 0x80000000, 1, 0x7fffff, 0x800000, 0x3f800000,
                   0x4515f000, 0x45160000, 0x45161000, 0x7f7fffff, 0xbf800000,
                   0x80000001, 0xff7fffff, 0x7f800000, 0xff800000, 0x7fc00000, 0xffc00000]
    normalized = 0
    for clock, bits in itertools.product((0., 1., 2399., 2400., 2401.), marker_bits):
        harness.reset('life_marker_validation', [(0x145b52d12, 0x145b52dae)], [0x145b52dae])
        harness.put(harness.app + 0xc0, '<I', bits)
        machine.reg_write(reg.UC_X86_REG_R13, harness.app)
        harness.scalar(reg.UC_X86_REG_XMM3, clock)
        harness.run(0x145b52d12)
        actual = machine.reg_read(reg.UC_X86_REG_XMM4) & 0xffffffff
        marker = struct.unpack('<f', struct.pack('<I', bits))[0]
        expected = (marker if marker < clock else clock) if math.isfinite(marker) and marker >= 0 else -1.
        assert actual == struct.unpack('<I', struct.pack('<f', expected))[0], (clock, hex(bits), hex(actual))
        normalized += 1
    assert normalized == proof['native_checks']['life_marker_normalization_cases']
    assert harness.instructions - predicate_steps == proof['native_checks']['life_marker_normalization_steps']
    from shared_native_inventory import open_readonly
    inventory = proof['life_marker']['direct_call_inventory']
    assert hashlib.sha256((ROOT / inventory['path']).read_bytes()).hexdigest() == inventory['sha256']
    with open_readonly(ROOT / inventory['path'], root=ROOT) as database:
        metadata = json.loads(database.execute('SELECT value FROM metadata WHERE id=1').fetchone()[0])
        assert metadata['target_sha256'] == proof['target']['sha256']
        sites = [hex(row[0]) for row in database.execute(
            'SELECT site FROM refs WHERE kind=? AND target=? ORDER BY site',
            (inventory['reference_kind'], inventory['callee']))]
    assert sites == inventory['sites']
    rescue = proof['life_marker']['rescue_evidence']
    assert hashlib.sha256((ROOT / rescue['path']).read_bytes()).hexdigest() == rescue['sha256']
    rescue_proof = json.loads((ROOT / rescue['path']).read_text())
    assert rescue_proof['target'] == proof['target']
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_AC_WRITE
    from capstone.x86_const import X86_OP_MEM
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    for span in rescue_proof['native_spans']:
        start, end = int(span['start'], 16), int(span['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert hashlib.sha256(raw).hexdigest() == span['sha256']
        for instruction in decoder.disasm(raw, start):
            assert not (instruction.mnemonic == 'call' and instruction.op_str == inventory['callee'])
            assert not any(operand.type == X86_OP_MEM and operand.mem.disp == 0xd30
                           and operand.access & CS_AC_WRITE for operand in instruction.operands)
    source_paths = insane_source_connections(proof)
    print(json.dumps(dict(status='passed', gap_ids=[285], target=proof['target'],
        native_queries=len(proof['queries']), isolated_original_instruction_cases=cases + normalized,
        original_instruction_steps=harness.instructions, source_connections_checked=True,
        source_paths_checked=source_paths,
        rust_regressions_executed=False, compilation=False, game_or_service_execution=False,
        parity_verified=False), indent=2))

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    parser.add_argument('--photosynthesis-current', action='store_true',
                        help='verify the current exact Heroic-III boss descriptor and connected source')
    parser.add_argument('--insane-current', action='store_true',
                        help='verify the current survival descriptor and life-marker native contracts')
    args=parser.parse_args()
    target=latest_target(verify=True)
    if args.insane_current:
        assert not args.write and not args.photosynthesis_current, 'Choose one read-only current contract'
        image = target_bytes(target)
        pe = load_script('insane_pe', ROOT/'scripts/inventory-executable.py').PE(image)
        insane_current(target, image, pe)
        return
    if args.photosynthesis_current:
        assert not args.write, 'Current focused evidence is read-only'
        image = target_bytes(target)
        pe = load_script('photosynthesis_pe', ROOT/'scripts/inventory-executable.py').PE(image)
        photosynthesis_current(target, image, pe)
        return
    assert target['sha256']=='22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
    image=target_bytes(target)
    pe=load_script('run_feat_pe',ROOT/'scripts/inventory-executable.py').PE(image)
    cases,steps=replay(target,image,pe)
    ranges=[]
    for start,end,role in [(0x145ba6470,0x145ba7292,'run-award-evaluator'),
                           (0x145b90f00,0x145b91272,'party-condition'),
                           (0x145b306b0,0x145b3093c,'account-snapshot-owner'),
                           (0x145b0f490,0x145b0f548,'effective-snapshot-rank')]:
        at=pe.rva_offset(start-pe.image_base)
        raw=image[at:at+end-start]
        ranges.append(dict(role=role,virtual_address=hex(start),file_offset=hex(at),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest()))
    from discovery_native_subject import verify_native_query_subject
    queries=[]
    receipt,native=query_receipt('runtime/analysis/history/findings/fixgap230239/aed9aeb16797/feat-evaluator/query','0x145ba6470')
    verify_native_query_subject(ROOT,native,receipt,{k:target[k] for k in ('version','path','sha256','size_bytes')},image=image,pe=pe)
    queries.append(receipt)
    receipt,native=query_receipt('runtime/analysis/history/findings/fixgap230239/aed9aeb16797/feat-snapshot/query','0x145b306b0')
    verify_native_query_subject(ROOT,native,receipt,{k:target[k] for k in ('version','path','sha256','size_bytes')},image=image,pe=pe)
    queries.append(receipt)
    receipt,native=query_receipt('runtime/analysis/history/findings/fixgap230239/aed9aeb16797/party-condition/query','0x145b90f00')
    verify_native_query_subject(ROOT,native,receipt,{k:target[k] for k in ('version','path','sha256','size_bytes')},image=image,pe=pe)
    queries.append(receipt)
    proof=dict(schema_version=1,target={key:target[key]for key in ('version','path','sha256','size_bytes')},gap_ids=[237],
        queries=queries,native_ranges=ranges,case_count=len(cases),original_instruction_steps=steps,
        cases_sha256=hashlib.sha256(json.dumps(cases,sort_keys=True,separators=(',',':')).encode()).hexdigest(),
        source_connections=connected_source(),
        existing_rank_gate_keys=['feat:odds','coop:odds','coop:oldgods'],snapshot_fields={'zone':'0x80','endless_bosses':'0x98','run_marks':'0x9c','max_boss_marks':'0xa0','won':'0xa4','heroic_rank':'0xa6','max_equipment_stars':'0xa7','active_set':'0xa8'},
        seams=['synthetic account/run/member memory','catalog constructor with separately checked interfaces','fixed locale selection','stop at the native award branch before persistence/date/notifications',
               'snapshot owner/rank ranges are static trace evidence; snapshot production is not replayed here'],
        compilation='not_run',application_executed=False,parity_verified=False)
    if args.write: PROOF.write_text(portable_json(proof,indent=2)+'\n')
    else: assert portable_record(json.loads(PROOF.read_text()))==portable_record(proof),'Run achievement predicate proof changed'
    print(f'PASS: {len(cases)} run/party cases, {steps} original steps; no compilation/application')

if __name__=='__main__':main()

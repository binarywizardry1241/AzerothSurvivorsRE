#!/usr/bin/env python3
"""Check current revive-choice instructions and source wiring without compiling.

The instruction fixtures run only selected unmodified instructions in scratch
memory. They do not start the client, game, networking or any server. --guest-hud
also checks the independent recipient HUD correction under #179.
"""
import argparse
import hashlib
import itertools
import json
import math
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def compact(path):
    text = (ROOT / path).read_text()
    return re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", text))


def check_soulstone():
    """Replay the current rescue write and its shared incoming-aura guard."""
    from discovery_native_subject import verify_native_query_subject
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.127.0/soulstone/manifest.json').read_text())
    target = latest_target(verify=True)
    assert proof['target'] == {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(target)
    pe = load_script('soulstone_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['native_spans'] + proof['constants']:
        start = int(row['start'], 16)
        off = pe.rva_offset(start - pe.image_base)
        assert off == int(row['file_offset'], 16)
        assert digest(image[off:off + row['byte_count']]) == row['sha256']
    query = proof['query']
    for name in ('plan', 'journal', 'result', 'raw_input'):
        row = query[name]
        assert digest((ROOT / row['path']).read_bytes()) == row['sha256']
    evidence = json.loads((ROOT / query['result']['path']).read_text())['structuredContent']
    assert evidence['evidence_id'] == query['evidence_id']
    assert digest(evidence['normalized_result'].encode()) == query['normalized_text_sha256']
    verify_native_query_subject(ROOT, evidence, query, target, image=image, pe=pe)
    live = compact('crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs')
    branch = live.split('ifself.remaining_lives()>0&&self.consume_life(){', 1)[1].split('self.execution.vitals.health=0.0;', 1)[0]
    stages = ('self.execution.vitals.health=self.max_health()*0.5;', 'spell_id:21169',
              'native::soulstone_grace(&mutself.execution.auras,self.clock);',
              'self.refresh_effects();', 'native::soulstone_targets(', 'self.resolve_effect_hit(')
    assert [branch.index(stage) for stage in stages] == sorted(branch.index(stage) for stage in stages)
    core = compact('crates/azeroth-survivors-re/src/player_abilities/behavior/incoming.rs')
    grace = core.split('pubfnsoulstone_grace(', 1)[1].split('pubfn', 1)[0]
    for statement in ('super::buffs::refresh_aura(auras,Aura{', 'source_guid:0,', 'tag:11,',
                      'spell_id:1020,', 'expires_at:now+2.0,', 'healing_power:0.0,'):
        assert statement in grace, statement
    assert 'aura.effect.tag==11&&aura.expires_at>now' in core
    buff = compact('crates/azeroth-survivors-re/src/player_abilities/behavior/buffs.rs')
    assert 'old.spell_id!=aura.spell_id' in buff
    effects = compact('crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs')
    assert 'self.publish_player_auras();' in effects.split('pub(super)fnrefresh_effects(', 1)[1].split('pub(super)fnpublish_player_auras(', 1)[0]
    coop = compact('crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs')
    assert 'execution:ExecutionState' in coop and 'effect_state:effects::EffectsState' in coop
    assert 'hero.state.swap(self);' in coop and 'letresult=action(self);' in coop
    replay = Replay(image, pe, proof)
    game, auras, frame = replay.heap, replay.heap + 0x4000, replay.heap + 0x9000
    cases = 0
    for charges, maximum in itertools.product((0, 1, 2), (1.0, 100.0, 123.5)):
        replay.put(game + 0x598, 'I', charges)
        replay.put(game + 0x4c8, 'f', maximum)
        replay.put(game + 0x538, 'f', -500.0)
        replay.run(0x145c135c3, (0x145c135f5, 0x145c138c9), {'R13': game})
        assert replay.get(game + 0x598, 'I') == max(charges - 1, 0)
        assert replay.get(game + 0x538, 'f') == (maximum * .5 if charges else -500.0)
        cases += 1
    for old_spells in ((), (1020,), (774, 1020), (1020, 774, 1020, 17), (774, 17)):
        replay.put(game + 0x3d0, 'QQQ', 16, auras, len(old_spells))
        replay.put(frame - 0x38, 'Q', game + 0x3d0)
        for index, spell in enumerate(old_spells):
            replay.put(auras + index * 32, 'QIIIIfI', 0, 12, 0, 0, spell, 900.0, 0)
        replay.run(0x145c13684, (0x145c1371d,), {'R13': game, 'RBP': frame,
            'XMM6': struct.unpack('<I', struct.pack('<f', 10.0))[0]})
        count = replay.get(game + 0x3e0, 'Q')
        expected = [spell for spell in old_spells if spell != 1020] + [1020]
        assert [replay.get(auras + index * 32 + 0x14, 'I') for index in range(count)] == expected
        added = auras + (count - 1) * 32
        assert replay.get(added, 'Q') == 0
        assert replay.get(added + 8, 'I') == 12
        assert replay.get(added + 0x18, 'f') == 12.0
        assert replay.get(added + 0x1c, 'I') == 0
        cases += 1
    before_deadline = struct.unpack('<f', struct.pack('<I', 0x41400000 - 1))[0]
    for now, expiry, tag in itertools.product((10.0, before_deadline, 12.0, 13.0),
                                            (9.0, 12.0, float('nan')), (7, 12)):
        replay.put(game + 0xcc0, 'f', now)
        replay.put(game + 0x3d8, 'QQ', auras, 1)
        replay.put(auras + 8, 'I', tag)
        replay.put(auras + 0x18, 'f', expiry)
        replay.run(0x145c12441, (0x145c12495, 0x145c13338), {'R13': game, 'RBP': frame})
        rejected = replay.u.reg_read(replay.reg.UC_X86_REG_RIP) == 0x145c13338
        assert rejected == (tag == 12 and expiry > now), (now, expiry, tag)
        cases += 1
    # The guard reads the selected recipient's vector; another hero at the
    # same run clock receives no protection from that aura.
    other_hero = game + 0x1000
    replay.put(game + 0xcc0, 'f', 10.0)
    replay.put(game + 0x3d8, 'QQ', auras, 1)
    replay.put(auras + 8, 'I', 12)
    replay.put(auras + 0x18, 'f', 12.0)
    replay.put(other_hero + 0xcc0, 'f', 10.0)
    replay.put(other_hero + 0x3d8, 'QQ', auras + 0x1000, 0)
    for hero, protected in ((game, True), (other_hero, False)):
        replay.run(0x145c12441, (0x145c12495, 0x145c13338), {'R13': hero, 'RBP': frame})
        assert (replay.u.reg_read(replay.reg.UC_X86_REG_RIP) == 0x145c13338) == protected
        cases += 1
    return {'target': target['version'], 'isolated_instruction_cases': cases,
            'executed_instruction_sites': len(replay.visited), 'retained_queries': 1,
            'source_order_and_recipient_ownership_checked': True,
            'application_compiled_or_executed': False, 'runtime_or_parity_validated': False}


def source_checks(guest_hud):
    source = compact('crates/azeroth-survivors-re/src/coop/game_party.rs')
    assert 'matches!(self.state,1|2)' in source
    update = source.split('pubfnupdate_revives(', 1)[1].split('pubfnselect_target(', 1)[0]
    for text in ('self.interactions.clear();', 'if!self.active{returnVec::new();}',
                 'self.heroes.iter().filter(|hero|hero.can_revive())',
                 '(hero.slot,hero.position,hero.name.clone(),hero.state==1)',
                 '*slot!=hero.slot&&distance_squared(*position,hero.position)<=REVIVE_RADIUS_SQUARED',
                 'ifnearby.is_empty(){(hero.revive_elapsed-delta).max(0.0)}',
                 'elseifnearby.iter().any(|(_,_,_,advancing)|*advancing){hero.revive_elapsed+delta}',
                 'else{hero.revive_elapsed};',
                 'for(helper,_,helper_name,_)innearby', 'if!hero.down(){continue;}',
                 'hero.revive_elapsed>=REVIVE_SECONDS', 'hero.health=hero.max_health*0.5'):
        assert text in update, text
    assert update.index('lethelpers:') < update.index('forheroin&mutself.heroes')
    live = compact('crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs')
    assert 'self.coop.snapshot.update_revives(delta,self.clock)' in live
    assert 'revive_elapsed:self.coop.local_revive' in live
    assert 'revive_elapsed:hero.revive' in live
    assert 'self.coop.local_revive=row.revive_elapsed' in live
    assert 'hero.revive=row.revive_elapsed' in live
    if guest_hud:
        hud = live.split('pubfncoop_hud(', 1)[1].split('pubfnapply_replica_hud(', 1)[0]
        timer = hud.split('letelapsed=', 1)[1].split('hud["revive"]', 1)[0]
        assert 'ifslot==0{self.coop.local_revive}else{' in timer
        assert 'self.coop.snapshot.heroes' in timer and 'hero.slot==slot' in timer
        assert 'hero.revive_elapsed' in timer
        assert 'self.coop.remotes' not in timer
        assert 'self.dead&&!self.abandoned&&self.party_shared_running()' in hud
        borrowed = live.split('pubfnwith_party_hero<', 1)[1].split('pubfn', 1)[0]
        for statement in ('letmuthero=self.coop.remotes.remove(index);',
                          'self.coop.active_slot=slot;', 'hero.state.swap(self);',
                          'letresult=action(self);', 'self.coop.remotes.insert(index,hero);'):
            assert statement in borrowed, statement
        assert borrowed.index('self.coop.remotes.remove(index)') < borrowed.index('action(self);')
        assert borrowed.index('action(self);') < borrowed.index('self.coop.remotes.insert(index,hero)')
        overlay = compact('crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs')
        recipient = overlay.split('game.with_party_hero(slot,|game|{', 1)[1].split('})', 1)[0]
        assert 'due.then(||game.coop_hud(member_locale))' in recipient


class Replay:
    def __init__(self, image, pe, proof):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        from unicorn import x86_const as reg
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        self.reg, self.image, self.pe = reg, image, pe
        self.visited, self.stop_at = set(), set()
        pages = set()
        for row in proof['native_spans'] + proof['constants']:
            start = int(row['start'], 16)
            pages.update(range(start & ~4095, (start + row['byte_count'] + 4095) & ~4095, 4096))
        for page in pages:
            self.u.mem_map(page, 4096)
            off = pe.rva_offset(page - pe.image_base)
            self.u.mem_write(page, image[off:off + 4096])
        self.heap = 0x20000000
        self.u.mem_map(self.heap, 0x10000)

        def hook(_, address, size, unused):
            if address in self.stop_at:
                self.u.emu_stop()
                return
            assert any(int(row['start'], 16) <= address < int(row['end_exclusive'], 16)
                       for row in proof['native_spans']), hex(address)
            off = pe.rva_offset(address - pe.image_base)
            assert bytes(self.u.mem_read(address, size)) == image[off:off + size]
            self.visited.add(address)

        self.u.hook_add(UC_HOOK_CODE, hook)

    def put(self, address, fmt, *values):
        self.u.mem_write(address, struct.pack(fmt, *values))

    def get(self, address, fmt):
        return struct.unpack(fmt, self.u.mem_read(address, struct.calcsize(fmt)))[0]

    def run(self, start, ends, registers):
        self.stop_at = set(ends)
        for name, value in registers.items():
            self.u.reg_write(getattr(self.reg, 'UC_X86_REG_' + name), value)
        self.u.emu_start(start, 0, count=10000)
        result = self.u.reg_read(self.reg.UC_X86_REG_RIP)
        assert result in self.stop_at, hex(result)
        return result

    def flags(self, state, remote):
        self.put(self.heap + 0xc8a, '<B', state)
        if remote:
            self.run(0x145b2387f, [0x145b23893], {'R10': self.heap})
            return (self.u.reg_read(self.reg.UC_X86_REG_RSI) & 255,
                    self.u.reg_read(self.reg.UC_X86_REG_R12) & 255)
        self.run(0x145b7e69d, [0x145b7e6b2], {'R12': self.heap})
        return (self.u.reg_read(self.reg.UC_X86_REG_R14) & 255,
                self.u.reg_read(self.reg.UC_X86_REG_RSI) & 255)

    def nearby(self, self_index, index, eligible, x, y, z, later):
        row, target = self.heap + 0x1000, self.heap + 0x1100
        self.put(row, '<3fB', x, y, z, eligible)
        self.put(target, '<3f', 0.0, 0.0, 999.0)
        self.put(self.heap + 0x1200, '<Q', self_index)
        bits = struct.unpack('<I', struct.pack('<f', 25.0))[0]
        if later:
            end = self.run(0x145c33a1c, [0x145c33a10, 0x145c33a46],
                           {'RDX': self_index, 'RBX': index, 'R14': row, 'R13': target, 'XMM6': bits})
            return end == 0x145c33a46
        end = self.run(0x145c33988, [0x145c33970, 0x145c33978, 0x145c339ba],
                       {'RAX': self_index, 'RDI': index, 'R14': row, 'R13': target,
                        'RDX': self.heap + 0x1300, 'XMM6': bits})
        return end == 0x145c339ba

    def timer(self, active, elapsed, delta):
        game, frame, snaps, selected, clock = (self.heap, self.heap + 0x2000,
                                              self.heap + 0x5000, self.heap + 0x6000,
                                              self.heap + 0x7000)
        self.put(game + 0xc68, '<f', elapsed)
        self.put(frame + 0x1350, '<Q', len(active))
        self.put(frame + 0x1348, '<Q', selected)
        self.put(frame + 0x12f8, '<Q', snaps)
        self.put(frame + 0x1300, '<Q', len(active))
        self.put(frame - 0x58, '<Q', clock)
        self.put(clock, '<f', delta)
        for index, value in enumerate(active):
            self.put(selected + index * 8, '<Q', index)
            self.put(snaps + index * 16 + 13, '<B', value)
        end = self.run(0x145b7e9f7, [0x145b7eacb, 0x145b7ecb2],
                       {'R12': game, 'RBP': frame, 'RSP': self.heap + 0xf000})
        return self.get(game + 0xc68, '<f'), end == 0x145b7ecb2


def replays(image, pe, proof, guest_hud):
    replay = Replay(image, pe, proof)
    cases = {'snapshot_flags': 0, 'nearby_selection': 0, 'timer': 0}
    for remote in (False, True):
        for state in range(256):
            assert replay.flags(state, remote) == (int(state in (1, 2)), int(state == 1))
            cases['snapshot_flags'] += 1
    for later, self_index, index, eligible, xyz in itertools.product(
            (False, True), (0, 1), (0, 1), (0, 1),
            ((0., 0., 0.), (3., 4., 800.), (5., 0., -800.), (5.001, 0., 0.),
             (0., 5.001, 0.), (math.nan, 0., 0.), (math.inf, 0., 0.))):
        x, y, z = xyz
        expected = index != self_index and eligible == 1 and x * x + y * y <= 25.0
        assert replay.nearby(self_index, index, eligible, x, y, z, later) == expected
        cases['nearby_selection'] += 1
    for count in range(5):
        for active in itertools.product((0, 1), repeat=count):
            for elapsed, delta in itertools.product((0., 0.5, 2., 5.5, 6., 8.), (0., 0.5, 1., 8.)):
                expected = max(elapsed - delta, 0.) if not active else elapsed + delta if any(active) else elapsed
                actual, complete = replay.timer(active, elapsed, delta)
                assert actual == expected and complete == (expected >= 6.), (active, elapsed, delta, actual)
                cases['timer'] += 1
    # These sequences retain the same timer through choice entry/exit and loss
    # of the final nearby helper. No second increment occurs with two fighters.
    for sequence in (([1], [0], [0], [1]), ([0], [0, 1], [0, 0], []),
                     ([], [0], [1, 1], [0])):
        elapsed = 2.
        for active in sequence:
            before = elapsed
            elapsed, complete = replay.timer(active, elapsed, 0.5)
            expected = max(before - 0.5, 0.) if not active else before + 0.5 if any(active) else before
            assert elapsed == expected and not complete
            cases['timer'] += 1
    if guest_hud:
        cases['guest_hud_swap_publish_restore'] = 0
        # The actual wrapper removes the remote before swapping its private
        # fields into Game. Execute the original timer exchange, HUD getter and
        # reverse exchange with distinct host/recipient values at that seam.
        game, remote = replay.heap, replay.heap + 0x8000
        for host_elapsed, guest_elapsed in itertools.product((0., 0.5, 2., 5.5, 6., 8.), repeat=2):
            replay.put(game + 0xc68, '<f', host_elapsed)
            replay.put(remote + 0x978, '<f', guest_elapsed)
            replay.run(0x145ba985a, [0x145ba9876], {'RCX': game, 'RDX': remote})
            assert replay.get(game + 0xc68, '<f') == guest_elapsed
            assert replay.get(remote + 0x978, '<f') == host_elapsed
            replay.run(0x145b9960b, [0x145b9962e], {'RSI': game})
            bits = replay.u.reg_read(replay.reg.UC_X86_REG_XMM0) & 0xffffffff
            actual = struct.unpack('<f', struct.pack('<I', bits))[0]
            expected = struct.unpack('<f', struct.pack('<f', min(max(guest_elapsed / 6., 0.), 1.)))[0]
            assert actual == expected
            replay.run(0x145ba985a, [0x145ba9876], {'RCX': game, 'RDX': remote})
            assert replay.get(game + 0xc68, '<f') == host_elapsed
            assert replay.get(remote + 0x978, '<f') == guest_elapsed
            cases['guest_hud_swap_publish_restore'] += 1
    return cases, len(replay.visited)


def check_parallel_current():
    from discovery_native_subject import verify_native_query_subject
    from coverage_common import project_path, file_sha256
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.127.0/revive-choice/manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(target[k] == proof['target'][k] for k in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('parallel_revive_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['native_spans'] + proof['constants']:
        off = pe.rva_offset(int(row['start'], 16) - pe.image_base)
        assert off == int(row['file_offset'], 16)
        assert digest(image[off:off + row['byte_count']]) == row['sha256']
    for query in proof['queries']:
        result = project_path(query['result']['path'])
        assert file_sha256(result) == query['result']['sha256']
        value = json.loads(result.read_text())
        native = value.get('structuredContent') or json.loads(value['content'][0]['text'])
        assert verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe) == query['subject_verification']
    replay = Replay(image, pe, proof)
    game, frame, snaps, selected, clock = (replay.heap, replay.heap + 0x3000,
        replay.heap + 0x7000, replay.heap + 0x8000, replay.heap + 0x9000)
    f32 = lambda value: struct.unpack('<f', struct.pack('<f', value))[0]
    cases = 0
    for count in range(5):
        for active in itertools.product((0, 1), repeat=count):
            for elapsed, delta in itertools.product((0., .5, 5.9, 8.9), (0., .1, 1., 2.)):
                replay.put(game + 0xd60, '<f', elapsed)
                replay.put(frame + 0x1400, '<QQ', snaps, count)
                replay.put(frame - 0x58, '<Q', clock)
                replay.put(clock, '<f', delta)
                for index, flag in enumerate(active):
                    replay.put(snaps + index * 16 + 13, '<B', flag)
                    replay.put(selected + index * 8, '<Q', index)
                replay.run(0x145bff3b6, [0x145bff46e],
                    {'RAX': count, 'R14': selected, 'RBP': frame, 'RSI': game})
                before, step = f32(elapsed), f32(delta)
                if not active:
                    expected = max(f32(before - step), 0.)
                elif sum(active):
                    rate = f32(f32((sum(active) - 1) * f32(.2)) + f32(1.))
                    expected = f32(before + f32(rate * step))
                else:
                    expected = before
                assert replay.get(game + 0xd60, '<f') == expected, (active, elapsed, delta)
                cases += 1
    source = compact('crates/azeroth-survivors-re/src/coop/game_party.rs')
    for required in ('nearby.iter().filter(|(_,_,_,active)|*active).count()',
                     'hero.revive_elapsed+(1.0+(advancing-1)asf32*0.2)*delta',
                     '(hero.revive_elapsed-delta).max(0.0)',
                     'for(helper,_,helper_name,_)innearby'):
        assert required in source, required
    live = compact('crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs')
    for required in ('self.coop.snapshot.update_revives(delta,self.clock)',
                     'self.coop.local_revive=row.revive_elapsed',
                     'hero.revive=row.revive_elapsed'):
        assert required in live, required
    return {'target': target['version'], 'retained_queries': len(proof['queries']),
            'isolated_original_instruction_cases': cases, 'source_connections_checked': True,
            'application_compiled_or_executed': False, 'runtime_or_parity_validated': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-retained-queries', action='store_true')
    parser.add_argument('--guest-hud', action='store_true')
    parser.add_argument('--parallel-current', action='store_true',
                        help='Check the 0.127.0 parallel-helper timer contract')
    parser.add_argument('--soulstone', action='store_true',
                        help='Check the current Soulstone rescue contract')
    args = parser.parse_args()
    if args.soulstone:
        print(json.dumps(check_soulstone(), indent=2))
        return
    if args.parallel_current:
        print(json.dumps(check_parallel_current(), indent=2))
        return
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.119.0/revive-choice/manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(target[k] == proof['target'][k] for k in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('revive_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    owners = {(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()}
    for row in proof['native_owners']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        assert (start, end) in owners
        off = pe.rva_offset(start - pe.image_base)
        assert digest(image[off:off + end - start]) == row['sha256']
    import capstone
    cs = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    for row in proof.get('native_leaves', []):
        start = int(row['start'], 16)
        off = pe.rva_offset(start - pe.image_base)
        assert off == int(row['file_offset'], 16)
        raw = image[off:off + row['byte_count']]
        assert digest(raw) == row['sha256']
        instructions = list(cs.disasm(raw, start))
        assert len(instructions) == row['instruction_count']
        assert sum(i.size for i in instructions) == len(raw)
        assert instructions[-1].mnemonic == 'ret'
    for row in proof['native_spans'] + proof['constants']:
        off = pe.rva_offset(int(row['start'], 16) - pe.image_base)
        assert off == int(row['file_offset'], 16)
        raw = image[off:off + row['byte_count']]
        assert digest(raw) == row['sha256']
        if 'instruction_count' in row:
            instructions = list(cs.disasm(raw, int(row['start'], 16)))
            assert len(instructions) == row['instruction_count']
            assert sum(i.size for i in instructions) == len(raw)
    for row in [proof['assembly']] + proof['source_receipts']:
        assert digest((ROOT / row['path']).read_bytes()) == row['sha256'], row['path']
    for line in (ROOT / proof['assembly']['path']).read_text().splitlines():
        if line and not line.startswith(';'):
            address, encoded, _ = line.split(' ', 2)
            off = pe.rva_offset(int(address, 16) - pe.image_base)
            assert image[off:off + len(encoded) // 2].hex() == encoded
    groups = {g['id']: g for g in proof['query_groups']}
    checked = 0
    for row in proof['queries']:
        result = ROOT / row['result']
        if not result.exists():
            assert not args.require_retained_queries, row['result']
            continue
        group = groups[row['group']]
        for field in ('plan', 'journal'):
            assert digest((ROOT / group[field]).read_bytes()) == group[field + '_sha256'], group[field]
        for path, expected in {**group['seed_inputs'], **group['original_tooling']}.items():
            assert digest((ROOT / path).read_bytes()) == expected, path
        assert digest(result.read_bytes()) == row['result_sha256']
        evidence = json.loads(result.read_text())['structuredContent']
        query_target = target['sha256']
        if 'input_range' in group:
            # This undeclared leaf is a bounded raw import. Bind its actual
            # subject to both the retained slice and the selected full image;
            # its subject SHA must not be relabeled as the whole EXE SHA.
            bounded = group['input_range']
            start = int(bounded['start'], 16)
            off = pe.rva_offset(start - pe.image_base)
            assert off == int(bounded['file_offset'], 16)
            raw = image[off:off + bounded['byte_count']]
            assert digest(raw) == bounded['sha256']
            assert (ROOT / bounded['path']).read_bytes() == raw
            query_target = bounded['sha256']
        assert evidence['subject']['digest']['sha256'] == query_target
        assert evidence['evidence_id'] == row['evidence_id']
        assert evidence['analysis_profile']['digest'] == row['profile_digest']
        assert digest(evidence['normalized_result'].encode()) == row['normalized_sha256']
        checked += 1
    source_checks(args.guest_hud)
    cases, sites = replays(image, pe, proof, args.guest_hud)
    print(json.dumps({'target': target['version'], 'native_spans': len(proof['native_spans']),
        'native_bytes': sum(row['byte_count'] for row in proof['native_spans']),
        'native_instructions': sum(row['instruction_count'] for row in proof['native_spans']),
        'retained_queries': checked, 'isolated_instruction_cases': cases,
        'executed_instruction_sites': sites, 'guest_hud_source_checked': args.guest_hud,
        'application_compiled_or_executed': False, 'runtime_or_parity_validated': False}, indent=2))


if __name__ == '__main__':
    main()

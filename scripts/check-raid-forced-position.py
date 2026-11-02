#!/usr/bin/env python3
"""Current Pull position publication and pending movement-report admission.

Synthetic installed-instruction fixtures; no compiler or game process.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import math
import re
import struct
from coverage_common import ROOT

g = load_script('guardian_fixture', ROOT/'scripts/check-raid-guardian-lifecycle.py')
r = g.r
STAGE = ROOT/'runtime/native-evidence/0.112.0/raid-forced-position'
KEPT = ROOT/'docs/analysis/evidence/0.112.0/raid-forced-position'
RANGES = {'report-prefix': (0x1458f1b50, 0x1458f1c13),
          'report-return': (0x1458f26b1, 0x1458f26f7),
          'pull-position': (0x145916f23, 0x145916f54),
          'marker-input': (0x1459073c5, 0x1459074be)}
g.RANGES.clear()
g.RANGES.update(RANGES)


def report(machine, position):
    machine.put(machine.actor, '3f', *position)
    machine.u.reg_write(r.UC_X86_REG_RCX, machine.game)
    machine.u.reg_write(r.UC_X86_REG_RDX, machine.actor)
    machine.put(machine.stack, 'Q', machine.stop)
    machine.u.reg_write(r.UC_X86_REG_RSP, machine.stack)
    return machine.run(0x1458f1b50, [0x1458f1c13, machine.stop]) == machine.stop


def native_checks(raw):
    machine = g.Machine(raw)
    machine.family = 'report-admission'
    cases = 0
    # Exact radius, adjacent f32 values, both lanes, overflow, unordered inputs,
    # and Z-only changes: the native gate compares XY only.
    profiles = [(0., 0., 999.), (3., 0., 0.), (-3., 0., 0.), (0., 3., 0.),
                (g.fb(0x403fffff), 0., 0.), (g.fb(0x40400001), 0., 0.),
                (2., 2., 0.), (2.2, 2.2, 0.), (1e30, 0., 0.),
                (math.inf, 0., 0.), (-math.inf, 0., 0.),
                (math.nan, 0., 0.), (0., math.nan, 0.)]
    for pending in [0, 1, 2, 255]:
        for count in [0, 1, 12, 255]:
            for point in profiles:
                machine.reset()
                game = machine.game
                machine.put(game+0xa10, 'I', pending)
                machine.put(game+0xa14, '3f', 0., 0., 5.)
                machine.put(game+0xa20, 'B', count)
                machine.put(game+0x4d0, '3f', 7., 8., 9.)
                before = bytes(machine.u.mem_read(game+0x4d0, 12))
                ignored = report(machine, point)
                dx, dy = g.f(-point[0]), g.f(-point[1])
                squared = g.f(g.f(dy*dy)+g.f(dx*dx)) if abs(dx)<1e19 and abs(dy)<1e19 else math.inf
                if math.isnan(dx) or math.isnan(dy): squared = math.nan
                expected = bool(pending and squared > 9. and count)
                assert ignored == expected, (pending, count, point)
                assert machine.get(game+0xa20, 'B')[0] == count-int(expected)
                assert machine.get(game+0xa10, 'I')[0] == (pending if not pending or expected else 0)
                assert bytes(machine.u.mem_read(game+0x4d0, 12)) == before
                cases += 1
    machine.family = 'pull-publication'
    positions = [(100., 0., 7.), (0., 100., -3.), (-100., -10., 0.), (0., 0., 0.)]
    for position in positions:
        machine.reset()
        machine.u.reg_write(r.UC_X86_REG_RDI, machine.game)
        machine.u.reg_write(r.UC_X86_REG_XMM6, g.bits(position[0]) | (g.bits(position[1]) << 32))
        machine.sx(r.UC_X86_REG_XMM9, position[2])
        machine.run(0x145916f23, [0x145916f54])
        assert machine.get(machine.game+0x4d0, '3f') == position
        assert machine.get(machine.game+0xa10, 'I')[0] == 1
        assert machine.get(machine.game+0xa14, '3f') == position
        assert machine.get(machine.game+0xa20, 'B')[0] == 12
    machine.family = 'stale-report-sequence'
    # Start from the actual publication; 12 stale reports are ignored, the
    # thirteenth enters the unchanged downstream terrain/report path.
    for i in range(13):
        ignored = report(machine, (100., 100., 0.))
        assert ignored == (i < 12)
        assert machine.get(machine.game+0xa20, 'B')[0] == max(11-i, 0)
        assert machine.get(machine.game+0xa10, 'I')[0] == int(i < 12)
    machine.family = 'marker-position-input'
    # Two active lairs show that the marker selector reads the published Game
    # position, rather than an incoming report or cached pre-Pull frame point.
    for x, expected in [(0., 0), (25., 0), (75., 1), (100., 1)]:
        machine.reset()
        machine.put(machine.game+0x4d0, '3f', x, 0., 0.)
        machine.put(machine.game+0x670, 'Q', machine.lairs)
        machine.put(machine.frame+0x438, 'Q', machine.game)
        for i in range(2):
            machine.put(machine.lairs+40*i, 'Q', i+1)
            machine.put(machine.lairs+40*i+0x18, '3f', float(100*i), 0., 0.)
        machine.u.reg_write(r.UC_X86_REG_RDI, machine.game)
        machine.u.reg_write(r.UC_X86_REG_R9, 2)
        machine.run(0x1459073c5, [0x1459074be])
        assert machine.u.reg_read(r.UC_X86_REG_RCX) == expected
    return {'admission_boundaries': cases, 'pull_publications': len(positions),
            'sequential_stale_reports': 13, 'marker_position_inputs': 4}, machine


def source_checks():
    base = ROOT/'crates/azeroth-survivors-re/src'
    floor = (base/'floor_recovery.rs').read_text()
    expect = floor[floor.index('pub fn expect_position'):floor.index('pub fn admit')]
    assert re.search(r'self.pending = Some\(PendingCorrection \{\s*position,\s*reports_left: 12,\s*\}\);', expect)
    assert all(token not in expect for token in ['self.below_since =', 'self.blocked_since =', 'self.stationary =', 'self.last_recovery ='])
    gate = floor[floor.index('if let Some(pending)'):floor.index('let center_height')]
    assert 'dx * dx + dy * dy > 9.0 && pending.reports_left != 0' in gate
    assert re.search(r'pending.reports_left -= 1;\s*return Admission::Ignored;', gate)
    assert 'self.pending = None;' in gate
    mechanics = (base/'gameplay/mechanics.rs').read_text()
    tick = mechanics[mechanics.index('pub fn tick('):mechanics.index('fn spawn_scheduled_world(')]
    assert ') -> Option<Position> {' in tick and 'return None;' in tick
    assert tick.count('return ') == 1 and tick.count('forced_position = Some(point);') == 2
    assert tick.count('player_override.take()') == 2
    assert re.search(r'self.publish_player_auras\(\);\s*forced_position\s*\}', tick)
    live = (base/'gameplay/mod.rs').read_text()
    body = live[live.index('let forced_position = game.tick('):live.index('let report = (game.clock / 5.0)')]
    ordered = ['let forced_position = game.tick(', 'session.accepted_position = Some(position);',
               'session.recovery.expect_position(position);', 'game.update_addon_flag(Position::from(position))',
               'game.update_world_flag(Position::from(position)']
    assert [body.index(s) for s in ordered] == sorted(body.index(s) for s in ordered)
    assert 'if let Some(point) = forced_position' in body
    assert 'RunEvent::PlayerMover' not in body and 'Teleport' not in body
    # Collection now runs inside the admitted Mechanics frame, after the
    # second forced-position handoff; native/profiles remain unchanged here.
    assert tick.rindex('player_override.take()') < tick.index('self.tick_pickup_collection(player);')
    bosses = (base/'gameplay/mechanics/bosses.rs').read_text()
    start = bosses.index('fn raid_pull(')
    pull = bosses[start:bosses.index('\n    fn ', start+1)]
    assert '*self.player_override = Some((point,facing));' in pull
    assert 'self.player_mover.teleport(' in pull
    return {'source_files': 4, 'only_forced_tick_output_seeds_pending': True,
            'publication_precedes_marker_and_pickup_consumers': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    mod = g.load()
    target, raw, span, graph, headers = mod.recover()
    mod.check_graph(graph, headers)
    counts, machine = native_checks(raw)
    source = source_checks()
    out = STAGE if args.stage else KEPT
    if args.stage: out.mkdir(parents=True, exist_ok=True)
    mod.verify_rea_operations(raw, out, target['sha256'])
    pe = mod.load('forced_position_pe', 'scripts/inventory-executable.py').PE(g.target_bytes(target))
    owners = [(pe.image_base+a, pe.image_base+b) for a,b,_ in pe.functions()]
    owner = (0x1458f1b50, 0x1458f275e)
    assert owner in owners
    assert raw(0x145df1a50, 4) == struct.pack('<f', 9.)
    # Explicit canonical owners only; never scan ambient candidate extracts.
    paths = ['raid-lifecycles/selected-native.asm', 'raid-guardian-lifecycle/selected-native.asm',
             'raid-inputs/guardian-selector.asm', 'raid-frame-continuation/selected-native.asm',
             'raid/queue.asm', 'raid-hazards/dispatcher.asm']
    canonical = {}
    for path in paths:
        for line in (ROOT/'docs/analysis/evidence/0.112.0'/path).read_text().splitlines():
            hit = re.match(r'^([0-9a-f]+): ([0-9a-f]+) ', line)
            if hit: canonical.setdefault(int(hit[1], 16), (bytes.fromhex(hit[2]), '../'+path))
    new, traces = {}, {}
    for family, rows in machine.visited.items():
        intervals = []
        for a, value in sorted(rows.items()):
            prior = canonical.get(a)
            path = prior[1] if prior and prior[0] == value else 'selected-native.asm'
            if path == 'selected-native.asm': new[a] = value
            if intervals and intervals[-1][1] == a and intervals[-1][2] == path: intervals[-1][1] += len(value)
            else: intervals.append([a, a+len(value), path])
        traces[family] = [dict(**span(a,b-a), assembly=path) for a,b,path in intervals]
    assembly = ''
    for a, value in sorted(new.items()):
        ins = list(machine.md.disasm(value, a))
        assert sum(i.size for i in ins) == len(value)
        assembly += ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
    proof = dict(target_version=target['version'], target_sha256=target['sha256'], target_executed=False,
                 cases=counts, source_checks=source, visited_instruction_ranges=traces,
                 movement_report_owner=span(owner[0],owner[1]-owner[0]), squared_radius_constant=span(0x145df1a50,4),
                 seams=[], limits=['The report prefix stops at its unchanged terrain/query continuation; ignored reports execute the actual epilogue and return.',
                 'Pull geometry, movement packet construction and client delivery retain the current lifecycle proof. Marker profiles stop after nearest-lair selection, before publication.',
                 'No Rust execution, compiler, game, terrain/client rendering, movement interaction or original/rebuilt parity comparison.'])
    for name, value in {'selected-native.asm': assembly, 'manifest.json': json.dumps(proof,indent=2)+'\n'}.items():
        if args.stage: (out/name).write_text(value)
        else: assert (out/name).read_text() == value, name
    print(json.dumps(counts,indent=2))
    print('Current forced-position checks passed; no compilation/game')


if __name__ == '__main__': main()

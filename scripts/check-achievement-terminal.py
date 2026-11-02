#!/usr/bin/env python3
"""Replay the current AS terminal producers feeding account achievements.

No compiler, game, OS clock or filesystem write is executed. The arithmetic
model and bounded scratch harness are shared with the historical terminal proof;
every instruction window, field offset and call target here belongs to0.112.0.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import random
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--stage', action='store_true')
parser.add_argument('--prepare-rea', action='store_true')
args = parser.parse_args()
sys.path.insert(0, str(ROOT/'runtime/armory-recovery/python-libs'))
from native_terminal import NativeReplay, require, verified_input

work = ROOT/'runtime/achievement-grants-0.112.0'
evidence = work/'terminal-curated' if args.stage else ROOT/'docs/analysis/evidence/0.112.0/achievement-terminal'
manifest, target, data, pe = verified_input(evidence)
require(target['sha256'] == 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a', 'Selected target changed')
require(hashlib.sha256((evidence/'selected-native.asm').read_bytes()).hexdigest() == manifest['selected_assembly_sha256'], 'Curated terminal assembly changed')
if args.prepare_rea:
    for row in manifest['ranges']:
        if row['role'] not in ['deltas', 'xp-grant']:
            continue
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        directory = work/('reproduce-terminal-'+row['role'])
        directory.mkdir(parents=True, exist_ok=True)
        offset = pe.rva_offset(start-pe.image_base)
        (directory/'body.bin').write_bytes(data[offset:offset+end-start])
        (directory/'seeds.tsv').write_text(f'{start:#x}\tfunction\n{start:#x}\tcode\n')
        plan = dict(target=str((directory/'body.bin').relative_to(ROOT)),
                    output=str((directory/'rea').relative_to(ROOT)), init_timeout=60, timeout=240,
                    environment=dict(REA_GHIDRA_SEED_FILE=str((directory/'seeds.tsv').relative_to(ROOT)),
                                     REA_GHIDRA_DISABLED_ANALYZERS='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'),
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
        (directory/'plan.json').write_text(json.dumps(plan, indent=2)+'\n')
    print('Prepared two bounded REA/Ghidra plans; canonical summary remains in addon-bridge evidence.')
    sys.exit(0)
model = load_script('xp_model', ROOT/'scripts/recover-terminal-contracts.py')
replay = NativeReplay(data, pe)
u, R, ctx = replay.machine, replay.registers, replay.context
mem, bp, app, done = replay.mem, replay.bp, replay.app, replay.done
put, get, reset, run = replay.put, replay.get, replay.reset, replay.run
results = {}


def record(name, rows):
    results[name] = dict(cases=len(rows), sha256=hashlib.sha256(
        json.dumps(rows, sort_keys=True, separators=(',', ':')).encode()).hexdigest())


def registers(**values):
    for name, value in values.items():
        u.reg_write(getattr(R, 'UC_X86_REG_'+name), value)


def budget(xp):
    count = 0
    while count < 51 and xp >= 80+15*count:
        xp -= 80+15*count
        count += 1
    return count


def xp_seam(address):
    if ctx['mode'] == 'beaten-zone' and address == 0x145c0a3ed:
        destination, source, length = [u.reg_read(register) for register in
                                       [R.UC_X86_REG_RCX, R.UC_X86_REG_RDX, R.UC_X86_REG_R8]]
        u.mem_write(destination, bytes(u.mem_read(source, length)))
        replay.return_seam()
        return True
    if ctx['mode'] == 'backend-route' and address == 0x1458d9600:
        require(u.reg_read(R.UC_X86_REG_RCX) == app+0xb38, 'Save receives the backend object')
        ctx['save_calls'] += 1
        replay.return_seam()
        return True
    if ctx['mode'] != 'xp':
        return False
    if address == 0x145898dc0:
        registers(RAX=ctx['zone'])
    elif address == 0x145c0a41d:
        bits = u.reg_read(R.UC_X86_REG_XMM0) & 0xffffffff
        replay.scalar(R.UC_X86_REG_XMM0, model.rnd(struct.unpack('<f', bits.to_bytes(4, 'little'))[0]))
    else:
        return False
    replay.return_seam()
    return True


replay.seam = xp_seam
cases = [dict(kills=k, bosses=b, seconds=t, won=w, zone=z, mods=mods, veteran=v)
         for k, b, t, w, z, mods, v in [
             (100, 1, 60., False, 0, [100]*4, 0.),
             (5, 0, 2.5, False, 0, [100]*4, 0.),
             (100, 1, 60., True, 0, [100, 300, 300, 150], .4),
             (0, 0, 0., False, 0, [100]*4, 0.),
             (0xffffffff, 0xffffffff, 36000., True, 11, [500, 500, 300, 150], 1.),
             (100, 1, 60., False, 0, [100, 100, 100, 0], 0.),
             (1, 0, -60., False, 0, [100]*4, 0.),
             (0xffffffff, 5, 1800., False, 11, [0, 100, 100, 100], .2),
             (0, 0, 375., False, 0, [100, 125, 110, 125], 0.),
             (0, 0, 125., False, 0, [100, 125, 120, 110], 0.),
         ]]
rng = random.Random(112019)
for _ in range(1536):
    cases.append(dict(kills=rng.choice([rng.randrange(250000), rng.randrange(1 << 32)]),
                      bosses=rng.randrange(100), seconds=model.f32(rng.uniform(0, 36000)),
                      won=bool(rng.randrange(2)), zone=rng.randrange(12),
                      mods=[rng.randrange(100, maximum+1, step) for maximum, step in
                            zip([500, 500, 300, 150], [25, 25, 10, 5])],
                      veteran=model.f32(rng.randrange(6)*.2)))
xp = []
for case in cases:
    reset('xp', [(0x1458ba062, 0x1458ba350)], {0x1458ba350})
    ctx['zone'] = case['zone']
    registers(RCX=app, RSI=int(case['won']))
    replay.scalar(R.UC_X86_REG_XMM8, case['seconds'])
    put(app+0x79c, '<I', case['kills'])
    put(app+0x7a8, '<I', case['bosses'])
    put(app+0x2d8, '<4H', *case['mods'])
    put(app+0x1150, '<f', model.f32(case['veteran']))
    run(0x1458ba062)
    parts = list(get(bp-0x28, '<7q'))
    require(parts == model.model(case), str((case, parts, model.model(case))))
    xp.append(dict(inputs=case, parts=parts, total=model.total(parts)))
record('xp_parts', xp)

arrays = [([0]*7, [0]*7), ([-1, 0, 0, 0, 0, 0, 0], [0]*7),
          ([1, -2, 3, -4, 5, -6, 7], [0]*7), ([0]*7, [1]*7),
          ([(1 << 63)-1]*7, [-1]*7), ([1 << 32, 1, 0, 0, 0, 0, 0], [0]*7)]
arrays.extend((row['parts'], xp[max(0, i-1)]['parts']) for i, row in enumerate(xp[:96]))
pairs = []
for current, previous in arrays:
    reset('parts', [(0x1459da4d6, 0x1459da635)], {0x1459da635})
    buf, iterator, cur, prev, out = [mem+x for x in [0x10000, 0x11000, 0x12000, 0x13000, 0x14000]]
    put(cur, '<7q', *current)
    put(prev, '<7q', *previous)
    put(iterator, '<4Q', cur, prev, 0, 7)
    registers(RAX=buf, RCX=out, RDX=iterator, RSI=0, R14=7, R13=7)
    run(0x1459da4d6)
    delta = [model.signed(a-b) for a, b in zip(current, previous)]
    require([get(buf+i*16, '<Qq') for i in range(7)] == list(enumerate(delta)), 'Delta pairs')
    require(get(out, '<3Q') == (7, buf, 7), 'Delta vector')
    reset('sum', [(0x1458ba3f5, 0x1458ba4af)], {0x1458ba4af})
    put(buf, '<14q', *(v for i, d in enumerate(delta) for v in [i, d]))
    put(bp-0x28, '<7q', *current)
    registers(R12=7, R11=buf, RDI=app+0x10d8)
    run(0x1458ba3f5)
    amount = get(bp+0x13c, '<I')[0]
    require(amount == model.total(delta), 'Wrapping signed sum, nonnegative clamp, low32')
    require(get(app+0x10d8, '<7q') == tuple(current), 'Checkpoint advances even for zero XP')
    pairs.append(dict(current=current, previous=previous, delta=delta, awarded=amount))
record('xp_delta_and_checkpoint', pairs)

counts = []
count_inputs = [([10, 20, 2, 1, 4], [0]*5, [0]*5),
                ([0]*5, [0xffffffff]*5, [17]*5),
                ([0xffffffff]*5, [0]*5, [(1 << 64)-2]*5)]
count_inputs.extend(([rng.randrange(1 << 32) for _ in range(5)],
                     [rng.randrange(1 << 32) for _ in range(5)],
                     [rng.randrange(1 << 64) for _ in range(5)]) for _ in range(256))
for current, previous, saved in count_inputs:
    reset('counts', [(0x1458b0b02, 0x1458b0bdb)], {0x1458b0bdb})
    registers(RSI=app, RDI=current[0], R14=current[1], R15=current[2], R12=current[3], R13=current[4])
    put(app+0x1154, '<5I', *previous)
    offsets = [0xcc8, 0xcd0, 0xcd8, 0xce0, 0xcf8]
    for off, value in zip(offsets, saved):
        put(app+off, '<Q', value)
    run(0x1458b0b02)
    delta = [max(a-b, 0) for a, b in zip(current, previous)]
    after = [get(app+off, '<Q')[0] for off in offsets]
    require(after == [min((1 << 64)-1, a+b) for a, b in zip(saved, delta)], 'Saturating terminal counts')
    require(get(app+0x1154, '<5I') == tuple(current), 'Count checkpoint')
    counts.append(dict(current=current, previous=previous, saved=saved, delta=delta, after=after))
record('terminal_counts', counts)

gates = []
for wrapper in range(3):
    for phase in range(7):
        for last in range(7):
            reset('edge', [(0x1458b0828, 0x1458b0857), (0x1458b0a90, 0x1458b0a96)],
                  {0x1458b0d97, 0x1458b0857, 0x1458b0a96})
            registers(R12=app+0x10)
            put(bp+0x568, '<Q', app)
            put(app+0x10, '<I', wrapper)
            put(app+0xaef, '<B', phase)
            put(app+0x1196, '<B', last)
            pc = run(0x1458b0828)
            admitted = wrapper != 2 and phase in [4, 5] and phase != last
            require(pc == (0x1458b0a96 if admitted else 0x1458b0d97 if wrapper == 2 else 0x1458b0857), 'Terminal edge')
            require(get(app+0x1196, '<B')[0] == (phase if admitted else last), 'Terminal marker')
            gates.append([wrapper, phase, last, admitted])
record('terminal_phase_edge', gates)
gates = []
for wrapper in range(3):
    for guid in [42, 0xfffffe, 0xffffff]:
        for showcase in [0, 1]:
            reset('count-gate', [(0x1458b0a9e, 0x1458b0ac6)], {0x1458b0d97, 0x1458b1e2b, 0x1458b0ac6})
            registers(RSI=app)
            put(app+0x10, '<I', wrapper)
            put(app+0x10d0, '<Q', guid)
            put(app+0xae8, '<B', showcase)
            pc = run(0x1458b0a9e)
            expected = 0x1458b0d97 if wrapper == 2 else 0x1458b1e2b if guid == 0xffffff or showcase else 0x1458b0ac6
            require(pc == expected, 'Post-summary account gate')
            gates.append([wrapper, guid, showcase, pc == 0x1458b0ac6])
record('counter_gate', gates)
gates = []
for wrapper in range(3):
    for phase in range(7):
        reset('summary-gate', [(0x1458ba014, 0x1458ba02b)], {0x1458ba02b, 0x1458bb90b})
        registers(RCX=app)
        put(app+0x10, '<I', wrapper)
        put(app+0xaef, '<B', phase)
        pc = run(0x1458ba014)
        require((pc == 0x1458ba02b) == (wrapper != 2 and phase != 0), 'Started-phase summary')
        gates.append([wrapper, phase, pc == 0x1458ba02b])
record('summary_gate', gates)
gates = []
for guid in [42, 0xfffffe, 0xffffff]:
    for showcase in [0, 1]:
        for amount in [0, 1, 0xffffffff]:
            reset('xp-gate', [(0x1458ba4b2, 0x1458ba4cc)], {0x1458ba4cc, 0x1458bb05f})
            registers(RBX=guid, R8=amount)
            put(app+0xae8, '<B', showcase)
            pc = run(0x1458ba4b2)
            require((pc == 0x1458ba4cc) == (guid != 0xffffff and amount != 0), 'XP gate independent of showcase')
            gates.append([guid, showcase, amount, pc == 0x1458ba4cc])
record('xp_gate', gates)

# Run the complete current XP mutation owner, including missing-class append,
# saturation and old/new available-points returns. Vector capacity is explicit.
xp_grants = []
for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
    for present in [False, True]:
        for old in [0, 79, 80, 23204, 23205, 0xffffffff]:
            for amount in [0, 1, 80, 0xffffffff]:
                reset('xp-grant', [(0x1458d2fe0, 0x1458d3172)], {done})
                rows = mem+0x10000
                u.mem_write(app, bytes([0x5a])*0x1d0)
                put(app+0x60, '<3Q', 4, rows, 3 if present else 1)
                u.mem_write(rows, bytes([0xa5])*128)
                put(rows, '<IB', 123, 6)
                if present:
                    put(rows+32, '<IB', old, class_id)
                    put(rows+64, '<IB', 777, class_id)
                before = bytes(u.mem_read(rows, 96))
                account_before = bytes(u.mem_read(app, 0x1d0))
                registers(RCX=app, RDX=class_id, R8=amount)
                run(0x1458d2fe0)
                value = min(0xffffffff, (old if present else 0)+amount)
                require(get(rows+32, '<IB') == (value, class_id), 'Current class XP mutation')
                require(bytes(u.mem_read(rows, 32)) == before[:32], 'Unrelated class retained')
                require(get(app+0x70, '<Q')[0] == (3 if present else 2), 'Missing class appended once')
                account_after = bytearray(account_before)
                struct.pack_into('<Q', account_after, 0x70, 3 if present else 2)
                require(bytes(u.mem_read(app, 0x1d0)) == bytes(account_after), 'All non-XP account/spec fields retained')
                require(u.reg_read(R.UC_X86_REG_EAX) == budget(old if present else 0), 'Previous points')
                require(u.reg_read(R.UC_X86_REG_EDX) == budget(value), 'Updated points')
                if present:
                    require(bytes(u.mem_read(rows+37, 27)) == before[37:64], 'Existing allocation retained')
                    require(bytes(u.mem_read(rows+64, 32)) == before[64:], 'Later duplicate class row retained')
                else:
                    require(get(rows+40, '<3Q') == (0, 8, 0), 'New empty allocation')
                xp_grants.append([class_id, present, old, amount, value])
record('class_xp_mutation', xp_grants)

routes = []
for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
    for old in [0, 79, 23204, 0xffffffff]:
        reset('backend-route', [(0x1458ba4cc, 0x1458ba54a), (0x1458d2fe0, 0x1458d3172)], {0x1458ba54a})
        rows, frontend = mem+0x10000, mem+0x20000
        put(app+0xb98, '<3Q', 4, rows, 1)
        put(rows, '<IB', old, class_id)
        u.mem_write(frontend, bytes([0xa5])*512)
        put(bp+0x168, '<Q', class_id)
        registers(R15=app, R8=80)
        ctx['save_calls'] = 0
        run(0x1458ba4cc)
        require(ctx['save_calls'] == 1, 'XP Save precedes summary result handling')
        require(get(rows, '<I')[0] == min(0xffffffff, old+80), 'Backend XP changed')
        require(bytes(u.mem_read(frontend, 512)) == bytes([0xa5])*512, 'Disjoint frontend canary retained')
        routes.append([class_id, old, min(0xffffffff, old+80)])
record('backend_xp_save_route', routes)

bests = []
for count in range(7):
    for matching in [None, *range(count)]:
        for old_level, level in [(0, 1), (100, 50), (0xffffffff, 0xffffffff)]:
            for old_seconds, seconds in [(0, 60), (1200, 900), (0xffffffff, 3600)]:
                for saved in [0, 1]:
                    reset('bests', [(0x1458bb05f, 0x1458bb0e8)], {0x1458bb0e8})
                    rows = mem+0x10000
                    registers(R15=app, RBX=42, R13=seconds)
                    put(bp+0xc0, '<I', level)
                    put(app+0xb40, '<2Q', rows, count)
                    put(app+0xf10, '<Q', (1 << 64)-1)
                    put(app+0x1192, '<B', saved)
                    initial = bytearray([0xa5]*(count*0x38))
                    for i in range(count):
                        struct.pack_into('<QII', initial, i*0x38+0x18, 42 if matching == i else 100+i, old_level, old_seconds)
                    u.mem_write(rows, bytes(initial))
                    run(0x1458bb05f)
                    expected = initial[:]
                    if matching is not None:
                        struct.pack_into('<II', expected, matching*0x38+0x20, max(old_level, level), max(old_seconds, seconds))
                    require(bytes(u.mem_read(rows, len(initial))) == bytes(expected), 'Independent permanent maxima')
                    require(get(app+0x1192, '<B')[0] == saved, 'Bests precede first-result flag')
                    bests.append([count, matching, old_level, level, old_seconds, seconds, saved])
record('permanent_character_bests', bests)
fallbacks = []
for matching in [False, True]:
    for optional in [False, True]:
        for guid in [42, 0xfffffe, 0xffffff]:
            for previous, current in [(1, 20), (20, 1), (0xffffffff, 0xffffffff)]:
                reset('optional-bests', [(0x1458bb05f, 0x1458bb0e8)], {0x1458bb0e8})
                rows = mem+0x10000
                registers(R15=app, RBX=guid, R13=1000)
                put(bp+0xc0, '<I', current)
                put(app+0xb40, '<2Q', rows, int(matching))
                put(rows+0x18, '<QII', guid, previous, 2)
                put(app+0xf10, '<Q', 6 if optional else (1 << 64)-1)
                put(app+0xf28, '<Q4I', 0xffffff, previous, 3, 4, 5)
                run(0x1458bb05f)
                expected = max(previous, current) if optional and guid == 0xffffff and not matching else previous
                require(get(app+0xf30, '<4I') == (expected, 3, 4, 5), 'Optional row changes only matching level')
                require(get(rows+0x20, '<2I') == ((max(previous, current), 1000) if matching else (previous, 2)), 'Permanent row takes precedence')
                fallbacks.append([matching, optional, guid, previous, current])
record('optional_character_bests', fallbacks)
first = []
for saved in [0, 1]:
    reset('first-flag', [(0x1458bb0e8, 0x1458bb119)], {0x1458bb0f2, 0x1458bb119})
    registers(R15=app)
    put(app+0x1192, '<B', saved)
    pc = run(0x1458bb0e8)
    require(pc == (0x1458bb0f2 if saved else 0x1458bb119), 'First-result admission')
    require(get(app+0x1192, '<B')[0] == 1, 'First-result acknowledged')
    first.append(['flag', saved])
for eligible in [0, 1]:
    for won in [0, 1]:
        for old in [0, (1 << 32)-1, (1 << 64)-1]:
            reset('result-counts', [(0x1458bb859, 0x1458bb8d6)], {0x1458bb8d6})
            rows = mem+0x10000
            registers(R15=app, RBX=42, R14=eligible)
            put(app+0xb40, '<2Q', rows, 1)
            put(rows+0x18, '<Q', 42)
            put(rows+0x28, '<2I', old & 0xffffffff, old & 0xffffffff)
            put(app+0xce8, '<2Q', old, old)
            put(bp+0x38, '<Q', won)
            run(0x1458bb859)
            require(get(rows+0x28, '<2I') == ((old+1) & 0xffffffff, (old+won) & 0xffffffff), 'Wrapping character results')
            require(get(app+0xce8, '<2Q') == ((min((1 << 64)-1, old+1), min((1 << 64)-1, old+won)) if eligible else (old, old)), 'Saturating account results')
            first.append(['counts', eligible, won, old])
record('first_result_and_counts', first)

beaten = []
for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
    for zone in range(12):
        for initial in [[], [(class_id, zone)], [(1, 0), (5, 5), (11, 11)],
                        [(c, z) for c in [1, 5, 11] for z in range(12)]]:
            reset('beaten-zone', [(0x1458d3580, 0x1458d3687)], {done})
            rows = mem+0x10000
            put(app+0xd8, '<3Q', 128, rows, len(initial))
            for i, (c, z) in enumerate(initial):
                put(rows+16*i, '<B7xQ', c, z)
            registers(RCX=app, RDX=class_id, R8=zone)
            run(0x1458d3580)
            expected = sorted(set(initial) | {(class_id, zone)})
            actual = [get(rows+16*i, '<B7xQ') for i in range(get(app+0xe8, '<Q')[0])]
            require(actual == expected, 'Current beaten pair ordered insertion and deduplication')
            require(u.reg_read(R.UC_X86_REG_AL) == int((class_id, zone) not in initial), 'Beaten-pair changed return')
            beaten.append([class_id, zone, initial, actual])
record('beaten_zone_insertion', beaten)

# The current native summary passes Server+b38 to the XP helper and Save.
# Tie the source routing and transaction order to those reviewed call blocks.
source = (ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
owner = source.split('fn persist_run_at(', 1)[1].split('\nfn hud(', 1)[0]
compact = ''.join(owner.split())
require('menu.save' not in owner, 'Terminal delivery must use backend Save')
for token in ['letaccount_eligible=phase_active&&saves_equipment;',
              'letcount_eligible=account_eligible&&!showcase;',
              'letterminal_edge=!force_summary&&phase_active&&game.take_terminal_phase_edge();',
              'ifcount_eligible&&terminal_edge{']:
    require(token in compact, 'Current terminal source gate: '+token)
ordered = ['grant_terminal_xp(result.class,delivery.talent_xp)', 'menu.record_character_bests',
           'open_next_zone(result.class,result.zone_key)', 'menu.backend_save.record_character_result',
           'menu.backend_save.apply_run_totals', 'game.mark_terminal_summary_saved(delivery,false)',
           'menu.commit_account();', 'menu.backend_save.apply_run_counts(delta)',
           'menu.backend_save.record_beaten_zone', 'game.mark_terminal_summary_saved(delivery,true)',
           'menu.commit_account();']
cursor = compact.index('letdelivery=game.summary_delivery();')
for token in ordered:
    at = compact.find(token, cursor)
    require(at >= 0, 'Terminal source order: '+token)
    cursor = at+len(token)
state = (ROOT/'crates/azeroth-survivors-re/src/menu_state.rs').read_text()
commit = state.split('pub fn commit_account(', 1)[1].split('#[cfg(test)]', 1)[0]
require('self.pending_saves.push(self.backend_save.clone());' in commit, 'Ordered backend snapshots')
method = state.split('pub(crate) fn record_character_bests(', 1)[1].split('    /// Ordinary stock login', 1)[0]
method = ''.join(method.split())
require('ifself.backend_save.record_character_bests(guid,level,seconds){return;}' in method and
        'row.best_level=row.best_level.max(level);' in method, 'Permanent-first optional best')
require(not any(token in method for token in ['row.best_seconds=', 'row.runs=', 'row.wins=']), 'Optional row receives level only')
arithmetic = ''.join((ROOT/'crates/azeroth-survivors-re/src/run_progression.rs').read_text().split())
for token in [
        'letnormalized=(killsasf32/density)asu32;',
        'letraw_time=(seconds/60.0)*12.0;',
        'letzone=1.0+(zoneasf32*1.6)/11.0;',
        'letbase=(zone*((raw_bosses+(raw_time+raw_kills))+raw_victory)).round()asu32;',
        'letzone=i64::from(base).wrapping_sub(first_four);',
        'letoption=((f32::from(mods[0])-100.0)/100.0)*0.05;',
        'letoption=((f32::from(mods[1])-100.0)/100.0)*0.4+option;',
        'letoption=((f32::from(mods[2])-100.0)/100.0)*0.6+option;',
        'letoption=((f32::from(mods[3])-100.0)/100.0)*2.0+option;',
        'letoption=(option+1.0).min(2.0);',
        'letordinary=i64::from(base).wrapping_add(options);',
        'letveteran=(ordinaryasf32*veteran_bonus).round()asi64;',
        'parts.into_iter().fold(0_i64,i64::wrapping_add).max(0)asu32']:
    require(token in arithmetic, 'Current terminal arithmetic source: '+token)
projection = ''.join((ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs').read_text().split())
for token in ['result.counts[index].saturating_sub(self.effect_state.terminal_counts[index])',
              'xp_parts[index].wrapping_sub(self.effect_state.terminal_xp_parts[index])',
              'self.effect_state.terminal_xp_parts=delivery.xp_parts;',
              'self.effect_state.result_saved=true;']:
    require(token in projection, 'Current terminal projection source: '+token)
save = ''.join((ROOT/'crates/azeroth-survivors-re/src/save/progress.rs').read_text().split())
for token in ['self.add_terminal_talent_xp(class,amount)',
              'runs.wrapping_add(u32::from(first_result))',
              'wins.wrapping_add(u32::from(first_result&&won))',
              '*value=value.saturating_add(amount);']:
    require(token in save, 'Current terminal save source: '+token)
talents = (ROOT/'crates/azeroth-survivors-re/src/save/talents.rs').read_text()
xp_owner = talents.split('pub(super) fn add_terminal_talent_xp(', 1)[1].split('pub fn talent_xp(', 1)[0]
require('xp.saturating_add(amount)' in xp_owner and 'talent_fields(line)' in xp_owner, 'XP-only row mutation')
require('normalized(' not in xp_owner and 'store_specs(' not in xp_owner and 'set_talent_allocation(' not in xp_owner, 'XP owner must not normalize or mirror specs')
canonical = json.loads((ROOT/'docs/analysis/evidence/0.112.0/addon-bridge/manifest.json').read_text())
summary = next(row for row in canonical['owners'] if row['role'] == 'run-save')
require(summary['va'] == '0x1458b9fb0' and summary['sha256'] == manifest['ranges'][0]['sha256'], 'Canonical current summary identity')
tick = next(row for row in canonical['owners'] if row['role'] == 'poll')
start, end = int(tick['va'], 16), int(tick['end'], 16)
offset = pe.rva_offset(start-pe.image_base)
body = data[offset:offset+end-start]
require(hashlib.sha256(body).hexdigest() == tick['sha256'], 'Canonical current tick identity')
sys.path.insert(0, str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_AC_WRITE, CS_OP_MEM
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
decoder.detail = True
instructions = list(decoder.disasm(body, start))
require(sum(instruction.size for instruction in instructions) == len(body), 'Complete bounded tick decode')
marker_writes = [hex(instruction.address) for instruction in instructions if any(
    operand.type == CS_OP_MEM and operand.mem.disp == 0x1196 and operand.access & CS_AC_WRITE
    for operand in instruction.operands)]
require(marker_writes == ['0x1458b0a90'], 'Running phases retain the terminal marker')

# Reuse the current typed Save parser/serializer owners to demonstrate the
# concrete stale active-slot case through the actual native write projection.
talent_manifest = json.loads((ROOT/'docs/analysis/evidence/0.112.0/talent-allocations/manifest.json').read_text())
require(talent_manifest['target_sha256'] == target['sha256'], 'Current typed Save identity')
for row in talent_manifest['functions'] + talent_manifest['replayed_shared_owners']:
    offset = pe.rva_offset(int(row['address'], 16)-pe.image_base)
    require(hashlib.sha256(data[offset:offset+row['byte_count']]).hexdigest() == row['sha256'], row['name'])
from native_talent_fixture import Machine
typed = Machine()
typed_cases = []
for old, class_id, amount in [(80, 1, 80), (0xfffffffe, 1, 80), (80, 9, 80)]:
    plain = (f'talent|1|{old}|imp_heroic:1\ntalent|1|80|deflection:1\n'
             'spec|1|2|deflection:1|imp_heroic:1|deflection:1\nstat|wins=7\n')
    account = typed.parse(plain)
    before = typed.serialize(account)
    typed.call(0x1458d2fe0, account, class_id, amount)
    after = typed.serialize(account)
    previous = before.splitlines()
    expected = previous[:]
    if class_id == 1:
        index = next(i for i, line in enumerate(expected) if line.startswith('talent|1|'))
        expected[index] = f'talent|1|{min(0xffffffff, old+amount)}|imp_heroic:1'
    else:
        index = next(i for i, line in enumerate(expected) if line.startswith('spec|'))
        expected.insert(index, f'talent|9|{amount}|')
    require(after.splitlines() == expected, 'Native typed XP save preserves all allocation/spec payloads')
    typed_cases.append(dict(input=plain, class_id=class_id, amount=amount, before=before, after=after))

result = dict(target=manifest['target'], contracts=results, instructions=replay.instructions,
              terminal_marker_writes=marker_writes,
              typed_xp_save_cases=typed_cases,
              selected_xp=xp[:10], delta_boundaries=pairs[:6], limits=manifest['limitations'])
candidate = work/'terminal-native-vectors.json'
candidate.write_text(json.dumps(result, indent=2)+'\n')
if not args.stage:
    require(json.loads((evidence/'native-vectors.json').read_text()) == result, 'Current terminal replay changed')
print(json.dumps(dict(contracts=results, instructions=replay.instructions)))

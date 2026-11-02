#!/usr/bin/env python3
"""Replay selected-target talent event parsing in scratch memory; no compiler/game."""
from portable_paths import portable_json
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

TARGET_SHA256 = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
WORK = ROOT / 'runtime/gap98-context-0.115.0'
RANGES = {
    'parser': (0x140160020, 0x14016070f, '22f67bc3e433e222404ffd449c42c88666c8d2d9d799a88e10dd5f7747cb4812'),
    'positive-parts': (0x1400e0890, 0x1400e0a42, '60683d8aef838ceedafa0979836e1a8df6fcb5e54e3cd6f32d32ffecdd84f1ed'),
    'part-iterator': (0x140075900, 0x140075aea, '4746bb529a0f73ad5bb28b5e54df50c83eb4c33ce088620c9470a32d46b6b28e'),
    'talent-points': (0x14582b910, 0x14582baa2, '4d87927c76e1ee809f097e6aa40547ad8a03fcd3e1f4e38d71d5519660da3af8'),
    'talentxp-request-producer': (0x145889ce0, 0x14588b0a4, 'cea550dd5601d886d9d84d235624e51a4e2f082f3446502e3afb366b74fad6d5'),
}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--python-libs', default='runtime/armory-recovery/python-libs')
    ap.add_argument('--output', default='runtime/gap98-context-0.115.0/parser-check.json')
    args = ap.parse_args()
    libs, output = (ROOT / args.python_libs).resolve(), (ROOT / args.output).resolve()
    if not libs.is_relative_to(ROOT) or not output.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Dependencies/output must remain project-local; output belongs in runtime/')
    sys.path.insert(0, str(libs))
    from native_terminal import NativeReplay, require

    target = latest_target(verify=True)
    require(target['sha256'] == TARGET_SHA256, 'Wrong selected target')
    data = target_bytes(target)
    pe = load_script('talent_context_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    range_records = []
    queries = []
    for role, (start, end, digest) in RANGES.items():
        at = pe.rva_offset(start - pe.image_base)
        require(hashlib.sha256(data[at:at + end - start]).hexdigest() == digest, role)
        range_records.append(dict(role=role, start=hex(start), end_exclusive=hex(end), sha256=digest))
        # Original durable query results are verified whenever present. Portable
        # byte replay remains possible after ignored Ghidra output is regenerated.
        directory = WORK / (role + ('-v2-rea' if role == 'part-iterator' else '-rea'))
        if (directory / 'journal.json').exists():
            journal = json.loads((directory / 'journal.json').read_text())
            require(journal['status'] == 'completed', role + ' query unfinished')
            for op in journal['operations'].values():
                require(op['status'] == 'completed', role + ' operation unfinished')
                saved = ROOT / op['result']['path']
                require(hashlib.sha256(saved.read_bytes()).hexdigest() == op['result']['sha256'], role + ' result changed')
                evidence = json.loads(saved.read_text())['structuredContent']
                require(evidence['subject']['digest']['sha256'] == digest, role + ' query target changed')
                queries.append(dict(role=role, evidence_id=evidence['evidence_id'], result=op['result']))

    producer_path = ROOT / 'runtime/gap98-producer-0.115.0/producer-evidence-v3.json'
    if producer_path.exists():
        producer = json.loads(producer_path.read_text())
        require(producer['target']['sha256'] == target['sha256'], 'Producer evidence selected another target')
        for query in producer['queries']:
            if query['arguments'].get('procedure') not in ('0x14582b910', '0x145889ce0'):
                continue
            saved = ROOT / query['result']['path']
            require(hashlib.sha256(saved.read_bytes()).hexdigest() == query['result']['sha256'], 'Producer query result changed')
            journal = ROOT / query['journal']['path']
            require(hashlib.sha256(journal.read_bytes()).hexdigest() == query['journal']['sha256'], 'Producer journal changed')
            queries.append(query)
        for row in producer['keys'] + producer['part_names']:
            at = pe.rva_offset(int(row['start'], 16) - pe.image_base)
            raw = data[at:at + row['byte_count']]
            require(hashlib.sha256(raw).hexdigest() == row['sha256'] and raw.decode() == row['text'], 'Producer field/part-name bytes')

    n = NativeReplay(data, pe)
    u, r, mem = n.machine, n.registers, n.mem
    lookups = {}
    rows = []
    names = []
    lookup_keys = []
    emitted_fields = []

    def allocate(size):
        address = n.context.get('allocation', mem + 0x21000)
        n.context['allocation'] = address + ((size + 15) & ~15)
        require(n.context['allocation'] < mem + 0x30000, 'Scratch allocator exhausted')
        return address

    def value_at(pointer, value):
        u.mem_write(pointer, bytes(32))
        if value is None:
            return
        if isinstance(value, str):
            encoded = value.encode()
            p = mem + 0x20000
            u.mem_write(p, encoded)
            n.put(pointer, '<QQQQ', 3, len(encoded), p, len(encoded))
        elif isinstance(value, tuple):
            kind, number = value
            n.put(pointer, '<QQ', 2, kind)
            n.put(pointer + 0x10, '<d' if kind == 2 else '<q' if kind == 1 else '<Q', number)
        else:
            n.put(pointer, '<Q', 1)

    def seam(address):
        if address in (0x14584f0c0, 0x14584ec40, 0x145858350):
            key = bytes(u.mem_read(u.reg_read(r.UC_X86_REG_R8), u.reg_read(r.UC_X86_REG_R9))).decode()
            stack_arg = u.reg_read(r.UC_X86_REG_RSP) + 0x28
            if address == 0x145858350:
                pointer, length = n.get(stack_arg, '<QQ')
                value = bytes(u.mem_read(pointer, length)).decode()
            else:
                value = n.get(stack_arg, '<I' if address == 0x14584f0c0 else '<d')[0]
            emitted_fields.append((key, value))
            n.return_seam()
            return True
        if address == 0x1458dff90:
            # Exercise the producer's exact English fallback when a localizer
            # returns no translated pointer, rather than inventing translations.
            u.reg_write(r.UC_X86_REG_RAX, 0)
            u.reg_write(r.UC_X86_REG_RDX, 0)
            n.return_seam()
            return True
        if address == 0x142a769a0:
            key = bytes(u.mem_read(u.reg_read(r.UC_X86_REG_RCX), u.reg_read(r.UC_X86_REG_RDX))).decode()
            lookup_keys.append(key)
            value = lookups.get(key)
            if n.context['mode'] in ('parts', 'collector'):
                index = (u.reg_read(r.UC_X86_REG_R8) - (mem + 0x18000)) // 32
                value = names[index] if key == 'name' else rows[index]
            pointer = mem + 0x1e000
            value_at(pointer, value)
            u.reg_write(r.UC_X86_REG_RAX, pointer)
            n.return_seam()
            return True
        if address in (0x140002200, 0x1400021d0):
            n.return_seam()
            return True
        if address == 0x1400021c0:
            u.reg_write(r.UC_X86_REG_RAX, allocate(u.reg_read(r.UC_X86_REG_RCX)))
            n.return_seam()
            return True
        if address == 0x145d145fb:
            destination, source, count = [u.reg_read(x) for x in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8)]
            require(mem <= destination <= destination + count < mem + 0x30000, 'Copy outside scratch')
            u.mem_write(destination, bytes(u.mem_read(source, count)))
            u.reg_write(r.UC_X86_REG_RAX, destination)
            n.return_seam()
            return True
        if address in (0x145d14a10, 0x145d150f0):
            vector = u.reg_read(r.UC_X86_REG_RCX)
            capacity, old, length = n.get(vector, '<QQQ')
            capacity = max(4, capacity * 2, length + 1)
            fresh = allocate(capacity * 32)
            u.mem_write(fresh, bytes(u.mem_read(old, length * 32)))
            n.put(vector, '<QQQ', capacity, fresh, length)
            n.return_seam()
            return True
        return False

    def clamped(value):
        if value is None or not isinstance(value, tuple):
            return None
        number = float(value[1])
        if math.isnan(number):
            return 0
        return int(min(0xffffffff, max(0., number)))

    n.seam = seam

    def budget(xp):
        points = 0
        while points < 51 and xp >= 80 + 15 * points:
            xp -= 80 + 15 * points
            points += 1
        return (51, 0, 0) if points == 51 else (points, xp, 80 + 15 * points)

    grant_cases, missing_zero_cases = 0, 0
    for class_id in (1, 8):
        other = 2 if class_id == 1 else 1
        for before in (0, 79, 80, 175, 23000, 0xfffffff0, 0xffffffff):
            for gain in (0, 1, 32, 80, 100000, 0xffffffff):
                for layout in ('empty', 'missing', 'first', 'middle', 'duplicate'):
                    n.reset('grant', [(0x14582b910, 0x14582baa2)], {n.done})
                    owner, pointer = mem + 0x1000, mem + 0x18000
                    initial = {'empty': [], 'missing': [(17, other)], 'first': [(before, class_id), (17, other)],
                               'middle': [(17, other), (before, class_id)],
                               'duplicate': [(before, class_id), (17, other), (123, class_id)]}[layout]
                    # Capacity==length forces the real missing-row append path
                    # through its declared scratch Vec reserve seam.
                    n.put(owner + 0x60, '<QQQ', len(initial), pointer, len(initial))
                    for index, (xp, row_class) in enumerate(initial):
                        n.put(pointer + index * 32, '<IB3xQQQ', xp, row_class, 100 + index, mem + 0x1b000 + index * 32, index)
                    initial_bytes = bytes(u.mem_read(pointer, len(initial) * 32))
                    u.reg_write(r.UC_X86_REG_RCX, owner)
                    u.reg_write(r.UC_X86_REG_RDX, class_id)
                    u.reg_write(r.UC_X86_REG_R8, gain)
                    n.run(0x14582b910)
                    _, fresh, length = n.get(owner + 0x60, '<QQQ')
                    found = next((index for index, row in enumerate(initial) if row[1] == class_id), None)
                    old = before if found is not None else 0
                    total = min(0xffffffff, old + gain)
                    expected = list(initial)
                    if found is None:
                        found = len(expected)
                        expected.append((gain, class_id))
                        if gain == 0:
                            missing_zero_cases += 1
                    else:
                        expected[found] = (total, class_id)
                    actual = [n.get(fresh + index * 32, '<IB') for index in range(length)]
                    require(actual == expected, 'Current saved-class XP first-match saturation/append')
                    require((u.reg_read(r.UC_X86_REG_RAX), u.reg_read(r.UC_X86_REG_RDX)) == (budget(old)[0], budget(total)[0]), 'Grant before/after point budgets')
                    for index in range(len(initial)):
                        raw = bytes(u.mem_read(fresh + index * 32, 32))
                        previous = initial_bytes[index * 32:(index + 1) * 32]
                        require(raw[4:] == previous[4:], 'XP grant changed class/allocation ownership')
                    grant_cases += 1

    phase_cases = 0
    for phase in range(256):
        n.reset('producer-phase', [(0x145889d62, 0x145889d70)], {0x145889d70, 0x14588af05})
        n.put(n.bp + 0x57, '<B', phase)
        admitted = n.run(0x145889d62) == 0x145889d70
        require(admitted == (1 <= phase <= 5), 'Native producer phase admission')
        phase_cases += 1
    for absent in (False, True):
        n.reset('producer-snapshot', [(0x145889d3e, 0x145889d4c)], {0x145889d4c, 0x14588af75})
        n.put(n.bp + 0x120, '<q', -1 if absent else 0)
        require((n.run(0x145889d3e) == 0x145889d4c) == (not absent), 'Native snapshot availability gate')

    gate_cases = 0
    for delta in (-(1 << 63), -1, 0, 1, 0xffffffff, 1 << 32, (1 << 32) + 1, (1 << 63) - 1):
        for guid in (1, 0xfffffe, 0xffffff):
            n.reset('producer-gain-gate', [(0x14588a11f, 0x14588a177)], {0x14588a177, 0x14588ad72})
            u.reg_write(r.UC_X86_REG_RCX, delta & ((1 << 64) - 1))
            u.reg_write(r.UC_X86_REG_R12, guid)
            u.reg_write(r.UC_X86_REG_RDI, mem + 0x17000)
            admitted = n.run(0x14588a11f) == 0x14588a177
            gain = max(0, delta) & 0xffffffff
            require(n.get(n.bp + 0x20c, '<I')[0] == gain, 'Producer signed sum to u32 gain')
            require(admitted == (guid != 0xffffff and gain != 0), 'Native zero-GUID/gain rejection')
            gate_cases += 1

    producer_fields = 0
    for before, gain, total in [(0, 80, 80), (79, 1, 80), (175, 100, 275), (0xfffffff0, 100, 0xffffffff), (0xffffffff, 0xffffffff, 0xffffffff)]:
        points, into, next_cost = budget(total)
        old_points = budget(before)[0]
        n.reset('producer-fields', [(0x14588a6ef, 0x14588a839)], {0x14588a839})
        n.put(n.bp + 0x20c, '<I', gain)
        n.put(n.bp + 0x80, '<Q', total)
        for register, value in [(r.UC_X86_REG_R15, before), (r.UC_X86_REG_RSI, old_points),
                                (r.UC_X86_REG_RBX, points), (r.UC_X86_REG_RDI, into), (r.UC_X86_REG_R12, next_cost)]:
            u.reg_write(register, value)
        emitted_fields.clear()
        n.run(0x14588a6ef)
        require(emitted_fields == list(zip(('xp', 'before', 'total', 'points', 'gained', 'into', 'next'),
                                           (gain, before, total, points, (points - old_points) & 0xffffffff, into, next_cost))), 'Native complete numeric event fields')
        producer_fields += 1

    producer_parts = 0
    part_names = ['Time survived', 'Kills', 'Bosses slain', 'Victory', 'Zone bonus', 'Run Options', "Veteran's Lessons"]
    for index, name in enumerate(part_names):
        for delta in (-(1 << 63), -1, 0, 1, 17, (1 << 63) - 1):
            n.reset('producer-positive-part', [(0x14588a3b0, 0x14588a3c7)], {0x14588a3c7, 0x14588a63c})
            row = mem + 0x18000
            n.put(row, '<Qq', index, delta)
            u.reg_write(r.UC_X86_REG_R15, row)
            u.reg_write(r.UC_X86_REG_R13, row + 16)
            require((n.run(0x14588a3b0) == 0x14588a3c7) == (delta > 0), 'Native positive part filter')
            if delta > 0:
                n.reset('producer-part-fields', [(0x14588a452, 0x14588a567)], {0x14588a567})
                u.reg_write(r.UC_X86_REG_RSI, index)
                u.reg_write(r.UC_X86_REG_RBX, delta)
                emitted_fields.clear()
                n.run(0x14588a452)
                require(emitted_fields == [('name', name), ('xp', float(delta))], 'Native part English fallback and signed-i64/f64 numeric boundary')
            producer_parts += 1
    values = [None, False, (0, 0), (0, 80), (0, 0xffffffff), (0, (1 << 64) - 1),
              (1, -100), (1, 81), (1, (1 << 63) - 1), (2, -.5), (2, 81.75),
              (2, 1e30), (2, float('nan')), (2, float('inf')), (2, -float('inf'))]
    numeric_cases = 0
    for gained in values:
        for total in values:
            for before in values:
                n.reset('numeric', [(0x140160059, 0x1401601f0)], {0x1401601f0})
                lookups.clear()
                lookups.update(xp=gained, total=total, before=before)
                u.reg_write(r.UC_X86_REG_RBX, mem + 0x18000)
                n.run(0x140160059)
                gain = clamped(gained) or 0
                prior = clamped(before)
                if prior is None:
                    prior = max(0, (clamped(total) or 0) - gain)
                require((u.reg_read(r.UC_X86_REG_R12), u.reg_read(r.UC_X86_REG_R13)) == (gain, prior), 'Native numeric parser clamp/default')
                numeric_cases += 1

    class_cases = 0
    for name in [None, False, '', 'Warrior', 'Guerrier', '魔法师', (0, 7)]:
        n.reset('class', [(0x140160253, 0x1401602f2)], {0x1401602f2})
        lookups.clear()
        lookups['class'] = name
        u.reg_write(r.UC_X86_REG_RBX, mem + 0x18000)
        n.run(0x140160253)
        _, pointer, length = n.get(n.bp + 0x268, '<QQQ')
        actual = bytes(u.mem_read(pointer, length)).decode() if length else ''
        require(actual == (name if isinstance(name, str) else ''), 'Native class string/default')
        class_cases += 1

    thresholds = [0, 0xffffffff]
    cumulative = 0
    for point in range(51):
        cumulative += 80 + point * 15
        thresholds.extend([cumulative - 1, cumulative, cumulative + 1])
    for xp in thresholds:
        n.reset('budget', [(0x1401602f2, 0x140160372)], {0x140160372})
        u.reg_write(r.UC_X86_REG_R13, xp)
        n.run(0x1401602f2)
        into, points = xp, 0
        while points < 51 and into >= 80 + points * 15:
            into -= 80 + points * 15
            points += 1
        expected = (51, 0, 0) if points == 51 else (points, into, 80 + points * 15)
        actual = (n.get(n.bp + 0x2a4, '<I')[0], n.get(n.bp + 0x2a0, '<I')[0], n.get(n.bp + 0x29c, '<I')[0])
        require(actual == expected, 'Current terminal 51-point cap and threshold budget')

    arrays = [[], [None], values, [(0, 7), (0, 7), (2, 8.5)],
              [(1, -10), (1, 1), (2, -.5), (2, 1e30)], [(0, 0), (0, 0)]]
    part_calls = 0
    for rows in arrays:
        names = [(['Time survived', '', None, False, '同名'][index % 5]) for index in range(len(rows))]
        expected = [(name if isinstance(name, str) else '', clamped(value))
                    for name, value in zip(names, rows) if clamped(value)]
        n.reset('parts', [(0x140075900, 0x140075aea)], {n.done})
        iterator, result = mem + 0x1a000, mem + 0x1b000
        n.put(iterator, '<QQ', mem + 0x18000, mem + 0x18000 + len(rows) * 32)
        actual = []
        while True:
            u.reg_write(r.UC_X86_REG_RCX, result)
            u.reg_write(r.UC_X86_REG_RDX, iterator)
            u.reg_write(r.UC_X86_REG_RSP, n.sp)
            n.put(n.sp, '<Q', n.done)
            n.run(0x140075900)
            part_calls += 1
            if n.get(result, '<q')[0] == -1:
                break
            _, pointer, length, xp = n.get(result, '<QQQI')
            actual.append((bytes(u.mem_read(pointer, length)).decode() if length else '', xp))
        require(actual == expected, 'Native parts retain names, order and positive clamped XP')
        require(n.get(iterator, '<Q')[0] == mem + 0x18000 + len(rows) * 32, 'Native iterator did not visit rejected rows')
        n.reset('collector', [(0x1400e0890, 0x1400e0a42), (0x140075900, 0x140075aea)], {n.done})
        u.reg_write(r.UC_X86_REG_RCX, result)
        u.reg_write(r.UC_X86_REG_RDX, mem + 0x18000)
        u.reg_write(r.UC_X86_REG_R8, mem + 0x18000 + len(rows) * 32)
        n.run(0x1400e0890)
        _, pointer, length = n.get(result, '<QQQ')
        collected = []
        for index in range(length):
            _, name_pointer, name_length, xp = n.get(pointer + index * 32, '<QQQI')
            collected.append((bytes(u.mem_read(name_pointer, name_length)).decode() if name_length else '', xp))
        require(collected == expected, 'Native collected vector changed positive part records')

    sources = {}
    source_records = []
    base = ROOT / 'crates/azeroth-survivors-re/src'
    for name in ('main.rs', 'talent_context.rs', 'save/progress.rs', 'save/talents.rs',
                 'gameplay/mod.rs', 'gameplay/mechanics.rs', 'gameplay/client/events.rs',
                 'gameplay/terminal.rs', 'coop_runtime.rs', 'coop/route.rs'):
        path = base / name
        raw = path.read_bytes()
        sources[name] = ''.join(raw.decode().split())
        source_records.append(dict(path=path.relative_to(ROOT).as_posix(), sha256=hashlib.sha256(raw).hexdigest()))
    assertions = []

    def connected(condition, label):
        require(condition, 'Source connection: ' + label)
        assertions.append(label)

    connected('modtalent_context;' in sources['main.rs'], 'binary registers pure talent-context module')
    connected('TalentXp{gain:u32,before:u32,total:u32,class_key:&\'staticstr,parts:[i64;7],}' in sources['gameplay/mechanics.rs'], 'queued event preserves full grant and seven component deltas')
    progression = sources['save/progress.rs']
    connected('ifamount==0{returnOk(());}self.add_terminal_talent_xp(class,amount)' in progression,
              'source zero-award gate excludes direct native helper empty-row side effect')
    save = sources['save/talents.rs']
    connected('xp.saturating_add(amount)' in save and 'self.lines.push(format!("talent|{class}|{amount}|"));' in save,
              'saved XP saturates first matching row or appends missing class')
    run = sources['gameplay/mod.rs']
    grant = run.index('.grant_terminal_xp(result.class,delivery.talent_xp)')
    queued = run.index('game.events.push(RunEvent::TalentXp', grant)
    connected('menu.commit_account();' in run[grant:queued], 'durable account snapshot precedes queued talent event')
    connected('gain:delivery.talent_xp,before,total:menu.backend_save.talent_xp(result.class)asu32,class_key:game.class.key,parts:delivery.delta_xp_parts' in run[queued:queued + 500],
              'event binds old XP, current saved total, actual class and checkpoint delta parts')
    connected('(tick,terminal::capture,account_delivery,terminal::apply_requests).chain().in_set(RunSet::Tick)' in run,
              'context creation and account delivery precede pending event application')
    events = sources['gameplay/client/events.rs']
    connected('std::mem::take(&mutgame.events)' in events and 'Some(&mutterminal)' in events,
              'completed mechanics events drain once into local terminal owner')
    connected('Some("talentxp")=>terminal.queue_talent(value)' in events,
              'received guest local event enters the same terminal queue')
    projected = events[events.index('fnproject('):events.index('RunEvent::ActorMovement{')]
    connected('crate::talent_context::request(gain,before,total,&class_name,&parts)' in events
              and 'talent_message(gain,before,total,class_key,parts,' in projected
              and 'coop.send_value_from(source_slot,&value)' in projected and 'terminal.queue_talent(value)' in projected,
              'local and remote owner projection share one payload builder')
    connected(all('"' + label.replace(' ', '') + '"' in events for label in part_names),
              'projector preserves all seven native ordered part labels')
    terminal = sources['gameplay/terminal.rs']
    connected('terminal_talent_messages(game,&catalog,locale.as_deref())' in run
              and 'terminal_talent_messages(game,&catalog,locale.as_deref())' in terminal,
              'logout and terminal replacement drain the awarded notice before taking the Game')
    connected('packets.0.push(notice);ifletSome(coop)=coop.as_mut(){coop.send_value_from(source_slot,&value);}' in projected
              and '|cff71d5ff{notice}|r' in events and 'chat_type:0x0a,language:0,' in events,
              'the existing engine chat notice precedes the talent request and keeps its native color/type')
    connected('talent_requests:VecDeque<serde_json::Value>' in terminal
              and 'self.talent_requests.push_back(value)' in terminal
              and 'whileletSome(value)=state.talent_requests.pop_front(){state.accept_talent(value);}' in terminal,
              'pending Value queue preserves request order until context application')
    connected('self.talent_context.accept(value)' in terminal and 'self.talent_context.snapshot().map(|snapshot|TalentSummary{' in terminal,
              'terminal parses the retained context snapshot at its actual consumer')
    capture = terminal[terminal.index('pub(super)fncapture('):terminal.index('fninput(')]
    connected('state.talent_context.activate();' in capture and 'talent:None,' in capture
              and 'TalentSummary{' not in capture and 'letbefore=menu.backend_save.talent_xp' not in capture,
              'summary capture no longer reconstructs XP directly from the current save')
    route = sources['coop/route.rs'].split('#[cfg(test)]')[0]
    connected('"talentxp"' not in route and '_=>None,' in route,
              'talent event does not enter shared peer forwarding rules')
    runtime = sources['coop_runtime.rs']
    connected('letforwarded=azeroth_survivors_re::coop::route::forward_to_peers(&original)' in runtime
              and 'ifslot==source{Some(original.as_str())}' in runtime,
              'cooperative routing retains original event solely for its owning recipient')

    result = dict(target={k: target[k] for k in ('version', 'sha256', 'size_bytes')}, ranges=range_records,
                  queries=queries, numeric_parser_cases=numeric_cases, class_parser_cases=class_cases,
                  budget_cases=len(thresholds),
                  saved_grant_cases=grant_cases, direct_helper_missing_zero_cases=missing_zero_cases,
                  producer_phase_cases=phase_cases, producer_snapshot_cases=2,
                  producer_gain_gate_cases=gate_cases, producer_numeric_field_cases=producer_fields,
                  producer_positive_part_cases=producer_parts,
                  part_arrays=len(arrays), part_iterator_calls=part_calls, part_collector_cases=len(arrays),
                  native_instructions=n.instructions, lookup_keys=sorted(set(lookup_keys)),
                  source_connections=source_records, source_connection_assertions=assertions,
                  limits=['Original selected instruction windows execute in Unicorn scratch memory, not the game.',
                          'JSON lookup returns declared native Value/Number layouts; serde parsing itself is not executed.',
                          'Allocator, vector growth, memcpy and free are declared scratch-only seams.',
                          'Producer serializers/localizer are declared interface seams recording actual field arguments and exercising exact English fallback; complete JSON text formatting is not replayed.',
                          'The native grant helper inserts missing zero-XP rows if called directly; actual producer and source grant owner reject zero awards before that call.',
                          'Source connections are static assertions and hashes, not execution of Rust code.',
                          'Rust regression tests are authored but not compiled or run; scheduling, rendering and original/rebuilt parity remain unverified.'])
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(portable_json(result, indent=2) + '\n')
    print(json.dumps({key: value for key, value in result.items() if isinstance(value, int)}))


if __name__ == '__main__':
    main()

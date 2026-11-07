#!/usr/bin/env python3
"""Replay current active-aura grouping and inspect its live publication path.

Only the selected original instructions execute in synthetic memory. Vector
reserve is a hooked allocation seam; no Rust, game, client or server executes.
"""
from runtime_layout import retained_runtime_path
from portable_paths import objdump_output, portable_json, portable_record
import hashlib
import importlib.util
import itertools
import json
import math
import struct
import subprocess
import argparse
import sys

from coverage_common import ROOT, latest_target, target_bytes, project_path
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as R

START, END, RESERVE = 0x145b8bd9c, 0x145b8beb5, 0x145b8be89
SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def number(word):
    return struct.unpack('<f', struct.pack('<I', word))[0]


def verify_evidence():
    target = latest_target(verify=True)
    assert target['version'] == '0.119.0' and target['sha256'] == SHA
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.119.0/druid-release/manifest.json').read_text())
    assert all(target[key] == proof['target'][key] for key in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('aura_pe', ROOT / 'scripts/inventory-current-target.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.pe_parser(image)
    row = next(row for row in proof['native_spans'] if row['role'] == 'merged-aura-stacks')
    at = pe.rva_offset(START - pe.image_base)
    code = image[at:at + END - START]
    assert int(row['start'], 16) == START and int(row['end_exclusive'], 16) == END
    assert at == int(row['file_offset'], 16) and digest(code) == row['sha256']
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(code, START))
    assert sum(row.size for row in instructions) == len(code)
    assert len(instructions) == row['instruction_count'] == 60
    assert [(row.address, row.op_str) for row in instructions if row.mnemonic == 'call'] == [
        (RESERVE, '0x145fc4c00')]
    for key in ('assembly', 'decompiler'):
        assert digest((ROOT / proof[key]['path']).read_bytes()) == proof[key]['sha256']
    query = next(row for row in proof['queries'] if row['role'] == 'aura-publisher')
    # Original journal/result/tool commitments are reused, never regenerated.
    # Portable source-only checkouts may omit ignored recovery responses.
    retained = (ROOT / query['result']).exists()
    if retained:
        for key in ('plan', 'journal', 'result'):
            assert digest((ROOT / query[key]).read_bytes()) == query[key + '_sha256']
        evidence = json.loads((ROOT / query['result']).read_text())['structuredContent']
        assert evidence['evidence_id'] == query['evidence_id']
        assert evidence['analysis_profile']['digest'] == query['profile_digest']
        assert evidence['subject']['digest']['sha256'] == SHA
        assert digest(evidence['normalized_result'].encode()) == query['normalized_sha256']
        for path, expected in {**query['seed_inputs'], **query['original_tooling']}.items():
            assert digest((ROOT / path).read_bytes()) == expected, path
    return code, retained


def native_cases(code):
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(START & ~4095, 4096)
    machine.mem_write(START, code)
    base = 0x200000000
    machine.mem_map(base, 0x30000)
    game, frame, source, output, stack = (base, base + 0x2000, base + 0x4000,
                                         base + 0x18000, base + 0x2f000)
    allocations = []

    def reserve(uc, address, size, unused):
        if address == RESERVE:
            vector = uc.reg_read(R.UC_X86_REG_RCX)
            assert vector == frame - 8
            assert struct.unpack('<3Q', uc.mem_read(vector, 24)) == (0, 4, 0)
            uc.mem_write(vector, struct.pack('<3Q', 1024, output, 0))
            allocations.append(1)
            uc.reg_write(R.UC_X86_REG_RIP, RESERVE + 5)

    machine.hook_add(UC_HOOK_CODE, reserve)

    def run(rows, now):
        assert len(rows) <= 1024
        packed = b''.join(struct.pack('<QIIIIfI', guid, 3, 0, 0, spell, number(expiry), 0)
                          for spell, expiry, guid in rows)
        machine.mem_write(source, packed or b'\0')
        machine.mem_write(game + 0xbdc, struct.pack('<I', now))
        machine.mem_write(game + 0x3b0, struct.pack('<2Q', source, len(rows)))
        machine.reg_write(R.UC_X86_REG_RCX, game)
        machine.reg_write(R.UC_X86_REG_RBP, frame)
        machine.reg_write(R.UC_X86_REG_RSP, stack)
        allocations.clear()
        machine.emu_start(START, END, count=1000000)
        assert machine.reg_read(R.UC_X86_REG_RIP) == END
        capacity, pointer, count = struct.unpack('<3Q', machine.mem_read(frame - 8, 24))
        actual = [struct.unpack('<3I', machine.mem_read(pointer + index * 12, 12))
                  for index in range(count)]
        # Independent ordered buckets: spell identity only; GUID is irrelevant.
        expected = {}
        for spell, expiry, guid in rows:
            if number(expiry) > number(now):
                if spell not in expected:
                    expected[spell] = (spell, expiry, 1)
                else:
                    old = expected[spell]
                    latest = expiry if number(expiry) >= number(old[1]) else old[1]
                    expected[spell] = (spell, latest, (old[2] + 1) & 0xffffffff)
        assert actual == list(expected.values()), (rows, hex(now), actual, expected)
        assert allocations == ([1] if actual else [])
        assert bytes(machine.mem_read(source, len(packed))) == packed

    # Boundary expiries include exact-now, unordered and signed-zero cases.
    values = [bits(x) for x in [-math.inf, -1., -0., 0., 10., 11., 15., math.inf]] + [0x7fc12345]
    cases = 0
    for now, first, second in itertools.product([bits(-1.), bits(10.), 0x7fc12345], values, values):
        run([(774, first, 0), (871, bits(12.), 2), (774, second, 3)], now)
        cases += 1
    for rows in itertools.permutations([(774, bits(12.), 0), (871, bits(14.), 2),
                                       (774, bits(16.), 3), (7, bits(10.), 4)]):
        run(rows, bits(10.))
        cases += 1
    for count in [0, 1, 2, 31, 32, 33, 254, 255, 256, 300]:
        run([(774, bits(11. + index % 7), index) for index in range(count)], bits(10.))
        cases += 1
    run([(index, bits(12.), index) for index in range(40)] + [(0, bits(18.), 100)], bits(10.))
    return cases + 1


def check_source():
    path = ROOT / 'crates/azeroth-survivors-re/src/run_effects/player_auras.rs'
    text = path.read_text()
    body = text.split('pub fn slots(&self)', 1)[1].split('#[cfg(test)]', 1)[0]
    grouping, later = body.split('let mut harmful=Vec::new();', 1)
    for operation in ['aura.expires_at>self.now', 'find(|row|row.spell_id==aura.spell_id)',
                      'row.count=row.count.wrapping_add(1)', 'aura.expires_at>=row.expires_at',
                      'row.expires_at=aura.expires_at', 'count:1']:
        assert operation in grouping, operation
    assert 'source_guid' not in grouping and 'sort' not in grouping
    assert 'iter_mut().find' not in later  # do not merge later producer partitions
    assert 'if index<32' in later and 'harmful.get(index-32)' in later
    assert 'row.count.min(255).saturating_sub(1)' in later
    assert '(113+group as u16,word)' in later
    assert 'self.publish_slots(input.slots())' in later
    for name in ['active_spells_group_in_first_encounter_order_with_latest_expiry',
                 'grouping_precedes_helpful_truncation_and_does_not_merge_later_producers',
                 'active_group_changes_reach_application_words_without_duplicate_icons']:
        assert 'fn ' + name in text
    for name in ['effects.rs', '../mechanics.rs']:
        adapter = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics' / name).resolve().read_text()
        start = adapter.index('fn publish_player_auras(')
        body = adapter[start:adapter.index('fn ', start + 3)]
        for operation in ['.publish(PlayerAuraInputs {', 'auras: &', 'RunEvent::Aura {', 'fields,']:
            assert operation in body, (name, operation)
    events = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client/events.rs').read_text()
    aura_event = events.split('RunEvent::Aura { target,fields,.. }=>{', 1)[1].split(
        'RunEvent::Appearance', 1)[0]
    assert 'SessionEvent::ObjectValues { guid:target,fields:ObjectFields::from_pairs(&fields) }' in aura_event
    watch = (ROOT / 'crates/benilla-app/src/field_watch.rs').read_text()
    assert 'pass.signal(at, guid, id::UNIT_AURA)' in watch
    combat = (ROOT / 'crates/benilla-app/src/ui_chat/combat/watch.rs').read_text()
    assert 'FIELD_UNIT_AURAAPPLICATIONS, SLOTS / 4' in combat
    parser = ROOT / '.tools/rust/1.98.1-aarch64-apple-darwin/bin/rustfmt'
    if parser.exists():
        result = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout',
                                 '--config', 'skip_children=true'], input=text, text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, cwd=ROOT, timeout=30)
        assert result.returncode == 0, result.stderr
        return True
    return False


def strongest_window(active, fallback, value, until, now):
    if now >= active[1]:
        active = fallback if now < fallback[1] else (0., 0.)
        fallback = (0., 0.)
    previous = active
    if now >= active[1] or value > active[0] or (value == active[0] and until > active[1]):
        active = (value, until)
    candidates = [candidate for candidate in [previous, fallback, (value, until)]
                  if candidate[0] > 0. and candidate[1] > active[1] and candidate[1] > now]
    fallback = max(candidates, key=lambda row: (row[0], row[1]), default=(0., 0.))
    return active, fallback


SHOUT_SPANS = {
    'strongest-window': (0x145b760b0, 0x145b7624b),
    'aura-stat-consumer': (0x145c19060, 0x145c1920e),
    'active-shout-tooltip': (0x145c0c300, 0x145c0c668),
    'party-aura-producer': (0x145c05c60, 0x145c05d41),
    'self-shout-publication': (0x145c6437c, 0x145c6448d),
    'party-aura-recipient': (0x145c07c20, 0x145c0844f),
    'party-recipient-routing': (0x145bfe5b0, 0x145bfe7f0),
    'enemy-weakening': (0x145c6910f, 0x145c691b7),
    'amplification-discriminator': (0x145c771da, 0x145c77239),
    'amplification-update': (0x145c77942, 0x145c7797c),
    'judgement-update': (0x145c7916f, 0x145c7917d),
    'independent-hit-consumers': (0x145c326bf, 0x145c3270a),
}


def selected_auras(rows, now):
    # Semantic rows: source GUID, native status, strength, spell, deadline.
    def strength(row): return row[2] if row[1] in (8, 9) else 0.
    return [row for index, row in enumerate(rows) if not (now >= row[4]) and
            (row[3] == 774 or not any(other[3] == row[3] and other[4] > now and
             (strength(other) > strength(row) or
              (strength(other) == strength(row) and other_index < index))
             for other_index, other in enumerate(rows) if index != other_index))]


def shout_cases(data, pe):
    from native_terminal import NativeReplay
    m=NativeReplay(data,pe);u=m.machine;x=m.registers
    def scalar(register): return u.reg_read(register) & 0xffffffff
    def set_rows(rows, now):
        m.put(m.app+0x3d0,'<3Q',64,m.mem+0x8000,len(rows))
        m.put(m.app+0xcc0,'<f',now)
        for index,(guid,tag,value,spell,deadline) in enumerate(rows):
            m.put(m.mem+0x8000+index*32,'<QIffIff',guid,tag,value,0.,spell,deadline,0.)
    sequences=[]
    for first,second,duration1,duration2,at in itertools.product([0.,.15,.35,.6,.95],[0.,.15,.35,.6,.95],
            [1.,3.,6.,10.],[1.,3.,6.,10.],[0.,1.,5.]):
        m.reset('strongest',[SHOUT_SPANS['strongest-window']],[m.done])
        active,fallback=(0.,0.),(0.,0.);steps=[]
        for now,value,duration in [(0.,first,duration1),(at,second,duration2),(at+1.,.2,12.),(at+7.,.4,2.)]:
            value,until=f32(value),f32(now+duration)
            m.put(m.sp,'<Q',m.done);u.reg_write(x.UC_X86_REG_RSP,m.sp)
            u.reg_write(x.UC_X86_REG_RCX,m.app);m.scalar(x.UC_X86_REG_XMM1,value)
            m.scalar(x.UC_X86_REG_XMM2,until);m.scalar(x.UC_X86_REG_XMM3,now)
            m.run(0x145b760b0)
            active,fallback=strongest_window(active,fallback,value,until,now)
            expected=[bits(v)for v in (*active,*fallback)];actual=list(m.get(m.app,'<4I'))
            assert actual==expected,(steps,now,value,until,actual,expected)
            steps.append([bits(now),bits(value),bits(until),actual])
        sequences.append(steps)
    # Same-spell strength, equal ties, independent sources, refresh, expiry,
    # fallback, unrelated spell and Rejuvenation rows. Execute both consumers.
    aura_cases=[]
    inputs=list(itertools.product([.1,.3],[.1,.3],[2.,8.],[2.,8.],[0.,2.,8.],[8,9,10]))
    inputs += [(.1,.3,math.nan,8.,0.,8),(.3,.1,math.nan,8.,0.,8),(.3,.1,8.,9.,math.nan,8)]
    for first,second,deadline1,deadline2,now,tag in inputs:
        rows=[(10,8,f32(first),6673,deadline1),(20,tag,f32(second),6673,deadline2),
              (30,9,f32(.2),1234,9.),(40,9,f32(.4),1234,1.),
              (10,6,.1,774,9.),(20,6,.2,774,9.)]
        selected=selected_auras(rows,now)
        m.reset('aura-stats',[SHOUT_SPANS['aura-stat-consumer']],[0x145c1920e]);set_rows(rows,now)
        u.reg_write(x.UC_X86_REG_RSI,m.app);m.put(m.bp+0x80,'<f',.25)
        m.scalar(x.UC_X86_REG_XMM4,.5);m.put(m.bp+0xa0,'<f',.125)
        m.run(0x145c19060)
        damage,recovery=f32(.5),f32(.125)
        for row in selected:
            if row[1]==8: damage=f32(damage+f32(row[2]*1.25))
            if row[1]==9: recovery=f32(recovery+f32(row[2]*1.25))
        assert scalar(x.UC_X86_REG_XMM4)==bits(damage)
        assert m.get(m.bp+0xa0,'<I')[0]==bits(recovery)
        m.reset('aura-tooltip',[SHOUT_SPANS['active-shout-tooltip']],[0x145c0c451,m.done]);set_rows(rows,now)
        u.reg_write(x.UC_X86_REG_RCX,m.app);u.reg_write(x.UC_X86_REG_RDX,m.mem+0xa000)
        u.reg_write(x.UC_X86_REG_R8,1);m.put(m.mem+0xa000+0xa8,'<I',6673)
        pc=m.run(0x145c0c300)
        winner=next((row for row in selected if row[3]==6673 and row[1]==8 and row[4]>now),None)
        assert (pc==0x145c0c451)==(winner is not None)
        percent=None
        if winner:
            assert scalar(x.UC_X86_REG_XMM6)==bits(winner[2])
            m.put(m.app+0x508,'<f',.25);u.reg_write(x.UC_X86_REG_RBX,m.app)
            m.context['stops']={0x145c0c494};m.run(0x145c0c478)
            percent=scalar(x.UC_X86_REG_XMM0)
            assert percent==bits(f32(f32(1.25*winner[2])*100.))
        aura_cases.append(dict(rows=[[g,t,bits(v),s,bits(d)]for g,t,v,s,d in rows],now=bits(now),
            damage=bits(damage),recovery=bits(recovery),tooltip_percent=percent))
    producers=[]
    for enabled,slot,duration in itertools.product([0,1],[0,1],[0.,6.,12.]):
        m.reset('party-producer',[SHOUT_SPANS['party-aura-producer']],[m.done])
        m.put(m.app+0xd7e,'<B',enabled);m.put(m.app+0xc78,'<Q',slot)
        m.put(m.app+0x4b0,'<Q',100+slot*100);m.put(m.app+0x520,'<3f',1.,2.,3.)
        m.put(m.app+0xaf0,'<3Q',8,m.mem+0x9000,0)
        m.put(m.mem+0x6000,'<Iff',8,.3,0.)
        u.reg_write(x.UC_X86_REG_RCX,m.app);u.reg_write(x.UC_X86_REG_RDX,6673)
        u.reg_write(x.UC_X86_REG_R8,m.mem+0x6000);m.scalar(x.UC_X86_REG_XMM3,duration)
        m.run(0x145c05c60);assert m.get(m.app+0xb00,'<Q')[0]==enabled
        actual=bytes(u.mem_read(m.mem+0x9000,56))
        expected=struct.pack('<QQ3fIffIff4x',slot,100+slot*100,1.,2.,3.,6673,0.,duration,8,.3,0.)if enabled else bytes(56)
        assert actual==expected
        producers.append(dict(enabled=enabled,slot=slot,duration=bits(duration),event_hex=actual.hex()))
    # Original recipient retain/append path, before independent stat/publication
    # helpers. Spare vector capacity avoids any allocation seam.
    recipients=[]
    for rows,source in [([],10), ([(10,8,.1,6673,20.)],10),
            ([(10,8,.1,6673,20.)],20), ([(10,8,.1,6673,20.),(20,8,.3,6673,9.)],10),
            ([(10,8,.1,6673,20.),(20,8,.3,6673,9.)],20),
            ([(10,8,.1,6673,20.),(10,8,.2,6673,30.),(20,8,.3,6673,9.)],10)]:
        m.reset('party-recipient',[SHOUT_SPANS['party-aura-recipient']],[0x145c08070]);set_rows(rows,7.)
        event=m.mem+0x6000;m.put(event+8,'<Q',source);m.put(event+0x1c,'<I',6673)
        m.put(event+0x24,'<f',6.);m.put(event+0x28,'<Iff',8,.4,0.)
        u.reg_write(x.UC_X86_REG_RCX,m.app);u.reg_write(x.UC_X86_REG_RDX,event)
        m.run(0x145c07c20)
        actual=[list(m.get(m.mem+0x8000+i*32,'<QIffIff'))for i in range(m.get(m.app+0x3e0,'<Q')[0])]
        expected=[[g,t,f32(v),0.,s,d,0.]for g,t,v,s,d in rows if g!=source or s!=6673]
        expected.append([source,8,f32(.4),0.,6673,13.,0.]);assert actual==expected,(rows,source,actual,expected)
        recipients.append(dict(source=source,before=[[g,t,bits(v),s,bits(d)]for g,t,v,s,d in rows],
            after=[[g,t,bits(v),s,bits(d)]for g,t,v,_,s,d,_ in actual]))
    # Actual enemy hit reads Judgement first, then Demo's active/fallback pair.
    independent=[]
    for now,judgement_until,active_until,fallback_until in itertools.product([0.,3.,8.],[2.,10.],[2.,6.],[4.,10.]):
        m.reset('independent-hit',[SHOUT_SPANS['independent-hit-consumers']],[0x145c3270a])
        m.put(m.app+0x120,'<6f',.12,judgement_until,.3,active_until,.1,fallback_until)
        u.reg_write(x.UC_X86_REG_RAX,m.app+0x1f8)
        m.scalar(x.UC_X86_REG_XMM1,now);m.scalar(x.UC_X86_REG_XMM8,1.)
        m.run(0x145c326bf)
        expected=f32(1.+(f32(.12) if judgement_until>now else 0.))
        expected=f32(expected+(f32(.3)if active_until>now else f32(.1)if fallback_until>now else 0.))
        actual=scalar(x.UC_X86_REG_XMM8);assert actual==bits(expected)
        independent.append([bits(v)for v in [now,judgement_until,active_until,fallback_until]]+[actual])
    return dict(strongest_sequence_count=len(sequences),strongest_operation_count=len(sequences)*4,
        strongest_all_cases_sha256=digest(json.dumps(sequences,separators=(',',':')).encode()),
        strongest_sequences=sequences[::20]+[sequences[-1]],aura_consumers=aura_cases,
        party_producers=producers,party_recipients=recipients,independent_hit=independent,instruction_steps=m.instructions)


def shout_source_check():
    base=ROOT/'crates/azeroth-survivors-re/src'
    expected={
      'player_abilities/behavior/state.rs':['pub struct StrongestWindow','pub fallback: TimedReduction',
        'candidate.until > self.active.until','candidate.fraction > fallback.fraction'],
      'player_abilities/behavior/buffs.rs':['pub fn effective_auras','other_index < *index',
        'old.source_guid != aura.source_guid',
        'shared_aura = Some(SharedAura','self.source_guid == 0','effect.value *= 1.0 + buff_bonus'],
      'player_abilities/behavior/dispatch.rs':['port.share_aura(', 'fn share_aura('],
      'player_abilities/damage.rs':['pub demoralizing_amplification: f32','multiplier += victim.demoralizing_amplification;'],
      'gameplay/mechanics.rs':['buffs::effective_auras(auras, now, buff_bonus)','fn share_aura(',
        'demoralizing_amplification.get(&row.guid).map_or(0.0, |window| window.value_at(self.now))'],
      'gameplay/mechanics/callbacks.rs':['pub actor_weakening:', 'pub demoralizing_amplification:',
        'weakening.insert(now, effect.value, now + effect.duration)', 'weakening.advance(now)',
        'if spell_id == 1160', 'row.vulnerability_until = self.context.now + effect.duration'],
      'gameplay/mechanics/shared_healing.rs':['Aura(buffs::SharedAura)','pub fn enqueue_aura(',
        'event.source_slot == self.coop.active_slot','expires_at: self.clock + aura.duration',
        'event.source_guid', 'source_guid, effect: aura.effect','dx * dx + dy * dy <= 900.0'],
      'gameplay/mechanics/coop.rs':['&mut game.effect_state.generic.actor_weakening',
        '&mut game.effect_state.generic.demoralizing_amplification','fn party_spell_source_slot'],
      'gameplay/mechanics/actor_frame.rs':['generic.actor_weakening.remove(&guid)',
        'generic.demoralizing_amplification.remove(&guid)'],
      'gameplay/mechanics/bosses.rs':['demoralizing_amplification:'],
      'gameplay/mechanics/wards.rs':['demoralizing_amplification:'],
      'gameplay/mechanics/passives.rs':['fn share_aura('],
      'gameplay/coop_spell_auxiliary.rs':['fn active_battle_shout(', '.find(|aura| aura.spell_id == 6673 && now < aura.expires_at)',
        'row.text_30 = locale.label("Damage increased by {p}%.")','aura.buff_strength(buff_bonus) * 100.0'],
      'gameplay/coop_overlay.rs':['spell_auxiliary::active_battle_shout(&mut rows, &game.execution.auras,',
        'game.clock, context.bonuses.buff_bonus, locale)',
        'append_party_battle_shout(game, 0, &mut rows, &locale)',
        'append_party_battle_shout(game, slot, &mut resources, member_locale)'],
      'save/talents.rs':['from you and your allies for 6 sec.'],
      'gameplay/mechanics/shared_healing_tests.rs':['fn battle_shout_keeps_two_casters_and_uses_the_weaker_aura_after_expiry'],
    }
    parser=ROOT/'.tools/rust/1.98.1-aarch64-apple-darwin/bin/rustfmt'
    parsed=0
    for path,tokens in expected.items():
        text=(base/path).read_text()
        for token in tokens: assert ''.join(token.split()) in ''.join(text.split()),(path,token)
        if parser.is_file():
            result=subprocess.run([str(parser),'--edition','2024','--emit','stdout','--config','skip_children=true'],
                input=text,text=True,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE,cwd=ROOT,timeout=30)
            assert result.returncode==0,(path,result.stderr);parsed+=1
    damage=(base/'player_abilities/damage.rs').read_text().split('pub fn victim_multiplier(',1)[1].split('pub struct HitDamage',1)[0]
    assert damage.index('victim.vulnerability_until')<damage.index('multiplier += victim.demoralizing_amplification;')<damage.index('context.player_absorb')
    return parsed


def shout_contract(args):
    from script_sources import load_script
    target=latest_target(verify=True)
    assert target['sha256']=='3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb'
    data=target_bytes(target);pe=load_script('shout_pe',ROOT/'scripts/inventory-executable.py').PE(data)
    output=project_path(args.work)if args.collect else ROOT/'docs/analysis/evidence/0.127.0/shouts'
    def raw(a,b):at=pe.rva_offset(a-pe.image_base);return data[at:at+b-a]
    def receipt(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=digest(path.read_bytes()))
    manifest=dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},ranges=[])
    for role,(a,b)in SHOUT_SPANS.items():
        manifest['ranges'].append(dict(role=role,start=hex(a),end_exclusive=hex(b),
            file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=b-a,sha256=digest(raw(a,b))))
    manifest['talent_inputs']=[]
    source_talents=json.loads((ROOT/'crates/azeroth-survivors-re/assets/talents.json').read_text())
    for key,address in [('imp_demo_shout',0x147054e40),('judgement_crusader',0x147057480)]:
        record=raw(address,address+160);kp,kn=struct.unpack_from('<QQ',record,48)
        assert raw(kp,kp+kn).decode()==key
        ep,en=struct.unpack_from('<QQ',record,96);tp,tn=struct.unpack_from('<QQ',record,112)
        effect=raw(ep,ep+64);assert en==1 and struct.unpack_from('<I',effect,8)[0]==0xffffffff
        source=next(talent for cl in source_talents['classes'] for tree in cl['trees']
            for talent in tree['talents'] if talent['key']==key)['effects'][0]
        payload=bytes.fromhex(source['payload'])
        assert payload[:40]==effect[:40] and payload[48:]==effect[48:]
        sp,sn=struct.unpack_from('<QQ',effect,40);selector=raw(sp,sp+sn).decode()
        assert source['strings']==[dict(offset=40,value=selector)]
        manifest['talent_inputs'].append(dict(key=key,definition_address=hex(address),definition_sha256=digest(record),
            effect_address=hex(ep),effect_hex=effect.hex(),effect_sha256=digest(effect),
            source_payload_sha256=digest(payload),selector=selector,
            description_address=hex(tp),description=raw(tp,tp+tn).decode()))
    template=manifest['talent_inputs'][0]['description']
    review=load_script('shout_locales',ROOT/'scripts/review-current-locale-catalogs.py').derive()
    assert review['target']==manifest['target'];manifest['localized_amplification']=[]
    for locale in review['locales']:
        payload=locale['payload'];at=int(payload['file_offset'],16);encoded=data[at:at+payload['byte_count']]
        assert digest(encoded)==payload['sha256'];value=json.loads(encoded)[template]
        path=ROOT/f"crates/azeroth-survivors-re/assets/locales/{locale['code']}.json"
        assert json.loads(path.read_text())[template]==value
        manifest['localized_amplification'].append(dict(code=locale['code'],payload=payload,key=template,value=value))
    from discovery_native_subject import verify_native_query_subject
    if args.collect:
        output.mkdir(parents=True,exist_ok=True);manifest['queries']=[]
        for key,folder_name in [('145b760b0','rea'),('145c18970','rea'),('145c68a30','rea'),('145c0c300','rea-v2')]:
            folder=ROOT/'runtime/analysis/history/combat/warlock-current/867d2347c452'/key;journal_path=folder/folder_name/'journal.json'
            journal=json.loads(journal_path.read_text());operation=next(v for v in journal['operations'].values()if v['name']=='procedure_pseudo_code')
            assert operation['status']=='completed';result_path=ROOT/operation['result']['path']
            result=json.loads(result_path.read_text());native=result.get('structuredContent')or json.loads(result['content'][0]['text'])
            query=dict(procedure=hex(int(key,16)),slice_virtual_address=hex(int(key,16)),raw_input=receipt(folder/'body.bin'),
                plan=receipt(folder/'plan.json'),journal=receipt(journal_path),result=receipt(result_path),
                evidence_id=native['evidence_id'],provider=native['provider'],analysis_profile_digest=native['analysis_profile']['digest'])
            verify_native_query_subject(ROOT,native,query,manifest['target'],image=data,pe=pe);manifest['queries'].append(query)
        # Reuse the party owner's exact completed receipt, not a second copy.
        party=json.loads((ROOT/'docs/analysis/evidence/0.127.0/revive-choice/manifest.json').read_text())
        assert party['target']==manifest['target'];manifest['queries'].append(party['queries'][0])
        from coverage_common import artifact_path
        text=''
        for role,(a,b)in SHOUT_SPANS.items():
            asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',
                f'--stop-address={b:#x}',str(artifact_path(target['path']))],text=True)
            text+=f'// {role}\n'+'\n'.join(line for line in asm.splitlines()if line.startswith('145'))+'\n'
        (output/'selected-native.asm').write_text(text);manifest['assembly_sha256']=digest(text.encode())
    else:
        retained=json.loads((output/'manifest.json').read_text())
        for key in ['target','ranges','talent_inputs','localized_amplification']: assert retained[key]==manifest[key],key
        assert digest((output/'selected-native.asm').read_bytes())==retained['assembly_sha256']
        for query in retained['queries']:
            result_path=ROOT/query['result']['path']
            if result_path.is_file():
                for field in ['raw_input','plan','journal','result']:
                    item=query[field];assert receipt(retained_runtime_path(ROOT/item['path'], ROOT))==item
                result=json.loads(result_path.read_text());native=result.get('structuredContent')or json.loads(result['content'][0]['text'])
                verify_native_query_subject(ROOT,native,query,manifest['target'],image=data,pe=pe)
    cases=shout_cases(data,pe);parsed=shout_source_check()
    if args.collect:
        (output/'native-cases.json').write_text(portable_json(cases,indent=2)+'\n')
        manifest['native_cases_sha256']=digest((output/'native-cases.json').read_bytes())
        (output/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    else:
        assert portable_record(json.loads((output/'native-cases.json').read_text()))==portable_record(cases)
        assert digest((output/'native-cases.json').read_bytes())==retained['native_cases_sha256']
    print(json.dumps(dict(target=target['version'],strongest_sequences=cases['strongest_sequence_count'],
        strongest_operations=cases['strongest_operation_count'],aura_stat_and_tooltip_cases=len(cases['aura_consumers']),
        party_producer_cases=len(cases['party_producers']),party_recipient_cases=len(cases['party_recipients']),independent_hit_cases=len(cases['independent_hit']),
        instruction_steps=cases['instruction_steps'],rust_syntax_parsed=parsed,rust_tests_run=False,
        game_or_server_executed=False,parity_verified=False),indent=2))

def f32(value):
    return struct.unpack('<f',struct.pack('<f',value))[0]


def battle_shout_potency(args):
    from coverage_common import installed_identity
    from native_terminal import NativeReplay
    from script_sources import load_script

    target = installed_identity()
    assert target['version'] == '0.141.1'
    assert target['sha256'] == '47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6'
    data = target_bytes(target)
    pe = load_script('battle_shout_pe', ROOT/'scripts/inventory-executable.py').PE(data)
    replay = NativeReplay(data, pe)
    machine, registers = replay.machine, replay.registers
    spans = {
        'self-aura-and-broadcast': (0x145f8ef92, 0x145f8f031),
        'party-aura-producer': (0x145f49010, 0x145f49118),
        'party-aura-recipient': (0x145f4b120, 0x145f4bc57),
        'aura-stat-consumer': (0x145fa5aef, 0x145fa5d07),
        'active-shout-tooltip': (0x145f51390, 0x145f51752),
        'party-resource-merge': (0x145f4a6e3, 0x145f4a929),
        'party-resource-donor': (0x145f4a3b7, 0x145f4a425),
        'party-resource-donor-tooltip': (0x145f502cd, 0x145f502d9),
        'guest-recipient-tooltip': (0x145f4ab17, 0x145f4ab24),
        'local-party-resource-caller': (0x145ebc76a, 0x145ebc790),
        'guest-party-resource-caller': (0x145eb9a75, 0x145eb9a8b),
        'resource-class-pool': (0x145f4e399, 0x145f4e3d2),
        'potency-published': (0x145fa5eb9, 0x145fa5ec2),
    }
    ranges = [dict(role=role, start=hex(a), end_exclusive=hex(b),
        file_offset=hex(pe.rva_offset(a-pe.image_base)),
        sha256=digest(replay.raw(a,b-a))) for role,(a,b) in spans.items()]
    assert replay.raw(0x147702554,8) == b'war_horn'
    assert replay.raw(0x147705c0f,15) == b'unbridled_wrath'
    assert struct.unpack('<QQ',replay.raw(0x147702c00,16)) == (0x147702554,8)
    assert struct.unpack('<QQ',replay.raw(0x147706598,16)) == (0x147705c0f,15)
    assert struct.unpack('<QQ',replay.raw(0x1477065c8,16)) == (0x147705c40,1)
    assert struct.unpack('<IBB',replay.raw(0x147702c40,6)) == (bits(.15),17,1)
    assert struct.unpack('<III',replay.raw(0x147705c40,12)) == (72,bits(.06),23)
    numeric_inputs = []
    for role,table,tag,branch in [
        ('war_horn',0x147afe87c,17,0x145fa67da),
        ('unbridled_wrath',0x147afe8cc,23,0x145fa691b),
    ]:
        relative, = struct.unpack('<i',replay.raw(table+tag*4,4))
        assert table+relative == branch
        assert replay.raw(branch,4) == (b'\xf3\x0f\x58\xea' if tag == 17 else b'\xf3\x0f\x58\x29')
        numeric_inputs.append(dict(key=role, dispatch_table=hex(table), tag=tag, add=hex(branch)))

    def set_register(name, value):
        machine.reg_write(getattr(registers, 'UC_X86_REG_' + name), value)

    def scalar(name, value):
        replay.scalar(getattr(registers, 'UC_X86_REG_' + name), value)

    def scalar_bits(name):
        return machine.reg_read(getattr(registers, 'UC_X86_REG_' + name)) & 0xffffffff

    def setup_auras(rows, now, bonus):
        replay.put(replay.app+0x4e0, '<3Q', 8, replay.mem+0x8000, len(rows))
        replay.put(replay.app+0x1028, '<f', now)
        replay.put(replay.app+0x69c, '<f', bonus)
        for i,(guid,tag,value,spell,until) in enumerate(rows):
            replay.put(replay.mem+0x8000+i*32, '<QIffIff', guid,tag,value,0.,spell,until,0.)

    def strength(row, bonus):
        value = row[2] if row[1] in (8, 9) else 0.
        return f32(value * (f32(1. + bonus) if row[0] == 0 else 1.))

    consumers = []
    # Raw .375 loses to .5 with zero potency, ties at 1/3, and beats it with .5.
    for bonus, now, remote_tag in itertools.product([0., f32(1./3.), .5], [0., 2., 8.], [8, 9]):
        rows = [(0,8,.375,6673,2.), (101,remote_tag,.5,6673,8.),
                (0,9,.125,900,9.), (202,9,.15625,900,9.)]
        selected = []
        for i,row in enumerate(rows):
            if now >= row[4]: continue
            if any(other[3] == row[3] and now < other[4] and
                   (strength(other, bonus) > strength(row, bonus) or
                    (strength(other, bonus) == strength(row, bonus) and j < i))
                   for j,other in enumerate(rows) if j != i):
                continue
            selected.append(row)
        replay.reset('stats', [spans['aura-stat-consumer']], [0x145fa5d07])
        setup_auras(rows, now, bonus)
        set_register('RSI', replay.app)
        set_register('RDX', len(rows))
        scalar('XMM5', bonus)
        scalar('XMM3', .5)
        replay.put(replay.bp+0xb0, '<f', .125)
        replay.run(spans['aura-stat-consumer'][0])
        damage, recovery = .5, .125
        for row in selected:
            if row[1] == 8: damage = f32(damage + strength(row, bonus))
            if row[1] == 9: recovery = f32(recovery + strength(row, bonus))
        assert scalar_bits('XMM3') == bits(damage)
        assert replay.get(replay.bp+0xb0, '<I')[0] == bits(recovery)

        replay.reset('tooltip', [spans['active-shout-tooltip']], [0x145f514f0, replay.done])
        setup_auras(rows, now, bonus)
        set_register('RCX', replay.app)
        set_register('RDX', replay.mem+0xa000)
        set_register('R8', 1)
        replay.put(replay.mem+0xa0a8, '<I', 6673)
        winner = next((row for row in selected if row[3] == 6673 and row[1] == 8), None)
        actual = replay.run(spans['active-shout-tooltip'][0])
        assert (actual == 0x145f514f0) == (winner is not None)
        percent = None
        if winner is not None:
            assert scalar_bits('XMM7') == bits(winner[2])
            replay.context['stops'] = {0x145f51535}
            replay.run(0x145f5151b)
            percent = scalar_bits('XMM7')
            assert percent == bits(f32(strength(winner, bonus)*100.))
        consumers.append(dict(rows=[[g,t,bits(v),s,bits(e)] for g,t,v,s,e in rows],
            now=bits(now), buff_bonus=bits(bonus), damage=bits(damage), recovery=bits(recovery),
            tooltip_percent=percent))

    deliveries = 0
    for enabled, tag, bonus in itertools.product([0, 1], [7, 8, 9, 10], [0., .5]):
        replay.reset('producer', [spans['party-aura-producer']], [replay.done])
        replay.put(replay.app+0x10e3, '<B', enabled)
        replay.put(replay.app+0xfd8, '<Q', 1)
        replay.put(replay.app+0x5c8, '<Q', 101)
        replay.put(replay.app+0x5e0, '<3f', 1., 2., 3.)
        replay.put(replay.app+0x69c, '<f', bonus)
        replay.put(replay.app+0xdd0, '<3Q', 8, replay.mem+0x9000, 0)
        replay.put(replay.mem+0x6000, '<Iff', tag, .375, 0.)
        set_register('RCX', replay.app)
        set_register('RDX', 6673)
        set_register('R8', replay.mem+0x6000)
        scalar('XMM3', 6.)
        replay.run(spans['party-aura-producer'][0])
        assert replay.get(replay.app+0xde0, '<Q')[0] == enabled
        amount = .375 * (1. + bonus) if enabled and tag in (8, 9) else .375
        assert replay.get(replay.mem+0x6000, '<Iff') == (tag, amount, 0.)
        if enabled:
            event = bytes(machine.mem_read(replay.mem+0x9000, 56))
            assert event == struct.pack('<QQ3fIffIff4x', 1,101,1.,2.,3.,6673,0.,6.,tag,amount,0.)
            if tag in (8, 9):
                replay.reset('recipient', [spans['party-aura-recipient']], [0x145f4b586])
                setup_auras([], 2., .75)
                machine.mem_write(replay.mem+0x9000, event)
                set_register('RCX', replay.app)
                set_register('RDX', replay.mem+0x9000)
                replay.run(spans['party-aura-recipient'][0])
                assert replay.get(replay.app+0x4f0, '<Q')[0] == 1
                assert replay.get(replay.mem+0x8000, '<QIffIff') == (101,tag,amount,0.,6673,8.,0.)
                deliveries += 1

    proof = dict(target={k:target[k] for k in ('version','path','sha256','size_bytes')},
        ranges=ranges, numeric_inputs=numeric_inputs, aura_consumers=consumers, party_producer_cases=16,
        party_recipient_cases=deliveries, original_instruction_steps=replay.instructions)
    if args.collect:
        output = project_path(args.work)
        output.mkdir(parents=True, exist_ok=True)
        (output/'battle-shout.json').write_text(portable_json(proof, indent=2)+'\n')
    else:
        expected = ROOT/'docs/analysis/evidence/battle-shout.json'
        assert json.loads(expected.read_text()) == proof
    parsed = shout_source_check()
    print(f"Battle Shout 0.141.1: {len(consumers)} stat/tooltip pairs, 16 producers, "
          f"{deliveries} recipient deliveries, {replay.instructions} instruction steps, "
          f"{parsed} Rust syntax parses. No compilation or game execution.")


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--contract',choices=['aura-grouping','shouts','battle-shout-potency'],default='aura-grouping')
    parser.add_argument('--collect',action='store_true')
    parser.add_argument('--verify',action='store_true')
    parser.add_argument('--work',default='runtime/analysis/history/combat/warlock-current/867d2347c452/shouts-curated')
    args=parser.parse_args()
    if args.contract=='shouts':return shout_contract(args)
    if args.contract=='battle-shout-potency':return battle_shout_potency(args)
    code, retained = verify_evidence()
    cases = native_cases(code)
    syntax = check_source()
    print(json.dumps(dict(target='0.119.0', original_instruction_cases=cases,
                          instructions=60, native_bytes=len(code), retained_query_checked=retained,
                          source_wiring_checked=True, rust_syntax_parsed=syntax,
                          rust_tests_run=False, game_or_server_executed=False, parity_verified=False), indent=2))


if __name__ == '__main__':
    main()

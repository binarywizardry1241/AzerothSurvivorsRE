#!/usr/bin/env python3
"""Verify selected-target mover bytes, native boundary vectors and live source links.

This is a non-compiling static contract check, not execution of the Rust source.
--extract stages the named unchanged native slices and focused REA plans in runtime/.
"""
from native_recovery import f32 as _shared_f32
from script_sources import load_script
from pathlib import Path
import argparse
import hashlib
import json
import struct
import sys

ROOT = Path(__file__).resolve().parent.parent
EVIDENCE = ROOT / 'docs/analysis/evidence/0.105.0/terminal'


def f32(value):
    return _shared_f32(value)


def require(text, fragment):
    assert ' '.join(fragment.split()) in ' '.join(text.split()), f'Missing source contract: {fragment}'


def native_vectors(data, speeds):
    """Replay unchanged instructions only; all serializer/queue calls remain explicit seams."""
    module = load_script('selected_pe', ROOT/'scripts/inventory-executable.py')
    pe=module.PE(data)
    sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, __version__
    from unicorn import x86_const as reg
    u=Uc(UC_ARCH_X86,UC_MODE_64)
    extent=max(row['rva']+max(row['virtual_size'],row['raw_size']) for row in pe.sections)
    u.mem_map(pe.image_base,(extent+4095)&~4095)
    for row in pe.sections:
        u.mem_write(pe.image_base+row['rva'],data[row['raw_offset']:row['raw_offset']+row['raw_size']])
    game,stack=0x200000000,0x300000000
    u.mem_map(game,0x10000);u.mem_map(stack,0x10000)
    context={};results=[]
    def code(uc,address,size,unused):
        if address in context['ends']:
            context['exit']=address;uc.emu_stop()
        elif not any(start<=address<end for start,end in context['spans']):
            raise RuntimeError('Unreviewed player-mover instruction '+hex(address))
    u.hook_add(UC_HOOK_CODE,code)
    def run(start,end,alternative=()):
        context.update(spans=[(start,end)],ends={end,*alternative},exit=None)
        u.emu_start(start,0,count=128)
        assert context['exit'] in context['ends'],'Instruction budget exhausted'
        return context['exit']
    def put(offset,fmt,*values):u.mem_write(game+offset,struct.pack('<'+fmt,*values))
    def get(offset,fmt):return struct.unpack('<'+fmt,u.mem_read(game+offset,struct.calcsize('<'+fmt)))[0]
    for remembered,candidate,expected in speeds:
        for sequence in (1,0xffffffff):
            u.mem_write(game,bytes(0x1000));put(0x54c,'f',remembered);put(0x548,'I',sequence)
            u.reg_write(reg.UC_X86_REG_R12,game);u.reg_write(reg.UC_X86_REG_RBP,stack+0x1000)
            u.reg_write(reg.UC_X86_REG_XMM3,int.from_bytes(struct.pack('<f',candidate),'little'))
            u.reg_write(reg.UC_X86_REG_MXCSR,0x1f80)
            exit_at=run(0x1458fa0da,0x1458fa125,(0x1458fa18a,))
            sent=exit_at==0x1458fa125
            assert sent==expected,(remembered,candidate,expected,sent)
            assert get(0x548,'I')==((sequence+int(sent))&0xffffffff)
            stored=candidate if sent else remembered
            assert bytes(u.mem_read(game+0x54c,4))==struct.pack('<f',stored)
            if sent:assert u.reg_read(reg.UC_X86_REG_R8D)==sequence
            results.append(dict(kind='speed-prefix',remembered=str(remembered),candidate=str(candidate),
                                sequence=sequence,sent=sent,next_sequence=get(0x548,'I')))
    writers=[('report-teleport',reg.UC_X86_REG_RSI,[(0x1458f9376,0x1458f9387)]),
             ('sink-test-teleport',reg.UC_X86_REG_R13,[(0x145902402,0x145902414)]),
             ('root',reg.UC_X86_REG_R13,[(0x14590feb0,0x14590feb7),(0x14590ff0f,0x14590ff16)]),
             ('unroot',reg.UC_X86_REG_RCX,[(0x1458f016f,0x1458f0176),(0x1458f01c1,0x1458f01c7)])]
    for role,base,spans in writers:
        for sequence in (1,0xffffffff):
            put(0x548,'I',sequence);u.reg_write(base,game);u.reg_write(reg.UC_X86_REG_RSI,game)
            for start,end in spans:run(start,end)
            assert u.reg_read(reg.UC_X86_REG_R8D)==sequence
            assert get(0x548,'I')==((sequence+1)&0xffffffff)
            results.append(dict(kind=role,sequence=sequence,next_sequence=get(0x548,'I')))
    # Native constructor: Game begins at RBP+30, the sequence and remembered speed
    # are adjacent but distinct scalar fields copied into the final Game value.
    u.reg_write(reg.UC_X86_REG_RBP,game+0x1000-0x30)
    run(0x1459009a9,0x1459009ca)
    assert struct.unpack('<If',u.mem_read(game+0x1000+0x548,8))==(1,7.0)
    results.append(dict(kind='constructor',sequence=1,remembered_speed=7.0))
    evidence=dict(engine='Unicorn '+__version__,target_sha256=hashlib.sha256(data).hexdigest(),
                  application_executed=False,cases=results,
                  seams=['Speed prefix stops before serializer call or no-change continuation.',
                         'Root/unroot counter read and post-queue increment replay separately; packet serialization and queue execution are not emulated.',
                         'Relocation cases execute counter read/increment only; floor and sink-test admission are outside these cases.'])
    out=ROOT/'runtime/player-mover-0.105.0';out.mkdir(parents=True,exist_ok=True)
    (out/'native-vectors.json').write_text(json.dumps(evidence,indent=2)+'\n')
    retained=json.loads((EVIDENCE/'player-mover-native-vectors.json').read_text())
    assert evidence==retained, 'Native mover vectors drifted from retained selected-target evidence'
    return len(results)


def main():
    args = argparse.ArgumentParser(description=__doc__)
    args.add_argument('--extract', action='store_true')
    options = args.parse_args()
    manifest = json.loads((EVIDENCE / 'player-mover-manifest.json').read_text())
    target_record = json.loads((ROOT / 'docs/analysis/target-refresh-0.105.0.json').read_text())
    target = ROOT / target_record['current_target']['path']
    data = target.read_bytes()
    assert hashlib.sha256(data).hexdigest() == manifest['target_sha256'] == target_record['current_target']['sha256']
    native_rows = manifest['ranges'] + manifest['constants']
    for row in native_rows:
        offset = int(row['file_offset'], 16)
        size = (int(row['end_exclusive'],16)-int(row['start'],16)
                if 'start' in row else len(bytes.fromhex(row['hex'])))
        raw = data[offset:offset+size]
        assert hashlib.sha256(raw).hexdigest() == row['sha256'], row['role']
        if 'hex' in row:
            assert raw.hex() == row['hex']
        else:
            assert (EVIDENCE / row['assembly']).is_file(), row['assembly']
        if options.extract and 'start' in row:
            output = ROOT / 'runtime/player-mover-0.105.0'
            output.mkdir(parents=True,exist_ok=True)
            (output / (row['role']+'.bin')).write_bytes(raw)
            plan = dict(target=str((output / (row['role']+'.bin')).relative_to(ROOT)),
                        output=str((output / ('rea-'+row['role'])).relative_to(ROOT)),
                        init_timeout=60,timeout=240,
                        open_options=dict(format='raw-binary',architecture='x86_64',entry_point=row['start']),
                        operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=row['start']))])
            (output / (row['role']+'-plan.json')).write_text(json.dumps(plan,indent=2)+'\n')
    for name in manifest['shared']:
        assert (EVIDENCE / name).is_file()

    # Compare both the reference f32 model and unchanged original instructions; no Rust runs.
    speeds = [(7.0,7.0,False),(7.0,7.005,False),(7.0,7.01,True),
              (7.0,7.011,True),(7.0,6.995,False),(7.0,6.98,True),
              (7.0,float('nan'),False),(float('nan'),8.0,False),
              (float('inf'),float('inf'),False)]
    for remembered,candidate,expected in speeds:
        difference=f32(f32(candidate)-f32(remembered))
        assert (abs(difference)>f32(0.01)) == expected
    native_count=native_vectors(data,speeds)
    sequence=1
    observed=[]
    for owner in ('speed','report-teleport','root','unroot'):
        observed.append((owner,sequence)); sequence=(sequence+1)&0xffffffff
    assert observed==[('speed',1),('report-teleport',2),('root',3),('unroot',4)]
    assert ((0xffffffff+1)&0xffffffff)==0

    base=ROOT/'crates/azeroth-survivors-re/src/gameplay'
    mover=(base/'mechanics/player_mover.rs').read_text()
    for fragment in ('sequence: 1, run_speed: 7.0','let counter = self.sequence;',
                     'self.sequence = self.sequence.wrapping_add(1);',
                     '(speed - self.run_speed).abs() > 0.01',
                     'self.player_mover.speed(7.0 * self.movement_multiplier())',
                     'self.events.retain(|event|'):
        require(mover,fragment)
    mechanics=(base/'mechanics.rs').read_text()
    require(mechanics,'movement_counter: 0,')
    require(mechanics,'player_mover: player_mover::PlayerMover::default(),')
    require(mechanics,'self.refresh_player_run_speed();\n        self.finish_boss_completion();')
    require((base/'mechanics/effects.rs').read_text(),'self.effect_state.numeric = numeric;\n        self.refresh_player_run_speed();')
    require((base/'mechanics/bosses.rs').read_text(),'self.root_player(true);')
    require((base/'mechanics/progression.rs').read_text(),'self.root_player(false);')
    host=(base/'mod.rs').read_text()
    require(host,'.relocate_player(position, report.facing);')
    require(host,'game.set_base_movement_multiplier(1.0 + race.move_bonus); game.finish_player_entry();')
    require(mover,'if !self.player_mover.ready { self.player_mover.ready = true; self.refresh_player_run_speed(); }')
    assert 'LocalPlayerCorrection' not in host
    bridge=(base/'client.rs').read_text()
    require(bridge,'let run_speed = game.player_run_speed();')
    assert 'request.run_speed = ' not in bridge
    events=(base/'client/events.rs').read_text()
    for variant in ('SessionEvent::ForceSpeedChange','SessionEvent::Teleport','SessionEvent::MoveMode'):
        require(events,variant)
    require(events,'RunEvent::PlayerMover(event)=>{packets.0.push(player_mover(event));None}')
    require(mechanics,'self.events.retain(|event| matches!(event, RunEvent::PlayerMover(_)));')
    terminal=(base/'terminal.rs').read_text()
    assert terminal.index('super::client::player_mover_messages(') < terminal.index('SessionEvent::Chat(ChatMessage')
    local=(ROOT/'crates/benilla-app/src/local_client/player.rs').read_text()
    assert 'let next_speeds = local_speeds(request.run_speed)' not in local
    for fragment in ('paused_mover_edges','session.active && session.paused && player.active',
                     'for mode in modes.drain()', 'super::wire_in::apply_move_mode(',
                     'super::wire_in::apply_teleport(', 'super::movement_net::ack_speeds_undriven('):
        require(local,fragment)
    wire=(ROOT/'crates/benilla-app/src/player/wire_in.rs').read_text()
    require(wire,'apply_move_mode(player, m, net_cmds);')
    require(wire,'apply_teleport(player, cam, t, time.elapsed_secs(), net_cmds);')
    require(wire,'player.modes.set(m.mode, m.apply);')
    print(f'PASS: target SHA-256; {len(native_rows)} native ranges/constants; {native_count} unchanged native instruction cases; shared wrapping sequence; source producer/queue/paused-client links.')
    print('Limits: bounded native prefixes with explicit serializer/queue seams and static source contracts; Rust regressions, builds, live packets, gameplay and visual parity are unrun.')


if __name__ == '__main__':
    main()

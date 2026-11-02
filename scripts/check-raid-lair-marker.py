#!/usr/bin/env python3
"""Current AS lair selection, visibility, localized labels and GossipPoi fields.

Original instructions execute in synthetic fixtures; no compiler/game/client.
"""
from script_sources import load_script
import argparse
import json
import math
import re
import struct
from coverage_common import ROOT

g = load_script('guardian_fixture', ROOT/'scripts/check-raid-guardian-lifecycle.py')
r = g.r
STAGE = ROOT/'runtime/native-evidence/0.112.0/raid-lair-marker'
KEPT = ROOT/'docs/analysis/evidence/0.112.0/raid-lair-marker'
RANGES = {'marker': (0x1459073c5, 0x145907826), 'packet': (0x1458c28a0, 0x1458c2b46)}
RANGES.update({'flag-read':(0x14005ca50,0x14005d01b),'flag-command':(0x14005d112,0x14005d129),
               'trim':(0x1400695f0,0x140069869),'command-dispatch':(0x1458bd380,0x1458be9e6),
               'flag-default':(0x1458fa7d3,0x1458fa7dd),'game-alias':(0x1458af541,0x1458af553),
               'cached-constructor':(0x1458bfc98,0x1458bfca6),'constructed-copy':(0x1458bff73,0x1458bff85)})
g.RANGES.clear()
g.RANGES.update(RANGES)


def total_key(value):
    bits = g.bits(value)
    signed = bits if bits < 0x80000000 else bits-0x100000000
    return signed ^ ((signed >> 31) & 0x7fffffff)


def selected(lairs, x):
    rows = [(i, g.f(math.sqrt(g.f(g.f((hx-x)*(hx-x))))))
            for i,(held,hx,deadline) in enumerate(lairs) if held]
    if not rows: rows = [(i,deadline) for i,(held,hx,deadline) in enumerate(lairs)]
    return min(rows, key=lambda row: total_key(row[1]))[0] if rows else None


def setup(machine, lairs, x=0.):
    machine.reset()
    game, frame = machine.game, machine.frame
    machine.put(game+0x4d0, '3f', x, 0., 7.)
    machine.put(game+0x670, 'QQ', machine.lairs, len(lairs))
    machine.put(frame+0x438, 'Q', game)
    machine.put(frame+0x2f0, 'Q', game+0xa4c)
    machine.put(game+0x620, '3Q', 16, machine.base+0x60000, 0)
    for i,(held,hx,deadline) in enumerate(lairs):
        machine.put(machine.lairs+40*i, 'Q', int(held))
        machine.put(machine.lairs+40*i+0x10, 'Q', 9)
        machine.put(machine.lairs+40*i+0x18, '3ff', hx, 0., 0., deadline)
    machine.u.reg_write(r.UC_X86_REG_RDI, game)
    machine.u.reg_write(r.UC_X86_REG_R9, len(lairs))
    machine.u.reg_write(r.UC_X86_REG_R13, 0x146bf2630)
    machine.u.reg_write(r.UC_X86_REG_R14, machine.lairs)
    machine.u.reg_write(r.UC_X86_REG_RSP, machine.stack+8)
    return game, frame


def native_checks(raw):
    machine = g.Machine(raw)
    machine.family = 'selection'
    count = 0
    sets = [[], [(0,0.,20.)], [(0,0.,20.),(0,100.,10.)],
            [(1,0.,20.),(1,100.,10.)], [(0,0.,20.),(1,100.,10.),(1,200.,5.)],
            [(0,0.,g.fb(0x7fc00000)),(0,100.,20.)], [(0,0.,-0.),(0,100.,0.)],
            [(0,0.,g.fb(0xffc00000)),(0,100.,20.)],
            [(1,0.,20.),(1,100.,10.),(1,200.,5.),(1,300.,0.)]]
    for lairs in sets:
        for x in [0.,50.,75.,100.,150.,250.]:
            setup(machine, lairs, x)
            end = machine.run(0x1459073c5, [0x1459074be,0x145907826])
            result = None if end == 0x145907826 else machine.u.reg_read(r.UC_X86_REG_RCX)
            assert result == selected(lairs,x), (lairs,x,result)
            count += 1

    def data_at(a,n):
        return raw(a,n) if 0x140000000 <= a < 0x149000000 else bytes(machine.u.mem_read(a,n))

    def make_string(at,data):
        dest = machine.allocate(len(data)+1)
        machine.u.mem_write(dest,data+b'\0')
        machine.put(at,'3Q',len(data),dest,len(data))

    def reserve():
        at = machine.u.reg_read(r.UC_X86_REG_RCX)
        used = machine.u.reg_read(r.UC_X86_REG_RDX)
        extra = machine.u.reg_read(r.UC_X86_REG_R8)
        cap,ptr,n = machine.get(at,'3Q')
        new = max(2*cap,used+extra)
        dest = machine.allocate(new)
        machine.u.mem_write(dest,bytes(machine.u.mem_read(ptr,n)))
        machine.put(at,'3Q',new,dest,n)

    publications = 0
    machine.family = 'publication'
    for held in [0,1]:
        for shown in [0,1]:
            for previous in [None,0,1]:
                for visible in [0,1]:
                    for age in [0.,299.999,300.,g.fb(g.bits(300.)+1),301.,math.nan,math.inf,-math.inf]:
                        for localized in [False,True]:
                            game,frame = setup(machine, [(0,0.,20.),(held,100.,10.)],25.)
                            machine.put(game,'QQ',int(previous is not None),previous or 0)
                            machine.put(game+0xacc,'BB',shown,visible)
                            machine.put(game+0xa4c,'f',age)
                            machine.put(game+0xa70,'f',0.)
                            machine.u.reg_write(r.UC_X86_REG_RCX,1)
                            machine.u.reg_write(r.UC_X86_REG_XMM1,g.bits(25.))
                            machine.seams[0x145898dc0] = lambda: machine.u.reg_write(r.UC_X86_REG_RAX,0)
                            machine.seams[0x145c0d470] = reserve
                            ptr,length = struct.unpack('<QQ',raw(0x146bf2630+0x78,16))
                            definition = ptr+9*80
                            fallback_ptr,fallback_len = struct.unpack('<QQ',raw(definition+16,16))
                            fallback = raw(fallback_ptr,fallback_len)
                            identity = struct.unpack('<I',raw(definition+32,4))[0]
                            calls = []

                            def format_string():
                                dest = machine.u.reg_read(r.UC_X86_REG_RCX)
                                fmt = machine.u.reg_read(r.UC_X86_REG_RDX)
                                arg = machine.u.reg_read(r.UC_X86_REG_R8)
                                item = machine.get(arg,'Q')[0]
                                if fmt == 0x146be3ec8:
                                    data = b'enemy.'+str(struct.unpack('<I',data_at(item,4))[0]).encode()
                                    calls.append(('key',data))
                                else:
                                    p,n = machine.get(item,'QQ')
                                    assert fmt in [0x146c0bc98,0x146c0bca6]
                                    data = data_at(p,n)+(b' (Guardian)' if fmt == 0x146c0bc98 else b"'s lair (empty)")
                                    calls.append(('label',data))
                                make_string(dest,data)

                            def lookup():
                                keyptr = machine.u.reg_read(r.UC_X86_REG_RCX)
                                keylen = machine.u.reg_read(r.UC_X86_REG_RDX)
                                assert bytes(machine.u.mem_read(keyptr,keylen)) == b'enemy.'+str(identity).encode()
                                if localized:
                                    p = machine.allocate(4)
                                    machine.u.mem_write(p,b'Name')
                                    machine.u.reg_write(r.UC_X86_REG_RAX,p)
                                    machine.u.reg_write(r.UC_X86_REG_RDX,4)
                                else:
                                    machine.u.reg_write(r.UC_X86_REG_RAX,0)
                                    machine.u.reg_write(r.UC_X86_REG_RDX,0)

                            machine.seams[0x145bdd130] = format_string
                            machine.seams[0x14598ddd0] = lookup
                            machine.run(0x1459074be,[0x145907826])
                            cap,ptr,n = machine.get(game+0x620,'3Q')
                            expected = bool(visible) if not shown else not(previous == 1 and visible and not(age > 300.))
                            assert n == int(expected), (held,shown,previous,visible,age,n)
                            assert machine.get(game,'QQ') == (1,1)
                            assert machine.get(game+0xacd,'B')[0] == int(bool(shown))
                            assert machine.get(game+0xa70,'I')[0] == g.bits(age if shown and expected else 0.)
                            if expected:
                                cap,p,length = machine.get(ptr,'3Q')
                                opcode = machine.get(ptr+24,'H')[0]
                                payload = bytes(machine.u.mem_read(p,length))
                                assert opcode == 0x224
                                assert struct.unpack('<IffII',payload[:20]) == (99,100. if shown else 25.,0.,6,0)
                                name = ((b'Name' if localized else fallback)+(b' (Guardian)' if held else b"'s lair (empty)")) if shown else b''
                                assert payload[20:] == name+b'\0'
                                assert len(calls) == (2 if shown else 0)
                            else: assert not calls
                            publications += 1
    return {'selection_profiles':count,'publication_profiles':publications},machine


def flag_input(machine,raw):
    machine.family = 'flag-cvar-input'
    cases = 0
    names = ['hudClock','hudBosses','hudTally','hudBuild','hudBanners','hudLoot','hudMeter','hudLevels','hudFlag']
    values = [None,'','0',' 0 ','\u00a00\u00a0','00','0.0','false','1',' 1 ','-0','+0','\x000']
    def data(a,n): return raw(a,n) if a > 0x140000000 else bytes(machine.u.mem_read(a,n))
    for registered in [0,1]:
        for previous in [0,1,2]:
            for value in values:
                machine.reset()
                guard,last = machine.actor,machine.actor+0x100
                machine.put(guard,'B',registered)
                machine.put(last,'B',previous)
                reads,registrations = [],[]
                def register():
                    a = machine.u.reg_read(r.UC_X86_REG_RDX)
                    n = machine.u.reg_read(r.UC_X86_REG_R8)
                    registrations.append(data(a,n).decode())
                    a = machine.u.reg_read(r.UC_X86_REG_R9)
                    assert data(a,1) == b'1'
                    assert machine.get(machine.u.reg_read(r.UC_X86_REG_RSP)+0x28,'Q')[0] == 1
                def read():
                    dest = machine.u.reg_read(r.UC_X86_REG_RCX)
                    a = machine.u.reg_read(r.UC_X86_REG_R8)
                    n = machine.u.reg_read(r.UC_X86_REG_R9)
                    name = data(a,n).decode()
                    reads.append(name)
                    selected_value = value if name == 'hudFlag' else '1'
                    if selected_value is None: machine.put(dest,'q',-1)
                    else:
                        content = selected_value.encode()
                        ptr = machine.allocate(len(content)+1)
                        machine.u.mem_write(ptr,content+b'\0')
                        machine.put(dest,'3Q',len(content),ptr,len(content))
                machine.seams[0x140569cf0] = register
                machine.seams[0x14056d3d0] = read
                machine.u.reg_write(r.UC_X86_REG_RDX,machine.world)
                machine.u.reg_write(r.UC_X86_REG_R8,guard)
                machine.u.reg_write(r.UC_X86_REG_R9,last)
                end = machine.run(0x14005ca50,[0x14005d01b,0x14005d129])
                visible = value is None or value.strip() != '0'
                assert machine.get(last,'B')[0] == int(visible)
                assert (end == 0x14005d01b) == (previous == 2 or previous != int(visible))
                assert registrations == ([] if registered else names)
                assert reads == names and machine.get(guard,'B')[0] == 1
                cases += 1
    machine.family = 'flag-command-publication'
    for value in [0,1]:
        machine.reset()
        machine.put(machine.actor+0x10,'Q',machine.world)
        machine.u.reg_write(r.UC_X86_REG_RAX,machine.actor)
        machine.u.reg_write(r.UC_X86_REG_EDX,value)
        captured = []
        def channel():
            ptr = machine.u.reg_read(r.UC_X86_REG_RDX)
            captured.append((machine.u.reg_read(r.UC_X86_REG_RCX),machine.get(ptr,'IB')))
        machine.seams[0x1400116a0] = channel
        machine.run(0x14005d112,[0x14005d129])
        assert captured == [(machine.world,(0x17,value))]
    machine.family = 'flag-command-consumption'
    for value in [0,1]:
        for presence in [0,1,2]:
            machine.reset()
            machine.put(machine.game+0x10,'I',presence)
            machine.put(machine.game+0xadc,'B',7)
            machine.put(machine.actor,'IB',0x17,value)
            machine.u.reg_write(r.UC_X86_REG_RCX,machine.game)
            machine.u.reg_write(r.UC_X86_REG_RDX,machine.actor)
            machine.seams[0x145c09870] = lambda: None  # Win64 stack probe leaves RAX size unchanged.
            machine.run(0x1458bd380,[0x1458be8de])
            assert machine.get(machine.game+0x1195,'B')[0] == value
            assert machine.get(machine.game+0xadc,'B')[0] == (7 if presence == 2 else value)
    machine.family = 'flag-default'
    machine.reset()
    machine.run(0x1458fa7d3,[0x1458fa7dd])
    assert machine.get(machine.frame+0xaf4,'I')[0] == 1
    machine.family = 'game-alias'
    machine.reset()
    machine.put(machine.frame+0x568,'Q',machine.game)
    machine.run(0x1458af541,[0x1458af553])
    assert machine.get(machine.frame+0x528,'Q')[0] == machine.game+0x10
    for value in [0,1]:
        machine.family = 'cached-constructor'
        machine.reset()
        machine.put(machine.game+0x1195,'B',value)
        machine.put(machine.frame-0x40,'Q',1)
        machine.u.reg_write(r.UC_X86_REG_R13,machine.game)
        machine.run(0x1458bfc98,[0x1458bfca6])
        assert machine.get(machine.frame+0xa8c,'B')[0] == value
        machine.u.reg_write(r.UC_X86_REG_RSI,machine.lairs)
        machine.run(0x1458bff73,[0x1458bff85])
        assert machine.get(machine.lairs+0xacc,'B')[0] == value
        # The constructed aggregate is the incoming value in the caller frame;
        # execute its actual installation copy into Client+10 independently.
        machine.family = 'constructed-install'
        machine.u.mem_write(machine.frame+0xa90,bytes(machine.u.mem_read(machine.lairs,0xae0)))
        machine.put(machine.game+0x10,'I',2)
        machine.u.reg_write(r.UC_X86_REG_RSI,machine.game)
        machine.run(0x1458be756,[0x1458be78c])
        assert machine.get(machine.game+0xadc,'B')[0] == value
    return {'cvar_reads':cases,'command_publications':2,'command_consumptions':6,'default':1,'game_alias':1,
            'cached_constructor':2,'constructed_install':2}


def source_checks():
    base = ROOT/'crates/azeroth-survivors-re/src/gameplay'
    source = (base/'mechanics/addon_lists.rs').read_text()
    select = source[source.index('fn select_addon_flag'):source.index('pub fn addon_guardian_awake')]
    for token in ['lair.active_guid.is_some()', '(y * y + x * x).sqrt()', 'left.1.total_cmp(&right.1).is_le()', '(index, lair.respawn_at)']:
        assert token in select
    show = source[source.index('pub fn update_world_flag'):source.index('pub(super) fn invalidate_world_flag')]
    assert 'let Some(index) = self.addon_flag else { return };' in show
    assert 'self.world_flag.selected = Some(index);' in show
    assert re.search(r'if !shown \{.*?if self.world_flag.visible \{.*?enemy: None.*?return;',show,re.S)
    assert 'previous == Some(index) && self.world_flag.visible' in show
    assert '!(self.clock - self.world_flag.last_sent > 300.)' in show
    assert 'self.world_flag.last_sent = self.clock;' in show
    assert 'position: player' in show and 'x: lair.home.x, y: lair.home.y, z: lair.home.z' in show
    invalidate = source[source.index('pub(super) fn invalidate_world_flag'):source.index('fn select_addon_flag')]
    assert 'self.addon_flag = None;' in invalidate and 'self.world_flag.selected = None;' in invalidate
    events = (base/'client/events.rs').read_text()
    body = events[events.index('RunEvent::GuardianFlag'):events.index('RunEvent::PlayerMover(event)=>')]
    for token in ['format!("enemy.{id}")', 'format!("{name} (Guardian)")', 'format!("{name}\'s lair (empty)")',
                  'flags:99,pos:[position.x,position.y],icon:6,data:0,name', 'SessionEvent::GossipPoi']:
        assert token in body
    settings = (base/'run_hud/settings.rs').read_text()
    assert '("flag", "hudFlag")' in settings and 'value.trim() != "0"' in settings
    assert 'visible: [true; 9]' in settings
    live = (base/'mod.rs').read_text()
    assert 'game.update_world_flag(Position::from(position), hud_settings.shown("flag"))' in live
    return {'source_files':4,'existing_client_interface':'SessionEvent::GossipPoi','client_internals_recovered':False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage',action='store_true')
    args = parser.parse_args()
    mod = g.load()
    target,raw,span,graph,headers = mod.recover()
    mod.check_graph(graph,headers)
    counts,machine = native_checks(raw)
    counts['flag_inputs'] = flag_input(machine,raw)
    source = source_checks()
    out = STAGE if args.stage else KEPT
    if args.stage: out.mkdir(parents=True,exist_ok=True)
    mod.verify_rea_operations(raw,out,target['sha256'])
    pe = mod.load('marker_pe','scripts/inventory-executable.py').PE(g.target_bytes(target))
    functions = {(pe.image_base+a,pe.image_base+b) for a,b,_ in pe.functions()}
    owners = [(0x1458fb890,0x145908680),RANGES['packet'],(0x14005ca50,0x14005d452),
              RANGES['command-dispatch'],(0x1458bf6d0,0x1458bffb2),(0x1458f9cf0,0x1458fb23d),
              (0x1458aee30,0x1458b1f7d),RANGES['trim']]
    assert all(pair in functions for pair in owners)
    assert raw(0x1458bfc54,4) == bytes.fromhex('488d4dc0')
    assert raw(0x1458bfc5e,1) == b'\xe8' and 0x1458bfc63+struct.unpack('<i',raw(0x1458bfc5f,4))[0] == 0x1458f9cf0
    assert raw(0x145907244,7) == bytes.fromhex('48c70700000000')
    assert raw(0x146c060d0,4) == struct.pack('<f',300.)
    formats = [(0x146be3ec8,b'\x06enemy.\xc0\x00'),(0x146c0bc98,b'\xc0\x0b (Guardian)\x00'),(0x146c0bca6,b"\xc0\x0f's lair (empty)\x00")]
    assert all(raw(a,len(value)) == value for a,value in formats)
    command_table = 0x146c0832c
    assert command_table+struct.unpack('<i',raw(command_table+4*(0x17-2),4))[0] == 0x1458bdaa4
    canonical = {}
    paths = ['raid-guardian-lifecycle/selected-native.asm','raid-lifecycles/selected-native.asm',
             'raid-forced-position/selected-native.asm','raid-frame-continuation/selected-native.asm',
             'raid/queue.asm','raid-hazards/dispatcher.asm']
    for path in paths:
        file = ROOT/'docs/analysis/evidence/0.112.0'/path
        # The two families form one consumer repair. Stage may reference its
        # exact companion candidate before root promotes the pair together.
        if args.stage and not file.exists() and path.startswith('raid-forced-position/'):
            file = ROOT/'runtime/native-evidence/0.112.0'/path
        for line in file.read_text().splitlines():
            hit = re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
            if hit: canonical.setdefault(int(hit[1],16),(bytes.fromhex(hit[2]),'../'+path))
    new,traces = {},{}
    for family,rows in machine.visited.items():
        intervals = []
        for a,value in sorted(rows.items()):
            prior = canonical.get(a)
            owner = prior[1] if prior and prior[0] == value else 'selected-native.asm'
            if owner == 'selected-native.asm': new[a] = value
            if intervals and intervals[-1][1] == a and intervals[-1][2] == owner: intervals[-1][1] += len(value)
            else: intervals.append([a,a+len(value),owner])
        traces[family] = [dict(**span(a,b-a),assembly=owner) for a,b,owner in intervals]
    assembly = ''
    for a,value in sorted(new.items()):
        ins = list(machine.md.disasm(value,a))
        assert sum(i.size for i in ins) == len(value)
        assembly += ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in ins)
    proof = dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,
                 cases=counts,source_checks=source,visited_instruction_ranges=traces,
                 PE_owners=[span(a,b-a) for a,b in owners],
                 refresh_age=span(0x146c060d0,4),format_records=[span(a,len(value)) for a,value in formats],
                 spawn_invalidation=dict(**span(0x145907244,7),assembly='../raid-guardian-lifecycle/selected-native.asm'),
                 flag_input=dict(cvar='hudFlag',cvar_bytes=span(0x145db3905,7),command_kind=0x17,
                                 command_table_entry=span(command_table+4*(0x17-2),4),client_flag='0x1195',
                                 game_alias='Client+0x10',client_game_flag='0xadc',game_flag='0xacc',
                                 constructor_stack_mapping='Fresh Game aggregate starts at RBP+0x28; RBP+0xaf4 is Game+0xacc. Its aggregate copy is canonical in raid-guardian-lifecycle. Caller-owned SRET at RBP-0x40 is independently bound by 1458bfc54/1458bfc5e; cached Client+1195 overwrites RBP+0xa8c before the actual 0xae0-byte return/install copies.',
                                 constructor_SRET=span(0x1458bfc54,4),constructor_call=span(0x1458bfc5e,5)),
                 seams={'allocation':['allocation/free','memcpy','0x145c0d470 byte-vector reserve'],
                        'AS_inputs':['0x145898dc0 selects current catalog zone0','0x14598ddd0 locale lookup injects absent or Name'],
                        'formatting':['0x145bdd130 captures current format record, actual definition ID or name and produces the corresponding string'],
                        'existing_CVar_interface':['0x140569cf0 registration capture','0x14056d3d0 optional text read','0x1400116a0 channel command capture; current AS consumer separately executes'],
                        'resource_and_platform':['GameClient channel resource supplied at its current resolved field','0x145c09870 Win64 stack probe leaves RAX unchanged']},
                 limits=['This binds AS selection/visibility/refresh/labels and the actual current native GossipPoi payload producer.',
                         'Formatting, locale lookup, allocation and reserve remain explicit typed seams. This does not reimplement or certify those shared engine providers.',
                         'The existing SessionEvent::GossipPoi client interface remains the reused port. No compiler, Rust execution, game, controller, network/client/rendering or parity comparison.'])
    for name,value in {'selected-native.asm':assembly,'manifest.json':json.dumps(proof,indent=2)+'\n'}.items():
        if args.stage: (out/name).write_text(value)
        else: assert (out/name).read_text() == value,name
    print(json.dumps(counts,indent=2))
    print('Current AS lair marker checks passed; no compilation/game/client')


if __name__ == '__main__': main()

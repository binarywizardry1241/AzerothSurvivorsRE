#!/usr/bin/env python3
"""Replay bounded current terminal startup/error/stop contracts; never compile or launch."""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/terminal-errors'


def require(value, why):
    if not value:
        raise ValueError(why)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', default='runtime/tool-state/python/armory/python-libs')
    parser.add_argument('--output', default='runtime/analysis/history/findings/gap9-errors/cb8cc9546353/native-check.json')
    args = parser.parse_args()
    libs, output = [(ROOT / value).resolve() for value in (args.python_libs, args.output)]
    require(libs.is_relative_to(ROOT) and output.is_relative_to(ROOT / 'runtime'), 'Paths leave checkout/runtime')
    sys.path.insert(0, str(libs))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    require(all(target[k] == v for k, v in manifest['target'].items()), 'Evidence belongs to another target')
    data = target_bytes(target)
    module = load_script('native_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        require(offset is not None, f'Unmapped target address {address:#x}')
        return data[offset:offset + count]

    roles = {row['role']: row for row in manifest['ranges']}
    for row in manifest['ranges']:
        a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
        require(hashlib.sha256(raw(a, b - a)).hexdigest() == row['sha256'], row['role'])
        for key in ('assembly', 'pseudocode'):
            if key in row:
                require(hashlib.sha256((EVIDENCE / row[key]).read_bytes()).hexdigest() == row[key + '_sha256'], key)
    imports = {int(row['iat_start_address'],16)+8*index: (row['library'],name)
               for row in pe.imports() for index,name in enumerate(row['functions'])}
    for row in manifest.get('import_contracts',[]):
        require(imports.get(int(row['iat_address'],16))==(row['library'],row['function']), 'Driver close-handle import')
    table = struct.unpack('<12i', raw(0x146BE7534, 48))
    require(0x146BE7534 + table[8] == 0x1458B573F, 'Command10 branch')
    require(raw(0x146E96438, 29) == b'spawn the rogue server thread', 'Driver panic context')
    require(struct.unpack('<Q', raw(0x146E96478, 8))[0] == 0x146E96455, 'Driver source location path')
    require(struct.unpack('<II', raw(0x146E96488, 8)) == (26, 10), 'Driver source location')

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        off, count = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[off:off + count])
    scratch, size = 0x200000000, 0x100000
    machine.mem_map(scratch, size)
    context, seams, vectors = {}, set(), []
    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def word(a): return struct.unpack('<Q', machine.mem_read(a, 8))[0]
    def put(a, v): machine.mem_write(a, struct.pack('<Q', v & ((1 << 64) - 1)))
    def number(a): return struct.unpack('<f', machine.mem_read(a, 4))[0]
    def floating(a, v): machine.mem_write(a, struct.pack('<f', v))
    def return_now():
        sp = read('RSP'); write('RIP', word(sp)); write('RSP', sp + 8)
    def allocate(n):
        address = context['arena']; context['arena'] = (address + max(n, 1) + 15) & ~15
        require(context['arena'] < scratch + 0xE0000, 'Scratch exhausted')
        return address
    def hook(_, address, count, unused):
        if address in context['stops']:
            machine.emu_stop(); return
        if address == 0x1458E7D9C:
            seams.add('detached thread-handle close import')
            write('RIP', address + 6); return
        if address in (0x140002200, 0x1400021C0, 0x1400021D0, 0x145B9D380, 0x1458E04F0,
                       0x14590FC10, 0x14591DA20, 0x145945240, 0x145BF4CB0, 0x1458D0220,
                       0x1458BFDD0, 0x145944640):
            # The two complete recovered owners run unless a caller-specific seam selects them.
            if address == 0x14591DA20 and context['kind'] == 'freeze':
                pass
            elif address == 0x145944640 and context['kind'] == 'abandon':
                pass
            else:
                seams.add(hex(address))
                if address == 0x1400021C0:
                    write('RAX', 0 if context.get('allocation_fails') else allocate(read('RCX')))
                elif address == 0x145B9D380:
                    name = read('R8')
                    require(bytes(machine.mem_read(word(name + 8), word(name + 16))) == b'rogue-server', 'Thread name')
                elif address == 0x1458E04F0:
                    out = read('RCX')
                    if context['spawn_ok']:
                        first, second = allocate(32), allocate(32)
                        put(first, 2); put(second, 2)
                        put(out, first); put(out + 8, second); put(out + 16, 0xAABBCCDD)
                    else:
                        put(out, 0); put(out + 8, 0xBAD)
                elif address == 0x14590FC10:
                    context['destroyed'].append(read('RCX'))
                elif address == 0x14591DA20:
                    context['freeze_called'] += 1
                elif address == 0x145945240:
                    require(read('R8') == 0x1471EF9C1 and read('R9') == 6, 'Result reason defeat')
                    # Deliberate-departure flag is a separate field consumed by result JSON.
                    machine.mem_write(read('RCX'), bytes(24))
                elif address == 0x145BF4CB0:
                    vector = read('RCX'); length = word(vector + 16); old = word(vector + 8)
                    storage = allocate(128 * 24)
                    if length: machine.mem_write(storage, bytes(machine.mem_read(old, length * 24)))
                    put(vector, 128); put(vector + 8, storage)
                elif address == 0x1458D0220:
                    context['height_queries'] += 1
                    supplied = context['height']
                    write('RAX', int(supplied is not None))
                    write('XMM0', struct.unpack('<I', struct.pack('<f', supplied or 0.0))[0])
                elif address == 0x1458BFDD0:
                    point = list(struct.unpack('<3f', machine.mem_read(read('R8'), 12)))
                    context['packets'].append(dict(guid=read('RDX'), point=point, serial=read('R9') & 0xFFFFFFFF))
                    machine.mem_write(read('RCX'), bytes(32))
                elif address == 0x145944640:
                    write('RAX', context['abandon_result'])
                return_now(); return
        require(any(a <= address and address + count <= b for a, b in context['ranges']), f'Unreviewed instruction {address:#x}')
        require(bytes(machine.mem_read(address, count)) == raw(address, count), 'Instruction bytes changed')
    def on_write(_, access, address, count, value, unused):
        require(scratch <= address and address + count <= scratch + size, f'Write leaves scratch {address:#x}')
    machine.hook_add(UC_HOOK_CODE, hook); machine.hook_add(UC_HOOK_MEM_WRITE, on_write)
    stop = scratch + size - 16
    def reset(kind, selected, stops=()):
        machine.mem_write(scratch, bytes(size)); machine.mem_write(stop, b'\xcc')
        for name in ('RAX','RBX','RCX','RDX','RSI','RDI','R8','R9','R10','R11','R12','R13','R14','R15','RBP'):
            write(name, 0)
        write('EFLAGS', 2); write('RSP', scratch + 0x1F008); put(read('RSP'), stop)
        context.clear(); context.update(kind=kind, arena=scratch+0x60000, ranges=[(int(roles[r]['start'],16),int(roles[r]['end_exclusive'],16)) for r in selected], stops=set(stops)|{stop}, packets=[], destroyed=[], freeze_called=0, height_queries=0)
    def run(address):
        try: machine.emu_start(address, 0, count=100000)
        except Exception as error: raise RuntimeError(f'Native stop {read("RIP"):#x}: {error}') from error
        require(read('RIP') in context['stops'], 'Instruction limit reached')

    for allocation_fails, spawn_ok in [(True, False), (False, False), (False, True)]:
        reset('spawn', ['driver-spawn'], [0x145D934FB, 0x145D93810])
        context.update(allocation_fails=allocation_fails, spawn_ok=spawn_ok)
        write('RCX', scratch + 0x1000); run(0x1458E7CC0)
        expected = 0x145D934FB if allocation_fails else stop if spawn_ok else 0x145D93810
        require(read('RIP') == expected, 'Driver failure ownership')
        if not allocation_fails and not spawn_ok:
            require(read('RCX') == 0x146E96438 and read('RDX') == 29, 'Spawn context literal')
            require(word(read('R8')) == 0xBAD, 'Spawn preserves OS error')
            require(word(read('RSP') + 40) == 0x146E96478, 'Spawn panic location')
        vectors.append(dict(kind='driver-spawn', allocation_fails=allocation_fails, spawn_ok=spawn_ok, stop=hex(expected)))
    for phase in range(256):
        reset('abandon', ['menu-return-precondition'])
        game = scratch + 0x30000; choices = scratch + 0x35000
        put(game + 0x658, 2); put(game + 0x650, choices)
        put(game + 0x630, 8); put(game + 0x638, scratch + 0x37000)
        machine.mem_write(game + 0xAC7, bytes([phase])); floating(game+0xA34, 12.5)
        before = bytes(machine.mem_read(game,0xB00)); write('RCX',game); run(0x145944640)
        admitted = 1 <= phase <= 3
        require((read('RAX') & 255) == admitted, 'Phase1..3 admission')
        if admitted:
            require(word(game+0x658)==0 and context['destroyed']==[choices,choices+0xA0], 'Choice clearing/order')
            require(list(machine.mem_read(game+0xAC5,3)) == [255,0,4] and machine.mem_read(game+0xAB7,1)==b'\1','Terminal flags')
            require(number(game+0x97C)==12.5 and context['freeze_called']==1 and word(game+0x640)==1,'Frozen clock/result publication')
        else: require(bytes(machine.mem_read(game,0xB00))==before,'Nonactive phase must not mutate')
        vectors.append(dict(kind='command10-abandon', phase=phase, admitted=admitted))
    for game_tag in (0,1,2):
        for result in (0,1):
            reset('dispatch',['command10-dispatch'],[0x1458B5756,0x1458B6478])
            server=scratch+0x30000; put(server+16,game_tag);write('RSI',server);context['abandon_result']=result
            run(0x1458B573F)
            require(read('RIP')==(0x1458B6478 if game_tag!=2 and result else 0x1458B5756),'Command10 return/precondition route')
            vectors.append(dict(kind='command10-route', game_tag=game_tag, abandonment=result, stop=hex(read('RIP'))))
    scenarios=[(0.,0.,0.),(0.,4.,0.),(0.,4.,2.),(0.,4.,4.),(0.,4.,5.),(4.,0.,2.),(4.,-1.,2.),(0.,-1.,2.),(float('nan'),4.,2.),(0.,float('nan'),2.),(0.,4.,float('nan'))]
    for family in ('hostile','combat','companion'):
        for started,duration,now in scenarios:
            for height in (None,7.0):
                for dead in ((False,True) if family=='hostile' else (False,)):
                    reset('freeze',['terminal-freeze'])
                    context['height']=height
                    game,row=scratch+0x30000,scratch+0x35000
                    pointer,length,stride,guid_at,motion_at=(0x560,0x568,0x1D8,0xF0,0x174) if family=='hostile' else (0xD0,0xD8,0x78,0x20,0x40) if family=='combat' else (0x940,0x948,0x70,0x38,0x40)
                    put(game+pointer,row);put(game+length,1);put(row+guid_at,0x12345)
                    put(game+0x618,128);put(game+0x620,scratch+0x40000)
                    if family=='hostile':machine.mem_write(row+0xB0,struct.pack('<I',int(dead)))
                    machine.mem_write(row+motion_at,struct.pack('<8f',0.,2.,4.,8.,6.,12.,started,duration))
                    floating(game+0xA34,now);machine.mem_write(game+0xA64,struct.pack('<I',0xFFFFFFFF));write('RCX',game)
                    before=bytes(machine.mem_read(row,stride));run(0x14591DA20)
                    admitted=(not(now>=started+duration)) if family=='companion' else (not dead and duration>0. and started+duration>now)
                    require(len(context['packets'])==int(admitted),'Movement admission')
                    if admitted:
                        values=struct.unpack('<8f',machine.mem_read(row+motion_at,32))
                        require(values[0:3]==values[3:6] or all((a==b or a!=a and b!=b) for a,b in zip(values[:3],values[3:6])),'Stopped endpoints')
                        require(values[6]==now or values[6]!=values[6] and now!=now,'Stop start clock')
                        require(values[7]==0.0 and context['packets'][0]['serial']==0,'Duration/serial wrap')
                        if duration <= 0.0:
                            expected_point = [8.,6.,12.]
                        else:
                            fraction = (now-started)/duration
                            if fraction == fraction: fraction = min(1.,max(0.,fraction))
                            expected_point = [8.*fraction, 2.+4.*fraction, 4.+8.*fraction]
                        if height is not None: expected_point[2] = height
                        matches = lambda a,b: a==b or math.isnan(a) and math.isnan(b)
                        require(all(matches(a,b) for a,b in zip(values[:3],expected_point)), 'Interpolation/primary terrain fallback')
                        require(all(matches(a,b) for a,b in zip(context['packets'][0]['point'],expected_point)), 'Stop packet position')
                        require(context['height_queries']==1,'Exactly one primary-height sample')
                        if family!='hostile':require(number(row+(0x60 if family=='companion' else 0x64))==now or now!=now,'Follower deadline')
                    else:require(bytes(machine.mem_read(row,stride))==before,'Inactive movement remains untouched')
                    vectors.append(dict(kind='terminal-freeze',family=family,started=started,duration=duration,now=now,height=height,dead=dead,admitted=admitted,packets=context['packets']))
    reset('freeze',['terminal-freeze'])
    context['height']=None
    game=scratch+0x30000
    put(game+0x618,128);put(game+0x620,scratch+0x40000)
    floating(game+0xA34,2.0);machine.mem_write(game+0xA64,struct.pack('<I',0xFFFFFFFD))
    expected_guids=[]
    for family,(pointer,length,stride,guid_at,motion_at,base) in enumerate([
        (0x560,0x568,0x1D8,0xF0,0x174,scratch+0x35000),
        (0xD0,0xD8,0x78,0x20,0x40,scratch+0x38000),
        (0x940,0x948,0x70,0x38,0x40,scratch+0x39000)]):
        put(game+pointer,base);put(game+length,2)
        for index in range(2):
            row=base+index*stride;guid=(family+1)*100+index
            put(row+guid_at,guid);expected_guids.append(guid)
            machine.mem_write(row+motion_at,struct.pack('<8f',0.,2.,4.,8.,6.,12.,0.,4.))
    write('RCX',game);run(0x14591DA20)
    require([p['guid'] for p in context['packets']]==expected_guids,'Three-collection row/packet order')
    require([p['serial'] for p in context['packets']]==[0xFFFFFFFE,0xFFFFFFFF,0,1,2,3],'Shared serial order/wrap')
    vectors.append(dict(kind='terminal-freeze-three-collection-order',packets=context['packets']))
    # Source checks supplement the documented producer/call/consumer tracing; no Rust executes.
    movement=(ROOT/manifest['source_refs'][0]).read_text()
    progression=(ROOT/manifest['source_refs'][1]).read_text()
    pause=(ROOT/manifest['source_refs'][3]).read_text()
    gameplay=(ROOT/manifest['source_refs'][4]).read_text()
    events=(ROOT/manifest['source_refs'][5]).read_text()
    for text,tokens in [(movement,['self.actors.iter_mut()','self.bosses.iter_mut()','self.pet_state.rows.iter_mut()','self.demon_state.rows.iter_mut()','self.loot_companion_state.actors','RunEvent::StoppedMovement']), (progression,['self.freeze_world_movements(height)','self.discard_choice_offers()']), (pause,['if !session.started || terminal','floor.terrain_ref().and_then(|terrain| terrain.height(xy))']), (gameplay,['filter(|_| started)','game.abandon(|xy| floor.terrain_ref()']), (events,['RunEvent::StoppedMovement','packets.0.push(stopped(target,position,serial))'])]:
        for token in tokens:require(''.join(token.split()) in ''.join(text.split()),f'Source connection missing: {token}')
    output.parent.mkdir(parents=True,exist_ok=True)
    output.write_text(json.dumps(dict(target=manifest['target'],vectors=vectors,seams=sorted(seams),limits=manifest['limitations']),indent=2)+'\n')
    print(f'{len(vectors)} current native startup/precondition/stop cases passed; hash-bound ranges and live source connections checked')


if __name__=='__main__':main()

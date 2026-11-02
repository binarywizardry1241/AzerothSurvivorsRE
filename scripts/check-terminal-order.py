#!/usr/bin/env python3
"""Check current terminal vector order without compiling or launching a game.

Unicorn runs only the reviewed PE windows. Allocations, terrain, packet creation
and memcpy are explicit seams; writes may only touch project-local scratch RAM.
Python chronology vectors and source tracing do not execute the changed Rust.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/0.109.0/terminal-order'
MASK64 = (1 << 64) - 1


def require(value, message):
    if not value:
        raise ValueError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', default='runtime/armory-recovery/python-libs')
    parser.add_argument('--output', default='runtime/terminal-gap9-0.109.0/native-check.json')
    args = parser.parse_args()
    libs, output = [(ROOT / value).resolve() for value in (args.python_libs, args.output)]
    require(libs.is_relative_to(ROOT) and output.is_relative_to(ROOT / 'runtime'), 'Paths leave checkout/runtime')
    sys.path.insert(0, str(libs))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    require(all(target[key] == value for key, value in manifest['target'].items()), 'Evidence belongs to another target')
    data = target_bytes(target)
    module = load_script('terminal_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        require(offset is not None, 'Unmapped native range')
        return data[offset:offset + count]

    roles = {row['role']: row for row in manifest['ranges']}
    for row in manifest['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        require(hashlib.sha256(raw(start, end - start)).hexdigest() == row['sha256'], row['role'])
        for key in ('assembly', 'pseudocode'):
            if key in row:
                require(hashlib.sha256((EVIDENCE / row[key]).read_bytes()).hexdigest() == row[key + '_sha256'], key)

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        off, size = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[off:off + size])
    scratch, size = 0x200000000, 0x100000
    machine.mem_map(scratch, size)
    stop = scratch + size - 16
    context, vectors, seams = {}, [], set()
    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def word(address): return struct.unpack('<Q', machine.mem_read(address, 8))[0]
    def put(address, value): machine.mem_write(address, struct.pack('<Q', value & MASK64))
    def allocate(count):
        address = context['arena']; context['arena'] = (address + max(count, 1) + 15) & ~15
        require(context['arena'] < scratch + 0xE0000, 'Scratch exhausted')
        return address
    def return_now():
        sp = read('RSP'); write('RIP', word(sp)); write('RSP', sp + 8)
    def hook(_, address, count, unused):
        if address in context['stops']:
            machine.emu_stop(); return
        if address in (0x1458D6F90, 0x1458C6B40, 0x145BFABE0, 0x1400021D0, 0x145BFA0E7):
            seams.add(hex(address))
            if address == 0x1458D6F90:
                write('RAX', 0)  # Primary-height miss retains interpolated Z.
            elif address == 0x1458C6B40:
                point = list(struct.unpack('<3f', machine.mem_read(read('R8'), 12)))
                context['packets'].append((read('RDX'), read('R9') & 0xFFFFFFFF, point))
                machine.mem_write(read('RCX'), bytes(32))
            elif address == 0x145BFABE0:
                vector = read('RCX'); length = word(vector + 16); previous = word(vector + 8)
                storage = allocate(64 * 24)
                if length: machine.mem_write(storage, bytes(machine.mem_read(previous, length * 24)))
                put(vector, 64); put(vector + 8, storage)
            elif address == 0x145BFA0E7:
                machine.mem_write(read('RCX'), bytes(machine.mem_read(read('RDX'), read('R8'))))
                write('RAX', read('RCX'))
            return_now(); return
        require(context['start'] <= address and address + count <= context['end'], f'Unreviewed instruction {address:#x}')
        require(bytes(machine.mem_read(address, count)) == raw(address, count), 'Instruction bytes changed')
    def on_write(_, access, address, count, value, unused):
        require(scratch <= address and address + count <= scratch + size, f'Write leaves scratch {address:#x}')
    machine.hook_add(UC_HOOK_CODE, hook); machine.hook_add(UC_HOOK_MEM_WRITE, on_write)
    def reset(role, stops=()):
        machine.mem_write(scratch, bytes(size)); machine.mem_write(stop, b'\xcc')
        for name in ('RAX','RBX','RCX','RDX','RSI','RDI','R8','R9','R10','R11','R12','R13','R14','R15','RBP'):
            write(name, 0)
        write('EFLAGS', 2); write('RSP', scratch + 0x1F008); put(read('RSP'), stop)
        row = roles[role]
        context.clear(); context.update(start=int(row['start'],16), end=int(row['end_exclusive'],16),
            stops={stop, *stops}, arena=scratch + 0x60000, packets=[])
    def run(address=None):
        machine.emu_start(address or context['start'], 0, count=100000)
        require(read('RIP') in context['stops'], 'Instruction budget exhausted')

    # Three actual hostile appenders preserve existing rows and append exactly
    # one 0x1d8 record. Capacity is supplied; allocation failure is not replayed.
    for role, register, source_offset in [('ordinary-append','RSI',-0x40),
                                         ('guardian-append','R13',0x70),
                                         ('boss-append','RSI',-0x40)]:
        for count in range(7):
            reset(role, [int(roles[role]['end_exclusive'],16)])
            game, rows, bp = scratch + 0x30000, scratch + 0x35000, scratch + 0x45000
            put(game + 0x558, 16); put(game + 0x560, rows); put(game + 0x568, count)
            previous = bytes([0x5A]) * (count * 0x1D8); machine.mem_write(rows, previous)
            record = bytes((index * 7 + count) & 255 for index in range(0x1D8))
            machine.mem_write(bp + source_offset, record); write('RBP', bp); write(register, game)
            run()
            require(word(game + 0x568) == count + 1, 'Hostile append count')
            require(bytes(machine.mem_read(rows, len(previous))) == previous, 'Hostile append reordered old rows')
            require(bytes(machine.mem_read(rows + count * 0x1D8, 0x1D8)) == record, 'Hostile append payload')
            vectors.append(dict(kind=role, count=count))
    for count in range(7):
        reset('combat-follower-create', [0x1459671A0])
        game, rows, origin = scratch+0x30000, scratch+0x35000, scratch+0x45000
        put(game+0xC8,16); put(game+0xD0,rows); put(game+0xD8,count)
        before=bytes([0x5A])*(count*0x78);machine.mem_write(rows,before)
        write('RSI',game);write('RBX',origin);write('RBP',scratch+0x47000);write('R14',0xFEDCBA9876543210)
        run()
        require(word(game+0xD8)==count+1 and word(rows+count*0x78+0x20)==0xFEDCBA9876543210,'Follower append')
        require(bytes(machine.mem_read(rows,len(before)))==before,'Follower append reordered old rows')
        vectors.append(dict(kind='follower-append',count=count))
    # Replay every retirement mask for up to six follower rows. The native
    # compactor copies survivors forward in their original relative order.
    for count in range(7):
        for mask in range(1 << count):
            reset('combat-follower-retention',[0x145932485,0x145932492,0x145932499])
            game,rows,bp,removed=scratch+0x30000,scratch+0x35000,scratch+0x45000,scratch+0x47000
            put(game+0xD0,rows);put(game+0xD8,count);put(bp+0x328,removed)
            kept=[];deleted=[]
            for index in range(count):
                payload=bytearray([index+1]*0x78);struct.pack_into('<Q',payload,0x20,index+100)
                machine.mem_write(rows+index*0x78,bytes(payload))
                if mask >> index & 1:deleted.append(index+100)
                else:kept.append(bytes(payload))
            for index,guid in enumerate(deleted):put(removed+index*16,guid)
            write('R13',game);write('RBP',bp);write('RBX',len(deleted));run()
            require(word(game+0xD8)==len(kept),'Retirement count')
            require(bytes(machine.mem_read(rows,len(kept)*0x78))==b''.join(kept),'Retirement changed survivor order')
            vectors.append(dict(kind='follower-retain',count=count,mask=mask))
    # Rows older than a full GUID cycle must precede newer rows, even when
    # their low GUID serial is equal. Splits model the real adapter collections.
    chronologies=[[1,2,3,4],[1,0x1000001,0x2000001,0x3000001],
                  [0xFFFFFFFE,0xFFFFFFFF,0x100000000,0x100000001],
                  [MASK64-2,MASK64,0,2]]
    old_disagreements=0
    for orders in chronologies:
        current=(orders[-1]+3)&MASK64
        for split in range(16):
            merged=[i for i in range(4) if split>>i&1]+[i for i in range(4) if not(split>>i&1)]
            actual=sorted(merged,key=lambda i:-((current-orders[i])&MASK64))
            require(actual==list(range(4)),'Full chronology source transcription')
            old=sorted(merged,key=lambda i:-((current-(orders[i]&0xFFFFFF))&0xFFFFFF))
            old_disagreements+=old!=actual
            reset('terminal-freeze')
            game=scratch+0x30000;put(game+0x618,64);put(game+0x620,scratch+0x50000)
            machine.mem_write(game+0xA34,struct.pack('<f',2.0));machine.mem_write(game+0xA64,struct.pack('<I',0xFFFFFFFE))
            expected=[]
            for family,(pointer,length,stride,guid_at,motion_at,base) in enumerate([
                (0x560,0x568,0x1D8,0xF0,0x174,scratch+0x35000),
                (0xD0,0xD8,0x78,0x20,0x40,scratch+0x39000),
                (0x940,0x948,0x70,0x38,0x40,scratch+0x3B000)]):
                put(game+pointer,base);put(game+length,4)
                for index in actual:
                    row=base+index*stride;guid=0xF130000000000000|((family+1)<<24)|(orders[index]&0xFFFFFF)
                    put(row+guid_at,guid);expected.append(guid)
                    machine.mem_write(row+motion_at,struct.pack('<8f',index,2,4,index+8,6,12,0,4))
            write('RCX',game);run()
            require([p[0] for p in context['packets']]==expected,'Native collection/row packet order')
            require([p[1] for p in context['packets']]==[(0xFFFFFFFF+i)&0xFFFFFFFF for i in range(12)],'Movement serial wrap')
            require([p[2][0] for p in context['packets']]==[float(i+4) for i in range(4)]*3,
                    'Native row order remains distinguishable when GUIDs alias')
            vectors.append(dict(kind='terminal-order',orders=orders,split=split,packets=context['packets']))
    require(old_disagreements>0,'Vectors must expose the repaired GUID-cycle defect')

    # These guards supplement reviewed producer/consumer tracing. They are not
    # compilation or execution of the Rust code.
    texts={path:(ROOT/path).read_text() for path in manifest['source_refs']}
    counter=texts['crates/azeroth-survivors-re/src/native_counter.rs']
    for token in ['Arc<AtomicU64>','fn next_ordered','self.next_ordered().0','(sequence as u32, sequence)',
                  'let (serial, order) = counter.next_ordered()','u64::from(serial & 0x00ff_ffff)']:
        require(''.join(token.split()) in ''.join(counter.split()),'Counter pairing: '+token)
    movement=texts['crates/azeroth-survivors-re/src/gameplay/mechanics/terminal_movement.rs']
    require('self.counter.sequence()' in movement and '0x00ff_ffff' not in movement,'Terminal still sorts truncated GUIDs')
    for path,tokens in manifest['source_connections'].items():
        compact=''.join(texts[path].split())
        for token in tokens:require(''.join(token.split()) in compact,path+': '+token)
    output.parent.mkdir(parents=True,exist_ok=True)
    output.write_text(json.dumps(dict(target=manifest['target'],vectors=vectors,
        native_executions=len(vectors), native_append_retention_executions=155,
        native_terminal_stop_executions=64, python_merge_model_cases=64,
        python_old_guid_order_disagreements=old_disagreements,
        seams=sorted(seams),limits=manifest['limitations']),indent=2)+'\n')
    print(f'{len(vectors)} bounded native executions passed (155 append/retention, 64 terminal stop); '
          f'64 Python merge-model cases expose {old_disagreements} old GUID-order disagreements; '
          'paired source paths traced; no compilation or game launch')


if __name__=='__main__':main()

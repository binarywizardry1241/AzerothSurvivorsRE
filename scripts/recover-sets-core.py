#!/usr/bin/env python3
"""Recover bounded current set descriptors from isolated original instructions.

No application, OS calls, compiler or server runs. Allocation and roundf are
explicit synthetic seams. Only the exact constructor body may execute.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

START, END = 0x145ac1b40, 0x145ac3ddc
ALLOCATOR, ROUNDF = 0x142d22130, 0x145febc75
ACTIVATION, SET_ID, CATALOG, FREE = 0x145ac4160, 0x145ac19f0, 0x145b01970, 0x1400021d0
OUTPUT = ROOT / 'runtime/fixgap-sets-0.121.0/descriptor-replay.json'


def recover():
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED, UC_HOOK_MEM_READ
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    assert target['version'] == '0.121.0'
    assert target['sha256'] == '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
    data = target_bytes(target)
    pe = load_script('sets_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    heap, stack, out, stop = 0x22000000, 0x23000000, 0x22000000, 0x2301fff0
    for a, n in ((heap, 0x10000), (stack, 0x20000)):
        machine.mem_map(a, n)
    pages = set()
    read_spans = set()
    state = {}

    def load_page(address):
        base = address & -0x1000
        if base in pages:
            return True
        try:
            offset = pe.rva_offset(base - pe.image_base)
        except ValueError:
            return False
        machine.mem_map(base, 0x1000)
        machine.mem_write(base, data[offset:offset + 0x1000])
        pages.add(base)
        return True

    def unmapped(_uc, _access, address, _size, _value, _context):
        return load_page(address)

    def qword(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def ret(value=None):
        if value is not None:
            machine.reg_write(reg.UC_X86_REG_RAX, value)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, qword(sp))
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(_uc, address, _size, _context):
        state['instructions'] += 1
        if address == START and state.get('capture_descriptor'):
            state['captured_descriptor'] = dict(class_id=machine.reg_read(reg.UC_X86_REG_RDX)&255, tier=machine.reg_read(reg.UC_X86_REG_R8), multiplier=struct.unpack('<f',struct.pack('<I',machine.reg_read(reg.UC_X86_REG_XMM3)&0xffffffff))[0])
            machine.emu_stop()
        elif address == 0x1401a86e0 and state.get('capture_four_piece'):
            pointer=machine.reg_read(reg.UC_X86_REG_RDX);end=machine.reg_read(reg.UC_X86_REG_R8)
            assert 0<end-pointer<=16 and (end-pointer)%8==0
            offset=pe.rva_offset(pointer-pe.image_base);raw=data[offset:offset+end-pointer]
            read_spans.add((pointer,end));state['four_piece_rows']=[dict(tag=struct.unpack_from('<I',raw,at)[0],bits=hex(struct.unpack_from('<I',raw,at+4)[0])) for at in range(0,len(raw),8)]
            state['four_piece_pointer']=hex(pointer)
            machine.emu_stop()
        elif address == 0x145c86fb0 and state.get('capture_four_piece'):
            ret(0) # class/set-name construction is not used by the immediate tier-table selector
        elif address == 0x145c86fb0 and state.get('capture_set_id'):
            bp=machine.reg_read(reg.UC_X86_REG_RBP)
            state['decoded_set_id']=dict(class_id=machine.mem_read(bp+0xff,1)[0],tier=qword(bp+0xe0),horde_pvp=bool(machine.mem_read(bp+0xfe,1)[0]))
            machine.emu_stop()
        elif address == stop:
            state['returned'] = True
            machine.emu_stop()
        elif address == ALLOCATOR:
            size = machine.reg_read(reg.UC_X86_REG_RCX)
            assert 0 < size <= 0x400 and size % 64 == 0, size
            allocation = heap + 0x1000 + len(state['allocations']) * 0x1000
            state['allocations'].append((allocation, size))
            ret(allocation)
        elif address == 0x145b01e65 and state.get('capture_gear_prefix'):
            bp=machine.reg_read(reg.UC_X86_REG_RBP)
            state['gear_fields']=dict(class_id=machine.reg_read(reg.UC_X86_REG_RDI),slot=machine.reg_read(reg.UC_X86_REG_R12),rarity=machine.reg_read(reg.UC_X86_REG_R15),tier=qword(bp+0xc0))
            machine.emu_stop()
        elif address == 0x145b03a30 and state.get('capture_gear_prefix'):
            state['class_lookup']=machine.reg_read(reg.UC_X86_REG_RCX)&0xffffffff
            ret(1)  # explicit class-catalog-presence seam, before later item membership validation
        elif address == CATALOG and not state.get('capture_gear_prefix'):
            item = machine.reg_read(reg.UC_X86_REG_RDX)&0xffffffff
            state.setdefault('catalog_requests',[]).append(item)
            dest = machine.reg_read(reg.UC_X86_REG_RCX)
            value = state.get('catalog',{}).get(item)
            machine.mem_write(dest,bytes(0x70))
            if value is None:
                machine.mem_write(dest,struct.pack('<q',-1))
            else:
                class_id,slot,tier = value
                machine.mem_write(dest+0x30,struct.pack('<Q',tier))
                machine.mem_write(dest+0x48,struct.pack('<Q',slot))
                machine.mem_write(dest+0x69,bytes([class_id]))
            ret(dest)
        elif address == FREE:
            ret()
        elif address == ROUNDF:
            bits = machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
            value = struct.unpack('<f', struct.pack('<I', bits))[0]
            rounded = math.copysign(math.floor(abs(value) + 0.5), value)
            machine.reg_write(reg.UC_X86_REG_XMM0, struct.unpack('<I', struct.pack('<f', rounded))[0])
            ret()
        else:
            assert START <= address < END or 0x145ac0f90 <= address < 0x145ac10de or state.get('capture_gear_prefix') and 0x145b01970 <= address < 0x145b02c35 or 0x145ac1180 <= address < 0x145ac1292 or SET_ID <= address < 0x145ac1b40 or ACTIVATION <= address < 0x145ac4478, hex(address)

    def read_native(_uc, _access, address, size, _value, _context):
        if pe.image_base <= address < pe.image_base + 0x10000000:
            read_spans.add((address,address+size))

    machine.hook_add(UC_HOOK_MEM_READ,read_native)
    machine.hook_add(UC_HOOK_MEM_UNMAPPED, unmapped)
    machine.hook_add(UC_HOOK_CODE, hook)

    def raw_string(pointer, count):
        if not (pe.image_base < pointer < pe.image_base + 0x10000000 and 0 < count < 512):
            return None
        try:
            offset = pe.rva_offset(pointer - pe.image_base)
            text = data[offset:offset + count].decode('utf8')
            if len(text.encode()) == count and all(c.isprintable() or c == '\n' for c in text):
                read_spans.add((pointer,pointer+count))
                return text
            return None
        except (ValueError, UnicodeError):
            return None

    cases = []
    steps = 0
    for class_id in range(13):
        for tier in range(7):
            for multiplier in (1.0, 1.5, 2.0):
                state.clear()
                state.update(instructions=0, allocations=[])
                machine.mem_write(heap, bytes(0x10000))
                machine.mem_write(stack, bytes(0x20000))
                for name in ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15'):
                    machine.reg_write(getattr(reg,'UC_X86_REG_' + name), 0)
                for i in range(16):
                    machine.reg_write(getattr(reg,'UC_X86_REG_XMM' + str(i)), 0)
                machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
                machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x1f008)
                machine.mem_write(stack + 0x1f008, struct.pack('<Q', stop))
                machine.reg_write(reg.UC_X86_REG_RCX, out)
                machine.reg_write(reg.UC_X86_REG_RDX, class_id)
                machine.reg_write(reg.UC_X86_REG_R8, tier)
                machine.reg_write(reg.UC_X86_REG_XMM3, struct.unpack('<I', struct.pack('<f', multiplier))[0])
                machine.emu_start(START, stop, count=1000)
                assert machine.reg_read(reg.UC_X86_REG_RIP) == stop, (class_id, tier, multiplier, hex(machine.reg_read(reg.UC_X86_REG_RIP)))
                steps += state['instructions']
                row = dict(class_id=class_id, tier=tier, multiplier=multiplier)
                if qword(out) == 0xffffffffffffffff:
                    row['present'] = False
                else:
                    capacity, pointer, count, name, name_count, desc, desc_count = struct.unpack('<7Q', machine.mem_read(out, 56))
                    assert count <= capacity <= 16
                    row.update(present=True, name=raw_string(name,name_count), description=raw_string(desc,desc_count),
                               display_values=list(struct.unpack('<2f',machine.mem_read(out+56,8))),effects=[])
                    assert row['name'] and row['description']
                    for i in range(count):
                        payload = bytearray(machine.mem_read(pointer + 64*i,64))
                        strings=[]
                        lists=[]
                        # Native condition selector2's KeyList is a pointer/length
                        # array of exact Rust string slices, not an inline string.
                        # Inspect it before scalar string fields so its outer
                        # descriptor cannot survive in source-owned payloads.
                        list_offsets = [32] if payload[0] == 7 and struct.unpack_from('<I',payload,24)[0] == 2 else []
                        for at in list_offsets:
                            list_pointer,list_count=struct.unpack_from('<QQ',payload,at)
                            if 0<list_count<32:
                                values=[]
                                try:
                                    offset=pe.rva_offset(list_pointer-pe.image_base)
                                    for j in range(list_count):
                                        value=raw_string(*struct.unpack_from('<QQ',data,offset+16*j))
                                        if value is None:
                                            break
                                        values.append(value)
                                except (ValueError,struct.error):
                                    continue
                                if len(values)==list_count:
                                    lists.append(dict(offset=at,values=values))
                                    read_spans.add((list_pointer,list_pointer+16*list_count))
                                    payload[at:at+16]=bytes(16)
                        string_offsets = {0:(16,48),1:(16,48),4:(40,),6:(32,),7:() if list_offsets else (32,),
                            8:(40,),9:(32,),10:(16,),11:(32,),14:(16,),15:(32,),16:(32,),24:(16,),38:(16,)}.get(payload[0],())
                        for at in string_offsets:
                            pair=struct.unpack_from('<QQ',payload,at)
                            value=raw_string(*pair)
                            if value is not None:
                                strings.append(dict(offset=at,value=value))
                                payload[at:at+16]=bytes(16)
                        remaining=[]
                        for at in range(57):
                            value=struct.unpack_from('<Q',payload,at)[0]
                            try:
                                pe.rva_offset(value-pe.image_base)
                            except ValueError:
                                continue
                            if pe.image_base<=value<pe.image_base+0x10000000:
                                remaining.append(dict(offset=at,pointer=hex(value)))
                        assert not remaining,(class_id,tier,multiplier,payload[0],remaining)
                        row['effects'].append(dict(raw_hex=payload.hex(),strings=strings,lists=lists))
                cases.append(row)
    consumer_cases = []
    def run_consumer(entry, items=None, stars=None, catalog=None, class_id=1, item_id=None, capture=False):
        state.clear()
        state.update(instructions=0, allocations=[],catalog=catalog or {},capture_descriptor=capture)
        machine.mem_write(heap,bytes(0x10000));machine.mem_write(stack,bytes(0x20000))
        for name in ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15'):
            machine.reg_write(getattr(reg,'UC_X86_REG_'+name),0)
        machine.reg_write(reg.UC_X86_REG_EFLAGS,2)
        machine.reg_write(reg.UC_X86_REG_RSP,stack+0x1f008)
        machine.mem_write(stack+0x1f008,struct.pack('<Q',stop))
        if item_id is not None:
            machine.reg_write(reg.UC_X86_REG_RCX,item_id)
        else:
            assert len(items)==len(stars)==19
            machine.mem_write(heap+0x4000,struct.pack('<19I',*items))
            machine.mem_write(heap+0x5000,bytes(stars))
            if capture:
                machine.reg_write(reg.UC_X86_REG_RCX,out)
                machine.reg_write(reg.UC_X86_REG_RDX,class_id)
                machine.reg_write(reg.UC_X86_REG_R8,heap+0x4000)
                machine.reg_write(reg.UC_X86_REG_R9,heap+0x5000)
            else:
                machine.reg_write(reg.UC_X86_REG_RCX,heap+0x4000)
                machine.reg_write(reg.UC_X86_REG_RDX,heap+0x5000)
        machine.emu_start(entry,stop,count=20000)
        assert machine.reg_read(reg.UC_X86_REG_RIP)==stop or state.get('captured_descriptor')
        return dict(tier=machine.reg_read(reg.UC_X86_REG_RAX),discriminant=machine.reg_read(reg.UC_X86_REG_RDX)&255,
                    descriptor=state.get('captured_descriptor'),requests=state.get('catalog_requests',[]),steps=state['instructions'])
    for tier in range(6):
        for count in (0,4,7,8):
            for rank in (0,2,3,4,5,255):
                ids=[1]*count+[0]*(19-count);ranks=[rank]*19
                observed=run_consumer(ACTIVATION,ids,ranks,{1:(1,0,tier)})
                expected=(tier,int(rank>=5)) if count>=8 and rank>=3 else (6,2)
                assert (observed['tier'],observed['discriminant'])==expected,(tier,count,rank,observed)
                consumer_cases.append(dict(operation='activation',tier=tier,count=count,minimum_rank=rank,observed=observed))
    for tier in range(6):
        for slot in (0,7,8,18):
            for class_id in (0,1,11):
                observed=run_consumer(SET_ID,item_id=110000,catalog={110000:(class_id,slot,tier)})
                expected=0xa000+(class_id<<4)+tier if class_id and slot<8 else 0
                assert observed['tier']==expected
                consumer_cases.append(dict(operation='set_id',class_id=class_id,slot=slot,tier=tier,observed=observed))
    for tier in range(6):
        ids=[110060]*8+[0]*11
        observed=run_consumer(ACTIVATION,ids,[3]*19,{110050:(1,0,tier)})
        assert (observed['tier'],observed['discriminant'])==(tier,0)
        assert observed['requests'].count(110050)==8 and 110060 not in observed['requests']
        consumer_cases.append(dict(operation='pvp_armor_normalization',tier=tier,observed=observed))
    for rank in (2,3,4,5,255):
        observed=run_consumer(0x145ac0f90,[1]*8+[0]*11,[rank]*19,{1:(1,0,2)},class_id=7,capture=True)
        expected=None if rank<3 else dict(class_id=7,tier=2,multiplier=1.5 if rank>=5 else 1.0)
        assert observed['descriptor']==expected,(rank,observed)
        consumer_cases.append(dict(operation='live_descriptor_input',minimum_rank=rank,observed=observed))
    for prefix in (0,0xa000,0x1a000,0x1234a000):
        for class_id in range(13):
            for nibble in range(16):
                item_id=prefix+(class_id<<4)+nibble
                state.clear();state.update(instructions=0,allocations=[],capture_set_id=True)
                machine.mem_write(heap,bytes(0x10000));machine.mem_write(stack,bytes(0x20000))
                machine.reg_write(reg.UC_X86_REG_RSP,stack+0x1f008)
                machine.mem_write(stack+0x1f008,struct.pack('<Q',stop))
                machine.reg_write(reg.UC_X86_REG_RCX,out);machine.reg_write(reg.UC_X86_REG_RDX,item_id)
                machine.emu_start(0x145ac1180,stop,count=1000)
                tier=5 if nibble==15 else nibble
                expected=dict(class_id=class_id,tier=tier,horde_pvp=nibble==15) if item_id>=0xa000 and tier<6 and class_id in (1,2,3,4,5,7,8,9,11) else None
                assert state.get('decoded_set_id')==expected,(hex(item_id),state,expected)
                consumer_cases.append(dict(operation='set_id_decoder',item_id=item_id,observed=dict(decoded=state.get('decoded_set_id'),steps=state['instructions'])))
    for value in list(range(0,12040,10))+list(range(1,12000,101)):
        item_id=100000+value
        state.clear();state.update(instructions=0,allocations=[],capture_gear_prefix=True)
        machine.mem_write(heap,bytes(0x10000));machine.mem_write(stack,bytes(0x20000))
        machine.reg_write(reg.UC_X86_REG_RSP,stack+0x1f008)
        machine.mem_write(stack+0x1f008,struct.pack('<Q',stop))
        machine.reg_write(reg.UC_X86_REG_RCX,out);machine.reg_write(reg.UC_X86_REG_RDX,item_id)
        machine.emu_start(CATALOG,stop,count=1000)
        rarity=value//10%10
        expected=dict(class_id=value//1000,slot=value//100%10,rarity=rarity,tier=5 if rarity==6 else rarity) if value<=11999 and value%10==0 and rarity<7 else None
        assert state.get('gear_fields')==expected,(item_id,state,expected)
        if expected is not None:
            assert state['class_lookup']==expected['class_id']
        consumer_cases.append(dict(operation='gear_metadata_prefix',item_id=item_id,observed=dict(fields=state.get('gear_fields'),steps=state['instructions'])))
    four_piece_rows=[]
    for tier in range(6):
        state.clear();state.update(instructions=0,allocations=[],capture_four_piece=True)
        machine.mem_write(heap,bytes(0x10000));machine.mem_write(stack,bytes(0x20000))
        machine.reg_write(reg.UC_X86_REG_RSP,stack+0x1f008)
        machine.mem_write(stack+0x1f008,struct.pack('<Q',stop))
        machine.reg_write(reg.UC_X86_REG_RCX,out);machine.reg_write(reg.UC_X86_REG_RDX,0xa010+tier)
        machine.emu_start(0x145ac1180,stop,count=1000)
        assert state.get('four_piece_rows')
        row=dict(tier=tier,pointer=state['four_piece_pointer'],rows=state['four_piece_rows'])
        four_piece_rows.append(row)
        consumer_cases.append(dict(operation='four_piece_table_selector',observed=dict(**row,steps=state['instructions'])))
    steps += sum(row['observed']['steps'] for row in consumer_cases)

    merged=[]
    for a,b in sorted(read_spans):
        if merged and a <= merged[-1][1]:
            merged[-1][1]=max(merged[-1][1],b)
        else:
            merged.append([a,b])
    native_data=[]
    for a,b in merged:
        offset=pe.rva_offset(a-pe.image_base);raw=data[offset:offset+b-a]
        native_data.append(dict(virtual_address=hex(a),file_offset=hex(offset),byte_count=b-a,sha256=hashlib.sha256(raw).hexdigest(),bytes_hex=raw.hex()))
    start_offset=pe.rva_offset(START-pe.image_base)
    return dict(target={k:target[k] for k in ('version','path','sha256','size_bytes')},
                constructor=dict(virtual_address=hex(START),file_offset=hex(start_offset),byte_count=END-START,
                                 sha256=hashlib.sha256(data[start_offset:start_offset+END-START]).hexdigest()),
                synthetic_seams=['Allocator142d22130 returns zero-filled test memory; native unwritten padding has no inferred meaning.',
                                 'Roundf145febc75 uses explicit nearest-away synthetic rounding; Windows CRT implementation is not recovered here.',
                                 'Catalog145b01970 supplies explicit synthetic metadata tuples(class,slot,tier); this validates consumers, not the catalog producer.',
                                 'Deallocation1400021d0 is a no-op synthetic ownership seam.',
                                 'Class lookup145b03a30 reports synthetic presence for compact-ID prefix cases; later actual item-membership validation is excluded.',
                                 'SetTip class-name builder145c86fb0 is skipped only when capturing the immediately following tier-table selector; numeric rows are original current data.'],
                cases=cases,consumer_cases=consumer_cases,four_piece_rows=four_piece_rows,native_data=native_data,original_instruction_steps=steps,mapped_native_pages=len(pages),
                limits='Isolated descriptor/activation/set-ID and live multiplier-input instruction replay. Catalog publication is a synthetic seam; full actual gear producer and downstream effect dispatch are not executed. Multiplier1.0/1.5 is established by the current live helper;2.0 is a boundary fixture only. No application, OS, network, server or rebuilt source executes.',
                application_executed=False,parity_verified=False)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    parser.add_argument('--asset',action='store_true',help='Publish pointer-free ordinary/empowered descriptors consumed by sets.rs')
    args=parser.parse_args()
    result=recover()
    if args.write:
        OUTPUT.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')
    if args.asset:
        entries=[]
        for row in result['cases']:
            if row['present'] and row['multiplier'] in (1.0,1.5):
                entries.append(dict(class_id=row['class_id'],tier=row['tier'],empowered=row['multiplier']==1.5,
                    spell_key=row['name'],description=row['description'],display_values=row['display_values'],effects=row['effects']))
        asset=dict(target_sha256=result['target']['sha256'],entries=entries)
        (ROOT/'crates/azeroth-survivors-re/assets/sets-0.121.0.json').write_text(json.dumps(asset,indent=2,ensure_ascii=False)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ('cases','consumer_cases','native_data')},indent=2))
    print('cases:',len(result['cases']),'present:',sum(row['present'] for row in result['cases']), 'consumer_cases:',len(result['consumer_cases']))

if __name__=='__main__':
    main()

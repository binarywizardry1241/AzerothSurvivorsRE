#!/usr/bin/env python3
"""Current addon producer/load contracts; unchanged native instructions, no build/game."""
from script_sources import load_script
import argparse
import hashlib
import json
import math
import re
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
EVIDENCE = ROOT/'docs/analysis/evidence/0.109.0/addon-bridge'

def encoded(v):return json.dumps(v,indent=2,ensure_ascii=False,allow_nan=False)+'\n'

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');ap.add_argument('--prepare-rea',action='store_true');args=ap.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target)
    module = load_script('addon_contract_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    def raw(a,n):o=pe.rva_offset(a-pe.image_base);return data[o:o+n]
    def span(a,b):return dict(va=hex(a),file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=b-a,sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
    # Every selected helper's reviewed body remains bound to installed bytes.
    rea=json.loads((EVIDENCE/'producer-rea.json').read_text());assert rea['target_sha256']==SHA
    extents={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    for row in rea['owners']:
        a=int(row['va'],16);n=row['byte_count'];assert pe.rva_offset(a-pe.image_base)==int(row['file_offset'],16)
        assert hashlib.sha256(raw(a,n)).hexdigest()==row['sha256']
        assert extents.get(a,a+n)==a+n
        if 'pseudocode'in row:assert hashlib.sha256((ROOT/row['pseudocode']).read_bytes()).hexdigest()==row['pseudocode_sha256']
        if 'assembly'in row:assert hashlib.sha256((ROOT/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256']
    if args.prepare_rea:
        work=ROOT/'runtime/addon-bridge-0.109.0/producers/reproduce-rea';work.mkdir(parents=True,exist_ok=True)
        clusters=[]
        for row in sorted(rea['owners'],key=lambda row:int(row['va'],16)):
            a=int(row['va'],16)
            if not clusters or a-(int(clusters[-1][-1]['va'],16)+clusters[-1][-1]['byte_count'])>0x200000:clusters.append([])
            clusters[-1].append(row)
        for index,rows in enumerate(clusters,1):
            folder=work/f'group-{index:02}';folder.mkdir(exist_ok=True)
            lo=int(rows[0]['va'],16);hi=max(int(row['va'],16)+row['byte_count']for row in rows);carrier=bytearray(hi-lo)
            for row in rows:
                a=int(row['va'],16);carrier[a-lo:a-lo+row['byte_count']]=raw(a,row['byte_count'])
            (folder/'owners.bin').write_bytes(carrier)
            (folder/'seeds.tsv').write_text(''.join(f"{row['va']}\tfunction\n{row['va']}\tcode\n"for row in rows))
            plan=dict(target=str((folder/'owners.bin').relative_to(ROOT)),output=str((folder/'rea').relative_to(ROOT)),init_timeout=60,timeout=240,
                environment={'REA_GHIDRA_SEED_FILE':str((folder/'seeds.tsv').relative_to(ROOT))},
                open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(lo)),
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=row['va']),label=row['role'])for row in rows])
            (folder/'plan.json').write_text(encoded(plan));print((folder/'plan.json').relative_to(ROOT))
        return
    def pair(a):p,n=struct.unpack('<QQ',raw(a,16));assert n<10000;return raw(p,n).decode()
    def call(a,b):assert raw(a,1)==b'\xe8' and a+5+struct.unpack('<i',raw(a+1,4))[0]==b
    # The selected native WorldStateFrame patcher is called before server creation.
    call(0x1458915c0,0x1459a7290);call(0x1459a7367,0x145913300)
    assert raw(0x147234d7c,38)==b'Interface\\FrameXML\\WorldStateFrame.lua'
    assert raw(0x1472261dc,12028)==(ROOT/'docs/analysis/evidence/0.108.0/addon-api.lua').read_bytes()
    # Current API-only spell metadata, independently of gameplay catalogs.
    spells=[dict(key=pair(a),name=pair(a+16),icon=pair(a+32),spell=struct.unpack('<I',raw(a+64,4))[0]) for i in range(113) for a in [0x146be1c18+i*120]]
    assert spells==json.loads((ROOT/'crates/azeroth-survivors-re/assets/addon-spell-metadata-0.105.0.json').read_text())
    # Revalidate format bytes using selected-image occurrences, never old RVAs.
    historical=json.loads((ROOT/'docs/analysis/evidence/0.105.0/addon-bridge/native-manifest.json').read_text())
    formats=[]
    for row in historical['format_bytes']+[dict(role='spell-row',**historical['spell_row']['format'])]:
        blob=bytes.fromhex(row['hex']);at=data.find(blob);assert at>=0,row['role']
        formats.append(dict(role=row['role'],**span(pe.offset_va(at),pe.offset_va(at)+len(blob)),fields=row.get('fields')))
    ledger=json.loads((EVIDENCE/'producer-fields.json').read_text());assert ledger['target_sha256']==SHA
    by_format={row['role']:row for row in formats};scalar_fields=0
    for row in ledger['streams']:
        if 'native_format'not in row:assert row['live_input'];continue
        actual=[key for group in row['fields']for key in group['keys']]
        expected=[field['name']for field in by_format[row['native_format']]['fields']]
        assert sorted(actual)==sorted(expected)and len(set(actual))==len(actual)
        assert all(group['live_input']for group in row['fields']);scalar_fields+=len(actual)
    assert scalar_fields==129 and len(ledger['streams'])==16
    sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    class Probe:
        def __init__(self):
            self.u=Uc(UC_ARCH_X86,UC_MODE_64)
            self.u.mem_map(0x20000000,0x20000);self.u.mem_map(0x30000000,0x10000)
            self.u.reg_write(r.UC_X86_REG_RSP,0x20010000);self.u.reg_write(r.UC_X86_REG_RBP,0x20001000)
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED,self.missing);self.u.hook_add(UC_HOOK_CODE,self.hook);self.stops=set();self.stopped=None
        def missing(self,u,access,a,n,v,_):
            page=a&~4095;u.mem_map(page,4096);u.mem_write(page,raw(page,4096));return True
        def hook(self,u,a,n,_):
            if a in self.stops:self.stopped=a;u.emu_stop()
        def run(self,a,stops):self.stops=set(stops);self.u.emu_start(a,0,count=1000);assert self.stopped in self.stops
        def put(self,a,*v):self.u.mem_write(a,struct.pack('<'+'Q'*len(v),*v))
    cases=[]
    # Zone/End identity comes from the active Game, not the editable Pick/Menu.
    # Native descriptors and the full raw u8 domain execute without allocator,
    # localization, or number-formatting replacement seams.
    identity_owners=json.loads((EVIDENCE/'rea.json').read_text())
    for row in identity_owners['owners']:
        if row['role']in ['zone','end']:
            assert hashlib.sha256(raw(int(row['va'],16),row['size'])).hexdigest()==row['sha256']
    assert raw(0x1459186b6,3)==raw(0x145916c36,3)==bytes.fromhex('4889d7')
    assert raw(0x145918c04,7)==bytes.fromhex('4881c706030000')
    assert by_format['zone']['fields'][11]['name']=='gender'
    assert int(by_format['zone']['va'],16)==0x147229f48
    assert raw(0x145918d4d,3)==bytes.fromhex('488d15') and 0x145918d54+struct.unpack('<i',raw(0x145918d50,4))[0]==0x147229f48
    expected_races={2:'Orc',3:'Dwarf',4:'Night Elf',5:'Undead',6:'Tauren',7:'Gnome',8:'Troll'}
    for byte in range(256):
        p=Probe();p.u.mem_write(0x30000305,bytes([byte]));p.u.reg_write(r.UC_X86_REG_RDI,0x30000000)
        p.run(0x145918710,[0x145918734]);descriptor=p.u.reg_read(r.UC_X86_REG_RAX)
        name=pair(descriptor);assert name==expected_races.get(byte,'Human')
        for class_id in [1,2]: # Both current End race-load branches.
            q=Probe();q.u.mem_write(0x30000304,bytes([class_id,byte]));q.u.reg_write(r.UC_X86_REG_RDI,0x30000000)
            q.run(0x145916ce2,[0x145916d35]);assert q.u.reg_read(r.UC_X86_REG_R14)==descriptor
        p=Probe();p.u.reg_write(r.UC_X86_REG_RDI,0x30000000)
        p.run(0x145918c04,[0x145918c0b]);assert p.u.reg_read(r.UC_X86_REG_RDI)==0x30000306
        p.run(0x145918d11,[0x145918d26])
        pointer,formatter=struct.unpack('<QQ',p.u.mem_read(0x200011c0,16));assert pointer==0x30000306 and formatter==0x145bdb210
        # Execute actual byte-to-decimal construction, stopping at the generic
        # alignment/write sink; the producer's retained template has no padding.
        p=Probe();p.u.mem_write(pointer,bytes([byte]));p.u.reg_write(r.UC_X86_REG_RCX,pointer)
        p.u.reg_write(r.UC_X86_REG_RDX,0x30001000);p.run(formatter,[0x145bd1dd0])
        sp=p.u.reg_read(r.UC_X86_REG_RSP);digits,size=struct.unpack('<QQ',p.u.mem_read(sp+40,16))
        gender=bytes(p.u.mem_read(digits,size)).decode();assert gender==str(byte)
        cases.append(dict(kind='active-run-identity',race_byte=byte,race=name,gender_byte=byte,gender=gender,end_class_branches=2))
    # Every first-row admission combination, before allocator/formatting work.
    for dead in [False,True]:
      for boss in [False,True]:
       for guardian in [False,True]:
        for elite in [False,True]:
         p=Probe();p.put(0x30000018,0 if boss else 2**64-1);p.put(0x30000058,0 if guardian else 2**64-1)
         p.u.mem_write(0x300000b0,bytes([dead]));p.u.mem_write(0x300001d4,bytes([elite]))
         p.u.reg_write(r.UC_X86_REG_RBX,0x30000000);p.u.reg_write(r.UC_X86_REG_RDI,0x300001d8)
         p.run(0x1459bcd40,[0x1459bcd60,0x1459bcd30]);admitted=p.stopped==0x1459bcd60
         assert admitted==(not dead and (boss or guardian or elite))
         cases.append(dict(kind='unit-admission',dead=dead,boss=boss,guardian=guardian,elite=elite,admitted=admitted))
    # Lightwell's native fraction operand ordering preserves NaN and signed zero.
    for value in [-math.inf,-2.0,-0.0,0.0,.25,1.0,2.0,math.inf,math.nan]:
        p=Probe();p.u.reg_write(r.UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',value),'little'))
        p.run(0x145983c93,[0x145983ca6]);bits=p.u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff;out=struct.unpack('<f',struct.pack('<I',bits))[0]
        expected=0. if value<0 else 1. if value>1 else value
        assert math.isnan(out) if math.isnan(expected) else struct.pack('<f',out)==struct.pack('<f',expected)
        cases.append(dict(kind='lightwell-fraction',input='NaN' if math.isnan(value) else str(value),output_bits=hex(bits)))
    # The dispatched ReloadUI tag writes only its pending client resource.
    p=Probe();p.put(0x20001030,0x30000000);p.put(0x20001028,0x30001000)
    p.u.mem_write(0x200010c8,struct.pack('<I',123));p.run(0x14078ae5b,[0x14078ae6e])
    assert bytes(p.u.mem_read(0x30001000,1))==b'\x01' and struct.unpack('<I',p.u.mem_read(0x30000000,4))[0]==123
    cases.append(dict(kind='reload-request',pending=True,change_tick=123))
    class TerminalProbe(Probe):
        def __init__(self):
            super().__init__();self.u.mem_map(0x10000000,0x1000);self.actions=[];self.heap=0x30008000
        def ret(self):
            sp=self.u.reg_read(r.UC_X86_REG_RSP);pc=struct.unpack('<Q',self.u.mem_read(sp,8))[0]
            self.u.reg_write(r.UC_X86_REG_RSP,sp+8);self.u.reg_write(r.UC_X86_REG_RIP,pc)
        def hook(self,u,a,n,_):
            if a in self.stops:self.stopped=a;u.emu_stop();return
            rcx=u.reg_read(r.UC_X86_REG_RCX);rdx=u.reg_read(r.UC_X86_REG_RDX)
            if a in [0x1458b8620,0x1458ab8e0]:
                self.actions.append('persist-owner' if a==0x1458b8620 else 'drop-game');self.ret()
            elif a in [0x140002200,0x1400021d0]:self.ret()
            elif a==0x1400021c0:
                u.reg_write(r.UC_X86_REG_RAX,self.heap);self.heap+=(rcx+15)&~15;self.ret()
            elif a==0x1458ad5e0:
                packet=u.reg_read(r.UC_X86_REG_R9);opcode=struct.unpack('<H',u.mem_read(packet+24,2))[0]
                self.actions.append(f'packet:{opcode:x}');self.ret()
            elif a==0x1458eb720:
                self.put(rcx,64,0x3000f000,1);u.mem_write(0x3000f000,b'{');self.ret()
            elif a==0x10000200:self.actions.append('frontend-callback');self.ret()
            else:assert 0x1458b8300<=a<0x1458b8566,hex(a)
    for active,game in [(False,True),(True,False),(True,True)]:
        p=TerminalProbe();cache_bytes=bytes(range(256))+bytes(range(128));p.u.mem_write(0x30000d60,cache_bytes)
        p.put(0x30000b10,0x30002000,1);p.u.mem_write(0x300020a8,bytes([active]))
        p.put(0x30000010,0 if game else 2);p.put(0x30000f18,2**64-1)
        p.put(0x30001090,0x30004000,0x30005000);p.put(0x30005018,0x10000200)
        p.u.reg_write(r.UC_X86_REG_RCX,0x30000000);p.put(0x20010000,0x10000000)
        p.u.emu_start(0x1458b8300,0x10000000,count=5000)
        expected=(['persist-owner']+(['drop-game']if game else [])+['packet:4d','frontend-callback'])if active else []
        assert p.actions==expected,(active,game,p.actions)
        assert bytes(p.u.mem_read(0x30000d60,384))==cache_bytes
        cases.append(dict(kind='logout-return-order',active=active,game=game,actions=p.actions,cached_slots_preserved=16))
    class QueueDropProbe(Probe):
        def __init__(self):super().__init__();self.freed=[]
        def hook(self,u,a,n,_):
            if a in self.stops:self.stopped=a;u.emu_stop();return
            if a==0x1400021d0:
                self.freed.append((u.reg_read(r.UC_X86_REG_RCX),u.reg_read(r.UC_X86_REG_RDX)))
                sp=u.reg_read(r.UC_X86_REG_RSP);pc=struct.unpack('<Q',u.mem_read(sp,8))[0]
                u.reg_write(r.UC_X86_REG_RSP,sp+8);u.reg_write(r.UC_X86_REG_RIP,pc)
            else:assert 0x1458abb89<=a<0x1458abc58,hex(a)
    for packets,callbacks in [(0,0),(1,1),(3,2)]:
        p=QueueDropProbe();p.u.reg_write(r.UC_X86_REG_RBX,0x30000000)
        p.put(0x30000618,packets,0x30002000,packets);p.put(0x30000630,callbacks,0x30003000,callbacks)
        expected=[]
        for i in range(packets):p.put(0x30002000+i*32,8,0x30004000+i*16);expected.append((0x30004000+i*16,8))
        if packets:expected.append((0x30002000,packets*32))
        for i in range(callbacks):p.put(0x30003000+i*24,8,0x30005000+i*16);expected.append((0x30005000+i*16,8))
        if callbacks:expected.append((0x30003000,callbacks*24))
        p.run(0x1458abb89,[0x1458abc58]);assert p.freed==expected
        cases.append(dict(kind='game-drop-queues',packets=packets,frontend_messages=callbacks,released_payloads=packets+callbacks,released_vectors=int(bool(packets))+int(bool(callbacks))))
    # Session Lua tag4 has no local teardown: it only submits command0x46;
    # tag3 queues AppExit. Ordinary Logout/Quit share a separate pending latch.
    # Keep logging inactive so the native branch executes without logger seams.
    class ClientExitProbe(Probe):
        def __init__(self,active=True,pending=False):
            super().__init__();self.sent=[]
            self.put(0x200010f0,0x30001000);self.put(0x200010e0,0x30002000)
            self.put(0x200010c0,0x30003000);self.put(0x30003000,int(active))
            self.put(0x200010e8,0x30001018);self.put(0x200010b8,0x30004000)
            self.put(0x30005020,1,0x30006000,0,17)
            self.u.reg_write(r.UC_X86_REG_RBX,0x30005000);self.u.reg_write(r.UC_X86_REG_R12D,77)
            self.u.mem_write(0x30001019,bytes([pending]))
            self.u.mem_map(0x14807c000,0x2000);self.put(0x14807cfa8,0x30007000);self.put(0x30007000,4)
        def ret(self):
            sp=self.u.reg_read(r.UC_X86_REG_RSP);pc=struct.unpack('<Q',self.u.mem_read(sp,8))[0]
            self.u.reg_write(r.UC_X86_REG_RSP,sp+8);self.u.reg_write(r.UC_X86_REG_RIP,pc)
        def hook(self,u,a,n,_):
            if a in self.stops:self.stopped=a;u.emu_stop();return
            if a==0x14063af70:
                tag=struct.unpack('<H',u.mem_read(u.reg_read(r.UC_X86_REG_R8),2))[0];self.sent.append(tag)
                u.mem_write(u.reg_read(r.UC_X86_REG_RCX),b'\xff\xff');self.ret()
            elif a==0x1406db190:self.ret()
            else:assert 0x14078aa28<=a<=0x14078aff6,hex(a)
    for tag,active,pending in [(4,False,False),(4,True,False),(4,True,True),(3,True,False),(0,True,False),(1,True,False),(0,True,True),(0,False,False),(1,False,False)]:
        p=ClientExitProbe(active,pending);p.u.reg_write(r.UC_X86_REG_RAX,tag)
        p.run({0:0x14078aa28,1:0x14078aa28,3:0x14078aefc,4:0x14078ad72}[tag],[0x14078ae6e])
        quitting=bool(p.u.mem_read(0x30001018,1)[0]);pending_after=bool(p.u.mem_read(0x30001019,1)[0])
        exits=struct.unpack('<Q',p.u.mem_read(0x30005030,8))[0]
        expected_send=[0x46]if tag==4 and active else [0xa1]if tag in [0,1]and active and not pending else []
        assert p.sent==expected_send
        assert exits==int(tag==3 or tag==1 and not active and not pending)
        assert pending_after==(pending or tag in [0,1]and active)
        assert quitting==(tag==1 and not pending)
        cases.append(dict(kind='client-session-request',tag=tag,active=active,pending_before=pending,pending_after=pending_after,quitting=quitting,client_commands=[hex(v)for v in p.sent],exit_events=exits))
    # The current client completion owner clears pending, and only a real
    # LoggedOut event plus the armed Quit flag queues AppExit.
    class CompletionProbe(ClientExitProbe):
        def hook(self,u,a,n,_):
            if a in self.stops:self.stopped=a;u.emu_stop();return
            assert 0x14078b060<=a<=0x14078b1b1,hex(a)
    for count,quitting in [(0,False),(0,True),(1,False),(1,True)]:
        p=CompletionProbe(pending=True);p.u.mem_write(0x30001018,bytes([quitting]))
        p.put(0x30008000,0);p.put(0x30009010,count,0);p.put(0x30009030,0,0,count)
        p.put(0x3000c000,0x30008000,0x30009000)
        p.put(0x3000a000,0x30001000,0,0x30002000);p.u.mem_write(0x3000a01c,struct.pack('<I',77))
        p.put(0x3000b000,0x30005000,0,0x30004000);p.u.mem_write(0x3000b01c,struct.pack('<I',88))
        p.u.reg_write(r.UC_X86_REG_RDX,0x3000c000);p.u.reg_write(r.UC_X86_REG_R8,0x3000a000);p.u.reg_write(r.UC_X86_REG_R9,0x3000b000)
        p.run(0x14078b060,[0x14078b1b1]);exits=struct.unpack('<Q',p.u.mem_read(0x30005030,8))[0]
        assert exits==int(bool(count)and quitting)
        assert p.u.mem_read(0x30001019,1)[0]==int(not count)
        assert p.u.mem_read(0x30001018,1)[0]==int(quitting and not count)
        cases.append(dict(kind='logout-complete-exit',completion_messages=count,quitting_before=quitting,exit_events=exits))
    class DisconnectProbe(TerminalProbe):
        def hook(self,u,a,n,_):
            if a in self.stops:self.stopped=a;u.emu_stop();return
            if a in [0x1458b8620,0x1458ab8e0]:
                self.actions.append('persist-owner'if a==0x1458b8620 else 'drop-game');self.ret()
            else:assert 0x1458ae094<=a<=0x1458ae0e4,hex(a)
    for active,game in [(False,True),(True,False),(True,True)]:
        p=DisconnectProbe();p.put(0x20001528,0x30000000);p.put(0x200014c8,0x30000010)
        p.u.mem_write(0x20001148,bytes([active]));p.put(0x30000010,0 if game else 2)
        p.run(0x1458ae094,[0x1458ae135,0x1458ae0e4])
        assert p.actions==(['persist-owner']+(['drop-game']if game else [])if active else [])
        if active:assert struct.unpack('<Q',p.u.mem_read(0x30000010,8))[0]==2
        cases.append(dict(kind='disconnected-client-cleanup',active_connection=active,game=game,actions=p.actions))
    # The actual ClientCommand serializer dispatches the two distinct requests
    # to current empty-packet builders, whose opcode operands execute unchanged.
    for tag,owner,opcode in [(0x46,0x145a3e160,0x4a),(0xa1,0x145a3e190,0x4b)]:
        assert 0x145ea2954+struct.unpack('<i',raw(0x145ea2954+tag*4,4))[0]=={0x46:0x140649dfe,0xa1:0x14064b903}[tag]
        p=Probe();p.u.reg_write(r.UC_X86_REG_RCX,0x30000000);p.run(owner,[owner+0x1c])
        assert p.u.reg_read(r.UC_X86_REG_R8)&0xffff==opcode
        assert p.u.reg_read(r.UC_X86_REG_R9)==1 and struct.unpack('<Q',p.u.mem_read(p.u.reg_read(r.UC_X86_REG_RSP)+32,8))[0]==0
        cases.append(dict(kind='client-command-wire',command=hex(tag),opcode=hex(opcode),body_bytes=0))
    assert 0x146bec598+struct.unpack('<i',raw(0x146bec598+(0x4a-0x36)*4,4))[0]==0x1458b2b65
    assert 0x146bec598+struct.unpack('<i',raw(0x146bec598+(0x4b-0x36)*4,4))[0]==0x1458b2961
    # Native ordinary logout constructs the successful instant response, then
    # tail-calls the already checked return owner; no poll serializer is called.
    class LogoutResponseProbe(TerminalProbe):
        def hook(self,u,a,n,_):
            if a==0x1458ad5e0:
                packet=u.reg_read(r.UC_X86_REG_R9);body=struct.unpack('<Q',u.mem_read(packet+8,8))[0]
                assert struct.unpack('<Q',u.mem_read(packet+16,8))[0]==5
                assert struct.unpack('<H',u.mem_read(packet+24,2))[0]==0x4c
                assert bytes(u.mem_read(body,5))==b'\0\0\0\0\1'
                self.actions.append('packet:4c:instant');self.ret()
            elif a==0x1458b8300:self.actions.append('logout-return');self.stopped=a;u.emu_stop()
            elif a==0x140002200:self.ret()
            elif a==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,self.heap);self.ret()
            else:assert 0x1458b2961<=a<=0x1458b29ef,hex(a)
    p=LogoutResponseProbe();p.u.reg_write(r.UC_X86_REG_RSI,0x30000000);p.u.reg_write(r.UC_X86_REG_RBP,0x20001000)
    p.u.emu_start(0x1458b2961,0,count=1000);assert p.actions==['packet:4c:instant','logout-return']
    cases.append(dict(kind='logout-response-order',actions=p.actions,reason=0,instant=True))
    import capstone
    md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    a=0x14078a8d0;b=extents[a]
    assembly=''.join(f'{i.address:x}: {i.mnemonic:9} {i.op_str}'.rstrip()+'\n'for i in md.disasm(raw(a,b-a),a))
    asm_path=EVIDENCE/'session-dispatch.asm'
    if args.write:asm_path.write_text(assembly)
    else:assert asm_path.read_text()==assembly
    source=ROOT/'crates/azeroth-survivors-re/src/gameplay'
    bootstrap=(source/'client/addon_bootstrap.rs').read_text();feed=(source/'client/addon_feed.rs').read_text();client=(source/'client.rs').read_text()
    assert 'framexml_appends: vec![(' in bootstrap and r'Interface\FrameXML\WorldStateFrame.lua' in bootstrap
    assert 'script_prelude: STATS_PARSER.into()' in bootstrap and 'AZS_RE_RUN_IDENTITY' not in bootstrap
    assert 'splice(0..0, framexml_hud::appends())' in client
    assert 'state.addon.due(session.identity, input.ui_time)' in client and 'addon_bootstrap::update' not in client
    assert 'identity: Option<u64>' in feed and 'script_session' not in feed
    assert 'terminal_messages' not in client
    events=(source/'client/events.rs').read_text();assert 'collect.before(super::sync_to_client)' in events
    requests=(source/'mod.rs').read_text();assert 'client::terminal_messages' not in requests and 'client::terminal_messages' not in (source/'terminal.rs').read_text()
    assert 'SessionRequest::ForceLogout => {}' in requests
    assert re.search(r'SessionEvent::LogoutResponse\s*\{\s*reason:\s*0,\s*instant:\s*true,?\s*\}', requests)
    force_quit=requests.split('SessionRequest::ForceQuit =>',1)[1].split('SessionRequest::Logout | SessionRequest::Quit =>',1)[0]
    assert 'exit.write(AppExit::Success)'in force_quit and 'abandon('not in force_quit and 'persist_'not in force_quit
    ordinary=requests.split('SessionRequest::Logout | SessionRequest::Quit =>',1)[1].split('            _ => {}',1)[0]
    assert ordinary.index('finish_client_delivery(')<ordinary.index('commands.queue(|world: &mut World|')<ordinary.index('world.write_message(AppExit::Success)')
    scalar=(source/'mechanics/addon_scalars.rs').read_text();assert '("lightwell", addon_fraction(fraction), 1.0)' in scalar
    assert 'if fraction < 0.0' in scalar and 'else if fraction > 1.0' in scalar
    identity=(source/'client/addon_scalars.rs').read_text()
    assert 'race(game.stats.native_race)' in identity and 'game.stats.packed_player_field.to_le_bytes()[2]' in identity
    assert 'race(menu.race)' not in identity and '("gender", menu.sex' not in identity
    assert 'active_identity_survives_disagreeing_editable_menu_through_run_end' in identity
    entry=(source/'mod.rs').read_text()
    assert 'native_race: pick.hero.race' in entry and 'u32::from_le_bytes([pick.hero.race, pick.hero.class, pick.hero.sex, 0])' in entry
    # The normal core provider appends every matching patch to both direct and
    # nested script reads; external addons load after this core file provider.
    host=(ROOT/'crates/benilla-app/src/ui_script/addons.rs').read_text();assert 'for (target, source) in appends' in host
    result=dict(target_sha256=SHA,spell_metadata_records=113,scalar_fields=scalar_fields,field_ledger="producer-fields.json",reviewed_helpers=len(rea["owners"]),format_contracts=formats,
      native_ranges=[span(0x1459bcd40,0x1459bcd60),span(0x145983c93,0x145983ca6),span(0x14078ae5b,0x14078ae6e),span(0x1458abb89,0x1458abc58),span(0x1458b8300,0x1458b8566),span(0x14078a8d0,extents[0x14078a8d0]),span(0x145a3e160,0x145a3e187),span(0x145a3e190,0x145a3e1b7),span(0x1458b2961,0x1458b29f4),span(0x14078b060,0x14078b1d5),span(0x1458ae094,0x1458ae0e4),span(0x1459186b6,0x145918734),span(0x145916c36,0x145916d35),span(0x145918c04,0x145918c0b),span(0x145918d11,0x145918d26),span(0x145bdb210,0x145bdb2b8)],cases=cases,
      limits=['Selected unchanged admission/arithmetic/pending-request/teardown instructions execute; persistence, Game drop, allocation, packet delivery, JSON construction and callback dispatch have explicit host seams in the logout-order cases. Queue-drop instructions execute with recorded deallocation only; no game or reconstructed Rust runs.','Active-identity cases execute current Game race selectors and unsigned-byte decimal construction; they stop before the generic alignment/write sink. Constructor/source packing is separately checked; no full Game constructor or reconstructed Rust executes.','Consumed metadata/format equality is not gameplay state or original/rebuilt parity.'])
    path=EVIDENCE/'producer-cases.json'
    if args.write:path.write_text(encoded(result))
    else:assert json.loads(path.read_text())==result
    print(f'Passed {len(cases)} current native producer/cache/queue/terminal cases, 113 spell metadata records, {scalar_fields} scalar fields, {len(formats)} wire formats and source/core-FrameXML connections; no build/game')
if __name__=='__main__':main()

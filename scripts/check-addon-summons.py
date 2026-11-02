#!/usr/bin/env python3
"""Check current addon data and isolated original instructions; never compile or launch a game.

Allocator, byte-copy and deallocation calls in isolated key cases are explicit
storage seams. Native icon traversal and fixed instruction slices run unchanged.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
EVIDENCE = ROOT/'docs/analysis/evidence/0.112.0/addon-bridge'
WORK = ROOT/'runtime/addon-bridge-0.112.0'
ASSETS = ROOT/'crates/azeroth-survivors-re/assets'
KINDS = ['pet','imp','felhunter','voidwalker','succubus','felguard','infernal','doomguard','pitlord']
DEFINITIONS = [0x14723ec08,0x14723ec58,0x14723ebc0,0x14723ece8,0x14723eca0,0x1472218e8,0x14723eb78,0x14723ee60,0x147221848,0x14723edc0,0x14723ed30,0x14723ee10,0x14723ed78]
STREAMS = ['AZS','AZSZONE','AZSRUN','AZSBOSSES','AZSUNITS','AZSDEBUFFS','AZSTGT','AZSSPELLS','AZSBUFFS','AZSPETS','AZSMETER','AZSHEAL','AZSBOSSDMG','AZSCHESTS','AZSLAIRS','AZSTAKEN','AZSEND']

def encoded(v): return json.dumps(v,indent=2,ensure_ascii=False,allow_nan=False)+'\n'

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--write',action='store_true',help='retain compact checked native cases')
    ap.add_argument('--prepare-rea',action='store_true',help='stage reproducible current-byte Ghidra plans without running them')
    args=ap.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=target_bytes(target)
    module = load_script('addon112_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    def raw(a,n):o=pe.rva_offset(a-pe.image_base);assert o is not None and 0<=o<=len(data)-n;return data[o:o+n]
    def q(a):return struct.unpack('<Q',raw(a,8))[0]
    def pair(a):p,n=struct.unpack('<QQ',raw(a,16));assert n<10000;return raw(p,n).decode() if n else ''
    manifest=json.loads((EVIDENCE/'manifest.json').read_text());assert manifest['target_sha256']==SHA
    for row in manifest['owners']+manifest['instruction_ranges']:
        assert hashlib.sha256(raw(int(row['va'],16),row['byte_count'])).hexdigest()==row['sha256'],row['role']
        for kind in ['assembly','pseudocode']:
            if kind in row:assert hashlib.sha256((ROOT/row[kind]).read_bytes()).hexdigest()==row[kind+'_sha256']
    if args.prepare_rea:
        clusters=[]
        for row in sorted(manifest['owners'],key=lambda row:int(row['va'],16)):
            a=int(row['va'],16)
            if not clusters or a-int(clusters[-1][-1]['end'],16)>0x200000:clusters.append([])
            clusters[-1].append(row)
        for index,rows in enumerate(clusters,1):
            folder=WORK/'reproduce'/f'group-{index:02}';folder.mkdir(parents=True,exist_ok=True)
            lo=int(rows[0]['va'],16);hi=max(int(row['end'],16)for row in rows);carrier=bytearray(hi-lo)
            for row in rows:
                a=int(row['va'],16);carrier[a-lo:a-lo+row['byte_count']]=raw(a,row['byte_count'])
            (folder/'owners.bin').write_bytes(carrier)
            seeds=''.join(f"{row['va']}\tfunction\n{row['va']}\tcode\n"for row in rows)
            (folder/'seeds.tsv').write_text(seeds)
            plan=dict(target=str((folder/'owners.bin').relative_to(ROOT)),output=str((folder/'rea').relative_to(ROOT)),init_timeout=60,timeout=600,
                environment={'REA_GHIDRA_SEED_FILE':str((folder/'seeds.tsv').relative_to(ROOT))},
                open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(lo)),
                operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=row['va']),label=row['role'])for row in rows])
            (folder/'plan.json').write_text(encoded(plan));print((folder/'plan.json').relative_to(ROOT))
        return
    api=(ROOT/'docs/analysis/evidence/0.112.0/addon-api.lua').read_bytes()
    assert len(api)==14541 and raw(0x146c0249a,len(api))==api
    assert raw(0x146c06463,sum(map(len,STREAMS[1:])))==''.join(STREAMS[1:]).encode()
    assert struct.unpack('<d',raw(0x146c060b0,8))[0]==.2
    assert raw(0x1472459f3,35).hex()=='c0012cc0012cc0012cc0012cc5200000700100012cc5200000700100012cc0012cc000'
    assert raw(0x146c068d0,5)==bytes.fromhex('c00109c000')
    assert [raw(q(0x147246728+i*8),q(0x147246770+i*8)).decode()for i in range(9)]==KINDS
    # Exact current API metadata, independent of the underlying combat catalog.
    spells=[dict(key=pair(a),name=pair(a+16),icon=pair(a+32),spell=struct.unpack('<I',raw(a+64,4))[0])for i in range(113)for a in [0x146bf5eb0+i*120]]
    assert spells==json.loads((ASSETS/'addon-spell-metadata-0.112.0.json').read_text())
    zones=[]
    for i in range(12):
        a=0x146bf2630+i*240;bs,n=struct.unpack('<QQ',raw(a+136,16));assert n==5
        zones.append(dict(key=pair(a+8),name=pair(a+24),subtitle=pair(a+40),map_id=struct.unpack('<I',raw(a+192,4))[0],area_id=struct.unpack('<I',raw(a+196,4))[0],center=list(struct.unpack('<2f',raw(a+200,8))),difficulty_f32=struct.unpack('<f',raw(a+224,4))[0],bosses=[dict(id=struct.unpack('<I',raw(bs+j*104+64,4))[0],name=pair(bs+j*104),at_minutes_f32=struct.unpack('<f',raw(bs+j*104+80,4))[0],final=bool(raw(bs+j*104+100,1)[0]))for j in range(5)]))
    assert zones==json.loads((ASSETS/'addon-zones-0.105.0.json').read_text())
    historical=json.loads((ROOT/'docs/analysis/evidence/0.105.0/addon-bridge/native-manifest.json').read_text())
    for row in historical['format_bytes']+[historical['spell_row']['format']]:assert bytes.fromhex(row['hex'])in data
    # Whole immutable catalog traversal in the native icon fallback order.
    first={};catalog_records=[]
    for ci in range(9):
        cls=0x14723e460+ci*200
        for ti in range(3):
            tree=cls+ti*64;ptr,n=struct.unpack('<QQ',raw(tree+48,16));assert n in [13,14]
            for j in range(n):
                t=ptr+j*160;effects,count=struct.unpack('<QQ',raw(t+96,16));assert count<100
                catalog_records.append(dict(talent=hex(t),sha256=hashlib.sha256(raw(t,160)).hexdigest(),effects=hex(effects),effect_count=count,effects_sha256=hashlib.sha256(raw(effects,count*64)).hexdigest()))
                for k in range(count):
                    e=effects+k*64;tag=raw(e,1)[0]
                    if tag in [2,29,33,34]:first.setdefault(q(e+(8 if tag==29 else 16)),dict(talent=hex(t),effect=hex(e),tag=tag,icon=pair(t+80)))
    expected=[]
    for a in DEFINITIONS:
        name=pair(a);explicit=pair(a+16)
        expected.append(dict(entry=struct.unpack('<I',raw(a+32,4))[0],name=name,key=name.translate(str.maketrans('ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')).replace(' ','_'),kind=KINDS[raw(a+57,1)[0]],icon=explicit or first.get(a,{}).get('icon','')))
    assert expected==json.loads((ASSETS/'addon-summons-0.112.0.json').read_text())
    # Installed existing Python packages only; these are instruction probes.
    sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    class Probe:
        def __init__(self):
            self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.heap=0x30010000;self.stop=0;self.freed=[]
            self.u.mem_map(0x20000000,0x20000);self.u.mem_map(0x30000000,0x100000)
            self.u.reg_write(r.UC_X86_REG_RSP,0x20018000);self.u.reg_write(r.UC_X86_REG_RBP,0x20001000)
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED,self.missing);self.u.hook_add(UC_HOOK_CODE,self.hook)
        def missing(self,u,access,a,n,v,_):
            page=a&~4095;u.mem_map(page,4096);u.mem_write(page,raw(page,4096));return True
        def bytes(self,a,n):
            if pe.image_base<=a<pe.image_base+0x10000000:
                return raw(a,n)
            return bytes(self.u.mem_read(a,n))
        def ret(self,value=0):
            self.u.reg_write(r.UC_X86_REG_RAX,value);sp=self.u.reg_read(r.UC_X86_REG_RSP);self.u.reg_write(r.UC_X86_REG_RIP,struct.unpack('<Q',self.u.mem_read(sp,8))[0]);self.u.reg_write(r.UC_X86_REG_RSP,sp+8)
        def hook(self,u,a,n,_):
            if a==self.stop:u.emu_stop();return
            cx=u.reg_read(r.UC_X86_REG_RCX);dx=u.reg_read(r.UC_X86_REG_RDX);r8=u.reg_read(r.UC_X86_REG_R8)
            if a==0x140002200:self.ret()
            elif a==0x1400021c0:
                out=(self.heap+15)&~15;self.heap=out+max(cx,16);self.ret(out)
            elif a==0x1400021d0:self.freed.append((cx,dx));self.ret()
            elif a==0x145c0a3db:
                if r8:u.mem_write(cx,bytes(u.mem_read(dx,r8)))
                self.ret(cx)
            elif a==0x14589ad40:self.ret() # reset's native Vec/String destructor storage seam
        def run(self,start,stop):self.stop=stop;self.u.emu_start(start,0,count=100000)
        def call(self,a,*args):
            for reg,v in zip([r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_R9],args):self.u.reg_write(reg,v)
            sp=0x20018000;self.u.mem_write(sp,struct.pack('<Q',0x20000000));self.u.reg_write(r.UC_X86_REG_RSP,sp);self.run(a,0x20000000)
        def put(self,a,*v):self.u.mem_write(a,struct.pack('<'+'Q'*len(v),*v))
        def readq(self,a):return struct.unpack('<Q',self.u.mem_read(a,8))[0]
    cases=[]
    for a,row in zip(DEFINITIONS,expected):
        p=Probe();p.call(0x14599e770,a);icon=p.bytes(p.u.reg_read(r.UC_X86_REG_RAX),p.u.reg_read(r.UC_X86_REG_RDX)).decode();assert icon==row['icon']
        p=Probe();p.call(0x14599e3d0,0x30000000,a);ptr,n=struct.unpack('<QQ',p.u.mem_read(0x30000008,16));key=bytes(p.u.mem_read(ptr,n)).decode();assert key==row['key']
        cases.append(dict(kind='native-key-icon',entry=row['entry'],key=key,icon=icon))
    for text in ['','ABC XYZ','Élan Wolf;A,B','A'*40+' '+'B'*16]:
        p=Probe();b=text.encode();p.u.mem_write(0x30001000,b);p.put(0x30000030,0x30001000,len(b));p.call(0x14599e3d0,0x30000000,0x30000030);ptr,n=struct.unpack('<QQ',p.u.mem_read(0x30000008,16));key=bytes(p.u.mem_read(ptr,n)).decode();assert key==text.translate(str.maketrans('ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')).replace(' ','_');cases.append(dict(kind='native-key-boundary',input=text,key=key))
    for permanent,ends,born in [(True,0,0),(False,30.25,2.125),(False,-2.0,1.0),(False,1.0,2.0),(False,math.inf,1.0),(False,math.nan,0.0)]:
        p=Probe();p.u.mem_write(0x30000000,bytes([not permanent]));p.u.mem_write(0x30000008,struct.pack('<f',ends));p.u.mem_write(0x3000006c,struct.pack('<f',born));p.u.reg_write(r.UC_X86_REG_RBX,0x30000000);p.u.reg_write(r.UC_X86_REG_RSI,0);p.u.reg_write(r.UC_X86_REG_XMM6,struct.unpack('<I',struct.pack('<f',-1.))[0]);p.run(0x1459f89a6,0x1459f89df)
        actual_ends,actual_dur=struct.unpack('<ff',p.u.mem_read(0x20001100,8))[::-1]
        e=-1. if permanent else ends;duration=-1. if permanent else struct.unpack('<f',struct.pack('<f',ends-born))[0]
        assert (math.isnan(actual_ends)and math.isnan(e))or actual_ends==e
        assert (math.isnan(actual_dur)and math.isnan(duration))or actual_dur==duration
        cases.append(dict(kind='native-duration',permanent=permanent,ends_bits=hex(struct.unpack('<I',struct.pack('<f',actual_ends))[0]),duration_bits=hex(struct.unpack('<I',struct.pack('<f',actual_dur))[0])))
    for entry in [9510,9523]:
        for serial in [0,1,0xffffff,0xffffffff]:
            p=Probe();p.u.reg_write(r.UC_X86_REG_RSI,0x30000000);p.u.reg_write(r.UC_X86_REG_R12,entry);p.u.mem_write(0x30000a78,struct.pack('<I',serial));p.run(0x14592e49d,0x14592e4cd);guid=p.u.reg_read(r.UC_X86_REG_R14);assert guid==(0xf130000000000000|((entry&0xffffff)<<24)|((serial+1)&0xffffff));cases.append(dict(kind='native-guid',entry=entry,previous_serial=serial,guid=hex(guid),wire_id=guid&0xffffffff))
    for points in [0,1,2,4,5,0xffffff,0xffffffff]:
        p=Probe();p.u.reg_write(r.UC_X86_REG_RDX,0x30000000);p.u.reg_write(r.UC_X86_REG_RCX,0x30002000)
        p.u.mem_write(0x30000908,struct.pack('<If',points,.4));p.run(0x14595120b,0x145951234)
        value,maximum=struct.unpack('<ff',p.u.mem_read(0x30002010,8))
        assert value==struct.unpack('<f',struct.pack('<f',points))[0] and maximum==5.
        cases.append(dict(kind='native-soulfire-proc',points=points,value=value,maximum=maximum))
    slots=[0xd78]+[0xd90+i*24 for i in range(16)]
    for label,start,stop in [('constructor',0x1458ae938,0x1458aebfe),('again',0x1458be4af,0x1458be603),('login',0x1458b5a22,0x1458b5b86)]:
        p=Probe();p.u.mem_write(0x30000000,b'\xa5'*0x2000);p.u.reg_write(r.UC_X86_REG_RSI,0x30000000);p.u.mem_write(0x30001110,struct.pack('<d',42.));p.run(start,stop)
        for off in slots:
            assert p.readq(0x30000000+off+16)==0,(label,hex(off))
            if label=='constructor'or off!=0xd78:assert p.readq(0x30000000+off)==0,(label,hex(off))
        assert p.readq(0x30001118)==0
        clock=struct.unpack('<d',p.u.mem_read(0x30001110,8))[0];assert clock==(0. if label=='constructor'else 42.)
        cases.append(dict(kind='native-cache',owner=label,empty_payloads=len(slots),clock=clock,target=0))
    for elapsed in [0.,.199,.2,.25,math.nan]:
        p=Probe();p.u.reg_write(r.UC_X86_REG_RSI,0x30000000);p.u.mem_write(0x30001110,struct.pack('<d',0.));p.u.reg_write(r.UC_X86_REG_XMM6,struct.unpack('<Q',struct.pack('<d',elapsed))[0]);p.stop=0x1458b0db9
        # Both original exits are observed through a separate hook.
        stopped=[]
        def gate(u,a,n,_):
            if a in [0x1458b0db9,0x1458b1c71]:stopped.append(a);u.emu_stop()
        p.u.hook_add(UC_HOOK_CODE,gate);p.run(0x1458b0d97,0x20000000);admitted=stopped==[0x1458b0db9];assert admitted==(elapsed>=.2);cases.append(dict(kind='native-poll',elapsed=str(elapsed),admitted=admitted))
    # ReloadUI request is a client pending resource write, independent of server caches.
    p=Probe();p.put(0x20001030,0x30000000);p.put(0x20001028,0x30001000);p.u.mem_write(0x200010c8,struct.pack('<I',123));p.run(0x1405cf62b,0x1405cf63e);assert p.readq(0x30000000)==123 and bytes(p.u.mem_read(0x30001000,1))==b'\x01';cases.append(dict(kind='native-reload-request',pending=True,change_tick=123))
    source=ROOT/'crates/azeroth-survivors-re/src/gameplay'
    live=(source/'client/addon_summons.rs').read_text();projection=(source/'mechanics/addon_lists.rs').read_text();bootstrap=(source/'client/addon_bootstrap.rs').read_text();lists=(source/'client/addon_lists.rs').read_text();client=(source/'client.rs').read_text();feed=(source/'client/addon_feed.rs').read_text()
    assert 'addon-summons-0.112.0.json'in live and 'addon-spell-metadata-0.112.0.json'in lists and 'evidence/0.112.0/addon-api.lua'in bootstrap
    assert '"AZSPETS"'in client and '.1' in live and 'addon_summons::snapshot'in client
    assert 'guid as u32'in projection and 'allocation_order'in projection and 'born_at'in projection
    assert 'self.cached.clear()'in feed and 'now - self.polled_at >= 0.2'in feed
    proc=(source/'mechanics/addon_scalars.rs').read_text().split('pub fn addon_proc',1)[1].split('pub fn addon_stats',1)[0]
    assert 'self.passive_state.soul_fire_points as f32' in proc and 'self.passive_state.soul_fire_fraction' not in proc
    result=dict(target_sha256=SHA,native_cases=cases,native_case_count=len(cases),catalog_talents=len(catalog_records),metadata_counts=dict(summons=13,spells=113,zones=12,bosses=60),limits=['Only unchanged native instructions at selected functions/ranges execute in Unicorn; no process, game, build or Rust executes.','Key allocator/copy/free and reset destructor are explicit storage seams. Icon catalog traversal executes native instructions over the actual EXE data.','Source token guards and exact immutable metadata are structural checks, not Rust execution, gameplay or original/rebuilt parity.'])
    if args.write:(EVIDENCE/'native-cases.json').write_text(encoded(result))
    else:assert result==json.loads((EVIDENCE/'native-cases.json').read_text())
    print(f"0.112.0 addon: {len(cases)} unchanged native cases;13summons/113spells/12zones/60bosses and17stream source connections checked; no build/game")

if __name__=='__main__':main()

#!/usr/bin/env python3
"""Replay current Save default, hourly gate, Path ordering and backup retention.

Only original hash-bound instructions run. The actual filesystem deletion leaf is
recorded and returns success; clocks, application and filesystem I/O do not run.
"""
import argparse
import hashlib
import json
from pathlib import Path
from native_save_fixture import CPU, ROOT, SHA
from unicorn import x86_const as r

DEST = ROOT / 'docs/analysis/evidence/save-backup'
EXTRA_OWNERS = [0x1458a33c0,0x1458aa710,0x145914c00,0x145914950,
                0x1458f0930,0x1458aab40,0x141224760,0x141224160,
                0x140009eb0,0x1459a9520,0x145ba6490,0x145bb5090,
                0x1458ef860,0x145bba4c0,0x145bc2340]
INPUTS = ['', 'unknown|keep\n','items|\n','items|bad\n','equip|1|\n',
 'look|1|\n','talent|1|0|\n','spec|1|0|||\n','resets|0\n','resets|1\n',
 'pets|\n','pets|squirrel\n','stat|kills=0\n','stat|custom=5\n',
 'stat|kills=1\n','achat|\n','achat|=0\n','ach|\n','ach|anything\n',
 'seen|\n','seen|a=0\n','perk|rerolls:0\n','tabard|90001\n',
 'beat|1|foo\n','open|1|elwynn\n','pick|1|1|0|elwynn|Hero\n',
 'hero|1|1|0|0,0,0,0,0\n']


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    cpu = CPU()
    ranges = []
    for address in EXTRA_OWNERS:
        end = cpu.ends[address]
        ranges.append(dict(start=hex(address),end=hex(end),
                           sha256=hashlib.sha256(cpu.raw(address,end)).hexdigest()))
        cpu.allow_owner(address)
    curated = json.loads((DEST/'manifest.json').read_text()).get('curated',{})
    for owner in curated.get('owners',[]):
        a,b=int(owner['start'],16),int(owner['end'],16)
        assert hashlib.sha256(cpu.raw(a,b)).hexdigest()==owner['sha256']
        for kind in ('c','asm'):
            assert hashlib.sha256((ROOT/owner[kind]).read_bytes()).hexdigest()==owner[kind+'_sha256']
    if not args.write:
        saved = json.loads((DEST/'manifest.json').read_text())
        assert saved['target_sha256']==SHA and saved['native_helpers']==ranges
    def get(name): return cpu.reg(getattr(r,'UC_X86_REG_'+name))
    def setr(name,value): cpu.u.reg_write(getattr(r,'UC_X86_REG_'+name),value)
    def block(start,stops,count=200000):
        cpu.stops=set(stops)
        cpu.u.emu_start(start,cpu.D,count=count)
        assert get('RIP') in stops, f'Instruction limit at {get("RIP"):#x}'
        return get('RIP')
    cases=[]
    for text in INPUTS:
        cpu.stops.clear()
        save=cpu.parse(text)
        canonical=cpu.serialize(save)
        setr('RBP',cpu.S+0x100000);setr('RSP',cpu.S+0xf0000);setr('RDI',save)
        actual=block(0x1458a34d0,[0x1458a37af,0x1458a3a5d])==0x1458a37af
        assert actual==bool(canonical),(text,canonical,actual)
        cases.append(dict(contract='typed-default',input=text,canonical=canonical,
                          native_has_progress=actual))
    for now,last in [(0,0),(3599,0),(3600,0),(3601,0),(10000,10000),
                     (10000,6401),(10000,6400),(10000,10001),
                     (0,2**64-1),(2**64-1,0),(2**64-1,2**64-2)]:
        setr('RDI',now);setr('RAX',last)
        admitted=block(0x1458a3a42,[0x1458a3927,0x1458a3a5d],50)==0x1458a3927
        assert admitted==(last>now or now-last>=3600)
        cases.append(dict(contract='hourly',now=now,last=last,backup=admitted))
    removed=[]
    def deletion(c,a):
        if a!=0x145bb67a0:return False
        removed.append(bytes(c.u.mem_read(get('RCX'),get('RDX'))).decode())
        setr('RAX',0);c._return();return True
    cpu.extensions.append(deletion)
    for count in (0,1,4,5,6,7,19,20,21,31):
        cpu.heap=cpu.H+0x10000
        cpu.u.mem_write(cpu.H,bytes(0x10000))
        base=cpu.H+0x5000
        names=[f'Saves/Backup {i:04}.sav' for i in range(count)]
        for i,name in enumerate(reversed(names)):
            raw=name.encode();at=cpu.alloc(len(raw));cpu.u.mem_write(at,raw)
            cpu.put(base+i*32,len(raw),at,len(raw),0)
        cpu.stops.clear()
        for i in range(1,count):cpu.call(0x1459a9520,base,base+i*32)
        ordered=[bytes(cpu.u.mem_read(cpu.q(base+i*32+8),cpu.q(base+i*32+16))).decode()
                 for i in range(count)]
        assert ordered==names,(count,ordered)
        removed.clear()
        setr('RBP',cpu.S+0x100000);setr('RSP',cpu.S+0xf0000)
        setr('RDI',base);setr('RBX',count)
        block(0x1458efe28,[0x1458efeac],10000)
        assert removed==list(reversed(names[:max(0,count-5)])),(count,removed)
        cases.append(dict(contract='retention',count=count,ordered=ordered,removed=removed.copy()))
    for seconds in (0,1,59,60,3599,3600,86399,86400,951782399,951782400,
                    951868800,1700000000,2147483647,2147483648,4107542400,
                    4133980800,253402300799,2**32-1,2**40,2**64-1):
        setr('RBP',cpu.S+0x100000);setr('RSI',seconds)
        block(0x1458ef92a,[0x1458efb1b],1000)
        actual=[cpu.q(cpu.S+0x100000+i) for i in (0xe60,0xe68,0xe70,0xe58,0xe50,0xe78)]
        days=seconds//86400+719468;era=days//146097;doe=days-era*146097
        yoe=(doe-doe//1460+doe//36524-doe//146096)//365;year=yoe+era*400
        doy=doe-(365*yoe+yoe//4-yoe//100);mp=(5*doy+2)//153
        day=doy-(153*mp+2)//5+1;month=mp+(3 if mp<10 else -9);year+=month<=2
        time=seconds%86400
        expected=[year,month,day,time//3600,time//60%60,time%60]
        assert actual==expected,(seconds,actual,expected)
        cases.append(dict(contract='utc-calendar',seconds=seconds,fields=actual))
    record=dict(target_version='0.109.0',target_sha256=SHA,target_executed=False,
                compilation=False,case_count=len(cases),cases=cases,
                seams=['shared Save instruction-fixture allocation/metadata/cache seams',
                       'filesystem deletion records request and returns success'],
                limitations=['No clock, filesystem, application or platform I/O is executed.'])
    if args.write:
        DEST.mkdir(parents=True,exist_ok=True)
        (DEST/'manifest.json').write_text(json.dumps(dict(target_version='0.109.0',target_sha256=SHA,
            native_helpers=ranges,curated=curated,shared_helpers='docs/analysis/evidence/0.109.0/save-schema/manifest.json'),indent=2)+'\n')
        (DEST/'native-vectors.json').write_text(json.dumps(record,indent=2)+'\n')
    else:
        assert json.loads((DEST/'native-vectors.json').read_text())==record
    print(f'PASS {len(cases)} original-instruction default/hourly/calendar/Path-order/retention cases; no compilation or native filesystem I/O')

if __name__=='__main__':main()

#!/usr/bin/env python3
"""Replay current critical damage with synthetic memory and unchanged native bytes.

This executes finite instruction contracts in Unicorn, not Rust or a game.
The selected full PE preserves referenced constants and dispatch tables.
"""
import sys,struct,json,importlib.util,itertools
from pathlib import Path
import argparse,hashlib
ROOT=Path(__file__).resolve().parents[1]

sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
from coverage_common import latest_target,target_bytes
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64
from unicorn import x86_const as r
s=importlib.util.spec_from_file_location('pe',str(ROOT/'scripts/inventory-executable.py'));m=importlib.util.module_from_spec(s);s.loader.exec_module(m);target=latest_target(verify=True);assert target['sha256']=='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a';p=m.PE(target_bytes(target))
f=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
bits=lambda v:struct.unpack('<I',struct.pack('<f',v))[0]
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size']) for s in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for sec in p.sections:u.mem_write(p.image_base+sec['rva'],p.data[sec['raw_offset']:sec['raw_offset']+sec['raw_size']])
mem,stack,stop=0x200000000,0x300000000,0x400000000
u.mem_map(mem,0x20000);u.mem_map(stack,0x10000);u.mem_map(stop,4096)
def put(a,fmt,*v):u.mem_write(a,struct.pack('<'+fmt,*v))
rows=[]
for kind,rank,hp,flag,corruption,supremacy,crit in itertools.product(range(1,9),[0,1,2,3],[29.,30.,100.],['missing','ordinary','boss','elite'],[False,True],[False,True],[False,True]):
 u.mem_write(mem,bytes(0x20000));u.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
 game,pet,definition,stats,aura,actors,effects,talents,talentdef,key,dots=[mem+x for x in [0,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000,0x8000,0x9000,0xa000,0xb000]]
 put(game+0xd0,'QQ',pet,1);put(pet+0x18,'Q',definition);put(pet+0x70,'f',1.25);put(definition+0x39,'B',kind)
 statrows=[(17,.2),(29,.1),(32,1. if supremacy else 0.)]
 put(game+0x7f8,'QQ',stats,len(statrows))
 for i,(tag,value) in enumerate(statrows):put(stats+i*8,'B3xf',tag,value)
 put(game+0x390,'QQ',aura,1);put(aura,'IffIf',10,.4,0.,0,20.)
 put(game+0xa4c,'f',10.);put(game+0x4c0,'f',.25);put(game+0x48c,'f',1. if crit else -.2);put(game+0x490,'f',1.7)
 put(game+0x4a0,'f',.12);put(game+0x4cc,'f',.3)
 put(game+0x568,'QQ',actors,0 if flag=='missing' else 1)
 put(actors+0xf0,'Q',51);put(actors+0x18,'q',0 if flag=='boss' else -1);put(actors+0x1d0,'B',int(flag=='elite'))
 put(actors+0x158,'ff',hp,100.)
 if corruption:put(actors+8,'QQ',dots,1);put(dots+0x10,'I',172)
 put(game+0x828,'QQ',effects,1);put(effects,'BB',30,rank)
 if rank:
  put(game+0x1d0,'QQ',talents,1);put(talents,'QB',talentdef,rank);put(talentdef+0x30,'QQ',key,13);u.mem_write(key,b'soul_devourer')
 put(game+0x9b8,'4Q',1,2,3,4)
 put(stack+0x8008,'Q',stop);u.reg_write(r.UC_X86_REG_RSP,stack+0x8008);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,0);u.reg_write(r.UC_X86_REG_R9,51);u.reg_write(r.UC_X86_REG_XMM2,bits(30.))
 u.emu_start(0x14595c200,stop,count=5000);assert u.reg_read(r.UC_X86_REG_RIP)==stop
 actual=u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff;critical=bool(u.reg_read(r.UC_X86_REG_RAX)&255)
 mult=f(f(1.25*f(f(.2)+1.+f(f(.4)*f(1.+f(.25)))))*f(1.3))
 fraction=f(min(max(f(1.-f(f(hp)/100.)),0.),1.)) if flag!='missing' else 0.
 if kind==1:mult=f(mult*f(1.05))
 elif kind==2 and rank:mult=f(mult*f(f(f(fraction*f([.005,.01,.02][rank-1]))*100.)+1.))
 elif kind==3:mult=f(mult*f(f(f(f(f(.3)*2.)+1.)+f(f(.12)*3.))*f(1.1)))
 elif kind==4 and flag!='missing' and corruption:mult=f(mult*f(1.2))
 elif kind==5 and flag!='missing' and fraction>f(.7):mult=f(mult*f(1.5))
 elif kind==7 and flag in ['boss','elite'] and supremacy:mult=f(mult*f(f(rank*f(.02))+1.))
 power=f(30.*mult);power=f(power*f(1.7)) if crit else power
 if actual!=bits(power) or critical!=crit:
  print('MISMATCH',kind,rank,hp,flag,corruption,supremacy,crit,hex(actual),hex(bits(power)),critical,mult);raise SystemExit(1)
 rows.append(dict(kind=kind,rank=rank,health=hp,target=flag,corruption=corruption,supremacy=supremacy,critical=crit,damage_bits=actual))
proof = dict(target_sha256=latest_target()['sha256'], case_count=len(rows),
    cases_sha256=hashlib.sha256(json.dumps(rows,sort_keys=True,separators=(',',':')).encode()).hexdigest(),
    input=dict(base=30.0,power_multiplier=1.25,demon_damage=.2,demon_crit=.1,aura_value=.4,
               buff_bonus=.25,health_bonus=.3,damage_reduction=.12,crit_multiplier=1.7),
    cases=[row for row in rows if row['corruption'] and row['supremacy'] and row['rank'] in [1,3]
           and row['health'] in [29.,100.] and row['target'] in ['missing','ordinary','boss']],
    limits=['Exact current original instructions with synthetic Game/vector/actor/aura/spec memory.',
            'Finite scalar inputs; source is traced but Rust/engine/game not executed.',
            'No compilation, target process, visual/gameplay/platform or original/rebuilt parity.'])
parser=argparse.ArgumentParser(description='Replay current demon damage instructions without compilation or game launch.')
parser.add_argument('--write',action='store_true',help='stage a compact proof under ignored runtime/')
args=parser.parse_args()
proof_path=ROOT/'docs/analysis/evidence/0.112.0/demon-damage/critical-vectors.json'
if args.write:
    out=ROOT/'runtime/native-evidence/0.112.0/demon-damage';out.mkdir(parents=True,exist_ok=True)
    (out/'critical-vectors.json').write_text(json.dumps(proof,indent=2)+'\n')
else:
    assert json.loads(proof_path.read_text())==proof,'Current native critical proof differs'
    manifest=json.loads((proof_path.parent/'manifest.json').read_text())
    assert manifest['target_sha256']==proof['target_sha256']
    for row in manifest['ranges']:
        offset=p.rva_offset(int(row['address'],16)-p.image_base)
        assert hashlib.sha256(p.data[offset:offset+row['byte_count']]).hexdigest()==row['sha256']
        if row.get('assembly'):
            assert hashlib.sha256((proof_path.parent/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256']
    source=(ROOT/'crates/azeroth-survivors-re/src/run_effects/demons.rs').read_text()
    assert '[0.005, 0.01, 0.02]' in source and 'stats.damage_reduction * 3.0' in source
    assert '1 => multiplier *= 1.05' in source and 'stats.supremacy' in source
    live=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/demons.rs').read_text()
    assert 'demon.config.crit_bonus\n' not in live and 'demon.config.imp_bonus + ' not in live
    assert 'demon.config.echo_chance + ' not in live
print(json.dumps(dict(original_instruction_cases=len(rows),retained_regression_cases=len(proof['cases']),
                     target_sha256=proof['target_sha256'],compilation='not_run',parity='unverified')))

"""Current0.109.0 guardian modifier/stat oracle; no game/process launch.

Executes unchanged x86-64 instructions. Zone resolution, temporary curve-vector
construction/free and powf are explicit stubs. Powf results are injected, so
these fixtures verify the callers' arithmetic and arguments, not CRT powf.
"""
from script_sources import load_script
from native_recovery import reset_machine
from pathlib import Path
import argparse,re,math
import hashlib
import importlib.util
import json
import struct
import sys

ROOT = Path.cwd()
sys.path.insert(0,str(ROOT/"scripts"))
sys.path[:0]=[str(ROOT / "runtime/tool-state/python/armory/python-libs"),str(ROOT / "runtime/tool-state/python/camera/python-libs")]
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

from coverage_common import latest_target,target_bytes
TARGET_SHA256='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
target=latest_target(verify=False);assert target['sha256']==TARGET_SHA256
data=target_bytes(target)
inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
pe = inventory.PE(data)
NATIVE_RANGES = {
    "health": [(0x14599c1f0, 0x14599c550)],
    "damage": [(0x14599c5f0, 0x14599c77f)],

}
uc = Uc(UC_ARCH_X86, UC_MODE_64)
image_size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
uc.mem_map(pe.image_base, (image_size + 4095) & ~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
GAME, CURVE, ACTOR, STACK, STOP = 0x200000000, 0x200010000, 0x200020000, 0x300000000, 0x400000000
uc.mem_map(GAME, 0x30000)
uc.mem_map(STACK, 0x20000)
uc.mem_map(STOP, 4096)
active, zone_index, curve, pow_result, events = None, 0, [], 0, []


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def putu(address, value):
    uc.mem_write(address, struct.pack("<I", value))


def putq(address, value):
    uc.mem_write(address, struct.pack("<Q", value))


def readu(address):
    return struct.unpack("<I", uc.mem_read(address, 4))[0]


def readq(address):
    return struct.unpack("<Q", uc.mem_read(address, 8))[0]


def return_stub():
    sp = uc.reg_read(UC_X86_REG_RSP)
    uc.reg_write(UC_X86_REG_RSP, sp + 8)
    uc.reg_write(UC_X86_REG_RIP, readq(sp))


def hook(_, address, size, __):
    if address in (STOP, 0x1454cdeea):
        uc.emu_stop()
    elif any(a <= address < b for a, b in NATIVE_RANGES[active]):
        return
    elif address == 0x14588d0d0:
        uc.reg_write(UC_X86_REG_RAX, zone_index)
        return_stub()
    elif address == 0x1459be5c0:
        output = uc.reg_read(UC_X86_REG_RCX)
        for index, (time, hp) in enumerate(curve):
            putu(CURVE + index * 8, time)
            putu(CURVE + index * 8 + 4, hp)
        putq(output, len(curve))
        putq(output + 8, CURVE)
        putq(output + 16, len(curve))
        return_stub()
    elif address == 0x1400021d0:
        return_stub()
    elif address == 0x145bfa165:
        events.append({"base_bits": uc.reg_read(UC_X86_REG_XMM0) & 0xffffffff,
                       "exponent_bits": uc.reg_read(UC_X86_REG_XMM1) & 0xffffffff,
                       "result_bits": pow_result})
        uc.reg_write(UC_X86_REG_XMM0, pow_result)
        return_stub()
    else:
        raise RuntimeError(f"Out-of-scope native instruction {address:x} in {active}")


uc.hook_add(UC_HOOK_CODE, hook)


def reset():
    reset_machine(uc, globals(), GAME, STACK, STOP)


def execute(kind):
    global active
    active = kind
    uc.emu_start(NATIVE_RANGES[kind][0][0], 0, count=100000)
    assert uc.reg_read(UC_X86_REG_RIP) in (STOP, 0x1454cdeea)
    return uc.reg_read(UC_X86_REG_XMM0) & 0xffffffff


def native_knots(index):
    bosses = readq(0x146bde390 + index * 0xf0 + 0x88)
    return [[readu(bosses + i * 0x68 + 0x50), readu(bosses + i * 0x68 + 0x54)]
            for i in range(5) if uc.mem_read(bosses + i * 0x68 + 0x64, 1)[0] != 1]


stat_cases = []
inputs = [
    ("start", 0., 1., 0, 100, 100, 0, False, 0., 1.),
    ("early", 30., 1., 0, 100, 100, 1, False, 0., 1.),
    ("first_knot", 180., 1., 0, 100, 100, 1, False, 0., 1.),
    ("between_knots", 337.5, 1.5, 2, 175, 80, 1, False, 0., 1.),
    ("late_extrapolation", 1800., 2.25, 21, 300, 250, 1, False, 0., 1.),
    ("maximum_integer_modifiers", 720., 0.75, 0xffffffff, 65535, 65535, 1, False, 0., 1.),
    ("zero_percent", 600., 1., 2, 0, 0, 1, False, 0., 1.),
    ("endless_at_start", 720., 1., 2, 100, 100, 1, True, 720., 1.),
    ("endless_future_start_clamps", 600., 1., 2, 100, 100, 1, True, 720., 1.),
    ("endless_one_minute_injected_pow", 780., 1., 3, 100, 100, 1, True, 720., 2.),
    ("endless_fractional_injected_pow", 817.5, 1., 3, 100, 100, 1, True, 720., 1.375),
    ("endless_wrong_phase", 780., 1., 3, 100, 100, 0, True, 720., 2.),
]
for zone_index in range(12):
    zone = 0x146bde390 + zone_index * 0xf0
    enemies, count = readq(zone + 0x78), readq(zone + 0x80)
    for enemy_index in (0, count - 1):
        for label, clock, difficulty, kills, hp_pct, dmg_pct, phase, endless, start, power in inputs:
            reset()
            curve = native_knots(zone_index)
            pow_result = bits(power)
            for offset, value in [(0xa34,bits(clock)), (0xaa8,bits(difficulty)),
                                  (0x75c,kills), (0x970,phase), (0x974,bits(start))]:
                putu(GAME+offset,value)
            uc.mem_write(GAME+0x2b2,struct.pack("<HH",hp_pct,dmg_pct))
            uc.mem_write(GAME+0xab8,bytes([endless]))
            outputs, calls = {}, {}
            for kind in ("health", "damage"):
                sp = STACK + 0x1f008
                putq(sp,STOP)
                uc.reg_write(UC_X86_REG_RSP,sp)
                uc.reg_write(UC_X86_REG_RCX,GAME)
                uc.reg_write(UC_X86_REG_RDX,enemy_index)
                events = []
                outputs[kind+"_bits"] = execute(kind)
                calls[kind] = events
            stat_cases.append({"label": label, "zone_index":zone_index, "enemy_index":enemy_index,
                "clock_bits":bits(clock), "difficulty_bits":bits(difficulty),
                "zone_scale_bits":readu(zone+0xe0), "guardian_kills":kills,
                "hp_percent":hp_pct, "damage_percent":dmg_pct, "phase":phase,
                "endless":endless, "endless_start_bits":bits(start),
                "pow_result_bits":pow_result, "base_hp_bits":readu(enemies+enemy_index*0x50+0x30),
                "base_damage_bits":readu(enemies+enemy_index*0x50+0x34),
                "hp_knots_bits":curve, "pow_calls":calls, **outputs})


def f(v):return struct.unpack("<f",struct.pack("<f",v))[0]
def fb(v):return struct.unpack("<f",struct.pack("<I",v))[0]
b=stat_cases
for c in b:
 t=f(fb(c['clock_bits'])/60);zd=f(fb(c['zone_scale_bits'])*fb(c['difficulty_bits']));knots=[[fb(v)for v in row]for row in c['hp_knots_bits']]
 if not knots:curve=0.
 elif len(knots)==1:curve=knots[0][1]
 elif knots[0][0]>=t:curve=f(f(f(f(f(.4)*t)/max(knots[0][0],f(.001)))+f(.6))*knots[0][1])
 else:
  i=max(1,next((i for i,k in enumerate(knots)if k[0]>=t),len(knots)-1));prev,nxt=knots[i-1],knots[i];curve=f(f(f(f(t-prev[0])*f(nxt[1]-prev[1]))/max(f(nxt[0]-prev[0]),f(.001)))+prev[1])
 power=fb(c['pow_result_bits'])if c['phase']==1 and c['endless']else 1.
 curve=f(f(curve*f(.6))*zd);linear=f(f(f(.12)*t)+1);quad=f(f(f(.009)*t)*t);poly=f(f(f(f(quad+linear)*zd)*fb(c['base_hp_bits']))*f(2.5));selected=f(f(max(curve,poly)*3)*power);health=f(f(f(f(c['guardian_kills'])*f(.25))+1)*selected);health=f(health*f(c['hp_percent']/100))
 linear=f(f(f(.08)*t)+1);quad=f(f(f(.004)*t)*t);poly=f(quad+linear);td=f(f(math.sqrt(zd))*poly);damage=f(f(f(fb(c['base_damage_bits'])*td)*f(1.4))*power);damage=f(f(f(f(c['guardian_kills'])*f(.05))+1)*damage);damage=f(f(c['damage_percent']/100)*damage)
 assert [bits(health),bits(damage)]==[c['health_bits'],c['damage_bits']],(c['zone_index'],c['enemy_index'],c['label'],[bits(health),bits(damage)],[c['health_bits'],c['damage_bits']])

source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text();knots_source=re.findall(r'static [A-Z_]+_HP_KNOTS: &\[HealthKnot\] = &\[(.*?)\n\];',source,re.S);assert len(knots_source)==12
source_knot_fields=0
for zi,block in enumerate(knots_source):
 source_bits=[int(x,16)for x in re.findall(r'f32::from_bits\(0x([0-9a-f]+)',block)];expected=[v for pair in native_knots(zi)for v in pair];assert source_bits==expected,(zi,source_bits,expected);source_knot_fields+=len(expected)
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
md=Cs(CS_ARCH_X86,CS_MODE_64);out=ROOT/'docs/analysis/evidence/runmods-scaling';ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
if args.write:out.mkdir(parents=True,exist_ok=True)
ranges=[]
# Current guardian input records already own the omitted middle ranges.
for name,a,b in [('guardian-health-prologue',0x14599c1f0,0x14599c230),('guardian-health-math',0x14599c297,0x14599c550),('guardian-damage-prologue',0x14599c5f0,0x14599c612),('guardian-damage-math',0x14599c67a,0x14599c77f)]:
 off=pe.rva_offset(a-pe.image_base);raw=data[off:off+b-a];ins=list(md.disasm(raw,a));assert sum(i.size for i in ins)==len(raw);assembly=''.join(f'{i.address:#x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins);p=out/(name+'.asm')
 if args.write:p.write_text(assembly)
 else:assert p.read_text()==assembly
 ranges.append(dict(role=name,start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw).hexdigest(),assembly=p.name))
queries=[]
for a in ['14599c1f0','14599c5f0']:
 path=ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0'/a/'rea-fast/003-procedure_pseudo_code.json'
 if path.exists():
  z=json.loads(path.read_text())['response']['result']['structuredContent'];queries.append(dict(procedure='0x'+a,evidence_id=z['evidence_id'],subject_sha256=z['subject']['digest']['sha256'],analysis_profile_digest=z['analysis_profile']['digest']))
if not queries:queries=json.loads((out/'guardian-manifest.json').read_text())['ghidra']
manifest=dict(target_sha256=TARGET_SHA256,ranges=ranges,ghidra=queries,canonical_health_inputs='../guardian-signatures/zone-health-inputs.asm',canonical_damage_inputs='../guardian-signatures/zone-enemy-inputs.asm',checks=dict(stat_pairs=len(stat_cases),source_knot_fields=source_knot_fields),limits=['Original complete guardian HP/damage bodies execute. Zone resolver, curve-vector construction/free and Windows powf are explicit seams.','Actual current boss knots supply the curve fixture. Independent scalar-f32 transcription of source arithmetic matches all288 HP/damage pairs.','This neither compiles nor executes Rust and does not certify the complete guardian constructor, schedules, combat, packets, terrain or gameplay parity.'])
fields=['zone_index','enemy_index','label','guardian_kills','difficulty_bits','hp_percent','damage_percent','health_bits','damage_bits'];vectors=[{k:c[k]for k in fields}for c in stat_cases]
for name,value in [('guardian-manifest.json',manifest),('guardian-vectors.json',vectors)]:
 text=json.dumps(value,separators=(',',':'))+'\n';p=out/name
 if args.write:p.write_text(text)
 else:assert p.read_text()==text,name
print(f'Current guardian modifiers: {len(stat_cases)} HP/damage pairs; no build/game')

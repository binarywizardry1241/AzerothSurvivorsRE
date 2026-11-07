"""Check 0.117.0 cooperative descriptors, predicates and unlock rows statically.

Executes selected original instructions under Unicorn with explicit typed memory,
allocation, byte operations, locale misses, clock and save-insertion seams.
No Rust compilation, application, filesystem save or network executes.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
import argparse
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--stage', action='store_true', help='Write candidate proof under runtime')
parser.add_argument('--require-retained-queries', action='store_true')
parser.add_argument('--constructor-only', action='store_true',
    help='Replay only the original constructor and check display fields, catalog loader and totals')
args = parser.parse_args()
if args.constructor_only and (args.stage or args.require_retained_queries):
    parser.error('--constructor-only is read-only and does not consume Ghidra receipts')
EVIDENCE = ROOT / ('runtime/analysis/history/native-recovery/target/6f083622318f/coop-achievements/staged' if args.stage else 'docs/analysis/evidence/coop-achievements')
def emit_json(name, value):
    path = EVIDENCE / name
    if args.stage:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(value, indent=2, ensure_ascii=False)+'\n')
    else:
        assert json.loads(path.read_text()) == value, name
sys.path[:0] = [str(ROOT / 'scripts'), str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
from coverage_common import latest_target, target_bytes
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as r

spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
target = latest_target(verify=True)
assert target['sha256'] == '507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293'
data = target_bytes(target)
pe = inventory.PE(data)
canonical = ROOT/'docs/analysis/evidence/coop-achievements'
if not args.constructor_only:
    manifest = json.loads((canonical/'manifest.json').read_text())
    assert manifest['target']['sha256'] == target['sha256']
    for record in manifest['ranges']:
        offset = pe.rva_offset(int(record['va'],16)-pe.image_base)
        raw = data[offset:offset+record['byte_count']]
        assert hex(offset) == record['file_offset']
        assert hashlib.sha256(raw).hexdigest() == record['sha256'], record['role']
    assert hashlib.sha256((ROOT/manifest['source_asset']).read_bytes()).hexdigest() == manifest['source_asset_sha256']
    receipts = json.loads((canonical/'ghidra.json').read_text())
    assert receipts['target_sha256'] == target['sha256']
    for receipt in receipts['queries']:
        for field in ['plan','result']:
            path=ROOT/receipt[field]
            if path.is_file():
                assert hashlib.sha256(path.read_bytes()).hexdigest() == receipt[field+'_sha256']
            else:
                assert not args.require_retained_queries, receipt[field]
u = Uc(UC_ARCH_X86, UC_MODE_64)
image_size = max(row['rva'] + max(row['virtual_size'], row['raw_size']) for row in pe.sections)
u.mem_map(pe.image_base, (image_size + 4095) & ~4095)
for row in pe.sections:
    u.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset']+row['raw_size']])
HEAP, STACK = 0x200000000, 0x300000000
u.mem_map(HEAP, 0x800000)
u.mem_map(STACK, 0x10000)
cursor = HEAP
visited, calls = {}, {}

def alloc(size):
    global cursor
    value = cursor
    cursor += (max(1, size) + 15) & ~15
    assert cursor < HEAP + 0x800000
    return value

def getq(address):
    return struct.unpack('<Q', u.mem_read(address, 8))[0]

def putq(address, value):
    u.mem_write(address, struct.pack('<Q', value))

def pair(address):
    return bytes(u.mem_read(getq(address), getq(address+8))).decode()

def hook(_, address, size, unused):
    if address == 0x145b4553c:
        u.emu_stop()
        return
    if 0x145b4443d <= address < 0x145b4553c or 0x145b45929 <= address < 0x145b45bee:
        offset = pe.rva_offset(address - pe.image_base)
        original = data[offset:offset+size]
        assert bytes(u.mem_read(address, size)) == original
        visited[address] = original.hex()
        return
    calls[address] = calls.get(address, 0) + 1
    rcx, rdx, r8, sp = [u.reg_read(reg) for reg in
        (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_RSP)]
    if address == 0x145b29c00:
        # Explicit locale miss: constructors retain the exact embedded English.
        u.reg_write(r.UC_X86_REG_RAX, 0)
    elif address == 0x140002200:
        pass
    elif address == 0x1400021c0:
        u.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
    elif address == 0x145f93cdb:
        u.mem_write(rcx, bytes(u.mem_read(rdx, r8)))
        u.reg_write(r.UC_X86_REG_RAX, rcx)
    elif address == 0x145ff8570:
        assert getq(rcx) == 0 and getq(rcx+16) == 0
        putq(rcx, 14)
        putq(rcx+8, alloc(14 * 152))
    else:
        raise RuntimeError(f'Unreviewed call {address:#x} from {getq(sp)-5:#x}')
    u.reg_write(r.UC_X86_REG_RSP, sp+8)
    u.reg_write(r.UC_X86_REG_RIP, getq(sp))

bp = STACK + 0x1000
u.reg_write(r.UC_X86_REG_RBP, bp)
u.reg_write(r.UC_X86_REG_RSP, STACK+0x8000)
putq(bp+0xdc8, 0)
putq(bp+0xdd0, 8)
putq(bp+0xdd8, 0)
hook_id = u.hook_add(UC_HOOK_CODE, hook)
u.emu_start(0x145b4443d, 0, count=200000)
assert u.reg_read(r.UC_X86_REG_RIP) == 0x145b4553c
assert getq(bp+0xdd8) == 14
rows = []
for index in range(14):
    at = getq(bp+0xdd0) + index*152
    raw = bytes(u.mem_read(at, 152))
    rows.append(dict(key=pair(at+8), name=pair(at+32), description=pair(at+56),
        kind=raw[72], payload=raw[73:128].hex(), icon=pair(at+128),
        points=struct.unpack_from('<I', raw, 144)[0], category=raw[148]))
assert all(row['key'].startswith('coop:') and row['category'] == 5 for row in rows)
output = dict(target_sha256=target['sha256'], records=rows,
    executed_instruction_count=len(visited), executed_instruction_digest=hashlib.sha256(
        json.dumps(visited, sort_keys=True).encode()).hexdigest(),
    calls={hex(key):value for key,value in calls.items()})
emit_json('constructor-native.json', output)
print('Recovered', len(rows), 'cooperative descriptors /', sum(row['points'] for row in rows), 'points')

def check_display_catalog(records):
    """Shared display foundation; no predicate, codec or artwork interpretation."""
    asset = json.loads((ROOT/'crates/azeroth-survivors-re/assets/coop-achievements-0.117.0.json').read_text())
    assert asset['target_sha256'] == target['sha256']
    fields = ['key','name','description','icon','points','category']
    project = lambda record: {field:record[field] for field in fields}
    assert [project(record) for record in asset['achievements']] == [project(record) for record in records]
    prior = json.loads((ROOT/'crates/azeroth-survivors-re/assets/rewards-catalogs-0.112.0.json').read_text())
    combined = prior['achievements'] + asset['achievements']
    assert len(prior['achievements']) == 84
    assert len(combined) == 98 and sum(record['points'] for record in combined) == 2270
    ui = (ROOT/'crates/azeroth-survivors-re/src/progression.rs').read_text()
    loader = ui.split('impl Catalog {',1)[1].split('fn achievement(',1)[0]
    assert 'let mut catalog: Self' in loader
    assert '../assets/rewards-catalogs-0.112.0.json' in loader
    assert 'achievements: Vec<Achievement>' in loader
    assert 'let cooperative: CooperativeAchievements = serde_json::from_str(include_str!(' in loader
    assert '../assets/coop-achievements-0.117.0.json' in loader
    assert 'catalog.achievements.extend(cooperative.achievements)' in loader
    assert re.search(r'assert_eq!\(catalog\.achievements\.len\(\),\s*98\)', ui)
    assert re.search(r'\.sum::<u32>\(\),\s*2270', ui)
    print('Passed fourteen display descriptors and live Catalog loader / 98 achievements / 2270 points')

check_display_catalog(rows)
if args.constructor_only:
    raise SystemExit(0)

u.hook_del(hook_id)
STOP = 0x400000000
u.mem_map(STOP, 4096)
members_at = alloc(64)
condition_at = alloc(32)
lookup_calls = set()
helper_visited = {}

def helper_hook(_, address, size, unused):
    if address == STOP:
        u.emu_stop()
        return
    if 0x145b39980 <= address < 0x145b39c91 or 0x145a7b210 <= address < 0x145a7b2a7:
        offset = pe.rva_offset(address-pe.image_base)
        original = data[offset:offset+size]
        assert bytes(u.mem_read(address, size)) == original
        helper_visited[address] = original.hex()
        return
    sp = u.reg_read(r.UC_X86_REG_RSP)
    if address == 0x145f93ce7:
        left, right, length = [u.reg_read(reg) for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8)]
        lhs, rhs = bytes(u.mem_read(left, length)), bytes(u.mem_read(right, length))
        u.reg_write(r.UC_X86_REG_RAX, ((lhs > rhs)-(lhs < rhs)) & 0xffffffffffffffff)
    else:
        raise RuntimeError(f'Unreviewed helper call {address:#x} from {getq(sp)-5:#x}')
    u.reg_write(r.UC_X86_REG_RSP, sp+8)
    u.reg_write(r.UC_X86_REG_RIP, getq(sp))

def invoke(entry, rcx, rdx=0, r8=0, r9=0):
    sp = STACK+0xf008
    putq(sp, STOP)
    for register, value in [(r.UC_X86_REG_RSP,sp),(r.UC_X86_REG_RCX,rcx),
        (r.UC_X86_REG_RDX,rdx),(r.UC_X86_REG_R8,r8),(r.UC_X86_REG_R9,r9)]:
        u.reg_write(register,value)
    u.emu_start(entry, 0, count=1000000)
    assert u.reg_read(r.UC_X86_REG_RIP) == STOP
    return u.reg_read(r.UC_X86_REG_RAX)

def condition(kind, key='', class_id=0):
    key_bytes = key.encode()
    key_at = alloc(len(key_bytes))
    if key_bytes:
        u.mem_write(key_at,key_bytes)
    u.mem_write(condition_at, struct.pack('<QQQB7x', kind,key_at,len(key_bytes),class_id))

def native_party(kind, members, key='', class_id=0):
    condition(kind,key,class_id)
    u.mem_write(members_at, bytes(64))
    for index, member in enumerate(members):
        u.mem_write(members_at+index*8,struct.pack('<IBB2x',member['word'],member['class'],member['byte']))
    return bool(invoke(0x145b39980,condition_at,members_at,len(members)) & 1)

def member(class_id, word=0, byte=0):
    return {'class':class_id,'word':word,'byte':byte}

helper_hook_id = u.hook_add(UC_HOOK_CODE, helper_hook)
helper_cases = []
for kind in range(6):
    class_id = 11 if kind == 1 else 2
    key = 'tranquility' if kind == 1 else 'consecration' if kind == 2 else ''
    for count in range(7):
        values=[member(class_id,26573,1) for _ in range(count)]
        actual=native_party(kind,values,key,class_id)
        expected=count > 0 if kind == 3 else count == 5 and kind != 4
        assert actual == expected,(kind,count,actual)
        helper_cases.append(dict(kind=kind,key=key,class_id=class_id,members=values,matches=actual))
for kind,key,class_id,spell,flag in [(0,'',3,0,0),(1,'tranquility',11,0,1),
    (1,'bladestorm',1,0,2),(2,'consecration',2,26573,0),(2,'magma_totem',7,8190,0)]:
    baseline=[member(class_id,spell,flag) for _ in range(5)]
    assert native_party(kind,baseline,key,class_id)
    for index in range(5):
        for value in range(256):
            values=[dict(row) for row in baseline]
            values[index]['class']=value
            actual=native_party(kind,values,key,class_id)
            assert actual == (value == class_id),(kind,index,value)
            helper_cases.append(dict(kind=kind,key=key,class_id=class_id,members=values,matches=actual))
        if kind == 1:
            for bits in range(256):
                values=[dict(row) for row in baseline]
                values[index]['byte']=bits
                actual=native_party(kind,values,key,class_id)
                assert actual == bool(bits & flag),(key,index,bits)
                helper_cases.append(dict(kind=kind,key=key,class_id=class_id,members=values,matches=actual))
        if kind == 2:
            for word in [0,1,spell-1,spell,spell+1,0xffffffff]:
                values=[dict(row) for row in baseline]
                values[index]['word']=word
                actual=native_party(kind,values,key,class_id)
                assert actual == (word == spell),(key,index,word)
                helper_cases.append(dict(kind=kind,key=key,class_id=class_id,members=values,matches=actual))
for values,expected in [([1,2,3,4,5],True),([0,1,2,3,255],True),([1,2,3,4,1],False)]:
    assert native_party(4,[member(value) for value in values]) == expected
    helper_cases.append(dict(kind=4,members=[member(value) for value in values],matches=expected))
helper_output = dict(target_sha256=target['sha256'],case_count=len(helper_cases),
    cases_sha256=hashlib.sha256(json.dumps(helper_cases,sort_keys=True,separators=(',',':')).encode()).hexdigest(),
    executed_instruction_count=len(helper_visited),
    executed_instruction_sha256=hashlib.sha256(json.dumps(helper_visited,sort_keys=True).encode()).hexdigest())
emit_json('composition-native.json', helper_output)
print('Passed', len(helper_cases), 'original party-composition cases')

u.hook_del(helper_hook_id)
catalog_at = getq(bp+0xdd0)
native_by_key = {row['key']:catalog_at+index*152 for index,row in enumerate(rows)}
u.mem_write(0x148504568,struct.pack('<QQQI4x',14,catalog_at,14,0))
putq(0x148507260,0)
tls = alloc(16)
pending = []
run_visited = {}
zones = ['elwynn','duskwood','wsg','ungoro','ab','feralas','arena','sm','av','brm','aq','naxx']

def combined_hook(_, address, size, unused):
    if address == STOP or 0x145b39980 <= address < 0x145b39c91 or 0x145a7b210 <= address < 0x145a7b2a7 or address == 0x145f93ce7:
        return helper_hook(_,address,size,unused)
    if 0x145b48e10 <= address < 0x145b498d6 or 0x145b47600 <= address < 0x145b48c9e:
        offset = pe.rva_offset(address-pe.image_base)
        original = data[offset:offset+size]
        assert bytes(u.mem_read(address,size)) == original
        run_visited[address] = original.hex()
        return
    sp = u.reg_read(r.UC_X86_REG_RSP)
    rcx,rdx,r8 = [u.reg_read(reg) for reg in (r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8)]
    if address == 0x145b2c9d0:
        u.reg_write(r.UC_X86_REG_RAX,tls)
    elif address == 0x145ac2a90:
        pending.append(bytes(u.mem_read(rdx,r8)).decode())
    elif address == 0x145f415a0:
        filetime=116444736000000000+1700000000*10000000
        u.reg_write(r.UC_X86_REG_RAX,filetime&0xffffffff)
        u.reg_write(r.UC_X86_REG_RDX,filetime>>32)
    elif address == 0x145f41550:
        u.mem_write(rcx,struct.pack('<QQ',0,1700000000))
    elif address == 0x145f94270:
        assert getq(rcx) == 0 and getq(rcx+16) == 0
        putq(rcx,14);putq(rcx+8,alloc(14*8))
    elif address == 0x145c32ac0:
        values=[zones.index(pair(at)) for at in range(rdx,r8,16)]
        at=alloc(max(1,len(values))*8)
        if values:u.mem_write(at,struct.pack('<'+'Q'*len(values),*values))
        u.mem_write(rcx,struct.pack('<QQQ',len(values),at,len(values)))
    elif address == 0x140002200 or address == 0x1400021d0:
        pass
    elif address == 0x1400021c0:
        u.reg_write(r.UC_X86_REG_RAX,alloc(rcx))
    else:
        raise RuntimeError(f'Unreviewed run predicate call {address:#x} from {getq(sp)-5:#x}')
    u.reg_write(r.UC_X86_REG_RSP,sp+8)
    u.reg_write(r.UC_X86_REG_RIP,getq(sp))

combined_id=u.hook_add(UC_HOOK_CODE,combined_hook)
account_at,progress_at,history_at=[alloc(n) for n in [0x240,24,12*8]]
account_count=0
for mask in range(4096):
    completed=[zone for zone in range(12) if mask & (1<<zone)]
    u.mem_write(history_at,bytes(12*8))
    if completed:u.mem_write(history_at,struct.pack('<'+'Q'*len(completed),*completed))
    putq(account_at+0xf8,history_at);putq(account_at+0x100,len(completed))
    for key,required in [('coop:together',None),('coop:team',[2,4]),('coop:dragonslayers',[8,9]),('coop:end',list(range(12)))]:
        invoke(0x145b47600,progress_at,account_at,native_by_key[key])
        actual=struct.unpack('<QQQ',u.mem_read(progress_at,24))
        expected=(1,int(bool(completed)),1) if required is None else (1,sum(zone in completed for zone in required),len(required))
        assert actual==expected,(key,mask,actual,expected)
        account_count+=1
print('Passed',account_count,'original cooperative-history progress cases')

def member_memory(values):
    at=alloc(max(1,len(values))*8)
    for index,value in enumerate(values):
        u.mem_write(at+index*8,struct.pack('<IBB2x',value['word'],value['class'],value['byte']))
    return at

def native_run(case):
    pending.clear()
    account=alloc(0x240);snapshot=alloc(0xa0);out=alloc(24)
    values=case['context']['members'];ptr=member_memory(values)
    u.mem_write(snapshot+0x48,struct.pack('<QQQ',len(values),ptr,len(values)))
    events=case['context']['events'];ptr=alloc(max(1,len(events))*40)
    for index,event in enumerate(events):
        members=event['members'];mat=member_memory(members)
        u.mem_write(ptr+index*40,struct.pack('<QQQIIBBB5x',len(members),mat,len(members),
            event['boss'],event['spell'],event.get('school',0),event.get('source_kind',0),int(event.get('melee',False))))
    u.mem_write(snapshot+0x60,struct.pack('<QQQ',len(events),ptr,len(events)))
    u.mem_write(snapshot+0x78,struct.pack('<IB3xQfIII3B5x',case['context']['deaths'],int(case['context']['max_modifiers']),
        case['zone'],0.,0,0,0,int(case['won']),0,0))
    invoke(0x145b48e10,out,account,snapshot)
    returned=[pair(getq(getq(out+8)+index*8)+8) for index in range(getq(out+16))]
    assert returned==pending
    return returned

u.hook_del(combined_id)
unlock_state = None
unlock_visited = {}
def unlock_hook(_,address,size,unused):
    global unlock_state
    if address == STOP:
        u.emu_stop();return
    if (0x145b4a810 <= address < 0x145b4a9ef
        or 0x145c3e300 <= address < 0x145c3e80e
        or 0x145b338f0 <= address < 0x145b3397f):
        offset=pe.rva_offset(address-pe.image_base)
        original=data[offset:offset+size]
        assert bytes(u.mem_read(address,size))==original
        unlock_visited[address]=original.hex()
        return
    rcx,rdx,r8,sp=[u.reg_read(reg) for reg in (r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_R8,r.UC_X86_REG_RSP)]
    if address == 0x145f93ce7:return helper_hook(_,address,size,unused)
    if address == 0x145b29c00:
        u.reg_write(r.UC_X86_REG_RAX,0)
    elif address == 0x145c2a470:
        unlock_state=alloc(240)
        u.mem_write(unlock_state,bytes(u.mem_read(rdx,240)))
        key_pair=alloc(16)
        u.mem_write(key_pair,bytes(u.mem_read(rdx-16,16)))
        for index in range(30):
            if getq(unlock_state+index*8)==rdx-16:putq(unlock_state+index*8,key_pair)
    elif address == 0x145f66a30:
        # The constructed locale lookup key is explicitly a miss. Its temporary
        # String has no observable row output under that admitted locale seam.
        u.mem_write(rcx,struct.pack('<QQQ',0,1,0))
    elif address == 0x1400021d0:
        pass
    else:
        raise RuntimeError(f'Unreviewed unlock call {address:#x} from {getq(sp)-5:#x}')
    u.reg_write(r.UC_X86_REG_RSP,sp+8)
    u.reg_write(r.UC_X86_REG_RIP,getq(sp))

unlock_id=u.hook_add(UC_HOOK_CODE,unlock_hook)
unlocks={}
for row in rows:
    key=row['key'].encode();key_at=alloc(len(key));u.mem_write(key_at,key)
    out=alloc(48);invoke(0x145b4a810,out,key_at,len(key))
    assert unlock_state is not None
    values=[]
    for _ in range(32):
        u.mem_write(out,bytes(48));invoke(0x145c3e300,out,unlock_state)
        if not getq(out):break
        values.append(dict(prefix=pair(out),name=pair(out+16),icon=pair(out+32)))
    else:raise AssertionError('nonterminating unlock iterator')
    unlocks[row['key']]=values
emit_json('unlocks-native.json',dict(target_sha256=target['sha256'],rows=unlocks,executed_instruction_count=len(unlock_visited),
    executed_instruction_sha256=hashlib.sha256(json.dumps(unlock_visited,sort_keys=True).encode()).hexdigest()))
print('Recovered',sum(map(len,unlocks.values())),'ordered current co-op achievement unlock rows')
category_names = ['Zones','Classes','Collection','Feats','Lifetime','Co-op']
for index,name in enumerate(category_names):
    result=invoke(0x145b338f0,index)
    assert bytes(u.mem_read(result,u.reg_read(r.UC_X86_REG_RDX))).decode()==name
category_icons = ['INV_Misc_Map_01','INV_BannerPVP_02','INV_Chest_Plate16',
    'Ability_Warrior_SavageBlow','INV_Misc_PocketWatch_01','Spell_Holy_PrayerOfHealing02']
icon_bytes=''.join(category_icons).encode()
icon_at=data.find(icon_bytes)
assert icon_at>=0 and data.find(icon_bytes,icon_at+1)==-1
emit_json('category-native.json',dict(target_sha256=target['sha256'],names=category_names,
    icons=category_icons,icon_cohort_file_offset=hex(icon_at),icon_cohort_byte_count=len(icon_bytes),
    icon_cohort_sha256=hashlib.sha256(icon_bytes).hexdigest()))
u.hook_del(unlock_id)
combined_id=u.hook_add(UC_HOOK_CODE,combined_hook)
def original(address,size):
    offset=pe.rva_offset(address-pe.image_base)
    return data[offset:offset+size]

def original_text(address,length):
    return original(address,length).decode()

def typed_condition(row):
    raw=bytes([row['kind']])+bytes.fromhex(row['payload'])
    q=lambda offset:struct.unpack_from('<Q',raw,offset)[0]
    if row['kind']==21:return dict(type='first_victory')
    if row['kind']==20:
        if q(16)==0:required=list(range(12))
        else:
            required=[]
            for index in range(q(16)):
                ptr,length=struct.unpack('<QQ',original(q(8)+index*16,16))
                required.append(zones.index(original_text(ptr,length)))
        return dict(type='zone_history',zones=required)
    kinds=['class','talent','highest_spell','any','different_classes','same_class']
    party=dict(kind=kinds[q(24)])
    if q(24)<3:party['class']=raw[48]
    if q(24) in [1,2]:party['key']=original_text(q(32),q(40))
    if row['kind']==8:
        return dict(type='victory',zone=zones.index(original_text(q(8),q(16))) if q(8) else None,
            no_deaths=bool(raw[1]),max_modifiers=bool(raw[2]),party=party)
    assert row['kind']==9
    spells=list(struct.unpack('<'+'I'*q(16),original(q(8),q(16)*4))) if q(16) else []
    return dict(type='boss',boss_id=struct.unpack_from('<I',raw,4)[0],spells=spells,
        max_modifiers=bool(raw[1]),party=party)

asset=dict(target_sha256=target['sha256'],achievements=[])
for row in rows:
    source={key:row[key] for key in ['key','name','description','icon','points','category','kind']}
    source.update(selector=0,target=1,zone=None,feat_kind=None,feat_spell=None,tokens={},
        unlocks=unlocks[row['key']],cooperative=typed_condition(row))
    asset['achievements'].append(source)
assert asset == json.loads((ROOT/'crates/azeroth-survivors-re/assets/coop-achievements-0.117.0.json').read_text()), 'Current source descriptors/conditions/unlocks differ'
def baseline(party):
    kind=party['kind'];cls=party.get('class',1)
    if kind=='different_classes':return [member(value) for value in [1,2,3,4,5]]
    if kind=='any':return [member(1),member(2)]
    flag={'tranquility':1,'bladestorm':2}.get(party.get('key'),0)
    word={'consecration':26573,'magma_totem':8190}.get(party.get('key'),0)
    return [member(cls,word,flag) for _ in range(5)]

def party_model(party,values):
    kind=party['kind']
    if kind=='any':return bool(values)
    if len(values)!=5:return False
    if kind=='same_class':return len({value['class'] for value in values})==1
    if kind=='different_classes':return len({value['class'] for value in values})==5
    if any(value['class']!=party['class'] for value in values):return False
    if kind=='class':return True
    if kind=='talent':return all(value['byte'] & {'tranquility':1,'bladestorm':2}[party['key']] for value in values)
    return all(value['word']=={'consecration':26573,'magma_totem':8190}[party['key']] for value in values)

def run_model(case):
    keys=[];context=case['context']
    for definition in asset['achievements']:
        condition=definition['cooperative'];kind=condition['type']
        if kind=='victory':
            ok=case['won'] and (condition['zone'] is None or condition['zone']==case['zone']) and party_model(condition['party'],context['members']) and (not condition['no_deaths'] or context['deaths']==0) and (not condition['max_modifiers'] or context['max_modifiers'])
        elif kind=='boss':
            ok=(not condition['max_modifiers'] or context['max_modifiers']) and any(event['boss']==condition['boss_id'] and party_model(condition['party'],event['members']) and (not condition['spells'] or event.get('source_kind',0)!=2 and event['spell'] in condition['spells']) for event in context['events'])
        else:ok=False
        if ok:keys.append(definition['key'])
    return keys

import copy
run_cases=[]
for definition in asset['achievements']:
    condition=definition['cooperative'];kind=condition['type']
    if kind not in ['victory','boss']:continue
    values=baseline(condition['party'])
    case=dict(name=definition['key'],zone=condition.get('zone') or 0,won=kind=='victory',
        context=dict(members=values,deaths=0,max_modifiers=True,events=[]))
    if kind=='boss':case['context']['events']=[dict(boss=condition['boss_id'],spell=next(iter(condition['spells']),0),members=values)]
    run_cases.append(case)
    for zone in range(12):
        variant=copy.deepcopy(case);variant.update(name=case['name']+f'/zone{zone}',zone=zone);run_cases.append(variant)
    for count in range(7):
        variant=copy.deepcopy(case);variant['name']+=f'/members{count}';values=(baseline(condition['party'])*6)[:count]
        if kind=='boss':variant['context']['events'][0]['members']=values
        else:variant['context']['members']=values
        run_cases.append(variant)
    for field,value in [('deaths',1),('deaths',0xffffffff),('max_modifiers',False)]:
        variant=copy.deepcopy(case);variant['name']+=f'/{field}{value}';variant['context'][field]=value;run_cases.append(variant)
    variant=copy.deepcopy(case);variant['won']=not variant['won'];variant['name']+='/victory-toggle';run_cases.append(variant)
    if kind=='boss':
        variant=copy.deepcopy(case);variant['context']['members']=[];variant['name']+='/departed-current-members';run_cases.append(variant)
        for source_kind in range(4):
            for spell in [0,*condition['spells'],0xffffffff]:
                variant=copy.deepcopy(case);variant['name']+=f'/source{source_kind}/spell{spell}';variant['context']['events'][0].update(spell=spell,source_kind=source_kind);run_cases.append(variant)
for case in run_cases:
    case['keys']=native_run(case)
    assert case['keys']==run_model(case),(case['name'],case['keys'],run_model(case))
run_output=dict(target_sha256=target['sha256'],account_case_count=account_count,
    run_case_count=len(run_cases),cases=run_cases,
    executed_instruction_count=len(run_visited),
    executed_instruction_sha256=hashlib.sha256(json.dumps(run_visited,sort_keys=True).encode()).hexdigest())
emit_json('predicates-native.json',run_output)
print('Passed',len(run_cases),'complete original cooperative run-predicate cases')

source = (ROOT/'crates/azeroth-survivors-re/src/account_progression.rs').read_text()
ui = (ROOT/'crates/azeroth-survivors-re/src/progression.rs').read_text()
assert 'pub fn eligible_cooperative_keys(' in source
assert 'pub cooperative_beaten: BTreeSet<usize>' in source
assert 'definition.cooperative.is_some() || definition.kind != 9' in source
assert 'member.word != 0 && member.word == spell.spell_id' in source
assert 'member.byte & flag != 0' in source
assert 'event.kind_21 != 2 && spells.contains(&event.word_1c)' in source
assert 'const CATEGORIES: [&str; 6]' in ui and '\"Co-op\"' in ui
assert 'let counts = (0..CATEGORIES.len())' in ui
assert 'cooperative_beaten: save.cooperative_beaten_zones()' in ui
assert 'pub(crate) fn grant_party_feats(' in ui
assert 'catalog.achievements.extend(cooperative.achievements)' in ui
assert 'entry.unlocks.iter().map(|unlock| unlock.icon.as_str())' in ui
print('Passed current source catalog, live UI/account connections and deferred-regression fixture guards')

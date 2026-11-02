#!/usr/bin/env python3
"""Verify current armor-set item publication with isolated original instructions.

No application, compiler, network or server runs. The member-list constructor
executes only inside Unicorn with explicit allocation seams; source is inspected.
"""
import argparse
import hashlib
import json
from pathlib import Path
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / 'docs/analysis/evidence/0.121.0/item-set-publication'
WORK = ROOT / 'runtime/set-consumers-0.121.0'
SHA = '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
MEMBERS, MEMBERS_END = 0x145c86fb0, 0x145c87195
CLASSES = (1, 2, 3, 4, 5, 7, 8, 9, 11)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


SOURCE_ROOT = ROOT

def receipt(path):
    path = ROOT / path
    logical = path.relative_to(SOURCE_ROOT) if path.is_relative_to(SOURCE_ROOT) else path.relative_to(ROOT)
    return {'path': logical.as_posix(), 'sha256': digest(path.read_bytes())}


def source_scope(path, start, end):
    text = (SOURCE_ROOT / path).read_text()
    assert text.count(start) == 1, start
    at = text.index(start)
    stop = text.index(end, at) + len(end)
    return dict(path=path, start=start, end=end, include_end=True,
                sha256=digest(text[at:stop].encode()))


def native_result(path):
    saved = json.loads(path.read_text())
    return saved.get('structuredContent') or json.loads(saved['content'][0]['text'])


def query(scope):
    plan_path = WORK / scope / 'plan.json'
    plan = json.loads(plan_path.read_text())
    journal_path = WORK / scope / 'query/journal.json'
    journal = json.loads(journal_path.read_text())
    operations = [r for r in journal['operations'].values() if r['status'] == 'completed']
    assert journal['status'] == 'completed' and len(operations) == 1
    operation = operations[0]
    result = operation['result']
    assert receipt(result['path']) == result
    native = native_result(ROOT / result['path'])
    return dict(role=scope, procedure=operation['arguments']['procedure'],
                evidence_id=native['evidence_id'], provider=native['provider'],
                analysis_profile_digest=native['analysis_profile']['digest'],
                normalized_text_sha256=digest(native['normalized_result'].encode()),
                plan=receipt(plan_path), journal=receipt(journal_path), result=result,
                raw_input=receipt(plan['target']),
                slice_virtual_address=plan['open_options']['entry_point'])


def replay_members(image, pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    import unicorn.x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    heap, stack, stop = 0x22000000, 0x23000000, 0x2301fff0
    uc.mem_map(heap, 0x10000)
    uc.mem_map(stack, 0x20000)
    pages, state = set(), {}

    def map_page(_uc, _access, address, _size, _value, _context):
        page = address & -0x1000
        if page in pages:
            return False
        try:
            at = pe.rva_offset(page - pe.image_base)
        except ValueError:
            return False
        uc.mem_map(page, 0x1000)
        uc.mem_write(page, image[at:at + 0x1000])
        pages.add(page)
        return True

    def ret(value=None):
        if value is not None:
            uc.reg_write(reg.UC_X86_REG_RAX, value)
        sp = uc.reg_read(reg.UC_X86_REG_RSP)
        uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack('<Q', uc.mem_read(sp, 8))[0])
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(_uc, address, _size, _context):
        state['steps'] += 1
        if address == stop:
            state['returned'] = True
            uc.emu_stop()
        elif address == 0x140002200:
            # Native allocation shim has no observable result consumed here.
            ret()
        elif address == 0x1400021c0:
            assert uc.reg_read(reg.UC_X86_REG_RCX) == 32
            assert uc.reg_read(reg.UC_X86_REG_RDX) == 4
            ret(heap + 0x1000)
        else:
            assert MEMBERS <= address < MEMBERS_END, hex(address)

    uc.hook_add(UC_HOOK_MEM_UNMAPPED, map_page)
    uc.hook_add(UC_HOOK_CODE, hook)
    cases, steps = [], 0
    for class_id in CLASSES:
        for tier in range(6):
            for horde in (False, True):
                uc.mem_write(heap, bytes(0x10000))
                uc.mem_write(stack, bytes(0x20000))
                for name in ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','R8','R9','R10','R11','R12','R13','R14','R15'):
                    uc.reg_write(getattr(reg, 'UC_X86_REG_' + name), 0)
                uc.reg_write(reg.UC_X86_REG_EFLAGS, 2)
                out, iterator = heap + 0x100, heap + 0x200
                class_at, tier_at, horde_at = heap + 0x300, heap + 0x308, heap + 0x310
                uc.mem_write(class_at, bytes([class_id]))
                uc.mem_write(tier_at, struct.pack('<Q', tier))
                uc.mem_write(horde_at, bytes([horde]))
                uc.mem_write(iterator, struct.pack('<5Q', class_at, tier_at, 0, 8, horde_at))
                sp = stack + 0x1f008
                uc.mem_write(sp, struct.pack('<Q', stop))
                uc.reg_write(reg.UC_X86_REG_RSP, sp)
                uc.reg_write(reg.UC_X86_REG_RCX, out)
                uc.reg_write(reg.UC_X86_REG_RDX, iterator)
                state.clear()
                state['steps'] = 0
                uc.emu_start(MEMBERS, stop, count=2000)
                assert uc.reg_read(reg.UC_X86_REG_RIP) == stop
                capacity, pointer, count = struct.unpack('<3Q', uc.mem_read(out, 24))
                assert capacity == count == 8
                actual = list(struct.unpack('<8I', uc.mem_read(pointer, 32)))
                expected = [100000 + class_id * 1000 + slot * 100 + tier * 10
                            + (10 if horde and tier == 5 else 0) for slot in range(8)]
                assert actual == expected, (class_id, tier, horde, actual)
                cases.append(dict(class_id=class_id, tier=tier, horde=horde, members=actual))
                steps += state['steps']
    return dict(cases=cases, original_instruction_steps=steps,
                seams=['Allocation shim140002200 returns without changing registers.',
                       'Allocator1400021c0 returns32bytes of zero-filled fixture memory at alignment4.'],
                application_executed=False, source_executed=False)


def source_contracts():
    return ['mod set_tip;', '                    set_tip::update,',
            """        if state.page == Page::Character {
            for tier in COLLECTION_ORDER {
                set_bonus_rows(ui, art, menu_catalog, state, catalog, gear, tier, true);
            }
        }""",
            """            if p.slot < 8 {
                set_bonus_rows(ui, art, menu_catalog, state, catalog, gear, p.rarity, false);
            }"""]


def source_check():
    files = [
        'crates/azeroth-survivors-re/src/gameplay/client/inventory.rs',
        'crates/benilla-app/src/local_client.rs',
        'crates/benilla-app/src/local_client/item_sets.rs',
        'crates/benilla-app/src/ui_items/feed.rs',
        'crates/azeroth-survivors-re/src/armory/set_tip.rs',
        'crates/azeroth-survivors-re/src/tooltip.rs',
        'crates/azeroth-survivors-re/src/armory.rs',
        'crates/azeroth-survivors-re/src/save/gear_progression.rs',
    ]
    inventory = (SOURCE_ROOT / files[0]).read_text()
    for anchor in ('item_set: self.item_set', 'sets::item_set_id(id,', 'sets.records = item_sets(',
                   'sets::decode_set_id(id)', 'sets::SetIdentity::item_set_id',
                   'set_four_bonus(labels, tier as u8)', 'set_eight_bonus(labels, class.id, tier as u8, false)',
                   'set_name(labels, class.id, tier)',
                   'for tier in 0..sets::TIERS', '0..sets::ARMOR_SLOTS',
                   'if horde && tier != 5', 'bonuses.push((8,',
                   'publisher.set_language != Some(locale.code())'):
        assert anchor in inventory, anchor
    assert inventory.index('sets.records = item_sets(') < inventory.index('if coop.as_ref()')
    feed = (SOURCE_ROOT / files[3]).read_text()
    assert feed.index('local_sets.as_deref().and_then') < feed.index('let Some(row) = sets.0.set(set_id)')
    assert 'script.set_item_set(id, view)' in feed
    assert 'pub normalize: Option<fn(u32) -> Option<u32>>' in (SOURCE_ROOT / files[2]).read_text()
    tip = (SOURCE_ROOT / files[4]).read_text()
    for anchor in ('tip.qualified_count.min(', 'state.save.star_cap(', 'Save::star_zone_indices(',
                   'armory.set_tip_stars', 'armory.set_tip_open', 'armory.set_tip_pieces',
                   '.join(" · ")', 'crate::tooltip::spawn_frame('):
        assert anchor in tip, anchor
    armory = (SOURCE_ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
    for contract in source_contracts():
        assert contract in armory, contract
    arch = {('Darwin','arm64'): 'aarch64-apple-darwin', ('Darwin','x86_64'): 'x86_64-apple-darwin',
            ('Linux','aarch64'): 'aarch64-unknown-linux-gnu', ('Linux','x86_64'): 'x86_64-unknown-linux-gnu'}
    parser = ROOT / '.tools/rust' / ('1.98.1-' + arch[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    for name in files:
        parsed = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'],
                                input=(SOURCE_ROOT / name).read_text(), text=True, cwd=ROOT,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, parsed.stderr
    return files


def main():
    global SOURCE_ROOT
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--source-root', type=Path, default=ROOT,
                        help='Scoped source snapshot inside the project for commit review')
    parser.add_argument('--manifest', type=Path, default=BASE / 'manifest.json')
    args = parser.parse_args()
    SOURCE_ROOT = args.source_root.resolve()
    assert SOURCE_ROOT.is_relative_to(ROOT)
    args.manifest = args.manifest.resolve()
    assert args.manifest.is_relative_to(ROOT)
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('item_set_publication_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    native = replay_members(image, pe)
    files = source_check()
    queries = [query(scope) for scope in ('set-tip', 'set-tip-zones', 'set-registry', 'item-query', 'set-members', 'member-rows')]
    for row in queries:
        evidence = native_result(ROOT / row['result']['path'])
        verify_native_query_subject(ROOT, evidence, row, target, image=image, pe=pe)
    source_catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/armory.json').read_text())
    pvp = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json').read_text())
    ids = {item['id'] for row in source_catalog['classes'] for item in row['items']}
    ids.update(item['id'] for row in pvp['classes'] for item in row['items'])
    ids.update(item['id'] + 10 for row in pvp['classes'] for item in row['items'] if 'horde' in item)
    assert all(set(row['members']) <= ids for row in native['cases'])
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    at = pe.rva_offset(0x145b111b1 - pe.image_base)
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(image[at:at+0xd8], 0x145b111b1))
    observed = {row.address: (row.mnemonic, row.op_str) for row in instructions}
    assert observed[0x145b111db] == ('mov', 'ecx, r13d')
    assert observed[0x145b111de] == ('call', '0x145ac19f0')
    assert observed[0x145b11273] == ('mov', 'dword ptr [rbp + 0x2c4], eax')
    assert observed[0x145b1127d] == ('lea', 'rdx, [rbp + 0x270]')
    assert observed[0x145b11284] == ('call', '0x145b81a20')
    assert 0x2c4 - 0x270 == 84
    data_spans = []
    for address, expected in (
        (0x146fcb4d0, b'{bonus} (pieces at {stars}+ stars)'),
        (0x146fcb545, b'{bonus} (all eight at {stars}+ stars; half again as strong at {max})'),
        (0x146fcb51d, bytes([1])), (0x146fcb589, bytes([3, 5])),
    ):
        offset = pe.rva_offset(address-pe.image_base)
        value = image[offset:offset+len(expected)]
        assert value == expected
        data_spans.append(dict(virtual_address=hex(address),file_offset=hex(offset),
                               byte_count=len(value),sha256=digest(value),bytes_hex=value.hex()))
    spans = []
    for start, end in ((0x14007e9f0,0x14007eae2),(0x1402b7530,0x1402b7aa9),
                       (0x145b111b1,0x145b11289),(0x145b04610,0x145b048d8),
                       (MEMBERS,MEMBERS_END),(0x1402afa80,0x1402afb2f),
                       (0x1461ee49f,0x1461ee4a3)):
        at = pe.rva_offset(start-pe.image_base)
        value = image[at:at+end-start]
        spans.append(dict(virtual_address=hex(start),file_offset=hex(at),byte_count=len(value),
                          sha256=digest(value),bytes_hex=value.hex()))
    result = dict(schema_version=1,target={k:target[k] for k in ('version','path','sha256','size_bytes')},
                  gap_ids=[234], queries=queries, native_ranges=spans,
                  native_data=data_spans,
                  reused_metadata_contract='docs/analysis/evidence/0.121.0/sets-core/manifest.json:0x145ac1180',
                  member_cases=native['cases'],original_instruction_steps=native['original_instruction_steps'],
                  synthetic_seams=native['seams'],
                  source_bindings=[receipt(SOURCE_ROOT / name) for name in files if not name.endswith('/armory.rs')],
                  source_scope_bindings=[source_scope('crates/azeroth-survivors-re/src/armory.rs', start, '\n}')
                    for start in ('fn name_rules(', 'pub(crate) fn set_name_base(',
                        'pub(crate) fn set_name(', 'pub(crate) fn set_four_bonus(',
                        'pub(crate) fn set_eight_bonus(', 'pub(crate) fn piece_name(',
                        'pub(crate) fn localized_bonus(', 'fn native_percent(',
                        'fn native_decimal(', 'pub(super) struct SetTip {',
                        'fn worn_set_progress(', 'fn set_bonus_rows(',
                        'fn collection_set_progress(')],
                  source_contracts=source_contracts(),
                  generator=receipt(Path(__file__)),
                  compilation='not_run',application_executed=False,source_executed=False,parity_verified=False,
                  limits=['Only the original member-list constructor executes in an isolated instruction emulator.',
                          'Ghidra raw-slice decompilation has external-ABI and omitted-switch-body limits; original bytes govern field publication.',
                          'The original item-query suffix calls145ac19f0 with requestedID and stores its result at response input+84 before145b81a20.',
                          'Metadata4/8 count gates and textual1/3/5star requirements reuse the separately bound145ac1180 contract.',
                          'Rust syntax and source connections are inspected; no Rust code, FrameXML, item-query wire path, application or game executes.'])
    text = json.dumps(result,indent=2,ensure_ascii=False)+'\n'
    if args.write:
        args.manifest.parent.mkdir(parents=True,exist_ok=True)
        args.manifest.write_text(text)
    else:
        assert args.manifest.read_text()==text, 'Item-set proof drift; review before --write'
    print(json.dumps(dict(target_sha256=SHA,query_subjects=len(queries),member_cases=len(native['cases']),
        unique_sets=63,original_instruction_steps=native['original_instruction_steps'],
        source_syntax_parsed=len(files),compilation='not_run',source_executed=False,parity_verified=False),indent=2))


if __name__ == '__main__':
    main()

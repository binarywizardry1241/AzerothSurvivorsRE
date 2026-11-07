#!/usr/bin/env python3
"""Check current ownerless custom-diagnostic roles; no compilation or game.

Uses the saved target-bound Ghidra body census and exact original PE bytes.
--stage writes proposed compact proof under ignored project runtime storage.
"""
from runtime_layout import retained_runtime_path
import argparse
import bisect
from collections import Counter
import csv
import gzip
import hashlib
import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if ROOT.name == 'runtime':
    ROOT = ROOT.parent
sys.path[:0] = [str(ROOT / 'scripts'), str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
               str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
from coverage_common import latest_target, target_bytes
from script_sources import load_script
from compact_evidence import proof_text, SOURCE_SHA256 as RENDERER_SHA256

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
WORK = ROOT / 'runtime/analysis/history/findings/q41-d01/42d7c6285604'
KEEP = ROOT / 'docs/analysis/evidence/native-diagnostics/q41-custom-diagnostics.json'
GENERATOR = 'scripts/check-custom-diagnostic-roles.py'
GENERATOR_SHA256 = hashlib.sha256((ROOT / GENERATOR).read_bytes()).hexdigest()
RENDERER = 'scripts/compact_evidence.py'
ROLES = {0x145eb7363: 'bounds_failure_interface', 0x145eb7540: 'formatted_failure_interface',
         0x145eb7280: 'missing_key_failure_interface', 0x145eb72c0: 'option_failure_interface',
         0x1400d48d0: 'stable_u64_vector_removal',
         0x1459bf5e0: 'stable_120_byte_vector_removal',
         0x1458e0370: 'adjacent_key_literal_substitution'}
EXCLUDED = {'custom-game-coop-route', 'custom-game-coop-tcp', 'custom-game-game-party',
            'custom-game-server-party', 'custom-app-screens-coop'}


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def artifact(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=sha(path.read_bytes()))


def derive():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('diag_current_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    def raw(a, count):
        offset = pe.rva_offset(a - pe.image_base)
        result = image[offset:offset + count]
        assert len(result) == count
        return result
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    queue = json.loads((ROOT / 'docs/analysis/evidence/unknown-recovery-comparison.json').read_text())
    assert queue['target']['sha256'] == SHA
    diagnostics_input = queue['inputs']['diagnostic-ownership']['inventory']
    body_input = queue['inputs']['ghidra-census']['execution_artifacts']['bodies.tsv.gz']
    for record in [diagnostics_input, body_input]:
        assert sha((retained_runtime_path(ROOT / record['path'], ROOT)).read_bytes()) == record['sha256']
    diagnostics = json.loads((ROOT / diagnostics_input['path']).read_text())
    assert diagnostics['target']['sha256'] == SHA
    with gzip.open(ROOT / body_input['path'], 'rt') as stream:
        bodies = sorted((int(r['start'], 16), int(r['end'], 16), int(r['entry'], 16))
                        for r in csv.DictReader(stream, delimiter='\t') if r['external'] == 'false')
    starts = [r[0] for r in bodies]
    def owner(a):
        i = bisect.bisect_right(starts, a) - 1
        return bodies[i][2] if i >= 0 and a <= bodies[i][1] else None
    selected, excluded = [], []
    for diagnostic in sorted(diagnostics['diagnostics'], key=lambda d: d['path']):
        if not diagnostic['custom_game_crate']:
            continue
        for row in diagnostic['verified_references']:
            if owner(int(row['instruction_address'], 16)) is None:
                result = dict(path=diagnostic['path'], system_id=diagnostic['system_id'], **row)
                (excluded if diagnostic['system_id'] in EXCLUDED else selected).append(result)
    assert len(selected) == 107 and len(excluded) == 6
    cache, classified, extents = {}, [], {}
    for row in selected:
        a, e = int(row['runtime_function_start'], 16), int(row['runtime_function_end'], 16)
        if a not in cache:
            content = raw(a, e - a)
            assert sha(content) == row['owner_sha256']
            instructions = list(decoder.disasm(content, a))
            assert sum(i.size for i in instructions) == len(content)
            cache[a] = {i.address: i for i in instructions}
            extents[a] = dict(start=hex(a), end_exclusive=hex(e), sha256=sha(content))
        instructions = cache[a]
        site = int(row['instruction_address'], 16)
        current = instructions[site]
        assert current.bytes.hex() == row['instruction_bytes']
        flow = []
        for _ in range(100):
            flow.append(current)
            if current.mnemonic == 'call':
                break
            assert not current.mnemonic.startswith('j') or current.mnemonic == 'jmp'
            following = current.operands[0].imm if current.mnemonic == 'jmp' else current.address + current.size
            current = instructions[following]
        assert current.mnemonic == 'call'
        callee = current.operands[0].imm
        assert callee in ROLES
        record = dict(path=row['path'], system_id=row['system_id'], site=hex(site),
                      diagnostic_target=row['target_address'], reference_kind=row['kind'],
                      source_line=row.get('source_line'), source_column=row.get('source_column'),
                      ghidra_body_owner=None, declared_extent=[hex(a), hex(e)],
                      call_site=hex(current.address), callee=hex(callee), role=ROLES[callee],
                      flow_sites=[hex(i.address) for i in flow],
                      flow_bytes_sha256=sha(b''.join(bytes(i.bytes) for i in flow)))
        if row['kind'] == 'rust_location':
            pointer, length, line, column = struct.unpack('<QQII', raw(int(row['target_address'], 16), 24))
            assert pointer == int(row['path_address'], 16)
            assert raw(pointer, length).decode() == row['path'].replace('/', '\\')
            assert (line, column) == (row['source_line'], row['source_column'])
        if callee == 0x145eb7280:
            literal_load = instructions[site - 7]
            assert literal_load.mnemonic == 'lea' and literal_load.op_str.startswith('rcx, [rip ')
            literal_address = literal_load.address + literal_load.size + literal_load.operands[1].mem.disp
            assert raw(literal_address, 22) == b'no entry found for key'
            assert any(i.mnemonic == 'mov' and i.op_str == 'edx, 0x16' for i in flow)
            record['failure_literal'] = dict(va=hex(literal_address), byte_count=22,
                                             text='no entry found for key')
        if row['kind'] == 'path_literal':
            assert callee == 0x1458e0370
            address = int(row['target_address'], 16)
            if row['path'].endswith('/game/auras.rs'):
                text, location = b'spell', 0x14732fe20
                expected = 'qword ptr [rbp + 0x170], 5'
            elif row['path'].endswith('/i18n.rs'):
                text, location = b'p', 0x14733a240
                expected = 'qword ptr [rbp + '+('0x98' if site == 0x1459e8292 else '0x20')+'], 1'
            else:
                assert row['path'].endswith('/server.rs')
                text, location = b'zone', 0x14702c779
                expected = 'qword ptr [rbp + '+('0x1c58' if site == 0x145886d39 else '0x1cb8')+'], 4'
            assert address == location and raw(address, len(text)) == text
            filename = row['path'].replace('/', '\\').encode()
            assert raw(address + len(text), len(filename)) == filename
            assert any(i.mnemonic == 'mov' and i.op_str == expected for i in flow)
            record['consumed_literal'] = dict(va=hex(address), byte_count=len(text), text=text.decode(),
                                              length_store=expected,
                                              adjacent_filename_consumed=False)
        classified.append(record)
    counts = Counter(r['role'] for r in classified)
    assert counts == Counter(bounds_failure_interface=69, formatted_failure_interface=26,
                             missing_key_failure_interface=1, option_failure_interface=1,
                             stable_u64_vector_removal=1, stable_120_byte_vector_removal=1,
                             adjacent_key_literal_substitution=8)
    helpers = []
    for entry, role in ROLES.items():
        end = ends[entry]
        helpers.append(dict(entry=hex(entry), end_exclusive=hex(end), byte_count=end-entry,
                            sha256=sha(raw(entry, end-entry)), role=role,
                            saved_ghidra_body_owner=hex(owner(entry)) if owner(entry) is not None else None))
    # Current helper strings independently identify the Option and bounds interfaces.
    assert raw(0x1473cf139, 43) == b'called `Option::unwrap()` on a `None` value'
    bounds = raw(0x1473cf1d0, 100)
    assert b'index out of bounds' in bounds
    vector_cases = vector_checks(raw, ends)
    cap_cases = totem_cap_checks(raw)
    membership_cases = options_membership_checks(raw)
    source_consumers = source_contracts()
    source_guard_cases = source_guard_checks(source_consumers)
    projection = [[r['path'], r['site'], r['diagnostic_target'], r['reference_kind'], r['callee'], r['role']]
                  for r in classified]
    selected_digest = sha((''.join(json.dumps(r, separators=(',', ':'))+'\n' for r in projection)).encode())
    return dict(schema_version=1, target={k:target[k] for k in ['version','path','sha256','size_bytes']},
                generator=dict(path=GENERATOR,sha256=GENERATOR_SHA256),
                dependencies=[dict(path=RENDERER,sha256=RENDERER_SHA256)],
                gap_ids=[41], lead='Q41-D01', selected_site_roles_classified=True, global_classification_semantics_complete=False,
                source_implementation_added=False, native_semantics_complete=False, parity_verified=False,
                inputs={'diagnostic-ownership': diagnostics_input, 'ghidra-bodies': body_input},
                selector='All custom diagnostic verified_references without a saved actual Ghidra body; excluded co-op paths retained separately.',
                counts=dict(classified_sites=len(classified), excluded_sites=len(excluded),
                            paths=len({r['path']for r in classified}), roles=dict(sorted(counts.items())),
                            literal_bytes=5*2+1*4+4*2, vector_native_cases=vector_cases,
                            totem_cap_native_cases=cap_cases,options_membership_native_cases=membership_cases,
                            source_contracts_checked=len(source_consumers), source_guard_cases=source_guard_cases),
                classification_digest=selected_digest, declared_extents=list(extents.values()),
                totem_cap_producer=dict(start='0x145933a8a',end_exclusive='0x145933bad',
                                        sha256=sha(raw(0x145933a8a,0x123)),
                                        record_width=120,matching_key_limit=40,removal='first_matching_row'),
                options_membership_producer=dict(start='0x1400b13d0',end_exclusive='0x1400b147b',
                                                 sha256=sha(raw(0x1400b13d0,0xab)),
                                                 record_width=8,stored_at='Options+0x48/0x50/0x58'),
                helpers=helpers, sites=classified,
                excluded_sites=[{k:r.get(k)for k in ['path','system_id','instruction_address','target_address','kind',
                                                  'runtime_function_start','runtime_function_end']}for r in excluded],
                source_consumers=source_consumers,
                limits=['Roles classify exact instruction/data boundaries, not complete successful AS behavior or source closure.',
                        'Saved current Ghidra body ownership remains unchanged; declared unwind intervals are provenance, not semantic body owners.',
                        'The shared panic/ECS/allocator/formatter subsystems are supporting context and are not reconstructed.',
                        'Four source contracts use unique scoped anchors, exact statement/order guards and selected UTF-8 snippet hashes; unrelated whole-file edits are outside these commitments. These static checks do not execute or type-check Rust or prove complete native equivalence.',
                        'Vector cases execute original instructions with synthetic memory, memmove and refusal stop seams; compiled source/gameplay/rendering do not execute.',
                        'No compilation, application launch, network/server/co-op execution or original/rebuilt parity.'])


def source_contracts(read_source=None):
    """Commit only the selected source statements, without whole-file drift."""
    definitions = [
        dict(path='crates/azeroth-survivors-re/src/options.rs', symbol='Action::BindingHeader',
             scope_start='            Action::BindingHeader(row) => {\n',
             scope_end='            Action::Defaults => {\n',
             start='                if !state.bindings.expanded.remove(&row) {\n',
             end='                }\n',
             statements=['if !state.bindings.expanded.remove(&row) {',
                         'state.bindings.expanded.insert(row);'],
             boundary='Expanded-header membership removes present keys and inserts absent keys; source set storage order is not native vector-order proof.'),
        dict(path='crates/azeroth-survivors-re/src/player_abilities/behavior/totems.rs',
             symbol='remove_for_kind_limit', scope_start="pub fn remove_for_kind_limit<'a>(",
             scope_end='\n#[derive(Clone, Debug, PartialEq)]\npub struct SummonedObject',
             start="pub fn remove_for_kind_limit<'a>(", end='\n}\n',
             statements=['rows.iter().filter(|row| row.captured.definition.key == key).count() < 40',
                         'return None;',
                         'rows.iter().position(|row| row.captured.definition.key == key)?;',
                         'Some(rows.remove(index))'],
             boundary='Count equal definition keys; at least40 selects and stably removes exactly the first matching row.'),
        dict(path='crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs',
             symbol='cast kind10', scope_start='        10 => {\n',
             scope_end='        11 => false,\n',
             owner_start="pub fn cast<'a>(", owner_end='\n///1454a3cd0..1454a4178:',
             start='            if let Some(old) = totems::remove_for_kind_limit(&mut state.totems, definition.key) {\n',
             end='            state.totems.push(totem);\n',
             statements=['totems::remove_for_kind_limit(&mut state.totems, definition.key)',
                         'port.expire_totem(old, context, rng);',
                         'let totem = Totem::new(instance, context.now, guid_counter, position);',
                         'port.create_totem(totems::object(', 'state.totems.push(totem);'],
             boundary='Kind10 removes/expires the old totem before creating, publishing and retaining the replacement; whole creation/tick/ownership semantics remain bounded.'),
        dict(path='crates/azeroth-survivors-re/src/localization.rs', symbol='format',
             scope_start='pub fn format(catalog: &MenuCatalog, key: &str, tokens: &[(&str, String)]) -> String {\n',
             scope_end='/// The native tab key used by each screen.',
             start='pub fn format(catalog: &MenuCatalog, key: &str, tokens: &[(&str, String)]) -> String {\n',
             end='\n}\n',
             statements=['let mut result = catalog.label(key).to_string();',
                         'for (name, value) in tokens {',
                         'result = result.replace(&format!("{{{name}}}"), value);', '    result\n}'],
             boundary='Template starts from catalog.label(key), replaces named brace tokens with supplied values and returns the result; complete native substitution/locale/caller parity is not asserted.'),
    ]
    records = []
    for spec in definitions:
        source = (ROOT / spec['path']).read_text() if read_source is None else read_source(spec['path'])
        owner = source
        if 'owner_start' in spec:
            assert source.count(spec['owner_start']) == 1
            assert source.count(spec['owner_end']) == 1
            owner = spec['owner_start'] + source.split(spec['owner_start'], 1)[1].split(spec['owner_end'], 1)[0]
        assert owner.count(spec['scope_start']) == 1
        assert owner.count(spec['scope_end']) == 1
        scoped = spec['scope_start'] + owner.split(spec['scope_start'], 1)[1].split(spec['scope_end'], 1)[0]
        assert scoped.count(spec['start']) == 1
        tail = scoped.split(spec['start'], 1)[1]
        assert spec['end'] in tail, spec['symbol']
        snippet = spec['start'] + tail.split(spec['end'], 1)[0] + spec['end']
        positions = []
        for statement in spec['statements']:
            assert snippet.count(statement) == 1, (spec['symbol'], statement)
            positions.append(snippet.index(statement))
        assert positions == sorted(positions)
        encoded = snippet.encode('utf-8')
        anchors = {key: spec[key] for key in ['scope_start', 'scope_end', 'start', 'end']}
        if 'owner_start' in spec:
            anchors.update({key: spec[key] for key in ['owner_start', 'owner_end']})
        records.append(dict(path=spec['path'], symbol=spec['symbol'], boundary=spec['boundary'],
                            provenance='Current checkout selected UTF-8 Rust source; unique exact anchors and ordered statement guards; no source execution.',
                            anchors=anchors, ordered_statement_guards=spec['statements'],
                            snippet_byte_count=len(encoded), snippet_sha256=sha(encoded)))
    assert len(records) == 4
    return records


def source_guard_checks(expected):
    """In-memory source mutations; never modifies or executes Rust files."""
    sources = {r['path']: (ROOT / r['path']).read_text() for r in expected}
    count = 0
    for record in expected:
        changed = sources.copy()
        anchor = record['anchors']['start']
        assert changed[record['path']].count(anchor) == 1
        changed[record['path']] = changed[record['path']].replace(anchor, '', 1)
        try:
            source_contracts(changed.__getitem__)
        except AssertionError:
            pass
        else:
            raise AssertionError('Removed source consumer was accepted: '+record['symbol'])
        count += 1
    changed = {path: '// Unrelated source-prefix edit outside the committed snippet.\n'+source
               for path, source in sources.items()}
    assert source_contracts(changed.__getitem__) == expected
    return count + 1


def totem_cap_checks(raw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    start, stop, removal, compare = 0x145933a8a, 0x145933bad, 0x1459bf5e0, 0x145d14601
    heap, stack = 0x200000000, 0x300000000
    machine=Uc(UC_ARCH_X86,UC_MODE_64)
    for page,size in [(start&~4095,4096),(removal&~4095,4096),(compare&~4095,4096),
                      (heap,0x10000),(stack,0x10000)]:machine.mem_map(page,size)
    machine.mem_write(start,raw(start,stop-start))
    found=[]
    def hook(m,pc,size,_):
        if pc==removal:
            assert m.reg_read(reg.UC_X86_REG_RDX)==heap+0x600
            found.append(m.reg_read(reg.UC_X86_REG_R8))
            m.emu_stop()
        elif pc==compare:
            a,b,n=[m.reg_read(r)for r in [reg.UC_X86_REG_RCX,reg.UC_X86_REG_RDX,reg.UC_X86_REG_R8]]
            left,right=bytes(m.mem_read(a,n)),bytes(m.mem_read(b,n))
            rsp=m.reg_read(reg.UC_X86_REG_RSP)
            ret=struct.unpack('<Q',m.mem_read(rsp,8))[0]
            m.reg_write(reg.UC_X86_REG_RAX,((left>right)-(left<right))&((1<<64)-1))
            m.reg_write(reg.UC_X86_REG_RSP,rsp+8)
            m.reg_write(reg.UC_X86_REG_RIP,ret)
        else:assert start<=pc<stop
    machine.hook_add(UC_HOOK_CODE,hook)
    count=0
    for key in [b'magma_totem',b'searing_totem']:
        other=b'x'+key[1:]
        for n in [0,1,2,39,40,41,80]:
            for mixed in [False,True]:
                keys=([other,key]*n+[other])if mixed else [key]*n
                machine.mem_write(heap+0x600,struct.pack('<3Q',len(keys),heap+0x1000,len(keys)))
                machine.mem_write(heap+0x8000,key)
                machine.mem_write(heap+0x8100,other)
                machine.mem_write(heap+0x8200,struct.pack('<QQ',heap+0x8000,len(key)))
                machine.mem_write(heap+0x8300,struct.pack('<QQ',heap+0x8100,len(other)))
                rows=b''.join(struct.pack('<Q',heap+(0x8200 if k==key else 0x8300))+bytes(112)for k in keys)
                machine.mem_write(heap+0x1000,rows)
                frame=stack+0x1000
                machine.mem_write(frame+0x150,struct.pack('<QQ',heap+0x8200,heap))
                for r,value in [(reg.UC_X86_REG_RSP,stack+0x8008),(reg.UC_X86_REG_RBP,frame),
                                (reg.UC_X86_REG_RDI,heap)]:machine.reg_write(r,value)
                found.clear()
                machine.emu_start(start,stop,count=50000)
                expected=[keys.index(key)]if n>=40 else []
                assert found==expected
                count+=1
    return count


def options_membership_checks(raw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    start,end,found_stop,absent_stop=0x1400b13d0,0x1400b18b1,0x1400b1887,0x1400b147b
    heap,stack=0x200000000,0x300000000
    machine=Uc(UC_ARCH_X86,UC_MODE_64)
    for page,size in [(start&~4095,4096),(heap,0x10000),(stack,0x10000)]:machine.mem_map(page,size)
    machine.mem_write(start,raw(start,end-start))
    observations=[]
    def hook(m,pc,size,_):
        if pc==found_stop:
            observations.append(('found',m.reg_read(reg.UC_X86_REG_RDX)))
            m.emu_stop()
        elif pc==absent_stop:
            observations.append(('inserted',None))
            m.emu_stop()
        else:assert start<=pc<end
    machine.hook_add(UC_HOOK_CODE,hook)
    count=0
    for length in range(9):
        values=list(range(length))
        for key in [*range(length),length,(1<<64)-1]:
            machine.mem_write(heap+0x48,struct.pack('<3Q',16,heap+0x1000,length))
            machine.mem_write(heap+0x1000,struct.pack('<16Q',*(values+[0]*(16-length))))
            machine.mem_write(heap+0x8008,struct.pack('<Q',key))
            frame=stack+0x1000
            machine.mem_write(frame+0xf8,struct.pack('<Q',heap))
            machine.mem_write(frame+0xe0,struct.pack('<Q',heap+0x9000))
            machine.mem_write(frame+0x104,struct.pack('<I',123))
            for r,value in [(reg.UC_X86_REG_RSP,stack+0x8008),(reg.UC_X86_REG_RBP,frame),
                            (reg.UC_X86_REG_R15,heap+0x8000)]:machine.reg_write(r,value)
            observations.clear()
            machine.emu_start(start,0,count=1000)
            assert observations==[('found',values.index(key))if key in values else('inserted',None)]
            actual_length=struct.unpack('<Q',machine.mem_read(heap+0x58,8))[0]
            assert actual_length==length+int(key not in values)
            if key not in values:assert struct.unpack('<Q',machine.mem_read(heap+0x1000+length*8,8))[0]==key
            count+=1
    return count


def vector_checks(raw, ends):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    count = 0
    for entry, width in [(0x1400d48d0, 8), (0x1459bf5e0, 120)]:
        end = ends[entry]
        machine = Uc(UC_ARCH_X86, UC_MODE_64)
        machine.mem_map(entry & ~4095, 4096)
        machine.mem_write(entry, raw(entry, end-entry))
        for page in [0x145d14000, 0x145eb7000, heap, stack, stop]:
            machine.mem_map(page, 0x10000 if page in [heap, stack] else 4096)
        failures = []
        def hook(m, pc, size, _):
            if pc == 0x145eb709b:
                failures.append(True)
                m.emu_stop()
            elif pc == 0x145d14607:
                dest, source, n = [m.reg_read(r)for r in [reg.UC_X86_REG_RCX,reg.UC_X86_REG_RDX,reg.UC_X86_REG_R8]]
                assert n <= width*8
                m.mem_write(dest, bytes(m.mem_read(source,n)))
                rsp=m.reg_read(reg.UC_X86_REG_RSP)
                ret=struct.unpack('<Q',m.mem_read(rsp,8))[0]
                m.reg_write(reg.UC_X86_REG_RAX,dest)
                m.reg_write(reg.UC_X86_REG_RSP,rsp+8)
                m.reg_write(reg.UC_X86_REG_RIP,ret)
            else:
                assert entry<=pc<end
        machine.hook_add(UC_HOOK_CODE,hook)
        for length in range(9):
            original=[bytes([i+1])*width for i in range(length)]
            for index in [*range(length),length,(1<<64)-1]:
                failures.clear()
                machine.mem_write(heap,struct.pack('<3Q',length,heap+0x1000,length))
                machine.mem_write(heap+0x1000,b''.join(original))
                machine.mem_write(stack+0x8008,struct.pack('<Q',stop))
                machine.reg_write(reg.UC_X86_REG_RSP,stack+0x8008)
                for r in [reg.UC_X86_REG_RAX,reg.UC_X86_REG_RBX,reg.UC_X86_REG_RSI,reg.UC_X86_REG_RDI]:machine.reg_write(r,0)
                if width==8:
                    machine.reg_write(reg.UC_X86_REG_RCX,heap)
                    machine.reg_write(reg.UC_X86_REG_RDX,index)
                else:
                    machine.reg_write(reg.UC_X86_REG_RCX,heap+0x2000)
                    machine.reg_write(reg.UC_X86_REG_RDX,heap)
                    machine.reg_write(reg.UC_X86_REG_R8,index)
                    machine.reg_write(reg.UC_X86_REG_R9,0)
                machine.emu_start(entry,stop,count=200)
                assert bool(failures)==(index>=length)
                assert struct.unpack('<Q',machine.mem_read(heap+16,8))[0]==length-int(index<length)
                if index<length:
                    remaining=b''.join(original[:index]+original[index+1:])
                    assert bytes(machine.mem_read(heap+0x1000,len(remaining)))==remaining
                    if width==8:assert machine.reg_read(reg.UC_X86_REG_RAX)==int.from_bytes(original[index],'little')
                    else:assert bytes(machine.mem_read(heap+0x2000,width))==original[index]
                count+=1
        if width==120:
            failures.clear()
            machine.mem_write(heap,struct.pack('<3Q',2,heap+0x1000,2))
            machine.mem_write(heap+0x1000,bytes(width)+bytes([7])*width)
            machine.mem_write(stack+0x8008,struct.pack('<Q',stop))
            for r,value in [(reg.UC_X86_REG_RSP,stack+0x8008),(reg.UC_X86_REG_RCX,heap+0x2000),
                            (reg.UC_X86_REG_RDX,heap),(reg.UC_X86_REG_R8,0),(reg.UC_X86_REG_R9,0)]:machine.reg_write(r,value)
            machine.emu_start(entry,stop,count=200)
            assert failures and struct.unpack('<Q',machine.mem_read(heap+16,8))[0]==1
            assert bytes(machine.mem_read(heap+0x1000,width))==bytes([7])*width
            count+=1
    return count


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage',action='store_true')
    args=parser.parse_args()
    result=derive()
    assert sha((ROOT/GENERATOR).read_bytes())==GENERATOR_SHA256
    assert sha((ROOT/RENDERER).read_bytes())==RENDERER_SHA256
    if args.stage:
        WORK.mkdir(exist_ok=True,parents=True)
        (WORK/'q41-custom-diagnostics.json').write_text(proof_text(result)+'\n')
    else:
        assert json.loads(KEEP.read_text())==result
    print(json.dumps(result['counts'],sort_keys=True))
    print('Current D01 exact roles and native vector boundaries agree; no compilation/game.')
if __name__=='__main__':main()

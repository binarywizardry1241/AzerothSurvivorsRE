#!/usr/bin/env python3
"""Classify all twenty unobserved fixed-address targets without native queries."""
import argparse
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct

import coverage_common as coverage
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_GRP_JUMP
from capstone.x86_const import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP

SOURCE_ROOT = coverage.ROOT
SUMMARY = 'docs/analysis/evidence/native-diagnostics/native-operands.json'
PRIOR = 'docs/analysis/evidence/address-leaves/contract.json'
ASSEMBLY = 'docs/analysis/evidence/address-leaves/leaves.asm'
OUTPUT = 'docs/analysis/evidence/address-leaves.json'
SHA = '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
# Current and historical selectors, not inferred native source identities.
MAPPING = [(0x1442ee990, 0x144094d80), (0x1442ee9a0, 0x144094d90),
           (0x144b40830, 0x1448e61d0), (0x14540ecc0, 0x14517fe00),
           (0x145a60000, 0x1457ca250), (0x145a60010, 0x1457ca260), (0x145a60020, 0x1457ca270),
           (0x145a76de0, 0x1457de290), (0x145a76e20, 0x1457de2d0), (0x145a76e40, 0x1457de2f0),
           (0x145a76e60, 0x1457de310), (0x145a76ea0, 0x1457de350), (0x145a76ec0, 0x1457de370),
           (0x145a76ee0, 0x1457de390), (0x145a76f20, 0x1457de3d0), (0x145a76f40, 0x1457de3f0),
           (0x145a923f0, 0x1457fb960), (0x145a92410, 0x1457fb980), (0x145ddcf60, 0x145af18c0)]


def generate(root):
    coverage.ROOT = root
    coverage.REGISTRY = root / 'docs/analysis/coverage/targets.json'
    coverage.REFERENCE_CONFIG = root / '.codex/reference-game.json'
    target = coverage.latest_target(verify=True)
    assert target['sha256'] == SHA
    spec = importlib.util.spec_from_file_location('address_leaf_pe', root / 'scripts/inventory-executable.py')
    parser = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(parser)
    pe = parser.PE(coverage.target_bytes(target))
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    def commitment(path, source=False):
        return dict(path=path, sha256=coverage.file_sha256((SOURCE_ROOT if source else root) / path))
    def raw(a, n):
        at = pe.rva_offset(a - pe.image_base)
        return pe.data[at:at+n]
    def span(a, b):
        return dict(start=hex(a), end_exclusive=hex(b), file_offset=hex(pe.rva_offset(a-pe.image_base)),
                    sha256=hashlib.sha256(raw(a, b-a)).hexdigest())
    def decoded(a, b):
        rows = list(decoder.disasm(raw(a, b-a), a))
        assert sum(i.size for i in rows) == b-a
        return rows
    summary = json.loads((root / SUMMARY).read_text())
    assert summary['target']['sha256'] == SHA
    for key in ('details', 'inventory'):
        assert commitment(summary[key]['path'])['sha256'] == summary[key]['sha256']
    details = json.loads((root / summary['details']['path']).read_text())
    missing = {r['destination']: r for r in details['unowned_executable_address_candidates']
               if r['decode_status'] == 'not-observed'}
    assert len(missing) == summary['unowned_executable_candidates']['not_observed'] == 20
    assert set(missing) == {hex(a) for a, _ in MAPPING} | {'0x145a5b2d0'}
    inputs = []
    target_field = re.compile(r'"target"\s*:\s*"([^"]+)"')
    for line in gzip.open(root / summary['inventory']['path'], 'rt'):
        match = target_field.search(line)
        if match and match[1] in missing:
            row = json.loads(line)
            assert row['kind'] == 'address-expression'
            a = int(row['site'], 16)
            observed = bytes.fromhex(row['instruction_bytes'])
            assert raw(a, len(observed)) == observed
            instruction = decoded(a, a+len(observed))[0]
            operand = instruction.operands[1]
            assert instruction.mnemonic == 'lea' and operand.type == X86_OP_MEM
            assert operand.mem.base == X86_REG_RIP and instruction.address+instruction.size+operand.mem.disp == int(row['target'],16)
            inputs.append(row)
    assert len(inputs) == 21 and {r['target'] for r in inputs} == set(missing)
    prior = json.loads((root / PRIOR).read_text())
    prior_leaves = {int(r['address'],16):r for r in prior['leaves']}
    prior_instructions = {}
    for line in (root / ASSEMBLY).read_text().splitlines():
        address, encoded, *_ = line.split()
        prior_instructions[int(address[:-1],16)] = bytes.fromhex(encoded)
    leaves = []
    for current, old in MAPPING:
        p = prior_leaves[old]
        before = p['native_ranges'][0]
        length = int(before['end_exclusive'],16)-old
        native = span(current,current+length)
        if current != 0x14540ecc0:
            assert native['sha256'] == before['sha256']
            basis = 'complete leaf byte match; current surrounding context/targets checked separately'
        else:
            old_raw = b''.join(v for a,v in sorted(prior_instructions.items()) if old<=a<old+length)
            assert hashlib.sha256(old_raw).hexdigest() == before['sha256']
            def shape(rows, base):
                result=[]
                for i in rows:
                    operand=i.op_str
                    if i.group(CS_GRP_JUMP) and i.operands[0].type == X86_OP_IMM:
                        d=i.operands[0].imm
                        operand=f'local:{d-base:x}' if base<=d<base+length else 'external-pow-boundary'
                    if any(o.type==X86_OP_MEM and o.mem.base==X86_REG_RIP for o in i.operands):
                        operand=re.sub(r'\[rip [^\]]+\]', '[rip current-constant]', operand)
                    result.append((i.address-base,i.mnemonic,operand))
                return result
            assert shape(list(decoder.disasm(old_raw,old)),old)==shape(decoded(current,current+length),current)
            basis='complete opcode/register/branch correspondence plus separately checked current constants and pow import'
        leaves.append(dict(address=hex(current),native_range=native,predecessor_address=hex(old),
                           retained_role=p['result'],correspondence=basis,
                           AS_contract_established=False,original_decode_status=missing[hex(current)]['decode_status']))
    # This additional leaf is a concrete current unary tan boundary, not an AS
    # gameplay operation. Verify its entire finite/2^63/NaN guard and CRT import.
    tan=decoded(0x145a5b2d0,0x145a5b318)
    assert [i.mnemonic for i in tan]==['movq','movabs','and','movabs','cmp','jg','movdqa','pand','ucomisd','jb','movsd','ret']
    assert tan[1].operands[1].imm==0x7fffffffffffffff and tan[3].operands[1].imm==0x7fefffffffffffff
    leaves.append(dict(address='0x145a5b2d0',native_range=span(0x145a5b2d0,0x145a5b318),
                       retained_role='finite absolute-argument >=2^63 returns negative quiet NaN; other inputs reach imported tan',
                       AS_contract_established=False,original_decode_status=missing['0x145a5b2d0']['decode_status']))
    imports={int(r['iat_start_address'],16)+8*n:(r['library'],name)
             for r in pe.imports() for n,name in enumerate(r['functions'])}
    import_bindings=[]
    for entry,name in [(0x145febce7,'pow'),(0x145febcf9,'tan')]:
        thunk=decoded(entry,entry+6)[0]
        assert thunk.mnemonic=='jmp' and thunk.operands[0].type==X86_OP_MEM and thunk.operands[0].mem.base==X86_REG_RIP
        slot=thunk.address+thunk.size+thunk.operands[0].mem.disp
        assert imports[slot][1]==name
        import_bindings.append(dict(span(entry,entry+6),symbol=name,library=imports[slot][0],iat_slot=hex(slot)))
    constants=[]
    expected={0x1461d6040:bytes.fromhex('ffffffffffffff7fffffffffffffff7f'),
              0x1461a8d08:struct.pack('<d',1.0),0x1463a86c8:bytes.fromhex('000000000000f87f'),
              0x146198918:struct.pack('<d',float(2**63)),0x146fae718:bytes.fromhex('000000000000f8ff')}
    observed_constants=[]
    for i in decoded(0x14540ecc0,0x14540ed15)+tan:
        for o in i.operands:
            if o.type==X86_OP_MEM and o.mem.base==X86_REG_RIP:
                address=i.address+i.size+o.mem.disp
                assert raw(address,o.size)==expected[address]
                observed_constants.append(address)
            if i.group(CS_GRP_JUMP) and i.operands[0].type==X86_OP_IMM:
                assert i.operands[0].imm in [0x14540ed0c,0x145febce7,0x145febcf9]
    assert set(observed_constants)==set(expected)
    for address,value in expected.items():constants.append(dict(span(address,address+len(value)),hex_bytes=value.hex()))
    contexts=[]
    for entry,end,site,location,suffix in [
        (0x1442f7c20,0x1442f7fec,0x1442f7fd9,0x146c49d78,'naga-27.0.3/src/front/wgsl/parse/mod.rs'),
        (0x144b42430,0x144b42593,0x144b4257e,0x146df20a0,'futures-lite-2.6.1/src/io.rs'),
        (0x145a88bc0,0x145a8903d,0x145a8902f,0x146fb06d0,'crates/benilla-lua/src/compile.rs')]:
        i=next(i for i in decoded(entry,end) if i.address==site)
        assert i.mnemonic=='lea' and i.operands[1].type==X86_OP_MEM and i.operands[1].mem.base==X86_REG_RIP
        assert i.address+i.size+i.operands[1].mem.disp==location
        pointer,count,line,column=struct.unpack('<QQII',raw(location,24))
        path=raw(pointer,count)
        assert path.decode().replace('\\','/').endswith(suffix)
        contexts.append(dict(native_range=span(entry,end),location=span(location,location+24),
                             operand_site=hex(site),portable_suffix=suffix,line=line,column=column,
                             path_sha256=hashlib.sha256(path).hexdigest()))
    assert raw(0x1476d175b,21)==b'client authentication' and raw(0x1476d1770,21)==b'server authentication'
    # Both forwarded targets are checked explicitly; identical tiny-leaf bytes
    # alone would not establish the role of their current external destination.
    assert decoded(0x144b40830,0x144b40843)[-1].operands[0].imm==0x144b42430
    assert decoded(0x145ddcf60,0x145ddcf68)[-1].operands[0].imm==0x145ddd560
    formatter=decoded(0x145ddd560,0x145ddd6ab)
    by_site={i.address:i for i in formatter}
    for site,address in [(0x145ddd5a2,0x1476d1770),(0x145ddd5b6,0x1476d175b)]:
        i=by_site[site]
        assert i.mnemonic=='lea' and i.operands[1].type==X86_OP_MEM and i.operands[1].mem.base==X86_REG_RIP
        assert i.address+i.size+i.operands[1].mem.disp==address
    assert by_site[0x145ddd5bd].mnemonic=='mov' and by_site[0x145ddd5bd].op_str=='r8d, 0x15'
    assert by_site[0x145ddd5d3].mnemonic=='jmp' and by_site[0x145ddd5d3].op_str=='rax'
    assert all(by_site[a].mnemonic=='mov' and by_site[a].op_str=='rax, qword ptr [rax + 0x18]'
               for a in [0x145ddd59e,0x145ddd5b2])
    source='crates/benilla-lua/src/lib_math.rs'
    text=(root/source).read_text()
    assert 'if x.is_finite() && x.abs() >= X87_TRIG_RANGE' in text and 'x.tan()' in text and '9_223_372_036_854_775_808.0' in text
    number_source='crates/benilla-lua/src/number.rs'
    assert 'pub(crate) const INDEFINITE: u64 = 0xFFF8_0000_0000_0000;' in (root/number_source).read_text()
    return dict(schema_version=1,target=summary['target'],gap_ids=[41],lead_ids=['Q41-A01','Q41-M01'],
                generator=commitment('scripts/classify-address-leaves.py',True),
                inputs=[commitment(SUMMARY),summary['details'],summary['inventory'],commitment(PRIOR),commitment(ASSEMBLY)],
                selector="native-operands.json:details.unowned_executable_address_candidates[decode_status == 'not-observed']",
                counts=dict(destinations=20,forming_operands=len(inputs),retained_leaf_byte_matches=18),
                selected_operands=inputs,leaves=leaves,diagnostic_contexts=contexts,
                constants=constants,imports=import_bindings,
                formatter_context=dict(native_range=span(0x145ddd560,0x145ddd6ab),
                                       label_ranges=[span(a,a+21) for a in [0x1476d175b,0x1476d1770]],
                                       role='21-byte authentication labels forwarded through formatter vtable +0x18; concrete dynamic type unproved'),
                source_candidates=[commitment(source),commitment(number_source)],original_census_populations_unchanged=True,
                limits=['Complete20-target/21-forming-operand selector; all primitive bytes and current supporting boundaries checked.',
                        'No new Ghidra query, import, seed, body ownership or census claim; existing19 supporting roles retained with separate current bindings.',
                        'Locations and source counterparts give bounded context, not full parser/compiler/I/O/VM/TLS reconstruction, actual AS use or dynamic type identity.',
                        'No AS source defect or missing gameplay contract established; generic supporting branches stop at these interfaces.',
                        'No compilation, source/game/client/network/server execution or original/rebuilt comparison.'])


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    parser.add_argument('--analysis-workspace',type=Path,default=SOURCE_ROOT)
    args=parser.parse_args()
    result=generate(args.analysis_workspace.resolve())
    output=SOURCE_ROOT/OUTPUT
    if args.write:output.write_text(coverage.json_text(result))
    else:assert result==json.loads(output.read_text()),'Address-leaf classification differs'
    print(coverage.json_text(result['counts']).strip())


if __name__=='__main__':main()

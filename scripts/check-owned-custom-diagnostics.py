#!/usr/bin/env python3
"""Retain every owned AS diagnostic's bounded first-interface graph.

Both conditional successors are followed. Dynamic transfers, local cycles and
explicit finite bounds stay unresolved. Shared helper identity/path membership
never establishes a successful AS mechanic or source implementation.
"""
import argparse
from collections import Counter, defaultdict
import gzip
import hashlib
import importlib.util
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes, project_path, file_sha256, load_json, json_text
from native_residual_summary import residual_summary_path
from derived_gzip import derived_gzip_text
from compact_evidence import proof_text

GENERATOR = 'scripts/check-owned-custom-diagnostics.py'
GENERATOR_SHA256 = file_sha256(ROOT/GENERATOR)
SHA256 = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
LIMITS = dict(instructions_per_path=256, conditional_guards_per_path=16, paths_per_site=256)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT/path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def packed(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':')).encode()


def pointer_projection(flow, canonical, capstone, continued_calls=None):
    """Exact selected LEA pointer copies only; no alias/type inference."""
    x86 = capstone.x86_const
    first = flow[0]
    selected = canonical(first.reg_name(first.operands[0].reg))
    registers = {selected}
    memory = {}
    stores = []
    opaque_use = None
    lost_memory_alias = False
    for instruction in flow[1:-1]:
        if continued_calls and instruction.address in continued_calls:
            # A proven supporting call did not receive this pointer. Win64
            # preserves these local copies; no volatile return value is guessed.
            registers.difference_update(VOLATILE_GPRS)
            memory = {key: value for key, value in memory.items() if key[0] not in VOLATILE_GPRS}
            continue
        operands = instruction.operands
        result = False
        destination = None
        memory_copy = None
        modeled_pointer_copy = False
        if instruction.mnemonic == 'mov' and len(operands) == 2:
            left, right = operands
            source = right.type == x86.X86_OP_REG and canonical(instruction.reg_name(right.reg)) in registers and right.size == 8
            if right.type == x86.X86_OP_MEM and right.size == 8 and not right.mem.index and not right.mem.segment:
                key = (canonical(instruction.reg_name(right.mem.base)), right.mem.disp)
                source = memory.get(key, False)
            if left.type == x86.X86_OP_REG:
                destination = canonical(instruction.reg_name(left.reg))
                result = source and left.size == 8
                modeled_pointer_copy = source and left.size == 8
            elif left.type == x86.X86_OP_MEM:
                m = left.mem
                if not m.index and not m.segment and left.size == 8:
                    key = (canonical(instruction.reg_name(m.base)), m.disp)
                    memory_copy = (key, source)
                    if source:
                        modeled_pointer_copy = True
                        stores.append(dict(site=hex(instruction.address), destination=instruction.op_str.split(',')[0],
                                           base=key[0], displacement=key[1], width_bytes=8))
                        if key[0] not in ('rsp', 'rbp'):
                            lost_memory_alias = True
        reads, writes = instruction.regs_access()
        selected_reads = sorted(registers & {canonical(instruction.reg_name(r)) for r in reads})
        zeroing = instruction.mnemonic in ('xor', 'sub') and len(operands) == 2 and all(o.type == x86.X86_OP_REG for o in operands) and operands[0].reg == operands[1].reg and operands[0].size >= 4
        if selected_reads and not modeled_pointer_copy and not zeroing and opaque_use is None:
            opaque_use = dict(site=hex(instruction.address), instruction=instruction.mnemonic+' '+instruction.op_str,
                              selected_register_inputs=selected_reads)
            for operand in operands:
                if operand.type == x86.X86_OP_MEM and operand.access & capstone.CS_AC_READ and not operand.mem.index and not operand.mem.segment and canonical(instruction.reg_name(operand.mem.base)) in registers:
                    opaque_use['exact_origin_memory_read'] = dict(displacement=operand.mem.disp, width_bytes=operand.size)
        # A partial scalar/SIMD overwrite also destroys a stored exact pointer.
        for operand in operands:
            if operand.type == x86.X86_OP_MEM and operand.access & capstone.CS_AC_WRITE and not operand.mem.index and not operand.mem.segment:
                base = canonical(instruction.reg_name(operand.mem.base))
                begin, end = operand.mem.disp, operand.mem.disp+operand.size
                memory = {key: value for key, value in memory.items()
                          if not (key[0] == base and begin < key[1]+8 and key[1] < end)}
        for written in writes:
            name = canonical(instruction.reg_name(written))
            registers.discard(name)
            # Symbolic memory keys cease to identify the same address when
            # their base register changes. No stack/heap alias is guessed.
            if any(value and key[0] == name for key, value in memory.items()):
                lost_memory_alias = True
            memory = {key: value for key, value in memory.items() if key[0] != name}
        if destination and result:
            registers.add(destination)
        if memory_copy:
            memory[memory_copy[0]] = memory_copy[1]
    carriers = sorted(registers & {'rcx', 'rdx', 'r8', 'r9'})
    carriers += sorted('stack+'+hex(displacement) for (base, displacement), value in memory.items()
                       if value and base == 'rsp' and displacement >= 0x20)
    return dict(exact_argument_carriers=carriers, retained_registers=sorted(registers),
                selected_pointer_stores=stores,
                live_local_pointer_locations=[dict(base=k[0], displacement=k[1]) for k, value in sorted(memory.items()) if value],
                opaque_pointer_use=opaque_use, unresolved_memory_alias=lost_memory_alias,
                memory_stores_do_not_establish_aggregate_or_global_aliases=True)


# These exact current bodies were reviewed only for the supporting operation and
# incoming selected-pointer interface. Concrete generic subsystem types remain
# outside D01. Complete bytes, not a symbol name, commit each reviewed identity.
SUPPORT_HASHES = {
    0x145eb6fcb: 'baf55c39d1d7d40f6ecf046d9f1de740d12c7fa99b58e7d3f044c9d02d144325',
    0x1400021d0: 'd81d62cb66149c453527a97f36557bdec2ce4ed2b200d021af7862c2dc6a4599',
    0x140034830: '73ebe08e974dc9f1ba7ec3d22f31cdd6e54df1be4927503380bee6862217583a',
    0x1400e72a0: 'f5765c5ead20e4d88318ab056babfe2ee4cd15d076a6839574671bfa84eddd83',
    0x1400f16f0: 'd1db448099a44690cb94b7ae77fc4b3bd09eadd4417023e30973fe3a4334eb6c',
    0x1400f17d0: '2adfee04657a0e69abe498eff25867e4b4bc5df4625f47f2cf65ac044734fbca',
    0x1400f18b0: '291a64ebcfc6d09f49130dae4e22027932e05cc9bcb9d4a2cdb1702a77243857',
    0x1400f1990: '05521488c2a2b77cfefa46ccd12944ce76b6ffe87bce2fbaaa64dd4b2beae812',
    0x1401451e0: '8dea69a70c6b5a7669823452171e94136d65e3032c6f86704ca19a0ea19673e1',
    0x1401f1e70: '52c672bac18aecd565fe5fb1cbdd25d898979d9ad60ca1b59e803407d440be7e',
    0x1402b5560: '857f3d062dc7e61ba2efe60c8045f43e2f7a08371c6c170fac06cca0784088b8',
    0x1402cce90: '10c8d52c770de83db5663f08a2b8db4c6be2cf9daaafd0f1e9261996a0449c15',
    0x1402cd140: '6d5483442f8fd3b2acee32b6527a78c25a0ad1f86f72564996cf97fec021e1d3',
    0x1402cd3f0: '8c00003faf116fe1df755f06bfed603776e67234e03f762b203fc4630a661064',
    0x1402cd6a0: 'fa4ffa194815b4054fe367d5581e08e75acee5209d0dc962c3ef52c561dddcae',
    0x1402cd950: '00093250f88a81e18d6343cccbc4f5b4a22de67408f08b0120f706f00225d4b7',
    0x1402cdc00: '992673fdb832e564230e81302e3192ae6b2d03c3bf9742fe1d0cc82b0767868e',
    0x1402cdeb0: '76f1995f159c32e26a391019ebee710f6f3e9a765354db6dfe33adefccd5c405',
    0x1402ce160: '3bb0e236908ca615d26a3dcf21ec83ef65a05738bb8c7bdf55746ec6cb7da8bd',
    0x1402ce410: '893625e3e79df6c53f34877b870ea9f23bf490fed7968ae145efe5363ea78175',
    0x1402ce6c0: '622c12dbb49335e805683ee797ce52eed2ed8981147a7d215d515cf13f45760f',
    0x1402ce970: 'fdb453b49fb030d2a539f15a7d6aec10a12a5ff93d6f5afb2a666a8a9a49ae0a',
    0x1402cec20: '97dfc6df93c056fda9b5a4d8c06a46997e6ebb9833953a5b3617a66118969ac9',
    0x1402ceed0: '614cd6cf617e894dd9b5a99b52e62e51e935671c0d471ed3f84ea678eb27f7c8',
    0x1402cf180: '6979b32c0c53d89dcdf73c890d748e5d3d2ab12e528d75926ab502b3124c7e8f',
    0x1402cf430: 'ce2b7a6e485024486c5cd849db15fc18fb3cc1c1f5a8a925356de841d4fe6c71',
    0x1402cf6e0: '47de3d4bb857e810bd1e0f9916aa275aaf93e65e8e8e63a9545cbe5c4a9a3dcc',
    0x1402cf990: 'c53ba512782d2a63ed18232fc1c4a7f32a5373236851566d6753445ba47af523',
    0x1402cfc40: '3724593738f31d08c157a0862ecd453580033550687e7042857309e6d40520e2',
    0x1402cfef0: 'b4150bfa2c993360357e563deb45b2a046c349ba65573f1bb3a7c0049d0bc0f3',
    0x1402d01a0: '81b5e277486ed766c2380fede92cdccd1663c10b9708607788bec3b8391b3827',
    0x1402d0480: 'e87942e2fd4dfaa785d7446f318ee3fd61f1790c457791e1f69189d98130429e',
    0x1402d0730: '8fe58fe7f6cc696d1622d268effe04552abe24c40b0813cd848c83c45f2c4e9f',
    0x1402d09e0: 'ec1057c0a8cc2a044147dede4a2883557f6cd3c39a495a6b5a6f2d1edb4128a8',
    0x1402d0c90: '14411b88571264a6a15f9ecc4b88a73c12778bbd78749289912490935bdd6357',
    0x1402d0f40: '5f6a3f58001414c4058c0b27e064b7ced3af50654d70f894ca95a012f80c6261',
    0x1402d11f0: 'e678b2d281981a783210729c948d8d766a80bd792667c44f5bc56acb5ec239f0',
    0x1402d14a0: 'd67c87f2a075566945b2d7abc365d4d1137a453e74fcbf17575291dfa9b0d320',
    0x1405cd330: 'e08e1c5135d335b9ff4b174b3ec22e724cc66a53ebe02c27ef3be0ccb16aa677',
    0x1405d0df0: 'cd5b22ff8350f85722b238aec5d4059f9482280beed3c30af3879ac615289c01',
    0x142a769a0: '1fa9721fddb3cd28ace4e4980d498d1e7d158c612e9b104149afa3606bf5f832',
    0x144df2560: '22f8b57ba396e52aac010f015043168e93bb017c644c60ec4011079f6aef8e47',
    0x144df2810: '8000298800e964f332dcc05b1ce294000f3ad4e559ab77fe6436d750de08cb3c',
    0x14584f0c0: 'cbc36e5dfd232b5b8cd15b6683e3a938dc1e112b3519f50e4e951a9b751f83a2',
    0x145858350: '29be3795bc04b76b544f1682acf07703c453110d725750cfe62cae5878743c2d',
    0x1458dfee0: 'bf0b2a78201782fd1c91a08551c39ce2645cb28f1976c561ac1cb08f318ae724',
    0x1459bf890: '64735e07b514ca9f6d0cfc22d0a2a71fe21dfe851dfe44fdd31669d8a7251a61',
}
VOLATILE_GPRS = {'rax', 'rcx', 'rdx', 'r8', 'r9', 'r10', 'r11'}
SAVED_GPRS = {'rbx', 'rbp', 'rsi', 'rdi', 'r12', 'r13', 'r14', 'r15'}


def supporting_interfaces(raw, decoder, ends, canonical, engine):
    x86 = __import__('capstone').x86_const
    records = {}
    codes = {}
    def code(entry):
        if entry not in codes:
            count = ends.get(entry, entry+16)-entry
            codes[entry] = list(decoder.disasm(raw(entry, count), entry))
        return codes[entry]
    def has(entry, *expected):
        actual = [(i.mnemonic, i.op_str) for i in code(entry)]
        require(all(item in actual for item in expected), 'Supporting helper operation differs: '+hex(entry))
        return [list(item) for item in expected]
    def add(entry, role, inputs, contract, *, carrier=None, guards=(), unused=(), extra=None):
        end = ends.get(entry)
        data = raw(entry, end-entry if end is not None else 16)
        require(hashlib.sha256(data).hexdigest() == SUPPORT_HASHES[entry], 'Reviewed supporting helper changed: '+hex(entry))
        record = dict(entry=hex(entry), end_exclusive=hex(end) if end else None,
                      byte_count=len(data), sha256=SUPPORT_HASHES[entry], role=role,
                      meaningful_input_arguments=list(inputs), selected_pointer_contract=contract,
                      location_argument=carrier, ignored_incoming_arguments=list(unused),
                      instruction_guards=has(entry, *guards), generic_supporting_context=True,
                      concrete_subsystem_type_complete=False, complete_native_semantics=False)
        if extra: record.update(extra)
        records[entry] = record
    # 27 typed command append templates: the identity/allocation helper's r9
    # nonconsumption is already guarded by E01. memcpy is a three-argument call;
    # each growth path overwrites r9 with constant alignment before forwarding.
    templates = [a for a in SUPPORT_HASHES if 0x1402cce90 <= a <= 0x1402d14a0]
    nested = next(r for r in engine['helper_guards'] if r['entry'] == '0x144d9a790')
    require(hashlib.sha256(raw(0x144d9a790, ends[0x144d9a790]-0x144d9a790)).hexdigest() == nested['sha256'], 'Canonical ID reservation helper differs')
    for entry in templates+[0x1402b5560]:
        payload, record_bytes = (32, 48) if entry == 0x1402b5560 else (416, 432)
        require(all(not any(canonical(i.reg_name(r)) == 'r9' for r in i.regs_access()[0]) for i in code(entry)), 'Command template reads incoming r9')
        calls = [i for i in code(entry) if i.mnemonic == 'call']
        require(all(i.operands[0].type == x86.X86_OP_IMM and i.operands[0].imm in (0x144d9a790, 0x145d145fb, 0x145d14a10) for i in calls), 'Command template has unreviewed nested call')
        add(entry, 'queued_payload_append_and_context', ('rcx','rdx','r8'),
            'Incoming r9 is neither read locally nor consumed by the guarded ID allocator; copy takes three arguments and growth overwrites r9=1. The selected diagnostic pointer in r9 is unused.',
            unused=('r9',), guards=(('call','0x144d9a790'),('mov','r9d, 1'),('call','0x145d14a10')),
            extra=dict(payload_bytes=payload, queued_record_bytes=record_bytes,
                       nested_id_interface='engine-diagnostic-roles.json#helper_guards:0x144d9a790'))
    add(0x144df2810, 'queued_command_append', ('rcx',),
        'rcx supplies context/entity. Incoming rdx and r8 are not used; growth writes both before its call. A selected Location in those extra arguments is not consumed.',
        unused=('rdx','r8','r9'), guards=(('mov','rbx, qword ptr [rcx]'),('add','rdi, 0x18'),('mov','r8d, 0x18'),('mov','rdx, rdi'),('call','0x145d14a10')),
        extra=dict(queued_record_bytes=24))
    add(0x144df2560, 'reserve_id_and_queue_command', ('rcx','rdx'),
        'Reserves an ID with atomic counters and queues a 16-byte record. Incoming r8 is overwritten; overflow installs its own static Location.',
        unused=('r8','r9'), guards=(('lock xadd','qword ptr [rbx + 0x18], rax'),('lock xadd','dword ptr [rbx + 0x20], ebp'),('call','0x145eb7280')),
        extra=dict(queued_record_bytes=16))
    add(0x1401f1e70, 'tagged_value_drop_and_storage_release', ('rcx',),
        'Reads the rcx tag, dispatches contained drops, and conditionally frees stored bytes. Incoming rdx is overwritten from rcx before use; r10 is not an ABI argument.',
        unused=('rdx','r8','r9'), guards=(('mov','rdx, rcx'),('cmp','rax, 3'),('jmp','0x1400072f0'),('jmp','0x1400021d0')))
    add(0x1400021d0, 'heap_deallocation_thunk', ('rcx','rdx','r8'),
        'Fixed tail jump to current heap deallocation adapter; r10 is not an argument. The thunk does not itself read an incoming selected pointer in r10.',
        unused=('r9',), guards=(('jmp','0x145cbddd0'),))
    add(0x142a769a0, 'tagged_object_length_bounded_key_lookup', ('rcx','rdx','r8'),
        'Requires object tag 5, compares the rcx key against stored keys using min(rdx, stored length) and memcmp, then resolves length/depth. A retained callee-saved pointer is not supplied unless copied into rcx.',
        guards=(('cmp','byte ptr [r8], 5'),('mov','r15, rdx'),('mov','rdi, rcx'),('cmovb','r8, r15'),('call','0x145d14601'),('mov','rax, rbx')))
    for entry in (0x1400f16f0,0x1400f17d0,0x1400f18b0,0x1400f1990):
        add(entry, 'checked_state_and_descriptor_operation', ('rcx','rdx'),
            'Selected Location rdx is saved in rsi and reaches r8 of the canonical formatted failure on invalid state or descriptor error; ordinary success returns the input context.',
            carrier='rdx', guards=(('mov','rsi, rdx'),('cmp','al, 1'),('call','0x144d64a60'),('mov','r8, rsi'),('call','0x145eb7540')))
    add(0x1401451e0, 'checked_descriptor_registration', ('rcx','rdx','r8','r9'),
        'Allocates a 16-byte payload and performs four descriptor operations. Incoming r9 is saved in rsi and delivered as r8 Location only on descriptor failure.',
        carrier='r9', guards=(('mov','rsi, r9'),('mov','ecx, 0x10'),('call','0x1400021c0'),('call','0x144d64a60'),('mov','r8, rsi'),('call','0x145eb7540')))
    add(0x1459bf890, 'stable_eight_byte_pair_vector_remove', ('rcx','rdx','r8'),
        'Checks index against vector length; failure forwards unchanged r8 Location to removal-index failure. Success memmoves remaining 8-byte elements, decrements length, and returns the removed two f32 lanes.',
        carrier='r8', guards=(('call','0x145d14607'),('call','0x145eb709b'),('movaps','xmm0, xmm6'),('movaps','xmm1, xmm7')))
    add(0x1458dfee0, 'localize_or_original_literal', ('rcx','rdx'),
        'Passes pointer/length to the canonical current localizer and returns the original pair when lookup returns null.',
        guards=(('call','0x1458dff90'),('test','rax, rax'),('cmove','rax, rdi'),('cmove','rdx, rsi')),
        extra=dict(canonical_localizer='addon-timers/integration.json#owners:0x1458dff90'))
    add(0x14584f0c0, 'object_key_and_unsigned_number_append', ('rcx','rdx','r8','r9','stack+0x20'),
        'Moves incoming key pointer r8 to rdx, key length r9 to r8 and calls comma/quoted-key/colon writer; then converts the stack u32 to a numeric value and appends its encoded bytes.',
        guards=(('mov','rdx, r8'),('mov','r8, r9'),('call','0x1458580a0'),('call','0x14585a5c0'),('call','0x145d145fb')))
    add(0x145858350, 'object_key_and_string_value_append', ('rcx','rdx','r8','r9','stack+0x20','stack+0x28'),
        'Writes key via the shared comma/quoted-key/colon operation; incoming stack pointer/length are forwarded as rdx/r8 to string encoding, then copied into the output buffer.',
        guards=(('call','0x1458580a0'),('mov','rdx, qword ptr [rbp + 0x60]'),('mov','r8, qword ptr [rbp + 0x68]'),('call','0x14585a6f0')))
    add(0x140034830, 'text_payload_copy_and_queued_UI_construction', ('rcx','rdx','r8','r9','stack+0x20'),
        'Saves incoming r9 text pointer in rdi; incoming stack length is r14. Allocates length bytes and memcpy copies from rdi before queuing a structured UI payload. This is a string consumer, not a Rust Location interface.',
        guards=(('mov','rdi, r9'),('mov','r14, qword ptr [rbp + 0x590]'),('mov','rdx, rdi'),('mov','r8, r14'),('call','0x145d145fb'),('call','0x1402d2c30')))
    add(0x1400e72a0, 'range_map_to_owned_string_vector', ('rcx','rdx'),
        'rdx points to [start,end,context]. Reads end at +8, computes record count with stride 152, maps each record to 24 output bytes and returns vector header. Selected static pointer stored at caller tuple+8 is an end bound, not consumed filename text.',
        guards=(('mov','rcx, qword ptr [rdx + 8]'),('sub','rax, rbx'),('add','rbx, 0x98'),('add','r14, 0x18'),('call','0x1400a1b90')),
        extra=dict(aggregate_selected_pointer=dict(argument='rdx',displacement=8,consumer='0x1400e72c4')))
    add(0x1405cd330, 'fixed_resource_string_pair_dispatch', ('rcx','rdx','r8','r9','stack+0x20'),
        'Finds fixed resource by current type/hash key, checks storage state, updates change tick and tail-forwards rdx/r8 and r9/stack length to the string-pair operation. Absence returns without delivery.',
        guards=(('movabs','r11, 0x22262e8865ef39de'),('cmp','byte ptr [r10 + rax + 0x30], 1'),('mov','dword ptr [r10 + 0x2c], ecx'),('jmp','0x140f0b870')),
        extra=dict(forwarded_value_pointer='r9',forwarded_value_length='stack+0x20',target_interface='0x140f0b870'))
    add(0x1405d0df0, 'fixed_resource_string_change_and_event_drain', ('rcx','rdx','r8','r9','stack+0x20'),
        'Finds the same fixed resource and forwards incoming r9 plus stack length into a string change operation, then drains queued 72-byte events. Failure to resolve resource returns without delivery.',
        guards=(('movabs','r11, 0x22262e8865ef39de'),('mov','qword ptr [rsp + 0x20], rax'),('call','0x140f0d870'),('call','0x140f0b450'),('call','0x140a2b950')),
        extra=dict(forwarded_value_pointer='r9',forwarded_value_length='stack+0x20',target_interface='0x140f0d870'))
    add(0x145eb6fcb, 'allocation_layout_or_capacity_failure', ('rcx','rdx'),
        'Nonreturning shared failure dispatch: rcx==0 calls capacity-overflow failure, otherwise forwards allocation layout to allocation failure. A pointer retained only in r15 is not a failure argument.',
        guards=(('test','rcx, rcx'),('call','0x145eb6ff0'),('call','0x145eb6fb1'),('ud2','')),
        extra=dict(returns_normally=False))
    require(set(records) == set(SUPPORT_HASHES), 'Finite reviewed helper set differs')
    return records


def pointer_model_checks(decoder, canonical, capstone):
    def project(encoded, continued=False):
        code = list(decoder.disasm(bytes.fromhex(encoded), 0x1000))
        effects = {i.address: {} for i in code if i.mnemonic == 'call'} if continued else None
        return pointer_projection(code+[code[-1]], canonical, capstone, effects)
    result = project('4c8d3d000000004c89f9e8000000004c89f9', True)
    require(set(result['retained_registers']) == {'r15','rcx'}, 'Saved-copy continuation fixture failed')
    require(not project('4c8d1500000000e8000000004c89d1', True)['retained_registers'], 'Volatile pointer incorrectly survives call')
    require(not project('488d05000000004889452031c0c7452000000000')['live_local_pointer_locations'], 'Partial store leaves a false exact pointer')
    require(not project('488d3d0000000031ff')['retained_registers'], '32-bit overwrite leaves a false exact pointer')
    result = project('488d05000000004889452031c0488b4d20')
    require(result['retained_registers'] == ['rcx'], 'Exact local pointer copy fixture failed')
    return dict(synthetic_pointer_model_cases=5, application_execution=False)


def literal_length(flow, local, carrier, canonical, capstone):
    def assignment(instruction):
        if not instruction.operands: return None
        left = instruction.operands[0]
        if carrier.startswith('stack+'):
            matches = left.type == capstone.x86_const.X86_OP_MEM and instruction.reg_name(left.mem.base) == 'rsp' and not left.mem.index and left.mem.disp == int(carrier[6:],16)
        else:
            matches = left.type == capstone.x86_const.X86_OP_REG and canonical(instruction.reg_name(left.reg)) == carrier
        if not matches: return None
        if instruction.mnemonic == 'mov' and len(instruction.operands) == 2 and instruction.operands[1].type == capstone.x86_const.X86_OP_IMM:
            return instruction.operands[1].imm
        return False
    for instruction in reversed(flow[:-1]):
        if instruction.mnemonic == 'call': return None
        value = assignment(instruction)
        if value is not None: return value if value is not False else None
    predecessor = sorted((i for a,i in local.items() if a < flow[0].address), key=lambda i:i.address, reverse=True)
    following = flow[0].address
    for instruction in predecessor[:16]:
        if instruction.address+instruction.size != following or instruction.group(capstone.CS_GRP_JUMP) or instruction.group(capstone.CS_GRP_CALL) or instruction.group(capstone.CS_GRP_RET): break
        value = assignment(instruction)
        if value is not None: return value if value is not False else None
        following = instruction.address
    return None


def main():
    import capstone
    from capstone.x86_const import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', default='docs/analysis/evidence/native-diagnostics/owned-custom-diagnostics.json')
    parser.add_argument('--stage', action='store_true')
    parser.add_argument('--residual-summary', help='Select a snapshot for a new proof; replay defaults to its retained receipt')
    args = parser.parse_args()
    proof_path = project_path(args.proof)
    require(not args.stage or proof_path.is_relative_to(ROOT/'runtime'), 'Proposed proof must stay in runtime/')
    target = latest_target(verify=True)
    require(target['sha256'] == SHA256, 'Wrong installed target')
    identity = {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    dependency_names = ('scripts/coverage_common.py', 'scripts/derived_gzip.py', 'scripts/inventory-executable.py',
                        'scripts/summarize-native-image.py', 'scripts/classify-native-ownership.py',
                        'scripts/check-engine-diagnostic-roles.py', 'scripts/compact_evidence.py',
                        'scripts/native_residual_summary.py')
    dependencies = [dict(path=p, sha256=file_sha256(ROOT/p)) for p in dependency_names]
    inputs = []
    def consume(path, digest=None):
        path = project_path(path)
        actual = file_sha256(path)
        require(digest is None or actual == digest, 'Changed consumed input: '+str(path))
        binding = dict(path=path.relative_to(ROOT).as_posix(), sha256=actual)
        inputs.append(binding)
        return binding
    residual_binding = consume(residual_summary_path(proof_path, args.residual_summary))
    residual = load_json(project_path(residual_binding['path']))
    require(residual['target'] == identity, 'Residual target differs')
    diagnostic_artifact = residual['artifacts']['diagnostic-sites.jsonl.gz']
    consume(diagnostic_artifact['path'], diagnostic_artifact['sha256'])
    census_binding = consume('docs/analysis/coverage/full-image-census.json')
    census = load_json(project_path(census_binding['path']))
    require(census['target'] == identity and census_binding in residual['inputs'], 'Residual census differs')
    body_path = project_path(census['artifacts']['directory'])/'bodies.tsv.gz'
    consume(body_path, census['artifacts']['files']['bodies.tsv.gz']['sha256'])
    ownerless_binding = consume('docs/analysis/evidence/native-diagnostics/q41-custom-diagnostics.json')
    ownerless = load_json(project_path(ownerless_binding['path']))
    engine_binding = consume('docs/analysis/evidence/engine-diagnostic-roles-comparison.json')
    engine = load_json(project_path(engine_binding['path']))
    require(ownerless['target'] == identity and engine['target'] == identity, 'Canonical diagnostic target differs')
    timer_binding = consume('docs/analysis/evidence/addon-timers/integration.json')
    timer = load_json(project_path(timer_binding['path']))
    require(timer['target_sha256'] == SHA256, 'Existing timer/localizer target differs')
    diag_binding = consume(ownerless['inputs']['diagnostic-ownership']['path'], ownerless['inputs']['diagnostic-ownership']['sha256'])
    diagnostic = load_json(project_path(diag_binding['path']))
    require(diagnostic['target']['sha256'] == SHA256, 'Diagnostic inventory target differs')
    helpers = module('owned_diag_census', 'scripts/summarize-native-image.py')
    ownership = module('owned_diag_ownership', 'scripts/classify-native-ownership.py')
    canonical_interfaces = module('owned_diag_interfaces', 'scripts/check-engine-diagnostic-roles.py')
    owner = helpers.owner_lookup([(int(r['start'], 16), int(r['end'], 16), int(r['entry'], 16))
                                  for r in helpers.rows(body_path) if r['external'] == 'false'])
    pe = module('owned_diag_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    ends = {pe.image_base+a: pe.image_base+b for a, b, _ in pe.functions()}
    def raw(address, count):
        first = pe.rva_offset(address-pe.image_base)
        last = pe.rva_offset(address+count-1-pe.image_base)
        require(last-first == count-1, 'Native bytes cross a noncontiguous mapping')
        return pe.data[first:first+count]
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    static_checks = pointer_model_checks(decoder, ownership.canonical_register, capstone)
    roles = {int(r['entry'], 16): (r['role'], None, 'q41-custom-diagnostics.json#helpers:'+r['entry']) for r in ownerless['helpers']}
    canonical_helpers = {int(r['entry'], 16): r for r in ownerless['helpers']}
    localizer = next(r for r in timer['owners'] if r['start'] == '0x1458dff90' and r['role'] == 'literal-name-lookup')
    canonical_helpers[0x1458dff90] = dict(entry=localizer['start'], end_exclusive=localizer['end'], sha256=localizer['sha256'])
    roles[0x1458dff90] = ('existing_literal_name_lookup', None, 'addon-timers/integration.json#owners:0x1458dff90')
    for helper in engine['helpers']:
        entry = int(helper['entry'], 16)
        carrier = canonical_interfaces.INTERFACES[entry][1]
        roles.setdefault(entry, (helper['role'], carrier, 'engine-diagnostic-roles.json#helpers:'+helper['entry']))
        canonical_helpers.setdefault(entry, helper)
    # Preserve the independently established location argument of D01 helpers.
    for entry, (_, carrier) in canonical_interfaces.INTERFACES.items():
        if entry in roles:
            role, _, reference = roles[entry]
            roles[entry] = (role, carrier, reference)
    for entry, helper in canonical_helpers.items():
        end = int(helper['end_exclusive'], 16)
        require(hashlib.sha256(raw(entry, end-entry)).hexdigest() == helper['sha256'], 'Canonical helper bytes differ')
    failure_wrappers = []
    for entry, expected_hash, role, carrier, message_address, prefix in [
        (0x145eb709b, '22150ec27dcc556fcae119b55d6273dfc972b6fc10abe15e2e43e6e5cfc0fd84', 'removal_index_failure_wrapper', 'r8', 0x1473cc800, b'\x12removal index'),
        (0x145eb7014, '01f57e761d243dd32b839910ba80efd5ca4279257810d76e0696d1e678c51c16', 'insertion_index_failure_wrapper', 'r8', 0x1473cc780, b'\x14insertion index'),
        (0x145eb7660, 'a8500c28636628c900792842e57c4cd64dc6534ed3ffa4bd3bd56847ff0e159e', 'remainder_zero_failure_wrapper', 'rcx', 0x1473cf5a9, b'attempt to calculate the remainder with a divisor of zero')]:
        end = ends[entry]
        data = raw(entry, end-entry)
        require(hashlib.sha256(data).hexdigest() == expected_hash and raw(message_address, len(prefix)) == prefix, 'Current failure-wrapper bytes/message differ')
        code = list(decoder.disasm(data, entry))
        calls = [i for i in code if i.group(capstone.CS_GRP_CALL)]
        require(len(calls) == 1 and calls[0].operands[0].type == X86_OP_IMM and calls[0].operands[0].imm == 0x145eb7540, 'Failure wrapper does not reach canonical formatted failure')
        if carrier == 'rcx':
            require(any(i.bytes.hex() == '4989c8' for i in code), 'Failure wrapper Location forwarding differs')
        else:
            require(all('r8' not in [i.reg_name(r) for r in i.regs_access()[1]] for i in code if i.address < calls[0].address), 'Failure wrapper clobbers incoming Location')
        wrapper = dict(entry=hex(entry), end_exclusive=hex(end), sha256=expected_hash, role=role,
                       location_argument=carrier, canonical_failure='q41-custom-diagnostics.json#helpers:0x145eb7540',
                       first_call=hex(calls[0].address), message_prefix=dict(address=hex(message_address), bytes_hex=prefix.hex()),
                       complete_format_descriptor_semantics=False)
        failure_wrappers.append(wrapper)
        canonical_helpers[entry] = wrapper
        roles[entry] = (role, carrier, 'owned-custom-diagnostics.json#failure_wrappers:'+hex(entry))
    support = supporting_interfaces(raw, decoder, ends, ownership.canonical_register, engine)
    for entry, helper in support.items():
        roles[entry] = (helper['role'], helper['location_argument'], 'owned-custom-diagnostics.json#supporting_interfaces:'+hex(entry))
    nested_support = []
    for entry, expected_hash, expected in [
        (0x145cbddd0, '7f11e616ceb7d24d31678dd839e037400ce93d3325ef4431b875bc90ecef86b0',
         [('cmp','r8, 0x11'),('mov','rsi, qword ptr [rsi - 8]')]),
        (0x1400072f0, '9b0eec85c60d31f6f2a8ba441e0e88ff18209f712273674f0dedc773185939f6',
         [('mov','rdx, qword ptr [rcx]'),('call','0x1400021d0'),('call','0x140007470'),('jmp','0x1400021d0')]),
        (0x1458580a0, '5a5d864ed58a6b0fa8aae6a28ce4761234f001673c0bafe87e18f25fda8860c8',
         [('mov','byte ptr [rax + rdi], 0x2c'),('call','0x14585a6f0'),('mov','byte ptr [rax + rdi], 0x3a')]),
        (0x14585a6f0, '6051f86f65d335ed6482b741acf7359894e5ae4e82eaf0a0d1b12c0e74dcff3e',
         [('mov','rdi, r8'),('mov','rbx, rdx'),('mov','byte ptr [rax], 0x22'),('mov','word ptr [rax + rdx], 0x225c'),('mov','byte ptr [rax + rdi], 0x22')]),
        (0x140f0b870, 'c1e380c2b9f89a7a28c6847d3af1467aeb6128e5ae32717c6578950f89c47fb7',
         [('mov','rdi, r9'),('mov','qword ptr [rbp + 0x40], r8'),('mov','rdx, rdi'),('call','0x145d145fb')]),
        (0x140f0d870, '122d6d774ff17ab5f8df6c22cf4d1c54790a440b9a79d7abeed306c93e37d948',
         [('mov','r14, r9'),('mov','rdi, qword ptr [rbp + 0x100]'),('mov','rcx, r14'),('mov','rdx, rdi'),('call','0x1401edaa0')])]:
        data = raw(entry, ends[entry]-entry)
        require(hashlib.sha256(data).hexdigest() == expected_hash, 'Nested supporting body differs')
        code = list(decoder.disasm(data, entry))
        actual = [(i.mnemonic,i.op_str) for i in code]
        require(all(pair in actual for pair in expected), 'Nested supporting operation differs')
        nested_support.append(dict(entry=hex(entry),end_exclusive=hex(ends[entry]),sha256=expected_hash,
                                   instruction_guards=[list(pair) for pair in expected],complete_subsystem_semantics=False))
    heap_imports = {}
    for imp in pe.imports():
        for index, name in enumerate(imp['functions']):
            heap_imports[int(imp['iat_start_address'],16)+8*index] = (imp['library'],name)
    require(heap_imports[0x145eb86c8] == ('kernel32.dll','GetProcessHeap') and heap_imports[0x145eb8720] == ('kernel32.dll','HeapFree'), 'Current heap imports differ')
    nested_support[0]['imports'] = [dict(slot='0x145eb86c8',library='kernel32.dll',name='GetProcessHeap'),dict(slot='0x145eb8720',library='kernel32.dll',name='HeapFree')]
    diagnostic_rows = []
    by_key = defaultdict(list)
    for item in diagnostic['diagnostics']:
        for reference in item['verified_references']:
            key = (item['path'], reference['instruction_address'], reference['kind'], reference['target_address'])
            by_key[key].append(item)
    with gzip.open(project_path(diagnostic_artifact['path']), 'rt') as stream:
        for ordinal, line in enumerate(stream):
            row = json.loads(line)
            key = (row['path'], row['instruction_address'], row['kind'], row['target_address'])
            require(key in by_key, 'Residual diagnostic is not in owning inventory')
            row['_residual_ordinal'] = ordinal
            row['_custom_game_crate'] = by_key[key][0]['custom_game_crate']
            diagnostic_rows.append(row)
    selected = [r for r in diagnostic_rows if r['context'] == 'AS-custom-path' and r['actual_body_owner']]
    excluded = [r for r in diagnostic_rows if r['context'] == 'excluded-coop-path' and r['actual_body_owner']]
    require(len(selected) == 618 and len(excluded) == 92, 'Owned diagnostic selector differs')
    all_custom = [r for r in diagnostic_rows if r['_custom_game_crate']]
    require(len(all_custom) == 788, 'All-custom D01 selector differs')
    require(sum(r['_custom_game_crate'] for r in excluded) == 57, 'Excluded custom/shared split differs')
    extent_instructions = {}
    declared = {}
    used_helpers = {}
    def instructions(row):
        start = int(row['runtime_function_start'], 16)
        end = int(row['runtime_function_end'], 16)
        require(ends[start] == end, 'Declared diagnostic interval differs')
        if start not in extent_instructions:
            data = raw(start, end-start)
            require(hashlib.sha256(data).hexdigest() == row['owner_sha256'], 'Declared diagnostic bytes differ')
            decoded = list(decoder.disasm(data, start))
            require(sum(i.size for i in decoded) == len(data), 'Declared diagnostic interval does not decode exactly')
            extent_instructions[start] = {i.address: i for i in decoded}
            declared[hex(start)] = dict(end_exclusive=hex(end), sha256=row['owner_sha256'])
        return extent_instructions[start]
    def helper_identity(entry):
        key = hex(entry)
        if key not in used_helpers:
            record = dict(entry=key, observed_body_owner=hex(owner(entry)) if owner(entry) is not None else None)
            if entry in support:
                helper = support[entry]
                record.update(end_exclusive=helper['end_exclusive'], byte_count=helper['byte_count'], sha256=helper['sha256'], supporting_identity=roles[entry][2])
            elif entry in canonical_helpers:
                helper = canonical_helpers[entry]
                record.update(end_exclusive=helper['end_exclusive'], sha256=helper['sha256'], canonical_identity=roles[entry][2])
            else:
                end = ends.get(entry)
                count = end-entry if end is not None else 16
                record.update(end_exclusive=hex(end) if end is not None else None,
                              byte_count=count, sha256=hashlib.sha256(raw(entry, count)).hexdigest(),
                              identity_is_source_semantics=False)
            used_helpers[key] = record
        return key
    def decode_one(address, local):
        if address in local:
            return local[address]
        decoded = list(decoder.disasm(raw(address, 15), address, count=1))
        require(len(decoded) == 1, 'Encoded local successor does not decode')
        return decoded[0]
    role_counts, stop_counts, path_counts = Counter(), Counter(), Counter()
    continued_call_sites, continued_pointer_sites = set(), set()
    unresolved_sites = 0
    branching_sites = 0
    output = proof_path.parent if args.stage else project_path(load_json(proof_path)['artifacts']['owned_AS']['path']).parent
    output.mkdir(parents=True, exist_ok=True)
    row_path = output/'owned-custom-first-interfaces.jsonl.gz'
    selection_projection = []
    with derived_gzip_text(row_path, publish=args.stage) as stream:
        for row in selected:
            site = int(row['instruction_address'], 16)
            require(hex(owner(site)) == row['actual_body_owner'], 'Saved diagnostic body owner differs')
            local = instructions(row)
            first = local[site]
            require(first.bytes.hex() == row['instruction_bytes'] and first.mnemonic == 'lea', 'Selected diagnostic LEA differs')
            require(first.operands[1].type == X86_OP_MEM and first.operands[1].mem.base == X86_REG_RIP, 'Selected operand is not RIP-relative')
            require(first.address+first.size+first.operands[1].mem.disp == int(row['target_address'], 16), 'Selected diagnostic data target differs')
            data_contract = dict(kind=row['kind'], target=row['target_address'], filename_address=row['path_address'])
            if row['kind'] == 'rust_location':
                pointer, length, line, column = struct.unpack('<QQII', raw(int(row['target_address'], 16), 24))
                require(pointer == int(row['path_address'], 16) and raw(pointer, length).decode() == row['path'].replace('/', '\\'), 'Rust Location filename differs')
                require((line, column) == (row['source_line'], row['source_column']), 'Rust Location coordinates differ')
                data_contract.update(filename_bytes=length, line=line, column=column)
            else:
                filename = row['path'].replace('/', '\\').encode()
                require(raw(int(row['path_address'], 16), len(filename)) == filename, 'Candidate filename bytes differ')
                distance = int(row['path_address'], 16)-int(row['target_address'], 16)
                data_contract.update(filename_consumption_proven=False,
                                     bytes_before_filename=distance if 0 < distance <= 256 else None,
                                     preceding_bytes_hex=raw(int(row['target_address'], 16), distance).hex() if 0 < distance <= 256 else None,
                                     literal_extent_and_consumer_state_complete=False)
            pending = [(site, [], [], set(), {})]
            leaves = []
            while pending:
                address, flow, guards, seen, continued = pending.pop()
                if len(leaves)+len(pending) >= LIMITS['paths_per_site']:
                    boundary, current = 'finite_path_bound', None
                elif address in seen:
                    boundary, current = 'local_cycle', None
                elif len(flow) >= LIMITS['instructions_per_path']:
                    boundary, current = 'finite_instruction_bound', None
                else:
                    current = decode_one(address, local)
                    flow = flow+[current]
                    seen = seen | {address}
                    if current.group(capstone.CS_GRP_CALL):
                        boundary = 'direct_call' if current.operands[0].type == X86_OP_IMM else 'dynamic_call'
                        if boundary == 'direct_call':
                            callee = current.operands[0].imm
                            projection = pointer_projection(flow, ownership.canonical_register, capstone, continued)
                            helper = support.get(callee)
                            supplied = set(projection['exact_argument_carriers'])
                            preserved = set(projection['retained_registers']) & SAVED_GPRS
                            # Only continue when an exact callee-saved register
                            # copy survives and no selected local aggregate can
                            # be passed by an untracked address alias.
                            if helper and helper.get('returns_normally', True) and not supplied.intersection(helper['meaningful_input_arguments']) and preserved and not projection['live_local_pointer_locations']:
                                seam = dict(site=hex(current.address), bytes=current.bytes.hex(), callee=helper_identity(callee),
                                            role=helper['role'], selected_pointer=projection,
                                            selected_argument_consumed=False, continued_callee_saved_copies=sorted(preserved),
                                            volatile_pointer_copies_retained=False)
                                after = dict(continued); after[current.address] = seam
                                continued_call_sites.add(current.address); continued_pointer_sites.add(site)
                                pending.append((current.address+current.size, flow, guards, seen, after))
                                continue
                    elif current.group(capstone.CS_GRP_JUMP):
                        if current.operands[0].type != X86_OP_IMM:
                            boundary = 'dynamic_jump'
                        elif current.mnemonic == 'jmp':
                            pending.append((current.operands[0].imm, flow, guards, seen, continued))
                            continue
                        elif len(guards) >= LIMITS['conditional_guards_per_path']:
                            boundary = 'finite_guard_bound'
                        else:
                            destination = current.operands[0].imm
                            following = current.address+current.size
                            for taken, next_address in ((False, following), (True, destination)):
                                guard = dict(site=hex(current.address), bytes=current.bytes.hex(), condition=current.mnemonic,
                                             taken=taken, encoded_target=hex(destination), fallthrough=hex(following),
                                             runtime_condition_value_established=False)
                                pending.append((next_address, flow, guards+[guard], seen, continued))
                            continue
                    elif current.group(capstone.CS_GRP_RET):
                        boundary = 'return'
                    elif current.mnemonic in ('int3', 'ud2', 'hlt') or current.group(capstone.CS_GRP_INT):
                        boundary = 'trap_or_interrupt'
                    else:
                        # Include the current instruction in pointer-state
                        # propagation; the appended sentinel is excluded by
                        # pointer_projection's first-interface convention.
                        state = pointer_projection(flow+[current], ownership.canonical_register, capstone, continued)
                        if state['opaque_pointer_use'] or state['unresolved_memory_alias']:
                            boundary = 'opaque_pointer_or_alias_use'
                        elif not state['retained_registers'] and not state['live_local_pointer_locations']:
                            boundary = 'selected_pointer_discarded'
                        else:
                            pending.append((current.address+current.size, flow, guards, seen, continued))
                            continue
                stop_counts[boundary] += 1
                projection = pointer_projection(flow+[current], ownership.canonical_register, capstone, continued) if boundary in ('opaque_pointer_or_alias_use', 'selected_pointer_discarded') else pointer_projection(flow, ownership.canonical_register, capstone, continued)
                leaf = dict(boundary=boundary, boundary_address=hex(address), guards=guards,
                            flow_instruction_count=len(flow), flow_address_and_bytes_sha256=hashlib.sha256(b''.join(struct.pack('<Q', i.address)+bytes(i.bytes) for i in flow)).hexdigest(),
                            selected_pointer=projection, supporting_calls_before_boundary=list(continued.values()),
                            role='unestablished', complete_native_semantics=False)
                if current is not None:
                    leaf.update(boundary_instruction_bytes=current.bytes.hex(), boundary_instruction=current.mnemonic+' '+current.op_str)
                if boundary == 'direct_call':
                    callee = current.operands[0].imm
                    leaf['callee'] = helper_identity(callee)
                    if callee in roles:
                        role, carrier, reference = roles[callee]
                        leaf.update(role=role, canonical_helper=reference)
                        if callee in support:
                            helper = support[callee]
                            supplied = set(projection['exact_argument_carriers'])
                            consumed = sorted(supplied.intersection(helper['meaningful_input_arguments']))
                            leaf.update(supporting_operation_known=True, selected_consumed_argument_carriers=consumed,
                                        selected_pointer_contract=helper['selected_pointer_contract'],
                                        pointer_only_retained_outside_arguments=not supplied and bool(projection['retained_registers']),
                                        concrete_subsystem_type_complete=False)
                            if not consumed and not projection['live_local_pointer_locations']:
                                leaf['selected_argument_consumed'] = False
                                leaf['nonconsumption_boundary'] = 'The selected pointer is absent from the helper meaningful inputs. Volatile register contents after this call are not inferred; no exact preserved local copy remains to follow.'
                            literal_inputs = {0x142a769a0: ('rcx','rdx'), 0x1458dfee0: ('rcx','rdx'),
                                              0x14584f0c0: ('r8','r9'), 0x145858350: ('stack+0x20','stack+0x28'),
                                              0x140034830: ('r9','stack+0x20'), 0x1405cd330: ('r9','stack+0x20'),
                                              0x1405d0df0: ('r9','stack+0x20')}
                            if row['kind'] == 'path_literal' and callee in literal_inputs:
                                pointer_arg, length_arg = literal_inputs[callee]
                                if pointer_arg in consumed:
                                    length = literal_length(flow, local, length_arg, ownership.canonical_register, capstone)
                                    if length is not None and 0 <= length <= 256:
                                        literal = int(row['target_address'],16)
                                        filename = int(row['path_address'],16)
                                        leaf['bounded_literal_input'] = dict(pointer_argument=pointer_arg, length_argument=length_arg,
                                            byte_count=length, bytes_hex=raw(literal,length).hex(),
                                            filename_bytes_overlap=literal < filename+len(row['path']) and filename < literal+length,
                                            length_from_selected_or_immediate_straight_line_flow=True)
                            if callee == 0x1400e72a0:
                                require(any(i.mnemonic == 'lea' and i.op_str == 'rdx, [rbp + 0x360]' for i in flow), 'Range tuple argument differs')
                                require(dict(base='rbp', displacement=0x368) in projection['live_local_pointer_locations'], 'Range end pointer store differs')
                                leaf['selected_aggregate_consumer'] = helper['aggregate_selected_pointer']
                                leaf['filename_text_consumed'] = False
                        if row['kind'] == 'rust_location' and carrier is not None:
                            leaf['location_argument_carrier_proven'] = carrier in projection['exact_argument_carriers']
                            if not leaf['location_argument_carrier_proven']:
                                leaf['missing_proof'] = 'The canonical helper Location carrier '+carrier+' is not established by exact local pointer copies; aggregate/alias state must be recovered.'
                    else:
                        leaf.update(role='direct_interface_with_unestablished_state_or_type',
                                    missing_proof='First call '+hex(callee)+' receives the recorded arguments/stores. Its concrete data type, alias lifetime and successful state transition are not established at this immediate boundary; shared wrapper context is not a new AS mechanic.')
                elif boundary == 'selected_pointer_discarded':
                    leaf.update(role='selected_pointer_unused_on_this_guarded_path',
                                boundary_contract='All exact selected-pointer register/local-memory copies are overwritten before a call or opaque use; this guarded path does not deliver this diagnostic operand.')
                elif boundary == 'opaque_pointer_or_alias_use' and projection['opaque_pointer_use'] and projection['opaque_pointer_use'].get('exact_origin_memory_read'):
                    memory_read = projection['opaque_pointer_use']['exact_origin_memory_read']
                    read_address = int(row['target_address'], 16)+memory_read['displacement']
                    section = next((s for s in pe.sections if pe.image_base+s['rva'] <= read_address and read_address+memory_read['width_bytes'] <= pe.image_base+s['rva']+s['virtual_size']), None)
                    immutable = section is not None and not(int(section['characteristics'], 16) & 0x80000000)
                    filename_start = int(row['path_address'], 16)
                    filename_end = filename_start+len(row['path'].replace('/', '\\').encode())
                    leaf.update(role='selected_immutable_data_read' if immutable else 'selected_mutable_data_read_requires_live_state',
                                exact_data_read=dict(address=hex(read_address), width_bytes=memory_read['width_bytes'],
                                                     initial_file_bytes=raw(read_address, memory_read['width_bytes']).hex(), immutable_PE_section=immutable,
                                                     filename_bytes_overlap=read_address < filename_end and filename_start < read_address+memory_read['width_bytes']),
                                missing_proof='The exact first data read is established. Later interpretation/arithmetic/source equivalence is outside this immediate boundary; a mutable section additionally requires its live contents.')
                else:
                    leaf['missing_proof'] = {'dynamic_call':'The computed call operand requires live register/object/slot state to identify its target.',
                                             'dynamic_jump':'The computed successor requires live register/object/table state to identify its destination.',
                                             'local_cycle':'The exact guarded local cycle requires live state to determine when or whether a first call is reached.',
                                             'return':'This path returns before a first call; selected pointer delivery to an outer consumer is not established.',
                                             'trap_or_interrupt':'This path terminates at a native trap/interrupt before a first consumer.',
                                             'finite_path_bound':'The explicit finite path bound was reached; pending encoded successors remain retained as a bounded stop.',
                                             'finite_instruction_bound':'The explicit finite instruction bound was reached before a first call.',
                                             'finite_guard_bound':'The explicit finite conditional-guard bound was reached; neither successor is silently classified.',
                                             'opaque_pointer_or_alias_use':'The selected pointer reaches the recorded non-copy operand use or memory/base alias boundary before a first call. Its concrete data/aggregate type and subsequent consumer require separate proof.'}[boundary]
                role_counts[leaf['role']] += 1
                leaves.append(leaf)
            path_counts[row['path']] += 1
            branching_sites += any(leaf['guards'] for leaf in leaves)
            unresolved_sites += any(leaf['role'] in ('unestablished', 'direct_interface_with_unestablished_state_or_type', 'selected_mutable_data_read_requires_live_state') or leaf.get('location_argument_carrier_proven') is False for leaf in leaves)
            record = dict(residual_ordinal=row['_residual_ordinal'], path=row['path'], site=row['instruction_address'],
                          actual_body_owner=row['actual_body_owner'], declared_extent=[row['runtime_function_start'], row['runtime_function_end']],
                          declared_extent_sha256=row['owner_sha256'], data_contract=data_contract,
                          first_interface_paths=leaves, both_conditional_successors_followed=True,
                          selected_first_interfaces_are_source_semantics=False, parity_verified=False)
            stream.write(json.dumps(record, separators=(',', ':'))+'\n')
            selection_projection.append([record['residual_ordinal'], record['path'], record['site'], row['target_address'], row['kind']])
    excluded_projection = []
    for row in excluded:
        site = int(row['instruction_address'], 16)
        require('/coop/' in row['path'] or row['path'].endswith('/party.rs'), 'Excluded path context differs')
        require(hex(owner(site)) == row['actual_body_owner'], 'Excluded saved owner differs')
        require(raw(site, len(bytes.fromhex(row['instruction_bytes']))).hex() == row['instruction_bytes'], 'Excluded instruction bytes differ')
        excluded_projection.append(dict(residual_ordinal=row['_residual_ordinal'], path=row['path'], site=row['instruction_address'],
                                        actual_body_owner=row['actual_body_owner'], custom_game_crate=row['_custom_game_crate'],
                                        context='excluded-coop-path', gameplay_recovered=False))
    excluded_path = output/'owned-excluded-coop-context.jsonl.gz'
    with derived_gzip_text(excluded_path, publish=args.stage) as stream:
        for row in excluded_projection:
            stream.write(json.dumps(row, separators=(',', ':'))+'\n')
    record = dict(schema_version=1, target=identity, lead='Q41-D01', gap_ids=[41],
                  generator=dict(path=GENERATOR, sha256=GENERATOR_SHA256, capstone_version=capstone.__version__),
                  dependencies=dependencies, inputs=inputs, canonical_ownerless_proof=ownerless_binding, canonical_engine_proof=engine_binding,
                  selector='Every AS-custom-path verified diagnostic reference with a saved actual body owner; excluded owned co-op context retained separately.',
                  counts=dict(owned_AS_sites=len(selected), owned_AS_rust_locations=576, owned_AS_path_literals=42,
                              owned_AS_paths=len(path_counts), owned_excluded_context_sites=len(excluded), owned_excluded_custom_sites=57,
                              owned_excluded_noncustom_sites=35, all_custom_D01_sites=788, AS_D01_sites=725,
                              excluded_custom_D01_sites=63, ownerless_AS_sites=107, ownerless_excluded_custom_sites=6,
                              branching_owned_AS_sites=branching_sites, owned_AS_sites_with_unresolved_boundary=unresolved_sites,
                              owned_AS_sites_with_only_classified_boundaries=len(selected)-unresolved_sites,
                              initial_reviewed_fixed_callees=46, reviewed_supporting_fixed_callees=len(support), continued_nonconsuming_call_sites=len(continued_call_sites),
                              sites_followed_past_nonconsuming_support=len(continued_pointer_sites),
                              first_interface_paths=sum(role_counts.values()), first_interface_roles=dict(sorted(role_counts.items())),
                              first_interface_boundaries=dict(sorted(stop_counts.items())), paths=dict(sorted(path_counts.items()))),
                  finite_bounds=LIMITS, selection_digest=hashlib.sha256(packed(selection_projection)).hexdigest(),
                  artifacts=dict(owned_AS=dict(path=row_path.relative_to(ROOT).as_posix(), sha256=file_sha256(row_path), rows=len(selected)),
                                 excluded_context=dict(path=excluded_path.relative_to(ROOT).as_posix(), sha256=file_sha256(excluded_path), rows=len(excluded))),
                  declared_extents=declared, first_helpers=used_helpers, failure_wrappers=failure_wrappers,
                  supporting_interfaces=[support[a] for a in sorted(support)], nested_supporting_guards=nested_support, static_checks=static_checks,
                  both_conditional_successors_followed=True, classification_boundary_complete=True,
                  native_semantics_complete=False, source_semantics_complete=False, global_aliasing_complete=False,
                  source_implementation_added=False, parity_verified=False,
                  existing_scoped_consumers=['docs/analysis/addon-timers-0.115.0.md', 'docs/analysis/evidence/0.115.0/banners-owner.json',
                                            'docs/analysis/raid-targets-0.115.0.md', 'docs/analysis/raid-death-0.115.0.md'],
                  limits=['Every selected source row and every bounded local first-interface path is retained; duplicate source records are not collapsed.',
                          'Conditional branches retain both encoded successors and exact guards; the executed choice is not observed.',
                          'Canonical failure/container/formatter identities are reused. The finite fixed supporting helpers have current-byte roles and pointer contracts; concrete subsystem types and computed exits remain unresolved.',
                          'Rust Location pointers and local pointer copies do not establish successful AS mechanics or complete source ownership. Adjacent path literals are not silently treated as consumed filenames.',
                          'The 92 owned excluded-context rows include 57 custom and 35 noncustom sites. Only the 57 custom rows belong to the actual all-custom D01 selector.',
                          'No generic engine reconstruction, source changes, application compilation/game/network/server/co-op execution, new Ghidra session or original/rebuilt parity.'])
    for binding in inputs+dependencies+[dict(path=GENERATOR, sha256=GENERATOR_SHA256)]:
        require(file_sha256(project_path(binding['path'])) == binding['sha256'], 'Input/generator changed during classification')
    if args.stage:
        require(not proof_path.exists(), 'Preserve prior proposed proof; choose a new path')
        proof_path.parent.mkdir(parents=True, exist_ok=True)
        proof_path.write_text(proof_text(record)+'\n')
    else:
        require(load_json(proof_path) == record, 'Retained owned-custom first-interface proof differs')
    print(json_text(record['counts']))


if __name__ == '__main__':
    main()

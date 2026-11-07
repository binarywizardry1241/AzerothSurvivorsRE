#!/usr/bin/env python3
"""Replay native template-query entry readers without compiling or running a client.

Only the original opcode dispatch and prefix readers execute in Unicorn. The
probe stops before item/catalog lookup, allocation, serialization or delivery.
Source guards check the live co-op routes; they do not execute reconstructed Rust.
"""
from runtime_layout import retained_runtime_path
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import re

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script
from equipment_native import EquipmentProbe
import unicorn

SHA = '80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c'
OWNER = (0x145b01eb0, 0x145b04a8a)
CASES = {0x56: (0x145b02908, 'RDI'), 0x5e: (0x145b02ac8, 'R14'),
         0x60: (0x145b02b69, 'R14')}
KEEP = ROOT / 'docs/analysis/evidence/0.120.2/template-query-input/static-check.json'
SOURCE = 'crates/azeroth-survivors-re/src/gameplay/coop_commands.rs'


def verify_query():
    manifest = json.loads((KEEP.parent / 'manifest.json').read_text())
    query = manifest['query']
    for name in ('plan', 'journal', 'result'):
        record = query[name]
        assert file_sha256(retained_runtime_path(ROOT / record['path'], ROOT)) == record['sha256'], name
    native = json.loads((ROOT / query['result']['path']).read_text())['structuredContent']
    assert native['provider']['id'] == 'ghidra'
    assert native['subject']['digest']['sha256'] == SHA
    assert native['parameters']['procedure'] == hex(OWNER[0])
    assert native['evidence_id'] == query['evidence_id']
    assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_sha256']
    journal = json.loads((ROOT / query['journal']['path']).read_text())
    assert journal['status'] == 'completed'
    rows = [row for row in journal['operations'].values()
            if row['name'] == 'procedure_pseudo_code']
    assert len(rows) == 1 and rows[0]['status'] == 'completed'
    assert rows[0]['arguments'] == {'procedure': hex(OWNER[0])}
    assert rows[0]['result'] == query['result']
    source = manifest['source_connection']
    assert source['path'] == SOURCE and file_sha256(ROOT / SOURCE) == source['sha256']
    return query['evidence_id']


class Probe(EquipmentProbe):
    def __init__(self, image, pe):
        self.steps = 0
        self.executed = set()
        super().__init__(image, pe, [OWNER])

    def hook(self, uc, pc, size, unused):
        if pc == self.stop:
            self.native.emu_stop()
            return
        if not OWNER[0] <= pc < pc + size <= OWNER[1]:
            raise ValueError('Reader left its exact original owner: ' + hex(pc))
        self.steps += 1
        self.executed.add(pc)

    def read(self, opcode, body):
        self.cursor = self.HEAP + 0x1000
        pointer = self.alloc(max(4, len(body)))
        if body:
            self.native.mem_write(pointer, body)
        sp = self.STACK + 0x1f0008
        self.put(sp, self.DONE)
        self.put(sp + 40, pointer, len(body))
        for name, value in [('RSP', sp), ('RCX', self.HEAP), ('RDX', 0),
                            ('R8', 0), ('R9', opcode), ('MXCSR', 0x1f80)]:
            self.reg(name, value)
        self.stop, output = CASES[opcode]
        self.native.emu_start(OWNER[0], self.DONE, count=1000)
        assert self.reg('RIP') == self.stop
        return self.reg(output) & 0xffffffff


def source_guards():
    text = (ROOT / SOURCE).read_text()
    helper = text[text.index('fn template_entry('):text.index('fn u64_at(')]
    assert 'let mut bytes = [0; 4];' in helper
    assert 'bytes.iter_mut().zip(body)' in helper
    assert '*to = *from;' in helper and 'u32::from_le_bytes(bytes)' in helper
    routes = {}
    for name in ('CREATURE_QUERY', 'GAMEOBJECT_QUERY', 'ITEM_QUERY_SINGLE'):
        body = re.search(r'opcode::CMSG_' + name + r' => \{(.*?)(?=\n            opcode::)',
                         text, re.S)[1]
        assert 'let entry = template_entry(&packet.payload);' in body
        assert 'u32_at(' not in body and 'replies.push(' in body
        routes[name] = hashlib.sha256(body.encode()).hexdigest()
    wire = (ROOT / 'crates/azeroth-survivors-re/src/coop/server_party.rs').read_text()
    assert '7 => LifecyclePacket::EngineCommand { opcode: reader.u16()?, payload: reader.bytes()? }' in wire
    receive = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop.rs').read_text()
    assert '.push((client, EnginePacket { opcode, payload }));' in receive
    assert 'for (client, packet) in std::mem::take(&mut state.commands)' in text
    assert 'for event in replies' in text
    return dict(helper_sha256=hashlib.sha256(helper.encode()).hexdigest(), routes=routes)


def collect():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    query_id = verify_query()
    image = target_bytes(target)
    pe = load_script('template_input_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    assert OWNER in [(pe.image_base + first, pe.image_base + last)
                     for first, last, _ in pe.functions()]
    probe = Probe(image, pe)
    payloads = {b'', b'\x29\x23', b'\xff' * 8, b'\x29\x23\x04\x80\xff\xff'}
    for length in range(9):
        for lane in range(4):
            for value in range(256):
                body = bytearray([0x29, 0x23, 0x04, 0x80, 0xe1, 0xe2, 0xe3, 0xe4][:length])
                if lane < length:
                    body[lane] = value
                payloads.add(bytes(body))
    result_digest, count = hashlib.sha256(), 0
    for opcode in CASES:
        for body in sorted(payloads, key=lambda value: (len(value), value)):
            expected = int.from_bytes(body[:4].ljust(4, b'\0'), 'little')
            actual = probe.read(opcode, body)
            assert actual == expected, (opcode, body.hex(), actual, expected)
            result_digest.update(opcode.to_bytes(2, 'little') + bytes([len(body)]) + body
                                 + actual.to_bytes(4, 'little'))
            count += 1
    offset = pe.rva_offset(OWNER[0] - pe.image_base)
    native = dict(virtual_address=hex(OWNER[0]), end_exclusive=hex(OWNER[1]),
                  file_offset=hex(offset), byte_count=OWNER[1] - OWNER[0],
                  sha256=hashlib.sha256(image[offset:offset + OWNER[1] - OWNER[0]]).hexdigest())
    return dict(schema_version=1,
                target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                finding_ids=[41, 64, 65, 201],
                native_owner=native, readers={hex(k): dict(stop=hex(v[0]), output_register=v[1])
                                             for k, v in CASES.items()},
                original_instruction_cases=count, distinct_payloads=len(payloads),
                original_instructions_executed=probe.steps,
                distinct_executed_instructions=len(probe.executed),
                result_sha256=result_digest.hexdigest(), source=source_guards(),
                query_evidence_id=query_id,
                generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(),
                               sha256=file_sha256(Path(__file__))),
                dependencies=[dict(path=path, sha256=file_sha256(ROOT / path)) for path in
                              ('scripts/equipment_native.py', 'scripts/inventory-executable.py',
                               'scripts/coverage_common.py', 'scripts/script_sources.py')],
                emulator=dict(name='Unicorn', version=unicorn.__version__),
                limits=['Original opcode dispatch and bounded prefix readers only; no catalog or network execution.',
                        'Source guards do not execute or compile Rust. Authored Rust regression is unrun.',
                        'No client/server/game execution or original/rebuilt parity comparison.'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    result = collect()
    if args.write:
        KEEP.parent.mkdir(parents=True, exist_ok=True)
        KEEP.write_text(portable_json(result, indent=2) + '\n')
    else:
        assert portable_record(result) == portable_record(json.loads(KEEP.read_text())), 'Curated input-reader proof differs'
        manifest = json.loads((KEEP.parent / 'manifest.json').read_text())
        assert file_sha256(KEEP) == manifest['static_check']['sha256']
    print(json.dumps({key: result[key] for key in ('original_instruction_cases',
                      'original_instructions_executed', 'distinct_executed_instructions')}))

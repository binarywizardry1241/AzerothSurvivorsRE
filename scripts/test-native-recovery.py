#!/usr/bin/env python3
"""Compare shared fixture mechanics with their exact retained source models."""
import ast
from hashlib import sha256
from pathlib import Path
import struct
import subprocess
from types import SimpleNamespace
import unittest

import native_recovery as shared

ROOT = Path(__file__).resolve().parents[1]
COMMIT = '47c9f68d25834d2265e6a2e0548a3592e66d8d32'


def recorded_function(path, name, namespace):
    raw = subprocess.check_output(['git', 'cat-file', 'blob', COMMIT + ':' + path], cwd=ROOT)
    node = next(n for n in ast.parse(raw).body if isinstance(n, ast.FunctionDef) and n.name == name)
    module = ast.Module(body=[node], type_ignores=[])
    exec(compile(module, path, 'exec'), namespace)
    return namespace[name]


class Machine:
    def __init__(self):
        self.trace = []

    def mem_write(self, address, data):
        self.trace.append(('memory', address, len(data), sha256(data).hexdigest()))

    def reg_write(self, register, value):
        self.trace.append(('register', register, value))


class NativeRecovery(unittest.TestCase):
    def test_float32_rounding_bit_patterns_and_overflow_match_recorded_model(self):
        namespace = dict(struct=struct)
        original = recorded_function('scripts/check-xinput-0.112.0.py', 'f32', namespace)
        old_bits = recorded_function('scripts/check-xinput-0.112.0.py', 'bits', namespace)
        for value in [0., -0., 1., -1., 1 / 3, 2**24 + 1, 1e-40, float('inf'), -float('inf'), float('nan')]:
            with self.subTest(value=value):
                self.assertEqual(struct.pack('<f', shared.f32(value)), struct.pack('<f', original(value)))
                self.assertEqual(shared.bits(value), old_bits(value))
        for operation in [shared.f32, shared.bits, original, old_bits]:
            with self.assertRaises(OverflowError):
                operation(1e100)

    def test_byte_digests_keep_the_original_input_contract(self):
        self.assertEqual(shared.digest(b''), sha256(b'').hexdigest())
        self.assertEqual(shared.digest(bytes(range(256))), sha256(bytes(range(256))).hexdigest())
        with self.assertRaises(TypeError):
            shared.digest('text needs explicit encoding')

    def test_expression_literals_nested_templates_and_concatenation(self):
        original = recorded_function('scripts/extract-menu-ability-tooltips.py', 'expression', {})
        pieces = [('7', {'template': 'number', 'values': {}}),
                  ('Hit 7', {'template': 'damage', 'values': {'amount': '7'}})]
        for text in ['', 'plain text', '7', 'Hit 7', 'Hit 7 / Hit 7', 'before Hit 7 after']:
            with self.subTest(text=text):
                self.assertEqual(shared.expression(text, pieces), original(text, pieces))

    def test_passive_stat_and_spell_effect_records_keep_exact_decoding(self):
        rows = [bytearray(64) for _ in range(3)]
        rows[0][0] = 12
        rows[1][0], rows[1][8] = 30, 3
        struct.pack_into('<I', rows[1], 4, 0x3fc00000)
        rows[2][0], rows[2][8], rows[2][36] = 31, 1, 6
        struct.pack_into('<QQ', rows[2], 16, 0x1200, 4)
        struct.pack_into('<I', rows[2], 32, 0x40000000)
        def read(address, count):
            return bytes(rows[(address - 0x8000) // 64][:count])
        def text(address, count):
            return 'fire' if (address, count) == (0x1200, 4) else ''
        namespace = dict(struct=struct, u=SimpleNamespace(mem_read=read),
                         p=SimpleNamespace(image_base=0x1000), end=0x2000, text=text)
        original = recorded_function('scripts/recover-amulets-0.100.1.py', 'effects', namespace)
        self.assertEqual(shared.effects(0x8000, 3, read, text, 0x1000, 0x2000), original(0x8000, 3))
        self.assertEqual(shared.effects(0x8000, 0, read, text, 0x1000, 0x2000), [])
        for selector, modifier in [(2, 6), (1, 7)]:
            rows[2][8], rows[2][36] = selector, modifier
            with self.assertRaises(AssertionError):
                shared.effects(0x8080, 1, read, text, 0x1000, 0x2000)

    def test_treasure_and_guardian_resets_preserve_full_operation_order(self):
        gprs = ['RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9',
                'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'RSP', 'EFLAGS', 'MXCSR']
        registers = {'UC_X86_REG_' + name: i for i, name in enumerate(gprs)}
        registers.update({'UC_X86_REG_XMM' + str(i): 100 + i for i in range(16)})
        paths = ['scripts/recover-treasure-0972-fixtures.py', 'scripts/recover-treasure-chest-fixtures.py',
                 'scripts/recover-guardian-fixtures.py', 'scripts/check-runmods-guardians-0.109.0.py']
        for path in paths:
            with self.subTest(path=path):
                old, new = Machine(), Machine()
                game, stack, stop = 0x200000000, 0x300000000, 0x400000000
                namespace = dict(registers, uc=old, GAME=game, STACK=stack, STOP=stop,
                                 putq=lambda at, value: old.mem_write(at, struct.pack('<Q', value)))
                recorded_function(path, 'reset', namespace)()
                treasure = 'treasure' in path
                extra = (('RBP', stack + 0x10000), ('R13', game), ('RDI', game), ('RCX', game)) if treasure else ()
                shared.reset_machine(new, registers, game, stack, stop,
                                     game_bytes=0x20000 if treasure else 0x30000,
                                     vector_count=8 if treasure else 16, extra_registers=extra)
                self.assertEqual(new.trace, old.trace)


if __name__ == '__main__':
    unittest.main()

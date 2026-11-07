#!/usr/bin/env python3
"""Replay selected Options file/VM contracts from the installed PE, without builds or I/O adapters."""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
RETAINED = ROOT / 'docs/analysis/evidence/0.112.0/options-vm'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/0.112.0/options-vm'
WORK = ROOT / 'runtime/analysis/history/interface/options-vm/c009572f297f'


class Native:
    def __init__(self, data, pe):
        sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        from unicorn import x86_const
        self.r = x86_const
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        extent = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
        self.u.mem_map(pe.image_base, (extent + 4095) & ~4095)
        for s in pe.sections:
            self.u.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
        self.scratch, self.stack, self.done = 0x200000000, 0x300000000, 0x400000000
        self.u.mem_map(self.scratch, 0x80000)
        self.u.mem_map(self.stack, 0x10000)
        self.u.mem_map(self.done, 0x1000)
        self.bounds = {a + pe.image_base: b + pe.image_base for a, b, _ in pe.functions()}
        self.starts = [0x14056a710, 0x140569e00, 0x140dcd910, 0x140dee8f0,
                       0x1405694b0, 0x14012bc10, 0x140dfd0c0, 0x1405ed1d0,
                       0x140c80970, 0x1400695f0, 0x140069870]
        self.u.hook_add(UC_HOOK_CODE, self.hook)
        self.reset()

    def get(self, name): return self.u.reg_read(getattr(self.r, 'UC_X86_REG_' + name))
    def reg(self, name, value): self.u.reg_write(getattr(self.r, 'UC_X86_REG_' + name), value)
    def put(self, at, fmt, *values): self.u.mem_write(at, struct.pack('<' + fmt, *values))
    def q(self, at): return struct.unpack('<Q', self.u.mem_read(at, 8))[0]
    def raw(self, at, count): return bytes(self.u.mem_read(at, count)) if count else b''
    def text(self, at, count): return self.raw(at, count).decode()
    def slice(self, at): return self.text(self.q(at), self.q(at + 8))
    def string(self, at): return self.text(self.q(at + 8), self.q(at + 16))
    def alloc(self, size):
        at = self.cursor
        self.cursor += (size + 31) & ~15
        assert self.cursor < self.scratch + 0x7f000
        return at
    def owned(self, at, value, capacity=None):
        raw = value.encode() if isinstance(value, str) else value
        capacity = len(raw) if capacity is None else capacity
        pointer = self.alloc(capacity)
        if raw: self.u.mem_write(pointer, raw)
        self.put(at, 'QQQ', capacity, pointer, len(raw))
        return pointer
    def ret(self, value=None):
        if value is not None: self.reg('RAX', value)
        sp = self.get('RSP')
        self.reg('RIP', self.q(sp))
        self.reg('RSP', sp + 8)
    def reset(self, mode='file', **settings):
        self.u.mem_write(self.scratch, bytes(0x80000))
        self.cursor = self.scratch + 0x10000
        self.mode, self.settings, self.trace, self.assignment = mode, settings, [], None
        for name in ('RAX','RBX','RCX','RDX','RSI','RDI','RBP','RSP','R8','R9','R10','R11','R12','R13','R14','R15'):
            self.reg(name, 0)
        self.put(0x14808cfa8, 'Q', self.scratch + 0x100)
        self.put(self.scratch + 0x100, 'Q', 4)  # disable warning formatting, not its error branch
    def call(self, start, args, fifth=None):
        sp = self.stack + 0x8000 - 8
        self.put(sp, 'Q', self.done)
        self.reg('RSP', sp)
        for name, value in zip(('RCX','RDX','R8','R9'), args): self.reg(name, value)
        if fifth is not None: self.put(sp + 0x28, 'Q', fifth)
        try:
            self.u.emu_start(start, self.done, count=100000)
        except Exception as error:
            raise AssertionError((hex(self.get('RIP')),self.trace,self.settings)) from error
        assert self.get('RIP') in (self.done, 0x145830da0), hex(self.get('RIP'))
        return self.get('RAX')

    def hook(self, unused, address, size, context):
        g, q = self.get, self.q
        if address == self.done:
            self.u.emu_stop(); return
        if address == 0x140002200 or address == 0x1400021d0:
            self.ret(); return
        if address in (0x1400021c0, 0x1400021f0):
            self.ret(self.alloc(g('RCX'))); return
        if address == 0x145c0a3db:
            self.u.mem_write(g('RCX'), self.raw(g('RDX'), g('R8')))
            self.ret(g('RCX')); return
        if address == 0x145c0a3e7:
            self.ret(int(self.raw(g('RCX'), g('R8')) != self.raw(g('RDX'), g('R8')))); return
        if address == 0x145be5b60:
            at = self.raw(g('RDX'), g('R8')).find(bytes([g('ECX') & 255]))
            self.reg('RDX', max(at, 0)); self.ret(int(at >= 0)); return
        if address == 0x145bdd5f0:
            self.owned(g('RCX'), self.string(g('RDX'))); self.ret(g('RCX')); return
        if address == 0x145c3ede0 or address == 0x145c0d470:
            vector = g('RCX'); cap, pointer, length = struct.unpack('<QQQ', self.raw(vector, 24))
            element = 24 if address == 0x145c3ede0 else q(g('RSP') + 0x28)
            newcap = max(4, cap * 2, length + 1)
            at = self.alloc(newcap * element)
            self.u.mem_write(at, self.raw(pointer, length * element))
            self.put(vector, 'QQQ', newcap, at, length)
            self.ret(); return
        if address == 0x140cc6950:
            self.trace.append(['home'])
            if self.settings.get('home', True): self.owned(g('RCX'), 'state')
            else: self.put(g('RCX'), 'Q', 0xffffffffffffffff)
            self.ret(g('RCX')); return
        if address == 0x145bb7040:
            base, leaf = self.text(g('RDX'), g('R8')), self.text(g('R9'), q(g('RSP') + 0x28))
            self.trace.append(['join', base, leaf])
            self.owned(g('RCX'), base.rstrip('/') + '/' + leaf)
            self.ret(g('RCX')); return
        if address == 0x145bcd590:
            path = self.text(g('RDX'), g('R8'))
            self.trace.append(['read', path])
            previous = self.settings.get('previous', '')
            if previous is None: self.put(g('RCX'), 'QQ', 0xffffffffffffffff, 2)
            else: self.owned(g('RCX'), previous)
            self.ret(g('RCX')); return
        if address == 0x145bdd130:
            args = g('R8')
            self.assignment = self.slice(q(args)) + ' = ' + self.slice(q(args + 16))
            self.owned(g('RCX'), self.assignment)
            self.ret(g('RCX')); return
        if address == 0x140c8d3e0:
            vector, count = g('RDX'), g('R8')
            separator = self.text(g('R9'), q(g('RSP') + 0x28))
            assert separator == '\n'
            self.owned(g('RCX'), separator.join(self.string(vector + 24 * n) for n in range(count)))
            self.ret(g('RCX')); return
        if address == 0x140cc5fa0:
            self.trace.append(['write', self.text(g('RCX'), g('RDX')), self.text(g('R8'), g('R9'))])
            self.ret(2 if self.settings.get('write_error') else 0); return
        if address == 0x145830da0 and self.mode == 'vm':
            self.u.emu_stop(); return
        if address == 0x140564ca0 and self.mode == 'vm':
            self.trace.append(['vm-borrow'])
            self.ret(); return
        if self.mode == 'caller':
            if address == 0x140569e00:
                self.trace.append(['assign', self.text(g('RDX'), g('R8')),
                                   self.text(g('R9'), q(g('RSP') + 0x28))])
                self.reg('RIP', self.done); self.u.emu_stop(); return
            if address in (0x14012d712, 0x14012d72a, 0x14012d606, 0x14012d632):
                self.trace.append(['missing-client' if address in (0x14012d606, 0x14012d632) else 'inactive'])
                self.reg('RIP', self.done); self.u.emu_stop(); return
            if 0x14012d3be <= address < 0x14012d606: return
        if any(start <= address and address + size <= self.bounds[start] for start in self.starts): return
        raise AssertionError(f'Unreviewed {self.mode} dependency {address:#x}')


def rust_lines(value):
    if not value: return []
    rows = value.split('\n')
    if value.endswith('\n'): rows.pop()
    return [row[:-1] if n + 1 < len(rows) + int(value.endswith('\n')) and row.endswith('\r') else row for n, row in enumerate(rows)]


def rhs(previous, name):
    if previous is None: return None
    for line in rust_lines(previous):
        if line.startswith(name):
            rest = line[len(name):].lstrip(WHITESPACE)
            if rest.startswith('='): return rest[1:].strip(WHITESPACE)
    return None


WHITESPACE = '\t\n\v\f\r \u0085\u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000'
HEADER = "-- benilla saved variables: the UI's own remembered settings."


def compose(previous, name, literal):
    rows = rust_lines(previous or '')
    found = False
    for n, line in enumerate(rows):
        if line.startswith(name) and line[len(name):].lstrip(WHITESPACE).startswith('='):
            rows[n], found = name + ' = ' + literal, True
    if not found:
        if not rows: rows.append(HEADER)
        rows.append(name + ' = ' + literal)
    return '\n'.join(rows) + '\n'


def replay(data, pe):
    n = Native(data, pe); cases = {'read': [], 'store': [], 'vm': [], 'caller': []}
    def compact(value):
        if isinstance(value, str) and len(value) > 160:
            return {'bytes': len(value.encode()), 'sha256': hashlib.sha256(value.encode()).hexdigest()}
        return value
    rows = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/options.json').read_text())['rows']
    values = ['nil','false','FALSE','0','1','', '  "0"  ', '"a\\n"', 'MARK()', '"quoted""', '42suffix', '"' + 'x' * 1200 + '"']
    for index, row in enumerate(rows):
        if row['storage'] not in (1, 2): continue
        name = row['key']
        for literal in values + [None]:
            for layout in (0, 1):
                previous = None if literal is None else (f'{name} = {literal}\n{name} = "second"\n' if layout == 0 else f'{name}_EXTRA = ignored\n {name} = ignored\n{name}\u2003=\u00a0{literal}\u3000\r\n')
                n.reset(previous=previous)
                out = n.scratch + 0x200
                n.call(0x14012bc10, [out, 0, 0x145dc2250 + index * 0x98])
                actual = n.string(out)
                raw_rhs = rhs(previous, name)
                expected = ('1' if raw_rhs not in (None, 'nil', 'false') else '0') if row['storage'] == 2 else (raw_rhs.strip('"') if raw_rhs is not None else row['default'])
                assert actual == expected, (name, literal, layout, actual, expected)
                cases['read'].append([index, compact(literal), layout, compact(actual)])
        n.reset(home=False)
        n.call(0x14012bc10, [n.scratch + 0x200, 0, 0x145dc2250 + index * 0x98])
        expected = '0' if row['storage'] == 2 else row['default']
        assert n.string(n.scratch + 0x200) == expected
        assert n.trace == [['home']]
        cases['read'].append([index, 'home-unavailable', expected])
    names = [row['key'] for row in rows if row['storage'] in (1, 2)]
    for name in (names[0], names[-1], names[len(names)//2]):
        previous_values = ['', '\n', '\r', '-- keep\r\n', f'{name}=0', f'{name} = "0"\r\n{name}\t=nil\r\n', f'{name}_EXTRA=3\n {name}=4\n', f'{name}\u2003=\u3000nil\n', f'{name}=\n', f'x={"z"*1200}\n', None]
        for previous in previous_values:
            for literal in ('nil', '1', '"0"'):
                for error in (False, True):
                    n.reset(previous=previous, write_error=error)
                    namep, litp = n.scratch + 0x200, n.scratch + 0x400
                    n.u.mem_write(namep, name.encode()); n.u.mem_write(litp, literal.encode())
                    n.call(0x14056a710, [namep, len(name), litp, len(literal)])
                    writes = [v for v in n.trace if v[0] == 'write']
                    assert writes == [['write', 'state/saved-variables.lua', compose(previous, name, literal)]], (name, previous, writes)
                    cases['store'].append([name, compact(previous), literal, error, compact(writes[0][2])])
        n.reset(home=False)
        n.u.mem_write(n.scratch + 0x200, name.encode()); n.u.mem_write(n.scratch + 0x400, b'nil')
        n.call(0x14056a710, [n.scratch + 0x200, len(name), n.scratch + 0x400, 3])
        assert n.trace == [['home']]
        cases['store'].append([name, 'home-unavailable'])
    def resource(kind, condition, active=1):
        world = n.alloc(0x300); ctrl = n.alloc(0x400) + 0x200
        slots, entries, value = n.alloc(8), n.alloc(0x38), n.alloc(0x100)
        n.put(world + 0x78, 'QQ', ctrl, 15); n.put(world + 0x90, 'Q', int(condition != 'empty'))
        n.u.mem_write(ctrl, b'\xff' * 32)
        if kind == 'vm':
            h, tag, key = 0xfe1614d5c652a2de, 0x145db1430, 0x145e8e760
            slot_offset, entries_offset = 0x258, 0x228
        else:
            h, tag, key = 0x6d840768deed00d0, 0x145dad210, 0x145dad220
            slot_offset, entries_offset = 0x210, 0x1e0
        bucket = h & 15
        if condition != 'absent': n.u.mem_write(ctrl + bucket, n.raw(tag, 1))
        n.u.mem_write(ctrl - (bucket + 1) * 24, bytes(16) if condition == 'wrong-key' else n.raw(key, 16))
        n.put(ctrl - (bucket + 1) * 24 + 16, 'Q', int(condition == 'out-of-range'))
        n.put(world + slot_offset, 'QQ', slots, 1); n.put(world + entries_offset, 'Q', entries)
        n.put(slots, 'Q', 0 if condition == 'null-slot' else 0xffffffffffffffff)
        n.put(entries + 0x10, 'Q', value)
        n.put(entries + 0x30, 'B', 0 if condition == 'tag-zero' else 2 if condition == 'tag-two' else 1)
        n.put(value + 0xe8, 'B', active)
        return world
    for condition in ('empty','absent','wrong-key','out-of-range','null-slot','tag-zero','tag-two','present'):
        for name in (names[0], names[-1]):
            for literal in ('nil', '1', '"0"'):
                n.reset('vm'); world = resource('vm', condition)
                key, value = n.alloc(len(name)), n.alloc(len(literal))
                n.u.mem_write(key, name.encode()); n.u.mem_write(value, literal.encode())
                n.call(0x140569e00, [world, key, len(name), value], len(literal))
                expected = name + ' = ' + literal if condition == 'present' else None
                assert n.assignment == expected, (condition, name, n.assignment)
                cases['vm'].append([condition, name, literal, n.assignment])
    for storage in (1, 2):
        for condition in ('empty','absent','wrong-key','out-of-range','null-slot','tag-zero','tag-two','present'):
            for active in (0, 1, 2):
                n.reset('caller'); world = resource('client', condition, active)
                name, literal = names[0], '"0"' if storage == 1 else 'nil'
                key, value = n.alloc(len(name)), n.alloc(len(literal))
                n.u.mem_write(key, name.encode()); n.u.mem_write(value, literal.encode())
                for register, pointer in [('RSI', world), ('RDI', key), ('RBX', len(name)),
                                          ('RBP', n.stack + 0x6000), ('R14', len(literal) if storage == 1 else value), ('R15', len(literal))]: n.reg(register, pointer)
                n.put(n.stack + 0x6000 - 8, 'Q', value)
                n.call(0x14012d3be if storage == 1 else 0x14012d4fa, [])
                expected = [['missing-client']] if condition not in ('present', 'tag-two') else [['assign', name, literal]] if active == 1 else [['inactive']]
                assert n.trace == expected, (storage, condition, active, n.trace, expected)
                cases['caller'].append([storage, condition, active, n.trace])
    return cases


def source_guards():
    def read(path): return (ROOT / path).read_text()
    globals_source = read('crates/azeroth-survivors-re/src/options_globals.rs')
    assert 'UiScript' not in globals_source and 'load_flat_saved_variables' not in globals_source
    assert 'previous.lines().find_map' in globals_source
    assert "line.strip_prefix(name)?.trim_start().strip_prefix('=').map(str::trim)" in globals_source
    assert 'value != "nil" && value != "false"' in globals_source
    assert "literal?.trim_matches('\"').to_owned()" in globals_source
    assert 'home.join("saved-variables.lua")' in globals_source
    home = read('crates/azeroth-survivors-re/src/options_config.rs').split('pub fn home()', 1)[1].split('\n}', 1)[0]
    assert 'benilla_app::config_dir()' in home and 'std::env' not in home
    options = read('crates/azeroth-survivors-re/src/options.rs')
    sync = options.split('fn sync_engine(', 1)[1].split('\nfn ', 1)[0]
    assert 'input.option_globals' not in sync
    assert 'extension.option_global_writes.append(&mut state.global_writes)' in sync
    assert 'extension.option_globals.push((row.key.clone(), row.storage == 2))' in sync
    rebuild = options.split('fn rebuild(', 1)[1].split('\nfn ', 1)[0]
    gate = rebuild.split('if state.open && (!state.last_open || state.definitions_pending) {', 1)[1].split('state.definitions_pending = false;', 1)[0]
    assert 'crate::options_globals::read(home, defs.rows.iter()' in gate
    assert 'state.values.retain(|key, _| !key.starts_with("1:") && !key.starts_with("2:"))' in gate
    assert 'state.values.extend(globals)' in gate
    extension = read('crates/benilla-app/src/local_client/extension.rs')
    assert 'pub(crate) fn discard_inactive_option_globals(mut extension: ResMut<LocalClientExtension>) {\n    extension.option_global_writes.clear();\n}' in extension
    assert 'for (name, literal) in std::mem::take(&mut extension.option_global_writes)' in extension
    flush = extension.split('pub(crate) fn flush_options(', 1)[1].split('\n}', 1)[0]
    missing_vm = flush.rsplit('else {', 1)[1].split('}', 1)[0]
    assert 'extension.option_global_writes.clear();' in missing_vm
    client = read('crates/benilla-app/src/local_client.rs')
    assert 'extension::discard_inactive_option_globals.in_set(LocalClientSet::Options)\n                    .run_if(not(crate::ui_script::ingame_ui_up))' in client
    assert 'extension::flush_options.in_set(LocalClientSet::Options)\n                    .run_if(crate::ui_script::ingame_ui_up)' in client
    assert '.before(benilla_app::local_client::LocalClientSet::Options)' in options


def evidence_guards(data, pe):
    manifest = json.loads((RETAINED / 'manifest.json').read_text())
    assert manifest['target'] == {'version': '0.112.0', 'sha256': SHA}
    for item in manifest['owners'] + manifest['extracts'] + manifest['data']:
        start = int(item['start'], 16)
        length = item.get('length', int(item.get('end_exclusive', hex(start)), 16) - start)
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + length]).hexdigest() == item['sha256'], item['role']
    for name, expected in manifest['artifacts'].items():
        assert hashlib.sha256((RETAINED / name).read_bytes()).hexdigest() == expected, name
    for owner in manifest['shared_owners']:
        assert (RETAINED / owner['path']).is_file(), owner['role']


def main():
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--collect', action='store_true'); args = parser.parse_args()
    target = latest_target(verify=True); assert target['version'] == '0.112.0' and target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py'); pe = module.PE(data)
    source_guards()
    cases = replay(data, pe)
    if args.collect:
        STAGED.mkdir(parents=True, exist_ok=True); (STAGED / 'native-cases.json').write_text(json.dumps(cases, ensure_ascii=False, indent=2) + '\n')
    else:
        evidence_guards(data, pe)
        assert json.loads((RETAINED / 'native-cases.json').read_text()) == cases
    print('Verified current Options VM/file cases:', {k:len(v) for k,v in cases.items()})


if __name__ == '__main__': main()

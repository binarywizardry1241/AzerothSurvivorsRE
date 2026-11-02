"""Shared scratch-only replay harness for hash-bound 0.109.0 terminal contracts.

This module starts neither a compiler nor a target application. Callers declare
exact original instruction windows and optional explicit leaf seams per case.
"""
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes


def require(condition, message):
    if not condition:
        raise ValueError(message)


def verified_input(evidence):
    manifest = json.loads((evidence / 'manifest.json').read_text())
    target = latest_target(verify=True)
    require(all(target[k] == v for k, v in manifest['target'].items()), 'Evidence belongs to another target')
    data = target_bytes(target)
    module = load_script('terminal_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    for row in manifest['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        require(hashlib.sha256(data[offset:offset + end-start]).hexdigest() == row['sha256'], row['role'])
        for kind in ('assembly', 'pseudocode', 'pseudocode_excerpt'):
            if kind in row:
                require(hashlib.sha256((evidence / row[kind]).read_bytes()).hexdigest() == row[kind+'_sha256'], 'Curated evidence changed')
    return manifest, target, data, pe


class NativeReplay:
    def __init__(self, data, pe):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
        import unicorn.x86_const as registers
        self.registers, self.data, self.pe = registers, data, pe
        self.machine = Uc(UC_ARCH_X86, UC_MODE_64)
        extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
        self.machine.mem_map(pe.image_base, (extent+4095) & ~4095)
        for section in pe.sections:
            self.machine.mem_write(pe.image_base+section['rva'], data[section['raw_offset']:section['raw_offset']+section['raw_size']])
        self.mem, self.stack, self.done = 0x200000000, 0x300000000, 0x400000000
        for address, size in [(self.mem, 0x30000), (self.stack, 0x10000), (self.done, 4096)]:
            self.machine.mem_map(address, size)
        self.bp, self.sp, self.app = self.stack+0x8000, self.stack+0xf000, self.mem+0x1000
        self.context, self.instructions, self.seam = {}, 0, None
        self.machine.hook_add(UC_HOOK_CODE, self._instruction)
        self.machine.hook_add(UC_HOOK_MEM_WRITE, self._write)

    def raw(self, address, count):
        offset = self.pe.rva_offset(address-self.pe.image_base)
        require(offset is not None, 'Unmapped original instruction')
        return self.data[offset:offset+count]

    def put(self, address, fmt, *values):
        self.machine.mem_write(address, struct.pack(fmt, *values))

    def get(self, address, fmt):
        return struct.unpack(fmt, self.machine.mem_read(address, struct.calcsize(fmt)))

    def scalar(self, register, value):
        self.machine.reg_write(register, struct.unpack('<I', struct.pack('<f', value))[0])

    def return_seam(self):
        r = self.registers
        sp = self.machine.reg_read(r.UC_X86_REG_RSP)
        self.machine.reg_write(r.UC_X86_REG_RSP, sp+8)
        self.machine.reg_write(r.UC_X86_REG_RIP, self.get(sp, '<Q')[0])

    def _instruction(self, machine, address, count, _):
        self.instructions += 1
        if address in self.context['stops']:
            machine.emu_stop()
            return
        if self.seam is not None and self.seam(address):
            return
        require(any(start <= address and address+count <= end for start, end in self.context['ranges']), f'Unreviewed execution {address:#x}')
        require(bytes(machine.mem_read(address, count)) == self.raw(address, count), 'Modified original instruction')

    def _write(self, _, access, address, count, value, unused):
        require(self.mem <= address and address+count <= self.mem+0x30000 or self.stack <= address and address+count <= self.stack+0x10000, 'Native write escaped scratch')

    def reset(self, mode, ranges, stops):
        r = self.registers
        self.machine.mem_write(self.mem, bytes(0x30000))
        self.machine.mem_write(self.stack, bytes(0x10000))
        self.context.clear()
        self.context.update(mode=mode, ranges=ranges, stops=set(stops))
        for name in ['RAX','RBX','RCX','RDX','RSI','RDI','R8','R9','R10','R11','R12','R13','R14','R15']:
            self.machine.reg_write(getattr(r, 'UC_X86_REG_'+name), 0)
        for index in range(16):
            self.machine.reg_write(getattr(r, 'UC_X86_REG_XMM'+str(index)), 0)
        for register, value in [(r.UC_X86_REG_RBP,self.bp),(r.UC_X86_REG_RSP,self.sp),(r.UC_X86_REG_EFLAGS,2),(r.UC_X86_REG_MXCSR,0x1f80)]:
            self.machine.reg_write(register, value)
        self.put(self.sp, '<Q', self.done)

    def run(self, address):
        self.machine.emu_start(address, 0, count=10000)
        pc = self.machine.reg_read(self.registers.UC_X86_REG_RIP)
        require(pc in self.context['stops'], f'Native instruction budget exhausted at {pc:#x}')
        return pc


def prepare_rea(evidence, manifest, data, pe, output):
    """Stage exact raw-owner reproduction plans; never starts REA itself."""
    for row in manifest['ranges']:
        if 'rea_evidence_id' not in row:
            continue
        directory = output / row['role']
        directory.mkdir(parents=True, exist_ok=True)
        start, end = int(row['start'],16), int(row['end_exclusive'],16)
        offset = pe.rva_offset(start-pe.image_base)
        binary = directory / 'body.bin'
        binary.write_bytes(data[offset:offset+end-start])
        plan = dict(target=str(binary.relative_to(ROOT)), output=str((directory/'rea').relative_to(ROOT)),
                    init_timeout=60, timeout=420, open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
        if row.get('disabled_analyzers'):
            plan['environment'] = {'REA_GHIDRA_DISABLED_ANALYZERS': row['disabled_analyzers']}
        (directory/'plan.json').write_text(json.dumps(plan, indent=2)+'\n')

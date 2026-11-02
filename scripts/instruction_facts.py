"""Reusable intrinsic Capstone facts in the shared analysis catalog and CAS.

Every visit checks the current PE bytes. Cache admission additionally binds the
target, address, exact instruction bytes, decoding mode and implementation.
Ghidra flow, function bodies and source/dispatch ownership are deliberately not
cached here. Blocks amortize SQL and JSON across thousands of instructions.
"""
from bisect import bisect_right
from collections import OrderedDict
import ctypes
import hashlib
import json
import os
from pathlib import Path
import sqlite3
import struct
import tempfile
import time
from types import SimpleNamespace
import zlib

from shared_analysis import SharedAnalysis, canonical, file_digest

ROOT = Path(__file__).resolve().parents[1]
SCHEMA_VERSION = 1
BLOCK_ROWS = 4096
HELPER_SHA256 = file_digest(Path(__file__))
SCHEMA = """
CREATE TABLE IF NOT EXISTS instruction_fact_blocks (
 target TEXT NOT NULL, contract TEXT NOT NULL, start INTEGER NOT NULL,
 end INTEGER NOT NULL, object_sha256 TEXT NOT NULL, bytes INTEGER NOT NULL,
 records INTEGER NOT NULL,
 PRIMARY KEY(target,contract,object_sha256));
CREATE INDEX IF NOT EXISTS instruction_fact_lookup
 ON instruction_fact_blocks(target,contract,start,end);
"""


def derived_json(path, value, *, publish=False):
    """Replay without touching bytes; replace a final alias on changed output."""
    from coverage_common import json_text
    derived_bytes(path, json_text(value).encode(), publish=publish)


def derived_bytes(path, data, *, publish=False):
    path = artifact_path(path)
    try:
        if path.read_bytes() == data:
            return
    except FileNotFoundError:
        pass
    if not publish:
        raise ValueError('Derived artifact is missing or differs: ' + str(path))
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, name = tempfile.mkstemp(prefix='.' + path.name + '.', dir=path.parent)
    try:
        with os.fdopen(descriptor, 'wb') as stream:
            stream.write(data)
        os.replace(name, path)
    finally:
        Path(name).unlink(missing_ok=True)


def artifact_path(value):
    """Validate boundaries while preserving a final immutable-artifact alias."""
    from coverage_common import project_path
    project_path(value)
    path = Path(value)
    if not path.is_absolute():
        path = ROOT / path
    return path.parent.resolve() / path.name


class Operand:
    __slots__ = ('type', 'size', 'access', 'reg', 'imm', 'mem')

    def __init__(self, value):
        self.type, self.size, self.access, self.reg, self.imm, memory = value
        self.mem = SimpleNamespace(segment=memory[0], base=memory[1], index=memory[2],
                                   scale=memory[3], disp=memory[4]) if memory else None


class Instruction:
    """The intrinsic subset used by the static audits, without a decoder call."""
    __slots__ = ('address', 'bytes', 'size', 'id', 'mnemonic', 'op_str', 'addr_size',
                 'groups', '_reads', '_writes', '_operands', '_names', '_decoded_operands')

    def __init__(self, value):
        (self.address, raw, self.id, self.mnemonic, self.op_str, self.addr_size,
         self.groups, self._reads, self._writes, self._operands, self._names) = value
        self.bytes = bytes.fromhex(raw)
        self.size = len(self.bytes)
        self._decoded_operands = None

    @property
    def operands(self):
        # Most flow/ownership readers only need operands at computed sites.
        if self._decoded_operands is None:
            self._decoded_operands = [Operand(value) for value in self._operands]
        return self._decoded_operands

    def group(self, group):
        return group in self.groups

    def regs_access(self):
        return self._reads, self._writes

    def reg_name(self, register):
        return self._names.get(str(register), '')


class _NativeDecoder:
    """One allocation per contiguous batch, with public-API fallback.

    Only Capstone 5's installed binding defines the C layouts used below. Its
    binding/library hashes are already part of every fact contract.
    """
    def __init__(self, decoder, capstone):
        self.decoder, self.capstone = decoder, capstone
        self.reads = (ctypes.c_uint16 * 64)()
        self.writes = (ctypes.c_uint16 * 64)()
        self.read_count, self.write_count = ctypes.c_uint8(), ctypes.c_uint8()
        self.decode_seconds = 0.

    def instructions(self, raw, address):
        capstone = self.capstone
        if capstone.CS_API_MAJOR != 5:
            yield from self.decoder.disasm(raw, address)
            return
        pointer = ctypes.POINTER(capstone._cs_insn)()
        started = time.monotonic()
        count = capstone._cs.cs_disasm(self.decoder.csh, raw, len(raw), address, 0, ctypes.byref(pointer))
        self.decode_seconds += time.monotonic() - started
        if not count:
            status = capstone._cs.cs_errno(self.decoder.csh)
            if status != capstone.CS_ERR_OK:
                raise capstone.CsError(status)
            return
        allocation = _NativeAllocation(pointer, count, capstone._cs)
        for index in range(count):
            yield _NativeInstruction(pointer[index], self, allocation)


class _NativeAllocation:
    """A retained instruction/operand owns its batch beyond generator advance."""
    __slots__ = ('pointer', 'count', 'library')

    def __init__(self, pointer, count, library):
        self.pointer, self.count, self.library = pointer, count, library

    def __del__(self):
        if self.pointer:
            self.library.cs_free(self.pointer, self.count)
            self.pointer = None


class _NativeInstruction:
    __slots__ = ('_raw', '_native', '_allocation', '_operands', '_groups', '_addr_size', 'address', 'size')

    def __init__(self, raw, native, allocation):
        self._raw, self._native = raw, native
        self._allocation = allocation
        raw._native_allocation = allocation
        self.address, self.size = raw.address, raw.size
        self._operands = self._groups = self._addr_size = None

    @property
    def bytes(self):
        return bytes(self._raw.bytes[:self.size])

    @property
    def mnemonic(self):
        return self._raw.mnemonic.decode('ascii')

    @property
    def op_str(self):
        return self._raw.op_str.decode('ascii')

    @property
    def id(self):
        return self._raw.id

    @property
    def addr_size(self):
        if self._addr_size is None:
            self._addr_size = self._raw.detail.contents.arch.x86.addr_size
        return self._addr_size

    @property
    def groups(self):
        if self._groups is None:
            detail = self._raw.detail.contents
            self._groups = detail.groups[:detail.groups_count]
        return self._groups

    def group(self, group):
        return group in self.groups

    @property
    def operands(self):
        if self._operands is not None:
            return self._operands
        detail = self._raw.detail.contents.arch.x86
        operands = detail.operands[:detail.op_count]
        for operand in operands:
            # ctypes subfields retain their parent via _b_base_. Attaching the
            # owner here also protects a retained memory operand after its
            # instruction and iterator have both been released.
            operand._native_allocation = self._allocation
        self._operands = operands
        return operands

    def regs_access(self):
        native = self._native
        status = native.capstone._cs.cs_regs_access(native.decoder.csh, self._raw,
            ctypes.byref(native.reads), ctypes.byref(native.read_count),
            ctypes.byref(native.writes), ctypes.byref(native.write_count))
        if status != native.capstone.CS_ERR_OK:
            raise native.capstone.CsError(status)
        return native.reads[:native.read_count.value], native.writes[:native.write_count.value]

    def reg_name(self, register):
        return self._native.decoder.reg_name(register)


def _instruction_batches(rows, limit):
    """Preserve exact exported boundaries; batch only adjacent virtual bytes."""
    batch, end = [], -1
    for row in rows:
        address, length = int(row['address'], 16), int(row['length'])
        raw = bytes.fromhex(row['bytes'])
        if not raw or length != len(raw):
            raise ValueError(f'Instruction source bytes differ at {address:#x}')
        if address < end:
            raise ValueError('Instruction facts require sorted non-overlapping boundaries')
        if batch and (address != end or len(batch) >= limit):
            yield batch
            batch = []
        batch.append((row, address, raw))
        end = address + length
    if batch:
        yield batch


def _verify_batch(pe, batch):
    address = batch[0][1]
    raw = b''.join(item[2] for item in batch)
    offset = pe.rva_offset(address - pe.image_base)
    last = pe.rva_offset(address - pe.image_base + len(raw) - 1)
    if last == offset + len(raw) - 1:
        if pe.data[offset:offset + len(raw)] != raw:
            raise ValueError(f'Instruction source bytes differ at {address:#x}')
    else:
        # Adjacent virtual sections need not be adjacent in the file.
        for _, site, instruction in batch:
            offset = pe.rva_offset(site - pe.image_base)
            last = pe.rva_offset(site - pe.image_base + len(instruction) - 1)
            if last != offset + len(instruction) - 1 or pe.data[offset:offset + len(instruction)] != instruction:
                raise ValueError(f'Instruction source bytes differ at {site:#x}')
    return raw


def _encoded(instruction, capstone, register_names, raw_bytes):
    # Avoid CsInsn.__gen_detail(): it copies every operand and materializes
    # two dozen unused x86 attributes. These are the same Capstone C facts,
    # protected by exact binding/library hashes, read before the instruction
    # leaves its owning lifetime. No native pointer enters the persisted block.
    raw = instruction._raw
    detail = raw.detail.contents
    architecture = detail.arch.x86
    reads, writes = instruction.regs_access()
    registers = set(reads) | set(writes)
    operands = []
    x = capstone.x86_const
    for operand in architecture.operands[:architecture.op_count]:
        register = operand.reg if operand.type == x.X86_OP_REG else 0
        immediate = operand.imm if operand.type == x.X86_OP_IMM else 0
        memory = None
        if register:
            registers.add(register)
        if operand.type == x.X86_OP_MEM:
            m = operand.mem
            memory = [m.segment, m.base, m.index, m.scale, m.disp]
            registers.update((m.segment, m.base, m.index))
        operands.append([operand.type, operand.size, operand.access, register, immediate, memory])
    for register in registers:
        if register and register not in register_names:
            register_names[register] = instruction.reg_name(register)
    names = {str(register): register_names[register] for register in sorted(registers) if register}
    return [raw.address, raw_bytes.hex(), raw.id, raw.mnemonic.decode('ascii'),
            raw.op_str.decode('ascii'), architecture.addr_size, detail.groups[:detail.groups_count], reads, writes,
            operands, names]


class InstructionFacts:
    def __init__(self, target_sha256, pe, capstone, *, publish=False, root=None,
                 mode=None, tool_identity=None, block_rows=BLOCK_ROWS, cache_policy='full'):
        if cache_policy not in ('full', 'direct'):
            raise ValueError('Unknown instruction cache policy')
        self.root = Path(root or ROOT).resolve()
        self.target, self.pe, self.capstone = target_sha256, pe, capstone
        self.publish, self.block_rows = publish and cache_policy == 'full', block_rows
        self.cache_policy = cache_policy
        self.started = time.monotonic()
        self.mode = capstone.CS_MODE_64 if mode is None else mode
        native_library = Path(str(getattr(capstone._cs, '_name', '')))
        identity = tool_identity or {
            'python_binding_sha256': file_digest(Path(capstone.__file__)),
            'native_library_sha256': file_digest(native_library) if native_library.is_file() else None,
            'python_version': capstone.__version__, 'native_version': list(capstone.cs_version()),
        }
        self.contract = {'schema': SCHEMA_VERSION, 'decoder': 'Capstone',
                         'architecture': capstone.CS_ARCH_X86, 'mode': self.mode,
                         'detail': True, 'implementation': identity,
                         'helper_sha256': HELPER_SHA256}
        self.contract_sha256 = hashlib.sha256(canonical(self.contract).encode()).hexdigest()
        self.decoder = capstone.Cs(capstone.CS_ARCH_X86, self.mode)
        self.decoder.detail = True
        self.native = _NativeDecoder(self.decoder, capstone)
        self.register_names = {}
        self.store = SharedAnalysis(self.root) if self.publish else None
        self.database = self.root / 'runtime/analysis/knowledge.sqlite'
        self.connection = None
        self.blocks = []
        if self.publish:
            # SharedAnalysis.connect() intentionally closes on transaction exit;
            # this bulk writer owns one persistent ordinary SQLite connection.
            self.connection = sqlite3.connect(self.database, timeout=60)
            self.connection.execute('PRAGMA busy_timeout=60000')
            self.connection.executescript(SCHEMA)
        elif cache_policy == 'full' and self.database.is_file():
            if self.database.is_symlink() or not self.database.resolve().is_relative_to(self.root / 'runtime/analysis'):
                raise ValueError('Shared analysis catalog must not be redirected')
            self.connection = sqlite3.connect(f'file:{self.database}?mode=ro', uri=True, timeout=60)
        if self.connection is not None:
            exists = self.connection.execute("SELECT 1 FROM sqlite_master WHERE name='instruction_fact_blocks'").fetchone()
            if exists:
                self.blocks = self.connection.execute(
                    'SELECT start,end,object_sha256,bytes,records FROM instruction_fact_blocks '
                    'WHERE target=? AND contract=? ORDER BY start,end,object_sha256',
                    (self.target, self.contract_sha256)).fetchall()
        self.starts = [row[0] for row in self.blocks]
        self.prefix_ends = []
        maximum = 0
        for row in self.blocks:
            maximum = max(maximum, row[1]); self.prefix_ends.append(maximum)
        self.loaded = OrderedDict()
        self.pending = []
        self.pending_lookup = {}
        self.recent = OrderedDict()
        self.stream_digest = hashlib.sha256()
        self.metrics = {'instructions': 0, 'cache_hits': 0, 'cache_misses': 0,
                        'decoded_instructions': 0, 'blocks_read': 0, 'blocks_published': 0,
                        'published_bytes': 0, 'byte_verification_seconds': 0., 'decode_seconds': 0.,
                        'publication_seconds': 0.}
        self.metrics['native_decode_batches'] = 0
        self.closed = False

    def _block(self, metadata):
        _, _, digest, size, count = metadata
        if digest in self.loaded:
            self.loaded.move_to_end(digest)
            return self.loaded[digest]
        path = self.root / 'runtime/analysis/objects' / digest[:2] / digest
        if path.is_symlink() or not path.resolve().is_relative_to(self.root / 'runtime/analysis/objects') or not path.is_file() or path.stat().st_size != size or file_digest(path) != digest:
            raise ValueError('Instruction facts CAS commitment differs')
        records = json.loads(zlib.decompress(path.read_bytes()))
        if len(records) != count:
            raise ValueError('Instruction facts block count differs')
        result = {(row[0], row[1]): row for row in records}
        if len(result) != count or min(row[0] for row in records) != metadata[0] or max(row[0] + len(bytes.fromhex(row[1])) for row in records) != metadata[1]:
            raise ValueError('Instruction facts block address commitment differs')
        self.loaded[digest] = result
        if len(self.loaded) > 8:
            self.loaded.popitem(last=False)
        self.metrics['blocks_read'] += 1
        return result

    def _lookup(self, address, raw_hex):
        pending = self.pending_lookup.get((address, raw_hex))
        if pending is not None:
            return pending
        index = bisect_right(self.starts, address) - 1
        while index >= 0 and self.prefix_ends[index] > address:
            metadata = self.blocks[index]
            if metadata[1] > address:
                result = self._block(metadata).get((address, raw_hex))
                if result is not None:
                    return result
            index -= 1
        return None

    def _flush(self):
        if not self.pending or not self.publish:
            self.pending.clear(); self.pending_lookup.clear(); return
        started = time.monotonic()
        records, self.pending = self.pending, []
        self.pending_lookup.clear()
        # Facts have stable positional fields and register maps inserted in
        # sorted ID order. Fast compression keeps initial publication cheaper
        # than repeatedly recomputing semantic facts; CAS still binds bytes.
        encoded = zlib.compress(json.dumps(records, separators=(',', ':'), ensure_ascii=True,
                                          allow_nan=False).encode(), 1)
        receipt = self.store.put_bytes(encoded, 'native-instruction-facts',
                                       {'target_sha256': self.target, 'contract_sha256': self.contract_sha256})
        start = min(row[0] for row in records)
        end = max(row[0] + len(bytes.fromhex(row[1])) for row in records)
        with self.connection:
            self.connection.execute('INSERT OR IGNORE INTO instruction_fact_blocks VALUES(?,?,?,?,?,?,?)',
                                    (self.target, self.contract_sha256, start, end,
                                     receipt['sha256'], receipt['bytes'], len(records)))
        self.metrics['blocks_published'] += 1
        self.metrics['published_bytes'] += receipt['bytes']
        self.metrics['publication_seconds'] += time.monotonic() - started
        # Make new blocks visible to repeated sparse requests in this session.
        # Sequential census publication appends, so it never rescans old rows.
        metadata = (start, end, receipt['sha256'], receipt['bytes'], len(records))
        index = bisect_right(self.starts, start)
        self.starts.insert(index, start); self.blocks.insert(index, metadata)
        self.prefix_ends.insert(index, 0)
        maximum = self.prefix_ends[index - 1] if index else 0
        for position in range(index, len(self.blocks)):
            maximum = max(maximum, self.blocks[position][1]); self.prefix_ends[position] = maximum

    def instructions(self, rows):
        for batch in _instruction_batches(rows, self.block_rows):
            started = time.monotonic()
            _verify_batch(self.pe, batch)
            self.metrics['byte_verification_seconds'] += time.monotonic() - started
            values = [self._lookup(address, raw.hex()) for _, address, raw in batch]
            cached = [value is not None for value in values]
            first = 0
            while first < len(batch):
                if values[first] is not None:
                    first += 1
                    continue
                end = first + 1
                while end < len(batch) and values[end] is None:
                    end += 1
                started = time.monotonic()
                missing = batch[first:end]
                raw = b''.join(item[2] for item in missing)
                decoded = self.native.instructions(raw, missing[0][1])
                count = 0
                for index, instruction in enumerate(decoded):
                    if index >= len(missing) or instruction.address != missing[index][1] or instruction.size != len(missing[index][2]):
                        raise ValueError('Independent instruction length differs in native batch')
                    values[first + index] = _encoded(instruction, self.capstone, self.register_names, missing[index][2])
                    count += 1
                if count != len(missing):
                    raise ValueError('Independent instruction length differs in native batch')
                self.metrics['decode_seconds'] += time.monotonic() - started
                self.metrics['native_decode_batches'] += 1
                for value in values[first:end]:
                    self._remember(value)
                self.metrics['decoded_instructions'] += end - first
                first = end
            # Presence in the pending lookup is not a cache hit for this visit;
            # retain the admission result before any new block is published.
            for (row, address, raw), value, hit in zip(batch, values, cached):
                self.metrics['instructions'] += 1
                self.metrics['cache_hits' if hit else 'cache_misses'] += 1
                self.stream_digest.update(struct.pack('<QI', address, len(raw))); self.stream_digest.update(raw)
                yield row, Instruction(value)
        self._flush()

    def _remember(self, value):
        if self.pending and abs(value[0] - self.pending[-1][0]) > 65536:
            self._flush()
        if self.publish:
            self.pending.append(value); self.pending_lookup[(value[0], value[1])] = value
            if len(self.pending) >= self.block_rows:
                self._flush()

    def instruction(self, row):
        """One requested fact, for sparse flow sites and their exact contexts."""
        address = int(row['address'], 16); raw = bytes.fromhex(row['bytes']); length = int(row['length'])
        started = time.monotonic()
        offset = self.pe.rva_offset(address - self.pe.image_base)
        last = self.pe.rva_offset(address - self.pe.image_base + length - 1)
        if not raw or length != len(raw) or last != offset + length - 1 or self.pe.data[offset:offset + length] != raw:
            raise ValueError(f'Instruction source bytes differ at {address:#x}')
        self.metrics['byte_verification_seconds'] += time.monotonic() - started
        key = (address, raw.hex())
        value = self.recent.get(key)
        if value is None:
            value = self._lookup(address, key[1])
        if value is None:
            started = time.monotonic()
            count = 0
            for instruction in self.native.instructions(raw, address):
                if count or instruction.size != length:
                    raise ValueError(f'Independent instruction length differs at {address:#x}')
                value = _encoded(instruction, self.capstone, self.register_names, raw)
                count += 1
            if count != 1:
                raise ValueError(f'Independent instruction length differs at {address:#x}')
            self.metrics['decode_seconds'] += time.monotonic() - started
            self.metrics['cache_misses'] += 1
            self.metrics['decoded_instructions'] += 1
            self.metrics['native_decode_batches'] += 1
            self._remember(value)
        else:
            self.metrics['cache_hits'] += 1
        self.metrics['instructions'] += 1
        self.recent[key] = value; self.recent.move_to_end(key)
        if len(self.recent) > 4096:
            self.recent.popitem(last=False)
        self.stream_digest.update(struct.pack('<QI', address, length)); self.stream_digest.update(raw)
        return Instruction(value)

    def receipt(self):
        return {'schema_version': SCHEMA_VERSION, 'target_sha256': self.target,
                'contract_sha256': self.contract_sha256, 'contract': self.contract,
                'instruction_stream_sha256': self.stream_digest.hexdigest(),
                'instructions': self.metrics['instructions'], 'scope': 'requested-instruction-boundaries',
                'current_source_bytes_verified': True,
                'ownership_or_program_flow_cached': False}

    def close(self):
        if self.closed:
            return
        self.closed = True
        self._flush()
        if file_digest(Path(__file__)) != HELPER_SHA256:
            raise ValueError('Instruction facts helper changed during analysis')
        if self.connection is not None:
            self.connection.close()
        metrics_path = os.environ.get('REA_STAGE_METRICS_PATH')
        if metrics_path:
            path = Path(metrics_path)
            if not path.is_absolute():
                path = self.root / path
            if not path.parent.resolve().is_relative_to(self.root / 'runtime'):
                raise ValueError('Instruction metrics must stay inside project runtime/')
            path.parent.mkdir(parents=True, exist_ok=True)
            payload = {'instruction_facts': {**self.metrics, 'target_sha256': self.target,
                       'contract_sha256': self.contract_sha256,
                       'elapsed_seconds': time.monotonic() - self.started}}
            descriptor, name = tempfile.mkstemp(prefix='.facts-metrics-', dir=path.parent)
            try:
                with os.fdopen(descriptor, 'w') as stream:
                    stream.write(canonical(payload) + '\n')
                os.replace(name, path)
            finally:
                Path(name).unlink(missing_ok=True)

    def __enter__(self):
        return self

    def __exit__(self, *arguments):
        self.close()


class BoundaryVerifier(InstructionFacts):
    """Verify all exported bytes/boundaries without constructing operand facts.

    Whole-image boundary admission needs no registers or operands. Enriched
    facts are populated later by the detail consumer that actually needs them.
    """
    def __init__(self, target_sha256, pe, capstone, *, root=None, mode=None, tool_identity=None,
                 block_rows=BLOCK_ROWS):
        super().__init__(target_sha256, pe, capstone, root=root, mode=mode,
                         tool_identity=tool_identity, block_rows=block_rows, cache_policy='direct')
        self.decoder.detail = False
        self.contract['detail'] = False
        self.contract['purpose'] = 'independent-current-byte-and-boundary-verification'
        self.contract_sha256 = hashlib.sha256(canonical(self.contract).encode()).hexdigest()

    def instructions(self, rows):
        for batch in _instruction_batches(rows, self.block_rows):
            started = time.monotonic()
            raw = _verify_batch(self.pe, batch)
            self.metrics['byte_verification_seconds'] += time.monotonic() - started
            count = 0
            for index, instruction in enumerate(self.native.instructions(raw, batch[0][1])):
                if index >= len(batch) or instruction.address != batch[index][1] or instruction.size != len(batch[index][2]):
                    raise ValueError('Independent instruction length differs in boundary batch')
                row, address, instruction_bytes = batch[index]
                self.metrics['instructions'] += 1
                self.metrics['decoded_instructions'] += 1
                self.metrics['cache_misses'] += 1
                self.stream_digest.update(struct.pack('<QI', address, len(instruction_bytes)))
                self.stream_digest.update(instruction_bytes)
                count += 1
                yield row, SimpleNamespace(address=address, size=len(instruction_bytes), bytes=instruction_bytes)
            if count != len(batch):
                raise ValueError('Independent instruction length differs in boundary batch')
            self.metrics['native_decode_batches'] += 1
            self.metrics['decode_seconds'] = self.native.decode_seconds


class NativeOperandStream(BoundaryVerifier):
    """All required operands, with no unused normalized detail-cache creation.

    The audit consumes each live view immediately. A caller may nevertheless
    retain a view safely: it owns the batch allocation until its last use.
    """
    def __init__(self, target_sha256, pe, capstone, **options):
        super().__init__(target_sha256, pe, capstone, **options)
        self.decoder.detail = True
        self.contract['detail'] = True
        self.contract['purpose'] = 'independent-current-byte-boundary-and-operand-stream'
        self.contract_sha256 = hashlib.sha256(canonical(self.contract).encode()).hexdigest()

    def instructions(self, rows):
        for batch in _instruction_batches(rows, self.block_rows):
            started = time.monotonic()
            raw = _verify_batch(self.pe, batch)
            self.metrics['byte_verification_seconds'] += time.monotonic() - started
            count = 0
            for index, instruction in enumerate(self.native.instructions(raw, batch[0][1])):
                if index >= len(batch) or instruction.address != batch[index][1] or instruction.size != len(batch[index][2]):
                    raise ValueError('Independent instruction length differs in operand batch')
                row, address, instruction_bytes = batch[index]
                self.metrics['instructions'] += 1
                self.metrics['decoded_instructions'] += 1
                self.metrics['cache_misses'] += 1
                self.stream_digest.update(struct.pack('<QI', address, len(instruction_bytes)))
                self.stream_digest.update(instruction_bytes)
                count += 1
                yield row, instruction
            if count != len(batch):
                raise ValueError('Independent instruction length differs in operand batch')
            self.metrics['native_decode_batches'] += 1
            self.metrics['decode_seconds'] = self.native.decode_seconds

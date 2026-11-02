"""Shared Python fixture mechanics; native addresses and target guards stay in callers.

This module contains no reference-input reads, provider calls or game execution.
"""
import hashlib
import struct


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def digest(value):
    return hashlib.sha256(value).hexdigest()


def expression(text, pieces, limit=None):
 limit=len(pieces) if limit is None else limit
 candidates=[(i,value,piece)for i,(value,piece) in enumerate(pieces[:limit])if value]
 exact=next(((i,piece)for i,value,piece in reversed(candidates)if value==text),None)
 if exact:
  i,piece=exact
  return dict(template=piece['template'],values={key:expression(value,pieces,i)for key,value in piece['values'].items()})
 # Native String concatenation has no formatting call: retain its exact segments.
 result=[];position=0
 while position<len(text):
  matches=[(text.find(value,position),-len(value),i,value)for i,value,_ in candidates if text.find(value,position)>=position]
  if not matches:result.append(dict(literal=text[position:]));break
  start,_,i,value=min(matches)
  if start>position:result.append(dict(literal=text[position:start]))
  result.append(expression(value,pieces,i+1));position=start+len(value)
 return dict(concat=result) if len(result)!=1 else result[0]


def effects(ptr, count, read, text, image_base, image_size):
    result = []
    for i in range(count):
        at = ptr + i * 64
        raw = bytes(read(at, 64))
        relocations = []
        for off in range(0, 57, 8):
            address = struct.unpack_from('<Q', raw, off)[0]
            if image_base <= address < image_base + image_size and off + 16 <= 64:
                length = struct.unpack_from('<Q', raw, off + 8)[0]
                if length <= 256:
                    try:
                        value = text(address, length)
                    except (UnicodeDecodeError, ValueError):
                        continue
                    if value:
                        relocations.append({'offset': off, 'value': value})
        effect = {'kind': 'passive', 'tag': raw[0]}
        if raw[0] == 30:
            effect = {'kind': 'stat', 'stat_tag': raw[8], 'amount_bits': struct.unpack_from('<I', raw, 4)[0]}
        elif raw[0] == 31:
            selector = raw[8]
            assert selector in (0, 1), f'Unreviewed catalogue spell selector {selector}'
            selected = {'kind': 'all'} if selector == 0 else {'kind': 'key', 'key': text(struct.unpack_from('<Q', raw, 16)[0], struct.unpack_from('<Q', raw, 24)[0])}
            assert raw[36] < 7
            effect = {'kind': 'spell', 'selector': selected, 'modifier': raw[36], 'amount_bits': struct.unpack_from('<I', raw, 32)[0]}
        result.append({'tag': raw[0], 'raw_hex': raw.hex(), 'strings': relocations, 'effect': effect})
    return result


def reset_machine(machine, registers, game, stack, stop, *, game_bytes=0x30000,
                  vector_count=16, extra_registers=()):
    """Reset the reviewed synthetic x64 state; callers retain their memory profile."""
    machine.mem_write(game, bytes(game_bytes))
    machine.mem_write(stack, bytes(0x20000))
    names = ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9',
             'R10', 'R11', 'R12', 'R13', 'R14', 'R15')
    for name in names:
        machine.reg_write(registers['UC_X86_REG_' + name], 0)
    for index in range(vector_count):
        machine.reg_write(registers['UC_X86_REG_XMM' + str(index)], 0)
    machine.reg_write(registers['UC_X86_REG_EFLAGS'], 2)
    machine.reg_write(registers['UC_X86_REG_MXCSR'], 0x1f80)
    sp = stack + 0x1f008
    machine.mem_write(sp, struct.pack('<Q', stop))
    machine.reg_write(registers['UC_X86_REG_RSP'], sp)
    for name, value in extra_registers:
        machine.reg_write(registers['UC_X86_REG_' + name], value)

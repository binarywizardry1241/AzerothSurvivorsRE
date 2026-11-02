"""Pure current-target checks shared by discovery, admission and census review."""
from bisect import bisect_right
import hashlib
import struct


def verify_table_encoding(table, pe):
    """Bind every supplied successor and domain count to signed LE32 bytes."""
    count = table['selector_maximum'] - table['selector_minimum'] + 1
    if count <= 0 or table['byte_count'] != 4 * count or len(table['case_targets']) != count:
        raise ValueError('Relative table domain/count/byte length differs')
    address = int(table['table_address'], 16)
    end = address + table['byte_count']
    mappings = [section for section in pe.sections
                if pe.image_base + section['rva'] <= address < end <= pe.image_base + section['rva'] + min(section['virtual_size'], section['raw_size'])]
    if len(mappings) != 1 or int(mappings[0]['characteristics'], 16) & 0x80000000:
        raise ValueError('Relative table is not immutable file-backed data')
    offset = pe.rva_offset(address - pe.image_base)
    raw = pe.data[offset:offset + table['byte_count']]
    if offset != int(table['file_offset'], 16) or len(raw) != table['byte_count'] or hashlib.sha256(raw).hexdigest() != table['sha256']:
        raise ValueError('Relative table byte commitment differs')
    expected = [int(table['relative_base'], 16) + value[0] for value in struct.iter_unpack('<i', raw)]
    if expected != [int(value, 16) for value in table['case_targets']]:
        raise ValueError('Relative table supplied successors differ from signed LE32 bytes')


def context_conflicts(instructions, starts, lengths):
    """A newly decoded proof context must preserve every established boundary."""
    for instruction in instructions:
        first, last = instruction.address, instruction.address + instruction.size
        index = bisect_right(starts, first) - 1
        if index >= 0:
            if starts[index] < first < starts[index] + lengths[index]:
                return True
            if starts[index] == first and lengths[index] != instruction.size:
                return True
        next_index = index + 1
        if next_index < len(starts) and starts[next_index] < last:
            return True
    return False


#!/usr/bin/env python3
"""Non-compiling AMD64 metadata entry and directory-boundary regressions."""
import importlib.util
from pathlib import Path
import struct
import unittest
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('metadata_seeds',ROOT/'scripts/recover-native-unwind-handlers.py');h=importlib.util.module_from_spec(spec);spec.loader.exec_module(h)
class PE:
    image_base=0;machine=0x8664;optional=0
    sections=[{'rva':0x100,'virtual_size':0x100,'characteristics':'0x20000000'}]
    def __init__(self):
        self.data=bytearray(0x400);self.directories=[(0,0)]*16;self.records=[(0x100,0x120,0x40)]
        self.data[0x40:0x44]=bytes([25,0,1,0]);struct.pack_into('<I',self.data,0x48,0x120)
    def functions(self):return self.records
    def rva_offset(self,address):
        if not 0<=address<len(self.data):raise ValueError('unmapped')
        return address
    def u32(self,address):return struct.unpack_from('<I',self.data,address)[0]
    def u64(self,address):return struct.unpack_from('<Q',self.data,address)[0]
class MetadataSeeds(unittest.TestCase):
    def test_odd_unwind_slots_align_handler_after_padding(self):
        rows,chains,counts=h.collect(PE());self.assertEqual(rows[0]['entry'],'0x120');self.assertEqual(rows[0]['metadata']['byte_count'],12);self.assertEqual(chains,[])
    def test_chained_metadata_follows_primary_without_invented_bodies(self):
        pe=PE();pe.records=[(0x140,0x150,0x60)];pe.data[0x60:0x64]=bytes([33,0,0,0]);struct.pack_into('<III',pe.data,0x64,0x100,0x120,0x40)
        rows,chains,counts=h.collect(pe);self.assertEqual(rows[0]['entry'],'0x120');self.assertEqual(chains[0]['start'],'0x100');self.assertEqual(counts['version-1'],2)
    def test_rejects_unknown_version_conflicting_flags_and_noncode_handler(self):
        for first,handler in [(26,0x120),(57,0x120),(25,0x220)]:
            pe=PE();pe.data[0x40]=first;struct.pack_into('<I',pe.data,0x48,handler)
            with self.assertRaises(ValueError):h.collect(pe)
    def test_tls_callback_entries_are_bounded_by_actual_terminator(self):
        pe=PE();pe.directories[9]=(0x200,40);struct.pack_into('<Q',pe.data,0x218,0x240);struct.pack_into('<QQ',pe.data,0x240,0x160,0)
        entries,audit=h.directory_entries(pe);self.assertEqual(entries[0]['entry'],'0x160');self.assertEqual(audit['tls']['callbacks'],1);self.assertEqual(audit['tls']['callback_vector']['byte_count'],16)
    def test_guard_tables_use_size_flags_and_explicit_count(self):
        pe=PE();pe.directories[10]=(0x200,0x98);struct.pack_into('<I',pe.data,0x200,0x98);struct.pack_into('<QQ',pe.data,0x280,0x300,2);struct.pack_into('<I',pe.data,0x290,0x10000000);struct.pack_into('<I',pe.data,0x300,0x120);struct.pack_into('<I',pe.data,0x305,0x140)
        entries,audit=h.directory_entries(pe);self.assertEqual([v['entry'] for v in entries],['0x120','0x140']);self.assertEqual(audit['load_config']['entry_tables']['GuardCF']['row_bytes'],5)
        struct.pack_into('<Q',pe.data,0x280,0)
        with self.assertRaises(ValueError):h.directory_entries(pe)
if __name__=='__main__':unittest.main()

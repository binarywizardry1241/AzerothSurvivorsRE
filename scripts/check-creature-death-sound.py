#!/usr/bin/env python3
"""Check AS's exact CreatureSoundData rewrite and its shared source consumer.

Only bounded original instructions execute in synthetic memory. The archive,
allocation/copy, diagnostics and file-publication interfaces are explicit seams.
No Rust compilation, client/server execution or audio playback occurs.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import itertools
import json
import struct
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, latest_target, target_bytes, file_sha256
from equipment_native import EquipmentProbe
from script_sources import load_script

SHA = "6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f"
WORK = ROOT / "runtime/q41-embedded-resources-0.119.0"
KEEP = ROOT / "docs/analysis/evidence/0.119.0/creature-death-sound"
TRANSFORM = (0x145B45BF0, 0x145B45D27)
PATCHER = (0x145B45D30, 0x145B45E4D)
PATH = r"DBFilesClient\CreatureSoundData.dbc"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def expected(raw):
    if len(raw) < 16 or raw[:4] != b"WDBC":
        return None
    rows, fields, stride = struct.unpack_from("<III", raw, 4)
    if fields < 7 or fields * 4 > stride or 20 + rows * stride > len(raw):
        return None
    result = bytearray(raw)
    for row in range(rows):
        at = 20 + row * stride + 24
        if struct.unpack_from("<I", result, at)[0] == 8449:
            struct.pack_into("<I", result, at, 0)
    return bytes(result)


class Probe(EquipmentProbe):
    def hook(self, _, pc, size, unused):
        if pc == self.stop:
            self.native.emu_stop()
            return
        if any(a <= pc and pc + size <= b for a, b in (TRANSFORM, PATCHER)):
            return
        rcx, rdx, r8, r9 = (self.reg(x) for x in ("RCX", "RDX", "R8", "R9"))
        self.edges.add(pc)
        if pc == 0x1400156A0:  # allocate a cloned byte vector, without OS calls
            assert r8 == 0 and r9 == 1 and self.q(self.reg("RSP") + 40) == 1
            self.put(rcx, 0, rdx, self.alloc(rdx))
        elif pc == 0x145F941DB:  # memcpy seam
            self.native.mem_write(rcx, bytes(self.native.mem_read(rdx, r8)))
            self.reg("RAX", rcx)
        elif pc == 0x145AA7E60:  # selected archive read
            assert self.text(rdx, r8) == PATH and r8 == 35
            if not self.available:
                self.put(rcx, 1, 0, self.alloc(8), 0)
            else:
                self.put(rcx, 0, len(self.original), self.input, len(self.original))
        elif pc == 0x145E6FD70:  # replacement publication, no file mutation
            assert self.text(rcx, rdx) == PATH and rdx == 35
            self.published.append(bytes(self.native.mem_read(self.q(r8 + 8), self.q(r8 + 16))))
        elif pc in (0x1400021D0, 0x145F503F0):
            pass  # deallocation / diagnostic seams
        else:
            raise AssertionError(f"Unreviewed call {pc:#x}")
        sp = self.reg("RSP")
        self.reg("RIP", self.q(sp))
        self.reg("RSP", sp + 8)

    def run(self, raw, wrapper=False, available=True):
        self.original, self.available = raw, available
        self.input = self.alloc(len(raw) + 16)
        self.native.mem_write(self.input, raw)
        output = self.alloc(24)
        self.edges, self.published = set(), []
        self.invoke(PATCHER[0] if wrapper else TRANSFORM[0], output, self.input, len(raw))
        want = expected(raw) if available else None
        if wrapper:
            assert self.published == ([want] if want is not None else [])
        elif self.q(output) == 0xffffffffffffffff:
            assert want is None
        else:
            actual = bytes(self.native.mem_read(self.q(output + 8), self.q(output + 16)))
            assert actual == want
        assert bytes(self.native.mem_read(self.input, len(raw))) == raw
        return dict(input_sha256=digest(raw), bytes=len(raw), wrapper=wrapper,
                    available=available, accepted=want is not None,
                    output_sha256=digest(want) if want is not None else None)


def table(rows, fields, stride):
    # Nonzero fillers and target-valued ID/neighbor/tail fields detect overbroad edits.
    raw = bytearray(b"WDBC" + struct.pack("<IIII", rows, fields, stride, 0xffffffff))
    raw.extend(bytes((i * 13 + 7) & 255 for i in range(rows * stride)))
    raw.extend(b"tail\x01\x21\x00\x00")
    if stride >= 28:
        for row in range(rows):
            for field, value in ((0, 8449), (5, 8449), (6, (8449, 8448, 8450, 0xffffffff)[row % 4])):
                struct.pack_into("<I", raw, 20 + row * stride + field * 4, value)
    return bytes(raw)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--write", action="store_true")
    ap.add_argument("--queries", action="store_true")
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.119.0" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("creature_death_sound_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        assert pe.rva_offset(address - pe.image_base + count - 1) == at + count - 1
        return image[at:at + count]

    spans, queries = [], []
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    extents = {(a + pe.image_base, b + pe.image_base) for a, b, _ in pe.functions()}
    for name, (start, end) in (("creature-sound", PATCHER), ("creature-sound-transform", TRANSFORM)):
        assert (start, end) in extents
        value = raw(start, end - start)
        decoded = list(md.disasm(value, start))
        assert sum(i.size for i in decoded) == len(value)
        asm = "\n".join(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                         for i in decoded) + "\n"
        path = KEEP / (name + ".asm")
        if args.write:
            KEEP.mkdir(parents=True, exist_ok=True)
            path.write_text(asm)
        else:
            assert path.read_text() == asm
        spans.append(dict(role=name, start=hex(start), end_exclusive=hex(end),
                          sha256=digest(value), assembly=receipt(path), instructions=len(decoded)))
        if args.write or args.queries:
            journal = WORK / (name + "-query/journal.json")
            state = json.loads(journal.read_text())
            assert state["status"] == "completed"
            assert state["identity"]["target"]["sha256"] == digest(value)
            op = next(o for o in state["operations"].values()
                      if o["arguments"] == {"procedure": hex(start)})
            assert op["status"] == "completed"
            result = ROOT / op["result"]["path"]
            assert file_sha256(result) == op["result"]["sha256"]
            e = json.loads(result.read_text())["structuredContent"]
            assert e["subject"]["digest"]["sha256"] == digest(value)
            c = KEEP / (name + ".c")
            text = "\n".join(line.rstrip() for line in e["raw_result"]["value"].splitlines()).strip() + "\n"
            if args.write:
                c.write_text(text)
            else:
                assert c.read_text() == text
            queries.append(dict(evidence_id=e["evidence_id"], profile=e["analysis_profile"]["digest"],
                                result=receipt(result), journal=receipt(journal),
                                plan=receipt(WORK / (name + "-plan.json")), pseudocode=receipt(c)))
    if not queries:
        queries = json.loads((KEEP / "manifest.json").read_text())["queries"]
        for q in queries:
            assert receipt(ROOT / q["pseudocode"]["path"]) == q["pseudocode"]
    bootstrap = ROOT / "docs/analysis/evidence/0.119.0/run-level-cap/manifest.json"
    boot = json.loads(bootstrap.read_text())
    assert boot["target"]["sha256"] == SHA
    boot_span = next(s for s in boot["native_spans"] if s["role"] == "bootstrap")
    assert digest(raw(int(boot_span["start"], 16), int(boot_span["end_exclusive"], 16) - int(boot_span["start"], 16))) == boot_span["sha256"]
    # Complete existing bootstrap extract, not another native copy.
    assert "call 0x145b45d30" in (ROOT / boot_span["assembly"]["path"]).read_text()
    assert raw(0x1475DF48A, 35) == PATH.encode()

    probe = Probe(image, pe, [TRANSFORM, PATCHER])
    cases = []
    for rows, fields, stride in itertools.product((0, 1, 2, 4), range(10), (0, 1, 24, 27, 28, 29, 30, 32, 36, 40, 120)):
        cases.append(probe.run(table(rows, fields, stride)))
    base = table(1, 7, 28)
    for length in range(49):
        cases.append(probe.run(base[:length]))
    for rows, fields, stride in ((0, 0xffffffff, 0xffffffff), (0, 7, 0xffffffff),
                                 (1, 7, 0xffffffff), (0xffffffff, 7, 28)):
        cases.append(probe.run(b"WDBC" + struct.pack("<IIII", rows, fields, stride, 0)))
    cases.append(probe.run(b"XDBC" + base[4:]))

    reader = load_script("death_sound_mpq", ROOT / "scripts/check-minimap-lifecycle.py")
    members = load_script("death_sound_members", ROOT / "scripts/inventory-current-mpq-members.py")
    for archive in reversed(members.supported_source_order(target)):
        mpq = reader.Archive(archive["path"])
        entry = mpq.lookup(PATH)
        if entry is not None:
            assert file_sha256(mpq.path) == archive["sha256"]
            data = mpq.read(entry)
            break
    else:
        raise AssertionError("Supplying CreatureSoundData absent")
    cases.append(probe.run(data))
    for fixture in (data, b"bad", base[:47], table(0, 7, 28), table(4, 7, 32)):
        for available in (False, True):
            cases.append(probe.run(fixture, wrapper=True, available=available))
    rows, fields, stride = struct.unpack_from("<III", data, 4)
    affected = [struct.unpack_from("<I", data, 20 + i * stride)[0] for i in range(rows)
                if struct.unpack_from("<I", data, 20 + i * stride + 24)[0] == 8449]
    assert affected
    sources = [ROOT / p for p in (
        "crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs",
        "crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap/creature_sound.rs",
        "crates/benilla-app/src/local_client/extension.rs", "crates/benilla-app/src/sound/creature.rs",
        "crates/benilla-formats/src/creature_sound.rs", "crates/benilla-formats/src/lib.rs",
        "crates/benilla-formats/src/creatures.rs", "crates/benilla-app/src/sound/kit.rs")]
    bootstrap_source, transform, extension, sound, formats, exports, ids, kits = [p.read_text() for p in sources]
    assert "creature_sound_data_patch: Some(creature_sound::patch)" in bootstrap_source
    assert "pub creature_sound_data_patch: Option<fn(&[u8]) -> Option<Vec<u8>>>" in extension
    assert "e.creature_sound_data_patch" in sound and "load_creature_voice_catalog_with_patch" in sound
    assert formats.index("patch.and_then(|apply| apply(&bytes)).unwrap_or(bytes)") < formats.index('parse(&bytes, csd_schema()')
    assert "death: g(6)" in formats and "load_creature_voice_catalog_with_patch" in exports
    assert "BARK_DEATH => voice.death" in sound and "if kit == 0" in sound
    assert "stop_unit_voice(out, unit)" in sound and "fn death_vocals" in sound
    assert "load_creature_voices.after(AssetSet::Open)" in sound
    assert "fn load_creature_sound_rows" in ids and "HashSet<u32>" in ids
    assert all(s in transform for s in ("fields < 7", "u64::from(fields) * 4", "u64::from(rows) * u64::from(stride)",
                                        "bytes.to_vec()", "get_mut(offset..offset + 4)?", "== 8449", "death.fill(0)"))
    result = dict(schema_version=1, target={k: target[k] for k in ("version", "sha256", "size_bytes")},
                  gap_ids=[41, 182], lead_ids=["Q41-I01:resource_path:221", "Q41-B02", "Q41-R01"],
                  generator=receipt(Path(__file__).resolve()), native_spans=spans, queries=queries,
                  reused_bootstrap=receipt(bootstrap), native_cases=len(cases),
                  case_digest=digest((json.dumps(cases, sort_keys=True) + "\n").encode()),
                  installed_table=dict(archive=archive["path"], archive_sha256=archive["sha256"],
                                       path=PATH, bytes=len(data), sha256=digest(data), rows=rows,
                                       fields=fields, stride=stride, affected_row_ids=affected,
                                       transformed_sha256=digest(expected(data))),
                  source=[receipt(p) for p in sources],
                  limits=["Only original transform/patcher instructions execute in synthetic memory. Archive reads, allocation/memcpy, diagnostics and replacement publication are explicit seams; no game or OS interfaces execute.",
                          "The source callback supplies complete rewritten bytes to the existing voice-table parser before shared catalog publication. Other raw table readers use only row IDs, which are unchanged; no generic archive overlay is introduced.",
                          "Source guards and authored Rust regressions do not execute the Rust implementation. Compilation, real cache/audio/client/network behavior and original/rebuilt parity remain unverified.",
                          "The bootstrap proof is reused from #181 without duplicate native extracts. Unrelated arrival voice kits and other sound columns retain their separate owners."])
    if args.write:
        (KEEP / "manifest.json").write_text(portable_json(result, indent=2) + "\n")
    else:
        assert portable_record(json.loads((KEEP / "manifest.json").read_text())) == portable_record(result)
    print(f"PASS: {len(cases)} bounded original-instruction cases; {len(affected)} installed rows; shared death-sound consumer connected; runtime/parity unverified")


if __name__ == "__main__":
    main()

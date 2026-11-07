#!/usr/bin/env python3
"""Recover the Orb's native filename/URL boundary without loading a model.

Original x86-64 runs in synthetic memory. Allocation, ASCII UTF-8 borrowing,
memcpy/free and Rust string formatting are explicit library seams. Configured
DBC/member metadata is read in place; no model, application or server is run.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, file_sha256, latest_target, reference_config, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
OUT = ROOT / "docs/analysis/evidence/0.121.0/orb-model-path.json"
FUNCTIONS = {
    "model-path": (0x145EDD720, 0x145EDD7DA),
    "model-name": (0x145EDD7E0, 0x145EDDB9C),
    "model-url": (0x1424763A0, 0x1424766A0),
}


def derive():
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                   str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86_const import X86_OP_MEM, X86_REG_RIP
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("orb_model_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    def receipt(path):
        return {"path": str(path.relative_to(ROOT)), "sha256": file_sha256(path)}

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    queries, ranges, instructions = [], [], {}
    for role, (start, end) in FUNCTIONS.items():
        directory = ROOT / "runtime/analysis/history/findings/fixgap248/b8f5beae6e87" / role
        journal_path = directory / "query/journal.json"
        journal = json.loads(journal_path.read_text())
        assert journal["status"] == "completed"
        operation = next(iter(journal["operations"].values()))
        result = json.loads((ROOT / operation["result"]["path"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        query = {"role": role, "procedure": hex(start),
                 "evidence_id": native["evidence_id"], "provider": native["provider"],
                 "analysis_profile_digest": native["analysis_profile"]["digest"],
                 "normalized_text_sha256": hashlib.sha256(native["normalized_result"].encode()).hexdigest(),
                 "plan": receipt(directory / "plan.json"), "journal": receipt(journal_path),
                 "result": operation["result"], "raw_input": receipt(directory / "code.bin"),
                 "slice_virtual_address": hex(start)}
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        code = raw(start, end - start)
        decoded = list(decoder.disasm(code, start))
        assert sum(i.size for i in decoded) == len(code)
        instructions.update((i.address, i) for i in decoded)
        queries.append(query)
        ranges.append({"role": role, "virtual_address": hex(start),
                       "file_offset": hex(pe.rva_offset(start - pe.image_base)),
                       "byte_count": len(code), "sha256": hashlib.sha256(code).hexdigest(),
                       "instruction_count": len(decoded)})

    # Preserve the one bounded loader navigation result for a later missing-file
    # investigation. Its unresolved async dispatch is not a recovered consumer.
    directory = ROOT / "runtime/analysis/history/findings/fixgap248/b8f5beae6e87/model-loader"
    journal_path = directory / "query/journal.json"
    journal = json.loads(journal_path.read_text())
    assert journal["status"] == "completed"
    operation = next(iter(journal["operations"].values()))
    result = json.loads((ROOT / operation["result"]["path"]).read_text())
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
    frontier = {"procedure": "0x1424c1440", "slice_virtual_address": "0x1424c1440",
                "evidence_id": native["evidence_id"], "provider": native["provider"],
                "analysis_profile_digest": native["analysis_profile"]["digest"],
                "normalized_text_sha256": hashlib.sha256(native["normalized_result"].encode()).hexdigest(),
                "plan": receipt(directory / "plan.json"), "journal": receipt(journal_path),
                "result": operation["result"], "raw_input": receipt(directory / "code.bin"),
                "status": "supporting_engine_context_not_a_recovered_AS_replacement",
                "unresolved": "Async frame dispatch at 0x1424c14d1 uses table0x1465e7498; the isolated query does not recover downstream file-open/error behavior."}
    verify_native_query_subject(ROOT, native, frontier, target, image=image, pe=pe)
    assert "Could not emulate address calculation at 0x0001424c14d1" in native["normalized_result"]

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped, constants = set(), {}

    def memory(address, size):
        for page in range(address & ~4095, (address + size + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    def write(address, payload):
        memory(address, len(payload))
        machine.mem_write(address, payload)

    for start, end in FUNCTIONS.values():
        write(start, raw(start, end - start))
    for instruction in instructions.values():
        for operand in instruction.operands:
            if operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                address = instruction.address + instruction.size + operand.mem.disp
                payload = raw(address, max(operand.size, 32))
                constants[address] = payload
                write(address, payload)
    assert raw(0x147710CE0, 5) == b"\xc0\x03.m2"
    assert raw(0x147711188, 20) == b"Spells\\ErrorCube.mdx"
    assert raw(0x1465DCD27, 20) == b"Spells\\ErrorCube.mdx"

    seams = {0x145FBC370, 0x140002200, 0x1400021C0, 0x145FEBC1B,
             0x145FBE970, 0x1400021D0}
    for address in seams:
        write(address, b"\xc3")
    stack, inputs, output, heap, stop = 0x22000000, 0x23000000, 0x24000000, 0x25000000, 0x26000000
    for address in (stack, inputs, output, heap, stop):
        memory(address, 0x20000)
    state = {}
    total_steps = 0

    def get(name):
        return machine.reg_read(getattr(reg, "UC_X86_REG_" + name))

    def put(name, value):
        machine.reg_write(getattr(reg, "UC_X86_REG_" + name), value)

    def words(address, count):
        return struct.unpack("<" + "Q" * count, machine.mem_read(address, count * 8))

    def string(address):
        _, pointer, length = words(address, 3)
        return bytes(machine.mem_read(pointer, length)) if length else b""

    def allocate(payload):
        pointer = state["heap"]
        state["heap"] += (len(payload) + 63) & ~63
        assert state["heap"] < heap + 0x20000
        machine.mem_write(pointer, payload)
        return pointer

    def hook(_, address, size, user):
        nonlocal total_steps
        if address == stop:
            state["returned"] = True
            machine.emu_stop()
            return
        if address in instructions:
            state["steps"] += 1
            total_steps += 1
            return
        assert address in seams, hex(address)
        if address == 0x145FBC370:  # ASCII-only FromUtf8Lossy borrowing seam.
            payload = bytes(machine.mem_read(get("RDX"), get("R8")))
            assert payload.isascii()
            machine.mem_write(get("RCX"), struct.pack("<QQQ", 0, get("RDX"), len(payload)))
        elif address == 0x1400021C0:
            put("RAX", allocate(b"\0" * get("RCX")))
        elif address == 0x145FEBC1B:
            machine.mem_write(get("RCX"), bytes(machine.mem_read(get("RDX"), get("R8"))))
            put("RAX", get("RCX"))
        elif address == 0x145FBE970:
            caller = words(get("RSP"), 1)[0]
            if caller == 0x145EDDB30:
                assert get("RDX") == 0x147710CE0
                payload = string(words(get("R8"), 1)[0]) + b".m2"
            else:
                assert caller == 0x142476658
                # Rust's two display arguments: source str and normalized String.
                first = words(get("R8"), 1)[0]
                pointer, length = words(first, 2)
                source = bytes(machine.mem_read(pointer, length))
                second = words(get("R8") + 16, 1)[0]
                assert b"://" in raw(get("RDX"), 16)
                payload = source + b"://" + string(second)
            pointer = allocate(payload)
            machine.mem_write(get("RCX"), struct.pack("<QQQ", len(payload), pointer, len(payload)))
        # Allocator initialization and deallocation have no modeled side effects.
        sp = get("RSP")
        put("RIP", words(sp, 1)[0])
        put("RSP", sp + 8)

    machine.hook_add(UC_HOOK_CODE, hook)
    authored = "Creature\\SporeCreature\\SporeCreature.mdx"
    samples = [authored, authored.upper(), authored.lower(), "a.Mdl", "A.M2",
               "a", "a.blp", "a.mdx.bak", "World\\a.mdx\\b", "", ".m2",
               "A" * 255 + ".MDX", "A" * 256 + ".MDX", "A" * 255 + ".M2suffix"]
    cases = []
    for role in FUNCTIONS:
        for name in samples:
            payload = name.encode("ascii")
            state.update(heap=heap, steps=0, returned=False)
            machine.mem_write(inputs, payload + b"\0")
            source = b"mpq-loose" if name == "a.blp" else b"mpq"
            machine.mem_write(inputs + 0x1000, source)
            machine.mem_write(output, b"\0" * 24)
            sp = stack + 0x1F008
            machine.mem_write(sp, struct.pack("<Q", stop))
            put("RSP", sp)
            put("RFLAGS", 2)
            put("RCX", output)
            if role == "model-url":
                put("RDX", inputs + 0x1000)
                put("R8", len(source))
                put("R9", inputs)
                machine.mem_write(sp + 40, struct.pack("<Q", len(payload)))
            else:
                put("RDX", inputs)
                put("R8", len(payload))
            machine.emu_start(FUNCTIONS[role][0], stop + 1, count=10000)
            assert state["returned"], (role, name)
            capacity = words(output, 1)[0]
            actual = None if capacity == 2**64 - 1 else string(output).decode("ascii")
            cut = payload[:0x103]
            stem, dot, extension = cut.rpartition(b".")
            expected = (stem.lower() + b".m2").decode() if dot and extension.lower() in (b"mdx", b"mdl", b"m2") else None
            if role == "model-path" and expected is None:
                expected = "spells\\errorcube.m2"
            elif role == "model-url":
                expected = (source.decode() + "://" + expected.replace("\\", "/")) if expected is not None else "mpq://spells/errorcube.m2"
            assert actual == expected, (role, name, actual, expected)
            cases.append({"role": role, "input": name, "source": source.decode() if role == "model-url" else None,
                          "output": actual, "original_instruction_steps": state["steps"]})

    parent = ROOT / "docs/analysis/evidence/0.121.0/resource-consumer-9612.json"
    model = json.loads(parent.read_text())
    assert model["target"]["sha256"] == SHA
    assert model["model_path_as_authored"] == authored
    assert all(not row["present"] for lookup in model["model_name_hash_lookups"] for row in lookup["archives"])
    inventory_path = ROOT / "docs/analysis/evidence/0.121.0/mpq-member-coverage.json"
    inventory = json.loads(inventory_path.read_text())
    reader_path = ROOT / "scripts/check-minimap-lifecycle.py"
    reader = load_script("orb_model_archive_reader", reader_path)
    archives, archive_checks = {}, []
    # Recheck the actual configured hash/block tables, rather than treating the
    # earlier negative receipt as proof that the current names are still absent.
    for row in inventory["archives"]:
        archive = reader.Archive(row["path"])
        assert archive.size == row["size_bytes"]
        assert hashlib.sha256(archive.hashes).hexdigest() == row["hash_table_sha256"]
        assert hashlib.sha256(archive.blocks).hexdigest() == row["block_table_sha256"]
        for lookup in model["model_name_hash_lookups"]:
            assert archive.lookup(lookup["name"]) is None, (row["path"], lookup["name"])
        archives[row["path"]] = archive
        archive_checks.append({key: row[key] for key in ("path", "size_bytes", "hash_table_sha256", "block_table_sha256")})
    configured = reference_config()["data_dir"]
    assert all(path.is_file() for path in configured.iterdir())
    assert {path.name for path in configured.iterdir()} == {row["path"].rsplit("/", 1)[1] for row in inventory["archives"]}
    for key in ("display_record", "model_record"):
        selected = model[key]
        winner = next(row for row in sorted(inventory["archives"], key=lambda r: r["source_priority"], reverse=True)
                      if archives[row["path"]].lookup(selected["member_name"]) is not None)
        assert winner["path"] == selected["archive"]["path"]
        archive = archives[winner["path"]]
        payload = archive.read(archive.lookup(selected["member_name"]))
        assert hashlib.sha256(payload).hexdigest() == selected["member_sha256"]
    sources = ["crates/benilla-formats/src/models/mod.rs", "crates/benilla-assets/src/lib.rs",
               "crates/benilla-formats/src/creatures.rs", "crates/benilla-app/src/entities/display.rs",
               "crates/benilla-formats/src/chain.rs"]
    # These are source connections, not execution of the Rust implementation.
    source = {name: (ROOT / name).read_text() for name in sources}
    assert 'const NAME_CAP: usize = 0x103;' in source[sources[0]]
    assert '["mdx", "mdl", "m2"]' in source[sources[0]]
    assert 'm2_file_name(raw).unwrap_or_else(|| model_name(ERROR_CUBE))' in source[sources[0]]
    assert 'm2_url_on(MPQ_SOURCE, raw)' in source[sources[1]]
    assert 'Some(file) => format!("{source}://{}", file.replace' in source[sources[1]]
    assert 'model_path: model.path.clone()' in source[sources[2]]
    assert 'asset_server.load(m2_url(&m.model_path))' in source[sources[3]]
    assert 'self.archives.iter().rev().find(|a| a.contains(name))' in source[sources[4]]
    return {"schema_version": 1, "generator": receipt(ROOT / "scripts/check-orb-model-path.py"),
            "target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
            "finding_ids": [248], "lead_id": "RESOURCE1210:display16111:M2-texture-consumer",
            "queries": queries, "loader_frontier": frontier, "native_ranges": ranges,
            "native_constants": [{"virtual_address": hex(address), "byte_count": len(payload),
                                  "sha256": hashlib.sha256(payload).hexdigest()}
                                 for address, payload in sorted(constants.items())],
            "model_receipt": receipt(parent), "archive_inventory": receipt(inventory_path),
            "archive_reader": receipt(reader_path), "configured_archive_recheck": archive_checks,
            "source_boundaries": [receipt(ROOT / name) for name in sources],
            "cases": cases, "original_instruction_steps": total_steps,
            "result": "native filename and URL helpers retain the authored Orb model identity; invalid suffix fallback does not supply this valid missing member",
            "seams": ["ASCII FromUtf8Lossy borrowing, allocation/init/free and memcpy",
                      "Rust formatting of the checked .m2 suffix and source://path descriptors"],
            "limits": ["Exact helper correspondence only; native actor/catalog dispatch into these helpers is not established by these isolated cases.",
                       "No MPQ read, missing-file error handling, model decode, client/game/server execution or rendering is emulated.",
                       "The retained 22 name-hash probes cover configured archives; optional external assets and native catalog replacements remain unproved.",
                       "No substitute model or resource alias is justified. Compilation and original/rebuilt parity remain unverified."]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = derive()
    if args.write:
        OUT.write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert portable_record(json.loads(OUT.read_text())) == portable_record(proof), "Stale Orb model-path receipt"
    print(json.dumps({"cases": len(proof["cases"]), "original_instruction_steps": proof["original_instruction_steps"],
                      "result": proof["result"]}))


if __name__ == "__main__":
    main()

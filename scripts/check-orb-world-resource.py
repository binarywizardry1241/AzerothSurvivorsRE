#!/usr/bin/env python3
"""Join current Orb world creation to the retained DBC/model lookup receipt.

Replay only template selection, GUID and create-interface inputs. No compiler,
reconstructed Rust, actual engine creation, asset loading or game execution.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
import math
import re
import struct
import sys

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
START, END, TABLE, CREATE = 0x145BE8D58, 0x145BE8DDA, 0x146FC0B40, 0x145C13CE0
KEEP = ROOT / "docs/analysis/evidence/orb-world-resource.json"


def source_connection():
    ward_path = ROOT / "crates/azeroth-survivors-re/src/bosses/raid_wards.rs"
    ward = ward_path.read_text()
    template_match = re.search(r"pub const TEMPLATES: &\[Template; 13\] = &\[(.*?)\n\];", ward, re.S)
    assert template_match
    rows = re.findall(r'Template\s*\{\s*name:\s*"([^"]*)",\s*entry:\s*(\d+),\s*display:\s*(\d+),\s*scale:\s*f32::from_bits\((0x[0-9a-f]+)\)\s*\}', template_match[1])
    assert len(rows) == 13 and rows[12] == ("Explosive Orb", "9612", "16111", "0x3f666666")
    assert "TEMPLATES[request.template.min(12)]" in ward
    assert "(4, scale.to_bits())" in ward
    assert "(131, self.template.display)" in ward and "(132, self.template.display)" in ward
    affix_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/affixes.rs"
    affix = affix_path.read_text()
    assert "self.boss_state.wards.spawn(" in affix and "template: 12," in affix
    mechanics_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics.rs"
    mechanics = mechanics_path.read_text()
    assert "self.boss_state.wards.actors.iter().find(|row| row.guid == guid)" in mechanics
    assert ".map(|row| (row.template.display, row.template.scale))" in mechanics
    mechanics_compact = re.sub(r"\s+", "", mechanics)
    appearance = mechanics_compact.split("pubfnactor_appearance(", 1)[1].split("pubfnactor_form_fields(", 1)[0]
    ward_accessor = mechanics_compact.split("pubfnward_actors(", 1)[1].split("pubfnnew(", 1)[0]
    mechanics_fragments = [
        (appearance, ".or_else(||self.boss_state.wards.actors.iter().find(|row|row.guid==guid).map(|row|(row.template.display,row.template.scale)))"),
        (ward_accessor, "&self)->&[azeroth_survivors_re::bosses::raid_wards::Ward]{&self.boss_state.wards.actors}"),
    ]
    for owner, fragment in mechanics_fragments:
        assert owner.count(fragment) == 1
    mechanics_scope = {
        "path": str(mechanics_path.relative_to(ROOT)),
        "scope": "whitespace-normalized ward template display/scale forwarding in actor_appearance and ward collection return in ward_actors only",
        "fragments": [fragment for _, fragment in mechanics_fragments],
        "scope_sha256": hashlib.sha256("\n".join(fragment for _, fragment in mechanics_fragments).encode()).hexdigest()}
    visual_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/visuals.rs"
    visual = visual_path.read_text()
    compact = re.sub(r"\s+", "", visual)
    assert ".chain(game.ward_actors().iter().map(|row|{" in compact
    assert "unwrap_or((row.template.display,row.template.scale))" in compact
    assert "display_id:actor.display_id" in compact and "scale_bits:scale.to_bits()" in compact
    assert "(4,unit.scale_bits)" in compact
    assert "(131,unit.display_id),(132,unit.display_id)" in compact
    assert "fields:ObjectFields::from_pairs(&fields)" in compact
    # Commit only the selected display/scale lanes: the independently repaired
    # target GUID in finding253 must not become a dependency of finding248.
    ward_view = compact.split(".chain(game.ward_actors().iter().map(|row|{", 1)[1].split("//Allpickups", 1)[0]
    snapshot = compact.split("fnunit_snapshot(", 1)[1].split("fnunit_visual(", 1)[0]
    adapter = compact.split("fnunit_visual(", 1)[1].split("fnmodel_bounds(", 1)[0]
    fragments = [
        (ward_view, "game.actor_appearance(row.guid).unwrap_or((row.template.display,row.template.scale))"),
        (ward_view, "ActorView{guid:row.guid,display_id,scale,"),
        (snapshot, "display_id:actor.display_id,scale_bits:scale.to_bits(),"),
        (adapter, "(4,unit.scale_bits)"),
        (adapter, "(131,unit.display_id),(132,unit.display_id)"),
        (adapter, "fields:ObjectFields::from_pairs(&fields)"),
    ]
    for owner, fragment in fragments:
        assert owner.count(fragment) == 1
    display_scope = {
        "path": str(visual_path.relative_to(ROOT)),
        "scope": "whitespace-normalized display/scale fragments in ward ActorView, unit_snapshot and unit_visual only",
        "fragments": [fragment for _, fragment in fragments],
        "scope_sha256": hashlib.sha256("\n".join(fragment for _, fragment in fragments).encode()).hexdigest()}
    return {"status": "connected_source_unexecuted", "template_index": 12,
            "entry": 9612, "display_id": 16111, "scale_bits": "0x3f666666",
            "path": "affix spawn -> WardState::spawn/template12 -> actor_appearance/ward_actors -> ActorView -> unit_snapshot -> unit_visual/LocalUnitVisual fields4/131/132",
            "receipts": [{"path": str(path.relative_to(ROOT)), "sha256": file_sha256(path)}
                         for path in (ward_path, affix_path)],
            "mechanics_display_scope": mechanics_scope,
            "visual_display_scope": display_scope}


def derive(publication_target=0x123456789ABCDEF0):
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                   str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("orb_world_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return image[at:at + size]

    def span(address, size):
        return {"virtual_address": hex(address), "byte_count": size,
                "file_offset": hex(pe.rva_offset(address - pe.image_base)),
                "sha256": hashlib.sha256(raw(address, size)).hexdigest()}

    model_path = ROOT / "docs/analysis/evidence/resource-consumer-9612.json"
    model = json.loads(model_path.read_text())
    assert model["target"]["sha256"] == SHA
    query_dir = ROOT / "runtime/analysis/history/findings/fixgap220229/03231eb4cb7b/affixes/orb-create/query"
    journal = json.loads((query_dir / "journal.json").read_text())
    assert journal["status"] == "completed"
    operation = next(iter(journal["operations"].values()))
    result = json.loads((ROOT / operation["result"]["path"]).read_text())
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
    plan = ROOT / "runtime/analysis/history/findings/fixgap220229/03231eb4cb7b/affixes/orb-create/plan.json"
    subject = ROOT / "runtime/analysis/history/findings/fixgap220229/03231eb4cb7b/affixes/orb-create/code.bin"
    receipt = {"role": "world-ward-create", "procedure": "0x145be8d10",
               "evidence_id": native["evidence_id"], "provider": native["provider"],
               "analysis_profile_digest": native["analysis_profile"]["digest"],
               "normalized_text_sha256": hashlib.sha256(native["normalized_result"].encode()).hexdigest(),
               "plan": {"path": str(plan.relative_to(ROOT)), "sha256": file_sha256(plan)},
               "journal": {"path": str((query_dir / "journal.json").relative_to(ROOT)),
                           "sha256": file_sha256(query_dir / "journal.json")},
               "result": operation["result"],
               "raw_input": {"path": str(subject.relative_to(ROOT)), "sha256": file_sha256(subject)},
               "slice_virtual_address": "0x145be8d10"}
    verify_native_query_subject(ROOT, native, receipt, target, image=image, pe=pe)
    code, table = raw(START, END - START), raw(TABLE, 13 * 32)
    descriptor = struct.unpack_from("<QQIIII", table, 12 * 32)
    assert descriptor == (0x146FC0B2F, 13, 9612, 16111, 0x3F666666, 0)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    instructions = list(decoder.disasm(code, START))
    assert sum(i.size for i in instructions) == len(code)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def memory(address, size):
        for page in range(address & ~4095, (address + size + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    for address, payload in [(START, code), (TABLE, table), (CREATE, b"\xc3")]:
        memory(address, len(payload))
        machine.mem_write(address, payload)
    # The prefix's one scalar constant is read from the actual selected image.
    constant_instruction = next(i for i in instructions if i.mnemonic == "maxss")
    constant = constant_instruction.address + constant_instruction.size + constant_instruction.disp
    memory(constant, 4)
    machine.mem_write(constant, raw(constant, 4))
    game, stack, position = 0x22000000, 0x23000000, 0x24000000
    for address in (game, stack, position):
        memory(address, 0x20000)
    cases, state, steps = [], {}, 0
    allowed = {i.address for i in instructions}

    def hook(_, address, size, user):
        nonlocal steps
        if address == CREATE:
            sp = machine.reg_read(reg.UC_X86_REG_RSP)
            # CALL has already pushed its return address.
            state["actual"] = {"entry": machine.reg_read(reg.UC_X86_REG_R8),
                               "display_id": machine.reg_read(reg.UC_X86_REG_R9),
                               "guid": machine.reg_read(reg.UC_X86_REG_RDX),
                               "scale_bits": struct.unpack("<I", machine.mem_read(sp + 40, 4))[0]}
            machine.emu_stop()
            return
        assert address in allowed
        steps += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    for index in (11, 12, 13, 2**64 - 1):
        for counter in (0, 0xFFFFFF, 0xFFFFFFFF):
            state.clear()
            machine.mem_write(game + 0xCA4, struct.pack("<I", counter))
            for register, value in [(reg.UC_X86_REG_RSP, stack + 0x1F008),
                                    (reg.UC_X86_REG_RSI, game),
                                    (reg.UC_X86_REG_R8, index),
                                    (reg.UC_X86_REG_R15, position),
                                    (reg.UC_X86_REG_XMM6, 0x3F800000)]:
                machine.reg_write(register, value)
            machine.emu_start(START, 0, count=1000)
            selected = min(index, 12)
            entry, display, scale = struct.unpack_from("<III", table, selected * 32 + 16)
            expected = {"entry": entry, "display_id": display,
                        "guid": 0xF130000000000000 | (entry & 0xFFFFFF) << 24 | ((counter + 1) & 0xFFFFFF),
                        "scale_bits": scale}
            assert state["actual"] == expected
            cases.append({"template_input": index, "counter_input": counter,
                          "template_selected": selected, **expected})
    # Follow the current receiving AS helper through its field-writing and
    # create-packet interface, without reconstructing the generic serializer.
    publication_end = 0x145C14044
    publication_code = raw(CREATE, publication_end - CREATE)
    publication_instructions = list(decoder.disasm(publication_code, CREATE))
    assert sum(i.size for i in publication_instructions) == len(publication_code)
    publication_vm = Uc(UC_ARCH_X86, UC_MODE_64)
    publication_pages = set()

    def pub_memory(address, payload):
        for page in range(address & ~4095, (address + len(payload) + 4095) & ~4095, 4096):
            if page not in publication_pages:
                publication_vm.mem_map(page, 4096)
                publication_pages.add(page)
        publication_vm.mem_write(address, payload)

    from capstone.x86_const import X86_REG_RIP
    constants = {}
    for instruction in publication_instructions:
        for operand in instruction.operands:
            if operand.type == 3 and operand.mem.base == X86_REG_RIP:
                address = instruction.address + instruction.size + operand.mem.disp
                constants[address] = max(constants.get(address, 0), operand.size)
    pub_memory(CREATE, publication_code)
    for address, size in constants.items():
        pub_memory(address, raw(address, size))
    field_write, ceilf, atan2f, packet_create = 0x145A9A130, 0x145FEBC63, 0x145FEBC6F, 0x145B422D0
    for address in (field_write, ceilf, atan2f, packet_create):
        pub_memory(address, b"\xc3")
    for address in (game, stack, position):
        pub_memory(address, bytes(0x20000))
    publication_state, publication_cases, publication_steps = {}, [], 0
    publication_allowed = {i.address for i in publication_instructions}

    def pub_word(address):
        return struct.unpack("<Q", publication_vm.mem_read(address, 8))[0]

    def float_register(register):
        return struct.unpack("<f", (publication_vm.reg_read(register) & 0xFFFFFFFF).to_bytes(4, "little"))[0]

    def float_bits(value):
        return struct.unpack("<I", struct.pack("<f", value))[0]

    def publication_hook(_, address, size, user):
        nonlocal publication_steps
        if address == packet_create:
            sp = publication_vm.reg_read(reg.UC_X86_REG_RSP)
            assert pub_word(sp + 64) == publication_state["field_vector"]
            publication_state["packet_guid"] = publication_vm.reg_read(reg.UC_X86_REG_RDX)
            publication_state["packet_kind"] = publication_vm.reg_read(reg.UC_X86_REG_R8) & 0xFF
            publication_vm.emu_stop()
            return
        if address in (field_write, ceilf, atan2f):
            if address == field_write:
                vector = publication_vm.reg_read(reg.UC_X86_REG_RCX)
                publication_state.setdefault("field_vector", vector)
                assert vector == publication_state["field_vector"]
                index = publication_vm.reg_read(reg.UC_X86_REG_RDX) & 0xFFFF
                value = publication_vm.reg_read(reg.UC_X86_REG_R8) & 0xFFFFFFFF
                publication_state["fields"].append([index, value])
            elif address == ceilf:
                value = float_register(reg.UC_X86_REG_XMM0)
                rounded = float(math.ceil(value)) if math.isfinite(value) else value
                publication_vm.reg_write(reg.UC_X86_REG_XMM0, float_bits(rounded))
            else:
                value = math.atan2(float_register(reg.UC_X86_REG_XMM0), float_register(reg.UC_X86_REG_XMM1))
                publication_vm.reg_write(reg.UC_X86_REG_XMM0, float_bits(value))
            sp = publication_vm.reg_read(reg.UC_X86_REG_RSP)
            publication_vm.reg_write(reg.UC_X86_REG_RIP, pub_word(sp))
            publication_vm.reg_write(reg.UC_X86_REG_RSP, sp + 8)
            return
        assert address in publication_allowed, f"outside admitted publication helper: {address:x}"
        publication_steps += 1

    publication_vm.hook_add(UC_HOOK_CODE, publication_hook)
    guid = 0xF13000258C000001
    scale = struct.unpack("<f", bytes.fromhex("6666663f"))[0]
    for display in (0, 16111, 0xFFFFFFFF):
        for level in (1, 100):
            for health in (1.0, 50.25):
                publication_state.clear()
                publication_state["fields"] = []
                publication_vm.mem_write(game + 0x530, struct.pack("<I", level))
                publication_vm.mem_write(game + 0x4B0, struct.pack("<Q", publication_target))
                publication_vm.mem_write(game + 0x520, struct.pack("<ff", 2.0, 3.0))
                publication_vm.mem_write(position, struct.pack("<fff", 1.0, 1.0, 0.0))
                sp = stack + 0x1F008
                publication_vm.mem_write(sp + 40, struct.pack("<Q", 0x3F666666))
                publication_vm.mem_write(sp + 48, struct.pack("<f", health))
                publication_vm.mem_write(sp + 56, struct.pack("<QQ", 0, position))
                for register, value in ((reg.UC_X86_REG_RSP, sp), (reg.UC_X86_REG_RCX, game),
                                        (reg.UC_X86_REG_RDX, guid), (reg.UC_X86_REG_R8, 9612),
                                        (reg.UC_X86_REG_R9, display)):
                    publication_vm.reg_write(register, value)
                publication_vm.emu_start(CREATE, 0, count=10000)
                assert publication_vm.reg_read(reg.UC_X86_REG_RIP) == packet_create
                fields = dict(publication_state["fields"])
                expected = {0: guid & 0xFFFFFFFF, 1: guid >> 32, 2: 9, 3: 9612,
                            4: 0x3F666666, 16: publication_target & 0xFFFFFFFF,
                            17: publication_target >> 32, 22: math.ceil(health), 28: math.ceil(health),
                            34: min(level, 63), 131: display, 132: display,
                            129: float_bits(scale * 0.5), 130: float_bits(scale * 1.5)}
                assert all(fields[index] == value for index, value in expected.items())
                assert publication_state["packet_guid"] == guid and publication_state["packet_kind"] == 3
                publication_cases.append({"display_input": display, "target_guid_input": publication_target, "run_level": level,
                                          "health_input": health, "fields": publication_state["fields"],
                                          "packet_guid": guid, "packet_object_kind": 3})
    publication_dir = ROOT / "runtime/analysis/history/findings/fixgap/de557e34e98e/resource-query/world-create-publication"
    publication_journal = json.loads((publication_dir / "query/journal.json").read_text())
    assert publication_journal["status"] == "completed"
    publication_operation = next(iter(publication_journal["operations"].values()))
    publication_result = json.loads((ROOT / publication_operation["result"]["path"]).read_text())
    publication_native = publication_result.get("structuredContent") or json.loads(publication_result["content"][0]["text"])
    publication_receipt = {
        "role": "world-create-field-publication", "procedure": hex(CREATE),
        "evidence_id": publication_native["evidence_id"], "provider": publication_native["provider"],
        "analysis_profile_digest": publication_native["analysis_profile"]["digest"],
        "normalized_text_sha256": hashlib.sha256(publication_native["normalized_result"].encode()).hexdigest(),
        "plan": {"path": str((publication_dir / "plan.json").relative_to(ROOT)), "sha256": file_sha256(publication_dir / "plan.json")},
        "journal": {"path": str((publication_dir / "query/journal.json").relative_to(ROOT)), "sha256": file_sha256(publication_dir / "query/journal.json")},
        "result": publication_operation["result"],
        "raw_input": {"path": str((publication_dir / "code.bin").relative_to(ROOT)), "sha256": file_sha256(publication_dir / "code.bin")},
        "slice_virtual_address": hex(CREATE)}
    verify_native_query_subject(ROOT, publication_native, publication_receipt, target, image=image, pe=pe)
    sources = []
    for name in ("crates/azeroth-survivors-re/src/bosses/raid_wards.rs",
                 "crates/benilla-formats/src/creatures.rs", "crates/benilla-formats/src/models/mod.rs",
                 "crates/benilla-formats/src/chain.rs"):
        sources.append({"path": name, "sha256": file_sha256(ROOT / name)})
    return {"schema_version": 1,
            "target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
            "finding_ids": [248], "queries": [receipt, publication_receipt], "create_interface": hex(CREATE),
            "selector_prefix": {**span(START, END - START), "instruction_count": len(instructions)},
            "template_table": span(TABLE, 13 * 32), "selected_descriptor": "0x146fc0cc0",
            "cases": cases, "original_instruction_steps": steps,
            "publication": {**span(CREATE, publication_end - CREATE),
                            "instruction_count": len(publication_instructions),
                            "packet_builder_interface": hex(packet_create),
                            "cases": publication_cases, "original_instruction_steps": publication_steps,
                            "seams": ["Typed field-write collection at145a9a130", "ceilf/atan2f library results", "Stop at create-packet builder145b422d0 before serialization"]},
            "model_receipt": {"path": str(model_path.relative_to(ROOT)), "sha256": file_sha256(model_path)},
            "joined_display_id": model["display_record"]["selected_id"],
            "joined_model_id": model["joined_model_id"],
            "authored_model_name": model["model_path_as_authored"],
            "normalized_model_name": model["model_path_normalized"],
            "source_connection": source_connection(),
            "source_boundaries": sources,
            "result": "current world-create selects Orb display16111 and receiving AS helper writes it unchanged to fields131/132 with scale0.9 atfield4; configured DBC route names model2247 with no available named M2/MDX member",
            "limits": ["Current original code executes through AS field writes and create-packet interface inputs; generic field-vector internals, packet serialization and engine object delivery are explicit boundaries.",
                       "Existing source boundaries do not certify the selected target's compiled generic model/mount/alias implementation.",
                       "Retained DBC/model receipt keeps its exact archive/hash/row and22negative probes; no model payload or texture/emitter table exists on this configured route.",
                       "No substitute model, inferred DUST2B link, actual loading/rendering or parity claim."]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    proof = derive()
    if args.stage:
        KEEP.write_text(portable_json(proof, indent=2) + "\n")
    else:
        actual = json.loads(KEEP.read_text())
        assert proof == actual
    print(json.dumps({"world_create_cases": len(proof["cases"]),
                      "original_instruction_steps": proof["original_instruction_steps"],
                      "field_publication_cases": len(proof["publication"]["cases"]),
                      "field_publication_original_steps": proof["publication"]["original_instruction_steps"],
                      "source_connection": proof["source_connection"]["status"]}))


if __name__ == "__main__":
    main()

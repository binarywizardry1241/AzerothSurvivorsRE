#!/usr/bin/env python3
"""Check the native ward creation target and its selected-hero identity input.

Only bounded original instructions run in synthetic memory. No reconstructed
Rust, compiler, clock API, socket, thread, application or server is executed.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

KEEP = ROOT / "docs/analysis/evidence/ward-target-guid.json"
SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
GUIDS = (0, 1, 0xFFFFFF, 0xFFFFFFFE, 0xFFFFFFFF, 0x100000000,
         0x123456789ABCDEF0, 0xFFFFFFFFFFFFFFFF)


def receipt(path):
    return {"path": str(path.relative_to(ROOT)), "sha256": file_sha256(path)}


def derive():
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                   str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("ward_target_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)

    def raw(start, end):
        at = pe.rva_offset(start - pe.image_base)
        return image[at:at + end - start]

    def span(role, start, end):
        payload = raw(start, end)
        instructions = list(decoder.disasm(payload, start))
        assert sum(i.size for i in instructions) == len(payload), role
        return {"role": role, "virtual_address": hex(start), "end_exclusive": hex(end),
                "byte_count": len(payload), "sha256": hashlib.sha256(payload).hexdigest(),
                "instruction_count": len(instructions)}

    def query(directory, address, operation="procedure_pseudo_code"):
        folder = ROOT / directory
        journal = json.loads((folder / "query/journal.json").read_text())
        assert journal["status"] == "completed"
        saved = next(row for row in journal["operations"].values()
                     if row.get("name") == operation and row["arguments"] == {"procedure": hex(address)})
        result = json.loads((ROOT / saved["result"]["path"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        plan = json.loads((folder / "plan.json").read_text())
        value = {"procedure": hex(address), "slice_virtual_address": plan["open_options"]["entry_point"],
                 "plan": receipt(folder / "plan.json"), "journal": receipt(folder / "query/journal.json"),
                 "result": saved["result"], "raw_input": receipt(ROOT / plan["target"]),
                 "evidence_id": native["evidence_id"], "provider": native["provider"],
                 "analysis_profile_digest": native["analysis_profile"]["digest"]}
        verify_native_query_subject(ROOT, native, value, target, image=image, pe=pe)
        return value

    queries = [query("runtime/analysis/history/findings/fixgap/de557e34e98e/resource-query/player-identity-initializer", 0x145B12840),
               query("runtime/analysis/history/findings/fixgap/de557e34e98e/resource-query/custom-roster-factory", 0x145B2A2A0),
               query("runtime/analysis/history/findings/fixgap-238-239/efeee1fba607/heroic-party-dispatch", 0x145B21EB0),
               query("runtime/analysis/history/findings/fixgap219/888a65e3edb9/constructor", 0x145BDCB10, "read_function_instructions"),
               query("runtime/analysis/history/findings/fixgap-238-239/efeee1fba607/hero-context-swap", 0x145BE6F10),
               query("runtime/analysis/history/findings/fixgap220229/03231eb4cb7b/affixes/actor-hit", 0x145C159A0)]
    dispatch_table = 0x147665AB8
    login_index = 0x3D - 0x36
    login_destination = dispatch_table + struct.unpack("<i", raw(dispatch_table + login_index * 4,
                                                                  dispatch_table + login_index * 4 + 4))[0]
    assert login_destination == 0x145B220FE
    ranges = [span(role, start, end) for role, start, end in (
        ("process-clock", 0x1400015BA, 0x140001619),
        ("clock-to-start", 0x140001A5B, 0x140001A6A),
        ("start-seed-capture", 0x140052152, 0x140052155),
        ("start-seed-forward", 0x140052285, 0x1400522AA),
        ("closure-seed-forward", 0x145AF3956, 0x145AF39A2),
        ("thread-seed-forward", 0x145B38C26, 0x145B38C44),
        ("seed-to-identity", 0x145B12DA8, 0x145B12DF9),
        ("seed-identity-publication", 0x145B1302C, 0x145B1303A),
        ("custom-row-identity-read", 0x145B2A2E9, 0x145B2A2F0),
        ("custom-row-identity-store", 0x145B2A359, 0x145B2A361),
        ("login-opcode-dispatch", 0x145B21F69, 0x145B21F84),
        ("login-roster-selection", 0x145B226FE, 0x145B22795),
        ("login-guid-restore", 0x145B2291F, 0x145B2292D),
        ("login-config-identity", 0x145B235C8, 0x145B235CF),
        ("constructor-identity-read", 0x145BDCE2C, 0x145BDCE33),
        ("constructor-identity-preserve", 0x145BDCE65, 0x145BDCE68),
        ("constructor-identity-store", 0x145BDD239, 0x145BDD240),
        ("constructor-output-arguments", 0x145BDE16F, 0x145BDE183),
        ("private-active-hero-swap", 0x145BE746C, 0x145BE74A4),
        ("combat-active-hero-read", 0x145C1696E, 0x145C16976),
        ("combat-victim-and-log", 0x145C169EC, 0x145C169F4))]
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()

    def put(address, payload):
        for page in range(address & ~4095, (address + len(payload) + 4095) & ~4095, 4096):
            if page not in pages:
                machine.mem_map(page, 4096)
                pages.add(page)
        machine.mem_write(address, payload)

    for row in ranges:
        start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
        put(start, raw(start, end))
    config, frame, output, remote = 0x22000000, 0x23000000, 0x24000000, 0x25000000
    for address in (config, frame, output, remote):
        put(address, bytes(0x2000))

    def run(start, end):
        machine.emu_start(start, end, count=1000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == end

    def word(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def mixed(seed):
        value = (seed ^ (seed >> 46) ^ (seed >> 23)
                 ^ (((seed * 0x1E3779B97F4A7C15) & 0xFFFFFFFFFFFFFFFF) >> 40)) & 0x7FFFFF
        return value + (0x800000 if value + 0x800000 < 0xFFFF00 else 0x7FFF00)

    upper = next(seed for seed in range(300000)
                 if ((seed ^ (seed >> 46) ^ (seed >> 23)
                      ^ (((seed * 0x1E3779B97F4A7C15) & 0xFFFFFFFFFFFFFFFF) >> 40)) & 0x7FFFFF) >= 0x7FFF00)
    seed_cases = []
    for seed in (0, 1, 0x7FFFFF, 0xFFFFFFFF, 0x100000000, upper,
                 0x123456789ABCDEF0, 0xFFFFFFFFFFFFFFFF):
        machine.reg_write(reg.UC_X86_REG_R14, seed)
        run(0x145B12DAF, 0x145B12DF9)
        actual = machine.reg_read(reg.UC_X86_REG_R15)
        assert actual == mixed(seed)
        seed_cases.append({"seed": seed, "player_guid": actual})
    constructor_cases, swap_cases = [], []
    for index, guid in enumerate(GUIDS):
        put(config + 0x130, struct.pack("<Q", guid))
        put(frame + 0xF08, struct.pack("<Q", output))
        machine.reg_write(reg.UC_X86_REG_R13, config)
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        for start, end in ((0x145BDCE2C, 0x145BDCE33), (0x145BDCE65, 0x145BDCE68),
                           (0x145BDD239, 0x145BDD240), (0x145BDE16F, 0x145BDE183)):
            run(start, end)
        source = machine.reg_read(reg.UC_X86_REG_RDX)
        destination = machine.reg_read(reg.UC_X86_REG_RCX)
        count = machine.reg_read(reg.UC_X86_REG_R8)
        assert (source, destination, count) == (frame + 0x10, output, 0xD38)
        put(destination, bytes(machine.mem_read(source, count)))  # Explicit memcpy seam.
        assert word(output + 0x4B0) == guid
        constructor_cases.append({"config_guid": guid, "game_guid": word(output + 0x4B0)})
        other = GUIDS[(index + 3) % len(GUIDS)]
        local_bytes = struct.pack("<QQQQ", guid, 11, 12, 13)
        remote_bytes = struct.pack("<QQQQ", other, 21, 22, 23)
        put(output + 0x4B0, local_bytes)
        put(remote + 0x4B0, remote_bytes)
        machine.reg_write(reg.UC_X86_REG_RCX, output)
        machine.reg_write(reg.UC_X86_REG_RDX, remote)
        run(0x145BE746C, 0x145BE74A4)
        assert bytes(machine.mem_read(output + 0x4B0, 32)) == remote_bytes
        assert bytes(machine.mem_read(remote + 0x4B0, 32)) == local_bytes
        swap_cases.append({"local_guid": guid, "other_guid": other, "active_guid_after_swap": word(output + 0x4B0)})

    orb_script = ROOT / "scripts/check-orb-world-resource.py"
    orb = load_script("ward_target_publication", orb_script)
    publication_cases, native_steps = [], 0
    for guid in GUIDS:
        publication = orb.derive(publication_target=guid)["publication"]
        for row in publication["cases"]:
            fields = dict(row["fields"])
            assert fields[16] == guid & 0xFFFFFFFF and fields[17] == guid >> 32
            assert fields[4] == 0x3F666666
            assert fields[131] == row["display_input"] == fields[132]
        row = next(row for row in publication["cases"]
                   if row["display_input"] == 16111 and row["run_level"] == 1 and row["health_input"] == 1.)
        fields = dict(row["fields"])
        publication_cases.append({"target_guid": guid, "field16": fields[16], "field17": fields[17]})
        native_steps += publication["original_instruction_steps"]
    source = source_check()
    return {"schema_version": 1, "gap_ids": [253],
            "target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
            "generator": receipt(ROOT / "scripts/check-ward-target-guid.py"),
            "dependencies": [receipt(ROOT / "scripts" / name) for name in (
                "coverage_common.py", "script_sources.py", "discovery_native_subject.py", "inventory-executable.py")],
            "queries": queries, "native_ranges": ranges,
            "login_dispatch": {"opcode": "0x003d", "table": hex(dispatch_table),
                               "index": login_index, "destination": hex(login_destination),
                               "entry_sha256": hashlib.sha256(raw(dispatch_table + login_index * 4,
                                                                   dispatch_table + login_index * 4 + 4)).hexdigest()},
            "publication_dependency": receipt(orb_script),
            "publication_proof": receipt(ROOT / "docs/analysis/evidence/orb-world-resource.json"),
            "seed_cases": seed_cases, "constructor_cases": constructor_cases,
            "private_swap_cases": swap_cases, "publication_cases": publication_cases,
            "publication_case_count": len(GUIDS) * 12, "publication_native_steps": native_steps,
            "source_connection": source,
            "seams": ["Clock API and constructor surrounding state are not executed.",
                      "Constructor identity fragments retain register state; output memcpy is an explicit seam.",
                      "Publication reuses the existing field collector/ceilf/atan2f seams and stops at packet creation.",
                      "UNIT_FIELD_TARGET is the captured creation target; later ward retargeting is not inferred."],
            "compilation": "not_run", "runtime_validation": "not_run", "parity": "unverified"}


def source_check():
    paths = ["crates/azeroth-survivors-re/src/gameplay/visuals.rs",
             "crates/azeroth-survivors-re/src/gameplay/mod.rs",
             "crates/azeroth-survivors-re/src/gameplay/client/addon_scalars.rs",
             "crates/azeroth-survivors-re/src/run_seed.rs",
             "crates/azeroth-survivors-re/src/coop_runtime.rs",
             "crates/azeroth-survivors-re/src/gameplay/coop.rs",
             "crates/azeroth-survivors-re/src/gameplay/coop_publish.rs"]
    texts = [(ROOT / name).read_text() for name in paths]
    visual, enter, addon, seeds, runtime, cooperative, publisher = [re.sub(r"\s+", "", value) for value in texts]
    assert "target_guid:Some(row.player_guid)" in visual
    assert "target_guid:actor.target_guid" in visual
    assert "#[derive(Clone,Copy,PartialEq,Eq)]structUnitSnapshot{guid:u64,target_guid:Option<u64>" in visual
    assert "ifvisual.unit!=Some(unit){commands.entity(root).insert(unit_visual(unit,None,None));" in visual
    assert "fields.extend([(16,targetasu32),(17,(target>>32)asu32)]);" in visual
    assert "(16,1),(17,0)" not in visual
    assert visual.count("target_guid:None") >= 3
    assert "guid==game.player_guid" in addon and "guid==1{" not in addon
    assert "player_guid:azeroth_survivors_re::coop::server_party::native_world_identity(state)" in seeds
    assert "pub(crate)fnplayer_guid(&self)->u64{self.player_guid}" in seeds
    advancing = seeds.split("pub(crate)fnnext(", 1)[1].split("#[cfg(test)]", 1)[0]
    assert "player_guid=" not in advancing
    assert "self.state=self.state.wrapping_mul(MULTIPLIER).wrapping_add(0x1405_7b7e_f767_814f);expand(self.state)" in advancing
    startup = runtime.split("fnstart(", 1)[1].split("fnpoll(", 1)[0]
    assert startup.index("runtime.world_guid=Some(seeds.player_guid());") < startup.index("ifconfig.direct.is_none(){return;}")
    assert startup.index("ifconfig.direct.is_none(){return;}") < startup.index("Session::open(&config)")
    assert "getrandom::" not in startup
    assert "lethost_guid=coop.as_deref().filter(|runtime|runtime.driver.as_ref().is_some_and(|driver|driver.is_hosting())).and_then(|runtime|runtime.world_guid);" in enter
    assert "letSome(player_guid)=host_guid.or_else(||{ifstock.is_some(){menu.selected_roster_guid()}else{Some(run_seeds.player_guid())}})else{return};" in enter
    assert "game.player_guid=player_guid;" in enter
    receive = cooperative.split("fnreceive(", 1)[1].split("pub(crate)fnqueue_delivery(", 1)[0]
    idle = "ifruntime.driver.is_none()&&runtime.incoming.is_empty()&&runtime.membership.is_empty(){return;}"
    assert receive.index("ifruntime.transport_lost&&!runtime.is_guest()") < receive.index(idle)
    assert "NativeMessage::Endifguest" in receive
    publish = publisher.split("pub(super)fnpublish(", 1)[1]
    host = "if!runtime.driver.as_ref().is_some_and(|driver|driver.is_hosting()){return;}"
    assert publish.index("runtime.actor_clients.clear();return;") < publish.index(host)
    assert publish.index(host) < publish.index("runtime.party=game.localized_party_snapshot(&locale);")
    assert ".filter(|_|runtime.driver.as_ref().is_some_and(|driver|driver.is_hosting()))" in runtime
    boundaries = ["crates/azeroth-survivors-re/src/bosses/raid_wards.rs",
                  "crates/azeroth-survivors-re/src/gameplay/mechanics/affixes.rs",
                  "crates/azeroth-survivors-re/src/gameplay/client.rs",
                  "crates/azeroth-survivors-re/src/gameplay/client/events.rs",
                  "crates/benilla-app/src/local_client/player.rs",
                  "crates/benilla-app/src/local_client.rs",
                  "crates/benilla-protocol/src/messages/update_object/fields/unit.rs",
                  "crates/azeroth-survivors-re/src/main.rs",
                  "crates/azeroth-survivors-re/src/coop/server_party.rs"]
    ward, affix, client, events, body, ui, fields, main, server = [re.sub(r"\s+", "", (ROOT / name).read_text()) for name in boundaries]
    assert "player_guid:request.player_guid" in ward and "player_guid:self.player_guid" in affix
    assert "guid:game.player_guid" in client and "client.begin(player);" in client
    assert "player_mover_for(player_guid,event)" in events
    assert "self_guid.0=Some(character.guid);" in body
    assert "index.0.insert(character.guid,entity);" in body
    assert "(0,player.guidasu32),(1,(player.guid>>32)asu32)" in body
    assert "script.seat_player_guid(player.guid);" in ui
    assert "self.get_guid(FIELD_UNIT_TARGET).filter(|&g|g!=0)" in fields
    assert main.count("letrun_seeds=run_seed::RunSeeds::default();") == 1
    assert main.index("letrun_seeds=run_seed::RunSeeds::default();") < main.index("app.insert_resource(run_seeds);")
    assert "letmixed=(seedasu32)^((seed>>46)asu32)^((seed>>23)asu32)^((seed.wrapping_mul(0x1e3779b97f4a7c15)>>40)asu32);" in server
    assert "letvalue=u64::from(mixed&0x7fffff);letcandidate=value+0x800000;ifcandidate<0xffff00{candidate}else{value+0x7fff00}" in server
    return {"status": "connected_source_unexecuted", "receipts": [receipt(ROOT / name) for name in paths],
            "existing_boundary_receipts": [receipt(ROOT / name) for name in boundaries]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    proof = derive()
    if args.stage:
        KEEP.write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert portable_record(json.loads(KEEP.read_text())) == portable_record(proof)
    print(json.dumps({"seed_cases": len(proof["seed_cases"]),
                      "constructor_cases": len(proof["constructor_cases"]),
                      "private_swap_cases": len(proof["private_swap_cases"]),
                      "publication_cases": proof["publication_case_count"],
                      "publication_native_steps": proof["publication_native_steps"],
                      "source_connection": proof["source_connection"]["status"]}))


if __name__ == "__main__":
    main()

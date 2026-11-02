#!/usr/bin/env python3
"""Check 0.112.5 raid data and its gaze request filter without compiling.

Requires the existing Python unicorn package. --python-libs may select an
already-installed project-local package directory; this script installs nothing.
No original/rebuilt process, Ghidra analysis or Rust execution is invoked.
"""
from portable_paths import portable_json, portable_record

import argparse
import hashlib
import json
import itertools
import math
import re
import struct
import sys

from coverage_common import ROOT, installed_identity, project_path, target_bytes
from script_sources import load_script

SHA = "445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36"
VERSION = "0.112.5"
OUT = ROOT / "docs/analysis/evidence/0.112.5/raid-release-review.json"
QUEUE = (0x1459A9007, 0x1459A90AD)
QUEUE_SHA = "0aaf22e19bc1bd3f7cdff5021e99faa9e4fc34b1634b7e8b3aa067ef43ae158d"
DISPATCH = 0x14597EAB0
KEYS = ("elwynn", "duskwood", "wsg", "ungoro", "ab", "feralas",
        "arena", "sm", "av", "brm", "aq", "naxx")
GUARDIAN_IDS = (609, 610, 611, 709, 710, 711, 106, 107, 111, 1209, 1210,
                1211, 1509, 1510, 1511, 809, 810, 811, 909, 910, 911,
                1309, 1310, 1311, 306, 307, 311, 1009, 1010, 1011,
                1109, 1110, 1111, 1412, 1413, 1414, 1415)


def occurrences(data, needle):
    offset = 0
    while (offset := data.find(needle, offset)) >= 0:
        yield offset
        offset += len(needle)


def recover_graph(target):
    """Locate current catalog inputs; semantics remain separately recovered."""
    data = target_bytes(target)
    pe = load_script("release_raid_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + size]
        assert len(value) == size
        return value

    def span(address, size):
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(raw(address, size)).hexdigest())

    def text(address):
        pointer, size = struct.unpack("<QQ", raw(address, 16))
        assert size < 4096
        return raw(pointer, size).decode()

    # No previous target's RVA enters discovery. Find a literal descriptor,
    # then validate every ordered key, native stride and five-boss slice.
    zones = set()
    for offset in occurrences(data, b"elwynn"):
        address = pe.offset_va(offset)
        if address is None:
            continue
        for hit in occurrences(data, struct.pack("<QQ", address, 6)):
            descriptor = pe.offset_va(hit)
            if descriptor is None:
                continue
            candidate = descriptor - 8
            try:
                if all(text(candidate + 240 * i + 8) == key and
                       struct.unpack("<QQ", raw(candidate + 240 * i + 136, 16))[1] == 5
                       for i, key in enumerate(KEYS)):
                    zones.add(candidate)
            except (AssertionError, ValueError, UnicodeError, struct.error):
                pass
    assert len(zones) == 1, "Ambiguous or absent current zone table"

    guardians = set()
    for hit in occurrences(data, struct.pack("<Q", GUARDIAN_IDS[0])):
        start = hit - 48
        if start < 0 or start + 56 * len(GUARDIAN_IDS) > len(data):
            continue
        if all(struct.unpack_from("<Q", data, start + 56 * i + 48)[0] == identity
               for i, identity in enumerate(GUARDIAN_IDS)):
            address = pe.offset_va(start)
            if address is not None:
                guardians.add(address)
    assert len(guardians) == 1, "Ambiguous or absent current guardian signature table"
    zone_table, guardian_table = next(iter(zones)), next(iter(guardians))

    # Reuse the reviewed structural parser/comparator, selecting current inputs
    # and independently located addresses in memory. Do not run its historical
    # native instruction fixtures or use its old target/address constants.
    parser = load_script("release_raid_graph", ROOT / "scripts/check-raid-target.py")
    parser.SHA = target["sha256"]
    parser.ZONE_TABLE, parser.GUARDIAN_TABLE = zone_table, guardian_table
    parser.latest_target = lambda verify=False: target
    _, _, _, graph, headers = parser.recover()
    return data, pe, raw, span, graph, headers, parser


def inspect():
    target = installed_identity()
    assert (target["version"], target["sha256"]) == (VERSION, SHA), \
        "Changed installed target; recover its contracts before using this proof"
    data, pe, raw, span, graph, headers, parser = recover_graph(target)
    zone_table, guardian_table = parser.ZONE_TABLE, parser.GUARDIAN_TABLE
    relocated = parser.check_graph(graph, headers)

    assert span(QUEUE[0], QUEUE[1] - QUEUE[0])["sha256"] == QUEUE_SHA
    cases = queue_cases(raw)
    gaze = []
    for role, identity_key, identity in (("bosses", "boss_id", 992),
                                         ("guardians", "enemy_id", 911)):
        owner = next(row for row in graph[role] if row[identity_key] == identity)
        roots = [("recurring", row) for row in owner.get("moves", [])]
        roots += [("phase", row) for row in owner["phases"]]
        selected = [(kind, row) for kind, row in roots
                    if graph["actions"][row["action"]]["native_tag"] == 26]
        assert len(selected) == 1
        kind, root = selected[0]
        action = graph["actions"][root["action"]]
        gaze.append(dict(owner_kind=role, identity=identity, root_kind=kind,
                         slot=root["slot"], action_index=root["action"],
                         root_record=root["record"], action_record=action["record"],
                         native_tag=26, words=action["words"],
                         repeat_bits=action["repeat_bits"],
                         **({"threshold_bits": root["threshold_bits"], "yell": root["yell"]}
                            if kind == "phase" else {})))
    assert [row["action_index"] for row in gaze] == [179, 428]
    assert sum(row["native_tag"] == 26 for row in graph["actions"]) == 2

    source = ROOT / "crates/azeroth-survivors-re/src/bosses/abilities.rs"
    expression = re.search(r"pub fn queued_action_enabled\([^)]*\) -> bool \{(.*?)\n\}",
                           source.read_text(), re.S)
    assert expression is not None
    expression = expression[1].strip()
    return dict(
        schema_version=1, target=target, target_process_executed=False,
        discovery=dict(zone_table=span(zone_table, 12 * 240), zone_keys=list(KEYS),
                       guardian_table=span(guardian_table, 37 * 56),
                       guardian_ids=list(GUARDIAN_IDS),
                       method="Unique literal/slice descriptor and complete ordered key/identity shapes; no historical RVAs."),
        graph_comparison=dict(action_nodes=len(graph["actions"]), boss_headers=len(headers),
                              guardian_signatures=len(graph["guardians"]),
                              relocated_pointer_nodes=relocated,
                              scalar_recursive_schedule_and_source_comparison="pass",
                              historical_baseline="docs/analysis/evidence/0.109.0/raid-native/catalog.json",
                              previous_target_catalog="docs/analysis/evidence/0.112.0/raid/catalog.json",
                              duration_annotations="Historical annotations only; no current duration instructions executed."),
        queue_filter=dict(record=span(QUEUE[0], QUEUE[1] - QUEUE[0]),
                          end_exclusive=hex(QUEUE[1]), dispatcher=hex(DISPATCH),
                          dispatcher_intercepted=True, native_cases=cases,
                          skipped_native_tags=[12, 26], terminator=255),
        retained_gaze_roots=gaze,
        source_review=dict(path=str(source.relative_to(ROOT)),
                           queued_action_enabled_expression=expression,
                           observed_missing_gaze_filter=expression == "record.words[0] != 13",
                           generic_semantic_tag=17,
                           note="Semantic tag 17 also adapts unrelated native variants; a native-tag lookup is required before filtering gaze."),
        limits=["Static data/graph/source comparison and isolated original queue instructions only.",
                "Synthetic frame/queue memory; dispatcher intercepted before actor lookup/effect production.",
                "No Rust execution, compilation, original/rebuilt application launch, terrain, rendering or platform filesystem observation.",
                "Retained gaze producers/consumers, delayed/recursive paths and other raid dependencies are not revalidated by this check.",
                "Initial queue suppression preserves timer/phase collection and records; encounter/runtime/presentation parity remains open under #42/#43."])


def queue_cases(raw):
    import unicorn as u
    from unicorn import x86_const as r

    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    memory = 0x70000000
    machine.mem_map(memory, 0x100000)
    mapped, calls = set(), []

    def demand(uc, access, address, size, value, user):
        page = address & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True

    def hook(uc, address, size, user):
        if address == QUEUE[1]:
            uc.emu_stop()
        elif address == DISPATCH:
            payload = machine.reg_read(r.UC_X86_REG_R8)
            tag = machine.mem_read(payload + 45, 1)[0]
            calls.append((machine.reg_read(r.UC_X86_REG_RDX), tag))
            stack = machine.reg_read(r.UC_X86_REG_RSP)
            destination = struct.unpack("<Q", machine.mem_read(stack, 8))[0]
            machine.reg_write(r.UC_X86_REG_RSP, stack + 8)
            machine.reg_write(r.UC_X86_REG_RIP, destination)

    machine.hook_add(u.UC_HOOK_MEM_UNMAPPED, demand)
    machine.hook_add(u.UC_HOOK_CODE, hook)
    frame, queue = memory + 0x10000, memory + 0x20000
    cases = [[tag] for tag in range(256)] + [[], [12, 26, 12, 3, 26, 5],
             [3, 255, 6], [12, 26, 255, 3], [18, 12, 32, 5, 26, 33], list(range(35))]
    for tags in cases:
        machine.mem_write(queue, bytes(max(len(tags), 1) * 56))
        for index, tag in enumerate(tags):
            machine.mem_write(queue + 56 * index, struct.pack("<Q", 100 + index))
            machine.mem_write(queue + 56 * index + 53, bytes([tag]))
        machine.mem_write(frame + 0x238, struct.pack("<Q", len(tags)))
        machine.mem_write(frame + 0x2F0, struct.pack("<Q", queue))
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_RSP, frame + 0x8000)
        machine.reg_write(r.UC_X86_REG_R15, memory + 0x40000)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        calls.clear()
        machine.emu_start(QUEUE[0], 0, count=100000)
        assert machine.reg_read(r.UC_X86_REG_RIP) == QUEUE[1]
        expected = []
        for index, tag in enumerate(tags):
            if tag == 255:
                break
            if tag not in (12, 26):
                expected.append((100 + index, tag))
        assert calls == expected, (tags, calls, expected)
    return len(cases)


def check_marks(write=False):
    """Current native11 producer, payload and connected-source checks."""
    from coverage_common import file_sha256
    from discovery_native_subject import verify_native_query_subject
    keep = ROOT / "docs/analysis/evidence/0.127.0/mograine-marks"
    proof = json.loads((keep / "native-manifest.json").read_text())
    target = installed_identity()
    assert {key: target[key] for key in proof["target"]} == proof["target"]
    data, pe, raw, span, graph, _, graph_parser = recover_graph(target)
    assert len(graph["actions"]) == 493
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        value = raw(address, row["byte_count"])
        assert value.hex() == row["bytes_hex"]
        assert hashlib.sha256(value).hexdigest() == row["sha256"]
        assert pe.rva_offset(address - pe.image_base) == int(row["file_offset"], 16)
        if "assembly" in row:
            assert file_sha256(project_path(row["assembly"]["path"])) == row["assembly"]["sha256"]
    for key in ("summary", "instructions"):
        row = proof["census_source"][key]
        assert file_sha256(project_path(row["path"])) == row["sha256"]
    imports = {int(library["iat_start_address"], 16) + 8 * index: (library["library"], name)
               for library in pe.imports() for index, name in enumerate(library["functions"])}
    for row in proof["crt_imports"]:
        address = int(row["virtual_address"], 16)
        original = raw(address, 6)
        assert original.hex() == row["bytes_hex"] and hashlib.sha256(original).hexdigest() == row["sha256"]
        assert address + 6 + struct.unpack("<i", original[2:])[0] == int(row["iat"], 16)
        assert imports[int(row["iat"], 16)] == (row["library"], row["function"])
    completed_subjects = 0
    for query in proof["queries"]:
        for key in ("plan", "journal", "evidence_bundle", "raw_input", "result"):
            if key in query:
                record = query[key]
                assert file_sha256(project_path(record["path"])) == record["sha256"]
        plan = json.loads(project_path(query["plan"]["path"]).read_text())
        base = int(plan["open_options"]["entry_point"], 16)
        subject = project_path(query["raw_input"]["path"]).read_bytes()
        assert raw(base, len(subject)) == subject
        bundle = json.loads(project_path(query["evidence_bundle"]["path"]).read_text())
        exported = next(row for row in bundle["records"] if row["evidence_id"] == query["evidence_id"])
        assert exported["operation"] == query["operation"]
        assert exported["parameters"] == query["parameters"]
        assert exported["provider"] == query["provider"]
        assert exported["subject"]["digest"]["sha256"] == query["raw_input"]["sha256"]
        if query["result_status"] == "completed":
            saved = json.loads(project_path(query["result"]["path"]).read_text())
            native = saved.get("structuredContent") or json.loads(saved["content"][0]["text"])
            assert native == exported
            verify_native_query_subject(ROOT, native, query, target, image=data, pe=pe)
            completed_subjects += 1
        else:
            # The large tick analysis exported its Evidence, but its MCP reply
            # exceeded the transport budget. Keep that distinct from a completed
            # raw-result journal operation; it cannot bind that graph-review path.
            assert query["result_status"] == "analysis_completed_export_retained"
            assert "result" not in query
            journal = json.loads(project_path(query["journal"]["path"]).read_text())
            assert journal["status"] == "failed"
    assert completed_subjects == 2
    source_path = ROOT / "crates/azeroth-survivors-re/src/bosses/raid_native_catalog.rs"
    source_rows = [line for line in source_path.read_text().splitlines() if "NativeAction { native_tag:" in line]
    assert len(source_rows) == len(graph["actions"])
    marks = [row for row in graph["actions"] if row["native_tag"] == 11]
    assert len(marks) == 23
    for row in marks:
        source = source_rows[row["index"]]
        assert re.search(r"native_tag: (\d+)", source)[1] == "11"
        words = [int(value, 16) for value in re.search(r"words: \[([^]]+)\]", source)[1].split(", ")]
        assert words == row["words"], row["index"]
        assert f"ability: RawBossAbility {{ words: [0x00000011, 0x{row['index']:08x}," in source
    highlord = next(row for row in graph["guardians"] if row["enemy_id"] == 1412)
    scarlet = next(row for row in graph["bosses"] if row["boss_id"] == 1393)
    assert any(row["action"] == 478 for variant in highlord["variants"] for row in variant)
    assert any(row["action"] == 217 for row in scarlet["phases"])
    assert 216 in graph["actions"][217]["children"]
    assert struct.unpack("<f", struct.pack("<I", graph["actions"][478]["words"][5]))[0] == struct.unpack("<f", struct.pack("<f", 1.2))[0]
    assert struct.unpack("<f", struct.pack("<I", graph["actions"][216]["words"][4]))[0] == 1.0
    semantics = [re.search(r"ability: (RawBossAbility \{ words: \[[^]]+\] \})", row)[1] for row in source_rows]
    signatures = (ROOT / "crates/azeroth-survivors-re/src/guardians/signature_catalog.rs").read_text()
    highlord_source = re.search(r"Signature \{ enemy_id: 1412, variants: &\[.*?\n    \], phases: &\[.*?\n    \] \}", signatures, re.S)[0]
    graph_parser.check_guardian_signatures(highlord_source, [highlord], graph["actions"], semantics)
    phase = scarlet["phases"][0]
    schedules = (ROOT / "crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs").read_text()
    expected_phase = ('RaidPhase { boss_id: 1393, phase_index: 0, threshold: f32::from_bits(0x%08x), '
        'yell: %s, native_tag: 18, ability: %s }' % (phase["threshold_bits"], json.dumps(phase["yell"]), semantics[217]))
    assert expected_phase in schedules
    children = re.search(r"children: &\[([^]]*)\]", source_rows[217])[1]
    assert [int(value) for value in children.split(", ")] == graph["actions"][217]["children"]

    def compact(path):
        return re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", (ROOT / path).read_text()))

    extra = compact("crates/azeroth-survivors-re/src/bosses/raid_extra.rs")
    branch = extra.split("11=>{", 1)[1].split("13=>{", 1)[0]
    for statement in ("letescape=f(2)/7.0+0.5;",
        "letwindup=f(4).max(escape/crate::heroic::warning_factor(port.heroic_rank()));",
        "port.raid_cast(c.source_guid,w[0],windup);",
        "row.follow_player_until=(c.now+f(3)).min(row.end-escape).max(c.now);",
        "expires:(c.now+windup)+f(6)", "tick_damage:c.effective_damage*f(7)"):
        assert statement in branch, statement
    assert "c.effective_damage*f(5)" in branch
    area = compact("crates/azeroth-survivors-re/src/bosses/raid_areas.rs")
    assert "end:context.now+delay*crate::heroic::warning_factor(heroic_rank)" in area
    assert "let(player,projected)=port.raid_hazard_positions();" in area
    assert "ifnow<row.follow_player_until{row.center=player;}" in area
    assert "self.contains(player)&&self.contains(projected)" in area
    for statement in ("letdistance=dx.hypot(dy);", "along>=0.&&along<=self.radius",
        "(dy*angle.cos()-dx*angle.sin()).abs()<=width*0.5", "ifdistance<0.5{returntrue;}",
        ".rem_euclid(std::f32::consts::TAU)-std::f32::consts::PI", "offset.abs()<=arc",
        "row.radius>=distance&&row.inner_radius.is_none_or(|inner|distance>=inner)"):
        assert statement in area, statement
    assert "row.advance_extra(now,elapsed,player,projected,port)" in area
    assert "ifrow.damage_contains(player,projected){total+=row.damage;" in area
    updates = extra.split("match&mutstate{", 1)[1]
    periodic = updates.split("Extra::Periodic{", 1)[1].split("Extra::Aftershock{", 1)[0]
    aftershock = updates.split("Extra::Aftershock{", 1)[1].split("Extra::Tether{", 1)[0]
    assert periodic.count("self.damage_contains(player,projected)") == 1
    assert aftershock.count("self.damage_contains(player,projected)") == 2
    crystal = updates.split("Extra::Crystal{", 1)[1]
    assert "self.contains(player)||self.contains(projected)" in crystal
    spawn = updates.split("Extra::Spawn{", 1)[1].split("Extra::Crystal{", 1)[0]
    assert "self.damage_contains(player,projected)" in spawn
    bridge = compact("crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs")
    hazard_bridge = bridge.split("fnraid_hazard_positions(", 1)[1].split("fnraid_aim(", 1)[0]
    assert "report.position=self.player;" in hazard_bridge
    assert "report.flags=self.aim_flags;" in hazard_bridge
    assert "native::prediction::hazard_positions(report,self.player_run_speed,self.now,self)" in hazard_bridge
    heroic = compact("crates/azeroth-survivors-re/src/heroic.rs")
    assert "pubfnwarning_factor(rank:u8)->f32{ifrank!=0{0.85}else{1.0}}" in heroic
    records = dict(schema_version=1, target=proof["target"], target_executed=False,
        action_graph_nodes=493, marks=[{key: row[key] for key in ("index", "words", "record", "repeat_bits")} for row in marks],
        source="crates/azeroth-survivors-re/src/bosses/raid_native_catalog.rs",
        source_schedule_owners=["crates/azeroth-survivors-re/src/guardians/signature_catalog.rs",
                                "crates/azeroth-survivors-re/src/bosses/raid_area_catalog.rs"],
        highlord_guardian=highlord, scarlet_boss=scarlet,
        scalar_payload_and_semantic_dispatch_source_comparison="pass")
    producer = replay_marks(proof, data, pe, marks)
    positions = replay_hazard_positions(proof, data, pe)
    admission = replay_dual_admission(proof, data, pe)
    geometry = replay_shape_paths(proof, data, pe)
    durations = replay_mark_durations(proof, data, pe, graph, source_rows)
    result = dict(schema_version=1, target=proof["target"], source_payload_records=len(marks),
        completed_query_subjects=completed_subjects,
        producer=producer, positions=positions, admission=admission,
        native_geometry=geometry,
        common_ai_blocking_duration=durations,
        source_timing_damage_and_aftershock_connections="pass",
        compiled_or_application_executed=False, runtime_or_parity_validated=False)
    result["isolated_native_cases"] = producer["native_instruction_cases"] + positions["native_instruction_cases"] \
        + positions["native_follow_freeze_cases"] + admission["native_instruction_cases"] \
        + sum(geometry[key] for key in ("shape_helper_cases", "harmful_dual_shape_cases",
            "ordinary_inlined_shape_cases", "crystal_either_pose_cases", "accepted_only_gaze_occupancy_tower_cases")) \
        + durations["native_instruction_cases"]
    text = json.dumps(records, indent=2) + "\n"
    if write:
        (keep / "data-records.json").write_text(text)
        (keep / "static-check.json").write_text(portable_json(result, indent=2) + "\n")
    else:
        assert (keep / "data-records.json").read_text() == text
        assert portable_record(json.loads((keep / "static-check.json").read_text())) == portable_record(result)
    return result


def replay_marks(proof, image, pe, marks):
    """Run the real producer, with explicit cast and allocation seams."""
    harness = load_script("marks_revival_replay", ROOT / "scripts/check-revive-choice.py")
    fixture = dict(native_spans=[dict(start=row["virtual_address"], end_exclusive=row["end_exclusive"],
        byte_count=row["byte_count"]) for row in proof["native_ranges"]],
        constants=[dict(start=row["virtual_address"], byte_count=row["byte_count"]) for row in proof["native_data"]])
    replay = harness.Replay(image, pe, fixture)
    game, frame, stack, payload, allocated = (replay.heap, replay.heap + 0x2000,
        replay.heap + 0x4000, replay.heap + 0x6000, replay.heap + 0x8000)
    reg = replay.reg
    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    bits = lambda value: struct.unpack("<I", struct.pack("<f", value))[0]
    floating = lambda name: struct.unpack("<f", struct.pack("<I", replay.u.reg_read(getattr(reg, "UC_X86_REG_" + name)) & 0xffffffff))[0]
    cases, samples = 0, []
    for row in marks:
        values = [struct.unpack("<f", struct.pack("<I", word))[0] for word in row["words"]]
        for rank in range(6):
            factor = f32(.85) if rank else 1.0
            for now in (0.0, 123.5):
                damage = f32(137.5)
                escape = f32(f32(values[2] / 7.0) + .5)
                windup = max(values[4], f32(escape / factor))
                end = f32(now + f32(windup * factor))
                follow = max(now, min(f32(now + values[3]), f32(end - escape)))
                replay.put(payload, "12I", *row["words"])
                replay.put(game + 0x36f, "B", int(rank != 0))
                replay.put(game + 0x5e8, "QQ", allocated, 1)
                replay.put(frame + 0x1b8, "Q", 99)
                replay.put(frame + 0x1c0, "f", damage)
                replay.run(0x145c5da28, (0x145c5daac,), {"RCX": payload, "RSI": game,
                    "RBP": frame, "RSP": stack, "XMM15": bits(now)})
                assert floating("XMM3") == windup
                # The native cast helper and allocation are external calls;
                # resume at each return with only its defined result supplied.
                replay.run(0x145c5dab1, (0x145c5db49,), {})
                assert replay.get(stack + 0x30, "f") == windup
                assert replay.get(stack + 0x40, "f") == f32(damage * values[5])
                assert replay.get(frame + 0x124, "f") == values[2]
                kind = replay.get(frame + 0x3c, "I")
                assert kind == (2 if values[6] > 0.0 else 0)
                if kind:
                    assert replay.get(frame + 0x40, "f") == f32(f32(now + windup) + values[6])
                    assert replay.get(frame + 0x44, "f") == f32(damage * values[7])
                # Execute the retained current constructor arithmetic itself;
                # only allocation/terrain/publication remain fixture seams.
                replay.run(0x145c59db1, (0x145c59dcb,), {"R15": rank,
                    "XMM11": bits(windup), "XMM9": bits(now)})
                actual_end = floating("XMM11")
                assert actual_end == end
                replay.put(allocated + 0x54, "f", actual_end)
                replay.run(0x145c5db4e, (0x145c5dbb3,), {"RAX": 0})
                actual_follow = replay.get(allocated + 0x58, "f")
                assert actual_follow == follow, (row["index"], rank, now, actual_follow, follow)
                if row["index"] in (216, 478) and now == 0.0 and rank < 2:
                    samples.append(dict(action=row["index"], heroic_rank=rank, escape=escape,
                        raw_windup=values[4], adjusted_windup=windup, impact=end, follow_until=follow))
                cases += 1
    return dict(native_instruction_cases=cases, executed_instruction_sites=len(replay.visited),
        allocation_and_cast_calls="intercepted; original constructor deadline instructions execute",
        representative_mograine_cases=samples)


def replay_hazard_positions(proof, image, pe):
    """Replay accepted-pose terrain sampling and lag-only hit projection."""
    harness = load_script("hazard_revival_replay", ROOT / "scripts/check-revive-choice.py")
    fixture = dict(native_spans=[dict(start=row["virtual_address"], end_exclusive=row["end_exclusive"],
        byte_count=row["byte_count"]) for row in proof["native_ranges"]],
        constants=[dict(start=row["virtual_address"], byte_count=row["byte_count"]) for row in proof["native_data"]])
    replay = harness.Replay(image, pe, fixture)
    game, frame, world = replay.heap, replay.heap + 0x2000, replay.heap + 0x4000
    reg = replay.reg
    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    bits = lambda value: struct.unpack("<I", struct.pack("<f", value))[0]
    floating = lambda name: struct.unpack("<f", struct.pack("<I", replay.u.reg_read(getattr(reg, "UC_X86_REG_" + name)) & 0xffffffff))[0]
    calls = {0x145c51280, 0x145c512ab, 0x145c5135d, 0x145c513ff,
             0x145c5145a, 0x145c51573, 0x145c5146b, 0x145c51583, 0x145c514e3}
    flags_set = (0, 1, 2, 4, 8, 3, 12, 5, 6, 9, 10, 0x101, 0x102, 0x1001)
    cases, terrain_calls, ray_calls = 0, 0, 0
    for flags, facing, speed, lag, terrain, collision in itertools.product(
        flags_set, (0.0, .7), (.25, 7.0, 11.0), (-1.0, 0.0, .25, 1.0, 2.0),
        ("primary", "secondary", "none"), (None, 1.0, .3)):
        facing, speed, lag = f32(facing), f32(speed), f32(lag)
        original = (12.0, -8.0, 3.0)
        replay.put(game + 0x520, "4f", *original, facing)
        replay.put(game + 0x5a8, "f", speed)
        replay.put(game + 0xc18, "Q", world)
        replay.put(game + 0xd3c, "I", flags)
        replay.put(game + 0xcc0, "f", 10.0)
        replay.put(game + 0xd40, "f", f32(10.0 - lag))
        replay.put(frame + 0x290, "Q", game)
        replay.put(world + 0x40, "q", -1 if collision is None else 0)
        replay.put(world + 0x68, "q", -1 if terrain == "none" else 0)
        position = 0x145c51257
        registers = {"RBX": game, "RBP": frame}
        while position != 0x145c515d4:
            replay.run(position, tuple(calls) + (0x145c515d4,), registers)
            registers = {}
            position = replay.u.reg_read(reg.UC_X86_REG_RIP)
            if position == 0x145c515d4:
                break
            if position == 0x145c51280:
                replay.u.reg_write(reg.UC_X86_REG_RAX, int(terrain == "primary"))
                replay.u.reg_write(reg.UC_X86_REG_XMM0, bits(17.0))
                terrain_calls += 1
            elif position == 0x145c512ab:
                replay.put(frame + 0x220, "I", int(terrain == "secondary"))
                replay.put(frame + 0x22c, "f", 9.0)
                terrain_calls += 1
            elif position in (0x145c5135d, 0x145c513ff):
                replay.u.reg_write(reg.UC_X86_REG_XMM0, bits(math.atan2(floating("XMM0"), floating("XMM1"))))
            elif position in (0x145c5145a, 0x145c51573):
                replay.u.reg_write(reg.UC_X86_REG_XMM0, bits(math.cos(floating("XMM0"))))
            elif position in (0x145c5146b, 0x145c51583):
                replay.u.reg_write(reg.UC_X86_REG_XMM0, bits(math.sin(floating("XMM0"))))
            else:
                assert position == 0x145c514e3 and collision is not None
                replay.u.reg_write(reg.UC_X86_REG_XMM0, bits(collision))
                ray_calls += 1
            position += 5  # Resume at the native return without running the external function.
        accepted = (original[0], original[1], 17.0 if terrain == "primary" else 9.0 if terrain == "secondary" else original[2])
        actual_accepted = tuple(replay.get(frame + 0x128 + 4 * i, "f") for i in range(3))
        assert actual_accepted == accepted
        forward = int(flags & 1 != 0) - int(flags & 2 != 0)
        strafe = int(flags & 4 != 0) - int(flags & 8 != 0)
        velocity = [0.0, 0.0]
        if flags & 0x1000 == 0 and (forward or strafe):
            run_speed = max(speed, 1.0)
            selected_speed = 2.5 if flags & 0x100 else 4.5 if not strafe and forward < 0 else run_speed
            angle = f32(facing + f32(math.atan2(strafe, forward)))
            velocity = [f32(f32(math.cos(angle)) * selected_speed), f32(f32(math.sin(angle)) * selected_speed)]
        seconds = max(0.0, min(1.0, lag))
        expected = [f32(original[i] + f32(velocity[i] * seconds)) for i in range(2)] + [original[2]]
        if collision is not None and collision < 1.0:
            delta = [f32(expected[i] - accepted[i]) for i in range(3)]
            length = f32(math.sqrt(f32(f32(delta[1] * delta[1]) + f32(delta[0] * delta[0]))))
            fraction = max(f32(f32(collision) - f32(.5 / max(length, .5))), 0.0)
            expected = [f32(accepted[i] + f32(delta[i] * fraction)) for i in range(3)]
        actual = [replay.get(frame + 8 + 4 * i, "f") for i in range(3)]
        assert actual == expected, (flags, facing, speed, lag, terrain, collision, actual, expected)
        cases += 1
    source = re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", (ROOT / "crates/azeroth-survivors-re/src/bosses/prediction.rs").read_text()))
    current = source.split("pubfnhazard_positions(", 1)[1].split("pubfnaim(", 1)[0]
    for statement in ("letmutaccepted=report.position;", "port.secondary_height([accepted.x,accepted.y])",
                      "letvelocity=report.velocity(run_speed);", "letlag=(now-report.accepted_at)+0.0;",
                      "letlag=if1.0<lag{1.0}else{lag};", "(accepted,clipped(accepted,projected,port))"):
        assert statement in current, statement
    assert "clamped(" not in current and "windup" not in current
    area = replay.heap + 0x7000
    following_cases = 0
    for deadline in (9.0, 10.0, 11.0, float("nan")):
        replay.put(area + 0x40, "3f", 1.0, 2.0, 3.0)
        replay.put(area + 0x58, "f", deadline)
        replay.put(frame + 0x128, "3f", 12.0, -8.0, 17.0)
        replay.put(frame + 8, "3f", 999.0, 999.0, 999.0)
        replay.run(0x145c51b68, (0x145c51b88,), {"R15": area, "RBP": frame,
            "XMM0": bits(10.0)})
        actual = tuple(replay.get(area + 0x40 + 4 * index, "f") for index in range(3))
        assert actual == ((12.0, -8.0, 17.0) if deadline > 10.0 else (1.0, 2.0, 3.0))
        following_cases += 1
    return dict(native_instruction_cases=cases, executed_instruction_sites=len(replay.visited),
        native_follow_freeze_cases=following_cases,
        position_input="Live Game+520 pose, retained facing/flags/report clock; no archived-pose substitution",
        terrain_call_seams=terrain_calls, ray_call_seams=ray_calls,
        external_seams="terrain option results, CRT atan2/cos/sin and ray fractions; original arithmetic and control flow execute")


def replay_dual_admission(proof, image, pe):
    """Check native caller order/short circuit independently of shape math."""
    harness = load_script("hazard_dual_replay", ROOT / "scripts/check-revive-choice.py")
    fixture = dict(native_spans=[dict(start=row["virtual_address"], end_exclusive=row["end_exclusive"],
        byte_count=row["byte_count"]) for row in proof["native_ranges"]], constants=[])
    replay = harness.Replay(image, pe, fixture)
    game, frame, row, shape = (replay.heap, replay.heap + 0x2000,
        replay.heap + 0x4000, replay.heap + 0x6000)
    reg = replay.reg
    branches = (("periodic", 0x145c539f4, 0x145c53a3f, 0x145c53a62, 0x145c53a6f),
                ("aftershock", 0x145c53aaf, 0x145c53afa, 0x145c53b1d, 0x145c53b2a))
    cases, calls = 0, 0
    for name, start, first, second, passed in branches:
        for accepted_inside, projected_inside in itertools.product((False, True), repeat=2):
            replay.put(row + 0x40, "4f", 1.0, 2.0, 3.0, 5.0)
            replay.put(frame + 0x128, "3f", 3.0, 4.0, 0.0)
            replay.put(frame + 8, "3f", 20.0, 10.0, 0.0)
            replay.run(start, (first,), {"R15": row, "R13": shape, "RBP": frame})
            assert replay.u.reg_read(reg.UC_X86_REG_R9) == frame + 0x128
            assert tuple(replay.get(frame + 0x22c + 4 * i, "f") for i in range(3)) == (1.0, 2.0, 3.0)
            calls += 1
            replay.run(first + 5, (second, 0x145c53ca2), {"RAX": int(accepted_inside)})
            if accepted_inside:
                assert replay.u.reg_read(reg.UC_X86_REG_RIP) == second
                assert replay.u.reg_read(reg.UC_X86_REG_R9) == frame + 8
                calls += 1
                replay.run(second + 5, (passed, 0x145c53ca2), {"RAX": int(projected_inside)})
            admitted = replay.u.reg_read(reg.UC_X86_REG_RIP) == passed
            assert admitted == (accepted_inside and projected_inside), (name, accepted_inside, projected_inside)
            cases += 1
    return dict(native_instruction_cases=cases, executed_instruction_sites=len(replay.visited),
        shape_predicate_call_seams=calls, accepted_then_projected_short_circuit="pass",
        shape_predicate_semantics="Boolean control-flow matrix; actual predicates execute separately in native_geometry.")


def replay_shape_paths(proof, image, pe):
    """Execute native shape predicates and their damaging/beneficial callers."""
    harness = load_script("hazard_shapes_replay", ROOT / "scripts/check-revive-choice.py")
    fixture = dict(native_spans=[dict(start=row["virtual_address"], end_exclusive=row["end_exclusive"],
        byte_count=row["byte_count"]) for row in proof["native_ranges"]],
        constants=[dict(start=row["virtual_address"], byte_count=row["byte_count"])
            for row in proof["native_data"] + proof["crt_imports"]])
    replay = harness.Replay(image, pe, fixture)
    reg = replay.reg
    frame, row, center, point, stack, returned = (replay.heap + offset for offset in
        (0x2000, 0x4000, 0x6000, 0x7000, 0xe008, 0xff00))
    replay.put(returned, "B", 0xcc)  # Nonexecuted return sentinel ends the decoder's block.
    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    bits = lambda value: struct.unpack("<I", struct.pack("<f", value))[0]
    floating = lambda name: struct.unpack("<f", struct.pack("<I", replay.u.reg_read(getattr(reg, "UC_X86_REG_" + name)) & 0xffffffff))[0]
    packed_xy = lambda value: int.from_bytes(struct.pack("<2f", *value[:2]), "little")
    crt = {int(record["virtual_address"], 16): record["function"] for record in proof["crt_imports"]}
    crt_calls = 0

    def run(start, ends, registers):
        nonlocal crt_calls
        while True:
            replay.run(start, tuple(ends) + tuple(crt), registers)
            registers = {}
            start = replay.u.reg_read(reg.UC_X86_REG_RIP)
            if start in ends:
                return start
            name, first, second = crt[start], floating("XMM0"), floating("XMM1")
            if name == "_hypotf": value = math.hypot(first, second)
            elif name == "atan2f": value = math.atan2(first, second)
            elif name == "cosf": value = math.cos(first)
            elif name == "sinf": value = math.sin(first)
            else:
                assert name == "fmodf"
                value = math.fmod(first, second)
            replay.u.reg_write(reg.UC_X86_REG_XMM0, bits(value))
            current_stack = replay.u.reg_read(reg.UC_X86_REG_RSP)
            start = replay.get(current_stack, "Q")
            replay.u.reg_write(reg.UC_X86_REG_RSP, current_stack + 8)
            crt_calls += 1

    pi, tau = f32(math.pi), f32(math.tau)
    # The current native shape tags are circle0, donut1, line2, cone3.
    shapes = ((0, 5.0, 0.0), (2, 5.0, 2.0), (3, 5.0, pi), (1, 2.0, 5.0))
    points = ((0.0, 0.0, 0.0), (3.0, 4.0, 0.0), (5.0, 0.0, 1000.0),
              (f32(5.01), 0.0, 0.0), (-3.0, 0.0, 0.0), (0.0, 3.0, 0.0))

    def contains(shape, angle, value):
        tag, first, second = shape
        dx, dy = value[:2]
        distance = f32(math.hypot(dx, dy))
        if tag == 0: return first >= distance
        if tag == 1: return distance >= first and second >= distance
        if tag == 2:
            cosine, sine = f32(math.cos(angle)), f32(math.sin(angle))
            along = f32(f32(dx * cosine) + f32(dy * sine))
            side = f32(f32(dy * cosine) - f32(dx * sine))
            return along >= 0.0 and along <= first and abs(side) <= f32(second * .5)
        if not distance <= first: return False
        if distance < .5: return True
        offset = f32(f32(f32(math.atan2(dy, dx)) - angle) + pi)
        offset = f32(math.fmod(offset, tau))
        if offset < 0.0: offset = f32(offset + tau)
        return abs(f32(offset - pi)) <= f32(second * .5)

    def predicate():
        replay.put(stack, "Q", returned)
        run(0x145b75e60, (returned,), {"RSP": stack})
        return bool(replay.u.reg_read(reg.UC_X86_REG_RAX) & 255)

    helper_cases, dual_cases, ordinary_cases, crystal_cases = 0, 0, 0, 0
    for shape, angle in itertools.product(shapes, (0.0, f32(.7), f32(-2.0))):
        replay.put(row + 0x30, "Iff", *shape)
        replay.put(row + 0x40, "4f", 0.0, 0.0, 10.0, angle)
        replay.put(row + 0x10, "I", 0)
        replay.put(row + 0x54, "f", 0.0)
        replay.put(row + 0x7d, "B", 0)
        replay.put(center, "3f", 0.0, 0.0, 10.0)
        for accepted in points:
            replay.put(point, "3f", *accepted)
            replay.u.reg_write(reg.UC_X86_REG_RCX, row + 0x30)
            replay.u.reg_write(reg.UC_X86_REG_RDX, center)
            replay.u.reg_write(reg.UC_X86_REG_R9, point)
            replay.u.reg_write(reg.UC_X86_REG_XMM2, bits(angle))
            assert predicate() == contains(shape, angle, accepted), (shape, angle, accepted)
            helper_cases += 1
            for projected in points:
                replay.put(frame + 0x128, "3f", *accepted)
                replay.put(frame + 8, "3f", *projected)
                replay.put(frame + 0x200, "4f", *projected, 0.0)
                replay.put(frame + 0x21c, "f", 10.0)
                expected = contains(shape, angle, accepted) and contains(shape, angle, projected)
                for start, first, second, passed in ((0x145c539f4, 0x145c53a3f, 0x145c53a62, 0x145c53a6f),
                                                     (0x145c53aaf, 0x145c53afa, 0x145c53b1d, 0x145c53b2a)):
                    replay.run(start, (first,), {"R15": row, "R13": row + 0x30, "RBP": frame})
                    predicate()
                    replay.run(first + 5, (second, 0x145c53ca2), {})
                    if replay.u.reg_read(reg.UC_X86_REG_RIP) == second:
                        predicate()
                        replay.run(second + 5, (passed, 0x145c53ca2), {})
                    assert (replay.u.reg_read(reg.UC_X86_REG_RIP) == passed) == expected
                    dual_cases += 1
                # The ordinary branch inlines all four shapes and uses the
                # same current admitted/projected pair. Stop at kind dispatch.
                run(0x145c527be, (0x145c52853, 0x145c52961, 0x145c52ab5, 0x145c52b5d),
                    {"R15": row, "RBP": frame, "RSP": stack, "XMM12": packed_xy(accepted),
                     "XMM6": int.from_bytes(bytes.fromhex("ffffff7f" * 4), "little"),
                     "XMM7": bits(.5), "XMM9": bits(tau)})
                assert bool(replay.u.reg_read(reg.UC_X86_REG_RAX) & 255) == expected, (shape, angle, accepted, projected, "ordinary")
                ordinary_cases += 1
                # Crystal exposure is beneficial occupancy: either pose may
                # count, unlike the harmful AND gates above.
                replay.run(0x145c52e88, (0x145c52ebb,), {"R15": row, "R13": row + 0x30,
                    "RDI": center, "RBP": frame})
                predicate()
                replay.run(0x145c52ec0, (0x145c52eee, 0x145c52efb), {})
                if replay.u.reg_read(reg.UC_X86_REG_RIP) == 0x145c52eee:
                    predicate()
                    replay.run(0x145c52ef3, (0x145c52efb, 0x145c52fb1), {})
                actual = replay.u.reg_read(reg.UC_X86_REG_RIP) == 0x145c52efb
                assert actual == (contains(shape, angle, accepted) or contains(shape, angle, projected))
                crystal_cases += 1
    accepted_only_cases = 0
    for accepted, projected in itertools.product(points, (points[0], points[3])):
        replay.put(frame + 8, "3f", *projected)
        distance = f32(math.hypot(*accepted[:2]))
        for start, passed, refused in ((0x145c51f2c, 0x145c521b8, 0x145c5201f),
                                       (0x145c525dd, 0x145c526de, 0x145c527be)):
            replay.run(start, (passed, refused), {"XMM8": bits(5.0), "XMM0": bits(distance)})
            assert (replay.u.reg_read(reg.UC_X86_REG_RIP) == passed) == (distance <= 5.0)
            accepted_only_cases += 1
        replay.put(row + 0x30, "Iff", 0, 5.0, 0.0)
        replay.put(row + 0x40, "3f", 0.0, 0.0, 10.0)
        position = run(0x145c53ffe, (0x145c54110, 0x145c54120), {"R15": 0, "RSI": row,
            "RBX": 0x1473e1760, "RDI": 0, "R14": 8, "RSP": stack,
            "XMM10": bits(accepted[0]), "XMM11": bits(accepted[1])})
        assert (position == 0x145c54110) == (distance <= 5.0)
        accepted_only_cases += 1
    return dict(shape_helper_cases=helper_cases, harmful_dual_shape_cases=dual_cases,
        ordinary_inlined_shape_cases=ordinary_cases, crystal_either_pose_cases=crystal_cases,
        accepted_only_gaze_occupancy_tower_cases=accepted_only_cases,
        executed_instruction_sites=len(replay.visited), crt_call_seams=crt_calls,
        shapes=["circle", "line", "cone", "donut"],
        external_seams="Only named CRT math returns; original predicate and caller instructions execute.")


def replay_mark_durations(proof, image, pe, graph, source_rows):
    """Execute the current rank-independent Mark/recursive-sequence duration."""
    harness = load_script("mark_duration_replay", ROOT / "scripts/check-revive-choice.py")
    fixture = dict(native_spans=[dict(start=row["virtual_address"], end_exclusive=row["end_exclusive"],
        byte_count=row["byte_count"]) for row in proof["native_ranges"]],
        constants=[dict(start=row["virtual_address"], byte_count=row["byte_count"]) for row in proof["native_data"]])
    replay = harness.Replay(image, pe, fixture)
    # Keep original immutable pointers and child strides. These are read-only
    # memory views of the selected EXE, never copied game files on disk.
    for record in graph["actions"]:
        start = int(record["record"]["va"], 16)
        for page in range(start & ~4095, (start + 48 + 4095) & ~4095, 4096):
            if not any(first <= page <= last for first, last, _ in replay.u.mem_regions()):
                replay.u.mem_map(page, 4096)
                off = pe.rva_offset(page - pe.image_base)
                replay.u.mem_write(page, image[off:off + 4096])
    stack, returned, synthetic, children = (replay.heap + offset for offset in (0xe008, 0xff00, 0x4000, 0x5000))
    replay.put(returned, "B", 0xcc)
    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    decode = lambda word: struct.unpack("<f", struct.pack("<I", word))[0]
    source_durations = [decode(int(re.search(r"duration: f32::from_bits\(0x([0-9a-f]+)\)", row)[1], 16)) for row in source_rows]

    def source_duration(index):
        record = graph["actions"][index]
        if record["native_tag"] == 11:
            return max(decode(record["words"][4]), f32(f32(decode(record["words"][2]) / 7.0) + .5))
        if record["native_tag"] == 18:
            return f32(source_duration(record["children"][-1]) + f32(f32(len(record["children"]) - 1) * decode(record["words"][4]))) if record["children"] else 0.0
        return source_durations[index]

    def native(address, rank=0):
        replay.put(stack, "Q", returned)
        replay.run(0x145af1fb0, (returned,), {"RCX": address, "RSP": stack, "R15": rank})
        return decode(replay.u.reg_read(replay.reg.UC_X86_REG_XMM0) & 0xffffffff)

    cases, mark_cases, sequence_cases = 0, 0, 0
    for record in graph["actions"]:
        if record["native_tag"] not in (11, 18):
            continue
        expected = source_duration(record["index"])
        actual = native(int(record["record"]["va"], 16))
        assert actual == expected, (record["index"], record["native_tag"], actual, expected)
        mark_cases += int(record["native_tag"] == 11)
        sequence_cases += int(record["native_tag"] == 18)
        cases += 1
    second_mark = int(graph["actions"][216]["record"]["va"], 16)
    for rank in range(6):
        assert native(second_mark, rank) == source_duration(216)
        cases += 1
    # Empty, one-child and multi-child native18 records. An earlier child has
    # a deliberately longer windup: the native result still uses only the last.
    for count, spacing in itertools.product((0, 1, 2, 3), (0.0, .25, 2.0)):
        replay.u.mem_write(synthetic, bytes(48))
        replay.put(synthetic, "QQf", children, count, spacing)
        replay.put(synthetic + 45, "B", 18)
        for index in range(count):
            words = graph["actions"][216]["words"].copy()
            if index != count - 1:
                words[4] = struct.unpack("<I", struct.pack("<f", 20.0))[0]
            replay.put(children + index * 48, "12I", *words)
        expected = f32(source_duration(216) + f32((count - 1) * spacing)) if count else 0.0
        assert native(synthetic) == expected
        cases += 1
    source = re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", (ROOT / "crates/azeroth-survivors-re/src/bosses/raid_native_catalog.rs").read_text()))
    method = source.split("pubfnblocking_duration(", 1)[1].split("pubfnnative_action(", 1)[0]
    for statement in ("11=>f32::from_bits(self.words[4]).max(f32::from_bits(self.words[2])/7.0+0.5)",
        "18=>self.children.last().map_or(0.0,|last|{ACTIONS[*last].blocking_duration()",
        "(self.children.len()-1)asf32*f32::from_bits(self.words[4])", "_=>self.duration"):
        assert statement in method, statement
    for path in ("raid_extra.rs", "raid_sequences.rs", "raid_sequence_areas.rs"):
        source = (ROOT / "crates/azeroth-survivors-re/src/bosses" / path).read_text()
        assert ".blocking_duration()" in source
        assert not re.search(r"raid_block\([^;]+\.duration\)", source)
    return dict(native_instruction_cases=cases, current_mark_records=mark_cases,
        current_sequence_records=sequence_cases, executed_instruction_sites=len(replay.visited),
        recursive_helper_calls="Original native18 self-calls execute without interception",
        scarlet_second_mark_duration=source_duration(216), scarlet_phase_sequence_duration=source_duration(217))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="Write the compact reviewed evidence file")
    parser.add_argument("--marks", action="store_true", help="Check current Mograine/ground-circle contracts")
    parser.add_argument("--python-libs", action="append", default=[],
                        help="Existing package directory beneath this checkout; repeat if needed")
    arguments = parser.parse_args()
    sys.path[:0] = [str(project_path(value)) for value in arguments.python_libs]
    if arguments.marks:
        print(json.dumps(check_marks(arguments.write), indent=2))
        return
    result = inspect()
    text = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if arguments.write:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(text)
    else:
        assert OUT.read_text() == text, "Current evidence/source differs from the reviewed record"
    print("PASS: 493 graph nodes, 60 boss headers, 37 guardian signatures; "
          "262 isolated queue cases skip native tags 12/26; no compiler/game process")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Classify exact Q41 data leads using retained current-target observations.

No compilation, target execution or implicit native discovery. --stage writes
regenerable row inventories and a proposed compact proof under runtime/; default
reproduces and verifies the curated proof. Structural/reference/source-literal
connections do not certify schemas, dynamic aliases, loading or game parity.
"""
import argparse
import bisect
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
from pathlib import PureWindowsPath
import sqlite3
import struct
import subprocess

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script
from shared_native_inventory import open_readonly_uri as open_native_inventory

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
WORK = ROOT / "runtime/q41-data-0.115.0"
KEEP = ROOT / "docs/analysis/evidence/0.115.0/data-classification/manifest.json"
TALENTXP_QUERIES = [
    ("owner",0x14013d690,0x14013eea1,"plan.json","seeds.tsv","rea","talentxp-native-key-domain"),
    ("branch",0x14013e826,0x14013e8cc,"branch-plan.json","branch-seeds.tsv","branch-rea","talentxp-first-consumer"),
    ("receiver",0x142a76aa0,0x142a76d35,"receiver-plan.json","receiver-seeds.tsv","receiver-rea","talent-key-mutable-destination"),
    ("14014b9e0",0x14014b9e0,0x14014be1d,"14014b9e0-plan.json","14014b9e0-seeds.tsv","14014b9e0-rea","talentxp-first-system-caller"),
    ("1401d3d90",0x1401d3d90,0x1401d42b0,"1401d3d90-plan.json","1401d3d90-seeds.tsv","1401d3d90-rea","talentxp-second-system-caller"),
]


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def canonical(name):
    return name.replace("/", "\\").upper()


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--stage", action="store_true")
    ap.add_argument("--prepare-talentxp", action="store_true",help="write/verify only the exact talentxp native inputs and durable plans")
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    print("verified selected EXE",flush=True)
    if args.prepare_talentxp:
        pe = load_script("prepare_data_pe",ROOT/"scripts/inventory-executable.py").PE(image)
        directory = WORK/"talentxp"
        directory.mkdir(parents=True,exist_ok=True)
        for name,start,end,plan_name,seed_name,output_name,label in TALENTXP_QUERIES:
            at = pe.rva_offset(start-pe.image_base)
            binary,seed,plan = directory/(name+".bin"),directory/seed_name,directory/plan_name
            value = dict(target=binary.relative_to(ROOT).as_posix(),output=(directory/output_name).relative_to(ROOT).as_posix(),
                init_timeout=60,timeout=180,open_options=dict(format="raw-binary",architecture="x86_64",entry_point=hex(start)),
                environment=dict(REA_GHIDRA_SEED_FILE=seed.relative_to(ROOT).as_posix()),
                operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=hex(start)),label=label)])
            for path,raw in [(binary,image[at:at+end-start]),(seed,f"{start:#x}\tfunction\n{start:#x}\tcode\n".encode()),
                             (plan,(json.dumps(value,indent=2)+"\n").encode())]:
                if path.exists(): assert path.read_bytes() == raw,f"Refuse changed query input: {path}"
                else: path.write_bytes(raw)
            print("./scripts/rea query "+plan.relative_to(ROOT).as_posix())
        return
    base = ROOT / "runtime/coverage" / SHA
    queue_path = ROOT / "docs/analysis/evidence/0.115.0/unknown-recovery.json"
    queue = json.loads(queue_path.read_text())
    inputs = []

    def checked(record):
        path = ROOT / record["path"]
        assert file_sha256(path) == record["sha256"], record["path"]
        inputs.append(commitment(path))
        return path

    inventory = json.loads(checked(queue["inputs"]["native-summary"]["inventory"]).read_text())
    range_summary_path = ROOT/"docs/analysis/coverage/file-range-summary.json"
    range_summary = json.loads(range_summary_path.read_text())
    assert range_summary["target"]["sha256"] == SHA
    inputs.append(commitment(range_summary_path))
    ledger = json.loads(checked(range_summary["ledger"]).read_text())
    pe = load_script("current_data_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    image_base = pe.image_base
    intervals = [dict(r, ghidra_reference_count=0, encoded_reference_count=0,
                      relocation_slot_count=0, relocation_destination_count=0,
                      candidate_count=0, special_references=[])
                 for r in ledger["ranges"] if r["lead_id"] in ["Q41-B02", "Q41-B03", "Q41-B05"]]
    assert len(intervals) == 25 and not any(r["lead_id"] == "Q41-B04" for r in ledger["ranges"])
    starts = []
    for row in intervals:
        at, end = row["file_start"], row["file_end_exclusive"]
        assert digest(image[at:end]) == row["sha256"]
        row["preferred_va_start"] = image_base + row.get("rva_start", at)
        row["preferred_va_end_exclusive"] = row["preferred_va_start"] + end - at
        starts.append(row["preferred_va_start"])
        directories = row["directory_indices"]
        if row["lead_id"] == "Q41-B05":
            row["classification"] = ("zero_header_slack_static_observation_only" if row["structural_class"] == "header_slack_unknown"
                else "DOS_stub_and_Rich_toolchain_metadata_context" if row["structural_class"] == "dos_stub_unknown"
                else "PE32_plus_header_format_context")
        elif row["lead_id"] == "Q41-B03":
            assert image[at:end] == bytes(end-at)
            row["classification"] = "zero_raw_alignment_tail_static_observation_only"
        elif directories:
            row["classification"] = {1:"PE_import_descriptors_context",2:"PE_resource_directory_context",
                3:"PE_x64_runtime_function_table_context",5:"PE_base_relocation_directory_context",
                6:"PE_debug_directory_context",9:"PE_TLS_directory_context",
                10:"PE_load_configuration_context",12:"PE_import_address_table_context"}[directories[0]]
        else:
            row["classification"] = "mixed_readonly_data_schemas_and_AS_consumers_unresolved" if row["section"] == ".rdata" else "mutable_data_schemas_and_AS_consumers_unresolved"

    def interval(address):
        j = bisect.bisect_right(starts, address)-1
        return intervals[j] if j >= 0 and address < intervals[j]["preferred_va_end_exclusive"] else None

    def section(address):
        return next((s["name"] for s in inventory["pe"]["sections"]
                     if image_base+s["rva"] <= address < image_base+s["rva"]+s["virtual_size"]),
                    "PE_headers" if image_base <= address < image_base+1024 else "outside_virtual_sections")

    load_config_rva,load_config_size = pe.directories[10]
    load_config_at = pe.rva_offset(load_config_rva)
    load_config_pointer_slots = []
    for offset in [0x70,0x78]:
        slot = struct.unpack_from("<Q",image,load_config_at+offset)[0]
        encoded_destination = struct.unpack_from("<Q",image,pe.rva_offset(slot-image_base))[0]
        load_config_pointer_slots.append(dict(directory_field_rva=load_config_rva+offset,
            pointer_slot_va=slot,encoded_target_va=encoded_destination,classification="PE_load_configuration_indirection_slot_context"))
    assert [r["pointer_slot_va"] for r in load_config_pointer_slots] == [0x145eb8e50,0x145eb8e60]
    load_config_slot_addresses = {r["pointer_slot_va"] for r in load_config_pointer_slots}

    candidates = []
    for category, selector in queue["embedded_candidate_selectors"].items():
        values = inventory["embedded_candidates"][category]
        assert len(values) == selector["records"]
        for ordinal, original in enumerate(values):
            row = dict(original, selector=f"Q41-I01:{category}:{ordinal}", category=category,
                       source_literal_occurrences=[], ghidra_incoming=[], encoded_incoming=[], relocation_incoming=[])
            at = int(row["file_offset"],16)
            assert image[at:at+row["byte_count"]] == row["literal"].encode() and digest(image[at:at+row["byte_count"]]) == row["sha256"]
            row["section"] = section(int(row["virtual_address"],16))
            owner = interval(int(row["virtual_address"],16))
            if owner: owner["candidate_count"] += 1
            candidates.append(row)
    candidates.sort(key=lambda r:(int(r["virtual_address"],16),r["selector"]))
    executable_text_proofs = []
    for selector,role,observations,recovered in [
        ("Q41-I01:game_binding_identifier:0","regex_spans_immediate_and_opcode_native_AZS_OPENLEVELS_comparison",
            [(0x1400a4d49,"48837a100e","cmp qword ptr [rdx+0x10],14"),
             (0x1400a4d58,"48b8415a535f4f50454e","movabs rax,AZS_OPEN bytes"),
             (0x1400a4d62,"493300","xor rax,qword ptr [r8]"),
             (0x1400a4d65,"48b9454e4c4556454c53","movabs rcx,ENLEVELS bytes"),
             (0x1400a4d6f,"49334806","xor rcx,qword ptr [r8+6]"),
             (0x1400a4d73,"4809c1","or rcx,rax")],"AZS_OPENLEVELS"),
        ("Q41-I01:save_configuration_key_lead:0","runtime_JSON_context_talent_patch_key_not_save_format",
            [(0x14013e085,"48b974616c656e747870","movabs rcx,talentxp bytes"),
             (0x14013e08f,"483908","cmp qword ptr [rax],rcx"),
             (0x14013e092,"0f848e070000","je 0x14013e826")],"talentxp")]:
        row = next(r for r in candidates if r["selector"] == selector)
        verified = []
        for va,encoded,meaning in observations:
            at = pe.rva_offset(va-image_base)
            assert image[at:at+len(bytes.fromhex(encoded))] == bytes.fromhex(encoded)
            verified.append(dict(address=hex(va),bytes=encoded,observed_instruction=meaning))
        row["executable_text_classification"] = dict(classification=role,recovered_text=recovered,
            observations=verified,limit="Only native operand spelling/comparison. Request dispatch, key domain, producers/consumers and whole source behavior require separate evidence.")
        executable_text_proofs.append(dict(selector=selector,**row["executable_text_classification"]))
    talentxp_native_queries = []
    for name,start,end,plan_name,seed_name,output_name,label in TALENTXP_QUERIES:
        directory = WORK/"talentxp"
        at = pe.rva_offset(start-image_base)
        expected = digest(image[at:at+end-start])
        assert (directory/(name+".bin")).read_bytes() == image[at:at+end-start]
        journal = json.loads((directory/output_name/"journal.json").read_text())
        operation, = journal["operations"].values()
        assert operation["status"] == "completed"
        result_path = ROOT/operation["result"]["path"]
        assert file_sha256(result_path) == operation["result"]["sha256"]
        evidence = json.loads(result_path.read_text())["structuredContent"]
        assert evidence["subject"]["digest"]["sha256"] == expected
        talentxp_native_queries.append(dict(role=label,start=hex(start),end_exclusive=hex(end),sha256=expected,
            evidence_id=evidence["evidence_id"],result=commitment(result_path),plan=commitment(directory/plan_name),seed=commitment(directory/seed_name)))
    location_at = pe.rva_offset(0x146426a98-image_base)
    path_va,path_length,line,column = struct.unpack_from("<QQII",image,location_at)
    path_at = pe.rva_offset(path_va-image_base)
    native_path = image[path_at:path_at+path_length]
    path_components = [part for part in native_path.replace(b"\\",b"/").split(b"/") if part]
    assert path_components[-4:] == [b"serde_json-1.0.150",b"src",b"value",b"index.rs"]
    assert (line,column) == (102,18)
    literal_at = pe.rva_offset(0x145ef4cb4-image_base)
    assert image[literal_at:literal_at+6] == b"talent"
    talentxp_context_mutations = []
    for va,encoded,meaning in [(0x14013e826,"488b85b0010000","accepted-request change tick pointer"),
        (0x14013e83c,"418038ff","context absent sentinel guard"),
        (0x14013e86b,"ba06000000","six-byte target JSON key length"),
        (0x14013e870,"488d0d3d64db05","target JSON key talent"),
        (0x14013e877,"e824829302","serde_json string index_into_mut boundary"),
        (0x14013e887,"e8844feeff","drop previous JSON Value"),
        (0x14013e8a3,"0f114810","copy queued JSON Value upper16 bytes"),
        (0x14013e8a7,"f30f7f00","copy queued JSON Value lower16 bytes"),
        (0x14013e8c1,"ff80e4000000","increment context revision at offset0xe4")]:
        at = pe.rva_offset(va-image_base)
        assert image[at:at+len(bytes.fromhex(encoded))] == bytes.fromhex(encoded)
        talentxp_context_mutations.append(dict(address=hex(va),bytes=encoded,observation=meaning))
    talentxp_domain = dict(selector="Q41-I01:save_configuration_key_lead:0",classification="runtime_JSON_context_patch_not_save_format",
        input_key="talentxp",target_JSON_key="talent",source_location=dict(preferred_va="0x146426a98",
            identified_dependency_suffix="serde_json-1.0.150/src/value/index.rs",file_path_byte_count=path_length,
            file_path_sha256=digest(native_path),line=line,column=column),
        behavior="With an active context, replace context[talent] with the queued32-byte JSON Value, drop the old Value and increment context revision. No numeric XP calculation or save serialization is established.",
        observations=talentxp_context_mutations,queries=talentxp_native_queries,
        direct_callers=[dict(site="0x14014bd2b",owner="0x14014b9e0"),dict(site="0x1401d4107",owner="0x1401d3d90")],
        limits=["Two external jump tables are not loaded by the raw whole-owner query. The branch query establishes the first consumer and ends at its selected continuation boundary; neither is complete whole-function semantic recovery.",
            "The destination helper is shared serde_json object indexing, and callers are resource/change-tick adapters. Generic serde/ECS implementation is context, not an engine reconstruction task.",
            "The request producer, full queued-value schema and downstream talent UI/progression/source behavior remain separate missing AS connections. Do not call this a save-format field or infer numeric talent XP behavior from its spelling."])
    candidate_starts = [int(r["virtual_address"],16) for r in candidates]
    max_length = max(r["byte_count"] for r in candidates)
    api = json.loads((ROOT/"docs/analysis/evidence/0.115.0/discovery-delta.json").read_text())["embedded_api"]
    api_start = int(api["virtual_address"],16)
    assert digest(image[int(api["file_offset"],16):int(api["file_offset"],16)+api["byte_count"]]) == api["sha256"]
    source_xml = []
    for path in sorted((ROOT/"crates/benilla-app/assets/ui").glob("*.xml")):
        raw = path.read_bytes()
        variants = [("literal_source_bytes",raw),("LF_to_CRLF_only",raw.replace(b"\r\n",b"\n").replace(b"\n",b"\r\n"))]
        matches = []
        for normalization,payload in variants:
            at = image.find(payload)
            if at >= 0: matches.append(dict(normalization=normalization,file_offset=at,preferred_va=pe.offset_va(at),byte_count=len(payload),sha256=digest(payload)))
        source_xml.append(dict(source=commitment(path),native_payload_matches=matches,
            classification="embedded_engine_XML_payload_byte_equivalence_observed" if matches else "engine_XML_source_payload_not_whole_byte_revalidated"))

    # Rust string slices can point before a regex lead (e.g. its mpq: URI
    # prefix), or contain many Lua declarations. Retain exact pointer/length
    # byte candidates separately rather than inventing substring xrefs.
    string_slices = []
    for rva,kind,value in inventory["pe"]["base_relocation_records"]["records"]:
        if kind != 10: continue
        at = pe.rva_offset(rva)
        length = struct.unpack_from("<Q",image,at+8)[0]
        if not 1 <= length <= 1048576: continue
        lo = bisect.bisect_left(candidate_starts,value)
        hi = bisect.bisect_right(candidate_starts,value+length-1)
        contained = [r for r in candidates[lo:hi] if int(r["virtual_address"],16)+r["byte_count"] <= value+length]
        if not contained: continue
        try: source_at = pe.rva_offset(value-image_base)
        except ValueError: continue
        raw = image[source_at:source_at+length]
        if len(raw) != length or any(b < 32 and b not in [9,10,13] for b in raw): continue
        try: raw.decode("utf-8")
        except UnicodeDecodeError: continue
        string_slices.append(dict(selector=f"encoded-pointer-length:{rva:x}",descriptor_rva=rva,
            preferred_va=value,end_exclusive=value+length,byte_count=length,sha256=digest(raw),
            candidate_selectors=[r["selector"] for r in contained],ghidra_incoming=[],encoded_incoming=[],
            descriptor_ghidra_incoming=[],descriptor_encoded_incoming=[],
            role="encoded_pointer_u64_length_UTF8_candidate_not_recovered_native_type"))
    containers = [dict(selector="exact-current-AS-addon-API",preferred_va=api_start,
        byte_count=api["byte_count"],sha256=api["sha256"],role="exact_current_AS_API_artifact_payload")]
    for xml in source_xml:
        for match in xml["native_payload_matches"]:
            containers.append(dict(selector="source-XML:"+xml["source"]["path"],preferred_va=match["preferred_va"],
                byte_count=match["byte_count"],sha256=match["sha256"],role="exact_engine_XML_payload_after_explicit_line_ending_normalization"))
    for container in containers:
        value,length = container["preferred_va"],container["byte_count"]
        lo,hi = bisect.bisect_left(candidate_starts,value),bisect.bisect_right(candidate_starts,value+length-1)
        string_slices.append(dict(container,descriptor_rva=None,end_exclusive=value+length,
            candidate_selectors=[r["selector"] for r in candidates[lo:hi] if int(r["virtual_address"],16)+r["byte_count"] <= value+length],
            ghidra_incoming=[],encoded_incoming=[],descriptor_ghidra_incoming=[],descriptor_encoded_incoming=[]))
    string_slices.sort(key=lambda r:(r["preferred_va"],r["descriptor_rva"] or -1))
    slice_starts = [r["preferred_va"] for r in string_slices]
    max_slice_length = max((r["byte_count"] for r in string_slices),default=0)
    def matching_slices(address):
        lo = bisect.bisect_right(slice_starts,address-max_slice_length)
        hi = bisect.bisect_right(slice_starts,address)
        return [r for r in string_slices[lo:hi] if address < r["end_exclusive"]]
    descriptors = sorted((image_base+r["descriptor_rva"],index) for index,r in enumerate(string_slices) if r["descriptor_rva"] is not None)
    descriptor_starts = [r[0] for r in descriptors]
    def matching_descriptors(address):
        lo,hi = bisect.bisect_right(descriptor_starts,address-16),bisect.bisect_right(descriptor_starts,address)
        return [string_slices[index] for _,index in descriptors[lo:hi]]

    def matching(address):
        lo = bisect.bisect_right(candidate_starts,address-max_length)
        hi = bisect.bisect_right(candidate_starts,address)
        return [r for r in candidates[lo:hi] if address < int(r["virtual_address"],16)+r["byte_count"]]

    artifacts = queue["inputs"]["ghidra-census"]["execution_artifacts"]
    body_path = checked(artifacts["bodies.tsv.gz"])
    bodies = []
    with gzip.open(body_path,"rt") as stream:
        for row in csv.DictReader(stream,delimiter="\t"):
            if row["external"] == "false": bodies.append((int(row["start"],16),int(row["end"],16),row["entry"]))
    bodies.sort()
    body_starts = [r[0] for r in bodies]

    def body(address):
        j = bisect.bisect_right(body_starts,address)-1
        return bodies[j][2] if j >= 0 and address <= bodies[j][1] else None

    reference_path = checked(artifacts["references.tsv.gz"])
    reference_count = 0
    for row in csv.DictReader(gzip.open(reference_path,"rt"),delimiter="\t"):
        reference_count += 1
        if ":" in row["to"]: continue
        destination = int(row["to"],16)
        owner = interval(destination)
        if owner:
            owner["ghidra_reference_count"] += 1
            if owner["lead_id"] != "Q41-B02": owner["special_references"].append(dict(inventory="ghidra",**row))
        hits = matching(destination)
        slice_hits = matching_slices(destination)
        descriptor_hits = matching_descriptors(destination)
        if hits or slice_hits or descriptor_hits:
            enriched = dict(row, source_flow_body=body(int(row["from"],16)))
            for candidate in hits: candidate["ghidra_incoming"].append(enriched)
            for string_slice in slice_hits: string_slice["ghidra_incoming"].append(enriched)
            for string_slice in descriptor_hits: string_slice["descriptor_ghidra_incoming"].append(enriched)
    assert reference_count == queue["inputs"]["ghidra-census"]["counts"]["references"]
    print(f"joined all {reference_count} Ghidra references",flush=True)
    encoded_counts = {}
    for name in ["instruction-summary", "unwind-complement-summary"]:
        database = checked(queue["inputs"][name]["inventory"])
        n = 0
        with open_native_inventory(f"file:{database}?mode=ro",uri=True) as db:
            db.execute("PRAGMA temp_store=MEMORY")
            for site,kind,target_value in db.execute("SELECT site,kind,target FROM refs ORDER BY rowid"):
                n += 1
                if target_value is None: continue
                try: destination = int(target_value,16)
                except ValueError: continue
                owner = interval(destination)
                record = dict(site=hex(site),kind=kind,target=target_value,source_flow_body=body(site))
                if owner:
                    owner["encoded_reference_count"] += 1
                    if owner["lead_id"] != "Q41-B02": owner["special_references"].append(dict(inventory=name,**record))
                for candidate in matching(destination): candidate["encoded_incoming"].append(dict(inventory=name,**record))
                for string_slice in matching_slices(destination): string_slice["encoded_incoming"].append(dict(inventory=name,**record))
                for string_slice in matching_descriptors(destination): string_slice["descriptor_encoded_incoming"].append(dict(inventory=name,**record))
        encoded_counts[name] = n
        print(f"joined all {n} {name} reference rows",flush=True)

    outputs = {}
    def save(name,rows):
        path = WORK / name
        path.parent.mkdir(parents=True,exist_ok=True)
        h,n,size = hashlib.sha256(),0,0
        with path.open("wb" if args.stage else "rb") as stream:
            for row in rows:
                raw = (json.dumps(row,ensure_ascii=False,separators=(",",":"))+"\n").encode()
                h.update(raw); n += 1; size += len(raw)
                if args.stage: stream.write(raw)
                else: assert stream.read(len(raw)) == raw,name
            if not args.stage: assert not stream.read(1),name
        outputs[name] = dict(path=path.relative_to(ROOT).as_posix(),records=n,bytes=size,sha256=h.hexdigest())

    relocation_classes = Counter()
    def relocations():
        for rva,kind,value in inventory["pe"]["base_relocation_records"]["records"]:
            assert kind == 10 and struct.unpack_from("<Q",image,pe.rva_offset(rva))[0] == value
            owner = interval(image_base+rva)
            if owner: owner["relocation_slot_count"] += 1
            dest_owner = interval(value)
            if dest_owner: dest_owner["relocation_destination_count"] += 1
            classification = (section(image_base+rva), section(value))
            relocation_classes[classification] += 1
            hits = matching(value)
            record = dict(site_rva=rva,kind=kind,encoded_u64=value,slot_section=classification[0],destination_section=classification[1],candidate_selectors=[r["selector"] for r in hits])
            for candidate in hits: candidate["relocation_incoming"].append(dict(site_rva=rva,kind=kind,encoded_u64=value))
            yield record
    save("relocation-classification.jsonl",relocations())
    save("string-containers.jsonl",string_slices)
    print(f"verified all {sum(relocation_classes.values())} encoded relocation slots",flush=True)

    # Parse every unique standard Windows x64 unwind prefix. Handler-specific
    # language data beyond that prefix is deliberately left unresolved.
    unwind_prefixes,unwind_spans = [],[]
    unwind_versions,unwind_flags = Counter(),Counter()
    for rva in sorted({r[2] for r in inventory["pe"]["runtime_function_records"]["records"]}):
        at = pe.rva_offset(rva)
        first,prolog,count,frame = struct.unpack_from("<BBBB",image,at)
        version,flags = first&7,first>>3
        assert version == 1
        n = (4+count*2+3)&~3
        record = dict(rva=rva,file_offset=at,version=version,flags=flags,prolog_size=prolog,
            unwind_code_slots=count,frame_register=frame&15,frame_offset=frame>>4)
        if flags&4:
            record["chained_runtime_function"] = list(struct.unpack_from("<III",image,at+n))
            n += 12
        elif flags&3:
            handler = struct.unpack_from("<I",image,at+n)[0]
            record["exception_handler_rva"] = handler
            record["handler_section"] = section(image_base+handler)
            record["language_specific_handler_data_status"] = "unresolved_not_part_of_standard_prefix"
            n += 4
        assert at+n <= len(image)
        record.update(byte_count=n,sha256=digest(image[at:at+n]))
        unwind_prefixes.append(record);unwind_spans.append((at,at+n));unwind_versions[version] += 1;unwind_flags[flags] += 1
    save("unwind-record-prefixes.jsonl",unwind_prefixes)
    unwind_union = []
    for a,b in sorted(unwind_spans):
        if unwind_union and a <= unwind_union[-1][1]: unwind_union[-1] = (unwind_union[-1][0],max(b,unwind_union[-1][1]))
        else: unwind_union.append((a,b))
    unwind_union_vas = [(pe.offset_va(a),pe.offset_va(b-1)+1) for a,b in unwind_union]
    unwind_union_starts = [r[0] for r in unwind_union_vas]
    def standard_unwind_source(address):
        j = bisect.bisect_right(unwind_union_starts,address)-1
        return j >= 0 and address < unwind_union_vas[j][1]

    ownerless_path = ROOT/"runtime/q41-ownership-0.115.0/residuals/ownerless-reference-sources.tsv.gz"
    ownerless_input = commitment(ownerless_path)
    assert ownerless_input["sha256"] == "485e342e02ae6db461b9ee647bece6f66459ebcc2b67e109b846bc24a24d0af0"
    ownerless_domains,ownerless_kinds = Counter(),Counter()
    ownerless_sites = set()
    with gzip.open(ownerless_path,"rt") as stream:
        for row in csv.DictReader(stream,delimiter="\t"):
            source = int(row["from"],16)
            assert not row["source_owner"] and body(source) is None
            ownerless_sites.add(source)
            owner = interval(source)
            domain = section(source)
            if standard_unwind_source(source): role = "standard_x64_unwind_prefix_metadata"
            elif source in load_config_slot_addresses: role = "PE_load_configuration_indirection_slot_context"
            elif domain == ".text": role = "executable_section_source_without_flow_body_not_proved_instruction"
            elif owner and owner["directory_indices"]: role = owner["classification"]
            elif domain == "PE_headers": role = "PE_header_data_reference"
            else: role = "data_or_metadata_source_without_function_body_expected"
            ownerless_domains[(domain,role)] += 1
            ownerless_kinds[row["type"]] += 1
    assert sum(ownerless_domains.values()) == 775329
    ownerless_proof = dict(input=ownerless_input,records=sum(ownerless_domains.values()),unique_source_sites=len(ownerless_sites),
        domains=[dict(section=k[0],classification=k[1],records=v) for k,v in sorted(ownerless_domains.items())],reference_types=dict(sorted(ownerless_kinds.items())),
        limit="A reference outside a function body is not automatically a missing executable instruction. Platform metadata, data and executable-section sites remain distinct; computed references and semantic types are not recovered.")

    # Literal reuse is a source route candidate, never a behavioral equivalence proof.
    literals = defaultdict(list)
    for row in candidates: literals[row["literal"]].append(row)
    tracked = set(subprocess.run(["git","ls-files","crates"],cwd=ROOT,check=True,capture_output=True,text=True).stdout.splitlines())
    patterns = WORK/"source-literal-patterns.txt"
    assert all("\n" not in literal and "\r" not in literal for literal in literals)
    patterns.write_text("\n".join(literals)+"\n")
    command = ["rg","--json","--fixed-strings","--file",str(patterns),"--glob","*.rs","--glob","*.lua","--glob","*.xml","--glob","*.toml","crates"]
    process = subprocess.Popen(command,cwd=ROOT,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
    source_matches,related = {},{}
    for line in process.stdout:
        record = json.loads(line)
        if record["type"] != "match": continue
        data = record["data"];name = data["path"]["text"]
        if name not in tracked: continue
        text = data["lines"]["text"]
        for match in data["submatches"]:
            short = match["match"]["text"]
            if short not in related: related[short] = [literal for literal in literals if short in literal]
            for literal in related[short]:
                if literal in text:
                    key = (name,literal)
                    source_matches[key] = min(source_matches.get(key,data["line_number"]),data["line_number"])
    errors = process.stderr.read()
    assert process.wait() in [0,1],errors
    source_files = []
    for name in sorted({key[0] for key in source_matches}): source_files.append(commitment(ROOT/name))
    for (name,literal),line in sorted(source_matches.items()):
        for candidate in literals[literal]: candidate["source_literal_occurrences"].append(dict(path=name,line=line))
    for row in candidates:
        value = row["literal"]
        if row["section"] == ".text":
            role = row["executable_text_classification"]["classification"]
        elif api_start <= int(row["virtual_address"],16) < api_start+api["byte_count"]:
            role = "current_AS_addon_API_script_container"
        elif row["category"] == "module_type_namespace":
            role = "AS_namespace_label_not_type_or_dispatch_proof" if value.startswith("wenilla_rogue") else "engine_or_dependency_namespace_context"
        elif row["source_literal_occurrences"] and all(r["path"].startswith("crates/benilla-") for r in row["source_literal_occurrences"]):
            role = "existing_engine_source_literal_context_native_consumer_unresolved"
        elif row["source_literal_occurrences"]:
            role = "source_literal_connection_native_schema_or_consumer_unresolved"
        else:
            role = "embedded_lead_schema_or_consumer_unresolved"
        row["classification"] = role
    save("embedded-classification.jsonl",candidates)
    print("classified all embedded/source/ownerless-reference records",flush=True)

    mpq_reader = ROOT/"scripts/check-minimap-lifecycle.py"
    mpq = load_script("current_data_mpq",mpq_reader)
    records = sorted(target["runtime_data"]["archives"],key=lambda r:(not r["path"].lower().endswith("/patch.mpq"),r["path"].lower()))
    members, archives, by_name = [], [], defaultdict(list)
    for priority,record in enumerate(records):
        archive = mpq.Archive(record["path"])
        assert archive.size == record["size_bytes"] and file_sha256(archive.path) == record["sha256"]
        listed = archive.read(archive.lookup("(listfile)"))
        names = [s.strip() for s in listed.decode("utf-8-sig").splitlines() if s.strip()]
        assert len(set(map(canonical,names))) == len(names)
        names = sorted(set(names+["(listfile)"]),key=canonical)
        hashes = defaultdict(list)
        for name in names: hashes[(mpq.name_hash(name,0x100),mpq.name_hash(name,0x200))].append(name)
        opaque,used_blocks = [],set()
        for slot,(ha,hb,locale,platform,index) in enumerate(struct.iter_unpack("<IIHHI",archive.hashes)):
            if index in [0xffffffff,0xfffffffe]: continue
            offset,packed,size,flags = struct.unpack_from("<IIII",archive.blocks,index*16)
            assert flags&0x80000000 and offset+packed <= archive.size
            aliases = hashes.get((ha,hb),[])
            if not aliases: opaque.append(slot)
            for alias in aliases: assert archive.lookup(alias) == (offset,packed,size,flags)
            row = dict(archive=record["path"],source_priority=priority,hash_slot=slot,hash_a=hex(ha),hash_b=hex(hb),locale=locale,platform=platform,block_index=index,file_offset=offset,packed_bytes=packed,uncompressed_bytes=size,flags=hex(flags),names=aliases)
            members.append(row); used_blocks.add(index)
            for alias in aliases: by_name[canonical(alias)].append(row)
        all_blocks = {i for i,r in enumerate(struct.iter_unpack("<IIII",archive.blocks)) if r[3]&0x80000000}
        archives.append(dict(**record,source_priority=priority,listfile_sha256=digest(listed),hash_table_sha256=digest(archive.hashes),block_table_sha256=digest(archive.blocks),listed_names=len(names),opaque_hash_slots=opaque,blocks_without_active_hash=sorted(all_blocks-used_blocks)))
        print(f"verified archive {record['path']}",flush=True)
    save("mpq-members.jsonl",members)
    resolved = []
    for name, occurrences in sorted(by_name.items()):
        highest = max(r["source_priority"] for r in occurrences)
        winners = [r for r in occurrences if r["source_priority"] == highest]
        resolved.append(dict(name=name,occurrences=len(occurrences),source_archive=winners[0]["archive"],source_hash_slots=[r["hash_slot"] for r in winners],overridden_archives=sorted({r["archive"] for r in occurrences if r["source_priority"] < highest})))
    save("source-overrides.jsonl",resolved)
    basenames = defaultdict(list)
    for name in by_name: basenames[PureWindowsPath(name).name].append(name)
    resource_leads = []
    for row in candidates:
        if row["category"] != "resource_path": continue
        literal = row["literal"]
        key = canonical(literal)
        at = int(row["file_offset"],16)
        # URI prefix extension is byte-observed, not heuristic slash trimming.
        observed_uri = "mpq:"+literal if image[at-4:at] == b"mpq:" else None
        uri_member = canonical(observed_uri[6:]) if observed_uri and observed_uri.startswith("mpq://") else None
        exact = key if key in by_name else uri_member if uri_member in by_name else None
        basename_candidates = basenames.get(PureWindowsPath(key).name,[]) if not exact else []
        resource_leads.append(dict(selector=row["selector"],literal_sha256=row["sha256"],literal=literal,observed_complete_uri=observed_uri,exact_member=exact,basename_candidates=basename_candidates,
            classification="exact_named_member_bytes_observed_not_mount_or_schema_proof" if exact else "basename_candidate_requires_native_path_producer" if basename_candidates else "no_exact_member_native_path_producer_unresolved"))
    save("resource-leads.jsonl",resource_leads)
    reader_start,reader_end = 0x145d13cc4,0x145d13d5c
    reader_observations = [(0x145d13ccb,"b84d5a0000","mov eax,0x5a4d"),
        (0x145d13cea,"813950450000","cmp dword ptr [rcx],0x4550"),
        (0x145d13cf2,"b80b020000","mov eax,0x20b"),
        (0x145d13d13,"4c8d0cca","lea r9,[rdx+rcx*8]"),
        (0x145d13d43,"837a2400","cmp dword ptr [rdx+0x24],0")]
    header_reader = dict(start=hex(reader_start),end_exclusive=hex(reader_end),
        sha256="60958f1e795c7dd0d11af33c5872f52651b1ad2901ad760f32effe3a25f167bf",
        observations=[dict(address=hex(a),bytes=h,instruction=t) for a,h,t in reader_observations],
        classification="PE_header_validation_and_section_characteristic_context_no_AS_contract",
        one_past_section_table_bound="0x145d13d13 forms section_table_end 0x140000300; no slack byte read")
    reader_at = pe.rva_offset(reader_start-image_base)
    assert digest(image[reader_at:reader_at+reader_end-reader_start]) == header_reader["sha256"]
    for observation in header_reader["observations"]:
        at = pe.rva_offset(int(observation["address"],16)-image_base)
        assert image[at:at+len(bytes.fromhex(observation["bytes"]))] == bytes.fromhex(observation["bytes"])

    header_offset = struct.unpack_from("<I",image,0x3c)[0]
    optional = header_offset+24
    assert image[:2] == b"MZ" and image[header_offset:header_offset+4] == b"PE\0\0"
    machine,count = struct.unpack_from("<HH",image,header_offset+4)
    optional_bytes = struct.unpack_from("<H",image,header_offset+20)[0]
    assert (machine,count,optional_bytes) == (0x8664,6,240)
    assert struct.unpack_from("<H",image,optional)[0] == 0x20b
    assert optional+optional_bytes+count*40 == 0x300 and struct.unpack_from("<I",image,optional+60)[0] == 0x400
    assert image[0x300:0x400] == bytes(256)
    assert image[0x40:0x4e].hex() == "0e1fba0e00b409cd21b8014ccd21"
    assert image[0x4e:0x4e+len(b"This program cannot be run in DOS mode.\r\r\n$")] == b"This program cannot be run in DOS mode.\r\r\n$"
    rich = image.index(b"Rich",0x40,header_offset)
    key = struct.unpack_from("<I",image,rich+4)[0]
    assert struct.unpack_from("<I",image,0x80)[0]^key == int.from_bytes(b"DanS","little")
    # Walk every PE resource directory/leaf. These are platform resources,
    # not a claim about MPQ/world/UI resource semantics.
    resource_rva,resource_size = pe.directories[2]
    resource_at = pe.rva_offset(resource_rva)
    resource_nodes, resource_leaves = [],[]
    def resource_name(value):
        if not value&0x80000000: return dict(id=value)
        at = resource_at+(value&0x7fffffff)
        n = struct.unpack_from("<H",image,at)[0]
        assert resource_at <= at < at+2+n*2 <= resource_at+resource_size
        return dict(text=image[at+2:at+2+n*2].decode("utf-16-le"))
    def resource_walk(relative,path):
        assert len(path) <= 3
        at = resource_at+relative
        assert resource_at <= at < at+16 <= resource_at+resource_size
        named,ids = struct.unpack_from("<HH",image,at+12)
        assert at+16+(named+ids)*8 <= resource_at+resource_size
        resource_nodes.append(dict(relative_offset=relative,path=path,named_entries=named,id_entries=ids))
        for index in range(named+ids):
            name,value = struct.unpack_from("<II",image,at+16+index*8)
            next_path = path+[resource_name(name)]
            if value&0x80000000: resource_walk(value&0x7fffffff,next_path)
            else:
                assert len(next_path) == 3
                entry = resource_at+value
                assert resource_at <= entry < entry+16 <= resource_at+resource_size
                rva,size,codepage,reserved = struct.unpack_from("<IIII",image,entry)
                payload_at = pe.rva_offset(rva)
                assert payload_at+size <= len(image) and reserved == 0
                raw = image[payload_at:payload_at+size]
                type_id = next_path[0].get("id")
                role = {3:"PE_icon_image",14:"PE_group_icon",16:"PE_version",24:"PE_application_manifest"}.get(type_id,"PE_resource_type_unclassified")
                resource_leaves.append(dict(path=next_path,data_entry_relative_offset=value,payload_rva=rva,
                    file_offset=payload_at,byte_count=size,sha256=digest(raw),codepage=codepage,classification=role))
    resource_walk(0,[])
    resource_groups = []
    for leaf in resource_leaves:
        if leaf["path"][0].get("id") != 14: continue
        at = leaf["file_offset"]
        reserved,kind,n = struct.unpack_from("<HHH",image,at)
        assert (reserved,kind) == (0,1) and 6+14*n == leaf["byte_count"]
        entries = []
        for index in range(n):
            width,height,colors,zero,planes,depth,size,resource_id = struct.unpack_from("<BBBBHHIH",image,at+6+14*index)
            icons = [r for r in resource_leaves if r["path"][0].get("id") == 3 and r["path"][1].get("id") == resource_id and r["path"][2] == leaf["path"][2]]
            assert len(icons) == 1 and icons[0]["byte_count"] == size and zero == 0
            entries.append(dict(resource_id=resource_id,width=width or 256,height=height or 256,planes=planes,bit_depth=depth,byte_count=size,payload_sha256=icons[0]["sha256"]))
        resource_groups.append(dict(path=leaf["path"],entries=entries))
    tls_rva,tls_size = pe.directories[9]
    assert tls_size == 40
    tls_at = pe.rva_offset(tls_rva)
    tls_raw_start,tls_raw_end,tls_index,tls_callback_array,tls_zero_fill,tls_flags = struct.unpack_from("<QQQQII",image,tls_at)
    callback_at = pe.rva_offset(tls_callback_array-image_base)
    callbacks = []
    while (address := struct.unpack_from("<Q",image,callback_at)[0]):
        callbacks.append(dict(preferred_va=address,section=section(address),flow_body=body(address)))
        callback_at += 8
        assert len(callbacks) < 1024
    directory_details = dict(resource_nodes=resource_nodes,resource_leaves=resource_leaves,icon_groups=resource_groups,
        tls=dict(raw_start=tls_raw_start,raw_end=tls_raw_end,index_pointer=tls_index,callback_array=tls_callback_array,zero_fill=tls_zero_fill,characteristics=tls_flags,callbacks=callbacks),
        import_libraries=len(inventory["pe"]["imports"]),import_functions=sum(len(r["functions"]) for r in inventory["pe"]["imports"]),
        runtime_function_records=len(inventory["pe"]["runtime_function_records"]["records"]),
        debug_entry_count=len(inventory["pe"]["debug"]))
    chain_path = ROOT/"crates/benilla-formats/src/chain.rs"
    chain = chain_path.read_text()
    assert "Ascending priority: later archives win" in chain and "self.archives.iter().rev()" in chain
    result = dict(schema_version=1,target={k:target[k] for k in ["version","path","sha256","size_bytes"]},gap_ids=[41],lead_ids=["Q41-B02","Q41-B03","Q41-B04","Q41-B05","Q41-I01","Q41-R01"],
        generator=commitment(ROOT/"scripts/classify-target-data.py"),inputs=inputs,source_files=source_files,
        intervals=intervals,empty_file_gap_overlay_selector=True,
        directory_details=directory_details,
        header_reader=header_reader,ownerless_reference_sources=ownerless_proof,source_XML_payloads=source_xml,
        load_configuration_pointer_slots=load_config_pointer_slots,executable_text_lead_proofs=executable_text_proofs,
        talentxp_domain=talentxp_domain,
        unwind_context=dict(unique_standard_prefixes=len(unwind_prefixes),versions=dict(unwind_versions),flags=dict(unwind_flags),
            standard_prefix_union_bytes=sum(b-a for a,b in unwind_union),standard_prefix_union_ranges=len(unwind_union),
            limit="Only standard PE unwind prefix/code slots/handler fields. Language-specific handler data and all native/source semantics remain unresolved."),
        header=dict(pe_file_offset=header_offset,machine=machine,sections=count,optional_header_bytes=optional_bytes,entry_rva=struct.unpack_from("<I",image,optional+16)[0],section_table_end=0x300,size_of_headers=0x400,rich_file_offset=rich,rich_xor_key=hex(key)),
        outputs=outputs,archives=archives,mpq_reader=commitment(mpq_reader),source_chain=commitment(chain_path),
        counts=dict(ghidra_references_examined=reference_count,encoded_references_examined=encoded_counts,
            file_intervals_by_lead=dict(Counter(r["lead_id"] for r in intervals)),file_bytes_by_lead={k:sum(r["byte_count"] for r in intervals if r["lead_id"] == k) for k in ["Q41-B02","Q41-B03","Q41-B05"]},
            embedded_categories=dict(Counter(r["category"] for r in candidates)),embedded_classes=dict(Counter(r["classification"] for r in candidates)),
            embedded_with_ghidra_references=sum(bool(r["ghidra_incoming"]) for r in candidates),embedded_with_encoded_references=sum(bool(r["encoded_incoming"]) for r in candidates),embedded_with_relocations=sum(bool(r["relocation_incoming"]) for r in candidates),
            encoded_UTF8_pointer_length_candidates=sum(r["descriptor_rva"] is not None for r in string_slices),
            string_containers=len(string_slices),string_containers_with_ghidra_payload_references=sum(bool(r["ghidra_incoming"]) for r in string_slices),
            string_descriptors_with_ghidra_references=sum(bool(r["descriptor_ghidra_incoming"]) for r in string_slices),
            relocation_records=sum(relocation_classes.values()),relocation_classes={" -> ".join(k):v for k,v in sorted(relocation_classes.items())},
            archives=len(archives),active_hash_slots=len(members),unique_member_names=len(by_name),opaque_hash_slots=sum(len(r["opaque_hash_slots"]) for r in archives),blocks_without_active_hash=sum(len(r["blocks_without_active_hash"]) for r in archives),overridden_names=sum(bool(r["overridden_archives"]) for r in resolved),
            overridden_member_names=[r["name"] for r in resolved if r["overridden_archives"]],
            member_locale_platform_counts={"/".join(map(str,k)):v for k,v in sorted(Counter((r["locale"],r["platform"]) for r in members).items())},
            member_flag_counts=dict(sorted(Counter(r["flags"] for r in members).items())),
            resource_lead_classes=dict(Counter(r["classification"] for r in resource_leads))),
        limits=["Every selected row is retained; structural classes, literal reuse and static references are observations, not recovered complete schemas, runtime reachability or native/source equivalence.",
            "PE directories are platform-format context; generic engine/dependency namespaces and source literals are context, not an engine reconstruction mandate.",
            "Zero tails/slack and no observed references do not prove padding or absence of computed/dynamic aliases. No census bytes are removed.",
            "All 634018 DIR64 sites are classified by observed slot/destination section and embedded matches; types, lifetimes, dynamic aliases and integer IDs remain unresolved.",
            "All MPQ active slots/listfile names are read in place and source overrides are projected using the existing engine chain. Native mount/locale/override equivalence, opaque content and all asset semantics remain unverified.",
            "No compilation, game/source execution, loader/rendering/audio/platform check or original/rebuilt parity comparison."])
    raw = json.dumps(result,indent=2,ensure_ascii=False)+"\n"
    if args.stage: (WORK/"manifest.json").write_text(raw)
    else: assert KEEP.read_text() == raw
    print(json.dumps(result["counts"],indent=2))


if __name__ == "__main__":
    main()

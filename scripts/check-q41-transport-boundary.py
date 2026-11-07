#!/usr/bin/env python3
"""Verify bounded current connection-factory/vtable/peer-copy classification.

This reads original bytes and retained REA results. It runs no target code,
server, compiler, network operation or new native query.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

OUTPUT = "docs/analysis/evidence/0.121.0/transport-pointer-boundary.json"
TARGET = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"


def receipt(path):
    return {"path": path, "sha256": file_sha256(project_path(path))}


def collect():
    import capstone
    target = latest_target(verify=True)
    if target["sha256"] != TARGET:
        raise ValueError("Selected EXE is not the 0.121.0 classification target")
    image = target_bytes(target)
    pe = load_script("q41_transport_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    ranges = []
    instructions = {}

    def code(role, start, end):
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        decoded = list(decoder.disasm(raw, start))
        if not decoded or decoded[-1].address + decoded[-1].size != end:
            raise ValueError(f"Incomplete original instruction range: {role}")
        for item in decoded:
            instructions[item.address] = item
        ranges.append({"role": role, "virtual_address": hex(start), "end_exclusive": hex(end),
                       "file_offset": hex(offset), "byte_count": len(raw),
                       "sha256": hashlib.sha256(raw).hexdigest(), "instructions": len(decoded)})

    code("party-rejection-send", 0x145B34840, 0x145B34A25)
    code("TCP-accept-factory", 0x145B5CAA0, 0x145B5CBE5)
    code("TCP-receive", 0x145B5D900, 0x145B5DA12)
    code("TCP-send", 0x145B5DA60, 0x145B5DB39)
    code("TCP-close", 0x145B5DB40, 0x145B5DB90)
    code("TCP-alive", 0x1400719F0, 0x1400719F5)
    code("TCP-optional-transport-stat-zero", 0x14007E9A0, 0x14007E9A3)
    code("accept-to-peer-copy", 0x145B15730, 0x145B159E8)
    code("enemy-finite-function-selection", 0x145C14E24, 0x145C14E5F)
    code("server-input-capture", 0x145B12840, 0x145B12885)
    code("server-input-publication", 0x145B12F68, 0x145B12F84)
    code("server-thread-input-forwarding", 0x145B38C16, 0x145B38C44)
    code("server-core-poll-interface", 0x145B16C45, 0x145B16C60)
    code("host-accept-and-scratch-peer-base", 0x145B156D6, 0x145B15730)

    observations = []

    def require(site, mnemonic, operand):
        item = instructions[site]
        if item.mnemonic != mnemonic or item.op_str != operand:
            raise ValueError(f"Changed bounded instruction at {site:#x}: {item.mnemonic} {item.op_str}")
        observations.append({"site": hex(site), "bytes": item.bytes.hex(),
                             "instruction": item.mnemonic + " " + item.op_str})

    for site, mnemonic, operand in [
        (0x145B5CB55, "lea", "rdx, [rip + 0x1b285b4]"),
        (0x145B5CB9E, "mov", "ecx, 0x40"),
        (0x145B5CBC2, "movups", "xmmword ptr [rax + 0x30], xmm3"),
        (0x145B5CBC6, "movups", "xmmword ptr [rax + 0x20], xmm2"),
        (0x145B5CBCA, "movups", "xmmword ptr [rax + 0x10], xmm1"),
        (0x145B5CBCE, "movups", "xmmword ptr [rax], xmm0"),
        (0x145B15737, "mov", "r13, qword ptr [rbp + 0xd20]"),
        (0x145B15718, "lea", "r14, [rbp + 0x5f0]"),
        (0x145B15730, "imul", "rcx, r15, 0x4c8"),
        (0x145B1573E, "add", "rcx, qword ptr [r13 + 0xd80]"),
        (0x145B15745, "mov", "r8d, 0x4c8"),
        (0x145B1574B, "mov", "rdx, r14"),
        (0x145B1574E, "call", "0x145febc1b"),
        (0x145B1576B, "call", "qword ptr [rax + 0x18]"),
        (0x145B15832, "mov", "qword ptr [rbp + 0xaa0], rax"),
        (0x145B15839, "mov", "qword ptr [rbp + 0xaa8], rdx"),
        (0x145B34936, "call", "qword ptr [r14 + 0x18]"),
        (0x145B5DA84, "mov", "dword ptr [rax + rdi], esi"),
        (0x145B5DAA8, "call", "0x145febc1b"),
        (0x145B5DAC0, "jmp", "0x145b41970"),
        (0x145B5D93A, "cmp", "r15, 0x100000"),
        (0x145B5DB48, "call", "0x145b41970"),
        (0x145B5DB51, "mov", "dl, 2"),
        (0x145B5DB86, "mov", "byte ptr [rsi + 0x38], 0"),
        (0x1400719F0, "movzx", "eax, byte ptr [rcx + 0x38]"),
        (0x14007E9A0, "xor", "eax, eax"),
        (0x145C14E24, "lea", "rax, [rip + 0x3c765]"),
        (0x145C14E2B, "lea", "rcx, [rip + 0x3c7ae]"),
        (0x145C14E32, "cmovne", "rcx, rax"),
        (0x145C14E5D, "call", "rcx"),
        (0x145B12874, "mov", "qword ptr [rbp + 0x7d0], r8"),
        (0x145B1287B, "mov", "qword ptr [rbp + 0x7d8], rdx"),
        (0x145B12F6F, "mov", "qword ptr [rsi + 0x1968], rax"),
        (0x145B12F7D, "mov", "qword ptr [rsi + 0x1970], rax"),
        (0x145B12F68, "mov", "rax, qword ptr [rbp + 0x7d8]"),
        (0x145B12F76, "mov", "rax, qword ptr [rbp + 0x7d0]"),
        (0x145B38C16, "mov", "rax, r9"),
        (0x145B38C39, "mov", "rdx, r8"),
        (0x145B38C3C, "mov", "r8, rax"),
        (0x145B38C3F, "call", "0x145b12840"),
        (0x145B16C45, "mov", "rdx, qword ptr [rsi + 0x1968]"),
        (0x145B16C4C, "mov", "rax, qword ptr [rsi + 0x1970]"),
        (0x145B16C53, "lea", "r12, [rbp + 0x5f0]"),
        (0x145B16C5A, "mov", "rcx, r12"),
        (0x145B16C5D, "call", "qword ptr [rax + 0x28]"),
    ]:
        require(site, mnemonic, operand)
    if 0xAA0 - 0x5F0 != 0x4B0 or 0xAA8 - 0x5F0 != 0x4B8:
        raise ValueError("Peer scratch/connection field coordinate mismatch")
    tables = []
    expected = [0x140051760, 0x40, 8, 0x145B5DA60, 0x145B5D900,
                0x1400719F0, 0x145B5DB40, 0x14007E9A0, 0x14007E9A0, 0x14007E9A0]
    for address in (0x14619CB38, 0x147685110):
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + 80]
        values = list(struct.unpack("<10Q", raw))
        if values != expected:
            raise ValueError("Changed current TCP transport vtable")
        tables.append({"address": hex(address), "file_offset": hex(offset), "byte_count": 80,
                       "sha256": hashlib.sha256(raw).hexdigest(),
                       "slots": {hex(i * 8): hex(value) for i, value in enumerate(values)}})
    listener_table = 0x14619CAB8
    listener_slot = listener_table + 0x18
    listener_offset = pe.rva_offset(listener_slot - pe.image_base)
    listener_raw = image[listener_offset:listener_offset + 8]
    if struct.unpack("<Q", listener_raw)[0] != 0x145B5CAA0:
        raise ValueError("Changed current host-listener accept target")
    listener_accept = {"vtable_address": hex(listener_table), "slot": "0x18",
                       "address": hex(listener_slot), "file_offset": hex(listener_offset),
                       "byte_count": 8, "sha256": hashlib.sha256(listener_raw).hexdigest(),
                       "target": "0x145b5caa0"}
    journal_path = "runtime/analysis/history/findings/fixgap41-dispatch/a2c8543de22f/party-send/query/journal.json"
    journal = json.loads(project_path(journal_path).read_text())
    operation = next(iter(journal["operations"].values()))
    if journal["status"] != "completed" or operation["status"] != "completed":
        raise ValueError("Party wrapper native query is unfinished")
    if (operation["name"] != "procedure_pseudo_code"
            or operation["arguments"] != {"procedure": "0x145b34840"}):
        raise ValueError("Party wrapper query operation/procedure differs")
    result = operation["result"]
    if file_sha256(project_path(result["path"])) != result["sha256"]:
        raise ValueError("Party wrapper native result changed")
    value = json.loads(project_path(result["path"]).read_text())["structuredContent"]
    raw_path = "runtime/analysis/history/findings/fixgap41-dispatch/a2c8543de22f/party-send/code.bin"
    offset = pe.rva_offset(0x145B34840 - pe.image_base)
    if project_path(raw_path).read_bytes() != image[offset:offset + 485]:
        raise ValueError("Native query raw subject differs from installed bytes")
    query = {"procedure": "0x145b34840", "slice_virtual_address": "0x145b34840",
             "plan": receipt("runtime/analysis/history/findings/fixgap41-dispatch/a2c8543de22f/party-send/plan.json"),
             "journal": receipt(journal_path), "result": result,
             "raw_input": receipt(raw_path), "evidence_id": value["evidence_id"],
             "provider": value["provider"],
             "analysis_profile_digest": value["analysis_profile"]["digest"],
             "normalized_text_sha256": hashlib.sha256(value["normalized_result"].encode()).hexdigest()}
    subject_binding = verify_native_query_subject(ROOT, value, query, target, image=image, pe=pe)
    source = [receipt(path) for path in (
        "crates/azeroth-survivors-re/src/coop/tcp.rs",
        "crates/azeroth-survivors-re/src/coop/session.rs",
        "crates/azeroth-survivors-re/src/enemies/scaling.rs")]
    return {
        "schema_version": 1, "target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
        "gap_ids": [41], "lead_ids": ["Q41-F01", "Q41-M01"],
        "generator": receipt("scripts/check-q41-transport-boundary.py"),
        "dependencies": [receipt(path) for path in ("scripts/coverage_common.py", "scripts/script_sources.py", "scripts/inventory-executable.py", "scripts/discovery_native_subject.py")],
        "decoder": {"name": "Capstone", "version": capstone.__version__},
        "ranges": ranges, "instructions": observations, "transport_vtables": tables,
        "host_listener_accept_slot": listener_accept,
        "native_query": {**query, "subject_binding": subject_binding,
                         "limit": "Raw decompilation reports external-call/no-return/PIC truncation; original complete instruction boundaries own this bounded connection classification, not printed incoming types."},
        "source_receipts": source,
        "recovered_boundary": {
            "peer_constructor": "Host accept returns data/vtable in RAX/RDX. Current scratch peer at rbp+5f0 stores them at +4b0/+4b8; the complete0x4c8 memcpy publishes them unchanged into the peer vector.",
            "TCP_implementation": "Current accept factory returns a64-byte TCP object and vtable147685110. Its send/receive/alive/close slots are18/20/28/30; send writes a little-endianu32 length and payload then pumps. Optional transport-stat slots38/40/48 return zero.",
            "call_classification": "Peer+4b0/+4b8 connection operations are polymorphic transport interfaces. The concrete target depends on the admitted connection factory. Current TCP targets are recovered, not arbitrary missing AS bodies; other receiver layouts and transport factories remain separately bound to their owning contracts.",
            "source_counterpart": "coop/tcp.rs::TcpHost::accept and TcpConnection send/receive/is_alive/close; coop/session.rs::Connection dispatch and Session flush.",
            "separate_core_interface": "Server initializer145b12840 captures the caller-supplied data/vtable pair fromRDX/R8 unchanged and publishes it to server+1968/+1970. Thread wrapper145b38bf0 forwards that pair. Its slot28 uses a result pointer plus receiver, unlike TCP slot28's alive getter; these are distinct interfaces. The existing local-client request/event adapters supply the reconstructed AS-to-engine boundary; backend type enumeration is separate from this interface classification.",
            "enemy_finite_callback": {"site": "0x145c14e5d", "targets": ["0x145c51590", "0x145c515e0"],
                                      "basis": "Two RIP-relative LEAs and CMOVNE supply the only call-target values in the preserved selection range; formula/state applicability remains separate."}},
        "source_defect_established": False, "source_change": None,
        "receiver_site_groups": {
            "caller_supplied_server_core_interface_1968_1970": ["0x145b0d859", "0x145b15fd0", "0x145b16c5d", "0x145b1820c", "0x145b1991e", "0x145b19b66", "0x145b1a4be", "0x145b1a566", "0x145b1a741", "0x145b224f6", "0x145b22ef1", "0x145b25911", "0x145b282ff", "0x145b2f190", "0x145b30199"],
            "host_listener_0da8_0db0_accept_interface": ["0x145b156f4", "0x145b1576b"],
            "guest_upstream_connection_1088_1090_interface": ["0x145b15f0a", "0x145b15f23", "0x145b1618d", "0x145b161a6", "0x145b161bc", "0x145b2218f"],
            "peer_connection_4b0_4b8_interface": ["0x145b15b94", "0x145b15c10", "0x145b15e67", "0x145b1610e", "0x145b1613c", "0x145b162a1", "0x145b16332", "0x145b260b7", "0x145b34936", "0x145b35513"],
            "actor_connection_250_258_interface": ["0x145b16fd6", "0x145b17038"]},
        "receiver_site_group_limit": "These35 sites are interface-role classifications, not35 concrete TCP calls or proofs that every dynamic backend/type/alias is closed. Distinct core and peer/upstream receiver layouts retain their own source/protocol owners and deferred applicability.",
        "runtime_targets_globally_complete": False, "compilation_or_execution": "not_run", "parity_verified": False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    value = collect()
    path = project_path(OUTPUT)
    if args.write:
        path.write_text(portable_json(value, indent=2) + "\n")
    elif portable_record(json.loads(path.read_text())) != portable_record(value):
        raise ValueError("Saved native boundary classification differs; review before --write")
    print("Verified 14 original code ranges, two identical TCP vtables, host-listener accept slot, separate core/peer publication and finite enemy call targets; no source/runtime/parity claim.")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Verify retained WebSocket and current raw RTT contracts without execution.

The historical portable certificates remain checkable without ignored REA results.
Current RTT receipt verification uses the retained local journals and results.
This does not compile Rust, execute native instructions, open sockets or prove
interoperability, scheduling, TLS behavior or original/rebuilt parity.
"""
import argparse
import hashlib
import json
import re
import struct
import tomllib

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from script_sources import load_script


SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
MANIFEST = ROOT / "docs/analysis/evidence/0.115.0/coop-directory-transport/manifest.json"
OWNERS = {
    "url-override": "0x145891ab0",
    "ensure-service": "0x145891330",
    "transport-constructor": "0x1458544c0",
    "thread-spawn": "0x145850b20",
    "thread-closure": "0x145851e30",
    "thread-exit-status": "0x1458b1940",
    "websocket-worker": "0x14586a9c0",
    "websocket-connect": "0x1458b0720",
    "send-queue": "0x14586da20",
    "receive-queue": "0x14586d9a0",
    "connection-status": "0x14586da60",
    "close-signal": "0x14586b880",
    "vec-to-bytes": "0x145b794b0",
    "websocket-send": "0x14582a230",
    "websocket-flush": "0x145828250",
}


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def path(value):
    selected = (ROOT / value).resolve()
    assert selected.is_relative_to(ROOT), value
    return selected


def sha(value):
    assert re.fullmatch(r"[0-9a-f]{64}", value), value


def literal_bytes(row, data, pe):
    """Verify an exact native range and its relative dependency source suffix."""
    offset = pe.rva_offset(int(row["address"], 16) - pe.image_base)
    assert offset == int(row["file_offset"], 16)
    expected = bytes.fromhex(row["hex"]) if "hex" in row else None
    length = row["byte_count"] if "source_path" in row else len(expected)
    raw = data[offset:offset + length]
    assert len(raw) == length
    assert digest(raw) == row["sha256"]
    if "source_path" in row:
        suffix = row["source_path"]
        assert not suffix.startswith(("/", "\\")) and ":" not in suffix
        assert raw.replace(b"\\", b"/").endswith(suffix.encode())
    else:
        assert raw == expected and raw.decode() == row["text"]
    return raw


def check_manifest(target, data, pe):
    retained = json.loads(MANIFEST.read_text())
    assert retained["target"]["version"] == target["version"] == "0.115.0"
    assert retained["target"]["sha256"] == target["sha256"] == SHA
    assert retained["target"]["size_bytes"] == len(data)
    assert retained["target_executed"] is False
    owners = {row["role"]: row for row in retained["owners"]}
    assert len(owners) == len(retained["owners"])
    assert {role: row["start"] for role, row in owners.items()} == OWNERS
    for role, row in owners.items():
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert start < end
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        assert digest(data[offset:offset + end - start]) == row["sha256"], role
        extract = path(row["extract"])
        assert extract.parent == MANIFEST.parent
        assert digest(extract.read_bytes()) == row["extract_sha256"], role
        assert f"0x{start:x}:" in extract.read_text(), role

    tables = {}
    for row in retained["tables"]:
        address = int(row["address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        raw = data[offset:offset + row["byte_count"]]
        assert digest(raw) == row["sha256"], row["role"]
        if row["encoding"] == "absolute-u64":
            values = [hex(value) for value in struct.unpack("<" + "Q" * (len(raw) // 8), raw)]
        else:
            assert row["encoding"] == "signed-relative-i32"
            values = [hex(address + value) for value in struct.unpack("<" + "i" * (len(raw) // 4), raw)]
        assert values == row["values"], row["role"]
        tables[row["role"]] = values
    assert tables["transport-vtable"][3:7] == [
        OWNERS["send-queue"], OWNERS["receive-queue"],
        OWNERS["connection-status"], OWNERS["close-signal"],
    ]
    assert tables["thread-vtable"][3] == OWNERS["thread-closure"]
    assert tables["send-error-kind"] == [
        "0x14586add3", "0x14586ae26", "0x14586ade0", "0x14586ae16",
    ]
    assert tables["read-error-kind"] == [
        "0x14586afdb", "0x14586b021", "0x14586afe8", "0x14586b015",
    ]
    assert tables["websocket-send-message"][1] == "0x14582a3e6"

    literals = {}
    for row in retained["literals"]:
        raw = literal_bytes(row, data, pe)
        literals[row["role"]] = raw
    assert b"tungstenite-0.30.0\\src\\client.rs" in literals["embedded-websocket-dependency-path"]

    local_results = 0
    queried = set()
    for row in retained["ghidra_queries"]:
        assert row["role"] not in queried
        queried.add(row["role"])
        owner = owners[row["role"]]
        assert row["owner"] == owner["start"]
        assert row["operation"] == "procedure_pseudo_code"
        assert row["subject_sha256"] == owner["sha256"]
        assert re.fullmatch(r"ev_[0-9a-f]{64}", row["evidence_id"])
        assert row["provider"]["id"] == "ghidra"
        for key in ("analysis_profile_sha256", "normalized_result_sha256", "query_plan_sha256"):
            sha(row[key])
        sha(row["retained_result"]["sha256"])
        result = path(row["retained_result"]["path"])
        assert result.is_relative_to(ROOT / "runtime")
        journal = path(row["journal_ref"])
        assert journal.is_relative_to(ROOT / "runtime")
        if not result.exists():
            continue
        assert digest(result.read_bytes()) == row["retained_result"]["sha256"]
        evidence = json.loads(result.read_text())["structuredContent"]
        assert evidence["evidence_id"] == row["evidence_id"]
        assert evidence["subject"]["digest"]["sha256"] == owner["sha256"]
        assert evidence["analysis_profile"]["digest"] == row["analysis_profile_sha256"]
        assert digest(evidence["normalized_result"].encode()) == row["normalized_result_sha256"]
        if journal.exists():
            saved = json.loads(journal.read_text())
            operation = next(item for item in saved["operations"].values()
                             if item.get("result", {}).get("path") == row["retained_result"]["path"])
            assert operation["status"] == "completed"
            assert operation["result"]["sha256"] == row["retained_result"]["sha256"]
            plan = journal.parent / "plan.json"
            assert digest(plan.read_bytes()) == row["query_plan_sha256"]
        local_results += 1
    assert queried == {
        "ensure-service", "transport-constructor", "websocket-worker",
        "websocket-connect", "send-queue", "receive-queue",
        "connection-status", "close-signal", "vec-to-bytes",
    }
    return len(owners), len(tables), len(literals), len(queried), local_results


def block_after(source, token):
    """Select a balanced source block for narrow textual guards, not execution."""
    start = source.index("{", source.index(token))
    depth = 1
    for end in range(start + 1, len(source)):
        depth += (source[end] == "{") - (source[end] == "}")
        if depth == 0:
            return source[start + 1:end]
    raise AssertionError(f"Unterminated source block after {token}")


def check_source():
    source = (ROOT / "crates/azeroth-survivors-re/src/coop/websocket.rs").read_text()
    compact = re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", source))
    for token in (
        "pub struct DirectorySocket", "WebSocket<MaybeTlsStream<TcpStream>>",
        "tungstenite::connect(url)", "pub fn send_binary", "Message::Binary(bytes.into())",
        "self.activity.elapsed().as_secs() == 0", "nonblocking != self.nonblocking",
        "while let Some(mut bytes) = self.outgoing.pop_front()",
        "self.socket.send(Message::Binary(bytes.into()))",
        "ErrorKind::WouldBlock | ErrorKind::TimedOut", "Duration::from_millis(40)",
        "self.socket.close(None)", "self.socket.flush()",
        "MaybeTlsStream::Plain(stream)", "MaybeTlsStream::Rustls(stream)",
        "let _ = stream.set_nodelay(true)", "let _ = stream.set_nonblocking(nonblocking)",
        "let _ = stream.set_read_timeout(Some(Duration::from_millis(40)))",
    ):
        assert re.sub(r"\s+", "", token) in compact, token
    assert source.count("self.socket.read()") == 1
    assert source.count("self.activity = Instant::now()") == 2
    assert block_after(compact, "pubfnshould_sleep") == "self.nonblocking&&self.idle"
    poll = block_after(compact, "pubfnpoll")
    assert poll.index("self.idle=false;") < poll.index("self.activity.elapsed()")
    sending = block_after(compact, "fndrain_outgoing")
    assert sending.index("self.activity=Instant::now();") < sending.index("self.socket.send(Message::Binary(bytes.into()))")
    assert poll.index("self.drain_outgoing()?;") < poll.index("self.socket.read()")
    assert "to_le_bytes" not in sending
    idle = block_after(poll, "ErrorKind::WouldBlock|ErrorKind::TimedOut)=>")
    assert "self.socket.flush().map_err(|error|error.to_string())?;" in idle
    assert idle.index("self.socket.flush()") < idle.index("self.idle=true;")
    assert poll.count("self.socket.flush()") == idle.count("self.socket.flush()") == 1
    for forbidden in ("ErrorKind::Interrupted", "Error::WriteBufferFull", "send_text(",
                      "encode_batch", "self.socket.write("):
        assert forbidden not in source, forbidden
    crate = tomllib.loads((ROOT / "crates/azeroth-survivors-re/Cargo.toml").read_text())
    dependency = crate["dependencies"]["tungstenite"]
    assert dependency["version"] == "=0.30.0"
    assert "rustls-tls-webpki-roots" in dependency["features"]
    lock = tomllib.loads((ROOT / "Cargo.lock").read_text())
    packages = [row for row in lock["package"] if row["name"] == "tungstenite"]
    assert len(packages) == 1 and packages[0]["version"] == "0.30.0"
    worker = (ROOT / "crates/azeroth-survivors-re/src/coop_directory.rs").read_text()
    worker = re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", worker))
    assert 'thread::Builder::new().name("rogue-coop".into())' in worker
    assert worker.index("socket.poll()") < worker.index("socket.should_sleep()")
    assert "ifsleep{thread::sleep(Duration::from_millis(1));}" in worker


def check_current_rtt(target, data, pe):
    """Reuse the canonical current proof; do not copy its extracts or hashes."""
    from discovery_native_subject import verify_native_query_subject
    proof = json.loads((ROOT / "docs/analysis/evidence/0.127.0/coop-dispatch/manifest.json").read_text())
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert proof["target"] == identity and target["version"] == "0.127.0"
    roles = {
        "transport-ping-interceptor-prefix", "transport-ping-map-update",
        "transport-ping-unit-conversion", "transport-outgoing-ping-stamp",
        "transport-incoming-ping-clock", "transport-thread-clock-origin",
        "transport-ping-reply-send", "transport-ping-consume-guard",
        "transport-normal-frame-publication", "transport-rtt-state-initialization",
        "transport-rtt-state-clone", "transport-rtt-state-thread",
        "transport-rtt-state-return", "transport-thread-rtt-argument",
        "transport-rtt-forwarder", "transport-rtt-map-getter",
    }
    selected = [row for row in proof["ranges"] if row["role"] in roles]
    assert {row["role"] for row in selected} == roles
    for row in selected:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        assert digest(data[offset:offset + end - start]) == row["sha256"]
        assert digest(path(row["assembly"]["path"]).read_bytes()) == row["assembly"]["sha256"]
    queries = [row for row in proof["queries"] if row["role"] in {
        "transport-ping-interceptor", "transport-rtt-map-getter", "transport-constructor"}]
    assert len(queries) == 3
    for query in queries:
        result = path(query["result"]["path"])
        assert digest(result.read_bytes()) == query["result"]["sha256"]
        native = json.loads(result.read_text())["structuredContent"]
        assert digest(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        assert verify_native_query_subject(ROOT, native, query, identity, image=data, pe=pe) == query["subject_verification"]
    offset = pe.rva_offset(0x146258c5c - pe.image_base)
    assert struct.unpack("<f", data[offset:offset + 4])[0] == 1000.0
    contract = proof["transport_rtt_contract"]
    assert contract["stamp_offset"] == 10 and contract["incoming_declared_payload_length_checked"] is False
    source = (ROOT / "crates/azeroth-survivors-re/src/coop/websocket.rs").read_text()
    for fragment in ("bytes.len() >= 18 && bytes[0] == 6 && bytes[9] == 5",
                     "bytes[10..18].copy_from_slice(&now_us.to_le_bytes())",
                     "bytes.len() < 18 || bytes[0] != 26", "bytes[..18].try_into()",
                     "reply[0] = 6", "reply[9] = 6", "now_us.saturating_sub(stamp) as f32 / 1_000.0",
                     "transport_micros(self.clock_origin)", "self.rtt.lock().unwrap().insert(peer, milliseconds)"):
        assert fragment in source, fragment
    reply = block_after(source, "TransportProbe::Reply(reply) =>")
    assert reply.index("self.send_binary(reply.to_vec())") < reply.index("self.drain_outgoing()?")
    worker = (ROOT / "crates/azeroth-survivors-re/src/coop_directory.rs").read_text()
    for fragment in ("DirectorySocket::connect_with_rtt(&url, thread_rtt)",
                     "fn start_ping(&self, peer: u32)", "let mut payload = vec![5]",
                     "self.submit(ClientMessage::Relay { peer, payload })",
                     "fn rtt_samples(&self) -> RttSamples"):
        assert fragment in worker, fragment
    poll = block_after(worker, "fn poll(")
    assert poll.count("service.share_rtt_sources();") == 1
    assert poll.index("service.share_rtt_sources();") > poll.index("for request in requests")
    assert poll.index("service.share_rtt_sources();") > poll.index("poll_secondary(")
    check_source()
    print(json.dumps(dict(status="passed", target=target["version"], native_ranges=len(selected),
        native_queries=len(queries), source_paths=2, compilation=False,
        authored_rust_tests_executed=False, network_or_game_executed=False, parity_verified=False)))


def check_current_close(target, data, pe):
    proof = json.loads(path("docs/analysis/evidence/0.139.2/coop-close.json").read_text())
    assert proof["target"] == target

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + length]

    for row in proof["native_ranges"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert pe.rva_offset(start - pe.image_base) == int(row["file_offset"], 16)
        assert digest(raw(start, end - start)) == row["sha256"], row["role"]

    for anchor in proof["instruction_and_data_anchors"]:
        address = int(anchor["address"], 16)
        expected = bytes.fromhex(anchor["hex"])
        assert raw(address, len(expected)) == expected, anchor["role"]

    directory = path("crates/azeroth-survivors-re/src/coop_directory.rs").read_text()
    session = path("crates/azeroth-survivors-re/src/coop/session.rs").read_text()
    assert "relay.after(CoopSet::Flush)" in directory
    close = block_after(directory, "fn close(&mut self)")
    assert close.index("self.worker.take()") < close.index("primary.submit(ClientMessage::Leave)") \
        < close.index("self.secondary.take()") < close.index("secondary.submit(ClientMessage::Leave)") \
        < close.index("self.secondary_lifetime = None")
    for departure in (
        block_after(directory, "FormRequest::Leave"),
        block_after(directory, "if exits.read().next().is_some()"),
    ):
        assert departure.index("driver.leave(") < departure.index("service.close()")
    role = block_after(session, "pub fn leave(&mut self")
    assert role.index("peer.flush(now)") < role.index("peer.connection.send(&disconnect)") \
        < role.index("peer.connection.close()") < role.index("for_each(&mut submit)")
    assert role.index("self.disconnect_upstream(now, &disconnect)") < role.index("upstream.close()")
    upstream = block_after(session, "fn disconnect_upstream(")
    assert upstream.index("self.flush(now)") < upstream.index("upstream.send(disconnect)")
    codec = path("crates/azeroth-survivors-re/src/coop/service.rs").read_text()
    assert "Self::Leave => out.push(8)" in codec
    print(json.dumps(dict(status="passed", target=target["version"],
        native_ranges=len(proof["native_ranges"]),
        native_anchors=len(proof["instruction_and_data_anchors"]),
        source_paths=3, compilation=False, network_or_game_executed=False)))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--source-only", action="store_true", help="Check retained socket source wiring without revalidating historical native evidence")
    mode.add_argument("--current-rtt", action="store_true", help="Check the canonical 0.127.0 raw service RTT proof and source")
    mode.add_argument("--current-close", action="store_true", help="Check the 0.139.2 explicit cooperative close proof and source")
    args = parser.parse_args()
    if args.source_only:
        check_source()
        print("PASS: retained socket source guards; native evidence not revalidated; no compilation or execution")
        return
    target = installed_identity() if args.current_close else latest_target(verify=True)
    data = target_bytes(target)
    pe = load_script("coop_directory_transport_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    if args.current_rtt:
        return check_current_rtt(target, data, pe)
    if args.current_close:
        return check_current_close(target, data, pe)
    owners, tables, literals, certificates, local_results = check_manifest(target, data, pe)
    check_source()
    print(f"PASS: {owners} current native transport ranges/extracts, {tables} tables, "
          f"{literals} dependency path, {certificates} Ghidra certificates "
          f"({local_results} local result files) and socket source guards; "
          "no compilation, native execution, sockets or parity proof")


if __name__ == "__main__":
    main()

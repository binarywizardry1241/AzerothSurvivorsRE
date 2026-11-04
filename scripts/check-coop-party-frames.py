#!/usr/bin/env python3
"""Check AS party status packets and native gates without a compiler or client."""
from portable_paths import portable_json
import argparse
import hashlib
import itertools
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from equipment_native import EquipmentProbe
from native_terminal import NativeReplay
from script_sources import load_script

SHA = "de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be"
BASE = ROOT / "runtime/analysis/tasks/fixgap-205-0.123.0"
OUT = ROOT / "docs/analysis/evidence/0.123.0/coop-party-frames"
OWNERS = [
    ("group-fanout", 0x145c2bd40, 0x145c2bdf3),
    ("recipient-builder", 0x145c2d740, 0x145c2d9aa),
    ("group-serializer", 0x145c65c60, 0x145c661be),
    ("recipient-exclusion", 0x145c97350, 0x145c97592),
    ("online-collector", 0x145ca8a30, 0x145ca8b8f),
    ("hero-context", 0x145adfc50, 0x145ae006e),
    ("context-member", 0x145bb5970, 0x145bb5b3d),
    ("connected-api", 0x145404ed0, 0x145405184),
    ("stock-member-state", 0x14078e960, 0x14078ef71),
    ("completed-synchronization", 0x145c2b420, 0x145c2b8c0),
    ("group-delivery", 0x145c2e150, 0x145c2e396),
    ("cooperative-flag-producer", 0x145afbdd0, 0x145afc0d5),
]
SELECTED = [
    ("host-flag-sampling-loop", 0x145c0ecaa, 0x145c0edaf),
    ("fanout-gates", 0x145c2bd59, 0x145c2bd6f),
    ("online-slot-admission", 0x145ca8ac5, 0x145ca8ad6),
    ("online-assignment-and-retry", 0x145ca8b1a, 0x145ca8b49),
    ("recipient-exclusion", 0x145c973ac, 0x145c973d0),
    ("abandoned-context", 0x145adfca1, 0x145adfcb7),
    ("connected-predicate", 0x145405002, 0x14540502a),
    ("synchronization-caller-admission", 0x145c2ea9d, 0x145c2eadc),
    ("synchronization-completion-before-fanout", 0x145c2b854, 0x145c2b895),
    ("remote-recipient-delivery-admission", 0x145c2e172, 0x145c2e1fd),
    ("cooperative-flag-publication", 0x145afc0ab, 0x145afc0c8),
    ("host-receive-and-retirement-order", 0x145c0e492, 0x145c0e660),
    ("host-decoded-sync-dispatch", 0x145c2e491, 0x145c2e533),
    ("world-actor-assignment-publication", 0x145c1f2e1, 0x145c1f313),
    ("begin-remote-context-construction", 0x145c1efbb, 0x145c1efd7),
    ("begin-initial-group-publication", 0x145c1f220, 0x145c1f287),
    ("flag-change-batch-fanout", 0x145c0f3c9, 0x145c0f403),
]


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return {"path": str(path.relative_to(ROOT)), "sha256": sha(path.read_bytes())}


def result(path):
    obj = json.loads(path.read_text())
    return obj.get("structuredContent") or json.loads(obj["content"][0]["text"])


def query_rows(target, image, pe):
    rows = []
    for name in ("group-update", "group-inputs", "group-identity", "connected-api", "stock-party-feed", "stock-party-input",
                 "group-triggers", "cooperative-flag", "group-delivery"):
        folder = BASE / name
        journal = json.loads((folder / "query/journal.json").read_text())
        assert journal["status"] == "completed"
        plan = json.loads((folder / "plan.json").read_text())
        for operation in journal["operations"].values():
            assert operation["status"] == "completed"
            output = ROOT / operation["result"]["path"]
            native = result(output)
            row = {
                "role": name, "procedure": operation["arguments"]["procedure"],
                "plan": receipt(folder / "plan.json"),
                "journal": receipt(folder / "query/journal.json"),
                "result": receipt(output), "raw_input": receipt(ROOT / plan["target"]),
                "slice_virtual_address": plan["open_options"]["entry_point"],
                "evidence_id": native["evidence_id"],
                "provider": native["provider"],
                "analysis_profile_digest": native["analysis_profile"]["digest"],
                "normalized_sha256": sha(native["normalized_result"].encode()),
            }
            row["subject_verification"] = verify_native_query_subject(
                ROOT, native, row, target, image=image, pe=pe)
            rows.append(row)
    reused = json.loads((ROOT / "docs/analysis/evidence/0.123.0/coop-selection/manifest.json").read_text())
    for row in reused["queries"]:
        if row["procedure"] not in ("0x145c0c010", "0x145c2e460"):
            continue
        row = dict(row, role="reused-" + row["role"])
        native = result(ROOT / row["result"]["path"])
        row["subject_verification"] = verify_native_query_subject(
            ROOT, native, row, target, image=image, pe=pe)
        rows.append(row)
    return rows


def lua_receipts(target):
    reader = load_script("party_frames_mpq", ROOT / "scripts/check-minimap-lifecycle.py")
    archives = sorted(target["runtime_data"]["archives"],
        key=lambda row: (not row["path"].lower().endswith("/patch.mpq"), row["path"].lower()))
    rows = []
    for name, required in (
        ("Interface\\FrameXML\\PartyMemberFrame.lua", [
            'if ( not UnitIsConnected("party"..this:GetParent():GetID()) ) then',
            'this:SetStatusBarColor(0.5, 0.5, 0.5);',
            'SetDesaturation(getglobal(this:GetParent():GetName().."Portrait"), 1);',
            'getglobal(this:GetParent():GetName().."Disconnect"):Show();',
        ]),
        ("Interface\\FrameXML\\UnitFrame.lua", [
            'if ( not UnitIsConnected(unit) ) then',
            'statusbar:SetStatusBarColor(0.5, 0.5, 0.5);',
        ]),
    ):
        selected = None
        for archive in archives:
            handle = reader.Archive(archive["path"])
            entry = handle.lookup(name)
            if entry:
                selected = (archive, handle, entry, handle.read(entry))
        assert selected, name
        archive, handle, entry, raw = selected
        text = raw.decode()
        assert all(value in text for value in required)
        rows.append({"name": name, "archive": archive["path"], "archive_bytes": handle.size,
            "hash_table_sha256": sha(handle.hashes), "block_table_sha256": sha(handle.blocks),
            "entry": list(entry), "member_sha256": sha(raw), "selected_lines": required})
    return rows


def source_connections():
    def fragment(name, marker):
        text = (ROOT / name).read_text()
        start = text.index(marker)
        opening = text.index("{", start)
        depth = 1
        end = opening + 1
        while depth:
            depth += (text[end] == "{") - (text[end] == "}")
            end += 1
        raw = text[start:end]
        return {"path": name, "selector": marker, "sha256": sha(raw.encode())}, raw
    getter, text = fragment("crates/azeroth-survivors-re/src/coop/session.rs",
        "pub fn client_reconnecting(")
    assert "peer.reconnecting" in text and "peer.id == client" in text
    snapshot, text = fragment("crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs",
        "fn capture_party(")
    assert "finished: self.abandoned" in text and "finished: state.abandoned" in text
    receiver, text = fragment("crates/benilla-app/src/ui_party/feed.rs", "fn member_unit_state(")
    assert "Some(store) =>" in text and "crate::ui_unit::snapshot" in text
    assert "is_connected: stats.is_some_and(PartyMemberStatsInfo::is_online)" in text
    library = (ROOT / "crates/azeroth-survivors-re/src/coop/mod.rs").read_text()
    assert "pub mod party_frames;" in library
    caller = (ROOT / "crates/azeroth-survivors-re/src/gameplay/coop.rs").read_text()
    assert '#[path = "coop_party_frames.rs"]' in caller and "party_frames::install(app);" in caller
    live = (ROOT / "crates/azeroth-survivors-re/src/gameplay/coop_party_frames.rs").read_text()
    for token in ("driver.is_hosting()", "!hero.finished", "!client.reconnecting",
                  "client.synchronized", "local_active", "packet.decode_server()", "runtime.send(",
                  "!game.has_party()", "state.initial_list_identity == Some(run.identity)", "wire.0.push("):
        assert token in live, token
    bootstrap, text = fragment("crates/azeroth-survivors-re/src/gameplay/coop.rs", "fn bootstrap(")
    assert text.index("inserted.push((client, hero))") < text.index("party_frames::initial(") < text.index("driver.server.world_hero_added(client, hero.guid)")
    assert "state.initial_list_identity != Some(identity)" in text
    assert "if !world.ready" in text
    assert "row.joined && row.closing_since.is_none()" in text
    assert "let Some(slot) = game.party_slot(hero.guid)" in text
    assert text.index("party_frames::initial(") < text.index("NativeMessage::ZoneKey(")
    solo, text = fragment("crates/azeroth-survivors-re/src/gameplay/coop_party_frames.rs", "fn solo_initial(")
    for token in ("runtime.driver.is_some()", "!world.ready", "state.initial_list_identity == Some(run.identity)",
                  "!game.is_party_replica()", "initial(&runtime, game, &mut wire)",
                  "state.initial_list_identity = Some(run.identity)"):
        assert token in text, token
    initial, text = fragment("crates/azeroth-survivors-re/src/gameplay/coop_party_frames.rs", "pub(super) fn initial(")
    assert "driver.party_frame_clients()" in text and "wire.0.push(" in text
    assert "members(game, &clients)" in text and "members(game, &[])" not in text
    fragments = [getter, snapshot, receiver, bootstrap, solo, initial]
    for name, marker, required in (
        ("coop/session.rs", "pub fn begin_host_tick(", ["self.collect_membership()", "HostTick"]),
        ("coop/session.rs", "pub fn next_host_event(", ["MAX_MESSAGES_PER_CLIENT_TICK",
            "joined && assigned && !synchronized", "self.host_tick = Some(tick)",
            "self.retire_client(client)", "self.peers.remove(tick.index)"]),
        ("coop/session.rs", "fn retire_client(", ["self.server.disconnect(client)",
            "self.collect_membership()", "clients: self.party_frame_clients()"]),
        ("coop/session.rs", "pub fn party_frame_clients(", ["world_hero: row.world_hero",
            "synchronized: row.synchronized", "self.client_reconnecting(row.id)"]),
        ("gameplay/coop.rs", "fn receive(", ["driver.next_host_event()", "PartyEvent::Left"]),
        ("gameplay/coop.rs", "fn synchronize(", ["!row.synchronized", "run.mechanics.as_mut()",
            "driver.synchronize(client, packets)", "party_frames::fanout("]),
        ("gameplay/coop_reconnection.rs", "fn publish(", ["!changes.is_empty()", "party_frames::fanout("]),
    ):
        # Membership remains a nested ordinary event, with the row's own Left
        # applied before the captured Removed publication edge.
        if marker == "fn receive(":
            required = ["driver.next_host_event()", "MembershipEvent::Left",
                "PartyEvent::Removed", "party_frames::fanout_with_clients(",
                "driver.take_reconnection_changes()"]
        binding, text = fragment("crates/azeroth-survivors-re/src/" + name, marker)
        assert all(token in text for token in required), (marker, required)
        if marker == "pub fn party_frame_clients(":
            assert "is_alive" not in text
        if marker == "fn receive(":
            assert text.index("MembershipEvent::Left") < text.index("PartyEvent::Removed")
        fragments.append(binding)
    rustfmt = ROOT / ".tools/rust" / ("1.98.1-" +
        ("aarch64" if platform.machine() == "arm64" else "x86_64") + "-apple-darwin/bin/rustfmt")
    paths = ["crates/azeroth-survivors-re/src/coop/party_frames.rs",
        "crates/azeroth-survivors-re/src/gameplay/coop_party_frames.rs",
        "crates/azeroth-survivors-re/src/coop/mod.rs",
        "crates/azeroth-survivors-re/src/coop/session.rs",
        "crates/azeroth-survivors-re/src/coop_runtime.rs",
        "crates/azeroth-survivors-re/src/gameplay/coop.rs",
        "crates/azeroth-survivors-re/src/gameplay/coop_publish.rs",
        "crates/azeroth-survivors-re/src/gameplay/coop_reconnection.rs"]
    for name in paths:
        parsed = subprocess.run([str(rustfmt), "--edition", "2024", "--emit", "stdout",
            "--config", "skip_children=true"], input=(ROOT / name).read_text(),
            text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
        assert parsed.returncode == 0, (name, parsed.stderr)
    return fragments, paths


class Probe(EquipmentProbe):
    def __init__(self, image, pe):
        super().__init__(image, pe, [(a, z) for _, a, z in OWNERS + SELECTED])
        self.steps = 0

    def hook(self, cpu, pc, size, unused):
        if pc == self.stop:
            cpu.emu_stop()
            return
        if any(a <= pc and pc + size <= z for a, z in self.ranges):
            self.steps += 1
            return
        rcx, rdx, r8 = (self.reg(name) for name in ("RCX", "RDX", "R8"))
        if pc in (0x140002200, 0x1400021d0):
            pass
        elif pc == 0x1400021c0:
            self.reg("RAX", self.alloc(rcx))
        elif pc == 0x14600504b:
            cpu.mem_write(rcx, bytes(cpu.mem_read(rdx, r8)))
            self.reg("RAX", rcx)
        elif pc in (0x146005df0, 0x1461adc50):
            capacity, pointer, length = (self.q(rcx + n) for n in (0, 8, 16))
            added = r8 if pc == 0x146005df0 else 1
            capacity = max(capacity * 2, length + added, 8)
            replacement = self.alloc(capacity)
            cpu.mem_write(replacement, bytes(cpu.mem_read(pointer, length)))
            self.put(rcx, capacity, replacement)
        else:
            raise AssertionError(("unreviewed seam", hex(pc)))
        sp = self.reg("RSP")
        self.reg("RSP", sp + 8)
        self.reg("RIP", self.q(sp))

    def branch(self, start, stop):
        self.stop = stop
        self.native.emu_start(start, self.DONE, count=10000)
        assert self.reg("RIP") == stop


def cases(image, pe):
    probe = Probe(image, pe)
    counts = {"online": 0, "packet": 0, "self_exclusion": 0, "abandoned": 0, "connected": 0}
    game = probe.alloc(0x2000)
    closure, output = probe.alloc(32), probe.alloc(32)
    clients = probe.alloc(0x4c8 * 5)
    mode_pointer = probe.alloc(8)
    probe.put(mode_pointer, game + 0xd70)
    for mode, assignments, flags in itertools.product(range(5), ((), (1,), (2, 1), (9, 1, 2)), range(4)):
        probe.native.mem_write(game, bytes(0x2000))
        probe.native.mem_write(clients, bytes(0x4c8 * 5))
        probe.native.mem_write(game + 0xd70, struct.pack("<I", mode))
        probe.put(game + 0xda8, clients, len(assignments))
        for index, slot in enumerate(assignments):
            row = clients + index * 0x4c8
            probe.put(row, 1, slot)
            probe.native.mem_write(row + 0x4c2, bytes([(flags >> (index % 2)) & 1]))
        probe.put(closure, game, mode_pointer, 0, 5)
        probe.invoke(0x145ca8a30, output, closure)
        actual = bytes(probe.native.mem_read(probe.q(output + 8), probe.q(output + 16)))
        expected = [1]
        for slot in range(1, 5):
            match = next((i for i, value in enumerate(assignments) if value == slot), None)
            expected.append(int(mode == 3 and match is not None and not ((flags >> (match % 2)) & 1)))
        assert actual == bytes(expected), (mode, assignments, flags, actual, expected)
        counts["online"] += 1
    for count, width, bits in itertools.product(range(6), (0, 1, 40, 128), (0, 1, 5, 31)):
        rows = probe.alloc(max(count, 1) * 32)
        expected = bytearray(b"\0\0" + struct.pack("<I", count))
        for index in range(count):
            name = ("Ä" + str(index) + "x" * width).encode()
            pointer = probe.alloc(len(name))
            probe.native.mem_write(pointer, name)
            guid = 0x100000000 + index
            status = (bits >> index) & 1
            probe.put(rows + index * 32, pointer, len(name), guid)
            probe.native.mem_write(rows + index * 32 + 24, bytes([status]))
            expected.extend(name + b"\0" + struct.pack("<QBB", guid, status, 0))
        leader = 0xf000000012345678
        expected.extend(struct.pack("<Q", leader if count else 0))
        if count:
            expected.extend(b"\0" * 9 + b"\x02\0")
        probe.reg("R9", leader)
        probe.invoke(0x145c65c60, output, rows, count)
        assert probe.native.mem_read(output + 24, 2) == b"\x7d\0"
        actual = bytes(probe.native.mem_read(probe.q(output + 8), probe.q(output + 16)))
        assert actual == expected, (count, width, bits)
        counts["packet"] += 1
    selector = probe.alloc(8)
    for recipient, candidate in itertools.product(range(6), repeat=2):
        probe.put(selector, recipient)
        probe.reg("R13", selector)
        probe.reg("RDI", candidate)
        stop = 0x145c973a0 if recipient == candidate else 0x145c973b2
        probe.branch(0x145c973ac, stop)
        counts["self_exclusion"] += 1
    for abandoned in (0, 1):
        frame = probe.STACK + 0x10000
        probe.reg("RDI", game)
        probe.reg("RBP", frame)
        probe.native.mem_write(game + 0xd43, bytes([abandoned]))
        probe.put(frame + 0x13c0, 0)
        probe.branch(0x145adfca1, 0x145adfd0d if abandoned else 0x145adfcb7)
        if abandoned:
            assert probe.q(frame + 0x13c0) == (1 << 64) - 1
        counts["abandoned"] += 1
    unit, cell = probe.alloc(0x500), probe.alloc(32)
    for value in (0, 1):
        probe.native.mem_write(unit + 0x3df, bytes([value]))
        probe.put(cell, 2)
        probe.reg("RAX", unit)
        probe.reg("R12", cell)
        probe.reg("R15", cell + 16)
        probe.reg("RDX", 2)
        probe.branch(0x145405002, 0x14540502a)
        assert probe.reg("RAX") == value * 3
        counts["connected"] += 1
    return counts, probe.steps


def cadence_cases(image, pe):
    """Run the recovered admission/completion blocks with synthetic records."""
    probe = Probe(image, pe)
    counts = {name: 0 for name in ("fanout_gate", "flag_change", "sync_caller",
        "sync_dispatch", "sync_completion", "remote_delivery", "cooperative_flag", "world_assignment")}
    driver = probe.alloc(0x2000)
    clients = probe.alloc(0x4c8 * 3)
    frame = probe.STACK + 0x10000
    probe.reg("RBP", frame)
    for world, cooperative in itertools.product(range(3), (0, 1)):
        probe.native.mem_write(driver + 0x10, struct.pack("<I", world))
        probe.native.mem_write(driver + 0xd62, bytes([cooperative]))
        probe.reg("RCX", driver)
        probe.branch(0x145c2bd59,
            0x145c2bd6f if world != 2 and cooperative else 0x145c2bde6)
        counts["fanout_gate"] += 1
    for old, current in itertools.product((0, 1), repeat=2):
        probe.native.mem_write(clients + 0x4c2, bytes([old]))
        probe.reg("R12", clients)
        probe.reg("RAX", current)
        probe.branch(0x145c0ed6f, 0x145c0ed16 if old == current else 0x145c0ed81)
        assert probe.native.mem_read(clients + 0x4c2, 1) == bytes([current])
        counts["flag_change"] += 1
    for assigned, synchronized in itertools.product((0, 1), repeat=2):
        probe.put(clients, assigned)
        probe.native.mem_write(clients + 0x4c1, bytes([synchronized]))
        probe.reg("RAX", clients)
        probe.branch(0x145c2ea9d,
            0x145c2ead6 if assigned and not synchronized else 0x145c2eb3d)
        counts["sync_caller"] += 1
    message = probe.alloc(0x238)
    probe.put(message, 0x8000000000000005)
    for role, count, index, joined, assigned, synchronized in itertools.product(
            (1, 3), range(2), range(2), (0, 1), (0, 1), (0, 1)):
        probe.native.mem_write(clients, bytes(0x4c8 * 3))
        probe.native.mem_write(driver + 0xd70, struct.pack("<I", role))
        probe.put(driver + 0xda8, clients, count)
        row = clients + index * 0x4c8
        probe.put(row, assigned, 1)
        probe.native.mem_write(row + 0x4c0, bytes([joined, synchronized]))
        probe.reg("RCX", driver)
        probe.reg("RDX", index)
        probe.reg("R8", message)
        stop = (0x145c2e669 if role != 3 else 0x145c2edd9 if index >= count else
            0x145c2ead6 if joined and assigned and not synchronized else 0x145c2eb3d)
        probe.branch(0x145c2e491, stop)
        counts["sync_dispatch"] += 1
    for role, count, index, previous in itertools.product((1, 3), range(3), range(2), (0, 1)):
        probe.native.mem_write(driver + 0xd70, struct.pack("<I", role))
        probe.put(driver + 0xda8, clients, count)
        probe.put(frame + 0x2a0, index)
        probe.put(frame + 0x2d0, index * 0x4c8)
        probe.native.mem_write(clients + index * 0x4c8 + 0x4c1, bytes([previous]))
        probe.reg("RSI", driver)
        invalid = role == 3 and index >= count
        probe.branch(0x145c2b854, 0x145c2b8aa if invalid else 0x145c2b890)
        expected = 1 if role == 3 and not invalid else previous
        assert probe.native.mem_read(clients + index * 0x4c8 + 0x4c1, 1) == bytes([expected])
        counts["sync_completion"] += 1
    for role, assignments, synchronized, recipient in itertools.product(
            (1, 3), ((), (1,), (2, 1), (1, 1)), (0, 1, 2, 3), range(1, 4)):
        probe.native.mem_write(clients, bytes(0x4c8 * 3))
        probe.native.mem_write(driver + 0xd70, struct.pack("<I", role))
        probe.put(driver + 0xda8, clients, len(assignments))
        for index, slot in enumerate(assignments):
            probe.put(clients + index * 0x4c8, 1, slot)
            probe.native.mem_write(clients + index * 0x4c8 + 0x4c1,
                bytes([(synchronized >> index) & 1]))
        first = next((index for index, slot in enumerate(assignments) if slot == recipient), None)
        admitted = role == 3 and first is not None and ((synchronized >> first) & 1)
        probe.reg("RCX", driver)
        probe.reg("RDX", recipient)
        probe.branch(0x145c2e172, 0x145c2e1fd if admitted else 0x145c2e2bc)
        counts["remote_delivery"] += 1
    for old, count in itertools.product((0, 1), (1, 4)):
        probe.native.mem_write(driver + 0xd52, bytes([old]))
        probe.reg("RSI", driver)
        probe.reg("RDI", count)
        probe.branch(0x145afc0ab, 0x145afc0b9)
        assert probe.q(driver + 0xa30) == count
        assert probe.native.mem_read(driver + 0xd52, 1) == b"\1"
        counts["cooperative_flag"] += 1
    completed = probe.alloc(16)
    for index, actor in itertools.product(range(3), (0, 1, 4)):
        probe.put(completed, index, actor)
        probe.put(driver + 0xda8, clients, 3)
        probe.reg("RSI", driver)
        probe.reg("R14", completed)
        probe.branch(0x145c1f2e1, 0x145c1f313)
        assert probe.q(clients + index * 0x4c8) == 1
        assert probe.q(clients + index * 0x4c8 + 8) == actor
        counts["world_assignment"] += 1
    return counts, probe.steps


class ReceiveOrderProbe(Probe):
    """Execute the original per-peer loop, mocking only its external callees."""
    def hook(self, cpu, pc, size, unused):
        if pc == self.stop or any(a <= pc and pc + size <= z for a, z in self.ranges):
            return super().hook(cpu, pc, size, unused)
        index = self.reg("RSI")
        if pc == 0x145bf4590:
            peer = self.peers[index]
            available = peer["packets"] > 0
            self.put(self.reg("RCX"), 5 if available else (1 << 64) - 1)
            if available:
                peer["packets"] -= 1
        elif pc == self.alive:
            self.reg("RAX", int(self.peers[index]["alive"]))
        elif pc == 0x145c2e460:
            assert self.reg("RDX") == index
            self.events.append(("message-handler", self.peers[index]["id"]))
        elif pc == 0x145c2f510:
            assert self.reg("RDX") == index
            self.events.append(("retirement", self.peers[index]["id"]))
            self.peers.pop(index)
            self.publish_rows()
        else:
            raise AssertionError(("unreviewed receive-order seam", hex(pc)))
        sp = self.reg("RSP")
        self.reg("RSP", sp + 8)
        self.reg("RIP", self.q(sp))

    def publish_rows(self):
        self.native.mem_write(self.clients, bytes(3 * 0x4c8))
        for index, _ in enumerate(self.peers):
            row = self.clients + index * 0x4c8
            self.put(row + 0x4b0, self.driver, self.vtable)
        self.put(self.driver + 0xda8, self.clients, len(self.peers))


def receive_order_cases(image, pe):
    probe = ReceiveOrderProbe(image, pe)
    probe.driver = probe.alloc(0x2000)
    probe.clients = probe.alloc(3 * 0x4c8)
    probe.vtable, probe.alive = probe.alloc(0x80), probe.alloc(16)
    probe.put(probe.vtable + 0x28, probe.alive)
    frame = probe.STACK + 0x10000
    count = 0
    for order in itertools.permutations(("sync", "left", "quiet")):
        probe.peers = [{"id": name, "packets": int(name == "sync"), "alive": name != "left"}
            for name in order]
        probe.events = []
        probe.native.mem_write(probe.driver + 0xd70, struct.pack("<I", 3))
        probe.publish_rows()
        probe.reg("RSP", probe.STACK + 0x1f0008)
        probe.reg("RBP", frame)
        probe.put(frame + 0xd40, probe.driver)
        probe.branch(0x145c0e492, 0x145c0e660)
        expected = [("message-handler" if name == "sync" else "retirement", name)
            for name in order if name != "quiet"]
        assert probe.events == expected, (order, probe.events, expected)
        count += 1
    return {"receive_order": count}, probe.steps


def ordered_world_input():
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.139.2/coop-ordered-input.json').read_text())
    target = installed_identity()
    assert target == proof['target']
    image = target_bytes(target)
    pe = load_script('party_frames_pe', ROOT / 'scripts/inventory-executable.py').PE(image)

    def read(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    for row in proof['native_ranges']:
        start, end = (int(row[key], 16) for key in ('start', 'end_exclusive'))
        assert pe.rva_offset(start - pe.image_base) == int(row['file_offset'], 16)
        assert sha(read(start, end - start)) == row['sha256']
    for address, destination, opcode in ((0x145e53233, 0x145e77bd0, 0xe8),
                                         (0x145e5323c, 0x145e53160, 0xe9),
                                         (0x145e7851c, 0x145eb4880, 0xe8),
                                         (0x145e7833a, 0x145e766f0, 0xe8),
                                         (0x145e76733, 0x145ec30a0, 0xe8)):
        raw = read(address, 5)
        assert raw[0] == opcode and address + 5 + struct.unpack('<i', raw[1:])[0] == destination
    table = 0x1476c81ec
    assert [table + cell for cell in struct.unpack('<2i', read(table + 3 * 4, 8))] == [
        0x145e782b7, 0x145e78310,
    ]

    ordered_source()
    print('PASS: retained host Engine/Control dispatch and ordered source drain')


def ordered_source():
    gameplay = ROOT / 'crates/azeroth-survivors-re/src/gameplay'
    receive = (gameplay / 'coop.rs').read_text().split('fn receive(', 1)[1].split('fn finish_transport_lost(', 1)[0]
    command = (gameplay / 'coop_commands.rs').read_text()
    loop = receive.split('driver.next_host_event()', 1)[1]
    assert loop.index('commands::Input::Engine') < loop.index('commands::Input::Control') < loop.index('commands::drain(')
    assert 'commands: VecDeque<(ClientId, commands::Input)>' in (gameplay / 'coop.rs').read_text()
    drain = command.split('pub(super) fn drain(', 1)[1]
    assert drain.index('terrain.native.terrain()') < drain.index('state.commands.front()') < drain.index('state.commands.pop_front()')
    assert '.filter(|_| world.ready)' in drain
    assert 'if !name_query' in drain
    assert '(world_inputs.is_none() || floor.is_none())' in drain
    assert 'apply.after(bootstrap).before(RunSet::Tick)' in command
    assert 'Input::Engine(packet) => packet' in drain and 'Input::Control { kind, argument, offer }' in drain
    return gameplay, drain


def host_action_replay():
    target = installed_identity()
    assert target['sha256'] == '6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa'
    image = target_bytes(target)
    pe = load_script('party_frames_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    return NativeReplay(image, pe)


def host_name_query():
    replay = host_action_replay()
    cpu, reg = replay.machine, replay.registers
    game, body = replay.app, replay.app + 0x4000
    table, opcode_start = 0x147aec530, 0x145e9e9ce
    assert table + replay.get(table + (0x50 - 0x4b) * 4, '<i')[0] == opcode_start
    lookup, native_name = 0x145e9b550, 0x145fe8720
    found, missing = 0x145ea10b1, 0x145ea10bf
    names = 0

    def lookup_seam(address):
        if address != lookup:
            return False
        observed.append(cpu.reg_read(reg.UC_X86_REG_R8))
        output = cpu.reg_read(reg.UC_X86_REG_RCX)
        replay.put(output, '<qQQQ', 1 if known else -1, 0, 0, 0)
        replay.return_seam()
        return True

    replay.seam = lookup_seam
    for length, game_kind, mode, known, present in itertools.product(
        range(13), (0, 2), (0, 1), (False, True), (False, True)
    ):
        payload = bytes(range(0x81, 0x81 + length))
        expected = int.from_bytes(payload[:8], 'little')
        observed = []
        replay.reset('host NameQuery', [(0x145e9e690, 0x145ea2004)], [native_name, found, missing])
        cpu.mem_write(body, payload)
        cpu.reg_write(reg.UC_X86_REG_RSI, game)
        cpu.reg_write(reg.UC_X86_REG_R13, length)
        cpu.reg_write(reg.UC_X86_REG_R15, body)
        replay.put(game + 0x10, '<I', game_kind)
        replay.put(game + 0x10f3, '<B', mode)
        replay.put(game + 0x1c70, '<qQQ', 8 if present else -1, body + 0x20, 4)
        replay.put(game + 0x1e2c, '<BBB', 4, 1, 8)
        lookup_active = game_kind != 2 and mode != 0
        stop = found if lookup_active and known else native_name if present else missing
        assert replay.run(opcode_start) == stop
        assert observed == ([expected] if lookup_active else [])
        if stop == native_name:
            assert cpu.reg_read(reg.UC_X86_REG_RDX) == expected
            assert cpu.reg_read(reg.UC_X86_REG_R8) == body + 0x20
            assert cpu.reg_read(reg.UC_X86_REG_R9) == 4
            stack = cpu.reg_read(reg.UC_X86_REG_RSP)
            assert replay.get(stack + 0x28, '<B') == (1,)
            assert replay.get(stack + 0x30, '<B') == (8,)
            assert replay.get(stack + 0x38, '<B') == (4,)
        names += 1

    _, drain = ordered_source()
    assert 'name_query_guid(&packet.payload)' in drain
    assert 'state.world_profiles.get(&requested)' in drain and '.or(state.local.as_ref())' in drain
    assert 'engine_packets::encode(&player_name(hero, requested), None)' in drain
    assert 'runtime.send(Some(client), reply.into_message())' in drain
    print(f'PASS: {names} NameQuery cases over {replay.instructions:,} original steps, plus ordered source guards')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--ordered-input", action="store_true")
    parser.add_argument("--host-name-query", action="store_true")
    args = parser.parse_args()
    if args.host_name_query:
        return host_name_query()
    if args.ordered_input:
        return ordered_world_input()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("party_frames_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    owners, assembly = [], []
    for role, a, z in OWNERS + SELECTED:
        offset = pe.rva_offset(a - pe.image_base)
        raw = image[offset:offset + z - a]
        instructions = list(decoder.disasm(raw, a))
        assert sum(i.size for i in instructions) == len(raw), role
        row = {"role": role, "virtual_address": hex(a), "file_offset": hex(offset),
            "byte_count": len(raw), "sha256": sha(raw), "instruction_count": len(instructions)}
        if (role, a, z) in OWNERS:
            owners.append(row)
        else:
            assembly.append("// " + role + "\n")
            assembly.extend(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                for i in instructions)
    table_address = 0x1476acc0c
    table_offset = pe.rva_offset(table_address - pe.image_base)
    table = image[table_offset:table_offset + 14 * 4]
    targets = [table_address + value for value in struct.unpack("<14i", table)]
    assert targets[5 - 3] == 0x145c2ea9d
    counts, steps = cases(image, pe)
    for checks in (cadence_cases, receive_order_cases):
        more, executed = checks(image, pe)
        counts.update(more)
        steps += executed
    connections, syntax = source_connections()
    proof = {"schema_version": 1, "target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
        "gap_ids": [205], "target_executed": False, "native_owners": owners,
        "queries": query_rows(target, image, pe), "stock_framexml": lua_receipts(target),
        "native_data": [{"role": "host-decoded-message-dispatch", "virtual_address": hex(table_address),
            "file_offset": hex(table_offset), "byte_count": len(table), "sha256": sha(table),
            "first_decoded_variant": 3, "targets": [hex(value) for value in targets],
            "synchronize_decoded_variant": 5, "synchronize_target": hex(targets[2])}],
        "native_cases": counts, "original_instruction_steps": steps,
        "source_connections": connections, "rust_syntax_paths": syntax,
        "source_bindings": [receipt(ROOT / name) for name in (
            "crates/azeroth-survivors-re/src/coop/party_frames.rs",
            "crates/azeroth-survivors-re/src/gameplay/coop_party_frames.rs")],
        "limits": ["Original instructions execute only in synthetic memory; no source/application, UI, transport or service execution.",
            "Allocator, memcpy and vector reserve are explicit fixture seams. Context-swap and stock party feed are statically recovered, not executed.",
            "Receive-order cases execute the original per-peer loop; receive/alive, message-handler and retirement callees are explicit synthetic seams. The synchronization caller and completion gates run separately in original instructions.",
            "Compilation, actual client/network/FrameXML behavior, rendering and original/rebuilt parity remain unverified."]}
    if args.write:
        OUT.mkdir(parents=True, exist_ok=True)
        (OUT / "selected-native.asm").write_text("".join(assembly))
        proof["assembly"] = receipt(OUT / "selected-native.asm")
        (OUT / "manifest.json").write_text(portable_json(proof, indent=2) + "\n")
    else:
        old = json.loads((OUT / "manifest.json").read_text())
        proof["assembly"] = receipt(OUT / "selected-native.asm")
        assert (OUT / "selected-native.asm").read_text() == "".join(assembly)
        assert old == proof, "Party frame proof changed"
    print(json.dumps({"native_cases": counts, "original_instruction_steps": steps,
        "queries": len(proof["queries"]), "owners": sum(row["instruction_count"] for row in owners)}))


if __name__ == "__main__":
    main()

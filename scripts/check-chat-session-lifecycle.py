#!/usr/bin/env python3
"""Check ChatFrame resource ownership and the source's session cleanup boundary.

No Rust compilation or game. Two legacy chunks run in an isolated Lua interpreter
with explicit frame stubs/absent globals; source-order assertions are not Rust execution.
"""
from script_sources import load_script

import argparse
import hashlib
import json
import shutil
import subprocess
import xml.etree.ElementTree as ET

from coverage_common import ROOT, artifact_path, file_sha256, latest_target, load_json

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
OUTPUT = ROOT / "docs/analysis/evidence/chat-session-lifecycle.json"


def body(text, start, end):
    return text.split(start, 1)[1].split(end, 1)[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    assert latest_target(verify=True)["sha256"] == SHA
    probe = load_script("minimap_resource_probe", ROOT / "scripts/check-minimap-lifecycle.py")
    registered = load_json("docs/analysis/evidence/minimap-lifecycle.json")
    assert registered["target_sha256"] == SHA
    assert {p.name.lower() for p in artifact_path("installed-game/Data").iterdir() if p.suffix.lower() == ".mpq"} == {
        row["path"].split("/")[-1].lower() for row in registered["archives"]
    }
    for row in registered["archives"]:
        assert file_sha256(row["path"]) == row["sha256"]
    archives = [probe.Archive(row["path"]) for row in registered["archives"]]
    members = []
    texts = {}
    for name in ["FrameXML.toc", "ChatFrame.xml", "FloatingChatFrame.xml"]:
        path = "Interface/FrameXML/" + name
        for archive in reversed(archives):
            entry = archive.lookup(path)
            if entry is not None:
                raw = archive.read(entry)
                texts[name] = raw.decode("utf-8")
                members.append(dict(member=path, archive=archive.reference, bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest()))
                break
        assert name in texts, path
    toc = texts["FrameXML.toc"].splitlines()
    assert toc.index("ChatFrame.xml") < toc.index("FloatingChatFrame.xml")
    template = ET.fromstring(texts["ChatFrame.xml"])
    floating = ET.fromstring(texts["FloatingChatFrame.xml"])
    assert any(node.get("name") == "ChatFrameTemplate" and node.get("virtual") == "true" for node in template)
    for name in ["ChatFrame1", "ChatFrame2"]:
        nodes = [node for node in floating if node.get("name") == name]
        assert len(nodes) == 1 and nodes[0].get("inherits") == "FloatingChatFrameTemplate"

    chat = (ROOT / "crates/benilla-app/src/ui_chat.rs").read_text()
    lifecycle = (ROOT / "crates/benilla-app/src/ui_script/lifecycle.rs").read_text()
    module = (ROOT / "crates/benilla-app/src/ui_script/mod.rs").read_text()
    cleanup = chat.split("pub(crate) fn end_chat_session(world: &World)", 1)[1]
    assert "world.get_resource::<ChatLog>()" in cleanup and "log.reset();" in cleanup
    assert "script" not in cleanup and ":Clear()" not in cleanup
    assert "fn end_session_chat(" not in chat and "run_or_warn" not in module
    end = body(lifecycle, "pub(crate) fn end_ui_session(", "fn close_ui_session(")
    assert end.index("close_ui_session(world, ShutdownRoot::WorldTeardown)") < end.index("crate::ui_chat::end_chat_session(world)") < end.index("install_glue_side_vm(world, screen.key())")
    close = body(lifecycle, "fn close_ui_session(", "pub(crate) struct ReloadUiPending")
    assert close.index("world.remove_resource::<PendingEntryUiLoad>()") < close.index("if !ui_never_loaded") < close.index("shutdown_ui_state(script, identity.as_ref())")
    tail = body(lifecycle, "pub(crate) fn shutdown_ui_state(", "pub(crate) fn end_ui_session(")
    assert tail.index('script.fire_event("PLAYER_LOGOUT"') < tail.index("addons::save_enable_state")
    reload = body(lifecycle, "pub(crate) fn run_pending_reload(", "pub(crate) fn shutdown_on_exit(")
    assert "close_ui_session(world, ShutdownRoot::Reload)" in reload and "end_chat_session" not in reload
    boot = body(lifecycle, "pub(crate) fn strings_vm(", "fn install_glue_vm(")
    assert "load_global_strings" in boot and "load_emote_tokens" in boot and "load_ingame_ui(" not in boot
    production_calls = []
    for path in (ROOT / "crates/benilla-app/src").rglob("*.rs"):
        if path.name == "tests.rs" or "tests" in path.name:
            continue
        text = path.read_text()
        if "crate::ui_chat::end_chat_session(world)" in text:
            production_calls.append(path.relative_to(ROOT).as_posix())
    assert production_calls == ["crates/benilla-app/src/ui_script/lifecycle.rs"]

    # Reproduce the old producer's failure, not a replacement ChatFrame implementation.
    lua = shutil.which("lua")
    assert lua, "a Lua interpreter is required for the bounded legacy-chunk check"
    legacy = '''
local failed, cleared = 0, 0
for _, name in ipairs({"ChatFrame1", "ChatFrame2"}) do
    local chunk = name .. ":Clear()"
    _G[name] = nil
    local ok, err = pcall(assert(load(chunk)))
    assert(not ok and string.find(err, name, 1, true))
    failed = failed + 1
    _G[name] = { Clear = function() cleared = cleared + 1 end }
    assert(pcall(assert(load(chunk))))
    _G[name] = nil
end
assert(failed == 2 and cleared == 2)
print("two absent-frame failures and two frame-present controls pass")
'''
    run = subprocess.run([lua, "-"], input=legacy, text=True, capture_output=True, check=True, cwd=ROOT)
    assert run.stdout.strip() == "two absent-frame failures and two frame-present controls pass"
    result = dict(
        schema_version=1, target_sha256=SHA, gap_id=45, framexml_members=members,
        resource_contract="FrameXML.toc loads ChatFrame.xml's virtual template before FloatingChatFrame.xml creates ChatFrame1/2. Boot/glue VMs do not own those in-game frames.",
        old_source_producer="ui_chat::end_chat_session generated ChatFrame1:Clear() and ChatFrame2:Clear() through run_or_warn in an unordered OnExit(InWorld) callback.",
        source_repair="The sole session owner resets ChatLog after close_ui_session and before installing the replacement VM. Frame contents die with the VM; no Lua frame-clear callback remains. Reload keeps its queue; aborted entry needs no frames.",
        interpreted_legacy_cases=4, source_production_reset_calls=production_calls,
        existing_native_contract="addon-bridge-0.109.0 owns current Menu/ordinary Logout response and completion ordering; check-addon-contracts.py rechecks that bounded contract separately.",
        limits=["Source-order guards and XML/resource checks do not execute or type-check Rust or the ECS schedule.",
                "The Lua checks use explicit frame stubs and absent globals; they are not an original/rebuilt game comparison.",
                "Historical log attribution is supported by the exact chunks and source race; the log has no stack or exact built-source proof.",
                "Actual startup/logout/reload input, persistence, rendering and original/rebuilt parity remain unverified."],
    )
    encoded = json.dumps(result, indent=2) + "\n"
    if args.write:
        OUTPUT.write_text(encoded)
    else:
        assert OUTPUT.read_text() == encoded, "chat lifecycle evidence changed; review before --write"
    print("Chat lifecycle: current FrameXML ownership, single reset-after-shutdown/before-replacement source path, reload/aborted-entry guards and four legacy Lua controls pass. No Rust/game executed.")


if __name__ == "__main__":
    main()

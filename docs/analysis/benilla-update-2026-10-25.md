# benilla source update to wenilla's merged revision

The engine source baseline is now
[`samwhosung/benilla@0367a2c2180d777392470860693009465495a30d`](https://github.com/samwhosung/benilla/commit/0367a2c2180d777392470860693009465495a30d),
the revision merged by public wenilla in
[`c9b1b373`](https://github.com/Arnesen/wenilla/commit/c9b1b373b50ed07f7835492ce004e34b8881c170).
It advances the [previous import](benilla-update-2026-10-20.md) by 23 upstream
commits. The [lineage comparison](engine-lineage.md) explains the source
relationship. This dependency update does not establish which revision was
compiled into the installed AS EXE, native equivalence or gameplay parity.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the remaining findings.

## Source identity

[benilla-vendor.json](benilla-vendor.json) records all 2,041 selected pristine
upstream files and the 85 current local overrides. The target source archive is
10,666,785 bytes, SHA-256
`5ee3fc618bcd361e0378441079fe6e24cea0c5bae29e07c0e3b507a4397ff9fb`.
The old archive was verified against its existing manifest before merging.
Replaying the 23 immutable upstream diffs against its pristine selected source
reproduced every target archive byte. The 378 changed paths comprise 52 additions,
323 changed files and three deletions. Of the final selected files, 1,956 match
upstream exactly; the remaining 85 are explicit reconstruction overrides.

The selection retains engine crates, UI assets, required textual reference tables,
patched dependency source and licenses. Upstream root Cargo.toml, Cargo.lock and
rust-toolchain.toml are unchanged across this interval; the local combined
workspace and dependency lock remain intact. No independent dependency upgrade,
wenilla browser/service carry, upstream instruction files or game binaries are
part of this import. The upstream feature changes are retained as 23 focused
local commits, followed by the embedding compatibility repair.

## Preserved AS integration

The actual checkout contained 84 upstream-file overrides before this import;
the previous manifest's 33-entry list was stale. Preservation used the actual
source bytes, rather than that list. Thirty-seven modified paths overlapped the
upstream delta: 32 final files match the clean three-way merge exactly; five
required manual integration:

- `net/io.rs` retains the shared socket/embedding packet writer and incorporates
  every upstream command change in that writer.
- `player/movement_net.rs` retains ordered AS movement capture and its identical
  position heartbeat regression, alongside upstream's precast-ending moves.
- `player/wire_in.rs` retains the shared movement-mode helper. Its return now
  carries upstream's precast result to both the normal and paused controllers.
- `ui_chat.rs` retains session teardown and final-packet flushing. Its flush now
  uses the production stamped event drain, preserving cross-lane event order.
  That drain follows UiFeed, including the AS run-table reset.
- `ui_script/lifecycle.rs` retains incremental file loading, progress, addon/CVar
  seeding, AS bindings, FrameXML appends and extension postlude. Each load unit
  now lends upstream's immediate call host. Saved variables, chat restore, UI
  scale and login keep their load order; group/ready-check reload state is seeded.

The separate compatibility repair feeds upstream's new ordered lock-opener list
from the embedding spell book through the same registrar as ordinary packets.
It also applies upstream's precast-ending mode acknowledgement while the local
controller is paused. Its regression source checks opener order/removal and
updates the existing schedule check to inspect the stamped drain.

All 427 AS crate files are byte-identical before and after. Their sorted
`path + NUL + content-SHA256 + LF` digest is
`b91dff8ca93d94bbd6162058617e2e9586777a59d42f6e335e2a772284dc62c2`.
All 22 preexisting local-only engine files remain; only `local_client.rs` and
`local_client/player.rs` change for the compatibility repair above. Existing
aura text, equipment, names, audio, shaders, object packet completion, spline
pause/ground continuity, menu and save adapters remain. Unrelated pending
workspace edits are excluded from these commits.

## Static validation and limits

Rust syntax parsing with the installed pinned rustfmt, TOML parsing, offline
locked workspace metadata, archive/merge preservation comparisons and Git
whitespace/conflict checks passed. Source snapshots and coverage indexes were
rebound to the new dependency baseline while retaining the selected EXE and
all native recovery/parity limits. This is source/static validation only.

No compilation, cargo check, compiling tests, client/game/server execution or
original/rebuilt comparison ran. The added and imported Rust tests remain
unrun. Build success, in-game behavior and parity remain unverified.

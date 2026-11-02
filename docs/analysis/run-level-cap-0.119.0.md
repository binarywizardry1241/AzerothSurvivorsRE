# ReputationFrame run-level cap — 0.119.0

Permanent **#181**, discovered under **#41**, leads **Q41-I01:resource_path:219**,
**Q41-B02/R01**. The installed 145,357,824-byte EXE has SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
[verification-needed](../verification-needed.md) owns current overall status. The
[compact proof](evidence/0.119.0/run-level-cap/manifest.json) binds original
instructions, data, completed journaled Ghidra results, resources and source.

## Recovered omission and source repair

The installed `Interface\FrameXML\ReputationFrame.lua` defines
`MAX_PLAYER_LEVEL = 60`. The native AS bootstrap at `145aa8a20..145aa8b5b`
directly calls `145b44190` at `145aa8ab8`, between the PaperDoll and
StaticPopup/WorldState patchers. The selected patcher acquires the resource
chain, reads the exact 38-byte ReputationFrame path, converts its original
contents to text and formats those contents followed by this suffix:

```lua


-- Azeroth Survivors: the run's level cap, not 1.12's.
MAX_PLAYER_LEVEL = 99;
```

The compact format record is `[1475dace8,1475dad3b)`, 83 bytes including its
terminator. It retains 76 literal prefix bytes and the exact `;\n` tail. Its
second formatting argument points to the u32 value 99 at `1475dace4`; the
current decimal-u32 formatter prefix is reused from the existing
[tabard name proof](rewards-tabard-localization-0.119.0.md). The patcher publishes
the resulting content under the same ReputationFrame path. Root/chain/file
failures do not publish a replacement. Original filesystem, UTF-8 and shared
formatting helpers remain explicit analysis boundaries.

The source omitted this append entirely. `gameplay/client/framexml_hud.rs` now
registers the exact [80-byte suffix](evidence/0.119.0/run-level-cap.lua) for
ReputationFrame alongside the existing WorldState and StaticPopup patches.
This changes only the client UI global; gameplay level/progression rules keep
their existing owners.

## Actual loader and consumers

The installed `FrameXML.toc` includes `ReputationFrame.xml`; its nested Script
loads `ReputationFrame.lua`. The existing `ClientBridgePlugin` inserts core
appends before client/UI setup, and `ui_script::lifecycle` copies them into each
new `EntryUiFiles`. Its core loader applies them to direct and nested Script
loads before later addons, without mutating the archive or creating missing
files. Fresh/replacement VMs therefore load stock content then the AS suffix.
No per-frame or locale-triggered reassignment is added; later addon overrides
retain their usual ordering.

The actual stock `ReputationWatchBar_Update` tests `< MAX_PLAYER_LEVEL` when
stacking a watched faction bar above XP, and equality when replacing XP with
the max-level rail without a watched faction. `ShowWatchedReputationBarText`
also tests equality before locking watched-faction text. Existing WorldState
bar geometry remains separate. Restoring the shared global supplies these
stock consumers with the native cap99 rather than leaving their cap60 default.

## Static checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-run-level-cap.py --queries
```

The checker verifies both current `.pdata` extents and complete assembly,
the bootstrap call edge, exact template/u32/path, current formatter prefix,
retained Ghidra query/result hashes, live registration/loader source and three
installed stock-resource payloads. Canonical pseudocode views trim trailing
whitespace; retained original query results preserve the provider text.
Twelve cases execute the complete original
patcher instructions in synthetic memory, covering empty/ordinary/Unicode
text and unavailable root/chain/file branches. Filesystem/chain acquisition,
UTF-8 conversion, shared formatting/allocation, diagnostics and publication
are explicit seams; an unreviewed call fails.

The exact installed stock Lua and suffix pass **400 assertions** in two fresh
standalone VMs. Mock widgets cover levels 0/59/60/61/98/99/100, watched/unwatched
factions, explicit/inferred levels, XP/max-level rail/locked-text branches and
later addon ordering. This executes neither the Rust loader nor real widgets.
Compilation, actual client/addon/input/rendering behavior and controlled
original/rebuilt parity remain unverified. The repair does not close #41's
other data, alias, ownership or schema populations.

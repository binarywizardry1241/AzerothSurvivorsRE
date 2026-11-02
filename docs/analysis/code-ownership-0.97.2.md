# Source ownership evidence — 0.97.2

This historical audit is bound to the [0.97.2 target](target-0.97.2.md), SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
It identifies source/debug leads for reconstruction; it is not a completion
measure. The complete custom-code inventory and reconstruction percentage remain
unmeasured. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) are maintained separately.

The [ownership ledger](evidence/0.97.2/game-code-ownership.json) retains native
byte hashes and unresolved attribution. Its [66-entry source map](evidence/0.97.2/reconstruction-source-map.json)
is pinned to source revision `00b13c0846af3e6e99339b5e9e7627a68f6117c9`;
entries are not complete-body certifications. A shared engine filename can contain
custom changes, and a new filename can be a generic refactor. Do not count whole
mixed native functions or diagnostic-path totals as reconstructed code.

## Ownership findings and unresolved boundaries

The 0.97.2 EXE retains **669** project-crate source-path identities:
**49** belong to the custom rogue crates, **610** also occur in the pinned
benilla snapshot, and **10** do not occur there: nine engine candidates and one
dependency path. These are diagnostic strings, not a complete list of source
files or functions. Routines without emitted diagnostics and inlined bodies
are not exhaustively attributed by this list.

The 610 shared paths cannot be excluded wholesale: a shared filename may contain
custom changes. Conversely, a new filename may reflect a generic engine refactor.
The pinned comparison is `samwhosung/benilla` revision
`7b608671a65274e0fe330da4a63f12da58162b61`, whose identity as the target's exact
source fork remains unproven. The historical [baseline report](benilla-baseline.md)
retains its own version-specific findings; old RVAs are not reused as 0.97.2 proof.

All nine unmatched engine paths were reviewed against the retained native/path
and pinned source evidence. **None can yet be classified as entirely custom or
entirely inherited.** They remain explicit open ownership entries:

| Original path below `crates/` | First raw file offset | Bounded review result |
| --- | ---: | --- |
| `benilla-app/src/host_controls.rs` | `0x59d9232` | TouchDrive identity; input/platform ownership unresolved |
| `benilla-app/src/web_pbr_lite.rs` | `0x59e09e6` | Trace source identity; no complete rendering ownership map |
| `benilla-app/src/ui_text/engine/fallback.rs` | `0x5a38bce` | Trace source identity; no attributed native-body inventory |
| `benilla-protocol/src/transport/mod.rs` | `0x5ae8a40` | Login diagnostics overlap inherited functionality; refactor is plausible, equivalence unproven |
| `benilla-protocol/src/transport/local.rs` | `0x5ae8c15` | Local integration lead; custom boundary unproven |
| `benilla-protocol/src/transport/native.rs` | `0x5ae8c60` | Transport split observed; custom boundary unproven |
| `benilla-app/src/webbridge/mod.rs` | `0x5b01cb6` | WebBridge identity; generic platform versus custom changes unresolved |
| `benilla-world/src/rig_anim/compose_scratch.rs` | `0x5bf90a7` | Animation diagnostic identity; refactor versus custom changes unresolved |
| `benilla-ui/src/script/plain.rs` | `0x66c350f` | Diagnostics overlap inherited UI functionality; file-wide native equivalence unproven |

Positive native evidence already identifies the menu-scene addition, WorldLive
menu term, player-camera gate and stock-preview suppression. HeroPreview and
WorldHold identities provide further custom module leads. These known seams
are **nonexhaustive**, and inherited/inlined work inside their native extents
has not been attributed instruction by instruction. Their raw byte lengths
are therefore supporting evidence, not the denominator.

The request-present view-lane function at `[0x14093f540, 0x14093f6c3)` contains
confirmed custom behavior, but its Rust owner and exact custom span remain
unresolved. It must not be renamed `Camera.is_active`. A retained caller at
`[0x1413fc370, 0x1413fc4fb)` repeats the known WorldLive state-or-menu-active
seam at a wrapper layer; it is not another distinct source behavior.

Custom namespace observations for `screens::achievements`, `screens::scrollbar`,
`screens::reward` and `window` establish custom type identities, not separate
source-file or function totals. The reward/rewards alias question remains open.
Four complete shared shader sources match after newline normalization; that is
bounded reuse evidence, not proof about other engine bodies.

The [source-area list](game-layer-inventory.md),
[custom-file ledger](evidence/0.97.2/game-module-coverage.json) and
[engine-delta ledger](evidence/0.97.2/game-engine-delta.json) remain discovery
indexes. Their area counts are no longer used as reconstruction progress.

## Original build and debug evidence

The EXE embeds the full build stamp
`43fe5ff8f42496998894368f90fcf12c71179ab9` at raw offset `0x58eae69`, beside
`v0.2.0-448-g43fe5ff8`. The repository association of this stamp is **unverified**;
it must not be assumed to identify the game fork. A bounded authenticated GitHub
lookup on 2026-10-18 found no matching commit in `samwhosung/benilla` (HTTP 422),
and a commit search returned zero visible results with `incomplete_results=false`.
This is a bounded visibility result, not proof the commit never existed.

The PE has **zero COFF symbols**. Its 42-byte RSDS reference at file offset
`0x6d25324` names **`benilla_rogue.pdb`**, GUID
`151805f6-4b07-4868-8c7a-f1eb39c4062d`, age **1**. Its SHA-256 is
`6af9b00134dbf31941b5fa33081316acfe768c098fa06e86dc2b933496b3a47c`.
This references an external file; it does not embed its symbols. The other debug
records are VC_FEATURE statistics and coarse POGO section contributions, neither
of which assigns functions to game source. No `.dep-v0` dependency section exists.

An ignored-inclusive project filename scan found no `.pdb`, `.dbg`, `.debug`,
`.sym`, `.dwp`, or benilla/wenilla `.map` candidates. The search did not inspect
other folders. Original symbols/source would accelerate attribution, but their
absence does not prevent further native recovery; it leaves more manual static
analysis and explicit ownership/completeness review to do.

## Reproduce the ownership checks

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/inventory-current-target.py --sha256 945dd3b702f3994c917d1cfa6c75e8c7c22afd4c9318fe9d4f924952f98997e3
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/check-reconstruction-coverage.py --sha256 9d7a1b1af6cc62d9e83ac3310df90d776dc7d00a3fdf9acea66c391a632e1326
```

These optional checks read historical EXE bytes and retained ledgers; they do not
build or execute the app. Source correspondence and original/rebuilt runtime parity
remain separate verification obligations.

# Q41-U01 — ordinary upgrade magnitude branches

The installed **0.113.2** EXE, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
owns this bounded classification under **#41**. The [proof](proof.json) binds
the original selector, exact interval, current bytes, native replays and reviewed
source. [CURRENT-STATE](../../../../CURRENT-STATE.md) owns overall implementation
status; historical balance and upgrade reports retain their actual targets.

## Selected range and actual code

`Q41-U01-upgrade-magnitude-145840d78` selects `.text` preferred-VA interval
`[0x145840d78,0x145840f24)`, RVA `[0x5840d78,0x5840f24)`, **428 bytes**.
It is an exact `mixed-unclassified` row in the original declared-range residual
selector. The enclosing unwind extent is `[0x145840d60,0x145840f61)`;
[magnitude.asm](magnitude.asm) is the single retained decode of that 513-byte
extent. These are original code bytes, not padding or a missing engine module.

The entry zero-extends the kind byte and jumps through signed-relative table
`0x147014ff8`. The five typed lanes reach the Power, Cooldown, Targets, Area and
Duration calculations. The entry has **no lexical guard for a malformed kind
byte**; the five-lane interpretation uses the recovered typed domain rather than
claiming a guard for all 256 byte values. Each selected lane separately bounds
the rarity index at five, reaching its own Rust Location record and the common
bounds-panic helper on rejection.

Current full-PE Ghidra byte observations
`ev_d4effeb163faec0dae923f9c5772f7fd581feab9fb71f77fd58791444481f767`
and `ev_38ac15e4d3f0306065cd902789431c6ac0b05ffcbfb3983a748072b24907f525`
match the installed extent/table bytes. FunctionManager still owns only the
24-byte dispatch head; code-only case seeds do not establish the missing
computed incoming edges or attach the cases to its function body. The PE
pseudocode request failed; a separate raw-fragment import recovered only the
indirect dispatch head. Exact table targets, independent decoding and bounded
original-instruction replay establish this selected contract separately from
that provider limitation. The original census and **all residual counts stay
unchanged**; other U01 intervals remain actionable.

## Values and existing source connection

The five native arrays exactly match
[`player_abilities/upgrades.rs`](../../../../../crates/azeroth-survivors-re/src/player_abilities/upgrades.rs).
The connected `magnitude` function already preserves these recovered rules:

- Power divides its rarity value by `1 + f32(count) * 0.5` in native f32 order.
- Cooldown, Area and Duration use their existing scalar formulas, ordered
  zero-clamping and rarity arrays. Unordered values select the zero operand.
- Targets saturates the remaining cap before applying the rarity limit. The
  ordinary cap is twelve; passive kind 11 uses two for `seal_fate`, `soul_fire`,
  `lightwell` and `faerie_fire`, and zero for other keys.

The current census records two direct callers, `0x14599f060` and
`0x1459a9372`, and one data reference at `0x1485b9a60`. Their exact call-site
bytes are committed in the proof. The first consumes the result in an eligibility
comparison; the second loads an ordered kind byte and consumes the returned
scalar before its kind switch. These observed references do not exclude unseen
aliases or dynamic callers.

In reconstructed source, `eligible_types` reads `magnitude` for its threshold,
`apply` reads it before changing the selected stat/count, and
[`native_overlay_payload::upgrade_lines`](../../../../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs)
reads it for the visible description. `UpgradeKind::from_tag` admits the five
typed kinds. This source trace connects the helper to existing consumers; it
does not revalidate the complete native offer/apply/presentation lifecycle.
No source mismatch was found, so this classification introduces no speculative
gameplay change. Existing mechanic ownership remains #2/#18/#21/#34/#41.

## Static checks and limits

`scripts/check-q41-u01-0.113.2.py` reproduces the full original U01 selector's
54,975 rows and output digest, verifies the selected range/table/current-source
commitments, and executes **1,050 original-instruction magnitude cases** plus
**15 rarity bounds cases**. The matrix covers all five lanes/rarities, ordinary
and passive caps, all four special keys and a near-match key, zero/u32-max and
f32 integer-rounding count boundaries, exhausted scalar bonuses and NaN.

The fixture supplies synthetic instances/descriptors and stack memory; it stops
at the existing panic helper rather than executing panic machinery. Source
formulas are reviewed and compared through independent f32 expectations; Rust,
ECS, actual offers, application and presentation are not executed. No build,
compiling test, game, Windows/device operation or original/rebuilt comparison
ran. The classified range does not close #41's body/reference/alias/semantic
inventory or certify an entire system or release claim.

Use the existing Capstone/Unicorn environment to run the read-only checker. A
fresh REA reproduction uses the proof's exact seed rows and operation/parameter
pairs through `scripts/rea-batch.py` against `installed-game/AzerothSurvivors.exe`,
with the recorded disabled analyzers and a new project-local output directory.
Retain new Evidence identities; do not overwrite or relabel the original probe.

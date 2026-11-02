# Druid release contracts — 0.119.0

The selected installed 145,357,824-byte EXE has SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This static native/source review investigates the two supplied Druid items
**#176/#177**, their summary **#175**, and the independent player-aura projection
omission **#178**. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent findings;
[the release review](release-review-0.119.0.md) maps the supplied items. The #176/#177/#178 source corrections and their separate static checks are recorded below.

The [curated manifest](evidence/0.119.0/druid-release/manifest.json) binds twelve
current instruction ranges, two constants, eleven source receipts, current
Location references and twelve completed journaled full-PE REA/Ghidra queries.
The original query Evidence IDs, result hashes, profiles, seed and original
producer/tool commitments remain distinct from this review's compact exports.
The complete original responses and persistent Programs remain under ignored
`runtime/`; tracked text contains selected passages and portable commitments.
Preferred addresses below are static PE addresses, not observed live pointers.

## #176 — Tranquility rolls a critical for every selected victim

The current pulse branch `145bc5784..145bc5a51` finds the first generic effect
variant 21, applies its deadline/pool gate, consumes the pool before the victim
query and retains its effect-index attribution. Its ordinary visual and target
collection precede the damage loop. The native damage loop at
`145bc5960..145bc5a2e` now consumes one shared xoshiro draw for each selected
victim. It takes the upper 24 bits and multiplies by `2^-24`, then compares the
result with the current spell-critical chance at Game `+0x4ac`. A critical
multiplies the pulse power by the current spell-critical multiplier at `+0x4b0`.
The comparison is strict (`draw < chance`), including its native unordered
comparison behavior.

Every hit calls the canonical actor-hit owner `145bd6420` with spell 740,
Nature school 3 and the separately computed critical byte. Game `+0x1ad` is saved,
set to source-kind 3 around that hit, and restored before the next victim. The
native actor-hit gate `145bd983b..145bd985a` skips generic effect dispatch when
this source-kind is3; adding critical damage does not turn the pulse into an
ordinary spell/proc trigger. Wider class-specific hit/death dependencies retain
their separate proof limits; these branches do not certify the complete hit
system or actual execution.

The live `gameplay/mechanics/callbacks.rs::pulse_healing_pool` now prepares
that per-victim draw, critical flag and multiplier through the existing shared
RNG/stats interfaces, then calls the attributed source-kind-three hit helper.
Other effect hits retain their noncritical behavior. The canonical hit path,
damage events and client log already carry the critical flag;
`run_effects::hit_event` excludes source-kind three before consuming tokens.
No additional critical-specific source omission was identified in those
consumers. [The focused repair](tranquility-0.119.0.md) records 388 original
instruction cases, source tracing and explicit hook boundaries. Wider historical
class-specific hit/death bodies, compilation, actual RNG cadence, damage/meter
presentation and controlled original/rebuilt comparison remain unverified.

## #177 — Rejuvenation renews the same caster's contribution

Current aura storage is 32 bytes: source GUID at `+0x0`, status payload at `+0x8`,
spell at `+0x14`, expiry at `+0x18` and remaining healing at `+0x1c`. The local self-cast
stores source 0. In the current kind-nine duration-heal path
`145bbc324..145bbc3cc`, spell 774 selects the special source-aware prune helper
`145c20c50`. It removes matching-spell rows only when their source word is0.
Other duration heals retain their separate spell-wide replacement path. A local
recast therefore renews the local Rejuvenation and preserves contributions
whose source is another hero.

The shared-heal producer `145b85270..145b8534d`, called from the current cast
path, queues a 56-byte event when cooperative mode is admitted. It preserves
source hero slot, source GUID, position, spell, normalized healing coefficient
and duration. Duration healing uses event kind 14. The shared party tick drains
that queue after hero simulation, excludes events from the recipient's own
hero slot, and applies an inclusive squared XY distance bound of 900 (30 yards).
The local-recipient path is `145b7dbf9..145b7dc2e`; the remote wrapper
`145b2460a..145b2463c` applies the same admission and calls `145b86da0`.

That recipient's duration-heal branch scales the coefficient by the
recipient's maximum health. For spell 774, it removes only rows whose spell
and source GUID both match the incoming event; other sources survive. It then
appends a new 32-byte row carrying that GUID, expiry and remaining healing
(`145b87197..145b871f7`). Same-caster refresh and different-caster stacking
are consequently separate native rules.

The actual aura tick `145b8d6e0` iterates every 32-byte row independently. For a
positive remaining heal it consumes `min(delta/max(expiry-now,delta),1)` of
that row, accumulates all contributions, and performs one health clamp with
regeneration. Effective healing is apportioned over the original queued rows;
equal spell IDs do not erase their separate contribution. The source already
has the corresponding independent-row tick/batch-heal structure in
`behavior/buffs.rs::tick_auras` and `run_effects/healing.rs::apply_batch`.

The live source now retains the caster GUID and source-aware refresh in
`buffs::Aura`/`refresh_aura`, forwards the actual kind-nine cast through
`PassiveCombat` to a shared event queue outside per-hero swaps, and applies the
event through each admitted recipient's ordinary aura/health/Engine owners.
The tick-start healing snapshot admits only state1 with strict injury and
inclusive30-yard XY bounds; it remains fixed across all hero simulation.
Source0, independent healing/lifetimes and caster departure are preserved.
The separate icon/count consumer is **#178**.

[The complete source/static repair](rejuvenation-0.119.0.md) adds the missing
current admission, snapshot, duration and lifecycle proof. Raw duration is
captured for peers while self uses its scaled duration; all four actual
native healing descriptors match source. 2,037 bounded original-instruction
cases, fourteen retained queries, source wiring and23 Rust syntax checks pass.
Sixteen library/live-party regressions are authored/unrun. Compilation,
actual client/network/gameplay/meter presentation and original/rebuilt parity
remain unverified; no wider party/transport completeness is claimed.

## #178 — Active aura rows merge into one icon with applications

Current publisher `145b8bd60` builds active helpful rows by spell ID in first
encounter order. `145b8bd9c..145b8beb5` checks expiry, searches the existing
12-byte output rows, inserts a first count 1 row, or increments the matching
row's count and retains the maximum expiry. Source GUID does not split this
presentation row. Multiple active Rejuvenations therefore remain separate
healing rows while publishing one spell 774 slot with multiple applications.

`run_effects/player_auras.rs::PlayerAuraInputs::slots` now groups only this
active prefix by spell, counting applications and preserving first encounter
order and the latest expiry. The later shield/temporary/permanent/harmful
partitions retain their independent rows. Caster-aware healing storage remains
the separate #177 contract. The
existing application-word encoder and benilla `UNIT_AURA`/field-watch consumers
already exist; this is an AS producer aggregation change. Their presence does
not prove the selected EXE's complete client revision/equivalence, and no
engine reconstruction is required for this source connection.

[The source repair](player-aura-grouping-0.119.0.md) passes 278 bounded original
instruction cases and live publication source guards, including expiry edges,
source-GUID-independent grouping and ordered output. Three Rust regressions
are authored but uncompiled/unrun. No further source omission is identified
within this grouped consumer. Compilation, actual party/addon rendering and
controlled original/rebuilt comparison remain open.

## Verification and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-druid-release.py --require-retained-queries
```

The check verifies 12 exact ranges / 4,658 bytes / 1,072 instructions, two
constants, eleven reviewed source receipts and all twelve original retained
query/result/profile/seed/tool commitments. This is a non-compiling static
integrity and source-review receipt check; it neither executes native code nor
certifies the implementation. The #176 repair has its separate bounded
instruction replay and live source checks linked above. Ghidra's inferred types
and calling conventions remain uncertain; exact selected instruction operands and control
flow are checked against the installed PE. Broad decompiler helper expansion
is supporting context, not a recovered engine contract.

The three registered module scopes are game abilities (HoT cast/tick), Game
(pulse and aura projection), and cooperative party (healing event/recipient).
Each is bounded and can coexist with substantial missing behavior. No
application compilation, compiling test, client/game/network/server run,
save/settings mutation or controlled original/rebuilt comparison occurred.

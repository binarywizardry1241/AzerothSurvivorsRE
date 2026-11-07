# Active player-aura grouping

The installed 145,357,824-byte EXE has SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This report owns the source/static repair for **#178**. Multiple active rows
of one spell now publish one helpful aura slot with their application count
and latest expiry. Compilation, actual party/addon rendering and controlled
original/rebuilt comparison remain unverified.

## Native contract and implementation

The canonical [Druid manifest](evidence/0.119.0/druid-release/manifest.json)
binds the existing journaled Ghidra publisher result
`ev_505f6c2f397b33bca86ac0eb9a294bea4d1a9d33c1428c7e4a234a0721be6665`
and exact instructions `145b8bd9c..145b8beb5` (281 bytes / 60 instructions).
The original full-PE result and its plan, journal, seed, profile and producer
commitments were verified and reused; this repair adds no duplicate native
extract or Ghidra Program.

The publisher reads each 32-byte input row's spell at `+0x14` and expiry at
`+0x18`, admitting only `expiry > now`. It searches its existing 12-byte output
rows by spell, preserving the first admitted encounter order. A first row
starts with count 1; later matches increment its u32 count and retain the
maximum expiry. Equal expiries select the incoming float bits, including signed
zero. Unordered expiry or clock comparisons are not admitted. Source GUID and
status/healing payload do not participate in this presentation grouping.

`run_effects/player_auras.rs::PlayerAuraInputs::slots` now implements that
ordered active prefix. Grouping finishes before helpful slots are truncated
to 32. Later generic shield, temporary-stat and permanent-effect producers
still append separate rows, even when their spell matches an active row.
Harmful rescue/cooldown markers remain in their independent 16-slot partition.
The caster-aware healing identity/delivery repair has its own owner **#177**;
grouping display slots does not merge or mutate its healing rows.

The existing `PlayerAuraState::publish` feeds the grouped result into its
shared field publisher. IDs occupy fields 47–94; applications occupy bytes of
fields 113–124 with `min(count,255)-1`. Changes in count can therefore update
an application byte without adding another spell icon. Expiry remains in the
stored projection, and an expiry-only change emits no redundant field update.
Both live adapters (`gameplay/mechanics/effects.rs` and the cast adapter in
`gameplay/mechanics.rs`) already publish the actual execution aura slice through
this shared code. Their `RunEvent::Aura` reaches `gameplay/client/events.rs`
as an `ObjectValues` update for its target; existing benilla field watches
deliver `UNIT_AURA` and per-byte application notifications. These consumers
are source-traced reuse, with their historical native provenance retained;
this repair does not claim the shipped client's whole engine revision or
multiplayer delivery equivalence.

## Checks and limits

```sh
PYTHONPATH=runtime/tool-state/python/armory/python-libs:runtime/tool-state/python/camera/python-libs python3 -B scripts/check-player-aura-grouping.py
```

**278 bounded original-instruction cases pass.** They cover mixed and repeated
spells, first-encounter permutations, distinct source GUIDs, zero through 300
same-spell rows, 40 distinct spells, expiry before/equal/after now, infinities,
NaNs and equal signed-zero expiries. Each case compares exact output spell,
expiry bits and count against independent ordered buckets and verifies the
input rows were not modified. The sole vector-reserve call is a synthetic
preallocation seam; allocator behavior and the remainder of the native
publisher are not executed.

The checker also verifies selected-target bytes, canonical extract hashes,
the retained original publisher query commitments when available, grouping and
partition source guards, both live publication adapters and the reused
`UNIT_AURA` signal. A stdin-only Rust syntax parse passes. Three authored Rust
regressions cover grouped order/expiry, later-producer separation
and helpful truncation/application saturation, and count/removal field changes.
Those regressions remain uncompiled and unrun; the native replay does not
execute the Rust implementation.

No further source omission was identified within #178's grouped-aura consumer.
No build, compiling test, game/client/network/server run, save/configuration
mutation or original/rebuilt visual/gameplay comparison was performed.

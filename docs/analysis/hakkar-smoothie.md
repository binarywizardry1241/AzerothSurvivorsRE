# Hakkar Smoothie description and eligibility

Selected installed EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This is the bounded source/static repair for **#170**.
[verification-needed](../verification-needed.md) owns remaining validation.

## Corrected descriptor and localization

The achievements.rs Location-owned constructor `145b39760..145b3fb31`
loads the Hakkar Smoothie title at `145b3e6cd` and the exact **101-byte**
description at `145b3e718`. It calls current lookup `145b29ab0`, then selects
the returned pointer/length or the original string on a miss. The key is:

> Defeat Hakkar with 5 Warriors, all talented into Bladestorm. Whirlwind must deliver the killing blow.

The historical source descriptor included “in co-op” and consequently missed
the current translated keys. `Catalog::embedded` now applies
`assets/hakkar-smoothie-0.119.0.json` alongside the seven friend-required
description overrides. The separate asset preserves the historical catalog and
the existing seven-description evidence unchanged. Both the achievement card
and earned notification use `Achievement::label` with the resulting descriptor.
All fourteen native locale catalogs contain this exact key; their independent
restoration and loader contracts remain owned by [#169](locale-catalogs.md).

## Eligibility recovered independently of the wording

Constructor stores `145b3eef6..145b3efc6` connect stable key `coop:smoothie`
to condition variant **9**, max-modifier requirement **false**, boss **994**,
one spell **1680**, and composition variant **1** with key `bladestorm`
and class byte **1**. Exact instruction operands and pointed-to data establish
these associations; the removed phrase is not evidence of a solo rule.

The current evaluator loads these fields at `145b42e19..145b42e6e`.
Its signed-relative table at `1475e25b0` sends variant 9 to `145b42faa`:

- A cooperative context and at least one captured lethal event are required.
- Match the event's boss ID, then pass its own member pointer/count to
  `145b33760`. Current membership and a recipient's killing-blow ownership are
  not substituted for this snapshot.
- Exactly five members must each have class byte 1. The talent branch
  `145b3391a..145b339c0` recognizes `bladestorm` and tests bit **2** for every
  member; Tranquility's separate bit does not satisfy it.
- For this nonempty spell list, reject source kind **2** and require lethal
  spell ID **1680** (Whirlwind). Victory and max modifiers are not required by
  this descriptor/branch. The empty-spell branch is a separate contract.

The existing `CooperativeCondition::Boss` / `CooperativeParty::Talent` source
already implements these clauses. No eligibility change was warranted.
The live producer projects the talent bit in `party_achievements::member`;
the party tick captures the roster before hero simulation, and `bosses.rs`
clones it with the lethal boss/spell/source fields before death callbacks.
Shared-context publication and replica receipt feed `grant_party_feats`, then
the common Save writer. Earned-key insertion and first-date handling are
additive and idempotent. These source connections are retained; actual party,
Save and notification delivery have not been executed by this repair.

## Evidence and checks

The [manifest](evidence/0.119.0/hakkar-smoothie/manifest.json) references the
existing three completed current-target REA/Ghidra results and canonical owner
hashes in [friend achievements](evidence/0.119.0/friend-achievements/manifest.json).
Only the missing selected instruction spans are retained in the new assembly;
shared instructions keep their canonical earlier extract. No new Ghidra import
or duplicate Program was needed. Full-PE pseudocode has unresolved computed-flow
and overlapping-instruction warnings, so the selected branch uses exact native
instructions and table bytes rather than extrapolating whole-function semantics.

```sh
python3 -B scripts/check-hakkar-smoothie.py --require-retained-queries
PYTHONPATH=runtime/tool-state/python/armory/python-libs python3 -B scripts/check-hakkar-smoothie.py --require-retained-queries --replay-instructions
python3 -B scripts/check-reconstruction-coverage.py
```

The scoped check verifies current identity, exact native/data/extract/query
hashes, fourteen locale keys, constructor fields and the connected source.
**235 original-instruction predicate fixtures** plus the constructor stores
pass, visiting 168 instruction sites. They cover counts 0–7, both talent bits
and unrelated high bits, class/talent failures at every position, lethal source
kinds 0–3, wrong boss/spell, absent events and victory/modifier independence.
Typed fixture memory and predicate-boundary stops isolate the selected code;
the fixture does not execute the reconstructed Rust or a game/service.

No further concrete source omission was found within #170. Compilation,
rendered translations, actual cooperative grants/persistence and controlled
original/rebuilt gameplay/UI parity remain **unverified**. Wider achievement,
party, localization and engine contracts retain their separate owners and limits.

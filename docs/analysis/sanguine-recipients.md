# Sanguine recipients

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
This completes the feasible source/static repair for **#262**. The
[manifest](evidence/0.123.0/sanguine-native.json) binds six journaled Ghidra
queries, exact original producer/filter ranges and the live source receipt.
The wider [0.121.0 affix recovery](heroic-affixes.md) keeps its original
provenance and is not automatically revalidated by this recipient repair.

## Current constructor meanings

The existing current pool query at `145b65e70` collects recipients through
`145ca02b0..145ca0580`. Four fields precede inclusive XY radius-squared36:

| Actor field | Current producer and meaning | Source owner |
| --- | --- | --- |
| byte `+b0 == 0` | Constructors initialize the living/dead lane to zero; the pool's later lookup independently refuses dead state1. | `RunActor::actor.dead` |
| i32 `+d0 == -1` | Ward constructor `145b22600..145b228e8` copies its four-word configuration into `+d0`; ordinary, primary-boss and guardian constructors set the absent discriminant. Its 13 current name/entry/display/scale records at `146fdb860` match `raid_wards.rs::TEMPLATES`. | Separate `boss_state.wards.actors` |
| i64 `+18 == -1` | Primary-boss construction `145b64b60..145b6596f` fills this phase/ability-vector header; ordinary, guardian and ward constructors set absence. | Separate `bosses` registry |
| i64 `+58 == -1` | Guardian construction `145b8be40..145b8ccbd` fills the timer-vector header before appending to the shared actor vector; ordinary, primary-boss and ward constructors set absence. The same constructor consumes and marks the lair row at Game+6c0. | `guardian_state.actors` alongside `actors` |

Ordinary/elite construction `145b51390..145b51cd7` initializes all three optional
subtype headers absent. Each producer copies a complete **0x1e0-byte** record
into Game+5b8 at count Game+5c0; the retained assembly includes this copy boundary.
A present zero-capacity boss/guardian vector is still present: its header is0,
not the absent sentinel-1. The current predicate excludes it. Ghidra raw-slice
types are provisional, and its external memcpy seam does not replace tracing
the original stack offsets and destination.

## Connected source

`Mechanics::tick_affix_pools` now visits living ordinary/elite horde rows and
rejects guardian GUIDs through the actual `guardian_state` registry populated
by `spawn_due_guardians`. It no longer visits the separate primary-boss list.
Ward actors remain in their separate existing registry and are not visited.
This represents the four recovered gates without adding a second subtype flag
or another source of actor identity.

The existing pool producer, expiry-before-heal order, one-second stored deadline
advance, interpolated XY sampling, inclusive six-yard radius, 10%-maximum-HP
request capped to missing health, field22 publication and reverse expiry/marker
removal remain connected to their existing consumers. Elite horde remain eligible;
the repair does not use the elite flag as a guardian test.

## Static validation and limits

```sh
python3 -B scripts/check-sanguine-recipients.py --python-path runtime/tests/query-python-deps --python-path runtime/tool-state/python/armory/python-libs
```

The [bounded check](evidence/0.123.0/sanguine/static-check.json) verifies all six
exact current query subjects, original producer/filter bytes and assembly,
13 ward template rows, the repaired source receipt and the live source
connections. It parses the changed Rust file without compiling it.
**99 isolated original-instruction cases / 791 steps pass**: 81 gate combinations,
six radius/interpolation cases and12 constructor-header cases. The fixtures use
synthetic actor/frame/register inputs and stop before external calls; they do not
execute the reconstructed application.

Two authored Rust regressions exercise the live pool path: ordinary and elite
horde at/inside the radius, dead/outside actors, guardians, primary bosses and
wards; and expiry priority, stored deadline cadence and missing-health capping.
They are **uncompiled and unrun**. Compilation, actual combat timing, visual
markers, multiplayer delivery and original/rebuilt parity remain unverified.
No application, game, server or network service was started.

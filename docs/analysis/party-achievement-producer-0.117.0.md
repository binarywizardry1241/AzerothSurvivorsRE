# Shared party-achievement inputs — 0.117.0

The selected installed EXE is **0.117.0**, 145,283,072 bytes, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
This bounded recovery supports **#157**: every recipient can evaluate a shared
boss-kill context even when a different hero delivered the killing blow.
[verification-needed](../verification-needed.md) owns the complete finding and remaining
validation; the [wire contract](party-achievement-wire-0.117.0.md) owns State15
serialization and inbound admission. Achievement definitions/predicates and the
account writer remain separate consumers.

The [curated manifest](evidence/0.117.0/party-achievement-producer/manifest.json)
binds ten instruction ranges, six constants and two completed journaled Ghidra
queries to this exact EXE. Preferred addresses below are static PE addresses.
The canonical assembly includes original instruction bytes; the replay verifies
its complete concatenation against the installed EXE. Raw Ghidra imports omit
surrounding PE data and external callees, so their inferred types/ABI are not
original source. Direct PE reads independently establish the selected thresholds
and talent keys. The guarded query launcher retains matching Programs/results;
generic ephemeral-session wording in the underlying provider does not describe
that launcher retention.

## Native contracts and live source

`145ab07c0` builds the current snapshot and calls `145b84e60`. The latter returns
an optional 56-byte cooperative context only when Game `+c85 == 1` and the retained
remote count at `+998` is nonzero. It clones the member vector at
`+a90/+a98/+aa0`, the event vector at `+aa8/+ab0/+ab8`, the shared death counter
at `+c6c`, and the maximum-difficulty flag. Retained presence is distinct from
filtered member count: a departed hero keeps its native row, while the member
projection omits abandoned rows.

The shared tick `145b7cff0` advances its clock, refreshes live-hero context and
rebuilds the complete member vector at `145b7d0bc..145b7d4f6`, before local and
remote hero simulation. It includes the local hero first unless its finished
flag `+c77` is set. The remote mapper `145c22000..145c223ff` follows retained
remote order and skips exactly `Remote+983 == 1`. Neither path excludes a down,
dead or victorious hero merely because of its phase or health.

Each native eight-byte member row stores a spell word at offset0, class byte
at offset4 and two talent flags at offset5:

- The spell word is the descriptor spell ID of the **unique** highest-ranked
  equipped ability. Empty ability lists and tied highest ranks produce0.
  Ranking uses unsigned rank words; a unique rank0 row is still selected.
- Class is the actual hero's class byte at `+33c`.
- Bit0 means a nonzero `tranquility` allocation; bit1 means a nonzero
  `bladestorm` allocation. The exact native keys are at `1475c67ec` and
  `1475c6b17`.

The context's maximum-difficulty flag requires density **>=500**, health
**>=500**, damage **>=300**, and speed **>=150**. All four comparisons use the
native unsigned16 settings, and all four must pass. The exact constants are
`1472a56de`, `1472a570e`, `1472a573e` and `1472a576e`.

The synchronous lethal boss-hit writer `145bd5f30` first records the killer's
ordinary boss-killing-blow row. Its cooperative branch then copies the cached
member vector into a new40-byte shared event at `145bd692d..145bd6a6f`, before
subsequent kill callbacks. The event preserves boss ID, normalized killing
spell, school, source kind and melee classification from that same lethal hit.
The membership comes from the beginning of the tick; it is not recomputed after
callbacks or inferred from damage meters or a transport roster.

The irreversible-death owner `145b95bf0` counts cooperative deaths with wrapping
`u32` arithmetic at `145b9603b`. Its solo branch returns without incrementing.
Abandon `145ba5dc0` admits active phases1..3, marks finished first, and then calls
the death owner; finished heroes skip the counter increment. The complete
straight-line hero swap `145ba8140..145ba94a1` maps Game `+c77` to Remote `+983`
and omits the shared counter and both shared vectors. Consequently, actual
cooperative deaths accumulate across all swapped heroes, while voluntary leave
and disconnect do not add deaths. New Game construction initializes the counter
to0. Revival does not erase it.

The implemented consumers are
[the member selector](../../crates/azeroth-survivors-re/src/gameplay/mechanics/party_achievements.rs),
[shared BossState and lethal capture](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs),
[ordered member refresh and State15 context publication/receipt](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs),
and [the irreversible-death path](../../crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs).
The private hero swap does not own the new shared state. Each event keeps its
copied membership after subsequent death, abandonment or departure. A recipient
still needs its separate account eligibility and dated/idempotent writer; this
producer evidence alone does not establish persistent delivery.

## Static replay and limits

Run:

```sh
python3 -B scripts/check-party-achievement-producer.py --require-retained-queries
```

The replay verifies **10 current native ranges / 9,304 bytes / 1,693
instructions**, six constants, the complete shared/private swap boundary, the
actual source selector/capture/death/publication connections, and the retained
plan/result/profile/journal commitments for both Ghidra queries. Without the
option, unavailable ignored query payloads are reported as not run; direct
native/source checks still run. It does not execute native or rebuilt gameplay.

Rust compilation and compiling tests, actual client/game/network/server
execution, save delivery through a real connection/filesystem, and controlled
original/rebuilt parity remain unrun. Bounded source correspondence does not
close wider native alias/type/dispatch coverage under #41.

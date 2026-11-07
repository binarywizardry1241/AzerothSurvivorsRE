# Recurring boss volleys

This completes the recurring-volley **input and flight-time repair** under #42.
The live catalog now has exactly the selected target's 26 recurring volleys:
Princess Huhuran uses spell **26053**, sixteen repeat intervals are corrected,
and King Gordok's obsolete Fireball volley is removed. Every landing now waits
at least **0.6 seconds**, including attacks launched at melee range. Other raid
mechanics and complete volley hazard/presentation equivalence remain open.

## Target and evidence

The installed 0.108.0 input is SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
[Registration](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/target-refresh-0.108.0.json) owns its identity. The
[catalog](evidence/0.108.0/boss-volleys/catalog.json) records all sixty boss IDs,
including the 34 with no recurring native tag4 move, and exact current move
bytes/addresses/hashes. Current records use the already recovered 104-byte boss,
56-byte scheduled move and tag byte45 layouts; semantic source tag1 is an
adapter, not that native ABI. The current native slot is retained as evidence;
other source move kinds and their mixed ordering retain separate provenance.

The [manifest](evidence/0.108.0/boss-volleys/manifest.json) binds selected dispatcher
instructions and the canonical shared repeat extract to the exact EXE. Fresh
REA/Ghidra 12.1.4 analysis imported the full `145950bf0..145956052` dispatcher
at its original VA, with its thirty jump-table destinations explicitly seeded.
The retained [volley pseudocode](evidence/0.108.0/boss-volleys/dispatch.pseudo.c)
is a branch aid. Seeds are analyst assertions; the raw import uses the generic
`gcc` compiler spec and does not resolve original external data/calls. Win64
registers, scalar constants and original branch instructions were inspected
separately. This is bounded recovery, not complete native ownership (#41).

## Recovered inputs and flight calculation

The current native tag4 branch is nonblocking. It reads spell and count at
payload+0/+4. Initial timers retain the constructor's `repeat * 0.6f32`;
normal/enraged repeats use `repeat` / `repeat * 0.7f32`. The recurring catalog
has no tag4 record for Gordok. The selected source removes that record instead
of replacing it with a zero-count or infinite-cooldown substitute.

Sixteen intervals differ from the retained historical inputs: Morbent Fel,
Lord Kazzak, Marez Cowl, Lord Aliden Perenolde, Jin'do, Hakkar, Whitemane,
Azuregos, Thaurissan, Executus, Nefarian, Huhuran, C'Thun, Noth, Sapphiron and
Kel'Thuzad. Counts and the other ten recurring volley inputs are revalidated
against this EXE. Huhuran's source spell changes from 5176 to 26053.

`145950ff8` and its lookup branches use the existing hardcoded missile speeds,
with **10** as the unknown-spell fallback. Spell 26053 takes that fallback.
The first landing's arithmetic at `1459558de..145955919`, and every later
landing's at `145955d2f..145955d6a`, compute the ordered f32 XY squares, sum,
square root, division by speed, then `MAXSS(delay, 0.6f32)`. Thus NaN distance
selects the floor too; Z never participates. Add the delay to the current run
clock only after that clamp. The earlier source used bare distance/speed and
could resolve in under a frame at point-blank range.

The first projectile still consumes its `0..1` phase draw with radius zero.
Later projectiles consume that draw, then a `2..6` radial draw, and add the
phase to `(index/count)*TAU`. Current inline instructions revalidate the
existing shared-RNG port, including rejection and state advancement. The
0.45 damage factor and 2.5-radius circle are visible in the current producer;
this repair does not certify the rest of the generalized hazard lifecycle.

## Live source and checks

`guardians/catalog.rs` remains the one boss-input owner. `BossAiState::new` and
`advance` read its actual initial/repeat timers; deferred `dispatch_queued`
reads the current actor again and calls `abilities::dispatch`. That live
MissileVolley branch now calls `missile_travel_delay` when constructing each
pending impact. The existing pre-actor `resolve_boss_effects` stage drains those
impacts through the actual player-damage adapter. No disconnected oracle or
visual-only replacement is used for these repaired inputs/deadlines.

`python3 -B scripts/recover-boss-volleys.py --check` verifies all sixty memberships,
26 current records and source tracing guards, then passes **259 bounded native
cases**: 27 speed branches, 162 first/later flight pairs, 52 normal/enraged
repeats and 18 later-aim/RNG cases. Unicorn runs only selected no-call EXE
instruction spans with synthetic state; it does not run compiled Rust or the
game. Flight pairs count as one case while checking both native lanes.

Authored Rust regressions cover current membership/spells/counts/initial timers,
repeat and flight cases, RNG advancement and live dispatch/deadline resolution
at melee range. Historical catalog/timer checks filter superseded volley and
summon inputs on both sides, preserving the other historical comparisons after
Gordok's slot removal. Rust files parse with the project-installed rustfmt;
Python files parse with `ast.parse`. Compilation, compiling tests, game launches
and original/rebuilt comparisons were intentionally not run.

Fresh bounded REA inputs can be staged without starting analysis:

```sh
python3 -B scripts/prepare-boss-volley-rea.py
python3 -B scripts/rea-batch.py runtime/analysis/history/raid/boss-volleys/4de5482ea03e/rea-preparation/plan.json
```

Raw slices, databases and tool responses remain ignored. The existing minion
report owns the shared constructor and repeat extracts; they are referenced,
not copied as another assembly extract here.

## Remaining scope

#42 remains open. Other boss moves/phases, stance-replaced schedules, delayed
sequences and all thirty-seven guardian signatures are outside this bounded
repair. Volley impacts still use the retained `PendingEffects` route: migration
to the current generalized hazard owner, combined source attribution/damage,
removal/cancellation and actual marker publication remain separately required.
The source has not established mixed encounter ordering or complete native
cast/target/damage behavior. Presentation is #43. No build, gameplay, rendering,
audio, Windows or complete encounter parity is claimed.

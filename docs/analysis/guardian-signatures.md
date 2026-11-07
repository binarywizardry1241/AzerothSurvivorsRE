# Guardian signature schedules and reset

Live guardians select their current native signature and use all120 recurring
records and fifteen health-phase effects across forty possible lists, including
real wards, nested sequences, further geometry and actor interactions. Their
initial timers, health-phase latches, replacement lists and leash reset follow
the current native contracts. This connects the bounded guardian portion of
**#42**; compilation and original/rebuilt encounter parity remain unverified.

## Target and native evidence

The installed 0.109.0 EXE has SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The recovery tool resolves `coverage_common.latest_target(verify=True)` and reads
the configured installed file directly. It rejects changed bytes. No game,
compiler or compiling test is launched.

The [catalog](evidence/0.109.0/guardian-signatures/catalog.json) binds all thirty-seven
signature identities, forty base/alternate lists, 120 recurring records and
fifteen phase records to exact bytes. The
[manifest](evidence/0.109.0/guardian-signatures/manifest.json) owns the compact
canonical assembly ranges. [REA provenance](evidence/0.109.0/guardian-signatures/rea-provenance.json)
records three completed Ghidra 12.1.4 imports through `./scripts/rea` and their
pseudocode hashes.

| Native owner or fragment | Range, end exclusive | Contract |
| --- | --- | --- |
| Guardian identity selector | `14588d220..14588d582` | Thirty-seven ID-to-signature results; other IDs return null |
| Guardian decision/reset | `145899e70..14589a216` | Restore chosen list and half-repeat timers; clear phase latches |
| Guardian constructor fragment | `14593e120..14593e4ab` | Shared RNG variant choice, selected list and initial half-repeat timers |
| Common phase fragment | `145979b20..145979ce0` | Strict health threshold, original index latch, phase-before-recurring order |
| Guardian recurring fragment | `14597a230..14597a491` | Current health repeat scaling, cast/queued-action gates, native slot order |
| Phase packet producer/helper | `14597c453..14597c47a`, `1458c12b0..1458c12ba` | RAID_BOSS_EMOTE (`0x5a`), inline name and raw text template |
| Current zone input consumers | `14599c230..14599c297`, `14599c612..14599c67a` | Current zone table, enemy stride and boss health-knot input |

The selector is a leaf outside the declared unwind inventory. Its current bytes
and all return paths are independently checked; the missing unwind entry is not
treated as absent behavior. Ghidra's raw imports use a generic compiler
specification and omit external code/data. The selector's four-way jump table
is outside its raw import, and the scheduler is a deliberate fragment of the
larger actor owner. Instruction review and bounded original-byte execution
resolve these selected contracts; global native ownership remains **#41**.

## Recovered inputs and scheduling

The signature table starts at `146be71d8`, with 56-byte rows. A row stores
base moves at `+0/+8`, alternate-list descriptors at `+16/+24`, phases at
`+32/+40` and enemy ID at `+48`. Recurring moves retain the current 56-byte
layout with tag at byte 45 and repeat at `+48`. Phases use 72-byte rows with
payload at `+16`, tag at byte 61 and threshold at `+64`. These current native
records are converted to semantic source records, rather than aliases of the
historical 28-byte ability representation.

Anubisath Sentinel (1110) has three alternate lists in addition to its base
list. All other current kinds have only their base list. Every guardian
constructor performs the original shared RNG rejection draw, including kinds
without alternatives: reject a result with bit 57 set, then use its high six
bits modulo the number of available lists. The live spawn loop draws each
guardian's choice before the next lair can spawn. A leash reset retains that
choice.

Guardian initial and reset timers use **repeat × 0.5**, independently of the
boss constructor's 0.6 factor. Every admitted tick decrements all slots. A due
slot resets only after admission, discards overshoot and fires at most once.
Repeats use 0.7 while current health is strictly below the rounded
`maximum_health × 0.3`; guardian scaling is not the boss's latched enrage.

Native tag normalization and bit mask `a0180006` identify nonblocking moves.
For the current enum, tags 4, 5, 22, 23, 32 and 34 are nonblocking, as are the
normalized tags below 3. A cast deadline suppresses blocking requests. An
earlier queued blocking action for the same actor also suppresses them. The source preserves that ownership for all current actions, including their
timer reset and overdue behavior. Native generic duration is recovered for
every recursively reachable payload.

Phases check at most 32 original entries, use the strict
`health / max(maximum_health, 1) < threshold` comparison and latch before
queuing. A NaN maximum selects the native numeric denominator 1. Phase requests
precede recurring requests, and healing leaves their bits set. Leash reset
clears the bits and rebuilds the selected list's initial timers. Cast and
movement-hold deadlines are distinct fields retained by the native reset lane.
Phase text uses the actual emote path, preserving `%s` for FrameXML's inline
speaker substitution.

## Connected source

`guardians/signatures.rs` owns the recovered state; its generated
`signature_catalog.rs` supplies current inputs. The live guardian adapter uses
the current constructor, admitted common actor stage, current phase emotes and
the shared `dispatch_guardian_raid_requests` path. It no longer invokes the old
universal Charge/Thunder Clap/four-minion triple on every guardian. Historical
guardian helpers and fixtures retain their actual 0.97.2 provenance.

All **120 recurring records and fifteen phase effects** now reach their
current effect consumers. Source connections are generated and independently
checked by `scripts/connect-raid-mechanics.py` against the current records
and each family's canonical evidence. The signature recovery tool retains
catalog/state checks instead of a second source generator. The
[complete raid graph](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md) additionally follows nested children
and replacement schedules; the generated signature catalog contains no missing
`ability: None` entries.

[Lines](raid-lines.md), [cones/knockbacks](raid-actions.md),
[pools](raid-pools.md), [shields](raid-shields.md),
[wards](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-wards-0.109.0.md), [sequences](raid-sequences.md) and the
[remaining native families](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md) share the live effect
scheduler and real movement, marker, warning, aura, defense, healing, damage and
actor ports. Wave constants remain in the [wave consumer](raid-waves.md).
Minions use real actors and volleys use the shared hazard lifecycle. There are
no guardian tower/bomb records in the current root table.

Native0/1/2/32 replacement lists use repeat×0.5+1 initial timers. A leash reset
restores the originally selected signature and its repeat×0.5 timers, clears
phase latches and preserves the chosen alternate-list identity. Current form
changes publish recovered unit fields and use the guardian's actual spawned
scale for fallback. Return-home movement joins the shared movement-publication queue and
clears only the native shield deadline. Engagement rescaling, health fields
and aggro text follow periodic damage, raid actions and wards, as recorded in
the [shared actor frame](actor-frame-order.md). Existing placement, scaling,
death/reward and shared engine dependencies retain their owning recovery
limits; source-record completeness does not establish complete encounters.

## Static checks and limits

```sh
python3 -B scripts/recover-guardian-signatures.py --check
```

The check passes exact target/range/data hashes, generated constants, live source
tracing guards and **2,352 bounded native instruction cases**: 1,600 selector
inputs, forty reset lists, thirty-two shared RNG transitions, 128 list-index
inputs, 120 strict phase/latch cases and 432 cast/queued-action gates. Every
executed native fragment rejects external calls; state is synthetic and no
reference game process runs. Source guards inspect text and call paths; they
are not a Rust type checker or execution of the reconstructed source.

Changed Rust sources/regressions parse with the project's
`rustfmt --emit stdout`; the Python recovery tool parses with `ast.parse`.
Five Rust regressions were authored for current counts/timers, overdue holds,
nonlatched health scaling, reset/phase behavior and native gate classification.
They were intentionally not compiled or run. The complete raid graph checks
add493 native duration,163 producer, ten form-field and fourteen marker-kind
cases; their seams and limits are recorded with the raid owner. Compilation, game behavior,
terrain/rendering, audio, platforms and original/rebuilt parity remain
unverified.

To stage reproducible Ghidra inputs without starting analysis:

```sh
python3 -B scripts/recover-guardian-signatures.py --prepare-rea
python3 -B scripts/rea-batch.py runtime/guardian-mechanics-0.109.0/selector-plan.json
python3 -B scripts/rea-batch.py runtime/guardian-mechanics-0.109.0/decision-plan.json
python3 -B scripts/rea-batch.py runtime/guardian-mechanics-0.109.0/scheduler-plan.json
```

Raw slices, databases and full protocol responses remain ignored under
`runtime/`. Only compact behavioral evidence is retained with source.

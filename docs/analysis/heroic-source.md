# Heroic core source

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [source proof](evidence/0.121.0/heroic-source.json) binds the exact current
descriptor bytes, original instruction selectors, reused Ghidra receipts and
the implemented [Heroic core](../../crates/azeroth-survivors-re/src/heroic.rs).
The [retained helper proof](heroic-native.md) supplies the independent
rank-name and affix-selector contracts. Permanent finding #240 owns the wider
source reconstruction; #243 already supplies its bounded helper registration.
[verification-needed](../verification-needed.md) owns current implementation status and limits.

## Core contracts

The native descriptor table starts at `0x146fca2e0` and contains five 48-byte
rows, corresponding to ranks I–V. Each row has two pointer/length English twist
slices, followed by four `f32` fields. Current guardian, boss-loot/mark and
terminal talent-experience consumers independently establish all four meanings.

| Rank | Health | Damage | Marks | Loot/XP reward |
| --- | ---: | ---: | ---: | ---: |
| Normal | 1 | 1 | 0.5 | 1 |
| I | 1.79 | 1.65 | 1 | 1.3 |
| II | 1.97 | 1.77 | 1.25 | 1.4 |
| III | 2.16 | 1.88 | 1.5 | 1.5 |
| IV | 2.45 | 2.01 | 2 | 1.6 |
| V | 2.72 | 2.16 | 2.5 | 1.7 |

Current guardian owners `0x145c4e9e0..0x145c4ee03` and
`0x145c4eed0..0x145c4f08f` load the rank byte from game state `+0x36f`.
They select the health/damage fields at table-relative `rank * 48 - 16/-12`
only for ranks 1–5; every other byte rank uses `1.0`. These defaults are specific
to the scalar consumers. The name helper instead takes its explicit six-entry
bounds-failure path for rank 6 or greater.

Current leaf helpers `0x145ac0270..0x145ac02a6` and
`0x145ac0330..0x145ac0366` select the marks/reward fields at offsets 40/44.
They default to Normal's 0.5/1 outside ranks I–V. Boss roll `0x145c135f0`
independently consumes both scalars. Terminal XP `0x145b28410` separately caps
its rank byte at V before its own reward lookup; that caller normalization does
not change the raw helper's invalid-byte default.

The source retains all ten authored twist strings without using their wording
as proof of the corresponding gameplay effect. The existing localization
consumer supplies translations and original-key fallback. `descriptor` returns
only a valid I–V row; `health_multiplier` and `damage_multiplier` reproduce the
actual scalar-consumer defaults independently of label admission.

`rank_name` returns the supplied localized Normal label for rank 0, or localized
Heroic plus one ASCII space and Roman I–V. Its array bounds preserve the native
failure domain. `affix_ids` preserves the already recovered byte-rank behavior
and ordered numeric IDs: none below III, one at III/IV, and two distinct IDs at V
or greater. It assigns no gameplay meaning to those numeric tags.
`selector_from_inputs` preserves the construction callsite's wrapping
`u64(input_hash + 7 * u32(discriminator))`; the origin of those inputs is a
separate caller contract.

The current Pick eighth-field parser is separately recovered at
`0x145abffc0..0x145ac0085`, inside the previously retained Heroic raw subject.
`parse_rank` accepts strict ASCII decimal `u8` text, including an optional
leading `+`. Empty, negative, malformed and overflowing values become Normal;
a successfully parsed byte is then capped at V. Thus `6` and `255` become V,
whereas `256`, `999` and the legacy four-modifier CSV become Normal. There is
no whitespace trimming or partial numeric prefix acceptance. The actual Pick
field producer and absent-field default remain the save consumer's contract.

The shared [calendar module](../../crates/azeroth-survivors-re/src/heroic/affix_calendar.rs)
owns `current_week` and `zone_selector`. Weeks are unsigned Unix-epoch intervals
of exactly 604,800 seconds, with error fallback 0 and truncation to `u32`; there
is no Monday offset. Exact authored zone keys map to their native ordinal and
unknown keys map to 0, then reuse the one wrapping selector arithmetic owner.
The current `0x145ac9f90` Ghidra result and original instructions bind the clock
producer, including the Unix epoch's Windows FILETIME representation.

The [current twist proof](evidence/0.121.0/heroic-twists/manifest.json) and exact
current selectors supply the following shared policies. These are scalar
selection helpers, with the original caller's admission and ordering preserved
by its actual source owner.

| Core helper | Exact current choice |
| --- | --- |
| `healing_factor` | Rank V or greater: 0.5; otherwise 1. |
| `warning_factor` | Any nonzero rank: 0.85; Normal: 1. |
| `revive_seconds` | Rank V or greater: 9; otherwise 6. |
| `revive_health` | Rank V or greater: 0.3 of maximum health; otherwise 0.5. |
| `guardian_health_per_kill` | Rank II or greater: 0.35; otherwise 0.25. |
| `guardian_damage_per_kill` | Rank II or greater: 0.07; otherwise 0.05. |
| `guardian_respawn_seconds` | Rank II or greater: 150; otherwise 180. |
| `boss_repeat_factor` | Rank II or greater: 0.6 enraged / 0.8 ordinary; lower ranks: 0.7 enraged / 1 ordinary. |
| `raid_damage_factor` | Rank IV or greater: 3; lower ranks: 1 in Endless, otherwise 2. |
| `free_rerolls_base` | Rank III or greater: 1; otherwise 3, before account perks. |
| `cache_initial_price` | Rank III or greater: 25; otherwise 20. |
| `cache_cost_increment` | Rank III or greater: 6.25; otherwise 5, after the existing purchase multiplier. |

The revive duration selector is independently present in cooperative update,
ordinary update and revive-progress consumers. The health-restoration consumer
multiplies maximum health and writes actual current health. The raid factor
belongs only to positive aggregate raid-hazard damage after marker/time
publication; it does not authorize multiplying each individual effect early.

## Native boundary and static evidence

Six additional journaled Ghidra queries classify adjacent owners as
cleanup/deallocation, localized-key formatting and string-split support. Those
bounded results expose no additional Heroic rank policy. Recovery stops at that
supporting interface rather than reconstructing the surrounding engine.

The two guardian Ghidra results are reused from the current Difficulty recovery;
they are not rerun or copied into another analysis database. The proof verifies
their raw mappings, provider/profile, plan, completed operation, journal and
saved-result commitments against the selected installed image.

The non-compiling check verifies all five descriptor rows, exact source float
bits, ten authored strings and shared policy source constants/guards. It replays
**2,560 original-instruction scalar-selector cases / 23,050 instruction steps**,
covering every byte rank for all four descriptor scalars and six further policies.
Synthetic memory and register inputs isolate these scalar selectors; surrounding
gameplay calculations are not executed. The Pick parser passes **4,609 original
instruction cases / 355,354 steps**, covering numeric/overflow boundaries,
optional signs, every single-byte input, malformed/CSV/Unicode data and long
leading-zero sequences. The twist proof separately retains its original
guardian, respawn, cooldown and hazard cases, without duplicating their extracts.
The calendar passes **67 zone-key and 24 week cases / 1,504 original instruction
steps**, including case/length/unknown-key boundaries, epoch edges, error
fallback and `u32` wrap. Clock APIs are explicit synthetic fixture interfaces;
the host clock and rebuilt source are not executed by these cases.
The retained helper replay passes **174 affix cases and 16 rank-name cases /
7,569 instruction steps**. The source also passes the installed Rust formatter's
syntax/format check, which performs no compilation.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-heroic-source.py
```

Current live integrations include Difficulty labels/descriptors, Pick parsing,
run/guardian scalars and respawn, healing, warning/cadence, co-op revive/HUD,
cache controls and aggregate raid hazards. Calendar capture, private reward and
affix gameplay consumers retain their separate source owners and validation.
These core contracts do not establish complete Difficulty UI, save/unlock,
co-op admission, rewards or affix gameplay behavior. No Rust
compilation or execution, game/client/network/server operation, installed
save/settings mutation or original/rebuilt comparison is performed. Functional,
rendering and gameplay parity remain unverified.

# Treasure-chest source component

> Historical **0.92.0 source milestone** (`512b0c3`). The subsequent
> 0.97.2 recovery checkpoint
> includes the updated 12-zone catalog, secondary terrain provider and new
> item-upgrade/mob-loot components. See the [current owning report](treasure-loot.md).
> The source links below point to the current files; this report's recorded
> behavior and validation refer to that older milestone.

Implemented and compiled **2026-10-18** from the [recovered 0.92.0 chest system](treasure-chests.md).
This component's recovered behavior is bound to the **0.92.0** EXE, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The repository now targets [0.97.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.97.2.md); this source and its
nine-zone catalog have not been revalidated against that build.

The source is a reusable Rust library component in the existing
`azeroth-survivors-re` package. **The menu still does not enter gameplay.**
This task builds the chest subsystem; it does not supply a gameplay loop,
terrain loader, rendered chest entities, loot UI or addon VM integration.
No game was launched during this source checkpoint.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation and validation status.

## Source and behavior

- [Public library entry](../../crates/azeroth-survivors-re/src/lib.rs).
- [Chest subsystem](../../crates/azeroth-survivors-re/src/treasure_chests/mod.rs).
- [Recovered zone/enemy constants](../../crates/azeroth-survivors-re/src/treasure_chests/catalog.rs).
- [Focused integration tests](../../crates/azeroth-survivors-re/tests/treasure_chests.rs).
- [Native instruction fixtures](../../crates/azeroth-survivors-re/tests/fixtures/treasure-chests-native.json).
- [Validation record](evidence/treasure-chests/source-validation.json).

Implemented from the owning native evidence:

- Two starting chests; first deadline 60; later attempts set the next deadline
  to current float run time plus 70 before checking population. Mixed pickup
  lists count only kind 2; timed creation stops at three. There is no catch-up
  loop or immediate refill after opening.
- A shared run clock advances only for native state 1. Pause/resume change
  1→3→1 without resetting the deadline. `advance` returns an `ActiveTick` token
  so an earlier purchase changing the live state does not incorrectly cancel
  the remainder of an already-active frame. The owning Game calls the timer
  only when its original control flow reaches that stage.
- The original four-word RNG transition and 23-bit float draws, using shared
  caller-provided state rather than an invented seed. Sampling uses separate
  angle/radius draws and separate cos/sin operations.
- Twelve regular placement candidates, original in-range blocked-cell test,
  strict height difference below 25, and the thirteenth fallback. The fallback
  deliberately skips regular restrictions. Final shared clamping uses
  `max(zone_radius - 2, 1)` and queries real terrain/fallback height.
- All nine zone centers/radii and all 108 enemy IDs/flag bytes are source data.
  The 27 flagged definitions produce an eligible death chest at dead XY+(2,-1),
  without a probability draw or timer reset.
- Shared creation removes one oldest chest at population five or more;
  float total ordering and first-on-tie behavior are retained. Ordered removal
  preserves the remaining Vec order and requests removal of auxiliary entities.
- Walking purchases within 3 planar units and explicit clicks within 10;
  click-only behavior and its once-per-run hint; strict four-second failure
  message throttle; shared price starting at 20 with separate float
  `cost*1.3+5` and saturating truncation to u32. Purchase counters use native
  wrapping increments; gold field scaling wraps as in the original instructions.
- Native entity creation parameters and purchase command payloads are sent to
  required engine ports. Cache-choice requests observe live state changes.
  Current chest IDs/world positions are exposed for the later `AZSCHESTS`
  adapter; no replacement serializer or delivery timer is invented.

No time-based chest expiration is introduced. The default-disabled `+0x947`
flag suppresses choice requests, as recovered. Its unidentified enable route
and extra 12-second pickup-batch owner are **not implemented**.

## Integration contract

The engine must provide `Terrain` and `ChestWorld`. Neither has a dummy default
implementation in production. Terrain supplies its actual height query,
fallback Z and optional navigation grid. The world port supplies entity IDs,
spawning/removal, gold field updates, localized messages, the original queued
interaction command and the cache-choice owner. The choice callback can update
the shared `RunClock` state; walking continues through its already-gathered
reverse-order candidates, matching the native batch.

`ChestField` borrows the actual shared pickup vector, zone, player position,
terrain, world ports and RNG. It does not create a private pickup pool or RNG.
Construct a fresh `RunClock`/`ChestSystem` for a fresh native-equivalent Game;
`start_run` activates state 0 and makes the two placement calls. For a running
frame, keep the `ActiveTick` returned by `clock.advance(delta)` and pass it to
walking/timer stages if the owning Game reaches them. External input uses
`click`, which independently checks the current active state. Eligible enemy
deaths call `enemy_death` once from their death handler.

These ports are compile-time interfaces, not operational engine adapters. The
source API does not claim the native 72-byte in-memory pickup ABI or a save-file
format. Unknown zone/enemy IDs return `None` rather than being assigned invented
definitions. Full Game scheduling, run RNG initialization and resource
construction remain owner-level reconstruction work.

## Validation actually performed

The original instructions were run in bounded, filesystem-free Unicorn scopes,
using unchanged hash-checked bytes. No native process, original/rebuilt game,
audio device, network or installed save was opened. Every external reach is
denied except explicitly documented recorder stubs for timer placement/creation
and eviction removal. These are instruction-oracle fixtures, not gameplay
runtime observation.

There are **30 native cases**: three clock, seven timer, six RNG streams (six
successive outputs/state transitions each), six eviction and eight price cases.
They include SIMD mixed-kind counts, late-tick rescheduling, equal timestamps,
signed zero, adjacent float ranges and large-price float rounding/saturation.
The fixture file reproduced with SHA-256
`2d6644c3764f6b6779d10cada5a6580434303f07b9ba90a17b4ca6f629f955d1`.

**18 focused Rust tests passed.** Five test functions consume all 30 native
cases; other tests cover startup/pause, opening after a skipped attempt,
blocked/height retries and fallback, small-arena projection, enemy-drop offset
and eviction, walking order, same-frame state transitions, purchase ranges,
hint/message throttling, long-lived chests and all 108 source definition flags.
The first run exposed a fixture mask covering only positive XY: the mask was
corrected to cover the entire sampled circle. There is no unresolved test failure.

The final **Apple Silicon library and application build passed**, using the
locked/offline `menu` profile. Outputs are under ignored
`runtime/cargo-target/menu`: `libazeroth_survivors_re.rlib` and the Mach-O arm64
`AzerothSurvivorsRE`. The application still contains its menu behavior. The
existing binary's 17 unused-code warnings and `block 0.1.6` future-compatibility
notice remain; no chest-library warning was reported. Windows was not built.

Original/rebuilt rendering, input and terrain accessibility remain unverified.
Host math implementations of `cosf`, `sinf` and `hypotf` have not been compared
bit-for-bit with Windows CRT. Exact float RNG/schedule/price operations covered
by the native fixtures match their original instruction results. This is not a
claim of full-game or visual parity.

## Reproduce

Building and running the tests need no reference EXE or MPQs:

```sh
./scripts/cargo test --profile menu --locked --offline -p azeroth-survivors-re --test treasure_chests
./scripts/cargo build --profile menu --locked --offline -p azeroth-survivors-re --lib --bin AzerothSurvivorsRE
```

Re-extraction requires the exact original EXE and the already-installed
project-local analysis tools; it is separate from a normal build:

```sh
python3 scripts/recover-treasure-chests.py --write-source-catalog
python3 scripts/recover-treasure-fixtures.py --contract chest-rules
```

The first command regenerates curated byte/data evidence and the Rust catalog
(format that source with project rustfmt). The second uses the existing
project-local Unicorn installation to reproduce the native fixture file. Raw
logs remain in `runtime/treasure-chest-implementation`; source, fixture data,
curated validation and owning documentation are intended repository files.

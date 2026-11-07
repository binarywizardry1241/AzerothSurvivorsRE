# Treasure pipeline integration

Historical 0.100.1 transaction evidence. The 129 definitions recorded here
plus current Legionlord yield 130 live amulets; selected-target definition
and generic scaling revalidation is owned by
[the 0.105.0 equipment report](equipment-catalog.md).

The [0.113.2 cache lifecycle repair](cache-lifecycle.md) supersedes this
report's host-drawn cache registration with the ordinary client GameObject
creation/state/removal route. Historical transaction evidence keeps its actual
target; runtime and visual parity remain open under #49/#18.

Reviewed 2026-10-19. Specification: project-local
`AzerothSurvivors/AzerothSurvivors-0.100.1.exe`, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
Historical 0.97.2 reports remain historical leads; their RVAs are not reused as
0.100.1 addresses.

## Native owners and source data

| Stage | Selected-target owner |
| --- | --- |
| Click interaction | `1454d2760..1454d28d7` |
| Cache placement | `1454d4b60..1454d4fe4` |
| Shared pickup creation | `1454da2c0..1454db3ff` |
| Purchase transaction | `1454e5660..1454e59ff` |
| Category draws, rarity and amulet expansion | `1454f3ed0..1454f53a0` |
| Jewelry increment | `145424420..145424a82` |
| Accepted reward | `1454f6270..1454f836e` |
| Shared completion | `1454edd70..1454ee327` |
| Effect aggregation / spell modifiers | `145451740`, `145451c30` |
| Equipped refresh | `1454c9c50..1454ca814` |
| Magnitude scaling iterator / scalar leaf | `14554e050..14554e219`, `1454848a0..145484c07` |
| Jewelry / amulet descriptions | `145424a90`, `145425910`, `1455526c0` |

The [current jewelry catalog](../../crates/azeroth-survivors-re/src/loot_rewards/catalog_01001.rs)
contains all 22 current native rows, including exact f32 words and ordered
rarity/empowerment arrays. The [current amulet asset](../../crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json)
contains 17 shared definitions and 112 ability-specific native constructor
outputs. Raw effect pointer words are forensic data only: runtime consumers
resolve retained owned key strings, never PE addresses.

[Amulet construction provenance](evidence/0.100.1/treasure-0.100.1-generation/amulet-construction.json)
binds the source asset to its native constructor/table ranges. The bounded
constructor was reproduced during consolidation. No original application
process or OS/network call runs in these extraction helpers.

## Live integration

`gameplay/mechanics/treasure.rs` owns the run's jewelry, worn amulet, remaining
soulstone lives and current reward payloads. Native cache expansion consumes
the same RNG as spawns/combat; all category draws finish before rarity and
amulet draws. Eligibility reads actual worn slots, exclusions, learned spells,
racial definition and remaining lives. Gold fallback uses the already-increased
current cache price, as in the native generator.

The chest adapter connects native walk and exact-GUID click interactions.
The application's click path now registers the actual cache M2 as a GameObject
and consumes the ordinary client's resolved `GameObjUse`, as described in the
[current request integration](local-requests.md). This replaces the
earlier adapter-only click claim. The full reward pool is now enabled in source
after all15 offered generic families gained live consumers and presentation;
the combined r14b transaction regression passed: an actual generated cache
purchase delivers generated Enlightenment, its accepted payload and a live
native bounce without consuming a stored level or allowing duplicate delivery.
Opening the first reward pauses the local native clock immediately. A gathered
batch can queue more purchases without replacing its first overlay. Accepted
jewelry increments or adds its actual native item; same-key amulets increment
the existing pick count while retaining rarity/payload, and another key replaces
the whole item. Gold uses native multiplier/rounding and updates both purse and
earned-gold counters. Invalid selections do not mutate those owners.

Accepted rewards call the shared live effect refresh and completion scheduler.
Cache selections decrement the cache counter; they never consume earned or
stored level counters. Fresh Mechanics instances own fresh reward state.
Account earned-equipment persistence is a separate progression owner, not this
temporary run jewelry inventory.

Complete gameplay effect fidelity depends on the live run-effect consumers in
`run_effects.rs` and `gameplay/mechanics/effects.rs`; retained generic effect
records alone do not establish that all callbacks are implemented. Central
validation and the run-effects report own that status.

The shared Game+`954` object serial is unified across creatures, summons
and pickups. The cache creator uses the actual `F110` GUID family, entry9005
and masked24-bit serial. Death caches complete creation synchronously; the
cache scheduler adopts them without another identity or yaw draw. Interleaved
factory, u32 wraparound and death-cache adoption regressions passed in r14b.

## Magnitudes and presentation

`loot_rewards::amulets::scaled_bytes` ports the current original leaf and its
iterator special cases. It scales designated magnitude fields only; durations,
proc limits, rescue cooldowns and selector payloads are preserved. Spell
cooldown reduction caps at `.5`, target magnitudes use `floor(x + .0001)`,
and amulet empowerment uses the selected rarity's native retention step.

`loot_rewards::prose` returns localization expressions, including nested
ability-name keys and English fallbacks, native percentage/decimal formatting,
healing/absorb square-root magnitudes and jewelry's reduction-cap marker.
Unrecognized effect variants return an explicit missing result instead of
invented descriptions. The UI owns rendering and replacement comparisons.

Current cards replacement tooltip is independently recovered with REA/Ghidra
from `1401f9880`; [tooltip owners and constants](evidence/0.100.1/treasure-interface/tooltip-owners.json)
bind its source range, analysis identity and current words. The entire
replacement footer owns the HoverTip. Its auto-width frame expands left/right
by10px, sits at bottom100% with6px bottom margin, uses12 horizontal/10 vertical
padding, border1, radius6, row gap4, and a black `.85` shadow at y3/blur12.
Globalz6050 places it above cards root6000; its border uses the worn amulet's
rarity text color with alpha `.8`. The footer itself shows localized `Replaces`
then the worn name, both12px, without an icon. The actual typed footer Node
stores are [retained separately](evidence/0.100.1/treasure-interface/replacement-footer-node-stores.json).

Wrapper `140113b60` emits `WORN NOW`11px muted, the worn amulet body, then
`Lost if you take this one`12px red. Body `1401f2c20` uses a30px item icon and
16px name, a12px `RANK {n}` caption when current picks is at least2, then15px
description lines with numeric green emphasis. The32px inventory icon's
300px-wide tooltip at `140110b70`, and the general cursor-following menu
tooltip at `1400c6820`/globalz5100, are distinct owners. Their evidence remains
retained with explicit roles rather than reused as replacement geometry.

The shared WoW text parser validates eight hex digits after `|c` but sends
only the final RGB six to its color parser: the alpha byte is ignored. `|r`
restores the body color. Unknown pipe sequences remain literal. The current
replacement amulet lines instead call numeric-emphasis owner `140113ee0`.

Current annotation producer `1454eeb90` gives an existing jewelry item rank
`upgrades+1`; a new jewelry item carries the count of worn items in the same
slot, displayed as `min(count+1,2)`. Same-key amulets show upcoming picks
`current+1`, while the comparison tooltip retains the currently worn picks.

The recovered ray constructor `14021e120` builds1024×1024 RGBA pixels with
white RGB and angular alpha. The period is f32 `0x3e860a92`; phase edges are
`.02`, `.07`, `.09`. Current `cards-layout` first spawn at
`14010ce92..14010d153` places the square at left `-30vw`, top `45vh`,
width/height `160vw`, margin-top `-80vw`: center `(50vw,45vh)`. Its tint copies
the choice reason color with alpha `.1`. `cards-animate` rotates it by elapsed
seconds × `.1` radians. These exact target Val words are retained with the
tooltip constants. GPU color-space selection and displayed runtime parity
remain unverified; display implementation belongs to the card UI owner.

## Validation and remaining evidence

Source fixtures regenerated from selected-target instructions:

- [660 jewelry increment and12 rarity vectors](../../crates/azeroth-survivors-re/tests/fixtures/jewelry-0.100.1-native.json).
- [204 effect scaling vectors](../../crates/azeroth-survivors-re/tests/fixtures/effect-scaling-0.100.1-native.json), including variant fields, cooldown cap and target rounding.
- [387 amulet and110 jewelry prose vectors](../../crates/azeroth-survivors-re/tests/fixtures/amulet-prose-0.100.1-native.json).

The prose emulator admits only reviewed native owners plus explicit locale,
allocation, formatting, ASCII-uppercase-first, CRT powf and floorf boundaries.
Unknown calls fail closed. Its native outputs are finite instruction evidence,
not original/rebuilt application parity. Native padding and host math-library
bit identity are not claimed.

Central Rust validation passed the full14-case `loot_rewards` integration suite
(`runtime/consolidation-2026-10-19/treasure-regressions-r3.log`). Those cases
compare every387 amulet description,110 jewelry descriptions,204 scaling
vectors,660 jewelry increment vectors and12 rarity vectors. A failed first
prose pass exposed a hardcoded bounce count; the producer now reads the native
count and chooses its singular/plural template, leaving the fixture intact.

The central library22, binary108 and mechanics27 cases also passed at the
preceding checkpoint. Mechanics cases exercise actual reward acceptance,
stored-level isolation, live stat refresh, amulet empowerment/replacement,
failed selection, exactly-once gold delivery and fresh-session ownership.
Tooltip parser and host-placement cases are included. Later central validation
and the run-effects report own changes outside this reward scope.

No treasure purchase/replacement/empowerment has yet been compared in controlled
original and rebuilt application windows during this consolidation. Long-run
all-class behavior, native visual parity and Windows behavior remain unverified.
No push, PR, merge, Actions run or build-artifact publication is authorized for
this consolidation.

## Native cache feedback and coinage

Current purchase owner`1454e5660` and click arm`1454d2831` publish the remaining
run gold multiplied by10,000 with wrappingu32 arithmetic into player field1176,
then sound1204 through opcode`2d2`. Both the transaction port and regular player
feed now use that conversion; the prior raw-unit feed understated the client
coinage. The once-only event collector delivers the sound through the ordinary
client audio path.

An unaffordable click sends `SMSG_NOTIFICATION` opcode`1cb` with localized
`This cache needs {n} gold.` and independently appends the custom gold banner.
The walk hint uses only the custom banner, `Right-click a cache to buy it.`.
Both custom messages enter the same native kind0 notification queue described
in [the banner report](notifications.md); they are no longer discarded
in an inert command vector or converted to provisional English announcements.

[Retained current instructions and native vectors](evidence/0.100.1/cache-feedback/native.json)
bind purchase/click/walk/toast/notification packet owners to the selected hash.
The recovery script is [recover-cache-feedback.py](../../scripts/recover-cache-feedback.py).
Nine unchanged-instruction coinage vectors include wrapping boundaries; the
empty-message packet replay preserves itsNUL terminator without external calls.
Two actual Ghidra owners retain custom-toast production and notification
serialization. The application regression covers insufficient funds, purchase
31→11gold, field1176=110000 and exactly one sound1204; its central result is
recorded in the source/verification registers after the final pass. Audio playback and visible
original/rebuilt comparison remain unverified.

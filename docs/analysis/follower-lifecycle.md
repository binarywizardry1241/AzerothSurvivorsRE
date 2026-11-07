# Current follower producers and expiry

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the selected follower source/recovery portion of gap #25.
[verification-needed](../verification-needed.md) owns current implementation and parity status.

## Current producers

The [native vectors](evidence/0.105.0/follower-lifecycle/native-vectors.json)
traverse all **355 current talent definitions / 429 effect payloads** and
replay the existing native constructor for all **130 amulets / 375 effects**.
Neither producer catalog contains raw effect2. The historical Demonic Pact
payload in `assets/talents.json` is removed by the current Demonology overlay;
it must not be reinstated to manufacture a temporary Imp producer. The native
raw2 handler and the older isolated helper remain a dormant recovery boundary.
This negative result covers the current catalogs, rather than every dynamically
constructed effect that could exist elsewhere in the executable.

| Active producer | Live source connection |
| --- | --- |
| Raw29, ten payloads including repeated grants | Five ordinary talents reach `run_effects/pets.rs::followers`, `configure_effects` and `begin_pets`; current Imp/Felhunter/Voidwalker grants reach Demonology `Config`, `State::initialize`, shared creation and the special attack adapter. |
| Raw32 Legion Gate | `State::tick_lifecycle` admits and creates each lesser demon before the next choice, retaining the cap/angle RNG and 20-second lifetime. |
| Raw33 Infernal/Doomguard and raw34 Pit Lord/Felguard | Ordered proc markers in the actual successful-cast callback reach `after_damaging_cast_for` and synchronous creation/landing. Temporary origins, live actor AI, spell/missile attribution and removal use the existing demon adapter. Supremacy's permanent greater grants retain their separate initial route. |
| Showcase Begin `1459187ae..145918878` | Now adds the selected class's special companions after ordinary/granted setup, through the same live creation and combat adapter. |

The [existing constructor evidence](evidence/0.105.0/pet-creation/manifest.json)
and [Demonology integration](demon-gameplay.md) own creature fields,
terrain/movement, special attacks, meters and captured missile state. A recovered
producer alone does not certify those consumers' runtime fidelity.

## Showcase and expiry correction

Native selector `1458e62c0` walks all three class trees, gathers descriptors from
raw2/29/33/34 and Legion Gate's Imp/Succubus pair, and deduplicates descriptor
identity in first-encounter order. The caller keeps `special != 0`. Thirteen
unchanged instruction cases cover supported and unsupported class IDs. Only
Warlock produces additional showcase followers, in this order:
Imp, Felhunter, Voidwalker, Succubus, Infernal, Doomguard, Pit Lord, Felguard.
Other classes' ordinary pets are filtered out. Existing granted companions do
not suppress these additional showcase summons.

Each request carries native lifetime **40 seconds**, power **1**, a random-angle
wrapper and origin index **u64::MAX**. `begin_demons` appends them once after its
normal initialization and drains initial requests immediately through the same
`PassiveCombat::spawn_demons` owner. Actual creation therefore precedes clock
advance and the later showcase mob/cache allocations; it is not deferred with a
substituted timestamp. Shared creation publishes real units, Infernal landing
and summon visuals; ordinary special AI and its captured source/meter consumers
then run. The existing expiry stage removes them and preserves already queued
missile attribution.

Fresh selector `1459a1a40` identifies only temporary rows whose deadline has
arrived, preserving input order; equality expires and unordered comparisons do
not. Five instruction cases include permanent/future/equal/past rows, NaNs,
infinities and vector growth. Gate admission and Infernal pulses precede expiry;
expiry precedes the ordinary/special AI stage, as in the existing live adapter.

The source previously advanced capstone cooldowns by the expired pet's entry,
without retaining its origin. That would give showcase Pit Lord/Felguard an
effect on real talent deadlines. Creation now retains the origin index. Departure
requires an in-bounds current raw34 effect and deadline slot before updating the
corresponding cooldown with that effect's departure delay. Seven native branch
cases cover invalid indices, wrong effect tags, missing slots and the showcase
sentinel. Existing native arithmetic still preserves an unordered old deadline.

## Reproduction and limits

`python3 -B scripts/check-follower-lifecycle.py --check` passed: newest
target identity, full bounded catalog producer inventory, **25 native selector,
expiry and origin-gate cases**, and three retained native ranges/text digests.
The [manifest](evidence/0.105.0/follower-lifecycle/manifest.json) references the
existing canonical caller, constructor, departure arithmetic and pet loop.
The full balance-catalog and equipment-catalog checks also passed, including
source table agreement and the equipment owner's 1,484 native scaling cases.

Four changed follower Rust modules passed syntax parsing with the project
rustfmt and whitespace checks. Three regression functions cover native selector
fixtures, once-only showcase creation/origin retention and valid/missing
capstone deadline ownership; they are authored but **not compiled or run**.

Ghidra used bounded code slices and a generic ABI. Its class-selector view cannot
resolve jump tables omitted from that raw input; original PE instruction probes
include those data and execute the actual branches. Allocator/Vec storage is an
explicit seam. No build, `cargo check`, compiling test, game process, real-MPQ
interaction, animation/rendered comparison or original/rebuilt parity check ran.
No whole follower or parent-gap parity is established by this source completion.

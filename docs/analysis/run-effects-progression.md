# Run effects and progression integration

Updated 2026-10-19. The selected EXE is
`AzerothSurvivors/AzerothSurvivors-0.100.1.exe`, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
This report distinguishes current binary recovery, live source integration and
validation. It does **not** establish full native gameplay or visual parity.

## Current evidence

The [function manifest](evidence/0.100.1/run-effects/manifest.json) binds complete
current function bodies and REA/Ghidra evidence IDs for run factory14544f710,
account run grants14547ede0, Veteran factor14547f960, result14544a260 and
account consumer14543f4f0 and shared status1454ff860. Their complete original assembly and raw pseudocode
are retained beside the manifest. The raw imports omit external constants,
callees and jump tables; original PE assembly/data control those interpretations.

The current stat owner1454a6a40, constructor1454ad570,
[switch destinations](evidence/0.100.1/run-effects/tables-and-payloads.json),
and [entry inputs](evidence/0.100.1/run-effects/entry-inputs.json) bind the scalar
composition. [Run callback recovery](evidence/0.100.1/run-callbacks/manifest.json)
contains the incoming damage, actor hit, class-special and periodic owners.
[Generic callback recovery](treasure-effect-callbacks.md) owns the current
condition/selector layouts, finite native condition vectors, freecast instance
construction and Chastise changes. [Healing fixtures](evidence/0.100.1/run-effects/healing-native.json)
retain current general heal/provenance/meter owners with REA evidence,1008
original-instruction healing/overheal cases,320 pool-pulse gate cases and480
frame-batch cases. [Actor appearance](evidence/0.100.1/run-effects/actor-appearance.json)
retains the current shared constructor, ordinary/guardian original model and
scale storage, NULL ordinary metadata for primary bosses, restoration and ceil
health-field publication. Exact
current Lightwell source3 and companion source2 sites are retained separately;
the companion loop is not used as Lightwell evidence.

[Frame/publication windows](evidence/0.100.1/run-effects/frame-publication.json)
retain14 current instruction spans for normal scheduler placement, pending
hostile impacts and synchronous player-aura publications. The separate early
`Game9b2` flag refills health, clears pending levels and uses `Game994`; its
producer is now proven as `WOW_ROGUE_SHOWCASE` exact`1` in the current
[account delivery guards](account-progression.md). Showcase gameplay
itself remains incomplete. It is not treated as a queued spawn request.
[Level progression](evidence/0.100.1/run-effects/level-progression-native.json)
retains two REA/Ghidra owners,48 unchanged native inline-heal cases and30
periodic-message gate cases. It binds the actual system-chat serializer,
localized templates, format precisions and level/XP descriptor fields.
[Timed live-cast recovery](evidence/0.100.1/run-effects/timed-live-native.json)
retains the current initial iterator/constructor Ghidra owners and refresh/tick
instructions,128 split-cooldown interval cases,25 due/NaN gates and12 successful
cast-event tails. It supplements the prior324 equal-global interval vectors.

`recover-run-effects.py` resolves strings/list selectors from each existing
talent payload into the shared `assets/talents.json`; no second talent catalog is
maintained. It also retains current class leech bits. Scaling delegates to the
single amulet/talent raw scaling implementation, whose separate native fixtures
are owned by treasure recovery.

`recover-run-entry.py` reads all12 zone entries,9 class HP/armor/leech rows,
8 race effect vectors/racial ability keys/factions and the current scalar/default
constants. `assets/run-entry-0.100.1.json` replaces the application's historical
run-entry input. The camera proof establishes default zoom15/yaw0/pitch-.5 only;
controller input, collision, model pivot and rendering parity remain separate.

## Connected behavior

| Area | Implemented live source behavior |
| --- | --- |
| Loadout | Selected normalized talent ranks and worn gear rows reach one equipped effect owner. Startup talent27/28 add/replace abilities. Current raw stat30 rows aggregate in native order; spell31 selectors/modifier lanes reach learned/racial instances without resetting upgrades or timers. |
| Numeric stats | Race/base, gear, jewelry and generic stat tags have distinct recovered mappings. HP, damage, recovery, crit overflow, armor cap/conversion, regeneration, movement cap, pickup, XP, gold, luck, area, targets, cast echoes, heal-on-kill, buff potency and DoT tick inputs reach their consumers. Conditional damage stats18..21/28 reach ordinary/boss victim multipliers. |
| Active auras | Live damage/recovery auras scale by buff potency. Native spell23505 contributes its extra.5 damage; spell23451 contributes.6 movement before the2.2 cap. Level regeneration is added once by refresh, then consumed once per tick. |
| Class-special ports | Current retained talent13/22 rows, reflection stat22 and verified matching bounce6 rows reach existing class-special/totem ports. Native cast echoes use current extra-attempt24 and extra-cast factors, draw their count before dispatch and preserve overcast classification. |
| Incoming damage | Source GUID/physical classification reaches canonical armor/absorb handling, aura removal, retaliation, racial rescue, first talent19 shared deadline, Soulstone consumption and final0-HP death. Rescue/retaliatory hits share actual actors, loot/death owners and run RNG. |
| Generic callbacks | Execution-aware primary, due-impact, ground and actor-periodic hit routes pass actual queues/vitals/object serial into synchronous effect0 freecasts,3 shield bursts,4 splashes,6 bounces,7 repeats,8 status procs,9 accumulated source-owned DoTs,10 kill cooldown resets,11 periodic death explosions,12 shield-gated death explosions,14 DoT transfer,15 temporary stats,17 healing and18 capped absorb. Source3 suppresses the generic tail. Per-effect rows are cloned before traversal; freecast attribution/depth are restored. Other effect families remain below. |
| Milestone/conversion callbacks | Current generic1 counts qualifying hit/death/cast events, preserves capped pending triggers after rate rejection and shares the synchronous freecast tail with0. Generic5 applies raw fraction×live victim maximum HP with original spell/school and source3. New counter/deadline/timestamp refresh preserves base talent slots and recreates equipped suffix slots. Native760-case recovery and the four library/four application regressions passed in the final544-test r20 run. See the [owning report](milestone-effects.md). |
| Event producers | Current successful ordinary/racial casts publish kind3. Absorption credit publishes kind6 before HP subtraction; incoming damage publishes kind4/5 after retaliation and before lethal gates; talent rescue publishes kind7. Original actor-hit request power reaches the event amount unchanged; victim damage modifiers do not replace it. |
| Temporary effects | Active variant15 rows append their source-indexed stat contributions after ordinary composed stats. Dispatcher return recomputes actual HP/scalars before the next victim or cast, while preserving upgrades, cooldowns and the current native row snapshot. Expiry removes contributions before subsequent frame consumers. |
| Chastise | Current Smite target modifier and zero-cooldown effect0 use a unique first-critical token per spell cast. Failed casts initialize tokens; only source0 critical hits consume the critical token, with swap-remove. The chance1 proc still draws the shared RNG. Its free Holy Nova completes synchronously before the next victim. A new Smite cast can proc again immediately. |
| Timed talent grants | Variant26 base-talent slots start at1.5 seconds and retain their timers through reward/stat refresh; newly appended suffix slots start at1.0. After ordinary/racial casts and temporary-stat expiry, each timed slot subtracts delta once and synchronously dispatches a due free instance. Learned instances retain upgrades; unlearned instances use current selectors and mean learned power. Failed attempts retry at.3. Successful scheduling captures fallback cooldown before dispatch, but a positive override reads the post-dispatch global multiplier; its kind3 callback follows the timer write. This stage adds no echo/count RNG, cooldown packet or learned slot. Library/application regressions passed in r17 below. |
| Healing | Canonical spell heals use current NaN-preserving HP clamp, first20 overheal-to-absorb cap,21 pool credit, actual-heal packet threshold1 and event-time ceil health fields. The frame batch combines regeneration and HoTs before one clamp, gives regeneration first claim, distributes remaining effective healing proportionally in aura order and applies HoT overheal20/pool21 without inventing a heal packet. Actual f32 credits widen to the retained f64 healing meter with current name/icon/provenance. Pool21 publishes at most once per frame after its one-second deadline, clears before its radius query and applies source3 Nature damage740 at raw multiplier×captured pool. Anonymous/manual secondary healing has explicit log admission. |
| Combat presentation metadata | Direct damage retains causal source, native packet attacker, spell/school, raw request versus modified damage, critical/source-kind and log admission. Actor-periodic logs precede mutation and suppress the ordinary log. Actor aura slots retain event-time application counts/fields; player aura projection receives actual source-row provenance, temporary stacks, rescue deadline, active auras and current effect11 cooldowns. Packet/client presentation is owned by the presentation bridge report. |
| Actor presentation state | Polymorph writes canonical model/scale state. Restoration reads retained ordinary/guardian metadata and original scale. Successful control extensions sample height, consume the shared movement serial and publish Stop before aura; rejected shorter reapplications publish neither. Actual physical swings publish their attack intent before canonical immunity can refuse health mutation. |
| Actor-update order | Player casts, class-special ticks, pending impacts, ground effects and totems precede the actor AI/periodic stage, matching the current1454b70d2 call. Due hostile impacts follow self-casts. XP flight arrivals and normal ordinary/wave/boss/guardian schedule creation follow actor-update, so a newly scheduled actor does not act in its creation frame. The r17 application regressions and r18 corrected stampede integration passed. |
| Kill transfers | Variant12 requires a live matching player aura, applies the per-effect one-second cap and publishes its ground visual before source3 radius hits. Variant14 excludes already-active matching owners before limiting targets and restores initial tick count/power/duration, as the current native+24 read requires. Variant23 disables Chain Lightning attenuation by presence in composed rows. |
| XP thresholds/pickups | Current threshold owner calls imported`roundf`, rather than`ceilf`: level2 requires9 XP. Ordinary XP and gold collection also call`roundf`; ordinary XP retains its native minimum1. Shared completion's combined XP sweep is a separate owner. |
| Earned levels | Each earned level publishes level field34, refreshes stats, emits current localized system-chat text, then heals20% of its new maximum HP with the actual Level Up meter name/icon. A multi-level XP award repeats that sequence for each level. The periodic-stack message requires a learned kind6 spell and an increased stack cap. Final remainingXP/next-threshold fields716/717 follow the loop. No SMSG_LEVELUP_INFO or spell-heal packet is manufactured. The r17 application regressions passed. |
| Account grants | Current saved rerolls add to native base3; banish rank is the count; nonzero skip/opening enable their controls. Keen adds rank×.05 to each boss piece chance. It does not add choice luck. |
| Veteran/result XP | Veteran bonus is rank×.20 only while selected class XP is below the maximum among the9 native classes. Current result arithmetic normalizes/truncates kills by density, applies zone scaling, caps the run-option factor at2 and rounds the Veteran component separately before integer addition. |
| Save seam | Equipment queue drains independently of terminal statistics. Seen ability quality merges through the save owner. A result is exposed until marked saved, so a failed flush can retry. Account class XP, lifetime counters, beaten/open-zone data and character result fields are owned by the shared save adapter. |

The movement admission predicate is independently recovered in
[movement-admission.json](evidence/0.100.1/run-effects/movement-admission.json):
phase0 starts only when consecutive accepted XY reports differ by squared
distance strictly greater than exactf32 bits`3d23d70a` (approximately.04).
Z/facing alone does not start it. Parent application integration owns report
sampling and the ready UI; this evidence does not substitute per-frame movement.

## Integration APIs

Run entry supplies `Mechanics::configure_effects(allocation, gear)` with validated
selected ranks and slot-ordered resolved gear numeric rows, plus the race movement
multiplier through `set_base_movement_multiplier`.

`run_progression::account_grants(class, perk_rank, class_xp)` uses save-backed
closures and returns `AccountGrants`; `Mechanics::set_account_grants` populates
choice controls/opening, Keen and Veteran. No menu dependency is introduced into
the independent mechanics/library harness.

The application owns `drain_equipment`, `seen_abilities`, `run_result` and
`mark_run_result_saved`, along with persistence before native leave/retry teardown.
The roster GUID is the selected account character identity, distinct from the
local client unit GUID1. Native factory/result code guards selected GUID`ffffff`
for account mutations; the target/menu report owns draft-character creation.

`preview_spell(definition, rarity)` applies current composed spell modifiers
before learned rarity, as the native preview does. `description_inputs()` returns
area, buff potency, DoT tick bonus and global targets from their actual scalar
lanes; formatter+72 is the DoT tick bonus.

`actor_appearance(guid)` exposes canonical current model/scale, independently of
packet consumption. `player_vital_fields()` exposes the same native ceil health
values to packet and Lua feeds. `healing_meter()` retains actual widened f64
credits with current source names/icons; it does not itself render a meter UI.

The actual129-amulet catalog offers passive tags
`3,4,6,7,8,9,10,11,12,13,15,18,19,22,23`, plus stat30 and spell31.
All15 passive families have live consumers in the paths above;0/14/17 are
additional talent consumers. The actual client GameObject click path is wired;
the r14b purchase→generated amulet→accept→live bounce regression passed,
and the complete recovered cache pool is enabled.

## Explicit remaining gaps

Native Game+954 now supplies one wrapping u32 serial to creatures, XP/gold
pickups, cache GameObjects and summons through shared handles. Death caches
complete the actual kind2 creator synchronously and are adopted without a
second serial or yaw draw. Current regressions cover interleaved factories,
wraparound and death-cache adoption. This closes the separate-counter gap;
complete native frame ordering remains a distinct limit below.

Remaining generic dispatcher families include temporary companions2 and
other unbound raw variants and special/temporary followers29. Ordinary follower
creation and attacks are now covered by the newer report below. Current
milestone1 and conversion5
now have live consumers with independent native vectors; central application
validation is pending in r19. Family2's pure producer reproduces chance/cap/
expiry/angle/RNG but is not substituted into ordinary enemy actors.
Canonical20/21 healing, its pool pulse and the separate inline regeneration/HoT
batch owner are connected. Permanent-form behaviors still require closure.
The [0.105.0 weapon/pet report](power-scaling.md) supersedes this
report's missing stat16/17 consumers for weapon swings and ordinary combat pets;
special Demonology and temporary companion consumers remain open. Current
class-special/totem recursive wrappers deliberately force source3,
which suppresses generic dispatch. Exact Lightwell primary/bounce sites confirm
this behavior; ordinary follower source2 ownership is connected by the newer
report, with source compilation and live comparison still pending.

Incoming shield depletion publishes its completed-absorption credit and shield
burst before the HP subtraction. Some ordinary leech/secondary healing still accumulates through the
existing vital flush rather than the complete native per-hit heal event owner.
Generic spell-ID0 bounce/repeat and ordinary hostile swing packets now have
explicit native attack intents, independent of canonical health mutation.
Control/reduction/DoT expiry metadata and the shared stun movement-stop serial
are connected. Current self-buff/shared-status callbacks now publish player
aura descriptors synchronously from actual execution state. Shield depletion
and talent rescue publish their descriptor at the recovered incoming-damage
edges, so application and removal within one frame both survive. Their bounded
regressions passed in r17; complete recursive aura publication is
not asserted for unbound effect families.
Polymorph appearance now uses persistent canonical state and current
ordinary/guardian original metadata for restoration. Primary bosses retain
their native absent ordinary metadata gate. Companion behaviors, PvP gear
effects and complete native menus need their owning target recovery; historical
catalogs are not promoted by this work. Current achievement/reward recovery and
pending application validation are owned by the separate
[account progression report](account-progression.md).

Complete frame parity remains unverified after the bounded normal stage
corrections. The separate `Game9b2` early mode is now bound to the current factory
`WOW_ROGUE_SHOWCASE` exact`1` producer; its gameplay implementation remains
incomplete and is not enabled by this ordering change. Its achievement and
terminal-result exclusion follows the current snapshot guards. Timed talent casts and their
temporary-expiry predecessor now have their recovered stage. Companions and
unbound companion consumers remain distinct ordering gaps. Shared RNG and
same-frame target availability need controlled original/rebuilt comparisons.

## Validation status

Central r17 passed **50 library and166 application tests**, including all new
frame/aura, earned-level and timed26 cases. The mechanics integration target
passed53/54; its stampede fixture still expected population refill one frame
late. The corrected fixture now requires exactly one same-frame replacement,
an untouched initial attack delay, no death rewards and no second replacement
next frame. Its r18 focused rerun passed **54/54**, with the current boss catalog
and scaling focused cases each passing1/1. The separate current/historical
fixture boundaries were corrected by the target worker/root. Log:
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/final-regressions-r17.log`.

The subsequent [milestone/conversion and indexed refresh pass](milestone-effects.md)
retains760 unchanged native instruction cases and adds four library/four
application regressions. The r19 and final r20 passes both passed544tests
across29suites (54library,172application,58mechanics and the remaining
integration targets). The final build also passed.

Central r16 compiled the current source and passed **50 library and164
application tests**. Two new assertions failed on fixture assumptions: the
mechanics helper starts at100 maximum HP, and current Bladestorm has both a
learned grant27 and timed grant26. The corrected tests now require level HP
109/118 and verify that timed casting neither duplicates the granted Whirlwind
slot nor resets its independent learned timer. Those fixture corrections passed
in r17. Integration targets had not yet run after the failed
application target. Log:`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/final-regressions-r16.log`.

The frame/aura/earned-level application regressions passed in r17. They cover
self-shield before a due hostile impact,
shield application/depletion descriptors within one frame, rescue descriptor
before its visual, deferred first actor update for normal spawns, two levels
from one XP batch with per-level meter/message order, learned-periodic message
gating and all48 native inline level-heal cases. Recovery scripts completed;
`git diff --check` is clean. No runtime comparison was performed for this pass.

The subsequent timed26 library/application regressions also passed in r17.
New library tests consume128 split-global interval vectors and25 due/NaN
vectors and verify the shared free-instance factory. Three application tests
exercise startup/preserved timers, failed-target retry followed by actual damage,
no ordinary echo RNG or catch-up attempts, and timed Rejuvenation triggering the
unchanged legendary cast callback without adding a learned slot or UI cooldown.
The recovery script completed and all touched Rust source parses with the
project formatter. No independent Cargo process or game launch was started.

The subsequent r14b pass succeeded: **45 library,147 application,6 boss ability
and6 boss AI tests passed**, including the shared serial and full generated
cache transaction. One separate Saves fixture assumed a case-sensitive volume;
its corrected filesystem test and engine request/picking tests run separately.
Log:`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/shared-serial-integration-r14b.log`.

Before the final execution-aware generic callback seam, the targeted Cargo run
passed23 library and28 mechanics tests, including selected loadout composition,
shared rescue deadlines, native account grants/Veteran and corrected threshold
rounding. Log:`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/effects-native-grants-tests.log`.
The central r6 pass compiled the execution-aware bridge and passed26 library
and115 binary cases; its sole failed Chastise assertion discarded the tick that
contained the synchronous Nova. The corrected focused Chastise test and ordinary
XP/gold rounding test pass. Subsequent focused tests pass all800 selected-native
hit-token vectors, variant12 aura/rate-limited explosions and variant14 owner
exclusion plus original tick restoration. Logs are under
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/{chastise-focused,pickup-focused,hit-tokens-800,kill-explosion-focused,kill-spread-focused}.log`.
The later shared refresh/callback pass succeeded in19 focused live tests,
including bounce raw-power ownership, stun, exhausted stored-DoT explosion
eligibility and same-frame temporary-stat leech/expiry. Log:
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/callback-live-r3.log`. The subsequent combined
current library/binary r11 pass succeeded43 library and133 binary tests in
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/effects-presentation-integration-r11.log`.
The r12 initial new batch regression exposed an SSE NaN operand-order and
unordered-credit admission difference; the retained native cases drove its
correction. R12c then passed44 library and138 binary tests. The latest combined
pass passed44 library and142 binary tests, including480 new batch vectors,
actual physical attack metadata, canonical appearance restoration, healing
meter proportions and stun Stop/serial/aura ordering. Log:
`runtime/analysis/history/native-recovery/consolidation/11a8f25258b7/effects-presentation-integration-r13b.log`.
R13 initially hit an incomplete concurrent presentation edit; the coherent
snapshot was rerun as r13b. Native condition
tests contain1539 finite original-instruction cases; bounded instruction
validation does not establish an original game session.
Current entry/scalar and shared talent recovery scripts completed successfully.

No original/rebuilt interactive comparison was performed by this worker. The
parent task owns controlled application QA and the consolidated current-state
snapshot. All work is local; this worker created no commits, push or PR.

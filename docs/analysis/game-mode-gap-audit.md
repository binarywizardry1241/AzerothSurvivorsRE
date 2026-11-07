# Azeroth Survivors game-mode gap audit

Reviewed 2026-10-20 against the supplied EXE, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the integrated snapshot. This report
identifies work hidden by its former broad categories; it does not implement it.

## Coverage and meaning of “fully done”

The [release crosswalk](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/changelog-coverage-0.105.0.md) covers **all 159 supplied
changelog sections**, including their paragraphs/bullets. Each is mapped to
source/report ownership, missing integration, superseded behavior or an explicit
evidence limit. Older rules superseded by later releases are not new backlog.
Unspecified “bug fix” entries cannot supply an invented requirement.

The source already tackles substantial parts of enemy/boss/guardian spawning,
player abilities, effect callbacks, treasure/upgrade rules, earned-level/account
progression, save/menu operations and real-world/client integration. Those
implementations and their tests are described in the existing owning reports.
**No whole game-mode system or complete release is certified fully matched to
the selected 0.105.0 EXE.** Bounded native instruction matches, exact data and
successful historical builds establish narrower facts. They do not establish
all consumers, defaults, input routes, presentation, persistence and long-run
original/rebuilt behavior.

The audit includes only Azeroth Survivors mechanics and its custom UI/client
extensions. Generic client rendering, stock FrameXML features, installers,
website origin checks, browser/Android memory/shader fixes, Linux audio and
Discord service integration were reviewed where the changelog mentions them,
but are not counted as missing native game-mode systems. The Scarlet Monastery
camera adjustment remains a separate existing target-specific world check.

## Fresh selected-target evidence

[Selected data](evidence/0.105.0/game-mode-audit/selected-data.json) and the
[native manifest](evidence/0.105.0/game-mode-audit/native-manifest.json) bind
observations to original file ranges and hashes. The exact
[embedded addon source](evidence/0.105.0/game-mode-audit/addon-api.lua) is 10,365
bytes at file offset `0x6e74644`, VA `0x146e75444`, SHA-256
`b79b53002002820291022749e09cc34aa660ccf372fd4479dae4b424c160f212`.

| Observation | Current EXE evidence | What it establishes / does not establish |
| --- | --- | --- |
| Current talent records | 17 selected records: all 14 Demonology entries, Shadow Dance, Shadow Weaving and Scorched Earth | Current pointer-bounded names, prose and effect payloads. Demonology records have 120-byte stride and column indices 0–3; fields through byte 87 are decoded. Remaining fields and complete enum consumers are not recovered here. |
| Separate demon combat | Diagnostic `game/demons.rs` locations and Ghidra owners `14594cdc0`, `14594e0f0`, `14594ed10`, `145950e90` | Native target selection, attack timing, projectile creation and critical calculations exist separately from ordinary pets. Four current decompilations are discovery evidence; the complete army lifecycle/AI is not reconstructed. |
| Full addon contract | Exact Lua getters, parsers and registrations for 16 addon-message branches, including `AZS` | Code for schedules, live units/debuffs, spells/buffs, three meters, chests/lairs, damage taken and terminal results is embedded. This does not prove the reconstruction publishes those messages or executes the whole bootstrap. |
| Guardian flag serialization | Owner `1459b1b70`; `ev_56bd198df1248b7260f6e1ed8d8e4519e394abfc4a90b9ee67728db0551f330b` | The native serializer compares each lair index with the selected flag index and formats a boolean; Lua accepts the `flag` field and returns its matching lair. Complete lair-selection/repopulation semantics remain separate recovery. |
| Native meter and controls | Meter labels Damage Done / Healing Done / Boss Damage; `screens/meter.rs` locations and owner `140172ae0`; custom HUD/pad/touch/talentview type identities | These are separate custom screen owners, not stock client panels. Ghidra also observed the native meter update function. Labels/type names alone do not recover all screen rules. |
| Native controller input | `screens/xinput.rs`, XInput DLL/GetState literals, polling owner `140092ab0`; `ev_57fe1f9685d63ac3ae5a31bddad77d44b49b92d0657a4f324875cc8d1f30c746` | Native polling iterates four controller slots and handles connection/state changes. Complete AS button mapping/focus/touch behavior remains unrecovered. |
| Per-kind totem cap | [Instructions](evidence/0.105.0/game-mode-audit/totem-kind-cap-branch.asm), `145921b3e..145921cb5`, parent `14591f620` | Counts equal ability keys; up to 39 existing entries skips removal. At 40 or more it removes the first matching entry and calls two cleanup paths before creating the new totem. Display IDs 4587/4589 and the `magma_totem` comparison identify this branch. Complete forced-expiry/Call of Flame semantics still need recovery. |
| Beaten-zone restoration | [Instructions](evidence/0.105.0/game-mode-audit/beaten-zone-unlock-repair.asm), parent `145886e60`; `ev_562816d41bbcf4c7865b78870afeeb61b0bfe750db85ff64389f802a2f43625e` | Save loading parses `beat` records, deduplicates class/zone entries and merges the next-zone value (`index + 2`, capped at 12) into each class's maximum unlock. Complete save migration/refund behavior and malformed inputs remain unverified. |

The source-path scan covered the entire PE for the two custom game crates and
found 51 distinct diagnostic file paths. These are nonexhaustive ownership
leads, not a complete source/function inventory or a reconstruction denominator.
The selected current paths include `game/demons.rs`, `game/companions.rs`,
`bindings.rs`, `game/addon.rs`, `screens/hud.rs`, `hudparts.rs`, `meter.rs`,
`talentview.rs`, `pad.rs`, `touch.rs` and `xinput.rs`.

## Explicit missing or partial systems

### Custom run HUD, meter and terminal flow

The [selected-target HUD repair](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/run-hud-0.105.0.md) now connects a separate
live clock/countdown, ordered boss/awake-guardian bars, kill/gold/cache tally,
build icon rows, scale/visibility, movable tally/build persistence and custom
pause panel. Its hash-bound constructor/control evidence supersedes the earlier
missing-source finding for those portions. Pressed-touch pointer fallback and
the scale Update lifetime are also recovered and connected. Compilation,
interaction and rendered parity remain unverified. Terminal presentation remains a separate scope below. Current
integrated status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The separately recovered [current meter implementation](run-meters.md)
now connects effective damage/healing/boss aggregation, source/proc rows, fight
timing, three overlay views, rates/shares, persistence and captured attack
breakdowns. Display Reset preserves cumulative game/terminal damage. Special
demon and Soul Link gameplay producers remain #24; their complete live meter
delivery, compilation and rendered/input comparison remain open under #8.

The [selected-target terminal repair](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/terminal-flow-0.105.0.md) now connects
frozen defeat/left/victory summaries, identity, ordered loot/new flags, animated
talent XP, statistics and Again/Main Menu/Endless actions. Capturing before
account delivery preserves presentation after saves; incremental checkpoints
retain victory credit through endless continuation. The common canvas fit and
summary constructor parameters are revalidated. End Run uses the custom pause
confirmation owner. [Shared player mover sequencing](player-mover.md)
now connects speed/teleport/root/unroot, including delivery during a terminal
pause. [Return recovery](terminal-return.md) also connects native Menu-only
logout and establishes the custom frontend's Main Menu label. The
[ordinary stock frontend](stock-frontend.md) now connects real
GlueXML, native realms, saved-roster operations, shared engine identity and
addressed run entry/Again/Character Select. Current picker and terminal-action
queries bound their hover consumers; a separate generic visual painter is not
proven. Compilation and original/rebuilt interaction/rendering are unverified. The
[parent gap remains #9](../verification-needed.md).

### In-run talent viewer and Run Stats extension

The subsequent [in-run viewer implementation](talent-view.md) connects
the custom read-only three-tree screen through the real talent binding/micro
button, entry allocation, pause owner, inspection and Close/toggle lifecycle.
It shares read-only rendering with the between-run
[talents page](../../crates/azeroth-survivors-re/src/talents.rs). Stock
[Talent.dbc UI](../../crates/benilla-app/src/ui_talent.rs) remains a different
system. Selected-target native counter/layout/appearance checks pass;
compilation, touch and original/rebuilt input/rendering comparison remain
unverified. Current Demonology data remains the separate tree/migration gap.

The [Run Stats extension](run-stats.md) now installs the exact selected
character-pane Lua, conditional categories and tooltips through the real FrameXML
VM lifecycle. All 42 inputs have live producers. Native source/locale integrity
and interpreted Lua checks pass; compilation and actual client/input/rendered
comparison remain open under #20. Changelog: 0.65, 0.73 and the talent-pause part
of 0.94.

### Complete game-mode addon bridge and bindings

The [current bridge repair](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/addon-bridge-0.105.0.md) supersedes the original
stored-level-only implementation found by this audit. It installs the full
selected-target Lua API/parser and connects all sixteen message branches,
changed-payload polling, VM reload/reset ordering, world/map/lair/flag state,
resources/stats/meters/taken and terminal delivery before teardown. Current
hash/range/data/format, eight native map cases and standalone Lua checks pass;
compilation and original/rebuilt addon behavior remain unverified. The
[pickup/effect repair](pickup-effects.md) now supplies the actual
collected-magnet summary counter. Soul Fire fractional-credit producer coverage
remains owned by #24, so the addon bridge retains that scope's limits.

Gamepad Y reaches the spend-level CVar under #22. The [keyboard binding
repair](stored-level-bindings.md) now connects current AZS_OPENLEVELS
registration/default Y, saved overrides, ReloadUI and live Options rebinding/Defaults
through the actual FrameXML host. Compilation and input/persistence comparison
remain unverified under #21.
The full `AZS_SetHudShown` bootstrap now exists; custom HUD visibility/scaling
consumers retain their own implementation and validation limits (#7/#33).
Changelog: 0.87–0.88, 0.92, 0.97, 0.98, 0.102 and 0.105.

### Controller, focus and touch integration

The [current input repair](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/input-0.105.0.md) connects gamepad stick/settings,
ordinary movement/camera/zoom, Jump binding edges, UI focus/accept/back/reroll,
sliders, mouse handoff and the accept-release gate. It also connects desktop
floating-stick IDs, pan/pinch, native stick/knob/pause nodes and touch routing
through the real FrameXML pointer host. 112 bounded native instruction cases,
five typed constructor snapshots and Rust syntax parsing pass. Compilation,
hardware interaction, DPI/rendered input and original/rebuilt parity remain
unverified under #22/#23. Touch evidence does not prove browser/mobile parity.

The original disabled-Gilrs observation concerns the generic engine boot helper;
the reconstruction's actual main uses DefaultPlugins and already installs the
device backend. See the input report for selected native owners, connected source
and remaining comparison limits. Changelog: 0.37, 0.37.1, 0.62, 0.84.1 and 0.102.

### Current Demonology and class-rule drift

The native 14-entry tree includes Demonic Familiar, Embrace, Fel Stamina,
Unholy Power, Soul Devourer/Link, Demonic Echoes, Master Demonologist, Legion
Gate, Demonic Supremacy, Infernal/Doomguard summons and the two capstones.
`felfire_training` is retained as Demonic Echoes' key. `aftermath` is retained as
Scorched Earth's key. The new effect discriminants include 32–36; older enum
meanings/layouts cannot be assumed valid.

The current [Demonology overlay](../../crates/azeroth-survivors-re/assets/demonology-0.105.0.json)
and [live demon implementation](demon-gameplay.md) now supply the tree,
army, spell, resource, attribution and offer/cap consumers under #24. The
[allocation migration repair](talent-migration.md) binds load/import and
all three specs to current key lookup and learning gates. Removed keys release
points without changing XP; preserved keys keep ranks subject to current rules.
The decoder now trims keys/ranks as the EXE does. Thirty-two native cases pass;
compilation and actual persistence/input/rendering remain open under #12.

The [class-rule repair](class-rules.md) connects two remaining concrete
data differences through their existing live consumers:

- **Shadow Dance** now uses selected effect28/`backstab` instead of effect27,
  replacing the starter rather than appending an ability. Its current prose
  explicitly names Sinister Strike as the replaced starter.
- **Shadow Weaving** now uses selected payload `0x3ba3d70a` (0.005, or 0.5%
  maximum health), including `0.5` tooltip text, instead of the older 1% value.

Selected data, four starter scans, 72 condition/selector and 20 conversion/victim
cases pass. Live Rust regressions, compilation and original/rebuilt gameplay/
presentation remain unverified under #16.

Changelog: 0.103–0.105. Older class balance/damage/proc implementation remains
useful source, not proof of every current class rule or full presentation.

### Totem limit and save/account additions

The [totem cap/expiry repair](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/totem-cap-0.105.0.md) now connects the selected
per-kind count40 and first-match stable eviction through scheduled and talent
summons. Cap eviction and ordinary deadline expiry share the real Call of Flame,
cooldown/start, hit and object-destruction consumers. All 44 bounded native
instruction cases and source parsing pass; compilation and original/rebuilt
gameplay/presentation remain open under #13.

The [beaten-zone restoration repair](save-unlocks.md) now connects
recognized `beat` pairs through the shared unlock reader to picker access and
canonical save output. Per-class maxima preserve explicit/legacy progress;
next-zone access is capped at twelve, including Ahn'Qiraj to Naxxramas.
209 bounded native cases pass; compilation and actual save/picker comparison
remain open under #15. Current Demonology refunds/key preservation remain #12.

The [current `feat:nou` grant](no-u.md) now connects the selected feat6
record and lethal boss/spell pairs, including Water Elemental Frostbolt116,
through the existing eligible save/notification path. Thirty-two native cases
pass; compilation and actual account/game comparison remain open under #26.
The 72 older achievement records retain their provenance. [Sapphiron's live
actor](companion-actors.md) now uses the shared selected-target collector
under #27/#14; compilation and runtime/presentation comparison remain open.
Changelog: 0.102.3, 0.103.1 and 0.105.

### Loot companions, forms and remaining game-mode presentation

The [shared loot-companion actor](companion-actors.md), including Sapphiron,
now connects reservation/reach/haste, quarter-radius sweep, successive targets
from the current position, carrying/return, the15-second trip limit and
Wisp-herder range. Gold-sniffer and Rune-hound delivery use real reward owners.
130 unchanged native cases pass; compilation and actual gameplay/presentation
comparison remain open under #14/#27. These are distinct from combat pets.
The [permanent-form selector](permanent-forms.md) now publishes current
Bear/Cat display overrides through the real unit fields. The
[follower repair](follower-lifecycle.md) connects showcase grants and
origin-gated expiry to the shared live actor/combat adapter, with creation at
the native entry boundary. Current talent and amulet producer inventories
contain no raw2 temporary-Imp effect; dormant historical helpers are not an
active producer. [Showcase entry/ticks](showcase.md), periodic batches,
immunity and overlay/reward gates are connected. Native checks pass: 36 form,
25 follower and 25 showcase cases plus bounded producer/class-pool inventories.
Compilation, model/animation, gameplay and original/rebuilt comparison remain
open under #25. The independent optional Tester startup row remains #9/#41.
Changelog: 0.33, 0.69, 0.71.1, 0.83.1 and 0.103.1.

Track these additional presentation/setting consumers explicitly:

- [Arrival announcements](arrival-announcements.md) now deliver named
  elite/wave/boss/guardian emotes and creature yells through the actual client
  (#28). Forty-four native packet cases pass; compilation and rendered/timing
  comparison remain unverified.
  [Boss entrance sounds](boss-voices.md) now deliver the common 8174
  alert and 22 current voice kits through the real client audio consumer.
  Static packet checks pass; compilation and audible/timing comparison remain open.
- [Red battlefield perimeter pillars](boundary-pillars.md) now have
  selected-target sampling, floor/filter and object-creation evidence connected
  through the real client; source is uncompiled and rendered comparison is open.
  The [pickup/effect repair](pickup-effects.md) connects current
  magnet/rune objects, schedules, collection and buff/Restoration/leech delivery,
  with 93 bounded native cases and uncompiled/rendered/timing limits.
  The [current spell-presentation repair](spell-presentation.md) connects ground scale, shard density and learned/racial scale-table delivery. Auxiliary instances and attached-kit admission remain source recovery; rendered comparison is unverified. These are partly implemented or source-presence
  leads, not newly proven native consumer semantics.
- [Current effect filtering](spell-presentation.md) now gates new ground, kit, missile and beam models from the real `noSpellEffects` registry value. Existing effects, reaps, casts and sound/impact timing remain connected. The `hudLoot` and separate `hudFlag` world-resource consumers still require recovery; the whole HUD contract and runtime/parity remain open.
- [Current boss dimensions](boss-catalog.md),
  [class/ability/talent definitions](balance-catalog.md) and
  [ordinary gear/amulet definitions and scaling](equipment-catalog.md)
  are now revalidated. Three Naxxramas size/reach values and the missing
  Empowerment picker entry/tooltip are corrected. Bounded checks do not
  certify complete combat consumers, WinCRT math, compilation or gameplay/rendering
  comparison; #34 retains those limits. PvP/weapon/pet validation remains #4/#6.

## Reproduction, checks and limits

Run `python3 scripts/audit-game-mode.py --check` to verify the current full
EXE hash, 17 retained talent records, exact embedded Lua, meter/proc literals,
eight selected ranges and the retained native manifest. `--prepare-native`
stages exact per-function slices/plans under ignored `runtime/`; run them with
`python3 scripts/rea-batch.py <plan>` through the project `./scripts/rea` wrapper.
The source build does not require the EXE or this audit tooling.

The selected-data/native-manifest checks and exact 159-section crosswalk check
passed. Ghidra observations were static, via immutable raw slices, and sessions
were closed. Generic GCC ABI import, unmapped data/callees, incomplete automatic
discovery and jump tables limit interpretation. The totem finding therefore
uses actual original-PE instructions rather than the partial cast pseudocode.
Only necessary extracts/identities are retained; raw responses and broader
inventories stay ignored in `runtime/`.

No compilation, compile-based tests, reference/rebuilt launch, audible/visual
comparison or MPQ-content validation was performed for this audit. Its output
is an expanded recovery backlog, not a new gameplay/parity result.

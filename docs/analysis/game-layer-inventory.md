# Game-specific source-area inventory — 0.97.2

Current ownership accounting follows the [newest supplied target](reconstruction-coverage.md)
and its [system map](system-coverage.md). This report remains historical 0.97.2 evidence.

Audit source revision: `00b13c0846af3e6e99339b5e9e7627a68f6117c9`. Selected EXE SHA-256: `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.

Historical source-presence audit: 23 of 55 identified areas have current-target source portions at this cutoff. All current mappings are partial. No complete source area or runtime parity is certified.

These historical 0.97.2 file/behavior leads are nonexhaustive and do not measure reconstructed code. They describe the source-map cutoff below, not current app completeness. See [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) for implemented behavior.

[Source ownership](code-ownership.md) · [Custom-file ledger](evidence/0.97.2/game-module-coverage.json) · [Engine-delta ledger](evidence/0.97.2/game-engine-delta.json)

## Custom game file areas

| Original area | Source state | Recovered portion / limits |
| --- | --- | --- |
| `crates/wenilla-rogue-app/src/lib.rs` | Historical; revalidate | Application composition exists; current original app-library registration/startup body is not reconstructed. Historical wiring/package version is not current recovery. |
| `crates/wenilla-rogue-app/src/screens/armory.rs` | Current: partial | Only current armory scene-mask/preview-request interaction is recovered; the report binds the native armory path. Collection/equipment/appearance/PvP ownership/page geometry/persistence remain historical or unverified. |
| `crates/wenilla-rogue-app/src/screens/backdrop.rs` | Current: partial | Current loading-picture gradients/embers, menuScene default/environment gate, twelve orbit profiles and fades are source. Final graphics/frame behavior is uncompiled/unverified. |
| `crates/wenilla-rogue-app/src/screens/cards.rs` | No reviewed source mapping | Upgrade-choice data under game/upgrades does not implement the separate in-run card-screen. No current reviewed card-screen mapping identified. |
| `crates/wenilla-rogue-app/src/screens/codex.rs` | Historical; revalidate | 140-entry Codex UI/catalog is explicitly 0.92. Current secondary-page geometry/behavior and current collection data are not revalidated. |
| `crates/wenilla-rogue-app/src/screens/discord.rs` | Historical; revalidate | Bitmap producer/data is explicitly 0.92. Current picker Discord action/button geometry does not revalidate this separate artwork module. |
| `crates/wenilla-rogue-app/src/screens/hud.rs` | No reviewed source mapping | No current full in-run HUD source identified. Library event/projection outputs and menu labels do not implement this screen. |
| `crates/wenilla-rogue-app/src/screens/hudparts.rs` | No reviewed source mapping | No current in-run HUD-parts source mapping identified. |
| `crates/wenilla-rogue-app/src/screens/language.rs` | Current: partial | Current 13 locale catalogs, selection/loading/persistence portions and bounded popup are source. Entire page lifecycle, native directory owner and rendered behavior remain partial. |
| `crates/wenilla-rogue-app/src/screens/meter.rs` | No reviewed source mapping | Boss-meter simulation events/state are library source; separate meter-screen rendering/input is not identified. Producer data is not counted as this UI. |
| `crates/wenilla-rogue-app/src/screens/mod.rs` | Current: partial | Partial current shared button/label and hover-style construction is represented. Analyst subsystem mapping; original Rust function/body ownership does not prove full shared-module recovery. Additional scrollbar namespace is separate. |
| `crates/wenilla-rogue-app/src/screens/options.rs` | Current: partial | Only current menuScene descriptor, Animated Zone/Black ordering and default are revalidated using existing Options machinery. Wider 94-row table, input priorities and config writer retain 0.92 provenance. |
| `crates/wenilla-rogue-app/src/screens/pad.rs` | No reviewed source mapping | No current controller/pad screen implementation identified; mouse/keyboard helpers do not count as pad support. |
| `crates/wenilla-rogue-app/src/screens/picker.rs` | Current: partial | Current layout/controls/catalog, twelve-zone policies, selected-card scroll, Enter/timeout and some hover/input are source. Pick/name/appearance normalization, world-entry adapter and schedule/rendered equivalence remain incomplete. |
| `crates/wenilla-rogue-app/src/screens/rewards.rs` | Historical; revalidate | Account rewards UI/catalog is explicitly 0.92 and not revalidated against this target. |
| `crates/wenilla-rogue-app/src/screens/runmods.rs` | Historical; revalidate | Run-options UI and difficulty/reward display retain 0.92 provenance. Current game-side modifier consumers are separately mapped under mods.rs. |
| `crates/wenilla-rogue-app/src/screens/talents.rs` | Current: partial | Current 354-definition between-run page has recovered cell/link positioning, tints, gating and exclusive warning. Wider geometry/selection/input/serialization remain historical or unverified. |
| `crates/wenilla-rogue-app/src/screens/talentview.rs` | No reviewed source mapping | The target separately names screens::talents and screens::talentview. No reviewed mapping for this separate unit identified; between-run talent page is not counted twice. |
| `crates/wenilla-rogue-app/src/screens/touch.rs` | No reviewed source mapping | Window cursor paths are source; fallback input-record producer/type and touch integration are not recovered. No guessed touch implementation counted. |
| `crates/wenilla-rogue-app/src/screens/update.rs` | Historical; revalidate | Updater overlay/state source is explicitly 0.92; current version literals do not revalidate its screen. |
| `crates/wenilla-rogue-app/src/screens/xinput.rs` | No reviewed source mapping | No current XInput/controller implementation or reviewed source mapping identified. |
| `crates/wenilla-rogue-app/src/update.rs` | Historical; revalidate | Check/download/install/network/worker source retains 0.92 provenance. No current updater behavior or file operation validated. |
| `crates/wenilla-rogue/src/achievements.rs` | Historical; revalidate | Existing achievement/perk/tabard/companion account catalog/menu is 0.92. Current game-event requests do not implement achievement accumulation/unlocks. |
| `crates/wenilla-rogue/src/appearance.rs` | Historical; revalidate | Appearance/name/equipment helpers retain historical provenance. Current caller discovery/armory masking does not revalidate normalization/generation. Concurrent unfinished hero-preview recovery excluded. |
| `crates/wenilla-rogue/src/content.rs` | Current: partial | Current source catalogs include class/race/zone/ability records, 148 enemies, 60 bosses and loot definitions. Recovered data counts only as partial content source; complete consumers/simulation are not implied. |
| `crates/wenilla-rogue/src/dbc.rs` | No reviewed source mapping | Foundation DBC loaders are reused; no reviewed current custom DBC extension body identified. Unchanged foundation source excluded. |
| `crates/wenilla-rogue/src/driver.rs` | No reviewed source mapping | Command 11 caller recovered; connected current session/world-entry/local driver is missing. Engine adapters required. |
| `crates/wenilla-rogue/src/fonts.rs` | Current: partial | Current base/CJK font selection and accent/mirror/alias augmentation source exists. Embedded-font delivery/final renderer/platform behavior unverified; users supply optional runtime fonts. |
| `crates/wenilla-rogue/src/game/abilities.rs` | No reviewed source mapping | Player ability definitions/descriptions and boss requests do not implement player ability execution/scheduling. Concurrent unfinished player-ability recovery excluded. |
| `crates/wenilla-rogue/src/game/addon.rs` | Current: partial | Only guardian lair/unit schemas and projection portions are source. Full list filters, delivery, wire serialization, VM scheduling and wider bridge missing. |
| `crates/wenilla-rogue/src/game/auras.rs` | No reviewed source mapping | Aura/status inputs/effect requests exist; shared aura/effect simulation owner does not. Typed ports are not implementation. |
| `crates/wenilla-rogue/src/game/companions.rs` | No reviewed source mapping | Historical account companion catalog/UI does not implement current in-run companion simulation; no reviewed current mapping identified. |
| `crates/wenilla-rogue/src/game/enemy.rs` | Current: partial | Current ordinary actor creation/scaling/movement/melee/cast/status/relocation and boss branches are library source. Shared auras, damage/effect/packet/terrain adapters and full integration remain incomplete. |
| `crates/wenilla-rogue/src/game/guardians.rs` | Current: partial | Current lairs, placement, respawn, state/timers, scaling, abilities/rewards are source. Engine adapters, full orchestration and runtime/rendered behavior remain incomplete. |
| `crates/wenilla-rogue/src/game/mod.rs` | Current: partial | Selected Game constructor/tick/death/spawn/chest/boss completion branches are source. Entire Game state machine, player combat/progression, shared effects, persistence and world loop are not reconstructed. |
| `crates/wenilla-rogue/src/game/procs.rs` | No reviewed source mapping | No current shared proc simulation source identified; integration reports explicitly require shared aura/proc owner. |
| `crates/wenilla-rogue/src/game/talents.rs` | No reviewed source mapping | Between-run allocation/effect bytes recovered; applying talent effects during gameplay is explicitly excluded and unimplemented. |
| `crates/wenilla-rogue/src/game/upgrades.rs` | Current: partial | Current cache/upgrade eligibility, rarity, jewelry/amulet choice/application branches are source. Full generated spell/effect/card pipeline and live choice/pause/save delivery incomplete. |
| `crates/wenilla-rogue/src/gear.rs` | Current: partial | Current class/zone/boss equipment candidate pools, probabilities and same-tier armor-slot distribution are source. Subsystem mapping for reward portions; full item stats/equipment/PvP ownership/persistence historical or missing. |
| `crates/wenilla-rogue/src/i18n.rs` | Current: partial | Current 13 catalogs, selection/fallback/load and selected-language persistence portions are source. Invalid setters, native directory owner and wider consumers incomplete. |
| `crates/wenilla-rogue/src/jewelry.rs` | Current: partial | Current increment/scaling and amulet preview/empowerment branches plus current definitions are source. Full generated effects/run integration incomplete; historical Codex separate. |
| `crates/wenilla-rogue/src/mods.rs` | Current: partial | Current run-option reward multiplier/stat modifier consumers are source. Historical run_mods.rs display formulas not revalidated by this mapping; complete definitions/normalization/persistence incomplete. |
| `crates/wenilla-rogue/src/nav.rs` | No reviewed source mapping | Real navigation/path/collision queries are engine ports. Foundation navigation/typed interfaces do not reconstruct the custom nav module. |
| `crates/wenilla-rogue/src/proto.rs` | No reviewed source mapping | Command production/typed packet requests are leads; complete custom commands/events/serialization have no reviewed current implementation. |
| `crates/wenilla-rogue/src/realmd.rs` | No reviewed source mapping | No current local realm/auth/session service implementation or reviewed mapping identified. |
| `crates/wenilla-rogue/src/save.rs` | Current: partial | Only current per-class unlock lookup/clamp and earned-talent-budget readers have source. File format, sealing, imports/migrations, duplicates, hero/item mutation and actual IO retain 0.92 provenance or remain unverified; not current persistence-pipeline recovery. |
| `crates/wenilla-rogue/src/server.rs` | No reviewed source mapping | No connected local server/complete simulation orchestration. Menu entry/library adapters remain unconnected. |
| `crates/wenilla-rogue/src/talents.rs` | Current: partial | Current 354 definitions, descriptions, rank scaling, allocation/exclusive/prerequisite gates, normalization/refund are source. Gameplay effect application and whole-save migration/serialization remain outside recovery. |
| `crates/wenilla-rogue/src/terrain.rs` | No reviewed source mapping | Placement requires real terrain adapters. Foundation ADT/WMO/height functionality reused; complete custom terrain module has no reviewed implementation. |

## Reviewed engine additions and changes

| Original area | Source state | Recovered portion / limits |
| --- | --- | --- |
| `engine.menu_scene` | Current: partial | benilla_app::menu_scene::MenuScenePlugin; Current original symbol identity and/or hash-checked native function extents as retained in the detailed entry; source coverage is partial, missing or historical, never completed. |
| `engine.char_select.world_live` | Current: partial | WorldLive publisher: ordinary world OR active menu scene; Current original symbol identity and/or hash-checked native function extents as retained in the detailed entry; source coverage is partial, missing or historical, never completed. |
| `engine.player.menu_camera_gate` | Current: partial | World camera gate; Current original symbol identity and/or hash-checked native function extents as retained in the detailed entry; source coverage is partial, missing or historical, never completed. |
| `engine.char_select.preview_suppression` | No reviewed source mapping | Character-select preview feed menu-request early return; Current original symbol identity and/or hash-checked native function extents as retained in the detailed entry; source coverage is partial, missing or historical, never completed. |
| `engine.hero_preview` | Historical; revalidate | benilla_app::hero_preview::HeroPreviewPlugin; Current original symbol identity and/or hash-checked native function extents as retained in the detailed entry; source coverage is partial, missing or historical, never completed. |
| `engine.world_hold` | No reviewed source mapping | benilla_app::spell_override::WorldHoldPlugin; Current original symbol identity and/or hash-checked native function extents as retained in the detailed entry; source coverage is partial, missing or historical, never completed. |

## Outside this denominator

- 9 unmatched engine-path candidates need ownership/version-drift review.
- 1 native menu view-lane behavior has an unresolved module owner and is not yet a separate source-area vote.
- Supplemental achievements/scrollbar/window namespaces need file/inline-module boundary review; the reward/rewards relationship also needs deduplication.
- Unchanged foundation/dependency code is excluded. Shared-path presence alone does not prove every engine routine is unchanged.
- New concurrent hero-preview/player-ability work is outside the pinned audit until reviewed.

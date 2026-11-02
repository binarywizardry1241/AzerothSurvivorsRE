# EXE sweep and rebuild connections — 0.109.0

**Historical target:** this report covers 0.109.0 only. [verification-needed](../verification-needed.md) records the installed target and current implementation limits.

Reviewed 2026-10-22 against the configured installed EXE, 140,447,744 bytes,
SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns the permanent backlog. This report
reconciles native discovery, source attribution and earlier validation; it does
not certify gap-free behavior or 1:1 gameplay. The
[execution/observation record](evidence/0.109.0/execheck-sweep.json) binds the
completed checks, retained artifacts and their limits.

## Whole-image result

The EXE and all eight installed MPQs retain their registered identities. The
fresh whole-file scan reproduces 725 diagnostic paths / 53 custom paths,
347,099 unwind extents, 631,068 relocation sites, 420 imports and zero exports.
Embedded candidates include 315 game-binding identifiers, 179 Lua declarations,
336 Lua/UI registrations, 904 module/type names and 300 resource-path matches.
These include packed/adjacent strings and false leads; counts are not recovered
mechanics. The diagnostic scan verifies 17,682 instruction references across
5,939 candidate extents. Complete declared-extent linear decoding and the
outside-unwind partition reproduce their existing records.

A **fresh full-image REA/Ghidra run** imports the installed PE read-only, uses all
420,417 function starts plus 28,831 supplemental code starts, and applies the
existing 3,355 proved switch tables / 21,454 guarded edges. Native decoding,
actual flow-body repair and full exports complete. Independent Capstone decoding
verifies **all 22,422,439 instructions / 89,704,052 instruction bytes** against
the installed image. All five instruction/body/reference/external/direct-call
export hashes exactly match the canonical census. There are 420,596 actual
functions, 473,935 body ranges, 3,882,708 Program references and 420 external
locations. All requested entries decode and have repaired bodies; all 2,357
observed direct-call helper targets have owners.

The canonical [native selection](evidence/0.109.0/native-image-current.json) and
[native report](native-census-0.109.0.md) remain selected: no changed image,
new diagnostic path, changed export graph or new gameplay mechanic was proved
by repeating this profile. The replay preserves original input-producer
commitments separately from current launch-tool witnesses. Unchanged exports
cannot establish completeness of its discovery model.

The Ghidra instruction union still excludes **8,438,842 mapped executable
bytes**: 5,292,799 inside declared extents and 3,146,043 outside. Of these,
4,977,982 are mixed/unclassified and 3,460,860 are padding candidates. Padding
is not proved noncode. The selected full-image operand/ownership records retain
70,030 indirect calls and 11,321 indirect jumps, partial slot/producer
attribution, 5,295 ownerless direct-jump destinations and unresolved dynamic
aliases. Linear decoding, Ghidra flow recovery and semantic recovery are
independent dimensions; none is a reliable overall reconstruction percentage.

## Existing contracts and attribution corrections

All **63 existing `check-*-0.109.0.py` static checkers pass** using their actual
arguments and existing local dependencies. These are bounded data/instruction
fixtures with explicit allocator/ECS/OS/formatting/geometry seams, not execution
or type checking of reconstructed Rust. The independent new
[ordinary-ability comparison](ability-definitions-0.109.0.md) checks every field
of the recovered 113 records without a mismatch; its consumers remain separate.

The system register previously omitted the current Rewards report and current
achievement-registry constructor from their own rows. Those links are now
explicit. Rewards retains its current 46-record/input/confirmation/account proof;
achievements retains its 73-entry / 1,520-point, 365-field constructor proof.
Neither registration change revalidates historical gameplay grants or every
source contract. The stale readable system map's 51-source/2-missing claim is
corrected at the sweep to **52 partial source correspondences / 1 unmapped XInput adapter**.
The subsequent [current acquisition repair](input-0.109.0.md) now provides the
53rd partial correspondence and 66,794 bounded native cases; downstream input and
platform/runtime parity remain open.
Hazard connections were already recovered; no new hazard repair is claimed.
Twenty-one duplicate current-work instructions still pointing to installed
0.108.0 are removed; current 0.109.0 recovery tasks and historical provenance
remain intact.

## Complete custom-system crosswalk

The [machine crosswalk](evidence/0.109.0/exe-connections.json) contains preferred native
Location-derived body addresses, exact ownerless instruction addresses, source
files, current bounded references and permanent gap IDs for every discovered
custom path. Its committed parent records retain exact bytes/hex/ranges and
reference inputs; the full evidence/asset inventory remains in ignored runtime.
All 53 paths have current diagnostic links. **39** additionally have directly
registered current bounded contract/data links; **14** do not. This is a ledger
review distinction, not 39 complete systems or 14 proven missing implementations.
A contract checked through another system may still need a precise attribution.

`app:` abbreviates `crates/wenilla-rogue-app/src/`; `game:` abbreviates
`crates/wenilla-rogue/src/`. Body counts are per row and overlap between rows.
All rows retain open whole-system semantics and runtime/parity.

| Native path | Genuine Location references | Distinct Location body owners | Ownerless sites | Current bounded link | Canonical gaps |
| --- | ---: | ---: | ---: | --- | --- |
| `app:lib.rs` | 2 | 1 | 0 | Present | #9, #17, #41 |
| `app:screens/armory.rs` | 29 | 14 | 5 | Present | #4, #17, #41 |
| `app:screens/backdrop.rs` | 2 | 1 | 0 | Present | #17, #39, #41 |
| `app:screens/cards.rs` | 12 | 3 | 0 | Review needed | #2, #18, #41 |
| `app:screens/codex.rs` | 38 | 13 | 0 | Present | #17, #34, #41 |
| `app:screens/discord.rs` | 10 | 3 | 0 | Present | #17, #41 |
| `app:screens/hud.rs` | 21 | 6 | 0 | Present | #7, #21, #33, #41 |
| `app:screens/hudparts.rs` | 3 | 1 | 0 | Present | #7, #33, #41 |
| `app:screens/language.rs` | 3 | 1 | 0 | Present | #17, #41 |
| `app:screens/meter.rs` | 13 | 5 | 0 | Review needed | #8, #24, #41 |
| `app:screens/mod.rs` | 16 | 7 | 0 | Present | #9, #17, #22, #23, #41 |
| `app:screens/options.rs` | 25 | 7 | 9 | Present | #17, #21, #22, #23, #33, #41 |
| `app:screens/pad.rs` | 3 | 3 | 0 | Present | #21, #22, #41 |
| `app:screens/picker.rs` | 14 | 4 | 0 | Present | #9, #15, #17, #41 |
| `app:screens/rewards.rs` | 2 | 0 | 2 | Present | #3, #14, #17, #27, #41 |
| `app:screens/runmods.rs` | 4 | 1 | 0 | Present | #17, #34, #41 |
| `app:screens/talents.rs` | 2 | 2 | 0 | Present | #12, #16, #17, #34, #41 |
| `app:screens/talentview.rs` | 6 | 2 | 0 | Review needed | #10, #12, #22, #23, #41 |
| `app:screens/touch.rs` | 5 | 3 | 0 | Review needed | #23, #41 |
| `app:screens/update.rs` | 6 | 2 | 0 | Present | #17, #41 |
| `app:screens/xinput.rs` | 1 | 1 | 0 | Present | #22, #41 |
| `app:update.rs` | 3 | 3 | 0 | Present | #17, #41 |
| `game:achievements.rs` | 3 | 2 | 0 | Present | #19, #26, #27, #34, #41 |
| `game:appearance.rs` | 2 | 1 | 0 | Present | #17, #25, #34, #41 |
| `game:bindings.rs` | 1 | 1 | 0 | Present | #10, #21, #22, #23, #41 |
| `game:content.rs` | 46 | 25 | 16 | Review needed | #29, #32, #34, #41 |
| `game:dbc.rs` | 8 | 4 | 0 | Review needed | #41 |
| `game:driver.rs` | 1 | 1 | 0 | Present | #9, #17, #41 |
| `game:fonts.rs` | 16 | 5 | 1 | Present | #2, #17, #39, #41 |
| `game:game/abilities.rs` | 22 | 2 | 11 | Present | #13, #16, #19, #24, #32, #34, #41 |
| `game:game/addon.rs` | 1 | 1 | 0 | Present | #11, #21, #24, #31, #33, #41 |
| `game:game/auras.rs` | 1 | 1 | 0 | Review needed | #19, #25, #31, #32, #33, #41 |
| `game:game/companions.rs` | 18 | 4 | 0 | Review needed | #14, #27, #31, #41, #25 |
| `game:game/demons.rs` | 23 | 12 | 1 | Present | #8, #12, #24, #41, #25, #9 |
| `game:game/enemy.rs` | 29 | 11 | 7 | Present | #1, #28, #29, #32, #34, #41, #25, #42, #9 |
| `game:game/guardians.rs` | 14 | 4 | 0 | Present | #1, #11, #19, #29, #34, #41, #25, #28, #9, #42 |
| `game:game/mod.rs` | 13 | 5 | 0 | Present | #9, #13, #19, #21, #25, #28, #30, #31, #33, #34, #41 |
| `game:game/procs.rs` | 3 | 2 | 0 | Review needed | #13, #16, #19, #24, #31, #34, #41 |
| `game:game/talents.rs` | 15 | 2 | 1 | Review needed | #12, #13, #16, #19, #24, #34, #41 |
| `game:game/upgrades.rs` | 12 | 5 | 1 | Review needed | #2, #13, #18, #21, #24, #34, #41 |
| `game:gear.rs` | 15 | 10 | 0 | Present | #4, #17, #19, #34, #41 |
| `game:i18n.rs` | 6 | 2 | 0 | Present | #17, #41 |
| `game:jewelry.rs` | 2 | 2 | 0 | Review needed | #18, #19, #34, #41 |
| `game:mods.rs` | 2 | 2 | 0 | Present | #17, #19, #34, #41 |
| `game:nav.rs` | 64 | 20 | 4 | Review needed | #1, #38, #41 |
| `game:proto.rs` | 2 | 2 | 0 | Present | #9, #11, #28, #29, #31, #32, #41, #33 |
| `game:realmd.rs` | 2 | 1 | 0 | Present | #9, #41 |
| `game:save.rs` | 18 | 9 | 0 | Present | #12, #15, #17, #19, #37, #41, #9 |
| `game:server.rs` | 12 | 6 | 0 | Present | #9, #19, #21, #28, #41 |
| `game:talents.rs` | 2 | 2 | 0 | Present | #12, #16, #19, #24, #34, #41 |
| `game:terrain.rs` | 26 | 7 | 0 | Review needed | #1, #30, #32, #38, #39, #41 |
| `app:screens/markers.rs` | 10 | 5 | 1 | Present | #41, #42, #43 |
| `game:game/hazards.rs` | 47 | 4 | 35 | Present | #41, #42, #43 |

The 94 ownerless genuine Location references span 13 paths. Existing exact
site-role proofs classify them as failure/checked-removal paths, not new callable
routines or absent mechanics. Rewards has two such locations and no proved
Location-derived body owner despite its independently recovered UI contracts.
Keep its containing-body uncertainty under #41; do not substitute its enclosing
unwind extent or a nearby filename literal as an owner.

## Actionable recovery and missing proof

| Follow-up | Native/source starting point | Work before a 1:1 claim | Existing gaps |
| --- | --- | --- | --- |
| Ordinary combat, aura/proc/talent consumers | Current `game/abilities`, `game/auras`, `game/procs`, `game/talents` Location/body addresses in the crosswalk; live `player_abilities`, `run_effects`, `gameplay/mechanics` source | Bind dispatch, state offsets, target/cooldown/hit order, proc admission and producer/consumer dependencies to current instructions. The 113 definition-field matches do not prove these contracts. | #6, #12, #13, #16, #19, #24, #25, #31, #32, #34, #41 |
| Choice/treasure data and transactions | `screens/cards`, `game/upgrades`, `jewelry`; `loot_rewards`, `treasure_chests`, choice/treasure adapters | Rebind RNG draw/admission order, cache purchase/delivery, level/cache distinctions, replacement/scaling and card/tooltip dependencies. Retain the current bounded font/layout proof without promoting old transaction RVAs. | #2, #18, #19, #21, #34, #41 |
| Meter and talent-view contracts | `screens/meter`, `screens/talentview`; `gameplay/meter`, `gameplay/talent_view` and accounting producers | Map current source-specific consumers beyond existing addon/terminal/frame checks; rebind capture/reset/lookup and viewer pause/input ownership. | #8, #10, #12, #24, #41 |
| Controller, touch and XInput acquisition | `screens/pad`, `screens/touch`, `screens/xinput`; native input and ordinary controller adapters | Rebind native focus/input/touch contracts; retain the newly mapped current Windows acquisition proof separately from downstream native focus/input/touch and platform/backend equivalence. | #21, #22, #23, #41 |
| Custom content, DBC and companions | `content`, `dbc`, `game/companions`; custom dictionary, appearance/asset and collector readers | Attribute already-current metadata subcontracts precisely; rebind remaining getter/cache/ID/format/collector lifetime dependencies. Preserve the available public engine as baseline. | #14, #25, #27, #29, #31, #32, #34, #41 |
| Navigation, terrain and resource differences | `nav`, `terrain`, current world/MPQ adapters; camera/marker proofs have their own scope | Recover concrete required spatial contracts outside the selected camera/raid checks; diagnose the minimap failures below. Do not replace missing behavior with an invented fallback. | #1, #30, #32, #35, #38, #39, #41, #44 |
| Filename-free and indirect custom connections | Full-image exact reference/operand/pointer inventories and residual executable ranges | Follow proved custom dependencies into anonymous code, resolve guarded targets/aliases when evidence supports them, and retain unresolved ranges. Generic compiler/OS reconstruction is not a separate goal. | #41 |

The complete historical evidence rescan reproduces **9,614** distinct old range
commitments. **6,688** have exact reconstructable preimages: 565 unique current
matches, 3,008 ambiguous matches and 3,115 absent sequences. **2,926** preimages
remain unavailable. Only two old file offsets still match. Unique matches prove
only bytes, not callers, data layouts or behavior. The existing audit also keeps
46 documents without explicit target/exact owning-manifest binding unresolved.
Do not silently reuse old addresses or call absent sequences missing mechanics.

The connection audit indexes **839 retained JSON evidence documents**: 133 have
explicit current identity, 650 historical identity and 56 need an owning
manifest or identity review. The latter is an identity-screening count, not the
historical range audit's narrower 46-document result. Of 114 directly included
source assets, 12 declare the current hash, 60 a historical hash and 42 no hash
inside the asset. External manifests/current comparisons may validate those
values; intentional historical enum formats and forensic pointer words must not
be blindly rewritten. These inventories expose review work, not 114 verdicts.

## Retained reconstructed-launch findings

These are **historical reconstruction observations**, not original-EXE behavior
or fresh reproductions on latest source. The retained 2026-10-21 game log and
build record identify binary SHA-256
`9c8edfb0268b8f781346c61e176f869423eb4b4cddd44512ba570e0244567132`.
The exact compiled source snapshot is not independently established, and later
source repairs were not compiled. The compact sweep evidence retains log hashes,
line references and the following sanitized observations.

| Gap | Observation | Next diagnosis and proof boundary |
| --- | --- | --- |
| #44 | Four hashed `textures/Minimap/*.blp` lookups fail. | [Current source/resource diagnosis](minimap-lifecycle-0.109.0.md) identifies the four absent origin tiles and an inactive-player request path across logout; the renderer now gates it before tile lookup. No archive/casing fallback is introduced. Historical scheduling, current game reproduction and rendered parity remain unverified. |
| #45 | Lua chunks index nil `ChatFrame1` and `ChatFrame2`. | [Current source/FrameXML diagnosis](chat-session-lifecycle-0.109.0.md) identifies the exact clear chunks and an unordered exit callback racing VM replacement. The session owner now resets only its persistent chat queue before replacement; frame contents belong to the dying VM. Source/resource/Lua checks pass. The historical schedule, actual startup/logout and original/rebuilt parity remain unverified. |
| #46 | A deferred ECS command targets a despawned entity. | Subsequent [source tracing and repair](local-body-lifetime.md) identifies duplicate local-player removal after inbound logout and adds GUID-index ownership/generation checks. Six Rust regressions are authored, not run. The release log still cannot attribute its unnamed command to that producer; fresh launch behavior and parity remain unverified. |

Audible over-scale/limiter and missing sound warnings in that log remain leads
under existing loading/audio #5; a limiter warning alone does not prove audible
clipping or a difference from the original. No extra defect is invented from it.

## Reproduction and limits

Use the repository [execheck skill](../../.agents/skills/execheck/SKILL.md) and
[REA setup/native profiles](../REA.md). The connection audit is reproduced with:

```sh
python3 -B scripts/audit-exe-connections.py
python3 -B scripts/test-exe-connections.py
python3 -B scripts/check-ability-definitions.py
python3 -B scripts/check-reconstruction-coverage.py
```

No compilation, compiling tests, game launch, live-memory acquisition, installed
file/save/configuration mutation or original/rebuilt comparison occurred during
this sweep. Preferred PE VAs, static references and exact byte matches do not
establish ASLR-adjusted live addresses, all dynamic memory states, runtime
schedules, gameplay/input/persistence/rendering, platform correctness or parity.

# Frontend and backend account ownership

Target: installed Windows0.109.0 EXE, SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.

The frontend Save resource and Server`+b20` are separate accounts. Options imports the decoded resource immediately, queues Reload16 and restores its Pick by reading the active file. A failed best-effort write can leave that frontend resource different from the authoritative backend. A single synchronous Save replacement lost this behavior and allowed subsequent whole-account UI snapshots to overwrite unrelated backend data.

Source now retains `MenuState.save` for frontend account views and optimistic edits, `backend_save` for server account ownership and a separate current backend Pick. UI requests carry their recovered payloads in order. The existing update driver drains those requests after account/Options input and before run input; backend write snapshots remain separately ordered. There is no added clock or guessed25ms delay. This source schedule does not certify native thread timing.

The frontend Pick resource is identified by current startup as well as its64-byte layout. Canonical startup `140064930` calls restore `140062330` at `14006495e` into `[rbp+0x2b0]`, then inserts those same64 bytes at `140064c43..140064d06` under TypeID `069ad40b469b67b8d24e086565767c39`. Descriptors at `145d9d780`, `145d9df58` and `145dcd3c0` match. The [positive binding](evidence/account-commands/frontend-pick-binding.json) reuses the canonical startup/restore extracts; `scripts/check-frontend-pick-binding.py` checks the identity without executing startup or ECS insertion.

## Commands and consumers

The original dispatcher `1458bb9f0..1458bd2a8` is already identified by [addon-bridge lifecycle evidence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.109.0/addon-bridge/lifecycle-rea.json). Its [bounded command replay](evidence/account-commands/manifest.json) reuses that owner.

| Request | Backend behavior |
| --- | --- |
| Pick11 | Normalize the submitted Pick, clamp against backend unlocks, update backend current/optional Pick and its class Hero, write, then publish `{"type":"picked"}`. |
| Gear13 | Validate all19 slots against backend item/tabard ownership and current Pick race; retain explicit hidden looks; replace the matching class row only; write unconditionally. The raw enum uses the Gear row's niche encoding rather than a prepended13. |
| Talents14 | Normalize submitted class/allocation against backend XP and selected spec; write unconditionally. |
| Spec15 | Save outgoing allocation and change backend slot; write only when changed. |
| Reload16 | Reload actual active Save, apply account grants/write if changed, clone its stored optional Pick or the native default. It does not clamp/randomize again or publish a frontend replacement. |
| Rewards17 | Validate and replace purchased perks/tabards only; write only on acceptance. |
| Reset18 | Require resets below2 and a nonempty purchased-perk vector, clear that vector, increment resets and write. |
| Pets19 | Take the first two submitted strings; substitute `squirrel` for unknown or inaccessible names; preserve slot count/duplicates and write unconditionally. |

Frontend gear/talent/spec/reward gestures still update their own resource before queueing these payloads. Backend commands validate against their own account. Reset/Pets requests do not replace each other's fields. A rejected request does not copy the imported frontend account over the backend.

A validated command mutates only its owned record families through
`Save::replace_runtime_records`; it does not re-enter file-load normalization.
The Rewards validator accepts some known zero-rank purchases. Their entries
remain in the live perk vector and the serializer emits them, so Reset can
consume a reset even when every retained rank is zero. An actual file reload
drops those zero entries. Unrelated gear, tabard, pets, talent, Pick and account
mutations preserve that distinction until Reset or a true reload. The frontend
Reset helper uses the same vector-count restriction. Its rendered button also
requires an unchanged plan; input keeps the native helper restriction because
previously admitted rows can run after another action in the same batch.
Unrelated Rewards writes retain an existing single Pets slot; selecting a
companion still follows the separate two-slot UI operation.

Run entry, gear/effects/talent/account grants, live talent XP, run result accounting, permanent-row bests and ordinary stock roster/Create/Delete use backend Save. Run entry captures its actual Hero and name, so later frontend imports cannot replace a live player's race/appearance or result loot presentation. Pending account writes clone backend Save. Export independently reads the actual active file, as native `1458a83b0` does.

## Frontend cache lifetime

The current `picked` publication sets AppState`+f`; it does not publish Save content. Current keyboard lifecycle `14018dc00` admits menu departure only after its Ready/Picked gates. The menu-return poll restores the process's custom-menu flag. Current root owner `140074b60` reloads and replaces frontend Save only when its root query is empty and the custom menu is visible; its following `14589c030` call clamps the retained frontend Pick against that newly loaded account. The [command manifest](evidence/account-commands/manifest.json) links the canonical updater, root and poll owners without duplicating extracts.

Source connects this read to actual root absence on initial creation/return. Ordinary dirty content rebuilds retain the existing frontend cache. No invented per-frame frontend/backend synchronization is added.

## Validation and limits

`python3 -B scripts/check-account-commands.py` passes129 cases:25 full-dispatcher ownership/gate cases,96 mode/Ready/Picked/time gates,4 menu-return branches and4 root residency admissions. The actual Pick normalizer, unlock clamp,19-slot Gear validation/copy, Reset guard and current/default Pick replacement execute. Typed disk results, grants, selected mutation helpers, JSON formatting/callback, allocation/free/growth and query admission are explicit seams. The disjoint frontend Save canary remains unchanged through backend dispatch.

`python3 -B scripts/check-account-command-helpers.py` passes312 full current Rewards validator/application plans,63 full Pets collector/map payloads and56 zero-rank lifecycle sequences. It checks prerequisites, monotone ownership, costs, invalid/locked names, duplicate/single/empty inputs and first-two capacity limits, while retaining unrelated pets/reset/stat fields. Each plan also checks the actual serialized perk row. The56 sequences execute accepted zero plans, serializer output, optional native parser reload and the actual dispatcher Reset guard/mutation for reset counts0/1/2/u32::MAX. They also execute the actual frontend Reset helper and sidebar admission blocks with both edited states, while checking that single-slot Pets state survives. The [helper manifest](evidence/account-command-helpers/manifest.json) records four freshly recovered supporting owners and reuses the canonical Rewards/typed Save extracts. Its initialized achievement key/point registry is an explicit fixture bound by the independent full current73-entry constructor; native lazy engine registry initialization is outside this replay.

Authored Rust regressions cover failed-import divergence, subsequent backend revalidation, root refresh, backend-only write snapshots and all431 helper vectors, plus a chain of unrelated live mutations that must preserve zero-rank purchases until actual reload. They were not compiled or run. Rustfmt only parsed edited source. No installed save/configuration was written and no compiler, build, original/rebuilt game, scheduler, filesystem failure scenario, platform device or rendering comparison ran. Exact worker scheduling, ECS/type/build correctness and live interaction/presentation still require their separately authorized validation.

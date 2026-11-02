# Azeroth Survivors custom menus and account interfaces — 0.112.0

The [0.115.0 menu map](menu-pages-0.115.0.md) owns current selected source and
static results. This report retains its original target and bounded contracts.

Installed EXE SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent gaps #17 and #24.
This map covers Azeroth Survivors data, custom controls and necessary calls into
the existing open-source benilla engine. It does not prescribe reconstructing
the renderer, FrameXML host, client controller or other inherited subsystems.

| Azeroth Survivors contract | Current source and bounded evidence |
| --- | --- |
| Fourteen translated catalogs | All 39,788 values match the current payloads, with 2,842 keys per catalog. Existing locale regressions use the current key sets and translated spell names. [Catalogs](locale-catalogs-0.112.0.md) |
| Achievements, Rewards, companions and tabards | 84 achievements/1,775 points, 13 perks, 22 companions and 20 tabards are connected. Earned-gated tabards cannot be granted by a legacy purchase; the Herod reward is free. The eleven new boss feat grants are connected under [#19](achievement-grants-0.112.0.md); `no u` retains #26. [Catalog/admission](rewards-catalogs-0.112.0.md) |
| Achievement appearances and equipment navigation | Seven cosmetic descriptors feed earned grants, Rewards Show/clear actions, Armory Look and existing preview resolution without adding gear statistics. Back appears third only when an earned cloak admits it. Four retained viewports use the recovered custom keys and layout. [Appearances](armory-cosmetics-0.112.0.md), [slot producer](armory-slots-0.112.0.md) |
| Armory input and names | 574 current mutation/navigation cases and 581 ordinary/PvP name comparisons preserve the existing gamemode consumers. [Input/catalog](armory-input-catalog-0.112.0.md) |
| Preview request producer | Signed affine sizing and absent/zero-axis admission retain the previous request when the custom producer skips publication. The existing engine preview API and renderer remain the consumer. [Producer](menu-preview-publication-0.112.0.md) |
| Save Combat Log control | The current default and exact trimmed admission drive the ordinary engine logger through the existing VM API. [Control](combat-log-option-0.112.0.md) |
| Custom Options file values and live assignment | First-match literal reads, shared configuration home, model refresh and active-UI admission are connected at the existing engine interfaces. [File/VM adapter](options-vm-0.112.0.md) |
| Numeric choice labels | Current complete-formatter replay covers all three choice lists and 45 boundary cases. Out-of-range indices now clamp to the final label. [Bounds](options-choice-labels-0.112.0.md) |
| Custom binding capture and account table | Account-file values are authoritative for the custom editor. Capture, commit, file/live replacement and refresh use the recovered current custom routes and existing binding APIs. [Bindings](in-run-bindings-0.112.0.md) |
| Demon picker text | Seven directly related spells match across fourteen locales; the Empowerment cooldown expression is corrected to 22.4 seconds while its displayed duration remains 11. [Demon tooltips](demon-picker-tooltips-0.112.0.md) |

Existing Talents, Codex, Saves and Run Options source retains its owning
historical evidence and separately numbered mechanic gaps. No new AS source
defect was identified there; this map does not certify their entire native
ownership against the current target.

The [historical custom-page map](menu-pages-0.109.0.md) retains the provenance of
unchanged source and its earlier recovery. This current map does not relabel
that evidence or claim every historical native owner was revalidated. Existing
engine implementations are reused; generic native discovery/completeness totals
are not completion requirements for these Azeroth Survivors source repairs.

Original-instruction cases and data comparisons verify their stated custom
contracts with the declared fixture seams. Rust syntax parsing is separate from
compilation or execution. No compiler, compiling test, game, actual save/config
operation, device/network service, interactive/rendered comparison or
original/rebuilt parity check ran. Source type/schedule correctness and live
gameplay/menu behavior remain runtime validation boundaries.

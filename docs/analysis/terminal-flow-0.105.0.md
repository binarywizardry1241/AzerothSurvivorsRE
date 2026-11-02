# End-of-run screens — 0.105.0

Gap #9 now has source consumers for defeat, deliberate departure and victory,
with retained identity/loot/talent XP/statistics, Again/Main Menu and victory-only
Endless continuation. Current integrated status belongs to
[verification-needed](../verification-needed.md); compilation and original/rebuilt parity
remain unverified, and the source limits below keep the parent gap partial.

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [presentation manifest](evidence/0.105.0/terminal/presentation-manifest.json)
and [action/mechanics manifest](evidence/0.105.0/terminal/mechanics-manifest.json)
record exact original byte ranges, hashes and REA/Ghidra identities. Raw slices
lack whole-program types and embedded data; original PE instructions/literals
corroborate them. Older terminal evidence is not the specification for this work.

## Live ownership and actions

`gameplay/terminal.rs` captures once after mechanics tick and before account
delivery. Saving a result does not remove summary inputs. `TerminalState` owns
the frozen presentation separately from save checkpoints, while
`gameplay/terminal_view.rs` builds its custom overlay in the selected target's
layer. Damage reads the same cumulative accessor as #8. Actual loot, elite and
XP producers are detailed in [terminal progression](terminal-progression-0.105.0.md).

The root `140276330` consumes terminal data. Action input `140275bc0..1402762d2`
maps the three action values through table `145dc19b8` to commands 6/8/9:
Again, Endless and Menu. These terminal buttons do not attach the optional
Confirm component. Again uses the existing entry path with a fresh run/world;
Menu persists selection and returns through the custom picker. Both exit actions
flush final addon messages while the client VM is alive, before ending the client.
Menu then delivers the native logout-complete event through the ordinary inbound
handler and retains its client CharSelect destination; Again keeps its distinct
restart path. The [return-mode recovery](terminal-return-0.105.0.md) binds the
label to the process frontend mode, not the roster GUID. Main Menu is correct
for the default custom frontend. The [optional stock GlueXML frontend](stock-frontend-0.105.0.md)
now connects startup, twelve local realms, saved-roster operations and addressed
run entry. Its terminal label is Character Select; Again retains the active
client/VM and the same saved GUID without changing the custom Pick.

The [custom pause implementation](run-hud-0.105.0.md) supplies End Run's actual
confirmation: first press arms, repeats before .35 seconds are ignored without
extending the window, [.35,3) confirms, and three seconds expires/rearms. Its
42 stored native confirmation vectors are reused, not rerun in this scope.
Confirmed active End Run calls abandonment and leaves the world available for
the summary; it no longer immediately tears down the client. Terminal phases
retire visible choice controls and block mutation of frozen results.

Summary mouse blocking is published in `LocalClientSet::OverlayCapture` before
FrameXML mouse input, then retained through world input routing. Endless resets
the summary/pause owner, resumes the same run and preserves pending earned
choices; controller pause still follows `session.playing()` and world readiness.
The localized Endless title/body is delivered through `SessionEvent::Chat`,
chat type0x5a, language0, zero GUIDs/tag and inline sender title, reaching the
existing client/FrameXML raid-boss-emote consumer. This exact packet producer
is `1458a9500`, not the custom toast notification path.

## Summary hierarchy

- Update/root owner `140276330..14027786f`; content owner `1401af460..1401b167a`.
- Fullscreen absolute 100%×100% blocking overlay; black alpha0.55; GlobalZIndex6500.
- Design Canvas560×700, max_scale1.3, align_itemsCenter/justify_contentCenter.
- Content frame auto dimensions, column, center children, row_gap10; padding left/right30 and top/bottom22. Caller prepares border2 but common frame helper `140012c60..1400131ac` overwrites border1 and radius10. Current style literals match existing `menu::native_panel_style` gradient/border/shadow.
- Heading46, heading font, victory `(1,.604,.165)`, defeat/left `(.88,.23,.17)`. Keys `end.victory`, `end.fallen`, `end.left`.
- Description ordinary15, PAPER: `{hero}, {race} {class} · {zone}`.
- Optional `end.zone_unlocked` text ordinary16, green `(.302,1,.416)`; substitute `{zone}`.
- Optional talent XP block, then optional loot block, then statistics grid.
- Stats: Grid2auto columns, column_gap24,row_gap4,margin_top10,bottom10. Label15MUTED, value15GOLD. Order/format: `end.survived` m:ss; `end.level` integer; `hud.kills` integer; `end.elites` integer; `end.guardians` integer; `end.bosses` integer; `end.damage_dealt` rounded/grouped damage; `end.damage_taken` same; `end.gold_earned` integer; `end.caches_opened` integer.
- Time is nonnegative, truncated/saturatingu64, minutes unbounded and seconds two digits. Helper `140274600..140274983` rounds f64 before saturatingu64 conversion, then inserts comma groups of three. Integer counter rows are plain decimal, no grouping.
- Actions are horizontal Row, gap12. `end.again` text is “Again” in selected-target English. `end.endless` appears only for victory. Last label is `menu.main_menu` when return flag true, otherwise `menu.character_select`.
- Every action uses paddingLR22/TB10, border1,radius4, ordinary17GOLD, common native red gradient and gold border (`140012180..140012325`), blackalpha.85 shadow offset0,2 spread0 blur6. Parent owns action event mapping and lifecycle evidence.

## Talent XP

Outer parser/constructor `14016a130..14016a81f`, content `1401ffa40..140201788`, updater `140173d50..140175690`.

- JSON gained `xp` clamps[0,u32MAX]. Previous XP defaults to max(total-gained,0); explicit `before` overrides after clamp. Current source model preserves those fields.
- Parts iterator `14014b560` reads `name`/`xp`, clamps each to[0,u32MAX], then removes zero. Therefore negative and zero backend part deltas do not become visual rows. Part order otherwise preserved. Seven producer fields are covered by totals owner.
- Outer width420, autoheight,column,paddingLR14/TB10, **zero external margin**, border1,radius6,row_gap5. Cyan `(.443,.835,1)` border alpha.45; background `(.03,.08,.14,.75)`.
- Header Row center/SpaceBetween: ordinary15cyan localized literal “Talent experience”; heading26ice `(.8,.95,1)` counter starts `+0`.
- Parts Grid firstcolumnFlex1/secondAuto,row_gap2; ordinary13MUTED labels and13cyan `+amount` values. Both columns begin alpha0 and slide horizontally from +12px.
- Bar height14,margin_top4,border1,radius3,clip,center content. Bordercyan alpha.35; backgroundblackalpha.6. Fill uses top/bottom native raw linear gradient(.45,.8,1)→(.13,.42,.75), anglePI. White flash overlay begins alpha0. Text ordinary10PAPER: `into / next`, or localized literal “Every talent point earned” at cap.
- Footer Row center/SpaceBetween: ordinary13MUTED localized `{class} talent points: {points} / {max}` with max51; pop ordinary14GOLD.
- Budget verified in selected target: subtract successive costs80+15*earned through cap51. Native display wrapper returns (51,into0,next0) at cap. Reusing shared source budget needs this cap override.
- Row reveal: `p=clamp((age-.35-index*.22)*4,0,1)`; alpha=p; X translation12*(1-p)^3.
- Count delay `.35 + positive_parts*.22 + .2`; duration `min(.9 + .45*(points_after-points_before),3.2)`; cubic easeout; counter `roundf(gained*ease)` (IAT145d6a3a0 is CRTroundf), XP=before+counter.
- When point budget increases, remember pop time. Pop text cumulative delta from initial points: “+1 talent point!” or `+{n} talent points!`. Pop alpha=min(age/.12,1); scale1+.6*(1-clamp(age/.35))^3. Flash alpha=.6*max(1-age/.45,0). Fill shows100% for first.15sec after increase when newinto*4<newcost, otherwise currentinto/currentcost; cap always100%.

## Loot

Outer `140274110..1402745f7`, item loop `1401b7bb0..1401b862b`.

- Heading ordinary13MUTED `end.loot_new` with `{n}` count of boolean true `new` flags. Same array used for rendering.
- **No UI deduplication:** outer counts flags then loop visits every record in order. Native backend may produce duplicate equipment records; all must remain displayed. Totals owner covers producer newflag semantics.
- Wrapping list is auto width with **max_width500**, row_gap6,column_gap10,justifyCenter.
- Item Row center,column_gap6. Always spawns26×26 icon frame, border1,radius4,rarity border even when icon string empty. Current source preserves emptyframe if imagehandle absent. Name ordinary14rarity color. `new` true adds ordinary11green `  {end.new}`.
- Rarity colors from current arrays145dbd098/0ac/0c0, indexedrarity-1:1(.118,1,0),2(.231,.612,1),3|5(.761,.486,1),4(1,.604,.165),else(.91,.91,.91).

## Adaptive fit, checks and remaining limits

The selected-target summary constructs Canvas560×700 with max_scale1.3. Fresh
recovery of common fit `14005a2f0` and target-scale propagation `14005afe0`
corroborates the existing `canvas.rs` primary-window path: fit is
`min(logical_width/design_width, logical_height/design_height, max_scale)`,
clamped to at least .1; offsets center the design at `(logical/fit-design)/2`.
Camera target scale and global UiScale multiply the fit for UI target propagation.
This revalidates those formulas, not rendered clipping/text/DPI parity.

The [recorded terminal-layout replay](../SCRIPTS.md#historical-execution-sources) passed **13 bounded native
initializer vectors**. It checks recovered dimensions, gaps, padding, border,
radius and layout enums with declared memcpy seams and fails closed outside
reviewed execution spans. The [terminal progression check](terminal-progression-0.105.0.md#checks)
also passed 1,697 bounded native cases. Rustfmt parsed changed Rust source and
`git diff --check` passed. Rust regressions were added but not run. No builds,
compiling tests, game launches, screenshots or original/rebuilt interaction ran.

The [shared player-mover implementation](player-mover-0.105.0.md) connects
Game+548's wrapping sequence to speed, report-driven teleport, victory root and
Endless unroot. It retains the separate actor sequence, the native speed
deadband, ordinary packet ordering and unroot-before-notice delivery. Paused
terminal screens consume movement edges through the ordinary client helpers;
the source controller pause remains separate from its rooted state. The
[side-effect contract](evidence/0.105.0/terminal/continuation-effects-contracts.json)
records those owners. The optional tick relocation writer is a disabled-by-default
sink-test path, not another ordinary gameplay trigger. The current compiled
EXE's chat consumer was not newly recovered; existing protocol/FrameXML source
is the consumer used by this port. Live packet/ack behavior remains unverified.

The [selected-target button contracts](evidence/0.105.0/terminal/button-contracts.json)
bind the common default style and terminal spawn bundle. Border, two raw linear
gradient stops and shadow match the existing source. The native tuple contains
Interaction but neither the picker Hover component nor a Bevy Button marker;
this constructor evidence does not rule out an external Interaction-based visual
updater. The [current picker hover query](evidence/0.105.0/terminal/hover/manifest.json)
requires the constructor-specific Hover component; terminal actions cannot match
it. The current terminal action query also contains no border/gradient/shadow
writer. This bounds the known paths without proving the absence of every global
or indirect painter, so no speculative interpolation, active color or shadow was
added. The static constructor checker
passes its target/range/type/call/default checks.

The [visual-query owner manifest](evidence/0.105.0/terminal/hover/visual-query-owners.json)
now classifies the other two direct `Interaction`/`BorderColor` query candidates.
The current executable has **43 instruction-verified direct callers** of the
selected `Interaction` component getter; three also call the selected border
getter. Besides the existing picker `Hover` query, they are:

| Query | Live native body | Additional state and behavior |
| --- | --- | --- |
| `1403926d0` | `14027b430`, through `1402874b0`/`140287add` | Required four-byte state; a singleton control with admission, smoothed hover, border, two shadows and transform animation. Its picker Enter identity is inferred from these gates, not recovered as an original source name. |
| `140392db0` | `1401342b0`, through `14013dcf0`/`14013e370` | Required 56-byte state; per-card birth/exit/hover animation, shadows, borders and transforms. |

Fresh Ghidra pseudocode is retained once per body, bound to its exact original
PE range/hash. The query assemblies, runner call sites and registered state
sizes corroborate the mapping. Neither path establishes a generic painter for
the terminal constructor. Its existing default border/gradient/shadow remain
the supported source behavior; no active colors, interpolation or lift are
invented. Terminal source now inserts `Interaction::None` directly, matching
the native tuple, and omits the unsupported Bevy `Button` marker. The ordinary
Interaction query continues to own terminal presses. The port's gamepad-focus
and custom-touch press filters explicitly admit the typed TerminalAction
alongside their existing Button controls, with Interaction required for both.
They therefore retain the terminal action route without admitting unrelated
Interaction-only overlay roots or tooltip hosts. This is source adapter
integration, not a newly recovered native focus-query contract.

`python3 -B scripts/check-terminal-hover.py` checks the newest full EXE
identity, the 43 direct callers at decoded instruction boundaries, all three
query mappings, two Ghidra body identities, retained text hashes and state sizes.
`--prepare-rea` reproduces project-local raw-function plans for the two new
bodies; run them with `scripts/rea-batch.py` and the project REA wrapper.
Fresh selected-target Ghidra recovery also reviews `EndAction` component
registration `1402a6930..1402a6d86`. Its sole decoded direct getter caller is the
terminal query `140397ce0`, at `140397d16`; the registration body binds the
one-byte component descriptor and transfers existing registry data. Whole-file
absolute-pointer scans find no stored 64-bit pointer to that getter or the
selected Interaction getter. The same checker rehashes this body/TypeId and
checks the retained reference facts. Absolute-pointer absence excludes neither
relative/computed addresses nor externally installed dynamic hooks. Fresh
constructor-side registration recovery is recorded below; later computed or
dynamic registry mutation remains unclassified.

The [component-insertion contracts](evidence/0.105.0/terminal/hover/component-insertion.json)
now follow the terminal queued command `140226080` through apply `140049960`,
bundle registration `140337440` and component registration `14028e740`.
EndAction and Interaction both begin with empty direct/inherited required-component
collections. The shared component-info initializer `144e2d8f0` copies the
88-byte descriptor and initializes all five lifecycle-hook slots at offsets
`108/110/118/120/128` to zero. Generic dependency propagation `144e2db80`
visits an existing inherited dependency list; the empty list constructed here
has no insertions to propagate. Thus these constructors supply neither an
implicit picker Hover nor a terminal visual painter.

A full-PE decoded RIP-relative census also found 50 references to the exact
EndAction/Interaction TypeId copies. EndAction's references are the two
registration bodies and debug adapters. Interaction additionally has engine
registration/required-component aliases and reflected enum/type-registration
accessors; the earlier 43-direct-caller census did not classify those aliases.
Fresh Ghidra recovery of the engine component getter and required-component
builder corroborates their metadata ownership. This discovery expands the
known registry boundary without proving every computed reference or a complete
global system schedule.

`python3 -B scripts/check-terminal-component-hooks.py --python-libs runtime/armory-recovery/python-libs`
passed **24 bounded native initializer vectors** over poisoned scratch memory,
different component IDs and descriptor bytes. The checker executes only three
reviewed linear initializer spans, rejects instructions outside them and all
native control transfers, checks the retained range hashes and insertion calls,
and verifies the live source uses Interaction directly without Button/Hover
while retaining the narrow gamepad/touch action filter.
No target application, native callees, build or compiling test executes.

This bounded recovery completes classification of those direct candidates.
It also resolves the new-registration hook/default-dependency and terminal
bundle ownership described above. It **does not resolve every indirect/global
painter or later dynamic component-hook mutation**; that precise source/recovery
limit remains under #9/#41. Full hover behavior, compilation,
resize/DPI/touch interaction, multilingual wrapping
and original/rebuilt visual/gameplay parity remain open under permanent #9.

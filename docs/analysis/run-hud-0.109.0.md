# Custom run HUD — 0.109.0

The installed target is SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`,
140,447,744 bytes. This report owns the selected current constructor, display,
setting, movement/persistence and pause contracts under **#7**.
[verification-needed](../verification-needed.md) owns the current gap status. The
[0.105.0 report](run-hud-0.105.0.md) and its behavioral fixtures remain historical;
they are not current results.

An active tally/build drag used to be discarded immediately when the session
left the run. Its final position could therefore remain absent from `hud.txt`.
The current native drag updater has no ScreenState/run admission dependency:
it retains its drag and saves both optional positions when the held input is
released. [The live input adapter](../../crates/azeroth-survivors-re/src/gameplay/run_hud/controls.rs)
now completes that retained drag before checking whether another HUD press can
start. It preserves the native pointer arithmetic and saves on release even if
logout has already removed the HUD. No new settings or file format are added.

## Current recovery and source connections

The [manifest](evidence/0.109.0/run-hud/manifest.json) binds 34 selected owners
and their complete declared extents or bounded stackless leaf extents. Fresh
[REA/Ghidra records](evidence/0.109.0/run-hud/rea-records.json) identify 24 freshly
queried current helpers, their raw-input-to-PE byte mappings and provider/profile
digests. The existing current [ready-label manifest](evidence/0.109.0/hud-ready/manifest.json)
retains the main updater, constructor, boss/build rows and visibility-reader
Ghidra identities. Whole owner hashes identify recovery boundaries; they do not
certify every external callee, global reference or indirect target.

| Source path | Current native contract and connection |
| --- | --- |
| Clock/countdown | Updater `14028e670` reads clock, next boss, endless, kills, gold and chest cost from its supplied state. Whole elapsed seconds use saturating conversion and minimum two-digit minutes/seconds. The existing live `Mechanics::hud_next_boss` supplies positive scheduler time; absent next-boss data uses the native endless/empty branch. |
| Boss rows | Constructor `140209d00` calls `14020b1f0` for each supplied row. Current data confirms 520px for one bar, 420px for several; first/later font sizes 17/15 and heights 14/11. Updater `1402900d0..1402900f8` widens vitals, floors the denominator at 1, clamps the percentage in doubles and narrows its result. The live source consumes living primary bosses followed by living awake guardians. |
| Tally/build | Constructor `14020ccd0` owns clock, tally, movable build and stored-level/ready components. `14020a060` constructs the two icon vectors. Live source supplies learned ability icons, rings/trinkets and worn amulet, with the retained MPQ question-mark fallback. Boss/icon changes rebuild child rows while retaining movable roots. |
| Visibility | `14007d0b0` registers `hudClock`, `hudBosses`, `hudTally`, `hudBuild`, `hudBanners`, `hudLoot`, `hudMeter`, `hudLevels`, `hudFlag` with default `1`, once per local registration guard. It reads all nine on subsequent updates, trims strings, hides only exact `0`, and updates its nine-byte resource only when values change. `14028dfd0` projects the first four flags to clock/next-boss/boss/tally/build visibility. Banner and loot visibility additionally use the loading-cover flag. Live consumers are `view.rs`, `notifications.rs`, `loot.rs`, `meter.rs`, `stored_hud.rs` and the world-flag publication in `gameplay/mod.rs`. |
| Scale | `1401903b0` registers/reads `hudScale`; invalid or non-finite parsed values become 1 and finite values clamp to 0.5–2. The client registry and options mirror feed the live `HudSettings`, `UiScale` and meter consumer. Registration has a local guard; value reading remains per update. |
| Positions/persistence | Loader `1402836b0` admits exact three-field rows for `tally`/`build`, valid finite `f32` coordinates and last valid duplicates. Drag updater `140286ca0` retains input and initial coordinates, updates `initial + pointer - press_pointer`, and writes both optional positions after release. Activation `140289f40` uses the current valid window cursor or first pressed touch. Placement `1402892c0` clamps displayed coordinates while preserving saved coordinates, divides offsets by scale and follows the real rendered Minimap boundary when its width exceeds one pixel. Read/write/base helpers `1458f01c0`, `1458eef30`, `1458ef170` preserve the existing save-directory/environment and `hud.txt` route. |
| Custom pause | Actions `14028b370`, panel `14028bce0` and child builder `1402082f0` retain Resume/Options/End Run/Quit and immediate character-selection/logout cases. Only End Run has confirmation: a repeat at least `0.35f` and below `3f` after the original press accepts; an early repeat leaves the first deadline intact; expiry rearms it. The initial stock-frame Escape handoff is superseded by the [0.112.5 repair](escape-game-menu-2026-10-23.md); talent and Options ownership remain separate. Shared button/panel styling is covered separately by [current overlay style](overlay-style-0.109.0.md). |
| Class icon | Constructor calls `14588d790` then `140063ba0`. Both are stackless leaves omitted from PE unwind records; current branch/return boundaries and actual tables are recovered separately. Their connected original instructions match `stored_hud::class_rect` for **every u8 class ID**, including unknown-ID fallbacks. |
| Stored levels | Current updater `14028c9f0` requires a positive integer `storedLevels`, enabled `hudLevels`, absent choice/reward payloads and no pause. It writes native Display Flex/None, then updates displayed hover/pulse, border, two shadows, lift/scale, count and localized `LEVEL {n}` text. `14028c740` accepts the first changed Pressed row and sends command `0x16`; the live `OpenStoredLevels` consumer calls the existing mechanics admission and publishes `spendLevels=1` only when spending opened. |
| Core FrameXML | Current native path/format/write owner `1459a7290..1459a751d` reads `Interface\FrameXML\WorldStateFrame.lua` and the current patch descriptor. The exact 10,204-byte patch at `147232588` is byte-for-byte the canonical [0.108.0 Lua](evidence/0.108.0/hud-framexml/world-state-patch.lua); its selected HUD interval remains 8,191 bytes. The live core loader supplies it before layers/addons for direct TOC and nested Script reads, on every fresh VM/ReloadUI. Locale updates do not reinstall it. Current pointer/length identity and source routes are checked independently of the historical report. |

The [class-provider proof](hud-class-provider-0.109.0.md) positively identifies
the stored icon's frontend Pick resource through its TypeID, initializer and
sixth Win64 parameter; 256 separate forwarding cases pass. This preserves
`menu.class_id()`. Equipment names/icons instead use the actual Game race.
`scripts/check-loot-race.py` adds 512 separate native race/faction-ID cases
and checks both HUD and terminal consumers. These totals are separate from the
original 843 HUD cases; neither suite executes Rust or rendered UI.

The [0.112.5 Escape repair](escape-game-menu-2026-10-23.md) supersedes the initial
FrameXML-visible-menu handoff described above. Its selected producer owns Escape
before Lua input; the historical action/confirmation and panel contracts here
retain their actual target. These historical source guards do not validate that
new input route.

The separate [ready-label report](hud-ready-0.109.0.md) owns its already connected
application-time alpha pulse and its 36 bounded arithmetic cases. It is not
duplicated here. The selected custom overlay remains separate from the underlying
real FrameXML action bars/unit frames and the production Vanilla player controls.

The retained-drag repair also checks native scheduling, rather than inferring
admission from the callee alone. `1402836b0` constructs system vtable
`145df1890` at `140284947`; slot `+72` selects `14029a5b0`, which directly calls
the drag updater at `14029a7d9`. It is the middle child of a three-system group.
Current `144e1fc30` initializes each child's condition vector empty; the group
also has an empty collective-condition vector. `14013d450` adds ordering
dependencies and does not alter those condition fields. Registration
`140284ba8` passes the group through `1400b4130`; its lookup `1400e5c90` uses
schedule vtable `145dd2538`, whose debug leaf `1400a6f50` names `Update`.
This complete selected registration route has no ScreenState/run condition.
The checker retains the vtables, label, runner and constructor/registration
instructions, and tests empty condition fields with three different initial
memory fills. It does not execute Bevy's scheduler or certify unrelated global
schedule ownership.

The stored-level updater and input have their own complete selected admission
route. `1402836b0` constructs vtables `145df1e78`/`145df1dd0` at
`1402842ae`/`1402842f7`. Their `+72` runners are `1402990e0`/`140296690`,
which directly call the updater/input at `14029933d`/`14029676e`. The updater is
child nine and input child ten of an eleven-system Update group; each uses the
same empty-condition constructor. The group copies child nine at
`14028466c..1402846ce` and initializes its collective condition vector to
`[0,8,0]` at `140284791..1402847a8`. Stackless leaf `144e9bf10..144e9bf2d`
initializes only the following 32-byte chaining metadata; its two returns and
following INT3 padding establish the bounded leaf. Ordering goes through
`14013d450`, then registration `140284889` uses the same recovered Update
lookup. Neither this selected route nor the runners introduce another run or
pause condition; display admission remains in the updater itself.

The current stored-button animation retains the historical 14-per-second hover
blend, application-time `sin(elapsed*2.6)*0.5+0.5`, `max(hover,pulse*0.35)` border
blend, shadow alpha `0.2+pulse*0.25+hover*0.3`, blur `20+hover*8`, vertical lift
`hover*-3` and scale `1+hover*0.03`. Native `144c84ca0` preserves the selected
Srgba tag and interpolates as `a*(1-t)+b*t`, using its real switch table and
the [shared selected color-conversion path](overlay-style-0.109.0.md). The live
border had used `a+(b-a)*t`; its weighted sums now preserve the native `f32`
operation order. The old expression differs in 58 of the 144 bounded animation
color projections. This is an arithmetic correspondence check, not an observed
rendering difference. The shared color instructions are referenced once from
their owning style manifest rather than copied into this scope.

## Static checks and limits

[The current recovery/checker](../../scripts/recover-run-hud.py) verifies
the installed target, owner/extents, compact original instruction ranges, current
FrameXML bytes/descriptor, REA input mappings and the live source consumers.
Its **843 original-instruction cases** cover:

- 30 scale parse-result/clamp boundaries and eight visibility comparisons;
- six drag arithmetic cases, release-state transition and 18 confirmation cases;
- 80 main visibility projections and 24 banner/loot/loading projections;
- eight widened health ratios and the connected 256-case class/atlas path.
- nine system/group empty-condition construction cases across three memory fills;
- 256 stored-level admission/display combinations and 144 hover, supplied-sine,
  connected native Srgba interpolation, shadow and transform cases;
- three bounded chaining-metadata construction cases, checking adjacent bytes
  remain unchanged.

The durable [vector fixture](evidence/0.109.0/run-hud/vectors.json) keeps selected
boundary representatives, all category counts and the SHA-256 of the canonical
full result. It includes examples where the old border expression rounds
differently. The checker still executes and asserts all 843 cases, then verifies
the total/category counts, full-result digest and every retained representative.
It writes the full regenerable vectors only to `vectors-full.json` under the
ignored `--work` directory.

These execute the selected unchanged Win64 instructions using Unicorn. Parsed
CVar values, trimmed strings, ECS membership and scalar inputs are explicit
seams; this does not run the registry, Bevy scheduler, allocator, layout, text
shaper, renderer, filesystem or Windows sine implementation. REA raw imports
omit full-PE/global/indirect relationships, and generic Ghidra `gcc` parameter
typing is not Win64 ABI proof. Full-image ownership remains **#41**. Existing
mechanics/catalog/native packet producers keep their separately documented
recovery limits; their source correspondence is not a complete native-body
certificate.

```sh
python3 -B scripts/recover-run-hud.py --check --verify
lua scripts/check-framexml-hud.lua
```

The first command needs an existing Capstone/Unicorn Python environment; it never
installs dependencies. The Lua check retains its canonical historical fixture
name and passes 166 interpreted widget cases against the byte-identical patch;
its widget/font host remains a stub. `--prepare --work runtime/hud-current-replay`
stages focused REA plans for a fresh reproduction. Run each generated plan with
`scripts/rea-batch.py`, then use `--collect --verify` with that work directory to
stage new evidence for review.

Rust source was syntax-parsed without compilation. Builds, `cargo check`,
compiling tests, applications, game input/resize/persistence, actual fonts/MPQs,
platform validation and original/rebuilt visual/gameplay comparison were
intentionally not run. The native-bound source repair and expanded static
recovery do not establish full native completeness or gameplay/rendered parity.

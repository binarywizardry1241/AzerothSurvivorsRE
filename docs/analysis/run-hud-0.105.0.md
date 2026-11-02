# Custom run HUD — selected 0.105.0

The supplied target is SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns gaps **#7/#33** and the current integrated
status. This report distinguishes native contracts, connected source and
unverified execution; no build or rendered parity result is established here.
The [0.109.0 report](run-hud-0.109.0.md) owns the expanded current-target
revalidation and the retained-drag persistence repair.

The separate [0.108.0 FrameXML HUD report](framexml-hud-0.108.0.md) owns the
new sliced main bar, persistent XP text and player-name fitting. It does not
promote this historical custom-overlay evidence to the current EXE.

## Display and live inputs

The [run HUD plugin](../../crates/azeroth-survivors-re/src/gameplay/run_hud/mod.rs)
is installed by `GameplayPlugin`. Its
[view](../../crates/azeroth-survivors-re/src/gameplay/run_hud/view.rs) reads the
actual mechanics after the run tick. It presents the following recovered data:

- A 32px clock and 14px next-boss line, with the native minimum-two-digit
  minutes/seconds format. The selected serializer subtracts the run clock from
  the scheduler's next deadline and emits only positive remaining time; no
  ceiling or inference from the surviving boss list is used.
- Living primary bosses followed by living, awake guardians in their native
  collection order. A single bar is 520px wide; multiple bars are 420px wide.
  The first name/bar uses 17px/14px, and later names/bars use 15px/11px.
  Health ratios use the native widened arithmetic, denominator
  floor and clamp, with the retained gradient/color-space contract.
- The native kills/gold tally, including the current cache cost, and two 28px
  icon rows: learned abilities, then rings, trinkets and the worn amulet. The
  build helper supplies icons rather than replacement action bars, tooltips or
  fabricated rank/cooldown labels. Empty icon strings use the recovered question
  mark texture through the normal user-supplied MPQ asset path.

Clock, tally and health updates retain their entities. Boss/icon collection
changes rebuild their child rows while preserving movable roots. FrameXML,
unit frames, action bars and the production player controller retain ownership
of the underlying interface and world input.

## Settings, placement and pause

The real client registry carries `hudScale` and all nine native visibility
settings. The embedding bootstrap receives the same registered keys.
Scale rejects invalid/non-finite values to 1, and clamps finite values to
0.5–2. The [native registration](evidence/0.105.0/run-hud/scale-schedule-manifest.json)
runs every Update without a run condition; its local boolean controls only
first registration. The visibility reader trims text and hides only exact `0`. The native
projection writes `Visibility::Inherited/Hidden` to both clock labels and the
boss/tally/build roots, preserving layout space and independent part settings.
Banners use their own flag and the actual engine loading-cover signal; pause
and choice states do not independently suppress them.

Only tally/build are movable. The
[layout parser](../../crates/azeroth-survivors-re/src/gameplay/run_hud/layout.rs)
reads `hud.txt` from `save::native_base_directory()` once during plugin
initialization, accepts exact
three-field finite-coordinate rows and preserves the last valid duplicate.
Pointer input prefers the window cursor, then reads the first currently pressed
Bevy `Touches` map entry directly. A drag remains active while the left mouse
button or any touch is pressed; no touch-ID ordering, normalization or scale
conversion is added. Drag release writes the two retained optional positions
directly, as the native writer does. Display clamping never rewrites saved coordinates. Default offsets
are divided by HUD scale; a saved position overrides the default anchor.
The default tally follows the actual rendered Minimap widget's left edge when
its width exceeds one logical pixel, with the native 200px fallback margin.
The client bridge exposes that renderer rectangle directly, so addon moves and
hidden widgets follow the existing FrameXML/renderer path rather than a guessed
named-frame rectangle.

The initial pause adapter handed a stock game-menu opening to the custom screen
and suppressed that frame before paint. This input assumption was superseded by
the [0.112.5 Escape repair](escape-game-menu-2026-10-23.md): the actual native
producer takes owned Escape before Lua bindings and publishes its own request.
The recovered panel uses Z6400, a 420px canvas, native title/button styling and
Resume/Options/End Run/Quit actions. Only End Run uses the float32 confirmation
window: an accepted repeat is at least 0.35 seconds and below 3 seconds after
arming. Ending a live run enters the existing account/terminal lifetime; the
summary/retry flow is owned by **#9**. The adapter also retains other custom
screens' pause state instead of overwriting it with the stock frame's visibility.

## Equipment loot and the world flag

The [loot consumer](../../crates/azeroth-survivors-re/src/gameplay/run_hud/loot.rs)
reads notices from the live equipment drain. Current pickup owner `145896520`,
window `1458971b7..145897a72`, compares ownership before insertion and publishes
every notice. A valid character inserts a new ID; the `ffffff` Tester sentinel
only compares ownership. Repeated valid drops become already-collected after the
first insertion; sentinel drops do not gain ownership from the notice.

Native loot owners `140279050` and `1401b2970` supply the connected card layout:
right24px/top38%, Z6100, eight-pixel row gaps, minimum280px cards,40px icons,
rarity colors and11/17/12px header/name/collection text. The header and collection
labels use the existing localization owner; equipment/icon data use the actual
armory and MPQ asset routes. Notices last seven seconds. The first5% slides60px
from the right, and the final15% fades only the card background's0.92 alpha.

`ScreenState+80` receives the exact `choices` JSON; `+ea` receives
`paused`/`unpaused`. The native lifetime consumer shifts stored birth times by
frame delta, capped at now, while choosing, paused or covered by loading.
Victory/defeat clear choices and pause, so terminal visibility alone keeps expiry
running. The count/revision rebuild key intentionally excludes birth timestamps:
an existing rendered card retains its animation birth until a list rebuild.
`hudLoot` changes visibility independently of lifetime.

The [world flag consumer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/addon_lists.rs)
uses the same authoritative lair choice as the addon projection, then publishes
ordinary `GossipPoi` through the real offline client. Current command23 writes
the world flag resource independently of `AZSLAIRS`. Accepted active run ticks
keep selecting while hidden, including accepted zero-delta ticks. Hiding a
visible flag sends one empty-name marker at player XY. Showing it uses the
selected home XY, flags99/icon6/data0, the localized enemy name and fixed English
suffix ` (Guardian)` when held or `'s lair (empty)` otherwise. An unchanged
selected index and visible flag retain their packet until age exceeds300 seconds;
a guardian spawn invalidates the cached selection and forces the next packet.

## Evidence and checks

[Layout manifest](evidence/0.105.0/run-hud/layout-manifest.json) and
[control manifest](evidence/0.105.0/run-hud/controls-manifest.json) retain exact
target ranges, literals, REA/Ghidra identities and analysis limits. Shared
constructor extracts have one canonical owner. Reproduction uses:

```sh
python3 scripts/recover-run-hud-layout.py --check --verify
python3 scripts/recover-run-hud-controls.py --check
python3 scripts/recover-run-hud-scale-schedule.py --check
python3 -B scripts/recover-hud-consumers.py --check
```

The native controls cover 149 bounded cases: scale, visibility-text parsing,
drag arithmetic, pressed-touch fallback, saved/default placement and confirmation timing. Layout
instruction fixtures cover the constructor, first/later boss rows, build rows,
28px icons, eight time boundaries and 104 main/banner/loot visibility cases. UI submission, allocation, supplied JSON
and external engine calls remain explicit seams; these checks do not run Bevy's
layout/shaping/GPU pipeline. Authored Rust regressions have not been run.

The [loot/flag manifest](evidence/0.105.0/hud-consumers/manifest.json) retains the
current producer/state/consumer/packet extracts and references the canonical
addon flag selector rather than duplicating it. Its bounded original-instruction
checks add four Node snapshots,24 lifetime cases across scalar/SIMD list lengths,
five exact expiry boundaries, eight animation cases and24 flag retention cases.
Current source routes are checked and Rust was syntax-parsed. Full JSON
dispatch, dictionary lookup and the client renderer are outside those replays.

## Remaining limits

The source adapter's FrameXML handoff is an integration route, not a native
runtime observation. Existing ability/item/schedule catalogs retain their
separate provenance. Compilation, input/resize/pause interaction, text wrapping
and original/rebuilt visual parity remain unverified.

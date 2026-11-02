# 0.91.4 main-menu evidence

> Historical analysis of **0.91.4**, preserved as `AzerothSurvivors/AzerothSurvivors-0.91.4.exe` (SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`). The current target is **0.97.2**; this report remains bound to 0.91.4 and has not been revalidated against the new target. See [current target provenance](target-refresh-0.97.2.json) and the [historical 0.92 refresh](target-refresh-0.92.json).

The first reconstruction milestone is the selected executable's **custom hero
picker**, the default out-of-run menu surface. It is separate from the in-run
HUD and from the optional original-client character screens. This report uses
only static EXE evidence; no game was run and no MPQ content was opened.

Target SHA-256:
`719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`.
The picker build/version string includes `0.91.4` at VA `0x1458cc008`.

## Default startup surface

Startup function `0x140001250` reads the exact environment name
`WOW_ROGUE_GLUE` at `0x14000175f`, with length `14`. The flag becomes true only
for a one-byte value equal to ASCII `1` (`0x140001788`–`0x14000179c`).

Mode helper `0x140010a90` handles explicit hero/zone quick-start selections first.
With those absent, its tail selects the custom-picker variant when that flag is
false, and the client-screen variant when true. The caller's corresponding log
strings are `benilla-rogue: the hero picker` and
`benilla-rogue: the client's own screens`. Exact disassembly, string addresses,
commands and hashes are in [the menu assembly manifest](evidence/menu-assembly-manifest.json).

This establishes the default **mode**, not the exact first visible frame. Update,
missing-data and language overlays exist in the executable; their complete
first-run gating/order is not recovered yet.

## Menu content and panel destinations

The embedded English catalog contains these exact picker labels and contracts:

| Area | Exact labels / display contract |
| --- | --- |
| Utility actions | `Menu`, `Options`, `Language`, `Download game` |
| Hero | `Name your hero`, `Class`, `Random` |
| Factions/races | `ALLIANCE`, `HORDE`, `Male`, `Female`; racial tooltip note `Racial, casts on its own` |
| Class summary | `HEALTH`, `STARTS WITH`, `ZONES OPEN`, `SPELL POOL`, `Starting spell` |
| Equipment | `Equipment`, `COLLECTION`, `Armory`; subtitle `Race, look, gear and drop tables` |
| Talents | `Talents`, `{n} points to spend`, `{n} of {max} points` |
| Destination | `Zone`, `Enter {zone}`, `Entering {zone}...` |
| Zone lock | `Locked · defeat {boss} in {zone}` |
| Run setup | `Run Options`, `Normal difficulty`, `Rewards {reward}` |
| Destination summary | `{subtitle} — {boss} awaits at {minute}:00` |

The armory names six tabs: `Character`, `Collection`, `Drop Tables`, `Codex`,
`Achievements`, `Rewards`. The menu catalog also defines `New hero`,
`Character select`, `Resume`, `Back`, `Quit game`, `Fullscreen`, and `Windowed`.
These establish available labels and destinations; they do not establish that
every action is visible simultaneously or its exact position. `Resume` and
`Paused` may belong to in-run menu states and must not be added to the initial
picker merely because their strings exist.

Nine classes are explicit in the EXE table: Warrior, Paladin, Hunter, Rogue,
Priest, Shaman, Mage, Warlock, Druid. Eight race names are explicit in the English
catalog: Human, Orc, Dwarf, Night Elf, Undead, Tauren, Gnome, Troll. Race/class
compatibility, initial selections, saved-hero ordering and first-run defaults
still need native action/state analysis. The base-client restrictions must not
be assumed automatically.

[The selected labels JSON](evidence/main-menu-labels.json) preserves 71 exact
catalog values and its source-file hash. [The complete catalog](evidence/embedded-english.json)
has the remaining class/race descriptions and options strings.

## Native implementation and UI-source limits

Surviving source paths and type names identify the picker as compiled Rust/Bevy
UI, with `wenilla_rogue_app::screens::picker::{PickerCanvas,PickerRoot,Action,
NameField,NameText,SpellInfo,SpellTipBox,Hover}` and armory `PickerPortrait`/
`RaceTip` types. Native `benilla_app::hero_preview::HeroPreviewPlugin` is also
named in the executable. These are implementation leads, not a recovered visual
layout or a complete source tree.

| Native range | Source-location lead |
| --- | --- |
| `0x1400bae80`–`0x1400bc597` | `screens/picker.rs` lines 303,312,327,421,482,494 |
| `0x1400bfd90`–`0x1400c0c75` | `screens/picker.rs` lines 1908,1941 |
| `0x1402ab160` | `screens/picker.rs:1412` |
| `0x1402ad140` | `screens/picker.rs:1100` |
| `0x140085440`–`0x140085c4a` | `screens/mod.rs` lines 336–353 |
| `0x14007dbb0`–`0x14007f444` | `screens/mod.rs:86` |

No complete picker Lua/XML source was recovered from the executable in this
pass. The previously extracted `official-addon-api.lua` is the run-data API
template, not menu UI source. Stock FrameXML/GlueXML and the custom picker are
different surfaces. Pixel placement, dimensions, fonts, colors, art, animation,
and exact panel transition rules remain unverified without further native
recovery or user-supplied reference captures.

## Expected data input

Native directory-candidate builder `0x14556ce60` reads environment variable
`WOW_DATA` (VA `0x146abf150`, length `8`). It also appends `WoW/Data` and `Data`
path candidates. Those exact strings and bounded native references are retained
in the menu assembly manifest. Final discovery priority, archive selection,
patch ordering, required menu DBCs and individual asset requirements are not
fully traced here.

The EXE names a missing-install diagnostic and identifies downloaded game data
as the models and textures it displays. For an authentic menu, data mounting,
class/race icons and the hero preview are therefore concrete integration work;
the claim that MPQ contains models/data does not make the menu independent of
it. This does not establish that every asset is required before the UI shell can
appear. No archive contents, live save or external game installation were read.

Reproduce the bounded startup evidence with
`python3 scripts/inventory-executable.py --capture-menu-assembly`.

# Menu catalog source

The repository now targets [Azeroth Survivors 0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.100.1.md). The embedded `menu.json` retains its **0.97.2** catalog version; [0.97.2 catalog recovery](../../../docs/analysis/menu-catalog.md) owns its nine classes, 112 abilities, eight races and twelve zones. It has not been regenerated or validated against 0.100.1. The launcher embeds it with `include_str!` through `src/catalog.rs`, so building the source does not require the reference EXE. Images, fonts and models are not included here; icon basenames resolve against the configured MPQs.

## Historical 0.92.0 extraction

The records, layouts and counts below describe the original **0.92.0** extraction, preserved as historical provenance. They do not describe the replacement 0.97.2 catalog or establish behavior for the selected 0.100.1 target.

Source artifact at extraction:

- Project path: AzerothSurvivors/AzerothSurvivors.exe.
- Size: 130,888,192 bytes.
- SHA-256: `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
- Embedded game version: 0.92.0, independently recorded in docs/analysis/target-refresh-0.92.json.
- Exact source records, string/slice locations, bytes and hashes: docs/analysis/evidence/menu-provenance.json.

| Source | File offset | Preferred-image VA | Layout |
| --- | --- | --- | --- |
| English locale | `0x66df172` | `0x1466e0972` | Exact 164,801-byte JSON, 2,507 entries |
| Classes | `0x66d3058` | `0x1466d4858` | Nine records, 144 bytes each |
| Zones | `0x66d1210` | `0x1466d2a10` | Nine records, 184 bytes each |
| Addon API template | `0x68ab4f4` | `0x1468accf4` | Exact 7,602-byte readable Lua block |

The catalog preserves nine classes and their 101 spell-pool entries, eight races with racial descriptions, nine zones with their stored final boss and arrival-minute data, class icon/color metadata and English labels. English display spell names come from the locale, while provenance retains original spell keys. All class/zone names and pool spell keys were checked against the extracted locale.

Class field offsets are key +16, name +32, spell-pool slice +48, default spell +64, color +80, icon +96 and raw base-health float +128. The health field is retained for menu display; this pass does not confirm how 0.92 native code applies ranks, talents, classes or health formulas. A default spell can be changed by talents. Color is normalized sRGB from the original #RRGGBB string.

Zone records contain key/name/subtitle at +0/+16/+32, boss slice at +80 and loading-screen basename at +96. Boss rows are 88 bytes each; the selected final row carries flag1 at +84, its name at +0 and a whole-number threshold at +64. Arrival-minute and final-role meanings use the matching layout and previously traced 0.91 native consumers; this menu-only pass does not independently trace 0.92 consumers or implement run scheduling.

Race names and racial text come from the embedded English locale. Alliance/Horde is an explicit conventional menu grouping, not a recovered restriction on class/race eligibility. Labels retain the full English catalog because later menu tabs share its strings; this does not implement every screen or game mechanic named in it.

The source extraction was static. No game was executed, no MPQ was opened and no gameplay or visual parity is claimed. The historical 0.91 EXE and evidence remain preserved separately.

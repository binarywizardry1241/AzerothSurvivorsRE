# Main-menu localization — target 0.92.0

The target is `AzerothSurvivors/AzerothSurvivors.exe`, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.

`extract-menu-localization.py` recovers all ten embedded JSON catalogs, each containing
2,507 labels: English, Polski, Deutsch, Português (Brasil), Español, Français, Türkçe,
Русский, 简体中文 and 한국어. The owned build includes those textual catalogs and does not
need the reference executable to build or run. Exact source offsets, byte lengths and hashes
are in [menu-localization.json](evidence/0.92/menu-localization.json).

REA Ghidra analyzed exact PE function slices for the popup constructor `0x14022a2a0`,
choice handler `0x140075040`, default-language loader `0x14541f9f0` and setter/writer
`0x145420a10`. Their Evidence IDs and recovered literal styles are in
[localization-native-paths.json](evidence/0.92/localization-native-paths.json).
The constructor places an unscaled window popover at right16/top58, min-width200,
padding8/gap4, with a 12px heading and ten 17px choices. Selecting the current language
closes the list without rewriting the language file.

In the isolated native reference profile, choosing Polski immediately translated picker
headings, tabs, classes, racial lines, enemies, bosses and controls and closed the popover.
It wrote exactly `pl` to `BENILLA_HOME/language.txt`. English was restored and the file
was verified to contain exactly `en`, without a newline. The loader checks a valid saved
code, then LC_ALL, LC_MESSAGES and LANG, normalizing the environment prefix before
`-`, `_` or `.` to lowercase, and falls back to English.

The owned `localization.rs` implements those catalogs, explicit picker keys/templates,
persistence and popup selection. `MenuCatalog` refreshes its class/race/zone/ability display
definitions from their native keys. Enemy IDs are read from embedded records at +32 and
boss IDs at +48, producing `enemy.{id}` and `boss.{id}.name`; these keys are retained in
`menu.json`. Player names and file names are never searched or replaced. Shared native
catalog consumers in the other screens can use the updated label map; remaining hardcoded
English sites require explicit owning-source bindings. There is no global text-guessing pass.

Build11 compiled and rendered the language popover; choosing Polish in the rebuilt UI wrote
exactly `pl`. Its MPQ fonts showed missing Polish, Cyrillic and CJK glyphs, and a long Polish
equipment description expanded the middle pane. The exact native font provider is now
recovered and implemented; its next comparison is pending. See [main-menu-fonts.md](main-menu-fonts.md).
All ten locales' complete glyph coverage, long-label layouts, native hover transitions and
external custom-locale JSON overrides remain unverified or incomplete. Catalog extraction alone is
not proof of complete localization or visual parity.

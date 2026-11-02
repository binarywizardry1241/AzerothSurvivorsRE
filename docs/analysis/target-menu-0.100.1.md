# Selected 0.100.1 target and menu integration

Historical 0.100.1 evidence. Current class/ability/talent definitions are
revalidated in [the 0.105.0 balance report](balance-catalog-0.105.0.md);
ordinary gear/amulet numeric status belongs to
[the current equipment report](equipment-catalog-0.105.0.md).

Reviewed **2026-10-19** against
`AzerothSurvivors/AzerothSurvivors-0.100.1.exe`, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
This report owns the consolidated target/menu changes. It records source integration
and native evidence separately from runtime parity. The root chat owns the final
combined build/test and isolated original/rebuilt comparison results in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Recovered and connected

- **Three talent specs:** current parser `145430740` reads the legacy live
  `talent|class|xp|allocation` rows before `spec|class|active|slot0|slot1|slot2`.
  Each stored allocation is normalized against that class's XP. The current
  view `14542e5c0` reads the live row for the selected slot and the stored row for
  other slots. Switch `14542e9f0` saves the outgoing allocation before changing
  the active index; an old save gains its first spec record on that switch.
  Setter `145439e60` updates the selected stored slot and the live allocation.
  Source persistence, three menu selectors, counts and class isolation use these
  paths. Migration does not copy the old allocation into all three slots.
- **Talent definitions:** all current target definitions and extracted values are
  in [talents.json evidence](evidence/0.100.1/talents.json). The shared rule module
  serves save normalization and the menu. Historical comments/geometry that have
  not been independently checked remain historical evidence, despite shared code.
- **Hourly backups:** current ordinary-write `1454356a0` writes the active save,
  checks nonempty progress, then checks `characters.backup-at.txt`. A timestamp
  no later than now suppresses a backup while the elapsed time is below 3,600
  seconds; a future timestamp does not suppress it. Writer `145469450` creates
  `Saves/Backup YYYY-MM-DD HH-MM-SS.sav` in UTC, retains five backup names in
  descending path order, and advances the stamp only after successful backup
  creation. Filter `14546a1f0` requires exact-case `Backup ` and `.sav`; manual
  exports are preserved. Source exports use the envelope writer without the
  active-save backup timer. Import retains the fixed before-import backup.
- **Stored-level option:** the current 152-byte descriptor at `145955630` is a
  noninverted Controls checkbox directly after `cacheOnClick`, with engine CVar
  storage. Registration/synchronization `140062560` establishes defaults `0`
  for `storeLevels` and `spendLevels`. The menu exposes `storeLevels`, persists
  it through the existing CVar mechanism and provides the host synchronization
  methods. The root chat owns the run scheduler and real-client addon bridge.
  Current sync compares a one-byte `1` for store at `140062618`–`140062621`
  and spend at `1400627b5`–`1400627e3`, after helper `1400a4890`; it does not
  use the engine numeric-flag parser. HUD flag sync `140363d40`–`140363d54`
  defaults true and hides only a one-byte `0`. Complete helper instruction
  replay verifies Unicode White_Space trimming at both ends, including NBSP,
  while excluding zero-width space, BOM and U+001C–U+001F. Rust `str::trim`
  matches all [75 retained native cases](evidence/0.100.1/target-menu/cvar-trim-native.json);
  the [proof](evidence/0.100.1/target-menu/cvar-trim-proof.json) retains the helper/table
  hashes. Host/HUD CVar reads now use that helper; the final all-target regression pass
  compares all75 native cases.
- **Stored-level HUD and ready prompt:** current HUD root `140082d40` and
  constructor `140105220` recover the target's own custom Bevy layer at global
  Z 4000. The ready line is centered at top 36%, uses the 40px heading font and
  GOLD, and is controlled by the start gate. The stored-level button is centered
  at bottom 190px with native class-atlas icon, count badge, `Level Up!` heading
  and `LEVEL {n}` summary. Current updater `1400909d0` controls visibility and
  the 14/sec hover blend, 2.6-radian pulse, border/shadows and lift/scale. Flag
  owner `140363920` treats exact `0` as hidden. Source now implements this
  hierarchy in `gameplay/stored_hud.rs`; root owns input, addon and scheduler
  wiring. [Exact constructor layout](evidence/0.100.1/target-menu/hud-layout.json)
- **Fourteen locales:** exact current pointer/length JSON includes Czech and
  2,632 labels per language. Locale order and explicit keyed translations are
  connected; no arbitrary player/file text replacement is used. Current tables
  and embedded font hashes are in [locale evidence](evidence/0.100.1/locales.json).
- **Czech glyphs and FrameXML font supply:** current augmentation `1455181d0`
  has 41 composite records, two mirrors and six aliases. New mode 4 positions the
  apostrophe to the right of the stem with a 2%-em gap and aligns its top with
  the base glyph. The source implements this mode and supplies the same augmented
  user font bytes to the real FrameXML text engine before it initializes.
  Source delivery does not bundle the EXE's embedded fonts. Exact glyph/fallback
  parity requires compatible user fonts, normally through `--font-dir`. The
  [current embedded-resource index](evidence/0.100.1/exe-assets.json) retains
  ten validated font records and eight images as textual offsets/hashes only.
  Its explicit reproduction command selects0.100.1; the generic extractor
  keeps its historical0.97.2 defaults.
- **Ordinary equipment effects:** current item owner `14546f110`, class table
  `1469d59a0` and scaling owners `14554c7c0/14554ca00/14554cc40` independently
  revalidate all **415** ordinary pieces. There are **zero** numeric effect
  changes from the prior catalog. [Current gear proof](evidence/0.100.1/target-menu/gear-effects.json)
  retains every result. Names, appearance, starter outfits, flavor and drop data
  keep their separate historical provenance. PvP qualities 5/6 are separate
  consumers and are not included in this 415-piece result. Their later
  [0.105.0 recovery/integration](pvp-gear-0.105.0.md) owns the current 83-piece
  supplemental catalog and twelve-zone drop mapping.
- **World data changes:** the ordinary/elite health constructor `1454d4130`
  applies the recovered zone bonus multiplied by the square of the clamped
  minutes/20 fraction before endless/options multipliers. The live spawn adapter
  calls the zone-aware helper. All five Naxxramas boss scale words are refreshed
  from their current 88-byte native records; other record provenance is retained.
- **Account result delivery seam:** source APIs merge terminal lifetime deltas,
  runs/wins, class talent XP, won-zone unlocks, beaten-zone keys, owned equipment
  and seen rarity without replacing the session Pick or other specs. The current
  run-effect/progression report owns the terminal producer and when each API is
  called. Current serializer `145436620` establishes the roster's ten fields as
  GUID/name/race/class/sex/features/best level/best seconds/runs/wins; the prior
  `map`/`position` labels were incorrect and are corrected. Result `14544a260`
  independently maximizes the two best fields and wraps the two per-character
  u32 counters; the separate GUID-based API implements that mutation. Selected
  roster GUID (`Game+f80`) is distinct from network UnitGUID 1 and embedding
  session identity. Root owns carrying this identity from the native roster path;
  no name-based guess or fake roster row is introduced. The explicit
  `MenuState::select_roster_character(guid)` seam copies the addressed row;
  `selected_roster_guid()` rejects stale selections after edits/removal/import.
  Current custom Enter owner `1400c44f0` normalizes its full Pick, sends command11
  and sets the entering state at `1400c54a5`. This payload carries no roster GUID.
  The current custom-mode character-enumeration/login producer now projects the
  actual temporary GUID`0xfffffe`from Pick; it does not append a permanent roster
  row. [Factory and Enter delivery proof](custom-roster-0.100.1.md) bind that
  path. Ordinary saved-roster selection remains a separate explicit API seam.
  These source connections do not establish interactive menu parity.

The allocation gates were independently relocated in the selected PE before reuse.
The complete 129-byte budget leaf at `14542f490` is unchanged from 0.97.2;
other historical RVAs are not current. Current can-learn `145483ba0`, exclusive
capstone `1454834e0`, previous-rows `145483d70`, normalization `145483fc0`,
collector `14553b8e0`, ordering `145507670` and refund `145483720` retain the
implemented algorithm. Original-PE instructions confirm the prerequisite's own
maximum rank, `row * 5`, same-tree row-6 exclusion, `(row, tree, column)` ordering,
and unlimited-budget refund normalization. The manifest retains each current
owner; fresh REA/Ghidra output binds the current normalization slice. Shared
source comments now use these selected-target addresses.

The selected original was also observed by the root chat through its isolated QA
window on 2026-10-19: the Talent page has three selectors above the Talent Points
heading, `Empty` on a fresh profile, and distinct active/inactive treatment. This
is an original-menu observation, not a successful rebuilt comparison. Current
native selector stores establish padding 6/5, radius 5, grow 1, automatic basis,
14px titles and 11px tree summaries. Source selectors now follow that placement.
Exact gradient/hover and whole-page typography still require the final comparison.

The latest rebuilt capture exposed and then verified correction of the footer:
[current native identity](menu-identity-0.100.1.md) is`v0.100.1 (903c892d)`.
That display overlay preserves the historical definition catalog's provenance.

## Historical menu coverage and remaining work

The [0.105.0 talent migration report](talent-migration-0.105.0.md) supersedes
Demonology load/refund/key-preservation coverage here. Current native allocation
rules and whitespace handling are checked statically; source regressions and
actual save/menu comparison remain unverified.

The [0.105.0 Rewards report](rewards-menu-0.105.0.md) supersedes this target's
Rewards data/presentation status. Its layout/input fixes have native vectors
and source parsing, while compiled/rendered comparison remains unrun.

Current desktop [Saves listing/import](saves-browser-0.100.1.md) now captures
contents before confirmation, distinguishes read/envelope failures and exports
the account Save directly. All33 save-browser cases passed. The desktop page
uses ordinary Import rows for backups; no browser Restore control was inferred.

| Surface | Current evidence and limit |
| --- | --- |
| Picker/navigation | Prior reconstructed interface remains connected. Current root slice is retained locally; complete current input/default/geometry comparison is unfinished. |
| Appearance/name | Prior normalization and generator remain. Current appearance/feature slices are mapped; no new integrated comparison is claimed. |
| Character/Armory/Collection/Drops | Current page slices and gear numeric effects are available. Current right-click equip/clear and Shift appearance toggles are connected and tested; [input proof](armory-input-0.100.1.md). PvP piece/menu/stat integration is now owned by the separate [0.105.0 report](pvp-gear-0.105.0.md). Complete tooltips and controlled input/drop-table presentation parity remain unverified. |
| Talents/specs | Current spec persistence/selectors are implemented. Full native rule and screen comparison remains pending. |
| Achievements/Rewards | Current72-achievement/1495-point catalog, grants, first dates, gameplay banners and reward tables are implemented from [current proof](account-progression-0.100.1.md). Full Rewards input/layout and controlled original/rebuilt comparison remain unverified. |
| Codex | Historical dynamic catalog/UI remain; mapped current slices are leads for full catalog/presentation revalidation. |
| Controls/Options | Current stored-level row is connected. All other original descriptor/default and engine callback claims keep their existing provenance until revalidated. |
| Saves | Current backup/retention, desktop listing/sort, captured import/inline confirmation, error distinction and direct Save export are implemented and tested; [owning report](saves-browser-0.100.1.md). Original/rebuilt desktop interaction and other-platform execution remain unverified. |
| AddOns/language | Fourteen current locales and font augmentation are connected. Every localized surface, addon-version path and live FrameXML fallback remains to be checked. |
| Preview/background/audio | Existing real-MPQ preview, scene and mixer paths remain. Current mapped owners do not by themselves establish matching lighting, equipment, transitions or audible behavior. |
| Updater | Existing owned updater path remains. Version-comparison fixtures now use the built package version and a future release instead of historical0.92/0.94 assumptions; current-platform visual/runtime comparisons remain incomplete; no live reference installation/update was performed here. |
| Floors/relocation | Current movement admission, connected floor/occupancy/navigation caches and real MPQ production are implemented. All12 zones passed the structural MPQ probe; controlled original/rebuilt movement/collision parity remains unverified. [Owning report](floor-recovery-0.100.1.md) |

## Evidence and validation

[Target/menu manifest](evidence/0.100.1/target-menu/manifest.json) binds 38 exact
owners, selected-PE disassembly, completed REA/Ghidra Evidence IDs, their derived
input hashes, the new option descriptor and Naxxramas boss records. The raw-slice
Ghidra ABI is generic x86-64 GCC; original Windows register arguments, omitted
literals and jump-table cases were checked against full-PE instructions. Static
analysis is not target execution.

The optional `scripts/recover-target-menu.py` retains curated text and
`scripts/recover-gear-effects.py` revalidates ordinary effect results.
Both verify the complete target hash and stay inside this checkout. Source builds
never invoke them or require the reference executable.

New regression cases cover old-save spec migration, switch/edit/reopen, selected
versus stored views, class isolation and invalid slots; backup clock boundaries,
five-copy retention, future stamps, exact names and failure/export behavior;
Czech component positions; and terminal-stat saturation, final-zone progress,
reward deduplication, GUID-bound best-result updates and retained specs. The current combined pass completed43 library and133 binary tests (`effects-presentation-integration-r11.log`); earlier selected font/options/save-browser/chest cases passed57/57. These are source checks, not GUI comparisons. No Windows build/runtime
or full original/rebuilt parity result is claimed.

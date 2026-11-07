# Codex recovery

This report records 0.92.0.

Updated 2026-10-16. The authoritative target is `AzerothSurvivors/AzerothSurvivors.exe`, SHA-256 `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`. Historical0.91.4 addresses are not used. This work concerns the read-only Armory Codex, independently of gameplay.

The140-entry catalog is recovered and the new [`CodexPlugin`](../../crates/azeroth-survivors-re/src/codex.rs) is implemented locally. **Codex1:1 parity is not yet verified.** The module now uses the recovered intrinsic grid and pane flow. The full outer shell and header now use recovered flex flow. GUI tab/close/reopen selection retention is proved. Remaining text/input details and rebuilt comparisons remain open reconstruction defects.

## Catalog and text

[`scripts/extract-menu-codex.py`](../../scripts/extract-menu-codex.py) verifies the original digest and produces [`assets/codex.json`](../../crates/azeroth-survivors-re/assets/codex.json). Building the reconstruction does not require the EXE, Python or Unicorn. The extraction-only Unicorn dependency is local under ignored`runtime/armory-recovery/python-libs`.

The recovered catalog consists of:

- 101 legendary amulets: one for every spell in the9 native class pools; Mage has13, each other class11.
- 9 rings and13 trinkets from22×72-byte records at`0x1466dd368`.
- 17 shared amulets from80-byte records at`0x1466de600`.

The native legendary constructor is`0x145406780..0x145407c37`. Its owned result contains key/name Strings, an Effect vector and icon path. The constructor derives `legendary:<spell>` keys, spell-specific amulet names/icons, and complete effect payloads. Codex displays the name before its first colon, while its subtitle names the remade spell.

The extracted English effect lines execute the actual native formatter`0x1454f6a50..0x1454f97b0`. Fresh ring/trinket values execute`0x145405940`, then description formatting`0x145405ab0`; the catalog retains all5 rarity rows. The emulation boundary whitelists reviewed heap/vector/String formatting, English fallback lookup, replacement and copying primitives. It has no reachable OS/files/network calls. This is bounded emulated native execution, separate from the static Ghidra analysis and the controlled original application observations.

The growth-footer branch at`0x1401dfaff` uses tag bits`0x9b`; tag8 has diminishing growth, tag15 refills lives up to2, and other bounded tags format their native ceiling through`0x145405ab0`. The extractor follows these instruction branches and retains the resulting text. Tag subtitles execute native leaf`0x140322980..0x140322ad7` and its English fallback.

[Catalog provenance](evidence/0.92/codex/catalog-provenance.json) records tables, function hashes, counts and explicit limitations. [`scripts/extract-menu-codex-locales.py`](../../scripts/extract-menu-codex-locales.py) now binds native14541f0e0/14541f030 to each already-extracted target locale catalog and runs the same constructors/formatters. It also executes item-name getters145405d80/145408150 and stat-label leaf140322980. [`codex-locales.json`](../../crates/azeroth-survivors-re/assets/codex-locales.json) contains140 text records for each of10 languages. Every English field is asserted equal to the structural catalog. The exact native footer branch substitutes its localized template with the natively formatted ceiling. Locale source hashes, actual lookup keys and output hash are retained in [localized text provenance](evidence/0.92/codex/localized-text-provenance.json). Source language-switch wiring is now implemented using the recovered output asset; original non-English runtime comparison is pending. Passing a composed English line to a lookup is not treated as translated parity.

## Persistence and native behavior

Native discovery persistence is `seen|key=quality,...`; the equals sign is significant because legendary keys contain a colon. The active parser finds that separator at`0x1453fb100`, and serializer`0x1454e8f20` emits it. Lookup`0x1453fa6a0` searches the account-wide sorted records and returns presence plus highest quality. Shared`Save::seen()` now validates nonempty keys/u8 qualities, clamps4 and merges duplicate keys by their maximum quality, as proved by native1454d8630. Valid unknown keys remain in the account map, although Codex counts only known140 catalog keys.

The Codex reads discovery state only. Clicking an item selects its details without granting it, equipping it, changing progress or writing a save. Undiscovered entries keep a dim image and question mark. Their detail heading is `Undiscovered`; category/stat or spell subtitle remains visible, while the item name and bonuses stay hidden. Native default state has no selected entry and shows two explanatory paragraphs.

Discovered ring/trinket details show the highest-seen rarity plus all5 fresh-pick rarity values. Shared amulets show their effect list and empowerment note. Legendary amulets show native spell-specific effects and their eligibility/empowerment note. Each class/group shows discovered and total counts; the footer totals140 known catalog entries. Class labels use the native class color and append`your hero` to the currently selected class count.

The pure module parses these records without mutating them. Imported unknown records remain preserved by`Save`. Complete save migration and imported-record canonicalization remain separate unfinished work; the module must not be described as full native import validation.

## UI evidence and remaining layout work

Static Ghidra slices recover:

| Native function | Recovered role |
| --- | --- |
|`0x1401da240..0x1401dc5ed`|Codex grid constructor; group captions, class/group rows,42px cells,6px grid gaps, footer|
|`0x1401dd0d0..0x1401e027f`|Details constructor; default/undiscovered/discovered branches,12px header gap,8px rarity-row gap,84px rarity labels,16/13/12/11px text,48px detail tile|
|`0x140320f80..0x140321958`|Shared Codex item tile, discovery lookup, selection comparison, rarity palettes,2px border and6px radius|
|`0x1401e12a0..0x1401e1781`|Legendary spell badge and undiscovered question; size0.42×tile, badge right/bottom−5px, question color(.4,.36,.3)|

The tile's unseen image tint is sRGBA(.16,.15,.15,1). Its border palette differs from its brighter rarity text palette; the source keeps those separate. Shared frame rendering delegates to the native common-pane helper reconstructed in`menu::native_panel`; its gradient floats are preserved in LinearRgba.

Parent constructor`0x140321b90` now establishes both panels as columns with16px horizontal/12px vertical padding and8px gaps; left panel grows, right panel is330px wide and does not shrink. The source implements those constraints. Grid columns are120px for the label, then `max_group_count` repeated42px columns, with6px row/column gaps and center self-alignment. Both grids use the same maximum17, leaving unused cells after shorter rows. Labels are15px, counts11px. Section-heading helper`0x1401e83a0` proves22px heading font and12px horizontal gaps. The details body now follows native flow, including48px icon,12px header gap and native14px default paragraphs.

The higher shell`0x1401f5430` is100%×100%, with40px horizontal/20px vertical padding and14px row gaps; its body is100%wide with18px column gaps. Its header remains the shared Armory helper. At the controlled1600×900 client size, runtime captures place the left panel at[40,108,1172,772] and Details at[1230,108,330,772]. That earlier absolute placement has now been replaced by the recovered shell/header/body constraints, including native intrinsic header height. Measured absolute body bounds were not treated as proof that the original used those absolute Node values. Across-size rebuilt comparison remains pending.

The native tile's selected/hover shadow and rounded parent ImageNode are implemented from the later typed-bundle trace below. The faded section rules now use native`0x1400a1700`: it forces1px height and constructs a horizontal3-stop gradient with raw RGB and alpha0/inputalpha/0. Its stops are LinearRgba after the native converter. Header separator rules are implemented; scroll/clipping behavior remains unfinished. GUI selected-entry lifecycle is now proved statically: tab changes, Done and picker Armory reopen preserve selection, matching CodexState retention. Process restart/import and other untraced state transitions remain unverified. The module disables interaction behind Options or menu dialogs. It has not been verified against all original input-priority cases.

Relevant instruction extracts are retained under[evidence/0.92/codex](evidence/0.92/codex/catalog-provenance.json); full disposable REA dossiers and screenshots remain under ignored`runtime/`.

## Validation actually performed

The isolated original EXE accepted a sealed fixture containing:

```text
seen|legendary:cleave=4,legendary:whirlwind=4,accuria=4,mark_of_fordring=0
```

It displayed4/140. Native Cleave showed4 extra targets,+50%damage and80%burn/bleed over6sec. Whirlwind showed+60%area,+35%damage and1.5secstun. Band of Accuria showed26/36/46/61/82%damage for Common through Legendary. Common Mark of Fordring showed+15%damage. Undiscovered click states were captured independently. The reference profile was restored to the empty native fixture after observation; no installed player save was used.

[Runtime observation record](evidence/0.92/codex/native-runtime-checks.json) lists captures and fixture text. Catalog extraction completed with101+39 entries and140 unique keys. `rustfmt` passed for the new source module. Parent-owned integrated build16 passed(19.06s). Parent-owned integrated build17 also passed with the intrinsic-grid/pane-flow corrections. The localized output wiring, shared seen normalization and native`Hero` fallback are compiled in subsequent parent checkpoints; rebuilt visual/function comparison remains pending. No Cargo build was started by this subtask and no GitHub push was performed.

The rebuilt Codex now loads the exact ten-language text asset and selects it using the native language code. Names, effect descriptions, per-quality descriptions, stat subtitles and growth notes are already native-composed values and are not looked up or translated a second time. Changing language invalidates the Codex render signature. Non-English native/rebuilt comparisons remain pending.

## Exact tile style follow-up

The native typed bundle is now traced through1401a8a50→140233d60→140344550→1402b7b10. RTTI at145903890 identifies codex::Entry, Interaction, picker::Hover, Node, BorderColor, BackgroundColor, ImageNode, BoxShadow and UiTransform; the spawn function exposes each component offset. The hover component uses the resting selected/darker-rarity/unknown border, then a brighter rarity color when known or GOLD when unknown, with2px lift. A selected tile does not force PAPER on hover. Selected shadows use raw RGB(.973,.824,.416), alpha.8, spread2px and blur14px; known unselected tiles use rarity RGB/alpha.25, spread0/blur6; unknown tiles use black/alpha.85, spread0/blur6. Colors pass through the native converter to LinearRgba. The ImageNode belongs to the bordered/radius6 parent. Details calls the same interactive tile constructor at48px. Quality helper14031e950 uses highest discovery quality only for rings/trinkets, fixed native quality for shared amulets and4 for legendary amulets. [Typed style evidence](evidence/0.92/codex/tile-style.json) retains the exact component mapping and instruction extracts. These corrections are now applied for the parent-owned build20 checkpoint, including centered question text, rounded parent ImageNode, black1px/radius3 spell badge, native quality selection and interactive selected Details tile. No new UI launch was performed.

Build19 compiled and all34 focused cases passed before the tile/header/shell edits. Those edits subsequently compiled in build20. Codex outer placement no longer uses measured fixed body bounds; the other Armory page bodies remain independent work.

## GUI selection lifecycle

Native Armory Act handler140045520 dispatches through1458b49a0. Close(tag2) at0459fa clears open+0x72 only. Tab(tag3) at045d4d sets open and tab+0x76, with a Drops-only selected-zone update; it preserves the first24-byte Codex selection. Picker open126a2f..126a76 likewise preserves selection while opening Character and clearing gear focus. This supports the source resource retaining selection across tabs/Done/reopen. The separate string-driven opener031d80 initializes command`codex` to the last discovered native ring; this is not the GUI tab path and is not substituted for it. [Lifecycle evidence](evidence/0.92/armory/codex-selection-lifecycle.json) retains the dispatcher and exact case extracts. No new UI launch or source mutation was needed for this finding.

Parent-owned build20 passed after8m33s, with18 binary-rule and3 configuration cases; it was not launched. It includes the exact Codex tile/header/shell corrections. Follow-up explicit15px font on the shared collected-count TextSpan compiled in parent build21(12.05s), because Bevy spans carry their own font component. Parent reports54 focused harness cases passed, including path precedence and import-write-failure tests. Build21 was not launched. UI and across-size comparisons remain pending.

## Progress bar constructor

Native `0x140320620` proves the footer bar: a 100% × 8px outer Node with a 1px border, 4px radius, both overflow axes Clip, sRGBA black at alpha 0.6, and border color (0.169, 0.129, 0.071, 1). The fill width is `clamp(input, 0, 1) × 100%`, with 100% height. Its PI/2 linear gradient has two automatic stops: raw native RGB (0.690, 0.541, 0.227) and (1, 0.914, 0.659), converted and stored as LinearRgba with alpha 1. Both stops use the default 0.5 interpolation hint; these are not 50% stop positions.

[Constructor evidence](evidence/0.92/codex/progress-bar-style.json) and its hash-bound slice retain the exact stores. The source correction is applied for checkpoint22, replacing the earlier radius 3, opaque black background and solid gold fill. Rustfmt passed and parent build22 passed11.82s with26 binary rule tests. Rendered comparison remains pending. No application was launched for this finding.

# Armory catalogs, text, selection and race hover

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the current Armory catalog, text, input and footer paths under #17.
[verification-needed](../verification-needed.md) owns current implementation status. Historical
[Armory](armory-recovery.md) and [secondary input](armory-input.md)
evidence retain their own targets.

## Recovered contracts and connected source

Current REA/Ghidra owners for Collection, its missing-list producer and entries,
Look footer, full Details content, gear constructor, rarity/slot names and gear
stat descriptions are retained once in the [manifest](evidence/armory-pages/manifest.json).
Each record binds the exact current byte range, hash, Ghidra Evidence/profile,
and original-VA pseudocode. Raw-function imports omit external globals and use a
generic ABI; original bytes, call instructions, native table fields and bounded
instruction replay supply the contracts below.

The old source rendered composed English gear names even when a translated
catalog was selected. Current `1459a4ba0` selects native set/noun grammar for armor
and class/PvP keys for weapons. The selected tables provide **45** class set
records (including each prefix/suffix flag) and **32** armor nouns. Those compact
rules now drive `piece_name` through the live equipment, Collection, missing-list,
Details and Look footer consumers. English fallback is the actual native record,
not an untranslated locale key. Current native tables independently reconstruct
all **415** ordinary source names; the same native key grammar also reproduces
**166** existing PvP faction names. The unchanged historical base assets retain their original provenance; the separate current catalog pass below revalidates their numeric/display fields.

Slot, item kind, rarity, sex, feature, Equipment and worn/look badge text now use
their existing current catalog keys. The page's zone and boss consumers use the
existing localized zone/boss catalog with English fallback. Their translation
uses the real page consumers instead of merely making more locale data available.

`140235c20` adds **Showing** followed by the quality-colored name only when a
positive explicit cosmetic resolves to a piece. The source previously omitted
that row. It now keeps the native absent/hidden/positive distinctions and the
localized LOOK/slot title. Current missing-entry `140230940` explicitly starts
with a six-candidate counter; the prior source cap of six is native behavior.
The missing piece name uses **13px**, correcting the source's 14px. No invented
scroll or expanded list is added.

Current Details owner `140142300` obtains health separately and formats the other
gear effects through `1459a1f00 → 1459b9370 → 1459a0760 → 145895e40`. The source now
uses their actual translation keys and `item.health` / `item.equip` wrappers.
This corrects target-count singular/plural and echo wording, as well as number
formatting: percentage magnitudes below ten can retain one decimal, while larger
values round to a whole percentage; regeneration rounds to one decimal and omits
a redundant fractional zero. All percent arithmetic remains f32. The former
source printed one decimal at every magnitude and had different count/echo prose.

Current `1459a0970` equipment bonuses use localized `bonus.*` keys, whole
percentage/health values rounded with native `roundf`, and exactly one decimal
for regeneration. The old source used English equipment summary text and could
round half percentages differently. Gear lore now follows current `1459a2e90`
plain/class-key selection and the native `(class*3+slot)%8` index.

The current class/effect/PvP tables revalidate **415 ordinary**, **83 PvP** and
**166 faction-preview** definitions, all **12 zones** and their boss drop maps.
The native boss stride is104 bytes (minute+80, final+100); the historical88-byte
layout is rejected. Base boot movement is **0.075**, correcting63 ordinary/PvP
faction effect rows that still used0.03. Native display fallback `1459d0740`
scans downward from chosen rarity and then higher; eight source item displays
are corrected. A compact **71-record** current overlay patches these fields
without duplicating unchanged assets. All66 starter definitions and72 race/class
outfits independently match current native metadata/getter execution.

Fresh current primary `140161be0`, secondary `14015fcf0`, navigation `14013ead0`
and Codex selection `14037d490` owners replace reliance on historical input
addresses. Primary piece clicks set both details and focused slot; slot clicks
select the worn item or clear old details when empty. The previous source missed
both transitions. All admitted rows are processed. Secondary owned-item edits
keep Shift/cosmetic and ordinary equip toggles independent, and only meaningful
empty-slot removal publishes a change. Native gear edits call both account-set
and menu-command publication; source queues the corresponding durable account
write and preview refresh. The current navigation helper retains all24 Codex
selection bytes across tabs/Done. Drop Tables follows the selected item's first
drop location; the current picker Armory opener clears gear focus/selection
without clearing Codex. Rewards dirty-plan confirmation remains separately owned.

Current race hover updater `1401630f0` creates the missing native `RaceTipBox`
and delegates content to `140238eb0`. The connected card is 430px wide, with
12×10px padding, a 12px horizontal gap, native brown/gold colors, shadow and
z-index 5500. It follows the cursor at +18/+20px and moves 430+12px left when
its right edge would leave the viewport; it does not borrow the picker tooltip's
vertical flip. The 40px framed race portrait precedes an 18px gold title, 13px
bullet/body spans and a 12px red class restriction line when the race is
unavailable to that class. The existing localized race catalog supplies the
actual title and racial lines. All eight current native records independently
match the source's English fallbacks (22 lines); every line key exists in all
fourteen current locale maps.

## Static verification

- `python3 -B scripts/recover-armory-names.py` verifies native name tables,
  full selected ranges and retained evidence, all 415 ordinary / 166 PvP English
  names, and every used name key in all fourteen current language catalogs.
- `python3 -B scripts/check-armory-text.py` executes **1,722** bounded
  current native stat-text cases, **1,722 bonus-text** cases and **5,040 lore** cases across all fourteen catalogs. The actual effect
  dispatcher, number arithmetic, key selection, count branch and string
  composition execute. Explicit host seams provide allocation, copying,
  locale lookup, formatting and the independently identified current IAT
  `roundf` / `truncf` imports. Compact format precision is decoded as its actual
  u16 field. No native external/OS/filesystem/VM/application path is admitted.
- `python3 -B scripts/check-armory-race-tip.py` replays three current
  typed Node submissions, title/bullet/span construction and verifies the eight
  current race records and fourteen-language key coverage. UI/font/asset,
  shadow, copying and getter fixtures are declared seams; original ECS queries
  and computed screen layout are not executed.
- `python3 -B scripts/check-armory-catalog.py` compares all current
  ordinary/PvP/faction/zone metadata and replays913 scaling,360 display-fallback
  and72 starter-getter cases with declared roundf/item-reader fixtures.
- `python3 -B scripts/check-armory-input.py` executes180 secondary
  mutations,12 mouse-message predicates,270 primary admitted rows,112 complete
  navigation and72 sparse/dense Codex selection cases. ECS/ticks, descriptor and
  account getters, drop lookup, allocation/copy/memcmp and publication are
  explicit seams; no file or preview receiver runs.
- Rust source regressions cover every English gear name, translated grammar and
  missing-key fallback, plus **123 stat / 123 bonus** English original-instruction vectors and180 current secondary mutation cases.
  They are added but were **not compiled or run**.
- Project rustfmt parses the changed module without compilation; diff whitespace
  checks pass.

These changes do not certify every historical style field or shared-engine
consumer as current-target equivalent. The page source retains the established native layout; current retained constructors allow targeted follow-up where a renderer difference appears. Compilation, actual page input, fonts/GPU rendering, persistence interaction and original/rebuilt comparison remain unverified. Current save-row parser/getter normalization and the full 19-slot preview/gameplay resolver are documented separately in [equipment persistence](save-gear.md) and [typed Save schema](save-schema.md). The separate [current hero-booth repair](hero-preview.md)
connects the native-style preview path. No build, compiling test or game ran.

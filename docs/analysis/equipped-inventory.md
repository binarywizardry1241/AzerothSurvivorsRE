# Equipped inventory publication

Target: installed `AzerothSurvivors.exe`, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This repairs the source publication gap tracked as **#55**. Current status is
owned by [verification-needed](../verification-needed.md); source/static recovery does not
establish rendered or original/rebuilt parity.

The character panel now receives real item objects, inventory-slot GUIDs and
answers to its normal item-template queries. The existing benilla item store,
FrameXML inventory getters and tooltip feed consume them. Visible model gear
continues through its separate appearance publication.

The separate [current refusal repair](inventory-refusals.md) connects the five move/destroy request responses under #67. Item objects/templates alone did not supply those UI error/unlock acknowledgements; actual interaction remains unverified.

## Native contract

The compact [manifest](evidence/equipped-inventory/manifest.json) binds
sixteen native owners, relevant data tables and seven REA/Ghidra operations to
current bytes. [native.asm](evidence/equipped-inventory/native.asm) retains
only the instruction slices needed for GUIDs, slots, row identity and ordering.
Ghidra imported bounded raw slices; external references and its generic ABI are
limitations. Win64 instructions and the bounded replay resolve the arguments.

| Current owner | Recovered behavior |
| --- | --- |
| `145911450`, baseline `145824850` | Race/class starter items plus nonzero frozen entry equipment at `Game+2d0`; Horde PvP ID conversion; clear offhand for a two-hand mainhand. |
| `1458f95b0`, `1458ff8c0` | Ordinary item GUID `4000000000000000 \| (100 + slot)`; temporary GUID uses its dynamic entry. Type3, entry, scale1, owner/contained GUID and stack1 are item-object fields. |
| `1458fbb00`, `1458fc1b0` | True item GUID words use player fields `486 + 2*slot` and `487 + 2*slot`. Visible entries use `260 + 12*slot` from independent `Game+4f4`. Absent jewelry slots are cleared. |
| `14596f110` | First two acquired rings use slots10/11, trinkets12/13; amulet uses1. Equal slot/name/quality/full-text rows clone the entire prior record. Display, inventory type and entry are not equality keys. |
| `145970ae0..145970b09` | Process-static u32 atomic counter: `900000 + old_counter % 100000000`, then wrapping increment. New item objects precede player GUID updates; obsolete objects are removed afterward. |
| `1458646d0`, descriptor `145825570` | ItemQuery resolves any known requested ordinary/starter/tabard/cosmetic definition, independently of current equipment; otherwise current temporary rows, then refusal. A requested PvP ID already encodes its faction. |
| `1458d0b00`, registry `1458c6d60` | Full item response; text spells use process-static exact-string interning, `f00000 + insertion_index`. First four lines remain separate; the fifth joins the remainder with literal `\nEquip: `. |
| `14584a8c0` | Exact ASCII-insensitive icon lookup in51 records; unknown icon returns display0. |

Slots above are native zero-based descriptor slots. Lua inventory slot numbers
add one. Validated frozen gear and all72 starter outfits leave temporary slots
1/10..13 available; cosmetic rows never produce true inventory instances.

Temporary names use no suffix for picks0/1, Roman II through X for2..10, and
` X+` afterward. Name/quality/text changes allocate a new entry. Old templates
and interned text remain cached when obsolete item objects disappear.

Ordinary quality is rarity+1, except legendary nonweapons and PvP items use4.
Earned tabards90001..90006/90016 use quality3; purchasable tabards and cosmetic
query definitions use quality2. These query definitions do not equip cosmetics.
Armor uses the recovered class/subclass/rarity float branches. Each health
effect is rounded independently with `roundf`, converted to i32 with the native
saturation rule, then added with wrapping arithmetic. The current constructor
also proves two bounded catalog corrections: Hunter starter outfits omit melee
gear, and Rogue sword104840 uses sheath1. These corrections live in the shared
Armory catalog used by both appearance and true inventory.

The response's input is88 bytes: name pointer/length at0/8, lines pointer/count
at16/24, flavor pointer/length at32/40, followed by entry/class/subclass/display/
quality/inventory-type/sheath/armor/health at48/52/56/60/64/68/72/76/80. Its
defaults include item-level60, stack1, delay2000, unrestricted race/class, zero
prices/requirements/durability/damage/resistances, and one health stat even when
zero. Text spells are ON_EQUIP with charges0, cooldown-1, category0 and category
cooldown-1. Bonding is1 only when at least one text line exists; health alone
does not bind. Flavor remains the ordinary description.

## Connected source and lifetime

[`gameplay/client/inventory.rs`](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs)
publishes ordinary items from the frozen run entry snapshot, and temporary
items from the actual mechanics jewelry/amulet collections. It reuses existing
Armory names/lore/stat text and the existing reward effect expression tree.
Current C-panel jewelry uses full stat sentences, including two separate
armor/health lines. Amulet stat effects use the full stat formatter; spell
modifiers use the current expanded sentence keys and percentage precision.
Generic passive effects retain the recovered expression, capitalization and
rate-limit suffix, followed by the native literal period. The shared
`Text::Percent`/`render_with_percent` interface retains the default integer
reward-card rendering while admitting current C-panel spell precision. A cached input signature
avoids rebuilding unchanged rows each frame. OnceLock tables retain raw names
and rules; translation occurs through the current locale on use.

The publisher runs in First after the parent client synchronization and before
client lifecycle. Actual ItemQuery commands collected in PostUpdate have a
dedicated `LocalItemQueries` queue, separate from the gameplay request drain;
the next First consumes each queued request once. ItemCreate and player values
use `LocalPresentationEvents` and production inbound handlers. Template answers
update `Items::template_epoch`; object changes use `ItemChanges` and normal
field notices. The existing `ui_char` feed rebuilds when either object or
template state arrives, so both arrival orders reach ordinary inventory views.

[`item_descriptions.rs`](../../crates/benilla-app/src/local_client/item_descriptions.rs)
adds interned text to the ordinary `Spells.catalog` before inbound dispatch.
The normal item tooltip resolves these passive descriptions. The narrow
`SpellCatalog::insert_tooltip_description` interface adds no gameplay spell.

Run replacement removes old instances and creates the new ordinary instances;
the dynamic counter survives. Leaving flushes removal handlers before ending
the client session. ReloadUI keeps the item objects, templates, text registry
and counter; the normal VM memo republishes inventory/template snapshots. The
engine keeps learned templates across disconnect and only clears pending asks.
Locale changes rebuild temporary names/text and allocate new identities when
the native equality keys change. Existing ordinary IDs follow the normal
template cache lifetime; this repair introduces no locale-triggered cache reset.

## Checks and limits

Run, without compiling or starting either game:

```sh
python3 -B scripts/check-equipped-inventory.py
python3 -B scripts/check-equipped-inventory-text.py
python3 -B scripts/check-equipped-inventory-prose.py
```

The first checker replays674 current definitions (581 synthetic gear,66 starter,
20 tabard and7 cosmetic),72 baselines,216 true-item getter vectors,84 quality/
armor branches,154 icon lookups,9 identity branches,8 counter boundaries,
8 text-interning calls,7 health vectors and5 fully decoded item responses. It
checks every logical response field against the source initializer, including
zero-health, health-only bonding, spell defaults and the overflow separator.
It also checks current native bytes and the real request/consumer connections.
Retained results: [cases.json](evidence/equipped-inventory/cases.json).

The second checker reuses a hash-checked historical fixture algorithm with
individually recovered current addresses. Current instructions pass1722 stat,
1722 bonus and5040 lore cases across14 locales. Results match the retained
historical fixtures, whose original0.109.0 provenance remains unchanged.
Current proof: [text.json](evidence/equipped-inventory/text.json).

The third checker executes the current definition/name constructor for all581
synthetic/faction gear IDs across14 locales:8134 names match the shared
`piece_name` rules. It also replays1680 jewelry and5418 amulet text vectors
(129 current source definitions, three pick counts,14 locales). The current
inventory-owner factor branch passes all five rarities at picks0/1/2/5/10;
15624 current effect scaling vectors agree with the source's semantic magnitude fields.
The actual IAT entries bind powf/floorf and the copy seam. Current slot tables,
Roman suffixes, quality increments, stored amulet name and full line construction
are bound through the native producer slices and constructor replay.
Results and limits: [prose.json](evidence/equipped-inventory/prose.json).
The [English native vectors](../../crates/azeroth-survivors-re/tests/fixtures/equipped-inventory-0.113.2.json)
are also inputs to authored Rust comparisons; those comparisons are unrun.

Allocation/copy, numeric/string formatting, source locale lookups and selected
math imports are explicit replay seams. Numeric descriptor replay supplies
fixture text; the separate text replay checks the reused stat/lore rules.
Temporary definition bytes and owned strings are fixture inputs; their
historical catalog provenance remains unchanged. Current factor, scaling and
line constructors execute, and the repair uses their distinct C-panel forms.
These checks do not execute Rust, the Lua VM, a renderer, or either game.
All eight changed Rust modules passed rustfmt syntax-only parsing with
`--emit stdout --edition2024 --config skip_children=true`; no source was emitted
to those shared files. Four inventory regressions, the default reward-percent
regression and the extended request-queue regression are authored but intentionally
unrun.
Compilation, actual character-panel/tooltips, ReloadUI interaction and controlled
original/rebuilt comparisons remain unverified.

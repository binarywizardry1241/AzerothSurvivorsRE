# Current menu save and name recovery — 0.97.2

Recovered on2026-10-18 from `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`,
133231104bytes, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
Every address below belongs to that supplied target. The historical
[0.92 save report](main-menu-save-format.md) and its interop vectors remain
version-bound. They are not current-target runtime proof.

This pass used `./scripts/rea` with Ghidra on exact native slices, the original
Win64 instructions and PE pointer reads. It did not compile source, execute tests,
emulate instructions, launch the EXE or launch the reconstruction. Added fixtures
are source expectations derived from the static evidence; they were not run.

## Progress migration and canonical format

Current parser `0x14541f1c0..0x145422ee3` recognizes both old numeric
`unlock|class|count` and current `open|class|zone_key` records. The numeric count
still addresses the **former nine-zone order**, irrespective of the new menu's
twelve zones. It clamps the old count to1..9, reads the old key table at
`0x1467208c8` (16-byte string pairs), then resolves that key in the current
catalog. An old count therefore cannot be treated as a current ordinal.

| Old count | Old key | Current consecutive-zone count |
| --- | --- | --- |
|1|elwynn|1|
|2|duskwood|2|
|3|wsg|3|
|4|ab|5|
|5|feralas|6|
|6|arena|7|
|7|av|9|
|8|brm|10|
|9|aq|11|

The parser merges records for the same parsed u8 class by the **maximum**
resolved ordinal (`0x14541fab2..0x14541fac3`). A current `open` key must match a
known current zone. The serializer `0x145424080..0x14542629b` emits key-based
`open|class|zone_key\n` records; its compiled format starts at `0x146720b20`.
Source `save/progress.rs` implements this migration, merging and canonical output.
Its current keys come from the recovered `menu.json`, while its legacy key table
is separate historical format knowledge.

The earlier [zone policy fixtures](evidence/0.97.2/catalog-zone-policy-fixtures.json)
fed **typed native Save fields** directly. Their stored-count bounds remain valid;
they did not prove the text parser's numeric `unlock` interpretation. The source
fixture adapters now create canonical `open` rows from the fixture's bounded
typed counts. The native fixtures and original0.92 evidence were not rewritten.

## Pick and per-class appearance rows

The current parser takes the **first successfully parsed Pick** with6..8 fields.
Its class/race/sex fields must parse as u8. Shared normalizer `0x145427b30` then
maps an unknown class to Warrior, an ineligible race to that class's first ordered
race, and any nonzero sex to1. Unknown zone keys become Elwynn. Name and run-modifier
normalization apply before the result is stored. Consecutive-zone progress clamping
is a distinct operation through `0x14541d7f0`.

The five appearance tokens use `0x14552e9a0`: malformed and overflowing u8 tokens
are skipped individually, then exactly five surviving bytes are required. Pick
falls back to five zero bytes when its appearance field does not yield five values.
Per-class `hero` rows instead require exactly five values and strict class/race
eligibility. Their sex is normalized to0/1 and their features pass through the
optional appearance clamp. Helper `0x145523270` removes earlier heroes of the
same class before appending the later valid row.

`Save::parse` now creates normalized known menu rows on both load and import.
`Pick::normalized` owns the shared class/race/sex/name/zone/modifier/appearance
rules. `Save::heroes`, `set_hero` and full-Pick commits use the current optional
appearance helper. The [appearance report](appearance-0.97.2.md) owns cache
availability, class switching, race/sex changes, feature cycling and Randomize.

Startup `0x14008b690` loads Save, restores its Pick when present or constructs the
native default through `0x145428ae0`, normalizes, applies the unlocked-zone clamp,
then generates a name only when the normalized name is exactly `Hero`.
The source constructor's existing behavior is revalidated by this call chain.

## PvP item compatibility

Current item decoder `0x14545a320..0x14545b365` decodes synthetic IDs as
`100000 + class_id*1000 + compact_slot*100 + rarity_digit*10`. It requires a valid
native class, a multiple of10, an offset below12000 and a rarity digit below7.
Armor compact slots0..7 are accepted; weapon slots must fit the class's count.
Class records come from pointer table `0x14698b3a8`; their weapon count is at+128.

| Stored rarity digit | Interpretation |
| --- | --- |
|0..3|Existing Common, Uncommon, Rare, Epic IDs|
|4|Existing Legendary IDs|
|5|PvP, first faction table|
|6|PvP, second faction table|

At `0x14545a50e`, digit6 maps to rarity5 for common quality/effect selection, while
`0x14545a543` retains a separate second-table flag. PvP class lookup
`0x14545b700` reads `0x14698b400`; its records supply faction name pairs and weapon
counts at+40. For example, Warrior first/second names are Field Marshal's/Warlord's;
Paladin uses Field Marshal's for both entries and Shaman Warlord's for both.
Both stored ID variants remain accepted for those classes.

**Old Legendary IDs retain suffix40.** The inserted PvP tier does not justify
renumbering them to50. New IDs carry suffix50 or60. Source `save/gear.rs` preserves
the stored digit and validates each weapon against both class and PvP count bounds.
The build-time `assets/save-gear-0.97.2.json` contains those current native bounds
and581 preview descriptors. It is independent of the unrefreshed five-tier Armory
presentation catalog.

Items-line iterator `0x1455131e0`, numeric filter `0x1455252d0` and parser
`0x14541f1c0` validate class-bound synthetic items, sort u32 IDs and deduplicate.
Starter items and non-class-bound special items are not account collection ownership.
The source canonicalizes `items|` rows accordingly and omits an empty ownership row.
Its existing `GearSave::read` consumes this normalized output, preserving PvP
ownership even though current source Armory collection pages cannot present those
pieces. This pass does not implement PvP collection cells, item prose, stats or drops.

### Current preview displays and faction resolution

`save::gear::preview_item(id,race)` returns a lightweight `GearAppearance` containing
display_id and inventory_type. Its581 current descriptors cover415 ordinary pieces
and166 PvP variants. This avoids substituting unrecovered GearPiece prose/effects
to make the preview recognize saved current gear. Menu integration uses this
current lookup for synthetic equipment and cosmetic IDs.

The ordinary armor display helper `0x145516740` tries the desired rarity, lower
rarities descending, then higher rarities ascending, returning the first nonzero
display from class+136+tier*32+slot*4. A cloth chest uses inventory type20;
other armor inventory types come from `0x146989d64`. Ordinary weapons read display
at base weapon+120+rarity*4 and inventory type at weapon+112 (144-byte weapon rows).

For PvP armor the display comes from `pvp+48+variant*32+slot*4`. Zero specifically
falls back to the current class's Epic display at `class+232+slot*4`. PvP weapons
read `*(pvp+32)+weapon_index*48+variant*24`; inventory type still comes from the
corresponding base weapon record. Every generated descriptor has source addresses
in the manifest's preview provenance.

Outfit resolver `0x145459e90` treats Horde races2,5,6,8 specially: it changes a
first-table PvP ID (digit5) to its second-table ID by adding10, for both equipment
and cosmetic presentation. Other races copy IDs directly; stored digit6 remains6.
The helper applies this rule only while resolving the preview, preserving on-disk
IDs. For example, Warrior head101050 resolves display30316 for Human and30374 for
Orc; Warrior weapon101850 becomes display31998/inventory type17 for Orc. Native
display descriptors are recovered; actual rendering and MPQ model compatibility
remain unexecuted.

## Names and sealed envelope

Name validator `0x145428330..0x145428744` revalidates Unicode trim,2..12 ASCII
letters and ASCII title case. Name generator `0x14008e4e0..0x14008e67d` revalidates
the20/16/10 fragment tables at `0x1458fa620`, `0x1458fa788`, `0x1458fa898`, three
xorshift13/7/17 steps after the clock seed XOR, and the12-character cap. The
existing `hero-name.json` matches those current tables exactly; no replacement
fragment data or newly guessed name rules were introduced.

Current envelope opener `0x145502290` accepts trimmed `RSE1:` Base64, requires at
least36 decoded bytes, uses the first16 bytes as nonce and the last20 as tag,
verifies the tag before decrypting and rejects invalid UTF-8. MAC helper
`0x145501bc0` uses SHA-1 initial state/compression and the compiled ipad/opad
vectors at `0x1469ad1e0`/`0x1469ad210`. Their first42 bytes match the existing
embedded compatibility key XOR pads. Crypt helper `0x145501940` XORs20-byte
HMAC blocks from `ks + nonce + u64LE(block)`. Authentication uses
`tag + nonce + ciphertext`. These are compatibility constants, not credentials.

Ordinary writer `0x145423790` formats the Save, seals it, opens the result and
compares the plaintext before selecting sealed output. A failed round trip logs
and writes plaintext through `0x145454e30`. Current importer `0x145427ff0` requires
the sealed prefix, parses the resulting normalized Save, backs up readable active
text as `characters.before-import`, invokes the ordinary writer and returns the
imported Save even when the void writer fails. Current loader `0x14541e3c0`
revalidates fresh Save on absent read, one-time legacy backup, and damaged-seal
backup selection through `0x14541d190`: first unreadable or identical slot1..32,
otherwise overwrite slot32. Existing file-operation source policy is retained.

## Reproduction and limits

Run `python3 scripts/recover-menu-save.py` to hash-check the supplied target,
extract current tables/instructions and regenerate the item-bounds asset. It also
prepares exact-entry Ghidra plans under `runtime/menu-save-0.97.2`. For example:

```sh
python3 scripts/rea-batch.py runtime/menu-save-0.97.2/plan-14541f1c0.json
python3 scripts/rea-batch.py runtime/menu-save-0.97.2/plan-14545a320.json
python3 scripts/recover-menu-save.py
```

The [manifest](evidence/0.97.2/menu-save-0.97.2.json) records target identity,
native byte hashes/bounds, completed REA evidence IDs, decompiler-result hashes,
original instruction paths and table values. Raw slice imports use generic GCC
ABI: their argument names are not Win64 signatures. Original register/stack
instructions bind the formulas above. Some external jump-table destinations in
the complete Save parser are not resolved by isolated raw imports; their original
PE instructions remain authoritative.

Implemented source is **uncompiled and unexecuted**. `current_menu_save.rs` and
the optional-range/gear helpers contain authored cases, not passing test results.
Old0.92 sealed interop vectors remain historical. A current-target import/export
round trip is still needed at a permitted runtime checkpoint.

The complete typed Save schema, all legacy roster/progression migrations and its
exact record ordering are not reconstructed. Unknown rows remain raw in source,
where native parsing may discard or normalize them. Equipment/look normalization
beyond validated ownership remains a separately incomplete adapter. Import UI
selection replacement, including the existing source fallback to a saved Warrior
hero when no Pick exists, is not revalidated here. Base-directory and platform
file helpers retain the historical implementation where their current bodies were
not separately inspected. These bounds prevent a full-save or menu-parity claim.

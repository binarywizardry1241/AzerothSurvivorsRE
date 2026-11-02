# Equipment, cosmetics and Seen persistence — 0.109.0

Target: installed 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the #17 equipment/cosmetic/Seen save schema and its menu/gameplay
outfit consumers. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall status;
[Armory pages](armory-pages-0.109.0.md) owns page controls and catalog recovery.

## Native ownership and schema

The full current Save parser `14589e380..1458a2926` and serializer
`1458a4340..1458a681d` are retained once in the shared
[Save-core evidence](evidence/0.109.0/save-core/manifest.json). The equipment,
Seen, getter and outfit leaves have canonical original-VA assembly, Ghidra
pseudocode, byte hashes and evidence/profile identities in the
[equipment manifest](evidence/0.109.0/save-gear/manifest.json). Raw-range Ghidra
imports do not infer the original function ABI; register/field claims below use
the current assembly and bounded instruction replays.

`items|` accepts decimal u32 tokens only when the current synthetic descriptor
constructor accepts the ID, then sorts and deduplicates them. The retained
historical `save-gear-0.97.2.json` schema and all 581 appearance records remain at
their actual extraction provenance; the current Armory catalog check revalidates
all current class/weapon/slot/rarity bounds, metadata and display fallback values.
Ordinary starter items and tabards are not synthetic collection ownership.

`equip|class|slots` and `look|class|slots` require exactly three pipe fields.
Class parses as u8, including values outside playable classes. Each comma token
must contain a decimal slot in 0..18 and a u32 item ID. Numeric `+` prefixes and
leading zeroes are accepted; numeric whitespace, negative values, overflow and
extra colons are rejected. Item identity/class/ownership validation happens in
the getter, separately from row parsing.

Class records retain first encounter order. Repeated rows update only provided
slots; the last valid provided value wins. An equipment zero clears that lane.
A cosmetic zero is a present override that hides the lane. Valid empty rows
still create a class record. The serializer emits **both** equipment and cosmetic
rows for every class record, including empty rows, with ascending slot indices;
it omits zero equipment values and retains explicit cosmetic zeroes.

`seen|` accepts nonempty keys and u8 qualities, clamps qualities to4, sorts keys,
and merges duplicate keys by maximum. Unknown nonempty keys survive. Empty,
negative, overflowing and malformed qualities are ignored. Outer line whitespace
is trimmed, while whitespace inside a key remains part of that key.

## Getter and outfit source corrections

Current getter `1458a3e40` copies the requested class record, adds earned/purchased
tabards to the validation ownership slice, and sanitizes its 19 equipment and 19
optional cosmetic lanes. Validator `14589bc20` requires synthetic metadata to
match both class and paperdoll slot, followed by owned-ID membership. Tabards
90001..90006 and90011..90024 bypass synthetic metadata only in lane18, while
still requiring the earned/purchased membership. A cosmetic zero and an exact
starter ID for the requested race/class/slot survive without collection ownership.
The getter does not mutate other stored class records.

The reconstruction now centralizes typed rows in `save/gear.rs`, uses that parser
for canonical write-back and `Save::seen`, and projects the active class/race
before menu actions, previews and run entry. `GearSave::apply` retains class order,
empty records and unselected class values. It also retains a newly stored empty
class record when a default-look action creates one. The validator accepts both
saved PvP faction IDs; collection ownership and stat effects retain their saved
identities. Tabard availability reuses Rewards' existing account/catalog predicate.

Current outfit composer `1459a4710` starts with the exact race/class baseline,
applies nonzero equipment, then present cosmetics in **all 19 paperdoll lanes**.
It converts displayed PvP IDs for Horde races and clears the offhand when the
final synthetic mainhand descriptor has inventory type17. Ordinary starter IDs
do not pass that synthetic descriptor. Current custom-menu publisher
`140161442..14016145d` additionally clears ranged lane17 whenever either hand is
nonzero; that extra suppression is kept separate from the gameplay outfit.

Both menu preview and gameplay outfit construction now consume this shared
resolver. The preview request carries19 lanes, replacing its former10 collection
lanes plus a separate tabard override. This fixes legal imported shirt/ranged
cosmetics and worn tabards. Ordinary starter overrides resolve through the
starter metadata instead of removing a slot and failing synthetic-only lookup.
The real client receives matching display, inventory, metadata and item-entry
lanes; hidden lanes remain absent.

## Checks and limits

`python3 -B scripts/check-save-gear.py` verifies the current installed hash
and retained evidence, then executes original instructions for:

- 154 slot-token inputs, including overflow and malformed delimiters;
- four complete native class-row passes with duplicates, empty records and invalid fields;
- 18 complete native Seen passes with duplicate keys and quality edge cases;
- eight native equipment/cosmetic slot serialization vectors;
- 750 current class/slot/ownership validation cases and 36 full getter cases;
- 360 full19-lane outfit vectors across all 72 race/class baselines;
- four menu-only hand/ranged suppression cases;
- the complete default Save serializer, which returns exactly empty plaintext.

Fixtures provide allocation/free, byte operations, Unicode trim, numeric
formatting, already revalidated item/starter metadata and tabard gate results.
The Seen sorting seam orders32-byte records before the **actual native duplicate
reducer** executes. The descriptor and tabard predicates are explicit boundaries;
these vectors do not revalidate their entire backing engine/progression systems.
Every unexpected native call is rejected. The full default serializer needs no
external calls or formatting fixture. A default-only result does not by itself
prove equivalence with the ordinary-write backup default predicate.

Rust regression vectors cover typed parsing/write-back, getter validation and
full outfits. Rustfmt syntax parsing and source/type review ran; Rust tests were
not compiled or executed. No compiler, application build, game launch, GPU image
comparison or gameplay validation ran. The shared engine's broad current-target
coverage remains separately owned by #41. Actual input/file IO, all rendered
combinations and original/rebuilt gameplay parity remain unverified.

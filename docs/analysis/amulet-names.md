# Generated amulet names and inventory consumption

The temporary inventory publisher previously looked up the complete English
composite, such as `The Reaper's Amulet: Execute`. The current native constructor
instead translates its prefix and ability component before storing the name.
When only those component keys were translated, the inventory row and treasure
card stayed English while the timer displayed the translated name.

The shared `Localization::amulet_name` now supplies timers, temporary inventory,
both offered and replacement treasure-card names, and generated provenance names
in addon/Discord meters. Generated definitions
carry their actual `ability_key`; shared amulets and ordinary timer/talent names
retain literal lookup. The source preserves the native constructor exceptions:

| Definition | Native name lookup |
| --- | --- |
| Ordinary generated amulets | Localized prefix plus `ability.<key>.name`, falling back to the descriptor name, joined with `: `. |
| Renew | Localized prefix plus the literal key `Vampiric Renew`. |
| Rejuvenation | Localized prefix plus the literal key `Vampiric Rejuvenation`. |
| Demonic Empowerment | Single literal `The Legionlord's Medallion`; no composite split. |

Present but empty translations remain empty. A translation for a full composite
or an ordinary literal ability name does not replace the constructor's distinct
keys. The Legionlord's single name is itself its literal key.

## Current native evidence

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [proof](evidence/0.115.0/amulet-names.json) reuses the current factory
`0x14583d3e0` and canonical common-tail extract from the
[timer name proof](evidence/0.115.0/addon-timers/generated-name-cases.json).
No constructor assembly is duplicated or re-extracted. The canonical probe
class is reused by its AST node and exact source commitment.

All **113 generated English constructor names** match the current source data,
including the existing Soulfire spelling override and the appended Legionlord
definition. Eight translation scenarios for every constructor produce **904
bounded original-instruction cases**. These test missing keys, separate and
combined translations, empty components, and ignored alternate keys. Two
additional declared storage seams model successful byte-string allocation and
`memcpy` for the three special definitions. Locale lookup, formatting, vector
storage and frees retain the existing probe's explicit seams. Effects, generic
allocation behavior and complete catalog/combat equivalence are not inferred
from these naming cases.

The current inventory owner is independently located and byte-checked at
`0x14597e730..0x14598081c`. Its accepted-row copy preserves the constructor's
name String at payload `+0x18`, stored at **Game+0x3c8**. The inventory name
slice `0x14597f80d..0x14597f91c` reads picks from **Game+0x418**, formats a
Roman suffix or ` X+`, and concatenates it with that already constructed name.
There is no locale-lookup call in this slice. **104 bounded inventory cases**
cover picks 0 through 11 and `u32::MAX`, eight distinct names, empty components
and Unicode. Formatting is a declared seam; the real consumer instructions,
rank decisions, operands and templates execute.

The source adapter resolves the same construction parts when publishing its
English semantic descriptors. It does not add a new reward constructor, change
item identity rules, mutate gameplay, or change the rank suffix. Actual language
changes between construction and publication, native object lifetime, item
queries/tooltips, card interaction and rendering are not replayed.

## Meter and Discord provenance

Current resolver `0x145908860..0x145908c65` reads the 40-byte provenance rows
from **Game+0x850/+0x858**. Its three admitted effect-context paths copy or
borrow the stored name and preserve its icon/proc flag. There is **no second
locale lookup** in those paths. The separate named-pet branch still has its
own lookup. Three direct current caller sites are byte-bound in the proof.

The canonical current effect rebuild already clones the constructed name at
Game+0x3c8 and passes it with the icon to `1458ddbb0`; that metadata appender
copies the five words into the vector used by the resolver. Reusing those
extracts, **2,712 cases** pass every constructor scenario through the current
appender and complete resolver in context kinds 0/1/3. Every output preserves
the constructed name, icon and `talent=true`, with zero resolver locale calls.
Three further cases preserve the literal `Melee`, `Pets` and `Talents` fallbacks.
Synthetic generic effects admit these names to the interface; this does not
claim every generated definition produces a live generic effect.

Source accounting retains the English semantic name, icon and talent flag.
Its actual amulet producer fills those fields from the static Definition.
The adapter therefore recognizes only `talent=true` plus the exact generated
catalog name/icon tuple, then applies the shared construction rule. All **113**
current generated native/source tuples are unique and disjoint from all **355**
current native and source talent tuples. This handles retained meter rows after
amulet replacement without inferring identity from the current worn item,
translated text or a name substring. Shared amulets, talent/pet/spell/fallback
arms retain their existing source paths. `meter_line` now delegates its admitted
`(name, talent, total)` tuples to shared `meter_totals`; the reviewed extraction
preserves grouping, accumulation order, stable sorting and output precision.
Discord calls this same source-name adapter. Compilation and execution of the
shared aggregation remain unverified.

## Source integrity and validation

```sh
python3 -B scripts/check-amulet-names.py
python3 -B scripts/check-amulet-names.py --parse-source
python3 -B scripts/check-addon-timers.py --contract bridge
```

The new check reproduces all **3,723** bounded cases, verifies current native
owner/slice/template and import identities, and checks scoped source fragments
for the shared helper, its `Localization` wrapper, timer/inventory consumers,
two treasure-card statements, the generated meter identity adapter, current
aggregation source, Discord reuse and the existing Soulfire override. The
aggregation proof's `unchanged` field compares a selected staging source with
the current checkout baseline; its snippet hash records the reviewed current
helper/wrapper, without claiming byte identity with an earlier source revision. Selected
snippet hashes avoid unrelated whole-file source drift. Six changed/new Rust
files syntax-parse through the existing project `rustfmt` on stdin with
`skip_children=true`; the bridge script parses through Python AST. This invokes
no compiler, Cargo, module/dependency traversal or Rust test.

Two Rust regressions are authored and **uncompiled/unrun**: one compares the
shared helper with all 904 native naming cases; the other preserves ordinary
literal lookup and empty values. The timer's wire regression remains in its
own module. The timer bridge guard now follows the shared naming helper; the
original **499** timer native cases, their recorded scope, extracts and hashes
remain unchanged. The 904 naming cases overlap that older naming coverage and
are not added to it as a count of distinct observations.

No fresh Ghidra query, compilation, application, network/server/co-op execution
or original/rebuilt parity comparison was run. This proves the bounded naming
and inventory interfaces; complete source/native semantics and runtime parity
remain unverified. The explicit meter provenance proof above owns that separate consumer
boundary. Original semantic aura-alias names remain unchanged.

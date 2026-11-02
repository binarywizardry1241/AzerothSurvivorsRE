# Cooperative recipient item text — 0.115.0

Target: installed `AzerothSurvivors.exe`, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
Gap #101 owns the recipient item-description connection; #63 owns cooperative
integration and #41 retains wider native dependency/alias discovery.

This is historical 0.115.0 evidence. The [0.118.0 registry investigation](coop-item-registry-0.118.0.md)
owns the newer bounded recovery; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status.

The source now constructs ordinary item names, effect lines and lore using the
querying member's catalogs. Initial and ongoing temporary jewelry/amulet
publication also uses that member's language. The selected locale and rebuilt
catalog are cached per member, using canonical English keys and loaded overrides;
this does not select a host language or write `language.txt`. Dynamic queries
return their cached strings rather than translating already translated text.

Two required identity dependencies now follow the current EXE: temporary item
entries use one process-wide atomic counter across local and remote publishers,
and remote template construction interns effect strings in the same persistent
`LocalItemDescriptions` resource as the local client. Per-member counters could
assign the same entry/GUID to different jewelry, while per-member registries
could reuse a synthetic spell ID for different text. Both identities must survive
member removal/reconnection independently of a member's catalog cache.

**The entire gap remains open.** Recovery has not established how the guest's
process-local synthetic effect-text registry is populated from host item
responses. The known host constructors and engine delivery path alone do not
supply that bridge. No additional transport was inferred. The source corrections
above do not establish rendered guest effect text, complete item localization,
compilation or original/rebuilt parity.

## Current native contract

The [range/query manifest](evidence/0.115.0/coop-item-text/manifest.json) binds
selected PE bytes, durable Ghidra results and canonical supporting evidence.
Raw decompilation retains incoming-register and external-signature limitations;
addresses and byte commitments, rather than guessed C parameter names, identify
the contracts.

| Owner | Observed contract and source consumer |
| --- | --- |
| `1458dca70..1458dcbcc` | Installs recipient locale in TLS `+330/+338`, calls remote request owner `145873b00`, restores prior locale. `coop_commands.rs` resolves `NativeHero.bytes_30` for the item query. |
| Request table `14702e47c`, opcode `56` → `145873da2` | Ordinary constructor `1458cfdf0`; otherwise actor-specific dynamic lookup `14586e360` → `1458eac30`, descriptor `14586e2c0`, serializer `1459b1d90` or unknown-item response `1459aeda0`, then response routing `145894b80`. Requested ID determines ordinary faction/template identity. |
| `1458dc460..1458dc724` → `14597e730` | Temporary item publication occurs inside recipient locale scope. Current generated-name/rank proof remains canonical in [amulet-names.json](evidence/0.115.0/amulet-names.json). `RemoteInventory::publish` constructs and caches recipient-localized rows at initial sync and after simulation. |
| `1458eac30..1458eb0dd` | Searches current `Game+370/+378` rows by entry; clones stored name/full text. No semantic re-render of a historical item is implied. |
| `14597fd83..14597fe68`, `14597ffe0..14598000c` | Dynamic identity compares slot/name/quality/full text. A process-wide `LOCK XADD` at `148217140` allocates `900000 + old_counter % 100000000`, with u32 wrap. `Publisher` now shares the corresponding atomic. |
| `1459b1d90..1459b40a1` | Opcode `58` serializes item name, effects as synthetic spell IDs and flavor. Four effect lines remain separate; the fifth joins remaining lines with literal `\nEquip: `. Existing `Item::template` supplies those fields. |
| `1459a8f50..1459a9152`, `1459a91f0..1459a932c` | Process-global exact-string interning at `1482147e0/e8/f0`, IDs `f00000 + index`, and optional lookup. Empty/embedded-NUL strings and distinct Unicode byte sequences retain exact identity. Remote queries now use the shared local registry. |

The previously named transformer `1458d69c0` scopes locale around `1459b0520`;
that latter function handles only chat opcode `96`, subtypes `0c` and `5a`.
Other opcodes return the unchanged-packet sentinel. It is **not an item-text
transformer**, so its bootstrap call cannot prove an item localization bridge.

## Remaining registry bridge

The current engine registers registry lookup at `14012f9e0`; the description
consumer at `140c419d0` calls it and falls back to its ordinary spell catalog
when the ID is absent. The interner's observed direct caller is the item
serializer, and reviewed direct storage references are the interner and lookup.

Synchronized guests forward item query `56` upstream. The retained receive owner
[145896520.asm](evidence/0.115.0/coop-replication/145896520.asm), engine branch
`145897010`, admits opcode `58` and supplies its unchanged opcode/body to the
local callback at `14589780b`. This path does not carry or intern the referenced
effect strings. Independently recovered wire11 remains a seven-string spell
metadata record; its existing producer/consumer does not prove an item registry
carrier.

The remaining static question is the producer/consumer or shared interface that
populates the receiving process's registry for these IDs, including lifetime and
cross-member identity. The native registry, item serializer, recipient query and
temporary publication, lookup registration/consumer, guest forwarding and
engine delivery routes have been followed. Unresolved aliases/indirect or other
native producers cannot be replaced by a new envelope or by appending item rows
to wire11. No original-game missing-tooltip symptom was reproduced, and these
static observations do not establish an original-game defect. Guest registry
population remains a specific recovery blocker under #101; unrelated native
engine unknowns are not its completion checklist.

## Static validation

- `python3 -B scripts/check-coop-item-text.py` verifies selected-target
  range/extract commitments, recipient catalog construction, all three live
  query/publication paths and shared registry/counter source boundaries.
- `python3 -B scripts/coop_item_text_native.py` executes only admitted current
  interner, lookup, serializer and counter instructions in Unicorn with explicit
  allocation, clone/join and byte-operation seams. It covers exact string
  identity, Unicode, missing IDs, all zero-to-eight effect-line counts, the
  fifth-line join, i32 health encoding and C-string embedded-NUL boundaries.
  Complete decoded packets are checked, including every retained field. This is
  bounded instruction evidence; it does not execute the game or a network.
- Five changed Rust modules parse through the installed Rust formatter without
  compilation. Three new Rust regressions cover recipient fallback/isolation
  and cross-member/reconnection entry identity; they remain uncompiled/unrun.

Historical item definitions, numeric/text expression checks and catalog proof
retain their actual targets. Current serializer/locale/identity recovery is not
blanket revalidation of all historical item constructors or effects. Compilation,
source/ECS execution, host/guest mixed-language queries, Lua reload, rendered
text and original/rebuilt behavior/presentation remain unverified.

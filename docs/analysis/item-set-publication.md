# Character-pane set publication

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the item-query and local-client connection for **#234**.
[verification-needed](../verification-needed.md) owns the overall finding status; the
[set core](sets-source.md) owns identity, activation and descriptors.
The [publication proof](evidence/0.121.0/item-set-publication/manifest.json)
binds six durable Ghidra queries, original ranges, source connections and
isolated member-constructor cases. No application or rebuilt source executes.

## Native connection

| Owner | Recovered interface |
| --- | --- |
| `145b111b1..145b11289` | The actual item-query suffix passes the requested item ID to `145ac19f0`, stores the returned set ID at byte84 of the existing88-byte response input, and passes that input to `145b81a20`. Health remains byte80. The raw-slice decompiler cannot follow the out-of-slice switch table; original instructions establish this selected field connection. |
| `14007e9f0` | The client metadata callback calls `145ac1180` and transfers the successful three-vector/string record (nine64-bit words); the absent discriminant stays rejected. |
| `145ac1180` | The separately retained core query decodes the synthetic set ID and registers count4/count8 bonus rows. Their text includes star thresholds1 and3, with empowerment threshold5. This record has no live per-piece star input. |
| `145c86fb0` | Builds the ordered eight armor IDs from class, tier and faction flag. IDs are `100000 + class*1000 + slot*100 + tier*10`, for slots0–7. Only a valid PvP digit5 item receives an extra10 when the Horde flag is set. |
| `145b04610` | Names the normal tier through the class set-name table and localization key. The PvP title uses its canonical class name: Field Marshal's except Shaman's Warlord's. The separate Horde flag affects member IDs; this helper does not receive it. |
| `1402b7530` | This is the custom Armory SetTip help formatter. It distinguishes the four/eight-piece help, class star cap and eight-owned-piece check. It is separate from the character-pane FrameXML item tooltip. |
| `1402afa80` | Joins the tier's localized source-zone names with the exact four-byte UTF-8 delimiter ` · `. The tier/zone policy is shared with saved star progression. |

The count4 text uses the exact native key
`{bonus} (pieces at {stars}+ stars)` with stars1. Count8 uses
`{bonus} (all eight at {stars}+ stars; half again as strong at {max})` with
stars3/max5 and the ordinary class/tier descriptor. The four-piece description
joins the native tier's compact stat descriptions with literal `, `.
Current descriptor display values are integers or exact halves, so the shared
native decimal formatter preserves their current values.

The existing engine tooltip counts actual worn member IDs. Ownership of an
unequipped item does not contribute. The metadata contains the star requirements
as text; this connection adds no invented rank-based color gate to the generic
FrameXML tooltip. Actual displayed colors and interaction remain unverified.

## Source path

[`inventory.rs`](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs)
puts the real synthetic ID into `ItemInfo.item_set`, using the recovered shared
`sets::item_set_id` and existing item decoder. Starters, temporary jewelry,
tabards, cosmetics and nonarmor items keep set0. The local metadata producer
supplies63 class/tier/faction records, each with eight named members and the
four/eight-piece text. It also runs for a cooperative guest, whose item templates
are delivered by the host. Metadata stays cached across runs and ReloadUI;
changing the selected language replaces it.
The optional embedding identity normalizer uses the shared native decoder;
accepted high-prefix aliases resolve the same canonical metadata, preserving
the original lower-bound and low-byte/nibble behavior.

[`LocalItemSets`](../../crates/benilla-app/src/local_client/item_sets.rs)
is the narrow embedding interface. The existing
[`feed_item_sets`](../../crates/benilla-app/src/ui_items/feed.rs)
resolves a supplied local record before its ordinary DBC lookup and republishes
previously requested local records when the metadata changes. The existing
FrameXML/tooltip renderer, equipment count and member-name presentation remain
the consumers. No replacement character panel is introduced.

The producer shares the Armory's set-name and compact-stat formatters and the
set module's four-piece data. Its four/eight-piece description bodies also use
the shared Armory helpers, with the exact tooltip wrappers applied afterward.
Item queries use the same `effects_at_stars` projection as gameplay and the
native frozen-first rank lookup described below. Native
`item.upgraded`/`item.not_upgraded` text publishes the selected rank out of5.
Gameplay activation and spell/stat consumers are
documented in [worn set consumers](set-gameplay.md); star save/wire
inputs have their own owners under #229/#238. A tooltip entry alone does not
establish those behaviors.

## Item-query rank, effects and flavor

The selected item request is opcode `0x56` in packet-handler owner
`145b0f580..145b1243d`. The existing retained raw query covers its entry and
entire selected item-query prefix/response branch through `145b112ae`; it is
not a complete decompilation of that multi-opcode handler. Its external switch
cell at `147664324` selects the original item arm. The
[rank/field proof](evidence/0.121.0/item-set-publication/item-query-ranks.json)
also binds the complete frozen-rank helper `145bad070` and equip-line mapper
iterator `145c6eb70`.

At `145b0ffa5..145b100bf`, local queries first try the actual Game's equipment
lookup. `145bad070` scans all nineteen nonzero equipment IDs at `Game+300` in
slot order, applies the hero race's normal PvP faction conversion, and compares
that displayed ID with the exact requested ID. The first match returns the
parallel rank at `Game+35c`, including a valid rank zero. This is independent
of whether an item object/template has already been published.

Only a local lookup miss falls back to the persistent star rows at
`AppState+12b0/+12b8`. It canonicalizes a valid PvP digit6 ID and binary-searches
the sorted eight-byte `(u32 ID, u8 rank)` rows. The persistent identity is
independently established by the retained command dispatch and star-purchase
proofs: dispatcher adds `0x1110` to AppState before `145ab44d0`, whose star-vector
fields are `Save+1a0/+1a8`; the writer emits `stars|`. Remote queries require
the admitted route/peer/Game guards, select that hero's frozen lookup and use
zero for a miss. They do not read the host's saved star map.

Source `Mechanics::item_star_rank` implements that ordered optional lookup.
The local consumer uses `Some(0)` directly and calls `Save::star_count` only
for `None`. The remote command consumer obtains the rank inside the existing
`with_party_hero` state swap and passes it to the common item constructor.
Catalog templates are reconstructed from those inputs on every query;
published records are only a fallback for the existing generated run items.

The stat/flavor connection is also explicit in the original branch:

* `145b10861` checks upgrade eligibility. For an eligible nonzero rank,
  `145b10881` calls `145aff210(requested ID, selected rank)` and replaces the
  base effect vector with its projected result. Rank zero keeps the base rows.
* `145c6eb70` visits that vector in order and retains the equip-line mapper's
  successful strings. The mapper's tag2 arm is absent; health instead uses
  `145b110bd..145b111b1`, which rounds each tag2 value, saturates its `i32`
  conversion and wraps the sum. The serializer input receives that sum at80.
* `145b108ee` selects `item.upgraded` with `n=rank, of=5`, or
  `item.not_upgraded` with `of=5` for rank zero. Its constructed string's
  pointer/length enter serializer input32/40. The same suffix passes equip-line
  pointer/count at16/24 and set identity at84 to the existing88-byte response
  constructor `145b81a20`. Ineligible descriptors use the branch's empty flavor.

The additional check executes267 original-instruction cases covering truncated
request decoding, every frozen slot, Horde/Alliance identities, duplicate first matches, valid zero
ranks, local save fallback, remote guard/miss behavior, flavor key/arguments
and rounded/saturated health accumulation. It separately replays the frozen
lookup before substituting that Option result at the handler's helper seam.
The original remote hero swap, string allocation, serializer and wire exchange
remain outside that isolated replay.

## Custom Armory help

The selected-piece set rows and Character active-set summaries also consume
the current set data. Their native direct callers are `1400c8c60` and
`14011a0b0`; they pass the actual worn/star-qualified count to `1402b7530`.
The collection summary's owned-count badges do not establish another help
registration. Source keeps those ownership and worn-count interfaces separate.

[`set_tip.rs`](../../crates/azeroth-survivors-re/src/armory/set_tip.rs) formats
the native title and ordered help rows: clamped qualified count, star-cap
requirement or unlocked cap, then a missing-armor hint only when fewer than
eight are owned. It reuses the saved star-cap/tier-zone policy and the current
Heroic rank naming helper. Zone labels retain the native ` · ` separator.
Selected-piece help exists for incomplete bonuses; Character active bonuses
have their independent help registration. The dedicated consumer uses the
existing shared tooltip frame/placement with all native help rows preserved.
Those frame primitives retain their historical presentation provenance;
current rendering, placement and input parity remain unverified.

## Static verification and limits

Run the existing dependencies without compilation:

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-item-set-publication.py
PYTHONPATH=runtime/tests/query-python-deps:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-item-query-ranks.py
```

The check executes the original member-list constructor in an isolated
instruction emulator for108 class/tier/faction cases, covering63 unique set
records and40,716 original instruction steps. Allocation and its no-op shim are
explicit synthetic seams. It checks every produced member against the actual
source catalogs, verifies all six native query subjects against the full
installed target, checks the item-query field connection and metadata consumers,
and parses eight changed Rust source files with the pinned formatter.
The shared Armory file is bound by exact set helper scopes and integration anchors; unrelated account and purchase bodies are excluded. Syntax parsing does not resolve types or execute Rust.

Application compilation, Rust tests, item-query wire execution, FrameXML/UI,
cooperative delivery, rendering and original/rebuilt parity remain unverified.
The installed EXE/Data, saves and settings were read-only inputs.

The shared-registry side effect of this same metadata callback is now connected
under [#254](coop-item-registry.md): accepted set demands intern bonus
text in first-request order through the persistent item description registry.
This preserves the existing direct text presentation; it does not establish
#101 host-to-guest item-effect delivery or runtime/parity.

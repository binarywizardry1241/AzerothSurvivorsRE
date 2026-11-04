# Lobby hero inspection in 0.141.0

Finding [#299](../CURRENT-STATE.md#gap-299) covers the 0.128.0 inspection
claims retained under [R01280-00 through R01280-05](release-review-0.139.0.md#work-299).
This recovery uses `installed-game/AzerothSurvivors.exe` 0.141.0,
151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
These bytes match the registered 0.141.0 target.

## Roster appendix and subject

The existing tag 17 writer at `0x146050ab0` serializes rows with native
stride `0x1f0`. It writes zone and rank followed by the parallel country
strings at `0x146050e86..0x146050ee3`. The loop at
`0x146050ef0..0x14605168b` then writes one inspection record per roster
row, in the same order. Each record begins with a presence byte. A present
record contains, in wire order:

| Field | Encoding | Writer witness |
| --- | --- | --- |
| Character appearance | Sex followed by five feature bytes | `0x146050f1a..0x146050f88` |
| Worn equipment | Nineteen little-endian `u32` IDs | `0x146050f89..0x146051114` |
| Looks | Nineteen little-endian `u32` IDs, using all ones for absent and zero for hidden | `0x146051115..0x146051450` |
| Stars | Nineteen bytes | `0x146051456..0x1460515f6` |
| Weapon glow | Little-endian `u32` | `0x1460515fc..0x146051606` |
| Talent allocation | Length-prefixed UTF-8 | `0x14605160c..0x14605161d` |
| Earned achievements | `u32` count, then `u16` ordinal and `u32` UTC timestamp per row | `0x146051623..0x146051672` |

The reader uses tag 17 in `0x14604a510`. After the country pass, each
entry at `0x14604c7f4` can end at EOF without a presence byte.
Once admitted, it reads the entire record, normalizes nonzero sex to 1
(`0x14604cf1f`), clamps every rank at 5 (`0x14604cc06..0x14604cd31`)
and decodes the appearance sentinel independently of the worn ID.
The reconstructed reader retains bounds checks before allocating dated
achievements and rejects a truncated admitted record. The native host driver
constructs decoded variant 17 at `0x145ea64dc` and submits it through the
common writer at `0x145ea6514`.

[The roster codec](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
uses the bounded appendix. The host builds it from each admitted Hero's
appearance, equipment, talent allocation and earned dates in
[`roster_row`](../../crates/azeroth-survivors-re/src/gameplay/coop.rs).
The existing snapshot equality includes the new fields, so an inspectable
change reaches joined guests through the ordinary roster publication path.
The optional staff vouch is separate. Private Hero inputs such as pity,
unlock ranks and companion perks do not enter the inspection record.

## Read-only screen

The native lobby row caption `Inspect ›` at `0x14035d8ea` follows the
inspection-presence sentinel at `0x14035d8df`. The selected identity is
looked up in the current lobby roster at `0x1400e50f0..0x1400e510c`.
The lookup requires an active lobby and returns the absent sentinel if the
member is gone. The screen owner at `0x1401c6bf0` clears retired content
or queues construction. The reconstructed row action holds the same member
identity and reads the latest roster data instead of retaining an old copy
on click. Closing inspection returns to the lobby, and losing the member or
starting the run retires the inspection UI. Ping and country changes alone
do not invalidate the inspected panel.

The outer layout uses the 1560 × 880 canvas and 1.5 scale limit from
`0x1403ba7a0`. The panel at `0x1403bd5b0` uses 28 and 18 px padding,
a 12 px gap, and dispatches Character, Talents and Achievements at
`0x1403bdc87` using screen byte `+0x12`. The header at `0x1403bb770`
uses `armory.tab.character`, `picker.talents`, `armory.tab.achievements`
and `Close`, and carries the hero name, role, sex, race, class, spent
talent count and achievement points.

The paperdoll owner `0x1401bb330` emits side slots
`[0, 2, 14, 4, 8]` and `[9, 5, 6, 7, 18]`, with a 380 px equipment
summary. The 440 × 560 model region at `0x1403be5f6` includes
`armory.drag_to_turn` and emits weapon lanes `[15, 16, 17]` at
`0x1403bf9a3..0x1403bf9cf`. The item builder passes 50 px at
`0x1403c0155`. The ranked tooltip at `0x1401b9200` reads the inspected
rank and references `armory.card_bonuses`, hidden appearance and shown-as
text. The summary owner at `0x1401ba620` emits the 34 px star total and
the equipment, set bonus and aggregate labels.

The right-hand panel dispatcher at `0x1403ba590` checks the hovered slot
and its worn ID. It maps a nonzero ID through the inspected race and resolves
the item descriptor. A resolved worn item calls the ranked detail renderer
`0x1401b9200` with the existing panel builder. The empty, absent or
unresolved case calls the equipment summary renderer `0x1401ba620` with
that same builder. The source now switches the 380 px sidebar between the
summary and the selected item's details. Slot entities stay in place as the
cursor enters and leaves, preserving the hover that selected the item.

[`coop_inspect.rs`](../../crates/azeroth-survivors-re/src/coop_inspect.rs)
connects these inputs to the shared Armory outfit and rotation,
rank-scaled item and set text, read-only talent trees and the shared
achievement summary, category and date views. The remote model
uses the roster subject and its appearance only. The picker hides its image
while that shared render target is in use. The panel has no save, reward,
equipment or talent mutation action. The [locale commitments](evidence/0.141.0/coop-inspection-locales.json)
bind eleven selected caption and template values per language to fourteen
EXE catalog descriptors.

## Item kind and model stage

Three [guarded switches](switch-context-source-review-0.141.0.md#exact-current-selectors)
select the same descriptor field. The side-slot owner at `0x1401b6420`
resolves the item's race mapping and descriptor through `0x145e30810`
and `0x145e2d890` before dispatch `0x1401b6504`. The detail header and
weapon label dispatch the same `+0x30` field at `0x1401b92f1` and
`0x1403c0ba7`. The seven table cells at `0x14659c884`, `0x14659c8a0`
and `0x1465cbadc` correspond to descriptor tiers 1 through 7. Tier 4
uses the orange branch only for item class 2, read at `+0x58`.

| Descriptor tier | Text RGB | Edge RGB | Detail fill RGB |
| --- | --- | --- | --- |
| 0 or default | .91, .91, .91 | .541, .541, .541 | .165, .161, .145 |
| 1 | .118, 1, 0 | .075, .541, 0 | .067, .161, .047 |
| 2 | .231, .612, 1 | .039, .31, .612 | .047, .11, .2 |
| 3, 4 armor, 5 and 7 | .761, .486, 1 | .42, .122, .659 | .133, .063, .227 |
| 4 weapon | 1, .604, .165 | .698, .329, 0 | .227, .114, .02 |

The side icon uses the edge and an 8 px shadow with text-color alpha .3
at `0x1401b69d3..0x1401b6b99`. The detail header uses edge and fill at
`0x1401b961a..0x1401b96e6`, with fill alpha .8. Its icon is 58 × 58 at
`0x1403bab32`. The name is 17 px at `0x1403bb11f`; the 12 px caption
formats rarity, item kind and slot at `0x1403bb19b..0x1403bb393`. Armor
at tier 4 and all tier-5 and tier-7 items display the Epic rarity label.
The orange weapon branch preserves the Legendary label. The weapon row
writes the matching color into its 14 px name tuple at `0x1403c0d45`.

The descriptor writer normalizes the PvP storage digit 6 to tier 5 at
`0x145e2dd89`; digit 7 dispatches to `0x145e607f0`, which writes tier 7
at `0x145e60a98`. Starter clothes take tier 0 at `0x145e2d34f`.
The cosmetic branch writes tier 1 at `0x145e2dc6c`. The tabard branch
`0x145e2daf6..0x145e2db59` uses tier 2 for IDs 90001–90006, 90016 and
90025, which have a nonempty achievement field at table record `+0x20`.
The other resolved tabards use tier 1. The rebuilt inspector reuses the
existing gear, starter, cosmetic and tabard name owners.

The model-stage constructor `0x1403be530` submits a 440 × 560 UI node.
Its first gradient uses the inspected class color with alpha .16, falling
to transparent at 70% in a centered farthest-corner radial gradient at
`0x1403be8bb..0x1403be9c8`. The fallback class color is the gold tuple at
`0x14659dfdc`. A separate 230 × 44 absolute child uses a 105 px left
offset and a centered closest-corner radial gradient. Its stops at
0%, 50% and 100% are sRGBA `(1,.72,.30,.55)`, `(.55,.30,.08,.24)` and
transparent, converted through `0x145a23420` before drawing. The shared
hero image is layered over the two gradients. The [overlay-order trace](native-interface-correspondence-0.141.0.md#ready-check-modal-construction)
places the inspector at layer 5600 with a black .8-alpha backdrop.

## Shared achievement selection

For the Achievements tab, `0x1403bdd3d` builds a temporary account from the
inspected profile's earned rows. The caller passes the category byte
from the shared menu state at `+0x8f` and a false progress flag to
`0x1402cf3a0`. That owner computes earned counts and points, builds the
ordinary sidebar through `0x140340f90`, then selects Summary
(`0xff`, `0x1402cfdc0`) or Category (`0x1402d18c0`).
The sidebar emits the shared category input payload at
`0x1402ccb85..0x1402ccb8c`. Summary sorts recent earns by date and points.
The category grid filters the catalog by category before passing each card
to the renderer at `0x1402ccdb0`. The false flag suppresses partial-progress
rows in both renderers. The category path installs the scrollbar at
`0x140344891`.

The category builder spawns the typed list at `0x1403445fa`.
The deferred registration at `0x140268ef2` names
`(ChildOf, (AchList, Node, ScrollPosition))`. Its component registration at
`0x1403041a0` uses the exact 128-bit AchList TypeId bytes
`cf0bf8f763784041e70f9d43e78ccd13` at `0x1465bf970`.
The wheel wrappers in the same vtable at slots `0x1465c2b68` and
`0x1465c2b78` call `0x1402e7cd0`. The vtable initializer at
`0x1402ff8e0` builds the query through `0x140520800`; its component
registration at `0x14044dd90` reads the same 16 bytes from
`0x1465ce3e0`.

The current wheel helper retains the [historical arithmetic](evidence/0.92/progression-achlist-wheel.json).
Line events are multiplied by 40 and pixel events by 1. The query has no
cursor gate. It uses the cached offset for a newly added ScrollPosition,
otherwise its live Y value, then subtracts wheel movement and clamps to
the computed content minus viewport extent in logical units.
It writes the cache and updates the component if its value differs.
The exact category-input consumer and native scroll-cache reset across
screen transitions remain open.

The inspector now supplies only the remote earned keys and timestamps to
the shared achievement view. Summary and category controls share selection
with the ordinary achievement page. The category list consumes wheel input
and the shared scrollbar, with the inspector's offset cleared on selection
or subject change.

## Exact static evidence

All addresses are preferred PE virtual addresses. The reader and writer
table cells were checked against the original instructions in addition to
the Ghidra slices. Raw-slice Ghidra output lacks external tables and callees,
and its generic x86-64 calling convention does not establish the original ABI.

| Range | VA | File offset | Bytes | SHA-256 |
| --- | --- | --- | --- | --- |
| Writer country and inspection appendix | `0x146050e86` | `0x6050286` | 2053 | `766a04ede69c91fee4989a3930ffe113f702226252fad575b5716eace7e6b5cf` |
| Reader inspection appendix | `0x14604c7f4` | `0x604bbf4` | 2078 | `7cf95910b790c66aebb40f88f5e82e609122cf71bdd372450ece52da154203b8` |
| Subject lookup | `0x1400e5000` | `0xe4400` | 967 | `94f4b74f067c46c52293951f9e352e06910b7efd53ed4ab471f53c866ae37933` |
| Lobby row | `0x14035bfb0` | `0x35b3b0` | 7216 | `d18837a23c7fc5e43dbe76c083791da67763ba311f88027cce76a4c6c3b78be2` |
| Header | `0x1403bb770` | `0x3bab70` | 6248 | `fd1d9246c1777c3a6cbed86dc1c4e0cac7484f324f5924fc1e24049bc09fb11f` |
| Panel/tab dispatch | `0x1403bd5b0` | `0x3bc9b0` | 2096 | `76011a7e9b6b34f808af9d5e0b2a811ec128cf7f635796d71c4a75288c81d19a` |
| Paperdoll rows | `0x1401bb330` | `0x1ba730` | 2861 | `51fad6b634cc097bd0d3d4602d0ec2080b4af252694c2310630065f9238ab1ae` |
| Model and weapon lanes | `0x1403be530` | `0x3bd930` | 5500 | `8de682a550d9ccf7a03874751b356cbed788d8ef920e6853eb200c4f532c5f9b` |
| Sidebar hover dispatch | `0x1403ba590` | `0x3b9990` | 459 | `6777f47fddaafa93b314a2057eac2265d4da941b532f156a9cd9b854bfb99eed` |
| Side item | `0x1401b6420` | `0x1b5820` | 2164 | `140e9938b4efb75e308beded89df64c47d8ee60103075d92b3538faa51354bc4` |
| Detail palette and body | `0x1401b9200` | `0x1b8600` | 3578 | `3b553a356c35b1829d41eb8d4037c32a239c915b75260009fe697a561fe936a9` |
| Detail caption | `0x1403baa70` | `0x3b9e70` | 2914 | `95c524ffcb3aa67e9fb8b11415b8d5cab80db7133c4c24dfadad4cdd6795cbba` |
| Weapon item | `0x1403c00a0` | `0x3bf4a0` | 4321 | `d300a002040fce12e1b6345e59bc51a5c25675245971cdcdbd2323a58084b91c` |
| Shared Achievements panel | `0x1402cf3a0` | `0x2ce7a0` | 1575 | `cdba95a99a314e95d8cd93a2216f54b8660383556e8391411f8be1ffc416e69b` |
| Achievement sidebar | `0x140340f90` | `0x340390` | 6548 | `3c73e950d73dc7853275c49555450afc327d3ce319730f7ca1912f8b68d5a535` |
| Achievement summary | `0x1402cfdc0` | `0x2cf1c0` | 5117 | `1b22fa055ffe7e8dc8ffb5a4152451d9099dfd34966aa6e03d3a5f5f7a18aeeb` |
| Achievement category | `0x1402d18c0` | `0x2d0cc0` | 2778 | `1bf8dafadb6662a14b2442ad87acb8a1bfe163ed9f81343cafe8b2a8230fb16b` |
| Category grid and scrollbar | `0x1403442f0` | `0x3436f0` | 1551 | `687301dcda8ac20e929ad729c513999a78110288d2cbce428ae08897b749a666` |
| Typed AchList wheel | `0x1402e7cd0` | `0x2e70d0` | 1025 | `0a855876752ca33a8b302e1f8ecb471f3560e2c9c222360527bbda0a5db5235c` |
| AchList wheel wrapper | `0x1402ffba0` | `0x2fefa0` | 608 | `4ab66236b47848ad7581726cade280110bd3eb2e7c7c9bc17d66d364dbdb0e15` |
| Item descriptor producer | `0x145e2d890` | `0x5e2cc90` | 4878 | `b63469aaab9f137a8e4573b7eef1dd52fc5398be4e2c9590e4e3549dd11747ce` |

The completed `analyze_function` results in the shared store have
these exact Ghidra Evidence IDs:

| Owner | Raw slice SHA-256 | Evidence ID |
| --- | --- | --- |
| Writer `0x14604fa80` | `46d27d10ae811ec8a59634a46f4f926b354f8875dc5fd7e1b076869230eb7735` | `ev_79e6ddb9191644b1d02eb6d242402ea3ab9fab7e88c28ec0ef50fc994f2b803d` |
| Lifecycle `0x1401c6bf0` | `1460373ddc06f32e62bd6160e461ff8349ecbfc8b69bd539d7d6c126a366309b` | `ev_85d5b9a1c9d6482e13fd5233f47dc0fc7bacc20f0cbd789ba105efb92277729f` |
| Summary `0x1401ba620` | `4018f763070acd4e8bb5b5872969d0ce4aa42a70f38e4fbb9c6e3f06615ed469` | `ev_39e1d553c0d9476c6817cbc44ec942dee2f7627babe7b364e8408ffad1e8a64f` |
| Item tooltip `0x1401b9200` | `3b553a356c35b1829d41eb8d4037c32a239c915b75260009fe697a561fe936a9` | `ev_716bb32062fa07b756f79adc624c3ba7b8e1c8723f59e152eafc5ae8b3771980` |
| Model stage `0x1403be530` | `8de682a550d9ccf7a03874751b356cbed788d8ef920e6853eb200c4f532c5f9b` | `ev_ce696c208a64e3c1c952e1b7d41e0477f4d7c05c7076cafd872cf626476e417a` |
| Shared Achievements panel `0x1402cf3a0` | `cdba95a99a314e95d8cd93a2216f54b8660383556e8391411f8be1ffc416e69b` | `ev_3b05c74766b187a2f626af76ed4446e919e163a9960e5789b36ea640b7f5705a` |

Fifteen changed Rust paths parse with the pinned formatter, and all 154
locale values match. The fixed two-row Rust regression covers optional
rows, truncation, clamped stars, hidden looks and earned-date byte order.
The three presentation source files parse with the pinned formatter. The
caption check finds all eight selected label keys in each of the fourteen
locale assets. The two new native result digests and raw-slice subjects
match their completed query journals. Compilation and execution of the
wire regression remain open. Live recipient delivery, exact input timing,
model placement and rendered behavior, client/server execution and
original/rebuilt parity remain in [verification](../verification-needed.md#gap-299).

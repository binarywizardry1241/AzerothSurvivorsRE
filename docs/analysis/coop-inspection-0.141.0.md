# Lobby hero inspection in 0.141.0

Finding [#299](../CURRENT-STATE.md#gap-299) covers the 0.128.0 inspection
claims retained under [R01280-00 through R01280-05](release-review-0.139.0.md#work-299).
This recovery uses `installed-game/AzerothSurvivors.exe` 0.141.0,
151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The selected image remains separate from the registered full audit.

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
rank-scaled item and set text, read-only talent trees and earned achievement
cards grouped using the existing category/date owners. The remote model
uses the roster subject and its appearance only. The picker hides its image
while that shared render target is in use. The panel has no save, reward,
equipment or talent mutation action. The [locale commitments](evidence/0.141.0/coop-inspection-locales.json)
bind eleven selected caption and template values per language to fourteen
EXE catalog descriptors.

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

The four completed `analyze_function` results in the shared store have
these exact Ghidra Evidence IDs:

| Owner | Raw slice SHA-256 | Evidence ID |
| --- | --- | --- |
| Writer `0x14604fa80` | `46d27d10ae811ec8a59634a46f4f926b354f8875dc5fd7e1b076869230eb7735` | `ev_79e6ddb9191644b1d02eb6d242402ea3ab9fab7e88c28ec0ef50fc994f2b803d` |
| Lifecycle `0x1401c6bf0` | `1460373ddc06f32e62bd6160e461ff8349ecbfc8b69bd539d7d6c126a366309b` | `ev_85d5b9a1c9d6482e13fd5233f47dc0fc7bacc20f0cbd789ba105efb92277729f` |
| Summary `0x1401ba620` | `4018f763070acd4e8bb5b5872969d0ce4aa42a70f38e4fbb9c6e3f06615ed469` | `ev_39e1d553c0d9476c6817cbc44ec942dee2f7627babe7b364e8408ffad1e8a64f` |
| Item tooltip `0x1401b9200` | `3b553a356c35b1829d41eb8d4037c32a239c915b75260009fe697a561fe936a9` | `ev_716bb32062fa07b756f79adc624c3ba7b8e1c8723f59e152eafc5ae8b3771980` |

Fifteen changed Rust paths parse with the pinned formatter, and all 154
locale values match. The fixed two-row Rust regression covers optional
rows, truncation, clamped stars, hidden looks and earned-date byte order.
Compilation and execution of that regression remain open. Item-kind
color and branch details, inspection-specific floor
lighting, and achievement scroll and selection details still require native
consumer correspondence. Live recipient delivery, model/rendered behavior,
client/server execution and original/rebuilt parity remain in
[verification](../verification-needed.md#gap-299).

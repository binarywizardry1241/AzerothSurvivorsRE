# Achievement appearances and secondary menu scrolling — 0.112.0

Target: installed 0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[verification-needed](../verification-needed.md) owns the remaining #17 boundaries.

The current Rewards page has a fourth **Appearances** destination. Its seven
achievement rewards are recovered in the [cosmetic catalog](../../crates/azeroth-survivors-re/assets/armory-cosmetics-0.112.0.json):
Defias Bandana, Zul'Gurub Mask, Gnomish Mind Control Cap, Gnomish Goggles, Onyxia
Scale Cloak, Glacial Cloak and Dashing Scarlet Cloak. Head items use paperdoll
lane 0; cloaks use lane 14. Their display/inventory fields feed both menu preview
and the existing run appearance resolver. They do not pass ordinary gear decoding
and add no equipped statistics or ordinary collection ownership.

Rewards renders the two native groups with the current translated intro, titles,
achievement name/description, statuses, icons and colors. Earned cards publish
native action 3 with a bounded slot and optional item. Showing an already selected
reward clears its explicit override. Armory's Look footer offers earned rewards
for its selected lane. Both routes use the existing Gear account command, keeping
frontend/backend saves separate and refreshing the preview. The item constructor
sets quality 4; the Showing footer resolves its color to RGB (0.761, 0.486, 1).

Current grant iterator `1459d2a10` admits cosmetics by earned achievement key.
Inventory accessor `1458d4270` appends these grants after owned items and tabards;
class getter `1458da080` normalizes a cloned 232-byte record through projector
`1458d1d40`. The projector requires both the descriptor's exact lane and inventory
membership. Explicit setter `1458d26d0` publishes a class row. Source preserves
this distinction: earned appearances can be shown without becoming gear.

The equipment list, selected talent body, companion looks and Appearances lists
now use the current retained viewport keys `armory-equipment`, `talent-details`,
`rewards-companion-looks` and `rewards-appearances`. Captured Nodes have grow 1,
minimum height 0, automatic width/minimum width/basis and vertical scroll overflow.
Their row gaps are respectively 8, 9, 0 and 8 pixels. Fixed headers and controls
stay outside the scrolling bodies. The Appearance grid has two flexible columns,
8-pixel column gaps and 6-pixel row gaps. Cards use the recovered 40-pixel icon,
8-by-6 padding, 10-pixel gap, one-pixel border and five-pixel radius.

## Static checks and remaining limits

- `scripts/check-armory-cosmetics.py` verifies two descriptor copies,
  all 128 achievement masks, 532 native slot/ownership projections, 21 native
  getter/setter sequences and all seven native item metadata records.
- `scripts/check-secondary-menu-layout.py` captures four card states,
  all four named viewport Nodes and the Appearance grid initializer. Late
  initializers use vector constants traced to current native loads/zeroing.
- [Cosmetic cases](evidence/0.112.0/armory-cosmetics/cases.json),
  [layout captures](evidence/0.112.0/secondary-menu-layout/nodes.json) and their
  adjoining analysis manifests bind original ranges, output and Ghidra identities.
  Allocation, byte services, formatting/localization, ordinary-item rejection,
  baseline outfits, combined inventory and UI publication are explicit seams.

The [current slot producer](armory-slots-0.112.0.md) independently establishes
the complete ordered equipment vector and its earned-cloak gate. Armory exposes
Back third when a cloak is earned; both its Look footer and Rewards select or
clear that appearance through the recovered account command. The shared scrollbar's
wheel/drag schedule, complete historical Armory presentation/input contracts, full save file
operations and original/rebuilt rendering remain separate boundaries. Native
replays run no application, OS/file operation or rebuilt Rust. Compilation,
interactive scrolling, actual persistence and controlled original/rebuilt parity
checks remain unrun.

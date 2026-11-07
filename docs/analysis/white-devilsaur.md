# White Devilsaur switch and allocation

This bounded static follow-up belongs to **#119**, selected EXE SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
[Evidence](evidence/white-devilsaur-leads.json) binds the exact current
records, code, historical source snapshots, Locations, callers and eleven journaled
Ghidra queries. The separately retained
[integration evidence](evidence/white-devilsaur-integration.json) connects
the recovered switch to source and additional journaled native queries.
This report supersedes
the initial [release review](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.117.0.md)'s literal-window pet
candidate; it does not establish runtime or original/rebuilt parity.

## Corrected native pet identity

The initial literal-window search found reads of `0x1472c2fb0` and
`0x1472c2fc0`, immediately before the White Devilsaur name. The complete
descriptor at `0x1472c2fc0` is **Water Elemental**, entry 9517. Its surrounding
references are not evidence of White Devilsaur behavior. The earlier raw
observations remain exact; their candidate label is not a semantic owner.

The complete current White Devilsaur descriptors are:

| Descriptor | Entry | Model/display selector | Scale | Base power | Period |
| --- | --- | --- | --- | --- | --- |
| `0x1472c3a40` | 9530 | 5239 | `f32` 0.3 | 67 | `f32` 1.2 |
| `0x1472c3a00` | 9531 | 5239 | `f32` 0.3 | 60 | `f32` 0.6 |

Both have spell ID, school and special byte zero. Current Raptor is
`0x1472c3980` / entry 9511, base 53, period `f32` 1.2; current Wolf is
`0x1472c39c0` / entry 9510, base 67, period `f32` 1.2. These are recovered
descriptor fields. Equal nominal arithmetic is not measured damage, targeting,
attack scheduling or parity.

## Switch state, points and persistence

The native allocation is a 24-byte ordinary rank vector followed by an
independent byte at **`+0x18`**. It is not another ordinary talent-rank entry.

`145a87320..145a87b24` normalizes ordinary ranks and separately preserves that
byte only for **class 3, Hunter**. Its point checks sum rank bytes at `+8` of
the 16-byte ordinary entries; the independent flag is not added to those sums.
It initializes and retains the flag before ordinary rank admission, including
the empty-vector path. This establishes the bounded point exemption in the
allocation representation, without asserting complete current talent fidelity.

The current reader `145ac4bd0..145ac4dfa` and writer
`145acf5b0..145acf974` both mask that flag by the earned achievement
**`coop:jurassic`**. An absent achievement clears the exposed/stored flag.
The writer first normalizes against the class's earned point budget, then
mirrors the gated flag with the ordinary allocation into the live 40-byte class
row and the selected slot of an existing 104-byte spec record. The three stored
allocations have 32-byte strides. Current `145ac2ed0` reads an active slot through
the gated live reader and normalizes inactive stored slots without that mask.
`145ac31c0` preserves the outgoing live flag and calls the gated writer after
selecting the incoming slot. The source codec, normalized load/format rows,
allocation reader/writer, three specs and backend account command retain those
separate rules. Actual filesystem/class-XP/error scenarios remain unrun.

Current decode `145a86450..145a86658` handles the special key separately from
ordinary numeric ranks. For class 3, it scans comma-separated tokens, splits
at a colon, trims key/value through the existing trim helper, and enables the
flag for the exact `white_devilsaur` key when the trimmed value is **not exactly
the single character `0`**. It returns immediately on an enabling match;
matching zero values continue scanning. This branch is not a numeric u8-rank
parser. The current delimiter helper `145a8f5a0`, paired with the decoder's
actual register inputs, establishes first-colon splitting and use of the whole
remaining value. Thus `white_devilsaur:0:1` enables the switch. Ordinary numeric
rank parsing and the shared Rust UTF-8 trimming implementation retain their
separate boundaries.

Current encode `145a871d0..145a872ef` adds **`white_devilsaur:1`** when the
flag is exactly one, joining it with the ordinary allocation tokens using a
comma. Its key pair, compact `:1` format bytes and comma are bound separately.
The current Save formatter calls this encoder at `145acc5f7`; its stored-slot
loop at `145acc7f3..145acc86b` independently formats the same flag token.
This connects serialization to the actual save owner, without running the
formatter, filesystem or export/import path.

## UI activation and placement

The special constructor `14010ce70..14010d5e1` reads the allocation flag,
publishes the exact `white_devilsaur` inspection key and generates action **4**
only when its supplied enabled gate is true and its read-only gate is false.
The description owner `14010ae80..14010cb9d` has an explicit Hunter/special-key
branch and reads the achievement/replacement prose.

The action dispatcher uses table `0x14617d8b8`. Its generated index 4 selects
`14011a872`: that block flips the allocation's independent byte, calls the
gated writer, rereads the allocation and publishes account command **14**.
Selected index 2 selects `14011a92e`: the clear-ranks/reset-like block creates
an empty ordinary vector while preserving the independent flag, then uses the
same gated writer and account command. These exact selected entries and target
instructions are checked; table length and arbitrary invalid discriminants
are not inferred from adjacent data.

The raw Ghidra input decompile explicitly fails to recover the external jump
table. The case connections above use the current data entries and independently
decoded instruction bytes.

The complete retained instruction inventory resolves the earlier bounded
negative constructor search: `14010e030` calls tree closure `1403588e0`, whose
call at `1403597a2` reaches the constructor. The tree owner supplies the optional
achievement gate only for Hunter/tree zero; other trees/classes carry absent
discriminant 2. The closure captures allocation, inspection, read-only and gate
inputs and calls the special constructor after ordinary cells. Its exact
rectangle is `(292, 459.8571472167969, 46, 46)`, the last column of the bottom
row. It uses `Ability_Hunter_Pet_Raptor`; enabled, locked and active icon
brightnesses are 0.55, 0.22 and 1.0. The flag controls the localized On/Off badge.
The details pane has the point-free status, achievement requirement, replacement
prose and Turn on/Turn off controls. The control remains inspectable when locked
or read-only; mutation requires the achievement and a mutable screen. Reset
clears ordinary ranks while retaining the independent flag.

## Actual pet replacement

`145ab2f90..145ab32be` first collects ordinary talent effects and their parallel
provenance. It then checks the input allocation byte `+0x18`:

- False leaves the collected effects unchanged.
- True removes the **first** raw29 Raptor descriptor and its matching 40-byte
  provenance row. Finding that row selects White descriptor **9531**;
  otherwise the selected replacement is **9530**.
- It replaces every raw29 Wolf descriptor pointer with the selected White
  descriptor. This transform creates no White pet when there is no Wolf row.

Thus the descriptor choices are connected to actual effect transformation,
rather than inferred from their names or arithmetic. The general catalog walk
`145a8b330..145a8b57a` also appends both White descriptors for class 3; that
catalog enumeration alone is not an active grant.

The current pet update inside `145bc4f80..145bc91a8` dispatches the descriptor's
special-zero ordinary target/melee branch. Cadence helper `145bf8650` returns
descriptor `+0x30` directly at `145bf8772`, independently of player cooldown.
Ordinary hits retain descriptor power and publish source 2 through the common
hit/movement consumers. Captured pet-source lookup `145bc0230` also selects
both White descriptor identities. These bounded interfaces support the new
descriptors through existing pet source; they do not promote every historical
generic movement/power/creation contract to the current hash.

The source applies the transform to actual raw29 effects before collecting live
follower grants. Removal also erases the matching generic provenance/meter row.
Additional Raptors remain; a Raptor-only allocation produces no White pet.
The existing dynamic descriptor path connects real unit creation, ordinary
attack/update, movement/packet, attribution and cooperative world publication.
Measured damage, displayed models and whole-run parity remain unverified.

## Creature metadata

The current opcode-0x60 branch is selected by `1472db538[21]` and reaches
`145af96c2`. Its pet-template table `1472db998[20/21]` selects White 9530/9531
at `145afb4f2`/`145afb4d7`. Both join `145afb568`, localize the descriptor name
with raw fallback and the `Companion` subname, and publish creature type 1,
rank 0 and descriptor `+0x24` display 5239 through the existing opcode-0x61
serializer/cache path. The source's special-template table now admits both.

The same current handler's companion lookup `145adab60` admits 9601–9626 via
pointer table `1472d91a0`. New companions 9623–9626 return valid empty name and
subname, creature type 8, rank 0 and descriptor `+0x50` displays
2429/2041/11380/16622. Their six total White/companion source rows reuse the
ordinary `CreatureName` decoder/cache/FrameXML route. Empty names remain distinct
from an unknown-template miss. This is #117's necessary metadata dependency;
its reward ownership remains with the party-rewards report.

## Ownership, source and checks

The current diagnostic ledger supplies independent Rust Location receipts:

| Native owner or edge | Current ownership evidence | Existing source counterpart |
| --- | --- | --- |
| `14010ae80` | `screens/talents.rs` Location `14617bbd0`, line 806:18, read at `14010cb87` | `talents.rs::input/apply_action`, special switch/details and shared read-only view |
| `145acf5b0` | `save.rs` Location `1472ce900`, line 832:13, read at `145acf95d` | `save/talents.rs::set_talent_allocation`, flag/gate and selected-spec mirroring |
| `145acb970` | `save.rs` Location `1472ce810`, line 603:48, read at `145ace0f1`; encoder call `145acc5f7` | `encode_allocation`, `talent_text`, `spec_text`, special token retained |
| `145a85b80` | `talents.rs` Locations `1472a5800/5818`, line 756; called by effect transformer at `145ab3001` | Existing ordinary talent/effect collection in `gameplay/mechanics/effects.rs` |
| `145a87020` | `talents.rs` Location `1472a5258`, line 990:47; ordinary learn path calls through `145a86e30` | `spent/tree_spent/previous_rows` and ordinary rank admission |

Reader, normalizer and transformation roles are also supported by exact caller
and data-flow edges. They do not each have their own direct diagnostic Location;
those role associations must not become invented filename ownership. Locations
identify bounded native owners, not whole-module semantic or source closure.

Source `Allocation` uses the serialized key as an explicit independent lane:
catalog-driven point/rank calculations exclude it, Hunter normalization retains
it before ordinary admission, and the save reader/writer applies the earned-key
gate. Serialization appends the exact compact token after ordinary ranks.
Specs, normalized plaintext and backend account command use that same owner;
the cooperative profile producer uses the shared encoder. The special switch
does not enter ordinary spell-display talents. The source's historical
`talents.json` descriptor pointers are translated at the existing source-data
boundary, with their original provenance, before White replacement. This avoids
treating old addresses as current runtime pointers.

`python3 -B scripts/check-white-devilsaur-leads.py --require-retained-queries`
passes the exact reviewed proof, **34 native spans**, historical source receipts,
five pet records including the rejected Water Elemental candidate, selected
action 4/2 entries, three bounded diagnostic-module receipts and **11/11**
retained query receipts. Source snapshots retain the pre-implementation state;
their drift is reported explicitly, and `--require-original-source` remains
available for strict historical replay. Without the retained-query option, missing local query payloads are
explicitly reported as checks not run. Earlier Capstone boundary decoding and
manual data-flow review remain separate from this portable byte/receipt check.

`python3 -B scripts/check-white-devilsaur.py --require-retained-queries`
passes **19** additional target-bound code spans, **3** selected dispatch entries,
**16** data fields, the two White descriptors, **26** source connections and
**28/28** retained query receipts. It also checks the actual live ordinary grant
pointer identities, 63 retained selected instructions and parses seven Rust files
through rustfmt/stdin. The shared effect file is bound only by the
`configure_effects` fragment, keeping unrelated numeric refresh work outside this
proof. It does not compile or run the Rust source. Authored regressions cover point exemption,
class/earned gating, first-colon boolean tokens, spec/load/format round trips,
duplicate grants, matching provenance removal and all six current creature
templates; they remain uncompiled/unrun.

No native instructions, game/server, rebuilt source or filesystem scenario was
executed by this repair. Compilation, actual save/UI/client/MPQ/game/network
lifecycles, displayed geometry/models and original/rebuilt parity remain open.
The wider native/source recovery frontier remains #41; this bounded integration
does not certify whole talent, pet, persistence or cooperative systems.

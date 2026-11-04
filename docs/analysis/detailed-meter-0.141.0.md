# Detailed addon meter in 0.141.0

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This is a bounded source/recovery result for [#75](../CURRENT-STATE.md#gap-75).
The [earlier ledger report](party-healing-meter-0.139.2.md) retains its own
received-heal, replay, and recorder evidence.

## Lua receiver

The complete [retained meter Lua](evidence/0.139.1/meter-api.lua) is
byte-identical to 50,637 bytes at file offset `0x76dfef4`
(VA `0x1476e18f4`, SHA-256
`2871135e74cc78964c4997e12d3c9360a80adfa57ca166ddde3f4d4af1295588`).
The [FrameXML bootstrap](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs)
now loads the entire receiver instead of extracting the position query and
replay request alone. Frame assembly, sequence recovery, descriptors,
windows, checkpoints, loadouts and portrait queries use that retained Lua.
It requests a full replay on installation and on world entry, and clears
the ledger and checkpoints on world exit.

The addon receiver checks the recipient's own name and the engine's
`UNKNOWN` distribution for the server's LANG_ADDON whisper. The
[recipient request and publication trace](#recipient-request-and-publication)
establishes the self GUID and whisper lane. Guest engine admission already
requires synchronization and the active local port; its chat trust path
preserves LANG_ADDON whispers byte for byte, including the multipart `|`
delimiter. The ordinary `SendAddonMessage` binding cannot send on that
lane. This guards receipt from ordinary party addon messages without
changing the shared chat transport. The capability getter advertises
position alone until the current VM assembles a detailed frame. It does
not build detailed data from the reconstructed authority's legacy totals.

The composed bootstrap passed the standalone Lua checks for admission,
out-of-order multipart assembly, a typed damage row, world reset, and
ordinary replay throttling. This exercises the shipped receiver with
synthetic parts and stub host bindings. The Rust adapter parses with
Rustfmt. Compilation, native-host interoperability, actual frame
delivery after `/reload`, and gameplay parity remain unverified.

### Language and process metadata

The client metadata owner at `0x140050550..0x14005081c` (file
`0x4f950`, SHA-256
`d2115e0982e5076771a2cfd952e9f88525772b47346b34840df40fa7c73ff030`)
registers `azsLanguage` with default `en` and `azsProcess` with an
empty default. Its first registration draws a process token and formats
it as 16 zero-padded lowercase hexadecimal digits at
`0x14005071d..0x14005072c`. The shared locale getter at
`0x145e7a830` supplies the current language; the update at
`0x1400507f1` writes it when it differs. Ghidra raw-slice result
`ev_96d4b02818910186b2e1f329dc611cec30cc3b58f5c83b92864b1edfcb8ed7d3`
covers that owner; the original PE resolves the format flags and
external lowercase hex renderer.

The rebuilt client seeds one OS-random 64-bit token per process and
mirrors the active game language from the existing locale owner. Both
values use the engine's session CVar registry and the same rows seed
the active and replacement Lua VMs, before addon code on entry and
`/reload`. The client does not persist those session values as
configuration. The retained Lua therefore reports the selected
language before any detailed frame, with stable process input to its
VM session ID. The standalone Lua harness verifies initial Polish,
a switch to German, and an unchanged UI session ID across the language
change. That harness supplies stub CVar values; Rust was syntax parsed,
with actual engine execution still unverified.

## Recipient request and publication

The current chat owner `0x145e9e690` builds the `AZSMREQ` plus tab
prefix from the descriptor at `0x147aeb868`, compares it at
`0x145ea0746`, and passes the remaining text to `0x145e07350`.
The request branch selects the indexed peer's `+0x260` state in
host mode and the local server's `+0x1b20` state otherwise.
After trimming the suffix, `full` sets `+0xf8/+0xfa`, `party`
sets `+0xf8/+0xf9`, and `lines` sets `+0xfa` only. Unknown
tokens leave those flags alone.

The peer poll at `0x145ea96b6..0x145ea97e6` stages and restores
the 256-byte recipient state around the frame builder. Its
`0x145ea97eb..0x145ea9804` branch consumes the ordinary-line
refresh flag before invalidating the peer's line cache.
`0x146044c70` appends each detailed part under the four-byte
`AZSM` prefix, alongside the ordinary lines. The subsequent
`0x145eaa6a4` call seats the receiving hero and passes those
rows to the local chat serializer via `0x145e737b0`. In that
seated context, `0x145e738ee` reads the recipient GUID and
`0x145e73a42` uses it as the whisper sender. The same serializer
sets chat type 6 and language `0xffffffff`; its solo caller
`0x145eacb13` supplies the local hero GUID. The host engine
sender at `0x145ecac30` requires the active synchronized peer
and uses Engine variant 6 (wire 7) for that opcode/body.
The adjacent resource-vector write is a different wire message.

| Original range | File offset | SHA-256 |
| --- | --- | --- |
| Request ingress `0x145e9e690..0x145ea2004` | `0x5e9da90` | `ac64bb527d54f19058a76a4de5493ed1738f366ddec5c6d49a41b4c70ad21daa` |
| Token handler `0x145e07350..0x145e073d1` | `0x5e06750` | `4fc8043d17e5eb0131566d841c241b847121beb341d8d50fea01899136c0d890` |
| Poller `0x145ea3420..0x145ead071` | `0x5ea2820` | `6d3fe23bd5b101096f0343322ea410be01dca9f7e9054551af1742a4192583f5` |
| Frame wrapper `0x145fce150..0x145fce544` | `0x5fcd550` | `19a6c6aa0ea4f5fa9f829a28ca5ecc0ce5aa9b98e8c27a903fa9eaff7077489e` |
| Borrowed recipient `0x145e737b0..0x145e73b42` | `0x5e72bb0` | `31304531fffb82bad5d8be3885da904fdc1a74d13ef7308ddcc244ec33406478` |
| Whisper serializer `0x145fdf630..0x145fdf8dd` | `0x5fdea30` | `6dd9da7d7f3ca1d70c6dee95a9121f7f5f74d156ecf7fa662c3fec50132526e8` |

The frame wrapper's Ghidra result
`ev_7b30a497a35e00cd924f67372ae62be36753627de94348018c41b6cdc8f64573`
uses the exact original slice. Original PE operands establish external
call and data edges omitted by that slice. This trace establishes the
transport shape and source receipt route, with no live co-op validation.

### Ordinary recipient snapshots

The peer poll at `0x145ea9498` calls `0x145ef58e0`. Its remote arm
seats the selected hero, invokes the locale adapter at `0x145ef5be0`,
and restores the seat. That adapter sets the recipient locale at
`0x145e6e470` and calls the 21-line builder at `0x145e6e4bb`.
The builder takes the seated hero's damage and healing vectors at
`+0x918/+0x920` and `+0x930/+0x938`. Both use the full run clock at
`+0x1028`. The third formatter call uses the boss vector and segment
clock. The selected line slots carry `AZSMETER`, `AZSHEAL`,
`AZSBOSSDMG`, and `AZSTAKEN`; the remaining slots use their own scalar
or list producers. The ordinary `AZS` stats line uses the separate
three-byte prefix at `0x145e7391e`. The peer poll compares ordinary
payloads against its cache, appends detailed parts to the changed
rows, then sends the selected recipient's addon-language whispers.

| Original range | File offset | SHA-256 |
| --- | --- | --- |
| Recipient snapshot owner `0x145ef58e0..0x145ef5ceb` | `0x5ef4ce0` | `78e6f2d56b9a052e07c1574cd43c3fc34fb12b6b2c96a307cf69592db021d4df` |
| Recipient locale adapter `0x145e6e340..0x145e6e562` | `0x5e6d740` | `baeacc2e0dee863750453a57d828a0d9bfaec67fbd1f9e8c83b8d5f5cff47163` |
| Ordinary line builder `0x145e60e50..0x145e617f9` | `0x5e60250` | `e5f7daa4ca3f0ebe5650b0a602ccccaf963b4a4648ef87326136b8abd396ba1d` |

Ghidra 12.1.4 raw-slice result
`ev_bb4f9787a0fe9351518f7d9ba4bbe2efa665c039f262305ddf730ff00f940c84`
matches the recipient snapshot slice. Original PE operands bind the
external calls, payload slots and prefix bytes.

The rebuilt [recipient feed](../../crates/azeroth-survivors-re/src/gameplay/client/coop_feed.rs)
uses the same ordinary producers as the [local bridge](../../crates/azeroth-survivors-re/src/gameplay/client.rs)
while the guest's hero and locale are seated. The existing changed-payload
cache and `full`/`lines` requests own replay. The guest receives those
lines through the authenticated engine packet path. This keeps meter
rates and shares on their fractional authority inputs and supplies
world-anchor units, debuffs, timers, pets and terminal rows from actual
game state. The native HUD keeps using its HUD JSON. The guest target
row still depends on the host's admitted selection state.

The retained 0.140.0 Lua stream consumers, byte-identical in 0.141.0,
passed the existing stub-host bootstrap checks. Rustfmt parsed the
changed source. Compilation, live transport, replay and parity remain open.

## Native recorder and frame

The 0.141.0 counter reducer at `0x145e10f60` is called from the damage
recorder at `0x145f70abb` and `0x145f70e16`. It still interns 0x108-byte
source descriptors and matches the 0x80-byte counters against the typed
row key and actor/owner fields. The one-based ID is assigned at
`0x145e11830` before insertion; `0x145e11915..0x145e11920` adds the
effective amount to the run amount. A nonzero encounter ID is tested
separately. When it changes, the current encounter amount is zeroed
before credit; the qualifying cumulative amount is retained at
`+0x58`, and the current encounter amount is `+0x60`
(`0x145e11927..0x145e11971`).

History keeps cumulative and in-bucket totals for both the ordinary
and qualifying amounts in each 0x28-byte entry. The update at
`0x145e11ab9..0x145e11ae3` coalesces the zero-based counter index.
The equal-clock path reuses its last bucket. An increasing clock within
the recovered 0.2-second gate can advance that bucket and clear its
in-bucket amounts before the new contribution. The retention comparison
at `0x145e11b65..0x145e11bb7` uses the next bucket and keeps at least one.
These are typed-ledger operations; the legacy accumulated labels cannot
recover their keys, history or epoch state.

The current frame builder at `0x145fc7330` invokes the typed counter-row
serializer at `0x145fc9614`. It updates the retained per-recipient
sequence at `0x145fcacef..0x145fcacfa`, using predecessor zero for a
full frame and the previous sequence for a delta. `0x145fcada2`
constructs the first `F,` record before passing all records to
`0x145e1b4d0` at `0x145fcaf00`. The partitioner starts another part
when the nonempty current part's byte length plus the next whole record
exceeds 7,999. It appends a semicolon between records within one part;
it does not split a record. `0x146044d20` prepends the version, sequence,
one-based part index and part count using the packed format at
`0x147af8318`.

| Original range | File offset | SHA-256 |
| --- | --- | --- |
| Counter reducer `0x145e10f60..0x145e11f8a` | `0x5e10360` | `2f63b0c822be5fb429b1cc74b1cc477abbdb0bef05f727d64a83d8fb2e260c5c` |
| Frame builder `0x145fc7330..0x145fcb971` | `0x5fc6730` | `2d89fed7e8c2b88593a4f56a9aa7442cded39ebc17fbd593b255bdc66b99ee6b` |
| Partitioner `0x145e1b4d0..0x145e1b795` | `0x5e1a8d0` | `bd37bcca38f8d3d6176eff0deb4925d3d7f0899617ff93aca58c9ee4dfb6aa63` |
| Part envelope `0x146044d20..0x146044e77` | `0x6044120` | `3bf7bcaa32d1590e766435b5fbd39a880069bb26ed66305d7c34c2ef12e2c6af` |

Ghidra raw-slice pseudocode
`ev_74da9644debfd05b2eda230555ca9cec2e3092f87388466841a13bf74125438f`
covers the reducer. The frame builder returned procedure metadata
`ev_abea76416b16216683559c2919588af9c682677a5e34f26cc69605342e78a111`;
whole-function decompilation failed. The original PE instructions
establish the bounded sequence and partition behavior independently.

The actor constructor `0x145fa3080..0x145fa35bb` checks the actor
GUID against the seated hero first, then the live companion and totem
vectors and retained non-hero rows. It formats hero `H<low GUID word>`,
totem `T<low GUID word>`, and companion `P<low GUID word>` or
`D<hero low GUID word>:<descriptor key>` identities. The counter writer
`0x145e1df70` reads the interned source/actor at `+0x76/+0x78`,
origin indices at `+0x08/+0x10`, row ID at `+0x6c`, ordinal at
`+0x48`, school at `+0x74/+0x75`, and metric/proc at
`+0x7a/+0x7b`. Bits 0, 2 and 4 of `+0x7c` mark periodic,
reflection and absorb, respectively.

The heal owner at `0x145f66e30` obtains the credit ordinal and
qualifying encounter ID through `0x145e0f010`. It records the current
recipient's row at `0x145f69415` and queues copied 0x310-byte records
for other owners. The drain at `0x145f09de8..0x145f09f89` seats the
matching hero by GUID and retains the original credit ordinal,
encounter ID and clock. The shared event stream's aggregate labels and
packet keys cannot reconstruct those independent owner contributions.

| Original range | File offset | SHA-256 |
| --- | --- | --- |
| Actor constructor `0x145fa3080..0x145fa35bb` | `0x5fa2480` | `cea04ac5543b93eb09ecda0cfe8350999fb2646d64c4ac2a64210752b9b37d82` |
| Counter serializer `0x145e1df70..0x145e1e922` | `0x5e1d370` | `383c9e7c86980bd2d20bbafbf446b88aa3a7f4ae34ad95e07732e8f2ecdb3cb6` |
| Heal recorder `0x145f66e30..0x145f6957e` | `0x5f66230` | `b0fd94d9c96b7e088dea23af38b2dc321fe687224f7acbeb9ad9dfdfe460dcdc` |

Ghidra actor receipt
`ev_97ea07d429cbcf043de5ea273d60a2286eef870769b979289aa8c861ede6c85d`
matches the original actor-constructor slice.

## Loadout records and refresh

The frame builder passes a selected 0x108-byte hero view to
`0x145e1b7f0` at `0x145fc808e`. That writer emits the unsupported
slot-zero equipment row, then visits the 19 ordinary equipment slots.
Zero item IDs emit an empty supported row. Occupied slots call
`0x145e089a0` for `item:<id>` and construct the separate instance
identity `inv:<slot>:<id>`. The same writer emits `LT` talent and
`LJ` ring, trinket and amulet rows. Its `LB` helper
`0x145e020a0` writes selected/learned ability state and slot/rank
alongside the descriptor key. The equipment item key belongs to this
loadout producer independently of combat attribution.

The builder joins an owner's encoded loadout rows with a semicolon at
`0x145fc990e`, then hashes their bytes using 64-bit FNV-1a
(`0xcbf29ce484222325`, `0x100000001b3`). It compares the hash with
the retained entry for that owner at `0x145fc9b00`. A new or changed
hash updates that entry and emits `LX` at `0x145fc9bfe` before the
loadout rows. The `LX` revision uses the lowercase hex formatter.

The writer's original range `0x145e1b7f0..0x145e1cf38` starts at file
`0x5e1abf0`, SHA-256
`96f2de27f9435ef9771193bdef13084dd6564678d99ea0b59effa1cdf949b294`.
Ghidra result
`ev_dfe3420823e5ab541b5782b83e790cc53643c6debe1bc8a12873a6f9df1081f6`
was recovered from the exported evidence after the response exceeded the
tool's inline budget; its raw result equals the saved Program operation.
Original PE operands bind the record formats and external calls.

The rebuilt authority still needs the actual per-owner typed contributions,
retained actor transitions, encounter and history inputs, and loadout
descriptor joins before publishing this feed. A frame derived solely from
the rebuilt legacy meter would misrepresent those queries.

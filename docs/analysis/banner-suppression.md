# Native banners and addon takeover (#58)

[CURRENT-STATE](../CURRENT-STATE.md#gap-58) owns the unresolved report of
sustained duplicate native/addon displays. The **0.140.0** presentation repair
below addresses a stale-frame route in the rebuilt host. The 0.115.0 and
0.113.2 sections retain their original evidence and scope.

## 0.141.0 banner whisper identity

Installed SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The Game publisher `0x145f85860` increments the process counter at
`0x148ac3098`. It passes the same ID to the JSON and compact addon
formatters, then sends the nine-byte `AZSBANNER` prefix through
`0x145fdf630` using the active hero GUID from Game `+0x5c8`.
The server publisher `0x145e9e350` takes the same route with its
guest-local GUID at Server `+0x2078`. The serializer writes chat
type 6 and language `0xffffffff`. The host packet classifier
selects kind 6 at `0x145e90b2f..0x145e90b36` and the private branch
at `0x145eaab4f..0x145eaab6a` sends to the originating actor only.

The rebuilt immediate publisher used sender GUID 1 even when the
actual player had a different world identity. The chat feed resolves
the sender's name before calling the Lua receiver, so a wrong GUID
could delay delivery or reach its unresolved-name fallback. The
[banner publisher](../../crates/azeroth-survivors-re/src/gameplay/client/addon_banners.rs)
now uses the existing GUID-aware packet constructor. The run event
collector supplies the emitting hero's GUID, the co-op JSON adapter
supplies the local process world GUID, and guest settlement retains the
admitted hero identity through the last account notices. Pre-world
account notices without a selected hero still deliver their system
message, sound and toast.

| Original range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Game publisher `0x145f85860..0x145f859c5` | `0x5f84c60` | 357 | `9404495085f37711df44f5987baeb41d8795b8bd4bea87a97fdb640731c5eff0` |
| Server publisher `0x145e9e350..0x145e9e4c5` | `0x5e9d750` | 373 | `15c01227dd48af8d6c97f1464cf4d7dbe6eeaae2d8cbb0341be95b018a9975f3` |
| JSON formatter `0x145e81f30..0x145e82139` | `0x5e81330` | 521 | `142825c8ee62a03b8d8b4a0d56c527d7a0948b5d4f003afa0f16ee2f8d953c78` |
| Whisper serializer `0x145fdf630..0x145fdf8dd` | `0x5fdea30` | 685 | `6dd9da7d7f3ca1d70c6dee95a9121f7f5f74d156ecf7fa662c3fec50132526e8` |
| Private chat check `0x145e90b24..0x145e90b3a` | `0x5e8ff24` | 22 | `a600c0c8b4b6c4d96f3a8337ebcbb4a02ad56abc63e6f99f777765ccde82c01d` |
| Private recipient dispatch `0x145eaab4f..0x145eaab6f` | `0x5ea9f4f` | 32 | `cd73131c3d2791c9936844e9fe62e6ef6921c2b78bfc4c67b0226b8900a5f480` |

Ghidra result `ev_537e4b4ef90be7bea3b5a8792018e4e71a33340ef5797dc86fc7af2973d819be`
uses the exact Game publisher slice at its original VA. The result
digest was checked against the operation journal. Original PE
instructions supply the external call, field and literal joins.
Six banner and HUD Lua bodies and their dispatch branch match the
bootstrap's base source and the retained current extract. The shared
Lua suite passes both extracts with host stubs. The Rust regression
checks the real non-solo sender GUID and distinct IDs for repeated
banners and awaits compilation.

The 0.141.0 visibility read at `0x1401c9b82` selects the same
`hudBanners` key. It shows by default and hides on the trimmed
one-byte value `0` at `0x1401c9bca..0x1401c9bd8`. The 112-byte
range starting at file offset `0x1c8f82` has SHA-256
`2a5be90e3f29656724c3f5eb9b124b2346825e537f4c5198b7d6dff031321033`.

### Shared banner identity

The native publisher passes the same process ID to the JSON formatter
and whisper formatter at `0x145f85893` and `0x145f858ee`. The JSON
formatter writes that ID at `0x145e81fc4..0x145e81fdb` with the kind,
localized text, name and boss flag in the same record.

The rebuilt shared boss, final boss, boss defeat and guardian producers
reserve one ID for the JSON and private whisper, including zero after
wrap. The desktop consumes those outputs independently.

### Desktop EventBytes and private whispers

Guest wire 9 admits the event at `0x145ecd571` and calls Core's
frontend slot `+0x18` at `0x145ecd5ce` with the raw pointer and length.
The [desktop vtable registration](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/coop-command-ingress.md#desktop-and-guest-gossip-capability-initialization)
binds that slot to `0x145e94430`. That callback optionally logs the
record and observes the separate choices diagnostic, then copies the
bytes into a queue of 24-byte owned strings at `0x145e94588..0x145e945ba`.
It does not form an engine chat packet. The frontend owner
`0x140052100` drains the 24-byte entries and parses their JSON.
Its exact six-byte `banner` case at `0x140052ca3` reads `text` as a
string (default empty) and `boss` as a Boolean (default false).
The case appends one 32-byte native banner row, with the flag at
`+0x18` and elapsed time at `+0x1c`. It does not use the ID, name or kind
to select the row and does not call the Lua banner receiver. The row
renderer reads the flag for 34 px red or 24 px gold text.

The host handles the origin separately at `0x145eab236`. For a peer
with a different locale, `0x145eab3ed` calls the scoped locale wrapper
`0x145e6c4d0`, which selects the recipient locale while the record
parser `0x145e821c0` rewrites the banner. The caller selects the
rewritten bytes when present and the original otherwise. It then
publishes to the host frontend for slot zero or prepares the guest
EventBytes at `0x145eab5d2`. The recipient's frontend reads the resulting
text without doing a second translation.

| Original span | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Wire-9 arm `0x145ecd54a..0x145ecd5d7` | `0x5ecc94a` | 141 | `94412bb4f37061daf2b72347f4663b53f21ab35b12274c93e36b4db791a39bb8` |
| Desktop vtable slot `0x146554a20` | `0x6553020` | 8 | `c73a5053d04caa63e9a13b731fe5b1bdefbb0382d9abd8a5b10561ab66fb9ecb` |
| Event callback `0x145e94430..0x145e94622` | `0x5e93830` | 498 | `337a557eeb6320b2c28f7ac4b35b200de723d4279cfb464133e7daaf4f9c0dfc` |
| Frontend queue consumer `0x140052100..0x14005388a` | `0x51500` | 6,026 | `67ff7ae2c1adf204662f8f16f1e29c3138c4c6e4482751ef1aca5dd3cde088fe` |
| Frontend field keys `0x146554fa8..0x146554fc4` | `0x65535a8` | 28 | `6c6ab56a443e5a5974fc2642592c8c658dd3e1a3d966209ed94f05b0cb8745c2` |
| Banner row style selector `0x14034e72c..0x14034e779` | `0x34db2c` | 77 | `9f19d7c7b680c3dc7e1bdc1a9764c54727e1f8544de324e223025ec067a93ff1` |
| Peer locale rewrite and fallback `0x145eab3b5..0x145eab459` | `0x5eaa7b5` | 164 | `bd201d81f9a17bba4ab5d9f69d27db544eaddd63bd0e36fd459f4e2c1edd2cf9` |
| Scoped locale wrapper `0x145e6c4d0..0x145e6c645` | `0x5e6b8d0` | 373 | `03447ebf2574b8b91d69e8690c1b12081af0ae94752d6fc395025c255da35b7c` |
| Banner record parser `0x145e821c0..0x145e82907` | `0x5e815c0` | 1,863 | `6948f2f9f07a8d002456ca426f33d15e873670a614b8772134584bc5856d39ca` |

The journaled callback result is
`ev_4a87d794add7a0aa643e91d14e51cd9dfe8a116f4af3a196f0974acab18a0388`
(result SHA-256 `83d00b7f2ae32a783ad596c76548a49d9a21ab0e28261f57bd16afc4b6a1ab1b`).
The scoped locale wrapper result is
`ev_fd317fd57d5b664563d8255dc1bfcbf65518ddec828537158680fdb47c24ab55`
(result SHA-256 `783269fd91d905be7923cebe1c857ac4ab239c2d70d1c06a63885937acb1997e`).
The frontend's exact input is already bound in the
[source frontier](source-frontier.md#native-query-receipts).
The original instructions and PE data resolve the omitted vtable,
JSON keys, jump table and palette data outside the raw imports. The
red/gold color and size bytes match the historical
[row constants](evidence/0.100.1/notifications/manifest.json)
at current VAs `0x1465c5558`/`0x1465c54e8` and
`0x1465c4690`/`0x1465c4664`.

Previously the rebuilt guest converted EventBytes into an additional
`AZSBANNER` whisper. The guest that originated a shared event could receive
both its private packet and the synthesized one. Peers without the private
packet also got a Lua callback in place of the original native row.
[The event bridge](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
now delivers received banner JSON only to
[Notifications](../../crates/azeroth-survivors-re/src/gameplay/notifications.rs).
The host's own shared publication adds its local native row directly;
the borrowed hero's publication uses the existing EventBytes fanout for
the guest and the host's local projection. Both retain the source hero's
private whisper and its allocated ID. The shared sender formats the known
name and template in each admitted recipient's language and carries the
per-recipient record through the existing deferred EventBytes route.
The private whisper uses the origin's language. Native HUD visibility still uses
the applied `hudBanners` CVar. The legacy raid-emote route remains separate.

Rust syntax and the isolated Lua banner suite were checked. Rust
regressions for typed fields/defaults, recipient text and whisper identity await
compilation. The original sustained duplicate still requires a
same-publication VM trace identifying the active legacy hook, the
actual addon callback count, applied CVar and visible roots. This
repair establishes the desktop JSON/whisper boundary and its source
connection; it does not establish the cause of a reported rendered
overlap. No application, client or game server ran.

## 0.140.0 presentation reads the applied CVar

Installed SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The registration at `0x1401bfc10` and read at `0x1401bfea2` form the ten-byte
`hudBanners` key at `0x14659fb81`. The read, default and post-trim predicate at
`0x1401bfea2..0x1401bff12` (file offset `0x1bf2a2`, 112 bytes, SHA-256
`3c8fb436d9c0baac329c01ced315418df6444f48aa3b315750789bf65a22d91f`)
show by default and hide on the trimmed one-byte value `0`. Eight isolated
instruction cases from `0x1401bfeea..0x1401bfefe` pass with synthetic post-trim
inputs. The six HUD and banner Lua bodies match the actual bootstrap source
and pass the [stub-host checks](../../scripts/check-addon-bootstrap.lua).

The early local input snapshot feeds mouse arbitration ahead of the network
drain. The packet UI feed and `OnUpdate` can write `hudBanners` later in the
same VM pass, after that snapshot. The custom Notifications root was reading
the early mirror despite running in `RunSet::Present`, after world presentation
and the VM pass. It now reads the applied client registry at that presentation
point and uses the shared visibility predicate. This covers both newly
created and cached roots and retains the early input snapshot for its existing
consumers. The normal Lua CVar owner still applies validation and callbacks.

Four changed Rust files syntax-parse. The sustained duplicate still requires
correlated evidence of the loaded addon's official callback, stock emote
hook, CVar readback and displayed roots. Compilation, the actual VM schedule,
rendered visibility and original/rebuilt comparison remain unverified.

## Current 0.115.0 bounded recovery

The installed SHA-256 is
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [current instruction proof](evidence/0.115.0/banner-takeover/native-cases.json)
and `scripts/check-banner-takeover.py` independently bind and replay:

- `1402b220f..1402b226c`: the actual `hudBanners` read, shared trim call and
  visibility predicate. Eight original-instruction cases hide only the trimmed
  one-byte `0`; the trim helper remains a separately bounded contract.
- `1459a9360..1459a96ae`: the complete current emote serializer. Thirty original
  instruction cases retain chat type `0x5a`, independent inline speaker and raw
  body, language zero, target zero and the original trailing fields. Unicode,
  empty names and allocation-growth inputs pass; allocation/memcpy/vector growth
  are explicit host seams.
- `1458d6dc0..1458d6f35`: a scoped banner-localization wrapper. Thirty-six cases
  cover fourteen locale codes, unknown/uppercase/short/absent inputs, and present
  or out-of-range substitution indices. The wrapper invokes its record-parser
  seam exactly once and restores the previous TLS locale pair after returning.
  This verifies the wrapper, not the parser or a real Windows TLS runtime.

The same proof binds five current announcement literals: pack, wall, swarm,
stampede and boss entry. Their selected native branches call the shared lookup
at `1458dff90`, retain the raw template/name on an empty result and converge on
the current emote serializer. The four wave branches share
`14596134a..14596140a`; boss entry uses `14594c61c..14594c657`.
These are static producer traces; the lookup helper and whole wave/boss lifecycle
are not replayed. Native emotes remain separate inputs from official callbacks.

All six exact current Lua HUD/banner function bodies equal the earlier
0.112.0 baseline and the bootstrap's selected `SOURCE`. The checker resolves
that actual include before comparing the bodies; timer/revive additions do not
change these six functions. The current embedded API passes the existing isolated
Lua callback/history/malformed-input/hidden-HUD checks. Host stubs do not execute
the real FrameXML VM or the installed addon.

The live source audit again finds that accepted unflushed CVar getters reach
HUD settings, existing Notifications roots update visibility before the content
cache early return, emotes retain raw body/speaker through the ordinary Lua
route, cached frame tables retain method overrides, and official callbacks
remain independent of native HUD visibility. No additional concrete missing
operation or target-supported suppression change was established.

BANNER01's current kind table is twelve pointer/length pairs at
`14700cda0..14700ce60`: boss, finalboss, bossdown, guardian, achievement, unlocked,
magnet, cache, rune, downed, frienddown and revived. The final three cooperative
producers remain excluded. The quoted-field helper's canonical current extract
remains [banners-owner](evidence/0.115.0/banners-owner.json); no duplicate copy is
introduced here.

The [new Ghidra/edge proof](evidence/0.115.0/banner-takeover/record-parser.json)
connects all three quoted-field calls to `145853470..145853bb9`, the scoped-locale
wrapper, and the current update owner's optional-result/fallback route. It
recognizes the banner record, checks the kind/id and processes its text/name
before returning an owned rewrite. Missing or rejected rewrites retain the
original input at the caller. The selected record parser and wrapper contain no
HUD suppression read. Shared substitution/serialization helpers, dynamic
callback identity and cooperative replication remain outside this bounded
classification; they do not identify an additional #58 visibility operation.
The raw Ghidra input's omitted prefix constant is bound separately to the actual
nine-byte `{"type":"` source constant, rather than inferred from its DAT label.

Reproduce the static checks and prepare the optional durable query with:

```sh
python3 -B scripts/check-banner-takeover.py
lua scripts/check-addon-bootstrap.lua docs/analysis/evidence/0.115.0/embedded-api.lua
python3 -B scripts/check-banner-takeover.py --prepare-rea
./scripts/rea query runtime/analysis/history/addon/banner-takeover/d697375a5b27/checks/rea-reproduce-6ac15e9be5ba64fe/plan.json
```

The final command starts static Ghidra only; the preceding checks do not. The
independent source/evidence review found no additional defect. Historical
0.113.2 checks below retain their own target and must not be run as current proof.

The sustained duplicate report remains unresolved at the actual
VM/addon/hook/schedule/rendered-root boundary. These bounded current proofs do
not establish its cause, native-system completeness or visual parity. No game,
addon startup, compilation or compiling test ran; the addon and event delivery
remain unchanged.

## Historical 0.113.2 display routes

The report identifies **“A pack hunts you!”**, **“A wall of foes closes in!”**,
other wave notices and boss arrivals. They include the stock raid-emote surface,
which is distinct from the custom Notifications root controlled by `hudBanners`.

| Selected native owner/range | Current bounded contract |
| --- | --- |
| `140403190..140403b92` | HUD settings registration/read owner; `1404034ae..14040350b` reads `hudBanners`, calls the shared trim helper and hides only the resulting single byte `0`. |
| `1459500b0..145952ae4` | Current wave owner; pack/wall literal references and shared emote publication are retained. |
| `14593c940..14593d6ea` | Current boss constructor publishes `%s enters the battlefield!` through the same emote helper. |
| `1458c8a40..1458c8d8e` | Complete emote serializer: chat type `0x5a`, language zero, separate inline speaker, zero target GUID, unformatted body and trailing tag. |
| `140c2da3a..140c2da61` within `140c2d970..140c2e80e` | Chat routing builds script arguments, resolves the event name and calls the event publisher. This excerpt is decoded separately from the incomplete raw-import switch. |
| `1410330a0..1410330bd` | Event-name lookup reads pointer/length tables at `1460cc410` and `1460cc128`; source enum index 31 resolves to `CHAT_MSG_RAID_BOSS_EMOTE`. |

The [native manifest](evidence/0.113.2/banner-takeover/manifest.json) binds exact
selected ranges and the canonical currently embedded Lua API. The
[Ghidra observations](evidence/0.113.2/banner-takeover/rea.json) bind three focused
raw imports to their provider/profile and original byte owners. Raw imports omit
external/global context and use generic ABI types; independently decoded PE
instructions govern interpretation. The check reconstructs each raw import from
the selected PE segments and zero padding. No other AS or engine behavior is certified.

The actual `patch.MPQ` **ChatFrame.lua** performs
`RaidBossEmoteFrame:AddMessage(body, ...)` inside `ChatFrame_OnEvent`.
The [resource contract](evidence/0.113.2/banner-takeover/framexml-contract.json)
retains its member digest and exact four-line call site. The host's
[chat router](../../crates/benilla-app/src/ui_chat/frames.rs) fires the normal Lua
event. Its [frame wrappers](../../crates/benilla-ui/src/script/object.rs) are
cached tables, whose ordinary field assignment can override this method.
There is no second direct MessageFrame insertion on this traced host route.
This source trace does not execute the loaded addon or prove its hook is active.

## Installed addon chat contract

The installed **3.2.32-survivors** addon's `docs/RUN-BANNERS.md` and owning modules
were inspected read-only. The [contract record](evidence/0.113.2/banner-takeover/addon-chat-contract.json)
retains their relative paths, file hashes and source anchors. It establishes the
expected routing below; it does not prove the hooks were active during a reported
duplicate.

| Input | Addon behavior while takeover is active |
| --- | --- |
| `CHAT_MSG_RAID_BOSS_EMOTE` | Redirect the entire category through the `RaidBossEmoteFrame.AddMessage` wrapper, including pack, wall, formation, elite, lair and unknown text. CleanerChat separately suppresses the regular-chat copy while that wrapper still owns the method. |
| Exact raw boss-entry or guardian-slain emote template | Suppress the legacy companion; the official `AZSBANNER` callback supplies its banner. Matching uses raw `arg1` and the native locale catalogs, not the formatted body or a timing window. |
| `CHAT_MSG_SYSTEM` or a direct chat write | Redirect only the exact localized DoT-stack template with a numeric count. Other system messages retain their chat route. |
| `UIErrorsFrame.AddMessage` | Wait one update to pair with an accepted visible/queued official banner. Suppress matching companions and forward unmatched errors. |
| `CHAT_MSG_ADDON` with `AZSBANNER` | Receive future official callbacks independently of `hudBanners`; suppress duplicate native ids. |
| Monster yells or the separate `RaidWarningFrame` | Retain their ordinary surfaces. They are distinct from the raid-boss-emote category. |

The raw AS body remains separate from the inline speaker through
`RunAnnouncement::chat`, `SessionEvent::Chat`, the chat feed and `ChatEvent::script_args`.
FrameXML intentionally makes both the stock raid-emote display call and the
ordinary chat display call; the addon has separate hooks for these two surfaces.
Hiding the Notifications root alone cannot certify wave/boss takeover. Removing
emotes or suppressing official callbacks would break these documented inputs.

The startup/source trace also preserves the hook idiom: XML scripts compile as
zero-argument chunks, `GetScript` returns the installed closure, and dispatch
supplies/restores the Vanilla globals `this`, `event` and `arg1..arg10`. The addon
can therefore save `oldEvent`, set its own event context, then call `oldEvent()`.
Cached frame tables preserve ordinary `AddMessage` overrides. Event registration
deduplicates each frame. The contract record also binds six installed FrameXML
members: its TOC lists the chat XML once and the selected XML defines each chat
frame once. The inspected chat-window update handlers change settings/registrations
without replacing the event or message hooks. These are bounded static
source/resource observations, not proof of runtime instance counts or an
execution of the actual loaded VM.

## Historical CVar snapshot repair

[Input capture](../../crates/benilla-app/src/local_client.rs) formerly copied the
engine CVar registry after Lua input but **before** the normal `UiDrain` folded
that input pass's `SetCVar` calls into the registry. The addon could read its
accepted hide immediately while the host HUD saw the preceding value until the
next frame. This is a demonstrated source timing mismatch, not proof that it
caused every reported duplicate.

The VM now exposes its applied getter value for a row with an **unflushed write**.
Input capture overlays only those rows on the registry snapshot. Quiet VM rows
retain any newer host value; latched writes retain their applied value; reset
slot fills do not count as a value change. The method reads without draining,
so registry callbacks, write order and persistence remain owned by the ordinary
CVar exchange. A fresh VM has no retained pending-write cache.

The existing Options/HUD mirror and Notifications visibility consumer use the
updated snapshot. The visibility consumer updates an existing root even when its
content key is unchanged. Announcement packets, callback IDs/history and native
preference restoration remain on their existing source paths.

## Historical checks and remaining limits

```sh
python3 -B scripts/check-banner-takeover.py
python3 -B scripts/check-banner-chat-routing.py
```

The check passes **eight original-instruction Boolean cases** and **thirty complete
native emote packets**, including all four wave templates, boss entry, empty and
Unicode speakers and allocation-growth boundaries. Allocation, memcpy and Vec
growth are explicit host seams. Boolean replay starts after the shared trim call;
that helper's internals are outside this proof. It also verifies the current embedded API bytes,
native literal sites and named live source connections. Both changed Rust modules
parse through the existing rustfmt using `--emit stdout --config skip_children=true`;
this performs no compilation. Two authored Rust regressions cover same-pass
hide/restore/rejection, case-insensitive readback, repeated nondraining reads and
latched values; they remain **unrun**.

The chat-routing check passes **93 original-instruction event-name cases** against
the source enum, including raid-boss emotes, system messages, monster yells and
raid warnings. This leaf has no external-call seams. Its
[manifest](evidence/0.113.2/banner-takeover/chat-routing.json) binds both lookup
tables and the exact publication excerpt. The associated
[Ghidra observations](evidence/0.113.2/banner-takeover/chat-routing-rea.json)
retain raw-input reconstruction hashes and analysis limits. Publication callees,
the complete chat route and loaded Lua handlers are not replayed by this check.

Compilation, actual VM/Bevy schedule execution, addon hook activity, preference
restoration across startup/world-entry/reload/logout, rendered visibility and
original/rebuilt parity remain **unverified**. In particular, a sustained stock
emote duplicate cannot be attributed to this one-frame CVar lag from static
source alone. The native emote delivery and hook call sites have been traced;
no further concrete missing source operation was established on those routes.
A controlled same-publication trace of the API callback, legacy AddMessage hook,
CVar readbacks and rendered roots is still needed to establish the reported
cause. No game, addon startup or compiling test was run.

Retained launch output records addon files loading, but contains no publication
trace linking the received raw message to the active legacy hook, the official
callback and the displayed roots. File-load messages alone cannot establish
successful addon initialization: its module error handler can write to chat
rather than that output. The extended static trace establishes the expected
chat-type connections; it does not establish an additional missing operation or
the actual cause of the sustained duplicate. That causal question remains open
at the excluded VM/runtime boundary; no speculative second source fix is claimed.

# Native banners and addon takeover (#58)

[CURRENT-STATE](../CURRENT-STATE.md#gap-register) owns the reported duplicate
native/addon displays. Current bounded recovery uses installed **0.115.0**,
SHA-256 `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The earlier **0.113.2** CVar snapshot repair remains connected; its evidence keeps
that actual target. No additional source omission was established by current
recovery. Sustained duplicate causality and actual VM/addon/rendered comparison
remain open. The addon and event delivery are unchanged by this recovery.

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
./scripts/rea query runtime/banner-takeover-0.115.0/checks/rea-reproduce-6ac15e9be5ba64fe/plan.json
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

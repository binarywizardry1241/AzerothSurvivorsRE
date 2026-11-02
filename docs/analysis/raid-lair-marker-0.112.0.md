# AS lair-marker consumer — 0.112.0

Authority is the configured installed EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [manifest](evidence/0.112.0/raid-lair-marker/manifest.json) and
[Ghidra provenance](evidence/0.112.0/raid-lair-marker/rea-provenance.json)
bind the current AS marker fields and explicit shared-provider seams. This
supports the [forced-position handoff repair](raid-forced-position-0.112.0.md);
the existing benilla GossipPoi client interface remains the port.

The active-frame tail selects the lair at `1459073c5..1459074be`, with the
empty-lair fallback at `1459076e9..14590775c`. Held lairs take precedence and
use home XY distance from current `Game+4d0`. Without a held lair, the earliest
respawn deadline wins. Current comparisons implement f32 total ordering and
retain the first equal key. The source's `select_addon_flag` uses those same
inputs and rules. Native `145907244` invalidates the selected option when a
guardian spawns; the existing source invalidation retains that connection.

Publication at `1459074be..145907826` uses visibility option `Game+acc`,
selected option/index at `Game+0/+8`, previous marker visibility at `+acd`,
last publication time at `+a70`, and current clock at `+a4c`. When hidden, it
retains the selected lair, clears visibility and emits an empty-name marker
only when previously visible. That hide marker uses current player XY. When
shown, it emits for an absent/changed selection, absent visibility, or ordered
age strictly greater than **300.0**. An equal or unordered age retains the
existing marker. Shown markers use the lair's home XY.

The visibility input is independently current. CVar collector
`14005ca50..14005d452` registers `hudFlag` with default `1`, reads its optional
text at `14005cf43`, and executes trim owner `1400695f0`. Missing text is shown;
only exact trimmed `0` is hidden. A changed value (or initial sentinel 2) emits
AS command kind **0x17**, with the Boolean at record+4, at `14005d119`.
Dispatcher `1458bd380..1458be9e6` resolves that kind through current table
`146c0832c` to `1458bdaa4`. It writes cached `Client+1195` and, if the Game
option is present, `Client+adc`. Current tick setup `1458af541..1458af553`
independently establishes **Game = Client+10**, so that write is **Game+acc**.

The fresh Game constructor starts the visibility byte at 1. Game construction
owner `1458bf6d0..1458bffb2` then copies cached `Client+1195` into the new
aggregate at `1458bfc98`, before its actual return/install copies. This retains
a hidden CVar even when its command arrived before a Game existed. The source
route is `HudSettings`' `flag → hudFlag`, default true, the same trimmed-string
test, and `shown("flag")` passed into `update_world_flag`. The existing CVar
registry, channel and ECS resource interfaces remain ports.

The selected enemy-definition ID formats the locale key `enemy.{id}` using
the current format record at `146be3ec8`. A missing localized value falls back
to the current selected definition's name. Current format records at
`146c0bc98` and `146c0bca6` append ` (Guardian)` for held lairs and
`'s lair (empty)` for empty ones. These AS key/suffix rules match
`gameplay/client/events.rs::GuardianFlag`.

The profiles execute current packet producer `1458c28a0..1458c2b46`, which
constructs opcode **0x224** with flags **99**, X/Y, icon **6**, data **0**, and
the NUL-terminated label. The existing live adapter emits those same fields
through `SessionEvent::GossipPoi`. This establishes AS payload construction
and the live interface mapping; it does not certify actual client display.

Run `python3 -B scripts/check-raid-lair-marker.py`; `--stage` writes
the candidate under ignored `runtime/native-evidence/0.112.0/raid-lair-marker`.
**530 native profiles** pass: 54 selection cases, 384 publication cases and
92 CVar/command/construction input profiles.
They cover held/empty/tied selection, signed zero and NaN deadline ordering,
empty selection, changed/retained selection, shown/hidden state, exact and
adjacent f32 refresh ages, NaN/infinity, localized/missing names, marker count,
stored visibility/time and exact payload bytes. The companion forced-position
profiles separately prove that Pull publishes current XYZ before this selector.
The input profiles add missing/empty/Unicode-trimmed values, exact versus
nonexact zero, registration/change guards, both command values, present/absent
Game options, cached construction and the actual aggregate installation copy.

Typed seams cover allocation/free, memcpy, byte-vector reserve, the current
zone lookup, formatting, locale lookup, CVar registration/read, the channel
boundary and the Win64 stack probe. Current trim instructions execute directly.
Formatting captures actual current
records and definition/name arguments; locale profiles inject either absence
or `Name`. Other calls or instruction excursions are rejected. The current
packet producer itself executes. Shared provider semantics and the client,
controller and renderer are reused interfaces, outside this AS-specific proof.

The Ghidra raw import is a bounded fragment of the current active-tick owner;
its generic ABI types and incoming registers remain unresolved. Branches into
the excluded completion stage appear as `halt_baddata`; the instruction fixture
uses the actual installed branches and an explicit completion stop. Retained
assembly contains only new visited rows, referencing the companion and existing
canonical extracts for prior ranges. No compiler, Rust execution, game process,
network/client interaction, audible/visual comparison or parity check ran.

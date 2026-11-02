# Co-op capacity and list presentation — 0.113.2

Target SHA-256: `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [manifest](evidence/0.113.2/coop-ui/manifest.json) binds the current Ghidra
queries, exact function ranges, canonical extracts and native locale payloads.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), permanent #63, owns current status.
Current 0.115.0 filter/default repairs are separately bound in
[the current report](coop-ui-0.115.0.md); the evidence below remains historical.

## Scope and source boundary

The eligible #63 work is the 0.113.1 presentation portion: host capacity selection,
capacity-bounded roster/open-slot display and a complete scrolling public-lobby
list. This is a local UI adapter, not a co-op implementation. Networking,
discovery, hosting/joining, capacity enforcement, server behavior and cooperative
simulation remain excluded. The 0.113.2 batching/compression/performance claims
are neither implemented nor measured.

`coop_ui::CoopUiPlugin` now registers the presentation alongside the existing
menu and scrollbar plugins. The picker entry opens its own `Dialog::Coop`;
Host/Lobbies navigation and capacity button input update retained local state.
The menu's input owner clears its keyboard reader while this dialog is active,
consumes Escape through its existing device/request path, and prevents picker
selection/entry behind it. Options, entering/in-run and updater input gates
also apply. Closing removes the overlay and leaves the local capacity selection
and named scroll cache intact. The scene uses the existing fonts, button theme,
hover and shared retained scrollbar; no replacement game/client HUD is added.

`CoopUi` accepts read-only `LobbyRow`/`LobbyView` snapshots. It defaults to absent
snapshots and does not fabricate a connection, lobby, hero or error reason. A
provided empty list can display the native empty-list label; absence cannot.
The public-list and roster consumers are source-connected to the displayed panel,
but there is **no runtime discovery/session producer**. The join-by-code control
is unavailable and no host/join request form, request event, connection or party
state transition is introduced. Live list/roster population and operational
multiplayer behavior are therefore not established. #63 remains open; these
constraints must not be reported as a working co-op feature or full-screen parity.

## Current native contracts

| Contract | Current owner/range | Connected source |
| --- | --- | --- |
| Host capacity | `14029f76f..14029f8b7` in `14029f3f0` | `host_capacity` and five `Click::Capacity` buttons. Native `+0x119` zero displays five; other byte values clamp to five, with choices 1 through 5. |
| Received roster capacity | `14003ad29..14003b0bc` in `14003a850` | `roster_capacity` and indexed row rendering. `+0x11a` is independent: zero draws one, otherwise at most five. A populated index displays its supplied hero; an absent index displays Open slot. Slots above capacity are not emitted. |
| Complete supplied list | `140038559..140038574`, loop through `140038921` | Iterates the entire supplied vector, whose current native element stride is `0xf0`; no first-eight cutoff. No client-side capacity/admission filter is invented. |
| Scroll viewport | `14029dd10..14029e043` | Existing retained key `coop-lobbies`, vertical scroll, minimum height zero and 12px row spacing via `scrollbar::kept_list`. |
| List row | `1400384d0` and `140298d50` | Nonshrinking rows, 14px column gap, 12/6px padding, 1px border, 4px radius; flexible column content and separate joined/capacity text. Native title/description/secondary/count font sizes are 17/13/12/20. |
| Slot row | Current initializer in `14003a850`, text in `14029c700` | 44px row, 12px column gap, 12/5px padding, 1px border and 4px radius; Open slot is 15px with native muted RGB and 0.55 alpha. |
| Shared controls | `14003b350`, `14003b910` | Ordinary minimum width 40px, 14/6px padding; capacity minimum width 36px, 10/5px padding. Both use a 1px border/4px radius and the existing shared theme. |
| Window/picker/labels | `14029e050`, `1402d1200`, native locale table | Window width/height 100%, padding 36/24px, 12px gap and 34px title. Close is the current five-byte native label. All fourteen current language payloads supply the compact co-op subset. |

The retained raw Ghidra imports omit external code/data and can have unstable
pseudocode types. Current PE instruction/data tracing and bounded native store
replays establish the contracts listed here. Used Node offsets/Val tags are
checked through these current constructors, not promoted merely from the older
engine-layout report. Disabled analyzers, unknown callers and global semantic
coverage remain #41. The renderer's other presentation details and complete
native co-op screen behavior are not certified by matching these constraints.

The localized subset in `assets/coop-locales.json` is ordinary source/runtime
content; building the application never needs the EXE. The manifest retains
exact native descriptor/payload hashes. Existing external locale overrides have
lookup priority over this embedded subset. The lookup uses the selected menu
language and falls back to the native English key without rewriting player data.

## Static checks and remaining validation

`python3 -B scripts/check-coop-ui.py --contract constructors` verifies current EXE/extract hashes and runs:

- 256 native host-capacity and 256 received-capacity cases, including their distinct zero defaults;
- six native vector-end cases, including 9, 32 and 1,000 entries;
- nine current Node initializer captures at the actual builder seams;
- all fourteen compact locale subsets and the connected picker/plugin/modal/list/roster source paths.

The replays execute unchanged selected instructions against explicit memory,
localization/memcpy and parent-builder seams. They do not run Rust, ECS, a game or
a service, and source checks are connectivity checks rather than Rust execution.
The changed Rust modules parse. Three Rust regressions are authored/unrun: the
capacity default distinction, a twelve-row live renderer/close lifecycle and a
two-slot received roster with one hero. These fixtures use an isolated menu save
and the existing English test locale; they do not need a network or player files.

No application compilation, compiling tests, game/network session, GPU/input
execution, supplied lobby snapshot execution or original/rebuilt UI comparison
ran. Actual layout, fonts, interaction, scrolling/refresh behavior, display
scaling and preservation across UI lifecycle remain unverified. The excluded
producer boundary and all remaining #63/#41 limits stay explicit.

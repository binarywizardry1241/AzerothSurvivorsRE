# Public lobby directory — 0.115.0

Target: `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`
(142,111,232 bytes). This is the public-directory source owner for #99;
[co-op forms/session service](coop-forms-0.115.0.md) and #100 own host/join actions.
Current implementation and verification status belong to
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
The original evidence below retains its 0.115.0 target; the worker extension
at the end has separate current provenance.

## Received snapshots

The [schema manifest](evidence/0.115.0/coop-directory/manifest.json) binds receiver
`14021b980`, row parser `1400749a0`, class filtering and stable title sorting.
`coop/directory.rs` accepts only exact `type: "lobbies"` events, replaces the
whole snapshot, and retains absence until the first received list. Missing or
non-array `list` becomes an empty received list. Every array element produces a
row, including null and non-object values with native defaults.

String fields are `code`, `name`, `description`, `hostTitle`, `hero`, `class`,
`zone` and `country`; missing/wrong types become empty. `classes` keeps unsigned
JSON integers cast to their low byte, ignoring other entries. `players` and
`max` retain unsigned 64-bit values with defaults one/five. `opened` defaults
true; `locked` defaults false. Nonempty host titles sort first, stably within
both groups, including the native large-list sorting paths.

`zone` at this boundary is the exact received **localized display string**.
The UI filter/cycle compares that string byte-for-byte. The server's canonical
zone key belongs to the earlier wire-to-menu projection; it must not replace
this received value in the UI predicate. Host title, country and join code are
retained independently from the display name and local class's eligibility.

## Binary producer, transport and refresh

[Response evidence](evidence/0.115.0/coop-directory-response/manifest.json) binds
binary decoder `145b7af90` and JSON producer `145997f80`. `coop/directory_wire.rs`
reads tags 20–30 with length-prefixed UTF-8-lossy strings and little-endian
integers. Tag 20 carries lobby records followed by an optional capacity byte per
row: absent means five, present clamps to 1–5. Mandatory truncation rejects the
message; unused trailing bytes remain accepted. The lobby wire flags `open`
and `locked` are independent. Menu `opened` compares the raw zone's native
index with the **selected local class's** saved unlock count, clamped to 1–12;
unknown zones use index zero. Class/zone display values use the native locale
keys with English fallback; invalid class IDs produce empty class text.

[Transport evidence](evidence/0.115.0/coop-directory-transport/manifest.json)
binds URL override, lazy connection, thread/queue ownership and the original
worker's activity/error/close boundaries. `coop/websocket.rs` reuses the exact
embedded Tungstenite 0.30.0 version and its ordinary TLS/framing implementation.
The service owner submits encoded binary envelopes; WebSocket text is ignored.
The worker connects once, sends queued messages, receives one message per
iteration, and retains native socket-mode and idle-flush rules. It resets
activity before outbound send attempts and on Binary input; elapsed whole
seconds selects nonblocking mode, with a 40ms read timeout. Only the idle read
branch flushes and sleeps 1ms while nonblocking. Socket-option errors are
ignored; other send/read/flush error distinctions follow the retained sites.
Close sends the WebSocket close frame and flushes before ownership drops.

[Refresh evidence](evidence/0.115.0/coop-directory-refresh/manifest.json) binds
`14021c940`. `coop/directory_refresh.rs` preserves screen/list-tab, role/status
and ordered five-second gates. Zero is the initial timestamp; an automatic
refresh stores `max(now, 0.001)`. Explicit refresh and returning to the list
share that timestamp but store the raw clock in the application input owner.
The connection/service/host form adapter is shared with #100; a direct TCP roster
is a separate snapshot and never supplies the public directory.

[Lifetime evidence](evidence/0.115.0/coop-directory-lifetime/manifest.json) binds
Off-state idle closure at ordered elapsed **at least 60 seconds**, including
solo gameplay. Only unhandled co-op application commands 20–24 reset the
service request clock; ordinary menu/gameplay commands do not. Idle closure
queues Leave, closes/drops service transports and retains menu status, reason,
received snapshots and filters. `coop/directory_lifetime.rs` owns the predicate;
the shared service adapter owns scheduling and queue execution.

## Native row presentation

The schema manifest also binds row frame `14020a850`, content `1402ebc50`,
host-title wrapper/tooltip `14020b170`/`1402ecfc0` and class-icon lookup
`145809ca0`. `coop_directory_row.rs` preserves the native title, description,
localized hero/class/zone subtitle, class icons, country and player/capacity
count. Password and unopened-zone warnings remain separate flags. Titled hosts
use the native purple border and hover tooltip; normal rows use the native
brown/gold border, with eligibility-dependent lift and opacity. Geometry, font
sizes and raw-ID icon fallback are bound by the retained style/class tables.
The indexed list call sites use the row helper and hover plugin. The shared
forms owner preserves join code independently of displayed lobby metadata.

## Application connection

`coop_directory.rs` lazily starts the shared configured worker, submits native
binary handshake/refresh envelopes and consumes binary responses through
`decode_response`/`lobbies_message`. It uses the backend-selected class and that
class's saved unlock count; locale fallback is applied once at native label keys.
The exact received snapshot feeds `CoopUi.lobbies`, preserving wide counts, all
metadata, native defaults, absence-before-first-list and stable title ordering.
Direct-session roster publication writes the separate `CoopUi.lobby`.

The service preserves native idle teardown → received events → selected command
processing order. Only selected co-op requests touch the request clock; manual
refresh and list-tab return share the native timestamp with automatic refresh.
Idle service closure leaves UI reason/status, list and filter selections intact.
The queue close flag skips further sends/reads before close/flush; enqueueing Leave
does not prove that the asynchronous worker sends it before closing. #100 owns
the shared Host/Code/session protocol and its remaining execution limits.

## Validation and limits

- `check-coop-directory.py`: 445 bounded original-instruction schema,
  replacement, unsigned-value, stable-sort, icon and geometry cases, with 94
  hash/source guards. `--integration` additionally checks the live mapper/call sites.
- `check-coop-directory-response.py`: 2,896 bounded decoder, truncation,
  optional-capacity, label/class and local-progression cases.
- `check-coop-directory-refresh.py`: 4,480 bounded gate/clock cases,
  including nonfinite inputs and every excluded role/status combination.
- `check-coop-directory-transport.py`: 15 current native ranges, five
  tables, one dependency path, nine Ghidra certificates and socket source guards.
- `check-coop-directory-lifetime.py`: 2,214 bounded idle, selected-command
  clock and close/continuation cases, six ranges and two Ghidra certificates.
- Cargo lock metadata resolution and Rust syntax parsing run without compilation.

JSON access, allocation, drops, locale/formatting and queue/ECS ports are explicit
replay seams. Authored Rust regressions are uncompiled/unrun. These checks do not
execute reconstructed source, OS sockets, TLS negotiation or a directory server.
The live row mapper/call sites, plugin registration and shared application service
adapter pass their source integration checks. Compilation, service behavior, rendering, gameplay and
original/rebuilt parity remain unverified; #63/#41 keep their broader limits.

## Current worker RTT extension — 0.127.0 (#41/#291)

The worker now stamps raw service ping probes immediately before sending,
echoes incoming probes immediately through the same writer, and consumes
transport replies before ordinary directory decoding. Each worker retains its
own clock origin and shared peer-to-f32-millisecond map. The owning service can
read the live map through the Worker handle; reliable relay sequencing remains
in its existing layer. The [current co-op report](coop-dispatch-0.127.0.md) and
its canonical evidence own the native byte ranges, identities, selection rules
and the higher-level Ping/Pong, roster and UI connections.

`python3 -B scripts/check-coop-directory-transport.py --current-rtt` passes
16 selected current byte/assembly ranges, three query receipts and the two
connected source paths. `--source-only` checks retained socket wiring without
revalidating the historical native target. Six authored Rust regressions cover
probe stamping, truncated and length-mismatched input, exact echo bytes,
fractional/saturated measurements, raw queue delivery, live sample handles and
same-pass dynamic worker creation/removal.
They remain uncompiled/unrun. Compilation, actual socket/service timing and
original/rebuilt parity remain unverified.

The current Session sends application Ping23 every two seconds only while the
local Game is absent, after requesting the selected service transport's probe.
Pong24 prefers the selected worker's rounded millisecond sample; absent samples
use wrapping application-clock subtraction. Values above9999 are ignored and
accepted samples use integer `(new + 2 * previous) / 3` smoothing. A present
dynamic transport remains selected even while unready.

Service33 supplies independently keyed country metadata, retained across peer
close and reset by Hosted21. The host's country uses key0; accepted connections
read their service peer key dynamically. Wire17 roster rows carry mandatory
optional-u16 RTT followed, after the zone/rank, by optional per-row country
strings. Chat22 carries authoritative identity/name/class/text; remote admission
allows four messages per five seconds and text normalization splits Unicode
whitespace/control before its160-scalar cap. Current protocol/queue regressions
are authored but uncompiled/unrun; actual application/UI admission belongs to
the owning party consumer and does not follow from codec availability alone.

The service publishes its shared RTT handle selection after processing all
incoming events, secondary lifetime changes and form requests. The following
Network/Pong pass therefore observes newly created or removed dynamic workers
immediately, while the selected sample map continues to update live.

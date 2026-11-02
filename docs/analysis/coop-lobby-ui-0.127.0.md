# Cooperative lobby chat, member metadata and admission — 0.127.0

Permanent finding **#291**. The installed target is 0.127.0, 146,721,280 bytes,
SHA-256 `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [native manifest](evidence/0.127.0/coop-lobby-ui/manifest.json) binds the
selected original owners, data, independent instruction decoding and journaled
Ghidra results. Raw subjects omit external switch tables and callees; exact
retained table bytes establish only the explicitly traced dispatch branches.

## Retained chat state and unread messages

Current `1402af200..1402af325` appends a 64-byte row, removing the oldest when
the new length would exceed **80**. It increments the resource's chat revision
at `+0x190`. The unread counter at `+0x1a0` increments only when both row bytes
`+0x38` and `+0x39` are false and the window-open byte `+0x1b4` is false.

The `coopchat` branch of `1402e12e0..1402e2e45`, selected by the exact table at
`14627aa18`, reads `id`, `name`, `classId`, `text` and `me`. Its stores establish
that row `+0x38` is **own message**, `+0x39` is **system message**, and `+0x3a`
is the class byte. Join/leave rows have blank sender fields, system=true and
the localized `{name} joined the party.` / `{name} left the party.` templates.
They do not increment unread.

The same consumer clears chat rows, draft and unread on off, closed, ended,
refused, unavailable and joining states. Hosting clears them when the previous
status differs; repeated hosting and ordinary joined/left updates preserve
history. Reset advances chat revision and epoch independently from the modal
layout generation. `1402deba0..1402df1e1` resets unread on opening the window
and closes it outside the active lobby screen.

## List identity and scroll retention

`1402e4490..1402e542a` caches the modal inputs and preserves a matching ChatList
entity across modal rebuilds. It selects an **820×680** ordinary modal or
**1120×680** active-party modal. These dimensions are current f32 data at
`1462777e0..1462777ec`.

The modal content retains 36px horizontal/24px vertical padding and 12px row
gaps. The party's code and selected run sit above a body row with 20px between
its 600px member column and flexible chat panel. Member slots are 54px high;
their class icons are 38px. Class/race labels use 13px text and a 6px gap. The
member DTO has no achievement-points display field; carrying points in the
network roster does not establish a visible points label.

The chat panel uses 12px padding, a 1px edge, 8px corners/gaps and a vertical
black(alpha .42) to brown(.05,.02,.01,alpha .55) gradient. Its title is 16px,
subtitle 12px, ordinary chat text 14px with an 18px class icon, and system rows
12px. The sender prefix and message are one wrapped text with independently
colored spans. Own rows have a gold background at alpha .07.

`1402e5540..1402e6127` keys the list by chat epoch and revision, appends only new
rows and evicts children which no longer belong to the 80-row history. It follows
the end when within **four logical pixels** of the bottom, or when one of the
new rows is the local player's own message. Otherwise it preserves the reading
position. If old rows are evicted, it subtracts their measured heights plus
**3px** row gaps from the retained offset, clamped to zero. The threshold and
gap are exact current data at `1462777ec` and `146233134`.

## Packet and member metadata boundaries

The selected current lifecycle serializer maps local variant21 to wire **22**:
GUID:u64, sized UTF-8 name, class:u8 and sized UTF-8 text. Wire **23** carries a
host millisecond timestamp; wire **24** echoes that timestamp. These fields are
separate from the existing Time packet and world synchronization messages.

Current wire17 appends an RTT:u16 after each row's existing eligibility flag;
`ffff` denotes unavailable. After every row come the existing zone String and
Heroic rank, followed by the optional parallel country strings, one per row,
with **no additional row count**. The reader stops assigning countries when
the packet ends, preserving empty countries for omitted suffix entries. RTT
remains mandatory; this is not permission to parse an older roster layout.

The [shared dispatch proof](coop-dispatch-0.127.0.md) closes the transport and
country producers. Service33 carries service-peer:u32 and a sized country
String. The live service map retains values across ordinary closes and clears
only on Hosted21. Accepted connections read their own service peer ID; the
host listener reads key0. The shared country helper trims Unicode White_Space,
ASCII-uppercases and accepts two ASCII letters except XX. The roster country
reader applies the same helper, including UTF-8 replacement before validation.

In the absence of an embedded local game, joined/nonclosing host peers request
a ping immediately, then at least 2 seconds apart. The request clock advances
before the connection's transport probe and gamePing23. Guest Pong24 echoes
the exact timestamp. A service connection reads its selected transport's live
RTT sample; a direct TCP connection has no transport sample. Transport selection
and its raw service5/6 probe remain separate from the reliable relay0..4 stream.
The host rounds an available f32 sample before saturating unsigned conversion;
otherwise it uses wrapping application-millisecond subtraction. It rejects
samples above 9999 ms and stores `(new+2*old)/3` after initialization. The host
member has no RTT; other members display `… ms` when unavailable, green below 100,
gold below 200 and red otherwise.

Remote chat admission belongs to a joined, nonclosing peer with an actual
normalized Hero, while the driver is hosting and no game is active. Current
`145bd7620..145bd78fb` removes timestamps at least five seconds old, requires at
most three retained timestamps, then records the accepted message and fans it
out. Therefore the remote limit is four accepted messages per five seconds.
The host replaces claimed sender fields with the admitted Hero's GUID, name
and class. Host-local input has a separate producer and must not inherit this
remote-only limiter without evidence.

Normalization splits on Unicode whitespace/control characters, removes empty
words, joins with ASCII spaces and then takes 160 Unicode scalar values. Guest
requests supply zero GUID/class and an empty name; only the host's admitted Hero
supplies sender metadata. The guest route requires admission, no accepted
ZoneKey and no synchronization request. These are independent state gates;
neither a cached State15 nor a local rendering/mechanics proxy replaces them.

Keyboard input always selects Chat in an active party. The draft clears on
submission even if trimming leaves nothing to send. It always displays a caret;
an empty draft shows a gold caret followed by the muted placeholder. At 47 scalars
the displayed text becomes an ellipsis plus its final 45 scalars; the real draft
remains intact. The counter appears at 120 and turns red at 160. Send uses 14px
text. The active field renews the shared IME focus request with its measured
bottom-left position; platform composition/commit ownership is documented by
[the IME proof](ime-bridge-0.127.0.md).

The picker waits only when role=host, status is hosting/joining/joined/left and
the received member count is below 2. Eligibility does not enter this predicate.
Both mouse and keyboard entry requests consume it, and the footer uses the
same result for its disabled state and `Waiting for players` caption.

## Connected source and remaining recovery

`coop/server_party.rs` and `coop/replication.rs` carry the current chat, ping and
roster fields through the existing framing boundary. `coop/session.rs` admits
lobby chat before world synchronization, receives guest rows, publishes to the
joined recipients and local UI, and owns remote admission timestamps. The
actual normalized Hero and active-game gate remain the application owner's
responsibility. `coop_runtime.rs` projects received member metadata and chat
rows into `CoopUi`; `coop_chat.rs` holds the bounded history and independent
own/system unread state. No transport or metadata value is synthesized.

The application owner now connects local/admitted remote senders, exact text
normalization and the independent host/guest state gates. `coop_directory.rs`
and the service worker connect country and transport RTT to the Session's live
metadata getters. `coop_chat.rs` renders/reconciles the persistent chat subtree;
unrelated modal rebuilding reparents it rather than replacing its rows or
scroll position. The actual menu and footer consume the two-player predicate.
The member row now exposes **Kick** exactly when role is `host` and that row is
not the host. Action8 carries its received Hero GUID through local request26,
the Forms/directory queue and the actual admitted `CoopGame::profiles` lookup.
The backend independently requires the hosting network role; it adds no active
game restriction. `Session::kick_client` forces that peer's queued output before
the exact wire3 denial **“the host sent you away”**, closes the actual transport
and reuses ordinary Left/Removed retirement. The same Apply pass drains those
events into existing world consumers. Service request7/response23 remain a
separate protocol. The [dispatch proof](coop-dispatch-0.127.0.md#local-requests-and-decoded-messages)
owns the native ordering. Authored UI/GUID/transport-order regressions are
uncompiled and unrun; no server or network execution was performed.

The guest receive owner stops at Denied. The source preserves earlier messages
but discards later decoded/buffered input, so it cannot be re-admitted after the
Off transition. The queued batch keeps its upstream origin after the network
role changes. Its Denied consumer drops only the old guest role's owned cache
through `CoopGame::leave`, preserving the raw refusal reason. Existing status
synchronization clears the received lobby, chat draft, history and unread state.
The native branch does not establish ordinary failed-run settlement, defeat
awards or a replacement disconnect reason. It does not reset the original local
Game, so the source does not force RunSession, menu or local-client teardown.
Post-admission engine/client/menu lifetime and original/rebuilt behavior remain
an explicit verification boundary; no synthetic local-game reset is substituted.

`python3 -B scripts/check-coop-lobby-ui.py --contract lobby-kick` verifies six
retained native ranges/extract hashes, the GUID/request/flush/retirement source
connections and six Rust syntax parses. It executes no native instructions,
Rust regression, application or transport.

Nine selected labels have exact values from all 14 native locale payloads in
the [locale receipt](evidence/0.127.0/coop-lobby-ui/locales.json).

## Authenticated staff titles and name color

The current roster title producer validates the existing profile's six fields:
party code at 00, name at 18, title at 30, world GUID at 60, UNIX expiry seconds
at 68 and raw signature bytes at 48. The expected code comes from the actual
Host/Join service event and is supplied only while that service handle exists.
An unready retained handle still supplies context; a stale UI code after handle
removal does not. Empty expected context fails validation.

Validation requires exact code/name/GUID equality, strict future expiry, a
nonempty raw title and exactly one occurrence of that identity in the roster.
The signature is exactly 64 raw bytes. Its preimage is the 22-byte domain
`azeroth-coop vouch v1\0`, followed by each of code/name/title with every NUL
removed and one NUL separator appended, then GUID and expiry as LEu64. The
fixed public key is
`bc6a6dd554756700632f16e24ddbbdd3ecbe16f30ee96466242b2ccdfcccfc0e`.
`coop/staff.rs` uses pinned ed25519-dalek 2.2.0's
[verify_strict](https://docs.rs/ed25519-dalek/2.2.0/ed25519_dalek/struct.VerifyingKey.html#method.verify_strict)
interface. Generic curve/signature internals remain library-owned. After
successful verification it removes C0/C1 controls and takes 24 retained Unicode
scalar values. A title consisting only of controls therefore renders no staff
presentation even though its raw title was nonempty.

The native profile reader decodes only its first three fields as Strings.
The final signature lane is a sized byte vector. The previous shared source
decoder incorrectly replaced invalid UTF-8 in that binary lane; the staff fix
preserves it for both Hero and Roster packets. Authored boundary regressions
cover a non-UTF8 raw 64-byte signature while keeping String replacement intact.

`140334b70` and its wrapper use the existing title hover interface: the actual
name text remains in the row and its 13px title tooltip sits above it, hidden
until hover. The source reuses the directory's identical title constructor,
including 8×3 padding, 1px purple border, 4px corners and Z9000. Only the actual
name Text receives the unit `StaffName` marker; the entity command's payload
is an entity ID and flag, not color data. The chat renderer marks its name text
when that message's nonzero GUID currently matches an authenticated titled
member. Preserved older chat rows retain their existing marker.

The marker's updater uses unwrapped `Time.elapsed_secs()` and the complete
`Entity.to_bits()` value. The raw low32-zero sentinel is skipped. With
`t = sin((entity_bits % 7) * .6 + elapsed_secs * 3.2) * .5 + .5`, it mixes
Srgba low `(.56,.27,.98,1)` and high `(.86,.66,1,1)` componentwise as
`low*(1-t)+high*t`. It writes TextColor only when the result differs, leaving
the message body, tooltip title and ordinary names unchanged.

`scripts/check-coop-lobby-ui.py --contract lobby-chat` verifies 26 bound
queries, 15,281 original instructions and **238 isolated original-instruction
cases** for the 80-row cap, unread state, four-pixel/own-message scroll,
two-player predicate, selected Node constructors, raw signature parser, signed
preimage, title sanitizer, pre-crypto rejection gates and pulse/mix interfaces.
It also checks both actual
entry routes and the footer's predicate/caption connection. Byte movement,
allocation, selected-run header construction and the already-Srgba color copy
are explicit scratch-memory seams; staff checks additionally supply memcmp,
Vec growth, name-text construction and the CRT sinf interface. They do not
execute generic cryptography. The locked dependency update added 12 packages
while retaining every previously locked package version; locked offline Cargo
metadata resolution passed without compilation.
Authored Rust regressions have not been compiled or run. These are static
results: compilation, actual lobby traffic/timing, Unicode input,
scroll/rendered layout and original/rebuilt parity remain unverified. No game,
client, server or service was operated.

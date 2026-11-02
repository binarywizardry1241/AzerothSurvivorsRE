# Cooperative dispatch interfaces — 0.127.0

Finding **#41**, with the actual cooperative source interfaces under **#63**
and chat/RTT consumers under **#291**. The installed EXE is 146,721,280 bytes,
SHA-256 `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/coop-dispatch/manifest.json) binds current native
queries, exact original instruction ranges, table cells and inspected source.
This resolves four bounded dispatch-role questions; it does not establish the
complete server/driver, all incoming values, working networking or parity.

The queried frame contains four exact Rust `Location` references to original
`server.rs` and six to `server/party.rs`; the received-message handler contains
four more to `server/party.rs`. Their instruction operands, path pointers,
line/column records and original Windows path bytes are bound by
`diagnostic_owners` in the manifest. These establish the bounded owners
`custom-game-server` and `custom-game-server-party`. “Driver” below labels the
reconstructed coordinator object and its fields; it does not identify the
original `driver.rs` module or establish an original Rust type name.

## Local requests and decoded messages

`145bb29f0` polls its existing local-client interface at `+1a78/+1a80`, vtable
slot `+28`, and walks the returned request vector with stride **0xe8**. The
four-byte discriminant is copied with its payload before the ordinary command
consumer gets first refusal. Table `145bb6640` then selects the six actual local
request discriminants **22–27**, after the observed subtract-two and subtract-20
operations. These are not cooperative wire tags.

| Local request | Current native branch | AS interface |
| --- | --- | --- |
| 22 | `145bb6642` | Ensure the service connection and request a lobby refresh. |
| 23 | `145bb6ae6` | Host form, including the actual name/password/description, public flag and bounded capacity. |
| 24 | `145bb68e8` | Join form, with the retained requested code/password and existing service connection. |
| 25 | `145bb6a4d` | Leave/close transaction, then consume the retained service state. |
| 26 | `145bb66f7` | In hosting mode, locate the actual hero identity, send the denial **“the host sent you away”**, close its transport and remove its connection row. |
| 27 | `145bb6be8` | Normalize chat text and route it through the host or joined guest path. |

The current source counterparts are `coop_directory.rs`, `coop_forms.rs` and
the Session/server-party owners. **#291** now connects the host's nonhost-row
Kick action to the received Hero GUID, through its local request queue to the
actual normalized `CoopGame::profiles` entry in connection order. The backend
requires hosting role and adds no game-state guard. The Session shares its
existing peer flush, closes the actual transport and reuses ordinary party
retirement; Left/Removed events reach existing world consumers in that Apply
pass. The [lobby report](coop-lobby-ui-0.127.0.md) owns presentation and authored
uncompiled regression coverage. No application or network parity is inferred.

Kick constructs internal Denied variant **2**, whose serializer branch
`145d14d2f..145d14d51` emits cooperative wire tag **3**, then the u32 byte
length and reason bytes. The reason's native vector is capacity/pointer/length
at message **+8/+10/+18**. It flushes the selected peer's queued output,
serializes and sends this denial, releases the temporary buffers, closes that
actual connection and finally removes its client row. Those calls occur at
`145bb67eb`, `145bb6814`, `145bb6849`, `145bb68bb` and `145bb68dd`, in that
order. Outer service request 7 and service response 23 are separate protocols.

The guest receives native Denied **2** through table cell 1 at `145bd83e2`.
It preserves the reason, moves the old network-role payload aside, writes role
Off, closes and drops the old guest connection, then publishes `coopstate`
state **`refused`** with that reason. There is no joined, ZoneKey or Game guard.
The caller stops its receive loop after this role transition. This direct branch
does not call the ordinary dead-host/disconnect failure helper or directly reset
the embedded local Game. The existing current lobby consumer compares
`refused` at `1402e2800`/`1402e2938`, clears member/chat state and retains the
status/reason. It bypasses the closed/ended-only request producer at
`1402e2b04..1402e2b16`; refusal generates no Game-reset or Leave request there.
The manifest references that consumer's existing canonical assembly instead of
duplicating it. Independent engine-client retirement remains a separate path;
ordinary guest settlement or awards cannot be inferred from denial or close.

The host receive loop at `145bb4eb2..145bb4fc1` counts at most **200** outer
receives per peer. Existing connection helper `145cc1eb0` returns a **0x238**-byte
decoded message or the `-1` absence sentinel. A nonclosing peer's exact message,
peer index and current time reach `145bd6280` before the next receive. The guest
uses the same receive helper and its separate `145bd7b40` dispatcher. This is the
actual producer/consumer boundary; the connection helper's wider transport work
remains owned by the relay/session reports.

Table `145bd6353` uses the message's **native niche encoding**. A nonnegative
first qword selects variant 3; otherwise the selector is that qword XOR
`0x8000000000000000`. Direct variants 0 and 19 are handled before the joined
gate. The table's bounded local domain 3–23 has the following distinct actions:

| Native variant | Current action |
| --- | --- |
| 3 | Copy and sanitize the actual Hero record, then follow the existing identity/profile consumers. |
| 5 | Synchronize only with an assigned world context and synchronized byte still clear. |
| 6 | Admit the ordinary engine opcode/body only when synchronized. |
| 7 | Pass the control payload to the existing command owner. |
| 16 | Close this actual connection. |
| 21 | Pass the text and actual peer index to the host chat owner. |
| 23 | Update this peer's bounded, smoothed RTT. |

Other table entries select the ordinary owned-message cleanup. Variant 0 is
the admission owner; its exact current version/protocol proof belongs to the
separate admission report. Variant 19 expands the bounded compressed batch and
recursively dispatches each contained message. The current wrapper
`145d17330` rejects inflated output above **4 MiB**, retains parse failure and
cleans up the remaining owned message records.

## Cleanup alias classification

`145bd679a` is the exit after that variant-19 compressed path. Its selector
retains the original first qword in Win64's nonvolatile R12. The only body
writes to R12 are the two original-message loads at `145bd62e6` and
`145bd64ae`; its final pop restores the caller's value. The successful compressed
path therefore selects table cell **19**, which returns at `145bd706a` after the
compressed storage has already been released. The table's 22 encoded cells are
not 22 demonstrated incoming message behaviors at this site.

`145bd7007` is the ordinary-exit alias of the same message selector. Its cleanup
distinguishes the already-consumed cases, the nested Hero owner, the engine-byte
vector, and the two chat strings; other variants use the existing message drop
helper. The chat path suppresses the second string's repeated release after the
host consumer has consumed it. These are owned-payload lifetime operations,
not additional protocol messages or a new AS garbage-collection system.

## Chat and RTT boundary

The joined guest chat path requires joined `+11bc == 1`, absent accepted ZoneKey
pointer `+1190 == 0` and Sync-requested flag `+11bd == 0`. It supplies an empty sender string and
the normalized text to native variant 21. The host ignores that supplied sender
and uses the actual sanitized peer profile. Host helper `145bd7620` reads the
real GUID, clones the stored name and supplies the profile's class byte to
`145bd2db0`. Its per-peer history retains timestamps younger than **5 seconds**
and admits at most **four** messages in that window.

Normalizer `145b53c70` collects nonempty words using iterator `145d003a0`,
joins them with one ASCII space and keeps the first **160 Unicode scalar
values**. Its separator predicate includes Unicode White_Space **and control
characters** (`U+0000..001F`, `U+007F..009F`). The exact control branches at
`145d00400` and `145d00409` matter: a whitespace-only split would preserve
other controls. Host fanout `145bd2db0` sends to joined, nonclosing peers and
publishes local chat using the actual sender GUID to derive `me`.

Guest fields **+1190/+1198** are a nullable borrowed canonical ZoneKey
pointer/length pair. Wire 5/native variant 4 calls `145b05300`, selects the
current 240-byte zone-table row and stores its static key at `145bd7ff1`.
The exact case-sensitive lookup defaults every unknown key, including empty
input, to row **0 / elwynn**. Thus receiving an unknown key still sets `Some`
canonical key. The guest constructor initializes the pair absent and both flags
false; Accepted sets `+11bc`. The separately retained
[PLAYER_LOGIN producer](coop-bootstrap-0.127.0.md) sets `+11bd` when requesting
Sync. Zone teardown clears `+1190` and clears cached State separately. These
fields are distinct from a vector length, chat text, connection closing and the
host's embedded local Game slot.

The exact current serializer, shared with the
[canonical ItemQuery carrier proof](coop-item-carrier-0.127.0.md), establishes:

| Native variant | Wire tag | Payload |
| --- | --- | --- |
| 21 | 22 | GUID u64, length-prefixed name, class u8, length-prefixed text. |
| 22 | 23 | u32 timestamp. |
| 23 | 24 | u32 echoed timestamp. |

The full serializer table also contains variant 24/wire 25, whose ItemQuery
contract remains in that canonical proof. A selected 24-cell prefix is not a
complete serializer domain. The existing decoder's 25-cell table and entry are
also retained there; packet ordinals are never inferred from the local command
table or the niche value alone.

The RTT consumer first asks the actual connection's vtable `+60` for its RTT
mode. It rounds the supplied float through the actual CRT `roundf` import before
saturating unsigned conversion; otherwise it subtracts the
received u32 from current application-clock milliseconds with native wrapping.
Values above **9999 ms** are rejected. The first accepted sample initializes the
optional u16; later samples store integer `(new + 2 * old) / 3`. The separate
timestamp producer, echo, sampling cadence and presentation belong to **#291**.

The current frame requests a sample only in its lobby/no-game state, for joined,
nonclosing peers. The per-peer request clock starts at negative infinity, so
the first eligible poll sends immediately. Subsequent requests require at least
**2 seconds**, update that clock before sending, and use native variant 22/wire
23. The connection's own ping method remains a distinct call before that message.

The field identities are separate: **Driver +d98** is the network-role enum
(guest 0/1, off 2, host 3), while **Driver +10** contains the embedded **local
Game slot**. Its proved value 2 means no populated local Game. The request
guard at `145bb50f5` compares the latter to 2. Host constructor `145bd2640`
tests both fields independently at `145bd265f`
and `145bd2665`, then writes host 3 specifically to **+d98** at `145bd2713`.
The outer role selector and original Driver reload at `145bb4ad0..145bb4b26`
establish the frame alias. Client-row **+10** is a third, distinct connection
state field. The [canonical Game-slot producer proof](evidence/0.127.0/coop-dispatch/game-slot-producers.json)
binds initialization, take/reset, actual Game construction and publication.
Its 15 selected ranges and preserved R14 result-pointer block are checked
without duplicating extracts. The complete original Rust type name and the
other valid variant names remain unclaimed. Local Game absence is distinct
from paused/started flags, renderer readiness and cached remote State.

The guest's native-variant-22 branch at `145bd7bff..145bd7cc8` accepts native
modes **0 or 1**, copies the timestamp unchanged into variant 23 and sends it
upstream after flushing existing queued output. This branch has no additional
joined/readiness gate. The guest body and full serializer are reused from the
canonical ItemQuery query receipts; no duplicate full decompilation is required.

### Actual transport RTT

The accepted service-peer vtable **14771cc60** supplies real implementations:
slot **+58** calls `145cc9770`, and slot **+60** calls `145cc93a0`. The latter
selects the service's ticket or initial underlying connection and asks its
slot **+38** for `(Option tag, f32)`. Initial setup and primary factory
`145ba6660` both install exact vtable **147082478**. That slot is
`145b94e50`, which delegates to the per-peer RTT map reader `145b9e4b0`.
The standalone joined connection's own slots are separately proved no-op and
`None`; the service connection must not inherit that behavior.

The start-ping method wraps the nine-byte control **5 + zero u64** in a service
Relay request. The actual transport loop `145b91e70` stamps outgoing tag-6
frames when their raw length is at least 18 and byte **+9** is 5. It replaces
the u64 at **+0xa** with microseconds from that transport's origin retained
before the handshake:
seconds times 1,000,000 plus nanoseconds divided by 1,000.

Before ordinary service decoding, helper `145b9e650` intercepts incoming
tag-26 frames with raw length at least 18 and payload kind 5 or 6. Kind 5
copies the first 18 bytes, changes the outer tag to 6 and payload kind to 6,
then sends the reply. The original peer, length and timestamp bytes survive.
Kind 6 stores **f32(now_us.saturating_sub(stamp_us)) / 1000.0** in the map keyed
by the frame's u32 peer identity. Both control kinds are consumed here. This
interceptor does not add a declared payload-length check; other frames continue
through the ordinary service and relay decoder. These raw transport controls
are distinct from cooperative wire 23/24's u32 application-clock echo.

Constructor `145b7d5f0` initializes one empty shared RTT map, returns it at the
underlying connection's **+30** and passes the same Arc in its thread closure
at **+48**. Thread wrapper `145b962c0` forwards that exact field to the receiver,
while the vtable reader uses the returned connection field. A missing entry
returns `None`; a received measurement returns the actual f32 milliseconds.
The host's existing roundf/bounds/smoothing consumer applies afterwards. This
establishes the needed AS transport interface without a general socket, thread
or hash-map reconstruction.

The RTT getter selects the ticket port at service **+130/+138** whenever its
metadata at **+60** is present; otherwise it uses the original constructor
port at **+180/+188**. It performs **no readiness test** and does not fall back
from a present, unready ticket port. Start-ping selects the same port, then
requires that selected port's ready method to return true. A present ticket
port additionally requires its closing flag clear and retry clock sentinel
unchanged. Source `Service.worker` denotes the original port, while
`Service.secondary` denotes the ticket port; their names must not reverse
these original offsets.

## Roster RTT and country appendix

The current roster row is **0xb8** native bytes. Wire 17 writes each row's
existing GUID/name/class/race/profile/achievement/eligibility fields, then one
u16 RTT: the optional value when present, or **0xffff** for absence. The decoder
uses that sentinel to reconstruct the optional value; it does not publish 65535
as measured latency.

After every row, the packet writes its common zone and heroic rank. Only then
does it append one length-prefixed country string per row, with **no additional
count**. The current decoder iterates its already-built rows and reads a country
only while bytes remain. An absent country appendix therefore retains empty
strings; a partially present string still follows the reader's malformed-input
rules. A count or country field must not be inserted into the fixed row prefix.

The frame calls current producer `145bd4660`, whose iterator uses
`145d07900`. It includes the host first, then joined peers with an actual
sanitized Hero record. Each remote row copies its actual GUID, stored name,
class/race and optional RTT at client `+4e0`. Its country is returned by the
actual connection's **vtable +50** accessor, not an outgoing-packet buffer or a
guessed client field. The host has no measured RTT and obtains its country
through the existing listener's separate getter.

## Country service metadata and normalization

Current service decoder `145ec1e60` accepts tags **20–33**. Tag **33** reads a
u32 service peer identity followed by a length-prefixed string and constructs
native variant **13**. PeerOpen/tag 24 remains a peer identity alone; country
does not extend that packet. The full tag table, selected original branches
and completed decoder query are bound by the manifest.

Both service 33 and the roster appendix call string reader `145ec36e0`, then
country helper `145ec0790`. The reader bounds-checks the four-byte length and
payload, replacing invalid UTF-8 with `U+FFFD`. The selected conversion writes
explicit replacement bytes **EF BF BD** at `146031f4c..146031f59` and
`146031fe1..146031fec`. Invalid UTF-8 alone does not clear the reader's validity
flag; a truncated length or payload does. Country normalization therefore
turns a length-valid invalid country into an empty string without failing the
whole message.

The helper trims the exact 25 Unicode White_Space values, ASCII-uppercases
`a..z`, then accepts exactly two ASCII `A..Z` bytes except **XX**. All other
values become empty. This trim differs from the broader chat separator
predicate. Its shared lookup table excludes `U+200B` and `U+FEFF`; Python's
broader `isspace()` control set is not the native country predicate.

The existing service pump `145cb7780`, retained by the
[relay proof](relay-load-0.127.0.md), inserts variant 13 into the service-owned
country map at **+1c8**, keyed by its u32 service peer identity. This write is
independent of an existing peer row, so a country update may precede or follow
PeerOpen. The identity is distinct from the world GUID and local client ID.

Within this exact pump, **Hosted/tag 21** clears the map. The Joined/tag 22
tail exits before the Hosted clear block; Closed/tag 27 and PeerClose/tag 25
also preserve it. Original branch predecessors, field references and the map
insert/clear instructions are retained. The static checker traverses all direct
branches from these four event entries through their completion tails, with no
unresolved indirect jump in those paths.

The Hosted call supplies exact listener vtable **1470833d8** to `145bd2640`,
which stores its object and vtable at Driver **+e18/+e20**. Listener accept
`145cc8db0` pumps the service, pops its actual u32 peer identity and constructs
the 16-byte connection wrapper `{ shared Arc, peer }`, with vtable
**14771cc60**. The listener's country slot **+20** is `145cc8fa0`; the accepted
connection's country slot **+50** is `145cca780`. Both clone values from the
same live service map. The listener uses the proved u32 key **0**, and the
connection uses its own wrapper's **+8** peer identity. A missing key yields an
empty string. Neither getter snapshots country at PeerOpen or removes metadata
when its individual handle is dropped.

Service constructor `145cbf720`, called by the existing connection setup,
initializes this map empty. Its original constant loads and stack-to-Arc copies
are retained: the country map's mask, growth and item count begin at zero.
Arc **+18** is the service payload, so getter Arc **+1e0/+1f8** corresponds
exactly to the pump's service map **+1c8/+1e0**. This closes the country
producer, identity and lifetime seam without recovering generic map internals.

## Service event selector

The additional exact selector `145cb7c68` belongs to this directory/service
event enum. Its adjusted domain **1–13** is independent of the five reliable
relay controls and the cooperative message enum. The current decoder binds
every wire event to its actual native encoding; native 10 uses a nonnegative
owned String capacity niche, while the other listed variants use signed-minimum
plus their variant number. Native 0/wire 20 lobby rows take the unsigned default
after subtracting one and are forwarded; they are not another indexed cell.

| Native | Service wire | Pump destination | Bounded role |
| --- | --- | --- | --- |
| 1 | 21 | `145cb80da` | Hosted reset and publication. |
| 2 | 22 | `145cb8046` | Joined reset and publication, preserving countries. |
| 3 | 23 | `145cb83d1` | Forward Denied reason. |
| 4 | 24 | `145cb7f04` | Create endpoint and enqueue its peer ID for accept. |
| 5 | 25 | `145cb7dcd` | Retire endpoint/reliable peer, preserving countries. |
| 6 | 26 | `145cb7e92` | Deliver peer bytes to the existing reliable receiver. |
| 7 | 27 | `145cb8165` | Close dynamic port/reset party transport and publish Closed. |
| 8 | 28 | `145cb8fc2` | Consume empty event. |
| 9 | 29 | `145cb83d1` | Forward the structured roster-profile carrier. |
| 10 | 30 | `145cb827e` | Replace ticket port; authenticate and retain retry state. |
| 11 | 31 | `145cb7c6a` | Set reconnecting for the addressed peer. |
| 12 | 32 | `145cb7c6a` | Clear reconnecting for the addressed peer. |
| 13 | 33 | `145cb7d37` | Update country metadata. |

For control variants 11/12, peer zero addresses the guest: variant 11 sets its
reconnecting flag only when active; variant 12 clears it. Other peer IDs update
the actual endpoint's flag. Current `directory_wire.rs`, `coop_directory.rs`
and Session map these events to their existing profile, connection and reliable
relay interfaces. The manifest's `service_event_contract.branches` retains the
exact typed producer/consumer vector. This classifies the selected table without
claiming whole-service or external server-policy completeness.

The application retains the actual Hosted/Joined service-code String at Driver
**+1948/+1950/+1958**. Frame alias `145bb3527` selects that field; wire 21 and
22 clone their returned code and publish it through the alias. Closed/wire 27
drops it and writes the absent sentinel. Service initialization separately
creates the retained composite state at **+1918** and starts the code absent.
The staff-title caller supplies this code only when both fields are present,
otherwise an empty context; these are presence checks, not socket readiness.
The manifest's `staff_service_context_contract` binds those producers. The
staff helper's separate nonempty/context/name/identity/expiry predicates remain
owned by its current lobby/staff proof.

## Static validation and limits

`scripts/check-q41-dispatch-contracts.py --current-coop` verifies current target
bytes, selected assembly, exact table vectors and journaled native query/subject
receipts without compiling or running the game. Raw imports omit distant data
and callees; Ghidra's missing-switch warnings and generic inferred signatures
are retained limitations. Original Windows-x64 instructions govern these
selected calls and fields.

The inspected source connects the bounded message and service interfaces:
`server_party.rs` owns chat/country normalization and roster appendix fields;
`session.rs` owns joined Pong admission, per-peer RTT, actual-peer Kick and
dynamic country getters; `directory_wire.rs` and `coop_directory.rs` carry
service33 and its Hosted-only map reset. `websocket.rs` intercepts raw transport
5/6 controls before application delivery, with a per-transport clock origin
created before the handshake. Guest chat checks the actual absent ZoneKey and
clear Sync-requested flag in `gameplay/coop.rs`, whose ZoneKey receiver uses the
canonical row-zero fallback. These are inspected source connections and static
guards, not compiling tests or verified network behavior.

The existing Session's joined/assignment/synchronization and ordered application
interfaces are the source comparison boundary. Chat, RTT and kick source
connections are assessed through their owning feature proof; this report does not
reopen established source solely for current-target proof. Generic allocation,
drop, byte-copy and engine internals stop at their required AS interface.
Compilation, actual client/network/server execution, rendering and original versus
rebuilt behavior remain unverified.

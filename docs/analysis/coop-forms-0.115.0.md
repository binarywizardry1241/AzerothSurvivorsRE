# Host and code forms — 0.115.0

Target: installed read-only EXE, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [native manifest](evidence/0.115.0/coop-forms/manifest.json) binds the
request/input/presentation owners, with separate [wire codec](evidence/0.115.0/coop-forms/requests.json) and [service/relay lifecycle](evidence/0.115.0/coop-forms/lifecycle.json) records. [#100](../verification-needed.md)
owns current completion status. Public directory transport/response/refresh and
row presentation have separate [#99 evidence](coop-directory-0.115.0.md).

## Connected source

`coop_ui.rs` and `coop_forms.rs` retain the native fields across tab changes and
window dismissal. Host collects name, description and password; Code collects
code and a separate password. Unicode scalar counts limit the first/password
fields to 32, description to 120 and keyboard code input to five. Controls are
rejected; Backspace removes one scalar. Tab cycles name → description → password
or code ↔ password. Password display uses one bullet per scalar; focused fields
append the native caret. Field widths, typography, padding, borders and code
header follow the selected native builders. Actual rendering is unverified.

The keyboard/modal/Leave gate combines a nonempty role with phase
`hosting`, `joining`, `joined` or `left`. Joining text alone does not hide an
off-role form. Closing only hides the window. Leave closes the actual session;
its request clears party code/roster without erasing the retained edit strings.
Public-list selection uses the original complete-list index. An ineligible row
is ignored; a password row copies its received code and focuses the separate
join password; an eligible password-free row sends that exact code and an empty
password. The local filter key is the exact **received zone string**, which the
native service-to-menu projection localizes; it is not the wire's canonical
zone identifier.

`coop_directory.rs` drains typed form requests into one shared service worker.
Host/Join first commit and drain the complete current Pick through the existing
normalization, account restriction and save path: native command12 precedes
21/22. This prevents unsaved picker edits from advertising an older hero.
Host sends exact name/password/description, public=`!private` and capacity
zero→five/otherwise capped at five. Join preserves password bytes and normalizes
programmatic codes by ASCII uppercase/alphanumeric filtering. It never treats a
lobby code as a TCP address or substitutes the environment's direct-session path.

The worker reuses the recovered WebSocket transport, sends binary service frames
and consumes binary responses. The protocol3/version handshake is separate from
the inner party's protocol4 admission packet. Outgoing service messages cover
refresh, Host, lobby-profile update, Join, relay payload, peer close, Leave,
heartbeat, world-identity/name profile request and secondary authentication.
Service Created/Joined install actual relay-backed `Session` instances; ordinary
party admission, assigned peer IDs, native packet decoding, host simulation and
world synchronization remain owned by the existing session/gameplay paths.
Guest construction submits its inner handshake before the subsequent wire10
profile request; heartbeat follows received secondary/closure events.
A refused inner handshake moves the presentation to Off/`refused`; a service
rejection uses `denied`. Native phase/reason formatting preserves unknown reasons
and localizes known reasons and locked-zone messages.

`Session` relay handles share the native peer-ID map. Reopening an ID replaces
its queue; all existing handles observe that same replacement. Already received
packets drain after transport loss. Host and guest payloads select the secondary
relay when present; peer Close reaches both connections. Relay loss destroys a
host's primary service too; a guest retains the primary and queues Leave after
buffered packets drain. The runtime dispatches the final guest batch before
teardown and preserves banner events and that command across driver removal.
Host failure retains its earlier native teardown gate. Guest Leave goes to the
primary and closes its secondary. Shutdown checks the close flag before draining
outbound commands, so queuing Leave does not prove socket delivery. The service's
secondary URL is used exactly, authenticated with wire11, and never interpreted
as a direct TCP target.

An off-mode service closes at sixty seconds without another co-op request,
before applying service events and then queued requests; a queued request can
then open a new service. Its last presentation snapshot remains unchanged.
A connecting secondary expires after strictly more than eight seconds; heartbeat
uses the recovered thirty-second boundary. Idle time uses the application elapsed
f64 clock; heartbeat and secondary clocks use monotonic durations converted to
native f32 precision.

Wire10 requests cached profile29 while the service exists after it assigns a
code, when world identity or normalized Pick name changes. The cached profile
enters both live Hero constructors only when its world identity and normalized
name match. It is cleared at the recovered closure boundaries. The profile
module's pre-existing literal filesystem-path header was removed so it parses
as Rust.

The optional staff-key resolver reads a **path** from `WOW_ROGUE_STAFF_KEY`;
`none` disables it. Otherwise APPDATA, XDG_DATA_HOME, then HOME/.local/share select
`wenilla-rogue/staff.key`. File text is trimmed, with errors yielding empty text.
No real key or account file was read for this recovery; fixtures and reports
contain no credentials.

## Owning native contracts

| Contract | Current native owner |
| --- | --- |
| Form requests, profile-before-submit, public/capacity | `14020f670`, input `14021a1c0`, table `145f1452c` |
| Code normalization | `145b79680` |
| Host/Code fields, editing and geometry | `1402107e0`, `140211270`, `14020cb50`, `14021ca40`, `1402ee800` |
| Modal/role, assigned-code header, phase/reason text | `1402f17e0`, `1402ef2c0`, `14020e930` |
| Command12 normalization and save | Canonical [logout/account owner](evidence/0.115.0/coop-logout/manifest.json), `14588bd10`, table `14702fc50` |
| Service request/profile/auth encoding | `145b7a740`, `145b7a4f0`, `145b7a240` |
| Created/Joined and relay handles | `145891be0`, `145891df0`, `145824440`, `145824900`, `145824b10`, `145824d40`, `145825c80`, `145825dd0`, `145825ff0`, `1458261e0` |
| Pump, timeout/heartbeat and secondary factory | `145816db0`, `14581df40`, `1458bde10` |
| Matching cached profile and state projection | Canonical [server-party proof](evidence/0.115.0/coop-server-party/manifest.json), `1458916c0`; `145893140` |
| Staff-key path | `1458e2590` |

## Static checks and limits

The non-compiling checks read the configured installed EXE in place:

- `check-coop-forms.py`: 1,683 request-helper/code-normalization cases,
  including all 256 capacity bytes, both visibility states, absent requests,
  ordering, password preservation, ASCII/vector boundaries and Unicode removal.
- `check-coop-form-fields.py`: 495 editing, 144 admission and 312
  phase/reason cases; five native Node captures and twelve zone records.
- `check-coop-service-codec.py`: 122 original encoder cases covering all
  implemented service frames, byte lengths, profile fields, relay IDs and auth.
- `check-coop-service-integration.py`: twelve original clock branches, selected lifecycle hashes and 65 source-connectivity guards.
- Existing lobby UI, directory response/refresh/transport/lifetime, party and bootstrap
  checks retain their separate manifests and explicit bounds.

Allocation, String cloning, scalar counting/reserve, localization/formatting,
queue submission and child builders are stated fixture seams. These replays
execute original instruction slices, not the reconstructed Rust, the ECS input
readers, a renderer, a server or a game. Ghidra raw-range results omit external
bodies/data and retain their actual query/profile identities. Canonical historical
or shared-owner extracts are referenced rather than copied under another name.
Authored source regressions and syntax parsing are distinct from executed Rust
tests. Compilation, actual input/save/service/session execution, multiplayer,
rendered presentation, loading-state timing correspondence and original/rebuilt
parity remain unverified. Broader
co-op native/source obligations remain under #63/#17/#41.

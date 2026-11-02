# Named run notifications — 0.100.1

Recovered and implemented on 2026-10-19 against supplied EXE SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The historical `account_event` port name is misleading: **`bossdown` and
`guardian` publish localized banners, not named save counters**.

## Native producer and consumer

Current actor-hit owner `0x1454d4ff0` builds JSON `type` and `name` fields, then
appends to Game's JSON queue at `+0x568/+0x570/+0x578`. The current
[guardian](evidence/0.100.1/notifications/guardian-producer.asm) and
[boss](evidence/0.100.1/notifications/boss-producer.asm) fragments retain those
instructions. The name is already localized by the producer.

Frontend owner `0x140062b50` dispatches `bossdown` at `0x14006412c` and `guardian`
at `0x140064396`. It localizes the template, reads JSON string field `name`
(missing/non-string means an empty string), substitutes `{name}`, and appends
a 32-byte row: owned string at `+0`, kind byte at `+0x18`, current Bevy time's
elapsed-seconds `f32` at `+0x1c`. Both named events use kind `0`.

| Event | Selected-PE template |
| --- | --- |
| `bossdown` | `{name} is defeated!` |
| `guardian` | `{name} is slain! Its hoard and a level.` |

The [manifest](evidence/0.100.1/notifications/manifest.json) binds these exact
strings, eight bounded owners, current REA/Ghidra evidence and the type proof
below. The nearby account-consumer queue that calls `0x14542f570` is unrelated:
that helper merges discovered ability quality, clamped to `4`, into `seen`.
It does not count named bosses or guardians. No new Save mutation was added.

## Native presentation and lifetime

Banner updater `0x1400925b0` builds a typed `BannerRoot, Node, GlobalZIndex,
Pickable` bundle. Its [actual Node argument](evidence/0.100.1/notifications/root-node.json)
has absolute top `27%`, width `100%`, column direction, centered children and
`5px` row gap. Global Z is `4100`; both Pickable flags are false. The tuple
does not contain FocusPolicy.

Row constructor `0x1401034a0` uses the supplied font handle at native Art `+0`,
the same handle used by the recovered ready heading. Kind `0` uses `24px`
gold `(0.973, 0.824, 0.416)`, black shadow alpha `0.85`, offset `(0, 1.5)`.
Kind `1`, from other notification producers, uses red `34px`; that producer
family is not connected by this named-event module.

Rows expire when `now - born >= 3s`, including unordered comparisons. For
`p = (now - born) / 3`, alpha is `clamp(p / 0.1, 0, 1)` while `p < 0.1`,
`clamp((1 - p) * 4, 0, 1)` while `p > 0.75`, and `1` between those bounds.
The update key is row count plus the saturating float-to-u64 conversion of
the last row's birth time times `1000`; the addition wraps. Rebuilding
preserves row birth times, so older rows retain their fade phase.

## Exact loading-cover deferral

The one-byte flag used by the banner updater is **loading-screen coverage**.
It is not inferred from game pause or the FrameXML menu:

1. Producer `0x140061430` calls `0x14064e8c0` and mirrors its `AL` result into
   the resource whose TypeId is retained at `0x145948788`. It changes the
   resource tick only when the byte changes.
2. Query `0x14064e8c0` resolves TypeId `0x1459f3fe0` and returns payload byte
   `+0x58`; absent resource returns false.
3. The selected PE's Plugin vtable at `0x145b13688` binds build slot `8` to
   `0x140930a20` and name slot `12` to `0x14118e320`. The latter returns the
   exact literal `benilla_app::loading_screen::LoadingScreenPlugin` at
   `0x145b6d551`, length `48`.
4. That build registers and initializes the same TypeId (`0x145a2ed48` and
   `0x145acdbd0` are byte-identical copies), size `96`. This binds the queried
   byte to the actual engine loading-screen resource. Its initialization is
   false. The existing engine source's `LoadingScreen::covering()` reads its
   owning active flag.

While that flag is true, the native updater resets every queued row's birth
time to the current UI clock before expiry filtering. The implementation reads
the actual host `LocalClientInput.loading_screen_covering`; the earlier
explicit deferral-port gap is closed.

## Source integration and validation

`gameplay/notifications.rs` provides `NotificationsPlugin` and the queue method
`Notifications::named(kind, name, now, localization)`. The sole presentation
event collector forwards named events once, avoiding an additional competing
RunEvent drain. The guardian producer now uses that same event path instead
of retaining an unconsumed account-event reward row. Root owns collector/plugin
registration and the host field; this worker owns the isolated module.

`scripts/recover-notifications.py --fixtures` completed successfully.
It verifies the full selected EXE hash and executed **12 native fade and 12
native expiry cases** in bounded original instruction fragments, with explicit
clock/component-memory seams and no imported calls. The
[retained vectors](evidence/0.100.1/notifications/native-clock-fixtures.json)
include exact boundaries, adjacent f32 values and NaN. The source's fade test
compares exact result bits with all native fade vectors; its second test covers
equal/unordered expiry and loading-cover retention.

Both Rust tests passed in the combined r13b check (44 library and142
application tests passed). No original/rebuilt GUI session or
banner interaction comparison was performed. Native recovery, connected source,
compilation and visual/runtime parity remain separate claims.

Achievement grants have separate account ownership, recovered in the
[current account report](account-progression-0.100.1.md). The UI JSON dispatcher
`1400636d6` nevertheless converts type`achievement` into this same kind0 banner:
`Achievement earned: {name} (+{n})`, localized before substitution. Only name
and integer points affect this row; key/text/icon remain metadata. Gameplay
also sends the recovered colored system line and sound888. Startup grants
remain undated and do not create gameplay notifications.

Current cache messages likewise use kind0. An unaffordable click separately
sends the native client notification, while the walk hint is a custom banner
only. [Cache feedback evidence](treasure-pipeline-0.100.1.md#native-cache-feedback-and-coinage)
owns that distinction. These sources now share the sole event collector and
actual loading-cover deferral; they do not introduce a competing queue drain.

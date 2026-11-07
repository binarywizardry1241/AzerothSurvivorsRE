# Terminal talent-XP context

Permanent **#98**, lead **TALENTXP01**, belongs to installed 0.115.0,
SHA-256 `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [native proof](evidence/talent-context/manifest.json) binds thirteen
original code ranges, eighteen completed journaled Ghidra queries, the exact
strings/data descriptors and supporting current co-op interfaces.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current completion status.

## Meaning and ownership

The selector `Q41-I01:save_configuration_key_lead:0` identifies the frontend's
`talentxp` event discriminator. Its consumer is the terminal XP panel. It is
neither a save-format field nor a request to edit allocated talents. The live
source owners are `gameplay/mod.rs::persist_run_at`, the ordered `RunEvent`
collector, `talent_context.rs`, `TerminalState` and `gameplay/terminal_view.rs`.
Between-run talent editing and the in-run talent-tree view have separate owners.

Native producer `145889ce0` reads the current run snapshot through `14588f240`.
Ordinary mode uses the existing Game/State producer; guest mode uses the accepted
cached host projection. Guest admission requires its active synchronization
state. Source retains the existing validated replica and removes its Game on
transport loss or native End; a stale disconnected snapshot cannot supply this
producer. This interface reuses the existing co-op source rather than creating
a second simulation or general engine implementation.

The producer computes the seven cumulative XP parts, subtracts its previous
checkpoint with signed wrapping arithmetic and updates that checkpoint before
award admission. Phase 1–5, an available snapshot, a GUID other than `ffffff`
and nonzero net u32 gain admit the award. `14582b910` saturates saved class XP
at u32MAX and derives points with costs `80+15*points`, capped at 51. It updates
the first matching class row or creates a missing row, preserving allocations.
Directly calling this helper with zero can create an empty row; the actual
producer and source award gate exclude that call.

## Complete event and feedback

After saving XP, the producer constructs this object:

| Field | Native contract |
| --- | --- |
| `type` | String `talentxp` |
| `xp` | Full awarded u32 delta, independently of saved-total saturation |
| `before`, `total` | Saved u32 class XP before and after the grant |
| `points`, `gained` | Earned points after the grant; wrapping u32 difference from old points |
| `into`, `next` | Remaining progress and next cost; both zero at the 51-point cap |
| `class` | Recipient-localized `class.{key}.name`; native class lookup defaults to Warrior |
| `parts` | Ordered positive component rows `{name,xp}`; localized name and signed i64 converted through f64 |

Part names in order are Time survived, Kills, Bosses slain, Victory, Zone bonus,
Run Options and Veteran's Lessons. Integer numeric fields use the native
formatter's integral branch. Large part values preserve its i64-to-f64 numeric
conversion; exact serialized JSON byte formatting is not a validation result.

Before the event, `1459ae7c0` sends ordinary engine chat opcode `0x96`, type
`0x0a`, language/sender/tag zero, with UTF-8 length plus NUL. Its localized
template distinguishes zero, one and several new points, wrapped in
`|cff71d5ff…|r`. Source shares the existing system-message packet constructor.
The existing cooperative flush sends queued engine packets before JSON values.

Ordinary mode queues the JSON String for its own frontend. The guest path calls
its synchronized frontend callback. Source sends any cooperative event through
the existing owner route: `talentxp` is excluded from shared peer forwarding.
The guest calculates its award from its validated local replica; receiving this
event never grants XP or rewrites an account save.

## Context and terminal consumer

The retained resource/change-tick adapters `14014b9e0` and `1401d3d90` call
`14013d690`. Its length switch and exact comparison select `talentxp`. Branch
`14013e826..14013e8cc` drops the old JSON Value, copies the entire queued Value
into active `context["talent"]`, and increments the wrapping u32 revision.
An absent context drops the request. The full-PE replay supplies the actual
switch table omitted by the earlier raw import; this closes the selected
dispatch branch without claiming complete semantics for other event branches.

Terminal content `1402dd230` checks that `talent` is an object before calling
`140160020`. This parser clamps/truncates numeric `xp`, `total` and `before`
independently to u32. Numeric explicit `before` wins; missing or nonnumeric
`before` falls back to `total.saturating_sub(xp)`. Class/name text defaults to
empty. Iterator `140075900` and collector `1400e0890` discard zero/negative
clamped XP parts while preserving order and duplicate rows.

Source creates the active context with the terminal summary, drains pending
requests after capture/account delivery and updates the existing summary's
render identity for every accepted request. This includes state and event
arriving in one guest inbound batch. Begin/dismiss/return clear the old context.
Explicit logout/restart also drains the new notice before taking the Game,
using the same producer and the existing final-message flush.
The panel consumes the parsed snapshot instead of reconstructing XP from the
current save, preventing a later account update from changing its `before`.
Existing native animation arithmetic and UI remain in `terminal_view.rs`.

## Reproduction and limits

Run `python3 -B scripts/recover-talent-context.py` to verify retained
target/range/data/query commitments. `--prepare-rea` recreates the exact ignored
inputs and prints the journaled `./scripts/rea query` commands. Original results,
databases, attempts and raw extracts stay under `runtime/`.

`scripts/check-talent-context.py` passes 3,375 numeric parser cases,
seven class cases, 155 budget boundaries, 420 saved-XP grants, 256 phase gates,
two snapshot gates, 24 gain/GUID gates, five numeric emission cases, 42 part
emission cases, six part arrays, nineteen iterator calls and six collectors.
It also checks eighteen source connections. The separate dispatch check passes
54 type/context/revision cases and six terminal object guards.

These are unchanged original instructions in scratch memory, with explicit
JSON/storage/allocator/localizer/serializer seams. Source connections and
scheduling are inspected statically; Rust regression tests are authored but
not compiled or run. Compilation, game/network/save execution, rendered timing
and original/rebuilt gameplay or visual parity remain unverified. #98's feasible
source/recovery work is implemented; its deferred validation remains open.

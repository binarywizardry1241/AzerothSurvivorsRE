# Shared enemy control — 0.127.0

This owns the source/static completion of **#286** for 0.127.0, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/enemy-control/manifest.json) binds current original
status dispatch, exact instructions/data, the completed Ghidra admission leaf
and shared actor-update query. Older behavior reports retain their original
0.97.2 provenance; they do not specify this replacement control policy.

Each native `0x1f8` actor owns one application byte at `+1f5` and one immunity
deadline at `+1dc`. Root/stun tags 2/3 in `145c68a30` and Fear tag 4 share them.
Polymorph producer `145c82dc0..8322c` calls admission `145c6cec0..6d02b`, which
uses the same fields. All players and control kinds therefore consume the same
counter on that enemy, including applications that fail to extend an already
longer deadline. Slows and damage weakening bypass the counter.

| Admission | Exact current behavior |
| --- | --- |
| Immunity deadline greater than run time | Reject; preserve counter and active effects |
| Previous count 0, 1, 2, 3, 4 | Increment the byte and scale duration by 1.0, 0.8, 0.6, 0.4, 0.2 |
| Previous count at least 5 | Reject this application, reset count to zero and set immunity to `now + 8` |
| That sixth application's cancellation | Clamp root/stun, Fear and Polymorph deadlines to `min(existing, now)` and set next movement to now |
| Exactly at immunity expiry | Admit using the reset count |
| Ordinary control expiry | Clear exhausted stun/root deadline; preserve count and immunity |

The immunity interval starts on the **sixth attempted application**, rather
than at the end of the fifth effect. There is no elapsed-time reset between
the earlier applications. This ordering is visible in all three admission
paths and is retained in the source.

Actor `+1f4` carries the elite flag: ordinary creation copies definition
`+4c`; boss construction stores literal one before copying the whole actor.
The existing guardian constructor source retains its recovered elite flag.
For root/stun, metadata-bearing actors retain their earlier quarter-duration
multiplier. The current elite flag then caps base duration at one second,
nonpositive/unordered duration becomes zero, and the common multiplier applies.
Fear preserves its ordinary/metadata admission gate and extends only a longer
escape deadline. Its accepted duration uses the same elite cap and counter.
Polymorph uses ten seconds for ordinary actors or one for elites, followed by
the common multiplier; its existing target eligibility is preserved.

The Polymorph producer starts its passive/cooldown **before** shared admission.
An immune or sixth attempt consumes that proc and returns before publishing a
sheep model or aura. Successful admission stores both the scaled duration
(`actor+1cc`) and its deadline (`+1c8`). The addon debuff snapshot now publishes
that actual stored duration instead of an unconditional ten seconds.

`behavior::state::ControlWindow` now carries this actor-owned counter,
immunity and elite state. Common root/stun and Fear writes, the actual
Polymorph hit producer, ordinary/elite/boss/guardian initialization, actor aura
expiry and addon snapshots use it. Party context swaps retain these fields
with the shared world actor; no caster-local DR collection was introduced.
The six-attempt cancellation leaves the established model/aura restoration
consumers to process their now-expired deadlines in their existing frame order.

The existing noncompiling checker accepts `--enemy-control` and replays
**144 original-instruction cases**: all three entry paths, ordinary/elite,
counts 0–6 and 255, and immunity before/at/after the current time. It verifies
shared counter writes, exact f32 duration results, sixth-attempt cancellation,
reset and immunity ordering, plus connected source guards. The result is
[static-check.json](evidence/0.127.0/enemy-control/static-check.json). Root/Fear
fixtures enter immediately after the GUID/state lookup; the dispatch table
and producer/consumer order are independently bound in the manifest.

Authored Rust tests cover mixed kinds across individual expiries, sixth-attempt
cancellation and the exact immunity boundary, elite caps and unchanged slows.
Changed Rust files parse with the retained rustfmt. Neither those Rust tests
nor the application were compiled or executed. Game, client/network/server
execution, actual presentation and original/rebuilt parity remain unverified.

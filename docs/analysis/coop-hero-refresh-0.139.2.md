# Cooperative Hero refresh and dispatch in 0.139.2

Finding [#63](../CURRENT-STATE.md#gap-63). The installed
`installed-game/AzerothSurvivors.exe` 0.139.2 has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [manifest](evidence/0.139.2/coop-hero-refresh.json) binds original
instructions, complete selected table vectors, the timing constant and
the saved Ghidra collector query.

## Profile update lifetime

The joined host's Hero branch at `0x145e77ca5` applies a first Hero
immediately. With an installed profile at peer row `+0x3a8`, it compares
the frame clock minus row `+0x860` to f64 **0.1**. A smaller interval
replaces the owned pending Hero at row `+0x5f8`. The immediate path
calls `0x145e7c160`; its timestamp store at `0x145e7c1cb` precedes
sanitization. The immediate apply path leaves any existing pending
record available for its later interval.

The host frame dispatches peer messages at `0x145e53233`, then calls
collector `0x145fc4bf0` at `0x145e53334`. The collector uses the same
interval and only takes pending records for nonclosing rows. It writes
the absent sentinel before handing off each record. The frame applies
the collected connection-index and Hero pairs in order through the same
apply function at `0x145e533ec`.

`gameplay/coop.rs` now keeps one pending profile and the last application
clock per connection. Its ordered receive loop applies first and due
updates immediately, replaces pending updates inside the interval, and
drains eligible pending profiles in connection order before roster
publication. Membership retirement and the existing profile reset
paths clear the added state. The existing profile sanitizer and
admission path are used for immediate and deferred application.
The existing-profile branch also rejects an assigned peer or an ongoing run.
The native check at `0x145e7c309` uses the same row discriminant as the
world-actor lookup in `0x145e766f0`. The Game-dependent flag at
`0x145e7c29e..0x145e7c2b7` is also consumed by Join at
`0x145e7869b..0x145e786c0`, where it selects `the run is under way`.
Source uses the admitted actor association and the existing Join predicate.

## Dispatch and remaining typed boundaries

| Site and table | Bounded role |
| --- | --- |
| `0x145e54be7` / `0x1476c803c` | Eight local request indices, commands 22–29. The [Ready Check proof](coop-ready-check-0.139.2.md) owns the two added request paths. |
| `0x145e77ca3` / `0x1476c81ec` | Joined host messages 3–26. Distinct branches receive Hero, Sync, Engine, Control, Disconnect, LobbyChat, Pong and ReadyAnswer. Join and Compressed enter before this table. |
| `0x145e77fd3` / `0x1476c8194` | Compressed cleanup. R12 keeps the original message's first qword. The compressed variant 19 selects the return at `0x145e7884f` after compressed ownership has been released. |
| `0x145e787c1` / `0x1476c82a4` | Ordinary cleanup. Selected exits release the nested Hero, Engine byte buffer and chat strings. The joined path's consumed text flag controls release of the second string. |
| `0x145e7934a` / `0x1476c82fc` | Guest variants 1–25. The separate exit at `0x145e7ae3f` tests the saved variant against bitmap `0x32afc54`, handles owned strings for 8/9 and otherwise reaches the shared drop at `0x145e7ad33` when release is needed. Per-variant producer and ownership correspondence outside the recovered branches remains open. |

The first-profile route selects zone and rank eligibility at
`0x145e7c34c..0x145e7c3e5`. Its exact admission and denial timing, the full
phase flag domain, and the inspection consumer under #299 remain separate
source and recovery work.

`python3 -B scripts/check-q41-dispatch-contracts.py --hero-refresh`
passes **64** original-instruction gate cases, five dispatch vectors,
15 hash-bound ranges and eight live source guards. The pending collector
query uses a hash-bound raw slice, so its external calls remain bounded
by original instructions. Both changed Rust modules syntax-parse and
two authored regressions remain uncompiled and unrun. Client and
network execution, roster presentation and original/rebuilt parity
remain open.

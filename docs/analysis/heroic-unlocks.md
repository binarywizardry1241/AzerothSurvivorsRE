# Heroic clear persistence and admission

Current final-boss clear timing and its source repair are owned by
[the 0.123.0 report](coop-clear.md). This report retains its original
save/admission evidence and does not establish the newer cooperative timing.

Installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-220) owns finding #220. The
[manifest](evidence/0.121.0/heroic-unlocks/manifest.json) binds the current save
parser/writer, class/account admission helpers, clear mutator and account-result
consumer to completed journaled Ghidra queries and exact original code/data.
The separate [Heroic helpers](heroic-native.md) retain their own
bounded rank/selection proof; difficulty UI, current cooperative messages and their admission
consumers have separate owners and validation limits.

## Persistent clear records

Current parser `145aa6a10..145aad16c` accepts exactly three pipe-separated
fields: `hbeat|class|zone:rank,...`. Class and rank parse as unsigned bytes.
Classes use mask `0xBBE` (1,2,3,4,5,7,8,9,11); the zone must resolve through the
current zone-key parser. Invalid or zero ranks are omitted; valid nonzero ranks
cap at five. Repeated class/zone tuples merge by their maximum, including across
repeated rows. The current writer `145aaf840..145ab2e92` groups by class and emits
the exact colon/comma/pipe format. An `open|` record alone is not a Normal clear.

`save/heroic.rs` now owns these records. Save normalization retains them, and
unrelated gear/account changes no longer discard their progression. Direct
`record_heroic_victory` mirrors `145aa3f70`: rank zero is a no-op, ranks above V
cap at V, and an existing class/zone value never decreases. Its Boolean result
reports a changed clear; callers retain native victory/save admission.

## Account ceiling and selected-class gate

| Native owner / source API | Exact scope |
| --- | --- |
| `145aa4080` / `Save::heroic_zone_max(zone)` | Zero until any class has a Normal clear of that zone. Thereafter I, or the highest Heroic clear there across all classes plus one, capped at V. |
| `145aa3b80` / `Save::max_heroic_rank(class, zone)` | The same account ceiling, additionally requiring the selected class's own Normal clear. |
| `Save::heroic_cleared_rank(class, zone)` | The stored cleared rank, rather than its successor. Star caps consume actual clears. |

These are separate predicates. A class can share the account's unlocked
difficulty only after its own Normal clear. Neither zone opening nor a different
zone's Heroic progress satisfies that gate.

Current common login construction calls the class ceiling at `145b23235`, then copies
`min(requestedRank, ceiling)` into the new run. The transient Tester GUID instead
forces Normal at `145b231ce..145b23219`, including while hosting. After Game
construction/publication, host metadata/admission independently computes its
minimum at `145b25984..145b2599e` from the retained Pick request, not the effective
run rank. Neither operation rewrites Pick. The
[start and notice proof](heroic-notice.md)
binds the retained owner, exact branch bytes and current owning source guards.

## Live result delivery

Account consumer `145b2e580..145b2f49c` obtains the same owned result projection
used by the current summary, records the ordinary beaten pair on victory, then
calls `145b0f490` and `145aa3f70` at `145b2e8c0/145b2e8dd`. The former limits the
captured rank by the selected class's current ceiling; it does not promote every
win directly to the account maximum. The latter records the bounded clear.

`Save::record_run_victory` and its notice-returning variant supply that ordering
to local and accepted-guest account adapters. They consume the coordinated
captured run rank and authoritative State15 rank. Rank-zero wins retain Normal
progress without an `hbeat` clear. Existing roster/tester admission, count
checkpoints and save timing continue to own the transaction.

The [clear presentation proof](heroic-notice.md) recovers and connects
the green system-chat notice for a newly raised clear, including guest sync
admission, class/zone/rarity localization and post-clear account ceiling. The
adjacent `heroic`, `set` and `stars` strings are template arguments, not joined
event fields. The separate `type="heroic"` JSON carries `bg`, `level` and `open`;
the current frontend ignores it and produces no custom popup for that event.

## Static evidence and limits

`scripts/check-heroic-unlocks.py` verifies current original bytes and
Capstone boundaries, completed query subjects/results and the connected save
module/normalizer. It replays **232 synthetic original-instruction cases /
7,068 instruction steps** for class/account ceilings and monotone clear
mutation. Typed Save vectors and return memory are fixtures; allocation, sorting,
file operations, reconstructed Rust and the game do not execute. The terminal
wrapper is traced statically through its original instructions and saved query;
the 232 cases do not execute that whole application wrapper.

Rust regressions are authored for malformed/duplicate persistence,
cross-class admission, caps, terminal clear ordering and the notice ceiling;
they are unrun.
Compilation, game/client/network/server execution, actual file/interaction and
original/rebuilt parity remain unverified. The full parser's raw-slice
pseudocode has external-call/data and unreachable-block limitations; exact
original bytes govern the bounded contracts.

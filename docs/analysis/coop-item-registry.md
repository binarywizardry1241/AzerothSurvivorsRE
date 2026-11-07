# Shared item/set text registry

Finding **#101 remains open**: the host-to-guest ordinary item-effect text
carrier and its cross-process identity/lifetime policy are still unrecovered.
This investigation repairs a shared-registry omission under **#254**, connected
to set metadata consumer **#234**, and the pre-sync ordinary-query path **#255**.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall implementation status.

The selected installed EXE is **0.121.0**, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [manifest](evidence/0.121.0/coop-item-registry/manifest.json) binds six
journaled full-PE Ghidra results, exact native ranges, both encoded-reference
populations, the separately retained set callback proof and changed source.
Historical [0.120.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-item-registry-0.120.2.md) and
[0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-item-registry-0.119.0.md) observations retain their original targets.

## Current producer and source correction

The current interner `145b78be0..145b78de2` compares exact length-delimited
bytes, appends copied strings and returns `0xf00000 + index`. Lookup
`145b78e80..145b78fbc` clones admitted entries. The lock/poison bytes are
`1485c6758/759`; vector capacity/pointer/length are `1485c6760/768/770`.
These are preferred static PE addresses, not observed runtime pointers.

The complete selected declared/complement inventories contain **32/0 encoded
references**. In addition to ordinary item serialization at `145b829e7`, two
calls now belong to the existing set callback `145ac1180`: `145ac13a2` interns
the four-piece description and `145ac152e` interns the optional eight-piece
description. Their output rows are `(4, synthetic_id)` and `(8, synthetic_id)`.
The [set-core manifest](evidence/0.121.0/sets-core/manifest.json) already retains
this callback's current Ghidra result; it was reused without another import or
duplicate extract. These local set texts do not carry another process's item
effects.

The source previously returned direct set bonus strings without updating
`LocalItemDescriptions`, so later item IDs skipped native set-query insertions.
`LocalItemDescriptions::intern` now owns the exact append-only identity shared
by `Item::template` and accepted set metadata demands. Azeroth Survivors opts
its local set records into that callback side effect; other embeddings retain
the default-off behavior. The VM keeps first-request order while coalescing
pending duplicates. `feed_item_sets` interns requested bonuses in that order,
before unordered presentation bookkeeping. Unknown and unasked sets allocate
nothing; aliases use the existing lookup; duplicate text retains its prior ID.
The registry still survives runs and ReloadUI. The source does not eagerly
intern the whole set catalog or reset/remap host IDs.

## Guest routing frontier

Current full-PE owner `145b21eb0` forwards commands only when the party
discriminant at `Game+d48` is below two and the synchronization byte at
`Game+10c5` is nonzero. Opcodes `4b/1ce/1dc` stay local. Otherwise the owner
calls ordinary request handler `145b0f580`. The recipient wrapper `145ae8260`
scopes the locale around that same handler. Ordinary serializer `145b81a20`
continues to intern effect strings locally. The current ordinary handler permits
the item constructor without a live simulation, with a zero-rank fallback.

The source previously forwarded every guest query immediately and returned
before local item construction. `guest_request_route` now updates the existing
wire gate after bootstrap from `runtime.is_guest() && state.sync_sent`, before
PostUpdate request collection. Actual queued local guest item queries use the
ordinary zero-star constructor and the same persistent registry; an inactive
client drains those requests without constructing text. Guest object publication
remains outside this local-query branch, and synchronized host replies retain
their existing wire path. Two authored regressions cover the local/wire
transition, unchanged ItemQuery bytes, local QueryTime and ordinary/unknown/
inactive query handling. They remain uncompiled/unrun.

This restores an existing local producer, without adding a packet/text carrier.
Recovering local entries does not establish agreement with later host IDs.
Broader dynamic-item fallback/dependency applicability remains unverified; the
ordinary-query correction does not certify that separate lookup contract.
The ordinary opcode58 decoder/query/receive/cache recovery from 0.119.0 is
retained and was not repeated or promoted wholesale to the current target.

## Static validation and limits

`python3 -B scripts/check-coop-item-registry.py --native` checks all
six current query receipts, exact native bytes, both reference populations,
the retained set callback and source connections. The bounded original
interner/lookup replay covers **13 insertion fixtures, four absent-ID cases
and two isolated-registry cases / 2,394 original instruction steps**. It
includes duplicate/empty text, embedded NUL, Unicode normalization distinctions,
interleaved producer history and guest/host disagreement. Allocation, byte
comparison/copy, vector growth and String cloning are explicit seams;
contention, poisoning, allocation failures and arbitrary computed aliases are
outside this proof. Separate-registry fixtures prove history dependence, not
an original-game tooltip defect. The original forwarding predicate additionally
passes **280 boundary cases / 1,610 original instruction steps**, covering both
guest discriminants, nonguest values, zero/nonzero synchronization and the
three local opcode exceptions. No serializer, lifecycle sender, socket or
ordinary handler executes in those predicate fixtures. The source's existing
user-facing logout and network Ping paths are outside this ItemQuery repair.

Eight changed Rust files parse without compilation. Five authored Rust
regressions cover identity, requested-set order/alias/opt-out, UI ask
deduplication/retry and cached item ID reuse; they remain uncompiled/unrun.
The four pre-sync repair files also parse; their two additional regressions
remain uncompiled/unrun.
No application compilation, client/game/network/server operation or controlled
original/rebuilt comparison occurred. Actual mixed-language delivery, rendering
and parity remain unverified. A complete #101 repair still requires the native
guest association of host synthetic IDs with their item-effect strings.

## Retained reports

[0.120.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-item-registry-0.120.2.md) · [0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-item-registry-0.119.0.md) · [0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-item-registry-0.118.0.md)

# Gaze suppression and retained raid data

Target SHA-256:
`445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`.
This is the historical 0.112.5 finding. The [0.113.2 repair](raid-gaze.md)
revalidates the installed queue/data contract and connects gaze suppression in
source; its remaining runtime/parity limits stay open under **#42/#43**.

The supplied 0.112.2 release notes say Bloodlord Mandokir and the Gurubashi
Champion no longer produce their gaze circles. The installed 0.112.5 EXE
implements this through its initial actor-request filter. Reconstruction source
admitted gaze requests at this review, a concrete difference under **#42**.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall implementation status.

## Current graph and suppression

The checker independently locates the zone table through its exact `elwynn`
descriptor and all twelve ordered keys at the native 240-byte stride. It locates
the guardian signature table through all thirty-seven ordered identities at the
native 56-byte stride. Neither discovery uses a previous executable's addresses.
It then reuses the reviewed structural parser/comparator to follow every root,
recursive child, variant and phase and to compare source schedules/catalogs.

All **493 action nodes, sixty boss headers and thirty-seven signatures** retain
their historical scalar payloads, recursive connections, repeats and phase
metadata. Thirty-seven action nodes have relocated pointer words. The two gaze
payloads remain byte-identical: Mandokir 992 recurring slot 2 (action 179), and
Champion 911 health phase 0 at 50% (action 428), including the phase's
`%s stares you down!` text. The [compact evidence](evidence/0.112.5/raid-release-review.json)
binds current table ranges and both retained roots to exact bytes.

The current initial-request loop at `1459a9007..1459a90ad` copies each request,
stops at native tag `0xff`, and skips native tags **12 and 26** before calling
the dispatcher at `14597eab0`. Native 12 is the previously recovered tower
suppression; native 26 adds gaze suppression. The loop transforms the tag by
subtracting three, uses 29 for tags below three, then skips transformed values
9 and 23. The fixture exercises every byte tag, empty and mixed queues, and
terminators: **262 isolated original-instruction cases pass**.

At this review, `bosses/abilities.rs::queued_action_enabled` skipped only semantic
tag 13, its native-12 adapter. Gaze roots pass through generic semantic tag 17,
which also adapts unrelated native actions. A repair must resolve the native
registry tag before suppressing gaze; globally filtering semantic 17 would
disable other mechanics. Preserve retained records, timer/phase collection and
the separate direct recursive/delayed dispatch rules. The current source still
contains the gaze producer and leaving-circle consumer in `bosses/raid_extra.rs`.
This historical update recorded the discrepancy; the linked 0.113.2 repair now
owns the source correction.

## Reproduction and limits

Run with an existing Python environment containing `unicorn`:

```sh
python3 -B scripts/check-release-raid.py
```

If that package is already installed beneath this checkout, select its package
directory with `--python-libs <project-relative-directory>`. The checker installs
nothing. `--write` regenerates only its compact evidence JSON after inspection.

The whole installed EXE identity and the exact 166-byte queue range hash are
asserted before native execution. Queue/frame memory is synthetic; the dispatcher
is intercepted before actor resolution or effect production. Graph duration
annotations retain their historical provenance; current duration instructions
were not exercised. Other producers/consumers, delayed paths, whole-frame/terrain,
renderer and client/platform dependencies require separate current-target proof.
No Rust compilation/execution, original/rebuilt application launch, controlled
runtime comparison or gameplay/visual parity is established. Broader raid and
marker presentation validation remain open under **#42/#43**. No duplicate
assembly extract is retained.

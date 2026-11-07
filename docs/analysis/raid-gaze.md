# Raid initial-request gaze suppression

Target SHA-256:
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[verification-needed](../verification-needed.md) owns overall gap status. This repairs the
remaining gaze-admission source difference under **#42**, first recorded in the
[0.112.5 review](raid-release.md). Compilation, encounter comparison and
presentation parity remain unverified.

## Current contract and live correction

The current enemy owner at `145945cf0..14594b72d` contains the initial-request
loop at `14594a80b..14594a8ad`. Its stack slots, registers, address and exact
bytes differ from the historical loop. A bounded REA/Ghidra 12.1.4 import of the
current range independently recovers the request copy, `0xff` terminator and
transformed-tag filter. Subtracting three, using 29 for underflow, and rejecting
9/23 suppresses native **12/26** before dispatcher `14591d320`.
The [manifest](evidence/0.113.2/raid-gaze/manifest.json),
[canonical assembly](evidence/0.113.2/raid-gaze/queue.asm) and
[REA provenance](evidence/0.113.2/raid-gaze/rea-provenance.json) bind those bytes.
Decompiler bad-data halts mark omitted outgoing continuations in the raw import;
the exact-byte instruction fixture owns actual loop exit behavior.

`bosses/abilities.rs::queued_action_enabled` now rejects native gaze through its
registry-backed semantic-17 adapter while retaining the existing semantic-13
tower filter. Filtering every semantic-17 action would disable 140 unrelated
adapters. Both `bosses/ai.rs::dispatch_queued` and the live
`gameplay/mechanics/bosses.rs` queue call the shared predicate after the
terminator and before actor lookup. Suppressed actions create no hazard or cast
request. Collection still owns recurring timer reset, phase latches and queued
requests. Direct delayed/recursive dispatch retains its separately recovered
rules and consumers.

The upstream guardian phase lane at `14594810a..14594824e` latches the phase bit
and appends its complete actor/action request, then applies the same native
12/26 filter before constructing the phase announcement. The suppressed branch
goes directly to recurring admission at `145948761`, bypassing the
name/phase-label formatting and announcement-vector append. The source had still
emitted Champion's `stares you down` emote. `guardians/signatures.rs::advance`
now uses the shared native-tag predicate for that announcement after retaining
its phase bit, blocking state and action request. The live guardian adapter
already consumes that filtered announcement vector. This does not filter the
phase out of the catalog or erase its scheduling effects.

Fresh literal/descriptor and full ordered-key/identity discovery locates the
current zone table at `146fdcd48` and guardian signatures at `146fe5b88`, without
historical RVAs. All **493 action nodes, sixty boss headers and thirty-seven
guardian signatures** retain their scalar payloads, child graph, repeat values,
root order, phases and source connections. Thirty-seven pointer-bearing records
are followed at their current relocated addresses. Mandokir 992 recurring slot 2
(action 179) and Champion 911 half-health phase 0 (action 428) remain native 26.
Their records are preserved, including Champion's `%s stares you down!` text.
No other current action uses native 26, so no additional suppression path is
needed for this source difference.

## Checks and limits

```sh
python3 -B scripts/check-raid-gaze.py
```

Select an already installed project-local Unicorn directory with
`--python-libs <directory>` when needed. The checker installs nothing. It checks
the whole installed identity and exact queue range before **262 isolated
original-instruction cases**: every byte tag, empty/mixed queues, terminators,
actor indices and complete 48-byte payload copies. It also verifies that the
input queue remains unchanged. Another **262 original-instruction cases** check
the upstream guardian phase lane across every byte tag and additional phase-bit
indices, preserving the phase latch and exact request while skipping only the
disabled announcements. Source/data tracing checks all 493 adapters, both queue
filter placements, guardian announcement publication and the unmodified
recursive/delayed entry boundary.
These source checks do not execute Rust.

This establishes the current queue/data contract and its connected source
repair. Retained duration annotations, producers, consumers, actor scheduling,
shared-engine callbacks and other raid proofs keep their actual historical
target provenance; the bounded queue fixture does not revalidate them wholesale.
No compilation, game process, real terrain/client/platform execution,
presentation or original/rebuilt encounter comparison was run. Broader #42/#43
runtime/parity requirements and #41 unresolved AS native/type/alias ownership
remain open.

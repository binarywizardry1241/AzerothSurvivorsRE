# Missing co-op cards and dismissed-offer lifetime — 0.127.0

Target: installed **0.127.0**, 146,721,280 bytes, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This report owns the current missing-card request and dismissed-card constituents
of **#271/#280**. The [0.123.0 report](coop-picks-0.123.0.md) retains offer IDs,
select/skip framing, host admission and earlier retry recovery with its original
target. Current proof does not reset those repairs or add permanent same-ID
suppression.

[Current evidence](evidence/0.127.0/coop-picks/manifest.json) binds fifteen
journaled Ghidra queries and independently checked current instruction/table
bytes. Raw imports omit external data and infer uncertain ABI/types; original
Windows register operands, exact table entries and bounded instruction replays
establish the contracts below.

| Current owner | Recovered contract |
| --- | --- |
| `145b48fd0..145b49085` | A received HUD must contain the exact substring `"phase":"choosing"`, and the retained choices payload must be absent. The first such HUD starts a timer. After at least three seconds, request cards; subsequent requests are at least three seconds apart. Any non-choosing HUD or retained payload resets both missing/request clocks. The native unordered-clock comparison is retained. |
| `145b49090..145b49146` | Pending select/skip checks the same HUD substring. A non-choosing HUD discards retained choices and clears pending state. A choosing HUD retries retained content only after strictly more than four seconds. No incoming HUD means no retry or request. |
| `145bd81f2` case in `145bd7b40..145bd95ef` | Publish the HUD, process pending visibility, then check missing cards. A due request sends the native Control variant with subtype10 through `145b80980`, which serializes into the ordinary outgoing queue. |
| `145b49150..145b49695`, `145b496f0..145b497fb` | Authoritative choices retain payload/offer and reset pending. Resume clears payload/pending. Successful select/skip dismisses locally while retaining the payload. The current receiver still accepts a repeated authoritative offer; no permanent offer blacklist is inferred. |
| Encoder `145d159bf`, subtype table `14771f128`, case `145d160a0` | Control10 writes exactly `[8,10,0]`, without an offer suffix. The existing select/skip offer extensions remain independent. |
| Decoder `145d11751`, subtype table `14771f098` | Read the kind and argument; reject kinds above10. Subtype10 shares the no-argument path, ignores the supplied argument and reads no offer. |
| Host `145be4290..145be45a3`, table `1473dd9d0` | Subtype10 maps directly to `145be44b1`, the same authoritative republisher used for stale select/skip. It does not select, skip, reroll or advance the offer. |
| Republisher `145c98720` | An active offer and choosing phase2 produce authoritative choices; otherwise produce resume. The response uses the existing recipient publication queue. |

`coop/pick.rs::Client::receive_hud` now connects the phase gate, pending-payload
cleanup and missing-card clocks. `gameplay/coop.rs` calls it only on an actual
received HUD and queues Control10 when due. A dismissed offer cannot be restored
by an old four-second timer after a non-choosing HUD has cleared it. A legitimately
active choosing offer still retains its recovered retry behavior.

`coop/replication.rs` admits subtype10 and preserves its three-byte framing and
zero unused argument. Host admission resolves the actual client and hero before
`party_control`; subtype10 preserves that hero's choices/progress. The existing
`choice_generations` response generation is advanced to force publication even
when the cached card payload would otherwise suppress a duplicate send. The
ordinary publisher supplies current choices or resume without incrementing the
genuine offer ID. Host/guest overlays still consume the existing pick revision,
visibility and response path; no new packet envelope or UI owner is introduced.

Run the maintained non-compiling checker:

```sh
PYTHONPATH=runtime/armory-recovery/python-libs:runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-coop-picks.py --current
```

It passes **835 isolated original-instruction cases**: 784 missing-timer/reset/
request cases, 28 pending-phase/retry cases, one exact encoder-byte fixture,
three decoder boundary cases, one host subtype dispatch and eighteen response
admission cases. The encoder fixture records calls at the existing generic
byte-writer boundary; original branch instructions supply all asserted bytes.
Current receipts, native range/constant hashes and live source connections are
checked independently. Syntax-only Rust parsing and whitespace checks pass.

Authored Rust regressions cover missing-card request/repeat/reset clocks,
non-choosing HUD suppression, retained retry, exact substring admission,
Control10 framing and preservation of distinct local/remote offer state. They
remain uncompiled and unrun. Actual delayed/lost packet delivery, scheduling,
client input/rendering and original/rebuilt parity remain unverified. No client,
game, socket, directory, relay or server was started.

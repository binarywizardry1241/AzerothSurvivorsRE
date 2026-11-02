# Offer-bound co-op picks — 0.123.0

Target: installed **0.123.0**, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
This source/static repair owns **#271/#272/#274**, with the independently
identified repeated-card and stale-pick defects **#280/#281**. The
[verification-needed](../verification-needed.md) retain execution and parity status.

The [current proof](evidence/0.123.0/coop-picks/manifest.json) and reused
[choice receiver](evidence/0.123.0/pick-smooth/manifest.json) bind the following
producer/consumer chain. Raw-slice decompilers omit external jump tables and
infer ABI/types; separately checked table bytes and original instructions bind
the selected branches. No original source layout is inferred from C types alone.

| Current owner | Recovered contract and connected source |
| --- | --- |
| `145b7e1f0`, increment at `145b7f10d` | Every generated offer increments the hero's wrapping u32 at Game+cc4 before publishing. `ChoiceState.offer` advances once in genuine level and shared cache/guardian generation, including rerolls/banishes and identical-content successive offers. The existing hero-state swap retains each hero's own counter. |
| `145b80af0`, field write at `145b8183b` | Choice JSON serializes Game+cc4 as `offer`. Host publication includes that identity in payload/cache signature, independently of response/resend generations. The emitted object starts with the native exact `{"type":"` prefix; ordinary serde map ordering could not guarantee it. |
| `145c2cc60`, encoder `145ccac10`, parser `145cc6f10` | Select0 and skip3 carry the viewed u32 offer; only those control subtypes extend tag8's kind/argument bytes with the LE u32. Other subtypes retain their existing wire lengths. Native unused argument bytes are zero; options7–9 retain bit0. Guest controls attach the received offer only after the actual viewed payload has been selected. |
| `145bbc650` branches `145bbc78c` / `145bbc7ae` | Select/skip accept offer0 as a wildcard or an exact Game+cc4 match. A nonzero mismatch republishes authoritative current choices/resume without applying the stale action. Source host admission checks the actual assigned hero before invoking choice/skip, and queues the corresponding fresh response even when the publication cache is already absent. |
| `145b87fa0` | Republish sends choices only while an actual offer/source is active, otherwise `{"type":"resume"}`. Host publication now acknowledges the transition out of choices and stale controls without advancing the genuine offer ID; failed sends retain the publication work. |
| `145bd7010` | Exact type-prefix reception retains choices and parses the u32 offer with zero fallback. Any authoritative choices message resets pending state; resume clears the retained payload/pending state. It does not permanently discard all messages sharing an offer ID. `coop::pick::Client` connects these states to the existing guest overlay. |
| `145bd74a0`, `145bd6fc0`, caller `145c2fa51` | A successfully queued select/skip dismisses local choices while retaining the authoritative payload. A later HUD packet restores that payload only when pending age is **strictly greater than four seconds**. No incoming messages means no retry. Source preserves the existing exit animation, allows a newer authoritative offer to survive an old close, and prevents a failed queue insertion from hiding an offer indefinitely. |

This fixes the live path through generation, private publication, guest receipt,
viewed-card controls, transport codec, host identity gate, response and retry.
Merely storing an offer field or incrementing a local UI revision would not
provide that protection. Zero remains the native compatibility/wrap wildcard;
it is not treated as an invalid identity. Reroll and banish retain their native
unbound control shape and generate a new offer through the same source owner.

`scripts/check-coop-picks.py` verifies **13 durable current Ghidra queries**, target/query/input commitments,
selected original instruction/data bytes and live source connections. Its
**126 isolated original-instruction cases** cover select/skip zero/exact/stale
admission across signed/unsigned boundaries, wrapping increments, and strict
four-second retry boundaries including NaN. These cases use synthetic memory
and stop before native callees; they are distinct from application execution.
Rust regressions are authored for actual generation/wrap/reroll, pending
messages/retry/resume, exact JSON prefix and selective codec framing/truncation.
Rust syntax parsing is permitted and separate from compilation.

Compilation and authored Rust tests are **unrun**. No client, game, socket,
directory, relay or server was started. Actual packet timing, party lifecycle,
input, rendering and original/rebuilt parity remain **unverified**. Wider module
coverage and unrelated protocol contracts retain their existing owners.

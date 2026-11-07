# Heroic terminal rewards and feat inputs

Selected EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [manifest](evidence/heroic-rewards/manifest.json) binds four completed
durable Ghidra queries and current code/data. [verification-needed](../verification-needed.md)
owns **#226**. Boss drop chance and class-mark/pity transactions have separate
owners; this report covers terminal talent XP and the captured feat inputs.

## Captured rank and terminal XP

The current summary `145b28410..145b297bd` obtains one owned snapshot through
`145b2dd70..145b2e21a`. That getter copies the accepted guest cache or tail-calls
the local producer `145afaed0..145afb73e`. The local producer copies Game+`36f`
rank to snapshot+`c4`, Game+`7fc` raw kills to +`a0`, clock to +`98` and boss
kills to +`a8`. The accepted State15 rank has its separate wire owner under
[#238](../verification-needed.md#gap-238). It must remain the authority for guest
accounting; a picker setting or reward multiplier cannot reconstruct that rank.

Current XP retains seven signed parts, in order: time, kills, bosses, victory,
zone residual, Heroic and Veteran. Kills are raw, with no Run Options density
normalization. Existing f32 arithmetic, rounding, signed residual, checkpoint
subtraction, wrapping sum and final narrowing remain in their existing owners.
The new `talent_experience_parts_heroic` feeds density one and the captured
rank's reward into that shared arithmetic.

The summary clamps its raw rank byte to V, independently of menu admission.
Rank zero adds no Heroic part. Ranks I–V use the fourth scalar of the native
48-byte Heroic descriptor: **1.3, 1.4, 1.5, 1.6, 1.7**. The extra part is
`roundf((reward - 1) * base)`; Veteran uses the base plus that rounded part.
The shared raw scalar helper `145ac0330..145ac0366` instead defaults to one
outside ranks 1–5. Source therefore clamps at this particular summary consumer
before calling `heroic::reward_multiplier`, preserving the distinct drop/helper
domain. The descriptor's canonical owner remains the
[Heroic source evidence](evidence/heroic-source.json).

The current summary localizes the six-byte **Heroic** key at `147663350` for
part index five (`145b28bd2..145b28c08`). The live talent-XP event now uses that
key. It retains the existing event/UI request rather than adding a replacement
summary screen.

`Mechanics::heroic_rank()` is the shared source of captured rank: local runs use
their run configuration, and replicas use the accepted `RunProjection` rank.
Both the live and pre-world cached guest summaries use the same current XP
helper. Historical Run Options helper APIs retain their explicit old behavior
for their historical callers and fixtures.

## Feat input boundary

The complete current party-context producer `145bc28c0..145bc2a09` admits a
context only when the cooperative mode byte is exactly one and a retained
remote row exists. At `145bc29b6`, it compares Game+`36f` with three; the
`SETAE` at `145bc29ea` writes that result to context+`34`. Source now captures
that same rank predicate, independently of class, talent or lethal-event
membership conditions. The new member byte at +6 is copied without interpretation
here and retains its separate producer/consumer recovery owner.

Current source snapshot construction supplies raw kills and rank-at-least-III
to the retained `full_reward` boolean. `from_heroic_run` makes this explicit;
the old `from_run` entry remains a historical Run Options adapter. Current
per-item native predicates are separately established by the
[#237 proof](evidence/run-achievements.json) and
`scripts/check-run-achievements.py`. Descriptor/evaluator ownership
remains separate from this shared input:

- `feat:odds`, current kind five: won and captured rank at least III.
- `coop:odds`, current kind eight: the rank-at-least-III context flag, at least
  two party members under the Any predicate, and won.
- `coop:oldgods`, current kind nine: the same context flag, a retained boss1194
  event and at least two Any members. This predicate has no victory gate.

That independently owned proof binds current evaluators
`145ba6470..145ba7292`/`145b90f00..145b91272` and constructor `145b973b0`.
Its 772 original-instruction cases include 180 legacy rank-gate cases. The
achievement source integration and new catalog retain #237 ownership; this
report no longer treats those per-item native conditions as unresolved.

## Static checks and remaining limits

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-heroic-rewards.py
```

The [result](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.121.0/heroic-rewards/static-check.json) records **4,032**
original-instruction XP contexts and **2,304** complete party-context cases,
covering all 256 rank bytes at the party boundary, rank overflow at summary,
all twelve zones, f32/integer boundaries, wins, Veteran bonuses and cooperative
presence, plus twelve explicit u32-conversion boundaries. The native
`4,294,967,040` float is a comparison threshold: the next float, `2^32`, selects
`u32::MAX` rather than clamping to that smaller threshold. NaN/negative values
select zero, matching the source cast. It verifies **550,232 original instruction steps**, four retained
query subjects, live source connections and six Rust syntax parses. Zone-key
lookup, CRT `roundf` and an empty party-event clone are explicit synthetic seams.
The check executes neither reconstructed Rust nor an application/service.

Shared Heroic reward and authoritative State15 rank integrations must be
present with these consumers. Compilation, actual account/save/network/UI
execution and original/rebuilt parity remain unverified. The independently
proved per-item feat source integration above remains a distinct #237 delivery
dependency, rather than missing native semantics.

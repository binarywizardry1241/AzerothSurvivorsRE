# Stateless local request lifetimes

Target SHA-256 `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
**Q41-M03-local-request-lifetimes-1458646d0**, under #41, identifies an admission
defect in the previously connected #64/#65/#67 request paths. New permanent
finding **#70** owns this common lifecycle correction. [verification-needed](../verification-needed.md)
owns current status; no application symptom or parity result is asserted.

## Native and source boundary

Current incoming handler `0x1458646d0` answers Creature (0x60), GameObject
(0x5e), five inventory refusal commands (0x10a/10b/10c/10d/111) and manual cast
(0x12e) when the optional Game at wrapper+0x10 is absent (discriminant2).
Those responses do not require terrain readiness, a retained character or a
running mechanics instance. Existing [name](name-queries.md) and
[clock](clock-queries.md) proofs separately establish their independent
responses and the name query's retained-character requirement.

The cast branch forwards the zero-filled first four request bytes as spell ID
to constructor `0x1458ca2f0`, reason0x17, then sends once through `0x145885a50`.
Only **after sending** does it test optional Game. An absent Game returns;
a present Game reaches the existing postresponse context wrapper. That wrapper
is an observed boundary here, not an extra gameplay/target-change action to add.

The source used `RunSession.mechanics.is_some()` as the common request admission
gate. It silently dropped these independent responses without Game, despite
the local channel still being active. `gameplay::resolved_requests` now uses
`LocalClientSession.active`, matching the existing channel collector and teardown
owner. `GameObjectUse` separately requires mechanics and retains its existing
terrain/run/readiness checks. No source mechanics mutation was added to queries,
refusals or manual cast rejection.

All existing metadata wire decoders and inventory/error/unlock consumers are
reused. Inactive channels drain requests even if a stale mechanics instance
remains. This is a source lifecycle correction; an actual stuck inventory lock,
missing tooltip or cast-error symptom was not reproduced in the application.

## Checks and limits

The [proof](evidence/0.113.2/request-lifetimes.json) retains the original handler
bytes, its existing current Ghidra observations, result digest and sixty fixtures.
`python3 -B scripts/check-request-lifetimes.py` passes **396,072 native
cases**: all65,536 u16 values for each metadata/cast opcode in both Game states,
all256 inventory slot bytes for each command in both states, seventeen payload
lengths per selected opcode and four extra u32 boundaries. Metadata/refusal wire
outputs agree across Game states. Their complete value/locale/serializer proofs
remain separately owned by [Creature](creature-queries.md),
[template wire](template-query-wire.md) and
[inventory refusals](inventory-refusals.md).

Metadata and refusal serializers execute original instructions with synthetic
memory/locale/allocation/copy/sender seams. Cast checks observe constructor
arguments, sender and postresponse boundary calls; its actual serializer and
player-context wrapper do not execute. The test does not certify cast wire,
actor selection, every u32 state or arbitrary aliases.

One new live bridge regression covers ordered mixed replies without Game,
once-only draining, GameObjectUse rejection and a stale-Game/inactive-channel
counterexample. Three existing bridge fixtures now represent actual channel
activation/teardown instead of using Game presence as its proxy. These Rust tests
are authored **uncompiled/unrun**; the changed module syntax-parses only.
Existing name/clock native proofs were rechecked with updated source commitments.
No reconstructed source/ECS/client/VM/FrameXML, OS API, game, network or controlled
original/rebuilt comparison executes. Generic engine and co-op logic remain
outside scope; original census/selector counts are unchanged.

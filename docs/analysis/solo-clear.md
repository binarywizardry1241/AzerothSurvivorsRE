# Solo final-boss clear projection

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
This source/static repair owns **#283**, found while tracing the live caller for
[#264](coop-clear.md). The [manifest](evidence/0.123.0/solo-clear/manifest.json)
reuses that finding's six current native subjects and canonical ranges, plus
the retained full-driver query owned by the [smoothing proof](evidence/0.123.0/coop-smoothing/manifest.json).
Only two additional compact driver ranges are extracted; no native query was
repeated or launched.

The current final-boss death path writes inner Game phase `+ba8 = 1` before
terminal presentation. The live snapshot copies its low byte to `+c1` for local
solo and cooperative runs. Its party flag selects a separate terminal-state
lane; it does not gate that final-boss latch.

Driver `145c1077f..145c107ae` excludes guest mode2, then admits nonterminal
Playing1 and Choosing2 to the existing shared-phase/local-restriction gate.
The clear call at `145c107e0` precedes the party branch at `145c107f0`. Thus a
pending choice or absence of a cooperative party does not postpone local clear
publication. Accepted guest caches retain their independent existing route.

The source previously read the completion phase only when `has_party()` was
true. Solo final death followed by a pending level/cache choice could therefore
leave `victory_reached()` false: `finish_boss_completion` waits for an active
run without an open choice, and only that later owner sets the completed/effect
latches. The reconstructed source now reads the existing completion phase for
all local runs. It preserves the accepted guest's authoritative won flag and
the completed/endless latches.

Existing `native_state` and `persist_run_at` consumers consequently receive the
solo victory before terminal settlement. The clear-only Save transaction stays
separate from summary XP, run counts, result acknowledgement and choice closure.
No new state, message, save format or terminal event is introduced.

```sh
python3 -B scripts/check-solo-clear.py --python-path runtime/tests/query-python-deps --python-path runtime/armory-recovery/python-libs
```

The check passes **48 isolated original-instruction cases / 384 steps** over
mode0/1/2, party0/1, Playing1/Choosing2, final phase0/1 and local restriction0/1.
It re-verifies **seven retained query subjects**, **546 canonical parent
instructions** and **20 additional driver instructions**, current source routing
and **five Rust syntax paths**. Synthetic memory stops before native account
calls. The parent's previous getter receipt is preserved with source revision
`9a31f0cf1d396bd3b07d5899b6f4ab5d0399f6a7`; its current scoped hash is refreshed.

Two authored Rust regressions cover a solo pending-choice final phase reaching
State15 and Heroic Save before summary delivery, repeated-save idempotence,
unchanged XP/count/result checkpoints, and a pending-choice phase0 negative case.
They are uncompiled and unrun. No remaining selected source omission is
identified. Compilation, actual client/game/network/server/filesystem save,
gameplay presentation and original/rebuilt parity remain unverified.

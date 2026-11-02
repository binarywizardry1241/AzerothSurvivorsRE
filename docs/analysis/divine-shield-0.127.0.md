# Divine Shield lifetime and admission — 0.127.0

Finding **#288** is bound to installed EXE SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [native evidence](evidence/0.127.0/divine-shield/manifest.json) records the
current instruction/data ranges, saved Ghidra queries and static checks.
Source/static implementation and remaining validation belong to
[verification-needed](../verification-needed.md#gap-288);
compilation, actual timing/input and original/rebuilt comparison belong to
[verification-needed](../verification-needed.md#gap-288).

## Recovered contract

The current self-buff case `145c6151c` identifies the **`divine_shield` key**.
It caps the ordinary f32 duration product
`((definition.duration * 1.4) * duration_multiplier) * talent_duration_multiplier`
at **6 seconds**, before the self-buff owner's minimum 0.1-second hold. The
restriction does not apply to every raw-status12/internal-status11 immunity.

The shield rejects ordered health above 35% of maximum health. The native
`UCOMISS/JA` branch admits unordered health, including NaN, subject to the same
retrigger gate. The admitted cast
then tests **Game+0x540 + 10 > Game+0xcc0** and rejects a retrigger while that
comparison holds. Exact equality admits. On success it writes the current run
clock to +0x540, removes the prior shield aura, then publishes the visual and new
aura. Rejection does not replace the aura or consume the timestamp. The ordinary
scheduler's failed-cast retry remains 0.2 seconds.

The constructor `145c24420` loads the packed constant at `1473ddbb0`
(`00000000 000080ff`) into `[rbp+0x54c]`. Its Game starts at `[rbp+0x10]`, so the
upper float initializes **Game+0x540 to negative infinity**. The final 0xd88-byte
copy preserves that value. Expiring or removing the aura does not reset it.

The current scheduler `145c0f250` uses the unshielded cooldown floor
`10 - min(scaled_duration, 6)`, then adds the self-buff immunity hold to the
successful cycle. For ordinary positive durations this guarantees at least ten
seconds between successful casts and at least four seconds without this shield.
The exact zero/NaN boundary arithmetic is retained rather than replacing it with
an unconditional ten-second clamp.

Normal auto-casts, echoes and generic/timed freecasts enter the same dispatcher
and share this per-hero timestamp. Divine Intervention's retained talent record
contains an independent tag19 lethal rescue followed by generic freecasts of
Divine Shield and Consecration; its shield therefore reaches this same admission
gate. The separate rescue aura and other immunities keep their own contracts.

## Connected source and presentation

`ExecutionState::divine_shield_last_cast_at` stores the shared run timestamp.
The kind-nine dispatcher checks it before aura mutation and writes it only after
the self-buff health gate succeeds. Existing freecast/echo consumers use that
same execution state.

`damage::scaled_duration` and `damage::base_interval` centralize the current
duration cap and cooldown floor. Cast scheduling, upgrade eligibility, aura
duration publication and the cooperative spell resource consume these helpers.
The current base-description duration slot and immunity-cycle explanation use
the capped duration and matching cooldown arithmetic. Historical description
catalogs/fixtures retain their original provenance and values.

The same current scheduler and upgrade/tooltip consumers prove Hellfire's
independent **0.5-second** floor. The live shared helper previously used 0.25;
that directly connected discrepancy is corrected with this arithmetic repair.

## Validation boundary

The existing `recover-player-ability-behavior.py --check-contract` route verifies
the target/ranges and replays **432 scalar/tooltip cases and 150 admission cases**,
covering the actual constructor value, exact retrigger boundary, health gate,
large/zero/NaN duration inputs, NaN health and cooldown modifiers. The recorded check uses
**15,060 unchanged original instructions** in scratch memory and no external
callee seams. It does not execute reconstructed Rust or a game process.

Authored Rust regressions exercise the live echo/retry/lifetime path and Divine
Intervention's freecast admission. They have not been compiled or executed.
Compilation, scheduler timing in the application, rendered tooltips and
original/rebuilt gameplay parity remain unverified.

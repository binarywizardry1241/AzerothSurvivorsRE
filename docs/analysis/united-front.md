# United Front

Finding **#118**, part of **#113**. Target SHA-256:
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
[Current native contracts](evidence/0.117.0/united-front.json) bind the earned
producer, Hero/bootstrap chain, admission and live numeric consumer.

The current Save configuration producer `145b3b570..145b3be19` searches the
earned-key set for exactly `coop:team`. A match selects f32 bits **3dcccccd**
(0.1) at `146174a34`; otherwise it returns zero in configuration `+2c`.
This is an automatic achievement reward, independent of purchased perk ranks.
Its unlock row uses `Spell_Holy_PrayerOfHealing`; the achievement's separate
icon ends in `02`. Current descriptors and exact ordered unlock rows belong
to [#114's achievement report](coop.md#choices-progression-and-rewards).

The source now carries that automatic grant through local `account_run_grants`
and remote `coop_profile::build`. The current Hero builder `145aa9390` puts the
value at `Hero+17c`. Protocol 5 serializes its four bytes after companion ranks;
[#163](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-handshake-0.117.0.md) owns that structural codec change. Admission
`145ae1990` preserves these bits without a guessed clamp. The incoming Hero
projector `145aa9160` copies it into per-hero initial configuration `+fc`.
The Game initializer retains that configuration at Game `+1b0`, hence the
current cached value at Game **+2ac**.

Current stat refresh `145b94210` reads the cached value and adds it to luck
after ordinary stat contributions **only when Game+c85 is nonzero**. Its
consumer writes luck at `+4cc`. The existing source counterpart is
`Mechanics::has_party`; [current party-mode production](party-achievement-producer.md)
owns that flag's source/native connection. `EffectsState` carries the grant
inside the per-hero state already swapped by the shared simulation.
`refresh_effects` adds it once after `apply_stats`, before final publication to
player stats, choices, HUD and addon consumers. Party admission refreshes the
host and inserted hero after enabling the shared mode; a guest entering replica
mode performs the same first refresh. Later refreshes rebuild
the sum rather than accumulating another permanent 0.1.

All six `CombatAdapter` construction paths capture the same mode-gated grant.
Their separate `refresh_numeric` path applies it after ordinary/temporary stats
as well, so modifier changes and temporary-effect expiry retain the contribution.
The pre-stat snapshot remains before this final addition, preserving its native
operation order instead of moving the reward into an earlier accumulated sum.

Solo mode skips the addition. Abandonment does not invent a reset of the
shared mode or a transfer of one member's earned reward to another member.
The earned key persists through the existing dated/idempotent grant route;
party-wide achievement distribution remains separately owned by **#157**.

`scripts/check-united-front.py --native` checks target/range/query
commitments and live source connections, then replays **1,024** original
mode/f32-addition cases plus ten admission bit patterns. The admission replay
also documents the separate **#164** equipment-chance edge.
Native bootstrap/serializer/source tracing is separate from this isolated
arithmetic replay. Compilation, actual ECS/client/socket/server execution,
rendered stats, persistence and original/rebuilt parity remain unverified.

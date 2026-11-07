# Doomguard pending effects

The installed target is SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [canonical native excerpt](evidence/0.112.0/demon-spell-impacts/manifest.json)
binds `145900a09..1459013e6` to the current pending-hit owner. Gap #24 source now
routes each due impact through `pending_demon_spell_hit`, preserving the
ordinary damage/status call exactly once before these explicit follow-ups.

The launch owner captures independent Nightfall/Conflagrate flags. Normal
Doomguard bolts and their one neighboring bolt retain both. Prepared gear
cleaves retain only Conflagrate. Echo clears both; it does not regenerate a
cleave or apply either follow-up. The
[volley owner](demon-spell-math.md) owns those launch-time contracts.

Conflagrate first captures whether the target is alive and has any Immolate348
periodic row, regardless of remaining ticks. The main hit then resolves. A
matching learned Conflagrate talent and first matching raw4 record admit the
follow-up even when the main hit killed its victim. The native owner looks up
the retained actor again after synchronous callbacks and samples its current
position. It queries radius6, excludes the original victim, and resolves
ordered neighbors with `(raw_hit_power * 0.15) * 0.25`, source kind2, spell0,
no critical draw, the Conflagrate meter label and damage-log suppression. The
source uses the current raw4 payload rather than a separate numeric copy.

Nightfall requires its captured flag, the learned talent and first matching
raw9 Shadow Bolt record, and a surviving victim after the main hit. It installs
Corruption172 for twelve ticks over twelve seconds, with total power
`raw_hit_power * 0.4 + retained_power`. Retention matches the current effect
ordinal, spell and **nonzero** owner tag; the native predicate does not require
the old tag to equal one. The newly installed periodic row uses owner kind1,
school5 and cap1, then publishes the aura through the shared actor path.

A dead target does not admit these follow-ups. A live target can admit them
when the primary damage is zero, negative or NaN: the pending owner skips that
ordinary damage call but continues the separate follow-up branches. This is
why the gates travel with the queued hit rather than a generic after-damage
callback.

`python3 -B scripts/check-demon-spell-impacts.py` passes **123 native
instruction cases**. They cover normal bolts, cleaves and echoes; missing
learned talents; Immolate presence; lethal and pre-dead targets; nonpositive
power; retained same/different effect ordinals and zero/nonzero owner tags.
The checker captures the native periodic installer, hit arguments, query and
aura calls through explicit seams. It substitutes their bodies and does not
execute the full damage pipeline, Rust source or a game process. Source parsing
passed; compilation, authored integration tests and original/rebuilt parity
remain unrun.

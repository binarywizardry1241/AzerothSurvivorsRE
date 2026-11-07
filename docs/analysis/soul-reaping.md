# Current Warlock demon post-hit effects and Soul Reaping

The installed 0.112.0 executable is authoritative: SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`,
140,514,816 bytes. This report covers the current common demon melee tail,
its Felhunter/Succubus dependencies, and both live Soul Reaping consumers.
It revalidates the reused Voidwalker arithmetic against this target; historical
0.105.0 addresses do not establish the current contracts.

## Native ownership and retained evidence

[The manifest](evidence/demon-post-hit/manifest.json) binds selected
instruction spans, constants, complete owner extents and Ghidra observations to
this hash. Each selected span has one retained assembly extract in that directory.
The common melee owner is `145956d00`; the current generic effect dispatcher is
`145934c50`; effect scaling is `14599d900`; main effects tick is `14592f2b0`.
Raw Ghidra imports recover bounded function bodies with inferred types/ABI;
their guessed parameter names are not source declarations. The generic switch
was additionally followed through its current jump table and decoded branches.
Focused raw imports do not establish full-image reference or caller coverage.

Current talent definitions and their original Effect64 bytes remain canonical
in [warlock-talents/definitions.json](evidence/warlock-talents/definitions.json).
The compositor translates current raw35 into marker253/35, preserving its
float at+4. That marker prevents reuse of a historical numeric interpretation.

## Felhunter Consume Magic

After each non-echo Felhunter melee hit, the surviving victim competes for a
shared three-second cooldown. This is the native Game+128/+130/+138 vector,
keyed by victim GUID across all Felhunters. Expired entries at or before now
are removed. No cooldown is recorded unless an eligible DoT exists.

The selector `1459efc30` accepts Corruption172, Immolate348, Drain Life689 and
Curse of Agony980 with positive tick count and positive per-tick power. Highest
learned rank wins; an absent learned spell has rank1. Equal ranks prefer Agony,
Corruption, Immolate, then Drain Life. Periodic owners do not affect selection.

The caller records now+3, then changes every positive-count row of the selected
spell, including later duplicate rows with nonpositive power:

```
consumed += (old_power_per_tick * 0.1) * float(ticks_remaining)
power_per_tick *= 0.9
interval *= 0.9
next_tick_at = now + max(old_next_tick_at - now, 0) * 0.9
```

Tick counts and periodic ownership remain unchanged. A positive total produces
an immediate noncritical hit for consumed*1.5. The hit uses source-kind2, the
actual Felhunter descriptor, the selected DoT's spell ID, the Felhunter's school
and attack label `Consume Magic`. Captured meter/source state is restored after
the canonical hit. A nonpositive total still leaves the recorded cooldown and
periodic mutations in place.

This replaces the historical rank-three low-health Agony critical mark. That
old producer, live periodic hook, state field and dedicated helper are removed.

## Succubus Seduction and killing-blow Death Coil

The non-echo special4 tail branches on whether its melee victim survives.
A living ordinary actor with any retained Corruption172 row qualifies for
Seduction. The native check does not inspect remaining ticks, power or owner,
and excludes metadata-bearing bosses. A shared victim GUID cooldown at
Game+110/+118/+120 prevents another Seduction until five seconds elapse.
It casts6358 from the actual Succubus to that victim and applies control3:
one second for ordinary actors, half a second for flagged elites. The subsequent
native duration decoder also contains a two-second metadata arm, but the
preceding admission excludes those actors. Ward actors use the existing
ordinary-actor representation. The separate current actor target-scoring contract uses this shared
Seduction deadline rather than the actor's actual stun deadline; that actor
integration remains separately accounted under #24.

A killing blow instead constructs a Death Coil proxy and queries living actors
within its definition range25 around the player. The current iterator
`1459efe20` uses interpolated XY, inclusive squared radius, explicit exclusions
and native actor order. Query results are distance sorted. `1459eabc0` selects
one row with multiply-high/rejection; one candidate still consumes RNG. Lists
through u32::MAX use the high32-bit branch; larger lists use the full64-bit
branch. The shared targeting helper now supplies both this choice and shuffle.

The proxy owner `145939fb0` copies all 84 meaningful bytes of the matching learned
instance (88-byte stride), including rank, upgrade counts and all derived lanes.
Its four padding bytes have no semantic copy. Without a match, it starts
fresh, applies current spell modifiers and sets learned power to the ordered
mean across learned spells, floored at1. These details matter for health power
and talent modifiers; a four-field copy loses current state.

The projectile uses ordinary player ability power and one player critical draw,
without the separate demon damage/critical owner. It adds Soul Reaping after
critical multiplication, then halves the combined power. Its due time is now
plus XY distance from the actual Succubus to the selected actor divided by24.
It emits6789, captures source-kind2, the actual pet descriptor and literal attack
key `death_coil`, and queues Shadow5 damage with a zero status effect. It does
not inherit the player Death Coil healing status.

## Soul Reaping

The retained save key is `dark_pact`; its current presentation is Soul Reaping.
Raw35 starts at .05. Current scaling `14599dd24..14599dd51` computes
`max((factor-1)*.5+1,1)*base`, with native f32 operation order. Ranks1/2/3
therefore yield .05/.075/.10; rank is not multiplied directly by .05.

Both consumers sum every equipped raw35 coefficient in original vector order.
They separately sum every victim spell689 row as
`float(ticks_remaining)*power_per_tick`, again in order. This read does not filter
periodic ownership, require positive power, clamp counts or mutate rows.

For a direct player Death Coil, current raw35's generic-event branch requires
event-kind0/source-kind0 and a nonzero spell resolving to the `death_coil` key.
It re-finds a living victim after the primary impact. Positive coefficient times
remaining Drain Life damage becomes a separate noncritical Shadow5 hit, credited
to the original Death Coil spell ID. The native call temporarily clears only
the low64-bit source enum, uses source-kind3, then restores the generic row and
source kind. The source adapter uses its existing synchronous hit port and
restores attribution, cast words and attack context. Source-kind3 prevents
recursive generic triggers. No additional Death Coil healing is requested.

The Succubus consumer reads the same remainder at projectile launch and includes
it in the single delayed half-strength hit. Thus a later change to the target's
DoTs affects the player impact path but does not recalculate an already launched
Succubus projectile. Neither Soul Reaping path consumes Drain Life rows.

## Revalidated reused contracts

The current Voidwalker special3 tail has no echo exclusion. On a killing blow,
`14595711f..14595715a` adds2.5 health directly, capped at maximum health; positive
effective healing is credited to the Voidwalker. The shield branch
`1459573b9..1459574a4` sums equipped raw31 fractions in order and grants
`min(full_post_critical_power*fraction,max(maximum_health*.25-pool,0))` when
positive. It increases both the shared Soul Link pool and total absorb.
`145930334..145930378` later removes only pool excess over the quarter-health
cap from total absorb, floored at zero. The supplied helper receives the live
equipped fraction rather than effective victim damage.

Current common melee calls packet constructor `1458c4bf0`, which writes opcode
0x14a. Spell presentation constructor `1458ce7d0` writes0x132. The complete
`14595a460` spell-hit owner queues pending hits and has no call to the melee
packet constructor. The live adapter therefore emits its melee event only for
spell0, while spell attacks retain their spell presentation and pending path.

## Connected source and checks

- `run_effects/demon_effects.rs` owns Consume Magic selection/mutation and reused
  Voidwalker arithmetic; `player_abilities/behavior/soul_reaping.rs` owns the
  shared ordered coefficient/remainder read.
- `gameplay/mechanics/demon_post_hit.rs` owns actual periodic mutation, shared
  cooldowns, Seduction status/presentation and Succubus projectile construction.
  `demon_spells.rs::demon_after_hit` dispatches these tails from current melee.
- `gameplay/mechanics/callbacks.rs` owns player raw35 dispatch and synchronous
  hit attribution/restoration. Its State retains both shared victim cooldowns.
- The current Warlock effect asset and `EffectRow::talent` provide live raw35
  rows/rank scaling; `targeting::random_index` retains the shared RNG sequence.

Run `python3 -B scripts/check-demon-post-hit.py --verify`.
[The retained cases](evidence/demon-post-hit/native-cases.json) cover 5
rank-scaling cases, 72 learned-rank/tie selections, 36 periodic mutations, 36 Drain
Life vectors executed through both native consumers with input nonmutation
checks, 36 coefficient vectors through both consumers, 54 critical/bonus/half
compositions, 16 learned proxy clones, 15 shared cooldown comparisons (including
unordered values), 24 random choices including rejection/final RNG state, 8 direct
healing cases, 27 shield gains and 27 shrinking-cap cases. Comparisons use f32 bits.
The native UCOMISS/JBE cooldown purge removes unordered deadlines as well as
expired ones, matching the source's strict-greater retain predicate.
The checker separately verifies installed bytes, retained extract hashes,
current talent input and live source routes. Ghidra recovered the current
selector, proxy, random picker and query iterator in fresh bounded imports.

Changed source also parses with the existing project rustfmt. These are static
and selected-instruction checks with synthetic inputs and explicit scratch
state. They do not execute Rust, compile, launch either game, verify presentation,
exercise engine packets or establish original/rebuilt gameplay parity.

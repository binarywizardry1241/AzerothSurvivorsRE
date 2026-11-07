# Soul Link and Legion Gate population

Selected installed EXE SHA-256:
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
Finding #290 is source-complete; [verification-needed](../verification-needed.md#gap-290)
owns its remaining compilation, runtime and parity checks. The
[manifest](evidence/0.127.0/warlock-population/manifest.json) binds exact original
ranges, the shared ten-percent literal and three journaled REA/Ghidra queries.
This report supersedes only the older Soul Link capacity and Gate selection
contracts; other demon behavior keeps its original recovery provenance.

## Recovered current behavior

The common melee owner `0x145c88720..0x145c89d46` sums native effect32's float
at +4. The Voidwalker arm at `0x145c88de0..0x145c88ec7` uses that positive
fraction and the captured critical-adjusted hit power. It grants
`min(hit_power * fraction, max(maximum_health * 0.1 - shared_pool, 0))` only
when the result is positive. The subset is `Game+0x1a8`, maximum health is
`+0x4c8`, and total absorb is `+0x53c`. Every Voidwalker contributes to the same
subset. The scalar at `0x146258c70` is exactly f32 `0.1` (`cdcccc3d`).

The main tick `0x145c6fa80..0x145c7401a` clamps a shrinking maximum at
`0x145c70e16..0x145c70e5a`. It subtracts only the subset's excess from total
absorb, floored at zero. Unrelated shields remain available. The live
`demon_spells.rs` producer still supplies the ordered raw31 talent fraction and
captured full hit power to `grant_soul_link`; `IncomingState` retains the same
subset for shield-consumption credit. Both grant and shrink paths now use 10%.

The selected Soul Link definition at `0x147069b48` supplies its actual key,
name and effects pointer. Its native effect is variant32 with base fraction
0.05; Gate's selected producer is variant33. The source deliberately keeps
its stable internal `253/31` and `253/32` semantic markers, respectively.
The checker binds those producer records and verifies identical value lanes
against the retained source payloads. Those internal markers are not asserted
to equal the current native enum discriminants. Soul Link's current exact
description is also retained and overrides the historical 25% menu prose. The
matching exact translations are connected in all fourteen source locale
catalogs; the manifest binds each selected value to its actual current locale
payload. Historical translation keys remain available to historical consumers.

Gate's current selection/creation interval is
`0x145c7067f..0x145c709ed`. Each iteration checks the total temporary lesser
population first, stopping at twelve. It consumes one multiply-high/reject RNG
choice from the talent-enabled pool. It counts matching temporary lesser
demons and admits the chosen entry below its per-kind capacity: **six
Felhunters (9518), four Voidwalkers (9519), twelve for another kind**. A capped
first choice still consumes its RNG draw. The native helper
`0x145cf2080..0x145cf22d2` filters the original pool to kinds below their caps;
Gate consumes another choice from that filtered pool, or skips the summon if
none remains. The chosen demon is created synchronously before the next
iteration, so creation/landing callbacks can affect the next RNG state and
population. The former source drew the whole group before any creation.

These native population counters explicitly require the temporary-row flag
and lesser kinds1–4. Permanent companions and greater demons do not spend
those counters. The source also counts pending temporary requests, reserving
the same capacity while its creation adapter drains them. Expired actors are
removed before the next Gate selection. The native pool-construction interface
is an explicit replay seam; its prior Imp/Succubus plus independently enabled
Felhunter/Voidwalker source contract is retained from
[0.112.0](demon-actors.md), rather than claimed freshly recovered here.

## Source and bounded checks

- `run_effects/demon_effects.rs` changes the shared grant and shrink capacity.
- `save/talents.rs` publishes the selected exact Soul Link description with
  its 10% capacity, preserving the historical embedded catalog unchanged.
- `gameplay/mechanics/demon_lifecycle.rs::gate_entry` implements first draw,
  per-kind admission, filtered fallback and second draw. It counts active and
  pending temporary requests together.
- `gameplay/mechanics/demons.rs` checks the total cap and completes each
  creation before asking for another entry. Existing expiry, Gate clocks,
  Infernal pulses and other demon effects remain their existing consumers.

Run the existing non-compiling checker with:

```sh
python3 -B scripts/check-demon-post-hit.py --contract population-caps --verify
```

It verifies the installed target, exact original code/literal bytes, curated
assembly and all three query input/plan/journal/result receipts. It executes
**432 original-instruction cases / 190,061 instruction steps**: 180 shared
shield grants, 60 shrinking-cap cases and 192 Gate cases. The Gate fixtures
cover all four optional-talent combinations, three RNG states, populations
below/at/above each cap, total-cap admission, permanent-companion exclusion,
fallback rerolls and creation-side RNG consumption. Pool construction,
allocation/free and creation are declared seams; the actual selection, count,
filter and RNG instructions execute unchanged. The shared replay guard rejects
unreviewed instructions, modified original bytes and writes outside scratch
memory. The checker also traces the connected source and parses all three
changed Rust paths and the catalog consumer with rustfmt without compiling them.

The authored Rust regressions consume those native shield/Gate fixtures, also
covering pending-request capacity and RNG state before/after each creation.
They have not been compiled or executed. No client/game/network/server process,
application build, rendered tooltip or original/rebuilt comparison was run.
Static recovery and source checks do not establish runtime or gameplay parity.

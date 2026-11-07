# Modifier readers in spawning and stats

Target: installed0.109.0 Windows EXE, SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`. This closes the narrow source/static dependency from the [current Run Options page](run-options.md) through the [new-game modifier copy](runmods-consumers.md) into density, health, damage and speed readers. It does not establish complete spawn, combat or gameplay parity.

## Ordinary actors and guardians

The complete ordinary constructor `145970560..145970f13` is already canonical as [hatch-creation.asm](evidence/0.109.0/raid-wards/hatch-creation.asm). The same owner creates normal/elite actors and summoned ordinary kinds. It reads density at Game`+2b0`, loads the health/damage pair at`+2b2`, reads speed at`+2b6`, and separately multiplies zone scale by the independent difficulty at`+aa8`. Current polynomial leaves are `14599e9c0..14599ea05` and `14599ea10..14599ea55`.

Its current population cap remains `clamp(trunc((density/100)*50),50,120)`. Health and damage preserve the existing time polynomial, late-zone health bonus and endless-power order, then apply their respective percentage. Speed remains `(speed/100)*1.05*definition.raw_3c`. The native current factor branch tests whether `flag_4c` is nonzero. Source used the historical low-bit test; it now uses nonzero. All148 current catalog entries use0 or1, so this fixes the contract for the helper without changing those entries' current results.

Current guardian HP `14599c1f0..14599c550` and damage `14599c5f0..14599c77f` read those same independent and percentage fields. They retain separate health-curve and polynomial rules, guardian-kill factors and gated endless powers. Their current zone/data input fragments already belong to [guardian-signature evidence](evidence/0.109.0/guardian-signatures/manifest.json); newly retained prologue/math fragments exclude those intervals. The gameplay guardian adapter replaces its temporary zone scale with the chosen zone's actual scalar before calculating stats. Initial and engage-time rescaling receive the same selected percentages.

Both actual source catalogs'148 rows match the current six stat inputs (scale, base HP, base damage, attack interval, speed and flag):1,776 exact field comparisons across ordinary and guardian copies. All current guardian HP-knot pairs also match the source. These comparisons concern the stat inputs, not every catalog ability or localization field.

## Density and speed consumers

Current tick `14592f370` has distinct modifier readers. The retained budget slice `14593b1bb..14593b2fa` reads density before the time polynomial, living-boss reduction and endless factor. The top-up slice `14593b52a..14593b74b` reads density separately, counts living ordinary actors and limits attempts to `3*ceil(density/100)`. These agree with `enemies::spawning` and the live adapter's density field. Top-up keeps its own target; it does not use the weighted UI difficulty.

The formation reader `14593bd17` computes `(density/100)*.6`; the four retained count branches agree with `waves::formation_count`. Stampede reads the selected speed at `14593cce8` and applies the existing ordinary1.05 and forced-movement1.4 factors. The guardian constructor reads speed at `14593e09b`, converts it at `14593e180` and multiplies the definition speed at `14593e428`; the latter two intervals reuse the canonical guardian constructor extract. Guardian speed does not receive the ordinary actor's1.05 factor.

The live ordinary/guardian/boss adapters already forward the four individual `RunRules` percentages. Current [boss inputs](boss-inputs.md), [gear factor](runmods-consumers.md) and [talent XP](run-account.md) have separate current evidence. The common entry correction keeps independent difficulty1.0 while preserving all four percentages.

## Repeatable checks and limits

- `python3 -B scripts/check-runmods-ordinary.py`:1,184 complete native ordinary creation cases,60 population boundaries, four index/GUID cases and five flag-branch cases. Native RNG, polynomial calls, modifier arithmetic and actor stores execute unchanged. Position is supplied, actor storage is preallocated, and zone resolution, entity publication and CRT powf results are declared seams. Independent scalar-f32 transcription matches all native HP/damage/speed results.
- `python3 -B scripts/check-runmods-guardians.py`:288 native guardian HP/damage pairs, including curve endpoints, kills, modifier bounds, distinct difficulty and endless gates. Actual current boss knots supply the curve fixture; curve-vector construction/free, zone resolution and CRT powf are seams. Independent scalar-f32 transcription matches both outputs.
- `python3 -B scripts/check-runmods-density.py`:540 budget,540 top-up,112 formation-count and36 guardian/stampede-speed cases. These execute selected original tick intervals with synthetic actor headers and caller registers. Top-up ceilf is an explicit host seam.

The [ordinary](evidence/0.109.0/runmods-scaling/ordinary-manifest.json), [guardian](evidence/0.109.0/runmods-scaling/guardian-manifest.json) and [density](evidence/0.109.0/runmods-scaling/density-manifest.json) manifests bind bytes, compact outputs, reused ranges and REA/Ghidra identities. The constructor and existing guardian input/selection fragments are not duplicated. Raw decompiler ABI and jump-table limitations remain explicit; original Win64 instructions and PE data govern the replay.

Only the nonzero factor branch changed source behavior in this batch. Rustfmt parsed its source without compiling. No Rust tests, compiler, build, game, engine/entity internals, Windows CRT bit comparison, terrain/geometry execution or original/rebuilt gameplay comparison ran. The remaining broad enemy scheduling, placement and combat ownership belongs to its own scopes; no such parity is inferred from these narrow modifier checks.

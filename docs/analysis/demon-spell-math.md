# Demon spell clocks and volley state

This report binds the installed target SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`
to bounded arithmetic and volley-capture contracts used by gap #24. The
[manifest](evidence/demon-spell-math/manifest.json) records exact image
ranges and the current Hellfire catalog record. The larger time-effect owner
is retained as [shared time-effect excerpts](evidence/demon-time-effects/manifest.json); the Pit Lord list helper has one
canonical Ghidra C/assembly extract here.

## Recovered contracts

Infernal `145930180..1459301cf` reads the current Hellfire base cooldown (1.5),
multiplies by 1.4, the learned cooldown lane, the captured modifier cooldown
lane and global cooldown, then applies the native lower bounds and adds the
current clock. The admitted Hellfire path has a half-second lower bound. Its
modifier scalar is the actual `145897ab0` output at offset +4; these vectors
do not invent a separate native cooldown-factor input.

Doomguard `1459318c8..14593198a` uses the previous primary victim and previous
cast count. Only an admitted elite or primary boss gains focus. If the victim
matches, the bonus is `min(previous_count, cap) * 0.2`. The matching raw33
Doomguard effect supplies its rank: ranks 1/2/3+ cap the count at 3/4/5;
rank zero or no matching effect uses cap 3. The next count increments with
32-bit wrapping, resets to one for a different admitted victim, or clears to
zero for an ineligible victim. The state update belongs to the primary
volley. A synchronous echo must reuse that volley capture instead of advancing
focus or selecting its victims again.

Pit Lord `1459da6c0..1459da825` cycles the supplied candidate list until it has
the requested number of missiles. Missile ordinal zero alone receives a
1.25 multiplier; later cycles through the first candidate retain multiplier
one. The caller supplies at most six candidates. Its call to `1459eace0`
starts at the second candidate, so only the tail is shuffled and the first
candidate remains fixed. The list helper itself performs no target query or
shuffle; these arithmetic vectors preserve that boundary.

Doomguard gear bounce is prepared once before dispatch. The first matching
raw6 row supplies its count and multiplier. The radius-10 query is centered
on the primary victim and excludes every existing primary/neighbor GUID,
retaining the plain distance order. Up to the requested number of additional
victims receive the captured focus-adjusted primary power times the bounce
multiplier and the `Shadow Cleave` label, without a Doom Bringer meter split.
Each appended victim then has its own critical draw. Echo keeps every target
and captured power, overwrites the primary label with `Demonic Echoes`, and
clears the secondary attribution pointer. It does not retain a Doom Bringer
split. The shared excerpts also retain the exact GUID copier, live-victim
filter and echo mapper.

The current direct consumers have separate learned-state contracts. Doomguard
power reads the learned power lane and always evaluates fresh current spell
modifiers. Its cadence independently reads learned cooldown and fresh modifier
cooldown. Pit Lord target count reads learned targets; its damage reads learned
power and applies no matching spell-modifier lanes. Their misses use the ordered
mean power floored at one. Infernal pulse damage reads only learned power/area and evaluates fresh
current modifiers; its independent clock reads learned cooldown. The shared
complete learned-instance clone belongs to the Succubus spell consumer. These
distinct stages must not leak stored modifier lanes into the direct consumers.

## Evidence and source checks

`python3 -B scripts/check-demon-spell-math.py` passes **1,386 bounded
native cases**: 252 Infernal deadlines compared by float bits, 280 Doomguard
focus cases, 104 Pit Lord lists, 90 Doomguard bounce/echo preparations, 480 Imp Fire-modifier
cases and 180 Infernal visual-radius cases. Focus cases cover a missing effect and
ranks zero through five, target changes, ineligible targets, saturation and
counts through `u32::MAX`. Pit Lord cases cover one through eight supplied
candidates and zero through twelve requested missiles, including repeated
visits to the first candidate. The wider helper inputs do not change the
caller's six-candidate cap. Bounce cases include count zero through
`u32::MAX`, empty/overlapping candidates, zero/nonintegral power multipliers
and echo metadata clearing.

Imp Firebolt admits only current modifier records with school selector3,
Fire school2 and power lane0. It sums their amounts in order, then multiplies
that result plus one after the run-growth/descriptor/global-damage base and
Familiar stat30 factor. Unconditional, keyed, other-school and other-lane
records do not enter this native Imp multiplier. Cases include cancellation
and nonintegral values to preserve the floating-point sequence.

Current visual publisher `14592a220` traverses learned, racial and auxiliary
spell records, then appends one Infernal ring when the follower vector contains
special kind6. This extra record uses spell11683, attached=false, and the
softcapped Hellfire radius divided by10. It reads learned area or one and
fresh area modifiers; it does not copy cached modifier lanes. The live
`Mechanics::visual_spell_scales` now appends this record through the existing
client visual-scale consumer. Infernal cast, damage and status publication also
use the current spell11683 identity.

The checker executes unchanged installed-image instructions in Unicorn.
Infernal inputs capture learned/modifier scalars; Doomguard supplies the
already recovered eligibility decision; Pit Lord replaces only allocation
calls. The fixture is not generated from the Rust formulas.

The Rust `run_effects/demon_spells.rs` regression module now uses these current
interval/focus fixtures instead of the historical 0.105.0 expectations.
Historical power/target-count/fallback fixtures retain their explicit old
provenance. Source regression tests were authored but not compiled or run.
Imp and Infernal radius regressions also consume their current independent
fixtures, including a stale cached area lane that must not leak into the proxy.
The bounded native checks establish these static contracts; no game launch,
build, controlled comparison or gameplay parity validation was performed.

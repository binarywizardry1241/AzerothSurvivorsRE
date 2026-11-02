# Current encounter ward contracts — 0.112.0

The twelve current ward templates, all fourteen reachable native22 records
and the twenty-four zone enemy baseline rows used by ward/hatch initialization
agree with the connected source. The target is installed 0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.

`scripts/check-raid-wards.py` executes **594** original instruction
cases: 252 constructor/template/health/counter cases, five shared creature
counter sequences, 144 real UNIT field cases, twenty-four healing cases,
twenty shield-ownership cases, sixteen deadline cases, thirty-two deferred
hatch/heal/removal/dead-parent cases and one addon normal-kind case. Current
inputs, exact instruction ranges and results live in the
[manifest](evidence/0.112.0/raid-wards/manifest.json).

Constructor `145916190..145916468` still clamps template index to 11, clamps
health to at least 1, shares the ordinary wrapping counter and creates a real
targetable UNIT. The complete field fixture checks template scale/display,
health ceilings, capped level, player ownership, attack fields and reach.
Current healing caps to missing health and preserves NaN/no-op behavior.
Alive matching kind2 wards still protect their parent without a range gate.
Due action collection, inclusive expiry, dead-ward/parent rechecks, hatch ring
coordinates and remove order retain the existing source contracts.

Current player/unit/actor-vector fields move by 8 bytes while later counter
and clock groups move by 24 bytes. Fixtures initialize each actual owning
field; they do not assume one struct delta. The constructor's changed encoding
for a zero-initialized actor field does not alter its value. Current shared
hit/death gates and shared actor-stage ordering have independent contracts.
The ward-only cases do not certify complete hit/death callbacks or a whole frame.

[Ghidra provenance](evidence/0.112.0/raid-wards/rea-provenance.json) records a
completed 12.1.4 raw import for the full current ward constructor. The import
omits external code/data and full-image callers. Exact assembly and synthetic
fixtures, with explicit trig, field-map, heal and hatch seams, own the bounded
conclusions. Earlier [ward behavior](raid-wards-0.109.0.md) retains its actual
target provenance and broader source-path explanation.

Run `python3 -B scripts/check-raid-wards.py`. No compiler, compiling
test or game process ran. Full generic hit/death callback bodies, whole-frame
execution, live terrain, population-cap interactions, rendered presentation
and original/rebuilt parity remain separate requirements under #42/#43.

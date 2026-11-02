# Current demon damage and critical arithmetic

The selected 0.112.0 EXE is SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [manifest](evidence/0.112.0/demon-damage/manifest.json) binds the critical
owner `14595c200`, its external dispatch/data tables and the health-bonus writer
to the installed bytes. [verification-needed](../verification-needed.md) owns gap #24;
this bounded contract does not certify the whole demon scheduler or gameplay.

The common owner applies the follower's captured power multiplier, ordered
equipped demon-damage stat17, active Empowerment aura10 and the common 1.3
factor. Empowerment's value receives shared buff potency once. Each victim,
including an echo, then receives an independent critical draw against player
critical chance plus equipped stat29, capped at one.

Current special-kind branches differ from the historical reconstruction:

| Kind | Current additional multiplier |
| --- | --- |
| Imp | 1.05 |
| Felhunter | Missing-health fraction times the Soul Devourer rank table .005/.01/.02 times 100, plus one; no historical Agony damage/critical bonus. |
| Voidwalker | `(2 * max(health_bonus,0) + 1 + 3 * armor) * 1.1`. |
| Succubus | 1.2 when the victim retains any Corruption172 row. |
| Felguard | 1.5 when missing-health fraction is greater than .7. |
| Doomguard | With Supremacy against a boss/elite, `1 + .02 * Soul Devourer rank`. |

The native rank table and multiplication order control gameplay. UI description
formatters have separate values and are not substituted for these instructions.
The Voidwalker health input is Game+4cc, computed from the composed maximum
health divided by base health (denominator at least one), minus one. Flat health
therefore contributes; this input is not simply the percentage-health stat.
Armor comes from Game+4a0.

The live adapter now supplies actual victim boss/elite flags and the equipped
stat rows. Familiar and echo chance also use their equipped rows once, removing
the previous second contribution from the independently reconstructed Config.
Current talent composition and Empowerment production have separate ownership
under #12. These repairs share the existing canonical hit, meter, RNG and
pending-hit consumers.

`python3 -B scripts/check-demon-damage.py` executes **3,072 unchanged
native instruction cases** through the fully mapped current PE. They cover all
eight special kinds, ranks zero through three, the 30% health boundary, missing/
ordinary/boss/elite victims, Corruption admission, Supremacy and critical/noncritical
results. The independent scalar model matches exact f32 result bits. Synthetic
Game/vector/actor/aura/spec memory is explicit; allocator or engine behavior is
not inferred from those finite cases. The compact retained fixture supplies
192 authored Rust regression cases; those Rust tests remain uncompiled and unrun.

Raw-range Ghidra pseudocode has inferred ABI and external-dispatch limitations;
its recovered declaration omits the floating result. Exact assembly, referenced
PE constants and instruction replay control the interpretation. Compilation,
the actual runtime state, packets/meters, gameplay and original/rebuilt parity
remain unverified.

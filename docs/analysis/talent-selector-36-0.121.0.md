# Talent selector 36 — Soul Reaping correspondence

Finding **#249** is classified against installed 0.121.0 SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The widened selector is the current **Soul Reaping** effect variant. It is not
evidence of an absent new talent. The retained source already implements the
recovered scaling under its stable internal marker253/35.

The initial [selector observation](evidence/0.121.0/talent-selector-36.json)
retains the exact old/new switch geometry and its original uncertainty. The
new [contract](evidence/0.121.0/talent-selector/contract.json) binds the actual
current definition, original instructions, completed journaled Ghidra queries,
source boundaries and synthetic cases.
The source receipts bind the relevant rank/aggregate method fragments, keeping
unrelated concurrently reconstructed set-effect methods outside this finding.

## Producer, transformation and output

Current definition `0x14767d1f0` names save key `dark_pact`, title `Soul Reaping`
and the Death Coil/remaining Drain Life description. Its effects pointer/count
at +96 selects one Effect64 at `0x14767c8b8`: raw tag36, coefficient0.05, remaining
meaningful fields zero. The definition retains maximum rank3. This pointer join
identifies the producer independently of switch arithmetic or adjacent text.

Owner `0x145b44670..0x145b44d13` walks selected definition/rank pairs, reads
each definition's actual effect vector, and produces 72-byte rows containing
the definition pointer followed by an Effect64. It separately handles raw37
numeric stats and raw38 spell modifiers. Raw36 reaches switch cell36 at
`0x1476858dc`, targeting `0x145b44b43`.

The original prologue loads +1.0, -1.0 and0.5. The selected branch computes,
with separate f32 operations:

```text
effective_rank = max(input_rank, 1)
coefficient = base * max((float(effective_rank) - 1) * 0.5 + 1, 1)
```

Thus the authored ranks1/2/3 yield0.05/0.075/0.10. It preserves raw36 and the
definition association; it does not turn that row into a numeric-stat record.

The verified direct caller is `0x145b383e0..0x145b3870e`, callsite
`0x145b38451`. It sends each resulting payload to current aggregate
`0x145b38120..0x145b38340`. That aggregate diverts raw37 into its stat vector
and raw38 into its spell-modifier vector; raw36 is copied into the generic
64-byte effect vector, retaining its coefficient. Source `Effects::rebuild`
already has the corresponding generic/stat/spell separation using its stable
normalized source tags.

## Retained source and verification

`run_effects.rs::EffectRow::talent` applies this exact half-step rank growth to
marker253/35. `player_abilities/behavior/soul_reaping.rs` selects that marker
for the retained ordered coefficient and Drain Life remainder consumers. Their
[0.112.0 combat recovery](soul-reaping-0.112.0.md) keeps its original target;
this classification does not silently promote the whole combat contract to
0.121.0. No source enum renumbering or duplicate effect is needed.

Run with the existing project Python dependencies:

```sh
PYTHONPATH=scripts:runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-talent-selector.py
```

The checker verifies current definition/payload/table bytes, complete original
instruction boundaries, both durable Ghidra query subjects and source anchors.
It executes **256 rank cases and256 generic-publication cases**, totaling
**72,192 original instruction steps**. Synthetic memory supplies one selected
talent, allocator capacity growth, preallocated aggregate vectors and a borrowed
label. These are explicit fixture seams, not application execution.

The raw rank query does not import the external jump table; the separately
verified original table and complete branch instructions govern the switch.
Current full Death Coil/DoT gameplay, source execution, compilation and
original/rebuilt parity remain unverified. No game, network or server ran.

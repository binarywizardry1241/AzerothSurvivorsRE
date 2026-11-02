# Spell description expressions — 0.115.0

The live choice and spell-panel description formatter now reads all 113 current
base descriptions from `native-spell-descriptions-0.115.0.json`. The catalog is
bound to installed EXE SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
Current project status remains in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md); this report
owns only the primary base-description portion of gap #102.

## Native contract and source

The primary owner `0x14585c8e0` and passive owner `0x14596c1c0` read current
120-byte definitions from `0x146cc4580`, learned instance scalars, and the caller's
stat row. The recovered expressions preserve the original f32 operation order,
localized template keys, numeric precision, target grammar, periodic tick
rounding, passive cooldown floors, and Lightwell's independent target-count and
overlapping-well grammar. Radius text uses the native logarithmic softening only
above 70 yd. `roundf`, `ceilf`, and `log1pf` boundaries are identified through the
current PE import table; they are distinct operations.

`gameplay/native_overlay_payload.rs` selects the current catalog for
`description()`. Both the existing choice-card path and the spell tooltip path
consume that function. Empowerment is now one of the 113 recovered rows instead
of a separate historical description special case. The old catalog remains an
explicit historical test input; it is not used by live description selection.

Compared with the 0.100.1 catalog, the base text-expression trees differ for
Soul Fire and the newly added Empowerment. Ten entries have different numeric
expression trees: Bloodrage, Redemption, Hunter's Mark, Seal Fate, Lightwell,
Call of Flame, Polymorph, Searing Pain, Soul Fire, and Empowerment. This includes
current descriptor values and current traced clamps, rather than assuming that
unchanged wording establishes unchanged arithmetic.

## Evidence and checks

[The manifest](evidence/0.115.0/spell-descriptions/manifest.json) binds the current
definition table and canonical primary/passive/school/damage-fragment assembly
extracts. Durable REA/Ghidra queries recovered both description owners. Their raw
slice decompilation leaves computed branches unresolved; original PE branch
bytes and bounded admitted instructions establish the recovered branches.
Existing canonical [passive cooldown/floor evidence](evidence/0.115.0/coop-overlay/manifest.json)
is reused rather than copied.

The non-compiling check is:

```sh
python3 -B scripts/recover-native-card-prose.py --check
```

It verifies the installed target, checks every current descriptor's numeric
inputs against the live source catalog, and emulates all 113 descriptions for
baseline, modified, and large-area inputs plus both additional Lightwell grammar
combinations: 341 scenarios and 1,814 numeric comparisons. A separate expression
evaluation compares 578 shared baseline callsites with independently emulated
modified-input values. All 68 template keys exist in all 14 locale catalogs.
Compact [cases](evidence/0.115.0/spell-descriptions/cases.json) cover seven
representative spells, including current Searing Pain power, passive floors,
area softening, periodic rounding, Empowerment, and all four Lightwell branches.
Rust source tests consume those cases; they have not been compiled or run.

The recovery script requires Python's Unicorn package, with the existing
project-local recovery environment supported. Raw scenario output and durable
query journals remain under ignored `runtime/gap102/`. `--collect` regenerates the
retained catalog and compact evidence after recovery; `--check` compares them.

This is derived static instruction evidence. Compilation, native process
observations, gameplay, visual comparisons, extreme/non-finite input behavior,
and original/rebuilt parity remain unverified. Appended text, auxiliary card
rows, and panel integration have their own owning evidence.

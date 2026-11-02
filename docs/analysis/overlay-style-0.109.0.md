# Shared pause and terminal styling — 0.109.0

Target SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This revalidates the common panel/button constructors used by **#7/#9**;
[verification-needed](../verification-needed.md) owns their integrated status.
The existing source constants match these current native contracts. No new
palette, hover animation or substitute widget is warranted by this recovery.

## Native contract and connected source

| Current owner | Range, end exclusive | Selected contract |
| --- | --- | --- |
| Button style | `140100690..140100835` | Four gold border colors; one linear gradient with two raw color stops and angle π. |
| Panel style | `140101170..1401016bc` | Retain caller layout; replace all four borders with 1px and radii with 10px; supply border, gradient and shadow. |
| Color forwarder/consumer | `144c7dcf0` → `144c85c10..144c86386` | The constructors supply tag 0. Its actual jump-table branch copies the four Srgba channels unchanged. Other color branches are outside this check. |
| Shadow vector | `142649b80..142649c3d` | Allocate one 52-byte shadow row; copy the four supplied Val pairs and color. |

Fresh Ghidra 12.1.4 records and exact code/data hashes are retained in the
[manifest](evidence/0.109.0/overlay-style/manifest.json). The terminal's direct
calls at `140203f96`/`140205884` and pause panel's call at `1402087e8` resolve
to these same helpers. Their instructions are independently decoded and retained
once. Raw imports use inferred ABI/types and omit external PE relationships;
original Windows instructions and actual PE literals determine these contracts.
The raw Color import ends at its computed dispatch because its jump table is
outside that import. The native replay instead reads the actual PE table and
executes tag 0's copy/return instructions; it does not promote that partial
pseudocode to recovery of the other Color branches.

The live `menu::native_button_gradient`, `BUTTON_EDGE`, `native_panel_style`
and `native_panel` feed `gameplay::terminal_view` and `menu_overlay`:

- Button border: Srgba `(.690,.541,.227,1)`. Gradient stops retain raw
  `(.231,.051,.043,1)` and `(.102,.020,.020,1)` as linear colors.
- Panel border: Srgba `(.427,.333,.145,1)`. Gradient stops retain raw
  `(.078,.059,.035,.90)` and `(.031,.024,.016,.93)` as linear colors.
- Panel shadow: black alpha `.6`; horizontal/vertical offset `0/14px`,
  spread `0px`, blur `40px`. Black's channel values agree across the source
  and selected native color representations; this does not certify every color
  conversion used elsewhere.

## Static checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs \
  python3 -B scripts/recover-overlay-style.py --check --verify
```

Six original constructor executions pass with zeroed, `0x5a` and `0xa5` scratch
memory. They execute the real tag-0 color branch and shadow constructor, check
all border/gradient/shadow values, and verify preserved caller layout plus
overwritten widths/radii. Allocator setup, successful allocation and `memcpy`
are explicit seams; all interpreted instruction bytes match the selected EXE,
and native writes are restricted to scratch memory. The retained
[cases](evidence/0.109.0/overlay-style/native-cases.json) record those bounds.
Source checks trace the constants to the actual shared consumers; they do not
execute Rust or prove its type correctness.

`--prepare --work runtime/overlay-style-replay` stages four raw Ghidra plans.
Run their `plan.json` files with `scripts/rea-batch.py`, then use `--collect`
with the same work directory to stage candidate evidence for review. Nothing
is installed or promoted automatically.

No compilation, compiling tests, game process or rendered comparison ran.
Allocation failures, other Color variants, complete ECS/global/indirect
ownership, text shaping, GPU color space, platform behavior and original/rebuilt
parity remain unverified. This evidence revalidates shared styling only; it
does not certify the complete HUD, terminal screen or engine.

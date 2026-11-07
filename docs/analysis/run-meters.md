# Run damage, healing and boss meters

The supplied target is `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns current implementation status. This
report owns gap **#8**; terminal-screen presentation remains #9, and special
Demonology gameplay producers remain #24.

## Accounting and live consumers

The [accounting manifest](evidence/0.105.0/run-meters/accounting/manifest.json)
binds seven current native owners to exact PE ranges, hashes and REA/Ghidra
identities. Original Windows x64 instructions control parameter interpretation;
raw-import pseudocode uses a generic ABI and omits external data/callees.

| Contract | Current target evidence | Source consumer |
| --- | --- | --- |
| Effective damage | Hit owner `145933ec0`, meter prefix `1459343f2..1459346f5` | Both ordinary and primary-boss `CombatAdapter` hits record `min(amount, max(previous_hp, 0))` at the health mutation. Full hit amounts still feed combat logs and existing leech; periodic presentation events are not counted again. |
| Cumulative totals | `1459344b5..1459345c7` | Widen each effective f32 once into f64 run and per-spell totals. Suppressed logs and spell ID zero still contribute; zero-effective admitted hits retain their native zero row. `Mechanics::effective_damage` is the shared terminal-consumer boundary. |
| Source identity | Resolver `1458f2ee0` | Captured pet descriptors name icon-bearing pets/demons; absent/empty icons retain `Pets`. Effect provenance takes precedence over ordinary spell identity. Spell/talent rows sharing a name remain separate. |
| Row insertion | Shared owner `14595f3c0` | Merge by name and proc/talent flag, retain the first icon, accumulate f64 totals, and merge nested attack contributions by name. Displayed localized names are coalesced before rendering. |
| Captured attack contributions | Helper `1458f27a0` | An eligible kind-2 hit can carry primary/optional secondary labels and a captured f32 bonus. The secondary fraction is `f64(bonus)/(1+f64(bonus))`; it partitions the admitted amount instead of adding damage. A present empty secondary label is distinct from no secondary label. |
| Boss segments | First-hit branch `145934726..145934898`; stop scan `145935431..14593547b`, stop state `145935728..145935754` | The first primary-boss hit starts/resets only the boss ledger. Overlapping live primary bosses share the segment. The last death stops it; ordinary enemies and guardians do not hold it open. A subsequent fight replaces the prior boss rows without resetting cumulative damage. |
| Boss elapsed time | Summary branch `1458fd151..1458fd160` | Marker 2 has no fight. Other markers choose current time or stored stop time by bit 0; `live` specifically means marker != 1. |
| Healing admission | Credit owner `1458f8050` | Existing effective-healing producers feed the shared ledger. Ordered nonpositive healing is skipped; unordered values retain the target's gate behavior. Overhealing does not become effective healing. |

The shared model lives in [run_meter.rs](../../crates/azeroth-survivors-re/src/run_meter.rs)
and [healing.rs](../../crates/azeroth-survivors-re/src/run_effects/healing.rs).
Captured descriptor/attack context travels through pending hits and is restored
after nested callbacks. The ordinary pet planner supplies its actual descriptor;
it does not invent attack labels. The canonical ordinary/boss hit adapters
consume captured breakdowns after effective damage is known.

## Meter screen and persistence

The [screen manifest](evidence/0.105.0/run-meters/screen/manifest.json) and
[layout record](evidence/0.105.0/run-meters/screen/layout.json) bind the selected
settings, header, placement and screen ranges. The source implementation is
[meter.rs](../../crates/azeroth-survivors-re/src/gameplay/meter.rs), with separate
settings and view modules. The meter is the target's custom overlay, separate
from stock FrameXML panels.
It supplies Damage Done, Healing Done and Boss Damage views, source bars,
totals/rates/shares, attack tooltips, close/mode/reset controls and drag/resize.
The screen's reset changes its baseline and sample history; it does not clear
the game's ledgers or terminal damage total. Boss mode uses the actual last-fight
clock. The current-rate display uses the native eleven-second sample window.

The native sibling `meter.txt` contains six whitespace-separated fields:
`open x y width height mode`. An absent position writes `-1 -1`; the default is
closed, no saved position, size 250×170, Damage Done. The load path accepts at
least five f32 values and optionally maps the sixth to mode 0/1/2. Size is bounded
to 170×64 through 640×640. Open/mode and completed drag/resize changes persist
through the existing project/account base-directory and native direct auxiliary
file writer.

The button uses the real Minimap frame's bounds, `Ability_DualWield` and the
client's tracking border. The overlay uses recovered row/header dimensions,
palette, draw order and `hudMeter`, `hudScale`, `meterOnTop` settings. Its native
window/button draw orders are 4050/4060; it moves to 6040 over an active choice
overlay when `meterOnTop` allows it, with the parts tooltip at 6045. Meter-owned
CVar registration/scaling is independent of the custom run HUD plugin.

The current button owner `14016c400` assigns hover/selected backgrounds
directly; `140171380` assigns Minimap open/hover tint. Native constructor
replays recover the header/mode-menu layout, inline rate text, lowercase `x`
close control, bordered blue proc chip and 14×14 diagonal resize grip. These
contracts are connected in source; they do not establish rendered parity.

Embedding hover/drag capture runs before FrameXML mouse routing and joins the
world pointer arbiter after overlay actions. Its per-frame union resets in
`First`; independent overlays cannot release one another's capture. The minimap
bridge reads the visible named FrameXML frame's resolved normalized bounds.

The retained [move/resize instructions](evidence/0.105.0/run-meters/screen/move-resize.asm)
check left-button or active-touch ownership before querying the cursor. A released
drag clears its state and calls the settings writer at `0x14016db76` even when
the cursor has left the window. While held, a valid cursor supplies the movement,
with the first active touch as the fallback. The source keeps active drag capture
through release or departure and leaves persistence with the drag input owner.
The [0.139.2 input isolation trace](input-gate-native.md) revalidates
the drag tag, pointer capture and release writer for #310. Platform interaction
and original/rebuilt comparison remain open.

A later reconstruction screenshot shows the swords icon displaced from its
circular minimap border; [gap #56](../verification-needed.md) owns that
presentation defect. These historical constructor/placement contracts do not
establish rendered centering, atlas padding or DPI/HUD/minimap-scale parity.
The [0.113.2 button repair](meter-minimap.md) now owns its revalidated
geometry, native image overhang and centered scaling; actual rendering/input
comparison remains open.

## Soul Link and remaining limits

The current native incoming-hit branch `1458f34d4..1458f3599` caps Soul Link's
absorption to the remaining incoming hit and shield, then credits actual
absorption under `Soul Link`, icon `Spell_Shadow_GatherShadows`, proc flag false.
This branch is retained and checked separately from general healing.

The [special-demon integration](demon-gameplay.md) now supplies actual
summons, direct/deferred attacks and captured breakdowns. Voidwalker hits produce
Soul Link as a subset of total absorb. Incoming damage consumes a reserved spell
shield first, then credits only Soul Link's absorbed share, without subtracting
that share from HP or total absorb twice. The remaining subset is capped to
remaining total absorb. Eight additional native vectors cover reservation-first,
partial/depleted link, general-shield, zero and unordered cases. Authored live
regressions cover that sequence and attribution after demon expiry.
The existing periodic storage and historical healing/effect producers retain
their original provenance beyond the bounded current contracts recovered here.
Terminal summary presentation remains #9; this work supplies its shared
effective-damage total rather than implementing the terminal screen.

## Checks and reproduction

[Native vectors](evidence/0.105.0/run-meters/accounting/native-vectors.json)
record **89 passing unchanged-instruction cases**: effective damage/overkill,
source precedence, exact f64 splits, sequential insertion/merging, healing
admission, Soul Link credit, boss elapsed time and last-primary stop conditions,
learned-before-global/pulse spell lookup and actor-periodic source-word delivery.
The PE bytes/data are mapped unchanged. Explicit seams supply allocator storage,
byte comparison and English translation fallback. Hit cases enter after victim
admission/multiplier selection; the corpus does not establish live gameplay or original/rebuilt parity.

```sh
python3 scripts/recover-run-meters.py check
```

[Screen vectors](evidence/0.105.0/run-meters/screen/settings-native-vectors.json)
record **25 passing unchanged native settings/layout cases**: legacy/mode load,
NaN/infinity/saturation, scaled resize/clamps and header dimensions.
[Styling vectors](evidence/0.105.0/run-meters/screen/styling-native-vectors.json)
add **42 passing unchanged hover/tint cases** and **20 typed constructor
records** for header/menu/grip and proc-chip layout. Twenty-four bounded native
screen ranges are retained. Recheck them with:

```sh
python3 scripts/recover-meter-screen.py --check
```

The checks verify the full EXE hash, native extents, curated text identities and
retained vector outputs. Both use the existing project-local Unicorn installation.
Constructor probes reuse the retained Node384 map and revalidate its fields
against current typed submission helpers. Child spawners, allocator/command
storage, font handles and English localization are explicit seams; no renderer,
font shaping, layout engine or live input delivery executes.
`prepare` stages focused REA plans; run those with `scripts/rea-batch.py` and
`./scripts/rea`, then `collect` stages selected text under ignored `runtime/`
for review. Source builds do not need the reference executable or recovery tools.

Changed Rust sources were syntax-parsed with the bundled Rust formatter; this
is not type checking or execution. Authored Rust regressions cover native
ledger/split/settings fixtures, captured/deferred attribution, zero-damage versus
zero-healing admission, boss resets and overlay pointer ownership. They were
**not run**. No compilation, `cargo check`, compiling tests, game launch,
rendered/input comparison or audible validation was performed for this work.

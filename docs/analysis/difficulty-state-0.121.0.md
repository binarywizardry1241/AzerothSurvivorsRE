# Difficulty state and stat construction — 0.121.0

The installed 0.121.0 reference is SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`,
146,088,960 bytes. This report connects **#219**'s Difficulty selection to live
run construction. The [menu](difficulty-ui-0.121.0.md),
[shared descriptors](heroic-source-0.121.0.md),
[unlock/admission rules](heroic-unlocks-0.121.0.md) and
[twist consumers](heroic-twists-0.121.0.md) retain their own evidence.

## State connection

Pick's eighth field now carries a single Heroic rank. The shared current-target
parser accepts the recovered byte grammar, selects Normal on invalid input and
caps valid input at V. Historical four-percentage tuples consequently select
Normal. The retained `mods` field and historical scalar APIs remain available to
old fixtures; the current menu, save writer and run constructor use Heroic rank.
All Pick and RunRules construction sites explicitly initialize the new field.

Menu selection persists the requested rank. Current native local admission at
`145b23258..145b232a9` and host admission at `145b25984..145b25998` use the smaller
of that request and the selected class/zone's Save maximum. Live `gameplay::enter`
applies that effective rank without rewriting the stored Pick. The transient
Tester GUID `0x00ffffff` instead constructs Normal, before any later host
metadata minimum. The independent host metadata consumer rereads the retained
Pick request; it must not substitute the constructed Game rank.

Fresh custom Play and stock roster entry sample the recovered week. Again
captures the previous Game rank before dropping it and retains that rank and
week, even when the completed run raised an unlock ceiling. The requested Pick
stays unchanged. The common start owner `145b21eb0` binds the Tester identity at
`145b22727..145b2277c`, the Normal branch at `145b231ce`, constructor input
write at `145b2368c` and later raw-Pick metadata minimum at `145b25984`.
The [affix proof](evidence/0.121.0/affixes/manifest.json) binds the retained
rank/week writes and copies through `145b2d080`. Calendar, affix effects
and the rest of the run configuration retain their independent contracts.

The [start/admission proof](evidence/0.121.0/heroic-notice/manifest.json)
binds the common constructor and later independent host metadata branch.
For the synchronous local Again route, the [entry ownership audit](evidence/0.121.0/again-entry.json)
also binds the original nineteen equipment IDs, nineteen star bytes,
class-filtered pity vector and chosen weapon glow. `RunSession::prepare_entry_loadout` retains those
values and their derived gear effects only when both the captured solo-Again
intent and the per-entry restart marker are present. Fresh Play captures the
current Save again, including Normal starts. The [gear report](gear-progression-0.121.0.md)
records the allocation/mutation boundary and its cooperative/callback limits.

The original constructor reads input rank at `+0x1bf`, copies all `0x1c0` bytes
into Game at `+0x1b0`, and copies the complete `0xd38`-byte Game to its output.
The rank reaches Game `+0x36f`. `RunRules::heroic_rank` is the shared source input
for stat, guardian, boss, healing and other twist consumers.

The [constructor proof](evidence/0.121.0/difficulty-state.json) binds the exact
installed bytes, original Ghidra result and three bounded instruction ranges.
Eight ranks, including out-of-domain bytes, pass sixteen declared memory-copy
seams. This proves copying, not admission or complete Game construction.

## Ordinary and scheduled boss stats

Live ordinary/elite and scheduled-boss spawning call
`initial_stats_for_heroic_zone` and `initial_heroic_stats`. Both take HP and damage
multipliers from the shared current Heroic descriptors and retain native base
movement speed. Current run construction supplies unity for the obsolete
percentage inputs. Existing historical scalar entry points preserve their
original behavior for older evidence and callers.

The [scaling proof](evidence/0.121.0/heroic-scaling/manifest.json) binds ordinary
constructor `145c14ae0` and scheduled boss constructor `145c275f0`: two durable
Ghidra results, six exact ranges and **64 original-instruction stat cases**.
The fixtures retain the recovered float operation order and declare curve,
power and party inputs as seams; source party scaling remains independently
owned. Guardian construction has its separate proof in the twist report.

## Checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-difficulty-state.py
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-heroic-scaling.py
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-again-entry.py
```

These checks interpret bounded original instructions with synthetic memory.
The changed Rust source is parsed without compilation. Source tests remain
uncompiled and unrun. Compilation, actual menu/save/run execution, networking,
rendering, gameplay and original/rebuilt parity remain unverified.

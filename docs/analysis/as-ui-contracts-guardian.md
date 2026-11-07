# Guardian reward choice delivery

Gap **#41**, installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[Native/source proof](evidence/0.113.2/as-ui-contracts-guardian.json),
[equipment control dependency](as-ui-contracts-reward-controls.md),
[related Horn eligibility](as-ui-contracts-horn.md).

The live guardian-death/strength path accumulated `pending_jewelry` and emitted
`GuardianRewardEvent::JewelryChoice`, but no consumer opened that offer or
decremented its counter. Shared completion considered only purchased caches and
earned levels. Guardian equipment rewards therefore remained permanently queued.

The repaired path now opens the actual shared reward generator after strength
admission or the preceding choice completes. Guardian offers use their independent
counter and native `0.25` rarity bonus, the existing jewelry/amulet/gold pool,
shared run RNG, displayed-item Seen publication and inventory/stat application.
Invalid selection leaves reward state and RNG unchanged. Acceptance decrements
only its source counter. Repeated guardian offers drain without spending stored
levels. Their existing Guardian overlay title/color is now selected, and offer
identity includes the source so an identical payload cannot retain cache styling.
Reroll and Banish regenerate the same source without spending its pending reward;
Skip consumes that source through the same completion path as acceptance.
During completion's XP sweep, clearing the old rows no longer lets XP's
automatic level-offer path preempt another queued guardian reward. The source
retains a completion guard through that sweep and releases it before the normal
priority scheduler. An already-open strength level offer can still reroll while
guardian equipment waits behind it.

## Current native contract

- Strength's final gate `1458e1b05..1458e1b2d` opens mode `2`, pause `true`,
  only with pending guardian equipment, suppression byte `+c08=0`, phase `+c12=1`.
- `145965190` routes mode `1` to the common equipment generator with bonus `0`,
  and mode `2` with the exact current `0.25` constant at `145ea25c4`.
- Shared completion `145966b20` saturating-decrements source `0` at `+b80`,
  source `1` at `+b84`, or source `2` at `+b88`. Only source `0` records the
  first level offer as consumed.
- After its shared XP sweep, completion prioritizes cache `+b84`, then guardian
  `+b88`, then levels `+b80` when automatic offers or explicit spending permit.
  Otherwise it resets the source sentinel and spending byte before resuming.
- Completion calls XP owner `14590eb10` at `145966d51`, without resetting its
  phase before the call. XP's level-offer gate `14590f20d..14590f242` requires
  phase `+c12=1`, pending levels, no suppression and automatic/explicit spending.
  Completion's retained phase `2` therefore prevents XP from opening an offer
  before the source-priority scheduler at `145966d56` runs.
- Reward generator `14596cbb0` adds the caller bonus to current luck and capped
  level bonus for jewelry; new amulets receive the additional native `0.5`.
  The five rarity weights and f32 operation order match the existing source.

Fresh REA/Ghidra observations bind all four complete declared owners. Raw
decompilation cannot recover every external call or computed successor; the
checks above use current PE instructions and immutable constants directly.
The historical general reward/presentation reports retain their actual targets.

## Static validation and limits

`check-guardian-choices.py` passes **702 original instruction cases**:
192 independent counter transitions, 108 priority/storage combinations,
48 strength admission cases, two generator bonus arguments and 160 finite rarity
inputs, plus 192 XP phase/suppression/storage gates. No call or external seam is
admitted by those fixtures. Source checks
trace the live producer, source/counter routing, shared consumer and presentation.

Five authored Rust regressions cover strength→level choice→guardian acceptance,
two guardian offers with stored levels, Reroll/Banish/Skip and invalid selection,
cache→guardian→stored-level priority, actual nearby XP swept during guardian
completion, and level rerolls with a queued guardian reward. Two further equipment-control regressions
and their separate native fixtures are described in the dependency report. Rust
regressions were not run.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-guardian-choices.py
```

Compilation, Rust execution, real UI/input/persistence and original/rebuilt parity
remain unverified. This repairs the identified live guardian delivery omission;
it does not certify the full current reward catalog, every mutable Game alias,
generic ECS resources or broader #41 native/source equivalence. Co-op paths are
excluded from this source repair.

# AS diagnostic caller boundaries in 0.141.0

`Q41-D01` uses the installed `installed-game/AzerothSurvivors.exe` with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [immediate classification](evidence/0.141.0/as-ownerless-sites.json)
accounts for all 74 selected sites across 27 declared extents. Sixty-four
stop at terminal failure interfaces. The ten returning and formatting sites
have these caller roles. The saved Ghidra body ownership remains unchanged.

## Returning removals

- **Options.** `0x140206a90` compares the selected eight-byte header key
  against the expanded vector and branches to indexed removal on a match.
  On a miss, `0x140206af9` stores the key at the end and increments the
  length. `Action::BindingHeader` supplies this membership toggle through
  the rebuilt view. [Options input](../../crates/azeroth-survivors-re/src/options.rs).
- **Darkmantle.** The eight-byte removal at `0x145f9249c` passes the
  returned target to the aura interface with ID 8647 and presence zero.
  The source removes the displaced mark, then publishes its aura removal
  before publishing the incoming mark. [Darkmantle callback](../../crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs).
- **Totems.** The 30-of-kind gate and first equal key reach stable 128-byte
  removal at `0x145f54cda`. `0x145f54ce9` consumes the removed row before
  replacement construction. The source follows the same selection and
  expire-before-create sequence. [Limit](../../crates/azeroth-survivors-re/src/player_abilities/behavior/totems.rs),
  [cast](../../crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs).

## Spell choice text

The two `spell` operands sit beside `game/auras.rs` in data. The containing
producer `0x145fbbf50` renders `New: {spell}` and `{spell} rank {rank}`.
Both paths resolve the spell name through `ability.<key>.name`, with the
ability descriptor's name as fallback. The second path loads the 32-bit
current rank from instance `+0x30` and increments `eax`, preserving wrapping.
The rendered title becomes the leading string of the 160-byte offer row.

The JSON writer `0x145fb9ce0` passes row `+0x08/+0x10` to the `title`
field at `0x145fba643` and `+0x50/+0x58` to `name` at `0x145fba667`.
The publisher at `0x145fb82b5` and the already-open offer path at
`0x145fc111a` both append that writer's output to the same queue.
The rebuilt shared card producer owns the title and display name used by
the solo overlay and the per-recipient co-op envelope. The renderer
displays the ordinary name when present and uses title as its fallback.
The older envelope report retains its original target.
[Payload source](../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs),
[Co-op sender](../../crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs),
[0.115.0 envelope](coop-overlay-0.115.0.md#private-choices).

The three `p` operands in `0x14605d5a0` carry percentage text to
`+{p}% duration`, `+{p}% area` and `-{p}% cooldown`. Each branch multiplies
its selected magnitude by 100 before formatting and substitution. The
existing `upgrade_lines` producer supplies these same percentage slots.

## Equipped jewelry names

The two packed-format references beside `game/meterfeed.rs` belong to the
selection handler at `0x145fc1500`. Its admitted path reads a 160-byte offer
at the selected index, then rebuilds temporary equipped item records.
The site at `0x145fc2364` combines the `jewel.<key>` localized name or
descriptor fallback with a rank suffix. `0x145fc262f` combines the worn
amulet name at `Game+0x510` with the same suffix. Ranks 0 and 1 skip the
suffix, ranks 2 through 10 use a space and Roman numerals, and ranks 11 and
above use ` X+`.

Both results become the leading string of 96-byte item rows. Jewelry uses
inventory type 11 or 12 and the amulet uses 2. `0x145e073e0` compares the
retained slot, name, quality and text. On a miss, `0x145fc2c90` starts the
process-wide dynamic entry allocation and `0x145fc2d1e` derives the equipped
GUID field from the slot. This is the character inventory contract under
[#55](../verification-needed.md#gap-55). The source's `temporary` and
`ranked` paths already cover the selected name and suffix behavior.
[Inventory source](../../crates/azeroth-survivors-re/src/gameplay/client/inventory.rs),
[Historical inventory proof](equipped-inventory-0.113.2.md).

## Static checks

The [caller fixture](evidence/0.141.0/q41-diagnostic-consumers.json) binds
eight current code ranges, 38 instruction anchors, 16 referenced byte spans
and nine admitted rank-table entries. The checker reads the EXE in place.

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-coop-overlay.py --diagnostic-consumers
```

This trace covers the selected successful caller roles and their immediate
outputs. Other successful branches in the 27 extents, dynamic aliases,
compilation, network delivery, rendering and original/rebuilt parity remain
separate from this evidence.

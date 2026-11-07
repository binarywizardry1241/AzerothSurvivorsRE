# Class, talent and player-ability definitions

Selected target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns gap #34's surviving class/talent/ordinary-ability definition
revalidation. Current overall status belongs to [verification-needed](../verification-needed.md).
Bosses, ordinary gear and amulets have separate owners. Matching definition data
does not certify every historical class consumer or original/rebuilt parity.

## Complete selected-target table comparison

[`recover-balance-catalog.py`](../../scripts/recover-balance-catalog.py)
reads the complete tables from the selected PE and compares their semantic fields
with the actual embedded assets and Rust catalog. It uses only Python's standard
library. The [compact manifest](evidence/0.105.0/balance-catalog/manifest.json)
retains table/range hashes, whole-catalog semantic digests, coverage counts and
the explicit representation translations. Regenerable full inventories are not
duplicated in the repository.

| Definition source | Current native layout | Checked live source |
| --- | --- | --- |
| Nine classes | `146bab7a8`, stride144 | Health, armor, leech, starter and ordered spell pools in `menu.json`, `talents.json`, `run-entry-0.100.1.json` and `player_abilities/catalog.rs` |
| 113 player abilities | `146bacad8`, stride120 | Key/name/icon, ordered upgrade kinds, all numeric definition fields, status payload, school and cast kind in `player_abilities/catalog.rs` |
| 27 talent trees / 355 talents | Index `146e74860`, class stride200 / tree stride64; talent stride120 | Key/name/icon/prose, row/column/rank/prerequisite for every definition; 340 ordinary talents / 409 effect payloads, plus the 15 separately recovered current overlay definitions |
| Five ordinary upgrade arrays | `1471b4290` through `1471b4350`, five entries each | Power, cooldown, targets, area and duration arrays in `player_abilities/upgrades.rs` |

Surviving ordinary definition values match the existing source. The current
Warlock pool contains Demonic Empowerment; the Rust gameplay catalog already
contained it, but the menu's separate class pool and ability list did not. Those
two menu data paths now include its exact native name/icon and ordered position.

The 15 current overlays are the 14-entry Demonology tree and Scorched Earth.
Their owning [Demonology evidence](demon-offers.md) is reused rather than
copied. Its allocation/migration scope remains separately owned by #12.
Shadow Dance and Shadow Weaving source corrections belong to the separate
[class-rule report](class-rules.md); this comparison verifies their
resulting definitions without claiming them as new changes in #34. Their live startup reader distinguishes raw28
(replace the first ability) from raw27 (append), and `conversion_amount` reads
the exact raw5 amount against victim maximum health. Their compilation and
gameplay/presentation remain unverified.

### Native and internal representations

Current numeric talent variant35 and keyed spell variant36 correspond to the
source's historical internal30/internal31 representations. The comparison
translates only those two native variants; native Demonology30–34 keep their
separate owning consumers. Pointer-bearing strings/lists are compared by their
resolved values, while enum padding and relocated pointer addresses are excluded
from semantic equality. The five ordinary raw29 grants are separately checked
against their current creature IDs and the live keyed follower producer,
including repeated Spirit Wolf/Treant grants.

Adding current Empowerment status10 shifted the later native status variants:
weakening11, immunity12 and retaliation13 correspond to the source's internal
10,11 and12. Eight ordinary descriptors require this explicit translation.
Empowerment itself retains its key-qualified dual-magnitude status10. Existing
historical assets/consumer tags are preserved; this report does not relabel
historical source bytes as current native bytes.

## Connected Demonic Empowerment picker path

Adding the menu data alone would still hide the spell: `picker.rs` calls
`ability_tooltip::picker`, which returns `None` for an entry absent from the
historical tooltip-expression asset. The asset now supplies the selected-target
base tooltip, and the existing icon loader resolves its descriptor icon through
the configured MPQ chain.

Fresh REA/Ghidra inspected the unchanged current base-tooltip function
`14007e870..14007ed3d`:

- It resolves the actual definition, creates a rank1 instance with neutral
  modifier lanes and zero-level class stats, and resolves the school label.
- It uses the current `1.4` scale for base cooldown, calls the current description
  formatter `145987260`, and optionally appends the caller's starting-spell text.
- Its current caller `1401ed765..1401ed7ae` passes the ordered pool key to this
  owner. School5 maps to the exact `Shadow` literal.

The resulting base subtitle is **Shadow · 35 sec cooldown**. The body uses the
already recovered [Empowerment description](demon-offers.md), with
**30% damage, 15% attack speed and 11 sec** after native display rounding.
The existing expression renderer continues to resolve the school, cooldown and
body templates through the selected locale. The current Empowerment body/name
are absent from the historical embedded language files, so they fall back to
their exact English literals; this repair does not claim current translation
parity for all fourteen locales.

Current name lookup `1458744e0..145874574` constructs `ability.{key}.name`, then
falls back to the descriptor's display name when the key is absent. Localization
now preserves that fallback for ability names, starters and pool names; it no
longer turns the new spell into the literal missing translation key.

The canonical [native extracts](evidence/0.105.0/balance-catalog/manifest.json)
contain four current instruction scopes and the normalized Ghidra output for the
base-tooltip owner. Its Evidence ID is
`ev_e9c7077b7f489248135624b4093659ccd00bfa0875de086bf40221cb9aa77fb6`.
The raw Ghidra import omits external code/data and uses a generic compiler ABI;
the original Win64 instructions and complete PE data control argument binding
and constants. The description owner's existing canonical extract is referenced,
not duplicated.

## Verification and limits

`python3 scripts/recover-balance-catalog.py --check` verifies the selected
EXE hash, every definition comparison above, the connected picker expression and
literal-name fallback, and all retained instruction/pseudocode hashes.
`--prepare-native` reproduces the project-local base-tooltip REA plan;
`--collect-native` stages its reviewed textual extracts below `runtime/`.
`--apply-menu` updates only the class/ability menu data and current tooltip entry.

Rust syntax parsing of the localization change passed with the installed
`rustfmt --emit stdout`; no compilation, compiling tests, application launch or
original/rebuilt interaction occurred. Full consumer behavior, tooltip rendering,
all current translations, live input and gameplay/visual parity remain unverified.
The authored localization regression covers English/Polish/English changes,
preserved native fallback names, existing translated spell names and the exact
English Empowerment tooltip through its live expression renderer. It was parsed
but remains uncompiled and unrun.

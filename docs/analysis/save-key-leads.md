# Save/configuration string-lead meanings

Target SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This bounded **#41 / Q41-D03** classification accounts for **all five** original
`save_configuration_key_lead` candidates. The regex class names are hypotheses,
not native data types. Original census/queue populations remain unchanged.

| Original address / literal | Current bounded meaning |
| --- | --- |
| `1400e9c47` / `talentxp` | An immediate inside the frontend's message-type comparison at `1400e9c45`; it is not a save-file key. The conditional edge targets `1400ea3e6`. |
| `145ea1941` / `config.toml` | Legacy migration's special relative filename, already recovered under [#62](legacy-config.md). |
| `146029aa1` / `config.toml` | The ordinary engine CVar reader `140f11f70` and writer `140f13cf0`, reached after shared home selection. The reader's native Location names `crates/benilla-app/src/cvars/mod.rs`. This is not a separate AS save format. |
| `147015f7e` / `talentxp` | The AS backend message's JSON `type` value. Current producer `14587b0e0` serializes `xp`, `before`, `total`, `points`, `gained`, `into`, `next`, `class` and `parts` before publication. |
| `1473002d5` / `characters.txt` | The default AS character filename. Current path helper `1458988e0` selects `WOW_ROGUE_SAVE` first; absent override follows its base-directory helper and appends this filename. No actual save access is performed by the analysis. |

The [proof](evidence/0.113.2/save-key-leads.json) retains each original literal,
all five exact forming operands, current native bytes and fresh Ghidra evidence.
The frontend's focused function-body set omits computed cases; separate
code-only Ghidra observations establish the selected MOVABS/CMP/JE and case
entry without manufacturing enclosing-function ownership. The full-image
reference/body observations retain their own profile and limits.

The existing AS `TalentSummary` and terminal view already connect gained XP,
explicit before/saturated total, class and ordered parts to the actual display;
the character-path source already exposes the override/default distinction.
These source paths are inspected, not executed. Native message classification
does not establish complete current XP arithmetic, JSON/parser behavior,
frontend resource identity or presentation. Earlier XP/persistence reports keep
their actual target provenance. No demonstrated additional source omission is
established in these five routes, and no new save record or engine code is added.

`python3 -B scripts/check-q41-save-key-leads.py` rechecks all five byte
leads, the complete fixed-operand input commitment, selected code/producer
observations and the live source connections. `--stage` writes a candidate under
ignored `runtime/q41-save-key-leads-0.113.2` for review. Fresh Ghidra can be
reproduced with the original plan/seeds retained there: the five current owner
entry candidates recorded in the proof, plus code-only seeds `1400e9c45`/`1400ea3e6`,
the recorded disabled-analyzer profile and a fresh project-local output path.

These are bounded meanings and supporting source connections. Full native
type/alias/caller ownership, remaining D03 classes, filesystem/environment/error
semantics, source/ECS/VM execution, compilation and original/rebuilt parity remain
open. No compiler, save/configuration mutation, application or game session ran.

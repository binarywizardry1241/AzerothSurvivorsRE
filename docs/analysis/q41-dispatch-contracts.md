# Thirteen AS-context dispatch contracts

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This is a bounded #41 investigation of the thirteen declared-extent jump
sites absent from the original body-context projection. The
[proof](evidence/0.115.0/q41-dispatch-contracts.json) supplements the
[expanded gap projection](evidence/0.115.0/expanded-gap-dispatch.json).
All thirteen sites have exact selector/base results and explicit remaining
limits. No demonstrated missing source operation was found.

## Native producer bounds and source correspondence

Every site uses a signed 32-bit relative table entry. The checker verifies the
selected prelude and entire declared extent against the installed bytes,
resolves the encoded RIP-relative base, and checks **47 conditional cells**.
A cell is admitted only under the stated producer or predicate; its presence
does not define the full table, every possible incoming path or an original
Rust type. Declared extents are not substituted for Ghidra body ownership.

| Jump site | Recovered bounded input/result | Existing source counterpart / remaining contract |
| --- | --- | --- |
| `1400a4137` | Caller `1400aa5aa` checks descriptor index `<105`, then control `<5`; it copies that control tuple into the formatter argument. Cells `0..4` are exact. | `options.rs::Definition::formatted` already handles these five numeric presentations. Other caller `140340d57` and arbitrary tuple ancestry remain unclosed. |
| `1400b0e45` | Nonnegative first words select cell `4`; negative words select `word XOR 8000000000000000`. | Existing Options `Action` handler. The complete native negative-niche Action writer/type population remains missing; no other cells are inferred. |
| `14010c265` | Reuses the current Action `10` producer and exact cell to `14010c8f5`, which opens the Coop presentation resource. | Existing [Coop OPEN proof](evidence/0.115.0/coop-ui/open-admission.json). Other shared menu Action values/aliases are not reopened or certified. |
| `140113990` | Outline geometry reads shape at row `+54`. Current marker decoder constructs only `0..3` at that exact field. Four cells are bound. | Existing `raid_markers.rs::Shape` and live geometry builder. Arbitrary other row writers/aliases and rendering remain unproved. |
| `140113bf0` | Fill geometry reads the same shape field; the same four producer values bind four cells. | Same shape/geometry source and limits. |
| `1402553a6` | Unsigned input tags `0/1` both select cell `8`; other inputs select `tag-2`. | Existing Armory secondary-input consumer. The wider shared input enum/producer identity remains unclosed at this interface. |
| `1402b1263` | Input is a byte; tag `6` has an earlier separate handling branch. | Existing progression/rewards input. Complete remaining Action writer/type identity is missing; no table length follows from byte width. |
| `145854245` | Magnitude reads the upgrade-kind byte. All 113 immutable current ability slices contain only `0..4`, matching the existing five source lanes. | `player_abilities/upgrades.rs::magnitude`. Arbitrary selector slices/definition pointer ancestry remain open. |
| `145931af4` | Cast dispatch reads definition kind at `+75`. All 113 current descriptors contain kinds `0..11`, matching source catalog fields; twelve cells are bound. | Existing `player_abilities/behavior/dispatch.rs::cast`. Complete learned-pointer ancestry and every branch's mechanics are not established by these cells. |
| `1459439b4` | Effect records have stride 64; end pointer or tag `255` stops the loop before dispatch. | Existing `run_effects.rs` effect application. A complete successful native Effect64 producer/type population is still missing, so no finite table population is admitted. |
| `1459793ef` | Choice construction normalizes nonnegative headers to `1`; direct native callers construct negative headers `2/3/4`. These four selectors bind four cells. | Existing choice/reward construction. Cursor-derived input ancestry, Learn `0` admission at this entry and arbitrary niche words remain unclosed. |
| `14597e7f4` | Accept reads display `+78` after its state/index gates. The current constructor writes negative headers `0/2/3/4` there; nonnegative Vec headers select `1`. Five conditional cells are bound. | Existing gameplay choice acceptance. Complete constructor input validity and all mutable display-Vec aliases/writes remain open. |
| `1459e066f` | Prose reads a byte from its input slice, forwards that byte to magnitude, then dispatches it. Current descriptor upgrade kinds supply the five `0..4` cases. | Existing `native_overlay_payload.rs::upgrade_lines`. Generic slice ancestry/mutations remain open; no universal byte-domain claim is made. |

The current descriptor check compares only the fields needed for these
dispatches: key, ordered upgrade-kind slice and cast kind. It reads the
113-record table already bound by current addon metadata at `146cc4580`,
stride 120. It does not re-certify all ability data or reopen already
implemented mechanics solely for a newer-target proof.

The guarded Options caller compares the low dword of the control tag, while
the formatter reads its full qword. All 105 immutable current descriptors at
`145ee9600`, stride 152, have zero upper control dwords and match existing
source keys/control values. That input fact is required to admit the five
formatter cases; a low-dword comparison alone would be insufficient.

The marker bound follows actual constructor writes. Decoder `1401116e0`
assigns ESI precisely `0/1/2/3` along the shape branches, retains it through
the native helper interface, and saves it at stack `+94`. Both append and
replacement copy that value to the 128-byte row's `+54` field. Both selected
geometry dispatches read that field. These facts support the decoder-produced
subset without asserting that every mutable alias to a marker row is closed.

Choice headers similarly have concrete writers: native callers at
`14597542a`, `14597d038` and `14597d43c` supply `4/3/2`; constructor writes
at `14597a930`, `14597ae68`, `14597a324` and `14597a805` supply the selected
display headers `0/2/3/4`. A nonnegative Vec header selects `1` by the actual
TEST/CMOVS/XOR normalization. Arbitrary negative words still have no bounded
domain, and successful cells do not certify all allocation or alias ancestry.

## Ghidra limits and checks

Twelve fresh journaled Ghidra queries cover the twelve distinct declared
owners. Their exact target, Evidence IDs, profile/result digests, warning
counts and selected warnings are retained in the proof; original query
results and the resumable operation journal remain under
`runtime/analysis/history/findings/q41-dispatch-contracts/25b277c5dc32/rea-owners/`.

Several native enums have no local range check because their actual type or
producer supplies the invariant. Ghidra consequently either reports that
it could not recover the jump table or includes neighboring bodies with
overlapping/bad-instruction warnings. For example, its inferred magnitude
result expands to over 500 KB and the cast result to over 1 MB. Those inferred
bodies, case populations and return types are **not** used as native/source
contracts. Only the exact independently decoded extents, encoded expressions
and admitted producer subsets establish the results above.

With the existing Capstone 5 environment:

```sh
python3 -B scripts/check-q41-dispatch-contracts.py
```

The check passes for all thirteen sites, twelve query receipts, 47 conditional
cells, 113 descriptor inputs, the exact Options guard/copy and marker/header
writers. Every admitted destination is an independently decoded instruction
inside its selected declared extent. Unknown words or neighboring executable
data are never used to guess another table length or destination.

The investigation establishes no additional missing gameplay operation.
Remaining native Action/Effect64 types, arbitrary descriptor/slice/row aliases
and full successful state/consumer closure remain #41 recovery limits.
Compilation, actual client/rendering/game/network execution and original/rebuilt
parity remain unverified. No gameplay source changes or application execution
occurred in this investigation.

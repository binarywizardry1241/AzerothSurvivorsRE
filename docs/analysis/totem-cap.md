# Totem population limit

Target: installed **0.127.0**, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This is the source/static repair for permanent finding **#13**. The
[0.105.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/totem-cap-0.105.0.md) retains its historical 40-cap proof;
the current limit is **30 per captured ability key**, rather than 30 across
both kinds together.

The [current contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.127.0/totem-cap/contract.json) binds the exact
original cap and removal instruction ranges. Current dispatcher
`145c60650..145c647f0` is shared with the existing journaled Ghidra query named
in that contract. Its raw pseudocode stops at an external jump table, so the
remaining cap branch is established by the original instructions and the
compatible seeded `145c62b09` query recorded in the same contract. That current
Ghidra result independently shows the `<30` branch, equal-key traversal,
first-match removal, ordered callbacks and subsequent new-GUID publication.

| Original instructions | Current contract |
| --- | --- |
| `145c62b09..145c62b89` | Traverse Game's totem vector at `+640/+648/+650`, with 120-byte native rows. Count captured definitions with equal key length and equal key bytes. |
| `145c62b89..145c62b93` | `cmp count,29` followed by unsigned `jbe`: fewer than 30 existing matches admit the new summon without eviction. |
| `145c62b93..145c62bf6` | Find the first equal-key row and remove exactly that row. A preexisting overfull list loses one row, preserving the other rows. |
| `145ceb3c0..145ceb4cf` | Save the selected row, move its suffix down by 120 bytes and decrement vector length. This is stable removal, with bounds failure separate. |
| `145c62bf6..145c62c3f` | Pass the removed GUID and saved XYZ to expiry `145c85830`, then destruction `145c6bd30`, before continuing the new-summon path. |
| `145c62f46..145c62fa9` | Resolve Magma/Searing model and allocate the new shared-counter GUID after any eviction callbacks. |

`behavior::totems::KIND_LIMIT` now owns the limit for both replacement admission
and the addon snapshot consumer under **#284**. `remove_for_kind_limit` keeps
the existing ordered first-match removal. The live kind-ten dispatcher already
invokes expiry before `Totem::new` allocates the replacement GUID; ordinary
scheduled casts and milestone/freecasts share this dispatcher. Existing expiry,
Call of Flame and pulse mechanics retain their separate recovered provenance.

The Rust row is a semantic source type. Its captured instance size does not
declare the current native 120-byte ABI.

Validation:

```sh
python3 -B scripts/recover-totem-cap.py check --contract docs/analysis/evidence/0.127.0/totem-cap/contract.json
```

The existing checker accepts the target/layout/range contract as an input and
verifies the selected EXE, instruction digests, source limit/removal/call order
and **28 original-instruction cases**. Both keys cover 0/1/28/29/30/31/47
same-kind rows with independent mixed populations, exact survivor order and
expiry-before-destroy GUID/position publication. Only the cap and vector-removal
instructions run in an isolated emulator; CRT comparison/move and gameplay
callbacks are explicit seams. The existing Rust vector regression now consumes
the [current native vectors](evidence/totem-cap/native-vectors.json).

Compilation and the authored Rust regression were not run. No game, client,
network or server was operated; actual VM/event delivery, gameplay, rendering
and original/rebuilt parity remain unverified.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/totem-cap-0.105.0.md)

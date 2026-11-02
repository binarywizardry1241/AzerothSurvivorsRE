# AS diagnostic sites outside saved function bodies — 0.119.0

Target: installed **0.119.0**, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This is a bounded **#41 / Q41-D01, Q41-G01, Q41-U01** role investigation.
Current implementation status remains in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The [exact proof](evidence/0.119.0/as-ownerless-sites.json) classifies **all 60**
`AS-custom-path` diagnostic records whose `actual_body_owner` is null in the
[current residual inventory](evidence/0.119.0/native-residuals.json). They occupy
twenty declared unwind extents. The selector includes the entire population,
without sampling or inventing new function entries. Original Ghidra ownership
observations are preserved: the classification does not add these instructions
to any saved body or change census totals.

| Complete site population | Role established from current bytes |
| --- | --- |
| 53 Rust Location records | Local routes forward the Location into terminal failure helpers: thirty calls to `14613b553`, twenty-one to `14613b730`, one to `14613b470` and one to `14613b4b0`. Each helper has a straight call path ending in `UD2`, without a return or conditional jump. These are failure-context records, not evidence of fifty-three missing AS implementations. |
| 2 Rust Location records | The options caller `14027e760` forwards its Location to `1400d4480`; the abilities caller `145bbb1f8` forwards its Location to `145c26170`. Both helpers return on admitted input and preserve a separate bounds-failure path. They must not be mislabeled as unconditional panic sites. |
| 2 adjacent `spell` tokens | `145c01222` and `145c0176f` load a pointer five bytes before the `game/auras.rs` filename and explicitly store length five. They pass one/two formatting descriptors to `145b29e90`. Only the bytes `spell` are selected; the filename is not read as a source-path value. |
| 3 adjacent `p` tokens | `145c147e4`, `145c1491a` and `145c149c0` load a pointer one byte before the `i18n.rs` filename, explicitly store length one and pass one formatting descriptor to `145b29e90`. Only `p` is selected. These references do not establish i18n source ownership of their containing unwind extent. |

The fifty-five Location structures are independently checked as 24-byte native
records: filename pointer/length and exact line/column. Every classified route
is retained as exact instruction sites and a route-byte digest; each enclosing
declared extent has its own current file-range digest. Shared native instructions
are not copied into multiple assembly extracts.

## Returning helper boundary

`1400d4480..1400d44db` reads a vector length at `+0x10`, admits an index strictly
below it, copies the selected eight-byte row, shifts the remaining rows through
the native movement helper `145f941e1`, decrements the length and returns the
selected row. Rejection forwards the supplied Location to `14613b28b`, followed
by `UD2`.

`145c26170..145c26280` performs the corresponding removal for a **120-byte**
row. It additionally requires the selected row's first word to be nonzero before
returning the copied row. Both a rejected index and that zero-first-word case
reach the same failure edge. The row's complete higher-level schema is not
inferred from its width or from the caller's filename.

Three journaled raw-slice `./scripts/rea query` runs retain Ghidra pseudocode and instruction
results for those helpers and `145c14660..145c14a5e`. Their exact raw input spans,
plans, result hashes, Evidence IDs and profile digests are bound in the proof.
Raw-slice pseudocode has incomplete external symbols and calling-convention
inference; instruction bytes establish the described register/branch contracts.
The latter function's indirect dispatcher uses a table outside its raw slice,
so its pseudocode does **not** recover the complete dispatcher or prove every
case reachable. The five descriptor constructions and direct formatter calls
are independently established by their exact local instruction routes.

## Complete AS-Location context follow-up

The follow-up selects every saved ownerless instruction lying inside any declared
extent with a genuine Rust Location for either AS crate, including cooperative
paths despite their collector's historical `excluded-coop` label. This yields
**788 instructions / 49 contiguous runs / nineteen extents**, selected from
**291** Location-bearing context extents. Filename-only candidates do not enter
this selector. Every selected instruction is checked against the installed EXE;
the proof retains all exact runs, digests and call sites.

| Instructions | Bounded context |
| --- | --- |
| 237 | Failure routes and terminal traps; each call in these runs resolves to the four failure helpers above. |
| 248 | Totem-cap eviction, subsequent creation and owned-value cleanup in `145bb8e90`. |
| 296 | Upgrade/card payload construction and owned-value cleanup in `145c00d20`, including the explicit `spell` descriptors and Pouch of Gold name/body/icon. |
| 7 | Options writeback and the returning eight-byte removal described above. |

The substantial totem branch reuses the existing hash-verified **current**
`ability-cast` Ghidra result linked by the
[Druid native manifest](evidence/0.119.0/druid-release/manifest.json). It counts
matching ability keys, enters eviction at forty existing rows, removes the first
equal key and performs the existing destroy/creation sequence. The live
`player_abilities/behavior/totems.rs::remove_for_kind_limit` and its
`behavior/dispatch.rs` caller already implement that operation under #13. The
ownerless Program observation therefore does not identify a missing totem cap.

An additional full-PE query for `145c00d20` reuses the existing Druid Program and
retains its current result. Its decompiler reports an unresolved niche-tag
dispatcher at `145c00dcf`; it cannot establish the complete enum domain. Local
card/token construction remains independently observable in the current byte
routes, and the live `native_overlay_payload.rs::for_choice`/`for_treasure`
already construct their spell/upgrade/item/gold payloads. No source discrepancy
is demonstrated by the body-ownership residual. Continuing merely to bind every
existing card behavior to the newest EXE would be proof-only revalidation, not
a new fixgap repair. Exact enum/dispatch semantics remain unclaimed.

Executable complement ranges and their stop records cannot overlap these
declared extents. Their AS-context incoming reference frontier belongs to the
separate Q41-A01/A02/F01/F02 investigation; no complement body is assigned an AS
owner by spatial proximity or by this Location selector. Generic section,
alignment and engine residuals are retained as context rather than becoming an
engine reconstruction checklist.

## Source consequence and remaining scope

This complete finite population identifies no new missing AS behavior. Existing
localized token substitution and spell-resource construction already have live
source consumers in `localization.rs`, `gameplay/coop_spell_text.rs` and
`gameplay/coop_overlay.rs`; this role investigation does not revalidate those
features or certify their native equivalence. No replacement behavior is added
on the strength of a Location or adjacent filename.

The broader #41 range/reference/alias/type/source populations remain separate.
This result neither resolves every ownerless native instruction nor licenses
generic engine reconstruction. Any additional gameplay repair needs its own
actual producer/state/consumer contract and demonstrated source discrepancy.
Compilation, client/game/network/server execution, actual formatting/display,
failure behavior and original/rebuilt parity remain unverified.

## Reproduction

With the installed target, retained current residual inventory, Capstone and
the three saved query journals/results available:

```sh
python3 -B scripts/classify-as-ownerless-sites.py --contract diagnostic-roles
```

The check verifies the target and residual binding, every selected Location and
instruction route, all five explicit-length tokens, both removal helpers, the
terminal helper shapes and the saved native-query commitments. It does not
compile or execute Rust, the application or a service. `--write` regenerates the
compact textual proof after deliberate analysis changes; it launches no native
query.

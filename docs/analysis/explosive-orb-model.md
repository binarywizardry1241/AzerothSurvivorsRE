# Explosive Orb world display and model route

Finding **#248**, lead **`RESOURCE1210:display16111:M2-texture-consumer`**, is
now joined to current **world actor field/publication inputs**, beyond its original
CreatureQuery-only lead. Target EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [world/interface proof](evidence/0.121.0/orb-world-resource.json) reuses the
affix recovery's canonical journaled constructor query; the original
[DBC/model receipt](evidence/0.121.0/resource-consumer-9612.json) remains the
canonical resource join rather than a duplicate extract.

## Native actor-to-display join

At `0x145be8d58`, ward creation clamps the supplied template index to **12**,
multiplies it by **32**, and selects table `0x146fc0b40`. Index12 therefore
selects `0x146fc0cc0`, the same descriptor independently recovered by the
[query proof](explosive-orb-query.md). Loads at `0x145be8d6f`,
`0x145be8d74` and `0x145be8db3` obtain entry **9612**, display **16111** and
scale bits **`0x3f666666` (0.9)**. Call `0x145be8dd5` passes these to existing
world-create interface `0x145c13ce0` with the constructed creature GUID and
position/health inputs.

The integrated affix source now requests template12 through the existing
`bosses/raid_wards.rs::WardState::spawn`. Its thirteen-entry table supplies the
exact Orb descriptor, and the clamp admits index12. The actual local publication
route is `actor_appearance`/`ward_actors` → `gameplay/visuals.rs::ActorView` →
`unit_snapshot` → `unit_visual`/`LocalUnitVisual`. The selected template display
reaches fields131/132, and its scale bits reach field4. `Ward::fields` retains
the same template field mapping, but it is not substituted for this live local
adapter in the source trace. No alternative actor or model path is introduced.

The bounded replay executes **12 cases / 312 original instruction steps**
through this create-interface boundary. It covers template11, template12,
out-of-range13 and u64::MAX, with zero, 24-bit-boundary and u32::MAX counters.
The selected descriptor, GUID counter truncation and entry/display/scale call
inputs match the exact original bytes.

## Receiving AS publication helper

The current receiving helper `0x145c13ce0..0x145c14044` is separately recovered
through a journaled Ghidra query and its **868 bytes / 212 independently decoded
instructions**. It supplies the entry unchanged to field3, scale bits unchanged
to field4, and the supplied display unchanged to fields131/132. Calls at
`0x145c13d9a`, `0x145c13ea7` and `0x145c13eb8` establish those exact field/value
inputs. There is no intervening AS display replacement in this helper.

The same field collection reaches the existing create-packet interface
`0x145b422d0`, with the actual GUID and object-kind3. This is the world-update
object category; it is separate from the CreatureQuery creature-type10 value.
The helper's original instructions also publish ceil health/max-health, the
level63 clamp and scale-dependent reach inputs. **Twelve publication cases /
2,112 original instruction steps** cover display0, display16111 and u32::MAX,
two run levels and two health inputs, demonstrating that display is passed
unchanged rather than replaced based on its value.

Typed field collection, ceilf and atan2f are explicit fixture seams. The replay
stops at the create-packet interface before generic serialization or engine
object delivery. This completes the selected AS producer-to-field connection;
it does not establish actual model loading or rendering.

The receiver also exposed a separate current creation-target defect. The
[ward target repair](ward-target-guid.md), finding **#253**, connects
the actual hero identity to fields16/17 in the live local snapshot. It retains
the same entry, scale and display publication described here.

## Resource boundary and remaining limitation

The configured `CreatureDisplayInfo` row **16111** identifies model **2247**;
its `CreatureModelData` row names
`Creature\SporeCreature\SporeCreature.mdx`, with display skin
`SporeCreature_DeathParticle`. The retained exact row and string hashes bind
that data. Both this authored name and normalized
`creature\sporecreature\sporecreature.m2` have zero exact name-hash hits across
all eleven registered MPQs.

The traced existing source route is `CreatureCatalog::model` → authored model
path → `models::m2_file_name`/`model_path` → `Chain::resolve/read_file` → the
ordinary M2 loader. The suffix conversion accepts this valid `.mdx` path and
normalizes it to `.m2`. Its error-cube branch handles a refused filename; it
does not establish a fallback for this valid but unavailable member. This
source route supplies no AS-specific alias before the shared loader boundary.

### Current native filename and URL boundary

The [native path proof](evidence/0.121.0/orb-model-path.json) now establishes
three current helpers independently of the source's historical WoW addresses:
`0x145edd7e0..0x145eddb9c` normalizes the filename,
`0x145edd720..0x145edd7da` supplies the refused-filename fallback, and
`0x1424763a0..0x1424766a0` constructs the selected-source URL. Three journaled
Ghidra queries bind their exact original bytes. **42 isolated cases / 10,935
original instruction steps** cover the actual Orb name, case variants,
`.mdx`/`.mdl`/`.m2`, invalid suffixes, empty names, last-dot behavior and the
259-byte input boundary.

For the authored Orb name these helpers produce
`creature\sporecreature\sporecreature.m2` and, when supplied source `mpq`,
`mpq://creature/sporecreature/sporecreature.m2`. The native helpers do not
rename that valid path. ErrorCube is selected when filename normalization
refuses the input; a refused `mpq-loose` input resets to ordinary `mpq` for
that fallback. These routines perform no archive existence check and supply
no missing-member fallback at this boundary. ASCII UTF-8 borrowing,
allocation/free, memcpy and the two checked Rust formatting descriptors are
explicit library seams; suffix selection, case folding, slash conversion and
fallback control flow execute original instructions.

The live source connection remains `CreatureCatalog::model` →
`new_creature_display` → `m2_url`/`m2_url_on` → ordinary `mpq://` reader.
The separate loose reader is not selected by that source path. The configured
Data directory contains only the eleven registered MPQs, without loose model
files. The check rereads their current hash/block tables, repeats all 22 exact
name-hash probes and verifies the selected DBC member bytes and patch priority.
It does not rehash unrelated archive payloads. This source trace and the
isolated native helpers do **not** establish the target's actual catalog/display
dispatch, a catalog replacement or
downstream missing-file handling. They narrow the unresolved boundary without
certifying the generic compiled loader or actual runtime asset absence.
The proof also preserves one supporting M2-loader navigation query:
`0x1424c1440..0x1424c63de` stops at unresolved asynchronous frame dispatch
`0x1424c14d1`, table `0x1465e7498`. It establishes no replacement or downstream
missing-file behavior. Its saved result is available for a specifically needed
consumer investigation; general engine recovery is not a completion condition.

```sh
python3 -B scripts/check-orb-model-path.py
```

The exact missing input is the selected model payload in the configured
archive chain, or current native proof of an applicable mount/model replacement
that supplies a different available model. The bounded source/data joins do
not prove such a replacement, actual runtime asset absence or a new rendering
bug. No available SporeCreature M2 exists on this route to inspect for texture
or emitter consumers. The [DUST2B investigation](resource-texture-consumers.md)
instead finds four other exact model consumers, without an Orb relationship.
No replacement asset, guessed model alias or renderer change is justified.

```sh
python3 -B scripts/check-orb-world-resource.py
```

This check verifies current original bytes and both shared journaled Ghidra
subject/query bindings, executes the bounded selector/create-input and receiving
AS field-publication cases, and retains the canonical DBC/model receipt.
It also checks and binds the integrated thirteen-template source table, clamp,
affix spawn and actual local field adapter. All **24 cases / 2,424 original
instruction steps** remain isolated native fixtures; source is statically
connected and unexecuted. Current source receipts are verified rather than
silently carried across source edits. The visual adapter receipt commits only
its actual display/scale fragments; #253's separate target-GUID changes are
not a prerequisite of this display proof. These source interfaces are not proof
of the selected EXE's generic compiled mount/alias/fallback revision.
Complete generic engine reconstruction remains outside scope. Compilation,
actual model loading/rendering, client/server/game operation and
original/rebuilt parity remain unverified.

**#248 remains blocked on the named model input or target-bound proof of an
applicable replacement.** The selected source already forwards the recovered
entry/display/scale and valid model name. The inspected inputs and native
helpers supply no supported replacement to implement. Resolving the suffix
helper question is a completed recovery result, not a model/resource repair.

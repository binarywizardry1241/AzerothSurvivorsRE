# Asset recovery — supplied EXE and local Data

Reviewed **2026-10-18**. The selected input is
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This task adds reproducible extraction source, local recovered assets and textual
path/provenance evidence. It does not establish menu rendering or behavior parity.
No game was launched and no installed game directory outside this checkout was read.

## Sources, paths and evidence

| Input or output | Owning source/evidence | Meaning |
| --- | --- | --- |
| EXE identity | [Target manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/target-refresh-0.97.2.json) | Exact version, size and immutable target hash |
| EXE embedded assets and path references | [EXE asset evidence](evidence/0.97.2/exe-assets.json), [extractor](../../scripts/recover-exe-assets.py) | Validated embedded payloads; original offsets, hashes, names and path-string boundaries |
| Native font registration and Data candidates | [Native loader evidence](evidence/0.97.2/asset-native.json), [reproducer](../../scripts/recover-asset-native.py) | Four current-target function slices analysed by REA/Ghidra, with EXE-to-slice provenance |
| MPQ assets and path matches | [MPQ evidence](evidence/0.97.2/mpq-assets.json), [Rust extraction source](../../crates/asset-recovery/src/main.rs) | Per-archive identity, listfile/read status and requested member resolution |
| Regenerable member path map | `runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/summary/mpq-paths.tsv` | Local bulk inventory; the compact archive summary above retains its hash and counts |
| Local extracted payloads | `runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/exe-assets/` and `runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/mpq/` | Ignored binary analysis outputs; not source-build inputs or Git deliverables |
| Complete local archive inventory | `runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/mpq-inventory.json` | Every discovered name/probe match, original archive, payload hash and extraction result |

The supplied Data snapshot contains `patch.MPQ`, `patch-2.MPQ` and
`patch-3.MPQ.update`. The last file is staged: it is inventoried independently,
and extraction preserves its own archive directory. It is never renamed, installed
or silently inserted into the active source patch chain. The Data snapshot predates
the 0.97.2 EXE refresh; archive presence alone does not prove current-target asset
compatibility. The original refresh report records that it copied only the EXE.

EXE path references and archive members are different evidence. A bounded
`mpq://interface/...` reference supplies a candidate member name; the archive hash
lookup verifies whether the available file exists. The report preserves the archive
that contains it and the extracted filesystem path. A literal pattern match can
end inside a concatenated Rust string, so it remains a candidate even when its
text resembles a filename. Dynamic paths assembled at runtime need further
consumer recovery; a negative literal/probe result does not establish absence.

The completed pass recovered **27,717 member copies / 1,345,973,861 bytes**,
with zero read, codec or extraction errors. Listfiles supplied 27,586 names from
`patch.MPQ`, 119 from `patch-2.MPQ`, and nine from the staged update. Their union
plus probes contains 27,722 normalized path keys, including seven unresolved
probes and the listfiles themselves. Copies occurring in different archives are
counted separately. Original listfile spelling is retained in the full inventory;
lookup keys are normalized case-insensitively and extracted paths preserve the
chosen name's spelling with filesystem separators.

Of **184 EXE-derived candidate paths**, 177 matched. The seven archive misses are
`fonts/azs_jp.ttf`, `fonts/azs_kr.ttf`, `fonts/azs_sc.ttf`,
`interface/minimap/minimaparrow.mdx`,
`interface/minimap/rotating-minimaparrow.mdx`,
`textures/splash/splash.blp` and `textures/splash/wake.blp`.
The first three have validated embedded EXE payloads and native loader evidence;
an archive miss is not an application missing-asset diagnosis. Native fallback
behavior for the four remaining probes is outside this pass.

The Rust tool reuses the repository's MPQ decoder, checks supplied names against
every archive, unions readable `(listfile)` names, and records all copies rather
than flattening patch contents. Its separate `source_chain_winner` field is the
**existing benilla-formats source rule**, not a claim that the 0.97.2 mounter has
been reconstructed. Delete markers, unreadable archives, missing names and codec
errors remain distinct. Unsupported encrypted/single-unit/implode/PTCH/other
codec variants are not represented as successfully recovered empty assets.

## Embedded font recovery and loader observations

The current EXE contains ten validated SFNT fonts: Friz Quadrata, Morpheus,
Skurri, three small Chinese/Japanese/Korean autonym subsets, three full CJK
subsets, and Fira Mono Medium. The extractor validates table bounds, names,
checksums and padding before writing a font. The evidence distinguishes structural
font extent from exact native named records and instruction copy lengths.

There are also **eight validated PNGs**: one embedded 256×256 image and seven
PE icon images (16, 24, 32, 48, 64, 128 and 256 pixels). Five other signature
hits fail validation and are rejected. PE resource recovery retains exact icon
payloads and group metadata and reconstructs an ICO container without recompressing
the images. This recovers bytes and resource identities; the separate embedded
image's UI role is not inferred from its appearance.

Current-target code/data observations:

- `0x1455084b0` walks three 40-byte records at `0x146a01590`. They name
  `Fonts\FRIZQT__.TTF`, `Fonts\MORPHEUS.TTF` and `Fonts\SKURRI.TTF`, with native
  copy lengths 70,856, 101,328 and 169,028 bytes. The first two have the transform
  flag set; the transform helper itself was not re-recovered in this task.
- `0x1401d8cb0` copies the Chinese, Japanese and Korean autonym payloads using
  lengths 2,368, 2,068 and 2,060 bytes. The Ghidra pseudocode warns of a truncated
  exit/control-flow decode; exact copy instructions and payload validation are
  retained, without claiming this slice proves complete initialization semantics.
- `0x1455049a0` selects `zh`, `ja` and `ko` records and contains the
  `azs_sc.ttf`, `azs_jp.ttf`, `azs_kr.ttf` fallback comparisons. Its embedded copy
  lengths are 1,225,412, 1,303,236 and 498,808 bytes, respectively.
- `0x1455c9310` consumes the eight-byte `WOW_DATA` string and the `WoW/Data` and
  `Data` candidate suffixes. External helper bodies are outside this bounded pass;
  full candidate precedence and every directory override are not newly claimed.

Each native record links the original EXE offset/address and exact function-slice
SHA-256 to its REA Evidence ID. Raw-slice decompilation lacks external data and
callee bodies; inferred ABI types and pseudocode are interpreted alongside the
retained instructions and independent PE/data checks. This is not a fully linked
EXE decompilation or runtime comparison.

Recovered fonts are optional runtime data. The existing application accepts
`--font-dir` / `AZS_FONT_DIR`; MPQ data uses `--data-dir` / `WOW_DATA`. Asset
extraction does not itself implement Japanese font selection, new language UI,
the native accent transform or complete current-target font/rendering parity.
The [0.92 font report](main-menu-fonts.md) remains historical and version-bound.

## Reproduce inside this checkout

```sh
# Validate the selected target and recover embedded assets plus archive candidates.
python3 scripts/recover-exe-assets.py

# Inventory and recover every currently discoverable readable MPQ member.
# Choose a fresh extraction directory on repeat runs; existing files are refused.
./scripts/cargo run --locked --offline -p asset-recovery -- \
  --data-dir AzerothSurvivors/Data \
  --paths runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/exe-paths.txt \
  --output runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/mpq-inventory.json \
  --extract runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/mpq

# Export the complete textual path map and independently verify extracted bytes.
python3 scripts/summarize-mpq-assets.py \
  --input runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/mpq-inventory.json \
  --paths-file runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/exe-paths.txt \
  --output-dir runtime/analysis/history/native-recovery/asset-recovery/3d2191ace2ff/summary \
  --target-manifest docs/analysis/target-refresh-0.97.2.json \
  --verify-extracted

# Regenerate slices and collect matching existing REA results without reanalysis.
python3 scripts/recover-asset-native.py

# Optional fresh native investigation, using the project-local REA launcher.
python3 scripts/recover-asset-native.py --run-rea \
  --runtime runtime/asset-native-recheck \
  --output runtime/asset-native-recheck/evidence.json
```

Omit `--extract` for a read-only archive inventory. Add
`--extract-requested-only` to extract only supplied candidates. The Rust tool
refuses escaping member names, unsafe Windows filenames, output aliases,
symlinks and overwriting extracted files. These restrictions protect local
recovery outputs; they do not modify the reference application.

All original/recovered asset binaries remain ignored. Only extraction source,
required lockfile changes and curated textual evidence/documentation are committed.
Bulk member listings stay under `runtime/`; retain the summary and provenance,
not the full regenerable inventory.
The source build does not require the reference EXE, extracted fonts or MPQs.
GitHub Actions remains disabled. Current delivery rules are in [AGENTS.md](../../AGENTS.md).

## Validation and remaining work

The target hash, embedded format bounds, exact native slices and supported MPQ
payload reads are checked by the recovery tools. Validation results and extraction
counts are retained in the linked evidence. Focused reference-free tests cover
font/PNG/resource validation and extraction path safety. The new Rust tool compiled
and completed the real recovery run. The independent export verifier reread
all 27,717 extracted files and matched every size and SHA-256. Four bounded
REA/Ghidra analyses completed;
all sessions were closed. The application was not rebuilt or launched for this
extraction task. Missing listfiles leave unknown member
names; static patterns do not recover arbitrary dynamic asset names. Further work
includes dependency-based model/texture/sound path discovery, unsupported archive
variants when present, current-target mount-order recovery and meaningful original
versus rebuilt menu comparisons. Asset recovery does not implement gameplay.

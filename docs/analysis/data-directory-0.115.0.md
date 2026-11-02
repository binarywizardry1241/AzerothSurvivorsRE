# AS Data-directory selection — 0.115.0

The exact target is SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This **#41 / Q41-R01** source repair connects the existing benilla directory
resolver to the AS menu/gameplay resource consumers. It does not reconstruct
the surrounding archive engine or establish runtime/asset parity.

The AS adapter previously returned `WOW_DATA` without checking whether it was a
directory, then searched cwd-relative `AzerothSurvivors/Data` and `Data`. That
missed a valid `Data` folder beside a binary launched from another working
directory, missed the target's `WoW/Data` fallback, and prevented fallback from
an invalid nonempty override.

`assets::data_directory()` delegates to the existing
`benilla_formats::wow_data()` resolver. The selected native release implements:

1. A present, nonempty `WOW_DATA` value is the first candidate.
2. The executable's parent contributes `Data`, then `WoW/Data`.
3. The first candidate that is a directory wins; otherwise there is no install.
4. A present empty override suppresses every fallback. Failure to obtain an
   executable parent adds no executable-relative candidates.

A regular file supplied as the override is rejected as a directory and falls
through. An existing empty directory is selected: a later archive-open failure
does not retry another candidate. The resolver uses native OS strings and
`PathBuf`, so this adapter adds no Unicode conversion or working-directory
search of its own.

`--data-dir` continues to set `WOW_DATA` before the adapter runs. The selected
directory is passed to the existing `register_mpq_source` before Bevy's default
plugins, and the same adapter feeds the menu, font, progression, world and other
AS MPQ consumers. The reused engine's developer source-tree candidate is
disabled in the AS application's local feature graph; no alternate resolver is
introduced.

The development `scripts/run-menu` wrapper supplies the configured reference
directory only when `WOW_DATA` is absent. It preserves a present empty value,
so the native resolver's explicit no-fallback setting reaches the application.
The wrapper's shell syntax was checked without invoking Cargo or the game.

## Current native/source proof

The [compact proof](evidence/0.115.0/data-directory/manifest.json) binds four
successful durable REA/Ghidra queries to their exact current raw ranges:

| Native range | Recovered boundary |
| --- | --- |
| `[0x145b81690,0x145b8198f)` | Candidate vector, override empty/present handling, executable-parent joins and their order. Current literals are `WOW_DATA` at `0x1473aef20`, `Data` at `0x1473aef30` and `WoW/Data` at `0x1473aef28`. |
| `[0x145b81cc0,0x145b81e23)` | Calls the candidate builder and returns the first directory, otherwise the absent sentinel. |
| `[0x145bd0f80,0x145bd1e01)` | Existing native Chain/open boundary; single-file/directory arms, base-name table and patch/speech2 selection remain engine context. |
| `[0x145814f10,0x145815894)` | Current cached named-member consumer calls the directory selector at `0x145815185`, then Chain/open at `0x1458151ad`. No directory returns the exact `no game data` error; open/read errors propagate. |

The ten native base archive pointer/length records at `0x1473b1e00` match the
existing engine's `VANILLA_BASE_ORDER`. Source reuses `Chain`, `MpqAssetReader`
and its named-file reader. This repair changes only which directory the AS
adapter supplies. Whole-file inventory and archive context remain in the
[native census report](native-census-0.115.0.md).

Run `python3 -B scripts/check-data-directory.py`. The check rehashes the
installed EXE, verifies all four native ranges, durable query result digests,
literal bytes and direct call encodings, traces the CLI/AS/engine consumers,
and computes a conservative all-platform local dependency feature closure.
`--stage` writes a proposed compact proof under ignored runtime. No Cargo or
application process is invoked.

To recreate missing native query inputs, run the check with `--prepare`. It
writes/verifies the four exact raw ranges and prints their durable
`./scripts/rea query` commands. Run those commands serially; saved results resume
through the journaled runner. Then regenerate/review the proposed compact proof.

The source check does not execute native OS/path/allocator calls, complete cache
lifetimes, archive loaders, Rust, rendering or original/rebuilt comparisons.
Compilation, actual loading/platform behavior and parity remain unverified;
broader Q41-R01 native mount/locale/dynamic-resource contracts remain open.

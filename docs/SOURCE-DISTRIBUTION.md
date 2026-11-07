# Source distribution

This repository contains what is needed to build, test and understand
the reconstructed app: application and benilla engine source, required textual
assets/event tables, the Rust Lua interpreter/adapter, patched Kira/audio
compatibility source and licenses, Cargo manifests/locks,
build helpers, test fixtures, useful documentation and selected hash-bound native
evidence. Recovery tools are optional and are not invoked by source builds.

The selected target is [0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.105.0.md). Earlier evidence keeps
its version until revalidated; some current tests depend on historical fixtures.
[Current state](CURRENT-STATE.md) owns source/recovery gaps;
[verification-needed](verification-needed.md) owns execution/comparison work and
retained completed finding evidence.
An included engine, passing build or extracted catalog does not establish native
parity or a working Windows app.

## Runtime data

Users supply their own compatible MPQ Data patch chain using `--data-dir` or
`WOW_DATA`. Optional native fonts use `--font-dir` or `AZS_FONT_DIR`. No original
EXE or MPQ is needed to compile. Font/image/model/audio binaries and archive
members are not distributed with the source.

## Portable paths and published metadata

Published paths are relative to the repository root. `installed-game/` identifies
read-only reference inputs resolved through the ignored
`.codex/reference-game.json`; it is not a bundled directory. Copy the
[reference configuration example](../.codex/reference-game.example.json) and set
the actual installed EXE/Data paths locally. Optional tool registration follows
[the same local configuration rule](REA.md#requirements-and-scope).

`scripts/portable_paths.py` normalizes evidence-export paths before serialization
and removes the checkout prefix from objdump headers before output hashing.
Disassembly headers and metadata use that representation; artifact hashes bind
the published bytes. Native target/range hashes,
original execution-source hashes and raw full-record commitments keep their
original meaning. Path normalization does not repeat native recovery or establish
new source, runtime or parity verification. Raw local journals and analysis
databases retain the locations needed to resume their work and are not published.

Run `python3 -B scripts/check-project-portability.py` before source delivery.
Repeated `--forbid <token>` options reject specified strings in file contents and
paths. The check covers tracked and unignored files, including binary contents;
it excludes Git history and ignored local data. Preserve dependency licenses and
authorship.
Historical recipe inspection has separate
[source-history requirements](SCRIPTS.md#historical-execution-sources).

## Local outputs

Project account configuration is stored in ignored
`runtime/github-account/project.json`; CLI authentication uses the adjacent
`auth/` directory. `scripts/project-github.py` selects credentials for that
account explicitly, verifies its authenticated identity, and supplies the Git
credential and hook checks. Commit authors and committers use the account's
verified GitHub noreply address. Only `origin/main` is a delivery destination;
historical recovery refs and ignored inputs remain local.

Run `python3 -B scripts/project-github.py configure` to install or update the
hooks in the checkout that owns `main`. Prepare changes in any authorized
worktree, then stage them in the configured checkout and use
`python3 -B scripts/project-github.py commit -m 'prefix: summary'` there.
The pre-commit hook checks that local `main` matches GitHub. The post-commit
hook pushes the new commit and checks the live branch tip. The wrapper also
returns an error if delivery cannot be verified, since Git itself returns
success once it has written the commit. After a failed push, resolve the error
and run `python3 -B scripts/project-github.py deliver` to retry the same commit.

Original/rebuilt executables, DLLs, PDBs, MPQs, installed toolchains/dependencies,
caches, saves, captures, analysis databases, full tool/error logs, bulk generated
inventories and machine-specific registration stay local in ignored directories.
Use `runtime/` for investigation output and review only necessary behavioral
extracts before promoting them into `docs/analysis/evidence`.

Keep suitable game build caches and cached executables that speed rebuilding or
relaunches. Keep persistent Ghidra projects that the workflow actually reopens or
resumes to avoid repeat analysis. This does not justify keeping runtime databases
for every old target, tool or seed profile. Remove disposable data that tools
recreate without reuse, obsolete or duplicate outputs, captures, raw sessions and temporary test files
once active users finish, after retaining necessary compact evidence. Remove
temporary Git worktrees once their durable changes are integrated and all active
users have finished. Keep all repository documentation. Ignored status does not
justify indefinite retention. Follow the
[workspace rules](../AGENTS.md#workspace-boundary) and
[storage and completion cleanup policy](../AGENTS.md#storage-and-completion-cleanup).

A fresh checkout uses the tracked source, manifests, lockfiles and patched
dependencies; Cargo downloads locked dependencies when its cache is absent.
Keep required assets, durable test fixtures, recovery scripts, documentation and
curated evidence in Git. Preserve unique historical payloads needed to verify
recovered behavior when the matching EXE is unavailable. Installed tools and
hash-bound reference targets remain local recovery inputs; they are excluded
from the source distribution.

Keep one canonical native extract and reference it from related reports/manifests.
Retain its target hash, byte range and analysis limitations. Documentation should
explain the app and recovered behavior; session diaries and routine activity
records belong outside tracked deliverables. See [AGENTS.md](../AGENTS.md).

GitHub Actions and binary artifact publication are disabled. Source publication
follows the repository's contributor rules.

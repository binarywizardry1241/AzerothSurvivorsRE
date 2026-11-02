# Reconstruction target: 0.100.1

**Historical target, superseded on 2026-10-20 by [0.105.0](target-0.105.0.md).**
The 0.100.1, 0.97.2, 0.92.0 and 0.91.4 game EXEs and the former MPQ set were
removed during that refresh. Statements below about selected/preserved inputs
and implementation scope describe the earlier target period. Textual evidence
and fixtures keep their original hashes; extraction requires the matching former
EXE. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current status.

The October 18 installed update identifies as **0.100.1**, so that exact version is the selected target and package
version. The supplied release notes end at **0.100.0**; no 0.100.1 notes were
supplied or invented. The [identity/copy record](target-refresh-0.100.1.json)
owns the byte locations, marker contexts, hashes and verification limits.

## Verified reference

- Source: `installed-game/AzerothSurvivors.exe`.
- Local copy: `AzerothSurvivors/AzerothSurvivors-0.100.1.exe`.
- Size: **133,565,952 bytes**, PE32+ AMD64, image base `0x140000000`.
- SHA-256: `17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
- Three exact ASCII `0.100.1` markers occur in picker/version-label and updater
  contexts; exact ASCII `0.100.0`, `0.99.0`, `0.98.0` and `0.97.2` are absent.
- [REA PE resource evidence](evidence/0.100.1/pe-resources.json):
  `ev_646cc69691038e85806fe04b798f842f6cf2928033277276f756360dce7c7363`.

The source stayed stable during reading/copying, and source/copy SHA-256 values
match. The installed folder was not modified. The preserved 0.97.2, 0.92.0 and
0.91.4 references retain their original hashes. In particular,
`AzerothSurvivors/AzerothSurvivors.exe` remains the **historical 0.92.0 input**;
new recovery must explicitly select the versioned 0.100.1 path above. Existing
scripts with fixed old hashes and RVAs must keep selecting their original inputs
until deliberately revalidated. Only the EXE was refreshed; no installed saves,
MPQs, DLLs or fonts were read or copied.

## Current implementation boundary

Local recovery and implementation resumed on 2026-10-19. The selected EXE hash
was rechecked before analysis. Current reports own the revalidated behavior:
[target/menu](target-menu-0.100.1.md), [treasure](treasure-pipeline-0.100.1.md),
[effects/progression](run-effects-progression-0.100.1.md),
[upgrade flow](upgrade-flow-0.100.1.md), [floors](floor-recovery-0.100.1.md)
and [client presentation](run-presentation-0.100.1.md). They distinguish native
instruction results, source implementation, passing regression cases and
unverified original/rebuilt parity. Unchecked source/catalogs keep their older
provenance; the package version does not promote them.

The original target-refresh task changed metadata only. The later consolidation
ran REA/Ghidra, local builds, tests and a real-MPQ cache probe for all twelve
zones. An isolated original menu/run was observed; the Mac subsequently locked
and prevented the rebuilt interactive comparison. Windows validation and full
native parity remain incomplete. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the
latest results and remaining work. Current delivery is local only, without
pushes or PRs.

## Release notes and recovery scope

The [original-game changelog](../CHANGELOG.md) now contains **150** distinct
supplied release sections, 0.19.0–0.100.0. All preceding release bodies and the
historical JSON archive are preserved. These notes guide recovery; they do not
prove implementation or behavior in the selected binary.

| Release | Topics requiring owning selected-target evidence |
| --- | --- |
| 0.98.0 | Stored level-ups and their option/default/drain behavior; three talent specs and migration; stored-level addon APIs/HUD control; Armory right-click/transmog interactions; late-run zone health scaling; Warsong boundary and building/indoor floor recovery; passive burst attribution/animation; Onyxia Tooth Pendant proc limit. |
| 0.99.0 | Czech catalogs/fonts; hourly progress backups, five-copy retention and desktop import/browser restore; spent-immunity debuff timers. |
| 0.100.0 | Chastise once-per-cast Smite critical Holy Nova without the old cooldown; Naxxramas boss sizes/melee reach; shallow indoor floor sinking and repeated-spot relocation. |
| 0.100.1 | Exact installed identity verified; no release notes supplied. Current implementation/evidence is linked above, without an invented version-specific release list. |

Existing 0.97.2 and older layouts, formulas, save schemas, UI/catalogs and native
addresses need target-specific revalidation before reuse as the new specification.
Browser claims require a matching browser artifact/runtime. Code progress against
0.100.1 remains unmeasured; existing 0.97.2 audits are historical evidence.

## Historical checks

The original identity-refresh verification covered byte-identical copying, source
stability, static PE/version identity, JSON/TOML consistency, changelog preservation,
local documentation links and Git diff hygiene. That metadata-only pass included
no compilation or application tests. Later validation belongs to the current
reports and verification-needed above.
The repository was checked private and Actions disabled. The EXE stays local and
ignored; GitHub receives source metadata and curated text only. Building source
does not require the reference EXE; users supply compatible MPQs with `--data-dir`
or `WOW_DATA` as documented in the [README](../../README.md).

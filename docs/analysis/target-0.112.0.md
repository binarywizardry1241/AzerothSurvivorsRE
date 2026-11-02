# Reconstruction target: 0.112.0

The installed AMD64 EXE is 140,514,816 bytes, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [identity manifest](target-refresh-0.112.0.json) records its matching embedded
version markers and complete nine-MPQ chain. All nine archive names, sizes and
hashes match the registered 0.110.0 inputs. This verifies asset identity, not
content compatibility or rendered behavior. Inputs are read in place; no EXE or
MPQ copy/symlink is created and no installed file is modified.

## Whole-file discovery

The [complete PE inventory](evidence/0.112.0/refresh-baseline/native-summary.json) covers the entire
140,514,816-byte file: 347,158 declared unwind extents, 631,683 relocation sites,
420 imports and 725 diagnostic paths (53 custom, 672 engine/other). All executable
bytes are separately accounted by the [declared instruction scan](evidence/0.112.0/refresh-baseline/instruction-summary.json)
and [complement partition](evidence/0.112.0/refresh-baseline/unwind-complement-summary.json).
The [diagnostic pass](evidence/0.112.0/refresh-baseline/diagnostic-ownership.json) verifies 17,675 references
across 5,945 candidate extents, including leads for all 53 custom paths.
The [native census](native-census-0.112.0.md) owns Ghidra body/reference observations
and their independent instruction verification. No byte or function count is a
measure of recovered semantics or implementation parity.

The [complete category comparison](evidence/0.112.0/discovery-leads.json) retains
script/UI, configuration, module/type, ID and resource leads versus the actual
0.110.0 inventory. Diagnostic membership is unchanged. Packed module literals
change and a HUD `TimerText` lead appears; resource-pattern matches also change.
Concatenated literals and counts neither identify whole functions nor establish
removed resources or unchanged script behavior.

The [custom diagnostic partition](evidence/0.112.0/native-custom-coverage.json)
retains source correspondences for all 53 paths. The fresh EXE audit decodes all
681 lead sites; 626 have actual body owners and 55 remain unowned under #41.
The [complete audit/action table](execheck-0.112.0.md) separates these native
proof limits from source gaps, including eleven missing automatic feat predicates
under #19. Correspondence is separate from recovered native behavior.

## Release data and source boundaries

The [reproducible data review](evidence/0.112.0/release-data-leads.json) independently
locates all fourteen locale descriptors/payloads, both changed warrior talents
and Demonic Empowerment without historical addresses. Run
`python3 -B scripts/review-target.py` to check it; `--write` refreshes only
the proof. Exact ranges/hashes and selected raw records are retained once there.

| Lead | Current data observation | Remaining native/source recovery |
| --- | --- | --- |
| Warrior Trauma | Arms record keeps key `imp_heroic`; name, icon and description change to Trauma. Five ranks; the payload starts with byte 36, float 0.03 at +4 and word 21 at +8. | Current shared definition overlay, rank/save consumers and actual victim-periodic damage lane are connected. [#47 repair](warrior-talents-0.112.0.md) owns bounded proof; compilation, gameplay/presentation and parity remain open. |
| Warrior Bloodlust | Fury record keeps key `unbridled_wrath`; name, icon and buff-power description change. Five ranks; the payload starts with byte 36, float 0.06 at +4 and word 23 at +8. | Current shared definition overlay and additive buff-power consumers/exclusions are connected; shield calculation order is corrected. [#47 repair](warrior-talents-0.112.0.md) owns bounded proof; compilation, all-class interaction/rendering and parity remain open. |
| Talent layout | The independently found Arms/Fury descriptors select 160-byte records for these two rows; their fields and exact raw bytes are in the proof. | Historical 120-byte talent layout and older discriminant meanings cannot be reused as current contracts. No complete current talent catalog or effect enum is certified (#12/#34/#41). |
| Demonic Empowerment | The independently found 120-byte ability record has duration 8, cooldown 16 and upgrade bytes `[1, 4]`. Its raw status carries float 0.4; current text describes demon damage only. | Current descriptor, damage-only aura, ordinary duration/cooldown offers, once-only buff potency and uncapped Medallion scaling are source-connected. [Empowerment](demonic-empowerment-0.112.0.md) owns bounded native checks; shared demon contracts have separate #24 reports. The [current picker expression](demon-picker-tooltips-0.112.0.md) displays cooldown22.4 after native scaling; gameplay/rendering and parity remain open. |
| Locales and equipment/UI leads | All fourteen catalogs contain 2,842 keys. All fourteen source catalogs now exactly match the current 2,842-key payloads; the [locale proof](locale-catalogs-0.112.0.md) owns their descriptor/value validation. English adds `jewel.star_of_mystaria`, Trauma/Bloodlust, appearances/cosmetics and combat-log labels; Soul Fire becomes Soulfire. | Catalog equality is separate from native consumers. Labels do not establish equipment slot/migration/scaling, grants, UI, option persistence or log-file operations (#17/#26/#34/#41). |

The selected structures are data observations; their raw enum/stat words require
consumer-specific recovery. Stable talent keys alone do not prove migration or
effects. Current allocation, Warrior, Empowerment and locale repairs have separate
owning proofs; other talent/effect catalogs retain their actual target provenance.

The supplied [0.111.0 and 0.112.0 notes](../CHANGELOG.md) are individually owned in
the [claim review](changelog-coverage-0.112.0.md). Current Empowerment, demon
[damage](demon-damage-0.112.0.md)/[attribution](soul-reaping-0.112.0.md),
[movement](demon-movement-0.112.0.md), [build countdowns](build-countdowns-0.112.0.md),
Warrior effects and locale catalogs have separate current native/source checks.
[Star of Mystaria](jewelry-0.112.0.md) is source-connected, with native values that
differ from the supplied note. Holy Shield achievement attribution/grant and
actual gameplay/input/rendering/parity remain independently open. Superseded
0.110.0 Medallion/rank values retain their historical claim provenance.

[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own implemented behavior and permanent gaps.
Older reports/extracts retain their actual hashes. No compilation, compiling test,
game launch, gameplay, persistence/input/rendering or original/rebuilt comparison
was run. The package version identifies the selected target, not functional parity.

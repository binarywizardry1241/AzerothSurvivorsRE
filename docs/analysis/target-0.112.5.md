# Installed target review — 0.112.5

Selected SHA-256: `445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`.
The 140,664,832-byte AMD64 PE identifies itself as 0.112.5 in matching embedded
updater/dialog markers. [Identity/resources](target-refresh-0.112.5.json),
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), [native census](native-census-0.112.5.md).

The installed EXE and Data archives are read directly through the ignored local
reference configuration. Nothing copies or modifies those inputs. All nine MPQ
names, sizes and complete SHA-256 hashes match registered 0.112.0. This does not
establish content, world-loading or rendered compatibility.

The complete [PE scan](coverage/native-summary.json) covers all 140,664,832 file
bytes, six sections, 421 imports, 347,520 unwind records and 631,703 nonpadding
relocations. It finds 725 diagnostic paths: 54 custom and 671 engine/other paths.
The new custom diagnostic is `crates/wenilla-rogue-app/src/legacy_config.rs`;
previous custom membership remains present. The engine diagnostic
`crates/benilla-app/src/ui_aura/units.rs` disappears from the byte-pattern
inventory; path absence does not prove removal of its behavior.
All 54 custom paths have [decoded reference leads](coverage/diagnostic-ownership.json).
These identify candidate owners rather than complete native/source contracts.

The full embedded-candidate inventory was compared with the retained 0.112.0
inventory. Binding, Lua-registration/function, textual-ID and save-key literal
sets match. Module/type packing changes and resource-pattern changes retain
candidate status; concatenated string boundaries are not resource removal proof.
In particular, equal API identifiers do not establish equal native semantics.
The separate instruction/complement and Ghidra evidence is described in the
[native report](native-census-0.112.5.md).

The supplied [release notes](../CHANGELOG.md) add 0.112.2 gaze suppression and
0.112.5 Windows configuration relocation/merge. Repeated 0.111.0 and 0.112.0 text
was already present. [Claim ownership](changelog-coverage-0.112.5.md) distinguishes
current findings from historical recovery and unresolved compound claims.
[Current gaze recovery](raid-release-0.112.5.md) revalidates all 493 action nodes,
sixty headers and thirty-seven guardian signatures. Both gaze records remain;
262 isolated queue cases establish native12/native26 suppression (#42). The new settings migration owner and missing source merge are
tracked under #62, with persistence/shared-engine ownership under #17/#41. The
[compact migration review](evidence/0.112.5/legacy-config-review.json) binds the
6,604-byte owner, bounded raw-range REA decompilation and literal leads; unstable
types and unmapped external dependencies leave roots/merge/error behavior open.

All 0.112.0 source and bounded recovery evidence retains its actual target.
Earlier RVAs, layouts, IDs and producer/consumer dependencies are unverified for
this hash unless explicitly revalidated in the linked current reports. No build,
compiling test, game launch, Windows file operation or controlled original/rebuilt
comparison was performed by this refresh. #41 remains open.

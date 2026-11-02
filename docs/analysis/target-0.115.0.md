# Installed target review — 0.115.0

Selected SHA-256: `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The 142,111,232-byte AMD64 PE is identified by the matching updater literal and
mapped, self-referencing version/Windows pointer-length descriptors. The former
version-before-dialog layout no longer exists. [Identity/resources](target-refresh-0.115.0.json),
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), [native census](native-census-0.115.0.md).

The installed EXE/Data are read-only inputs; no EXE/MPQ copy or symlink was made.
All nine MPQ names, sizes and hashes match 0.113.2. Unchanged archive bytes do not
establish current native mount/path semantics, loading or visual compatibility.
No intermediate 0.113.3/0.114.x EXEs were supplied or analyzed.

The full-file scan covers six sections, 425 imports, 350,712 declared unwind
extents and 634,018 nonpadding relocations. It finds 731 diagnostic paths:
60 custom and 671 engine/other. All previous custom paths remain; the additional
`crates/wenilla-rogue/src/banners.rs` has one instruction-verified Location
reference at preferred VA `0x14585ac7b`, in candidate extent
`[0x14585aba0,0x14585b57a)`, source line 156, column 25.
The [bounded Ghidra extract](evidence/0.115.0/banners-owner.json) observes quoted
UTF-8/escape parsing and a string-boundary failure. Current
[banner recovery](banner-suppression-2026-10-23.md) separately adds the
record/parser/helper caller, scoped-localization caller and update-reader
contracts, five producer traces and 74 native cases. The diagnostic reference
alone establishes none of those contracts; each retains its owning evidence.
Sustained duplication's actual cause, shared callback/type closure and rendered
parity remain open under #58/#11/#41. The exact extract is retained once.

The [discovery delta](evidence/0.115.0/discovery-delta.json) compares every
embedded-candidate category and imported library/function set with the preserved
0.113.2 inventory. The import set is unchanged; addresses are newly observed.
New binding leads include `AZS_GetTimers`, `AZS_TIMERS`, `AZS_TIMERS_UPDATED` and
`AZS_UnitPopup_HideButtons`; Lua also adds `UnitPopup_HideButtons`. The lexical
`AZS_OPENLEVELS` match disappears because literals are packed differently; this
is not evidence that its binding was removed. Namespaces, resource paths,
script/UI/ID/configuration leads retain exact additions/removals in the delta.
No equal literal or absent pattern establishes unchanged or removed behavior.

The current 16,665-byte [embedded Lua](evidence/0.115.0/embedded-api.lua) occupies
file offsets `[0x70063f0,0x700a509)`, SHA-256
`a0066d2d6356e9f21fe4544e600def13887047a6608bb588cd6c27859b78ccc5`.
The boundary ends at the final API event-handler registration; adjacent packed
substitution/binding constants are excluded. This replaces neither source nor
historical extracts. `AZSTIMERS` parses name/icon/kind/ready/wait and
`AZS_GetTimers(name)` filters names and clamps ready-minus-run-time at zero.
The revive HUD comment changes, but `HUD_CVARS_LUA` remains a native substitution.
Current [timer/API source recovery](addon-timers-0.115.0.md) connects the native
equipped producer, metadata/name construction, raw recovery/haste inputs,
serialization and bounded twenty-stream cache/reset/poll contracts. The
[revive CVar map](revive-addon-0.115.0.md) has separate native proof. Actual
client/addon/lifecycle execution and original/rebuilt parity remain unverified;
broader native ownership remains #41.

The [claim ledger](changelog-coverage-0.115.0.md) includes 796 claims across
176 supplied releases. All 28 new claims received target-bound ownership
assessments; the current ledger separately records bounded local source/static
reviews. Solo-relevant raid-target icons (#71), dead-boss ground-attack cleanup
(#42), and talent timers (#11) retain their owning reports and runtime limits. New lobby
public-default/filter presentation is a separately selectable UI scope.
[Co-op source reconstruction](coop-0.115.0.md) now supplies partial counterparts
for all four backend modules, bringing known AS module mapping to 60/60. Direct
hero/world bootstrap, initial synchronization, all nineteen envelopes, shared
per-hero simulation and private/shared replication now connect source under #63.
Public WebSocket discovery, complete host/code forms and per-recipient item
text/localization remain source/recovery work. Individual compound party claims
remain pending their exact clause-level dependency and runtime/parity proof;
module mapping does not certify those claims. Server performance
and deployment claims retain no measurements. The 0.114.1 cadence must not be silently imposed after 0.114.2's
changed guest-update claim.

The system ledger preserves sixty earlier identities and adds
`custom-game-banners`: 61 systems including the shared-engine context record.
Existing source references are retained as candidates with explicit historical
assessments. The four cooperative backend systems now have selected current-native partial source contracts; whole-system closure remains open.
No historical RVA, layout, ID, data contract, bounded test or source equivalence
is promoted to this target. Full-image/native-pass limits and every residual
population are owned by the [current census](native-census-0.115.0.md) and
[unknown recovery queue](unknown-recovery-0.115.0.md), with #41 open.

No application compilation, compiling tests, game/network session, save/config
operation, controlled original/rebuilt comparison or gameplay/UI parity ran.
The Python checks establish identity/accounting and reproducibility only.

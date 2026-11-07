# Permanent race ownership and account selection

Installed read-only reference: **0.120.0**, 145,447,424 bytes, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This report owns the Save/picker connection for summary finding **#187** and
its purchase/persistence dependencies **#188/#189**. Overall implementation
status belongs to [verification-needed](../verification-needed.md); the detailed Rewards
transaction remains in the [release contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.120.0.md).

## Current contracts and connected source

The [canonical account evidence](evidence/0.120.0/race-account/manifest.json)
binds fourteen exact native ranges, 1,260 independently decoded instructions
and eight durable Ghidra results. The ordered base-plus-purchases union
`145a97aa0..145a97c00` reuses its existing
[canonical extract](evidence/0.120.0/race-unlocks/allowed-races-union.asm).
The [picker proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.120.0/race-picker/manifest.json) separately follows
the account union into each portrait's allowed byte and race-action admission.
The detailed [release contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.120.0.md) owns purchase
admission and the separate tooltip interface.
The [entry evidence](evidence/0.120.0/race-entry/manifest.json) adds ten exact
ranges/285 instructions, two relative dispatch slots and three durable queries
for the actual frontend/backend and stock roster consumers.

| Boundary | Recovered behavior and source connection |
| --- | --- |
| Race record adapter `145c1e760`, byte iterator `145c48790`, collector `145c42ab0` | Every trimmed line with prefix `races\|` contributes comma-separated decimal u8 tokens. Optional `+` and leading zeros are accepted; empty, malformed, overflowing and non-1–8 values are discarded. Tokens themselves are not trimmed. Repeated rows concatenate; the loader sorts and deduplicates globally. `save/schema.rs::purchased_races` and `Save::purchased_races` retain that field. |
| Save serialization | The existing native serializer emits the sorted vector after tabards and before pets, omitting an empty vector. Typed normalization now emits that same family; ordinary envelope/export/import/backup consumers therefore retain it. Their actual filesystem behavior is not verified by this change. |
| Hero loading `145a90f94..145a90fba` | Exactly five fields, a valid native class and race 1–8. Loading no longer tests the old class-specific race slice. `schema::heroes` and the typed Hero setter accept that ordinary domain. |
| Pick normalization `145a98160..145a984e2` | Valid race IDs 1–8 survive independently of class or purchases; invalid IDs fall back to the first base race for the normalized class. `Pick::normalized` preserves this distinction. Appearance/name/zone/mod consumers retain their separate existing implementations. |
| Account union `145a97aa0` | Keep the base class slice in its native order, then append purchased races absent from the accumulated list. `Save::allowed_races` supplies the actual portrait and race selection consumers. The free `save::allowed_races` remains the base metadata interface. |
| Account fallback `145a8bf80..145a8c0ae` | Keep an eligible race. Otherwise choose the first allowed race in the same faction using Alliance mask `0x9a`, falling back to the first allowed race. `Save::class_race` owns this rule. |
| Account Pick clamp `145a8b4c0..145a8b6a3` | Apply that fallback and normalize appearance only if the race changes, then clamp the zone to the class's progress. `Save::clamp_hero` connects the race/appearance operation to existing menu/backend zone clamps. Typed parsing does not enforce purchase ownership prematurely. |
| Class switch `145a8c0f0..145a8c222` | Restore a saved class Hero when present; otherwise preserve sex, clear features and select through the account fallback. Always apply account eligibility afterward. `Save::select_class_hero` retains purchased combinations and also clamps a saved Hero whose race is unavailable on that account. |
| Frontend restore `1400851d0..1400853df` | Load the optional Pick or its default, apply domain normalization and account clamping, then replace the exact name `Hero` through the random-name helper. `MenuState::restore_pick` applies account ownership before installing its selection. |
| Backend command 11 `145b1bd86..145b1bddb` | Normalize its Pick through `145a98160`, then apply `145a8b4c0` using the backend Save, before replacing/appending its class Hero and storing the live Pick. `drain_backend_commands` preserves that order and the existing class-zone clamp. |
| Stock packet `0x3d` → `145b1396e` | Resolve the explicitly supplied GUID against the 56-byte roster rows, copy the row's Hero unchanged, then commit the GUID at Server `+17c8`. The selected valid-pair branch has no base-class or account-purchase restriction. `select_roster_character` accepts valid class/race IDs and retains that identity rather than replacing purchased combinations. |

For example, `races|8,1,8` followed by
`races|+2,0003,256,-1,x,0,9` yields `[1,2,3,8]`. An additional pipe invalidates
only its comma token: `races|1,2|x` retains 1, while `races|1|x,2` retains 2.
Outer trimming removes a final trailing space before parsing; inner token
whitespace remains invalid.

The frontend Save and backend Save remain independent. Backend Pick commands
normalize the payload and use their own account eligibility before persisting
the Hero/Pick, so a frontend-only purchase cannot authorize a backend race.
Purchase spending, accepted command 17 and perk-reset behavior are owned by
the detailed #188/#189 repairs. Locked-race guidance retains its independent
#191 identity in the release contract.

## Static verification and limits

`python3 -B scripts/check-race-eligibility.py --queries` verifies the
canonical native bytes, boundaries, assembly and retained result commitments.
It executes **23,283 bounded original-instruction cases**: 2,331 ordered unions,
18,648 account fallbacks and 2,304 Pick race-byte decisions. All nine classes
and every subset of the eight races are covered, with additional unordered
and duplicate purchase vectors. Six source guards check the native base
metadata and live union/fallback/clamp/parser connections.

`python3 -B scripts/check-race-entry.py --queries` verifies its ten
original ranges, relative dispatch selectors and three query commitments. It
executes all **72 ordinary race/class pairs** through the selected original
roster search and identity-copy blocks, checking all eight Hero bytes and the
committed GUID. The decoded GUID, one typed roster row and a connection are
explicit fixture inputs; deallocation is a no-op. Execution stops before run
construction. Source guards check the actual restore, backend command and
stock identity consumers; they do not execute reconstructed Rust.

Allocation, copy, vector growth and disposal are explicit fixture seams.
Ownership vectors are supplied inputs rather than execution of the full Save
parser. The Pick replay stops before sex, appearance, name and zone handling.
Raw Ghidra extracts retain generic ABI/absent PE context limitations; original
caller/data bytes establish the bounded connections described here.

Three authored menu regressions cover all 72 purchased class/race choices
through queued backend commands, saved-Hero/loaded-Pick clamping, and backend
ownership isolation. They are **uncompiled and unrun**. Rustfmt stdin syntax
parsing and diff whitespace checks pass; neither performs a Rust type check.
Compilation, real save/backup IO, interactive UI, run/client/network behavior
and original/rebuilt gameplay or presentation parity remain unverified.

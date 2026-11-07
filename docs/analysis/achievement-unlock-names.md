# Achievement unlock appearance names

Selected installed EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This is finding **#172**'s source/static repair.
[verification-needed](../verification-needed.md) owns its remaining validation status.

## Native interface and identity

The [manifest](evidence/0.119.0/achievement-unlock-names/manifest.json) binds
nine independently located PE code ranges, their complete assembly, journaled
Ghidra results and observed direct caller edges. Historical 0.118.0 addresses
were discovery leads only; unique instruction prefixes, current unwind extents,
current bytes and current calls establish the selected ranges.

Iterator `145c3e7f0..145c3ecfe` selects unlock rows by incoming achievement key.
The tabard and cosmetic branches format the descriptor's u32 at `+0x30` with
the records at `1472c8640` (`tabard.`) and `1472c864a` (`cosmetic.`), then call
`145b29ab0` at `145c3eabc` and `145c3eba7`. At `145c3ebcb..145c3ebd6`, a null
returned pointer selects the descriptor's original name. A non-null result
retains its exact pointer/length, including empty strings and values equal to
the generated key. It does not try a second literal-name lookup.

The iterator emits three string pairs: localized prefix, selected name and icon.
Collector `145c2af10..145c2b15c` consumes those 48-byte rows. Wrapper
`145b445f0..145b447cf` supplies the actual reward registries and incoming
achievement key. Its caller `140264b70..140264fee` forwards that key from the
achievement descriptor and routes the collected rows into the card text path.
The card sends the unlock vector through closure context `+0x28` to
`1402d9570..1402db5a2` at `140264fad`. That body reads the vector pointer/count,
iterates 48-byte rows, formats the prefix/name pairs using the exact `": "`
record at `1461a8f98`, and submits the text bundle through `1402cf480`.
Summary/recent and category page builders lead into this shared card; current
Summary, RECENTLY EARNED and empty-state labels bind the surrounding UI.
The manifest retains **12 observed direct edges** and the exact data-flow
anchors without claiming complete main-menu dispatch or indirect closure.

The wrapper binds tabards at `1475dafd0..1475db510` (21 records) and cosmetics
at `1475dc560..1475dc8e0` (14 records), both with 64-byte stride. The manifest
stores one range hash and decoded descriptor values, without another copy of
their native bytes. Current name/icon/achievement/ID tuples exactly match the
source registries. Eight tabards are achievement rewards; thirteen are purchased
rows and do not become achievement unlocks. All fourteen cosmetics are rewards.
Every one of the **22 appearance unlock rows** has one exact registry join.

## Connected source repair

`progression.rs::Catalog::embedded` now binds each appearance unlock to a typed
tabard or cosmetic ID after assembling the existing reward registries. The join
uses the achievement key, descriptor name and icon together; a display name
alone does not supply identity. Historical JSON catalogs remain unchanged and
retain their original provenance. IDs come from the existing registries rather
than a second authored reward table.

`Unlock::label` uses `tabard.<id>` or `cosmetic.<id>` with direct descriptor
fallback. The other **35 companion/perk rows** retain their existing literal
lookup. Prefixes, icons, reward admission and grants are unchanged.
The shared `achievement_card` calls this helper, so filtered achievements,
recently earned achievements and in-progress achievements all use the repaired
name path. `ProgressionPlugin` supplies the assembled catalog to the actual
Achievements-page rebuild. The separate Rewards-grid tabard consumer is #171.

The fourteen locale catalogs supply the selected language map through the
existing localization adapter. #169 owns the current catalog import and broader
native loader/lookup recovery. The [descriptor data review](locale-catalogs.md)
is the authority for exact text; this repair does not certify whole-loader,
override-filesystem or language-index equivalence.

## Checks and limits

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs python3 -B scripts/check-achievement-unlock-names.py
```

The checker verifies the installed identity; **24,901 code bytes / 4,270
instructions**; all retained format and
registry bytes; complete instruction decoding and call sites; optional retained
Ghidra receipts; descriptor joins and the actual source slices. It compares
**308 locale/name cases** (22 appearances × 14 languages) with exact current
payloads and parses the changed Rust source without compiling it. The ordinary
appearance keys and eight cooperative keys share this check.

Two Rust regressions are authored for every typed row's missing/translated/empty/
key-equal results and for the remaining literal rows. They are **unrun**, because
executing them would compile the application. Static source assertions and data
comparisons do not execute the Rust lookup.

Raw Ghidra imports omit PE globals/callees and infer a GCC ABI. Independent
Windows-x64 instructions establish the selected argument/data flow; decompiler
parameter names are not authoritative. Broader achievements, registry
initialization outside these static descriptors, indirect UI closure,
compilation, actual rendered unlock text, linguistic/layout quality and
original/rebuilt parity remain unverified. No application, client, server,
network session, instruction emulation or save/configuration mutation occurred.

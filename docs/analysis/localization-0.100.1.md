# Locale and font recovery — 0.100.1

Historical locale/font recovery for 0.100.1. Current live text assets are owned
by [localization-0.107.0.md](localization-0.107.0.md); this report retains its
original font and native-code provenance.

Reviewed 2026-10-19 against the selected 0.100.1 EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

The current 56-byte locale descriptors contain fourteen languages, including
Czech, with 2,632 keys each. The exact bounded JSON, native order and hashes are
recorded in [locale evidence](evidence/0.100.1/locales.json). The source at that milestone embedded
these catalogs and translated explicit keys. The optional recovery script verifies
the entire reference hash before writing catalogs; builds do not invoke it.

Current font augmentation `1455181d0..14551ac38` has 41 composite records,
two mirrors and six aliases. Its new mode4 places an apostrophe to the right of
the stem with a 2%-em gap and aligns the two tops. The recovered body SHA-256 is
`116d2614f0174fe0c25db0436ba113e99df48ac2f2682b56eec1c273a66f3803`;
REA/Ghidra evidence is
`ev_415055edb9ac135f0eedbc1c5f7a922a4804816eeb0febee05e7739d341256fd`.
[Original-PE instructions](evidence/0.100.1/target-menu/font-augment.asm)
control interpretation of the generic-ABI raw-slice
[pseudocode](evidence/0.100.1/target-menu/font-augment.ghidra.c).

The menu and actual FrameXML renderer receive the augmented user-supplied font
bytes. The engine extension replaces only a matching path before the text engine
opens that face. No font binary is committed. Supply compatible fonts using
`--font-dir` or `AZS_FONT_DIR`; the existing MPQ fallback remains available.

The combined application compilation and locale regressions passed. All three
font component-position checks passed in
`runtime/consolidation-2026-10-19/remaining-regressions.log`. Original-menu
observations do not verify rebuilt multilingual wrapping, font fallback or
whole-screen typography. Interactive rebuilt comparison remains pending.

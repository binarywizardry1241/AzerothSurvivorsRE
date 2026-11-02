# Shared hero-name contract — 0.109.0

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The shared [native manifest](evidence/0.109.0/stock-lifecycle/manifest.json)
retains canonical current extracts and REA/Ghidra identities; it also owns their
linked startup/realmd dependencies. This report separates the naming repair
from the [connection lifetime repair](stock-lifecycle-0.109.0.md).

The selected [0.127.0 Unicode name contract](hero-names-0.127.0.md) supersedes
the live validator, case and input implementation. This report and its fixtures
retain their historical ASCII behavior and original target identity.

The optional name wrapper `1458a8cb0` uses shared validator `1458a8710`, Unicode
whitespace trim `140089200`, then ASCII word title-case `1458a8fa0`. The trimmed
name accepts 2 through 20 ASCII letters including at most one interior space.
Rejection order is empty, invalid character, consecutive spaces, more than two
words, one character, then over 20 characters. World Create uses this same
validator and result table `146bedd24`: `45/48/50/4f/46/47`, respectively.
This replaces the source's older 12-letter, single-word rule.

Current picker input `14007b130` calls admission helper `140067e90` for each
logical character and applies the same title-case helper after a changed batch.
Letters are admitted below 20 characters; a space requires a current length of
1 through 18 and no existing space. Thus the old 12-character keyboard filter
was also a live source mismatch, rather than a separate current restriction.
The existing [picker presentation check](../../scripts/check-picker-name.py)
independently confirms name-only text/caret updates retain the portrait.

## Connected source

`hero_name.rs` now implements those shared validation, word-case and picker
admission rules. `menu.rs` also forwards the explicit logical Space key, matching
native `14007b2a0 -> 14007b235`; a Character event containing a space uses the
same helper. Startup optional names, Pick normalization, custom picker
entry and ordinary Create consume that single contract. The random-name
fragment generator retains its separately recovered behavior.

The shared name implementation now also preserves the native Create rejection
codes and their precedence. The duplicate check includes the optional startup
name, matching the projected roster from `1458bb880` and Create's scan at
`1458b5ec1..1458b60ae`. Its subsequent limit at `1458b60e3` still counts only
the permanent roster. The transient row does not consume a permanent slot.

The updated `current_menu_save.rs` fixtures preserve exact error precedence and
transient-name collisions. They were authored, not compiled or executed.

`python3 -B scripts/check-stock-lifecycle.py --scope names` passes
**81 unchanged current-instruction cases**: 39 full validator/trim/word-case
normalizations, 30 picker admissions, and 12 projected-roster duplicate and
permanent-capacity cases. It checks native packet result tables and source
connections. `--scope all` additionally runs the 509 lifecycle/auth cases.
The existing `check-picker-name.py` independently passes 20 native
text/caret/portrait cases.

The actual native validator, Unicode trim, UTF-8 counter, word iterator and
ASCII title-case instructions execute in scratch emulator memory. Allocation,
copy/vector growth, byte-search/comparison and roster destruction are explicit
seams. No Rust, compiler, game, filesystem or rendering executes. Ghidra's
current full validator pseudocode fails with a varnode-hash error under both
default and Stack-disabled analysis; its original PE body and dependencies are
independently decoded and replayed. The manifest records that limit. Actual
keyboard interaction, Unicode input handling by the window system and native
versus rebuilt gameplay/presentation remain unverified.

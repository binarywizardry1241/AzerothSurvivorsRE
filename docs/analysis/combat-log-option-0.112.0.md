# Save Combat Log option — 0.112.0

Selected installed EXE SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This is the current combat-log option portion of #17. The
[manifest](evidence/0.112.0/combat-log-option/manifest.json) binds its descriptor,
current REA/Ghidra instruction extracts and trimming dependency to this target.

Current Options row 62 at `145dc4720` is the Combat-page `combatLogFile`
checkbox, after Pet Damage and before the Chat page. It uses ordinary CVar
storage, noninverted control 5 and default `0`. The source adds exactly this row;
other descriptors/defaults retain their existing provenance. Current locale
catalogs contain its label and tooltip in all fourteen languages.

Native consumer `140008df0` registers the CVar once, reads it on every update,
trims Unicode whitespace through `1400695f0` and enables logging only for exact
`1`. Numeric lookalikes such as `01` and `1.0` stay off. It forwards the result to
`14056c330`, which finds the active script host, compares its current combat-log
flag and applies a change only when needed. The target contains the guarded
`if LoggingCombat then LoggingCombat(1) end` and corresponding `nil` command.

The custom Options source delivers this policy through `LocalClientExtension`
to the real in-game VM, after the existing saved-variable load. It drives the
same `LoggingCombat` flag as `/combatlog`. The existing engine chat route composes
each line once, fires its ordinary addon event and tees combat lines to
`ChatLogFiles`; its existing writer appends the timestamp and line to
`benilla-config/Logs/WoWCombatLog.txt`. Turning the option off closes that existing
file route. It does not create a second formatter, append queue or config store.
The ordinary CVar registry and one-second config-save owner persist the option.

`python3 -B scripts/check-combat-log-option.py` verifies the native
descriptor and **28 native admission cases**, including missing values, first vs
later update, ASCII/Unicode whitespace, malformed numeric text and zero-width
space. Wrapper and trim instructions execute unchanged; registry operations,
allocation/disposal and the engine setter are explicit seams. The checker does
not execute Rust source, a script VM or any config/log-file operation. Extract
and target hashes remain independently checkable.

Compilation, actual schedules, slash-command/addon interaction, filesystem
errors/append/close behavior and original/rebuilt parity remain unverified.
The native EXE is a desktop target; browser-version absence is not established
by this desktop implementation. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the
combined gap status.

# Ordinary Login roster precedence

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/login-roster/manifest.json) binds the direct Login
provider and two freshly recovered collector helpers, referencing the existing
current roster factory, String clone and lookup extracts in place.

Login `1458b3103` calls roster factory `1458bb880`. Its ordinary path supplies
the optional startup row before the permanent Save slice to collector
`1459c9650`. That collector clones the optional row first, then appends permanent
rows through `1458e86e0`. The Login loop at `1458b3193` chooses the first matching
GUID and returns silently on absence. Duplicate GUIDs are valid imported rows;
an optional `ffffff` row therefore wins over a saved `ffffff` row for Login.

`MenuState::select_roster_character` and `selected_roster_guid` retain that
optional-first order while reading permanent rows from backend Save. Summary
bests have a separate **permanent-first** search and optional level-only fallback
in [account delivery](run-account.md). These two precedence rules must
not be combined. The backend ownership repair preserves both.

`python3 -B scripts/check-login-roster.py` passes **five native cases**:
optional/permanent GUID collision, missing optional row, later permanent match,
duplicate permanent GUIDs and an empty roster. Complete original ordinary
factory, collector and row/String clone instructions execute before the actual
Login loop. The cases verify the projected order and selected name. Packet
decoding is replaced with its decoded GUID partials; allocation, byte operations
and free use the existing declared scratch leaves. The replay stops at selection
or silent absence, before any world-entry behavior.

Fresh REA/Ghidra queries cover both collector helpers and close normally.
Generic raw-import ABI labels remain provisional; original Win64 instructions
govern fields and arguments. Authored Rust regressions distinguish Login's
optional-first behavior from permanent-first summary bests; they were not
compiled or run. No compiler, application, game, actual packet processing or
original/rebuilt comparison ran. Broader startup/worker ownership and runtime
parity keep their separate limits.

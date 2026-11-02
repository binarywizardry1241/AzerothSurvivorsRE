# Current picker footer identity

Recovered2026-10-19 from the selected0.100.1 EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The rebuilt menu capture exposed a stale historical footer, `v0.97.2 (43fe5ff8)`.
The target footer is **`v0.100.1 (903c892d)`**.

[Current proof](evidence/0.100.1/menu-identity/native.json) retains the complete
picker owner at`1400c1b30`, REA/Ghidra identity, original formatter arguments
at`1400c2f48..2fac`, version/build bytes and the compact format descriptor.
The version slice at`14593d538` points to seven bytes at`14593d530`; the
build slice at`14593d528` is eight bytes. Format bytes at`14593d548` encode
`v{version} ({build_revision})`. The source copies those two exact values,
including the original target's build revision rather than the reconstruction's
Git revision.

The dedicated [display identity asset](../../crates/azeroth-survivors-re/assets/menu-identity-0.100.1.json)
is applied by`MenuCatalog::embedded`. The historical`menu.json` version and
remaining definition provenance stay intact. This closes the visible identity
mismatch without promoting all historical menu data to current-target proof.
Builds consume only the tracked source asset, never the original EXE.

[Recovery script](../../scripts/recover-menu-identity.py) verifies the
whole EXE and retained raw picker slice/formatter data, and preserves the actual
Ghidra result. The application build passed after this change; the subsequent
menu capture and final regression status are recorded in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md). No original/rebuilt interactive comparison
is established by these string and source checks.

# Picker footer identity

## Target refresh and source connection

The picker used the 0.100.1 identity asset independently of the RE Cargo
package, so later package and target updates left the bottom-right label at
`v0.100.1 (903c892d)`. The historical identity and catalog below retain
their original provenance.

For the registered 0.141.0 EXE, the native formatter at
`0x140146ccb..0x140146d2f` supplies the nine-byte revision at
`0x146593218`, the version slice descriptor at `0x146593228`, and the
compact format at `0x146593238`. The version slice resolves to
`0x146593221`. Together they specify **`v0.141.0 (98eb6fdfc)`**. The
[source asset](../../crates/azeroth-survivors-re/assets/menu-identity/0.141.0.json)
binds the two recovered byte ranges to the installed EXE SHA-256.

The [footer](../../crates/azeroth-survivors-re/src/menu.rs) now formats Cargo's
package version and the original revision. Cargo's version also selects the
embedded asset, so a package bump requires the corresponding file at compile
time. The [target refresh workflow](../../.agents/skills/execheck/SKILL.md#discover-and-register)
generates it from the selected EXE. Coverage accounting reruns extraction
read-only and checks the Cargo version and asset, including the EXE digest
for same-version updates. Ahead-of-install changelog entries remain release
notes until the target changes. Building and launching use the checked-in
asset.

The [identity regression checks](../../scripts/test-installed-identity.py)
exercise different version and revision lengths and reject a mismatched
revision pointer/length. [Finding #321](../verification-needed.md#gap-321)
tracks compilation and rendered footer verification.

## Historical 0.100.1 recovery

Recovered2026-10-19 from the selected0.100.1 EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The rebuilt menu capture exposed a stale historical footer, `v0.97.2 (43fe5ff8)`.
The target footer is **`v0.100.1 (903c892d)`**.

[Current proof](evidence/menu-identity/native.json) retains the complete
picker owner at`1400c1b30`, REA/Ghidra identity, original formatter arguments
at`1400c2f48..2fac`, version/build bytes and the compact format descriptor.
The version slice at`14593d538` points to seven bytes at`14593d530`; the
build slice at`14593d528` is eight bytes. Format bytes at`14593d548` encode
`v{version} ({build_revision})`. The source copies those two exact values,
including the original target's build revision rather than the reconstruction's
Git revision.

The dedicated [display identity asset](../../crates/azeroth-survivors-re/assets/menu-identity-0.100.1.json)
was applied by `MenuCatalog::embedded`. The historical `menu.json` version and
remaining definition provenance were preserved.

The historical recovery verified the whole EXE and retained raw picker
slice and formatter data alongside the Ghidra result. The application build
passed after that change. The subsequent
menu capture and final regression status are recorded in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md). No original/rebuilt interactive comparison
is established by these string and source checks.

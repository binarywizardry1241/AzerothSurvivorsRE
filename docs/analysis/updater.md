# Updater lifecycle and native ownership

Target SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This current #17 recovery supersedes the behavioral provenance in the
[historical updater report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/updater-0.105.0.md). The
[manifest](evidence/updater/manifest.json) binds 21 current full owners,
fresh REA/Ghidra queries, and 184 bounded original-instruction cases.
[verification-needed](../verification-needed.md) retains overall build/runtime limits.

The source's previously repaired frontend lifecycle still agrees with current
native producers and consumers. Keyboard `14018dd1f` sets entering tag 1;
world entry `140192bf9` clears tag 0/menu bool+13; return `1401928c2` restores
that bool from process custom-mode bool+12. The current producer stack locals
moved, so the historical replay was adapted to the independently recovered
current offsets rather than blindly relocating the old function. Popup
`1401c78d0` and banner `1401c6520` retain the same frontend field consumers.

Downloading 2 and Ready 3 remain modal regardless of dismissal/frontend state.
Available 1 and Failed 4 require the idle enabled custom menu and an undismissed
state. Their dismissed banner also requires a retained version. Empty 0 stays
hidden. Changed Pressed interaction is required on both native query paths:
action 0 starts/retries, 1 dismisses in memory and 2 reopens. The surrounding
modal/opening time survives Downloading progress publications. Failed and
Available have their existing retry/download and Later actions; Downloading
and Ready have no user cancellation action. Ready keeps the 1.2-second deadline;
leaving Ready clears it. Due apply success exits; failure publishes the retained
plan and localized error.

Current ownership is independently rebound across multiple unrelated address
shifts. Metadata schemas `1401839d0/140183f60/1401847b0`, numeric version
comparison `140185740`, preparation `14017f040`, metadata combination
`14008ee30`, start `140180310`, staged worker `14008fc30`, download
`140184c90`, dialog `1401bc620`, body rebuild `1401c6040`, input `1401c70f0`,
Ready `1401c9030`, and progress `1401c9260` preserve full instruction layout,
register/scalar operands and structure offsets after independently rebinding
calls and RIP data. Current eligibility `140185a30`, apply `14017f830`,
patch schema `14012a810` and frontend producers were freshly inspected rather
than declared equivalent from a guessed version offset. The
[address/range map](evidence/updater/address-map.json) records that scope.

Exact opt-out `WOW_ROGUE_UPDATE=0`, case-insensitive `AzerothSurvivors` stem,
exact auto-install value 1, numeric version lanes, nonempty latest version,
literal relative-URL concatenation, 64-byte lowercased SHA text and existing
part/schema defaults remain connected in source. Patch names retain exactly
one ASCII alphanumeric between `patch-` and `.mpq`. The worker attempts
patches in order and optional EXE last; attempted-stage cleanup, retained-plan
failure and Ready publication remain connected. Download retains 10/30-second
HTTP configuration, the 0.2.0 user agent, gzip construction before output open,
32 KiB compressed input/8 KiB writer/64 KiB decoded buffer and decoded size/hash
comparison. Current apply preserves regating, patch-first replacement,
EXE backup/attempted rollback and argument-preserving direct respawn.

`update_ui.rs` already derives eligibility from entering/in-run/stock mode,
synchronizes before input and after run transitions, and uses the current
work-state rules. No additional behavior change was needed. HTTP/TLS, gzip,
hashing, part readers, Windows filesystem/process implementations and complete
engine scheduling remain separately unverified dependencies; current top-level
ownership does not promote their historical implementation evidence.

`python3 -B scripts/recover-updater.py --check` passes 184 cases:
159 modal/banner/action/lifecycle/Ready/patch-name cases and 25 full current
eligibility cases. Shared historical fixture algorithms are explicitly rebound
to the installed current PE and protected by source hashes. Eligibility uses
synthetic environment/path/UTF8/case-comparison/free results; other cases stop
or record calls. No metadata requests, native OS operations, replacement,
respawn, build, Rust tests, game, rendering or original/rebuilt comparison ran.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/updater-0.105.0.md)

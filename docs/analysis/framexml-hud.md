# Main bar, XP text and player-name fitting

This completes the selected source portion of **#7**. The real FrameXML VM now
loads the exact selected-target Lua for main-bar artwork/layout, persistent XP
numbers and player-name fitting. Compilation, original/rebuilt interaction and
rendered parity remain unverified. [verification-needed](../verification-needed.md) owns the
parent gap and the other HUD recovery/validation limits.
The [0.109.0 HUD report](run-hud.md) independently revalidates this exact
canonical Lua, the new descriptor and native file/format/write owner against the
current installed EXE; the results below retain their 0.108.0 provenance.

## Native contract and boundary

Installed 0.108.0 is 140,203,520 bytes, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
The [manifest](evidence/hud-framexml/manifest.json) binds one canonical
[10,204-byte Lua patch](evidence/hud-framexml/world-state-patch.lua)
at `1471f8278`, its native pointer/length descriptor and the selected 8,191-byte
HUD interval. This interval begins at `function UpdateTalentButton()` and ends
before the action-tooltip patch. Earlier talent-toggle, world-state suppression
and later tooltip/chat overrides are retained as evidence, but are not installed
by this repair. Existing talent binding/pause ownership remains separate.

Fresh REA/Ghidra recovery of `1459a01d0..1459a045d` and its
[Win64 instruction extract](evidence/hud-framexml/world-state-loader.asm)
identify the `Interface\FrameXML\WorldStateFrame.lua` path (38 bytes), original
text, patch descriptor and formatted-source write route. The descriptor at
`1471faa58` contains the exact patch pointer and 10,204-byte length. The
[REA record](evidence/hud-framexml/rea-record.json) binds the raw import,
query and profile. Raw imports omit PE-wide references and external callee
semantics; generic Ghidra `gcc` parameter typing is not Win64 ABI proof.
Nearby references to `1471f8278` also delimit a six-element array: they are not
Lua-reader evidence. Complete installation/filesystem/global ownership remains
**#41**. This repair supplies the selected Lua in memory without writing MPQs or
the player's files.

| Contract | Selected Lua behavior |
| --- | --- |
| Main art | Bar 397×66; five strips at x=0/256/277/321/359, native row UVs and mirrored right micro panel. Four stock texture names survive; the fifth is created on the art frame. The max-level rail uses two strips and hides the unused stock strips. |
| XP | Width 393 at inset 2 and y=43; three casting-border pieces, with a stretched center and original frame level. The stock hover-owned `TextString` is released. Numbers always show as `UnitXP("player").." / "..UnitXPMax("player")`, initially and on world entry, XP update and level-up. |
| Buttons | ActionButtons 7–11 retain their names in a hidden parent; slot 12 is the racial at x=280 with a 64×64 rim. Character and talent micro buttons remain at x=332 and -3 relative spacing. Other native hidden widgets/hotkeys and disabled paging/keyring functions follow the selected Lua. |
| Managed layout | The six named managed positions gain 13 units once per fresh VM. No per-frame or locale-triggered replay. |
| Name | Width 120; capture the original font and size once. On world entry/name update use the original size through 19 **bytes**, then `base_size*19/string.len(name)`. Missing names use the base size; absent font/size skips the write. UTF-8 characters are not counted as single letters. |

## Live source connection

`gameplay/client/framexml_hud.rs` selects the exact contiguous HUD interval from
the canonical patch and supplies `LocalClientExtension.framexml_appends`.
The production UI lifecycle passes these appends into the core loader on every
new in-game VM, including ReloadUI. The loader uses one provider for direct TOC
Lua files and XML Script includes, preserving the original chunk identity and
executing the append with the stock file before the layer/addons. Glue and addon
loads do not receive these appends, and missing source files remain missing.

This placement lets addons see and replace the native HUD. It also avoids the
locale-owned Run Stats postlude, which is replaced when the selected language
changes. The dynamic texture/font methods and existing player XP, level, name
and world-entry event feeds already have real VM consumers. Neither a replacement
Bevy HUD nor a per-frame Lua repaint is used for these controls.

## Static checks and remaining limits

- `python3 -B scripts/recover-framexml-hud.py` verifies the current full
  EXE hash, exact Lua/selected interval, native descriptor/body bytes and the live
  source routes through direct/nested loading and ReloadUI. Textual source guards
  are tracing checks, not a Rust type checker.
- `lua scripts/check-framexml-hud.lua` passes **166 checks** across two
  fresh widget fixtures: strip/mirrored UVs, new and retained textures, border
  geometry, XP subscriptions/updates, font gates/byte boundaries, hidden stock
  frames, managed offsets, micro controls and later addon changes. Widget/font
  methods are explicit stubs; stock FrameXML, actual fonts, MPQ art and the Rust
  host are not executed by this Lua check.
- The authored Rust loader regression covers direct TOC and nested Script
  appends, path normalization, two fresh VMs, missing-file behavior and unchanged
  ordinary source reads. It was **not compiled or run**. Changed Rust source was
  syntax-parsed with `rustfmt --emit stdout`; Python parsed with `ast.parse`.

Builds, compiling tests, game launches, real MPQ/rendering/input, Windows and
controlled original/rebuilt comparisons were intentionally not run. Other custom
HUD owners and target-specific shared-engine dependencies remain #7/#41. No
whole-system recovery, full parent-gap closure or new 0.108.0 release claim is
asserted; no release notes for that version were supplied.

# Run Options recovery

Historical target only. Current page, parser, descriptors, input batching and numeric revalidation are documented in [Run Options0.109.0](run-options.md).

Target: supplied 0.92.0 EXE, SHA-256 `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`. Updated 2026-10-16. Gameplay remains outside this work.

## Native rules

`0x145424750` computes uncapped difficulty as `1 + (density-100)/100*.05 + (health-100)/100*.4 + (damage-100)/100*.6 + (speed-100)/100*2`. The scalar instruction addition order is retained in `src/run_mods.rs`. `0x145424830` repeats the calculation and caps the reward at2. The difficulty keeps increasing above that reward cap. The four u16 ranges/steps are already recovered in the [save report](main-menu-save-format.md); the same `RunMods` constants drive the UI.

REA/Ghidra exact-slice evidence: uncapped `ev_bbf8b79476b4801b528016731c084c6e2e5e676def02f111570051d03eb7a152`, capped `ev_3ae083e899a68bc07f37f2ba54dca369f04cd4a2de08614202bc8605cfa20547`. The provider's generic raw x86_64 ABI is not a Windows signature guarantee; original instructions bind RCX to the four percentage fields, and referenced float vectors were read separately from the verified PE.

The focused source test passed for default1, 500% density1.2, speed150% reaching2, full reward capped2, and full uncapped difficulty5. Actual native import of the custom RunMods fixture shows `Rewards x2.00` on the picker.

## Native UI and implementation

- Canvas constructor `0x140223fb0`:760×560 design at `0x1458f3400`, max1.4 from immediate `0x3fb33333`. Native screenshot on a1600×900 client shows a1064×784 panel centered at268,58, consistent with that limit.
- Frame `0x140224280`:100% width/height, Column, padding36 horizontal/24 vertical, gap14, common framed-pane helper. Title font34 and about font14. The footer has16px horizontal spacing.
- Row wrapper `0x1400136a0`: horizontal gap12, center alignment. It passes each percentage and descriptor to `0x140225410`.
- Row child `0x140225410`: title18, description12, centered84px percentage box with font24; values above100 use native red/orange. Minus/plus use the shared native button path. Native source geometry/text formatting is implemented; button styling is still being reconciled with the generic painter.
- Reward summary `0x140223b00`: label16, value26; muted at baseline and green above1; capped state wraps the formatted multiplier in `{mods} (max)`.
- Reset/Done and modifier actions use the shared menu state and native save record. Entering gameplay is not implemented by these controls.

Implementation is `src/run_options.rs` plus `src/run_mods.rs`. It uses a separate `NativeCanvas` root so text rasterizes at its real fitted scale. The provisional670×430 menu dialog was removed. Integration rendering/interaction checks for the replacement are pending the current full build.

## Evidence and limits

Reproduce static constant and bounded instruction extraction with `python3 scripts/recover-run-options.py`. [Constants/instruction manifest](evidence/0.92/run-options/constants.json), [UI slice provenance](evidence/0.92/runmods-ui-slices-provenance.json) and [reward slice provenance](evidence/0.92/runmods-reward-slices-provenance.json) bind the data to the target. Full REA results remain local under `runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-<VA>`.

Primary UI REA IDs: frame `ev_2051e360a74b3ae0c781f76502523582468663e492c5136ed40fb231fff78fae`, row wrapper `ev_f4dceb57619968577db5195859d852ebfd697724f8df4800a70e9edf5dfdb42f`, row child `ev_f25b4563311a14bdb112ad150956bc003f437d6b522be9167cd15eb1916a75b0`, summary `ev_3ccca30583c5660a720ccafd3760ab63cade7dd62a60e47ced097fcbb6583ccf`.

A nearby-string scan also found references to a one-byte `c` immediately preceding `Run Options`; those references belong to talent counters and were discarded. The literal stack tracker is path-insensitive; only instruction-checked fields and native runtime observations above are used as UI evidence. Shader integration and a successful build alone do not establish full visual parity.

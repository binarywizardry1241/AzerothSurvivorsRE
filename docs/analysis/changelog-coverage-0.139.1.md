# Release-claim ownership context — 0.139.1

Selected 0.139.1 target SHA-256
`1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`.

[Individual review](release-review-0.139.1.md) retains ten supplied items:
one summary, eight bullets and the independent `notes: live in 20 minutes`
context item. Existing source and historical native contracts retain their
actual provenance. Current-target applicability, missing implementation,
runtime behavior and original/rebuilt parity are separate dimensions.

Historical release context: [0.139.0](changelog-coverage-0.139.0.md)

| Release | Obligation | Source status | Remaining check | Owning report |
| --- | --- | --- | --- | --- |
| 0.139.1 | Foreground menu/window click and wheel ownership; stock/custom pause Escape; HUD/meter drag isolation; picker Enter; Options capture; controller Back/Select; downloaded-client CJK commits/composition keys; Windows-on-Wine/Proton activation; independent release timing context (10 individually retained items) | Pending selected-target claim recovery; existing Escape, drag, binding, Select-to-C and Commit source remains retained rather than presumed absent | #310 menu/window and picker isolation, connected with #59 Escape, #7/#8 dragging and #17 binding capture; #22 controller acquisition/action; #293 downloaded-client IME; independent #311 activation stability. Recover exact current producer/state/schedule/consumer boundaries before source changes. The timing note creates no executable obligation or absolute schedule | [Claim-specific review](release-review-0.139.1.md); [menu](../../crates/azeroth-survivors-re/src/menu.rs); [pause](../../crates/azeroth-survivors-re/src/gameplay/run_hud/pause.rs); [HUD](../../crates/azeroth-survivors-re/src/gameplay/run_hud/controls.rs); [meter](../../crates/azeroth-survivors-re/src/gameplay/meter.rs); [Options](../../crates/azeroth-survivors-re/src/options.rs); [device](../../crates/azeroth-survivors-re/src/native_input/mod.rs); [IME](../../crates/azeroth-survivors-re/src/ime.rs); [client input](../../crates/benilla-app/src/local_client.rs); [FrameXML input](../../crates/benilla-app/src/ui_script/input.rs); [camera/focus](../../crates/benilla-app/src/player/camera.rs) |

The [0.139.0 review](release-review-0.139.0.md) and its historical audit remain
bound to that older EXE. This crosswalk inherits ownership context only; it
does not transfer earlier claim completion, native addresses or runtime proof.
Connected grouping does not establish a shared root cause or promote one
member's evidence to another. The Windows compatibility crash has no established
native cause, and the timing note is not evidence that a release is installed.

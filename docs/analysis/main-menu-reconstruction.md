# Historical menu checklist — 0.92 / 0.97.2

This version-bound checklist preserves recovered menu contracts and their original
validation limits. The selected target is now [0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.100.1.md);
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own implemented behavior and remaining work.
Earlier menu-only scope and stopped-work instructions are not active project rules.

## Owning evidence and implementation

- [Save format and actual native interoperability](main-menu-save-format.md): native export decoded by Rust; Rust-produced synthetic save imported by the supplied EXE. Field order, class/race restrictions and run-modifier values were checked. Full save/progression migration is incomplete.
- [Options recovery](options-recovery.md): 94 pointer-backed native definitions, exact ranges/choices/inversion, storage and native consumers. Implemented controls persist values; effects owned by absent gameplay systems remain unimplemented.
- [Preview source integration](main-menu-preview.md): actual user MPQ models, composite appearance, starting outfits and animation; exact native lighting, camera and equipment behavior remain incomplete.
- [Additional menu content](evidence/0.92/menu-details.json): source-embedded ability icons/descriptions and zone narrative/enemy/boss summaries. The build does not require the reference EXE.
- [Exact native function slices](evidence/0.92/menu-slices-provenance.json): SHA-bound derived function bytes at original virtual addresses enable scoped REA/Ghidra analysis. Generic raw-image calling conventions are not proof of Windows x64 parameter signatures.

## Existing 0.92 parity checklist, pending 0.97.2 revalidation

| Surface | Status |
| --- | --- |
| Picker root, class/hero/zone panes | Native functions identified; source state/preview integrated. Presentation is being reconciled with recovered Bevy Node stores, and is not yet 1:1. |
| Class/race eligibility and per-class appearance | Native ID lists and hero records implemented. Build23 corrects fresh-class faction/sex/zero-feature rules and saved restores against153 recorded native outputs. Complete import/appearance normalization remains under investigation. |
| Random name/name editing | Native 20×16×10 fragment generator, initial Hero replacement and ASCII input/normalization recovered and implemented in hero_name.rs. It ignores race/sex/class. Integrated name interaction comparison and exact edit-save timing remain pending; see main-menu-name-input.md. |
| Saves | Native envelope and isolated source/native interoperability checked. Build25 separates local Pick edits, ordered full-Pick events and account-only writes; both class writes and ordinary-error continuation are tested. Build26 closes damaged/read startup with numbered/legacy backups, future writes, native no-Pick defaults and last-unlocked zone clamping. Full migration and invalid-Pick/appearance/import normalization remain incomplete. |
| Run Options | Native four modifier ranges/steps/persistence implemented; native canvas/layout, uncapped difficulty and capped reward formula implemented. Rebuilt dialog rendered and reset exercised; button styling and further persistence comparisons remain open. |
| Options | Native94 controls/defaults, Key Bindings, Saves and desktop AddOns controls implemented. Native CVar override/timer/atomic semantics, whole typed load and log-only write failure compile through25; six config cases pass. Full registry/session callbacks, raw-value getters, VM/binding lifecycle and effects need reconciliation. |
| Character/Armory, Collection, Drop Tables | 415 class items, native starter outfits, native slots and ownership/equip/cosmetic controls implemented. Build26 adds the intrinsic shell/six panes,500×610 Character stage,54px Collection grid and230px Drops zone column. Child palette/hover/tooltip/missing-list and rotation parity remain open; see armory-0.92-recovery.md. |
| Talents | 353 nodes/27 trees and recovered gates/cost/refund rules implemented; four rule tests pass. Build25 corrects intrinsic body/tree/details/header/milestone flow. Rebuilt interaction/appearance, hover and shadow comparison remain open. |
| Achievements/Rewards | 66 achievements/1365 points, perks/tabards/companions implemented. Native intrinsic cards, all66 unlock vectors, free-tabard gate and category constructors compile. Build23 integrates the shared native mouse scrollbar; input fallback, original schedule predicates and rebuilt verification remain open. |
| Codex | 140 native items recovered, including all 101 dynamically constructed class legendaries; localized source screen, tile hover/shadow and native shell/header compile in20/21. Rebuilt interaction/render parity remains unverified. |
| Language | Ten native catalogs and native popup/persistence implemented. Picker/menu explicit keys connected; remaining screens need explicit localization. Source interaction verification pending. |
| Update/community actions | Native preparation/combined metadata plans and prompt/banner compile; six sequence fixtures pass. Build26 connects the exact-gated worker, sequential part/decode/stage/cleanup, Ready deadline, apply/respawn and all five state UIs. Five new memory-only connection cases pass; no real adapter was executed. Platform/runtime parity remains unverified. Community URL is implemented but unopened. The selected EXE was not updated. |
| Audio, particles and full preview styling | Build26 connects the native-confirmed theme via the shared mixer, with native gain/callback/master/focus evidence and device-free fixtures. No playback verification; exact backend/schedule/click behavior remains open. Particles rendered in15; full preview styling parity remains incomplete. |

## Runtime isolation

The original 0.92 Windows executable was launched through the already-installed Wine runtime in `runtime/ReferenceQA.app`, with `WINEPREFIX`, `BENILLA_HOME`, `WOW_ROGUE_SAVE` and MPQ paths inside this project. Loading the bundled MoltenVK library made the reference render; the default OpenGL fallback failed. These runs used a disposable profile, not an installed player save. Screenshots, native export/import fixtures and raw runtime logs remain local under `runtime/`; only curated textual evidence is tracked. The reference observed a newer online release but was not updated during those historical checks. No 0.97.2 execution has been performed.

## Historical validation

The final Apple Silicon build26 passed in11.08s after the combined29.09s build.
All169 focused harness cases passed (74 binary,19 native-save,6 config,1 run-modifier,
14 save-browser,37 updater,18 installer; overlapping harnesses). New native/source
fixtures cover startup recovery,162 zone outputs, connected updater sequencing,
nine gain cases and36 consumed audio callback outputs. The first audio build's
missing libc dependency was corrected. Normal builds compile the audio/device
bridge; unit fixtures exclude device execution. Builds20–26 were not launched,
and no HTTP/download/install/restart or audio device was exercised. Source render
proof remains bounded to17 or earlier. Windows remains unverified. See
[validation history](menu-validation.md), [audio](main-menu-audio.md),
[connected worker](main-menu-update-worker.md) and [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

# Replacement footer focus policy

Recovered on 2026-10-19 from the selected supplied EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The replacement footer explicitly receives **`Interaction::None` and
`FocusPolicy::Pass`**. The leading `00` of its three packed bytes is an insert
control byte, not the focus policy.

This resolves the remaining component-layout ambiguity in the
[treasure interface recovery](treasure-pipeline.md). All eight bounded
owners, the command-queue fragment, exact tuple name and byte/data-flow mapping
are retained in the [hash-bound manifest](evidence/treasure-interface/footer-focus/manifest.json).

## Native byte and type mapping

1. The [footer queue fragment](evidence/treasure-interface/footer-focus/queue.asm)
   writes handler `0x140177830`, the footer entity and the three bytes `00 02 01`:
   `0x14010bd9f` writes `01` at record offset `0x12`, and `0x14010bda5` writes
   little-endian `0x0200` at record offset `0x10`.
2. The [command handler](evidence/treasure-interface/footer-focus/command.asm)
   advances the command payload by 16 bytes and calls `0x14005daa0`. The
   [entity insert owner](evidence/treasure-interface/footer-focus/insert.asm)
   reads the payload's bytes `8..10` and passes them to `0x1402129f0` in
   `ECX = 0x010200` (`0x14005daec..0x14005daf7`).
3. The [typed bundle metadata owner](evidence/treasure-interface/footer-focus/component-ids.asm)
   references the selected EXE's literal at `0x145963e6c`, length 102:

   ```text
   (wenilla_rogue_app::screens::cards::TipHost, bevy_ui::focus::Interaction, bevy_ui::focus::FocusPolicy)
   ```

   It registers component IDs through `0x140205300`, `0x140204480`,
   `0x140203fd0`, in that order. Their component sizes are `0`, `1`, `1`.
   The [ID collector](evidence/treasure-interface/footer-focus/component-id-collect.asm)
   outputs those three IDs in tuple order. Although its intermediate stack slots
   are reversed, with all three presence flags equal to `1` its writes at
   `0x1401a31c7`, `0x1401a31be`, `0x1401a31dd` emit the first, second, third
   registered IDs respectively. Reading intermediate stack order as tuple order
   would therefore be incorrect.
4. The [ECS writer](evidence/treasure-interface/footer-focus/ecs-writer.asm)
   separates the packed argument and writes the components as follows:

   | Packed byte | Value | Destination | Instruction evidence |
   | --- | --- | --- | --- |
   | `0` | `00` | Insert control, saved at stack `+0x8c` | `0x140212a2b`; bit 0 tested at `0x140212b0f` and component replacement branches |
   | `1` | `02` | `Interaction::None`, stack `+0x9a`, component ID index 1 | `0x140212a25` extracts `CH`; `0x140213038` loads ID index 1; `0x140213082` supplies `+0x9a` to the component copy |
   | `2` | `01` | `FocusPolicy::Pass`, stack `+0x9b`, component ID index 2 | `0x140212a33..0x140212a38` shift by 16 and mask bit 0; `0x140212f8d` retains its pointer in `R15`; `0x14021310d` loads ID index 2; `0x140213157` supplies `R15` to the component copy |

   `TipHost` is zero-sized. Its earlier zero-length component copy reuses the
   `+0x9b` address; that does not consume or change the focus-policy byte.

The matching Bevy 0.18.1 enum definitions name `Interaction` values
`Pressed=0`, `Hovered=1`, `None=2`, and `FocusPolicy` values `Block=0`, `Pass=1`.
The selected EXE's explicit typed tuple and component writes establish which
byte belongs to each enum; the conclusion does not depend on an implicit
widget bundle or a presumed component order.

## Source implication and validation limits

The replacement footer hover host must explicitly include `FocusPolicy::Pass`
alongside its interaction and tooltip marker. Bevy 0.18.1's focus system treats
an **absent** focus-policy component as `Block` (`ui_focus_system`,
`node.focus_policy.unwrap_or(&FocusPolicy::Block)`), even though
`FocusPolicy::default()` itself returns `Pass`. The footer can consequently
track hover while permitting the parent card to receive the press.

This pass changed only documentation and curated textual evidence. Root owns
the source repair and its validation. No Cargo command, original/rebuilt GUI
launch or mouse-interaction comparison was performed for this question.
Static recovery proves the explicit native footer policy; hover/click parity
requires a controlled runtime comparison.

REA used the project launcher and Ghidra 12.1.4. Fresh insert-owner evidence is
`ev_c79a8ffd0dfc9fcb49771449fd5efccb8f1bfb470d4e8fd92f302a9af2212ef4`,
retained as [Ghidra pseudocode](evidence/treasure-interface/footer-focus/insert.ghidra.c).
The bounded raw import uses Ghidra's default GCC ABI; its parameter labels are
not treated as Windows x64 argument evidence. The register mapping above is
taken directly from the selected PE's instructions.

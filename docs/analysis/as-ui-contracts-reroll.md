# Card admission, delivery and offer renewal

Gap **#41**, selected installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[Current pointer/renewal proof](evidence/0.113.2/as-ui-contracts-reroll.json),
[keyboard and capture contract](card-keyboard.md),
[ordered local delivery](card-delivery.md).

Reroll requires idle CardsState, availability and a free charge or enough gold;
it remains available during entrance. Pointer selection, Banish and Skip use the
actual **0.45-second** opening threshold at `0x145ea2570`. The earlier pointer
fixture supplied `0.32` through an XMM input seam; that established comparison
behavior but did not establish the EXE's actual opening constant. The current
fixture verifies the load and immutable bytes and supplies the recovered value.
The independent old-root replacement/exit threshold is **0.32 seconds**, at
`0x145ecbab0`. Opening admission and exit are separate contracts.

Pointer selection is collected across the row loop and committed after the
other pointer commands. Thus a pointer Reroll can precede selection in the same
pass. The keyboard handler independently rejects an already closing screen,
then collects the lowest admitted Digit/Numpad1–4 and finally R from the same
input snapshot. R can follow a newly collected keyboard selection; the initial
closing guard does not become a second guard after that selection. Captured
typing blocks the keyboard handler without blocking pointer controls.

The local queue appends and consumes these commands in order. Selection reaches
acceptance immediately; a following reroll sees the resulting next offer, or is
rejected if no offer remains. Source now collects the commands before applying
them, preserving the input snapshot's count/affordability and native transaction
order. Acceptance applies once before its presentation exit. A subsequent offer
revision cannot cancel that already applied selection. The old visual hierarchy
is retained through its independent exit gate, then replaced or removed; terminal
and teardown paths retire it without waiting for that gate.

Successful Reroll, Banish and Skip publish a new offer revision even when cards
and footer are identical. A nonclosing replacement renews the opening clock
immediately; a replacement received while closing waits for the exit gate.
Actual keyboard-versus-pointer system scheduling and backend/client latency
remain unverified; the source uses its existing pointer-then-keyboard pass.

## Concrete native binding

The current `Reroll` literal is at `0x145efd9a0`, length six. Its lookup at
`0x1402a5540` belongs to Cards builder `0x1402a3100`. The button's gate
`0x1402a5229..0x1402a5255` reads availability `+0x48`, free count `+0x20`,
price `+0x28` and gold `+0x30`.

Pointer controller `0x1400b4e30` loads the opening constant at `0x1400b4f60`.
Its `0x1400b54ba..0x1400b554f` Reroll lane does not consume the opening-age
flag; Banish/Skip and final selection do. The pointer age comparison rejects
unordered input. Selection collection `0x1400b5661..0x1400b5676` writes stack
locals before returning to the row loop. After the loop,
`0x1400b567b..0x1400b56e4` validates index/state/age and enqueues command 2;
`0x1400b56e9..0x1400b56fc` then records closing, clock and selected row.
The keyboard's different unordered comparison, native key-name mappings, input
resource identity and real local consumer have their separate linked proofs.

Generation calls JSON builder `0x145967a30` at `0x1459660f2`; the exact
`choices` value is at `0x14730e030`. The message branch at `0x1400e9fb9`
routes to `0x1400ea172`. After dropping the old JSON, `0x1400ea19a..0x1400ea1d4`
replaces Cards JSON at `+0x80` and increments revision `+0xe0` without comparing
payloads. Root `0x1400b38d9..0x1400b3970` gates a changed revision on closing
age, records it and clears closing; `0x1400b3fe8` records the new opening clock.

## Static checks and limits

`check-card-reroll.py` retains its 80 labeled-button, 1,600 pointer
Reroll, 30 selection/closing and 96 revision/renewal cases. These bounded native
fixtures and live-source guards do not execute reconstructed Rust. The separate
keyboard/delivery reports bind their additional cases and exact seams. Authored
Rust regressions cover immediate and exactly-once acceptance, ordered pointer and
keyboard transactions, aliases, typing, snapshot affordability, retained roots,
identical replacement offers and retirement; they were not compiled or run.

Generic ECS aliases, native/global schedule completeness, actual device/VM/file/
renderer execution and original/rebuilt parity remain unverified. No compilation
or game launch ran. The bounded source repair does not close #41.

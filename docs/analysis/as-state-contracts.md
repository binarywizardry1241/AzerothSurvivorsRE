# AS state contracts

This selected **#41** recovery is bound to installed 0.113.2, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
It follows concrete local run-state producers and consumers. Co-op behavior and
generic engine reconstruction are outside this source repair.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall status. Compilation, game/client
execution and original/rebuilt parity remain unverified.

## Endless continuation notice lifetime

Current continuation `1458f4c30..1458f4da8` admits local phase `Game+c12 == 5`.
It captures the previous endless byte at `Game+c00`, writes endless and active
phase, sets `Game+bc8` to the `Game+b6c` clock plus 300 seconds, appends the shared
unroot message and increments the movement serial. These actions occur on every
admitted continuation. The branch at `1458f4cee..1458f4cf6` skips localization
and the `1458c8a40` notice constructor when the captured endless byte was nonzero.
Thus the announcement belongs to the first transition into endless, while later
victories still resume, unroot and establish their next deadline.

The live `gameplay/terminal.rs` consumer previously sent the `Endless` raid emote
after every successful continuation. It now captures the source `rules.endless`
before calling `Mechanics::continue_endless` and guards only that notice. The
existing state transition, unconditional unroot and caller-owned gossip completion
retain their order. `continue_endless` already preserves the endless flag for the
lifetime of that `Mechanics`; a new run constructs its own state.

[Exact contracts](evidence/0.113.2/as-state-contracts/endless.json),
[instructions](evidence/0.113.2/as-state-contracts/endless.asm) and
[Ghidra provenance](evidence/0.113.2/as-state-contracts/endless-rea.json) retain
the current owner and observations. The original-VA raw import has external-data
and calling-convention limits; the exact instructions and installed constant
`147004000 == 300.0f` establish the branch and stores independently of pseudocode.

`python3 -B scripts/check-as-state-contracts.py` passes **112 native
continuation cases**: phases 0–6, prior flag values 0/1/2/255 and four clocks.
Every case compares the complete supplied Game bytes, existing queue prefix,
new record, serial wrap, and the native announcement boundary. The unroot
serializer is an explicitly opaque 32-byte fixture seam, and preallocated queues
exclude allocator growth. Source guards check the connected flag capture and
message order; they do not execute Rust or certify packet, rendering or gameplay
parity.

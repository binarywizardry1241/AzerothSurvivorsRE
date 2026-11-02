# Cards keyboard, typing capture and transaction collection — 0.113.2

Target SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This owns selected #41 `Q41-S01`/`Q41-M03` source/static recovery for the
standalone card-input contract associated with changelog claim
`cc745d386a67e806`. Current implementation status belongs to
[CURRENT-STATE](../../../../CURRENT-STATE.md).

The complete current native keyboard handler admits **Digit/Numpad 1–4 in
ascending slot order, then R**, from one Cards snapshot. Typing capture gates
the entire handler before any key query. The current keyboard and pointer
selection threshold is **0.45 seconds**; the closing hierarchy's revision gate
uses a separate **0.32-second** threshold. Selection enqueues its transaction
before the closing presentation finishes. The
[delivery proof](../card-delivery/report.md) owns actual local backend delivery
and accept/reroll consumers.

## Native keyboard contract

The complete **921-byte** handler is `[0x1400b3420,0x1400b37b9)`.
[Ghidra](ghidra.json) independently reports precisely this inclusive function
body through `0x1400b37b8`. Its early gates require Cards `+0x18 != 0`, Cards
closing byte `+0x10 == 0`, and InputCapture byte `+1 == 0`. Nonzero capture bytes,
including synthetic malformed 2 and 255, reach the epilogue without calling
the key-set lookup. This does not classify arbitrary invalid source Booleans
as reachable game states.

Each slot queries the top-row key, then its numpad alias only if the first query
misses. A matched digit marks the Cards change tick even if the slot is absent
or the opening gate fails. A valid first selection emits command tag **2** with
the zero-based slot, then writes closing, its start clock and selected slot.
Later matched digits see closing and cannot emit another selection. The final
R query still runs after that write and does not recheck closing. If snapshot
availability byte `+0x48` is exactly 1 and either free rerolls `+0x20` are nonzero
or gold `+0x30 >= price +0x28`, it emits command tag **3**. R has no opening-age
gate. Consequently an admitted Digit1+R pass emits **Select(0), then Reroll**.
The enqueue fixture leaves snapshot affordability unchanged, matching the
separate queue interface; it does not execute backend effects.

The handler passes these exact raw key values and precomputed hashes to
`0x14015e7c0`:

| Slot/action | Top row | Numpad |
| --- | --- | --- |
| 1 | `7` | `86` |
| 2 | `8` | `87` |
| 3 | `9` | `88` |
| 4 | `10` | `89` |
| Reroll | `37` | — |

The key names are established independently from the current EXE. Nine bounded
original-instruction cases execute the native name decoder in declared extent
`[0x144350500,0x1443526bd)`, starting at its string-length dispatch and stopping
after its successful output write. The actual ASCII comparisons map `Digit1`
through `Digit4`, `Numpad1` through `Numpad4`, and `KeyR` to exactly those values.
For example, comparison `0x14435139e` branches to `0x1443524d6`, which writes
**37**. Only the visited selected paths are retained in
`key-name-decoder.asm`; the guarded 19-entry length table and admitted lengths
4/6/7 are committed in the [manifest](manifest.json). The retained Bevy 0.18.1
enum independently agrees, counting payload-bearing `Unidentified` as one
variant. This source correspondence is additional evidence, not the sole basis
for assigning names to native values.

Ghidra's name-decoder body remains partial at its computed dispatch. The bounded
name cases establish the selected decoder paths without claiming all key names,
all visitor states or broad native body ownership.

## Exact typing-resource connection

The UI getter `0x1405c90a0` resolves a particular UI resource, then returns its
byte `+0x18` in AL; its missing/unavailable-resource paths return zero. Snapshot
producer `0x1400d8630` calls it at `0x1400d8678`, resolves the two-byte capture
resource, clears its first byte and stores AL at resource `+1` at
`0x1400d8786`.

That resource is the one actually passed to the Cards keyboard handler. The
snapshot's full 128-bit TypeId at `0x145ecf0a0` equals the initializer's TypeId
at `0x145ecf788`:
`0bb84550b75c0970ae2aad7a9fab2f6d`. The initializer calls the exact-key lookup
with that TypeId at `0x1400be2b6`, retains the result in R14 and stores it in
system state `+0x10` at `0x1400be39d`. The wrapper `0x1400be610` resolves precisely
that state handle and passes its value pointer as the handler's R8 resource
descriptor. The common vtable `0x145ecdaa8` binds the wrapper at `+0x48` and
initializer `0x1400be1e0` at `+0x80`.

The lookup's context map fields `(World+0x40)+0x38/+0x40` are the snapshot's same
`World+0x78/+0x80` map. Its existing-entry path compares both 64-bit halves of
the key and returns the stored resource ID. The initialized system stores the
World identity token, which the run wrapper checks. This recovers the producer
to consumer identity **for the same valid World and initialized system state**.
It does not establish arbitrary map mutation/alias replacement or reconstruct
the generic registry. Retention across calls uses the Win64 nonvolatile-register
contract. The manifest retains the exact binding slices, TypeId/vtable bytes
and fresh Ghidra provenance; producer and consumer extracts have one canonical
copy each.

## Distinct opening and closing comparisons

| Selected native gate | Constant | Comparison behavior |
| --- | --- | --- |
| Keyboard `0x1400b34f1` and its other three digit gates | `0x145ea2570`, bits `0x3ee66666`: **0.45** | Constant-first `UCOMISS` then `JA` rejects only an ordered young age; unordered age is admitted. |
| Pointer load `0x1400b4f60`, comparison `0x1400b54d5` | Same **0.45** bytes | Age-first `UCOMISS` then `SETAE` requires ordered age >= threshold; unordered age is rejected. |
| Root revision gate `0x1400b3909` | `0x145ecbab0`, bits `0x3ea3d70a`: **0.32** | A closing state exactly 1 waits while ordered closing age is below threshold. A received revision and nonempty source remain necessary. Unordered age does not postpone the revision. |

These constants come from their exact current RIP-relative data references.
They are not supplied floating-point seam values. Malformed closing-state and
NaN cases describe decoded comparisons; they do not claim those states arise in
normal gameplay. The earlier reroll fragment proof supplied 0.32 in XMM7 and
therefore did not establish the native pointer admission constant. Its owning
current proof/report are corrected by this repair.

## Connected source and checks

`gameplay/mod.rs::keyboard_choice_actions` groups all eight digit aliases in
ascending order, uses the recovered 0.45 gate with native keyboard unordered
behavior, and returns R eligibility from the unchanged snapshot. `controls`
calls it only behind keyboard-capture and prior-closing gates, then queues
Select before Reroll. The native immediate transaction and delayed visible-root
lifecycle are traced separately by the delivery proof.

The existing shared interface path remains live:
`ui_script/input.rs` publishes
`capture.typing = script.has_keyboard_focus() || binding_capture`;
`local_client.rs::capture_input` forwards `keyboard.typing` into
`LocalClientInput.keyboard_captured`; Cards input consumes it. The checker
retains exact source projections. Reconstructed Rust, actual EditBox/chat
interaction and scheduling are not executed by these checks.

`check-card-keyboard-0.113.2.py` passes:

- **6,245 complete native keyboard cases**, including all 512 key combinations
  at three clock states and three choice counts, capture/closing/count gates,
  empty key sets, all nine key names, unsigned free/gold boundaries, simultaneous
  aliases and selection/R order. All queries and command order are asserted;
  captured input must perform zero queries.
- **60 pointer-gate cases**, using the real native constant load and comparison.
- **96 revision/exit-gate cases**, using the real native constant load, revision,
  count and closing comparisons.
- **9 current native name-decoder cases** proving the selected key discriminants.

The complete keyboard fixture supplies only the exact just-pressed membership
and command-enqueue interfaces. It verifies query hashes and pointers, event
payloads/order, Cards change ticks, selection state and stored clock bits. The
other bounded cases stop at their explicit local interfaces. Getter, snapshot,
wrapper and type-ID identity work is static recovery rather than executed ECS
or UI validation. No compiler, target process, game, actual save/configuration
operation, renderer or original/rebuilt parity comparison ran.

Reproduce the static checks from this checkout:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-card-keyboard-0.113.2.py
```

The four retained `*-plan.json` / `*-seeds.tsv` pairs reproduce the bounded
Ghidra queries through `scripts/rea-batch.py`. Curated seed paths differ from
the original runtime paths, so replays produce new profiles and Evidence IDs.
Preserve the original commitments. Native unknowns beyond these selected
interfaces and gameplay/presentation parity remain under existing findings.

# Q41-P01 — XInput function-slot producer

The installed **0.113.2** EXE, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
owns this bounded classification under permanent gap **#41**. The
[manifest](manifest.json) binds the selected residual, actual bytes/body ranges,
fresh REA/Ghidra observations and reviewed source. Overall implementation status
remains in [CURRENT-STATE](../../../../CURRENT-STATE.md).

## Selected instruction and producer

The original selected-owner census reports one unresolved call without a
ReferenceManager destination: preferred VA `0x1400b718f`, actual owner
`0x1400b6eb0`. Fresh Ghidra observation
`ev_604154a7b61f334c5ca2911337684905848a18e6e58712eada0a60a3b77eb6f2`
confirms bytes `41 ff 14 24`, `CALL qword ptr [R12]`, computed flow and no direct
destination. This is a runtime function-pointer slot, rather than evidence for
an undiscovered function inside the supplied image.

At `0x1400b6f48`, the native poll copies the 16-byte head of its initial R8
resource descriptor; `0x1400b6f55` saves that copy at `RBP-0x38`, and
`0x1400b6fb6` loads its low qword into R12. The pointer is also saved at
`RBP+0x108`; later temporary R12 uses restore it before another poll. A
conservative traversal of every conditional branch reaches **637 instructions /
3,171 bytes** in **638 abstract states**, exactly the actual disjoint Ghidra body. All local paths reaching
the selected call carry this resource pointer in R12. The invoked slot is its
first qword, offset zero. RCX carries the selected controller slot; RDX points to
the zeroed 16-byte state buffer at `RBP+0x120`. Following native branches test EAX
for success/failure before their connection/state/event handling.

## DLL lookup and existing source

The current native loader/registration owner is `0x1400a7ea0`, actual body
`[0x1400a7ea0,0x1400a855c)` (exclusive end), **1,724 bytes**. Fresh Ghidra
pseudocode Evidence
`ev_64c0a656e7e1469330020b0f5e39fcb19a1eacce93ae156a874d645c6dedf320`
and actual PE import/string operands establish this fallback sequence:
`xinput1_4.dll`, `xinput1_3.dll`, then `xinput9_1_0.dll`, resolving the exact
`XInputGetState` symbol. Each failed module/symbol lookup advances to the next
candidate. A successful returned pointer moves from RAX to preserved RDI at
`0x1400a7f42` and into the first qword of the resource value at `0x1400a83c8`,
before ordinary ECS insertion. Four slot markers and the probe deadline are
initialized in that same value.

The reviewed live source
[`native_input/acquisition.rs`](../../../../../crates/azeroth-survivors-re/src/native_input/acquisition.rs)
already resolves those same DLLs/symbol in that order, stores the typed
`unsafe extern "system" fn(u32, *mut State) -> u32`, and calls it with a slot and
state buffer before testing the return value against zero. This bounded
producer/slot/consumer correspondence establishes no missing AS source fix.
The branch stops at the existing AS acquisition-to-Windows API boundary; it does
not reconstruct Windows or expand into the engine's surrounding ECS registry.

## Static checks and remaining limits

`python3 -B scripts/check-q41-p01-0.113.2.py` checks the configured installed
identity, original selector/selected-owner artifact, exact native byte ranges,
PE imports/literals, preserved resource-pointer reaching definitions, fresh
Ghidra body/flow records and reviewed source anchors. It uses the existing
project-local Capstone environment, never compiling or executing target code.

The original inventory stays **245 unresolved selected-profile records**:
244 have current in-image target owners, while this runtime call has no static
target owner. Classification does not change those original observations or
certify the other 244 callees' behavior. The loaded DLL's actual address and
implementation, runtime symbol replacement, arbitrary aliases/writers and the
whole ECS type registry remain outside the proof. Local flow assumes the Win64
nonvolatile-register ABI and no arbitrary corruption of the saved stack slot.
No compilation, Rust test, game/device/platform run or original/rebuilt parity
comparison occurred; #22/#41 remain open at those boundaries.

The original fresh probe plan/responses stay under ignored
`runtime/q41-p01-0.113.2/`. To reproduce it, use `scripts/rea-batch.py` with the
manifest's nine operation/parameter pairs against
`installed-game/AzerothSurvivors.exe`, seeding both function/code at
`0x1400b6eb0` and `0x1400a7ea0`. Use the recorded disabled-analyzer profile and a
fresh project-local output directory. New output paths/profile commitments
produce new Evidence IDs; do not relabel them as the original probe.

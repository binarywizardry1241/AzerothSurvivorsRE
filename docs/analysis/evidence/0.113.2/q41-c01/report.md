# Q41-C01: Armory slot-selection diagnostic

Target **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This classifies the selected site `0x140147b9d`; it does not classify every
remaining C01 diagnostic or establish complete Armory behavior.

The site belongs to the **primary Armory slot-selection action's bounds
failure**. Its Rust Location record at `0x145ed77e0` names
`crates\wenilla-rogue-app\src\screens\armory.rs:1845:28`.
The actual slot case at `0x14014786b` zero-extends the action's byte at offset
4, marks the Armory focused slot present, and stores that slot at resource
offset `0x71`. It then compares the index with **19**. For a valid index it
reads the worn item from the already projected account snapshot at
`RBP+0x40+slot*4`. A nonzero ID becomes the selected item; zero clears the
selection. The case updates the resource change tick and returns to the
iterator continuation at `0x1401471a6`. It does not publish a gear mutation.

At `0x140147892`, unsigned index >=19 branches directly to the selected
diagnostic site. The call at `0x140147ba9` supplies index in RCX, length 19
in RDX, and the Location pointer in R8 to `0x145e9c123`. The retained helper
and its format bytes identify an index-out-of-bounds diagnostic with length
and index formatting arguments. Recovery stops at this necessary diagnostic
interface; the surrounding Rust panic/runtime subsystem is outside this task.

The [contract](contract.json) commits the exact selected code/data ranges,
the enclosing declared extent `[0x140147060,0x140147bc4)` and its byte hash,
the native Location, and the inspected source projection. The canonical
assembly files contain each selected range once.

The live source counterpart is
[`armory.rs`](../../../../../crates/azeroth-survivors-re/src/armory.rs):
the equipment row producer attaches `ArmoryAction::Slot(slot)`; `input`
sets `view.slot = Some(slot)` and `view.selected = gear.worn(class, slot)`.
`GearSave::worn` converts catalog slots to native paperdoll indices and reads
the projected worn map. Empty worn slots clear Details. The source already
expresses this valid-slot contract, so this investigation supports **no
gameplay source repair**. This is static correspondence; reconstructed Rust
and its UI were not executed.

The dispatch at `0x140147526` uses the relative-offset table at
`0x145ee1ffc`. For the explicitly admitted action discriminant **7**, the
selector is `7-2=5`, whose current signed table entry reaches
`0x14014786b`. Twelve adjacent target entries are retained as the inspected
primary-action table. The dispatch has no general lexical upper bound:
these bytes and this selected lane do not prove every incoming enum value,
all action membership, or all indirect targets.

[Ghidra observations](ghidra.json) retain the successful full-PE probe's
Evidence IDs, profile, actual body ranges, direct branch/call observations
and the raw-import cross-check. The entry body remains **1,137 bytes** and
ends at the unresolved computed dispatch for this path; FunctionManager
still reports the selected case/panic site outside any body. The observed
direct failure flow and selected table lane recover its AS contract without
promoting an unwind extent or analyst seed into a function-body claim.
Existing whole-image ownerless counts therefore remain unchanged.

Reproduce the bounded provider query with
`python3 -B scripts/rea-batch.py docs/analysis/evidence/0.113.2/q41-c01/probe-plan.json --output runtime/q41-c01-0.113.2/rea-new-probe`.
The [plan](probe-plan.json) and [seeds](probe-seeds.tsv) record the disabled
analyzers and exact entry/code starts. No case is forced into a function.
Absent caller/reference observations in this profile do not prove absence.

`PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-q41-c01-0.113.2.py`
passed **59 original-instruction cases**: all 19 lanes with zero and two
nonzero IDs, plus invalid slots 19 and 255 reaching the exact bounds consumer
with the expected three arguments. The replay executes the real dispatch
and selected branch, using synthetic action/state/account-snapshot memory.
It does not test upstream ownership admission: arbitrary nonzero IDs check
the selected branch's semantics only. ECS membership, account projection,
complete function ownership, UI/input/rendering behavior and original/rebuilt
parity remain separate. No compiler, application, actual save/configuration
operation or game process ran.

# Azeroth Survivors Options file values and live assignments

Target SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This is the custom Options storage1/2 portion of #17. It connects the existing
benilla home, file and UI interfaces to the current Azeroth Survivors controls.
It does not extend engine reconstruction or establish runtime parity.

The [105-row descriptor proof](evidence/options-descriptors/data.json)
identifies 23 string-valued globals and two one-or-nil toggles. Current custom
writer `14012d1f0` writes their literals through `14056a710` to
`<engine config_dir>/saved-variables.lua`. Storage1 quotes the supplied text;
storage2 writes `1` only for exact input text `1`, otherwise `nil`. The existing
file composition preserves unrelated lines, replaces every exact column-zero
assignment and appends an absent key. It normalizes line endings to LF and adds
a final LF. A failed UTF-8 read is treated as an empty file.

Current read dispatcher `14012bc10` reads the file through `1405694b0`, rather
than querying the live VM. It takes the first matching column-zero assignment,
permits Unicode whitespace between the complete key and `=`, and trims the
right-hand literal. Storage1 strips boundary double quotes without unescaping
or evaluating it. Storage2 treats only a missing literal, exact `nil` or exact
`false` as false. Even `0`, an empty right-hand side or `nil -- comment` is true
for this literal test. Missing string literals use their descriptor default.
The previous source used the UI saved-variable parser, which changed duplicate,
string and Boolean results. `options_globals.rs` now implements this narrow
custom read contract without creating a Lua VM.

The current collector `1400881e0` calls that read dispatcher from the Options
event owner at `140139002`. Its [canonical event assembly](evidence/in-run-bindings/options-events.asm)
admits a value rebuild while open when the model cache is absent or operations
are queued. The source rereads file literals in its existing open/operation
rebuild gate, and no longer replaces them with the live VM snapshot. It clears
old storage1/2 values before extending the fresh result, so a failed write or a
removed assignment cannot leave a synthetic value displayed indefinitely.
The current source startup has no later `run_with` project-home seating after
Options initialization; its stored home comes from the existing public
`benilla_app::config_dir()` owner. The former separate environment/executable
resolver has been removed from `options_config::home()`.

After each file call, the custom writer checks the current GameClient resource:
only UI byte+`e8 == 1` calls `140569e00`. Other flag values skip the live
assignment. A missing GameClient reaches the native missing-resource branch;
the shared VM writer separately skips a missing VM resource. Its admitted
assignment is exactly `name = literal`. The source keeps its supported-global
allowlist and existing `ingame_ui_up` delivery condition. A complementary
Options-stage system now discards only global assignments while that condition
is false. It runs after the custom input queue is appended, preventing writes
made before UI load from being delivered to a later session. Binding writes
and binding reset use their existing separate queues. An admitted flush also
discards global assignments if its hosted VM is absent, matching the native
shared writer's missing-VM no-op.

`python3 -B scripts/check-options-vm.py` passes 972 original-instruction
cases: 675 reads across all 25 selected controls, 201 file composition/admission
cases, 48 VM-resource/assignment cases and 48 custom caller active/inactive
cases. The reader and matcher include duplicate names, Unicode whitespace,
LF/CRLF, long lines and unreadable input. The current changed replacement
iterator `140dee8f0` is executed directly; its old address or ABI is not reused.
Source guards check the file read, refresh gate, shared home delegation,
preserved assignment queue and complementary UI conditions.

The [manifest](evidence/options-vm/manifest.json) binds all executed
native owner bodies, current read/write tables, filename, caller fragments and
fresh Ghidra identities. [Selected assembly](evidence/options-vm/selected-native.asm)
is canonical for these current storage1/2 caller fragments; the shared Options
event owner and descriptor table are referenced once.

The checks inject existing engine home/file interfaces and library allocation,
formatting, vector growth and final join seams. VM cases stop before its Lua
compiler bridge; caller cases enter after the file call. Actual files,
permissions, native Lua execution, rendered Options behavior and original/rebuilt
comparisons remain runtime checks. Rust regression cases were added but not run.
No compiler, application build or game was run.

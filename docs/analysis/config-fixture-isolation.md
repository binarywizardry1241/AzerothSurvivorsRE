# Config test fixture isolation

Gap **#37** concerns the reconstruction's test infrastructure, not an original-game
behavior change. The historical default-parallel suite reported a missing file
in `native_replacement_uses_extension_tmp_and_keeps_it_on_rename_failure`; the
isolated and serial suites passed.

The two filesystem tests shared `scratch()`, which returned a path based only
on process ID and `SystemTime::now().as_nanos()`. Nanosecond representation does
not promise distinct clock samples. Equal samples in parallel tests select the
same directory and `config.tmp`; either rename or cleanup can remove the other
test's file. No directory was reserved before returning. This is a source-proven
collision mechanism consistent with the historical failure; the original race
was not reproduced in this static repair.

`tests/options_config.rs` now uses a process-local atomic counter and an atomic
`create_dir` reservation. Existing directories are skipped, covering stale
output after PID reuse and independent processes. Only a successful reservation
returns a fixture. The recovered production `write_atomic` temporary extension,
sync/rename and error-retention behavior are unchanged.

A Rust regression requests 32 parallel fixtures and verifies unique, already
reserved directories before independent cleanup. Rustfmt parsed the changed
source, and the diff passed whitespace checks. The regression and original
filesystem suite were **not compiled or run**; confirming the historical
intermittent failure no longer occurs remains validation work under #37.

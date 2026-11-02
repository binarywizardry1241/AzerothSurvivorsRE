# Desktop Saves lifecycle — 0.109.0

Current source export and backup-clock corrections are owned by
[0.115.0 save-operation recovery](menu-persistence-0.115.0.md). This report
retains its historical target; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own combined status.

Gap **#17** is checked against installed EXE SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The live Options Escape path now closes Options and discards its captured
import and notice. It previously cancelled only the confirmation and left
Options open. Done uses the same close operation; reopening also clears the
notice when an external frontend closed the page. Pending settings writes are
preserved.

## Current native contracts and source delivery

The [manifest](evidence/0.109.0/saves-browser/manifest.json) binds current page,
row, confirmation, import/export/directory owners and the four save-related
input branches. [Ghidra observations](evidence/0.109.0/saves-browser/rea.json)
bind the freshly recovered page/input and import owners. The current
[Escape owner](evidence/0.109.0/in-run-bindings/cancel.asm) and
[Options event owner](evidence/0.109.0/in-run-bindings/options-events.asm) remain
canonical shared extracts rather than being duplicated.

Escape `1401901e2..14019025b` gives binding capture first priority. With no
capture and an open Options page, it tail-calls `14000ece0`. That helper clears
the open byte `+1c0`, pending import `+188`, notice length `+88`, capture and
owned page content. It does not branch on the presence of an import confirmation.
The Done action has the same inline disposal. Source
`OptionsState::close` now supplies that shared UI lifetime.

Current action 11 bounds the selected 56-byte file row and reads its complete
UTF-8 contents before storing the owned name/content tuple. Action 14 takes
that tuple and queues its captured bytes; action 15 discards it. File-read
failure retains an earlier pending tuple. The importer `1458a84b0` checks the
trimmed `RSE1:` prefix before decoding, distinguishes `save.not_a_save` from
`save.damaged`, attempts the fixed before-import backup, and calls the ordinary
save writer. The source follows these paths through `PendingImport::read`,
`parse`, `replace`, and `MenuState::import_save`. The separate [current restore report](import-restore-0.109.0.md) binds the subsequent active-file reload, default/saved Pick, normalization and name policy. Source Export also reloads the actual active file, independently of the frontend cache. The export owner `1458a83b0`
obtains the current Save, serializes and seals it directly; a transient picker
edit is not committed by Export. The directory owner `1458a8bd0` appends
`Saves` to the game save-data directory.

The current page still has Export Save, Open Saves Folder, inline confirmation,
Save Files and ordinary Import rows. Its native page/row owners do not add a
separate Restore button. The extension owner `140025a10` accepts exactly three ASCII-case-insensitive
bytes `sav`. The current entry mapper `1400a5fb0` and short ordering owner
`1400f13b0` retain modification-time descending, then filename-byte ascending
order; missing times sort last and equal keys retain their order. The current
save-data directory owner `1458ef170` prefers the parent of `WOW_ROGUE_SAVE`;
when the override is present but has no parent it does not fall through. Without
that override it probes `APPDATA`, `XDG_DATA_HOME`, then `HOME`; the first two
append `wenilla-rogue`, while HOME appends `.local/share/wenilla-rogue`.
The [data-directory extract](evidence/0.109.0/saves-browser/data-directory.asm)
is also canonical for current language-file persistence.

The portable encryption/envelope implementation and OS filesystem primitives
retain their [0.100.1 evidence](saves-browser-0.100.1.md). The current action and
importer traces do not certify every crypto or platform dependency.

## Static checks and limits

`python3 -B scripts/check-saves-browser.py` passes **74 unchanged native
instruction cases**: six Escape-priority, nine close/disposal, twelve directory
policy, seventeen extension and thirty ordering cases. Allocator release,
owned-definition disposal, environment lookups/path primitives and byte `memcmp`
are explicit recorded host seams. Directory tests verify native probe/fallback/
append policy with neutral path fixtures; they do not test Windows path parsing. Action destinations, import/error/directory literals, retained instruction
hashes and the live source routes are checked too. `--stage` recreates candidate
extracts/manifests under ignored `runtime/native-evidence/0.109.0/saves-browser/`
for review.

No Rust compilation/test, application, actual file import/export/open-folder,
installed save/configuration operation or original/rebuilt interaction was run.
Rendering, platform filesystem behavior and complete menu parity remain
unverified. [verification-needed](../verification-needed.md) owns the combined #17 status.

# Native configuration startup load

The verified 0.92 EXE startup function `0x140e88250` calls the stored-config
reader, then handles its result inline. [Hash-bound evidence and instruction
anchors](evidence/0.92/options-config-load-native.json) distinguish the three
paths. The initial recovery was read-only; the source integration is described below.

Absent input skips the file fold. A valid table applies recognized entries and
then retains the entire incoming map at Cvars offset `+0xb8`. Bad input logs its
carried message, drops the message and continues through the shared event drain.
The error path sets neither a persistent write hold nor the dirty byte `+0xd0`.
Boot does not overwrite a malformed file; the independently recovered normal
writer can save after a later change dirties the configuration.

Keys are looked up after ASCII lowercasing. Unknown keys are warned about and
preserved. Session-owned keys are skipped for application while their file values
are retained. A row is numeric if its trimmed default parses as an f32; an
unparseable trimmed saved value is ignored for application. Accepted changed
values replace the applied string and queue the native changed event; unchanged
values do not queue it. Loading does not mark the configuration dirty. The whole
raw map is retained, including entries skipped during application. Later native
writer composition may replace or remove known overrides from the actual applied
and default values.

The native float parser accepts optional signs and case-insensitive `inf`,
`infinity` and `nan`; the load caller adds no finite-value filter. Trimming is
used for numeric validation only: the stored string itself is not trimmed.

The small `0x144fcb120` closure was a false semantic lead. It formats the debug
placeholder for a missing-resource panic rather than applying configuration.
Its closed REA scope and the actual startup branches are retained in the evidence.

The [typed reader/visitor dossier](evidence/0.92/options-config-typed-native.json)
binds `LocalConfig` (eleven bytes), its one exact `cvars` field (five bytes),
whole-result acceptance, unknown-root-field skipping and the default empty map.
The visitor is `0x140c8f030`; `0x1408d0c20` parses TOML then invokes the typed
dispatcher `0x140c937d0`. The target embeds `toml-0.8.23`, matching Cargo.lock.
The source uses that typed deserializer rather than folding an untyped document.
The [String-map dossier](evidence/0.92/options-config-string-map-native.json)
closes the per-entry value visitor, expected-type literal and accumulated-map
cleanup. Non-string entries reject the whole configuration, including unknown CVar keys.
The underlying TOML whole-map DateTime adapter is preserved rather than blocked by
an extra table-only check; DateTime used as an individual CVar value is rejected.

Build24 implements the typed reader, warning/default fallback, raw-map retention
and numeric validation for the recovered menu CVar subset. Reading a bad file
performs no write; a later changed setting can replace it through the normal
writer. The compiled source does not apply unknown/unsupported menu entries, but
retains them for composition. The full native registry, session ownership and
callback/event integration remain incomplete. Display getters' handling of raw
whitespace values also requires reconciliation.

Apple Silicon build25 passed locked/offline in14.34s; all six config fixtures
passed within105 focused harness cases. They exercise type rejection, no read-time
write, later replacement, unknown strings, numeric parsing and the DateTime edge.
Log-only CVar write-failure integration also compiles in25. No original/rebuilt UI launch, installed profile,
malformed original-runtime fixture or new capture was used for this batch.

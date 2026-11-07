# Picker name updates and portrait lifetime

The installed 0.109.0 EXE, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`,
contains a distinct name-only update route in the custom picker. The source now
uses that route: typing a name or requesting a random name updates the existing
name text and caret font without despawning the picker or its portrait image
entity. This completes the bounded source portion of #17's portrait/name lead;
rendered behavior and original/rebuilt parity remain open.

## Native contract

The [manifest](evidence/0.109.0/picker-name/manifest.json) binds the complete
content-update function `0x140078c10..0x140079fa6`, the font helper
`0x140067b70..0x140067bfb`, and the relevant portrait/name construction ranges.
REA/Ghidra evidence IDs, exact PE file offsets, input/extract hashes and analysis
profile digests are retained there. These are newly recovered current-target
addresses, not addresses promoted from an earlier version.

The content owner first observes the existing picker root, name query, cached
Pick/entering snapshot and Save change tick. Full Pick equality, entering
identity and an unchanged Save permit its no-change return. Otherwise, an
unchanged Save and entering byte, an existing snapshot and existing name-text
query permit the name-only comparison. At `0x14007981a`, it clones the current
name independently of the previous snapshot's remaining fields. The comparison
at `0x1400798a1..0x140079a09` consequently checks class, race, sex, appearance,
zone and run modifiers while disregarding the previous name. A change in those
fields, entering state or Save takes the structural rebuild route.

The name-only route then:

- Computes the font size from the current name at `0x140079a0f`.
- Replaces the existing Text string at `0x140079d44..0x140079d4b`.
- Writes the existing TextFont's size at `0x140079d69..0x140079d70` and the
  corresponding child TextFont size at `0x140079e38..0x140079e4e`.
- Replaces the cached snapshot at `0x140079f5c..0x140079fa1` and returns.

That route bypasses the structural branch's selected-zone visibility request,
child reconstruction and picker constructor call at `0x14007973e`. It does not
publish a new appearance or recreate the portrait. The separate constructor
retains the 124×168 portrait-node dimensions at `0x14024e8ad`; no replacement
portrait dimensions were invented for this repair.

The name font helper returns 23px for fewer than thirteen characters; otherwise
it returns `23 * (1 + (count - 12) * -0.03)`, with native single-precision
operations and no additional clamp. The name excludes its separate `|` caret
from the count. Constructor `0x14025017d..0x14025044c` applies the same rule when
initially creating the name and caret. This recovery does not revalidate the
separate name generator, name acceptance, normalization or saved-name parser.

## Connected source

`menu.rs` schedules `picker::sync_name` after input. Changed keyboard-name
batches and RandomName no longer set the structural dirty flag; changes that
already require reconstruction retain it. No immediate save command was added:
name edits remain local Pick edits until the existing commit path runs.

`picker.rs` keeps the name Text, caret TextSpan, focus frame and name button as
separate retained components. The updater changes their text, font and existing
focus presentation in place. The caret's font follows the name font. The
selected-zone visibility key contains hero, zone, run modifiers, entering and
Save revision; name edits cannot introduce a delayed scroll request on a later
resize. Existing appearance/equipment changes continue through `sync_preview`
and the preview renderer's independent look/equipment cache.

This source connection applies to the custom picker. It does not replace the
real client's FrameXML character-selection or run interface.

## Checks and limits

`python3 -B scripts/check-picker-name.py` verifies the whole installed
EXE identity, retained function/data/extract hashes and the source connection.
Twenty bounded native instruction cases exercise the current name-only gate,
retained Text replacement, name/caret font writes and cached-snapshot update.
They include unchanged/changed/empty names, the twelve/thirteen-character
boundary, longer and multibyte names, each hero field, zone, run modifiers,
entering and absent snapshot. The structural cases stop at the rebuild branch;
this check does not emulate its constructor or claim its full correctness.

The two edited Rust files also passed `rustfmt --emit stdout` parsing with
edition 2024 and `skip_children=true`; output remained under ignored `runtime/`.
This is a syntax parse, not a type check or compilation. Scoped whitespace
validation passed.

The check starts after the root/query/Save-change prerequisites, which were
statically traced. Its one dense ECS row and one caret child are explicit
synthetic inputs. String cloning, byte comparison, character counts, allocator
and drop operations use documented host seams; complete ECS scheduling, sparse
queries, stale children, native Unicode counting internals and allocator
ownership are outside the observations. Multibyte/long names test presentation
arithmetic, not the separate input acceptance policy.

Run `--prepare` to stage two exact raw function imports under ignored
`runtime/portrait-0.109.0/`, then run their plans with
`python3 -B scripts/rea-batch.py <plan>`. After completed REA/Ghidra analysis,
`--write` regenerates the curated extracts and native observations. Raw imports
omit referenced callees/data and use generic GCC ABI; the original full-PE
Windows x64 instructions control argument and field interpretation.

No compilation, compiling tests, game launch, UI interaction, screenshot or
original/rebuilt rendering comparison ran. The source lifetime correction and
native observations do not establish that portrait appearance is stable on any
platform, nor close the remaining menu, renderer, font or #41 coverage work.

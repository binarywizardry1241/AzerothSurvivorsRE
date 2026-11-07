# Locale loading and lookup

Selected installed EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This bounded **#169** recovery follows the live translation inputs through
embedded-map construction, external overrides and lookup. The
[catalog report](locale-catalogs.md) owns exact catalog payloads;
[verification-needed](../verification-needed.md) owns implementation and deferred validation.

The [canonical manifest](evidence/0.119.0/localization-loader/contracts.json)
binds current PE byte ranges, independent assembly, journaled Ghidra queries,
direct call edges and RIP-relative address observations. It records historical
instruction-structure comparisons separately: matching instruction layout does
not silently promote the older target's external calls, data or test results.

## Current AS boundaries

Lazy callback **`145b59e40..145b59efb`** reserves fourteen 48-byte maps and passes
the exact descriptor interval **`1475d7350..1475d7660`** to initializer
**`145c13e00..145c141cc`** at `145b59eb8`. The initializer advances by 56 bytes,
reads each JSON pointer/length from descriptor `+0x20/+0x28`, and calls parser
`145b2b1d0` at `145c13ef6`. Embedded parse failure diagnoses the error and uses
an empty entry sequence. Embedded map construction is `145aa77a0`; the subsequent
call at `145c14001` loads overrides for the descriptor's two-byte language code.
Its returned rows are inserted through `145b4bfd0` at `145c140e1`, after the
embedded map. Map publication advances by 48 bytes. This joins the actual
fourteen-descriptor catalog contract to the map consumed by lookup.

Override loader **`145b28e50..145b2959e`** constructs `<code>.json` with the compact
format at `1472ddf80`. Its root sequence first obtains the executable's parent,
then calls the save-directory helper `145ad17e0`; successful roots are appended
without equality filtering. For each, it appends the exact four-byte `lang`
component at `1472ddf88`, then the filename. Read failure skips that file.
Parsing at `145b29283` occurs before entries enter the returned sequence;
malformed files diagnose the error and contribute no partial prefix. Entries
remain ordered by root and file order. The final insertion interface overwrites
matching keys, including empty values, while retaining omitted embedded keys.
The standard filesystem/allocation/hash implementations are shared boundaries,
not a new engine-reconstruction scope or executed OS evidence.
The root helper identities follow the retained
[0.109.0 contracts](localization.md) and current caller structure; this
selected AS recovery binds their current call sites without independently
certifying every OS/path implementation behind those calls.

The current custom flat-object parser is **`145b2b1d0..145b2b86e`**, with string
**`145b275c0..145b27dfe`**, expect **`145b273b0..145b2757e`** and four-byte hex
**`145b26f00..145b273a4`**. Its recovered AS behavior matches the existing source:
repeated initial BOM, SP/HT/LF/CR structural whitespace, string keys and values,
underscore-prefixed key exclusion, empty keys/values, ignored trailing input,
permissive raw controls and Unicode escapes. The four-byte hex field retains
the accepted leading plus, high-surrogate handling masks the next field, and
invalid scalar results become U+FFFD. LF-based diagnostics and whole-file error
results retain their original behavior. Source `catalogs.rs` already implements
these rules; no parser replacement is necessary for the imported translations.

Lookup **`145b29ab0..145b29d2a`** is a current call boundary shared by **#171/#172**.
After map initialization, it reads the TLS block through `GS:[0x58]`. A nonzero
byte at TLS `+0x368` selects the per-recipient index at `+0x370`; otherwise it
uses global `148519260`. The selected index clamps to
`min(index, map_count - 1, 13)`. A 48-byte selected map is searched first;
absence searches map zero (English). Successful lookup returns the stored
pointer and length at `145b29cda..145b29ce2`, including an empty value. Absence
returns a null pointer. Callers decide their literal-key or descriptor fallback;
the lookup itself does not invent one. The older 0.109.0 lookup lacks this TLS
selection, so it is deliberately excluded from structural equivalence claims.
This report does not certify every producer of the recipient override; the
cooperative item-text adapter retains its separate **#101** ownership.

## Connected source and checks

`localization.rs::CATALOGS` includes the fourteen exact current source payloads.
`catalogs::load_from` parses each embedded map, applies executable-parent then
save-directory `lang/<code>.json` maps, and extends the map only after a complete
successful parse. `Localization::lookup` searches selected then English maps.
`menu_catalog` merges those maps in the same priority order, preserving empty
and key-equal values; callers retain their explicit literal/descriptor fallback.
The catalog regression's stale 2,929-key expectation is corrected to 2,979 for
all fourteen languages. Native parser/loader algorithm changes are unnecessary.

The non-compiling replay command is:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs python3 -B scripts/check-locale-loader.py
```

The check passes **10 current native ranges, 10,020 bytes, 2,459 instructions,
2,291 historical instruction-structure checks, ten completed queries and four
exact data spans**. It rehashes the selected installed target, independently decodes all retained
ranges, checks canonical assembly/pseudocode and original query result/journal
hashes, verifies internal relative branches and source interface guards, and
compares prior instruction structure without treating changed external addresses
as semantic equivalence. Historical 0.109.0 native vectors remain historical;
they are neither rerun nor relabeled as current validation.

Ghidra raw imports omit PE globals, external callees and imports, and infer a
generic ABI. Original PE instructions establish the Windows-x64 arguments and
data flow stated here. Standard OS/path/file, allocation and hashing calls are
not executed; arbitrary mutable aliases and complete TLS-producer lifetime
remain outside this bounded result. Compilation, Rust regression execution,
filesystem override I/O, native emulation, client/server/game execution,
linguistic quality, glyph/layout rendering and original/rebuilt parity remain
unverified. Current static correspondence does not close those validations.

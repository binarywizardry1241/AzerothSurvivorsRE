# TrueType table rebuild and font publication in 0.141.0

Installed input `installed-game/AzerothSurvivors.exe`, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`,
151,493,632 bytes. This bounded recovery resolves the [#135 font table
constituent](../verification-needed.md#gap-135) on the installed hash ahead of
full target registration. The earlier [0.121.0 filter repair](font-table-filter-0.121.0.md)
retains its original provenance under #250.

## Dispatch and rebuild

The [0.140.0 table candidate](switch-context-source-review-0.140.0.md) maps to
the nested branch at `0x145dd9057` in the current augmentation function. The
directory parser at `0x145dd6df5..0x145dd6f57` checks the original directory
fields and the payload offset plus length against the input extent before
appending a 24-byte record. Each record has a four-byte tag, a pointer at
`+8` and a payload length at `+0x10`. The modification gate at
`0x145dd84c0` copies the entire input to the success result on zero changes.

On rebuild, `0x145dd8ef5` admits the unsigned first byte `D` through `p`
into the 45-cell table. Its `h` case admits second bytes `d` through `m`
into the nested ten-cell table. Exact suffix comparisons omit `DSIG`,
`LTSH`, `VDMX` and `hdmx` and select independent replacements for `cmap`,
`glyf`, `head`, `hhea`, `hmtx`, `loca`, `maxp` and `post`. The default
copies the original pointer/length payload at `0x145dd91e9..0x145dd9266`
and publishes the original tag and payload to the vector at `0x145dd8ea0`.
The vector reaches the serializer through `0x145dd9277`. The live source
already used these filter decisions and preserved the unchanged-input path.

Two rebuild conditions differed in the live source.

- The accepted original scaler word (`0x00010000` or `true`) is saved at
  `0x145dd6c96`, passed in EDX at `0x145dd9277` and written big-endian
  at `0x145dd63e4`. The source parser now carries that word to serialization,
  which previously wrote `0x00010000` for both inputs.
- The lookup at `0x145dd8c7d` uses the exact `post` tag from `0x1473ab088`.
  A missing table or payload shorter than 32 bytes reaches the error result.
  Otherwise `0x145dd8cb1..0x145dd8d0a` preserves the first 32 bytes and writes
  version 3.0 at the start. The source now requires this table and minimum
  length on the changed-font path. Its previous optional path could publish
  a rebuilt font with an absent or short `post` table.

The existing source `maxp` maxima also match the current writer. The helper at
`0x145dd4d90` retains the larger of the existing field and the supplied
threshold. Its rebuild callers supply doubled simple points/contours with
unsigned saturation, plus thresholds of two components and one level of depth.

## Publication and validation

The native provider at `0x145dda4e0` traverses three 40-byte records at
`0x1473fe5a0`. Friz and Morpheus have the augmentation flag, while Skurri
uses its original bytes. The result gate after the call at `0x145dda54a`
selects rebuilt bytes on success and copies the original bytes on error.
Both routes publish the selected bytes under the same record name through
`0x145dda6f0`. The shipped three input records all use the ordinary
`0x00010000` scaler. The repaired source path also covers compatible external
font inputs admitted by `menu_fonts::read_font`, which already falls back to
the original bytes on an augmentation error. The custom menu's font asset
loaders and `register_framexml` both consume that function. The latter
publishes overrides before atlas initialization.

| Original span | VA start | VA end, exclusive | File offset | SHA-256 |
| --- | --- | --- | --- | --- |
| Augmentation | `0x145dd6ba0` | `0x145dd9659` | `0x5dd5fa0` | `ce90d4aedde08fa245ddb797386b7cf50856b1bd9beec33c02c8c3d319dbe28f` |
| First-byte table | `0x1476f3c64` | `0x1476f3d18` | `0x76f2264` | `d97ead6b7e10b3c1ad2915a1a0368ab658ca88b05be4bb1922239367f8d8e426` |
| Nested `h` table | `0x1476f3d18` | `0x1476f3d40` | `0x76f2318` | `1e34d391a995f7082ae67a16640be5dc1744de10c921ff55caae093eff0906ba` |
| Scaler serialization | `0x145dd6353` | `0x145dd63e8` | `0x5dd5753` | `f2b283177c48913bdaa142c50ea5a61df0556108a31845ccfecfb12f828163fe` |
| `post` lookup | `0x145dd4df0` | `0x145dd4ead` | `0x5dd41f0` | `4270fad46af1c00ec45211e66c3bcdc39ef4db8ba0a55a39dcbf668450b3a72b` |
| `maxp` maximum write | `0x145dd4d90` | `0x145dd4dc1` | `0x5dd4190` | `76c6118af8c18e9051eac3c91249ad09eed080c45392e4edcf19c757c500d125` |
| Provider | `0x145dda4e0` | `0x145dda745` | `0x5dd98e0` | `17a655219064a7ef311eb3c74852eb3426d95c91b93821a4154d72fb669142ba` |
| Provider records | `0x1473fe5a0` | `0x1473fe618` | `0x73fcba0` | `33c69341b2376b9ed287c6406e674eb11a94b763f435aeab88dba5a9c5315fcd` |

The journaled Ghidra raw import maps the exact augmentation extent at its
original VA. Evidence `ev_737b481e0d312a7a175517a7b442a04942b91fd6bdf14634c7e20cfc96f4fd3f`
was available in the session export after the function dossier exceeded the
MCP response budget. The slice digest matched both the provider record and the
query journal. Exact mapped PE instructions and both external tables govern the
dispatch proof because the raw Ghidra slice excludes those tables.

The shared `native_terminal.NativeReplay` harness executed the 256 first-byte
cases and every one-byte substitution of each special tag, deduplicated to
12,506 cases. Four omitted, eight replaced and 12,494 copied. The sorted
`[tag_hex, disposition]` result SHA-256 matches the 0.121.0 replay at
`2e2bea0535de0ab814b93643c2bba9cd26bc6808bd14e8743bff24bbffa8b355`.
Four change-gate, six exact payload-copy, three scaler, six `post` admission
and output, and twenty `maxp` maximum-write cases also passed. The payload
allocator and memcpy were explicit seams. Source call-site checks, pinned
`rustfmt` parsing and `git diff --check` passed. The complete serialized
font bytes, actual runtime loading and rendering, and original/rebuilt parity
remain unverified.

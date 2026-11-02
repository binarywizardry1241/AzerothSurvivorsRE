# Changed-font table filtering — 0.121.0

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This source correction owns **#250**, discovered through #41's bounded
[font-context residual ranges](as-residual-ranges-0.121.0.md). The
[proof](evidence/0.121.0/font-table-filter/manifest.json) binds exact native
instructions, both selector tables, a journaled Ghidra result and the live source.
Earlier [augmentation recovery](menu-fonts-0.109.0.md) retains its original target;
[verification-needed](../verification-needed.md) owns current implementation/validation limits.

## Native condition, original tables and output

The current custom augmentation owner is `0x145ac5ad0..0x145ac852b`.
Successful composite, mirrored-glyph and alias insertions increment the same
modification counter. The gate at `0x145ac7367` sends zero changes to
`0x145ac78ed..0x145ac7973`, which copies the original input bytes to the result.
Positive changes rebuild the font and enter the table loop at `0x145ac7d85`.
The loop reads 24-byte original table records: the four-byte tag at `+0`,
payload pointer at `+8` and payload length at `+0x10`.

The computed branch at `0x145ac7dba` admits the unsigned first-byte interval
`0x44..0x70`; other first bytes take the ordinary copy path. Its 45-cell table
and the nested ten-cell `h` table are bound to current original bytes. Exact
remaining tag-byte comparisons select these dispositions:

| Original tag | Native disposition |
| --- | --- |
| `DSIG`, `LTSH`, `VDMX`, `hdmx` | Advance to the next original table without appending a table. |
| `cmap`, `glyf`, `head`, `hhea`, `hmtx`, `loca`, `maxp`, `post` | Supply the independently rebuilt replacement table. |
| Every other tag | Copy its original payload through the existing allocation/copy boundary. |

In particular, the four omitted tags do not share the eight replacement-table
paths. The default path `0x145ac80a7..0x145ac812a` reads the original payload
pointer/length, allocates the admitted length, copies those exact bytes and
publishes that length in the output vector. The zero-change path separately
copies the entire original input; filtering is not applied to an unchanged font.

## Live source correction

`menu_fonts.rs::read_font` supplies Friz/Morpheus bytes from the existing font
directory or MPQ path to `font_patch.rs::augment`. That function already preserves
the original bytes when neither glyphs nor aliases change. On a changed font,
it rebuilt the eight selected tables but serialized every remaining original
table, including all four tags that the native loop omits.

The correction removes **only `DSIG`, `LTSH`, `VDMX` and `hdmx`**, immediately
after the unchanged-input return and before rebuilding/serializing. Existing
glyph geometry, mapping, replacement tables, other original table payloads and
the provider's failure fallback retain their existing owners. This resolves the
proved table-retention discrepancy through the actual font supply path; it does
not certify the complete generated SFNT byte stream or rendering.

## Static evidence and limits

With the existing Capstone/Unicorn dependencies available:

```sh
python3 -B scripts/check-font-table-filter.py
```

The default verifies the retained proof; `--write` explicitly publishes it.
The check executes **12,506 tag cases** from original instructions: all 256
first-byte values with an ordinary suffix, all twelve special tags and every
single-byte substitution of each special tag. Results are four omissions,
eight replacements and 12,494 ordinary copies. Four modification-counter
cases and six zero/nonzero original-input/table-payload copies also pass,
executing **175,761 original instruction steps**. The source guard verifies
the correction's position after the unchanged return and before serialization,
with the existing provider still calling the augmented source function.

The 933-byte raw Ghidra query is mapped back to this exact EXE and original VA.
Its inferred signature and bad-data/omitted-table warnings are retained; they
do not establish a Rust type or table domain. The original selector/branch bytes
and independently read table entries govern the bounded proof. The modified
font fixture uses synthetic allocation and memcpy seams, never the installed
font supply or filesystem. It does not execute reconstructed Rust, compare
complete original/rebuilt font bytes or render glyphs. No application
compilation, compiling test, client/game/network/server operation or controlled
original/rebuilt comparison occurred. Functional and visual parity remain open.

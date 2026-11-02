# Font inputs and registration — 0.113.2

Target SHA-256 `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [compact proof](evidence/0.113.2/font-inputs.json) owns this bounded
classification under #17/#41 (`B02`, `R01`, `D01`–`D03`). It preserves the
original census/queue populations; it does not close resource or font parity.

## Runtime supply

Users supply compatible font data through `--font-dir /path/to/Fonts` or
`AZS_FONT_DIR`. Use these exact uppercase filenames on case-sensitive systems:

| Filename | Recovered family and use |
| --- | --- |
| `FRIZQT__.TTF` | Friz Quadrata TT, ordinary text; augmentation enabled |
| `MORPHEUS.TTF` | Morpheus, display text; augmentation enabled |
| `SKURRI.TTF` | Skurri; original bytes retained |
| `AZS_NAMES_SC.TTF` | AzS Names SC, Chinese language-name subset |
| `AZS_NAMES_JP.TTF` | AzS Names JP, Japanese language-name subset |
| `AZS_NAMES_KR.TTF` | AzS Names KR, Korean language-name subset |
| `AZS_SC.TTF` | Noto Sans SC Thin, full `zh` font |
| `AZS_JP.TTF` | Noto Sans JP Thin, full `ja` font |
| `AZS_KR.TTF` | Noto Sans KR Thin, full `ko` font |

The source reads classic font paths from the explicit directory, otherwise
the supplied MPQ chain. It uses the directory for the autonym and full CJK
inputs. Missing/invalid supplied fonts retain the source's documented fallback
and warning behavior; compatible fonts are necessary for the recovered glyph
coverage. Both custom text and FrameXML consume the augmented classic inputs.
No original fonts are bundled, and building source never reads the reference EXE.

## Current data and interfaces

All three supported standalone SFNT signatures (`00010000`, `OTTO`, `true`)
were searched throughout nonexecutable PE sections. Ten payloads pass bounded
directory, table/checksum, name, head and global checksum validation. Nine are
the AS inputs above; their complete hashes equal the historical 0.109.0
payloads. That equality does not revalidate old callers or addresses.

The tenth is Fira Mono Medium, 18,848 bytes at `0x1465a9800`, SHA-256
`45131c5e913a5c7b4311101303e3c320a97b93a27a64b7262b533ee0d31ae03c`.
Its bytes exactly match Bevy 0.18.1 `bevy_text::DEFAULT_FONT_DATA`
(`FiraMono-subset.ttf`). Fresh Ghidra observes the current carrier
`0x1432fb9f0` copying that exact span into its font-parser interface. This is
supporting engine-font correspondence; full native generic plugin/type identity
is unestablished, and no surrounding engine reconstruction is needed here.

Fresh Ghidra and original-instruction replay establish:

- Base provider `0x145807ae0` iterates three 40-byte records at `0x146cedcf8`.
  Flag1 sends Friz/Morpheus to augmentation `0x145804200`. Success publishes its
  result; error logs and retains the exact original payload. Flag0 copies Skurri.
- CJK provider `0x145803f90` accepts exactly `zh`, `ja`, `ko`, using the three
  48-byte locale/path/filename records at `0x146c9a3f0`. An available virtual font
  is preserved; a miss copies and inserts the corresponding embedded raw font.
  Cache lookup is `0x145bb9b80`; insertion is `0x145bba390`.
- Autonym prefix `0x14004fd00..0x14004fe4b` inserts the SC, JP and KR subsets in
  that order through `0x1434fa860`. The replay stops before the shared locale tail.
- The 41 composite, two mirror and six alias rows exactly match source constants.
  Their current addresses and hashes are retained in the proof, independently
  located from the current bytes rather than copied from historical RVAs.

## Checks and limits

`python3 -B scripts/check-font-inputs.py` checks ten inputs, rejects
twenty damaged/truncated counterexamples, compares 49 source rows and replays
43 native control cases: nineteen locale strings in both cache states, four
Friz/Morpheus augmentation-result combinations and the three-insert autonym
prefix. Eight fresh Ghidra observations and exact byte spans bind the callers.
Only textual evidence is retained; no font binary is exported.

Allocation/copy, virtual cache and font-database operations are explicit seams.
The augmentation call receives synthetic success/error results; these test
publication and fallback, **not native glyph output**. Current full augmentation,
glyph geometry, generated-font serialization, actual database aliases/lifetimes,
startup scheduling, file access, shaping and rendering remain unverified.
The historical [augmentation report](menu-fonts-0.109.0.md) retains its actual
target. No compilation, source execution, application/game launch or controlled
original/rebuilt comparison ran. This bounded search does not certify all font
formats, compressed assets or every resource producer/consumer.

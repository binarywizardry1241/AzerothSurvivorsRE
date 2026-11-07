# Addon gold texture decoding

This report owns the source/static repair for **#54**. The selected EXE is
0.113.2, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The earlier [screenshot/log/source finding](addon-presentation-gaps.md#54--gold-atlas-rejected-and-replaced-by-white)
retains its original provenance. [verification-needed](../verification-needed.md) owns current
status; this repair does not establish rendered parity.

## Native contract and source change

The current decoder is `0x145c30ed0..0x145c31e46`, 3,958 original bytes.
The [manifest](evidence/0.113.2/addon-gold/manifest.json) binds its installed
offset/hash and scoped Ghidra Evidence. The shared
[canonical decoder assembly](evidence/0.113.2/tga-decoder.asm) is retained once
for #53/#54; no duplicate decoder extract is required.

| Native interval | Recovered contract |
| --- | --- |
| `145c30f77..145c31088` | Type/depth admission. Truecolor types 2/10 admit 24/32-bit pixels without subtracting the descriptor's alpha count. |
| `145c31152..145c312f8` | Raw and RLE payload expansion precedes pixel conversion. |
| `145c317ba..145c31877` | 32-bit row/column origin selection and BGRA → RGBA; the fourth pixel byte is copied unchanged. |
| `145c31391..145c31478`, `145c318dd..145c319c0` | 24-bit orientation and opaque output alpha, including horizontal-origin images. |

The reconstruction's [tga_to_rgba](../../crates/benilla-formats/src/tga.rs)
previously applied a historical Vanilla 1.12 depth-minus-alpha restriction.
Removing that restriction admits the unchanged atlas. Supported 32-bit pixels
keep their actual alpha even when the header declares zero alpha bits; the
descriptor does not make them opaque. Unsupported depths still fail. Both
descriptor origin bits now select source rows/columns as the current EXE does,
including the shared gray/palette conversion path.

The existing [sprite candidate path](../../crates/benilla-assets/src/world_assets/mod.rs)
still resolves loose artwork, sniffs BLP/TGA content and returns successfully
decoded pixels before considering its white fallback. Its authored fixtures
now use an unsupported image type for genuine decoder refusals. Valid
32-bit/zero-declared-alpha fixtures cover raw/RLE candidates and retain
transparent/partly transparent pixels through both refusal policies. The
separate #53 texture-dimension repair owns large-atlas admission; it is not
necessary to admit this 64×64 atlas.

No addon scripts, artwork, settings or atlas UVs were changed. The existing addon
selects the top-left quadrant with `SetTexCoord(0, 0.5, 0, 0.5)`.

## Static evidence and limits

The project-local unchanged `cleaner_coins.tga` copy is 16,402 bytes, SHA-256
`7e2b57533361f224e01171dbc857247b04096fdc33e58364901b230b75b270be`.
Its header is `000002000000000000000000400040002020`: type 2, 64×64,
32 bits, top origin and zero declared alpha bits. Replaying the original decoder
on these bytes produces RGBA SHA-256
`df19b43c5a4b9af721a620bce4b638202b2c6c4004b9a8e23ee8d46361b4a60c`,
with all **172** distinct input alpha values preserved. The manifest separately
commits the selected top-left quadrant. The asset itself is not bundled.

[check-addon-tga.py](../../scripts/check-addon-tga.py) executes
the complete original decoder instructions in Unicorn with explicit
allocation/copy/free/platform-probe seams. It passes **616 valid cases**:
24/32-bit raw/RLE images across all sixteen alpha declarations and four origins,
every pixel alpha value, run packets, and the affected gray/palette orientation
paths. **33 rejection cases** cover unsupported depths/types, short headers and
truncated raw/RLE payloads. Native error formatting stops at its rejection
branches. Ghidra's raw import omits external code/data and infers a generic ABI;
the original Windows-register instructions own the interpretation.

Source guards trace the native admission/orientation to the active decoder and
its successful-candidate-before-fallback route. Both changed Rust modules pass
syntax parsing. Rust regression fixtures are
authored; they are not executed by the native replay. Compilation, reconstructed
Rust execution, actual loose-file/UI/GPU/addon execution and controlled
original/rebuilt gold/crop/transparency comparison remain **unverified**. #54
therefore retains validation/comparison work rather than claiming visual closure.

```sh
python3 -B scripts/check-addon-tga.py
python3 -B scripts/check-addon-tga.py --atlas runtime/menu-state/AddOns/-DragonflightReloaded/media/tex/chat/cleaner_coins.tga
```

`--prepare-rea` stages a fresh scoped plan under `runtime/tga-0.113.2/` for
`scripts/rea-batch.py`; `--collect` stages its compact manifest there for review.
The optional atlas input must be inside this checkout. These commands perform
static recovery and instruction replay only, with no application build/launch.

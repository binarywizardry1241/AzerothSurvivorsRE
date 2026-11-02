# Menu font supply and side-accent metrics — 0.109.0

Target SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the font-source corrections within **#17**; current subsystem
and comparison status belongs to [verification-needed](../verification-needed.md).

## Recovered inputs and consumers

The [current manifest](evidence/0.109.0/menu-fonts/manifest.json) independently
binds all nine supplied menu fonts: Cyrillic Friz/Morpheus/Skurri, three tiny
SC/JP/KR language-name subsets and the three full CJK fonts. Every SFNT table,
global checksum, name record and bounded payload extent passes. Native base
table `146f26d20` registers three 40-byte records, augmenting Friz/Morpheus and
preserving Skurri. The current glyph tables still contain **41 composites, two
mirrors and six aliases**; all entries match the live source constants.

Current CJK provider `1458f8a60` accepts exactly `zh`, `ja` or `ko`, preserves an
already available virtual font and otherwise registers its corresponding exact
embedded payload. The menu keeps its once-only per-locale font registration.
The three fonts remain available after language switches. Custom Bevy text and
real FrameXML retain their existing renderers and metrics.

Native startup `145891530` initializes language state, registers base fonts
through `1458fc5c0`, then resolves the active CJK font. Source previously inserted
its FrameXML font overrides in an unordered Startup system; the real text atlas
could initialize first, copy the unaugmented fonts and never reload. The new
public `FontOverridesSet` orders the provider before the shared atlas's
`FontAtlasInit`. Deferred insertion therefore reaches the atlas before it reads
the font bytes. The existing source startup/asset lifecycle remains the owner.

## Side-apostrophe advance correction

The current augmentation owner `1458f8cd0` treats mode **4** (`ď`/`ť`) specially
at `1458f9f77..1458f9fb4`. It increases the base advance by
`round((mark.xMax - mark.xMin) + unitsPerEm * 0.02)`, clamped to the unsigned
16-bit range, with saturating addition to the base advance. This is independent
of the accent's x placement. Other modes retain the base advance.

The source previously copied the base advance for every composite, allowing a
generated side apostrophe to crowd following text. `font_patch::composite_advance`
now applies the recovered rule before writing the live `hmtx` metric table.
Both `read_font` consumers therefore receive the correction: the custom menu's
font asset and the real FrameXML override. Existing outlines, mapping admission,
bounding boxes and bearing consumers remain unchanged.

## Checks and limits

`python3 -B scripts/recover-menu-fonts.py --check` passes exact source
table checks, nine SFNT input checks, **38 native CJK/cache cases** and **90
native advance cases**, including every mode, negative/positive increments,
rounding boundaries and unsigned overflow. CJK cache/read/insertion and scratch
allocation/copy are explicit host seams. The metric replay executes unchanged
native arithmetic/saturation; CRT `roundf` is an explicit fixture seam. Current
Ghidra identities and compact canonical extracts are in the manifest. The raw
augmentation import's omitted external/indirect context remains explicit;
other glyph geometry/serialization retains its original report provenance.

The new authored Rust regression consumes all 90 native metric vectors but was
**not compiled or run**. No binary font is bundled or exported by this repair.
Users still supply compatible fonts through `--font-dir`/`AZS_FONT_DIR` or their
MPQs. Actual startup scheduling, generated-font byte comparison, shaping/
wrapping, all-language rendering and original/rebuilt parity remain unverified.

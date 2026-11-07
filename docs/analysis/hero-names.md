# Shared Unicode hero names

Selected installed EXE SHA-256:
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This report owns the hero-name constituent of #293. The complete finding also
includes chat, IME routing and mixed-script fonts; their owning work remains
separate in [CURRENT-STATE](../CURRENT-STATE.md#gap-293) and
[verification-needed](../verification-needed.md#gap-293). This recovery replaces
the historical [0.109.0 ASCII name contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/hero-names-0.109.0.md) only for the
selected current name validator, case conversion and picker admission paths.

The [manifest](evidence/0.127.0/hero-names/manifest.json) binds exact current
instructions, code/data ranges, Create result codes and two journaled
REA/Ghidra queries. Discovery used the current adjacent Create error-result
arms and their validator/wrapper calls; old RVAs and old matching prefixes are
not treated as current correspondence.

## Current producer and validation

The Create owner calls `0x145b20960` at `0x145bc3904`, then uses the result table
at `0x147085c3c` to select packet36 codes. Its successful path calls optional
name wrapper `0x145b20be0` at `0x145bc45ee`; that wrapper also reaches startup
and menu/profile callers. It validates, trims through `0x140207170`, then
formats through `0x145b20ed0`.

The validator trims Unicode whitespace from the edges and counts Unicode
**scalar values**, including an interior ASCII space. Its rejection order is:

1. Empty after trimming: packet result `0x45`.
2. Any unsupported character: `0x48`.
3. Consecutive ASCII spaces: `0x50`.
4. More than one ASCII space: `0x4f`.
5. One scalar: `0x46`.
6. More than twenty scalars: `0x47`.

Otherwise it accepts two through twenty scalars. An interior tab or nonbreaking
space fails the character rule. A single valid Chinese letter reaches the
one-scalar result; twenty Chinese letters are accepted despite their sixty-byte
UTF-8 encoding. There is no invented normalization or replacement of combining
marks, punctuation or unsupported scripts.

`0x145b20840..0x145b20954` defines the supported letters. ASCII letters are
accepted directly. Other candidates first pass the selected Unicode Alphabetic
leaf `0x14603d250`. The target then permits Latin1 letters, selected accents in
the exact96-byte string at `0x147045bab`, standard Russian letters and selected
Ukrainian/Cyrillic additions, kana, CJK Extension A/unified/compatibility letters,
and precomposed Hangul syllables. It also allows the Japanese iteration mark
U+3005. The native alphabetic gate excludes holes and punctuation inside those
script blocks. Greek, Arabic, fullwidth Latin, emoji, combining marks, joiners
and supplementary-plane CJK are rejected.

The full BMP scalar sweep, plus supplementary boundary cases and the explicit
outside-BMP fallback, establishes **39,648 admitted scalars in 37 intervals**.
The source stores those exact intervals in `NAME_LETTER_RANGES`, avoiding a
future host Unicode-property update silently widening the target's name rule.
Their full values are retained in the native fixture and checked against source.

## Case and typing admission

`0x145b20ed0..0x145b21243` decodes each scalar and applies Unicode uppercase to
the first scalar and each scalar after ASCII space; other scalars receive
Unicode lowercase. It consumes a second element of the conversion iterator.
Only a conversion with exactly one scalar is used: an expansion retains the
original character. Thus `éLÈNE` becomes `Élène`, `ИВАН ЁЖ` becomes `Иван Ёж`,
`ßETA` becomes `ßeta`, and `Iİ` stays `Iİ`. It does not apply a full-string
Unicode titlecase operation or insert the expansion's extra characters.

The current picker owner `0x1401f63a0..0x1401f6a0f` calls admission helper
`0x1401e0ba0` at `0x1401f6711`, `0x1401f67a3` and `0x1401f6872`; its changed-name
path calls the same titlecase helper at `0x1401f6985`. Admission counts the
current scalars, uses the same supported-letter predicate, and appends letters
only below twenty. A space requires a current length of one through eighteen
and no prior ASCII space. UTF-8 append writes two/three/four bytes as required;
the twenty limit is not a byte limit. The source's existing `append(&mut String,
&str)` processes a committed text batch one scalar at a time, retaining those
conditions across the batch. A nineteen-scalar Chinese draft accepts only the
first supported scalar of a longer committed batch.

`hero_name.rs` connects these rules through `normalize_roster`, optional
`normalize`, `titlecase` and `append`. Existing Create, Pick normalization,
startup-name and menu-state consumers already call those interfaces. Window
composition-event routing and active-input preedit presentation are separate
#293 consumers; this name repair does not itself establish that platform/IME
behavior or font rendering has run.

The current [Windows IME boundary](evidence/0.127.0/hero-names/windows-ime-boundary.json)
also rules out an inferred platform workaround. Message0x281 clears
`ISC_SHOWUICOMPOSITIONWINDOW` from its `lParam` before `DefWindowProcW`;
message0x10f handles IMM result/preedit processing and returns a handled zero.
The outer callback preserves that result and skips its default-procedure call.
These instructions match the inspected existing Winit boundary; the reconstruction
retains the same default composition-window suppression. Eight bounded
scratch cases check the mask, handled-zero result and outer return selection;
actual platform composition/candidate display remains unverified.
The same evidence binds the native virtual-key mapper: `VK_PROCESSKEY` becomes
named Process, while `VK_RETURN` remains named Enter. Eight additional original
mapping cases pass across four layout identifiers. This supports the exact
Process-key filter; the virtual-key events emitted by an installed IME during
composing Enter remain a runtime question.

## Static checks and limits

Run the existing checker without compiling or launching an application:

```sh
python3 -B scripts/check-stock-lifecycle.py --current-names --verify
```

It passes **63,494 scalar-predicate cases**, **63 complete validator/optional
normalizations**, **18 complete titlecase cases** and **165 complete append
cases**, executing **24,127,352 unchanged original instructions** in synthetic
memory. It executes the current trim, UTF-8 counters, predicate/alphabetic leaf,
word iterator, Unicode case table lookup and conversion iterator. Allocations,
capacity growth, byte substring/search and byte comparison are explicit seams;
the replay guard rejects modified or unreviewed instructions and writes outside
scratch memory. The target EXE is an input, not an executed game process.

The checker verifies exact current code/data and result tables, query
input/plan/journal/result receipts when present, the connected source and source
syntax through rustfmt. Historical lifecycle/name fixtures retain their actual
0.109.0 provenance and are not retagged as current. Authored Rust regressions
consume the new current fixtures and include a multiscalar committed input
batch; they have not been compiled or executed. No build, client, game, server,
network session, actual IME interaction or original/rebuilt parity comparison
was performed.

## Retained reports

[0.109.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/hero-names-0.109.0.md)

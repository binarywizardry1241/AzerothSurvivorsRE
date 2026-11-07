# Card Skip binding

Installed EXE SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
This review covers #304 and [R01310-02](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.0.md#r01310-02).
The stored-level command remains independently owned by #21.

## Binding and caption

The native Options constructor writes the eight-byte command `AZS_SKIP`
at `0x1401b782f` and resolves the four-byte localization key `Skip`.
The edit branches at `0x1401a57c6` and `0x1401b7efa` distinguish this
command from the ordinary binding map. The Skip edit adapter at
`0x1401a5cf0` serializes the selected keys with a space separator and
writes the `skipKey` CVar. Key Bindings Defaults writes `X` at
`0x1401b85c3..0x1401b85d6`. The Cards owner independently registers the
same default at `0x14020d306..0x14020d322` and parses its saved
whitespace-delimited key list.

The option reader resolves display text from the first key at
`0x14020d4f0..0x14020d50c` and caches it in the Skip resource.
The footer checks the cached caption length at `0x14035c4b6` and calls
`0x14021a470` with its text at `0x14035c4f7`. That helper constructs
the separate key badge using 11-point text. An empty key list leaves the
Skip action visible on a skippable hand and omits the badge.

The rebuilt editor inserts the virtual Skip row in Azeroth Survivors and
uses the existing saved CVar lane for assignment, removal, and Defaults.
The ordinary binding map retains ownership of `X` → `SITORSTAND` and
`Y` → `AZS_OPENLEVELS`. Both local and guest footers use the same key
caption and rebuild it when that caption changes.

## Card admission and delivery

The Cards input producer enumerates fresh keyboard presses, canonicalizes
the modifiers as `ALT-`, `CTRL-`, `SHIFT-`, and compares each complete
chord with the configured strings using length and byte equality. Its
result is stored at Skip resource offset `+0x30`.

The keyboard consumer at `0x140228200` requires a nonempty hand, no closing
or confirmation state, and no keyboard capture. It checks the Skip resource
byte and the skippable hand bit at `+0x79` before reading digit or reroll
shortcuts. Skip requires ordered age ≥ **0.45 seconds**, including rejection
of unordered age. A matching Skip request on a skippable hand takes this
branch even during entrance, when the command itself is still withheld.
An admitted press emits native command tag 5 and exits the keyboard pass.

The pointer branch at `0x14022a5f6..0x14022a645` sends the same tag 5 to
the same `0x14024ed80` command queue. Both paths write the closing flag and
start clock, leaving every card on the unselected exit leg. The pointer
path checks closing again before applying a deferred card selection.

The rebuilt input walk admits the contextual chord only for a presented,
skippable hand and gives the ordinary binding map the chord everywhere else.
The solo and host paths invoke the existing Skip transaction. The co-op
guest uses the existing Skip control with the visible offer's identity and
starts the exit only after outgoing queue admission. Both paths retain the
current hand through the exit before opening the next revision.

## Static evidence

| PE virtual range | Range SHA-256 | Ghidra evidence |
| --- | --- | --- |
| `0x1401a5cf0..0x1401a5fbd` | `518de994e5ce87aabedd40a862a384a902b442bf599546b1b0eb3c676d17a135` | `ev_9e2591b5bde662046a1db59780f4398a3dab351195e8e4efc5b7e3584e7f79e6` |
| `0x14020d2c0..0x14020ded9` | `e580a641c1709e742ef3fadbb3644909bdbd1769547f9364c0d3ee43cb1d430a` | `ev_c6b33877cd46a3abf8fda81368b4caee7cfef4e62ba3985fb37e14add7e1b05e` |
| `0x14000d610..0x14000d78c` | `b3e2ae53de700e5f57e2ad65fc76d259c3900e2b3c35d1a24e28280917aefc96` | `ev_008a60719d1088fe7cead17f769fbeb22288bbe776e9b6af02118f3c28928135` |
| `0x140228200..0x1402286c1` | `00ae077e039422bcccd6a1008cc929af5b88bded4d0c7d6a2bf71c5ac47bee5e` | `ev_2e7c4e2e18303d0b049e2cbe48b2f44cdf52e0eb2364691fe468753b2461bf89` |
| `0x140229e20..0x14022a749` | `85ba26f6253f83c229643dfb11d7a901f19facb89e511544202cb6ed0107f70a` | `ev_55952879edfb8670ac18accfe81bf7377fae3872763029aec9ac613ca2e7d54d` |
| `0x14021a470..0x14021a898` | `5ddd2d47797910fb7c64b7c0022e638d508a1e4638a32220ad7e459b31b60f40` | `ev_83b428836fb3afc01fd6be947ef8410a51852b57b661c721c402c541a6cf6494` |

The shared Ghidra query journals, result digests, and raw ranges match the
installed image. Original instructions confirm the immediate operands,
branch targets, and the common pointer and keyboard queue call. Static
source tracing confirms the contextual and ordinary routes, and the guest
offer-bound Skip consumer. Source tests cover virtual binding edits, ordinary
binding fallthrough, keyboard ordering, and consecutive hands. Compilation,
test execution, game and network execution, and original/rebuilt interaction
remain open.

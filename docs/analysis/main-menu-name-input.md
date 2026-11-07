# Picker name production and editing

This report records 0.92.0.

The target SHA-256 is `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
Exact native addresses, REA Ghidra Evidence IDs, original fragment-table offsets and values
are retained in [picker-name-native.json](evidence/0.92/picker-name-native.json).

The picker Random action at `0x140125b70` calls the 413-byte producer `0x14011a6f0`.
It combines one of20 prefixes,16 middle fragments and10 suffixes. A fresh call seeds a64-bit
xorshift(13,7,17) from current UNIX nanoseconds XOR `0x9e3779b97f4a7c15`; the three
indices are `%20`, `&15` and `%10`. The output is limited to12 characters. No class, race,
sex or MPQ NameGen table participates. Native observed names Aryath and Ulira agree with
the extracted fragments (`Ar`+`ya`+`th`, `Ul`+`ira`+empty). The two empty suffix entries
are intentionally preserved. `recover-menu-names.py` reproduces the46-fragment extraction.

The original initial-picker builder `0x1401120b0` generates a name only when the normalized
selection's default name is exactly `Hero`. It does not regenerate every empty input when
focus is lost. Native `0x140128fe0` accepts logical Character events containing ASCII letters,
up to12 characters, and logical Backspace removes the final character. After each changed
batch, `0x14011abc0` lowercases ASCII and capitalizes the first character. Empty and
one-character intermediate names are permitted while editing.

The separate validator `0x145402fe0`, reached by native save import and launch selection,
trims Unicode whitespace, requires2..12 ASCII alphabetic characters, and applies the same
ASCII capitalization. Invalid launch names invoke the same random producer.

The owned implementation now uses `hero_name.rs` for Random, initial Hero replacement and
live keyboard filtering/capitalization. It removed the provisional race/sex NameGen sampling
and the preview system's empty-name side effect. The pure helpers include deterministic
integer-trace vectors and normalization/filter cases; the parent's build14 focused bin test run passed all three name checks. Exact name-edit save timing, invalid-name launch behavior and keyboard focus/Enter
handling still need native/rebuilt interaction comparison. Recovered code/data do not establish
complete menu parity.

# Raid producers and ground-object radius — 0.112.0

The current native visual-radius lookup adds **spell 11683 → 10.0**. The live
`bosses::abilities::native_spell_radius` now includes that override, so the
dynamic-object producer uses `radius / 10` as its visual scale for this spell.
Unknown spells still use scale 1. The target is installed 0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.

The current lookup `14596ca90..14596cbb8` has twenty supported spell IDs.
Its `11683` comparison at `14596caf9` branches to the 10.0 return at
`14596cbaa`. The actual dynamic-object helper `14592bcd0..14592c4bb`
calls this lookup before writing scale field 4. The existing real object path,
shared wrapping counter, GUID, player ownership, spell, radius and position
fields are unchanged by this source correction.

`scripts/check-raid-hazards.py` executes current original instructions
with synthetic state. Its [manifest](evidence/0.112.0/raid-hazards/manifest.json)
records 163 reachable action producer cases, ten transformation-field cases,
fourteen marker-kind cases, 192 movement-admission cases, seventy radius
boundary cases and 480 dynamic-object constructions. The radius cases include
the signed 32-bit partition, every comparison boundary and adjacent inputs,
all twenty IDs and unknown values. Object cases include spell 11683, positive,
zero, negative and NaN radii, two positions, two player GUIDs and counter wraps.
Every source override is compared with the native lookup; actual object fields
and scale bits are checked separately.

The producer cases cover native tags 3, 6, 9, 10, 11, 13, 14, 15, 16, 17, 25,
26, 29, 31 and 33, including recursively reached records. The common hazard
constructor executes as current bytes. Intercepted terrain, cast/hold, range,
zone and Windows CRT helpers are listed separately; unlisted direct or
computed calls fail before execution. These cases do not establish dedicated
line, bomb, shield, wave, volley, minion or shared actor-frame completeness.
The complete current graph, generic durations and initial-request tower filter
retain their [canonical owner](raid-native-0.112.0.md).

[Ghidra provenance](evidence/0.112.0/raid-hazards/rea-provenance.json) binds
completed 12.1.4 raw imports for the current lookup and dynamic-object helper.
Their raw input and pseudocode hashes are independent of the instruction
fixtures. Raw imports omit external data/code and full-image callers;
decompiler types and generic compiler conventions do not establish the Windows
ABI. Current assembly and explicit seams own the exact conclusions.

Run `python3 -B scripts/check-raid-hazards.py` for the non-compiling
check. No compiler, compiling test, game process, rendering/audio comparison or
original/rebuilt parity check was run. Full encounter and presentation parity
remain open under #42/#43.

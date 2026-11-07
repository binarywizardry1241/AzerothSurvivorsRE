# Death Recap

The [evidence manifest](evidence/0.139.2/death-recap.json) binds #300 to
`installed-game/AzerothSurvivors.exe`, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [0.139.1 renderer correspondence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-interface-correspondence-0.139.1.md)
retains its original scope. Full 0.139.2 coverage remains under
[#41](../CURRENT-STATE.md#gap-41).

## Capture and payload

The incoming-damage owner `0x145ef0a80` writes one 72-byte entry after
armor and shield handling and the health subtraction, before retaliation or
lethal protection. The entry contains three string pairs (source name, attack
name, icon), clock, damage, shield absorption, signed remaining health,
maximum health, source rank, and a mechanic flag. The deque at Game
`+0x7c8` evicts while it holds 400 or more entries or its front is older than
clock minus ten seconds, then appends. The independent window filter at
`0x145fc1490` traverses both ring segments in order and includes the
ten-second boundary.

The five direct call sites distinguish melee, hostile spell impacts, and
mechanics. The latter include ward explosions, delayed radius impacts, and the
existing aggregated raid-area damage call. The raid-area accumulator carries the
selected source and impact spell together. The delayed radius caller carries
the same source GUID and spell ID to both its visual and incoming damage
consumers. The capture resolves source names from the live actor pool at hit
time, using the existing enemy, boss, and object localization keys and ward
templates. The `0x145e1c850` helper supplies localized Melee, Spell, or Boss
mechanic and its fallback icon when it cannot resolve a spell. Nonzero spell
IDs use the base name in Spell.dbc column 120 and the SpellIcon.dbc path joined
through Spell.dbc column 117. A known name with no icon uses
`INV_Misc_QuestionMark`. The rebuilt source shares the engine spell catalog
with the damage adapter and retains the base name independently of the
localized tooltip name.

`0x145e05590` emits an empty object for an empty window. Otherwise it keeps
the newest hit ungrouped for `killer` and takes overkill from the negative
remaining health. It groups adjacent hits with the same source and attack
names when the gap from the last hit is at most one second. A group sums
damage and absorption and retains the latest hit's age, health fraction, and
identity. `hits` shows the last eight groups, oldest first. `by` aggregates
the same pair across the whole window, sorts by raw damage descending with
stable ties, and publishes up to six rows. The three totals cover every
selected record, with avoidable damage drawn from the mechanic flag.
The builder calls `roundf` on JSON damage, absorption, maximum health and
overkill values after accumulation and ranking. Ages and health fractions
remain fractional.

The live incoming path records those fields and freezes the built recap
after the lethal rescue gates. Per-hero history, frozen recap, and generation
move with the existing party hero state. Successful revive clears the frozen
recap so the next fall can publish its own generation.

## Recipient and view

The party downed producer `0x145ef4480` writes `type:downed`, `left`, and
`recap` to the local event queue. The terminal producer `0x145f075d0`
adds `recap` to the defeat summary, with an empty object when the hero left
or has no eligible records. The shared terminal path calls that producer for
each swapped recipient. Game `+0x718` drains through `0x145edbe00` to the
recipient-tagged driver queue, whose wire variant 9 carries the original
EventBytes to the matching peer. The separate cross-hero queue can publish a
party banner. The guest cache attaches only its own terminal defeat recap.
A private event arriving after the terminal State refreshes presentation
without replaying reward or account settlement.

The end screen's `0x140337d00` owner uses `0x1402c2c90` for the killer
strip and `0x1402bf0d0` for the Death Recap button. The modal coordinator
`0x1402ecd50` admits the nested recap and killer objects with a matching
terminal generation and clears its open latch on invalidation.
`0x140371760` and `0x1402bfdd0` supply the canvas, final blows and damage
by source presentation. The rebuilt terminal view uses the existing button,
canvas, texture and input paths. Close and Escape dismiss the recap before
underlying pause and terminal actions. Downed and final defeat remain separate
events, and the end screen owns the recap control.

## Static validation

The manifest records selected original PE ranges and journaled Ghidra evidence.
Raw slice decompilation omits external dependencies and can infer incorrect
signatures. Original Windows x64 instructions, string lengths, and call-site
arguments govern the interpretation. For response-limit results, the runner's
complete retained evidence bundle supplied the pseudocode.

The original window filter passed 135 isolated cases over split ring order,
the inclusive time boundary and unordered values, totaling 26,754 instruction
steps. The replay used synthetic records and intercepted allocation. The
source and exact localized strings were checked statically. Compilation,
network and gameplay execution, rendered presentation, and original/rebuilt
parity remain [unverified](../verification-needed.md#gap-300).

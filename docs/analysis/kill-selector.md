# Talent cooldown-reset selector

[Finding #141](../verification-needed.md#gap-141) and the [native
receipt](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.139.2/kill-selector.json) cover the selected seven-cell
runtime selector of the installed EXE, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

The generic effect dispatcher at `0x145f533a0` clones the active 64-byte
effect rows and retains their original indices. Its effect-10 handler admits
event kind 2, the kill event, and splits the selector at effect-row offset
`+8` into the low-byte tag and its argument. The selector at `0x145f53c95`
admits the unfiltered case directly, compares the event school where
allowed, treats basic attacks and pet sources separately, and calls
`0x145f4a3d0` for the key, key-list and cast-kind branches. The lookup
compares both primary and alternate spell IDs in the class and active
ability records.

The indexed float behind Game `+0x70/+0x78` is the effect row's deadline.
A deadline strictly after the current clock skips the action. On admission,
the owner sets it to `now + effect.duration` and clamps matching learned
primary-spell timers to 0.05 seconds.

The existing kill-event producer, effect-10 branch of
`generic_event_with_demons`, `EffectRow::matches_event` and learned-ability
lookup already supply these rules and preserve per-row deadlines. The
source check established correspondence for this selected handler.
Wider talent and allocation contracts retain their own evidence. Rebuilt
gameplay and original/rebuilt comparison remain open.

## Kill reset and Prepared selectors in 0.141.0

The [current evidence](evidence/status-talent-selectors.json) binds
the shared talent extent `0x145f8e670..0x145f92a55` to installed SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The two tables use different inputs and have different consumers.

- The seven-cell table at `0x145f8ebbd` implements kill cooldown reset
  for native effect tag 22, represented by source tag 10. The outer table
  enters through `0x145f8eb58`, admits kill event kind 2, and reads the
  selector from effect-row `+8`. The native wildcard and pet cases also
  test Game `+0x2a2/+0x2a5`. The current Hunter producers identify the
  Matriarch-hit flag and the pet attribution mode at those offsets.
  The keyed cases use the ability lookup. On admission the handler writes
  the indexed deadline at `0x145f919cc` and clamps matching learned
  primary-spell timers to 0.05 seconds.
- The nine-cell table at `0x145f927b4` handles Prepared use by class
  under [#315](../verification-needed.md#gap-315). Its index comes from
  Game `+0x464` minus one. The class-6 cell is a no-op and the Druid check
  is separate. The admitted path rechecks the Prepared loadout at
  `0x145f92a2e` before setting Game `+0x10e6`. The live
  `note_prepared_event` matches the recovered class predicates. The
  reconstructed solo path rechecks the loadout at tick entry and at the
  award. No intervening ordinary solo loadout change was found in source.

The generated amulet owner at `0x145e0bae0` dispatches on the ability
descriptor byte `+0x75`. Cell 7 of `0x14771b05c` reaches
`0x145e0c4b9`. This branch generates The Reaper's Amulet and writes its
second 64-byte row with raw effect 22, selector 1, the descriptor's
key pointer and length, and f32 0.5. The recovered 115-row ordinary
catalog contains exactly three kind-7 descriptors, Execute (5308),
Eviscerate (2098) and Backstab (53). These match the three retained
source amulet rows and their keyed learned-ability route.

### Authored rows and live admission

The nine talent class descriptors at `0x147719bc8` have three trees each.
Walking the effect vectors of their 351 talents found two raw-22 rows among
431 effects. The ordered 64-byte records hash to
`424185a74ae5fbb68994bf2def06c4aa997afddad28c6bede1d10df00f44a8bd`.
The Rogue class-4 tier-3 set cell reaches `0x145e3489a`, which emits the
Darkmantle row with a duration of one divided by the set multiplier.
The explicit effect writers and typed data reviewed for the equipped
talent, amulet and set paths yield these rows.

| Equipped producer | Native selector and key | Per-row interval |
| --- | --- | ---: |
| Reaper's Amulet | 1, one row each for Execute, Eviscerate and Backstab | 0.5 s each |
| Mortal Wounds, `0x1476fbf28` | 2, Mortal Strike and Execute | 1 s shared by both keys |
| Kill Shot, `0x147704270` | 1, Aimed Shot | 2 s |
| Darkmantle, `0x145e3489a` | 1, Eviscerate | 1 s ordinary, 1/1.5 s empowered |

The source talent, amulet and armor-set records supply the same seven rows.
Selectors 1 and 2 reject source kind 2 and match the definition's exact key
or membership in the key list. The wildcard selector requires zero
attribution mode and no Matriarch flag. The pet selector additionally
requires source kind 2. Hunter command and ordinary pet producers establish
the meaning of these flags. The known authored rows use only selectors 1
and 2. The wildcard and pet cells have no admitted producer in this scope.

The lookup at `0x145f87e20` rejects spell ID zero, then matches primary or
alternate spell IDs in order across the class pool, learned records and
104-byte timed-cast records at Game `+0xd0/+0xd8`. The last vector receives
ordinary ability definitions at run entry and from the equipped raw-39
collector on refresh. Its tick constructs a free instance and dispatches
the cast through the common ability owner. The live counterpart is
`AbilityScheduler::tick_timed`. The current Warrior, Hunter and Rogue
class pools contain all five authored reset keys, with primary IDs 12294,
5308, 19434, 2098 and 53 and zero alternate IDs. The source resolves those
events through its class or learned definitions. The selected rows have
no dependency on the timed fallback.

The kill handler admits a deadline equal to the current time, writes
`now + duration` into the effect's indexed Game `+0x88/+0x90` lane and
clamps only learned instances whose **primary** spell ID equals the killing
event's spell ID. Mortal Strike and Execute share one admission clock but
each readies its own spell. The normal cast loop stores infinity before
dispatch at `0x145f62797` and combines the timer present after dispatch with
the newly computed interval at `0x145f63384..0x145f633a9`. The source already
preserves that ordering in `generic_event_with_demons` and
`tick_cooldowns`. This connects the same-cast reset described in both
0.61.2 claims. Rebuilt cooldown display, gameplay and parity remain open.

| Current native range | File offset | SHA-256 |
| --- | --- | --- |
| Selector predicates `0x145f8efa3..0x145f8f051` | `0x5f8e3a3` | `2dc2048c5f747e9a435ce6b597dae1692e16c65f86bc24173f72045b3ce7d6ee` |
| Definition lookup `0x145f87e20..0x145f87faf` | `0x5f87220` | `35dfa322736df67a7623ee08734b0008c44c8be4da63558b8db907962905e53c` |
| Mortal Wounds `0x1476fbf28..0x1476fbf68` | `0x76fa528` | `d00fb76dd70b48e8c796f2803721fad327de0593a59d78b10c1cd11cd31dea81` |
| Kill Shot `0x147704270..0x1477042b0` | `0x7702870` | `021fd4f466c09dbdd0091394ed9e365403339411c6bad681cb4940d4a02bb948` |
| Darkmantle `0x145e3489a..0x145e34909` | `0x5e33c9a` | `01b941960f935dfdbfe2ad0c6a61155ea518473deb3ef87bd5a80e3fcac78bf8` |
| Final scheduled timer `0x145f63384..0x145f633a9` | `0x5f62784` | `718137644639bc75a03ba742d1253e7606242934880912534fc9075f9375f9df` |

Ghidra 12.1.4 lookup evidence
`ev_664307a9a92b9592322d7108f449120847ccf0d61197a4e50e59f409e6d98dd3`
binds the 399-byte lookup slice to the range above. The raw-slice result
omits the external class and ability data. Original PE instructions and
records establish the pointer targets and Windows x64 call arguments. The
journaled lookup result hashes to
`e9003d81dc486aa2142b850e598db2373eb9dc4f954e4ac6c443f5647478f0a5`.
Static comparison matched selector, key or key list, and duration bits
for all seven authored source rows.

Bounded instruction emulation passed 8,316 cases across the seven
authored rows and synthetic wildcard, school, basic-attack and pet
selectors. It varied event kind, source kind, attribution mode, Matriarch
state and deadlines before, at and after the run clock. Checks covered
matching and unrelated learned timers and preserved an already shorter
timer. The external byte comparison used exact byte equality in the
harness. Compilation, gameplay and original/rebuilt parity remain unverified.

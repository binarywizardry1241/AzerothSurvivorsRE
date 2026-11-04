# Talent cooldown-reset selector in 0.139.2

[Finding #141](../verification-needed.md#gap-141) and the [native
receipt](evidence/0.139.2/kill-selector.json) cover the selected seven-cell
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

The [current evidence](evidence/0.141.0/status-talent-selectors.json) binds
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

The broader native lookup checks active records at Game `+0xd0/+0xd8`.
The wildcard and pet conditions are absent from the generic source
selector. The recovered ability-derived amulet branch emits neither
condition. Whether another producer reaches those conditions or depends
on the active-record lookup remains open. Prepared's event-time gate
remains a separate ordering proof.

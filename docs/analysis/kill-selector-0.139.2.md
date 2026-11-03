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

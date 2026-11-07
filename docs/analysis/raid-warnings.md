# Native encounter warnings and speaker names

This bounded **#43** source repair uses installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/raid-warnings/manifest.json) binds the current
warning sites, literal bytes, dispatcher and exact packet/name helper ranges.
It does not certify complete encounter or custom cast-widget ownership.

## Warning producer and presentation route

The current action dispatcher `1459578e0` selects these exact localized
templates. The selected direct control-flow paths reach the listed native
action's warning stage; this is not proof of global/indirect ownership.

| Native action | Warning selection |
| --- | --- |
| 15 | `%s's gaze sweeps the field!` |
| 22, payload word0 = 0 | `Destroy them before they hatch!` |
| 22, payload word0 = 1 | `%s is healed by its wards! Destroy them!` |
| 22, other payload word0 | `%s is shielded by its wards! Destroy them!` |
| 25 | `%s's tether drains you! Get away to break it!` |
| 26 | `%s fixes its gaze on you! Do not move!` |
| 28 | `The ground burns around you! Stay inside the circle!` |
| 30 | `You are the bomb! Carry it into the horde!` |
| 33 | `Stand in a crystal to weaken %s!` |

The native28 producer finishes pool creation before loading its 52-byte
warning at `14722ae70`. Common tail `14595b19d` localizes the template with
`1458ec500`, keeps the original English pointer/length when translation is
missing, and calls `1458c1260` before enqueueing the packet. Other selected
warning tails use the same constructor, including the ward-kind selector.
The warning is separate from `SpellStart` and ground-marker messages.

`1458c1260` serializes `SMSG_MESSAGECHAT` (`0x96`) with type
**RAID_BOSS_EMOTE (`0x5a`)**, language 0, a length-prefixed NUL-terminated
inline speaker name, target GUID 0, a length-prefixed NUL-terminated body,
and chat tag 0. It leaves `%s` slots in the body. The real chat/FrameXML
consumer owns their speaker substitution and display.

`bosses/raid_warnings.rs` now holds the recovered warning selection/text.
`RunAnnouncement::raid_warning` sends that intent through the existing
`RunEvent::Announcement` → `SessionEvent::Chat` path. Individual encounter
producers must emit at their recovered warning stage; the connected native28
call is owned by the [pool repair](raid-pools.md). Available templates
alone do not establish that their mechanics are implemented.

## Speaker localization repair

Current `14590d9a0` formats boss names as **`boss.{id}.name`**, ordinary and
guardian names as **`enemy.{id}`**, and uses localized `Enemy` when neither
definition is present. Missing translations retain the definition's name.
Its boss branch has an active primary-state tag at actor+`0x18` and reads
the definition at actor+`0x30`; the ordinary/guardian branch reads the
definition at actor+`0xf8`. Compact format bytes are retained in the manifest.

`AnnouncementLabel::enemy` incorrectly used `enemy.{id}.name`, so localized
guardian/ordinary speakers silently fell back to English. It now uses the
native `enemy.{id}` key. The warning template and speaker remain independently
localized, preserving `%s` for the actual consumer. Regression source covers
the localized guardian, raw speaker slot and type/GUID/tag fields.

## Static checks and limits

`python3 -B scripts/recover-raid-warnings.py` passes **15 complete
native packet-constructor cases**, **9 native speaker-name cases**, **18
common-tail localization/fallback cases**, and **6 native ward-kind cases**.
It checks the selected dispatcher CFG, every retained literal and all nine
templates in **14 locale catalogs**, plus the connected source intent and
consumer. [Packet/name vectors](evidence/raid-warnings/packet-vectors.json)
retain the compact results, including Unicode and buffer-growth boundaries.

Unicorn executes original instructions using synthetic allocation, byte copy,
formatting, localization and vector-enqueue seams. It does not execute the
EXE process or reconstructed Rust. Fresh Ghidra raw imports of the packet/name
helpers reached a bridge-handshake identity error; no successful fresh
decompiler result is claimed. That tool failure is not evidence about the
game's behavior. The byte ranges and instruction checks above are current-target
evidence, independently of historical announcement extracts.

A bounded inspection of the retained current HUD imports and cast-related
strings did not establish the separate custom boss cast-widget producer,
consumer or layout. The real creature `SpellStart`/Casting/animation path is
connected, but that does not establish such a widget or prove one is absent.
Custom cast-widget recovery, omitted warning producers, engine rendering,
compilation, gameplay and original/rebuilt presentation parity remain open.
No compiler, compiling tests or game was run for this repair.

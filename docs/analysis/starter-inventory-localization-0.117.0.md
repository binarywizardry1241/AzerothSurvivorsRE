# Starter item tooltip names — 0.117.0

Finding **#162**, selected EXE SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
[verification-needed](../verification-needed.md) owns current implementation status. Armory's
separate Starting clothes control is **#159**. This finding concerns the actual
item-template producer, independently of that menu control.

Current starter constructor `145ab5be0..145ab6144` formats `starter.{id}`,
looks up that exact localization key and falls back to its descriptor's English
name. `gameplay/client/inventory.rs::definition` instead passed the literal
English name to `MenuCatalog::label`. Existing `starter.*` translations and
overrides therefore did not reach that item-template name producer.

The [current ItemQuery bridge](evidence/0.117.0/item-query-bridge/contracts.json)
proves the relevant connection. Dispatcher `145af93e0` bounds opcode `0x56`
through the table at `1472db538`; selected entry 11 reaches `145af9682`.
The parsed requested ID reaches metadata constructor `145ab6630` at
`145af9e97`. Its ordinary `1..99999` branch calls the starter constructor at
`145ab6a71`. The resulting name pointer/length reaches the actual response
record and serializer `145b66370` at `145afa9b1`. That serializer writes opcode
`0x58` and copies the selected name bytes unchanged. The response reaches the
existing sender `145b1a8d0` through `145afaa88..145afaa95` / `145afbd5a`.

The source repair shares Armory's native `starter.{id}` lookup and direct
descriptor fallback. Both equipped baseline publication and ordinary queued
ItemQuery requests use `definition`, then `Item::template`; existing client
cache and tooltip consumers receive the corrected name through their normal
path. The recipient-specific cooperative inventory publisher/query adapter
uses the same constructors with that member's locale. No cache-reset or
alternate naming behavior is introduced.

`python3 -B scripts/check-item-query-names.py` checks **404 original
instruction cases**: all **66** starter definitions, **21** tabards and **14**
cosmetics, each with an absent ID key plus literal-name decoy, Unicode ID-key
translation, explicit empty translation and a value equal to the ID key.
It executes the actual current metadata constructors and known-definition
ItemQuery response branch, capturing the logical result at serializer entry.
The literal-prefix/u32 formatter, locale lookup, allocation/copy and empty
effect-list formatting are explicit seams. Name, ID, class/subclass, display,
quality and inventory type are compared individually. Opcode selection, name
copy and sender edges are separately bound to current bytes. The current
journaled raw-case query retains ABI/external-data limits and explicit truncated
out-of-range exits; it does not establish a complete dispatcher.

Compilation, actual source/client/cache/VM/tooltip execution, runtime locale
switching and original/rebuilt parity remain unverified. The check executes no
application, network, server or filesystem/save scenario.

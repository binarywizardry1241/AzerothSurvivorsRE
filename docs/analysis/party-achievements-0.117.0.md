# Party achievement eligibility and persistent delivery — 0.117.0

The installed 0.117.0 EXE is 145,283,072 bytes, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
This is the owning source-connection report for **#157**. The fourteen catalog
definitions, composition predicates and Co-op tab are owned separately by #114;
cooperative zone-history parsing/serialization is #115. Runtime and parity
remain unverified for all three scopes.

## Native route

The host does not send achievement keys through a new message. It replicates
an optional party context in State15, including shared boss-kill records with
the membership captured at each lethal hit. Each admitted recipient evaluates
the same shared facts against its own account and writes newly earned keys.
Its ordinary private killing-blow history need not contain the kill.

The [producer contract](party-achievement-producer-0.117.0.md) establishes:

- Current member order is local first, then retained remote order. Abandoned
  heroes are excluded; downed and victorious heroes remain members.
- A member records its class, uniquely highest-ranked spell (zero on a tie or
  empty ability list), and Tranquility/Bladestorm talent bits.
- Membership is refreshed after the shared clock advances, before simulation.
  Lethal hits copy that cached membership before death callbacks.
- The wrapping death counter belongs to the shared world. Cooperative deaths
  increment it; abandon/disconnect, rescue and consumed extra lives do not.
- The maximum-modifier flag requires density/health/damage/speed at least
  `500/500/300/150`. Presence requires co-op mode and a retained remote row,
  independently of the filtered member list's length.

The [wire contract](party-achievement-wire-0.117.0.md) owns exact encoding,
count guards, five-member caps, kind normalization and current-zone validation.
The recipient retains the optional context rather than reconstructing it from
damage meters, lobby roster, current HP or its private kill history.

The [delivery evidence](evidence/0.117.0/party-achievements/manifest.json) binds
three complete native functions:

| Owner | Selected contract |
| --- | --- |
| `145b16870..145b16aec` | A state must exist; selected GUID must not be `0xffffff`; local showcase is excluded, while a guest bypasses that local restriction; admitted phases are 1–5. The snapshot carries zone, clock, normalized kills, guardians, caches, won/bare/full-reward flags, histories and party context. |
| `145af9030..145af9103` | Evaluate run feats, save only when new keys were inserted, then publish those new notifications. |
| `145b154f0..145b15a17` | Consume account snapshots, record won zone history and cooperative history only when context is present, evaluate run/account predicates, save, then publish newly earned keys. |

Current key/date writer `145ac2a90..145ac2ca2` returns the earned-set insertion
result. It stamps a date only for a newly inserted key when dating is enabled;
an existing date is not overwritten. Previously earned undated keys stay
undated. [Writer evidence](evidence/0.117.0/party-achievement-delivery/writer.json)
binds that contract. `145aca3e0` remains the established account save-I/O boundary.

End18 clears the cached state and rebuilds the saved hero in native order.
Neither its direct receiver nor teardown calls an achievement writer. This
repair preserves that boundary; it adds no speculative offline grant, late
teardown transaction, new acknowledgement, or new packet tag.

## Connected source

`gameplay/mechanics/party_achievements.rs` selects exact member facts.
`mechanics/coop.rs` refreshes the cached members, publishes the shared context
for every swapped hero and retains validated guest context. A remote row
temporarily borrowed by `with_party_hero` still counts toward context presence;
a two-player party must not lose its context while publishing the guest. `BossState` owns
the shared history/counter outside hero swaps. `hit_boss` records every lethal
boss event before death callbacks; `incoming.rs` counts irreversible co-op
deaths independently of later revival.

`coop_publish.rs` already evaluates `game.native_state()` in each actual
recipient's hero context and sends State15 to synchronized, nonclosing clients.
The common shared history is therefore paired with each recipient's own class,
zone and scalar state. `gameplay/coop.rs` applies the current validator before
copying the complete state into its Mechanics instance. Existing disconnect
and End paths continue discarding that context with the run.

The regular `account_delivery` path calls `progression::grant_party_feats`
using the actual zone ordinal, run snapshot and shared context. It applies the
non-tester/active-run/showcase-or-guest gates, records cooperative victories and
evaluates the associated account-history predicates. It reuses
`Save::grant_achievements`, so replaying state does not duplicate awards or
change their original dates. `MenuState::commit_account` queues immutable
backend snapshots for the existing ordered `Save::write` consumer; live picker
state is not substituted for the recipient's account.

Only accepted new keys become `RunEvent::Achievement`. The existing client
consumer supplies localized chat, sound, addon banner and toast. Separate
recipient saves and network delivery still require later execution; source
connection is not a claim of successful disk/network operation.

## Static validation and limits

`scripts/check-party-achievements.py` replays current native delivery
spans, retained Ghidra receipts and the selected source connections. The
producer/wire checkers separately verify their canonical extracts and data.
Rust syntax parsing is non-compiling. Authored recipient regressions cover a
non-killer receiving the shared feat, duplicate dates, save parse round trips,
cooperative victory history and recipient admission; they remain unrun.

Raw-slice Ghidra omits external PE data/callees and infers uncertain ABI types.
Exact instruction/call operands, current table/producer recovery and source
tracing provide the bounded evidence described here. No compilation, Rust
tests, game/client/server operation, sockets, filesystem save execution,
rendering, gameplay or original/rebuilt comparison was performed. Broader
native completeness and runtime/parity remain under #41/#63 and the owning
feature findings; no additional source omission is identified in this selected
party-award route.

# Startup and ordinary frontend lifecycle — 0.109.0

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/stock-lifecycle/manifest.json) binds the selected
PE instructions, tables, fresh REA/Ghidra imports and source owners. This report
owns the startup/authentication/world-link portion of **#9**;
[verification-needed](../verification-needed.md) owns the integrated finding and its limits.
The [historical stock frontend](stock-frontend-0.105.0.md) and
[Tester startup](tester-startup-0.105.0.md) retain their actual target provenance.

## Startup and error boundaries

Current selector `14000eb00..14000ec9f` distinguishes default custom picker,
ordinary GlueXML and explicit positional realm/character startup. A character
argument selects factory `1458cf500`; a lone zone selects the ordinary realm
without a transient character. The exact-one environment comparison remains
`140001779..14000179f`. Ordinary frontend constructor `145890450` supplies the
retained fixed local credentials and realm/character environment inputs.

Factory `1458cf500..1458d056a` independently confirms ASCII case-folded class
keys, Warrior fallback, removal of spaces from the race definition rather than
the supplied token, class-specific race eligibility, and the transient
`Tester` row with GUID `0xffffff`, level one and zero result/appearance fields.
Current realm helper `1458d07b0` calls the exact lowercase zone-key parser
`14588d0d0`; unknown or differently cased/whitespace tokens select Elwynn.
The source's positional startup and process-lifetime row remain connected to
the shared GlueXML roster/entry consumer.

Driver `1458eea30..1458eeb85` allocates the name `rogue-server` and starts a
detached worker. Allocation failure reaches the allocator failure owner;
thread-spawn failure preserves the OS error and panics with
`spawn the rogue server thread`, `driver.rs:26:10`. Success closes the detached
native handle and releases retained join state. There is no custom error dialog
or retry arm in this owner. The in-process reconstruction schedules its local
simulation directly, so it does not add an error screen for an absent worker.

## Current credential and proof contract

Ordinary frontend constructor `1458904b9..1458904e9` supplies `HERO` and
`survivor`. Each new server auth connection separately embeds `survivor` at
`1458add6b..1458add75`, stores that String at realmd state `+18`, and passes
that field through `1458f1824/1458f3267` to current normalizer `14590c6d0`.
The submitted account is normalized at `1458f31f8`; there is no `HERO` equality
restriction in that path. Invalid normalization falls back to `A` internally,
while the current client rejects such inputs before proof generation.

Client logon `14061686f/1406168b6` calls `14104b6c0` for both credentials.
Both current normalizers require 1 through 16 UTF-8 bytes, printable ASCII
scalars `20..7e`, ASCII uppercase and no whitespace trimming. Length errors
and non-ASCII/control characters reject; spaces and printable punctuation are
accepted. The local source predicate preserves that admitted domain and accepts
a case-insensitive `survivor` password for any admitted account.

Current client proof owner `145a4c0b0`, called at `140618d29`, compares all 20 M2
bytes at `145a4c424..145a4c44c`. A mismatch returns the error variant at
`145a4c489`; logon consumes that variant as an ordinary failed connection.
There is no invented server AuthReject byte in the local adapter. The bounded
check executes the actual comparison/result code for a match and every changed
byte, with already-derived M2 inputs. It does not execute or certify SRP or its
hashing, randomness, transport framing or timeout behavior.

## Separate authentication and world lifetimes

The current client request tables establish these distinct operations:

| Request | Current native consumer | Result |
| --- | --- | --- |
| Realm Close | `145ea27bc[2] -> 140626c61` | Stay at character select; preserve its world link |
| Realm Leave | `145ea27bc[3] -> 140626c70` | Drop the world link and return to the retained logon |
| Character Abandon | `145ea27a4[4] -> 140626d6b` | Drop the parked world session and return to credentials |

The sibling table entries reach the actual Enter/Create/Delete/Enumerate packet
owners. Their shared parked-action table `145ea27cc` distinguishes StayPut,
Leave and Repark; these are not interchangeable cancellation labels.

Enter World calls `145a175e0` from `14062833c`; that owner drops the held
realmd transport and clears its presence word. The world link and retained
credentials/session key survive. Current realm-query owner
`140624950..14062506d` first tries the held stream. An absent/failed stream
reaches `140624da3`, copies retained credential inputs and calls
`1406167a0`; successful reauthentication replaces the held Logon record at
`140624f31..140624f96`, then publishes its realm rows. It is therefore necessary
to distinguish an absent pre-logon credential state from a closed realmd stream
with retained credentials. Native socket/cryptographic failure bodies are not
executed by the static checker.

On every new auth connection, server tick `1458ad720` projects the current
roster and clamps the captured count to 255 at `1458ada1f..1458ada39`. The
realmd parser reads that retained auth snapshot. Ordinary Create/Delete refresh
the world roster without changing an already open auth connection's count;
a later query that actually reopens authentication captures the new count.
World listeners derive their zone from ports 8085 through 8096, with index zero
for an invalid port. The client retains the selected realm record separately
from the server's port-derived zone. An unknown selected GUID reaches the
current roster iterator's return without publishing a character-login failure;
the source preserves that silent outcome.

## Connected corrections

`stock_frontend.rs` now retains credential, realmd-stream and world-link
lifetimes separately. The shared GlueMgr forwards CloseLink/realm Close through
`CloseLogon`, and the backend ignores that close over retained character select.
It previously treated realm Close as a full Abandon and discarded the captured
realm list and authenticated character-select destination.

World cancellation/realm changes clear only the world link. Full Abandon or a
new authentication supersedes the old link and drops its queued replies.
Character enumeration, creation, deletion and entry require an open world link;
stale requests after Abandon can no longer mutate the account or arm entry.
A new Authenticate later in the same drained request batch is still processed.
Canceling/superseding a link also disarms its deferred `MenuState` entry before
the gameplay schedule can consume it. Completed in-world runs are outside that
pending-entry operation; terminal Menu and Again retain the existing world link.

A pre-logon realm refresh now reaches the existing GlueMgr failed-query arm.
Enter World closes the logical auth stream; the next realm query with retained
credentials recaptures the current count exactly once, then keeps that snapshot
for subsequent queries. The source adapter still uses the existing fixed-password
credential predicate rather than opening an SRP/socket worker.

## Static validation and limits

`python3 -B scripts/check-stock-lifecycle.py` passes **509 unchanged
current-instruction lifecycle/auth cases**: 144 Tester factory inputs,
276 current client/server credential inputs, 21 M2 comparisons, 20 realm-key/name
results, eight startup mode combinations, six exact glue results, three parked
cancellation actions, nine auth-count boundaries, 17 port-zone boundaries,
three allocator/thread outcomes, closed-stream redial admission and
absent-roster silent return. The checker's separate `--scope names` passes
81 cases for the [shared name contract](hero-names-0.109.0.md); `--scope all`
executes all 590. The one shared replay implementation avoids duplicating
selected-target memory mapping, hash guards and connected native dependencies.
All retained native/text digests and the selected live source guards are checked.
Declared seams replace allocation, copy/vector growth, byte search/comparison,
roster element destruction and thread-builder outcomes; no unreviewed native
callee, filesystem, OS thread, socket or game executes.
`--prepare-rea` stages reproducible selected-range Ghidra plans under ignored
`runtime/`; it does not start analysis itself.

The changed Rust owners and updated save fixtures syntax-parse with the project rustfmt; the Python
checker syntax-parses and `git diff --check` passes for these changes.
Rust compilation and regression execution, game launches, original/rebuilt
interaction/rendering and gameplay parity were intentionally not run.

This covers the connected logical startup/park/cancellation boundaries, not
the complete native driver, engine or realmd implementation. Exact worker
scheduling, socket packet framing/buffering/backpressure, cryptographic SRP,
OS thread/port errors and complete external/indirect engine ownership remain
platform and whole-image limitations under **#41**. Those unused worker details
are distinct from the connected logical source contracts repaired here. Raw Ghidra imports
cannot recover every indirect jump without PE data; original PE instructions
and tables govern the selected contracts, and the manifest identifies those
decompiler limits. These static results do not certify network or UI parity.

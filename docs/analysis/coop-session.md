# Direct co-op session driver

The selected target is 0.115.0, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [wire/state contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-replication-0.115.0.md),
[bootstrap](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-bootstrap-0.115.0.md) and
[logout ownership](coop-logout.md) own the native evidence.

`coop/session.rs` accepts all nineteen native envelopes, expands bounded raw
DEFLATE batches, retains partial transport writes, and queues original opcode
and payload pairs. Host receive limits count outer TCP frames, including a
compressed frame as one; guests drain all available frames. Host writes obey
the native 1/60-second gate. Guest writes are unthrottled. Rejected peers expire
only after their receive queue reports no further frame.

Handshake, normalized profile, actual world insertion and synchronization remain
separate transitions. A host queues the real initial world before setting a
client synchronized. Engine commands require synchronization. An accepted slot
byte remains distinct from an actual simulation actor index and world GUID.
Roster publication uses the real normalized profiles in connection order.

`coop_runtime.rs` uses the exact native packet ownership classifier on encoded
engine bytes. Private packets reach only their assigned, synchronized actor;
shared packets reach all synchronized peers. Native event projection determines
the copied hazard/banner messages. The renderer registration boundary publishes
actual objects before the buffered movement/cast queue, then drains custom
messages before Update metadata. Application shutdown and upstream loss have
explicit owners. Native guest logout flushes Disconnect16 and closes its link;
End18 returns to the lobby while retaining the link.

The ordinary production CMSG encoders preserve guest target and conditional
movement tails. The host observes its real controller stream and relays only
admitted positions. Query-time remains the native local exception. Per-hero
commands and the actual world providers belong to the
[application integration](coop.md), not the transport.

Focused native/static checks and Rust syntax parsing pass. Rust regressions are
authored but uncompiled/unrun. No socket, application, multiplayer session or
original/rebuilt comparison has been executed by this work.

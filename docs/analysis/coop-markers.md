# Shared hazard-tick occupancy

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [manifest](evidence/0.115.0/coop-markers/manifest.json) binds current receiver
`1401116e0..140112b87`, three focused instruction extracts, five JSON keys,
fifteen selected instruction sites and its completed durable REA/Ghidra query.
The [transport report](coop-transport.md) separately owns the peer-event
projection which removes local `in` and adds `keep:true`.

## Recovered gate and repair

The current `hzt` branch reads its clock at `140111869`, writes the native clock
and receipt time at `1401118d8`/`1401118e9`, and applies optional `m` movement
before reaching `140111b60`. That block looks up the four-byte key `keep` at
`145ef1f47` through the same JSON getter. It requires native JSON tag 1 (Bool)
and a nonzero Boolean value. A true value releases that message and jumps to
the next-message loop at `1401117e0`.

Missing/null/non-Boolean values branch to the ordinary `in` handler at
`140111c70`; Boolean false takes that same branch. The occupancy loop separately
skips rows whose fade state is active at `140111e77..140111e7c`. True `keep`
skips the occupancy replacement even if a packet also carries an explicit `in`
array. It does not prevent clock or movement updates.

The reconstructed [receiver](../../crates/azeroth-survivors-re/src/raid_markers.rs)
previously always replaced non-fading occupancy from `in`. A forwarded co-op
`hzt`, whose local input list had deliberately been stripped, therefore cleared
local tower occupancy. The receiver now performs the exact
`value["keep"].as_bool() != Some(true)` admission around that replacement loop,
after its existing clock and movement work.

This is a bounded current-target repair. Other renderer/shape/color/fade
contracts keep the provenance and limits in the
[historical 0.109.0 report](raid-markers.md); their existing source is not
relabelled as fully revalidated by locating this new receiver.

## Validation

`python3 -B scripts/check-coop-markers.py` passed. It verifies current
owner/extract/literal/instruction hashes, the two branches to ordinary `in`
handling, the true branch to the next-message loop, the actual `keep` key
address and source ordering. The completed query result digest was checked
before promotion. Full raw query results and derived function bytes remain
ignored under `runtime/coop-transport-0.115.0`; only the necessary selected
extracts are retained here.

Two authored Rust regressions cover actual `forward_to_peers` output decoded
through `Markers::receive`, preserved local occupancy alongside movement/clock
updates, explicit conflicting `in`, six false/non-Boolean cases, and fading-row
exclusion. Existing no-`keep` behavior remains covered by the receiver's older
regressions. The changed Rust file passed syntax/format parsing with the
existing local `rustfmt`; these Rust tests have not been compiled or executed.

Raw-slice Ghidra omits external functions/data and guesses a generic GCC ABI;
the selected native instructions, literals and branch displacements establish
the contract. No native execution/emulation, game, network session,
compilation or original/rebuilt comparison was performed. Actual marker rendering
and cooperative game-session parity remain unverified.

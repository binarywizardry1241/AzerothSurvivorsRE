# Cooperative protocol/version admission — 0.117.0

Finding **#163** was discovered while connecting **#113/#157/#118**. Target
SHA-256 is `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The [compact proof](evidence/0.117.0/coop-handshake.json) binds the actual
server-party admission body and current Hero serializer. Runtime and parity
remain separate from these source and instruction contracts.

This is historical 0.117.0 evidence. The [0.118.0 version repair](coop-handshake-0.118.0.md)
owns the newer admission change; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status.

The current host admission block `145b1b2ee..145b1b328` requires protocol **5**,
a seven-byte version, and exactly **`0.117.0`**. Mismatches branch to the existing
version rejection before password/capacity/run-state admission. The source previously
used protocol 4 and `0.115.0`, which rejected the current target's handshake.
Both shared constants now connect outgoing `JoinRequest::current` and
incoming `PartyServer::admit` to the selected version. Other admission rules
retain their existing owners.

Protocol 5's Hero payload also adds the cooperative-luck f32, serialized after
the companion leash/paws bytes and before the three option bytes. The current
serializer calls the f32 writer at `145ab01d3` for Hero `+17c`; the source keeps
its exact 32 bits in `NativeHero::cooperative_luck_bits`. Its earned producer,
per-hero configuration and co-op-only stat consumer belong separately to
**#118**, whose [earned grant and stat implementation](united-front-0.117.0.md)
now supplies the actual per-hero value. The structural field and parser order
remain independently verified here.

`scripts/check-coop-admission.py --contract hero-fields --native` checks current bytes, retained
Ghidra receipts, source producer/admission/codec connections and **427** original
instruction cases covering protocol boundaries, earlier versions, length/NUL
and every single-bit version mutation. `--allow-pending-source` is an explicit
evidence-preparation mode, not source-completion proof. A Rust wire regression
also retains finite and NaN payload bit patterns; it is authored and unrun.

Raw-slice Ghidra has external-data/callee/ABI limitations. The bounded replay
executes only the selected comparison block with synthetic memory and stops
before password handling. No compilation, client/server process, socket,
service operation or original/rebuilt comparison is part of this check.

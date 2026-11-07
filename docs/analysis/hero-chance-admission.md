# Hero equipment-chance admission

**#164** is a distinct source discrepancy found while tracing **#118** through
the current Hero admission owner `145ae1990..145ae232d`, SHA-bound by the shared
[native proof](evidence/0.117.0/united-front.json). It concerns the existing keen
equipment-chance field `Hero+178`, not the new cooperative-luck field `+17c`.

The earlier reconstructed source replaced an incoming NaN with zero. The native sequence at
`145ae1d0c..145ae1d17` uses `MAXSS(0,x)` and at
`145ae20ce..145ae20da` uses `MINSS(0.1,x)`. These operand orders retain the
input's NaN payload and negative zero; ordinary negative values become positive
zero and positive values above 0.1 become 0.1. Current opcode-Hero admission
calls this normalizer before storing the accepted profile. Its output supplies
the existing equipment-chance grant consumer.

`coop_profile::sanitize` now uses ordered lower/upper comparisons and otherwise
retains the original float. Rust's NaN-discarding min/max helpers would not
preserve this native boundary. No broader input-admission policy is inferred.
The new cooperative-luck lane remains a separate raw-bit-preserving field.

`scripts/check-united-front.py --native --keen-source` verifies the exact
source branch and ten original-instruction admission cases: signed zero, the
upper boundary and its next representable value, negative values, infinities,
and signed/quiet/signaling NaN payloads. The same script's 1,024 party-luck cases
belong to #118. The old 0.115.0 report retains its actual target and earlier
interpretation; it is not promoted to current native proof.

This is a source and bounded-instruction repair. Compilation, real network or
client/server admission and original/rebuilt parity remain unverified.

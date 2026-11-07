# Selected-call interface classification

Target SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
installed 0.113.2, 141,932,032 bytes. Parent **#41**, selector `Q41-P01`.
The original 245 selected-owner unresolved-call records remain unchanged:
244 records name 21 static targets and one is the separately classified XInput
call. The [original routing/alias proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/evidence/0.113.2/q41-p01-aura/report.md)
retains their exact target/caller partitions. This report classifies four more
bounded interfaces accounting for ten of those original records; it establishes
no additional AS source defect or whole-system equivalence.

The [proof](evidence/0.113.2/q41-call-interfaces.json) retains the original routing
records separately from the new classifications, current native ranges, fresh
REA/Ghidra bodies/Evidence IDs and 153 synthetic instruction cases. Run
`python3 -B scripts/check-q41-call-interfaces.py`; `--stage` writes a
candidate under ignored `runtime/analysis/history/findings/q41-call-interfaces/3d285c807f09/`. Original current
probe plans/responses remain there. No application or compiled code is built.

| Target / original records | Bounded result |
| --- | --- |
| `0x144bf4410` /1 Pad caller | Trampoline to `0x144bfc300`. The observed caller `0x14014181c` supplies tag 0 followed by RGBA `(0.973,0.824,0.416,0.6)`. The selected leaf copies the four words unchanged. Existing `native_input/focus.rs` has that same linear-RGBA constant. Other conversion variants and complete UI-element identity are not recovered. |
| `0x145a3dce0` /3 local-auth callers | Trampoline to `0x145a483b0`. Current decompilation contains `num-bigint-0.4.6`/`biguint/power.rs` and zero-modulus checks, with unsigned limb arithmetic. This is classified as supporting big-unsigned power/modulus library context. No complete mathematical or authentication contract is claimed or implemented. |
| `0x145a4abe0` /1 local-auth caller | Reads a storage pointer, skips sentinel `-1`, decrements its counter at `+8`, and on zero requests deallocation with size 0x170/alignment 0x10. The concrete Arc/Rc/type/ownership identity is unclassified. |
| `0x145cdf070` /5 configuration callers | Loads RCX through the first argument and tail-dispatches through the resulting pointer's slot`+0x18`. Each selected caller admits only low-two-bit tag 1, subtracts 1 from the encoded payload and marks the moved destination with byte 3 before dispatch. The actual runtime payload/table/method identity remains unclassified. The earlier “dynamic drop” label was a routing candidate. |

The Pad converter's fresh Ghidra body owns only its 70-byte dispatch head; the
observed copy case remains beyond that body. The counter-release body's fresh
Ghidra set includes the 32-byte entry and a separate five-byte deallocation
trampoline, rather than every byte of its 94,669,360-byte span. These observations
are retained explicitly and do not replace the original full-image census.

The configuration gate replay starts after the caller has selected its tagged
result state. It covers all low-bit combinations using synthetic values and
stops before dereferencing an actual error-owned object. The seven-byte tail
forwarder is tested separately with supplied method tables, preserving its
forwarded RCX/RDX/R8/R9 values. This proves the admitted ABI and move/gate
prefix, not the concrete method or an entire I/O/error cleanup protocol.
Actual filesystem results can supply runtime-owned payloads; those identities
are absent from the static selected-call evidence. No new AS behavior is
inferred from an allocator/import/compiler helper alone.

The 153 cases comprise 48 tag 0 bitwise copies (including signed zero, infinity
and NaN words), 12 sentinel/counter/storage states, eight synthetic method
forwards and 85 configuration gate states across all five selected sites.
Allocator and method endpoints are intercepted. No Rust, real controller/UI,
Windows/filesystem error, authentication, network or game execution occurs.
Native byte checks and source-constant inspection do not establish rendering,
source/OS execution, concrete dynamic aliases or original/rebuilt parity.

These branches stop at the necessary shared interfaces. No generic color,
allocator, reference-count, bigint, auth/server or engine implementation is
reconstructed. The concrete configuration payload/method and general
semantic/source/alias inventory remain open under #41; no census/selector
count or original P01 denominator is reduced. Existing [language](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.113.2.md),
[aura](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/evidence/0.113.2/q41-p01-aura/report.md), [picker artwork](picker-equipment-art.md),
[race-image](race-portraits.md) and [configuration](legacy-config.md)
proofs retain their own exact scope. The zone-key/guardian arithmetic route is
separate from these four interfaces and retains its own recovery obligation.

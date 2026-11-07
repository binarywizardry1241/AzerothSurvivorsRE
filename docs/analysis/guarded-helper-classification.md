# Guarded helper-table classification

Selected EXE SHA-256:
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
The [manifest](evidence/0.120.2/guarded-helper-classification/manifest.json)
classifies the nine previously pending helper-table selectors in the
[geometry comparison](evidence/0.120.2/guarded-table-correspondence.json).
The other four unmatched geometries retain their existing trust, party,
service-pump and wire-parser findings. The fourteen retained correspondence
tables are a separate population and are not reset or repeated here.

These nine tables are supporting lifetime or transport dependencies. Their
classification establishes no new missing AS mechanic and requires no gameplay
source replacement. The [unknown queue](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/unknown-recovery-0.120.2.md) and
[CURRENT-STATE](../CURRENT-STATE.md#gap-41) retain broader #41 ownership.

## Exact classifications

Each site below retains its stable `Q41-F01:table-geometry:<site>` selector.
Addresses are preferred virtual addresses in the selected EXE; range ends in
the manifest are exclusive.

| Dispatch site | Reviewed owner / range | Classification |
| --- | --- | --- |
| `145afd95c` | `145afd910..145afda9f` | Owned enum-value cleanup. |
| `145bf386c` | `145bf3820..145bf39af` | Owned enum-value cleanup, called from the service pump and its cleanup path. |
| `145c4ed20` | `145c4ece0..145c4ee4c` | Owned enum-value cleanup. |
| `145c6ce2c` | `145c6cde0..145c6cf6f` | Owned enum-value cleanup. |
| `145bfa69b` | `145bfa620..145bfa8ea` | Parent-frame conditional cleanup. |
| `145bf2711` | `145bf2530..145bf27ef` | Transport error-kind extraction, followed by the native `0x23` retry predicate. |
| `145c0006e` | `145c0002c..145c00103`, inside `145bff3f0` | Error-kind extraction after send owner `145bfd410`, followed by the native `0x0d` predicate. |
| `145c001aa` | `145c00150..145c00230`, inside `145bff3f0` | Error-kind extraction after `145bf2530`, followed by the native `0x0d` predicate. |
| `145c00f70` | `145c00f49..145c01003`, inside `145bff3f0` | Error-kind extraction admitting native kinds `0x16` or `0x0d` before calling `145bf2530`. |

The four cleanup owners normalize a negative niche tag with
`0x8000000000000000`, use selector 10 for ordinary nonnegative values, and
guard their eleven-cell tables at 10. Their branches release owned dynamic
fields or iterate 200-byte elements through nested drop owner `140502770`,
then release the backing allocation through `1400021d0`. Every direct call
and external tail in these four exact ranges is one of those two lifetime
interfaces. No AS gameplay command, packet send, account update or UI operation
is established by these tables. The exact source type of every monomorphized
copy is not inferred from equal layout alone.

`145bfa620` derives its frame from the second argument, checks the overall local
drop flag and per-field flags, then releases a buffer, drops a nested value
through `140337280`, or delegates to `145bf3820`. Its nine-cell selector is
the adjusted enum tag. It is a cleanup branch, rather than another service
message dispatch or newly missing source operation.

The four remaining tables select one of four low-two-bit error representations.
Their cases extract the kind from an inline field, a custom error field, an
upper word or platform-error mapping through `145f867d0` and its returned
function pointer. The subsequent numeric predicates belong to the existing
transport error interface. The retained source uses `std::io::ErrorKind` and
Tungstenite's `Error::Io`, including retry, idle-read and error-return paths.
This classification does not reconstruct the allocator, standard-library error
representation, TLS library or whole socket worker.

## Source and proof limits

The source-first review inspected `DirectoryResponse` / `WireLobby` owned
`String` and `Vec` values and the existing `coop/websocket.rs` and `coop/tcp.rs`
adapters. Rust owns collection destruction; the transport adapters already
consume library I/O errors. Their presence alone is not claimed as whole-module
native correspondence. No source discrepancy is proved by these nine sites.

Seven journaled Ghidra pseudocode queries reuse the shared full-PE Program.
The full `145bff3f0` result over-expands an unrelated computed switch into data
and reports bad instructions and apparent read-only writes. Those regions are
not used. The three selected local table branches, producer calls and numeric
predicates are independently decoded from their exact current bytes. Cleanup
pseudocode also reports PIC call/branch warnings and expands allocator code;
the bounded original assembly and checked call/tail destinations govern the
lifetime conclusions.

The non-compiling checker reproduces **nine ranges / 960 instructions / 3,603
bytes**, every cell of all nine tables, seven retained native query identities,
the complete selected-helper population and source receipts:

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-guarded-helper-classification.py
```

This is bounded native classification. Unselected body regions, other computed
exits and broad residual sets remain outside the proof. Compilation, actual
client/game/network/server execution and original/rebuilt parity remain
unverified.

# Q41-A02/A03/O02: Armory formatting and metadata relations

Target **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
These three bounded classifications belong to gap #41. They leave the original
selector populations and native ownership counts unchanged.

| Classification | Exact selected member | Result |
| --- | --- | --- |
| `Q41-A02-armory-line-display-145ed7700` | DIR64 slot `0x145ed7700` encodes `0x1400020e0`. | A String display adapter in the Armory `item.equip` localization argument's trait-object table. |
| `Q41-A03-armory-location-145ed76d0` | DIR64 slot `0x145ed76d0` encodes nonexecutable `0x145ed6df8`. | The filename pointer in a Rust Location record, used by a bounds diagnostic in the same Armory builder. |
| `Q41-O02-armory-runtime-function-1481fa240` | Exported DATA reference `0x1481fa240 -> 0x140136300`; its source has no native body. | A PE `.pdata` runtime-function begin-RVA field, accompanied by an unwind-info reference. The source is metadata, not an ownerless instruction. |

## Armory argument producer and consumer

At `0x140136a95`, the Armory builder constructs one 32-byte localization
argument at `RBP+0x378`: name pointer `0x145ed7708` and length **4** identify
`line`; object pointer `RBP+0x3a8` and table pointer `0x145ed76e8` identify the
value. The call at `0x140136aea` passes `item.equip` (pointer `0x145ed770c`,
length **10**), that descriptor and argument count **1** to `0x1458956d0`.
The two names are adjacent bytes, not one combined localization key.

The selected immutable `.rdata` table is four qwords:
`[0x1400051c0, 24, 8, 0x1400020e0]`. The first method conditionally releases
a byte-aligned allocation using the object's capacity and data pointer. The
last method reads the object's pointer at `+8` and length at `+16`, then
forwards them into the string formatting interface. These actual operations,
the 24-byte/8-byte layout and the caller's existing source consumer establish
the String display role. This is a text-formatting callback, not a selected
equipment action or a new gameplay entry.

`0x1458956d0` first calls the current localization lookup `0x145895720` and
then transfers the chosen text plus argument descriptors to `0x145895ad0`.
In that consumer, the retained matched-placeholder branch searches 32-byte
argument records by name length and bytes. It supplies the selected object's
fat pointer to the display bridge `0x14017f820`. That bridge loads the method
at table offset **24**, giving the exact selected slot `0x145ed7700` when
the Armory descriptor is supplied. The method at `0x1400020e0` and adapter
at `0x145cdf5d0` forward formatter, string pointer and byte length to
`0x145cd30d0`. Recovery stops at this existing formatting interface; surrounding
generic Rust formatting, allocation and Unicode machinery is not reconstructed.

The live source counterpart is
[`armory.rs`](../../../../../crates/azeroth-survivors-re/src/armory.rs):
the non-health effect row selects `item.equip` and replaces `{line}` with
`effect_line(menu_catalog, effect.tag, effect.value)`. The source already
contains this selected producer/consumer relationship. No source mismatch or
gameplay repair is established by this classification.

## Data relocation and metadata source

The 24 bytes at `0x145ed76d0` decode as filename pointer `0x145ed6df8`, length
**46**, line **1650**, column **19**. The canonical filename bytes already
reside in the [Armory slot proof](../q41-c01/contract.json), role `armory-path`;
they are verified in place without adding another extract. At `0x140137723`,
the builder forms this record's address in R8 and calls the already recovered
bounds consumer `0x145e9c123`. The relocation targets data because the record
contains a filename pointer; it is not an undiscovered code address. This
classification does not recover the entire bounds-producing index path.

The aligned 12-byte `.pdata` record at `0x1481fa240` contains RVAs
`[0x136300, 0x137735, 0x73dc7f8]`: begin, exclusive end and unwind info.
The complete expanded reference export retains DATA edges from its first and
third fields to `0x140136300` and `0x1473dc7f8`. Neither source address lies in
an actual native body, so both remain valid O02 members. Fresh Ghidra likewise
reports no containing procedure for the metadata or Location record. The
builder's fresh observed body is noncontiguous and **4,938 bytes**, while the
PE declared extent spans **5,173 bytes**; metadata does not promote that extent
to a Ghidra body or supply a missing incoming executable edge.

## Evidence and limits

The [contract](contract.json) verifies the latest installed target, original
queue/input hashes, exact A02/A03 relocations, actual target-body membership,
the selected O02 DATA rows, the independent constructor/address references,
the source projection and byte commitments. The canonical `.asm` files retain
each newly selected range once. [Ghidra observations](ghidra.json) preserve
the two bounded profiles, Evidence IDs, actual body ranges and metadata queries.
Discovery and Data Reference analyzers were disabled, so absent fresh xrefs do
not establish absence in the complete program. Both owned REA sessions closed.

`PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-q41-pointer-relations-0.113.2.py`
passes **10 original-instruction cases**: one Armory descriptor construction,
six display-method transfers (including empty, UTF-8 and 255-byte values), and
three String drop transfers. The checks stop at existing localization,
formatting and deallocation interfaces; they do not claim complete text output
or execute the generic subsystem. Source compilation, game execution, rendered
presentation and original/rebuilt parity remain unverified.

Reproduce the provider observations with `scripts/rea-batch.py` and the
[main plan](plan.json) / [callback plan](callback-plan.json), each with a new
project-local `--output` directory. The plans select the same seed bytes;
their portable reproduction paths differ from the recorded execution paths.
Other A02/A03/O02 members remain actionable. No global residual was removed.

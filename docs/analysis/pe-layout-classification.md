# PE layout boundary classification

Installed target SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
141,932,032 bytes. This classifies every exact `Q41-B03` and `Q41-B05`
interval as supporting file-format context under **#41**. It establishes no AS
contract or source defect. The original ledger's semantic states, census totals
and residual selectors remain unchanged.

The [proof](evidence/0.113.2/pe-layout-classification.json) retains all twelve
interval/hash records, complete retained incoming-reference checks, two encoded
reference inventories, fresh REA/Ghidra observations and their Evidence/response
commitments. Run `python3 -B scripts/check-q41-pe-layout.py`; `--stage`
writes a candidate under ignored `runtime/analysis/history/findings/q41-layout/2aa5dfce908e/`. The existing
[file-range generator](evidence/0.113.2/refresh-baseline/file-range-summary.json) owns the 26-interval
whole-file partition. No bytes are removed or reclassified in that inventory.

## Header and section-tail results

The 1,024-byte header splits into the MZ header, a 200-byte stub/metadata interval,
PE signature at file offset0x108, 20-byte COFF header, 240-byte PE32+ optional
header, six 40-byte section records, then 256 zero bytes. Section records end at
file offset0x300 and SizeOfHeaders is0x400. The actual entry RVA is0x5cf8df4,
inside `.text`, independently of the 16-bit DOS prefix.

The stub prefix `[0x40,0x4e)` decodes to seven 16-bit instructions ending in a
DOS interrupt. Its adjacent string is the DOS-mode refusal message. The remaining
stub interval contains XOR-encoded `DanS`/`Rich` metadata, with `Rich` observed at
file offset0xf0, and trailing zero bytes. Individual toolchain identifiers and
checksum behavior are outside this classification. Neither the DOS prefix nor
metadata was executed.

All five raw tails are zero: `.text`130, `.rdata`200, `.pdata`320, `.rsrc`256
and `.reloc`160 bytes, totaling1,066. Uniform bytes support a tail/alignment
interpretation; they do not prove padding, noncode or dynamic unreachability.
There is no AS implementation change justified by these observations.

The expanded profile's **3,919,777** reference records contain three header
references and none into the DOS stub, slack or five tails. The independent
linear/complement encoded inventories add seven image-base/header candidates
and none into those stub/slack/tail intervals. Fresh Ghidra reads reproduce all
twelve exact byte ranges and query both endpoints of each. All tail endpoints
have empty xref sets. The fresh profile supplies additional header constant
propagation; these results remain distinct from the original full-image profile.

One fresh reference forms address0x140000300, at the start of header slack.
Its exact source instruction0x145cf90a3 is `LEA R9,[RDX+RCX*8]`: the one-past-end
bound for the six section records. It does **not** read a slack byte. The reader's
unwind extent `[0x145cf9054,0x145cf90ec)` validates MZ0x5a4d, PE0x4550 and
PE32+0x20b, then walks section headers and tests section characteristics.
This is a platform-format boundary. Recovery stops there; no generic engine or
OS loader is reconstructed. This unwind extent is not promoted to new Ghidra
function-body ownership.

Fresh Ghidra xrefs cover endpoints, not every byte. The complete retained
reference/encoded inventories cover their own recorded static observations;
none proves absence of other computed references or arbitrary aliases. No build,
source/application/DOS execution, OS loading, gameplay or original/rebuilt
comparison ran. Reopen a selected interval when an actual AS reader/writer/entry
or contradictory byte/reference is established. Broader data, code, resource and
semantic/alias recovery remains open under #41.

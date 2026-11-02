# Custom UI dispatch inputs — 0.112.0

Gap **#41** static recovery for installed SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [input proof](evidence/0.112.0/ui-frontier-inputs.json) binds the selected
native ranges, original-instruction scenarios and source interfaces. This
follow-up concerns AS marker transport, custom font augmentation and the
remaining custom UI interfaces; it does not reconstruct generic ECS/input/font
systems or alter the existing Ghidra ownership census.

## Marker producer and both geometry reads

The native shape parser at `140101374` checks the JSON string tag, its exact
length and bytes. Exact `donut`, `line` and `cone` choose selectors `1`, `2`
and `3`; every other string or non-string value chooses circle selector `0`.
Numeric field contents do not synthesize another selector.

The original scalar decoder retains that selector through kind/ID/position/
clock reads and stores ESI at frame `+0xc0` at `1401021c1`. The new-record
publisher at `140102240..140102334` copies it through frame `+0x44` into the
128-byte marker record at **`+0x54`**, then increments the actual Vec length.
It does not reinterpret a renderer argument or a geometry float as a shape tag.

Both geometry paths read that record field: `140103148` and `1401045a2`.
Their switches at `1401033c0` and `1401048d0` use the four-entry tables at
`145dbe1a4` and `145dbe1b4`. Fifteen scenarios execute the original producer,
subsequent scalar decoder, actual new-record publication and both dispatch
prefixes. They include all four recognized shapes, case/length mismatches and
all other JSON value tags. Their observed selector domain is exactly `0..3`.
The geometry-prefix scenarios use zero shape dimensions and a controlled
progress value so the existing direct path reaches each selected dispatch;
geometry helper bodies and rendering are not executed.

The source `raid_markers::Markers::receive` has the same recognized spellings
and circle fallback. Its typed `Shape` reaches the existing geometry builder's
four matching branches. No additional AS source failure was found in this
producer/selector interface. Arbitrary external record mutation or a complete
native renderer/transport lifetime is not inferred from these scenarios.

## Font augmentation inputs are two distinct domains

The immutable **41 x 16-byte** table at `146c0cfa8` contains records
`<IIIB3x>`: base code point, result code point, mark code point and placement
mode. All 41 records match the existing `font_patch.rs::COMPOSITES` tuples,
including their order. Their mode byte at `+0xc` contains only **`0..4`**.

The native loop initializes its offset to zero, advances it by `0x10` and ends
at `0x290`. At `145976911..145976916` it saves each current mode byte in frame
`+0x1f0`; `1459769cf` reads it before switch `145976a64`, table `146f44f30`.
All 41 original table-load and consumer prefixes reach their exact mode case.
Intervening glyph lookup calls receive separate frame/map/output arguments;
the fixture does not replace them with a generic font parser or claim to have
executed a whole augmentation.

The other font frontier, **`145978009`**, is unrelated to placement mode.
It reads the first byte of a 24-byte font table record, subtracts **`0x44`**
and uses an unsigned **`<=0x2c`** guard. Therefore its admitted index domain
is `0..44`, corresponding to initial bytes `0x44..0x70`. Other first bytes
follow the existing fallback path at `1459782dd`.

The table base is hoisted into R15 at `145977e45`: **`146f44f44`**. Its loop
has no subsequent full or partial R15 writer before its exit; external calls
retain the existing Windows ABI nonvolatile-register boundary. All **256**
possible first bytes execute the original hoisted LEA, loop header, guard and
selected dispatch/fallback prefix. Exactly 45 enter the table, and each target
matches the original signed-relative table bytes.

`font_patch.rs` already supplies the matching composite modes and reads
four-byte table tags through its existing table collection. This recovery
requires no new font-parser implementation. The broader TrueType parsing,
actual glyph availability, host callbacks and rendered font behavior remain
outside these input contracts.

## Remaining UI contract matrix

### Independent caller check and concrete AS publication

An independent scan of executable-section `E8`/`E9` transfers checks every
candidate against the decoded instruction starts of its complete PE unwind
extent. For the six selected input/formatter consumers it finds exactly the
same **13 calls** already observed; there is no omitted direct call or tail
jump to those entries. Extending this check through five selected AS
constructors/adapters finds **seven further calls**, for **20** checked direct
calls in total. This does not resolve indirect callback identities or change
Ghidra ownership accounting.

The Options click handler constructs **56-byte** operation records in frame
`+0x80`. Six exact literal header stores produce negative niches `0`, `1`,
`5`, `7` and `8` (two stores produce `0`), used for value assignment,
Defaults, AddOn toggle, save export and save import. The publication sequence
`14013d0b8..14013d103` copies all 56 bytes and increments the Vec at Options
resource offsets **`+0x30/+0x38/+0x40`**. The consumer's original take at
`140137227..140137257` copies that exact Vec to its iteration frame and resets
the source to `(cap0, ptr8, len0)`. All six writer/copy/take/dispatch scenarios
reach their selected case in `145dc96b8`. These are operation-input proofs;
they do not execute the operation bodies or perform save/account I/O.

The native Armory slot row is constructed at `1400f59e0`, after its slot
`<=18` guard. The slot comes from the existing recovered ordered slot Vec:
`140290110` loads its byte and `14029012e` calls the row builder. It writes
**dword tag `7` and the slot byte** at bundle `+0x1d8/+0x1dc`.
`14023ac80` publishes the exact `0x230`-byte bundle and entity as a
`0x240`-byte command, callback **`1402cefd0`**. That callback copies the
complete `0x238`-byte payload before typed insertion call **`1401751f0`**
at `1402cf004`. Nineteen checked slot payloads survive both copies unchanged;
supplying that exact action field to the consumer prefix chooses primary
Armory selector `5`. The [slot producer](armory-slots-0.112.0.md) and
[input/account behavior](armory-input-catalog-0.112.0.md) retain their existing
broader proofs.

Rewards' current cosmetic card constructor **`140161580`** attaches an action
only when the earned/available flag is nonzero. It reads the descriptor slot
at `+0x3c`, publishes **byte tag `3`**, and sets its optional item to absent
when already shown or to the descriptor item otherwise. Its `0x68`-byte
command uses callback **`1402d3ac0`**, which copies the exact `0x60`-byte
payload to typed insertion call **`140180cc0`** at `1402d3b0e`.
All **28** combinations of seven actual catalog rows, available/unavailable
and shown/unshown execute the original gate, optional-item computation,
descriptor slot read and publisher. Available cases also execute the callback
copy, then the supplied exact action field reaches consumer case
`140188c46`. The source card has the same availability gate and
`(!shown).then_some(entry.id)` payload. The existing
[appearance](armory-cosmetics-0.112.0.md),
[layout](secondary-menu-layout-0.112.0.md) and
[reward catalog](rewards-catalogs-0.112.0.md) owners remain canonical.

The Armory and Rewards fixture handoff is explicit: it stops before each
typed insertion call, then passes the copied action field to the selected
consumer prefix. It does **not** claim that it executed the engine's command
application, component registration or query selection. Establishing that
those insertion calls and the queried columns share the same registered
component identity is the necessary remaining engine-interface contract.
No generic ECS storage reconstruction or action-enum widening follows from it.
Fresh isolated [Ghidra query identities](evidence/0.112.0/ui-frontier-inputs-ghidra.json)
retain both constructor observations, raw and normalized pseudocode hashes and
the caller-seeded raw-import limits; existing extracts are not duplicated.

### Formatter descriptor ancestry

Both observed callers of constructor `14012b3d0`, at **`1402b1774`** and
**`1402b17b4`**, enumerate the immutable descriptor table **`145dc2250`**.
The original initializer sets offset/index zero, advances by **`0x98`** and
stops at **`0x3e58`**, exactly **105 rows**. Its two category filters read row
`+0x91` and pass the selected row in R9. That constructor retains R9 and
publishes it in builder context `+8`; `1402ae72e` reads it as RSI.

For all 105 current rows, the original builder control gate and copy execute.
The paths reaching formatter `14012de80` copy the descriptor's **24-byte
control at `+0x40`** into frame `+0x10`, with mode domain exactly **`0..4`**.
There are **19** such formatter controls, **79** Boolean controls (tag5) and
**seven** choice controls (tag7); the latter two groups take separate builders.
Each original formatter prefix reaches its matching table target. The builder
has no indirect branches: a complete intra-procedure CFG establishes that the
control copy dominates call `1402afdf7` and that the other branch's later reuse
of frame `+0x10` cannot reach that call. External callees retain their existing
interface/ABI contract. This closes the second observed caller's AS descriptor
ancestry; the [other caller and concrete clamp fix](options-choice-labels-0.112.0.md)
retain their own proof. Arbitrary indirect callers are not inferred from the
direct-transfer inventory.

These are the exact remaining native representation boundaries. A sparse or
unguarded native dispatch alone does not demonstrate a missing AS operation.
The current source uses its existing typed custom controls and public engine
interfaces; native enum bytes must not be inferred from Rust source enum order.

| Native frontier | Actual incoming record/projection | Remaining contract | Source implication |
| --- | --- | --- | --- |
| Armory `140057609` | `1400575ec` reads a byte from a selected **24-byte** ECS component row after interaction/admission checks. | This column has a different layout from the 16-byte Armory action below. Its component registration/query identity must be tied to the corresponding typed bundle before assigning its full byte domain. | Existing common hero/menu controls remain a separate interface; a 16-byte slot constructor cannot establish this row's enum. No new AS operation is supported. |
| Armory `1400fde26` | First dword of a selected **16-byte** row; subtract `2`, mapping unsigned-underflow cases to `8`. | Selected tag7/slot writer and command copies are recovered. The necessary unexecuted handoff is typed insertion **`1401751f0`** to this query's registered component column. This does not close every other native action producer. | Current source slot construction and the existing input/account proof agree. The transform does not cap arbitrary positive values. |
| Formatter `14012dec7` | First qword of a **24-byte** copied current immutable control. Both observed caller chains now reach the 105-row descriptor table. | AS input ancestry and mode0..4 are established for those callers. External callees retain interface/ABI contracts; arbitrary indirect caller identities remain outside the proof. | The concrete label clamp defect is repaired by the [owning change](options-choice-labels-0.112.0.md). No further formatter failure was found. |
| Options `140137943` | First qword of each taken **56-byte** operation; negative niches normalize by high-bit XOR, nonnegative values map to `2`. | Six literal writer sequences and exact queue publication/take/dispatch are established. Other event/adaptor constructors and the resource's registered identity remain separate from these selected AS writers; the negative projection itself imposes no bound. | Existing [capture/commit](in-run-bindings-0.112.0.md) and [file/VM refresh](options-vm-0.112.0.md) retain their recovered behavior. Selected writer cases require no new operation. |
| Options slot `14013c6d5` | First qword of a selected **32-byte** control; negative niches normalize by high-bit XOR, nonnegative values map to `4`. Descriptor indices independently reject `>=105`. | Native AS button records enter typed queued bundle construction; linking applied bundle component identity to this selected column is still required before making a universal negative-niche claim. | Existing typed options/binding controls and current slot-cancel/commit consumers remain connected. No operation is justified by an arbitrary niche. |
| Rewards `140188a92` | First byte of a selected **32-byte** ECS action. Tag6 has an earlier separate route. | Cosmetic tag3 producer/gate/payload and command copies are established. The necessary unexecuted handoff is typed insertion **`140180cc0`** to this query's registered action column; other action producers retain their own boundaries. | Current source enabled-card construction and optional appearance payload agree with all seven actual descriptors. No additional source failure was found. |

The matrix does not convert shared-engine alias unknowns into separate engine
reconstruction tasks. It preserves unresolved AS representation membership
where the current evidence cannot establish it, independently of source
behavior already recovered and independent of outstanding runtime comparison.

## Validation

```sh
export PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs
python3 -B scripts/check-ui-frontier-inputs.py
```

The checker passes **15** marker input/publication/dispatch cases, **41**
source/native composite records, **256** font-tag guard cases, **20** independent
direct UI call checks, the **105-row** Options descriptor ancestry, **six**
Options operation publication/take cases, **19** Armory slot cases and **28**
Rewards card cases. Marker JSON
lookup is an explicit seam returning a numeric serde value `(tag2, numeric
variant2, finite f64 zero)`. Actual original selector/copy/guard instructions
run unchanged. Source interface checks are static; reconstructed Rust does not
execute. Whole-image current Ghidra observations retain their original body and
indirect-switch limitations. No compilation, game, save/file mutation,
rendering or original/rebuilt parity comparison ran.

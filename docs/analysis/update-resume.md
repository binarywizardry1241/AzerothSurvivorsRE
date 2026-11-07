# Interrupted updater downloads

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [manifest](evidence/update-resume/manifest.json) binds four journaled
Ghidra raw-slice queries, exact original instruction/data ranges, two guarded
error representation tables and actual source hashes. This supplies a bounded
current `custom-app-update` contract under **#133/#263**. It does not establish
whole-updater source equivalence, a working download or parity.

## Current reader and resumption

The relevant owner is **`0x140061b50..0x140062582`**, rather than the two
`update.rs` diagnostic owners. The latter (`0x14005df10..0x14005e4c3` and
`0x1400aecc0..0x1400af321`) construct metadata/download plans and filter patch
names; their bounded query results remain classified navigation evidence.

The current reader stores the active part's URL at **+0x28/+0x30**, declared
length at **+0x38**, already-returned byte count at **+0x40**, optional response
reader at **+0x48/+0x50**, and consecutive failure count at **+0x58**. The next
part pointer advances by `0x20` before its first open. Retrying the active part
retains its URL, length and offset rather than consuming another part.

When the offset is nonzero, the request formats **`bytes=<offset>-`** and sets
the **`Range`** header at `0x140061d53..0x140061d5a`. A **206** response admits
the replacement reader directly. For another response status, the caller feeds
that reader through **`0x1402131e0..0x140213497`**, a bounded generic Read
prefix-discard/count interface. It discards at most the retained offset; the
caller rejects an error or a count shorter than that offset. That replayed
prefix is consumed before the updater's progress-publication path, so it is
not counted twice. HTTP/TLS internals stop at this interface.

A positive read resets the failure count to zero, adds its byte count to the
current part offset, and updates the existing shared compressed-body progress.
The original quarter-second rate/publication structure remains visible in this
owner; the earlier [part-reader recovery](main-menu-update-parts.md) retains
its actual historical evidence. This audit does not revalidate every historical
speed/time dependency. EOF before the declared part length becomes
**UnexpectedEof**, with the exact message “the connection closed before the
part's end”; completed EOF clears the active part and advances normally.

## Retry policy

The current indexed I/O-kind Debug table and consumer bind **0 = NotFound**,
**35 = Interrupted**, **37 = UnexpectedEof** and **41 = Other**. These names
come from this EXE's own table, rather than the host compiler's enum ordinals.
The four-entry representation dispatches are separately read and checked;
raw-slice Ghidra pseudocode explicitly cannot resolve their external table
memory and is not used as a complete error-branch graph.

**Interrupted** loops without discarding the active reader or consuming the
failure budget. Other errors drop the response reader and increment the
consecutive failure count. The **ninth** such failure returns the error.
**NotFound** returns immediately after that increment. Other kinds log and wait
for `min(1 << failures, 20)` seconds: **2, 4, 8, 16, 20, 20, 20, 20**, then
reopen the same part at its retained offset. Positive reads restart that budget.

The current request-error branch maps HTTP **429** and statuses **>=500** to Other,
other HTTP failure statuses to NotFound, and the transport-error variant to
Other. This is the bounded caller policy; complete HTTP error conversion,
server compliance and actual connection behavior remain unverified.

The retained offset belongs to the live part reader. No evidence here promises
resume after closing/restarting the application, a persistent download journal,
or a different installation strategy.

## Connected source

`update_parts.rs::PartReader` now retains the claimed part index, declared length,
returned-byte offset, optional response reader and consecutive failure count.
`PartHost` supplies the declared size and accepts the same index plus offset on
reopen. Only completed EOF advances to the next part. Interrupted retries the
active response without a wait or budget increment. Other failures drop that
response; eight capped waits precede reopening, and the ninth or NotFound returns
the original error. A positive read resets the budget, wraps the part offset and
feeds the existing compressed-body progress sampler once.

`update_worker.rs::NativeParts` supplies each manifest part's size, adds Range
only for a nonzero offset and marks 206 responses. For another successful status,
the reader discards exactly the retained prefix before admitting response bytes
to gzip or progress. A short prefix and premature part EOF use UnexpectedEof;
Interrupted during discard keeps that response. HTTP429 and statuses>=500 become
Other; other HTTP status errors become NotFound, and transport errors become
Other. The injected retry callback logs and sleeps in the actual adapter.

The existing worker consumes this reader through `decode_verified_with`: one
continuous gzip stream per artifact, decoded size and SHA256 verification,
attempted staging-path cleanup on a terminal error, and Ready only after every
artifact succeeds. The source does not persist a download journal or promise
resume after application restart. No HTTP, filesystem or process operation was
executed to validate these connections.

Eight authored source regressions cover retained Interrupted/reset state,
partial 206 continuation, ignored Range replay and short-prefix retry, the eighth
wait/ninth failure boundary, immediate NotFound and empty-buffer premature EOF,
mid-gzip recovery through verified staging/Ready without duplicate progress,
terminal part error through existing cleanup/Failed, and Range/status policy.
They are uncompiled and unrun. Historical progress/worker fixtures remain, with
the two 0.92 error/empty-buffer cases replaced by the recovered current behavior.

## Validation limits

Run the non-compiling checker with existing local dependencies:

```sh
python3 -B scripts/check-update-resume.py --python-path runtime/tests/query-python-deps --python-path runtime/tool-state/python/armory/python-libs
```

It verifies **four exact query subjects**, every retained code/data byte and
extract, the two guarded representation tables, selected current I/O-kind names,
and source receipts. **52 isolated original-instruction cases pass**: retry
budget (10), Interrupted/NotFound branches (12), capped wait duration (8),
positive-read offset/progress reset including integer wrap (3), and bounded
prefix discard with short EOF, Interrupted and a nonretryable interface error
(5), HTTP status conversion (9), and premature EOF admission (5). Read and
stack-probe seams use synthetic memory/callbacks. These are
original instruction fixtures, not Rust/application execution or a real
transport test. The checker also parses the three connected reader/worker/install
sources with existing rustfmt and checks their source routing without compilation.

No compilation, compiling test, HTTP request, updater download, filesystem
installation, process launch, game/server operation, installed-file mutation or
original/rebuilt comparison occurred. Operational updater behavior and parity
remain unverified.

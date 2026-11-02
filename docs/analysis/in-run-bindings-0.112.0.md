# In-run binding capture and account persistence — 0.112.0

Installed SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [current manifest](evidence/0.112.0/in-run-bindings/manifest.json) binds23
code owners, actual switch tables, path literals and the shared historical
fixture algorithm. [Ghidra identities](evidence/0.112.0/in-run-bindings/analysis.json)
retain portable provider/profile/carrier/seed hashes. Historical
[0.109.0 recovery](in-run-bindings-0.109.0.md) retains its original provenance.

Options event owner `140136fa0..140139424` has105 descriptors. Its complete
[assembly](evidence/0.112.0/in-run-bindings/options-events.asm) is canonical;
raw Ghidra imports omit its external switch table. Current known switch slots
at `145dc96b8` lead to `140137946`, `140137ccf` and `140137a0a`. Their producer
membership/domain is a separate #41 boundary. This report retains the complete
Options event body needed to establish the custom capture and commit routes.

The event transaction requires Options.open (`+1c0`) and either absent cached
content (`+b0 == -1`) or queued events (`+40 != 0`). It takes the queue at
`14013724f`, calls current value collector `1400881e0` at `140139002`, replaces
the cached216-byte content at `140139220..13924d` and increments revision+1b8.
Open is retained. The saved-variable reader and exact refresh admission have
their separate current lifecycle proof.

Current capture/filter owners are `140007bf0`, `140082070` and `14012e3f0`;
edit/commit owners are `14012b790` and `14012b270`. Capture still requires open
and pending `+90 != -1`. Only nonrepeat ordinary presses are removed; modifiers,
Escape and releases preserve their separate routes. Acceptance takes pending
capture before edit and commit. Current lookup TypeID immediates changed; the
actual fields, registers and branch bodies were independently compared and
recovered rather than treating those immediates as data addresses.

Mouse `140568310` uses its actual four-entry table at `145ea9b88`, with Middle
BUTTON3, Forward BUTTON4, Back BUTTON5 and Other5..19 → BUTTON6..20. Wheel and
layout-aware keyboard `14056dd30` preserve the recovered conversion contracts.
Slot owner `14013be20`, selected branch `14013cb72..14013cc5b`, cancels an exact
same command/slot selection. Cancel owner is `14001d650`.

Commit calls `14056cb00` unconditionally, saving `bindings/account.txt`; it calls
live replacement `14056b4d0` only while AppState+e8 is1. That live owner resolves
the selected character's bindings path through kind2 of `140cc5780`, removes
that file through `140cc5540`, then publishes the full account table through
`14508b770(1, table)`, clears character set through `(2, absent)` and loads1
through `14508b660`. The actual setters address separate account/character
fields at VM+50c8/+50e0; load helper `1451029a0` selects account+78 and publishes
current set1. Account reader `14056a270` independently resolves the account file
over defaults. Declaration owner `140568770` supplies registered command rows.
The current Defaults compiler wrapper `1401b50c0 →1401e42e0` replaces the old
inlined block while preserving declaration/key conversion.

The source previously mirrored VM keys and saved GetCurrentBindingSet(), which
could use a character override or stale in-memory account data. Custom Options
now rereads `bindings/account.txt` over defaults on its existing open/event cache
admission. The VM supplies declarations, localized labels and defaults; its keys
do not replace the file-derived model. The existing custom account writer runs
unconditionally, even without a UI or VM. A separate thin live request removes
the character file through the existing helper, seeds account1, clears stored
character2 and loads1 through existing UiScript APIs. It creates no second save
request. Inactive UI and missing-VM branches discard this custom live request;
generic per-command requests retain their behavior. The ordinary binding window
retains its selected-set API.

Update still owns input, custom request handoff, the unconditional custom file
write and subsequent loaded-VM application. Only the AZS Options `rebuild`/`scroll` pair now runs in
PostUpdate before `UiSystems::Prepare`, so its deferred UI commands reach the
existing preparation/layout after the committed file can be reread. The same
cache admission retains the model on hover/scale repaint. Source regressions
cover fresh hand-edited file values, read-failure default fallback, account
promotion, character removal, absent-VM persistence, inactive request discard and
preservation of an unmodified file-derived command while different cached
account/character mappings were active.

`python3 -B scripts/check-in-run-bindings.py` passes99 native branches:
the91 retained filter/take/mouse/wheel vectors, six complete slot toggles and
two live-commit gates. [Results](evidence/0.112.0/in-run-bindings/cases.json)
also bind source early ownership, press/held/release ordering, layout/mouse/wheel
consumers and the account file/model/edit/save route. Rust syntax parsing ran;
the new Rust regressions were not compiled or executed.

String clone/byte/free operations are explicit toggle seams. Complete native
ECS iteration, VM, file operations, asynchronous input and reconstructed Rust
do not execute. File/API policy and complete event owner are recovered statically;
these bounded cases do not certify the full shared-engine boundary or event
producer completeness under #41. No compiler, application, device or
original/rebuilt comparison ran.

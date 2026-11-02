# Lobby difficulty, hosting preview and party eligibility — 0.123.0

Target: installed **0.123.0**, 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
Permanent findings **#258–#260** retain their identities in
[verification-needed](../verification-needed.md). The
[native manifest](evidence/0.123.0/coop-lobby-ui/manifest.json) binds each exact
original range, journaled Ghidra result, canonical extract, data byte and
isolated instruction fixture. The installed game and its data were read in
place; no application, client, server or service was operated.

## Directory filters and presentation

Current `140287190..140287c17` constructs **Can join**, **No password**,
**Zone** and **Difficulty** controls, respectively events 10–13. Directory rows
have stride `0x128`: localized zone String at `+0x90`, signed difficulty number
at `+0x108`, combined join eligibility at `+0x120` and password presence at
`+0x121`. The predicate is the conjunction of enabled eligibility, password,
exact received localized zone and exact selected difficulty tests. Counting
does not discard full, unavailable or password-protected rows unless the
corresponding actual filter rejects them.

Difficulty's Option discriminant/value occupy UI resource `+0/+8`. Event 13
collects nonnegative signed row values with `140085820..140085947`, sorts them
in ascending signed order, and deduplicates them at
`140160c20..140160d62`. The cycle is Any → first → next → Any; an empty list or
a selected value which disappeared resets to Any. The complete received
snapshot supplies these values, independently of the other filters.

The display conversion is distinct from matching: `145be05d0..145be05df`
casts the retained number to its low byte and clamps that byte to five.
`145be05e0..145be079c` then produces localized Normal or Heroic I–V. Therefore
a malformed received value 256 can be matched as 256 while its filter caption
is Normal. It must not be clamped before filtering. Directory rows preserve
their separately received difficulty label and `lacks` reason rather than
reconstructing either from visible zone/class text. The current parser and
directory projection are separate producer evidence in the source delivery.

`140146170..1401473a4` registers the 0x178-byte Coop resource and initializes
Difficulty to None, Zone to None, and filter/visibility/tab/focus/capacity bytes
to zero. Its exact TypeID equals the co-op input system's TypeID. Closing,
changing tabs and opening the separate difficulty dialog preserve these
retained controls. The older
[0.115.0 defaults/filter proof](coop-ui-0.115.0.md) retains its actual target;
these current ranges establish the changed layout and added difficulty control.

## Selected run cards and Change difficulty

Host parent `14014bdd0..14014ca11` obtains the current selected hero and class,
localized zone, and effective rank limited by the selected class's Save cap
and rank five. It constructs **You host**, hero-name · localized class, zone
and difficulty inputs. Existing class descriptors supply the 40×40 image;
no replacement artwork is required.

The common card is `14014ba40..14014bd94`, with content
`140288f10..140289bff`. It uses 14×10px padding, 1px border, 6px radius,
14px column gap and a black background at alpha .32. Normal's border is
`(.427,.333,.145,1)`; Heroic's border is `(1,.353,.235,.7)`.
The header is 12px, hero/class line 17px, zone 16px and difficulty 13px.
The optional **Change difficulty** button is 14px and emits event 15.
The growing text column has a 3px row gap. Zone and difficulty share a centered
inner row with a 10px column gap; Change remains an outer card sibling.
Current calls `140289464`, `140289988`, `140289b13`, `140289b3a` and `140289b84`
bind those parent/child builders. Constants `1461c0b08` and `1461b2410` supply
the 3px and 10px values, retained by the source review receipt.

The action opens the existing ordinary difficulty resource, preserving Coop's
open state and form text/focus. This is an exact resource identity, not an
inference from the label:

| Boundary | Current original code/data |
| --- | --- |
| Coop state initialization and input alias | TypeID at `1461c3b18` = `146214b08`; initializer `1401691b0` stores it in FunctionSystem state `+0x138`; run `140169630` passes it to handler R8. |
| Change target | Same initializer obtains TypeID `146214c18`, stores its resource key at `+0x140`, and the run wrapper passes its pointer/ticks to handler R9. |
| Event 15 | Dispatch table `1461c7a8c` selects `14016004d`; this updates that resource's change tick and writes its first byte to one. Coop close is a different event/branch, `140160269`. |
| Ordinary difficulty consumer | Initializer `14016f010` obtains the same TypeID and stores it at state `+0x40`; run `14016f440` passes it to `140164ad0`, which reads the first open byte at `140164b57..140164b62` and invokes the ordinary modal at `1401650d1`. |

The TypeID's 16 bytes are `d9aa93285cb8c14897569f75b98ba106` in both paths.
Ordinary difficulty's resource is closed independently. This supports the source
return to Coop without resetting its retained inputs; it does not certify UI
focus scheduling or rendered overlap behavior.

## Party selection and member eligibility

`140147c90..140148865` uses the same selected-run card for a nonempty received
zone. Its header is **The party's run**, with no hero/class image or hero-name
line. It passes the received zone and difficulty label; the current rank
controls the border, while the exact role `host` controls Change difficulty.
Guests can inspect the same selection but do not receive that action.
Host selection publication, current tag-17 roster/zone/rank reception and class
admission are separately recovered by the party metadata proof; a presentation
update does not replace world-entry admission.

Each occupied member's projected `+0x6e` is the received eligibility bool.
False gives its slot a red border and adds a 13px red inline warning; names
retain their ordinary styling. The warning is selected from current party rank:
Normal uses **hasn't unlocked this zone**; nonzero rank uses
**hasn't opened {difficulty} here**. This owner has no separate missing-zone
versus missing-Heroic reason bit. Directory rows retain the different, explicit
received `lacks` reason.

Original Node captures establish a fixed 46px member slot, 12×5px padding,
1px border, 5px radius and 12px column gap. Occupied slots use black at alpha
.32, with the same Normal/eligibility-red border colors as above. Empty slots
have a transparent background and `(.169,.129,.071,1)` border. The warning is
a horizontal sibling, so it does not add a third line to a fixed-height name
column. The existing player-count and open-slot semantics remain independent
from host-form capacity.

The parent scans all received members for an eligibility false at
`1401484ca..1401484e5`. Only then does it add the red 13px explanatory paragraph;
the exact `host` role selects the host wording, and other roles use the guest
wording. The eleven new captions have
[exact current locale subsets](evidence/0.123.0/coop-lobby-locales.json) for all
fourteen embedded locale catalogs.

## Connected source

`coop_ui.rs` now retains the signed difficulty filter independently of zone,
Can join and password controls. It cycles the complete snapshot's sorted,
distinct nonnegative ranks and compares the full signed value before applying
the native byte/clamp conversion to its caption. `coop_directory.rs` connects
the selected class's Save ceiling and locale to the directory projection;
`coop_directory_row.rs` displays the received difficulty and its explicit
zone/Heroic lock explanation. The [directory schema](coop-directory-schema-0.123.0.md)
and [selection metadata](coop-selection-0.123.0.md) own these input contracts.

The shared `selection_card` renders the selected hero/zone/effective rank on the
Host tab and the received zone/rank in an active party. The latter exposes
Change difficulty only to the host. Received eligibility reaches the fixed-height
member frame, inline warning and role-specific footer. Entry permission remains
in the independent world-entry path; ineligible profiles stay in the lobby.

`Dialog::CoopDifficulty` represents the ordinary Difficulty dialog opened over
retained co-op state. Existing rank actions still commit the selected Pick;
Done or Escape returns to the retained co-op tab and form. The ordinary picker
route still closes to the picker. Preview invalidation follows the actual
selection snapshot, including its effective rank ceiling.

[Eleven exact native labels](evidence/0.123.0/coop-lobby-locales.json) are connected
through the existing locale lookup in all fourteen languages. The scoped
`restore-coop-lobby-locales.py` tool checks their descriptors and values
without replacing unrelated catalog entries. The
[source review receipt](evidence/0.123.0/coop-lobby-ui/source.json) binds eight
reviewed source scopes, two presentation files and the native/locale manifests.
`check-coop-lobby-source.py` verifies those receipts, cross-file action
connections and six stdin-only Rust syntax parses. Authored filter, retained-form,
party-view and codec/projection regressions remain uncompiled and unrun.

## Validation and limits

`scripts/check-coop-lobby-ui.py` verifies exact target bytes and decoded
boundaries, every retained query/plan/journal/result commitment, data and TypeID
bindings, and **669 isolated original-instruction cases**: five Node captures,
125 signed-rank collection cases, 24 retained-rank cycle cases, 513 byte/clamp
cases and two Change action cases. Node capture stops before the engine builder;
allocation and supplied state are explicit fixture seams. The handler's raw
Ghidra subject omits its external dispatch table, so its incomplete decompilation
does not supply switch semantics; exact original instructions and the separately
bound table supply those selected branches.

These are static recovery and isolated instruction results. Source compilation,
Rust/ECS execution, actual directory/party traffic, UI delivery/focus, real image
loading, rendered layout and original/rebuilt parity remain unverified. The
external busy-service capacity claim under #257 remains a separate issue.

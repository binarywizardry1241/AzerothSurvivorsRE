# Lobby defaults and filters — 0.115.0

Target SHA-256: `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [manifest](evidence/0.115.0/coop-ui/manifest.json) binds exact native owners,
Ghidra results, canonical extracts and locale payloads. Permanent #63 in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status.

## Presentation boundary

The existing `CoopUiPlugin` picker/modal, filters, capacity, roster and retained
scroll now connect to the [public directory](coop-directory-0.115.0.md) and
[Host/Code service requests](coop-forms-0.115.0.md). The direct-peer runtime feeds
the separate actual session roster; public directory snapshots never substitute
for simulation heroes. World bootstrap/replication have separate connected source
in the [backend report](coop-0.115.0.md); execution remains unverified.

`LobbyRow.zone_key` retains the exact received **localized zone display string**;
its historical field name does not designate the server's canonical key.
Filtering/cycling compares that received value byte-for-byte, alongside received
`unlocked` eligibility and independent `has_password`. The earlier wire producer
computes eligibility from the selected backend class's saved unlock count and
resolves native class/zone locale keys. Rich row metadata and host-title tooltips
now reach the existing list; source connection does not establish service or
rendering behavior.

The [startup alias proof](evidence/0.115.0/coop-ui/startup-alias.json) follows the
identical 16-byte resource TypeID through registration, the FunctionSystem
initializer and its tuple-state slot to the input handler’s actual resource
pointer. The registered destructor independently confirms list/string/roster
ownership. This binds the zeroed startup fields to the controls; unrelated
structures with coincidentally matching offsets are not used as defaults. The
[picker-open proof](evidence/0.115.0/coop-ui/open-admission.json) independently
follows the same TypeID into the picker input system and its Action 10 branch;
opening changes only the open byte and its ECS change tick.

## Current native contracts and source

| Contract | Native owner/site | Connected source |
| --- | --- | --- |
| Initialization | Resource initializer `14020b490`, local state `14020b7dc..14020b8dd` | Filters begin off, zone is absent, visibility is public and capacity is zero (displayed as five). |
| Filter selection | `14021a1c0`, event table `145f1452c`, events 11/12 | Clicks toggle retained unlocked/no-password values; ordinary menu/updater/options/input gates apply. |
| Zone cycle | Event 13, `14021a8d9..14021ad89` | Distinct received zone strings from the **complete** snapshot, in first-appearance order. Any → first → next → any. Empty lists, a last key or a disappeared selection clear to any. Hidden rows still contribute keys. |
| Public/private | `1402f2930`, event 3 at `14021a869` | One local control toggles `Public: in the list` / `Private: by code only`; false is public. The retained value feeds the Host request; service creation has separate proof. |
| Predicate/count | `1402f0f50`, actual row admission `14020fa60` and viewport row iteration | Conjunction of selected unlocked eligibility, absence of a password and exact zone-byte equality. Preserve every admitted row and original order. No capacity or synthetic first-eight filter. |
| Empty/count labels | `14020fa60`, `1402f0f50` | Empty received lists use `No public lobbies right now. Host one!`; nonempty lists with zero matches use `No lobby matches the filters.`. Show `{shown} of {all} shown` only when fewer rows match. An absent snapshot remains absent. |
| Control geometry | `14020e190`, filter-row initializer in `14020fa60` | 36px minimum width, 10/5px padding, 4px radius, 1px border inactive / 2px selected; row has 8px column gap, 6px row gap and centered items. |
| Capacity | `1402f2b80` / event 10 | Preserve the existing 1–5 selector and zero-to-five display; current retained byte is +0x133. |
| Lifetime | Events 0/7 in `14021a1c0`; picker Action 10 at `14010c8f5` | Tab changes and closing preserve selections. Opening marks the change tick and sets only the open byte; filters, zone, visibility and capacity are retained. |

The six current filter strings use the ordinary fourteen native locale catalogs
recovered under [menu/options](menu-options-0.115.0.md). Player-supplied locale
lookup retains priority. The `Zone: {zone}` substitution uses the exact received selected
string, as the native formatter does. Historical capacity/roster/picker and locale
subset evidence remains bound to [0.113.2](coop-ui-0.113.2.md); it is not relabeled
as a complete current-screen or backend reconstruction.

## Static evidence and limits

`python3 -B scripts/check-coop-ui.py` verifies current EXE/range/extract
hashes and replays 1,164 input, 336 filter-count, 256 startup-prefill, 256 OPEN-retention and 256
capacity-display cases, plus the resource descriptor, three Node captures and
fourteen six-label locale subsets. Input String cloning,
byte comparison, vector allocation/freeing and parent UI builders are explicit
fixture seams; complete ECS acquisition, dispatch timing and rendering are not
executed. The authored live-view regression checks actual source filter
projection, exact received-string cycling and both empty states, but remains uncompiled/unrun.

Rust syntax parsing/formatting and source connectivity are separate from source
execution. Compilation, actual ECS/input/locale scheduling, live snapshots,
rendering and original/rebuilt UI parity remain unverified. Co-op gameplay,
networking, world bootstrap and server/performance claims retain the separate
source, service and unrun validation boundaries in the current
[backend report](coop-0.115.0.md).
#63 remains open for those limits; #41 retains broader native ownership and
unresolved alias coverage. No further concrete missing local operation was found
in the selected defaults/filter/read-only projection path.

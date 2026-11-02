# AS reference interfaces — 0.121.0

Permanent **#41**, leads **Q41-F01/F02/A01/A02/M01**. Installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [complete projection](evidence/0.121.0/as-reference-frontier.json),
[receiver proof](evidence/0.121.0/transport-pointer-boundary.json) and
[game/co-op review](evidence/0.121.0/gameplay-reference-review.json) distinguish
saved native observations, interface classification and current behavioral
applicability. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation status.

## Complete current reference projection

The actual-body diagnostic association contains **315 native owners**, including
**291 with genuine Rust Location records**. The wider declared-extent association
contains **327 owners**, including **302 with Rust Locations**. Literal-only
contexts and declared-only associations remain distinct; none establishes
semantic AS ownership by itself. Owner sets are frozen before projection, with
an invariant rejecting empty or newly inserted context keys.

All **4,046,360** saved reference records were considered. The selected actual
body contexts contain **32,775 references**; none reaches any of the **8,048
unowned executable destinations**. The complete explicit-operand stream adds
**7,052 expressions** from those actual contexts, also with zero destinations in
that unowned set. These are exact bounded negative joins, not proof that AS has
no undiscovered code, incoming aliases, computed targets or filename-free systems.

The complete ignored per-site artifact retains **138 indirect sites** with
declared or actual AS diagnostic context. Their structural dispositions are:

| Disposition | Sites |
| --- | ---: |
| Declared-extent context without an actual AS-context body | 13 |
| Exact `CloseHandle` import interface | 5 |
| Already reviewed guarded-table interface | 45 |
| Additional actual-body calls and jumps reviewed below | 75 |

The actual-body population is **43 CALLs and 82 JMPs**. The game/co-op review
accounts for all **38 additional CALLs and 27 game/co-op JMPs**; ten UI/font
JMPs are reconciled by the [UI/font entry review](as-ui-entry-roles-0.121.0.md).
That review's producer/consumer continuation identified the separately owned
font serialization **#250**, Party DPS **#251** and HUD clock **#252** findings.
Both independent raw populations were also
consumed completely: **83,068 F01 records** select those same 125 actual-body
sites, and **651 F02 records** select zero. Site, kind and owner equality with
the actual-opcode projection is checked, rather than assuming those global
populations are identical. All fourteen retained finite metadata/Codex
questions preserve their earlier classified contracts. Their remaining
new-target mapping/applicability alone is excluded from repair choices; old
source and semantics are not reset.

## Concrete receiver construction and publication

The peer connection interface is now traced through its producer and consumer.
Host accept returns its data/vtable pair in RAX/RDX. The current server tick
stores those values at scratch `rbp+aa0/+aa8`; the scratch peer begins at
`rbp+5f0`, establishing peer offsets **`+4b0/+4b8`**. The complete **`0x4c8`**
copy into the peer vector preserves the pair. Rejection publication at
`145b34936` calls that peer's vtable slot `+18` with serialized bytes.

The current host-listener vtable `14619cab8` has `+18` pointing to accept factory
`145b5caa0`. Two identical current TCP vtables at `14619cb38` and `147685110`
establish:

| Slot | Current target and role |
| --- | --- |
| `+18` | `145b5da60`: write little-endian u32 payload length and bytes, then pump. |
| `+20` | `145b5d900`: pump and take a complete receive frame; retain the one-MiB receive bound. |
| `+28` | `1400719f0`: read the live byte at TCP object `+38`. |
| `+30` | `145b5db40`: pump, request shutdown kind 2 and clear the live byte. |
| `+38/+40/+48` | `14007e9a0`: zero-valued optional transport observations for TCP. |

The current accept factory constructs the 64-byte TCP object and returns its
vtable. Existing `coop/tcp.rs` implements the transport methods; the
`coop/session.rs::Connection` dispatch and flush consumers already use them.
Concrete backend selection remains polymorphic. This classifies the peer
interface without pretending every receiver slot names a TCP implementation.

The **server `+1968/+1970` interface is different**. Initializer `145b12840`
captures the caller's RDX/R8 data/vtable pair unchanged; thread wrapper
`145b38bf0` forwards it, and the initializer publishes it into those fields.
Its slot `+28` receives an output pointer and receiver, rather than using TCP's
live-byte getter signature. Existing local-client request/event adapters supply
the reconstructed AS-to-engine boundary. Backend enumeration and generic engine
internals are separate from recovering that interface.

The review retains all 35 receiver calls by their actual layout: 15 caller-supplied
core-interface sites, two host-accept sites, six guest-upstream sites, ten peer
sites and two actor-connection sites. These are interface roles, not 35 missing
implementations or 35 fixed TCP callees.

## Remaining classifications and retained source

The updater's nullable vtable-slot-zero cleanup call is a generic boxed-drop
interface. Windows XInput acquisition retains its previously recovered external
`XInputGetState` boundary; a runtime DLL export is not an unknown AS body.
The enemy call at `145c14e5d` has exactly two statically selected candidate
targets, `145c51590/145c515e0`, supplied by two LEAs and CMOVNE. Their wider
formula/state applicability stays with the enemy/scaling owners.

The current server name-result selector at `145b2309a` consumes helper
`145ab5d60`'s name validation outcomes. Existing shared name normalization and
roster rejection mapping retain that behavior. TCP pump switches classify the
low two bits of standard IO error representations, stopping at the socket/error
interface. Party-control, hazard, enemy, demon, upgrade, gear, jewelry and spell
numeric dispatch source remains with the exact owners listed in the review.
Current field/domain/dependency correspondence does not erase prior recovery.
Affix effects, predictive aiming, star/set consumers and additional-player
scaling retain their independent selected findings.

The separately unobserved ordinary-upgrade helper `145b778f0` supplies the
existing five magnitude lanes. Its original cases include the retained
`seal_fate`, `soul_fire`, `lightwell` and `faerie_fire` target-cap keys and rarity
bounds. It is not evidence of a new sixth upgrade or an absent magnitude path.
The current expanded talent selector's meaning is independently owned by
[the selector-36 report](talent-selector-36-0.121.0.md); it must not be reopened
from an unobserved-range or raw switch count.

These classifications identify no additional source defect. They do not claim
complete current enum/alias/consumer semantics, whole-module equivalence or
closure of #41. A concrete discrepancy still requires its live AS producer,
conditions and consumer proof before a repair.

## Reproduction and limits

```sh
python3 -B scripts/classify-q41-as-references.py
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-q41-transport-boundary.py
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/replay-switch-correspondence.py
```

Default operation reproduces and compares the compact proof and exact complete
per-site artifact without writing. The reference checker validates frozen
target/input commitments before and after its complete joins. The receiver
checker verifies fourteen original code ranges, two complete TCP vtables, the
host-listener accept slot, the saved REA plan/journal/result and source receipts.
Its raw Ghidra decompilation has
external-call/PIC truncation and incoming-type limitations; original bytes and
complete instruction boundaries govern the stated connection proof.

The [saved switch replay manifest](evidence/0.121.0/switch-correspondence-replay.json)
records the complete producer invocation and immutable initial source snapshots.
Its default replay verifies the published proof without writing. Native tables,
candidates, locations and classifications must match the original witness;
all fourteen initial source-receipt arrays remain unchanged. The separately
reviewed CreatureQuery witness retains its exact query subject/result guards
and four frozen fixture inputs. Tool provenance is distinct from a new source
review or behavioral recovery.

No application compilation, compiling test, game/client/server/network operation,
installed save/settings mutation or original/rebuilt comparison occurred.
Source execution and parity remain unverified.

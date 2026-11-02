# Terminal visual ownership — 0.107.0

This is bounded static recovery for installed EXE **0.107.0**, SHA-256
`92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a`.
The [contracts](evidence/0.107.0/terminal-visuals/contracts.json) bind each
current native range, call, literal and system vtable. Current implementation
status remains in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md). The earlier
[0.105.0 terminal report](terminal-flow-0.105.0.md) retains its historical
provenance; its RVAs and component identities were not assumed current.

## Construction and component registration

The current embedded tuple at `145df7faa` names `EndAction`, `Interaction`,
`Node`, `BorderColor`, `BackgroundGradient` and `BoxShadow`, plus its parent.
It contains neither picker `Hover` nor Bevy `Button`. Its native registration
`1402ef760` calls the current component owner `140123b80`; the latter registers
one-byte EndAction and calls the separate Interaction bundle getter `14019c6a0`.
Fresh Ghidra pseudocode for both component owners is retained in the manifest.

EndAction and Interaction registration construct empty direct/inherited required
component collections. Shared initializer `144e3e660` copies the 88-byte
component descriptor, preserves the selected component ID at `+100`, and clears
all five hook slots at `+108/+110/+118/+120/+128`. Dependency propagation
`144e3e8f0` visits an inherited dependency list at `+48`; its constructed length
is zero here. This establishes their newly registered defaults. It does not
establish the registry contents after an unclassified later mutation.

The live source in `gameplay/terminal_view.rs::button` already inserts
Interaction directly and omits Button/Hover. Its border, gradient and shadow
components remain present. The terminal input query and the narrow typed
terminal-action gamepad/touch admission remain connected. No visual behavior
change was supported by this recovery.

## Current query and system ownership

The decoded direct-call census admitted **144 call sites** across the selected
Interaction registration aliases and EndAction getter: 72 to the bundle getter,
68 to the custom query getter, one to the engine getter, two to the reflected
getter and one to EndAction. The 68 custom calls belong to **43 query owners**;
changed-Interaction filters explain repeated getter calls. Exactly three also
fetch the current `BorderColor` query getter `14031ea30`:

| Query | Required additional state | System initialization → runner → native visual body |
| --- | --- | --- |
| `1403d2cf0` | 4 bytes, getter `140329580` | `14011c1c0` → `14011c590` → `1401100b0` |
| `1403d33d0` | 56 bytes, getter `140332160` | `1401c1140` → `1401c1570` → `1401b7420` |
| `1403d9d40` | 44-byte picker Hover, getter `1403408a0` | `1400bfa80` → `1400bfc60` → `1400b5ae0` |

The first is a singleton animated control; the second carries card-local
animation state; the third requires the picker Hover state. Current Ghidra
pseudocode for the singleton and card bodies, original query instructions,
registered sizes, direct runner calls and four stored system vtables corroborate
these boundaries. The terminal tuple lacks those required state components.
These three specialized painters therefore do not provide a recovered generic
terminal painter.

Current terminal query `1403d8300` fetches Interaction, EndAction and an optional
32-byte confirmation component, with Changed Interaction. Its system has
initialization `14011b000`, runner `14011b390` and input body `14010a880`.
EndAction getter `14032f0f0` has one decoded direct query caller, at `1403d8336`.
The query has no BorderColor, gradient or shadow writer. Exact 64-bit stored
pointer searches for the selected EndAction and custom/bundle Interaction getters
find no occurrences; this bounded observation excludes neither relative nor
computed references.

## Optional confirmation is separate from terminal appearance

The previously unclassified 32-byte query field has a recovered behavioral role.
The input body tests its optional pointer at `14010ae77`. A missing component
continues directly to action dispatch. When present, its tag at `+18` and float32
timestamp at `+1c` implement a confirmation gate:

- A tag other than 1 arms at the current time.
- An armed repeat below float32 `.35` seconds is ignored and keeps the first
  deadline.
- An elapsed time at least `.35` and below `3` seconds dispatches.
- Expired or unordered elapsed values rearm at the current time.

The terminal tuple does not insert this component, so this is not a reason to
add a confirmation prompt or double-click requirement to terminal actions. Its
exact original type name and every external producer remain outside this scoped
recovery. The recovered acceptance state is distinct from a visual painter.

## Static checks and remaining limits

The retained constructor, registration, query, runner and initializer extracts
form one ownership proof. Most lines are these canonical native extracts;
keeping them with their shared manifest preserves the complete checked chain.

Inspect the recorded checker source from the checkout root:

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/check-terminal-visuals.py --sha256 25ce0f330a191dd9e38f9d5455f0a86106e08ab2750fd25b3d74b6c760517068
```

The checker verifies the selected installed identity, 23 native ranges,
**101 current call contracts**, literals, state sizes, four system vtables,
retained extract hashes and the live action/device source admission. The
Unicorn option passes **45 bounded native vectors**: 24 poisoned-memory
initializer cases and 21 optional-confirmation cases, including adjacent
float32 thresholds, translated deadlines, absent state, NaN and infinities.
Initializer execution admits only reviewed linear data movement. Confirmation
execution admits only listed original instruction boundaries and stops at
accept/ignore/arm exits before native action dispatch or any callee.
`--prepare-rea` writes reproducible raw-function Ghidra plans under ignored
`runtime/`, without launching the target.

CALL-rel32 and selected RIP-relative TypeId scans are discovery boundaries,
not complete native reference or system-scheduling recovery. Engine and reflected
registration aliases are classified separately from custom visual queries.
Later dynamic hook mutation and computed/global terminal visual writers remain
unresolved under **#9/#41**. No active terminal color, lift, interpolation or
shadow behavior was invented. No compilation, compiling tests, application/game
launch, original/rebuilt interaction, rendering, DPI/device or visual parity
comparison was performed. These checks do not close the whole parent gap.

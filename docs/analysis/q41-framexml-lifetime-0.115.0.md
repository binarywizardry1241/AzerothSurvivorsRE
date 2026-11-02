# Core FrameXML and talent publication lifetime — 0.115.0

Permanent **#41/#105**, selected EXE SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This is the source-lifetime follow-through for the
[complete native core patch](q41-data-contracts-0.115.0.md#complete-worldstateframe-behavior--105).
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall implementation status.

## Defect and connected correction

Restoring the full native WorldStateFrame chunk gave the core loader ownership
of `ToggleTalentFrame`, `UpdateTalentButton`, the initial string counter and
micro-button layout before external addons. The older
`gameplay/client/talent_view.rs` bridge still installed those functions on the
first active per-frame publication. It replaced hooks installed by later addons,
reset `AZS_TALENT_TOGGLES`, reanchored the talent/map buttons and cleared the
counter on inactive publication. Its previous fallback duplicated the native
core ownership at a different lifecycle point.

The publication bridge now writes only custom overlay state and owns its
existing transparent mouse/wheel input guard. Core initialization, function
dispatch, later addon hooks, button visibility and anchors remain with their
actual owners. The guard is created once in each VM, shown for an open active
overlay and hidden when closed/inactive. There is no post-addon function
installation, counter reset/clear, button update or restoration path.

The core file remains the unconditional native patch, loaded through the normal
direct/nested FrameXML provider before addons. A failure to load that core is
not concealed by reinstating its functions later.

## Counter and VM boundaries

The current core's exact payload contains one `"0"` initialization. The unchanged
source watcher independently owns observation state:

| Lifecycle edge | Existing source behavior |
| --- | --- |
| First active observation | Stores the string as its baseline; does not request a talent toggle. |
| Later observation in the same VM | Compares strings, toggling once on a changed string. Missing globals leave the prior observation unchanged. |
| Inactive session | Clears the reader's `TalentToggleCounter`; it does not need to clear the Lua global. A later active observation establishes a baseline even if the VM/counter was retained. |
| Again/retry during entry | The client bridge explicitly retains the active client and VM. Publication preserves the counter; an unchanged string cannot manufacture a toggle. |
| ReloadUI / replacement VM | The lifecycle closes the old session and builds a fresh VM/core counter. The changed VM identity establishes a fresh reader baseline. |

The counter reader is not changed by this repair. Its eleven retained native
watcher cases have **0.105.0 provenance**, recorded in the
[historical talent report](talent-view-0.105.0.md). They are not relabeled as a
current native-watcher recovery. The current 0.115.0 core payload and the live
source baseline/reset/VM/retry connections are checked separately.

The existing stats postlude is copied into a new VM's load tail and runs once
after addons. Locale publication changes its stored source; it does not replay
the core wrappers in an existing VM. The separately owned raid-popup and death
wrappers target different functions. This source trace identifies no additional
duplicate installation or ordering defect in those bounded paths; it does not
establish all addon, locale, death/revive or renderer behavior.

## Evidence and checks

The [compact proof](evidence/0.115.0/q41-framexml-lifetime.json) verifies the
current descriptor and full **11,034-byte** native Lua composition, without
copying its canonical fragments or reopening a Ghidra Program. Twelve narrow
source receipts bind the loader, addon order, publication, active-reader gate,
counter observation, inactive reset, retry and ReloadUI boundaries. Unrelated
edits outside those fragments do not invalidate this lifetime connection.

```sh
python3 -B scripts/check-q41-framexml-lifetime.py
lua scripts/check-q41-framexml-lifetime.lua
lua scripts/check-talent-view-bridge.lua
```

The Lua regression executes the **full canonical core patch**, installs later
addon hooks/visibility/anchors, then runs the actual Rust publication body
through repeated active, inactive, open, closed and retry-style transitions in
two fresh widget fixtures. **485 interpreted assertions** pass: 244 fixture
checks (the original 242 plus two guard-creation checks) and 241 lifetime checks.
They preserve hook identity and return tuples, counter increments, button
placement/visibility, managed offsets and one guard per VM. Four deliberately
bad mutations are rejected at their intended assertions: late hook replacement,
counter reset, button reanchor and inactive counter clearing.

The existing Rust regression now checks the same ownership boundary and the
real VM guard's wheel sweep. It is authored but **uncompiled**. The historical
Lua bridge command remains a compatibility entrypoint to the current regression.

Interpreted tests use declared stock-function/widget seams. Rust/ECS/core-loader
execution, real binding/input/modal behavior, rendering and original/rebuilt
parity remain unverified. The source ownership conflict is repaired; these
checks do not close **#105/#41** runtime or parity requirements.

# Executable inventory and decompilation leads

> Historical analysis of **0.91.4** (SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`); that EXE is no longer present. Current inventory follows the [newest supplied target](reconstruction-coverage.md). This report remains bound to 0.91.4 and is not current-target proof. See the [historical 0.92 refresh](target-refresh-0.92.json).

This records a static inspection of `AzerothSurvivors/AzerothSurvivors.exe` on
2026-10-15. The executable was not run. No MPQ was inspected. The purpose is to
identify the game-specific Rust layer and give REA/Ghidra useful native addresses.

## Artifact identity

| Property | Value |
| --- | --- |
| SHA-256 | `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150` |
| Size | 130,840,064 bytes |
| Format | PE32+, AMD64 (`0x8664`), Windows GUI subsystem (`2`) |
| Preferred image base | `0x140000000` |
| Entry point | `0x14570a608` |
| Linker version in PE header | `14.44` |
| PE timestamp | `2026-10-15T17:25:03+00:00` |
| COFF symbol count | `0` |
| CodeView record | RSDS, PDB name `benilla_rogue.pdb`, age `1` |
| PE exception-directory records | 325,439 |

The PE timestamp is a header value, not independently verified compilation time.
The PDB name is a debug-directory reference; it does not mean a PDB was shipped.
Rust source paths, crate/type fragments and panic locations survive even though
there is no COFF symbol table. A compiler-source path contains revision
`48a229ceaefd4985c50990b14116b6d856af0985`. A Cargo source-path fragment names
`bevy_ecs-0.18.1`; this is evidence of that dependency path in the binary, not a
complete dependency manifest.

| Section | Virtual address | Virtual bytes | File offset | File bytes |
| --- | --- | ---: | ---: | ---: |
| `.text` | `0x140001000` | 92,903,166 | 1,024 | 92,903,424 |
| `.rdata` | `0x14589b000` | 32,232,252 | 92,904,448 | 32,232,448 |
| `.data` | `0x147759000` | 309,976 | 125,136,896 | 298,496 |
| `.pdata` | `0x1477a5000` | 3,905,268 | 125,435,392 | 3,905,536 |
| `.rsrc` | `0x147b5f000` | 210,688 | 129,340,928 | 210,944 |
| `.reloc` | `0x147b93000` | 1,287,972 | 129,551,872 | 1,288,192 |

The import table has 39 descriptors, including Windows window/input/audio,
Winsock, OpenGL, cryptography, and Visual C++ runtime libraries. The complete
import names are in the JSON evidence. Imports describe dependencies, not which
graphics/network/gameplay paths execute.

## Game-specific modules present in shipped diagnostic strings

The scanner finds 46 distinct `crates/wenilla-rogue*/src/...rs` paths. Relevant
core paths include:

- `wenilla-rogue/src/game/{mod,abilities,auras,companions,enemy,guardians,procs,talents,upgrades}.rs`
- `wenilla-rogue/src/{content,gear,jewelry,achievements,appearance,talents,mods,save,server,driver,proto,nav}.rs`
- `wenilla-rogue-app/src/screens/{picker,runmods,cards,hud,talents,talentview,rewards,codex,meter}.rs`

`wenilla_rogue_app::screens::achievements` occurs in raw Rust namespace fragments;
no matching `screens/achievements.rs` source-path string was recovered.

The core/app split and exact filenames are useful ownership leads. Filenames,
UI copy, and Rust namespace fragments alone do not establish gameplay rules.
The namespace-fragment scan can join adjacent strings, so its raw fragments must
not be treated as recovered function symbols.

## Prioritized native function candidates

These ranges come from the PE exception directory. The linkage to a Rust file
comes from matching an aligned `(source_path_pointer, path_length, line, column)`
structure and RIP-relative `LEA` bytes referencing it. The scanner does not decode
instruction boundaries, so REA/Ghidra must verify these links before treating
them as function identities. Inlining can put several source files in one range.

| Range (end exclusive) | Source-location leads | Reason to inspect |
| --- | --- | --- |
| `0x1454705e0`–`0x14547d5e6` | `game/mod.rs:1511`; many `abilities`, `enemy`, `guardians`, `talents`, `companions`, `nav` lines | Large shared gameplay update candidate with many inlined subsystems |
| `0x1454bea70`–`0x1454bedbd` | `game/guardians.rs:172,177` | Float-returning scaling calculation; bounded entry index `<12` |
| `0x1454bee60`–`0x1454befed` | `game/guardians.rs:193` | Related float calculation using a second configuration entry field |
| `0x145461360`–`0x145462623` | `game/mod.rs:1448,1460,1484` | Core game-state helper candidate |
| `0x1454a9fe0`–`0x1454aaee6` | `game/upgrades.rs:127,160,300` | Upgrade/choice helper candidate |
| `0x1454b1840`–`0x1454b2d10` | `game/upgrades.rs:127,247` | Another upgrade helper candidate |
| `0x14548a820`–`0x14548dc33` | `game/talents.rs:785` and content lookup locations | Talent-related helper candidate |
| `0x1453f0460`–`0x1453f3999` | `save.rs:105,107,334,336` | Save parsing/serialization candidate |
| `0x145401080`–`0x14540539c` | `server.rs:610,627,678` | Server-side state/message candidate |
| `0x14540e180`–`0x145412602` | `achievements.rs:162` | Achievement/progression candidate |

The complete location records, source line/column values, instruction addresses,
and native ranges are in `evidence/executable-inventory.json`.

A bounded `objdump` inspection of the two guardian ranges confirms actual
floating-point calculations rather than just nearby strings. Both address a
configuration-table candidate using base `0x1466c7a18`, a lookup-result stride of
`0xb8`, a pointer at offset `0x48`, and a pointed-to entry stride of `0x50`. The
first reads a float at entry offset `0x30`; the second reads offset `0x34`. Both
enforce a 12-entry index bound. This does **not** prove that these are separate
guardian definitions or that every zone configures 12 guardians. The base is
eight bytes before the zone string-pointer record candidate independently
identified at `0x1466c7a20`, so its `+0x48` pointer coincides with that record's
`+0x40` enemy-slice candidate. The table type and lookup-result meaning still
require native consumption linkage.

The first range reads a state float at `0x8cc`, divides it by `60`, and forms a
polynomial with coefficients `1`, `0.12`, and `0.009`. It also uses a conditional
`powf` call with base `1.22` and nonnegative `(state[0x8cc] - state[0x854]) / 60`
exponent. The called thunk at `0x14570b233` is an indirect jump through IAT entry
`0x14589b408`, resolved from the PE import table to
`api-ms-win-crt-math-l1-1-0.dll!powf`; those bytes/import details are recorded in
the assembly manifest.
This establishes timed scalar calculations. The additional caller/dataflow
evidence below supports HP and attack-damage roles. Mode and modifier field
names still require more analysis; the recovered arithmetic is not yet a
complete gameplay specification.

The direct relative-CALL byte scan finds two caller ranges for both helpers:

| Caller range | Call scalar 0 | Call scalar 1 |
| --- | --- | --- |
| `0x1454705e0`–`0x14547d5e6` | `0x14547beb4` | `0x14547bec2` |
| `0x145499a60`–`0x14549e893` | `0x14549dedd` | `0x14549def0` |

The second caller uses 344-byte records. At `0x14549df23` onward it compares the
first helper's return against record field `0xf4`. If increased, it preserves a
clamped ratio `field[0xf0] / field[0xf4]`, writes the new return into `0xf4`, and
writes the scaled ratio into `0xf0`. This strongly suggests maximum/current
health preservation. It stores the maximum of the second helper's return and
field `0xf8` back to `0xf8`. The subsequent combat-consumer trace below links
`0xf8` to queued attack damage and the player-health subtraction helper. These
are static native dataflow findings; gameplay execution was not performed.

Exact bounded helper/caller assembly, commands, target hash, output hashes, and
tool version are retained in `evidence/guardian-assembly-manifest.json` and its
four referenced `.asm` files.

## Native boss scheduling and health initialization

Bounded native disassembly establishes consumption of the recovered 88-byte boss
records. The exact excerpts and hashes are retained in
`evidence/boss-assembly-manifest.json`.

The core update at `0x1454705e0` adds its float second argument to state field
`0x8cc` at `0x145470699`–`0x1454706a7`, behind a phase-byte gate requiring
state byte `0x942 == 1`. At `0x145479689`–`0x14547969b`, it loads that clock,
divides by the stored float `60.0`, and keeps the quotient as a local value. A
lookup result multiplied by `184` selects the configuration record relative to
base `0x1466c7a18`.

The scheduled boss check at `0x14547a239` onward:

1. Reads the next-boss cursor from state `0x898` and requires it to be below `5`.
2. Loads the boss slice pointer at configuration-base offset `0x58`. Because
   this base is eight bytes before the recovered zone string pointer, this is
   exactly zone-record offset `80`.
3. Selects the boss with stride `88` and compares its float at offset `64` with
   `clock / 60`. For finite values it skips while `clock / 60 < boss[64]`.
4. Once due, increments the cursor and calls `0x14548f900` with that boss row.

Thus offset `64` is the native scheduled arrival threshold in clock/60 units,
supporting the recovered minute schedules. This is native dataflow evidence,
beyond a UI string interpretation. The complete phase/tick caller contract,
pause behavior, scheduler bypass flags, and every alternate spawn path are not
fully recovered here.

Spawn helper `0x14548f900`–`0x14549042b` reads boss offset `68`, then computes this
health-scalar chain using single-precision operations:

```text
extra_minutes = 0
if state.u32[0x850] == 1 and state.u8[0x935] != 0:
    extra_minutes = max((state.f32[0x8cc] - state.f32[0x854]) / 60, 0)

health = boss.f32[68] * 5.75
health *= selected_configuration.f32[0xb0]
health *= state.f32[0x928]
health *= powf(1.22, extra_minutes)
health *= state.u16[0x232] / 100
```

Names other than the recovered boss field and health role are intentionally left
as offsets until the surrounding mode/modifier contracts are traced. The
configuration pointer here uses the eight-bytes-before-string base described
above; its `0xb0` field is zone-string-record offset `168`.

At `0x14548fd0a` and `0x14548fd19`, the helper writes the same scaled float into
two fields of a new 344-byte actor record, at offsets `0xf0` and `0xf4`. It then
copies that record into the state's actor array at `0x14548fe3b`–`0x14548fe58`.
Together with the separate ratio-preserving rescale caller described above,
this supports interpreting these fields as current and maximum health and boss
offset `68` as the base health input. Effective health is scaled; the table's
number is not the final spawned health by itself.

The adjacent boss offset `72` participates in another scalar using
`sqrt(configuration[0xb0] * state[0x928])`, `powf(1.096, extra_minutes)`, and a
percentage from state `0x234`. It initializes actor offset `0xf8`, which the
combat-consumer trace below identifies as an attack-damage input.

## Guardian kills and attack-damage consumers

These findings are retained in `evidence/combat-assembly-manifest.json` and seven
bounded assembly excerpts.

State field `0x65c` has direct guardian-death linkage:

- Hit/death handler `0x145493450`–`0x145496af3` locates a 344-byte actor by GUID,
  subtracts incoming damage from actor `0xf0` at `0x14549399e`–`0x1454939a3`, and
  routes the resulting nonpositive-health case into death processing.
- Death processing sets actor field `0x68` to `1` at `0x145494498`, reads the
  actor's optional metadata at `0x40`, and carries its guardian-list index from
  actor `0x58`.
- The metadata-present branch updates the corresponding 40-byte record in the
  state list at `0x580`/`0x588` and executes `incl [state+0x65c]` at
  `0x145494942`.
- The same branch consumes a literal describing the slain guardian's lair and
  other guardians becoming stronger, and constructs reward metadata with key
  `type` and value `guardian` at `0x145494a6a`–`0x145494a9a`. The literal bytes,
  addresses, and lengths are recorded in the manifest.

This names `0x65c` as a guardian-kill counter using the native death branch,
message, and reward contract together. Its use in the two guardian scalar
helpers supplies multiplicative factors `1 + 0.25 * guardian_kills` for maximum
health and `1 + 0.05 * guardian_kills` for attack damage, alongside their other
scaling factors. The increases are additive in the counter, not repeated
compounding of the previous stat.

Actor field `0xf8` has a native attack-consumer chain:

1. The actor update loads it at `0x14549ab0d`, applies conditional temporary
   multipliers, and appends the resulting float and attacker GUID to a 16-byte
   queue row at `0x14549acf2`/`0x14549acf8`.
2. The queue consumer reads that float at `0x14549c4b2` and passes it in `xmm1`
   to `0x145463440` via the call at `0x14549c4a3`.
3. That helper preserves the float in `xmm6`, applies damage-reduction/absorb
   handling, then subtracts the remaining value from state `0x3f8` at
   `0x145463743`–`0x145463751`. Other branches use state `0x450` as the matching
   maximum-health value and handle survival/death conditions.

This supports naming actor `0xf8` its base attack-damage scalar. It does not mean
each attack removes exactly that raw value: the inspected paths already include
conditional attacker multipliers and player defenses, and every attack variant
has not been traced.

## Ability cooldown and effect-power consumers

Nine bounded excerpts in `evidence/ability-assembly-manifest.json` connect the
recovered ability definitions to native consumers.

Definition lookup `0x1453e37e0` scans table `0x1466cab30` using 120-byte strides,
compares key lengths and bytes, and returns the matching row pointer. Its byte
limit `0x3408` is exactly 111 records. Constructor `0x1454e7480` also performs this
lookup and stores the resulting definition pointer at the head of an 80-byte
runtime record.

The core update consumes 80-byte ability records at state `0x298`/count `0x2a0`.
At `0x145471497`–`0x1454714a5`, it subtracts tick delta from runtime field `0x24`.
The due path sets that timer to positive infinity at `0x145471734`, copies the
runtime record, and calls cast helper `0x1454b76a0` at `0x1454717d3`. The success
path reads definition offset `72` at `0x145471b27` and computes:

```text
interval = max(0.25,
    definition.f32[72] * 1.4 * runtime.f32[0x2c]
                            * runtime.f32[0x0c] * state.f32[0x458])
```

One definition-kind branch additionally adds a scaled value from definition
offset `88`. On success the timer becomes the minimum of its existing value
and the computed interval, allowing other cast-side adjustments to survive.
On failure, the code writes a `0.2` retry interval at `0x145471ce5`. These are
clock/tick-delta units. This identifies definition offset `72` as a base cast
cooldown input, while its raw value alone is not the effective cooldown. Rank,
rarity, talent, mode and kind-specific meanings of the modifiers remain open.

Cast helper `0x1454b76a0` reads the definition pointer from the runtime row at
`0x1454b771a`, then reads definition offset `68` at `0x1454b783c`. It combines
that value with a `1.4` factor, runtime fields `0x08`/`0x28`, a definition-kind
factor, a conditional maximum-health contribution, and state multipliers. One
attack branch optionally applies another multiplier and passes the resulting
float in `xmm2` to actor hit/death handler `0x145493450` at `0x1454b7e4e`. That
handler's health subtraction is independently retained in the combat evidence.

Thus offset `68` is an effect-power input with demonstrated damage use. It must
not be labeled universal damage for every definition: the table also contains
heals, shields, buffs, and other effects, whose individual cast branches have
not all been traced. Target/range/radius rules and exact rank/rarity scaling are
also unfinished.

## Embedded addon API source template

The executable contains a readable Lua source template, extracted byte-for-byte
to [`evidence/official-addon-api.lua`](evidence/official-addon-api.lua).

| Property | Value |
| --- | --- |
| File offset | `0x68a6084` |
| Preferred virtual address | `0x1468a7484` |
| Length | 5,959 bytes |
| SHA-256 | `adc7dc2be3b8d8f93439a1ad8768bb50c4cbc4bd0d26fd24ee387d7974b761a4` |

This is a shipped source contract, not a string-only guess. The template still
contains `HUD_CVARS_LUA` in `AZS_HUD_CVARS`, so native substitution/injection must
be traced before claiming this exact text executes unchanged.

Exact exported function definitions in the template:

- `AZS_GetRunTime`, `AZS_GetPhase`, `AZS_GetRunLength`
- `AZS_GetBosses`, `AZS_GetGuardians`, `AZS_GetUpcomingBosses`
- `AZS_GetMeter`, `AZS_SetHudShown`, `AZS_IsHudShown`, `AZS_UnitKind`
- Parsing/event helpers `AZS_Fields`, `AZS_List`, `AZS_ApiOnEvent`

The code carries the last received run clock forward only while `AZS_RUN.ph ==
"playing"`. Its phase comment lists `ready`, `playing`, `choosing`, `paused`,
`dead`, `victory`; actual native transition rules are not established by that
comment. Boss/guardian getters filter `AZS_UNITS`. Upcoming bosses filter
`AZS_SCHEDULE` for `state == "due"` and calculate `left = at - now`.

The event handler consumes `CHAT_MSG_ADDON` prefixes:

| Prefix | Destination / list field order |
| --- | --- |
| `AZSRUN` | `AZS_RUN`, key-value fields |
| `AZSZONE` | `AZS_ZONE`, key-value fields |
| `AZSBOSSES` | `AZS_SCHEDULE`: `index,at,name,final,state` |
| `AZSUNITS` | `AZS_UNITS`: `kind,id,name,hp,hpm,state` |
| `AZSTGT` | `AZS_TARGET`, key-value fields |
| `AZSSPELLS` | `AZS_SPELLS`: `key,spell,rank,cd,cdmax` |
| `AZSBUFFS` | `AZS_BUFFS`: `spell,left` |
| `AZSMETER` | `AZS_METER`: `name,dmg,dps,share,proc` |
| `AZSTAKEN` | `AZS_TAKEN`: `source,dmg` |
| `AZS` | `AZS_STATS`, delegated to `AZS_Parse` if defined |

`AZS_Fields` parses `key=value` fields separated by semicolons. `AZS_List` splits
rows on semicolons and fields on commas. Both convert numeric-looking values via
`tonumber(v) or v`. The payload producer, all transmitted key-value field names,
update frequency, native stat formulas, and Lua injection path remain native
analysis tasks.

## Reproduce

From the checkout root:

```sh
python3 scripts/inventory-executable.py
python3 scripts/inventory-executable.py --capture-guardian-assembly
python3 scripts/inventory-executable.py --capture-boss-assembly
python3 scripts/inventory-executable.py --capture-combat-assembly
python3 scripts/inventory-executable.py --capture-ability-assembly
```

The helper uses Python's standard library, stays inside the checkout, and writes
the bounded JSON inventory and extracted Lua template. The optional assembly
flags additionally invoke the installed `objdump` to save the bounded
assembly excerpts and their manifests. It does not use REA, start the target,
enumerate/read MPQs, or require an external Python package.

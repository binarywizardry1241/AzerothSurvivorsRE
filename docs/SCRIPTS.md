# Recovery and validation tools

Tool names describe a task, rather than a game release. Use the same entry point
when extending a tool; put genuinely different native layouts, addresses and
rules in explicit hash-bound inputs and extend the existing shared modules. Do
not add another script for a run, release or new assertion. A newer EXE
must still be identified and revalidated before a profile can run. Similar
behavior or mostly additive release notes do not validate an older address map.

Build/run commands are in [README](../README.md). Native recovery setup and export
storage are in [REA](REA.md). The current target and open reconstruction limits
are owned by [CURRENT-STATE](CURRENT-STATE.md).
Post-source checks and completed finding history are in
[verification-needed](verification-needed.md). Permanent IDs are reserved across
both documents; moving a finding does not close its verification.

## Stable entry points and shared logic

| Task | Owner |
| --- | --- |
| Inspect the installed identity | `register-target.py --inspect-installed` |
| Inventory the registered target | `inventory-current-target.py` |
| Check native/system/claim accounting | `check-reconstruction-coverage.py` |
| Read source/verification finding ownership | Existing `coverage_common.finding_register` / `finding_reference` helpers |
| Compose the bounded AS discovery graph and queue | `compose-as-discovery.py` |
| Reproduce discovery registry counts and query receipts | `summarize-as-discovery.py` |
| Acquire a whole-image native census | `census-native-image.py`, with the REA driver |
| Recover a feature or check its contracts | Extend the closest existing recovery/checking entry point |
| Select a retained semantic suite | The existing tool's `--list-contracts` and `--contract <name>` |
| Check addon bootstrap, timers and totems | `check-addon-bootstrap.lua` with the default suite, `--timers` or `--totems` |
| Check native addon API, timers or co-op directory | `check-addon-api.py`, `check-addon-timers.py` and `check-coop-directory-transport.py` expose their retained suites through `--list-contracts` |
| Consolidate identical analysis payloads | `consolidate-analysis-exports.py` |
| Inspect a recorded execution source | `script_sources.py --show ... --sha256 ...` |

These paths are relative to `scripts/`. Native checkers keep explicit target/hash
guards. Their stable names do not imply that an old profile accepts a new EXE.
The discovery registry records paired reproduction commands: compose its immutable
graph first, then summarize that profile. Both accept read-only `--check`; neither
infers semantic closure from counts or runs a compiler, game or service.
The cumulative `check-addon-bootstrap.lua` suite accepts an explicit retained API
file and checks the capabilities that file actually supplies.

Shared implementation has one owner:

- `script_sources.py`: project-local module loading, relocation lookup, exact
  historical source verification and retained semantic suite selection.
- `discovery_native_subject.py`: exact full-PE/raw-slice query input and receipt
  binding for discovery composition and summarization; non-compiling rejection
  fixtures are in `test-discovery-native-subject.py`.
- `native_recovery.py`: recovered string expressions, effect-record decoding,
  synthetic x64 reset mechanics, exact float32/bit conversions and byte digests.
- `native_camera.py`, `native_bindings.py`, `native_card_layout.py`,
  `native_localization.py`, `native_updater.py` and `mob_movement_fixtures.py`:
  fixture models reused by current checks. These are imported helpers, with no
  obsolete recovery CLI. Addresses are rebound only through reviewed evidence.

Keep caller-specific profiles and argument signatures explicit. Identical helper
implementations can be shared; superficially similar rounding, serialization or
native rules must retain their actual differences. New recovery records should
bind the caller and its shared helper sources, as well as the target input.

The White Devilsaur source/byte/query checker is
`check-white-devilsaur.py --require-retained-queries`. The older
`check-white-devilsaur-leads.py` preserves the preimplementation proof;
`--require-original-source` also requires its historical source snapshots.
Neither compiles or runs Rust/game/server source.

## Historical execution sources

Historical recipe links resolve through the provenance index below;
current tools and exact historical execution sources remain distinct.

The [script provenance index](analysis/script-provenance.json) connects former
entry points to their retained tool or shared fixture. Superseded entry points
are retired only after their live imports are migrated. Unique native extracts,
fixtures, original hashes and version-specific evidence remain unchanged.

Execution manifests describe the code actually used at the time. Their old script
names and hashes are necessary provenance; they are not current command names.
The index pins each producer's source commit, and `script_sources.py` verifies the
exact committed bytes rather than accepting a newly renamed or refactored file
under an old hash. Historical script inspection requires the original Git objects
or separately retained exact producer bytes. Source builds
use the retained assets and need neither this history nor a reference EXE.

To inspect a recorded generator, pass its stable or former path and recorded
source digest. The digest disambiguates older implementations of the same task:

```sh
python3 -B scripts/script_sources.py --show scripts/<tool>.py --sha256 <recorded-source-sha>
```

Historical reports retain the actual target version/hash because those identify
the bytes recovered. Current commands use stable names; an unavailable historical
EXE cannot be replaced by a newer EXE merely to rerun an old recipe. Build caches,
toolchains and unique analysis payloads are not part of script cleanup.
Source-inspection commands and links to archived recipes do not repeat a native
check. Reported validation belongs to its recorded target and execution source.
Generated source comments and immutable manifests may retain former generator
names: changing them would erase provenance or invalidate unrelated build inputs.

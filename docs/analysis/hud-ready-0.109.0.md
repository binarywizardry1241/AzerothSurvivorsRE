# Ready-label HUD transition — 0.109.0

The installed target is SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`,
140,447,744 bytes, read in place. [verification-needed](../verification-needed.md) owns
permanent gaps **#7/#41**. This report repairs one missing HUD transition;
the [current HUD report](run-hud-0.109.0.md) owns the expanded constructor,
settings, drag/persistence, pause and FrameXML recovery and their source repair.
The [older custom HUD](run-hud-0.105.0.md) and
[FrameXML HUD](framexml-hud-0.108.0.md) retain their actual target provenance.

The reconstructed “Move to begin.” label previously kept its initial opaque
gold color. The selected native updater pulses its alpha continuously. The
existing [stored HUD](../../crates/azeroth-survivors-re/src/gameplay/stored_hud.rs)
now retains that text entity and updates its color from the application's
`Time::elapsed_secs()`, independently of the run clock and stored-level-button
hover animation.

## Native contract and current owners

Fresh REA 6.5.0/Ghidra 12.1.4 raw imports establish these bounded current owners:

| Owner | Address | Recovered relationship |
| --- | --- | --- |
| Main HUD update | `14028e670` | Calls the constructor at `14028ec71`, boss rows at `14028fa0f`, and icon rows at `140291035`; owns the ready color write. |
| HUD constructor | `14020ccd0` | Localizes `hud.move_to_begin` at `14020e550`, then supplies its 40px text bundle. |
| Boss rows | `140209d00` | Iterates the provided boss vector and calls content helper `14020b1f0`. |
| Build rows | `14020a060` | Builds the two supplied icon vectors; distinct from the visibility owner. |
| `hudparts.rs` visibility | `14007d0b0` | Registers and reads the nine visibility CVars; it is not the boss/icon constructor. |

The [manifest](evidence/0.109.0/hud-ready/manifest.json) binds each owner's
declared PE extent, file bytes, REA Evidence ID, raw input and analysis profile.
These relationships identify recovery boundaries; they do not certify every
branch, native/source equivalence or complete HUD ownership. In particular,
this repair does not promote the historical nine-setting visibility contract
or any complete release claim to 0.109.0.

The selected ready transition is established by:

- `1402908ae..140290912`: the ready display branch checks screen state and the
  exact `phase` value `playing` before querying the ready node/color pair.
- `140290b21..140290b74`: when that pair exists, the updater writes its display
  value, then updates the color. Hidden display does not skip the color write.
- `140290b37`: a scalar `f32` from the time resource at `+5c` is multiplied by
  `4.5f` and passed to the imported `sinf`. The following original instructions
  clear its sign bit, multiply by `0.45f`, and add `0.55f`, each separately as
  scalar `f32` arithmetic.
- `140290b63..140290b73`: the updater copies the fixed Srgba gold
  `(0.973f, 0.824f, 0.416f)` and replaces its alpha with that result. The
  sign-mask, scalar constants and color bytes are retained separately.
- Thunk `145bfa117` resolves through this PE's import table to
  `api-ms-win-crt-math-l1-1-0.dll!sinf`.

The connected formula is
`abs(sin(elapsed_secs * 4.5f)) * 0.45f + 0.55f`. `ReadyLabel` marks only the
existing localized text, and `animate_ready` runs after the existing HUD sync
in `RunSet::Present`. It neither recreates the label nor uses delta time, the
run clock or a visibility gate. Existing ready-label admission and display
ownership remain unchanged; their complete current-target equivalence is not
established by this alpha repair.

## Static checks and reproduction

[The recovery/checker](../../scripts/recover-hud-ready.py) verifies the
current installed identity, five owner extents, five instruction ranges, six
literal ranges, the sinf import and the live source route. Its optional Unicorn
probe passes **36 original-instruction cases** over elapsed-time multiplication,
both sine extrema, positive/negative half-amplitude and positive/negative zero.
It injects the sinf result bits: the native time multiplication, absolute-value
mask, scale and offset execute unchanged. It does not test Windows UCRT's sine
against Rust's host sine implementation.

```sh
python3 -B scripts/recover-hud-ready.py --check
python3 -B scripts/recover-hud-ready.py --check --verify
```

The second command needs an existing Unicorn Python installation; collection
also needs Capstone. No dependencies are downloaded. For a fresh native replay,
use `--prepare --work runtime/hud-ready-replay`, run each generated `plan.json`
with `scripts/rea-batch.py`, then use `--collect --verify` with that same `--work`.
This stages fresh evidence for review without replacing the retained copy.

The changed Rust file also syntax-parsed with the existing rustfmt, emitting
only a disposable project-local copy. No build, `cargo check`, compiling test,
game launch or original/rebuilt comparison ran. Rust/platform sine equivalence,
scheduler behavior, actual visible timing and rendered parity remain unverified.
The current HUD report records the other recovered constructor, updater and
settings contracts; complete global/indirect ownership remains **#41**.

# Permanent player forms — 0.105.0

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the permanent-form source portion of **#25**. Followers and
showcase retain their separate owners; [verification-needed](../verification-needed.md)
records the integrated status and deferred comparison.

## Native contract and live connection

Current player descriptor owner **1458f52e0** scans the composed 64-byte effect
rows at Game+7a8/+7b0. The first raw25 row whose spell is **9634** (Dire Bear)
or **768** (Cat) supplies the current display. Other permanent aura rows are
skipped, including Shadowform15473. Race6 selects Bear2289/Cat8571; every other
race selects Bear2281/Cat892. The scan preserves source order and stops on its
first recognized form. It does not choose the last effect or infer a form from
the player's class.

The current model writes **field131**. **Field132** is calculated separately
from the normal race/sex body and remains that body while transformed. The
[retained selector and descriptor instructions](evidence/0.105.0/permanent-forms/manifest.json)
record the actual original-PE byte ranges and their hashes. REA/Ghidra examined
the current owner as a raw slice; its generic ABI and missing external types
are analysis limits. The original instructions establish the register bindings
and the distinct descriptor fields.

`run_effects/forms.rs` now reads the actual composed effect rows.
`Mechanics::player_form_display` feeds `gameplay/client.rs`, which retains the
normal body snapshot and publishes the changed field131 through the ordinary
values handler. The bridge caches run identity and resolved display, resets on
teardown, and restores the ordinary body if the recognized effect disappears.
The existing host merges only changed snapshot lanes, so subsequent health
updates preserve the packet-owned display override and native field132. The
normal client owns model resolution, attachment, animation and live display
refresh; no replacement render path is introduced. The existing permanent-aura
projector continues to supply Cat/Bear/Shadowform spell rows and their normal
persistent effects.

## Static checks and limits

`python3 -B scripts/recover-permanent-forms.py --check` passes **36 native
instruction cases** covering four races, no effects, Shadowform-only, wrong-tag
rows, unknown permanent spells, and both Cat/Bear orders. The unchanged original
selector executes in Unicorn, stopping before the ordinary-body fallback or
descriptor insertion; effect rows and race registers are explicit inputs.
The checker verifies the newest target, retained code/assembly hashes and the
live source connection. The current balance-catalog checker separately owns
the complete selected talent payloads.

Rustfmt parsed the three changed Rust modules without compiling. The authored
Rust regression consumes the native vectors but was not run. Compilation,
actual MPQ model loading, camera/collision consequences, aura presentation and
original/rebuilt rendering/input parity remain unverified. The bounded selector
checks do not certify the complete player descriptor or whole #25 scope.

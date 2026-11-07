# Current controller acquisition and input connections

Target: installed read-only 0.109.0 EXE, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns #22/#41. The
[manifest](evidence/0.109.0/xinput/manifest.json) and canonical assembly bind the
fresh REA/Ghidra poll, axis publisher, backend selector and loader. Earlier
[input](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/input-0.105.0.md) and [XInput](xinput.md) reports retain their
historical identities; their addresses are not current contracts.

## Backend and acquisition source

Current `140367ba0` recognizes exact, case-sensitive `WOW_PAD` values:
`xinput` selects the custom producer, `gilrs`/`wgi` select the ordinary backend,
and `off` disables controllers. Other values and an absent/unreadable variable
fall through to `GetModuleHandleA("ntdll.dll")` and the presence of its
`wine_get_version` export. Wine selects XInput; otherwise the ordinary backend
is selected. The export is inspected, not called. The registration branch at
`1401bab3d..1401bab75` distinguishes all three outcomes.

`140367560` tries `xinput1_4.dll`, `xinput1_3.dll`, then `xinput9_1_0.dll`, accepting
the first successful `XInputGetState` lookup. Failure leaves controllers off,
without starting the ordinary producer. The module remains loaded for process
lifetime. The new
[acquisition adapter](../../crates/azeroth-survivors-re/src/native_input/acquisition.rs)
and `main` plugin selection implement those Windows routes. Other supported
platforms retain Bevy's existing backend; this Windows artifact cannot establish
their driver/normalization behavior.

Current `14037d9d0..14037e661` visits slots 0–3 in order. It saves the old shared
probe deadline before advancing a due deadline to `now + 2.0`; connected slots
are polled every pass and empty slots only when that old deadline is due.
Equality is admitted. Successful new/reconnected slots allocate a new entity,
name it `XInput Controller {slot + 1}`, and publish connection to aggregate and
typed lanes. Failed connected slots clear their marker and publish disconnect;
failed empty slots emit nothing. Ordinary Bevy connection processing retains
disconnected entities while removing `Gamepad`; reconnection uses the newly
allocated entity, matching the custom producer.

Every successful poll saves physical values. Initial samples publish all fourteen
ordered button bits, two trigger values and four stick axes, including zeroes.
Later samples emit only changed physical fields. A packet-number change alone
has no value event. Buttons map through the current fourteen mask/tag pairs;
triggers are `f32(byte) / 255`; signed sticks are
`clamp(f32(i16) / 32767, -1, 1)` in tags 0, 1, 3, 4. Each event reaches the
aggregate lane before its typed lane. Producer registration precedes Bevy's
`InputSystems`, and the existing custom device pass subsequently feeds real
controller/FrameXML consumers. There is one acquisition producer per selected
Windows backend.

## Static evidence and remaining work

[check-xinput.py historical recipe](../SCRIPTS.md#historical-execution-sources) checks current byte/assembly hashes,
DLL names, strict selector/loader branches, source registration and:

- all 65,536 signed-stick words and 256 trigger bytes;
- 20 backend-selector cases and 64 library/symbol availability combinations;
- 918 complete poll scenarios, comparing saved slot state, visited slots,
  connection numbering, deadline changes and exact aggregate/typed event order.

The complete-poll fixture executes the original poll and axis helper. GetState
outcomes, Commands allocation, string formatting/cloning, environment and Win32
module/symbol lookup are declared seams. Existing message capacity is supplied;
allocator growth is excluded. Source guards establish selected wiring and
reviewed API correspondence, not Rust type checking or execution. Changed Rust
syntax parses with the pinned project-local rustfmt.

[Current pad recovery](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/pad-0.109.0.md) separately connects secondary mouse
input, queued cursor travel and handoff, with selected arithmetic checks.
Complete custom input/native dependencies beyond those bounds remain open. Bevy event
consumption, driver/hardware input, normalization/filtering, schedule execution,
compilation and original/rebuilt gameplay/presentation/platform parity remain
unverified. This report does not promote the entire input system or #41 to
complete.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/input-0.105.0.md)

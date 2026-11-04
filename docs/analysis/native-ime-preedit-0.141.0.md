# Downloaded-client IME preedit in 0.141.0

This assessment covers the Windows preedit portion of
[#293](../CURRENT-STATE.md#gap-293). The inspected
`installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [0.139.2 commit and key repair](ime-bridge-0.139.2.md) retains its own
evidence and the [0.127.0 reader census](ime-bridge-0.127.0.md) retains its
declared-extent and seeded-complement scope.

## Typed preedit publication and consumption

Windows caret positioning calls `ImmSetCompositionWindow` and
`ImmSetCandidateWindow` at `0x1432014cd` and `0x1432014db`. The
`WM_IME_SETCONTEXT` route at `0x143207f0e` masks bit 31
(`ISC_SHOWUICOMPOSITIONWINDOW`) before `DefWindowProcW`. The composition
route tests `GCS_COMPSTR` at `0x143208d66`, calls the IMM reader and
queues the result with its selection information as a Winit event at
`0x143208e3a`. These paths establish event and caret delivery. Candidate
and preedit visibility depend on the platform and input method.

The exact `Messages<Ime>` identity
`a2da4c51557139bb5ff3c2aa584dbef7` occurs at `0x1465bf670`,
`0x1465bff70` and `0x147120100`. A scan of the executable section
for x64 RIP-relative ModR/M displacement candidates, checked against
decoded instruction boundaries from PE unwind starts, resolves nine
references in three extents.

| Role | Declared extent | Reference sites |
| --- | --- | --- |
| AS message reader accessor | `0x1402f28f0..0x1402f2c17` | `0x1402f296d`, `0x1402f2a18`, `0x1402f2b37`, `0x1402f2b83` |
| Winit-to-Bevy window event adapter | `0x1431585d0..0x14315d81e` | `0x14315b6c7` |
| Ordinary Bevy message registration | `0x1452579a0..0x145257f73` | `0x1452579f5`, `0x145257bd3`, `0x145257ceb`, `0x145257dff` |

There are no exact absolute pointer references to the three identity
copies or to the AS reader accessor. The selected RIP-relative LEA
search finds no reference to the accessor. Its sole verified direct caller
at `0x1400691ff` is the Commit system initializer. The system vtable
contains both this initializer and the wrapper at `0x140069490`. The
wrapper passes the reader to `0x140057810` at `0x1400696cb`; the second
verified direct call to the same forwarder is at `0x140249af3`. Both buffers
accept only record tag 2 (Commit) at `0x14005793e` and `0x140057972`.
All 310 instructions match the retained 0.139.2 forwarder after masking
RIP-relative displacements and relative control-flow operands. The current
loop still writes two keyboard streams.

The [rebuilt AS bridge](../../crates/azeroth-survivors-re/src/ime.rs)
already consumes Commit and publishes the candidate caret. The current
typed path supplies no separate AS preedit renderer to reconstruct. This
bounded search covers the selected identities and encoded references.
Computed references, alternative event routes and actual platform display
remain outside its proof. Windows composition display and
original/rebuilt comparison remain under
[#293 verification](../verification-needed.md#gap-293).

## Range commitments

| Scope | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| AS Commit forwarder | `0x56c10` | 1354 | `852fa5a300dfc0ef72b453ecfcc4637b666ab004a213603b8caa772b1e61063d` |
| AS system initializer | `0x68580` | 631 | `510e00ccec8089c002c74f1d74e288564dd40dc59e6960e92f7149bb4b077d10` |
| AS system wrapper | `0x68890` | 812 | `9b8a787d3efd255cffdd8295a40d0e8ea567fac7ecf16e13e5fc0feae1b2c6d4` |
| Winit caret helper | `0x3200650` | 740 | `0998e6facde5163c9141f2794f38c540fabb3304d087342c5163fb8532ac1793` |
| Winit IMM message dispatcher | `0x3206320` | 17580 | `c16ed11ed0eac8d8168c37ff8fb7fbb011bfd87d13a4d790487e52b052cf63db` |

The journaled Ghidra forwarder query produced
`ev_2952c95cdfef467f904a2ce36bd14974c6a6e4a740cf113fff4f24eca5b6e798`.
The verified result SHA-256 is
`e867ea368e0868896285e93df5a4bd12bf1b3dba7d6ad23c537e113fd868634e`.
The result and journal bind the raw input to the forwarder range above.
The raw import omits external code and data. PE decoding supplies the
caller and import checks independently. Compilation, application execution,
OS input-method behavior and parity remain open.

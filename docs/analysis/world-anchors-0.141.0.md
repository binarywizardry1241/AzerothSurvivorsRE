# World anchor stream and capacity in 0.141.0

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This covers the stream, reset, and admission constituents of
[#317](../CURRENT-STATE.md#gap-317) and `changelog:0.139.2:a6b9bed3be9c9ffa`.
The embedded Lua matches the API extract cited in the
[0.140.0 catalog and projection report](world-anchors-0.140.0.md).

## Stream and world identities

The catalog stores the VM serial at `+0x230` and stream epoch at `+0x238`.
Sync `0x14099cbf3`, stream getter `0x140bb8979`, query `0x1409a54cf`, and
projection `0x1409a16ec` format them as two decimal integers separated by a
dot. Projection appends the frame counter at `+0x280` with the same formatter
to publish `cameraSampleId`. The `worldId` helper at `0x140980880` formats
`m{map}:{epoch}` when a map exists. Position fields continue to use the Lua run
label for `spaceId`.

The host observer `0x140051fb0` compares a 32-bit generation with its saved
value and runs the combat and world resets on change. The world branch jumps
through `0x1408b1180` to `0x1409a3e60` and calls `0x1409805f0`. The reset
increments the epoch and clears catalog rows and unit-scan readiness. It
preserves the Lua run string at `+0x210`. The world context observer at
`0x1409dd8b0` also resets on context changes. It discards the Lua run string
and tracking subscription when the VM serial changes. On a matching map, the
sync path at `0x14099c691` resets again if a previously present Lua run string
differs from the incoming value. The first run label alone leaves the epoch
unchanged.

The [rebuilt catalog](../../crates/benilla-app/src/combat_text/world_anchors.rs)
seats the existing authoritative run identity before the
[presentation dispatch](../../crates/benilla-app/src/local_client/events.rs)
delivers Lua lines. Old handles and cursors fail against the new stream even
when the map and VM remain the same. The embedded wrapper may resync its last
same-map Lua rows under the new token until the zone line arrives. A changed run
label clears those rows again. Position-space labels and the native stream
epoch remain separate inputs.

## Unit scan and admission

The life scan walks matching ECS storage in its existing order. The health
predicate uses a signed comparison at `0x14607d6a8`. The scan checks the
living cap at `0x1409cb74d` after attempting to update the tracked row. A
first-seen dead unit bypasses the living cap. The transition at `0x140980310`
converts a living row to a fallen row in place, freeing a living slot as the
walk reaches it. The sweep at `0x1409cbfd2` handles unseen rows after the walk.
There is no distance or GUID tie sort in the scan.

An unchanged dead entity retains its actor observation after the fallen row
expires or the fallen FIFO evicts it. That observation reaches the dead skip
at `0x1409cb6fa`. The rebuilt catalog now admits first-seen corpses independently
of the living cap, freezes observed deaths, and retains the observation while
the corpse is present. A return to living can create a new row. Exact tied
actor identities depend on the engine's live entity storage.

## Frame callback registration

The combat and world name carriers are added in that order at `0x140046a40`
and `0x140046b06`. Their plugin builders at `0x1409ba3c0` and `0x1409bb720`
assemble separate system groups. The world group includes the context reset,
unit scan, Lua registration, and world callback. Both groups apply the same
dependencies around `VPlateSet`, `UiInput`, and `UiPaint`. The combat
callback `0x1409ca830` reaches `0x140baf760`. The world callback
`0x1409cc3e0` reaches `0x140bafe40`. The selected registrations establish
the shared frame window and each group's callback, with no explicit
dependency between the two callbacks. The rebuilt paint pass runs combat
before world anchors, matching registration order. Exact native execution
order still depends on the final schedule's order for the two groups.

## Static evidence

| Preferred VA range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| `0x147ae2e1a..0x147ae9e0a` | `0x7ae141a` | 28,656 | `24be94eb96a3e539ab7d30a9171090cfd15e2667efa0a9423802b37705f4e8e6` |
| `0x14663df58..0x14663df5d` | `0x663c558` | 5 | `fb828997a7ac83021eb7de92f805db38957ba9e02acdda27c53534754704be00` |
| `0x14099c280..0x14099e9e6` | `0x99b680` | 10,086 | `ddd37e25b955a350ede4087afafd730777121fd1161536395bd83aeac3cb1885` |
| `0x140bb8770..0x140bb8dc6` | `0xbb7b70` | 1,622 | `f6b9e92fe4a7061c601c8b67bbd776a65b537e749c1d906fcd2397b3b97eb0ad` |
| `0x1409a2596..0x1409a261a` | `0x9a1996` | 132 | `1bcc651d6c9a3f22d58605f87a74b4fbd628f172d42191acde5eec81a13d9a67` |
| `0x140980880..0x14098090b` | `0x97fc80` | 139 | `783ca3b29c3b9a98b9747ddb7ff475de6ec35f282faf449799198c072d3506ff` |
| `0x140051fb0..0x1400520f6` | `0x513b0` | 326 | `22cb9ea11ecf6b90d596b69b509343bc779e03b108d939a85045cab4bd89ef2b` |
| `0x1409a3e60..0x1409a3ff9` | `0x9a3260` | 409 | `6b65eff7d40e89b62527e16a46d2d688e4420da2384884a67b7a809263d5180c` |
| `0x1409805f0..0x140980879` | `0x97f9f0` | 649 | `f0f599cc4c8936d87c30efcfa4e85eeb20b448ab017723c2b6f61ac24b88d44e` |
| `0x1409dd8b0..0x1409ddb92` | `0x9dccb0` | 738 | `bb8e7c7fc8278192bc30762bc5b902a89dd91916391a001eac525b05a8a4d90a` |
| `0x1409ca990..0x1409cc233` | `0x9c9d90` | 6,307 | `6c0d5ec4a64da5da1c0f70e13dd028dfaea35bc941688706caec9ad002906b16` |
| `0x14607d680..0x14607d6dc` | `0x607ca80` | 92 | `d0083a9cfedccf7905ea5622656069016db252e3ac25c9a90f02c4a9a185ed44` |
| `0x140980310..0x1409805ec` | `0x97f710` | 732 | `5576488b223941880cf662d5dabab77b22631362bc732227e04ca53b15053277` |
| `0x1400469d4..0x140046b0b` | `0x45dd4` | 311 | `7cb2b8fb4766212c3e32818312a72b8c09f38ebd7ad5d8837f8ab5063897fbd8` |
| `0x1409ba3c0..0x1409bb293` | `0x9b97c0` | 3,795 | `2042844c8c57cdfcf4419a02d90114f5b99808edeb9db663ebe05c55595011da` |
| `0x1409bb720..0x1409bc215` | `0x9bab20` | 2,805 | `7cf13cc75bd54140a876412b0421c9c2bef68244b0e93e0025c5b0fede68f9c8` |

Ghidra recovered the life scan from the original-VA slice with Evidence ID
`ev_f4c330d3072602f578eeaea23dfec97f9af416c79a91e6c926f39071f187d967`.
The exported Evidence subject SHA-256 matches the life scan range above.
The other call, field, and formatter joins come from original PE instruction
decoding. The embedded API passed `scripts/check-addon-bootstrap.lua` with
stubs. Rustfmt parsed both changed Rust files and `git diff --check` passed.
The updated Rust regressions, compilation, in-world behavior, and original
parity remain unverified.

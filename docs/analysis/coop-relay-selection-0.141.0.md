# Selected relay replacement in 0.141.0

Finding [#63](../CURRENT-STATE.md#gap-63). The installed
`installed-game/AzerothSurvivors.exe` is 0.141.0, 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [initial fallback](relay-policy-0.121.0.md) and
[replay policy](relay-load-0.127.0.md) retain their historical targets.

Service wire tag 30 selects the structured relay endpoint and authentication
reader at `0x14620526b`. The outer event pump at `0x145e83b10` decodes it
through `0x146204fa0`. The selected-secondary event branch begins at
`0x145e84594`. It takes the old secondary, serializes the Leave record at
`0x147ae2998`, submits it through slot +0x18 and calls close through +0x30.
If the old secondary is absent, the branch still continues to the reset.

The branch clears the map at service +0x1f8 and zeros its live count at
+0x210. Wire 25 looks up a departing peer in that same map at
`0x145e84a38..0x145e84a59` after marking its separate outer endpoint dead.
The branch truncates the guest payload deque at +0x40 through
`0x146051ac0`, zeros the deque length at +0x50, and clears the two guest
flags at +0x229 and +0x22a. The Hosted and Joined arms perform the same
reset at `0x145e8524f` and `0x145e851c0`. Joined alone sets the active
guest byte at +0x228. The secondary selection retains that byte and the
outer peer endpoints. It calls the transport factory at `0x145e85583`
after the reset.

The rebuilt [service pump](../../crates/azeroth-survivors-re/src/coop_directory.rs)
now calls the existing
[`service_party_reset`](../../crates/azeroth-survivors-re/src/coop/session.rs)
after retiring the old worker and before opening the selected relay. This
clears prior sequence and replay state, staged output, unread guest input,
and guest failure and reconnect flags. The Joined argument remains false,
so the active guest flag is retained. The existing worker still sends
Authenticate and Heartbeat in order. The admitted retry path continues to
preserve pending traffic under its separate control exchange.

| Selected PE range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Outer wire table `0x147b6d3bc..0x147b6d3f4` | `0x7b6b9bc` | 56 | `e7fbfc78593137fa78f40e58d9da923a46f47109b322f364ae4e611ad61a0701` |
| Typed event table `0x147aea194..0x147aea1c8` | `0x7ae8794` | 52 | `22e7a138e5143087d43d33ebd93d59d361a69ca173034552a68f1723b2bbcd38` |
| Old secondary retirement and map clear `0x145e84594..0x145e846e0` | `0x5e83994` | 332 | `9f9549d96180800d8143e148703d7275865bf8684bfe8b37931e48bd40edcc21` |
| Guest reset and factory call `0x145e8552d..0x145e85588` | `0x5e8492d` | 91 | `fbb7cd0fa9b70e2ea389d307a0e74870c2e131525200e918809caa857859f700` |
| Guest deque truncate `0x146051ac0..0x146051bb3` | `0x6050ec0` | 243 | `e6628f23da663ebf11f638293b2bcc38142db0bf19a34804e301a9e3a16aeca9` |

The Ghidra result
`ev_d3fe9997fd2b9937348afed77bcb1394b93d9edf48cd0ad0e3347967d590b23e`
uses the exact 14,669-byte event pump slice at file offset `0x5e82f10`,
SHA-256 `677969556c84644f08689ffccb9fbd38bba415de2a1a7f6cf58001877dadf5df`.
The direct response exceeded the response budget. The exported result
matched the journal's slice digest and yielded pseudocode SHA-256
`3aeee1df02a975dedd09e4e4eafea0cddea4b86ea9ffafee446bacb2508ba045`.
The exact PE table cells, Leave variant, instruction operands and live
source order were checked. Both changed Rust paths syntax-parsed with the
pinned formatter. The existing reset regression remains uncompiled and
unrun. Actual worker, socket and original/rebuilt comparison remain open.

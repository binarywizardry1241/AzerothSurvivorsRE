# Co-op connection lifetime and packet trust — 0.119.1

Installed read-only target: **0.119.1**, 145,374,208 bytes, SHA-256
`b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c`.
The [curated proof](evidence/0.119.1/coop-disconnect/manifest.json) binds eleven
original-byte ranges, the complete nine-cell chat-kind table, nine completed
durable full-PE REA/Ghidra queries and actual source slices. No target or server
was run. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent findings.

## Separate lobby and party connections — #183/#184

Source-first review resolves the existing interfaces to `coop_directory.rs`
(primary lobby worker and selected secondary relay), `coop/session.rs` (relay
endpoints and party connection ownership), `coop_runtime.rs` and
`gameplay/coop.rs` (run continuation/teardown). The retained
[0.115.0 service recovery](coop-forms-0.115.0.md) explains these boundaries;
its addresses and layouts were not promoted to the current target.

Current pump `145aad8b0..145aae881` retains primary at `+90/+98` and optional
selected secondary at `+70/+78`, with the secondary discriminant at `+88`.
Its shared mutex wrapper adds `0x18` to those offsets. The secondary factory,
received service events and distinct transport calls establish these roles;
nearby fields and names alone do not.

Helpers `145ab5130..145ab520a` and `145ab5240..145ab531a` read only that optional
selected secondary and its transport-state callback: respectively **state == 2**
and **state != 2**, returning false when it is absent. The main frame owner
`145affa60..145b06321`, specifically `145b01174..145b012dd`, uses these gates:
a host still tears down on an actual closed selected relay, while a primary
lobby failure does not tear down an admitted party with a live selected relay.
A missing relay and actual relay failure retain their failure paths. This is
bounded static proof of the new connection ownership, not observed connectivity
or an assertion that external directory services reconnect.

The live reconstructed `transport_closed(false)` still drops **both** workers
and invokes `Session::service_lost`. That clears relay endpoint liveness;
`Session::connected` also requires `service_alive` on the service-backed paths.
This is the concrete missing 0.119.1 connection in **#184**, referenced by the
independent summary entry **#183**. The next source repair must preserve actual
party transport/run ownership on a primary-only loss and retain native relay,
explicit Leave and menu/service presentation boundaries. It must use the existing
owners above; a new network engine is unnecessary.

The [repeatable bounded fixture](evidence/0.119.1/coop-disconnect/check-liveness.py)
passes **36 original-instruction cases / 1,458 instructions**, varying secondary
presence/state and unrelated primary states. It uses synthetic ordinary mutex
state and a transport-state callback seam; lock contention/poisoning, socket
threads and reconstructed Rust are outside the fixture. Reproduce with the
existing dependency installation:

```sh
PYTHONPATH=runtime/armory-recovery/python-libs python3 -B docs/analysis/evidence/0.119.1/coop-disconnect/check-liveness.py
```

## Real departures still remove the guest — #185

The current frame has distinct dead-transport and explicit close calls at
`145b01db8` and `145b0277e` to `145b1e7d0..145b1e91c`. The former follows empty
receive/connection liveness and the retained closing grace; the latter closes
the selected connection before invoking the same removal owner. That owner
requires host mode 3, removes exactly the selected `0x480` connection row,
decrements the connection count and, for an admitted hero, calls shared party
abandonment `145b8cb40`, then roster publication `145b1b030`. Thus lobby liveness
and actual guest departure remain separate contracts in this target.

Existing `Session::tick`/`PartyServer::disconnect` and the membership consumer
retain transport removal, hero abandonment and party projection. Their original
[server-party](coop-server-party-0.115.0.md) and
[game-party](coop-game-party-0.115.0.md) recovery is reused as source knowledge.
Current proof rebinds the removal interface and its caller gates; the deeper
hero/health-adjustment dependencies, actual delivery/timing and full behavior
correspondence remain separately pending. No new concrete source defect was
established for this preserved departure item.

## Engine packet trust transform — #186

The whole-image discovery exposed `crates/wenilla-rogue/src/coop/trust.rs`,
Location **226:28**, with owner `145ae46c0..145ae4f23`. The current guest Engine
receiver `145b1e960..145b1fd2d` reaches it at `145b1fc20`, **after** mode,
synchronization, opcode/length and first active receiving-port admission and
**before** delivery through `145aff7d0`. This is an AS-specific packet consumer,
not an inference from its diagnostic filename.

Within this bounded owner:

- Opcode **0x51** (`SMSG_NAME_QUERY_RESPONSE`) with a terminating name after the
  first eight GUID bytes removes every `|` byte from the name and preserves the
  GUID and all bytes starting at its terminating NUL. Too-short or unterminated
  input passes through.
- Opcode **0x96** (`SMSG_MESSAGECHAT`) has a guarded nine-cell type table at
  `1472dda84..1472ddaa8`. Types 0/1/5 use text length at offset 21 and text at 25;
  type 6 uses that form unless language is `0xffffffff`; type 8 uses offsets
  13/17. Other types pass through. Length/bounds and UTF-8 conversion gates
  precede the rewrite. The selected text normalizes lone `|` to `||` while
  preserving an already paired `||`, then writes its new NUL-inclusive length,
  NUL and retained suffix. Malformed bounds/conversion input passes through.

The available benilla protocol parser already owns these wire formats:
`messages/parse.rs` and `messages/chat.rs`; no engine parser reconstruction is
needed. The actual source counterpart is `CoopGame::guest_engine_packet` and
its existing admission/observe/`LocalWireEvents` chain. It preserves the admitted
payload unchanged, so the transform is absent. The existing
`client_state::sanitize_text` operates on tag11 resource descriptions, escapes
only four introducers and does not run for these Engine messages. It is useful
prior recovery, not an implementation of this packet contract.

**#186** owns this distinct source/recovery task. Recover any remaining helper
edge semantics and implement the bounded transform at the actual guest Engine
boundary, preserving each malformed-input fallback, dispatch case and suffix.
The diagnostic module has partial source correspondence through that consumer;
an absent `trust.rs` file alone would not prove absent source. The bounded
recovery above does not certify the whole trust module or rendering safety.

## Exact version admission — #163

Current admission owner `145b1d730..145b1e31d`, branch
`145b1d9de..145b1da18`, still requires protocol **5**, length **7** and now exact
bytes **`0.119.1`**. All mismatches branch to `145b1dc76`. The current full-PE
Ghidra result corroborates the original-byte comparison. The shared source
`coop/server_party.rs::GAME_VERSION` remains **0.119.0**, so existing finding
**#163** reopens for that precise native/source difference. Package metadata
alone would not have proved this handshake requirement.

Compilation, compiling regressions, application/client/network/server execution,
actual disconnect/rejoin timing, UI/file effects and controlled original/rebuilt
parity are **unverified**. Static source correspondence and bounded recovery
remain distinct from implementation and those execution/comparison requirements.

# Release review — 0.119.1

Selected installed EXE: 145,374,208 bytes, SHA-256
`b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c`.
Each of the three supplied nonempty entries in the
[canonical changelog](../CHANGELOG.md#01191) has its own permanent finding.
The [native/source review](release-contracts-0.119.1.md) and
[curated proof](evidence/0.119.1/coop-disconnect/manifest.json) own exact evidence.

This report preserves the 0.119.1 audit and its source observations. The later
[0.120.0 source repair](coop-lobby-loss-0.120.0.md) implements the #183/#184
lobby/party separation and independent relay heartbeats. Current implementation
and deferred validation status belong to [verification-needed](../verification-needed.md).

| Finding / item | Investigation result | Next static step |
| --- | --- | --- |
| #183 Fewer co-op disconnects summary | The current frame uses independent selected party-relay liveness. The actual source still destroys relay ownership on primary lobby loss; #184 owns that concrete defect. | Repair #184 through the existing service/session/run owners; retain this distinct summary claim and independent runtime/parity limits. |
| #184 Run survives lobby loss while its party server holds | Current helpers `145ab5130`/`145ab5240` select only the optional secondary transport; frame `145b01174..145b012dd` preserves the session on primary failure with a live secondary. Reconstructed `transport_closed(false)` and `Session::service_lost/connected` retain the older coupling. | Implement the recovered separation without changing actual relay loss, explicit Leave or presentation lifetimes. Thirty-six bounded original-instruction liveness cases pass; rebuilt source execution and parity remain unverified. |
| #185 A guest who really leaves/loses the game still departs | Dead-transport `145b01db8` and explicit close `145b0277e` call the same current connection-removal owner `145b1e7d0`, which removes that peer, invokes hero abandonment and republishes roster. Existing source already has these owners; no new concrete defect found within the rebound interface. | Rebind deeper party/health projection dependencies and then validate actual disconnect delivery and original/rebuilt behavior within separate authorization. Prior implementation is retained; no full current equivalence claimed. |

The independent discovered packet-trust transform omission is **#186**; it is
not silently added as another supplied release claim. Exact current admission
also renews **#163**, because native protocol5/exact0.119.1 differs from source
0.119.0. Nine durable full-PE Ghidra results, eleven original-byte ranges and the
complete nine-cell trust table support these bounded conclusions. No gameplay
repair, compilation, game/client/network/server operation or controlled parity
comparison was performed for this audit.

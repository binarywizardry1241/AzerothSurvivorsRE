# Pact of the Nathrezim

[Finding #24](../verification-needed.md#gap-24) and the [evidence manifest](evidence/0.139.2/nathrezim-summon.json) bind this repair to the installed EXE, SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`. The two 0.129.0 claims retain their individual IDs in the [release review](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.0.md#r01290-05).

## Talent and summon identity

The talent row at `0x14736f250` pairs the existing serialized key `pact_of_the_annihilan` with the name **Pact of the Nathrezim**. The source applies this label to the talent tree and runtime effect metadata, including the addon timer. The row points to effect `0x14736e740`, with duration 20 seconds, base cooldown 30 seconds, minimum cooldown 13 seconds, and descriptor `0x147374370`. The descriptor retains entry 9523, special 8, spell 5676, damage coefficient 1.6, and attack period 2.2. The bounded attack dispatch compares 5676 and selects this descriptor at `0x145f469fc`. Existing summon and Felseeker consumers continue to use entry 9523 and special 8.

The descriptor's name is **Dread Lord**. The CreatureQuery branch selects the same record at `0x145e4ebad`, localizes its name and Companion subtitle, and reads its display ID from `+0x24`. The reconstructed local and recipient-specific co-op replies use the shared pet descriptor. The summon feed projects the English key `dread_lord` and localized name, retaining the native special-8 kind `pitlord` corroborated by the [supplied API contract](../addon-api.md#azs_getsummonswhich--list). Four exact strings per locale cover the pact title, summon name, pact description and Butcher's exclusivity text.

## Display and resources

The constructor at `0x145f4c2d0` reads the descriptor scale (0.30) and special byte, then indexes the multiplier table at `0x147a45400`. Specials 1–4 use 1.2, 5–7 use 1.5, and 8 uses 3.6. The special-8 object display field 4 receives bits `0x3f8a3d71` (approximately 1.08). Fields 129 and 130 independently multiply the descriptor scale by 0.5 and 1.5 for radius and reach. The constructor writes display ID 11658 into fields 131 and 132. The existing summon event carries these fields into the engine's unit creation and replication.

The installed `patch.MPQ` links display IDs 11658 and 130 (the latter used by Varimathras) to CreatureModelData row 130, `Creature\Dreadlord\DreadLord.mdx`. The existing model loader normalizes that path to the verified `Creature\Dreadlord\DreadLord.m2` member. The display record and model geometry both affect apparent size, so the release's one-fifth screen-size comparison remains a visual check.

Three journaled Ghidra queries bind the query reply, combat descriptor selection and unit constructor to their original PE slices. Nine isolated instruction cases check selectors 0–8. The installed MPQ lookup verified both DBC members and the model, and all 56 changed locale entries match the EXE. Compilation, save and co-op execution, rendered size, and full original/rebuilt combat parity remain unverified. Earlier combat evidence keeps its own target.

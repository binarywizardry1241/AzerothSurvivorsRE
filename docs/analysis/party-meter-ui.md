# Party DPS meter view

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns **#251**, discovered by following #41's literal-only
`0x1401c98a4` selector into its actual settings producer and HUD consumers.
The retained [three-mode screen](run-meters.md) remains historical
evidence. Current code adds a fourth native view, **Party DPS**, that the source
previously omitted despite already publishing/receiving its party meter data.

## Native contract and connected source

| Boundary | Current native proof | Source behavior |
| --- | --- | --- |
| Admitted mode | Settings loader `0x1401bf28c..0x1401bf2ef` converts the optional sixth f32 and bounds the integer to indices0–3 into exact bytes `[0,1,2,3]` at `0x1461d8208`. Its join writes mode into settings `+0x32`. | `run_meter::MeterMode::Party`; settings parse/save use mode3. Legacy five-field records still default to Damage. |
| Mode menu/action | `0x1401013c9` constructs `[0,1,2,3]`; the indexed loop ends at four entries (`0x1401017e9..0x14010184a`). `0x1401015fb..0x140101616` creates Action tag2 plus its mode byte. `0x1401baf20` selects the four exact translated titles. | Existing custom overlay adds the Party DPS choice after Boss Damage and retains the same Mode action path. |
| State and persistence | `0x1401c8904..0x1401c893e` closes the menu, compares the previous mode, writes settings `+0x32` and calls the existing saver only when the mode changed. | Selecting an unchanged mode closes the menu without another save. The existing auxiliary settings writer persists a changed mode. |
| Reset admission | `0x1401c8a2b..0x1401c8a40` uses unsigned mode>=2 to hide Reset. | Damage/Healing expose and handle Reset; Boss/Party hide it. Switching modes preserves existing baselines/history. |
| Selected rows | `0x1401c9878..0x1401c9914`, table `0x1461daa54`: mode0 root `meter`, mode1 root `healing`, mode2 `bossMeter.lines`, mode3 the locally adapted `partyMeter` array. | The meter view uses the existing host party projection or the guest's received HUD array. It does not reconstruct rows from the lossy addon text stream. |
| Hero adapter | `0x1401a5180..0x1401a5f4b` retains each hero separately, uses `hero · first top-spell name` when present, the first top icon, hero `dmg`, false `proc`, copied `color` and ordered top breakdown. If hero damage−sum(top damage)>=1, it appends translated `Other spells`. | `party_rows` owns received labels/icons and keeps equal-name heroes separate. Top labels remain those already localized by the existing producer. Canonical class `#RRGGBB` colors drive the existing bar gradient. Missing/nonstring overrides use palette0; malformed strings use the native GOLD parse fallback, retaining their exact f32 RGB values. |
| Admission/baselines | `0x1401a1ed0..0x1401a2241` skips baseline lookup for modes2/3; only values>=1 pass its ordered comparison. | Party rows use raw totals, retain positive integer damage and omit zero rows. Damage/Healing retain their previous reset baselines. |
| Time/history | Mode3 at `0x1401c9982` uses the full snapshot time; `0x1401c9c55` clamps elapsed to at least1. Four totals occupy each 40-byte history record. `0x1401c9c6c..0x1401c9cd0` selects lane3 and applies the existing eligible sample/one-second rate gate. | Party total is the sum of received hero totals, with full-run elapsed and a fourth lane in the existing eleven-second history. The independent [#252 clock correction](meter-clock.md) supplies actual HUD time to guests. |
| Empty state | `0x1400fd691..0x1400fd745`, table `0x1461b2020`: Party with null/missing `partyMeter` translates `Only in a party.`; a present array with no admitted rows translates `No damage yet.`. | Availability is independent of row count, and the UI rebuild key includes this distinction, preventing stale solo/party empty text. |

The existing host block is extracted into `Mechanics::party_meter_hud` and reused
by `coop_hud` and the custom meter. It preserves its GUID/capture gate, per-hero
ordering, rounded damage and `{name,class,color,dmg,top:[{name,icon,dmg}]}` shape.
It does not fabricate uncaptured rows. Guests borrow `replica_hud()["partyMeter"]`;
they do not read host-only cache state. Existing capture/disconnect/rollback and
new-run/zone/end/loss ownership remains with the co-op implementation. The view
still resets on a new session identity or backward snapshot clock; closing the
meter does not clear accounting. All fourteen locale catalogs already contain
the three Party/empty/Other-spells labels.

Presentation reuses the existing row ordering, rank, total/rate/share text,
top-normalized fill, tooltip, window, minimap and placement consumers. Ordinary
rows retain their palette; party rows supply class color and top spell icons.
This connects the new mode to the recovered screen rather than replacing the
screen with another meter or another party-data producer.

Color correspondence covers the existing producer's canonical `#RRGGBB` values
and the named missing/nonstring/malformed-string defaults. Arbitrary shared
engine color syntax remains outside this bounded AS interface contract.

## Checks and limits

The [native fixture](evidence/0.121.0/party-meter-ui.json) records **76 passing
cases** and **6,905 original instruction steps**: current mode conversion,
four menu Action payloads/titles, changed/unchanged saves, Reset visibility,
missing/present-empty text, all four row selectors, elapsed time, current-rate
lane selection, baseline/zero/NaN admission, equal-name rows, localized ordered
top contributions, an empty first top-name, the exact Other-spells threshold,
nonnull wrong-type party presence and all nine class colors plus missing/null/
wrong-type/malformed color defaults. The original renderer, hex parser and
RGB-byte constructors execute for color cases. Generic JSON operations,
allocation/copy/comparison, the two-string format, localization and persistence
are explicit seams. The fixture does not execute the surrounding engine.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs \
  python3 -B scripts/check-party-meter-ui.py
```

The checker binds original bytes, conditional table cells, both completed
journaled Ghidra operations, connected source and its generator/dependencies.
It syntax-parses the five changed Rust files with the existing formatter,
without module traversal or compilation. Authored Rust regressions consume
the new native settings/hero/color vectors; **they were not run**. The archived
0.105.0 mode3-invalid result is retained unchanged. Its open/position/size checks
remain asserted; only mode3's expected result changes to Party in the current
settings assertion. The new target's bounded vectors cover that admission.

The raw query input and two canonical results are retained once. The snapshot
pseudocode uses a generic ABI and ends at unmodeled external table branches;
original instructions and admitted table cells govern the continued trace.
This is static source recovery. Compilation, reconstructed client/server/game
execution, rendered interaction and original/rebuilt parity remain unverified.

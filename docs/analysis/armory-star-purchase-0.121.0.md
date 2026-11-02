# Armory star purchase controls — 0.121.0

Target: installed Windows0.121.0 EXE, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`,
146,088,960 bytes. This report owns the selected-item purchase consumer shared
by findings **#229** and **#236**. The Save admission, price and atomic debit
contract remains in [gear progression](gear-progression-0.121.0.md); star
projection and compact text retain their separate owning reports. Current
overall implementation status belongs to [verification-needed](../verification-needed.md).

## Offer and presentation

Current constructor `1400c4790..1400c6576` appends selected-item star controls
before class-wide weapon glow controls. The live Armory source now calls
`Save::star_offer` for that item and renders its result:

| Native branch | Consumer |
| --- | --- |
| Current stars | `armory.stars`, `n=min(current,5)`, `of=5`;13px, color `(1,.914,.659)`. |
| Maximum | `armory.star_max`;12px gold. |
| Heroic locked | `armory.star_locked`, with `stars=current+1`, current localized class, normalized Heroic rank label and the tier's localized zone names joined with ` · `;11px muted. |
| Offer available | `armory.next_star`;11px muted, followed by actual next-star effect increments. |
| Affordable | `armory.upgrade`, with next `stars` and formatted full `n` cost;14px button carrying action14 and selected item ID. |
| Insufficient displayed marks | The upgrade/cost label remains as13px muted text; `armory.marks_short` receives the current `n` marks balance as11px color `(1,.353,.235)`. |
| Unavailable/other error | No offer/error control after the current-star line. |

The affordability predicate at `1400c55e7..1400c5613` adds the exact native
`0.0001f32` constant before comparing marks with cost. This presentation
tolerance does not replace the transaction's integer-tenths debit guard.

The purchase preview calls `145b007c0`, then maps the recovered compact
formatter `145af3ef0` over the resulting bonuses through `1401a86e0`. Source
uses `gear_stars::extra_effects(..., next_rank, true)`: it subtracts the two
native f32 star multipliers before projecting each original effect, including
health rounding and the excluded integer-target variant. It does not subtract
already rounded current/new totals.

Current bonus-chip renderer `1401112b0..1401117a2` submits12px text,7×3px
padding,1px border and10px radius. Its purchase caller supplies green
`(.302,1,.416)` with text alpha.85; border alpha.35 and background alpha.08.
The caller's wrapping row has5px horizontal/vertical gaps. These recovered
fields now drive the source's purchase increment chips.

## Independent account transactions

The current frontend dispatcher `1402c0f30..1402c1b94` invokes
`Save::upgrade_star` at `1402c169d`. Rejection queues nothing. Success mutates
the frontend's independent Save, queues command14 with the selected ID at
`1402c16e5`, and appends callback `140169f90` for existing content/cache work.
That callback calls `14078ae00`, `14504b400` and `14504b3b0`; it does not call
the Save loader or publish a backend Save replacement. Source queueing updates
the existing save revision and dirty state, refreshing Armory content and its
star-aware preview while retaining the independent optimistic frontend Save.

Backend dispatcher `145b2a420..145b2bbf1` revalidates against its own Save at
`145b2a8dc`. A successful transaction calls account grants `145ba7310` with
an absent date argument, drops the returned grants vector and submits the
backend Save through `145aae770`. Failure skips both grants and file write.
`menu_state::backend::Command::StarUpgrade` now follows these branches; it
does not copy the frontend account over backend ownership, or replace the
frontend account after backend admission/rejection.

The first refresh helper searches exact resource TypeID
`49c8de2b28eb59960d5de8097c00b6df` and clears its collection at `resource+48`.
The same TypeID/hash occurs only in helper `14078a8e0`, which performs the same
clear before generic batch operations, and the generic TypeID table at
`146294480`. Bounded recovery establishes this resource identity and collection
operation, but does not name its generic engine type or prove whether its
transitive effects remove the custom-menu root. No direct AS Save loader or
grant call occurs in either bounded helper. Consequently a newly backend-earned
glow achievement can remain absent from the independent frontend cache until
its actual root refresh in the current source. Whether the native callback
forces that root refresh remains unresolved at the generic cache/engine
boundary. The bounded AS purchase controls and two account transaction routes
are connected; no additional AS operation is inferred from that generic
boundary. This work adds neither a frontend achievement grant nor a forced
Save reload. Native ECS scheduling/cache internals and that transitive lifetime
effect remain unverified.

## Verification and limits

The [manifest](evidence/0.121.0/armory-star-purchase/manifest.json) binds seven
journaled Ghidra operations, their immutable raw subjects and original ranges
to this target. The two dispatcher decompilations stop at indirect jump tables;
the aligned original instruction blocks, rather than those incomplete
decompilations, govern the purchase action replay.

`scripts/check-armory-star-purchase.py` checks6 offer outcomes,42
f32 affordability boundaries,21 localization argument vectors,12 selected-ID
action/frontend/backend cases,2 refresh callback cases and2 resource-clear
cases. It also captures
the actual delta-chip Node/text submission and wrapping row. The replay
decodes1,364 instructions and executes1,486 original instruction steps across
501 distinct instructions. Synthetic RET carriers and stop destinations do
not contribute to those execution counts. The
[compact result](evidence/0.121.0/armory-star-purchase/static-check.json)
records the exact arguments, typed submissions and declared seams. In the
insufficient-funds branch the replay crosses the original scalar-format call
with a balance distinct from cost, establishing that its `n` argument is the
current balance. All six consumed localization keys exist in all14 catalogs.

The transaction helper's result is supplied by the separate current #229
contract; allocation/copying, localization, ECS parent/text submission,
command queue, grants, writes and refresh internals are explicit typed seams.
The source connection inventory and Rustfmt parsing do not compile or execute
the Rust application. No installed save/configuration, client, game, server,
network, computed layout or rendered comparison ran. Compilation, live
persistence/input, font/GPU output and original/rebuilt parity remain
unverified.

The source depends on the #234 `Save::star_zone_indices` accessor for the
shared native tier-to-zone map, in addition to #229 transaction methods and
the #236 compact-stat formatter. These source groups precede the purchase
consumer in the delivery order.

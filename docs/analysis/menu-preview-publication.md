# Menu preview publication

Installed target SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
Current producer `1400fc450..1400fd95d` is the direct caller of the hero request
setter `1408691d0`. [Ghidra identity](evidence/menu-preview-publication/analysis.json)
and [bounded results](evidence/menu-preview-publication/cases.json) retain
the current body/range hashes.

Both Character (`1400fd6dd`) and Picker (`1400fd801`) geometry branches use signed
affine X scale, positive Y scale, ties-away rounding and saturating f32-to-u32
conversion. Either zero physical axis, or an absent computed node, reaches
`1400fd927` without publishing. Character preserves its selected yaw and fixed
100/122 aspect; Picker publishes0.35 yaw and logical width/max(height,1) aspect.
The source continues to use benilla's existing hero-preview API and renderer.
This repair changes only the Azeroth Survivors producer's geometry and admission.

`menu.rs::sync_preview` now uses the determinant sign in its X scale and marks an
absent visible pane with a zero pending size. `preview.rs::feed_engine_preview`
retains the previous engine request while the visible custom pane has a zero
axis. Leaving the menu or transferring ownership to the world still withdraws
the request. Previously the source used unsigned column lengths and published
zero-size requests, which could resize or replace a request the native producer
retains.

`python3 -B scripts/check-menu-preview-publication.py` passes222 native
cases: ten transforms × eleven dimensions × two views, plus two absent-node
branches. They include mirrors, rotation, shear, zero scale, half-pixel rounding,
negative dimensions, NaN and overflow. Admitted calls also check actual yaw and
aspect registers; a request canary remains unchanged before the setter or on
the skipped-publication path. Source consumer assertions check the connected
gate and signed-scale expressions.

Only those bounded installed instructions execute. Typed node/transform inputs,
CRT roundf and the unused atan2f result are explicit seams; execution stops before
publication. No compiler, reconstructed Rust, ECS scheduler, renderer, application
or original/rebuilt comparison ran. Interactive/rendered parity remains unverified.

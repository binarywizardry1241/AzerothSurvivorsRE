# Five guides for source and static-recovery work

Apply only the guidance needed for the user's selected issue. Read current
`docs/CURRENT-STATE.md` for the actual backlog; the examples here are routing
examples, not a maintained list of open gaps. Every guide follows `SKILL.md`'s
source/static-only boundary: no builds, compiling tests, game launches or user
gameplay checks. Finish the selected source task and move its remaining runtime
or presentation-comparison requirements to `docs/verification-needed.md`, keeping
only source/recovery issues in CURRENT-STATE. Paths below are relative to the
repository root. Resolve the newest supplied target through the
[coverage workflow](coverage.md) and use its identity manifest and current owners from
`docs/analysis/README.md`; the 0.100.1 reports below are historical routing leads,
not proof of current-target behavior.

Apply `SKILL.md`'s source-only/REA/mixed routing before these guides. Their trace
and recovery steps identify the relevant contract; they do not require fresh
native analysis when retained applicable evidence already establishes it. For
an established source defect, inspect and repair its live path directly, using
only the domain guidance needed. Recover only necessary missing facts.

## 1. Target coverage

Use this guide when the selected gap concerns target-version coverage, world
behavior, data/defaults, persistence or a missing native-to-source connection.

Use the selected EXE as the specification. Start with its current identity record
and system record in `docs/analysis/coverage/systems.json`, following the relevant
owner in `docs/analysis/README.md`. Check whether the source still
depends on older recovered data or provisional behavior for this exact issue.
Reuse the established producer/contract/consumer evidence or recover what is
missing, then connect the recovered behavior to the running reconstruction.
Preserve older evidence's
provenance rather than relabeling it as current proof.

For animation, terrain, collision or airborne-mob defects, trace the actual
spawn/movement/height path and actor movement/animation publication. Consult
`docs/analysis/floor-recovery-0.100.1.md` and
`docs/analysis/run-presentation-0.100.1.md` as relevant. Reuse the existing engine
where it matches the target. Avoid cosmetic height clamps, forced animation or
other substitutes unsupported by the native path. Check the connected terrain
and actor paths statically. Real-MPQ movement/collision comparisons remain open;
do not offer this gap when only those comparisons remain.

## 2. Treasure

Use this guide for a selected chest, treasure, reward-generation, purchase,
replacement or empowerment gap. Start with
`docs/analysis/treasure-pipeline-0.100.1.md` and its linked owners.

Trace the relevant offer from world interaction through eligibility, generation,
currency, presentation, acceptance and resulting equipment/effect state. Recover
the target's restrictions, random selection/rounding, scaling, item ownership,
replacement/reset rules, feedback and persistence wherever the selected defect
depends on them. Fix the live transaction, including its actual GameObject or UI
request delivery. Use recovered native vectors for choice/math contracts and
trace purchase/acceptance state transitions without launching the game. UI source
work also uses the upgrade guide below; interaction and screen fidelity remain
unverified.

## 3. Run effects and progression

Use this guide for an equipped effect, callback, combat/progression event,
companion/form, account result or persistence gap. Start with
`docs/analysis/run-effects-progression-0.100.1.md`, following its milestone,
healing, account and presentation owners as needed.

Trace the selected effect from its definition and equipped/talent state through
composition, trigger, runtime state and consumer. Recover ordering, attribution,
deadlines, reset conditions, math and publication from the current EXE where
needed. Replace disconnected or neutral placeholder inputs and connect actual
combat, actor/aura, UI or save outputs. Follow a companion/form through its real
lifecycle if that is the selected gap; a request producer alone is insufficient.
Trace meaningful trigger and boundary cases through the actual live adapter.
For XP or completion work, verify the shared level/reward lifecycle rather than
assuming a local formula change fixes its consumer.

## 4. Upgrades and reward presentation

Use this guide for a selected level-up/choice-flow or upgrade/reward-screen gap.
Start with `docs/analysis/upgrade-flow-0.100.1.md` and
`docs/analysis/upgrade-prose-0.100.1.md`, then the treasure owner if rewards share
the same overlay path.

For flow, trace earned and stored levels, spending gates, offer priority,
acceptance/replacement, XP sweep and pause/resume in the selected EXE. For
presentation, recover and apply the actual custom overlay's dimensions,
fixed-height rules, anchors, spacing, typography/font supply, text wrapping,
focus, tooltip, transitions and input as relevant to the chosen defect. Inspect
the live layout and font consumer, not just recovered geometry or labels.
Check source dimensions, font references and layout/input consumers against
current native evidence. Offer this work only if a concrete source correction or
static recovery remains. Displayed height/font, wrapping, interaction and
platform parity require later comparison and remain open; choice rules or source
geometry alone cannot establish them.

## 5. Menu fidelity

Use this guide for a selected picker, secondary page, control, save operation,
locale, font, preview, audio or updater gap. Start with
`docs/analysis/target-menu-0.100.1.md` and the specific owner linked from it or
`docs/analysis/README.md`.

Recover the selected page/control's layout, appearance, defaults, restrictions,
focus, input transitions and side effects from the current EXE. Trace and fix
the real application path, including save migration/backups or setting consumers
when the issue depends on them. Keep native FrameXML/Lua and the custom picker
or overlay at their actual ownership boundaries. Check save formats, defaults,
migrations and control/setting consumers through static tracing or suitable
existing non-compiling checks using project-local fixtures. Interaction,
presentation, audible playback and updater runtime behavior remain unverified;
exclude tasks whose only remaining work is those checks.

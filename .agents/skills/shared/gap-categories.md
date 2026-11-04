# Categories for release leads and source gaps

Choose one primary category for each release lead, numbered finding and connected
group. Use the subsystem that owns the outstanding action. For a group that
crosses categories, use the shared dependency or the main deliverable. Add tags
only when useful for finding related work, such as a class, spec or mechanic.
Keep eligibility, route and target provenance with the underlying evidence.

| Category | Scope |
| --- | --- |
| Classes & talents | Class spells, specs, talents, racials and combat pets or summons |
| Gameplay & combat | Shared targeting, damage, healing, shields, procs and crowd control |
| Runs & difficulty | Run lifecycle, pacing, Heroic, Endless, affixes and level-up timing |
| Loot, gear & upgrades | Caches, offers, rerolls, jewelry, drops, gear stars and set effects |
| Progression & saves | Unlocks, achievements, perks, collections, persistence and migration |
| World & navigation | Zones, spawns, arena bounds, pathing, collision and floor recovery |
| Bosses & guardians | Encounter schedules, phases, warnings, lairs and scripted attacks |
| UI, HUD & menus | Picker, armory, tooltips, nameplates, meters, overlays and death recap |
| Controls & camera | Keybindings, input focus, gamepad, movement input, camera and zoom |
| Addons & Lua | Addon loading, AZS APIs, HUD ownership, snapshots and world projection |
| Co-op & networking | Lobbies, party lifecycle, revives, replication, protocol and relay |
| Localization & fonts | Translations, font delivery, mixed scripts and input methods |
| Visuals & audio | Models, appearance, effects, music and voice |
| Engine, platforms & updates | Engine contracts, compatibility, performance and updating |

Use **Unclassified recovery** for cross-cutting census work or bounded leads
whose subsystem is still unknown. Keep their existing #41 or lead IDs and concrete
questions. Classify identified #41 leads by their subsystem when possible.
An existing row without category metadata can be classified from its remaining
work when displayed.

For a menu, show each choice under its primary category. Keep named group
membership intact and combine names for groups whose eligible member sets are
identical. Cross-reference any shared member in overlapping groups so the user
can see the overlap. A category or tag filters both groups and individual
members, so a World & navigation filter can still find #312 inside the
Scholomance encounter group. Exact IDs and explicitly selected named groups
define the scope.

Use **Good to pair** only when the owning evidence points to a reusable source
trace, native function or table query, or static check that answers part of both
eligible choices. Name the IDs and the concrete work they can share. Pairings
can cross categories. A shared class or Ghidra Program alone gives no specific
evidence of saved work. For a quick pass, surface bounded source-only choices
and evidence-backed pairings within the requested scope.

For example, #288 belongs under **Gameplay & combat** with tags such as
`Shields`, `Paladin` and `Warlock`. A single shield-update trace can inform
its absorb subcases while each spell's admission or timing still needs its own
proof. A class-specific summon timer belongs under **Classes & talents** and
would need a demonstrated shared dependency to be a pairing candidate.

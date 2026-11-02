# Live addon bridge — 0.105.0

This report retains its historical target. The [0.108.0 banner extension and
current VM bootstrap](addon-bridge-0.108.0.md) own the newer connected source;
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own remaining reconstruction limits.

The bridge now installs the complete selected-target Lua API and publishes live
run snapshots through the real client's inbound addon-chat path. Gap **#11**
remains partial pending runtime comparison: collected-magnet delivery and the
fractional Soul Fire producer/reader are connected. Changed source has not been compiled or
compared in a game session.

## Authority and evidence

The supplied target is `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
Its hash was verified before native recovery. The original EXE is optional
analysis input; source builds never read it.

The supplied [addon documentation](evidence/addon-api-owner.txt) explains field meanings, addon registration order and changed-message
semantics. It is undated and describes nine zones and seven HUD controls; it
does not describe all current fields. It is preserved unchanged and is not
labelled as a complete 0.105.0 specification. Current code/data evidence takes
precedence where the selected EXE adds or changes behavior.

Canonical current evidence:

- [Embedded Lua](evidence/0.105.0/game-mode-audit/addon-api.lua), the exact
  10,365-byte source at `0x146e75444`, SHA-256
  `b79b53002002820291022749e09cc34aa660ccf372fd4479dae4b424c160f212`.
- [Scalar/publication manifest](evidence/0.105.0/addon-bridge/native-manifest.json):
  sender `145896520`, scalar producers, native formats, class/race/zone data,
  resource state, flag selection and phase gates. The separate
  [numeric parser](evidence/0.105.0/addon-bridge/native-stats-parser.json)
  binds `AZS_Parse` to its current embedded character-pane source.
- [List manifest](evidence/0.105.0/addon-bridge/lists/manifest.json): live-unit
  admission/order/cap, debuffs, active buffs, schedule, map basis and field
  formatting. The lair serializer reuses the
  [existing current extract](evidence/0.105.0/game-mode-audit/lair-telemetry.c).
- [Meter manifest](evidence/0.105.0/addon-bridge/meters/manifest.json): native
  sorting, rounding, rates/shares, delimiter sanitization and damage-taken
  categories. Effective damage and boss-fight timing reuse the
  [canonical accounting owner](run-meters-0.105.0.md).

Ghidra used immutable raw slices/sparse carriers at the original addresses.
External data/callees, inferred Win64 signatures and incomplete discovery limit
pseudocode. Original PE instructions and pointer-bounded data determine fields
and formatting; pseudocode alone is not treated as original source.

## Connected implementation

`gameplay/client/addon_bootstrap.rs` installs the full canonical API and exact
`AZS_Parse` before FrameXML/addon loading. It reuses the shared nine-part HUD
CVar registry and its ordinary persisted defaults. The API frame is installed
once per VM. Run identity is a decimal string, preserving all u64 bits; an
identity transition clears the native tables/timestamps without making another
frame. An out-of-run reset clears the phase and old data.

`gameplay/client/addon_feed.rs`, `addon_scalars.rs` and `addon_lists.rs` now
publish these native streams, in order:

| Prefix | Live source |
| --- | --- |
| `AZS` | 42 numeric character-stat fields, including raw gear contributions |
| `AZSZONE` | 14 fixed run/hero/zone fields |
| `AZSRUN` | 44 clock, phase, counters, resources and world-position fields |
| `AZSBOSSES` | Current five-boss schedule and due/up/dead state |
| `AZSUNITS` | Living final/boss/guardian/elite rows, sorted by kind and spawn ID, capped at 40 |
| `AZSDEBUFFS` | Every living boss/guardian's actual aura slots, stacks and known timing |
| `AZSTGT` | The actual selected target, including none/player/other/dead branches |
| `AZSSPELLS` | Learned abilities and racial last, rank and current/full interval |
| `AZSBUFFS` | Actual active self-buffs and remaining run-clock time |
| `AZSMETER` / `AZSHEAL` / `AZSBOSSDMG` | Shared damage/healing/last-boss-fight accounting |
| `AZSCHESTS` | Actual waiting caches in creation order, world/map coordinates |
| `AZSLAIRS` | Actual lair holder/state/deadline/home/map/flag data |
| `AZSTAKEN` | Post-armor/post-absorb damage by native source category |
| `AZSEND` | Terminal result, counters, identity, totals and the actual collected-magnet count |

The publisher polls the real UI clock every 0.2 seconds and compares each
serialized string with its prior value. It sends changed streams, including an
empty payload when a previously nonempty list clears. A new VM identity forces
rehydration after ReloadUI even when the run itself is unchanged.

Native chat serializer `1458ab420` supplies chat type 6, language `0xffffffff`,
the player GUID, and `prefix + TAB + payload`. The bridge supplies that same
logical packet to `LocalPresentationEvents`. The existing chat handler resolves
the sender and emits ordinary `CHAT_MSG_ADDON`, reaching both the API frame and
user addons. The existing engine reports this wire lane's distribution as
`UNKNOWN`; the bridge does not invent another distribution token.

The normal chat feed explicitly follows `LocalClientSet::Feed`, so the reset
and player snapshot precede addon events. Logout/quit and terminal navigation
capture final `AZSRUN`/`AZSEND` packets before dropping mechanics, then flush
normal inbound/chat handling before ending the client. The former immediate
teardown could discard those packets. Continuing endless clears the terminal
table through the ordinary changed-empty stream.

Names retain the native delimiter replacement (TAB, comma, semicolon and equals
become spaces), current localization keys and original-name fallback. API-only
assets contain current metadata for twelve zones, sixty scheduled bosses and
113 spell records. This does not relabel or replace older gameplay/balance
catalogs. Map selection prefers exact map/area, otherwise the smallest
containing rectangle, preserving the first tie. Missing map data publishes -1.

Guardian flag selection prefers the nearest held lair's home; with none held it
selects the earliest refill deadline. Both comparisons use the native f32 total
order and first-tie behavior. The selected index is cached on admitted playing
ticks, retained through other phases, and independent of HUD visibility.

Debuffs read the same ordered aura slots as client publication. Periodic timing
uses the latest active end; other recovered control/reduction timing is retained
at its producer. Unknown timing remains -1. Permanent Hunter's Mark/Faerie Fire
rows retain their no-expiration contract. Meter publication localizes semantic
source identities and merges resulting name/proc collisions before native
sort/rate/share formatting. Incoming damage credits its applied value before
retaliation can change or remove the source; categories are `area`, `boss melee`,
`boss spell`, `elite`, `mob melee` and `mob spell`.

## Checks and remaining limits

The following checks passed without compilation or a game process:

```sh
python3 scripts/check-addon-native.py
python3 scripts/recover-addon-bridge.py --check
python3 scripts/extract-addon-meters.py --check
python3 scripts/check-addon-map.py
# Run the shared contract suite against the recorded API input.
lua scripts/check-addon-bootstrap.lua docs/analysis/evidence/0.105.0/game-mode-audit/addon-api.lua
```

These verify the full EXE hash, thirteen publication/scalar/flag native ranges,
twelve list ranges, seven meter ranges, exact current data/formats and the Lua
parser. Eight [unchanged native map-selector vectors](evidence/0.105.0/addon-bridge/lists/map-native.json)
passed with explicit zone/DBC lookup seams. The standalone Lua check executes
the exact embedded API/parser with stub host calls: sixteen branches, getters,
clock/pause behavior and nine HUD CVars. Its Lua 5.5 host is not the real client
VM. Changed Rust files were syntax-parsed with rustfmt; Python sources were
AST-parsed and the diff passed whitespace checks.

Authored Rust regressions cover hydration/clears, packet shape, current metadata,
native map vectors, resource/stat precision, actual VM resets, chat ordering and
final-message delivery. They were **not compiled or run**. No application build,
game launch, original/rebuilt addon interaction or visual/platform comparison
was performed. These checks establish bounded static contracts, not parity.

The selected inputs have separate gameplay owners:

- Soul Fire `pv` adds the integer points and the distinct `Game+8a8` fractional
  demon-credit bank. The producer and its reader are connected through
  [special-demon gameplay](demon-gameplay-0.105.0.md), owned by **#24**; its
  uncompiled/runtime coverage limits still apply. `Game+8a4` is the unrelated
  gain deadline and must never substitute for the bank.
- `AZSEND.magnets` now reads the actual wrapping `Game+724` collection owner
  connected by [#31](pickup-effects-0.105.0.md). A spawn does not increase it;
  successful collection increments once, and a repeated pickup cannot increment
  again. The field is also sent as zero before any magnet has been collected.
  Terminal delivery uses this live counter before teardown.

The exact embedded Lua/parser check now verifies both positive and zero magnet
counts through `AZS_GetRunSummary()`. The Rust scalar regression collects two
magnets, retries their removed IDs, and checks the final terminal payload; it was
**not compiled or run**. The native scalar/hash check still passes. These are
bounded source/parser checks, not a game/addon comparison.

Underlying special-demon/Soul Link, HUD widgets/settings, bindings and class-rule
gaps retain their own owners and limits. Installing the API and publishing its
available live state does not implement those missing gameplay/UI consumers.

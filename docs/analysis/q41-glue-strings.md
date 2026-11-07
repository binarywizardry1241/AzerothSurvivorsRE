# AS GlueStrings presentation

Permanent **#107**, discovered through **#41 / Q41-B02/I01** and
`Q41-I01:resource_path:208`. The selected installed target is
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
[verification-needed](../verification-needed.md) owns overall implementation status.

## Missing source and recovered contract

The current native `Interface\GlueXML\GlueStrings.lua` path at `0x14700d2b4`
has an actual AS consumer, `0x14585a400..0x14585a51b`: it reads that core file,
converts the read bytes into text, invokes `0x145859140..0x145859f25`, then
publishes the transformed content to the same 33-byte path. Source localization
already supplied custom menu text, but the real GlueXML provider had no
corresponding AS transformation. Its ordinary character-creation descriptions
and realm-selection labels therefore retained the stock definitions.

The [compact proof](evidence/0.115.0/q41-glue-strings.json) binds nine completed
journaled Ghidra queries, complete selected tables, source connections and the
[single canonical assembly](evidence/0.115.0/q41-glue-strings.asm). Raw-function
imports omit external data/callees; independently checked image bytes and data
tables govern their meaning. The escaping wrapper's raw-import warning at an
external free is retained; exact assembly and bounded instruction replay cover
the selected return paths.

The constructor first keeps each original line except those whose trimmed text
starts with `ABILITY_INFO_`. Retained line text is preserved with LF endings.
It adds the exact `\n-- Azeroth Survivors\n` header and these ordered families:

| Family | Current inputs and output |
| --- | --- |
| 22 racial rows | All eight 88-byte race records at `0x146cc1ec8`, original line lists, ASCII-lowercase locale keys `race.<key>.lineN`, and uppercase `ABILITY_INFO_<RACE>N` globals. Orc and Tauren each have two rows; the other races have three. Each value begins `- `. |
| Nine class rows | All nine 144-byte class records at `0x146cc3058`, the matching starting spell from all 113 descriptors at `0x146cc4580`, localized class blurb and spell name, and the record's base-health float. The localized native template is `{blurb} Starts with {spell}; every level offers three of its spells. {hp} health.`. `CLASS_<NAME>` values retain eight leading spaces. The native class-tag table and its Druid fallback are checked against every current class. |
| Five realm globals | `SERVER_SELECTION`, `REALM_NAME`, `CHANGE_REALM`, `REALM_LIST_IN_PROGRESS`, `REALM_LIST_SUCCESS` receive localized `Choose a Zone`, `Zone`, `Change Zone`, `Gathering the zones`, `Zones found`, respectively. |

Successful empty translations survive. Missing class/spell/racial keys preserve
the native descriptor fallback, with its original racial `- ` prefix removed
before the output adds one. The source catalog already stores that normalized
fallback; every selected current raw record is checked against the source fields
used here. This correspondence does not rebind unrelated historical catalog
fields or certify the entire catalog.

Quoted values undergo the native ordered replacements: backslash to two
backslashes, double quote to backslash/quote, then LF to backslash/n. Other bytes
are not replaced by JSON escaping. The existing named-token renderer is reused
for the class template's ordered `blurb`, `spell`, `hp` replacements.

## Connected source and lifetime

`gameplay/client/glue_strings.rs` owns the exact AS payload and line policy. A
small `LocalCoreScriptTransform` contains its core path, owned payload and
capture-free `fn(&[u8], &str) -> Vec<u8>` callback. `LocalClientExtension` remains
`Resource + Clone + Default`; its new vector contains only ordinary owned
strings and function pointers. It introduces no captured ECS state or callback
thread/lifetime dependency.

The existing named core-file provider performs the read before calling a matching
transform. Missing files still follow the ordinary load failure path and never
call the callback. Direct TOC and nested XML Script reads share that provider and
retain the original chunk path. The AS transformation changes the supplied bytes
inside the normal load; it writes no archive, installed file or loose interface.
The existing ordinary core appends continue through their existing wrapper.

`LocalizationPlugin` initializes the current locale before `GameplayPlugin`
builds the client bridge. The bridge also initializes that resource explicitly
for its own dependency, then registers the initial payload during plugin build,
before any Startup system can construct the first glue VM. Startup's
`setup_script` and every return-to-glue/replacement path reach
`install_glue_vm`, which clones the current transforms before loading GlueXML
and before `FRAMES_LOADED` or the screen's first `OnShow`.

Both host and guest locale-generation changes replace the existing path's payload
in `First`, without accumulating callbacks. Deferred glue rebuilds run later in
`PreUpdate`; return-to-glue state transitions also consume the already refreshed
resource. In-world ReloadUI retains its existing boot/in-game route and does not
load GlueXML. The transformation belongs to future ordinary core reads, rather
than overwriting Lua globals per frame or after addon hooks have installed.

## Checks and remaining limits

```sh
python3 -B scripts/check-q41-glue-strings.py
python3 -B scripts/check-q41-glue-strings.py --prepare-rea
```

The second command recreates or verifies the exact native input/seed/plan files
and prints their serial `./scripts/rea query` reproduction commands. Saved query
results and journals remain under ignored `runtime/analysis/history/findings/q41-data-contracts/27d2ef7f9d9d/`;
matching Programs may be reopened by those same plans.

The checker verifies all selected native/table bytes and source-field matches.
Twelve original-instruction escaping cases use explicit replacement, allocation
and free seams. Independent emitted-Lua fixtures cover all fourteen current
locale catalogs, exact output globals and removal of ten unused stock racial
rows. They use the actual supplied 33,563-byte UTF-8 GlueStrings member
(`31649e4bdc176607d18ebd8f82847a32f8385699511a125780e102ab5001e04c`)
from the hash-verified, uniquely containing `patch.MPQ`. No game asset is copied
into tracked evidence. The model and interpreted Lua do not execute Rust.
Malformed/non-UTF-8 replacement core inputs and the wider native conversion
policy remain outside this selected valid-UTF-8 input proof.

Two meaningful Rust regressions cover removal of unused stock rows and
replacement of the current locale payload without duplicate transforms. They
remain uncompiled/unrun. Compilation, actual ECS/VM/provider execution, real
locale switching, filesystem/cache behavior, stock creation/realm interactions,
rendering and original/rebuilt parity remain unverified. This selected AS source
repair does not close #41's wider mixed-schema, alias/type or semantic frontier.

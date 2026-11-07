# Desktop AddOns metadata/status surface

Target: supplied 0.105.0, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This selected-target recovery bounds the AddOns page portion of gap #17;
[Options](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/options-0.105.0.md) owns its account-enable persistence and live load
lifecycle. It does not certify the entire shared-engine metadata API/loader.

Current page `1400ee260..1400eedbf` traverses 104-byte desktop AddOn rows.
Its row constructor `140206330..140206abc` draws the enable checkbox, title and
status, and the page retains the optional Notes footer. The visible status law
is missing dependency names first, then outdated while version checking is on,
then load-on-demand, then empty. Disabled state affects title color; it does not
remove the row/status. The current page does not construct Author/Version
controls or a transitive loader-error display. Adding those would invent a
surface absent from this recovered page.

The existing `addons.rs` inventory already provides the Title/Notes strings,
hard dependencies, exact 11200 interface check, demand flag and account enable
state used by `options.rs`. Its missing-name list and status priority correspond
to this native page. No source value or visible AddOn control needed changing
for these bounded contracts. The real interface's existing TOC metadata map,
optional dependencies, LoadWith ordering and load gate remain the owning shared
engine; their complete selected-target revalidation remains separate work under
#41. Their existence is not claimed as current native parity here.

`scripts/recover-addons-page.py --check` verifies target/body hashes and
all **16** missing/outdated/demand/version-check combinations with the unchanged
native decision instructions. It stops before the first joining/translation/UI
callee, with explicit memory fixtures and no native external call. The
[retained record](evidence/options-comparison/addons-page.json) includes those cases
and both scoped Ghidra Evidence IDs. Existing account/character/TOC enable
precedence checks remain in the canonical lifecycle manifest.

No build, application, addon Lua, persistence/interaction comparison or rendered
UI check ran. Full native metadata/dependency-loader ownership and typography /
page / native-popup presentation requirements remain open; this recovery narrows
the earlier broad "complete AddOn surfaces" wording to actual observed controls
and precise shared-engine boundaries.

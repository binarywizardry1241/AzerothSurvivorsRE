# Local client Lua and CVar bridge

The embedding can register CVar defaults, queue normal registry writes and
install a Lua prelude before FrameXML/addons. The same prelude is installed on
replacement VMs after ReloadUI. Existing saved values win over defaults; this
uses the client registry, including its normal persistence and VM exchange.

State publication also runs when a local player session has ended, so addon API
state can be cleared when returning to the menu. Declared registry values are
captured with ordinary local-client input for the embedding to consume.

`LocalClientExtension` is generic client plumbing. Current Azeroth stored-level
API and HUD integration are documented separately in
[target/menu recovery](target-menu.md). This change alone does not establish
native addon API, menu or gameplay parity.

Validation: eight local-client library tests passed with the offline menu
profile, including saved-CVar preservation across two VM initializations and
clearing published state after session teardown. This also compiled the client
library test configuration. Interactive ReloadUI and original/rebuilt comparison
remain unverified.

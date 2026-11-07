# Custom AddOns metadata locale

Target SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This is the client-locale metadata source repair within **#17**.

Current custom inventory wrapper `1411dde70..1411ddf2d` reads the installed
client's locale from the existing chain before mapping its 104-byte desktop
AddOn records. A missing chain uses index zero. Its metadata iterator receives
that captured index; this is the real FrameXML/TOC locale, independent of the
fourteen custom-menu languages. Custom account overlay `140722200` then reads
the ordered account overrides. The in-game character/realm enable/load path is
the separate owner `1411de520`; the custom page does not gain a character
selector from that unrelated path.

`addons.rs` previously forced locale zero for Title/Notes even on another
installed-client locale. It now obtains the index through
`benilla_app::local_client::client_locale_index()`, a read-only adapter over the existing
`ui_script::client_locale`, and passes it to both real TOC metadata lookups.
The ordinary folder-title fallback, account overrides, dependencies/status and
page consumers retain their existing owners. Cached inventory refresh after
queued Options commands is documented in the [Options report](options-values.md).

`python3 -B scripts/recover-addons-metadata.py --check` verifies the
current native hash, scoped Ghidra identity, source connections and **ten native
locale snapshot/forwarding cases** (no chain, all eight client indices and an
unclamped byte). The chain pointer, empty raw inventory and collector are
explicit fixture seams. The [canonical extract/manifest](evidence/addons-metadata/manifest.json)
records those limits. TOC parsing, sorting, filesystem and VM do not execute.

An authored source regression reads a project-local TOC with English/German
Title/Notes and a later account override. It was **not compiled or run**.
Complete selected-target metadata/parser/loader dependency revalidation,
compilation, actual addon/UI interaction and original/rebuilt parity remain
unverified; historical status/enable checks retain their actual provenance.

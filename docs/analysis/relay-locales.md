# Relay-unreachable localized reason

Selected installed EXE SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`
(146,088,960 bytes). This report owns the source/static repair for **#217**;
relay failure provenance is independently owned by #216.

The [current proof](evidence/0.121.0/relay-locales/manifest.json) binds all fourteen
56-byte locale descriptors at `0x14765af88`, their exact 3,187-key JSON payloads,
and the native translation of `the co-op relay cannot be reached`. The source
catalogs now contain those exact fourteen values. `coop_forms.rs::localized_reason`
recognizes the key, connecting it to `coop_ui.rs::status_message` and the existing
locale lookup and complete status-sentence templates.

The current UI length-dispatch table at `0x1461ece68` selects `0x1402728c2` for
the 33-byte reason. Original instructions compare the complete key, then pass
that key to localization at `0x140272dbb` (`0x145aeaeb0`). A durable Ghidra query
of `0x140272730` supports the consumer connection; the raw Program omits its
external switch table, whose separately retained original entries govern the
selected dispatch. Historical [0.120.5 recovery](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.5.md)
retains its original target and addresses. Current descriptors, exact translated
values, dispatch, lookup call and inspected source consumer establish the
bounded correspondence independently.

`scripts/check-relay-locales.py` verifies the installed hash, all fourteen
descriptor/payload commitments and translations, fifteen original instructions,
the selected dispatch entry, durable query receipt and live source recognition/
lookup. It checks only this key, so independent changes to other locale keys do
not invalidate or silently broaden the proof.

Compilation, actual locale selection, status/input/font rendering, real failure
paths and original/rebuilt parity remain unverified. No game, client, server or
network process is run by this check. Completing this source connection does
not resolve the broader co-op release summary or prove actual network behavior.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-relay-locales.py
```

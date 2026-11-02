# Heroic co-op status — 0.121.0

Installed target: 146,088,960 bytes, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This is the locked-status presentation portion of permanent finding **#238**.
[verification-needed](../verification-needed.md) owns the wider admission/reward gap.

The [query/proof](evidence/0.121.0/coop-heroic-status/manifest.json) binds
Ghidra owner `140272730..1402736bb` to the exact current PE bytes. Its literal
reference at `1402735c3` reaches the current sentence
`you haven't opened {heroic} of {zone} with this class yet`. This is a reason
parser and presentation consumer; it does not establish the server's admission
predicate. The unrelated source-Location owner `140284e60..140285496` concerns
UI state and does not supply that predicate either.

## Native behavior and repair

For a reason beginning `locked:`, the native parser separates the zone before
the first following colon. A valid unsigned decimal byte after that colon
selects the Heroic sentence. It accepts a leading plus and leading zeros;
empty, malformed or overflowing suffixes select the ordinary zone-lock
sentence while retaining the zone substring before the colon.

Helper `145ac00a0..145ac00af` returns `min(rank, 5)` before the existing bounded
rank-name helper `145ac00b0`. Thus `locked:sm:0` names Normal in the Heroic
sentence, and `locked:sm:255` names Heroic V. The clamp is necessary because
the naming helper itself rejects ranks above five.

`coop_ui.rs::status_message` previously passed the entire `zone:rank` to the
zone resolver and always selected the ordinary sentence. It now splits the
native reason, parses the optional byte, clamps it at the naming boundary,
uses the existing localized rank names and fills the Heroic/zone sentence.
The existing normal-lock and unknown-reason paths retain their own behavior.
The exact Heroic sentence is also present in all fourteen embedded locale
catalogs. Its [locale projection](evidence/0.121.0/coop-heroic-status/localization.json)
binds each original payload and adds the missing source entry without replacing
existing translations. The same checker verifies every selected native value.

## Static checks and remaining scope

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-coop-heroic-status.py
```

The [result](evidence/0.121.0/coop-heroic-status/static-check.json) records
**3,264 original-parser cases**, covering every byte rank in all twelve zones,
plus malformed/empty/overflow/plus/leading-zero cases. All **256 clamp inputs**
were checked separately. The combined replay executes **400,908 original
instruction steps** in synthetic memory, stopping at the native zone lookup
boundary. The checker also verifies the original query subject and current
source consumer. It compiles no code and starts no client, game or service.

The wider admission, immutable run metadata, guest bootstrap and private
mark/drop transfer have their separate [current wire/source owner](coop-heroic-wire-0.121.0.md).
This presentation proof does not replace those checks or certify live transport.
Heroic-clear persistence retains its separate settlement owner.

Compilation, real status rendering/interaction, network/server behavior and
original/rebuilt parity remain unverified.

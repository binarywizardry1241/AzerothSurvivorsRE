# Save envelope

Target: installed0.109.0, SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns #17. The current
[manifest](evidence/0.109.0/save-core/manifest.json) binds original native ranges,
assembly, Ghidra pseudocode/profile digests and the
[91 retained native cases](evidence/0.109.0/save-core/envelope.json).
This replaces reliance on historical envelope addresses without changing the
existing compatible source algorithm.

Current opener `1458f6950` trims Unicode whitespace, requires the exact `RSE1:`
prefix and passes the remaining bytes to Base64 wrapper `1458e7920` and engine
`1459f8370`. Decoded data must contain at least36 bytes:16 nonce bytes, arbitrary
ciphertext and20 authentication bytes. The complete tag is checked before any
plaintext decryption; invalid UTF-8 is rejected after decryption. Missing/extra
Base64 padding, embedded whitespace and malformed encodings fail. Surrounding
Unicode whitespace is handled by the outer trim.

Current MAC `1458f6280` uses the42-byte embedded compatibility key already in
`save.rs`, HMAC's64-byte pads and SHA-1. The current scalar compression body
`145a5dfc0` executes in these checks; its feature cache is explicitly set to0.
The key is a game-format compatibility constant, not an account credential.
Crypt `1458f6000` XORs20-byte blocks from `HMAC(key, "ks" + nonce + u64LE(block))`.
Authentication is `HMAC(key, "tag" + nonce + ciphertext)`. Current seal owner
`1458f6c40` writes the corresponding nonce/ciphertext/tag envelope and Base64
prefix. Its nonce/RNG and OS dependencies are inspected statically, not replayed.
The source uses OS-generated nonce bytes; no fixed or predictably repeated nonce
is introduced.

`python3 -B scripts/check-save-envelope.py` verifies current installed
identity, native bytes and retained textual hashes, then passes91 cases. Actual
native HMAC, scalar SHA-1, keystream, **complete opener**, Unicode trim, Base64
engine and UTF-8 validator instructions run. Python's independent HMAC/SHA-1 and
keystream provide expected values. Every authentication-body byte is tampered
independently. Cases include block boundaries, empty payload, Unicode and invalid
UTF-8. Explicit seams provide scratch allocation, byte copying/zeroing/free and
failed-UTF8 String disposal. No parser or hash result is substituted. The script
rejects unexpected native calls and does not invoke the game, RNG, filesystem,
network or application runtime.

`--prepare-rea` prepares ignored project-local raw carriers and Ghidra plans;
run a generated plan with `python3 -B scripts/rea-batch.py <plan.json>`, which
uses `./scripts/rea` and closes its analysis session. Raw imports use a generic
ABI; the original Win64 instructions govern register and field interpretation.

Save's typed record schema, ordinary persistence/backup ordering and UI import
transitions have separate owners. These envelope checks do not establish them.
Rust code was not compiled or executed. OS entropy, hardware SHA-1 selection,
actual file IO and original/rebuilt import/export remain unverified. No compiler,
application or game was run, and no installed save/configuration was modified.

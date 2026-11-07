# Custom-menu character projection

Selected EXE SHA-256:
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

The current custom mode does not choose a saved roster row by name.
Factory14544d300 checks Game+1041. In custom mode it creates exactly one
56-byte temporary row from the current Pick: owned name at+be8, class/race/sex
at+c20/+c21/+c22 and five features at+c23..c27. The row has GUID0x00fffffe
and result words[1,0,0,0]. It is returned to character enumeration without being
appended to the permanent roster. Ordinary mode has a separate roster iterator.

CMSG_CHAR_ENUM0x37 enters1454443c9 and calls that factory at145444769.
CMSG_PLAYER_LOGIN0x3d enters14544440e, looks up the addressed returned row and
copies row+18 (GUID) to Game+f80 at145445502. This identity is separate from the
run's actual unit GUID and from a reconstruction session generation counter.

`Pick::custom_character` implements the temporary projection, and the current
custom entry carries that identity into terminal delivery. Persistent roster
results still update only an actually present, addressed row. No permanent
character is created or selected using a name/class guess.

## Enter delivery chain

Current custom Enter`1400c44f0`normalizes/persists the complete Pick and emits
command11. Consumer`14544d470`'s command11 branch at`14544d782`writes the Save and
emits JSON`{type:"picked"}`through its callback at`14544e294`. The frontend JSON
dispatcher`140062b50`recognizes exact`picked`at`1400635b9`and sets EnterResource+f;
`roster`sets+e at`140063aec`. Keyboard/timeout owner`14005f670`waits for both flags
and synthesizes native Enter through`140038240`, then follows its repeat/edge
handling. Command12 is a Pick update which saves and returns; the nearby factory
call is not in that command's control flow. The custom roster factory described
above closes the identity projection at the native character-enumeration boundary; ordinary roster selection remains
separate. No identity is inferred by name or class.

The native roster serializer145436620 stores GUID/name/race/class/sex/features
followed by best level, best seconds, runs and wins. Earlier source labels
map/position were incorrect; the record's four integer fields now have their
native meaning. Save syntax and separate per-class appearance records remain
unchanged.

[Factory source and Ghidra evidence](evidence/custom-roster/manifest.json)
and [four original-instruction rows](evidence/custom-roster/fixtures.json)
retain current hashes, UTF-8 names and raw appearance inputs. The optional
recovery script admits only this branch and reviewed allocation/String-clone
seams; it never launches an original process. Windows arguments/constants are
checked in original PE assembly because raw Ghidra uses a generic ABI.
The new Rust factory regression compares those rows; central execution results
are tracked in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md). This is source/instruction
recovery, not a completed original/rebuilt login comparison.

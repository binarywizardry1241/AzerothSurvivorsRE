# Lord Alexei Barov in 0.141.0

This recovery used `installed-game/AzerothSurvivors.exe`, 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
It covers Barov's part of [#313](../CURRENT-STATE.md#gap-313) and the
[0.140.0 encounter claim](../CHANGELOG.md#01400)
`changelog:0.140.0:8c658dbf737af799`. The older address and result bindings
remain in the [0.140.0 encounter report](scholomance-encounters-0.140.0.md).

## Script and attack rows

The current 32-byte action records at `0x147af7920` preserve the four initial
delays, repeat intervals and priorities. They point to the live entry 10504
script callbacks below. The header at `0x147af79a0` also contains the object
update, hit callback and death cleanup at offsets `+0x38`, `+0x48` and
`+0x50`. The current dispatcher at `0x145f4a110` calls the script update and
walks the timed or attack-owned followups before choosing another action.

| Tag | Attack and spell | First / repeat / priority | Current producer |
| --- | --- | --- | --- |
| 1 | Death Knell (6789) | 1.5 s / 24 s / 20 | `0x145ed21b0` |
| 2 | Immolate (17883) | 10.5 s / 12 s / 10 | `0x145ed42e0` |
| 3 | Shadow Verdict (18702) | 5.5 s / 23 s / 30 | `0x145ed31d0` |
| 4 | Veil of Shadow (17820) | 18 s / 28 s / 40 | `0x145ed3690` |

**Death Knell** captures the boss's interpolated XY once. It uses three
annuli with boundaries `[0, 7.5, 14, 26]`, damage twice the effective
ability power, colors red, amber and violet, and tails 0.2, 0.2 and 0.25 s.
The first windup is 1.75 s with the usual Heroic factor. The hold adds
1.8 s. The timed callbacks at `0x145ed2b70` and `0x145ed2a50` publish
each later ring half a second before its predecessor's impact.
`0x145ed26e0` gives each ring an impact 0.9 s after the predecessor's,
with a 0.05 s minimum windup on a late callback. Only the first ring casts.

**Shadow Verdict** first constructs an X and registers a followup on its
attack ID. After that row retires, `0x145ed2de0` creates the plus. Both
construct four 7.5-unit-wide capsule rays beginning at the arena center.
Their headings are 45° or 0° plus multiples of 90°. The builder sends a
100-unit candidate endpoint through the shared clip at `0x145fa2d90`.
Scholomance uses the first positive polygon edge intersection and the
optional occupancy segment. The colors are violet and blue, respectively.
Each row has a 1.75 s scaled warning and 0.2 s tail. The initial hold is
3.9 s normally and 3.37500024 s in Heroic. Both rows deal 2.1 times
effective power. All four rays in a row share recipient hit ID zero.

**Veil of Shadow** uses two horizontal sweep segments with starting points
`center + (-3,-12)` and `center + (3,-12)`. The left extent is the
greater of its two clipped west endpoints, and the right extent is the
lesser of its two clipped east endpoints. The two endpoints for each side
sample Y at `center.y ± 12`. Both 3-unit-wide segments move by `[0,24]`
over 4.5 s after a 1.75 s scaled windup. The parts deal 2.1 times effective
power, have a 0.25 s tail and share hit ID zero. The common sampler clips
the tick to the active interval and uses the accepted movement span plus the
part's sweep travel to choose between 1 and 64 subdivisions with 0.778-unit
spacing. Both the accepted sample and its projected counterpart must hit.
The serializer writes `x/y/a/len/w/dx/dy` for the sweep and `inner/r` for
the annuli at the switch table `0x147af3814`.

**Immolate** sorts eligible heroes by squared distance and lower GUID. It
prefers an eligible hero whose low GUID differs from the previous target,
and falls back to the nearest eligible hero. The attack tracks two radius-four
circles on the chosen hero. The warning is 1.5 s with the usual Heroic
factor and locks 0.9 s before impact. The initial part deals 1.7 times
effective power. The persistent part deals 0.3 times power once a second,
starting 0.5 s after impact and ending 4.5 s after that first pulse. The
event callback at `0x145ed2a70` checks action tag 2 and part ID zero.
The activation loop at `0x145f4d4e0` admits the non-periodic first part as
the clock crosses its end, which is the impact for this zero-duration part.
It copies the locked circle's center to event `+0x20` at `0x145f4d80d`.
The dispatcher at `0x145f515e0` selects the matching boss GUID and calls
header `+0x48`. The callback creates one radius-four spell 5740 dynamic
object at that center, including when all heroes dodge, with primary,
secondary or fallback ground height. The update at
`0x145ed40f0` retires all stored object GUIDs five seconds after the most
recent activation. The death callback `0x145ed2c00` also drains the list.

The [Barov producer](../../crates/azeroth-survivors-re/src/gameplay/mechanics/barov.rs)
uses the shared scripted marker and damage path.
[Arena clipping](../../crates/azeroth-survivors-re/src/gameplay/mechanics/scripted_arena.rs)
is reused across the Scholomance producers. The native sampler records
the matching recipient and part IDs before damage. Cooperative object
visibility, timing, terrain and paint output still need original/rebuilt
comparison. Compilation and gameplay verification remain under
[#313](../verification-needed.md#gap-313).

## Evidence

The Ghidra batch mapped the exact 10,547-byte raw slice
`0x145ed21b0..0x145ed4ae3` (file offset `0x5ed15b0`) at its original
VA. The slice and journal target digest both match
`d4889379288acd5a236bca5ce4a474171121cfd7118776da3844c76d51ec7aa1`.
All six operation results passed the journal's SHA-256 checks. The raw
import omits external constants and callee bodies. The original Windows
x64 instructions and PE data govern their argument and field interpretation.

| Procedure | Evidence ID | Result SHA-256 |
| --- | --- | --- |
| `0x145ed21b0` | `ev_20735b834cae01d962a1cc81f96e254d0b4840ccad537d03b3035db65c4c006c` | `4883f2c1b65bb16036093ef9cfab69abece5d50808cde426ab67535d3b20350f` |
| `0x145ed2a70` | `ev_56d4133031ff06ad1c822fd9d3a474ba2a7a986b73eb1fc5c1aa42a978c170d5` | `a92ed196b7f16930f13a0c97c39a4615b5ac11a0c3f6e340d74907b44f8b3ab0` |
| `0x145ed31d0` | `ev_9d190db3f21492c4c333b08423313565551012e3f7dbcf76bfe0e20e74a69d5d` | `6bd7851e5d52235652f9d296b4cb03e65d859df7a0a2391a2a5efedea645aa1c` |
| `0x145ed3690` | `ev_8e63c140c2b40f509d18b8f59fdadcf024a9fc16515981d0f9a7865abac03029` | `1ae8d5bbcdd314029cd941168d5271b76fa1c28b7878b1953d7974fd5c012fbc` |
| `0x145ed40f0` | `ev_f21b21684af2c797c784f396554c9acf32e8bc4a546949912f0059c561701e90` | `ea886583f8b1b4441710c2669d45b5defbbddcc88f582cbe8461454c2089c508` |
| `0x145ed42e0` | `ev_2c0e774d8996c56f371ee4f4d79f3d2a116bd4f18557b2e1ded5a2302c968043` | `3ecc4fe6c8da9c68fb7f5051fbf9d94e8b3346bbec07cae114170d548d1e44b7` |

| PE range (end exclusive) | File offset | SHA-256 |
| --- | --- | --- |
| Action rows and header `0x147af7920..0x147af79f8` | `0x7af5f20` | `9b2a776381a4887a8f91f8f31da591096bbae3739e3fec46b7e0636fffb69ff4` |
| Ring constants and label `0x147aebe10..0x147aebe33` | `0x7aea410` | `ae3bcb23284f290f78d2555e6a24acceaaf3f3b6d1c3fef822ce150b1e02cbef` |
| Death Knell later row `0x145ed26e0..0x145ed29e9` | `0x5ed1ae0` | `bcc1958580d1cf30871ef4e76e2e3bd77fa24bd7eb5b1ac7f7530d743f52acd6` |
| Death cleanup instructions `0x145ed2c00..0x145ed2d44` | `0x5ed2000` | `07a9cf43d1f67fa67af01598eeac8eb1fd6c1013c6802665247208ce52ca7288` |
| Verdict followup instructions `0x145ed2de0..0x145ed31d0` | `0x5ed21e0` | `6f239fa637861d826c875b188cbccc5774d327f364d8d01797d795084ea68216` |
| Attack timing initialization `0x145f9e450..0x145f9e8a7` | `0x5f9d850` | `dd5fe9c764825d7bda4bacd91879fe8f837558ca3178c1c54a4c0da2b89ee552` |
| Activation event and position `0x145f4d4e0..0x145f4d824` | `0x5f4c8e0` | `5634f5856a7d4549bfe05e9774c574855c7b686beef816431dc70b50e23619eb` |
| Script event dispatch `0x145f515e0..0x145f51678` | `0x5f509e0` | `533093a179c25901c52beb2c2b0efe9166bda55010dd85543e8fe6ec3f9633a0` |
| Arena clip `0x145fa2d90..0x145fa3076` | `0x5fa2190` | `81411e8544a4a479ea877b4fb49ff7df58ed6dfd52fddf4422909bbadc504dc2` |
| Hit sampling `0x146000c30..0x146001358` | `0x6000030` | `cc50dff8a164dc3a4f34df3854c03bde116733cbb9042068b9423761087ddf34` |
| Verdict ray iterator `0x14603c320..0x14603c5b0` | `0x603b720` | `de2f27d2c4e276997167cc158de71f1be8d4c4176052e81069dd64d97b67a15d` |
| Immolate ordering `0x145ed6a00..0x145ed6b14` | `0x5ed5e00` | `c2be35d6f3daa192a0d8d06801b1c1313331112c2e09a1a7f7406fe1267bd891` |
| Shape serializer table `0x147af3814..0x147af3838` | `0x7af1e14` | `ab627127f3ea4b430e9fa08d22aedb4332f6d8a49a2b8397580165c0542253b9` |

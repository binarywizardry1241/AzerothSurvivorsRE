# 0.92 picker hover and button appearance

Updated 2026-10-16. Target SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.

`hover.rs` implements the native `0x140125150` update: a 44-byte component contains
two 20-byte Colors and a 4-byte lift. Native Interaction None(tag2) copies the resting
color to all BorderColor edges and sets optional UiTransform translation to Px(0,0).
Hovered(tag1) and Pressed(tag0) both copy the active color and translate by Px(0,−lift).
It preserves scale, rotation, backgrounds, gradients and shadows. The former generic
background switching in the reconstructed menu did not come from this native path.

The public Bevy 0.18.1 compiled layout binds UiTransform translation0/scale16/rotation24,
Val2 x0/y8 and Interaction tags0/1/2 to the original instructions. This is a cross-checked
type-layout inference; the original Rust component name has not been recovered.
The owning [menu-hover-native.json](evidence/menu-hover-native.json) includes
SHA-bound constant bytes, REA evidence IDs, instruction ranges and limits.
`scripts/recover-menu-hover.py` reproduces its static record from the reference and
existing REA exports; it is not a build or runtime dependency.

| Control | Resting border | Hovered/Pressed border | Lift |
| --- | --- | --- | --- |
| Selected class icon or enabled selected zone | GOLD(.973,.824,.416) | Same GOLD | 2px |
| Unselected class icon or enabled zone | (.169,.129,.071) | (.690,.541,.227) | 2px |
| Enter | GOLD | PAPER(1,.914,.659) | 2px |
| Run Options | (.690,.541,.227) | PAPER(1,.914,.659) | 2px |

All border colors above are Srgba with alpha 1. Locked zone cards bypass native hover
component insertion. Picker class icons and enabled zone cards now receive the scoped
component, as does Enter. Run Options also now receives its exact common red gradient, black shadow and border/lift component.
The plugin observes changed Interaction or newly changed NativeHover. Its additional
component-change check establishes initial constructor styling; it does not introduce
a different pointer-state color. Build16 compiled and rendered the new constructor styles. Native/rebuilt pointer-state
captures remain pending.

Enter has a separate PI three-stop gradient with Auto positions, .5 hints and native
Oklaba interpolation. Raw-linear RGBA stops are (.478,.102,.063,1),
(.227,.031,.024,1), (.133,.016,.016,1), following the same native Srgba-export to
LinearRgba constructor bridge as other UI gradients. Its orange raw-linear glow
is (1,.42,.1,.35), zero offset, spread 2px/blur 30px. These values are now implemented.
The class icon glow's raw-linear color constructor is also corrected from direct
`0x1402002fb`→`0x14020030c` proof. Build16 rendered the gradient/glow/class changes without reported shader errors; exact
hover-state comparison remains pending.

The top-right community and three text buttons use spawn helper `0x1401adea0` and a
552-byte captured bundle containing parent, Node, BorderColor, BackgroundGradient,
Action, Interaction and BoxShadow. It carries no 44-byte hover style, unlike the
class/zone insertion route. Thus the recovered 125150 path does not alter those
controls. That bounded negative evidence does not prove absence of every global
painter or component hook; no additional dynamic path has been demonstrated.

Escape Menu `0x1401c8d40` likewise creates its buttons with no 44-byte hover style.
At `0x1401c9b7c` it copies the 488-byte Node/Border/Gradient tuple, writes Interaction
None at610 and the one-byte menu action at611, then copies its 24-byte shadow.
Spawn helper `0x1401a5f90` copies 528 bytes total: parent8 + Node384 + Border80 +
Gradient24 + Interaction1 + MenuAction1 + Shadow24 + padding6. There is no subsequent
queued hover insertion in this loop. Its constructor style should therefore be
preserved for the recovered 125150 path; this remains bounded negative evidence
about that path, rather than proof against every other possible ECS hook.

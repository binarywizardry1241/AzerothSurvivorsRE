#!/usr/bin/env python3
"""Check the current frontend Pick registration and HUD class forwarding.

Native windows run in scratch memory. Parent/child stack frames and the already
resolved resource pointer are supplied; generic ECS and graphics calls do not run.
"""
import hashlib
import json
import struct
from pathlib import Path

from native_terminal import NativeReplay, require, verified_input

ROOT = Path(__file__).resolve().parents[1]
manifest, target, data, pe = verified_input(
    ROOT / "docs/analysis/evidence/0.109.0/hud-class-provider"
)


def raw(address, size):
    offset = pe.rva_offset(address - pe.image_base)
    return data[offset : offset + size]


binding_bytes = (ROOT / manifest["frontend_pick_binding"]).read_bytes()
require(hashlib.sha256(binding_bytes).hexdigest() == manifest["frontend_pick_binding_sha256"], "Canonical Pick binding bytes")
binding = json.loads(binding_bytes)
require(binding["target_sha256"] == target["sha256"], "Canonical Pick binding target")
require(binding["resource"]["typeid"] == manifest["frontend_pick_typeid"], "Canonical Pick type")
for window in binding["code_windows"]:
    a, b = int(window["start"], 16), int(window["end_exclusive"], 16)
    require(hashlib.sha256(raw(a, b-a)).hexdigest() == window["sha256"], "Canonical frontend Pick construction")
pick_type = bytes.fromhex(manifest["frontend_pick_typeid"])
require(raw(0x145D9DF58, 16) == pick_type, "HUD Pick descriptor identity")
require(raw(0x145D9D780, 16) == pick_type, "Frontend construction Pick identity")
require(struct.unpack("<QQ", raw(0x145D9DF70, 16)) == (64, 8), "Pick layout")
for address, expected in (
    (0x145DF20B8, 0x14029C710),
    (0x145DF20C8, 0x1403DB290),
    (0x145DF20F0, 0x14029C080),
):
    require(struct.unpack("<Q", raw(address, 8))[0] == expected, "Shared system vtable")

replay = NativeReplay(data, pe)
u, r = replay.machine, replay.registers
steps = [
    (0x14028EA00, 0x14028EA0A),
    (0x14028EC59, 0x14028EC71),
    (0x14020CD44, 0x14020CD47),
    (0x14020D15E, 0x14020D165),
    (0x14020E9FF, 0x14020EA0E),
    (0x14020EFC3, 0x14020EFC7),
]
cases = []
for class_id in range(256):
    replay.reset("frontend-Pick-class", steps, {end for _, end in steps})
    replay.put(replay.app + 0x38, "<B", class_id)
    u.reg_write(r.UC_X86_REG_RAX, replay.app)
    u.reg_write(r.UC_X86_REG_RSI, replay.mem + 0x19000)
    for start, end in steps:
        require(replay.run(start) == end, "Class forwarding window")
    actual = u.reg_read(r.UC_X86_REG_RCX)
    require(actual == class_id, "HUD class must preserve the frontend Pick byte")
    require(replay.get(replay.bp + 0x170, "<Q")[0] == replay.bp + 0x3A0, "Closure class pointer")
    cases.append(dict(frontend_class=class_id, atlas_class=actual))

source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/stored_hud.rs").read_text()
require("let class = menu.class_id();" in source, "Stored HUD frontend class connection")
output = ROOT / "runtime/fixgap-7-9/hud-class-provider-check.json"
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(
    json.dumps(
        dict(
            target=target,
            cases=cases,
            instruction_count=replay.instructions,
            limits=[
                "Native registration, resource slot and sixth Win64 argument are reviewed statically against full current owners.",
                "Scratch setup supplies the resolved Pick pointer and register state between declared forwarding windows.",
                "Existing HUD checks separately replay all256 class/atlas mappings.",
                "No compiler, Rust test, ECS scheduler, graphics or game executes.",
            ],
        ),
        indent=2,
    )
    + "\n"
)
print(f"PASS {len(cases)} native frontend Pick/class forwarding cases and current type/vtable/source guards")

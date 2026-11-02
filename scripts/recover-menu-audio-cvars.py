"""Native SoundConfig callback edge outputs; no audio device, filesystem or OS in emulation."""
from pathlib import Path
import json
import hashlib
import struct

# Reuse only the reviewed PE mapping/heap/String helpers, before its hooks or fixture work.
ROOT = Path(__file__).resolve().parents[1]
exec((ROOT / "scripts/recover-menu-startup-save.py").read_text().split("uc.hook_add", 1)[0])
native_ranges = [(0x1408FD770, 0x1408FDD63), (0x1456D8BF0, 0x1456D90B3),
                 (0x1456D3F10, 0x1456D43D9)]
calls = {}


def hook(_, address, size, user):
    if any(a <= address < b for a, b in native_ranges):
        return
    calls[hex(address)] = calls.get(hex(address), 0) + 1
    rcx, rdx, r8 = [reg(x) for x in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8)]
    if address == 0x14010AFD0:
        value = text(rcx, rdx)
        assert value.isascii()
        leading = len(value) - len(value.lstrip())
        uc.reg_write(UC_X86_REG_RAX, rcx + leading)
        uc.reg_write(UC_X86_REG_RDX, len(value.strip()))
    elif address in (0x140002200, 0x1400021D0):
        pass
    elif address == 0x1400021C0:
        uc.reg_write(UC_X86_REG_RAX, allocate(rcx))
    elif address == 0x1457149FD:
        uc.mem_write(rcx, bytes(uc.mem_read(rdx, r8)))
        uc.reg_write(UC_X86_REG_RAX, rcx)
    else:
        raise RuntimeError(f"Unreviewed native dependency {address:x}")
    stack = reg(UC_X86_REG_RSP)
    destination = q(stack)
    uc.reg_write(UC_X86_REG_RSP, stack + 8)
    uc.reg_write(UC_X86_REG_RIP, destination)


uc.hook_add(UC_HOOK_CODE, hook)
fields = [
    ("MasterVolume", "master", 0, "f32"),
    ("SoundVolume", "sfx", 4, "f32"),
    ("MusicVolume", "music", 8, "f32"),
    ("AmbienceVolume", "ambience", 12, "f32"),
    ("MasterSoundEffects", "enabled", 16, "bool"),
    ("EnableMusic", "music_enabled", 18, "bool"),
    ("EnableAmbience", "ambience_enabled", 19, "bool"),
    ("EnableErrorSpeech", "error_speech", 20, "bool"),
    ("Sound_EnableSoundWhenGameIsInBG", "background_sound", 21, "bool"),
    ("SoundReverb", "reverb", 22, "bool"),
    ("SoundOutputLimiter", "limiter", 25, "bool"),
    ("SoundListenerAtCharacter", "listener_at_character", 26, "bool"),
    ("EmoteSounds", "emote_sounds", 27, "bool"),
    ("SoundZoneMusicNoDelay", "zone_music_no_delay", 28, "bool"),
]
cases = []
for key, field, offset, kind in fields:
    values = ("-2", "0", "0.25", "1", "2", "NaN", "bad", "  .5 \n") if kind == "f32" else ("-2", "0", "2", "NaN", "bad")
    for value in values:
        uc.mem_write(HEAP, bytes(0x100000))
        next_heap = HEAP + 0x1000
        config, event, observer, resource, tick = [HEAP + x for x in (0x100, 0x200, 0x300, 0x400, 0x500)]
        uc.mem_write(config, struct.pack("<4f", *([0.375] * 4)) + bytes(16))
        out_string(event, key)
        out_string(event + 0x30, value)
        putq(observer + 8, event)
        putq(resource, config)
        putq(resource + 0x10, tick)
        uc.mem_write(resource + 0x1C, struct.pack("<I", 99))
        stack = STACK + 0x1F008
        putq(stack, STOP)
        for register, argument in ((UC_X86_REG_RSP, stack), (UC_X86_REG_RCX, 0),
                                   (UC_X86_REG_RDX, observer), (UC_X86_REG_R8, resource)):
            uc.reg_write(register, argument)
        uc.emu_start(0x1408FD770, STOP, count=100000)
        assert reg(UC_X86_REG_RIP) == STOP
        assert struct.unpack("<I", uc.mem_read(tick, 4))[0] == 99
        raw = bytes(uc.mem_read(config + offset, 4 if kind == "f32" else 1))
        result = struct.unpack("<f", raw)[0] if kind == "f32" else bool(raw[0])
        if kind == "f32":
            # JSON keeps the exact bit pattern plus a text form, avoiding nonstandard NaN JSON.
            result = str(result)
        cases.append({"key": key, "input": value, "field": field, "offset": offset,
                      "kind": kind, "native_value": result, "native_bits_le": raw.hex()})
output = {
    "version": "0.92.0",
    "target_sha256": SHA,
    "method": "Bounded unchanged native SoundConfig callback, f32 parser and lexical pre-parser. Expected output is read from native-written field bytes; no source clamp/boolean formula is used.",
    "native_ranges": [{"start": hex(a), "end_exclusive": hex(b), "sha256": hashlib.sha256(data[pe.rva_offset(a - pe.image_base):pe.rva_offset(b - pe.image_base)]).hexdigest()} for a, b in native_ranges],
    "stubs": ["ASCII-only trim for declared fixture inputs", "Emulator heap allocation/no-op deallocation", "memcpy"],
    "external_calls": calls,
    "field_map": [{"key": key, "field": field, "offset": offset, "kind": kind} for key, field, offset, kind in fields],
    "cases": cases,
    "limits": ["No audio device, decoder, application or OS/files/network call is executed inside emulation.", "This is event-callback behavior. Native startup CVar registry validation is a separate stage and may reject invalid/NaN loaded settings before the callback.", "Master/focus mixer policies require their separately recovered functions; callback values alone do not prove playback."],
}
path = ROOT / "docs/analysis/evidence/0.92/audio-cvar-fixtures.json"
path.write_text(json.dumps(output, indent=2) + "\n")
print(f"Recorded {len(cases)} native audio CVar edge outputs across {len(fields)} exact keys.")

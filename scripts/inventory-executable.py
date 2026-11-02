#!/usr/bin/env python3
"""Read historical 0.91.4 metadata and curated leads without executing the EXE.

Uses only Python's standard library. All optional input/output paths must remain
inside this checkout. String references are byte-pattern leads, not decompilation.
"""
from portable_paths import objdump_output

import argparse
import bisect
from collections import Counter
import datetime
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess


ROOT = Path(__file__).resolve().parent.parent
HISTORICAL_SHA256 = "719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150"
CANONICAL_ARTIFACT_PATH = "AzerothSurvivors/AzerothSurvivors.exe"
HISTORICAL_BINARY = ROOT / "AzerothSurvivors/AzerothSurvivors-0.91.4.exe"


def project_path(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise argparse.ArgumentTypeError("path must stay inside this checkout")
    return path


class PE:
    def __init__(self, data):
        self.data = data
        if data[:2] != b"MZ":
            raise ValueError("not a DOS/PE image")
        self.pe = self.u32(0x3C)
        if data[self.pe:self.pe + 4] != b"PE\0\0":
            raise ValueError("not a PE image")
        coff = self.pe + 4
        self.machine, count, self.timestamp, self.symbol_offset, self.symbol_count = struct.unpack_from("<HHIII", data, coff)
        self.optional_size, self.characteristics = struct.unpack_from("<HH", data, coff + 16)
        self.optional = coff + 20
        if self.u16(self.optional) != 0x20B:
            raise ValueError("this helper expects PE32+ (64-bit)")
        self.image_base = self.u64(self.optional + 24)
        self.sections = []
        for index in range(count):
            at = self.optional + self.optional_size + index * 40
            name = data[at:at + 8].rstrip(b"\0").decode("ascii")
            virtual_size, rva, raw_size, raw_offset = struct.unpack_from("<IIII", data, at + 8)
            flags = self.u32(at + 36)
            self.sections.append(dict(name=name, rva=rva, virtual_size=virtual_size,
                                      raw_offset=raw_offset, raw_size=raw_size,
                                      characteristics=hex(flags)))
        self.directories = [struct.unpack_from("<II", data, self.optional + 112 + 8 * i)
                            for i in range(min(self.u32(self.optional + 108), 16))]

    def u16(self, at):
        return struct.unpack_from("<H", self.data, at)[0]

    def u32(self, at):
        return struct.unpack_from("<I", self.data, at)[0]

    def u64(self, at):
        return struct.unpack_from("<Q", self.data, at)[0]

    def rva_offset(self, rva):
        if rva < self.u32(self.optional + 60):
            return rva
        for section in self.sections:
            if section["rva"] <= rva < section["rva"] + section["raw_size"]:
                return section["raw_offset"] + rva - section["rva"]
        raise ValueError(f"RVA {rva:#x} has no raw bytes")

    def offset_va(self, offset):
        for section in self.sections:
            if section["raw_offset"] <= offset < section["raw_offset"] + section["raw_size"]:
                return self.image_base + section["rva"] + offset - section["raw_offset"]
        return None

    def cstr(self, at):
        return self.data[at:self.data.index(b"\0", at)].decode("ascii", errors="replace")

    def imports(self):
        rva, size = self.directories[1]
        result = []
        if not rva:
            return result
        at = self.rva_offset(rva)
        while any(self.data[at:at + 20]):
            lookup, _, _, name_rva, first_thunk = struct.unpack_from("<IIIII", self.data, at)
            thunk = self.rva_offset(lookup or first_thunk)
            names = []
            while (value := self.u64(thunk)):
                if value & (1 << 63):
                    names.append(f"ordinal:{value & 0xFFFF}")
                else:
                    names.append(self.cstr(self.rva_offset(value) + 2))
                thunk += 8
            result.append(dict(library=self.cstr(self.rva_offset(name_rva)),
                               iat_start_address=hex(self.image_base + first_thunk), functions=names))
            at += 20
        return result

    def debug(self):
        rva, size = self.directories[6]
        entries = []
        if not rva:
            return entries
        at = self.rva_offset(rva)
        for offset in range(at, at + size, 28):
            _, timestamp, major, minor, kind, byte_count, data_rva, data_offset = struct.unpack_from("<IIHHIIII", self.data, offset)
            entry = dict(type=kind, size=byte_count, timestamp=timestamp)
            if kind == 2 and self.data[data_offset:data_offset + 4] == b"RSDS":
                entry.update(codeview_signature="RSDS", pdb_path=self.cstr(data_offset + 24),
                             guid_bytes=self.data[data_offset + 4:data_offset + 20].hex(),
                             age=self.u32(data_offset + 20))
            entries.append(entry)
        return entries

    def functions(self):
        rva, size = self.directories[3]
        if not rva:
            return []
        at = self.rva_offset(rva)
        return [struct.unpack_from("<III", self.data, offset) for offset in range(at, at + size, 12)]


def string_leads(pe):
    data = pe.data
    source_pattern = rb"crates[\\/]wenilla-rogue(?:-app)?[\\/]src[\\/][a-zA-Z0-9_\\/\-]+\.rs"
    paths = {}
    for match in re.finditer(source_pattern, data):
        name = match[0].decode("ascii").replace("\\", "/")
        paths.setdefault(name, []).append(match.start())
    module_pattern = rb"wenilla_rogue(?:_app)?(?:::[A-Za-z_][A-Za-z0-9_]*)+"
    module_counts = Counter(match[0].decode("ascii") for match in re.finditer(module_pattern, data))
    modules = [{"name": name, "occurrences": count} for name, count in sorted(module_counts.items())]
    terms = [
        b"characters.txt", b"wenilla-rogue", b"AzerothSurvivors/", b"GetRunState", b"GetRunSchedule",
        b"AZS_", b"SURVIVORS_", b"Guardian Slain", b"GUARDIAN SLAIN", b"BATTLEGROUND CACHE",
        b"Cheats enabled", b"talentxp", b"talents:", b"unlock", b"endless", b"RunMods",
    ]
    snippets = []
    for term in terms:
        hits = list(re.finditer(re.escape(term), data))
        for match in hits[:12]:
            start = max(data.rfind(b"\0", max(0, match.start() - 100), match.start()) + 1, match.start() - 100)
            stop = data.find(b"\0", match.end(), min(len(data), match.end() + 350))
            if stop < 0:
                stop = min(len(data), match.end() + 350)
            snippet = data[start:stop].decode("utf-8", errors="replace")
            snippet = "".join(character if character.isprintable() else " " for character in snippet)
            snippets.append(dict(term=term.decode("ascii"), file_offset=hex(match.start()),
                                 virtual_address=hex(pe.offset_va(match.start()) or 0),
                                 text=snippet, total_term_occurrences=len(hits)))
    return paths, modules, snippets


def source_references(pe, paths):
    """Find RIP-relative LEA bytes pointing at/near a source-path start.

    Scan is not a disassembler. The PE exception directory supplies the nearest
    enclosing runtime-function record, whose range can guide Ghidra inspection.
    """
    offsets = {pe.offset_va(offset): name for name, occurrences in paths.items() for offset in occurrences}
    offsets.pop(None, None)
    locations = {name: [] for name in paths}
    descriptors = {}
    for section in pe.sections:
        if int(section["characteristics"], 16) & 0x20000000:
            continue
        start, size = section["raw_offset"], section["raw_size"]
        for at in range(start, start + max(0, size - 24), 8):
            pointer = pe.u64(at)
            if pointer not in offsets:
                continue
            name = offsets[pointer]
            length, line, column = struct.unpack_from("<QII", pe.data, at + 8)
            if length == len(name) and 0 < line < 1000000 and 0 < column < 100000:
                address = pe.offset_va(at)
                record = dict(location_address=hex(address), path_address=hex(pointer),
                              source_line=line, source_column=column,
                              rip_relative_lea_candidates=[])
                locations[name].append(record)
                descriptors[address] = record
    path_starts = sorted(offsets)
    functions = sorted(pe.functions())
    function_starts = [record[0] for record in functions]
    refs = {name: [] for name in paths}
    for section in pe.sections:
        if not int(section["characteristics"], 16) & 0x20000000:
            continue
        start, size = section["raw_offset"], section["raw_size"]
        text = pe.data[start:start + size]
        for match in re.finditer(rb"[\x48\x4c]\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]....", text, flags=re.DOTALL):
            instruction_rva = section["rva"] + match.start()
            target = pe.image_base + instruction_rva + 7 + struct.unpack_from("<i", match[0], 3)[0]
            index = bisect.bisect_left(path_starts, target)
            # Rust diagnostic strings can start with "event " or a panic prefix.
            nearby = [value for value in path_starts[max(index - 1, 0):index + 2] if 0 <= value - target <= 6]
            for value in nearby:
                name = offsets[value]
                findex = bisect.bisect_right(function_starts, instruction_rva) - 1
                function = functions[findex] if findex >= 0 else None
                record = dict(instruction_address=hex(pe.image_base + instruction_rva),
                              target_address=hex(target), path_address=hex(value))
                if function and function[0] <= instruction_rva < function[1]:
                    record.update(runtime_function_start=hex(pe.image_base + function[0]),
                                  runtime_function_end=hex(pe.image_base + function[1]))
                refs[name].append(record)
            if target in descriptors:
                findex = bisect.bisect_right(function_starts, instruction_rva) - 1
                function = functions[findex] if findex >= 0 else None
                record = dict(instruction_address=hex(pe.image_base + instruction_rva), target_address=hex(target))
                if function and function[0] <= instruction_rva < function[1]:
                    record.update(runtime_function_start=hex(pe.image_base + function[0]),
                                  runtime_function_end=hex(pe.image_base + function[1]))
                descriptors[target]["rip_relative_lea_candidates"].append(record)
    return refs, locations


def embedded_addon_api(pe, output):
    start_marker = b"-- Azeroth Survivors: the run for addons, off the server's addon lines."
    end_marker = b'AZSApiFrame:SetScript("OnEvent", AZS_ApiOnEvent);\n'
    start = pe.data.find(start_marker)
    end = pe.data.find(end_marker, start)
    if start < 0 or end < 0:
        return None
    end += len(end_marker)
    raw = pe.data[start:end]
    output.write_bytes(raw)
    return dict(path=str(output.relative_to(ROOT)), file_offset=hex(start),
                virtual_address=hex(pe.offset_va(start)), size_bytes=len(raw),
                sha256=hashlib.sha256(raw).hexdigest(),
                method="Exact bytes between unique embedded Lua comment/frame-registration markers.",
                caveat="Shipped embedded source contract; execution and server-side semantics not verified.")


def direct_call_candidates(pe, targets):
    """Find relative CALL bytes; instruction boundaries still need verification."""
    functions = sorted(pe.functions())
    starts = [record[0] for record in functions]
    result = []
    for section in pe.sections:
        if not int(section["characteristics"], 16) & 0x20000000:
            continue
        start, size = section["raw_offset"], section["raw_size"]
        code = pe.data[start:start + size]
        for match in re.finditer(rb"\xe8....", code, flags=re.DOTALL):
            rva = section["rva"] + match.start()
            target = pe.image_base + rva + 5 + struct.unpack_from("<i", match[0], 1)[0]
            if target not in targets:
                continue
            record = dict(call_instruction_address=hex(pe.image_base + rva),
                          callee_address=hex(target), label=targets[target])
            index = bisect.bisect_right(starts, rva) - 1
            function = functions[index] if index >= 0 else None
            if function and function[0] <= rva < function[1]:
                record.update(caller_runtime_function_start=hex(pe.image_base + function[0]),
                              caller_runtime_function_end=hex(pe.image_base + function[1]))
            result.append(record)
    return result


def capture_native_assembly(pe, binary, output, scope):
    """Retain narrowly bounded disassembly and a command/hash manifest."""
    guardian_ranges = [
        ("guardian-scalar-0", 0x1454BEA70, 0x1454BEDBD),
        ("guardian-scalar-1", 0x1454BEE60, 0x1454BEFED),
        ("guardian-scalar-caller-core", 0x14547BE10, 0x14547C020),
        ("guardian-scalar-caller-rescale", 0x14549DE50, 0x14549DFF0),
    ]
    boss_ranges = [
        ("boss-clock-phase-update", 0x145470654, 0x1454706B1),
        ("boss-clock-minutes-zone-selection", 0x14547967A, 0x145479753),
        ("boss-schedule-due-threshold", 0x14547A22B, 0x14547A284),
        ("boss-schedule-post-cursor-gate", 0x14547B8A8, 0x14547B8D8),
        ("boss-spawn-helper", 0x14548F900, 0x14549042B),
    ]
    combat_ranges = [
        ("combat-actor-health-subtraction", 0x145493960, 0x1454939AD),
        ("combat-actor-death-and-guardian-metadata", 0x145494227, 0x1454944DF),
        ("combat-guardian-counter-and-reward-type", 0x1454948FB, 0x145494AA0),
        ("combat-attack-damage-source-and-queue", 0x14549AAB7, 0x14549AD15),
        ("combat-attack-damage-queue-consumer", 0x14549C411, 0x14549C533),
        ("combat-player-damage-argument", 0x145463484, 0x145463567),
        ("combat-player-health-subtraction", 0x145463743, 0x14546375B),
    ]
    ability_ranges = [
        ("ability-key-definition-lookup", 0x1453E37E0, 0x1453E3877),
        ("ability-runtime-record-construction", 0x1454E74D1, 0x1454E75E7),
        ("ability-cooldown-constant-setup", 0x1454713E0, 0x145471449),
        ("ability-cooldown-countdown", 0x145471476, 0x1454714CD),
        ("ability-cast-gate-and-call", 0x145471700, 0x1454717EF),
        ("ability-cooldown-interval", 0x145471B0A, 0x145471BA2),
        ("ability-failed-cast-retry", 0x145471CE5, 0x145471CF1),
        ("ability-effect-value-calculation", 0x1454B7714, 0x1454B78C9),
        ("ability-damage-hit-consumer", 0x1454B7DF8, 0x1454B7E53),
    ]
    menu_ranges = [
        ("menu-startup-glue-environment", 0x14000175F, 0x14000179F),
        ("menu-startup-mode-default", 0x140010BCF, 0x140010C2F),
        ("menu-startup-mode-logs", 0x140001887, 0x1400018EB),
        ("menu-data-directory-environment", 0x14556CE87, 0x14556CEA0),
        ("menu-data-directory-candidates", 0x14556D04A, 0x14556D12B),
    ]
    ranges = {"guardian": guardian_ranges, "boss": boss_ranges, "combat": combat_ranges,
              "ability": ability_ranges, "menu": menu_ranges}[scope]
    manifest = dict(artifact=CANONICAL_ARTIFACT_PATH,
                    artifact_sha256=hashlib.sha256(pe.data).hexdigest(),
                    working_directory="checkout root", target_executed=False,
                    tool_version=objdump_output(["objdump", "--version"], cwd=ROOT, text=True).strip(),
                    caveat="Caller excerpts can begin/end inside an instruction. Native semantics require dataflow and REA verification.",
                    outputs=[])
    thunk_address = 0x14570B233
    thunk_offset = pe.rva_offset(thunk_address - pe.image_base)
    raw_thunk = pe.data[thunk_offset:thunk_offset + 6]
    if raw_thunk[:2] == b"\xff\x25":
        iat = thunk_address + 6 + struct.unpack_from("<i", raw_thunk, 2)[0]
        for imported in pe.imports():
            index = (iat - int(imported["iat_start_address"], 16)) // 8
            if 0 <= index < len(imported["functions"]):
                manifest["guardian_math_import_thunk"] = dict(
                    address=hex(thunk_address), bytes=raw_thunk.hex(), iat_address=hex(iat),
                    library=imported["library"], imported_function=imported["functions"][index])
                break
    for label, start, end in ranges:
        command = ["objdump", "-d", f"--start-address={start:#x}", f"--stop-address={end:#x}", str(binary.relative_to(ROOT))]
        raw = subprocess.check_output(command, cwd=ROOT)
        path = output / f"{label}.asm"
        path.write_bytes(raw)
        manifest["outputs"].append(dict(path=str(path.relative_to(ROOT)), invocation=command,
                                        start_address=hex(start), end_address_exclusive=hex(end),
                                        size_bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest()))
    if scope == "boss":
        manifest["observed_float_constants"] = [
            dict(address=hex(address), value=struct.unpack_from("<f", pe.data, pe.rva_offset(address - pe.image_base))[0])
            for address in (0x1458D9830, 0x146AA4C70, 0x146AA4C74, 0x146AA4C90)]
        manifest["interpretation"] = {
            "timing": "Core divides state+0x8cc by 60, compares against boss row+64 using 88-byte stride, increments cursor and calls boss-spawn helper when due.",
            "health": "Spawn helper scales boss row+68 and initializes actor-record fields+0xf0/+0xf4 to the result; current/max health naming is supported by caller ratio-preserving rescale evidence.",
            "limits": "Static observations; no runtime execution. State-field names, phase enum names, all spawn gates and other modifiers are not fully recovered.",
        }
    if scope == "combat":
        manifest["linked_binary_strings"] = [
            dict(address=hex(address), size_bytes=length,
                 value=pe.data[pe.rva_offset(address - pe.image_base):pe.rva_offset(address - pe.image_base) + length].decode("utf-8"))
            for address, length in ((0x146AA6F28, 91), (0x146AA5038, 8), (0x146AA5729, 4))]
        manifest["observed_float_constants"] = [
            dict(address=hex(address), value=struct.unpack_from("<f", pe.data, pe.rva_offset(address - pe.image_base))[0])
            for address in (0x14589F888, 0x1458A76C0)]
        manifest["interpretation"] = {
            "guardian_counter": "Instruction0x145494942 increments state+0x65c in the branch consuming actor guardian metadata; the same branch emits guardian-slain text and a reward typed guardian.",
            "attack_damage": "Actor+0xf8 is the input damage scalar in a queued attack; the queue consumer passes that float to0x145463440, which applies defenses then subtracts remaining damage from state+0x3f8.",
            "limits": "Static observations; runtime execution, every modifier and every alternate combat path remain unverified.",
        }
    if scope == "ability":
        manifest["observed_float_constants"] = [
            dict(address=hex(address), value=struct.unpack_from("<f", pe.data, pe.rva_offset(address - pe.image_base))[0])
            for address in (0x1458A0B54, 0x14589F888)]
        manifest["definition_table"] = dict(address="0x1466cab30", stride_bytes=120, record_count=111,
                                            native_lookup_byte_limit="0x3408")
        manifest["interpretation"] = {
            "cooldown": "Definition+72 supplies a scaled cast interval; runtime row+36 counts down by tick delta, is set to infinity before cast and updated on success; failed casts use0.2 retry.",
            "effect_power": "Definition+68 feeds scaled effect power in0x1454b76a0; an attack branch passes the derived float to actor hit/death handler0x145493450.",
            "limits": "Effect power is not universal damage for every ability. Full rank, rarity, school, talent and targeting semantics remain unresolved.",
        }
    if scope == "menu":
        manifest["linked_binary_strings"] = [
            dict(address=hex(address), size_bytes=length,
                 value=pe.data[pe.rva_offset(address - pe.image_base):pe.rva_offset(address - pe.image_base) + length].decode("utf-8"))
            for address, length in ((0x14589E0C8, 14), (0x14589E0D7, 30),
                                    (0x14589E0F6, 39), (0x146ABF150, 8),
                                    (0x146ABF158, 8), (0x146ABF160, 4))]
        manifest["interpretation"] = {
            "default_surface": "With no explicit quickstart hero/zone selection and no WOW_ROGUE_GLUE=1, startup selects the custom hero-picker mode; the env switch selects the stock-client-screen mode.",
            "data_input": "Data directory candidate builder reads WOW_DATA and constructs WoW/Data and Data path candidates. Final archive selection and required menu assets are not fully traced.",
            "limits": "No game execution or MPQ content inspection. Native menu pixel layout and every first-run overlay are unverified.",
        }
    path = output / f"{scope}-assembly-manifest.json"
    path.write_text(json.dumps(manifest, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=project_path, default=HISTORICAL_BINARY,
                        help="historical 0.91.4 EXE; fixed native addresses require its original hash")
    parser.add_argument("--output", type=project_path, default=ROOT / "docs/analysis/evidence/executable-inventory.json")
    parser.add_argument("--capture-guardian-assembly", action="store_true",
                        help="also retain bounded guardian/caller objdump output and its manifest")
    parser.add_argument("--capture-boss-assembly", action="store_true",
                        help="also retain bounded boss scheduling/spawn objdump output and its manifest")
    parser.add_argument("--capture-combat-assembly", action="store_true",
                        help="also retain bounded guardian counter/attack damage objdump output and its manifest")
    parser.add_argument("--capture-ability-assembly", action="store_true",
                        help="also retain bounded ability definition/cooldown/damage objdump output and its manifest")
    parser.add_argument("--capture-menu-assembly", action="store_true",
                        help="also retain bounded default picker/data discovery objdump output and its manifest")
    args = parser.parse_args()
    pe = PE(args.binary.read_bytes())
    if hashlib.sha256(pe.data).hexdigest() != HISTORICAL_SHA256:
        parser.error("Historical 0.91.4 analysis requires SHA-256 " + HISTORICAL_SHA256)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    paths, modules, snippets = string_leads(pe)
    references, locations = source_references(pe, paths)
    sections = [{**section, "virtual_address": hex(pe.image_base + section["rva"])} for section in pe.sections]
    evidence = dict(
        schema_version=1,
        method="Static standard-library PE parsing and bounded byte/string scans; target never executed.",
        caveat="Strings and instruction-pattern references are leads, not behavior proof or verified instruction boundaries.",
        artifact=CANONICAL_ARTIFACT_PATH, size_bytes=len(pe.data), sha256=hashlib.sha256(pe.data).hexdigest(),
        machine=hex(pe.machine), image_base=hex(pe.image_base), entrypoint=hex(pe.image_base + pe.u32(pe.optional + 16)),
        linker_version=f"{pe.data[pe.optional + 2]}.{pe.data[pe.optional + 3]}",
        pe_timestamp_raw=pe.timestamp,
        pe_timestamp_utc=datetime.datetime.fromtimestamp(pe.timestamp, datetime.timezone.utc).isoformat(),
        timestamp_caveat="PE timestamp is a header value, not independently verified compilation time.",
        characteristics=hex(pe.characteristics), dll_characteristics=hex(pe.u16(pe.optional + 70)),
        subsystem=pe.u16(pe.optional + 68), coff_symbol_count=pe.symbol_count,
        runtime_function_record_count=len(pe.functions()),
        sections=sections, debug=pe.debug(), imports=pe.imports(),
        game_source_paths=[dict(path=name, occurrences=len(occurrences),
                                first_file_offset=hex(occurrences[0]),
                                first_virtual_address=hex(pe.offset_va(occurrences[0]) or 0),
                                rip_relative_lea_candidates=references[name][:8],
                                candidate_count=len(references[name]),
                                rust_source_location_candidates=locations[name]) for name, occurrences in sorted(paths.items())],
        game_rust_type_and_system_names=modules,
        selected_string_leads=snippets,
        embedded_addon_api=embedded_addon_api(pe, args.output.parent / "official-addon-api.lua"),
        selected_direct_call_byte_candidates=direct_call_candidates(pe, {
            0x1454BEA70: "guardian_scalar_0",
            0x1454BEE60: "guardian_scalar_1",
        }),
    )
    args.output.write_text(json.dumps(evidence, indent=2, ensure_ascii=False) + "\n")
    if args.capture_guardian_assembly:
        capture_native_assembly(pe, args.binary, args.output.parent, "guardian")
    if args.capture_boss_assembly:
        capture_native_assembly(pe, args.binary, args.output.parent, "boss")
    if args.capture_combat_assembly:
        capture_native_assembly(pe, args.binary, args.output.parent, "combat")
    if args.capture_ability_assembly:
        capture_native_assembly(pe, args.binary, args.output.parent, "ability")
    if args.capture_menu_assembly:
        capture_native_assembly(pe, args.binary, args.output.parent, "menu")
    print(json.dumps(dict(output=str(args.output.relative_to(ROOT)), sha256=evidence["sha256"],
                          game_source_paths=len(paths), game_rust_names=len(modules),
                          runtime_function_records=evidence["runtime_function_record_count"],
                          source_reference_candidates=sum(len(value) for value in references.values()),
                          rust_source_location_candidates=sum(len(value) for value in locations.values())), indent=2))


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Verify AS GlueStrings contracts, native escaping and emitted Lua; no build.

The native probe executes only the 174-byte escaping wrapper with explicit
replacement/allocation/free seams. Generated-Lua fixtures exercise recovered
data and formatting, not compiled Rust or a live core loader.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
WORK = ROOT / "runtime/analysis/history/findings/q41-data-contracts/27d2ef7f9d9d"
KEEP = ROOT / "docs/analysis/evidence/0.115.0/q41-glue-strings.json"
TEMPLATE = "{blurb} Starts with {spell}; every level offers three of its spells. {hp} health."
QUERIES = [
    ("glue-strings", 0x14585a400, 0x14585a51b, "core-file read/transform/publication"),
    ("glue-transform", 0x145859140, 0x145859f25, "complete AS constructor"),
    ("glue-race-lines", 0x145808540, 0x145808769, "ASCII-lowercase race-key producer"),
    ("glue-race-localize", 0x14584e9d0, 0x14584ebe7, "single-character/two-byte replacement helper"),
    ("glue-quote", 0x145858680, 0x14585872e, "three-pass Lua-value escaping"),
    ("glue-update", 0x145815e90, 0x145815fde, "locale/profile preparation before client creation"),
    ("glue-race-lookup", 0x1459d5a90, 0x1459d5b5a, "race-line iterator allocation/collection"),
    ("glue-race-collect", 0x1459de220, 0x1459de3fc, "race.lineN key, prefix removal and localized/fallback line"),
    ("glue-strip", 0x14583b470, 0x14583b621, "trimmed ABILITY_INFO_ line removal"),
]
QUERY_LABELS = [
    "AS-GlueStrings-patch-input-consumer", "AS-GlueStrings-transform-schema",
    "AS-race-description-lines", "AS-race-line-localization", "AS-Lua-quoted-value-escaping",
    "AS-glue-patch-update-lifetime", "AS-race-line-locale-producer",
    "AS-race-line-map-collection", "AS-generated-glue-block-replacement",
]


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": digest(path.read_bytes())}


def quote(value):
    return value.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")


def native_escaping(raw):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    cases = ["", "plain", '"', "\\", "\n", '\\"\n', "é🙂", "a" * 17,
             "line\nnext", 'slashes\\\\and"quotes"', "\r\t\0", "{spell}{hp}"]
    records = []
    for value in cases:
        uc = Uc(UC_ARCH_X86, UC_MODE_64)
        uc.mem_map(0x145858000, 0x1000)
        uc.mem_write(0x145858680, raw)
        for address in [0x14584e000, 0x140002000, 0x50000000]:
            uc.mem_map(address, 0x1000)
        for address in [0x30000000, 0x70000000]:
            uc.mem_map(address, 0x10000)
        cursor = 0x30000000

        def alloc(contents):
            nonlocal cursor
            address = cursor
            cursor += max(16, (len(contents) + 15) & ~15)
            if contents:
                uc.mem_write(address, contents)
            return address

        def get(address, count):
            return bytes(uc.mem_read(address, count))

        calls = []

        def hook(machine, address, size, unused):
            if address == 0x50000000:
                machine.emu_stop()
                return
            if address not in [0x14584e9d0, 0x1400021d0]:
                return
            rsp = machine.reg_read(reg.UC_X86_REG_RSP)
            if address == 0x14584e9d0:
                output = machine.reg_read(reg.UC_X86_REG_RCX)
                pointer = machine.reg_read(reg.UC_X86_REG_RDX)
                length = machine.reg_read(reg.UC_X86_REG_R8)
                needle = machine.reg_read(reg.UC_X86_REG_R9) & 255
                replacement = get(rsp + 0x28, 2)
                result = get(pointer, length).replace(bytes([needle]), replacement)
                calls.append([needle, replacement.hex()])
                machine.mem_write(output, struct.pack("<QQQ", len(result), alloc(result), len(result)))
            destination = struct.unpack("<Q", get(rsp, 8))[0]
            machine.reg_write(reg.UC_X86_REG_RSP, rsp + 8)
            machine.reg_write(reg.UC_X86_REG_RIP, destination)

        uc.hook_add(UC_HOOK_CODE, hook)
        encoded = value.encode()
        pointer, output = alloc(encoded), alloc(bytes(24))
        stack = 0x7000fff8
        uc.mem_write(stack, struct.pack("<Q", 0x50000000))
        for register, number in [(reg.UC_X86_REG_RSP, stack), (reg.UC_X86_REG_RCX, output),
                                 (reg.UC_X86_REG_RDX, pointer), (reg.UC_X86_REG_R8, len(encoded))]:
            uc.reg_write(register, number)
        uc.emu_start(0x145858680, 0, count=200)
        assert uc.reg_read(reg.UC_X86_REG_RIP) == 0x50000000
        _, pointer, length = struct.unpack("<QQQ", get(output, 24))
        result = get(pointer, length).decode()
        assert result == quote(value)
        assert calls == [[92, "5c5c"], [34, "5c22"], [10, "5c6e"]]
        records.append({"input": value, "output": result, "calls": calls})
    return records


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--prepare-rea", action="store_true")
    options = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA and target["version"] == "0.115.0"
    image = target_bytes(target)
    pe = load_script("q41_glue_strings_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(start, length):
        at = pe.rva_offset(start - pe.image_base)
        return image[at:at + length]

    def pair(at):
        pointer, length = struct.unpack("<QQ", raw(at, 16))
        return raw(pointer, length).decode()

    if options.prepare_rea:
        for (name, start, end, _), label in zip(QUERIES, QUERY_LABELS):
            directory = WORK / name
            directory.mkdir(parents=True, exist_ok=True)
            relative = directory.relative_to(ROOT)
            plan = {"target": str(relative / "owner.bin"), "output": str(relative / "rea"),
                    "init_timeout": 60, "timeout": 180,
                    "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                    "environment": {"REA_GHIDRA_SEED_FILE": str(relative / "seeds.tsv")},
                    "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(start)}, "label": label}]}
            for filename, contents in [("owner.bin", raw(start, end - start)),
                    ("seeds.tsv", f"{start:#x}\tfunction\n{start:#x}\tcode\n".encode()),
                    ("plan.json", (json.dumps(plan, indent=2) + "\n").encode())]:
                path = directory / filename
                if path.exists():
                    assert path.read_bytes() == contents, f"Changed native query input: {path}"
                else:
                    path.write_bytes(contents)
            print(f"./scripts/rea query {relative / 'plan.json'}")
        return

    queries = []
    for name, start, end, role in QUERIES:
        directory = WORK / name
        owner = raw(start, end - start)
        assert (directory / "owner.bin").read_bytes() == owner
        journal_path = directory / "rea/journal.json"
        journal = json.loads(journal_path.read_text())
        assert journal["status"] == "completed"
        assert journal["identity"]["target"]["sha256"] == digest(owner)
        operation = next(row for row in journal["operations"].values()
                         if row["arguments"] == {"procedure": hex(start)})
        assert operation["status"] == "completed"
        result_path = ROOT / operation["result"]["path"]
        assert digest(result_path.read_bytes()) == operation["result"]["sha256"]
        evidence = json.loads(result_path.read_text())["structuredContent"]
        assert evidence["subject"]["digest"]["sha256"] == digest(owner)
        queries.append({"role": role, "start": hex(start), "end_exclusive": hex(end),
                        "sha256": digest(owner), "evidence_id": evidence["evidence_id"],
                        "profile": evidence["analysis_profile"]["digest"],
                        "plan": receipt(directory / "plan.json"), "journal": receipt(journal_path),
                        "result": receipt(result_path)})
    assembly_path = ROOT / "docs/analysis/evidence/0.115.0/q41-glue-strings.asm"
    observed = {start: bytearray() for _, start, _, _ in QUERIES}
    for line in assembly_path.read_text().splitlines():
        if line.startswith("#"):
            continue
        address, encoded, _ = line.split(" ", 2)
        address, value = int(address, 16), bytes.fromhex(encoded)
        matching = [(start, end) for _, start, end, _ in QUERIES if start <= address < end]
        assert len(matching) == 1
        start, end = matching[0]
        assert address == start + len(observed[start]) and address + len(value) <= end
        assert raw(address, len(value)) == value
        observed[start].extend(value)
    assert all(bytes(observed[start]) == raw(start, end - start) for _, start, end, _ in QUERIES)
    menu_path = ROOT / "crates/azeroth-survivors-re/assets/menu.json"
    menu = json.loads(menu_path.read_text())
    races = []
    for index, source in enumerate(menu["races"]):
        address = 0x146cc1ec8 + index * 0x58
        name, uppercase = pair(address), pair(address + 0x10)
        pointer, length = struct.unpack("<QQ", raw(address + 0x40, 16))
        lines = [pair(pointer + i * 16) for i in range(length)]
        assert name == source["name"] and uppercase.lower() == source["key"]
        assert [line.split("- ", 1)[-1] for line in lines] == source["blurb"].split("\n")
        races.append({"record": hex(address), "key": source["key"], "uppercase": uppercase,
                      "lines": lines, "sha256": digest(raw(address, 0x58))})
    abilities = {pair(0x146cc4580 + i * 0x78): pair(0x146cc4590 + i * 0x78) for i in range(113)}
    classes = []
    for index, source in enumerate(menu["classes"]):
        address = 0x146cc3058 + index * 0x90
        key, name, ability, blurb = [pair(address + offset) for offset in [0x10, 0x20, 0x40, 0x70]]
        health = struct.unpack("<f", raw(address + 0x80, 4))[0]
        tag = raw(address + 0x8c, 1)[0]
        if 1 <= tag <= 9:
            delta = struct.unpack("<i", raw(0x14702bd68 + (tag - 1) * 4, 4))[0]
            length = struct.unpack("<Q", raw(0x14702bd90 + (tag - 1) * 8, 8))[0]
            uppercase = raw(0x14702bd68 + delta, length).decode()
        else:
            uppercase = raw(0x14700d15a, 5).decode()
        assert [key, name, ability, blurb, health] == [source["key"], source["name"],
            source["starting_spell_key"], source["blurb"], source["base_health"]]
        assert uppercase == key.upper() and health == int(health)
        assert abilities[ability] == source["starting_spell"]
        classes.append({"record": hex(address), "key": key, "uppercase": uppercase, "blurb": blurb,
                        "ability": ability, "ability_name": abilities[ability], "health": health,
                        "sha256": digest(raw(address, 0x90))})
    globals_ = [(pair(0x14700d208 + i * 32), pair(0x14700d218 + i * 32)) for i in range(5)]
    assert globals_ == [("SERVER_SELECTION", "Choose a Zone"), ("REALM_NAME", "Zone"),
                       ("CHANGE_REALM", "Change Zone"), ("REALM_LIST_IN_PROGRESS", "Gathering the zones"),
                       ("REALM_LIST_SUCCESS", "Zones found")]
    assert raw(0x14700d074, 22) == b"\n-- Azeroth Survivors\n"
    assert raw(0x14700cb50, 13) == b"ABILITY_INFO_"
    assert raw(0x14700d0a7, 81).decode() == TEMPLATE
    escapes = native_escaping(raw(0x145858680, 174))

    mpq_reader = ROOT / "scripts/check-minimap-lifecycle.py"
    mpq = load_script("q41_glue_strings_mpq", mpq_reader)
    member_name = r"Interface\GlueXML\GlueStrings.lua"
    members = []
    for archive_record in target["runtime_data"]["archives"]:
        archive = mpq.Archive(archive_record["path"])
        entry = archive.lookup(member_name)
        if entry is not None:
            assert file_sha256(archive.path) == archive_record["sha256"]
            members.append((archive_record, archive.read(entry)))
    assert len(members) == 1, "Current supplied member should have one exact source"
    archive_record, member = members[0]
    original_core = member.decode("utf-8")
    stock_keys = re.findall(r"^\s*(ABILITY_INFO_[A-Z0-9_]+)\s*=", original_core, re.MULTILINE)
    assert len(stock_keys) == 32
    core_input = {"archive": archive_record, "member": member_name, "bytes": len(member),
                  "sha256": digest(member), "valid_utf8": True, "stock_racial_rows": len(stock_keys),
                  "reader": receipt(mpq_reader)}

    fixture_dir = WORK / "lua-fixtures"
    fixture_dir.mkdir(parents=True, exist_ok=True)
    english_path = ROOT / "crates/azeroth-survivors-re/assets/locales/en.json"
    english = json.loads(english_path.read_text())
    locale_receipts, fixture_records = [], []
    for locale_path in sorted((ROOT / "crates/azeroth-survivors-re/assets/locales").glob("*.json")):
        labels = {**english, **json.loads(locale_path.read_text())}
        expected = {}
        for race in races:
            for index, fallback in enumerate(race["lines"], 1):
                fallback = fallback.split("- ", 1)[-1]
                value = labels.get(f"race.{race['key']}.line{index}", fallback)
                expected[f"ABILITY_INFO_{race['uppercase']}{index}"] = "- " + value
        for cls in classes:
            value = labels.get(TEMPLATE, TEMPLATE)
            for token, replacement in [("blurb", labels.get(f"class.{cls['key']}.blurb", cls["blurb"])),
                    ("spell", labels.get(f"ability.{cls['ability']}.name", cls["ability_name"])),
                    ("hp", str(int(cls["health"])) )]:
                value = value.replace("{" + token + "}", replacement)
            expected[f"CLASS_{cls['uppercase']}"] = "        " + value
        expected.update({name: labels.get(key, key) for name, key in globals_})
        source = "\n-- Azeroth Survivors\n" + "".join(f'{name} = "{quote(value)}";\n' for name, value in expected.items())
        # Execute the actual supplied core file after the native line filter.
        # Preserve a separate sentinel to check unrelated source survival.
        original = "KEEP=17;\r\n" + original_core
        retained = "".join(line.rstrip("\r") + "\n" for line in original.split("\n")[:-1]
                           if not line.strip().startswith("ABILITY_INFO_"))
        assertions = "".join(f'assert({name} == "{quote(value)}");\n' for name, value in expected.items())
        removed = sorted(set(stock_keys) - expected.keys())
        assert len(removed) == 10
        script = retained + source + assertions + "assert(KEEP==17 and " + " and ".join(
            key + "==nil" for key in removed) + ");\n"
        fixture_path = fixture_dir / f"{locale_path.stem}.lua"
        fixture_path.write_text(script)
        subprocess.run(["lua", str(fixture_path)], cwd=ROOT, check=True, capture_output=True, text=True)
        locale_receipts.append(receipt(locale_path))
        fixture_records.append({"code": locale_path.stem, "assignments": len(expected),
                                "assertions": len(expected) + 1, "source_sha256": digest(script.encode())})

    source_paths = [
        "crates/azeroth-survivors-re/src/gameplay/client/glue_strings.rs",
        "crates/azeroth-survivors-re/src/gameplay/client.rs",
        "crates/azeroth-survivors-re/src/gameplay/client/coop_feed.rs",
        "crates/benilla-app/src/local_client/extension.rs",
        "crates/benilla-app/src/local_client.rs",
        "crates/benilla-app/src/ui_script/addons.rs",
        "crates/benilla-app/src/ui_script/glue.rs",
        "crates/benilla-app/src/ui_script/lifecycle.rs",
        "crates/benilla-app/src/ui_script/mod.rs",
        "crates/azeroth-survivors-re/src/main.rs",
    ]
    sources = [(ROOT / path).read_text() for path in source_paths]
    as_source, bridge, guest, extension, exports, loader, glue, lifecycle, ui, main = sources
    quote_body = as_source.split("fn quoted(", 1)[1].split("\nfn source(", 1)[0]
    quote_steps = [r".replace('\\',", ".replace('\"',", r".replace('\n',"]
    checks = {
        "exact native row families, formatting and line filter": all(token in as_source for token in [
            '"ABILITY_INFO_"', '"race.{}.line{ordinal}"', '"CLASS_{}', 'CLASS_TEMPLATE',
            '"SERVER_SELECTION"', 'line.trim().starts_with', 'String::from_utf8_lossy',
            'class.base_health.to_string()', 'crate::localization::format'])
            and 'original.lines()' in ''.join(as_source.split()),
        "source uses the native escaping order for all three output families":
            quote_body.count('.replace(') == 3
            and all(step in quote_body for step in quote_steps)
            and [quote_body.index(step) for step in quote_steps] == sorted(quote_body.index(step) for step in quote_steps)
            and 'quoted(line)' in as_source and 'quoted(&description)' in as_source
            and 'quoted(locale.label(label))' in as_source,
        "initial current catalog payload registered before Startup":
            'app.init_resource::<crate::localization::Localization>()' in bridge
            and bridge.index('glue_strings::configure(') < bridge.index('app.insert_resource(extension)')
            and main.index('localization::LocalizationPlugin') < main.index('gameplay::GameplayPlugin'),
        "both host and guest locale generations refresh future core transforms":
            'glue_strings::configure(&mut extension, &locale)' in bridge
            and 'super::glue_strings::configure(extension, locale)' in guest
            and 'add_systems(First, sync_to_client' in bridge,
        "resource owns cloneable payload and capture-free callback":
            'pub apply: fn(&[u8], &str) -> Vec<u8>' in extension
            and '#[derive(Resource, Clone, Default)]' in extension
            and 'LocalCoreScriptTransform' in exports,
        "read failure precedes transformation and ordinary named chunk load":
            loader.index('let mut bytes = self.read(req)?') < loader.index('for transform in transforms')
            and 'bytes = (transform.apply)(&bytes, &transform.payload)' in loader
            and 'let Some(bytes) = provider(&path)' in loader and '&path, &provider' in loader,
        "glue installs transformations before its first core load":
            lifecycle.index('extension.glue_transforms.clone()') < lifecycle.index('load_glue_with_transforms(&mut script, &transforms)')
            and 'glue.load_files_into_with_transforms(' in glue
            and glue.index('glue.load_files_into_with_transforms(') < glue.index('script.fire_event("FRAMES_LOADED"'),
        "replacement glue loads and pre-update ordering retain first-stage refresh":
            'PreUpdate,' in ui and 'glue::run_pending_glue_rebuild' in ui
            and 'install_glue_side_vm(world, screen.key())' in lifecycle,
    }
    assert all(checks.values()), [key for key, value in checks.items() if not value]
    proof = {
        "schema_version": 1, "target": {"version": "0.115.0", "sha256": SHA},
        "gap_ids": [41, 107], "lead_ids": ["Q41-B02", "Q41-I01:resource_path:208"],
        "generator": receipt(Path(__file__).resolve()), "queries": queries,
        "assembly": receipt(assembly_path),
        "data": {"races": races, "classes": classes, "realm_globals": [list(row) for row in globals_], "menu": receipt(menu_path),
                 "race_rows": sum(len(row["lines"]) for row in races), "class_rows": len(classes),
                 "prefix": "ABILITY_INFO_", "header": "\n-- Azeroth Survivors\n", "class_template": TEMPLATE},
        "native_escaping_cases": escapes, "core_input": core_input,
        "locales": locale_receipts, "lua_fixtures": fixture_records,
        "source_files": [receipt(ROOT / path) for path in source_paths], "source_checks": checks,
        "limits": [
            "Nine bounded raw-function Ghidra queries omit external tables/callees; current image bytes and complete selected data tables bind the recovered inputs. The escaping wrapper has a raw-import no-return warning at external free; exact original assembly and bounded native replay govern those return paths.",
            "Twelve escaping probes execute only original wrapper instructions with replacement/allocation/free seams; Lua fixture generation is an independent recovered-contract model, not Rust execution.",
            "Fourteen emitted-Lua fixtures verify current locale data/format and removed stock rows; filesystem mutation, actual ECS/VM/core-provider lifecycles, live locale switching and presentation do not execute.",
            "The actual selected core member is verified UTF-8. Malformed/non-UTF-8 replacement core inputs and their wider native conversion behavior are outside the selected proof.",
            "No compilation, authored Rust-test execution, application/game/network execution, rendering or original/rebuilt parity.",
        ],
    }
    if options.write:
        KEEP.write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert portable_record(json.loads(KEEP.read_text())) == portable_record(proof), "Curated GlueStrings proof differs"
    print(f"PASS: nine journaled native owners, {proof['data']['race_rows']} race/9 class/5 realm rows, "
          f"12 bounded native escaping cases and {sum(row['assertions'] for row in fixture_records)} Lua assertions across14locales; compilation/runtime/parity unverified")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Record the current cooperative locale delta without modifying source catalogs.

The descriptor/payload review is the authority for native byte ranges. This
companion preserves only missing key/value pairs, feature-family membership and
actual source-consumer receipts, never duplicate complete catalog payloads.
It runs no native query, compilation, emulation, application or server.
"""

from runtime_layout import retained_runtime_path
import argparse
from collections import Counter
import hashlib
import json

from coverage_common import ROOT, file_sha256, latest_target, load_json, project_bytes, target_bytes
from script_sources import load_script


def receipt(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def derive():
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    review_path = ROOT / "docs/analysis/evidence/locale-catalog-review.json"
    if not review_path.is_file():
        review_path = review_path.parent / target["version"] / review_path.name
    review = load_json(review_path)
    catalog = load_script("coop_locale_catalog_review", ROOT / "scripts/review-current-locale-catalogs.py")
    catalog.verify_review(catalog.derive(), review)
    if review["target"] != target:
        raise ValueError("Descriptor/source catalog review is missing or stale")
    image = target_bytes(selected)
    natives, sources = {}, {}
    for row in review["locales"]:
        payload = row["payload"]
        start = int(payload["file_offset"], 16)
        raw = image[start:start + payload["byte_count"]]
        if hashlib.sha256(raw).hexdigest() != payload["sha256"]:
            raise ValueError("Descriptor-bounded payload changed")
        natives[row["code"]] = json.loads(raw)
        sources[row["code"]] = json.loads((ROOT / row["source"]["path"]).read_bytes())
    non_english = [code for code in natives if code != "en"]
    missing_sets = [set(natives[code]) - set(sources[code]) for code in non_english]
    if not missing_sets or any(keys != missing_sets[0] for keys in missing_sets):
        raise ValueError("Non-English additions do not share one finite key population")
    added_keys = missing_sets[0]
    if any(set(catalog) != set(natives["en"]) for catalog in natives.values()):
        raise ValueError("Current native languages do not share the English key set")

    achievements_path = ROOT / "crates/azeroth-survivors-re/assets/coop-achievements-0.117.0.json"
    achievements = json.loads(achievements_path.read_text())["achievements"]
    names = {row["name"] for row in achievements}
    companions = {"Ancient Protector", "Mini Herod", "Mini Nefarian", "Mr. Bigglesworth"}
    switch = {"White Devilsaur", "Off", "On", "Off · no talent point", "On · no talent point",
              "Turn off", "Turn on", "Requires the achievement {name}"}
    family = {}
    for key in added_keys:
        if key in names:
            family[key] = "achievement_name"
        elif key.startswith(("Complete ", "Defeat ")):
            family[key] = "achievement_description"
        elif key.startswith("cosmetic."):
            family[key] = "cosmetic_name"
        elif key == "tabard.90025":
            family[key] = "tabard_name"
        elif key in companions:
            family[key] = "companion_name"
        elif key == "United Front":
            family[key] = "perk_name"
        elif key in switch or key.startswith("A White Devilsaur fights at your side"):
            family[key] = "hunter_switch_name_prose_or_control"
        else:
            family[key] = "unassigned_native_consumer_pending"
    expected_families = dict(achievement_name=14, achievement_description=14,
                             cosmetic_name=7, tabard_name=1, companion_name=4,
                             perk_name=1, hunter_switch_name_prose_or_control=9)
    if dict(Counter(family.values())) != expected_families:
        raise ValueError("Cooperative feature population changed; review the new keys")

    inputs = [receipt(ROOT / "scripts/review-coop-locale-additions.py"), receipt(review_path),
              receipt(achievements_path)]
    for path in ("localization.rs", "localization/catalogs.rs", "catalog.rs", "progression.rs",
                 "progression/rewards.rs", "armory.rs", "talents.rs", "gameplay/client/inventory.rs"):
        inputs.append(receipt(ROOT / "crates/azeroth-survivors-re/src" / path))
    rows = []
    for code, catalog in natives.items():
        source = sources[code]
        missing = sorted(set(catalog) - set(source))
        rows.append(dict(code=code, native_keys=len(catalog), source_keys=len(source),
                         missing_source_key_values=[dict(key=key, value=catalog[key],
                             label_family=family.get(key, "revised_achievement_description")) for key in missing],
                         source_only_key_values=[dict(key=key, value=source[key])
                             for key in sorted(set(source) - set(catalog))],
                         changed_existing_values=[key for key in sorted(set(source) & set(catalog))
                             if source[key] != catalog[key]],
                         added_values_equal_English=sum(catalog[key] == natives["en"][key]
                             for key in added_keys),
                         added_keys_with_value_equal_English=[key for key in sorted(added_keys)
                             if catalog[key] == natives["en"][key]],
                         all_added_values_nonempty=all(catalog[key] for key in added_keys)))
    stale_descriptions = [dict(key=row["key"], name=row["name"], source_description=row["description"])
                          for row in achievements if row["description"] not in natives["en"]]
    id_key_names = {value: key for key, value in natives["en"].items()
                    if key.startswith(("cosmetic.", "tabard.")) and key in added_keys}
    unlocks = []
    for entry in achievements:
        for unlock in entry["unlocks"]:
            name = unlock["name"]
            if name not in id_key_names:
                continue
            key = id_key_names[name]
            unlocks.append(dict(achievement_key=entry["key"], source_unlock_name=name,
                native_translation_key=key,
                literal_name_key_present_in_native_catalogs=[code for code, catalog in natives.items()
                    if name in catalog],
                non_English_value_selector=f"languages[code!=en].missing_source_key_values[key={key}]"))
    return dict(schema_version=1, target=target, inputs=inputs,
                descriptor_review=receipt(review_path),
                native_key_population_equal_across_languages=True,
                cooperative_keys=[dict(key=key, label_family=family[key]) for key in sorted(added_keys)],
                family_counts=expected_families, languages=rows,
                stale_source_achievement_description_keys=stale_descriptions,
                source_unlock_literal_vs_native_ID_key_leads=unlocks,
                counts=dict(catalogs=len(rows), cooperative_keys_per_catalog=len(added_keys),
                            cooperative_native_values=len(added_keys) * len(rows),
                            non_English_missing_values=sum(len(row["missing_source_key_values"])
                                for row in rows if row["code"] != "en"),
                            English_missing_keys=len(rows[0]["missing_source_key_values"]),
                            stale_source_achievement_description_keys=len(stale_descriptions)),
                limits=["Family assignment classifies text labels only, not native predicates, widgets or reward consumers.",
                        "Nonempty translated payloads do not prove linguistic quality, glyph/layout coverage or original/rebuilt parity.",
                        "Source lookup/fallback and feature consumers were inspected, not executed; native loader/index/parser/fallback proof remains open.",
                        "The source achievement descriptors retain 0.117.0 provenance; keys absent from current native catalogs are recovery/reconstruction leads.",
                        "No source catalog or gameplay repair, compilation, native emulation, application/server run or original/rebuilt comparison occurred."])


def check_consumers():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    selected = latest_target(verify=True)
    path = ROOT / "docs/analysis/evidence/localization-consumers/contracts.json"
    if not path.is_file():
        path = path.parent.parent / selected["version"] / "localization-consumers/contracts.json"
    proof = load_json(path)
    if proof["target"] != {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}:
        raise ValueError("Native consumer proof belongs to another target")
    image = target_bytes(selected)
    pe = load_script("coop_locale_consumer_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_spans"] + proof["data_spans"]:
        address = int(row["va"], 16)
        start = pe.rva_offset(address - pe.image_base)
        if start != int(row["file_offset"], 16):
            raise ValueError("Native consumer raw mapping changed")
        raw = image[start:start + row["byte_count"]]
        if hashlib.sha256(raw).hexdigest() != row["sha256"]:
            raise ValueError("Native consumer bytes changed")
        if "assembly" in row:
            parsed = list(md.disasm(raw, address))
            if sum(len(item.bytes) for item in parsed) != len(raw):
                raise ValueError("Native consumer does not decode completely")
            asm = "\n".join(f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip()
                            for item in parsed) + "\n"
            source = ROOT / row["assembly"]["path"]
            if project_bytes(source).decode() != asm or file_sha256(source) != row["assembly"]["sha256"]:
                raise ValueError("Native consumer independent assembly changed")
        elif raw.hex() != row["bytes"]:
            raise ValueError("Native format record changed")
    for row in proof["source_inputs"]:
        if file_sha256(retained_runtime_path(ROOT / row["path"], ROOT)) != row["sha256"]:
            raise ValueError("Native consumer source/input receipt changed")
    for row in proof["query_receipts"]:
        for key in ("plan", "journal", "result"):
            if key in row and file_sha256(ROOT / row[key]["path"]) != row[key]["sha256"]:
                raise ValueError("Native query receipt changed")
    for row in proof["direct_call_edges"]:
        start = pe.rva_offset(int(row["va"], 16) - pe.image_base)
        if image[start:start + 5].hex() != row["bytes"]:
            raise ValueError("Native call edge changed")
    return dict(target=proof["target"], verified_native_spans=len(proof["native_spans"]),
                verified_native_bytes=sum(row["byte_count"] for row in proof["native_spans"]),
                verified_data_spans=len(proof["data_spans"]),
                completed_queries=sum(row["status"] == "completed" for row in proof["query_receipts"]))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check-consumers", action="store_true",
                      help="Independently decode the selected native name interfaces with existing Capstone")
    args = parser.parse_args()
    if args.check_consumers:
        print(json.dumps(check_consumers(), indent=2))
        return
    proof = derive()
    path = ROOT / "docs/analysis/evidence/coop-locale-additions.json"
    raw = (json.dumps(proof, ensure_ascii=False, indent=2) + "\n").encode()
    if args.write:
        path.write_bytes(raw)
    elif not path.is_file() or path.read_bytes() != raw:
        raise ValueError("Cooperative locale review missing/stale; run --write")
    print(json.dumps(dict(target=proof["target"], counts=proof["counts"], written=args.write), indent=2))


if __name__ == "__main__":
    main()

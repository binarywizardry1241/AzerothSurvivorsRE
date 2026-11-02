#!/usr/bin/env python3
"""Review selected locale payloads/descriptors against source without copying them.

Reuse the retained locale format: flat UTF-8 JSON and seven-u64 records. Locate
both independently in current bytes; no historical target, RVA or key-count
assumption. --write changes only compact audit evidence, never source catalogs.
No native queries, emulation, compilation, application or server execution.
"""

import argparse
from collections import Counter
import hashlib
import json
import re
import struct

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from script_sources import load_script


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    path = project_path(path)
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def flat_object(pairs):
    result = dict(pairs)
    if len(result) != len(pairs) or not all(isinstance(k, str) and isinstance(v, str) for k, v in pairs):
        raise ValueError("Expected flat string catalog without duplicate keys")
    return result


def derive():
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(selected)
    pe = load_script("review_locale_PE_format", ROOT / "scripts/inventory-executable.py").PE(image)
    source_path = ROOT / "crates/azeroth-survivors-re/src/localization.rs"
    source = source_path.read_text()
    array = source.split("pub const LANGUAGES:", 1)[1].split("];", 1)[0]
    languages = re.findall(r'\("([^\"]+)", "([^\"]+)"\)', array)
    includes = re.findall(r'include_str!\("../assets/locales/([a-z]{2})\.json"\)', source)
    if not languages or includes != [code for code, _ in languages]:
        raise ValueError("Source language membership/order is ambiguous")
    allowed = dict(languages)
    inputs = [receipt(path) for path in (
        "scripts/review-current-locale-catalogs.py", "scripts/inventory-executable.py",
        "scripts/coverage_common.py", "scripts/script_sources.py",
        "crates/azeroth-survivors-re/src/localization.rs",
        "crates/azeroth-survivors-re/src/localization/catalogs.rs",
        "crates/azeroth-survivors-re/src/catalog.rs", "crates/azeroth-survivors-re/src/progression.rs",
        "crates/azeroth-survivors-re/src/progression/rewards.rs", "crates/azeroth-survivors-re/src/armory.rs",
        "crates/azeroth-survivors-re/src/talents.rs")]

    def raw(address, length):
        if not 0 < length <= len(image):
            raise ValueError("Invalid locale pointer length")
        at = pe.rva_offset(address - pe.image_base)
        if pe.rva_offset(address - pe.image_base + length - 1) != at + length - 1:
            raise ValueError("Locale payload crosses a discontinuous raw mapping")
        result = image[at:at + length]
        if len(result) != length:
            raise ValueError("Truncated locale payload")
        return result

    def span(address, length):
        return dict(virtual_address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=length, sha256=digest(raw(address, length)))

    # This is the JSON-prefix discovery method retained in extract-menu-localization.py.
    # The pointer/length record separately proves the exact full payload, including
    # whitespace beyond JSONDecoder's parsed object (one final LF in this target).
    decoder = json.JSONDecoder(object_pairs_hook=flat_object)
    payloads = []
    for match in re.finditer(rb'\{\r?\n[ \t]*"game.title"[ \t]*:', image):
        at = match.start()
        text = image[at:at + 1048576].decode("utf-8", errors="replace")
        catalog, end = decoder.raw_decode(text)
        prefix = text[:end].encode()
        if image[at:at + len(prefix)] != prefix:
            raise ValueError("Locale JSON prefix is not exact UTF-8 source bytes")
        address = pe.offset_va(at)
        needle, cursor, records = struct.pack("<Q", address), 0, []
        while (position := image.find(needle, cursor)) >= 0:
            cursor = position + 1
            if position < 32 or position + 24 > len(image):
                continue
            cp, cn, np, nn, jp, jn, trailing = struct.unpack_from("<7Q", image, position - 32)
            if cn != 2 or not 1 <= nn <= 128 or not len(prefix) <= jn <= len(prefix) + 16:
                continue
            try:
                code, name = raw(cp, cn).decode(), raw(np, nn).decode()
                payload = raw(jp, jn)
            except (ValueError, UnicodeDecodeError):
                continue
            if code not in allowed or name != allowed[code] or jp != address:
                continue
            if payload[:len(prefix)] != prefix or payload[len(prefix):].strip(b" \t\r\n"):
                continue
            if json.loads(payload, object_pairs_hook=flat_object) != catalog:
                raise ValueError("Locale descriptor and parsed object disagree")
            record = dict(record=span(pe.offset_va(position - 32), 56), code=code, name=name,
                          trailing_word=trailing, payload=span(jp, jn), parsed_object_bytes=len(prefix),
                          payload_trailing_whitespace_bytes=jn - len(prefix))
            records.append((record, payload))
        if len(records) != 1:
            raise ValueError("Locale JSON has ambiguous/absent current descriptor")
        record, payload = records[0]
        payloads.append((record, payload, catalog))
    if len(payloads) != len(languages):
        raise ValueError("Discovered locale JSON population differs from source membership")
    by_code = {row[0]["code"]: row for row in payloads}
    if len(by_code) != len(languages) or set(by_code) != set(allowed):
        raise ValueError("Current locale descriptor membership is ambiguous")
    table_address = int(by_code[languages[0][0]][0]["record"]["virtual_address"], 16)
    locales, added, natives = [], {}, {}
    for index, (code, name) in enumerate(languages):
        record, payload, catalog = by_code[code]
        if int(record["record"]["virtual_address"], 16) != table_address + index * 56:
            raise ValueError("Current locale records are not contiguous in source code/name order")
        path = ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json"
        source_bytes = path.read_bytes()
        inputs.append(receipt(path))
        previous = json.loads(source_bytes, object_pairs_hook=flat_object)
        missing = sorted(catalog.keys() - previous.keys())
        removed = sorted(previous.keys() - catalog.keys())
        changed = sorted(key for key in catalog.keys() & previous.keys() if catalog[key] != previous[key])
        locales.append(dict(index=index, **record, native_keys=len(catalog), source=receipt(path),
                            source_keys=len(previous), missing_source_keys=missing, removed_native_keys=removed,
                            changed_existing_values=changed, unchanged_existing_values=len(previous.keys() & catalog.keys()) - len(changed),
                            exact_native_payload_source_bytes_equal=payload == source_bytes,
                            CRLF_to_LF_native_source_bytes_equal=payload.replace(b"\r\n", b"\n") == source_bytes,
                            parsed_native_source_key_values_equal=catalog == previous))
        added[code], natives[code] = missing, catalog
    english = natives["en"]
    family, family_kind = {}, {}
    release_path = ROOT / f"docs/analysis/evidence/{target['version']}/release-review.json"
    if release_path.is_file():
        release = json.loads(release_path.read_text())
        if release["target"]["sha256"] != target["sha256"]:
            raise ValueError("Release labels are bound to another target")
        inputs.append(receipt(release_path))
        for row in release.get("achievement_text", []):
            for field in ("name", "description"):
                key = row[field]["text"]
                family[key], family_kind[key] = 114, "achievement_" + field
        for row in release.get("cosmetics", []):
            key = f"cosmetic.{row['id']}"
            family[key], family_kind[key] = 116, "cosmetic_name"
        if release.get("tabard"):
            key = f"tabard.{release['tabard']['id']}"
            family[key], family_kind[key] = 116, "tabard_name"
        for row in release.get("companions", []):
            family[row["name"]], family_kind[row["name"]] = 117, "companion_name"
        family["United Front"], family_kind["United Front"] = 118, "perk_name"
        for key in english:
            if key in ("White Devilsaur", "Off", "On", "Off · no talent point", "On · no talent point",
                       "Turn off", "Turn on", "Requires the achievement {name}") or key.startswith("A White Devilsaur fights at your side"):
                family[key], family_kind[key] = 119, "hunter_switch_name_prose_or_control"
    delta = [dict(key=key, value=english[key], related_release_finding=family.get(key),
                  label_family=family_kind.get(key, "unassigned_native_consumer_pending")) for key in added["en"]]
    for item in inputs:
        if receipt(item["path"]) != item:
            raise ValueError("Source/input changed during locale review")
    return dict(schema_version=1, target=target, generator=inputs[0], inputs=inputs,
                finding_id=158, locale_table=span(table_address, len(languages) * 56),
                discovered_JSON_prefix_candidates=len(payloads), locales=locales, English_added_key_values=delta,
                counts=dict(native_catalogs=len(locales), native_values=sum(len(value) for value in natives.values()),
                            source_values=sum(row["source_keys"] for row in locales),
                            English_added_keys=len(delta), other_catalog_missing_source_keys=sum(len(added[code]) for code in allowed if code != "en"),
                            added_key_families=dict(sorted(Counter(row["label_family"] for row in delta).items()))),
                limits=["Native descriptors/payloads are independently located in these exact current bytes using the retained seven-u64 locale format, never historical RVAs or counts.",
                        "Trailing descriptor word remains an uninterpreted u64. Native table enumeration/index, fallback, loader/parser/filesystem and UI consumers are not recovered by this data comparison.",
                        "Flat JSON parsing, complete descriptor-bounded payload bytes and CRLF-to-LF comparison are separate evidence levels.",
                        "Release family labels group new text with reviewed feature data; they do not prove native predicate, widget or award consumers.",
                        "Source locale fallback is inspected statically; no Rust execution, compilation, native emulation, application/server run or original/rebuilt parity comparison occurred."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check-source", action="store_true",
                      help="Verify all source catalogs equal the current native payloads without replacing the historical audit")
    args = parser.parse_args()
    proof = derive()
    path = ROOT / f"docs/analysis/evidence/{proof['target']['version']}/locale-catalog-review.json"
    raw = (json.dumps(proof, ensure_ascii=False, indent=2) + "\n").encode()
    if args.check_source:
        if not all(row["exact_native_payload_source_bytes_equal"] for row in proof["locales"]):
            raise ValueError("Source catalog bytes differ from current native payloads")
    elif args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(raw)
    elif not path.is_file() or path.read_bytes() != raw:
        raise ValueError("Locale review missing/stale; run --write")
    print(json.dumps(dict(target=proof["target"], locale_table=proof["locale_table"], counts=proof["counts"],
                          source_payloads_match=all(row["exact_native_payload_source_bytes_equal"] for row in proof["locales"]),
                          written=args.write), indent=2))


if __name__ == "__main__":
    main()

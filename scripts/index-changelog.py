#!/usr/bin/env python3
"""Normalize the changelog and retain version bytes from the historical 0.91.4 EXE.

Only reads project files. Historical message claims do not become observed EXE
behavior by being indexed. Message order and exact section text are preserved.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re


ROOT = Path(__file__).resolve().parent.parent


def main():
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=inventory.project_path, default=inventory.HISTORICAL_BINARY,
                        help="historical 0.91.4 EXE; current 0.92 version evidence is recorded separately")
    args = parser.parse_args()
    print("Historical changelog comparison: preserved 0.91.4 executable", flush=True)
    source = ROOT / "changelog_2026-10-15_1.json"
    raw = source.read_bytes()
    original = json.loads(raw)
    heading = re.compile(r"(?m)^[ \t]*v?(0\.\d+\.\d+)(?:[ \t]+changelog)?[ \t]*$")
    records = []
    for index, message in enumerate(original["messages"]):
        content = message["content"]
        headers = list(heading.finditer(content))
        sections = []
        for number, match in enumerate(headers):
            end = headers[number + 1].start() if number + 1 < len(headers) else len(content)
            text = content[match.end():end].strip().lstrip("-").strip()
            claims, current = [], []
            for line in text.splitlines():
                if line.lstrip().startswith("- "):
                    if current:
                        claims.append(" ".join(current))
                    current = [line.lstrip()[2:].strip()]
                elif line.strip() and current:
                    current.append(line.strip())
            if current:
                claims.append(" ".join(current))
            sections.append(dict(version=match[1], text=text, bullet_claims=claims,
                                 claim_status="Historical supplied message; not proof of this executable's behavior."))
        records.append(dict(message_ordinal=index + 1, message_id=message["id"],
                            timestamp=message["timestamp"], edited_timestamp=message.get("edited_timestamp"),
                            versions=[section["version"] for section in sections],
                            sections=sections, unversioned_content=content if not sections else None))

    binary = args.binary
    data = binary.read_bytes()
    if hashlib.sha256(data).hexdigest() != inventory.HISTORICAL_SHA256:
        parser.error("Historical 0.91.4 comparison requires SHA-256 " + inventory.HISTORICAL_SHA256)
    pe = inventory.PE(data)
    version_hits = []
    for term in (b"0.91.4", b"0.92.0", b"No Spell Effects", b"noSpellEffects"):
        locations = []
        for hit in re.finditer(re.escape(term), data):
            start, end = hit.start(), hit.end()
            context_start, context_end = start - 48, end + 96
            context = data[context_start:context_end]
            locations.append(dict(file_offset=hex(start), virtual_address=hex(pe.offset_va(start)),
                                  matched_length=len(term), context_file_offset=hex(context_start),
                                  context_sha256=hashlib.sha256(context).hexdigest(), context_hex=context.hex(),
                                  context_printable="".join(chr(v) if 32 <= v < 127 else "." for v in context)))
        version_hits.append(dict(exact_ascii_term=term.decode(), occurrence_count=len(locations), locations=locations))
    lua_path = ROOT / "docs/analysis/evidence/official-addon-api.lua"
    lua = lua_path.read_bytes()
    lua_text = lua.decode("utf-8")
    api_functions = re.findall(r"(?m)^function ([A-Za-z_][A-Za-z_0-9]*)\(", lua_text)
    payloads = re.findall(r'arg1 == "([A-Z]+)"', lua_text)
    result = dict(
        schema_version=1,
        source=dict(path=str(source.relative_to(ROOT)), sha256=hashlib.sha256(raw).hexdigest(),
                    message_count=len(records), declared_message_count=original["messageCount"],
                    version_section_count=sum(len(record["sections"]) for record in records),
                    attribution="User-supplied historical changelog; authenticity attributed to user, no independent server retrieval."),
        method="Preserve version-heading sections, message IDs/order/timestamps and exact text; statically scan supplied EXE bytes for game version markers. No target execution.",
        executable=dict(path=inventory.CANONICAL_ARTIFACT_PATH, size_bytes=len(data), sha256=hashlib.sha256(data).hexdigest(),
                        version_marker_search=version_hits,
                        conclusion="Executable embeds game version0.91.4 in current-version/update/picker contexts.0.92.0 is absent as exact ASCII; no claim about a launched process."),
        extracted_addon_api=dict(path=str(lua_path.relative_to(ROOT)), sha256=hashlib.sha256(lua).hexdigest(),
                                 functions=api_functions, payload_prefixes=payloads,
                                 limitation="This is the extracted embedded Lua, not a runtime enumeration of all native Lua exports."),
        messages=records)
    out = ROOT / "docs/analysis/evidence/changelog-index.json"
    out.write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps(dict(output=str(out.relative_to(ROOT)), messages=len(records),
                         version_sections=result["source"]["version_section_count"],
                         exact_game_version_markers={term["exact_ascii_term"]: term["occurrence_count"] for term in version_hits},
                         extracted_api_functions=len(api_functions)), indent=2))


if __name__ == "__main__":
    main()

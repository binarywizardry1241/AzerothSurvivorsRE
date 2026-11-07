#!/usr/bin/env python3
"""Restore only the selected lobby/hosting labels from verified native catalogs.

No native query, compilation, application or service is run. Existing unrelated
translations retain their bytes. The descriptor discovery is shared with the
current locale reviewer; the compact receipt binds every selected value.
"""
import argparse
import hashlib
import json
import re

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

KEYS = (
    "Can join",
    "Difficulty: any",
    "Difficulty: {difficulty}",
    "You haven't opened {difficulty} of {zone} with this class yet.",
    "You host",
    "The party's run",
    "Change difficulty",
    "Everyone who joins needs this zone and difficulty open with their class. Change your hero or zone on the picker.",
    "hasn't opened {difficulty} here",
    "Heroes marked in red haven't opened this zone or difficulty with their class: they stay behind when you enter. Pick another, or let them change hero.",
    "Heroes marked in red haven't opened this zone or difficulty with their class: they stay behind when the host enters.",
)
EVIDENCE = ROOT / "docs/analysis/evidence/coop-lobby-locales.json"
CHAT_KEYS = ("Party chat", "Send", "{n} new", "{name} joined the party.",
             "{name} left the party.", "Waiting for players", "Until the run begins",
             "No messages yet. Say hello to your party!", "Say something... (Enter)")
CHAT_EVIDENCE = ROOT / "docs/analysis/evidence/coop-lobby-ui/locales.json"


def derive(apply=False, contract="lobby-ui"):
    target = latest_target(verify=True)
    selected = []
    if contract == "lobby-chat":
        if target["sha256"] != "3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb":
            raise ValueError("Selected lobby-chat labels belong to 0.127.0")
        keys, gaps = CHAT_KEYS, [291]
        inspect = load_script("lobby_chat_locale_review", ROOT / "scripts/recover-locale-catalogs.py").inspect_keys
        pattern = "^(?:" + "|".join(re.escape(key) for key in keys) + ")$"
        sources = sorted((ROOT / "crates/azeroth-survivors-re/assets/locales").glob("*.json"))
        assert {path.stem for path in sources} == {"en", "cs", "de", "es", "fr", "ja", "ko", "pl", "pt", "ro", "ru", "tr", "uk", "zh"}
        for path in sources:
            row = inspect(pattern, path.stem)
            assert set(row["entries"]) == set(keys), path.stem
            selected.append((dict(code=path.stem, payload=row["payload"]), path, row["entries"]))
        identity = {key: target[key] for key in ("version", "sha256", "size_bytes")}
    else:
        if target["sha256"] != "de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be":
            raise ValueError("Selected lobby-label recovery belongs to 0.123.0")
        keys, gaps = KEYS, [258, 259, 260]
        review = load_script("lobby_locale_review", ROOT / "scripts/review-current-locale-catalogs.py").derive()
        image = target_bytes(target)
        identity = review["target"]
        for row in review["locales"]:
            span = row["payload"]
            start = int(span["file_offset"], 16)
            raw = image[start:start + span["byte_count"]]
            assert hashlib.sha256(raw).hexdigest() == span["sha256"]
            selected.append((dict(code=row["code"], record=row["record"], payload=span),
                             ROOT / row["source"]["path"], json.loads(raw)))
    rows = []
    for row, path, native in selected:
        subset = {key: native[key] for key in keys}
        text = path.read_text()
        source = json.loads(text)
        for key in keys:
            if key in source and source[key] != subset[key]:
                raise ValueError(f"Existing selected translation differs: {row['code']} {key}")
        missing = {key: value for key, value in subset.items() if key not in source}
        if missing:
            if not apply:
                raise ValueError(f"Selected labels missing in {row['code']}; use --apply")
            # Append this finite key population without rewriting existing data.
            end = text.rfind("}")
            prefix = text[:end].rstrip()
            entries = json.dumps(missing, ensure_ascii=False, indent=2)[2:-2]
            path.write_text(prefix + ",\n" + entries + "\n}\n")
        rows.append(dict(**row, source=path.relative_to(ROOT).as_posix(), values=subset))
    return dict(schema_version=1, target=identity, gap_ids=gaps,
                keys=list(keys), locales=rows, target_executed=False)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--contract", choices=("lobby-ui", "lobby-chat"), default="lobby-ui")
    args = parser.parse_args()
    result = derive(args.apply, args.contract)
    evidence = CHAT_EVIDENCE if args.contract == "lobby-chat" else EVIDENCE
    if args.apply:
        evidence.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n")
    else:
        assert json.loads(evidence.read_text()) == result
    print(f"Co-op lobby labels: {len(result['keys'])} keys / {len(result['locales'])} exact native catalogs verified")


if __name__ == "__main__":
    main()

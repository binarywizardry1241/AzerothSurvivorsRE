"""Portable paths for published evidence; runtime inputs keep their real locations.

The checkout and configured installed game use relative record identifiers.
Native strings, input digests and raw journals retain their recorded values.
"""
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def _path_patterns(root):
    root = Path(root)
    replacements = [(str(root), "")]
    config = root / ".codex/reference-game.json"
    if config.is_file():
        reference = json.loads(config.read_text())
        replacements.extend((str(Path(reference[key]).expanduser()), label) for key, label in (
            ("exe", "installed-game/AzerothSurvivors.exe"),
            ("data_dir", "installed-game/Data")))
        game_root = Path(reference["exe"]).expanduser().parent
        if Path(reference["data_dir"]).expanduser().parent == game_root:
            replacements.append((str(game_root), "installed-game"))
    result = []
    for original, replacement in sorted(replacements, key=lambda row: len(row[0]), reverse=True):
        # Match a complete path prefix, including paths embedded in prose.
        pattern = re.escape(original) + r'(?=$|[/\s"\x27`:,;)\]])'
        result.append((re.compile(pattern + r'/?'), replacement))
    return result


def _portable_text(value, patterns):
    for pattern, replacement in patterns:
        value = pattern.sub(lambda match: (
            replacement + ("/" if replacement and match[0].endswith("/") else "")
            if match[0].endswith("/") else replacement or "."), value)
    return value


def portable_text(value, root=ROOT):
    return _portable_text(value, _path_patterns(root))


def portable_record(value, root=ROOT):
    """Copy a report with portable path strings, retaining all other facts."""
    patterns = _path_patterns(root)
    def convert(item):
        if isinstance(item, dict):
            return {key: convert(child) for key, child in item.items()}
        if isinstance(item, (list, tuple)):
            return type(item)(convert(child) for child in item)
        return _portable_text(item, patterns) if isinstance(item, str) else item
    return convert(value)


def portable_json(value, **options):
    return json.dumps(portable_record(value), **options)


def portable_json_text(value):
    return portable_json(value, indent=2, ensure_ascii=False) + "\n"


def objdump_output(arguments, **options):
    """Normalize objdump's input filename before callers hash/store its output."""
    output = subprocess.check_output(arguments, **options)
    if isinstance(output, bytes):
        return portable_text(output.decode("utf-8", "surrogateescape")).encode("utf-8", "surrogateescape")
    return portable_text(output)

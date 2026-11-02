"""Render complete JSON evidence rows compactly with readable metadata.

Every list item stays on one line. A dictionary of dictionary records is an
indexed table, whose values also stay on one line. Other dictionary metadata
retains ordinary indentation. No values, order or rows are changed or omitted.
"""
import hashlib
import json
from pathlib import Path

SOURCE_SHA256 = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()


def proof_text(value, level=0):
    pad = '  ' * level
    child = '  ' * (level + 1)
    if isinstance(value, dict):
        if not value:
            return '{}'
        rows = all(isinstance(item, dict) for item in value.values())
        return '{\n' + ',\n'.join(
            child + json.dumps(key, ensure_ascii=False) + ': ' +
            (json.dumps(item, ensure_ascii=False, separators=(',', ':'))
             if rows else proof_text(item, level + 1))
            for key, item in value.items()) + '\n' + pad + '}'
    if isinstance(value, list):
        if not value:
            return '[]'
        return '[\n' + ',\n'.join(
            child + json.dumps(item, ensure_ascii=False, separators=(',', ':'))
            for item in value) + '\n' + pad + ']'
    return json.dumps(value, ensure_ascii=False)

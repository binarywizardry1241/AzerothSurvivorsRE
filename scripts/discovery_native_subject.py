"""Bind discovery query subjects to a full PE or an exact declared PE slice.

This verifies static input/query provenance, never semantic applicability,
reachable-code completeness, observed execution or parity.
"""
from functools import lru_cache
import hashlib
import json
from pathlib import Path


def _digest(value):
    return hashlib.sha256(value).hexdigest()


def _json_digest(value):
    return _digest(json.dumps(value, sort_keys=True, separators=(",", ":")).encode())


def _address(value):
    if not isinstance(value, str) or not value.startswith("0x"):
        raise ValueError("Native slice needs an explicit hexadecimal address")
    return int(value, 16)


def _path(root, value):
    path = (root / value).resolve()
    if not path.is_relative_to(root):
        raise ValueError("Native query receipt escapes project")
    return path


def _receipt(root, value):
    if not isinstance(value, dict) or set(value) != {"path", "sha256"}:
        raise ValueError("Native query needs an exact file receipt")
    path = _path(root, value["path"])
    raw = path.read_bytes()
    if _digest(raw) != value["sha256"]:
        raise ValueError("Native query receipt hash differs")
    return path, raw


@lru_cache(maxsize=1)
def _current_context(version, checksum, size):
    from coverage_common import ROOT, latest_target, target_bytes
    from script_sources import load_script
    selected = latest_target(verify=True)
    if (selected["version"], selected["sha256"], selected["size_bytes"]) != (version, checksum, size):
        raise ValueError("Native slice does not name the installed selected target")
    image = target_bytes(selected)
    module = load_script("discovery_slice_pe", ROOT / "scripts/inventory-executable.py")
    return image, module.PE(image)


def verify_native_query_subject(root, native, query, target, *, image=None, pe=None):
    """Reject unbound raw subjects while preserving existing full-image admission.

    Tests may supply exact image bytes and a VA-to-file mapper. Production reads
    the configured, hash-verified installed target without copying or executing it.
    """
    root = Path(root).resolve()
    subject = native.get("subject", {})
    if subject.get("format") == "pe" and subject.get("digest", {}).get("sha256") == target["sha256"]:
        return {"kind": "whole_selected_PE", "target_sha256": target["sha256"]}
    if subject.get("format") != "raw-binary" or subject.get("architecture") != "x86_64":
        raise ValueError("Native query subject is neither the selected PE nor an explicit x86_64 raw slice")
    raw_path, raw = _receipt(root, query.get("raw_input"))
    if not raw or subject.get("digest", {}).get("sha256") != _digest(raw):
        raise ValueError("Raw native subject digest differs from its slice")
    if _path(root, subject.get("local_path", "")) != raw_path:
        raise ValueError("Raw native subject path differs")
    base = _address(query.get("slice_virtual_address"))
    procedure = _address(query.get("procedure"))
    if not base <= procedure < base + len(raw):
        raise ValueError("Native query procedure is outside its raw slice")
    if image is None or pe is None:
        image, pe = _current_context(target["version"], target["sha256"], target["size_bytes"])
    if len(image) != target["size_bytes"] or _digest(image) != target["sha256"]:
        raise ValueError("Native slice parent target bytes differ")
    offset = pe.rva_offset(base - pe.image_base)
    if (pe.rva_offset(base - pe.image_base + len(raw) - 1) != offset + len(raw) - 1
            or image[offset:offset + len(raw)] != raw):
        raise ValueError("Native raw slice bytes/base do not map to the selected PE")

    plan_path, plan_raw = _receipt(root, query.get("plan"))
    _, journal_raw = _receipt(root, query.get("journal"))
    result_path, result_raw = _receipt(root, query.get("result"))
    plan, journal, result = (json.loads(value) for value in (plan_raw, journal_raw, result_raw))
    result_native = result.get("structuredContent")
    if result_native is None:
        result_native = json.loads(result["content"][0]["text"])
    if result_native != native:
        raise ValueError("Native result receipt does not contain this query result")
    if (native.get("evidence_id") != query.get("evidence_id")
            or native.get("provider", {}).get("id") != "ghidra"
            or native.get("provider") != query.get("provider")
            or native.get("analysis_profile", {}).get("digest") != query.get("analysis_profile_digest")):
        raise ValueError("Native result identity/provider/profile differs")
    options = dict(format="raw-binary", architecture="x86_64", entry_point=query["slice_virtual_address"])
    profile = native.get("analysis_profile", {})
    parameters = profile.get("parameters", {})
    if (profile.get("provider") != native.get("provider")
            or parameters.get("target_format") != options["format"]
            or parameters.get("architecture") != options["architecture"]
            or parameters.get("entry_point") != options["entry_point"]):
        raise ValueError("Native result analysis mapping differs from its declared slice")
    identity = journal.get("identity", {})
    if (any(plan.get("open_options", {}).get(k) != v for k, v in options.items())
            or any(identity.get("open_options", {}).get(k) != v for k, v in options.items())
            or identity.get("open_options", {}).get("provider_id") != "ghidra"
            or _path(root, plan.get("target", "")) != raw_path
            or _path(root, identity.get("target", {}).get("path", "")) != raw_path
            or identity.get("target", {}).get("sha256") != _digest(raw)
            or identity.get("target", {}).get("size_bytes") != len(raw)):
        raise ValueError("Native plan/journal raw input or mapping differs")
    saved_plan = identity.get("plan", {})
    if (_path(root, saved_plan.get("plan_path", "")) != plan_path
            or saved_plan.get("plan_sha256") != _digest(plan_raw)
            or saved_plan.get("operations") != plan.get("operations")
            or journal.get("identity_sha256") != _json_digest(identity)):
        raise ValueError("Native journal does not commit to this plan")
    operation, arguments = native.get("operation"), native.get("parameters")
    if arguments != {"procedure": query["procedure"]}:
        raise ValueError("Native result procedure differs from the declared query")
    matches = [v for v in plan.get("operations", []) if v.get("name") == operation and v.get("arguments") == arguments]
    completed = [v for v in journal.get("operations", {}).values()
                 if v.get("name") == operation and v.get("arguments") == arguments
                 and v.get("status") == "completed" and v.get("result") == query["result"]]
    if len(matches) != 1 or len(completed) != 1:
        raise ValueError("Native query lacks one matching completed plan/journal operation")
    return {"kind": "exact_declared_PE_raw_slice", "target_sha256": target["sha256"],
            "raw_sha256": _digest(raw), "virtual_address": hex(base), "file_offset": hex(offset),
            "byte_count": len(raw), "result": str(result_path.relative_to(root)),
            "semantic_or_runtime_correspondence_established": False}

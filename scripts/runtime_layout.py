"""Canonical runtime owners and compatibility for retained local paths."""

import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
OWNERS = frozenset({
    "analysis", "analysis-exports", "cargo-target", "client", "coverage",
    "ghidra-queries", "github-account", "menu-state", "original-vulkan-cache",
    "tests", "tmp", "tool-state",
})
LAYOUT = Path("runtime/analysis/recovery-layout.json")
NATIVE_STAGING = Path("runtime/analysis/staging/native-evidence")
TOOL_STATE = frozenset({"browsers", "cache", "config", "cutter-bridge", "data", "run", "state"})
SPECIAL = {
    **{name: f"runtime/tool-state/{name}" for name in TOOL_STATE},
    "armory-recovery": "runtime/tool-state/python/armory",
    "camera-recovery-0.105.0": "runtime/tool-state/python/camera",
    "native-evidence": "runtime/analysis/staging/native-evidence",
    "staging": "runtime/analysis/staging/legacy",
    "benchmarks": "runtime/analysis/benchmarks/legacy",
    "verification": "runtime/tool-state/verification",
    "cargo": "runtime/tool-state/cargo",
    "rust-install.log": "runtime/tool-state/rust-install.log",
    "worktrees": "runtime/tool-state/worktrees",
    "unconfigured-hopper": "runtime/tool-state/unconfigured-hopper",
    "Azeroth Survivors RE.app": "runtime/client/Azeroth Survivors RE.app",
    "Launch-AzerothSurvivorsRE.command": "runtime/client/Launch-AzerothSurvivorsRE.command",
    "build-ship": "runtime/client/ship-evidence",
    "reference-state": "runtime/client/reference-state",
    "optimized-2026-10-21": "runtime/client/optimized",
}
STAMP = re.compile(r"(?:^|-)(?:0[.-]\d+[.-]\d+|0[.-]\d+|0\d{4}|20\d{2}(?:-\d{2}-\d{2}|\d{4}))(?=-|$)")
CATEGORIES = {
    "addon": ("addon", "banner", "timer-api", "fixgap-addon"),
    "co-op": ("coop", "revive", "forms"),
    "raid": ("raid", "ward", "boss", "guardian", "follower", "endless"),
    "target-audit": ("execheck", "update-game", "coverage", "census", "target-refresh", "refresh", "update", "changelog"),
    "findings": ("fixgap", "gap", "q41", "selected-gap", "reconcile-fixgap"),
    "interface": ("menu", "options", "picker", "card", "stock", "portrait", "reward", "terminal", "hud", "locale", "localization", "ui", "binding", "names"),
    "combat": ("demon", "warlock", "warrior", "cast", "power", "balance", "soul", "totem", "build-countdown"),
    "inventory": ("armory", "equipment", "chest", "pvp", "pickup"),
    "movement": ("camera", "input", "keyboard", "movement", "mob", "player-mover", "boundary", "caster-navigation"),
    "progression": ("achievement", "class", "talent", "save", "level-cap", "set-consumers"),
}


def layout_document(root=ROOT):
    index = root / LAYOUT
    return json.loads(index.read_text()) if index.is_file() else {}


def destination(name, is_directory):
    """Assign a loose legacy root a stable category without a versioned label."""
    if name in SPECIAL:
        return SPECIAL[name]
    leaf = Path(name)
    suffix = "" if is_directory else leaf.suffix
    label = STAMP.sub("", name.removesuffix(suffix) if suffix else name).strip("-")
    label = re.sub(r"[^a-zA-Z0-9_-]+", "-", label).strip("-").lower() or "target"
    category = next((key for key, prefixes in CATEGORIES.items() if label.startswith(prefixes)), "native-recovery")
    identifier = hashlib.sha256(name.encode()).hexdigest()[:12]
    base = f"runtime/analysis/history/{category}/{label}/{identifier}"
    return base if is_directory else f"{base}/{label}{suffix}"


def retained_runtime_path(path, root=ROOT):
    """Resolve a recorded path while preserving a pre-migration live path."""
    path = Path(path)
    runtime = root / "runtime"
    if not path.is_relative_to(runtime) or path == runtime or path.exists() or path.is_symlink():
        return path
    document = layout_document(root)
    first, *parts = path.relative_to(runtime).parts
    registered = document.get("relocations", {}).get(first)
    resolved = (root / registered).joinpath(*parts) if registered else path
    staging = root / NATIVE_STAGING
    stage_parts = resolved.relative_to(staging).parts if resolved.is_relative_to(staging) else ()
    if len(stage_parts) >= 2:
        replacement = document.get("staging_relocations", {}).get("/".join(stage_parts[:2]))
        if replacement:
            resolved = staging.joinpath(replacement, *stage_parts[2:])
    if resolved == path:
        return path
    if (not resolved.is_relative_to(runtime) or resolved == runtime
            or resolved.relative_to(runtime).parts[0] not in OWNERS
            or ".." in resolved.parts or not resolved.parent.resolve().is_relative_to(runtime.resolve())):
        raise ValueError("Historical recovery relocation leaves the shared runtime")
    return resolved


def loose_entries(root=ROOT):
    runtime = root / "runtime"
    return sorted(p for p in runtime.iterdir() if p.name not in OWNERS and p.name != ".DS_Store") if runtime.is_dir() else []


def owned_runtime_path(path, root=ROOT):
    path = retained_runtime_path(path, root)
    runtime = root / "runtime"
    if not path.is_relative_to(runtime) or path == runtime or path.relative_to(runtime).parts[0] not in OWNERS:
        raise ValueError("Use a canonical runtime owner such as runtime/analysis/tasks or runtime/tmp")
    return path

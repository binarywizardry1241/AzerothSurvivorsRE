#!/usr/bin/env python3
"""Plan or explicitly launch the installed original in an isolated tracker session."""

import argparse
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parents[2]
RUNTIME = ROOT / "runtime" / "original-vulkan-cache"
WINE = Path("/Applications/WoWSilicon.app/Contents/Resources/Wine")
LAYER = "VK_LAYER_AZS_pipeline_cache"
TARGET = "0.141.0"
TRACE_OPTIONS = {"TRACKER_START_FRAME", "TRACKER_FRAMES", "TRACKER_MAX_MIB"}
TRACE_TAGS = ("addon", "fct", "cd", "use", "move")


def windows_path(path):
    # A new Wine prefix maps Z: to the host filesystem root. Check existing prefixes before use.
    return "Z:" + str(path).replace("/", "\\")


def check_workspace(path):
    if path.resolve() != path:
        raise ValueError(f"Tracker workspace must not use a symlink: {path}")
    return path


def reference_checkout():
    config = Path(".codex/reference-game.json")
    if (ROOT / config).is_file():
        return ROOT
    common = Path(subprocess.check_output(
        ["git", "rev-parse", "--path-format=absolute", "--git-common-dir"],
        cwd=ROOT, text=True,
    ).strip()).resolve()
    if common.name != ".git" or not (common.parent / config).is_file():
        raise ValueError("No reference-game.json in this checkout or its primary checkout")
    return common.parent


def installed_game():
    # Use the owning checkout's reader, then compare to this worktree's inspected contract.
    sys.dont_write_bytecode = True
    sys.path.insert(0, str(reference_checkout() / "scripts"))
    from coverage_common import artifact_path, installed_identity

    identity = installed_identity()
    manifest = ROOT / "docs" / "analysis" / f"target-refresh-{TARGET}.json"
    target = json.loads(manifest.read_text(encoding="utf-8"))["current_target"]
    if identity["version"] != TARGET or identity["sha256"] != target["sha256"]:
        raise ValueError("Installed game does not match the tracker’s inspected target")
    data = artifact_path("installed-game/Data")
    if not data.is_dir():
        raise ValueError("The configured installed Data directory is missing")
    return artifact_path(identity["path"]), data, identity


def session_environment(session, prefix, data, wine):
    # The isolated launch carries only ordinary host settings and explicit tracker limits.
    # In particular, it cannot inherit multiplayer, updater, wire trace, or registry overrides.
    env = {
        name: value for name, value in os.environ.items()
        if name in {"HOME", "USER", "LOGNAME", "LANG", "PATH"} | TRACE_OPTIONS or name.startswith("LC_")
    }
    env.update({
        "TMPDIR": str(prefix / "host-tmp"),
        "WINEPREFIX": str(prefix),
        "WINESERVER": str(wine / "bin" / "wineserver"),
        "DYLD_LIBRARY_PATH": str(wine / "lib" / "external"),
        "VK_DRIVER_FILES": str(wine / "lib" / "vulkan" / "icd.d" / "MoltenVK_icd.json"),
        "WGPU_BACKEND": "vulkan",
        "VK_ADD_LAYER_PATH": str(RUNTIME),
        "VK_INSTANCE_LAYERS": LAYER,
        "AZS_VK_CACHE_DIR": str(RUNTIME / "cache"),
        "TRACKER": "1",
        "TRACKER_DIR": str(session),
        "BENILLA_HOME": windows_path(session / "benilla-config"),
        "WOW_DATA": windows_path(data),
        "WOW_ROGUE_SAVE": windows_path(session / "characters.txt"),
        "WOW_ROGUE_UPDATE": "0",
        "WOW_ROGUE_UPDATE_AUTO": "0",
        "WOW_MOVE_TRACE": windows_path(session / "gameplay.log"),
        "WOW_MOVE_TRACE_TAGS": ",".join(TRACE_TAGS),
        "WOW_MOVE_TRACE_CHAT": "0",
    })
    return env


def run(wine, launch):
    if os.environ.get("TRACKER") != "1":
        raise ValueError("Set TRACKER=1 to enable an isolated tracker session")

    exe, data, identity = installed_game()
    check_workspace(RUNTIME)
    prefix = check_workspace(RUNTIME / "wine-prefix")
    traces = check_workspace(RUNTIME / "cache" / "traces")
    check_workspace(prefix / "host-tmp")
    devices = check_workspace(prefix / "dosdevices")
    if devices.exists():
        z_drive = devices / "z:"
        if not z_drive.is_symlink() or z_drive.resolve() != Path("/"):
            raise ValueError("The isolated Wine prefix must map Z: to the host root")

    wine = wine.expanduser().resolve()
    executable = wine / "bin" / "wine"
    wineserver = wine / "bin" / "wineserver"
    driver = wine / "lib" / "vulkan" / "icd.d" / "MoltenVK_icd.json"
    if not (os.access(executable, os.X_OK) and os.access(wineserver, os.X_OK) and driver.is_file()):
        raise ValueError("The bundled WoWSilicon Wine runtime or MoltenVK manifest is missing")
    if not all(check_workspace(RUNTIME / name).is_file() for name in (f"{LAYER}.json", "libAzsVulkanCache.dylib")):
        raise ValueError("Build the Vulkan layer in this checkout before launching")
    if not (RUNTIME / "cache").is_dir():
        raise ValueError("The Vulkan layer cache directory is missing")

    if not launch:
        print(f"Tracker plan verified. Each launch writes gameplay.log and tracker-*.tsv under {traces}.")
        print("Use --launch to start the original with a separate Wine prefix, configuration and save.")
        return

    traces.mkdir(mode=0o700, exist_ok=True)
    for path in (prefix, prefix / "host-tmp"):
        path.mkdir(mode=0o700, exist_ok=True)
    timestamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    session = Path(tempfile.mkdtemp(prefix=f"session-{timestamp}-", dir=traces))
    env = session_environment(session, prefix, data, wine)
    manifest = session / "session.json"
    try:
        with manifest.open("x", encoding="utf-8") as file:
            json.dump({
                "original": identity,
                "data": "installed-game/Data",
                "wine_runtime": str(wine),
                "vulkan_driver": "MoltenVK",
                "gameplay_trace_tags": TRACE_TAGS,
                "tracker_options": {name: env[name] for name in sorted(TRACE_OPTIONS) if name in env},
            }, file, indent=2)
            file.write("\n")
        print(f"Private tracker session: {session}", flush=True)
        os.chdir(session)
        os.execve(executable, [str(executable), str(exe)], env)
    except OSError:
        os.chdir(ROOT)
        manifest.unlink(missing_ok=True)
        session.rmdir()
        raise


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--wine-runtime", type=Path, default=WINE)
    parser.add_argument("--launch", action="store_true", help="execute the game after validating the plan")
    args = parser.parse_args()
    try:
        run(args.wine_runtime, args.launch)
    except (OSError, ValueError) as error:
        parser.exit(1, f"{parser.prog}: {error}\n")


if __name__ == "__main__":
    main()

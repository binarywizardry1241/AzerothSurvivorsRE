#!/usr/bin/env python3
"""Install the pinned official Ghidra distribution inside this checkout.

Origin: https://github.com/NationalSecurityAgency/ghidra/releases/tag/Ghidra_12.1.4_build
The SHA-256 below is the release asset digest returned by GitHub's release API.
This script intentionally uses no system installation directory or shared cache.
"""

from __future__ import annotations

import hashlib
import argparse
import json
import os
from pathlib import Path
import platform
import shutil
import stat
import subprocess
import urllib.request
import zipfile


ROOT = Path(__file__).resolve().parents[1]
VERSION = "12.1.4"
TAG = "Ghidra_12.1.4_build"
ASSET = "ghidra_12.1.4_PUBLIC_20260921.zip"
SHA256 = "ddac49f903da9d5bac833e5cc79395098b9c33cfd3279be5f31bd00387d2d4db"
# https://services.gradle.org/distributions/gradle-9.7.1-bin.zip.sha256
GRADLE_SHA256 = "acd53f1edaf02f1a8ff99879f8a34b302661a057d9b063ae9e35b552f804d20a"
URL = f"https://github.com/NationalSecurityAgency/ghidra/releases/download/{TAG}/{ASSET}"
DEST = ROOT / ".tools" / "ghidra" / f"ghidra_{VERSION}_PUBLIC"
CACHE = ROOT / ".cache" / "downloads"


def digest(path: Path) -> str:
    checksum = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(8 * 1024 * 1024), b""):
            checksum.update(chunk)
    return checksum.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--java-home",
        type=Path,
        default=Path(os.environ.get("JAVA_HOME", "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home")),
        help="Existing full JDK 21+; no system JDK is installed or changed",
    )
    args = parser.parse_args()
    CACHE.mkdir(parents=True, exist_ok=True)
    archive = CACHE / ASSET
    if not archive.exists():
        partial = archive.with_suffix(".zip.partial")
        print(f"Downloading official Ghidra {VERSION} (~570 MB)...", flush=True)
        request = urllib.request.Request(URL, headers={"User-Agent": "AzerothSurvivorsRE-installer"})
        with urllib.request.urlopen(request) as response, partial.open("wb") as output:
            total = 0
            previous = 0
            while chunk := response.read(8 * 1024 * 1024):
                output.write(chunk)
                total += len(chunk)
                if total - previous >= 64 * 1024 * 1024:
                    print(f"  Downloaded {total / 1_000_000:.0f} MB", flush=True)
                    previous = total
        partial.replace(archive)
    actual = digest(archive)
    if actual != SHA256:
        raise SystemExit(f"SHA-256 mismatch for {archive}: expected {SHA256}, got {actual}")
    print(f"Verified SHA-256: {actual}", flush=True)

    if not (DEST / "Ghidra" / "application.properties").exists():
        staging = CACHE / f"ghidra-{VERSION}-extract"
        if staging.exists():
            shutil.rmtree(staging)
        staging.mkdir()
        print("Extracting inside project...", flush=True)
        with zipfile.ZipFile(archive) as package:
            for member in package.infolist():
                path = (staging / member.filename).resolve()
                if not path.is_relative_to(staging.resolve()):
                    raise SystemExit(f"Unsafe archive path: {member.filename}")
                if stat.S_ISLNK(member.external_attr >> 16):
                    raise SystemExit(f"Unexpected symbolic link: {member.filename}")
                package.extract(member, staging)
                mode = (member.external_attr >> 16) & 0o777
                if mode:
                    path.chmod(mode)
        extracted = staging / f"ghidra_{VERSION}_PUBLIC"
        DEST.parent.mkdir(parents=True, exist_ok=True)
        if DEST.exists():
            raise SystemExit(f"Incomplete existing installation; inspect it before replacing: {DEST}")
        extracted.rename(DEST)
        staging.rmdir()

    metadata = {
        "version": VERSION,
        "source": URL,
        "release": f"https://github.com/NationalSecurityAgency/ghidra/releases/tag/{TAG}",
        "sha256": SHA256,
    }
    (DEST.parent / "installation.json").write_text(json.dumps(metadata, indent=2) + "\n")
    print(f"Ghidra {VERSION} installed: {DEST}", flush=True)

    # Official releases require locally built native components on Apple Silicon.
    # See the release's docs/GettingStarted.md, "Building Native Components".
    native_platforms = {
        ("Darwin", "arm64"): "mac_arm_64",
        ("Darwin", "x86_64"): "mac_x86_64",
        ("Linux", "aarch64"): "linux_arm_64",
        ("Linux", "x86_64"): "linux_x86_64",
    }
    native_platform = native_platforms.get((platform.system(), platform.machine()))
    if native_platform is None:
        raise SystemExit("Unsupported host for this project-local native installation script")
    native_root = DEST / "Ghidra" / "Features" / "Decompiler"
    native_candidates = [native_root / prefix / native_platform / "decompile" for prefix in ("os", "build/os")]
    native = next((path for path in native_candidates if os.access(path, os.X_OK)), None)
    if native is None:
        if not (args.java_home / "bin" / "javac").is_file():
            raise SystemExit(f"Existing full JDK required; javac not found under {args.java_home}")
        build_cache = ROOT / ".cache" / "ghidra-build"
        for directory in ("tmp", "java-home", "gradle", "clang-modules"):
            (build_cache / directory).mkdir(parents=True, exist_ok=True)
        environment = dict(os.environ)
        environment.update({
            "JAVA_HOME": str(args.java_home.resolve()),
            "GRADLE_USER_HOME": str(build_cache / "gradle"),
            "TMPDIR": str(build_cache / "tmp"),
            "CLANG_MODULE_CACHE_PATH": str(build_cache / "clang-modules"),
            "JAVA_TOOL_OPTIONS": (
                f"-Duser.home={build_cache / 'java-home'} "
                f"-Djava.io.tmpdir={build_cache / 'tmp'} -XX:-UsePerfData"
            ),
        })
        wrapper_properties = DEST / "support" / "gradle" / "gradle-wrapper.properties"
        wrapper_text = wrapper_properties.read_text()
        if "gradle-9.7.1-bin.zip" not in wrapper_text:
            raise SystemExit("Unexpected Gradle wrapper distribution; inspect before building")
        checksum_property = f"distributionSha256Sum={GRADLE_SHA256}"
        if "distributionSha256Sum=" not in wrapper_text:
            wrapper_properties.write_text(wrapper_text.rstrip() + "\n" + checksum_property + "\n")
        elif checksum_property not in wrapper_text:
            raise SystemExit("Unexpected Gradle wrapper checksum; inspect before building")
        print(f"Building native components for {native_platform} with the official Gradle wrapper...", flush=True)
        subprocess.run(
            ["./gradlew", "--no-daemon", "--max-workers=4", "buildNatives"],
            cwd=DEST / "support" / "gradle",
            env=environment,
            check=True,
        )
        native = next((path for path in native_candidates if os.access(path, os.X_OK)), None)
        if native is None:
            raise SystemExit("Native build finished without an executable decompiler")
    print(f"Native decompiler ready: {native}", flush=True)
    subprocess.run(["file", str(native)], cwd=ROOT, check=True)


if __name__ == "__main__":
    main()

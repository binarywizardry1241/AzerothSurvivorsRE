#!/usr/bin/env python3
"""Install Rust 1.98.1 from verified official component archives inside this project.

No rustup setup, shell profile editing, user-HOME writes, or system installation.
Cargo builds use scripts/cargo, which keeps downloads, targets and caches local.
"""

import concurrent.futures
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import tarfile
import time
import tomllib
import urllib.parse
import urllib.request

ROOT = Path(__file__).resolve().parent.parent
VERSION = "1.98.1"
MANIFEST_SHA256 = "a7c8774a5fd8441c997d94c029776cbc5eb111e9d72ab5d256fa69866644347e"
COMPONENTS = ("rustc", "rust-std", "cargo", "clippy-preview", "rustfmt-preview")


def sha256(path):
    with path.open("rb") as source:
        return hashlib.file_digest(source, "sha256").hexdigest()


def download(url, destination, expected):
    if urllib.parse.urlparse(url).netloc != "static.rust-lang.org":
        raise ValueError(f"Non-official Rust download: {url}")
    if destination.is_file() and sha256(destination) == expected:
        print(f"Verified cached {destination.name}", flush=True)
        return destination
    print(f"Downloading {destination.name}", flush=True)
    partial = destination.with_suffix(destination.suffix + ".partial")
    received, last_update = 0, time.monotonic()
    with urllib.request.urlopen(url, timeout=60) as response, partial.open("wb") as output:
        while chunk := response.read(1024 * 1024):
            output.write(chunk)
            received += len(chunk)
            if time.monotonic() - last_update >= 10:
                print(f"{destination.name}: {received // 1048576} MiB", flush=True)
                last_update = time.monotonic()
    if sha256(partial) != expected:
        raise RuntimeError(f"Checksum mismatch: {partial}")
    partial.replace(destination)
    print(f"Verified {destination.name}: {received // 1048576} MiB", flush=True)
    return destination


def verify_host_tools(prefix, host, environment):
    """Complete the standalone macOS LLVM loader layout without changing binaries."""
    result = {}
    if host.endswith("-apple-darwin"):
        # rust-objcopy's LC_RPATH is @loader_path/../lib, but the standalone
        # rustc component installs shared LLVM only in the prefix's top-level lib.
        library = prefix / "lib/libLLVM.dylib"
        runtime_library = prefix / "lib/rustlib" / host / "lib/libLLVM.dylib"
        if not library.is_file():
            raise RuntimeError(f"Rust's installed LLVM library is missing: {library}")
        if runtime_library.exists() or runtime_library.is_symlink():
            if not runtime_library.is_file() or sha256(runtime_library) != sha256(library):
                raise RuntimeError(f"Unexpected LLVM runtime library at {runtime_library}")
        else:
            runtime_library.parent.mkdir(parents=True, exist_ok=True)
            runtime_library.symlink_to(os.path.relpath(library, runtime_library.parent))
            print(f"Linked rust-objcopy's LLVM runtime: {runtime_library}", flush=True)
        result["llvm_runtime"] = {"library": str(library), "runtime_path": str(runtime_library),
                                  "relative_link": os.readlink(runtime_library) if runtime_library.is_symlink() else None,
                                  "sha256": sha256(library)}
    objcopy = prefix / "lib/rustlib" / host / "bin/rust-objcopy"
    output = subprocess.check_output([str(objcopy), "--version"], cwd=ROOT, env=environment,
                                     text=True, stderr=subprocess.STDOUT, timeout=30).strip()
    result["rust_objcopy"] = {"command": [str(objcopy), "--version"], "output": output}
    print(output, flush=True)
    return result


def main():
    system, machine = platform.system(), platform.machine()
    hosts = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin",
             ("Linux", "x86_64"): "x86_64-unknown-linux-gnu", ("Linux", "aarch64"): "aarch64-unknown-linux-gnu"}
    if (system, machine) not in hosts:
        raise SystemExit(f"Unsupported bootstrap host: {system} {machine}")
    host = hosts[system, machine]
    prefix = ROOT / ".tools/rust" / f"{VERSION}-{host}"
    cache = ROOT / "runtime/cache/rust"
    temporary = ROOT / "runtime/tmp/rust-install"
    environment = dict(os.environ)
    environment.update(CARGO_HOME=str(ROOT / "runtime/cargo"), RUSTUP_HOME=str(ROOT / ".tools/rust/rustup"),
                       TMPDIR=str(ROOT / "runtime/tmp"), XDG_CACHE_HOME=str(ROOT / "runtime/cache"),
                       CARGO_TARGET_DIR=str(ROOT / "runtime/cargo-target"))
    for path in (cache, temporary, prefix.parent, Path(environment["CARGO_HOME"]), Path(environment["RUSTUP_HOME"])):
        path.mkdir(parents=True, exist_ok=True)
    manifest_name = f"channel-rust-{VERSION}.toml"
    manifest_path = download(f"https://static.rust-lang.org/dist/{manifest_name}", cache / manifest_name, MANIFEST_SHA256)
    manifest = tomllib.loads(manifest_path.read_text())
    components = []
    for name in COMPONENTS:
        entry = manifest["pkg"][name]["target"][host]
        if not entry["available"]:
            raise RuntimeError(f"Required Rust component unavailable: {name}/{host}")
        components.append({"name": name, "url": entry["xz_url"], "sha256": entry["xz_hash"]})
    marker = prefix / "installation.json"
    if marker.is_file() and all((prefix / "bin" / tool).is_file() for tool in ("rustc", "cargo", "cargo-clippy", "rustfmt")):
        previous = json.loads(marker.read_text())
        if previous.get("manifest_sha256") == MANIFEST_SHA256:
            previous["host_tool_checks"] = verify_host_tools(prefix, host, environment)
            marker.write_text(json.dumps(previous, indent=2) + "\n")
            (ROOT / "runtime/rust-installation.json").write_text(json.dumps(previous, indent=2) + "\n")
            print(f"Reusing project Rust {VERSION}: {prefix}", flush=True)
            print(json.dumps(previous["versions"], indent=2))
            return
    with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:
        futures = [pool.submit(download, entry["url"], cache / Path(urllib.parse.urlparse(entry["url"]).path).name, entry["sha256"]) for entry in components]
        archives = [future.result() for future in futures]
    log_path = ROOT / "runtime/rust-install.log"
    with log_path.open("ab") as log:
        for entry, archive in zip(components, archives):
            source = temporary / archive.name.removesuffix(".tar.xz")
            if source.exists():
                shutil.rmtree(source)
            print(f"Extracting {entry['name']}", flush=True)
            with tarfile.open(archive, "r:xz") as package:
                package.extractall(temporary, filter="data")
            installer = source / "install.sh"
            if not installer.is_file():
                raise RuntimeError(f"Missing installer in {archive}")
            command = ["sh", str(installer), f"--prefix={prefix}", f"--sysconfdir={prefix / 'etc'}", "--disable-ldconfig"]
            print(f"Installing {entry['name']} in {prefix}", flush=True)
            subprocess.run(command, cwd=source, env=environment, stdout=log, stderr=subprocess.STDOUT, check=True)
            shutil.rmtree(source)
    host_tool_checks = verify_host_tools(prefix, host, environment)
    versions = {}
    for tool in ("rustc", "cargo", "cargo-clippy", "rustfmt"):
        versions[tool] = subprocess.check_output([str(prefix / "bin" / tool), "--version"], cwd=ROOT, env=environment, text=True).strip()
    if not versions["rustc"].startswith(f"rustc {VERSION} "):
        raise RuntimeError(f"Unexpected compiler: {versions['rustc']}")
    record = {"version": VERSION, "host": host, "prefix": str(prefix), "manifest_sha256": MANIFEST_SHA256,
              "manifest_url": f"https://static.rust-lang.org/dist/{manifest_name}", "components": components,
              "versions": versions, "host_tool_checks": host_tool_checks,
              "environment": {key: environment[key] for key in ("CARGO_HOME", "RUSTUP_HOME", "TMPDIR", "XDG_CACHE_HOME", "CARGO_TARGET_DIR")}}
    marker.write_text(json.dumps(record, indent=2) + "\n")
    (ROOT / "runtime/rust-installation.json").write_text(json.dumps(record, indent=2) + "\n")
    print(json.dumps(record, indent=2))


if __name__ == "__main__":
    main()

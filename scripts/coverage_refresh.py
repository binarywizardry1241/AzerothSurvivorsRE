"""Refresh source projections of an already selected native audit."""

import hashlib
import json
import os
from pathlib import Path
import subprocess

from coverage_common import ROOT, file_sha256, json_text, load_json, project_bytes, project_path
from instruction_facts import derived_bytes
from script_sources import load_script

COVERAGE = "docs/analysis/coverage/"
SYSTEMS = COVERAGE + "systems.json"
CHANGELOG = COVERAGE + "changelog.json"
REVIEWS = COVERAGE + "changelog-reviews.json"
DIAGNOSTICS = COVERAGE + "diagnostic-ownership.json"
CLASSIFICATION = COVERAGE + "native-ownership-classification.json"
SELECTION = COVERAGE + "native-image-current.json"
CONNECTIONS = COVERAGE + "exe-connections.json"
AUDIT_TOOL = "scripts/audit-exe-connections.py"
IDENTITY_KEYS = ("version", "path", "sha256", "size_bytes")


def sha(data):
    return hashlib.sha256(data).hexdigest()


def encoded(record):
    return json_text(record).encode()


def git(*args):
    return subprocess.check_output(["git", *args], cwd=ROOT)


def paths(*args):
    return {os.fsdecode(value) for value in git(*args).split(b"\0") if value}


def require_index_inputs(inputs, *, literal_include=None):
    dirty = paths("diff", "--name-only", "--no-renames", "-z")
    untracked = paths("ls-files", "--others", "--exclude-standard", "-z")
    conflicts = (dirty | untracked) & inputs
    if literal_include is not None:
        # The connection audit enumerates these two source trees for JSON
        # evidence and Rust include sites, even when no prior record names them.
        conflicts |= {name for name in dirty | untracked
                      if name.startswith("docs/analysis/evidence/") and name.endswith(".json")}
        for name in (dirty | untracked) - conflicts:
            if not (name.startswith("crates/azeroth-survivors-re/src/") and name.endswith(".rs")):
                continue
            source = ROOT / name
            live = source.read_text() if source.is_file() else ""
            staged = git("show", ":" + name).decode() if name in dirty else ""
            if set(literal_include.findall(live)) != set(literal_include.findall(staged)):
                conflicts.add(name)
    if conflicts:
        raise ValueError("Stage or finish the pending coverage inputs first: " + ", ".join(sorted(conflicts)))


def changelog_inputs(target):
    indexer = load_script("coverage_changelog", "index-current-changelog.py")
    crosswalk = indexer.crosswalk_path(target['version']).relative_to(ROOT).as_posix()
    inputs = {"docs/CHANGELOG.md", REVIEWS, SYSTEMS, crosswalk,
              "changelog_2026-10-15_1.json", "scripts/index-current-changelog.py",
              "docs/analysis/report-provenance.json"}
    inputs.update(str(path.relative_to(ROOT))
                  for path in (ROOT / "docs/analysis").glob("changelog-coverage-*.md"))
    for review in load_json(REVIEWS)["reviews"]:
        for name in review.get("reviewed_ref_sha256", {}):
            inputs.add(name)
            inputs.add(project_path(name).relative_to(ROOT).as_posix())
    return crosswalk, inputs


def read_bound(receipt):
    try:
        return json.loads(project_bytes(receipt["path"], expected=receipt["sha256"]))
    except (OSError, ValueError) as error:
        raise ValueError(f"Restore the retained audit input {receipt['path']} before refreshing coverage") from error


def ownership_records(target, systems, selection, unknown_path):
    """Rejoin current system IDs while retaining the original native observations."""
    diagnostic = load_json(DIAGNOSTICS)
    previous_mapping = diagnostic.get("source_mapping_projection")
    classifier_ref = selection["records"]["classification"]
    classifier = read_bound(classifier_ref)
    if classifier_ref["path"] != CLASSIFICATION:
        raise ValueError("The selected ownership record is outside the canonical source refresh path")
    prior = classifier["source_candidates"]
    if any(row["target"] != target for row in (diagnostic, selection, classifier, systems)):
        raise ValueError("Coverage targets differ. Reconcile the native audit before refreshing its source records.")
    mapping = {"path": SYSTEMS, "sha256": file_sha256(SYSTEMS)}
    if (mapping["sha256"] == prior["source_mapping"]["sha256"]
            and (previous_mapping is None or mapping == previous_mapping["source_mapping"])):
        return {}

    owner = load_script("coverage_diagnostics", "discover-native-ownership.py")
    payload = read_bound(diagnostic["inventory"])
    sources = (previous_mapping["native_execution_sources"] if previous_mapping is not None
               else owner.execution_sources(payload["generator"]))
    projected = owner.project_source_mapping(
        payload, diagnostic["inventory"], systems, ROOT / SYSTEMS, sources,
        fresh_verification=diagnostic.get("fresh_native_verification"),
    )
    source_audit = read_bound(prior["audit"])
    if source_audit["source_mapping"] != prior["source_mapping"]:
        raise ValueError("The retained source candidates disagree with their published source mapping")
    by_path = {row["original_path"]: row for row in systems["systems"] if row.get("original_path")}
    for candidate in source_audit["paths"]:
        system = by_path.get(candidate["diagnostic_path"], {})
        candidate["reconstruction_system"] = system.get("id")
        candidate["reconstruction_source_refs"] = system.get("source_refs", [])
    source_audit["source_mapping"].update(mapping)
    audit_bytes = encoded(source_audit)
    prior["source_mapping"] = source_audit["source_mapping"]
    prior["audit"]["sha256"] = sha(audit_bytes)
    classifier_bytes = encoded(classifier)
    classifier_ref["sha256"] = sha(classifier_bytes)

    unknown = load_json(unknown_path)
    binding = unknown["inputs"]["diagnostic-ownership"]
    if (binding["summary"] != {"path": DIAGNOSTICS, "sha256": file_sha256(DIAGNOSTICS)}
            or binding["inventory"] != projected["inventory"] or binding["counts"] != projected["counts"]):
        raise ValueError("The residual ledger differs from the retained diagnostic observations")
    diagnostic_bytes = encoded(projected)
    binding["summary"]["sha256"] = sha(diagnostic_bytes)
    return {DIAGNOSTICS: diagnostic_bytes, CLASSIFICATION: classifier_bytes,
            SELECTION: encoded(selection), prior["audit"]["path"]: audit_bytes,
            unknown_path: encoded(unknown)}


def refresh(*, staged=False):
    if staged:
        index_state = git("diff", "--cached", "--raw", "--no-abbrev", "--no-renames", "-z")
        changed = paths("diff", "--cached", "--name-only", "--no-renames", "-z")
        if not changed or not (ROOT / SELECTION).is_file():
            return []
        # A native target registration or fresh census has its own audit
        # workflow and may deliberately be published in phases.
        if COVERAGE + "targets.json" in changed:
            return []
    else:
        changed = set()
    target = load_json(CHANGELOG)["target"]
    selection = load_json(SELECTION)
    census = selection["records"]["census"]["path"]
    if staged and census in changed:
        return []
    if SELECTION in changed:
        previous = json.loads(git("show", "HEAD:" + SELECTION))
        if previous["records"]["census"] != selection["records"]["census"]:
            return []
    crosswalk, inputs = changelog_inputs(target)
    if staged:
        inputs.update(name for name in changed | paths("diff", "--name-only", "--no-renames", "-z")
                      if name.startswith("docs/analysis/changelog-coverage-") and name.endswith(".md"))
    if staged and not changed & inputs:
        if AUDIT_TOOL not in changed:
            return []
        staged_connections = json.loads(git("show", ":" + CONNECTIONS))
        if staged_connections["generator"]["sha256"] == sha(git("show", ":" + AUDIT_TOOL)):
            return []

    unknown_path = "docs/analysis/evidence/unknown-recovery.json"
    tracked_outputs = {CHANGELOG, DIAGNOSTICS, CLASSIFICATION, SELECTION, CONNECTIONS, unknown_path}
    inputs |= tracked_outputs | {census, AUDIT_TOOL, COVERAGE + "targets.json",
                                  COVERAGE + "native-summary.json",
                                  COVERAGE + "historical-range-revalidation.json",
                                  "scripts/artifact_history.py", "scripts/coverage_refresh.py", "scripts/coverage_common.py",
                                  "docs/analysis/artifact-history.json",
                                  "scripts/discover-native-ownership.py", "scripts/instruction_facts.py",
                                  "scripts/script_sources.py", "scripts/revalidate-historical-native-ranges.py"}
    if staged:
        index = Path(git("rev-parse", "--git-path", "index").decode().strip())
        if index.name != "index":
            raise ValueError("Coverage refresh requires an explicitly staged commit. Stage the changes and run git commit.")
        require_index_inputs(inputs)

    indexer = load_script("coverage_changelog", "index-current-changelog.py")
    ledger = indexer.build_ledger(target, ROOT / "docs/CHANGELOG.md", ROOT / crosswalk)
    replacements = {CHANGELOG: indexer.encode_ledger(ledger).encode()}
    identity = {key: target[key] for key in IDENTITY_KEYS}
    replacements.update(ownership_records(identity, load_json(SYSTEMS), selection, unknown_path))
    if (any((ROOT / name).read_bytes() != value for name, value in replacements.items())
            or load_json(CONNECTIONS)["generator"]["sha256"] != file_sha256(AUDIT_TOOL)):
        connections = load_script("coverage_connections", AUDIT_TOOL)
        if staged:
            require_index_inputs(inputs, literal_include=connections.LITERAL_INCLUDE)
        summary, inventory = connections.connection_records(target, census, replacements)
        replacements[CONNECTIONS] = encoded(summary)
        replacements[summary["inventory"]["path"]] = inventory
        if staged:
            inputs.update(row["path"] for row in json.loads(inventory)["embedded_assets"])
            require_index_inputs(inputs, literal_include=connections.LITERAL_INCLUDE)
    if staged:
        require_index_inputs(inputs)
        if index_state != git("diff", "--cached", "--raw", "--no-abbrev", "--no-renames", "-z"):
            raise ValueError("The staged changes moved during coverage refresh. Retry the commit.")

    originals = {name: (ROOT / name).read_bytes() if (ROOT / name).is_file() else None
                 for name in replacements}
    updated = [name for name, value in replacements.items() if originals[name] != value]
    published = []
    try:
        for name in updated:
            if name not in tracked_outputs and not (ROOT / name).resolve().is_relative_to(ROOT / "runtime"):
                raise ValueError(f"Unexpected coverage output: {name}")
            derived_bytes(ROOT / name, replacements[name], publish=True)
            published.append(name)
        staged_outputs = sorted(tracked_outputs.intersection(updated))
        if staged and staged_outputs:
            require_index_inputs(inputs - set(staged_outputs))
            if index_state != git("diff", "--cached", "--raw", "--no-abbrev", "--no-renames", "-z"):
                raise ValueError("The staged changes moved during coverage refresh. Retry the commit.")
            git("add", "--", *staged_outputs)
    except (OSError, ValueError, subprocess.CalledProcessError):
        for name in reversed(published):
            if originals[name] is None:
                (ROOT / name).unlink()
            else:
                derived_bytes(ROOT / name, originals[name], publish=True)
        raise
    return staged_outputs

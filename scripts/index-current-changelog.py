#!/usr/bin/env python3
"""Account for every supplied changelog claim against the latest registered EXE.

This does not recover native behavior. Release-level owner links are leads only;
each claim stays pending until its own native contract and source are reviewed.
The default and --check are read-only. Use --write to replace the ledger.
"""

import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys
import unicodedata
from urllib.parse import unquote

sys.dont_write_bytecode = True

from coverage_common import latest_target
from script_sources import current_path, historical_source


ROOT = Path(__file__).resolve().parent.parent
DEFAULT_OUTPUT = ROOT / "docs/analysis/coverage/changelog.json"
DEFAULT_REVIEWS = ROOT / "docs/analysis/coverage/changelog-reviews.json"
DEFAULT_SYSTEMS = ROOT / "docs/analysis/coverage/systems.json"
HEADING = re.compile(r"^## (\d+\.\d+\.\d+)\s*$")
BULLET = re.compile(r"^(\s*)(?:[-*+] |\d+\. )(.*)$")
LINK = re.compile(r"\[[^\]]+\]\(([^)]+)\)")
HISTORICAL_CONTEXT = re.compile(r"^Historical release context: \[(\d+\.\d+\.\d+)\]\(([^)]+)\)$")

# These labels describe supplied text, not recovered behavior or implementation.
# More than one may apply. Unrecognized text remains explicitly unknown.
SCOPE_RULES = (
    ("platform_browser", r"\bbrowser\b|\bwebsite\b|\bweb edition\b|\bWebAssembly\b|\bWebGPU\b"),
    ("platform_linux", r"\bLinux\b"),
    ("platform_windows", r"\bWindows\b|\bexe\b|\btaskbar\b"),
    ("platform_macos", r"\bMac\b|\bmacOS\b"),
    ("platform_android", r"\bAndroid\b|\bAdreno\b|\bGalaxy\b"),
    ("input_gamepad", r"\bgamepad\b|\bcontroller\b|\bright stick\b|\bleft stick\b"),
    ("addons", r"\baddons?\b|\bAZS[_A-Z]|\bAZSEND\b|\bLua\b|\bgetglobal\b"),
    ("engine", r"\bshader\b|\bmaterials?\b|\bgraphics driver\b|\bgraphics variant\b|\bWorld of Warcraft client\b"),
    ("audio", r"\baudio\b|\bsound\b|\bmusic\b|\bvoice\b|\bfanfare\b|\bfootsteps\b"),
    ("localization", r"\blanguage\b|\btranslat\w*\b|\bfont\b|\bKorean\b|\bChinese\b|\bJapanese\b|\bCyrillic\b"),
    ("save_config", r"\bsaves?\b|\bimport\w*\b|\bexport\w*\b|\bbackup\w*\b|\bsettings\b|\bremember\w*\b|\breset\w*\b"),
    ("ui_ux", r"\btooltip\w*\b|\bscreen\b|\bHUD\b|\bwindow\b|\bmenu\b|\barmory\b|\boptions\b|\bbutton\b|\bscroll\w*\b|\bchat\b|\bpane\b|\bcards?\b|\bmeter\b|\bnameplate\w*\b|\bbuffs?\b|\bdebuff\w*\b"),
    ("gameplay", r"\bspell\w*\b|\bdamage\b|\bhealth\b|\bhealthiest\b|\benem\w*\b|\bboss\w*\b|\bguardians?\b|\btalent\w*\b|\bamulet\w*\b|\btrinket\w*\b|\bnecklace\w*\b|\bcompanions?\b|\bcombat\b|\bkill\w*\b|\bheal\w*\b|\btotems?\b|\bshards?\b|\blevel\w*\b|\bzone\w*\b|\bshield\w*\b"),
)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def relative(path):
    return str(path.resolve().relative_to(ROOT))


def project_path(value):
    path = Path(value)
    if not path.is_absolute():
        path = ROOT / path
    try:
        path.resolve().relative_to(ROOT)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("path must stay inside this checkout") from exc
    return current_path(path.resolve())


def normalized(text):
    return re.sub(r"\s+", " ", unicodedata.normalize("NFC", text)).strip()


def parse_claims(path):
    """Partition every nonblank release-body line; never silently skip prose."""
    lines = path.read_text(encoding="utf-8").splitlines(keepends=True)
    entries, releases, owned = [], [], set()
    release = None
    buffer = []
    kind, indent, fenced = "paragraph", 0, False
    parents = []

    def flush():
        nonlocal buffer
        if not buffer:
            return
        source_text = "".join(lines[buffer[0][0] - 1:buffer[-1][0]])
        parts = [line.strip() for _, line in buffer]
        if kind == "bullet":
            parts[0] = BULLET.match(buffer[0][1]).group(2).strip()
        text = "\n".join(parts) if kind == "fenced_table" else " ".join(parts)
        normalized_hash = digest(normalized(text).encode())
        entry_id = f"changelog:{release}:{normalized_hash[:16]}"
        while parents and (kind != "bullet" or parents[-1][0] >= indent):
            parents.pop()
        parent_id = parents[-1][1] if parents and kind == "bullet" else None
        entries.append({
            "id": entry_id,
            "release": release,
            "text": text,
            "text_sha256": digest(text.encode()),
            "normalized_claim_sha256": normalized_hash,
            "entry_kind": kind,
            "parent_id": parent_id,
            "source_span": {"path": relative(path), "line_start": buffer[0][0],
                            "line_end": buffer[-1][0], "sha256": digest(source_text.encode())},
        })
        for number, _ in buffer:
            if number in owned:
                raise ValueError(f"changelog line {number} assigned twice")
            owned.add(number)
        if kind == "bullet":
            parents.append((indent, entry_id))
        buffer = []

    expected = set()
    for number, raw in enumerate(lines, 1):
        line = raw.rstrip("\r\n")
        heading = HEADING.match(line)
        if heading and not fenced:
            flush()
            release = heading[1]
            if release in releases:
                raise ValueError(f"duplicate release section {release}")
            releases.append(release)
            parents = []
            continue
        if release is None:
            continue
        if line.strip():
            expected.add(number)
        if fenced:
            if line.strip():
                buffer.append((number, line))
            if "```" in line:
                fenced = False
                flush()
            continue
        if not line.strip():
            flush()
            continue
        if "```" in line:
            flush()
            kind, indent = "fenced_table", 0
            buffer = [(number, line)]
            fenced = line.count("```") % 2 == 1
            if not fenced:
                flush()
            continue
        bullet = BULLET.match(line)
        source_note = re.match(r"(?i)^(?:thanks\b|notes?:)", line)
        if bullet or source_note:
            flush()
            kind = "bullet" if bullet else "source_note"
            indent = len(bullet[1]) if bullet else 0
        elif not buffer:
            kind, indent = "paragraph", 0
        buffer.append((number, line))
    if fenced:
        raise ValueError("unterminated changelog fence")
    flush()
    if owned != expected:
        raise ValueError(f"unaccounted changelog lines: {sorted(expected - owned)}")
    ids = [entry["id"] for entry in entries]
    if len(ids) != len(set(ids)):
        raise ValueError("identical normalized claims in one release need explicit duplicate accounting")
    return entries, releases, len(expected)


def local_link(path, link):
    if "://" in link or link.startswith("#"):
        return link
    file_part, marker, fragment = unquote(link).partition("#")
    resolved = (path.parent / file_part).resolve()
    try:
        ref = relative(resolved)
    except ValueError as exc:
        raise ValueError(f"crosswalk link escapes checkout: {link}") from exc
    return ref + (marker + fragment if marker else "")


def parse_crosswalk(path, target_version, *, _active=()):
    """Read local rows and an optional older crosswalk without claiming parity.

    `Historical release context: [VERSION](path.md)` inherits ownership leads
    with their original references, target and file digest. Local rows override
    those leads. This never imports or applies individual target reviews.
    """
    if path is None or not path.is_file():
        return {}, {"path": None, "sha256": None, "target_version": None,
                    "status": "current_target_crosswalk_missing"}
    path = project_path(path)
    if path in _active:
        raise ValueError(f"historical crosswalk cycle: {relative(path)}")
    raw = path.read_bytes()
    text = raw.decode("utf-8")
    declared = re.search(r"(?i)selected\s+(\d+\.\d+\.\d+)\s+target", text)
    crosswalk_version = declared[1] if declared else None
    contexts = {}
    inherited_identity = None
    for number, line in enumerate(text.splitlines(), 1):
        if not line.startswith("Historical release context:"):
            continue
        inherited = HISTORICAL_CONTEXT.fullmatch(line)
        if not inherited or inherited_identity is not None:
            raise ValueError(f"invalid or duplicate historical crosswalk declaration at line {number}")
        version, link = inherited.groups()
        reference = local_link(path, link)
        if "://" in reference or "#" in reference:
            raise ValueError("historical crosswalk must name a project-local file without a fragment")
        inherited_path = project_path(reference)
        if not inherited_path.is_file():
            raise ValueError(f"historical crosswalk missing: {reference}")
        inherited_contexts, inherited_identity = parse_crosswalk(
            inherited_path, target_version, _active=_active + (path,))
        if version != inherited_identity["target_version"]:
            raise ValueError(f"historical crosswalk version disagrees with declaration: {reference}")
        if crosswalk_version is None or tuple(map(int, version.split("."))) >= tuple(map(int, crosswalk_version.split("."))):
            raise ValueError("historical crosswalk target must be older than the inheriting target")
        for release, context in inherited_contexts.items():
            historical = dict(context)
            historical.setdefault("historical_contextual_status", context["contextual_status"])
            historical["contextual_status"] = "historical_release_context"
            historical.setdefault("target_version", version)
            historical.setdefault("origin_crosswalk", {
                key: inherited_identity[key] for key in ("path", "sha256", "target_version")})
            contexts[release] = historical
    local_versions = set()
    for number, line in enumerate(text.splitlines(), 1):
        if not re.match(r"\| \d+\.\d+\.\d+ \|", line):
            continue
        cells = [cell.strip() for cell in re.split(r"(?<!\\)\|", line)[1:-1]]
        if len(cells) != 5:
            raise ValueError(f"crosswalk line {number} must have five cells")
        version, scope, status, remaining, owners = cells
        if version in local_versions:
            raise ValueError(f"duplicate crosswalk release {version}")
        local_versions.add(version)
        refs = list(dict.fromkeys(local_link(path, link) for link in LINK.findall(owners)))
        contexts[version] = {
            "reference": f"{relative(path)}#L{number}",
            "reviewed_scope": scope,
            "contextual_status": status,
            "remaining_check_or_omission": remaining,
            "source_refs": [ref for ref in refs if ref.startswith(("crates/", "scripts/"))],
            "evidence_refs": [ref for ref in refs if not ref.startswith(("crates/", "scripts/"))],
            "mentioned_gap_ids": sorted({int(value) for value in re.findall(r"#(\d+)\b", remaining)}),
            "contextual_systems": [],
        }
    identity = {
        "path": relative(path), "sha256": digest(raw), "target_version": crosswalk_version,
        "status": "current_release_context" if crosswalk_version == target_version else "historical_or_unbound_release_context",
    }
    if inherited_identity is not None:
        identity["historical_release_context"] = inherited_identity
    return contexts, identity


def scope_labels(entry):
    labels = [label for label, pattern in SCOPE_RULES if re.search(pattern, entry["text"], re.I)]
    if entry["entry_kind"] == "source_note":
        labels.append("supplied_note")
    return labels or ["unknown"]


def supersession_review(entry, context):
    # Preserve the supplied explicit reversal as a lead. Never infer that an
    # entire mixed paragraph is obsolete because one value was later changed.
    text = context.get("remaining_check_or_omission", "")
    historical = context.get("contextual_status", "").startswith("historical")
    result = {"status": "unknown", "current_target_applicability": "unverified"}
    if re.search(r"supersed|do not reinstate|do not restore|no backport|later reversed", text, re.I):
        result.update(status="release_context_reports_superseded_rules", context=text)
    elif historical:
        result.update(status="historical_release_context_requires_claim_review", context=text)
    if entry["release"] == "0.59.0" and "0.57.0 shrink is undone" in entry["text"]:
        result.update(status="supplied_explicit_reversal", earlier_release="0.57.0",
                      aspect="Area shrink only; supplied text retains the damage reduction.")
    if entry["release"] == "0.96.0" and entry["text"].startswith("Only End Run"):
        result.update(status="supplied_explicit_partial_reversal", earlier_release="0.95.1",
                      aspect="Quit/Main Menu confirmation removed; End Run confirmation retained.")
    return result


def bind_contextual_systems(contexts, path, target):
    if not path.is_file():
        return {"path": None, "sha256": None, "status": "system_mapping_pending"}, set()
    raw = path.read_bytes()
    registry = json.loads(raw)
    identity = registry.get("target", {})
    current = all(identity.get(key) == target[key] for key in ("version", "sha256"))
    owners = {}
    ids = set()
    for system in registry.get("systems", []):
        ids.add(system["id"])
        if current:
            for ref in system.get("source_refs", []):
                owners.setdefault(ref.partition("#")[0], set()).add(system["id"])
    for context in contexts.values():
        context["contextual_systems"] = sorted({system for ref in context["source_refs"]
                                                for system in owners.get(ref.partition("#")[0], set())})
    return {"path": relative(path), "sha256": digest(raw),
            "status": "current_source_owner_context" if current else "stale_target_systems_unmapped"}, ids


def apply_reviews(entries, path, target, system_ids):
    """Apply durable claim-specific assessments, never a release's status.

    Each review names claim_id, target {version, sha256}, status, rationale,
    source_refs, evidence_refs, and reviewed_ref_sha256 keyed by file path.
    Optional systems/gap_ids identify the reviewed contract's owners. Native
    recovery also needs native_contract and target-bound evidence. Static checks
    add [{command, result: "passed", evidence_ref}]. Runtime/parity statuses are
    intentionally unavailable. Old-target reviews remain unapplied in the store.
    A pending_claim_recovery row assigns ownership only: target-bound evidence,
    nonempty systems/gaps and a rationale are required, while native contracts
    and static-check certification are forbidden. It never connects source.
    """
    raw = path.read_bytes()
    store = json.loads(raw)
    if store.get("schema_version") != 1 or not isinstance(store.get("reviews"), list):
        raise ValueError("review store requires schema_version 1 and a reviews array")
    by_id = {entry["id"]: entry for entry in entries}
    seen, historical, applied, ownership_applied = set(), [], [], []
    ownership_seen = False
    allowed = {"source_connected", "native_recovered", "static_checked", "pending_claim_recovery"}
    for review in store["reviews"]:
        if not isinstance(review, dict):
            raise ValueError("each claim review must be an object")
        unknown = set(review) - {"claim_id", "target", "status", "rationale", "source_refs", "evidence_refs",
                                 "reviewed_ref_sha256", "systems", "gap_ids", "native_contract", "static_checks"}
        if unknown:
            raise ValueError(f"unsupported claim review fields: {sorted(unknown)}")
        claim_id = review.get("claim_id")
        if claim_id not in by_id:
            raise ValueError(f"review references unknown claim: {claim_id}")
        identity = review.get("target", {})
        if not isinstance(identity, dict):
            raise ValueError(f"review target must be an object: {claim_id}")
        version, target_hash = identity.get("version"), identity.get("sha256", "")
        if (not re.fullmatch(r"\d+\.\d+\.\d+", str(version)) or not isinstance(target_hash, str)
                or not re.fullmatch(r"[0-9a-f]{64}", target_hash)):
            raise ValueError(f"review for {claim_id} needs exact target version and SHA-256")
        if target_hash == target["sha256"] and version != target["version"]:
            raise ValueError(f"review target version disagrees with selected hash: {claim_id}")
        key = (claim_id, target_hash)
        if key in seen:
            raise ValueError(f"duplicate review for claim/target: {claim_id}")
        seen.add(key)
        status = review.get("status")
        if status not in allowed:
            raise ValueError(f"unsupported claim completion/status {status!r}: {claim_id}")
        ownership_only = status == "pending_claim_recovery"
        if ownership_only:
            ownership_seen = True
            if "native_contract" in review or "static_checks" in review:
                raise ValueError(f"pending ownership cannot certify native contracts or static checks: {claim_id}")
        if not isinstance(review.get("rationale"), str) or not review["rationale"].strip():
            raise ValueError(f"review rationale is required: {claim_id}")
        current = target_hash == target["sha256"] and version == target["version"]
        sources = review.get("source_refs", [])
        evidence = review.get("evidence_refs", [])
        if not isinstance(sources, list) or not isinstance(evidence, list):
            raise ValueError(f"review references must be arrays: {claim_id}")
        if status in {"source_connected", "static_checked"} and not sources:
            raise ValueError(f"{status} needs claim-specific source references: {claim_id}")
        hashes = review.get("reviewed_ref_sha256", {})
        if not isinstance(hashes, dict):
            raise ValueError(f"reviewed_ref_sha256 must be an object: {claim_id}")
        bound_evidence = False
        changed_refs = []
        for ref in sources + evidence:
            if not isinstance(ref, str) or not ref or "://" in ref:
                raise ValueError(f"review ref must be a project-relative file: {claim_id}")
            name = ref.partition("#")[0]
            if Path(name).is_absolute():
                raise ValueError(f"review ref must be portable and project-relative: {name}")
            try:
                file_path = project_path(name)
            except argparse.ArgumentTypeError as exc:
                raise ValueError(f"review reference leaves the checkout: {name}") from exc
            expected = hashes.get(name)
            if not isinstance(expected, str) or not re.fullmatch(r"[0-9a-f]{64}", expected):
                raise ValueError(f"review reference needs its exact file SHA-256: {name}")
            if file_path.is_file():
                data = file_path.read_bytes()
            elif not current:
                try:
                    data = historical_source(name, expected, ROOT)
                except (OSError, ValueError) as exc:
                    raise ValueError(f"review reference missing: {name}") from exc
            else:
                raise ValueError(f"review reference missing: {name}")
            if digest(data) != expected:
                changed_refs.append(name)
            if ref in evidence and target_hash.encode() in data.lower():
                bound_evidence = True
        if current and changed_refs:
            raise ValueError(f"review reference bytes changed; reassess {claim_id}: {changed_refs}")
        if status in {"native_recovered", "static_checked"}:
            contract = review.get("native_contract")
            if not evidence or not bound_evidence or not isinstance(contract, str) or not contract.strip():
                raise ValueError(f"{status} needs a specific native contract and evidence containing the target hash: {claim_id}")
        if status == "static_checked":
            checks = review.get("static_checks")
            if not isinstance(checks, list) or not checks or any(not isinstance(check, dict)
                    or not check.get("command") or check.get("result") != "passed"
                    or check.get("evidence_ref") not in evidence for check in checks):
                raise ValueError(f"static_checked needs recorded commands, passed results and evidence refs: {claim_id}")
        systems = review.get("systems", [])
        gaps = review.get("gap_ids", [])
        if not isinstance(systems, list) or any(system not in system_ids for system in systems):
            raise ValueError(f"review references unknown system: {claim_id}")
        if not isinstance(gaps, list) or any(not isinstance(gap, int) or isinstance(gap, bool) or gap < 1 for gap in gaps):
            raise ValueError(f"review gap_ids must be permanent positive integers: {claim_id}")
        if ownership_only and (not systems or not gaps or not evidence or not bound_evidence):
            raise ValueError(f"pending ownership needs systems, gap_ids and evidence containing the exact target hash: {claim_id}")
        if not current:
            historical.append({"claim_id": claim_id, "target": identity, "status": status,
                               "application": "historical_unapplied", "changed_refs": changed_refs})
            continue
        entry = by_id[claim_id]
        if ownership_only:
            entry.update(status="pending_claim_recovery", source_refs=[], evidence_refs=evidence, systems=systems,
                         gap_ids=gaps, mapping_basis="individual_target_ownership_lead",
                         ownership_rationale=review["rationale"], ownership_source_refs=sources,
                         assessment={"recovery": "unknown", "implementation": "unknown", "static_validation": "not_run",
                                     "runtime_validation": "unverified", "parity": "unverified"},
                         limitations="Individual target-bound ownership leads only; no native recovery, source connection, static check or parity is certified.")
            ownership_applied.append(claim_id)
            continue
        entry.update(status=status, source_refs=sources, evidence_refs=evidence, systems=systems,
                     gap_ids=gaps, mapping_basis="individual_target_review",
                     review_rationale=review["rationale"],
                     assessment={"recovery": "bounded" if status in {"native_recovered", "static_checked"} else "unknown",
                                 "implementation": "source_connected" if status in {"source_connected", "static_checked"} else "unknown",
                                 "static_validation": "bounded" if status == "static_checked" else "not_run",
                                 "runtime_validation": "unverified", "parity": "unverified"},
                     limitations="Only the individually reviewed contract is assessed; runtime and complete claim parity remain unverified.")
        if "native_contract" in review:
            entry["native_contract"] = review["native_contract"]
        if "static_checks" in review:
            entry["static_checks"] = review["static_checks"]
        applied.append(claim_id)
    identity = {"path": relative(path), "sha256": digest(raw), "applied_reviews": len(applied),
                "historical_unapplied_reviews": historical}
    if ownership_seen:
        identity["applied_ownership_reviews"] = len(ownership_applied)
    return identity


def build_ledger(target, changelog, crosswalk, reviews=DEFAULT_REVIEWS, systems=DEFAULT_SYSTEMS):
    target = {key: target[key] for key in ("version", "path", "sha256", "size_bytes", "identity_manifest")}
    entries, releases, covered_lines = parse_claims(changelog)
    contexts, crosswalk_identity = parse_crosswalk(crosswalk, target["version"])
    systems_identity, system_ids = bind_contextual_systems(contexts, systems, target)
    anomalies = []
    for entry in entries:
        context = contexts.get(entry["release"], {})
        entry.update({
            "scope": scope_labels(entry),
            "status": "pending_claim_recovery",
            "contextual_status": context.get("contextual_status", "unmapped_release"),
            "context_ref": entry["release"] if context else None,
            "systems": [],
            "gap_ids": [41],
            "source_refs": [],
            "evidence_refs": [],
            "mapping_basis": "release_context_only" if context else "unmapped",
            "supersession_review": supersession_review(entry, context),
            "limitations": "Release owner links are leads; claim recovery, source mapping and parity remain unverified.",
        })
    reviews_identity = apply_reviews(entries, reviews, target, system_ids)
    # The current source now supplies concrete 0.94.2 claims, while its old
    # crosswalk labels that release an unspecified fix. Keep the discrepancy
    # visible until the owning crosswalk is corrected, without editing it here.
    if ("0.94.2" in contexts and "unspecified" in contexts["0.94.2"]["reviewed_scope"].lower()
            and any(entry["release"] == "0.94.2" and entry["text"].startswith("Performance:") for entry in entries)):
        anomalies.append({"release": "0.94.2", "status": "release_context_mismatch",
                          "detail": "Supplied performance and browser music claims exist; crosswalk calls the release unspecified."})
    counts = Counter(label for entry in entries for label in entry["scope"])
    return {
        "schema_version": 1,
        "target": target,
        "method": "One record per supplied paragraph, bullet (including nested bullets), fenced table or note; normalized text hashes provide stable IDs. No EXE behavior is inferred from release notes.",
        "generated_from": {
            "changelog": {"path": relative(changelog), "sha256": digest(changelog.read_bytes())},
            "crosswalk": crosswalk_identity,
            "systems": systems_identity,
            "reviews": reviews_identity,
            "historical_archive": {"path": "changelog_2026-10-15_1.json",
                                   "sha256": digest((ROOT / "changelog_2026-10-15_1.json").read_bytes()),
                                   "role": "Unchanged original archive through 0.92.0; later releases are supplied in CHANGELOG.md."},
        },
        "policy": {
            "claim_status": "Pending until individual current-target evidence and the live source consumer are reviewed. Release-level implemented status is never inherited.",
            "review_store": "Claim-specific reviews are durable inputs keyed by stable claim ID and exact target hash. Historical reviews are retained unapplied; changed current review references require reassessment. No review status certifies runtime or complete parity.",
            "supersession": "Earlier values are historical leads, never instructions to restore them. Mixed claims require aspect-level review; unknown applicability stays explicit.",
            "scope": "Engine, UI, input and platform claims are retained even when outside the native game-mode backlog. Browser/Linux claims require the corresponding artifact before parity can be established.",
            "system_mapping": ("Release contexts and individual pending ownership reviews provide ownership leads only; system membership does not establish native recovery or source connection."
                               if "applied_ownership_reviews" in reviews_identity else
                               "Empty systems mean claim-to-system mapping is still pending. Owner references live only in release_contexts; contextual_systems are ownership leads, not claim proof."),
            "coverage_gap": "Gap #41 tracks incomplete discovery and claim accounting; it does not assert a separate gameplay defect for every supplied claim.",
            "limits": "Static accounting does not establish exhaustive EXE discovery, compilation, gameplay, UI/UX, audio or platform parity.",
        },
        "summary": {"release_count": len(releases), "entry_count": len(entries),
                    "covered_nonblank_release_lines": covered_lines,
                    "pending_claim_recovery": sum(entry["status"] == "pending_claim_recovery" for entry in entries),
                    "applied_claim_reviews": reviews_identity["applied_reviews"],
                    **({"applied_ownership_reviews": reviews_identity["applied_ownership_reviews"]}
                       if "applied_ownership_reviews" in reviews_identity else {}),
                    "release_contexts_with_system_owners": sum(bool(context["contextual_systems"]) for context in contexts.values()),
                    "scope_counts": dict(sorted(counts.items())),
                    "release_context_missing": [release for release in releases if release not in contexts],
                    "crosswalk_releases_without_source_section": [release for release in contexts if release not in releases]},
        "context_anomalies": anomalies,
        "release_contexts": contexts,
        "entries": entries,
    }


def encode_ledger(ledger):
    """One meaningful record per line keeps generated diffs reviewable."""
    header = {key: value for key, value in ledger.items() if key not in ("release_contexts", "entries")}
    text = json.dumps(header, ensure_ascii=False, indent=2)[:-2]
    contexts = ",\n".join("    " + json.dumps(version, ensure_ascii=False) + ": "
                            + json.dumps(context, ensure_ascii=False, separators=(",", ":"))
                            for version, context in ledger["release_contexts"].items())
    entries = ",\n".join("    " + json.dumps(entry, ensure_ascii=False, separators=(",", ":"))
                           for entry in ledger["entries"])
    return text + ',\n  "release_contexts": {\n' + contexts + '\n  },\n  "entries": [\n' + entries + '\n  ]\n}\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    action = parser.add_mutually_exclusive_group()
    action.add_argument("--write", action="store_true", help="explicitly replace the project-local output ledger")
    action.add_argument("--check", action="store_true", help="read-only reproducibility check (the default)")
    parser.add_argument("--output", type=project_path, default=DEFAULT_OUTPUT)
    parser.add_argument("--changelog", type=project_path, default=ROOT / "docs/CHANGELOG.md")
    parser.add_argument("--crosswalk", type=project_path,
                        help="release context; defaults to the latest target's version-specific crosswalk")
    parser.add_argument("--reviews", type=project_path, default=DEFAULT_REVIEWS,
                        help="durable individual claim reviews; older target hashes remain historical")
    parser.add_argument("--systems", type=project_path, default=DEFAULT_SYSTEMS,
                        help="current system ledger; exact shared source paths provide contextual owners only")
    args = parser.parse_args()
    try:
        target = latest_target(verify=True)
        crosswalk = args.crosswalk or ROOT / f"docs/analysis/changelog-coverage-{target['version']}.md"
        if args.output in (args.changelog, crosswalk, args.reviews, args.systems, ROOT / "changelog_2026-10-15_1.json"):
            raise ValueError("output must not overwrite a changelog source or crosswalk")
        ledger = build_ledger(target, args.changelog, crosswalk, args.reviews, args.systems)
        inherited = ledger["generated_from"]["crosswalk"].get("historical_release_context")
        while inherited is not None:
            if args.output == project_path(inherited["path"]):
                raise ValueError("output must not overwrite a historical crosswalk source")
            inherited = inherited.get("historical_release_context")
        encoded = encode_ledger(ledger)
        if args.write:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(encoded, encoding="utf-8")
        elif not args.output.is_file() or args.output.read_text(encoding="utf-8") != encoded:
            parser.exit(1, f"stale or missing changelog ledger: {relative(args.output)}; review inputs, then use --write\n")
        print(json.dumps({"output": relative(args.output), "action": "written" if args.write else "checked",
                          "target_version": target["version"], **ledger["summary"]}, ensure_ascii=False))
    except (OSError, ValueError, KeyError) as exc:
        parser.exit(1, f"changelog accounting failed: {exc}\n")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Compose an evidence-bound, partial AS candidate graph and review queue.

No native queries, compilation or application execution. Default is read-only;
--write retains an immutable input profile beneath runtime/coverage/<sha>/
as-discovery/. --check recomposes and compares an existing profile. --reviews
accepts explicit bounded review records; structural/source-name matches never
promote ownership or semantic status. See review_record() for the small schema.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
from coverage_common import file_sha256
from script_sources import current_path


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False) + "\n").encode()


def digest(value):
    return hashlib.sha256(value).hexdigest()


def file_commitment(value):
    if (not isinstance(value, dict) or set(value) != {"path", "sha256"}
            or not isinstance(value["path"], str) or not value["path"]
            or not isinstance(value["sha256"], str)
            or re.fullmatch(r"[0-9a-f]{64}", value["sha256"]) is None):
        raise ValueError("Expected exact path/sha256 file commitment")
    return value


def commitment_list(inputs, values):
    if not isinstance(values, list) or not values:
        raise ValueError("Expected nonempty file commitment list")
    for value in values:
        row = file_commitment(value)
        inputs.commit(row["path"], row["sha256"])


def source_commitment_drift(inputs, values, retain_stale=False, error="Stale input commitment"):
    """Keep reviewed source receipts distinct from current bytes under opt-in.

    Only source drift is retainable. Missing/malformed files and every native
    evidence, result, target and selected-proof commitment remain strict.
    """
    if not isinstance(values, list) or not values:
        raise ValueError("Expected nonempty file commitment list")
    stale = []
    for value in values:
        expected = file_commitment(value)
        actual = inputs.commit(expected["path"])
        if actual != expected:
            if not retain_stale:
                raise ValueError(error + ": " + actual["path"])
            stale.append(dict(reviewed=expected, current=actual))
    return stale


class Inputs:
    def __init__(self, root):
        self.root = root.resolve()
        self.commitments = {}

    def path(self, value):
        path = (self.root / value).resolve()
        if not path.is_relative_to(self.root):
            raise ValueError("Input escapes project: " + str(value))
        return path

    def commit(self, value, expected=None):
        path = self.path(value)
        relative = path.relative_to(self.root).as_posix()
        if relative not in self.commitments:
            # Shared SQLite receipts preserve the original archived byte stream's
            # commitment. Hashing the receipt itself would reject valid inputs
            # after lossless inventory migration.
            self.commitments[relative] = dict(path=relative, sha256=file_sha256(path))
        result = self.commitments[relative]
        if result.get("exists") is False:
            raise FileNotFoundError("Explicit commitment names absent file: " + relative)
        if expected is not None and result["sha256"] != expected:
            raise ValueError("Stale input commitment: " + relative)
        return result

    def observe_source(self, value):
        """Ledger navigation candidates can be absent; explicit reviews cannot."""
        original = self.path(value)
        path = current_path(original, self.root).resolve()
        if path != original:
            self.commit("docs/analysis/script-provenance.json")
            self.path(path)
        if path.is_file():
            return self.commit(path)
        relative = path.relative_to(self.root).as_posix()
        result = dict(path=relative, exists=False)
        if relative in self.commitments and self.commitments[relative] != result:
            raise ValueError("Previously observed source disappeared: " + relative)
        self.commitments[relative] = result
        return result

    def load(self, value, expected=None):
        path = self.path(value)
        raw = path.read_bytes()
        actual = dict(path=path.relative_to(self.root).as_posix(), sha256=digest(raw))
        previous = self.commitments.get(actual["path"], actual)
        if previous != actual or expected is not None and actual["sha256"] != expected:
            raise ValueError("Stale input commitment: " + actual["path"])
        self.commitments[actual["path"]] = actual
        return json.loads(raw)

    def stable(self):
        fresh = Inputs(self.root)
        for row in self.commitments.values():
            if row.get("exists") is False:
                if self.path(row["path"]).is_file():
                    raise ValueError("Previously missing source appeared: " + row["path"])
            else:
                fresh.commit(row["path"], row["sha256"])

    def references(self, value):
        """Verify declared file commitments, without interpreting native hashes."""
        if isinstance(value, dict):
            if isinstance(value.get("path"), str) and isinstance(value.get("sha256"), str):
                self.commit(value["path"], value["sha256"])
            else:
                for child in value.values():
                    self.references(child)
        elif isinstance(value, list):
            for child in value:
                self.references(child)


def target_matches(document, target):
    identity = document.get("target", {})
    if identity.get("sha256") != target["sha256"] or identity.get("version") != target["version"]:
        raise ValueError("Stale target identity")
    if "size_bytes" in identity and identity["size_bytes"] != target["size_bytes"]:
        raise ValueError("Stale target size")


def select(document, selector):
    for part in selector:
        document = document[part]
    return document


def declared_results(proof, manifest_path):
    """Canonical exports and raw query results remain explicitly different."""
    declared = {}
    def walk(value):
        if isinstance(value, dict):
            for key, child in value.items():
                if key in ("result", "retained_result", "pseudocode", "extract", "assembly"):
                    if isinstance(child, dict) and set(child) >= {"path", "sha256"}:
                        declared[(child["path"], child["sha256"])] = "manifest_bound_export"
                    elif isinstance(child, str) and isinstance(value.get(key + "_sha256"), str):
                        declared[(child, value[key + "_sha256"])] = "manifest_bound_export"
                elif key == "extracts" and isinstance(child, dict):
                    for name, checksum in child.items():
                        declared[((Path(manifest_path).parent / name).as_posix(), checksum)] = "manifest_bound_export"
                walk(child)
        elif isinstance(value, list):
            for child in value:
                walk(child)
    walk(proof)
    return declared


def review_record(inputs, target, record, retain_stale_source=False):
    """Validate one human-reviewed, bounded claim, never whole-system completion.

    Required keys: id, selector, finding_ids, ownership, conclusion, next_action,
    source_first {paths:[{path,sha256}], conclusion}, evidence {path,sha256},
    query {selector:[JSON keys/indexes], sha256:selected-object canonical digest},
    results:[{path,sha256}]. Query metadata is selected from evidence; result
    artifacts must exist and hash-match. Only exports declared by the selected
    query/range can support its bounded review. Other manifest-declared exports
    remain pending until that exact query/result link is recovered; sharing a
    manifest never transfers a sibling query's evidence.
    """
    for key in ("id", "selector", "finding_ids", "ownership", "conclusion", "next_action"):
        if not record.get(key):
            raise ValueError("Incomplete bounded review: " + key)
    if record["ownership"] not in ("as_specific", "shared_AS_dependency", "generic_context", "unknown"):
        raise ValueError("Invalid reviewed ownership")
    source = record.get("source_first", {})
    if not isinstance(source, dict) or not isinstance(source.get("conclusion"), str) or not source["conclusion"]:
        raise ValueError("Bounded review requires source-first inspection")
    stale_sources = source_commitment_drift(inputs, source.get("paths"), retain_stale_source,
                                            "Stale source review commitment")
    evidence = file_commitment(record["evidence"])
    proof = inputs.load(evidence["path"], evidence["sha256"])
    target_matches(proof, target)
    query = record["query"]
    selected = select(proof, query["selector"])
    if digest(encoded(selected)) != query["sha256"]:
        raise ValueError("Stale query commitment")
    if not isinstance(selected, dict) or not (selected.get("evidence_id") or selected.get("ghidra_evidence_id")):
        raise ValueError("Review query needs retained native evidence identity")
    commitment_list(inputs, record.get("results"))
    declared = declared_results(proof, evidence["path"])
    selected_results = declared_results(selected, evidence["path"])
    receipts, unlinked_results = [], []
    for result in record["results"]:
        key = (result["path"], result["sha256"])
        if key not in declared:
            raise ValueError("Result is not bound by the selected evidence manifest")
        if key not in selected_results:
            unlinked_results.append(result)
            kind = "manifest_declared_unlinked_export"
        else:
            direct = [selected.get(name) for name in ("result", "retained_result")]
            kind = "raw_query_result" if result in direct else selected_results[key]
        receipts.append(dict(result, kind=kind))
    # Verify any raw result/plan/journal commitments carried by that query too.
    inputs.references(selected)
    native_binding = None
    if "raw_input" in selected:
        from discovery_native_subject import verify_native_query_subject
        raw_result = inputs.load(selected["result"]["path"], selected["result"]["sha256"])
        native = raw_result.get("structuredContent") or json.loads(raw_result["content"][0]["text"])
        native_binding = verify_native_query_subject(inputs.root, native, selected, target)
    state = ("pending_source_revalidation" if stale_sources else
             "pending_query_result_linkage" if unlinked_results else "reviewed_bounded")
    semantic_status = ("stale_source_review" if stale_sources else
                       "query_result_linkage_unproved" if unlinked_results else "bounded_review_only")
    return dict(record, state=state, semantic_status=semantic_status,
                ownership="unknown" if stale_sources or unlinked_results else record["ownership"],
                stale_sources=stale_sources, unlinked_results=unlinked_results,
                complete=False, query_metadata=selected, result_receipts=receipts,
                native_subject_binding=native_binding,
                result_limit="Only selected-query/range declarations bind results. Manifest-only exports retain pending linkage; canonical exports are not retained raw query results. No new query was executed.")


def finding_binding(inputs, target, record):
    """Check explicit finding attribution without promoting native semantics.

    Optional reviews-document finding_bindings rows require id, selectors (exact
    queue selectors), finding_ids, conclusion, evidence {path,sha256}, and proof
    {selector:[JSON keys/indexes],sha256:canonical selected-object digest}.
    Evidence must belong to this target; selected artifact commitments are
    checked too. The reviewer supplies attribution, never inferred ownership.
    """
    for key in ("id", "selectors", "finding_ids", "conclusion"):
        if not record.get(key):
            raise ValueError("Incomplete finding binding: " + key)
    selectors = record["selectors"]
    if (not isinstance(selectors, list) or any(not isinstance(value, str) or not value for value in selectors)
            or len(set(selectors)) != len(selectors)):
        raise ValueError("Finding binding needs distinct exact selectors")
    finding_ids = record["finding_ids"]
    if (not isinstance(finding_ids, list) or any(type(value) is not int or value <= 0 for value in finding_ids)
            or len(set(finding_ids)) != len(finding_ids)):
        raise ValueError("Finding binding needs distinct positive finding IDs")
    evidence = file_commitment(record["evidence"])
    document = inputs.load(evidence["path"], evidence["sha256"])
    target_matches(document, target)
    proof = record["proof"]
    selected = select(document, proof["selector"])
    if digest(encoded(selected)) != proof["sha256"]:
        raise ValueError("Stale finding binding proof")
    inputs.references(selected)
    return dict(record, semantic_status="finding_attribution_only", complete=False)


def pending_native_lead(inputs, target, record, retain_stale_source=False):
    """Retain an exact native question without inventing a completed query.

    The evidence selects a hash-bound native_candidate range; its declared
    input receipts and current source-first receipts must remain available.
    This is a producer-result observation, never recovered native semantics.
    """
    for key in ("selector", "next_action"):
        if not isinstance(record.get(key), str) or not record[key].strip():
            raise ValueError("Pending native lead needs " + key)
    if any(record.get(key, expected) != expected for key, expected in
           (("state", "pending"), ("ownership", "unknown"), ("complete", False))):
        raise ValueError("Pending native lead cannot claim reviewed ownership or completion")
    selector = record.get("proof", {}).get("selector")
    if not isinstance(selector, list) or not selector:
        raise ValueError("Pending native lead needs an exact evidence range selector")
    try:
        binding = finding_binding(inputs, target, dict(record, selectors=[record["selector"]]))
        proof = inputs.load(record["evidence"]["path"], record["evidence"]["sha256"])
        span = select(proof, selector)
    except (KeyError, IndexError, TypeError) as error:
        raise ValueError("Invalid pending native evidence range selector") from error
    if (not isinstance(span, dict)
            or any(re.fullmatch(r"0x[0-9a-fA-F]+", str(span.get(key, ""))) is None
                   for key in ("virtual_address", "end_exclusive"))
            or type(span.get("byte_count")) is not int
            or re.fullmatch(r"[0-9a-f]{64}", str(span.get("sha256", ""))) is None):
        raise ValueError("Invalid pending native range or hash")
    start, end = (int(span[key], 16) for key in ("virtual_address", "end_exclusive"))
    if start < 0 or end <= start or span["byte_count"] != end - start:
        raise ValueError("Invalid pending native range length")
    commitment_list(inputs, record.get("inputs"))
    declared = proof.get("inputs")
    if (not isinstance(declared, list) or not declared
            or any(not isinstance(row, dict) or not {"path", "sha256"} <= row.keys() for row in declared)
            or {(row["path"], row["sha256"]) for row in declared}
            != {(row["path"], row["sha256"]) for row in record["inputs"]}):
        raise ValueError("Pending native input commitments differ from evidence")
    source = record.get("source_first", {})
    if not isinstance(source, dict) or not source.get("conclusion"):
        raise ValueError("Pending native lead needs source-first inspection")
    stale_sources = source_commitment_drift(inputs, source.get("paths"), retain_stale_source)
    return dict(binding, native_range=span, state="pending", ownership="unknown",
                semantic_status="pending_native_classification", complete=False,
                stale_sources=stale_sources)


def pending_correspondence_lead(inputs, target, record, retain_stale_source=False):
    """Keep current candidates distinct from established correspondence."""
    for key in ("id", "selector", "conclusion", "next_action"):
        if not isinstance(record.get(key), str) or not record[key].strip():
            raise ValueError("Pending correspondence needs " + key)
    if any(record.get(key, expected) != expected for key, expected in
           (("state", "pending"), ("ownership", "unknown"), ("complete", False))):
        raise ValueError("Pending correspondence cannot claim completion or ownership")
    ids = record.get("finding_ids")
    if not isinstance(ids, list) or not ids or any(type(n) is not int or n <= 0 for n in ids) or len(set(ids)) != len(ids):
        raise ValueError("Pending correspondence needs distinct positive finding IDs")
    evidence = file_commitment(record["evidence"])
    proof = inputs.load(evidence["path"], evidence["sha256"])
    target_matches(proof, target)
    selected = select(proof, record["proof"]["selector"])
    if not isinstance(selected, dict):
        raise ValueError("Pending correspondence proof must select one question")
    if digest(encoded(selected)) != record["proof"]["sha256"]:
        raise ValueError("Stale pending correspondence proof")
    if (selected.get("stable_question_id") != record["id"]
            or selected.get("selector") != record["selector"]
            or selected.get("finding_ids") != ids
            or "current_native_location" not in selected
            or (selected["current_native_location"] is not None and not selected.get("current_native_candidate"))
            or selected.get("semantic_recovery_reset") is not False
            or selected.get("source_implementation_reset") is not False
            or not str(selected.get("applicability", "")).startswith("pending_")):
        raise ValueError("Pending correspondence must preserve an unresolved question")
    predecessor = file_commitment(proof["predecessor"])
    previous = inputs.load(predecessor["path"], predecessor["sha256"])
    prior_leads = previous.get("leads", {})
    prior_leads = prior_leads.values() if isinstance(prior_leads, dict) else prior_leads
    matches = [row for row in prior_leads if isinstance(row, dict) and row.get("stable_question_id") == record["id"]]
    if len(matches) != 1:
        raise ValueError("Pending correspondence needs one exact predecessor question")
    historical = matches[0]
    # Retained switch-frontier producers name their selected range
    # current_native_candidate; the original graph fixtures use native_candidate.
    # Accept either exact historical field, never conflicting aliases.
    if ("native_candidate" in historical and "current_native_candidate" in historical
            and historical["native_candidate"] != historical["current_native_candidate"]):
        raise ValueError("Pending correspondence predecessor candidate aliases conflict")
    historical_candidate = historical.get("native_candidate", historical.get("current_native_candidate"))
    previous_sha = previous.get("target", {}).get("sha256")
    if (re.fullmatch(r"[0-9a-f]{64}", str(previous_sha)) is None or previous_sha == target["sha256"]
            or historical.get("stable_question_id") != record["id"]
            or historical.get("selector") != selected.get("predecessor_selector")
            or historical_candidate != selected.get("historical_native_candidate")):
        raise ValueError("Pending correspondence predecessor identity or range differs")
    source = record.get("source_first", {})
    if not source.get("conclusion") or source.get("paths") != selected.get("current_source_receipts"):
        raise ValueError("Pending correspondence needs matching current source receipts")
    stale_sources = source_commitment_drift(inputs, source["paths"], retain_stale_source)
    candidate = selected.get("current_native_candidate")
    if candidate is not None:
        reference = selected.get("current_candidate_proof", {})
        witness = file_commitment(reference.get("evidence"))
        current = inputs.load(witness["path"], witness["sha256"])
        target_matches(current, target)
        inputs.references(current.get("inputs", []))
        if select(current, reference["selector"]) != candidate:
            raise ValueError("Pending correspondence current candidate differs from its proof")
        location = selected["current_native_location"]
        if location is not None and (not isinstance(location, dict)
                or select(current, reference.get("location_selector", [])) != location):
            raise ValueError("Pending correspondence candidate location differs from its proof")
        try:
            start, end = (int(candidate[key], 16) for key in ("virtual_address", "end_exclusive"))
        except (KeyError, ValueError, TypeError):
            raise ValueError("Invalid pending correspondence candidate range") from None
        if (start < 0 or end <= start or type(candidate.get("byte_count")) is not int
                or candidate["byte_count"] != end - start
                or re.fullmatch(r"[0-9a-f]{64}", str(candidate.get("sha256", ""))) is None):
            raise ValueError("Invalid pending correspondence candidate range")
    return dict(record, historical_native_range=selected["historical_native_candidate"],
                current_native_candidate=candidate, current_candidate_location=selected["current_native_location"],
                predecessor=predecessor, state="pending", ownership="unknown",
                semantic_status="pending_current_correspondence", complete=False,
                stale_sources=stale_sources)


def compose(root, target, paths, generator):
    inputs = Inputs(root)
    inputs.references(generator)
    inputs.references(generator.get("dependencies", []))
    classification = inputs.load(paths["classification"])
    unknown = inputs.load(paths["unknown"])
    ledger = inputs.load(paths["connections"])
    census = inputs.load(paths["census"])
    for document in (classification, unknown, ledger, census):
        target_matches(document, target)
    # Original producer commitments remain separate from this composition tool.
    inputs.references(classification.get("inputs", []))
    inputs.references(unknown.get("inputs", {}))
    inputs.references(ledger.get("inputs", []))
    inputs.references(ledger["current_native_body_census"])
    if ledger["current_native_body_census"]["path"] != paths["census"]:
        raise ValueError("Connection ledger and selected census disagree")
    lead_input = classification["outputs"]["embedded-classification.jsonl"]
    inputs.references(lead_input)
    rows = [json.loads(line) for line in inputs.path(lead_input["path"]).read_text().splitlines()]
    if len(rows) != lead_input["records"] or len({row["selector"] for row in rows}) != len(rows):
        raise ValueError("Embedded row count or selectors changed")
    nodes, edges, queue = {}, {}, {}

    def node(identity, kind, **fields):
        value = dict(id=identity, kind=kind, ownership="unknown", semantic_status="structural_only", **fields)
        if identity in nodes and nodes[identity] != value:
            raise ValueError("Conflicting stable node: " + identity)
        nodes[identity] = value
        return identity

    def edge(parent, child, relation, observation=None):
        value = dict(parent=parent, child=child, relation=relation, evidence=observation)
        identity = digest(encoded(value))
        edges[identity] = dict(id=identity, **value)
        return identity

    def pending(identity, selector, question, parents=(), finding_ids=(41,)):
        queue[identity] = dict(id=identity, selector=selector, state="pending",
                               semantic_status="unreviewed", parent_edges=list(parents),
                               finding_ids=list(finding_ids), next_action=question)

    def reference_edge(identity, family, reference, relation=None):
        address = reference.get("from", reference.get("site", reference.get("site_rva")))
        space = "rva" if family == "relocation_incoming" else "preferred_va"
        normalized = hex(int(address, 16) if isinstance(address, str) else address)
        site = "native-site:" + space + ":" + normalized
        if site not in nodes:
            node(site, "static_reference_site", address=normalized, address_space=space)
        parent = edge(site, identity, relation or family, reference)
        owner = reference.get("source_flow_body")
        if owner:
            body = "native-body:preferred_va:" + hex(int(str(owner), 16))
            if body not in nodes:
                node(body, "flow_body_context", start=hex(int(str(owner), 16)))
            edge(body, site, "observed_body_contains_site", reference)
        return parent

    root_id = node("target:" + target["sha256"], "target", target_identity=target)
    for row in rows:
        identity = node(row["selector"], "embedded_candidate", native_range={key: row[key] for key in
                        ("file_offset", "virtual_address", "byte_count", "sha256")},
                        observed_category=row["category"], observed_classification=row["classification"],
                        producer_row_sha256=digest(encoded(row)))
        parents = [edge(root_id, identity, "inventory_contains", lead_input)]
        for family in ("ghidra_incoming", "encoded_incoming", "relocation_incoming"):
            for reference in row.get(family, []):
                parents.append(reference_edge(identity, family, reference))
        for occurrence in row.get("source_literal_occurrences", []):
            source = inputs.observe_source(occurrence["path"])
            sid = "source:" + source["path"]
            if sid not in nodes:
                node(sid, "source_file", commitment=source)
            edge(identity, sid, "lexical_candidate_not_ownership", occurrence)
        pending(identity, row["selector"], "Inspect local source first; trace native producer/dispatch/consumer and classify this exact lead.", parents)

    # Containers are optional in historical classification manifests. A static
    # reference to their descriptor, to their bytes and to an interior regex
    # candidate are separate observations; never transfer one onto another.
    container_input = classification["outputs"].get("string-containers.jsonl")
    if container_input is not None:
        inputs.references(container_input)
        containers = [json.loads(line) for line in inputs.path(container_input["path"]).read_text().splitlines()]
        if len(containers) != container_input["records"] or len({row["selector"] for row in containers}) != len(containers):
            raise ValueError("String-container row count or selectors changed")
        candidates = {row["selector"]: row for row in rows}
        image_base = classification.get("preferred_image_base")
        if image_base is not None and (type(image_base) is not int or image_base < 0):
            raise ValueError("Invalid preferred image base")

        def check_reference_destination(reference, start, length):
            destination = reference.get("to", reference.get("target"))
            address = int(destination, 16) if isinstance(destination, str) else destination
            if type(address) is not int or not start <= address < start + length:
                raise ValueError("Container reference destination is outside its declared range")

        for row in containers:
            start, length = row.get("preferred_va"), row.get("byte_count")
            if (type(start) is not int or start < 0 or type(length) is not int or length <= 0
                    or re.fullmatch(r"[0-9a-f]{64}", str(row.get("sha256", ""))) is None
                    or row.get("end_exclusive", start + length) != start + length):
                raise ValueError("Invalid string-container range or hash")
            selectors = row.get("candidate_selectors")
            if (not isinstance(selectors, list) or any(not isinstance(value, str) for value in selectors)
                    or len(set(selectors)) != len(selectors)):
                raise ValueError("String container needs distinct exact candidate selectors")
            identity = node("string-container:" + row["selector"], "observed_string_container",
                            native_range=dict(preferred_va=hex(start), byte_count=length, sha256=row["sha256"]),
                            observed_role=row.get("role", "unresolved"), producer_row_sha256=digest(encoded(row)))
            parents = [edge(root_id, identity, "observed_string_container_bytes_not_schema", container_input)]
            for selector in selectors:
                candidate = candidates.get(selector)
                if candidate is None:
                    raise ValueError("String container names unknown candidate selector: " + selector)
                at = int(candidate["virtual_address"], 16)
                if not start <= at < at + candidate["byte_count"] <= start + length:
                    raise ValueError("String-container candidate is outside its exact payload range")
                edge(identity, selector, "contains_candidate_bytes_not_semantic_ownership",
                     dict(container=container_input, container_selector=row["selector"], candidate_selector=selector))
            for family in ("ghidra_incoming", "encoded_incoming"):
                for reference in row.get(family, []):
                    check_reference_destination(reference, start, length)
                    parents.append(reference_edge(identity, family, reference, "container_payload_" + family))
            descriptor_rva = row.get("descriptor_rva")
            if descriptor_rva is not None:
                if type(descriptor_rva) is not int or descriptor_rva < 0:
                    raise ValueError("Invalid string-container descriptor RVA")
                descriptor_range = dict(rva=hex(descriptor_rva), byte_count=16)
                if image_base is not None:
                    descriptor_range["preferred_va"] = hex(image_base + descriptor_rva)
                if row.get("descriptor_sha256") is not None:
                    if re.fullmatch(r"[0-9a-f]{64}", str(row["descriptor_sha256"])) is None:
                        raise ValueError("Invalid descriptor byte hash")
                    descriptor_range["sha256"] = row["descriptor_sha256"]
                descriptor = node("string-descriptor:" + row["selector"], "encoded_pointer_length_descriptor_candidate",
                                  native_range=descriptor_range,
                                  native_type_status="unresolved", producer_row_sha256=digest(encoded(row)))
                parent = edge(descriptor, identity, "encoded_pointer_length_candidate_not_native_type",
                              dict(container=container_input, container_selector=row["selector"]))
                descriptor_parents = [edge(root_id, descriptor, "observed_descriptor_bytes_not_native_type", container_input)]
                for family in ("ghidra_incoming", "encoded_incoming"):
                    for reference in row.get("descriptor_" + family, []):
                        if image_base is not None:
                            check_reference_destination(reference, image_base + descriptor_rva, 16)
                        descriptor_parents.append(reference_edge(descriptor, family, reference, "container_descriptor_" + family))
                pending(descriptor, row["selector"] + ":descriptor",
                        "Inspect local source first; recover the actual descriptor type, length/bounds and pointer producers before assigning payload-consumer behavior.",
                        descriptor_parents)
                parents.append(parent)
            elif row.get("descriptor_ghidra_incoming") or row.get("descriptor_encoded_incoming"):
                raise ValueError("Descriptor references have no declared descriptor RVA")
            if row.get("source"):
                source = file_commitment(row["source"])
                inputs.commit(source["path"], source["sha256"])
                sid = "source:" + source["path"]
                if sid not in nodes:
                    node(sid, "source_file", commitment=source)
                edge(sid, identity, "source_payload_byte_candidate_not_native_consumer_equivalence", source)
            pending(identity, row["selector"],
                    "Inspect local source first; trace this exact payload and descriptor through current native producers/dispatch/consumers. Static containment does not establish a schema or AS ownership.", parents)
    for system in ledger["systems"]:
        identity = node("module:" + system["id"], "registered_module_context", diagnostic_path=system["original_path"],
                        finding_ids=system["gap_ids"], registered_contract=system["registered_current_bounded_contract_present"])
        parents = [edge(root_id, identity, "registered_diagnostic_context_not_semantics")]
        for address in system.get("location_body_owners", []):
            start = hex(int(address, 16))
            body = "native-body:preferred_va:" + start
            if body not in nodes:
                node(body, "flow_body_context", start=start)
            edge(identity, body, "diagnostic_body_owner_not_semantic_ownership",
                 dict(path=paths["connections"], selector="systems[id=" + system["id"] + "].location_body_owners", address=address))
        for address in system.get("ownerless_location_sites", []):
            start = hex(int(address, 16))
            site = "native-site:preferred_va:" + start
            if site not in nodes:
                node(site, "static_reference_site", address=start, address_space="preferred_va")
            parent = edge(identity, site, "diagnostic_site_without_flow_owner",
                          dict(path=paths["connections"], selector="systems[id=" + system["id"] + "].ownerless_location_sites", address=address))
            pending("ownerless:" + system["id"] + ":" + start,
                    "systems[id=" + system["id"] + "].ownerless_location_sites[address=" + address + "]",
                    "Inspect exact diagnostic instruction/interior/data site and its incoming control flow before assigning a native function or source behavior.", [parent])
        for source_path in system["source_refs"]:
            source = inputs.observe_source(source_path)
            sid = "source:" + source["path"]
            if sid not in nodes:
                node(sid, "source_file", commitment=source)
            edge(identity, sid, "registered_source_correspondence_not_equivalence", source)
        for path in system.get("current_bounded_contract_refs", []):
            reference = inputs.commit(path)
            cid = "contract:" + path
            if cid not in nodes:
                node(cid, "registered_contract_artifact", commitment=reference)
            edge(identity, cid, "registered_bounded_contract_not_whole_module", reference)
        pending(identity, "systems[id=" + system["id"] + "]", "Review registered bounded contracts and actual source consumers; preserve missing dimensions and runtime/parity limits.", parents, system["gap_ids"])

    def selectors(value, route=()):
        if isinstance(value, dict):
            if isinstance(value.get("selector"), str):
                identity = "unknown-selector:" + "/".join(map(str, route))
                node(identity, "residual_selector", selector=value["selector"], record=value)
                parent = edge(root_id, identity, "unknown_queue_selector", dict(path=paths["unknown"], json_path=list(route)))
                pending(identity, value["selector"], value.get("question", "Resolve this exact residual selector through source-first, bounded REA/Ghidra classification; retain unresolved dynamic aliases."), [parent], value.get("gap_ids", [41]))
            for key, child in value.items():
                selectors(child, route + (key,))
        elif isinstance(value, list):
            for index, child in enumerate(value):
                selectors(child, route + (index,))
    selectors(unknown)
    # This historical schema stores the ownerless diagnostic-site selector as a
    # scalar rather than a {selector: ...} row; retain it without dropping it.
    diagnostic_sites = unknown.get("diagnostic_selectors", {}).get("sites")
    if diagnostic_sites:
        identity = node("unknown-selector:diagnostic_selectors/sites", "residual_selector", selector=diagnostic_sites)
        parent = edge(root_id, identity, "unknown_queue_selector", dict(path=paths["unknown"], json_path=["diagnostic_selectors", "sites"]))
        pending(identity, diagnostic_sites, "Follow each exact diagnostic site into actual flow ownership; retain ownerless interior/data cases and missing AS interface proof.", [parent])
    reviews, bindings, native_leads, correspondence_leads = [], [], [], []
    if paths.get("reviews"):
        document = inputs.load(paths["reviews"])
        target_matches(document, target)
        for record in document["reviews"]:
            review = review_record(inputs, target, record, paths.get("retain_stale_source_reviews", False))
            identity = "review:" + review["id"]
            if identity in nodes:
                raise ValueError("Duplicate review ID")
            node(identity, "explicit_bounded_review", review=review)
            nodes[identity]["ownership"] = review["ownership"]
            nodes[identity]["semantic_status"] = review["semantic_status"]
            parent = review.get("parent", root_id)
            if parent not in nodes:
                raise ValueError("Unknown review parent")
            parent_edge = edge(parent, identity, "bounded_review_not_transitive_ownership")
            queue[identity] = dict(id=identity, selector=review["selector"], state=review["state"],
                                   semantic_status=review["semantic_status"], parent_edges=[parent_edge],
                                   finding_ids=review["finding_ids"], next_action=review["next_action"],
                                   review_commitment=digest(encoded(review)))
            reviews.append(review)
        for record in document.get("pending_native_leads", []):
            lead = pending_native_lead(inputs, target, record, paths.get("retain_stale_source_reviews", False))
            identity = "pending-native:" + lead["id"]
            if identity in nodes:
                raise ValueError("Duplicate pending native lead ID")
            node(identity, "explicit_pending_native_lead", lead=lead,
                 native_range=lead["native_range"], finding_ids=lead["finding_ids"])
            nodes[identity]["semantic_status"] = lead["semantic_status"]
            parent = edge(root_id, identity, "native_candidate_question_not_semantic_ownership",
                          dict(evidence=lead["evidence"], proof=lead["proof"]))
            pending(identity, lead["selector"], lead["next_action"], [parent], lead["finding_ids"])
            queue[identity]["semantic_status"] = lead["semantic_status"]
            queue[identity]["evidence_commitment"] = digest(encoded(lead))
            native_leads.append(lead)
        for record in document.get("pending_correspondence_leads", []):
            lead = pending_correspondence_lead(inputs, target, record, paths.get("retain_stale_source_reviews", False))
            identity = "pending-correspondence:" + lead["id"]
            if identity in nodes:
                raise ValueError("Duplicate pending correspondence ID")
            node(identity, "explicit_pending_correspondence", lead=lead,
                 historical_native_range=lead["historical_native_range"],
                 current_native_candidate=lead["current_native_candidate"],
                 current_candidate_location=lead["current_candidate_location"], finding_ids=lead["finding_ids"])
            nodes[identity]["semantic_status"] = lead["semantic_status"]
            parent = edge(root_id, identity, "retained_question_current_correspondence_pending",
                          dict(evidence=lead["evidence"], proof=lead["proof"]))
            pending(identity, lead["selector"], lead["next_action"], [parent], lead["finding_ids"])
            queue[identity]["semantic_status"] = lead["semantic_status"]
            queue[identity]["evidence_commitment"] = digest(encoded(lead))
            correspondence_leads.append(lead)
        # Every queue family must exist before exact attribution is resolved.
        for record in document.get("finding_bindings", []):
            binding = finding_binding(inputs, target, record)
            identity = "finding-binding:" + binding["id"]
            if identity in nodes:
                raise ValueError("Duplicate finding binding ID")
            node(identity, "explicit_finding_binding", binding=binding)
            for selector in binding["selectors"]:
                matches = [row for row in queue.values() if row["selector"] == selector]
                if len(matches) != 1:
                    raise ValueError("Finding binding needs one exact queue selector: " + selector)
                entry = matches[0]
                entry["finding_ids"] = sorted(set(entry["finding_ids"]) | set(binding["finding_ids"]))
                entry.setdefault("finding_binding_ids", []).append(identity)
                entry["parent_edges"].append(edge(identity, entry["id"], "explicit_finding_attribution_not_semantic_ownership"))
                if entry["id"] in nodes:
                    nodes[entry["id"]]["finding_ids"] = entry["finding_ids"]
            bindings.append(binding)
    inputs.stable()
    commitments = sorted(inputs.commitments.values(), key=lambda value: value["path"])
    profile = dict(schema_version=1, target=target, generator=generator, inputs=commitments,
                   review_source_policy="retain_stale_as_pending" if paths.get("retain_stale_source_reviews") else "reject_stale")
    profile_id = digest(encoded(profile))
    graph = dict(schema_version=1, target=target, profile_id=profile_id,
                 nodes=sorted(nodes.values(), key=lambda value: value["id"]),
                 edges=sorted(edges.values(), key=lambda value: value["id"]))
    work = dict(schema_version=1, target=target, profile_id=profile_id,
                entries=sorted(queue.values(), key=lambda value: value["id"]),
                stages={str(stage): "partial" for stage in range(1, 7)},
                semantic_frontier_closed=False, global_native_semantics_complete=False, parity_verified=False)
    journal = dict(schema_version=1, profile_id=profile_id, target=target,
                   events=[dict(operation="compose_structural_frontier", state="complete", embedded_rows=len(rows))]
                   + [dict(operation="retain_explicit_review", id=r["id"], state=r["state"],
                           commitment=digest(encoded(r))) for r in reviews]
                   + [dict(operation="retain_finding_attribution", id=b["id"],
                           commitment=digest(encoded(b))) for b in bindings]
                   + [dict(operation="retain_pending_native_question", id=lead["id"], state="pending",
                           commitment=digest(encoded(lead))) for lead in native_leads]
                   + [dict(operation="retain_pending_correspondence", id=lead["id"], state="pending",
                           commitment=digest(encoded(lead))) for lead in correspondence_leads],
                   resume_rule="Only this exact target/input/query/result profile resumes. Changed commitments select a new immutable profile; old profiles remain retained.")
    return profile, graph, work, journal


def retain(directory, documents, check=False):
    """Exact recomposition detects forged completion/status promotion."""
    if check and not directory.is_dir():
        raise ValueError("No saved profile for these exact commitments")
    if not check:
        directory.mkdir(parents=True, exist_ok=True)
    for name, document in zip(("profile.json", "graph.json", "queue.json", "journal.json"), documents):
        path, data = directory / name, encoded(document)
        if path.exists():
            if path.read_bytes() != data:
                raise ValueError("Saved profile/status differs from verified inputs: " + name)
        elif check:
            raise ValueError("Incomplete saved profile: " + name)
        else:
            staging = directory / (name + ".pending")
            staging.write_bytes(data)
            staging.replace(path)


def main():
    from coverage_common import ROOT, latest_target
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--classification", default="docs/analysis/evidence/0.115.0/data-classification/manifest.json")
    parser.add_argument("--unknown", default="docs/analysis/evidence/0.115.0/unknown-recovery.json")
    parser.add_argument("--connections", default="docs/analysis/coverage/exe-connections.json")
    parser.add_argument("--census", default="docs/analysis/coverage/full-image-census.json")
    parser.add_argument("--reviews", help="Project-local explicit bounded review JSON")
    parser.add_argument("--retain-stale-source-reviews", action="store_true",
                        help="Preserve stale source snapshots in bounded reviews and pending native/correspondence leads, never as current reviewed source")
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--write", action="store_true")
    modes.add_argument("--check", action="store_true")
    args = parser.parse_args()
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "sha256", "size_bytes")}
    generator = dict(path="scripts/compose-as-discovery.py", sha256=digest(Path(__file__).read_bytes()),
                     dependencies=[dict(path=name, sha256=digest((ROOT / name).read_bytes())) for name in
                                   ("scripts/script_sources.py", "scripts/coverage_common.py",
                                    "scripts/discovery_native_subject.py", "scripts/inventory-executable.py")])
    documents = compose(ROOT, target, vars(args), generator)
    directory = ROOT / "runtime/coverage" / target["sha256"] / "as-discovery" / documents[1]["profile_id"]
    if args.write or args.check:
        retain(directory, documents, args.check)
    print(json.dumps(dict(profile=directory.relative_to(ROOT).as_posix(), written=args.write, checked=args.check,
                          nodes=len(documents[1]["nodes"]), edges=len(documents[1]["edges"]),
                          queue_states=dict(Counter(row["state"] for row in documents[2]["entries"])),
                          all_six_discovery_stages="partial", parity_verified=False), indent=2))


if __name__ == "__main__":
    main()

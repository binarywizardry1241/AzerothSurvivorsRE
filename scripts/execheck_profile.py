"""Portable automated execheck stages; review/selection is an explicit frontier.

Native discovery may need further seed expansions after reviewing the first
expanded pass. The DAG does not turn an unreviewed frontier into a final census.
"""


def profile():
    stages = []
    def stage(name, script, arguments=(), *, needs=(), inputs=(), outputs=(), phase="scan", memory=1024, cache=True, resources=()):
        stages.append(dict(id=name, argv=["{python}", "-B", "scripts/" + script, *arguments],
                           tools=["scripts/" + script], needs=list(needs), inputs=list(inputs), outputs=list(outputs),
                           phase=phase, memory_mb=memory, cache=cache, resources=list(resources)))
    coverage = "docs/analysis/coverage/"
    runtime = "runtime/coverage/{target_sha}/"
    # Full byte scans and diagnostic reconstruction remain mandatory every audit.
    stage("pe", "inventory-current-target.py", ["--write"], outputs=[coverage+"native-summary.json", runtime+"inventory.json"], cache=False)
    stage("pe-check", "inventory-current-target.py", ["--check"], needs=["pe"], inputs=[coverage+"native-summary.json"], cache=False)
    stage("file-ranges", "inventory-target-ranges.py", ["--write"], needs=["pe"], inputs=[coverage+"native-summary.json"], outputs=[coverage+"file-range-summary.json", runtime+"file-ranges.json"], cache=False)
    stage("diagnostics", "discover-native-ownership.py", ["--write"], needs=["pe"], inputs=[coverage+"native-summary.json", coverage+"systems.json"], outputs=[coverage+"diagnostic-ownership.json", runtime+"diagnostic-ownership.json"], cache=False)
    stage("diagnostics-check", "discover-native-ownership.py", ["--check"], needs=["diagnostics"], inputs=[coverage+"diagnostic-ownership.json", coverage+"systems.json"], cache=False)
    for entry in stages:
        entry["fresh_each_audit"] = True
    stage("menu-identity", "recover-menu-identity.py", ["--write"], needs=["pe"],
          inputs=[coverage+"native-summary.json", "scripts/inventory-executable.py"],
          outputs=["crates/azeroth-survivors-re/assets/menu-identity/{version}.json"])
    stage("linear", "inventory-native-instructions.py", ["--write"], needs=["pe"], inputs=[coverage+"native-summary.json"], outputs=[coverage+"instruction-summary.json"], memory=2048)
    stage("complement", "inventory-unwind-complement.py", ["--write"], needs=["linear"], inputs=[coverage+"native-summary.json", coverage+"instruction-summary.json"], outputs=[coverage+"unwind-complement-summary.json", runtime+"unwind-complement.sqlite"], memory=2048)
    stage("mpq", "inventory-current-mpq-members.py", ["--write"], needs=["pe"], inputs=[coverage+"native-summary.json"], outputs=["docs/analysis/evidence/mpq-member-coverage.json"], memory=2048)
    rawfiles = ("plan.json", "progress.json", "session-result.json", "instructions.tsv.gz", "bodies.tsv.gz", "references.tsv.gz", "externals.tsv.gz", "direct-call-helpers.tsv.gz")
    stage("declared", "census-native-image.py", ["--run", "--seed-scope", "declared", "--output", "{work}/declared", "--heap", "6G"],
          needs=["pe"], inputs=[coverage+"native-summary.json", "package-lock.json"],
          outputs=["{work}/declared/"+name for name in rawfiles], phase="native", memory=7000, cache=False, resources=["ghidra-program:{target_sha}"])
    stage("verify-declared", "summarize-native-image.py", ["--input", "{work}/declared", "--artifact-directory", "{work}/verify-declared-{summary_profile}", "--summary-output", "{work}/declared-summary.json", "--write"],
          needs=["declared", "diagnostics"], inputs=[*["{work}/declared/"+name for name in rawfiles], coverage+"diagnostic-ownership.json"], outputs=["{work}/declared-summary.json"], phase="native", memory=2048)
    basis = "{work}/declared-summary.json"
    for name, script, args, output in (
        ("jump-input", "recover-native-jump-tables.py", ["--inventory-output", "{work}/leads/guarded.json", "--summary-output", "{work}/leads/jump-summary.json"], "{work}/leads/jump-summary.json"),
        ("import-input", "recover-native-import-thunks.py", ["--inventory-output", "{work}/leads/imports.json", "--summary-output", "{work}/leads/import-summary.json"], "{work}/leads/import-summary.json"),
        ("unwind-input", "recover-native-unwind-handlers.py", ["--inventory-output", "{work}/leads/unwind.json", "--summary-output", "{work}/leads/unwind-summary.json"], "{work}/leads/unwind-summary.json"),
        ("diagnostic-input", "prepare-native-diagnostic-leads.py", ["--inventory-output", "{work}/leads/diagnostics.json"], "{work}/leads/diagnostics.json"),
        ("operand-input", "audit-native-operands.py", ["--inventory-output", "{work}/leads/operands.jsonl.gz", "--summary-output", "{work}/leads/operand-summary.json"], "{work}/leads/operand-summary.json"),
    ):
        stage(name, script, ["--census-summary", basis, *args, "--write"], needs=["verify-declared"], inputs=[basis, coverage+"diagnostic-ownership.json"], outputs=[output], phase="native", memory=2048)
    stage("address-input", "recover-native-address-leads.py", ["--operand-summary", "{work}/leads/operand-summary.json", "--inventory-output", "{work}/leads/addresses.json", "--summary-output", "{work}/leads/address-summary.json", "--write"],
          needs=["operand-input"], inputs=["{work}/leads/operand-summary.json"], outputs=["{work}/leads/address-summary.json"], phase="native")
    lead_files = ["{work}/leads/"+name for name in ("jump-summary.json", "import-summary.json", "unwind-summary.json", "diagnostics.json", "address-summary.json")]
    stage("expanded", "census-native-image.py", ["--run", "--seed-scope", "all", "--primary-summary", basis, "--jump-tables", lead_files[0], "--import-thunks", lead_files[1], "--unwind-handlers", lead_files[2], "--diagnostic-leads", lead_files[3], "--address-leads", lead_files[4], "--output", "{work}/expanded", "--heap", "6G"],
          needs=["jump-input", "import-input", "unwind-input", "diagnostic-input", "address-input", "complement"], inputs=[basis, *lead_files, coverage+"unwind-complement-summary.json", "package-lock.json"], outputs=["{work}/expanded/"+name for name in rawfiles], phase="native", memory=7000, cache=False, resources=["ghidra-program:{target_sha}"])
    stage("verify-expanded", "summarize-native-image.py", ["--input", "{work}/expanded", "--artifact-directory", "{work}/verify-expanded-{summary_profile}", "--summary-output", "{work}/expanded-summary.json", "--write"],
          needs=["expanded"], inputs=["{work}/expanded/"+name for name in rawfiles], outputs=["{work}/expanded-summary.json"], phase="native", memory=2048)
    selected = "{census_summary}"
    stage("operands", "audit-native-operands.py", ["--census-summary", selected, "--inventory-output", "{work}/derived/operands.jsonl.gz", "--summary-output", "{work}/derived/operands.json", "--write"],
          needs=["diagnostics-check"], inputs=[selected, coverage+"diagnostic-ownership.json"], outputs=["{work}/derived/operands.json"], phase="derive", memory=2048)
    for name, script, output in (("dispatch", "audit-native-dispatch.py", "dispatch-boundaries.json"), ("constant-dispatch", "audit-native-constant-dispatch.py", "constant-register-dispatch.json")):
        stage(name, script, ["--census-summary", selected, "--artifact-directory", "{work}/derived", "--write"], needs=["diagnostics-check"], inputs=[selected], outputs=["{work}/derived/"+output], phase="derive", memory=2048)
    stage("ownership", "classify-native-ownership.py", ["--census-summary", selected, "--operand-summary", "{work}/derived/operands.json", "--artifact-directory", "{work}/derived", "--output", "{work}/derived/ownership.json", "--write"],
          needs=["operands", "dispatch", "constant-dispatch"], inputs=[selected, "{work}/derived/operands.json", coverage+"systems.json", "crates/**/*.rs"], outputs=["{work}/derived/ownership.json"], phase="derive", memory=2048)
    # Reconciliation uses the selected, reviewed census and existing canonical
    # evidence choices. A new native frontier must be reviewed/published first.
    stage("custom", "summarize-custom-native-coverage.py", ["--census-summary", selected, "--write"], needs=["ownership"], inputs=[selected, coverage+"systems.json", "crates/**/*.rs"], outputs=["docs/analysis/evidence/native-custom-coverage.json"], phase="reconcile")
    stage("history", "revalidate-historical-native-ranges.py", ["--census-summary", selected, "--write"], needs=["custom"], inputs=[selected, coverage+"systems.json", "docs/analysis/evidence/**/*.json"], outputs=[coverage+"historical-range-revalidation.json"], phase="reconcile", memory=2048)
    stages[-1]["git_history"] = True
    stages[-1].update(cache=False, transitive_inputs=False)
    stage("selection", "check-full-image-native.py", ["--write"], needs=["history"], inputs=[selected, coverage+"native-ownership-classification.json", coverage+"native-jump-tables.json", coverage+"historical-range-revalidation.json"], outputs=[coverage+"native-image-current.json"], phase="reconcile")
    # The connection audit validates the selected target of this ledger. Generate
    # it first so a new target cannot consume the predecessor's changelog.
    stage("changelog", "index-current-changelog.py", ["--write"], needs=["selection"], inputs=["docs/CHANGELOG.md", coverage+"systems.json", coverage+"changelog-reviews.json"], outputs=[coverage+"changelog.json"], phase="reconcile")
    # Connections index the residual receipt as evidence. Publish it first so
    # the index records its current bytes and never feeds them back to its writer.
    residual_inputs = ("native-summary.json", "diagnostic-ownership.json", "file-range-summary.json",
                       "instruction-summary.json", "unwind-complement-summary.json", "native-image-current.json")
    stage("unknown", "summarize-refresh-unknowns.py", ["--census-summary", selected, "--write"],
          needs=["selection"], inputs=[selected, *(coverage+name for name in residual_inputs)],
          outputs=["docs/analysis/evidence/unknown-recovery.json"], phase="reconcile", cache=False)
    stage("connections", "audit-exe-connections.py", ["--census-summary", selected, "--write"], needs=["unknown", "changelog"], inputs=[selected, coverage+"systems.json", coverage+"historical-range-revalidation.json", coverage+"changelog.json", "docs/analysis/evidence/**/*.json", "crates/**/*.rs"], outputs=[coverage+"exe-connections.json"], phase="reconcile")
    stages[-1].update(cache=False, transitive_inputs=False)
    stage("accounting", "check-reconstruction-coverage.py", needs=["connections", "menu-identity"], inputs=["docs/analysis/coverage/*.json", "docs/CURRENT-STATE.md", "docs/verification-needed.md"], phase="reconcile", cache=False)
    return {"format": "execheck-dag-v1", "stages": stages}

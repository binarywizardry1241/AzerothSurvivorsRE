#!/usr/bin/env python3
"""Stage hash-bound 0.108.0 REA/Ghidra minion plans without starting analysis."""
import hashlib
import importlib.util
import json

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
DISABLED = "Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables"


def main():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover fresh addresses for the changed target"
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("minion_rea_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    output = ROOT / "runtime/boss-minions-0.108.0/rea-preparation"
    output.mkdir(parents=True, exist_ok=True)
    spans = []
    for name, start, end in (("actor", 0x145971120, 0x145976768),
                             ("dispatch", 0x145950BF0, 0x145956052),
                             ("constructor", 0x145966BE0, 0x1459678FE)):
        assert bounds[start] == end
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        path = output / (name + ".bin")
        path.write_bytes(raw)
        spans.append(dict(role=name, va=hex(start), end_exclusive=hex(end),
                          file_offset=hex(offset), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest()))
        entry = start
        environment = {"REA_GHIDRA_DISABLED_ANALYZERS": DISABLED}
        if name == "dispatch":
            # The third table entry is selected only after the current native
            # tag normalization; current tag5 is the summon-count payload.
            table = 0x1471F2B2C
            import struct
            entry = table + struct.unpack_from("<i", data, pe.rva_offset(table - pe.image_base) + 8)[0]
            assert entry == 0x14595245B
            seed = output / "summon-seed.tsv"
            seed.write_text(f"{entry:#x}\tfunction\n{entry:#x}\tcode\n")
            environment["REA_GHIDRA_SEED_FILE"] = str(seed.relative_to(ROOT))
        plan = dict(target=str(path.relative_to(ROOT)), output=str((output / name).relative_to(ROOT)),
                    init_timeout=60, timeout=240, environment=environment,
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(entry)))])
        (output / (name + "-plan.json")).write_text(json.dumps(plan, indent=2) + "\n")
    (output / "input-spans.json").write_text(json.dumps(dict(target_sha256=SHA, spans=spans,
        limits="Exact PE bytes imported at original VAs. External code/data and Win64 calling conventions need separate instruction review."), indent=2) + "\n")
    print(output.relative_to(ROOT))


if __name__ == "__main__":
    main()

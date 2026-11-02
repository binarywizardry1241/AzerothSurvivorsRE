#!/usr/bin/env python3
"""Verify the current native Data-directory interface and its live AS adapter.

Pure byte/manifest/source checking. No compiler, application or filesystem
candidate discovery is invoked. --stage writes a proposed proof under runtime;
default reproduces the curated proof after the AS source delegation is applied.
"""
import argparse
from collections import defaultdict
import hashlib
import json
import re
import struct
import tomllib

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
WORK = ROOT/"runtime/q41-data-0.115.0/mount"
KEEP = ROOT/"docs/analysis/evidence/0.115.0/data-directory/manifest.json"
SPANS = {
    "candidate_paths": (0x145b81690,0x145b8198f,"9f34c9ac0db5fe4ec72e259ecbc8d0ed9f5b27db64eb790a435d0566daa3a7c5"),
    "first_existing_directory": (0x145b81cc0,0x145b81e23,"5df9eb86cf0f5e87ef31eaf2df291539d6ea43195e4c9cc34ab0392592fc0a5a"),
    "native_chain_open": (0x145bd0f80,0x145bd1e01,"4d023ca470bba14c3c57067bccacb7e466d09d12269a7d0920824806c5fd8104"),
    "cached_named_member_consumer": (0x145814f10,0x145815894,"03ca456c999b8f67882b5880528f501d5cb6c8c81ee5837331d187da0aea2311"),
}
QUERY_LABELS = dict(candidate_paths="WOW_DATA-reader",first_existing_directory="existing-directory-selector",
    native_chain_open="MPQ-error-neighborhood-owner",cached_named_member_consumer="AS-Data-mount-caller")


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(),sha256=file_sha256(path))


def feature_closure():
    """Conservative union of all platform local dependency features for this app.

    This checks source declarations, not Cargo resolution/runtime behavior. All
    platform branches and build dependencies are included, so an inactive branch
    cannot conceal a local dev feature. External registry packages cannot enable
    features of these distinct path package identities.
    """
    root_path = ROOT/"Cargo.toml"
    root = tomllib.loads(root_path.read_text())
    assert root["workspace"]["resolver"] == "2"
    assert root["workspace"]["default-members"] == ["crates/azeroth-survivors-re"]
    workspace = root.get("workspace",{}).get("dependencies",{})
    initial = ROOT/"crates/azeroth-survivors-re/Cargo.toml"
    manifests = {initial:tomllib.loads(initial.read_text())}
    activated = defaultdict(set)
    activated[initial].add("default")
    edges = {}
    changed = True
    while changed:
        changed = False
        for path,data in list(manifests.items()):
            local_features = data.get("features",{})
            requested,enabled_dependencies = defaultdict(set),set()
            expanded = set(activated[path])
            pending = list(expanded)
            while pending:
                feature = pending.pop()
                for entry in local_features.get(feature,[]):
                    if entry.startswith("dep:"):
                        enabled_dependencies.add(entry[4:])
                    elif "/" in entry:
                        name,target_feature = entry.split("/",1)
                        if not name.endswith("?"): enabled_dependencies.add(name)
                        requested[name.rstrip("?")].add(target_feature)
                    elif entry in local_features and entry not in expanded:
                        expanded.add(entry);pending.append(entry)
                    elif entry not in local_features:
                        enabled_dependencies.add(entry)
            if expanded != activated[path]: activated[path] = expanded;changed = True
            tables = [data.get("dependencies",{}),data.get("build-dependencies",{})]
            for target in data.get("target",{}).values():
                tables.extend([target.get("dependencies",{}),target.get("build-dependencies",{})])
            for table in tables:
                for name,spec in table.items():
                    if not isinstance(spec,dict): continue
                    path_base = path.parent
                    if spec.get("workspace"):
                        inherited = workspace[name]
                        if not isinstance(inherited,dict): continue
                        # Workspace paths are relative to the workspace root;
                        # inherited and member feature requests are additive.
                        spec = {**inherited,**spec,"features":sorted(set(inherited.get("features",[]))|set(spec.get("features",[])))}
                        spec["default-features"] = inherited.get("default-features",True) or spec.get("default-features",False)
                        path_base = ROOT
                    if "path" not in spec: continue
                    if spec.get("optional") and name not in enabled_dependencies: continue
                    target = (path_base/spec["path"]/"Cargo.toml").resolve()
                    assert target.is_relative_to(ROOT)
                    if target not in manifests:
                        manifests[target] = tomllib.loads(target.read_text());changed = True
                    features = set(spec.get("features",[]))|requested[name]
                    if spec.get("default-features",True): features.add("default")
                    before = len(activated[target]);activated[target].update(features)
                    if len(activated[target]) != before: changed = True
                    key = (path.relative_to(ROOT).as_posix(),name,target.relative_to(ROOT).as_posix())
                    previous = edges.get(key)
                    row = dict(source_manifest=key[0],dependency=name,target_manifest=key[2],
                        requested_features=sorted(features),default_features=spec.get("default-features",True))
                    if previous:
                        row["requested_features"] = sorted(set(previous["requested_features"])|features)
                        row["default_features"] |= previous["default_features"]
                    edges[key] = row
    target = ROOT/"crates/benilla-formats/Cargo.toml"
    assert target in manifests and "dev" not in activated[target]
    return dict(root=commitment(root_path),
        manifests=[commitment(path) for path in sorted(manifests)],
        active_features={path.relative_to(ROOT).as_posix():sorted(features) for path,features in sorted(activated.items())},
        local_edges=[edges[key] for key in sorted(edges)],
        benilla_formats_dev_enabled=False,
        limit="Conservative source-declaration union for this application and all platform/build dependency branches; no Cargo invocation, registry resolution or compilation.")


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--stage",action="store_true")
    ap.add_argument("--prepare",action="store_true",help="write/verify exact raw ranges and durable query plans only")
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("data_directory_PE",ROOT/"scripts/inventory-executable.py").PE(image)
    def bytes_at(va,n):
        at = pe.rva_offset(va-pe.image_base)
        return image[at:at+n]
    if args.prepare:
        WORK.mkdir(parents=True,exist_ok=True)
        for role,(start,end,expected) in SPANS.items():
            raw = bytes_at(start,end-start)
            assert hashlib.sha256(raw).hexdigest() == expected
            binary = WORK/f"{start:x}.bin"
            seeds = WORK/f"{start:x}-seeds.tsv"
            plan = WORK/f"{start:x}-plan.json"
            value = dict(target=binary.relative_to(ROOT).as_posix(),
                output=(WORK/f"{start:x}-rea").relative_to(ROOT).as_posix(),init_timeout=60,timeout=180,
                open_options=dict(format="raw-binary",architecture="x86_64",entry_point=hex(start)),
                environment=dict(REA_GHIDRA_SEED_FILE=seeds.relative_to(ROOT).as_posix()),
                operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=hex(start)),label=QUERY_LABELS[role])])
            for path,data in [(binary,raw),(seeds,f"{start:#x}\tfunction\n{start:#x}\tcode\n".encode()),
                              (plan,(json.dumps(value,indent=2)+"\n").encode())]:
                if path.exists(): assert path.read_bytes() == data,f"Refuse to overwrite changed query input {path}"
                else: path.write_bytes(data)
            print("./scripts/rea query "+plan.relative_to(ROOT).as_posix())
        return
    def call(site,destination):
        raw = bytes_at(site,5)
        assert raw[0] == 0xe8 and site+5+struct.unpack_from("<i",raw,1)[0] == destination
        return dict(site=hex(site),destination=hex(destination),bytes=raw.hex())
    spans,queries = [],[]
    for role,(start,end,expected) in SPANS.items():
        assert hashlib.sha256(bytes_at(start,end-start)).hexdigest() == expected
        spans.append(dict(role=role,start=hex(start),end_exclusive=hex(end),sha256=expected))
        directory = WORK/f"{start:x}-rea"
        journal = json.loads((directory/"journal.json").read_text())
        operation, = journal["operations"].values()
        assert operation["status"] == "completed"
        result_path = ROOT/operation["result"]["path"]
        assert file_sha256(result_path) == operation["result"]["sha256"]
        evidence = json.loads(result_path.read_text())["structuredContent"]
        assert evidence["subject"]["digest"]["sha256"] == expected
        assert evidence["operation"] == "procedure_pseudo_code"
        queries.append(dict(role=role,evidence_id=evidence["evidence_id"],result=commitment(result_path),
            plan=commitment(WORK/f"{start:x}-plan.json"),seed=commitment(WORK/f"{start:x}-seeds.tsv")))
    literal_records = []
    for va,text in [(0x1473aef20,"WOW_DATA"),(0x1473aef30,"Data"),(0x1473aef28,"WoW/Data")]:
        raw = text.encode();assert bytes_at(va,len(raw)) == raw
        literal_records.append(dict(preferred_va=hex(va),text=text,byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest()))
    calls = [call(0x145b81cea,0x145b81690),call(0x145815185,0x145b81cc0),call(0x1458151ad,0x145bd0f80)]
    error_immediates = []
    for site,encoded,observation in [
            (0x145815251,"48b96e6f2067616d6520","movabs rcx, little-endian no game prefix"),
            (0x14581525e,"c7400864617461","store little-endian data suffix at result buffer +8")]:
        raw = bytes.fromhex(encoded)
        assert bytes_at(site,len(raw)) == raw
        error_immediates.append(dict(site=hex(site),bytes=encoded,observation=observation))
    native_base_order = []
    for index in range(10):
        pointer,n = struct.unpack("<QQ",bytes_at(0x1473b1e00+16*index,16))
        native_base_order.append(bytes_at(pointer,n).decode())
    source_paths = [ROOT/p for p in ["crates/azeroth-survivors-re/src/assets.rs",
        "crates/azeroth-survivors-re/src/main.rs","crates/benilla-formats/src/install.rs",
        "crates/benilla-formats/src/chain.rs","crates/benilla-formats/src/lib.rs",
        "crates/benilla-assets/src/lib.rs"]]
    assets,main_source,install,chain,formats,asset_reader = [path.read_text() for path in source_paths]
    function = re.search(r"pub fn data_directory\(\) -> Option<PathBuf> \{(.*?)\n\}",assets,re.S)
    assert function
    delegated = function.group(1).strip() == "benilla_formats::wow_data()"
    assert "candidates().into_iter().find(|c| c.is_dir())" in install
    assert 'if over.as_os_str().is_empty()' in install and 'return Vec::new();' in install
    assert 'out.push(dir.join("Data"));' in install and 'out.push(dir.join("WoW/Data"));' in install
    candidate_body = re.search(r"fn candidates_from\([\s\S]*?\n\}\n",install)
    assert candidate_body
    candidate_steps = ['if let Some(over) = override_dir', 'if over.as_os_str().is_empty()',
        'return Vec::new();', 'out.push(over);', 'if let Some(root) = project',
        'out.push(root.join("WoW/Data"));', 'if let Some(dir) = exe_dir',
        'out.push(dir.join("Data"));', 'out.push(dir.join("WoW/Data"));']
    positions = [candidate_body.group().index(step) for step in candidate_steps]
    assert positions == sorted(positions)
    assert '#[cfg(not(feature="dev"))]{None}' in re.sub(r"\s+","",install)
    cli = re.search(r'"--data-dir" => \{(.*?)\n            \}',main_source,re.S)
    assert cli and 'std::env::set_var("WOW_DATA", directory);' in cli.group(1)
    assert main_source.index('"--data-dir" =>') < main_source.index('assets::data_directory()')
    assert 'benilla_assets::register_mpq_source(&mut app, &directory)' in main_source
    assert main_source.index('if let Some(directory) = assets::data_directory()') < main_source.index('benilla_assets::register_mpq_source(&mut app, &directory)') < main_source.index('.add_plugins(native_input::device_plugins(DefaultPlugins')
    assert 'chain.read_file(path)' in assets and 'MpqAssetReader' in asset_reader
    assert 'Chain::open(data_dir)' in asset_reader
    expected_base_order = re.search(r"pub const VANILLA_BASE_ORDER:.*?= &\[(.*?)\];",formats,re.S)
    assert expected_base_order and re.findall(r'"([^"]+)"',expected_base_order.group(1)) == native_base_order
    assert 'self.archives.iter().rev()' in chain
    result = dict(schema_version=1,target={k:target[k] for k in ["version","path","sha256","size_bytes"]},
        lead_id="Q41-R01",gap_ids=[41],generator=commitment(ROOT/"scripts/check-data-directory.py"),
        native_spans=spans,queries=queries,native_literals=literal_records,native_calls=calls,
        native_no_directory_error=dict(text="no game data",byte_count=12,immediate_observations=error_immediates),
        native_base_order=native_base_order,source_files=[commitment(p) for p in source_paths],
        feature_closure=feature_closure(),source_delegates_to_recovered_engine_resolver=delegated,
        recovered_contract=dict(candidate_order=["nonempty WOW_DATA when present","executable parent/Data","executable parent/WoW/Data"],
            empty_override="no candidates; executable-relative fallbacks suppressed",selection="first candidate that is a directory; otherwise None",
            absent_executable_parent="no executable-relative candidates",consumer="current cached named-member reader calls directory selector then native Chain/open; no directory returns no game data; chain/read errors propagate"),
        limits=["REA/Ghidra operates on exact current hash-bound raw-function extracts; external OS/path/allocator calls, complete cache lifetime and engine archive implementation are not executed or reconstructed.",
            "The native candidate/selector/caller contracts are recovered statically. Source delegation and conservative local feature closure are traced without compiling Rust.",
            "Base archive names and native patch/speech2 comparisons are supporting engine-interface context; no claim that every native mount, locale, dynamic resource URI or codec contract is closed.",
            "No compilation, source/game/OS loading, rendered asset check or original/rebuilt parity comparison."])
    raw = json.dumps(result,indent=2)+"\n"
    if args.stage: (WORK/"data-directory-manifest.json").write_text(raw)
    else:
        assert delegated,"AS data_directory must delegate to the recovered existing engine resolver"
        assert KEEP.read_text() == raw
    print(json.dumps(dict(native_queries=len(queries),source_delegation=delegated,
        local_feature_manifests=len(result["feature_closure"]["manifests"]),benilla_formats_dev_enabled=False)))


if __name__ == "__main__":
    main()

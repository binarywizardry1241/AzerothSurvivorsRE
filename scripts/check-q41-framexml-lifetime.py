#!/usr/bin/env python3
"""Check core/addon talent publication lifetimes without compiling the application."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

from coverage_common import ROOT,latest_target,target_bytes
from script_sources import load_script

KEEP=ROOT/'docs/analysis/evidence/q41-framexml-lifetime.json'
WORK=ROOT/'runtime/analysis/history/findings/q41-framexml-lifetime/1227bd6a2f14'
RUST=ROOT/'crates/azeroth-survivors-re/src/gameplay/client/talent_view.rs'
SHA='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def digest(value):return hashlib.sha256(value).hexdigest()

def receipt(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=digest(path.read_bytes()))


def derive():
    target=latest_target(verify=True);assert target['sha256']==SHA and target['version']=='0.115.0'
    image=target_bytes(target)
    pe=load_script('framexml_lifetime_pe',ROOT/'scripts/inventory-executable.py').PE(image)
    old=json.loads((ROOT/'docs/analysis/evidence/q41-framexml.json').read_text())
    assert old['target']==dict(version='0.115.0',sha256=SHA)
    def native(a,n):
        at=pe.rva_offset(a-pe.image_base);value=image[at:at+n];assert len(value)==n;return value
    descriptor=old['native_patch']['descriptor']
    encoded=native(int(descriptor['address'],16),16)
    assert encoded.hex()==descriptor['bytes']
    pointer,length=struct.unpack('<QQ',encoded)
    assert pointer==int(descriptor['pointer'],16) and length==descriptor['length']==11034
    full=native(pointer,length)
    assert digest(full)==old['native_patch']['sha256']
    canonical=ROOT/'docs/analysis/evidence/hud-framexml/world-state-patch.lua'
    popup=ROOT/'docs/analysis/evidence/raid-targets/popup.lua'
    assert full.count(popup.read_bytes())==1
    at=full.index(popup.read_bytes());assert full[:at]+full[at+len(popup.read_bytes()):]==canonical.read_bytes()
    core=canonical.read_text()
    assert core.count('AZS_TALENT_TOGGLES = "0";')==1
    assert core.count('function ToggleTalentFrame()')==1 and core.count('function UpdateTalentButton()')==1
    native_contract=dict(descriptor=descriptor,payload_sha256=digest(full),canonical=receipt(canonical),popup=receipt(popup))

    source=RUST.read_text();body=re.search(r'const BRIDGE: &str = r#"(.*?)"#;',source,re.S).group(1)
    forbidden=['ToggleTalentFrame','UpdateTalentButton','AZS_TALENT_TOGGLES','TalentMicroButton','WorldMapMicroButton',
               'AZS_TALENT_BRIDGE','SetPoint(','ClearAllPoints(']
    assert not any(token in body for token in forbidden),[token for token in forbidden if token in body]
    assert 'if active && open { "true" } else { "false" }' in source
    assert 'if AZS_TALENT_VIEW_OPEN and UIParent then' in body
    assert body.count('CreateFrame(')==1 and 'if not AZSTalentInputGuard then' in body
    assert ':EnableMouse(true)' in body and ':EnableMouseWheel(true)' in body
    assert 'elseif AZSTalentInputGuard then' in body and ':Hide()' in body
    fragments=[]
    def fragment(path,start,end=None):
        text=(ROOT/path).read_text();assert text.count(start)==1,(path,start)
        begin=text.index(start)
        finish=text.index(end,begin)+len(end)if end else begin+len(start)
        value=text[begin:finish]
        fragments.append(dict(path=path,start_anchor=start,end_anchor=end,byte_count=len(value.encode()),sha256=digest(value.encode())))
        return value
    client='crates/benilla-app/src/local_client.rs'
    fragment(client,'if !session.active {\n        *talent_counter = TalentToggleCounter::default();\n    }')
    fragment(client,'            if session.active {\n                if let Some(name) = extension.talent_toggle_counter.as_deref() {',
             '                        input.talent_toggle = talent_counter.observe(script.session(), value);\n                    }\n                }\n            }')
    observer=fragment(client,'impl TalentToggleCounter {','\n}\n\n#[cfg(test)]')
    for token in ['self.vm == Some(vm)','*previous != value','self.vm = Some(vm);','self.value = Some(value);']:
        assert token in observer
    fragment(client,'            if !extension.script_update.is_empty() {',
             '                    error!("local client extension state publication failed: {error}");\n                }\n            }')
    as_client='crates/azeroth-survivors-re/src/gameplay/client.rs'
    fragment(as_client,'        extension.talent_toggle_counter = Some("AZS_TALENT_TOGGLES".into());')
    fragment(as_client,'        extension.framexml_appends.splice(0..0, framexml_hud::appends());')
    fragment(as_client,'        if menu.entering && client.active {',
             '            client.set_paused(true);\n            return;\n        }')
    lifecycle='crates/benilla-app/src/ui_script/lifecycle.rs'
    fragment(lifecycle,'    close_ui_session(world, ShutdownRoot::Reload);\n    install_boot_vm(world);\n    load_ingame_ui_seated(world, LoadSeat::Live);')
    fragment(lifecycle,'        files.load_addons(script);\n        if !extension_postlude.is_empty() {',
             '                error!("local client FrameXML extension failed: {error}");\n            }\n        }')
    loader='crates/benilla-app/src/ui_script/addons.rs'
    fragment(loader,'            for (target, source) in appends {',
             '                    bytes.extend_from_slice(source.as_bytes());\n                }\n            }')
    fragment('crates/benilla-app/src/ui_script/manifest.rs',
             '                    self.failures.extend(core.load_files_into_with_appends(',
             '                        &self.appends,\n                    ));')
    hud='crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs'
    fragment(hud,'            r"Interface\\FrameXML\\WorldStateFrame.lua".into(),\n            SOURCE.into(),')

    # The unchanged reader follows the retained 0.105.0 watcher contract. This
    # checks the existing source connection; it does not relabel those native
    # instruction cases as a current-target watcher recovery.
    historical=ROOT/'docs/analysis/evidence/talent-view/input-vectors.json'
    watcher=json.loads(historical.read_text());assert len(watcher['cases'])==11
    assert watcher['target_sha256']=='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
    cases={row['name']:row for row in watcher['cases']}
    assert cases['initial-nonzero']['expected_open'] is False
    assert cases['inactive-clears-observation']['observed_counter'] is None
    assert cases['missing-global']['observed_counter']=='0'
    harness='scripts/check-q41-framexml-lifetime.lua'
    interpreted=subprocess.run(['lua',harness],cwd=ROOT,check=True,capture_output=True,text=True)
    assert 'Passed 244 exact native FrameXML Lua checks' in interpreted.stdout
    assert 'Passed 241 core/addon/publication lifetime checks' in interpreted.stdout
    compat=subprocess.run(['lua','scripts/check-talent-view-bridge.lua'],cwd=ROOT,check=True,capture_output=True,text=True)
    assert compat.stdout==interpreted.stdout
    mutations=[
        ('late-toggle-wrapper',"if AZS_TALENT_ACTIVE then ToggleTalentFrame = function() end; end;\n",'publication preserves the later addon toggle hook'),
        ('late-counter-reset',"if AZS_TALENT_ACTIVE then AZS_TALENT_TOGGLES = '0'; end;\n",'entry/retry/inactive publication does not reset or clear the core counter'),
        ('late-button-anchor',"if AZS_TALENT_ACTIVE then TalentMicroButton:ClearAllPoints(); TalentMicroButton:SetPoint('BOTTOMLEFT', UIParent, 'BOTTOMLEFT', 0, 0); end;\n",'publication never reanchors the talent button'),
        ('inactive-counter-clear',"if not AZS_TALENT_ACTIVE then AZS_TALENT_TOGGLES = nil; end;\n",'entry/retry/inactive publication does not reset or clear the core counter'),
    ]
    rejected=[];WORK.mkdir(parents=True,exist_ok=True)
    for name,bad,expected in mutations:
        path=WORK/(name+'.rs')
        assert not path.exists(),'Do not overwrite another operation fixture'
        try:
            path.write_text('const BRIDGE: &str = r#"'+bad+body+'"#;\n')
            run=subprocess.run(['lua',harness,path.relative_to(ROOT).as_posix()],cwd=ROOT,capture_output=True,text=True)
            assert run.returncode!=0 and expected in run.stderr,(name,run.stdout,run.stderr)
            rejected.append(dict(name=name,expected_rejection=expected))
        finally:path.unlink(missing_ok=True)
    return dict(schema_version=1,target=dict(version='0.115.0',sha256=SHA),gap_ids=[41,105],lead_ids=['Q41-I01'],
        generator=receipt(Path(__file__).resolve()),native_core_contract=native_contract,
        source=receipt(RUST),source_fragments=fragments,
        historical_watcher_evidence=dict(**receipt(historical),target_sha256=watcher['target_sha256'],cases=11,
            current_native_watcher_revalidation=False),
        interpreted=dict(harness=receipt(ROOT/harness),reused_core_fixture=receipt(ROOT/'scripts/check-framexml-hud.lua'),
            compatibility_entrypoint=receipt(ROOT/'scripts/check-talent-view-bridge.lua'),core_fixture_assertions=244,
            lifetime_assertions=241,VM_fixtures=2,negative_mutations=rejected),
        checks=dict(core_owns_functions_and_initial_counter=True,publication_owns_only_overlay_guard=True,
            inactive_reader_resets_observation_without_clearing_Lua_counter=True,fresh_VM_identity_establishes_baseline=True,
            retry_retains_current_VM_and_counter=True,ReloadUI_rebuilds_core_in_new_VM=True),
        compilation_run=False,game_execution_run=False,parity_verified=False,
        limits=['The current native core payload is byte-verified; the unchanged counter reader retains its explicitly historical 0.105.0 watcher provenance.',
            'Interpreted Lua uses declared stock/widget seams. Narrow source fragments check current lifecycle connections without executing Rust/ECS/VM/core loading.',
            'The updated Rust regression is authored but uncompiled. No native/application execution, input/rendering or original/rebuilt comparison.'])


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
    proof=derive();text=json.dumps(proof,indent=2)+'\n'
    if args.write:KEEP.write_text(text)
    else:assert json.loads(KEEP.read_text())==proof,'Curated lifetime proof differs'
    print('PASS: current full core patch, 12 live source guards, 485 interpreted assertions, four rejected late-ownership mutations; Rust/application/parity unverified')


if __name__=='__main__':main()

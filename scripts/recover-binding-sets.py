#!/usr/bin/env python3
"""Check shipped character-binding transitions with a Lua host fixture; no build/game."""
from portable_paths import portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

from coverage_common import latest_target

ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
RETAINED = ROOT / 'docs/analysis/evidence/options-comparison/binding-sets.json'


def recover(data, pe):
    start = data.index(b'function BenillaKeyBindings_CharacterToggle(box)')
    end = data.index(b'-- Reset To Default confirms', start)
    raw = data[start:end]
    checkbox_start = data.index(b'<Frame name="$parentCharacterRow"')
    checkbox_end = data.index(b'<Frame name="$parentRow1"', checkbox_start)
    checkbox = data[checkbox_start:checkbox_end]
    constructor_start, constructor_end = 0x1400ef540, 0x1400eff31
    constructor_at = pe.rva_offset(constructor_start - pe.image_base)
    constructor = data[constructor_at:constructor_at + constructor_end - constructor_start]
    return dict(target_sha256=SHA, virtual_address=hex(pe.offset_va(start)), byte_count=len(raw),
                sha256=hashlib.sha256(raw).hexdigest(), text=raw.decode(),
                checkbox_xml=dict(virtual_address=hex(pe.offset_va(checkbox_start)),
                    byte_count=len(checkbox), sha256=hashlib.sha256(checkbox).hexdigest(), text=checkbox.decode()),
                custom_page_constructor=dict(virtual_address=hex(constructor_start),
                    end_exclusive=hex(constructor_end), byte_count=len(constructor),
                    sha256=hashlib.sha256(constructor).hexdigest(),
                    rea_evidence_id='ev_37e755cf2131f0f16b6f9ac32d329a168bd4ea973356cc0c0549cdaececd43ed',
                    contract='Empty binding label or section/binding rows; no character selector or popup construction.',
                    row_constructors=['0x140208490', '0x140206f60']),
                existing_commit_defaults='lifecycle-manifest.json: lua_excerpts',
                limits=['Exact shipped embedded Lua; interpreter host calls are fixtures.',
                        'Rust binding persistence and full-interface popup painting are source-traced, not executed.',
                        'The embedded FrameXML selector belongs to the full interface, not the separate custom Options binding constructor.'])


def check_lua(record):
    source = '''StaticPopupDialogs = {}
function BenillaKeyBindings_String(key, fallback) return fallback end
'''+record['text']+'''
local fixture, trace, shown
function PlaySound(value) assert(value == 'igMainMenuOptionCheckBoxOn') end
function BenillaKeyBindings_SetSelected(value) assert(value == nil) end
function BenillaKeyBindings_Output(value) assert(value == '') end
function BenillaKeyBindingsPage_Refresh() end
function StaticPopup_Show(which) shown = which end
function LoadBindings(which)
    table.insert(trace, 'load' .. which)
    fixture.live = fixture[which] or fixture[1] or 'SPACE'
    fixture.current = which
end
function SaveBindings(which)
    table.insert(trace, 'save' .. which)
    fixture[which] = fixture.live
    fixture.current = which
    if which == 1 then fixture[2] = nil end
end
local function box(checked)
    return { checked = checked, GetChecked = function(self) return self.checked end,
        SetChecked = function(self, value) self.checked = value end }
end
local count = 0
for _, row in ipairs({{[1]='A',[2]='C',expected='C'}, {[1]='A',expected='A'}, {expected='SPACE'}}) do
    fixture, trace, shown = row, {}, nil
    BenillaKeyBindings_CharacterToggle(box(1))
    assert(table.concat(trace, ',') == 'load2,save2')
    assert(fixture.current == 2 and fixture[2] == fixture.expected and shown == nil)
    count = count + 1
end
for _, accept in ipairs({false, true}) do
    fixture, trace, shown = {[1]='A',[2]='C',current=2,live='C'}, {}, nil
    local widget = box(nil)
    BenillaKeyBindings_CharacterToggle(widget)
    assert(widget.checked == 1 and shown == 'BENILLA_CONFIRM_DELETING_CHARACTER_SPECIFIC_BINDINGS')
    assert(#trace == 0 and fixture.current == 2 and fixture.live == 'C')
    if accept then
        StaticPopupDialogs[shown].OnAccept()
        assert(table.concat(trace, ',') == 'load1,save1')
        assert(fixture.current == 1 and fixture.live == 'A' and fixture[2] == nil)
    else
        assert(fixture[2] == 'C' and fixture[1] == 'A')
    end
    count = count + 1
end
print('Interpreted five selected-target character/account binding transitions with declared host seams')
'''
    result = subprocess.run(['lua','-'],input=source,text=True,capture_output=True,cwd=ROOT)
    assert result.returncode == 0, result.stderr
    print(result.stdout.strip())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.105.0' and target['sha256'] == SHA
    data = (ROOT / target['path']).read_bytes()
    module = load_script('inventory', ROOT/'scripts/inventory-executable.py')
    record = recover(data,module.PE(data))
    if args.check:
        assert portable_record(json.loads(RETAINED.read_text())) == portable_record(record)
    else:
        out = ROOT/'runtime/analysis/history/native-recovery/secondary-options/5690c1d4900f/binding-sets.json'
        out.parent.mkdir(parents=True,exist_ok=True)
        out.write_text(portable_json(record,ensure_ascii=False,indent=2)+'\n')
    check_lua(record)
    framexml = (ROOT/'crates/benilla-app/assets/ui/KeyBindingsPage.xml').read_text()
    toggle = record['text'].split('        -- Our key:')[0].strip().replace('\r\n', '\n')
    assert toggle in framexml
    options_xml = (ROOT/'crates/benilla-app/assets/ui/OptionsFrame.xml').read_text()
    assert record['checkbox_xml']['text'].strip().replace('\r\n', '\n') in options_xml
    custom = (ROOT/'crates/azeroth-survivors-re/src/options.rs').read_text()
    extension = (ROOT/'crates/benilla-app/src/local_client/extension.rs').read_text()
    assert 'BindingCharacter' not in custom
    assert 'binding_account_confirmation' not in extension and 'pub binding_set:' not in extension
    print('Source trace retains the full-interface FrameXML selector and no unsupported custom selector/transport')


if __name__ == '__main__':main()

#!/usr/bin/env python3
"""Classify all five string leads; no save/config mutation, game or compiler."""
from runtime_layout import retained_runtime_path
import argparse
import gzip
import hashlib
import json
from pathlib import Path
import sys

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from script_sources import load_script

KEEP = ROOT/'docs/analysis/evidence/save-key-leads.json'
WORK = ROOT/'runtime/analysis/history/findings/q41-save-key-leads/1b5e8184d5b5'


def record(path):
    return dict(path=path.relative_to(ROOT).as_posix(),sha256=file_sha256(path))


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true');args=ap.parse_args()
    target=latest_target(verify=True)
    assert target['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    image=target_bytes(target)
    pe=load_script('save_key_pe',ROOT/'scripts/inventory-executable.py').PE(image)
    queue=ROOT/'docs/analysis/evidence/unknown-recovery-comparison-2.json';q=json.loads(queue.read_text())
    item=q['inputs']['inventory.json'];assert file_sha256(retained_runtime_path(ROOT/item['path'], ROOT))==item['sha256']
    inventory=json.loads((retained_runtime_path(ROOT/item['path'], ROOT)).read_text());leads=inventory['embedded_candidates']['save_configuration_key_lead']
    assert len(leads)==5
    for lead in leads:
        at=int(lead['file_offset'],16);raw=image[at:at+lead['byte_count']]
        assert raw.decode()==lead['literal'] and hashlib.sha256(raw).hexdigest()==lead['sha256']
    operand=ROOT/'docs/analysis/evidence/native-operand-boundaries.json';o=json.loads(operand.read_text())
    assert file_sha256(ROOT/o['inventory']['path'])==o['inventory']['sha256']
    references=[]
    spans=[(int(r['virtual_address'],16),int(r['virtual_address'],16)+r['byte_count'])for r in leads]
    with gzip.open(ROOT/o['inventory']['path'],'rt')as stream:
        for line in stream:
            row=json.loads(line);address=int(row['target'],16)
            if any(a<=address<b for a,b in spans):references.append(row)
    assert len(references)==5
    observations=[];pseudo={}
    for path in sorted((WORK/'rea').glob('*pseudo*.json')):
        e=json.loads(path.read_text())['response']['result']['structuredContent'];text=e['normalized_result'];name=e['parameters']['procedure'];pseudo[name]=text
        observations.append(dict(evidence_id=e['evidence_id'],procedure=name,profile_digest=e['analysis_profile']['digest'],pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest()))
    assert len(observations)==5
    assert '0x7078746e656c6174' in pseudo['0x1400e8e30']
    assert '"talentxp",8' in pseudo['0x14587b0e0']
    assert '"before",6' in pseudo['0x14587b0e0'] and '"parts",5' in pseudo['0x14587b0e0']
    assert '&DAT_1473002c7,0xe' in pseudo['0x1458988e0']
    assert '&DAT_1473002d5,0xe' in pseudo['0x1458988e0']
    sys.path.insert(0,str(ROOT/'runtime/tool-state/python/camera/python-libs'))
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    at=pe.rva_offset(0x1400e9c45-pe.image_base);raw=image[at:at+19]
    instructions=list(Cs(CS_ARCH_X86,CS_MODE_64).disasm(raw,0x1400e9c45))
    assert [i.mnemonic for i in instructions]==['movabs','cmp','je']
    assert raw[2:10]==b'talentxp'
    case_observations=[]
    for path in sorted((WORK/'case-rea').glob('*instruction-*.json')):
        e=json.loads(path.read_text())['response']['result']['structuredContent']
        case_observations.append(dict(evidence_id=e['evidence_id'],operation=e['operation'],parameters=e['parameters'],result=e['normalized_result']))
    assert len(case_observations)==4
    source=ROOT/'crates/azeroth-survivors-re/src/gameplay/terminal.rs'
    view=ROOT/'crates/azeroth-survivors-re/src/gameplay/terminal_view.rs'
    save=ROOT/'crates/azeroth-survivors-re/src/save.rs'
    assert 'before: Some(before)' in source.read_text() and 'parts:' in source.read_text()
    assert 'talent.total.saturating_sub(talent.gained)' in view.read_text()
    assert 'environment("WOW_ROGUE_SAVE")' in save.read_text() and 'base.join("characters.txt")' in save.read_text()
    proof=dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},gap_ids=[41],lead_ids=['Q41-D03','Q41-A01'],
        queue=record(queue),operand_audit=record(operand),selected_leads=leads,forming_operands=references,
        instruction_case=dict(start='0x1400e9c45',end_exclusive='0x1400e9c58',sha256=hashlib.sha256(raw).hexdigest(),observations=case_observations),
        ghidra=observations,source_connections=[record(p)for p in [source,view,save]],
        classifications={'0x1400e9c47':'Immediate constant in frontend talent-XP message-type comparison; not a save key.',
                         '0x145ea1941':'Existing current legacy-configuration migration special filename; see legacy-config-0.113.2.md.',
                         '0x146029aa1':'Shared engine CVar config reader/writer filename; not a second AS save format.',
                         '0x147015f7e':'Backend talent-XP JSON type value; producer and frontend consumer are paired.',
                         '0x1473002d5':'Default AS character-save filename after WOW_ROGUE_SAVE override selection.'},
        generator=record(Path(__file__).resolve()),source_change_required=False,
        limits=['Every original five-row candidate is retained. Regex category names are not semantic types; talentxp is a message discriminator.',
                'Focused frontend body ownership omits computed cases; code-only instruction observations and exact PE bytes classify the selected comparison without assigning enclosing-unwind ownership.',
                'Existing typed XP snapshot and character-path source connections are traced, not executed. Full current XP arithmetic/parser/UI, worker/alias and OS/save/config behavior remain unverified.',
                'No original selector/census change, engine reconstruction, compiler, application, real file operation or original/rebuilt parity comparison.'])
    if args.stage:(WORK/'save-key-leads.json').write_text(json_text(proof))
    else:assert proof==json.loads(KEEP.read_text())
    print('Save/configuration string leads: all5 classified; talentxp producer/consumer paired. No source/runtime/parity claim.')


if __name__=='__main__':main()

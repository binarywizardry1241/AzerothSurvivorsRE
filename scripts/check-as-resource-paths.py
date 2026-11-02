#!/usr/bin/env python3
"""Classify six AS resource candidates and paired arrows; no binary export/build."""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT,latest_target,file_sha256,verify_resources
from creature_query_native import D,PE
from script_sources import load_script
from resource_uri_native import UriProbe,SPANS

WORK=ROOT/'runtime/q41-all-0.113.2'
KEEP=ROOT/'docs/analysis/evidence/0.113.2/as-resource-paths.json'
PATHS={
    'bar':['interface/paperdollinfoframe/ui-character-skills-bar.blp'],
    'dragon':['interface/dialogframe/ui-dialogbox-gold-dragon.blp'],
    'feature':['interface/glues/common/glue-leftarrow-button-up.blp','interface/glues/common/glue-rightarrow-button-up.blp'],
    'rotation':['interface/buttons/ui-rotationleft-button-up.blp','interface/buttons/ui-rotationright-button-up.blp'],
}


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage',action='store_true')
    args=ap.parse_args()
    target=latest_target(verify=True)
    assert target['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    proof_path=ROOT/'docs/analysis/evidence/0.113.2/mpq-member-coverage.json'
    proof=json.loads(proof_path.read_text())
    lead_input=proof['outputs']['resource-leads.jsonl']
    assert file_sha256(ROOT/lead_input['path'])==lead_input['sha256']
    leads=[json.loads(line)for line in (ROOT/lead_input['path']).read_text().splitlines()]
    assert len(leads)==303
    selected=[]
    for ordinal in range(6):
        row=leads[ordinal]
        assert row['selector']=='Q41-D03:resource_path:'+str(ordinal)
        at=int(row['file_offset'],16)
        raw=row['literal'].encode()
        assert D[at:at+len(raw)]==raw and hashlib.sha256(raw).hexdigest()==row['literal_sha256']
        assert D[at-4:at]==b'mpq:' and raw.startswith(b'//')
        selected.append(dict(selector=row['selector'],original_file_offset=row['file_offset'],
            original_status=row['status'],complete_uri='mpq:'+row['literal'],
            full_uri_location=dict(file_offset=hex(at-4),virtual_address=hex(PE.offset_va(at-4)),
                size_bytes=len(raw)+4,sha256=hashlib.sha256(D[at-4:at+len(raw)]).hexdigest())))
    probe,cases=UriProbe(),[]
    for kind,paths in PATHS.items():
        for index,path in enumerate(paths):
            actual=probe.run(kind,index)
            assert actual=='mpq://'+path
            cases.append(dict(kind=kind,index=index,uri=actual))
    for index in [2,2**64-1]:
        assert probe.run('rotation',index)=='bounds'
        cases.append(dict(kind='rotation',index=index,result='bounds_before_asset_interface'))
    spans=[]
    for role,(start,call)in SPANS.items():
        at=PE.rva_offset(start-PE.image_base)
        spans.append(dict(role=role,start=hex(start),end_exclusive=hex(call+5),
            sha256=hashlib.sha256(D[at:at+call+5-start]).hexdigest(),first_asset_interface='0x140159a10'))
    observations=[]
    for path in sorted((WORK/'rea-resource-contracts-v2').glob('0*.json')):
        e=json.loads(path.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
        if e.get('operation')not in ['procedure_info','procedure_pseudo_code']:continue
        assert e['subject']['digest']['sha256']==target['sha256']
        observations.append(dict(operation=e['operation'],parameters=e['parameters'],evidence_id=e['evidence_id'],response_sha256=file_sha256(path)))
    assert len(observations)==8
    reused=[]
    for name in ['race-portraits/manifest.json','meter-minimap/manifest.json']:
        path=ROOT/'docs/analysis/evidence/0.113.2'/name
        p=json.loads(path.read_text());assert p['target_sha256']==target['sha256']
        reused.append(dict(path=str(path.relative_to(ROOT)),sha256=file_sha256(path)))
    assert verify_resources(target)==9
    mpq=load_script('as_uri_mpq','scripts/check-minimap-lifecycle.py')
    records=sorted(target['runtime_data']['archives'],key=lambda r:(not r['path'].lower().endswith('/patch.mpq'),r['path'].lower()))
    archives=[mpq.Archive(r['path'])for r in records]
    uris=sorted(set([r['complete_uri']for r in selected]+[r['uri']for r in cases if 'uri'in r]))
    assert len(uris)==8
    assets=[]
    for uri in uris:
        path=uri[len('mpq://'):].replace('/','\\')
        for archive in reversed(archives):
            entry=archive.lookup(path)
            if entry is not None:
                raw=archive.read(entry);break
        else:raise AssertionError('resource unavailable: '+path)
        assert raw[:4]==b'BLP2'
        width,height=struct.unpack_from('<II',raw,12)
        assert width>0 and height>0
        assets.append(dict(uri=uri,member=path,archive=archive.reference,size_bytes=len(raw),
            sha256=hashlib.sha256(raw).hexdigest(),width=width,height=height))
    sources=['crates/azeroth-survivors-re/src/assets.rs','crates/azeroth-survivors-re/src/armory.rs',
        'crates/azeroth-survivors-re/src/progression.rs','crates/azeroth-survivors-re/src/progression/achievements_sidebar.rs',
        'crates/azeroth-survivors-re/src/gameplay/meter.rs','crates/benilla-formats/src/chain.rs']
    asset,armory,progression,sidebar,meter,chain=[(ROOT/p).read_text()for p in sources]
    normalized='\n'.join([asset,armory,progression,meter]).replace('\\\\','/').lower()
    assert all(uri[len('mpq://'):]in normalized for uri in uris)
    assert 'chain.read_file(path)'in asset and 'fn read_file('in chain
    for key in ['armory.turn_left','armory.turn_right','armory.feature_left','armory.feature_right']:assert armory.count('"'+key+'"')>=2
    assert 'images.progress_bar.clone()'in progression and 'images.dragon.clone()'in sidebar
    result=dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},
        gap_ids=[41],leads=['Q41-R01','Q41-D03'],original_candidate_count=303,
        original_candidate_proof=dict(path=str(proof_path.relative_to(ROOT)),sha256=file_sha256(proof_path)),
        selected_candidates=selected,native_spans=spans,native_cases=cases,ghidra_observations=observations,
        reused_proofs=reused,assets=assets,source_hashes={p:file_sha256(ROOT/p)for p in sources},
        limits=[
            'Four new AS URI producer slices execute with synthetic frame/allocator/copy seams; stop at the first asset interface. Two current race/meter proofs are reused without duplicate extracts.',
            'Feature cases cover indices0/1 only; no arbitrary-index safety claim. Rotation additionally observes unsigned rejection for2/u64max. Full widget/action/layout/loader contracts do not execute.',
            'Eight available BLP2 members have full content hashes and header dimensions; texture codecs, first/all mip pixels, color/filtering and actual rendered appearance are not validated here.',
            'Original six partial-string selectors/statuses and all303 resource candidates remain unchanged. These URI classifications do not resolve the other297 candidates, all AS resources or native mount/locale/dynamic alias equivalence.',
            'No source omission is established for these eight paths. Existing AS load/handle consumers and benilla MPQ chain are reused; no generic engine reconstruction, compilation, Rust/client/game execution, binary asset export or original/rebuilt parity.'])
    text=json.dumps(result,indent=2)+'\n'
    if args.stage:(WORK/'as-resource-paths.json').write_text(text)
    else:assert KEEP.read_text()==text
    print(json.dumps(dict(selected_candidates=6,available_members=8,native_cases=len(cases),source_defect_found=False)))


if __name__=='__main__':main()

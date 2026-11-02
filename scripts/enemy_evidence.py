"""Keep reviewable native excerpts; full REA bundles stay in ignored runtime."""
import hashlib
import json
from portable_paths import portable_record


def pseudocode_text(text):
    return '\n'.join(line.rstrip() for line in text.splitlines()).strip()+'\n'


def curated_native(evidence):
    value=evidence['normalized_result']
    selected=('procedure','assembly','pseudocode','facet_availability','limitations')
    result={key:evidence.get(key) for key in ('evidence_id','operation','parameters','subject',
        'provider','analysis_profile','limitations','relationship_coverage')}
    result['retention']='Curated native facets; full original Evidence remains in the exported runtime bundle.'
    result['full_record_canonical_sha256']=hashlib.sha256(json.dumps(evidence,sort_keys=True,separators=(',',':')).encode()).hexdigest()
    result['normalized_result']={key:value[key] for key in selected if key in value}
    result['omitted_normalized_facets']=sorted(set(value)-set(selected))
    return portable_record(result)

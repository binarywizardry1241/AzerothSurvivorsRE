#!/usr/bin/env python3
"""Publish one validated atomic selection of current native evidence derivatives."""
import argparse
import importlib.util
from coverage_common import ROOT,latest_target,load_json,json_text,file_sha256

class Findings:
    def __init__(self):self.errors=[];self.warnings=[]
    def require(self,condition,category,detail):
        if not condition:self.errors.append(category+': '+detail)
    def warn(self,category,detail):self.warnings.append(category+': '+detail)

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');parser.add_argument('--executed-tool-sources',help='Optional census-bound manifest of exact committed historical execution-tool bytes');args=parser.parse_args()
    target=latest_target();classification='docs/analysis/coverage/native-ownership-classification.json'
    paths={'classification':classification,'census':load_json(ROOT/classification)['census_summary'],
        'jump_tables':'docs/analysis/coverage/native-jump-tables.json','historical_ranges':'docs/analysis/coverage/historical-range-revalidation.json'}
    selection={'schema_version':1,'target':{key:target[key] for key in ('version','path','sha256','size_bytes')},
        'generator':{'path':'scripts/select-native-image-evidence.py','sha256':file_sha256(ROOT/'scripts/select-native-image-evidence.py')},
        'records':{role:{'path':path,'sha256':file_sha256(ROOT/path)} for role,path in paths.items()},
        'gap_ids':[41],'source_semantics_complete':False,'global_aliasing_complete':False,'parity_verified':False}
    if args.executed_tool_sources:
        from coverage_common import project_path
        witness=project_path(args.executed_tool_sources)
        selection['executed_tool_sources']={'path':witness.relative_to(ROOT).as_posix(),'sha256':file_sha256(witness)}
    spec=importlib.util.spec_from_file_location('current_native_validator',ROOT/'scripts/check-full-image-native.py');checker=importlib.util.module_from_spec(spec);spec.loader.exec_module(checker)
    findings=Findings();checker.validate(target,findings,selection=selection)
    if findings.errors:raise ValueError('\n'.join(findings.errors))
    if args.write:(ROOT/'docs/analysis/coverage/native-image-current.json').write_text(json_text(selection))
    print(json_text({'status':'selected' if args.write else 'validated','warnings':findings.warnings,'records':paths}))
if __name__=='__main__':main()

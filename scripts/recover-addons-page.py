#!/usr/bin/env python3
"""Check the selected desktop AddOns status branches; no build/game/OS callee."""
from portable_paths import portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import latest_target
ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
RETAINED = ROOT/'docs/analysis/evidence/0.105.0/options/addons-page.json'


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    target=latest_target(verify=True);assert target['version']=='0.105.0' and target['sha256']==SHA
    data=(ROOT/target['path']).read_bytes()
    module = load_script('inventory', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    import unicorn.x86_const as r
    u=Uc(UC_ARCH_X86,UC_MODE_64)
    extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections)
    u.mem_map(pe.image_base,(extent+4095)&~4095)
    for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    stack,info=0x200000000,0x300000000;u.mem_map(stack,0x10000);u.mem_map(info,4096)
    stops={0x140116140:'missing',0x1458da4e0:'locale',0x1400eeaf9:'none'}
    def hook(_,pc,size,unused):
        if pc in stops:u.emu_stop();return
        if not (0x1400ee620<=pc<0x1400ee654 or 0x1400ee730<=pc<0x1400ee74b or 0x1400eea8c<=pc<0x1400eeaa0):
            raise RuntimeError(f'Unreviewed native instruction {pc:#x}')
    u.hook_add(UC_HOOK_CODE,hook)
    rows=[]
    for missing in [False,True]:
      for outdated in [False,True]:
       for demand in [False,True]:
        for check in [False,True]:
            u.mem_write(info,bytes(0x100));u.mem_write(info+0x40,struct.pack('<Q',int(missing)));u.mem_write(info+0x60,bytes([outdated,demand]))
            u.mem_write(stack,bytes(0x10000));bp=stack+0x8000;u.mem_write(bp+0x2d6,bytes([check]))
            for reg,value in [(r.UC_X86_REG_RBP,bp),(r.UC_X86_REG_RSP,bp-0x80),(r.UC_X86_REG_R13,info),
                              (r.UC_X86_REG_RCX,0x145d9f771),(r.UC_X86_REG_R9,0x145d9f75a)]:u.reg_write(reg,value)
            u.emu_start(0x1400ee620,0,count=100)
            pc=u.reg_read(r.UC_X86_REG_RIP);observed=stops[pc]
            if observed=='locale':
                at,count=u.reg_read(r.UC_X86_REG_RCX),u.reg_read(r.UC_X86_REG_RDX)
                observed=bytes(u.mem_read(at,count)).decode()
            expected='missing'if missing else'options.addon_out_of_date'if outdated and check else'options.addon_on_demand'if demand else'none'
            assert observed==expected
            rows.append(dict(missing=missing,outdated=outdated,on_demand=demand,version_check=check,status=observed))
    procedures=[]
    for role,a,b,eid in [('page',0x1400ee260,0x1400eedbf,'ev_7ec664677a9b9f883ed086fb4139004885aa183f2c86d4da802f882c2e0bab49'),
                          ('row',0x140206330,0x140206abc,'ev_d91eba542aadb07da32f25a17249bdb604835ce9216e05045ea89ee0fbc337ae')]:
        at=pe.rva_offset(a-pe.image_base);procedures.append(dict(role=role,address=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(data[at:at+b-a]).hexdigest(),rea_evidence_id=eid))
    result=dict(target_sha256=SHA,procedures=procedures,cases=rows,
                metadata_surface=['Title','Notes','missing dependency names','outdated flag','load-on-demand flag','enabled flag'],
                limits=['Replay stops before joining, translation, allocation, UI or OS calls.',
                        'A complete Author/Version metadata API audit is a shared-engine boundary; the custom desktop page does not display such controls.',
                        'Status priority does not establish all TOC parsing, transitive loader behavior, rendering or runtime parity.'])
    if args.check:assert portable_record(json.loads(RETAINED.read_text()))==portable_record(result)
    else:
        path=ROOT/'runtime/analysis/history/native-recovery/secondary-options/5690c1d4900f/addons-page.json';path.parent.mkdir(parents=True,exist_ok=True);path.write_text(portable_json(result,indent=2)+'\n')
    print('Checked all16 current AddOns status combinations; no native external call, game or compilation')


if __name__=='__main__':main()

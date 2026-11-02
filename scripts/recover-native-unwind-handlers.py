#!/usr/bin/env python3
"""Recover AMD64 version-1 UNWIND_INFO language-handler entry points."""
import argparse
from collections import Counter,deque
import hashlib
import importlib.util
import struct
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path
GENERATOR_SHA256=file_sha256(ROOT/'scripts/recover-native-unwind-handlers.py')

def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

def directory_entries(pe):
    def span(rva,size):
        offset=pe.rva_offset(rva)
        if size<=0 or pe.rva_offset(rva+size-1)!=offset+size-1 or offset+size>len(pe.data):raise ValueError('PE metadata is not contiguous file-backed data')
        return {'va':hex(pe.image_base+rva),'file_offset':hex(offset),'byte_count':size,'sha256':hashlib.sha256(pe.data[offset:offset+size]).hexdigest()}
    code=lambda value:any(pe.image_base+s['rva']<=value<pe.image_base+s['rva']+s['virtual_size'] and int(s['characteristics'],16)&0x20000000 for s in pe.sections)
    entries=[];audit={}
    def admit(value,role,witness):
        if not code(value):raise ValueError('PE entry metadata points outside executable sections')
        pe.rva_offset(value-pe.image_base);entries.append({'entry':hex(value),'role':role,'metadata':witness})
    entry=pe.u32(pe.optional+16)
    if entry:admit(pe.image_base+entry,'PE entrypoint',span(pe.optional+16,4))
    rva,size=pe.directories[0];audit['exports']={'rva':hex(rva),'directory_bytes':size,'present':bool(rva)}
    if rva:
        offset=pe.rva_offset(rva);count=pe.u32(offset+20);table=pe.u32(offset+28);span(table,count*4)
        for index in range(count):
            field=table+index*4;value=pe.u32(pe.rva_offset(field))
            if value and not rva<=value<rva+size and code(pe.image_base+value):admit(pe.image_base+value,'export RVA',span(field,4))
    rva,size=pe.directories[9];audit['tls']={'rva':hex(rva),'directory_bytes':size,'present':bool(rva),'callbacks':0}
    if rva:
        if size<40:raise ValueError('Truncated PE32+ TLS directory')
        audit['tls']['metadata']=span(rva,40);callbacks=pe.u64(pe.rva_offset(rva)+24)
        if callbacks:
            cursor=callbacks-pe.image_base;begin=cursor
            while True:
                value=pe.u64(pe.rva_offset(cursor))
                if not value:break
                admit(value,'TLS callback VA',span(cursor,8));audit['tls']['callbacks']+=1;cursor+=8
                if cursor-begin>1048576:raise ValueError('Unterminated TLS callback vector')
            audit['tls']['callback_vector']=span(begin,cursor-begin+8)
    rva,size=pe.directories[10];audit['load_config']={'rva':hex(rva),'directory_bytes':size,'present':bool(rva)}
    if rva:
        offset=pe.rva_offset(rva);declared=pe.u32(offset)
        if declared>size or declared<4:raise ValueError('Load-config size differs from directory bounds')
        result=audit['load_config'];result['declared_bytes']=declared;result['metadata']=span(rva,declared)
        read=lambda at,n:int.from_bytes(pe.data[offset+at:offset+at+n],'little') if at+n<=declared else 0
        guard=read(0x90,4);result['guard_flags']=hex(guard);result['entry_tables']={};result['function_pointer_slots']=[]
        for name,at,stride in [('GuardCF',0x80,4+((guard>>28)&15)),('GuardLongJump',0xb0,4),('GuardEHContinuation',0x108,4)]:
            pointer,count=read(at,8),read(at+8,8);result['entry_tables'][name]={'pointer':hex(pointer),'count':count,'row_bytes':stride,'field_available':at+16<=declared}
            if bool(pointer)!=bool(count):raise ValueError('Inconsistent guarded entry table pointer/count')
            if pointer:
                table=pointer-pe.image_base;span(table,count*stride)
                for index in range(count):
                    field=table+index*stride;admit(pe.image_base+pe.u32(pe.rva_offset(field)),name+' RVA',span(field,stride))
        for name,at,direct in [('GuardCFCheck',0x70,False),('GuardCFDispatch',0x78,False),('GuardRFFailureRoutine',0xd0,True),('GuardRFFailureRoutinePointer',0xd8,False),('GuardRFVerifyStackPointer',0xe8,False),('GuardXFGCheck',0x118,False),('GuardXFGDispatch',0x120,False),('GuardXFGTableDispatch',0x128,False),('GuardMemcpy',0x138,False)]:
            value=read(at,8)
            if not value:continue
            witness=span(rva+at,8);record={'name':name,'encoded_field':hex(value),'field':witness}
            if direct:target=value
            else:
                record['slot']=span(value-pe.image_base,8);target=pe.u64(pe.rva_offset(value-pe.image_base))
            record['initial_target']=hex(target);record['executable_target']=code(target);result['function_pointer_slots'].append(record)
            if code(target):admit(target,name+' initial function pointer',record.get('slot',witness))
    return entries,audit

def collect(pe):
    if pe.machine!=0x8664:raise ValueError('AMD64 unwind format required')
    pending=deque(row[2] for row in pe.functions());seen=set();handlers=[];counts=Counter();chains=[]
    while pending:
        rva=pending.popleft()
        if rva in seen:continue
        seen.add(rva);offset=pe.rva_offset(rva)
        if offset+4>len(pe.data):raise ValueError('Truncated unwind header')
        version=pe.data[offset]&7;flags=pe.data[offset]>>3;count=pe.data[offset+2]
        counts['version-'+str(version)]+=1;counts['flags-'+str(flags)]+=1
        if version!=1:raise ValueError('Unsupported unwind version; do not infer a handler')
        if flags&~7 or flags&4 and flags&3:raise ValueError('Invalid unwind flags')
        size=4+((count+1)&~1)*2;tail=offset+size
        if flags&4:size+=12
        elif flags&3:size+=4
        if offset+size>len(pe.data) or pe.rva_offset(rva+size-1)!=offset+size-1:raise ValueError('Unwind record is not contiguous file-backed data')
        raw=pe.data[offset:offset+size]
        witness={'va':hex(pe.image_base+rva),'file_offset':hex(offset),'byte_count':size,'sha256':hashlib.sha256(raw).hexdigest()}
        if flags&4:
            start,end,primary=struct.unpack_from('<III',pe.data,tail)
            chains.append({'start':hex(pe.image_base+start),'end_exclusive':hex(pe.image_base+end),'unwind_rva':hex(primary),'metadata':witness});pending.append(primary)
        elif flags&3:
            entry=pe.image_base+struct.unpack_from('<I',pe.data,tail)[0]
            if not any(pe.image_base+s['rva']<=entry<pe.image_base+s['rva']+s['virtual_size'] and int(s['characteristics'],16)&0x20000000 for s in pe.sections):raise ValueError('Handler is not executable')
            pe.rva_offset(entry-pe.image_base)
            handlers.append({'entry':hex(entry),'flags':flags,'metadata':witness,'handler_rva_field_va':hex(pe.image_base+rva+tail-offset)})
    return handlers,chains,dict(counts)

def verify_inventory(payload,target,pe):
    if payload['target']['sha256']!=target['sha256']:raise ValueError('Unwind-handler target differs')
    handlers,chains,counts=collect(pe)
    if handlers!=payload['handlers'] or chains!=payload['chains'] or counts!=payload['metadata_counts']:raise ValueError('Unwind-handler metadata commitment differs')
    entries,audit=directory_entries(pe)
    if entries!=payload['directory_entries'] or audit!=payload['directory_audit']:raise ValueError('PE directory entry commitments differ')
    return {int(row['entry'],16) for row in handlers+entries}|{int(row['start'],16) for row in chains}

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--census-summary',required=True);parser.add_argument('--inventory-output',help='Project-local full inventory path');parser.add_argument('--summary-output',default='docs/analysis/coverage/native-unwind-handlers.json',help='Project-local compact summary path');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    target=latest_target();summary=load_json(project_path(args.census_summary))
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified current census required')
    directory=project_path(summary['artifacts']['directory']);helpers=module('unwind_census','scripts/summarize-native-image.py');pe=module('unwind_pe','scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    bodies=directory/'bodies.tsv.gz'
    if file_sha256(bodies)!=summary['artifacts']['files']['bodies.tsv.gz']['sha256']:raise ValueError('Unwind source body inventory differs')
    owner=helpers.owner_lookup([(int(r['start'],16),int(r['end'],16),int(r['entry'],16)) for r in helpers.rows(bodies) if r['external']=='false'])
    handlers,chains,counts=collect(pe);directory_starts,directory_audit=directory_entries(pe);entries=sorted({int(row['entry'],16) for row in handlers+directory_starts}|{int(row['start'],16) for row in chains})
    payload={'target':summary['target'],'generator':{'path':'scripts/recover-native-unwind-handlers.py','sha256':GENERATOR_SHA256},
        'source_census':{'path':args.census_summary,'sha256':file_sha256(project_path(args.census_summary))},
        'format_reference':'https://learn.microsoft.com/en-us/cpp/build/exception-handling-x64?view=msvc-170',
        'metadata_counts':counts,'handlers':handlers,'chains':chains,'directory_entries':directory_starts,'directory_audit':directory_audit,
        'counts':{'distinct_unwind_records':sum(v for k,v in counts.items() if k.startswith('version-')),'handler_metadata_records':len(handlers),'chain_records':len(chains),'distinct_handler_entries':len({r['entry'] for r in handlers}),'distinct_directory_and_handler_entries':len(entries),'entries_without_actual_native_owner':sum(owner(a) is None for a in entries)},
        'entries':[{'entry':hex(a),'actual_native_owner':hex(owner(a)) if owner(a) is not None else None} for a in entries],
        'limits':['Explicit AMD64 version-1 handler RVAs establish callable native entries; language-specific handler-data layouts and runtime exception behavior remain unverified.','Chained records are followed as metadata without turning unwind extents into function bodies.']}
    output=project_path(args.inventory_output) if args.inventory_output else directory/'unwind-handlers.json';compact={k:v for k,v in payload.items() if k not in ('handlers','chains','directory_entries')}
    if file_sha256(ROOT/'scripts/recover-native-unwind-handlers.py')!=GENERATOR_SHA256:raise ValueError('Unwind helper changed during recovery')
    if args.write:
        output.write_text(json_text(payload));compact['inventory']={'path':output.relative_to(ROOT).as_posix(),'sha256':file_sha256(output)}
        project_path(args.summary_output).write_text(json_text(compact))
    print(json_text(compact))
if __name__=='__main__':main()

#!/usr/bin/env python3
"""Current audio policy/load-drain replay; no device, build or game."""
from script_sources import load_script
import argparse, hashlib, json, math, struct, sys
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes,reference_config
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED=ROOT/'docs/analysis/evidence/0.109.0/menu-audio'
STAGED=ROOT/'runtime/analysis/staging/native-evidence/0.109.0/menu-audio'
WORK=ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0'
OWNERS={'focus':(0x14096fa20,0x14096fd1a),'callback':(0x1409705b0,0x140970ba3),'watch':(0x14097b520,0x14097b98e),'handoff':(0x14097bb30,0x14097bcd6),'master':(0x1409a73f0,0x1409a76b8)}
def encoded(value):return json.dumps(value,indent=2,ensure_ascii=False)+'\n'
def machine(data,pe):
    u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
    for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    scratch,stack,done=0x200000000,0x300000000,0x400000000
    u.mem_map(scratch,0x100000);u.mem_map(stack,0x10000);u.mem_map(done,4096)
    def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
    def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
    def get(n):return u.reg_read(getattr(r,'UC_X86_REG_'+n))
    def setr(n,v):u.reg_write(getattr(r,'UC_X86_REG_'+n),v)
    return u,scratch,stack,done,q,put,get,setr

def handoff(data,pe):
    u,scratch,stack,done,q,put,get,setr=machine(data,pe)
    def hook(_,a,n,__):
     if a==done:u.emu_stop()
     elif not(0x14097bb30<=a<0x14097bcd6):raise ValueError(hex(a))
    u.hook_add(UC_HOOK_CODE,hook)
    # Suppress optional tracing through its real current level gate; command stores execute.
    put(0x14807cfa8,'Q',scratch+0x9000);put(scratch+0x9000,'Q',3)
    cases=[]
    for previous in (False,True):
     for covered in(False,True):
      for client in(0,1,2):
       for handle in(False,True):
        config,state,music,refs,local,changed,command=[scratch+n for n in(0x100,0x200,0x400,0x800,0xa00,0xb00,0x1000)]
        u.mem_write(scratch,bytes(0x3000));put(config+0x17,'B',covered);put(state,'B',client);put(local,'B',previous);put(music+0x68,'Q',int(handle));put(music+0xd0,'Q',command);put(music+0xd8,'B',0);put(refs,'QQQII',music,0,changed,0,99);put(scratch+0xc00,'Q',config);put(scratch+0xc08,'Q',state)
        sp=stack+0x8000-8;put(sp,'Q',done);put(sp+40,'Q',local)
        for n,v in [('RSP',sp),('RDX',scratch+0xc00),('R8',scratch+0xc08),('R9',refs)]:setr(n,v)
        u.emu_start(0x14097bb30,done,count=200)
        assert get('RIP')==done
        faded=bool(u.mem_read(music+0x1f8,1)[0]);expected=previous and not covered and client==2 and handle
        assert faded==expected and bool(u.mem_read(local,1)[0])==covered
        if faded:assert q(command+0xb8)==3 and q(command+0xc0)==0 and u.mem_read(command+0x200,1)[0]==4
        assert struct.unpack('<I',u.mem_read(changed,4))[0] == (99 if previous and not covered and client==2 else 0)
        cases.append(dict(previous=previous,covered=covered,client=client,handle=handle,faded=faded,fade_seconds=3 if faded else None))
    return cases

def cvar_vectors(data,pe):
    u,scratch,stack,done,q,put,get,setr=machine(data,pe)
    # Give the callback its reviewed native lexical/f32 parser bodies, not a formula seam.
    cursor=scratch+0x1000
    cases=json.loads((ROOT/'docs/analysis/evidence/0.92/audio-cvar-fixtures.json').read_text())['cases'];vectors=[]
    def alloc(n):
     nonlocal cursor
     p=cursor;cursor+=(n+31)&~15;return p

    def owned(a,s):
     raw=s.encode();p=alloc(len(raw)+1);u.mem_write(p,raw+b'\0');put(a,'QQQ',len(raw),p,len(raw))

    def hook(_,a,n,__):
     if a==done:u.emu_stop();return
     if a==0x140089200:
      raw=bytes(u.mem_read(get('RCX'),get('RDX')));v=raw.decode();leading=len(v)-len(v.lstrip());setr('RAX',get('RCX')+len(v[:leading].encode()));setr('RDX',len(v.strip().encode()))
     elif a==0x1400021c0:setr('RAX',alloc(get('RCX')))
     elif a in(0x140002200,0x1400021d0):pass
     elif a==0x145bfa0e7:
      u.mem_write(get('RCX'),bytes(u.mem_read(get('RDX'),get('R8'))));setr('RAX',get('RCX'))
     elif any(lo<=a<hi for lo,hi in [(0x1409705b0,0x140970ba3),(0x145bdb8d0,0x145bdbd93),(0x145bd6bf0,0x145bd70b9)]):return
     else:raise ValueError(hex(a))
     sp=get('RSP');setr('RIP',q(sp));setr('RSP',sp+8)
    u.hook_add(UC_HOOK_CODE,hook)
    for c in cases:
     cursor=scratch+0x1000;u.mem_write(scratch,bytes(0x100000));config,event,observer,resource,tick=[scratch+n for n in(0x100,0x200,0x300,0x400,0x500)];u.mem_write(config,struct.pack('<4f',*([.375]*4))+bytes(16));owned(event,c['key']);owned(event+0x30,c['input']);put(observer+8,'Q',event);put(resource,'Q',config);put(resource+16,'Q',tick);put(resource+28,'I',99);sp=stack+0x8000-8;put(sp,'Q',done)
     for name,val in [('RSP',sp),('RCX',0),('RDX',observer),('R8',resource)]:setr(name,val)
     u.emu_start(0x1409705b0,done,count=100000);assert get('RIP')==done;assert struct.unpack('<I',u.mem_read(tick,4))[0]==99
     raw=bytes(u.mem_read(config+c['offset'],4 if c['kind']=='f32'else 1));assert raw.hex()==c['native_bits_le'],c;vectors.append(dict(key=c['key'],input=c['input'],field=c['field'],offset=c['offset'],kind=c['kind'],native_bits_le=raw.hex()))
    return vectors

def gain_vectors(data,pe):
    u,scratch,stack,done,q,put,get,setr=machine(data,pe)
    cases=json.loads((ROOT/'docs/analysis/evidence/0.92/menu-audio.json').read_text())['native_fragment']['cases']
    def hook(_,a,n,__):
        if a==0x14097b780:u.emu_stop();return
        if a==0x145bfa16b:
            value=struct.unpack('<f',(get('XMM0')&0xffffffff).to_bytes(4,'little'))[0]
            result=math.log10(value)
            setr('XMM0',int.from_bytes(struct.pack('<f',result),'little'))
            sp=get('RSP');setr('RIP',q(sp));setr('RSP',sp+8)
        elif not 0x14097b742<=a<0x14097b780:raise AssertionError(hex(a))
    u.hook_add(UC_HOOK_CODE,hook)
    vectors=[]
    for case in cases:
        u.mem_write(scratch,bytes(0x100));put(scratch+0x10,'B',case['enabled']);put(scratch+0x12,'B',case['music_enabled']);put(scratch+8,'I',int(case['music_bits'],16));setr('RSI',scratch);setr('RSP',stack+0x8000)
        u.emu_start(0x14097b742,0,count=100)
        assert get('RIP')==0x14097b780
        actual=get('XMM0')&0xffffffff
        assert actual==int(case['native_db_bits'],16),case
        vectors.append(dict(case,native_db_bits=f'{actual:08x}'))
    return vectors


def contracts(data,pe):
    # The current MPQ hash and stored member range bind the GlueXML theme;
    # the filename is supplied by Lua and need not occur in the PE string table.
    member=dict(member='Interface\\GlueXML\\GlueParent.lua',file_pos=339284563,
                compressed_bytes=10517,uncompressed_bytes=10517,flags=0x80000000,
                sha256='78e8976a42de4ca5015555031abb54c48dd6f08eb424d42ddbacce732b9e6ccd')
    archive=reference_config()['data_dir']/'patch.MPQ'
    with archive.open('rb') as stream:
        stream.seek(member['file_pos']);raw=stream.read(member['uncompressed_bytes'])
    assert hashlib.sha256(raw).hexdigest()==member['sha256']
    assert b'CurrentGlueMusic = "Sound\\\\Music\\\\GlueScreenMusic\\\\wow_main_theme.mp3";'in raw
    assert b'PlayGlueMusic(CurrentGlueMusic);'in raw
    records={}
    for role,(a,b)in OWNERS.items():
        off=pe.rva_offset(a-pe.image_base);records[role]=dict(start=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(data[off:off+b-a]).hexdigest())
    result=dict(target_sha256=SHA,theme='Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3',
                native_fragment=dict(cases=gain_vectors(data,pe)),cases=cvar_vectors(data,pe),handoff=handoff(data,pe))
    assert len(result['native_fragment']['cases'])==9 and len(result['cases'])==82 and len(result['handoff'])==24
    source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/client.rs').read_text()
    bridge=source.split('if stock.is_none() && state.music_in_menu != Some(in_menu) {',1)[1].split('let Some(game)',1)[0]
    assert 'if in_menu {'in bridge and 'LocalMenuMusic::Play(crate::menu_audio::THEME.into())'in bridge and 'LocalMenuMusic::Stop'not in bridge
    glue=(ROOT/'crates/benilla-app/src/sound/glue.rs').read_text()
    for fragment in ['const GLUE_MUSIC_FADE_OUT_MS: u64 = 3000','const STOP_GLUE_MUSIC_FADE_MS: u64 = 1000','let fell = std::mem::replace(&mut *was_covered, covered) && !covered','*state.get() != ClientState::InWorld']:
        assert fragment in glue
    queries=[]
    for p in sorted((WORK/'audio-current/rea').glob('*-procedure_pseudo_code.json')):
        v=json.loads(p.read_text())['response']['result']['structuredContent'];queries.append(dict(operation=v['parameters'],evidence_id=v['evidence_id'],analysis_profile=v['analysis_profile']['digest'],subject_sha256=v['subject']['digest']['sha256']))
    if not queries and(RETAINED/'manifest.json').exists():queries=json.loads((RETAINED/'manifest.json').read_text())['ghidra']
    assert len(queries)==5
    manifest=dict(target=dict(version='0.109.0',sha256=SHA),owners=records,gluexml=dict(archive=next(row for row in latest_target(verify=False)['runtime_data']['archives'] if row['path']=='installed-game/Data/patch.MPQ'),**member),ghidra=queries,
                  numeric_helpers='docs/analysis/evidence/0.109.0/options-values/manifest.json',native_cases=115,
                  limits=['Original callback plus lexical/f32 parser execute; host seams provide Unicode trim for declared ASCII fixtures, scratch allocation/free and memcpy. Current gain uses a separately rounded CRT log10f seam.',
                          'Current load-drain predicates, cached cover state, changed tick, triple-buffer stop command and fading flag execute; optional tracing is disabled through its real current level gate.',
                          'Current focus/master full owners are hash-bound and Ghidra-reviewed; these checks do not execute their complete ECS window/resource query paths or device/backend code.',
                          'No compilation, Rust execution, MPQ decoder playback, audio device, game, actual Bevy scheduling or original/rebuilt comparison.'])
    return manifest,result


def main():
    p=argparse.ArgumentParser(description=__doc__);g=p.add_mutually_exclusive_group(required=True);g.add_argument('--collect',action='store_true');g.add_argument('--check',action='store_true');args=p.parse_args()
    target=latest_target(verify=False);assert target['version']=='0.109.0'and target['sha256']==SHA;data=target_bytes(target)
    module = load_script('native_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    manifest,vectors=contracts(data,pe)
    if args.collect:
        STAGED.mkdir(parents=True,exist_ok=True)
        for name,value in [('manifest.json',manifest),('native-vectors.json',vectors)]:(STAGED/name).write_text(encoded(value))
        sys.path.insert(0,str(ROOT/'runtime/tool-state/python/camera/python-libs'));from capstone import Cs,CS_ARCH_X86,CS_MODE_64
        decoder=Cs(CS_ARCH_X86,CS_MODE_64)
        for role,(a,b)in OWNERS.items():
            off=pe.rva_offset(a-pe.image_base);raw=data[off:off+b-a];body=f';0.109.0 SHA256 {SHA}\n;{a:#x}..{b:#x} SHA256 {hashlib.sha256(raw).hexdigest()}\n'
            body+='\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}'.rstrip()for i in decoder.disasm(raw,a))+'\n';(STAGED/(role+'.asm')).write_text(body)
    else:
        assert json.loads((RETAINED/'manifest.json').read_text())==manifest
        assert json.loads((RETAINED/'native-vectors.json').read_text())==vectors
    print('Verified 115 current native audio cases:82 CVar,9 gain,24 load-drain; no device/build/game')


if __name__=='__main__':main()

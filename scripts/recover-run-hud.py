#!/usr/bin/env python3
"""Recover/check the current custom HUD contracts without compiling or running a game.

--prepare writes selected raw REA/Ghidra plans under --work; invoke those plans
with scripts/rea-batch.py. --collect stages compact evidence for review there.
--check verifies retained native bytes and live source routes. --verify also
executes bounded original instructions with explicit scalar/input seams.
"""
from portable_paths import portable_json, portable_record
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
from collections import Counter
import hashlib
import itertools
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
RETAINED = ROOT / "docs/analysis/evidence/run-hud"
OWNERS = {
    "scale": 0x1401903B0,
    "visibility-settings": 0x14007D0B0,
    "persistence-load": 0x1402836B0,
    "drag-update-save": 0x140286CA0,
    "placement": 0x1402892C0,
    "drag-activation": 0x140289F40,
    "pause-actions": 0x14028B370,
    "pause-panel": 0x14028BCE0,
    "pause-children": 0x1402082F0,
    "visibility-projection": 0x14028DFD0,
    "hud-update": 0x14028E670,
    "hud-constructor": 0x14020CCD0,
    "boss-rows": 0x140209D00,
    "boss-content": 0x14020B1F0,
    "build-rows": 0x14020A060,
    "loot-update": 0x14028A610,
    "loot-children": 0x140206F40,
    "storage-write": 0x1458EEF30,
    "storage-base": 0x1458EF170,
    "storage-read": 0x1458F01C0,
    "framexml-loader": 0x1459A7290,
    "class-index": 0x14588D790,
    "class-atlas": 0x140063BA0,
    "drag-schedule-runner": 0x14029A5B0,
    "schedule-config": 0x144E1FC30,
    "schedule-ordering": 0x14013D450,
    "schedule-add": 0x1400B4130,
    "schedule-update": 0x1400E5C90,
    "stored-update": 0x14028C9F0,
    "stored-input": 0x14028C740,
    "stored-schedule-runner": 0x1402990E0,
    "stored-input-runner": 0x140296690,
    "schedule-chain": 0x144E9BF10,
    "stored-border-mix": 0x144C84CA0,
}
# Deliberately small canonical extracts; whole owner bytes are hash-bound below.
# Existing ready-label extracts remain owned by the hud-ready manifest.
SPANS = {
    "cvar-registration": (0x14007D0DC, 0x14007D21C),
    "visibility-parse": (0x14007D260, 0x14007D26D),
    "scale-clamp": (0x140190456, 0x14019049C),
    "drag-owner-inputs": (0x140286CE4, 0x140286D1D),
    "drag-position": (0x140286F03, 0x140286F21),
    "drag-release": (0x140286F26, 0x140286F45),
    "drag-file-write": (0x1402870AA, 0x1402870C5),
    "pause-confirmation": (0x14028B9F6, 0x14028BA12),
    "main-visibility": (0x14028E55E, 0x14028E58C),
    "banner-loot-visibility": (0x14028E0EB, 0x14028E139),
    "boss-health": (0x1402900D0, 0x1402900F8),
    "storage-write": (0x1458EEF30, 0x1458EF0A3),
    "storage-base": (0x1458EF170, 0x1458EF358),
    "storage-read": (0x1458F01C0, 0x1458F0315),
    "framexml-loader": (0x1459A7290, 0x1459A751D),
    # Stackless class-index has no PE unwind entry; both branches terminate in
    # RET and the following byte is INT3 before the next declared function.
    "class-index": (0x14588D790, 0x14588D7AF),
    "class-atlas": (0x140063BA0, 0x140063D68),
    "drag-schedule-registration": (0x140284915, 0x140284BAD),
    "drag-schedule-runner": (0x14029A5B0, 0x14029A8CA),
    "schedule-config-empty-conditions": (0x144E1FD19, 0x144E1FD72),
    "drag-group-empty-conditions": (0x140284A9C, 0x140284AD3),
    "schedule-ordering": (0x14013D450, 0x14013D503),
    "schedule-update-label": (0x1400E5CD1, 0x1400E5CEB),
    "schedule-update-name": (0x1400A6F50, 0x1400A6F65),
    "stored-admission": (0x14028CAA8, 0x14028CAD1),
    "stored-admission-flags": (0x14028CD42, 0x14028CD8E),
    "stored-display-animation": (0x14028CFDC, 0x14028D0C3),
    "stored-shadow-alpha": (0x14028D169, 0x14028D1A0),
    "stored-shadow-blur": (0x14028D1B4, 0x14028D1CF),
    "stored-transform": (0x14028D271, 0x14028D2C1),
    "stored-count-format": (0x14028D2C1, 0x14028D2D7),
    "stored-level-format": (0x14028D56F, 0x14028D61D),
    "stored-input": (0x14028C740, 0x14028C9F0),
    "stored-schedule-runner": (0x1402990E0, 0x1402993FA),
    "stored-input-runner": (0x140296690, 0x140296815),
    "stored-schedule-registration": (0x140284262, 0x14028430D),
    "stored-group-copy": (0x14028466C, 0x1402846CE),
    "stored-group-registration": (0x14028477D, 0x14028488E),
    "schedule-chain": (0x144E9BF10, 0x144E9BF2D),
    "stored-mix-admission": (0x144C84CA0, 0x144C84D14),
    "stored-mix-srgba": (0x144C84E2E, 0x144C84E49),
    "stored-mix-return": (0x144C84F18, 0x144C84F59),
}
# Canonical selected color conversion instructions are retained by shared style.
# Reuse them without another copy of their assembly in the HUD evidence folder.
COLOR_DEPENDENCY = "docs/analysis/evidence/overlay-style/manifest.json"
EXTERNAL_SPANS = [(0x144C85C10, 0x144C85C61), (0x144C8633B, 0x144C86386)]


def digest(value):
    return _shared_digest(value)


def dump(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def compact_vectors(full):
    """Keep reviewable boundaries; bind every asserted native case by digest."""
    counts = Counter(row['kind'] for row in full['cases'])
    assert dict(counts) == {
        'system-empty-conditions': 3, 'drag-group-empty-conditions': 3,
        'scale': 30, 'visibility': 8, 'drag-position': 6, 'drag-release': 1,
        'pause-confirmation': 18, 'main-visibility': 80, 'banner-loot-visibility': 24,
        'boss-health': 8, 'class-atlas': 256, 'stored-admission': 256,
        'stored-animation': 144, 'schedule-chain': 3,
        'stored-group-empty-conditions': 3,
    }
    grouped = {kind: [row for row in full['cases'] if row['kind'] == kind] for kind in counts}
    selected = {
        # Clamp edges, parse failure, finite maximum and all nonfinite encodings.
        'scale': [0,1,2,4,6,8,12,16,18,20,22,24,26,28],
        'visibility': [0,1,3,4],
        'drag-position': [0,1,2,5],
        'drag-release': [0],
        # Unarmed, both sides of .35 and 3, plus the exact boundaries.
        'pause-confirmation': [0,9,11,12,13,15,16,17],
        'main-visibility': [0,15,75,76,77,78,79],
        'banner-loot-visibility': [2,5,8,11,14,17,18,19,20,23],
        'boss-health': list(range(8)),
        # Every supported class and the zero/unknown/maximum-ID fallbacks.
        'class-atlas': [0,1,2,3,4,5,7,8,9,11,255],
    }
    representatives = []
    for kind, rows in grouped.items():
        if kind in selected:
            representatives.extend(rows[index] for index in selected[kind])
        elif kind == 'stored-admission':
            # Positive count, zero, u32 maximum, and each independent rejection.
            inputs = [(count,2,0,1,255,255,0) for count in [0,1,0xffffffff]]
            inputs += [(1,3,0,1,255,255,0), (1,2,1,1,255,255,0),
                       (1,2,0,0,255,255,0), (1,2,0,1,0,255,0),
                       (1,2,0,1,255,0,0), (1,2,0,1,255,255,1)]
            representatives.extend(row for row in rows if tuple(row['inputs']) in inputs)
        elif kind == 'stored-animation':
            inputs = [(0.,0,0.,-1.), (0.,0,.016,0.), (0.,0,.1,1.),
                      (1.,2,.016,-1.), (1.,2,1.,1.), (.25,1,.016,.75),
                      (0.,0,0.,0.), (0.,0,0.,.75)]
            representatives.extend(row for row in rows if tuple(row['inputs']) in inputs)
        else:
            assert 'poison' in rows[0]
            representatives.extend([rows[0],rows[-1]])
    f32 = lambda value: struct.unpack('<f',struct.pack('<f',value))[0]
    bits = lambda value: struct.unpack('<I',struct.pack('<f',value))[0]
    from_bits = lambda value: struct.unpack('<f',struct.pack('<I',value))[0]
    divergent = []
    for row in grouped['stored-animation']:
        h, pulse = from_bits(row['hover_bits']), from_bits(row['pulse_bits'])
        blend = max(h,f32(pulse*f32(.35)))
        previous = [bits(f32(f32(a)+f32(f32(f32(b)-f32(a))*blend)))
                    for a,b in zip([.690,.541,.227],[1.,.914,.659])]
        if previous != row['border_rgba_bits'][:3]:
            divergent.append(dict(inputs=row['inputs'],previous_rgb_bits=previous,
                                  native_rgb_bits=row['border_rgba_bits'][:3]))
    assert len(divergent) == 58
    for row in divergent[:2]:
        assert any(case.get('inputs') == row['inputs'] and case['kind'] == 'stored-animation'
                   for case in representatives)
    canonical = json.dumps(full,sort_keys=True,separators=(',',':')).encode()
    return dict(schema_version=1,target_sha256=full['target_sha256'],
                scope='Selected boundary representatives; the checker asserts every full native case.',
                total_case_count=len(full['cases']),category_counts=dict(sorted(counts.items())),
                full_canonical_vectors_sha256=digest(canonical),
                canonical_serialization='UTF-8 JSON, sort_keys=True, separators=(comma,colon), ensure_ascii=True, no final newline',
                representative_case_count=len(representatives),
                border_rounding_divergences=dict(count=len(divergent),examples=divergent[:2]),
                seams=full['seams'],representative_cases=representatives)


def dump_compact_vectors(path, fixture):
    # One representative per line keeps the durable fixture compact and diffable.
    header = dict(fixture,representative_cases=[])
    rows = ',\n'.join('    '+json.dumps(row,separators=(',',':'))
                     for row in fixture['representative_cases'])
    value = json.dumps(header,indent=2).replace(
        '"representative_cases": []','"representative_cases": [\n'+rows+'\n  ]',1)
    path.write_text(value+'\n')


def cover_source_check():
    base = ROOT / "crates/azeroth-survivors-re/src/gameplay"
    host = ROOT / "crates/benilla-app/src"
    loading = (host / "loading_screen.rs").read_text()
    assert "drive_loading_screen.in_set(WorldStage::Present)" in loading
    client = (host / "local_client.rs").read_text()
    cover = client.split("pub struct LocalClientLoadingCover<'w>", 1)[1]
    cover = cover.split("/// Queue the production host's", 1)[0]
    assert "Option<Res<'w, crate::loading_screen::LoadingScreen>>" in cover
    assert "self.screen.as_ref().is_some_and(|screen| screen.covering())" in cover
    notifications = (base / "notifications.rs").read_text()
    hud = (base / "run_hud/mod.rs").read_text()
    for source in (notifications, hud):
        assert ".after(WorldStage::Present)" in source
    assert 'settings.shown("banners"), super::run_hud::cvar_shown' in notifications
    assert "state.defer_expiry = covered;" in notifications
    assert "if shown && !covered {" in notifications
    loot = (base / "run_hud/loot.rs").read_text()
    assert 'settings.shown("loot") && !covered' in loot
    assert "session.paused || choosing || covered" in loot
    clock = (base / "run_hud/local_clock.rs").read_text()
    assert '&& !covered\n            && settings.shown("localClock")' in clock
    for source in (notifications, loot, clock):
        assert "let covered = loading.covering();" in source
        assert "input.loading_screen_covering" not in source


def source_check():
    base = ROOT / "crates/azeroth-survivors-re/src/gameplay"
    controls = (base / "run_hud/controls.rs").read_text()
    body = controls.split("pub(super) fn input(", 1)[1].split("pub(super) fn place(", 1)[0]
    drag, admission = body.index("if let Some(drag) = state.drag.as_ref()"), body.index("if !in_run")
    assert drag < body.index("layout::write(path, &settings.positions)") < admission
    assert "state.drag = None;" not in body[:drag]
    assert "drag.position + pointer - drag.pointer" in body
    assert "window\n        .cursor_position()" in body
    assert "touches.iter().next().map(|touch| touch.position())" in body
    assert "!mouse.pressed(MouseButton::Left) && touches.iter().next().is_none()" in body
    assert 'native_base_directory().map(|base| base.join("hud.txt"))' in controls
    assert "rendered_minimap_rect" in controls and "rect[2] - rect[0] > 1." in controls
    layout = (base / "run_hud/layout.rs").read_text()
    assert 'PARTS: [&str; 2] = ["tally", "build"]' in layout
    assert "x.is_finite() && y.is_finite()" in layout
    assert "std::fs::write(path, text(positions))" in layout
    settings = (base / "run_hud/settings.rs").read_text()
    for part, cvar in [("clock","hudClock"),("bosses","hudBosses"),("tally","hudTally"),
                      ("build","hudBuild"),("banners","hudBanners"),("loot","hudLoot"),
                      ("meter","hudMeter"),("levels","hudLevels"),("flag","hudFlag")]:
        assert f'("{part}", "{cvar}")' in settings
    assert 'value.trim() != "0"' in settings and 'value.clamp(0.5, 2.)' in settings
    view = (base / "run_hud/view.rs").read_text()
    assert 'format!("{:02}:{:02}", seconds / 60, seconds % 60)' in view
    assert "f64::from(maximum_health).max(1.) * 100." in view
    assert "game.guardian_awake(actor.guid)" in view
    assert 'if bars.len() == 1 { 520. } else { 420. }' in view
    assert 'if index == 0 { 17. } else { 15. }' in view
    assert 'if index == 0 { 14. } else { 11. }' in view
    assert 'native_hud_questionmark' in view
    assert 'game.worn_amulet()' in view and 'game.jewelry()' in view
    assert 'visibility(settings.shown("clock"))' in view
    assert 'spawn_bars(ui, bars, art, settings.shown("bosses"))' in view
    cover_source_check()
    assert 'meter.shown = meter.mirrors[0].effective.trim() != "0";' in (base / "meter.rs").read_text()
    assert 'settings.shown("levels")' in (base / "stored_hud.rs").read_text()
    stored = ''.join((base / 'stored_hud.rs').read_text().split())
    for token in ['game.stored_levels()>0&&settings.shown("levels")',
                  '!session.paused&&!game.is_paused_for_choice()',
                  'game.stored_levels().to_string()',
                  'locale.label("LEVEL{n}").replace("{n}",&game.level.to_string())',
                  'ifnode.display==Display::None{continue;}',
                  '(time.delta_secs()*14.).min(1.)',
                  '(time.elapsed_secs()*2.6).sin()*0.5+0.5',
                  'h.max(pulse*0.35)', 'letremaining=1.-t;',
                  'Color::srgb(0.690*remaining+t,0.541*remaining+0.914*t,0.227*remaining+0.659*t)',
                  '0.2+pulse*0.25+h*0.3', '20.+h*8.', 'h*-3.', '1.+h*0.03']:
        assert token in stored, token
    consumer = ''.join((base / 'mod.rs').read_text().split())
    assert 'With<stored_hud::OpenStoredLevels>' in consumer
    assert '*interaction==Interaction::Pressed&&node.display==Display::Flex' in consumer
    assert 'game.open_stored_levels();' in consumer
    assert 'hud_settings.shown("flag")' in (base / "mod.rs").read_text()
    pause = (base / "run_hud/pause.rs").read_text()
    assert "now - start >= 0.35 && now - start < 3." in pause
    assert "now - start < 0.35 => false" in pause
    assert 'options.open = true;' in pause and 'session.mechanics.as_mut().unwrap().abandon(' in pause
    assert 'SessionRequest::Logout' in pause and 'exit.write(AppExit::Success)' in pause
    assert 'custom_game_menu_requested && session.talent_view_open' in pause
    bridge = (base / "client/framexml_hud.rs").read_text()
    assert 'world-state-patch.lua' in bridge and 'SOURCE.into()' in bridge
    assert '.split_once(' not in bridge and r'Interface\FrameXML\WorldStateFrame.lua' in bridge
    assert 'framexml_hud::appends()' in (base / 'client.rs').read_text()
    host = ROOT / 'crates/benilla-app/src/ui_script'
    assert 'extension.framexml_appends.clone()' in (host/'lifecycle.rs').read_text()
    loader = (host/'manifest.rs').read_text().split('fn load_ingame_ui_with_appends(',1)[1].split('#[cfg(test)]',1)[0]
    assert loader.index('load_core_with_appends(script, appends)') < loader.index('load_layer(script)') < loader.index('load_third_party(')


def replay(raw):
    import unicorn as u
    from unicorn import x86_const as x
    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    scratch = 0x400000000
    machine.mem_map(scratch, 0x10000)
    spans = list(SPANS.values()) + EXTERNAL_SPANS
    pages = {address & ~4095 for a,b in spans for address in range(a,b+4095,4096)}
    # Selected scale literals; the other branches use supplied registers/memory.
    for address in (0x145D9D2A0, 0x145DD4D08): pages.add(address & ~4095)
    # The two connected class leaves read immutable PE tables and literals.
    import capstone
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
    for role in ['class-index','class-atlas','stored-display-animation','stored-shadow-alpha',
                 'stored-shadow-blur','stored-transform','stored-mix-admission',
                 'schedule-chain']:
        a,b=SPANS[role]
        for instruction in decoder.disasm(raw(a,b-a),a):
            for operand in instruction.operands:
                if operand.type==capstone.CS_OP_MEM and operand.mem.base==capstone.x86_const.X86_REG_RIP:
                    address=instruction.address+instruction.size+operand.mem.disp
                    pages.update([address&~4095,(address+127)&~4095])
    pages.add(0x146AF06D8 & ~4095)  # Shared selected color conversion dispatch.
    for page in sorted(pages):
        machine.mem_map(page,4096)
        machine.mem_write(page,raw(page,4096))
    def reg(name,value=None):
        key=getattr(x,'UC_X86_REG_'+name)
        if value is None: return machine.reg_read(key)
        machine.reg_write(key,value)
    def f32(value):return struct.unpack('<f',struct.pack('<f',value))[0]
    def bits(value):return struct.unpack('<I',struct.pack('<f',value))[0]
    def vector(name,values):reg(name,int.from_bytes(struct.pack('<4f',*values),'little'))
    def scalar(name):return struct.unpack('<f',struct.pack('<I',reg(name)&0xffffffff))[0]
    def double(name,value):reg(name,int.from_bytes(struct.pack('<d',value),'little'))
    def write(at,data):machine.mem_write(at,data)
    def q(at,value):write(at,struct.pack('<Q',value))
    stops=set()
    def hook(cpu,address,size,unused):
        if address in stops:cpu.emu_stop()
        elif not any(a<=address<b for a,b in spans):raise RuntimeError('Unreviewed native instruction '+hex(address))
    machine.hook_add(u.UC_HOOK_CODE,hook)
    def run(start,*end):
        stops.clear();stops.update(end);reg('MXCSR',0x1f80)
        machine.emu_start(start,0,count=1000)
        assert reg('RIP') in stops
        return reg('RIP')
    rows=[]
    for poison in [0,0xa5,0xff]:
        output=scratch+0x5000;frame=scratch+0x6000
        write(output,bytes([poison])*0x70);q(frame-0x10,scratch+0x7000);q(frame-0x18,0x145df1890)
        reg('RSI',output);reg('RBP',frame);reg('R15',0);reg('RBX',8)
        run(0x144e1fd19,0x144e1fd72)
        result=list(struct.unpack('<3Q',machine.mem_read(output+0x48,24)))
        assert result==[0,8,0]
        rows.append(dict(kind='system-empty-conditions',poison=poison,conditions=result))
        write(frame-0x60,bytes([poison])*0x70);reg('RAX',scratch+0x7000)
        run(0x140284a9c,0x140284ad3)
        result=list(struct.unpack('<3Q',machine.mem_read(frame-0x40,24)))
        assert result==[0,8,0]
        rows.append(dict(kind='drag-group-empty-conditions',poison=poison,conditions=result))
    for word in [bits(v) for v in [0.,-0.,-2.,.25,.5,.75,1.,1.5,2.,3.]]+[0x7f7fffff,0x7f800000,0xff800000,0x7fc00000,0x7f800001]:
        for error in [0,1]:
            reg('RDI',word<<32|error);run(0x140190456,0x14019049c)
            value=struct.unpack('<f',struct.pack('<I',word))[0]
            expected=1. if error or (word&0x7fffffff)>0x7f7fffff else max(.5,min(2.,value))
            assert scalar('XMM0')==expected
            rows.append(dict(kind='scale',parsed_bits=f'{word:08x}',error=error,result=reg('XMM0')&0xffffffff))
    for text in ['', '0','1','00','0.0','false','-0','yes']:
        write(scratch,text.encode()+b'\0');reg('RAX',scratch);reg('RDX',len(text));reg('R15',1)
        run(0x14007d260,0x14007d26d);result=reg('R15')&255
        assert result==int(text!='0');rows.append(dict(kind='visibility',trimmed=text,result=result))
    for index in [0,1]:
        for initial,pointer,origin in [((5.,8.),(12.,20.),(10.,15.)),((-3.,900.),(0.,0.),(5.,8.)),((0.,0.),(17.5,-40.25),(1.,2.))]:
            vector('XMM6',[*initial,0,0]);vector('XMM0',[*pointer,0,0]);vector('XMM7',[*origin,0,0])
            reg('RDI',scratch+0x100);reg('RBX',index);reg('R14',scratch+0x200);reg('R15',17)
            run(0x140286f03,0x140286f21)
            got=struct.unpack('<2f',machine.mem_read(scratch+0x104+index*12,8));expected=tuple(f32(f32(a+b)-c) for a,b,c in zip(initial,pointer,origin))
            assert got==expected;rows.append(dict(kind='drag-position',part=index,initial=initial,pointer=pointer,origin=origin,result=got))
    reg('RDI',scratch+0x100);reg('R14',scratch+0x200);reg('R15',17);reg('RBP',scratch+0x400)
    run(0x140286f26,0x140286f45);assert machine.mem_read(scratch+0x120,1)==b'\x02'
    rows.append(dict(kind='drag-release',active_state=2))
    for armed in [0,1]:
        for elapsed in [0.,.1,.34999996,.35,.35000002,1.,2.9999998,3.,3.0000002]:
            reg('RCX',scratch+0x600);write(scratch+0x618,struct.pack('<If',armed,0.))
            reg('XMM0',bits(elapsed));reg('XMM6',bits(.35));reg('XMM7',bits(3.))
            end=run(0x14028b9f6,0x14028b4e4,0x14028ba12,0x14028ba4e)
            expected=0x14028ba4e if not armed or f32(elapsed)>=3. else 0x14028b4e4 if f32(elapsed)<f32(.35) else 0x14028ba12
            assert end==expected;rows.append(dict(kind='pause-confirmation',armed=armed,elapsed_bits=bits(elapsed),branch=hex(end)))
    stack=scratch+0x1000;flags=scratch+0x2000
    for bits_value in range(16):
        values=bytes((bits_value>>i)&1 for i in range(4));write(flags,values)
        for part,index in [('clock',0),('next-boss',0),('bosses',1),('tally',2),('build',3)]:
            reg('RSP',stack);q(stack+0x18,flags);reg('RBX',flags+1);reg('RSI',int(index==1));reg('RBP',int(index==3));write(stack+4,struct.pack('<I',int(index==2)))
            run(0x14028e55e,0x14028e58c);result=reg('RAX')&255
            assert result==1-values[index];rows.append(dict(kind='main-visibility',flags=list(values),part=part,hidden=result))
    for bits_value in range(8):
        loading,banners,loot=((bits_value>>i)&1 for i in range(3));write(flags+4,bytes([banners,loot]));write(flags+16,bytes([loading]));q(stack+0x18,flags)
        for marker in ['banner','loot','both']:
            reg('RSP',stack);reg('R10',flags+16);reg('R8',int(marker!='loot'));reg('R15',int(marker!='banner'));reg('RBP',0)
            run(0x14028e0eb,0x14028e0f4,0x14028e139);result=reg('R9')&255
            expected=int(bool(loading or marker!='loot' and not banners or marker!='banner' and not loot))
            assert result==expected;rows.append(dict(kind='banner-loot-visibility',flags=[loading,banners,loot],marker=marker,hidden=result))
    for health,maximum in [(0.,0.),(-1.,100.),(1.,0.),(1.,1.),(50.,100.),(101.,100.),(12.5,125.),(1e30,1e30)]:
        health,maximum=f32(health),f32(maximum)
        double('XMM0',maximum);double('XMM8',1.);double('XMM9',100.);double('XMM10',health)
        run(0x1402900d0,0x1402900f8);result=scalar('XMM0');expected=f32(min(100.,max(0.,health/max(1.,maximum)*100.)))
        assert result==expected;rows.append(dict(kind='boss-health',health=health,maximum=maximum,result_bits=bits(result)))
    for class_id in range(256):
        reg('RCX',class_id);run(0x14588d790,0x14588d7a6,0x14588d7ae)
        descriptor=reg('RAX')
        for page in [descriptor&~4095,(descriptor+0x90)&~4095]:
            if page not in pages:
                machine.mem_map(page,4096);machine.mem_write(page,raw(page,4096));pages.add(page)
        reg('RCX',scratch+0x3000);reg('RDX',descriptor)
        run(0x140063ba0,0x140063d67)
        result=struct.unpack('<4f',machine.mem_read(scratch+0x3000,16))
        column,row={2:(0,2),3:(0,1),4:(2,0),5:(2,1),7:(1,1),8:(1,0),9:(3,1),11:(3,0)}.get(class_id,(0,0))
        xx=[0.,64.,127.,190.,253.];expected=(xx[column],row*64.,xx[column+1],(row+1)*64.)
        assert result==expected,(class_id,result,expected)
        rows.append(dict(kind='class-atlas',class_id=class_id,rect=result))
    frame, screen, flags, number = [scratch+offset for offset in (0x8000,0x9000,0x9200,0x9400)]
    for count,kind,number_tag,levels,choice,reward,paused in itertools.product(
            [0,1,9,0xffffffff],[2,3],[0,1],[0,1],[0,0xff],[0,0xff],[0,1]):
        reg('RBP',frame);reg('RDI',screen);reg('RBX',flags);reg('RAX',number)
        write(number,struct.pack('<B7xQQ',kind,number_tag,count))
        write(flags+7,bytes([levels]));write(screen+0x80,bytes([choice]))
        write(screen+0xa0,bytes([reward]));write(screen+0xea,bytes([paused]))
        run(0x14028caa8,0x14028cacd)
        shown=struct.unpack('<I',machine.mem_read(frame+0x144,4))[0]
        expected=int(kind==2 and number_tag==0 and count>0 and levels and choice==reward==0xff and not paused)
        assert shown==expected
        node,tick=scratch+0x9800,scratch+0x9a00
        write(node+0x175,b'\xa5');reg('RSI',node);reg('R9',tick);write(frame+0xf0,struct.pack('<I',123))
        run(0x14028cfdc,0x14028d00b,0x14028d863)
        display=machine.mem_read(node+0x175,1)[0]
        assert display==(0 if shown else 3)
        rows.append(dict(kind='stored-admission',inputs=[count,kind,number_tag,levels,choice,reward,paused],shown=shown,display=display))
    clock,hover,interaction,tick=scratch+0xa000,scratch+0xa100,scratch+0xa200,scratch+0xa300
    for initial,interact,delta in itertools.product([0.,.25,1.],[0,1,2],[0.,.016,.1,1.]):
        reg('RBP',frame);reg('RBX',hover);reg('R10',tick);q(frame+0x148,interaction);write(interaction,bytes([interact]))
        q(frame+0xa0,clock);q(frame+0x138,tick);write(clock+0x58,struct.pack('<2f',delta,5.125));write(hover,struct.pack('<f',initial))
        run(0x14028d00b,0x14028d06d)
        h=f32(initial+f32(f32((0. if interact==2 else 1.)-initial)*min(f32(f32(delta)*14.),1.)))
        assert scalar('XMM7')==h and scalar('XMM0')==f32(f32(5.125)*f32(2.6))
        for sine in [-1.,0.,.75,1.]:
            reg('XMM0',bits(sine));reg('XMM7',bits(h))
            run(0x14028d072,0x14028d0a9)
            pulse=f32(f32(sine*.5)+.5);blend=max(h,f32(pulse*f32(.35)))
            assert scalar('XMM6')==pulse and scalar('XMM3')==blend
            # Run real tag0 interpolation and the shared tag0 conversion path.
            reg('RSP',scratch+0xf008);reg('RCX',scratch+0xb000);reg('RDX',0x145df157c);reg('R8',0x145df1590);reg('XMM3',bits(blend))
            run(0x144c84ca0,0x144c84f58)
            result=bytes(machine.mem_read(scratch+0xb000,20))
            channels=[f32(f32(f32(a)*f32(1.-blend))+f32(f32(b)*blend)) for a,b in zip([.690,.541,.227,1.],[1.,.914,.659,1.])]
            assert result==struct.pack('<I4f',0,*channels)
            reg('RBP',frame);reg('RBX',hover);reg('XMM6',bits(pulse));write(frame+0xd0,bytes(16))
            run(0x14028d169,0x14028d1a0)
            alpha=f32(f32(f32(pulse*.25)+f32(.2))+f32(h*f32(.3)))
            assert scalar('XMM0')==alpha
            run(0x14028d1b4,0x14028d1cf);blur=f32(f32(h*8.)+20.);assert scalar('XMM0')==blur
            reg('RSI',tick);reg('R12',scratch+0xb200)
            run(0x14028d271,0x14028d2c1)
            lift,scale=struct.unpack('<2f',machine.mem_read(scratch+0xb20c,8))
            assert lift==f32(h*-3.) and scale==f32(f32(h*f32(.03))+1.)
            rows.append(dict(kind='stored-animation',inputs=[initial,interact,delta,sine],hover_bits=bits(h),pulse_bits=bits(pulse),border_rgba_bits=[bits(v) for v in channels],shadow_alpha_bits=bits(alpha),blur_bits=bits(blur),lift_bits=bits(lift),scale_bits=bits(scale)))
    for poison in [0,0xa5,0xff]:
        pointer=scratch+0xc000;write(pointer,bytes([poison])*0x40);q(pointer,0);reg('RCX',pointer)
        run(0x144e9bf10,0x144e9bf16,0x144e9bf2c)
        result=bytes(machine.mem_read(pointer,32));assert result==raw(0x146b4f730,32)
        assert bytes(machine.mem_read(pointer+32,32))==bytes([poison])*32
        rows.append(dict(kind='schedule-chain',poison=poison,result_hex=result.hex()))
        reg('RBP',frame);reg('RAX',scratch+0xc800);write(frame-0x60,bytes([poison])*0x70)
        run(0x14028477d,0x1402847a8)
        result=list(struct.unpack('<3Q',machine.mem_read(frame-0x40,24)))
        assert result==[0,8,0]
        rows.append(dict(kind='stored-group-empty-conditions',poison=poison,conditions=result))
    return dict(target_sha256=SHA,cases=rows,seams=['CVar strings are supplied after native trim; registry/trim calls are separately traced.', 'ECS membership and scalar inputs are supplied at selected original instruction boundaries.', 'Persistence external write, allocator, UI renderer and Windows sinf are not executed.'])


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    for flag in ('prepare','collect','check','verify'):parser.add_argument('--'+flag,action='store_true')
    parser.add_argument('--work',default='runtime/analysis/history/findings/fixgap7-complete/7440840c0273')
    args=parser.parse_args();work=project_path(args.work)
    target=latest_target(verify=True);assert target['sha256']==SHA,'Installed target changed; recover its contracts first'
    data=target_bytes(target)
    module = load_script('hud109_pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    bounds={pe.image_base+a:pe.image_base+b for a,b,*_ in pe.functions()}
    for role in ['class-index','class-atlas','schedule-chain']:
        assert OWNERS[role] not in bounds
        bounds[OWNERS[role]]=SPANS[role][1]
    def raw(a,count):
        at=pe.rva_offset(a-pe.image_base);result=data[at:at+count];assert len(result)==count;return result
    def span(a,b):return dict(address=hex(a),end_exclusive=hex(b),file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=b-a,sha256=digest(raw(a,b-a)))
    anchor=data.index(b'function AZS_MainBar_Slice(');start=data.rfind(b'\0',0,anchor)+1;end=data.index(b'\0',anchor);patch=data[start:end]
    canonical=ROOT/'docs/analysis/evidence/hud-framexml/world-state-patch.lua'
    assert patch==canonical.read_bytes(),'Current FrameXML Lua differs from retained patch'
    descriptor=end+4;assert data[descriptor:descriptor+16]==struct.pack('<QQ',pe.offset_va(start),len(patch))
    assert struct.unpack('<Q',raw(0x145DF1890+72,8))[0]==OWNERS['drag-schedule-runner']
    assert struct.unpack('<Q',raw(0x145DD2538+24,8))[0]==0x1400A6F50
    assert raw(0x145DD1EEA,6)==b'Update'
    assert raw(0x14029A7D9,1)==b'\xe8'
    assert 0x14029A7DE+struct.unpack('<i',raw(0x14029A7DA,4))[0]==OWNERS['drag-update-save']
    for table,runner,call,callee in [(0x145DF1E78,'stored-schedule-runner',0x14029933D,'stored-update'),
                                    (0x145DF1DD0,'stored-input-runner',0x14029676E,'stored-input')]:
        assert struct.unpack('<Q',raw(table+72,8))[0]==OWNERS[runner]
        assert raw(call,1)==b'\xe8' and call+5+struct.unpack('<i',raw(call+1,4))[0]==OWNERS[callee]
    metadata=dict(target={key:target[key] for key in ('version','path','sha256','size_bytes')},owners=[dict(role=role,**span(a,bounds[a])) for role,a in OWNERS.items()],ranges=[dict(role=role,**span(a,b)) for role,(a,b) in SPANS.items()],framexml=dict(canonical=canonical.relative_to(ROOT).as_posix(),**span(pe.offset_va(start),pe.offset_va(start)+len(patch)),descriptor=span(pe.offset_va(descriptor),pe.offset_va(descriptor)+16)),limits=['Selected current owner and instruction contracts; generic engine allocator/query/font/GPU/filesystem behavior is not certified by owner hashes.', 'No builds, compiling tests, game, platform input or original/rebuilt comparison.'])
    metadata['dependencies']=[dict(canonical=COLOR_DEPENDENCY,ranges=[span(a,b) for a,b in EXTERNAL_SPANS])]
    metadata['literals']=[dict(role=role,**span(a,a+count),bytes_hex=raw(a,count).hex()) for role,a,count in [('drag-system-vtable',0x145DF1890,168),('update-label-vtable',0x145DD2538,88),('update-label-name',0x145DD1EEA,6),('stored-system-vtable',0x145DF1E78,168),('stored-input-vtable',0x145DF1DD0,168),('stored-levels-key',0x145DF1570,12),('stored-level-key',0x145DF123D,5),('stored-level-format',0x145DF15B8,9),('stored-border-base',0x145DF157C,20),('stored-border-target',0x145DF1590,20),('stored-mix-dispatch-zero',0x146AEF5EC,4),('schedule-chain-metadata',0x146B4F730,32)]]
    vectors = replay(raw) if args.verify else None
    if vectors is not None:
        work.mkdir(parents=True,exist_ok=True)
        dump(work/'vectors-full.json',vectors)
        fixture = compact_vectors(vectors)
    if args.prepare:
        groups={'controls':[OWNERS[r] for r in ['persistence-load','drag-update-save','drag-activation','pause-actions','visibility-projection']], 'leaves':[OWNERS[r] for r in ['scale','pause-children','boss-content']], 'storage':[OWNERS[r] for r in ['storage-write','storage-base','storage-read']], 'framexml':[OWNERS['framexml-loader']], 'class-index':[OWNERS['class-index']], 'class-atlas':[OWNERS['class-atlas']], 'schedule-front':[OWNERS[r] for r in ['schedule-add','schedule-update','schedule-ordering','drag-schedule-runner']], 'schedule-config':[OWNERS['schedule-config']], 'stored':[OWNERS['stored-update']], 'stored-input':[OWNERS['stored-input']], 'stored-schedule-runner':[OWNERS['stored-schedule-runner']], 'schedule-chain':[OWNERS['schedule-chain']], 'stored-border-mix':[OWNERS['stored-border-mix']]}
        for name,starts in groups.items():
            folder=work/name;folder.mkdir(parents=True,exist_ok=False);a,b=min(starts),max(bounds[x] for x in starts)
            (folder/'range.bin').write_bytes(raw(a,b-a));(folder/'seeds.tsv').write_text(''.join(f'{hex(x)}\tfunction\n{hex(x)}\tcode\n' for x in starts))
            dump(folder/'plan.json',dict(target=str((folder/'range.bin').relative_to(ROOT)),output=str((folder/'session').relative_to(ROOT)),init_timeout=60,timeout=240,open_timeout=60,open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),environment=dict(REA_GHIDRA_SEED_FILE=str((folder/'seeds.tsv').relative_to(ROOT)),REA_GHIDRA_STARTUP_TIMEOUT_MS='180000',REA_GHIDRA_DISABLED_ANALYZERS='Function ID,Function Start Search,Create Address Tables'),operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(x))) for x in starts]))
        print('Prepared selected current HUD REA plans')
    if args.collect:
        import capstone
        output=work/'curated';output.mkdir(parents=True,exist_ok=True);decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
        for row in metadata['ranges']:
            a=int(row['address'],16);buf=raw(a,row['byte_count']);instructions=list(decoder.disasm(buf,a));assert b''.join(bytes(i.bytes) for i in instructions)==buf
            filename=row['role']+'.asm';text=''.join(f'{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions);(output/filename).write_text(text)
            row.update(assembly=filename,assembly_sha256=digest(text.encode()))
        dump(output/'manifest.json',metadata)
        observations=[]
        # Keep compact provider identities and exact raw-to-PE input mappings,
        # without copying whole decompilations or transient machine paths.
        for session in sorted(work.glob('*/session')):
            for file in sorted(session.glob('*.json')):
                result=json.loads(file.read_text()).get('response',{}).get('result',{})
                record=result.get('structuredContent')
                if record is None and result.get('content'):
                    record=json.loads(result['content'][0]['text'])
                if not isinstance(record,dict) or record.get('operation')!='procedure_pseudo_code':continue
                address=int(record['parameters']['procedure'],16)
                role=next((role for role,a in OWNERS.items() if a==address),None)
                if role is None:continue
                profile=record['analysis_profile'];entry=int(profile['parameters']['entry_point'],16)
                subject=project_path(record['subject']['local_path']);buf=subject.read_bytes()
                assert buf==raw(entry,len(buf)) and digest(buf)==record['subject']['digest']['sha256']
                observations.append(dict(role=role,procedure=hex(address),evidence_id=record['evidence_id'],provider=profile['provider'],analysis_profile_digest=profile['digest'],input_mapping=span(entry,entry+len(buf)),limits=['Raw import omits full-PE data, global callers and indirect target relationships.', 'Generic Ghidra gcc typing is not Win64 ABI or Rust source proof.']))
        dump(output/'rea-records.json',dict(target_sha256=SHA,observations=observations))
        if args.verify:dump_compact_vectors(output/'vectors.json',fixture)
        print('Staged compact current HUD evidence')
    if args.check:
        retained=json.loads((RETAINED/'manifest.json').read_text())
        expected=dict(retained)
        expected['ranges']=[{k:v for k,v in r.items() if k not in ('assembly','assembly_sha256')} for r in retained['ranges']]
        assert expected==metadata
        dependency=json.loads((ROOT/COLOR_DEPENDENCY).read_text())
        assert dependency['target']['sha256']==SHA
        for a,b in EXTERNAL_SPANS:
            assert any(row['start']==hex(a) and row['end_exclusive']==hex(b) and row['sha256']==digest(raw(a,b-a)) for row in dependency['ranges'])
        for row in retained['ranges']:
            assert digest((RETAINED/row['assembly']).read_bytes())==row['assembly_sha256']
        rea=json.loads((RETAINED/'rea-records.json').read_text());assert rea['target_sha256']==SHA
        assert len(rea['observations'])==24
        for row in rea['observations']:
            mapping=row['input_mapping'];assert mapping==span(int(mapping['address'],16),int(mapping['end_exclusive'],16))
            assert OWNERS[row['role']]==int(row['procedure'],16) and row['provider']['id']=='ghidra'
        source_check()
        if args.verify:
            saved=json.loads((RETAINED/'vectors.json').read_text())
            assert portable_record(saved)==portable_record(json.loads(json.dumps(fixture)))
            print(f'Passed {len(vectors["cases"])} bounded original-instruction HUD cases; verified full digest and {len(fixture["representative_cases"])} representatives')
        print('Verified current HUD owner/range/Lua identities and source routes')
    elif args.verify and not args.collect:print(f'Passed {len(vectors["cases"])} bounded original-instruction HUD cases')


if __name__=='__main__':
    main()

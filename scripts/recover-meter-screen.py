#!/usr/bin/env python3
"""Reproduce selected meter contracts without builds or reference execution.

Uses the existing project-local Unicorn installation for unchanged x86-64
instruction fragments. REA/Ghidra discoveries are named in the retained manifest;
this script reads only the selected hash-bound EXE and retained text evidence.
"""
from portable_paths import objdump_output, portable_json, portable_record
from native_recovery import bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import re
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/native-recovery/meter-screen/fc23cd6fef39"
STAGE = ROOT / "runtime/analysis/staging/native-evidence/run-meters/screen"
RETAINED = ROOT / "docs/analysis/evidence/run-meters/screen"
SPANS = {
    "settings-save": (0x1401661E0, 0x1401662FD),
    "settings-load": (0x1401664A7, 0x14016660D),
    "settings-mode": (0x140168F0C, 0x140168F6A),
    "input-actions": (0x14016D2B5, 0x14016D59F),
    "move-resize": (0x14016D940, 0x14016DBC7),
    "display-baseline-history": (0x14016DF34, 0x14016E330),
    "view-time-current": (0x14016E4C7, 0x14016E672),
    "minimap-button-position": (0x140171AC9, 0x140171E71),
    "window-default-position": (0x1401727B9, 0x140172AC6),
    "window-z-order": (0x140171345, 0x14017137E),
    "header-layout": (0x1401D28D6, 0x1401D2A85),
    "row-layout": (0x1401D0F8E, 0x1401D12E0),
    "breakdown-tip-format": (0x1401D6085, 0x1401D60E9),
    "common-panel-style": (0x140012EE5, 0x1400130E2),
    "button-icon": (0x1401CFA57, 0x1401CFA75),
    "row-fill-gradient": (0x1401D1421,0x1401D152D),
    "row-name-proc": (0x1401D1B80,0x1401D1F50),
    "row-value-format": (0x1401D1F50,0x1401D2212),
    "header-frame-style": (0x1401D2A85,0x1401D2C4E),
    "header-controls-style": (0x1401D2E67,0x1401D3F10),
    "mode-menu-grip-style": (0x1401D3F10,0x1401D51F9),
    "button-hover-active": (0x14016C775,0x14016C78B),
    "button-hover-idle": (0x14016C8ED,0x14016C974),
    "minimap-icon-tint": (0x140172059,0x140172142),
}
REA = {
    "settings-save": ("ev_f26b6a8259ec4e1ae2ccc5b67680ebbd8fab2d2ebaee6579d78c2d9ed046e65c", "0x1401661e0"),
    "settings-load": ("ev_b5e207012ebc341334d1bc20a3288b93279d8f1611e98b4128596d98bb346a8f", "0x140166470"),
    "settings-mode": ("ev_b5e207012ebc341334d1bc20a3288b93279d8f1611e98b4128596d98bb346a8f", "0x140166470"),
    "input-actions": ("ev_1e87fc7c10c39fca796a20303724246ed0f3146530b25770f6a6ed7848f5783b", "0x14016c400"),
    "move-resize": ("ev_8a8e0dfc08aeb4969512bf2c35a6ece3d7eed15c865b4d5fac1c6136b3f78f2a", "0x14016d8d0"),
    "display-baseline-history": ("ev_594fc9283ad593cd1fb5aee8c4e3b71ffdc455a55172f4bfc52326ab29ca02d6", "0x14016dc00"),
    "view-time-current": ("ev_594fc9283ad593cd1fb5aee8c4e3b71ffdc455a55172f4bfc52326ab29ca02d6", "0x14016dc00"),
    "minimap-button-position": ("ev_5fd53207894d872952c48289903c6d2cf3643115abba3be053753fd353b27020", "0x140171380"),
    "window-default-position": ("ev_63b4fc2a26afd656245c48a0e8cf3150f8123632f4ed435de4b43bf1a6138d85", "0x140172310"),
    "window-z-order": ("ev_4efd60bf0e6992edb1917882d529ad18b5c1822266989d87c1e257cb1c6fe826", "0x1401711b0"),
    "header-layout": ("ev_473e4d9b6615cb0bfc0af567855c5114930a584176cbd74623b58ebea2d0ef08", "0x1401d2840"),
    "row-layout": ("ev_2bb4615ffaf418c9207db9ef65bdd2047b9f8dfcefeca765dd299d286d6c6d92", "0x1401d0740"),
    "breakdown-tip-format": ("ev_7cd82228d91c34e77b1fec6e52d84733e723de1ade942e3064b5c800092b0b3c", "0x1401d5d80"),
    "row-fill-gradient": ("ev_2bb4615ffaf418c9207db9ef65bdd2047b9f8dfcefeca765dd299d286d6c6d92", "0x1401d0740"),
    "row-name-proc": ("ev_2bb4615ffaf418c9207db9ef65bdd2047b9f8dfcefeca765dd299d286d6c6d92", "0x1401d0740"),
    "row-value-format": ("ev_2bb4615ffaf418c9207db9ef65bdd2047b9f8dfcefeca765dd299d286d6c6d92", "0x1401d0740"),
    "header-frame-style": ("ev_473e4d9b6615cb0bfc0af567855c5114930a584176cbd74623b58ebea2d0ef08", "0x1401d2840"),
    "header-controls-style": ("ev_473e4d9b6615cb0bfc0af567855c5114930a584176cbd74623b58ebea2d0ef08", "0x1401d2840"),
    "mode-menu-grip-style": ("ev_473e4d9b6615cb0bfc0af567855c5114930a584176cbd74623b58ebea2d0ef08", "0x1401d2840"),
    "button-hover-active": ("ev_1e87fc7c10c39fca796a20303724246ed0f3146530b25770f6a6ed7848f5783b", "0x14016c400"),
    "button-hover-idle": ("ev_1e87fc7c10c39fca796a20303724246ed0f3146530b25770f6a6ed7848f5783b", "0x14016c400"),
    "minimap-icon-tint": ("ev_5fd53207894d872952c48289903c6d2cf3643115abba3be053753fd353b27020", "0x140171380"),
}


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + "\n")


def bits(value):
    return _shared_bits(value)


def vectors(pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import (UC_X86_REG_RBP, UC_X86_REG_RSP, UC_X86_REG_RAX,
        UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_RIP,
        UC_X86_REG_RBX, UC_X86_REG_RSI, UC_X86_REG_R12, UC_X86_REG_R13,
        UC_X86_REG_R14, UC_X86_REG_R15, UC_X86_REG_XMM0, UC_X86_REG_XMM6,
        UC_X86_REG_XMM7, UC_X86_REG_XMM8)
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section["rva"] + section["raw_size"] for section in pe.sections)
    uc.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], pe.data[
            section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    stack, inputs = 0x20000000, 0x30000000
    uc.mem_map(stack, 0x10000)
    uc.mem_map(inputs, 0x10000)
    bp = stack + 0x1000

    def reset():
        uc.mem_write(stack, bytes(0x10000))
        uc.mem_write(inputs, bytes(0x10000))
        uc.reg_write(UC_X86_REG_RBP, bp)
        uc.reg_write(UC_X86_REG_RSP, stack + 0xF000)
        for register in [UC_X86_REG_R12, UC_X86_REG_R13, UC_X86_REG_R14,
                         UC_X86_REG_R15, UC_X86_REG_XMM0, UC_X86_REG_XMM6,
                         UC_X86_REG_XMM7, UC_X86_REG_XMM8]:
            uc.reg_write(register, 0)

    def run(start, end):
        uc.emu_start(start, end, count=2000)
        assert uc.reg_read(UC_X86_REG_RIP) == end

    def pair(register):
        return [hex((uc.reg_read(register) >> shift) & 0xFFFFFFFF) for shift in (0,32)]

    load = []
    for values in [[0.,-1.,-1.,250.,170.], [1.,8.,12.,1.,900.],
                   [1.,8.,12.,250.,170.,0.], [1.,8.,12.,250.,170.,1.],
                   [1.,8.,12.,250.,170.,2.], [1.,8.,12.,250.,170.,3.],
                   [1.,8.,12.,250.,170.,1.9], [1.,8.,12.,250.,170.,-1.],
                   [1.,8.,12.,250.,170.,float("inf")], [1.,8.,12.,250.,170.,float("nan")],
                   [float("nan"),8.,12.,float("nan"),float("nan")],
                   [1.,float("nan"),12.,250.,170.], [1.,8.,float("nan"),250.,170.],
                   [1.,8.,-1.,250.,170.], [-1.,8.,12.,640.,64.]]:
        reset()
        uc.mem_write(inputs, struct.pack("<" + "f"*len(values), *values))
        uc.reg_write(UC_X86_REG_RAX, len(values))
        uc.reg_write(UC_X86_REG_RCX, inputs)
        uc.mem_write(bp+0xA18,struct.pack("<Q",inputs))
        run(0x14016654E, 0x1401665CD)
        load.append(dict(input_bits=[hex(bits(value)) for value in values],
                         open=bool(uc.reg_read(UC_X86_REG_R15) & 1),
                         position_present=bool(uc.reg_read(UC_X86_REG_R12) & 1),
                         size_bits=pair(UC_X86_REG_XMM6),
                         mode=uc.reg_read(UC_X86_REG_R13)))

    resize = []
    for scale in (0.5,1.,2.):
        for size, delta in [((250.,170.),(40.,-40.)),((170.,64.),(-100.,-100.)),((640.,640.),(100.,100.))]:
            reset()
            uc.reg_write(UC_X86_REG_R14,1)
            uc.reg_write(UC_X86_REG_R15,inputs+0x100)
            uc.mem_write(inputs+0x100,struct.pack("<f",scale))
            uc.reg_write(UC_X86_REG_RBX,inputs+0x200)
            uc.reg_write(UC_X86_REG_RSI,inputs+0x300)
            uc.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack("<4f",*delta,0.,0.),"little"))
            uc.reg_write(UC_X86_REG_XMM6,int.from_bytes(struct.pack("<4f",*size,0.,0.),"little"))
            run(0x14016DB47,0x14016DB74)
            result=struct.unpack("<2f",uc.mem_read(inputs+0x328,8))
            expected=tuple(min(640.,max(low,value+change/scale)) for value,change,low in zip(size,delta,(170.,64.)))
            assert result == expected
            resize.append(dict(scale=scale,size=list(size),delta=list(delta),native_size=list(result)))
    reset()
    uc.mem_write(inputs,struct.pack("<Q",inputs+0x100))
    uc.mem_write(inputs+0x200,struct.pack("<Q",inputs+0x300))
    uc.reg_write(UC_X86_REG_RDX,inputs)
    uc.reg_write(UC_X86_REG_R8,inputs+0x200)
    run(0x1401D28D6,0x1401D2A85)
    node=bp+0xA0
    header={}
    for name,offset in [("width",136),("height",144),("padding_left",216),("padding_right",224),("padding_top",232),("padding_bottom",240)]:
        tag,value=struct.unpack("<If",uc.mem_read(node+offset,8))
        header[name]=dict(tag=tag,value=value if tag else None)
    assert header["height"] == dict(tag=1,value=22.)
    assert header["padding_left"] == dict(tag=1,value=7.)
    assert header["padding_right"] == dict(tag=1,value=3.)
    return dict(target_sha256=SHA, settings_cases=load,resize_cases=resize,header=header,
                check_count=len(load)+len(resize)+1,
                limits=["Unchanged isolated native instructions; no reference application process or compiler.",
                        "Settings cases start after the native text-to-f32 collector; parser token filtering is static tracing, not emulated here.",
                        "Window rasterization, input event delivery, fonts and platform parity remain unverified."])


def style_vectors():
    # Reuse the current-target PE/Unicorn harness and Node384 map. The header
    # fields and typed bundle sizes below independently corroborate this map.
    m = load_script('reward', ROOT/'scripts/recover-rewards-layout.py')
    class Probe(m.Probe):
     def hook(self,u,a,n,v):
      if self.start<=a<m.bounds[self.start] or a==self.halt or a==0x400000000:return super().hook(u,a,n,v)
      c=self.reg(m.UC_X86_REG_RCX);d=self.reg(m.UC_X86_REG_RDX);r8=self.reg(m.UC_X86_REG_R8);r9=self.reg(m.UC_X86_REG_R9);sp=self.reg(m.UC_X86_REG_RSP);site=self.q(sp)-5
      if a in [0x140193480,0x140193c90,0x1401944a0,0x14018cdb0,0x140193f40,0x140194750,0x14018a750,0x140194f80,0x140193730,0x1401939e0]:
       self.records.append(dict(site=hex(site),kind='node',target=hex(a),node=self.node(r8+8)));self.u.mem_write(c,struct.pack("<Q",1)+self.read(d,40));self.result(c)
       if site==0x1401d1e1b:
        self.records[-1]['border_color']=list(struct.unpack('<Iffff',self.read(r8+392,20)))
        self.records[-1]['background_color']=list(struct.unpack('<Iffff',self.read(r8+472,20)))
       if site==0x1401d51f4:
        gradient=self.q(r8+400);stops=self.q(gradient+16)
        self.records[-1]['gradient']=dict(angle=struct.unpack('<f',self.read(gradient+32,4))[0],stops=[dict(point=list(struct.unpack('<If',self.read(stops+i*32,8))),color=list(struct.unpack('<Iffff',self.read(stops+i*32+8,20))))for i in range(2)])
      elif a in [0x1401954e0]:
       at=r8+8;self.records.append(dict(site=hex(site),kind='text',target=hex(a),text=self.read(self.q(at+8),self.q(at+16)).decode(),font_size=struct.unpack('<f',self.read(at+72,4))[0],color=list(struct.unpack('<Iffff',self.read(at+80,20)))));self.u.mem_write(c,struct.pack("<Q",1)+self.read(d,40));self.result(c)
      elif a in [0x1401a54d0]:
       self.records.append(dict(site=hex(site),kind='text',target=hex(a),text=self.read(self.q(d+8),self.q(d+16)).decode(),font_size=struct.unpack('<f',self.read(d+72,4))[0],color=list(struct.unpack('<Iffff',self.read(d+80,20)))));self.result(c)
      elif a in [0x144c67100]:
       raw=self.read(d,20);tag,*rgba=struct.unpack('<Iffff',raw)
       assert tag in [0,1],tag
       # Native to_srgba; tags0 Srgba and1 LinearRgba. All selected callers give
       # Srgba or zero LinearRgba. This return seam does not run a color engine.
       if tag==1:
        def gamma(x):return x*12.92 if x<=0.0031308 else 1.055*pow(x,1/2.4)-0.055
        rgba=[*(gamma(x)for x in rgba[:3]),rgba[3]]
       self.u.mem_write(c,struct.pack('<4f',*rgba));self.result(c)
      elif a==0x144e07d20:self.result(1)
      elif a==0x145b9c4d0:
       # Mode headings come from the current state byte; supplied identity labels.
       self.outstr(c,'Damage Done');self.result(c)
      else:return super().hook(u,a,n,v)
      self.u.reg_write(m.UC_X86_REG_RIP,self.q(sp));self.u.reg_write(m.UC_X86_REG_RSP,sp+8)
    def constructor():
     p=Probe(0x1401d2840);spawner=p.alloc(64);font=p.alloc(512);state=p.alloc(512);fontref=p.alloc(8);stateref=p.alloc(8)
     queue=p.alloc(24);p.wq(queue,0x100000);p.wq(queue+8,p.alloc(0x100000));p.wq(spawner+16,queue);p.wq(spawner+24,queue);p.wq(fontref,font);p.wq(stateref,state);p.u.mem_write(font,b'\x01');p.wq(font+8,p.alloc(32));p.wq(font+0x20,p.alloc(32));p.u.mem_write(state+0x32,b'\x00')
     p.run([spawner,fontref,stateref])
     for offset in range(0,p.q(queue+16),0xa0):
      at=p.q(queue+8)+offset;tag=p.q(at)
      assert tag in [0x14022aeb0,0x14022b310],hex(tag)
      at+=8;p.records.append(dict(kind='text',command=hex(tag),text=p.read(p.q(at+8),p.q(at+16)).decode(),font_size=struct.unpack('<f',p.read(at+72,4))[0],color=list(struct.unpack('<Iffff',p.read(at+80,20)))))
     return p.records

    def proc():
     start,end=0x1401d1c3f,0x1401d1e20;m.bounds[start]=end;p=Probe(start,end);bp=p.sp-0x1000;p.u.reg_write(m.UC_X86_REG_RBP,bp);p.u.reg_write(m.UC_X86_REG_RSP,bp-0x80);p.u.reg_write(m.UC_X86_REG_R15,bp+0x368)
     for reg,a in [(m.UC_X86_REG_XMM9,0x145db8880),(m.UC_X86_REG_XMM14,0x145db8898),(m.UC_X86_REG_XMM15,0x145db88b0),(m.UC_X86_REG_XMM7,0x145db88c8)]:p.u.reg_write(reg,int.from_bytes(p.read(a,16),'little'))
     p.run([]);return p.records
    header,proc_rows=constructor(),proc()
    # Direct background transitions; Interaction0=Pressed,1=Hovered,2=None.
    controls=[]
    for interaction in range(3):
        for selected in [None,0,1,2]:
            for mode in range(3):
                start,end=0x14016c775,0x14016c93a;m.bounds[start]=end;p=Probe(start,end)
                cursor,state,choice=p.alloc(8),p.alloc(128),p.alloc(8)
                p.u.mem_write(cursor,bytes([interaction]));p.u.mem_write(state+0x32,bytes([mode]))
                p.u.mem_write(choice,bytes([selected or 0]));p.wq(p.sp+0x68,state)
                p.u.reg_write(m.UC_X86_REG_RAX,cursor);p.u.reg_write(m.UC_X86_REG_RCX,choice if selected is not None else 0)
                for register,address in [(m.UC_X86_REG_XMM6,0x145db5e80),(m.UC_X86_REG_XMM7,0x145db5e70)]:
                    p.u.reg_write(register,int.from_bytes(p.read(address,16),'little'))
                p.run([]);raw=p.read(p.sp+0xc0,20)
                expected=struct.pack('<Iffff',0,1.,.85,.4,.18 if interaction!=2 else .1) if interaction!=2 or selected==mode else struct.pack('<Iffff',1,0.,0.,0.,0.)
                assert raw==expected
                controls.append(dict(interaction=interaction,selected=selected,mode=mode,color=list(struct.unpack('<Iffff',raw))))
    icons=[]
    for interaction in range(3):
        for opened in [False,True]:
            start,end=0x140172059,0x140172128;m.bounds[start]=end;p=Probe(start,end)
            state=p.alloc(128);p.u.mem_write(state+0x30,bytes([opened]));p.wq(p.sp+0x30,state)
            p.u.reg_write(m.UC_X86_REG_RSI,p.alloc(128));p.u.reg_write(m.UC_X86_REG_RBX,interaction)
            p.run([]);raw=p.read(p.sp+0x50,20)
            expected=struct.pack('<Iffff',0,.78,.78,.78,1.) if interaction==2 and not opened else struct.pack('<Iffff',1,1.,1.,1.,1.)
            assert raw==expected
            icons.append(dict(interaction=interaction,open=opened,color=list(struct.unpack('<Iffff',raw))))
    assert len(header)==19 and len(proc_rows)==1 and len(controls)==36 and len(icons)==6
    return dict(target_sha256=SHA,constructors=dict(header=header,proc=proc_rows),button_states=controls,minimap_states=icons,
        constructor_record_count=20,state_case_count=42,
        limits=['Unchanged selected instructions with fixture UI submission, allocator, byte-copy and English localization seams; no application or compiler.',
                'Native Node384 mapping is shared with the retained picker map and checked at current header, controls, mode menu, proc chip and grip stores.',
                'Typed submission returns synthetic child spawners; font handles, entity IDs and command storage are fixtures. No renderer, font shaping, layout engine or interaction routing executes.',
                'No native easing is inferred: the selected meter handler assigns hover/selection backgrounds directly.'])

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check",action="store_true")
    args=parser.parse_args()
    data=EXE.read_bytes()
    assert hashlib.sha256(data).hexdigest()==SHA
    module = load_script("pe", ROOT/"scripts/inventory-executable.py")
    pe=module.PE(data)
    recovered=vectors(pe)
    styling=style_vectors()
    if args.check:
        assert portable_record(json.loads((RETAINED/"settings-native-vectors.json").read_text()))==portable_record(recovered)
        assert portable_record(json.loads((RETAINED/"styling-native-vectors.json").read_text()))==portable_record(styling)
        manifest=json.loads((RETAINED/"manifest.json").read_text())
        assert manifest["target_sha256"]==SHA
        layout=json.loads((RETAINED/"layout.json").read_text())
        assert layout["target_sha256"]==SHA
        for row in layout["literals"]:
            at,size=int(row["file_offset"],16),row["byte_count"]
            raw=data[at:at+size]
            assert raw.hex()==row["hex"] and hashlib.sha256(raw).hexdigest()==row["sha256"]
        for row in manifest["native_ranges"]:
            at,size=int(row["file_offset"],16),row["byte_count"]
            assert hashlib.sha256(data[at:at+size]).hexdigest()==row["sha256"]
            assert hashlib.sha256((RETAINED/row["assembly"]).read_bytes()).hexdigest()==row["assembly_sha256"]
    else:
        STAGE.mkdir(parents=True,exist_ok=True)
        save(STAGE/"settings-native-vectors.json",recovered)
        save(STAGE/"styling-native-vectors.json",styling)
        literals=[]
        for role,address,size in [("size-default",0x145DB5DE0,8),("size-minimum",0x145DB5DF0,8),
            ("size-maximum",0x145DB5E00,8),("rate-history-seconds",0x145DB5E90,8),
            ("mode-labels",0x145DB669B,34),("on-top-key-default",0x145DB68DC,11),
            ("row-palette",0x145DBB324,160),("button-icon",0x145DBB29F,17),
            ("button-border",0x145DBB2B0,50),("header-top",0x145DB80B0,16),
            ("header-bottom",0x145DB80C0,16),("fill-darken",0x145DB5EF4,4),
            ("hover-active-color",0x145DB5E70,16),("selected-mode-color",0x145DB5E80,16),
            ("unhovered-color",0x145DB68C8,20),("minimap-inactive-tint",0x145DB5EC0,16),
            ("minimap-active-tint",0x145DB69E4,20),("proc-sky-color",0x145DB8EE8,16),
            ("paper-text-color",0x145DB8D54,20),("muted-text-color",0x145DB883C,20),
            ("gold-text-color",0x145DB87F8,20),("frame-edge-color",0x145DB8A00,16),
            ("grip-color",0x145DB8B70,16),("grip-midpoint-stops",0x145DB80F0,16),
            ("rank-format",0x145DB8EFC,5),("part-percentage-format",0x145DBB3C4,11)]:
            at=pe.rva_offset(address-pe.image_base);raw=data[at:at+size]
            literals.append(dict(role=role,virtual_address=hex(address),file_offset=hex(at),byte_count=size,
                sha256=hashlib.sha256(raw).hexdigest(),hex=raw.hex()))
        save(STAGE/"layout.json",dict(target_sha256=SHA,literals=literals,
            contracts=dict(settings_file="meter.txt",mode_order=["Damage Done","Healing Done","Boss Damage"],
                size_default=[250.,170.],size_minimum=[170.,64.],size_maximum=[640.,640.],
                root_z=4050,choice_top_z=6040,button_z=4060,parts_tip_z=6045,
                header_height=22.,header_padding_left=7.,header_padding_right=3.,row_height=18.,
                button_size=31.,icon_size=21.,history_seconds=11.,
                hover="Direct active gold alpha0.18, selected-mode alpha0.1, otherwise transparent; no easing.",
                header_buttons=dict(height=16.,border=1.,radius=3.,padding=[4.,0.],close_size=16.,close_text="x"),
                mode_menu=dict(left=4.,top=24.,padding=3.,gap=1.,radius=4.,row_padding=[6.,2.]),
                proc_chip=dict(padding=[3.,0.],radius=3.,border=1.,color=[.55,.8,1.],border_alpha=.6,background_alpha=.35),
                resize_grip=dict(size=14.,right=1.,bottom=1.,gradient_angle=2.3561945,stop_percent=50.),reset_scope="Display baseline only; damage/healing entries and run totals remain unchanged."),
            limits=["Selected instruction/data contracts, not pixel/interaction or locale parity.",
                "Shared panel colors were revalidated at current140012c60 before reusing menu::native_panel_style."]))
        ranges=[]
        decoded={}
        extents=[(a+pe.image_base,b+pe.image_base) for a,b,_ in pe.functions()]
        for role,(start,end) in SPANS.items():
            parent=next((a,b) for a,b in extents if a<=start<b)
            if parent not in decoded:
                full=objdump_output(["objdump","-d","--no-show-raw-insn",f"--start-address={parent[0]:#x}",f"--stop-address={parent[1]:#x}",str(EXE)],cwd=ROOT,text=True)
                decoded[parent]=sorted([int(value,16) for value in re.findall(r"^([0-9a-f]+):",full,re.M)]+[parent[1]])
            # Analyst-selected ranges must start/end on actual decoded instruction boundaries.
            start=next(value for value in decoded[parent] if value>=start)
            end=next(value for value in decoded[parent] if value>=end)
            at=pe.rva_offset(start-pe.image_base)
            raw=data[at:at+end-start]
            name=role+".asm"
            output=objdump_output(["objdump","-d","--no-show-raw-insn",f"--start-address={start:#x}",f"--stop-address={end:#x}",str(EXE)],cwd=ROOT,text=True)
            # Keep artifact identities portable; objdump's machine path is not evidence.
            output=output.replace(str(EXE),str(EXE.relative_to(ROOT)))
            (STAGE/name).write_text(output)
            row=dict(role=role,virtual_address=hex(start),end_exclusive=hex(end),file_offset=hex(at),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest(),assembly=name,assembly_sha256=hashlib.sha256(output.encode()).hexdigest())
            if role in REA:row.update(rea_evidence_id=REA[role][0],parent_function=REA[role][1])
            else:row["discovery"]="Original PE callsite/instruction follow-up of selected Ghidra meter owner."
            ranges.append(row)
        save(STAGE/"manifest.json",dict(target_sha256=SHA,provider=dict(id="ghidra",version="12.1.4"),native_ranges=ranges,
            styling_vectors="styling-native-vectors.json",styling_constructor_records=20,styling_state_cases=42,
            typed_submission_rea=[dict(function=address,evidence_id=evidence)for address,evidence in [
                ("0x14018a750","ev_73261100ecc479f17910d585af8b32ba4361ff8dd8b1d82242d981bd5e5f53e7"),
                ("0x14018cdb0","ev_ff48c1f8baa5976ded99c3c3b1789e13f96b6d7bdd8c699b9748be81b5be63da"),
                ("0x140193480","ev_07b41e64dcca0faa8a648a98c85769125ea7d3b4207df906f1a6e4518f6fc660"),
                ("0x140193c90","ev_4e92b9be494719977494c004e6ebe87d56330cef2654ef7b66603c076a2956f1"),
                ("0x1401944a0","ev_4023bdfca03c451e6520452244a1d73ff03b369a93510b9497cd24ccd66efe4f")]],
            limits=["REA/Ghidra raw imports use a generic GCC ABI; PE assembly supplies Win64 bindings and data.","Bounded extracts omit unrelated generic Bevy ECS machinery and are not original Rust source.","Only source/static contracts are established; no builds, game launches or appearance comparisons."]))
    print(f"Verified selected EXE hash, {recovered['check_count']} unchanged meter settings/layout vectors, {styling['state_case_count']} hover/tint states, {styling['constructor_record_count']} constructor records and {len(SPANS)} bounded native ranges")


if __name__=="__main__":main()

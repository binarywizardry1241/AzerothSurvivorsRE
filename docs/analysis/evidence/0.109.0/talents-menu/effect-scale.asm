14590e600: push      rsi
14590e601: push      rdi
14590e602: push      rbx
14590e603: sub       rsp, 0x20
14590e607: mov       rax, rcx
14590e60a: movzx     ecx, byte ptr [rdx]
14590e60d: cmp       rcx, 0x22
14590e611: ja        0x14590e65a
14590e613: lea       r8, [rip + 0x191ae16]
14590e61a: movsxd    rcx, dword ptr [r8 + rcx*4]
14590e61e: add       rcx, r8
14590e621: jmp       rcx
14590e623: movups    xmm0, xmmword ptr [rdx + 0x20]
14590e627: movups    xmm1, xmmword ptr [rdx + 0x30]
14590e62b: movups    xmmword ptr [rax + 0x30], xmm1
14590e62f: movups    xmmword ptr [rax + 0x20], xmm0
14590e633: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e637: movups    xmmword ptr [rax + 0x10], xmm0
14590e63b: movsd     xmm0, qword ptr [rdx + 4]
14590e640: movaps    xmm1, xmmword ptr [rip + 0x48edf9]
14590e647: movss     xmm1, xmm2
14590e64b: mulps     xmm1, xmm0
14590e64e: movlps    qword ptr [rax + 4], xmm1
14590e652: mov       byte ptr [rax], 0
14590e655: jmp       0x14590ea82
14590e65a: movups    xmm0, xmmword ptr [rdx]
14590e65d: movups    xmm1, xmmword ptr [rdx + 0x10]
14590e661: movups    xmm2, xmmword ptr [rdx + 0x20]
14590e665: movups    xmm3, xmmword ptr [rdx + 0x30]
14590e669: movups    xmmword ptr [rax + 0x30], xmm3
14590e66d: movups    xmmword ptr [rax + 0x20], xmm2
14590e671: movups    xmmword ptr [rax + 0x10], xmm1
14590e675: movups    xmmword ptr [rax], xmm0
14590e678: jmp       0x14590ea82
14590e67d: mulss     xmm2, dword ptr [rdx + 4]
14590e682: movss     dword ptr [rax + 4], xmm2
14590e687: mov       byte ptr [rax], 0x1f
14590e68a: jmp       0x14590ea82
14590e68f: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e693: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e697: movups    xmmword ptr [rax + 0x20], xmm1
14590e69b: movups    xmmword ptr [rax + 0x10], xmm0
14590e69f: movsd     xmm0, qword ptr [rdx + 4]
14590e6a4: movaps    xmm1, xmmword ptr [rip + 0x48ed95]
14590e6ab: movss     xmm1, xmm2
14590e6af: mulps     xmm1, xmm0
14590e6b2: movlps    qword ptr [rax + 4], xmm1
14590e6b6: mov       byte ptr [rax], 0x10
14590e6b9: jmp       0x14590ea82
14590e6be: mov       ecx, dword ptr [rdx + 4]
14590e6c1: mov       dword ptr [rax + 4], ecx
14590e6c4: movsd     xmm0, qword ptr [rdx + 8]
14590e6c9: movaps    xmm1, xmmword ptr [rip + 0x48ed70]
14590e6d0: movss     xmm1, xmm2
14590e6d4: mulps     xmm1, xmm0
14590e6d7: movlps    qword ptr [rax + 8], xmm1
14590e6db: mov       rcx, qword ptr [rdx + 0x10]
14590e6df: mov       qword ptr [rax + 0x10], rcx
14590e6e3: mov       byte ptr [rax], 0xc
14590e6e6: jmp       0x14590ea82
14590e6eb: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e6ef: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e6f3: movups    xmmword ptr [rax + 0x20], xmm1
14590e6f7: movups    xmmword ptr [rax + 0x10], xmm0
14590e6fb: movzx     ecx, byte ptr [rdx + 1]
14590e6ff: mov       r8d, dword ptr [rdx + 8]
14590e703: movss     xmm0, dword ptr [rdx + 0xc]
14590e708: mulss     xmm2, dword ptr [rdx + 4]
14590e70d: mov       byte ptr [rax + 1], cl
14590e710: movss     dword ptr [rax + 4], xmm2
14590e715: mov       dword ptr [rax + 8], r8d
14590e719: movss     dword ptr [rax + 0xc], xmm0
14590e71e: mov       byte ptr [rax], 0xf
14590e721: jmp       0x14590ea82
14590e726: mov       rdi, qword ptr [rdx + 0x10]
14590e72a: movaps    xmm0, xmm2
14590e72d: mov       rsi, rax
14590e730: mov       rbx, rdx
14590e733: call      0x145bfa10b
14590e738: mov       rax, rsi
14590e73b: maxss     xmm0, dword ptr [rip + 0x48eb5d]
14590e743: xorps     xmm1, xmm1
14590e746: maxss     xmm1, xmm0
14590e74a: movss     xmm0, dword ptr [rip + 0x4c676a]
14590e752: minss     xmm0, xmm1
14590e756: cvttss2si ecx, xmm0
14590e75a: mov       qword ptr [rsi + 0x10], rdi
14590e75e: movsd     xmm0, qword ptr [rbx + 4]
14590e763: movsd     qword ptr [rsi + 4], xmm0
14590e768: mov       byte ptr [rsi + 1], cl
14590e76b: mov       byte ptr [rsi], 0x21
14590e76e: jmp       0x14590ea82
14590e773: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e777: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e77b: movups    xmmword ptr [rax + 0x20], xmm1
14590e77f: movups    xmmword ptr [rax + 0x10], xmm0
14590e783: mov       ecx, dword ptr [rdx + 0xc]
14590e786: movzx     r8d, byte ptr [rdx + 1]
14590e78b: movsd     xmm0, qword ptr [rdx + 4]
14590e790: movaps    xmm1, xmmword ptr [rip + 0x48eca9]
14590e797: movss     xmm1, xmm2
14590e79b: mulps     xmm1, xmm0
14590e79e: movlps    qword ptr [rax + 4], xmm1
14590e7a2: mov       dword ptr [rax + 0xc], ecx
14590e7a5: mov       byte ptr [rax + 1], r8b
14590e7a9: mov       byte ptr [rax], 3
14590e7ac: jmp       0x14590ea82
14590e7b1: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e7b5: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e7b9: movups    xmmword ptr [rax + 0x20], xmm1
14590e7bd: movups    xmmword ptr [rax + 0x10], xmm0
14590e7c1: mulss     xmm2, dword ptr [rdx + 8]
14590e7c6: mov       ecx, dword ptr [rdx + 4]
14590e7c9: mov       dword ptr [rax + 4], ecx
14590e7cc: movss     dword ptr [rax + 8], xmm2
14590e7d1: mov       byte ptr [rax], 6
14590e7d4: jmp       0x14590ea82
14590e7d9: mulss     xmm2, dword ptr [rdx + 4]
14590e7de: movups    xmm0, xmmword ptr [rdx + 8]
14590e7e2: movups    xmmword ptr [rax + 8], xmm0
14590e7e6: movss     dword ptr [rax + 4], xmm2
14590e7eb: mov       byte ptr [rax], 0xd
14590e7ee: jmp       0x14590ea82
14590e7f3: movups    xmm0, xmmword ptr [rdx + 0x18]
14590e7f7: movups    xmm1, xmmword ptr [rdx + 0x28]
14590e7fb: movups    xmmword ptr [rax + 0x28], xmm1
14590e7ff: movups    xmmword ptr [rax + 0x18], xmm0
14590e803: mov       rcx, qword ptr [rdx + 0x10]
14590e807: mov       r8d, dword ptr [rdx + 0xc]
14590e80b: mov       qword ptr [rax + 0x10], rcx
14590e80f: movsd     xmm0, qword ptr [rdx + 4]
14590e814: movaps    xmm1, xmmword ptr [rip + 0x48ec25]
14590e81b: movss     xmm1, xmm2
14590e81f: mulps     xmm1, xmm0
14590e822: movlps    qword ptr [rax + 4], xmm1
14590e826: mov       dword ptr [rax + 0xc], r8d
14590e82a: mov       byte ptr [rax], 2
14590e82d: jmp       0x14590ea82
14590e832: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e836: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e83a: movups    xmmword ptr [rax + 0x20], xmm1
14590e83e: movups    xmmword ptr [rax + 0x10], xmm0
14590e842: mov       ecx, dword ptr [rdx + 8]
14590e845: movss     xmm0, dword ptr [rdx + 0xc]
14590e84a: mulss     xmm2, dword ptr [rdx + 4]
14590e84f: movss     dword ptr [rax + 4], xmm2
14590e854: mov       dword ptr [rax + 8], ecx
14590e857: movss     dword ptr [rax + 0xc], xmm0
14590e85c: mov       byte ptr [rax], 7
14590e85f: jmp       0x14590ea82
14590e864: cmp       dword ptr [rdx + 8], -1
14590e868: movups    xmm0, xmmword ptr [rdx + 0x28]
14590e86c: movups    xmmword ptr [rax + 0x28], xmm0
14590e870: movups    xmm0, xmmword ptr [rdx + 0x18]
14590e874: movups    xmmword ptr [rax + 0x18], xmm0
14590e878: je        0x14590ea57
14590e87e: lea       rcx, [rdx + 8]
14590e882: mov       r8d, dword ptr [rcx + 8]
14590e886: mov       dword ptr [rax + 0x10], r8d
14590e88a: mov       rcx, qword ptr [rcx]
14590e88d: mov       qword ptr [rax + 8], rcx
14590e891: mulss     xmm2, dword ptr [rdx + 4]
14590e896: movss     dword ptr [rax + 4], xmm2
14590e89b: jmp       0x14590ea7f
14590e8a0: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e8a4: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e8a8: movups    xmmword ptr [rax + 0x20], xmm1
14590e8ac: movups    xmmword ptr [rax + 0x10], xmm0
14590e8b0: movsd     xmm0, qword ptr [rdx + 4]
14590e8b5: movaps    xmm1, xmmword ptr [rip + 0x48eb84]
14590e8bc: movss     xmm1, xmm2
14590e8c0: mulps     xmm1, xmm0
14590e8c3: movlps    qword ptr [rax + 4], xmm1
14590e8c7: mov       byte ptr [rax], 0x11
14590e8ca: jmp       0x14590ea82
14590e8cf: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e8d3: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e8d7: movups    xmmword ptr [rax + 0x20], xmm1
14590e8db: movups    xmmword ptr [rax + 0x10], xmm0
14590e8df: movsd     xmm0, qword ptr [rdx + 4]
14590e8e4: movaps    xmm1, xmmword ptr [rip + 0x48eb55]
14590e8eb: movss     xmm1, xmm2
14590e8ef: mulps     xmm1, xmm0
14590e8f2: movlps    qword ptr [rax + 4], xmm1
14590e8f6: mov       byte ptr [rax], 0x12
14590e8f9: jmp       0x14590ea82
14590e8fe: movups    xmm0, xmmword ptr [rdx + 0x18]
14590e902: movups    xmm1, xmmword ptr [rdx + 0x28]
14590e906: movups    xmmword ptr [rax + 0x28], xmm1
14590e90a: movups    xmmword ptr [rax + 0x18], xmm0
14590e90e: mov       ecx, dword ptr [rdx + 0x14]
14590e911: movsd     xmm0, qword ptr [rdx + 4]
14590e916: movaps    xmm1, xmmword ptr [rip + 0x48eb23]
14590e91d: movss     xmm1, xmm2
14590e921: mulps     xmm1, xmm0
14590e924: movlps    qword ptr [rax + 4], xmm1
14590e928: mov       rdx, qword ptr [rdx + 0xc]
14590e92c: mov       qword ptr [rax + 0xc], rdx
14590e930: mov       dword ptr [rax + 0x14], ecx
14590e933: mov       byte ptr [rax], 4
14590e936: jmp       0x14590ea82
14590e93b: movups    xmm0, xmmword ptr [rdx + 8]
14590e93f: movups    xmm1, xmmword ptr [rdx + 0x18]
14590e943: movups    xmmword ptr [rax + 0x18], xmm1
14590e947: movups    xmmword ptr [rax + 8], xmm0
14590e94b: mulss     xmm2, dword ptr [rdx + 4]
14590e950: movss     dword ptr [rax + 4], xmm2
14590e955: mov       byte ptr [rax], 5
14590e958: jmp       0x14590ea82
14590e95d: mov       rcx, qword ptr [rdx + 0x28]
14590e961: mov       qword ptr [rax + 0x28], rcx
14590e965: movups    xmm0, xmmword ptr [rdx + 0x18]
14590e969: movups    xmmword ptr [rax + 0x18], xmm0
14590e96d: movzx     ecx, byte ptr [rdx + 1]
14590e971: mov       byte ptr [rax + 1], cl
14590e974: movsd     xmm0, qword ptr [rdx + 4]
14590e979: movaps    xmm1, xmmword ptr [rip + 0x48eac0]
14590e980: movss     xmm1, xmm2
14590e984: mulps     xmm1, xmm0
14590e987: movlps    qword ptr [rax + 4], xmm1
14590e98b: mov       rcx, qword ptr [rdx + 0xc]
14590e98f: mov       qword ptr [rax + 0xc], rcx
14590e993: mov       byte ptr [rax], 0xb
14590e996: jmp       0x14590ea82
14590e99b: movups    xmm0, xmmword ptr [rdx + 0x10]
14590e99f: movups    xmm1, xmmword ptr [rdx + 0x20]
14590e9a3: movups    xmmword ptr [rax + 0x20], xmm1
14590e9a7: movups    xmmword ptr [rax + 0x10], xmm0
14590e9ab: mov       ecx, dword ptr [rdx + 4]
14590e9ae: mov       dword ptr [rax + 4], ecx
14590e9b1: movsd     xmm0, qword ptr [rdx + 8]
14590e9b6: movaps    xmm1, xmmword ptr [rip + 0x48ea83]
14590e9bd: movss     xmm1, xmm2
14590e9c1: mulps     xmm1, xmm0
14590e9c4: movlps    qword ptr [rax + 8], xmm1
14590e9c8: mov       byte ptr [rax], 9
14590e9cb: jmp       0x14590ea82
14590e9d0: movaps    xmm0, xmm2
14590e9d3: mov       rsi, rax
14590e9d6: call      0x145bfa10b
14590e9db: mov       rax, rsi
14590e9de: movss     xmm1, dword ptr [rip + 0x48e8ba]
14590e9e6: maxss     xmm1, xmm0
14590e9ea: movss     xmm0, dword ptr [rip + 0x4be4de]
14590e9f2: minss     xmm0, xmm1
14590e9f6: xorps     xmm1, xmm1
14590e9f9: maxss     xmm1, xmm0
14590e9fd: movss     xmm0, dword ptr [rip + 0x4c64b7]
14590ea05: minss     xmm0, xmm1
14590ea09: cvttss2si ecx, xmm0
14590ea0d: mov       byte ptr [rsi + 1], cl
14590ea10: mov       byte ptr [rsi], 0x1e
14590ea13: jmp       0x14590ea82
14590ea15: mulss     xmm2, dword ptr [rdx + 4]
14590ea1a: movss     dword ptr [rax + 4], xmm2
14590ea1f: mov       byte ptr [rax], 0x16
14590ea22: jmp       0x14590ea82
14590ea24: mov       rcx, qword ptr [rdx + 0x18]
14590ea28: mov       r8d, dword ptr [rdx + 8]
14590ea2c: mulss     xmm2, dword ptr [rdx + 4]
14590ea31: movss     xmm0, dword ptr [rdx + 0x14]
14590ea36: mov       qword ptr [rax + 0x18], rcx
14590ea3a: movss     dword ptr [rax + 4], xmm2
14590ea3f: mov       dword ptr [rax + 8], r8d
14590ea43: movsd     xmm1, qword ptr [rdx + 0xc]
14590ea48: movsd     qword ptr [rax + 0xc], xmm1
14590ea4d: movss     dword ptr [rax + 0x14], xmm0
14590ea52: mov       byte ptr [rax], 0x22
14590ea55: jmp       0x14590ea82
14590ea57: movss     xmm0, dword ptr [rdx + 4]
14590ea5c: mov       dword ptr [rax + 8], 0xffffffff
14590ea63: movsd     xmm1, qword ptr [rdx + 0xc]
14590ea68: movaps    xmm3, xmmword ptr [rip + 0x48e9d1]
14590ea6f: movss     xmm3, xmm2
14590ea73: mulps     xmm3, xmm1
14590ea76: movlps    qword ptr [rax + 0xc], xmm3
14590ea7a: movss     dword ptr [rax + 4], xmm0
14590ea7f: mov       byte ptr [rax], 8
14590ea82: add       rsp, 0x20
14590ea86: pop       rbx
14590ea87: pop       rdi
14590ea88: pop       rsi
14590ea89: ret

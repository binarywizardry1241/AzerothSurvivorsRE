0x14020a850: push rbp
0x14020a851: push r15
0x14020a853: push r14
0x14020a855: push r13
0x14020a857: push r12
0x14020a859: push rsi
0x14020a85a: push rdi
0x14020a85b: push rbx
0x14020a85c: sub rsp, 0x638
0x14020a863: lea rbp, [rsp + 0x80]
0x14020a86b: movaps xmmword ptr [rbp + 0x5a0], xmm13
0x14020a873: movaps xmmword ptr [rbp + 0x590], xmm12
0x14020a87b: movaps xmmword ptr [rbp + 0x580], xmm11
0x14020a883: movaps xmmword ptr [rbp + 0x570], xmm10
0x14020a88b: movaps xmmword ptr [rbp + 0x560], xmm9
0x14020a893: movaps xmmword ptr [rbp + 0x550], xmm8
0x14020a89b: movaps xmmword ptr [rbp + 0x540], xmm7
0x14020a8a2: movaps xmmword ptr [rbp + 0x530], xmm6
0x14020a8a9: mov qword ptr [rbp + 0x528], 0xfffffffffffffffe
0x14020a8b4: mov qword ptr [rbp + 0x4d8], rcx
0x14020a8bb: mov rax, qword ptr [r9 + 0x70]
0x14020a8bf: test rax, rax
0x14020a8c2: je 0x14020b05f
0x14020a8c8: mov r12, r8
0x14020a8cb: mov rsi, rdx
0x14020a8ce: mov rbx, qword ptr [r9 + 0x68]
0x14020a8d2: imul rdi, rax, 0xf0
0x14020a8d9: add rdi, rbx
0x14020a8dc: movzx eax, byte ptr [r9 + 0x12e]
0x14020a8e4: mov byte ptr [rbp + 0x526], al
0x14020a8ea: movzx eax, byte ptr [r9 + 0x12f]
0x14020a8f2: mov byte ptr [rbp + 0x527], al
0x14020a8f8: mov rax, qword ptr [r9 + 0x108]
0x14020a8ff: mov qword ptr [rbp + 0x508], rax
0x14020a906: mov rax, qword ptr [r9 + 0x110]
0x14020a90d: mov qword ptr [rbp + 0x500], rax
0x14020a914: mov r15, qword ptr [r9 + 0x118]
0x14020a91b: mov rax, qword ptr [rbp + 0x4d8]
0x14020a922: add rax, 8
0x14020a926: mov qword ptr [rbp + 0x4b8], rax
0x14020a92d: xor r13d, r13d
0x14020a930: xorps xmm6, xmm6
0x14020a933: movaps xmm7, xmmword ptr [rip + 0x5cd5656]
0x14020a93a: movaps xmm8, xmmword ptr [rip + 0x5cd592e]
0x14020a942: movaps xmm9, xmmword ptr [rip + 0x5cd5996]
0x14020a94a: movaps xmm10, xmmword ptr [rip + 0x5cd55ae]
0x14020a952: movss xmm11, dword ptr [rip + 0x5cd5c39]
0x14020a95b: movss xmm12, dword ptr [rip + 0x5cd554c]
0x14020a964: cmp byte ptr [rbp + 0x526], 0
0x14020a96b: je 0x14020a9e0
0x14020a96d: cmp qword ptr [rbp + 0x508], -1
0x14020a975: je 0x14020aaa2
0x14020a97b: add rbx, 0xf0
0x14020a982: mov r14, rbx
0x14020a985: jmp 0x14020a9a3
0x14020a987: nop word ptr [rax + rax]
0x14020a990: inc r13
0x14020a993: cmp r14, rdi
0x14020a996: lea r14, [r14 + 0xf0]
0x14020a99d: je 0x14020b05f
0x14020a9a3: cmp byte ptr [r14 - 8], 1
0x14020a9a8: jne 0x14020a990
0x14020a9aa: test byte ptr [rbp + 0x527], 1
0x14020a9b1: je 0x14020a9ba
0x14020a9b3: cmp byte ptr [r14 - 7], 0
0x14020a9b8: jne 0x14020a990
0x14020a9ba: cmp r15, qword ptr [r14 - 0x50]
0x14020a9be: jne 0x14020a990
0x14020a9c0: mov rdx, qword ptr [r14 - 0x58]
0x14020a9c4: mov rcx, qword ptr [rbp + 0x500]
0x14020a9cb: mov r8, r15
0x14020a9ce: call 0x145d14601
0x14020a9d3: test eax, eax
0x14020a9d5: jne 0x14020a990
0x14020a9d7: jmp 0x14020aaf0
0x14020a9dc: nop dword ptr [rax]
0x14020a9e0: test byte ptr [rbp + 0x527], 1
0x14020a9e7: je 0x14020aa50
0x14020a9e9: cmp qword ptr [rbp + 0x508], -1
0x14020a9f1: je 0x14020aaf9
0x14020a9f7: add rbx, 0xf0
0x14020a9fe: mov r14, rbx
0x14020aa01: jmp 0x14020aa23
0x14020aa03: nop word ptr cs:[rax + rax]
0x14020aa10: inc r13
0x14020aa13: cmp r14, rdi
0x14020aa16: lea r14, [r14 + 0xf0]
0x14020aa1d: je 0x14020b05f
0x14020aa23: cmp byte ptr [r14 - 7], 0
0x14020aa28: jne 0x14020aa10
0x14020aa2a: cmp r15, qword ptr [r14 - 0x50]
0x14020aa2e: jne 0x14020aa10
0x14020aa30: mov rdx, qword ptr [r14 - 0x58]
0x14020aa34: mov rcx, qword ptr [rbp + 0x500]
0x14020aa3b: mov r8, r15
0x14020aa3e: call 0x145d14601
0x14020aa43: test eax, eax
0x14020aa45: jne 0x14020aa10
0x14020aa47: jmp 0x14020aaf0
0x14020aa4c: nop dword ptr [rax]
0x14020aa50: cmp qword ptr [rbp + 0x508], -1
0x14020aa58: je 0x14020ab2b
0x14020aa5e: add rbx, 0xf0
0x14020aa65: mov r14, rbx
0x14020aa68: jmp 0x14020aa83
0x14020aa6a: nop word ptr [rax + rax]
0x14020aa70: inc r13
0x14020aa73: cmp r14, rdi
0x14020aa76: lea r14, [r14 + 0xf0]
0x14020aa7d: je 0x14020b05f
0x14020aa83: cmp r15, qword ptr [r14 - 0x50]
0x14020aa87: jne 0x14020aa70
0x14020aa89: mov rdx, qword ptr [r14 - 0x58]
0x14020aa8d: mov rcx, qword ptr [rbp + 0x500]
0x14020aa94: mov r8, r15
0x14020aa97: call 0x145d14601
0x14020aa9c: test eax, eax
0x14020aa9e: jne 0x14020aa70
0x14020aaa0: jmp 0x14020aaf0
0x14020aaa2: test byte ptr [rbp + 0x527], 1
0x14020aaa9: je 0x14020affc
0x14020aaaf: add rbx, 0xf0
0x14020aab6: mov r14, rbx
0x14020aab9: jmp 0x14020aad3
0x14020aabb: nop dword ptr [rax + rax]
0x14020aac0: inc r13
0x14020aac3: cmp r14, rdi
0x14020aac6: lea r14, [r14 + 0xf0]
0x14020aacd: je 0x14020b05f
0x14020aad3: cmp byte ptr [r14 - 8], 1
0x14020aad8: jne 0x14020aac0
0x14020aada: cmp byte ptr [r14 - 7], 1
0x14020aadf: je 0x14020aac0
0x14020aae1: nop word ptr cs:[rax + rax]
0x14020aaf0: lea rbx, [r14 - 0xf0]
0x14020aaf7: jmp 0x14020ab32
0x14020aaf9: add rbx, 0xf0
0x14020ab00: mov r14, rbx
0x14020ab03: nop word ptr cs:[rax + rax]
0x14020ab10: cmp byte ptr [r14 - 7], 1
0x14020ab15: jne 0x14020aaf0
0x14020ab17: inc r13
0x14020ab1a: cmp r14, rdi
0x14020ab1d: lea r14, [r14 + 0xf0]
0x14020ab24: jne 0x14020ab10
0x14020ab26: jmp 0x14020b05f
0x14020ab2b: lea r14, [rbx + 0xf0]
0x14020ab32: mov qword ptr [rbp + 0x4b0], rbx
0x14020ab39: mov rax, qword ptr [rbx + 0xd0]
0x14020ab40: test rax, rax
0x14020ab43: mov qword ptr [rbp + 0x4c0], rsi
0x14020ab4a: je 0x14020ab6d
0x14020ab4c: movups xmm0, xmmword ptr [rip + 0x5d05f9d]
0x14020ab53: movaps xmmword ptr [rbp + 0x510], xmm0
0x14020ab5a: mov dword ptr [rbp + 0x520], 0x3f800000
0x14020ab64: movups xmm0, xmmword ptr [rip + 0x5d05f99]
0x14020ab6b: jmp 0x14020ab8c
0x14020ab6d: movups xmm0, xmmword ptr [rip + 0x5d05f54]
0x14020ab74: movaps xmmword ptr [rbp + 0x510], xmm0
0x14020ab7b: mov dword ptr [rbp + 0x520], 0x3f800000
0x14020ab85: movups xmm0, xmmword ptr [rip + 0x5d05f50]
0x14020ab8c: movaps xmmword ptr [rbp + 0x4e0], xmm0
0x14020ab93: mov dword ptr [rbp + 0x4f0], 0x3f800000
0x14020ab9d: movzx esi, byte ptr [rbx + 0xe8]
0x14020aba4: test sil, sil
0x14020aba7: jne 0x14020abc3
0x14020aba9: mov ecx, dword ptr [rbp + 0x520]
0x14020abaf: mov dword ptr [rbp + 0x4f0], ecx
0x14020abb5: movaps xmm0, xmmword ptr [rbp + 0x510]
0x14020abbc: movaps xmmword ptr [rbp + 0x4e0], xmm0
0x14020abc3: xor ecx, ecx
0x14020abc5: test rax, rax
0x14020abc8: sete cl
0x14020abcb: mov eax, dword ptr [rbp + 0x520]
0x14020abd1: mov dword ptr [rbp + 0x490], eax
0x14020abd7: movaps xmm0, xmmword ptr [rbp + 0x510]
0x14020abde: movaps xmmword ptr [rbp + 0x480], xmm0
0x14020abe5: mov eax, dword ptr [rbp + 0x4f0]
0x14020abeb: lea rdx, [rbp + 0x494]
0x14020abf2: mov dword ptr [rdx + 0x10], eax
0x14020abf5: movaps xmm0, xmmword ptr [rbp + 0x4e0]
0x14020abfc: movups xmmword ptr [rdx], xmm0
0x14020abff: lea rax, [rip + 0x5ce58ba]
0x14020ac06: movss xmm0, dword ptr [rax + rcx*4]
0x14020ac0b: mov word ptr [rbp + 0x414], 0
0x14020ac14: mov byte ptr [rbp + 0x404], 1
0x14020ac1b: lea rax, [rbp + 0x310]
0x14020ac22: movups xmmword ptr [rax + 0x40], xmm6
0x14020ac26: movups xmmword ptr [rax + 0x30], xmm6
0x14020ac2a: movups xmmword ptr [rax + 0x20], xmm6
0x14020ac2e: movups xmmword ptr [rax + 0x10], xmm6
0x14020ac32: movups xmmword ptr [rax], xmm6
0x14020ac35: mov qword ptr [rax + 0x50], 0
0x14020ac3d: mov dword ptr [rbp + 0x42a], 5
0x14020ac47: movups xmm1, xmmword ptr [rip + 0x5d05dc2]
0x14020ac4e: movups xmmword ptr [rax + 0x68], xmm1
0x14020ac52: movups xmm1, xmmword ptr [rip + 0x5d05da7]
0x14020ac59: movups xmmword ptr [rax + 0x58], xmm1
0x14020ac5d: movups xmmword ptr [rbp + 0x388], xmm7
0x14020ac64: movups xmmword ptr [rbp + 0x398], xmm8
0x14020ac6c: mov dword ptr [rbp + 0x3a8], 1
0x14020ac76: movss dword ptr [rbp + 0x3ac], xmm0
0x14020ac7e: mov dword ptr [rbp + 0x3b0], 1
0x14020ac88: movss dword ptr [rbp + 0x3b4], xmm0
0x14020ac90: mov dword ptr [rbp + 0x3b8], 1
0x14020ac9a: movss dword ptr [rbp + 0x3bc], xmm0
0x14020aca2: mov dword ptr [rbp + 0x3c0], 1
0x14020acac: movss dword ptr [rbp + 0x3c4], xmm0
0x14020acb4: movups xmmword ptr [rbp + 0x3c8], xmm9
0x14020acbc: movups xmmword ptr [rbp + 0x3d8], xmm9
0x14020acc4: mov qword ptr [rbp + 0x408], 0
0x14020accf: mov dword ptr [rbp + 0x410], 0
0x14020acd9: movups xmmword ptr [rbp + 0x3e8], xmm10
0x14020ace1: mov dword ptr [rbp + 0x3f8], 1
0x14020aceb: movlps qword ptr [rbp + 0x3fc], xmm11
0x14020acf3: mov qword ptr [rbp + 0x422], 0
0x14020acfe: movups xmm0, xmmword ptr [rip + 0x5d05c43]
0x14020ad05: movaps xmmword ptr [rbp + 0x2b0], xmm0
0x14020ad0c: mov qword ptr [rbp + 0x2c0], 0
0x14020ad17: movups xmm0, xmmword ptr [rip + 0x5d05c42]
0x14020ad1e: movups xmmword ptr [rax - 0x48], xmm0
0x14020ad22: mov qword ptr [rax - 0x38], 0
0x14020ad2a: movups xmm0, xmmword ptr [rip + 0x5d05c47]
0x14020ad31: movups xmmword ptr [rax - 0x30], xmm0
0x14020ad35: mov qword ptr [rax - 0x20], 0
0x14020ad3d: movups xmm0, xmmword ptr [rip + 0x5d05c4c]
0x14020ad44: movups xmmword ptr [rax - 0x18], xmm0
0x14020ad48: mov qword ptr [rax - 8], 0
0x14020ad50: mov dword ptr [rax + 0x106], 0x10000
0x14020ad5a: mov word ptr [rax + 0x10a], 0
0x14020ad63: mov word ptr [rax + 0x110], 0
0x14020ad6c: mov dword ptr [rax + 0x10c], 0x10000
0x14020ad76: lea rcx, [rbp + 0x248]
0x14020ad7d: call 0x140242370
0x14020ad82: nop
0x14020ad83: mov qword ptr [rbp + 0x4c8], r12
0x14020ad8a: movaps xmm13, xmm12
0x14020ad8e: test sil, sil
0x14020ad91: jne 0x14020ad97
0x14020ad93: xorps xmm13, xmm13
0x14020ad97: mov rax, qword ptr [rbp + 0x4a0]
0x14020ad9e: lea rsi, [rbp - 0x50]
0x14020ada2: mov qword ptr [rsi + 0x1b0], rax
0x14020ada9: movaps xmm0, xmmword ptr [rbp + 0x480]
0x14020adb0: movaps xmm1, xmmword ptr [rbp + 0x490]
0x14020adb7: movups xmmword ptr [rsi + 0x1a0], xmm1
0x14020adbe: movups xmmword ptr [rsi + 0x190], xmm0
0x14020adc5: mov r8d, 0x180
0x14020adcb: mov rcx, rsi
0x14020adce: lea r12, [rbp + 0x2b0]
0x14020add5: mov rdx, r12
0x14020add8: call 0x145d145fb
0x14020addd: mov rax, qword ptr [rbp + 0x2a8]
0x14020ade4: lea rcx, [rbp + 0x1e0]
0x14020adeb: mov qword ptr [rcx + 0x60], rax
0x14020adef: movups xmm0, xmmword ptr [rbp + 0x298]
0x14020adf6: movups xmmword ptr [rcx + 0x50], xmm0
0x14020adfa: movups xmm0, xmmword ptr [rbp + 0x288]
0x14020ae01: movups xmmword ptr [rcx + 0x40], xmm0
0x14020ae05: movups xmm0, xmmword ptr [rbp + 0x248]
0x14020ae0c: movups xmm1, xmmword ptr [rbp + 0x258]
0x14020ae13: movups xmm2, xmmword ptr [rbp + 0x268]
0x14020ae1a: movups xmm3, xmmword ptr [rbp + 0x278]
0x14020ae21: movups xmmword ptr [rcx + 0x30], xmm3
0x14020ae25: movups xmmword ptr [rcx + 0x20], xmm2
0x14020ae29: movups xmmword ptr [rcx + 0x10], xmm1
0x14020ae2d: movups xmmword ptr [rcx], xmm0
0x14020ae30: mov rax, qword ptr [rbp + 0x4d8]
0x14020ae37: mov rax, qword ptr [rax]
0x14020ae3a: mov byte ptr [rbp + 0x130], 2
0x14020ae41: mov qword ptr [rbp + 0x138], r13
0x14020ae48: movss dword ptr [rbp + 0x168], xmm13
0x14020ae51: mov byte ptr [rbp + 0x16c], 2
0x14020ae58: movups xmm0, xmmword ptr [rbp + 0x238]
0x14020ae5f: movups xmmword ptr [rsi + 0x218], xmm0
0x14020ae66: movups xmm0, xmmword ptr [rbp + 0x22d]
0x14020ae6d: movups xmmword ptr [rsi + 0x20d], xmm0
0x14020ae74: movups xmm0, xmmword ptr [rbp + 0x21d]
0x14020ae7b: movups xmmword ptr [rsi + 0x1fd], xmm0
0x14020ae82: movups xmm0, xmmword ptr [rbp + 0x1dd]
0x14020ae89: movups xmm1, xmmword ptr [rbp + 0x1ed]
0x14020ae90: movups xmm2, xmmword ptr [rbp + 0x1fd]
0x14020ae97: movups xmm3, xmmword ptr [rbp + 0x20d]
0x14020ae9e: movups xmmword ptr [rsi + 0x1ed], xmm3
0x14020aea5: movups xmmword ptr [rsi + 0x1dd], xmm2
0x14020aeac: movups xmmword ptr [rsi + 0x1cd], xmm1
0x14020aeb3: movups xmmword ptr [rsi + 0x1bd], xmm0
0x14020aeba: mov qword ptr [rbp - 0x58], rax
0x14020aebe: mov rcx, r12
0x14020aec1: mov rdx, qword ptr [rbp + 0x4b8]
0x14020aec8: lea r8, [rbp - 0x58]
0x14020aecc: lea r9, [rip + 0x5cd5c6d]
0x14020aed3: call 0x1402becb0
0x14020aed8: movaps xmm0, xmmword ptr [rbp + 0x510]
0x14020aedf: movaps xmmword ptr [rbp + 0x430], xmm0
0x14020aee6: mov eax, dword ptr [rbp + 0x520]
0x14020aeec: mov dword ptr [rbp + 0x440], eax
0x14020aef2: lea rcx, [rbp + 0x444]
0x14020aef9: mov dword ptr [rcx + 0x10], eax
0x14020aefc: movups xmmword ptr [rcx], xmm0
0x14020aeff: mov eax, dword ptr [rbp + 0x520]
0x14020af05: mov dword ptr [rcx + 0x24], eax
0x14020af08: movaps xmm0, xmmword ptr [rbp + 0x510]
0x14020af0f: movups xmmword ptr [rcx + 0x14], xmm0
0x14020af13: mov eax, dword ptr [rbp + 0x520]
0x14020af19: mov dword ptr [rcx + 0x38], eax
0x14020af1c: movaps xmm0, xmmword ptr [rbp + 0x510]
0x14020af23: movups xmmword ptr [rcx + 0x28], xmm0
0x14020af27: mov r12, qword ptr [rbp + 0x2c8]
0x14020af2e: test r12, r12
0x14020af31: jne 0x14020af3a
0x14020af33: mov r12, qword ptr [rbp + 0x2d0]
0x14020af3a: mov rdx, qword ptr [rbp + 0x2b0]
0x14020af41: mov rax, qword ptr [r12]
0x14020af45: mov rsi, qword ptr [r12 + 0x10]
0x14020af4a: sub rax, rsi
0x14020af4d: cmp rax, 0x67
0x14020af51: jbe 0x14020b02c
0x14020af57: inc r13
0x14020af5a: mov rax, qword ptr [r12 + 8]
0x14020af5f: lea rcx, [rip + 0x15abba]
0x14020af66: mov qword ptr [rax + rsi], rcx
0x14020af6a: mov qword ptr [rax + rsi + 8], rdx
0x14020af6f: movaps xmm0, xmmword ptr [rbp + 0x430]
0x14020af76: movaps xmm1, xmmword ptr [rbp + 0x440]
0x14020af7d: movaps xmm2, xmmword ptr [rbp + 0x450]
0x14020af84: movaps xmm3, xmmword ptr [rbp + 0x460]
0x14020af8b: movups xmmword ptr [rax + rsi + 0x10], xmm0
0x14020af90: movups xmmword ptr [rax + rsi + 0x20], xmm1
0x14020af95: movups xmmword ptr [rax + rsi + 0x30], xmm2
0x14020af9a: movups xmmword ptr [rax + rsi + 0x40], xmm3
0x14020af9f: movaps xmm0, xmmword ptr [rbp + 0x470]
0x14020afa6: movups xmmword ptr [rax + rsi + 0x50], xmm0
0x14020afab: mov byte ptr [rax + rsi + 0x60], 0
0x14020afb0: add rsi, 0x68
0x14020afb4: mov qword ptr [r12 + 0x10], rsi
0x14020afb9: mov qword ptr [rbp - 0x58], rbx
0x14020afbd: mov rsi, qword ptr [rbp + 0x4c0]
0x14020afc4: mov qword ptr [rbp - 0x50], rsi
0x14020afc8: lea rax, [rbp + 0x4b0]
0x14020afcf: mov qword ptr [rbp - 0x48], rax
0x14020afd3: mov r12, qword ptr [rbp + 0x4c8]
0x14020afda: mov qword ptr [rbp - 0x40], r12
0x14020afde: lea rcx, [rbp + 0x2b0]
0x14020afe5: lea rdx, [rbp - 0x58]
0x14020afe9: call 0x1402ebc50
0x14020afee: mov rbx, r14
0x14020aff1: cmp r14, rdi
0x14020aff4: jne 0x14020a964
0x14020affa: jmp 0x14020b05f
0x14020affc: add rbx, 0xf0
0x14020b003: mov r14, rbx
0x14020b006: nop word ptr cs:[rax + rax]
0x14020b010: cmp byte ptr [r14 - 8], 0
0x14020b015: jne 0x14020aaf0
0x14020b01b: inc r13
0x14020b01e: cmp r14, rdi
0x14020b021: lea r14, [r14 + 0xf0]
0x14020b028: jne 0x14020b010
0x14020b02a: jmp 0x14020b05f
0x14020b02c: mov qword ptr [rsp + 0x20], 1
0x14020b035: mov r8d, 0x68
0x14020b03b: mov r9d, 1
0x14020b041: mov rcx, r12
0x14020b044: mov qword ptr [rbp + 0x4d0], rdx
0x14020b04b: mov rdx, rsi
0x14020b04e: call 0x145d14a10
0x14020b053: mov rdx, qword ptr [rbp + 0x4d0]
0x14020b05a: jmp 0x14020af57
0x14020b05f: movaps xmm6, xmmword ptr [rbp + 0x530]
0x14020b066: movaps xmm7, xmmword ptr [rbp + 0x540]
0x14020b06d: movaps xmm8, xmmword ptr [rbp + 0x550]
0x14020b075: movaps xmm9, xmmword ptr [rbp + 0x560]
0x14020b07d: movaps xmm10, xmmword ptr [rbp + 0x570]
0x14020b085: movaps xmm11, xmmword ptr [rbp + 0x580]
0x14020b08d: movaps xmm12, xmmword ptr [rbp + 0x590]
0x14020b095: movaps xmm13, xmmword ptr [rbp + 0x5a0]
0x14020b09d: add rsp, 0x638
0x14020b0a4: pop rbx
0x14020b0a5: pop rdi
0x14020b0a6: pop rsi
0x14020b0a7: pop r12
0x14020b0a9: pop r13
0x14020b0ab: pop r14
0x14020b0ad: pop r15
0x14020b0af: pop rbp
0x14020b0b0: ret

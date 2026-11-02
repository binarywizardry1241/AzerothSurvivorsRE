; room-ray 0x14198f0f0..0x14198fce4
14198f0f0: 4157 push r15
14198f0f2: 4156 push r14
14198f0f4: 4155 push r13
14198f0f6: 4154 push r12
14198f0f8: 56 push rsi
14198f0f9: 57 push rdi
14198f0fa: 55 push rbp
14198f0fb: 53 push rbx
14198f0fc: 4881ecb8010000 sub rsp, 0x1b8
14198f103: 440f29bc24a0010000 movaps xmmword ptr [rsp + 0x1a0], xmm15
14198f10c: 440f29b42490010000 movaps xmmword ptr [rsp + 0x190], xmm14
14198f115: 440f29ac2480010000 movaps xmmword ptr [rsp + 0x180], xmm13
14198f11e: 440f29a42470010000 movaps xmmword ptr [rsp + 0x170], xmm12
14198f127: 440f299c2460010000 movaps xmmword ptr [rsp + 0x160], xmm11
14198f130: 440f29942450010000 movaps xmmword ptr [rsp + 0x150], xmm10
14198f139: 440f298c2440010000 movaps xmmword ptr [rsp + 0x140], xmm9
14198f142: 440f29842430010000 movaps xmmword ptr [rsp + 0x130], xmm8
14198f14b: 0f29bc2420010000 movaps xmmword ptr [rsp + 0x120], xmm7
14198f153: 0f29b42410010000 movaps xmmword ptr [rsp + 0x110], xmm6
14198f15b: 4889ce mov rsi, rcx
14198f15e: f30f109c2420020000 movss xmm3, dword ptr [rsp + 0x220]
14198f167: 4c8b9a88000000 mov r11, qword ptr [rdx + 0x88]
14198f16e: 4d85db test r11, r11
14198f171: 0f846a080000 je 0x14198f9e1
14198f177: 4c8bbab0000000 mov r15, qword ptr [rdx + 0xb0]
14198f17e: 488b8ab8000000 mov rcx, qword ptr [rdx + 0xb8]
14198f185: 488bbaf8000000 mov rdi, qword ptr [rdx + 0xf8]
14198f18c: 488b8200010000 mov rax, qword ptr [rdx + 0x100]
14198f193: 4889442460 mov qword ptr [rsp + 0x60], rax
14198f198: 488b82c8000000 mov rax, qword ptr [rdx + 0xc8]
14198f19f: 4889842490000000 mov qword ptr [rsp + 0x90], rax
14198f1a7: 488b82d0000000 mov rax, qword ptr [rdx + 0xd0]
14198f1ae: 4889442478 mov qword ptr [rsp + 0x78], rax
14198f1b3: 4c8b9280000000 mov r10, qword ptr [rdx + 0x80]
14198f1ba: 488b4238 mov rax, qword ptr [rdx + 0x38]
14198f1be: 4889842488000000 mov qword ptr [rsp + 0x88], rax
14198f1c6: 488b4240 mov rax, qword ptr [rdx + 0x40]
14198f1ca: 4889842498000000 mov qword ptr [rsp + 0x98], rax
14198f1d2: 4c8b7250 mov r14, qword ptr [rdx + 0x50]
14198f1d6: 488b5a58 mov rbx, qword ptr [rdx + 0x58]
14198f1da: 488b4268 mov rax, qword ptr [rdx + 0x68]
14198f1de: 4889842480000000 mov qword ptr [rsp + 0x80], rax
14198f1e6: 488b4270 mov rax, qword ptr [rdx + 0x70]
14198f1ea: 4889442468 mov qword ptr [rsp + 0x68], rax
14198f1ef: 496beb2c imul rbp, r11, 0x2c
14198f1f3: 4c01d5 add rbp, r10
14198f1f6: f2410f1030 movsd xmm6, qword ptr [r8]
14198f1fb: f30f16fe movshdup xmm7, xmm6
14198f1ff: f3450f104008 movss xmm8, dword ptr [r8 + 8]
14198f205: 4983c710 add r15, 0x10
14198f209: f3440f101d02376604 movss xmm11, dword ptr [rip + 0x4663702]
14198f212: 4531e4 xor r12d, r12d
14198f215: 440f280d13e54004 movaps xmm9, xmmword ptr [rip + 0x440e513]
14198f21d: f3440f103dfac27004 movss xmm15, dword ptr [rip + 0x470c2fa]
14198f226: 450f57f6 xorps xmm14, xmm14
14198f22a: 4c8d8424e0000000 lea r8, [rsp + 0xe0]
14198f232: 4d89d5 mov r13, r10
14198f235: 48c744245000000000 mov qword ptr [rsp + 0x50], 0
14198f23e: 4969d4a8000000 imul rdx, r12, 0xa8
14198f245: 4801fa add rdx, rdi
14198f248: 4b8d0464 lea rax, [r12 + r12*2]
14198f24c: 498d04c7 lea rax, [r15 + rax*8]
14198f250: eb29 jmp 0x14198f27b
14198f252: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14198f260: 4983c52c add r13, 0x2c
14198f264: 4881c2a8000000 add rdx, 0xa8
14198f26b: 4883c018 add rax, 0x18
14198f26f: 49ffc4 inc r12
14198f272: 4939ed cmp r13, rbp
14198f275: 0f84b0030000 je 0x14198f62b
14198f27b: 410f2e7504 ucomiss xmm6, dword ptr [r13 + 4]
14198f280: 72de jb 0x14198f260
14198f282: f3410f104510 movss xmm0, dword ptr [r13 + 0x10]
14198f288: 0f2ec6 ucomiss xmm0, xmm6
14198f28b: 72d3 jb 0x14198f260
14198f28d: 410f2e7d08 ucomiss xmm7, dword ptr [r13 + 8]
14198f292: 72cc jb 0x14198f260
14198f294: f3410f104514 movss xmm0, dword ptr [r13 + 0x14]
14198f29a: 0f2ec7 ucomiss xmm0, xmm7
14198f29d: 72c1 jb 0x14198f260
14198f29f: 450f2e450c ucomiss xmm8, dword ptr [r13 + 0xc]
14198f2a4: 72ba jb 0x14198f260
14198f2a6: 48897c2470 mov qword ptr [rsp + 0x70], rdi
14198f2ab: 44894c242c mov dword ptr [rsp + 0x2c], r9d
14198f2b0: 4c895c2438 mov qword ptr [rsp + 0x38], r11
14198f2b5: 4c89542440 mov qword ptr [rsp + 0x40], r10
14198f2ba: 4889742448 mov qword ptr [rsp + 0x48], rsi
14198f2bf: 4939cc cmp r12, rcx
14198f2c2: 7318 jae 0x14198f2dc
14198f2c4: 488b78f8 mov rdi, qword ptr [rax - 8]
14198f2c8: 488b30 mov rsi, qword ptr [rax]
14198f2cb: 4c3b642460 cmp r12, qword ptr [rsp + 0x60]
14198f2d0: 48894c2458 mov qword ptr [rsp + 0x58], rcx
14198f2d5: 721c jb 0x14198f2f3
14198f2d7: e9c5010000 jmp 0x14198f4a1
14198f2dc: bf04000000 mov edi, 4
14198f2e1: 31f6 xor esi, esi
14198f2e3: 4c3b642460 cmp r12, qword ptr [rsp + 0x60]
14198f2e8: 48894c2458 mov qword ptr [rsp + 0x58], rcx
14198f2ed: 0f83ae010000 jae 0x14198f4a1
14198f2f3: 48833aff cmp qword ptr [rdx], -1
14198f2f7: 0f84a4010000 je 0x14198f4a1
14198f2fd: 4c89c1 mov rcx, r8
14198f300: 0f28d6 movaps xmm2, xmm6
14198f303: 0f28df movaps xmm3, xmm7
14198f306: e8e5e09800 call 0x14231d3f0
14198f30b: 0f108424e0000000 movups xmm0, xmmword ptr [rsp + 0xe0]
14198f313: 0f108c24f0000000 movups xmm1, xmmword ptr [rsp + 0xf0]
14198f31b: 0f10942400010000 movups xmm2, xmmword ptr [rsp + 0x100]
14198f323: 0f299424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm2
14198f32b: 0f298c24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm1
14198f333: 0f298424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm0
14198f33b: 488d8c24b0000000 lea rcx, [rsp + 0xb0]
14198f343: e848e29800 call 0x14231d590
14198f348: 4883f801 cmp rax, 1
14198f34c: 7443 je 0x14198f391
14198f34e: 488b742448 mov rsi, qword ptr [rsp + 0x48]
14198f353: 4c8b542440 mov r10, qword ptr [rsp + 0x40]
14198f358: 4c8b5c2438 mov r11, qword ptr [rsp + 0x38]
14198f35d: 448b4c242c mov r9d, dword ptr [rsp + 0x2c]
14198f362: 488b4c2430 mov rcx, qword ptr [rsp + 0x30]
14198f367: 4c8d8424e0000000 lea r8, [rsp + 0xe0]
14198f36f: e98f020000 jmp 0x14198f603
14198f374: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14198f380: 488d8c24b0000000 lea rcx, [rsp + 0xb0]
14198f388: e803e29800 call 0x14231d590
14198f38d: a801 test al, 1
14198f38f: 74bd je 0x14198f34e
14198f391: 4839f2 cmp rdx, rsi
14198f394: 73ea jae 0x14198f380
14198f396: 488d04d2 lea rax, [rdx + rdx*8]
14198f39a: f30f105c8704 movss xmm3, dword ptr [rdi + rax*4 + 4]
14198f3a0: f20f10448710 movsd xmm0, qword ptr [rdi + rax*4 + 0x10]
14198f3a6: f20f10648718 movsd xmm4, qword ptr [rdi + rax*4 + 0x18]
14198f3ac: f30f16cc movshdup xmm1, xmm4
14198f3b0: f30f12d0 movsldup xmm2, xmm0
14198f3b4: f30f102c87 movss xmm5, dword ptr [rdi + rax*4]
14198f3b9: f30f10d5 movss xmm2, xmm5
14198f3bd: 0f5cd4 subps xmm2, xmm4
14198f3c0: f3440f16e2 movshdup xmm12, xmm2
14198f3c5: f3440f59e2 mulss xmm12, xmm2
14198f3ca: f30f106c870c movss xmm5, dword ptr [rdi + rax*4 + 0xc]
14198f3d0: 440f28d4 movaps xmm10, xmm4
14198f3d4: f3440f5cd5 subss xmm10, xmm5
14198f3d9: 0f28eb movaps xmm5, xmm3
14198f3dc: f30f5ce9 subss xmm5, xmm1
14198f3e0: f3410f59ea mulss xmm5, xmm10
14198f3e5: f3410f58ec addss xmm5, xmm12
14198f3ea: 440f28e5 movaps xmm12, xmm5
14198f3ee: 450f54e1 andps xmm12, xmm9
14198f3f2: 450f2efc ucomiss xmm15, xmm12
14198f3f6: 7788 ja 0x14198f380
14198f3f8: 0fc6d2e1 shufps xmm2, xmm2, 0xe1
14198f3fc: 440f28e6 movaps xmm12, xmm6
14198f400: 440f5ce4 subps xmm12, xmm4
14198f404: f30f5ccb subss xmm1, xmm3
14198f408: 410f14ca unpcklps xmm1, xmm10
14198f40c: 410f59d4 mulps xmm2, xmm12
14198f410: 450fc6e4e1 shufps xmm12, xmm12, 0xe1
14198f415: 0fc6c9e1 shufps xmm1, xmm1, 0xe1
14198f419: 410f59cc mulps xmm1, xmm12
14198f41d: 0f58ca addps xmm1, xmm2
14198f420: f30f12d5 movsldup xmm2, xmm5
14198f424: 0f5eca divps xmm1, xmm2
14198f427: 440f2ef1 ucomiss xmm14, xmm1
14198f42b: 0f874fffffff ja 0x14198f380
14198f431: f30f16d9 movshdup xmm3, xmm1
14198f435: 440f2ef3 ucomiss xmm14, xmm3
14198f439: 0f8741ffffff ja 0x14198f380
14198f43f: f30f101559de4004 movss xmm2, dword ptr [rip + 0x440de59]
14198f447: f30f5cd1 subss xmm2, xmm1
14198f44b: f30f5cd3 subss xmm2, xmm3
14198f44f: 440f2ef2 ucomiss xmm14, xmm2
14198f453: 0f8727ffffff ja 0x14198f380
14198f459: f30f105c8708 movss xmm3, dword ptr [rdi + rax*4 + 8]
14198f45f: f30f10c3 movss xmm0, xmm3
14198f463: 0f59c1 mulps xmm0, xmm1
14198f466: f30f16c8 movshdup xmm1, xmm0
14198f46a: f30f59548720 mulss xmm2, dword ptr [rdi + rax*4 + 0x20]
14198f470: f30f58c8 addss xmm1, xmm0
14198f474: f30f58d1 addss xmm2, xmm1
14198f478: 440f2ec2 ucomiss xmm8, xmm2
14198f47c: 0f82fefeffff jb 0x14198f380
14198f482: 410f2ed3 ucomiss xmm2, xmm11
14198f486: 0f86f4feffff jbe 0x14198f380
14198f48c: b001 mov al, 1
14198f48e: 4889442450 mov qword ptr [rsp + 0x50], rax
14198f493: 4c89642430 mov qword ptr [rsp + 0x30], r12
14198f498: 440f28da movaps xmm11, xmm2
14198f49c: e9dffeffff jmp 0x14198f380
14198f4a1: 4885f6 test rsi, rsi
14198f4a4: 0f8440010000 je 0x14198f5ea
14198f4aa: 488d04f6 lea rax, [rsi + rsi*8]
14198f4ae: 488d0487 lea rax, [rdi + rax*4]
14198f4b2: 488b742448 mov rsi, qword ptr [rsp + 0x48]
14198f4b7: 4c8b542440 mov r10, qword ptr [rsp + 0x40]
14198f4bc: 4c8b5c2438 mov r11, qword ptr [rsp + 0x38]
14198f4c1: 448b4c242c mov r9d, dword ptr [rsp + 0x2c]
14198f4c6: 488b4c2430 mov rcx, qword ptr [rsp + 0x30]
14198f4cb: eb10 jmp 0x14198f4dd
14198f4cd: 0f1f00 nop dword ptr [rax]
14198f4d0: 4883c724 add rdi, 0x24
14198f4d4: 4839c7 cmp rdi, rax
14198f4d7: 0f8426010000 je 0x14198f603
14198f4dd: f30f106704 movss xmm4, dword ptr [rdi + 4]
14198f4e2: f30f105f1c movss xmm3, dword ptr [rdi + 0x1c]
14198f4e7: f20f104708 movsd xmm0, qword ptr [rdi + 8]
14198f4ec: f20f105714 movsd xmm2, qword ptr [rdi + 0x14]
14198f4f1: f30f100f movss xmm1, dword ptr [rdi]
14198f4f5: 0fc6cad4 shufps xmm1, xmm2, 0xd4
14198f4f9: 0fc6caf2 shufps xmm1, xmm2, 0xf2
14198f4fd: 0f28ea movaps xmm5, xmm2
14198f500: 0fc6e811 shufps xmm5, xmm0, 0x11
14198f504: 0fc6e8e2 shufps xmm5, xmm0, 0xe2
14198f508: 0f5ccd subps xmm1, xmm5
14198f50b: f30f106f10 movss xmm5, dword ptr [rdi + 0x10]
14198f510: 440f28d4 movaps xmm10, xmm4
14198f514: 440f14d5 unpcklps xmm10, xmm5
14198f518: f30f12eb movsldup xmm5, xmm3
14198f51c: 440f5cd5 subps xmm10, xmm5
14198f520: 440f28e1 movaps xmm12, xmm1
14198f524: 450f59e2 mulps xmm12, xmm10
14198f528: f3410f16ec movshdup xmm5, xmm12
14198f52d: 410f58ec addps xmm5, xmm12
14198f531: 440f28e5 movaps xmm12, xmm5
14198f535: 450f54e1 andps xmm12, xmm9
14198f539: 450f2efc ucomiss xmm15, xmm12
14198f53d: 7791 ja 0x14198f4d0
14198f53f: 440f28e6 movaps xmm12, xmm6
14198f543: f3440f5c6718 subss xmm12, dword ptr [rdi + 0x18]
14198f549: 440f28ef movaps xmm13, xmm7
14198f54d: f3440f5ceb subss xmm13, xmm3
14198f552: f30f5cdc subss xmm3, xmm4
14198f556: f3410f12e4 movsldup xmm4, xmm12
14198f55b: 410fc6dad4 shufps xmm3, xmm10, 0xd4
14198f560: 410fc6daf2 shufps xmm3, xmm10, 0xf2
14198f565: 0f59dc mulps xmm3, xmm4
14198f568: f3410f12e5 movsldup xmm4, xmm13
14198f56d: 0f59cc mulps xmm1, xmm4
14198f570: 0f58cb addps xmm1, xmm3
14198f573: f30f12dd movsldup xmm3, xmm5
14198f577: 0f5ecb divps xmm1, xmm3
14198f57a: 440f2ef1 ucomiss xmm14, xmm1
14198f57e: 0f874cffffff ja 0x14198f4d0
14198f584: f30f16e1 movshdup xmm4, xmm1
14198f588: 440f2ef4 ucomiss xmm14, xmm4
14198f58c: 0f873effffff ja 0x14198f4d0
14198f592: f30f101d06dd4004 movss xmm3, dword ptr [rip + 0x440dd06]
14198f59a: f30f5cd9 subss xmm3, xmm1
14198f59e: f30f5cdc subss xmm3, xmm4
14198f5a2: 440f2ef3 ucomiss xmm14, xmm3
14198f5a6: 0f8724ffffff ja 0x14198f4d0
14198f5ac: 0f14c2 unpcklps xmm0, xmm2
14198f5af: 0f59c1 mulps xmm0, xmm1
14198f5b2: f30f16c8 movshdup xmm1, xmm0
14198f5b6: f30f595f20 mulss xmm3, dword ptr [rdi + 0x20]
14198f5bb: f30f58c8 addss xmm1, xmm0
14198f5bf: f30f58d9 addss xmm3, xmm1
14198f5c3: 440f2ec3 ucomiss xmm8, xmm3
14198f5c7: 0f8203ffffff jb 0x14198f4d0
14198f5cd: 410f2edb ucomiss xmm3, xmm11
14198f5d1: 0f86f9feffff jbe 0x14198f4d0
14198f5d7: b101 mov cl, 1
14198f5d9: 48894c2450 mov qword ptr [rsp + 0x50], rcx
14198f5de: 4c89e1 mov rcx, r12
14198f5e1: 440f28db movaps xmm11, xmm3
14198f5e5: e9e6feffff jmp 0x14198f4d0
14198f5ea: 488b742448 mov rsi, qword ptr [rsp + 0x48]
14198f5ef: 4c8b542440 mov r10, qword ptr [rsp + 0x40]
14198f5f4: 4c8b5c2438 mov r11, qword ptr [rsp + 0x38]
14198f5f9: 448b4c242c mov r9d, dword ptr [rsp + 0x2c]
14198f5fe: 488b4c2430 mov rcx, qword ptr [rsp + 0x30]
14198f603: 48894c2430 mov qword ptr [rsp + 0x30], rcx
14198f608: 4983c52c add r13, 0x2c
14198f60c: 49ffc4 inc r12
14198f60f: 4939ed cmp r13, rbp
14198f612: f30f109c2420020000 movss xmm3, dword ptr [rsp + 0x220]
14198f61b: 488b4c2458 mov rcx, qword ptr [rsp + 0x58]
14198f620: 488b7c2470 mov rdi, qword ptr [rsp + 0x70]
14198f625: 0f8513fcffff jne 0x14198f23e
14198f62b: 4531e4 xor r12d, r12d
14198f62e: f30f100d22fc5204 movss xmm1, dword ptr [rip + 0x452fc22]
14198f636: f30f1025e6155404 movss xmm4, dword ptr [rip + 0x45415e6]
14198f63e: f30f102d8ada4304 movss xmm5, dword ptr [rip + 0x443da8a]
14198f646: 440f283d52da4304 movaps xmm15, xmmword ptr [rip + 0x443da52]
14198f64e: 4531ff xor r15d, r15d
14198f651: 4d89d5 mov r13, r10
14198f654: 488b542430 mov rdx, qword ptr [rsp + 0x30]
14198f659: 4983c52c add r13, 0x2c
14198f65d: eb11 jmp 0x14198f670
14198f65f: 90 nop 
14198f660: 49ffc4 inc r12
14198f663: 4939ed cmp r13, rbp
14198f666: 4d8d6d2c lea r13, [r13 + 0x2c]
14198f66a: 0f841d030000 je 0x14198f98d
14198f670: 410f2e75d8 ucomiss xmm6, dword ptr [r13 - 0x28]
14198f675: 72e9 jb 0x14198f660
14198f677: f3410f1045e4 movss xmm0, dword ptr [r13 - 0x1c]
14198f67d: 0f2ec6 ucomiss xmm0, xmm6
14198f680: 72de jb 0x14198f660
14198f682: 410f2e7ddc ucomiss xmm7, dword ptr [r13 - 0x24]
14198f687: 72d7 jb 0x14198f660
14198f689: f3410f1045e8 movss xmm0, dword ptr [r13 - 0x18]
14198f68f: 0f2ec7 ucomiss xmm0, xmm7
14198f692: 72cc jb 0x14198f660
14198f694: 450f2e45e0 ucomiss xmm8, dword ptr [r13 - 0x20]
14198f699: 72c5 jb 0x14198f660
14198f69b: 4989d0 mov r8, rdx
14198f69e: 410fb74dfc movzx ecx, word ptr [r13 - 4]
14198f6a3: 410fb755fe movzx edx, word ptr [r13 - 2]
14198f6a8: 4801ca add rdx, rcx
14198f6ab: 488b442468 mov rax, qword ptr [rsp + 0x68]
14198f6b0: 4839d0 cmp rax, rdx
14198f6b3: 480f42d0 cmovb rdx, rax
14198f6b7: 4839c8 cmp rax, rcx
14198f6ba: 0f8211060000 jb 0x14198fcd1
14198f6c0: 4c897c2430 mov qword ptr [rsp + 0x30], r15
14198f6c5: 44894c242c mov dword ptr [rsp + 0x2c], r9d
14198f6ca: 4c895c2438 mov qword ptr [rsp + 0x38], r11
14198f6cf: 4c89542440 mov qword ptr [rsp + 0x40], r10
14198f6d4: 4889742448 mov qword ptr [rsp + 0x48], rsi
14198f6d9: 4839ca cmp rdx, rcx
14198f6dc: 7508 jne 0x14198f6e6
14198f6de: 4c89c2 mov rdx, r8
14198f6e1: e982020000 jmp 0x14198f968
14198f6e6: 488d0452 lea rax, [rdx + rdx*2]
14198f6ea: 488b942480000000 mov rdx, qword ptr [rsp + 0x80]
14198f6f2: 4c8d3c42 lea r15, [rdx + rax*2]
14198f6f6: 488d0449 lea rax, [rcx + rcx*2]
14198f6fa: 488d3442 lea rsi, [rdx + rax*2]
14198f6fe: 4c89c2 mov rdx, r8
14198f701: 4889542458 mov qword ptr [rsp + 0x58], rdx
14198f706: f3440f115c2460 movss dword ptr [rsp + 0x60], xmm11
14198f70d: 450f28e3 movaps xmm12, xmm11
14198f711: f3440f58e1 addss xmm12, xmm1
14198f716: eb25 jmp 0x14198f73d
14198f718: 483b542438 cmp rdx, qword ptr [rsp + 0x38]
14198f71d: 0f82ef010000 jb 0x14198f912
14198f723: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14198f730: 4883c606 add rsi, 6
14198f734: 4c39fe cmp rsi, r15
14198f737: 0f8417020000 je 0x14198f954
14198f73d: 0fb706 movzx eax, word ptr [rsi]
14198f740: 4839c3 cmp rbx, rax
14198f743: 76eb jbe 0x14198f730
14198f745: 488d0480 lea rax, [rax + rax*4]
14198f749: f2410f100486 movsd xmm0, qword ptr [r14 + rax*4]
14198f74f: f3450f10748608 movss xmm14, dword ptr [r14 + rax*4 + 8]
14198f756: f3450f106c860c movss xmm13, dword ptr [r14 + rax*4 + 0xc]
14198f75d: 410f28ce movaps xmm1, xmm14
14198f761: 410f54c9 andps xmm1, xmm9
14198f765: 0f2ee1 ucomiss xmm4, xmm1
14198f768: 0f28d6 movaps xmm2, xmm6
14198f76b: 0f59d0 mulps xmm2, xmm0
14198f76e: f3440f16d2 movshdup xmm10, xmm2
14198f773: f3440f58d2 addss xmm10, xmm2
14198f778: 7626 jbe 0x14198f7a0
14198f77a: 410f28d0 movaps xmm2, xmm8
14198f77e: f3410f59d6 mulss xmm2, xmm14
14198f783: f3410f58d2 addss xmm2, xmm10
14198f788: f3410f58d5 addss xmm2, xmm13
14198f78d: 410f54d1 andps xmm2, xmm9
14198f791: 0f2ed5 ucomiss xmm2, xmm5
14198f794: 450f28d8 movaps xmm11, xmm8
14198f798: 7796 ja 0x14198f730
14198f79a: eb20 jmp 0x14198f7bc
14198f79c: 0f1f4000 nop dword ptr [rax]
14198f7a0: 450f28dd movaps xmm11, xmm13
14198f7a4: f3450f58da addss xmm11, xmm10
14198f7a9: 450f57df xorps xmm11, xmm15
14198f7ad: f3450f5ede divss xmm11, xmm14
14198f7b2: 450f2ed8 ucomiss xmm11, xmm8
14198f7b6: 0f8774ffffff ja 0x14198f730
14198f7bc: 450f2ee3 ucomiss xmm12, xmm11
14198f7c0: 0f876affffff ja 0x14198f730
14198f7c6: 498d0c86 lea rcx, [r14 + rax*4]
14198f7ca: 0fb74112 movzx eax, word ptr [rcx + 0x12]
14198f7ce: 4883f803 cmp rax, 3
14198f7d2: 0f8258ffffff jb 0x14198f730
14198f7d8: 0fb74910 movzx ecx, word ptr [rcx + 0x10]
14198f7dc: 488d1408 lea rdx, [rax + rcx]
14198f7e0: 483b942498000000 cmp rdx, qword ptr [rsp + 0x98]
14198f7e8: 0f8742ffffff ja 0x14198f730
14198f7ee: 488d0c49 lea rcx, [rcx + rcx*2]
14198f7f2: 488b942488000000 mov rdx, qword ptr [rsp + 0x88]
14198f7fa: 488d148a lea rdx, [rdx + rcx*4]
14198f7fe: 410f54c1 andps xmm0, xmm9
14198f802: 0f28d1 movaps xmm2, xmm1
14198f805: f30fc2d006 cmpnless xmm2, xmm0
14198f80a: 660f70d8f5 pshufd xmm3, xmm0, 0xf5
14198f80f: 0f2ed9 ucomiss xmm3, xmm1
14198f812: f30fc2d806 cmpnless xmm3, xmm0
14198f817: 0f56da orps xmm3, xmm2
14198f81a: 66410f7ed8 movd r8d, xmm3
14198f81f: 0f92c1 setb cl
14198f822: 4420c1 and cl, r8b
14198f825: 440fb6c9 movzx r9d, cl
14198f829: 41ba02000000 mov r10d, 2
14198f82f: 4d29ca sub r10, r9
14198f832: 4589c1 mov r9d, r8d
14198f835: 41f6d1 not r9b
14198f838: 450fb6c9 movzx r9d, r9b
14198f83c: 4183e101 and r9d, 1
14198f840: 4c898c24a0000000 mov qword ptr [rsp + 0xa0], r9
14198f848: 4c899424a8000000 mov qword ptr [rsp + 0xa8], r10
14198f850: 488d0440 lea rax, [rax + rax*2]
14198f854: 488d0482 lea rax, [rdx + rax*4]
14198f858: 48899424b0000000 mov qword ptr [rsp + 0xb0], rdx
14198f860: 48898424b8000000 mov qword ptr [rsp + 0xb8], rax
14198f868: 488d8424a0000000 lea rax, [rsp + 0xa0]
14198f870: 48898424c0000000 mov qword ptr [rsp + 0xc0], rax
14198f878: 488d8424a8000000 lea rax, [rsp + 0xa8]
14198f880: 48898424c8000000 mov qword ptr [rsp + 0xc8], rax
14198f888: 0f28ce movaps xmm1, xmm6
14198f88b: 41f6c001 test r8b, 1
14198f88f: 7503 jne 0x14198f894
14198f891: 0f28cf movaps xmm1, xmm7
14198f894: 440f28fd movaps xmm15, xmm5
14198f898: 440f28cc movaps xmm9, xmm4
14198f89c: 0f28d7 movaps xmm2, xmm7
14198f89f: 84c9 test cl, cl
14198f8a1: 7504 jne 0x14198f8a7
14198f8a3: 410f28d3 movaps xmm2, xmm11
14198f8a7: 488d8c24b0000000 lea rcx, [rsp + 0xb0]
14198f8af: e89c60f4ff call 0x1418d5950
14198f8b4: 84c0 test al, al
14198f8b6: f30f109c2420020000 movss xmm3, dword ptr [rsp + 0x220]
14198f8bf: 410f28e1 movaps xmm4, xmm9
14198f8c3: 440f280d65de4004 movaps xmm9, xmmword ptr [rip + 0x440de65]
14198f8cb: 410f28ef movaps xmm5, xmm15
14198f8cf: 0f57c0 xorps xmm0, xmm0
14198f8d2: 440f283dc6d74304 movaps xmm15, xmmword ptr [rip + 0x443d7c6]
14198f8da: 0f8450feffff je 0x14198f730
14198f8e0: f3450f59f0 mulss xmm14, xmm8
14198f8e5: f3450f58d6 addss xmm10, xmm14
14198f8ea: f3450f58ea addss xmm13, xmm10
14198f8ef: 440f2ee8 ucomiss xmm13, xmm0
14198f8f3: 0f93c0 setae al
14198f8f6: 66837e0400 cmp word ptr [rsi + 4], 0
14198f8fb: 0f9ec1 setle cl
14198f8fe: 30c1 xor cl, al
14198f900: 4c89e2 mov rdx, r12
14198f903: 0f850ffeffff jne 0x14198f718
14198f909: 0fb75602 movzx edx, word ptr [rsi + 2]
14198f90d: e906feffff jmp 0x14198f718
14198f912: 4c89e7 mov rdi, r12
14198f915: 4c39e2 cmp rdx, r12
14198f918: 7504 jne 0x14198f91e
14198f91a: 0fb77e02 movzx edi, word ptr [rsi + 2]
14198f91e: 4883c606 add rsi, 6
14198f922: 483b7c2438 cmp rdi, qword ptr [rsp + 0x38]
14198f927: 0f92c0 setb al
14198f92a: 4839d7 cmp rdi, rdx
14198f92d: 0f95c1 setne cl
14198f930: 20c1 and cl, al
14198f932: 0fb6c1 movzx eax, cl
14198f935: 4889442430 mov qword ptr [rsp + 0x30], rax
14198f93a: b001 mov al, 1
14198f93c: 4889442450 mov qword ptr [rsp + 0x50], rax
14198f941: 4c39fe cmp rsi, r15
14198f944: f30f100d0cf95204 movss xmm1, dword ptr [rip + 0x452f90c]
14198f94c: 0f85affdffff jne 0x14198f701
14198f952: eb14 jmp 0x14198f968
14198f954: 488b542458 mov rdx, qword ptr [rsp + 0x58]
14198f959: f3440f105c2460 movss xmm11, dword ptr [rsp + 0x60]
14198f960: f30f100df0f85204 movss xmm1, dword ptr [rip + 0x452f8f0]
14198f968: 49ffc4 inc r12
14198f96b: 4939ed cmp r13, rbp
14198f96e: 488b742448 mov rsi, qword ptr [rsp + 0x48]
14198f973: 4c8b542440 mov r10, qword ptr [rsp + 0x40]
14198f978: 4c8b5c2438 mov r11, qword ptr [rsp + 0x38]
14198f97d: 448b4c242c mov r9d, dword ptr [rsp + 0x2c]
14198f982: 4c8b7c2430 mov r15, qword ptr [rsp + 0x30]
14198f987: 0f85ccfcffff jne 0x14198f659
14198f98d: f644245001 test byte ptr [rsp + 0x50], 1
14198f992: 7469 je 0x14198f9fd
14198f994: 4c39da cmp rdx, r11
14198f997: 7370 jae 0x14198fa09
14198f999: 410f28c0 movaps xmm0, xmm8
14198f99d: f3410f5cc3 subss xmm0, xmm11
14198f9a2: 0f2e05eb577404 ucomiss xmm0, dword ptr [rip + 0x47457eb]
14198f9a9: 775e ja 0x14198fa09
14198f9ab: 486bc22c imul rax, rdx, 0x2c
14198f9af: 41f6040208 test byte ptr [r10 + rax], 8
14198f9b4: 7553 jne 0x14198fa09
14198f9b6: 4183f901 cmp r9d, 1
14198f9ba: 750c jne 0x14198f9c8
14198f9bc: 440f2ec3 ucomiss xmm8, xmm3
14198f9c0: 7206 jb 0x14198f9c8
14198f9c2: 410f2edb ucomiss xmm3, xmm11
14198f9c6: 7741 ja 0x14198fa09
14198f9c8: 48c70601000000 mov qword ptr [rsi], 1
14198f9cf: 48895608 mov qword ptr [rsi + 8], rdx
14198f9d3: 4c897e10 mov qword ptr [rsi + 0x10], r15
14198f9d7: b818000000 mov eax, 0x18
14198f9dc: e97d020000 jmp 0x14198fc5e
14198f9e1: 31c9 xor ecx, ecx
14198f9e3: 4183f901 cmp r9d, 1
14198f9e7: 0f855c020000 jne 0x14198fc49
14198f9ed: f3410f104008 movss xmm0, dword ptr [r8 + 8]
14198f9f3: 0f2ec3 ucomiss xmm0, xmm3
14198f9f6: 7311 jae 0x14198fa09
14198f9f8: e953020000 jmp 0x14198fc50
14198f9fd: 4183f901 cmp r9d, 1
14198fa01: 7512 jne 0x14198fa15
14198fa03: 440f2ec3 ucomiss xmm8, xmm3
14198fa07: 720c jb 0x14198fa15
14198fa09: 48c70600000000 mov qword ptr [rsi], 0
14198fa10: e942020000 jmp 0x14198fc57
14198fa15: 4d89dc mov r12, r11
14198fa18: 4989f6 mov r14, rsi
14198fa1b: f30f1005f12e6604 movss xmm0, dword ptr [rip + 0x4662ef1]
14198fa23: 31d2 xor edx, edx
14198fa25: 0f57c9 xorps xmm1, xmm1
14198fa28: 31c9 xor ecx, ecx
14198fa2a: 4d89d0 mov r8, r10
14198fa2d: 31f6 xor esi, esi
14198fa2f: 4d89d7 mov r15, r10
14198fa32: 4c8bac2490000000 mov r13, qword ptr [rsp + 0x90]
14198fa3a: f3440f103dddba7004 movss xmm15, dword ptr [rip + 0x470badd]
14198fa43: 4c8d1476 lea r10, [rsi + rsi*2]
14198fa47: 4e8d1cd500000000 lea r11, [r10*8]
14198fa4f: 4d01eb add r11, r13
14198fa52: 4989f2 mov r10, rsi
14198fa55: eb1d jmp 0x14198fa74
14198fa57: 660f1f840000000000 nop word ptr [rax + rax]
14198fa60: 4983c02c add r8, 0x2c
14198fa64: 4983c318 add r11, 0x18
14198fa68: 49ffc2 inc r10
14198fa6b: 4939e8 cmp r8, rbp
14198fa6e: 0f84a3010000 je 0x14198fc17
14198fa74: 410f2e7004 ucomiss xmm6, dword ptr [r8 + 4]
14198fa79: 72e5 jb 0x14198fa60
14198fa7b: f3410f105010 movss xmm2, dword ptr [r8 + 0x10]
14198fa81: 0f2ed6 ucomiss xmm2, xmm6
14198fa84: 72da jb 0x14198fa60
14198fa86: 410f2e7808 ucomiss xmm7, dword ptr [r8 + 8]
14198fa8b: 72d3 jb 0x14198fa60
14198fa8d: f3410f105014 movss xmm2, dword ptr [r8 + 0x14]
14198fa93: 0f2ed7 ucomiss xmm2, xmm7
14198fa96: 72c8 jb 0x14198fa60
14198fa98: 450f2e400c ucomiss xmm8, dword ptr [r8 + 0xc]
14198fa9d: 72c1 jb 0x14198fa60
14198fa9f: 4c3b542478 cmp r10, qword ptr [rsp + 0x78]
14198faa4: 4c0f43da cmovae r11, rdx
14198faa8: 498d7201 lea rsi, [r10 + 1]
14198faac: 4983c02c add r8, 0x2c
14198fab0: 31ff xor edi, edi
14198fab2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14198fac0: 4885ff test rdi, rdi
14198fac3: 740b je 0x14198fad0
14198fac5: 4c39cf cmp rdi, r9
14198fac8: 7406 je 0x14198fad0
14198faca: 4889fb mov rbx, rdi
14198facd: eb26 jmp 0x14198faf5
14198facf: 90 nop 
14198fad0: 4d85db test r11, r11
14198fad3: 0f8435010000 je 0x14198fc0e
14198fad9: 498b5b08 mov rbx, qword ptr [r11 + 8]
14198fadd: 4d8b5b10 mov r11, qword ptr [r11 + 0x10]
14198fae1: 4f8d0cdb lea r9, [r11 + r11*8]
14198fae5: 4e8d0c8b lea r9, [rbx + r9*4]
14198fae9: 4d85db test r11, r11
14198faec: 0f841c010000 je 0x14198fc0e
14198faf2: 4531db xor r11d, r11d
14198faf5: 488d7b24 lea rdi, [rbx + 0x24]
14198faf9: f3440f105304 movss xmm10, dword ptr [rbx + 4]
14198faff: f30f106b1c movss xmm5, dword ptr [rbx + 0x1c]
14198fb04: f20f105308 movsd xmm2, qword ptr [rbx + 8]
14198fb09: f20f106314 movsd xmm4, qword ptr [rbx + 0x14]
14198fb0e: f30f101b movss xmm3, dword ptr [rbx]
14198fb12: 0fc6dcd4 shufps xmm3, xmm4, 0xd4
14198fb16: 0fc6dcf2 shufps xmm3, xmm4, 0xf2
14198fb1a: 440f28dc movaps xmm11, xmm4
14198fb1e: 440fc6da11 shufps xmm11, xmm2, 0x11
14198fb23: 440fc6dae2 shufps xmm11, xmm2, 0xe2
14198fb28: 410f5cdb subps xmm3, xmm11
14198fb2c: f3440f105b10 movss xmm11, dword ptr [rbx + 0x10]
14198fb32: 450f28e2 movaps xmm12, xmm10
14198fb36: 450f14e3 unpcklps xmm12, xmm11
14198fb3a: f3440f12dd movsldup xmm11, xmm5
14198fb3f: 450f5ce3 subps xmm12, xmm11
14198fb43: 440f28eb movaps xmm13, xmm3
14198fb47: 450f59ec mulps xmm13, xmm12
14198fb4b: f3450f16dd movshdup xmm11, xmm13
14198fb50: 450f58dd addps xmm11, xmm13
14198fb54: 450f28eb movaps xmm13, xmm11
14198fb58: 450f54e9 andps xmm13, xmm9
14198fb5c: 450f2efd ucomiss xmm15, xmm13
14198fb60: 0f875affffff ja 0x14198fac0
14198fb66: 440f28ee movaps xmm13, xmm6
14198fb6a: f3440f5c6b18 subss xmm13, dword ptr [rbx + 0x18]
14198fb70: 440f28f7 movaps xmm14, xmm7
14198fb74: f3440f5cf5 subss xmm14, xmm5
14198fb79: f3410f5cea subss xmm5, xmm10
14198fb7e: f3450f12d5 movsldup xmm10, xmm13
14198fb83: 410fc6ecd4 shufps xmm5, xmm12, 0xd4
14198fb88: 410fc6ecf2 shufps xmm5, xmm12, 0xf2
14198fb8d: 410f59ea mulps xmm5, xmm10
14198fb91: f3450f12d6 movsldup xmm10, xmm14
14198fb96: 410f59da mulps xmm3, xmm10
14198fb9a: 0f58dd addps xmm3, xmm5
14198fb9d: f3410f12eb movsldup xmm5, xmm11
14198fba2: 0f5edd divps xmm3, xmm5
14198fba5: 0f2ecb ucomiss xmm1, xmm3
14198fba8: 0f8712ffffff ja 0x14198fac0
14198fbae: f3440f16d3 movshdup xmm10, xmm3
14198fbb3: 410f2eca ucomiss xmm1, xmm10
14198fbb7: 0f8703ffffff ja 0x14198fac0
14198fbbd: f30f102ddbd64004 movss xmm5, dword ptr [rip + 0x440d6db]
14198fbc5: f30f5ceb subss xmm5, xmm3
14198fbc9: f3410f5cea subss xmm5, xmm10
14198fbce: 0f2ecd ucomiss xmm1, xmm5
14198fbd1: 0f87e9feffff ja 0x14198fac0
14198fbd7: 0f14d4 unpcklps xmm2, xmm4
14198fbda: 0f59d3 mulps xmm2, xmm3
14198fbdd: f30f16da movshdup xmm3, xmm2
14198fbe1: f30f596b20 mulss xmm5, dword ptr [rbx + 0x20]
14198fbe6: f30f58da addss xmm3, xmm2
14198fbea: f30f58eb addss xmm5, xmm3
14198fbee: 440f2ec5 ucomiss xmm8, xmm5
14198fbf2: 0f82c8feffff jb 0x14198fac0
14198fbf8: 0f2ee8 ucomiss xmm5, xmm0
14198fbfb: 0f86bffeffff jbe 0x14198fac0
14198fc01: b101 mov cl, 1
14198fc03: 0f28c5 movaps xmm0, xmm5
14198fc06: 4c89d0 mov rax, r10
14198fc09: e9b2feffff jmp 0x14198fac0
14198fc0e: 4939e8 cmp r8, rbp
14198fc11: 0f852cfeffff jne 0x14198fa43
14198fc17: f6c101 test cl, 1
14198fc1a: 742f je 0x14198fc4b
14198fc1c: f3440f5cc0 subss xmm8, xmm0
14198fc21: f30f10056b557404 movss xmm0, dword ptr [rip + 0x474556b]
14198fc29: 410f2ec0 ucomiss xmm0, xmm8
14198fc2d: 4c89f6 mov rsi, r14
14198fc30: 7215 jb 0x14198fc47
14198fc32: 4c39e0 cmp rax, r12
14198fc35: 7310 jae 0x14198fc47
14198fc37: 486bd02c imul rdx, rax, 0x2c
14198fc3b: b901000000 mov ecx, 1
14198fc40: 41f6041708 test byte ptr [r15 + rdx], 8
14198fc45: 7409 je 0x14198fc50
14198fc47: 31c9 xor ecx, ecx
14198fc49: eb05 jmp 0x14198fc50
14198fc4b: 31c9 xor ecx, ecx
14198fc4d: 4c89f6 mov rsi, r14
14198fc50: 48890e mov qword ptr [rsi], rcx
14198fc53: 48894608 mov qword ptr [rsi + 8], rax
14198fc57: b810000000 mov eax, 0x10
14198fc5c: 31ff xor edi, edi
14198fc5e: 48893c06 mov qword ptr [rsi + rax], rdi
14198fc62: 4889f0 mov rax, rsi
14198fc65: 0f28b42410010000 movaps xmm6, xmmword ptr [rsp + 0x110]
14198fc6d: 0f28bc2420010000 movaps xmm7, xmmword ptr [rsp + 0x120]
14198fc75: 440f28842430010000 movaps xmm8, xmmword ptr [rsp + 0x130]
14198fc7e: 440f288c2440010000 movaps xmm9, xmmword ptr [rsp + 0x140]
14198fc87: 440f28942450010000 movaps xmm10, xmmword ptr [rsp + 0x150]
14198fc90: 440f289c2460010000 movaps xmm11, xmmword ptr [rsp + 0x160]
14198fc99: 440f28a42470010000 movaps xmm12, xmmword ptr [rsp + 0x170]
14198fca2: 440f28ac2480010000 movaps xmm13, xmmword ptr [rsp + 0x180]
14198fcab: 440f28b42490010000 movaps xmm14, xmmword ptr [rsp + 0x190]
14198fcb4: 440f28bc24a0010000 movaps xmm15, xmmword ptr [rsp + 0x1a0]
14198fcbd: 4881c4b8010000 add rsp, 0x1b8
14198fcc4: 5b pop rbx
14198fcc5: 5d pop rbp
14198fcc6: 5f pop rdi
14198fcc7: 5e pop rsi
14198fcc8: 415c pop r12
14198fcca: 415d pop r13
14198fccc: 415e pop r14
14198fcce: 415f pop r15
14198fcd0: c3 ret 
14198fcd1: 4c8d0d70627404 lea r9, [rip + 0x4746270]
14198fcd8: 4c8b442468 mov r8, qword ptr [rsp + 0x68]
14198fcdd: e87e9b4004 call 0x145d99860
14198fce2: 0f0b ud2 

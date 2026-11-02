1400ee9d0: 55 push rbp
1400ee9d1: 4157 push r15
1400ee9d3: 4156 push r14
1400ee9d5: 4155 push r13
1400ee9d7: 4154 push r12
1400ee9d9: 56 push rsi
1400ee9da: 57 push rdi
1400ee9db: 53 push rbx
1400ee9dc: 4881eca8040000 sub rsp, 0x4a8
1400ee9e3: 488dac2480000000 lea rbp, [rsp + 0x80]
1400ee9eb: 440f29bd10040000 movaps xmmword ptr [rbp + 0x410], xmm15
1400ee9f3: 440f29b500040000 movaps xmmword ptr [rbp + 0x400], xmm14
1400ee9fb: 440f29adf0030000 movaps xmmword ptr [rbp + 0x3f0], xmm13
1400eea03: 440f29a5e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm12
1400eea0b: 440f299dd0030000 movaps xmmword ptr [rbp + 0x3d0], xmm11
1400eea13: 440f2995c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm10
1400eea1b: 440f298db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm9
1400eea23: 440f2985a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm8
1400eea2b: 0f29bd90030000 movaps xmmword ptr [rbp + 0x390], xmm7
1400eea32: 0f29b580030000 movaps xmmword ptr [rbp + 0x380], xmm6
1400eea39: 48c78578030000feffffff mov qword ptr [rbp + 0x378], 0xfffffffffffffffe
1400eea44: 0f28f3 movaps xmm6, xmm3
1400eea47: 4c89c7 mov rdi, r8
1400eea4a: 48899540030000 mov qword ptr [rbp + 0x340], rdx
1400eea51: 4889cb mov rbx, rcx
1400eea54: 48c7411000000000 mov qword ptr [rcx + 0x10], 0
1400eea5c: 488b7118 mov rsi, qword ptr [rcx + 0x18]
1400eea60: 488d8df0020000 lea rcx, [rbp + 0x2f0]
1400eea67: 4c89c2 mov rdx, r8
1400eea6a: e861a44f01 call 0x1415e8ed0
1400eea6f: f30f104714 movss xmm0, dword ptr [rdi + 0x14]
1400eea74: f30f104f18 movss xmm1, dword ptr [rdi + 0x18]
1400eea79: f30f11855c030000 movss dword ptr [rbp + 0x35c], xmm0
1400eea81: f30f5cc8 subss xmm1, xmm0
1400eea85: 0f57c0 xorps xmm0, xmm0
1400eea88: f30f118d60030000 movss dword ptr [rbp + 0x360], xmm1
1400eea90: 0f2ec1 ucomiss xmm0, xmm1
1400eea93: 0f8333070000 jae 0x1400ef1cc
1400eea99: f30f104f1c movss xmm1, dword ptr [rdi + 0x1c]
1400eea9e: f3440f105720 movss xmm10, dword ptr [rdi + 0x20]
1400eeaa4: f3440f5cd1 subss xmm10, xmm1
1400eeaa9: 4531d2 xor r10d, r10d
1400eeaac: 410f2ec2 ucomiss xmm0, xmm10
1400eeab0: 0f8319070000 jae 0x1400ef1cf
1400eeab6: 440f28c1 movaps xmm8, xmm1
1400eeaba: 48c7854803000000000000 mov qword ptr [rbp + 0x348], 0
1400eeac5: f30f11b534030000 movss dword ptr [rbp + 0x334], xmm6
1400eeacd: 488b0e mov rcx, qword ptr [rsi]
1400eead0: 488b4608 mov rax, qword ptr [rsi + 8]
1400eead4: 48898510030000 mov qword ptr [rbp + 0x310], rax
1400eeadb: 488b91f8000000 mov rdx, qword ptr [rcx + 0xf8]
1400eeae2: 488b8100010000 mov rax, qword ptr [rcx + 0x100]
1400eeae9: 48899550030000 mov qword ptr [rbp + 0x350], rdx
1400eeaf0: 488d0482 lea rax, [rdx + rax*4]
1400eeaf4: 48898518030000 mov qword ptr [rbp + 0x318], rax
1400eeafb: 48898d28030000 mov qword ptr [rbp + 0x328], rcx
1400eeb02: 0fb68108010000 movzx eax, byte ptr [rcx + 0x108]
1400eeb09: 888577030000 mov byte ptr [rbp + 0x377], al
1400eeb0f: f3440f101f movss xmm11, dword ptr [rdi]
1400eeb14: f3440f106708 movss xmm12, dword ptr [rdi + 8]
1400eeb1a: f3440f106f10 movss xmm13, dword ptr [rdi + 0x10]
1400eeb20: 4889bd08030000 mov qword ptr [rbp + 0x308], rdi
1400eeb27: f3440f10770c movss xmm14, dword ptr [rdi + 0xc]
1400eeb2d: b808000000 mov eax, 8
1400eeb32: 48898520030000 mov qword ptr [rbp + 0x320], rax
1400eeb39: 48c7856803000000000000 mov qword ptr [rbp + 0x368], 0
1400eeb44: c7856403000000000000 mov dword ptr [rbp + 0x364], 0
1400eeb4e: 80bd7703000000 cmp byte ptr [rbp + 0x377], 0
1400eeb55: 0f84b5000000 je 0x1400eec10
1400eeb5b: 4c8b8548030000 mov r8, qword ptr [rbp + 0x348]
1400eeb62: 448b9d64030000 mov r11d, dword ptr [rbp + 0x364]
1400eeb69: 4539c3 cmp r11d, r8d
1400eeb6c: 488b9510030000 mov rdx, qword ptr [rbp + 0x310]
1400eeb73: 4c8b8d50030000 mov r9, qword ptr [rbp + 0x350]
1400eeb7a: 4c8b9518030000 mov r10, qword ptr [rbp + 0x318]
1400eeb81: 0f8547010000 jne 0x1400eecce
1400eeb87: 660f1f840000000000 nop word ptr [rax + rax]
1400eeb90: 4d39d1 cmp r9, r10
1400eeb93: 0f847c060000 je 0x1400ef215
1400eeb99: 418b09 mov ecx, dword ptr [r9]
1400eeb9c: 4983c104 add r9, 4
1400eeba0: 488b82a8010000 mov rax, qword ptr [rdx + 0x1a8]
1400eeba7: 488d0cc9 lea rcx, [rcx + rcx*8]
1400eebab: 4c8b44c810 mov r8, qword ptr [rax + rcx*8 + 0x10]
1400eebb0: 4d85c0 test r8, r8
1400eebb3: 74db je 0x1400eeb90
1400eebb5: 488d04c8 lea rax, [rax + rcx*8]
1400eebb9: 488b8d28030000 mov rcx, qword ptr [rbp + 0x328]
1400eebc0: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400eebc7: 483b4840 cmp rcx, qword ptr [rax + 0x40]
1400eebcb: 0f83ef000000 jae 0x1400eecc0
1400eebd1: 488b5038 mov rdx, qword ptr [rax + 0x38]
1400eebd5: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
1400eebd9: 4885c9 test rcx, rcx
1400eebdc: 0f84de000000 je 0x1400eecc0
1400eebe2: 488b4018 mov rax, qword ptr [rax + 0x18]
1400eebe6: 48f7d1 not rcx
1400eebe9: 488d0c49 lea rcx, [rcx + rcx*2]
1400eebed: 48c1e104 shl rcx, 4
1400eebf1: 488b440810 mov rax, qword ptr [rax + rcx + 0x10]
1400eebf6: 48898568030000 mov qword ptr [rbp + 0x368], rax
1400eebfd: e9c9000000 jmp 0x1400eeccb
1400eec02: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400eec10: 4c8b8d48030000 mov r9, qword ptr [rbp + 0x348]
1400eec17: 448b9d64030000 mov r11d, dword ptr [rbp + 0x364]
1400eec1e: 4539cb cmp r11d, r9d
1400eec21: 488b9510030000 mov rdx, qword ptr [rbp + 0x310]
1400eec28: 4c8b9550030000 mov r10, qword ptr [rbp + 0x350]
1400eec2f: 4c8b8518030000 mov r8, qword ptr [rbp + 0x318]
1400eec36: 0f85be000000 jne 0x1400eecfa
1400eec3c: 0f1f4000 nop dword ptr [rax]
1400eec40: 4d39c2 cmp r10, r8
1400eec43: 0f84cc050000 je 0x1400ef215
1400eec49: 418b0a mov ecx, dword ptr [r10]
1400eec4c: 4983c204 add r10, 4
1400eec50: 488b8208010000 mov rax, qword ptr [rdx + 0x108]
1400eec57: 488d0c89 lea rcx, [rcx + rcx*4]
1400eec5b: 48c1e105 shl rcx, 5
1400eec5f: 4c8b4c0858 mov r9, qword ptr [rax + rcx + 0x58]
1400eec64: 4d85c9 test r9, r9
1400eec67: 74d7 je 0x1400eec40
1400eec69: 4801c8 add rax, rcx
1400eec6c: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1400eec72: 488b92a8010000 mov rdx, qword ptr [rdx + 0x1a8]
1400eec79: 4c8d04c9 lea r8, [rcx + rcx*8]
1400eec7d: 488b8d28030000 mov rcx, qword ptr [rbp + 0x328]
1400eec84: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
1400eec8b: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
1400eec90: 734f jae 0x1400eece1
1400eec92: 4a8d14c2 lea rdx, [rdx + r8*8]
1400eec96: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
1400eec9a: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
1400eec9e: 4885c9 test rcx, rcx
1400eeca1: 743e je 0x1400eece1
1400eeca3: 488b5218 mov rdx, qword ptr [rdx + 0x18]
1400eeca7: 48f7d1 not rcx
1400eecaa: 488d0c49 lea rcx, [rcx + rcx*2]
1400eecae: 48c1e104 shl rcx, 4
1400eecb2: 488b4c0a10 mov rcx, qword ptr [rdx + rcx + 0x10]
1400eecb7: 48898d68030000 mov qword ptr [rbp + 0x368], rcx
1400eecbe: eb2c jmp 0x1400eecec
1400eecc0: 48c7856803000000000000 mov qword ptr [rbp + 0x368], 0
1400eeccb: 4531db xor r11d, r11d
1400eecce: 4c898d50030000 mov qword ptr [rbp + 0x350], r9
1400eecd5: 4c898548030000 mov qword ptr [rbp + 0x348], r8
1400eecdc: 4489d8 mov eax, r11d
1400eecdf: eb3b jmp 0x1400eed1c
1400eece1: 48c7856803000000000000 mov qword ptr [rbp + 0x368], 0
1400eecec: 488b4050 mov rax, qword ptr [rax + 0x50]
1400eecf0: 48898520030000 mov qword ptr [rbp + 0x320], rax
1400eecf7: 4531db xor r11d, r11d
1400eecfa: 4c899550030000 mov qword ptr [rbp + 0x350], r10
1400eed01: 4c898d48030000 mov qword ptr [rbp + 0x348], r9
1400eed08: 4489d8 mov eax, r11d
1400eed0b: 48c1e004 shl rax, 4
1400eed0f: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
1400eed16: 8b440108 mov eax, dword ptr [rcx + rax + 8]
1400eed1a: f7d0 not eax
1400eed1c: 488d0440 lea rax, [rax + rax*2]
1400eed20: 48c1e004 shl rax, 4
1400eed24: 48038568030000 add rax, qword ptr [rbp + 0x368]
1400eed2b: 41ffc3 inc r11d
1400eed2e: 44899d64030000 mov dword ptr [rbp + 0x364], r11d
1400eed35: 488b08 mov rcx, qword ptr [rax]
1400eed38: 488b5008 mov rdx, qword ptr [rax + 8]
1400eed3c: 488b4210 mov rax, qword ptr [rdx + 0x10]
1400eed40: 48ffc8 dec rax
1400eed43: 4883e0f0 and rax, 0xfffffffffffffff0
1400eed47: 4801c1 add rcx, rax
1400eed4a: 4883c110 add rcx, 0x10
1400eed4e: e86d440d02 call 0x1421c31c0
1400eed53: 4885c0 test rax, rax
1400eed56: 0f84f2fdffff je 0x1400eeb4e
1400eed5c: 488d8de0000000 lea rcx, [rbp + 0xe0]
1400eed63: 4889c2 mov rdx, rax
1400eed66: 48898538030000 mov qword ptr [rbp + 0x338], rax
1400eed6d: e83e9c0d02 call 0x1421c89b0
1400eed72: 0f1085f4020000 movups xmm0, xmmword ptr [rbp + 0x2f4]
1400eed79: 0f28c8 movaps xmm1, xmm0
1400eed7c: 0f128df0000000 movlps xmm1, qword ptr [rbp + 0xf0]
1400eed83: 660f1485e0000000 unpcklpd xmm0, xmmword ptr [rbp + 0xe0]
1400eed8b: 0fc2c106 cmpnleps xmm0, xmm1
1400eed8f: 0f50c0 movmskps eax, xmm0
1400eed92: 85c0 test eax, eax
1400eed94: 488b9538030000 mov rdx, qword ptr [rbp + 0x338]
1400eed9b: 0f85adfdffff jne 0x1400eeb4e
1400eeda1: f30f1085ec000000 movss xmm0, dword ptr [rbp + 0xec]
1400eeda9: 0f2e85f0020000 ucomiss xmm0, dword ptr [rbp + 0x2f0]
1400eedb0: 0f8298fdffff jb 0x1400eeb4e
1400eedb6: f30f108504030000 movss xmm0, dword ptr [rbp + 0x304]
1400eedbe: 0f2e85e8000000 ucomiss xmm0, dword ptr [rbp + 0xe8]
1400eedc5: 0f8283fdffff jb 0x1400eeb4e
1400eedcb: 488d75c0 lea rsi, [rbp - 0x40]
1400eedcf: 4889f1 mov rcx, rsi
1400eedd2: 4c8d85f0020000 lea r8, [rbp + 0x2f0]
1400eedd9: e872cf0e02 call 0x1421dbd50
1400eedde: 41b820010000 mov r8d, 0x120
1400eede4: 488d8de0000000 lea rcx, [rbp + 0xe0]
1400eedeb: 4889f2 mov rdx, rsi
1400eedee: e8483bb005 call 0x145bf293b
1400eedf3: 90 nop
1400eedf4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400eee00: 488d8de0000000 lea rcx, [rbp + 0xe0]
1400eee07: e8e4d90200 call 0x14011c7f0
1400eee0c: 90 nop
1400eee0d: 83f801 cmp eax, 1
1400eee10: 0f858a030000 jne 0x1400ef1a0
1400eee16: 89d1 mov ecx, edx
1400eee18: 488b8538030000 mov rax, qword ptr [rbp + 0x338]
1400eee1f: 488b9080000000 mov rdx, qword ptr [rax + 0x80]
1400eee26: 4839ca cmp rdx, rcx
1400eee29: 0f8601050000 jbe 0x1400ef330
1400eee2f: 488b5068 mov rdx, qword ptr [rax + 0x68]
1400eee33: 4c8b4078 mov r8, qword ptr [rax + 0x78]
1400eee37: 4c8d0c49 lea r9, [rcx + rcx*2]
1400eee3b: 438b0c88 mov ecx, dword ptr [r8 + r9*4]
1400eee3f: 4839ca cmp rdx, rcx
1400eee42: 0f8609050000 jbe 0x1400ef351
1400eee48: 4b8d0488 lea rax, [r8 + r9*4]
1400eee4c: 8b4004 mov eax, dword ptr [rax + 4]
1400eee4f: 4839c2 cmp rdx, rax
1400eee52: 0f86e7040000 jbe 0x1400ef33f
1400eee58: 478b4c8808 mov r9d, dword ptr [r8 + r9*4 + 8]
1400eee5d: 4c39ca cmp rdx, r9
1400eee60: 0f86fa040000 jbe 0x1400ef360
1400eee66: 488b9538030000 mov rdx, qword ptr [rbp + 0x338]
1400eee6d: 488b5260 mov rdx, qword ptr [rdx + 0x60]
1400eee71: 488d0440 lea rax, [rax + rax*2]
1400eee75: 488d0c49 lea rcx, [rcx + rcx*2]
1400eee79: 4f8d0449 lea r8, [r9 + r9*2]
1400eee7d: 448b4c8a08 mov r9d, dword ptr [rdx + rcx*4 + 8]
1400eee82: 44898d88020000 mov dword ptr [rbp + 0x288], r9d
1400eee89: 488b0c8a mov rcx, qword ptr [rdx + rcx*4]
1400eee8d: 48898d80020000 mov qword ptr [rbp + 0x280], rcx
1400eee94: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
1400eee98: 4c8d8d8c020000 lea r9, [rbp + 0x28c]
1400eee9f: 41894908 mov dword ptr [r9 + 8], ecx
1400eeea3: 488b0482 mov rax, qword ptr [rdx + rax*4]
1400eeea7: 498901 mov qword ptr [r9], rax
1400eeeaa: 428b448208 mov eax, dword ptr [rdx + r8*4 + 8]
1400eeeaf: 41894114 mov dword ptr [r9 + 0x14], eax
1400eeeb3: 4a8b0482 mov rax, qword ptr [rdx + r8*4]
1400eeeb7: 4989410c mov qword ptr [r9 + 0xc], rax
1400eeebb: 488d8d08020000 lea rcx, [rbp + 0x208]
1400eeec2: 488d9580020000 lea rdx, [rbp + 0x280]
1400eeec9: 4c8b8508030000 mov r8, qword ptr [rbp + 0x308]
1400eeed0: e8fbaa4f01 call 0x1415e99d0
1400eeed5: 90 nop
1400eeed6: 0f108564020000 movups xmm0, xmmword ptr [rbp + 0x264]
1400eeedd: 0f1185dc020000 movups xmmword ptr [rbp + 0x2dc], xmm0
1400eeee4: 0f108558020000 movups xmm0, xmmword ptr [rbp + 0x258]
1400eeeeb: 0f2985d0020000 movaps xmmword ptr [rbp + 0x2d0], xmm0
1400eeef2: 0f108548020000 movups xmm0, xmmword ptr [rbp + 0x248]
1400eeef9: 0f2985c0020000 movaps xmmword ptr [rbp + 0x2c0], xmm0
1400eef00: 0f108508020000 movups xmm0, xmmword ptr [rbp + 0x208]
1400eef07: 0f108d18020000 movups xmm1, xmmword ptr [rbp + 0x218]
1400eef0e: 0f109528020000 movups xmm2, xmmword ptr [rbp + 0x228]
1400eef15: 0f109d38020000 movups xmm3, xmmword ptr [rbp + 0x238]
1400eef1c: 0f299db0020000 movaps xmmword ptr [rbp + 0x2b0], xmm3
1400eef23: 0f2995a0020000 movaps xmmword ptr [rbp + 0x2a0], xmm2
1400eef2a: 0f298d90020000 movaps xmmword ptr [rbp + 0x290], xmm1
1400eef31: 0f298580020000 movaps xmmword ptr [rbp + 0x280], xmm0
1400eef38: 4c8bb578020000 mov r14, qword ptr [rbp + 0x278]
1400eef3f: 4983fe03 cmp r14, 3
1400eef43: 0f82b7feffff jb 0x1400eee00
1400eef49: 49ffce dec r14
1400eef4c: f20f10b580020000 movsd xmm6, qword ptr [rbp + 0x280]
1400eef54: f3440f10bd88020000 movss xmm15, dword ptr [rbp + 0x288]
1400eef5d: 0f28c6 movaps xmm0, xmm6
1400eef60: f3410f5cc3 subss xmm0, xmm11
1400eef65: 410f28cf movaps xmm1, xmm15
1400eef69: f3410f5ccc subss xmm1, xmm12
1400eef6e: 410f28d5 movaps xmm2, xmm13
1400eef72: f30f59d0 mulss xmm2, xmm0
1400eef76: 410f28de movaps xmm3, xmm14
1400eef7a: f30f59d9 mulss xmm3, xmm1
1400eef7e: f30f5cd3 subss xmm2, xmm3
1400eef82: f3410f59cd mulss xmm1, xmm13
1400eef87: f3410f59c6 mulss xmm0, xmm14
1400eef8c: f30f58c1 addss xmm0, xmm1
1400eef90: f30f5c955c030000 subss xmm2, dword ptr [rbp + 0x35c]
1400eef98: f30f5e9560030000 divss xmm2, dword ptr [rbp + 0x360]
1400eefa0: f3410f5cc0 subss xmm0, xmm8
1400eefa5: f3410f5ec2 divss xmm0, xmm10
1400eefaa: 66410f7ed4 movd r12d, xmm2
1400eefaf: 660f7ec0 movd eax, xmm0
1400eefb3: 48c1e020 shl rax, 0x20
1400eefb7: 4909c4 or r12, rax
1400eefba: 41bd01000000 mov r13d, 1
1400eefc0: e996000000 jmp 0x1400ef05b
1400eefc5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400eefd0: 0f28c7 movaps xmm0, xmm7
1400eefd3: f3410f5cc3 subss xmm0, xmm11
1400eefd8: 410f28c9 movaps xmm1, xmm9
1400eefdc: f3410f5ccc subss xmm1, xmm12
1400eefe1: 410f28d5 movaps xmm2, xmm13
1400eefe5: f30f59d0 mulss xmm2, xmm0
1400eefe9: 410f28de movaps xmm3, xmm14
1400eefed: f30f59d9 mulss xmm3, xmm1
1400eeff1: f30f5cd3 subss xmm2, xmm3
1400eeff5: f3410f59cd mulss xmm1, xmm13
1400eeffa: f3410f59c6 mulss xmm0, xmm14
1400eefff: f30f58c1 addss xmm0, xmm1
1400ef003: f30f5c955c030000 subss xmm2, dword ptr [rbp + 0x35c]
1400ef00b: f30f5e9560030000 divss xmm2, dword ptr [rbp + 0x360]
1400ef013: f3410f5cc0 subss xmm0, xmm8
1400ef018: f3410f5ec2 divss xmm0, xmm10
1400ef01d: 660f7ed0 movd eax, xmm2
1400ef021: 660f7ec1 movd ecx, xmm0
1400ef025: 48c1e120 shl rcx, 0x20
1400ef029: 4809c8 or rax, rcx
1400ef02c: 488b4b08 mov rcx, qword ptr [rbx + 8]
1400ef030: 4b8d14ff lea rdx, [r15 + r15*8]
1400ef034: 0f133c91 movlps qword ptr [rcx + rdx*4], xmm7
1400ef038: f3440f114c9108 movss dword ptr [rcx + rdx*4 + 8], xmm9
1400ef03f: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
1400ef044: 0f2805b585ca05 movaps xmm0, xmmword ptr [rip + 0x5ca85b5]
1400ef04b: 0f11449114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm0
1400ef050: 4883c703 add rdi, 3
1400ef054: 48897b10 mov qword ptr [rbx + 0x10], rdi
1400ef058: 4989f5 mov r13, rsi
1400ef05b: 4d39f5 cmp r13, r14
1400ef05e: 0f839cfdffff jae 0x1400eee00
1400ef064: 488b7b10 mov rdi, qword ptr [rbx + 0x10]
1400ef068: 483b3b cmp rdi, qword ptr [rbx]
1400ef06b: 7509 jne 0x1400ef076
1400ef06d: 4889d9 mov rcx, rbx
1400ef070: e8ab20b505 call 0x145c41120
1400ef075: 90 nop
1400ef076: 488b4308 mov rax, qword ptr [rbx + 8]
1400ef07a: 488d0cff lea rcx, [rdi + rdi*8]
1400ef07e: 0f133488 movlps qword ptr [rax + rcx*4], xmm6
1400ef082: f3440f117c8808 movss dword ptr [rax + rcx*4 + 8], xmm15
1400ef089: 4c8964880c mov qword ptr [rax + rcx*4 + 0xc], r12
1400ef08e: 0f28056b85ca05 movaps xmm0, xmmword ptr [rip + 0x5ca856b]
1400ef095: 0f11448814 movups xmmword ptr [rax + rcx*4 + 0x14], xmm0
1400ef09a: 4c8d7f01 lea r15, [rdi + 1]
1400ef09e: 4c897b10 mov qword ptr [rbx + 0x10], r15
1400ef0a2: 4a8d046d00000000 lea rax, [r13*2]
1400ef0aa: 4c01e8 add rax, r13
1400ef0ad: f20f10bc8580020000 movsd xmm7, qword ptr [rbp + rax*4 + 0x280]
1400ef0b6: f3440f108c8588020000 movss xmm9, dword ptr [rbp + rax*4 + 0x288]
1400ef0c0: 4c3b3b cmp r15, qword ptr [rbx]
1400ef0c3: 7509 jne 0x1400ef0ce
1400ef0c5: 4889d9 mov rcx, rbx
1400ef0c8: e85320b505 call 0x145c41120
1400ef0cd: 90 nop
1400ef0ce: 498d7501 lea rsi, [r13 + 1]
1400ef0d2: 0f28c7 movaps xmm0, xmm7
1400ef0d5: f3410f5cc3 subss xmm0, xmm11
1400ef0da: 410f28c9 movaps xmm1, xmm9
1400ef0de: f3410f5ccc subss xmm1, xmm12
1400ef0e3: 410f28d5 movaps xmm2, xmm13
1400ef0e7: f30f59d0 mulss xmm2, xmm0
1400ef0eb: 410f28de movaps xmm3, xmm14
1400ef0ef: f30f59d9 mulss xmm3, xmm1
1400ef0f3: f30f5cd3 subss xmm2, xmm3
1400ef0f7: f3410f59cd mulss xmm1, xmm13
1400ef0fc: f3410f59c6 mulss xmm0, xmm14
1400ef101: f30f58c1 addss xmm0, xmm1
1400ef105: f30f5c955c030000 subss xmm2, dword ptr [rbp + 0x35c]
1400ef10d: f30f5e9560030000 divss xmm2, dword ptr [rbp + 0x360]
1400ef115: f3410f5cc0 subss xmm0, xmm8
1400ef11a: f3410f5ec2 divss xmm0, xmm10
1400ef11f: 660f7ed0 movd eax, xmm2
1400ef123: 660f7ec1 movd ecx, xmm0
1400ef127: 48c1e120 shl rcx, 0x20
1400ef12b: 4809c8 or rax, rcx
1400ef12e: 488b4b08 mov rcx, qword ptr [rbx + 8]
1400ef132: 4b8d14ff lea rdx, [r15 + r15*8]
1400ef136: 0f133c91 movlps qword ptr [rcx + rdx*4], xmm7
1400ef13a: f3440f114c9108 movss dword ptr [rcx + rdx*4 + 8], xmm9
1400ef141: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
1400ef146: 0f2805b384ca05 movaps xmm0, xmmword ptr [rip + 0x5ca84b3]
1400ef14d: 0f11449114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm0
1400ef152: 4c8d7f02 lea r15, [rdi + 2]
1400ef156: 4c897b10 mov qword ptr [rbx + 0x10], r15
1400ef15a: 4983fd08 cmp r13, 8
1400ef15e: 0f84b5010000 je 0x1400ef319
1400ef164: 488d0476 lea rax, [rsi + rsi*2]
1400ef168: f20f10bc8580020000 movsd xmm7, qword ptr [rbp + rax*4 + 0x280]
1400ef171: f3440f108c8588020000 movss xmm9, dword ptr [rbp + rax*4 + 0x288]
1400ef17b: 4c3b3b cmp r15, qword ptr [rbx]
1400ef17e: 0f854cfeffff jne 0x1400eefd0
1400ef184: 4889d9 mov rcx, rbx
1400ef187: e8941fb505 call 0x145c41120
1400ef18c: 90 nop
1400ef18d: e93efeffff jmp 0x1400eefd0
1400ef192: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400ef1a0: 488b95f8010000 mov rdx, qword ptr [rbp + 0x1f8]
1400ef1a7: 4883fa21 cmp rdx, 0x21
1400ef1ab: 0f829df9ffff jb 0x1400eeb4e
1400ef1b1: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
1400ef1b8: 48c1e203 shl rdx, 3
1400ef1bc: 41b808000000 mov r8d, 8
1400ef1c2: e80930f1ff call 0x1400021d0
1400ef1c7: e982f9ffff jmp 0x1400eeb4e
1400ef1cc: 4531d2 xor r10d, r10d
1400ef1cf: 488b85a0040000 mov rax, qword ptr [rbp + 0x4a0]
1400ef1d6: 488b7308 mov rsi, qword ptr [rbx + 8]
1400ef1da: 4885c0 test rax, rax
1400ef1dd: 7452 je 0x1400ef231
1400ef1df: 488b8d98040000 mov rcx, qword ptr [rbp + 0x498]
1400ef1e6: f30f108590040000 movss xmm0, dword ptr [rbp + 0x490]
1400ef1ee: 4889442430 mov qword ptr [rsp + 0x30], rax
1400ef1f3: 48894c2428 mov qword ptr [rsp + 0x28], rcx
1400ef1f8: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1400ef1fe: 4889f1 mov rcx, rsi
1400ef201: 4c89d2 mov rdx, r10
1400ef204: 4c8b8540030000 mov r8, qword ptr [rbp + 0x340]
1400ef20b: 0f28de movaps xmm3, xmm6
1400ef20e: e8cd930000 call 0x1400f85e0
1400ef213: eb6f jmp 0x1400ef284
1400ef215: 4c8b5310 mov r10, qword ptr [rbx + 0x10]
1400ef219: f30f10b534030000 movss xmm6, dword ptr [rbp + 0x334]
1400ef221: 488b85a0040000 mov rax, qword ptr [rbp + 0x4a0]
1400ef228: 488b7308 mov rsi, qword ptr [rbx + 8]
1400ef22c: 4885c0 test rax, rax
1400ef22f: 75ae jne 0x1400ef1df
1400ef231: 488b9540030000 mov rdx, qword ptr [rbp + 0x340]
1400ef238: 488b02 mov rax, qword ptr [rdx]
1400ef23b: 488b5a10 mov rbx, qword ptr [rdx + 0x10]
1400ef23f: 4829d8 sub rax, rbx
1400ef242: 4939c2 cmp r10, rax
1400ef245: 0f879b000000 ja 0x1400ef2e6
1400ef24b: 4d85d2 test r10, r10
1400ef24e: 742d je 0x1400ef27d
1400ef250: 488d0cdb lea rcx, [rbx + rbx*8]
1400ef254: 48c1e102 shl rcx, 2
1400ef258: 48034a08 add rcx, qword ptr [rdx + 8]
1400ef25c: 4a8d049500000000 lea rax, [r10*4]
1400ef264: 4c8d04c0 lea r8, [rax + rax*8]
1400ef268: 4889f2 mov rdx, rsi
1400ef26b: 4c89d6 mov rsi, r10
1400ef26e: e8c836b005 call 0x145bf293b
1400ef273: 4989f2 mov r10, rsi
1400ef276: 488b9540030000 mov rdx, qword ptr [rbp + 0x340]
1400ef27d: 4c01d3 add rbx, r10
1400ef280: 48895a10 mov qword ptr [rdx + 0x10], rbx
1400ef284: 0f28b580030000 movaps xmm6, xmmword ptr [rbp + 0x380]
1400ef28b: 0f28bd90030000 movaps xmm7, xmmword ptr [rbp + 0x390]
1400ef292: 440f2885a0030000 movaps xmm8, xmmword ptr [rbp + 0x3a0]
1400ef29a: 440f288db0030000 movaps xmm9, xmmword ptr [rbp + 0x3b0]
1400ef2a2: 440f2895c0030000 movaps xmm10, xmmword ptr [rbp + 0x3c0]
1400ef2aa: 440f289dd0030000 movaps xmm11, xmmword ptr [rbp + 0x3d0]
1400ef2b2: 440f28a5e0030000 movaps xmm12, xmmword ptr [rbp + 0x3e0]
1400ef2ba: 440f28adf0030000 movaps xmm13, xmmword ptr [rbp + 0x3f0]
1400ef2c2: 440f28b500040000 movaps xmm14, xmmword ptr [rbp + 0x400]
1400ef2ca: 440f28bd10040000 movaps xmm15, xmmword ptr [rbp + 0x410]
1400ef2d2: 4881c4a8040000 add rsp, 0x4a8
1400ef2d9: 5b pop rbx
1400ef2da: 5f pop rdi
1400ef2db: 5e pop rsi
1400ef2dc: 415c pop r12
1400ef2de: 415d pop r13
1400ef2e0: 415e pop r14
1400ef2e2: 415f pop r15
1400ef2e4: 5d pop rbp
1400ef2e5: c3 ret
1400ef2e6: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1400ef2ef: 41b904000000 mov r9d, 4
1400ef2f5: 4889d1 mov rcx, rdx
1400ef2f8: 4889da mov rdx, rbx
1400ef2fb: 4d89d0 mov r8, r10
1400ef2fe: 4c89d7 mov rdi, r10
1400ef301: e88a57b005 call 0x145bf4a90
1400ef306: 4989fa mov r10, rdi
1400ef309: 488b9540030000 mov rdx, qword ptr [rbp + 0x340]
1400ef310: 488b5a10 mov rbx, qword ptr [rdx + 0x10]
1400ef314: e937ffffff jmp 0x1400ef250
1400ef319: 4c8d05181fce05 lea r8, [rip + 0x5ce1f18]
1400ef320: ba09000000 mov edx, 9
1400ef325: 4889f1 mov rcx, rsi
1400ef328: e86645ca05 call 0x145d93893
1400ef32d: 90 nop
1400ef32e: eb40 jmp 0x1400ef370
1400ef330: 4c8d057922ce05 lea r8, [rip + 0x5ce2279]
1400ef337: e85745ca05 call 0x145d93893
1400ef33c: 90 nop
1400ef33d: eb31 jmp 0x1400ef370
1400ef33f: 4c8d059a22ce05 lea r8, [rip + 0x5ce229a]
1400ef346: 4889c1 mov rcx, rax
1400ef349: e84545ca05 call 0x145d93893
1400ef34e: 90 nop
1400ef34f: eb1f jmp 0x1400ef370
1400ef351: 4c8d057022ce05 lea r8, [rip + 0x5ce2270]
1400ef358: e83645ca05 call 0x145d93893
1400ef35d: 90 nop
1400ef35e: eb10 jmp 0x1400ef370
1400ef360: 4c8d059122ce05 lea r8, [rip + 0x5ce2291]
1400ef367: 4c89c9 mov rcx, r9
1400ef36a: e82445ca05 call 0x145d93893
1400ef36f: 90 nop
1400ef370: 0f0b ud2

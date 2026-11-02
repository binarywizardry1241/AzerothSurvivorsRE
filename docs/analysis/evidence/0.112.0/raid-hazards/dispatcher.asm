14591f790: 55 push rbp
14591f791: 4157 push r15
14591f793: 4156 push r14
14591f795: 4155 push r13
14591f797: 4154 push r12
14591f799: 56 push rsi
14591f79a: 57 push rdi
14591f79b: 53 push rbx
14591f79c: 4881ecb8020000 sub rsp, 0x2b8
14591f7a3: 488dac2480000000 lea rbp, [rsp + 0x80]
14591f7ab: 440f29bd20020000 movaps xmmword ptr [rbp + 0x220], xmm15
14591f7b3: 440f29b510020000 movaps xmmword ptr [rbp + 0x210], xmm14
14591f7bb: 440f29ad00020000 movaps xmmword ptr [rbp + 0x200], xmm13
14591f7c3: 440f29a5f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm12
14591f7cb: 440f299de0010000 movaps xmmword ptr [rbp + 0x1e0], xmm11
14591f7d3: 440f2995d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm10
14591f7db: 440f298dc0010000 movaps xmmword ptr [rbp + 0x1c0], xmm9
14591f7e3: 440f2985b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm8
14591f7eb: 0f29bda0010000 movaps xmmword ptr [rbp + 0x1a0], xmm7
14591f7f2: 0f29b590010000 movaps xmmword ptr [rbp + 0x190], xmm6
14591f7f9: 48c78588010000feffffff mov qword ptr [rbp + 0x188], 0xfffffffffffffffe
14591f804: 483b9170050000 cmp rdx, qword ptr [rcx + 0x570]
14591f80b: 731b jae 0x14591f828
14591f80d: 4889ce mov rsi, rcx
14591f810: 488b8168050000 mov rax, qword ptr [rcx + 0x568]
14591f817: 4869dad8010000 imul rbx, rdx, 0x1d8
14591f81e: 80bc18b000000000 cmp byte ptr [rax + rbx + 0xb0], 0
14591f826: 7462 je 0x14591f88a
14591f828: 0f28b590010000 movaps xmm6, xmmword ptr [rbp + 0x190]
14591f82f: 0f28bda0010000 movaps xmm7, xmmword ptr [rbp + 0x1a0]
14591f836: 440f2885b0010000 movaps xmm8, xmmword ptr [rbp + 0x1b0]
14591f83e: 440f288dc0010000 movaps xmm9, xmmword ptr [rbp + 0x1c0]
14591f846: 440f2895d0010000 movaps xmm10, xmmword ptr [rbp + 0x1d0]
14591f84e: 440f289de0010000 movaps xmm11, xmmword ptr [rbp + 0x1e0]
14591f856: 440f28a5f0010000 movaps xmm12, xmmword ptr [rbp + 0x1f0]
14591f85e: 440f28ad00020000 movaps xmm13, xmmword ptr [rbp + 0x200]
14591f866: 440f28b510020000 movaps xmm14, xmmword ptr [rbp + 0x210]
14591f86e: 440f28bd20020000 movaps xmm15, xmmword ptr [rbp + 0x220]
14591f876: 4881c4b8020000 add rsp, 0x2b8
14591f87d: 5b pop rbx
14591f87e: 5f pop rdi
14591f87f: 5e pop rsi
14591f880: 415c pop r12
14591f882: 415d pop r13
14591f884: 415e pop r14
14591f886: 415f pop r15
14591f888: 5d pop rbp
14591f889: c3 ret
14591f88a: f3440f10be4c0a0000 movss xmm15, dword ptr [rsi + 0xa4c]
14591f893: 4801d8 add rax, rbx
14591f896: f30f108890010000 movss xmm1, dword ptr [rax + 0x190]
14591f89e: 0f57c0 xorps xmm0, xmm0
14591f8a1: 0f2ec1 ucomiss xmm0, xmm1
14591f8a4: 0f8381000000 jae 0x14591f92b
14591f8aa: 410f28d7 movaps xmm2, xmm15
14591f8ae: f30f5c908c010000 subss xmm2, dword ptr [rax + 0x18c]
14591f8b6: f30f5ed1 divss xmm2, xmm1
14591f8ba: f30f5fc2 maxss xmm0, xmm2
14591f8be: f30f100d9ad94800 movss xmm1, dword ptr [rip + 0x48d99a]
14591f8c6: f30f5dc8 minss xmm1, xmm0
14591f8ca: f30f10807c010000 movss xmm0, dword ptr [rax + 0x17c]
14591f8d2: f30f109088010000 movss xmm2, dword ptr [rax + 0x188]
14591f8da: f30f5cd0 subss xmm2, xmm0
14591f8de: f30f59d1 mulss xmm2, xmm1
14591f8e2: f30f58d0 addss xmm2, xmm0
14591f8e6: f20f108074010000 movsd xmm0, qword ptr [rax + 0x174]
14591f8ee: f20f109880010000 movsd xmm3, qword ptr [rax + 0x180]
14591f8f6: 0f5cd8 subps xmm3, xmm0
14591f8f9: f30f12c9 movsldup xmm1, xmm1
14591f8fd: 0f59cb mulps xmm1, xmm3
14591f900: 0f58c8 addps xmm1, xmm0
14591f903: 0f138da8000000 movlps qword ptr [rbp + 0xa8], xmm1
14591f90a: f30f1195b0000000 movss dword ptr [rbp + 0xb0], xmm2
14591f912: f30f10800c010000 movss xmm0, dword ptr [rax + 0x10c]
14591f91a: f3440f10b060010000 movss xmm14, dword ptr [rax + 0x160]
14591f923: 410f2ec7 ucomiss xmm0, xmm15
14591f927: 7733 ja 0x14591f95c
14591f929: eb46 jmp 0x14591f971
14591f92b: 8b8888010000 mov ecx, dword ptr [rax + 0x188]
14591f931: 898db0000000 mov dword ptr [rbp + 0xb0], ecx
14591f937: 488b8880010000 mov rcx, qword ptr [rax + 0x180]
14591f93e: 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
14591f945: f30f10800c010000 movss xmm0, dword ptr [rax + 0x10c]
14591f94d: f3440f10b060010000 movss xmm14, dword ptr [rax + 0x160]
14591f956: 410f2ec7 ucomiss xmm0, xmm15
14591f95a: 7615 jbe 0x14591f971
14591f95c: f30f1005fcd84800 movss xmm0, dword ptr [rip + 0x48d8fc]
14591f964: f30f5c8008010000 subss xmm0, dword ptr [rax + 0x108]
14591f96c: f3440f59f0 mulss xmm14, xmm0
14591f971: 48837818ff cmp qword ptr [rax + 0x18], -1
14591f976: 4d89c6 mov r14, r8
14591f979: 488995f0000000 mov qword ptr [rbp + 0xf0], rdx
14591f980: 740f je 0x14591f991
14591f982: 80785000 cmp byte ptr [rax + 0x50], 0
14591f986: 7409 je 0x14591f991
14591f988: f3440f5935031a4900 mulss xmm14, dword ptr [rip + 0x491a03]
14591f991: 488b80f0000000 mov rax, qword ptr [rax + 0xf0]
14591f998: 48898580010000 mov qword ptr [rbp + 0x180], rax
14591f99f: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
14591f9a6: 4883c110 add rcx, 0x10
14591f9aa: f20f108ed0040000 movsd xmm1, qword ptr [rsi + 0x4d0]
14591f9b2: f30f16d1 movshdup xmm2, xmm1
14591f9b6: f30f10b6d8040000 movss xmm6, dword ptr [rsi + 0x4d8]
14591f9be: 0f298dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm1
14591f9c5: 0f2995e0000000 movaps xmmword ptr [rbp + 0xe0], xmm2
14591f9cc: e86f11f8ff call 0x1458a0b40
14591f9d1: 440f28d8 movaps xmm11, xmm0
14591f9d5: a801 test al, 1
14591f9d7: 7504 jne 0x14591f9dd
14591f9d9: 440f28de movaps xmm11, xmm6
14591f9dd: 440f28add0000000 movaps xmm13, xmmword ptr [rbp + 0xd0]
14591f9e5: f2440f116df0 movsd qword ptr [rbp - 0x10], xmm13
14591f9eb: f3440f115df8 movss dword ptr [rbp - 8], xmm11
14591f9f1: f20f1085a8000000 movsd xmm0, qword ptr [rbp + 0xa8]
14591f9f9: f3440f16d0 movshdup xmm10, xmm0
14591f9fe: 440f28a5e0000000 movaps xmm12, xmmword ptr [rbp + 0xe0]
14591fa06: f3450f5ce2 subss xmm12, xmm10
14591fa0b: 0f298550010000 movaps xmmword ptr [rbp + 0x150], xmm0
14591fa12: f3440f5ce8 subss xmm13, xmm0
14591fa17: 410f28c4 movaps xmm0, xmm12
14591fa1b: 410f28cd movaps xmm1, xmm13
14591fa1f: e823aa2e00 call 0x145c0a447
14591fa24: f30f118578010000 movss dword ptr [rbp + 0x178], xmm0
14591fa2c: 4c89f1 mov rcx, r14
14591fa2f: 410fb67e2d movzx edi, byte ptr [r14 + 0x2d]
14591fa34: 89f8 mov eax, edi
14591fa36: 2c03 sub al, 3
14591fa38: 0fb6c0 movzx eax, al
14591fa3b: ba1d000000 mov edx, 0x1d
14591fa40: 0f43d0 cmovae edx, eax
14591fa43: 440fb6fa movzx r15d, dl
14591fa47: 4180ff1f cmp r15b, 0x1f
14591fa4b: 0f879d000000 ja 0x14591faee
14591fa51: b8060018a0 mov eax, 0xa0180006
14591fa56: 440fa3f8 bt eax, r15d
14591fa5a: 0f838e000000 jae 0x14591faee
14591fa60: 488d0561c82e01 lea rax, [rip + 0x12ec861]
14591fa67: 4a6314b8 movsxd rdx, dword ptr [rax + r15*4]
14591fa6b: 4801c2 add rdx, rax
14591fa6e: ffe2 jmp rdx
14591fa70: 8b4104 mov eax, dword ptr [rcx + 4]
14591fa73: f30f104108 movss xmm0, dword ptr [rcx + 8]
14591fa78: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
14591fa7e: f30f10490c movss xmm1, dword ptr [rcx + 0xc]
14591fa83: f30f118564010000 movss dword ptr [rbp + 0x164], xmm0
14591fa8b: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14591fa95: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14591fa9f: 488d8d10010000 lea rcx, [rbp + 0x110]
14591faa6: 48894c2448 mov qword ptr [rsp + 0x48], rcx
14591faab: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14591fab2: 89442438 mov dword ptr [rsp + 0x38], eax
14591fab6: f30f114c2430 movss dword ptr [rsp + 0x30], xmm1
14591fabc: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
14591fac3: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14591fac9: c744242800000000 mov dword ptr [rsp + 0x28], 0
14591fad1: 4c8d8560010000 lea r8, [rbp + 0x160]
14591fad8: 4889f1 mov rcx, rsi
14591fadb: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14591fae2: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
14591fae9: e93f290000 jmp 0x14592242d
14591faee: e85d6ef7ff call 0x145896950
14591faf3: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
14591fafa: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14591fb01: 4839d1 cmp rcx, rdx
14591fb04: 0f83414f0000 jae 0x145924a4b
14591fb0a: f3410f58c7 addss xmm0, xmm15
14591fb0f: f30f5805e9af4900 addss xmm0, dword ptr [rip + 0x49afe9]
14591fb17: 488b8e68050000 mov rcx, qword ptr [rsi + 0x568]
14591fb1e: 488d0419 lea rax, [rcx + rbx]
14591fb22: 48837c1918ff cmp qword ptr [rcx + rbx + 0x18], -1
14591fb28: 7425 je 0x14591fb4f
14591fb2a: f30f104848 movss xmm1, dword ptr [rax + 0x48]
14591fb2f: 0f28d1 movaps xmm2, xmm1
14591fb32: f30f5fd0 maxss xmm2, xmm0
14591fb36: 0f28da movaps xmm3, xmm2
14591fb39: f30fc2da03 cmpunordss xmm3, xmm2
14591fb3e: 0f28e3 movaps xmm4, xmm3
14591fb41: 0f55e2 andnps xmm4, xmm2
14591fb44: 0f54d9 andps xmm3, xmm1
14591fb47: 0f56dc orps xmm3, xmm4
14591fb4a: f30f115848 movss dword ptr [rax + 0x48], xmm3
14591fb4f: 48837858ff cmp qword ptr [rax + 0x58], -1
14591fb54: 4c89f1 mov rcx, r14
14591fb57: 0f8403ffffff je 0x14591fa60
14591fb5d: f30f1088a0000000 movss xmm1, dword ptr [rax + 0xa0]
14591fb65: 0f28d1 movaps xmm2, xmm1
14591fb68: f30f5fd0 maxss xmm2, xmm0
14591fb6c: 0f28c2 movaps xmm0, xmm2
14591fb6f: f30fc2c203 cmpunordss xmm0, xmm2
14591fb74: 0f28d8 movaps xmm3, xmm0
14591fb77: 0f55da andnps xmm3, xmm2
14591fb7a: 0f54c1 andps xmm0, xmm1
14591fb7d: 0f56c3 orps xmm0, xmm3
14591fb80: f30f1180a0000000 movss dword ptr [rax + 0xa0], xmm0
14591fb88: 488d0539c72e01 lea rax, [rip + 0x12ec739]
14591fb8f: 4a6314b8 movsxd rdx, dword ptr [rax + r15*4]
14591fb93: 4801c2 add rdx, rax
14591fb96: ffe2 jmp rdx
14591fb98: 8b19 mov ebx, dword ptr [rcx]
14591fb9a: 448b6904 mov r13d, dword ptr [rcx + 4]
14591fb9e: f30f10051a194900 movss xmm0, dword ptr [rip + 0x49191a]
14591fba6: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
14591fbae: 81fbfb130000 cmp ebx, 0x13fb
14591fbb4: 0f8ef9410000 jle 0x145923db3
14591fbba: 81fb641c0000 cmp ebx, 0x1c64
14591fbc0: 0f8f6c460000 jg 0x145924232
14591fbc6: 81fb841a0000 cmp ebx, 0x1a84
14591fbcc: 0f8fb6460000 jg 0x145924288
14591fbd2: 81fbfc130000 cmp ebx, 0x13fc
14591fbd8: 0f8438470000 je 0x145924316
14591fbde: 81fb38140000 cmp ebx, 0x1438
14591fbe4: 0f840e470000 je 0x1459242f8
14591fbea: 81fbd1180000 cmp ebx, 0x18d1
14591fbf0: 0f84b8460000 je 0x1459242ae
14591fbf6: e92b470000 jmp 0x145924326
14591fbfb: 448b31 mov r14d, dword ptr [rcx]
14591fbfe: f3440f104104 movss xmm8, dword ptr [rcx + 4]
14591fc04: f30f107908 movss xmm7, dword ptr [rcx + 8]
14591fc09: f30f107110 movss xmm6, dword ptr [rcx + 0x10]
14591fc0e: f3440f10490c movss xmm9, dword ptr [rcx + 0xc]
14591fc14: f3450f59ce mulss xmm9, xmm14
14591fc19: 4889f1 mov rcx, rsi
14591fc1c: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14591fc23: 4889fa mov rdx, rdi
14591fc26: 4589f0 mov r8d, r14d
14591fc29: 0f28df movaps xmm3, xmm7
14591fc2c: e86ffaffff call 0x14591f6a0
14591fc31: f3440f118564010000 movss dword ptr [rbp + 0x164], xmm8
14591fc3a: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14591fc44: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14591fc4e: 488d8510010000 lea rax, [rbp + 0x110]
14591fc55: 4889442448 mov qword ptr [rsp + 0x48], rax
14591fc5a: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
14591fc61: 4489742438 mov dword ptr [rsp + 0x38], r14d
14591fc66: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
14591fc6c: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
14591fc73: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14591fc79: c744242800000000 mov dword ptr [rsp + 0x28], 0
14591fc81: 4c8da560010000 lea r12, [rbp + 0x160]
14591fc88: 4889f1 mov rcx, rsi
14591fc8b: 4889fa mov rdx, rdi
14591fc8e: 4d89e0 mov r8, r12
14591fc91: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
14591fc98: e8f3f7ffff call 0x14591f490
14591fc9d: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
14591fca4: 4839d0 cmp rax, rdx
14591fca7: 0f83ac4d0000 jae 0x145924a59
14591fcad: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14591fcb4: f30f583d54902e01 addss xmm7, dword ptr [rip + 0x12e9054]
14591fcbc: 0f57c0 xorps xmm0, xmm0
14591fcbf: f30f5ff8 maxss xmm7, xmm0
14591fcc3: 4889c1 mov rcx, rax
14591fcc6: 48c1e107 shl rcx, 7
14591fcca: f3440f58ff addss xmm15, xmm7
14591fccf: f3440f117c0a58 movss dword ptr [rdx + rcx + 0x58], xmm15
14591fcd6: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
14591fcdd: 4839d0 cmp rax, rdx
14591fce0: 0f83934e0000 jae 0x145924b79
14591fce6: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
14591fced: f3440f59f6 mulss xmm14, xmm6
14591fcf2: f3440f11740874 movss dword ptr [rax + rcx + 0x74], xmm14
14591fcf9: 4c8dbe20060000 lea r15, [rsi + 0x620]
14591fd00: 488b8668040000 mov rax, qword ptr [rsi + 0x468]
14591fd07: 48898588000000 mov qword ptr [rbp + 0x88], rax
14591fd0e: 48898568010000 mov qword ptr [rbp + 0x168], rax
14591fd15: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14591fd1f: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
14591fd29: 488d85c0000000 lea rax, [rbp + 0xc0]
14591fd30: 4889442430 mov qword ptr [rsp + 0x30], rax
14591fd35: 4c89642428 mov qword ptr [rsp + 0x28], r12
14591fd3a: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14591fd43: 4c8da510010000 lea r12, [rbp + 0x110]
14591fd4a: 4c8d8d88000000 lea r9, [rbp + 0x88]
14591fd51: 4c89e1 mov rcx, r12
14591fd54: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14591fd5b: 4589f0 mov r8d, r14d
14591fd5e: e86deafaff call 0x1458ce7d0
14591fd63: 4c89f9 mov rcx, r15
14591fd66: 4c89e2 mov rdx, r12
14591fd69: e8c2123afb call 0x140cc1030
14591fd6e: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
14591fd75: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14591fd7c: 4839d1 cmp rcx, rdx
14591fd7f: 0f83514e0000 jae 0x145924bd6
14591fd85: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
14591fd8c: 4889d9 mov rcx, rbx
14591fd8f: e88ccf0700 call 0x14599cd20
14591fd94: 4889c6 mov rsi, rax
14591fd97: 4889d7 mov rdi, rdx
14591fd9a: 488d1d9fa52e01 lea rbx, [rip + 0x12ea59f]
14591fda1: 41be2a000000 mov r14d, 0x2a
14591fda7: ba2a000000 mov edx, 0x2a
14591fdac: 4889d9 mov rcx, rbx
14591fdaf: e81ce00600 call 0x14598ddd0
14591fdb4: 4885c0 test rax, rax
14591fdb7: 480f45d8 cmovne rbx, rax
14591fdbb: 490f44d6 cmove rdx, r14
14591fdbf: 4889542420 mov qword ptr [rsp + 0x20], rdx
14591fdc4: 4c8db510010000 lea r14, [rbp + 0x110]
14591fdcb: 4c89f1 mov rcx, r14
14591fdce: 4889f2 mov rdx, rsi
14591fdd1: 4989f8 mov r8, rdi
14591fdd4: 4989d9 mov r9, rbx
14591fdd7: e8e424faff call 0x1458c22c0
14591fddc: 4c89f9 mov rcx, r15
14591fddf: e941440000 jmp 0x145924225
14591fde4: 8b19 mov ebx, dword ptr [rcx]
14591fde6: f3440f104104 movss xmm8, dword ptr [rcx + 4]
14591fdec: f30f10790c movss xmm7, dword ptr [rcx + 0xc]
14591fdf1: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
14591fdf7: f30f103561ad4900 movss xmm6, dword ptr [rip + 0x49ad61]
14591fdff: 4889f1 mov rcx, rsi
14591fe02: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14591fe09: 0f28d6 movaps xmm2, xmm6
14591fe0c: 4531c9 xor r9d, r9d
14591fe0f: e8bcf3ffff call 0x14591f1d0
14591fe14: 4889f1 mov rcx, rsi
14591fe17: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14591fe1e: 4889fa mov rdx, rdi
14591fe21: 4189d8 mov r8d, ebx
14591fe24: 0f28de movaps xmm3, xmm6
14591fe27: e874f8ffff call 0x14591f6a0
14591fe2c: f3440f118564010000 movss dword ptr [rbp + 0x164], xmm8
14591fe35: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14591fe3f: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14591fe49: 488d8510010000 lea rax, [rbp + 0x110]
14591fe50: 4889442448 mov qword ptr [rsp + 0x48], rax
14591fe55: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14591fe5c: 895c2438 mov dword ptr [rsp + 0x38], ebx
14591fe60: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
14591fe67: c74424306666a63f mov dword ptr [rsp + 0x30], 0x3fa66666
14591fe6f: c744242800000000 mov dword ptr [rsp + 0x28], 0
14591fe77: 4c8d8560010000 lea r8, [rbp + 0x160]
14591fe7e: 4889f1 mov rcx, rsi
14591fe81: 4889fa mov rdx, rdi
14591fe84: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
14591fe8b: e800f6ffff call 0x14591f490
14591fe90: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
14591fe97: 4839d0 cmp rax, rdx
14591fe9a: 0f83ca4b0000 jae 0x145924a6a
14591fea0: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14591fea7: 4889c1 mov rcx, rax
14591feaa: 48c1e107 shl rcx, 7
14591feae: c6440a7c01 mov byte ptr [rdx + rcx + 0x7c], 1
14591feb3: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
14591feba: 4839d0 cmp rax, rdx
14591febd: 0f83c74c0000 jae 0x145924b8a
14591fec3: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
14591feca: f30f117c086c movss dword ptr [rax + rcx + 0x6c], xmm7
14591fed0: e953f9ffff jmp 0x14591f828
14591fed5: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
14591fede: 8b19 mov ebx, dword ptr [rcx]
14591fee0: 8b7904 mov edi, dword ptr [rcx + 4]
14591fee3: 448b6908 mov r13d, dword ptr [rcx + 8]
14591fee7: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14591feec: f30f118550010000 movss dword ptr [rbp + 0x150], xmm0
14591fef4: f30f105910 movss xmm3, dword ptr [rcx + 0x10]
14591fef9: f30f104114 movss xmm0, dword ptr [rcx + 0x14]
14591fefe: f30f1185b8000000 movss dword ptr [rbp + 0xb8], xmm0
14591ff06: f30f107118 movss xmm6, dword ptr [rcx + 0x18]
14591ff0b: 4889f1 mov rcx, rsi
14591ff0e: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14591ff15: 4189d8 mov r8d, ebx
14591ff18: f30f119df0000000 movss dword ptr [rbp + 0xf0], xmm3
14591ff20: e87bf7ffff call 0x14591f6a0
14591ff25: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
14591ff2c: f30f10156c184900 movss xmm2, dword ptr [rip + 0x49186c]
14591ff34: 0f57c9 xorps xmm1, xmm1
14591ff37: e8542e0a00 call 0x1459c2d90
14591ff3c: 440f28c8 movaps xmm9, xmm0
14591ff40: e8d2a42e00 call 0x145c0a417
14591ff45: 440f28c0 movaps xmm8, xmm0
14591ff49: 410f28c1 movaps xmm0, xmm9
14591ff4d: e8bfa42e00 call 0x145c0a411
14591ff52: 89bdcc000000 mov dword ptr [rbp + 0xcc], edi
14591ff58: 85ff test edi, edi
14591ff5a: 0f84c8f8ffff je 0x14591f828
14591ff60: 4585ed test r13d, r13d
14591ff63: 0f84bff8ffff je 0x14591f828
14591ff69: 0f28f8 movaps xmm7, xmm0
14591ff6c: f30f100d1cb14900 movss xmm1, dword ptr [rip + 0x49b11c]
14591ff74: f30f108550010000 movss xmm0, dword ptr [rbp + 0x150]
14591ff7c: f30f59c8 mulss xmm1, xmm0
14591ff80: f30f101570884900 movss xmm2, dword ptr [rip + 0x498870]
14591ff88: 8b85cc000000 mov eax, dword ptr [rbp + 0xcc]
14591ff8e: 0f57db xorps xmm3, xmm3
14591ff91: f3480f2ad8 cvtsi2ss xmm3, rax
14591ff96: f30f59d0 mulss xmm2, xmm0
14591ff9a: f30f115550 movss dword ptr [rbp + 0x50], xmm2
14591ff9f: f30f581dc1134900 addss xmm3, dword ptr [rip + 0x4913c1]
14591ffa7: f30f1005b5d24800 movss xmm0, dword ptr [rip + 0x48d2b5]
14591ffaf: 4489e8 mov eax, r13d
14591ffb2: 0f57d2 xorps xmm2, xmm2
14591ffb5: f3480f2ad0 cvtsi2ss xmm2, rax
14591ffba: f30f59d8 mulss xmm3, xmm0
14591ffbe: f30f115d60 movss dword ptr [rbp + 0x60], xmm3
14591ffc3: f30f59d0 mulss xmm2, xmm0
14591ffc7: f30f59d1 mulss xmm2, xmm1
14591ffcb: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14591ffd3: f30f59c6 mulss xmm0, xmm6
14591ffd7: f30f118578010000 movss dword ptr [rbp + 0x178], xmm0
14591ffdf: f30f118d0c010000 movss dword ptr [rbp + 0x10c], xmm1
14591ffe7: 0f57c0 xorps xmm0, xmm0
14591ffea: f30f59c8 mulss xmm1, xmm0
14591ffee: 440f28d2 movaps xmm10, xmm2
14591fff2: f30f5cca subss xmm1, xmm2
14591fff6: 0f281553d54800 movaps xmm2, xmmword ptr [rip + 0x48d553]
14591fffd: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
145920004: 0f57d1 xorps xmm2, xmm1
145920007: 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
14592000b: f30f5985b8000000 mulss xmm0, dword ptr [rbp + 0xb8]
145920013: f30f5885f0000000 addss xmm0, dword ptr [rbp + 0xf0]
14592001b: f30f114540 movss dword ptr [rbp + 0x40], xmm0
145920020: 4531ff xor r15d, r15d
145920023: eb10 jmp 0x145920035
145920025: 41ffc7 inc r15d
145920028: 443bbdcc000000 cmp r15d, dword ptr [rbp + 0xcc]
14592002f: 0f84f3f7ffff je 0x14591f828
145920035: 440f289d90000000 movaps xmm11, xmmword ptr [rbp + 0x90]
14592003d: 41f6c701 test r15b, 1
145920041: 7405 je 0x145920048
145920043: 440f285dd0 movaps xmm11, xmmword ptr [rbp - 0x30]
145920048: 4489f8 mov eax, r15d
14592004b: 0f57f6 xorps xmm6, xmm6
14592004e: f3480f2af0 cvtsi2ss xmm6, rax
145920053: f30f5c7560 subss xmm6, dword ptr [rbp + 0x60]
145920058: f30f597550 mulss xmm6, dword ptr [rbp + 0x50]
14592005d: 440f28cf movaps xmm9, xmm7
145920061: f3440f59ce mulss xmm9, xmm6
145920066: f3410f59f0 mulss xmm6, xmm8
14592006b: 450f28e0 movaps xmm12, xmm8
14592006f: f3450f59e3 mulss xmm12, xmm11
145920074: f3440f58a5d0000000 addss xmm12, dword ptr [rbp + 0xd0]
14592007d: f3450f5ce1 subss xmm12, xmm9
145920082: f3440f59df mulss xmm11, xmm7
145920087: f3440f589de0000000 addss xmm11, dword ptr [rbp + 0xe0]
145920090: f3440f58de addss xmm11, xmm6
145920095: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
14592009b: ffc7 inc edi
14592009d: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
1459200a3: f3440f10b64c0a0000 movss xmm14, dword ptr [rsi + 0xa4c]
1459200ac: 4c8bb6b0090000 mov r14, qword ptr [rsi + 0x9b0]
1459200b3: 498d4e10 lea rcx, [r14 + 0x10]
1459200b7: 410f28cc movaps xmm1, xmm12
1459200bb: 410f28d3 movaps xmm2, xmm11
1459200bf: e87c0af8ff call 0x1458a0b40
1459200c4: a801 test al, 1
1459200c6: 7406 je 0x1459200ce
1459200c8: 440f28e8 movaps xmm13, xmm0
1459200cc: eb3c jmp 0x14592010a
1459200ce: 49837e68ff cmp qword ptr [r14 + 0x68], -1
1459200d3: 742c je 0x145920101
1459200d5: 498d5668 lea rdx, [r14 + 0x68]
1459200d9: 488d8d10010000 lea rcx, [rbp + 0x110]
1459200e0: 410f28d4 movaps xmm2, xmm12
1459200e4: 410f28db movaps xmm3, xmm11
1459200e8: e8734cf8ff call 0x1458a4d60
1459200ed: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
1459200f4: 750b jne 0x145920101
1459200f6: f3440f10ad1c010000 movss xmm13, dword ptr [rbp + 0x11c]
1459200ff: eb09 jmp 0x14592010a
145920101: f3450f10aeb8000000 movss xmm13, dword ptr [r14 + 0xb8]
14592010a: 4c8bb6a0050000 mov r14, qword ptr [rsi + 0x5a0]
145920111: 4c3bb690050000 cmp r14, qword ptr [rsi + 0x590]
145920118: 750c jne 0x145920126
14592011a: 488d8e90050000 lea rcx, [rsi + 0x590]
145920121: e8cad92e00 call 0x145c0daf0
145920126: 4c89f0 mov rax, r14
145920129: 48c1e007 shl rax, 7
14592012d: 49ffc6 inc r14
145920130: f30f104540 movss xmm0, dword ptr [rbp + 0x40]
145920135: f3410f58c6 addss xmm0, xmm14
14592013a: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145920141: 48c7040100000000 mov qword ptr [rcx + rax], 0
145920149: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
145920151: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145920158: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
14592015d: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
145920166: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
14592016e: f30f108d50010000 movss xmm1, dword ptr [rbp + 0x150]
145920176: f30f114c0134 movss dword ptr [rcx + rax + 0x34], xmm1
14592017c: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
145920180: f3440f11640140 movss dword ptr [rcx + rax + 0x40], xmm12
145920187: f3440f115c0144 movss dword ptr [rcx + rax + 0x44], xmm11
14592018e: f3440f116c0148 movss dword ptr [rcx + rax + 0x48], xmm13
145920195: 0f57c9 xorps xmm1, xmm1
145920198: f3410f10ce movss xmm1, xmm14
14592019d: 0f57d2 xorps xmm2, xmm2
1459201a0: f30f10d0 movss xmm2, xmm0
1459201a4: 0fc6ca41 shufps xmm1, xmm2, 0x41
1459201a8: 0f114c014c movups xmmword ptr [rcx + rax + 0x4c], xmm1
1459201ad: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
1459201b1: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
1459201b9: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
1459201bf: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
1459201c7: 0f57c0 xorps xmm0, xmm0
1459201ca: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
1459201cf: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
1459201d8: 4c89b6a0050000 mov qword ptr [rsi + 0x5a0], r14
1459201df: 4183fd01 cmp r13d, 1
1459201e3: 0f843cfeffff je 0x145920025
1459201e9: bf01000000 mov edi, 1
1459201ee: 6690 nop
1459201f0: 89f8 mov eax, edi
1459201f2: 450f57ff xorps xmm15, xmm15
1459201f6: f34c0f2af8 cvtsi2ss xmm15, rax
1459201fb: f3440f109d0c010000 movss xmm11, dword ptr [rbp + 0x10c]
145920204: f3450f59df mulss xmm11, xmm15
145920209: f3450f5cda subss xmm11, xmm10
14592020e: 41f6c701 test r15b, 1
145920212: 7408 je 0x14592021c
145920214: 440f571d34d34800 xorps xmm11, xmmword ptr [rip + 0x48d334]
14592021c: 450f28e0 movaps xmm12, xmm8
145920220: f3450f59e3 mulss xmm12, xmm11
145920225: f3440f58a5d0000000 addss xmm12, dword ptr [rbp + 0xd0]
14592022e: f3450f5ce1 subss xmm12, xmm9
145920233: f3440f59df mulss xmm11, xmm7
145920238: f3440f589de0000000 addss xmm11, dword ptr [rbp + 0xe0]
145920241: f3440f58de addss xmm11, xmm6
145920246: 448bb6500a0000 mov r14d, dword ptr [rsi + 0xa50]
14592024d: 41ffc6 inc r14d
145920250: 4489b6500a0000 mov dword ptr [rsi + 0xa50], r14d
145920257: f3440f10b64c0a0000 movss xmm14, dword ptr [rsi + 0xa4c]
145920260: 4c8ba6b0090000 mov r12, qword ptr [rsi + 0x9b0]
145920267: 498d4c2410 lea rcx, [r12 + 0x10]
14592026c: 410f28cc movaps xmm1, xmm12
145920270: 410f28d3 movaps xmm2, xmm11
145920274: e8c708f8ff call 0x1458a0b40
145920279: a801 test al, 1
14592027b: 0f840f010000 je 0x145920390
145920281: 440f28e8 movaps xmm13, xmm0
145920285: 4c8ba6a0050000 mov r12, qword ptr [rsi + 0x5a0]
14592028c: 4c3ba690050000 cmp r12, qword ptr [rsi + 0x590]
145920293: 750c jne 0x1459202a1
145920295: 488d8e90050000 lea rcx, [rsi + 0x590]
14592029c: e84fd82e00 call 0x145c0daf0
1459202a1: f3440f59bdb8000000 mulss xmm15, dword ptr [rbp + 0xb8]
1459202aa: f3440f58bdf0000000 addss xmm15, dword ptr [rbp + 0xf0]
1459202b3: f3450f58fe addss xmm15, xmm14
1459202b8: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
1459202bf: 4c89e0 mov rax, r12
1459202c2: 48c1e007 shl rax, 7
1459202c6: 48c7040100000000 mov qword ptr [rcx + rax], 0
1459202ce: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
1459202d6: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459202dd: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
1459202e2: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
1459202eb: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
1459202f3: f30f108550010000 movss xmm0, dword ptr [rbp + 0x150]
1459202fb: f30f11440134 movss dword ptr [rcx + rax + 0x34], xmm0
145920301: 448974013c mov dword ptr [rcx + rax + 0x3c], r14d
145920306: f3440f11640140 movss dword ptr [rcx + rax + 0x40], xmm12
14592030d: f3440f115c0144 movss dword ptr [rcx + rax + 0x44], xmm11
145920314: f3440f116c0148 movss dword ptr [rcx + rax + 0x48], xmm13
14592031b: 0f57c0 xorps xmm0, xmm0
14592031e: f3410f10c6 movss xmm0, xmm14
145920323: 0f57c9 xorps xmm1, xmm1
145920326: f3410f10cf movss xmm1, xmm15
14592032b: 0fc6c141 shufps xmm0, xmm1, 0x41
14592032f: 0f1144014c movups xmmword ptr [rcx + rax + 0x4c], xmm0
145920334: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
145920338: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145920340: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
145920346: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14592034e: 49ffc4 inc r12
145920351: 0f57c0 xorps xmm0, xmm0
145920354: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
145920359: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
145920362: 4c89a6a0050000 mov qword ptr [rsi + 0x5a0], r12
145920369: 0f843e460000 je 0x1459249ad
14592036f: ffc7 inc edi
145920371: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145920378: c74401643333b33f mov dword ptr [rcx + rax + 0x64], 0x3fb33333
145920380: 4139fd cmp r13d, edi
145920383: 0f8567feffff jne 0x1459201f0
145920389: e997fcffff jmp 0x145920025
14592038e: 6690 nop
145920390: 49837c2468ff cmp qword ptr [r12 + 0x68], -1
145920396: 7448 je 0x1459203e0
145920398: 498d542468 lea rdx, [r12 + 0x68]
14592039d: 488d8d10010000 lea rcx, [rbp + 0x110]
1459203a4: 410f28d4 movaps xmm2, xmm12
1459203a8: 410f28db movaps xmm3, xmm11
1459203ac: e8af49f8ff call 0x1458a4d60
1459203b1: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
1459203b8: 7526 jne 0x1459203e0
1459203ba: f3440f10ad1c010000 movss xmm13, dword ptr [rbp + 0x11c]
1459203c3: 4c8ba6a0050000 mov r12, qword ptr [rsi + 0x5a0]
1459203ca: 4c3ba690050000 cmp r12, qword ptr [rsi + 0x590]
1459203d1: 0f84befeffff je 0x145920295
1459203d7: e9c5feffff jmp 0x1459202a1
1459203dc: 0f1f4000 nop dword ptr [rax]
1459203e0: f3450f10ac24b8000000 movss xmm13, dword ptr [r12 + 0xb8]
1459203ea: 4c8ba6a0050000 mov r12, qword ptr [rsi + 0x5a0]
1459203f1: 4c3ba690050000 cmp r12, qword ptr [rsi + 0x590]
1459203f8: 0f85a3feffff jne 0x1459202a1
1459203fe: e992feffff jmp 0x145920295
145920403: 448b31 mov r14d, dword ptr [rcx]
145920406: f30f107104 movss xmm6, dword ptr [rcx + 4]
14592040b: f3440f59710c mulss xmm14, dword ptr [rcx + 0xc]
145920411: f30f101d47ce4800 movss xmm3, dword ptr [rip + 0x48ce47]
145920419: f3440f58fb addss xmm15, xmm3
14592041e: f3440f587908 addss xmm15, dword ptr [rcx + 8]
145920424: 4889f1 mov rcx, rsi
145920427: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14592042e: 4889fa mov rdx, rdi
145920431: 4589f0 mov r8d, r14d
145920434: e867f2ffff call 0x14591f6a0
145920439: f30f11b564010000 movss dword ptr [rbp + 0x164], xmm6
145920441: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14592044b: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
145920454: f30f100508ce4800 movss xmm0, dword ptr [rip + 0x48ce08]
14592045c: 0f138518010000 movlps qword ptr [rbp + 0x118], xmm0
145920463: c7851001000003000000 mov dword ptr [rbp + 0x110], 3
14592046d: 488d8510010000 lea rax, [rbp + 0x110]
145920474: 4889442448 mov qword ptr [rsp + 0x48], rax
145920479: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145920480: 4489742438 mov dword ptr [rsp + 0x38], r14d
145920485: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
14592048c: c74424300000803f mov dword ptr [rsp + 0x30], 0x3f800000
145920494: c744242800000000 mov dword ptr [rsp + 0x28], 0
14592049c: 4c8d8560010000 lea r8, [rbp + 0x160]
1459204a3: 4889f1 mov rcx, rsi
1459204a6: 4889fa mov rdx, rdi
1459204a9: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
1459204b0: e8dbefffff call 0x14591f490
1459204b5: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
1459204bc: 4839d0 cmp rax, rdx
1459204bf: 0f83b6450000 jae 0x145924a7b
1459204c5: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
1459204cc: 48c1e007 shl rax, 7
1459204d0: c644017c01 mov byte ptr [rcx + rax + 0x7c], 1
1459204d5: f30f101583cd4800 movss xmm2, dword ptr [rip + 0x48cd83]
1459204dd: 4889f1 mov rcx, rsi
1459204e0: 488bbdf0000000 mov rdi, qword ptr [rbp + 0xf0]
1459204e7: 4889fa mov rdx, rdi
1459204ea: 4531c9 xor r9d, r9d
1459204ed: e8deecffff call 0x14591f1d0
1459204f2: 483bbe70050000 cmp rdi, qword ptr [rsi + 0x570]
1459204f9: 0f8329f3ffff jae 0x14591f828
1459204ff: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
145920506: f3440f11bc18c4010000 movss dword ptr [rax + rbx + 0x1c4], xmm15
145920510: e913f3ffff jmp 0x14591f828
145920515: 448b39 mov r15d, dword ptr [rcx]
145920518: 440f288550010000 movaps xmm8, xmmword ptr [rbp + 0x150]
145920520: 410f28c0 movaps xmm0, xmm8
145920524: 0f5c85d0000000 subps xmm0, xmmword ptr [rbp + 0xd0]
14592052b: 0f59c0 mulps xmm0, xmm0
14592052e: f30f16c8 movshdup xmm1, xmm0
145920532: f30f58c8 addss xmm1, xmm0
145920536: f30f51f9 sqrtss xmm7, xmm1
14592053a: f30f583df2a74900 addss xmm7, dword ptr [rip + 0x49a7f2]
145920542: f3440f108d78010000 movss xmm9, dword ptr [rbp + 0x178]
14592054b: 410f28c1 movaps xmm0, xmm9
14592054f: e8c39e2e00 call 0x145c0a417
145920554: 0f28f0 movaps xmm6, xmm0
145920557: 410f28c1 movaps xmm0, xmm9
14592055b: e8b19e2e00 call 0x145c0a411
145920560: 0f14f0 unpcklps xmm6, xmm0
145920563: f30f12c7 movsldup xmm0, xmm7
145920567: 0f59c6 mulps xmm0, xmm6
14592056a: 410f58c0 addps xmm0, xmm8
14592056e: 0f1385c0000000 movlps qword ptr [rbp + 0xc0], xmm0
145920575: f3440f119dc8000000 movss dword ptr [rbp + 0xc8], xmm11
14592057e: 488b96b0090000 mov rdx, qword ptr [rsi + 0x9b0]
145920585: 48837a40ff cmp qword ptr [rdx + 0x40], -1
14592058a: 0f8464380000 je 0x145923df4
145920590: 450f28e2 movaps xmm12, xmm10
145920594: 4883c240 add rdx, 0x40
145920598: 488d4d78 lea rcx, [rbp + 0x78]
14592059c: 4c8d85a8000000 lea r8, [rbp + 0xa8]
1459205a3: 4c8d8dc0000000 lea r9, [rbp + 0xc0]
1459205aa: e8918c0800 call 0x1459a9240
1459205af: 488b96b0090000 mov rdx, qword ptr [rsi + 0x9b0]
1459205b6: e954380000 jmp 0x145923e0f
1459205bb: 448b31 mov r14d, dword ptr [rcx]
1459205be: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
1459205c3: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
1459205c8: 0f28d6 movaps xmm2, xmm6
1459205cb: f30f58d7 addss xmm2, xmm7
1459205cf: f2440f104104 movsd xmm8, qword ptr [rcx + 4]
1459205d5: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
1459205db: f3440f108d78010000 movss xmm9, dword ptr [rbp + 0x178]
1459205e4: f3440f114c2420 movss dword ptr [rsp + 0x20], xmm9
1459205eb: 4889f1 mov rcx, rsi
1459205ee: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
1459205f5: 41b901000000 mov r9d, 1
1459205fb: e8d0ebffff call 0x14591f1d0
145920600: 4889f1 mov rcx, rsi
145920603: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14592060a: 4889fa mov rdx, rdi
14592060d: 4589f0 mov r8d, r14d
145920610: 0f28de movaps xmm3, xmm6
145920613: e888f0ffff call 0x14591f6a0
145920618: 488b86d0090000 mov rax, qword ptr [rsi + 0x9d0]
14592061f: 488b8eb8090000 mov rcx, qword ptr [rsi + 0x9b8]
145920626: 488d1408 lea rdx, [rax + rcx]
14592062a: 48c1c217 rol rdx, 0x17
14592062e: 4c8b86c0090000 mov r8, qword ptr [rsi + 0x9c0]
145920635: 4801ca add rdx, rcx
145920638: 4d89c1 mov r9, r8
14592063b: 49c1e111 shl r9, 0x11
14592063f: 4c8b96c8090000 mov r10, qword ptr [rsi + 0x9c8]
145920646: 4931ca xor r10, rcx
145920649: 4c31c0 xor rax, r8
14592064c: 4d31d0 xor r8, r10
14592064f: 4c8986c0090000 mov qword ptr [rsi + 0x9c0], r8
145920656: 4831c1 xor rcx, rax
145920659: 48898eb8090000 mov qword ptr [rsi + 0x9b8], rcx
145920660: 4d31ca xor r10, r9
145920663: 4c8996c8090000 mov qword ptr [rsi + 0x9c8], r10
14592066a: 48c1c02d rol rax, 0x2d
14592066e: 488986d0090000 mov qword ptr [rsi + 0x9d0], rax
145920675: 48c1ea3f shr rdx, 0x3f
145920679: 488d05b8862e01 lea rax, [rip + 0x12e86b8]
145920680: f30f100490 movss xmm0, dword ptr [rax + rdx*4]
145920685: f30f5ec7 divss xmm0, xmm7
145920689: f2440f118564010000 movsd qword ptr [rbp + 0x164], xmm8
145920692: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
14592069c: f3440f58fe addss xmm15, xmm6
1459206a1: f3440f58ff addss xmm15, xmm7
1459206a6: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
1459206af: c785180100000000803e mov dword ptr [rbp + 0x118], 0x3e800000
1459206b9: f30f11851c010000 movss dword ptr [rbp + 0x11c], xmm0
1459206c1: c7851001000003000000 mov dword ptr [rbp + 0x110], 3
1459206cb: 488d8510010000 lea rax, [rbp + 0x110]
1459206d2: 4889442448 mov qword ptr [rsp + 0x48], rax
1459206d7: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
1459206de: 4489742438 mov dword ptr [rsp + 0x38], r14d
1459206e3: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
1459206e9: f3440f114c2428 movss dword ptr [rsp + 0x28], xmm9
1459206f0: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
1459206f7: 4c8d8560010000 lea r8, [rbp + 0x160]
1459206fe: 4889f1 mov rcx, rsi
145920701: 4889fa mov rdx, rdi
145920704: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
14592070b: e880edffff call 0x14591f490
145920710: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
145920717: 4839d0 cmp rax, rdx
14592071a: 0f836c430000 jae 0x145924a8c
145920720: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145920727: 48c1e007 shl rax, 7
14592072b: c644017c01 mov byte ptr [rcx + rax + 0x7c], 1
145920730: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145920737: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14592073e: 4839d1 cmp rcx, rdx
145920741: 0f8354440000 jae 0x145924b9b
145920747: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
14592074e: 4881c620060000 add rsi, 0x620
145920755: 4889d9 mov rcx, rbx
145920758: e8c3c50700 call 0x14599cd20
14592075d: 4889c7 mov rdi, rax
145920760: 4889d3 mov rbx, rdx
145920763: 4c8d35d6982e01 lea r14, [rip + 0x12e98d6]
14592076a: 41bf1b000000 mov r15d, 0x1b
145920770: ba1b000000 mov edx, 0x1b
145920775: e9d3280000 jmp 0x14592304d
14592077a: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
145920781: 448b01 mov r8d, dword ptr [rcx]
145920784: 448b7104 mov r14d, dword ptr [rcx + 4]
145920788: f30f104108 movss xmm0, dword ptr [rcx + 8]
14592078d: f30f118550010000 movss dword ptr [rbp + 0x150], xmm0
145920795: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14592079a: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
14592079f: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
1459207a5: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
1459207ae: 4889f1 mov rcx, rsi
1459207b1: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459207b8: 448985e0000000 mov dword ptr [rbp + 0xe0], r8d
1459207bf: 0f28df movaps xmm3, xmm7
1459207c2: e8d9eeffff call 0x14591f6a0
1459207c7: 448bae540a0000 mov r13d, dword ptr [rsi + 0xa54]
1459207ce: 41ffc5 inc r13d
1459207d1: 4489ae540a0000 mov dword ptr [rsi + 0xa54], r13d
1459207d8: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
1459207df: f30f1015b90f4900 movss xmm2, dword ptr [rip + 0x490fb9]
1459207e7: 0f57c9 xorps xmm1, xmm1
1459207ea: e8a1250a00 call 0x1459c2d90
1459207ef: 4183fe01 cmp r14d, 1
1459207f3: 4183d600 adc r14d, 0
1459207f7: 0f57c9 xorps xmm1, xmm1
1459207fa: f3490f2ace cvtsi2ss xmm1, r14
1459207ff: f30f118db8000000 movss dword ptr [rbp + 0xb8], xmm1
145920807: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
14592080f: 4531e4 xor r12d, r12d
145920812: f3440f10054d0b4900 movss xmm8, dword ptr [rip + 0x490b4d]
14592081b: f3440f1035ec7f4900 movss xmm14, dword ptr [rip + 0x497fec]
145920824: f3440f103d63124d00 movss xmm15, dword ptr [rip + 0x4d1263]
14592082d: f3440f100d2aca4800 movss xmm9, dword ptr [rip + 0x48ca2a]
145920836: 488d1df31d2d01 lea rbx, [rip + 0x12d1df3]
14592083d: e9d2000000 jmp 0x145920914
145920842: 488d8e90050000 lea rcx, [rsi + 0x590]
145920849: e8a2d22e00 call 0x145c0daf0
14592084e: 41ffc4 inc r12d
145920851: 0f28c7 movaps xmm0, xmm7
145920854: f3410f58c5 addss xmm0, xmm13
145920859: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
145920860: 4c89f9 mov rcx, r15
145920863: 48c1e107 shl rcx, 7
145920867: 48c7040800000000 mov qword ptr [rax + rcx], 0
14592086f: c744081001000000 mov dword ptr [rax + rcx + 0x10], 1
145920877: 44896c0814 mov dword ptr [rax + rcx + 0x14], r13d
14592087c: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145920883: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145920888: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145920891: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
145920899: f30f108d50010000 movss xmm1, dword ptr [rbp + 0x150]
1459208a1: f30f114c0834 movss dword ptr [rax + rcx + 0x34], xmm1
1459208a7: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
1459208ab: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
1459208b1: f3440f115c0848 movss dword ptr [rax + rcx + 0x48], xmm11
1459208b8: 0f57c9 xorps xmm1, xmm1
1459208bb: f3410f10cd movss xmm1, xmm13
1459208c0: 0f57d2 xorps xmm2, xmm2
1459208c3: f30f10d0 movss xmm2, xmm0
1459208c7: 0fc6ca41 shufps xmm1, xmm2, 0x41
1459208cb: 0f114c084c movups xmmword ptr [rax + rcx + 0x4c], xmm1
1459208d0: 8b95e0000000 mov edx, dword ptr [rbp + 0xe0]
1459208d6: 8954085c mov dword ptr [rax + rcx + 0x5c], edx
1459208da: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
1459208e2: f30f11440860 movss dword ptr [rax + rcx + 0x60], xmm0
1459208e8: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
1459208f0: 49ffc7 inc r15
1459208f3: 0f57c0 xorps xmm0, xmm0
1459208f6: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
1459208fb: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145920904: 4c89bea0050000 mov qword ptr [rsi + 0x5a0], r15
14592090b: 4539f4 cmp r12d, r14d
14592090e: 0f8433020000 je 0x145920b47
145920914: 0f57c0 xorps xmm0, xmm0
145920917: 0f2ec6 ucomiss xmm0, xmm6
14592091a: 440f2895d0000000 movaps xmm10, xmmword ptr [rbp + 0xd0]
145920922: 0f835e010000 jae 0x145920a86
145920928: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
14592092f: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
145920936: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
14592093d: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
145920944: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145920950: 4e8d0c02 lea r9, [rdx + r8]
145920954: 49c1c117 rol r9, 0x17
145920958: 4901d1 add r9, rdx
14592095b: 4989c2 mov r10, rax
14592095e: 49c1e211 shl r10, 0x11
145920962: 4831d1 xor rcx, rdx
145920965: 4931c0 xor r8, rax
145920968: 4831c8 xor rax, rcx
14592096b: 4c31c2 xor rdx, r8
14592096e: 4c31d1 xor rcx, r10
145920971: 49c1c02d rol r8, 0x2d
145920975: 49c1e929 shr r9, 0x29
145920979: 4181c90000803f or r9d, 0x3f800000
145920980: 66450f6ee1 movd xmm12, r9d
145920985: f3450f58e0 addss xmm12, xmm8
14592098a: f3450f59e6 mulss xmm12, xmm14
14592098f: f3450f58e7 addss xmm12, xmm15
145920994: 450f2ecc ucomiss xmm9, xmm12
145920998: 76b6 jbe 0x145920950
14592099a: 4589e1 mov r9d, r12d
14592099d: 450f57d2 xorps xmm10, xmm10
1459209a1: f34d0f2ad1 cvtsi2ss xmm10, r9
1459209a6: f3440f5e95b8000000 divss xmm10, dword ptr [rbp + 0xb8]
1459209af: f3440f5915e80d4900 mulss xmm10, dword ptr [rip + 0x490de8]
1459209b8: f3440f58950c010000 addss xmm10, dword ptr [rbp + 0x10c]
1459209c1: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
1459209c8: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
1459209cf: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
1459209d6: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
1459209dd: f3440f59e6 mulss xmm12, xmm6
1459209e2: 410f28c2 movaps xmm0, xmm10
1459209e6: e82c9a2e00 call 0x145c0a417
1459209eb: 440f28d8 movaps xmm11, xmm0
1459209ef: 410f28c2 movaps xmm0, xmm10
1459209f3: e8199a2e00 call 0x145c0a411
1459209f8: 440f28d0 movaps xmm10, xmm0
1459209fc: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
145920a03: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
145920a0a: e8b183f7ff call 0x145898dc0
145920a0f: 4869f8f0000000 imul rdi, rax, 0xf0
145920a16: 450f14da unpcklps xmm11, xmm10
145920a1a: f3450f12d4 movsldup xmm10, xmm12
145920a1f: 450f59d3 mulps xmm10, xmm11
145920a23: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
145920a2b: f2440f10a41fc8000000 movsd xmm12, qword ptr [rdi + rbx + 0xc8]
145920a35: 450f28da movaps xmm11, xmm10
145920a39: 450f5cdc subps xmm11, xmm12
145920a3d: f3410f16cb movshdup xmm1, xmm11
145920a42: 410f28c3 movaps xmm0, xmm11
145920a46: e8e4992e00 call 0x145c0a42f
145920a4b: f30f108c1fd8000000 movss xmm1, dword ptr [rdi + rbx + 0xd8]
145920a54: f30f580d140c8f00 addss xmm1, dword ptr [rip + 0x8f0c14]
145920a5c: f30f101538a64900 movss xmm2, dword ptr [rip + 0x49a638]
145920a64: 0f2ed0 ucomiss xmm2, xmm0
145920a67: 771d ja 0x145920a86
145920a69: 0f2ec8 ucomiss xmm1, xmm0
145920a6c: 7318 jae 0x145920a86
145920a6e: f30f12c0 movsldup xmm0, xmm0
145920a72: 440f5ed8 divps xmm11, xmm0
145920a76: f30f12c1 movsldup xmm0, xmm1
145920a7a: 410f59c3 mulps xmm0, xmm11
145920a7e: 440f58e0 addps xmm12, xmm0
145920a82: 450f28d4 movaps xmm10, xmm12
145920a86: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145920a8c: ffc7 inc edi
145920a8e: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
145920a94: f3440f10ae4c0a0000 movss xmm13, dword ptr [rsi + 0xa4c]
145920a9d: 4c8bbeb0090000 mov r15, qword ptr [rsi + 0x9b0]
145920aa4: 498d4f10 lea rcx, [r15 + 0x10]
145920aa8: f3450f16e2 movshdup xmm12, xmm10
145920aad: 410f28ca movaps xmm1, xmm10
145920ab1: 410f28d4 movaps xmm2, xmm12
145920ab5: e88600f8ff call 0x1458a0b40
145920aba: a801 test al, 1
145920abc: 741d je 0x145920adb
145920abe: 440f28d8 movaps xmm11, xmm0
145920ac2: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
145920ac9: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
145920ad0: 0f8578fdffff jne 0x14592084e
145920ad6: e967fdffff jmp 0x145920842
145920adb: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145920ae0: 7443 je 0x145920b25
145920ae2: 498d5768 lea rdx, [r15 + 0x68]
145920ae6: 488d8d10010000 lea rcx, [rbp + 0x110]
145920aed: 410f28d2 movaps xmm2, xmm10
145920af1: 410f28dc movaps xmm3, xmm12
145920af5: e86642f8ff call 0x1458a4d60
145920afa: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145920b01: 7522 jne 0x145920b25
145920b03: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
145920b0c: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
145920b13: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
145920b1a: 0f852efdffff jne 0x14592084e
145920b20: e91dfdffff jmp 0x145920842
145920b25: f3450f109fb8000000 movss xmm11, dword ptr [r15 + 0xb8]
145920b2e: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
145920b35: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
145920b3c: 0f850cfdffff jne 0x14592084e
145920b42: e9fbfcffff jmp 0x145920842
145920b47: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145920b4e: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145920b55: 4839d1 cmp rcx, rdx
145920b58: 0f833f3f0000 jae 0x145924a9d
145920b5e: 0f57c0 xorps xmm0, xmm0
145920b61: 31c0 xor eax, eax
145920b63: 0f2ec6 ucomiss xmm0, xmm6
145920b66: 0f92c0 setb al
145920b69: 488d0d38942e01 lea rcx, [rip + 0x12e9438]
145920b70: 488d3d40942e01 lea rdi, [rip + 0x12e9440]
145920b77: 480f42f9 cmovb rdi, rcx
145920b7b: 4c8d3440 lea r14, [rax + rax*2]
145920b7f: 4983c60c add r14, 0xc
145920b83: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145920b8a: 48038e68050000 add rcx, qword ptr [rsi + 0x568]
145920b91: 4881c620060000 add rsi, 0x620
145920b98: e883c10700 call 0x14599cd20
145920b9d: 4889c3 mov rbx, rax
145920ba0: 4989d7 mov r15, rdx
145920ba3: 4889f9 mov rcx, rdi
145920ba6: 4c89f2 mov rdx, r14
145920ba9: e822d20600 call 0x14598ddd0
145920bae: 4885c0 test rax, rax
145920bb1: 480f45f8 cmovne rdi, rax
145920bb5: 490f44d6 cmove rdx, r14
145920bb9: 4889542420 mov qword ptr [rsp + 0x20], rdx
145920bbe: 4c8db510010000 lea r14, [rbp + 0x110]
145920bc5: 4c89f1 mov rcx, r14
145920bc8: 4889da mov rdx, rbx
145920bcb: 4d89f8 mov r8, r15
145920bce: 4989f9 mov r9, rdi
145920bd1: e947360000 jmp 0x14592421d
145920bd6: 448b31 mov r14d, dword ptr [rcx]
145920bd9: f30f107104 movss xmm6, dword ptr [rcx + 4]
145920bde: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145920be4: f30f107908 movss xmm7, dword ptr [rcx + 8]
145920be9: f3440f58ff addss xmm15, xmm7
145920bee: f3440f58790c addss xmm15, dword ptr [rcx + 0xc]
145920bf4: 4889f1 mov rcx, rsi
145920bf7: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145920bfe: 4889fa mov rdx, rdi
145920c01: 4589f0 mov r8d, r14d
145920c04: 0f28df movaps xmm3, xmm7
145920c07: e894eaffff call 0x14591f6a0
145920c0c: f30f1005d0c84800 movss xmm0, dword ptr [rip + 0x48c8d0]
145920c14: f30f58c6 addss xmm0, xmm6
145920c18: f30f11b564010000 movss dword ptr [rbp + 0x164], xmm6
145920c20: f30f118568010000 movss dword ptr [rbp + 0x168], xmm0
145920c28: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
145920c32: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
145920c3b: f30f100521c64800 movss xmm0, dword ptr [rip + 0x48c621]
145920c43: 0f138518010000 movlps qword ptr [rbp + 0x118], xmm0
145920c4a: c7851001000003000000 mov dword ptr [rbp + 0x110], 3
145920c54: 488d8510010000 lea rax, [rbp + 0x110]
145920c5b: 4889442448 mov qword ptr [rsp + 0x48], rax
145920c60: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145920c67: 4489742438 mov dword ptr [rsp + 0x38], r14d
145920c6c: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
145920c72: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
145920c79: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145920c7f: c744242800000000 mov dword ptr [rsp + 0x28], 0
145920c87: 4c8d8560010000 lea r8, [rbp + 0x160]
145920c8e: 4889f1 mov rcx, rsi
145920c91: 4889fa mov rdx, rdi
145920c94: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
145920c9b: e8f0e7ffff call 0x14591f490
145920ca0: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145920ca7: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145920cae: 4839d1 cmp rcx, rdx
145920cb1: 0f83f43d0000 jae 0x145924aab
145920cb7: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
145920cbe: 4889d9 mov rcx, rbx
145920cc1: e85ac00700 call 0x14599cd20
145920cc6: 4889c7 mov rdi, rax
145920cc9: 4889d3 mov rbx, rdx
145920ccc: 4881c620060000 add rsi, 0x620
145920cd3: 4c8d35ce952e01 lea r14, [rip + 0x12e95ce]
145920cda: 41bf34000000 mov r15d, 0x34
145920ce0: ba34000000 mov edx, 0x34
145920ce5: e963230000 jmp 0x14592304d
145920cea: 448b31 mov r14d, dword ptr [rcx]
145920ced: 448b6104 mov r12d, dword ptr [rcx + 4]
145920cf1: f3440f105908 movss xmm11, dword ptr [rcx + 8]
145920cf7: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145920cfc: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
145920d01: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
145920d07: 4889f1 mov rcx, rsi
145920d0a: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145920d11: 0f28d6 movaps xmm2, xmm6
145920d14: 4531c9 xor r9d, r9d
145920d17: e8b4e4ffff call 0x14591f1d0
145920d1c: 4889f1 mov rcx, rsi
145920d1f: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145920d26: 4589f0 mov r8d, r14d
145920d29: 0f28de movaps xmm3, xmm6
145920d2c: e86fe9ffff call 0x14591f6a0
145920d31: 488d9e90050000 lea rbx, [rsi + 0x590]
145920d38: 410f28d2 movaps xmm2, xmm10
145920d3c: 450f57d2 xorps xmm10, xmm10
145920d40: f3440f59d7 mulss xmm10, xmm7
145920d45: f3440f58d6 addss xmm10, xmm6
145920d4a: 448bbe500a0000 mov r15d, dword ptr [rsi + 0xa50]
145920d51: 41ffc7 inc r15d
145920d54: 4489be500a0000 mov dword ptr [rsi + 0xa50], r15d
145920d5b: f3440f10a64c0a0000 movss xmm12, dword ptr [rsi + 0xa4c]
145920d64: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
145920d6b: 4883c110 add rcx, 0x10
145920d6f: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145920d76: 440f28fa movaps xmm15, xmm2
145920d7a: e8f1e9f7ff call 0x14589f770
145920d7f: 440f28c8 movaps xmm9, xmm0
145920d83: 488bbea0050000 mov rdi, qword ptr [rsi + 0x5a0]
145920d8a: 483bbe90050000 cmp rdi, qword ptr [rsi + 0x590]
145920d91: 7508 jne 0x145920d9b
145920d93: 4889d9 mov rcx, rbx
145920d96: e855cd2e00 call 0x145c0daf0
145920d9b: f3450f58d4 addss xmm10, xmm12
145920da0: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
145920da7: 4889f9 mov rcx, rdi
145920daa: 48c1e107 shl rcx, 7
145920dae: 48c7040800000000 mov qword ptr [rax + rcx], 0
145920db6: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145920dbe: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145920dc5: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145920dca: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145920dd3: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
145920ddb: f3440f115c0834 movss dword ptr [rax + rcx + 0x34], xmm11
145920de2: 44897c083c mov dword ptr [rax + rcx + 0x3c], r15d
145920de7: 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
145920dee: 0f13440840 movlps qword ptr [rax + rcx + 0x40], xmm0
145920df3: f3440f114c0848 movss dword ptr [rax + rcx + 0x48], xmm9
145920dfa: 450f57c0 xorps xmm8, xmm8
145920dfe: 0f57c0 xorps xmm0, xmm0
145920e01: f3410f10c4 movss xmm0, xmm12
145920e06: 0f57c9 xorps xmm1, xmm1
145920e09: f3410f10ca movss xmm1, xmm10
145920e0e: 0fc6c141 shufps xmm0, xmm1, 0x41
145920e12: 0f1144084c movups xmmword ptr [rax + rcx + 0x4c], xmm0
145920e17: 448974085c mov dword ptr [rax + rcx + 0x5c], r14d
145920e1c: f3440f11740860 movss dword ptr [rax + rcx + 0x60], xmm14
145920e23: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145920e2b: 48ffc7 inc rdi
145920e2e: 440f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm8
145920e34: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145920e3d: 4889bea0050000 mov qword ptr [rsi + 0x5a0], rdi
145920e44: 4183fc02 cmp r12d, 2
145920e48: 0f82dae9ffff jb 0x14591f828
145920e4e: 450f28ee movaps xmm13, xmm14
145920e52: 440f28d7 movaps xmm10, xmm7
145920e56: f3440f58d7 addss xmm10, xmm7
145920e5b: f3440f5d1530054900 minss xmm10, dword ptr [rip + 0x490530]
145920e64: f3450f12db movsldup xmm11, xmm11
145920e69: 41bd01000000 mov r13d, 1
145920e6f: 4c8db510010000 lea r14, [rbp + 0x110]
145920e76: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145920e7c: ffc7 inc edi
145920e7e: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
145920e84: f3440f10a64c0a0000 movss xmm12, dword ptr [rsi + 0xa4c]
145920e8d: 4c8bbeb0090000 mov r15, qword ptr [rsi + 0x9b0]
145920e94: 498d4f10 lea rcx, [r15 + 0x10]
145920e98: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145920e9f: 410f28d7 movaps xmm2, xmm15
145920ea3: e898fcf7ff call 0x1458a0b40
145920ea8: a801 test al, 1
145920eaa: 7406 je 0x145920eb2
145920eac: 440f28c8 movaps xmm9, xmm0
145920eb0: eb3b jmp 0x145920eed
145920eb2: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145920eb7: 742b je 0x145920ee4
145920eb9: 498d5768 lea rdx, [r15 + 0x68]
145920ebd: 4c89f1 mov rcx, r14
145920ec0: 0f289550010000 movaps xmm2, xmmword ptr [rbp + 0x150]
145920ec7: 410f28df movaps xmm3, xmm15
145920ecb: e8903ef8ff call 0x1458a4d60
145920ed0: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145920ed7: 750b jne 0x145920ee4
145920ed9: f3440f108d1c010000 movss xmm9, dword ptr [rbp + 0x11c]
145920ee2: eb09 jmp 0x145920eed
145920ee4: f3450f108fb8000000 movss xmm9, dword ptr [r15 + 0xb8]
145920eed: 450f28f5 movaps xmm14, xmm13
145920ef1: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
145920ef8: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
145920eff: 7508 jne 0x145920f09
145920f01: 4889d9 mov rcx, rbx
145920f04: e8e7cb2e00 call 0x145c0daf0
145920f09: 418d4501 lea eax, [r13 + 1]
145920f0d: 0f57c0 xorps xmm0, xmm0
145920f10: f3480f2ac0 cvtsi2ss xmm0, rax
145920f15: 4489e9 mov ecx, r13d
145920f18: 0f57c9 xorps xmm1, xmm1
145920f1b: f3480f2ac9 cvtsi2ss xmm1, rcx
145920f20: 0f28d7 movaps xmm2, xmm7
145920f23: f30f59d1 mulss xmm2, xmm1
145920f27: 0f14c8 unpcklps xmm1, xmm0
145920f2a: 410f59cb mulps xmm1, xmm11
145920f2e: f30f58d6 addss xmm2, xmm6
145920f32: f3410f58d4 addss xmm2, xmm12
145920f37: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145920f3e: 4c89f9 mov rcx, r15
145920f41: 48c1e107 shl rcx, 7
145920f45: 48c7040a00000000 mov qword ptr [rdx + rcx], 0
145920f4d: c7440a1000000000 mov dword ptr [rdx + rcx + 0x10], 0
145920f55: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
145920f5c: 4c89440a20 mov qword ptr [rdx + rcx + 0x20], r8
145920f61: 48c7440a2800000000 mov qword ptr [rdx + rcx + 0x28], 0
145920f6a: c7440a3001000000 mov dword ptr [rdx + rcx + 0x30], 1
145920f72: 0f134c0a34 movlps qword ptr [rdx + rcx + 0x34], xmm1
145920f77: 897c0a3c mov dword ptr [rdx + rcx + 0x3c], edi
145920f7b: 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
145920f82: 0f13440a40 movlps qword ptr [rdx + rcx + 0x40], xmm0
145920f87: f3440f114c0a48 movss dword ptr [rdx + rcx + 0x48], xmm9
145920f8e: 0f57c0 xorps xmm0, xmm0
145920f91: f3410f10c4 movss xmm0, xmm12
145920f96: 0f57c9 xorps xmm1, xmm1
145920f99: f30f10ca movss xmm1, xmm2
145920f9d: 0fc6c141 shufps xmm0, xmm1, 0x41
145920fa1: 0f11440a4c movups xmmword ptr [rdx + rcx + 0x4c], xmm0
145920fa6: c7440a5c00000000 mov dword ptr [rdx + rcx + 0x5c], 0
145920fae: f3440f11740a60 movss dword ptr [rdx + rcx + 0x60], xmm14
145920fb5: c7440a640000807f mov dword ptr [rdx + rcx + 0x64], 0x7f800000
145920fbd: 49ffc7 inc r15
145920fc0: 440f11440a68 movups xmmword ptr [rdx + rcx + 0x68], xmm8
145920fc6: 48c7440a7700000000 mov qword ptr [rdx + rcx + 0x77], 0
145920fcf: 4c89bea0050000 mov qword ptr [rsi + 0x5a0], r15
145920fd6: 0f84173a0000 je 0x1459249f3
145920fdc: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145920fe3: f3440f11540a64 movss dword ptr [rdx + rcx + 0x64], xmm10
145920fea: 4189c5 mov r13d, eax
145920fed: 4139c4 cmp r12d, eax
145920ff0: 0f8580feffff jne 0x145920e76
145920ff6: e92de8ffff jmp 0x14591f828
145920ffb: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145921002: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
145921009: 4839d0 cmp rax, rdx
14592100c: 0f83a73a0000 jae 0x145924ab9
145921012: 448b29 mov r13d, dword ptr [rcx]
145921015: 4c8db620060000 lea r14, [rsi + 0x620]
14592101c: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
145921023: 4889d9 mov rcx, rbx
145921026: e8f5bc0700 call 0x14599cd20
14592102b: 4889c3 mov rbx, rax
14592102e: 4989d7 mov r15, rdx
145921031: 4c8d25008f2e01 lea r12, [rip + 0x12e8f00]
145921038: bf0f000000 mov edi, 0xf
14592103d: ba0f000000 mov edx, 0xf
145921042: 4c89e1 mov rcx, r12
145921045: e886cd0600 call 0x14598ddd0
14592104a: 4885c0 test rax, rax
14592104d: 490f44c4 cmove rax, r12
145921051: 480f44d7 cmove rdx, rdi
145921055: 4889542428 mov qword ptr [rsp + 0x28], rdx
14592105a: 4889442420 mov qword ptr [rsp + 0x20], rax
14592105f: 4c8da510010000 lea r12, [rbp + 0x110]
145921066: 4c89e1 mov rcx, r12
145921069: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145921070: 4989d8 mov r8, rbx
145921073: 4d89f9 mov r9, r15
145921076: e8952ffaff call 0x1458c4010
14592107b: 4c89f1 mov rcx, r14
14592107e: 4c89e2 mov rdx, r12
145921081: e8aaff39fb call 0x140cc1030
145921086: 4585ed test r13d, r13d
145921089: 0f8499e7ffff je 0x14591f828
14592108f: 4489e8 mov eax, r13d
145921092: f3480f2af8 cvtsi2ss xmm7, rax
145921097: 31db xor ebx, ebx
145921099: 41be02000000 mov r14d, 2
14592109f: f3440f100df8064900 movss xmm9, dword ptr [rip + 0x4906f8]
1459210a8: 440f281550185a00 movaps xmm10, xmmword ptr [rip + 0x5a1850]
1459210b0: 488dbd10010000 lea rdi, [rbp + 0x110]
1459210b7: eb56 jmp 0x14592110f
1459210b9: f3410f1087b8000000 movss xmm0, dword ptr [r15 + 0xb8]
1459210c2: b8abaaaaaa mov eax, 0xaaaaaaab
1459210c7: 4c0fafe0 imul r12, rax
1459210cb: 49c1ec21 shr r12, 0x21
1459210cf: 438d0464 lea eax, [r12 + r12*2]
1459210d3: 4401f0 add eax, r14d
1459210d6: ffc3 inc ebx
1459210d8: 31d2 xor edx, edx
1459210da: 85c0 test eax, eax
1459210dc: 0f94c2 sete dl
1459210df: 0f13b514010000 movlps qword ptr [rbp + 0x114], xmm6
1459210e6: f30f11851c010000 movss dword ptr [rbp + 0x11c], xmm0
1459210ee: c7851001000001000000 mov dword ptr [rbp + 0x110], 1
1459210f8: 4889f1 mov rcx, rsi
1459210fb: 4989f8 mov r8, rdi
1459210fe: e88dcc0100 call 0x14593dd90
145921103: 41ffce dec r14d
145921106: 4139dd cmp r13d, ebx
145921109: 0f8419e7ffff je 0x14591f828
14592110f: 4189dc mov r12d, ebx
145921112: 450f57c0 xorps xmm8, xmm8
145921116: f34d0f2ac4 cvtsi2ss xmm8, r12
14592111b: f3440f5ec7 divss xmm8, xmm7
145921120: f3450f59c1 mulss xmm8, xmm9
145921125: 410f28c0 movaps xmm0, xmm8
145921129: e8e9922e00 call 0x145c0a417
14592112e: 0f28f0 movaps xmm6, xmm0
145921131: 410f28c0 movaps xmm0, xmm8
145921135: e8d7922e00 call 0x145c0a411
14592113a: 0f14f0 unpcklps xmm6, xmm0
14592113d: 410f59f2 mulps xmm6, xmm10
145921141: 0f58b550010000 addps xmm6, xmmword ptr [rbp + 0x150]
145921148: f3440f16c6 movshdup xmm8, xmm6
14592114d: 4c8bbeb0090000 mov r15, qword ptr [rsi + 0x9b0]
145921154: 498d4f10 lea rcx, [r15 + 0x10]
145921158: 0f28ce movaps xmm1, xmm6
14592115b: 410f28d0 movaps xmm2, xmm8
14592115f: e8dcf9f7ff call 0x1458a0b40
145921164: a801 test al, 1
145921166: 0f8556ffffff jne 0x1459210c2
14592116c: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145921171: 0f8442ffffff je 0x1459210b9
145921177: 498d5768 lea rdx, [r15 + 0x68]
14592117b: 4889f9 mov rcx, rdi
14592117e: 0f28d6 movaps xmm2, xmm6
145921181: 410f28d8 movaps xmm3, xmm8
145921185: e8d63bf8ff call 0x1458a4d60
14592118a: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145921191: 0f8522ffffff jne 0x1459210b9
145921197: f30f10851c010000 movss xmm0, dword ptr [rbp + 0x11c]
14592119f: e91effffff jmp 0x1459210c2
1459211a4: 488b5908 mov rbx, qword ptr [rcx + 8]
1459211a8: 4885db test rbx, rbx
1459211ab: 0f8477e6ffff je 0x14591f828
1459211b1: 488b39 mov rdi, qword ptr [rcx]
1459211b4: f30f107110 movss xmm6, dword ptr [rcx + 0x10]
1459211b9: 0f1007 movups xmm0, xmmword ptr [rdi]
1459211bc: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
1459211c0: 0f105720 movups xmm2, xmmword ptr [rdi + 0x20]
1459211c4: 0f299530010000 movaps xmmword ptr [rbp + 0x130], xmm2
1459211cb: 0f298d20010000 movaps xmmword ptr [rbp + 0x120], xmm1
1459211d2: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
1459211d9: 4c8d8510010000 lea r8, [rbp + 0x110]
1459211e0: 4889f1 mov rcx, rsi
1459211e3: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
1459211ea: e8a1e5ffff call 0x14591f790
1459211ef: 4883fb01 cmp rbx, 1
1459211f3: 0f842fe6ffff je 0x14591f828
1459211f9: 48c1e304 shl rbx, 4
1459211fd: 4c8d3c5b lea r15, [rbx + rbx*2]
145921201: 4c8d8514010000 lea r8, [rbp + 0x114]
145921208: 4c8ba6b8050000 mov r12, qword ptr [rsi + 0x5b8]
14592120f: 4d89e5 mov r13, r12
145921212: 49c1e506 shl r13, 6
145921216: 4983cd0c or r13, 0xc
14592121a: bb01000000 mov ebx, 1
14592121f: 41be30000000 mov r14d, 0x30
145921225: 4889bd78010000 mov qword ptr [rbp + 0x178], rdi
14592122c: eb79 jmp 0x1459212a7
14592122e: 0f57c0 xorps xmm0, xmm0
145921231: f3480f2ac3 cvtsi2ss xmm0, rbx
145921236: f30f59c6 mulss xmm0, xmm6
14592123a: f30f58c7 addss xmm0, xmm7
14592123e: 488b86b0050000 mov rax, qword ptr [rsi + 0x5b0]
145921245: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
14592124c: 4a894c28f4 mov qword ptr [rax + r13 - 0xc], rcx
145921251: f3420f114428fc movss dword ptr [rax + r13 - 4], xmm0
145921258: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
14592125f: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
145921266: 0f109530010000 movups xmm2, xmmword ptr [rbp + 0x130]
14592126d: 420f110428 movups xmmword ptr [rax + r13], xmm0
145921272: 420f114c2810 movups xmmword ptr [rax + r13 + 0x10], xmm1
145921278: 420f11542820 movups xmmword ptr [rax + r13 + 0x20], xmm2
14592127e: 8b8d40010000 mov ecx, dword ptr [rbp + 0x140]
145921284: 42894c2830 mov dword ptr [rax + r13 + 0x30], ecx
145921289: 49ffc4 inc r12
14592128c: 4c89a6b8050000 mov qword ptr [rsi + 0x5b8], r12
145921293: 4983c540 add r13, 0x40
145921297: 4983c630 add r14, 0x30
14592129b: 48ffc3 inc rbx
14592129e: 4d39f7 cmp r15, r14
1459212a1: 0f8481e5ffff je 0x14591f828
1459212a7: f30f10be4c0a0000 movss xmm7, dword ptr [rsi + 0xa4c]
1459212af: 420f100437 movups xmm0, xmmword ptr [rdi + r14]
1459212b4: 420f104c3710 movups xmm1, xmmword ptr [rdi + r14 + 0x10]
1459212ba: 420f10543720 movups xmm2, xmmword ptr [rdi + r14 + 0x20]
1459212c0: 410f115020 movups xmmword ptr [r8 + 0x20], xmm2
1459212c5: 410f114810 movups xmmword ptr [r8 + 0x10], xmm1
1459212ca: 410f1100 movups xmmword ptr [r8], xmm0
1459212ce: 4c3ba6a8050000 cmp r12, qword ptr [rsi + 0x5a8]
1459212d5: 0f8553ffffff jne 0x14592122e
1459212db: 488d8ea8050000 lea rcx, [rsi + 0x5a8]
1459212e2: 4c89c7 mov rdi, r8
1459212e5: e8d6522f00 call 0x145c165c0
1459212ea: 4989f8 mov r8, rdi
1459212ed: 488bbd78010000 mov rdi, qword ptr [rbp + 0x178]
1459212f4: e935ffffff jmp 0x14592122e
1459212f9: 8b19 mov ebx, dword ptr [rcx]
1459212fb: f30f107904 movss xmm7, dword ptr [rcx + 4]
145921300: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
145921306: f30f103552984900 movss xmm6, dword ptr [rip + 0x499852]
14592130e: 4889f1 mov rcx, rsi
145921311: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145921318: 0f28d6 movaps xmm2, xmm6
14592131b: 4531c9 xor r9d, r9d
14592131e: e8addeffff call 0x14591f1d0
145921323: 4889f1 mov rcx, rsi
145921326: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14592132d: 4889fa mov rdx, rdi
145921330: 4189d8 mov r8d, ebx
145921333: 0f28de movaps xmm3, xmm6
145921336: e865e3ffff call 0x14591f6a0
14592133b: f30f11bd64010000 movss dword ptr [rbp + 0x164], xmm7
145921343: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
14592134d: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145921357: 488d8510010000 lea rax, [rbp + 0x110]
14592135e: 4889442448 mov qword ptr [rsp + 0x48], rax
145921363: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14592136a: 895c2438 mov dword ptr [rsp + 0x38], ebx
14592136e: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145921375: c74424306666a63f mov dword ptr [rsp + 0x30], 0x3fa66666
14592137d: c744242800000000 mov dword ptr [rsp + 0x28], 0
145921385: 4c8d8560010000 lea r8, [rbp + 0x160]
14592138c: 4889f1 mov rcx, rsi
14592138f: 4889fa mov rdx, rdi
145921392: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
145921399: e8f2e0ffff call 0x14591f490
14592139e: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
1459213a5: 4839d0 cmp rax, rdx
1459213a8: 0f82f0290000 jb 0x145923d9e
1459213ae: 4c8d05938b2e01 lea r8, [rip + 0x12e8b93]
1459213b5: 4889c1 mov rcx, rax
1459213b8: e8c6844800 call 0x145da9883
1459213bd: 0f0b ud2
1459213bf: 8b19 mov ebx, dword ptr [rcx]
1459213c1: 448b6104 mov r12d, dword ptr [rcx + 4]
1459213c5: f30f107908 movss xmm7, dword ptr [rcx + 8]
1459213ca: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
1459213cf: f30f105910 movss xmm3, dword ptr [rcx + 0x10]
1459213d4: f3440f105114 movss xmm10, dword ptr [rcx + 0x14]
1459213da: 4889f1 mov rcx, rsi
1459213dd: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459213e4: 4189d8 mov r8d, ebx
1459213e7: f30f119d50010000 movss dword ptr [rbp + 0x150], xmm3
1459213ef: e8ace2ffff call 0x14591f6a0
1459213f4: 4585e4 test r12d, r12d
1459213f7: 0f842be4ffff je 0x14591f828
1459213fd: f3440f10864c0a0000 movss xmm8, dword ptr [rsi + 0xa4c]
145921406: 488bbea0050000 mov rdi, qword ptr [rsi + 0x5a0]
14592140d: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
145921414: 448bb6500a0000 mov r14d, dword ptr [rsi + 0xa50]
14592141b: 41ffc6 inc r14d
14592141e: 4489b6500a0000 mov dword ptr [rsi + 0xa50], r14d
145921425: 4883c110 add rcx, 0x10
145921429: 4c8bbe90050000 mov r15, qword ptr [rsi + 0x590]
145921430: 0f288dd0000000 movaps xmm1, xmmword ptr [rbp + 0xd0]
145921437: 0f2895e0000000 movaps xmm2, xmmword ptr [rbp + 0xe0]
14592143e: e82de3f7ff call 0x14589f770
145921443: 440f28c8 movaps xmm9, xmm0
145921447: 450f28de movaps xmm11, xmm14
14592144b: f3450f59da mulss xmm11, xmm10
145921450: 450f57d2 xorps xmm10, xmm10
145921454: f3440f589550010000 addss xmm10, dword ptr [rbp + 0x150]
14592145d: 4c39ff cmp rdi, r15
145921460: 750c jne 0x14592146e
145921462: 488d8e90050000 lea rcx, [rsi + 0x590]
145921469: e882c62e00 call 0x145c0daf0
14592146e: f3450f58d0 addss xmm10, xmm8
145921473: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
14592147a: 4889f9 mov rcx, rdi
14592147d: 48c1e107 shl rcx, 7
145921481: 48c7040800000000 mov qword ptr [rax + rcx], 0
145921489: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145921491: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145921498: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14592149d: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
1459214a6: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
1459214ae: f30f117c0834 movss dword ptr [rax + rcx + 0x34], xmm7
1459214b4: 448974083c mov dword ptr [rax + rcx + 0x3c], r14d
1459214b9: 0f2885d0000000 movaps xmm0, xmmword ptr [rbp + 0xd0]
1459214c0: 0f13440840 movlps qword ptr [rax + rcx + 0x40], xmm0
1459214c5: f3440f114c0848 movss dword ptr [rax + rcx + 0x48], xmm9
1459214cc: 0f57d2 xorps xmm2, xmm2
1459214cf: 0f57c0 xorps xmm0, xmm0
1459214d2: f3410f10c0 movss xmm0, xmm8
1459214d7: 0f57c9 xorps xmm1, xmm1
1459214da: f3410f10ca movss xmm1, xmm10
1459214df: 0fc6c141 shufps xmm0, xmm1, 0x41
1459214e3: 0f1144084c movups xmmword ptr [rax + rcx + 0x4c], xmm0
1459214e8: 895c085c mov dword ptr [rax + rcx + 0x5c], ebx
1459214ec: f3440f119d78010000 movss dword ptr [rbp + 0x178], xmm11
1459214f5: f3440f115c0860 movss dword ptr [rax + rcx + 0x60], xmm11
1459214fc: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145921504: 48ffc7 inc rdi
145921507: 0f11540868 movups xmmword ptr [rax + rcx + 0x68], xmm2
14592150c: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145921515: 4889bea0050000 mov qword ptr [rsi + 0x5a0], rdi
14592151c: 4183fc01 cmp r12d, 1
145921520: 0f8402e3ffff je 0x14591f828
145921526: f30f100532bd4800 movss xmm0, dword ptr [rip + 0x48bd32]
14592152e: f30f58c7 addss xmm0, xmm7
145921532: 0f28ce movaps xmm1, xmm6
145921535: f30f5fc8 maxss xmm1, xmm0
145921539: 440f28c9 movaps xmm9, xmm1
14592153d: f3440fc2c903 cmpunordss xmm9, xmm1
145921543: 410f28c1 movaps xmm0, xmm9
145921547: 0f55c1 andnps xmm0, xmm1
14592154a: 440f54ce andps xmm9, xmm6
14592154e: 440f56c8 orps xmm9, xmm0
145921552: 4c8dbeb8090000 lea r15, [rsi + 0x9b8]
145921559: f3440f10ad50010000 movss xmm13, dword ptr [rbp + 0x150]
145921562: f3440f5f2d29fe4800 maxss xmm13, dword ptr [rip + 0x48fe29]
14592156b: 41be01000000 mov r14d, 1
145921571: f3440f1035eefd4800 movss xmm14, dword ptr [rip + 0x48fdee]
14592157a: f3440f103d1d024900 movss xmm15, dword ptr [rip + 0x49021d]
145921583: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
14592158a: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
145921591: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
145921598: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
14592159f: 90 nop
1459215a0: 4e8d0c02 lea r9, [rdx + r8]
1459215a4: 49c1c117 rol r9, 0x17
1459215a8: 4901d1 add r9, rdx
1459215ab: 4989c2 mov r10, rax
1459215ae: 49c1e211 shl r10, 0x11
1459215b2: 4831d1 xor rcx, rdx
1459215b5: 4931c0 xor r8, rax
1459215b8: 4831c8 xor rax, rcx
1459215bb: 4c31c2 xor rdx, r8
1459215be: 49c1c02d rol r8, 0x2d
1459215c2: 4c31d1 xor rcx, r10
1459215c5: 49c1e929 shr r9, 0x29
1459215c9: 4181c90000803f or r9d, 0x3f800000
1459215d0: 66450f6ed1 movd xmm10, r9d
1459215d5: f3450f58d6 addss xmm10, xmm14
1459215da: f3450f59d7 mulss xmm10, xmm15
1459215df: 450f2efa ucomiss xmm15, xmm10
1459215e3: 76bb jbe 0x1459215a0
1459215e5: 0f57c0 xorps xmm0, xmm0
1459215e8: f3440f58d0 addss xmm10, xmm0
1459215ed: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
1459215f4: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
1459215fb: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
145921602: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
145921609: 4c89f9 mov rcx, r15
14592160c: 0f28cf movaps xmm1, xmm7
14592160f: 410f28d1 movaps xmm2, xmm9
145921613: e878170a00 call 0x1459c2d90
145921618: 440f28d8 movaps xmm11, xmm0
14592161c: 410f28c2 movaps xmm0, xmm10
145921620: e8f28d2e00 call 0x145c0a417
145921625: 440f28e0 movaps xmm12, xmm0
145921629: 410f28c2 movaps xmm0, xmm10
14592162d: e8df8d2e00 call 0x145c0a411
145921632: 440f14e0 unpcklps xmm12, xmm0
145921636: f3450f12d3 movsldup xmm10, xmm11
14592163b: 450f59d4 mulps xmm10, xmm12
14592163f: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
145921647: 4489f0 mov eax, r14d
14592164a: f3480f2af0 cvtsi2ss xmm6, rax
14592164f: f3450f16e2 movshdup xmm12, xmm10
145921654: f30f5935e0544900 mulss xmm6, dword ptr [rip + 0x4954e0]
14592165c: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145921662: ffc7 inc edi
145921664: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
14592166a: f3440f10864c0a0000 movss xmm8, dword ptr [rsi + 0xa4c]
145921673: 4c8baeb0090000 mov r13, qword ptr [rsi + 0x9b0]
14592167a: 498d4d10 lea rcx, [r13 + 0x10]
14592167e: 410f28ca movaps xmm1, xmm10
145921682: 410f28d4 movaps xmm2, xmm12
145921686: e8b5f4f7ff call 0x1458a0b40
14592168b: a801 test al, 1
14592168d: 7406 je 0x145921695
14592168f: 440f28d8 movaps xmm11, xmm0
145921693: eb3c jmp 0x1459216d1
145921695: 49837d68ff cmp qword ptr [r13 + 0x68], -1
14592169a: 742c je 0x1459216c8
14592169c: 498d5568 lea rdx, [r13 + 0x68]
1459216a0: 488d8d10010000 lea rcx, [rbp + 0x110]
1459216a7: 410f28d2 movaps xmm2, xmm10
1459216ab: 410f28dc movaps xmm3, xmm12
1459216af: e8ac36f8ff call 0x1458a4d60
1459216b4: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
1459216bb: 750b jne 0x1459216c8
1459216bd: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
1459216c6: eb09 jmp 0x1459216d1
1459216c8: f3450f109db8000000 movss xmm11, dword ptr [r13 + 0xb8]
1459216d1: 4c8baea0050000 mov r13, qword ptr [rsi + 0x5a0]
1459216d8: 4c3bae90050000 cmp r13, qword ptr [rsi + 0x590]
1459216df: 750c jne 0x1459216ed
1459216e1: 488d8e90050000 lea rcx, [rsi + 0x590]
1459216e8: e803c42e00 call 0x145c0daf0
1459216ed: f30f58b550010000 addss xmm6, dword ptr [rbp + 0x150]
1459216f5: f3410f58f0 addss xmm6, xmm8
1459216fa: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145921701: 4c89e8 mov rax, r13
145921704: 48c1e007 shl rax, 7
145921708: 48c7040100000000 mov qword ptr [rcx + rax], 0
145921710: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
145921718: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592171f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145921724: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14592172d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145921735: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14592173b: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
14592173f: 440f13540140 movlps qword ptr [rcx + rax + 0x40], xmm10
145921745: f3440f115c0148 movss dword ptr [rcx + rax + 0x48], xmm11
14592174c: 0f57c0 xorps xmm0, xmm0
14592174f: f3410f10c0 movss xmm0, xmm8
145921754: 0f57c9 xorps xmm1, xmm1
145921757: f30f10ce movss xmm1, xmm6
14592175b: 0fc6c141 shufps xmm0, xmm1, 0x41
14592175f: 0f1144014c movups xmmword ptr [rcx + rax + 0x4c], xmm0
145921764: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
145921768: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145921770: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
145921776: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14592177e: 49ffc5 inc r13
145921781: 0f57c0 xorps xmm0, xmm0
145921784: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
145921789: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
145921792: 4c89aea0050000 mov qword ptr [rsi + 0x5a0], r13
145921799: 0f8483320000 je 0x145924a22
14592179f: 41ffc6 inc r14d
1459217a2: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
1459217a9: f3440f116c0164 movss dword ptr [rcx + rax + 0x64], xmm13
1459217b0: 4539e6 cmp r14d, r12d
1459217b3: 0f85cafdffff jne 0x145921583
1459217b9: e96ae0ffff jmp 0x14591f828
1459217be: 80bedf0a000001 cmp byte ptr [rsi + 0xadf], 1
1459217c5: 0f855de0ffff jne 0x14591f828
1459217cb: f30f107104 movss xmm6, dword ptr [rcx + 4]
1459217d0: 448b01 mov r8d, dword ptr [rcx]
1459217d3: 4c8bb668040000 mov r14, qword ptr [rsi + 0x468]
1459217da: 488d9e20060000 lea rbx, [rsi + 0x620]
1459217e1: 4c89b588000000 mov qword ptr [rbp + 0x88], r14
1459217e8: 4c89b568010000 mov qword ptr [rbp + 0x168], r14
1459217ef: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
1459217f9: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
145921803: 488d85c0000000 lea rax, [rbp + 0xc0]
14592180a: 4889442430 mov qword ptr [rsp + 0x30], rax
14592180f: 488d8560010000 lea rax, [rbp + 0x160]
145921816: 4889442428 mov qword ptr [rsp + 0x28], rax
14592181b: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145921824: 4c8dbd10010000 lea r15, [rbp + 0x110]
14592182b: 4c8d8d88000000 lea r9, [rbp + 0x88]
145921832: 4c89f9 mov rcx, r15
145921835: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592183c: e88fcffaff call 0x1458ce7d0
145921841: 4889d9 mov rcx, rbx
145921844: 4c89fa mov rdx, r15
145921847: e8e4f739fb call 0x140cc1030
14592184c: f30f1086580a0000 movss xmm0, dword ptr [rsi + 0xa58]
145921854: 0f57c9 xorps xmm1, xmm1
145921857: 0f2ec8 ucomiss xmm1, xmm0
14592185a: 7236 jb 0x145921892
14592185c: 448b8650050000 mov r8d, dword ptr [rsi + 0x550]
145921863: 418d4001 lea eax, [r8 + 1]
145921867: 898650050000 mov dword ptr [rsi + 0x550], eax
14592186d: 488dbd10010000 lea rdi, [rbp + 0x110]
145921874: 4889f9 mov rcx, rdi
145921877: 4c89f2 mov rdx, r14
14592187a: e8b10efaff call 0x1458c2730
14592187f: 4889d9 mov rcx, rbx
145921882: 4889fa mov rdx, rdi
145921885: e8a6f739fb call 0x140cc1030
14592188a: f30f1086580a0000 movss xmm0, dword ptr [rsi + 0xa58]
145921892: f3440f58fe addss xmm15, xmm6
145921897: 0f28c8 movaps xmm1, xmm0
14592189a: f3410f5fcf maxss xmm1, xmm15
14592189f: 0f28d1 movaps xmm2, xmm1
1459218a2: f30fc2d103 cmpunordss xmm2, xmm1
1459218a7: 0f28da movaps xmm3, xmm2
1459218aa: 0f55d9 andnps xmm3, xmm1
1459218ad: 0f54d0 andps xmm2, xmm0
1459218b0: 0f56d3 orps xmm2, xmm3
1459218b3: f30f1196580a0000 movss dword ptr [rsi + 0xa58], xmm2
1459218bb: e968dfffff jmp 0x14591f828
1459218c0: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
1459218c7: 0f5c8dd0000000 subps xmm1, xmmword ptr [rbp + 0xd0]
1459218ce: 0f59c9 mulps xmm1, xmm1
1459218d1: f30f16c1 movshdup xmm0, xmm1
1459218d5: f30f58c1 addss xmm0, xmm1
1459218d9: f30f51c0 sqrtss xmm0, xmm0
1459218dd: 0f2e0590bb4800 ucomiss xmm0, dword ptr [rip + 0x48bb90]
1459218e4: 0f873edfffff ja 0x14591f828
1459218ea: f30f107104 movss xmm6, dword ptr [rcx + 4]
1459218ef: 8b19 mov ebx, dword ptr [rcx]
1459218f1: f30f101507924900 movss xmm2, dword ptr [rip + 0x499207]
1459218f9: f30f58d6 addss xmm2, xmm6
1459218fd: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145921905: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14592190b: 4889f1 mov rcx, rsi
14592190e: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145921915: 41b901000000 mov r9d, 1
14592191b: e8b0d8ffff call 0x14591f1d0
145921920: 4889f1 mov rcx, rsi
145921923: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14592192a: 4889fa mov rdx, rdi
14592192d: 4189d8 mov r8d, ebx
145921930: 0f28de movaps xmm3, xmm6
145921933: e868ddffff call 0x14591f6a0
145921938: c6853d01000024 mov byte ptr [rbp + 0x13d], 0x24
14592193f: 4c8d8d10010000 lea r9, [rbp + 0x110]
145921946: 4889f1 mov rcx, rsi
145921949: 0f28ce movaps xmm1, xmm6
14592194c: e93b260000 jmp 0x145923f8c
145921951: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145921958: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
14592195f: 4839d0 cmp rax, rdx
145921962: 0f8362310000 jae 0x145924aca
145921968: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
14592196f: f30f107104 movss xmm6, dword ptr [rcx + 4]
145921974: 448b39 mov r15d, dword ptr [rcx]
145921977: 488d0c18 lea rcx, [rax + rbx]
14592197b: f3440f58fe addss xmm15, xmm6
145921980: f3440f11bc18c8010000 movss dword ptr [rax + rbx + 0x1c8], xmm15
14592198a: e891b30700 call 0x14599cd20
14592198f: 4889c3 mov rbx, rax
145921992: 4989d6 mov r14, rdx
145921995: 4889f1 mov rcx, rsi
145921998: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14592199f: 4889fa mov rdx, rdi
1459219a2: 4589f8 mov r8d, r15d
1459219a5: 41b101 mov r9b, 1
1459219a8: e873c30200 call 0x14594dd20
1459219ad: 4489bd10010000 mov dword ptr [rbp + 0x110], r15d
1459219b4: c6853d01000025 mov byte ptr [rbp + 0x13d], 0x25
1459219bb: 4c8d8d10010000 lea r9, [rbp + 0x110]
1459219c2: 4889f1 mov rcx, rsi
1459219c5: 0f28ce movaps xmm1, xmm6
1459219c8: 4989f8 mov r8, rdi
1459219cb: e840d7ffff call 0x14591f110
1459219d0: 4881c620060000 add rsi, 0x620
1459219d7: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
1459219e1: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
1459219eb: 488d85c0000000 lea rax, [rbp + 0xc0]
1459219f2: 4889442430 mov qword ptr [rsp + 0x30], rax
1459219f7: 488d8560010000 lea rax, [rbp + 0x160]
1459219fe: 4889442428 mov qword ptr [rsp + 0x28], rax
145921a03: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145921a0c: 4c8da510010000 lea r12, [rbp + 0x110]
145921a13: 41b908000000 mov r9d, 8
145921a19: 4589f8 mov r8d, r15d
145921a1c: 4c89e1 mov rcx, r12
145921a1f: 4889fa mov rdx, rdi
145921a22: e8a9cdfaff call 0x1458ce7d0
145921a27: 4889f1 mov rcx, rsi
145921a2a: 4c89e2 mov rdx, r12
145921a2d: e8fef539fb call 0x140cc1030
145921a32: 488d3d47872e01 lea rdi, [rip + 0x12e8747]
145921a39: 41bf0f000000 mov r15d, 0xf
145921a3f: ba0f000000 mov edx, 0xf
145921a44: 4889f9 mov rcx, rdi
145921a47: e884c30600 call 0x14598ddd0
145921a4c: 4885c0 test rax, rax
145921a4f: 480f45f8 cmovne rdi, rax
145921a53: 490f44d7 cmove rdx, r15
145921a57: 4889542420 mov qword ptr [rsp + 0x20], rdx
145921a5c: 4c8dbd10010000 lea r15, [rbp + 0x110]
145921a63: 4c89f9 mov rcx, r15
145921a66: 4889da mov rdx, rbx
145921a69: 4d89f0 mov r8, r14
145921a6c: 4989f9 mov r9, rdi
145921a6f: e904160000 jmp 0x145923078
145921a74: 8b19 mov ebx, dword ptr [rcx]
145921a76: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145921a7b: f30f10158d6d4900 movss xmm2, dword ptr [rip + 0x496d8d]
145921a83: f30f58d6 addss xmm2, xmm6
145921a87: f20f107904 movsd xmm7, qword ptr [rcx + 4]
145921a8c: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145921a92: f3440f10a578010000 movss xmm12, dword ptr [rbp + 0x178]
145921a9b: f3440f11642420 movss dword ptr [rsp + 0x20], xmm12
145921aa2: 4889f1 mov rcx, rsi
145921aa5: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145921aac: 41b901000000 mov r9d, 1
145921ab2: e819d7ffff call 0x14591f1d0
145921ab7: 4889f1 mov rcx, rsi
145921aba: 4c8bb580010000 mov r14, qword ptr [rbp + 0x180]
145921ac1: 4c89f2 mov rdx, r14
145921ac4: 4189d8 mov r8d, ebx
145921ac7: 0f28de movaps xmm3, xmm6
145921aca: e8d1dbffff call 0x14591f6a0
145921acf: f20f100569722e01 movsd xmm0, qword ptr [rip + 0x12e7269]
145921ad7: 0f59c7 mulps xmm0, xmm7
145921ada: 0f138564010000 movlps qword ptr [rbp + 0x164], xmm0
145921ae1: c7856001000003000000 mov dword ptr [rbp + 0x160], 3
145921aeb: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145921af5: 488dbd10010000 lea rdi, [rbp + 0x110]
145921afc: 48897c2448 mov qword ptr [rsp + 0x48], rdi
145921b01: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145921b08: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
145921b0e: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
145921b15: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145921b1c: c744243800000000 mov dword ptr [rsp + 0x38], 0
145921b24: 4c8d8560010000 lea r8, [rbp + 0x160]
145921b2b: 4889f1 mov rcx, rsi
145921b2e: 4c89f2 mov rdx, r14
145921b31: 440f288d50010000 movaps xmm9, xmmword ptr [rbp + 0x150]
145921b39: 410f28d9 movaps xmm3, xmm9
145921b3d: e84ed9ffff call 0x14591f490
145921b42: 410f28c4 movaps xmm0, xmm12
145921b46: e8cc882e00 call 0x145c0a417
145921b4b: 440f28c0 movaps xmm8, xmm0
145921b4f: 410f28c4 movaps xmm0, xmm12
145921b53: e8b9882e00 call 0x145c0a411
145921b58: 440f14c0 unpcklps xmm8, xmm0
145921b5c: f30f12c7 movsldup xmm0, xmm7
145921b60: 410f59c0 mulps xmm0, xmm8
145921b64: 0f590505904900 mulps xmm0, xmmword ptr [rip + 0x499005]
145921b6b: 440f58c8 addps xmm9, xmm0
145921b6f: 440f138d10010000 movlps qword ptr [rbp + 0x110], xmm9
145921b77: f3440f119d18010000 movss dword ptr [rbp + 0x118], xmm11
145921b80: 48897c2420 mov qword ptr [rsp + 0x20], rdi
145921b85: 4889f1 mov rcx, rsi
145921b88: 0f28ce movaps xmm1, xmm6
145921b8b: 4d89f0 mov r8, r14
145921b8e: 4189d9 mov r9d, ebx
145921b91: e84a45ffff call 0x1459160e0
145921b96: e98ddcffff jmp 0x14591f828
145921b9b: 448b31 mov r14d, dword ptr [rcx]
145921b9e: 448b7904 mov r15d, dword ptr [rcx + 4]
145921ba2: f30f107908 movss xmm7, dword ptr [rcx + 8]
145921ba7: f3440f10490c movss xmm9, dword ptr [rcx + 0xc]
145921bad: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
145921bb3: f30f101da5b64800 movss xmm3, dword ptr [rip + 0x48b6a5]
145921bbb: f3440f58fb addss xmm15, xmm3
145921bc0: f3440f587910 addss xmm15, dword ptr [rcx + 0x10]
145921bc6: 4889f1 mov rcx, rsi
145921bc9: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145921bd0: 4589f0 mov r8d, r14d
145921bd3: e8c8daffff call 0x14591f6a0
145921bd8: 450f57e4 xorps xmm12, xmm12
145921bdc: f34d0f2ae7 cvtsi2ss xmm12, r15
145921be1: f3440f58257ef74800 addss xmm12, dword ptr [rip + 0x48f77e]
145921bea: f3440f592571b64800 mulss xmm12, dword ptr [rip + 0x48b671]
145921bf3: 488d9e90050000 lea rbx, [rsi + 0x590]
145921bfa: 450f57d2 xorps xmm10, xmm10
145921bfe: f3450f5cd4 subss xmm10, xmm12
145921c03: f3440f5915f4944900 mulss xmm10, dword ptr [rip + 0x4994f4]
145921c0c: f3440f589578010000 addss xmm10, dword ptr [rbp + 0x178]
145921c15: 410f28c2 movaps xmm0, xmm10
145921c19: e8f9872e00 call 0x145c0a417
145921c1e: 440f28c0 movaps xmm8, xmm0
145921c22: 410f28c2 movaps xmm0, xmm10
145921c26: e8e6872e00 call 0x145c0a411
145921c2b: 440f14c0 unpcklps xmm8, xmm0
145921c2f: 440f5905d92e6800 mulps xmm8, xmmword ptr [rip + 0x682ed9]
145921c37: 440f588550010000 addps xmm8, xmmword ptr [rbp + 0x150]
145921c3f: f3410f16d0 movshdup xmm2, xmm8
145921c44: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145921c4a: ffc7 inc edi
145921c4c: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
145921c52: f30f10b64c0a0000 movss xmm6, dword ptr [rsi + 0xa4c]
145921c5a: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
145921c61: 4883c110 add rcx, 0x10
145921c65: 410f28c8 movaps xmm1, xmm8
145921c69: e802dbf7ff call 0x14589f770
145921c6e: 440f28d0 movaps xmm10, xmm0
145921c72: 4c8ba6a0050000 mov r12, qword ptr [rsi + 0x5a0]
145921c79: 4c3ba690050000 cmp r12, qword ptr [rsi + 0x590]
145921c80: 7508 jne 0x145921c8a
145921c82: 4889d9 mov rcx, rbx
145921c85: e866be2e00 call 0x145c0daf0
145921c8a: f30f1005ceb54800 movss xmm0, dword ptr [rip + 0x48b5ce]
145921c92: f30f58c6 addss xmm0, xmm6
145921c96: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145921c9d: 4c89e0 mov rax, r12
145921ca0: 48c1e007 shl rax, 7
145921ca4: 48c7040100000000 mov qword ptr [rcx + rax], 0
145921cac: c744011003000000 mov dword ptr [rcx + rax + 0x10], 3
145921cb4: f3440f117c0114 movss dword ptr [rcx + rax + 0x14], xmm15
145921cbb: f30f100da1b54800 movss xmm1, dword ptr [rip + 0x48b5a1]
145921cc3: 0f134c0118 movlps qword ptr [rcx + rax + 0x18], xmm1
145921cc8: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145921ccf: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145921cd4: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
145921cdd: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145921ce5: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
145921ceb: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
145921cef: 440f13440140 movlps qword ptr [rcx + rax + 0x40], xmm8
145921cf5: f3440f11540148 movss dword ptr [rcx + rax + 0x48], xmm10
145921cfc: c744014c00000000 mov dword ptr [rcx + rax + 0x4c], 0
145921d04: f30f11740150 movss dword ptr [rcx + rax + 0x50], xmm6
145921d0a: f30f11440154 movss dword ptr [rcx + rax + 0x54], xmm0
145921d10: c744015800000000 mov dword ptr [rcx + rax + 0x58], 0
145921d18: 448974015c mov dword ptr [rcx + rax + 0x5c], r14d
145921d1d: f3440f11740160 movss dword ptr [rcx + rax + 0x60], xmm14
145921d24: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
145921d2c: 49ffc4 inc r12
145921d2f: 0f57c0 xorps xmm0, xmm0
145921d32: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
145921d37: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
145921d40: 4c89a6a0050000 mov qword ptr [rsi + 0x5a0], r12
145921d47: 0f848f2c0000 je 0x1459249dc
145921d4d: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145921d54: f3440f114c0170 movss dword ptr [rcx + rax + 0x70], xmm9
145921d5b: 4183ff02 cmp r15d, 2
145921d5f: 0f82c3daffff jb 0x14591f828
145921d65: 410f28f6 movaps xmm6, xmm14
145921d69: bf01000000 mov edi, 1
145921d6e: 450f57ed xorps xmm13, xmm13
145921d72: 4c8db510010000 lea r14, [rbp + 0x110]
145921d79: 89f8 mov eax, edi
145921d7b: 450f57d2 xorps xmm10, xmm10
145921d7f: f34c0f2ad0 cvtsi2ss xmm10, rax
145921d84: f3450f5cd4 subss xmm10, xmm12
145921d89: f3440f59156e934900 mulss xmm10, dword ptr [rip + 0x49936e]
145921d92: f3440f589578010000 addss xmm10, dword ptr [rbp + 0x178]
145921d9b: 410f28c2 movaps xmm0, xmm10
145921d9f: e873862e00 call 0x145c0a417
145921da4: 440f28c0 movaps xmm8, xmm0
145921da8: 410f28c2 movaps xmm0, xmm10
145921dac: e860862e00 call 0x145c0a411
145921db1: 440f14c0 unpcklps xmm8, xmm0
145921db5: 440f5905532d6800 mulps xmm8, xmmword ptr [rip + 0x682d53]
145921dbd: 440f588550010000 addps xmm8, xmmword ptr [rbp + 0x150]
145921dc5: f3450f16d8 movshdup xmm11, xmm8
145921dca: 448ba6500a0000 mov r12d, dword ptr [rsi + 0xa50]
145921dd1: 41ffc4 inc r12d
145921dd4: 4489a6500a0000 mov dword ptr [rsi + 0xa50], r12d
145921ddb: f3440f10b64c0a0000 movss xmm14, dword ptr [rsi + 0xa4c]
145921de4: 4c8baeb0090000 mov r13, qword ptr [rsi + 0x9b0]
145921deb: 498d4d10 lea rcx, [r13 + 0x10]
145921def: 410f28c8 movaps xmm1, xmm8
145921df3: 410f28d3 movaps xmm2, xmm11
145921df7: e844edf7ff call 0x1458a0b40
145921dfc: a801 test al, 1
145921dfe: 7406 je 0x145921e06
145921e00: 440f28d0 movaps xmm10, xmm0
145921e04: eb38 jmp 0x145921e3e
145921e06: 49837d68ff cmp qword ptr [r13 + 0x68], -1
145921e0b: 7428 je 0x145921e35
145921e0d: 498d5568 lea rdx, [r13 + 0x68]
145921e11: 4c89f1 mov rcx, r14
145921e14: 410f28d0 movaps xmm2, xmm8
145921e18: 410f28db movaps xmm3, xmm11
145921e1c: e83f2ff8ff call 0x1458a4d60
145921e21: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145921e28: 750b jne 0x145921e35
145921e2a: f3440f10951c010000 movss xmm10, dword ptr [rbp + 0x11c]
145921e33: eb09 jmp 0x145921e3e
145921e35: f3450f1095b8000000 movss xmm10, dword ptr [r13 + 0xb8]
145921e3e: 4c8baea0050000 mov r13, qword ptr [rsi + 0x5a0]
145921e45: 4c3bae90050000 cmp r13, qword ptr [rsi + 0x590]
145921e4c: 7508 jne 0x145921e56
145921e4e: 4889d9 mov rcx, rbx
145921e51: e89abc2e00 call 0x145c0daf0
145921e56: 410f28c6 movaps xmm0, xmm14
145921e5a: f30f5805feb34800 addss xmm0, dword ptr [rip + 0x48b3fe]
145921e62: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145921e69: 4c89e8 mov rax, r13
145921e6c: 48c1e007 shl rax, 7
145921e70: 48c7040100000000 mov qword ptr [rcx + rax], 0
145921e78: c744011003000000 mov dword ptr [rcx + rax + 0x10], 3
145921e80: f3440f117c0114 movss dword ptr [rcx + rax + 0x14], xmm15
145921e87: f30f100dd5b34800 movss xmm1, dword ptr [rip + 0x48b3d5]
145921e8f: 0f134c0118 movlps qword ptr [rcx + rax + 0x18], xmm1
145921e94: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145921e9b: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145921ea0: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
145921ea9: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145921eb1: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
145921eb7: 448964013c mov dword ptr [rcx + rax + 0x3c], r12d
145921ebc: 440f13440140 movlps qword ptr [rcx + rax + 0x40], xmm8
145921ec2: f3440f11540148 movss dword ptr [rcx + rax + 0x48], xmm10
145921ec9: c744014c00000000 mov dword ptr [rcx + rax + 0x4c], 0
145921ed1: f3440f11740150 movss dword ptr [rcx + rax + 0x50], xmm14
145921ed8: f30f11440154 movss dword ptr [rcx + rax + 0x54], xmm0
145921ede: 48c744015800000000 mov qword ptr [rcx + rax + 0x58], 0
145921ee7: f30f11740160 movss dword ptr [rcx + rax + 0x60], xmm6
145921eed: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
145921ef5: 49ffc5 inc r13
145921ef8: 440f116c0168 movups xmmword ptr [rcx + rax + 0x68], xmm13
145921efe: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
145921f07: 4c89aea0050000 mov qword ptr [rsi + 0x5a0], r13
145921f0e: 0f84c82a0000 je 0x1459249dc
145921f14: ffc7 inc edi
145921f16: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145921f1d: f3440f114c0170 movss dword ptr [rcx + rax + 0x70], xmm9
145921f24: 4139ff cmp r15d, edi
145921f27: 0f854cfeffff jne 0x145921d79
145921f2d: e9f6d8ffff jmp 0x14591f828
145921f32: 448b31 mov r14d, dword ptr [rcx]
145921f35: f20f107904 movsd xmm7, qword ptr [rcx + 4]
145921f3a: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145921f3f: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145921f45: 4889f1 mov rcx, rsi
145921f48: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145921f4f: 0f28d6 movaps xmm2, xmm6
145921f52: 4531c9 xor r9d, r9d
145921f55: e876d2ffff call 0x14591f1d0
145921f5a: 4889f1 mov rcx, rsi
145921f5d: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145921f64: 4589f0 mov r8d, r14d
145921f67: 0f28de movaps xmm3, xmm6
145921f6a: e831d7ffff call 0x14591f6a0
145921f6f: 488d9e90050000 lea rbx, [rsi + 0x590]
145921f76: 450f57c0 xorps xmm8, xmm8
145921f7a: f3440f588578010000 addss xmm8, dword ptr [rbp + 0x178]
145921f83: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145921f89: ffc7 inc edi
145921f8b: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
145921f91: f3440f108e4c0a0000 movss xmm9, dword ptr [rsi + 0xa4c]
145921f9a: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
145921fa1: 4883c110 add rcx, 0x10
145921fa5: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145921fac: 450f28e2 movaps xmm12, xmm10
145921fb0: 410f28d2 movaps xmm2, xmm10
145921fb4: e8b7d7f7ff call 0x14589f770
145921fb9: 440f28d0 movaps xmm10, xmm0
145921fbd: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
145921fc4: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
145921fcb: 7508 jne 0x145921fd5
145921fcd: 4889d9 mov rcx, rbx
145921fd0: e81bbb2e00 call 0x145c0daf0
145921fd5: 0f28c6 movaps xmm0, xmm6
145921fd8: f3410f58c1 addss xmm0, xmm9
145921fdd: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
145921fe4: 4c89f9 mov rcx, r15
145921fe7: 48c1e107 shl rcx, 7
145921feb: 48c7040800000000 mov qword ptr [rax + rcx], 0
145921ff3: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145921ffb: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145922002: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145922007: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145922010: c744083002000000 mov dword ptr [rax + rcx + 0x30], 2
145922018: 0f137c0834 movlps qword ptr [rax + rcx + 0x34], xmm7
14592201d: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
145922021: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145922028: 0f134c0840 movlps qword ptr [rax + rcx + 0x40], xmm1
14592202d: f3440f11540848 movss dword ptr [rax + rcx + 0x48], xmm10
145922034: f3440f1144084c movss dword ptr [rax + rcx + 0x4c], xmm8
14592203b: f3440f114c0850 movss dword ptr [rax + rcx + 0x50], xmm9
145922042: f30f11440854 movss dword ptr [rax + rcx + 0x54], xmm0
145922048: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
145922050: 448974085c mov dword ptr [rax + rcx + 0x5c], r14d
145922055: f3440f11740860 movss dword ptr [rax + rcx + 0x60], xmm14
14592205c: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145922064: 498d7f01 lea rdi, [r15 + 1]
145922068: 450f57c0 xorps xmm8, xmm8
14592206c: 440f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm8
145922072: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14592207b: 4889bea0050000 mov qword ptr [rsi + 0x5a0], rdi
145922082: f3440f100d3d8b4900 movss xmm9, dword ptr [rip + 0x498b3d]
14592208b: f3440f588d78010000 addss xmm9, dword ptr [rbp + 0x178]
145922094: 448bb6500a0000 mov r14d, dword ptr [rsi + 0xa50]
14592209b: 41ffc6 inc r14d
14592209e: 4489b6500a0000 mov dword ptr [rsi + 0xa50], r14d
1459220a5: f3440f109e4c0a0000 movss xmm11, dword ptr [rsi + 0xa4c]
1459220ae: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
1459220b5: 4883c110 add rcx, 0x10
1459220b9: 410f28d4 movaps xmm2, xmm12
1459220bd: e8aed6f7ff call 0x14589f770
1459220c2: 440f28d0 movaps xmm10, xmm0
1459220c6: 483bbe90050000 cmp rdi, qword ptr [rsi + 0x590]
1459220cd: 7508 jne 0x1459220d7
1459220cf: 4889d9 mov rcx, rbx
1459220d2: e819ba2e00 call 0x145c0daf0
1459220d7: 0f28c6 movaps xmm0, xmm6
1459220da: f3410f58c3 addss xmm0, xmm11
1459220df: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
1459220e6: 48c1e707 shl rdi, 7
1459220ea: 48c7043800000000 mov qword ptr [rax + rdi], 0
1459220f2: c744381000000000 mov dword ptr [rax + rdi + 0x10], 0
1459220fa: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
145922101: 48894c3820 mov qword ptr [rax + rdi + 0x20], rcx
145922106: 48c744382800000000 mov qword ptr [rax + rdi + 0x28], 0
14592210f: c744383002000000 mov dword ptr [rax + rdi + 0x30], 2
145922117: 0f137c3834 movlps qword ptr [rax + rdi + 0x34], xmm7
14592211c: 448974383c mov dword ptr [rax + rdi + 0x3c], r14d
145922121: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145922128: 0f134c3840 movlps qword ptr [rax + rdi + 0x40], xmm1
14592212d: f3440f11543848 movss dword ptr [rax + rdi + 0x48], xmm10
145922134: f3440f114c384c movss dword ptr [rax + rdi + 0x4c], xmm9
14592213b: f3440f115c3850 movss dword ptr [rax + rdi + 0x50], xmm11
145922142: f30f11443854 movss dword ptr [rax + rdi + 0x54], xmm0
145922148: 48c744385800000000 mov qword ptr [rax + rdi + 0x58], 0
145922151: f3440f11743860 movss dword ptr [rax + rdi + 0x60], xmm14
145922158: c74438640000807f mov dword ptr [rax + rdi + 0x64], 0x7f800000
145922160: 4d8d7702 lea r14, [r15 + 2]
145922164: 440f11443868 movups xmmword ptr [rax + rdi + 0x68], xmm8
14592216a: 48c744387700000000 mov qword ptr [rax + rdi + 0x77], 0
145922173: 4c89b6a0050000 mov qword ptr [rsi + 0x5a0], r14
14592217a: f3440f10051d8d4900 movss xmm8, dword ptr [rip + 0x498d1d]
145922183: f3440f588578010000 addss xmm8, dword ptr [rbp + 0x178]
14592218c: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145922192: ffc7 inc edi
145922194: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
14592219a: f3440f108e4c0a0000 movss xmm9, dword ptr [rsi + 0xa4c]
1459221a3: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
1459221aa: 4883c110 add rcx, 0x10
1459221ae: 410f28d4 movaps xmm2, xmm12
1459221b2: e8b9d5f7ff call 0x14589f770
1459221b7: 440f28d0 movaps xmm10, xmm0
1459221bb: 4c3bb690050000 cmp r14, qword ptr [rsi + 0x590]
1459221c2: 7508 jne 0x1459221cc
1459221c4: 4889d9 mov rcx, rbx
1459221c7: e824b92e00 call 0x145c0daf0
1459221cc: 0f28c6 movaps xmm0, xmm6
1459221cf: f3410f58c1 addss xmm0, xmm9
1459221d4: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
1459221db: 49c1e607 shl r14, 7
1459221df: 4ac7043000000000 mov qword ptr [rax + r14], 0
1459221e7: 42c744301000000000 mov dword ptr [rax + r14 + 0x10], 0
1459221f0: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
1459221f7: 4a894c3020 mov qword ptr [rax + r14 + 0x20], rcx
1459221fc: 4ac744302800000000 mov qword ptr [rax + r14 + 0x28], 0
145922205: 42c744303002000000 mov dword ptr [rax + r14 + 0x30], 2
14592220e: 420f137c3034 movlps qword ptr [rax + r14 + 0x34], xmm7
145922214: 42897c303c mov dword ptr [rax + r14 + 0x3c], edi
145922219: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145922220: 420f134c3040 movlps qword ptr [rax + r14 + 0x40], xmm1
145922226: f3460f11543048 movss dword ptr [rax + r14 + 0x48], xmm10
14592222d: f3460f1144304c movss dword ptr [rax + r14 + 0x4c], xmm8
145922234: f3460f114c3050 movss dword ptr [rax + r14 + 0x50], xmm9
14592223b: f3420f11443054 movss dword ptr [rax + r14 + 0x54], xmm0
145922242: 4ac744305800000000 mov qword ptr [rax + r14 + 0x58], 0
14592224b: f3460f11743060 movss dword ptr [rax + r14 + 0x60], xmm14
145922252: 42c74430640000807f mov dword ptr [rax + r14 + 0x64], 0x7f800000
14592225b: 498d7f03 lea rdi, [r15 + 3]
14592225f: 450f57c9 xorps xmm9, xmm9
145922263: 460f114c3068 movups xmmword ptr [rax + r14 + 0x68], xmm9
145922269: 4ac744307700000000 mov qword ptr [rax + r14 + 0x77], 0
145922272: 4889bea0050000 mov qword ptr [rsi + 0x5a0], rdi
145922279: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145922281: f30f5805a76a2e01 addss xmm0, dword ptr [rip + 0x12e6aa7]
145922289: f30f118578010000 movss dword ptr [rbp + 0x178], xmm0
145922291: 448bb6500a0000 mov r14d, dword ptr [rsi + 0xa50]
145922298: 41ffc6 inc r14d
14592229b: 4489b6500a0000 mov dword ptr [rsi + 0xa50], r14d
1459222a2: f3440f10964c0a0000 movss xmm10, dword ptr [rsi + 0xa4c]
1459222ab: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
1459222b2: 4883c110 add rcx, 0x10
1459222b6: 410f28d4 movaps xmm2, xmm12
1459222ba: e8b1d4f7ff call 0x14589f770
1459222bf: 440f28c0 movaps xmm8, xmm0
1459222c3: 483bbe90050000 cmp rdi, qword ptr [rsi + 0x590]
1459222ca: 7508 jne 0x1459222d4
1459222cc: 4889d9 mov rcx, rbx
1459222cf: e81cb82e00 call 0x145c0daf0
1459222d4: f3410f58f2 addss xmm6, xmm10
1459222d9: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
1459222e0: 48c1e707 shl rdi, 7
1459222e4: 48c7043800000000 mov qword ptr [rax + rdi], 0
1459222ec: c744381000000000 mov dword ptr [rax + rdi + 0x10], 0
1459222f4: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
1459222fb: 48894c3820 mov qword ptr [rax + rdi + 0x20], rcx
145922300: 48c744382800000000 mov qword ptr [rax + rdi + 0x28], 0
145922309: c744383002000000 mov dword ptr [rax + rdi + 0x30], 2
145922311: 0f137c3834 movlps qword ptr [rax + rdi + 0x34], xmm7
145922316: 448974383c mov dword ptr [rax + rdi + 0x3c], r14d
14592231b: 0f288550010000 movaps xmm0, xmmword ptr [rbp + 0x150]
145922322: 0f13443840 movlps qword ptr [rax + rdi + 0x40], xmm0
145922327: f3440f11443848 movss dword ptr [rax + rdi + 0x48], xmm8
14592232e: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145922336: f30f1144384c movss dword ptr [rax + rdi + 0x4c], xmm0
14592233c: f3440f11543850 movss dword ptr [rax + rdi + 0x50], xmm10
145922343: f30f11743854 movss dword ptr [rax + rdi + 0x54], xmm6
145922349: 48c744385800000000 mov qword ptr [rax + rdi + 0x58], 0
145922352: f3440f11743860 movss dword ptr [rax + rdi + 0x60], xmm14
145922359: c74438640000807f mov dword ptr [rax + rdi + 0x64], 0x7f800000
145922361: 4983c704 add r15, 4
145922365: 440f114c3868 movups xmmword ptr [rax + rdi + 0x68], xmm9
14592236b: 48c744387700000000 mov qword ptr [rax + rdi + 0x77], 0
145922374: 4c89bea0050000 mov qword ptr [rsi + 0x5a0], r15
14592237b: e9a8d4ffff jmp 0x14591f828
145922380: 8b19 mov ebx, dword ptr [rcx]
145922382: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
145922387: f20f107904 movsd xmm7, qword ptr [rcx + 4]
14592238c: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145922392: f3440f108578010000 movss xmm8, dword ptr [rbp + 0x178]
14592239b: f3440f11442420 movss dword ptr [rsp + 0x20], xmm8
1459223a2: 4889f1 mov rcx, rsi
1459223a5: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
1459223ac: 0f28d6 movaps xmm2, xmm6
1459223af: 41b901000000 mov r9d, 1
1459223b5: e816ceffff call 0x14591f1d0
1459223ba: 4889f1 mov rcx, rsi
1459223bd: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
1459223c4: 4889fa mov rdx, rdi
1459223c7: 4189d8 mov r8d, ebx
1459223ca: 0f28de movaps xmm3, xmm6
1459223cd: e8ced2ffff call 0x14591f6a0
1459223d2: f20f11bd64010000 movsd qword ptr [rbp + 0x164], xmm7
1459223da: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
1459223e4: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
1459223ee: 488d8510010000 lea rax, [rbp + 0x110]
1459223f5: 4889442448 mov qword ptr [rsp + 0x48], rax
1459223fa: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145922401: 895c2438 mov dword ptr [rsp + 0x38], ebx
145922405: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
14592240b: f3440f11442428 movss dword ptr [rsp + 0x28], xmm8
145922412: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145922419: 4c8d8560010000 lea r8, [rbp + 0x160]
145922420: 4889f1 mov rcx, rsi
145922423: 4889fa mov rdx, rdi
145922426: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
14592242d: e85ed0ffff call 0x14591f490
145922432: e9f1d3ffff jmp 0x14591f828
145922437: 8b01 mov eax, dword ptr [rcx]
145922439: 898550010000 mov dword ptr [rbp + 0x150], eax
14592243f: 0f107104 movups xmm6, xmmword ptr [rcx + 4]
145922443: f3440f108578010000 movss xmm8, dword ptr [rbp + 0x178]
14592244c: 410f28c0 movaps xmm0, xmm8
145922450: e8c27f2e00 call 0x145c0a417
145922455: 0f28f8 movaps xmm7, xmm0
145922458: 410f28c0 movaps xmm0, xmm8
14592245c: e8b07f2e00 call 0x145c0a411
145922461: 0f14f8 unpcklps xmm7, xmm0
145922464: f30f12c6 movsldup xmm0, xmm6
145922468: 0f59c7 mulps xmm0, xmm7
14592246b: 0f5885d0000000 addps xmm0, xmmword ptr [rbp + 0xd0]
145922472: 0f1385c0000000 movlps qword ptr [rbp + 0xc0], xmm0
145922479: f3440f119dc8000000 movss dword ptr [rbp + 0xc8], xmm11
145922482: 4c8bb6b0090000 mov r14, qword ptr [rsi + 0x9b0]
145922489: 49837e40ff cmp qword ptr [r14 + 0x40], -1
14592248e: 0f84051b0000 je 0x145923f99
145922494: 4983c640 add r14, 0x40
145922498: 488d4d30 lea rcx, [rbp + 0x30]
14592249c: 4c8d45f0 lea r8, [rbp - 0x10]
1459224a0: 4c8d8dc0000000 lea r9, [rbp + 0xc0]
1459224a7: 4c89f2 mov rdx, r14
1459224aa: e8916d0800 call 0x1459a9240
1459224af: 4c8bb6b0090000 mov r14, qword ptr [rsi + 0x9b0]
1459224b6: e9f21a0000 jmp 0x145923fad
1459224bb: 8b19 mov ebx, dword ptr [rcx]
1459224bd: f3440f104104 movss xmm8, dword ptr [rcx + 4]
1459224c3: f3440f104908 movss xmm9, dword ptr [rcx + 8]
1459224c9: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
1459224ce: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
1459224d3: 31ff xor edi, edi
1459224d5: 4889f1 mov rcx, rsi
1459224d8: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
1459224df: 0f28d6 movaps xmm2, xmm6
1459224e2: 4531c9 xor r9d, r9d
1459224e5: e8e6ccffff call 0x14591f1d0
1459224ea: 4889f1 mov rcx, rsi
1459224ed: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459224f4: 4189d8 mov r8d, ebx
1459224f7: 0f28de movaps xmm3, xmm6
1459224fa: e8a1d1ffff call 0x14591f6a0
1459224ff: 0f57c0 xorps xmm0, xmm0
145922502: 440f2ec0 ucomiss xmm8, xmm0
145922506: 0f8620180000 jbe 0x145923d2c
14592250c: f3440f114d14 movss dword ptr [rbp + 0x14], xmm9
145922512: bf01000000 mov edi, 1
145922517: e914180000 jmp 0x145923d30
14592251c: 8b19 mov ebx, dword ptr [rcx]
14592251e: 8b7904 mov edi, dword ptr [rcx + 4]
145922521: f3440f104108 movss xmm8, dword ptr [rcx + 8]
145922527: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
14592252c: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
145922531: f3440f104914 movss xmm9, dword ptr [rcx + 0x14]
145922537: f3440f105918 movss xmm11, dword ptr [rcx + 0x18]
14592253d: f3440f10511c movss xmm10, dword ptr [rcx + 0x1c]
145922543: 4889f1 mov rcx, rsi
145922546: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592254d: 4189d8 mov r8d, ebx
145922550: 0f28df movaps xmm3, xmm7
145922553: e848d1ffff call 0x14591f6a0
145922558: 31c0 xor eax, eax
14592255a: 0f57c0 xorps xmm0, xmm0
14592255d: 440f2ed8 ucomiss xmm11, xmm0
145922561: 7625 jbe 0x145922588
145922563: 410f28c7 movaps xmm0, xmm15
145922567: f30f58c7 addss xmm0, xmm7
14592256b: f3410f58c3 addss xmm0, xmm11
145922570: f3450f59d6 mulss xmm10, xmm14
145922575: f30f114500 movss dword ptr [rbp], xmm0
14592257a: f3440f115504 movss dword ptr [rbp + 4], xmm10
145922580: 897d08 mov dword ptr [rbp + 8], edi
145922583: b802000000 mov eax, 2
145922588: 8945fc mov dword ptr [rbp - 4], eax
14592258b: f3440f118514010000 movss dword ptr [rbp + 0x114], xmm8
145922594: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
14592259e: f3450f59f1 mulss xmm14, xmm9
1459225a3: 488d45fc lea rax, [rbp - 4]
1459225a7: 4889442448 mov qword ptr [rsp + 0x48], rax
1459225ac: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
1459225b3: 895c2438 mov dword ptr [rsp + 0x38], ebx
1459225b7: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
1459225bd: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
1459225c4: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1459225ca: c744242800000000 mov dword ptr [rsp + 0x28], 0
1459225d2: 4c8d8510010000 lea r8, [rbp + 0x110]
1459225d9: 4889f1 mov rcx, rsi
1459225dc: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459225e3: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
1459225ea: e8a1ceffff call 0x14591f490
1459225ef: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
1459225f6: 4839d0 cmp rax, rdx
1459225f9: 0f83dc240000 jae 0x145924adb
1459225ff: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145922606: f30f583d46f44c00 addss xmm7, dword ptr [rip + 0x4cf446]
14592260e: 0f28c6 movaps xmm0, xmm6
145922611: f30f5dc7 minss xmm0, xmm7
145922615: 0f28c8 movaps xmm1, xmm0
145922618: f30fc2c803 cmpunordss xmm1, xmm0
14592261d: 0f28d1 movaps xmm2, xmm1
145922620: 0f55d0 andnps xmm2, xmm0
145922623: 0f54ce andps xmm1, xmm6
145922626: 0f56ca orps xmm1, xmm2
145922629: 0f57c0 xorps xmm0, xmm0
14592262c: f30f5fc8 maxss xmm1, xmm0
145922630: 48c1e007 shl rax, 7
145922634: f3440f58f9 addss xmm15, xmm1
145922639: f3440f117c0158 movss dword ptr [rcx + rax + 0x58], xmm15
145922640: e9e3d1ffff jmp 0x14591f828
145922645: 448b01 mov r8d, dword ptr [rcx]
145922648: 448b7104 mov r14d, dword ptr [rcx + 4]
14592264c: f30f104108 movss xmm0, dword ptr [rcx + 8]
145922651: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
145922659: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14592265e: f30f118550010000 movss dword ptr [rbp + 0x150], xmm0
145922666: f30f105910 movss xmm3, dword ptr [rcx + 0x10]
14592266b: f30f104114 movss xmm0, dword ptr [rcx + 0x14]
145922670: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
145922678: 4889f1 mov rcx, rsi
14592267b: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145922682: 44898578010000 mov dword ptr [rbp + 0x178], r8d
145922689: f30f119db8000000 movss dword ptr [rbp + 0xb8], xmm3
145922691: e80ad0ffff call 0x14591f6a0
145922696: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
14592269d: f30f1015fbf04800 movss xmm2, dword ptr [rip + 0x48f0fb]
1459226a5: 0f57c9 xorps xmm1, xmm1
1459226a8: e8e3060a00 call 0x1459c2d90
1459226ad: 4183fe01 cmp r14d, 1
1459226b1: 4183d600 adc r14d, 0
1459226b5: 440f28c8 movaps xmm9, xmm0
1459226b9: f34d0f2afe cvtsi2ss xmm15, r14
1459226be: 4531ed xor r13d, r13d
1459226c1: f3440f10059eec4800 movss xmm8, dword ptr [rip + 0x48ec9e]
1459226ca: f30f10353e614900 movss xmm6, dword ptr [rip + 0x49613e]
1459226d2: f3440f102db5f34c00 movss xmm13, dword ptr [rip + 0x4cf3b5]
1459226db: f3440f10357cab4800 movss xmm14, dword ptr [rip + 0x48ab7c]
1459226e4: 4c8d2545ff2c01 lea r12, [rip + 0x12cff45]
1459226eb: e9db000000 jmp 0x1459227cb
1459226f0: 488d8e90050000 lea rcx, [rsi + 0x590]
1459226f7: e8f4b32e00 call 0x145c0daf0
1459226fc: 41ffc5 inc r13d
1459226ff: f30f1085b8000000 movss xmm0, dword ptr [rbp + 0xb8]
145922707: f30f58c7 addss xmm0, xmm7
14592270b: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
145922712: 4c89f9 mov rcx, r15
145922715: 48c1e107 shl rcx, 7
145922719: 48c7040800000000 mov qword ptr [rax + rcx], 0
145922721: c744081005000000 mov dword ptr [rax + rcx + 0x10], 5
145922729: f30f108d0c010000 movss xmm1, dword ptr [rbp + 0x10c]
145922731: f30f114c0814 movss dword ptr [rax + rcx + 0x14], xmm1
145922737: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592273e: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145922743: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14592274c: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
145922754: f30f108de0000000 movss xmm1, dword ptr [rbp + 0xe0]
14592275c: f30f114c0834 movss dword ptr [rax + rcx + 0x34], xmm1
145922762: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
145922766: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
14592276c: f3440f115c0848 movss dword ptr [rax + rcx + 0x48], xmm11
145922773: c744084c00000000 mov dword ptr [rax + rcx + 0x4c], 0
14592277b: f30f117c0850 movss dword ptr [rax + rcx + 0x50], xmm7
145922781: f30f11440854 movss dword ptr [rax + rcx + 0x54], xmm0
145922787: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
14592278f: 8b9578010000 mov edx, dword ptr [rbp + 0x178]
145922795: 8954085c mov dword ptr [rax + rcx + 0x5c], edx
145922799: f20f10058faf8d00 movsd xmm0, qword ptr [rip + 0x8daf8f]
1459227a1: f20f11440860 movsd qword ptr [rax + rcx + 0x60], xmm0
1459227a7: 49ffc7 inc r15
1459227aa: 0f57c0 xorps xmm0, xmm0
1459227ad: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
1459227b2: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
1459227bb: 4c89bea0050000 mov qword ptr [rsi + 0x5a0], r15
1459227c2: 4539f5 cmp r13d, r14d
1459227c5: 0f8411020000 je 0x1459229dc
1459227cb: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
1459227d2: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
1459227d9: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
1459227e0: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
1459227e7: 660f1f840000000000 nop word ptr [rax + rax]
1459227f0: 4e8d0c02 lea r9, [rdx + r8]
1459227f4: 49c1c117 rol r9, 0x17
1459227f8: 4901d1 add r9, rdx
1459227fb: 4989c2 mov r10, rax
1459227fe: 49c1e211 shl r10, 0x11
145922802: 4831d1 xor rcx, rdx
145922805: 4931c0 xor r8, rax
145922808: 4831c8 xor rax, rcx
14592280b: 4c31c2 xor rdx, r8
14592280e: 4c31d1 xor rcx, r10
145922811: 49c1c02d rol r8, 0x2d
145922815: 49c1e929 shr r9, 0x29
145922819: 4181c90000803f or r9d, 0x3f800000
145922820: 66410f6ef9 movd xmm7, r9d
145922825: f3410f58f8 addss xmm7, xmm8
14592282a: f30f59fe mulss xmm7, xmm6
14592282e: f3410f58fd addss xmm7, xmm13
145922833: 440f2ef7 ucomiss xmm14, xmm7
145922837: 76b7 jbe 0x1459227f0
145922839: 4589e9 mov r9d, r13d
14592283c: f34d0f2ad1 cvtsi2ss xmm10, r9
145922841: f3450f5ed7 divss xmm10, xmm15
145922846: f3440f591551ef4800 mulss xmm10, dword ptr [rip + 0x48ef51]
14592284f: f3450f58d1 addss xmm10, xmm9
145922854: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
14592285b: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
145922862: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
145922869: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
145922870: f30f59bd50010000 mulss xmm7, dword ptr [rbp + 0x150]
145922878: 410f28c2 movaps xmm0, xmm10
14592287c: e8967b2e00 call 0x145c0a417
145922881: 440f28d8 movaps xmm11, xmm0
145922885: 410f28c2 movaps xmm0, xmm10
145922889: e8837b2e00 call 0x145c0a411
14592288e: 440f28d0 movaps xmm10, xmm0
145922892: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
145922899: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
1459228a0: e81b65f7ff call 0x145898dc0
1459228a5: 4869f8f0000000 imul rdi, rax, 0xf0
1459228ac: 450f14da unpcklps xmm11, xmm10
1459228b0: f3440f12d7 movsldup xmm10, xmm7
1459228b5: 450f59d3 mulps xmm10, xmm11
1459228b9: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
1459228c1: f2420f10bc27c8000000 movsd xmm7, qword ptr [rdi + r12 + 0xc8]
1459228cb: 450f28da movaps xmm11, xmm10
1459228cf: 440f5cdf subps xmm11, xmm7
1459228d3: f3410f16cb movshdup xmm1, xmm11
1459228d8: 410f28c3 movaps xmm0, xmm11
1459228dc: e84e7b2e00 call 0x145c0a42f
1459228e1: f3420f108c27d8000000 movss xmm1, dword ptr [rdi + r12 + 0xd8]
1459228eb: f30f580d7ded8e00 addss xmm1, dword ptr [rip + 0x8eed7d]
1459228f3: f30f1015a1874900 movss xmm2, dword ptr [rip + 0x4987a1]
1459228fb: 0f2ed0 ucomiss xmm2, xmm0
1459228fe: 771c ja 0x14592291c
145922900: 0f2ec8 ucomiss xmm1, xmm0
145922903: 7317 jae 0x14592291c
145922905: f30f12c0 movsldup xmm0, xmm0
145922909: 440f5ed8 divps xmm11, xmm0
14592290d: f30f12c1 movsldup xmm0, xmm1
145922911: 410f59c3 mulps xmm0, xmm11
145922915: 0f58f8 addps xmm7, xmm0
145922918: 440f28d7 movaps xmm10, xmm7
14592291c: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145922922: ffc7 inc edi
145922924: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
14592292a: f30f10be4c0a0000 movss xmm7, dword ptr [rsi + 0xa4c]
145922932: 4c8bbeb0090000 mov r15, qword ptr [rsi + 0x9b0]
145922939: 498d4f10 lea rcx, [r15 + 0x10]
14592293d: f3450f16e2 movshdup xmm12, xmm10
145922942: 410f28ca movaps xmm1, xmm10
145922946: 410f28d4 movaps xmm2, xmm12
14592294a: e8f1e1f7ff call 0x1458a0b40
14592294f: a801 test al, 1
145922951: 741d je 0x145922970
145922953: 440f28d8 movaps xmm11, xmm0
145922957: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
14592295e: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
145922965: 0f8591fdffff jne 0x1459226fc
14592296b: e980fdffff jmp 0x1459226f0
145922970: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145922975: 7443 je 0x1459229ba
145922977: 498d5768 lea rdx, [r15 + 0x68]
14592297b: 488d8d10010000 lea rcx, [rbp + 0x110]
145922982: 410f28d2 movaps xmm2, xmm10
145922986: 410f28dc movaps xmm3, xmm12
14592298a: e8d123f8ff call 0x1458a4d60
14592298f: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145922996: 7522 jne 0x1459229ba
145922998: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
1459229a1: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
1459229a8: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
1459229af: 0f8547fdffff jne 0x1459226fc
1459229b5: e936fdffff jmp 0x1459226f0
1459229ba: f3450f109fb8000000 movss xmm11, dword ptr [r15 + 0xb8]
1459229c3: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
1459229ca: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
1459229d1: 0f8525fdffff jne 0x1459226fc
1459229d7: e914fdffff jmp 0x1459226f0
1459229dc: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
1459229e3: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
1459229ea: 4839d1 cmp rcx, rdx
1459229ed: 0f83f9200000 jae 0x145924aec
1459229f3: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
1459229fa: 4889d9 mov rcx, rbx
1459229fd: e81ea30700 call 0x14599cd20
145922a02: 4889c7 mov rdi, rax
145922a05: 4889d3 mov rbx, rdx
145922a08: 4881c620060000 add rsi, 0x620
145922a0f: 4c8d35ba792e01 lea r14, [rip + 0x12e79ba]
145922a16: 41bf20000000 mov r15d, 0x20
145922a1c: ba20000000 mov edx, 0x20
145922a21: e927060000 jmp 0x14592304d
145922a26: 448b31 mov r14d, dword ptr [rcx]
145922a29: f30f107904 movss xmm7, dword ptr [rcx + 4]
145922a2e: 450f28ca movaps xmm9, xmm10
145922a32: f3440f105108 movss xmm10, dword ptr [rcx + 8]
145922a38: f3440f597110 mulss xmm14, dword ptr [rcx + 0x10]
145922a3e: f3440f104114 movss xmm8, dword ptr [rcx + 0x14]
145922a44: f3450f58fa addss xmm15, xmm10
145922a49: f3440f58790c addss xmm15, dword ptr [rcx + 0xc]
145922a4f: 4889f1 mov rcx, rsi
145922a52: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145922a59: 4889fa mov rdx, rdi
145922a5c: 4589f0 mov r8d, r14d
145922a5f: 410f28da movaps xmm3, xmm10
145922a63: e838ccffff call 0x14591f6a0
145922a68: 410f28c5 movaps xmm0, xmm13
145922a6c: 410f28cc movaps xmm1, xmm12
145922a70: e8ba792e00 call 0x145c0a42f
145922a75: 0f28f0 movaps xmm6, xmm0
145922a78: f30f5f35e0a74800 maxss xmm6, dword ptr [rip + 0x48a7e0]
145922a80: f30f11b564010000 movss dword ptr [rbp + 0x164], xmm6
145922a88: c78568010000cdcccc3f mov dword ptr [rbp + 0x168], 0x3fcccccd
145922a92: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
145922a9c: f30f11bd14010000 movss dword ptr [rbp + 0x114], xmm7
145922aa4: f3440f11bd18010000 movss dword ptr [rbp + 0x118], xmm15
145922aad: f3440f11851c010000 movss dword ptr [rbp + 0x11c], xmm8
145922ab6: c7851001000006000000 mov dword ptr [rbp + 0x110], 6
145922ac0: 488d8510010000 lea rax, [rbp + 0x110]
145922ac7: 4889442448 mov qword ptr [rsp + 0x48], rax
145922acc: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145922ad3: 4489742438 mov dword ptr [rsp + 0x38], r14d
145922ad8: f3440f11542430 movss dword ptr [rsp + 0x30], xmm10
145922adf: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145922ae7: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
145922aed: f3440f114c2420 movss dword ptr [rsp + 0x20], xmm9
145922af4: 4c8d8560010000 lea r8, [rbp + 0x160]
145922afb: 4889f1 mov rcx, rsi
145922afe: 4889fa mov rdx, rdi
145922b01: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
145922b08: e883c9ffff call 0x14591f490
145922b0d: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
145922b14: 4839d0 cmp rax, rdx
145922b17: 0f8317200000 jae 0x145924b34
145922b1d: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145922b24: 4989c0 mov r8, rax
145922b27: 49c1e007 shl r8, 7
145922b2b: 42c644017c01 mov byte ptr [rcx + r8 + 0x7c], 1
145922b31: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
145922b38: 4839d0 cmp rax, rdx
145922b3b: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145922b42: 0f8361200000 jae 0x145924ba9
145922b48: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
145922b4f: f3420f11740078 movss dword ptr [rax + r8 + 0x78], xmm6
145922b56: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145922b5d: 4839d1 cmp rcx, rdx
145922b60: 0f837e200000 jae 0x145924be4
145922b66: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
145922b6d: 4889d9 mov rcx, rbx
145922b70: e8aba10700 call 0x14599cd20
145922b75: 4889c7 mov rdi, rax
145922b78: 4889d3 mov rbx, rdx
145922b7b: 4881c620060000 add rsi, 0x620
145922b82: 4c8d3567762e01 lea r14, [rip + 0x12e7667]
145922b89: 41bf2d000000 mov r15d, 0x2d
145922b8f: ba2d000000 mov edx, 0x2d
145922b94: e9b4040000 jmp 0x14592304d
145922b99: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
145922ba0: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145922ba7: 483995f0000000 cmp qword ptr [rbp + 0xf0], rdx
145922bae: 0f83911f0000 jae 0x145924b45
145922bb4: 488b4110 mov rax, qword ptr [rcx + 0x10]
145922bb8: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
145922bbf: 448b29 mov r13d, dword ptr [rcx]
145922bc2: 4c8d6104 lea r12, [rcx + 4]
145922bc6: f30f10411c movss xmm0, dword ptr [rcx + 0x1c]
145922bcb: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
145922bd3: 8b4118 mov eax, dword ptr [rcx + 0x18]
145922bd6: 83f801 cmp eax, 1
145922bd9: 83d000 adc eax, 0
145922bdc: f30f104124 movss xmm0, dword ptr [rcx + 0x24]
145922be1: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
145922be9: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
145922bf0: 0f57c0 xorps xmm0, xmm0
145922bf3: f3480f2ac0 cvtsi2ss xmm0, rax
145922bf8: f30f104920 movss xmm1, dword ptr [rcx + 0x20]
145922bfd: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
145922c04: f30f101558a64800 movss xmm2, dword ptr [rip + 0x48a658]
145922c0c: f30f59d0 mulss xmm2, xmm0
145922c10: f30f115540 movss dword ptr [rbp + 0x40], xmm2
145922c15: f3440f103d82824900 movss xmm15, dword ptr [rip + 0x498282]
145922c1e: f3440f5ef8 divss xmm15, xmm0
145922c23: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145922c2a: f30f598c085c010000 mulss xmm1, dword ptr [rax + rcx + 0x15c]
145922c33: f30f118dcc000000 movss dword ptr [rbp + 0xcc], xmm1
145922c3b: f3440f108db0000000 movss xmm9, dword ptr [rbp + 0xb0]
145922c44: 660f6f8550010000 movdqa xmm0, xmmword ptr [rbp + 0x150]
145922c4c: 660f7ec1 movd ecx, xmm0
145922c50: 66440f7ed0 movd eax, xmm10
145922c55: 48c1e020 shl rax, 0x20
145922c59: 4809c1 or rcx, rax
145922c5c: 48894d50 mov qword ptr [rbp + 0x50], rcx
145922c60: 410f28c1 movaps xmm0, xmm9
145922c64: f3410f5cc1 subss xmm0, xmm9
145922c69: f30f114560 movss dword ptr [rbp + 0x60], xmm0
145922c6e: 4531ff xor r15d, r15d
145922c71: f3440f101deee64800 movss xmm11, dword ptr [rip + 0x48e6ee]
145922c7a: f3440f102545602e01 movss xmm12, dword ptr [rip + 0x12e6045]
145922c83: f30f103da5ea4800 movss xmm7, dword ptr [rip + 0x48eaa5]
145922c8b: f3440f102dcca54800 movss xmm13, dword ptr [rip + 0x48a5cc]
145922c94: e981000000 jmp 0x145922d1a
145922c99: 41ffc7 inc r15d
145922c9c: 0f13b560010000 movlps qword ptr [rbp + 0x160], xmm6
145922ca3: f30f118568010000 movss dword ptr [rbp + 0x168], xmm0
145922cab: 4489ad10010000 mov dword ptr [rbp + 0x110], r13d
145922cb2: 418b442408 mov eax, dword ptr [r12 + 8]
145922cb7: 488d8d14010000 lea rcx, [rbp + 0x114]
145922cbe: 894108 mov dword ptr [rcx + 8], eax
145922cc1: 498b0424 mov rax, qword ptr [r12]
145922cc5: 488901 mov qword ptr [rcx], rax
145922cc8: f30f10850c010000 movss xmm0, dword ptr [rbp + 0x10c]
145922cd0: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
145922cd6: f30f1085cc000000 movss xmm0, dword ptr [rbp + 0xcc]
145922cde: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
145922ce4: 488d8560010000 lea rax, [rbp + 0x160]
145922ceb: 4889442420 mov qword ptr [rsp + 0x20], rax
145922cf0: 4889f1 mov rcx, rsi
145922cf3: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145922cfa: 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
145922d01: 4c8d8d10010000 lea r9, [rbp + 0x110]
145922d08: e88334ffff call 0x145916190
145922d0d: 443bbdb8000000 cmp r15d, dword ptr [rbp + 0xb8]
145922d14: 0f84b80f0000 je 0x145923cd2
145922d1a: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
145922d21: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
145922d28: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
145922d2f: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
145922d36: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145922d40: 4e8d0c02 lea r9, [rdx + r8]
145922d44: 49c1c117 rol r9, 0x17
145922d48: 4901d1 add r9, rdx
145922d4b: 4989c2 mov r10, rax
145922d4e: 49c1e211 shl r10, 0x11
145922d52: 4831d1 xor rcx, rdx
145922d55: 4931c0 xor r8, rax
145922d58: 4831c8 xor rax, rcx
145922d5b: 4c31c2 xor rdx, r8
145922d5e: 4c31d1 xor rcx, r10
145922d61: 49c1c02d rol r8, 0x2d
145922d65: 49c1e929 shr r9, 0x29
145922d69: 4181c90000803f or r9d, 0x3f800000
145922d70: 66450f6ed1 movd xmm10, r9d
145922d75: f3450f58d3 addss xmm10, xmm11
145922d7a: f3450f59d4 mulss xmm10, xmm12
145922d7f: f3440f58d7 addss xmm10, xmm7
145922d84: 450f2eea ucomiss xmm13, xmm10
145922d88: 76b6 jbe 0x145922d40
145922d8a: 4589f9 mov r9d, r15d
145922d8d: 0f57f6 xorps xmm6, xmm6
145922d90: f3490f2af1 cvtsi2ss xmm6, r9
145922d95: f30f5835c7a44800 addss xmm6, dword ptr [rip + 0x48a4c7]
145922d9d: f30f5c7540 subss xmm6, dword ptr [rbp + 0x40]
145922da2: f3410f59f7 mulss xmm6, xmm15
145922da7: f30f58b578010000 addss xmm6, dword ptr [rbp + 0x178]
145922daf: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
145922db6: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
145922dbd: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
145922dc4: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
145922dcb: f3440f5995e0000000 mulss xmm10, dword ptr [rbp + 0xe0]
145922dd4: 0f28c6 movaps xmm0, xmm6
145922dd7: e83b762e00 call 0x145c0a417
145922ddc: 440f28c0 movaps xmm8, xmm0
145922de0: 0f28c6 movaps xmm0, xmm6
145922de3: e829762e00 call 0x145c0a411
145922de8: 440f14c0 unpcklps xmm8, xmm0
145922dec: f3410f12f2 movsldup xmm6, xmm10
145922df1: 410f59f0 mulps xmm6, xmm8
145922df5: 0f58b550010000 addps xmm6, xmmword ptr [rbp + 0x150]
145922dfc: 4c8bb6b0090000 mov r14, qword ptr [rsi + 0x9b0]
145922e03: 49837e40ff cmp qword ptr [r14 + 0x40], -1
145922e08: 0f8488000000 je 0x145922e96
145922e0e: 4983c640 add r14, 0x40
145922e12: 66410f7ef0 movd r8d, xmm6
145922e17: f30f16c6 movshdup xmm0, xmm6
145922e1b: 660f7ec0 movd eax, xmm0
145922e1f: 48c1e020 shl rax, 0x20
145922e23: 4909c0 or r8, rax
145922e26: 4c89f1 mov rcx, r14
145922e29: 488b5550 mov rdx, qword ptr [rbp + 0x50]
145922e2d: e85e5b0800 call 0x1459a8990
145922e32: 410f2ec5 ucomiss xmm0, xmm13
145922e36: 7364 jae 0x145922e9c
145922e38: 440f28c0 movaps xmm8, xmm0
145922e3c: 0f289550010000 movaps xmm2, xmmword ptr [rbp + 0x150]
145922e43: 0f28c2 movaps xmm0, xmm2
145922e46: 0f5cc6 subps xmm0, xmm6
145922e49: 0f59c0 mulps xmm0, xmm0
145922e4c: f30f16c8 movshdup xmm1, xmm0
145922e50: f30f58c8 addss xmm1, xmm0
145922e54: 0f57c0 xorps xmm0, xmm0
145922e57: f30f51c1 sqrtss xmm0, xmm1
145922e5b: f30f100d01a44800 movss xmm1, dword ptr [rip + 0x48a401]
145922e63: f30f5fc1 maxss xmm0, xmm1
145922e67: f30f5ec8 divss xmm1, xmm0
145922e6b: f3440f5cc1 subss xmm8, xmm1
145922e70: 0f57c0 xorps xmm0, xmm0
145922e73: f3440f5fc0 maxss xmm8, xmm0
145922e78: 0f5cf2 subps xmm6, xmm2
145922e7b: f3410f12c0 movsldup xmm0, xmm8
145922e80: 0f59c6 mulps xmm0, xmm6
145922e83: 0f58c2 addps xmm0, xmm2
145922e86: f3440f594560 mulss xmm8, dword ptr [rbp + 0x60]
145922e8c: f3450f58c1 addss xmm8, xmm9
145922e91: 0f28f0 movaps xmm6, xmm0
145922e94: eb0a jmp 0x145922ea0
145922e96: 450f28c1 movaps xmm8, xmm9
145922e9a: eb0b jmp 0x145922ea7
145922e9c: 450f28c1 movaps xmm8, xmm9
145922ea0: 4c8bb6b0090000 mov r14, qword ptr [rsi + 0x9b0]
145922ea7: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
145922eae: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
145922eb5: e8065ff7ff call 0x145898dc0
145922eba: 4869f8f0000000 imul rdi, rax, 0xf0
145922ec1: 488d1d68f72c01 lea rbx, [rip + 0x12cf768]
145922ec8: f2440f10b41fc8000000 movsd xmm14, qword ptr [rdi + rbx + 0xc8]
145922ed2: 440f28d6 movaps xmm10, xmm6
145922ed6: 450f5cd6 subps xmm10, xmm14
145922eda: f3410f16ca movshdup xmm1, xmm10
145922edf: 410f28c2 movaps xmm0, xmm10
145922ee3: e847752e00 call 0x145c0a42f
145922ee8: f30f108c1fd8000000 movss xmm1, dword ptr [rdi + rbx + 0xd8]
145922ef1: f30f580d77e78e00 addss xmm1, dword ptr [rip + 0x8ee777]
145922ef9: f30f10159b814900 movss xmm2, dword ptr [rip + 0x49819b]
145922f01: 0f2ed0 ucomiss xmm2, xmm0
145922f04: 771d ja 0x145922f23
145922f06: 0f2ec8 ucomiss xmm1, xmm0
145922f09: 7318 jae 0x145922f23
145922f0b: f30f12c0 movsldup xmm0, xmm0
145922f0f: 440f5ed0 divps xmm10, xmm0
145922f13: f30f12c1 movsldup xmm0, xmm1
145922f17: 410f59c2 mulps xmm0, xmm10
145922f1b: 440f58f0 addps xmm14, xmm0
145922f1f: 410f28f6 movaps xmm6, xmm14
145922f23: 4983c610 add r14, 0x10
145922f27: f30f16d6 movshdup xmm2, xmm6
145922f2b: 4c89f1 mov rcx, r14
145922f2e: 0f28ce movaps xmm1, xmm6
145922f31: e80adcf7ff call 0x1458a0b40
145922f36: a801 test al, 1
145922f38: 0f855bfdffff jne 0x145922c99
145922f3e: 410f28c0 movaps xmm0, xmm8
145922f42: e952fdffff jmp 0x145922c99
145922f47: 448b31 mov r14d, dword ptr [rcx]
145922f4a: f30f107904 movss xmm7, dword ptr [rcx + 4]
145922f4f: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
145922f55: 4889f1 mov rcx, rsi
145922f58: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145922f5f: 4889fa mov rdx, rdi
145922f62: 4589f0 mov r8d, r14d
145922f65: 0f28df movaps xmm3, xmm7
145922f68: e833c7ffff call 0x14591f6a0
145922f6d: 48b80000000000002040 movabs rax, 0x4020000000000000
145922f77: 48898560010000 mov qword ptr [rbp + 0x160], rax
145922f7e: f3440f583df5a44800 addss xmm15, dword ptr [rip + 0x48a4f5]
145922f87: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
145922f90: c7851001000004000000 mov dword ptr [rbp + 0x110], 4
145922f9a: 488d8510010000 lea rax, [rbp + 0x110]
145922fa1: 4889442448 mov qword ptr [rsp + 0x48], rax
145922fa6: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145922fad: 4489742438 mov dword ptr [rsp + 0x38], r14d
145922fb2: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
145922fb8: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
145922fbf: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
145922fc5: c744242800000000 mov dword ptr [rsp + 0x28], 0
145922fcd: 4c8d8560010000 lea r8, [rbp + 0x160]
145922fd4: 4889f1 mov rcx, rsi
145922fd7: 4889fa mov rdx, rdi
145922fda: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
145922fe1: e8aac4ffff call 0x14591f490
145922fe6: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
145922fed: 4839d0 cmp rax, rdx
145922ff0: 0f83641b0000 jae 0x145924b5a
145922ff6: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145922ffd: 48c1e007 shl rax, 7
145923001: f3440f117c0158 movss dword ptr [rcx + rax + 0x58], xmm15
145923008: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
14592300f: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145923016: 4839d1 cmp rcx, rdx
145923019: 0f839b1b0000 jae 0x145924bba
14592301f: 48039e68050000 add rbx, qword ptr [rsi + 0x568]
145923026: 4889d9 mov rcx, rbx
145923029: e8f29c0700 call 0x14599cd20
14592302e: 4889c7 mov rdi, rax
145923031: 4889d3 mov rbx, rdx
145923034: 4881c620060000 add rsi, 0x620
14592303b: 4c8d350e722e01 lea r14, [rip + 0x12e720e]
145923042: 41bf26000000 mov r15d, 0x26
145923048: ba26000000 mov edx, 0x26
14592304d: 4c89f1 mov rcx, r14
145923050: e87bad0600 call 0x14598ddd0
145923055: 4885c0 test rax, rax
145923058: 4c0f45f0 cmovne r14, rax
14592305c: 490f44d7 cmove rdx, r15
145923060: 4889542420 mov qword ptr [rsp + 0x20], rdx
145923065: 4c8dbd10010000 lea r15, [rbp + 0x110]
14592306c: 4c89f9 mov rcx, r15
14592306f: 4889fa mov rdx, rdi
145923072: 4989d8 mov r8, rbx
145923075: 4d89f1 mov r9, r14
145923078: e843f2f9ff call 0x1458c22c0
14592307d: 4889f1 mov rcx, rsi
145923080: 4c89fa mov rdx, r15
145923083: e8a8df39fb call 0x140cc1030
145923088: e99bc7ffff jmp 0x14591f828
14592308d: 8b5908 mov ebx, dword ptr [rcx + 8]
145923090: 448b710c mov r14d, dword ptr [rcx + 0xc]
145923094: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
145923099: f30f107114 movss xmm6, dword ptr [rcx + 0x14]
14592309e: f30f105918 movss xmm3, dword ptr [rcx + 0x18]
1459230a3: f3440f10691c movss xmm13, dword ptr [rcx + 0x1c]
1459230a9: 488b01 mov rax, qword ptr [rcx]
1459230ac: 48898550010000 mov qword ptr [rbp + 0x150], rax
1459230b3: 4889f1 mov rcx, rsi
1459230b6: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459230bd: 4189d8 mov r8d, ebx
1459230c0: f30f119de0000000 movss dword ptr [rbp + 0xe0], xmm3
1459230c8: e8d3c5ffff call 0x14591f6a0
1459230cd: 4585f6 test r14d, r14d
1459230d0: 0f8452c7ffff je 0x14591f828
1459230d6: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
1459230dd: 450f57e4 xorps xmm12, xmm12
1459230e1: f3440f100db6e64800 movss xmm9, dword ptr [rip + 0x48e6b6]
1459230ea: 0f57c9 xorps xmm1, xmm1
1459230ed: 410f28d1 movaps xmm2, xmm9
1459230f1: e89afc0900 call 0x1459c2d90
1459230f6: 440f28d0 movaps xmm10, xmm0
1459230fa: 4c8bbea8020000 mov r15, qword ptr [rsi + 0x2a8]
145923101: 4c8ba6b0020000 mov r12, qword ptr [rsi + 0x2b0]
145923108: e80a732e00 call 0x145c0a417
14592310d: 440f28d8 movaps xmm11, xmm0
145923111: 410f28c2 movaps xmm0, xmm10
145923115: e8f7722e00 call 0x145c0a411
14592311a: 440f28d0 movaps xmm10, xmm0
14592311e: 4c89f9 mov rcx, r15
145923121: 4c89e2 mov rdx, r12
145923124: e8975cf7ff call 0x145898dc0
145923129: 4869f8f0000000 imul rdi, rax, 0xf0
145923130: 4c8d25f9f42c01 lea r12, [rip + 0x12cf4f9]
145923137: 450f14da unpcklps xmm11, xmm10
14592313b: 450f57d2 xorps xmm10, xmm10
14592313f: 450f59d3 mulps xmm10, xmm11
145923143: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
14592314b: f2460f108427c8000000 movsd xmm8, qword ptr [rdi + r12 + 0xc8]
145923155: 450f28da movaps xmm11, xmm10
145923159: 450f5cd8 subps xmm11, xmm8
14592315d: f3410f16cb movshdup xmm1, xmm11
145923162: 410f28c3 movaps xmm0, xmm11
145923166: e8c4722e00 call 0x145c0a42f
14592316b: f30f100d297f4900 movss xmm1, dword ptr [rip + 0x497f29]
145923173: 0f2ec8 ucomiss xmm1, xmm0
145923176: 772f ja 0x1459231a7
145923178: f3420f108c27d8000000 movss xmm1, dword ptr [rdi + r12 + 0xd8]
145923182: f30f580de6e48e00 addss xmm1, dword ptr [rip + 0x8ee4e6]
14592318a: 0f2ec8 ucomiss xmm1, xmm0
14592318d: 7318 jae 0x1459231a7
14592318f: f30f12c0 movsldup xmm0, xmm0
145923193: 440f5ed8 divps xmm11, xmm0
145923197: f30f12c1 movsldup xmm0, xmm1
14592319b: 410f59c3 mulps xmm0, xmm11
14592319f: 440f58c0 addps xmm8, xmm0
1459231a3: 450f28d0 movaps xmm10, xmm8
1459231a7: f3450f59f5 mulss xmm14, xmm13
1459231ac: f3440f58a5e0000000 addss xmm12, dword ptr [rbp + 0xe0]
1459231b5: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
1459231bb: ffc7 inc edi
1459231bd: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
1459231c3: f3440f10864c0a0000 movss xmm8, dword ptr [rsi + 0xa4c]
1459231cc: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
1459231d3: 4883c110 add rcx, 0x10
1459231d7: f3410f16d2 movshdup xmm2, xmm10
1459231dc: 410f28ca movaps xmm1, xmm10
1459231e0: e88bc5f7ff call 0x14589f770
1459231e5: 440f28d8 movaps xmm11, xmm0
1459231e9: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
1459231f0: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
1459231f7: 750c jne 0x145923205
1459231f9: 488d8e90050000 lea rcx, [rsi + 0x590]
145923200: e8eba82e00 call 0x145c0daf0
145923205: f3450f58e0 addss xmm12, xmm8
14592320a: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145923211: 4c89f8 mov rax, r15
145923214: 48c1e007 shl rax, 7
145923218: 48c7040100000000 mov qword ptr [rcx + rax], 0
145923220: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
145923228: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592322f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145923234: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14592323d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145923245: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14592324b: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
14592324f: 440f13540140 movlps qword ptr [rcx + rax + 0x40], xmm10
145923255: f3440f115c0148 movss dword ptr [rcx + rax + 0x48], xmm11
14592325c: 0f57c0 xorps xmm0, xmm0
14592325f: 0f57c9 xorps xmm1, xmm1
145923262: f3410f10c8 movss xmm1, xmm8
145923267: 0f57d2 xorps xmm2, xmm2
14592326a: f3410f10d4 movss xmm2, xmm12
14592326f: 0fc6ca41 shufps xmm1, xmm2, 0x41
145923273: 0f114c014c movups xmmword ptr [rcx + rax + 0x4c], xmm1
145923278: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
14592327c: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
145923285: f3440f11740160 movss dword ptr [rcx + rax + 0x60], xmm14
14592328c: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
145923294: 49ffc7 inc r15
145923297: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
14592329c: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
1459232a5: 4c89bea0050000 mov qword ptr [rsi + 0x5a0], r15
1459232ac: 0f8459170000 je 0x145924a0b
1459232b2: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
1459232b9: 48c7040101000000 mov qword ptr [rcx + rax], 1
1459232c1: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
1459232c8: 4889540108 mov qword ptr [rcx + rax + 8], rdx
1459232cd: 4183fe01 cmp r14d, 1
1459232d1: 0f8451c5ffff je 0x14591f828
1459232d7: f30f1005819f4800 movss xmm0, dword ptr [rip + 0x489f81]
1459232df: f30f58c7 addss xmm0, xmm7
1459232e3: 0f28ce movaps xmm1, xmm6
1459232e6: f30f5fc8 maxss xmm1, xmm0
1459232ea: 440f28d1 movaps xmm10, xmm1
1459232ee: f3440fc2d103 cmpunordss xmm10, xmm1
1459232f4: 410f28c2 movaps xmm0, xmm10
1459232f8: 0f55c1 andnps xmm0, xmm1
1459232fb: 440f54d6 andps xmm10, xmm6
1459232ff: f30f10b5e0000000 movss xmm6, dword ptr [rbp + 0xe0]
145923307: f30f5f3585e04800 maxss xmm6, dword ptr [rip + 0x48e085]
14592330f: 440f56d0 orps xmm10, xmm0
145923313: 41bf01000000 mov r15d, 1
145923319: f3440f103546e04800 movss xmm14, dword ptr [rip + 0x48e046]
145923322: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
145923329: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
145923330: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
145923337: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
14592333e: 6690 nop
145923340: 4e8d0c02 lea r9, [rdx + r8]
145923344: 49c1c117 rol r9, 0x17
145923348: 4901d1 add r9, rdx
14592334b: 4989c2 mov r10, rax
14592334e: 49c1e211 shl r10, 0x11
145923352: 4831d1 xor rcx, rdx
145923355: 4931c0 xor r8, rax
145923358: 4831c8 xor rax, rcx
14592335b: 4c31c2 xor rdx, r8
14592335e: 49c1c02d rol r8, 0x2d
145923362: 4c31d1 xor rcx, r10
145923365: 49c1e929 shr r9, 0x29
145923369: 4181c90000803f or r9d, 0x3f800000
145923370: 66450f6ed9 movd xmm11, r9d
145923375: f3450f58de addss xmm11, xmm14
14592337a: f3450f59d9 mulss xmm11, xmm9
14592337f: 450f2ecb ucomiss xmm9, xmm11
145923383: 76bb jbe 0x145923340
145923385: 0f57c0 xorps xmm0, xmm0
145923388: f3440f58d8 addss xmm11, xmm0
14592338d: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
145923394: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
14592339b: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
1459233a2: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
1459233a9: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
1459233b0: 0f28cf movaps xmm1, xmm7
1459233b3: 410f28d2 movaps xmm2, xmm10
1459233b7: e8d4f90900 call 0x1459c2d90
1459233bc: 440f28e0 movaps xmm12, xmm0
1459233c0: 410f28c3 movaps xmm0, xmm11
1459233c4: e84e702e00 call 0x145c0a417
1459233c9: 440f28e8 movaps xmm13, xmm0
1459233cd: 410f28c3 movaps xmm0, xmm11
1459233d1: e83b702e00 call 0x145c0a411
1459233d6: 440f28d8 movaps xmm11, xmm0
1459233da: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
1459233e1: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
1459233e8: e8d359f7ff call 0x145898dc0
1459233ed: 4869f8f0000000 imul rdi, rax, 0xf0
1459233f4: 450f14eb unpcklps xmm13, xmm11
1459233f8: f3450f12dc movsldup xmm11, xmm12
1459233fd: 450f59dd mulps xmm11, xmm13
145923401: 440f589dd0000000 addps xmm11, xmmword ptr [rbp + 0xd0]
145923409: f2460f108427c8000000 movsd xmm8, qword ptr [rdi + r12 + 0xc8]
145923413: 450f28e3 movaps xmm12, xmm11
145923417: 450f5ce0 subps xmm12, xmm8
14592341b: f3410f16cc movshdup xmm1, xmm12
145923420: 410f28c4 movaps xmm0, xmm12
145923424: e806702e00 call 0x145c0a42f
145923429: f3420f108c27d8000000 movss xmm1, dword ptr [rdi + r12 + 0xd8]
145923433: f30f580d35e28e00 addss xmm1, dword ptr [rip + 0x8ee235]
14592343b: f30f1015597c4900 movss xmm2, dword ptr [rip + 0x497c59]
145923443: 0f2ed0 ucomiss xmm2, xmm0
145923446: 771d ja 0x145923465
145923448: 0f2ec8 ucomiss xmm1, xmm0
14592344b: 7318 jae 0x145923465
14592344d: f30f12c0 movsldup xmm0, xmm0
145923451: 440f5ee0 divps xmm12, xmm0
145923455: f30f12c1 movsldup xmm0, xmm1
145923459: 410f59c4 mulps xmm0, xmm12
14592345d: 440f58c0 addps xmm8, xmm0
145923461: 450f28d8 movaps xmm11, xmm8
145923465: 4489f8 mov eax, r15d
145923468: f34c0f2af8 cvtsi2ss xmm15, rax
14592346d: f3440f593d7ae24800 mulss xmm15, dword ptr [rip + 0x48e27a]
145923476: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
14592347c: ffc7 inc edi
14592347e: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
145923484: f3440f10864c0a0000 movss xmm8, dword ptr [rsi + 0xa4c]
14592348d: 4c8baeb0090000 mov r13, qword ptr [rsi + 0x9b0]
145923494: 498d4d10 lea rcx, [r13 + 0x10]
145923498: f3450f16eb movshdup xmm13, xmm11
14592349d: 410f28cb movaps xmm1, xmm11
1459234a1: 410f28d5 movaps xmm2, xmm13
1459234a5: e896d6f7ff call 0x1458a0b40
1459234aa: a801 test al, 1
1459234ac: 7406 je 0x1459234b4
1459234ae: 440f28e0 movaps xmm12, xmm0
1459234b2: eb3c jmp 0x1459234f0
1459234b4: 49837d68ff cmp qword ptr [r13 + 0x68], -1
1459234b9: 742c je 0x1459234e7
1459234bb: 498d5568 lea rdx, [r13 + 0x68]
1459234bf: 488d8d10010000 lea rcx, [rbp + 0x110]
1459234c6: 410f28d3 movaps xmm2, xmm11
1459234ca: 410f28dd movaps xmm3, xmm13
1459234ce: e88d18f8ff call 0x1458a4d60
1459234d3: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
1459234da: 750b jne 0x1459234e7
1459234dc: f3440f10a51c010000 movss xmm12, dword ptr [rbp + 0x11c]
1459234e5: eb09 jmp 0x1459234f0
1459234e7: f3450f10a5b8000000 movss xmm12, dword ptr [r13 + 0xb8]
1459234f0: 4c8baea0050000 mov r13, qword ptr [rsi + 0x5a0]
1459234f7: 4c3bae90050000 cmp r13, qword ptr [rsi + 0x590]
1459234fe: 750c jne 0x14592350c
145923500: 488d8e90050000 lea rcx, [rsi + 0x590]
145923507: e8e4a52e00 call 0x145c0daf0
14592350c: f3440f58bde0000000 addss xmm15, dword ptr [rbp + 0xe0]
145923515: f3450f58f8 addss xmm15, xmm8
14592351a: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145923521: 4c89e8 mov rax, r13
145923524: 48c1e007 shl rax, 7
145923528: 48c7040100000000 mov qword ptr [rcx + rax], 0
145923530: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
145923538: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592353f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
145923544: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14592354d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
145923555: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14592355b: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
14592355f: 440f135c0140 movlps qword ptr [rcx + rax + 0x40], xmm11
145923565: f3440f11640148 movss dword ptr [rcx + rax + 0x48], xmm12
14592356c: 0f57c0 xorps xmm0, xmm0
14592356f: f3410f10c0 movss xmm0, xmm8
145923574: 0f57c9 xorps xmm1, xmm1
145923577: f3410f10cf movss xmm1, xmm15
14592357c: 0fc6c141 shufps xmm0, xmm1, 0x41
145923580: 0f1144014c movups xmmword ptr [rcx + rax + 0x4c], xmm0
145923585: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
145923589: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145923591: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
145923597: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14592359f: 4c89ea mov rdx, r13
1459235a2: 48ffc2 inc rdx
1459235a5: 0f57c0 xorps xmm0, xmm0
1459235a8: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
1459235ad: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
1459235b6: 488996a0050000 mov qword ptr [rsi + 0x5a0], rdx
1459235bd: 0f8448140000 je 0x145924a0b
1459235c3: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
1459235ca: 48c7040101000000 mov qword ptr [rcx + rax], 1
1459235d2: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
1459235d9: 4889540108 mov qword ptr [rcx + rax + 8], rdx
1459235de: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
1459235e5: 4939d5 cmp r13, rdx
1459235e8: 0f834c140000 jae 0x145924a3a
1459235ee: 41ffc7 inc r15d
1459235f1: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
1459235f8: f30f11740164 movss dword ptr [rcx + rax + 0x64], xmm6
1459235fe: 4539f7 cmp r15d, r14d
145923601: 0f851bfdffff jne 0x145923322
145923607: e91cc2ffff jmp 0x14591f828
14592360c: 448b4110 mov r8d, dword ptr [rcx + 0x10]
145923610: 440fb7792e movzx r15d, word ptr [rcx + 0x2e]
145923615: 4c8b21 mov r12, qword ptr [rcx]
145923618: 4c8b6908 mov r13, qword ptr [rcx + 8]
14592361c: f30f10353c9c4800 movss xmm6, dword ptr [rip + 0x489c3c]
145923624: 4889f1 mov rcx, rsi
145923627: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592362e: 44898578010000 mov dword ptr [rbp + 0x178], r8d
145923635: 0f28de movaps xmm3, xmm6
145923638: e863c0ffff call 0x14591f6a0
14592363d: 4889f1 mov rcx, rsi
145923640: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145923647: 0f28d6 movaps xmm2, xmm6
14592364a: 4531c9 xor r9d, r9d
14592364d: e87ebbffff call 0x14591f1d0
145923652: 4080ff02 cmp dil, 2
145923656: 743d je 0x145923695
145923658: 410f104614 movups xmm0, xmmword ptr [r14 + 0x14]
14592365d: 410f104e1d movups xmm1, xmmword ptr [r14 + 0x1d]
145923662: 0f118d19010000 movups xmmword ptr [rbp + 0x119], xmm1
145923669: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
145923670: 4088bd29010000 mov byte ptr [rbp + 0x129], dil
145923677: 664489bd2a010000 mov word ptr [rbp + 0x12a], r15w
14592367f: 4c8d8510010000 lea r8, [rbp + 0x110]
145923686: 4889f1 mov rcx, rsi
145923689: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145923690: e8ab1cffff call 0x145915340
145923695: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
14592369c: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
1459236a3: 4839d1 cmp rcx, rdx
1459236a6: 0f83bf140000 jae 0x145924b6b
1459236ac: 4c8bb668050000 mov r14, qword ptr [rsi + 0x568]
1459236b3: 498d3c1e lea rdi, [r14 + rbx]
1459236b7: 4d6bc538 imul r8, r13, 0x38
1459236bb: 4d01e0 add r8, r12
1459236be: 488d4d18 lea rcx, [rbp + 0x18]
1459236c2: 4c89e2 mov rdx, r12
1459236c5: e8b6710b00 call 0x1459da880
1459236ca: 49837c1e18ff cmp qword ptr [r14 + rbx + 0x18], -1
1459236d0: 7457 je 0x145923729
1459236d2: 4c896738 mov qword ptr [rdi + 0x38], r12
1459236d6: 4c896f40 mov qword ptr [rdi + 0x40], r13
1459236da: c6857701000001 mov byte ptr [rbp + 0x177], 1
1459236e1: 488d8d10010000 lea rcx, [rbp + 0x110]
1459236e8: 488d5518 lea rdx, [rbp + 0x18]
1459236ec: e88fd402ff call 0x144950b80
1459236f1: 90 nop
1459236f2: 4c01f3 add rbx, r14
1459236f5: 4883c318 add rbx, 0x18
1459236f9: 488b13 mov rdx, qword ptr [rbx]
1459236fc: 4885d2 test rdx, rdx
1459236ff: 7413 je 0x145923714
145923701: 488b4f20 mov rcx, qword ptr [rdi + 0x20]
145923705: 48c1e202 shl rdx, 2
145923709: 41b804000000 mov r8d, 4
14592370f: e8bcea6dfa call 0x1400021d0
145923714: 488b8520010000 mov rax, qword ptr [rbp + 0x120]
14592371b: 48894310 mov qword ptr [rbx + 0x10], rax
14592371f: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
145923726: 0f1103 movups xmmword ptr [rbx], xmm0
145923729: 488b5758 mov rdx, qword ptr [rdi + 0x58]
14592372d: 4883faff cmp rdx, -1
145923731: 0f84370a0000 je 0x14592416e
145923737: 488d5f58 lea rbx, [rdi + 0x58]
14592373b: 4c89a780000000 mov qword ptr [rdi + 0x80], r12
145923742: 4c89af88000000 mov qword ptr [rdi + 0x88], r13
145923749: 4885d2 test rdx, rdx
14592374c: 7413 je 0x145923761
14592374e: 488b4f60 mov rcx, qword ptr [rdi + 0x60]
145923752: 48c1e202 shl rdx, 2
145923756: 41b804000000 mov r8d, 4
14592375c: e86fea6dfa call 0x1400021d0
145923761: 488b4528 mov rax, qword ptr [rbp + 0x28]
145923765: 48894310 mov qword ptr [rbx + 0x10], rax
145923769: 0f104518 movups xmm0, xmmword ptr [rbp + 0x18]
14592376d: 0f1103 movups xmmword ptr [rbx], xmm0
145923770: c6857701000000 mov byte ptr [rbp + 0x177], 0
145923777: 488d85a8000000 lea rax, [rbp + 0xa8]
14592377e: 4889442420 mov qword ptr [rsp + 0x20], rax
145923783: f30f100dd59a4800 movss xmm1, dword ptr [rip + 0x489ad5]
14592378b: 4889f1 mov rcx, rsi
14592378e: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
145923795: 448b8d78010000 mov r9d, dword ptr [rbp + 0x178]
14592379c: e83f29ffff call 0x1459160e0
1459237a1: 90 nop
1459237a2: e981c0ffff jmp 0x14591f828
1459237a7: 448b01 mov r8d, dword ptr [rcx]
1459237aa: 448b6104 mov r12d, dword ptr [rcx + 4]
1459237ae: f3440f106908 movss xmm13, dword ptr [rcx + 8]
1459237b4: f30f10590c movss xmm3, dword ptr [rcx + 0xc]
1459237b9: f30f107110 movss xmm6, dword ptr [rcx + 0x10]
1459237be: 8b7914 mov edi, dword ptr [rcx + 0x14]
1459237c1: f3440f597118 mulss xmm14, dword ptr [rcx + 0x18]
1459237c7: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
1459237d0: 4889f1 mov rcx, rsi
1459237d3: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459237da: 448985b8000000 mov dword ptr [rbp + 0xb8], r8d
1459237e1: f30f119d0c010000 movss dword ptr [rbp + 0x10c], xmm3
1459237e9: e8b2beffff call 0x14591f6a0
1459237ee: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
1459237f5: f30f1015a3df4800 movss xmm2, dword ptr [rip + 0x48dfa3]
1459237fd: 0f57c9 xorps xmm1, xmm1
145923800: e88bf50900 call 0x1459c2d90
145923805: 0f28f8 movaps xmm7, xmm0
145923808: e80a6c2e00 call 0x145c0a417
14592380d: 440f28c8 movaps xmm9, xmm0
145923811: f30f11bde0000000 movss dword ptr [rbp + 0xe0], xmm7
145923819: 0f28c7 movaps xmm0, xmm7
14592381c: e8f06b2e00 call 0x145c0a411
145923821: f34d0f2afc cvtsi2ss xmm15, r12
145923826: f3440f583d39db4800 addss xmm15, dword ptr [rip + 0x48db39]
14592382f: f3440f593d2c9a4800 mulss xmm15, dword ptr [rip + 0x489a2c]
145923838: 440f294d40 movaps xmmword ptr [rbp + 0x40], xmm9
14592383d: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
145923841: 440f14c8 unpcklps xmm9, xmm0
145923845: 0f283dd4542e01 movaps xmm7, xmmword ptr [rip + 0x12e54d4]
14592384c: 410f59f9 mulps xmm7, xmm9
145923850: 0f593d19734900 mulps xmm7, xmmword ptr [rip + 0x497319]
145923857: 0f58bdd0000000 addps xmm7, xmmword ptr [rbp + 0xd0]
14592385e: f30f16c7 movshdup xmm0, xmm7
145923862: 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
145923866: f30f10059ede4800 movss xmm0, dword ptr [rip + 0x48de9e]
14592386e: f30f11b5cc000000 movss dword ptr [rbp + 0xcc], xmm6
145923876: f30f59c6 mulss xmm0, xmm6
14592387a: f30f5d0512db4800 minss xmm0, dword ptr [rip + 0x48db12]
145923882: f30f1185d0000000 movss dword ptr [rbp + 0xd0], xmm0
14592388a: 83ff01 cmp edi, 1
14592388d: 83d700 adc edi, 0
145923890: 89bdf0000000 mov dword ptr [rbp + 0xf0], edi
145923896: 4183fc01 cmp r12d, 1
14592389a: 4489e0 mov eax, r12d
14592389d: 83d000 adc eax, 0
1459238a0: 898550010000 mov dword ptr [rbp + 0x150], eax
1459238a6: 450fc6c9e1 shufps xmm9, xmm9, 0xe1
1459238ab: 31db xor ebx, ebx
1459238ad: eb0e jmp 0x1459238bd
1459238af: ffc3 inc ebx
1459238b1: 3b9df0000000 cmp ebx, dword ptr [rbp + 0xf0]
1459238b7: 0f846bbfffff je 0x14591f828
1459238bd: 89df mov edi, ebx
1459238bf: 83e701 and edi, 1
1459238c2: 39bd50010000 cmp dword ptr [rbp + 0x150], edi
1459238c8: 76e5 jbe 0x1459238af
1459238ca: 0f57f6 xorps xmm6, xmm6
1459238cd: f30f2af7 cvtsi2ss xmm6, edi
1459238d1: f3410f5cf7 subss xmm6, xmm15
1459238d6: f3410f59f5 mulss xmm6, xmm13
1459238db: 0f284550 movaps xmm0, xmmword ptr [rbp + 0x50]
1459238df: f30f59c6 mulss xmm0, xmm6
1459238e3: 440f28df movaps xmm11, xmm7
1459238e7: f3440f5cd8 subss xmm11, xmm0
1459238ec: f30f597540 mulss xmm6, dword ptr [rbp + 0x40]
1459238f1: f30f587560 addss xmm6, dword ptr [rbp + 0x60]
1459238f6: 448bb6500a0000 mov r14d, dword ptr [rsi + 0xa50]
1459238fd: 41ffc6 inc r14d
145923900: 4489b6500a0000 mov dword ptr [rsi + 0xa50], r14d
145923907: f3440f10864c0a0000 movss xmm8, dword ptr [rsi + 0xa4c]
145923910: 4c8bbeb0090000 mov r15, qword ptr [rsi + 0x9b0]
145923917: 498d4f10 lea rcx, [r15 + 0x10]
14592391b: 410f28cb movaps xmm1, xmm11
14592391f: 0f28d6 movaps xmm2, xmm6
145923922: e819d2f7ff call 0x1458a0b40
145923927: a801 test al, 1
145923929: 740f je 0x14592393a
14592392b: 440f28e0 movaps xmm12, xmm0
14592392f: f3440f10b578010000 movss xmm14, dword ptr [rbp + 0x178]
145923938: eb44 jmp 0x14592397e
14592393a: 49837f68ff cmp qword ptr [r15 + 0x68], -1
14592393f: f3440f10b578010000 movss xmm14, dword ptr [rbp + 0x178]
145923948: 742b je 0x145923975
14592394a: 498d5768 lea rdx, [r15 + 0x68]
14592394e: 488d8d10010000 lea rcx, [rbp + 0x110]
145923955: 410f28d3 movaps xmm2, xmm11
145923959: 0f28de movaps xmm3, xmm6
14592395c: e8ff13f8ff call 0x1458a4d60
145923961: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145923968: 750b jne 0x145923975
14592396a: f3440f10a51c010000 movss xmm12, dword ptr [rbp + 0x11c]
145923973: eb09 jmp 0x14592397e
145923975: f3450f10a7b8000000 movss xmm12, dword ptr [r15 + 0xb8]
14592397e: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
145923985: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
14592398c: 750c jne 0x14592399a
14592398e: 488d8e90050000 lea rcx, [rsi + 0x590]
145923995: e856a12e00 call 0x145c0daf0
14592399a: 89d8 mov eax, ebx
14592399c: f34c0f2ad0 cvtsi2ss xmm10, rax
1459239a1: f3440f5995cc000000 mulss xmm10, dword ptr [rbp + 0xcc]
1459239aa: f3440f58950c010000 addss xmm10, dword ptr [rbp + 0x10c]
1459239b3: 4c89f8 mov rax, r15
1459239b6: 48c1e007 shl rax, 7
1459239ba: 498d4f01 lea rcx, [r15 + 1]
1459239be: 410f28c2 movaps xmm0, xmm10
1459239c2: f3410f58c0 addss xmm0, xmm8
1459239c7: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
1459239ce: 48c7040200000000 mov qword ptr [rdx + rax], 0
1459239d6: c744021000000000 mov dword ptr [rdx + rax + 0x10], 0
1459239de: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
1459239e5: 4c89440220 mov qword ptr [rdx + rax + 0x20], r8
1459239ea: 48c744022800000000 mov qword ptr [rdx + rax + 0x28], 0
1459239f3: 49b80200000000007042 movabs r8, 0x4270000000000002
1459239fd: 4c89440230 mov qword ptr [rdx + rax + 0x30], r8
145923a02: f3440f116c0238 movss dword ptr [rdx + rax + 0x38], xmm13
145923a09: 448974023c mov dword ptr [rdx + rax + 0x3c], r14d
145923a0e: f3440f115c0240 movss dword ptr [rdx + rax + 0x40], xmm11
145923a15: f30f11740244 movss dword ptr [rdx + rax + 0x44], xmm6
145923a1b: f3440f11640248 movss dword ptr [rdx + rax + 0x48], xmm12
145923a22: f30f108de0000000 movss xmm1, dword ptr [rbp + 0xe0]
145923a2a: f30f114c024c movss dword ptr [rdx + rax + 0x4c], xmm1
145923a30: f3440f11440250 movss dword ptr [rdx + rax + 0x50], xmm8
145923a37: f30f11440254 movss dword ptr [rdx + rax + 0x54], xmm0
145923a3d: c744025800000000 mov dword ptr [rdx + rax + 0x58], 0
145923a45: 448b85b8000000 mov r8d, dword ptr [rbp + 0xb8]
145923a4c: 448944025c mov dword ptr [rdx + rax + 0x5c], r8d
145923a51: f3440f11740260 movss dword ptr [rdx + rax + 0x60], xmm14
145923a58: c74402640000807f mov dword ptr [rdx + rax + 0x64], 0x7f800000
145923a60: 0f57c0 xorps xmm0, xmm0
145923a63: 0f11440268 movups xmmword ptr [rdx + rax + 0x68], xmm0
145923a68: 48c744027700000000 mov qword ptr [rdx + rax + 0x77], 0
145923a71: 48898ea0050000 mov qword ptr [rsi + 0x5a0], rcx
145923a78: 85db test ebx, ebx
145923a7a: 741f je 0x145923a9b
145923a7c: 4983ffff cmp r15, -1
145923a80: 0f843f0f0000 je 0x1459249c5
145923a86: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145923a8d: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
145923a95: f30f11440164 movss dword ptr [rcx + rax + 0x64], xmm0
145923a9b: ffc7 inc edi
145923a9d: 4489e0 mov eax, r12d
145923aa0: 29f8 sub eax, edi
145923aa2: b900000000 mov ecx, 0
145923aa7: 0f42c1 cmovb eax, ecx
145923aaa: eb2f jmp 0x145923adb
145923aac: 0f1f4000 nop dword ptr [rax]
145923ab0: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145923ab7: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
145923abf: f30f11440164 movss dword ptr [rcx + rax + 0x64], xmm0
145923ac5: 4401ff add edi, r15d
145923ac8: ffc7 inc edi
145923aca: 4439e7 cmp edi, r12d
145923acd: 4489e0 mov eax, r12d
145923ad0: 0f47c7 cmova eax, edi
145923ad3: 83f801 cmp eax, 1
145923ad6: 83d000 adc eax, 0
145923ad9: 29f8 sub eax, edi
145923adb: 4189ff mov r15d, edi
145923ade: 4131df xor r15d, ebx
145923ae1: 4183e701 and r15d, 1
145923ae5: 4439f8 cmp eax, r15d
145923ae8: 0f86c1fdffff jbe 0x1459238af
145923aee: 418d043f lea eax, [r15 + rdi]
145923af2: 0f57c0 xorps xmm0, xmm0
145923af5: f3480f2ac0 cvtsi2ss xmm0, rax
145923afa: f3410f5cc7 subss xmm0, xmm15
145923aff: f3410f59c5 mulss xmm0, xmm13
145923b04: f3440f12f0 movsldup xmm14, xmm0
145923b09: 450f59f1 mulps xmm14, xmm9
145923b0d: 0f28f7 movaps xmm6, xmm7
145923b10: 410f5cf6 subps xmm6, xmm14
145923b14: 440f58f7 addps xmm14, xmm7
145923b18: 448bb6500a0000 mov r14d, dword ptr [rsi + 0xa50]
145923b1f: 41ffc6 inc r14d
145923b22: 4489b6500a0000 mov dword ptr [rsi + 0xa50], r14d
145923b29: f3440f10864c0a0000 movss xmm8, dword ptr [rsi + 0xa4c]
145923b32: 4c8baeb0090000 mov r13, qword ptr [rsi + 0x9b0]
145923b39: 498d4d10 lea rcx, [r13 + 0x10]
145923b3d: f3450f16e6 movshdup xmm12, xmm14
145923b42: 0f28ce movaps xmm1, xmm6
145923b45: 410f28d4 movaps xmm2, xmm12
145923b49: e8f2cff7ff call 0x1458a0b40
145923b4e: a801 test al, 1
145923b50: 0f840a010000 je 0x145923c60
145923b56: 440f28d8 movaps xmm11, xmm0
145923b5a: 4c8baea0050000 mov r13, qword ptr [rsi + 0x5a0]
145923b61: 4c3bae90050000 cmp r13, qword ptr [rsi + 0x590]
145923b68: 750c jne 0x145923b76
145923b6a: 488d8e90050000 lea rcx, [rsi + 0x590]
145923b71: e87a9f2e00 call 0x145c0daf0
145923b76: 440fc6f601 shufps xmm14, xmm6, 1
145923b7b: 440fc6f6e2 shufps xmm14, xmm6, 0xe2
145923b80: 4c89e8 mov rax, r13
145923b83: 48c1e007 shl rax, 7
145923b87: 498d4d01 lea rcx, [r13 + 1]
145923b8b: 410f28c2 movaps xmm0, xmm10
145923b8f: f3410f58c0 addss xmm0, xmm8
145923b94: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
145923b9b: 48c7040200000000 mov qword ptr [rdx + rax], 0
145923ba3: c744021000000000 mov dword ptr [rdx + rax + 0x10], 0
145923bab: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
145923bb2: 4c89440220 mov qword ptr [rdx + rax + 0x20], r8
145923bb7: 48c744022800000000 mov qword ptr [rdx + rax + 0x28], 0
145923bc0: 49b80200000000007042 movabs r8, 0x4270000000000002
145923bca: 4c89440230 mov qword ptr [rdx + rax + 0x30], r8
145923bcf: f3440f116c0238 movss dword ptr [rdx + rax + 0x38], xmm13
145923bd6: 448974023c mov dword ptr [rdx + rax + 0x3c], r14d
145923bdb: 440f13740240 movlps qword ptr [rdx + rax + 0x40], xmm14
145923be1: f3440f115c0248 movss dword ptr [rdx + rax + 0x48], xmm11
145923be8: f30f108de0000000 movss xmm1, dword ptr [rbp + 0xe0]
145923bf0: f30f114c024c movss dword ptr [rdx + rax + 0x4c], xmm1
145923bf6: f3440f11440250 movss dword ptr [rdx + rax + 0x50], xmm8
145923bfd: f30f11440254 movss dword ptr [rdx + rax + 0x54], xmm0
145923c03: 48c744025800000000 mov qword ptr [rdx + rax + 0x58], 0
145923c0c: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145923c14: f30f11440260 movss dword ptr [rdx + rax + 0x60], xmm0
145923c1a: c74402640000807f mov dword ptr [rdx + rax + 0x64], 0x7f800000
145923c22: 0f57c0 xorps xmm0, xmm0
145923c25: 0f11440268 movups xmmword ptr [rdx + rax + 0x68], xmm0
145923c2a: 48c744027700000000 mov qword ptr [rdx + rax + 0x77], 0
145923c33: 48898ea0050000 mov qword ptr [rsi + 0x5a0], rcx
145923c3a: 85db test ebx, ebx
145923c3c: 0f8483feffff je 0x145923ac5
145923c42: 4983fdff cmp r13, -1
145923c46: 0f8564feffff jne 0x145923ab0
145923c4c: e9740d0000 jmp 0x1459249c5
145923c51: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145923c60: 49837d68ff cmp qword ptr [r13 + 0x68], -1
145923c65: 7449 je 0x145923cb0
145923c67: 498d5568 lea rdx, [r13 + 0x68]
145923c6b: 488d8d10010000 lea rcx, [rbp + 0x110]
145923c72: 0f28d6 movaps xmm2, xmm6
145923c75: 410f28dc movaps xmm3, xmm12
145923c79: e8e210f8ff call 0x1458a4d60
145923c7e: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145923c85: 7529 jne 0x145923cb0
145923c87: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
145923c90: 4c8baea0050000 mov r13, qword ptr [rsi + 0x5a0]
145923c97: 4c3bae90050000 cmp r13, qword ptr [rsi + 0x590]
145923c9e: 0f84c6feffff je 0x145923b6a
145923ca4: e9cdfeffff jmp 0x145923b76
145923ca9: 0f1f8000000000 nop dword ptr [rax]
145923cb0: f3450f109db8000000 movss xmm11, dword ptr [r13 + 0xb8]
145923cb9: 4c8baea0050000 mov r13, qword ptr [rsi + 0x5a0]
145923cc0: 4c3bae90050000 cmp r13, qword ptr [rsi + 0x590]
145923cc7: 0f85a9feffff jne 0x145923b76
145923ccd: e998feffff jmp 0x145923b6a
145923cd2: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
145923cd9: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145923ce0: 4839d1 cmp rcx, rdx
145923ce3: 0f83df0e0000 jae 0x145924bc8
145923ce9: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145923cf0: 48038e68050000 add rcx, qword ptr [rsi + 0x568]
145923cf7: e824900700 call 0x14599cd20
145923cfc: 4889c7 mov rdi, rax
145923cff: 4889d3 mov rbx, rdx
145923d02: 4585ed test r13d, r13d
145923d05: 0f84ba040000 je 0x1459241c5
145923d0b: 4183fd01 cmp r13d, 1
145923d0f: 0f85c4040000 jne 0x1459241d9
145923d15: 4c8d35f3632e01 lea r14, [rip + 0x12e63f3]
145923d1c: 41bf28000000 mov r15d, 0x28
145923d22: ba28000000 mov edx, 0x28
145923d27: e9bf040000 jmp 0x1459241eb
145923d2c: 450f28c1 movaps xmm8, xmm9
145923d30: f3440f114510 movss dword ptr [rbp + 0x10], xmm8
145923d36: 897d0c mov dword ptr [rbp + 0xc], edi
145923d39: f3440f59f7 mulss xmm14, xmm7
145923d3e: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145923d48: 488d8510010000 lea rax, [rbp + 0x110]
145923d4f: 4889442448 mov qword ptr [rsp + 0x48], rax
145923d54: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145923d5b: 895c2438 mov dword ptr [rsp + 0x38], ebx
145923d5f: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
145923d65: f3440f11542420 movss dword ptr [rsp + 0x20], xmm10
145923d6c: c744242800000000 mov dword ptr [rsp + 0x28], 0
145923d74: 4c8d450c lea r8, [rbp + 0xc]
145923d78: 4889f1 mov rcx, rsi
145923d7b: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145923d82: 0f289d50010000 movaps xmm3, xmmword ptr [rbp + 0x150]
145923d89: e802b7ffff call 0x14591f490
145923d8e: 488b96a0050000 mov rdx, qword ptr [rsi + 0x5a0]
145923d95: 4839d0 cmp rax, rdx
145923d98: 0f835c0d0000 jae 0x145924afa
145923d9e: 488b8e98050000 mov rcx, qword ptr [rsi + 0x598]
145923da5: 48c1e007 shl rax, 7
145923da9: c644017c01 mov byte ptr [rcx + rax + 0x7c], 1
145923dae: e975baffff jmp 0x14591f828
145923db3: 81fbe5050000 cmp ebx, 0x5e5
145923db9: 0f8ea0040000 jle 0x14592425f
145923dbf: 81fbfb0a0000 cmp ebx, 0xafb
145923dc5: 0f8f0b050000 jg 0x1459242d6
145923dcb: 81fbe6050000 cmp ebx, 0x5e6
145923dd1: 0f84cd040000 je 0x1459242a4
145923dd7: 81fbba070000 cmp ebx, 0x7ba
145923ddd: 0f8433050000 je 0x145924316
145923de3: 81fb530a0000 cmp ebx, 0xa53
145923de9: 0f84b5040000 je 0x1459242a4
145923def: e932050000 jmp 0x145924326
145923df4: 450f28e2 movaps xmm12, xmm10
145923df8: 8b85c8000000 mov eax, dword ptr [rbp + 0xc8]
145923dfe: 898580000000 mov dword ptr [rbp + 0x80], eax
145923e04: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
145923e0b: 48894578 mov qword ptr [rbp + 0x78], rax
145923e0f: 4883c210 add rdx, 0x10
145923e13: f20f107578 movsd xmm6, qword ptr [rbp + 0x78]
145923e18: f30f16d6 movshdup xmm2, xmm6
145923e1c: 4889d1 mov rcx, rdx
145923e1f: 0f28ce movaps xmm1, xmm6
145923e22: e819cdf7ff call 0x1458a0b40
145923e27: 4c8b8e70050000 mov r9, qword ptr [rsi + 0x570]
145923e2e: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
145923e35: 4c39ca cmp rdx, r9
145923e38: 0f83cd0c0000 jae 0x145924b0b
145923e3e: 440f28d0 movaps xmm10, xmm0
145923e42: a801 test al, 1
145923e44: 7509 jne 0x145923e4f
145923e46: f3440f109580000000 movss xmm10, dword ptr [rbp + 0x80]
145923e4f: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
145923e56: 440f288d50010000 movaps xmm9, xmmword ptr [rbp + 0x150]
145923e5e: 410f28c1 movaps xmm0, xmm9
145923e62: 0f5cc6 subps xmm0, xmm6
145923e65: 0f59c0 mulps xmm0, xmm0
145923e68: f30f16c8 movshdup xmm1, xmm0
145923e6c: f30f58c8 addss xmm1, xmm0
145923e70: 0f57ff xorps xmm7, xmm7
145923e73: f30f51f9 sqrtss xmm7, xmm1
145923e77: f30f1005b52c4900 movss xmm0, dword ptr [rip + 0x492cb5]
145923e7f: f30f5ff8 maxss xmm7, xmm0
145923e83: f30f108c1870010000 movss xmm1, dword ptr [rax + rbx + 0x170]
145923e8c: f30f590d6c724900 mulss xmm1, dword ptr [rip + 0x49726c]
145923e94: f30f5fc1 maxss xmm0, xmm1
145923e98: f3440f10050f154900 movss xmm8, dword ptr [rip + 0x49150f]
145923ea1: f3440f5dc0 minss xmm8, xmm0
145923ea6: 0f28d7 movaps xmm2, xmm7
145923ea9: f30f5e1533964800 divss xmm2, dword ptr [rip + 0x489633]
145923eb1: f3440f101da6934800 movss xmm11, dword ptr [rip + 0x4893a6]
145923eba: f3410f58d3 addss xmm2, xmm11
145923ebf: f3440f10ad78010000 movss xmm13, dword ptr [rbp + 0x178]
145923ec8: f3440f116c2420 movss dword ptr [rsp + 0x20], xmm13
145923ecf: 4889f1 mov rcx, rsi
145923ed2: 41b901000000 mov r9d, 1
145923ed8: e8f3b2ffff call 0x14591f1d0
145923edd: 4889f1 mov rcx, rsi
145923ee0: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145923ee7: 4889fa mov rdx, rdi
145923eea: 4589f8 mov r8d, r15d
145923eed: 410f28db movaps xmm3, xmm11
145923ef1: e8aab7ffff call 0x14591f6a0
145923ef6: f30f11bd64010000 movss dword ptr [rbp + 0x164], xmm7
145923efe: f3440f118568010000 movss dword ptr [rbp + 0x168], xmm8
145923f07: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
145923f11: f3450f58f6 addss xmm14, xmm14
145923f16: c7851001000000000000 mov dword ptr [rbp + 0x110], 0
145923f20: 488d8510010000 lea rax, [rbp + 0x110]
145923f27: 4889442448 mov qword ptr [rsp + 0x48], rax
145923f2c: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
145923f33: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
145923f3a: f3440f11642420 movss dword ptr [rsp + 0x20], xmm12
145923f41: c744243800000000 mov dword ptr [rsp + 0x38], 0
145923f49: c74424300000803f mov dword ptr [rsp + 0x30], 0x3f800000
145923f51: 4c8d8560010000 lea r8, [rbp + 0x160]
145923f58: 4889f1 mov rcx, rsi
145923f5b: 4889fa mov rdx, rdi
145923f5e: 410f28d9 movaps xmm3, xmm9
145923f62: e829b5ffff call 0x14591f490
145923f67: 0f13b510010000 movlps qword ptr [rbp + 0x110], xmm6
145923f6e: f3440f119518010000 movss dword ptr [rbp + 0x118], xmm10
145923f77: c6853d01000023 mov byte ptr [rbp + 0x13d], 0x23
145923f7e: 4c8d8d10010000 lea r9, [rbp + 0x110]
145923f85: 4889f1 mov rcx, rsi
145923f88: 410f28cb movaps xmm1, xmm11
145923f8c: 4989f8 mov r8, rdi
145923f8f: e87cb1ffff call 0x14591f110
145923f94: e98fb8ffff jmp 0x14591f828
145923f99: 8b85c8000000 mov eax, dword ptr [rbp + 0xc8]
145923f9f: 894538 mov dword ptr [rbp + 0x38], eax
145923fa2: 488b85c0000000 mov rax, qword ptr [rbp + 0xc0]
145923fa9: 48894530 mov qword ptr [rbp + 0x30], rax
145923fad: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
145923fb4: 4983c610 add r14, 0x10
145923fb8: 488b96a8020000 mov rdx, qword ptr [rsi + 0x2a8]
145923fbf: 4c8b86b0020000 mov r8, qword ptr [rsi + 0x2b0]
145923fc6: 488d8d10010000 lea rcx, [rbp + 0x110]
145923fcd: 4c8d4d30 lea r9, [rbp + 0x30]
145923fd1: e84a20ffff call 0x145916020
145923fd6: f20f10bd10010000 movsd xmm7, qword ptr [rbp + 0x110]
145923fde: f3440f16c7 movshdup xmm8, xmm7
145923fe3: 4c89f1 mov rcx, r14
145923fe6: 0f28cf movaps xmm1, xmm7
145923fe9: 410f28d0 movaps xmm2, xmm8
145923fed: e84ecbf7ff call 0x1458a0b40
145923ff2: 440f28c8 movaps xmm9, xmm0
145923ff6: a801 test al, 1
145923ff8: 7509 jne 0x145924003
145923ffa: f3440f108d18010000 movss xmm9, dword ptr [rbp + 0x118]
145924003: 488d9e20060000 lea rbx, [rsi + 0x620]
14592400a: 8b85b0000000 mov eax, dword ptr [rbp + 0xb0]
145924010: 89856c010000 mov dword ptr [rbp + 0x16c], eax
145924016: 488b85a8000000 mov rax, qword ptr [rbp + 0xa8]
14592401d: 48898564010000 mov qword ptr [rbp + 0x164], rax
145924024: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
14592402e: c745e400000000 mov dword ptr [rbp - 0x1c], 0
145924035: 488d7de4 lea rdi, [rbp - 0x1c]
145924039: 48897c2430 mov qword ptr [rsp + 0x30], rdi
14592403e: 4c8dad60010000 lea r13, [rbp + 0x160]
145924045: 4c896c2428 mov qword ptr [rsp + 0x28], r13
14592404a: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145924053: 4c8da510010000 lea r12, [rbp + 0x110]
14592405a: 41b908000000 mov r9d, 8
145924060: 4c89e1 mov rcx, r12
145924063: 4c8bbd80010000 mov r15, qword ptr [rbp + 0x180]
14592406a: 4c89fa mov rdx, r15
14592406d: 448bb550010000 mov r14d, dword ptr [rbp + 0x150]
145924074: 4589f0 mov r8d, r14d
145924077: e854a7faff call 0x1458ce7d0
14592407c: 4889d9 mov rcx, rbx
14592407f: 4c89e2 mov rdx, r12
145924082: e8a9cf39fb call 0x140cc1030
145924087: f20f11bd64010000 movsd qword ptr [rbp + 0x164], xmm7
14592408f: f3440f118d6c010000 movss dword ptr [rbp + 0x16c], xmm9
145924098: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
1459240a2: 48897c2430 mov qword ptr [rsp + 0x30], rdi
1459240a7: 4c896c2428 mov qword ptr [rsp + 0x28], r13
1459240ac: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
1459240b5: 41b908000000 mov r9d, 8
1459240bb: 4589f0 mov r8d, r14d
1459240be: 4c89e1 mov rcx, r12
1459240c1: 4c89fa mov rdx, r15
1459240c4: e807a7faff call 0x1458ce7d0
1459240c9: 4889d9 mov rcx, rbx
1459240cc: 4c89e2 mov rdx, r12
1459240cf: e85ccf39fb call 0x140cc1030
1459240d4: 488b9670050000 mov rdx, qword ptr [rsi + 0x570]
1459240db: 483995f0000000 cmp qword ptr [rbp + 0xf0], rdx
1459240e2: 0f83370a0000 jae 0x145924b1f
1459240e8: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
1459240ef: 488b9d90000000 mov rbx, qword ptr [rbp + 0x90]
1459240f6: 0f13bc1874010000 movlps qword ptr [rax + rbx + 0x174], xmm7
1459240fe: f3440f118c187c010000 movss dword ptr [rax + rbx + 0x17c], xmm9
145924108: 0f13bc1880010000 movlps qword ptr [rax + rbx + 0x180], xmm7
145924110: f3440f118c1888010000 movss dword ptr [rax + rbx + 0x188], xmm9
14592411a: 0f57c0 xorps xmm0, xmm0
14592411d: f3410f10c7 movss xmm0, xmm15
145924122: 0f1384188c010000 movlps qword ptr [rax + rbx + 0x18c], xmm0
14592412a: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
145924131: f3410f5cc0 subss xmm0, xmm8
145924136: 0f288dd0000000 movaps xmm1, xmmword ptr [rbp + 0xd0]
14592413d: f30f5ccf subss xmm1, xmm7
145924141: e801632e00 call 0x145c0a447
145924146: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14592414c: f30f101510914800 movss xmm2, dword ptr [rip + 0x489110]
145924154: 4889f1 mov rcx, rsi
145924157: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14592415e: 41b901000000 mov r9d, 1
145924164: e867b0ffff call 0x14591f1d0
145924169: e9bab6ffff jmp 0x14591f828
14592416e: c6857701000001 mov byte ptr [rbp + 0x177], 1
145924175: 488d85a8000000 lea rax, [rbp + 0xa8]
14592417c: 4889442420 mov qword ptr [rsp + 0x20], rax
145924181: f30f100dd7904800 movss xmm1, dword ptr [rip + 0x4890d7]
145924189: 4889f1 mov rcx, rsi
14592418c: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
145924193: 448b8d78010000 mov r9d, dword ptr [rbp + 0x178]
14592419a: e8411fffff call 0x1459160e0
14592419f: 90 nop
1459241a0: 488b5518 mov rdx, qword ptr [rbp + 0x18]
1459241a4: 4885d2 test rdx, rdx
1459241a7: 0f847bb6ffff je 0x14591f828
1459241ad: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
1459241b1: 48c1e202 shl rdx, 2
1459241b5: 41b804000000 mov r8d, 4
1459241bb: e810e06dfa call 0x1400021d0
1459241c0: e963b6ffff jmp 0x14591f828
1459241c5: 4c8d35245f2e01 lea r14, [rip + 0x12e5f24]
1459241cc: 41bf1f000000 mov r15d, 0x1f
1459241d2: ba1f000000 mov edx, 0x1f
1459241d7: eb12 jmp 0x1459241eb
1459241d9: 4c8d35575f2e01 lea r14, [rip + 0x12e5f57]
1459241e0: 41bf2a000000 mov r15d, 0x2a
1459241e6: ba2a000000 mov edx, 0x2a
1459241eb: 4c89f1 mov rcx, r14
1459241ee: e8dd9b0600 call 0x14598ddd0
1459241f3: 4885c0 test rax, rax
1459241f6: 490f44d7 cmove rdx, r15
1459241fa: 490f44c6 cmove rax, r14
1459241fe: 4881c620060000 add rsi, 0x620
145924205: 4889542420 mov qword ptr [rsp + 0x20], rdx
14592420a: 4c8db510010000 lea r14, [rbp + 0x110]
145924211: 4c89f1 mov rcx, r14
145924214: 4889fa mov rdx, rdi
145924217: 4989d8 mov r8, rbx
14592421a: 4989c1 mov r9, rax
14592421d: e89ee0f9ff call 0x1458c22c0
145924222: 4889f1 mov rcx, rsi
145924225: 4c89f2 mov rdx, r14
145924228: e803ce39fb call 0x140cc1030
14592422d: e9f6b5ffff jmp 0x14591f828
145924232: 81fbe94b0000 cmp ebx, 0x4be9
145924238: 7f7e jg 0x1459242b8
14592423a: 81fb651c0000 cmp ebx, 0x1c65
145924240: 0f84b2000000 je 0x1459242f8
145924246: 81fbc5270000 cmp ebx, 0x27c5
14592424c: 0f84ba000000 je 0x14592430c
145924252: 81fb662c0000 cmp ebx, 0x2c66
145924258: 7454 je 0x1459242ae
14592425a: e9c7000000 jmp 0x145924326
14592425f: 81fb84000000 cmp ebx, 0x84
145924265: 0f8e97000000 jle 0x145924302
14592426b: 81fb85000000 cmp ebx, 0x85
145924271: 743b je 0x1459242ae
145924273: 81fb93010000 cmp ebx, 0x193
145924279: 747d je 0x1459242f8
14592427b: 81fbae020000 cmp ebx, 0x2ae
145924281: 7475 je 0x1459242f8
145924283: e99e000000 jmp 0x145924326
145924288: 81fb851a0000 cmp ebx, 0x1a85
14592428e: 741e je 0x1459242ae
145924290: 81fb051b0000 cmp ebx, 0x1b05
145924296: 747e je 0x145924316
145924298: 81fb541b0000 cmp ebx, 0x1b54
14592429e: 0f8582000000 jne 0x145924326
1459242a4: f30f1005c8914800 movss xmm0, dword ptr [rip + 0x4891c8]
1459242ac: eb70 jmp 0x14592431e
1459242ae: f30f1005ae1d4e00 movss xmm0, dword ptr [rip + 0x4e1dae]
1459242b6: eb66 jmp 0x14592431e
1459242b8: 81fbea4b0000 cmp ebx, 0x4bea
1459242be: 7456 je 0x145924316
1459242c0: 81fbd35e0000 cmp ebx, 0x5ed3
1459242c6: 0f84d4060000 je 0x1459249a0
1459242cc: 81fbf76a0000 cmp ebx, 0x6af7
1459242d2: 7424 je 0x1459242f8
1459242d4: eb50 jmp 0x145924326
1459242d6: 81fbfc0a0000 cmp ebx, 0xafc
1459242dc: 741a je 0x1459242f8
1459242de: 81fbe40b0000 cmp ebx, 0xbe4
1459242e4: 7430 je 0x145924316
1459242e6: 81fb160e0000 cmp ebx, 0xe16
1459242ec: 7538 jne 0x145924326
1459242ee: f30f10055a4a2e01 movss xmm0, dword ptr [rip + 0x12e4a5a]
1459242f6: eb26 jmp 0x14592431e
1459242f8: f30f100534d44800 movss xmm0, dword ptr [rip + 0x48d434]
145924300: eb1c jmp 0x14592431e
145924302: 83fb4b cmp ebx, 0x4b
145924305: 740f je 0x145924316
145924307: 83fb74 cmp ebx, 0x74
14592430a: 751a jne 0x145924326
14592430c: f30f1005cca04900 movss xmm0, dword ptr [rip + 0x49a0cc]
145924314: eb08 jmp 0x14592431e
145924316: f30f1005c6914800 movss xmm0, dword ptr [rip + 0x4891c6]
14592431e: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
145924326: 440f2995f0000000 movaps xmmword ptr [rbp + 0xf0], xmm10
14592432e: 4585ed test r13d, r13d
145924331: 0f84f1b4ffff je 0x14591f828
145924337: 4489e8 mov eax, r13d
14592433a: 0f57c0 xorps xmm0, xmm0
14592433d: f3480f2ac0 cvtsi2ss xmm0, rax
145924342: 488d8eb8090000 lea rcx, [rsi + 0x9b8]
145924349: 0f57f6 xorps xmm6, xmm6
14592434c: f30f1185b8000000 movss dword ptr [rbp + 0xb8], xmm0
145924354: f30f5ef0 divss xmm6, xmm0
145924358: f30f593540d44800 mulss xmm6, dword ptr [rip + 0x48d440]
145924360: f3440f100df78e4800 movss xmm9, dword ptr [rip + 0x488ef7]
145924369: 0f57c9 xorps xmm1, xmm1
14592436c: 410f28d1 movaps xmm2, xmm9
145924370: e81bea0900 call 0x1459c2d90
145924375: 440f28d0 movaps xmm10, xmm0
145924379: f3440f58d6 addss xmm10, xmm6
14592437e: 4c8bbeb0090000 mov r15, qword ptr [rsi + 0x9b0]
145924385: 410f28c2 movaps xmm0, xmm10
145924389: e889602e00 call 0x145c0a417
14592438e: 440f28d8 movaps xmm11, xmm0
145924392: 410f28c2 movaps xmm0, xmm10
145924396: e876602e00 call 0x145c0a411
14592439b: 440f14d8 unpcklps xmm11, xmm0
14592439f: 450f57d2 xorps xmm10, xmm10
1459243a3: 450f59d3 mulps xmm10, xmm11
1459243a7: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
1459243af: f3450f16da movshdup xmm11, xmm10
1459243b4: 4983c710 add r15, 0x10
1459243b8: 4c89f9 mov rcx, r15
1459243bb: 410f28ca movaps xmm1, xmm10
1459243bf: 410f28d3 movaps xmm2, xmm11
1459243c3: e8a8b3f7ff call 0x14589f770
1459243c8: 440f139564010000 movlps qword ptr [rbp + 0x164], xmm10
1459243d0: f30f11856c010000 movss dword ptr [rbp + 0x16c], xmm0
1459243d8: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
1459243e2: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
1459243ec: 488d85c0000000 lea rax, [rbp + 0xc0]
1459243f3: 4889442430 mov qword ptr [rsp + 0x30], rax
1459243f8: 488d8560010000 lea rax, [rbp + 0x160]
1459243ff: 4889442428 mov qword ptr [rsp + 0x28], rax
145924404: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14592440d: 488d8d10010000 lea rcx, [rbp + 0x110]
145924414: 41b908000000 mov r9d, 8
14592441a: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145924421: 4189d8 mov r8d, ebx
145924424: e8a7a3faff call 0x1458ce7d0
145924429: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
145924430: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
145924437: 750d jne 0x145924446
145924439: 488d8e20060000 lea rcx, [rsi + 0x620]
145924440: e88b972e00 call 0x145c0dbd0
145924445: 90 nop
145924446: f3440f5935a1d24800 mulss xmm14, dword ptr [rip + 0x48d2a1]
14592444f: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
145924456: 4889f9 mov rcx, rdi
145924459: 48c1e105 shl rcx, 5
14592445d: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
145924464: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
14592446b: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145924470: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145924474: 48ffc7 inc rdi
145924477: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14592447e: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
145924485: f3410f5cc3 subss xmm0, xmm11
14592448a: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
145924491: f3410f5cca subss xmm1, xmm10
145924496: f30f59c9 mulss xmm1, xmm1
14592449a: f30f59c0 mulss xmm0, xmm0
14592449e: f30f58c1 addss xmm0, xmm1
1459244a2: 0f57f6 xorps xmm6, xmm6
1459244a5: f30f51f0 sqrtss xmm6, xmm0
1459244a9: f30f5eb5e0000000 divss xmm6, dword ptr [rbp + 0xe0]
1459244b1: f30f5f3577d24800 maxss xmm6, dword ptr [rip + 0x48d277]
1459244b9: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
1459244bf: ffc7 inc edi
1459244c1: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
1459244c7: f30f10be4c0a0000 movss xmm7, dword ptr [rsi + 0xa4c]
1459244cf: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
1459244d6: 4883c110 add rcx, 0x10
1459244da: 410f28ca movaps xmm1, xmm10
1459244de: 410f28d3 movaps xmm2, xmm11
1459244e2: e889b2f7ff call 0x14589f770
1459244e7: 440f28d8 movaps xmm11, xmm0
1459244eb: 4c8bbea0050000 mov r15, qword ptr [rsi + 0x5a0]
1459244f2: 4c3bbe90050000 cmp r15, qword ptr [rsi + 0x590]
1459244f9: 750c jne 0x145924507
1459244fb: 488d8e90050000 lea rcx, [rsi + 0x590]
145924502: e8e9952e00 call 0x145c0daf0
145924507: f30f58f7 addss xmm6, xmm7
14592450b: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
145924512: 4c89f9 mov rcx, r15
145924515: 48c1e107 shl rcx, 7
145924519: 48c7040800000000 mov qword ptr [rax + rcx], 0
145924521: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145924529: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145924530: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
145924535: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14592453e: 48ba0000000000002040 movabs rdx, 0x4020000000000000
145924548: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
14592454d: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
145924551: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
145924557: f3440f115c0848 movss dword ptr [rax + rcx + 0x48], xmm11
14592455e: c744084c00000000 mov dword ptr [rax + rcx + 0x4c], 0
145924566: f30f117c0850 movss dword ptr [rax + rcx + 0x50], xmm7
14592456c: f30f11740854 movss dword ptr [rax + rcx + 0x54], xmm6
145924572: 48c744085800000000 mov qword ptr [rax + rcx + 0x58], 0
14592457b: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
145924584: f3440f11740860 movss dword ptr [rax + rcx + 0x60], xmm14
14592458b: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145924593: 49ffc7 inc r15
145924596: 0f57c0 xorps xmm0, xmm0
145924599: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
14592459e: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
1459245a7: 4c89bea0050000 mov qword ptr [rsi + 0x5a0], r15
1459245ae: 4183fd01 cmp r13d, 1
1459245b2: 0f8470b2ffff je 0x14591f828
1459245b8: 41bf01000000 mov r15d, 1
1459245be: f30f1035a2cd4800 movss xmm6, dword ptr [rip + 0x48cda2]
1459245c6: f3440f102d65254900 movss xmm13, dword ptr [rip + 0x492565]
1459245cf: f3440f103d908c4800 movss xmm15, dword ptr [rip + 0x488c90]
1459245d8: f3440f100553674900 movss xmm8, dword ptr [rip + 0x496753]
1459245e1: 4c8da510010000 lea r12, [rbp + 0x110]
1459245e8: e9b3000000 jmp 0x1459246a0
1459245ed: 41ffc7 inc r15d
1459245f0: f3410f58fe addss xmm7, xmm14
1459245f5: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
1459245fc: 4c89f1 mov rcx, r14
1459245ff: 48c1e107 shl rcx, 7
145924603: 48c7040800000000 mov qword ptr [rax + rcx], 0
14592460b: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145924613: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592461a: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14592461f: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145924628: 48ba0000000000002040 movabs rdx, 0x4020000000000000
145924632: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
145924637: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
14592463b: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
145924641: f3440f11640848 movss dword ptr [rax + rcx + 0x48], xmm12
145924648: c744084c00000000 mov dword ptr [rax + rcx + 0x4c], 0
145924650: f3440f11740850 movss dword ptr [rax + rcx + 0x50], xmm14
145924657: f30f117c0854 movss dword ptr [rax + rcx + 0x54], xmm7
14592465d: 48c744085800000000 mov qword ptr [rax + rcx + 0x58], 0
145924666: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14592466e: f30f11440860 movss dword ptr [rax + rcx + 0x60], xmm0
145924674: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
14592467c: 49ffc6 inc r14
14592467f: 0f57c0 xorps xmm0, xmm0
145924682: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
145924687: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145924690: 4c89b6a0050000 mov qword ptr [rsi + 0x5a0], r14
145924697: 4539ef cmp r15d, r13d
14592469a: 0f8488b1ffff je 0x14591f828
1459246a0: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
1459246a7: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
1459246ae: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
1459246b5: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
1459246bc: 0f1f4000 nop dword ptr [rax]
1459246c0: 4e8d0c02 lea r9, [rdx + r8]
1459246c4: 49c1c117 rol r9, 0x17
1459246c8: 4901d1 add r9, rdx
1459246cb: 4989c2 mov r10, rax
1459246ce: 49c1e211 shl r10, 0x11
1459246d2: 4831d1 xor rcx, rdx
1459246d5: 4931c0 xor r8, rax
1459246d8: 4831c8 xor rax, rcx
1459246db: 4c31c2 xor rdx, r8
1459246de: 4c31d1 xor rcx, r10
1459246e1: 49c1c02d rol r8, 0x2d
1459246e5: 49c1e929 shr r9, 0x29
1459246e9: 4181c90000803f or r9d, 0x3f800000
1459246f0: 66410f6ec1 movd xmm0, r9d
1459246f5: f30f58c6 addss xmm0, xmm6
1459246f9: 440f2ec8 ucomiss xmm9, xmm0
1459246fd: 76c1 jbe 0x1459246c0
1459246ff: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
145924706: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
14592470d: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
145924714: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
14592471b: 0f1f440000 nop dword ptr [rax + rax]
145924720: 4e8d0c02 lea r9, [rdx + r8]
145924724: 49c1c117 rol r9, 0x17
145924728: 4901d1 add r9, rdx
14592472b: 4989c2 mov r10, rax
14592472e: 49c1e211 shl r10, 0x11
145924732: 4831d1 xor rcx, rdx
145924735: 4931c0 xor r8, rax
145924738: 4831c8 xor rax, rcx
14592473b: 4c31c2 xor rdx, r8
14592473e: 4c31d1 xor rcx, r10
145924741: 49c1c02d rol r8, 0x2d
145924745: 49c1e929 shr r9, 0x29
145924749: 4181c90000803f or r9d, 0x3f800000
145924750: 66410f6ef9 movd xmm7, r9d
145924755: f30f58fe addss xmm7, xmm6
145924759: f3410f59fd mulss xmm7, xmm13
14592475e: f3410f58ff addss xmm7, xmm15
145924763: 440f2ec7 ucomiss xmm8, xmm7
145924767: 76b7 jbe 0x145924720
145924769: 4589f9 mov r9d, r15d
14592476c: f34d0f2ad1 cvtsi2ss xmm10, r9
145924771: f3440f5e95b8000000 divss xmm10, dword ptr [rbp + 0xb8]
14592477a: f3440f59151dd04800 mulss xmm10, dword ptr [rip + 0x48d01d]
145924783: f3440f58d0 addss xmm10, xmm0
145924788: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
14592478f: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
145924796: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
14592479d: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
1459247a4: 410f28c2 movaps xmm0, xmm10
1459247a8: e86a5c2e00 call 0x145c0a417
1459247ad: 440f28d8 movaps xmm11, xmm0
1459247b1: 410f28c2 movaps xmm0, xmm10
1459247b5: e8575c2e00 call 0x145c0a411
1459247ba: 440f14d8 unpcklps xmm11, xmm0
1459247be: f3440f12d7 movsldup xmm10, xmm7
1459247c3: 450f59d3 mulps xmm10, xmm11
1459247c7: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
1459247cf: f3450f16da movshdup xmm11, xmm10
1459247d4: 488bbeb0090000 mov rdi, qword ptr [rsi + 0x9b0]
1459247db: 488d4f10 lea rcx, [rdi + 0x10]
1459247df: 410f28ca movaps xmm1, xmm10
1459247e3: 410f28d3 movaps xmm2, xmm11
1459247e7: e854c3f7ff call 0x1458a0b40
1459247ec: a801 test al, 1
1459247ee: 7536 jne 0x145924826
1459247f0: 48837f68ff cmp qword ptr [rdi + 0x68], -1
1459247f5: 7427 je 0x14592481e
1459247f7: 488d5768 lea rdx, [rdi + 0x68]
1459247fb: 4c89e1 mov rcx, r12
1459247fe: 410f28d2 movaps xmm2, xmm10
145924802: 410f28db movaps xmm3, xmm11
145924806: e85505f8ff call 0x1458a4d60
14592480b: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145924812: 750a jne 0x14592481e
145924814: f30f10851c010000 movss xmm0, dword ptr [rbp + 0x11c]
14592481c: eb08 jmp 0x145924826
14592481e: f30f1087b8000000 movss xmm0, dword ptr [rdi + 0xb8]
145924826: 440f139564010000 movlps qword ptr [rbp + 0x164], xmm10
14592482e: f30f11856c010000 movss dword ptr [rbp + 0x16c], xmm0
145924836: c7856001000001000000 mov dword ptr [rbp + 0x160], 1
145924840: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
14592484a: 488d85c0000000 lea rax, [rbp + 0xc0]
145924851: 4889442430 mov qword ptr [rsp + 0x30], rax
145924856: 488d8560010000 lea rax, [rbp + 0x160]
14592485d: 4889442428 mov qword ptr [rsp + 0x28], rax
145924862: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
14592486b: 41b908000000 mov r9d, 8
145924871: 4c89e1 mov rcx, r12
145924874: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14592487b: 4189d8 mov r8d, ebx
14592487e: e84d9ffaff call 0x1458ce7d0
145924883: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14592488a: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
145924891: 750d jne 0x1459248a0
145924893: 488d8e20060000 lea rcx, [rsi + 0x620]
14592489a: e831932e00 call 0x145c0dbd0
14592489f: 90 nop
1459248a0: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
1459248a7: 4889f9 mov rcx, rdi
1459248aa: 48c1e105 shl rcx, 5
1459248ae: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
1459248b5: 0f108d20010000 movups xmm1, xmmword ptr [rbp + 0x120]
1459248bc: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1459248c1: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1459248c5: 48ffc7 inc rdi
1459248c8: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
1459248cf: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
1459248d6: f3410f5cc3 subss xmm0, xmm11
1459248db: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
1459248e2: f3410f5cca subss xmm1, xmm10
1459248e7: f30f59c9 mulss xmm1, xmm1
1459248eb: f30f59c0 mulss xmm0, xmm0
1459248ef: f30f58c1 addss xmm0, xmm1
1459248f3: 0f57ff xorps xmm7, xmm7
1459248f6: f30f51f8 sqrtss xmm7, xmm0
1459248fa: f30f5ebde0000000 divss xmm7, dword ptr [rbp + 0xe0]
145924902: f30f5f3d26ce4800 maxss xmm7, dword ptr [rip + 0x48ce26]
14592490a: 8bbe500a0000 mov edi, dword ptr [rsi + 0xa50]
145924910: ffc7 inc edi
145924912: 89be500a0000 mov dword ptr [rsi + 0xa50], edi
145924918: f3440f10b64c0a0000 movss xmm14, dword ptr [rsi + 0xa4c]
145924921: 4c8bb6b0090000 mov r14, qword ptr [rsi + 0x9b0]
145924928: 498d4e10 lea rcx, [r14 + 0x10]
14592492c: 410f28ca movaps xmm1, xmm10
145924930: 410f28d3 movaps xmm2, xmm11
145924934: e807c2f7ff call 0x1458a0b40
145924939: a801 test al, 1
14592493b: 7406 je 0x145924943
14592493d: 440f28e0 movaps xmm12, xmm0
145924941: eb38 jmp 0x14592497b
145924943: 49837e68ff cmp qword ptr [r14 + 0x68], -1
145924948: 7428 je 0x145924972
14592494a: 498d5668 lea rdx, [r14 + 0x68]
14592494e: 4c89e1 mov rcx, r12
145924951: 410f28d2 movaps xmm2, xmm10
145924955: 410f28db movaps xmm3, xmm11
145924959: e80204f8ff call 0x1458a4d60
14592495e: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145924965: 750b jne 0x145924972
145924967: f3440f10a51c010000 movss xmm12, dword ptr [rbp + 0x11c]
145924970: eb09 jmp 0x14592497b
145924972: f3450f10a6b8000000 movss xmm12, dword ptr [r14 + 0xb8]
14592497b: 4c8bb6a0050000 mov r14, qword ptr [rsi + 0x5a0]
145924982: 4c3bb690050000 cmp r14, qword ptr [rsi + 0x590]
145924989: 0f855efcffff jne 0x1459245ed
14592498f: 488d8e90050000 lea rcx, [rsi + 0x590]
145924996: e855912e00 call 0x145c0daf0
14592499b: e94dfcffff jmp 0x1459245ed
1459249a0: f30f1005d8422e01 movss xmm0, dword ptr [rip + 0x12e42d8]
1459249a8: e971f9ffff jmp 0x14592431e
1459249ad: 4c8d05ac562e01 lea r8, [rip + 0x12e56ac]
1459249b4: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1459249bb: 4c89e2 mov rdx, r12
1459249be: e8c04e4800 call 0x145da9883
1459249c3: 0f0b ud2
1459249c5: 4c8d0514592e01 lea r8, [rip + 0x12e5914]
1459249cc: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1459249d3: 31d2 xor edx, edx
1459249d5: e8a94e4800 call 0x145da9883
1459249da: 0f0b ud2
1459249dc: 4c8d05ad572e01 lea r8, [rip + 0x12e57ad]
1459249e3: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1459249ea: 31d2 xor edx, edx
1459249ec: e8924e4800 call 0x145da9883
1459249f1: 0f0b ud2
1459249f3: 4c8d057e582e01 lea r8, [rip + 0x12e587e]
1459249fa: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
145924a01: 4c89fa mov rdx, r15
145924a04: e87a4e4800 call 0x145da9883
145924a09: 0f0b ud2
145924a0b: 4c8d055e592e01 lea r8, [rip + 0x12e595e]
145924a12: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
145924a19: 31d2 xor edx, edx
145924a1b: e8634e4800 call 0x145da9883
145924a20: 0f0b ud2
145924a22: 4c8d054f552e01 lea r8, [rip + 0x12e554f]
145924a29: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
145924a30: 4c89ea mov rdx, r13
145924a33: e84b4e4800 call 0x145da9883
145924a38: 0f0b ud2
145924a3a: 4c8d0547592e01 lea r8, [rip + 0x12e5947]
145924a41: 4c89e9 mov rcx, r13
145924a44: e83a4e4800 call 0x145da9883
145924a49: 0f0b ud2
145924a4b: 4c8d05b6542e01 lea r8, [rip + 0x12e54b6]
145924a52: e82c4e4800 call 0x145da9883
145924a57: 0f0b ud2
145924a59: 4c8d0598582e01 lea r8, [rip + 0x12e5898]
145924a60: 4889c1 mov rcx, rax
145924a63: e81b4e4800 call 0x145da9883
145924a68: 0f0b ud2
145924a6a: 4c8d0507562e01 lea r8, [rip + 0x12e5607]
145924a71: 4889c1 mov rcx, rax
145924a74: e80a4e4800 call 0x145da9883
145924a79: 0f0b ud2
145924a7b: 4c8d0576552e01 lea r8, [rip + 0x12e5576]
145924a82: 4889c1 mov rcx, rax
145924a85: e8f94d4800 call 0x145da9883
145924a8a: 0f0b ud2
145924a8c: 4c8d057d552e01 lea r8, [rip + 0x12e557d]
145924a93: 4889c1 mov rcx, rax
145924a96: e8e84d4800 call 0x145da9883
145924a9b: 0f0b ud2
145924a9d: 4c8d0524552e01 lea r8, [rip + 0x12e5524]
145924aa4: e8da4d4800 call 0x145da9883
145924aa9: 0f0b ud2
145924aab: 4c8d05de572e01 lea r8, [rip + 0x12e57de]
145924ab2: e8cc4d4800 call 0x145da9883
145924ab7: 0f0b ud2
145924ab9: 4c8d0560542e01 lea r8, [rip + 0x12e5460]
145924ac0: 4889c1 mov rcx, rax
145924ac3: e8bb4d4800 call 0x145da9883
145924ac8: 0f0b ud2
145924aca: 4c8d0597562e01 lea r8, [rip + 0x12e5697]
145924ad1: 4889c1 mov rcx, rax
145924ad4: e8aa4d4800 call 0x145da9883
145924ad9: 0f0b ud2
145924adb: 4c8d05ae542e01 lea r8, [rip + 0x12e54ae]
145924ae2: 4889c1 mov rcx, rax
145924ae5: e8994d4800 call 0x145da9883
145924aea: 0f0b ud2
145924aec: 4c8d05c5582e01 lea r8, [rip + 0x12e58c5]
145924af3: e88b4d4800 call 0x145da9883
145924af8: 0f0b ud2
145924afa: 4c8d05df542e01 lea r8, [rip + 0x12e54df]
145924b01: 4889c1 mov rcx, rax
145924b04: e87a4d4800 call 0x145da9883
145924b09: 0f0b ud2
145924b0b: 4c8d054e542e01 lea r8, [rip + 0x12e544e]
145924b12: 4889d1 mov rcx, rdx
145924b15: 4c89ca mov rdx, r9
145924b18: e8664d4800 call 0x145da9883
145924b1d: 0f0b ud2
145924b1f: 4c8d0582552e01 lea r8, [rip + 0x12e5582]
145924b26: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145924b2d: e8514d4800 call 0x145da9883
145924b32: 0f0b ud2
145924b34: 4c8d056d562e01 lea r8, [rip + 0x12e566d]
145924b3b: 4889c1 mov rcx, rax
145924b3e: e8404d4800 call 0x145da9883
145924b43: 0f0b ud2
145924b45: 4c8d0574552e01 lea r8, [rip + 0x12e5574]
145924b4c: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145924b53: e82b4d4800 call 0x145da9883
145924b58: 0f0b ud2
145924b5a: 4c8d05bf562e01 lea r8, [rip + 0x12e56bf]
145924b61: 4889c1 mov rcx, rax
145924b64: e81a4d4800 call 0x145da9883
145924b69: 0f0b ud2
145924b6b: 4c8d052e582e01 lea r8, [rip + 0x12e582e]
145924b72: e80c4d4800 call 0x145da9883
145924b77: 0f0b ud2
145924b79: 4c8d0590572e01 lea r8, [rip + 0x12e5790]
145924b80: 4889c1 mov rcx, rax
145924b83: e8fb4c4800 call 0x145da9883
145924b88: 0f0b ud2
145924b8a: 4c8d05ff542e01 lea r8, [rip + 0x12e54ff]
145924b91: 4889c1 mov rcx, rax
145924b94: e8ea4c4800 call 0x145da9883
145924b99: 0f0b ud2
145924b9b: 4c8d0586542e01 lea r8, [rip + 0x12e5486]
145924ba2: e8dc4c4800 call 0x145da9883
145924ba7: 0f0b ud2
145924ba9: 4c8d0510562e01 lea r8, [rip + 0x12e5610]
145924bb0: 4889c1 mov rcx, rax
145924bb3: e8cb4c4800 call 0x145da9883
145924bb8: 0f0b ud2
145924bba: 4c8d0577562e01 lea r8, [rip + 0x12e5677]
145924bc1: e8bd4c4800 call 0x145da9883
145924bc6: 0f0b ud2
145924bc8: 4c8d0509552e01 lea r8, [rip + 0x12e5509]
145924bcf: e8af4c4800 call 0x145da9883
145924bd4: 0f0b ud2
145924bd6: 4c8d054b572e01 lea r8, [rip + 0x12e574b]
145924bdd: e8a14c4800 call 0x145da9883
145924be2: 0f0b ud2
145924be4: 4c8d05ed552e01 lea r8, [rip + 0x12e55ed]
145924beb: e8934c4800 call 0x145da9883
145924bf0: 0f0b ud2

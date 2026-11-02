14595b097: 448b31 mov r14d, dword ptr [rcx]
14595b09a: f30f107904 movss xmm7, dword ptr [rcx + 4]
14595b09f: f3440f597108 mulss xmm14, dword ptr [rcx + 8]
14595b0a5: 4889f1 mov rcx, rsi
14595b0a8: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
14595b0af: 4889fa mov rdx, rdi
14595b0b2: 4589f0 mov r8d, r14d
14595b0b5: 0f28df movaps xmm3, xmm7
14595b0b8: e833c7ffff call 0x1459577f0
14595b0bd: 48b80000000000002040 movabs rax, 0x4020000000000000
14595b0c7: 48898560010000 mov qword ptr [rbp + 0x160], rax
14595b0ce: f3440f583d599c4800 addss xmm15, dword ptr [rip + 0x489c59]
14595b0d7: f3440f11bd14010000 movss dword ptr [rbp + 0x114], xmm15
14595b0e0: c7851001000004000000 mov dword ptr [rbp + 0x110], 4
14595b0ea: 488d8510010000 lea rax, [rbp + 0x110]
14595b0f1: 4889442448 mov qword ptr [rsp + 0x48], rax
14595b0f6: f3440f11742440 movss dword ptr [rsp + 0x40], xmm14
14595b0fd: 4489742438 mov dword ptr [rsp + 0x38], r14d
14595b102: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
14595b108: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
14595b10f: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14595b115: c744242800000000 mov dword ptr [rsp + 0x28], 0
14595b11d: 4c8d8560010000 lea r8, [rbp + 0x160]
14595b124: 4889f1 mov rcx, rsi
14595b127: 4889fa mov rdx, rdi
14595b12a: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
14595b131: e8aac4ffff call 0x1459575e0
14595b136: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595b13d: 4839d0 cmp rax, rdx
14595b140: 0f83641b0000 jae 0x14595ccaa
14595b146: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595b14d: 48c1e007 shl rax, 7
14595b151: f3440f117c0158 movss dword ptr [rcx + rax + 0x58], xmm15
14595b158: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595b15f: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14595b166: 4839d1 cmp rcx, rdx
14595b169: 0f839b1b0000 jae 0x14595cd0a
14595b16f: 48039e60050000 add rbx, qword ptr [rsi + 0x560]
14595b176: 4889d9 mov rcx, rbx
14595b179: e82228fbff call 0x14590d9a0
14595b17e: 4889c7 mov rdi, rax
14595b181: 4889d3 mov rbx, rdx
14595b184: 4881c618060000 add rsi, 0x618
14595b18b: 4c8d3586fc8c01 lea r14, [rip + 0x18cfc86]
14595b192: 41bf26000000 mov r15d, 0x26
14595b198: ba26000000 mov edx, 0x26

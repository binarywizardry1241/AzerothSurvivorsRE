1459a3dd0: 55 push rbp
1459a3dd1: 4157 push r15
1459a3dd3: 4156 push r14
1459a3dd5: 4155 push r13
1459a3dd7: 4154 push r12
1459a3dd9: 56 push rsi
1459a3dda: 57 push rdi
1459a3ddb: 53 push rbx
1459a3ddc: 4881ece8000000 sub rsp, 0xe8
1459a3de3: 488dac2480000000 lea rbp, [rsp + 0x80]
1459a3deb: 48c74560feffffff mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
1459a3df3: 4c8b7118 mov r14, qword ptr [rcx + 0x18]
1459a3df7: 4c89f3 mov rbx, r14
1459a3dfa: 490fafde imul rbx, r14
1459a3dfe: 4885db test rbx, rbx
1459a3e01: 48895520 mov qword ptr [rbp + 0x20], rdx
1459a3e05: 7917 jns 0x1459a3e1e
1459a3e07: 31f6 xor esi, esi
1459a3e09: c6455f01 mov byte ptr [rbp + 0x5f], 1
1459a3e0d: 4889f1 mov rcx, rsi
1459a3e10: 4889da mov rdx, rbx
1459a3e13: e893044000 call 0x145da42ab
1459a3e18: 90 nop
1459a3e19: e9bb030000 jmp 0x1459a41d9
1459a3e1e: 4989d7 mov r15, rdx
1459a3e21: 7424 je 0x1459a3e47
1459a3e23: 4889cf mov rdi, rcx
1459a3e26: e8d5e365fa call 0x140002200
1459a3e2b: be01000000 mov esi, 1
1459a3e30: ba01000000 mov edx, 1
1459a3e35: 4889d9 mov rcx, rbx
1459a3e38: e8b3e365fa call 0x1400021f0
1459a3e3d: 4885c0 test rax, rax
1459a3e40: 74c7 je 0x1459a3e09
1459a3e42: 4889f9 mov rcx, rdi
1459a3e45: eb05 jmp 0x1459a3e4c
1459a3e47: b801000000 mov eax, 1
1459a3e4c: 4d8b0f mov r9, qword ptr [r15]
1459a3e4f: 498b5708 mov rdx, qword ptr [r15 + 8]
1459a3e53: 4d8b4710 mov r8, qword ptr [r15 + 0x10]
1459a3e57: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1459a3e5f: 4c894548 mov qword ptr [rbp + 0x48], r8
1459a3e63: 4c894d30 mov qword ptr [rbp + 0x30], r9
1459a3e67: 48895538 mov qword ptr [rbp + 0x38], rdx
1459a3e6b: 4d85c0 test r8, r8
1459a3e6e: 7416 je 0x1459a3e86
1459a3e70: 4d39c1 cmp r9, r8
1459a3e73: 4d89c3 mov r11, r8
1459a3e76: 4d0f42d9 cmovb r11, r9
1459a3e7a: 4531d2 xor r10d, r10d
1459a3e7d: 4d29c8 sub r8, r9
1459a3e80: 4d0f43d0 cmovae r10, r8
1459a3e84: eb06 jmp 0x1459a3e8c
1459a3e86: 4531db xor r11d, r11d
1459a3e89: 4531d2 xor r10d, r10d
1459a3e8c: 4e8d1cda lea r11, [rdx + r11*8]
1459a3e90: 4e8d04d2 lea r8, [rdx + r10*8]
1459a3e94: 4989d1 mov r9, rdx
1459a3e97: 48895d50 mov qword ptr [rbp + 0x50], rbx
1459a3e9b: 48894528 mov qword ptr [rbp + 0x28], rax
1459a3e9f: 4c39da cmp rdx, r11
1459a3ea2: 741c je 0x1459a3ec0
1459a3ea4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a3eb0: 4d89c2 mov r10, r8
1459a3eb3: 4d89d8 mov r8, r11
1459a3eb6: eb16 jmp 0x1459a3ece
1459a3eb8: 0f1f840000000000 nop dword ptr [rax + rax]
1459a3ec0: 4d89da mov r10, r11
1459a3ec3: 4d39c1 cmp r9, r8
1459a3ec6: 4c89ca mov rdx, r9
1459a3ec9: 4d89d9 mov r9, r11
1459a3ecc: 7422 je 0x1459a3ef0
1459a3ece: 4c8b1a mov r11, qword ptr [rdx]
1459a3ed1: 4939db cmp r11, rbx
1459a3ed4: 0f83b2020000 jae 0x1459a418c
1459a3eda: 4883c208 add rdx, 8
1459a3ede: 42c6041801 mov byte ptr [rax + r11], 1
1459a3ee3: 4d89c3 mov r11, r8
1459a3ee6: 4d89d0 mov r8, r10
1459a3ee9: 4c39da cmp rdx, r11
1459a3eec: 75c2 jne 0x1459a3eb0
1459a3eee: ebd0 jmp 0x1459a3ec0
1459a3ef0: 4c8b7908 mov r15, qword ptr [rcx + 8]
1459a3ef4: 488b7110 mov rsi, qword ptr [rcx + 0x10]
1459a3ef8: 4c8d6dc8 lea r13, [rbp - 0x38]
1459a3efc: 31ff xor edi, edi
1459a3efe: 6690 nop
1459a3f00: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
1459a3f04: 4885c9 test rcx, rcx
1459a3f07: 0f846c010000 je 0x1459a4079
1459a3f0d: 488b5530 mov rdx, qword ptr [rbp + 0x30]
1459a3f11: 488b4540 mov rax, qword ptr [rbp + 0x40]
1459a3f15: 4c8d4001 lea r8, [rax + 1]
1459a3f19: 4939d0 cmp r8, rdx
1459a3f1c: 480f42d7 cmovb rdx, rdi
1459a3f20: 48f7da neg rdx
1459a3f23: 48ffc9 dec rcx
1459a3f26: 4801c2 add rdx, rax
1459a3f29: 48ffc2 inc rdx
1459a3f2c: 48895540 mov qword ptr [rbp + 0x40], rdx
1459a3f30: 48894d48 mov qword ptr [rbp + 0x48], rcx
1459a3f34: 4d85f6 test r14, r14
1459a3f37: 0f8464020000 je 0x1459a41a1
1459a3f3d: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1459a3f41: 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1459a3f45: 4889c8 mov rax, rcx
1459a3f48: 4c09f0 or rax, r14
1459a3f4b: 48c1e820 shr rax, 0x20
1459a3f4f: 740f je 0x1459a3f60
1459a3f51: 4889c8 mov rax, rcx
1459a3f54: 31d2 xor edx, edx
1459a3f56: 49f7f6 div r14
1459a3f59: eb0c jmp 0x1459a3f67
1459a3f5b: 0f1f440000 nop dword ptr [rax + rax]
1459a3f60: 89c8 mov eax, ecx
1459a3f62: 31d2 xor edx, edx
1459a3f64: 41f7f6 div r14d
1459a3f67: 4531c0 xor r8d, r8d
1459a3f6a: 4885d2 test rdx, rdx
1459a3f6d: 410f95c0 setne r8b
1459a3f71: 4c8d49ff lea r9, [rcx - 1]
1459a3f75: 4531d2 xor r10d, r10d
1459a3f78: 4d8d5eff lea r11, [r14 - 1]
1459a3f7c: 4c39da cmp rdx, r11
1459a3f7f: 410f92c2 setb r10b
1459a3f83: 488d5101 lea rdx, [rcx + 1]
1459a3f87: 4531db xor r11d, r11d
1459a3f8a: 4889cb mov rbx, rcx
1459a3f8d: 4c29f3 sub rbx, r14
1459a3f90: 410f93c3 setae r11b
1459a3f94: 48ffc0 inc rax
1459a3f97: 4531e4 xor r12d, r12d
1459a3f9a: 4c39f0 cmp rax, r14
1459a3f9d: 410f92c4 setb r12b
1459a3fa1: 4c01f1 add rcx, r14
1459a3fa4: 4c8945c0 mov qword ptr [rbp - 0x40], r8
1459a3fa8: 4c894dc8 mov qword ptr [rbp - 0x38], r9
1459a3fac: 4c8955d0 mov qword ptr [rbp - 0x30], r10
1459a3fb0: 488955d8 mov qword ptr [rbp - 0x28], rdx
1459a3fb4: 4c895de0 mov qword ptr [rbp - 0x20], r11
1459a3fb8: 48895de8 mov qword ptr [rbp - 0x18], rbx
1459a3fbc: 4c8965f0 mov qword ptr [rbp - 0x10], r12
1459a3fc0: 48894df8 mov qword ptr [rbp - 8], rcx
1459a3fc4: 4531e4 xor r12d, r12d
1459a3fc7: 4983fc04 cmp r12, 4
1459a3fcb: 0f842fffffff je 0x1459a3f00
1459a3fd1: 4c89e0 mov rax, r12
1459a3fd4: 48c1e004 shl rax, 4
1459a3fd8: 4c01e8 add rax, r13
1459a3fdb: 0f1f440000 nop dword ptr [rax + rax]
1459a3fe0: 8378f801 cmp dword ptr [rax - 8], 1
1459a3fe4: 741a je 0x1459a4000
1459a3fe6: 49ffc4 inc r12
1459a3fe9: 4883c010 add rax, 0x10
1459a3fed: 4983fc04 cmp r12, 4
1459a3ff1: 75ed jne 0x1459a3fe0
1459a3ff3: e908ffffff jmp 0x1459a3f00
1459a3ff8: 0f1f840000000000 nop dword ptr [rax + rax]
1459a4000: 488b18 mov rbx, qword ptr [rax]
1459a4003: 4839f3 cmp rbx, rsi
1459a4006: 0f83a4010000 jae 0x1459a41b0
1459a400c: 49ffc4 inc r12
1459a400f: 41803c1f00 cmp byte ptr [r15 + rbx], 0
1459a4014: 75b1 jne 0x1459a3fc7
1459a4016: 483b5d50 cmp rbx, qword ptr [rbp + 0x50]
1459a401a: 0f83a5010000 jae 0x1459a41c5
1459a4020: 488b4528 mov rax, qword ptr [rbp + 0x28]
1459a4024: 803c1800 cmp byte ptr [rax + rbx], 0
1459a4028: 759d jne 0x1459a3fc7
1459a402a: 488b4528 mov rax, qword ptr [rbp + 0x28]
1459a402e: c6041801 mov byte ptr [rax + rbx], 1
1459a4032: 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1459a4036: 488b4548 mov rax, qword ptr [rbp + 0x48]
1459a403a: 4839c8 cmp rax, rcx
1459a403d: 7512 jne 0x1459a4051
1459a403f: 488d4d30 lea rcx, [rbp + 0x30]
1459a4043: e8989ab0fa call 0x1404adae0
1459a4048: 90 nop
1459a4049: 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1459a404d: 488b4548 mov rax, qword ptr [rbp + 0x48]
1459a4051: 488d5001 lea rdx, [rax + 1]
1459a4055: 48895548 mov qword ptr [rbp + 0x48], rdx
1459a4059: 48034540 add rax, qword ptr [rbp + 0x40]
1459a405d: 4839c8 cmp rax, rcx
1459a4060: ba00000000 mov edx, 0
1459a4065: 480f43d1 cmovae rdx, rcx
1459a4069: 4829d0 sub rax, rdx
1459a406c: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1459a4070: 48891cc1 mov qword ptr [rcx + rax*8], rbx
1459a4074: e94effffff jmp 0x1459a3fc7
1459a4079: 4885f6 test rsi, rsi
1459a407c: 488b5550 mov rdx, qword ptr [rbp + 0x50]
1459a4080: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
1459a4084: 0f84c1000000 je 0x1459a414b
1459a408a: 488d46ff lea rax, [rsi - 1]
1459a408e: 4839d0 cmp rax, rdx
1459a4091: 4989d1 mov r9, rdx
1459a4094: 4c0f42c8 cmovb r9, rax
1459a4098: 4983f920 cmp r9, 0x20
1459a409c: 721e jb 0x1459a40bc
1459a409e: 4839d0 cmp rax, rdx
1459a40a1: 480f43c2 cmovae rax, rdx
1459a40a5: 4c8d0401 lea r8, [rcx + rax]
1459a40a9: 49ffc0 inc r8
1459a40ac: 4d39c7 cmp r15, r8
1459a40af: 7313 jae 0x1459a40c4
1459a40b1: 4c01f8 add rax, r15
1459a40b4: 48ffc0 inc rax
1459a40b7: 4839c8 cmp rax, rcx
1459a40ba: 7608 jbe 0x1459a40c4
1459a40bc: 4889c8 mov rax, rcx
1459a40bf: 4d89fa mov r10, r15
1459a40c2: eb62 jmp 0x1459a4126
1459a40c4: 49ffc1 inc r9
1459a40c7: 4489c8 mov eax, r9d
1459a40ca: 83e01f and eax, 0x1f
1459a40cd: 41b820000000 mov r8d, 0x20
1459a40d3: 4c0f45c0 cmovne r8, rax
1459a40d7: 4d29c1 sub r9, r8
1459a40da: 4a8d0409 lea rax, [rcx + r9]
1459a40de: 4f8d140f lea r10, [r15 + r9]
1459a40e2: 4531c0 xor r8d, r8d
1459a40e5: 0f280594534100 movaps xmm0, xmmword ptr [rip + 0x415394]
1459a40ec: 0f1f4000 nop dword ptr [rax]
1459a40f0: 420f100c01 movups xmm1, xmmword ptr [rcx + r8]
1459a40f5: 420f10540110 movups xmm2, xmmword ptr [rcx + r8 + 0x10]
1459a40fb: 430f101c07 movups xmm3, xmmword ptr [r15 + r8]
1459a4100: 430f10640710 movups xmm4, xmmword ptr [r15 + r8 + 0x10]
1459a4106: 0f57c8 xorps xmm1, xmm0
1459a4109: 0f56cb orps xmm1, xmm3
1459a410c: 0f57d0 xorps xmm2, xmm0
1459a410f: 0f56d4 orps xmm2, xmm4
1459a4112: 430f110c07 movups xmmword ptr [r15 + r8], xmm1
1459a4117: 430f11540710 movups xmmword ptr [r15 + r8 + 0x10], xmm2
1459a411d: 4983c020 add r8, 0x20
1459a4121: 4d39c1 cmp r9, r8
1459a4124: 75ca jne 0x1459a40f0
1459a4126: 4901f7 add r15, rsi
1459a4129: 4c8d0c11 lea r9, [rcx + rdx]
1459a412d: 0f1f00 nop dword ptr [rax]
1459a4130: 4c39c8 cmp rax, r9
1459a4133: 7416 je 0x1459a414b
1459a4135: 440fb600 movzx r8d, byte ptr [rax]
1459a4139: 4180f001 xor r8b, 1
1459a413d: 450802 or byte ptr [r10], r8b
1459a4140: 48ffc0 inc rax
1459a4143: 49ffc2 inc r10
1459a4146: 4d39fa cmp r10, r15
1459a4149: 75e5 jne 0x1459a4130
1459a414b: 4885d2 test rdx, rdx
1459a414e: 740b je 0x1459a415b
1459a4150: 41b801000000 mov r8d, 1
1459a4156: e875e065fa call 0x1400021d0
1459a415b: 488b5530 mov rdx, qword ptr [rbp + 0x30]
1459a415f: 4885d2 test rdx, rdx
1459a4162: 7414 je 0x1459a4178
1459a4164: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1459a4168: 48c1e203 shl rdx, 3
1459a416c: 41b808000000 mov r8d, 8
1459a4172: e859e065fa call 0x1400021d0
1459a4177: 90 nop
1459a4178: 4881c4e8000000 add rsp, 0xe8
1459a417f: 5b pop rbx
1459a4180: 5f pop rdi
1459a4181: 5e pop rsi
1459a4182: 415c pop r12
1459a4184: 415d pop r13
1459a4186: 415e pop r14
1459a4188: 415f pop r15
1459a418a: 5d pop rbp
1459a418b: c3 ret
1459a418c: 4c8d056df08901 lea r8, [rip + 0x189f06d]
1459a4193: 4c89d9 mov rcx, r11
1459a4196: 4889da mov rdx, rbx
1459a4199: e8a5044000 call 0x145da4643
1459a419e: 90 nop
1459a419f: eb38 jmp 0x1459a41d9
1459a41a1: 488d0d10f08901 lea rcx, [rip + 0x189f010]
1459a41a8: e893074000 call 0x145da4940
1459a41ad: 90 nop
1459a41ae: eb29 jmp 0x1459a41d9
1459a41b0: 4c8d0519f08901 lea r8, [rip + 0x189f019]
1459a41b7: 4889d9 mov rcx, rbx
1459a41ba: 4889f2 mov rdx, rsi
1459a41bd: e881044000 call 0x145da4643
1459a41c2: 90 nop
1459a41c3: eb14 jmp 0x1459a41d9
1459a41c5: 4c8d051cf08901 lea r8, [rip + 0x189f01c]
1459a41cc: 4889d9 mov rcx, rbx
1459a41cf: 488b5550 mov rdx, qword ptr [rbp + 0x50]
1459a41d3: e86b044000 call 0x145da4643
1459a41d8: 90 nop
1459a41d9: 0f0b ud2

1459c2f40: 55 push rbp
1459c2f41: 4157 push r15
1459c2f43: 4156 push r14
1459c2f45: 4155 push r13
1459c2f47: 4154 push r12
1459c2f49: 56 push rsi
1459c2f4a: 57 push rdi
1459c2f4b: 53 push rbx
1459c2f4c: 4883ec48 sub rsp, 0x48
1459c2f50: 488d6c2440 lea rbp, [rsp + 0x40]
1459c2f55: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459c2f5d: 4889ce mov rsi, rcx
1459c2f60: 488b4a10 mov rcx, qword ptr [rdx + 0x10]
1459c2f64: 4c8b7218 mov r14, qword ptr [rdx + 0x18]
1459c2f68: 4c39f1 cmp rcx, r14
1459c2f6b: 0f832d010000 jae 0x1459c309e
1459c2f71: 4c8b3a mov r15, qword ptr [rdx]
1459c2f74: 4c8b6208 mov r12, qword ptr [rdx + 8]
1459c2f78: 498b5710 mov rdx, qword ptr [r15 + 0x10]
1459c2f7c: 4889c8 mov rax, rcx
1459c2f7f: 48c1e007 shl rax, 7
1459c2f83: 4883c814 or rax, 0x14
1459c2f87: 4989cd mov r13, rcx
1459c2f8a: eb14 jmp 0x1459c2fa0
1459c2f8c: 0f1f4000 nop dword ptr [rax]
1459c2f90: 49ffc5 inc r13
1459c2f93: 4883e880 sub rax, -0x80
1459c2f97: 4d39ee cmp r14, r13
1459c2f9a: 0f84fe000000 je 0x1459c309e
1459c2fa0: 4939d5 cmp r13, rdx
1459c2fa3: 0f8320010000 jae 0x1459c30c9
1459c2fa9: 4d8b4708 mov r8, qword ptr [r15 + 8]
1459c2fad: 41837c00fc01 cmp dword ptr [r8 + rax - 4], 1
1459c2fb3: 75db jne 0x1459c2f90
1459c2fb5: 458b0400 mov r8d, dword ptr [r8 + rax]
1459c2fb9: 453b0424 cmp r8d, dword ptr [r12]
1459c2fbd: 75d1 jne 0x1459c2f90
1459c2fbf: e83cf263fa call 0x140002200
1459c2fc4: b920000000 mov ecx, 0x20
1459c2fc9: ba08000000 mov edx, 8
1459c2fce: e8edf163fa call 0x1400021c0
1459c2fd3: 4885c0 test rax, rax
1459c2fd6: 0f8411010000 je 0x1459c30ed
1459c2fdc: 4c8928 mov qword ptr [rax], r13
1459c2fdf: 49ffc5 inc r13
1459c2fe2: 48c745e804000000 mov qword ptr [rbp - 0x18], 4
1459c2fea: 488945f0 mov qword ptr [rbp - 0x10], rax
1459c2fee: bf01000000 mov edi, 1
1459c2ff3: 488d5de8 lea rbx, [rbp - 0x18]
1459c2ff7: 48897df8 mov qword ptr [rbp - 8], rdi
1459c2ffb: 4d39f5 cmp r13, r14
1459c2ffe: 0f8389000000 jae 0x1459c308d
1459c3004: 498b5710 mov rdx, qword ptr [r15 + 0x10]
1459c3008: 4939d5 cmp r13, rdx
1459c300b: 4889d1 mov rcx, rdx
1459c300e: 490f47cd cmova rcx, r13
1459c3012: 4d89e8 mov r8, r13
1459c3015: 49c1e007 shl r8, 7
1459c3019: 4983c814 or r8, 0x14
1459c301d: eb0d jmp 0x1459c302c
1459c301f: 90 nop
1459c3020: 49ffc5 inc r13
1459c3023: 4983e880 sub r8, -0x80
1459c3027: 4d39ee cmp r14, r13
1459c302a: 7461 je 0x1459c308d
1459c302c: 4939d5 cmp r13, rdx
1459c302f: 0f83a9000000 jae 0x1459c30de
1459c3035: 4d8b4f08 mov r9, qword ptr [r15 + 8]
1459c3039: 43837c01fc01 cmp dword ptr [r9 + r8 - 4], 1
1459c303f: 75df jne 0x1459c3020
1459c3041: 478b0c01 mov r9d, dword ptr [r9 + r8]
1459c3045: 453b0c24 cmp r9d, dword ptr [r12]
1459c3049: 75d5 jne 0x1459c3020
1459c304b: 483b7de8 cmp rdi, qword ptr [rbp - 0x18]
1459c304f: 7525 jne 0x1459c3076
1459c3051: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
1459c305a: 41b801000000 mov r8d, 1
1459c3060: 41b908000000 mov r9d, 8
1459c3066: 4889d9 mov rcx, rbx
1459c3069: 4889fa mov rdx, rdi
1459c306c: e8ff782300 call 0x145bfa970
1459c3071: 90 nop
1459c3072: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459c3076: 4c892cf8 mov qword ptr [rax + rdi*8], r13
1459c307a: 49ffc5 inc r13
1459c307d: 48ffc7 inc rdi
1459c3080: 48897df8 mov qword ptr [rbp - 8], rdi
1459c3084: 4d39f5 cmp r13, r14
1459c3087: 0f8277ffffff jb 0x1459c3004
1459c308d: 488b45f8 mov rax, qword ptr [rbp - 8]
1459c3091: 48894610 mov qword ptr [rsi + 0x10], rax
1459c3095: 0f1045e8 movups xmm0, xmmword ptr [rbp - 0x18]
1459c3099: 0f1106 movups xmmword ptr [rsi], xmm0
1459c309c: eb17 jmp 0x1459c30b5
1459c309e: 48c70600000000 mov qword ptr [rsi], 0
1459c30a5: 48c7460808000000 mov qword ptr [rsi + 8], 8
1459c30ad: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1459c30b5: 4889f0 mov rax, rsi
1459c30b8: 4883c448 add rsp, 0x48
1459c30bc: 5b pop rbx
1459c30bd: 5f pop rdi
1459c30be: 5e pop rsi
1459c30bf: 415c pop r12
1459c30c1: 415d pop r13
1459c30c3: 415e pop r14
1459c30c5: 415f pop r15
1459c30c7: 5d pop rbp
1459c30c8: c3 ret
1459c30c9: 4839d1 cmp rcx, rdx
1459c30cc: 480f46ca cmovbe rcx, rdx
1459c30d0: 4c8d05d1888401 lea r8, [rip + 0x18488d1]
1459c30d7: e877653d00 call 0x145d99653
1459c30dc: 0f0b ud2
1459c30de: 4c8d05c3888401 lea r8, [rip + 0x18488c3]
1459c30e5: e869653d00 call 0x145d99653
1459c30ea: 90 nop
1459c30eb: 0f0b ud2
1459c30ed: b908000000 mov ecx, 8
1459c30f2: ba20000000 mov edx, 0x20
1459c30f7: e8bf613d00 call 0x145d992bb
1459c30fc: 0f0b ud2

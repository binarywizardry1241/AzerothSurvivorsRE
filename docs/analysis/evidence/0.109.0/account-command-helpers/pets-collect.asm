1459c7c20: 55 push rbp
1459c7c21: 4157 push r15
1459c7c23: 4156 push r14
1459c7c25: 4155 push r13
1459c7c27: 4154 push r12
1459c7c29: 56 push rsi
1459c7c2a: 57 push rdi
1459c7c2b: 53 push rbx
1459c7c2c: 4883ec68 sub rsp, 0x68
1459c7c30: 488d6c2460 lea rbp, [rsp + 0x60]
1459c7c35: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459c7c3d: 4889d7 mov rdi, rdx
1459c7c40: 4889ce mov rsi, rcx
1459c7c43: 4c8b7210 mov r14, qword ptr [rdx + 0x10]
1459c7c47: 4d85f6 test r14, r14
1459c7c4a: 7444 je 0x1459c7c90
1459c7c4c: 488b07 mov rax, qword ptr [rdi]
1459c7c4f: 488b4f08 mov rcx, qword ptr [rdi + 8]
1459c7c53: 4989cf mov r15, rcx
1459c7c56: 4929c7 sub r15, rax
1459c7c59: 49c1ef03 shr r15, 3
1459c7c5d: 49bcabaaaaaaaaaaaaaa movabs r12, 0xaaaaaaaaaaaaaaab
1459c7c67: 4d0faffc imul r15, r12
1459c7c6b: 4d39fe cmp r14, r15
1459c7c6e: 4d89fd mov r13, r15
1459c7c71: 4d0f42ee cmovb r13, r14
1459c7c75: 48ba5555555555555505 movabs rdx, 0x555555555555555
1459c7c7f: 4939d5 cmp r13, rdx
1459c7c82: 762f jbe 0x1459c7cb3
1459c7c84: 31c9 xor ecx, ecx
1459c7c86: 4889da mov rdx, rbx
1459c7c89: e82d163d00 call 0x145d992bb
1459c7c8e: 0f0b ud2
1459c7c90: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
1459c7c98: 48c745f008000000 mov qword ptr [rbp - 0x10], 8
1459c7ca0: 488d5df8 lea rbx, [rbp - 8]
1459c7ca4: 48c745f800000000 mov qword ptr [rbp - 8], 0
1459c7cac: b808000000 mov eax, 8
1459c7cb1: eb63 jmp 0x1459c7d16
1459c7cb3: 4839c1 cmp rcx, rax
1459c7cb6: 742a je 0x1459c7ce2
1459c7cb8: 4a8d04ed00000000 lea rax, [r13*8]
1459c7cc0: 488d1c40 lea rbx, [rax + rax*2]
1459c7cc4: e837a563fa call 0x140002200
1459c7cc9: ba08000000 mov edx, 8
1459c7cce: 4889d9 mov rcx, rbx
1459c7cd1: e8eaa463fa call 0x1400021c0
1459c7cd6: b908000000 mov ecx, 8
1459c7cdb: 4885c0 test rax, rax
1459c7cde: 7507 jne 0x1459c7ce7
1459c7ce0: eba4 jmp 0x1459c7c86
1459c7ce2: b808000000 mov eax, 8
1459c7ce7: 4c896de8 mov qword ptr [rbp - 0x18], r13
1459c7ceb: 488945f0 mov qword ptr [rbp - 0x10], rax
1459c7cef: 488d5df8 lea rbx, [rbp - 8]
1459c7cf3: 48c745f800000000 mov qword ptr [rbp - 8], 0
1459c7cfb: 4c8b4708 mov r8, qword ptr [rdi + 8]
1459c7cff: 4c2b07 sub r8, qword ptr [rdi]
1459c7d02: 49c1e803 shr r8, 3
1459c7d06: 4d0fafc4 imul r8, r12
1459c7d0a: 4d39c6 cmp r14, r8
1459c7d0d: 4d0f42c6 cmovb r8, r14
1459c7d11: 4d39c7 cmp r15, r8
1459c7d14: 723e jb 0x1459c7d54
1459c7d16: 31c9 xor ecx, ecx
1459c7d18: 488945e0 mov qword ptr [rbp - 0x20], rax
1459c7d1c: 48895dd0 mov qword ptr [rbp - 0x30], rbx
1459c7d20: 48894dd8 mov qword ptr [rbp - 0x28], rcx
1459c7d24: 488d55d0 lea rdx, [rbp - 0x30]
1459c7d28: 4889f9 mov rcx, rdi
1459c7d2b: e8205f0000 call 0x1459cdc50
1459c7d30: 90 nop
1459c7d31: 488b45f8 mov rax, qword ptr [rbp - 8]
1459c7d35: 48894610 mov qword ptr [rsi + 0x10], rax
1459c7d39: 0f1045e8 movups xmm0, xmmword ptr [rbp - 0x18]
1459c7d3d: 0f1106 movups xmmword ptr [rsi], xmm0
1459c7d40: 4889f0 mov rax, rsi
1459c7d43: 4883c468 add rsp, 0x68
1459c7d47: 5b pop rbx
1459c7d48: 5f pop rdi
1459c7d49: 5e pop rsi
1459c7d4a: 415c pop r12
1459c7d4c: 415d pop r13
1459c7d4e: 415e pop r14
1459c7d50: 415f pop r15
1459c7d52: 5d pop rbp
1459c7d53: c3 ret
1459c7d54: 48c744242018000000 mov qword ptr [rsp + 0x20], 0x18
1459c7d5d: 488d4de8 lea rcx, [rbp - 0x18]
1459c7d61: 41b908000000 mov r9d, 8
1459c7d67: 31d2 xor edx, edx
1459c7d69: e8022c2300 call 0x145bfa970
1459c7d6e: 90 nop
1459c7d6f: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459c7d73: 488b4df8 mov rcx, qword ptr [rbp - 8]
1459c7d77: eb9f jmp 0x1459c7d18

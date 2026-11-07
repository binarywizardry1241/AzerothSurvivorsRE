1458f4c30: 55 push rbp
1458f4c31: 4157 push r15
1458f4c33: 4156 push r14
1458f4c35: 4154 push r12
1458f4c37: 56 push rsi
1458f4c38: 57 push rdi
1458f4c39: 53 push rbx
1458f4c3a: 4883ec50 sub rsp, 0x50
1458f4c3e: 488d6c2450 lea rbp, [rsp + 0x50]
1458f4c43: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458f4c4b: 80b9120c000005 cmp byte ptr [rcx + 0xc12], 5
1458f4c52: 0f8541010000 jne 0x1458f4d99
1458f4c58: 4889ce mov rsi, rcx
1458f4c5b: 0fb699000c0000 movzx ebx, byte ptr [rcx + 0xc00]
1458f4c62: c681000c000001 mov byte ptr [rcx + 0xc00], 1
1458f4c69: c681120c000001 mov byte ptr [rcx + 0xc12], 1
1458f4c70: f30f10816c0b0000 movss xmm0, dword ptr [rcx + 0xb6c]
1458f4c78: f30f580580f37001 addss xmm0, dword ptr [rip + 0x170f380]
1458f4c80: f30f1181c80b0000 movss dword ptr [rcx + 0xbc8], xmm0
1458f4c88: 488db920060000 lea rdi, [rcx + 0x620]
1458f4c8f: 488b9168040000 mov rdx, qword ptr [rcx + 0x468]
1458f4c96: 448b8150050000 mov r8d, dword ptr [rcx + 0x550]
1458f4c9d: 488d4dd8 lea rcx, [rbp - 0x28]
1458f4ca1: e8fa60fdff call 0x1458cada0
1458f4ca6: 4c8bb630060000 mov r14, qword ptr [rsi + 0x630]
1458f4cad: 4c3bb620060000 cmp r14, qword ptr [rsi + 0x620]
1458f4cb4: 7509 jne 0x1458f4cbf
1458f4cb6: 4889f9 mov rcx, rdi
1458f4cb9: e822544000 call 0x145cfa0e0
1458f4cbe: 90 nop
1458f4cbf: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
1458f4cc6: 4c89f1 mov rcx, r14
1458f4cc9: 48c1e105 shl rcx, 5
1458f4ccd: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1458f4cd1: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
1458f4cd5: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1458f4cda: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1458f4cde: 49ffc6 inc r14
1458f4ce1: 4c89b630060000 mov qword ptr [rsi + 0x630], r14
1458f4ce8: ff8650050000 inc dword ptr [rsi + 0x550]
1458f4cee: 84db test bl, bl
1458f4cf0: 0f85a3000000 jne 0x1458f4d99
1458f4cf6: 488d1d926fa101 lea rbx, [rip + 0x1a16f92]
1458f4cfd: 41be07000000 mov r14d, 7
1458f4d03: ba07000000 mov edx, 7
1458f4d08: 4889d9 mov rcx, rbx
1458f4d0b: e8100afaff call 0x145895720
1458f4d10: 4885c0 test rax, rax
1458f4d13: 480f45d8 cmovne rbx, rax
1458f4d17: 4c0f45f2 cmovne r14, rdx
1458f4d1b: 4c8d3d746fa101 lea r15, [rip + 0x1a16f74]
1458f4d22: 41bc1b000000 mov r12d, 0x1b
1458f4d28: ba1b000000 mov edx, 0x1b
1458f4d2d: 4c89f9 mov rcx, r15
1458f4d30: e8eb09faff call 0x145895720
1458f4d35: 4885c0 test rax, rax
1458f4d38: 4c0f45f8 cmovne r15, rax
1458f4d3c: 490f44d4 cmove rdx, r12
1458f4d40: 4889542420 mov qword ptr [rsp + 0x20], rdx
1458f4d45: 488d4dd8 lea rcx, [rbp - 0x28]
1458f4d49: 4889da mov rdx, rbx
1458f4d4c: 4d89f0 mov r8, r14
1458f4d4f: 4d89f9 mov r9, r15
1458f4d52: e8e93cfdff call 0x1458c8a40
1458f4d57: 488b9e30060000 mov rbx, qword ptr [rsi + 0x630]
1458f4d5e: 483b9e20060000 cmp rbx, qword ptr [rsi + 0x620]
1458f4d65: 7509 jne 0x1458f4d70
1458f4d67: 4889f9 mov rcx, rdi
1458f4d6a: e871534000 call 0x145cfa0e0
1458f4d6f: 90 nop
1458f4d70: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
1458f4d77: 4889d9 mov rcx, rbx
1458f4d7a: 48c1e105 shl rcx, 5
1458f4d7e: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1458f4d82: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
1458f4d86: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1458f4d8b: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1458f4d8f: 48ffc3 inc rbx
1458f4d92: 48899e30060000 mov qword ptr [rsi + 0x630], rbx
1458f4d99: 4883c450 add rsp, 0x50
1458f4d9d: 5b pop rbx
1458f4d9e: 5f pop rdi
1458f4d9f: 5e pop rsi
1458f4da0: 415c pop r12
1458f4da2: 415e pop r14
1458f4da4: 415f pop r15
1458f4da6: 5d pop rbp
1458f4da7: c3 ret

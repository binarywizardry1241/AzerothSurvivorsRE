1401c0dce: 488b6c2438 mov rbp, qword ptr [rsp + 0x38]
1401c0dd3: 498b1424 mov rdx, qword ptr [r12]
1401c0dd7: 4531d2 xor r10d, r10d
1401c0dda: 4989d3 mov r11, rdx
1401c0ddd: 488b442448 mov rax, qword ptr [rsp + 0x48]
1401c0de2: 4c2b5818 sub r11, qword ptr [rax + 0x18]
1401c0de6: 4d0f42da cmovb r11, r10
1401c0dea: 482b5038 sub rdx, qword ptr [rax + 0x38]
1401c0dee: 490f42d2 cmovb rdx, r10
1401c0df2: 496bcb58 imul rcx, r11, 0x58
1401c0df6: 48034808 add rcx, qword ptr [rax + 8]
1401c0dfa: 488b7010 mov rsi, qword ptr [rax + 0x10]
1401c0dfe: 4c6bc258 imul r8, rdx, 0x58
1401c0e02: 4c034028 add r8, qword ptr [rax + 0x28]
1401c0e06: 4989f1 mov r9, rsi
1401c0e09: 4d29d9 sub r9, r11
1401c0e0c: 4d0f42ca cmovb r9, r10
1401c0e10: 488b5830 mov rbx, qword ptr [rax + 0x30]
1401c0e14: 41bf08000000 mov r15d, 8
1401c0e1a: 490f42cf cmovb rcx, r15
1401c0e1e: 4c0f42de cmovb r11, rsi
1401c0e22: 4989dd mov r13, rbx
1401c0e25: 4929d5 sub r13, rdx
1401c0e28: 4d0f42c7 cmovb r8, r15
1401c0e2c: 4d0f42ea cmovb r13, r10
1401c0e30: 4c8b5040 mov r10, qword ptr [rax + 0x40]
1401c0e34: 480f42d3 cmovb rdx, rbx
1401c0e38: 4c01d2 add rdx, r10
1401c0e3b: 4d29ea sub r10, r13
1401c0e3e: 4d29ca sub r10, r9
1401c0e41: 4d891424 mov qword ptr [r12], r10
1401c0e45: 4d6bc958 imul r9, r9, 0x58
1401c0e49: 4901c9 add r9, rcx
1401c0e4c: 4d6bd558 imul r10, r13, 0x58
1401c0e50: 4d01c2 add r10, r8
1401c0e53: 4c01da add rdx, r11
1401c0e56: 4829da sub rdx, rbx
1401c0e59: 4829f2 sub rdx, rsi
1401c0e5c: 48ffc2 inc rdx
1401c0e5f: eb23 jmp 0x1401c0e84
1401c0e61: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401c0e70: 4c8d5958 lea r11, [rcx + 0x58]
1401c0e74: 49891424 mov qword ptr [r12], rdx
1401c0e78: 48ffc2 inc rdx
1401c0e7b: 80795400 cmp byte ptr [rcx + 0x54], 0
1401c0e7f: 4c89d9 mov rcx, r11
1401c0e82: 7422 je 0x1401c0ea6
1401c0e84: 4885c9 test rcx, rcx
1401c0e87: 7405 je 0x1401c0e8e
1401c0e89: 4c39c9 cmp rcx, r9
1401c0e8c: 75e2 jne 0x1401c0e70
1401c0e8e: 31c9 xor ecx, ecx
1401c0e90: 4d85c0 test r8, r8
1401c0e93: 7413 je 0x1401c0ea8
1401c0e95: 4d39d0 cmp r8, r10
1401c0e98: 740e je 0x1401c0ea8
1401c0e9a: 4c89c1 mov rcx, r8
1401c0e9d: 4983c058 add r8, 0x58
1401c0ea1: 4531db xor r11d, r11d
1401c0ea4: ebce jmp 0x1401c0e74
1401c0ea6: b101 mov cl, 1

1401c2b5e: 488b6c2438 mov rbp, qword ptr [rsp + 0x38]
1401c2b63: 498b1424 mov rdx, qword ptr [r12]
1401c2b67: 4531d2 xor r10d, r10d
1401c2b6a: 4989d3 mov r11, rdx
1401c2b6d: 488b442448 mov rax, qword ptr [rsp + 0x48]
1401c2b72: 4c2b5818 sub r11, qword ptr [rax + 0x18]
1401c2b76: 4d0f42da cmovb r11, r10
1401c2b7a: 482b5038 sub rdx, qword ptr [rax + 0x38]
1401c2b7e: 490f42d2 cmovb rdx, r10
1401c2b82: 496bcb58 imul rcx, r11, 0x58
1401c2b86: 48034808 add rcx, qword ptr [rax + 8]
1401c2b8a: 488b7010 mov rsi, qword ptr [rax + 0x10]
1401c2b8e: 4c6bc258 imul r8, rdx, 0x58
1401c2b92: 4c034028 add r8, qword ptr [rax + 0x28]
1401c2b96: 4989f1 mov r9, rsi
1401c2b99: 4d29d9 sub r9, r11
1401c2b9c: 4d0f42ca cmovb r9, r10
1401c2ba0: 488b5830 mov rbx, qword ptr [rax + 0x30]
1401c2ba4: 41bf08000000 mov r15d, 8
1401c2baa: 490f42cf cmovb rcx, r15
1401c2bae: 4c0f42de cmovb r11, rsi
1401c2bb2: 4989dd mov r13, rbx
1401c2bb5: 4929d5 sub r13, rdx
1401c2bb8: 4d0f42c7 cmovb r8, r15
1401c2bbc: 4d0f42ea cmovb r13, r10
1401c2bc0: 4c8b5040 mov r10, qword ptr [rax + 0x40]
1401c2bc4: 480f42d3 cmovb rdx, rbx
1401c2bc8: 4c01d2 add rdx, r10
1401c2bcb: 4d29ea sub r10, r13
1401c2bce: 4d29ca sub r10, r9
1401c2bd1: 4d891424 mov qword ptr [r12], r10
1401c2bd5: 4d6bc958 imul r9, r9, 0x58
1401c2bd9: 4901c9 add r9, rcx
1401c2bdc: 4d6bd558 imul r10, r13, 0x58
1401c2be0: 4d01c2 add r10, r8
1401c2be3: 4c01da add rdx, r11
1401c2be6: 4829da sub rdx, rbx
1401c2be9: 4829f2 sub rdx, rsi
1401c2bec: 48ffc2 inc rdx
1401c2bef: eb23 jmp 0x1401c2c14
1401c2bf1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401c2c00: 4c8d5958 lea r11, [rcx + 0x58]
1401c2c04: 49891424 mov qword ptr [r12], rdx
1401c2c08: 48ffc2 inc rdx
1401c2c0b: 80795400 cmp byte ptr [rcx + 0x54], 0
1401c2c0f: 4c89d9 mov rcx, r11
1401c2c12: 7422 je 0x1401c2c36
1401c2c14: 4885c9 test rcx, rcx
1401c2c17: 7405 je 0x1401c2c1e
1401c2c19: 4c39c9 cmp rcx, r9
1401c2c1c: 75e2 jne 0x1401c2c00
1401c2c1e: 31c9 xor ecx, ecx
1401c2c20: 4d85c0 test r8, r8
1401c2c23: 7413 je 0x1401c2c38
1401c2c25: 4d39d0 cmp r8, r10
1401c2c28: 740e je 0x1401c2c38
1401c2c2a: 4c89c1 mov rcx, r8
1401c2c2d: 4983c058 add r8, 0x58
1401c2c31: 4531db xor r11d, r11d
1401c2c34: ebce jmp 0x1401c2c04
1401c2c36: b101 mov cl, 1

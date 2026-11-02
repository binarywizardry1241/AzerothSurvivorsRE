1401c2c38: 4d8b06 mov r8, qword ptr [r14]
1401c2c3b: 4531d2 xor r10d, r10d
1401c2c3e: 4c89c6 mov rsi, r8
1401c2c41: 488b442450 mov rax, qword ptr [rsp + 0x50]
1401c2c46: 482b7018 sub rsi, qword ptr [rax + 0x18]
1401c2c4a: 490f42f2 cmovb rsi, r10
1401c2c4e: 4c2b4038 sub r8, qword ptr [rax + 0x38]
1401c2c52: 4d0f42c2 cmovb r8, r10
1401c2c56: 488d1476 lea rdx, [rsi + rsi*2]
1401c2c5a: 48c1e203 shl rdx, 3
1401c2c5e: 48035008 add rdx, qword ptr [rax + 8]
1401c2c62: 488b5810 mov rbx, qword ptr [rax + 0x10]
1401c2c66: 4f8d0c40 lea r9, [r8 + r8*2]
1401c2c6a: 49c1e103 shl r9, 3
1401c2c6e: 4c034828 add r9, qword ptr [rax + 0x28]
1401c2c72: 4989db mov r11, rbx
1401c2c75: 4929f3 sub r11, rsi
1401c2c78: 4d0f42da cmovb r11, r10
1401c2c7c: 4c8b7830 mov r15, qword ptr [rax + 0x30]
1401c2c80: 41bc08000000 mov r12d, 8
1401c2c86: 490f42d4 cmovb rdx, r12
1401c2c8a: 480f42f3 cmovb rsi, rbx
1401c2c8e: 4d89fd mov r13, r15
1401c2c91: 4d29c5 sub r13, r8
1401c2c94: 4d0f42cc cmovb r9, r12
1401c2c98: 4d0f42ea cmovb r13, r10
1401c2c9c: 4c8b5040 mov r10, qword ptr [rax + 0x40]
1401c2ca0: 4d0f42c7 cmovb r8, r15
1401c2ca4: 4d01d0 add r8, r10
1401c2ca7: 4d29ea sub r10, r13
1401c2caa: 4d29da sub r10, r11
1401c2cad: 4d8916 mov qword ptr [r14], r10
1401c2cb0: 4f8d145b lea r10, [r11 + r11*2]
1401c2cb4: 4e8d14d2 lea r10, [rdx + r10*8]
1401c2cb8: 4e8d1c6d00000000 lea r11, [r13*2]
1401c2cc0: 4d01eb add r11, r13
1401c2cc3: 4f8d1cd9 lea r11, [r9 + r11*8]
1401c2cc7: 4901f0 add r8, rsi
1401c2cca: 4d29f8 sub r8, r15
1401c2ccd: 4929d8 sub r8, rbx
1401c2cd0: 49ffc0 inc r8
1401c2cd3: eb1e jmp 0x1401c2cf3
1401c2cd5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401c2ce0: 488d7218 lea rsi, [rdx + 0x18]
1401c2ce4: 4d8906 mov qword ptr [r14], r8
1401c2ce7: 49ffc0 inc r8
1401c2cea: 807a1400 cmp byte ptr [rdx + 0x14], 0
1401c2cee: 4889f2 mov rdx, rsi
1401c2cf1: 7421 je 0x1401c2d14
1401c2cf3: 4885d2 test rdx, rdx
1401c2cf6: 7405 je 0x1401c2cfd
1401c2cf8: 4c39d2 cmp rdx, r10
1401c2cfb: 75e3 jne 0x1401c2ce0
1401c2cfd: 31d2 xor edx, edx
1401c2cff: 4d85c9 test r9, r9
1401c2d02: 7412 je 0x1401c2d16
1401c2d04: 4d39d9 cmp r9, r11
1401c2d07: 740d je 0x1401c2d16
1401c2d09: 4c89ca mov rdx, r9
1401c2d0c: 4983c118 add r9, 0x18
1401c2d10: 31f6 xor esi, esi
1401c2d12: ebd0 jmp 0x1401c2ce4
1401c2d14: b201 mov dl, 1

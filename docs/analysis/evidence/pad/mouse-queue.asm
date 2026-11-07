1401c0ea8: 4d8b06 mov r8, qword ptr [r14]
1401c0eab: 4531d2 xor r10d, r10d
1401c0eae: 4c89c6 mov rsi, r8
1401c0eb1: 488b442450 mov rax, qword ptr [rsp + 0x50]
1401c0eb6: 482b7018 sub rsi, qword ptr [rax + 0x18]
1401c0eba: 490f42f2 cmovb rsi, r10
1401c0ebe: 4c2b4038 sub r8, qword ptr [rax + 0x38]
1401c0ec2: 4d0f42c2 cmovb r8, r10
1401c0ec6: 488d1476 lea rdx, [rsi + rsi*2]
1401c0eca: 48c1e203 shl rdx, 3
1401c0ece: 48035008 add rdx, qword ptr [rax + 8]
1401c0ed2: 488b5810 mov rbx, qword ptr [rax + 0x10]
1401c0ed6: 4f8d0c40 lea r9, [r8 + r8*2]
1401c0eda: 49c1e103 shl r9, 3
1401c0ede: 4c034828 add r9, qword ptr [rax + 0x28]
1401c0ee2: 4989db mov r11, rbx
1401c0ee5: 4929f3 sub r11, rsi
1401c0ee8: 4d0f42da cmovb r11, r10
1401c0eec: 4c8b7830 mov r15, qword ptr [rax + 0x30]
1401c0ef0: 41bc08000000 mov r12d, 8
1401c0ef6: 490f42d4 cmovb rdx, r12
1401c0efa: 480f42f3 cmovb rsi, rbx
1401c0efe: 4d89fd mov r13, r15
1401c0f01: 4d29c5 sub r13, r8
1401c0f04: 4d0f42cc cmovb r9, r12
1401c0f08: 4d0f42ea cmovb r13, r10
1401c0f0c: 4c8b5040 mov r10, qword ptr [rax + 0x40]
1401c0f10: 4d0f42c7 cmovb r8, r15
1401c0f14: 4d01d0 add r8, r10
1401c0f17: 4d29ea sub r10, r13
1401c0f1a: 4d29da sub r10, r11
1401c0f1d: 4d8916 mov qword ptr [r14], r10
1401c0f20: 4f8d145b lea r10, [r11 + r11*2]
1401c0f24: 4e8d14d2 lea r10, [rdx + r10*8]
1401c0f28: 4e8d1c6d00000000 lea r11, [r13*2]
1401c0f30: 4d01eb add r11, r13
1401c0f33: 4f8d1cd9 lea r11, [r9 + r11*8]
1401c0f37: 4901f0 add r8, rsi
1401c0f3a: 4d29f8 sub r8, r15
1401c0f3d: 4929d8 sub r8, rbx
1401c0f40: 49ffc0 inc r8
1401c0f43: eb1e jmp 0x1401c0f63
1401c0f45: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401c0f50: 488d7218 lea rsi, [rdx + 0x18]
1401c0f54: 4d8906 mov qword ptr [r14], r8
1401c0f57: 49ffc0 inc r8
1401c0f5a: 807a1400 cmp byte ptr [rdx + 0x14], 0
1401c0f5e: 4889f2 mov rdx, rsi
1401c0f61: 7421 je 0x1401c0f84
1401c0f63: 4885d2 test rdx, rdx
1401c0f66: 7405 je 0x1401c0f6d
1401c0f68: 4c39d2 cmp rdx, r10
1401c0f6b: 75e3 jne 0x1401c0f50
1401c0f6d: 31d2 xor edx, edx
1401c0f6f: 4d85c9 test r9, r9
1401c0f72: 7412 je 0x1401c0f86
1401c0f74: 4d39d9 cmp r9, r11
1401c0f77: 740d je 0x1401c0f86
1401c0f79: 4c89ca mov rdx, r9
1401c0f7c: 4983c118 add r9, 0x18
1401c0f80: 31f6 xor esi, esi
1401c0f82: ebd0 jmp 0x1401c0f54
1401c0f84: b201 mov dl, 1

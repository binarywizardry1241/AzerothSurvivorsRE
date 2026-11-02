# Target0.113.2 SHA25658b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb; Capstone5 bounded transcription after REA/Ghidra recovery. Ends exclusive.

# boss-fields [0x145866426,0x145866449)
0x145866426: 4c89f9  mov rcx, r15
0x145866429: e8f2a3f9ff  call 0x145800820
0x14586642e: 4989d5  mov r13, rdx
0x145866431: 458b4744  mov r8d, dword ptr [r15 + 0x44]
0x145866435: 458b4f4c  mov r9d, dword ptr [r15 + 0x4c]
0x145866439: b901000000  mov ecx, 1
0x14586643e: 41ba03000000  mov r10d, 3
0x145866444: e9e5fcffff  jmp 0x14586612e

# enemy-fields [0x1458664b5,0x1458664e7)
0x1458664b5: 4c89f9  mov rcx, r15
0x1458664b8: e8e3a1f9ff  call 0x1458006a0
0x1458664bd: 4889c6  mov rsi, rax
0x1458664c0: 4989d5  mov r13, rdx
0x1458664c3: 488b8dd0020000  mov rcx, qword ptr [rbp + 0x2d0]
0x1458664ca: e841a5f9ff  call 0x145800a10
0x1458664cf: 4889c1  mov rcx, rax
0x1458664d2: 4889f0  mov rax, rsi
0x1458664d5: 458b4724  mov r8d, dword ptr [r15 + 0x24]
0x1458664d9: 458b4f2c  mov r9d, dword ptr [r15 + 0x2c]
0x1458664dd: 450fb6574c  movzx r10d, byte ptr [r15 + 0x4c]
0x1458664e2: e949fcffff  jmp 0x145866130

# hit-publication [0x14586612e,0x14586616c)
0x14586612e: 31d2  xor edx, edx
0x145866130: 4885c0  test rax, rax
0x145866133: 4989df  mov r15, rbx
0x145866136: 0f846b0c0000  je 0x145866da7
0x14586613c: 4489442440  mov dword ptr [rsp + 0x40], r8d
0x145866141: 4489542438  mov dword ptr [rsp + 0x38], r10d
0x145866146: 44894c2430  mov dword ptr [rsp + 0x30], r9d
0x14586614b: 4889542428  mov qword ptr [rsp + 0x28], rdx
0x145866150: 48894c2420  mov qword ptr [rsp + 0x20], rcx
0x145866155: 488d4dd0  lea rcx, [rbp - 0x30]
0x145866159: 4489f2  mov edx, r14d
0x14586615c: 4989c0  mov r8, rax
0x14586615f: 4d89e9  mov r9, r13
0x145866162: e899eb0600  call 0x1458d4d00
0x145866167: e9470c0000  jmp 0x145866db3

# miss-and-send [0x145866da7,0x145866dc5)
0x145866da7: 488d4dd0  lea rcx, [rbp - 0x30]
0x145866dab: 4489f2  mov edx, r14d
0x145866dae: e82d9b0600  call 0x1458d08e0
0x145866db3: 4c8d4dd0  lea r9, [rbp - 0x30]
0x145866db7: 4c89f9  mov rcx, r15
0x145866dba: 4c89e2  mov rdx, r12
0x145866dbd: 4989f8  mov r8, rdi
0x145866dc0: e88bec0100  call 0x145885a50

# special-display-lookup [0x145847c70,0x145847c8c)
0x145847c70: 81c17fdaffff  add ecx, 0xffffda7f
0x145847c76: 83f915  cmp ecx, 0x15
0x145847c79: 770e  ja 0x145847c89
0x145847c7b: 89c8  mov eax, ecx
0x145847c7d: 488d0ddcd07c01  lea rcx, [rip + 0x17cd0dc]
0x145847c84: 488b04c1  mov rax, qword ptr [rcx + rax*8]
0x145847c88: c3  ret
0x145847c89: 31c0  xor eax, eax
0x145847c8b: c3  ret

# miss-serializer [0x1458d08e0,0x1458d0940)
0x1458d08e0: 56  push rsi
0x1458d08e1: 57  push rdi
0x1458d08e2: 4883ec28  sub rsp, 0x28
0x1458d08e6: 89d7  mov edi, edx
0x1458d08e8: 4889ce  mov rsi, rcx
0x1458d08eb: e8101973fa  call 0x140002200
0x1458d08f0: b920000000  mov ecx, 0x20
0x1458d08f5: ba01000000  mov edx, 1
0x1458d08fa: e8c11873fa  call 0x1400021c0
0x1458d08ff: 4885c0  test rax, rax
0x1458d0902: 742b  je 0x1458d092f
0x1458d0904: 81cf00000080  or edi, 0x80000000
0x1458d090a: 8938  mov dword ptr [rax], edi
0x1458d090c: 48c70620000000  mov qword ptr [rsi], 0x20
0x1458d0913: 48894608  mov qword ptr [rsi + 8], rax
0x1458d0917: 48c7461004000000  mov qword ptr [rsi + 0x10], 4
0x1458d091f: 66c746186100  mov word ptr [rsi + 0x18], 0x61
0x1458d0925: 4889f0  mov rax, rsi
0x1458d0928: 4883c428  add rsp, 0x28
0x1458d092c: 5f  pop rdi
0x1458d092d: 5e  pop rsi
0x1458d092e: c3  ret
0x1458d092f: b901000000  mov ecx, 1
0x1458d0934: ba20000000  mov edx, 0x20
0x1458d0939: e84db45c00  call 0x145e9bd8b
0x1458d093e: 0f0b  ud2

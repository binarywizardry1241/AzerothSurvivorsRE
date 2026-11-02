; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145b4a9f0, 0x145b4ab76); bytes SHA-256 01459186fc35b32cc809d7af103500db5b1655d9c1f4ee7c1a4897c80c0c62d1
; Current EXE byte disassembly with Capstone 5.0.7; no process execution.
0000000145b4a9f0: 4157                     push r15
0000000145b4a9f2: 4156                     push r14
0000000145b4a9f4: 4155                     push r13
0000000145b4a9f6: 4154                     push r12
0000000145b4a9f8: 56                       push rsi
0000000145b4a9f9: 57                       push rdi
0000000145b4a9fa: 55                       push rbp
0000000145b4a9fb: 53                       push rbx
0000000145b4a9fc: 4883ec28                 sub rsp, 0x28
0000000145b4aa00: 488b7a20                 mov rdi, qword ptr [rdx + 0x20]
0000000145b4aa04: 4885ff                   test rdi, rdi
0000000145b4aa07: 0f84ae000000             je 0x145b4aabb
0000000145b4aa0d: 4c8bb9b8000000           mov r15, qword ptr [rcx + 0xb8]
0000000145b4aa14: 31f6                     xor esi, esi
0000000145b4aa16: 4d85ff                   test r15, r15
0000000145b4aa19: 0f8444010000             je 0x145b4ab63
0000000145b4aa1f: 488b5a28                 mov rbx, qword ptr [rdx + 0x28]
0000000145b4aa23: 4c8bb1b0000000           mov r14, qword ptr [rcx + 0xb0]
0000000145b4aa2a: 4983ff01                 cmp r15, 1
0000000145b4aa2e: 7454                     je 0x145b4aa84
0000000145b4aa30: 31f6                     xor esi, esi
0000000145b4aa32: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145b4aa40: 4989f4                   mov r12, rsi
0000000145b4aa43: 4d89fd                   mov r13, r15
0000000145b4aa46: 49d1ed                   shr r13, 1
0000000145b4aa49: 4c01ee                   add rsi, r13
0000000145b4aa4c: 488d0476                 lea rax, [rsi + rsi*2]
0000000145b4aa50: 498b4cc608               mov rcx, qword ptr [r14 + rax*8 + 8]
0000000145b4aa55: 4d8b44c610               mov r8, qword ptr [r14 + rax*8 + 0x10]
0000000145b4aa5a: 4c89c5                   mov rbp, r8
0000000145b4aa5d: 4829dd                   sub rbp, rbx
0000000145b4aa60: 4c0f43c3                 cmovae r8, rbx
0000000145b4aa64: 4889fa                   mov rdx, rdi
0000000145b4aa67: e87b924400               call 0x145f93ce7
0000000145b4aa6c: 4898                     cdqe
0000000145b4aa6e: 85c0                     test eax, eax
0000000145b4aa70: 480f45e8                 cmovne rbp, rax
0000000145b4aa74: 4885ed                   test rbp, rbp
0000000145b4aa77: 490f4ff4                 cmovg rsi, r12
0000000145b4aa7b: 4d29ef                   sub r15, r13
0000000145b4aa7e: 4983ff01                 cmp r15, 1
0000000145b4aa82: 77bc                     ja 0x145b4aa40
0000000145b4aa84: 488d0476                 lea rax, [rsi + rsi*2]
0000000145b4aa88: 498b4cc608               mov rcx, qword ptr [r14 + rax*8 + 8]
0000000145b4aa8d: 498b44c610               mov rax, qword ptr [r14 + rax*8 + 0x10]
0000000145b4aa92: 4889c6                   mov rsi, rax
0000000145b4aa95: 4829de                   sub rsi, rbx
0000000145b4aa98: 480f42d8                 cmovb rbx, rax
0000000145b4aa9c: 4889fa                   mov rdx, rdi
0000000145b4aa9f: 4989d8                   mov r8, rbx
0000000145b4aaa2: e840924400               call 0x145f93ce7
0000000145b4aaa7: 4898                     cdqe
0000000145b4aaa9: 85c0                     test eax, eax
0000000145b4aaab: 480f45f0                 cmovne rsi, rax
0000000145b4aaaf: 4885f6                   test rsi, rsi
0000000145b4aab2: 400f94c6                 sete sil
0000000145b4aab6: e9a8000000               jmp 0x145b4ab63
0000000145b4aabb: 4c8b8128010000           mov r8, qword ptr [rcx + 0x128]
0000000145b4aac2: 488b8930010000           mov rcx, qword ptr [rcx + 0x130]
0000000145b4aac9: 8b4230                   mov eax, dword ptr [rdx + 0x30]
0000000145b4aacc: 49b9f0ffffffffffff1f     movabs r9, 0x1ffffffffffffff0
0000000145b4aad6: 4921c9                   and r9, rcx
0000000145b4aad9: 83e10f                   and ecx, 0xf
0000000145b4aadc: 4b8d1488                 lea rdx, [r8 + r9*4]
0000000145b4aae0: 660f6ec0                 movd xmm0, eax
0000000145b4aae4: 660f70c000               pshufd xmm0, xmm0, 0
0000000145b4aae9: 4531d2                   xor r10d, r10d
0000000145b4aaec: 0f1f4000                 nop dword ptr [rax]
0000000145b4aaf0: 4d39d1                   cmp r9, r10
0000000145b4aaf3: 744a                     je 0x145b4ab3f
0000000145b4aaf5: f3430f6f0c90             movdqu xmm1, xmmword ptr [r8 + r10*4]
0000000145b4aafb: f3430f6f549010           movdqu xmm2, xmmword ptr [r8 + r10*4 + 0x10]
0000000145b4ab02: f3430f6f5c9020           movdqu xmm3, xmmword ptr [r8 + r10*4 + 0x20]
0000000145b4ab09: f3430f6f649030           movdqu xmm4, xmmword ptr [r8 + r10*4 + 0x30]
0000000145b4ab10: 660f76d0                 pcmpeqd xmm2, xmm0
0000000145b4ab14: 660f76c8                 pcmpeqd xmm1, xmm0
0000000145b4ab18: 660f6bca                 packssdw xmm1, xmm2
0000000145b4ab1c: 660f76d8                 pcmpeqd xmm3, xmm0
0000000145b4ab20: 660f76e0                 pcmpeqd xmm4, xmm0
0000000145b4ab24: 660f6bdc                 packssdw xmm3, xmm4
0000000145b4ab28: 660f63cb                 packsswb xmm1, xmm3
0000000145b4ab2c: 66440fd7d9               pmovmskb r11d, xmm1
0000000145b4ab31: 4983c210                 add r10, 0x10
0000000145b4ab35: 4585db                   test r11d, r11d
0000000145b4ab38: 74b6                     je 0x145b4aaf0
0000000145b4ab3a: 40b601                   mov sil, 1
0000000145b4ab3d: eb24                     jmp 0x145b4ab63
0000000145b4ab3f: c1e102                   shl ecx, 2
0000000145b4ab42: 4531c0                   xor r8d, r8d
0000000145b4ab45: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145b4ab50: 4c39c1                   cmp rcx, r8
0000000145b4ab53: 400f95c6                 setne sil
0000000145b4ab57: 740a                     je 0x145b4ab63
0000000145b4ab59: 42390402                 cmp dword ptr [rdx + r8], eax
0000000145b4ab5d: 4d8d4004                 lea r8, [r8 + 4]
0000000145b4ab61: 75ed                     jne 0x145b4ab50
0000000145b4ab63: 89f0                     mov eax, esi
0000000145b4ab65: 4883c428                 add rsp, 0x28
0000000145b4ab69: 5b                       pop rbx
0000000145b4ab6a: 5d                       pop rbp
0000000145b4ab6b: 5f                       pop rdi
0000000145b4ab6c: 5e                       pop rsi
0000000145b4ab6d: 415c                     pop r12
0000000145b4ab6f: 415d                     pop r13
0000000145b4ab71: 415e                     pop r14
0000000145b4ab73: 415f                     pop r15
0000000145b4ab75: c3                       ret

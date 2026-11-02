; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145ac20b0, 0x145ac2250); bytes SHA-256 ba53b73770b933718eb360c15c0d37a92f6d0ed59c6d2684087a40c857251ce4
; Current EXE byte disassembly with Capstone 5.0.7; no process execution.
0000000145ac20b0: 4157                     push r15
0000000145ac20b2: 4156                     push r14
0000000145ac20b4: 56                       push rsi
0000000145ac20b5: 57                       push rdi
0000000145ac20b6: 55                       push rbp
0000000145ac20b7: 53                       push rbx
0000000145ac20b8: 4881ec98000000           sub rsp, 0x98
0000000145ac20bf: 4d89c6                   mov r14, r8
0000000145ac20c2: 4889ce                   mov rsi, rcx
0000000145ac20c5: 8d8265a0feff             lea eax, [rdx - 0x15f9b]
0000000145ac20cb: 83f80f                   cmp eax, 0xf
0000000145ac20ce: 720f                     jb 0x145ac20df
0000000145ac20d0: 8d826fa0feff             lea eax, [rdx - 0x15f91]
0000000145ac20d6: 83f805                   cmp eax, 5
0000000145ac20d9: 0f8796000000             ja 0x145ac2175
0000000145ac20df: 4983fe12                 cmp r14, 0x12
0000000145ac20e3: 0f858c000000             jne 0x145ac2175
0000000145ac20e9: 488b4608                 mov rax, qword ptr [rsi + 8]
0000000145ac20ed: 488b4e10                 mov rcx, qword ptr [rsi + 0x10]
0000000145ac20f1: 49b9f0ffffffffffff1f     movabs r9, 0x1ffffffffffffff0
0000000145ac20fb: 4921c9                   and r9, rcx
0000000145ac20fe: 4e8d0488                 lea r8, [rax + r9*4]
0000000145ac2102: 83e10f                   and ecx, 0xf
0000000145ac2105: 660f6ec2                 movd xmm0, edx
0000000145ac2109: 660f70c000               pshufd xmm0, xmm0, 0
0000000145ac210e: 4531d2                   xor r10d, r10d
0000000145ac2111: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145ac2120: 4d39d1                   cmp r9, r10
0000000145ac2123: 0f84ca000000             je 0x145ac21f3
0000000145ac2129: f3420f6f0c90             movdqu xmm1, xmmword ptr [rax + r10*4]
0000000145ac212f: f3420f6f549010           movdqu xmm2, xmmword ptr [rax + r10*4 + 0x10]
0000000145ac2136: f3420f6f5c9020           movdqu xmm3, xmmword ptr [rax + r10*4 + 0x20]
0000000145ac213d: f3420f6f649030           movdqu xmm4, xmmword ptr [rax + r10*4 + 0x30]
0000000145ac2144: 660f76d0                 pcmpeqd xmm2, xmm0
0000000145ac2148: 660f76c8                 pcmpeqd xmm1, xmm0
0000000145ac214c: 660f6bca                 packssdw xmm1, xmm2
0000000145ac2150: 660f76d8                 pcmpeqd xmm3, xmm0
0000000145ac2154: 660f76e0                 pcmpeqd xmm4, xmm0
0000000145ac2158: 660f6bdc                 packssdw xmm3, xmm4
0000000145ac215c: 660f63cb                 packsswb xmm1, xmm3
0000000145ac2160: 66440fd7d9               pmovmskb r11d, xmm1
0000000145ac2165: 4983c210                 add r10, 0x10
0000000145ac2169: 4585db                   test r11d, r11d
0000000145ac216c: 74b2                     je 0x145ac2120
0000000145ac216e: b001                     mov al, 1
0000000145ac2170: e9cb000000               jmp 0x145ac2240
0000000145ac2175: 488d4c2428               lea rcx, [rsp + 0x28]
0000000145ac217a: 4989d7                   mov r15, rdx
0000000145ac217d: e8ae44ffff               call 0x145ab6630
0000000145ac2182: 488b542428               mov rdx, qword ptr [rsp + 0x28]
0000000145ac2187: 4883faff                 cmp rdx, -1
0000000145ac218b: 0f84ad000000             je 0x145ac223e
0000000145ac2191: 488b4c2430               mov rcx, qword ptr [rsp + 0x30]
0000000145ac2196: 488b7c2440               mov rdi, qword ptr [rsp + 0x40]
0000000145ac219b: 488b5c2448               mov rbx, qword ptr [rsp + 0x48]
0000000145ac21a0: 0fb6842490000000         movzx eax, byte ptr [rsp + 0x90]
0000000145ac21a8: 4939c6                   cmp r14, rax
0000000145ac21ab: 7567                     jne 0x145ac2214
0000000145ac21ad: 488b06                   mov rax, qword ptr [rsi]
0000000145ac21b0: 0fb6ac2491000000         movzx ebp, byte ptr [rsp + 0x91]
0000000145ac21b8: 440fb630                 movzx r14d, byte ptr [rax]
0000000145ac21bc: 4885d2                   test rdx, rdx
0000000145ac21bf: 740b                     je 0x145ac21cc
0000000145ac21c1: 41b801000000             mov r8d, 1
0000000145ac21c7: e8040054fa               call 0x1400021d0
0000000145ac21cc: 4885ff                   test rdi, rdi
0000000145ac21cf: 7415                     je 0x145ac21e6
0000000145ac21d1: 48c1e703                 shl rdi, 3
0000000145ac21d5: 41b804000000             mov r8d, 4
0000000145ac21db: 4889d9                   mov rcx, rbx
0000000145ac21de: 4889fa                   mov rdx, rdi
0000000145ac21e1: e8eaff53fa               call 0x1400021d0
0000000145ac21e6: 4438f5                   cmp bpl, r14b
0000000145ac21e9: 7553                     jne 0x145ac223e
0000000145ac21eb: 4c89fa                   mov rdx, r15
0000000145ac21ee: e9f6feffff               jmp 0x145ac20e9
0000000145ac21f3: c1e102                   shl ecx, 2
0000000145ac21f6: 4531c9                   xor r9d, r9d
0000000145ac21f9: 0f1f8000000000           nop dword ptr [rax]
0000000145ac2200: 4c39c9                   cmp rcx, r9
0000000145ac2203: 0f95c0                   setne al
0000000145ac2206: 7438                     je 0x145ac2240
0000000145ac2208: 43391408                 cmp dword ptr [r8 + r9], edx
0000000145ac220c: 4d8d4904                 lea r9, [r9 + 4]
0000000145ac2210: 75ee                     jne 0x145ac2200
0000000145ac2212: eb2c                     jmp 0x145ac2240
0000000145ac2214: 4885d2                   test rdx, rdx
0000000145ac2217: 740b                     je 0x145ac2224
0000000145ac2219: 41b801000000             mov r8d, 1
0000000145ac221f: e8acff53fa               call 0x1400021d0
0000000145ac2224: 4885ff                   test rdi, rdi
0000000145ac2227: 7415                     je 0x145ac223e
0000000145ac2229: 48c1e703                 shl rdi, 3
0000000145ac222d: 41b804000000             mov r8d, 4
0000000145ac2233: 4889d9                   mov rcx, rbx
0000000145ac2236: 4889fa                   mov rdx, rdi
0000000145ac2239: e892ff53fa               call 0x1400021d0
0000000145ac223e: 31c0                     xor eax, eax
0000000145ac2240: 4881c498000000           add rsp, 0x98
0000000145ac2247: 5b                       pop rbx
0000000145ac2248: 5d                       pop rbp
0000000145ac2249: 5f                       pop rdi
0000000145ac224a: 5e                       pop rsi
0000000145ac224b: 415e                     pop r14
0000000145ac224d: 415f                     pop r15
0000000145ac224f: c3                       ret

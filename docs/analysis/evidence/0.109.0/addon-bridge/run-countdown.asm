145917730: push      rbp
145917731: push      r15
145917733: push      r14
145917735: push      r13
145917737: push      r12
145917739: push      rsi
14591773a: push      rdi
14591773b: push      rbx
14591773c: sub       rsp, 0x478
145917743: lea       rbp, [rsp + 0x80]
14591774b: movaps    xmmword ptr [rbp + 0x3e0], xmm9
145917753: movaps    xmmword ptr [rbp + 0x3d0], xmm8
14591775b: movaps    xmmword ptr [rbp + 0x3c0], xmm7
145917762: movaps    xmmword ptr [rbp + 0x3b0], xmm6
145917769: mov       qword ptr [rbp + 0x3a8], 0xfffffffffffffffe
145917774: mov       rdi, rdx
145917777: mov       qword ptr [rbp + 0x2e0], rcx
14591777e: mov       rbx, qword ptr [rdx + 0x290]
145917785: mov       r14, qword ptr [rdx + 0x298]
14591778c: mov       rsi, qword ptr [rdx + 0x9d0]
145917793: cmp       rsi, 4
145917797: ja        0x1459177eb
145917799: mov       rcx, rbx
14591779c: mov       rdx, r14
14591779f: call      0x14588d0d0
1459177a4: imul      rax, rax, 0xf0
1459177ab: lea       rcx, [rip + 0x12c6bde]
1459177b2: mov       rax, qword ptr [rax + rcx + 0x88]
1459177ba: imul      rcx, rsi, 0x68
1459177be: movss     xmm0, dword ptr [rax + rcx + 0x50]
1459177c4: mulss     xmm0, dword ptr [rip + 0x4d8d74]
1459177cc: lea       r15, [rax + rcx]
1459177d0: movss     xmm7, dword ptr [rdi + 0xa34]
1459177d8: subss     xmm0, xmm7
1459177dc: xorps     xmm1, xmm1
1459177df: ucomiss   xmm0, xmm1
1459177e2: seta      al
1459177e5: test      al, al
1459177e7: je        0x145917815
1459177e9: jmp       0x14591781d
1459177eb: movss     xmm7, dword ptr [rdi + 0xa34]
1459177f3: movss     xmm0, dword ptr [rdi + 0xa90]
1459177fb: subss     xmm0, xmm7
1459177ff: xorps     xmm1, xmm1
145917802: ucomiss   xmm0, xmm1
145917805: seta      al
145917808: and       al, byte ptr [rdi + 0xab8]
14591780e: xor       r15d, r15d
145917811: test      al, al
145917813: jne       0x14591781d
145917815: movss     xmm0, dword ptr [rip + 0x4b58a7]

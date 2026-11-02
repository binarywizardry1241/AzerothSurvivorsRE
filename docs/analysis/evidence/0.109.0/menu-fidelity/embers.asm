140078780: push      r15
140078782: push      r14
140078784: push      r13
140078786: push      r12
140078788: push      rsi
140078789: push      rdi
14007878a: push      rbp
14007878b: push      rbx
14007878c: sub       rsp, 0x128
140078793: movaps    xmmword ptr [rsp + 0x110], xmm15
14007879c: movaps    xmmword ptr [rsp + 0x100], xmm14
1400787a5: movaps    xmmword ptr [rsp + 0xf0], xmm13
1400787ae: movaps    xmmword ptr [rsp + 0xe0], xmm12
1400787b7: movaps    xmmword ptr [rsp + 0xd0], xmm11
1400787c0: movaps    xmmword ptr [rsp + 0xc0], xmm10
1400787c9: movaps    xmmword ptr [rsp + 0xb0], xmm9
1400787d2: movaps    xmmword ptr [rsp + 0xa0], xmm8
1400787db: movaps    xmmword ptr [rsp + 0x90], xmm7
1400787e3: movaps    xmmword ptr [rsp + 0x80], xmm6
1400787eb: mov       rax, qword ptr [rdx]
1400787ee: mov       rcx, qword ptr [r8]
1400787f1: mov       rdi, qword ptr [r8 + 8]
1400787f5: mov       edx, dword ptr [r8 + 0x14]
1400787f9: mov       dword ptr [rsp + 0x64], edx
1400787fd: movss     xmm7, dword ptr [rax + 0x5c]
140078802: mov       r14, qword ptr [rcx + 0xf8]
140078809: mov       rax, qword ptr [rcx + 0x100]
140078810: lea       r15, [r14 + rax*4]
140078814: mov       qword ptr [rsp + 0x38], rcx
140078819: movzx     eax, byte ptr [rcx + 0x108]
140078820: mov       byte ptr [rsp + 0x2f], al
140078824: mov       qword ptr [rsp + 0x40], 0
14007882d: mov       eax, 8
140078832: mov       qword ptr [rsp + 0x68], rax
140078837: movss     xmm8, dword ptr [rip + 0x5d54888]
140078840: movss     xmm9, dword ptr [rip + 0x5d54883]
140078849: movss     xmm10, dword ptr [rip + 0x5d5487e]
140078852: movss     xmm11, dword ptr [rip + 0x5d54879]
14007885b: movss     xmm12, dword ptr [rip + 0x5d54874]
140078864: movss     xmm13, dword ptr [rip + 0x5d24a33]
14007886d: movss     xmm14, dword ptr [rip + 0x5d54866]
140078876: movsd     xmm15, qword ptr [rip + 0x5d54861]
14007887f: mov       qword ptr [rsp + 0x48], 0
140078888: xor       r12d, r12d
14007888b: xor       ebx, ebx
14007888d: mov       qword ptr [rsp + 0x30], 0
140078896: jmp       0x1400788ca
140078898: nop       dword ptr [rax + rax]
1400788a0: inc       ebx
1400788a2: mulss     xmm0, xmm14
1400788a7: mov       rcx, qword ptr [rsp + 0x78]
1400788ac: mov       dword ptr [rcx], eax
1400788ae: mov       dword ptr [r13], 0
1400788b6: movsd     qword ptr [r13 + 4], xmm15
1400788bc: mov       dword ptr [r13 + 0xc], 0x3e8f5c29
1400788c4: movss     dword ptr [r13 + 0x10], xmm0
1400788ca: cmp       byte ptr [rsp + 0x2f], 0
1400788cf: je        0x140078950
1400788d1: cmp       ebx, r12d
1400788d4: jne       0x140078a4d
1400788da: nop       word ptr [rax + rax]
1400788e0: cmp       r14, r15
1400788e3: je        0x140078b95
1400788e9: mov       ecx, dword ptr [r14]
1400788ec: add       r14, 4
1400788f0: mov       rax, qword ptr [rdi + 0x1a8]
1400788f7: lea       rcx, [rcx + rcx*8]
1400788fb: mov       r12, qword ptr [rax + rcx*8 + 0x10]
140078900: test      r12, r12
140078903: je        0x1400788e0
140078905: lea       rcx, [rax + rcx*8]
140078909: mov       rax, qword ptr [rsp + 0x38]
14007890e: mov       rdx, qword ptr [rax + 0x110]
140078915: mov       rax, qword ptr [rcx + 0x38]
140078919: cmp       rdx, qword ptr [rcx + 0x40]
14007891d: jae       0x1400789e5
140078923: mov       rdx, qword ptr [rax + rdx*8]
140078927: mov       rcx, qword ptr [rcx + 0x18]
14007892b: test      rdx, rdx
14007892e: je        0x1400789e9
140078934: not       rdx
140078937: lea       rdx, [rdx + rdx*2]
14007893b: shl       rdx, 4
14007893f: mov       rdx, qword ptr [rcx + rdx + 0x10]
140078944: mov       qword ptr [rsp + 0x30], rdx
140078949: jmp       0x1400789f2
14007894e: nop
140078950: cmp       ebx, r12d
140078953: jne       0x140078ac5
140078959: nop       dword ptr [rax]
140078960: cmp       r14, r15
140078963: je        0x140078b95
140078969: mov       ecx, dword ptr [r14]
14007896c: add       r14, 4
140078970: mov       rax, qword ptr [rdi + 0x108]
140078977: lea       rcx, [rcx + rcx*4]
14007897b: shl       rcx, 5
14007897f: mov       r12, qword ptr [rax + rcx + 0x58]
140078984: test      r12, r12
140078987: je        0x140078960
140078989: add       rax, rcx
14007898c: mov       ecx, dword ptr [rax + 0x94]
140078992: mov       r9, qword ptr [rdi + 0x1a8]
140078999: lea       r10, [rcx + rcx*8]
14007899d: lea       rdx, [r9 + r10*8]
1400789a1: mov       rcx, qword ptr [rsp + 0x38]
1400789a6: mov       r8, qword ptr [rcx + 0x110]
1400789ad: mov       rcx, qword ptr [r9 + r10*8 + 0x38]
1400789b2: cmp       r8, qword ptr [r9 + r10*8 + 0x40]
1400789b7: jae       0x140078a54
1400789bd: mov       r8, qword ptr [rcx + r8*8]
1400789c1: mov       rdx, qword ptr [rdx + 0x18]
1400789c5: test      r8, r8
1400789c8: je        0x140078a58
1400789ce: not       r8
1400789d1: lea       r8, [r8 + r8*2]
1400789d5: shl       r8, 4
1400789d9: mov       r8, qword ptr [rdx + r8 + 0x10]
1400789de: mov       qword ptr [rsp + 0x30], r8
1400789e3: jmp       0x140078a61
1400789e5: mov       rcx, qword ptr [rcx + 0x18]
1400789e9: mov       qword ptr [rsp + 0x30], 0
1400789f2: mov       r8, qword ptr [rsp + 0x38]
1400789f7: mov       rdx, qword ptr [r8 + 0x118]
1400789fe: mov       r8, qword ptr [r8 + 0x120]
140078a05: mov       rdx, qword ptr [rax + rdx*8]
140078a09: not       rdx
140078a0c: lea       rdx, [rdx + rdx*2]
140078a10: shl       rdx, 4
140078a14: mov       r9, qword ptr [rcx + rdx + 0x10]
140078a19: mov       qword ptr [rsp + 0x48], r9
140078a1e: mov       rdx, qword ptr [rcx + rdx + 0x28]
140078a23: mov       qword ptr [rsp + 0x58], rdx
140078a28: mov       rax, qword ptr [rax + r8*8]
140078a2c: not       rax
140078a2f: lea       rax, [rax + rax*2]
140078a33: shl       rax, 4
140078a37: mov       rdx, qword ptr [rcx + rax + 0x10]
140078a3c: mov       qword ptr [rsp + 0x40], rdx
140078a41: mov       rax, qword ptr [rcx + rax + 0x28]
140078a46: mov       qword ptr [rsp + 0x50], rax
140078a4b: xor       ebx, ebx
140078a4d: mov       esi, ebx
140078a4f: jmp       0x140078ad6
140078a54: mov       rdx, qword ptr [rdx + 0x18]
140078a58: mov       qword ptr [rsp + 0x30], 0
140078a61: mov       r9, qword ptr [rsp + 0x38]
140078a66: mov       r8, qword ptr [r9 + 0x118]
140078a6d: mov       r9, qword ptr [r9 + 0x120]
140078a74: mov       r8, qword ptr [rcx + r8*8]
140078a78: not       r8
140078a7b: lea       r8, [r8 + r8*2]
140078a7f: shl       r8, 4
140078a83: mov       r10, qword ptr [rdx + r8 + 0x10]
140078a88: mov       qword ptr [rsp + 0x48], r10
140078a8d: mov       r8, qword ptr [rdx + r8 + 0x28]
140078a92: mov       qword ptr [rsp + 0x58], r8
140078a97: mov       rcx, qword ptr [rcx + r9*8]
140078a9b: not       rcx
140078a9e: lea       rcx, [rcx + rcx*2]
140078aa2: shl       rcx, 4
140078aa6: mov       r8, qword ptr [rdx + rcx + 0x10]
140078aab: mov       qword ptr [rsp + 0x40], r8
140078ab0: mov       rcx, qword ptr [rdx + rcx + 0x28]
140078ab5: mov       qword ptr [rsp + 0x50], rcx
140078aba: mov       rax, qword ptr [rax + 0x50]
140078abe: mov       qword ptr [rsp + 0x68], rax
140078ac3: xor       ebx, ebx
140078ac5: mov       eax, ebx
140078ac7: shl       rax, 4
140078acb: mov       rcx, qword ptr [rsp + 0x68]
140078ad0: mov       esi, dword ptr [rcx + rax + 8]
140078ad4: not       esi
140078ad6: lea       rbp, [rsi + rsi*2]
140078ada: mov       rax, qword ptr [rsp + 0x58]
140078adf: lea       rax, [rax + rsi*4]
140078ae3: mov       qword ptr [rsp + 0x70], rax
140078ae8: lea       rax, [rsi + rsi*4]
140078aec: mov       rcx, qword ptr [rsp + 0x50]
140078af1: lea       rcx, [rcx + rsi*4]
140078af5: mov       qword ptr [rsp + 0x78], rcx
140078afa: shl       rsi, 4
140078afe: add       rsi, qword ptr [rsp + 0x30]
140078b03: shl       rbp, 7
140078b07: add       rbp, qword ptr [rsp + 0x48]
140078b0c: mov       rcx, qword ptr [rsp + 0x40]
140078b11: lea       r13, [rcx + rax*4]
140078b15: movss     xmm6, dword ptr [rsi + 4]
140078b1a: mulss     xmm6, xmm7
140078b1e: addss     xmm6, dword ptr [rsi + 0xc]
140078b23: movaps    xmm0, xmm6
140078b26: call      0x145bfa111
140078b2b: subss     xmm6, xmm0
140078b2f: movss     xmm0, dword ptr [rsi + 8]
140078b34: mulss     xmm0, xmm6
140078b38: addss     xmm0, dword ptr [rsi]
140078b3c: mov       dword ptr [rbp + 0x68], 2
140078b43: movss     dword ptr [rbp + 0x6c], xmm0
140078b48: movaps    xmm0, xmm6
140078b4b: mulss     xmm0, xmm8
140078b50: addss     xmm0, xmm9
140078b55: mov       eax, dword ptr [rsp + 0x64]
140078b59: mov       rcx, qword ptr [rsp + 0x70]
140078b5e: mov       dword ptr [rcx], eax
140078b60: mov       dword ptr [rbp + 0x78], 2
140078b67: movss     dword ptr [rbp + 0x7c], xmm0
140078b6c: ucomiss   xmm10, xmm6
140078b70: movaps    xmm0, xmm6
140078b73: addss     xmm0, xmm11
140078b78: divss     xmm0, xmm12
140078b7d: addss     xmm0, xmm13
140078b82: jbe       0x1400788a0
140078b88: divss     xmm6, xmm10
140078b8d: movaps    xmm0, xmm6
140078b90: jmp       0x1400788a0
140078b95: movaps    xmm6, xmmword ptr [rsp + 0x80]
140078b9d: movaps    xmm7, xmmword ptr [rsp + 0x90]
140078ba5: movaps    xmm8, xmmword ptr [rsp + 0xa0]
140078bae: movaps    xmm9, xmmword ptr [rsp + 0xb0]
140078bb7: movaps    xmm10, xmmword ptr [rsp + 0xc0]
140078bc0: movaps    xmm11, xmmword ptr [rsp + 0xd0]
140078bc9: movaps    xmm12, xmmword ptr [rsp + 0xe0]
140078bd2: movaps    xmm13, xmmword ptr [rsp + 0xf0]
140078bdb: movaps    xmm14, xmmword ptr [rsp + 0x100]
140078be4: movaps    xmm15, xmmword ptr [rsp + 0x110]
140078bed: add       rsp, 0x128
140078bf4: pop       rbx
140078bf5: pop       rbp
140078bf6: pop       rdi
140078bf7: pop       rsi
140078bf8: pop       r12
140078bfa: pop       r13
140078bfc: pop       r14
140078bfe: pop       r15
140078c00: ret

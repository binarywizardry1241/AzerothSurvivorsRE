1458dda90: push      rbp
1458dda91: push      r15
1458dda93: push      r14
1458dda95: push      r13
1458dda97: push      r12
1458dda99: push      rsi
1458dda9a: push      rdi
1458dda9b: push      rbx
1458dda9c: sub       rsp, 0x88
1458ddaa3: lea       rbp, [rsp + 0x80]
1458ddaab: mov       qword ptr [rbp], 0xfffffffffffffffe
1458ddab3: mov       ebx, edx
1458ddab5: mov       rsi, rcx
1458ddab8: mov       rax, qword ptr [r8 + 0x10]
1458ddabc: mov       qword ptr [rbp - 0x50], rax
1458ddac0: movups    xmm0, xmmword ptr [r8]
1458ddac4: movaps    xmmword ptr [rbp - 0x60], xmm0
1458ddac8: mov       r12, qword ptr [rcx + 0x68]
1458ddacc: mov       r14, qword ptr [rcx + 0x70]
1458ddad0: mov       r13, r14
1458ddad3: shl       r13, 5
1458ddad7: xor       eax, eax
1458ddad9: xor       ecx, ecx
1458ddadb: nop       dword ptr [rax + rax]
1458ddae0: cmp       r13, rcx
1458ddae3: je        0x1458ddaf8
1458ddae5: lea       rdx, [rcx + 0x20]
1458ddae9: cmp       byte ptr [r12 + rcx + 4], bl
1458ddaee: mov       rcx, rdx
1458ddaf1: jne       0x1458ddae0
1458ddaf3: mov       eax, dword ptr [r12 + rdx - 0x20]
1458ddaf8: mov       ecx, 0x6e
1458ddafd: mov       r9d, 2
1458ddb03: nop       word ptr cs:[rax + rax]
1458ddb10: lea       edx, [rcx - 0x1e]
1458ddb13: sub       eax, edx
1458ddb15: jb        0x1458ddb39
1458ddb17: lea       edx, [rcx - 0xf]
1458ddb1a: sub       eax, edx
1458ddb1c: jb        0x1458ddb3f
1458ddb1e: sub       eax, ecx
1458ddb20: jb        0x1458ddb42
1458ddb22: add       ecx, 0x2d
1458ddb25: add       r9d, 3
1458ddb29: cmp       ecx, 0x36b
1458ddb2f: jne       0x1458ddb10
1458ddb31: mov       r9d, 0x33
1458ddb37: jmp       0x1458ddb42
1458ddb39: add       r9d, -2
1458ddb3d: jmp       0x1458ddb42
1458ddb3f: dec       r9d
1458ddb42: lea       rcx, [rbp - 0x48]
1458ddb46: lea       rdx, [rbp - 0x60]
1458ddb4a: mov       r8d, ebx
1458ddb4d: call      0x14599fe20
1458ddb52: mov       rax, qword ptr [rsi + 0x80]
1458ddb59: mov       rcx, qword ptr [rsi + 0x88]
1458ddb60: add       rax, -0x4f
1458ddb64: shl       rcx, 4
1458ddb68: lea       rcx, [rcx + rcx*4]
1458ddb6c: nop       dword ptr [rax]
1458ddb70: test      rcx, rcx
1458ddb73: je        0x1458ddc7e
1458ddb79: lea       r15, [rax + 0x50]
1458ddb7d: add       rcx, -0x50
1458ddb81: cmp       byte ptr [rax + 0x4f], bl
1458ddb84: mov       rax, r15
1458ddb87: jne       0x1458ddb70
1458ddb89: mov       qword ptr [rbp - 0x18], r14
1458ddb8d: mov       rax, qword ptr [rbp - 0x40]
1458ddb91: mov       qword ptr [rbp - 0x10], rax
1458ddb95: mov       r14, qword ptr [rbp - 0x38]
1458ddb99: mov       rdi, r14
1458ddb9c: shl       rdi, 4
1458ddba0: mov       rax, r14
1458ddba3: shr       rax, 0x3c
1458ddba7: setne     al
1458ddbaa: movabs    rcx, 0x7ffffffffffffff8
1458ddbb4: cmp       rdi, rcx
1458ddbb7: seta      cl
1458ddbba: or        cl, al
1458ddbbc: je        0x1458ddbda
1458ddbbe: xor       ecx, ecx
1458ddbc0: mov       rax, qword ptr [rbp - 0x10]
1458ddbc4: mov       qword ptr [rbp - 0x30], rax
1458ddbc8: mov       byte ptr [rbp - 1], 1
1458ddbcc: mov       rdx, rdi
1458ddbcf: call      0x145da94eb
1458ddbd4: nop
1458ddbd5: jmp       0x1458ddd6f
1458ddbda: test      rdi, rdi
1458ddbdd: je        0x1458ddd3b
1458ddbe3: call      0x140002200
1458ddbe8: mov       edx, 8
1458ddbed: mov       rcx, rdi
1458ddbf0: call      0x1400021c0
1458ddbf5: mov       ecx, 8
1458ddbfa: mov       qword ptr [rbp - 0x28], rax
1458ddbfe: test      rax, rax
1458ddc01: je        0x1458ddbc0
1458ddc03: mov       qword ptr [rbp - 0x20], r14
1458ddc07: test      r14, r14
1458ddc0a: je        0x1458ddc1c
1458ddc0c: mov       rcx, qword ptr [rbp - 0x28]
1458ddc10: mov       rdx, qword ptr [rbp - 0x10]
1458ddc14: mov       r8, rdi
1458ddc17: call      0x145c0a3db
1458ddc1c: movzx     edi, byte ptr [r15]
1458ddc20: cmp       rdi, 2
1458ddc24: ja        0x1458ddd5a
1458ddc2a: lea       eax, [rdi*8]
1458ddc31: lea       rcx, [rax + rax*2]
1458ddc35: mov       rdx, qword ptr [r15 + rcx + 7]
1458ddc3a: test      rdx, rdx
1458ddc3d: je        0x1458ddc5f
1458ddc3f: lea       rax, [rdi + rdi*2]
1458ddc43: mov       qword ptr [rbp - 0x10], rcx
1458ddc47: mov       rcx, qword ptr [r15 + rax*8 + 0xf]
1458ddc4c: shl       rdx, 4
1458ddc50: mov       r8d, 8
1458ddc56: call      0x1400021d0
1458ddc5b: mov       rcx, qword ptr [rbp - 0x10]
1458ddc5f: mov       rax, qword ptr [rbp - 0x20]
1458ddc63: mov       qword ptr [r15 + rcx + 7], rax
1458ddc68: lea       rax, [rdi + rdi*2]
1458ddc6c: mov       rcx, qword ptr [rbp - 0x28]
1458ddc70: mov       qword ptr [r15 + rax*8 + 0xf], rcx
1458ddc75: mov       qword ptr [r15 + rax*8 + 0x17], r14
1458ddc7a: mov       r14, qword ptr [rbp - 0x18]
1458ddc7e: lea       rcx, [rsi + 0x60]
1458ddc82: xor       eax, eax
1458ddc84: mov       rdx, r12
1458ddc87: nop       word ptr [rax + rax]
1458ddc90: cmp       r13, rax
1458ddc93: je        0x1458ddcd9
1458ddc95: add       rax, 0x20
1458ddc99: cmp       byte ptr [rdx + 4], bl
1458ddc9c: lea       rdx, [rdx + 0x20]
1458ddca0: jne       0x1458ddc90
1458ddca2: lea       rsi, [r12 + rax]
1458ddca6: add       rsi, -0x18
1458ddcaa: mov       rdx, qword ptr [r12 + rax - 0x18]
1458ddcaf: test      rdx, rdx
1458ddcb2: je        0x1458ddcc8
1458ddcb4: mov       rcx, qword ptr [r12 + rax - 0x10]
1458ddcb9: shl       rdx, 4
1458ddcbd: mov       r8d, 8
1458ddcc3: call      0x1400021d0
1458ddcc8: mov       rax, qword ptr [rbp - 0x38]
1458ddccc: mov       qword ptr [rsi + 0x10], rax
1458ddcd0: movups    xmm0, xmmword ptr [rbp - 0x48]
1458ddcd4: movups    xmmword ptr [rsi], xmm0
1458ddcd7: jmp       0x1458ddd27
1458ddcd9: mov       rdx, qword ptr [rbp - 0x48]
1458ddcdd: mov       rax, qword ptr [rbp - 0x40]
1458ddce1: mov       rdi, qword ptr [rbp - 0x38]
1458ddce5: cmp       r14, qword ptr [rcx]
1458ddce8: jne       0x1458ddd04
1458ddcea: mov       qword ptr [rbp - 0x18], rdx
1458ddcee: mov       qword ptr [rbp - 0x10], rax
1458ddcf2: call      0x145c0dbd0
1458ddcf7: nop
1458ddcf8: mov       r12, qword ptr [rsi + 0x68]
1458ddcfc: mov       rax, qword ptr [rbp - 0x10]
1458ddd00: mov       rdx, qword ptr [rbp - 0x18]
1458ddd04: mov       dword ptr [r12 + r13], 0
1458ddd0c: mov       byte ptr [r12 + r13 + 4], bl
1458ddd11: mov       qword ptr [r12 + r13 + 8], rdx
1458ddd16: mov       qword ptr [r12 + r13 + 0x10], rax
1458ddd1b: mov       qword ptr [r12 + r13 + 0x18], rdi
1458ddd20: inc       r14
1458ddd23: mov       qword ptr [rsi + 0x70], r14
1458ddd27: add       rsp, 0x88
1458ddd2e: pop       rbx
1458ddd2f: pop       rdi
1458ddd30: pop       rsi
1458ddd31: pop       r12
1458ddd33: pop       r13
1458ddd35: pop       r14
1458ddd37: pop       r15
1458ddd39: pop       rbp
1458ddd3a: ret
1458ddd3b: mov       eax, 8
1458ddd40: mov       qword ptr [rbp - 0x28], rax
1458ddd44: mov       qword ptr [rbp - 0x20], 0
1458ddd4c: test      r14, r14
1458ddd4f: jne       0x1458ddc0c
1458ddd55: jmp       0x1458ddc1c
1458ddd5a: lea       r8, [rip + 0x132aac7]
1458ddd61: mov       edx, 3
1458ddd66: mov       rcx, rdi
1458ddd69: call      0x145da9883
1458ddd6e: nop
1458ddd6f: ud2

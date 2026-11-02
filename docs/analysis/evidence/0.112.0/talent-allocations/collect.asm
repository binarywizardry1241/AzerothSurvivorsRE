1459cf2a0: push      rbp
1459cf2a1: push      r15
1459cf2a3: push      r14
1459cf2a5: push      r13
1459cf2a7: push      r12
1459cf2a9: push      rsi
1459cf2aa: push      rdi
1459cf2ab: push      rbx
1459cf2ac: sub       rsp, 0x58
1459cf2b0: lea       rbp, [rsp + 0x50]
1459cf2b5: mov       qword ptr [rbp], 0xfffffffffffffffe
1459cf2bd: mov       rdi, rdx
1459cf2c0: mov       rbx, rcx
1459cf2c3: mov       rcx, qword ptr [rdx]
1459cf2c6: mov       r13, qword ptr [rdx + 8]
1459cf2ca: mov       r14, qword ptr [rdx + 0x10]
1459cf2ce: nop
1459cf2d0: cmp       rcx, r13
1459cf2d3: je        0x1459cf3fd
1459cf2d9: lea       rsi, [rcx + 0x10]
1459cf2dd: mov       qword ptr [rdi], rsi
1459cf2e0: mov       rax, qword ptr [rcx]
1459cf2e3: movzx     ecx, byte ptr [r14]
1459cf2e7: mov       rdx, qword ptr [rax + 0x30]
1459cf2eb: mov       r8, qword ptr [rax + 0x38]
1459cf2ef: call      0x1459a2ab0
1459cf2f4: mov       rcx, rsi
1459cf2f7: test      rdx, rdx
1459cf2fa: je        0x1459cf2d0
1459cf2fc: mov       qword ptr [rbp - 0x28], rbx
1459cf300: mov       qword ptr [rbp - 8], rax
1459cf304: movzx     r12d, byte ptr [rsi - 8]
1459cf309: mov       r15, rdx
1459cf30c: movzx     ebx, byte ptr [rdx + 0x9a]
1459cf313: call      0x140002200
1459cf318: mov       ecx, 0x60
1459cf31d: mov       edx, 8
1459cf322: call      0x1400021c0
1459cf327: test      rax, rax
1459cf32a: je        0x1459cf43d
1459cf330: mov       rdi, rax
1459cf333: movzx     eax, bl
1459cf336: movzx     ecx, r12b
1459cf33a: cmp       al, cl
1459cf33c: cmovb     ecx, eax
1459cf33f: mov       qword ptr [rdi], r15
1459cf342: mov       rax, qword ptr [rbp - 8]
1459cf346: mov       qword ptr [rdi + 8], rax
1459cf34a: mov       byte ptr [rdi + 0x10], cl
1459cf34d: mov       qword ptr [rbp - 0x20], 4
1459cf355: mov       qword ptr [rbp - 0x18], rdi
1459cf359: mov       ebx, 1
1459cf35e: mov       qword ptr [rbp - 0x10], rbx
1459cf362: nop       word ptr cs:[rax + rax]
1459cf370: cmp       rsi, r13
1459cf373: je        0x1459cf416
1459cf379: mov       rax, qword ptr [rsi]
1459cf37c: add       rsi, 0x10
1459cf380: movzx     ecx, byte ptr [r14]
1459cf384: mov       rdx, qword ptr [rax + 0x30]
1459cf388: mov       r8, qword ptr [rax + 0x38]
1459cf38c: call      0x1459a2ab0
1459cf391: test      rdx, rdx
1459cf394: je        0x1459cf370
1459cf396: mov       r15, rax
1459cf399: mov       r12, rdx
1459cf39c: mov       rdx, rbx
1459cf39f: mov       ebx, dword ptr [rsi - 8]
1459cf3a2: movzx     eax, byte ptr [r12 + 0x9a]
1459cf3ab: cmp       al, bl
1459cf3ad: cmovb     ebx, eax
1459cf3b0: cmp       rdx, qword ptr [rbp - 0x20]
1459cf3b4: jne       0x1459cf3e1
1459cf3b6: mov       qword ptr [rsp + 0x20], 0x18
1459cf3bf: mov       r8d, 1
1459cf3c5: mov       r9d, 8
1459cf3cb: lea       rcx, [rbp - 0x20]
1459cf3cf: mov       qword ptr [rbp - 8], rdx
1459cf3d3: call      0x145c0d470
1459cf3d8: nop
1459cf3d9: mov       rdi, qword ptr [rbp - 0x18]
1459cf3dd: mov       rdx, qword ptr [rbp - 8]
1459cf3e1: lea       rax, [rdx + rdx*2]
1459cf3e5: mov       qword ptr [rdi + rax*8], r12
1459cf3e9: mov       qword ptr [rdi + rax*8 + 8], r15
1459cf3ee: mov       byte ptr [rdi + rax*8 + 0x10], bl
1459cf3f2: inc       rdx
1459cf3f5: mov       rbx, rdx
1459cf3f8: jmp       0x1459cf35e
1459cf3fd: mov       qword ptr [rbx], 0
1459cf404: mov       qword ptr [rbx + 8], 8
1459cf40c: mov       qword ptr [rbx + 0x10], 0
1459cf414: jmp       0x1459cf429
1459cf416: mov       rax, qword ptr [rbp - 0x10]
1459cf41a: mov       rbx, qword ptr [rbp - 0x28]
1459cf41e: mov       qword ptr [rbx + 0x10], rax
1459cf422: movups    xmm0, xmmword ptr [rbp - 0x20]
1459cf426: movups    xmmword ptr [rbx], xmm0
1459cf429: mov       rax, rbx
1459cf42c: add       rsp, 0x58
1459cf430: pop       rbx
1459cf431: pop       rdi
1459cf432: pop       rsi
1459cf433: pop       r12
1459cf435: pop       r13
1459cf437: pop       r14
1459cf439: pop       r15
1459cf43b: pop       rbp
1459cf43c: ret
1459cf43d: mov       ecx, 8
1459cf442: mov       edx, 0x60
1459cf447: call      0x145da94eb
1459cf44c: ud2

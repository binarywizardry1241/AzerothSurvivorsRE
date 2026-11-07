1403aa7c0: push      rbp
1403aa7c1: push      r15
1403aa7c3: push      r14
1403aa7c5: push      rsi
1403aa7c6: push      rdi
1403aa7c7: push      rbx
1403aa7c8: sub       rsp, 0x2e8
1403aa7cf: lea       rbp, [rsp + 0x80]
1403aa7d7: mov       qword ptr [rbp + 0x260], 0xfffffffffffffffe
1403aa7e2: mov       rdi, rdx
1403aa7e5: mov       rsi, rcx
1403aa7e8: mov       rcx, rdx
1403aa7eb: call      0x1402a7cf0
1403aa7f0: mov       rbx, rax
1403aa7f3: mov       rcx, rdi
1403aa7f6: call      0x1402c8f70
1403aa7fb: mov       r14, rax
1403aa7fe: mov       rcx, rdi
1403aa801: call      0x1402a87d0
1403aa806: mov       r15, rax
1403aa809: mov       rcx, rdi
1403aa80c: call      0x1402a6c10
1403aa811: mov       qword ptr [rbp + 0x238], rbx
1403aa818: mov       qword ptr [rbp + 0x240], r14
1403aa81f: mov       qword ptr [rbp + 0x248], r15
1403aa826: mov       qword ptr [rbp + 0x250], rax
1403aa82d: mov       rcx, rdi
1403aa830: call      0x1402a7cf0
1403aa835: mov       rbx, rax
1403aa838: lea       r14, [rbp - 0x60]
1403aa83c: mov       rcx, r14
1403aa83f: call      0x144e89c90
1403aa844: mov       byte ptr [rbp + 0x25f], 1
1403aa84b: lea       rcx, [rbp + 0x238]
1403aa852: mov       rdx, r14
1403aa855: call      0x14037ee30
1403aa85a: nop
1403aa85b: mov       byte ptr [rbp + 0x25f], 1
1403aa862: lea       rcx, [rbp + 0x50]
1403aa866: call      0x144e89c90
1403aa86b: nop
1403aa86c: movzx     eax, byte ptr [rbp + 0xe1]
1403aa873: cmp       rbx, qword ptr [rbp + 0x90]
1403aa87a: jae       0x1403aa96f
1403aa880: mov       rcx, qword ptr [rbp + 0x80]
1403aa887: mov       rdx, rbx
1403aa88a: shr       rdx, 6
1403aa88e: mov       rcx, qword ptr [rcx + rdx*8]
1403aa892: bt        rcx, rbx
1403aa896: sbb       al, 0
1403aa898: jne       0x1403aa977
1403aa89e: lea       rcx, [rbp + 0x50]
1403aa8a2: mov       rdx, rbx
1403aa8a5: call      0x144e83370
1403aa8aa: nop
1403aa8ab: lea       rcx, [rbp - 0x60]
1403aa8af: lea       rdx, [rbp + 0x50]
1403aa8b3: call      0x144e836e0
1403aa8b8: nop
1403aa8b9: mov       r14b, 1
1403aa8bc: cmp       qword ptr [rdi + 0x90], 0
1403aa8c4: je        0x1403aaa0a
1403aa8ca: mov       rax, qword ptr [rdi + 0x78]
1403aa8ce: mov       rcx, qword ptr [rdi + 0x80]
1403aa8d5: movabs    rdx, 0xe592096a8ce4219
1403aa8df: xor       r8d, r8d
1403aa8e2: movdqa    xmm0, xmmword ptr [rip + 0x5a49436]
1403aa8ea: pcmpeqd   xmm1, xmm1
1403aa8ee: movdqa    xmm2, xmmword ptr [rip + 0x5a53b7a]
1403aa8f6: and       rdx, rcx
1403aa8f9: movdqu    xmm3, xmmword ptr [rax + rdx]
1403aa8fe: movdqa    xmm4, xmm3
1403aa902: pcmpeqb   xmm4, xmm0
1403aa906: pmovmskb  r9d, xmm4
1403aa90b: test      r9d, r9d
1403aa90e: je        0x1403aa950
1403aa910: tzcnt     r10d, r9d
1403aa915: add       r10, rdx
1403aa918: and       r10, rcx
1403aa91b: neg       r10
1403aa91e: lea       r10, [r10 + r10*2]
1403aa922: movdqu    xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403aa929: pcmpeqb   xmm4, xmm2
1403aa92d: pmovmskb  r11d, xmm4
1403aa932: cmp       r11d, 0xffff
1403aa939: je        0x1403aa9b0
1403aa93b: lea       r10d, [r9 - 1]
1403aa93f: and       r10w, r9w
1403aa943: mov       r9d, r10d
1403aa946: jne       0x1403aa910
1403aa948: nop       dword ptr [rax + rax]
1403aa950: pcmpeqb   xmm3, xmm1
1403aa954: pmovmskb  r9d, xmm3
1403aa959: test      r9d, r9d
1403aa95c: jne       0x1403aaa0a
1403aa962: add       rdx, r8
1403aa965: add       rdx, 0x10
1403aa969: add       r8, 0x10
1403aa96d: jmp       0x1403aa8f6
1403aa96f: test      al, al
1403aa971: je        0x1403aa89e
1403aa977: lea       rax, [rbp + 0x25e]
1403aa97e: mov       qword ptr [rbp + 0x100], rax
1403aa985: lea       rax, [rip + 0x4c52974]
1403aa98c: mov       qword ptr [rbp + 0x108], rax
1403aa993: lea       rcx, [rip + 0x5a53c36]
1403aa99a: lea       r8, [rip + 0x5a53d0f]
1403aa9a1: lea       rdx, [rbp + 0x100]
1403aa9a8: call      0x145d99830
1403aa9ad: nop
1403aa9ae: ud2
1403aa9b0: lea       rax, [rax + r10*8]
1403aa9b4: mov       rax, qword ptr [rax - 8]
1403aa9b8: cmp       rax, qword ptr [rdi + 0x218]
1403aa9bf: jae       0x1403aaa0a
1403aa9c1: mov       rcx, qword ptr [rdi + 0x210]
1403aa9c8: mov       rcx, qword ptr [rcx + rax*8]
1403aa9cc: test      rcx, rcx
1403aa9cf: je        0x1403aaa0a
1403aa9d1: mov       rax, qword ptr [rdi + 0x1e0]
1403aa9d8: not       rcx
1403aa9db: imul      rcx, rcx, 0x38
1403aa9df: cmp       byte ptr [rax + rcx + 0x30], 1
1403aa9e4: jne       0x1403aaa0a
1403aa9e6: add       rax, rcx
1403aa9e9: mov       r14, qword ptr [rax + 0x10]
1403aa9ed: lea       rdx, [rbp - 0x60]
1403aa9f1: mov       rcx, r14
1403aa9f4: call      0x144e09000
1403aa9f9: nop
1403aa9fa: lea       rdx, [rdi + 0x40]
1403aa9fe: mov       rcx, r14
1403aaa01: call      0x144e09160
1403aaa06: nop
1403aaa07: mov       r14d, eax
1403aaa0a: mov       r15, qword ptr [rdi + 0x5a0]
1403aaa11: lea       rcx, [rbp + 0x140]
1403aaa18: lea       rdx, [rbp - 0x60]
1403aaa1c: mov       r8d, 0xb0
1403aaa22: call      0x145bfa0e7
1403aaa27: mov       qword ptr [rbp + 0x100], r15
1403aaa2e: mov       dword ptr [rbp + 0x108], 0
1403aaa38: mov       qword ptr [rbp + 0x110], 0x10
1403aaa43: pxor      xmm0, xmm0
1403aaa47: movdqu    xmmword ptr [rbp + 0x118], xmm0
1403aaa4f: mov       qword ptr [rbp + 0x128], 0x10
1403aaa5a: movdqu    xmmword ptr [rbp + 0x130], xmm0
1403aaa62: mov       qword ptr [rbp + 0x1f0], 0
1403aaa6d: mov       qword ptr [rbp + 0x1f8], 4
1403aaa78: mov       qword ptr [rbp + 0x200], 0
1403aaa83: mov       byte ptr [rbp + 0x208], r14b
1403aaa8a: movdqu    xmm0, xmmword ptr [rbp + 0x238]
1403aaa92: movdqu    xmm1, xmmword ptr [rbp + 0x248]
1403aaa9a: movdqu    xmmword ptr [rbp + 0x210], xmm0
1403aaaa2: movdqu    xmmword ptr [rbp + 0x220], xmm1
1403aaaaa: mov       qword ptr [rbp + 0x230], rbx
1403aaab1: mov       byte ptr [rbp + 0x25f], 0
1403aaab8: lea       rcx, [rbp + 0x50]
1403aaabc: call      0x1403824e0
1403aaac1: nop
1403aaac2: lea       rcx, [rbp + 0x100]
1403aaac9: mov       rdx, rdi
1403aaacc: call      0x1403aa3a0
1403aaad1: nop
1403aaad2: lea       rdx, [rbp + 0x100]
1403aaad9: mov       r8d, 0x138
1403aaadf: mov       rcx, rsi
1403aaae2: call      0x145bfa0e7
1403aaae7: mov       rax, rsi
1403aaaea: add       rsp, 0x2e8
1403aaaf1: pop       rbx
1403aaaf2: pop       rdi
1403aaaf3: pop       rsi
1403aaaf4: pop       r14
1403aaaf6: pop       r15
1403aaaf8: pop       rbp
1403aaaf9: ret

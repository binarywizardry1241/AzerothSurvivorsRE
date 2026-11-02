14589c200: push      r15
14589c202: push      r14
14589c204: push      r12
14589c206: push      rsi
14589c207: push      rdi
14589c208: push      rbp
14589c209: push      rbx
14589c20a: sub       rsp, 0x40
14589c20e: mov       rax, qword ptr [rdx + 0x80]
14589c215: mov       r10, qword ptr [rdx + 0x88]
14589c21c: shl       r10, 4
14589c220: lea       r10, [r10 + r10*4]
14589c224: xor       r11d, r11d
14589c227: xor       esi, esi
14589c229: nop       dword ptr [rax]
14589c230: cmp       r10, rsi
14589c233: je        0x14589c248
14589c235: lea       rdi, [rsi + 0x50]
14589c239: cmp       byte ptr [rax + rsi], r8b
14589c23d: mov       rsi, rdi
14589c240: jne       0x14589c230
14589c242: movzx     r11d, byte ptr [rax + rdi - 0x4f]
14589c248: cmp       r9, r11
14589c24b: jne       0x14589c2b8
14589c24d: mov       rax, qword ptr [rdx + 0x68]
14589c251: mov       r9, qword ptr [rdx + 0x70]
14589c255: shl       r9, 5
14589c259: xor       edx, edx
14589c25b: mov       r10, rax
14589c25e: nop
14589c260: cmp       r9, rdx
14589c263: je        0x14589c3a1
14589c269: add       rdx, 0x20
14589c26d: cmp       byte ptr [r10 + 4], r8b
14589c271: lea       r10, [r10 + 0x20]
14589c275: jne       0x14589c260
14589c277: mov       r15, qword ptr [rax + rdx - 8]
14589c27c: mov       rsi, r15
14589c27f: shl       rsi, 4
14589c283: mov       r8, r15
14589c286: shr       r8, 0x3c
14589c28a: setne     r8b
14589c28e: movabs    r9, 0x7ffffffffffffff8
14589c298: cmp       rsi, r9
14589c29b: seta      r9b
14589c29f: or        r9b, r8b
14589c2a2: je        0x14589c3ca
14589c2a8: xor       r14d, r14d
14589c2ab: mov       rcx, r14
14589c2ae: mov       rdx, rsi
14589c2b1: call      0x145d992bb
14589c2b6: ud2
14589c2b8: mov       r11, qword ptr [rdx + 0x68]
14589c2bc: mov       rsi, qword ptr [rdx + 0x70]
14589c2c0: shl       rsi, 5
14589c2c4: xor       edx, edx
14589c2c6: xor       edi, edi
14589c2c8: nop       dword ptr [rax + rax]
14589c2d0: cmp       rsi, rdi
14589c2d3: je        0x14589c2e8
14589c2d5: lea       rbx, [rdi + 0x20]
14589c2d9: cmp       byte ptr [r11 + rdi + 4], r8b
14589c2de: mov       rdi, rbx
14589c2e1: jne       0x14589c2d0
14589c2e3: mov       edx, dword ptr [r11 + rbx - 0x20]
14589c2e8: mov       r11d, 0x6e
14589c2ee: mov       esi, 2
14589c2f3: nop       word ptr cs:[rax + rax]
14589c300: lea       edi, [r11 - 0x1e]
14589c304: sub       edx, edi
14589c306: jb        0x14589c32c
14589c308: lea       edi, [r11 - 0xf]
14589c30c: sub       edx, edi
14589c30e: jb        0x14589c331
14589c310: sub       edx, r11d
14589c313: jb        0x14589c333
14589c315: add       r11d, 0x2d
14589c319: add       esi, 3
14589c31c: cmp       r11d, 0x36b
14589c323: jne       0x14589c300
14589c325: mov       esi, 0x33
14589c32a: jmp       0x14589c333
14589c32c: add       esi, -2
14589c32f: jmp       0x14589c333
14589c331: dec       esi
14589c333: xor       r11d, r11d
14589c336: nop       word ptr cs:[rax + rax]
14589c340: cmp       r10, r11
14589c343: je        0x14589c3a1
14589c345: lea       rdx, [r11 + 0x50]
14589c349: cmp       byte ptr [rax + r11], r8b
14589c34d: mov       r11, rdx
14589c350: jne       0x14589c340
14589c352: cmp       r9, 3
14589c356: jae       0x14589c3a1
14589c358: lea       r9, [r9 + r9*2]
14589c35c: lea       rax, [rax + r9*8]
14589c360: mov       r15, qword ptr [rdx + rax - 0x38]
14589c365: mov       rdi, r15
14589c368: shl       rdi, 4
14589c36c: mov       r9, r15
14589c36f: shr       r9, 0x3c
14589c373: setne     r9b
14589c377: movabs    r10, 0x7ffffffffffffff8
14589c381: cmp       rdi, r10
14589c384: seta      r10b
14589c388: or        r10b, r9b
14589c38b: je        0x14589c42b
14589c391: xor       r14d, r14d
14589c394: mov       rcx, r14
14589c397: mov       rdx, rdi
14589c39a: call      0x145d992bb
14589c39f: ud2
14589c3a1: mov       qword ptr [rcx], 0
14589c3a8: mov       qword ptr [rcx + 8], 8
14589c3b0: mov       qword ptr [rcx + 0x10], 0
14589c3b8: mov       rax, rcx
14589c3bb: add       rsp, 0x40
14589c3bf: pop       rbx
14589c3c0: pop       rbp
14589c3c1: pop       rdi
14589c3c2: pop       rsi
14589c3c3: pop       r12
14589c3c5: pop       r14
14589c3c7: pop       r15
14589c3c9: ret
14589c3ca: mov       rdi, qword ptr [rax + rdx - 0x10]
14589c3cf: test      rsi, rsi
14589c3d2: je        0x14589c467
14589c3d8: mov       r12, rcx
14589c3db: call      0x140002200
14589c3e0: mov       r14d, 8
14589c3e6: mov       edx, 8
14589c3eb: mov       rcx, rsi
14589c3ee: call      0x1400021c0
14589c3f3: test      rax, rax
14589c3f6: je        0x14589c2ab
14589c3fc: mov       rbx, rax
14589c3ff: mov       r14, r15
14589c402: mov       rcx, r12
14589c405: test      r15, r15
14589c408: je        0x14589c41e
14589c40a: mov       r12, rcx
14589c40d: mov       rcx, rbx
14589c410: mov       rdx, rdi
14589c413: mov       r8, rsi
14589c416: call      0x145bfa0e7
14589c41b: mov       rcx, r12
14589c41e: mov       qword ptr [rcx], r14
14589c421: mov       qword ptr [rcx + 8], rbx
14589c425: mov       qword ptr [rcx + 0x10], r15
14589c429: jmp       0x14589c3b8
14589c42b: mov       rbx, qword ptr [rdx + rax - 0x40]
14589c430: test      rdi, rdi
14589c433: je        0x14589c476
14589c435: mov       ebp, r8d
14589c438: mov       r12, rcx
14589c43b: call      0x140002200
14589c440: mov       r14d, 8
14589c446: mov       edx, 8
14589c44b: mov       rcx, rdi
14589c44e: call      0x1400021c0
14589c453: test      rax, rax
14589c456: je        0x14589c394
14589c45c: mov       rdx, r15
14589c45f: mov       rcx, r12
14589c462: mov       r8d, ebp
14589c465: jmp       0x14589c47d
14589c467: mov       ebx, 8
14589c46c: xor       r14d, r14d
14589c46f: test      r15, r15
14589c472: jne       0x14589c40a
14589c474: jmp       0x14589c41e
14589c476: mov       eax, 8
14589c47b: xor       edx, edx
14589c47d: mov       qword ptr [rsp + 0x28], rdx
14589c482: mov       qword ptr [rsp + 0x30], rax
14589c487: mov       qword ptr [rsp + 0x38], 0
14589c490: test      r15, r15
14589c493: je        0x14589c4b4
14589c495: mov       r14, rcx
14589c498: mov       rcx, rax
14589c49b: mov       rdx, rbx
14589c49e: mov       ebx, r8d
14589c4a1: mov       r8, rdi
14589c4a4: call      0x145bfa0e7
14589c4a9: mov       r8d, ebx
14589c4ac: mov       rcx, r14
14589c4af: mov       qword ptr [rsp + 0x38], r15
14589c4b4: lea       rdx, [rsp + 0x28]
14589c4b9: mov       rdi, rcx
14589c4bc: mov       r9d, esi
14589c4bf: call      0x1459106e0
14589c4c4: mov       rcx, rdi
14589c4c7: jmp       0x14589c3b8

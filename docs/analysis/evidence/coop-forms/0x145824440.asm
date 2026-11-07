0x145824440: push rbp
0x145824441: push rsi
0x145824442: push rdi
0x145824443: push rbx
0x145824444: sub rsp, 0x48
0x145824448: lea rbp, [rsp + 0x40]
0x14582444d: mov qword ptr [rbp], 0xfffffffffffffffe
0x145824455: mov rdi, qword ptr [rcx]
0x145824458: mov cl, 1
0x14582445a: xor eax, eax
0x14582445c: lock cmpxchg byte ptr [rdi + 0x10], cl
0x145824461: jne 0x145824566
0x145824467: mov rsi, qword ptr [rip + 0x29f05ca]
0x14582446e: mov rax, qword ptr [rsi]
0x145824471: shl rax, 1
0x145824474: test rax, rax
0x145824477: jne 0x145824574
0x14582447d: mov dword ptr [rbp - 4], 0
0x145824484: movzx eax, byte ptr [rdi + 0x11]
0x145824488: lea rcx, [rdi + 0x18]
0x14582448c: mov qword ptr [rbp - 0x10], rdi
0x145824490: call 0x145816db0
0x145824495: nop
0x145824496: mov rbx, qword ptr [rbp - 0x10]
0x14582449a: mov rax, qword ptr [rbx + 0x50]
0x14582449e: test rax, rax
0x1458244a1: je 0x145824535
0x1458244a7: mov rcx, qword ptr [rbx + 0x48]
0x1458244ab: lea rdx, [rcx + 1]
0x1458244af: mov r8, qword ptr [rbx + 0x38]
0x1458244b3: mov r9, qword ptr [rbx + 0x40]
0x1458244b7: xor r10d, r10d
0x1458244ba: cmp rdx, r8
0x1458244bd: cmovae r10, r8
0x1458244c1: neg r10
0x1458244c4: lea rdx, [rcx + r10]
0x1458244c8: inc rdx
0x1458244cb: mov qword ptr [rbx + 0x48], rdx
0x1458244cf: dec rax
0x1458244d2: mov qword ptr [rbx + 0x50], rax
0x1458244d6: mov edi, dword ptr [r9 + rcx*4]
0x1458244da: lock inc qword ptr [rbx]
0x1458244de: jle 0x145824593
0x1458244e4: mov qword ptr [rbp - 0x20], rbx
0x1458244e8: mov dword ptr [rbp - 0x18], edi
0x1458244eb: call 0x140002200
0x1458244f0: mov ecx, 0x10
0x1458244f5: mov edx, 8
0x1458244fa: call 0x1400021c0
0x1458244ff: test rax, rax
0x145824502: je 0x145824583
0x145824504: mov qword ptr [rax], rbx
0x145824507: mov dword ptr [rax + 8], edi
0x14582450a: cmp byte ptr [rbp - 4], 0
0x14582450e: jne 0x14582451b
0x145824510: mov rcx, qword ptr [rsi]
0x145824513: shl rcx, 1
0x145824516: test rcx, rcx
0x145824519: jne 0x145824595
0x14582451b: xor ecx, ecx
0x14582451d: xchg byte ptr [rbx + 0x10], cl
0x145824520: cmp cl, 2
0x145824523: je 0x145824552
0x145824525: lea rdx, [rip + 0x14a67a4]
0x14582452c: add rsp, 0x48
0x145824530: pop rbx
0x145824531: pop rdi
0x145824532: pop rsi
0x145824533: pop rbp
0x145824534: ret
0x145824535: cmp byte ptr [rbp - 4], 0
0x145824539: jne 0x145824546
0x14582453b: mov rax, qword ptr [rsi]
0x14582453e: shl rax, 1
0x145824541: test rax, rax
0x145824544: jne 0x1458245b3
0x145824546: xor eax, eax
0x145824548: xor ecx, ecx
0x14582454a: xchg byte ptr [rbx + 0x10], cl
0x14582454d: cmp cl, 2
0x145824550: jne 0x145824525
0x145824552: add rbx, 0x10
0x145824556: mov rcx, rbx
0x145824559: mov rsi, rax
0x14582455c: call 0x145eb5730
0x145824561: mov rax, rsi
0x145824564: jmp 0x145824525
0x145824566: lea rcx, [rdi + 0x10]
0x14582456a: call 0x145eb5670
0x14582456f: jmp 0x145824467
0x145824574: call 0x145eb6400
0x145824579: xor al, 1
0x14582457b: mov dword ptr [rbp - 4], eax
0x14582457e: jmp 0x145824484
0x145824583: mov ecx, 8
0x145824588: mov edx, 0x10
0x14582458d: call 0x145eb6fb1
0x145824592: nop
0x145824593: ud2
0x145824595: mov rsi, rax
0x145824598: call 0x145eb6400
0x14582459d: mov ecx, eax
0x14582459f: mov rax, rsi
0x1458245a2: test cl, cl
0x1458245a4: jne 0x14582451b
0x1458245aa: mov byte ptr [rbx + 0x11], 1
0x1458245ae: jmp 0x14582451b
0x1458245b3: call 0x145eb6400
0x1458245b8: test al, al
0x1458245ba: jne 0x145824546
0x1458245bc: mov byte ptr [rbx + 0x11], 1
0x1458245c0: jmp 0x145824546

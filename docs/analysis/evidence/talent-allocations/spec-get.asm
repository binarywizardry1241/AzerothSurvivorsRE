1458d2340: push      r15
1458d2342: push      r14
1458d2344: push      r12
1458d2346: push      rsi
1458d2347: push      rdi
1458d2348: push      rbp
1458d2349: push      rbx
1458d234a: sub       rsp, 0x40
1458d234e: mov       rax, qword ptr [rdx + 0x80]
1458d2355: mov       r10, qword ptr [rdx + 0x88]
1458d235c: shl       r10, 4
1458d2360: lea       r10, [r10 + r10*4]
1458d2364: xor       r11d, r11d
1458d2367: xor       esi, esi
1458d2369: nop       dword ptr [rax]
1458d2370: cmp       r10, rsi
1458d2373: je        0x1458d2388
1458d2375: lea       rdi, [rsi + 0x50]
1458d2379: cmp       byte ptr [rax + rsi], r8b
1458d237d: mov       rsi, rdi
1458d2380: jne       0x1458d2370
1458d2382: movzx     r11d, byte ptr [rax + rdi - 0x4f]
1458d2388: cmp       r9, r11
1458d238b: jne       0x1458d23f8
1458d238d: mov       rax, qword ptr [rdx + 0x68]
1458d2391: mov       r9, qword ptr [rdx + 0x70]
1458d2395: shl       r9, 5
1458d2399: xor       edx, edx
1458d239b: mov       r10, rax
1458d239e: nop
1458d23a0: cmp       r9, rdx
1458d23a3: je        0x1458d24e1
1458d23a9: add       rdx, 0x20
1458d23ad: cmp       byte ptr [r10 + 4], r8b
1458d23b1: lea       r10, [r10 + 0x20]
1458d23b5: jne       0x1458d23a0
1458d23b7: mov       r15, qword ptr [rax + rdx - 8]
1458d23bc: mov       rsi, r15
1458d23bf: shl       rsi, 4
1458d23c3: mov       r8, r15
1458d23c6: shr       r8, 0x3c
1458d23ca: setne     r8b
1458d23ce: movabs    r9, 0x7ffffffffffffff8
1458d23d8: cmp       rsi, r9
1458d23db: seta      r9b
1458d23df: or        r9b, r8b
1458d23e2: je        0x1458d250a
1458d23e8: xor       r14d, r14d
1458d23eb: mov       rcx, r14
1458d23ee: mov       rdx, rsi
1458d23f1: call      0x145da94eb
1458d23f6: ud2
1458d23f8: mov       r11, qword ptr [rdx + 0x68]
1458d23fc: mov       rsi, qword ptr [rdx + 0x70]
1458d2400: shl       rsi, 5
1458d2404: xor       edx, edx
1458d2406: xor       edi, edi
1458d2408: nop       dword ptr [rax + rax]
1458d2410: cmp       rsi, rdi
1458d2413: je        0x1458d2428
1458d2415: lea       rbx, [rdi + 0x20]
1458d2419: cmp       byte ptr [r11 + rdi + 4], r8b
1458d241e: mov       rdi, rbx
1458d2421: jne       0x1458d2410
1458d2423: mov       edx, dword ptr [r11 + rbx - 0x20]
1458d2428: mov       r11d, 0x6e
1458d242e: mov       esi, 2
1458d2433: nop       word ptr cs:[rax + rax]
1458d2440: lea       edi, [r11 - 0x1e]
1458d2444: sub       edx, edi
1458d2446: jb        0x1458d246c
1458d2448: lea       edi, [r11 - 0xf]
1458d244c: sub       edx, edi
1458d244e: jb        0x1458d2471
1458d2450: sub       edx, r11d
1458d2453: jb        0x1458d2473
1458d2455: add       r11d, 0x2d
1458d2459: add       esi, 3
1458d245c: cmp       r11d, 0x36b
1458d2463: jne       0x1458d2440
1458d2465: mov       esi, 0x33
1458d246a: jmp       0x1458d2473
1458d246c: add       esi, -2
1458d246f: jmp       0x1458d2473
1458d2471: dec       esi
1458d2473: xor       r11d, r11d
1458d2476: nop       word ptr cs:[rax + rax]
1458d2480: cmp       r10, r11
1458d2483: je        0x1458d24e1
1458d2485: lea       rdx, [r11 + 0x50]
1458d2489: cmp       byte ptr [rax + r11], r8b
1458d248d: mov       r11, rdx
1458d2490: jne       0x1458d2480
1458d2492: cmp       r9, 3
1458d2496: jae       0x1458d24e1
1458d2498: lea       r9, [r9 + r9*2]
1458d249c: lea       rax, [rax + r9*8]
1458d24a0: mov       r15, qword ptr [rdx + rax - 0x38]
1458d24a5: mov       rdi, r15
1458d24a8: shl       rdi, 4
1458d24ac: mov       r9, r15
1458d24af: shr       r9, 0x3c
1458d24b3: setne     r9b
1458d24b7: movabs    r10, 0x7ffffffffffffff8
1458d24c1: cmp       rdi, r10
1458d24c4: seta      r10b
1458d24c8: or        r10b, r9b
1458d24cb: je        0x1458d256b
1458d24d1: xor       r14d, r14d
1458d24d4: mov       rcx, r14
1458d24d7: mov       rdx, rdi
1458d24da: call      0x145da94eb
1458d24df: ud2
1458d24e1: mov       qword ptr [rcx], 0
1458d24e8: mov       qword ptr [rcx + 8], 8
1458d24f0: mov       qword ptr [rcx + 0x10], 0
1458d24f8: mov       rax, rcx
1458d24fb: add       rsp, 0x40
1458d24ff: pop       rbx
1458d2500: pop       rbp
1458d2501: pop       rdi
1458d2502: pop       rsi
1458d2503: pop       r12
1458d2505: pop       r14
1458d2507: pop       r15
1458d2509: ret
1458d250a: mov       rdi, qword ptr [rax + rdx - 0x10]
1458d250f: test      rsi, rsi
1458d2512: je        0x1458d25a7
1458d2518: mov       r12, rcx
1458d251b: call      0x140002200
1458d2520: mov       r14d, 8
1458d2526: mov       edx, 8
1458d252b: mov       rcx, rsi
1458d252e: call      0x1400021c0
1458d2533: test      rax, rax
1458d2536: je        0x1458d23eb
1458d253c: mov       rbx, rax
1458d253f: mov       r14, r15
1458d2542: mov       rcx, r12
1458d2545: test      r15, r15
1458d2548: je        0x1458d255e
1458d254a: mov       r12, rcx
1458d254d: mov       rcx, rbx
1458d2550: mov       rdx, rdi
1458d2553: mov       r8, rsi
1458d2556: call      0x145c0a3db
1458d255b: mov       rcx, r12
1458d255e: mov       qword ptr [rcx], r14
1458d2561: mov       qword ptr [rcx + 8], rbx
1458d2565: mov       qword ptr [rcx + 0x10], r15
1458d2569: jmp       0x1458d24f8
1458d256b: mov       rbx, qword ptr [rdx + rax - 0x40]
1458d2570: test      rdi, rdi
1458d2573: je        0x1458d25b6
1458d2575: mov       ebp, r8d
1458d2578: mov       r12, rcx
1458d257b: call      0x140002200
1458d2580: mov       r14d, 8
1458d2586: mov       edx, 8
1458d258b: mov       rcx, rdi
1458d258e: call      0x1400021c0
1458d2593: test      rax, rax
1458d2596: je        0x1458d24d4
1458d259c: mov       rdx, r15
1458d259f: mov       rcx, r12
1458d25a2: mov       r8d, ebp
1458d25a5: jmp       0x1458d25bd
1458d25a7: mov       ebx, 8
1458d25ac: xor       r14d, r14d
1458d25af: test      r15, r15
1458d25b2: jne       0x1458d254a
1458d25b4: jmp       0x1458d255e
1458d25b6: mov       eax, 8
1458d25bb: xor       edx, edx
1458d25bd: mov       qword ptr [rsp + 0x28], rdx
1458d25c2: mov       qword ptr [rsp + 0x30], rax
1458d25c7: mov       qword ptr [rsp + 0x38], 0
1458d25d0: test      r15, r15
1458d25d3: je        0x1458d25f4
1458d25d5: mov       r14, rcx
1458d25d8: mov       rcx, rax
1458d25db: mov       rdx, rbx
1458d25de: mov       ebx, r8d
1458d25e1: mov       r8, rdi
1458d25e4: call      0x145c0a3db
1458d25e9: mov       r8d, ebx
1458d25ec: mov       rcx, r14
1458d25ef: mov       qword ptr [rsp + 0x38], r15
1458d25f4: lea       rdx, [rsp + 0x28]
1458d25f9: mov       rdi, rcx
1458d25fc: mov       r9d, esi
1458d25ff: call      0x14599fe20
1458d2604: mov       rcx, rdi
1458d2607: jmp       0x1458d24f8

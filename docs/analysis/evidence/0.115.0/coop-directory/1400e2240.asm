0x1400e2240: push rbp
0x1400e2241: push r15
0x1400e2243: push r14
0x1400e2245: push r13
0x1400e2247: push r12
0x1400e2249: push rsi
0x1400e224a: push rdi
0x1400e224b: push rbx
0x1400e224c: sub rsp, 0x58
0x1400e2250: lea rbp, [rsp + 0x50]
0x1400e2255: mov qword ptr [rbp], 0xfffffffffffffffe
0x1400e225d: mov rbx, rdx
0x1400e2260: mov r14, qword ptr [rdx + 0x10]
0x1400e2264: test r14, r14
0x1400e2267: je 0x1400e228e
0x1400e2269: mov rax, qword ptr [rbx + 0x18]
0x1400e226d: nop dword ptr [rax]
0x1400e2270: cmp r14, rax
0x1400e2273: je 0x1400e228e
0x1400e2275: mov rdx, r14
0x1400e2278: add r14, 0x20
0x1400e227c: mov qword ptr [rbx + 0x10], r14
0x1400e2280: cmp byte ptr [rdx], 2
0x1400e2283: jne 0x1400e2270
0x1400e2285: cmp qword ptr [rdx + 8], 0
0x1400e228a: jne 0x1400e2270
0x1400e228c: jmp 0x1400e22e0
0x1400e228e: cmp dword ptr [rbx], 1
0x1400e2291: jne 0x1400e22f2
0x1400e2293: mov rax, qword ptr [rbx + 8]
0x1400e2297: mov qword ptr [rbx + 8], 0
0x1400e229f: test rax, rax
0x1400e22a2: je 0x1400e22f2
0x1400e22a4: mov r14, qword ptr [rax + 8]
0x1400e22a8: mov rax, qword ptr [rax + 0x10]
0x1400e22ac: shl rax, 5
0x1400e22b0: lea rdx, [r14 + rax]
0x1400e22b4: mov qword ptr [rbx + 0x18], rdx
0x1400e22b8: nop dword ptr [rax + rax]
0x1400e22c0: test rax, rax
0x1400e22c3: je 0x1400e22ea
0x1400e22c5: mov rdx, r14
0x1400e22c8: add r14, 0x20
0x1400e22cc: mov qword ptr [rbx + 0x10], r14
0x1400e22d0: add rax, -0x20
0x1400e22d4: cmp byte ptr [rdx], 2
0x1400e22d7: jne 0x1400e22c0
0x1400e22d9: cmp qword ptr [rdx + 8], 0
0x1400e22de: jne 0x1400e22c0
0x1400e22e0: mov qword ptr [rbp - 0x10], rcx
0x1400e22e4: lea rax, [r14 - 0x20]
0x1400e22e8: jmp 0x1400e233b
0x1400e22ea: mov qword ptr [rbx + 8], 0
0x1400e22f2: mov qword ptr [rbx + 0x10], 0
0x1400e22fa: mov rax, qword ptr [rbx + 0x20]
0x1400e22fe: test rax, rax
0x1400e2301: je 0x1400e24a9
0x1400e2307: mov r8, qword ptr [rbx + 0x28]
0x1400e230b: nop dword ptr [rax + rax]
0x1400e2310: cmp rax, r8
0x1400e2313: je 0x1400e24a9
0x1400e2319: mov rdx, rax
0x1400e231c: add rax, 0x20
0x1400e2320: mov qword ptr [rbx + 0x20], rax
0x1400e2324: cmp byte ptr [rdx], 2
0x1400e2327: jne 0x1400e2310
0x1400e2329: cmp qword ptr [rdx + 8], 0
0x1400e232e: jne 0x1400e2310
0x1400e2330: mov qword ptr [rbp - 0x10], rcx
0x1400e2334: add rax, -0x20
0x1400e2338: xor r14d, r14d
0x1400e233b: mov rsi, qword ptr [rax + 0x10]
0x1400e233f: call 0x140002200
0x1400e2344: mov edi, 1
0x1400e2349: mov ecx, 8
0x1400e234e: mov edx, 1
0x1400e2353: call 0x1400021c0
0x1400e2358: test rax, rax
0x1400e235b: je 0x1400e24d4
0x1400e2361: mov byte ptr [rax], sil
0x1400e2364: mov qword ptr [rbp - 0x28], 8
0x1400e236c: mov qword ptr [rbp - 0x20], rax
0x1400e2370: mov qword ptr [rbp - 0x18], 1
0x1400e2378: movzx ecx, byte ptr [rbx]
0x1400e237b: mov byte ptr [rbp - 1], cl
0x1400e237e: mov rsi, qword ptr [rbx + 8]
0x1400e2382: mov r13, qword ptr [rbx + 0x18]
0x1400e2386: mov r15, qword ptr [rbx + 0x20]
0x1400e238a: mov r12, qword ptr [rbx + 0x28]
0x1400e238e: jmp 0x1400e239e
0x1400e2390: mov rax, qword ptr [rbp - 0x20]
0x1400e2394: mov byte ptr [rax + rdi], bl
0x1400e2397: inc rdi
0x1400e239a: mov qword ptr [rbp - 0x18], rdi
0x1400e239e: test r14, r14
0x1400e23a1: je 0x1400e23e0
0x1400e23a3: nop word ptr cs:[rax + rax]
0x1400e23b0: cmp r14, r13
0x1400e23b3: je 0x1400e23e0
0x1400e23b5: mov rcx, r14
0x1400e23b8: add r14, 0x20
0x1400e23bc: cmp byte ptr [rcx], 2
0x1400e23bf: jne 0x1400e23b0
0x1400e23c1: cmp qword ptr [rcx + 8], 0
0x1400e23c6: jne 0x1400e23b0
0x1400e23c8: lea rcx, [r14 - 0x20]
0x1400e23cc: jmp 0x1400e245f
0x1400e23d1: nop word ptr cs:[rax + rax]
0x1400e23e0: test byte ptr [rbp - 1], 1
0x1400e23e4: je 0x1400e2432
0x1400e23e6: test rsi, rsi
0x1400e23e9: je 0x1400e2430
0x1400e23eb: mov r14, qword ptr [rsi + 8]
0x1400e23ef: mov rcx, qword ptr [rsi + 0x10]
0x1400e23f3: shl rcx, 5
0x1400e23f7: lea r13, [r14 + rcx]
0x1400e23fb: nop dword ptr [rax + rax]
0x1400e2400: test rcx, rcx
0x1400e2403: je 0x1400e2430
0x1400e2405: mov rdx, r14
0x1400e2408: add r14, 0x20
0x1400e240c: add rcx, -0x20
0x1400e2410: cmp byte ptr [rdx], 2
0x1400e2413: jne 0x1400e2400
0x1400e2415: cmp qword ptr [rdx + 8], 0
0x1400e241a: jne 0x1400e2400
0x1400e241c: lea rcx, [r14 - 0x20]
0x1400e2420: xor esi, esi
0x1400e2422: jmp 0x1400e245f
0x1400e2424: nop word ptr cs:[rax + rax]
0x1400e2430: xor esi, esi
0x1400e2432: test r15, r15
0x1400e2435: je 0x1400e2494
0x1400e2437: nop word ptr [rax + rax]
0x1400e2440: cmp r15, r12
0x1400e2443: je 0x1400e2494
0x1400e2445: mov rcx, r15
0x1400e2448: add r15, 0x20
0x1400e244c: cmp byte ptr [rcx], 2
0x1400e244f: jne 0x1400e2440
0x1400e2451: cmp qword ptr [rcx + 8], 0
0x1400e2456: jne 0x1400e2440
0x1400e2458: lea rcx, [r15 - 0x20]
0x1400e245c: xor r14d, r14d
0x1400e245f: movzx ebx, byte ptr [rcx + 0x10]
0x1400e2463: cmp rdi, qword ptr [rbp - 0x28]
0x1400e2467: jne 0x1400e2394
0x1400e246d: mov qword ptr [rsp + 0x20], 1
0x1400e2476: mov r8d, 1
0x1400e247c: mov r9d, 1
0x1400e2482: lea rcx, [rbp - 0x28]
0x1400e2486: mov rdx, rdi
0x1400e2489: call 0x145d14a10
0x1400e248e: nop
0x1400e248f: jmp 0x1400e2390
0x1400e2494: mov rax, qword ptr [rbp - 0x18]
0x1400e2498: mov rcx, qword ptr [rbp - 0x10]
0x1400e249c: mov qword ptr [rcx + 0x10], rax
0x1400e24a0: movups xmm0, xmmword ptr [rbp - 0x28]
0x1400e24a4: movups xmmword ptr [rcx], xmm0
0x1400e24a7: jmp 0x1400e24c0
0x1400e24a9: mov qword ptr [rcx], 0
0x1400e24b0: mov qword ptr [rcx + 8], 1
0x1400e24b8: mov qword ptr [rcx + 0x10], 0
0x1400e24c0: mov rax, rcx
0x1400e24c3: add rsp, 0x58
0x1400e24c7: pop rbx
0x1400e24c8: pop rdi
0x1400e24c9: pop rsi
0x1400e24ca: pop r12
0x1400e24cc: pop r13
0x1400e24ce: pop r14
0x1400e24d0: pop r15
0x1400e24d2: pop rbp
0x1400e24d3: ret
0x1400e24d4: mov ecx, 1
0x1400e24d9: mov edx, 8
0x1400e24de: call 0x145eb6fcb
0x1400e24e3: ud2

1458e22b0: push	r15
1458e22b2: push	r14
1458e22b4: push	r12
1458e22b6: push	rsi
1458e22b7: push	rdi
1458e22b8: push	rbp
1458e22b9: push	rbx
1458e22ba: sub	rsp, 0x70
1458e22be: mov	rsi, rcx
1458e22c1: mov	rdi, qword ptr [rdx]
1458e22c4: mov	rbx, qword ptr [rdx + 0x10]
1458e22c8: cmp	rbx, -4
1458e22cc: jb	0x1458e22d7
1458e22ce: mov	r14, qword ptr [rdx + 8]
1458e22d2: jmp	0x1458e2452
1458e22d7: lea	r15, [rbx + 4]
1458e22db: mov	r14, qword ptr [rdx + 8]
1458e22df: cmp	r15, r14
1458e22e2: ja	0x1458e2452
1458e22e8: mov	r12, rdx
1458e22eb: lea	rdx, [rdi + rbx]
1458e22ef: lea	rcx, [rsp + 0x20]
1458e22f4: mov	r8d, 4
1458e22fa: call	0x145bcdeb0
1458e22ff: cmp	dword ptr [rsp + 0x20], 1
1458e2304: je	0x1458e2452
1458e230a: mov	r9, qword ptr [rsp + 0x30]
1458e230f: test	r9, r9
1458e2312: je	0x1458e2452
1458e2318: mov	rax, qword ptr [rsp + 0x28]
1458e231d: cmp	r9, 1
1458e2321: jne	0x1458e2340
1458e2323: movzx	r8d, byte ptr [rax]
1458e2327: cmp	r8d, 0x2b
1458e232b: je	0x1458e2452
1458e2331: mov	rcx, r12
1458e2334: cmp	r8d, 0x2d
1458e2338: je	0x1458e2452
1458e233e: jmp	0x1458e2347
1458e2340: movzx	r8d, byte ptr [rax]
1458e2344: mov	rcx, r12
1458e2347: xor	edx, edx
1458e2349: cmp	r8b, 0x2b
1458e234d: sete	dl
1458e2350: mov	r8, r9
1458e2353: sub	r8, rdx
1458e2356: add	rax, rdx
1458e2359: cmp	r8, 9
1458e235d: jae	0x1458e23e4
1458e2363: test	r8, r8
1458e2366: je	0x1458e2443
1458e236c: movzx	r9d, byte ptr [rax]
1458e2370: lea	r10d, [r9 - 0x41]
1458e2374: and	r10d, 0xffffffdf
1458e2378: add	r10d, 0xa
1458e237c: lea	edx, [r9 - 0x30]
1458e2380: cmp	r9d, 0x3a
1458e2384: cmovae	edx, r10d
1458e2388: cmp	edx, 0xf
1458e238b: ja	0x1458e2452
1458e2391: cmp	r8, 1
1458e2395: je	0x1458e2445
1458e239b: movzx	r10d, byte ptr [rax + 1]
1458e23a0: lea	r11d, [r10 - 0x41]
1458e23a4: and	r11d, 0xffffffdf
1458e23a8: add	r11d, 0xa
1458e23ac: lea	r9d, [r10 - 0x30]
1458e23b0: cmp	r10d, 0x3a
1458e23b4: cmovae	r9d, r11d
1458e23b8: cmp	r9d, 0xf
1458e23bc: ja	0x1458e2452
1458e23c2: shl	edx, 4
1458e23c5: or	r9d, edx
1458e23c8: cmp	r8, 2
1458e23cc: jne	0x1458e2515
1458e23d2: mov	edx, r9d
1458e23d5: shl	rdx, 0x20
1458e23d9: test	dl, 1
1458e23dc: je	0x1458e25f9
1458e23e2: jmp	0x1458e2452
1458e23e4: neg	rdx
1458e23e7: add	r9, rdx
1458e23ea: neg	r9
1458e23ed: xor	edx, edx
1458e23ef: xor	r8d, r8d
1458e23f2: mov	r10, r9
1458e23f5: add	r10, r8
1458e23f8: je	0x1458e2445
1458e23fa: cmp	edx, 0xfffffff
1458e2400: ja	0x1458e25c4
1458e2406: mov	r10d, edx
1458e2409: shl	r10d, 4
1458e240d: movzx	r11d, byte ptr [rax + r8]
1458e2412: lea	ebp, [r11 - 0x41]
1458e2416: and	ebp, 0xffffffdf
1458e2419: add	ebp, 0xa
1458e241c: lea	edx, [r11 - 0x30]
1458e2420: cmp	r11d, 0x3a
1458e2424: cmovae	edx, ebp
1458e2427: cmp	edx, 0x10
1458e242a: setae	r11b
1458e242e: add	edx, r10d
1458e2431: setb	r10b
1458e2435: or	r10b, r11b
1458e2438: inc	r8
1458e243b: test	r10b, 1
1458e243f: jne	0x1458e2452
1458e2441: jmp	0x1458e23f2
1458e2443: xor	edx, edx
1458e2445: shl	rdx, 0x20
1458e2449: test	dl, 1
1458e244c: je	0x1458e25f9
1458e2452: lea	rax, [rip + 0x1308a69]
1458e2459: mov	qword ptr [rsp + 0x60], rax
1458e245e: mov	qword ptr [rsp + 0x68], 0xd
1458e2467: cmp	r14, rbx
1458e246a: cmovb	rbx, r14
1458e246e: test	rbx, rbx
1458e2471: je	0x1458e2482
1458e2473: cmp	rbx, 4
1458e2477: jae	0x1458e2489
1458e2479: xor	eax, eax
1458e247b: xor	ecx, ecx
1458e247d: jmp	0x1458e26c8
1458e2482: xor	ecx, ecx
1458e2484: jmp	0x1458e26dc
1458e2489: mov	rax, rbx
1458e248c: and	rax, 0xfffffffffffffffc
1458e2490: pxor	xmm0, xmm0
1458e2494: xor	ecx, ecx
1458e2496: movdqa	xmm1, xmmword ptr [rip + 0x7791f2]
1458e249e: movdqa	xmm3, xmmword ptr [rip + 0x4b532a]
1458e24a6: pxor	xmm2, xmm2
1458e24aa: nop	word ptr [rax + rax]
1458e24b0: movzx	edx, word ptr [rdi + rcx]
1458e24b4: movd	xmm4, edx
1458e24b8: movzx	edx, word ptr [rdi + rcx + 2]
1458e24bd: movd	xmm5, edx
1458e24c1: pcmpeqb	xmm4, xmm1
1458e24c5: punpcklbw	xmm4, xmm4
1458e24c9: pshuflw	xmm4, xmm4, 0xd4
1458e24ce: pshufd	xmm4, xmm4, 0xd4
1458e24d3: pand	xmm4, xmm3
1458e24d7: paddq	xmm2, xmm4
1458e24db: pcmpeqb	xmm5, xmm1
1458e24df: punpcklbw	xmm5, xmm5
1458e24e3: pshuflw	xmm4, xmm5, 0xd4
1458e24e8: pshufd	xmm4, xmm4, 0xd4
1458e24ed: pand	xmm4, xmm3
1458e24f1: paddq	xmm0, xmm4
1458e24f5: add	rcx, 4
1458e24f9: cmp	rax, rcx
1458e24fc: jne	0x1458e24b0
1458e24fe: paddq	xmm0, xmm2
1458e2502: pshufd	xmm1, xmm0, 0xee
1458e2507: paddq	xmm1, xmm0
1458e250b: movq	rcx, xmm1
1458e2510: jmp	0x1458e26d7
1458e2515: movzx	r10d, byte ptr [rax + 2]
1458e251a: lea	r11d, [r10 - 0x41]
1458e251e: and	r11d, 0xffffffdf
1458e2522: add	r11d, 0xa
1458e2526: lea	edx, [r10 - 0x30]
1458e252a: cmp	r10d, 0x3a
1458e252e: cmovae	edx, r11d
1458e2532: cmp	edx, 0xf
1458e2535: ja	0x1458e2452
1458e253b: shl	r9d, 4
1458e253f: or	edx, r9d
1458e2542: cmp	r8, 3
1458e2546: je	0x1458e2445
1458e254c: movzx	r10d, byte ptr [rax + 3]
1458e2551: lea	r11d, [r10 - 0x41]
1458e2555: and	r11d, 0xffffffdf
1458e2559: add	r11d, 0xa
1458e255d: lea	r9d, [r10 - 0x30]
1458e2561: cmp	r10d, 0x3a
1458e2565: cmovae	r9d, r11d
1458e2569: cmp	r9d, 0xf
1458e256d: ja	0x1458e2452
1458e2573: shl	edx, 4
1458e2576: or	r9d, edx
1458e2579: cmp	r8, 4
1458e257d: je	0x1458e23d2
1458e2583: movzx	ecx, byte ptr [rax + 4]
1458e2587: lea	r10d, [rcx - 0x41]
1458e258b: and	r10d, 0xffffffdf
1458e258f: add	r10d, 0xa
1458e2593: lea	edx, [rcx - 0x30]
1458e2596: cmp	ecx, 0x3a
1458e2599: cmovae	edx, r10d
1458e259d: cmp	edx, 0xf
1458e25a0: ja	0x1458e2452
1458e25a6: shl	r9d, 4
1458e25aa: or	edx, r9d
1458e25ad: cmp	r8, 5
1458e25b1: jne	0x1458e2610
1458e25b3: mov	rcx, r12
1458e25b6: shl	rdx, 0x20
1458e25ba: test	dl, 1
1458e25bd: je	0x1458e25f9
1458e25bf: jmp	0x1458e2452
1458e25c4: movzx	eax, byte ptr [rax + r8]
1458e25c9: lea	edx, [rax - 0x41]
1458e25cc: and	edx, 0xffffffde
1458e25cf: add	edx, 0xa
1458e25d2: lea	r8d, [rax - 0x30]
1458e25d6: cmp	eax, 0x3a
1458e25d9: cmovae	r8d, edx
1458e25dd: xor	edx, edx
1458e25df: cmp	r8d, 0x10
1458e25e3: setb	dl
1458e25e6: shl	edx, 8
1458e25e9: add	rdx, 0x101
1458e25f0: test	dl, 1
1458e25f3: jne	0x1458e2452
1458e25f9: shr	rdx, 0x20
1458e25fd: mov	qword ptr [rcx + 0x10], r15
1458e2601: mov	dword ptr [rsi + 8], edx
1458e2604: mov	qword ptr [rsi], 0xffffffffffffffff
1458e260b: jmp	0x1458e2745
1458e2610: movzx	r9d, byte ptr [rax + 5]
1458e2615: lea	r10d, [r9 - 0x41]
1458e2619: and	r10d, 0xffffffdf
1458e261d: add	r10d, 0xa
1458e2621: lea	ecx, [r9 - 0x30]
1458e2625: cmp	r9d, 0x3a
1458e2629: cmovae	ecx, r10d
1458e262d: cmp	ecx, 0xf
1458e2630: ja	0x1458e2452
1458e2636: shl	edx, 4
1458e2639: or	ecx, edx
1458e263b: cmp	r8, 6
1458e263f: jne	0x1458e2654
1458e2641: mov	edx, ecx
1458e2643: mov	rcx, r12
1458e2646: shl	rdx, 0x20
1458e264a: test	dl, 1
1458e264d: je	0x1458e25f9
1458e264f: jmp	0x1458e2452
1458e2654: movzx	r9d, byte ptr [rax + 6]
1458e2659: lea	r10d, [r9 - 0x41]
1458e265d: and	r10d, 0xffffffdf
1458e2661: add	r10d, 0xa
1458e2665: lea	edx, [r9 - 0x30]
1458e2669: cmp	r9d, 0x3a
1458e266d: cmovae	edx, r10d
1458e2671: cmp	edx, 0xf
1458e2674: ja	0x1458e2452
1458e267a: shl	ecx, 4
1458e267d: or	edx, ecx
1458e267f: cmp	r8, 7
1458e2683: je	0x1458e25b3
1458e2689: movzx	ecx, byte ptr [rax + 7]
1458e268d: lea	r8d, [rcx - 0x41]
1458e2691: and	r8d, 0xffffffdf
1458e2695: add	r8d, 0xa
1458e2699: lea	eax, [rcx - 0x30]
1458e269c: cmp	ecx, 0x3a
1458e269f: cmovae	eax, r8d
1458e26a3: cmp	eax, 0xf
1458e26a6: ja	0x1458e2452
1458e26ac: shl	edx, 4
1458e26af: or	eax, edx
1458e26b1: mov	edx, eax
1458e26b3: mov	rcx, r12
1458e26b6: shl	rdx, 0x20
1458e26ba: test	dl, 1
1458e26bd: jne	0x1458e2452
1458e26c3: jmp	0x1458e25f9
1458e26c8: xor	edx, edx
1458e26ca: cmp	byte ptr [rdi + rax], 0xa
1458e26ce: sete	dl
1458e26d1: add	rcx, rdx
1458e26d4: inc	rax
1458e26d7: cmp	rbx, rax
1458e26da: jne	0x1458e26c8
1458e26dc: inc	rcx
1458e26df: mov	qword ptr [rsp + 0x40], rcx
1458e26e4: lea	rax, [rsp + 0x40]
1458e26e9: mov	qword ptr [rsp + 0x20], rax
1458e26ee: lea	rax, [rip + 0x2f593b]
1458e26f5: mov	qword ptr [rsp + 0x28], rax
1458e26fa: lea	rax, [rsp + 0x60]
1458e26ff: mov	qword ptr [rsp + 0x30], rax
1458e2704: lea	rax, [rip - 0x58e064b]
1458e270b: mov	qword ptr [rsp + 0x38], rax
1458e2710: lea	rdx, [rip + 0x13087b8]
1458e2717: lea	rcx, [rsp + 0x48]
1458e271c: lea	r8, [rsp + 0x20]
1458e2721: call	0x145bc5690
1458e2726: mov	rax, qword ptr [rsp + 0x48]
1458e272b: mov	ecx, dword ptr [rsp + 0x50]
1458e272f: mov	edx, dword ptr [rsp + 0x5c]
1458e2733: mov	dword ptr [rsi + 0x14], edx
1458e2736: mov	rdx, qword ptr [rsp + 0x54]
1458e273b: mov	qword ptr [rsi + 0xc], rdx
1458e273f: mov	qword ptr [rsi], rax
1458e2742: mov	dword ptr [rsi + 8], ecx
1458e2745: add	rsp, 0x70
1458e2749: pop	rbx
1458e274a: pop	rbp
1458e274b: pop	rdi
1458e274c: pop	rsi
1458e274d: pop	r12
1458e274f: pop	r14
1458e2751: pop	r15
1458e2753: ret

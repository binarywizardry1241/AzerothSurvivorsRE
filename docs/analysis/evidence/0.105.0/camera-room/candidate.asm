140ab2310: push r15
140ab2312: push r14
140ab2314: push rsi
140ab2315: push rdi
140ab2316: push rbx
140ab2317: sub rsp, 0xd0
140ab231e: movaps xmmword ptr [rsp + 0xc0], xmm12
140ab2327: movaps xmmword ptr [rsp + 0xb0], xmm11
140ab2330: movaps xmmword ptr [rsp + 0xa0], xmm10
140ab2339: movaps xmmword ptr [rsp + 0x90], xmm9
140ab2342: movaps xmmword ptr [rsp + 0x80], xmm8
140ab234b: movaps xmmword ptr [rsp + 0x70], xmm7
140ab2350: movaps xmmword ptr [rsp + 0x60], xmm6
140ab2355: mov rax, qword ptr [rcx + 0x10]
140ab2359: mov rax, qword ptr [rax]
140ab235c: movss xmm0, dword ptr [rip + 0x549c75c]
140ab2364: subss xmm0, dword ptr [rax]
140ab2368: xorps xmm6, xmm6
140ab236b: cvtsi2ss xmm6, edx
140ab236f: mulss xmm6, xmm0
140ab2373: divss xmm6, dword ptr [rip + 0x52bb2d5]
140ab237b: mov r15, qword ptr [rcx]
140ab237e: mov rax, qword ptr [rcx + 8]
140ab2382: movss xmm7, dword ptr [rax]
140ab2386: addss xmm7, xmm6
140ab238a: mov r14, qword ptr [r15]
140ab238d: mov rax, qword ptr [r15 + 8]
140ab2391: mov rsi, qword ptr [rax]
140ab2394: movss xmm8, dword ptr [rsi + 8]
140ab239a: movaps xmm11, xmm8
140ab239e: mulss xmm11, xmm8
140ab23a3: movaps xmm0, xmm7
140ab23a6: call 0x145bc97c3
140ab23ab: mov rbx, qword ptr [r15 + 0x10]
140ab23af: movss xmm10, dword ptr [rbx]
140ab23b4: movsd xmm9, qword ptr [r14]
140ab23b9: movsd xmm1, qword ptr [rsi]
140ab23bd: movaps xmm2, xmm1
140ab23c0: mulps xmm2, xmm1
140ab23c3: movshdup xmm3, xmm2
140ab23c7: addss xmm3, xmm2
140ab23cb: addss xmm3, xmm11
140ab23d0: xorps xmm2, xmm2
140ab23d3: sqrtss xmm2, xmm3
140ab23d7: movss xmm11, dword ptr [rip + 0x52baf8c]
140ab23e0: divss xmm11, xmm2
140ab23e5: movsldup xmm2, xmm11
140ab23ea: mulps xmm2, xmm1
140ab23ed: mulss xmm11, xmm8
140ab23f2: movsldup xmm12, xmm0
140ab23f7: mulps xmm12, xmm2
140ab23fb: mulss xmm11, xmm0
140ab2400: movaps xmm0, xmm7
140ab2403: call 0x145bc97bd
140ab2408: movsldup xmm7, xmm0
140ab240c: mulps xmm7, xmmword ptr [rip + 0x52baeed]
140ab2413: addps xmm12, xmm7
140ab2417: addss xmm7, xmm11
140ab241c: movsldup xmm8, xmm10
140ab2421: mulps xmm8, xmm12
140ab2425: mulss xmm7, xmm10
140ab242a: addss xmm7, dword ptr [r14 + 8]
140ab2430: addps xmm8, xmm9
140ab2434: movlps qword ptr [rsp + 0x40], xmm8
140ab243a: movss dword ptr [rsp + 0x48], xmm7
140ab2440: mov rax, qword ptr [r15 + 0x18]
140ab2444: mov rcx, qword ptr [rax]
140ab2447: mov rsi, qword ptr [rax + 8]
140ab244b: mov rdi, qword ptr [rcx]
140ab244e: mov rax, qword ptr [rax + 0x10]
140ab2452: mov rcx, qword ptr [rax]
140ab2455: mov rax, qword ptr [rax + 8]
140ab2459: mov rcx, qword ptr [rcx]
140ab245c: mov rdx, qword ptr [rax]
140ab245f: mov eax, dword ptr [rsp + 0x48]
140ab2463: mov dword ptr [rsp + 0x38], eax
140ab2467: mov rax, qword ptr [rsp + 0x40]
140ab246c: mov qword ptr [rsp + 0x30], rax
140ab2471: lea r8, [rsp + 0x30]
140ab2476: call 0x1418e5a00
140ab247b: movss dword ptr [rsp + 0x20], xmm0
140ab2481: lea rcx, [rsp + 0x40]
140ab2486: mov rdx, rdi
140ab2489: mov r8, rsi
140ab248c: mov r9d, eax
140ab248f: call 0x140acaca0
140ab2494: test al, al
140ab2496: je 0x140ab24f7
140ab2498: mov rcx, qword ptr [r15 + 0x20]
140ab249c: mov eax, dword ptr [r14 + 8]
140ab24a0: mov dword ptr [rsp + 0x58], eax
140ab24a4: mov rax, qword ptr [r14]
140ab24a7: mov qword ptr [rsp + 0x50], rax
140ab24ac: subss xmm7, dword ptr [r14 + 8]
140ab24b2: movsd xmm0, qword ptr [r14]
140ab24b7: subps xmm8, xmm0
140ab24bb: movlps qword ptr [rsp + 0x30], xmm8
140ab24c1: movss dword ptr [rsp + 0x38], xmm7
140ab24c7: xor esi, esi
140ab24c9: lea rdx, [rsp + 0x50]
140ab24ce: lea r8, [rsp + 0x30]
140ab24d3: xor r9d, r9d
140ab24d6: call 0x141898ff0
140ab24db: test al, 1
140ab24dd: je 0x140ab24f0
140ab24df: movss xmm1, dword ptr [rbx]
140ab24e3: mulss xmm1, dword ptr [rip + 0x549c5d9]
140ab24eb: ucomiss xmm0, xmm1
140ab24ee: jb 0x140ab24f9
140ab24f0: mov esi, 1
140ab24f5: jmp 0x140ab24f9
140ab24f7: xor esi, esi
140ab24f9: mov eax, esi
140ab24fb: movaps xmm0, xmm6
140ab24fe: movaps xmm6, xmmword ptr [rsp + 0x60]
140ab2503: movaps xmm7, xmmword ptr [rsp + 0x70]
140ab2508: movaps xmm8, xmmword ptr [rsp + 0x80]
140ab2511: movaps xmm9, xmmword ptr [rsp + 0x90]
140ab251a: movaps xmm10, xmmword ptr [rsp + 0xa0]
140ab2523: movaps xmm11, xmmword ptr [rsp + 0xb0]
140ab252c: movaps xmm12, xmmword ptr [rsp + 0xc0]
140ab2535: add rsp, 0xd0
140ab253c: pop rbx
140ab253d: pop rdi
140ab253e: pop rsi
140ab253f: pop r14
140ab2541: pop r15
140ab2543: ret

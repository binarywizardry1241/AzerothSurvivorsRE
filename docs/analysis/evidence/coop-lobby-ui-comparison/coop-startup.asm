0x140146170: push rbp
0x140146171: push r15
0x140146173: push r14
0x140146175: push r12
0x140146177: push rsi
0x140146178: push rdi
0x140146179: push rbx
0x14014617a: sub rsp, 0x610
0x140146181: lea rbp, [rsp + 0x80]
0x140146189: mov qword ptr [rbp + 0x588], 0xfffffffffffffffe
0x140146194: mov rsi, rcx
0x140146197: lea rdi, [rcx + 0x40]
0x14014619b: lea r15, [rcx + 0x5a8]
0x1401461a2: mov qword ptr [rbp + 0x528], rdi
0x1401461a9: mov qword ptr [rbp + 0x530], r15
0x1401461b0: mov qword ptr [rbp + 0x510], 0
0x1401461bb: mov qword ptr [rbp + 0x518], 8
0x1401461c6: mov qword ptr [rbp + 0x520], 0
0x1401461d1: cmp qword ptr [rcx + 0x90], 0
0x1401461d9: je 0x14014628b
0x1401461df: movabs rcx, 0x747497d842415a13
0x1401461e9: mov rax, qword ptr [rsi + 0x78]
0x1401461ed: mov rdx, qword ptr [rsi + 0x80]
0x1401461f4: xor r8d, r8d
0x1401461f7: movdqa xmm0, xmmword ptr [rip + 0x6075701]
0x1401461ff: pcmpeqd xmm1, xmm1
0x140146203: movdqa xmm2, xmmword ptr [rip + 0x6075705]
0x14014620b: and rcx, rdx
0x14014620e: movdqu xmm3, xmmword ptr [rax + rcx]
0x140146213: movdqa xmm4, xmm3
0x140146217: pcmpeqb xmm4, xmm0
0x14014621b: pmovmskb r9d, xmm4
0x140146220: test r9d, r9d
0x140146223: je 0x140146270
0x140146225: tzcnt r10d, r9d
0x14014622a: add r10, rcx
0x14014622d: and r10, rdx
0x140146230: neg r10
0x140146233: lea r10, [r10 + r10*2]
0x140146237: movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
0x14014623e: pcmpeqb xmm4, xmm2
0x140146242: pmovmskb r11d, xmm4
0x140146247: cmp r11d, 0xffff
0x14014624e: je 0x14014633f
0x140146254: lea r10d, [r9 - 1]
0x140146258: and r10w, r9w
0x14014625c: mov r9d, r10d
0x14014625f: jne 0x140146225
0x140146261: nop word ptr cs:[rax + rax]
0x140146270: pcmpeqb xmm3, xmm1
0x140146274: pmovmskb r9d, xmm3
0x140146279: test r9d, r9d
0x14014627c: jne 0x14014628b
0x14014627e: add rcx, r8
0x140146281: add rcx, 0x10
0x140146285: add r8, 0x10
0x140146289: jmp 0x14014620b
0x14014628b: movzx eax, byte ptr [rsi + 0xa0]
0x140146292: mov rax, qword ptr [rsi + 0xe0]
0x140146299: mov rcx, qword ptr [rsi + 0xe8]
0x1401462a0: movabs rdx, 0x747497d842415a13
0x1401462aa: xor r8d, r8d
0x1401462ad: movdqa xmm0, xmmword ptr [rip + 0x607564b]
0x1401462b5: pcmpeqd xmm1, xmm1
0x1401462b9: movdqa xmm2, xmmword ptr [rip + 0x607564f]
0x1401462c1: and rdx, rcx
0x1401462c4: movdqu xmm3, xmmword ptr [rax + rdx]
0x1401462c9: movdqa xmm4, xmm3
0x1401462cd: pcmpeqb xmm4, xmm0
0x1401462d1: pmovmskb r11d, xmm4
0x1401462d6: test r11d, r11d
0x1401462d9: je 0x140146320
0x1401462db: tzcnt r10d, r11d
0x1401462e0: add r10, rdx
0x1401462e3: and r10, rcx
0x1401462e6: mov rbx, r10
0x1401462e9: shl rbx, 7
0x1401462ed: mov r9, rax
0x1401462f0: sub r9, rbx
0x1401462f3: movdqu xmm4, xmmword ptr [r9 - 0x80]
0x1401462f9: pcmpeqb xmm4, xmm2
0x1401462fd: pmovmskb ebx, xmm4
0x140146301: cmp ebx, 0xffff
0x140146307: je 0x14014635c
0x140146309: lea r9d, [r11 - 1]
0x14014630d: and r9w, r11w
0x140146311: mov r11d, r9d
0x140146314: jne 0x1401462db
0x140146316: nop word ptr cs:[rax + rax]
0x140146320: pcmpeqb xmm3, xmm1
0x140146324: pmovmskb r9d, xmm3
0x140146329: test r9d, r9d
0x14014632c: jne 0x1401463cf
0x140146332: add rdx, r8
0x140146335: add rdx, 0x10
0x140146339: add r8, 0x10
0x14014633d: jmp 0x1401462c1
0x14014633f: lea rax, [rax + r10*8]
0x140146343: mov r14, qword ptr [rax - 8]
0x140146347: mov rdx, qword ptr [rbp + 0x510]
0x14014634e: test rdx, rdx
0x140146351: jne 0x14014646d
0x140146357: jmp 0x140146483
0x14014635c: lea rdx, [r10 - 0x10]
0x140146360: and rdx, rcx
0x140146363: movdqu xmm0, xmmword ptr [rax + rdx]
0x140146368: pcmpeqd xmm1, xmm1
0x14014636c: pcmpeqb xmm0, xmm1
0x140146370: pmovmskb ecx, xmm0
0x140146374: movdqu xmm0, xmmword ptr [rax + r10]
0x14014637a: pcmpeqb xmm0, xmm1
0x14014637e: pmovmskb r8d, xmm0
0x140146383: mov r11w, 0x1f
0x140146388: bsr r11w, cx
0x14014638d: xor r11d, 0xf
0x140146391: or r8d, 0x10000
0x140146398: tzcnt r8d, r8d
0x14014639d: add r8d, r11d
0x1401463a0: mov cl, 0x80
0x1401463a2: cmp r8w, 0xf
0x1401463a7: ja 0x1401463b2
0x1401463a9: inc qword ptr [rsi + 0xf0]
0x1401463b0: mov cl, 0xff
0x1401463b2: mov byte ptr [rax + r10], cl
0x1401463b6: mov byte ptr [rax + rdx + 0x10], cl
0x1401463ba: dec qword ptr [rsi + 0xf8]
0x1401463c1: mov rax, qword ptr [r9 - 0x70]
0x1401463c5: cmp rax, 2
0x1401463c9: jne 0x1401471d2
0x1401463cf: mov r14, qword ptr [r15]
0x1401463d2: lea rax, [r14 + 1]
0x1401463d6: mov qword ptr [r15], rax
0x1401463d9: mov word ptr [rbp + 0x300], 0x100
0x1401463e2: mov qword ptr [rbp + 0x2b0], 1
0x1401463ed: movdqu xmm0, xmmword ptr [rip + 0x607d723]
0x1401463f5: movdqu xmmword ptr [rbp + 0x2b8], xmm0
0x1401463fd: mov qword ptr [rbp + 0x2d8], 8
0x140146408: mov qword ptr [rbp + 0x2e0], 0x178
0x140146413: lea rax, [rip + 0xc7da6]
0x14014641a: mov qword ptr [rbp + 0x2f8], rax
0x140146421: mov byte ptr [rbp + 0x302], 1
0x140146428: mov qword ptr [rbp + 0x2c8], 0
0x140146433: mov byte ptr [rbp + 0x2e8], 2
0x14014643a: lea r8, [rbp + 0x2b0]
0x140146441: mov rcx, rdi
0x140146444: mov rdx, r14
0x140146447: call 0x140019880
0x14014644c: nop 
0x14014644d: lea rcx, [rsi + 0x78]
0x140146451: lea rdx, [rip + 0x607d6c0]
0x140146458: mov r8, r14
0x14014645b: call 0x1400196d0
0x140146460: nop 
0x140146461: mov rdx, qword ptr [rbp + 0x510]
0x140146468: test rdx, rdx
0x14014646b: je 0x140146483
0x14014646d: mov rcx, qword ptr [rbp + 0x518]
0x140146474: shl rdx, 3
0x140146478: mov r8d, 8
0x14014647e: call 0x1400021d0
0x140146483: lea rbx, [rsi + 0x1d8]
0x14014648a: cmp r14, qword ptr [rsi + 0x218]
0x140146491: jae 0x1401464bc
0x140146493: mov rax, qword ptr [rsi + 0x210]
0x14014649a: mov rax, qword ptr [rax + r14*8]
0x14014649e: test rax, rax
0x1401464a1: je 0x1401464bc
0x1401464a3: mov rcx, qword ptr [rsi + 0x1e0]
0x1401464aa: not rax
0x1401464ad: imul rax, rax, 0x38
0x1401464b1: cmp byte ptr [rcx + rax + 0x30], 0
0x1401464b6: jne 0x140146656
0x1401464bc: pxor xmm0, xmm0
0x1401464c0: movdqu xmmword ptr [rbp + 0x2d0], xmm0
0x1401464c8: movdqu xmmword ptr [rbp + 0x2e8], xmm0
0x1401464d0: movdqu xmmword ptr [rbp + 0x300], xmm0
0x1401464d8: movdqu xmmword ptr [rbp + 0x318], xmm0
0x1401464e0: movdqu xmmword ptr [rbp + 0x348], xmm0
0x1401464e8: movdqu xmmword ptr [rbp + 0x360], xmm0
0x1401464f0: movdqu xmmword ptr [rbp + 0x378], xmm0
0x1401464f8: movdqu xmmword ptr [rbp + 0x390], xmm0
0x140146500: movdqu xmmword ptr [rbp + 0x3a8], xmm0
0x140146508: movdqu xmmword ptr [rbp + 0x3c0], xmm0
0x140146510: movdqu xmmword ptr [rbp + 0x3d8], xmm0
0x140146518: mov qword ptr [rbp + 0x2b0], 0
0x140146523: mov qword ptr [rbp + 0x2c0], 0
0x14014652e: mov qword ptr [rbp + 0x2c8], 1
0x140146539: mov qword ptr [rbp + 0x2e0], 1
0x140146544: mov qword ptr [rbp + 0x2f8], 1
0x14014654f: mov qword ptr [rbp + 0x310], 1
0x14014655a: mov qword ptr [rbp + 0x328], 8
0x140146565: movdqu xmmword ptr [rbp + 0x330], xmm0
0x14014656d: mov qword ptr [rbp + 0x340], 8
0x140146578: mov qword ptr [rbp + 0x358], 1
0x140146583: mov qword ptr [rbp + 0x370], 1
0x14014658e: mov qword ptr [rbp + 0x388], 1
0x140146599: mov qword ptr [rbp + 0x3a0], 1
0x1401465a4: mov qword ptr [rbp + 0x3b8], 1
0x1401465af: mov qword ptr [rbp + 0x3d0], 1
0x1401465ba: mov qword ptr [rbp + 0x3e8], 1
0x1401465c5: mov qword ptr [rbp + 0x3f0], 0
0x1401465d0: mov qword ptr [rbp + 0x3f8], 0xffffffffffffffff
0x1401465db: movdqu xmmword ptr [rbp + 0x410], xmm0
0x1401465e3: mov qword ptr [rbp + 0x41e], 0
0x1401465ee: mov r12d, dword ptr [rsi + 0x5b0]
0x1401465f5: mov rcx, rsi
0x1401465f8: call 0x145048d50
0x1401465fd: mov qword ptr [rbp + 0x510], r14
0x140146604: lea r9, [rbp + 0x510]
0x14014660b: mov rcx, rbx
0x14014660e: mov rdx, r14
0x140146611: mov r8, rdi
0x140146614: call 0x140136360
0x140146619: mov r14, rax
0x14014661c: cmp byte ptr [rax + 0x30], 1
0x140146620: jne 0x140146635
0x140146622: lea r8, [rbp + 0x2b0]
0x140146629: mov rcx, r14
0x14014662c: xor edx, edx
0x14014662e: call 0x145058360
0x140146633: jmp 0x140146652
0x140146635: mov r8, qword ptr [r14 + 8]
0x140146639: mov rcx, qword ptr [r14 + 0x10]
0x14014663d: lea rdx, [rbp + 0x2b0]
0x140146644: call 0x146005057
0x140146649: mov dword ptr [r14 + 0x28], r12d
0x14014664d: mov byte ptr [r14 + 0x30], 1
0x140146652: mov dword ptr [r14 + 0x2c], r12d
0x140146656: mov qword ptr [rbp + 0x528], rdi
0x14014665d: mov qword ptr [rbp + 0x530], r15
0x140146664: mov qword ptr [rbp + 0x510], 0
0x14014666f: mov qword ptr [rbp + 0x518], 8
0x14014667a: mov qword ptr [rbp + 0x520], 0
0x140146685: cmp qword ptr [rsi + 0x90], 0
0x14014668d: je 0x14014673b
0x140146693: movabs rcx, 0x34a70490425f403
0x14014669d: mov rax, qword ptr [rsi + 0x78]
0x1401466a1: mov rdx, qword ptr [rsi + 0x80]
0x1401466a8: xor r8d, r8d
0x1401466ab: movdqa xmm0, xmmword ptr [rip + 0x607cabd]
0x1401466b3: pcmpeqd xmm1, xmm1
0x1401466b7: movdqa xmm2, xmmword ptr [rip + 0x607cac1]
0x1401466bf: and rcx, rdx
0x1401466c2: movdqu xmm3, xmmword ptr [rax + rcx]
0x1401466c7: movdqa xmm4, xmm3
0x1401466cb: pcmpeqb xmm4, xmm0
0x1401466cf: pmovmskb r9d, xmm4
0x1401466d4: test r9d, r9d
0x1401466d7: je 0x140146720
0x1401466d9: tzcnt r10d, r9d
0x1401466de: add r10, rcx
0x1401466e1: and r10, rdx
0x1401466e4: neg r10
0x1401466e7: lea r10, [r10 + r10*2]
0x1401466eb: movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
0x1401466f2: pcmpeqb xmm4, xmm2
0x1401466f6: pmovmskb r11d, xmm4
0x1401466fb: cmp r11d, 0xffff
0x140146702: je 0x1401467ef
0x140146708: lea r10d, [r9 - 1]
0x14014670c: and r10w, r9w
0x140146710: mov r9d, r10d
0x140146713: jne 0x1401466d9
0x140146715: nop word ptr cs:[rax + rax]
0x140146720: pcmpeqb xmm3, xmm1
0x140146724: pmovmskb r9d, xmm3
0x140146729: test r9d, r9d
0x14014672c: jne 0x14014673b
0x14014672e: add rcx, r8
0x140146731: add rcx, 0x10
0x140146735: add r8, 0x10
0x140146739: jmp 0x1401466bf
0x14014673b: movzx eax, byte ptr [rsi + 0xa0]
0x140146742: mov rax, qword ptr [rsi + 0xe0]
0x140146749: mov rcx, qword ptr [rsi + 0xe8]
0x140146750: movabs rdx, 0x34a70490425f403
0x14014675a: xor r8d, r8d
0x14014675d: movdqa xmm0, xmmword ptr [rip + 0x607ca0b]
0x140146765: pcmpeqd xmm1, xmm1
0x140146769: movdqa xmm2, xmmword ptr [rip + 0x607ca0f]
0x140146771: and rdx, rcx
0x140146774: movdqu xmm3, xmmword ptr [rax + rdx]
0x140146779: movdqa xmm4, xmm3
0x14014677d: pcmpeqb xmm4, xmm0
0x140146781: pmovmskb r11d, xmm4
0x140146786: test r11d, r11d
0x140146789: je 0x1401467d0
0x14014678b: tzcnt r10d, r11d
0x140146790: add r10, rdx
0x140146793: and r10, rcx
0x140146796: mov r14, r10
0x140146799: shl r14, 7
0x14014679d: mov r9, rax
0x1401467a0: sub r9, r14
0x1401467a3: movdqu xmm4, xmmword ptr [r9 - 0x80]
0x1401467a9: pcmpeqb xmm4, xmm2
0x1401467ad: pmovmskb r14d, xmm4
0x1401467b2: cmp r14d, 0xffff
0x1401467b9: je 0x14014680c
0x1401467bb: lea r9d, [r11 - 1]
0x1401467bf: and r9w, r11w
0x1401467c3: mov r11d, r9d
0x1401467c6: jne 0x14014678b
0x1401467c8: nop dword ptr [rax + rax]
0x1401467d0: pcmpeqb xmm3, xmm1
0x1401467d4: pmovmskb r9d, xmm3
0x1401467d9: test r9d, r9d
0x1401467dc: jne 0x14014687f
0x1401467e2: add rdx, r8
0x1401467e5: add rdx, 0x10
0x1401467e9: add r8, 0x10
0x1401467ed: jmp 0x140146771
0x1401467ef: lea rax, [rax + r10*8]
0x1401467f3: mov r14, qword ptr [rax - 8]
0x1401467f7: mov rdx, qword ptr [rbp + 0x510]
0x1401467fe: test rdx, rdx
0x140146801: jne 0x14014691d
0x140146807: jmp 0x140146933
0x14014680c: lea rdx, [r10 - 0x10]
0x140146810: and rdx, rcx
0x140146813: movdqu xmm0, xmmword ptr [rax + rdx]
0x140146818: pcmpeqd xmm1, xmm1
0x14014681c: pcmpeqb xmm0, xmm1
0x140146820: pmovmskb ecx, xmm0
0x140146824: movdqu xmm0, xmmword ptr [rax + r10]
0x14014682a: pcmpeqb xmm0, xmm1
0x14014682e: pmovmskb r8d, xmm0
0x140146833: mov r11w, 0x1f
0x140146838: bsr r11w, cx
0x14014683d: xor r11d, 0xf
0x140146841: or r8d, 0x10000
0x140146848: tzcnt r8d, r8d
0x14014684d: add r8d, r11d
0x140146850: mov cl, 0x80
0x140146852: cmp r8w, 0xf
0x140146857: ja 0x140146862
0x140146859: inc qword ptr [rsi + 0xf0]
0x140146860: mov cl, 0xff
0x140146862: mov byte ptr [rax + r10], cl
0x140146866: mov byte ptr [rax + rdx + 0x10], cl
0x14014686a: dec qword ptr [rsi + 0xf8]
0x140146871: mov rax, qword ptr [r9 - 0x70]
0x140146875: cmp rax, 2
0x140146879: jne 0x140147260
0x14014687f: mov r14, qword ptr [r15]
0x140146882: lea rax, [r14 + 1]
0x140146886: mov qword ptr [r15], rax
0x140146889: mov word ptr [rbp + 0x300], 0x100
0x140146892: mov qword ptr [rbp + 0x2b0], 1
0x14014689d: movdqu xmm0, xmmword ptr [rip + 0x607d283]
0x1401468a5: movdqu xmmword ptr [rbp + 0x2b8], xmm0
0x1401468ad: mov qword ptr [rbp + 0x2d8], 8
0x1401468b8: mov qword ptr [rbp + 0x2e0], 0x18
0x1401468c3: lea rax, [rip + 0xc7d76]
0x1401468ca: mov qword ptr [rbp + 0x2f8], rax
0x1401468d1: mov byte ptr [rbp + 0x302], 1
0x1401468d8: mov qword ptr [rbp + 0x2c8], 0
0x1401468e3: mov byte ptr [rbp + 0x2e8], 2
0x1401468ea: lea r8, [rbp + 0x2b0]
0x1401468f1: mov rcx, rdi
0x1401468f4: mov rdx, r14
0x1401468f7: call 0x140019880
0x1401468fc: nop 
0x1401468fd: lea rcx, [rsi + 0x78]
0x140146901: lea rdx, [rip + 0x607d220]
0x140146908: mov r8, r14
0x14014690b: call 0x1400196d0
0x140146910: nop 
0x140146911: mov rdx, qword ptr [rbp + 0x510]
0x140146918: test rdx, rdx
0x14014691b: je 0x140146933
0x14014691d: mov rcx, qword ptr [rbp + 0x518]
0x140146924: shl rdx, 3
0x140146928: mov r8d, 8
0x14014692e: call 0x1400021d0
0x140146933: cmp r14, qword ptr [rsi + 0x218]
0x14014693a: jae 0x140146965
0x14014693c: mov rax, qword ptr [rsi + 0x210]
0x140146943: mov rax, qword ptr [rax + r14*8]
0x140146947: test rax, rax
0x14014694a: je 0x140146965
0x14014694c: mov rcx, qword ptr [rsi + 0x1e0]
0x140146953: not rax
0x140146956: imul rax, rax, 0x38
0x14014695a: cmp byte ptr [rcx + rax + 0x30], 0
0x14014695f: jne 0x1401469ed
0x140146965: mov qword ptr [rbp + 0x2b0], 0
0x140146970: mov qword ptr [rbp + 0x2b8], 8
0x14014697b: mov qword ptr [rbp + 0x2c0], 0
0x140146986: mov r15d, dword ptr [rsi + 0x5b0]
0x14014698d: mov rcx, rsi
0x140146990: call 0x145048d50
0x140146995: mov qword ptr [rbp + 0x510], r14
0x14014699c: lea r9, [rbp + 0x510]
0x1401469a3: mov rcx, rbx
0x1401469a6: mov rdx, r14
0x1401469a9: mov r8, rdi
0x1401469ac: call 0x140136360
0x1401469b1: mov rdi, rax
0x1401469b4: cmp byte ptr [rax + 0x30], 1
0x1401469b8: jne 0x1401469cd
0x1401469ba: lea r8, [rbp + 0x2b0]
0x1401469c1: mov rcx, rdi
0x1401469c4: xor edx, edx
0x1401469c6: call 0x145058360
0x1401469cb: jmp 0x1401469e9
0x1401469cd: mov r8, qword ptr [rdi + 8]
0x1401469d1: mov rcx, qword ptr [rdi + 0x10]
0x1401469d5: lea rdx, [rbp + 0x2b0]
0x1401469dc: call 0x146005057
0x1401469e1: mov dword ptr [rdi + 0x28], r15d
0x1401469e5: mov byte ptr [rdi + 0x30], 1
0x1401469e9: mov dword ptr [rdi + 0x2c], r15d
0x1401469ed: call 0x140002200
0x1401469f2: mov ecx, 0x3f0
0x1401469f7: mov edx, 8
0x1401469fc: call 0x1400021c0
0x140146a01: test rax, rax
0x140146a04: je 0x1401472ee
0x140146a0a: mov qword ptr [rbp + 0x508], rax
0x140146a11: call 0x140002200
0x140146a16: mov ecx, 0x38
0x140146a1b: mov edx, 8
0x140146a20: call 0x1400021c0
0x140146a25: test rax, rax
0x140146a28: je 0x1401472ff
0x140146a2e: mov qword ptr [rax], 0
0x140146a35: mov dword ptr [rax + 0x30], 0
0x140146a3c: mov byte ptr [rax + 0x34], 0
0x140146a40: lea r8, [rip + 0x607f741]
0x140146a47: lea rcx, [rbp + 0x240]
0x140146a4e: mov rdx, rax
0x140146a51: call 0x144ffda50
0x140146a56: nop 
0x140146a57: mov qword ptr [rbp + 0x2b0], 0xffffffffffffffff
0x140146a62: mov dword ptr [rbp + 0x418], 0
0x140146a6c: mov byte ptr [rbp + 0x41c], 0
0x140146a73: call 0x140002200
0x140146a78: mov ecx, 0x170
0x140146a7d: mov edx, 8
0x140146a82: call 0x1400021c0
0x140146a87: test rax, rax
0x140146a8a: je 0x140147314
0x140146a90: mov rdi, rax
0x140146a93: lea rdx, [rbp + 0x2b0]
0x140146a9a: mov r8d, 0x170
0x140146aa0: mov rcx, rax
0x140146aa3: call 0x14600504b
0x140146aa8: nop 
0x140146aa9: lea r8, [rip + 0x607f4e0]
0x140146ab0: lea rcx, [rbp + 0x1d0]
0x140146ab7: mov rdx, rdi
0x140146aba: call 0x144ffda50
0x140146abf: nop 
0x140146ac0: mov qword ptr [rbp + 0x2b0], 0xffffffffffffffff
0x140146acb: mov dword ptr [rbp + 0x478], 0
0x140146ad5: mov byte ptr [rbp + 0x47c], 0
0x140146adc: call 0x140002200
0x140146ae1: mov ecx, 0x1d0
0x140146ae6: mov edx, 8
0x140146aeb: call 0x1400021c0
0x140146af0: test rax, rax
0x140146af3: je 0x140147326
0x140146af9: mov rdi, rax
0x140146afc: lea rdx, [rbp + 0x2b0]
0x140146b03: mov r8d, 0x1d0
0x140146b09: mov rcx, rax
0x140146b0c: call 0x14600504b
0x140146b11: nop 
0x140146b12: lea r8, [rip + 0x607f867]
0x140146b19: lea rcx, [rbp + 0x160]
0x140146b20: mov rdx, rdi
0x140146b23: call 0x144ffda50
0x140146b28: nop 
0x140146b29: call 0x140002200
0x140146b2e: mov ecx, 0x160
0x140146b33: mov edx, 8
0x140146b38: call 0x1400021c0
0x140146b3d: test rax, rax
0x140146b40: je 0x140147338
0x140146b46: mov dword ptr [rax], 0
0x140146b4c: mov byte ptr [rax + 4], 0
0x140146b50: mov qword ptr [rax + 0x100], 0xffffffffffffffff
0x140146b5b: lea r8, [rip + 0x607f57e]
0x140146b62: lea rcx, [rbp + 0xf0]
0x140146b69: mov rdx, rax
0x140146b6c: call 0x144ffda50
0x140146b71: nop 
0x140146b72: call 0x140002200
0x140146b77: mov ecx, 0x40
0x140146b7c: mov edx, 8
0x140146b81: call 0x1400021c0
0x140146b86: test rax, rax
0x140146b89: je 0x14014734a
0x140146b8f: mov qword ptr [rax], 0
0x140146b96: mov dword ptr [rax + 0x38], 0
0x140146b9d: mov byte ptr [rax + 0x3c], 0
0x140146ba1: lea r8, [rip + 0x607f730]
0x140146ba8: lea rcx, [rbp + 0x80]
0x140146baf: mov rdx, rax
0x140146bb2: call 0x144ffda50
0x140146bb7: nop 
0x140146bb8: call 0x140002200
0x140146bbd: mov ecx, 0x30
0x140146bc2: mov edx, 8
0x140146bc7: call 0x1400021c0
0x140146bcc: test rax, rax
0x140146bcf: je 0x14014735c
0x140146bd5: mov qword ptr [rax], 0
0x140146bdc: mov dword ptr [rax + 0x28], 0
0x140146be3: mov byte ptr [rax + 0x2c], 0
0x140146be7: lea r8, [rip + 0x607f642]
0x140146bee: lea rcx, [rbp + 0x10]
0x140146bf2: mov rdx, rax
0x140146bf5: call 0x144ffda50
0x140146bfa: nop 
0x140146bfb: mov qword ptr [rbp + 0x3b8], 0xffffffffffffffff
0x140146c06: mov dword ptr [rbp + 0x2b0], 0
0x140146c10: mov byte ptr [rbp + 0x2b4], 0
0x140146c17: call 0x140002200
0x140146c1c: mov ecx, 0x138
0x140146c21: mov edx, 8
0x140146c26: call 0x1400021c0
0x140146c2b: test rax, rax
0x140146c2e: je 0x14014736e
0x140146c34: mov rdi, rax
0x140146c37: lea rdx, [rbp + 0x2b0]
0x140146c3e: mov r8d, 0x138
0x140146c44: mov rcx, rax
0x140146c47: call 0x14600504b
0x140146c4c: nop 
0x140146c4d: lea r8, [rip + 0x607f3e4]
0x140146c54: lea rcx, [rbp - 0x60]
0x140146c58: mov rdx, rdi
0x140146c5b: call 0x144ffda50
0x140146c60: nop 
0x140146c61: mov qword ptr [rbp + 0x3b8], 0xffffffffffffffff
0x140146c6c: mov dword ptr [rbp + 0x2b0], 0
0x140146c76: mov byte ptr [rbp + 0x2b4], 0
0x140146c7d: call 0x140002200
0x140146c82: mov ecx, 0x138
0x140146c87: mov edx, 8
0x140146c8c: call 0x1400021c0
0x140146c91: test rax, rax
0x140146c94: je 0x140147380
0x140146c9a: mov rdi, rax
0x140146c9d: lea rdx, [rbp + 0x2b0]
0x140146ca4: mov r8d, 0x138
0x140146caa: mov rcx, rax
0x140146cad: call 0x14600504b
0x140146cb2: nop 
0x140146cb3: lea r8, [rip + 0x607f186]
0x140146cba: lea rcx, [rbp + 0x510]
0x140146cc1: mov rdx, rdi
0x140146cc4: call 0x144ffda50
0x140146cc9: nop 
0x140146cca: mov qword ptr [rbp + 0x3a0], 0xffffffffffffffff
0x140146cd5: mov dword ptr [rbp + 0x500], 0
0x140146cdf: mov byte ptr [rbp + 0x504], 0
0x140146ce6: call 0x140002200
0x140146ceb: mov ecx, 0x258
0x140146cf0: mov edx, 8
0x140146cf5: call 0x1400021c0
0x140146cfa: test rax, rax
0x140146cfd: je 0x140147392
0x140146d03: mov rdi, rax
0x140146d06: lea rdx, [rbp + 0x2b0]
0x140146d0d: mov r8d, 0x258
0x140146d13: mov rcx, rax
0x140146d16: call 0x14600504b
0x140146d1b: nop 
0x140146d1c: lea r8, [rip + 0x607f1c5]
0x140146d23: lea rcx, [rbp + 0x2b0]
0x140146d2a: mov rdx, rdi
0x140146d2d: call 0x144ffda50
0x140146d32: nop 
0x140146d33: movups xmm0, xmmword ptr [rbp + 0x2a0]
0x140146d3a: mov rax, qword ptr [rbp + 0x508]
0x140146d41: movups xmmword ptr [rax + 0x60], xmm0
0x140146d45: movups xmm0, xmmword ptr [rbp + 0x290]
0x140146d4c: movups xmmword ptr [rax + 0x50], xmm0
0x140146d50: movups xmm0, xmmword ptr [rbp + 0x280]
0x140146d57: movups xmmword ptr [rax + 0x40], xmm0
0x140146d5b: movups xmm0, xmmword ptr [rbp + 0x240]
0x140146d62: movups xmm1, xmmword ptr [rbp + 0x250]
0x140146d69: movups xmm2, xmmword ptr [rbp + 0x260]
0x140146d70: movups xmm3, xmmword ptr [rbp + 0x270]
0x140146d77: movups xmmword ptr [rax + 0x30], xmm3
0x140146d7b: movups xmmword ptr [rax + 0x20], xmm2
0x140146d7f: movups xmmword ptr [rax + 0x10], xmm1
0x140146d83: movups xmmword ptr [rax], xmm0
0x140146d86: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x140146d8d: movups xmm1, xmmword ptr [rbp + 0x1e0]
0x140146d94: movups xmm2, xmmword ptr [rbp + 0x1f0]
0x140146d9b: movups xmm3, xmmword ptr [rbp + 0x200]
0x140146da2: movups xmmword ptr [rax + 0x70], xmm0
0x140146da6: movups xmmword ptr [rax + 0x80], xmm1
0x140146dad: movups xmmword ptr [rax + 0x90], xmm2
0x140146db4: movups xmmword ptr [rax + 0xa0], xmm3
0x140146dbb: movups xmm0, xmmword ptr [rbp + 0x210]
0x140146dc2: movups xmmword ptr [rax + 0xb0], xmm0
0x140146dc9: movups xmm0, xmmword ptr [rbp + 0x220]
0x140146dd0: movups xmmword ptr [rax + 0xc0], xmm0
0x140146dd7: movups xmm0, xmmword ptr [rbp + 0x230]
0x140146dde: movups xmmword ptr [rax + 0xd0], xmm0
0x140146de5: movups xmm0, xmmword ptr [rbp + 0x1c0]
0x140146dec: movups xmmword ptr [rax + 0x140], xmm0
0x140146df3: movups xmm0, xmmword ptr [rbp + 0x1b0]
0x140146dfa: movups xmmword ptr [rax + 0x130], xmm0
0x140146e01: movups xmm0, xmmword ptr [rbp + 0x1a0]
0x140146e08: movups xmmword ptr [rax + 0x120], xmm0
0x140146e0f: movups xmm0, xmmword ptr [rbp + 0x160]
0x140146e16: movups xmm1, xmmword ptr [rbp + 0x170]
0x140146e1d: movups xmm2, xmmword ptr [rbp + 0x180]
0x140146e24: movups xmm3, xmmword ptr [rbp + 0x190]
0x140146e2b: movups xmmword ptr [rax + 0x110], xmm3
0x140146e32: movups xmmword ptr [rax + 0x100], xmm2
0x140146e39: movups xmmword ptr [rax + 0xf0], xmm1
0x140146e40: movups xmmword ptr [rax + 0xe0], xmm0
0x140146e47: movups xmm0, xmmword ptr [rbp + 0xf0]
0x140146e4e: movups xmm1, xmmword ptr [rbp + 0x100]
0x140146e55: movups xmm2, xmmword ptr [rbp + 0x110]
0x140146e5c: movups xmm3, xmmword ptr [rbp + 0x120]
0x140146e63: movups xmmword ptr [rax + 0x150], xmm0
0x140146e6a: movups xmmword ptr [rax + 0x160], xmm1
0x140146e71: movups xmmword ptr [rax + 0x170], xmm2
0x140146e78: movups xmmword ptr [rax + 0x180], xmm3
0x140146e7f: movups xmm0, xmmword ptr [rbp + 0x130]
0x140146e86: movups xmmword ptr [rax + 0x190], xmm0
0x140146e8d: movups xmm0, xmmword ptr [rbp + 0x140]
0x140146e94: movups xmmword ptr [rax + 0x1a0], xmm0
0x140146e9b: movups xmm0, xmmword ptr [rbp + 0x150]
0x140146ea2: movups xmmword ptr [rax + 0x1b0], xmm0
0x140146ea9: movups xmm0, xmmword ptr [rbp + 0x80]
0x140146eb0: movups xmm1, xmmword ptr [rbp + 0x90]
0x140146eb7: movups xmm2, xmmword ptr [rbp + 0xa0]
0x140146ebe: movups xmm3, xmmword ptr [rbp + 0xb0]
0x140146ec5: movups xmmword ptr [rax + 0x1c0], xmm0
0x140146ecc: movups xmmword ptr [rax + 0x1d0], xmm1
0x140146ed3: movups xmmword ptr [rax + 0x1e0], xmm2
0x140146eda: movups xmmword ptr [rax + 0x1f0], xmm3
0x140146ee1: movups xmm0, xmmword ptr [rbp + 0xc0]
0x140146ee8: movups xmmword ptr [rax + 0x200], xmm0
0x140146eef: movups xmm0, xmmword ptr [rbp + 0xe0]
0x140146ef6: movups xmmword ptr [rax + 0x220], xmm0
0x140146efd: movups xmm0, xmmword ptr [rbp + 0xd0]
0x140146f04: movups xmmword ptr [rax + 0x210], xmm0
0x140146f0b: movups xmm0, xmmword ptr [rbp + 0x70]
0x140146f0f: movups xmmword ptr [rax + 0x290], xmm0
0x140146f16: movups xmm0, xmmword ptr [rbp + 0x60]
0x140146f1a: movups xmmword ptr [rax + 0x280], xmm0
0x140146f21: movups xmm0, xmmword ptr [rbp + 0x50]
0x140146f25: movups xmmword ptr [rax + 0x270], xmm0
0x140146f2c: movups xmm0, xmmword ptr [rbp + 0x10]
0x140146f30: movups xmm1, xmmword ptr [rbp + 0x20]
0x140146f34: movups xmm2, xmmword ptr [rbp + 0x30]
0x140146f38: movups xmm3, xmmword ptr [rbp + 0x40]
0x140146f3c: movups xmmword ptr [rax + 0x260], xmm3
0x140146f43: movups xmmword ptr [rax + 0x250], xmm2
0x140146f4a: movups xmmword ptr [rax + 0x240], xmm1
0x140146f51: movups xmmword ptr [rax + 0x230], xmm0
0x140146f58: movups xmm0, xmmword ptr [rbp - 0x60]
0x140146f5c: movups xmm1, xmmword ptr [rbp - 0x50]
0x140146f60: movups xmm2, xmmword ptr [rbp - 0x40]
0x140146f64: movups xmm3, xmmword ptr [rbp - 0x30]
0x140146f68: movups xmmword ptr [rax + 0x2a0], xmm0
0x140146f6f: movups xmmword ptr [rax + 0x2b0], xmm1
0x140146f76: movups xmmword ptr [rax + 0x2c0], xmm2
0x140146f7d: movups xmmword ptr [rax + 0x2d0], xmm3
0x140146f84: movups xmm0, xmmword ptr [rbp - 0x20]
0x140146f88: movups xmmword ptr [rax + 0x2e0], xmm0
0x140146f8f: movups xmm0, xmmword ptr [rbp - 0x10]
0x140146f93: movups xmmword ptr [rax + 0x2f0], xmm0
0x140146f9a: movups xmm0, xmmword ptr [rbp]
0x140146f9e: movups xmmword ptr [rax + 0x300], xmm0
0x140146fa5: movups xmm0, xmmword ptr [rbp + 0x510]
0x140146fac: movups xmm1, xmmword ptr [rbp + 0x520]
0x140146fb3: movups xmm2, xmmword ptr [rbp + 0x530]
0x140146fba: movups xmm3, xmmword ptr [rbp + 0x540]
0x140146fc1: movups xmmword ptr [rax + 0x310], xmm0
0x140146fc8: movups xmmword ptr [rax + 0x320], xmm1
0x140146fcf: movups xmmword ptr [rax + 0x330], xmm2
0x140146fd6: movups xmmword ptr [rax + 0x340], xmm3
0x140146fdd: movups xmm0, xmmword ptr [rbp + 0x550]
0x140146fe4: movups xmmword ptr [rax + 0x350], xmm0
0x140146feb: movups xmm0, xmmword ptr [rbp + 0x560]
0x140146ff2: movups xmmword ptr [rax + 0x360], xmm0
0x140146ff9: movups xmm0, xmmword ptr [rbp + 0x570]
0x140147000: movups xmmword ptr [rax + 0x370], xmm0
0x140147007: movups xmm0, xmmword ptr [rbp + 0x2b0]
0x14014700e: movups xmm1, xmmword ptr [rbp + 0x2c0]
0x140147015: movups xmm2, xmmword ptr [rbp + 0x2d0]
0x14014701c: movups xmm3, xmmword ptr [rbp + 0x2e0]
0x140147023: movups xmmword ptr [rax + 0x380], xmm0
0x14014702a: movups xmmword ptr [rax + 0x390], xmm1
0x140147031: movups xmmword ptr [rax + 0x3a0], xmm2
0x140147038: movups xmmword ptr [rax + 0x3b0], xmm3
0x14014703f: movups xmm0, xmmword ptr [rbp + 0x2f0]
0x140147046: movups xmmword ptr [rax + 0x3c0], xmm0
0x14014704d: movups xmm0, xmmword ptr [rbp + 0x300]
0x140147054: movups xmmword ptr [rax + 0x3d0], xmm0
0x14014705b: movups xmm0, xmmword ptr [rbp + 0x310]
0x140147062: movups xmmword ptr [rax + 0x3e0], xmm0
0x140147069: mov qword ptr [rbp + 0x2b8], 9
0x140147074: mov qword ptr [rbp + 0x2c0], rax
0x14014707b: mov qword ptr [rbp + 0x2c8], 9
0x140147086: mov qword ptr [rbp + 0x2d0], 0
0x140147091: mov qword ptr [rbp + 0x2d8], 8
0x14014709c: xorps xmm0, xmm0
0x14014709f: movups xmmword ptr [rbp + 0x2e0], xmm0
0x1401470a6: mov qword ptr [rbp + 0x2b0], 0xffffffffffffffff
0x1401470b1: lea rcx, [rbp + 0x2e8]
0x1401470b8: call 0x145070ba0
0x1401470bd: nop 
0x1401470be: movups xmm0, xmmword ptr [rbp + 0x310]
0x1401470c5: movaps xmmword ptr [rbp + 0x570], xmm0
0x1401470cc: movups xmm0, xmmword ptr [rbp + 0x300]
0x1401470d3: movaps xmmword ptr [rbp + 0x560], xmm0
0x1401470da: movups xmm0, xmmword ptr [rbp + 0x2f0]
0x1401470e1: movaps xmmword ptr [rbp + 0x550], xmm0
0x1401470e8: movups xmm0, xmmword ptr [rbp + 0x2b0]
0x1401470ef: movups xmm1, xmmword ptr [rbp + 0x2c0]
0x1401470f6: movups xmm2, xmmword ptr [rbp + 0x2d0]
0x1401470fd: movups xmm3, xmmword ptr [rbp + 0x2e0]
0x140147104: movaps xmmword ptr [rbp + 0x540], xmm3
0x14014710b: movaps xmmword ptr [rbp + 0x530], xmm2
0x140147112: movaps xmmword ptr [rbp + 0x520], xmm1
0x140147119: movaps xmmword ptr [rbp + 0x510], xmm0
0x140147120: mov rcx, qword ptr [rip + 0x849a629]
0x140147127: lea r8, [rip + 0x608fd5a]
0x14014712e: lea rdx, [rbp + 0x587]
0x140147135: call 0x140143230
0x14014713a: nop 
0x14014713b: mov r8, rdx
0x14014713e: lea rcx, [rbp + 0x510]
0x140147145: mov rdx, rax
0x140147148: call 0x140316f40
0x14014714d: nop 
0x14014714e: movaps xmm0, xmmword ptr [rbp + 0x570]
0x140147155: movaps xmmword ptr [rbp + 0x310], xmm0
0x14014715c: movaps xmm0, xmmword ptr [rbp + 0x560]
0x140147163: movaps xmmword ptr [rbp + 0x300], xmm0
0x14014716a: movaps xmm0, xmmword ptr [rbp + 0x550]
0x140147171: movaps xmmword ptr [rbp + 0x2f0], xmm0
0x140147178: movaps xmm0, xmmword ptr [rbp + 0x510]
0x14014717f: movaps xmm1, xmmword ptr [rbp + 0x520]
0x140147186: movaps xmm2, xmmword ptr [rbp + 0x530]
0x14014718d: movaps xmm3, xmmword ptr [rbp + 0x540]
0x140147194: movaps xmmword ptr [rbp + 0x2e0], xmm3
0x14014719b: movaps xmmword ptr [rbp + 0x2d0], xmm2
0x1401471a2: movaps xmmword ptr [rbp + 0x2c0], xmm1
0x1401471a9: movaps xmmword ptr [rbp + 0x2b0], xmm0
0x1401471b0: lea rdx, [rbp + 0x2b0]
0x1401471b7: mov rcx, rsi
0x1401471ba: call 0x1400b5ea0
0x1401471bf: nop 
0x1401471c0: add rsp, 0x610
0x1401471c7: pop rbx
0x1401471c8: pop rdi
0x1401471c9: pop rsi
0x1401471ca: pop r12
0x1401471cc: pop r14
0x1401471ce: pop r15
0x1401471d0: pop rbp
0x1401471d1: ret 
0x1401471d2: mov rcx, qword ptr [r9 - 8]
0x1401471d6: mov qword ptr [rbp + 0x318], rcx
0x1401471dd: movups xmm0, xmmword ptr [r9 - 0x18]
0x1401471e2: movups xmmword ptr [rbp + 0x308], xmm0
0x1401471e9: movups xmm0, xmmword ptr [r9 - 0x28]
0x1401471ee: movups xmmword ptr [rbp + 0x2f8], xmm0
0x1401471f5: movdqu xmm0, xmmword ptr [r9 - 0x68]
0x1401471fb: movdqu xmm1, xmmword ptr [r9 - 0x58]
0x140147201: movdqu xmm2, xmmword ptr [r9 - 0x48]
0x140147207: movdqu xmm3, xmmword ptr [r9 - 0x38]
0x14014720d: movdqu xmmword ptr [rbp + 0x2e8], xmm3
0x140147215: movdqu xmmword ptr [rbp + 0x2d8], xmm2
0x14014721d: movdqu xmmword ptr [rbp + 0x2c8], xmm1
0x140147225: movdqu xmmword ptr [rbp + 0x2b8], xmm0
0x14014722d: mov qword ptr [rbp + 0x2b0], rax
0x140147234: lea rcx, [rbp + 0x2b0]
0x14014723b: lea rdx, [rbp + 0x510]
0x140147242: call 0x144fe6d40
0x140147247: nop 
0x140147248: mov r14, rax
0x14014724b: mov rdx, qword ptr [rbp + 0x510]
0x140147252: test rdx, rdx
0x140147255: jne 0x14014646d
0x14014725b: jmp 0x140146483
0x140147260: mov rcx, qword ptr [r9 - 8]
0x140147264: mov qword ptr [rbp + 0x318], rcx
0x14014726b: movups xmm0, xmmword ptr [r9 - 0x18]
0x140147270: movups xmmword ptr [rbp + 0x308], xmm0
0x140147277: movups xmm0, xmmword ptr [r9 - 0x28]
0x14014727c: movups xmmword ptr [rbp + 0x2f8], xmm0
0x140147283: movdqu xmm0, xmmword ptr [r9 - 0x68]
0x140147289: movdqu xmm1, xmmword ptr [r9 - 0x58]
0x14014728f: movdqu xmm2, xmmword ptr [r9 - 0x48]
0x140147295: movdqu xmm3, xmmword ptr [r9 - 0x38]
0x14014729b: movdqu xmmword ptr [rbp + 0x2e8], xmm3
0x1401472a3: movdqu xmmword ptr [rbp + 0x2d8], xmm2
0x1401472ab: movdqu xmmword ptr [rbp + 0x2c8], xmm1
0x1401472b3: movdqu xmmword ptr [rbp + 0x2b8], xmm0
0x1401472bb: mov qword ptr [rbp + 0x2b0], rax
0x1401472c2: lea rcx, [rbp + 0x2b0]
0x1401472c9: lea rdx, [rbp + 0x510]
0x1401472d0: call 0x144fe6d40
0x1401472d5: nop 
0x1401472d6: mov r14, rax
0x1401472d9: mov rdx, qword ptr [rbp + 0x510]
0x1401472e0: test rdx, rdx
0x1401472e3: jne 0x14014691d
0x1401472e9: jmp 0x140146933
0x1401472ee: mov ecx, 8
0x1401472f3: mov edx, 0x3f0
0x1401472f8: call 0x1461add41
0x1401472fd: ud2 
0x1401472ff: mov ecx, 8
0x140147304: mov edx, 0x38
0x140147309: call 0x1461add41
0x14014730e: nop 
0x14014730f: jmp 0x1401473a2
0x140147314: mov ecx, 8
0x140147319: mov edx, 0x170
0x14014731e: call 0x1461add41
0x140147323: nop 
0x140147324: jmp 0x1401473a2
0x140147326: mov ecx, 8
0x14014732b: mov edx, 0x1d0
0x140147330: call 0x1461add41
0x140147335: nop 
0x140147336: jmp 0x1401473a2
0x140147338: mov ecx, 8
0x14014733d: mov edx, 0x160
0x140147342: call 0x1461add41
0x140147347: nop 
0x140147348: jmp 0x1401473a2
0x14014734a: mov ecx, 8
0x14014734f: mov edx, 0x40
0x140147354: call 0x1461add41
0x140147359: nop 
0x14014735a: jmp 0x1401473a2
0x14014735c: mov ecx, 8
0x140147361: mov edx, 0x30
0x140147366: call 0x1461add41
0x14014736b: nop 
0x14014736c: jmp 0x1401473a2
0x14014736e: mov ecx, 8
0x140147373: mov edx, 0x138
0x140147378: call 0x1461add41
0x14014737d: nop 
0x14014737e: jmp 0x1401473a2
0x140147380: mov ecx, 8
0x140147385: mov edx, 0x138
0x14014738a: call 0x1461add41
0x14014738f: nop 
0x140147390: jmp 0x1401473a2
0x140147392: mov ecx, 8
0x140147397: mov edx, 0x258
0x14014739c: call 0x1461add41
0x1401473a1: nop 
0x1401473a2: ud2 

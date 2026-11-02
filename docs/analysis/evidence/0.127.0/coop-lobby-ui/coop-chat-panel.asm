0x1402bd230: push rbp
0x1402bd231: push r15
0x1402bd233: push r14
0x1402bd235: push r13
0x1402bd237: push r12
0x1402bd239: push rsi
0x1402bd23a: push rdi
0x1402bd23b: push rbx
0x1402bd23c: sub rsp, 0x398
0x1402bd243: lea rbp, [rsp + 0x80]
0x1402bd24b: mov qword ptr [rbp + 0x310], 0xfffffffffffffffe
0x1402bd256: mov rbx, r8
0x1402bd259: mov rdi, rcx
0x1402bd25c: mov r14, qword ptr [r8 + 0x30]
0x1402bd260: mov r15, qword ptr [r8 + 0x38]
0x1402bd264: cmp r15, 7
0x1402bd268: jb 0x1402bd27f
0x1402bd26a: mov eax, 0x6b636f6c
0x1402bd26f: xor eax, dword ptr [r14]
0x1402bd272: mov ecx, 0x3a64656b
0x1402bd277: xor ecx, dword ptr [r14 + 3]
0x1402bd27b: or ecx, eax
0x1402bd27d: je 0x1402bd2db
0x1402bd27f: lea rax, [r15 - 0xd]
0x1402bd283: cmp rax, 0x23
0x1402bd287: ja 0x1402bd61e
0x1402bd28d: lea rcx, [rip + 0x5fbd66c]
0x1402bd294: movsxd rax, dword ptr [rcx + rax*4]
0x1402bd298: add rax, rcx
0x1402bd29b: jmp rax
0x1402bd29d: movabs rax, 0x74736f6820656874
0x1402bd2a7: xor rax, qword ptr [r14]
0x1402bd2aa: movabs rcx, 0x7466656c2074736f
0x1402bd2b4: xor rcx, qword ptr [r14 + 5]
0x1402bd2b8: or rcx, rax
0x1402bd2bb: mov r15d, 0xd
0x1402bd2c1: jne 0x1402bd83f
0x1402bd2c7: mov rsi, rdx
0x1402bd2ca: lea rcx, [rip + 0x5fbb882]
0x1402bd2d1: mov edx, 0xd
0x1402bd2d6: jmp 0x1402bd8bb
0x1402bd2db: mov qword ptr [rbp + 0x300], rdx
0x1402bd2e2: lea r13, [r15 - 7]
0x1402bd2e6: lea r12, [r14 + 7]
0x1402bd2ea: xor esi, esi
0x1402bd2ec: jmp 0x1402bd2fc
0x1402bd2ee: nop 
0x1402bd2f0: mov rsi, rax
0x1402bd2f3: cmp r13, rax
0x1402bd2f6: jb 0x1402bd988
0x1402bd2fc: mov r8, r13
0x1402bd2ff: sub r8, rsi
0x1402bd302: lea rdx, [r12 + rsi]
0x1402bd306: cmp r8, 0x10
0x1402bd30a: jae 0x1402bd340
0x1402bd30c: xor ecx, ecx
0x1402bd30e: test r8, r8
0x1402bd311: je 0x1402bd331
0x1402bd313: nop word ptr cs:[rax + rax]
0x1402bd320: cmp byte ptr [rdx + rcx], 0x3a
0x1402bd324: je 0x1402bd355
0x1402bd326: inc rcx
0x1402bd329: cmp r8, rcx
0x1402bd32c: jne 0x1402bd320
0x1402bd32e: mov rcx, r8
0x1402bd331: xor eax, eax
0x1402bd333: cmp rax, 1
0x1402bd337: je 0x1402bd370
0x1402bd339: jmp 0x1402bd988
0x1402bd33e: nop 
0x1402bd340: mov cl, 0x3a
0x1402bd342: call 0x14603cea0
0x1402bd347: mov rcx, rdx
0x1402bd34a: cmp rax, 1
0x1402bd34e: je 0x1402bd370
0x1402bd350: jmp 0x1402bd988
0x1402bd355: mov eax, 1
0x1402bd35a: cmp rax, 1
0x1402bd35e: jne 0x1402bd988
0x1402bd364: nop word ptr cs:[rax + rax]
0x1402bd370: lea rax, [rcx + rsi]
0x1402bd374: inc rax
0x1402bd377: lea rdx, [rcx + rsi]
0x1402bd37b: cmp rdx, r13
0x1402bd37e: jae 0x1402bd2f0
0x1402bd384: cmp byte ptr [r12 + rdx], 0x3a
0x1402bd389: jne 0x1402bd2f0
0x1402bd38f: sub r13, rax
0x1402bd392: je 0x1402bd985
0x1402bd398: add rax, r12
0x1402bd39b: cmp r13, 1
0x1402bd39f: jne 0x1402bd8df
0x1402bd3a5: movzx r8d, byte ptr [rax]
0x1402bd3a9: cmp r8d, 0x2b
0x1402bd3ad: je 0x1402bd985
0x1402bd3b3: cmp r8d, 0x2d
0x1402bd3b7: je 0x1402bd985
0x1402bd3bd: jmp 0x1402bd8e3
0x1402bd3c2: mov rsi, rdx
0x1402bd3c5: lea rdx, [rip + 0x5fbb7fb]
0x1402bd3cc: mov r15d, 0x21
0x1402bd3d2: mov r8d, 0x21
0x1402bd3d8: mov rcx, r14
0x1402bd3db: call 0x146061721
0x1402bd3e0: mov rdx, rsi
0x1402bd3e3: test eax, eax
0x1402bd3e5: jne 0x1402bd83f
0x1402bd3eb: lea rcx, [rip + 0x5fbb7d5]
0x1402bd3f2: mov edx, 0x21
0x1402bd3f7: jmp 0x1402bd8bb
0x1402bd3fc: movdqu xmm0, xmmword ptr [r14]
0x1402bd401: movdqu xmm1, xmmword ptr [r14 + 0xd]
0x1402bd407: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba231]
0x1402bd40f: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba239]
0x1402bd417: pand xmm0, xmm1
0x1402bd41b: pmovmskb eax, xmm0
0x1402bd41f: cmp eax, 0xffff
0x1402bd424: je 0x1402bd88d
0x1402bd42a: movdqu xmm0, xmmword ptr [r14]
0x1402bd42f: movdqu xmm1, xmmword ptr [r14 + 0xd]
0x1402bd435: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba223]
0x1402bd43d: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba22b]
0x1402bd445: pand xmm0, xmm1
0x1402bd449: pmovmskb eax, xmm0
0x1402bd44d: mov r15d, 0x1d
0x1402bd453: cmp eax, 0xffff
0x1402bd458: jne 0x1402bd83f
0x1402bd45e: mov rsi, rdx
0x1402bd461: lea rcx, [rip + 0x5fbb69a]
0x1402bd468: mov edx, 0x1d
0x1402bd46d: jmp 0x1402bd8bb
0x1402bd472: movdqu xmm0, xmmword ptr [r14]
0x1402bd477: movzx eax, word ptr [r14 + 0x10]
0x1402bd47c: movd xmm1, eax
0x1402bd480: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba238]
0x1402bd488: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba240]
0x1402bd490: pand xmm1, xmm0
0x1402bd494: pmovmskb eax, xmm1
0x1402bd498: mov r15d, 0x12
0x1402bd49e: cmp eax, 0xffff
0x1402bd4a3: jne 0x1402bd83f
0x1402bd4a9: mov rsi, rdx
0x1402bd4ac: lea rcx, [rip + 0x5fbb5ca]
0x1402bd4b3: mov edx, 0x12
0x1402bd4b8: jmp 0x1402bd8bb
0x1402bd4bd: movdqu xmm0, xmmword ptr [r14]
0x1402bd4c2: movdqu xmm1, xmmword ptr [r14 + 0xf]
0x1402bd4c8: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba250]
0x1402bd4d0: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba258]
0x1402bd4d8: pand xmm0, xmm1
0x1402bd4dc: pmovmskb eax, xmm0
0x1402bd4e0: mov r15d, 0x1f
0x1402bd4e6: cmp eax, 0xffff
0x1402bd4eb: jne 0x1402bd83f
0x1402bd4f1: mov rsi, rdx
0x1402bd4f4: lea rcx, [rip + 0x5fbb500]
0x1402bd4fb: mov edx, 0x1f
0x1402bd500: jmp 0x1402bd8bb
0x1402bd505: movdqu xmm0, xmmword ptr [r14]
0x1402bd50a: movd xmm1, dword ptr [r14 + 0x10]
0x1402bd510: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba1c8]
0x1402bd518: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba1d0]
0x1402bd520: pand xmm0, xmm1
0x1402bd524: pmovmskb eax, xmm0
0x1402bd528: mov r15d, 0x14
0x1402bd52e: cmp eax, 0xffff
0x1402bd533: jne 0x1402bd83f
0x1402bd539: mov rsi, rdx
0x1402bd53c: lea rcx, [rip + 0x5fbb526]
0x1402bd543: mov edx, 0x14
0x1402bd548: jmp 0x1402bd8bb
0x1402bd54d: movdqu xmm0, xmmword ptr [r14]
0x1402bd552: movdqu xmm1, xmmword ptr [r14 + 0xe]
0x1402bd558: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba0a0]
0x1402bd560: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba0a8]
0x1402bd568: pand xmm0, xmm1
0x1402bd56c: pmovmskb eax, xmm0
0x1402bd570: mov r15d, 0x1e
0x1402bd576: cmp eax, 0xffff
0x1402bd57b: jne 0x1402bd83f
0x1402bd581: mov rsi, rdx
0x1402bd584: lea rcx, [rip + 0x5fbb594]
0x1402bd58b: mov edx, 0x1e
0x1402bd590: jmp 0x1402bd8bb
0x1402bd595: movdqu xmm0, xmmword ptr [r14]
0x1402bd59a: movzx eax, byte ptr [r14 + 0x10]
0x1402bd59f: movd xmm1, eax
0x1402bd5a3: pcmpeqb xmm0, xmmword ptr [rip + 0x5fba155]
0x1402bd5ab: pcmpeqb xmm1, xmmword ptr [rip + 0x5fba15d]
0x1402bd5b3: pand xmm1, xmm0
0x1402bd5b7: pmovmskb eax, xmm1
0x1402bd5bb: mov r15d, 0x11
0x1402bd5c1: cmp eax, 0xffff
0x1402bd5c6: jne 0x1402bd83f
0x1402bd5cc: mov rsi, rdx
0x1402bd5cf: lea rcx, [rip + 0x5fbb482]
0x1402bd5d6: mov edx, 0x11
0x1402bd5db: jmp 0x1402bd8bb
0x1402bd5e0: movabs rax, 0x617020676e6f7277
0x1402bd5ea: xor rax, qword ptr [r14]
0x1402bd5ed: movabs rcx, 0x64726f7773736170
0x1402bd5f7: xor rcx, qword ptr [r14 + 6]
0x1402bd5fb: or rcx, rax
0x1402bd5fe: mov r15d, 0xe
0x1402bd604: jne 0x1402bd83f
0x1402bd60a: mov rsi, rdx
0x1402bd60d: lea rcx, [rip + 0x5fbb436]
0x1402bd614: mov edx, 0xe
0x1402bd619: jmp 0x1402bd8bb
0x1402bd61e: mov rsi, rdx
0x1402bd621: jmp 0x1402bd8c6
0x1402bd626: movdqu xmm0, xmmword ptr [r14]
0x1402bd62b: pcmpeqb xmm0, xmmword ptr [rip + 0x5fb9f9d]
0x1402bd633: pmovmskb eax, xmm0
0x1402bd637: mov r15d, 0x10
0x1402bd63d: cmp eax, 0xffff
0x1402bd642: jne 0x1402bd83f
0x1402bd648: mov rsi, rdx
0x1402bd64b: lea rcx, [rip + 0x5fbb527]
0x1402bd652: mov edx, 0x10
0x1402bd657: jmp 0x1402bd8bb
0x1402bd65c: movdqu xmm0, xmmword ptr [r14]
0x1402bd661: movdqu xmm1, xmmword ptr [r14 + 6]
0x1402bd667: pcmpeqb xmm1, xmmword ptr [rip + 0x5fb9f71]
0x1402bd66f: pcmpeqb xmm0, xmmword ptr [rip + 0x5fb9f79]
0x1402bd677: pand xmm0, xmm1
0x1402bd67b: pmovmskb eax, xmm0
0x1402bd67f: mov r15d, 0x16
0x1402bd685: cmp eax, 0xffff
0x1402bd68a: jne 0x1402bd83f
0x1402bd690: mov rsi, rdx
0x1402bd693: lea rcx, [rip + 0x5fbb4a3]
0x1402bd69a: mov edx, 0x16
0x1402bd69f: jmp 0x1402bd8bb
0x1402bd6a4: movdqu xmm0, xmmword ptr [r14]
0x1402bd6a9: movdqu xmm1, xmmword ptr [r14 + 7]
0x1402bd6af: pcmpeqb xmm1, xmmword ptr [rip + 0x5fb9f69]
0x1402bd6b7: pcmpeqb xmm0, xmmword ptr [rip + 0x5fb9f71]
0x1402bd6bf: pand xmm0, xmm1
0x1402bd6c3: pmovmskb eax, xmm0
0x1402bd6c7: mov r15d, 0x17
0x1402bd6cd: cmp eax, 0xffff
0x1402bd6d2: jne 0x1402bd83f
0x1402bd6d8: mov rsi, rdx
0x1402bd6db: lea rcx, [rip + 0x5fbb409]
0x1402bd6e2: mov edx, 0x17
0x1402bd6e7: jmp 0x1402bd8bb
0x1402bd6ec: mov rsi, rdx
0x1402bd6ef: lea rdx, [rip + 0x5fbb4ae]
0x1402bd6f6: mov r15d, 0x23
0x1402bd6fc: mov r8d, 0x23
0x1402bd702: mov rcx, r14
0x1402bd705: call 0x146061721
0x1402bd70a: mov rdx, rsi
0x1402bd70d: test eax, eax
0x1402bd70f: jne 0x1402bd83f
0x1402bd715: lea rcx, [rip + 0x5fbb488]
0x1402bd71c: mov edx, 0x23
0x1402bd721: jmp 0x1402bd8bb
0x1402bd726: mov rsi, rdx
0x1402bd729: lea rdx, [rip + 0x5fbb35f]
0x1402bd730: mov r15d, 0x26
0x1402bd736: mov r8d, 0x26
0x1402bd73c: mov rcx, r14
0x1402bd73f: call 0x146061721
0x1402bd744: mov rdx, rsi
0x1402bd747: test eax, eax
0x1402bd749: jne 0x1402bd83f
0x1402bd74f: lea rcx, [rip + 0x5fbb339]
0x1402bd756: mov edx, 0x26
0x1402bd75b: jmp 0x1402bd8bb
0x1402bd760: movdqu xmm0, xmmword ptr [r14]
0x1402bd765: movdqu xmm1, xmmword ptr [r14 + 0xb]
0x1402bd76b: pcmpeqb xmm1, xmmword ptr [rip + 0x5fb9e3d]
0x1402bd773: pcmpeqb xmm0, xmmword ptr [rip + 0x5fb9e45]
0x1402bd77b: pand xmm0, xmm1
0x1402bd77f: pmovmskb eax, xmm0
0x1402bd783: mov r15d, 0x1b
0x1402bd789: cmp eax, 0xffff
0x1402bd78e: jne 0x1402bd83f
0x1402bd794: mov rsi, rdx
0x1402bd797: lea rcx, [rip + 0x5fbb3eb]
0x1402bd79e: mov edx, 0x1b
0x1402bd7a3: jmp 0x1402bd8bb
0x1402bd7a8: movdqu xmm0, xmmword ptr [r14]
0x1402bd7ad: movdqu xmm1, xmmword ptr [r14 + 9]
0x1402bd7b3: pcmpeqb xmm1, xmmword ptr [rip + 0x5fb9ec5]
0x1402bd7bb: pcmpeqb xmm0, xmmword ptr [rip + 0x5fb9ecd]
0x1402bd7c3: pand xmm0, xmm1
0x1402bd7c7: pmovmskb eax, xmm0
0x1402bd7cb: cmp eax, 0xffff
0x1402bd7d0: je 0x1402bd89e
0x1402bd7d6: movdqu xmm0, xmmword ptr [r14]
0x1402bd7db: movdqu xmm1, xmmword ptr [r14 + 9]
0x1402bd7e1: pcmpeqb xmm1, xmmword ptr [rip + 0x5fb9eb7]
0x1402bd7e9: pcmpeqb xmm0, xmmword ptr [rip + 0x5fb9ebf]
0x1402bd7f1: pand xmm0, xmm1
0x1402bd7f5: pmovmskb eax, xmm0
0x1402bd7f9: mov r15d, 0x19
0x1402bd7ff: cmp eax, 0xffff
0x1402bd804: jne 0x1402bd83f
0x1402bd806: mov rsi, rdx
0x1402bd809: lea rcx, [rip + 0x5fbb350]
0x1402bd810: mov edx, 0x19
0x1402bd815: jmp 0x1402bd8bb
0x1402bd81a: mov rsi, rdx
0x1402bd81d: lea rdx, [rip + 0x5fbb1f6]
0x1402bd824: mov r15d, 0x30
0x1402bd82a: mov r8d, 0x30
0x1402bd830: mov rcx, r14
0x1402bd833: call 0x146061721
0x1402bd838: mov rdx, rsi
0x1402bd83b: test eax, eax
0x1402bd83d: je 0x1402bd8af
0x1402bd83f: mov rsi, rdx
0x1402bd842: call 0x140002200
0x1402bd847: mov r13d, 1
0x1402bd84d: mov edx, 1
0x1402bd852: mov rcx, r15
0x1402bd855: call 0x1400021c0
0x1402bd85a: test rax, rax
0x1402bd85d: je 0x1402bd8d2
0x1402bd85f: mov r12, rax
0x1402bd862: mov rcx, rax
0x1402bd865: mov rdx, r14
0x1402bd868: mov r8, r15
0x1402bd86b: call 0x14606171b
0x1402bd870: mov qword ptr [rbp + 0x2b0], r15
0x1402bd877: mov qword ptr [rbp + 0x2b8], r12
0x1402bd87e: mov qword ptr [rbp + 0x2c0], r15
0x1402bd885: mov r13, rsi
0x1402bd888: jmp 0x1402bda18
0x1402bd88d: mov rsi, rdx
0x1402bd890: lea rcx, [rip + 0x5fbb237]
0x1402bd897: mov edx, 0x1d
0x1402bd89c: jmp 0x1402bd8bb
0x1402bd89e: mov rsi, rdx
0x1402bd8a1: lea rcx, [rip + 0x5fbb20d]
0x1402bd8a8: mov edx, 0x19
0x1402bd8ad: jmp 0x1402bd8bb
0x1402bd8af: lea rcx, [rip + 0x5fbb164]
0x1402bd8b6: mov edx, 0x30
0x1402bd8bb: call 0x145be8220
0x1402bd8c0: mov r14, rax
0x1402bd8c3: mov r15, rdx
0x1402bd8c6: test r15, r15
0x1402bd8c9: jns 0x1402be1a3
0x1402bd8cf: xor r13d, r13d
0x1402bd8d2: mov rcx, r13
0x1402bd8d5: mov rdx, r15
0x1402bd8d8: call 0x14620896b
0x1402bd8dd: ud2 
0x1402bd8df: movzx r8d, byte ptr [rax]
0x1402bd8e3: xor r9d, r9d
0x1402bd8e6: cmp r8b, 0x2b
0x1402bd8ea: sete r9b
0x1402bd8ee: sub r13, r9
0x1402bd8f1: cmp r13, 3
0x1402bd8f5: jae 0x1402bd93a
0x1402bd8f7: test r13, r13
0x1402bd8fa: je 0x1402be09d
0x1402bd900: movzx r14d, byte ptr [rax + r9]
0x1402bd905: add r14d, -0x30
0x1402bd909: cmp r14d, 9
0x1402bd90d: ja 0x1402bd985
0x1402bd90f: cmp r13, 1
0x1402bd913: je 0x1402be0a0
0x1402bd919: movzx eax, byte ptr [rax + r9 + 1]
0x1402bd91f: add eax, -0x30
0x1402bd922: cmp eax, 9
0x1402bd925: ja 0x1402bd985
0x1402bd927: movzx ecx, r14b
0x1402bd92b: add ecx, ecx
0x1402bd92d: lea ecx, [rcx + rcx*4]
0x1402bd930: add al, cl
0x1402bd932: mov r14d, eax
0x1402bd935: jmp 0x1402be0a0
0x1402bd93a: lea r8, [r9 + r14]
0x1402bd93e: add r8, 8
0x1402bd942: neg r9
0x1402bd945: add r9, r15
0x1402bd948: add r9, -8
0x1402bd94c: add rcx, rsi
0x1402bd94f: xor eax, eax
0x1402bd951: mov r10b, 0xa
0x1402bd954: mov r13, qword ptr [rbp + 0x300]
0x1402bd95b: cmp r9, rcx
0x1402bd95e: je 0x1402be199
0x1402bd964: mul r10b
0x1402bd967: jo 0x1402bd985
0x1402bd969: movzx esi, byte ptr [r8 + rcx]
0x1402bd96e: add esi, -0x30
0x1402bd971: add al, sil
0x1402bd974: setb r11b
0x1402bd978: cmp esi, 9
0x1402bd97b: ja 0x1402bd985
0x1402bd97d: inc rcx
0x1402bd980: test r11b, r11b
0x1402bd983: je 0x1402bd95b
0x1402bd985: mov r13, rdx
0x1402bd988: mov rcx, r12
0x1402bd98b: mov rdx, r13
0x1402bd98e: call 0x145b05430
0x1402bd993: mov rcx, rax
0x1402bd996: call 0x145af3890
0x1402bd99b: mov qword ptr [rbp + 0xf0], rax
0x1402bd9a2: mov qword ptr [rbp + 0xf8], rdx
0x1402bd9a9: lea rcx, [rip + 0x5fbb238]
0x1402bd9b0: mov edx, 0x2f
0x1402bd9b5: call 0x145be8220
0x1402bd9ba: mov r8, rdx
0x1402bd9bd: lea rcx, [rip + 0x5fbafdb]
0x1402bd9c4: mov qword ptr [rbp + 0x120], rcx
0x1402bd9cb: mov qword ptr [rbp + 0x128], 4
0x1402bd9d6: lea rcx, [rbp + 0xf0]
0x1402bd9dd: mov qword ptr [rbp + 0x130], rcx
0x1402bd9e4: lea rcx, [rip + 0x5fbb22d]
0x1402bd9eb: mov qword ptr [rbp + 0x138], rcx
0x1402bd9f2: mov qword ptr [rsp + 0x20], 1
0x1402bd9fb: lea rcx, [rbp + 0x2b0]
0x1402bda02: lea r9, [rbp + 0x120]
0x1402bda09: mov rdx, rax
0x1402bda0c: call 0x145be86b0
0x1402bda11: mov r13, qword ptr [rbp + 0x300]
0x1402bda18: mov rcx, qword ptr [rbx + 0x20]
0x1402bda1c: add rcx, -5
0x1402bda20: cmp rcx, 6
0x1402bda24: ja 0x1402bdbe4
0x1402bda2a: mov rax, qword ptr [rbx + 0x18]
0x1402bda2e: lea rdx, [rip + 0x5fbcf5b]
0x1402bda35: movsxd rcx, dword ptr [rdx + rcx*4]
0x1402bda39: add rcx, rdx
0x1402bda3c: jmp rcx
0x1402bda3e: mov ecx, 0x65646e65
0x1402bda43: xor ecx, dword ptr [rax]
0x1402bda45: movzx eax, byte ptr [rax + 4]
0x1402bda49: xor eax, 0x64
0x1402bda4c: or eax, ecx
0x1402bda4e: jne 0x1402bdbe4
0x1402bda54: jmp 0x1402bdb03
0x1402bda59: mov ecx, 0x75666572
0x1402bda5e: xor ecx, dword ptr [rax]
0x1402bda60: mov edx, 0x64657375
0x1402bda65: xor edx, dword ptr [rax + 3]
0x1402bda68: or edx, ecx
0x1402bda6a: je 0x1402bdc11
0x1402bda70: mov ecx, 0x6e696f6a
0x1402bda75: xor ecx, dword ptr [rax]
0x1402bda77: mov edx, 0x676e696e
0x1402bda7c: xor edx, dword ptr [rax + 3]
0x1402bda7f: or edx, ecx
0x1402bda81: jne 0x1402bdbe4
0x1402bda87: lea rcx, [rip + 0x5fbb1e3]
0x1402bda8e: mov edx, 0xa
0x1402bda93: call 0x145be8220
0x1402bda98: nop 
0x1402bda99: mov rbx, rdx
0x1402bda9c: test rdx, rdx
0x1402bda9f: jns 0x1402be041
0x1402bdaa5: xor r12d, r12d
0x1402bdaa8: mov rcx, r12
0x1402bdaab: mov rdx, rbx
0x1402bdaae: call 0x14620896b
0x1402bdab3: nop 
0x1402bdab4: jmp 0x1402be1a1
0x1402bdab9: mov ecx, 0x696c6e6f
0x1402bdabe: xor ecx, dword ptr [rax]
0x1402bdac0: movzx edx, word ptr [rax + 4]
0x1402bdac4: xor edx, 0x656e
0x1402bdaca: or edx, ecx
0x1402bdacc: je 0x1402bdbe4
0x1402bdad2: mov ecx, 0x696e6564
0x1402bdad7: xor ecx, dword ptr [rax]
0x1402bdad9: movzx edx, word ptr [rax + 4]
0x1402bdadd: xor edx, 0x6465
0x1402bdae3: or edx, ecx
0x1402bdae5: je 0x1402bdc11
0x1402bdaeb: mov ecx, 0x736f6c63
0x1402bdaf0: xor ecx, dword ptr [rax]
0x1402bdaf2: movzx eax, word ptr [rax + 4]
0x1402bdaf6: xor eax, 0x6465
0x1402bdafb: or eax, ecx
0x1402bdafd: jne 0x1402bdbe4
0x1402bdb03: lea rcx, [rip + 0x5fbb171]
0x1402bdb0a: mov edx, 0x17
0x1402bdb0f: call 0x145be8220
0x1402bdb14: nop 
0x1402bdb15: mov r8, rdx
0x1402bdb18: lea rcx, [rip + 0x5fbaed2]
0x1402bdb1f: mov qword ptr [rbp + 0x120], rcx
0x1402bdb26: mov qword ptr [rbp + 0x128], 3
0x1402bdb31: lea rcx, [rbp + 0x2b0]
0x1402bdb38: mov qword ptr [rbp + 0x130], rcx
0x1402bdb3f: lea rcx, [rip + 0x5fba7ca]
0x1402bdb46: mov qword ptr [rbp + 0x138], rcx
0x1402bdb4d: mov qword ptr [rsp + 0x20], 1
0x1402bdb56: lea rcx, [rbp + 0x2c8]
0x1402bdb5d: lea r9, [rbp + 0x120]
0x1402bdb64: mov rdx, rax
0x1402bdb67: call 0x145be86b0
0x1402bdb6c: nop 
0x1402bdb6d: jmp 0x1402bdce7
0x1402bdb72: movabs rcx, 0x697463656e6e6f63
0x1402bdb7c: xor rcx, qword ptr [rax]
0x1402bdb7f: movzx eax, word ptr [rax + 8]
0x1402bdb83: xor rax, 0x676e
0x1402bdb89: or rax, rcx
0x1402bdb8c: jne 0x1402bdbe4
0x1402bdb8e: lea rcx, [rip + 0x5fbb12f]
0x1402bdb95: mov edx, 0x22
0x1402bdb9a: call 0x145be8220
0x1402bdb9f: nop 
0x1402bdba0: mov rbx, rdx
0x1402bdba3: test rdx, rdx
0x1402bdba6: jns 0x1402be017
0x1402bdbac: xor r12d, r12d
0x1402bdbaf: mov rcx, r12
0x1402bdbb2: mov rdx, rbx
0x1402bdbb5: call 0x14620896b
0x1402bdbba: nop 
0x1402bdbbb: jmp 0x1402be1a1
0x1402bdbc0: movabs rcx, 0x616c696176616e75
0x1402bdbca: xor rcx, qword ptr [rax]
0x1402bdbcd: movabs rdx, 0x656c62616c696176
0x1402bdbd7: xor rdx, qword ptr [rax + 3]
0x1402bdbdb: or rdx, rcx
0x1402bdbde: je 0x1402bdc7d
0x1402bdbe4: mov qword ptr [rbp + 0x2c8], 0
0x1402bdbef: mov qword ptr [rbp + 0x2d0], 1
0x1402bdbfa: mov qword ptr [rbp + 0x2d8], 0
0x1402bdc05: movups xmm0, xmmword ptr [rip + 0x5fbac1c]
0x1402bdc0c: jmp 0x1402bdcee
0x1402bdc11: lea rcx, [rip + 0x5fbb07a]
0x1402bdc18: mov edx, 0x16
0x1402bdc1d: call 0x145be8220
0x1402bdc22: nop 
0x1402bdc23: mov r8, rdx
0x1402bdc26: lea rcx, [rip + 0x5fbadc4]
0x1402bdc2d: mov qword ptr [rbp + 0x120], rcx
0x1402bdc34: mov qword ptr [rbp + 0x128], 3
0x1402bdc3f: lea rcx, [rbp + 0x2b0]
0x1402bdc46: mov qword ptr [rbp + 0x130], rcx
0x1402bdc4d: lea rcx, [rip + 0x5fba6bc]
0x1402bdc54: mov qword ptr [rbp + 0x138], rcx
0x1402bdc5b: mov qword ptr [rsp + 0x20], 1
0x1402bdc64: lea rcx, [rbp + 0x2c8]
0x1402bdc6b: lea r9, [rbp + 0x120]
0x1402bdc72: mov rdx, rax
0x1402bdc75: call 0x145be86b0
0x1402bdc7a: nop 
0x1402bdc7b: jmp 0x1402bdce7
0x1402bdc7d: lea rcx, [rip + 0x5fbb024]
0x1402bdc84: mov edx, 0x1c
0x1402bdc89: call 0x145be8220
0x1402bdc8e: nop 
0x1402bdc8f: mov r8, rdx
0x1402bdc92: lea rcx, [rip + 0x5fbad58]
0x1402bdc99: mov qword ptr [rbp + 0x120], rcx
0x1402bdca0: mov qword ptr [rbp + 0x128], 3
0x1402bdcab: lea rcx, [rbp + 0x2b0]
0x1402bdcb2: mov qword ptr [rbp + 0x130], rcx
0x1402bdcb9: lea rcx, [rip + 0x5fba650]
0x1402bdcc0: mov qword ptr [rbp + 0x138], rcx
0x1402bdcc7: mov qword ptr [rsp + 0x20], 1
0x1402bdcd0: lea rcx, [rbp + 0x2c8]
0x1402bdcd7: lea r9, [rbp + 0x120]
0x1402bdcde: mov rdx, rax
0x1402bdce1: call 0x145be86b0
0x1402bdce6: nop 
0x1402bdce7: movups xmm0, xmmword ptr [rip + 0x5fbac5a]
0x1402bdcee: movaps xmmword ptr [rbp + 0x2e0], xmm0
0x1402bdcf5: mov dword ptr [rbp + 0x2f0], 0x3f800000
0x1402bdcff: mov rax, qword ptr [rbp + 0x2c8]
0x1402bdd06: mov qword ptr [rbp + 0x300], rax
0x1402bdd0d: mov rax, qword ptr [rbp + 0x2d0]
0x1402bdd14: mov qword ptr [rbp + 0x2a8], rax
0x1402bdd1b: xorps xmm0, xmm0
0x1402bdd1e: movaps xmmword ptr [rbp + 0x50], xmm0
0x1402bdd22: movaps xmmword ptr [rbp + 0x40], xmm0
0x1402bdd26: movaps xmmword ptr [rbp + 0x30], xmm0
0x1402bdd2a: movaps xmmword ptr [rbp + 0x20], xmm0
0x1402bdd2e: movaps xmmword ptr [rbp + 0x10], xmm0
0x1402bdd32: mov qword ptr [rbp + 0x60], 0
0x1402bdd3a: mov byte ptr [rbp + 0x2a4], 0
0x1402bdd41: mov dword ptr [rbp + 0x2a0], 0
0x1402bdd4b: movups xmm0, xmmword ptr [rip + 0x5fba1fe]
0x1402bdd52: movups xmmword ptr [rbp + 0x68], xmm0
0x1402bdd56: movups xmm0, xmmword ptr [rip + 0x5fba203]
0x1402bdd5d: movups xmmword ptr [rbp + 0x78], xmm0
0x1402bdd61: movups xmm0, xmmword ptr [rip + 0x5fba208]
0x1402bdd68: movups xmmword ptr [rbp + 0x88], xmm0
0x1402bdd6f: movups xmm0, xmmword ptr [rip + 0x5fba20a]
0x1402bdd76: movups xmmword ptr [rbp + 0x98], xmm0
0x1402bdd7d: movups xmm0, xmmword ptr [rip + 0x5fba21c]
0x1402bdd84: movups xmmword ptr [rbp + 0xb8], xmm0
0x1402bdd8b: movups xmm0, xmmword ptr [rip + 0x5fba1fe]
0x1402bdd92: movups xmmword ptr [rbp + 0xa8], xmm0
0x1402bdd99: movups xmm0, xmmword ptr [rip + 0x5fba220]
0x1402bdda0: movups xmmword ptr [rbp + 0xd8], xmm0
0x1402bdda7: movups xmm0, xmmword ptr [rip + 0x5fba202]
0x1402bddae: movups xmmword ptr [rbp + 0xc8], xmm0
0x1402bddb5: movups xmm0, xmmword ptr [rip + 0x5fba0dc]
0x1402bddbc: movaps xmmword ptr [rbp - 0x50], xmm0
0x1402bddc0: mov qword ptr [rbp - 0x40], 0
0x1402bddc8: movups xmm0, xmmword ptr [rip + 0x5fba0e1]
0x1402bddcf: movups xmmword ptr [rbp - 0x38], xmm0
0x1402bddd3: mov qword ptr [rbp - 0x28], 0
0x1402bdddb: movups xmm0, xmmword ptr [rip + 0x5fba0e6]
0x1402bdde2: movaps xmmword ptr [rbp - 0x20], xmm0
0x1402bdde6: mov qword ptr [rbp - 0x10], 0
0x1402bddee: movups xmm0, xmmword ptr [rip + 0x5fba0eb]
0x1402bddf5: movups xmmword ptr [rbp - 8], xmm0
0x1402bddf9: mov qword ptr [rbp + 8], 0
0x1402bde01: mov rsi, qword ptr [rdi]
0x1402bde04: add rdi, 8
0x1402bde08: lea rcx, [rbp + 0x128]
0x1402bde0f: lea rdx, [rbp - 0x50]
0x1402bde13: mov r8d, 0x138
0x1402bde19: call 0x14606171b
0x1402bde1e: movdqa xmm0, xmmword ptr [rip + 0x5f7512a]
0x1402bde26: movdqu xmmword ptr [rbp + 0x260], xmm0
0x1402bde2e: mov dword ptr [rbp + 0x270], 1
0x1402bde38: mov qword ptr [rbp + 0x274], 0
0x1402bde43: mov byte ptr [rbp + 0x27c], 1
0x1402bde4a: mov qword ptr [rbp + 0x280], 0
0x1402bde55: mov dword ptr [rbp + 0x288], 0x3f800000
0x1402bde5f: mov word ptr [rbp + 0x28c], 0
0x1402bde68: mov dword ptr [rbp + 0x28e], 0x10000
0x1402bde72: mov word ptr [rbp + 0x292], 0
0x1402bde7b: mov dword ptr [rbp + 0x294], 0x10000
0x1402bde85: mov word ptr [rbp + 0x298], 0
0x1402bde8e: mov dword ptr [rbp + 0x29a], 0
0x1402bde98: mov word ptr [rbp + 0x29e], 0
0x1402bdea1: mov byte ptr [rbp + 0x2a5], 5
0x1402bdea8: mov qword ptr [rbp + 0x120], rsi
0x1402bdeaf: mov byte ptr [rbp + 0x30f], 1
0x1402bdeb6: lea r9, [rip + 0x5fb4993]
0x1402bdebd: lea rcx, [rbp + 0xf0]
0x1402bdec4: lea r8, [rbp + 0x120]
0x1402bdecb: mov rdx, rdi
0x1402bdece: call 0x1402f4270
0x1402bded3: nop 
0x1402bded4: cmp byte ptr [r13], 1
0x1402bded9: jne 0x1402bdef6
0x1402bdedb: mov eax, dword ptr [r13 + 1]
0x1402bdedf: mov ecx, dword ptr [r13 + 4]
0x1402bdee3: mov dword ptr [rbp - 0x4d], ecx
0x1402bdee6: mov dword ptr [rbp - 0x50], eax
0x1402bdee9: mov rax, qword ptr [r13 + 8]
0x1402bdeed: movzx ecx, byte ptr [r13 + 0x10]
0x1402bdef2: mov dl, 1
0x1402bdef4: jmp 0x1402bdf06
0x1402bdef6: mov rax, qword ptr [r13 + 8]
0x1402bdefa: lock inc qword ptr [rax]
0x1402bdefe: jle 0x1402be1a1
0x1402bdf04: xor edx, edx
0x1402bdf06: mov r8, qword ptr [rbp + 0x2d8]
0x1402bdf0d: mov qword ptr [rbp + 0x130], r8
0x1402bdf14: movups xmm0, xmmword ptr [rbp + 0x2c8]
0x1402bdf1b: movaps xmmword ptr [rbp + 0x120], xmm0
0x1402bdf22: mov qword ptr [rbp + 0x138], 0
0x1402bdf2d: mov qword ptr [rbp + 0x140], 4
0x1402bdf38: mov qword ptr [rbp + 0x148], 0
0x1402bdf43: mov byte ptr [rbp + 0x150], dl
0x1402bdf49: mov edx, dword ptr [rbp - 0x50]
0x1402bdf4c: mov r8d, dword ptr [rbp - 0x4d]
0x1402bdf50: mov dword ptr [rbp + 0x151], edx
0x1402bdf56: mov dword ptr [rbp + 0x154], r8d
0x1402bdf5d: mov qword ptr [rbp + 0x158], rax
0x1402bdf64: mov qword ptr [rbp + 0x160], rcx
0x1402bdf6b: mov dword ptr [rbp + 0x168], 0x41600000
0x1402bdf75: mov word ptr [rbp + 0x16c], 0x190
0x1402bdf7e: mov byte ptr [rbp + 0x16e], 1
0x1402bdf85: mov eax, dword ptr [rbp + 0x2f0]
0x1402bdf8b: mov dword ptr [rbp + 0x180], eax
0x1402bdf91: movaps xmm0, xmmword ptr [rbp + 0x2e0]
0x1402bdf98: movaps xmmword ptr [rbp + 0x170], xmm0
0x1402bdf9f: movups xmm0, xmmword ptr [rip + 0x5fa28ba]
0x1402bdfa6: movups xmmword ptr [rbp + 0x184], xmm0
0x1402bdfad: mov eax, dword ptr [rip + 0x5fa28bd]
0x1402bdfb3: mov dword ptr [rbp + 0x194], eax
0x1402bdfb9: movq xmm0, qword ptr [rip + 0x5f74f6f]
0x1402bdfc1: movq qword ptr [rbp + 0x198], xmm0
0x1402bdfc9: mov byte ptr [rbp + 0x30f], 0
0x1402bdfd0: lea rcx, [rbp + 0xf0]
0x1402bdfd7: lea rdx, [rbp + 0x120]
0x1402bdfde: call 0x1403133a0
0x1402bdfe3: nop 
0x1402bdfe4: mov rdx, qword ptr [rbp + 0x2b0]
0x1402bdfeb: test rdx, rdx
0x1402bdfee: je 0x1402be003
0x1402bdff0: mov rcx, qword ptr [rbp + 0x2b8]
0x1402bdff7: mov r8d, 1
0x1402bdffd: call 0x1400021d0
0x1402be002: nop 
0x1402be003: add rsp, 0x398
0x1402be00a: pop rbx
0x1402be00b: pop rdi
0x1402be00c: pop rsi
0x1402be00d: pop r12
0x1402be00f: pop r13
0x1402be011: pop r14
0x1402be013: pop r15
0x1402be015: pop rbp
0x1402be016: ret 
0x1402be017: test rbx, rbx
0x1402be01a: je 0x1402be07d
0x1402be01c: mov r15, rax
0x1402be01f: call 0x140002200
0x1402be024: mov r12d, 1
0x1402be02a: mov edx, 1
0x1402be02f: mov rcx, rbx
0x1402be032: call 0x1400021c0
0x1402be037: test rax, rax
0x1402be03a: jne 0x1402be06a
0x1402be03c: jmp 0x1402bdbaf
0x1402be041: test rbx, rbx
0x1402be044: je 0x1402be07d
0x1402be046: mov r15, rax
0x1402be049: call 0x140002200
0x1402be04e: mov r12d, 1
0x1402be054: mov edx, 1
0x1402be059: mov rcx, rbx
0x1402be05c: call 0x1400021c0
0x1402be061: test rax, rax
0x1402be064: je 0x1402bdaa8
0x1402be06a: mov r14, rax
0x1402be06d: mov rcx, rax
0x1402be070: mov rdx, r15
0x1402be073: mov r8, rbx
0x1402be076: call 0x14606171b
0x1402be07b: jmp 0x1402be083
0x1402be07d: mov r14d, 1
0x1402be083: mov qword ptr [rbp + 0x2c8], rbx
0x1402be08a: mov qword ptr [rbp + 0x2d0], r14
0x1402be091: mov qword ptr [rbp + 0x2d8], rbx
0x1402be098: jmp 0x1402bdc05
0x1402be09d: xor r14d, r14d
0x1402be0a0: mov r13, qword ptr [rbp + 0x300]
0x1402be0a7: mov rcx, r12
0x1402be0aa: call 0x145b05430
0x1402be0af: mov rcx, rax
0x1402be0b2: call 0x145af3890
0x1402be0b7: mov qword ptr [rbp + 0xf0], rax
0x1402be0be: mov qword ptr [rbp + 0xf8], rdx
0x1402be0c5: lea rcx, [rip + 0x5fbab6c]
0x1402be0cc: mov edx, 0x39
0x1402be0d1: call 0x145be8220
0x1402be0d6: mov r15, rax
0x1402be0d9: mov r12, rdx
0x1402be0dc: mov ecx, r14d
0x1402be0df: call 0x145b2cda0
0x1402be0e4: lea r14, [rbp - 0x50]
0x1402be0e8: mov rcx, r14
0x1402be0eb: mov edx, eax
0x1402be0ed: call 0x145b2cdb0
0x1402be0f2: lea rax, [rip + 0x5fba8aa]
0x1402be0f9: mov qword ptr [rbp + 0x120], rax
0x1402be100: mov qword ptr [rbp + 0x128], 6
0x1402be10b: mov qword ptr [rbp + 0x130], r14
0x1402be112: lea rax, [rip + 0x5fba1f7]
0x1402be119: mov qword ptr [rbp + 0x138], rax
0x1402be120: lea rax, [rip + 0x5fba878]
0x1402be127: mov qword ptr [rbp + 0x140], rax
0x1402be12e: mov qword ptr [rbp + 0x148], 4
0x1402be139: lea rax, [rbp + 0xf0]
0x1402be140: mov qword ptr [rbp + 0x150], rax
0x1402be147: lea rax, [rip + 0x5fbaaca]
0x1402be14e: mov qword ptr [rbp + 0x158], rax
0x1402be155: mov qword ptr [rsp + 0x20], 2
0x1402be15e: lea rcx, [rbp + 0x2b0]
0x1402be165: lea r9, [rbp + 0x120]
0x1402be16c: mov rdx, r15
0x1402be16f: mov r8, r12
0x1402be172: call 0x145be86b0
0x1402be177: nop 
0x1402be178: mov rdx, qword ptr [rbp - 0x50]
0x1402be17c: test rdx, rdx
0x1402be17f: je 0x1402bda18
0x1402be185: mov rcx, qword ptr [rbp - 0x48]
0x1402be189: mov r8d, 1
0x1402be18f: call 0x1400021d0
0x1402be194: jmp 0x1402bda18
0x1402be199: mov r14d, eax
0x1402be19c: jmp 0x1402be0a7
0x1402be1a1: ud2 
0x1402be1a3: mov rdx, rsi
0x1402be1a6: jne 0x1402bd83f
0x1402be1ac: mov rsi, rdx
0x1402be1af: mov r12d, 1
0x1402be1b5: xor r15d, r15d
0x1402be1b8: jmp 0x1402bd870

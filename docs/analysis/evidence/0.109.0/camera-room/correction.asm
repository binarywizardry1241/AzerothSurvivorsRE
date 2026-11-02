; correction 0x140988190..0x140988fe5
140988190: 4157 push r15
140988192: 4156 push r14
140988194: 4155 push r13
140988196: 4154 push r12
140988198: 56 push rsi
140988199: 57 push rdi
14098819a: 55 push rbp
14098819b: 53 push rbx
14098819c: 4881ec58030000 sub rsp, 0x358
1409881a3: 440f29bc2440030000 movaps xmmword ptr [rsp + 0x340], xmm15
1409881ac: 440f29b42430030000 movaps xmmword ptr [rsp + 0x330], xmm14
1409881b5: 440f29ac2420030000 movaps xmmword ptr [rsp + 0x320], xmm13
1409881be: 440f29a42410030000 movaps xmmword ptr [rsp + 0x310], xmm12
1409881c7: 440f299c2400030000 movaps xmmword ptr [rsp + 0x300], xmm11
1409881d0: 440f299424f0020000 movaps xmmword ptr [rsp + 0x2f0], xmm10
1409881d9: 440f298c24e0020000 movaps xmmword ptr [rsp + 0x2e0], xmm9
1409881e2: 440f298424d0020000 movaps xmmword ptr [rsp + 0x2d0], xmm8
1409881eb: 0f29bc24c0020000 movaps xmmword ptr [rsp + 0x2c0], xmm7
1409881f3: 0f29b424b0020000 movaps xmmword ptr [rsp + 0x2b0], xmm6
1409881fb: 4889d0 mov rax, rdx
1409881fe: 4c8bb424f8030000 mov r14, qword ptr [rsp + 0x3f8]
140988206: 488bb424f0030000 mov rsi, qword ptr [rsp + 0x3f0]
14098820e: 488b9424e8030000 mov rdx, qword ptr [rsp + 0x3e8]
140988216: 488b8c24e0030000 mov rcx, qword ptr [rsp + 0x3e0]
14098821e: 4c8b9424d8030000 mov r10, qword ptr [rsp + 0x3d8]
140988226: 4c8b9c24d0030000 mov r11, qword ptr [rsp + 0x3d0]
14098822e: 488bbc24c8030000 mov rdi, qword ptr [rsp + 0x3c8]
140988236: 488b9c24c0030000 mov rbx, qword ptr [rsp + 0x3c0]
14098823e: 0f1000 movups xmm0, xmmword ptr [rax]
140988241: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140988245: 0f298c2400010000 movaps xmmword ptr [rsp + 0x100], xmm1
14098824d: 0f298424f0000000 movaps xmmword ptr [rsp + 0xf0], xmm0
140988255: 410f1000 movups xmm0, xmmword ptr [r8]
140988259: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
14098825e: 0f118c2498020000 movups xmmword ptr [rsp + 0x298], xmm1
140988266: 0f11842488020000 movups xmmword ptr [rsp + 0x288], xmm0
14098826e: 410f1001 movups xmm0, xmmword ptr [r9]
140988272: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
140988277: 0f298c2420010000 movaps xmmword ptr [rsp + 0x120], xmm1
14098827f: 0f29842410010000 movaps xmmword ptr [rsp + 0x110], xmm0
140988287: 0f1003 movups xmm0, xmmword ptr [rbx]
14098828a: 0f104b10 movups xmm1, xmmword ptr [rbx + 0x10]
14098828e: 0f298c2440010000 movaps xmmword ptr [rsp + 0x140], xmm1
140988296: 0f29842430010000 movaps xmmword ptr [rsp + 0x130], xmm0
14098829e: 0f1007 movups xmm0, xmmword ptr [rdi]
1409882a1: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
1409882a5: 0f298c2460010000 movaps xmmword ptr [rsp + 0x160], xmm1
1409882ad: 0f29842450010000 movaps xmmword ptr [rsp + 0x150], xmm0
1409882b5: 410f1003 movups xmm0, xmmword ptr [r11]
1409882b9: 0f29842470010000 movaps xmmword ptr [rsp + 0x170], xmm0
1409882c1: 498b4310 mov rax, qword ptr [r11 + 0x10]
1409882c5: 4889842480010000 mov qword ptr [rsp + 0x180], rax
1409882cd: 410f1002 movups xmm0, xmmword ptr [r10]
1409882d1: 410f104a10 movups xmm1, xmmword ptr [r10 + 0x10]
1409882d6: 0f11842488010000 movups xmmword ptr [rsp + 0x188], xmm0
1409882de: 0f118c2498010000 movups xmmword ptr [rsp + 0x198], xmm1
1409882e6: 0f1001 movups xmm0, xmmword ptr [rcx]
1409882e9: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
1409882ed: 0f118424a8010000 movups xmmword ptr [rsp + 0x1a8], xmm0
1409882f5: 0f118c24b8010000 movups xmmword ptr [rsp + 0x1b8], xmm1
1409882fd: 488d8c24c8010000 lea rcx, [rsp + 0x1c8]
140988305: 41b8a8000000 mov r8d, 0xa8
14098830b: e8d71d2705 call 0x145bfa0e7
140988310: 0f1006 movups xmm0, xmmword ptr [rsi]
140988313: 0f29842470020000 movaps xmmword ptr [rsp + 0x270], xmm0
14098831b: 488b4610 mov rax, qword ptr [rsi + 0x10]
14098831f: 4889842480020000 mov qword ptr [rsp + 0x280], rax
140988327: 4c89b424a8020000 mov qword ptr [rsp + 0x2a8], r14
14098832f: 4c8b942470020000 mov r10, qword ptr [rsp + 0x270]
140988337: 488b842478020000 mov rax, qword ptr [rsp + 0x278]
14098833f: 498b92f8000000 mov rdx, qword ptr [r10 + 0xf8]
140988346: 4d8b8200010000 mov r8, qword ptr [r10 + 0x100]
14098834d: 450fb68a08010000 movzx r9d, byte ptr [r10 + 0x108]
140988355: 4a8d348500000000 lea rsi, [r8*4]
14098835d: 4889d1 mov rcx, rdx
140988360: 4584c9 test r9b, r9b
140988363: 746b je 0x1409883d0
140988365: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
140988370: 4885f6 test rsi, rsi
140988373: 0f84e5000000 je 0x14098845e
140988379: 448b19 mov r11d, dword ptr [rcx]
14098837c: 4883c104 add rcx, 4
140988380: 488bb8a8010000 mov rdi, qword ptr [rax + 0x1a8]
140988387: 4b8d1cdb lea rbx, [r11 + r11*8]
14098838b: 4c8b5cdf10 mov r11, qword ptr [rdi + rbx*8 + 0x10]
140988390: 4883c6fc add rsi, -4
140988394: 4d85db test r11, r11
140988397: 74d7 je 0x140988370
140988399: 488d34df lea rsi, [rdi + rbx*8]
14098839d: 4d8b9210010000 mov r10, qword ptr [r10 + 0x110]
1409883a4: 488b5e18 mov rbx, qword ptr [rsi + 0x18]
1409883a8: 488b7638 mov rsi, qword ptr [rsi + 0x38]
1409883ac: 4e8b14d6 mov r10, qword ptr [rsi + r10*8]
1409883b0: 49f7d2 not r10
1409883b3: 4f8d1452 lea r10, [r10 + r10*2]
1409883b7: 49c1e204 shl r10, 4
1409883bb: 4a8b7c1310 mov rdi, qword ptr [rbx + r10 + 0x10]
1409883c0: 4a8b6c1328 mov rbp, qword ptr [rbx + r10 + 0x28]
1409883c5: e98d000000 jmp 0x140988457
1409883ca: 660f1f440000 nop word ptr [rax + rax]
1409883d0: 4885f6 test rsi, rsi
1409883d3: 0f8485000000 je 0x14098845e
1409883d9: 448b19 mov r11d, dword ptr [rcx]
1409883dc: 4883c104 add rcx, 4
1409883e0: 488bb808010000 mov rdi, qword ptr [rax + 0x108]
1409883e7: 4b8d1c9b lea rbx, [r11 + r11*4]
1409883eb: 48c1e305 shl rbx, 5
1409883ef: 4c8b5c1f58 mov r11, qword ptr [rdi + rbx + 0x58]
1409883f4: 4883c6fc add rsi, -4
1409883f8: 4d85db test r11, r11
1409883fb: 74d3 je 0x1409883d0
1409883fd: 4801df add rdi, rbx
140988400: 8bb794000000 mov esi, dword ptr [rdi + 0x94]
140988406: 488b98a8010000 mov rbx, qword ptr [rax + 0x1a8]
14098840d: 488d34f6 lea rsi, [rsi + rsi*8]
140988411: 4d8b9210010000 mov r10, qword ptr [r10 + 0x110]
140988418: 4c8b64f318 mov r12, qword ptr [rbx + rsi*8 + 0x18]
14098841d: 488b74f338 mov rsi, qword ptr [rbx + rsi*8 + 0x38]
140988422: 4e8b14d6 mov r10, qword ptr [rsi + r10*8]
140988426: 49f7d2 not r10
140988429: 488b7750 mov rsi, qword ptr [rdi + 0x50]
14098842d: 8b6e08 mov ebp, dword ptr [rsi + 8]
140988430: 4f8d1452 lea r10, [r10 + r10*2]
140988434: 49c1e204 shl r10, 4
140988438: f7d5 not ebp
14098843a: 488d3c6d00000000 lea rdi, [rbp*2]
140988442: 4801ef add rdi, rbp
140988445: 48c1e704 shl rdi, 4
140988449: 4b037c1410 add rdi, qword ptr [r12 + r10 + 0x10]
14098844e: 48c1e502 shl rbp, 2
140988452: 4b036c1428 add rbp, qword ptr [r12 + r10 + 0x28]
140988457: bb01000000 mov ebx, 1
14098845c: eb07 jmp 0x140988465
14098845e: 4531db xor r11d, r11d
140988461: 31db xor ebx, ebx
140988463: 31ff xor edi, edi
140988465: 4c8bac24f0000000 mov r13, qword ptr [rsp + 0xf0]
14098846d: 4c8ba42410010000 mov r12, qword ptr [rsp + 0x110]
140988475: 4c8b942488020000 mov r10, qword ptr [rsp + 0x288]
14098847d: 488bb42430010000 mov rsi, qword ptr [rsp + 0x130]
140988485: 448bbc2484020000 mov r15d, dword ptr [rsp + 0x284]
14098848d: 4489bc2494000000 mov dword ptr [rsp + 0x94], r15d
140988495: 4a8d1482 lea rdx, [rdx + r8*4]
140988499: 4584c9 test r9b, r9b
14098849c: 7436 je 0x1409884d4
14098849e: 4439db cmp ebx, r11d
1409884a1: 0f8594060000 jne 0x140988b3b
1409884a7: 660f1f840000000000 nop word ptr [rax + rax]
1409884b0: 4839d1 cmp rcx, rdx
1409884b3: 7453 je 0x140988508
1409884b5: 448b01 mov r8d, dword ptr [rcx]
1409884b8: 4883c104 add rcx, 4
1409884bc: 4c8b88a8010000 mov r9, qword ptr [rax + 0x1a8]
1409884c3: 4f8d04c0 lea r8, [r8 + r8*8]
1409884c7: 4b837cc11000 cmp qword ptr [r9 + r8*8 + 0x10], 0
1409884cd: 74e1 je 0x1409884b0
1409884cf: e967060000 jmp 0x140988b3b
1409884d4: 4439db cmp ebx, r11d
1409884d7: 0f855e060000 jne 0x140988b3b
1409884dd: 0f1f00 nop dword ptr [rax]
1409884e0: 4839d1 cmp rcx, rdx
1409884e3: 7423 je 0x140988508
1409884e5: 448b01 mov r8d, dword ptr [rcx]
1409884e8: 4883c104 add rcx, 4
1409884ec: 4c8b8808010000 mov r9, qword ptr [rax + 0x108]
1409884f3: 4f8d0480 lea r8, [r8 + r8*4]
1409884f7: 49c1e005 shl r8, 5
1409884fb: 4b837c015800 cmp qword ptr [r9 + r8 + 0x58], 0
140988501: 74dd je 0x1409884e0
140988503: e933060000 jmp 0x140988b3b
140988508: 4885ff test rdi, rdi
14098850b: 0f842a060000 je 0x140988b3b
140988511: 488d842450010000 lea rax, [rsp + 0x150]
140988519: 488d9c2470010000 lea rbx, [rsp + 0x170]
140988521: 488d8c2488010000 lea rcx, [rsp + 0x188]
140988529: 488d9424a8010000 lea rdx, [rsp + 0x1a8]
140988531: f3410f107558 movss xmm6, dword ptr [r13 + 0x58]
140988537: f3440f104f18 movss xmm9, dword ptr [rdi + 0x18]
14098853d: f2450f10542470 movsd xmm10, qword ptr [r12 + 0x70]
140988544: f30f10464c movss xmm0, dword ptr [rsi + 0x4c]
140988549: f3440f12e0 movsldup xmm12, xmm0
14098854e: 440f5925ea4e4105 mulps xmm12, xmmword ptr [rip + 0x5414eea]
140988556: 450f58d4 addps xmm10, xmm12
14098855a: f3450f58642478 addss xmm12, dword ptr [r12 + 0x78]
140988561: 440f13542478 movlps qword ptr [rsp + 0x78], xmm10
140988567: f3440f11a42480000000 movss dword ptr [rsp + 0x80], xmm12
140988571: f2440f105f10 movsd xmm11, qword ptr [rdi + 0x10]
140988577: 450f5cda subps xmm11, xmm10
14098857b: f3410f16fb movshdup xmm7, xmm11
140988580: f3450f5ccc subss xmm9, xmm12
140988585: 410f28c3 movaps xmm0, xmm11
140988589: f3410f59c3 mulss xmm0, xmm11
14098858e: 0f28d7 movaps xmm2, xmm7
140988591: f30f59d7 mulss xmm2, xmm7
140988595: f30f58d0 addss xmm2, xmm0
140988599: 410f28c9 movaps xmm1, xmm9
14098859d: f3410f59c9 mulss xmm1, xmm9
1409885a2: f30f58d1 addss xmm2, xmm1
1409885a6: f3440f51c2 sqrtss xmm8, xmm2
1409885ab: f3440f11442448 movss dword ptr [rsp + 0x48], xmm8
1409885b2: f3440f119c24a4000000 movss dword ptr [rsp + 0xa4], xmm11
1409885bc: c78424a800000000000000 mov dword ptr [rsp + 0xa8], 0
1409885c7: f3440f118c24ac000000 movss dword ptr [rsp + 0xac], xmm9
1409885d1: 48898c24c8000000 mov qword ptr [rsp + 0xc8], rcx
1409885d9: 48899424d0000000 mov qword ptr [rsp + 0xd0], rdx
1409885e1: 48898424d8000000 mov qword ptr [rsp + 0xd8], rax
1409885e9: 48899c24e0000000 mov qword ptr [rsp + 0xe0], rbx
1409885f1: 488d8424c8000000 lea rax, [rsp + 0xc8]
1409885f9: 48898424e8000000 mov qword ptr [rsp + 0xe8], rax
140988601: 4d85d2 test r10, r10
140988604: 0f842a050000 je 0x140988b34
14098860a: 41813abd000000 cmp dword ptr [r10], 0xbd
140988611: 0f851d050000 jne 0x140988b34
140988617: 440f2e05e9c64405 ucomiss xmm8, dword ptr [rip + 0x544c6e9]
14098861f: 0f820f050000 jb 0x140988b34
140988625: f30f58c1 addss xmm0, xmm1
140988629: f30f51c0 sqrtss xmm0, xmm0
14098862d: 0f2e0520c74505 ucomiss xmm0, dword ptr [rip + 0x545c720]
140988634: 0f86fa040000 jbe 0x140988b34
14098863a: 488bb42450010000 mov rsi, qword ptr [rsp + 0x150]
140988642: 4c8bbc2488010000 mov r15, qword ptr [rsp + 0x188]
14098864a: 488b9424a8010000 mov rdx, qword ptr [rsp + 0x1a8]
140988652: 8b842480000000 mov eax, dword ptr [rsp + 0x80]
140988659: 89442458 mov dword ptr [rsp + 0x58], eax
14098865d: 488b442478 mov rax, qword ptr [rsp + 0x78]
140988662: 4889442450 mov qword ptr [rsp + 0x50], rax
140988667: 4c8d442450 lea r8, [rsp + 0x50]
14098866c: 4c89f9 mov rcx, r15
14098866f: 4889942488000000 mov qword ptr [rsp + 0x88], rdx
140988677: e834fad700 call 0x1417080b0
14098867c: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988682: 4c8d642478 lea r12, [rsp + 0x78]
140988687: 4c89e1 mov rcx, r12
14098868a: 4889f2 mov rdx, rsi
14098868d: 4989d8 mov r8, rbx
140988690: 4189c1 mov r9d, eax
140988693: e8e8e5fbff call 0x140946c80
140988698: 84c0 test al, al
14098869a: 0f8494040000 je 0x140988b34
1409886a0: 4c8d6f10 lea r13, [rdi + 0x10]
1409886a4: f3410f5ef8 divss xmm7, xmm8
1409886a9: 0f28c7 movaps xmm0, xmm7
1409886ac: e8cc1a2705 call 0x145bfa17d
1409886b1: 440f28c0 movaps xmm8, xmm0
1409886b5: f30f1144244c movss dword ptr [rsp + 0x4c], xmm0
1409886bb: 488d8424a4000000 lea rax, [rsp + 0xa4]
1409886c3: 4889842498000000 mov qword ptr [rsp + 0x98], rax
1409886cb: 0f57ff xorps xmm7, xmm7
1409886ce: 0f2e055b815405 ucomiss xmm0, dword ptr [rip + 0x554815b]
1409886d5: 0f8390010000 jae 0x14098886b
1409886db: 418b4508 mov eax, dword ptr [r13 + 8]
1409886df: 89442438 mov dword ptr [rsp + 0x38], eax
1409886e3: 498b4500 mov rax, qword ptr [r13]
1409886e7: 4889442430 mov qword ptr [rsp + 0x30], rax
1409886ec: 418b4508 mov eax, dword ptr [r13 + 8]
1409886f0: 89442458 mov dword ptr [rsp + 0x58], eax
1409886f4: 498b4500 mov rax, qword ptr [r13]
1409886f8: 4889442450 mov qword ptr [rsp + 0x50], rax
1409886fd: 4c8d6c2450 lea r13, [rsp + 0x50]
140988702: 4c89f9 mov rcx, r15
140988705: 488b942488000000 mov rdx, qword ptr [rsp + 0x88]
14098870d: 4d89e8 mov r8, r13
140988710: e89bf9d700 call 0x1417080b0
140988715: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14098871b: 488d4c2430 lea rcx, [rsp + 0x30]
140988720: 4889f2 mov rdx, rsi
140988723: 4989d8 mov r8, rbx
140988726: 4189c1 mov r9d, eax
140988729: e852e5fbff call 0x140946c80
14098872e: 84c0 test al, al
140988730: 0f8535010000 jne 0x14098886b
140988736: 4c89642450 mov qword ptr [rsp + 0x50], r12
14098873b: 488d842498000000 lea rax, [rsp + 0x98]
140988743: 4889442458 mov qword ptr [rsp + 0x58], rax
140988748: 488d442448 lea rax, [rsp + 0x48]
14098874d: 4889442460 mov qword ptr [rsp + 0x60], rax
140988752: 488d8424d8000000 lea rax, [rsp + 0xd8]
14098875a: 4889442468 mov qword ptr [rsp + 0x68], rax
14098875f: 488d8424c8010000 lea rax, [rsp + 0x1c8]
140988767: 4889442470 mov qword ptr [rsp + 0x70], rax
14098876c: 48b8010000000a000000 movabs rax, 0xa00000001
140988776: 48898424b8000000 mov qword ptr [rsp + 0xb8], rax
14098877e: c68424c000000000 mov byte ptr [rsp + 0xc0], 0
140988786: 488d44244c lea rax, [rsp + 0x4c]
14098878b: 48898424b0000000 mov qword ptr [rsp + 0xb0], rax
140988793: 4c896c2430 mov qword ptr [rsp + 0x30], r13
140988798: 4889442438 mov qword ptr [rsp + 0x38], rax
14098879d: 488d8424b0000000 lea rax, [rsp + 0xb0]
1409887a5: 4889442440 mov qword ptr [rsp + 0x40], rax
1409887aa: 488d4c2430 lea rcx, [rsp + 0x30]
1409887af: ba01000000 mov edx, 1
1409887b4: e8f789faff call 0x1409311b0
1409887b9: a801 test al, 1
1409887bb: 0f85a0000000 jne 0x140988861
1409887c1: 488d4c2430 lea rcx, [rsp + 0x30]
1409887c6: ba02000000 mov edx, 2
1409887cb: e8e089faff call 0x1409311b0
1409887d0: a801 test al, 1
1409887d2: 0f8589000000 jne 0x140988861
1409887d8: 488d4c2430 lea rcx, [rsp + 0x30]
1409887dd: ba03000000 mov edx, 3
1409887e2: e8c989faff call 0x1409311b0
1409887e7: a801 test al, 1
1409887e9: 7576 jne 0x140988861
1409887eb: 488d4c2430 lea rcx, [rsp + 0x30]
1409887f0: ba04000000 mov edx, 4
1409887f5: e8b689faff call 0x1409311b0
1409887fa: a801 test al, 1
1409887fc: 7563 jne 0x140988861
1409887fe: 488d4c2430 lea rcx, [rsp + 0x30]
140988803: ba05000000 mov edx, 5
140988808: e8a389faff call 0x1409311b0
14098880d: a801 test al, 1
14098880f: 7550 jne 0x140988861
140988811: 488d4c2430 lea rcx, [rsp + 0x30]
140988816: ba06000000 mov edx, 6
14098881b: e89089faff call 0x1409311b0
140988820: a801 test al, 1
140988822: 753d jne 0x140988861
140988824: 488d4c2430 lea rcx, [rsp + 0x30]
140988829: ba07000000 mov edx, 7
14098882e: e87d89faff call 0x1409311b0
140988833: a801 test al, 1
140988835: 752a jne 0x140988861
140988837: 488d4c2430 lea rcx, [rsp + 0x30]
14098883c: ba08000000 mov edx, 8
140988841: e86a89faff call 0x1409311b0
140988846: a801 test al, 1
140988848: 7517 jne 0x140988861
14098884a: 488d4c2430 lea rcx, [rsp + 0x30]
14098884f: ba09000000 mov edx, 9
140988854: e85789faff call 0x1409311b0
140988859: a801 test al, 1
14098885b: 0f8450070000 je 0x140988fb1
140988861: 0f28f8 movaps xmm7, xmm0
140988864: f3440f1044244c movss xmm8, dword ptr [rsp + 0x4c]
14098886b: f3450f1036 movss xmm14, dword ptr [r14]
140988870: 31c0 xor eax, eax
140988872: 410f2efe ucomiss xmm7, xmm14
140988876: 0f97c0 seta al
140988879: f3410f5cfe subss xmm7, xmm14
14098887e: 488d0de3835405 lea rcx, [rip + 0x55483e3]
140988885: f30f593481 mulss xmm6, dword ptr [rcx + rax*4]
14098888a: 0f28c6 movaps xmm0, xmm6
14098888d: e8a3182705 call 0x145bfa135
140988892: f3440f102d054a4105 movss xmm13, dword ptr [rip + 0x5414a05]
14098889b: 410f28f5 movaps xmm6, xmm13
14098889f: f30f5cf0 subss xmm6, xmm0
1409888a3: f30f59f7 mulss xmm6, xmm7
1409888a7: f3410f58f6 addss xmm6, xmm14
1409888ac: f3410f1136 movss dword ptr [r14], xmm6
1409888b1: f30f10056b835405 movss xmm0, dword ptr [rip + 0x554836b]
1409888b9: 0f2ec6 ucomiss xmm0, xmm6
1409888bc: 4d89fd mov r13, r15
1409888bf: 765f jbe 0x140988920
1409888c1: 488d4f10 lea rcx, [rdi + 0x10]
1409888c5: 8b4108 mov eax, dword ptr [rcx + 8]
1409888c8: 89442438 mov dword ptr [rsp + 0x38], eax
1409888cc: 488b01 mov rax, qword ptr [rcx]
1409888cf: 4889442430 mov qword ptr [rsp + 0x30], rax
1409888d4: 8b4108 mov eax, dword ptr [rcx + 8]
1409888d7: 89442458 mov dword ptr [rsp + 0x58], eax
1409888db: 488b01 mov rax, qword ptr [rcx]
1409888de: 4889442450 mov qword ptr [rsp + 0x50], rax
1409888e3: 4c8d442450 lea r8, [rsp + 0x50]
1409888e8: 4c89e9 mov rcx, r13
1409888eb: 488b942488000000 mov rdx, qword ptr [rsp + 0x88]
1409888f3: e8b8f7d700 call 0x1417080b0
1409888f8: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1409888fe: 488d4c2430 lea rcx, [rsp + 0x30]
140988903: 4889f2 mov rdx, rsi
140988906: 4989d8 mov r8, rbx
140988909: 4189c1 mov r9d, eax
14098890c: e86fe3fbff call 0x140946c80
140988911: 84c0 test al, al
140988913: 0f8522020000 jne 0x140988b3b
140988919: f3440f1044244c movss xmm8, dword ptr [rsp + 0x4c]
140988920: 4989f6 mov r14, rsi
140988923: f3410f58f0 addss xmm6, xmm8
140988928: f3440f5f05ff7e5405 maxss xmm8, dword ptr [rip + 0x5547eff]
140988931: f3410f5df0 minss xmm6, xmm8
140988936: 488bb42498000000 mov rsi, qword ptr [rsp + 0x98]
14098893e: f30f107e08 movss xmm7, dword ptr [rsi + 8]
140988943: 440f28f7 movaps xmm14, xmm7
140988947: f3440f59f7 mulss xmm14, xmm7
14098894c: 0f28c6 movaps xmm0, xmm6
14098894f: e8c9172705 call 0x145bfa11d
140988954: f3440f10442448 movss xmm8, dword ptr [rsp + 0x48]
14098895b: f20f100e movsd xmm1, qword ptr [rsi]
14098895f: 0f28d1 movaps xmm2, xmm1
140988962: 0f59d1 mulps xmm2, xmm1
140988965: f30f16da movshdup xmm3, xmm2
140988969: f30f58da addss xmm3, xmm2
14098896d: f3410f58de addss xmm3, xmm14
140988972: 0f57d2 xorps xmm2, xmm2
140988975: f30f51d3 sqrtss xmm2, xmm3
140988979: f3440f5eea divss xmm13, xmm2
14098897e: f3410f12d5 movsldup xmm2, xmm13
140988983: 0f59d1 mulps xmm2, xmm1
140988986: f3440f59ef mulss xmm13, xmm7
14098898b: f30f12f8 movsldup xmm7, xmm0
14098898f: 0f59fa mulps xmm7, xmm2
140988992: f3440f59e8 mulss xmm13, xmm0
140988997: 0f28c6 movaps xmm0, xmm6
14098899a: e878172705 call 0x145bfa117
14098899f: f30f12f0 movsldup xmm6, xmm0
1409889a3: 0f5935964a4105 mulps xmm6, xmmword ptr [rip + 0x5414a96]
1409889aa: 0f58fe addps xmm7, xmm6
1409889ad: f3410f58f5 addss xmm6, xmm13
1409889b2: 0f13bc24b0000000 movlps qword ptr [rsp + 0xb0], xmm7
1409889ba: f30f11b424b8000000 movss dword ptr [rsp + 0xb8], xmm6
1409889c3: f3410f12c0 movsldup xmm0, xmm8
1409889c8: f3440f59c6 mulss xmm8, xmm6
1409889cd: 0f59c7 mulps xmm0, xmm7
1409889d0: 0f13442430 movlps qword ptr [rsp + 0x30], xmm0
1409889d5: f3440f11442438 movss dword ptr [rsp + 0x38], xmm8
1409889dc: 488b442478 mov rax, qword ptr [rsp + 0x78]
1409889e1: 4889442450 mov qword ptr [rsp + 0x50], rax
1409889e6: 8b842480000000 mov eax, dword ptr [rsp + 0x80]
1409889ed: 89442458 mov dword ptr [rsp + 0x58], eax
1409889f1: 488d542450 lea rdx, [rsp + 0x50]
1409889f6: 4c8d442430 lea r8, [rsp + 0x30]
1409889fb: 488d8c24c8010000 lea rcx, [rsp + 0x1c8]
140988a03: 4531c9 xor r9d, r9d
140988a06: e8e5e6c300 call 0x1415c70f0
140988a0b: f3440f10442448 movss xmm8, dword ptr [rsp + 0x48]
140988a12: a801 test al, 1
140988a14: 741e je 0x140988a34
140988a16: 0f28c8 movaps xmm1, xmm0
140988a19: f3410f5dc8 minss xmm1, xmm8
140988a1e: 440f28c1 movaps xmm8, xmm1
140988a22: f3440fc2c103 cmpunordss xmm8, xmm1
140988a28: 410f54c0 andps xmm0, xmm8
140988a2c: 440f55c1 andnps xmm8, xmm1
140988a30: 440f56c0 orps xmm8, xmm0
140988a34: 4c89f6 mov rsi, r14
140988a37: f3450f12e8 movsldup xmm13, xmm8
140988a3c: 440f59ef mulps xmm13, xmm7
140988a40: 440f28f6 movaps xmm14, xmm6
140988a44: f3450f59f0 mulss xmm14, xmm8
140988a49: 450f58ea addps xmm13, xmm10
140988a4d: f3450f58f4 addss xmm14, xmm12
140988a52: 440f136c2430 movlps qword ptr [rsp + 0x30], xmm13
140988a58: f3440f11742438 movss dword ptr [rsp + 0x38], xmm14
140988a5f: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988a63: 89442458 mov dword ptr [rsp + 0x58], eax
140988a67: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988a6c: 4889442450 mov qword ptr [rsp + 0x50], rax
140988a71: 4c8d442450 lea r8, [rsp + 0x50]
140988a76: 4c89e9 mov rcx, r13
140988a79: 4c8bb42488000000 mov r14, qword ptr [rsp + 0x88]
140988a81: 4c89f2 mov rdx, r14
140988a84: e827f6d700 call 0x1417080b0
140988a89: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988a8f: 488d4c2430 lea rcx, [rsp + 0x30]
140988a94: 4889f2 mov rdx, rsi
140988a97: 4989d8 mov r8, rbx
140988a9a: 4189c1 mov r9d, eax
140988a9d: e8dee1fbff call 0x140946c80
140988aa2: 84c0 test al, al
140988aa4: 0f8556040000 jne 0x140988f00
140988aaa: 450f57ed xorps xmm13, xmm13
140988aae: 450f28f8 movaps xmm15, xmm8
140988ab2: f3450f58fd addss xmm15, xmm13
140988ab7: f3440f1035e4474105 movss xmm14, dword ptr [rip + 0x54147e4]
140988ac0: f3450f59fe mulss xmm15, xmm14
140988ac5: 0f28c6 movaps xmm0, xmm6
140988ac8: f3410f59c7 mulss xmm0, xmm15
140988acd: f3410f58c4 addss xmm0, xmm12
140988ad2: f3410f12cf movsldup xmm1, xmm15
140988ad7: 0f59cf mulps xmm1, xmm7
140988ada: 410f58ca addps xmm1, xmm10
140988ade: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988ae3: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988ae9: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988aed: 89442458 mov dword ptr [rsp + 0x58], eax
140988af1: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988af6: 4889442450 mov qword ptr [rsp + 0x50], rax
140988afb: 4c8d7c2450 lea r15, [rsp + 0x50]
140988b00: 4c89e9 mov rcx, r13
140988b03: 4c89f2 mov rdx, r14
140988b06: 4d89f8 mov r8, r15
140988b09: e8a2f5d700 call 0x1417080b0
140988b0e: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988b14: 4c8d642430 lea r12, [rsp + 0x30]
140988b19: 4c89e1 mov rcx, r12
140988b1c: 4889f2 mov rdx, rsi
140988b1f: 4989d8 mov r8, rbx
140988b22: 4189c1 mov r9d, eax
140988b25: e856e1fbff call 0x140946c80
140988b2a: 84c0 test al, al
140988b2c: 7579 jne 0x140988ba7
140988b2e: 450f28c7 movaps xmm8, xmm15
140988b32: eb77 jmp 0x140988bab
140988b34: 41c70600000000 mov dword ptr [r14], 0
140988b3b: 0f28b424b0020000 movaps xmm6, xmmword ptr [rsp + 0x2b0]
140988b43: 0f28bc24c0020000 movaps xmm7, xmmword ptr [rsp + 0x2c0]
140988b4b: 440f288424d0020000 movaps xmm8, xmmword ptr [rsp + 0x2d0]
140988b54: 440f288c24e0020000 movaps xmm9, xmmword ptr [rsp + 0x2e0]
140988b5d: 440f289424f0020000 movaps xmm10, xmmword ptr [rsp + 0x2f0]
140988b66: 440f289c2400030000 movaps xmm11, xmmword ptr [rsp + 0x300]
140988b6f: 440f28a42410030000 movaps xmm12, xmmword ptr [rsp + 0x310]
140988b78: 440f28ac2420030000 movaps xmm13, xmmword ptr [rsp + 0x320]
140988b81: 440f28b42430030000 movaps xmm14, xmmword ptr [rsp + 0x330]
140988b8a: 440f28bc2440030000 movaps xmm15, xmmword ptr [rsp + 0x340]
140988b93: 4881c458030000 add rsp, 0x358
140988b9a: 5b pop rbx
140988b9b: 5d pop rbp
140988b9c: 5f pop rdi
140988b9d: 5e pop rsi
140988b9e: 415c pop r12
140988ba0: 415d pop r13
140988ba2: 415e pop r14
140988ba4: 415f pop r15
140988ba6: c3 ret 
140988ba7: 450f28ef movaps xmm13, xmm15
140988bab: 450f28f8 movaps xmm15, xmm8
140988baf: f3450f58fd addss xmm15, xmm13
140988bb4: f3450f59fe mulss xmm15, xmm14
140988bb9: 0f28c6 movaps xmm0, xmm6
140988bbc: f3410f59c7 mulss xmm0, xmm15
140988bc1: f3410f58c4 addss xmm0, xmm12
140988bc6: f3410f12cf movsldup xmm1, xmm15
140988bcb: 0f59cf mulps xmm1, xmm7
140988bce: 410f58ca addps xmm1, xmm10
140988bd2: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988bd7: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988bdd: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988be1: 89442458 mov dword ptr [rsp + 0x58], eax
140988be5: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988bea: 4889442450 mov qword ptr [rsp + 0x50], rax
140988bef: 4c89e9 mov rcx, r13
140988bf2: 4c89f2 mov rdx, r14
140988bf5: 4d89f8 mov r8, r15
140988bf8: e8b3f4d700 call 0x1417080b0
140988bfd: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988c03: 4c89e1 mov rcx, r12
140988c06: 4889f2 mov rdx, rsi
140988c09: 4989d8 mov r8, rbx
140988c0c: 4189c1 mov r9d, eax
140988c0f: e86ce0fbff call 0x140946c80
140988c14: 84c0 test al, al
140988c16: 7506 jne 0x140988c1e
140988c18: 450f28c7 movaps xmm8, xmm15
140988c1c: eb04 jmp 0x140988c22
140988c1e: 450f28ef movaps xmm13, xmm15
140988c22: 450f28f8 movaps xmm15, xmm8
140988c26: f3450f58fd addss xmm15, xmm13
140988c2b: f3450f59fe mulss xmm15, xmm14
140988c30: 0f28c6 movaps xmm0, xmm6
140988c33: f3410f59c7 mulss xmm0, xmm15
140988c38: f3410f58c4 addss xmm0, xmm12
140988c3d: f3410f12cf movsldup xmm1, xmm15
140988c42: 0f59cf mulps xmm1, xmm7
140988c45: 410f58ca addps xmm1, xmm10
140988c49: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988c4e: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988c54: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988c58: 89442458 mov dword ptr [rsp + 0x58], eax
140988c5c: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988c61: 4889442450 mov qword ptr [rsp + 0x50], rax
140988c66: 4c89e9 mov rcx, r13
140988c69: 4c89f2 mov rdx, r14
140988c6c: 4d89f8 mov r8, r15
140988c6f: e83cf4d700 call 0x1417080b0
140988c74: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988c7a: 4c89e1 mov rcx, r12
140988c7d: 4889f2 mov rdx, rsi
140988c80: 4989d8 mov r8, rbx
140988c83: 4189c1 mov r9d, eax
140988c86: e8f5dffbff call 0x140946c80
140988c8b: 84c0 test al, al
140988c8d: 7506 jne 0x140988c95
140988c8f: 450f28c7 movaps xmm8, xmm15
140988c93: eb04 jmp 0x140988c99
140988c95: 450f28ef movaps xmm13, xmm15
140988c99: 450f28f8 movaps xmm15, xmm8
140988c9d: f3450f58fd addss xmm15, xmm13
140988ca2: f3450f59fe mulss xmm15, xmm14
140988ca7: 0f28c6 movaps xmm0, xmm6
140988caa: f3410f59c7 mulss xmm0, xmm15
140988caf: f3410f58c4 addss xmm0, xmm12
140988cb4: f3410f12cf movsldup xmm1, xmm15
140988cb9: 0f59cf mulps xmm1, xmm7
140988cbc: 410f58ca addps xmm1, xmm10
140988cc0: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988cc5: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988ccb: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988ccf: 89442458 mov dword ptr [rsp + 0x58], eax
140988cd3: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988cd8: 4889442450 mov qword ptr [rsp + 0x50], rax
140988cdd: 4c89e9 mov rcx, r13
140988ce0: 4c89f2 mov rdx, r14
140988ce3: 4d89f8 mov r8, r15
140988ce6: e8c5f3d700 call 0x1417080b0
140988ceb: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988cf1: 4c89e1 mov rcx, r12
140988cf4: 4889f2 mov rdx, rsi
140988cf7: 4989d8 mov r8, rbx
140988cfa: 4189c1 mov r9d, eax
140988cfd: e87edffbff call 0x140946c80
140988d02: 84c0 test al, al
140988d04: 7506 jne 0x140988d0c
140988d06: 450f28c7 movaps xmm8, xmm15
140988d0a: eb04 jmp 0x140988d10
140988d0c: 450f28ef movaps xmm13, xmm15
140988d10: 450f28f8 movaps xmm15, xmm8
140988d14: f3450f58fd addss xmm15, xmm13
140988d19: f3450f59fe mulss xmm15, xmm14
140988d1e: 0f28c6 movaps xmm0, xmm6
140988d21: f3410f59c7 mulss xmm0, xmm15
140988d26: f3410f58c4 addss xmm0, xmm12
140988d2b: f3410f12cf movsldup xmm1, xmm15
140988d30: 0f59cf mulps xmm1, xmm7
140988d33: 410f58ca addps xmm1, xmm10
140988d37: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988d3c: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988d42: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988d46: 89442458 mov dword ptr [rsp + 0x58], eax
140988d4a: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988d4f: 4889442450 mov qword ptr [rsp + 0x50], rax
140988d54: 4c89e9 mov rcx, r13
140988d57: 4c89f2 mov rdx, r14
140988d5a: 4d89f8 mov r8, r15
140988d5d: e84ef3d700 call 0x1417080b0
140988d62: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988d68: 4c89e1 mov rcx, r12
140988d6b: 4889f2 mov rdx, rsi
140988d6e: 4989d8 mov r8, rbx
140988d71: 4189c1 mov r9d, eax
140988d74: e807dffbff call 0x140946c80
140988d79: 84c0 test al, al
140988d7b: 7506 jne 0x140988d83
140988d7d: 450f28c7 movaps xmm8, xmm15
140988d81: eb04 jmp 0x140988d87
140988d83: 450f28ef movaps xmm13, xmm15
140988d87: 450f28f8 movaps xmm15, xmm8
140988d8b: f3450f58fd addss xmm15, xmm13
140988d90: f3450f59fe mulss xmm15, xmm14
140988d95: 0f28c6 movaps xmm0, xmm6
140988d98: f3410f59c7 mulss xmm0, xmm15
140988d9d: f3410f58c4 addss xmm0, xmm12
140988da2: f3410f12cf movsldup xmm1, xmm15
140988da7: 0f59cf mulps xmm1, xmm7
140988daa: 410f58ca addps xmm1, xmm10
140988dae: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988db3: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988db9: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988dbd: 89442458 mov dword ptr [rsp + 0x58], eax
140988dc1: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988dc6: 4889442450 mov qword ptr [rsp + 0x50], rax
140988dcb: 4c89e9 mov rcx, r13
140988dce: 4c89f2 mov rdx, r14
140988dd1: 4d89f8 mov r8, r15
140988dd4: e8d7f2d700 call 0x1417080b0
140988dd9: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988ddf: 4c89e1 mov rcx, r12
140988de2: 4889f2 mov rdx, rsi
140988de5: 4989d8 mov r8, rbx
140988de8: 4189c1 mov r9d, eax
140988deb: e890defbff call 0x140946c80
140988df0: 84c0 test al, al
140988df2: 7506 jne 0x140988dfa
140988df4: 450f28c7 movaps xmm8, xmm15
140988df8: eb04 jmp 0x140988dfe
140988dfa: 450f28ef movaps xmm13, xmm15
140988dfe: 450f28f8 movaps xmm15, xmm8
140988e02: f3450f58fd addss xmm15, xmm13
140988e07: f3450f59fe mulss xmm15, xmm14
140988e0c: 0f28c6 movaps xmm0, xmm6
140988e0f: f3410f59c7 mulss xmm0, xmm15
140988e14: f3410f58c4 addss xmm0, xmm12
140988e19: f3410f12cf movsldup xmm1, xmm15
140988e1e: 0f59cf mulps xmm1, xmm7
140988e21: 410f58ca addps xmm1, xmm10
140988e25: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988e2a: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988e30: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988e34: 89442458 mov dword ptr [rsp + 0x58], eax
140988e38: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988e3d: 4889442450 mov qword ptr [rsp + 0x50], rax
140988e42: 4c89e9 mov rcx, r13
140988e45: 4c89f2 mov rdx, r14
140988e48: 4d89f8 mov r8, r15
140988e4b: e860f2d700 call 0x1417080b0
140988e50: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988e56: 4c89e1 mov rcx, r12
140988e59: 4889f2 mov rdx, rsi
140988e5c: 4989d8 mov r8, rbx
140988e5f: 4189c1 mov r9d, eax
140988e62: e819defbff call 0x140946c80
140988e67: 84c0 test al, al
140988e69: 7506 jne 0x140988e71
140988e6b: 450f28c7 movaps xmm8, xmm15
140988e6f: eb04 jmp 0x140988e75
140988e71: 450f28ef movaps xmm13, xmm15
140988e75: f3450f58c5 addss xmm8, xmm13
140988e7a: f3450f59c6 mulss xmm8, xmm14
140988e7f: 0f28c6 movaps xmm0, xmm6
140988e82: f3410f59c0 mulss xmm0, xmm8
140988e87: f3410f58c4 addss xmm0, xmm12
140988e8c: f3410f12c8 movsldup xmm1, xmm8
140988e91: 0f59cf mulps xmm1, xmm7
140988e94: 410f58ca addps xmm1, xmm10
140988e98: 0f134c2430 movlps qword ptr [rsp + 0x30], xmm1
140988e9d: f30f11442438 movss dword ptr [rsp + 0x38], xmm0
140988ea3: 8b442438 mov eax, dword ptr [rsp + 0x38]
140988ea7: 89442458 mov dword ptr [rsp + 0x58], eax
140988eab: 488b442430 mov rax, qword ptr [rsp + 0x30]
140988eb0: 4889442450 mov qword ptr [rsp + 0x50], rax
140988eb5: 4c89e9 mov rcx, r13
140988eb8: 4c89f2 mov rdx, r14
140988ebb: 4d89f8 mov r8, r15
140988ebe: e8edf1d700 call 0x1417080b0
140988ec3: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140988ec9: 4c89e1 mov rcx, r12
140988ecc: 4889f2 mov rdx, rsi
140988ecf: 4989d8 mov r8, rbx
140988ed2: 4189c1 mov r9d, eax
140988ed5: e8a6ddfbff call 0x140946c80
140988eda: 84c0 test al, al
140988edc: 7504 jne 0x140988ee2
140988ede: 450f28c5 movaps xmm8, xmm13
140988ee2: f3410f12c0 movsldup xmm0, xmm8
140988ee7: 0f59f8 mulps xmm7, xmm0
140988eea: f3410f59f0 mulss xmm6, xmm8
140988eef: 440f58d7 addps xmm10, xmm7
140988ef3: f3440f58e6 addss xmm12, xmm6
140988ef8: 450f28f4 movaps xmm14, xmm12
140988efc: 450f28ea movaps xmm13, xmm10
140988f00: f30f10442448 movss xmm0, dword ptr [rsp + 0x48]
140988f06: f3440f5ec8 divss xmm9, xmm0
140988f0b: f30f12c0 movsldup xmm0, xmm0
140988f0f: 440f5ed8 divps xmm11, xmm0
140988f13: 440f135c2430 movlps qword ptr [rsp + 0x30], xmm11
140988f19: f3440f114c2438 movss dword ptr [rsp + 0x38], xmm9
140988f20: 488d4c2450 lea rcx, [rsp + 0x50]
140988f25: 488d542430 lea rdx, [rsp + 0x30]
140988f2a: 4c8d8424b0000000 lea r8, [rsp + 0xb0]
140988f32: e8e90f6704 call 0x144ff9f20
140988f37: 0f284c2450 movaps xmm1, xmmword ptr [rsp + 0x50]
140988f3c: 0f2807 movaps xmm0, xmmword ptr [rdi]
140988f3f: 0f28d1 movaps xmm2, xmm1
140988f42: 0fc6d100 shufps xmm2, xmm1, 0
140988f46: 0f28d9 movaps xmm3, xmm1
140988f49: 0fc6d955 shufps xmm3, xmm1, 0x55
140988f4d: 0f28e1 movaps xmm4, xmm1
140988f50: 0fc6e1aa shufps xmm4, xmm1, 0xaa
140988f54: 0fc6c9ff shufps xmm1, xmm1, 0xff
140988f58: 0f59c8 mulps xmm1, xmm0
140988f5b: 0f28e8 movaps xmm5, xmm0
140988f5e: 0fc6e81b shufps xmm5, xmm0, 0x1b
140988f62: 0f59ea mulps xmm5, xmm2
140988f65: 0f28d0 movaps xmm2, xmm0
140988f68: 0fc6d04e shufps xmm2, xmm0, 0x4e
140988f6c: 0f59d3 mulps xmm2, xmm3
140988f6f: 0f592dfa7c5405 mulps xmm5, xmmword ptr [rip + 0x5547cfa]
140988f76: 0f58e9 addps xmm5, xmm1
140988f79: 0fc6c0b1 shufps xmm0, xmm0, 0xb1
140988f7d: 0f59c4 mulps xmm0, xmm4
140988f80: 0f5915f97c5405 mulps xmm2, xmmword ptr [rip + 0x5547cf9]
140988f87: 0f5905027d5405 mulps xmm0, xmmword ptr [rip + 0x5547d02]
140988f8e: 0f58c2 addps xmm0, xmm2
140988f91: 0f58c5 addps xmm0, xmm5
140988f94: 0f2907 movaps xmmword ptr [rdi], xmm0
140988f97: 8b842494000000 mov eax, dword ptr [rsp + 0x94]
140988f9e: 894500 mov dword ptr [rbp], eax
140988fa1: 440f136f10 movlps qword ptr [rdi + 0x10], xmm13
140988fa6: f3440f117718 movss dword ptr [rdi + 0x18], xmm14
140988fac: e98afbffff jmp 0x140988b3b
140988fb1: 488d4c2430 lea rcx, [rsp + 0x30]
140988fb6: ba0a000000 mov edx, 0xa
140988fbb: e8f081faff call 0x1409311b0
140988fc0: f3440f1044244c movss xmm8, dword ptr [rsp + 0x4c]
140988fc7: a801 test al, 1
140988fc9: 7408 je 0x140988fd3
140988fcb: 0f28f8 movaps xmm7, xmm0
140988fce: e998f8ffff jmp 0x14098886b
140988fd3: f30f103d55785405 movss xmm7, dword ptr [rip + 0x5547855]
140988fdb: f3410f5cf8 subss xmm7, xmm8
140988fe0: e986f8ffff jmp 0x14098886b

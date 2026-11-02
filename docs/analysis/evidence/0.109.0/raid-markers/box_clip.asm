1415ed280: 4157 push r15
1415ed282: 4156 push r14
1415ed284: 4155 push r13
1415ed286: 4154 push r12
1415ed288: 56 push rsi
1415ed289: 57 push rdi
1415ed28a: 55 push rbp
1415ed28b: 53 push rbx
1415ed28c: 4881ece8020000 sub rsp, 0x2e8
1415ed293: 440f299c24d0020000 movaps xmmword ptr [rsp + 0x2d0], xmm11
1415ed29c: 440f299424c0020000 movaps xmmword ptr [rsp + 0x2c0], xmm10
1415ed2a5: 440f298c24b0020000 movaps xmmword ptr [rsp + 0x2b0], xmm9
1415ed2ae: 440f298424a0020000 movaps xmmword ptr [rsp + 0x2a0], xmm8
1415ed2b7: 0f29bc2490020000 movaps xmmword ptr [rsp + 0x290], xmm7
1415ed2bf: 0f29b42480020000 movaps xmmword ptr [rsp + 0x280], xmm6
1415ed2c7: 48898c24c8000000 mov qword ptr [rsp + 0xc8], rcx
1415ed2cf: 4c898424b0010000 mov qword ptr [rsp + 0x1b0], r8
1415ed2d7: 4c898424b8010000 mov qword ptr [rsp + 0x1b8], r8
1415ed2df: 4c898424d0010000 mov qword ptr [rsp + 0x1d0], r8
1415ed2e7: 488d8424b0010000 lea rax, [rsp + 0x1b0]
1415ed2ef: 48898424d8010000 mov qword ptr [rsp + 0x1d8], rax
1415ed2f7: 48898424e0010000 mov qword ptr [rsp + 0x1e0], rax
1415ed2ff: 4c898424e8010000 mov qword ptr [rsp + 0x1e8], r8
1415ed307: 4c898424f0010000 mov qword ptr [rsp + 0x1f0], r8
1415ed30f: 488d8424b8010000 lea rax, [rsp + 0x1b8]
1415ed317: 48898424f8010000 mov qword ptr [rsp + 0x1f8], rax
1415ed31f: 4889842400020000 mov qword ptr [rsp + 0x200], rax
1415ed327: 4c89842408020000 mov qword ptr [rsp + 0x208], r8
1415ed32f: 4c898424c0010000 mov qword ptr [rsp + 0x1c0], r8
1415ed337: 4c898424c8010000 mov qword ptr [rsp + 0x1c8], r8
1415ed33f: 0f57c0 xorps xmm0, xmm0
1415ed342: 0f1184242c010000 movups xmmword ptr [rsp + 0x12c], xmm0
1415ed34a: 0f29842420010000 movaps xmmword ptr [rsp + 0x120], xmm0
1415ed352: 0f29842410010000 movaps xmmword ptr [rsp + 0x110], xmm0
1415ed35a: 0f29842400010000 movaps xmmword ptr [rsp + 0x100], xmm0
1415ed362: 0f298424f0000000 movaps xmmword ptr [rsp + 0xf0], xmm0
1415ed36a: 0f298424e0000000 movaps xmmword ptr [rsp + 0xe0], xmm0
1415ed372: 0f298424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm0
1415ed37a: 0f11442464 movups xmmword ptr [rsp + 0x64], xmm0
1415ed37f: 0f11442474 movups xmmword ptr [rsp + 0x74], xmm0
1415ed384: 0f11842484000000 movups xmmword ptr [rsp + 0x84], xmm0
1415ed38c: 0f11842494000000 movups xmmword ptr [rsp + 0x94], xmm0
1415ed394: 48c78424a400000000000000 mov qword ptr [rsp + 0xa4], 0
1415ed3a0: 0f1002 movups xmm0, xmmword ptr [rdx]
1415ed3a3: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
1415ed3a7: 0f29442440 movaps xmmword ptr [rsp + 0x40], xmm0
1415ed3ac: 0f294c2450 movaps xmmword ptr [rsp + 0x50], xmm1
1415ed3b1: 8b4220 mov eax, dword ptr [rdx + 0x20]
1415ed3b4: 89442460 mov dword ptr [rsp + 0x60], eax
1415ed3b8: 488d8424d0010000 lea rax, [rsp + 0x1d0]
1415ed3c0: 4889842420020000 mov qword ptr [rsp + 0x220], rax
1415ed3c8: 488d051108a904 lea rax, [rip + 0x4a90811]
1415ed3cf: 4889842428020000 mov qword ptr [rsp + 0x228], rax
1415ed3d7: 488d8424e0010000 lea rax, [rsp + 0x1e0]
1415ed3df: 4889842430020000 mov qword ptr [rsp + 0x230], rax
1415ed3e7: 488d052208a904 lea rax, [rip + 0x4a90822]
1415ed3ee: 4889842438020000 mov qword ptr [rsp + 0x238], rax
1415ed3f6: 488d8424f0010000 lea rax, [rsp + 0x1f0]
1415ed3fe: 4889842440020000 mov qword ptr [rsp + 0x240], rax
1415ed406: 488d053308a904 lea rax, [rip + 0x4a90833]
1415ed40d: 4889842448020000 mov qword ptr [rsp + 0x248], rax
1415ed415: 488d842400020000 lea rax, [rsp + 0x200]
1415ed41d: 4889842450020000 mov qword ptr [rsp + 0x250], rax
1415ed425: 488d054408a904 lea rax, [rip + 0x4a90844]
1415ed42c: 4889842458020000 mov qword ptr [rsp + 0x258], rax
1415ed434: 488d8424c0010000 lea rax, [rsp + 0x1c0]
1415ed43c: 4889842460020000 mov qword ptr [rsp + 0x260], rax
1415ed444: 488d055508a904 lea rax, [rip + 0x4a90855]
1415ed44b: 4889842468020000 mov qword ptr [rsp + 0x268], rax
1415ed453: 488d8424c8010000 lea rax, [rsp + 0x1c8]
1415ed45b: 4889842470020000 mov qword ptr [rsp + 0x270], rax
1415ed463: 488d056608a904 lea rax, [rip + 0x4a90866]
1415ed46a: 4889842478020000 mov qword ptr [rsp + 0x278], rax
1415ed472: 488b442440 mov rax, qword ptr [rsp + 0x40]
1415ed477: 4889442420 mov qword ptr [rsp + 0x20], rax
1415ed47c: 488b442448 mov rax, qword ptr [rsp + 0x48]
1415ed481: 4889442428 mov qword ptr [rsp + 0x28], rax
1415ed486: 4c8b442450 mov r8, qword ptr [rsp + 0x50]
1415ed48b: 4c8b4c2458 mov r9, qword ptr [rsp + 0x58]
1415ed490: 488b442460 mov rax, qword ptr [rsp + 0x60]
1415ed495: 4889442430 mov qword ptr [rsp + 0x30], rax
1415ed49a: bf03000000 mov edi, 3
1415ed49f: 4531d2 xor r10d, r10d
1415ed4a2: 0f57ff xorps xmm7, xmm7
1415ed4a5: 31c0 xor eax, eax
1415ed4a7: 31ed xor ebp, ebp
1415ed4a9: 4531e4 xor r12d, r12d
1415ed4ac: 4531ff xor r15d, r15d
1415ed4af: 4531f6 xor r14d, r14d
1415ed4b2: 31db xor ebx, ebx
1415ed4b4: 31f6 xor esi, esi
1415ed4b6: 4531db xor r11d, r11d
1415ed4b9: 31c9 xor ecx, ecx
1415ed4bb: 0f1f440000 nop dword ptr [rax + rax]
1415ed4c0: 4989fd mov r13, rdi
1415ed4c3: 4c899c2470010000 mov qword ptr [rsp + 0x170], r11
1415ed4cb: 4889b42478010000 mov qword ptr [rsp + 0x178], rsi
1415ed4d3: 48899c2480010000 mov qword ptr [rsp + 0x180], rbx
1415ed4db: 4c89b42488010000 mov qword ptr [rsp + 0x188], r14
1415ed4e3: 4c89bc2490010000 mov qword ptr [rsp + 0x190], r15
1415ed4eb: 4c89a42498010000 mov qword ptr [rsp + 0x198], r12
1415ed4f3: 4889ac24a0010000 mov qword ptr [rsp + 0x1a0], rbp
1415ed4fb: 48898424a8010000 mov qword ptr [rsp + 0x1a8], rax
1415ed503: 448954243c mov dword ptr [rsp + 0x3c], r10d
1415ed508: 488b442420 mov rax, qword ptr [rsp + 0x20]
1415ed50d: 4889842450010000 mov qword ptr [rsp + 0x150], rax
1415ed515: 488b442428 mov rax, qword ptr [rsp + 0x28]
1415ed51a: 4889842458010000 mov qword ptr [rsp + 0x158], rax
1415ed522: 4c89842460010000 mov qword ptr [rsp + 0x160], r8
1415ed52a: 4c898c2468010000 mov qword ptr [rsp + 0x168], r9
1415ed532: 488b442430 mov rax, qword ptr [rsp + 0x30]
1415ed537: 4889442428 mov qword ptr [rsp + 0x28], rax
1415ed53c: 488d4101 lea rax, [rcx + 1]
1415ed540: 4889842448010000 mov qword ptr [rsp + 0x148], rax
1415ed548: 48c1e104 shl rcx, 4
1415ed54c: 488d842420020000 lea rax, [rsp + 0x220]
1415ed554: 4c8b3408 mov r14, qword ptr [rax + rcx]
1415ed558: 488b440808 mov rax, qword ptr [rax + rcx + 8]
1415ed55d: 4889442420 mov qword ptr [rsp + 0x20], rax
1415ed562: 4889f8 mov rax, rdi
1415ed565: 48f7d8 neg rax
1415ed568: 4889442430 mov qword ptr [rsp + 0x30], rax
1415ed56d: bd01000000 mov ebp, 1
1415ed572: 41bf01000000 mov r15d, 1
1415ed578: 488d5c2448 lea rbx, [rsp + 0x48]
1415ed57d: 31ff xor edi, edi
1415ed57f: e984000000 jmp 0x1415ed608
1415ed584: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1415ed590: 4883ff09 cmp rdi, 9
1415ed594: 0f8350040000 jae 0x1415ed9ea
1415ed59a: f3450f5cd1 subss xmm10, xmm9
1415ed59f: 0f28ce movaps xmm1, xmm6
1415ed5a2: f30f5cc8 subss xmm1, xmm0
1415ed5a6: f30f5ef1 divss xmm6, xmm1
1415ed5aa: f3440f59d6 mulss xmm10, xmm6
1415ed5af: f3450f58d1 addss xmm10, xmm9
1415ed5b4: 450f5cd8 subps xmm11, xmm8
1415ed5b8: 488d047f lea rax, [rdi + rdi*2]
1415ed5bc: f30f12c6 movsldup xmm0, xmm6
1415ed5c0: 410f59c3 mulps xmm0, xmm11
1415ed5c4: 410f58c0 addps xmm0, xmm8
1415ed5c8: 0f138484d0000000 movlps qword ptr [rsp + rax*4 + 0xd0], xmm0
1415ed5d0: f3440f119484d8000000 movss dword ptr [rsp + rax*4 + 0xd8], xmm10
1415ed5da: 48ffc7 inc rdi
1415ed5dd: 4883c30c add rbx, 0xc
1415ed5e1: 48ffc5 inc rbp
1415ed5e4: 4c39ed cmp rbp, r13
1415ed5e7: b800000000 mov eax, 0
1415ed5ec: 480f44e8 cmove rbp, rax
1415ed5f0: 488b442430 mov rax, qword ptr [rsp + 0x30]
1415ed5f5: 4c01f8 add rax, r15
1415ed5f8: 48ffc0 inc rax
1415ed5fb: 49ffc7 inc r15
1415ed5fe: 4883f801 cmp rax, 1
1415ed602: 0f8408010000 je 0x1415ed710
1415ed608: 4983ff0a cmp r15, 0xa
1415ed60c: 0f84ad030000 je 0x1415ed9bf
1415ed612: f2440f1043f8 movsd xmm8, qword ptr [rbx - 8]
1415ed618: f3440f100b movss xmm9, dword ptr [rbx]
1415ed61d: 4c89f8 mov rax, r15
1415ed620: 4c09e8 or rax, r13
1415ed623: 48c1e820 shr rax, 0x20
1415ed627: 7417 je 0x1415ed640
1415ed629: 4889e9 mov rcx, rbp
1415ed62c: 4883f909 cmp rcx, 9
1415ed630: 7222 jb 0x1415ed654
1415ed632: e9a0030000 jmp 0x1415ed9d7
1415ed637: 660f1f840000000000 nop word ptr [rax + rax]
1415ed640: 4489f8 mov eax, r15d
1415ed643: 31d2 xor edx, edx
1415ed645: 41f7f5 div r13d
1415ed648: 89d1 mov ecx, edx
1415ed64a: 4883f909 cmp rcx, 9
1415ed64e: 0f8383030000 jae 0x1415ed9d7
1415ed654: 488d0449 lea rax, [rcx + rcx*2]
1415ed658: f2440f105c8440 movsd xmm11, qword ptr [rsp + rax*4 + 0x40]
1415ed65f: f3440f10548448 movss xmm10, dword ptr [rsp + rax*4 + 0x48]
1415ed666: 440f138424b8000000 movlps qword ptr [rsp + 0xb8], xmm8
1415ed66f: f3440f118c24c0000000 movss dword ptr [rsp + 0xc0], xmm9
1415ed679: 488b442420 mov rax, qword ptr [rsp + 0x20]
1415ed67e: 4c8b6028 mov r12, qword ptr [rax + 0x28]
1415ed682: 4c89f1 mov rcx, r14
1415ed685: 488db424b8000000 lea rsi, [rsp + 0xb8]
1415ed68d: 4889f2 mov rdx, rsi
1415ed690: 41ffd4 call r12
1415ed693: 0f28f0 movaps xmm6, xmm0
1415ed696: f2440f119c24b8000000 movsd qword ptr [rsp + 0xb8], xmm11
1415ed6a0: f3440f119424c0000000 movss dword ptr [rsp + 0xc0], xmm10
1415ed6aa: 4c89f1 mov rcx, r14
1415ed6ad: 4889f2 mov rdx, rsi
1415ed6b0: 41ffd4 call r12
1415ed6b3: 0f2ef7 ucomiss xmm6, xmm7
1415ed6b6: 7318 jae 0x1415ed6d0
1415ed6b8: 0f2ec7 ucomiss xmm0, xmm7
1415ed6bb: 0f83cffeffff jae 0x1415ed590
1415ed6c1: e917ffffff jmp 0x1415ed5dd
1415ed6c6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1415ed6d0: 4883ff09 cmp rdi, 9
1415ed6d4: 0f8326030000 jae 0x1415eda00
1415ed6da: 488d047f lea rax, [rdi + rdi*2]
1415ed6de: 440f138484d0000000 movlps qword ptr [rsp + rax*4 + 0xd0], xmm8
1415ed6e7: f3440f118c84d8000000 movss dword ptr [rsp + rax*4 + 0xd8], xmm9
1415ed6f1: 48ffc7 inc rdi
1415ed6f4: 0f2ec7 ucomiss xmm0, xmm7
1415ed6f7: 0f8293feffff jb 0x1415ed590
1415ed6fd: e9dbfeffff jmp 0x1415ed5dd
1415ed702: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1415ed710: 488b8424d0000000 mov rax, qword ptr [rsp + 0xd0]
1415ed718: 4889442420 mov qword ptr [rsp + 0x20], rax
1415ed71d: 4c8b8424d8000000 mov r8, qword ptr [rsp + 0xd8]
1415ed725: 488b842450010000 mov rax, qword ptr [rsp + 0x150]
1415ed72d: 48898424d0000000 mov qword ptr [rsp + 0xd0], rax
1415ed735: 488b842458010000 mov rax, qword ptr [rsp + 0x158]
1415ed73d: 48898424d8000000 mov qword ptr [rsp + 0xd8], rax
1415ed745: 4c8b8c24e0000000 mov r9, qword ptr [rsp + 0xe0]
1415ed74d: 488b842460010000 mov rax, qword ptr [rsp + 0x160]
1415ed755: 48898424e0000000 mov qword ptr [rsp + 0xe0], rax
1415ed75d: 488b9424e8000000 mov rdx, qword ptr [rsp + 0xe8]
1415ed765: 488b842468010000 mov rax, qword ptr [rsp + 0x168]
1415ed76d: 48898424e8000000 mov qword ptr [rsp + 0xe8], rax
1415ed775: 4c8bac24f0000000 mov r13, qword ptr [rsp + 0xf0]
1415ed77d: 488b442428 mov rax, qword ptr [rsp + 0x28]
1415ed782: 48898424f0000000 mov qword ptr [rsp + 0xf0], rax
1415ed78a: 4c8b9c24f8000000 mov r11, qword ptr [rsp + 0xf8]
1415ed792: 488b842470010000 mov rax, qword ptr [rsp + 0x170]
1415ed79a: 48898424f8000000 mov qword ptr [rsp + 0xf8], rax
1415ed7a2: 488bb42400010000 mov rsi, qword ptr [rsp + 0x100]
1415ed7aa: 488b842478010000 mov rax, qword ptr [rsp + 0x178]
1415ed7b2: 4889842400010000 mov qword ptr [rsp + 0x100], rax
1415ed7ba: 488b9c2408010000 mov rbx, qword ptr [rsp + 0x108]
1415ed7c2: 488b842480010000 mov rax, qword ptr [rsp + 0x180]
1415ed7ca: 4889842408010000 mov qword ptr [rsp + 0x108], rax
1415ed7d2: 4c8bb42410010000 mov r14, qword ptr [rsp + 0x110]
1415ed7da: 488b842488010000 mov rax, qword ptr [rsp + 0x188]
1415ed7e2: 4889842410010000 mov qword ptr [rsp + 0x110], rax
1415ed7ea: 4c8bbc2418010000 mov r15, qword ptr [rsp + 0x118]
1415ed7f2: 488b842490010000 mov rax, qword ptr [rsp + 0x190]
1415ed7fa: 4889842418010000 mov qword ptr [rsp + 0x118], rax
1415ed802: 4c8ba42420010000 mov r12, qword ptr [rsp + 0x120]
1415ed80a: 488b842498010000 mov rax, qword ptr [rsp + 0x198]
1415ed812: 4889842420010000 mov qword ptr [rsp + 0x120], rax
1415ed81a: 488bac2428010000 mov rbp, qword ptr [rsp + 0x128]
1415ed822: 488b8424a0010000 mov rax, qword ptr [rsp + 0x1a0]
1415ed82a: 4889842428010000 mov qword ptr [rsp + 0x128], rax
1415ed832: 488b842430010000 mov rax, qword ptr [rsp + 0x130]
1415ed83a: 488b8c24a8010000 mov rcx, qword ptr [rsp + 0x1a8]
1415ed842: 48898c2430010000 mov qword ptr [rsp + 0x130], rcx
1415ed84a: 448b942438010000 mov r10d, dword ptr [rsp + 0x138]
1415ed852: 8b4c243c mov ecx, dword ptr [rsp + 0x3c]
1415ed856: 898c2438010000 mov dword ptr [rsp + 0x138], ecx
1415ed85d: 488b4c2420 mov rcx, qword ptr [rsp + 0x20]
1415ed862: 48894c2440 mov qword ptr [rsp + 0x40], rcx
1415ed867: 4c89442428 mov qword ptr [rsp + 0x28], r8
1415ed86c: 4c89442448 mov qword ptr [rsp + 0x48], r8
1415ed871: 4c894c2450 mov qword ptr [rsp + 0x50], r9
1415ed876: 4889542458 mov qword ptr [rsp + 0x58], rdx
1415ed87b: 4c896c2430 mov qword ptr [rsp + 0x30], r13
1415ed880: 4c896c2460 mov qword ptr [rsp + 0x60], r13
1415ed885: 4c895c2468 mov qword ptr [rsp + 0x68], r11
1415ed88a: 4889742470 mov qword ptr [rsp + 0x70], rsi
1415ed88f: 48895c2478 mov qword ptr [rsp + 0x78], rbx
1415ed894: 4c89b42480000000 mov qword ptr [rsp + 0x80], r14
1415ed89c: 4c89bc2488000000 mov qword ptr [rsp + 0x88], r15
1415ed8a4: 4c89a42490000000 mov qword ptr [rsp + 0x90], r12
1415ed8ac: 4889ac2498000000 mov qword ptr [rsp + 0x98], rbp
1415ed8b4: 48898424a0000000 mov qword ptr [rsp + 0xa0], rax
1415ed8bc: 44899424a8000000 mov dword ptr [rsp + 0xa8], r10d
1415ed8c4: 4883ff03 cmp rdi, 3
1415ed8c8: 723a jb 0x1415ed904
1415ed8ca: 4d89c8 mov r8, r9
1415ed8cd: 4989d1 mov r9, rdx
1415ed8d0: 488b8c2448010000 mov rcx, qword ptr [rsp + 0x148]
1415ed8d8: 4883f906 cmp rcx, 6
1415ed8dc: 0f85defbffff jne 0x1415ed4c0
1415ed8e2: 0f1084249c000000 movups xmm0, xmmword ptr [rsp + 0x9c]
1415ed8ea: 488b8424c8000000 mov rax, qword ptr [rsp + 0xc8]
1415ed8f2: 0f11405c movups xmmword ptr [rax + 0x5c], xmm0
1415ed8f6: 0f28842490000000 movaps xmm0, xmmword ptr [rsp + 0x90]
1415ed8fe: 0f114050 movups xmmword ptr [rax + 0x50], xmm0
1415ed902: eb40 jmp 0x1415ed944
1415ed904: 8b8c249c000000 mov ecx, dword ptr [rsp + 0x9c]
1415ed90b: 488b8424c8000000 mov rax, qword ptr [rsp + 0xc8]
1415ed913: 89485c mov dword ptr [rax + 0x5c], ecx
1415ed916: 488b8c24a0000000 mov rcx, qword ptr [rsp + 0xa0]
1415ed91e: 48894860 mov qword ptr [rax + 0x60], rcx
1415ed922: 8b8c24a8000000 mov ecx, dword ptr [rsp + 0xa8]
1415ed929: 894868 mov dword ptr [rax + 0x68], ecx
1415ed92c: 488b8c2490000000 mov rcx, qword ptr [rsp + 0x90]
1415ed934: 48894850 mov qword ptr [rax + 0x50], rcx
1415ed938: 488b8c2498000000 mov rcx, qword ptr [rsp + 0x98]
1415ed940: 48894858 mov qword ptr [rax + 0x58], rcx
1415ed944: 0f28842480000000 movaps xmm0, xmmword ptr [rsp + 0x80]
1415ed94c: 0f114040 movups xmmword ptr [rax + 0x40], xmm0
1415ed950: 0f28442440 movaps xmm0, xmmword ptr [rsp + 0x40]
1415ed955: 0f284c2450 movaps xmm1, xmmword ptr [rsp + 0x50]
1415ed95a: 0f28542460 movaps xmm2, xmmword ptr [rsp + 0x60]
1415ed95f: 0f285c2470 movaps xmm3, xmmword ptr [rsp + 0x70]
1415ed964: 0f115830 movups xmmword ptr [rax + 0x30], xmm3
1415ed968: 0f115020 movups xmmword ptr [rax + 0x20], xmm2
1415ed96c: 0f114810 movups xmmword ptr [rax + 0x10], xmm1
1415ed970: 0f1100 movups xmmword ptr [rax], xmm0
1415ed973: 48897870 mov qword ptr [rax + 0x70], rdi
1415ed977: 0f28b42480020000 movaps xmm6, xmmword ptr [rsp + 0x280]
1415ed97f: 0f28bc2490020000 movaps xmm7, xmmword ptr [rsp + 0x290]
1415ed987: 440f288424a0020000 movaps xmm8, xmmword ptr [rsp + 0x2a0]
1415ed990: 440f288c24b0020000 movaps xmm9, xmmword ptr [rsp + 0x2b0]
1415ed999: 440f289424c0020000 movaps xmm10, xmmword ptr [rsp + 0x2c0]
1415ed9a2: 440f289c24d0020000 movaps xmm11, xmmword ptr [rsp + 0x2d0]
1415ed9ab: 4881c4e8020000 add rsp, 0x2e8
1415ed9b2: 5b pop rbx
1415ed9b3: 5d pop rbp
1415ed9b4: 5f pop rdi
1415ed9b5: 5e pop rsi
1415ed9b6: 415c pop r12
1415ed9b8: 415d pop r13
1415ed9ba: 415e pop r14
1415ed9bc: 415f pop r15
1415ed9be: c3 ret
1415ed9bf: 4c8d053a03a904 lea r8, [rip + 0x4a9033a]
1415ed9c6: b909000000 mov ecx, 9
1415ed9cb: ba09000000 mov edx, 9
1415ed9d0: e87ebc7a04 call 0x145d99653
1415ed9d5: 0f0b ud2
1415ed9d7: 4c8d053a03a904 lea r8, [rip + 0x4a9033a]
1415ed9de: ba09000000 mov edx, 9
1415ed9e3: e86bbc7a04 call 0x145d99653
1415ed9e8: 0f0b ud2
1415ed9ea: 4c8d055703a904 lea r8, [rip + 0x4a90357]
1415ed9f1: ba09000000 mov edx, 9
1415ed9f6: 4889f9 mov rcx, rdi
1415ed9f9: e855bc7a04 call 0x145d99653
1415ed9fe: 0f0b ud2
1415eda00: 4c8d052903a904 lea r8, [rip + 0x4a90329]
1415eda07: ba09000000 mov edx, 9
1415eda0c: 4889f9 mov rcx, rdi
1415eda0f: e83fbc7a04 call 0x145d99653
1415eda14: 0f0b ud2

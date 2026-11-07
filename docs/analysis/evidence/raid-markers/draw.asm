140164000: 55 push rbp
140164001: 4157 push r15
140164003: 4156 push r14
140164005: 4155 push r13
140164007: 4154 push r12
140164009: 56 push rsi
14016400a: 57 push rdi
14016400b: 53 push rbx
14016400c: 4881ece8030000 sub rsp, 0x3e8
140164013: 488dac2480000000 lea rbp, [rsp + 0x80]
14016401b: 440f29bd50030000 movaps xmmword ptr [rbp + 0x350], xmm15
140164023: 440f29b540030000 movaps xmmword ptr [rbp + 0x340], xmm14
14016402b: 440f29ad30030000 movaps xmmword ptr [rbp + 0x330], xmm13
140164033: 440f29a520030000 movaps xmmword ptr [rbp + 0x320], xmm12
14016403b: 440f299d10030000 movaps xmmword ptr [rbp + 0x310], xmm11
140164043: 440f299500030000 movaps xmmword ptr [rbp + 0x300], xmm10
14016404b: 440f298df0020000 movaps xmmword ptr [rbp + 0x2f0], xmm9
140164053: 440f2985e0020000 movaps xmmword ptr [rbp + 0x2e0], xmm8
14016405b: 0f29bdd0020000 movaps xmmword ptr [rbp + 0x2d0], xmm7
140164062: 0f29b5c0020000 movaps xmmword ptr [rbp + 0x2c0], xmm6
140164069: 48c785b8020000feffffff mov qword ptr [rbp + 0x2b8], 0xfffffffffffffffe
140164074: 488b85d8030000 mov rax, qword ptr [rbp + 0x3d8]
14016407b: 488b8dd0030000 mov rcx, qword ptr [rbp + 0x3d0]
140164082: 0f1002 movups xmm0, xmmword ptr [rdx]
140164085: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140164089: 0f298d30010000 movaps xmmword ptr [rbp + 0x130], xmm1
140164090: 0f298520010000 movaps xmmword ptr [rbp + 0x120], xmm0
140164097: 410f1000 movups xmm0, xmmword ptr [r8]
14016409b: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
1401640a0: 0f298d50010000 movaps xmmword ptr [rbp + 0x150], xmm1
1401640a7: 0f298540010000 movaps xmmword ptr [rbp + 0x140], xmm0
1401640ae: 498b5110 mov rdx, qword ptr [r9 + 0x10]
1401640b2: 48899570010000 mov qword ptr [rbp + 0x170], rdx
1401640b9: 410f1001 movups xmm0, xmmword ptr [r9]
1401640bd: 0f298560010000 movaps xmmword ptr [rbp + 0x160], xmm0
1401640c4: 0f1001 movups xmm0, xmmword ptr [rcx]
1401640c7: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
1401640cb: 0f118d88010000 movups xmmword ptr [rbp + 0x188], xmm1
1401640d2: 0f118578010000 movups xmmword ptr [rbp + 0x178], xmm0
1401640d9: f30f6f00 movdqu xmm0, xmmword ptr [rax]
1401640dd: f30f6f4810 movdqu xmm1, xmmword ptr [rax + 0x10]
1401640e2: f30f7f8598010000 movdqu xmmword ptr [rbp + 0x198], xmm0
1401640ea: f30f7f8da8010000 movdqu xmmword ptr [rbp + 0x1a8], xmm1
1401640f2: 4c8b8560010000 mov r8, qword ptr [rbp + 0x160]
1401640f9: 488b8568010000 mov rax, qword ptr [rbp + 0x168]
140164100: 498b90f8000000 mov rdx, qword ptr [r8 + 0xf8]
140164107: 498b8800010000 mov rcx, qword ptr [r8 + 0x100]
14016410e: 488d0c8a lea rcx, [rdx + rcx*4]
140164112: 410fb69808010000 movzx ebx, byte ptr [r8 + 0x108]
14016411a: 84db test bl, bl
14016411c: 7410 je 0x14016412e
14016411e: bf08000000 mov edi, 8
140164123: 4531c9 xor r9d, r9d
140164126: 4531d2 xor r10d, r10d
140164129: 4531c0 xor r8d, r8d
14016412c: eb4a jmp 0x140164178
14016412e: be08000000 mov esi, 8
140164133: 4531c9 xor r9d, r9d
140164136: 4531d2 xor r10d, r10d
140164139: 4531c0 xor r8d, r8d
14016413c: e99a000000 jmp 0x1401641db
140164141: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140164150: 4d8d04f2 lea r8, [r10 + rsi*8]
140164154: 498b7808 mov rdi, qword ptr [r8 + 8]
140164158: 4531d2 xor r10d, r10d
14016415b: 4589d9 mov r9d, r11d
14016415e: 4589d0 mov r8d, r10d
140164161: 41ffc2 inc r10d
140164164: 4e8b1cc7 mov r11, qword ptr [rdi + r8*8]
140164168: 4d89d8 mov r8, r11
14016416b: 49c1e820 shr r8, 0x20
14016416f: 4585db test r11d, r11d
140164172: 0f855c100000 jne 0x1401651d4
140164178: 4539ca cmp r10d, r9d
14016417b: 75e1 jne 0x14016415e
14016417d: 0f1f00 nop dword ptr [rax]
140164180: 4839ca cmp rdx, rcx
140164183: 741e je 0x1401641a3
140164185: 448b1a mov r11d, dword ptr [rdx]
140164188: 4883c204 add rdx, 4
14016418c: 4c8b90a8010000 mov r10, qword ptr [rax + 0x1a8]
140164193: 4b8d34db lea rsi, [r11 + r11*8]
140164197: 4d8b5cf210 mov r11, qword ptr [r10 + rsi*8 + 0x10]
14016419c: 4d85db test r11, r11
14016419f: 74df je 0x140164180
1401641a1: ebad jmp 0x140164150
1401641a3: be08000000 mov esi, 8
1401641a8: eb62 jmp 0x14016420c
1401641aa: 660f1f440000 nop word ptr [rax + rax]
1401641b0: 4901fa add r10, rdi
1401641b3: 498b7250 mov rsi, qword ptr [r10 + 0x50]
1401641b7: 4531d2 xor r10d, r10d
1401641ba: 4589d9 mov r9d, r11d
1401641bd: 4589d0 mov r8d, r10d
1401641c0: 49c1e004 shl r8, 4
1401641c4: 41ffc2 inc r10d
1401641c7: 4e8b1c06 mov r11, qword ptr [rsi + r8]
1401641cb: 4d89d8 mov r8, r11
1401641ce: 49c1e820 shr r8, 0x20
1401641d2: 4585db test r11d, r11d
1401641d5: 0f8503100000 jne 0x1401651de
1401641db: 4539ca cmp r10d, r9d
1401641de: 75dd jne 0x1401641bd
1401641e0: 4839ca cmp rdx, rcx
1401641e3: 7422 je 0x140164207
1401641e5: 448b1a mov r11d, dword ptr [rdx]
1401641e8: 4883c204 add rdx, 4
1401641ec: 4c8b9008010000 mov r10, qword ptr [rax + 0x108]
1401641f3: 4b8d3c9b lea rdi, [r11 + r11*4]
1401641f7: 48c1e705 shl rdi, 5
1401641fb: 4d8b5c3a58 mov r11, qword ptr [r10 + rdi + 0x58]
140164200: 4d85db test r11, r11
140164203: 74db je 0x1401641e0
140164205: eba9 jmp 0x1401641b0
140164207: bf08000000 mov edi, 8
14016420c: 4889ca mov rdx, rcx
14016420f: 4589ca mov r10d, r9d
140164212: 4531db xor r11d, r11d
140164215: 84db test bl, bl
140164217: 0f847f000000 je 0x14016429c
14016421d: eb1e jmp 0x14016423d
14016421f: 90 nop
140164220: 4d8d14f2 lea r10, [r10 + rsi*8]
140164224: 498b7a08 mov rdi, qword ptr [r10 + 8]
140164228: 4531d2 xor r10d, r10d
14016422b: 4489d6 mov esi, r10d
14016422e: 41ffc2 inc r10d
140164231: 8b1cf7 mov ebx, dword ptr [rdi + rsi*8]
140164234: 4885db test rbx, rbx
140164237: 0f859c000000 jne 0x1401642d9
14016423d: 4539ca cmp r10d, r9d
140164240: 75e9 jne 0x14016422b
140164242: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140164250: 4839ca cmp rdx, rcx
140164253: 0f847e000000 je 0x1401642d7
140164259: 448b0a mov r9d, dword ptr [rdx]
14016425c: 4883c204 add rdx, 4
140164260: 4c8b90a8010000 mov r10, qword ptr [rax + 0x1a8]
140164267: 4b8d34c9 lea rsi, [r9 + r9*8]
14016426b: 4d8b4cf210 mov r9, qword ptr [r10 + rsi*8 + 0x10]
140164270: 4d85c9 test r9, r9
140164273: 74db je 0x140164250
140164275: eba9 jmp 0x140164220
140164277: 660f1f840000000000 nop word ptr [rax + rax]
140164280: 4901f2 add r10, rsi
140164283: 498b7250 mov rsi, qword ptr [r10 + 0x50]
140164287: 4531d2 xor r10d, r10d
14016428a: 4489d7 mov edi, r10d
14016428d: 48c1e704 shl rdi, 4
140164291: 41ffc2 inc r10d
140164294: 8b1c3e mov ebx, dword ptr [rsi + rdi]
140164297: 4885db test rbx, rbx
14016429a: 753d jne 0x1401642d9
14016429c: 4539ca cmp r10d, r9d
14016429f: 75e9 jne 0x14016428a
1401642a1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401642b0: 4839ca cmp rdx, rcx
1401642b3: 7422 je 0x1401642d7
1401642b5: 448b0a mov r9d, dword ptr [rdx]
1401642b8: 4883c204 add rdx, 4
1401642bc: 4c8b9008010000 mov r10, qword ptr [rax + 0x108]
1401642c3: 4b8d3489 lea rsi, [r9 + r9*4]
1401642c7: 48c1e605 shl rsi, 5
1401642cb: 4d8b4c3258 mov r9, qword ptr [r10 + rsi + 0x58]
1401642d0: 4d85c9 test r9, r9
1401642d3: 74db je 0x1401642b0
1401642d5: eba9 jmp 0x140164280
1401642d7: 31db xor ebx, ebx
1401642d9: 4489d9 mov ecx, r11d
1401642dc: 49c1e020 shl r8, 0x20
1401642e0: 4909c8 or r8, rcx
1401642e3: 4885db test rbx, rbx
1401642e6: 48b80000000001000000 movabs rax, 0x100000000
1401642f0: 490f44c0 cmove rax, r8
1401642f4: 4885c9 test rcx, rcx
1401642f7: 480f44c1 cmove rax, rcx
1401642fb: 85c0 test eax, eax
1401642fd: 0f846f0e0000 je 0x140165172
140164303: 488bb520010000 mov rsi, qword ptr [rbp + 0x120]
14016430a: 488b9d40010000 mov rbx, qword ptr [rbp + 0x140]
140164311: 488bbd78010000 mov rdi, qword ptr [rbp + 0x178]
140164318: 48898528020000 mov qword ptr [rbp + 0x228], rax
14016431f: 48837b1800 cmp qword ptr [rbx + 0x18], 0
140164324: 0f84480e0000 je 0x140165172
14016432a: 488d4b20 lea rcx, [rbx + 0x20]
14016432e: 488d15e3f2c705 lea rdx, [rip + 0x5c7f2e3]
140164335: e83691eaff call 0x14000d470
14016433a: 4989c0 mov r8, rax
14016433d: 49c1e839 shr r8, 0x39
140164341: 488b0b mov rcx, qword ptr [rbx]
140164344: 488b5308 mov rdx, qword ptr [rbx + 8]
140164348: 66410f6ec0 movd xmm0, r8d
14016434d: 660f60c0 punpcklbw xmm0, xmm0
140164351: f20f70c000 pshuflw xmm0, xmm0, 0
140164356: 660f70c044 pshufd xmm0, xmm0, 0x44
14016435b: 4531c0 xor r8d, r8d
14016435e: 660f76c9 pcmpeqd xmm1, xmm1
140164362: 4821d0 and rax, rdx
140164365: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14016436a: 660f6fda movdqa xmm3, xmm2
14016436e: 660f74d8 pcmpeqb xmm3, xmm0
140164372: 66440fd7cb pmovmskb r9d, xmm3
140164377: 4585c9 test r9d, r9d
14016437a: 7429 je 0x1401643a5
14016437c: f3450fbcd9 tzcnt r11d, r9d
140164381: 4901c3 add r11, rax
140164384: 4921d3 and r11, rdx
140164387: 49c1e305 shl r11, 5
14016438b: 4989ca mov r10, rcx
14016438e: 4d29da sub r10, r11
140164391: 41807ae007 cmp byte ptr [r10 - 0x20], 7
140164396: 742c je 0x1401643c4
140164398: 458d51ff lea r10d, [r9 - 1]
14016439c: 664521ca and r10w, r9w
1401643a0: 4589d1 mov r9d, r10d
1401643a3: 75d7 jne 0x14016437c
1401643a5: 660f74d1 pcmpeqb xmm2, xmm1
1401643a9: 66440fd7ca pmovmskb r9d, xmm2
1401643ae: 4585c9 test r9d, r9d
1401643b1: 0f85bb0d0000 jne 0x140165172
1401643b7: 4c01c0 add rax, r8
1401643ba: 4883c010 add rax, 0x10
1401643be: 4983c010 add r8, 0x10
1401643c2: eb9e jmp 0x140164362
1401643c4: 41807ae800 cmp byte ptr [r10 - 0x18], 0
1401643c9: 743a je 0x140164405
1401643cb: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
1401643d0: 8845d2 mov byte ptr [rbp - 0x2e], al
1401643d3: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
1401643d8: 668945d0 mov word ptr [rbp - 0x30], ax
1401643dc: 498d42ec lea rax, [r10 - 0x14]
1401643e0: 498d4af0 lea rcx, [r10 - 0x10]
1401643e4: 418b52f4 mov edx, dword ptr [r10 - 0xc]
1401643e8: 450fb642f8 movzx r8d, byte ptr [r10 - 8]
1401643ed: 49c1e020 shl r8, 0x20
1401643f1: 4909d0 or r8, rdx
1401643f4: 4c898508020000 mov qword ptr [rbp + 0x208], r8
1401643fb: b201 mov dl, 1
1401643fd: 89955c020000 mov dword ptr [rbp + 0x25c], edx
140164403: eb16 jmp 0x14016441b
140164405: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
140164409: 488d4168 lea rax, [rcx + 0x68]
14016440d: 4883c16c add rcx, 0x6c
140164411: c7855c02000000000000 mov dword ptr [rbp + 0x25c], 0
14016441b: 8b09 mov ecx, dword ptr [rcx]
14016441d: 898d44020000 mov dword ptr [rbp + 0x244], ecx
140164423: 8b00 mov eax, dword ptr [rax]
140164425: 898548020000 mov dword ptr [rbp + 0x248], eax
14016442b: 0fb645d2 movzx eax, byte ptr [rbp - 0x2e]
14016442f: 8885ae020000 mov byte ptr [rbp + 0x2ae], al
140164435: 0fb745d0 movzx eax, word ptr [rbp - 0x30]
140164439: 668985ac020000 mov word ptr [rbp + 0x2ac], ax
140164440: f30f10775c movss xmm6, dword ptr [rdi + 0x5c]
140164445: 48c7856802000000000000 mov qword ptr [rbp + 0x268], 0
140164450: 48c7857002000004000000 mov qword ptr [rbp + 0x270], 4
14016445b: 48c7857802000000000000 mov qword ptr [rbp + 0x278], 0
140164466: 4c8b6e08 mov r13, qword ptr [rsi + 8]
14016446a: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
14016446e: 48c1e707 shl rdi, 7
140164472: 4c01ef add rdi, r13
140164475: f30f1005538ac605 movss xmm0, dword ptr [rip + 0x5c68a53]
14016447d: f30f59c6 mulss xmm0, xmm6
140164481: e8915ca905 call 0x145bfa117
140164486: f30f5905bae9c605 mulss xmm0, dword ptr [rip + 0x5c6e9ba]
14016448e: f30f5805c609c705 addss xmm0, dword ptr [rip + 0x5c709c6]
140164496: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
14016449e: f30f100592e9c605 movss xmm0, dword ptr [rip + 0x5c6e992]
1401644a6: f30f59c6 mulss xmm0, xmm6
1401644aa: 0f280def8bc605 movaps xmm1, xmmword ptr [rip + 0x5c68bef]
1401644b1: 0f298510020000 movaps xmmword ptr [rbp + 0x210], xmm0
1401644b8: 0f57c8 xorps xmm1, xmm0
1401644bb: 0f298d10010000 movaps xmmword ptr [rbp + 0x110], xmm1
1401644c2: f30f1005ee8bc605 movss xmm0, dword ptr [rip + 0x5c68bee]
1401644ca: f30f11b53c020000 movss dword ptr [rbp + 0x23c], xmm6
1401644d2: f30f59c6 mulss xmm0, xmm6
1401644d6: f30f118540020000 movss dword ptr [rbp + 0x240], xmm0
1401644de: b804000000 mov eax, 4
1401644e3: 48898560020000 mov qword ptr [rbp + 0x260], rax
1401644ea: bb00000080 mov ebx, 0x80000000
1401644ef: 4c8db5c0010000 lea r14, [rbp + 0x1c0]
1401644f6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
140164500: 4c89ee mov rsi, r13
140164503: 4939fd cmp r13, rdi
140164506: 0f84400c0000 je 0x14016514c
14016450c: 807e7c00 cmp byte ptr [rsi + 0x7c], 0
140164510: 741e je 0x140164530
140164512: 48b86666e63e0000803f movabs rax, 0x3f8000003ee66666
14016451c: 48898590020000 mov qword ptr [rbp + 0x290], rax
140164523: c78598020000cdcc0c3f mov dword ptr [rbp + 0x298], 0x3f0ccccd
14016452d: eb71 jmp 0x1401645a0
14016452f: 90 nop
140164530: 0fb6467d movzx eax, byte ptr [rsi + 0x7d]
140164534: 488d0de906c805 lea rcx, [rip + 0x5c806e9]
14016453b: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14016453f: 4801c8 add rax, rcx
140164542: ffe0 jmp rax
140164544: f20f1005b4dfc705 movsd xmm0, qword ptr [rip + 0x5c7dfb4]
14016454c: f20f118590020000 movsd qword ptr [rbp + 0x290], xmm0
140164554: c785980200008fc2f53d mov dword ptr [rbp + 0x298], 0x3df5c28f
14016455e: eb40 jmp 0x1401645a0
140164560: f20f100578dfc705 movsd xmm0, qword ptr [rip + 0x5c7df78]
140164568: eb24 jmp 0x14016458e
14016456a: f20f10055edfc705 movsd xmm0, qword ptr [rip + 0x5c7df5e]
140164572: f20f118590020000 movsd qword ptr [rbp + 0x290], xmm0
14016457a: c785980200000ad7a33d mov dword ptr [rbp + 0x298], 0x3da3d70a
140164584: eb1a jmp 0x1401645a0
140164586: f20f100562dfc705 movsd xmm0, qword ptr [rip + 0x5c7df62]
14016458e: f20f118590020000 movsd qword ptr [rbp + 0x290], xmm0
140164596: c785980200000000803f mov dword ptr [rbp + 0x298], 0x3f800000
1401645a0: 837e3001 cmp dword ptr [rsi + 0x30], 1
1401645a4: f30f100df48cc305 movss xmm1, dword ptr [rip + 0x5c38cf4]
1401645ac: 0f28c1 movaps xmm0, xmm1
1401645af: 7530 jne 0x1401645e1
1401645b1: f30f104634 movss xmm0, dword ptr [rsi + 0x34]
1401645b6: f30f5c853c020000 subss xmm0, dword ptr [rbp + 0x23c]
1401645be: f30f5905028fc305 mulss xmm0, dword ptr [rip + 0x5c38f02]
1401645c6: 0f57c9 xorps xmm1, xmm1
1401645c9: f30f5fc8 maxss xmm1, xmm0
1401645cd: f30f1005cb8cc305 movss xmm0, dword ptr [rip + 0x5c38ccb]
1401645d5: f30f5dc1 minss xmm0, xmm1
1401645d9: f30f100d2fdfc705 movss xmm1, dword ptr [rip + 0x5c7df2f]
1401645e1: f30f118d50020000 movss dword ptr [rbp + 0x250], xmm1
1401645e9: f30f11854c020000 movss dword ptr [rbp + 0x24c], xmm0
1401645f1: 0f57c0 xorps xmm0, xmm0
1401645f4: 807e7d02 cmp byte ptr [rsi + 0x7d], 2
1401645f8: f30f108d38020000 movss xmm1, dword ptr [rbp + 0x238]
140164600: 7349 jae 0x14016464b
140164602: f30f104678 movss xmm0, dword ptr [rsi + 0x78]
140164607: f30f580505dfc705 addss xmm0, dword ptr [rip + 0x5c7df05]
14016460f: f30f5e05d9dbc705 divss xmm0, dword ptr [rip + 0x5c7dbd9]
140164617: 0f57c9 xorps xmm1, xmm1
14016461a: f30f5fc8 maxss xmm1, xmm0
14016461e: f30f101d7a8cc305 movss xmm3, dword ptr [rip + 0x5c38c7a]
140164626: 0f28d3 movaps xmm2, xmm3
140164629: f30f5dd1 minss xmm2, xmm1
14016462d: 0f28ca movaps xmm1, xmm2
140164630: f30f59ca mulss xmm1, xmm2
140164634: f30f58d2 addss xmm2, xmm2
140164638: f30f10059088c605 movss xmm0, dword ptr [rip + 0x5c68890]
140164640: f30f5cc2 subss xmm0, xmm2
140164644: f30f59c1 mulss xmm0, xmm1
140164648: 0f28cb movaps xmm1, xmm3
14016464b: 4c8dae80000000 lea r13, [rsi + 0x80]
140164652: f30f118d34020000 movss dword ptr [rbp + 0x234], xmm1
14016465a: f30f118530020000 movss dword ptr [rbp + 0x230], xmm0
140164662: f30f104668 movss xmm0, dword ptr [rsi + 0x68]
140164667: 8b4664 mov eax, dword ptr [rsi + 0x64]
14016466a: 31d8 xor eax, ebx
14016466c: 8b4e60 mov ecx, dword ptr [rsi + 0x60]
14016466f: 31d9 xor ecx, ebx
140164671: 89859c020000 mov dword ptr [rbp + 0x29c], eax
140164677: 0f28f8 movaps xmm7, xmm0
14016467a: f30f1185a0020000 movss dword ptr [rbp + 0x2a0], xmm0
140164682: 898da4020000 mov dword ptr [rbp + 0x2a4], ecx
140164688: 488d8590020000 lea rax, [rbp + 0x290]
14016468f: 488985c0010000 mov qword ptr [rbp + 0x1c0], rax
140164696: 4889b5c8010000 mov qword ptr [rbp + 0x1c8], rsi
14016469d: 488d8530020000 lea rax, [rbp + 0x230]
1401646a4: 488985d0010000 mov qword ptr [rbp + 0x1d0], rax
1401646ab: 488d8550020000 lea rax, [rbp + 0x250]
1401646b2: 488985d8010000 mov qword ptr [rbp + 0x1d8], rax
1401646b9: 488d854c020000 lea rax, [rbp + 0x24c]
1401646c0: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
1401646c7: 488d8534020000 lea rax, [rbp + 0x234]
1401646ce: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
1401646d5: 488d8598010000 lea rax, [rbp + 0x198]
1401646dc: 488985f0010000 mov qword ptr [rbp + 0x1f0], rax
1401646e3: 488d8528020000 lea rax, [rbp + 0x228]
1401646ea: 488985f8010000 mov qword ptr [rbp + 0x1f8], rax
1401646f1: 488d859c020000 lea rax, [rbp + 0x29c]
1401646f8: 48898500020000 mov qword ptr [rbp + 0x200], rax
1401646ff: 4c8b7e08 mov r15, qword ptr [rsi + 8]
140164703: 488b4610 mov rax, qword ptr [rsi + 0x10]
140164707: 4c8d2440 lea r12, [rax + rax*2]
14016470b: 49c1e404 shl r12, 4
14016470f: 4d01fc add r12, r15
140164712: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140164720: 4d39e7 cmp r15, r12
140164723: 741b je 0x140164740
140164725: 4c89fa mov rdx, r15
140164728: 4983c730 add r15, 0x30
14016472c: 807a2c00 cmp byte ptr [rdx + 0x2c], 0
140164730: 75ee jne 0x140164720
140164732: 4c89f1 mov rcx, r14
140164735: e8e671fdff call 0x14013b920
14016473a: 90 nop
14016473b: ebe3 jmp 0x140164720
14016473d: 0f1f00 nop dword ptr [rax]
140164740: 4c8b6620 mov r12, qword ptr [rsi + 0x20]
140164744: 488b4628 mov rax, qword ptr [rsi + 0x28]
140164748: 4c8d3c40 lea r15, [rax + rax*2]
14016474c: 49c1e704 shl r15, 4
140164750: 4d01e7 add r15, r12
140164753: 4d39fc cmp r12, r15
140164756: 741d je 0x140164775
140164758: 0f1f840000000000 nop dword ptr [rax + rax]
140164760: 4c89f1 mov rcx, r14
140164763: 4c89e2 mov rdx, r12
140164766: e8b571fdff call 0x14013b920
14016476b: 90 nop
14016476c: 4983c430 add r12, 0x30
140164770: 4d39fc cmp r12, r15
140164773: 75eb jne 0x140164760
140164775: 4c8b7e08 mov r15, qword ptr [rsi + 8]
140164779: 488b4610 mov rax, qword ptr [rsi + 0x10]
14016477d: 4c8d2440 lea r12, [rax + rax*2]
140164781: 49c1e404 shl r12, 4
140164785: 4d01fc add r12, r15
140164788: 0f1f840000000000 nop dword ptr [rax + rax]
140164790: 4d39e7 cmp r15, r12
140164793: 741b je 0x1401647b0
140164795: 4c89fa mov rdx, r15
140164798: 4983c730 add r15, 0x30
14016479c: 807a2c00 cmp byte ptr [rdx + 0x2c], 0
1401647a0: 74ee je 0x140164790
1401647a2: 4c89f1 mov rcx, r14
1401647a5: e87671fdff call 0x14013b920
1401647aa: 90 nop
1401647ab: ebe3 jmp 0x140164790
1401647ad: 0f1f00 nop dword ptr [rax]
1401647b0: 807e7d01 cmp byte ptr [rsi + 0x7d], 1
1401647b4: 0f8546fdffff jne 0x140164500
1401647ba: 837e5400 cmp dword ptr [rsi + 0x54], 0
1401647be: 0f853cfdffff jne 0x140164500
1401647c4: f3440f10b550020000 movss xmm14, dword ptr [rbp + 0x250]
1401647cd: f20f108d90020000 movsd xmm1, qword ptr [rbp + 0x290]
1401647d5: f3410f12c6 movsldup xmm0, xmm14
1401647da: 0f59c1 mulps xmm0, xmm1
1401647dd: 0f28c8 movaps xmm1, xmm0
1401647e0: 0f5d0d7986c605 minps xmm1, xmmword ptr [rip + 0x5c68679]
1401647e7: 807e7c00 cmp byte ptr [rsi + 0x7c], 0
1401647eb: f30f1015d504c705 movss xmm2, dword ptr [rip + 0x5c704d5]
1401647f3: 7508 jne 0x1401647fd
1401647f5: f30f1015a38ac305 movss xmm2, dword ptr [rip + 0x5c38aa3]
1401647fd: f30f106e58 movss xmm5, dword ptr [rsi + 0x58]
140164802: 0f28da movaps xmm3, xmm2
140164805: 0f28f1 movaps xmm6, xmm1
140164808: 0fc2f103 cmpunordps xmm6, xmm1
14016480c: 0f54c6 andps xmm0, xmm6
14016480f: 0f55f1 andnps xmm6, xmm1
140164812: 0f56f0 orps xmm6, xmm0
140164815: f3440f59b598020000 mulss xmm14, dword ptr [rbp + 0x298]
14016481e: f3440f5d35798ac305 minss xmm14, dword ptr [rip + 0x5c38a79]
140164827: f30f599d4c020000 mulss xmm3, dword ptr [rbp + 0x24c]
14016482f: 0f28cd movaps xmm1, xmm5
140164832: f30f580d468cc305 addss xmm1, dword ptr [rip + 0x5c38c46]
14016483a: 0f28e7 movaps xmm4, xmm7
14016483d: f30f5825d3dcc705 addss xmm4, dword ptr [rip + 0x5c7dcd3]
140164845: 48c7857802000000000000 mov qword ptr [rbp + 0x278], 0
140164850: 0f28c4 movaps xmm0, xmm4
140164853: f30f118d58020000 movss dword ptr [rbp + 0x258], xmm1
14016485b: f30f58c1 addss xmm0, xmm1
14016485f: f30f119da8020000 movss dword ptr [rbp + 0x2a8], xmm3
140164867: f30f591dc5e5c605 mulss xmm3, dword ptr [rip + 0x5c6e5c5]
14016486f: f30f108d9c020000 movss xmm1, dword ptr [rbp + 0x29c]
140164877: 660f6e95a4020000 movd xmm2, dword ptr [rbp + 0x2a4]
14016487f: 660f7ed8 movd eax, xmm3
140164883: 0f1375d0 movlps qword ptr [rbp - 0x30], xmm6
140164887: f3440f1175d8 movss dword ptr [rbp - 0x28], xmm14
14016488d: 488d4dd0 lea rcx, [rbp - 0x30]
140164891: 48894c2440 mov qword ptr [rsp + 0x40], rcx
140164896: 4889442438 mov qword ptr [rsp + 0x38], rax
14016489b: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
1401648a1: f30f11a554020000 movss dword ptr [rbp + 0x254], xmm4
1401648a9: f30f11642428 movss dword ptr [rsp + 0x28], xmm4
1401648af: 0f288510020000 movaps xmm0, xmmword ptr [rbp + 0x210]
1401648b6: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1401648bc: 488d8d68020000 lea rcx, [rbp + 0x268]
1401648c3: f30f11adb0020000 movss dword ptr [rbp + 0x2b0], xmm5
1401648cb: 0f28dd movaps xmm3, xmm5
1401648ce: e87d31feff call 0x140147a50
1401648d3: 90 nop
1401648d4: f30f104678 movss xmm0, dword ptr [rsi + 0x78]
1401648d9: 0f2e053cdcc705 ucomiss xmm0, dword ptr [rip + 0x5c7dc3c]
1401648e0: 0f869c000000 jbe 0x140164982
1401648e6: f30f598558020000 mulss xmm0, dword ptr [rbp + 0x258]
1401648ee: f30f10bd54020000 movss xmm7, dword ptr [rbp + 0x254]
1401648f6: f30f58c7 addss xmm0, xmm7
1401648fa: f30f109db0020000 movss xmm3, dword ptr [rbp + 0x2b0]
140164902: f30f591d16dcc705 mulss xmm3, dword ptr [rip + 0x5c7dc16]
14016490a: f30f10ada8020000 movss xmm5, dword ptr [rbp + 0x2a8]
140164912: 0f28e5 movaps xmm4, xmm5
140164915: f30f59258789c305 mulss xmm4, dword ptr [rip + 0x5c38987]
14016491d: f30f592d1fe5c605 mulss xmm5, dword ptr [rip + 0x5c6e51f]
140164925: f30f108d9c020000 movss xmm1, dword ptr [rbp + 0x29c]
14016492d: 660f6e95a4020000 movd xmm2, dword ptr [rbp + 0x2a4]
140164935: 660f7ee0 movd eax, xmm4
140164939: 660f7ee9 movd ecx, xmm5
14016493d: 48c1e120 shl rcx, 0x20
140164941: 4809c8 or rax, rcx
140164944: 0f1375d0 movlps qword ptr [rbp - 0x30], xmm6
140164948: f3440f1175d8 movss dword ptr [rbp - 0x28], xmm14
14016494e: 488d4dd0 lea rcx, [rbp - 0x30]
140164952: 48894c2440 mov qword ptr [rsp + 0x40], rcx
140164957: 4889442438 mov qword ptr [rsp + 0x38], rax
14016495c: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
140164962: f30f117c2428 movss dword ptr [rsp + 0x28], xmm7
140164968: 0f288510010000 movaps xmm0, xmmword ptr [rbp + 0x110]
14016496f: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140164975: 488d8d68020000 lea rcx, [rbp + 0x268]
14016497c: e8cf30feff call 0x140147a50
140164981: 90 nop
140164982: f30f1085a8020000 movss xmm0, dword ptr [rbp + 0x2a8]
14016498a: f30f59050287c605 mulss xmm0, dword ptr [rip + 0x5c68702]
140164992: f30f1185a8020000 movss dword ptr [rbp + 0x2a8], xmm0
14016499a: f30f1085b0020000 movss xmm0, dword ptr [rbp + 0x2b0]
1401649a2: f30f59057adbc705 mulss xmm0, dword ptr [rip + 0x5c7db7a]
1401649aa: f30f1185b0020000 movss dword ptr [rbp + 0x2b0], xmm0
1401649b2: 4531e4 xor r12d, r12d
1401649b5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401649c0: 488d7570 lea rsi, [rbp + 0x70]
1401649c4: 4983fc02 cmp r12, 2
1401649c8: 0f8359060000 jae 0x140165027
1401649ce: f34d0f2ac4 cvtsi2ss xmm8, r12
1401649d3: 49ffc4 inc r12
1401649d6: f3440f5905c588c305 mulss xmm8, dword ptr [rip + 0x5c388c5]
1401649df: f3440f588540020000 addss xmm8, dword ptr [rbp + 0x240]
1401649e8: 410f28c0 movaps xmm0, xmm8
1401649ec: e82057a905 call 0x145bfa111
1401649f1: f3440f5cc0 subss xmm8, xmm0
1401649f6: f30f108558020000 movss xmm0, dword ptr [rbp + 0x258]
1401649fe: f3410f59c0 mulss xmm0, xmm8
140164a03: f30f588554020000 addss xmm0, dword ptr [rbp + 0x254]
140164a0b: f3440f10258c88c305 movss xmm12, dword ptr [rip + 0x5c3888c]
140164a14: f3450f5ce0 subss xmm12, xmm8
140164a19: f3440f59a5a8020000 mulss xmm12, dword ptr [rbp + 0x2a8]
140164a22: f30f118560020000 movss dword ptr [rbp + 0x260], xmm0
140164a2a: f30f5805f6dac705 addss xmm0, dword ptr [rip + 0x5c7daf6]
140164a32: f30f118584020000 movss dword ptr [rbp + 0x284], xmm0
140164a3a: f30f10859c020000 movss xmm0, dword ptr [rbp + 0x29c]
140164a42: f30f118588020000 movss dword ptr [rbp + 0x288], xmm0
140164a4a: f30f1085a4020000 movss xmm0, dword ptr [rbp + 0x2a4]
140164a52: f30f11858c020000 movss dword ptr [rbp + 0x28c], xmm0
140164a5a: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
140164a61: 31f6 xor esi, esi
140164a63: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140164a70: 0f57ff xorps xmm7, xmm7
140164a73: f3480f2afe cvtsi2ss xmm7, rsi
140164a78: 48ffc6 inc rsi
140164a7b: f3440f101d20d9c705 movss xmm11, dword ptr [rip + 0x5c7d920]
140164a84: f3410f59fb mulss xmm7, xmm11
140164a89: 440f28cf movaps xmm9, xmm7
140164a8d: f3440f103daa86c605 movss xmm15, dword ptr [rip + 0x5c686aa]
140164a96: f3450f59cf mulss xmm9, xmm15
140164a9b: 440f289510020000 movaps xmm10, xmmword ptr [rbp + 0x210]
140164aa3: f3450f58ca addss xmm9, xmm10
140164aa8: 410f28c1 movaps xmm0, xmm9
140164aac: e86c56a905 call 0x145bfa11d
140164ab1: 440f28c0 movaps xmm8, xmm0
140164ab5: 410f28c1 movaps xmm0, xmm9
140164ab9: e85956a905 call 0x145bfa117
140164abe: 440f28c8 movaps xmm9, xmm0
140164ac2: f34c0f2aee cvtsi2ss xmm13, rsi
140164ac7: f3450f59eb mulss xmm13, xmm11
140164acc: 450f28dd movaps xmm11, xmm13
140164ad0: f3450f59df mulss xmm11, xmm15
140164ad5: f3450f58da addss xmm11, xmm10
140164ada: 410f28c3 movaps xmm0, xmm11
140164ade: e83a56a905 call 0x145bfa11d
140164ae3: 440f28d0 movaps xmm10, xmm0
140164ae7: 410f28c3 movaps xmm0, xmm11
140164aeb: e82756a905 call 0x145bfa117
140164af0: 440f28d8 movaps xmm11, xmm0
140164af4: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140164afb: 4c29f8 sub rax, r15
140164afe: 4883f805 cmp rax, 5
140164b02: 0f86ee010000 jbe 0x140164cf6
140164b08: f30f1085b0020000 movss xmm0, dword ptr [rbp + 0x2b0]
140164b10: f3440f59c0 mulss xmm8, xmm0
140164b15: f30f108d88020000 movss xmm1, dword ptr [rbp + 0x288]
140164b1d: f3440f58c1 addss xmm8, xmm1
140164b22: f3440f59c8 mulss xmm9, xmm0
140164b27: f30f10958c020000 movss xmm2, dword ptr [rbp + 0x28c]
140164b2f: f3440f58ca addss xmm9, xmm2
140164b34: f3440f59d0 mulss xmm10, xmm0
140164b39: f3440f58d1 addss xmm10, xmm1
140164b3e: f3440f59d8 mulss xmm11, xmm0
140164b43: f3440f58da addss xmm11, xmm2
140164b48: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140164b4f: 4b8d0cff lea rcx, [r15 + r15*8]
140164b53: f3440f110488 movss dword ptr [rax + rcx*4], xmm8
140164b59: f30f108d84020000 movss xmm1, dword ptr [rbp + 0x284]
140164b61: f30f114c8804 movss dword ptr [rax + rcx*4 + 4], xmm1
140164b67: f3440f114c8808 movss dword ptr [rax + rcx*4 + 8], xmm9
140164b6e: f30f117c880c movss dword ptr [rax + rcx*4 + 0xc], xmm7
140164b74: c74488100000003f mov dword ptr [rax + rcx*4 + 0x10], 0x3f000000
140164b7c: 0f13748814 movlps qword ptr [rax + rcx*4 + 0x14], xmm6
140164b81: f3440f1174881c movss dword ptr [rax + rcx*4 + 0x1c], xmm14
140164b88: c744882000000000 mov dword ptr [rax + rcx*4 + 0x20], 0
140164b90: f3440f11548824 movss dword ptr [rax + rcx*4 + 0x24], xmm10
140164b97: f30f114c8828 movss dword ptr [rax + rcx*4 + 0x28], xmm1
140164b9d: f3440f115c882c movss dword ptr [rax + rcx*4 + 0x2c], xmm11
140164ba4: f3440f116c8830 movss dword ptr [rax + rcx*4 + 0x30], xmm13
140164bab: c74488340000003f mov dword ptr [rax + rcx*4 + 0x34], 0x3f000000
140164bb3: 0f13748838 movlps qword ptr [rax + rcx*4 + 0x38], xmm6
140164bb8: f3440f11748840 movss dword ptr [rax + rcx*4 + 0x40], xmm14
140164bbf: c744884400000000 mov dword ptr [rax + rcx*4 + 0x44], 0
140164bc7: f3440f11548848 movss dword ptr [rax + rcx*4 + 0x48], xmm10
140164bce: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140164bd6: f30f1144884c movss dword ptr [rax + rcx*4 + 0x4c], xmm0
140164bdc: f3440f115c8850 movss dword ptr [rax + rcx*4 + 0x50], xmm11
140164be3: f3440f116c8854 movss dword ptr [rax + rcx*4 + 0x54], xmm13
140164bea: c74488580000003f mov dword ptr [rax + rcx*4 + 0x58], 0x3f000000
140164bf2: 0f1374885c movlps qword ptr [rax + rcx*4 + 0x5c], xmm6
140164bf7: f3440f11748864 movss dword ptr [rax + rcx*4 + 0x64], xmm14
140164bfe: f3440f11648868 movss dword ptr [rax + rcx*4 + 0x68], xmm12
140164c05: f3440f1144886c movss dword ptr [rax + rcx*4 + 0x6c], xmm8
140164c0c: f30f114c8870 movss dword ptr [rax + rcx*4 + 0x70], xmm1
140164c12: f3440f114c8874 movss dword ptr [rax + rcx*4 + 0x74], xmm9
140164c19: f30f117c8878 movss dword ptr [rax + rcx*4 + 0x78], xmm7
140164c1f: c744887c0000003f mov dword ptr [rax + rcx*4 + 0x7c], 0x3f000000
140164c27: 0f13b48880000000 movlps qword ptr [rax + rcx*4 + 0x80], xmm6
140164c2f: f3440f11b48888000000 movss dword ptr [rax + rcx*4 + 0x88], xmm14
140164c39: c784888c00000000000000 mov dword ptr [rax + rcx*4 + 0x8c], 0
140164c44: f3440f11948890000000 movss dword ptr [rax + rcx*4 + 0x90], xmm10
140164c4e: f30f11848894000000 movss dword ptr [rax + rcx*4 + 0x94], xmm0
140164c57: f3440f119c8898000000 movss dword ptr [rax + rcx*4 + 0x98], xmm11
140164c61: f3440f11ac889c000000 movss dword ptr [rax + rcx*4 + 0x9c], xmm13
140164c6b: c78488a00000000000003f mov dword ptr [rax + rcx*4 + 0xa0], 0x3f000000
140164c76: 0f13b488a4000000 movlps qword ptr [rax + rcx*4 + 0xa4], xmm6
140164c7e: f3440f11b488ac000000 movss dword ptr [rax + rcx*4 + 0xac], xmm14
140164c88: f3440f11a488b0000000 movss dword ptr [rax + rcx*4 + 0xb0], xmm12
140164c92: f3440f118488b4000000 movss dword ptr [rax + rcx*4 + 0xb4], xmm8
140164c9c: f30f118488b8000000 movss dword ptr [rax + rcx*4 + 0xb8], xmm0
140164ca5: f3440f118c88bc000000 movss dword ptr [rax + rcx*4 + 0xbc], xmm9
140164caf: f30f11bc88c0000000 movss dword ptr [rax + rcx*4 + 0xc0], xmm7
140164cb8: c78488c40000000000003f mov dword ptr [rax + rcx*4 + 0xc4], 0x3f000000
140164cc3: 0f13b488c8000000 movlps qword ptr [rax + rcx*4 + 0xc8], xmm6
140164ccb: f3440f11b488d0000000 movss dword ptr [rax + rcx*4 + 0xd0], xmm14
140164cd5: f3440f11a488d4000000 movss dword ptr [rax + rcx*4 + 0xd4], xmm12
140164cdf: 4983c706 add r15, 6
140164ce3: 4c89bd78020000 mov qword ptr [rbp + 0x278], r15
140164cea: 4883fe20 cmp rsi, 0x20
140164cee: 0f857cfdffff jne 0x140164a70
140164cf4: eb3a jmp 0x140164d30
140164cf6: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140164cff: 41b806000000 mov r8d, 6
140164d05: 41b904000000 mov r9d, 4
140164d0b: 488d8d68020000 lea rcx, [rbp + 0x268]
140164d12: 4c89fa mov rdx, r15
140164d15: e8565ca905 call 0x145bfa970
140164d1a: 90 nop
140164d1b: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
140164d22: e9e1fdffff jmp 0x140164b08
140164d27: 660f1f840000000000 nop word ptr [rax + rax]
140164d30: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140164d38: f30f5805b0d4c705 addss xmm0, dword ptr [rip + 0x5c7d4b0]
140164d40: f30f118584020000 movss dword ptr [rbp + 0x284], xmm0
140164d48: f30f10859c020000 movss xmm0, dword ptr [rbp + 0x29c]
140164d50: f30f118588020000 movss dword ptr [rbp + 0x288], xmm0
140164d58: f30f1085a4020000 movss xmm0, dword ptr [rbp + 0x2a4]
140164d60: f30f11858c020000 movss dword ptr [rbp + 0x28c], xmm0
140164d68: 31f6 xor esi, esi
140164d6a: 660f1f440000 nop word ptr [rax + rax]
140164d70: f3480f2afe cvtsi2ss xmm7, rsi
140164d75: 48ffc6 inc rsi
140164d78: f3440f101d23d6c705 movss xmm11, dword ptr [rip + 0x5c7d623]
140164d81: f3410f59fb mulss xmm7, xmm11
140164d86: 440f28cf movaps xmm9, xmm7
140164d8a: f3440f103dad83c605 movss xmm15, dword ptr [rip + 0x5c683ad]
140164d93: f3450f59cf mulss xmm9, xmm15
140164d98: 440f289510020000 movaps xmm10, xmmword ptr [rbp + 0x210]
140164da0: f3450f58ca addss xmm9, xmm10
140164da5: 410f28c1 movaps xmm0, xmm9
140164da9: e86f53a905 call 0x145bfa11d
140164dae: 440f28c0 movaps xmm8, xmm0
140164db2: 410f28c1 movaps xmm0, xmm9
140164db6: e85c53a905 call 0x145bfa117
140164dbb: 440f28c8 movaps xmm9, xmm0
140164dbf: f34c0f2aee cvtsi2ss xmm13, rsi
140164dc4: f3450f59eb mulss xmm13, xmm11
140164dc9: 450f28dd movaps xmm11, xmm13
140164dcd: f3450f59df mulss xmm11, xmm15
140164dd2: f3450f58da addss xmm11, xmm10
140164dd7: 410f28c3 movaps xmm0, xmm11
140164ddb: e83d53a905 call 0x145bfa11d
140164de0: 440f28d0 movaps xmm10, xmm0
140164de4: 410f28c3 movaps xmm0, xmm11
140164de8: e82a53a905 call 0x145bfa117
140164ded: 440f28d8 movaps xmm11, xmm0
140164df1: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140164df8: 4c29f8 sub rax, r15
140164dfb: 4883f805 cmp rax, 5
140164dff: 0f86f1010000 jbe 0x140164ff6
140164e05: f30f1085b0020000 movss xmm0, dword ptr [rbp + 0x2b0]
140164e0d: f3440f59c0 mulss xmm8, xmm0
140164e12: f30f108d88020000 movss xmm1, dword ptr [rbp + 0x288]
140164e1a: f3440f58c1 addss xmm8, xmm1
140164e1f: f3440f59c8 mulss xmm9, xmm0
140164e24: f30f10958c020000 movss xmm2, dword ptr [rbp + 0x28c]
140164e2c: f3440f58ca addss xmm9, xmm2
140164e31: f3440f59d0 mulss xmm10, xmm0
140164e36: f3440f58d1 addss xmm10, xmm1
140164e3b: f3440f59d8 mulss xmm11, xmm0
140164e40: f3440f58da addss xmm11, xmm2
140164e45: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140164e4c: 4b8d0cff lea rcx, [r15 + r15*8]
140164e50: f3440f110488 movss dword ptr [rax + rcx*4], xmm8
140164e56: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140164e5e: f30f11448804 movss dword ptr [rax + rcx*4 + 4], xmm0
140164e64: f3440f114c8808 movss dword ptr [rax + rcx*4 + 8], xmm9
140164e6b: f30f117c880c movss dword ptr [rax + rcx*4 + 0xc], xmm7
140164e71: c74488100000003f mov dword ptr [rax + rcx*4 + 0x10], 0x3f000000
140164e79: 0f13748814 movlps qword ptr [rax + rcx*4 + 0x14], xmm6
140164e7e: f3440f1174881c movss dword ptr [rax + rcx*4 + 0x1c], xmm14
140164e85: f3440f11648820 movss dword ptr [rax + rcx*4 + 0x20], xmm12
140164e8c: f3440f11548824 movss dword ptr [rax + rcx*4 + 0x24], xmm10
140164e93: f30f11448828 movss dword ptr [rax + rcx*4 + 0x28], xmm0
140164e99: f3440f115c882c movss dword ptr [rax + rcx*4 + 0x2c], xmm11
140164ea0: f3440f116c8830 movss dword ptr [rax + rcx*4 + 0x30], xmm13
140164ea7: c74488340000003f mov dword ptr [rax + rcx*4 + 0x34], 0x3f000000
140164eaf: 0f13748838 movlps qword ptr [rax + rcx*4 + 0x38], xmm6
140164eb4: f3440f11748840 movss dword ptr [rax + rcx*4 + 0x40], xmm14
140164ebb: f3440f11648844 movss dword ptr [rax + rcx*4 + 0x44], xmm12
140164ec2: f3440f11548848 movss dword ptr [rax + rcx*4 + 0x48], xmm10
140164ec9: f30f108d84020000 movss xmm1, dword ptr [rbp + 0x284]
140164ed1: f30f114c884c movss dword ptr [rax + rcx*4 + 0x4c], xmm1
140164ed7: f3440f115c8850 movss dword ptr [rax + rcx*4 + 0x50], xmm11
140164ede: f3440f116c8854 movss dword ptr [rax + rcx*4 + 0x54], xmm13
140164ee5: c74488580000003f mov dword ptr [rax + rcx*4 + 0x58], 0x3f000000
140164eed: 0f1374885c movlps qword ptr [rax + rcx*4 + 0x5c], xmm6
140164ef2: f3440f11748864 movss dword ptr [rax + rcx*4 + 0x64], xmm14
140164ef9: c744886800000000 mov dword ptr [rax + rcx*4 + 0x68], 0
140164f01: f3440f1144886c movss dword ptr [rax + rcx*4 + 0x6c], xmm8
140164f08: f30f11448870 movss dword ptr [rax + rcx*4 + 0x70], xmm0
140164f0e: f3440f114c8874 movss dword ptr [rax + rcx*4 + 0x74], xmm9
140164f15: f30f117c8878 movss dword ptr [rax + rcx*4 + 0x78], xmm7
140164f1b: c744887c0000003f mov dword ptr [rax + rcx*4 + 0x7c], 0x3f000000
140164f23: 0f13b48880000000 movlps qword ptr [rax + rcx*4 + 0x80], xmm6
140164f2b: f3440f11b48888000000 movss dword ptr [rax + rcx*4 + 0x88], xmm14
140164f35: f3440f11a4888c000000 movss dword ptr [rax + rcx*4 + 0x8c], xmm12
140164f3f: f3440f11948890000000 movss dword ptr [rax + rcx*4 + 0x90], xmm10
140164f49: f30f118c8894000000 movss dword ptr [rax + rcx*4 + 0x94], xmm1
140164f52: f3440f119c8898000000 movss dword ptr [rax + rcx*4 + 0x98], xmm11
140164f5c: f3440f11ac889c000000 movss dword ptr [rax + rcx*4 + 0x9c], xmm13
140164f66: c78488a00000000000003f mov dword ptr [rax + rcx*4 + 0xa0], 0x3f000000
140164f71: 0f13b488a4000000 movlps qword ptr [rax + rcx*4 + 0xa4], xmm6
140164f79: f3440f11b488ac000000 movss dword ptr [rax + rcx*4 + 0xac], xmm14
140164f83: c78488b000000000000000 mov dword ptr [rax + rcx*4 + 0xb0], 0
140164f8e: f3440f118488b4000000 movss dword ptr [rax + rcx*4 + 0xb4], xmm8
140164f98: f30f118c88b8000000 movss dword ptr [rax + rcx*4 + 0xb8], xmm1
140164fa1: f3440f118c88bc000000 movss dword ptr [rax + rcx*4 + 0xbc], xmm9
140164fab: f30f11bc88c0000000 movss dword ptr [rax + rcx*4 + 0xc0], xmm7
140164fb4: c78488c40000000000003f mov dword ptr [rax + rcx*4 + 0xc4], 0x3f000000
140164fbf: 0f13b488c8000000 movlps qword ptr [rax + rcx*4 + 0xc8], xmm6
140164fc7: f3440f11b488d0000000 movss dword ptr [rax + rcx*4 + 0xd0], xmm14
140164fd1: c78488d400000000000000 mov dword ptr [rax + rcx*4 + 0xd4], 0
140164fdc: 4983c706 add r15, 6
140164fe0: 4c89bd78020000 mov qword ptr [rbp + 0x278], r15
140164fe7: 4883fe20 cmp rsi, 0x20
140164feb: 0f857ffdffff jne 0x140164d70
140164ff1: e9caf9ffff jmp 0x1401649c0
140164ff6: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140164fff: 41b806000000 mov r8d, 6
140165005: 41b904000000 mov r9d, 4
14016500b: 488d8d68020000 lea rcx, [rbp + 0x268]
140165012: 4c89fa mov rdx, r15
140165015: e85659a905 call 0x145bfa970
14016501a: 90 nop
14016501b: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
140165022: e9defdffff jmp 0x140164e05
140165027: 488b8598010000 mov rax, qword ptr [rbp + 0x198]
14016502e: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
140165035: 8b4010 mov eax, dword ptr [rax + 0x10]
140165038: 488b9528020000 mov rdx, qword ptr [rbp + 0x228]
14016503f: 448b85b4010000 mov r8d, dword ptr [rbp + 0x1b4]
140165046: 448901 mov dword ptr [rcx], r8d
140165049: 488b8d98010000 mov rcx, qword ptr [rbp + 0x198]
140165050: 448b85a4020000 mov r8d, dword ptr [rbp + 0x2a4]
140165057: 4c8d8dc9000000 lea r9, [rbp + 0xc9]
14016505e: 4589411b mov dword ptr [r9 + 0x1b], r8d
140165062: 4c8b859c020000 mov r8, qword ptr [rbp + 0x29c]
140165069: 4d894113 mov qword ptr [r9 + 0x13], r8
14016506d: 0f57c0 xorps xmm0, xmm0
140165070: 0f294570 movaps xmmword ptr [rbp + 0x70], xmm0
140165074: 48899590000000 mov qword ptr [rbp + 0x90], rdx
14016507b: 48c7859800000001000000 mov qword ptr [rbp + 0x98], 1
140165086: 48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
140165091: 8b955c020000 mov edx, dword ptr [rbp + 0x25c]
140165097: 8895c8000000 mov byte ptr [rbp + 0xc8], dl
14016509d: 0fb695ae020000 movzx edx, byte ptr [rbp + 0x2ae]
1401650a4: 41885102 mov byte ptr [r9 + 2], dl
1401650a8: 0fb795ac020000 movzx edx, word ptr [rbp + 0x2ac]
1401650af: 66418911 mov word ptr [r9], dx
1401650b3: 8b9548020000 mov edx, dword ptr [rbp + 0x248]
1401650b9: 8995cc000000 mov dword ptr [rbp + 0xcc], edx
1401650bf: 8b9544020000 mov edx, dword ptr [rbp + 0x244]
1401650c5: 8995d0000000 mov dword ptr [rbp + 0xd0], edx
1401650cb: 488b9508020000 mov rdx, qword ptr [rbp + 0x208]
1401650d2: 488995d4000000 mov qword ptr [rbp + 0xd4], rdx
1401650d9: c785e800000000000046 mov dword ptr [rbp + 0xe8], 0x46000000
1401650e3: 410f114123 movups xmmword ptr [r9 + 0x23], xmm0
1401650e8: 41c7413300000000 mov dword ptr [r9 + 0x33], 0
1401650f0: 48898d00010000 mov qword ptr [rbp + 0x100], rcx
1401650f7: 898508010000 mov dword ptr [rbp + 0x108], eax
1401650fd: 488b9570020000 mov rdx, qword ptr [rbp + 0x270]
140165104: 4c8b8578020000 mov r8, qword ptr [rbp + 0x278]
14016510b: c685b702000001 mov byte ptr [rbp + 0x2b7], 1
140165112: 4889f1 mov rcx, rsi
140165115: 48899560020000 mov qword ptr [rbp + 0x260], rdx
14016511c: e8eff24501 call 0x1415c4410
140165121: 90 nop
140165122: 4889f2 mov rdx, rsi
140165125: 41b8a0000000 mov r8d, 0xa0
14016512b: 488d75d0 lea rsi, [rbp - 0x30]
14016512f: 4889f1 mov rcx, rsi
140165132: e8b04fa905 call 0x145bfa0e7
140165137: c685b702000000 mov byte ptr [rbp + 0x2b7], 0
14016513e: 4889f1 mov rcx, rsi
140165141: e82af24501 call 0x1415c4370
140165146: 90 nop
140165147: e9b4f3ffff jmp 0x140164500
14016514c: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140165153: 4885c0 test rax, rax
140165156: 741a je 0x140165172
140165158: 48c1e002 shl rax, 2
14016515c: 488d14c0 lea rdx, [rax + rax*8]
140165160: 41b804000000 mov r8d, 4
140165166: 488b8d60020000 mov rcx, qword ptr [rbp + 0x260]
14016516d: e85ed0e9ff call 0x1400021d0
140165172: 0f28b5c0020000 movaps xmm6, xmmword ptr [rbp + 0x2c0]
140165179: 0f28bdd0020000 movaps xmm7, xmmword ptr [rbp + 0x2d0]
140165180: 440f2885e0020000 movaps xmm8, xmmword ptr [rbp + 0x2e0]
140165188: 440f288df0020000 movaps xmm9, xmmword ptr [rbp + 0x2f0]
140165190: 440f289500030000 movaps xmm10, xmmword ptr [rbp + 0x300]
140165198: 440f289d10030000 movaps xmm11, xmmword ptr [rbp + 0x310]
1401651a0: 440f28a520030000 movaps xmm12, xmmword ptr [rbp + 0x320]
1401651a8: 440f28ad30030000 movaps xmm13, xmmword ptr [rbp + 0x330]
1401651b0: 440f28b540030000 movaps xmm14, xmmword ptr [rbp + 0x340]
1401651b8: 440f28bd50030000 movaps xmm15, xmmword ptr [rbp + 0x350]
1401651c0: 4881c4e8030000 add rsp, 0x3e8
1401651c7: 5b pop rbx
1401651c8: 5f pop rdi
1401651c9: 5e pop rsi
1401651ca: 415c pop r12
1401651cc: 415d pop r13
1401651ce: 415e pop r14
1401651d0: 415f pop r15
1401651d2: 5d pop rbp
1401651d3: c3 ret
1401651d4: be08000000 mov esi, 8
1401651d9: e937f0ffff jmp 0x140164215
1401651de: bf08000000 mov edi, 8
1401651e3: e92df0ffff jmp 0x140164215

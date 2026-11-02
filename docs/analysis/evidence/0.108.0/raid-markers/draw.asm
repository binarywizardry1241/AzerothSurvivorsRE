140114010: 55 push rbp
140114011: 4157 push r15
140114013: 4156 push r14
140114015: 4155 push r13
140114017: 4154 push r12
140114019: 56 push rsi
14011401a: 57 push rdi
14011401b: 53 push rbx
14011401c: 4881ece8030000 sub rsp, 0x3e8
140114023: 488dac2480000000 lea rbp, [rsp + 0x80]
14011402b: 440f29bd50030000 movaps xmmword ptr [rbp + 0x350], xmm15
140114033: 440f29b540030000 movaps xmmword ptr [rbp + 0x340], xmm14
14011403b: 440f29ad30030000 movaps xmmword ptr [rbp + 0x330], xmm13
140114043: 440f29a520030000 movaps xmmword ptr [rbp + 0x320], xmm12
14011404b: 440f299d10030000 movaps xmmword ptr [rbp + 0x310], xmm11
140114053: 440f299500030000 movaps xmmword ptr [rbp + 0x300], xmm10
14011405b: 440f298df0020000 movaps xmmword ptr [rbp + 0x2f0], xmm9
140114063: 440f2985e0020000 movaps xmmword ptr [rbp + 0x2e0], xmm8
14011406b: 0f29bdd0020000 movaps xmmword ptr [rbp + 0x2d0], xmm7
140114072: 0f29b5c0020000 movaps xmmword ptr [rbp + 0x2c0], xmm6
140114079: 48c785b8020000feffffff mov qword ptr [rbp + 0x2b8], 0xfffffffffffffffe
140114084: 488b85d8030000 mov rax, qword ptr [rbp + 0x3d8]
14011408b: 488b8dd0030000 mov rcx, qword ptr [rbp + 0x3d0]
140114092: 0f1002 movups xmm0, xmmword ptr [rdx]
140114095: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140114099: 0f298d30010000 movaps xmmword ptr [rbp + 0x130], xmm1
1401140a0: 0f298520010000 movaps xmmword ptr [rbp + 0x120], xmm0
1401140a7: 410f1000 movups xmm0, xmmword ptr [r8]
1401140ab: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
1401140b0: 0f298d50010000 movaps xmmword ptr [rbp + 0x150], xmm1
1401140b7: 0f298540010000 movaps xmmword ptr [rbp + 0x140], xmm0
1401140be: 498b5110 mov rdx, qword ptr [r9 + 0x10]
1401140c2: 48899570010000 mov qword ptr [rbp + 0x170], rdx
1401140c9: 410f1001 movups xmm0, xmmword ptr [r9]
1401140cd: 0f298560010000 movaps xmmword ptr [rbp + 0x160], xmm0
1401140d4: 0f1001 movups xmm0, xmmword ptr [rcx]
1401140d7: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
1401140db: 0f118d88010000 movups xmmword ptr [rbp + 0x188], xmm1
1401140e2: 0f118578010000 movups xmmword ptr [rbp + 0x178], xmm0
1401140e9: f30f6f00 movdqu xmm0, xmmword ptr [rax]
1401140ed: f30f6f4810 movdqu xmm1, xmmword ptr [rax + 0x10]
1401140f2: f30f7f8598010000 movdqu xmmword ptr [rbp + 0x198], xmm0
1401140fa: f30f7f8da8010000 movdqu xmmword ptr [rbp + 0x1a8], xmm1
140114102: 4c8b8560010000 mov r8, qword ptr [rbp + 0x160]
140114109: 488b8568010000 mov rax, qword ptr [rbp + 0x168]
140114110: 498b90f8000000 mov rdx, qword ptr [r8 + 0xf8]
140114117: 498b8800010000 mov rcx, qword ptr [r8 + 0x100]
14011411e: 488d0c8a lea rcx, [rdx + rcx*4]
140114122: 410fb69808010000 movzx ebx, byte ptr [r8 + 0x108]
14011412a: 84db test bl, bl
14011412c: 7410 je 0x14011413e
14011412e: bf08000000 mov edi, 8
140114133: 4531c9 xor r9d, r9d
140114136: 4531d2 xor r10d, r10d
140114139: 4531c0 xor r8d, r8d
14011413c: eb4a jmp 0x140114188
14011413e: be08000000 mov esi, 8
140114143: 4531c9 xor r9d, r9d
140114146: 4531d2 xor r10d, r10d
140114149: 4531c0 xor r8d, r8d
14011414c: e99a000000 jmp 0x1401141eb
140114151: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140114160: 4d8d04f2 lea r8, [r10 + rsi*8]
140114164: 498b7808 mov rdi, qword ptr [r8 + 8]
140114168: 4531d2 xor r10d, r10d
14011416b: 4589d9 mov r9d, r11d
14011416e: 4589d0 mov r8d, r10d
140114171: 41ffc2 inc r10d
140114174: 4e8b1cc7 mov r11, qword ptr [rdi + r8*8]
140114178: 4d89d8 mov r8, r11
14011417b: 49c1e820 shr r8, 0x20
14011417f: 4585db test r11d, r11d
140114182: 0f855c100000 jne 0x1401151e4
140114188: 4539ca cmp r10d, r9d
14011418b: 75e1 jne 0x14011416e
14011418d: 0f1f00 nop dword ptr [rax]
140114190: 4839ca cmp rdx, rcx
140114193: 741e je 0x1401141b3
140114195: 448b1a mov r11d, dword ptr [rdx]
140114198: 4883c204 add rdx, 4
14011419c: 4c8b90a8010000 mov r10, qword ptr [rax + 0x1a8]
1401141a3: 4b8d34db lea rsi, [r11 + r11*8]
1401141a7: 4d8b5cf210 mov r11, qword ptr [r10 + rsi*8 + 0x10]
1401141ac: 4d85db test r11, r11
1401141af: 74df je 0x140114190
1401141b1: ebad jmp 0x140114160
1401141b3: be08000000 mov esi, 8
1401141b8: eb62 jmp 0x14011421c
1401141ba: 660f1f440000 nop word ptr [rax + rax]
1401141c0: 4901fa add r10, rdi
1401141c3: 498b7250 mov rsi, qword ptr [r10 + 0x50]
1401141c7: 4531d2 xor r10d, r10d
1401141ca: 4589d9 mov r9d, r11d
1401141cd: 4589d0 mov r8d, r10d
1401141d0: 49c1e004 shl r8, 4
1401141d4: 41ffc2 inc r10d
1401141d7: 4e8b1c06 mov r11, qword ptr [rsi + r8]
1401141db: 4d89d8 mov r8, r11
1401141de: 49c1e820 shr r8, 0x20
1401141e2: 4585db test r11d, r11d
1401141e5: 0f8503100000 jne 0x1401151ee
1401141eb: 4539ca cmp r10d, r9d
1401141ee: 75dd jne 0x1401141cd
1401141f0: 4839ca cmp rdx, rcx
1401141f3: 7422 je 0x140114217
1401141f5: 448b1a mov r11d, dword ptr [rdx]
1401141f8: 4883c204 add rdx, 4
1401141fc: 4c8b9008010000 mov r10, qword ptr [rax + 0x108]
140114203: 4b8d3c9b lea rdi, [r11 + r11*4]
140114207: 48c1e705 shl rdi, 5
14011420b: 4d8b5c3a58 mov r11, qword ptr [r10 + rdi + 0x58]
140114210: 4d85db test r11, r11
140114213: 74db je 0x1401141f0
140114215: eba9 jmp 0x1401141c0
140114217: bf08000000 mov edi, 8
14011421c: 4889ca mov rdx, rcx
14011421f: 4589ca mov r10d, r9d
140114222: 4531db xor r11d, r11d
140114225: 84db test bl, bl
140114227: 0f847f000000 je 0x1401142ac
14011422d: eb1e jmp 0x14011424d
14011422f: 90 nop
140114230: 4d8d14f2 lea r10, [r10 + rsi*8]
140114234: 498b7a08 mov rdi, qword ptr [r10 + 8]
140114238: 4531d2 xor r10d, r10d
14011423b: 4489d6 mov esi, r10d
14011423e: 41ffc2 inc r10d
140114241: 8b1cf7 mov ebx, dword ptr [rdi + rsi*8]
140114244: 4885db test rbx, rbx
140114247: 0f859c000000 jne 0x1401142e9
14011424d: 4539ca cmp r10d, r9d
140114250: 75e9 jne 0x14011423b
140114252: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140114260: 4839ca cmp rdx, rcx
140114263: 0f847e000000 je 0x1401142e7
140114269: 448b0a mov r9d, dword ptr [rdx]
14011426c: 4883c204 add rdx, 4
140114270: 4c8b90a8010000 mov r10, qword ptr [rax + 0x1a8]
140114277: 4b8d34c9 lea rsi, [r9 + r9*8]
14011427b: 4d8b4cf210 mov r9, qword ptr [r10 + rsi*8 + 0x10]
140114280: 4d85c9 test r9, r9
140114283: 74db je 0x140114260
140114285: eba9 jmp 0x140114230
140114287: 660f1f840000000000 nop word ptr [rax + rax]
140114290: 4901f2 add r10, rsi
140114293: 498b7250 mov rsi, qword ptr [r10 + 0x50]
140114297: 4531d2 xor r10d, r10d
14011429a: 4489d7 mov edi, r10d
14011429d: 48c1e704 shl rdi, 4
1401142a1: 41ffc2 inc r10d
1401142a4: 8b1c3e mov ebx, dword ptr [rsi + rdi]
1401142a7: 4885db test rbx, rbx
1401142aa: 753d jne 0x1401142e9
1401142ac: 4539ca cmp r10d, r9d
1401142af: 75e9 jne 0x14011429a
1401142b1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401142c0: 4839ca cmp rdx, rcx
1401142c3: 7422 je 0x1401142e7
1401142c5: 448b0a mov r9d, dword ptr [rdx]
1401142c8: 4883c204 add rdx, 4
1401142cc: 4c8b9008010000 mov r10, qword ptr [rax + 0x108]
1401142d3: 4b8d3489 lea rsi, [r9 + r9*4]
1401142d7: 48c1e605 shl rsi, 5
1401142db: 4d8b4c3258 mov r9, qword ptr [r10 + rsi + 0x58]
1401142e0: 4d85c9 test r9, r9
1401142e3: 74db je 0x1401142c0
1401142e5: eba9 jmp 0x140114290
1401142e7: 31db xor ebx, ebx
1401142e9: 4489d9 mov ecx, r11d
1401142ec: 49c1e020 shl r8, 0x20
1401142f0: 4909c8 or r8, rcx
1401142f3: 4885db test rbx, rbx
1401142f6: 48b80000000001000000 movabs rax, 0x100000000
140114300: 490f44c0 cmove rax, r8
140114304: 4885c9 test rcx, rcx
140114307: 480f44c1 cmove rax, rcx
14011430b: 85c0 test eax, eax
14011430d: 0f846f0e0000 je 0x140115182
140114313: 488bb520010000 mov rsi, qword ptr [rbp + 0x120]
14011431a: 488b9d40010000 mov rbx, qword ptr [rbp + 0x140]
140114321: 488bbd78010000 mov rdi, qword ptr [rbp + 0x178]
140114328: 48898528020000 mov qword ptr [rbp + 0x228], rax
14011432f: 48837b1800 cmp qword ptr [rbx + 0x18], 0
140114334: 0f84480e0000 je 0x140115182
14011433a: 488d4b20 lea rcx, [rbx + 0x20]
14011433e: 488d15f3d9cb05 lea rdx, [rip + 0x5cbd9f3]
140114345: e87633f0ff call 0x1400176c0
14011434a: 4989c0 mov r8, rax
14011434d: 49c1e839 shr r8, 0x39
140114351: 488b0b mov rcx, qword ptr [rbx]
140114354: 488b5308 mov rdx, qword ptr [rbx + 8]
140114358: 66410f6ec0 movd xmm0, r8d
14011435d: 660f60c0 punpcklbw xmm0, xmm0
140114361: f20f70c000 pshuflw xmm0, xmm0, 0
140114366: 660f70c044 pshufd xmm0, xmm0, 0x44
14011436b: 4531c0 xor r8d, r8d
14011436e: 660f76c9 pcmpeqd xmm1, xmm1
140114372: 4821d0 and rax, rdx
140114375: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
14011437a: 660f6fda movdqa xmm3, xmm2
14011437e: 660f74d8 pcmpeqb xmm3, xmm0
140114382: 66440fd7cb pmovmskb r9d, xmm3
140114387: 4585c9 test r9d, r9d
14011438a: 7429 je 0x1401143b5
14011438c: f3450fbcd9 tzcnt r11d, r9d
140114391: 4901c3 add r11, rax
140114394: 4921d3 and r11, rdx
140114397: 49c1e305 shl r11, 5
14011439b: 4989ca mov r10, rcx
14011439e: 4d29da sub r10, r11
1401143a1: 41807ae007 cmp byte ptr [r10 - 0x20], 7
1401143a6: 742c je 0x1401143d4
1401143a8: 458d51ff lea r10d, [r9 - 1]
1401143ac: 664521ca and r10w, r9w
1401143b0: 4589d1 mov r9d, r10d
1401143b3: 75d7 jne 0x14011438c
1401143b5: 660f74d1 pcmpeqb xmm2, xmm1
1401143b9: 66440fd7ca pmovmskb r9d, xmm2
1401143be: 4585c9 test r9d, r9d
1401143c1: 0f85bb0d0000 jne 0x140115182
1401143c7: 4c01c0 add rax, r8
1401143ca: 4883c010 add rax, 0x10
1401143ce: 4983c010 add r8, 0x10
1401143d2: eb9e jmp 0x140114372
1401143d4: 41807ae800 cmp byte ptr [r10 - 0x18], 0
1401143d9: 743a je 0x140114415
1401143db: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
1401143e0: 8845d2 mov byte ptr [rbp - 0x2e], al
1401143e3: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
1401143e8: 668945d0 mov word ptr [rbp - 0x30], ax
1401143ec: 498d42ec lea rax, [r10 - 0x14]
1401143f0: 498d4af0 lea rcx, [r10 - 0x10]
1401143f4: 418b52f4 mov edx, dword ptr [r10 - 0xc]
1401143f8: 450fb642f8 movzx r8d, byte ptr [r10 - 8]
1401143fd: 49c1e020 shl r8, 0x20
140114401: 4909d0 or r8, rdx
140114404: 4c898508020000 mov qword ptr [rbp + 0x208], r8
14011440b: b201 mov dl, 1
14011440d: 89955c020000 mov dword ptr [rbp + 0x25c], edx
140114413: eb16 jmp 0x14011442b
140114415: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
140114419: 488d4168 lea rax, [rcx + 0x68]
14011441d: 4883c16c add rcx, 0x6c
140114421: c7855c02000000000000 mov dword ptr [rbp + 0x25c], 0
14011442b: 8b09 mov ecx, dword ptr [rcx]
14011442d: 898d44020000 mov dword ptr [rbp + 0x244], ecx
140114433: 8b00 mov eax, dword ptr [rax]
140114435: 898548020000 mov dword ptr [rbp + 0x248], eax
14011443b: 0fb645d2 movzx eax, byte ptr [rbp - 0x2e]
14011443f: 8885ae020000 mov byte ptr [rbp + 0x2ae], al
140114445: 0fb745d0 movzx eax, word ptr [rbp - 0x30]
140114449: 668985ac020000 mov word ptr [rbp + 0x2ac], ax
140114450: f30f10775c movss xmm6, dword ptr [rdi + 0x5c]
140114455: 48c7856802000000000000 mov qword ptr [rbp + 0x268], 0
140114460: 48c7857002000004000000 mov qword ptr [rbp + 0x270], 4
14011446b: 48c7857802000000000000 mov qword ptr [rbp + 0x278], 0
140114476: 4c8b6e08 mov r13, qword ptr [rsi + 8]
14011447a: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
14011447e: 48c1e707 shl rdi, 7
140114482: 4c01ef add rdi, r13
140114485: f30f100583dfc805 movss xmm0, dword ptr [rip + 0x5c8df83]
14011448d: f30f59c6 mulss xmm0, xmm6
140114491: e8e1e4ad05 call 0x145bf2977
140114496: f30f590586c4cb05 mulss xmm0, dword ptr [rip + 0x5cbc486]
14011449e: f30f58050ac7cb05 addss xmm0, dword ptr [rip + 0x5cbc70a]
1401144a6: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
1401144ae: f30f10058ac2cb05 movss xmm0, dword ptr [rip + 0x5cbc28a]
1401144b6: f30f59c6 mulss xmm0, xmm6
1401144ba: 0f280d0fe0c805 movaps xmm1, xmmword ptr [rip + 0x5c8e00f]
1401144c1: 0f298510020000 movaps xmmword ptr [rbp + 0x210], xmm0
1401144c8: 0f57c8 xorps xmm1, xmm0
1401144cb: 0f298d10010000 movaps xmmword ptr [rbp + 0x110], xmm1
1401144d2: f30f1005d61cc905 movss xmm0, dword ptr [rip + 0x5c91cd6]
1401144da: f30f11b53c020000 movss dword ptr [rbp + 0x23c], xmm6
1401144e2: f30f59c6 mulss xmm0, xmm6
1401144e6: f30f118540020000 movss dword ptr [rbp + 0x240], xmm0
1401144ee: b804000000 mov eax, 4
1401144f3: 48898560020000 mov qword ptr [rbp + 0x260], rax
1401144fa: bb00000080 mov ebx, 0x80000000
1401144ff: 4c8db5c0010000 lea r14, [rbp + 0x1c0]
140114506: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
140114510: 4c89ee mov rsi, r13
140114513: 4939fd cmp r13, rdi
140114516: 0f84400c0000 je 0x14011515c
14011451c: 807e7c00 cmp byte ptr [rsi + 0x7c], 0
140114520: 741e je 0x140114540
140114522: 48b86666e63e0000803f movabs rax, 0x3f8000003ee66666
14011452c: 48898590020000 mov qword ptr [rbp + 0x290], rax
140114533: c78598020000cdcc0c3f mov dword ptr [rbp + 0x298], 0x3f0ccccd
14011453d: eb71 jmp 0x1401145b0
14011453f: 90 nop
140114540: 0fb6467d movzx eax, byte ptr [rsi + 0x7d]
140114544: 488d0d2dedcb05 lea rcx, [rip + 0x5cbed2d]
14011454b: 48630481 movsxd rax, dword ptr [rcx + rax*4]
14011454f: 4801c8 add rax, rcx
140114552: ffe0 jmp rax
140114554: f20f100594c6cb05 movsd xmm0, qword ptr [rip + 0x5cbc694]
14011455c: f20f118590020000 movsd qword ptr [rbp + 0x290], xmm0
140114564: c785980200008fc2f53d mov dword ptr [rbp + 0x298], 0x3df5c28f
14011456e: eb40 jmp 0x1401145b0
140114570: f20f100558c6cb05 movsd xmm0, qword ptr [rip + 0x5cbc658]
140114578: eb24 jmp 0x14011459e
14011457a: f20f10053ec6cb05 movsd xmm0, qword ptr [rip + 0x5cbc63e]
140114582: f20f118590020000 movsd qword ptr [rbp + 0x290], xmm0
14011458a: c785980200000ad7a33d mov dword ptr [rbp + 0x298], 0x3da3d70a
140114594: eb1a jmp 0x1401145b0
140114596: f20f100542c6cb05 movsd xmm0, qword ptr [rip + 0x5cbc642]
14011459e: f20f118590020000 movsd qword ptr [rbp + 0x290], xmm0
1401145a6: c785980200000000803f mov dword ptr [rbp + 0x298], 0x3f800000
1401145b0: 837e3001 cmp dword ptr [rsi + 0x30], 1
1401145b4: f30f100d5430c805 movss xmm1, dword ptr [rip + 0x5c83054]
1401145bc: 0f28c1 movaps xmm0, xmm1
1401145bf: 7530 jne 0x1401145f1
1401145c1: f30f104634 movss xmm0, dword ptr [rsi + 0x34]
1401145c6: f30f5c853c020000 subss xmm0, dword ptr [rbp + 0x23c]
1401145ce: f30f59056232c805 mulss xmm0, dword ptr [rip + 0x5c83262]
1401145d6: 0f57c9 xorps xmm1, xmm1
1401145d9: f30f5fc8 maxss xmm1, xmm0
1401145dd: f30f10052b30c805 movss xmm0, dword ptr [rip + 0x5c8302b]
1401145e5: f30f5dc1 minss xmm0, xmm1
1401145e9: f30f100d0fc6cb05 movss xmm1, dword ptr [rip + 0x5cbc60f]
1401145f1: f30f118d50020000 movss dword ptr [rbp + 0x250], xmm1
1401145f9: f30f11854c020000 movss dword ptr [rbp + 0x24c], xmm0
140114601: 0f57c0 xorps xmm0, xmm0
140114604: 807e7d02 cmp byte ptr [rsi + 0x7d], 2
140114608: f30f108d38020000 movss xmm1, dword ptr [rbp + 0x238]
140114610: 7349 jae 0x14011465b
140114612: f30f104678 movss xmm0, dword ptr [rsi + 0x78]
140114617: f30f5805e5c5cb05 addss xmm0, dword ptr [rip + 0x5cbc5e5]
14011461f: f30f5e05f9c0cb05 divss xmm0, dword ptr [rip + 0x5cbc0f9]
140114627: 0f57c9 xorps xmm1, xmm1
14011462a: f30f5fc8 maxss xmm1, xmm0
14011462e: f30f101dda2fc805 movss xmm3, dword ptr [rip + 0x5c82fda]
140114636: 0f28d3 movaps xmm2, xmm3
140114639: f30f5dd1 minss xmm2, xmm1
14011463d: 0f28ca movaps xmm1, xmm2
140114640: f30f59ca mulss xmm1, xmm2
140114644: f30f58d2 addss xmm2, xmm2
140114648: f30f1005c0ddc805 movss xmm0, dword ptr [rip + 0x5c8ddc0]
140114650: f30f5cc2 subss xmm0, xmm2
140114654: f30f59c1 mulss xmm0, xmm1
140114658: 0f28cb movaps xmm1, xmm3
14011465b: 4c8dae80000000 lea r13, [rsi + 0x80]
140114662: f30f118d34020000 movss dword ptr [rbp + 0x234], xmm1
14011466a: f30f118530020000 movss dword ptr [rbp + 0x230], xmm0
140114672: f30f104668 movss xmm0, dword ptr [rsi + 0x68]
140114677: 8b4664 mov eax, dword ptr [rsi + 0x64]
14011467a: 31d8 xor eax, ebx
14011467c: 8b4e60 mov ecx, dword ptr [rsi + 0x60]
14011467f: 31d9 xor ecx, ebx
140114681: 89859c020000 mov dword ptr [rbp + 0x29c], eax
140114687: 0f28f8 movaps xmm7, xmm0
14011468a: f30f1185a0020000 movss dword ptr [rbp + 0x2a0], xmm0
140114692: 898da4020000 mov dword ptr [rbp + 0x2a4], ecx
140114698: 488d8590020000 lea rax, [rbp + 0x290]
14011469f: 488985c0010000 mov qword ptr [rbp + 0x1c0], rax
1401146a6: 4889b5c8010000 mov qword ptr [rbp + 0x1c8], rsi
1401146ad: 488d8530020000 lea rax, [rbp + 0x230]
1401146b4: 488985d0010000 mov qword ptr [rbp + 0x1d0], rax
1401146bb: 488d8550020000 lea rax, [rbp + 0x250]
1401146c2: 488985d8010000 mov qword ptr [rbp + 0x1d8], rax
1401146c9: 488d854c020000 lea rax, [rbp + 0x24c]
1401146d0: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
1401146d7: 488d8534020000 lea rax, [rbp + 0x234]
1401146de: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
1401146e5: 488d8598010000 lea rax, [rbp + 0x198]
1401146ec: 488985f0010000 mov qword ptr [rbp + 0x1f0], rax
1401146f3: 488d8528020000 lea rax, [rbp + 0x228]
1401146fa: 488985f8010000 mov qword ptr [rbp + 0x1f8], rax
140114701: 488d859c020000 lea rax, [rbp + 0x29c]
140114708: 48898500020000 mov qword ptr [rbp + 0x200], rax
14011470f: 4c8b7e08 mov r15, qword ptr [rsi + 8]
140114713: 488b4610 mov rax, qword ptr [rsi + 0x10]
140114717: 4c8d2440 lea r12, [rax + rax*2]
14011471b: 49c1e404 shl r12, 4
14011471f: 4d01fc add r12, r15
140114722: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140114730: 4d39e7 cmp r15, r12
140114733: 741b je 0x140114750
140114735: 4c89fa mov rdx, r15
140114738: 4983c730 add r15, 0x30
14011473c: 807a2c00 cmp byte ptr [rdx + 0x2c], 0
140114740: 75ee jne 0x140114730
140114742: 4c89f1 mov rcx, r14
140114745: e86669fdff call 0x1400eb0b0
14011474a: 90 nop
14011474b: ebe3 jmp 0x140114730
14011474d: 0f1f00 nop dword ptr [rax]
140114750: 4c8b6620 mov r12, qword ptr [rsi + 0x20]
140114754: 488b4628 mov rax, qword ptr [rsi + 0x28]
140114758: 4c8d3c40 lea r15, [rax + rax*2]
14011475c: 49c1e704 shl r15, 4
140114760: 4d01e7 add r15, r12
140114763: 4d39fc cmp r12, r15
140114766: 741d je 0x140114785
140114768: 0f1f840000000000 nop dword ptr [rax + rax]
140114770: 4c89f1 mov rcx, r14
140114773: 4c89e2 mov rdx, r12
140114776: e83569fdff call 0x1400eb0b0
14011477b: 90 nop
14011477c: 4983c430 add r12, 0x30
140114780: 4d39fc cmp r12, r15
140114783: 75eb jne 0x140114770
140114785: 4c8b7e08 mov r15, qword ptr [rsi + 8]
140114789: 488b4610 mov rax, qword ptr [rsi + 0x10]
14011478d: 4c8d2440 lea r12, [rax + rax*2]
140114791: 49c1e404 shl r12, 4
140114795: 4d01fc add r12, r15
140114798: 0f1f840000000000 nop dword ptr [rax + rax]
1401147a0: 4d39e7 cmp r15, r12
1401147a3: 741b je 0x1401147c0
1401147a5: 4c89fa mov rdx, r15
1401147a8: 4983c730 add r15, 0x30
1401147ac: 807a2c00 cmp byte ptr [rdx + 0x2c], 0
1401147b0: 74ee je 0x1401147a0
1401147b2: 4c89f1 mov rcx, r14
1401147b5: e8f668fdff call 0x1400eb0b0
1401147ba: 90 nop
1401147bb: ebe3 jmp 0x1401147a0
1401147bd: 0f1f00 nop dword ptr [rax]
1401147c0: 807e7d01 cmp byte ptr [rsi + 0x7d], 1
1401147c4: 0f8546fdffff jne 0x140114510
1401147ca: 837e5400 cmp dword ptr [rsi + 0x54], 0
1401147ce: 0f853cfdffff jne 0x140114510
1401147d4: f3440f10b550020000 movss xmm14, dword ptr [rbp + 0x250]
1401147dd: f20f108d90020000 movsd xmm1, qword ptr [rbp + 0x290]
1401147e5: f3410f12c6 movsldup xmm0, xmm14
1401147ea: 0f59c1 mulps xmm0, xmm1
1401147ed: 0f28c8 movaps xmm1, xmm0
1401147f0: 0f5d0d99dcc805 minps xmm1, xmmword ptr [rip + 0x5c8dc99]
1401147f7: 807e7c00 cmp byte ptr [rsi + 0x7c], 0
1401147fb: f30f10154d88cb05 movss xmm2, dword ptr [rip + 0x5cb884d]
140114803: 7508 jne 0x14011480d
140114805: f30f1015032ec805 movss xmm2, dword ptr [rip + 0x5c82e03]
14011480d: f30f106e58 movss xmm5, dword ptr [rsi + 0x58]
140114812: 0f28da movaps xmm3, xmm2
140114815: 0f28f1 movaps xmm6, xmm1
140114818: 0fc2f103 cmpunordps xmm6, xmm1
14011481c: 0f54c6 andps xmm0, xmm6
14011481f: 0f55f1 andnps xmm6, xmm1
140114822: 0f56f0 orps xmm6, xmm0
140114825: f3440f59b598020000 mulss xmm14, dword ptr [rbp + 0x298]
14011482e: f3440f5d35d92dc805 minss xmm14, dword ptr [rip + 0x5c82dd9]
140114837: f30f599d4c020000 mulss xmm3, dword ptr [rbp + 0x24c]
14011483f: 0f28cd movaps xmm1, xmm5
140114842: f30f580da62fc805 addss xmm1, dword ptr [rip + 0x5c82fa6]
14011484a: 0f28e7 movaps xmm4, xmm7
14011484d: f30f58254bdcc805 addss xmm4, dword ptr [rip + 0x5c8dc4b]
140114855: 48c7857802000000000000 mov qword ptr [rbp + 0x278], 0
140114860: 0f28c4 movaps xmm0, xmm4
140114863: f30f118d58020000 movss dword ptr [rbp + 0x258], xmm1
14011486b: f30f58c1 addss xmm0, xmm1
14011486f: f30f119da8020000 movss dword ptr [rbp + 0x2a8], xmm3
140114877: f30f591d51bfcb05 mulss xmm3, dword ptr [rip + 0x5cbbf51]
14011487f: f30f108d9c020000 movss xmm1, dword ptr [rbp + 0x29c]
140114887: 660f6e95a4020000 movd xmm2, dword ptr [rbp + 0x2a4]
14011488f: 660f7ed8 movd eax, xmm3
140114893: 0f1375d0 movlps qword ptr [rbp - 0x30], xmm6
140114897: f3440f1175d8 movss dword ptr [rbp - 0x28], xmm14
14011489d: 488d4dd0 lea rcx, [rbp - 0x30]
1401148a1: 48894c2440 mov qword ptr [rsp + 0x40], rcx
1401148a6: 4889442438 mov qword ptr [rsp + 0x38], rax
1401148ab: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
1401148b1: f30f11a554020000 movss dword ptr [rbp + 0x254], xmm4
1401148b9: f30f11642428 movss dword ptr [rsp + 0x28], xmm4
1401148bf: 0f288510020000 movaps xmm0, xmmword ptr [rbp + 0x210]
1401148c6: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1401148cc: 488d8d68020000 lea rcx, [rbp + 0x268]
1401148d3: f30f11adb0020000 movss dword ptr [rbp + 0x2b0], xmm5
1401148db: 0f28dd movaps xmm3, xmm5
1401148de: e87d39feff call 0x1400f8260
1401148e3: 90 nop
1401148e4: f30f104678 movss xmm0, dword ptr [rsi + 0x78]
1401148e9: 0f2e055087cb05 ucomiss xmm0, dword ptr [rip + 0x5cb8750]
1401148f0: 0f869c000000 jbe 0x140114992
1401148f6: f30f598558020000 mulss xmm0, dword ptr [rbp + 0x258]
1401148fe: f30f10bd54020000 movss xmm7, dword ptr [rbp + 0x254]
140114906: f30f58c7 addss xmm0, xmm7
14011490a: f30f109db0020000 movss xmm3, dword ptr [rbp + 0x2b0]
140114912: f30f591deec2cb05 mulss xmm3, dword ptr [rip + 0x5cbc2ee]
14011491a: f30f10ada8020000 movss xmm5, dword ptr [rbp + 0x2a8]
140114922: 0f28e5 movaps xmm4, xmm5
140114925: f30f5925e72cc805 mulss xmm4, dword ptr [rip + 0x5c82ce7]
14011492d: f30f592dd7c2cb05 mulss xmm5, dword ptr [rip + 0x5cbc2d7]
140114935: f30f108d9c020000 movss xmm1, dword ptr [rbp + 0x29c]
14011493d: 660f6e95a4020000 movd xmm2, dword ptr [rbp + 0x2a4]
140114945: 660f7ee0 movd eax, xmm4
140114949: 660f7ee9 movd ecx, xmm5
14011494d: 48c1e120 shl rcx, 0x20
140114951: 4809c8 or rax, rcx
140114954: 0f1375d0 movlps qword ptr [rbp - 0x30], xmm6
140114958: f3440f1175d8 movss dword ptr [rbp - 0x28], xmm14
14011495e: 488d4dd0 lea rcx, [rbp - 0x30]
140114962: 48894c2440 mov qword ptr [rsp + 0x40], rcx
140114967: 4889442438 mov qword ptr [rsp + 0x38], rax
14011496c: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
140114972: f30f117c2428 movss dword ptr [rsp + 0x28], xmm7
140114978: 0f288510010000 movaps xmm0, xmmword ptr [rbp + 0x110]
14011497f: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140114985: 488d8d68020000 lea rcx, [rbp + 0x268]
14011498c: e8cf38feff call 0x1400f8260
140114991: 90 nop
140114992: f30f1085a8020000 movss xmm0, dword ptr [rbp + 0x2a8]
14011499a: f30f59050218c905 mulss xmm0, dword ptr [rip + 0x5c91802]
1401149a2: f30f1185a8020000 movss dword ptr [rbp + 0x2a8], xmm0
1401149aa: f30f1085b0020000 movss xmm0, dword ptr [rbp + 0x2b0]
1401149b2: f30f590556c2cb05 mulss xmm0, dword ptr [rip + 0x5cbc256]
1401149ba: f30f1185b0020000 movss dword ptr [rbp + 0x2b0], xmm0
1401149c2: 4531e4 xor r12d, r12d
1401149c5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401149d0: 488d7570 lea rsi, [rbp + 0x70]
1401149d4: 4983fc02 cmp r12, 2
1401149d8: 0f8359060000 jae 0x140115037
1401149de: f34d0f2ac4 cvtsi2ss xmm8, r12
1401149e3: 49ffc4 inc r12
1401149e6: f3440f5905252cc805 mulss xmm8, dword ptr [rip + 0x5c82c25]
1401149ef: f3440f588540020000 addss xmm8, dword ptr [rbp + 0x240]
1401149f8: 410f28c0 movaps xmm0, xmm8
1401149fc: e870dfad05 call 0x145bf2971
140114a01: f3440f5cc0 subss xmm8, xmm0
140114a06: f30f108558020000 movss xmm0, dword ptr [rbp + 0x258]
140114a0e: f3410f59c0 mulss xmm0, xmm8
140114a13: f30f588554020000 addss xmm0, dword ptr [rbp + 0x254]
140114a1b: f3440f1025ec2bc805 movss xmm12, dword ptr [rip + 0x5c82bec]
140114a24: f3450f5ce0 subss xmm12, xmm8
140114a29: f3440f59a5a8020000 mulss xmm12, dword ptr [rbp + 0x2a8]
140114a32: f30f118560020000 movss dword ptr [rbp + 0x260], xmm0
140114a3a: f30f5805d2c1cb05 addss xmm0, dword ptr [rip + 0x5cbc1d2]
140114a42: f30f118584020000 movss dword ptr [rbp + 0x284], xmm0
140114a4a: f30f10859c020000 movss xmm0, dword ptr [rbp + 0x29c]
140114a52: f30f118588020000 movss dword ptr [rbp + 0x288], xmm0
140114a5a: f30f1085a4020000 movss xmm0, dword ptr [rbp + 0x2a4]
140114a62: f30f11858c020000 movss dword ptr [rbp + 0x28c], xmm0
140114a6a: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
140114a71: 31f6 xor esi, esi
140114a73: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140114a80: 0f57ff xorps xmm7, xmm7
140114a83: f3480f2afe cvtsi2ss xmm7, rsi
140114a88: 48ffc6 inc rsi
140114a8b: f3440f101dbcbfcb05 movss xmm11, dword ptr [rip + 0x5cbbfbc]
140114a94: f3410f59fb mulss xmm7, xmm11
140114a99: 440f28cf movaps xmm9, xmm7
140114a9d: f3440f103d8a17c905 movss xmm15, dword ptr [rip + 0x5c9178a]
140114aa6: f3450f59cf mulss xmm9, xmm15
140114aab: 440f289510020000 movaps xmm10, xmmword ptr [rbp + 0x210]
140114ab3: f3450f58ca addss xmm9, xmm10
140114ab8: 410f28c1 movaps xmm0, xmm9
140114abc: e8bcdead05 call 0x145bf297d
140114ac1: 440f28c0 movaps xmm8, xmm0
140114ac5: 410f28c1 movaps xmm0, xmm9
140114ac9: e8a9dead05 call 0x145bf2977
140114ace: 440f28c8 movaps xmm9, xmm0
140114ad2: f34c0f2aee cvtsi2ss xmm13, rsi
140114ad7: f3450f59eb mulss xmm13, xmm11
140114adc: 450f28dd movaps xmm11, xmm13
140114ae0: f3450f59df mulss xmm11, xmm15
140114ae5: f3450f58da addss xmm11, xmm10
140114aea: 410f28c3 movaps xmm0, xmm11
140114aee: e88adead05 call 0x145bf297d
140114af3: 440f28d0 movaps xmm10, xmm0
140114af7: 410f28c3 movaps xmm0, xmm11
140114afb: e877dead05 call 0x145bf2977
140114b00: 440f28d8 movaps xmm11, xmm0
140114b04: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140114b0b: 4c29f8 sub rax, r15
140114b0e: 4883f805 cmp rax, 5
140114b12: 0f86ee010000 jbe 0x140114d06
140114b18: f30f1085b0020000 movss xmm0, dword ptr [rbp + 0x2b0]
140114b20: f3440f59c0 mulss xmm8, xmm0
140114b25: f30f108d88020000 movss xmm1, dword ptr [rbp + 0x288]
140114b2d: f3440f58c1 addss xmm8, xmm1
140114b32: f3440f59c8 mulss xmm9, xmm0
140114b37: f30f10958c020000 movss xmm2, dword ptr [rbp + 0x28c]
140114b3f: f3440f58ca addss xmm9, xmm2
140114b44: f3440f59d0 mulss xmm10, xmm0
140114b49: f3440f58d1 addss xmm10, xmm1
140114b4e: f3440f59d8 mulss xmm11, xmm0
140114b53: f3440f58da addss xmm11, xmm2
140114b58: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140114b5f: 4b8d0cff lea rcx, [r15 + r15*8]
140114b63: f3440f110488 movss dword ptr [rax + rcx*4], xmm8
140114b69: f30f108d84020000 movss xmm1, dword ptr [rbp + 0x284]
140114b71: f30f114c8804 movss dword ptr [rax + rcx*4 + 4], xmm1
140114b77: f3440f114c8808 movss dword ptr [rax + rcx*4 + 8], xmm9
140114b7e: f30f117c880c movss dword ptr [rax + rcx*4 + 0xc], xmm7
140114b84: c74488100000003f mov dword ptr [rax + rcx*4 + 0x10], 0x3f000000
140114b8c: 0f13748814 movlps qword ptr [rax + rcx*4 + 0x14], xmm6
140114b91: f3440f1174881c movss dword ptr [rax + rcx*4 + 0x1c], xmm14
140114b98: c744882000000000 mov dword ptr [rax + rcx*4 + 0x20], 0
140114ba0: f3440f11548824 movss dword ptr [rax + rcx*4 + 0x24], xmm10
140114ba7: f30f114c8828 movss dword ptr [rax + rcx*4 + 0x28], xmm1
140114bad: f3440f115c882c movss dword ptr [rax + rcx*4 + 0x2c], xmm11
140114bb4: f3440f116c8830 movss dword ptr [rax + rcx*4 + 0x30], xmm13
140114bbb: c74488340000003f mov dword ptr [rax + rcx*4 + 0x34], 0x3f000000
140114bc3: 0f13748838 movlps qword ptr [rax + rcx*4 + 0x38], xmm6
140114bc8: f3440f11748840 movss dword ptr [rax + rcx*4 + 0x40], xmm14
140114bcf: c744884400000000 mov dword ptr [rax + rcx*4 + 0x44], 0
140114bd7: f3440f11548848 movss dword ptr [rax + rcx*4 + 0x48], xmm10
140114bde: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140114be6: f30f1144884c movss dword ptr [rax + rcx*4 + 0x4c], xmm0
140114bec: f3440f115c8850 movss dword ptr [rax + rcx*4 + 0x50], xmm11
140114bf3: f3440f116c8854 movss dword ptr [rax + rcx*4 + 0x54], xmm13
140114bfa: c74488580000003f mov dword ptr [rax + rcx*4 + 0x58], 0x3f000000
140114c02: 0f1374885c movlps qword ptr [rax + rcx*4 + 0x5c], xmm6
140114c07: f3440f11748864 movss dword ptr [rax + rcx*4 + 0x64], xmm14
140114c0e: f3440f11648868 movss dword ptr [rax + rcx*4 + 0x68], xmm12
140114c15: f3440f1144886c movss dword ptr [rax + rcx*4 + 0x6c], xmm8
140114c1c: f30f114c8870 movss dword ptr [rax + rcx*4 + 0x70], xmm1
140114c22: f3440f114c8874 movss dword ptr [rax + rcx*4 + 0x74], xmm9
140114c29: f30f117c8878 movss dword ptr [rax + rcx*4 + 0x78], xmm7
140114c2f: c744887c0000003f mov dword ptr [rax + rcx*4 + 0x7c], 0x3f000000
140114c37: 0f13b48880000000 movlps qword ptr [rax + rcx*4 + 0x80], xmm6
140114c3f: f3440f11b48888000000 movss dword ptr [rax + rcx*4 + 0x88], xmm14
140114c49: c784888c00000000000000 mov dword ptr [rax + rcx*4 + 0x8c], 0
140114c54: f3440f11948890000000 movss dword ptr [rax + rcx*4 + 0x90], xmm10
140114c5e: f30f11848894000000 movss dword ptr [rax + rcx*4 + 0x94], xmm0
140114c67: f3440f119c8898000000 movss dword ptr [rax + rcx*4 + 0x98], xmm11
140114c71: f3440f11ac889c000000 movss dword ptr [rax + rcx*4 + 0x9c], xmm13
140114c7b: c78488a00000000000003f mov dword ptr [rax + rcx*4 + 0xa0], 0x3f000000
140114c86: 0f13b488a4000000 movlps qword ptr [rax + rcx*4 + 0xa4], xmm6
140114c8e: f3440f11b488ac000000 movss dword ptr [rax + rcx*4 + 0xac], xmm14
140114c98: f3440f11a488b0000000 movss dword ptr [rax + rcx*4 + 0xb0], xmm12
140114ca2: f3440f118488b4000000 movss dword ptr [rax + rcx*4 + 0xb4], xmm8
140114cac: f30f118488b8000000 movss dword ptr [rax + rcx*4 + 0xb8], xmm0
140114cb5: f3440f118c88bc000000 movss dword ptr [rax + rcx*4 + 0xbc], xmm9
140114cbf: f30f11bc88c0000000 movss dword ptr [rax + rcx*4 + 0xc0], xmm7
140114cc8: c78488c40000000000003f mov dword ptr [rax + rcx*4 + 0xc4], 0x3f000000
140114cd3: 0f13b488c8000000 movlps qword ptr [rax + rcx*4 + 0xc8], xmm6
140114cdb: f3440f11b488d0000000 movss dword ptr [rax + rcx*4 + 0xd0], xmm14
140114ce5: f3440f11a488d4000000 movss dword ptr [rax + rcx*4 + 0xd4], xmm12
140114cef: 4983c706 add r15, 6
140114cf3: 4c89bd78020000 mov qword ptr [rbp + 0x278], r15
140114cfa: 4883fe20 cmp rsi, 0x20
140114cfe: 0f857cfdffff jne 0x140114a80
140114d04: eb3a jmp 0x140114d40
140114d06: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140114d0f: 41b806000000 mov r8d, 6
140114d15: 41b904000000 mov r9d, 4
140114d1b: 488d8d68020000 lea rcx, [rbp + 0x268]
140114d22: 4c89fa mov rdx, r15
140114d25: e866fdad05 call 0x145bf4a90
140114d2a: 90 nop
140114d2b: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
140114d32: e9e1fdffff jmp 0x140114b18
140114d37: 660f1f840000000000 nop word ptr [rax + rax]
140114d40: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140114d48: f30f5805d0b9cb05 addss xmm0, dword ptr [rip + 0x5cbb9d0]
140114d50: f30f118584020000 movss dword ptr [rbp + 0x284], xmm0
140114d58: f30f10859c020000 movss xmm0, dword ptr [rbp + 0x29c]
140114d60: f30f118588020000 movss dword ptr [rbp + 0x288], xmm0
140114d68: f30f1085a4020000 movss xmm0, dword ptr [rbp + 0x2a4]
140114d70: f30f11858c020000 movss dword ptr [rbp + 0x28c], xmm0
140114d78: 31f6 xor esi, esi
140114d7a: 660f1f440000 nop word ptr [rax + rax]
140114d80: f3480f2afe cvtsi2ss xmm7, rsi
140114d85: 48ffc6 inc rsi
140114d88: f3440f101dbfbccb05 movss xmm11, dword ptr [rip + 0x5cbbcbf]
140114d91: f3410f59fb mulss xmm7, xmm11
140114d96: 440f28cf movaps xmm9, xmm7
140114d9a: f3440f103d8d14c905 movss xmm15, dword ptr [rip + 0x5c9148d]
140114da3: f3450f59cf mulss xmm9, xmm15
140114da8: 440f289510020000 movaps xmm10, xmmword ptr [rbp + 0x210]
140114db0: f3450f58ca addss xmm9, xmm10
140114db5: 410f28c1 movaps xmm0, xmm9
140114db9: e8bfdbad05 call 0x145bf297d
140114dbe: 440f28c0 movaps xmm8, xmm0
140114dc2: 410f28c1 movaps xmm0, xmm9
140114dc6: e8acdbad05 call 0x145bf2977
140114dcb: 440f28c8 movaps xmm9, xmm0
140114dcf: f34c0f2aee cvtsi2ss xmm13, rsi
140114dd4: f3450f59eb mulss xmm13, xmm11
140114dd9: 450f28dd movaps xmm11, xmm13
140114ddd: f3450f59df mulss xmm11, xmm15
140114de2: f3450f58da addss xmm11, xmm10
140114de7: 410f28c3 movaps xmm0, xmm11
140114deb: e88ddbad05 call 0x145bf297d
140114df0: 440f28d0 movaps xmm10, xmm0
140114df4: 410f28c3 movaps xmm0, xmm11
140114df8: e87adbad05 call 0x145bf2977
140114dfd: 440f28d8 movaps xmm11, xmm0
140114e01: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140114e08: 4c29f8 sub rax, r15
140114e0b: 4883f805 cmp rax, 5
140114e0f: 0f86f1010000 jbe 0x140115006
140114e15: f30f1085b0020000 movss xmm0, dword ptr [rbp + 0x2b0]
140114e1d: f3440f59c0 mulss xmm8, xmm0
140114e22: f30f108d88020000 movss xmm1, dword ptr [rbp + 0x288]
140114e2a: f3440f58c1 addss xmm8, xmm1
140114e2f: f3440f59c8 mulss xmm9, xmm0
140114e34: f30f10958c020000 movss xmm2, dword ptr [rbp + 0x28c]
140114e3c: f3440f58ca addss xmm9, xmm2
140114e41: f3440f59d0 mulss xmm10, xmm0
140114e46: f3440f58d1 addss xmm10, xmm1
140114e4b: f3440f59d8 mulss xmm11, xmm0
140114e50: f3440f58da addss xmm11, xmm2
140114e55: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140114e5c: 4b8d0cff lea rcx, [r15 + r15*8]
140114e60: f3440f110488 movss dword ptr [rax + rcx*4], xmm8
140114e66: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140114e6e: f30f11448804 movss dword ptr [rax + rcx*4 + 4], xmm0
140114e74: f3440f114c8808 movss dword ptr [rax + rcx*4 + 8], xmm9
140114e7b: f30f117c880c movss dword ptr [rax + rcx*4 + 0xc], xmm7
140114e81: c74488100000003f mov dword ptr [rax + rcx*4 + 0x10], 0x3f000000
140114e89: 0f13748814 movlps qword ptr [rax + rcx*4 + 0x14], xmm6
140114e8e: f3440f1174881c movss dword ptr [rax + rcx*4 + 0x1c], xmm14
140114e95: f3440f11648820 movss dword ptr [rax + rcx*4 + 0x20], xmm12
140114e9c: f3440f11548824 movss dword ptr [rax + rcx*4 + 0x24], xmm10
140114ea3: f30f11448828 movss dword ptr [rax + rcx*4 + 0x28], xmm0
140114ea9: f3440f115c882c movss dword ptr [rax + rcx*4 + 0x2c], xmm11
140114eb0: f3440f116c8830 movss dword ptr [rax + rcx*4 + 0x30], xmm13
140114eb7: c74488340000003f mov dword ptr [rax + rcx*4 + 0x34], 0x3f000000
140114ebf: 0f13748838 movlps qword ptr [rax + rcx*4 + 0x38], xmm6
140114ec4: f3440f11748840 movss dword ptr [rax + rcx*4 + 0x40], xmm14
140114ecb: f3440f11648844 movss dword ptr [rax + rcx*4 + 0x44], xmm12
140114ed2: f3440f11548848 movss dword ptr [rax + rcx*4 + 0x48], xmm10
140114ed9: f30f108d84020000 movss xmm1, dword ptr [rbp + 0x284]
140114ee1: f30f114c884c movss dword ptr [rax + rcx*4 + 0x4c], xmm1
140114ee7: f3440f115c8850 movss dword ptr [rax + rcx*4 + 0x50], xmm11
140114eee: f3440f116c8854 movss dword ptr [rax + rcx*4 + 0x54], xmm13
140114ef5: c74488580000003f mov dword ptr [rax + rcx*4 + 0x58], 0x3f000000
140114efd: 0f1374885c movlps qword ptr [rax + rcx*4 + 0x5c], xmm6
140114f02: f3440f11748864 movss dword ptr [rax + rcx*4 + 0x64], xmm14
140114f09: c744886800000000 mov dword ptr [rax + rcx*4 + 0x68], 0
140114f11: f3440f1144886c movss dword ptr [rax + rcx*4 + 0x6c], xmm8
140114f18: f30f11448870 movss dword ptr [rax + rcx*4 + 0x70], xmm0
140114f1e: f3440f114c8874 movss dword ptr [rax + rcx*4 + 0x74], xmm9
140114f25: f30f117c8878 movss dword ptr [rax + rcx*4 + 0x78], xmm7
140114f2b: c744887c0000003f mov dword ptr [rax + rcx*4 + 0x7c], 0x3f000000
140114f33: 0f13b48880000000 movlps qword ptr [rax + rcx*4 + 0x80], xmm6
140114f3b: f3440f11b48888000000 movss dword ptr [rax + rcx*4 + 0x88], xmm14
140114f45: f3440f11a4888c000000 movss dword ptr [rax + rcx*4 + 0x8c], xmm12
140114f4f: f3440f11948890000000 movss dword ptr [rax + rcx*4 + 0x90], xmm10
140114f59: f30f118c8894000000 movss dword ptr [rax + rcx*4 + 0x94], xmm1
140114f62: f3440f119c8898000000 movss dword ptr [rax + rcx*4 + 0x98], xmm11
140114f6c: f3440f11ac889c000000 movss dword ptr [rax + rcx*4 + 0x9c], xmm13
140114f76: c78488a00000000000003f mov dword ptr [rax + rcx*4 + 0xa0], 0x3f000000
140114f81: 0f13b488a4000000 movlps qword ptr [rax + rcx*4 + 0xa4], xmm6
140114f89: f3440f11b488ac000000 movss dword ptr [rax + rcx*4 + 0xac], xmm14
140114f93: c78488b000000000000000 mov dword ptr [rax + rcx*4 + 0xb0], 0
140114f9e: f3440f118488b4000000 movss dword ptr [rax + rcx*4 + 0xb4], xmm8
140114fa8: f30f118c88b8000000 movss dword ptr [rax + rcx*4 + 0xb8], xmm1
140114fb1: f3440f118c88bc000000 movss dword ptr [rax + rcx*4 + 0xbc], xmm9
140114fbb: f30f11bc88c0000000 movss dword ptr [rax + rcx*4 + 0xc0], xmm7
140114fc4: c78488c40000000000003f mov dword ptr [rax + rcx*4 + 0xc4], 0x3f000000
140114fcf: 0f13b488c8000000 movlps qword ptr [rax + rcx*4 + 0xc8], xmm6
140114fd7: f3440f11b488d0000000 movss dword ptr [rax + rcx*4 + 0xd0], xmm14
140114fe1: c78488d400000000000000 mov dword ptr [rax + rcx*4 + 0xd4], 0
140114fec: 4983c706 add r15, 6
140114ff0: 4c89bd78020000 mov qword ptr [rbp + 0x278], r15
140114ff7: 4883fe20 cmp rsi, 0x20
140114ffb: 0f857ffdffff jne 0x140114d80
140115001: e9caf9ffff jmp 0x1401149d0
140115006: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
14011500f: 41b806000000 mov r8d, 6
140115015: 41b904000000 mov r9d, 4
14011501b: 488d8d68020000 lea rcx, [rbp + 0x268]
140115022: 4c89fa mov rdx, r15
140115025: e866faad05 call 0x145bf4a90
14011502a: 90 nop
14011502b: 4c8bbd78020000 mov r15, qword ptr [rbp + 0x278]
140115032: e9defdffff jmp 0x140114e15
140115037: 488b8598010000 mov rax, qword ptr [rbp + 0x198]
14011503e: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
140115045: 8b4010 mov eax, dword ptr [rax + 0x10]
140115048: 488b9528020000 mov rdx, qword ptr [rbp + 0x228]
14011504f: 448b85b4010000 mov r8d, dword ptr [rbp + 0x1b4]
140115056: 448901 mov dword ptr [rcx], r8d
140115059: 488b8d98010000 mov rcx, qword ptr [rbp + 0x198]
140115060: 448b85a4020000 mov r8d, dword ptr [rbp + 0x2a4]
140115067: 4c8d8dc9000000 lea r9, [rbp + 0xc9]
14011506e: 4589411b mov dword ptr [r9 + 0x1b], r8d
140115072: 4c8b859c020000 mov r8, qword ptr [rbp + 0x29c]
140115079: 4d894113 mov qword ptr [r9 + 0x13], r8
14011507d: 0f57c0 xorps xmm0, xmm0
140115080: 0f294570 movaps xmmword ptr [rbp + 0x70], xmm0
140115084: 48899590000000 mov qword ptr [rbp + 0x90], rdx
14011508b: 48c7859800000001000000 mov qword ptr [rbp + 0x98], 1
140115096: 48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
1401150a1: 8b955c020000 mov edx, dword ptr [rbp + 0x25c]
1401150a7: 8895c8000000 mov byte ptr [rbp + 0xc8], dl
1401150ad: 0fb695ae020000 movzx edx, byte ptr [rbp + 0x2ae]
1401150b4: 41885102 mov byte ptr [r9 + 2], dl
1401150b8: 0fb795ac020000 movzx edx, word ptr [rbp + 0x2ac]
1401150bf: 66418911 mov word ptr [r9], dx
1401150c3: 8b9548020000 mov edx, dword ptr [rbp + 0x248]
1401150c9: 8995cc000000 mov dword ptr [rbp + 0xcc], edx
1401150cf: 8b9544020000 mov edx, dword ptr [rbp + 0x244]
1401150d5: 8995d0000000 mov dword ptr [rbp + 0xd0], edx
1401150db: 488b9508020000 mov rdx, qword ptr [rbp + 0x208]
1401150e2: 488995d4000000 mov qword ptr [rbp + 0xd4], rdx
1401150e9: c785e800000000000046 mov dword ptr [rbp + 0xe8], 0x46000000
1401150f3: 410f114123 movups xmmword ptr [r9 + 0x23], xmm0
1401150f8: 41c7413300000000 mov dword ptr [r9 + 0x33], 0
140115100: 48898d00010000 mov qword ptr [rbp + 0x100], rcx
140115107: 898508010000 mov dword ptr [rbp + 0x108], eax
14011510d: 488b9570020000 mov rdx, qword ptr [rbp + 0x270]
140115114: 4c8b8578020000 mov r8, qword ptr [rbp + 0x278]
14011511b: c685b702000001 mov byte ptr [rbp + 0x2b7], 1
140115122: 4889f1 mov rcx, rsi
140115125: 48899560020000 mov qword ptr [rbp + 0x260], rdx
14011512c: e82fb04a01 call 0x1415c0160
140115131: 90 nop
140115132: 4889f2 mov rdx, rsi
140115135: 41b8a0000000 mov r8d, 0xa0
14011513b: 488d75d0 lea rsi, [rbp - 0x30]
14011513f: 4889f1 mov rcx, rsi
140115142: e8f4d7ad05 call 0x145bf293b
140115147: c685b702000000 mov byte ptr [rbp + 0x2b7], 0
14011514e: 4889f1 mov rcx, rsi
140115151: e86aaf4a01 call 0x1415c00c0
140115156: 90 nop
140115157: e9b4f3ffff jmp 0x140114510
14011515c: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140115163: 4885c0 test rax, rax
140115166: 741a je 0x140115182
140115168: 48c1e002 shl rax, 2
14011516c: 488d14c0 lea rdx, [rax + rax*8]
140115170: 41b804000000 mov r8d, 4
140115176: 488b8d60020000 mov rcx, qword ptr [rbp + 0x260]
14011517d: e84ed0eeff call 0x1400021d0
140115182: 0f28b5c0020000 movaps xmm6, xmmword ptr [rbp + 0x2c0]
140115189: 0f28bdd0020000 movaps xmm7, xmmword ptr [rbp + 0x2d0]
140115190: 440f2885e0020000 movaps xmm8, xmmword ptr [rbp + 0x2e0]
140115198: 440f288df0020000 movaps xmm9, xmmword ptr [rbp + 0x2f0]
1401151a0: 440f289500030000 movaps xmm10, xmmword ptr [rbp + 0x300]
1401151a8: 440f289d10030000 movaps xmm11, xmmword ptr [rbp + 0x310]
1401151b0: 440f28a520030000 movaps xmm12, xmmword ptr [rbp + 0x320]
1401151b8: 440f28ad30030000 movaps xmm13, xmmword ptr [rbp + 0x330]
1401151c0: 440f28b540030000 movaps xmm14, xmmword ptr [rbp + 0x340]
1401151c8: 440f28bd50030000 movaps xmm15, xmmword ptr [rbp + 0x350]
1401151d0: 4881c4e8030000 add rsp, 0x3e8
1401151d7: 5b pop rbx
1401151d8: 5f pop rdi
1401151d9: 5e pop rsi
1401151da: 415c pop r12
1401151dc: 415d pop r13
1401151de: 415e pop r14
1401151e0: 415f pop r15
1401151e2: 5d pop rbp
1401151e3: c3 ret
1401151e4: be08000000 mov esi, 8
1401151e9: e937f0ffff jmp 0x140114225
1401151ee: bf08000000 mov edi, 8
1401151f3: e92df0ffff jmp 0x140114225

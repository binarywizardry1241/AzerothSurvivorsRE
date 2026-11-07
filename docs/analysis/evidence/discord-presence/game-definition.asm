;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x145928330..0x14592affd SHA256 10140f029db04bf44c8d2664984217e2f4f9a54df1673bb5e8529efe67b62da7
0x145928330: push rbp
0x145928331: push r15
0x145928333: push r14
0x145928335: push r13
0x145928337: push r12
0x145928339: push rsi
0x14592833a: push rdi
0x14592833b: push rbx
0x14592833c: sub rsp, 0x268
0x145928343: lea rbp, [rsp + 0x80]
0x14592834b: movaps xmmword ptr [rbp + 0x1d0], xmm11
0x145928353: movaps xmmword ptr [rbp + 0x1c0], xmm10
0x14592835b: movaps xmmword ptr [rbp + 0x1b0], xmm9
0x145928363: movaps xmmword ptr [rbp + 0x1a0], xmm8
0x14592836b: movaps xmmword ptr [rbp + 0x190], xmm7
0x145928372: movaps xmmword ptr [rbp + 0x180], xmm6
0x145928379: mov qword ptr [rbp + 0x178], 0xfffffffffffffffe
0x145928384: mov rsi, rdx
0x145928387: mov qword ptr [rbp - 0x40], rcx
0x14592838b: call 0x140002200
0x145928390: mov ecx, 1
0x145928395: mov edx, 1
0x14592839a: call 0x1400021c0
0x14592839f: test rax, rax
0x1459283a2: je 0x14592aec9
0x1459283a8: mov byte ptr [rax], 0x5b
0x1459283ab: mov rdi, qword ptr [rsi + 0x318]
0x1459283b2: imul rcx, qword ptr [rsi + 0x320], 0x68
0x1459283ba: add rcx, rdi
0x1459283bd: mov qword ptr [rbp + 0x120], rcx
0x1459283c4: mov qword ptr [rbp + 0xb0], rsi
0x1459283cb: movss xmm6, dword ptr [rsi + 0x480]
0x1459283d3: mov r10b, 1
0x1459283d6: lea rbx, [rbp + 0xf0]
0x1459283dd: lea r14, [rbp + 0x140]
0x1459283e4: xorps xmm7, xmm7
0x1459283e7: movss xmm8, dword ptr [rip + 0x4a4a90]
0x1459283f0: movss xmm9, dword ptr [rip + 0x4a4a8b]
0x1459283f9: movss xmm10, dword ptr [rip + 0x4a4cce]
0x145928402: mov r8d, 1
0x145928408: mov r9d, 1
0x14592840e: cmp rdi, qword ptr [rbp + 0x120]
0x145928415: mov qword ptr [rbp - 0x28], rax
0x145928419: mov qword ptr [rbp - 0x30], r8
0x14592841d: je 0x1459287e4
0x145928423: nop word ptr cs:[rax + rax]
0x145928430: mov qword ptr [rbp + 0xc0], r8
0x145928437: mov qword ptr [rbp + 0xc8], rax
0x14592843e: mov qword ptr [rbp + 0xd0], r9
0x145928445: mov byte ptr [rbp + 0xd8], r10b
0x14592844c: mov eax, dword ptr [rbp + 0x30]
0x14592844f: mov ecx, dword ptr [rbp + 0x33]
0x145928452: lea rdx, [rbp + 0xd9]
0x145928459: mov dword ptr [rdx + 3], ecx
0x14592845c: mov dword ptr [rdx], eax
0x14592845e: call 0x140002200
0x145928463: mov ecx, 1
0x145928468: mov edx, 1
0x14592846d: call 0x1400021c0
0x145928472: test rax, rax
0x145928475: je 0x14592ae75
0x14592847b: mov byte ptr [rax], 0x7b
0x14592847e: mov qword ptr [rbp + 0x140], 1
0x145928489: mov qword ptr [rbp + 0x148], rax
0x145928490: mov qword ptr [rbp + 0x150], 1
0x14592849b: mov byte ptr [rbp + 0x158], 1
0x1459284a2: mov rax, qword ptr [rdi]
0x1459284a5: movups xmm0, xmmword ptr [rax]
0x1459284a8: mov byte ptr [rbp + 0x173], 1
0x1459284af: movups xmmword ptr [rsp + 0x20], xmm0
0x1459284b4: mov r9d, 3
0x1459284ba: mov rcx, rbx
0x1459284bd: mov rdx, r14
0x1459284c0: lea r8, [rip + 0x1902249]
0x1459284c7: call 0x1458eb720
0x1459284cc: nop
0x1459284cd: mov rax, qword ptr [rdi]
0x1459284d0: mov eax, dword ptr [rax + 0x40]
0x1459284d3: mov byte ptr [rbp + 0x173], 1
0x1459284da: mov dword ptr [rsp + 0x20], eax
0x1459284de: mov r9d, 5
0x1459284e4: mov rcx, r14
0x1459284e7: mov rdx, rbx
0x1459284ea: lea r8, [rip + 0x1901b9f]
0x1459284f1: call 0x1458e6910
0x1459284f6: nop
0x1459284f7: mov r15, qword ptr [rdi]
0x1459284fa: mov qword ptr [rbp + 0x10], r15
0x1459284fe: lea rax, [rip - 0x5926445]
0x145928505: mov qword ptr [rbp + 0x18], rax
0x145928509: mov byte ptr [rbp + 0x117], 1
0x145928510: mov rcx, rbx
0x145928513: lea rdx, [rip + 0x12a9ff4]
0x14592851a: lea r8, [rbp + 0x10]
0x14592851e: call 0x145bcce30
0x145928523: nop
0x145928524: mov rcx, qword ptr [rbp + 0xf8]
0x14592852b: mov rdx, qword ptr [rbp + 0x100]
0x145928532: mov rsi, qword ptr [r15 + 0x10]
0x145928536: mov r15, qword ptr [r15 + 0x18]
0x14592853a: mov qword ptr [rbp + 0xb8], rcx
0x145928541: call 0x1458ec500
0x145928546: nop
0x145928547: mov r13, rax
0x14592854a: mov r12, rdx
0x14592854d: mov rdx, qword ptr [rbp + 0xf0]
0x145928554: test rdx, rdx
0x145928557: je 0x14592856b
0x145928559: mov r8d, 1
0x14592855f: mov rcx, qword ptr [rbp + 0xb8]
0x145928566: call 0x1400021d0
0x14592856b: test r13, r13
0x14592856e: cmovne rsi, r13
0x145928572: cmove r12, r15
0x145928576: mov byte ptr [rbp + 0x117], 0
0x14592857d: mov qword ptr [rsp + 0x28], r12
0x145928582: mov qword ptr [rsp + 0x20], rsi
0x145928587: mov r9d, 4
0x14592858d: mov rcx, rbx
0x145928590: mov rdx, r14
0x145928593: lea r8, [rip + 0x1902179]
0x14592859a: call 0x1458eb720
0x14592859f: nop
0x1459285a0: mov rax, qword ptr [rdi]
0x1459285a3: movups xmm0, xmmword ptr [rax + 0x20]
0x1459285a7: mov byte ptr [rbp + 0x173], 1
0x1459285ae: movups xmmword ptr [rsp + 0x20], xmm0
0x1459285b3: mov r9d, 4
0x1459285b9: mov rcx, r14
0x1459285bc: mov rdx, rbx
0x1459285bf: lea r8, [rip + 0x1902151]
0x1459285c6: call 0x1458eb720
0x1459285cb: nop
0x1459285cc: mov eax, dword ptr [rdi + 0x20]
0x1459285cf: mov byte ptr [rbp + 0x173], 1
0x1459285d6: mov dword ptr [rsp + 0x20], eax
0x1459285da: mov r9d, 4
0x1459285e0: mov rcx, rbx
0x1459285e3: mov rdx, r14
0x1459285e6: lea r8, [rip + 0x190212e]
0x1459285ed: call 0x1458e6910
0x1459285f2: nop
0x1459285f3: movss xmm0, dword ptr [rdi + 0x24]
0x1459285f8: maxss xmm0, xmm7
0x1459285fc: mov byte ptr [rbp + 0x173], 1
0x145928603: movss dword ptr [rsp + 0x20], xmm0
0x145928609: mov r9d, 2
0x14592860f: mov rcx, r14
0x145928612: mov rdx, rbx
0x145928615: lea r8, [rip + 0x1902103]
0x14592861c: call 0x1458e6790
0x145928621: nop
0x145928622: mov rax, qword ptr [rdi]
0x145928625: cmp byte ptr [rax + 0x75], 0xb
0x145928629: jne 0x1459286b0
0x14592862f: mov rcx, qword ptr [rax]
0x145928632: mov rdx, qword ptr [rax + 8]
0x145928636: cmp rdx, 0xb
0x14592863a: je 0x145928798
0x145928640: cmp rdx, 0xa
0x145928644: jne 0x14592866a
0x145928646: mov r8, qword ptr [rcx]
0x145928649: xor r8, qword ptr [rip + 0x1900be3]
0x145928650: movzx r9d, word ptr [rcx + 8]
0x145928655: xor r9w, word ptr [rip + 0x1900bde]
0x14592865d: movzx r9d, r9w
0x145928661: or r9, r8
0x145928664: je 0x1459287b6
0x14592866a: movss xmm11, dword ptr [rax + 0x48]
0x145928670: mulss xmm11, xmm8
0x145928675: mulss xmm11, dword ptr [rdi + 0x2c]
0x14592867b: mulss xmm11, dword ptr [rdi + 0x48]
0x145928681: mulss xmm11, xmm6
0x145928686: mulss xmm11, dword ptr [rdi + 0x64]
0x14592868c: maxss xmm11, xmm9
0x145928691: call 0x145914760
0x145928696: maxss xmm0, xmm11
0x14592869b: movss xmm1, dword ptr [rdi + 0x5c]
0x1459286a0: maxss xmm1, xmm10
0x1459286a5: divss xmm0, xmm1
0x1459286a9: jmp 0x1459286d2
0x1459286ab: nop dword ptr [rax + rax]
0x1459286b0: movss xmm0, dword ptr [rax + 0x48]
0x1459286b5: mulss xmm0, xmm8
0x1459286ba: mulss xmm0, dword ptr [rdi + 0x2c]
0x1459286bf: mulss xmm0, dword ptr [rdi + 0x48]
0x1459286c4: mulss xmm0, xmm6
0x1459286c8: mulss xmm0, dword ptr [rdi + 0x64]
0x1459286cd: maxss xmm0, xmm9
0x1459286d2: mov byte ptr [rbp + 0x173], 1
0x1459286d9: movss dword ptr [rsp + 0x20], xmm0
0x1459286df: mov r9d, 5
0x1459286e5: mov rcx, rbx
0x1459286e8: mov rdx, r14
0x1459286eb: lea r8, [rip + 0x190202f]
0x1459286f2: call 0x1458e6790
0x1459286f7: nop
0x1459286f8: mov r12, qword ptr [rbp + 0x100]
0x1459286ff: cmp qword ptr [rbp + 0xf0], r12
0x145928706: je 0x1459287be
0x14592870c: mov rax, qword ptr [rbp + 0xf8]
0x145928713: mov byte ptr [rax + r12], 0x7d
0x145928718: inc r12
0x14592871b: mov qword ptr [rbp + 0x150], r12
0x145928722: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145928729: movaps xmmword ptr [rbp + 0x140], xmm0
0x145928730: mov byte ptr [rbp + 0x173], 0
0x145928737: lea rcx, [rbp + 0x80]
0x14592873e: lea rdx, [rbp + 0xc0]
0x145928745: mov r8, r14
0x145928748: call 0x1458eb220
0x14592874d: nop
0x14592874e: add rdi, 0x68
0x145928752: mov r8, qword ptr [rbp + 0x80]
0x145928759: mov rax, qword ptr [rbp + 0x88]
0x145928760: mov r9, qword ptr [rbp + 0x90]
0x145928767: movzx r10d, byte ptr [rbp + 0x98]
0x14592876f: lea rcx, [rbp + 0x99]
0x145928776: mov edx, dword ptr [rcx]
0x145928778: mov ecx, dword ptr [rcx + 3]
0x14592877b: mov dword ptr [rbp + 0x30], edx
0x14592877e: mov dword ptr [rbp + 0x33], ecx
0x145928781: cmp rdi, qword ptr [rbp + 0x120]
0x145928788: mov qword ptr [rbp - 0x28], rax
0x14592878c: mov qword ptr [rbp - 0x30], r8
0x145928790: jne 0x145928430
0x145928796: jmp 0x1459287e4
0x145928798: mov r8, qword ptr [rcx]
0x14592879b: xor r8, qword ptr [rip + 0x1900ae9]
0x1459287a2: mov r9, qword ptr [rcx + 3]
0x1459287a6: xor r9, qword ptr [rip + 0x1900ae1]
0x1459287ad: or r9, r8
0x1459287b0: jne 0x14592866a
0x1459287b6: xorps xmm0, xmm0
0x1459287b9: jmp 0x1459286d2
0x1459287be: mov qword ptr [rsp + 0x20], 1
0x1459287c7: mov r8d, 1
0x1459287cd: mov r9d, 1
0x1459287d3: mov rcx, rbx
0x1459287d6: mov rdx, r12
0x1459287d9: call 0x145bfa970
0x1459287de: nop
0x1459287df: jmp 0x14592870c
0x1459287e4: mov byte ptr [rbp + 0xe3], r10b
0x1459287eb: mov qword ptr [rbp - 0x20], r9
0x1459287ef: call 0x140002200
0x1459287f4: mov eax, 1
0x1459287f9: mov qword ptr [rbp + 0xb8], rax
0x145928800: mov ecx, 1
0x145928805: mov edx, 1
0x14592880a: call 0x1400021c0
0x14592880f: test rax, rax
0x145928812: je 0x14592aeda
0x145928818: mov rdi, rax
0x14592881b: mov byte ptr [rax], 0x5b
0x14592881e: mov qword ptr [rbp], 2
0x145928826: mov word ptr [rbp + 8], 0x100
0x14592882c: mov rcx, qword ptr [rbp + 0xb0]
0x145928833: mov rdx, qword ptr [rcx + 0x330]
0x14592883a: mov rax, qword ptr [rcx + 0x338]
0x145928841: lea rax, [rax + rax*2]
0x145928845: mov qword ptr [rbp + 0x38], rdx
0x145928849: lea rsi, [rdx + rax*8]
0x14592884d: lea rax, [rcx + 0x53c]
0x145928854: mov qword ptr [rbp + 0x28], rax
0x145928858: mov r12b, 1
0x14592885b: xor eax, eax
0x14592885d: lea r15, [rbp + 0xf0]
0x145928864: mov r14d, 1
0x14592886a: jmp 0x145928873
0x14592886c: nop dword ptr [rax]
0x145928870: mov rax, rcx
0x145928873: cmp rax, 2
0x145928877: je 0x145928cad
0x14592887d: lea rcx, [rax + 1]
0x145928881: mov qword ptr [rbp - 8], rcx
0x145928885: movzx r13d, byte ptr [rbp + rax + 8]
0x14592888b: test r13, r13
0x14592888e: lea rdx, [rip + 0x1901f7f]
0x145928895: lea rax, [rip + 0x1901f7c]
0x14592889c: cmovne rdx, rax
0x1459288a0: mov qword ptr [rbp + 0x120], rdx
0x1459288a7: mov rbx, qword ptr [rbp + 0x38]
0x1459288ab: nop dword ptr [rax + rax]
0x1459288b0: cmp rbx, rsi
0x1459288b3: je 0x145928870
0x1459288b5: mov rdx, qword ptr [rbx]
0x1459288b8: add rbx, 0x18
0x1459288bc: cmp byte ptr [rdx + 0x45], r13b
0x1459288c0: jne 0x1459288b0
0x1459288c2: mov qword ptr [rbp + 0x118], rcx
0x1459288c9: cmp byte ptr [rdx + 0x44], 0xf
0x1459288cd: jne 0x14592897c
0x1459288d3: mov qword ptr [rbp + 0x68], rdi
0x1459288d7: mov qword ptr [rbp + 0x60], r14
0x1459288db: mov byte ptr [rbp + 0x170], 1
0x1459288e2: mov byte ptr [rbp + 0x16f], 1
0x1459288e9: mov edx, 0xe
0x1459288ee: lea rcx, [rip + 0x1901f11]
0x1459288f5: call 0x1458ec500
0x1459288fa: nop
0x1459288fb: mov r8, rdx
0x1459288fe: test rax, rax
0x145928901: lea rcx, [rip + 0x1901efe]
0x145928908: cmove rax, rcx
0x14592890c: mov ecx, 0xe
0x145928911: cmove r8, rcx
0x145928915: lea rcx, [rip + 0x19017f4]
0x14592891c: mov qword ptr [rbp + 0x140], rcx
0x145928923: mov qword ptr [rbp + 0x148], 1
0x14592892e: mov rcx, qword ptr [rbp + 0x28]
0x145928932: mov qword ptr [rbp + 0x150], rcx
0x145928939: lea rcx, [rip + 0x19017b0]
0x145928940: mov qword ptr [rbp + 0x158], rcx
0x145928947: mov qword ptr [rbp + 0x68], rdi
0x14592894b: mov qword ptr [rbp + 0x60], r14
0x14592894f: mov byte ptr [rbp + 0x170], 1
0x145928956: mov byte ptr [rbp + 0x16f], 1
0x14592895d: mov qword ptr [rsp + 0x20], 1
0x145928966: lea rcx, [rbp + 0x10]
0x14592896a: mov rdx, rax
0x14592896d: lea r9, [rbp + 0x140]
0x145928974: call 0x1458ec8b0
0x145928979: nop
0x14592897a: jmp 0x1459289a1
0x14592897c: movss xmm2, dword ptr [rbx - 8]
0x145928981: mov qword ptr [rbp + 0x68], rdi
0x145928985: mov qword ptr [rbp + 0x60], r14
0x145928989: mov byte ptr [rbp + 0x170], 1
0x145928990: mov byte ptr [rbp + 0x16f], 1
0x145928997: lea rcx, [rbp + 0x10]
0x14592899b: call 0x145891df0
0x1459289a0: nop
0x1459289a1: mov qword ptr [rbp + 0xa8], r14
0x1459289a8: mov qword ptr [rbp + 0xc0], r14
0x1459289af: mov qword ptr [rbp + 0x70], rdi
0x1459289b3: mov qword ptr [rbp + 0xc8], rdi
0x1459289ba: mov rax, qword ptr [rbp + 0xb8]
0x1459289c1: mov qword ptr [rbp + 0xd0], rax
0x1459289c8: mov byte ptr [rbp + 0xd8], r12b
0x1459289cf: mov eax, dword ptr [rbp + 0x78]
0x1459289d2: mov ecx, dword ptr [rbp + 0x7b]
0x1459289d5: lea rdx, [rbp + 0xd9]
0x1459289dc: mov dword ptr [rdx + 3], ecx
0x1459289df: mov dword ptr [rdx], eax
0x1459289e1: call 0x140002200
0x1459289e6: mov ecx, 1
0x1459289eb: mov edx, 1
0x1459289f0: call 0x1400021c0
0x1459289f5: test rax, rax
0x1459289f8: je 0x14592ae91
0x1459289fe: mov byte ptr [rax], 0x7b
0x145928a01: mov qword ptr [rbp + 0x140], 1
0x145928a0c: mov qword ptr [rbp + 0x148], rax
0x145928a13: mov qword ptr [rbp + 0x150], 1
0x145928a1e: mov byte ptr [rbp + 0x158], 1
0x145928a25: mov r14, qword ptr [rbx - 0x18]
0x145928a29: mov qword ptr [rbp - 0x50], r14
0x145928a2d: lea rax, [rip - 0x5926974]
0x145928a34: mov qword ptr [rbp - 0x48], rax
0x145928a38: mov byte ptr [rbp + 0x115], 1
0x145928a3f: mov rcx, r15
0x145928a42: lea rdx, [rip + 0x12bf5c2]
0x145928a49: lea r8, [rbp - 0x50]
0x145928a4d: call 0x145bcce30
0x145928a52: nop
0x145928a53: mov rcx, qword ptr [rbp + 0xf8]
0x145928a5a: mov rdx, qword ptr [rbp + 0x100]
0x145928a61: mov rdi, qword ptr [r14 + 0x10]
0x145928a65: mov r14, qword ptr [r14 + 0x18]
0x145928a69: mov qword ptr [rbp + 0xb8], rcx
0x145928a70: call 0x1458ec500
0x145928a75: nop
0x145928a76: mov r15, rax
0x145928a79: mov r12, rdx
0x145928a7c: mov rdx, qword ptr [rbp + 0xf0]
0x145928a83: test rdx, rdx
0x145928a86: je 0x145928a9a
0x145928a88: mov r8d, 1
0x145928a8e: mov rcx, qword ptr [rbp + 0xb8]
0x145928a95: call 0x1400021d0
0x145928a9a: test r15, r15
0x145928a9d: cmovne rdi, r15
0x145928aa1: cmove r12, r14
0x145928aa5: mov byte ptr [rbp + 0x115], 0
0x145928aac: mov qword ptr [rsp + 0x28], r12
0x145928ab1: mov qword ptr [rsp + 0x20], rdi
0x145928ab6: mov r9d, 4
0x145928abc: lea r14, [rbp + 0xf0]
0x145928ac3: mov rcx, r14
0x145928ac6: lea rdx, [rbp + 0x140]
0x145928acd: lea r8, [rip + 0x1901c3f]
0x145928ad4: call 0x1458eb720
0x145928ad9: nop
0x145928ada: mov rax, qword ptr [rbx - 0x18]
0x145928ade: movups xmm0, xmmword ptr [rax + 0x20]
0x145928ae2: mov byte ptr [rbp + 0x171], 1
0x145928ae9: movups xmmword ptr [rsp + 0x20], xmm0
0x145928aee: mov r9d, 4
0x145928af4: lea rdi, [rbp + 0x140]
0x145928afb: mov rcx, rdi
0x145928afe: mov rdx, r14
0x145928b01: lea r8, [rip + 0x1901c0f]
0x145928b08: call 0x1458eb720
0x145928b0d: nop
0x145928b0e: mov byte ptr [rbp + 0x171], 1
0x145928b15: lea rax, [r13*2 + 4]
0x145928b1d: add rax, r13
0x145928b20: mov qword ptr [rsp + 0x28], rax
0x145928b25: mov rax, qword ptr [rbp + 0x120]
0x145928b2c: mov qword ptr [rsp + 0x20], rax
0x145928b31: mov r9d, 4
0x145928b37: mov rcx, r14
0x145928b3a: mov rdx, rdi
0x145928b3d: lea r8, [rip + 0x1901be2]
0x145928b44: call 0x1458eb720
0x145928b49: nop
0x145928b4a: mov eax, dword ptr [rbx - 4]
0x145928b4d: mov byte ptr [rbp + 0x171], 1
0x145928b54: mov dword ptr [rsp + 0x20], eax
0x145928b58: mov r9d, 4
0x145928b5e: mov rcx, rdi
0x145928b61: mov rdx, r14
0x145928b64: lea r8, [rip + 0x1901bb0]
0x145928b6b: call 0x1458e6910
0x145928b70: nop
0x145928b71: mov eax, dword ptr [rbx - 0x10]
0x145928b74: mov byte ptr [rbp + 0x171], 1
0x145928b7b: mov dword ptr [rsp + 0x20], eax
0x145928b7f: mov r9d, 6
0x145928b85: mov rcx, r14
0x145928b88: mov rdx, rdi
0x145928b8b: lea r8, [rip + 0x1901b9e]
0x145928b92: call 0x1458e6910
0x145928b97: nop
0x145928b98: mov r12, qword ptr [rbp + 0x18]
0x145928b9c: mov rax, qword ptr [rbp + 0x20]
0x145928ba0: mov byte ptr [rbp + 0x171], 1
0x145928ba7: mov qword ptr [rsp + 0x28], rax
0x145928bac: mov qword ptr [rsp + 0x20], r12
0x145928bb1: mov r9d, 4
0x145928bb7: mov rcx, rdi
0x145928bba: mov rdx, r14
0x145928bbd: lea r8, [rip + 0x1901b72]
0x145928bc4: call 0x1458eb720
0x145928bc9: nop
0x145928bca: mov r15, qword ptr [rbp + 0x150]
0x145928bd1: cmp qword ptr [rbp + 0x140], r15
0x145928bd8: je 0x145928c87
0x145928bde: mov rax, qword ptr [rbp + 0x148]
0x145928be5: mov byte ptr [rax + r15], 0x7d
0x145928bea: inc r15
0x145928bed: mov qword ptr [rbp + 0x100], r15
0x145928bf4: movups xmm0, xmmword ptr [rbp + 0x140]
0x145928bfb: movaps xmmword ptr [rbp + 0xf0], xmm0
0x145928c02: mov byte ptr [rbp + 0x171], 0
0x145928c09: lea rcx, [rbp + 0x80]
0x145928c10: lea rdx, [rbp + 0xc0]
0x145928c17: lea r8, [rbp + 0xf0]
0x145928c1e: call 0x1458eb220
0x145928c23: nop
0x145928c24: mov r14, qword ptr [rbp + 0x80]
0x145928c2b: mov rdi, qword ptr [rbp + 0x88]
0x145928c32: mov rax, qword ptr [rbp + 0x90]
0x145928c39: mov qword ptr [rbp + 0xb8], rax
0x145928c40: movzx r15d, byte ptr [rbp + 0x98]
0x145928c48: lea rcx, [rbp + 0x99]
0x145928c4f: mov eax, dword ptr [rcx]
0x145928c51: mov ecx, dword ptr [rcx + 3]
0x145928c54: mov dword ptr [rbp + 0x78], eax
0x145928c57: mov dword ptr [rbp + 0x7b], ecx
0x145928c5a: mov rdx, qword ptr [rbp + 0x10]
0x145928c5e: test rdx, rdx
0x145928c61: je 0x145928c71
0x145928c63: mov r8d, 1
0x145928c69: mov rcx, r12
0x145928c6c: call 0x1400021d0
0x145928c71: mov r12d, r15d
0x145928c74: lea r15, [rbp + 0xf0]
0x145928c7b: mov rcx, qword ptr [rbp + 0x118]
0x145928c82: jmp 0x1459288b0
0x145928c87: mov qword ptr [rsp + 0x20], 1
0x145928c90: mov r8d, 1
0x145928c96: mov r9d, 1
0x145928c9c: mov rcx, rdi
0x145928c9f: mov rdx, r15
0x145928ca2: call 0x145bfa970
0x145928ca7: nop
0x145928ca8: jmp 0x145928bde
0x145928cad: mov rax, qword ptr [rbp + 0xb0]
0x145928cb4: cmp qword ptr [rax + 0x388], -1
0x145928cbc: je 0x145928f3b
0x145928cc2: mov qword ptr [rbp + 0xa8], r14
0x145928cc9: mov qword ptr [rbp + 0xc0], r14
0x145928cd0: mov qword ptr [rbp + 0x70], rdi
0x145928cd4: mov qword ptr [rbp + 0xc8], rdi
0x145928cdb: mov rax, qword ptr [rbp + 0xb8]
0x145928ce2: mov qword ptr [rbp + 0xd0], rax
0x145928ce9: mov byte ptr [rbp + 0xd8], r12b
0x145928cf0: mov eax, dword ptr [rbp + 0x78]
0x145928cf3: mov ecx, dword ptr [rbp + 0x7b]
0x145928cf6: mov dword ptr [rbp + 0xd9], eax
0x145928cfc: mov dword ptr [rbp + 0xdc], ecx
0x145928d02: call 0x140002200
0x145928d07: mov ecx, 1
0x145928d0c: mov edx, 1
0x145928d11: call 0x1400021c0
0x145928d16: test rax, rax
0x145928d19: je 0x14592afa0
0x145928d1f: mov byte ptr [rax], 0x7b
0x145928d22: mov qword ptr [rbp + 0x140], 1
0x145928d2d: mov qword ptr [rbp + 0x148], rax
0x145928d34: mov qword ptr [rbp + 0x150], 1
0x145928d3f: mov byte ptr [rbp + 0x158], 1
0x145928d46: mov rsi, qword ptr [rbp + 0xb0]
0x145928d4d: movups xmm0, xmmword ptr [rsi + 0x3a8]
0x145928d54: movups xmmword ptr [rsp + 0x20], xmm0
0x145928d59: lea r8, [rip + 0x19019b3]
0x145928d60: lea rcx, [rbp + 0xf0]
0x145928d67: lea rdx, [rbp + 0x140]
0x145928d6e: mov r9d, 4
0x145928d74: call 0x1458eb720
0x145928d79: nop
0x145928d7a: movups xmm0, xmmword ptr [rsi + 0x3d0]
0x145928d81: movups xmmword ptr [rsp + 0x20], xmm0
0x145928d86: lea r8, [rip + 0x190198a]
0x145928d8d: lea rcx, [rbp + 0x140]
0x145928d94: lea rdx, [rbp + 0xf0]
0x145928d9b: mov r9d, 4
0x145928da1: call 0x1458eb720
0x145928da6: nop
0x145928da7: lea rax, [rip + 0x190197c]
0x145928dae: mov qword ptr [rsp + 0x20], rax
0x145928db3: mov qword ptr [rsp + 0x28], 6
0x145928dbc: lea r8, [rip + 0x1901963]
0x145928dc3: lea rcx, [rbp + 0xf0]
0x145928dca: lea rdx, [rbp + 0x140]
0x145928dd1: mov r9d, 4
0x145928dd7: call 0x1458eb720
0x145928ddc: nop
0x145928ddd: mov eax, dword ptr [rsi + 0x3f0]
0x145928de3: mov dword ptr [rsp + 0x20], eax
0x145928de7: lea r8, [rip + 0x190192d]
0x145928dee: lea rcx, [rbp + 0x140]
0x145928df5: lea rdx, [rbp + 0xf0]
0x145928dfc: mov r9d, 4
0x145928e02: call 0x1458e6910
0x145928e07: nop
0x145928e08: mov eax, dword ptr [rsi + 0x3e0]
0x145928e0e: mov dword ptr [rsp + 0x20], eax
0x145928e12: lea r8, [rip + 0x1901917]
0x145928e19: lea rcx, [rbp + 0xf0]
0x145928e20: lea rdx, [rbp + 0x140]
0x145928e27: mov r9d, 6
0x145928e2d: call 0x1458e6910
0x145928e32: nop
0x145928e33: lea rdx, [rsi + 0x388]
0x145928e3a: lea rcx, [rbp + 0x80]
0x145928e41: call 0x145892a30
0x145928e46: nop
0x145928e47: mov rcx, qword ptr [rbp + 0x88]
0x145928e4e: mov rax, qword ptr [rbp + 0x90]
0x145928e55: mov byte ptr [rbp + 0x116], 1
0x145928e5c: mov qword ptr [rsp + 0x28], rax
0x145928e61: mov qword ptr [rbp + 0xb8], rcx
0x145928e68: mov qword ptr [rsp + 0x20], rcx
0x145928e6d: lea r8, [rip + 0x19018c2]
0x145928e74: lea rcx, [rbp + 0x140]
0x145928e7b: lea rdx, [rbp + 0xf0]
0x145928e82: mov r9d, 4
0x145928e88: call 0x1458eb720
0x145928e8d: nop
0x145928e8e: mov rsi, qword ptr [rbp + 0x150]
0x145928e95: cmp qword ptr [rbp + 0x140], rsi
0x145928e9c: je 0x14592ad72
0x145928ea2: mov rax, qword ptr [rbp + 0x148]
0x145928ea9: mov byte ptr [rax + rsi], 0x7d
0x145928ead: inc rsi
0x145928eb0: mov qword ptr [rbp + 0x100], rsi
0x145928eb7: movups xmm0, xmmword ptr [rbp + 0x140]
0x145928ebe: movaps xmmword ptr [rbp + 0xf0], xmm0
0x145928ec5: mov byte ptr [rbp + 0x116], 0
0x145928ecc: lea rcx, [rbp + 0x140]
0x145928ed3: lea rdx, [rbp + 0xc0]
0x145928eda: lea r8, [rbp + 0xf0]
0x145928ee1: call 0x1458eb220
0x145928ee6: nop
0x145928ee7: mov r14, qword ptr [rbp + 0x140]
0x145928eee: mov rdi, qword ptr [rbp + 0x148]
0x145928ef5: mov rsi, qword ptr [rbp + 0x150]
0x145928efc: movzx r12d, byte ptr [rbp + 0x158]
0x145928f04: mov eax, dword ptr [rbp + 0x159]
0x145928f0a: mov dword ptr [rbp + 0x78], eax
0x145928f0d: mov eax, dword ptr [rbp + 0x15c]
0x145928f13: mov dword ptr [rbp + 0x7b], eax
0x145928f16: mov rdx, qword ptr [rbp + 0x80]
0x145928f1d: test rdx, rdx
0x145928f20: je 0x145928f34
0x145928f22: mov r8d, 1
0x145928f28: mov rcx, qword ptr [rbp + 0xb8]
0x145928f2f: call 0x1400021d0
0x145928f34: mov qword ptr [rbp + 0xb8], rsi
0x145928f3b: mov rax, qword ptr [rbp + 0xb0]
0x145928f42: mov rsi, qword ptr [rax + 0x560]
0x145928f49: mov rax, qword ptr [rax + 0x568]
0x145928f50: imul r15, rax, 0x1d8
0x145928f57: mov qword ptr [rbp - 0x38], rax
0x145928f5b: test rax, rax
0x145928f5e: je 0x145928f91
0x145928f60: mov rax, r15
0x145928f63: mov rbx, rsi
0x145928f66: jmp 0x145928f7f
0x145928f68: nop dword ptr [rax + rax]
0x145928f70: add rbx, 0x1d8
0x145928f77: add rax, -0x1d8
0x145928f7d: je 0x145928f91
0x145928f7f: cmp qword ptr [rbx + 0x18], -1
0x145928f84: je 0x145928f70
0x145928f86: cmp dword ptr [rbx + 0xb0], 1
0x145928f8d: je 0x145928f70
0x145928f8f: jmp 0x145928f93
0x145928f91: xor ebx, ebx
0x145928f93: mov byte ptr [rbp + 0xe4], r12b
0x145928f9a: mov qword ptr [rbp + 0xa8], r14
0x145928fa1: mov qword ptr [rbp + 0x70], rdi
0x145928fa5: call 0x140002200
0x145928faa: mov ecx, 1
0x145928faf: mov edx, 1
0x145928fb4: call 0x1400021c0
0x145928fb9: test rax, rax
0x145928fbc: je 0x14592aef6
0x145928fc2: add r15, rsi
0x145928fc5: mov byte ptr [rax], 0x5b
0x145928fc8: mov r9b, 1
0x145928fcb: lea rdi, [rbp + 0xf0]
0x145928fd2: lea r14, [rbp + 0x140]
0x145928fd9: xorps xmm7, xmm7
0x145928fdc: mov ecx, 1
0x145928fe1: mov qword ptr [rbp + 0x38], rcx
0x145928fe5: mov rcx, rsi
0x145928fe8: mov r12, rsi
0x145928feb: mov r8d, 1
0x145928ff1: mov qword ptr [rbp - 0x10], rsi
0x145928ff5: test rcx, rcx
0x145928ff8: mov qword ptr [rbp + 0x28], rax
0x145928ffc: jne 0x145929197
0x145929002: jmp 0x1459291c7
0x145929007: mov byte ptr [rax], 0x7b
0x14592900a: mov qword ptr [rbp + 0x140], 1
0x145929015: mov qword ptr [rbp + 0x148], rax
0x14592901c: mov qword ptr [rbp + 0x150], 1
0x145929027: mov byte ptr [rbp + 0x158], 1
0x14592902e: mov byte ptr [rbp + 0xe6], 1
0x145929035: mov rcx, r12
0x145929038: call 0x14590d9a0
0x14592903d: nop
0x14592903e: mov byte ptr [rbp + 0xe6], 0
0x145929045: mov qword ptr [rsp + 0x28], rdx
0x14592904a: mov qword ptr [rsp + 0x20], rax
0x14592904f: mov r9d, 4
0x145929055: mov rcx, rdi
0x145929058: mov rdx, r14
0x14592905b: lea r8, [rip + 0x19016b1]
0x145929062: call 0x1458eb720
0x145929067: nop
0x145929068: movss xmm0, dword ptr [r12 + 0x158]
0x145929072: maxss xmm0, xmm7
0x145929076: mov byte ptr [rbp + 0x16d], 1
0x14592907d: movss dword ptr [rsp + 0x20], xmm0
0x145929083: mov r9d, 2
0x145929089: mov rcx, r14
0x14592908c: mov rdx, rdi
0x14592908f: lea r8, [rip + 0x19016c1]
0x145929096: call 0x1458e6790
0x14592909b: nop
0x14592909c: movss xmm0, dword ptr [r12 + 0x15c]
0x1459290a6: mov byte ptr [rbp + 0x16d], 1
0x1459290ad: movss dword ptr [rsp + 0x20], xmm0
0x1459290b3: mov r9d, 5
0x1459290b9: mov rcx, rdi
0x1459290bc: mov rdx, r14
0x1459290bf: lea r8, [rip + 0x1901693]
0x1459290c6: call 0x1458e6790
0x1459290cb: nop
0x1459290cc: mov r12, qword ptr [rbp + 0x100]
0x1459290d3: cmp qword ptr [rbp + 0xf0], r12
0x1459290da: je 0x145929169
0x1459290e0: mov rax, qword ptr [rbp + 0xf8]
0x1459290e7: mov byte ptr [rax + r12], 0x7d
0x1459290ec: inc r12
0x1459290ef: mov qword ptr [rbp + 0x150], r12
0x1459290f6: movups xmm0, xmmword ptr [rbp + 0xf0]
0x1459290fd: movaps xmmword ptr [rbp + 0x140], xmm0
0x145929104: mov byte ptr [rbp + 0x16d], 0
0x14592910b: lea rcx, [rbp + 0x80]
0x145929112: lea rdx, [rbp + 0xc0]
0x145929119: mov r8, r14
0x14592911c: call 0x1458eb220
0x145929121: nop
0x145929122: mov rax, qword ptr [rbp + 0x80]
0x145929129: mov qword ptr [rbp + 0x38], rax
0x14592912d: mov rdx, qword ptr [rbp + 0x88]
0x145929134: mov r8, qword ptr [rbp + 0x90]
0x14592913b: movzx r9d, byte ptr [rbp + 0x98]
0x145929143: lea rcx, [rbp + 0x99]
0x14592914a: mov eax, dword ptr [rcx]
0x14592914c: mov ecx, dword ptr [rcx + 3]
0x14592914f: mov dword ptr [rbp - 8], eax
0x145929152: mov dword ptr [rbp - 5], ecx
0x145929155: mov rcx, rsi
0x145929158: mov rax, rdx
0x14592915b: mov r12, r13
0x14592915e: test rcx, rcx
0x145929161: mov qword ptr [rbp + 0x28], rax
0x145929165: jne 0x145929197
0x145929167: jmp 0x1459291c7
0x145929169: mov qword ptr [rsp + 0x20], 1
0x145929172: mov r8d, 1
0x145929178: mov r9d, 1
0x14592917e: mov rcx, rdi
0x145929181: mov rdx, r12
0x145929184: call 0x145bfa970
0x145929189: nop
0x14592918a: jmp 0x1459290e0
0x14592918f: nop
0x145929190: add rcx, 0x1d8
0x145929197: cmp rcx, r15
0x14592919a: je 0x1459291c7
0x14592919c: cmp byte ptr [rcx + 0xb0], 0
0x1459291a3: jne 0x145929190
0x1459291a5: cmp qword ptr [rcx + 0x18], -1
0x1459291aa: je 0x145929190
0x1459291ac: lea rsi, [rcx + 0x1d8]
0x1459291b3: mov r13, r12
0x1459291b6: mov r12, rcx
0x1459291b9: jmp 0x1459291f8
0x1459291bb: nop dword ptr [rax + rax]
0x1459291c0: add r12, 0x1d8
0x1459291c7: cmp r12, r15
0x1459291ca: je 0x145929267
0x1459291d0: cmp byte ptr [r12 + 0xb0], 0
0x1459291d9: jne 0x1459291c0
0x1459291db: cmp qword ptr [r12 + 0x58], -1
0x1459291e1: je 0x1459291c0
0x1459291e3: cmp byte ptr [r12 + 0xa8], 0
0x1459291ec: je 0x1459291c0
0x1459291ee: lea r13, [r12 + 0x1d8]
0x1459291f6: xor esi, esi
0x1459291f8: mov rax, qword ptr [rbp + 0x38]
0x1459291fc: mov qword ptr [rbp + 0xc0], rax
0x145929203: mov rax, qword ptr [rbp + 0x28]
0x145929207: mov qword ptr [rbp + 0xc8], rax
0x14592920e: mov qword ptr [rbp + 0xd0], r8
0x145929215: mov byte ptr [rbp + 0xd8], r9b
0x14592921c: mov eax, dword ptr [rbp - 8]
0x14592921f: mov ecx, dword ptr [rbp - 5]
0x145929222: lea rdx, [rbp + 0xd9]
0x145929229: mov dword ptr [rdx + 3], ecx
0x14592922c: mov dword ptr [rdx], eax
0x14592922e: call 0x140002200
0x145929233: mov ecx, 1
0x145929238: mov edx, 1
0x14592923d: call 0x1400021c0
0x145929242: test rax, rax
0x145929245: jne 0x145929007
0x14592924b: mov byte ptr [rbp + 0x16d], 1
0x145929252: mov ecx, 1
0x145929257: mov edx, 1
0x14592925c: call 0x145d992bb
0x145929261: nop
0x145929262: jmp 0x14592affb
0x145929267: mov rdi, qword ptr [rbp + 0xb0]
0x14592926e: mov rsi, qword ptr [rdi + 0x9d0]
0x145929275: cmp rsi, 5
0x145929279: mov qword ptr [rbp - 0x18], r8
0x14592927d: mov byte ptr [rbp + 0xe5], r9b
0x145929284: jae 0x1459292d8
0x145929286: mov rcx, qword ptr [rdi + 0x290]
0x14592928d: mov rdx, qword ptr [rdi + 0x298]
0x145929294: call 0x14588d0d0
0x145929299: imul rax, rax, 0xf0
0x1459292a0: lea rcx, [rip + 0x12b50e9]
0x1459292a7: mov rax, qword ptr [rax + rcx + 0x88]
0x1459292af: imul rcx, rsi, 0x68
0x1459292b3: movss xmm7, dword ptr [rax + rcx + 0x50]
0x1459292b9: mulss xmm7, dword ptr [rip + 0x4c727f]
0x1459292c1: movss xmm8, dword ptr [rdi + 0xa34]
0x1459292ca: subss xmm7, xmm8
0x1459292cf: mov byte ptr [rbp + 0xef], 1
0x1459292d6: jmp 0x1459292fb
0x1459292d8: movzx eax, byte ptr [rdi + 0xab8]
0x1459292df: mov byte ptr [rbp + 0xef], al
0x1459292e5: movss xmm8, dword ptr [rdi + 0xa34]
0x1459292ee: movss xmm7, dword ptr [rdi + 0xa90]
0x1459292f6: subss xmm7, xmm8
0x1459292fb: call 0x140002200
0x145929300: mov ecx, 1
0x145929305: mov edx, 1
0x14592930a: call 0x1400021c0
0x14592930f: test rax, rax
0x145929312: je 0x14592af2c
0x145929318: mov qword ptr [rbp + 0x118], rax
0x14592931f: mov byte ptr [rax], 0x5b
0x145929322: mov rax, qword ptr [rdi + 0x380]
0x145929329: test rax, rax
0x14592932c: je 0x145929520
0x145929332: mov r13, qword ptr [rdi + 0x378]
0x145929339: lea rax, [rax + rax*2]
0x14592933d: lea r12, [rax*8]
0x145929345: add r12, r13
0x145929348: mov edx, 1
0x14592934d: mov sil, 1
0x145929350: lea rdi, [rbp + 0xf0]
0x145929357: lea r15, [rbp + 0x140]
0x14592935e: lea r14, [rbp + 0xc0]
0x145929365: mov eax, 1
0x14592936a: mov qword ptr [rbp + 0x120], rax
0x145929371: jmp 0x145929406
0x145929376: nop word ptr cs:[rax + rax]
0x145929380: mov rax, qword ptr [rbp + 0x148]
0x145929387: mov byte ptr [rax + rsi], 0x7d
0x14592938b: inc rsi
0x14592938e: mov qword ptr [rbp + 0x100], rsi
0x145929395: movups xmm0, xmmword ptr [rbp + 0x140]
0x14592939c: movaps xmmword ptr [rbp + 0xf0], xmm0
0x1459293a3: mov byte ptr [rbp + 0x12b], 0
0x1459293aa: lea rcx, [rbp + 0x80]
0x1459293b1: mov rdx, r14
0x1459293b4: mov r8, rdi
0x1459293b7: call 0x1458eb220
0x1459293bc: nop
0x1459293bd: mov rax, qword ptr [rbp + 0x80]
0x1459293c4: mov qword ptr [rbp + 0x120], rax
0x1459293cb: mov rax, qword ptr [rbp + 0x88]
0x1459293d2: mov qword ptr [rbp + 0x118], rax
0x1459293d9: mov rdx, qword ptr [rbp + 0x90]
0x1459293e0: movzx esi, byte ptr [rbp + 0x98]
0x1459293e7: lea rcx, [rbp + 0x99]
0x1459293ee: mov eax, dword ptr [rcx]
0x1459293f0: mov ecx, dword ptr [rcx + 3]
0x1459293f3: mov dword ptr [rbp + 0x10], eax
0x1459293f6: mov dword ptr [rbp + 0x13], ecx
0x1459293f9: add r13, 0x18
0x1459293fd: cmp r13, r12
0x145929400: je 0x145929534
0x145929406: movss xmm9, dword ptr [r13 + 0x10]
0x14592940c: ucomiss xmm9, xmm8
0x145929410: jbe 0x1459293f9
0x145929412: mov rax, qword ptr [rbp + 0x120]
0x145929419: mov qword ptr [rbp + 0xc0], rax
0x145929420: mov rax, qword ptr [rbp + 0x118]
0x145929427: mov qword ptr [rbp + 0xc8], rax
0x14592942e: mov qword ptr [rbp + 0xd0], rdx
0x145929435: mov byte ptr [rbp + 0xd8], sil
0x14592943c: mov eax, dword ptr [rbp + 0x10]
0x14592943f: mov ecx, dword ptr [rbp + 0x13]
0x145929442: lea rdx, [rbp + 0xd9]
0x145929449: mov dword ptr [rdx + 3], ecx
0x14592944c: mov dword ptr [rdx], eax
0x14592944e: call 0x140002200
0x145929453: mov ecx, 1
0x145929458: mov edx, 1
0x14592945d: call 0x1400021c0
0x145929462: test rax, rax
0x145929465: je 0x14592aead
0x14592946b: mov byte ptr [rax], 0x7b
0x14592946e: mov qword ptr [rbp + 0x140], 1
0x145929479: mov qword ptr [rbp + 0x148], rax
0x145929480: mov qword ptr [rbp + 0x150], 1
0x14592948b: mov byte ptr [rbp + 0x158], 1
0x145929492: mov eax, dword ptr [r13 + 0xc]
0x145929496: mov byte ptr [rbp + 0x12b], 1
0x14592949d: mov dword ptr [rsp + 0x20], eax
0x1459294a1: mov r9d, 5
0x1459294a7: mov rcx, rdi
0x1459294aa: mov rdx, r15
0x1459294ad: lea r8, [rip + 0x1900bdc]
0x1459294b4: call 0x1458e6910
0x1459294b9: nop
0x1459294ba: subss xmm9, xmm8
0x1459294bf: mov byte ptr [rbp + 0x12b], 1
0x1459294c6: movss dword ptr [rsp + 0x20], xmm9
0x1459294cd: mov r9d, 4
0x1459294d3: mov rcx, r15
0x1459294d6: mov rdx, rdi
0x1459294d9: lea r8, [rip + 0x19007f7]
0x1459294e0: call 0x1458e6790
0x1459294e5: nop
0x1459294e6: mov rsi, qword ptr [rbp + 0x150]
0x1459294ed: cmp qword ptr [rbp + 0x140], rsi
0x1459294f4: jne 0x145929380
0x1459294fa: mov qword ptr [rsp + 0x20], 1
0x145929503: mov r8d, 1
0x145929509: mov r9d, 1
0x14592950f: mov rcx, r15
0x145929512: mov rdx, rsi
0x145929515: call 0x145bfa970
0x14592951a: nop
0x14592951b: jmp 0x145929380
0x145929520: mov sil, 1
0x145929523: mov eax, 1
0x145929528: mov qword ptr [rbp + 0x120], rax
0x14592952f: mov edx, 1
0x145929534: mov r13, rdx
0x145929537: call 0x140002200
0x14592953c: mov ecx, 1
0x145929541: mov edx, 1
0x145929546: call 0x1400021c0
0x14592954b: test rax, rax
0x14592954e: je 0x14592af56
0x145929554: mov byte ptr [rax], 0x7b
0x145929557: mov qword ptr [rbp + 0x140], 1
0x145929562: mov qword ptr [rbp + 0x148], rax
0x145929569: mov qword ptr [rbp + 0x150], 1
0x145929574: mov byte ptr [rbp + 0x158], 1
0x14592957b: mov r15, qword ptr [rbp + 0x118]
0x145929582: mov qword ptr [rbp + 0x138], r15
0x145929589: mov r12, qword ptr [rbp + 0x120]
0x145929590: mov qword ptr [rbp + 0x130], r12
0x145929597: mov byte ptr [rbp + 0x177], 1
0x14592959e: mov byte ptr [rbp + 0x176], 1
0x1459295a5: mov byte ptr [rbp + 0x175], 1
0x1459295ac: mov byte ptr [rbp + 0x174], 1
0x1459295b3: lea rax, [rip + 0x1901184]
0x1459295ba: mov qword ptr [rsp + 0x20], rax
0x1459295bf: mov qword ptr [rsp + 0x28], 3
0x1459295c8: lea r8, [rip + 0x190116b]
0x1459295cf: lea rcx, [rbp + 0xf0]
0x1459295d6: lea rdx, [rbp + 0x140]
0x1459295dd: mov r9d, 4
0x1459295e3: call 0x1458eb720
0x1459295e8: nop
0x1459295e9: mov r14, qword ptr [rbp + 0xb0]
0x1459295f0: movzx eax, byte ptr [r14 + 0xac7]
0x1459295f8: shl eax, 3
0x1459295fb: lea rcx, [rip + 0x1903446]
0x145929602: mov rcx, qword ptr [rax + rcx]
0x145929606: lea rdx, [rip + 0x190346b]
0x14592960d: mov rax, qword ptr [rax + rdx]
0x145929611: mov qword ptr [rbp + 0x138], r15
0x145929618: mov qword ptr [rbp + 0x130], r12
0x14592961f: mov byte ptr [rbp + 0x177], 1
0x145929626: mov byte ptr [rbp + 0x176], 1
0x14592962d: mov byte ptr [rbp + 0x175], 1
0x145929634: mov byte ptr [rbp + 0x174], 1
0x14592963b: mov qword ptr [rsp + 0x28], rcx
0x145929640: mov qword ptr [rsp + 0x20], rax
0x145929645: lea r8, [rip + 0x19010f5]
0x14592964c: lea rcx, [rbp + 0x140]
0x145929653: lea rdx, [rbp + 0xf0]
0x14592965a: mov r9d, 5
0x145929660: call 0x1458eb720
0x145929665: nop
0x145929666: mov qword ptr [rbp + 0x138], r15
0x14592966d: mov qword ptr [rbp + 0x130], r12
0x145929674: mov byte ptr [rbp + 0x177], 1
0x14592967b: mov byte ptr [rbp + 0x176], 1
0x145929682: mov byte ptr [rbp + 0x175], 1
0x145929689: mov byte ptr [rbp + 0x174], 1
0x145929690: movss dword ptr [rsp + 0x20], xmm8
0x145929697: lea r8, [rip + 0x19010a8]
0x14592969e: lea rcx, [rbp + 0xf0]
0x1459296a5: lea rdx, [rbp + 0x140]
0x1459296ac: mov r9d, 4
0x1459296b2: call 0x1458e6790
0x1459296b7: nop
0x1459296b8: mov edi, dword ptr [r14 + 0x4d8]
0x1459296bf: mov qword ptr [rbp + 0x138], r15
0x1459296c6: mov qword ptr [rbp + 0x130], r12
0x1459296cd: mov byte ptr [rbp + 0x177], 1
0x1459296d4: mov byte ptr [rbp + 0x176], 1
0x1459296db: mov byte ptr [rbp + 0x175], 1
0x1459296e2: mov byte ptr [rbp + 0x174], 1
0x1459296e9: mov dword ptr [rsp + 0x20], edi
0x1459296ed: lea r8, [rip + 0x1901056]
0x1459296f4: lea rcx, [rbp + 0x140]
0x1459296fb: lea rdx, [rbp + 0xf0]
0x145929702: mov r9d, 5
0x145929708: call 0x1458e6910
0x14592970d: nop
0x14592970e: mov eax, dword ptr [r14 + 0x4dc]
0x145929715: mov qword ptr [rbp + 0x138], r15
0x14592971c: mov qword ptr [rbp + 0x130], r12
0x145929723: mov byte ptr [rbp + 0x177], 1
0x14592972a: mov byte ptr [rbp + 0x176], 1
0x145929731: mov byte ptr [rbp + 0x175], 1
0x145929738: mov byte ptr [rbp + 0x174], 1
0x14592973f: mov dword ptr [rsp + 0x20], eax
0x145929743: lea r8, [rip + 0x1901005]
0x14592974a: lea rcx, [rbp + 0xf0]
0x145929751: lea rdx, [rbp + 0x140]
0x145929758: mov r9d, 2
0x14592975e: call 0x1458e6910
0x145929763: nop
0x145929764: cmp edi, 1
0x145929767: adc edi, -1
0x14592976a: cvtsi2ss xmm1, rdi
0x14592976f: movss xmm2, dword ptr [rip + 0x473d51]
0x145929777: mulss xmm2, xmm1
0x14592977b: addss xmm2, dword ptr [rip + 0x4a379d]
0x145929783: movss xmm0, dword ptr [rip + 0x4a96ad]
0x14592978b: mulss xmm0, xmm1
0x14592978f: mulss xmm0, xmm1
0x145929793: addss xmm0, xmm2
0x145929797: call 0x145bfa10b
0x14592979c: cvttss2si rax, xmm0
0x1459297a1: xor ecx, ecx
0x1459297a3: xorps xmm9, xmm9
0x1459297a7: ucomiss xmm0, xmm9
0x1459297ab: cmovae ecx, eax
0x1459297ae: ucomiss xmm0, dword ptr [rip + 0x4a968b]
0x1459297b5: mov eax, 0xffffffff
0x1459297ba: cmovbe eax, ecx
0x1459297bd: mov qword ptr [rbp + 0x138], r15
0x1459297c4: mov qword ptr [rbp + 0x130], r12
0x1459297cb: mov byte ptr [rbp + 0x177], 1
0x1459297d2: mov byte ptr [rbp + 0x176], 1
0x1459297d9: mov byte ptr [rbp + 0x175], 1
0x1459297e0: mov byte ptr [rbp + 0x174], 1
0x1459297e7: mov dword ptr [rsp + 0x20], eax
0x1459297eb: lea r8, [rip + 0x1900f5f]
0x1459297f2: lea rcx, [rbp + 0x140]
0x1459297f9: lea rdx, [rbp + 0xf0]
0x145929800: mov r9d, 6
0x145929806: call 0x1458e6910
0x14592980b: nop
0x14592980c: movss xmm0, dword ptr [r14 + 0x4e0]
0x145929815: maxss xmm0, xmm9
0x14592981a: mov qword ptr [rbp + 0x138], r15
0x145929821: mov qword ptr [rbp + 0x130], r12
0x145929828: mov byte ptr [rbp + 0x177], 1
0x14592982f: mov byte ptr [rbp + 0x176], 1
0x145929836: mov byte ptr [rbp + 0x175], 1
0x14592983d: mov byte ptr [rbp + 0x174], 1
0x145929844: movss dword ptr [rsp + 0x20], xmm0
0x14592984a: lea r8, [rip + 0x1900f06]
0x145929851: lea rcx, [rbp + 0xf0]
0x145929858: lea rdx, [rbp + 0x140]
0x14592985f: mov r9d, 2
0x145929865: call 0x1458e6790
0x14592986a: nop
0x14592986b: movss xmm0, dword ptr [r14 + 0x478]
0x145929874: mov qword ptr [rbp + 0x138], r15
0x14592987b: mov qword ptr [rbp + 0x130], r12
0x145929882: mov byte ptr [rbp + 0x177], 1
0x145929889: mov byte ptr [rbp + 0x176], 1
0x145929890: mov byte ptr [rbp + 0x175], 1
0x145929897: mov byte ptr [rbp + 0x174], 1
0x14592989e: movss dword ptr [rsp + 0x20], xmm0
0x1459298a4: lea r8, [rip + 0x1900eae]
0x1459298ab: lea rcx, [rbp + 0x140]
0x1459298b2: lea rdx, [rbp + 0xf0]
0x1459298b9: mov r9d, 5
0x1459298bf: call 0x1458e6790
0x1459298c4: nop
0x1459298c5: movss xmm0, dword ptr [r14 + 0x4e4]
0x1459298ce: mov qword ptr [rbp + 0x138], r15
0x1459298d5: mov qword ptr [rbp + 0x130], r12
0x1459298dc: mov byte ptr [rbp + 0x177], 1
0x1459298e3: mov byte ptr [rbp + 0x176], 1
0x1459298ea: mov byte ptr [rbp + 0x175], 1
0x1459298f1: mov byte ptr [rbp + 0x174], 1
0x1459298f8: movss dword ptr [rsp + 0x20], xmm0
0x1459298fe: lea r8, [rip + 0x1900e59]
0x145929905: lea rcx, [rbp + 0xf0]
0x14592990c: lea rdx, [rbp + 0x140]
0x145929913: mov r9d, 6
0x145929919: call 0x1458e6790
0x14592991e: nop
0x14592991f: mov eax, dword ptr [r14 + 0x4e8]
0x145929926: mov qword ptr [rbp + 0x138], r15
0x14592992d: mov qword ptr [rbp + 0x130], r12
0x145929934: mov byte ptr [rbp + 0x177], 1
0x14592993b: mov byte ptr [rbp + 0x176], 1
0x145929942: mov byte ptr [rbp + 0x175], 1
0x145929949: mov byte ptr [rbp + 0x174], 1
0x145929950: mov dword ptr [rsp + 0x20], eax
0x145929954: lea r8, [rip + 0x1900e09]
0x14592995b: lea rcx, [rbp + 0x140]
0x145929962: lea rdx, [rbp + 0xf0]
0x145929969: mov r9d, 4
0x14592996f: call 0x1458e6910
0x145929974: nop
0x145929975: mov eax, dword ptr [r14 + 0xa8c]
0x14592997c: mov qword ptr [rbp + 0x138], r15
0x145929983: mov qword ptr [rbp + 0x130], r12
0x14592998a: mov byte ptr [rbp + 0x177], 1
0x145929991: mov byte ptr [rbp + 0x176], 1
0x145929998: mov byte ptr [rbp + 0x175], 1
0x14592999f: mov byte ptr [rbp + 0x174], 1
0x1459299a6: mov dword ptr [rsp + 0x20], eax
0x1459299aa: lea r8, [rip + 0x1900db7]
0x1459299b1: lea rcx, [rbp + 0xf0]
0x1459299b8: lea rdx, [rbp + 0x140]
0x1459299bf: mov r9d, 9
0x1459299c5: call 0x1458e6910
0x1459299ca: nop
0x1459299cb: mov eax, dword ptr [r14 + 0x754]
0x1459299d2: mov qword ptr [rbp + 0x138], r15
0x1459299d9: mov qword ptr [rbp + 0x130], r12
0x1459299e0: mov byte ptr [rbp + 0x177], 1
0x1459299e7: mov byte ptr [rbp + 0x176], 1
0x1459299ee: mov byte ptr [rbp + 0x175], 1
0x1459299f5: mov byte ptr [rbp + 0x174], 1
0x1459299fc: mov dword ptr [rsp + 0x20], eax
0x145929a00: lea r8, [rip + 0x1900d6a]
0x145929a07: lea rcx, [rbp + 0x140]
0x145929a0e: lea rdx, [rbp + 0xf0]
0x145929a15: mov r9d, 5
0x145929a1b: call 0x1458e6910
0x145929a20: nop
0x145929a21: mov rdi, qword ptr [rbp - 0x38]
0x145929a25: test rdi, rdi
0x145929a28: je 0x145929a3b
0x145929a2a: mov ecx, edi
0x145929a2c: and ecx, 3
0x145929a2f: cmp rdi, 4
0x145929a33: jae 0x145929a42
0x145929a35: xor edx, edx
0x145929a37: xor eax, eax
0x145929a39: jmp 0x145929aa9
0x145929a3b: xor eax, eax
0x145929a3d: jmp 0x145929ae7
0x145929a42: and rdi, 0xfffffffffffffffc
0x145929a46: mov rax, qword ptr [rbp - 0x10]
0x145929a4a: lea r8, [rax + 0x638]
0x145929a51: xor edx, edx
0x145929a53: xor eax, eax
0x145929a55: nop word ptr cs:[rax + rax]
0x145929a60: mov r9d, dword ptr [r8 - 0x588]
0x145929a67: mov r10d, dword ptr [r8 - 0x3b0]
0x145929a6e: xor r9, 1
0x145929a72: add r9, rax
0x145929a75: xor r10, 1
0x145929a79: mov r11d, dword ptr [r8 - 0x1d8]
0x145929a80: xor r11, 1
0x145929a84: add r11, r10
0x145929a87: add r11, r9
0x145929a8a: mov eax, dword ptr [r8]
0x145929a8d: xor rax, 1
0x145929a91: add rax, r11
0x145929a94: add rdx, 4
0x145929a98: add r8, 0x760
0x145929a9f: cmp rdi, rdx
0x145929aa2: jne 0x145929a60
0x145929aa4: test rcx, rcx
0x145929aa7: je 0x145929ae7
0x145929aa9: imul rdx, rdx, 0x1d8
0x145929ab0: mov r8, qword ptr [rbp - 0x10]
0x145929ab4: add rdx, r8
0x145929ab7: add rdx, 0xb0
0x145929abe: imul rcx, rcx, 0x1d8
0x145929ac5: xor r8d, r8d
0x145929ac8: nop dword ptr [rax + rax]
0x145929ad0: mov r9d, dword ptr [rdx + r8]
0x145929ad4: xor r9, 1
0x145929ad8: add rax, r9
0x145929adb: add r8, 0x1d8
0x145929ae2: cmp rcx, r8
0x145929ae5: jne 0x145929ad0
0x145929ae7: mov qword ptr [rbp + 0x138], r15
0x145929aee: mov r14, qword ptr [rbp + 0x120]
0x145929af5: mov qword ptr [rbp + 0x130], r14
0x145929afc: mov byte ptr [rbp + 0x177], 1
0x145929b03: mov byte ptr [rbp + 0x176], 1
0x145929b0a: mov byte ptr [rbp + 0x175], 1
0x145929b11: mov byte ptr [rbp + 0x174], 1
0x145929b18: mov dword ptr [rsp + 0x20], eax
0x145929b1c: lea r8, [rip + 0x1900c53]
0x145929b23: lea rcx, [rbp + 0xf0]
0x145929b2a: lea rdx, [rbp + 0x140]
0x145929b31: mov r9d, 7
0x145929b37: call 0x1458e6910
0x145929b3c: nop
0x145929b3d: mov rax, qword ptr [rbp + 0xb0]
0x145929b44: mov edi, dword ptr [rax + 0x540]
0x145929b4a: mov qword ptr [rbp + 0x138], r15
0x145929b51: mov qword ptr [rbp + 0x130], r14
0x145929b58: mov byte ptr [rbp + 0x177], 1
0x145929b5f: mov byte ptr [rbp + 0x176], 1
0x145929b66: mov byte ptr [rbp + 0x175], 1
0x145929b6d: mov byte ptr [rbp + 0x174], 1
0x145929b74: mov dword ptr [rsp + 0x20], edi
0x145929b78: lea r8, [rip + 0x1900bfe]
0x145929b7f: lea rcx, [rbp + 0x140]
0x145929b86: lea rdx, [rbp + 0xf0]
0x145929b8d: mov r9d, 7
0x145929b93: call 0x1458e6910
0x145929b98: nop
0x145929b99: xor ecx, ecx
0x145929b9b: test edi, edi
0x145929b9d: jne 0x145929c4b
0x145929ba3: mov rax, qword ptr [rbp + 0xb0]
0x145929baa: mov r8d, dword ptr [rax + 0x544]
0x145929bb1: mov eax, 1
0x145929bb6: test r8d, r8d
0x145929bb9: je 0x145929c34
0x145929bbb: test r8b, 1
0x145929bbf: je 0x145929bcc
0x145929bc1: mov eax, 3
0x145929bc6: cmp r8d, 1
0x145929bca: je 0x145929c34
0x145929bcc: test r8b, 2
0x145929bd0: je 0x145929be0
0x145929bd2: lea eax, [rax + rax*8]
0x145929bd5: mov ecx, r8d
0x145929bd8: and ecx, 0xfffffffe
0x145929bdb: cmp ecx, 2
0x145929bde: je 0x145929c34
0x145929be0: test r8b, 4
0x145929be4: je 0x145929bf7
0x145929be6: lea eax, [rax + rax*8]
0x145929be9: lea eax, [rax + rax*8]
0x145929bec: mov ecx, r8d
0x145929bef: and ecx, 0xfffffffc
0x145929bf2: cmp ecx, 4
0x145929bf5: je 0x145929c34
0x145929bf7: test r8b, 8
0x145929bfb: je 0x145929c0e
0x145929bfd: imul eax, eax, 0x19a1
0x145929c03: mov ecx, r8d
0x145929c06: and ecx, 0xfffffff8
0x145929c09: cmp ecx, 8
0x145929c0c: je 0x145929c34
0x145929c0e: mov r9b, 1
0x145929c11: mov ecx, 0xffffff9c
0x145929c16: test r8b, 0x10
0x145929c1a: je 0x145929c41
0x145929c1c: mov edx, 0x290d741
0x145929c21: mul edx
0x145929c23: seto dl
0x145929c26: and r8d, 0xfffffff0
0x145929c2a: cmp r8d, 0x10
0x145929c2e: jne 0x145929c41
0x145929c30: test dl, dl
0x145929c32: jne 0x145929c41
0x145929c34: mov ecx, 0x64
0x145929c39: mul ecx
0x145929c3b: mov ecx, eax
0x145929c3d: seto r9b
0x145929c41: test r9b, 1
0x145929c45: jne 0x14592ae43
0x145929c4b: mov qword ptr [rbp + 0x138], r15
0x145929c52: mov rax, qword ptr [rbp + 0x120]
0x145929c59: mov qword ptr [rbp + 0x130], rax
0x145929c60: mov byte ptr [rbp + 0x177], 1
0x145929c67: mov byte ptr [rbp + 0x176], 1
0x145929c6e: mov byte ptr [rbp + 0x175], 1
0x145929c75: mov byte ptr [rbp + 0x174], 1
0x145929c7c: mov dword ptr [rsp + 0x20], ecx
0x145929c80: lea r8, [rip + 0x1900afd]
0x145929c87: lea rcx, [rbp + 0xf0]
0x145929c8e: lea rdx, [rbp + 0x140]
0x145929c95: mov r9d, 0xa
0x145929c9b: call 0x1458e6910
0x145929ca0: nop
0x145929ca1: mov rdi, qword ptr [rbp + 0xb0]
0x145929ca8: xor eax, eax
0x145929caa: cmp byte ptr [rdi + 0xabc], 0
0x145929cb1: je 0x145929cb9
0x145929cb3: mov eax, dword ptr [rdi + 0xa48]
0x145929cb9: mov qword ptr [rbp + 0x138], r15
0x145929cc0: mov r14, qword ptr [rbp + 0x120]
0x145929cc7: mov qword ptr [rbp + 0x130], r14
0x145929cce: mov byte ptr [rbp + 0x177], 1
0x145929cd5: mov byte ptr [rbp + 0x176], 1
0x145929cdc: mov byte ptr [rbp + 0x175], 1
0x145929ce3: mov byte ptr [rbp + 0x174], 1
0x145929cea: mov dword ptr [rsp + 0x20], eax
0x145929cee: lea r8, [rip + 0x1900a99]
0x145929cf5: lea rcx, [rbp + 0x140]
0x145929cfc: lea rdx, [rbp + 0xf0]
0x145929d03: mov r9d, 0xc
0x145929d09: call 0x1458e6910
0x145929d0e: nop
0x145929d0f: movss xmm0, dword ptr [rdi + 0x47c]
0x145929d17: mov qword ptr [rbp + 0x138], r15
0x145929d1e: mov qword ptr [rbp + 0x130], r14
0x145929d25: mov byte ptr [rbp + 0x177], 1
0x145929d2c: mov byte ptr [rbp + 0x176], 1
0x145929d33: mov byte ptr [rbp + 0x175], 1
0x145929d3a: mov byte ptr [rbp + 0x174], 1
0x145929d41: movss dword ptr [rsp + 0x20], xmm0
0x145929d47: lea r8, [rip + 0x1900a4c]
0x145929d4e: lea rcx, [rbp + 0xf0]
0x145929d55: lea rdx, [rbp + 0x140]
0x145929d5c: mov r9d, 6
0x145929d62: call 0x1458e6790
0x145929d67: nop
0x145929d68: mov qword ptr [rbp + 0x138], r15
0x145929d6f: mov qword ptr [rbp + 0x130], r14
0x145929d76: mov byte ptr [rbp + 0x177], 1
0x145929d7d: mov byte ptr [rbp + 0x176], 1
0x145929d84: mov byte ptr [rbp + 0x175], 1
0x145929d8b: mov byte ptr [rbp + 0x174], 1
0x145929d92: movss dword ptr [rsp + 0x20], xmm6
0x145929d98: lea r8, [rip + 0x1900a01]
0x145929d9f: lea rcx, [rbp + 0x140]
0x145929da6: lea rdx, [rbp + 0xf0]
0x145929dad: mov r9d, 8
0x145929db3: call 0x1458e6790
0x145929db8: nop
0x145929db9: movss xmm0, dword ptr [rdi + 0x484]
0x145929dc1: mov qword ptr [rbp + 0x138], r15
0x145929dc8: mov qword ptr [rbp + 0x130], r14
0x145929dcf: mov byte ptr [rbp + 0x177], 1
0x145929dd6: mov byte ptr [rbp + 0x176], 1
0x145929ddd: mov byte ptr [rbp + 0x175], 1
0x145929de4: mov byte ptr [rbp + 0x174], 1
0x145929deb: movss dword ptr [rsp + 0x20], xmm0
0x145929df1: lea r8, [rip + 0x19009b0]
0x145929df8: lea rcx, [rbp + 0xf0]
0x145929dff: lea rdx, [rbp + 0x140]
0x145929e06: mov r9d, 4
0x145929e0c: call 0x1458e6790
0x145929e11: nop
0x145929e12: movss xmm0, dword ptr [rdi + 0x48c]
0x145929e1a: mov qword ptr [rbp + 0x138], r15
0x145929e21: mov qword ptr [rbp + 0x130], r14
0x145929e28: mov byte ptr [rbp + 0x177], 1
0x145929e2f: mov byte ptr [rbp + 0x176], 1
0x145929e36: mov byte ptr [rbp + 0x175], 1
0x145929e3d: mov byte ptr [rbp + 0x174], 1
0x145929e44: movss dword ptr [rsp + 0x20], xmm0
0x145929e4a: lea r8, [rip + 0x190095b]
0x145929e51: lea rcx, [rbp + 0x140]
0x145929e58: lea rdx, [rbp + 0xf0]
0x145929e5f: mov r9d, 5
0x145929e65: call 0x1458e6790
0x145929e6a: nop
0x145929e6b: movss xmm0, dword ptr [rdi + 0x498]
0x145929e73: mov qword ptr [rbp + 0x138], r15
0x145929e7a: mov qword ptr [rbp + 0x130], r14
0x145929e81: mov byte ptr [rbp + 0x177], 1
0x145929e88: mov byte ptr [rbp + 0x176], 1
0x145929e8f: mov byte ptr [rbp + 0x175], 1
0x145929e96: mov byte ptr [rbp + 0x174], 1
0x145929e9d: movss dword ptr [rsp + 0x20], xmm0
0x145929ea3: lea r8, [rip + 0x1900907]
0x145929eaa: lea rcx, [rbp + 0xf0]
0x145929eb1: lea rdx, [rbp + 0x140]
0x145929eb8: mov r9d, 5
0x145929ebe: call 0x1458e6790
0x145929ec3: nop
0x145929ec4: movss xmm0, dword ptr [rdi + 0x49c]
0x145929ecc: mov qword ptr [rbp + 0x138], r15
0x145929ed3: mov qword ptr [rbp + 0x130], r14
0x145929eda: mov byte ptr [rbp + 0x177], 1
0x145929ee1: mov byte ptr [rbp + 0x176], 1
0x145929ee8: mov byte ptr [rbp + 0x175], 1
0x145929eef: mov byte ptr [rbp + 0x174], 1
0x145929ef6: movss dword ptr [rsp + 0x20], xmm0
0x145929efc: lea r8, [rip + 0x19008b3]
0x145929f03: lea rcx, [rbp + 0x140]
0x145929f0a: lea rdx, [rbp + 0xf0]
0x145929f11: mov r9d, 5
0x145929f17: call 0x1458e6790
0x145929f1c: nop
0x145929f1d: movss xmm0, dword ptr [rdi + 0x490]
0x145929f25: mov qword ptr [rbp + 0x138], r15
0x145929f2c: mov qword ptr [rbp + 0x130], r14
0x145929f33: mov byte ptr [rbp + 0x177], 1
0x145929f3a: mov byte ptr [rbp + 0x176], 1
0x145929f41: mov byte ptr [rbp + 0x175], 1
0x145929f48: mov byte ptr [rbp + 0x174], 1
0x145929f4f: movss dword ptr [rsp + 0x20], xmm0
0x145929f55: lea r8, [rip + 0x190085f]
0x145929f5c: lea rcx, [rbp + 0xf0]
0x145929f63: lea rdx, [rbp + 0x140]
0x145929f6a: mov r9d, 6
0x145929f70: call 0x1458e6790
0x145929f75: nop
0x145929f76: mov r14b, byte ptr [rdi + 0xab8]
0x145929f7d: lea rdx, [rip + 0x190083d]
0x145929f84: lea rcx, [rbp + 0xf0]
0x145929f8b: mov r8d, 7
0x145929f91: call 0x1458eb470
0x145929f96: nop
0x145929f97: mov r15, qword ptr [rbp + 0xb8]
0x145929f9e: movzx edi, r14b
0x145929fa2: xor rdi, 5
0x145929fa6: mov rax, qword ptr [rbp + 0xf0]
0x145929fad: mov rcx, qword ptr [rbp + 0x100]
0x145929fb4: sub rax, rcx
0x145929fb7: cmp rdi, rax
0x145929fba: ja 0x14592ac57
0x145929fc0: lea rax, [rip + 0x12c79f6]
0x145929fc7: lea r12, [rip + 0x12c79ea]
0x145929fce: test r14b, r14b
0x145929fd1: mov rdx, r12
0x145929fd4: cmovne rdx, rax
0x145929fd8: add rcx, qword ptr [rbp + 0xf8]
0x145929fdf: mov r8, rdi
0x145929fe2: call 0x145bfa0e7
0x145929fe7: add qword ptr [rbp + 0x100], rdi
0x145929fee: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145929ff5: movaps xmmword ptr [rbp + 0xc0], xmm0
0x145929ffc: movups xmm0, xmmword ptr [rbp + 0x100]
0x14592a003: movaps xmmword ptr [rbp + 0xd0], xmm0
0x14592a00a: mov r8, qword ptr [rbp - 0x30]
0x14592a00e: mov qword ptr [rbp + 0x140], r8
0x14592a015: mov r9, qword ptr [rbp - 0x28]
0x14592a019: mov qword ptr [rbp + 0x148], r9
0x14592a020: mov rdx, qword ptr [rbp - 0x20]
0x14592a024: mov qword ptr [rbp + 0x150], rdx
0x14592a02b: movzx eax, byte ptr [rbp + 0xe3]
0x14592a032: mov byte ptr [rbp + 0x158], al
0x14592a038: mov eax, dword ptr [rbp + 0x30]
0x14592a03b: mov ecx, dword ptr [rbp + 0x33]
0x14592a03e: mov dword ptr [rbp + 0x159], eax
0x14592a044: mov dword ptr [rbp + 0x15c], ecx
0x14592a04a: mov rax, r9
0x14592a04d: cmp r8, rdx
0x14592a050: mov r14, qword ptr [rbp + 0xb0]
0x14592a057: je 0x14592ac85
0x14592a05d: mov byte ptr [rax + rdx], 0x5d
0x14592a061: inc rdx
0x14592a064: mov qword ptr [rbp + 0x90], rdx
0x14592a06b: mov rax, qword ptr [rbp + 0x140]
0x14592a072: mov qword ptr [rbp + 0x80], rax
0x14592a079: mov rax, qword ptr [rbp + 0x148]
0x14592a080: mov qword ptr [rbp + 0x88], rax
0x14592a087: mov byte ptr [rbp + 0xee], 0
0x14592a08e: lea rax, [rbp + 0x80]
0x14592a095: mov qword ptr [rsp + 0x20], rax
0x14592a09a: lea r8, [rip + 0x1900727]
0x14592a0a1: lea rcx, [rbp + 0xf0]
0x14592a0a8: lea rdx, [rbp + 0xc0]
0x14592a0af: mov r9d, 9
0x14592a0b5: call 0x1458eb5e0
0x14592a0ba: nop
0x14592a0bb: mov r8, qword ptr [rbp + 0xa8]
0x14592a0c2: mov qword ptr [rbp + 0x140], r8
0x14592a0c9: mov rdx, qword ptr [rbp + 0x70]
0x14592a0cd: mov qword ptr [rbp + 0x148], rdx
0x14592a0d4: mov qword ptr [rbp + 0x150], r15
0x14592a0db: movzx eax, byte ptr [rbp + 0xe4]
0x14592a0e2: mov byte ptr [rbp + 0x158], al
0x14592a0e8: mov eax, dword ptr [rbp + 0x78]
0x14592a0eb: mov ecx, dword ptr [rbp + 0x7b]
0x14592a0ee: mov dword ptr [rbp + 0x159], eax
0x14592a0f4: mov dword ptr [rbp + 0x15c], ecx
0x14592a0fa: mov rax, rdx
0x14592a0fd: cmp r8, r15
0x14592a100: je 0x14592acb7
0x14592a106: mov byte ptr [rax + r15], 0x5d
0x14592a10b: inc r15
0x14592a10e: mov qword ptr [rbp + 0x90], r15
0x14592a115: mov rax, qword ptr [rbp + 0x140]
0x14592a11c: mov qword ptr [rbp + 0x80], rax
0x14592a123: mov rax, qword ptr [rbp + 0x148]
0x14592a12a: mov qword ptr [rbp + 0x88], rax
0x14592a131: mov byte ptr [rbp + 0xed], 0
0x14592a138: lea rax, [rbp + 0x80]
0x14592a13f: mov qword ptr [rsp + 0x20], rax
0x14592a144: lea r8, [rip + 0x1900686]
0x14592a14b: lea rcx, [rbp + 0xc0]
0x14592a152: lea rdi, [rbp + 0xf0]
0x14592a159: mov r9d, 7
0x14592a15f: mov rdx, rdi
0x14592a162: call 0x1458eb5e0
0x14592a167: nop
0x14592a168: mov r8, qword ptr [rbp + 0x120]
0x14592a16f: mov qword ptr [rbp + 0x140], r8
0x14592a176: mov r9, qword ptr [rbp + 0x118]
0x14592a17d: mov qword ptr [rbp + 0x148], r9
0x14592a184: mov rdx, r13
0x14592a187: mov qword ptr [rbp + 0x150], r13
0x14592a18e: mov byte ptr [rbp + 0x158], sil
0x14592a195: mov eax, dword ptr [rbp + 0x10]
0x14592a198: mov ecx, dword ptr [rbp + 0x13]
0x14592a19b: mov dword ptr [rbp + 0x159], eax
0x14592a1a1: mov dword ptr [rbp + 0x15c], ecx
0x14592a1a7: mov rax, r9
0x14592a1aa: cmp r8, r13
0x14592a1ad: je 0x14592ace8
0x14592a1b3: mov byte ptr [rax + rdx], 0x5d
0x14592a1b7: inc rdx
0x14592a1ba: mov qword ptr [rbp + 0x100], rdx
0x14592a1c1: mov rax, qword ptr [rbp + 0x140]
0x14592a1c8: mov qword ptr [rbp + 0xf0], rax
0x14592a1cf: mov rax, qword ptr [rbp + 0x148]
0x14592a1d6: mov qword ptr [rbp + 0xf8], rax
0x14592a1dd: mov byte ptr [rbp + 0xec], 0
0x14592a1e4: mov qword ptr [rsp + 0x20], rdi
0x14592a1e9: lea r8, [rip + 0x19005e8]
0x14592a1f0: lea rcx, [rbp + 0x140]
0x14592a1f7: lea rdx, [rbp + 0xc0]
0x14592a1fe: mov r9d, 5
0x14592a204: call 0x1458eb5e0
0x14592a209: nop
0x14592a20a: mov rdi, qword ptr [r14 + 0x6b0]
0x14592a211: mov r14, qword ptr [r14 + 0x6b8]
0x14592a218: test r14, r14
0x14592a21b: je 0x14592a243
0x14592a21d: mov eax, r14d
0x14592a220: and eax, 3
0x14592a223: cmp r14, 4
0x14592a227: jae 0x14592a25e
0x14592a229: movsd xmm0, qword ptr [rip + 0x4ae0ff]
0x14592a231: xor ecx, ecx
0x14592a233: mov rsi, qword ptr [rbp + 0x118]
0x14592a23a: mov r15, qword ptr [rbp + 0x120]
0x14592a241: jmp 0x14592a2c0
0x14592a243: movsd xmm0, qword ptr [rip + 0x4ae0e5]
0x14592a24b: mov rsi, qword ptr [rbp + 0x118]
0x14592a252: mov r15, qword ptr [rbp + 0x120]
0x14592a259: jmp 0x14592a2f3
0x14592a25e: mov rdx, r14
0x14592a261: and rdx, 0xfffffffffffffffc
0x14592a265: lea r8, [rdi + 0x130]
0x14592a26c: movsd xmm0, qword ptr [rip + 0x4ae0bc]
0x14592a274: xor ecx, ecx
0x14592a276: nop word ptr cs:[rax + rax]
0x14592a280: addsd xmm0, qword ptr [r8 - 0xf0]
0x14592a289: addsd xmm0, qword ptr [r8 - 0xa0]
0x14592a292: addsd xmm0, qword ptr [r8 - 0x50]
0x14592a298: addsd xmm0, qword ptr [r8]
0x14592a29d: add rcx, 4
0x14592a2a1: add r8, 0x140
0x14592a2a8: cmp rdx, rcx
0x14592a2ab: jne 0x14592a280
0x14592a2ad: test rax, rax
0x14592a2b0: mov rsi, qword ptr [rbp + 0x118]
0x14592a2b7: mov r15, qword ptr [rbp + 0x120]
0x14592a2be: je 0x14592a2ee
0x14592a2c0: lea rcx, [rcx + rcx*4]
0x14592a2c4: shl rcx, 4
0x14592a2c8: add rcx, rdi
0x14592a2cb: add rcx, 0x40
0x14592a2cf: shl eax, 4
0x14592a2d2: lea rax, [rax + rax*4]
0x14592a2d6: xor edx, edx
0x14592a2d8: nop dword ptr [rax + rax]
0x14592a2e0: addsd xmm0, qword ptr [rcx + rdx]
0x14592a2e5: add rdx, 0x50
0x14592a2e9: cmp rax, rdx
0x14592a2ec: jne 0x14592a2e0
0x14592a2ee: call 0x145bfa14d
0x14592a2f3: mov qword ptr [rbp + 0x138], rsi
0x14592a2fa: mov qword ptr [rbp + 0x130], r15
0x14592a301: mov byte ptr [rbp + 0x177], 0
0x14592a308: mov byte ptr [rbp + 0x176], 1
0x14592a30f: mov byte ptr [rbp + 0x175], 0
0x14592a316: mov byte ptr [rbp + 0x174], 0
0x14592a31d: movsd qword ptr [rsp + 0x20], xmm0
0x14592a323: lea r8, [rip + 0x19003bb]
0x14592a32a: lea rcx, [rbp + 0xf0]
0x14592a331: lea rdx, [rbp + 0x140]
0x14592a338: mov r9d, 5
0x14592a33e: call 0x1458e6610
0x14592a343: nop
0x14592a344: mov byte ptr [rbp + 0xeb], 1
0x14592a34b: lea r15, [rbp + 0xc0]
0x14592a352: mov rcx, r15
0x14592a355: mov rdx, rdi
0x14592a358: mov r8, r14
0x14592a35b: call 0x14599cb60
0x14592a360: nop
0x14592a361: mov byte ptr [rbp + 0xeb], 0
0x14592a368: mov qword ptr [rsp + 0x20], r15
0x14592a36d: lea r8, [rip + 0x1900469]
0x14592a374: lea rcx, [rbp + 0x140]
0x14592a37b: lea rdx, [rbp + 0xf0]
0x14592a382: mov r9d, 5
0x14592a388: call 0x1458eb5e0
0x14592a38d: nop
0x14592a38e: mov rax, qword ptr [rbp + 0xb0]
0x14592a395: mov rdi, qword ptr [rax + 0x6c8]
0x14592a39c: mov r14, qword ptr [rax + 0x6d0]
0x14592a3a3: test r14, r14
0x14592a3a6: je 0x14592a3ce
0x14592a3a8: mov eax, r14d
0x14592a3ab: and eax, 3
0x14592a3ae: cmp r14, 4
0x14592a3b2: mov r15, qword ptr [rbp + 0x120]
0x14592a3b9: jae 0x14592a3e9
0x14592a3bb: movsd xmm0, qword ptr [rip + 0x4adf6d]
0x14592a3c3: xor ecx, ecx
0x14592a3c5: mov rsi, qword ptr [rbp + 0x118]
0x14592a3cc: jmp 0x14592a449
0x14592a3ce: movsd xmm0, qword ptr [rip + 0x4adf5a]
0x14592a3d6: mov rsi, qword ptr [rbp + 0x118]
0x14592a3dd: mov r15, qword ptr [rbp + 0x120]
0x14592a3e4: jmp 0x14592a483
0x14592a3e9: mov rdx, r14
0x14592a3ec: and rdx, 0xfffffffffffffffc
0x14592a3f0: lea r8, [rdi + 0x130]
0x14592a3f7: movsd xmm0, qword ptr [rip + 0x4adf31]
0x14592a3ff: xor ecx, ecx
0x14592a401: nop word ptr cs:[rax + rax]
0x14592a410: addsd xmm0, qword ptr [r8 - 0xf0]
0x14592a419: addsd xmm0, qword ptr [r8 - 0xa0]
0x14592a422: addsd xmm0, qword ptr [r8 - 0x50]
0x14592a428: addsd xmm0, qword ptr [r8]
0x14592a42d: add rcx, 4
0x14592a431: add r8, 0x140
0x14592a438: cmp rdx, rcx
0x14592a43b: jne 0x14592a410
0x14592a43d: test rax, rax
0x14592a440: mov rsi, qword ptr [rbp + 0x118]
0x14592a447: je 0x14592a47e
0x14592a449: lea rcx, [rcx + rcx*4]
0x14592a44d: shl rcx, 4
0x14592a451: add rcx, rdi
0x14592a454: add rcx, 0x40
0x14592a458: shl eax, 4
0x14592a45b: lea rax, [rax + rax*4]
0x14592a45f: xor edx, edx
0x14592a461: nop word ptr cs:[rax + rax]
0x14592a470: addsd xmm0, qword ptr [rcx + rdx]
0x14592a475: add rdx, 0x50
0x14592a479: cmp rax, rdx
0x14592a47c: jne 0x14592a470
0x14592a47e: call 0x145bfa14d
0x14592a483: mov qword ptr [rbp + 0x138], rsi
0x14592a48a: mov qword ptr [rbp + 0x130], r15
0x14592a491: mov byte ptr [rbp + 0x177], 0
0x14592a498: mov byte ptr [rbp + 0x176], 1
0x14592a49f: mov byte ptr [rbp + 0x175], 0
0x14592a4a6: mov byte ptr [rbp + 0x174], 0
0x14592a4ad: movsd qword ptr [rsp + 0x20], xmm0
0x14592a4b3: lea r8, [rip + 0x1900328]
0x14592a4ba: lea rcx, [rbp + 0xf0]
0x14592a4c1: lea rdx, [rbp + 0x140]
0x14592a4c8: mov r9d, 6
0x14592a4ce: call 0x1458e6610
0x14592a4d3: nop
0x14592a4d4: mov byte ptr [rbp + 0xea], 1
0x14592a4db: lea r15, [rbp + 0x140]
0x14592a4e2: mov rcx, r15
0x14592a4e5: mov rdx, rdi
0x14592a4e8: mov r8, r14
0x14592a4eb: call 0x14599cb60
0x14592a4f0: nop
0x14592a4f1: mov byte ptr [rbp + 0xea], 0
0x14592a4f8: mov qword ptr [rsp + 0x20], r15
0x14592a4fd: lea r8, [rip + 0x19002e4]
0x14592a504: lea rcx, [rbp + 0xc0]
0x14592a50b: lea rdx, [rbp + 0xf0]
0x14592a512: mov r9d, 7
0x14592a518: call 0x1458eb5e0
0x14592a51d: nop
0x14592a51e: mov r14, qword ptr [rbp + 0xb0]
0x14592a525: mov esi, dword ptr [r14 + 0x74c]
0x14592a52c: cmp esi, 2
0x14592a52f: jne 0x14592a5cb
0x14592a535: call 0x140002200
0x14592a53a: mov ecx, 1
0x14592a53f: mov edx, 1
0x14592a544: call 0x1400021c0
0x14592a549: test rax, rax
0x14592a54c: je 0x14592afcb
0x14592a552: mov byte ptr [rax], 0x7b
0x14592a555: mov qword ptr [rbp + 0x140], 1
0x14592a560: mov qword ptr [rbp + 0x148], rax
0x14592a567: mov qword ptr [rbp + 0x150], 1
0x14592a572: mov byte ptr [rbp + 0x158], 1
0x14592a579: mov qword ptr [rsp + 0x20], 1
0x14592a582: lea rcx, [rbp + 0x140]
0x14592a589: mov edx, 1
0x14592a58e: mov r8d, 1
0x14592a594: mov r9d, 1
0x14592a59a: call 0x145bfa970
0x14592a59f: nop
0x14592a5a0: mov rax, qword ptr [rbp + 0x148]
0x14592a5a7: mov byte ptr [rax + 1], 0x7d
0x14592a5ab: movupd xmm0, xmmword ptr [rbp + 0x140]
0x14592a5b3: movapd xmmword ptr [rbp + 0x80], xmm0
0x14592a5bb: mov qword ptr [rbp + 0x90], 2
0x14592a5c6: jmp 0x14592a84b
0x14592a5cb: movss xmm9, dword ptr [r14 + 0x748]
0x14592a5d4: movss xmm6, dword ptr [r14 + 0x750]
0x14592a5dd: call 0x140002200
0x14592a5e2: mov ecx, 1
0x14592a5e7: mov edx, 1
0x14592a5ec: call 0x1400021c0
0x14592a5f1: test rax, rax
0x14592a5f4: je 0x14592afe4
0x14592a5fa: mov byte ptr [rax], 0x7b
0x14592a5fd: mov qword ptr [rbp + 0x140], 1
0x14592a608: mov qword ptr [rbp + 0x148], rax
0x14592a60f: mov qword ptr [rbp + 0x150], 1
0x14592a61a: mov byte ptr [rbp + 0x158], 1
0x14592a621: mov rdi, qword ptr [r14 + 0x6e0]
0x14592a628: mov r14, qword ptr [r14 + 0x6e8]
0x14592a62f: test r14, r14
0x14592a632: je 0x14592a64c
0x14592a634: mov eax, r14d
0x14592a637: and eax, 3
0x14592a63a: cmp r14, 4
0x14592a63e: jae 0x14592a656
0x14592a640: movsd xmm0, qword ptr [rip + 0x4adce8]
0x14592a648: xor ecx, ecx
0x14592a64a: jmp 0x14592a6a2
0x14592a64c: movsd xmm0, qword ptr [rip + 0x4adcdc]
0x14592a654: jmp 0x14592a6d3
0x14592a656: mov rdx, r14
0x14592a659: and rdx, 0xfffffffffffffffc
0x14592a65d: lea r8, [rdi + 0x130]
0x14592a664: movsd xmm0, qword ptr [rip + 0x4adcc4]
0x14592a66c: xor ecx, ecx
0x14592a66e: nop
0x14592a670: addsd xmm0, qword ptr [r8 - 0xf0]
0x14592a679: addsd xmm0, qword ptr [r8 - 0xa0]
0x14592a682: addsd xmm0, qword ptr [r8 - 0x50]
0x14592a688: addsd xmm0, qword ptr [r8]
0x14592a68d: add rcx, 4
0x14592a691: add r8, 0x140
0x14592a698: cmp rdx, rcx
0x14592a69b: jne 0x14592a670
0x14592a69d: test rax, rax
0x14592a6a0: je 0x14592a6ce
0x14592a6a2: lea rcx, [rcx + rcx*4]
0x14592a6a6: shl rcx, 4
0x14592a6aa: add rcx, rdi
0x14592a6ad: add rcx, 0x40
0x14592a6b1: shl eax, 4
0x14592a6b4: lea rax, [rax + rax*4]
0x14592a6b8: xor edx, edx
0x14592a6ba: nop word ptr [rax + rax]
0x14592a6c0: addsd xmm0, qword ptr [rcx + rdx]
0x14592a6c5: add rdx, 0x50
0x14592a6c9: cmp rax, rdx
0x14592a6cc: jne 0x14592a6c0
0x14592a6ce: call 0x145bfa14d
0x14592a6d3: mov byte ptr [rbp + 0x172], 1
0x14592a6da: movsd qword ptr [rsp + 0x20], xmm0
0x14592a6e0: lea r8, [rip + 0x18ffffe]
0x14592a6e7: lea rcx, [rbp + 0xf0]
0x14592a6ee: lea rdx, [rbp + 0x140]
0x14592a6f5: mov r9d, 5
0x14592a6fb: call 0x1458e6610
0x14592a700: nop
0x14592a701: test sil, 1
0x14592a705: jne 0x14592a70b
0x14592a707: movaps xmm6, xmm8
0x14592a70b: subss xmm6, xmm9
0x14592a710: mov byte ptr [rbp + 0x172], 1
0x14592a717: movss dword ptr [rsp + 0x20], xmm6
0x14592a71d: lea r8, [rip + 0x18fffc6]
0x14592a724: lea rcx, [rbp + 0x140]
0x14592a72b: lea rdx, [rbp + 0xf0]
0x14592a732: mov r9d, 4
0x14592a738: call 0x1458e6790
0x14592a73d: nop
0x14592a73e: lea rdx, [rip + 0x18fffa9]
0x14592a745: lea rcx, [rbp + 0x140]
0x14592a74c: mov r8d, 4
0x14592a752: call 0x1458eb470
0x14592a757: nop
0x14592a758: xor r15d, r15d
0x14592a75b: cmp esi, 1
0x14592a75e: sete r15b
0x14592a762: or r15, 4
0x14592a766: mov rax, qword ptr [rbp + 0x140]
0x14592a76d: mov rdx, qword ptr [rbp + 0x150]
0x14592a774: sub rax, rdx
0x14592a777: cmp r15, rax
0x14592a77a: ja 0x14592adc6
0x14592a780: cmp esi, 1
0x14592a783: lea rax, [rip + 0x12c7233]
0x14592a78a: cmovne r12, rax
0x14592a78e: add rdx, qword ptr [rbp + 0x148]
0x14592a795: mov rcx, rdx
0x14592a798: mov rdx, r12
0x14592a79b: mov r8, r15
0x14592a79e: call 0x145bfa0e7
0x14592a7a3: add qword ptr [rbp + 0x150], r15
0x14592a7aa: movups xmm0, xmmword ptr [rbp + 0x140]
0x14592a7b1: movaps xmmword ptr [rbp + 0xf0], xmm0
0x14592a7b8: movupd xmm0, xmmword ptr [rbp + 0x150]
0x14592a7c0: movapd xmmword ptr [rbp + 0x100], xmm0
0x14592a7c8: mov byte ptr [rbp + 0xe9], 1
0x14592a7cf: lea rsi, [rbp + 0x80]
0x14592a7d6: mov rcx, rsi
0x14592a7d9: mov rdx, rdi
0x14592a7dc: mov r8, r14
0x14592a7df: call 0x14599cb60
0x14592a7e4: nop
0x14592a7e5: mov byte ptr [rbp + 0xe9], 0
0x14592a7ec: mov qword ptr [rsp + 0x20], rsi
0x14592a7f1: lea r8, [rip + 0x18ffefa]
0x14592a7f8: lea rcx, [rbp + 0x140]
0x14592a7ff: lea rdx, [rbp + 0xf0]
0x14592a806: mov r9d, 5
0x14592a80c: call 0x1458eb5e0
0x14592a811: nop
0x14592a812: mov rsi, qword ptr [rbp + 0x150]
0x14592a819: cmp qword ptr [rbp + 0x140], rsi
0x14592a820: je 0x14592adf1
0x14592a826: mov rax, qword ptr [rbp + 0x148]
0x14592a82d: mov byte ptr [rax + rsi], 0x7d
0x14592a831: inc rsi
0x14592a834: mov qword ptr [rbp + 0x90], rsi
0x14592a83b: movupd xmm0, xmmword ptr [rbp + 0x140]
0x14592a843: movapd xmmword ptr [rbp + 0x80], xmm0
0x14592a84b: mov byte ptr [rbp + 0x172], 0
0x14592a852: lea rax, [rbp + 0x80]
0x14592a859: mov qword ptr [rsp + 0x20], rax
0x14592a85e: lea r8, [rip + 0x18fff8a]
0x14592a865: lea rcx, [rbp + 0xf0]
0x14592a86c: lea rsi, [rbp + 0xc0]
0x14592a873: mov r9d, 9
0x14592a879: mov rdx, rsi
0x14592a87c: call 0x1458eb5e0
0x14592a881: nop
0x14592a882: mov r8, qword ptr [rbp + 0x38]
0x14592a886: mov qword ptr [rbp + 0x140], r8
0x14592a88d: mov rdx, qword ptr [rbp + 0x28]
0x14592a891: mov qword ptr [rbp + 0x148], rdx
0x14592a898: mov r9, qword ptr [rbp - 0x18]
0x14592a89c: mov qword ptr [rbp + 0x150], r9
0x14592a8a3: movzx eax, byte ptr [rbp + 0xe5]
0x14592a8aa: mov byte ptr [rbp + 0x158], al
0x14592a8b0: mov eax, dword ptr [rbp - 8]
0x14592a8b3: mov ecx, dword ptr [rbp - 5]
0x14592a8b6: mov dword ptr [rbp + 0x159], eax
0x14592a8bc: mov dword ptr [rbp + 0x15c], ecx
0x14592a8c2: mov rax, rdx
0x14592a8c5: cmp r8, r9
0x14592a8c8: mov rdx, r9
0x14592a8cb: je 0x14592ad19
0x14592a8d1: mov byte ptr [rax + rdx], 0x5d
0x14592a8d5: inc rdx
0x14592a8d8: mov qword ptr [rbp + 0xd0], rdx
0x14592a8df: mov rax, qword ptr [rbp + 0x140]
0x14592a8e6: mov qword ptr [rbp + 0xc0], rax
0x14592a8ed: mov rax, qword ptr [rbp + 0x148]
0x14592a8f4: mov qword ptr [rbp + 0xc8], rax
0x14592a8fb: mov byte ptr [rbp + 0xe8], 0
0x14592a902: mov qword ptr [rsp + 0x20], rsi
0x14592a907: lea r8, [rip + 0x18ffeea]
0x14592a90e: lea rcx, [rbp + 0x40]
0x14592a912: lea rdx, [rbp + 0xf0]
0x14592a919: mov r9d, 6
0x14592a91f: call 0x1458eb5e0
0x14592a924: nop
0x14592a925: test rbx, rbx
0x14592a928: je 0x14592aaaa
0x14592a92e: movups xmm0, xmmword ptr [rbp + 0x40]
0x14592a932: movups xmm1, xmmword ptr [rbp + 0x50]
0x14592a936: movaps xmmword ptr [rbp + 0xd0], xmm1
0x14592a93d: movaps xmmword ptr [rbp + 0xc0], xmm0
0x14592a944: call 0x140002200
0x14592a949: mov ecx, 1
0x14592a94e: mov edx, 1
0x14592a953: call 0x1400021c0
0x14592a958: test rax, rax
0x14592a95b: je 0x14592afb2
0x14592a961: mov byte ptr [rax], 0x7b
0x14592a964: mov qword ptr [rbp + 0x140], 1
0x14592a96f: mov qword ptr [rbp + 0x148], rax
0x14592a976: mov qword ptr [rbp + 0x150], 1
0x14592a981: mov byte ptr [rbp + 0x158], 1
0x14592a988: mov byte ptr [rbp + 0xe7], 1
0x14592a98f: mov rcx, rbx
0x14592a992: call 0x14590d9a0
0x14592a997: nop
0x14592a998: mov byte ptr [rbp + 0xe7], 0
0x14592a99f: mov qword ptr [rsp + 0x28], rdx
0x14592a9a4: mov qword ptr [rsp + 0x20], rax
0x14592a9a9: lea r8, [rip + 0x18ffd63]
0x14592a9b0: lea rcx, [rbp + 0xf0]
0x14592a9b7: lea rdx, [rbp + 0x140]
0x14592a9be: mov r9d, 4
0x14592a9c4: call 0x1458eb720
0x14592a9c9: nop
0x14592a9ca: movss xmm0, dword ptr [rbx + 0x158]
0x14592a9d2: xorps xmm1, xmm1
0x14592a9d5: maxss xmm0, xmm1
0x14592a9d9: mov byte ptr [rbp + 0x16e], 1
0x14592a9e0: movss dword ptr [rsp + 0x20], xmm0
0x14592a9e6: lea r8, [rip + 0x18ffd6a]
0x14592a9ed: lea rcx, [rbp + 0x140]
0x14592a9f4: lea rdx, [rbp + 0xf0]
0x14592a9fb: mov r9d, 2
0x14592aa01: call 0x1458e6790
0x14592aa06: nop
0x14592aa07: movss xmm0, dword ptr [rbx + 0x15c]
0x14592aa0f: mov byte ptr [rbp + 0x16e], 1
0x14592aa16: movss dword ptr [rsp + 0x20], xmm0
0x14592aa1c: lea r8, [rip + 0x18ffd36]
0x14592aa23: lea rcx, [rbp + 0xf0]
0x14592aa2a: lea rdx, [rbp + 0x140]
0x14592aa31: mov r9d, 5
0x14592aa37: call 0x1458e6790
0x14592aa3c: nop
0x14592aa3d: mov rsi, qword ptr [rbp + 0x100]
0x14592aa44: cmp qword ptr [rbp + 0xf0], rsi
0x14592aa4b: je 0x14592ad9c
0x14592aa51: mov rax, qword ptr [rbp + 0xf8]
0x14592aa58: mov byte ptr [rax + rsi], 0x7d
0x14592aa5c: inc rsi
0x14592aa5f: mov qword ptr [rbp + 0x90], rsi
0x14592aa66: movups xmm0, xmmword ptr [rbp + 0xf0]
0x14592aa6d: movaps xmmword ptr [rbp + 0x80], xmm0
0x14592aa74: mov byte ptr [rbp + 0x16e], 0
0x14592aa7b: lea rax, [rbp + 0x80]
0x14592aa82: mov qword ptr [rsp + 0x20], rax
0x14592aa87: lea r8, [rip + 0x18ff4b0]
0x14592aa8e: lea rcx, [rbp + 0x140]
0x14592aa95: lea rdx, [rbp + 0xc0]
0x14592aa9c: mov r9d, 4
0x14592aaa2: call 0x1458eb5e0
0x14592aaa7: nop
0x14592aaa8: jmp 0x14592aafc
0x14592aaaa: lea rdx, [rip + 0x18ff48d]
0x14592aab1: lea rcx, [rbp + 0x40]
0x14592aab5: mov r8d, 4
0x14592aabb: call 0x1458eb470
0x14592aac0: nop
0x14592aac1: mov rax, qword ptr [rbp + 0x40]
0x14592aac5: mov rdx, qword ptr [rbp + 0x50]
0x14592aac9: sub rax, rdx
0x14592aacc: cmp rax, 3
0x14592aad0: jbe 0x14592ae4d
0x14592aad6: mov rax, qword ptr [rbp + 0x48]
0x14592aada: mov dword ptr [rax + rdx], 0x6c6c756e
0x14592aae1: add qword ptr [rbp + 0x50], 4
0x14592aae6: movups xmm0, xmmword ptr [rbp + 0x40]
0x14592aaea: movaps xmmword ptr [rbp + 0x140], xmm0
0x14592aaf1: movups xmm0, xmmword ptr [rbp + 0x50]
0x14592aaf5: movaps xmmword ptr [rbp + 0x150], xmm0
0x14592aafc: mov rcx, qword ptr [rbp + 0x118]
0x14592ab03: mov rdx, qword ptr [rbp + 0x120]
0x14592ab0a: movaps xmm0, xmmword ptr [rbp + 0x140]
0x14592ab11: movaps xmm1, xmmword ptr [rbp + 0x150]
0x14592ab18: movaps xmmword ptr [rbp + 0x50], xmm1
0x14592ab1c: xorps xmm1, xmm1
0x14592ab1f: ucomiss xmm7, xmm1
0x14592ab22: movaps xmmword ptr [rbp + 0x40], xmm0
0x14592ab26: seta al
0x14592ab29: test byte ptr [rbp + 0xef], al
0x14592ab2f: je 0x14592ab81
0x14592ab31: mov qword ptr [rbp + 0x138], rcx
0x14592ab38: mov qword ptr [rbp + 0x130], rdx
0x14592ab3f: mov byte ptr [rbp + 0x177], 0
0x14592ab46: mov byte ptr [rbp + 0x176], 0
0x14592ab4d: mov byte ptr [rbp + 0x175], 0
0x14592ab54: mov byte ptr [rbp + 0x174], 0
0x14592ab5b: movss dword ptr [rsp + 0x20], xmm7
0x14592ab61: lea r8, [rip + 0x18ffc96]
0x14592ab68: lea rcx, [rbp + 0x140]
0x14592ab6f: lea rdx, [rbp + 0x40]
0x14592ab73: mov r9d, 8
0x14592ab79: call 0x1458e6790
0x14592ab7e: nop
0x14592ab7f: jmp 0x14592abd3
0x14592ab81: lea rdx, [rip + 0x18ffc76]
0x14592ab88: lea rcx, [rbp + 0x40]
0x14592ab8c: mov r8d, 8
0x14592ab92: call 0x1458eb470
0x14592ab97: nop
0x14592ab98: mov rax, qword ptr [rbp + 0x40]
0x14592ab9c: mov rdx, qword ptr [rbp + 0x50]
0x14592aba0: sub rax, rdx
0x14592aba3: cmp rax, 3
0x14592aba7: jbe 0x14592ae1b
0x14592abad: mov rax, qword ptr [rbp + 0x48]
0x14592abb1: mov dword ptr [rax + rdx], 0x6c6c756e
0x14592abb8: add qword ptr [rbp + 0x50], 4
0x14592abbd: movaps xmm0, xmmword ptr [rbp + 0x40]
0x14592abc1: movaps xmmword ptr [rbp + 0x140], xmm0
0x14592abc8: movaps xmm0, xmmword ptr [rbp + 0x50]
0x14592abcc: movaps xmmword ptr [rbp + 0x150], xmm0
0x14592abd3: movaps xmm0, xmmword ptr [rbp + 0x140]
0x14592abda: movaps xmm1, xmmword ptr [rbp + 0x150]
0x14592abe1: movaps xmmword ptr [rbp + 0x50], xmm1
0x14592abe5: movaps xmmword ptr [rbp + 0x40], xmm0
0x14592abe9: mov rsi, qword ptr [rbp + 0x50]
0x14592abed: cmp qword ptr [rbp + 0x40], rsi
0x14592abf1: je 0x14592ad4b
0x14592abf7: mov rax, qword ptr [rbp + 0x48]
0x14592abfb: mov byte ptr [rax + rsi], 0x7d
0x14592abff: inc rsi
0x14592ac02: mov qword ptr [rbp + 0x50], rsi
0x14592ac06: mov rax, qword ptr [rbp - 0x40]
0x14592ac0a: mov qword ptr [rax + 0x10], rsi
0x14592ac0e: movaps xmm0, xmmword ptr [rbp + 0x40]
0x14592ac12: movups xmmword ptr [rax], xmm0
0x14592ac15: movaps xmm6, xmmword ptr [rbp + 0x180]
0x14592ac1c: movaps xmm7, xmmword ptr [rbp + 0x190]
0x14592ac23: movaps xmm8, xmmword ptr [rbp + 0x1a0]
0x14592ac2b: movaps xmm9, xmmword ptr [rbp + 0x1b0]
0x14592ac33: movaps xmm10, xmmword ptr [rbp + 0x1c0]
0x14592ac3b: movaps xmm11, xmmword ptr [rbp + 0x1d0]
0x14592ac43: add rsp, 0x268
0x14592ac4a: pop rbx
0x14592ac4b: pop rdi
0x14592ac4c: pop rsi
0x14592ac4d: pop r12
0x14592ac4f: pop r13
0x14592ac51: pop r14
0x14592ac53: pop r15
0x14592ac55: pop rbp
0x14592ac56: ret
0x14592ac57: mov qword ptr [rsp + 0x20], 1
0x14592ac60: mov rdx, rcx
0x14592ac63: lea rcx, [rbp + 0xf0]
0x14592ac6a: mov r9d, 1
0x14592ac70: mov r8, rdi
0x14592ac73: call 0x145bfa970
0x14592ac78: nop
0x14592ac79: mov rcx, qword ptr [rbp + 0x100]
0x14592ac80: jmp 0x145929fc0
0x14592ac85: mov qword ptr [rsp + 0x20], 1
0x14592ac8e: lea rcx, [rbp + 0x140]
0x14592ac95: mov r8d, 1
0x14592ac9b: mov r9d, 1
0x14592aca1: call 0x145bfa970
0x14592aca6: nop
0x14592aca7: mov rax, qword ptr [rbp + 0x148]
0x14592acae: mov rdx, qword ptr [rbp - 0x20]
0x14592acb2: jmp 0x14592a05d
0x14592acb7: mov qword ptr [rsp + 0x20], 1
0x14592acc0: lea rcx, [rbp + 0x140]
0x14592acc7: mov r8d, 1
0x14592accd: mov r9d, 1
0x14592acd3: mov rdx, r15
0x14592acd6: call 0x145bfa970
0x14592acdb: nop
0x14592acdc: mov rax, qword ptr [rbp + 0x148]
0x14592ace3: jmp 0x14592a106
0x14592ace8: mov qword ptr [rsp + 0x20], 1
0x14592acf1: lea rcx, [rbp + 0x140]
0x14592acf8: mov r8d, 1
0x14592acfe: mov r9d, 1
0x14592ad04: call 0x145bfa970
0x14592ad09: nop
0x14592ad0a: mov rax, qword ptr [rbp + 0x148]
0x14592ad11: mov rdx, r13
0x14592ad14: jmp 0x14592a1b3
0x14592ad19: mov qword ptr [rsp + 0x20], 1
0x14592ad22: lea rcx, [rbp + 0x140]
0x14592ad29: mov r8d, 1
0x14592ad2f: mov r9d, 1
0x14592ad35: call 0x145bfa970
0x14592ad3a: nop
0x14592ad3b: mov rax, qword ptr [rbp + 0x148]
0x14592ad42: mov rdx, qword ptr [rbp - 0x18]
0x14592ad46: jmp 0x14592a8d1
0x14592ad4b: mov qword ptr [rsp + 0x20], 1
0x14592ad54: lea rcx, [rbp + 0x40]
0x14592ad58: mov r8d, 1
0x14592ad5e: mov r9d, 1
0x14592ad64: mov rdx, rsi
0x14592ad67: call 0x145bfa970
0x14592ad6c: nop
0x14592ad6d: jmp 0x14592abf7
0x14592ad72: mov qword ptr [rsp + 0x20], 1
0x14592ad7b: lea rcx, [rbp + 0x140]
0x14592ad82: mov r8d, 1
0x14592ad88: mov r9d, 1
0x14592ad8e: mov rdx, rsi
0x14592ad91: call 0x145bfa970
0x14592ad96: nop
0x14592ad97: jmp 0x145928ea2
0x14592ad9c: mov qword ptr [rsp + 0x20], 1
0x14592ada5: lea rcx, [rbp + 0xf0]
0x14592adac: mov r8d, 1
0x14592adb2: mov r9d, 1
0x14592adb8: mov rdx, rsi
0x14592adbb: call 0x145bfa970
0x14592adc0: nop
0x14592adc1: jmp 0x14592aa51
0x14592adc6: mov qword ptr [rsp + 0x20], 1
0x14592adcf: lea rcx, [rbp + 0x140]
0x14592add6: mov r9d, 1
0x14592addc: mov r8, r15
0x14592addf: call 0x145bfa970
0x14592ade4: nop
0x14592ade5: mov rdx, qword ptr [rbp + 0x150]
0x14592adec: jmp 0x14592a780
0x14592adf1: mov qword ptr [rsp + 0x20], 1
0x14592adfa: lea rcx, [rbp + 0x140]
0x14592ae01: mov r8d, 1
0x14592ae07: mov r9d, 1
0x14592ae0d: mov rdx, rsi
0x14592ae10: call 0x145bfa970
0x14592ae15: nop
0x14592ae16: jmp 0x14592a826
0x14592ae1b: mov qword ptr [rsp + 0x20], 1
0x14592ae24: lea rcx, [rbp + 0x40]
0x14592ae28: mov r8d, 4
0x14592ae2e: mov r9d, 1
0x14592ae34: call 0x145bfa970
0x14592ae39: nop
0x14592ae3a: mov rdx, qword ptr [rbp + 0x50]
0x14592ae3e: jmp 0x14592abad
0x14592ae43: mov ecx, 0xffffffff
0x14592ae48: jmp 0x145929c4b
0x14592ae4d: mov qword ptr [rsp + 0x20], 1
0x14592ae56: lea rcx, [rbp + 0x40]
0x14592ae5a: mov r8d, 4
0x14592ae60: mov r9d, 1
0x14592ae66: call 0x145bfa970
0x14592ae6b: nop
0x14592ae6c: mov rdx, qword ptr [rbp + 0x50]
0x14592ae70: jmp 0x14592aad6
0x14592ae75: mov byte ptr [rbp + 0x173], 1
0x14592ae7c: mov ecx, 1
0x14592ae81: mov edx, 1
0x14592ae86: call 0x145d992bb
0x14592ae8b: nop
0x14592ae8c: jmp 0x14592affb
0x14592ae91: mov byte ptr [rbp + 0x171], 1
0x14592ae98: mov ecx, 1
0x14592ae9d: mov edx, 1
0x14592aea2: call 0x145d992bb
0x14592aea7: nop
0x14592aea8: jmp 0x14592affb
0x14592aead: mov byte ptr [rbp + 0x12b], 1
0x14592aeb4: mov ecx, 1
0x14592aeb9: mov edx, 1
0x14592aebe: call 0x145d992bb
0x14592aec3: nop
0x14592aec4: jmp 0x14592affb
0x14592aec9: mov ecx, 1
0x14592aece: mov edx, 1
0x14592aed3: call 0x145d992bb
0x14592aed8: ud2
0x14592aeda: mov byte ptr [rbp + 0x12f], 1
0x14592aee1: mov ecx, 1
0x14592aee6: mov edx, 1
0x14592aeeb: call 0x145d992bb
0x14592aef0: nop
0x14592aef1: jmp 0x14592affb
0x14592aef6: mov rax, qword ptr [rbp + 0x70]
0x14592aefa: mov qword ptr [rbp + 0x68], rax
0x14592aefe: mov rax, qword ptr [rbp + 0xa8]
0x14592af05: mov qword ptr [rbp + 0x60], rax
0x14592af09: mov byte ptr [rbp + 0x170], 1
0x14592af10: mov byte ptr [rbp + 0x16f], 1
0x14592af17: mov ecx, 1
0x14592af1c: mov edx, 1
0x14592af21: call 0x145d992bb
0x14592af26: nop
0x14592af27: jmp 0x14592affb
0x14592af2c: mov byte ptr [rbp + 0x12e], 1
0x14592af33: mov byte ptr [rbp + 0x12d], 1
0x14592af3a: mov byte ptr [rbp + 0x12c], 1
0x14592af41: mov ecx, 1
0x14592af46: mov edx, 1
0x14592af4b: call 0x145d992bb
0x14592af50: nop
0x14592af51: jmp 0x14592affb
0x14592af56: mov rax, qword ptr [rbp + 0x118]
0x14592af5d: mov qword ptr [rbp + 0x138], rax
0x14592af64: mov rax, qword ptr [rbp + 0x120]
0x14592af6b: mov qword ptr [rbp + 0x130], rax
0x14592af72: mov byte ptr [rbp + 0x177], 1
0x14592af79: mov byte ptr [rbp + 0x176], 1
0x14592af80: mov byte ptr [rbp + 0x175], 1
0x14592af87: mov byte ptr [rbp + 0x174], 1
0x14592af8e: mov ecx, 1
0x14592af93: mov edx, 1
0x14592af98: call 0x145d992bb
0x14592af9d: nop
0x14592af9e: jmp 0x14592affb
0x14592afa0: mov ecx, 1
0x14592afa5: mov edx, 1
0x14592afaa: call 0x145d992bb
0x14592afaf: nop
0x14592afb0: jmp 0x14592affb
0x14592afb2: mov byte ptr [rbp + 0x16e], 1
0x14592afb9: mov ecx, 1
0x14592afbe: mov edx, 1
0x14592afc3: call 0x145d992bb
0x14592afc8: nop
0x14592afc9: jmp 0x14592affb
0x14592afcb: mov byte ptr [rbp + 0x172], 1
0x14592afd2: mov ecx, 1
0x14592afd7: mov edx, 1
0x14592afdc: call 0x145d992bb
0x14592afe1: nop
0x14592afe2: jmp 0x14592affb
0x14592afe4: mov byte ptr [rbp + 0x172], 1
0x14592afeb: mov ecx, 1
0x14592aff0: mov edx, 1
0x14592aff5: call 0x145d992bb
0x14592affa: nop
0x14592affb: ud2

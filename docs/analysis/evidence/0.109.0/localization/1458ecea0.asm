; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458ecea0..0x1458ed658 SHA256 4c9b1d797d17ba7d9a1cd9c9ecf84dc9e33822fc70cea74c4c0c166c1dfc7d84
0x1458ecea0: push rbp
0x1458ecea1: push r15
0x1458ecea3: push r14
0x1458ecea5: push r13
0x1458ecea7: push r12
0x1458ecea9: push rsi
0x1458eceaa: push rdi
0x1458eceab: push rbx
0x1458eceac: sub rsp, 0x88
0x1458eceb3: lea rbp, [rsp + 0x80]
0x1458ecebb: movdqa xmmword ptr [rbp - 0x10], xmm7
0x1458ecec0: movdqa xmmword ptr [rbp - 0x20], xmm6
0x1458ecec5: mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
0x1458ececd: lea rdx, [rip + 0x1304bdc]
0x1458eced4: lea rcx, [rbp - 0x58]
0x1458eced8: mov r8d, 8
0x1458ecede: call 0x1458f01c0
0x1458ecee3: mov rax, qword ptr [rbp - 0x58]
0x1458ecee7: cmp rax, -1
0x1458eceeb: je 0x1458ed033
0x1458ecef1: mov qword ptr [rbp - 0x38], rax
0x1458ecef5: mov rcx, qword ptr [rbp - 0x50]
0x1458ecef9: mov rdx, qword ptr [rbp - 0x48]
0x1458ecefd: mov qword ptr [rbp - 0x30], rcx
0x1458ecf01: call 0x140089200
0x1458ecf06: nop
0x1458ecf07: mov rsi, rdx
0x1458ecf0a: test rdx, rdx
0x1458ecf0d: jns 0x1458ecf23
0x1458ecf0f: xor r14d, r14d
0x1458ecf12: mov rcx, r14
0x1458ecf15: mov rdx, rsi
0x1458ecf18: call 0x145d992bb
0x1458ecf1d: nop
0x1458ecf1e: jmp 0x1458ed403
0x1458ecf23: test rsi, rsi
0x1458ecf26: je 0x1458ed26e
0x1458ecf2c: mov rbx, rax
0x1458ecf2f: call 0x140002200
0x1458ecf34: mov r14d, 1
0x1458ecf3a: mov edx, 1
0x1458ecf3f: mov rcx, rsi
0x1458ecf42: call 0x1400021c0
0x1458ecf47: test rax, rax
0x1458ecf4a: je 0x1458ecf12
0x1458ecf4c: mov rdi, rax
0x1458ecf4f: mov rcx, rax
0x1458ecf52: mov rdx, rbx
0x1458ecf55: mov r8, rsi
0x1458ecf58: call 0x145bfa0e7
0x1458ecf5d: mov rdx, qword ptr [rbp - 0x38]
0x1458ecf61: test rdx, rdx
0x1458ecf64: je 0x1458ecf75
0x1458ecf66: mov r8d, 1
0x1458ecf6c: mov rcx, qword ptr [rbp - 0x30]
0x1458ecf70: call 0x1400021d0
0x1458ecf75: test rsi, rsi
0x1458ecf78: je 0x1458ed033
0x1458ecf7e: cmp rsi, 2
0x1458ecf82: jne 0x1458ed022
0x1458ecf88: cmp word ptr [rdi], 0x6e65
0x1458ecf8d: je 0x1458ed609
0x1458ecf93: cmp word ptr [rdi], 0x6c70
0x1458ecf98: je 0x1458ed609
0x1458ecf9e: cmp word ptr [rdi], 0x7363
0x1458ecfa3: je 0x1458ed609
0x1458ecfa9: cmp word ptr [rdi], 0x6564
0x1458ecfae: je 0x1458ed609
0x1458ecfb4: cmp word ptr [rdi], 0x7470
0x1458ecfb9: je 0x1458ed609
0x1458ecfbf: cmp word ptr [rdi], 0x7365
0x1458ecfc4: je 0x1458ed609
0x1458ecfca: cmp word ptr [rdi], 0x7266
0x1458ecfcf: je 0x1458ed609
0x1458ecfd5: cmp word ptr [rdi], 0x6f72
0x1458ecfda: je 0x1458ed609
0x1458ecfe0: cmp word ptr [rdi], 0x7274
0x1458ecfe5: je 0x1458ed609
0x1458ecfeb: cmp word ptr [rdi], 0x7572
0x1458ecff0: je 0x1458ed609
0x1458ecff6: cmp word ptr [rdi], 0x6b75
0x1458ecffb: je 0x1458ed609
0x1458ed001: cmp word ptr [rdi], 0x687a
0x1458ed006: je 0x1458ed609
0x1458ed00c: cmp word ptr [rdi], 0x616a
0x1458ed011: je 0x1458ed609
0x1458ed017: cmp word ptr [rdi], 0x6f6b
0x1458ed01c: je 0x1458ed609
0x1458ed022: mov r8d, 1
0x1458ed028: mov rcx, rdi
0x1458ed02b: mov rdx, rsi
0x1458ed02e: call 0x1400021d0
0x1458ed033: lea rdx, [rip + 0x1304999]
0x1458ed03a: lea rcx, [rbp - 0x58]
0x1458ed03e: mov r8d, 6
0x1458ed044: call 0x145bbd970
0x1458ed049: mov rdx, qword ptr [rbp - 0x58]
0x1458ed04d: cmp rdx, -1
0x1458ed051: je 0x1458ed09b
0x1458ed053: cmp rdx, -2
0x1458ed057: jne 0x1458ed087
0x1458ed059: mov r12, qword ptr [rbp - 0x50]
0x1458ed05d: cmp r12, -1
0x1458ed061: je 0x1458ed09b
0x1458ed063: mov r13, qword ptr [rbp - 0x48]
0x1458ed067: mov rax, qword ptr [rbp - 0x40]
0x1458ed06b: test rax, rax
0x1458ed06e: jne 0x1458ed14e
0x1458ed074: test r12, r12
0x1458ed077: je 0x1458ed09b
0x1458ed079: mov r8d, 1
0x1458ed07f: mov rcx, r13
0x1458ed082: mov rdx, r12
0x1458ed085: jmp 0x1458ed096
0x1458ed087: test rdx, rdx
0x1458ed08a: je 0x1458ed09b
0x1458ed08c: mov rcx, qword ptr [rbp - 0x50]
0x1458ed090: mov r8d, 1
0x1458ed096: call 0x1400021d0
0x1458ed09b: lea rdx, [rip + 0x1304937]
0x1458ed0a2: lea rcx, [rbp - 0x58]
0x1458ed0a6: mov r8d, 0xb
0x1458ed0ac: call 0x145bbd970
0x1458ed0b1: mov rdx, qword ptr [rbp - 0x58]
0x1458ed0b5: cmp rdx, -2
0x1458ed0b9: je 0x1458ed0d7
0x1458ed0bb: cmp rdx, -1
0x1458ed0bf: je 0x1458ed101
0x1458ed0c1: test rdx, rdx
0x1458ed0c4: je 0x1458ed101
0x1458ed0c6: mov rcx, qword ptr [rbp - 0x50]
0x1458ed0ca: mov r8d, 1
0x1458ed0d0: call 0x1400021d0
0x1458ed0d5: jmp 0x1458ed101
0x1458ed0d7: mov r12, qword ptr [rbp - 0x50]
0x1458ed0db: cmp r12, -1
0x1458ed0df: je 0x1458ed101
0x1458ed0e1: mov r13, qword ptr [rbp - 0x48]
0x1458ed0e5: mov rax, qword ptr [rbp - 0x40]
0x1458ed0e9: test rax, rax
0x1458ed0ec: jne 0x1458ed14e
0x1458ed0ee: test r12, r12
0x1458ed0f1: je 0x1458ed101
0x1458ed0f3: mov r8d, 1
0x1458ed0f9: mov rcx, r13
0x1458ed0fc: mov rdx, r12
0x1458ed0ff: jmp 0x1458ed0d0
0x1458ed101: lea rdx, [rip + 0x13048dc]
0x1458ed108: lea rcx, [rbp - 0x58]
0x1458ed10c: mov r8d, 4
0x1458ed112: call 0x145bbd970
0x1458ed117: mov rdx, qword ptr [rbp - 0x58]
0x1458ed11b: cmp rdx, -1
0x1458ed11f: je 0x1458ed5e8
0x1458ed125: cmp rdx, -2
0x1458ed129: jne 0x1458ed251
0x1458ed12f: mov r12, qword ptr [rbp - 0x50]
0x1458ed133: cmp r12, -1
0x1458ed137: je 0x1458ed5e8
0x1458ed13d: mov r13, qword ptr [rbp - 0x48]
0x1458ed141: mov rax, qword ptr [rbp - 0x40]
0x1458ed145: test rax, rax
0x1458ed148: je 0x1458ed2d5
0x1458ed14e: lea rcx, [rax + r13]
0x1458ed152: xor r11d, r11d
0x1458ed155: movabs rdx, 0x4000000000003
0x1458ed15f: mov r10, r13
0x1458ed162: nop word ptr cs:[rax + rax]
0x1458ed170: cmp r10, rcx
0x1458ed173: je 0x1458ed285
0x1458ed179: mov r8, r10
0x1458ed17c: mov rsi, r11
0x1458ed17f: movzx r10d, byte ptr [r10]
0x1458ed183: movzx r9d, r10b
0x1458ed187: test r9b, r9b
0x1458ed18a: js 0x1458ed1a0
0x1458ed18c: lea r10, [r8 + 1]
0x1458ed190: jmp 0x1458ed210
0x1458ed192: nop word ptr cs:[rax + rax]
0x1458ed1a0: mov r11d, r9d
0x1458ed1a3: and r11d, 0x1f
0x1458ed1a7: movzx edi, byte ptr [r8 + 1]
0x1458ed1ac: and edi, 0x3f
0x1458ed1af: cmp r9b, 0xdf
0x1458ed1b3: jbe 0x1458ed1ed
0x1458ed1b5: movzx r9d, byte ptr [r8 + 2]
0x1458ed1ba: shl edi, 6
0x1458ed1bd: and r9d, 0x3f
0x1458ed1c1: or r9d, edi
0x1458ed1c4: cmp r10b, 0xf0
0x1458ed1c8: jb 0x1458ed1fd
0x1458ed1ca: lea r10, [r8 + 4]
0x1458ed1ce: movzx edi, byte ptr [r8 + 3]
0x1458ed1d3: and r11d, 7
0x1458ed1d7: shl r11d, 0x12
0x1458ed1db: shl r9d, 6
0x1458ed1df: and edi, 0x3f
0x1458ed1e2: or edi, r9d
0x1458ed1e5: or edi, r11d
0x1458ed1e8: mov r9d, edi
0x1458ed1eb: jmp 0x1458ed210
0x1458ed1ed: lea r10, [r8 + 2]
0x1458ed1f1: shl r11d, 6
0x1458ed1f5: or r11d, edi
0x1458ed1f8: mov r9d, r11d
0x1458ed1fb: jmp 0x1458ed210
0x1458ed1fd: lea r10, [r8 + 3]
0x1458ed201: shl r11d, 0xc
0x1458ed205: or r9d, r11d
0x1458ed208: nop dword ptr [rax + rax]
0x1458ed210: mov r11, rsi
0x1458ed213: sub r11, r8
0x1458ed216: add r11, r10
0x1458ed219: add r9d, -0x2d
0x1458ed21d: cmp r9d, 0x32
0x1458ed221: ja 0x1458ed170
0x1458ed227: bt rdx, r9
0x1458ed22b: jae 0x1458ed170
0x1458ed231: test rsi, rsi
0x1458ed234: jns 0x1458ed28d
0x1458ed236: xor edi, edi
0x1458ed238: mov qword ptr [rbp - 0x30], r13
0x1458ed23c: mov qword ptr [rbp - 0x38], r12
0x1458ed240: mov rcx, rdi
0x1458ed243: mov rdx, rsi
0x1458ed246: call 0x145d992bb
0x1458ed24b: nop
0x1458ed24c: jmp 0x1458ed403
0x1458ed251: test rdx, rdx
0x1458ed254: je 0x1458ed5e8
0x1458ed25a: mov rcx, qword ptr [rbp - 0x50]
0x1458ed25e: mov r8d, 1
0x1458ed264: call 0x1400021d0
0x1458ed269: jmp 0x1458ed5e8
0x1458ed26e: mov edi, 1
0x1458ed273: mov rdx, qword ptr [rbp - 0x38]
0x1458ed277: test rdx, rdx
0x1458ed27a: jne 0x1458ecf66
0x1458ed280: jmp 0x1458ecf75
0x1458ed285: mov rsi, rax
0x1458ed288: test rsi, rsi
0x1458ed28b: js 0x1458ed236
0x1458ed28d: je 0x1458ed2c9
0x1458ed28f: call 0x140002200
0x1458ed294: mov edi, 1
0x1458ed299: mov edx, 1
0x1458ed29e: mov rcx, rsi
0x1458ed2a1: call 0x1400021c0
0x1458ed2a6: test rax, rax
0x1458ed2a9: je 0x1458ed238
0x1458ed2ab: mov r14, rax
0x1458ed2ae: mov rcx, rax
0x1458ed2b1: mov rdx, r13
0x1458ed2b4: mov r8, rsi
0x1458ed2b7: call 0x145bfa0e7
0x1458ed2bc: cmp rsi, 8
0x1458ed2c0: jae 0x1458ed2ef
0x1458ed2c2: xor eax, eax
0x1458ed2c4: jmp 0x1458ed405
0x1458ed2c9: mov rbx, 0xffffffffffffffff
0x1458ed2d0: jmp 0x1458ed5a0
0x1458ed2d5: test r12, r12
0x1458ed2d8: je 0x1458ed5e8
0x1458ed2de: mov r8d, 1
0x1458ed2e4: mov rcx, r13
0x1458ed2e7: mov rdx, r12
0x1458ed2ea: jmp 0x1458ed264
0x1458ed2ef: cmp rsi, 0x20
0x1458ed2f3: jae 0x1458ed2fc
0x1458ed2f5: xor eax, eax
0x1458ed2f7: jmp 0x1458ed39a
0x1458ed2fc: movabs rax, 0x7fffffffffffffe0
0x1458ed306: and rax, rsi
0x1458ed309: xor ecx, ecx
0x1458ed30b: movdqa xmm0, xmmword ptr [rip + 0x4afead]
0x1458ed313: movdqa xmm1, xmmword ptr [rip + 0x4afeb5]
0x1458ed31b: movdqa xmm2, xmmword ptr [rip + 0x4afebd]
0x1458ed323: nop word ptr cs:[rax + rax]
0x1458ed330: movdqu xmm3, xmmword ptr [r14 + rcx]
0x1458ed336: movdqu xmm4, xmmword ptr [r14 + rcx + 0x10]
0x1458ed33d: movdqa xmm5, xmm3
0x1458ed341: paddb xmm5, xmm0
0x1458ed345: movdqa xmm6, xmm4
0x1458ed349: paddb xmm6, xmm0
0x1458ed34d: movdqa xmm7, xmm5
0x1458ed351: pminub xmm7, xmm1
0x1458ed355: pcmpeqb xmm7, xmm5
0x1458ed359: pand xmm7, xmm2
0x1458ed35d: movdqa xmm5, xmm6
0x1458ed361: pminub xmm5, xmm1
0x1458ed365: pcmpeqb xmm5, xmm6
0x1458ed369: pand xmm5, xmm2
0x1458ed36d: por xmm7, xmm3
0x1458ed371: por xmm5, xmm4
0x1458ed375: movdqu xmmword ptr [r14 + rcx], xmm7
0x1458ed37b: movdqu xmmword ptr [r14 + rcx + 0x10], xmm5
0x1458ed382: add rcx, 0x20
0x1458ed386: cmp rax, rcx
0x1458ed389: jne 0x1458ed330
0x1458ed38b: cmp rsi, rax
0x1458ed38e: je 0x1458ed424
0x1458ed394: test sil, 0x18
0x1458ed398: je 0x1458ed405
0x1458ed39a: mov rcx, rax
0x1458ed39d: movabs rax, 0x7ffffffffffffff8
0x1458ed3a7: and rax, rsi
0x1458ed3aa: movdqa xmm0, xmmword ptr [rip + 0x4afe3e]
0x1458ed3b2: movdqa xmm1, xmmword ptr [rip + 0x4afe46]
0x1458ed3ba: movdqa xmm2, xmmword ptr [rip + 0x4afe4e]
0x1458ed3c2: nop word ptr cs:[rax + rax]
0x1458ed3d0: movq xmm3, qword ptr [r14 + rcx]
0x1458ed3d6: movdqa xmm4, xmm3
0x1458ed3da: paddb xmm4, xmm0
0x1458ed3de: movdqa xmm5, xmm4
0x1458ed3e2: pmaxub xmm5, xmm1
0x1458ed3e6: pcmpeqb xmm5, xmm4
0x1458ed3ea: pandn xmm5, xmm2
0x1458ed3ee: por xmm5, xmm3
0x1458ed3f2: movq qword ptr [r14 + rcx], xmm5
0x1458ed3f8: add rcx, 8
0x1458ed3fc: cmp rax, rcx
0x1458ed3ff: jne 0x1458ed3d0
0x1458ed401: jmp 0x1458ed41f
0x1458ed403: ud2
0x1458ed405: movzx ecx, byte ptr [r14 + rax]
0x1458ed40a: lea edx, [rcx - 0x41]
0x1458ed40d: cmp dl, 0x1a
0x1458ed410: setb dl
0x1458ed413: shl dl, 5
0x1458ed416: or dl, cl
0x1458ed418: mov byte ptr [r14 + rax], dl
0x1458ed41c: inc rax
0x1458ed41f: cmp rsi, rax
0x1458ed422: jne 0x1458ed405
0x1458ed424: mov rbx, 0xffffffffffffffff
0x1458ed42b: cmp rsi, 2
0x1458ed42f: jne 0x1458ed4a1
0x1458ed431: cmp word ptr [r14], 0x6e65
0x1458ed437: je 0x1458ed4a6
0x1458ed439: cmp word ptr [r14], 0x6c70
0x1458ed43f: je 0x1458ed4af
0x1458ed441: cmp word ptr [r14], 0x7363
0x1458ed447: je 0x1458ed4b8
0x1458ed449: cmp word ptr [r14], 0x6564
0x1458ed44f: je 0x1458ed4c1
0x1458ed451: cmp word ptr [r14], 0x7470
0x1458ed457: je 0x1458ed4ca
0x1458ed459: cmp word ptr [r14], 0x7365
0x1458ed45f: je 0x1458ed4d3
0x1458ed461: cmp word ptr [r14], 0x7266
0x1458ed467: je 0x1458ed4dc
0x1458ed469: cmp word ptr [r14], 0x6f72
0x1458ed46f: je 0x1458ed4e5
0x1458ed471: cmp word ptr [r14], 0x7274
0x1458ed477: je 0x1458ed4ee
0x1458ed479: cmp word ptr [r14], 0x7572
0x1458ed47f: je 0x1458ed4f7
0x1458ed481: cmp word ptr [r14], 0x6b75
0x1458ed487: je 0x1458ed500
0x1458ed489: cmp word ptr [r14], 0x687a
0x1458ed48f: je 0x1458ed509
0x1458ed491: cmp word ptr [r14], 0x616a
0x1458ed497: je 0x1458ed512
0x1458ed499: cmp word ptr [r14], 0x6f6b
0x1458ed49f: je 0x1458ed51b
0x1458ed4a1: jmp 0x1458ed58f
0x1458ed4a6: lea rax, [rip + 0x15e22ab]
0x1458ed4ad: jmp 0x1458ed522
0x1458ed4af: lea rax, [rip + 0x15e22da]
0x1458ed4b6: jmp 0x1458ed522
0x1458ed4b8: lea rax, [rip + 0x15e2309]
0x1458ed4bf: jmp 0x1458ed522
0x1458ed4c1: lea rax, [rip + 0x15e2338]
0x1458ed4c8: jmp 0x1458ed522
0x1458ed4ca: lea rax, [rip + 0x15e2367]
0x1458ed4d1: jmp 0x1458ed522
0x1458ed4d3: lea rax, [rip + 0x15e2396]
0x1458ed4da: jmp 0x1458ed522
0x1458ed4dc: lea rax, [rip + 0x15e23c5]
0x1458ed4e3: jmp 0x1458ed522
0x1458ed4e5: lea rax, [rip + 0x15e23f4]
0x1458ed4ec: jmp 0x1458ed522
0x1458ed4ee: lea rax, [rip + 0x15e2423]
0x1458ed4f5: jmp 0x1458ed522
0x1458ed4f7: lea rax, [rip + 0x15e2452]
0x1458ed4fe: jmp 0x1458ed522
0x1458ed500: lea rax, [rip + 0x15e2481]
0x1458ed507: jmp 0x1458ed522
0x1458ed509: lea rax, [rip + 0x15e24b0]
0x1458ed510: jmp 0x1458ed522
0x1458ed512: lea rax, [rip + 0x15e24df]
0x1458ed519: jmp 0x1458ed522
0x1458ed51b: lea rax, [rip + 0x15e250e]
0x1458ed522: mov rbx, qword ptr [rax + 8]
0x1458ed526: test rbx, rbx
0x1458ed529: jns 0x1458ed54b
0x1458ed52b: mov qword ptr [rbp - 0x60], r14
0x1458ed52f: xor r15d, r15d
0x1458ed532: mov qword ptr [rbp - 0x30], r13
0x1458ed536: mov qword ptr [rbp - 0x38], r12
0x1458ed53a: mov rcx, r15
0x1458ed53d: mov rdx, rbx
0x1458ed540: call 0x145d992bb
0x1458ed545: nop
0x1458ed546: jmp 0x1458ed403
0x1458ed54b: je 0x1458ed588
0x1458ed54d: mov qword ptr [rbp - 0x60], r14
0x1458ed551: mov r14, qword ptr [rax]
0x1458ed554: call 0x140002200
0x1458ed559: mov r15d, 1
0x1458ed55f: mov edx, 1
0x1458ed564: mov rcx, rbx
0x1458ed567: call 0x1400021c0
0x1458ed56c: test rax, rax
0x1458ed56f: je 0x1458ed532
0x1458ed571: mov rdi, rax
0x1458ed574: mov rcx, rax
0x1458ed577: mov rdx, r14
0x1458ed57a: mov r8, rbx
0x1458ed57d: call 0x145bfa0e7
0x1458ed582: mov r14, qword ptr [rbp - 0x60]
0x1458ed586: jmp 0x1458ed58f
0x1458ed588: mov edi, 1
0x1458ed58d: xor ebx, ebx
0x1458ed58f: mov r8d, 1
0x1458ed595: mov rcx, r14
0x1458ed598: mov rdx, rsi
0x1458ed59b: call 0x1400021d0
0x1458ed5a0: test r12, r12
0x1458ed5a3: je 0x1458ed5b6
0x1458ed5a5: mov r8d, 1
0x1458ed5ab: mov rcx, r13
0x1458ed5ae: mov rdx, r12
0x1458ed5b1: call 0x1400021d0
0x1458ed5b6: cmp rbx, -1
0x1458ed5ba: je 0x1458ed5e8
0x1458ed5bc: mov rcx, rdi
0x1458ed5bf: mov rdx, rbx
0x1458ed5c2: call 0x1458ec750
0x1458ed5c7: test rbx, rbx
0x1458ed5ca: jne 0x1458ed61b
0x1458ed5cc: movaps xmm6, xmmword ptr [rbp - 0x20]
0x1458ed5d0: movaps xmm7, xmmword ptr [rbp - 0x10]
0x1458ed5d4: add rsp, 0x88
0x1458ed5db: pop rbx
0x1458ed5dc: pop rdi
0x1458ed5dd: pop rsi
0x1458ed5de: pop r12
0x1458ed5e0: pop r13
0x1458ed5e2: pop r14
0x1458ed5e4: pop r15
0x1458ed5e6: pop rbp
0x1458ed5e7: ret
0x1458ed5e8: call 0x140002200
0x1458ed5ed: mov ecx, 2
0x1458ed5f2: mov edx, 1
0x1458ed5f7: call 0x1400021c0
0x1458ed5fc: test rax, rax
0x1458ed5ff: je 0x1458ed647
0x1458ed601: mov rdi, rax
0x1458ed604: mov word ptr [rax], 0x6e65
0x1458ed609: mov ebx, 2
0x1458ed60e: mov edx, 2
0x1458ed613: mov rcx, rdi
0x1458ed616: call 0x1458ec750
0x1458ed61b: mov r8d, 1
0x1458ed621: mov rcx, rdi
0x1458ed624: mov rdx, rbx
0x1458ed627: movaps xmm6, xmmword ptr [rbp - 0x20]
0x1458ed62b: movaps xmm7, xmmword ptr [rbp - 0x10]
0x1458ed62f: add rsp, 0x88
0x1458ed636: pop rbx
0x1458ed637: pop rdi
0x1458ed638: pop rsi
0x1458ed639: pop r12
0x1458ed63b: pop r13
0x1458ed63d: pop r14
0x1458ed63f: pop r15
0x1458ed641: pop rbp
0x1458ed642: jmp 0x1400021d0
0x1458ed647: mov ecx, 1
0x1458ed64c: mov edx, 2
0x1458ed651: call 0x145d992bb
0x1458ed656: ud2

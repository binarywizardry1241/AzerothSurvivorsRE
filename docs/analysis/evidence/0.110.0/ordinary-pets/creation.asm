145929010: 55 push rbp
145929011: 4157 push r15
145929013: 4156 push r14
145929015: 4154 push r12
145929017: 56 push rsi
145929018: 57 push rdi
145929019: 53 push rbx
14592901a: 4881ec40010000 sub rsp, 0x140
145929021: 488dac2480000000 lea rbp, [rsp + 0x80]
145929029: 440f2995b0000000 movaps xmmword ptr [rbp + 0xb0], xmm10
145929031: 440f298da0000000 movaps xmmword ptr [rbp + 0xa0], xmm9
145929039: 440f298590000000 movaps xmmword ptr [rbp + 0x90], xmm8
145929041: 0f29bd80000000 movaps xmmword ptr [rbp + 0x80], xmm7
145929048: 0f297570 movaps xmmword ptr [rbp + 0x70], xmm6
14592904c: 48c74568feffffff mov qword ptr [rbp + 0x68], 0xfffffffffffffffe
145929054: 4c89cb mov rbx, r9
145929057: 0f28f2 movaps xmm6, xmm2
14592905a: 4889d7 mov rdi, rdx
14592905d: 4889ce mov rsi, rcx
145929060: 4c8bb520010000 mov r14, qword ptr [rbp + 0x120]
145929067: f3440f1091e4040000 movss xmm10, dword ptr [rcx + 0x4e4]
145929070: 0f28fa movaps xmm7, xmm2
145929073: f3410f58fa addss xmm7, xmm10
145929078: 0f28c7 movaps xmm0, xmm7
14592907b: e857c12d00 call 0x145c051d7
145929080: 440f28c0 movaps xmm8, xmm0
145929084: 0f28c7 movaps xmm0, xmm7
145929087: e845c12d00 call 0x145c051d1
14592908c: f20f108ed8040000 movsd xmm1, qword ptr [rsi + 0x4d8]
145929094: 440f14c0 unpcklps xmm8, xmm0
145929098: 440f5905f0ad2d01 mulps xmm8, xmmword ptr [rip + 0x12dadf0]
1459290a0: 440f58c1 addps xmm8, xmm1
1459290a4: f3410f7e4604 movq xmm0, qword ptr [r14 + 4]
1459290aa: 66410f6e0e movd xmm1, dword ptr [r14]
1459290af: 660f70f900 pshufd xmm7, xmm1, 0
1459290b4: 660f72f71f pslld xmm7, 0x1f
1459290b9: 660f72e71f psrad xmm7, 0x1f
1459290be: 660fdbc7 pand xmm0, xmm7
1459290c2: 66410fdff8 pandn xmm7, xmm8
1459290c7: 660febf8 por xmm7, xmm0
1459290cb: 66440f70cff5 pshufd xmm9, xmm7, 0xf5
1459290d1: 4c8bb6b8090000 mov r14, qword ptr [rsi + 0x9b8]
1459290d8: 498d4e10 lea rcx, [r14 + 0x10]
1459290dc: 660f6fcf movdqa xmm1, xmm7
1459290e0: 66410f6fd1 movdqa xmm2, xmm9
1459290e5: e8562ef7ff call 0x14589bf40
1459290ea: a801 test al, 1
1459290ec: 7407 je 0x1459290f5
1459290ee: 66440f6fc0 movdqa xmm8, xmm0
1459290f3: eb34 jmp 0x145929129
1459290f5: 49837e68ff cmp qword ptr [r14 + 0x68], -1
1459290fa: 7424 je 0x145929120
1459290fc: 498d5668 lea rdx, [r14 + 0x68]
145929100: 488d4d30 lea rcx, [rbp + 0x30]
145929104: 660f6fd7 movdqa xmm2, xmm7
145929108: 66410f6fd9 movdqa xmm3, xmm9
14592910d: e83e73f7ff call 0x1458a0450
145929112: 837d3001 cmp dword ptr [rbp + 0x30], 1
145929116: 7508 jne 0x145929120
145929118: 66440f6e453c movd xmm8, dword ptr [rbp + 0x3c]
14592911e: eb09 jmp 0x145929129
145929120: 66450f6e86b8000000 movd xmm8, dword ptr [r14 + 0xb8]
145929129: 448b6720 mov r12d, dword ptr [rdi + 0x20]
14592912d: 8b86800a0000 mov eax, dword ptr [rsi + 0xa80]
145929133: ffc0 inc eax
145929135: 8986800a0000 mov dword ptr [rsi + 0xa80], eax
14592913b: 4489e1 mov ecx, r12d
14592913e: 81e1ffffff00 and ecx, 0xffffff
145929144: 48c1e118 shl rcx, 0x18
145929148: 25ffffff00 and eax, 0xffffff
14592914d: 4809c8 or rax, rcx
145929150: 49be00000000000030f1 movabs r14, 0xf130000000000000
14592915a: 4909c6 or r14, rax
14592915d: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
145929165: 48c7452800000000 mov qword ptr [rbp + 0x28], 0
14592916d: 4c8d7d18 lea r15, [rbp + 0x18]
145929171: 4c89f9 mov rcx, r15
145929174: 31d2 xor edx, edx
145929176: 4d89f0 mov r8, r14
145929179: e8c23af9ff call 0x1458bcc40
14592917e: 90 nop
14592917f: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929183: 4885c0 test rax, rax
145929186: 7473 je 0x1459291fb
145929188: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592918c: 66ba0200 mov dx, 2
145929190: 440fb74836 movzx r9d, word ptr [rax + 0x36]
145929195: 4589ca mov r10d, r9d
145929198: 4501d2 add r10d, r10d
14592919b: 49c7c0ffffffff mov r8, 0xffffffffffffffff
1459291a2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459291b0: 4d85d2 test r10, r10
1459291b3: 742b je 0x1459291e0
1459291b5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
1459291bb: 410f97c3 seta r11b
1459291bf: 4180db00 sbb r11b, 0
1459291c3: 49ffc0 inc r8
1459291c6: 4983c2fe add r10, -2
1459291ca: 4180fb01 cmp r11b, 1
1459291ce: 74e0 je 0x1459291b0
1459291d0: 450fb6cb movzx r9d, r11b
1459291d4: 4585c9 test r9d, r9d
1459291d7: 750a jne 0x1459291e3
1459291d9: eb15 jmp 0x1459291f0
1459291db: 0f1f440000 nop dword ptr [rax + rax]
1459291e0: 4d89c8 mov r8, r9
1459291e3: 4883e901 sub rcx, 1
1459291e7: 7214 jb 0x1459291fd
1459291e9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
1459291ee: eba0 jmp 0x145929190
1459291f0: 42c744800809000000 mov dword ptr [rax + r8*4 + 8], 9
1459291f9: eb32 jmp 0x14592922d
1459291fb: 31c0 xor eax, eax
1459291fd: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929201: 48894538 mov qword ptr [rbp + 0x38], rax
145929205: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14592920d: 4c894548 mov qword ptr [rbp + 0x48], r8
145929211: 48c7455002000000 mov qword ptr [rbp + 0x50], 2
145929219: 488d4df8 lea rcx, [rbp - 8]
14592921d: 488d5530 lea rdx, [rbp + 0x30]
145929221: 41b809000000 mov r8d, 9
145929227: e85402fbff call 0x1458d9480
14592922c: 90 nop
14592922d: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929231: 4885c0 test rax, rax
145929234: 7461 je 0x145929297
145929236: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592923a: 66ba0300 mov dx, 3
14592923e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
145929243: 4589ca mov r10d, r9d
145929246: 4501d2 add r10d, r10d
145929249: 49c7c0ffffffff mov r8, 0xffffffffffffffff
145929250: 4d85d2 test r10, r10
145929253: 742b je 0x145929280
145929255: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592925b: 410f97c3 seta r11b
14592925f: 4180db00 sbb r11b, 0
145929263: 49ffc0 inc r8
145929266: 4983c2fe add r10, -2
14592926a: 4180fb01 cmp r11b, 1
14592926e: 74e0 je 0x145929250
145929270: 450fb6cb movzx r9d, r11b
145929274: 4585c9 test r9d, r9d
145929277: 750a jne 0x145929283
145929279: eb15 jmp 0x145929290
14592927b: 0f1f440000 nop dword ptr [rax + rax]
145929280: 4d89c8 mov r8, r9
145929283: 4883e901 sub rcx, 1
145929287: 7210 jb 0x145929299
145929289: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592928e: ebae jmp 0x14592923e
145929290: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
145929295: eb2f jmp 0x1459292c6
145929297: 31c0 xor eax, eax
145929299: 4c897d30 mov qword ptr [rbp + 0x30], r15
14592929d: 48894538 mov qword ptr [rbp + 0x38], rax
1459292a1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1459292a9: 4c894548 mov qword ptr [rbp + 0x48], r8
1459292ad: 48c7455003000000 mov qword ptr [rbp + 0x50], 3
1459292b5: 488d4df8 lea rcx, [rbp - 8]
1459292b9: 488d5530 lea rdx, [rbp + 0x30]
1459292bd: 4589e0 mov r8d, r12d
1459292c0: e8bb01fbff call 0x1458d9480
1459292c5: 90 nop
1459292c6: f3440f104f28 movss xmm9, dword ptr [rdi + 0x28]
1459292cc: 0fb64739 movzx eax, byte ptr [rdi + 0x39]
1459292d0: fec8 dec al
1459292d2: 3c07 cmp al, 7
1459292d4: 0f878f000000 ja 0x145929369
1459292da: 0fb6c0 movzx eax, al
1459292dd: 488d0ddcdd2d01 lea rcx, [rip + 0x12ddddc]
1459292e4: f30f100481 movss xmm0, dword ptr [rcx + rax*4]
1459292e9: f3410f59c1 mulss xmm0, xmm9
1459292ee: 488b4518 mov rax, qword ptr [rbp + 0x18]
1459292f2: 4885c0 test rax, rax
1459292f5: 0f8488000000 je 0x145929383
1459292fb: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
1459292ff: 66ba0400 mov dx, 4
145929303: 440fb74036 movzx r8d, word ptr [rax + 0x36]
145929308: 4589c2 mov r10d, r8d
14592930b: 4501d2 add r10d, r10d
14592930e: 49c7c1ffffffff mov r9, 0xffffffffffffffff
145929315: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145929320: 4d85d2 test r10, r10
145929323: 742b je 0x145929350
145929325: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592932b: 410f97c3 seta r11b
14592932f: 4180db00 sbb r11b, 0
145929333: 49ffc1 inc r9
145929336: 4983c2fe add r10, -2
14592933a: 4180fb01 cmp r11b, 1
14592933e: 74e0 je 0x145929320
145929340: 450fb6c3 movzx r8d, r11b
145929344: 4585c0 test r8d, r8d
145929347: 750a jne 0x145929353
145929349: eb15 jmp 0x145929360
14592934b: 0f1f440000 nop dword ptr [rax + rax]
145929350: 4d89c1 mov r9, r8
145929353: 4883e901 sub rcx, 1
145929357: 722c jb 0x145929385
145929359: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592935e: eba3 jmp 0x145929303
145929360: f3420f11448808 movss dword ptr [rax + r9*4 + 8], xmm0
145929367: eb4b jmp 0x1459293b4
145929369: f30f1005ffee4700 movss xmm0, dword ptr [rip + 0x47eeff]
145929371: f3410f59c1 mulss xmm0, xmm9
145929376: 488b4518 mov rax, qword ptr [rbp + 0x18]
14592937a: 4885c0 test rax, rax
14592937d: 0f8578ffffff jne 0x1459292fb
145929383: 31c0 xor eax, eax
145929385: 66410f7ec0 movd r8d, xmm0
14592938a: 4c897d30 mov qword ptr [rbp + 0x30], r15
14592938e: 48894538 mov qword ptr [rbp + 0x38], rax
145929392: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14592939a: 4c894d48 mov qword ptr [rbp + 0x48], r9
14592939e: 48c7455004000000 mov qword ptr [rbp + 0x50], 4
1459293a6: 488d4df8 lea rcx, [rbp - 8]
1459293aa: 488d5530 lea rdx, [rbp + 0x30]
1459293ae: e8cd00fbff call 0x1458d9480
1459293b3: 90 nop
1459293b4: 488b4518 mov rax, qword ptr [rbp + 0x18]
1459293b8: 4885c0 test rax, rax
1459293bb: 746e je 0x14592942b
1459293bd: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
1459293c1: 66ba1600 mov dx, 0x16
1459293c5: 440fb74836 movzx r9d, word ptr [rax + 0x36]
1459293ca: 4589ca mov r10d, r9d
1459293cd: 4501d2 add r10d, r10d
1459293d0: 49c7c0ffffffff mov r8, 0xffffffffffffffff
1459293d7: 660f1f840000000000 nop word ptr [rax + rax]
1459293e0: 4d85d2 test r10, r10
1459293e3: 742b je 0x145929410
1459293e5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
1459293eb: 410f97c3 seta r11b
1459293ef: 4180db00 sbb r11b, 0
1459293f3: 49ffc0 inc r8
1459293f6: 4983c2fe add r10, -2
1459293fa: 4180fb01 cmp r11b, 1
1459293fe: 74e0 je 0x1459293e0
145929400: 450fb6cb movzx r9d, r11b
145929404: 4585c9 test r9d, r9d
145929407: 750a jne 0x145929413
145929409: eb15 jmp 0x145929420
14592940b: 0f1f440000 nop dword ptr [rax + rax]
145929410: 4d89c8 mov r8, r9
145929413: 4883e901 sub rcx, 1
145929417: 7214 jb 0x14592942d
145929419: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592941e: eba5 jmp 0x1459293c5
145929420: 42c744800864000000 mov dword ptr [rax + r8*4 + 8], 0x64
145929429: eb32 jmp 0x14592945d
14592942b: 31c0 xor eax, eax
14592942d: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929431: 48894538 mov qword ptr [rbp + 0x38], rax
145929435: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14592943d: 4c894548 mov qword ptr [rbp + 0x48], r8
145929441: 48c7455016000000 mov qword ptr [rbp + 0x50], 0x16
145929449: 488d4df8 lea rcx, [rbp - 8]
14592944d: 488d5530 lea rdx, [rbp + 0x30]
145929451: 41b864000000 mov r8d, 0x64
145929457: e82400fbff call 0x1458d9480
14592945c: 90 nop
14592945d: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929461: 4885c0 test rax, rax
145929464: 7465 je 0x1459294cb
145929466: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592946a: 66ba1c00 mov dx, 0x1c
14592946e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
145929473: 4589ca mov r10d, r9d
145929476: 4501d2 add r10d, r10d
145929479: 49c7c0ffffffff mov r8, 0xffffffffffffffff
145929480: 4d85d2 test r10, r10
145929483: 742b je 0x1459294b0
145929485: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592948b: 410f97c3 seta r11b
14592948f: 4180db00 sbb r11b, 0
145929493: 49ffc0 inc r8
145929496: 4983c2fe add r10, -2
14592949a: 4180fb01 cmp r11b, 1
14592949e: 74e0 je 0x145929480
1459294a0: 450fb6cb movzx r9d, r11b
1459294a4: 4585c9 test r9d, r9d
1459294a7: 750a jne 0x1459294b3
1459294a9: eb15 jmp 0x1459294c0
1459294ab: 0f1f440000 nop dword ptr [rax + rax]
1459294b0: 4d89c8 mov r8, r9
1459294b3: 4883e901 sub rcx, 1
1459294b7: 7214 jb 0x1459294cd
1459294b9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
1459294be: ebae jmp 0x14592946e
1459294c0: 42c744800864000000 mov dword ptr [rax + r8*4 + 8], 0x64
1459294c9: eb32 jmp 0x1459294fd
1459294cb: 31c0 xor eax, eax
1459294cd: 4c897d30 mov qword ptr [rbp + 0x30], r15
1459294d1: 48894538 mov qword ptr [rbp + 0x38], rax
1459294d5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1459294dd: 4c894548 mov qword ptr [rbp + 0x48], r8
1459294e1: 48c745501c000000 mov qword ptr [rbp + 0x50], 0x1c
1459294e9: 488d4df8 lea rcx, [rbp - 8]
1459294ed: 488d5530 lea rdx, [rbp + 0x30]
1459294f1: 41b864000000 mov r8d, 0x64
1459294f7: e884fffaff call 0x1458d9480
1459294fc: 90 nop
1459294fd: 448b86e8040000 mov r8d, dword ptr [rsi + 0x4e8]
145929504: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929508: 4885c0 test rax, rax
14592950b: 746a je 0x145929577
14592950d: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
145929511: 66ba2200 mov dx, 0x22
145929515: 440fb75036 movzx r10d, word ptr [rax + 0x36]
14592951a: 4589d3 mov r11d, r10d
14592951d: 4501db add r11d, r11d
145929520: 49c7c1ffffffff mov r9, 0xffffffffffffffff
145929527: 660f1f840000000000 nop word ptr [rax + rax]
145929530: 4d85db test r11, r11
145929533: 742b je 0x145929560
145929535: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592953b: 410f97c4 seta r12b
14592953f: 4180dc00 sbb r12b, 0
145929543: 49ffc1 inc r9
145929546: 4983c3fe add r11, -2
14592954a: 4180fc01 cmp r12b, 1
14592954e: 74e0 je 0x145929530
145929550: 450fb6d4 movzx r10d, r12b
145929554: 4585d2 test r10d, r10d
145929557: 750a jne 0x145929563
145929559: eb15 jmp 0x145929570
14592955b: 0f1f440000 nop dword ptr [rax + rax]
145929560: 4d89d1 mov r9, r10
145929563: 4883e901 sub rcx, 1
145929567: 7210 jb 0x145929579
145929569: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592956e: eba5 jmp 0x145929515
145929570: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
145929575: eb2c jmp 0x1459295a3
145929577: 31c0 xor eax, eax
145929579: 4c897d30 mov qword ptr [rbp + 0x30], r15
14592957d: 48894538 mov qword ptr [rbp + 0x38], rax
145929581: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
145929589: 4c894d48 mov qword ptr [rbp + 0x48], r9
14592958d: 48c7455022000000 mov qword ptr [rbp + 0x50], 0x22
145929595: 488d4df8 lea rcx, [rbp - 8]
145929599: 488d5530 lea rdx, [rbp + 0x30]
14592959d: e8defefaff call 0x1458d9480
1459295a2: 90 nop
1459295a3: 0fb6861d030000 movzx eax, byte ptr [rsi + 0x31d]
1459295aa: 04fe add al, 0xfe
1459295ac: 41b801000000 mov r8d, 1
1459295b2: 3c06 cmp al, 6
1459295b4: 770e ja 0x1459295c4
1459295b6: 0fb6c0 movzx eax, al
1459295b9: 488d0d20db2d01 lea rcx, [rip + 0x12ddb20]
1459295c0: 448b0481 mov r8d, dword ptr [rcx + rax*4]
1459295c4: 488b4518 mov rax, qword ptr [rbp + 0x18]
1459295c8: 4885c0 test rax, rax
1459295cb: 746a je 0x145929637
1459295cd: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
1459295d1: 66ba2300 mov dx, 0x23
1459295d5: 440fb75036 movzx r10d, word ptr [rax + 0x36]
1459295da: 4589d3 mov r11d, r10d
1459295dd: 4501db add r11d, r11d
1459295e0: 49c7c1ffffffff mov r9, 0xffffffffffffffff
1459295e7: 660f1f840000000000 nop word ptr [rax + rax]
1459295f0: 4d85db test r11, r11
1459295f3: 742b je 0x145929620
1459295f5: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
1459295fb: 410f97c4 seta r12b
1459295ff: 4180dc00 sbb r12b, 0
145929603: 49ffc1 inc r9
145929606: 4983c3fe add r11, -2
14592960a: 4180fc01 cmp r12b, 1
14592960e: 74e0 je 0x1459295f0
145929610: 450fb6d4 movzx r10d, r12b
145929614: 4585d2 test r10d, r10d
145929617: 750a jne 0x145929623
145929619: eb15 jmp 0x145929630
14592961b: 0f1f440000 nop dword ptr [rax + rax]
145929620: 4d89d1 mov r9, r10
145929623: 4883e901 sub rcx, 1
145929627: 7210 jb 0x145929639
145929629: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592962e: eba5 jmp 0x1459295d5
145929630: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
145929635: eb2c jmp 0x145929663
145929637: 31c0 xor eax, eax
145929639: 4c897d30 mov qword ptr [rbp + 0x30], r15
14592963d: 48894538 mov qword ptr [rbp + 0x38], rax
145929641: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
145929649: 4c894d48 mov qword ptr [rbp + 0x48], r9
14592964d: 48c7455023000000 mov qword ptr [rbp + 0x50], 0x23
145929655: 488d4df8 lea rcx, [rbp - 8]
145929659: 488d5530 lea rdx, [rbp + 0x30]
14592965d: e81efefaff call 0x1458d9480
145929662: 90 nop
145929663: 4c8ba670040000 mov r12, qword ptr [rsi + 0x470]
14592966a: 488d4d18 lea rcx, [rbp + 0x18]
14592966e: 66ba0c00 mov dx, 0xc
145929672: 4d89e0 mov r8, r12
145929675: e8c635f9ff call 0x1458bcc40
14592967a: 90 nop
14592967b: 4c8d7d18 lea r15, [rbp + 0x18]
14592967f: 4c89f9 mov rcx, r15
145929682: 66ba0e00 mov dx, 0xe
145929686: 4d89e0 mov r8, r12
145929689: e8b235f9ff call 0x1458bcc40
14592968e: 90 nop
14592968f: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929693: 4885c0 test rax, rax
145929696: 7473 je 0x14592970b
145929698: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592969c: 66ba2e00 mov dx, 0x2e
1459296a0: 440fb74836 movzx r9d, word ptr [rax + 0x36]
1459296a5: 4589ca mov r10d, r9d
1459296a8: 4501d2 add r10d, r10d
1459296ab: 49c7c0ffffffff mov r8, 0xffffffffffffffff
1459296b2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459296c0: 4d85d2 test r10, r10
1459296c3: 742b je 0x1459296f0
1459296c5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
1459296cb: 410f97c3 seta r11b
1459296cf: 4180db00 sbb r11b, 0
1459296d3: 49ffc0 inc r8
1459296d6: 4983c2fe add r10, -2
1459296da: 4180fb01 cmp r11b, 1
1459296de: 74e0 je 0x1459296c0
1459296e0: 450fb6cb movzx r9d, r11b
1459296e4: 4585c9 test r9d, r9d
1459296e7: 750a jne 0x1459296f3
1459296e9: eb15 jmp 0x145929700
1459296eb: 0f1f440000 nop dword ptr [rax + rax]
1459296f0: 4d89c8 mov r8, r9
1459296f3: 4883e901 sub rcx, 1
1459296f7: 7214 jb 0x14592970d
1459296f9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
1459296fe: eba0 jmp 0x1459296a0
145929700: 42c744800802000000 mov dword ptr [rax + r8*4 + 8], 2
145929709: eb32 jmp 0x14592973d
14592970b: 31c0 xor eax, eax
14592970d: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929711: 48894538 mov qword ptr [rbp + 0x38], rax
145929715: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14592971d: 4c894548 mov qword ptr [rbp + 0x48], r8
145929721: 48c745502e000000 mov qword ptr [rbp + 0x50], 0x2e
145929729: 488d4df8 lea rcx, [rbp - 8]
14592972d: 488d5530 lea rdx, [rbp + 0x30]
145929731: 41b802000000 mov r8d, 2
145929737: e844fdfaff call 0x1458d9480
14592973c: 90 nop
14592973d: f30f104730 movss xmm0, dword ptr [rdi + 0x30]
145929742: f30f5905cea14800 mulss xmm0, dword ptr [rip + 0x48a1ce]
14592974a: f3480f2cc0 cvttss2si rax, xmm0
14592974f: 31c9 xor ecx, ecx
145929751: 660fefc9 pxor xmm1, xmm1
145929755: 0f2ec1 ucomiss xmm0, xmm1
145929758: 0f42c1 cmovb eax, ecx
14592975b: 0f2e0502844800 ucomiss xmm0, dword ptr [rip + 0x488402]
145929762: 41b8ffffffff mov r8d, 0xffffffff
145929768: 440f46c0 cmovbe r8d, eax
14592976c: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929770: 4885c0 test rax, rax
145929773: 7462 je 0x1459297d7
145929775: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
145929779: 66ba7e00 mov dx, 0x7e
14592977d: 440fb75036 movzx r10d, word ptr [rax + 0x36]
145929782: 4589d3 mov r11d, r10d
145929785: 4501db add r11d, r11d
145929788: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14592978f: 90 nop
145929790: 4d85db test r11, r11
145929793: 742b je 0x1459297c0
145929795: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592979b: 410f97c4 seta r12b
14592979f: 4180dc00 sbb r12b, 0
1459297a3: 49ffc1 inc r9
1459297a6: 4983c3fe add r11, -2
1459297aa: 4180fc01 cmp r12b, 1
1459297ae: 74e0 je 0x145929790
1459297b0: 450fb6d4 movzx r10d, r12b
1459297b4: 4585d2 test r10d, r10d
1459297b7: 750a jne 0x1459297c3
1459297b9: eb15 jmp 0x1459297d0
1459297bb: 0f1f440000 nop dword ptr [rax + rax]
1459297c0: 4d89d1 mov r9, r10
1459297c3: 4883e901 sub rcx, 1
1459297c7: 7210 jb 0x1459297d9
1459297c9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
1459297ce: ebad jmp 0x14592977d
1459297d0: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
1459297d5: eb2c jmp 0x145929803
1459297d7: 31c0 xor eax, eax
1459297d9: 4c897d30 mov qword ptr [rbp + 0x30], r15
1459297dd: 48894538 mov qword ptr [rbp + 0x38], rax
1459297e1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1459297e9: 4c894d48 mov qword ptr [rbp + 0x48], r9
1459297ed: 48c745507e000000 mov qword ptr [rbp + 0x50], 0x7e
1459297f5: 488d4df8 lea rcx, [rbp - 8]
1459297f9: 488d5530 lea rdx, [rbp + 0x30]
1459297fd: e87efcfaff call 0x1458d9480
145929802: 90 nop
145929803: f30f100569ea4700 movss xmm0, dword ptr [rip + 0x47ea69]
14592980b: f3410f59c1 mulss xmm0, xmm9
145929810: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929814: 4885c0 test rax, rax
145929817: 7470 je 0x145929889
145929819: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592981d: ba81000000 mov edx, 0x81
145929822: 440fb74036 movzx r8d, word ptr [rax + 0x36]
145929827: 4589c2 mov r10d, r8d
14592982a: 4501d2 add r10d, r10d
14592982d: 49c7c1ffffffff mov r9, 0xffffffffffffffff
145929834: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145929840: 4d85d2 test r10, r10
145929843: 742b je 0x145929870
145929845: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
14592984b: 4439da cmp edx, r11d
14592984e: 410f97c3 seta r11b
145929852: 4180db00 sbb r11b, 0
145929856: 49ffc1 inc r9
145929859: 4983c2fe add r10, -2
14592985d: 4180fb01 cmp r11b, 1
145929861: 74dd je 0x145929840
145929863: 450fb6c3 movzx r8d, r11b
145929867: 4585c0 test r8d, r8d
14592986a: 7507 jne 0x145929873
14592986c: eb12 jmp 0x145929880
14592986e: 6690 nop
145929870: 4d89c1 mov r9, r8
145929873: 4883e901 sub rcx, 1
145929877: 7212 jb 0x14592988b
145929879: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592987e: eba2 jmp 0x145929822
145929880: f3420f11448808 movss dword ptr [rax + r9*4 + 8], xmm0
145929887: eb31 jmp 0x1459298ba
145929889: 31c0 xor eax, eax
14592988b: 66410f7ec0 movd r8d, xmm0
145929890: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929894: 48894538 mov qword ptr [rbp + 0x38], rax
145929898: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1459298a0: 4c894d48 mov qword ptr [rbp + 0x48], r9
1459298a4: 48c7455081000000 mov qword ptr [rbp + 0x50], 0x81
1459298ac: 488d4df8 lea rcx, [rbp - 8]
1459298b0: 488d5530 lea rdx, [rbp + 0x30]
1459298b4: e8c7fbfaff call 0x1458d9480
1459298b9: 90 nop
1459298ba: f3440f590d95cc4800 mulss xmm9, dword ptr [rip + 0x48cc95]
1459298c3: 488b4518 mov rax, qword ptr [rbp + 0x18]
1459298c7: 4885c0 test rax, rax
1459298ca: 746d je 0x145929939
1459298cc: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
1459298d0: ba82000000 mov edx, 0x82
1459298d5: 440fb74036 movzx r8d, word ptr [rax + 0x36]
1459298da: 4589c2 mov r10d, r8d
1459298dd: 4501d2 add r10d, r10d
1459298e0: 49c7c1ffffffff mov r9, 0xffffffffffffffff
1459298e7: 660f1f840000000000 nop word ptr [rax + rax]
1459298f0: 4d85d2 test r10, r10
1459298f3: 742b je 0x145929920
1459298f5: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
1459298fb: 4439da cmp edx, r11d
1459298fe: 410f97c3 seta r11b
145929902: 4180db00 sbb r11b, 0
145929906: 49ffc1 inc r9
145929909: 4983c2fe add r10, -2
14592990d: 4180fb01 cmp r11b, 1
145929911: 74dd je 0x1459298f0
145929913: 450fb6c3 movzx r8d, r11b
145929917: 4585c0 test r8d, r8d
14592991a: 7507 jne 0x145929923
14592991c: eb12 jmp 0x145929930
14592991e: 6690 nop
145929920: 4d89c1 mov r9, r8
145929923: 4883e901 sub rcx, 1
145929927: 7212 jb 0x14592993b
145929929: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592992e: eba5 jmp 0x1459298d5
145929930: f3460f114c8808 movss dword ptr [rax + r9*4 + 8], xmm9
145929937: eb31 jmp 0x14592996a
145929939: 31c0 xor eax, eax
14592993b: 66450f7ec8 movd r8d, xmm9
145929940: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929944: 48894538 mov qword ptr [rbp + 0x38], rax
145929948: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
145929950: 4c894d48 mov qword ptr [rbp + 0x48], r9
145929954: 48c7455082000000 mov qword ptr [rbp + 0x50], 0x82
14592995c: 488d4df8 lea rcx, [rbp - 8]
145929960: 488d5530 lea rdx, [rbp + 0x30]
145929964: e817fbfaff call 0x1458d9480
145929969: 90 nop
14592996a: 448b6724 mov r12d, dword ptr [rdi + 0x24]
14592996e: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929972: 4885c0 test rax, rax
145929975: 7470 je 0x1459299e7
145929977: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14592997b: ba83000000 mov edx, 0x83
145929980: 440fb74836 movzx r9d, word ptr [rax + 0x36]
145929985: 4589ca mov r10d, r9d
145929988: 4501d2 add r10d, r10d
14592998b: 49c7c0ffffffff mov r8, 0xffffffffffffffff
145929992: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459299a0: 4d85d2 test r10, r10
1459299a3: 742b je 0x1459299d0
1459299a5: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
1459299ab: 4439da cmp edx, r11d
1459299ae: 410f97c3 seta r11b
1459299b2: 4180db00 sbb r11b, 0
1459299b6: 49ffc0 inc r8
1459299b9: 4983c2fe add r10, -2
1459299bd: 4180fb01 cmp r11b, 1
1459299c1: 74dd je 0x1459299a0
1459299c3: 450fb6cb movzx r9d, r11b
1459299c7: 4585c9 test r9d, r9d
1459299ca: 7507 jne 0x1459299d3
1459299cc: eb12 jmp 0x1459299e0
1459299ce: 6690 nop
1459299d0: 4d89c8 mov r8, r9
1459299d3: 4883e901 sub rcx, 1
1459299d7: 7210 jb 0x1459299e9
1459299d9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
1459299de: eba0 jmp 0x145929980
1459299e0: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
1459299e5: eb2f jmp 0x145929a16
1459299e7: 31c0 xor eax, eax
1459299e9: 4c897d30 mov qword ptr [rbp + 0x30], r15
1459299ed: 48894538 mov qword ptr [rbp + 0x38], rax
1459299f1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1459299f9: 4c894548 mov qword ptr [rbp + 0x48], r8
1459299fd: 48c7455083000000 mov qword ptr [rbp + 0x50], 0x83
145929a05: 488d4df8 lea rcx, [rbp - 8]
145929a09: 488d5530 lea rdx, [rbp + 0x30]
145929a0d: 4589e0 mov r8d, r12d
145929a10: e86bfafaff call 0x1458d9480
145929a15: 90 nop
145929a16: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929a1a: 4885c0 test rax, rax
145929a1d: 7468 je 0x145929a87
145929a1f: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
145929a23: ba84000000 mov edx, 0x84
145929a28: 440fb74836 movzx r9d, word ptr [rax + 0x36]
145929a2d: 4589ca mov r10d, r9d
145929a30: 4501d2 add r10d, r10d
145929a33: 49c7c0ffffffff mov r8, 0xffffffffffffffff
145929a3a: 660f1f440000 nop word ptr [rax + rax]
145929a40: 4d85d2 test r10, r10
145929a43: 742b je 0x145929a70
145929a45: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
145929a4b: 4439da cmp edx, r11d
145929a4e: 410f97c3 seta r11b
145929a52: 4180db00 sbb r11b, 0
145929a56: 49ffc0 inc r8
145929a59: 4983c2fe add r10, -2
145929a5d: 4180fb01 cmp r11b, 1
145929a61: 74dd je 0x145929a40
145929a63: 450fb6cb movzx r9d, r11b
145929a67: 4585c9 test r9d, r9d
145929a6a: 7507 jne 0x145929a73
145929a6c: eb12 jmp 0x145929a80
145929a6e: 6690 nop
145929a70: 4d89c8 mov r8, r9
145929a73: 4883e901 sub rcx, 1
145929a77: 7210 jb 0x145929a89
145929a79: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
145929a7e: eba8 jmp 0x145929a28
145929a80: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
145929a85: eb2f jmp 0x145929ab6
145929a87: 31c0 xor eax, eax
145929a89: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929a8d: 48894538 mov qword ptr [rbp + 0x38], rax
145929a91: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
145929a99: 4c894548 mov qword ptr [rbp + 0x48], r8
145929a9d: 48c7455084000000 mov qword ptr [rbp + 0x50], 0x84
145929aa5: 488d4df8 lea rcx, [rbp - 8]
145929aa9: 488d5530 lea rdx, [rbp + 0x30]
145929aad: 4589e0 mov r8d, r12d
145929ab0: e8cbf9faff call 0x1458d9480
145929ab5: 90 nop
145929ab6: 488b4518 mov rax, qword ptr [rbp + 0x18]
145929aba: 4885c0 test rax, rax
145929abd: 746c je 0x145929b2b
145929abf: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
145929ac3: ba91000000 mov edx, 0x91
145929ac8: 440fb74836 movzx r9d, word ptr [rax + 0x36]
145929acd: 4589ca mov r10d, r9d
145929ad0: 4501d2 add r10d, r10d
145929ad3: 49c7c0ffffffff mov r8, 0xffffffffffffffff
145929ada: 660f1f440000 nop word ptr [rax + rax]
145929ae0: 4d85d2 test r10, r10
145929ae3: 742b je 0x145929b10
145929ae5: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
145929aeb: 4439da cmp edx, r11d
145929aee: 410f97c3 seta r11b
145929af2: 4180db00 sbb r11b, 0
145929af6: 49ffc0 inc r8
145929af9: 4983c2fe add r10, -2
145929afd: 4180fb01 cmp r11b, 1
145929b01: 74dd je 0x145929ae0
145929b03: 450fb6cb movzx r9d, r11b
145929b07: 4585c9 test r9d, r9d
145929b0a: 7507 jne 0x145929b13
145929b0c: eb12 jmp 0x145929b20
145929b0e: 6690 nop
145929b10: 4d89c8 mov r8, r9
145929b13: 4883e901 sub rcx, 1
145929b17: 7214 jb 0x145929b2d
145929b19: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
145929b1e: eba8 jmp 0x145929ac8
145929b20: 42c74480080000803f mov dword ptr [rax + r8*4 + 8], 0x3f800000
145929b29: eb32 jmp 0x145929b5d
145929b2b: 31c0 xor eax, eax
145929b2d: 4c897d30 mov qword ptr [rbp + 0x30], r15
145929b31: 48894538 mov qword ptr [rbp + 0x38], rax
145929b35: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
145929b3d: 4c894548 mov qword ptr [rbp + 0x48], r8
145929b41: 48c7455091000000 mov qword ptr [rbp + 0x50], 0x91
145929b49: 488d4df8 lea rcx, [rbp - 8]
145929b4d: 488d5530 lea rdx, [rbp + 0x30]
145929b51: 41b80000803f mov r8d, 0x3f800000
145929b57: e824f9faff call 0x1458d9480
145929b5c: 90 nop
145929b5d: c745f000000000 mov dword ptr [rbp - 0x10], 0
145929b64: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
145929b6c: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
145929b74: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145929b7c: f30f6f05d0b02d01 movdqu xmm0, xmmword ptr [rip + 0x12db0d0]
145929b84: 660f7f45c0 movdqa xmmword ptr [rbp - 0x40], xmm0
145929b89: 48b800002040db0f4940 movabs rax, 0x40490fdb40200000
145929b93: 488945d0 mov qword ptr [rbp - 0x30], rax
145929b97: c745c400001041 mov dword ptr [rbp - 0x3c], 0x41100000
145929b9e: 660fd67d30 movq qword ptr [rbp + 0x30], xmm7
145929ba3: 66440f7e4538 movd dword ptr [rbp + 0x38], xmm8
145929ba9: c6456701 mov byte ptr [rbp + 0x67], 1
145929bad: 4c897c2438 mov qword ptr [rsp + 0x38], r15
145929bb2: 488d45c0 lea rax, [rbp - 0x40]
145929bb6: 4889442430 mov qword ptr [rsp + 0x30], rax
145929bbb: f3440f11542428 movss dword ptr [rsp + 0x28], xmm10
145929bc2: 488d4530 lea rax, [rbp + 0x30]
145929bc6: 4889442420 mov qword ptr [rsp + 0x20], rax
145929bcb: 488d4dd8 lea rcx, [rbp - 0x28]
145929bcf: 4c89f2 mov rdx, r14
145929bd2: 41b003 mov r8b, 3
145929bd5: 4531c9 xor r9d, r9d
145929bd8: e86320f9ff call 0x1458bbc40
145929bdd: 90 nop
145929bde: f30f6f45d8 movdqu xmm0, xmmword ptr [rbp - 0x28]
145929be3: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
145929be7: 0f294d40 movaps xmmword ptr [rbp + 0x40], xmm1
145929beb: 660f7f4530 movdqa xmmword ptr [rbp + 0x30], xmm0
145929bf0: c6456700 mov byte ptr [rbp + 0x67], 0
145929bf4: 488d4df8 lea rcx, [rbp - 8]
145929bf8: 488d5530 lea rdx, [rbp + 0x30]
145929bfc: e80f28f9ff call 0x1458bc410
145929c01: 90 nop
145929c02: 4c8bbe38060000 mov r15, qword ptr [rsi + 0x638]
145929c09: 4c3bbe28060000 cmp r15, qword ptr [rsi + 0x628]
145929c10: 750d jne 0x145929c1f
145929c12: 488d8e28060000 lea rcx, [rsi + 0x628]
145929c19: e8b2ea2d00 call 0x145c086d0
145929c1e: 90 nop
145929c1f: 488b8630060000 mov rax, qword ptr [rsi + 0x630]
145929c26: 4c89f9 mov rcx, r15
145929c29: 48c1e105 shl rcx, 5
145929c2d: f30f6f45f8 movdqu xmm0, xmmword ptr [rbp - 8]
145929c32: 0f104d08 movups xmm1, xmmword ptr [rbp + 8]
145929c36: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145929c3b: f30f7f0408 movdqu xmmword ptr [rax + rcx], xmm0
145929c40: 49ffc7 inc r15
145929c43: 4c89be38060000 mov qword ptr [rsi + 0x638], r15
145929c4a: f3440f108e540a0000 movss xmm9, dword ptr [rsi + 0xa54]
145929c53: 4c8bbed8000000 mov r15, qword ptr [rsi + 0xd8]
145929c5a: 4c3bbec8000000 cmp r15, qword ptr [rsi + 0xc8]
145929c61: 7511 jne 0x145929c74
145929c63: 488d8ec8000000 lea rcx, [rsi + 0xc8]
145929c6a: c6456700 mov byte ptr [rbp + 0x67], 0
145929c6e: e87de92d00 call 0x145c085f0
145929c73: 90 nop
145929c74: 488b86d0000000 mov rax, qword ptr [rsi + 0xd0]
145929c7b: 4c89f9 mov rcx, r15
145929c7e: 48c1e107 shl rcx, 7
145929c82: 488b5310 mov rdx, qword ptr [rbx + 0x10]
145929c86: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
145929c8b: 0f1003 movups xmm0, xmmword ptr [rbx]
145929c8e: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145929c92: 48897c0818 mov qword ptr [rax + rcx + 0x18], rdi
145929c97: 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
145929c9c: 0f57c0 xorps xmm0, xmm0
145929c9f: 0f11440828 movups xmmword ptr [rax + rcx + 0x28], xmm0
145929ca4: c744083800000000 mov dword ptr [rax + rcx + 0x38], 0
145929cac: 660fd67c0840 movq qword ptr [rax + rcx + 0x40], xmm7
145929cb2: 66440f7e440848 movd dword ptr [rax + rcx + 0x48], xmm8
145929cb9: 660fd67c084c movq qword ptr [rax + rcx + 0x4c], xmm7
145929cbf: 66440f7e440854 movd dword ptr [rax + rcx + 0x54], xmm8
145929cc6: 0f2805732c7500 movaps xmm0, xmmword ptr [rip + 0x752c73]
145929ccd: f3410f10c1 movss xmm0, xmm9
145929cd2: 0fc6c004 shufps xmm0, xmm0, 4
145929cd6: 0f5805c3a12d01 addps xmm0, xmmword ptr [rip + 0x12da1c3]
145929cdd: 0f11440858 movups xmmword ptr [rax + rcx + 0x58], xmm0
145929ce2: f30f11740868 movss dword ptr [rax + rcx + 0x68], xmm6
145929ce8: 0f2805a1264800 movaps xmm0, xmmword ptr [rip + 0x4826a1]
145929cef: f3410f10c1 movss xmm0, xmm9
145929cf4: 0f1344086c movlps qword ptr [rax + rcx + 0x6c], xmm0
145929cf9: 49ffc7 inc r15
145929cfc: 48c744087400000000 mov qword ptr [rax + rcx + 0x74], 0
145929d05: c644087c00 mov byte ptr [rax + rcx + 0x7c], 0
145929d0a: 4c89bed8000000 mov qword ptr [rsi + 0xd8], r15
145929d11: 488d4d18 lea rcx, [rbp + 0x18]
145929d15: e8e64e0900 call 0x1459bec00
145929d1a: 4c89f0 mov rax, r14
145929d1d: 0f287570 movaps xmm6, xmmword ptr [rbp + 0x70]
145929d21: 0f28bd80000000 movaps xmm7, xmmword ptr [rbp + 0x80]
145929d28: 440f288590000000 movaps xmm8, xmmword ptr [rbp + 0x90]
145929d30: 440f288da0000000 movaps xmm9, xmmword ptr [rbp + 0xa0]
145929d38: 440f2895b0000000 movaps xmm10, xmmword ptr [rbp + 0xb0]
145929d40: 4881c440010000 add rsp, 0x140
145929d47: 5b pop rbx
145929d48: 5f pop rdi
145929d49: 5e pop rsi
145929d4a: 415c pop r12
145929d4c: 415e pop r14
145929d4e: 415f pop r15
145929d50: 5d pop rbp
145929d51: c3 ret

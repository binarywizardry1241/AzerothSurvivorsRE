0x140062330: 55 push rbp
0x140062331: 4156 push r14
0x140062333: 56 push rsi
0x140062334: 57 push rdi
0x140062335: 53 push rbx
0x140062336: 4881ecd0020000 sub rsp, 0x2d0
0x14006233d: 488dac2480000000 lea rbp, [rsp + 0x80]
0x140062345: 48c78548020000feffffff mov qword ptr [rbp + 0x248], 0xfffffffffffffffe
0x140062350: 4889ce mov rsi, rcx
0x140062353: 488d4da0 lea rcx, [rbp - 0x60]
0x140062357: e8f4b18305 call 0x14589d550
0x14006235c: 4883bdf0000000ff cmp qword ptr [rbp + 0xf0], -1
0x140062364: 0f84f0000000 je 0x14006245a
0x14006236a: 488d95f0000000 lea rdx, [rbp + 0xf0]
0x140062371: 8a9d28010000 mov bl, byte ptr [rbp + 0x128]
0x140062377: 408abd29010000 mov dil, byte ptr [rbp + 0x129]
0x14006237e: 448ab52a010000 mov r14b, byte ptr [rbp + 0x12a]
0x140062385: 488d8de8010000 lea rcx, [rbp + 0x1e8]
0x14006238c: e85fafb605 call 0x145bcd2f0
0x140062391: 90 nop
0x140062392: 488d9508010000 lea rdx, [rbp + 0x108]
0x140062399: 488d8d70010000 lea rcx, [rbp + 0x170]
0x1400623a0: e84bafb605 call 0x145bcd2f0
0x1400623a5: 90 nop
0x1400623a6: 0fb6852f010000 movzx eax, byte ptr [rbp + 0x12f]
0x1400623ad: 88853f020000 mov byte ptr [rbp + 0x23f], al
0x1400623b3: 8b852b010000 mov eax, dword ptr [rbp + 0x12b]
0x1400623b9: 89853b020000 mov dword ptr [rbp + 0x23b], eax
0x1400623bf: 488b8520010000 mov rax, qword ptr [rbp + 0x120]
0x1400623c6: 0f1085e8010000 movups xmm0, xmmword ptr [rbp + 0x1e8]
0x1400623cd: 0f2985b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm0
0x1400623d4: 488b8df8010000 mov rcx, qword ptr [rbp + 0x1f8]
0x1400623db: 48898dc0010000 mov qword ptr [rbp + 0x1c0], rcx
0x1400623e2: 488b8d80010000 mov rcx, qword ptr [rbp + 0x180]
0x1400623e9: 48898dd8010000 mov qword ptr [rbp + 0x1d8], rcx
0x1400623f0: 0f108d70010000 movups xmm1, xmmword ptr [rbp + 0x170]
0x1400623f7: 0f118dc8010000 movups xmmword ptr [rbp + 0x1c8], xmm1
0x1400623fe: 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
0x140062405: 488b8dc0010000 mov rcx, qword ptr [rbp + 0x1c0]
0x14006240c: 48898d10020000 mov qword ptr [rbp + 0x210], rcx
0x140062413: 488b8dc8010000 mov rcx, qword ptr [rbp + 0x1c8]
0x14006241a: 48898d18020000 mov qword ptr [rbp + 0x218], rcx
0x140062421: 488b8dd0010000 mov rcx, qword ptr [rbp + 0x1d0]
0x140062428: 48898d20020000 mov qword ptr [rbp + 0x220], rcx
0x14006242f: 488b8dd8010000 mov rcx, qword ptr [rbp + 0x1d8]
0x140062436: 48898d28020000 mov qword ptr [rbp + 0x228], rcx
0x14006243d: 48898530020000 mov qword ptr [rbp + 0x230], rax
0x140062444: 889d38020000 mov byte ptr [rbp + 0x238], bl
0x14006244a: 4088bd39020000 mov byte ptr [rbp + 0x239], dil
0x140062451: 4488b53a020000 mov byte ptr [rbp + 0x23a], r14b
0x140062458: eb0d jmp 0x140062467
0x14006245a: 488d8d00020000 lea rcx, [rbp + 0x200]
0x140062461: e88a6e8405 call 0x1458a92f0
0x140062466: 90 nop
0x140062467: 488d8d70010000 lea rcx, [rbp + 0x170]
0x14006246e: 488d9500020000 lea rdx, [rbp + 0x200]
0x140062475: e8465b8405 call 0x1458a7fc0
0x14006247a: 90 nop
0x14006247b: 488d8d00020000 lea rcx, [rbp + 0x200]
0x140062482: 488d55a0 lea rdx, [rbp - 0x60]
0x140062486: 4c8d8570010000 lea r8, [rbp + 0x170]
0x14006248d: e89e9b8305 call 0x14589c030
0x140062492: 90 nop
0x140062493: 4883bd1002000004 cmp qword ptr [rbp + 0x210], 4
0x14006249b: 7552 jne 0x1400624ef
0x14006249d: 488bbd08020000 mov rdi, qword ptr [rbp + 0x208]
0x1400624a4: 813f4865726f cmp dword ptr [rdi], 0x6f726548
0x1400624aa: 7543 jne 0x1400624ef
0x1400624ac: 488d8d70010000 lea rcx, [rbp + 0x170]
0x1400624b3: e8381b0000 call 0x140063ff0
0x1400624b8: 90 nop
0x1400624b9: 488b9500020000 mov rdx, qword ptr [rbp + 0x200]
0x1400624c0: 4885d2 test rdx, rdx
0x1400624c3: 740e je 0x1400624d3
0x1400624c5: 41b801000000 mov r8d, 1
0x1400624cb: 4889f9 mov rcx, rdi
0x1400624ce: e8fdfcf9ff call 0x1400021d0
0x1400624d3: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
0x1400624da: 48898510020000 mov qword ptr [rbp + 0x210], rax
0x1400624e1: 0f108570010000 movups xmm0, xmmword ptr [rbp + 0x170]
0x1400624e8: 0f298500020000 movaps xmmword ptr [rbp + 0x200], xmm0
0x1400624ef: 0f288500020000 movaps xmm0, xmmword ptr [rbp + 0x200]
0x1400624f6: 488b8510020000 mov rax, qword ptr [rbp + 0x210]
0x1400624fd: 488b8d18020000 mov rcx, qword ptr [rbp + 0x218]
0x140062504: 0f288d20020000 movaps xmm1, xmmword ptr [rbp + 0x220]
0x14006250b: 0f289530020000 movaps xmm2, xmmword ptr [rbp + 0x230]
0x140062512: 0f115630 movups xmmword ptr [rsi + 0x30], xmm2
0x140062516: 0f114e20 movups xmmword ptr [rsi + 0x20], xmm1
0x14006251a: 48894610 mov qword ptr [rsi + 0x10], rax
0x14006251e: 48894e18 mov qword ptr [rsi + 0x18], rcx
0x140062522: 0f1106 movups xmmword ptr [rsi], xmm0
0x140062525: 488d4da0 lea rcx, [rbp - 0x60]
0x140062529: e88279faff call 0x140009eb0
0x14006252e: 4889f0 mov rax, rsi
0x140062531: 4881c4d0020000 add rsp, 0x2d0
0x140062538: 5b pop rbx
0x140062539: 5f pop rdi
0x14006253a: 5e pop rsi
0x14006253b: 415e pop r14
0x14006253d: 5d pop rbp
0x14006253e: c3 ret

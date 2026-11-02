1458f1b50: 55 push rbp
1458f1b51: 4157 push r15
1458f1b53: 4156 push r14
1458f1b55: 4155 push r13
1458f1b57: 4154 push r12
1458f1b59: 56 push rsi
1458f1b5a: 57 push rdi
1458f1b5b: 53 push rbx
1458f1b5c: 4881ec48010000 sub rsp, 0x148
1458f1b63: 488dac2480000000 lea rbp, [rsp + 0x80]
1458f1b6b: 440f29adb0000000 movaps xmmword ptr [rbp + 0xb0], xmm13
1458f1b73: 440f29a5a0000000 movaps xmmword ptr [rbp + 0xa0], xmm12
1458f1b7b: 440f299d90000000 movaps xmmword ptr [rbp + 0x90], xmm11
1458f1b83: 440f299580000000 movaps xmmword ptr [rbp + 0x80], xmm10
1458f1b8b: 440f294d70 movaps xmmword ptr [rbp + 0x70], xmm9
1458f1b90: 440f294560 movaps xmmword ptr [rbp + 0x60], xmm8
1458f1b95: 0f297d50 movaps xmmword ptr [rbp + 0x50], xmm7
1458f1b99: 0f297540 movaps xmmword ptr [rbp + 0x40], xmm6
1458f1b9d: 48c74538feffffff mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
1458f1ba5: 0f28f2 movaps xmm6, xmm2
1458f1ba8: 4889d7 mov rdi, rdx
1458f1bab: 4889ce mov rsi, rcx
1458f1bae: f3440f100a movss xmm9, dword ptr [rdx]
1458f1bb3: 80b9100a000000 cmp byte ptr [rcx + 0xa10], 0
1458f1bba: 7445 je 0x1458f1c01
1458f1bbc: f3440f105704 movss xmm10, dword ptr [rdi + 4]
1458f1bc2: f20f1086140a0000 movsd xmm0, qword ptr [rsi + 0xa14]
1458f1bca: 410f28c9 movaps xmm1, xmm9
1458f1bce: 410f14ca unpcklps xmm1, xmm10
1458f1bd2: 0f5cc1 subps xmm0, xmm1
1458f1bd5: 0f59c0 mulps xmm0, xmm0
1458f1bd8: f30f16c8 movshdup xmm1, xmm0
1458f1bdc: f30f58c8 addss xmm1, xmm0
1458f1be0: 0f2e0d69fe4f00 ucomiss xmm1, dword ptr [rip + 0x4ffe69]
1458f1be7: 7620 jbe 0x1458f1c09
1458f1be9: 0fb686200a0000 movzx eax, byte ptr [rsi + 0xa20]
1458f1bf0: 84c0 test al, al
1458f1bf2: 7415 je 0x1458f1c09
1458f1bf4: fec8 dec al
1458f1bf6: 8886200a0000 mov byte ptr [rsi + 0xa20], al
1458f1bfc: e9b00a0000 jmp 0x1458f26b1
1458f1c01: f3440f105704 movss xmm10, dword ptr [rdi + 4]
1458f1c07: eb0a jmp 0x1458f1c13
1458f1c09: c786100a000000000000 mov dword ptr [rsi + 0xa10], 0
1458f26b1: 0f287540 movaps xmm6, xmmword ptr [rbp + 0x40]
1458f26b5: 0f287d50 movaps xmm7, xmmword ptr [rbp + 0x50]
1458f26b9: 440f284560 movaps xmm8, xmmword ptr [rbp + 0x60]
1458f26be: 440f284d70 movaps xmm9, xmmword ptr [rbp + 0x70]
1458f26c3: 440f289580000000 movaps xmm10, xmmword ptr [rbp + 0x80]
1458f26cb: 440f289d90000000 movaps xmm11, xmmword ptr [rbp + 0x90]
1458f26d3: 440f28a5a0000000 movaps xmm12, xmmword ptr [rbp + 0xa0]
1458f26db: 440f28adb0000000 movaps xmm13, xmmword ptr [rbp + 0xb0]
1458f26e3: 4881c448010000 add rsp, 0x148
1458f26ea: 5b pop rbx
1458f26eb: 5f pop rdi
1458f26ec: 5e pop rsi
1458f26ed: 415c pop r12
1458f26ef: 415d pop r13
1458f26f1: 415e pop r14
1458f26f3: 415f pop r15
1458f26f5: 5d pop rbp
1458f26f6: c3 ret
1459073c5: f20f108fd0040000 movsd xmm1, qword ptr [rdi + 0x4d0]
1459073cd: 4c8bb770060000 mov r14, qword ptr [rdi + 0x670]
1459073d4: 4a8d04cd00000000 lea rax, [r9*8]
1459073dc: 488d0480 lea rax, [rax + rax*4]
1459073e0: 4531c0 xor r8d, r8d
1459073e3: 31c9 xor ecx, ecx
1459073e5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459073f0: 4839c8 cmp rax, rcx
1459073f3: 0f84a9000000 je 0x1459074a2
1459073f9: 488d5128 lea rdx, [rcx + 0x28]
1459073fd: 49ffc8 dec r8
145907400: 49833c0e00 cmp qword ptr [r14 + rcx], 0
145907405: 4889d1 mov rcx, rdx
145907408: 74e6 je 0x1459073f0
14590740a: 4c89c1 mov rcx, r8
14590740d: 48f7d1 not rcx
145907410: 4829d0 sub rax, rdx
145907413: 0f84a5000000 je 0x1459074be
145907419: 4d8d1416 lea r10, [r14 + rdx]
14590741d: 4d8d1c16 lea r11, [r14 + rdx]
145907421: 4983c3d8 add r11, -0x28
145907425: 48bacdcccccccccccccc movabs rdx, 0xcccccccccccccccd
14590742f: 48f7e2 mul rdx
145907432: 48c1ea05 shr rdx, 5
145907436: 49f7d8 neg r8
145907439: 31c0 xor eax, eax
14590743b: eb0f jmp 0x14590744c
145907440: 48ffc0 inc rax
145907443: 4983c228 add r10, 0x28
145907447: 4839c2 cmp rdx, rax
14590744a: 7472 je 0x1459074be
14590744c: 49833a00 cmp qword ptr [r10], 0
145907450: 74ee je 0x145907440
145907452: f2410f104318 movsd xmm0, qword ptr [r11 + 0x18]
145907458: 0f5cc1 subps xmm0, xmm1
14590745b: 0f59c0 mulps xmm0, xmm0
14590745e: f2410f105218 movsd xmm2, qword ptr [r10 + 0x18]
145907464: 0f5cd1 subps xmm2, xmm1
145907467: 0f59d2 mulps xmm2, xmm2
14590746a: f20f7cc2 haddps xmm0, xmm2
14590746e: 0fc6c0e8 shufps xmm0, xmm0, 0xe8
145907472: 0f51c0 sqrtps xmm0, xmm0
145907475: 0f28d0 movaps xmm2, xmm0
145907478: 660f72e21f psrad xmm2, 0x1f
14590747d: 660f72d201 psrld xmm2, 1
145907482: 660fefd0 pxor xmm2, xmm0
145907486: 660f70c255 pshufd xmm0, xmm2, 0x55
14590748b: 660f66d0 pcmpgtd xmm2, xmm0
14590748f: 660f7ed6 movd esi, xmm2
145907493: 40f6c601 test sil, 1
145907497: 74a7 je 0x145907440
145907499: 498d0c00 lea rcx, [r8 + rax]
14590749d: 4d89d3 mov r11, r10
1459074a0: eb9e jmp 0x145907440

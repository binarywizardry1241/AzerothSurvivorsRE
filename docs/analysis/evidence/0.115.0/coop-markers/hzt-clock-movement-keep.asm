0x140111815: ba04000000 mov edx, 4
0x14011181a: 488d0d2007de05 lea rcx, [rip + 0x5de0720]
0x140111821: 4c8d85a0000000 lea r8, [rbp + 0xa0]
0x140111828: e873519602 call 0x142a769a0
0x14011182d: 90 nop
0x14011182e: 4885c0 test rax, rax
0x140111831: 7503 jne 0x140111836
0x140111833: 4c89f0 mov rax, r14
0x140111836: 803803 cmp byte ptr [rax], 3
0x140111839: 0f859d040000 jne 0x140111cdc
0x14011183f: 488b4810 mov rcx, qword ptr [rax + 0x10]
0x140111843: 488b4018 mov rax, qword ptr [rax + 0x18]
0x140111847: 4883f803 cmp rax, 3
0x14011184b: 0f8552030000 jne 0x140111ba3
0x140111851: 0fb701 movzx eax, word ptr [rcx]
0x140111854: 35687a0000 xor eax, 0x7a68
0x140111859: 0fb64902 movzx ecx, byte ptr [rcx + 2]
0x14011185d: 83f174 xor ecx, 0x74
0x140111860: 6609c1 or cx, ax
0x140111863: 0f8573040000 jne 0x140111cdc
0x140111869: ba01000000 mov edx, 1
0x14011186e: 488d0dd006de05 lea rcx, [rip + 0x5de06d0]
0x140111875: 4c8d85a0000000 lea r8, [rbp + 0xa0]
0x14011187c: e81f519602 call 0x142a769a0
0x140111881: 90 nop
0x140111882: 4885c0 test rax, rax
0x140111885: 7503 jne 0x14011188a
0x140111887: 4c89f0 mov rax, r14
0x14011188a: 660f57c0 xorpd xmm0, xmm0
0x14011188e: 803802 cmp byte ptr [rax], 2
0x140111891: 7545 jne 0x1401118d8
0x140111893: 488b4808 mov rcx, qword ptr [rax + 8]
0x140111897: 4885c9 test rcx, rcx
0x14011189a: 7410 je 0x1401118ac
0x14011189c: 83f901 cmp ecx, 1
0x14011189f: 752e jne 0x1401118cf
0x1401118a1: 0f57c0 xorps xmm0, xmm0
0x1401118a4: f2480f2a4010 cvtsi2sd xmm0, qword ptr [rax + 0x10]
0x1401118aa: eb28 jmp 0x1401118d4
0x1401118ac: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
0x1401118b1: 410f14c0 unpcklps xmm0, xmm8
0x1401118b5: 66410f5cc1 subpd xmm0, xmm9
0x1401118ba: 660f28c8 movapd xmm1, xmm0
0x1401118be: 660f15c8 unpckhpd xmm1, xmm0
0x1401118c2: f20f58c8 addsd xmm1, xmm0
0x1401118c6: 0f57c0 xorps xmm0, xmm0
0x1401118c9: f20f5ac1 cvtsd2ss xmm0, xmm1
0x1401118cd: eb09 jmp 0x1401118d8
0x1401118cf: f20f104010 movsd xmm0, qword ptr [rax + 0x10]
0x1401118d4: f20f5ac0 cvtsd2ss xmm0, xmm0
0x1401118d8: f3410f11442418 movss dword ptr [r12 + 0x18], xmm0
0x1401118df: 8b85c8000000 mov eax, dword ptr [rbp + 0xc8]
0x1401118e5: 41894500 mov dword ptr [r13], eax
0x1401118e9: f3410f1174241c movss dword ptr [r12 + 0x1c], xmm6
0x1401118f0: ba01000000 mov edx, 1
0x1401118f5: 488d0d4a06de05 lea rcx, [rip + 0x5de064a]
0x1401118fc: 4c8d85a0000000 lea r8, [rbp + 0xa0]
0x140111903: e898509602 call 0x142a769a0
0x140111908: 90 nop
0x140111909: 4885c0 test rax, rax
0x14011190c: 7503 jne 0x140111911
0x14011190e: 4c89f0 mov rax, r14
0x140111911: 803804 cmp byte ptr [rax], 4
0x140111914: 0f8546020000 jne 0x140111b60
0x14011191a: 488b4818 mov rcx, qword ptr [rax + 0x18]
0x14011191e: 4885c9 test rcx, rcx
0x140111921: 0f8439020000 je 0x140111b60
0x140111927: 4c8b4010 mov r8, qword ptr [rax + 0x10]
0x14011192b: 48c1e105 shl rcx, 5
0x14011192f: 4c01c1 add rcx, r8
0x140111932: eb20 jmp 0x140111954
0x140111934: f2410f104210 movsd xmm0, qword ptr [r10 + 0x10]
0x14011193a: 0f57d2 xorps xmm2, xmm2
0x14011193d: f20f5ad0 cvtsd2ss xmm2, xmm0
0x140111941: f3420f11540aec movss dword ptr [rdx + r9 - 0x14], xmm2
0x140111948: 4989c0 mov r8, rax
0x14011194b: 4839c8 cmp rax, rcx
0x14011194e: 0f840c020000 je 0x140111b60
0x140111954: 4983781800 cmp qword ptr [r8 + 0x18], 0
0x140111959: 4c89f0 mov rax, r14
0x14011195c: 7404 je 0x140111962
0x14011195e: 498b4010 mov rax, qword ptr [r8 + 0x10]
0x140111962: 41803804 cmp byte ptr [r8], 4
0x140111966: 490f45c6 cmovne rax, r14
0x14011196a: 803802 cmp byte ptr [rax], 2
0x14011196d: 750b jne 0x14011197a
0x14011196f: 4883780800 cmp qword ptr [rax + 8], 0
0x140111974: 0f8480000000 je 0x1401119fa
0x14011197a: 4531d2 xor r10d, r10d
0x14011197d: 498d4020 lea rax, [r8 + 0x20]
0x140111981: 8b95c8000000 mov edx, dword ptr [rbp + 0xc8]
0x140111987: 41895500 mov dword ptr [r13], edx
0x14011198b: 498b542408 mov rdx, qword ptr [r12 + 8]
0x140111990: 4d8b5c2410 mov r11, qword ptr [r12 + 0x10]
0x140111995: 49c1e307 shl r11, 7
0x140111999: 4531c9 xor r9d, r9d
0x14011199c: 4889d6 mov rsi, rdx
0x14011199f: 90 nop
0x1401119a0: 4d39cb cmp r11, r9
0x1401119a3: 74a3 je 0x140111948
0x1401119a5: 4983e980 sub r9, -0x80
0x1401119a9: 4c395638 cmp qword ptr [rsi + 0x38], r10
0x1401119ad: 488db680000000 lea rsi, [rsi + 0x80]
0x1401119b4: 75ea jne 0x1401119a0
0x1401119b6: 4d8b5818 mov r11, qword ptr [r8 + 0x18]
0x1401119ba: 4d8b5010 mov r10, qword ptr [r8 + 0x10]
0x1401119be: 498d7220 lea rsi, [r10 + 0x20]
0x1401119c2: 4983fb02 cmp r11, 2
0x1401119c6: 490f42f6 cmovb rsi, r14
0x1401119ca: 410fb618 movzx ebx, byte ptr [r8]
0x1401119ce: 80fb04 cmp bl, 4
0x1401119d1: 490f45f6 cmovne rsi, r14
0x1401119d5: 0f57c0 xorps xmm0, xmm0
0x1401119d8: 803e02 cmp byte ptr [rsi], 2
0x1401119db: 0f57c9 xorps xmm1, xmm1
0x1401119de: 7548 jne 0x140111a28
0x1401119e0: 488b7e08 mov rdi, qword ptr [rsi + 8]
0x1401119e4: 4883ff02 cmp rdi, 2
0x1401119e8: 7419 je 0x140111a03
0x1401119ea: 83ff01 cmp edi, 1
0x1401119ed: 751b jne 0x140111a0a
0x1401119ef: 0f57c9 xorps xmm1, xmm1
0x1401119f2: f2480f2a4e10 cvtsi2sd xmm1, qword ptr [rsi + 0x10]
0x1401119f8: eb2a jmp 0x140111a24
0x1401119fa: 4c8b5010 mov r10, qword ptr [rax + 0x10]
0x1401119fe: e97affffff jmp 0x14011197d
0x140111a03: f20f104e10 movsd xmm1, qword ptr [rsi + 0x10]
0x140111a08: eb1a jmp 0x140111a24
0x140111a0a: f20f105610 movsd xmm2, qword ptr [rsi + 0x10]
0x140111a0f: 410f14d0 unpcklps xmm2, xmm8
0x140111a13: 66410f5cd1 subpd xmm2, xmm9
0x140111a18: 660f28ca movapd xmm1, xmm2
0x140111a1c: 660f15ca unpckhpd xmm1, xmm2
0x140111a20: f20f58ca addsd xmm1, xmm2
0x140111a24: f20f5ac9 cvtsd2ss xmm1, xmm1
0x140111a28: 498d7240 lea rsi, [r10 + 0x40]
0x140111a2c: 4983fb03 cmp r11, 3
0x140111a30: 490f42f6 cmovb rsi, r14
0x140111a34: 80fb04 cmp bl, 4
0x140111a37: 490f45f6 cmovne rsi, r14
0x140111a3b: 803e02 cmp byte ptr [rsi], 2
0x140111a3e: 753f jne 0x140111a7f
0x140111a40: 488b7e08 mov rdi, qword ptr [rsi + 8]
0x140111a44: 4883ff02 cmp rdi, 2
0x140111a48: 7410 je 0x140111a5a
0x140111a4a: 83ff01 cmp edi, 1
0x140111a4d: 7512 jne 0x140111a61
0x140111a4f: 0f57c0 xorps xmm0, xmm0
0x140111a52: f2480f2a4610 cvtsi2sd xmm0, qword ptr [rsi + 0x10]
0x140111a58: eb21 jmp 0x140111a7b
0x140111a5a: f20f104610 movsd xmm0, qword ptr [rsi + 0x10]
0x140111a5f: eb1a jmp 0x140111a7b
0x140111a61: f20f105610 movsd xmm2, qword ptr [rsi + 0x10]
0x140111a66: 410f14d0 unpcklps xmm2, xmm8
0x140111a6a: 66410f5cd1 subpd xmm2, xmm9
0x140111a6f: 660f28c2 movapd xmm0, xmm2
0x140111a73: 660f15c2 unpckhpd xmm0, xmm2
0x140111a77: f20f58c2 addsd xmm0, xmm2
0x140111a7b: f20f5ac0 cvtsd2ss xmm0, xmm0
0x140111a7f: 4983c260 add r10, 0x60
0x140111a83: 4983fb04 cmp r11, 4
0x140111a87: 4d0f42d6 cmovb r10, r14
0x140111a8b: 80fb04 cmp bl, 4
0x140111a8e: 4d0f45d6 cmovne r10, r14
0x140111a92: 660f57d2 xorpd xmm2, xmm2
0x140111a96: 41803a02 cmp byte ptr [r10], 2
0x140111a9a: 0f57db xorps xmm3, xmm3
0x140111a9d: 7542 jne 0x140111ae1
0x140111a9f: 4d8b5a08 mov r11, qword ptr [r10 + 8]
0x140111aa3: 4983fb02 cmp r11, 2
0x140111aa7: 7411 je 0x140111aba
0x140111aa9: 4183fb01 cmp r11d, 1
0x140111aad: 7513 jne 0x140111ac2
0x140111aaf: 0f57db xorps xmm3, xmm3
0x140111ab2: f2490f2a5a10 cvtsi2sd xmm3, qword ptr [r10 + 0x10]
0x140111ab8: eb23 jmp 0x140111add
0x140111aba: f2410f105a10 movsd xmm3, qword ptr [r10 + 0x10]
0x140111ac0: eb1b jmp 0x140111add
0x140111ac2: f2410f106210 movsd xmm4, qword ptr [r10 + 0x10]
0x140111ac8: 410f14e0 unpcklps xmm4, xmm8
0x140111acc: 66410f5ce1 subpd xmm4, xmm9
0x140111ad1: 660f28dc movapd xmm3, xmm4
0x140111ad5: 660f15dc unpckhpd xmm3, xmm4
0x140111ad9: f20f58dc addsd xmm3, xmm4
0x140111add: f20f5adb cvtsd2ss xmm3, xmm3
0x140111ae1: f3420f114c0ae0 movss dword ptr [rdx + r9 - 0x20], xmm1
0x140111ae8: f3420f11440ae4 movss dword ptr [rdx + r9 - 0x1c], xmm0
0x140111aef: f3420f115c0ae8 movss dword ptr [rdx + r9 - 0x18], xmm3
0x140111af6: 4d8b5010 mov r10, qword ptr [r8 + 0x10]
0x140111afa: 4983ea80 sub r10, -0x80
0x140111afe: 4983781805 cmp qword ptr [r8 + 0x18], 5
0x140111b03: 4d0f42d6 cmovb r10, r14
0x140111b07: 41803804 cmp byte ptr [r8], 4
0x140111b0b: 4d0f45d6 cmovne r10, r14
0x140111b0f: 41803a02 cmp byte ptr [r10], 2
0x140111b13: 0f8528feffff jne 0x140111941
0x140111b19: 4d8b4208 mov r8, qword ptr [r10 + 8]
0x140111b1d: 4983f802 cmp r8, 2
0x140111b21: 0f840dfeffff je 0x140111934
0x140111b27: 4183f801 cmp r8d, 1
0x140111b2b: 750e jne 0x140111b3b
0x140111b2d: 0f57c0 xorps xmm0, xmm0
0x140111b30: f2490f2a4210 cvtsi2sd xmm0, qword ptr [r10 + 0x10]
0x140111b36: e9fffdffff jmp 0x14011193a
0x140111b3b: f2410f104a10 movsd xmm1, qword ptr [r10 + 0x10]
0x140111b41: 410f14c8 unpcklps xmm1, xmm8
0x140111b45: 66410f5cc9 subpd xmm1, xmm9
0x140111b4a: 660f28c1 movapd xmm0, xmm1
0x140111b4e: 660f15c1 unpckhpd xmm0, xmm1
0x140111b52: f20f58c1 addsd xmm0, xmm1
0x140111b56: e9dffdffff jmp 0x14011193a
0x140111b5b: 0f1f440000 nop dword ptr [rax + rax]
0x140111b60: ba04000000 mov edx, 4
0x140111b65: 488d0ddb03de05 lea rcx, [rip + 0x5de03db]
0x140111b6c: 4c8d85a0000000 lea r8, [rbp + 0xa0]
0x140111b73: e8284e9602 call 0x142a769a0
0x140111b78: 90 nop
0x140111b79: 4885c0 test rax, rax
0x140111b7c: 7503 jne 0x140111b81
0x140111b7e: 4c89f0 mov rax, r14
0x140111b81: 803801 cmp byte ptr [rax], 1
0x140111b84: 0f85e6000000 jne 0x140111c70
0x140111b8a: 80780100 cmp byte ptr [rax + 1], 0
0x140111b8e: 0f84dc000000 je 0x140111c70
0x140111b94: 488d4da0 lea rcx, [rbp - 0x60]
0x140111b98: e8731cf1ff call 0x140023810
0x140111b9d: 90 nop
0x140111b9e: e93dfcffff jmp 0x1401117e0

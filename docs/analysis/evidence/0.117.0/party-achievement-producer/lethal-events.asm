145bd65d2: 410f28c8 movaps xmm1, xmm8
145bd65d6: f30f5dc8 minss xmm1, xmm0
145bd65da: 4b8b5c3e18 mov rbx, qword ptr [r14 + r15 + 0x18]
145bd65df: 4883fbff cmp rbx, -1
145bd65e3: 7410 je 0x145bd65f5
145bd65e5: 4b8b443e30 mov rax, qword ptr [r14 + r15 + 0x30]
145bd65ea: 8b4040 mov eax, dword ptr [rax + 0x40]
145bd65ed: 898560010000 mov dword ptr [rbp + 0x160], eax
145bd65f3: eb00 jmp 0x145bd65f5
145bd65f5: f30f5af9 cvtss2sd xmm7, xmm1
145bd65f9: f20f108160070000 movsd xmm0, qword ptr [rcx + 0x760]
145bd6601: f20f58c7 addsd xmm0, xmm7
145bd6605: f20f118160070000 movsd qword ptr [rcx + 0x760], xmm0
145bd660d: 488d8188070000 lea rax, [rcx + 0x788]
145bd6614: 488bb188070000 mov rsi, qword ptr [rcx + 0x788]
145bd661b: 4885f6 test rsi, rsi
145bd661e: 48898d78010000 mov qword ptr [rbp + 0x178], rcx
145bd6625: 44898d70010000 mov dword ptr [rbp + 0x170], r9d
145bd662c: 0f8487000000 je 0x145bd66b9
145bd6632: 488b9190070000 mov rdx, qword ptr [rcx + 0x790]
145bd6639: 0fb78e8e000000 movzx ecx, word ptr [rsi + 0x8e]
145bd6640: 4189ca mov r10d, ecx
145bd6643: 41c1e202 shl r10d, 2
145bd6647: 49c7c0ffffffff mov r8, 0xffffffffffffffff
145bd664e: 6690 nop
145bd6650: 4d85d2 test r10, r10
145bd6653: 7424 je 0x145bd6679
145bd6655: 463b4c8664 cmp r9d, dword ptr [rsi + r8*4 + 0x64]
145bd665a: 410f97c3 seta r11b
145bd665e: 4180db00 sbb r11b, 0
145bd6662: 49ffc0 inc r8
145bd6665: 4983c2fc add r10, -4
145bd6669: 4180fb01 cmp r11b, 1
145bd666d: 74e1 je 0x145bd6650
145bd666f: 410fb6cb movzx ecx, r11b
145bd6673: 85c9 test ecx, ecx
145bd6675: 7505 jne 0x145bd667c
145bd6677: eb17 jmp 0x145bd6690
145bd6679: 4989c8 mov r8, rcx
145bd667c: 4883ea01 sub rdx, 1
145bd6680: 0f82e9150000 jb 0x145bd7c6f
145bd6686: 4a8bb4c690000000 mov rsi, qword ptr [rsi + r8*8 + 0x90]
145bd668e: eba9 jmp 0x145bd6639
145bd6690: 4889b5e8000000 mov qword ptr [rbp + 0xe8], rsi
145bd6697: 488995f0000000 mov qword ptr [rbp + 0xf0], rdx
145bd669e: 4c8985f8000000 mov qword ptr [rbp + 0xf8], r8
145bd66a5: 48898500010000 mov qword ptr [rbp + 0x100], rax
145bd66ac: 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
145bd66b7: eb19 jmp 0x145bd66d2
145bd66b9: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
145bd66c0: 48c785e800000000000000 mov qword ptr [rbp + 0xe8], 0
145bd66cb: 44898d00010000 mov dword ptr [rbp + 0x100], r9d
145bd66d2: 488d8de0000000 lea rcx, [rbp + 0xe0]
145bd66d9: e892eeeaff call 0x145a85570
145bd66de: f20f1000 movsd xmm0, qword ptr [rax]
145bd66e2: f20f58c7 addsd xmm0, xmm7
145bd66e6: f20f1100 movsd qword ptr [rax], xmm0
145bd66ea: f3470f109c3e60010000 movss xmm11, dword ptr [r14 + r15 + 0x160]
145bd66f4: 450f57e4 xorps xmm12, xmm12
145bd66f8: 410f28c3 movaps xmm0, xmm11
145bd66fc: f3410f5fc4 maxss xmm0, xmm12
145bd6701: e841d63b00 call 0x145f93d47
145bd6706: f3480f2cc0 cvttss2si rax, xmm0
145bd670b: 31c9 xor ecx, ecx
145bd670d: 410f2ec4 ucomiss xmm0, xmm12
145bd6711: 0f43c8 cmovae ecx, eax
145bd6714: 0f2e0579aa5a00 ucomiss xmm0, dword ptr [rip + 0x5aaa79]
145bd671b: 41bdffffffff mov r13d, 0xffffffff
145bd6721: 440f46e9 cmovbe r13d, ecx
145bd6725: 48899d50010000 mov qword ptr [rbp + 0x150], rbx
145bd672c: 4883fbff cmp rbx, -1
145bd6730: 0f8439030000 je 0x145bd6a6f
145bd6736: 450f2ee3 ucomiss xmm12, xmm11
145bd673a: 0f822f030000 jb 0x145bd6a6f
145bd6740: 8b8d70010000 mov ecx, dword ptr [rbp + 0x170]
145bd6746: 81f9a63e0000 cmp ecx, 0x3ea6
145bd674c: 7427 je 0x145bd6775
145bd674e: 81f96a370000 cmp ecx, 0x376a
145bd6754: 488b8578010000 mov rax, qword ptr [rbp + 0x178]
145bd675b: 7411 je 0x145bd676e
145bd675d: 89ce mov esi, ecx
145bd675f: 81f9bc140000 cmp ecx, 0x14bc
145bd6765: 751a jne 0x145bd6781
145bd6767: bea7500000 mov esi, 0x50a7
145bd676c: eb13 jmp 0x145bd6781
145bd676e: be32080000 mov esi, 0x832
145bd6773: eb0c jmp 0x145bd6781
145bd6775: be9d200000 mov esi, 0x209d
145bd677a: 488b8578010000 mov rax, qword ptr [rbp + 0x178]
145bd6781: 4989c6 mov r14, rax
145bd6784: 488b9828070000 mov rbx, qword ptr [rax + 0x728]
145bd678b: 483b9818070000 cmp rbx, qword ptr [rax + 0x718]
145bd6792: 750c jne 0x145bd67a0
145bd6794: 498d8e18070000 lea rcx, [r14 + 0x718]
145bd679b: e870db3e00 call 0x145fc4310
145bd67a0: 498b8620070000 mov rax, qword ptr [r14 + 0x720]
145bd67a7: 8b8d60010000 mov ecx, dword ptr [rbp + 0x160]
145bd67ad: 890cd8 mov dword ptr [rax + rbx*8], ecx
145bd67b0: 8974d804 mov dword ptr [rax + rbx*8 + 4], esi
145bd67b4: 48ffc3 inc rbx
145bd67b7: 49899e28070000 mov qword ptr [r14 + 0x728], rbx
145bd67be: 450fb6b6ad010000 movzx r14d, byte ptr [r14 + 0x1ad]
145bd67c6: 31db xor ebx, ebx
145bd67c8: c7855801000000000000 mov dword ptr [rbp + 0x158], 0
145bd67d2: 4584f6 test r14b, r14b
145bd67d5: 0f85c2000000 jne 0x145bd689d
145bd67db: 83bd7001000000 cmp dword ptr [rbp + 0x170], 0
145bd67e2: 0f849b000000 je 0x145bd6883
145bd67e8: b8ed000000 mov eax, 0xed
145bd67ed: 488d0d94806c01 lea rcx, [rip + 0x16c8094]
145bd67f4: baa4000000 mov edx, 0xa4
145bd67f9: 0f57c0 xorps xmm0, xmm0
145bd67fc: 448b8d70010000 mov r9d, dword ptr [rbp + 0x170]
145bd6803: eb11 jmp 0x145bd6816
145bd6805: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
145bd6810: 4805f0000000 add rax, 0xf0
145bd6816: 44398c0853ffffff cmp dword ptr [rax + rcx - 0xad], r9d
145bd681e: 7527 jne 0x145bd6847
145bd6820: 807c088700 cmp byte ptr [rax + rcx - 0x79], 0
145bd6825: 7520 jne 0x145bd6847
145bd6827: 440fb6440888 movzx r8d, byte ptr [rax + rcx - 0x78]
145bd682d: 4183f807 cmp r8d, 7
145bd6831: 7714 ja 0x145bd6847
145bd6833: 440fa3c2 bt edx, r8d
145bd6837: 730e jae 0x145bd6847
145bd6839: f30f108c0857ffffff movss xmm1, dword ptr [rax + rcx - 0xa9]
145bd6842: 0f2ec8 ucomiss xmm1, xmm0
145bd6845: 7732 ja 0x145bd6879
145bd6847: 483d6d350000 cmp rax, 0x356d
145bd684d: 7441 je 0x145bd6890
145bd684f: 44394c08cb cmp dword ptr [rax + rcx - 0x35], r9d
145bd6854: 75ba jne 0x145bd6810
145bd6856: 807c08ff00 cmp byte ptr [rax + rcx - 1], 0
145bd685b: 75b3 jne 0x145bd6810
145bd685d: 440fb60408 movzx r8d, byte ptr [rax + rcx]
145bd6862: 4183f807 cmp r8d, 7
145bd6866: 77a8 ja 0x145bd6810
145bd6868: 440fa3c2 bt edx, r8d
145bd686c: 73a2 jae 0x145bd6810
145bd686e: f30f104c08cf movss xmm1, dword ptr [rax + rcx - 0x31]
145bd6874: 0f2ec8 ucomiss xmm1, xmm0
145bd6877: 7697 jbe 0x145bd6810
145bd6879: b001 mov al, 1
145bd687b: 898558010000 mov dword ptr [rbp + 0x158], eax
145bd6881: eb17 jmp 0x145bd689a
145bd6883: b001 mov al, 1
145bd6885: 898558010000 mov dword ptr [rbp + 0x158], eax
145bd688b: 4531f6 xor r14d, r14d
145bd688e: eb3e jmp 0x145bd68ce
145bd6890: c7855801000000000000 mov dword ptr [rbp + 0x158], 0
145bd689a: 4531f6 xor r14d, r14d
145bd689d: 8b9d70010000 mov ebx, dword ptr [rbp + 0x170]
145bd68a3: 81fba63e0000 cmp ebx, 0x3ea6
145bd68a9: 741e je 0x145bd68c9
145bd68ab: 81fb6a370000 cmp ebx, 0x376a
145bd68b1: 740f je 0x145bd68c2
145bd68b3: 81fbbc140000 cmp ebx, 0x14bc
145bd68b9: 7513 jne 0x145bd68ce
145bd68bb: bba7500000 mov ebx, 0x50a7
145bd68c0: eb0c jmp 0x145bd68ce
145bd68c2: bb32080000 mov ebx, 0x832
145bd68c7: eb05 jmp 0x145bd68ce
145bd68c9: bb9d200000 mov ebx, 0x209d
145bd68ce: 4c8bbd78010000 mov r15, qword ptr [rbp + 0x178]
145bd68d5: 498bb740070000 mov rsi, qword ptr [r15 + 0x740]
145bd68dc: 493bb730070000 cmp rsi, qword ptr [r15 + 0x730]
145bd68e3: 750c jne 0x145bd68f1
145bd68e5: 498d8f30070000 lea rcx, [r15 + 0x730]
145bd68ec: e80fde3e00 call 0x145fc4700
145bd68f1: 498b8738070000 mov rax, qword ptr [r15 + 0x738]
145bd68f8: 488d0c76 lea rcx, [rsi + rsi*2]
145bd68fc: 8b9560010000 mov edx, dword ptr [rbp + 0x160]
145bd6902: 891488 mov dword ptr [rax + rcx*4], edx
145bd6905: 895c8804 mov dword ptr [rax + rcx*4 + 4], ebx
145bd6909: 0fb695a0020000 movzx edx, byte ptr [rbp + 0x2a0]
145bd6910: 88548808 mov byte ptr [rax + rcx*4 + 8], dl
145bd6914: 4488748809 mov byte ptr [rax + rcx*4 + 9], r14b
145bd6919: 8b9558010000 mov edx, dword ptr [rbp + 0x158]
145bd691f: 8854880a mov byte ptr [rax + rcx*4 + 0xa], dl
145bd6923: 48ffc6 inc rsi
145bd6926: 4989b740070000 mov qword ptr [r15 + 0x740], rsi
145bd692d: 4180bf850c000001 cmp byte ptr [r15 + 0xc85], 1
145bd6935: 0f8534010000 jne 0x145bd6a6f
145bd693b: 4489add8000000 mov dword ptr [rbp + 0xd8], r13d
145bd6942: 488b9578010000 mov rdx, qword ptr [rbp + 0x178]
145bd6949: 4c8baaa00a0000 mov r13, qword ptr [rdx + 0xaa0]
145bd6950: 4e8d3ced00000000 lea r15, [r13*8]
145bd6958: 4c89e8 mov rax, r13
145bd695b: 48c1e83d shr rax, 0x3d
145bd695f: 0f95c0 setne al
145bd6962: 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
145bd696c: 4939cf cmp r15, rcx
145bd696f: 0f97c1 seta cl
145bd6972: 08c1 or cl, al
145bd6974: 740c je 0x145bd6982
145bd6976: 31c9 xor ecx, ecx
145bd6978: 4c89fa mov rdx, r15
145bd697b: e83b435600 call 0x14613acbb
145bd6980: 0f0b ud2
145bd6982: 488b92980a0000 mov rdx, qword ptr [rdx + 0xa98]
145bd6989: 4d85ff test r15, r15
145bd698c: 7436 je 0x145bd69c4
145bd698e: 488995a8000000 mov qword ptr [rbp + 0xa8], rdx
145bd6995: e866b842fa call 0x140002200
145bd699a: ba04000000 mov edx, 4
145bd699f: 4c89f9 mov rcx, r15
145bd69a2: e819b842fa call 0x1400021c0
145bd69a7: b904000000 mov ecx, 4
145bd69ac: 4885c0 test rax, rax
145bd69af: 74c7 je 0x145bd6978
145bd69b1: 4889c6 mov rsi, rax
145bd69b4: 4c89ad38010000 mov qword ptr [rbp + 0x138], r13
145bd69bb: 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
145bd69c2: eb10 jmp 0x145bd69d4
145bd69c4: be04000000 mov esi, 4
145bd69c9: 48c7853801000000000000 mov qword ptr [rbp + 0x138], 0
145bd69d4: 4d85ed test r13, r13
145bd69d7: 740b je 0x145bd69e4
145bd69d9: 4889f1 mov rcx, rsi
145bd69dc: 4d89f8 mov r8, r15
145bd69df: e8f7d23b00 call 0x145f93cdb
145bd69e4: 4889b5a8000000 mov qword ptr [rbp + 0xa8], rsi
145bd69eb: 4c8bbd78010000 mov r15, qword ptr [rbp + 0x178]
145bd69f2: 498bb7b80a0000 mov rsi, qword ptr [r15 + 0xab8]
145bd69f9: 493bb7a80a0000 cmp rsi, qword ptr [r15 + 0xaa8]
145bd6a00: 750d jne 0x145bd6a0f
145bd6a02: 498d8fa80a0000 lea rcx, [r15 + 0xaa8]
145bd6a09: e892da3b00 call 0x145f944a0
145bd6a0e: 90 nop
145bd6a0f: 498b87b00a0000 mov rax, qword ptr [r15 + 0xab0]
145bd6a16: 488d0cb6 lea rcx, [rsi + rsi*4]
145bd6a1a: 488b9538010000 mov rdx, qword ptr [rbp + 0x138]
145bd6a21: 488914c8 mov qword ptr [rax + rcx*8], rdx
145bd6a25: 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
145bd6a2c: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145bd6a31: 4c896cc810 mov qword ptr [rax + rcx*8 + 0x10], r13
145bd6a36: 8b9560010000 mov edx, dword ptr [rbp + 0x160]
145bd6a3c: 8954c818 mov dword ptr [rax + rcx*8 + 0x18], edx
145bd6a40: 895cc81c mov dword ptr [rax + rcx*8 + 0x1c], ebx
145bd6a44: 0fb695a0020000 movzx edx, byte ptr [rbp + 0x2a0]
145bd6a4b: 8854c820 mov byte ptr [rax + rcx*8 + 0x20], dl
145bd6a4f: 448874c821 mov byte ptr [rax + rcx*8 + 0x21], r14b
145bd6a54: 8b9558010000 mov edx, dword ptr [rbp + 0x158]
145bd6a5a: 8854c822 mov byte ptr [rax + rcx*8 + 0x22], dl
145bd6a5e: 48ffc6 inc rsi
145bd6a61: 4989b7b80a0000 mov qword ptr [r15 + 0xab8], rsi
145bd6a68: 448badd8000000 mov r13d, dword ptr [rbp + 0xd8]

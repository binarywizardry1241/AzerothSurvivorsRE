140284915 e8e6d8d7ff call 0x140002200
14028491a b948010000 mov ecx, 0x148
14028491f ba08000000 mov edx, 8
140284924 e897d8d7ff call 0x1400021c0
140284929 4885c0 test rax, rax
14028492c 0f840f050000 je 0x140284e41
140284932 c70000000000 mov dword ptr [rax], 0
140284938 c6400400 mov byte ptr [rax + 4], 0
14028493c 48c78018010000ffffffff mov qword ptr [rax + 0x118], 0xffffffffffffffff
140284947 4c8d0542cfb605 lea r8, [rip + 0x5b6cf42]
14028494e 488d8da00f0000 lea rcx, [rbp + 0xfa0]
140284955 4889c2 mov rdx, rax
140284958 e8d3b2b904 call 0x144e1fc30
14028495d 90 nop
14028495e e89dd8d7ff call 0x140002200
140284963 b90c000000 mov ecx, 0xc
140284968 ba04000000 mov edx, 4
14028496d e84ed8d7ff call 0x1400021c0
140284972 4885c0 test rax, rax
140284975 0f84d8040000 je 0x140284e53
14028497b c70000000000 mov dword ptr [rax], 0
140284981 c6400400 mov byte ptr [rax + 4], 0
140284985 c6400800 mov byte ptr [rax + 8], 0
140284989 4c8d05f8d0b605 lea r8, [rip + 0x5b6d0f8]
140284990 488d4da0 lea rcx, [rbp - 0x60]
140284994 4889c2 mov rdx, rax
140284997 e894b2b904 call 0x144e1fc30
14028499c 90 nop
14028499d 0f1085580f0000 movups xmm0, xmmword ptr [rbp + 0xf58]
1402849a4 488b8520100000 mov rax, qword ptr [rbp + 0x1020]
1402849ab 0f114060 movups xmmword ptr [rax + 0x60], xmm0
1402849af 0f1085480f0000 movups xmm0, xmmword ptr [rbp + 0xf48]
1402849b6 0f114050 movups xmmword ptr [rax + 0x50], xmm0
1402849ba 0f1085380f0000 movups xmm0, xmmword ptr [rbp + 0xf38]
1402849c1 0f114040 movups xmmword ptr [rax + 0x40], xmm0
1402849c5 0f1085f80e0000 movups xmm0, xmmword ptr [rbp + 0xef8]
1402849cc 0f108d080f0000 movups xmm1, xmmword ptr [rbp + 0xf08]
1402849d3 0f1095180f0000 movups xmm2, xmmword ptr [rbp + 0xf18]
1402849da 0f109d280f0000 movups xmm3, xmmword ptr [rbp + 0xf28]
1402849e1 0f115830 movups xmmword ptr [rax + 0x30], xmm3
1402849e5 0f115020 movups xmmword ptr [rax + 0x20], xmm2
1402849e9 0f114810 movups xmmword ptr [rax + 0x10], xmm1
1402849ed 0f1100 movups xmmword ptr [rax], xmm0
1402849f0 0f1085a00f0000 movups xmm0, xmmword ptr [rbp + 0xfa0]
1402849f7 0f108db00f0000 movups xmm1, xmmword ptr [rbp + 0xfb0]
1402849fe 0f1095c00f0000 movups xmm2, xmmword ptr [rbp + 0xfc0]
140284a05 0f109dd00f0000 movups xmm3, xmmword ptr [rbp + 0xfd0]
140284a0c 0f114070 movups xmmword ptr [rax + 0x70], xmm0
140284a10 0f118880000000 movups xmmword ptr [rax + 0x80], xmm1
140284a17 0f119090000000 movups xmmword ptr [rax + 0x90], xmm2
140284a1e 0f1198a0000000 movups xmmword ptr [rax + 0xa0], xmm3
140284a25 0f1085e00f0000 movups xmm0, xmmword ptr [rbp + 0xfe0]
140284a2c 0f1180b0000000 movups xmmword ptr [rax + 0xb0], xmm0
140284a33 0f1085f00f0000 movups xmm0, xmmword ptr [rbp + 0xff0]
140284a3a 0f1180c0000000 movups xmmword ptr [rax + 0xc0], xmm0
140284a41 0f108500100000 movups xmm0, xmmword ptr [rbp + 0x1000]
140284a48 0f1180d0000000 movups xmmword ptr [rax + 0xd0], xmm0
140284a4f 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140284a53 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140284a57 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140284a5b 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140284a5f 0f1180e0000000 movups xmmword ptr [rax + 0xe0], xmm0
140284a66 0f1188f0000000 movups xmmword ptr [rax + 0xf0], xmm1
140284a6d 0f119000010000 movups xmmword ptr [rax + 0x100], xmm2
140284a74 0f119810010000 movups xmmword ptr [rax + 0x110], xmm3
140284a7b 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140284a7f 0f118020010000 movups xmmword ptr [rax + 0x120], xmm0
140284a86 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140284a8a 0f118030010000 movups xmmword ptr [rax + 0x130], xmm0
140284a91 0f104500 movups xmm0, xmmword ptr [rbp]
140284a95 0f118040010000 movups xmmword ptr [rax + 0x140], xmm0
140284a9c 48c745a803000000 mov qword ptr [rbp - 0x58], 3
140284aa4 488945b0 mov qword ptr [rbp - 0x50], rax
140284aa8 48c745b803000000 mov qword ptr [rbp - 0x48], 3
140284ab0 48c745c000000000 mov qword ptr [rbp - 0x40], 0
140284ab8 48c745c808000000 mov qword ptr [rbp - 0x38], 8
140284ac0 0f57c0 xorps xmm0, xmm0
140284ac3 0f1145d0 movups xmmword ptr [rbp - 0x30], xmm0
140284ac7 48c745a0ffffffff mov qword ptr [rbp - 0x60], 0xffffffffffffffff
140284acf 488d4dd8 lea rcx, [rbp - 0x28]
140284ad3 e83874c104 call 0x144e9bf10
140284ad8 90 nop
140284ad9 0f104500 movups xmm0, xmmword ptr [rbp]
140284add 0f298500100000 movaps xmmword ptr [rbp + 0x1000], xmm0
140284ae4 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
140284ae8 0f2985f00f0000 movaps xmmword ptr [rbp + 0xff0], xmm0
140284aef 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
140284af3 0f2985e00f0000 movaps xmmword ptr [rbp + 0xfe0], xmm0
140284afa 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
140284afe 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
140284b02 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
140284b06 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
140284b0a 0f299dd00f0000 movaps xmmword ptr [rbp + 0xfd0], xmm3
140284b11 0f2995c00f0000 movaps xmmword ptr [rbp + 0xfc0], xmm2
140284b18 0f298db00f0000 movaps xmmword ptr [rbp + 0xfb0], xmm1
140284b1f 0f2985a00f0000 movaps xmmword ptr [rbp + 0xfa0], xmm0
140284b26 488b0d73ebdf07 mov rcx, qword ptr [rip + 0x7dfeb73]
140284b2d 4c8d0544bab505 lea r8, [rip + 0x5b5ba44]
140284b34 488d952f100000 lea rdx, [rbp + 0x102f]
140284b3b e82028e7ff call 0x1400f7360
140284b40 90 nop
140284b41 4989d0 mov r8, rdx
140284b44 488d8da00f0000 lea rcx, [rbp + 0xfa0]
140284b4b 4889c2 mov rdx, rax
140284b4e e8fd88ebff call 0x14013d450
140284b53 90 nop
140284b54 0f288500100000 movaps xmm0, xmmword ptr [rbp + 0x1000]
140284b5b 0f294500 movaps xmmword ptr [rbp], xmm0
140284b5f 0f2885f00f0000 movaps xmm0, xmmword ptr [rbp + 0xff0]
140284b66 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140284b6a 0f2885e00f0000 movaps xmm0, xmmword ptr [rbp + 0xfe0]
140284b71 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
140284b75 0f2885a00f0000 movaps xmm0, xmmword ptr [rbp + 0xfa0]
140284b7c 0f288db00f0000 movaps xmm1, xmmword ptr [rbp + 0xfb0]
140284b83 0f2895c00f0000 movaps xmm2, xmmword ptr [rbp + 0xfc0]
140284b8a 0f289dd00f0000 movaps xmm3, xmmword ptr [rbp + 0xfd0]
140284b91 0f295dd0 movaps xmmword ptr [rbp - 0x30], xmm3
140284b95 0f2955c0 movaps xmmword ptr [rbp - 0x40], xmm2
140284b99 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
140284b9d 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
140284ba1 488d55a0 lea rdx, [rbp - 0x60]
140284ba5 4c89f1 mov rcx, r14
140284ba8 e883f5e2ff call 0x1400b4130

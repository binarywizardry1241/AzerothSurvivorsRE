14028477d 48c745a80b000000 mov qword ptr [rbp - 0x58], 0xb
140284785 488945b0 mov qword ptr [rbp - 0x50], rax
140284789 48c745b80b000000 mov qword ptr [rbp - 0x48], 0xb
140284791 48c745c000000000 mov qword ptr [rbp - 0x40], 0
140284799 48c745c808000000 mov qword ptr [rbp - 0x38], 8
1402847a1 0f57c0 xorps xmm0, xmm0
1402847a4 0f1145d0 movups xmmword ptr [rbp - 0x30], xmm0
1402847a8 48c745a0ffffffff mov qword ptr [rbp - 0x60], 0xffffffffffffffff
1402847b0 488d4dd8 lea rcx, [rbp - 0x28]
1402847b4 e85777c104 call 0x144e9bf10
1402847b9 90 nop
1402847ba 0f104500 movups xmm0, xmmword ptr [rbp]
1402847be 0f298500100000 movaps xmmword ptr [rbp + 0x1000], xmm0
1402847c5 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
1402847c9 0f2985f00f0000 movaps xmmword ptr [rbp + 0xff0], xmm0
1402847d0 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
1402847d4 0f2985e00f0000 movaps xmmword ptr [rbp + 0xfe0], xmm0
1402847db 0f1045a0 movups xmm0, xmmword ptr [rbp - 0x60]
1402847df 0f104db0 movups xmm1, xmmword ptr [rbp - 0x50]
1402847e3 0f1055c0 movups xmm2, xmmword ptr [rbp - 0x40]
1402847e7 0f105dd0 movups xmm3, xmmword ptr [rbp - 0x30]
1402847eb 0f299dd00f0000 movaps xmmword ptr [rbp + 0xfd0], xmm3
1402847f2 0f2995c00f0000 movaps xmmword ptr [rbp + 0xfc0], xmm2
1402847f9 0f298db00f0000 movaps xmmword ptr [rbp + 0xfb0], xmm1
140284800 0f2985a00f0000 movaps xmmword ptr [rbp + 0xfa0], xmm0
140284807 488b0d92eedf07 mov rcx, qword ptr [rip + 0x7dfee92]
14028480e 4c8d05d389b505 lea r8, [rip + 0x5b589d3]
140284815 488d952f100000 lea rdx, [rbp + 0x102f]
14028481c e83f2be7ff call 0x1400f7360
140284821 90 nop
140284822 4989d0 mov r8, rdx
140284825 488d8da00f0000 lea rcx, [rbp + 0xfa0]
14028482c 4889c2 mov rdx, rax
14028482f e81c8cebff call 0x14013d450
140284834 90 nop
140284835 0f288500100000 movaps xmm0, xmmword ptr [rbp + 0x1000]
14028483c 0f294500 movaps xmmword ptr [rbp], xmm0
140284840 0f2885f00f0000 movaps xmm0, xmmword ptr [rbp + 0xff0]
140284847 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
14028484b 0f2885e00f0000 movaps xmm0, xmmword ptr [rbp + 0xfe0]
140284852 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
140284856 0f2885a00f0000 movaps xmm0, xmmword ptr [rbp + 0xfa0]
14028485d 0f288db00f0000 movaps xmm1, xmmword ptr [rbp + 0xfb0]
140284864 0f2895c00f0000 movaps xmm2, xmmword ptr [rbp + 0xfc0]
14028486b 0f289dd00f0000 movaps xmm3, xmmword ptr [rbp + 0xfd0]
140284872 0f295dd0 movaps xmmword ptr [rbp - 0x30], xmm3
140284876 0f2955c0 movaps xmmword ptr [rbp - 0x40], xmm2
14028487a 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
14028487e 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
140284882 488d55a0 lea rdx, [rbp - 0x60]
140284886 4c89f1 mov rcx, r14
140284889 e8a2f8e2ff call 0x1400b4130

1458a1730 55 push rbp
1458a1731 4157 push r15
1458a1733 4156 push r14
1458a1735 4155 push r13
1458a1737 4154 push r12
1458a1739 56 push rsi
1458a173a 57 push rdi
1458a173b 53 push rbx
1458a173c 4881ece8000000 sub rsp, 0xe8
1458a1743 488dac2480000000 lea rbp, [rsp + 0x80]
1458a174b 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
1458a174f 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
1458a1757 4889d7 mov rdi, rdx
1458a175a 4989cd mov r13, rcx
1458a175d 4c8b32 mov r14, qword ptr [rdx]
1458a1760 4c8b7a08 mov r15, qword ptr [rdx + 8]
1458a1764 48c7453000000000 mov qword ptr [rbp + 0x30], 0
1458a176c 48c7453808000000 mov qword ptr [rbp + 0x38], 8
1458a1774 48c7454000000000 mov qword ptr [rbp + 0x40], 0
1458a177c 0fb64275 movzx eax, byte ptr [rdx + 0x75]
1458a1780 488d0d49473601 lea rcx, [rip + 0x1364749]
1458a1787 48630481 movsxd rax, dword ptr [rcx + rax*4]
1458a178b 4801c8 add rax, rcx
1458a178e ffe0 jmp rax
1458a1790 837f5400 cmp dword ptr [rdi + 0x54], 0
1458a1794 0f84910a0000 je 0x1458a222b
1458a179a 488d4d30 lea rcx, [rbp + 0x30]
1458a179e e81d4e3700 call 0x145c165c0
1458a17a3 90 nop
1458a17a4 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a17a8 c60025 mov byte ptr [rax], 0x25
1458a17ab c6400801 mov byte ptr [rax + 8], 1
1458a17af 4c897010 mov qword ptr [rax + 0x10], r14
1458a17b3 4c897818 mov qword ptr [rax + 0x18], r15
1458a17b7 c740200000803f mov dword ptr [rax + 0x20], 0x3f800000
1458a17be c6402402 mov byte ptr [rax + 0x24], 2
1458a17c2 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a17ca be01000000 mov esi, 1
1458a17cf 48837d3001 cmp qword ptr [rbp + 0x30], 1
1458a17d4 0f84530a0000 je 0x1458a222d
1458a17da e9580a0000 jmp 0x1458a2237
1458a17df 488d4d30 lea rcx, [rbp + 0x30]
1458a17e3 e8d84d3700 call 0x145c165c0
1458a17e8 90 nop
1458a17e9 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a17ed c60025 mov byte ptr [rax], 0x25
1458a17f0 c6400801 mov byte ptr [rax + 8], 1
1458a17f4 4c897010 mov qword ptr [rax + 0x10], r14
1458a17f8 4c897818 mov qword ptr [rax + 0x18], r15
1458a17fc c740209a99193f mov dword ptr [rax + 0x20], 0x3f19999a
1458a1803 c6402400 mov byte ptr [rax + 0x24], 0
1458a1807 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a180f 488b4730 mov rax, qword ptr [rdi + 0x30]
1458a1813 488b4f38 mov rcx, qword ptr [rdi + 0x38]
1458a1817 31d2 xor edx, edx
1458a1819 0f1f8000000000 nop dword ptr [rax]
1458a1820 4839d1 cmp rcx, rdx
1458a1823 0f84b2080000 je 0x1458a20db
1458a1829 803c1003 cmp byte ptr [rax + rdx], 3
1458a182d 488d5201 lea rdx, [rdx + 1]
1458a1831 75ed jne 0x1458a1820
1458a1833 48837d3001 cmp qword ptr [rbp + 0x30], 1
1458a1838 750a jne 0x1458a1844
1458a183a 488d4d30 lea rcx, [rbp + 0x30]
1458a183e e87d4d3700 call 0x145c165c0
1458a1843 90 nop
1458a1844 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1848 c6404025 mov byte ptr [rax + 0x40], 0x25
1458a184c c6404801 mov byte ptr [rax + 0x48], 1
1458a1850 4c897050 mov qword ptr [rax + 0x50], r14
1458a1854 4c897858 mov qword ptr [rax + 0x58], r15
1458a1858 c74060cdcccc3e mov dword ptr [rax + 0x60], 0x3ecccccd
1458a185f c6406403 mov byte ptr [rax + 0x64], 3
1458a1863 48c7454002000000 mov qword ptr [rbp + 0x40], 2
1458a186b bb02000000 mov ebx, 2
1458a1870 e96b080000 jmp 0x1458a20e0
1458a1875 837f5400 cmp dword ptr [rdi + 0x54], 0
1458a1879 0f8416090000 je 0x1458a2195
1458a187f 488d4d30 lea rcx, [rbp + 0x30]
1458a1883 e8384d3700 call 0x145c165c0
1458a1888 90 nop
1458a1889 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a188d c60025 mov byte ptr [rax], 0x25
1458a1890 c6400801 mov byte ptr [rax + 8], 1
1458a1894 4c897010 mov qword ptr [rax + 0x10], r14
1458a1898 4c897818 mov qword ptr [rax + 0x18], r15
1458a189c c7402000008040 mov dword ptr [rax + 0x20], 0x40800000
1458a18a3 c6402402 mov byte ptr [rax + 0x24], 2
1458a18a7 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a18af be01000000 mov esi, 1
1458a18b4 48837d3001 cmp qword ptr [rbp + 0x30], 1
1458a18b9 0f84d8080000 je 0x1458a2197
1458a18bf e9dd080000 jmp 0x1458a21a1
1458a18c4 f30f107758 movss xmm6, dword ptr [rdi + 0x58]
1458a18c9 0f57c0 xorps xmm0, xmm0
1458a18cc 0f2ef0 ucomiss xmm6, xmm0
1458a18cf 0f96c0 setbe al
1458a18d2 448b6768 mov r12d, dword ptr [rdi + 0x68]
1458a18d6 4489e1 mov ecx, r12d
1458a18d9 83e10e and ecx, 0xe
1458a18dc 83f906 cmp ecx, 6
1458a18df 0f94c1 sete cl
1458a18e2 08c1 or cl, al
1458a18e4 0f8509070000 jne 0x1458a1ff3
1458a18ea 4183fc0d cmp r12d, 0xd
1458a18ee 7715 ja 0x1458a1905
1458a18f0 b800270000 mov eax, 0x2700
1458a18f5 440fa3e0 bt eax, r12d
1458a18f9 730a jae 0x1458a1905
1458a18fb 0f2e7748 ucomiss xmm6, dword ptr [rdi + 0x48]
1458a18ff 0f83ee060000 jae 0x1458a1ff3
1458a1905 488d4d30 lea rcx, [rbp + 0x30]
1458a1909 e8b24c3700 call 0x145c165c0
1458a190e 90 nop
1458a190f 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1913 c60025 mov byte ptr [rax], 0x25
1458a1916 c6400801 mov byte ptr [rax + 8], 1
1458a191a 4c897010 mov qword ptr [rax + 0x10], r14
1458a191e 4c897818 mov qword ptr [rax + 0x18], r15
1458a1922 c740200000803f mov dword ptr [rax + 0x20], 0x3f800000
1458a1929 c6402404 mov byte ptr [rax + 0x24], 4
1458a192d 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1935 bb01000000 mov ebx, 1
1458a193a e9b6060000 jmp 0x1458a1ff5
1458a193f 488d4d30 lea rcx, [rbp + 0x30]
1458a1943 e8784c3700 call 0x145c165c0
1458a1948 90 nop
1458a1949 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a194d c60025 mov byte ptr [rax], 0x25
1458a1950 c6400801 mov byte ptr [rax + 8], 1
1458a1954 4c897010 mov qword ptr [rax + 0x10], r14
1458a1958 4c897818 mov qword ptr [rax + 0x18], r15
1458a195c c740209a99193f mov dword ptr [rax + 0x20], 0x3f19999a
1458a1963 c6402403 mov byte ptr [rax + 0x24], 3
1458a1967 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a196f 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1973 4883f901 cmp rcx, 1
1458a1977 750e jne 0x1458a1987
1458a1979 488d4d30 lea rcx, [rbp + 0x30]
1458a197d e83e4c3700 call 0x145c165c0
1458a1982 90 nop
1458a1983 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1987 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a198b c6404025 mov byte ptr [rax + 0x40], 0x25
1458a198f c6404801 mov byte ptr [rax + 0x48], 1
1458a1993 4c897050 mov qword ptr [rax + 0x50], r14
1458a1997 4c897858 mov qword ptr [rax + 0x58], r15
1458a199b c740603333b33e mov dword ptr [rax + 0x60], 0x3eb33333
1458a19a2 c6406400 mov byte ptr [rax + 0x64], 0
1458a19a6 48c7454002000000 mov qword ptr [rbp + 0x40], 2
1458a19ae 4883f902 cmp rcx, 2
1458a19b2 750e jne 0x1458a19c2
1458a19b4 488d4d30 lea rcx, [rbp + 0x30]
1458a19b8 e8034c3700 call 0x145c165c0
1458a19bd 90 nop
1458a19be 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a19c2 c6808000000008 mov byte ptr [rax + 0x80], 8
1458a19c9 48b90000803f03000000 movabs rcx, 0x33f800000
1458a19d3 48898884000000 mov qword ptr [rax + 0x84], rcx
1458a19da c7808c0000000000c03f mov dword ptr [rax + 0x8c], 0x3fc00000
1458a19e4 c7809800000000000000 mov dword ptr [rax + 0x98], 0
1458a19ee c680a000000001 mov byte ptr [rax + 0xa0], 1
1458a19f5 4c89b0a8000000 mov qword ptr [rax + 0xa8], r14
1458a19fc 4c89b8b0000000 mov qword ptr [rax + 0xb0], r15
1458a1a03 48c7454003000000 mov qword ptr [rbp + 0x40], 3
1458a1a0b 837f680b cmp dword ptr [rdi + 0x68], 0xb
1458a1a0f 754a jne 0x1458a1a5b
1458a1a11 48837d3003 cmp qword ptr [rbp + 0x30], 3
1458a1a16 750e jne 0x1458a1a26
1458a1a18 488d4d30 lea rcx, [rbp + 0x30]
1458a1a1c e89f4b3700 call 0x145c165c0
1458a1a21 90 nop
1458a1a22 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1a26 c680c000000025 mov byte ptr [rax + 0xc0], 0x25
1458a1a2d c680c800000001 mov byte ptr [rax + 0xc8], 1
1458a1a34 4c89b0d0000000 mov qword ptr [rax + 0xd0], r14
1458a1a3b 4c89b8d8000000 mov qword ptr [rax + 0xd8], r15
1458a1a42 c780e00000003333b33e mov dword ptr [rax + 0xe0], 0x3eb33333
1458a1a4c c680e400000006 mov byte ptr [rax + 0xe4], 6
1458a1a53 48c7454004000000 mov qword ptr [rbp + 0x40], 4
1458a1a5b 488d1d5bd73501 lea rbx, [rip + 0x135d75b]
1458a1a62 be18000000 mov esi, 0x18
1458a1a67 ba18000000 mov edx, 0x18
1458a1a6c 4889d9 mov rcx, rbx
1458a1a6f e85cc30e00 call 0x14598ddd0
1458a1a74 90 nop
1458a1a75 4885c0 test rax, rax
1458a1a78 480f44d6 cmove rdx, rsi
1458a1a7c 480f45d8 cmovne rbx, rax
1458a1a80 be20000000 mov esi, 0x20
1458a1a85 488d0549d73501 lea rax, [rip + 0x135d749]
1458a1a8c e909110000 jmp 0x1458a2b9a
1458a1a91 488d4d30 lea rcx, [rbp + 0x30]
1458a1a95 e8264b3700 call 0x145c165c0
1458a1a9a 90 nop
1458a1a9b 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1a9f c60025 mov byte ptr [rax], 0x25
1458a1aa2 c6400801 mov byte ptr [rax + 8], 1
1458a1aa6 4c897010 mov qword ptr [rax + 0x10], r14
1458a1aaa 4c897818 mov qword ptr [rax + 0x18], r15
1458a1aae c740200000003f mov dword ptr [rax + 0x20], 0x3f000000
1458a1ab5 c6402403 mov byte ptr [rax + 0x24], 3
1458a1ab9 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1ac1 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1ac5 4883f901 cmp rcx, 1
1458a1ac9 750e jne 0x1458a1ad9
1458a1acb 488d4d30 lea rcx, [rbp + 0x30]
1458a1acf e8ec4a3700 call 0x145c165c0
1458a1ad4 90 nop
1458a1ad5 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1ad9 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1add c6404025 mov byte ptr [rax + 0x40], 0x25
1458a1ae1 c6404801 mov byte ptr [rax + 0x48], 1
1458a1ae5 4c897050 mov qword ptr [rax + 0x50], r14
1458a1ae9 4c897858 mov qword ptr [rax + 0x58], r15
1458a1aed c740600000803f mov dword ptr [rax + 0x60], 0x3f800000
1458a1af4 c6406404 mov byte ptr [rax + 0x64], 4
1458a1af8 48c7454002000000 mov qword ptr [rbp + 0x40], 2
1458a1b00 4883f902 cmp rcx, 2
1458a1b04 7512 jne 0x1458a1b18
1458a1b06 488d4d30 lea rcx, [rbp + 0x30]
1458a1b0a e8b14a3700 call 0x145c165c0
1458a1b0f 90 nop
1458a1b10 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1b14 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1b18 c6808000000025 mov byte ptr [rax + 0x80], 0x25
1458a1b1f c6808800000001 mov byte ptr [rax + 0x88], 1
1458a1b26 4c89b090000000 mov qword ptr [rax + 0x90], r14
1458a1b2d 4c89b898000000 mov qword ptr [rax + 0x98], r15
1458a1b34 c780a00000000000003f mov dword ptr [rax + 0xa0], 0x3f000000
1458a1b3e c680a400000000 mov byte ptr [rax + 0xa4], 0
1458a1b45 48c7454003000000 mov qword ptr [rbp + 0x40], 3
1458a1b4d 4883f903 cmp rcx, 3
1458a1b51 750e jne 0x1458a1b61
1458a1b53 488d4d30 lea rcx, [rbp + 0x30]
1458a1b57 e8644a3700 call 0x145c165c0
1458a1b5c 90 nop
1458a1b5d 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1b61 66c780c00000000b00 mov word ptr [rax + 0xc0], 0xb
1458a1b6a f20f1005fed23501 movsd xmm0, qword ptr [rip + 0x135d2fe]
1458a1b72 f20f1180c4000000 movsd qword ptr [rax + 0xc4], xmm0
1458a1b7a 48b9692b000002000000 movabs rcx, 0x200002b69
1458a1b84 488988cc000000 mov qword ptr [rax + 0xcc], rcx
1458a1b8b c680d800000001 mov byte ptr [rax + 0xd8], 1
1458a1b92 4c89b0e0000000 mov qword ptr [rax + 0xe0], r14
1458a1b99 4c89b8e8000000 mov qword ptr [rax + 0xe8], r15
1458a1ba0 48c7454004000000 mov qword ptr [rbp + 0x40], 4
1458a1ba8 488d1d46d63501 lea rbx, [rip + 0x135d646]
1458a1baf be15000000 mov esi, 0x15
1458a1bb4 ba15000000 mov edx, 0x15
1458a1bb9 4889d9 mov rcx, rbx
1458a1bbc e80fc20e00 call 0x14598ddd0
1458a1bc1 90 nop
1458a1bc2 4885c0 test rax, rax
1458a1bc5 480f44d6 cmove rdx, rsi
1458a1bc9 480f45d8 cmovne rbx, rax
1458a1bcd be20000000 mov esi, 0x20
1458a1bd2 488d0531d63501 lea rax, [rip + 0x135d631]
1458a1bd9 e9bc0f0000 jmp 0x1458a2b9a
1458a1bde 488d4d30 lea rcx, [rbp + 0x30]
1458a1be2 e8d9493700 call 0x145c165c0
1458a1be7 90 nop
1458a1be8 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1bec c60025 mov byte ptr [rax], 0x25
1458a1bef c6400801 mov byte ptr [rax + 8], 1
1458a1bf3 4c897010 mov qword ptr [rax + 0x10], r14
1458a1bf7 4c897818 mov qword ptr [rax + 0x18], r15
1458a1bfb c740206666e63e mov dword ptr [rax + 0x20], 0x3ee66666
1458a1c02 c6402400 mov byte ptr [rax + 0x24], 0
1458a1c06 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1c0e 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1c12 4883f901 cmp rcx, 1
1458a1c16 750e jne 0x1458a1c26
1458a1c18 488d4d30 lea rcx, [rbp + 0x30]
1458a1c1c e89f493700 call 0x145c165c0
1458a1c21 90 nop
1458a1c22 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1c26 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1c2a c640400a mov byte ptr [rax + 0x40], 0xa
1458a1c2e c740440000003f mov dword ptr [rax + 0x44], 0x3f000000
1458a1c35 c6404801 mov byte ptr [rax + 0x48], 1
1458a1c39 4c897050 mov qword ptr [rax + 0x50], r14
1458a1c3d 4c897858 mov qword ptr [rax + 0x58], r15
1458a1c41 48c7454002000000 mov qword ptr [rbp + 0x40], 2
1458a1c49 4883f902 cmp rcx, 2
1458a1c4d 750e jne 0x1458a1c5d
1458a1c4f 488d4d30 lea rcx, [rbp + 0x30]
1458a1c53 e868493700 call 0x145c165c0
1458a1c58 90 nop
1458a1c59 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1c5d c6808000000004 mov byte ptr [rax + 0x80], 4
1458a1c64 f20f1005e4d13501 movsd xmm0, qword ptr [rip + 0x135d1e4]
1458a1c6c f20f118084000000 movsd qword ptr [rax + 0x84], xmm0
1458a1c74 0f57c0 xorps xmm0, xmm0
1458a1c77 0f11808c000000 movups xmmword ptr [rax + 0x8c], xmm0
1458a1c7e c680a000000001 mov byte ptr [rax + 0xa0], 1
1458a1c85 4c89b0a8000000 mov qword ptr [rax + 0xa8], r14
1458a1c8c 4c89b8b0000000 mov qword ptr [rax + 0xb0], r15
1458a1c93 48c7454003000000 mov qword ptr [rbp + 0x40], 3
1458a1c9b 488d1d26d63501 lea rbx, [rip + 0x135d626]
1458a1ca2 be13000000 mov esi, 0x13
1458a1ca7 ba13000000 mov edx, 0x13
1458a1cac 4889d9 mov rcx, rbx
1458a1caf e81cc10e00 call 0x14598ddd0
1458a1cb4 90 nop
1458a1cb5 4885c0 test rax, rax
1458a1cb8 480f44d6 cmove rdx, rsi
1458a1cbc 480f45d8 cmovne rbx, rax
1458a1cc0 be20000000 mov esi, 0x20
1458a1cc5 488d050fd63501 lea rax, [rip + 0x135d60f]
1458a1ccc e9c90e0000 jmp 0x1458a2b9a
1458a1cd1 837f5400 cmp dword ptr [rdi + 0x54], 0
1458a1cd5 0f840c060000 je 0x1458a22e7
1458a1cdb 488d4d30 lea rcx, [rbp + 0x30]
1458a1cdf e8dc483700 call 0x145c165c0
1458a1ce4 90 nop
1458a1ce5 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1ce9 c60025 mov byte ptr [rax], 0x25
1458a1cec c6400801 mov byte ptr [rax + 8], 1
1458a1cf0 4c897010 mov qword ptr [rax + 0x10], r14
1458a1cf4 4c897818 mov qword ptr [rax + 0x18], r15
1458a1cf8 c7402000008040 mov dword ptr [rax + 0x20], 0x40800000
1458a1cff c6402402 mov byte ptr [rax + 0x24], 2
1458a1d03 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1d0b be01000000 mov esi, 1
1458a1d10 48837d3001 cmp qword ptr [rbp + 0x30], 1
1458a1d15 0f84ce050000 je 0x1458a22e9
1458a1d1b e9d3050000 jmp 0x1458a22f3
1458a1d20 837f5400 cmp dword ptr [rdi + 0x54], 0
1458a1d24 0f846e060000 je 0x1458a2398
1458a1d2a 488d4d30 lea rcx, [rbp + 0x30]
1458a1d2e e88d483700 call 0x145c165c0
1458a1d33 90 nop
1458a1d34 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1d38 c60025 mov byte ptr [rax], 0x25
1458a1d3b c6400801 mov byte ptr [rax + 8], 1
1458a1d3f 4c897010 mov qword ptr [rax + 0x10], r14
1458a1d43 4c897818 mov qword ptr [rax + 0x18], r15
1458a1d47 c7402000008040 mov dword ptr [rax + 0x20], 0x40800000
1458a1d4e c6402402 mov byte ptr [rax + 0x24], 2
1458a1d52 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1d5a bb01000000 mov ebx, 1
1458a1d5f 48837d3001 cmp qword ptr [rbp + 0x30], 1
1458a1d64 0f8430060000 je 0x1458a239a
1458a1d6a e935060000 jmp 0x1458a23a4
1458a1d6f 837f5400 cmp dword ptr [rdi + 0x54], 0
1458a1d73 0f84be060000 je 0x1458a2437
1458a1d79 488d4d30 lea rcx, [rbp + 0x30]
1458a1d7d e83e483700 call 0x145c165c0
1458a1d82 90 nop
1458a1d83 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1d87 c60025 mov byte ptr [rax], 0x25
1458a1d8a c6400801 mov byte ptr [rax + 8], 1
1458a1d8e 4c897010 mov qword ptr [rax + 0x10], r14
1458a1d92 4c897818 mov qword ptr [rax + 0x18], r15
1458a1d96 c7402000004040 mov dword ptr [rax + 0x20], 0x40400000
1458a1d9d c6402402 mov byte ptr [rax + 0x24], 2
1458a1da1 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1da9 be01000000 mov esi, 1
1458a1dae 48837d3001 cmp qword ptr [rbp + 0x30], 1
1458a1db3 0f8480060000 je 0x1458a2439
1458a1db9 e985060000 jmp 0x1458a2443
1458a1dbe 488d4d30 lea rcx, [rbp + 0x30]
1458a1dc2 e8f9473700 call 0x145c165c0
1458a1dc7 90 nop
1458a1dc8 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1dcc c60025 mov byte ptr [rax], 0x25
1458a1dcf c6400801 mov byte ptr [rax + 8], 1
1458a1dd3 4c897010 mov qword ptr [rax + 0x10], r14
1458a1dd7 4c897818 mov qword ptr [rax + 0x18], r15
1458a1ddb c740200000803f mov dword ptr [rax + 0x20], 0x3f800000
1458a1de2 c6402404 mov byte ptr [rax + 0x24], 4
1458a1de6 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1dee f30f104750 movss xmm0, dword ptr [rdi + 0x50]
1458a1df3 0f57f6 xorps xmm6, xmm6
1458a1df6 0f2ec6 ucomiss xmm0, xmm6
1458a1df9 be01000000 mov esi, 1
1458a1dfe 488b4530 mov rax, qword ptr [rbp + 0x30]
1458a1e02 7640 jbe 0x1458a1e44
1458a1e04 4883f801 cmp rax, 1
1458a1e08 750e jne 0x1458a1e18
1458a1e0a 488d4d30 lea rcx, [rbp + 0x30]
1458a1e0e e8ad473700 call 0x145c165c0
1458a1e13 90 nop
1458a1e14 488b4530 mov rax, qword ptr [rbp + 0x30]
1458a1e18 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1458a1e1c c6414025 mov byte ptr [rcx + 0x40], 0x25
1458a1e20 c6414801 mov byte ptr [rcx + 0x48], 1
1458a1e24 4c897150 mov qword ptr [rcx + 0x50], r14
1458a1e28 4c897958 mov qword ptr [rcx + 0x58], r15
1458a1e2c c741600000003f mov dword ptr [rcx + 0x60], 0x3f000000
1458a1e33 c6416403 mov byte ptr [rcx + 0x64], 3
1458a1e37 48c7454002000000 mov qword ptr [rbp + 0x40], 2
1458a1e3f be02000000 mov esi, 2
1458a1e44 f30f104744 movss xmm0, dword ptr [rdi + 0x44]
1458a1e49 0f2ec6 ucomiss xmm0, xmm6
1458a1e4c 7643 jbe 0x1458a1e91
1458a1e4e 4839c6 cmp rsi, rax
1458a1e51 750a jne 0x1458a1e5d
1458a1e53 488d4d30 lea rcx, [rbp + 0x30]
1458a1e57 e864473700 call 0x145c165c0
1458a1e5c 90 nop
1458a1e5d 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1e61 89f1 mov ecx, esi
1458a1e63 c1e106 shl ecx, 6
1458a1e66 c6040825 mov byte ptr [rax + rcx], 0x25
1458a1e6a c644080801 mov byte ptr [rax + rcx + 8], 1
1458a1e6f 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a1e74 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a1e79 c74408200000003f mov dword ptr [rax + rcx + 0x20], 0x3f000000
1458a1e81 c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a1e86 48ffc6 inc rsi
1458a1e89 48897540 mov qword ptr [rbp + 0x40], rsi
1458a1e8d 488b4530 mov rax, qword ptr [rbp + 0x30]
1458a1e91 4839c6 cmp rsi, rax
1458a1e94 750a jne 0x1458a1ea0
1458a1e96 488d4d30 lea rcx, [rbp + 0x30]
1458a1e9a e821473700 call 0x145c165c0
1458a1e9f 90 nop
1458a1ea0 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1ea4 89f1 mov ecx, esi
1458a1ea6 c1e106 shl ecx, 6
1458a1ea9 c6040816 mov byte ptr [rax + rcx], 0x16
1458a1ead c74408040ad7233c mov dword ptr [rax + rcx + 4], 0x3c23d70a
1458a1eb5 48ffc6 inc rsi
1458a1eb8 48897540 mov qword ptr [rbp + 0x40], rsi
1458a1ebc 488d1dd2d43501 lea rbx, [rip + 0x135d4d2]
1458a1ec3 be16000000 mov esi, 0x16
1458a1ec8 ba16000000 mov edx, 0x16
1458a1ecd 4889d9 mov rcx, rbx
1458a1ed0 e8fbbe0e00 call 0x14598ddd0
1458a1ed5 90 nop
1458a1ed6 4885c0 test rax, rax
1458a1ed9 480f44d6 cmove rdx, rsi
1458a1edd 480f45d8 cmovne rbx, rax
1458a1ee1 be17000000 mov esi, 0x17
1458a1ee6 488d05bed43501 lea rax, [rip + 0x135d4be]
1458a1eed e9a80c0000 jmp 0x1458a2b9a
1458a1ef2 488d4d30 lea rcx, [rbp + 0x30]
1458a1ef6 e8c5463700 call 0x145c165c0
1458a1efb 90 nop
1458a1efc 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1f00 c60025 mov byte ptr [rax], 0x25
1458a1f03 c6400801 mov byte ptr [rax + 8], 1
1458a1f07 4c897010 mov qword ptr [rax + 0x10], r14
1458a1f0b 4c897818 mov qword ptr [rax + 0x18], r15
1458a1f0f c740209a99193f mov dword ptr [rax + 0x20], 0x3f19999a
1458a1f16 c6402403 mov byte ptr [rax + 0x24], 3
1458a1f1a 48c7454001000000 mov qword ptr [rbp + 0x40], 1
1458a1f22 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1f26 4883f901 cmp rcx, 1
1458a1f2a 750e jne 0x1458a1f3a
1458a1f2c 488d4d30 lea rcx, [rbp + 0x30]
1458a1f30 e88b463700 call 0x145c165c0
1458a1f35 90 nop
1458a1f36 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1458a1f3a 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1f3e c6404025 mov byte ptr [rax + 0x40], 0x25
1458a1f42 c6404801 mov byte ptr [rax + 0x48], 1
1458a1f46 4c897050 mov qword ptr [rax + 0x50], r14
1458a1f4a 4c897858 mov qword ptr [rax + 0x58], r15
1458a1f4e c740609a99993e mov dword ptr [rax + 0x60], 0x3e99999a
1458a1f55 c6406400 mov byte ptr [rax + 0x64], 0
1458a1f59 48c7454002000000 mov qword ptr [rbp + 0x40], 2
1458a1f61 4883f902 cmp rcx, 2
1458a1f65 750e jne 0x1458a1f75
1458a1f67 488d4d30 lea rcx, [rbp + 0x30]
1458a1f6b e850463700 call 0x145c165c0
1458a1f70 90 nop
1458a1f71 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a1f75 c6808000000009 mov byte ptr [rax + 0x80], 9
1458a1f7c c780840000006e310000 mov dword ptr [rax + 0x84], 0x316e
1458a1f86 f20f1005b2ce3501 movsd xmm0, qword ptr [rip + 0x135ceb2]
1458a1f8e f20f118088000000 movsd qword ptr [rax + 0x88], xmm0
1458a1f96 c7809000000000000000 mov dword ptr [rax + 0x90], 0
1458a1fa0 c6809800000001 mov byte ptr [rax + 0x98], 1
1458a1fa7 4c89b0a0000000 mov qword ptr [rax + 0xa0], r14
1458a1fae 4c89b8a8000000 mov qword ptr [rax + 0xa8], r15
1458a1fb5 48c7454003000000 mov qword ptr [rbp + 0x40], 3
1458a1fbd 488d1d37d33501 lea rbx, [rip + 0x135d337]
1458a1fc4 be1a000000 mov esi, 0x1a
1458a1fc9 ba1a000000 mov edx, 0x1a
1458a1fce 4889d9 mov rcx, rbx
1458a1fd1 e8fabd0e00 call 0x14598ddd0
1458a1fd6 90 nop
1458a1fd7 4885c0 test rax, rax
1458a1fda 480f44d6 cmove rdx, rsi
1458a1fde 480f45d8 cmovne rbx, rax
1458a1fe2 be17000000 mov esi, 0x17
1458a1fe7 488d0527d33501 lea rax, [rip + 0x135d327]
1458a1fee e9a70b0000 jmp 0x1458a2b9a
1458a1ff3 31db xor ebx, ebx
1458a1ff5 4183fc0d cmp r12d, 0xd
1458a1ff9 774b ja 0x1458a2046
1458a1ffb b8c0200000 mov eax, 0x20c0
1458a2000 440fa3e0 bt eax, r12d
1458a2004 7340 jae 0x1458a2046
1458a2006 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a200a 750a jne 0x1458a2016
1458a200c 488d4d30 lea rcx, [rbp + 0x30]
1458a2010 e8ab453700 call 0x145c165c0
1458a2015 90 nop
1458a2016 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a201a 89d9 mov ecx, ebx
1458a201c c1e106 shl ecx, 6
1458a201f c6040825 mov byte ptr [rax + rcx], 0x25
1458a2023 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a2028 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a202d 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a2032 c74408209a99193f mov dword ptr [rax + rcx + 0x20], 0x3f19999a
1458a203a c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a203f 48ffc3 inc rbx
1458a2042 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a2046 4183fc0d cmp r12d, 0xd
1458a204a 7711 ja 0x1458a205d
1458a204c b800270000 mov eax, 0x2700
1458a2051 440fa3e0 bt eax, r12d
1458a2055 7306 jae 0x1458a205d
1458a2057 0f2e7748 ucomiss xmm6, dword ptr [rdi + 0x48]
1458a205b 7340 jae 0x1458a209d
1458a205d 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a2061 750a jne 0x1458a206d
1458a2063 488d4d30 lea rcx, [rbp + 0x30]
1458a2067 e854453700 call 0x145c165c0
1458a206c 90 nop
1458a206d 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2071 89d9 mov ecx, ebx
1458a2073 c1e106 shl ecx, 6
1458a2076 c6040825 mov byte ptr [rax + rcx], 0x25
1458a207a c644080801 mov byte ptr [rax + rcx + 8], 1
1458a207f 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a2084 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a2089 c74408203333b33e mov dword ptr [rax + rcx + 0x20], 0x3eb33333
1458a2091 c644082401 mov byte ptr [rax + rcx + 0x24], 1
1458a2096 48ffc3 inc rbx
1458a2099 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a209d 498d47f5 lea rax, [r15 - 0xb]
1458a20a1 4883f808 cmp rax, 8
1458a20a5 0f8774070000 ja 0x1458a281f
1458a20ab 488d0d623e3601 lea rcx, [rip + 0x1363e62]
1458a20b2 48630481 movsxd rax, dword ptr [rcx + rax*4]
1458a20b6 4801c8 add rax, rcx
1458a20b9 ffe0 jmp rax
1458a20bb 48b86963655f62617272 movabs rax, 0x727261625f656369
1458a20c5 493306 xor rax, qword ptr [r14]
1458a20c8 48b95f62617272696572 movabs rcx, 0x726569727261625f
1458a20d2 49334e03 xor rcx, qword ptr [r14 + 3]
1458a20d6 e9d3060000 jmp 0x1458a27ae
1458a20db bb01000000 mov ebx, 1
1458a20e0 498d47f7 lea rax, [r15 - 9]
1458a20e4 4883f804 cmp rax, 4
1458a20e8 0f87800a0000 ja 0x1458a2b6e
1458a20ee 488d0d0b3e3601 lea rcx, [rip + 0x1363e0b]
1458a20f5 48630481 movsxd rax, dword ptr [rcx + rax*4]
1458a20f9 4801c8 add rax, rcx
1458a20fc ffe0 jmp rax
1458a20fe 48b8626c6f6f64726167 movabs rax, 0x676172646f6f6c62
1458a2108 493306 xor rax, qword ptr [r14]
1458a210b 410fb64e08 movzx ecx, byte ptr [r14 + 8]
1458a2110 4883f165 xor rcx, 0x65
1458a2114 4809c1 or rcx, rax
1458a2117 0f84ae050000 je 0x1458a26cb
1458a211d 48b87365616c5f666174 movabs rax, 0x7461665f6c616573
1458a2127 493306 xor rax, qword ptr [r14]
1458a212a 410fb64e08 movzx ecx, byte ptr [r14 + 8]
1458a212f 4883f165 xor rcx, 0x65
1458a2133 4809c1 or rcx, rax
1458a2136 0f84ee090000 je 0x1458a2b2a
1458a213c 48b8736f756c5f666972 movabs rax, 0x7269665f6c756f73
1458a2146 493306 xor rax, qword ptr [r14]
1458a2149 410fb64e08 movzx ecx, byte ptr [r14 + 8]
1458a214e 4883f165 xor rcx, 0x65
1458a2152 4809c1 or rcx, rax
1458a2155 0f84cf090000 je 0x1458a2b2a
1458a215b 48b86c6967687477656c movabs rax, 0x6c6577746867696c
1458a2165 493306 xor rax, qword ptr [r14]
1458a2168 410fb64e08 movzx ecx, byte ptr [r14 + 8]
1458a216d 4883f16c xor rcx, 0x6c
1458a2171 4809c1 or rcx, rax
1458a2174 0f84070c0000 je 0x1458a2d81
1458a217a 48b8706f6c796d6f7270 movabs rax, 0x70726f6d796c6f70
1458a2184 493306 xor rax, qword ptr [r14]
1458a2187 410fb64e08 movzx ecx, byte ptr [r14 + 8]
1458a218c 4883f168 xor rcx, 0x68
1458a2190 e98a050000 jmp 0x1458a271f
1458a2195 31f6 xor esi, esi
1458a2197 488d4d30 lea rcx, [rbp + 0x30]
1458a219b e820443700 call 0x145c165c0
1458a21a0 90 nop
1458a21a1 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a21a5 89f1 mov ecx, esi
1458a21a7 c1e106 shl ecx, 6
1458a21aa c6040825 mov byte ptr [rax + rcx], 0x25
1458a21ae c644080801 mov byte ptr [rax + rcx + 8], 1
1458a21b3 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a21b8 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a21bd c7440820cdcc4c3e mov dword ptr [rax + rcx + 0x20], 0x3e4ccccd
1458a21c5 c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a21ca 488d5e01 lea rbx, [rsi + 1]
1458a21ce 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a21d2 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a21d6 750a jne 0x1458a21e2
1458a21d8 488d4d30 lea rcx, [rbp + 0x30]
1458a21dc e8df433700 call 0x145c165c0
1458a21e1 90 nop
1458a21e2 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a21e6 c1e306 shl ebx, 6
1458a21e9 c6041817 mov byte ptr [rax + rbx], 0x17
1458a21ed 4883ce02 or rsi, 2
1458a21f1 48897540 mov qword ptr [rbp + 0x40], rsi
1458a21f5 488d1d2ed03501 lea rbx, [rip + 0x135d02e]
1458a21fc be17000000 mov esi, 0x17
1458a2201 ba17000000 mov edx, 0x17
1458a2206 4889d9 mov rcx, rbx
1458a2209 e8c2bb0e00 call 0x14598ddd0
1458a220e 90 nop
1458a220f 4885c0 test rax, rax
1458a2212 480f44d6 cmove rdx, rsi
1458a2216 480f45d8 cmovne rbx, rax
1458a221a be20000000 mov esi, 0x20
1458a221f 488d051bd03501 lea rax, [rip + 0x135d01b]
1458a2226 e96f090000 jmp 0x1458a2b9a
1458a222b 31f6 xor esi, esi
1458a222d 488d4d30 lea rcx, [rbp + 0x30]
1458a2231 e88a433700 call 0x145c165c0
1458a2236 90 nop
1458a2237 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a223b 89f1 mov ecx, esi
1458a223d c1e106 shl ecx, 6
1458a2240 c6040825 mov byte ptr [rax + rcx], 0x25
1458a2244 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a2249 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a224e 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a2253 c7440820cdcc4c3e mov dword ptr [rax + rcx + 0x20], 0x3e4ccccd
1458a225b c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a2260 488d5e01 lea rbx, [rsi + 1]
1458a2264 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a2268 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a226c 750a jne 0x1458a2278
1458a226e 488d4d30 lea rcx, [rbp + 0x30]
1458a2272 e849433700 call 0x145c165c0
1458a2277 90 nop
1458a2278 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a227c c1e306 shl ebx, 6
1458a227f c6041806 mov byte ptr [rax + rbx], 6
1458a2283 48b9020000009a99993e movabs rcx, 0x3e99999a00000002
1458a228d 48894c1804 mov qword ptr [rax + rbx + 4], rcx
1458a2292 c744181000000000 mov dword ptr [rax + rbx + 0x10], 0
1458a229a c644181801 mov byte ptr [rax + rbx + 0x18], 1
1458a229f 4c89741820 mov qword ptr [rax + rbx + 0x20], r14
1458a22a4 4c897c1828 mov qword ptr [rax + rbx + 0x28], r15
1458a22a9 4883ce02 or rsi, 2
1458a22ad 48897540 mov qword ptr [rbp + 0x40], rsi
1458a22b1 488d1da2ce3501 lea rbx, [rip + 0x135cea2]
1458a22b8 be18000000 mov esi, 0x18
1458a22bd ba18000000 mov edx, 0x18
1458a22c2 4889d9 mov rcx, rbx
1458a22c5 e806bb0e00 call 0x14598ddd0
1458a22ca 90 nop
1458a22cb 4885c0 test rax, rax
1458a22ce 480f44d6 cmove rdx, rsi
1458a22d2 480f45d8 cmovne rbx, rax
1458a22d6 be17000000 mov esi, 0x17
1458a22db 488d0590ce3501 lea rax, [rip + 0x135ce90]
1458a22e2 e9b3080000 jmp 0x1458a2b9a
1458a22e7 31f6 xor esi, esi
1458a22e9 488d4d30 lea rcx, [rbp + 0x30]
1458a22ed e8ce423700 call 0x145c165c0
1458a22f2 90 nop
1458a22f3 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a22f7 89f1 mov ecx, esi
1458a22f9 c1e106 shl ecx, 6
1458a22fc c6040825 mov byte ptr [rax + rcx], 0x25
1458a2300 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a2305 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a230a 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a230f c7440820cdcc4c3e mov dword ptr [rax + rcx + 0x20], 0x3e4ccccd
1458a2317 c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a231c 488d5e01 lea rbx, [rsi + 1]
1458a2320 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a2324 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a2328 750a jne 0x1458a2334
1458a232a 488d4d30 lea rcx, [rbp + 0x30]
1458a232e e88d423700 call 0x145c165c0
1458a2333 90 nop
1458a2334 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2338 c1e306 shl ebx, 6
1458a233b c6041807 mov byte ptr [rax + rbx], 7
1458a233f 0f28053acb3501 movaps xmm0, xmmword ptr [rip + 0x135cb3a]
1458a2346 0f11441804 movups xmmword ptr [rax + rbx + 4], xmm0
1458a234b c644181801 mov byte ptr [rax + rbx + 0x18], 1
1458a2350 4c89741820 mov qword ptr [rax + rbx + 0x20], r14
1458a2355 4c897c1828 mov qword ptr [rax + rbx + 0x28], r15
1458a235a 4883ce02 or rsi, 2
1458a235e 48897540 mov qword ptr [rbp + 0x40], rsi
1458a2362 488d1d20ce3501 lea rbx, [rip + 0x135ce20]
1458a2369 be14000000 mov esi, 0x14
1458a236e ba14000000 mov edx, 0x14
1458a2373 4889d9 mov rcx, rbx
1458a2376 e855ba0e00 call 0x14598ddd0
1458a237b 90 nop
1458a237c 4885c0 test rax, rax
1458a237f 480f44d6 cmove rdx, rsi
1458a2383 480f45d8 cmovne rbx, rax
1458a2387 be20000000 mov esi, 0x20
1458a238c 488d050ace3501 lea rax, [rip + 0x135ce0a]
1458a2393 e902080000 jmp 0x1458a2b9a
1458a2398 31db xor ebx, ebx
1458a239a 488d4d30 lea rcx, [rbp + 0x30]
1458a239e e81d423700 call 0x145c165c0
1458a23a3 90 nop
1458a23a4 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a23a8 89d9 mov ecx, ebx
1458a23aa c1e106 shl ecx, 6
1458a23ad c6040825 mov byte ptr [rax + rcx], 0x25
1458a23b1 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a23b6 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a23bb 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a23c0 c74408200000003f mov dword ptr [rax + rcx + 0x20], 0x3f000000
1458a23c8 c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a23cd 4c8d6301 lea r12, [rbx + 1]
1458a23d1 4c896540 mov qword ptr [rbp + 0x40], r12
1458a23d5 8b4768 mov eax, dword ptr [rdi + 0x68]
1458a23d8 83c804 or eax, 4
1458a23db 83f807 cmp eax, 7
1458a23de 0f8519010000 jne 0x1458a24fd
1458a23e4 4c3b6530 cmp r12, qword ptr [rbp + 0x30]
1458a23e8 750a jne 0x1458a23f4
1458a23ea 488d4d30 lea rcx, [rbp + 0x30]
1458a23ee e8cd413700 call 0x145c165c0
1458a23f3 90 nop
1458a23f4 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a23f8 41c1e406 shl r12d, 6
1458a23fc 42c6042025 mov byte ptr [rax + r12], 0x25
1458a2401 42c644200801 mov byte ptr [rax + r12 + 8], 1
1458a2407 4e89742010 mov qword ptr [rax + r12 + 0x10], r14
1458a240c 4e897c2018 mov qword ptr [rax + r12 + 0x18], r15
1458a2411 42c74420200000803f mov dword ptr [rax + r12 + 0x20], 0x3f800000
1458a241a 42c644202406 mov byte ptr [rax + r12 + 0x24], 6
1458a2420 4c8d6302 lea r12, [rbx + 2]
1458a2424 4c896540 mov qword ptr [rbp + 0x40], r12
1458a2428 4983ff05 cmp r15, 5
1458a242c 0f8545010000 jne 0x1458a2577
1458a2432 e9bd010000 jmp 0x1458a25f4
1458a2437 31f6 xor esi, esi
1458a2439 488d4d30 lea rcx, [rbp + 0x30]
1458a243d e87e413700 call 0x145c165c0
1458a2442 90 nop
1458a2443 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2447 89f1 mov ecx, esi
1458a2449 c1e106 shl ecx, 6
1458a244c c6040825 mov byte ptr [rax + rcx], 0x25
1458a2450 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a2455 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a245a 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a245f c74408206666663f mov dword ptr [rax + rcx + 0x20], 0x3f666666
1458a2467 c644082400 mov byte ptr [rax + rcx + 0x24], 0
1458a246c 488d5e01 lea rbx, [rsi + 1]
1458a2470 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a2474 448b6740 mov r12d, dword ptr [rdi + 0x40]
1458a2478 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a247c 750a jne 0x1458a2488
1458a247e 488d4d30 lea rcx, [rbp + 0x30]
1458a2482 e839413700 call 0x145c165c0
1458a2487 90 nop
1458a2488 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a248c c1e306 shl ebx, 6
1458a248f 66c704180b01 mov word ptr [rax + rbx], 0x10b
1458a2495 f20f100593c93501 movsd xmm0, qword ptr [rip + 0x135c993]
1458a249d f20f11441804 movsd qword ptr [rax + rbx + 4], xmm0
1458a24a3 448964180c mov dword ptr [rax + rbx + 0xc], r12d
1458a24a8 c744181002000000 mov dword ptr [rax + rbx + 0x10], 2
1458a24b0 c644181801 mov byte ptr [rax + rbx + 0x18], 1
1458a24b5 4c89741820 mov qword ptr [rax + rbx + 0x20], r14
1458a24ba 4c897c1828 mov qword ptr [rax + rbx + 0x28], r15
1458a24bf 4883ce02 or rsi, 2
1458a24c3 48897540 mov qword ptr [rbp + 0x40], rsi
1458a24c7 488d1dc5cd3501 lea rbx, [rip + 0x135cdc5]
1458a24ce be15000000 mov esi, 0x15
1458a24d3 ba15000000 mov edx, 0x15
1458a24d8 4889d9 mov rcx, rbx
1458a24db e8f0b80e00 call 0x14598ddd0
1458a24e0 90 nop
1458a24e1 4885c0 test rax, rax
1458a24e4 480f44d6 cmove rdx, rsi
1458a24e8 480f45d8 cmovne rbx, rax
1458a24ec be20000000 mov esi, 0x20
1458a24f1 488d05b0cd3501 lea rax, [rip + 0x135cdb0]
1458a24f8 e99d060000 jmp 0x1458a2b9a
1458a24fd 4983ff05 cmp r15, 5
1458a2501 7518 jne 0x1458a251b
1458a2503 b873687265 mov eax, 0x65726873
1458a2508 413306 xor eax, dword ptr [r14]
1458a250b 410fb64e04 movzx ecx, byte ptr [r14 + 4]
1458a2510 83f164 xor ecx, 0x64
1458a2513 09c1 or ecx, eax
1458a2515 0f84d9000000 je 0x1458a25f4
1458a251b 4c3b6530 cmp r12, qword ptr [rbp + 0x30]
1458a251f 750a jne 0x1458a252b
1458a2521 488d4d30 lea rcx, [rbp + 0x30]
1458a2525 e896403700 call 0x145c165c0
1458a252a 90 nop
1458a252b 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a252f 41c1e406 shl r12d, 6
1458a2533 42c6042009 mov byte ptr [rax + r12], 9
1458a2538 42c7442004b1310000 mov dword ptr [rax + r12 + 4], 0x31b1
1458a2541 f20f100517c93501 movsd xmm0, qword ptr [rip + 0x135c917]
1458a2549 f2420f11442008 movsd qword ptr [rax + r12 + 8], xmm0
1458a2550 42c744201000000000 mov dword ptr [rax + r12 + 0x10], 0
1458a2559 42c644201801 mov byte ptr [rax + r12 + 0x18], 1
1458a255f 4e89742020 mov qword ptr [rax + r12 + 0x20], r14
1458a2564 4e897c2028 mov qword ptr [rax + r12 + 0x28], r15
1458a2569 4c8d6302 lea r12, [rbx + 2]
1458a256d 4c896540 mov qword ptr [rbp + 0x40], r12
1458a2571 4983ff05 cmp r15, 5
1458a2575 747d je 0x1458a25f4
1458a2577 4983ff0b cmp r15, 0xb
1458a257b 0f85d5000000 jne 0x1458a2656
1458a2581 48b8626c6f6f64746869 movabs rax, 0x696874646f6f6c62
1458a258b 493306 xor rax, qword ptr [r14]
1458a258e 48b96f64746869727374 movabs rcx, 0x747372696874646f
1458a2598 49334e03 xor rcx, qword ptr [r14 + 3]
1458a259c 4809c1 or rcx, rax
1458a259f 0f85b1000000 jne 0x1458a2656
1458a25a5 4c3b6530 cmp r12, qword ptr [rbp + 0x30]
1458a25a9 750a jne 0x1458a25b5
1458a25ab 488d4d30 lea rcx, [rbp + 0x30]
1458a25af e80c403700 call 0x145c165c0
1458a25b4 90 nop
1458a25b5 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a25b9 41c1e406 shl r12d, 6
1458a25bd 42c6042012 mov byte ptr [rax + r12], 0x12
1458a25c2 f20f100526855100 movsd xmm0, qword ptr [rip + 0x518526]
1458a25ca f2420f11442004 movsd qword ptr [rax + r12 + 4], xmm0
1458a25d1 42c744201001000000 mov dword ptr [rax + r12 + 0x10], 1
1458a25da 42c644201801 mov byte ptr [rax + r12 + 0x18], 1
1458a25e0 4e89742020 mov qword ptr [rax + r12 + 0x20], r14
1458a25e5 4ac74420280b000000 mov qword ptr [rax + r12 + 0x28], 0xb
1458a25ee 4883c303 add rbx, 3
1458a25f2 eb5e jmp 0x1458a2652
1458a25f4 b873687265 mov eax, 0x65726873
1458a25f9 413306 xor eax, dword ptr [r14]
1458a25fc 410fb64e04 movzx ecx, byte ptr [r14 + 4]
1458a2601 83f164 xor ecx, 0x64
1458a2604 09c1 or ecx, eax
1458a2606 754e jne 0x1458a2656
1458a2608 4c3b6530 cmp r12, qword ptr [rbp + 0x30]
1458a260c 750a jne 0x1458a2618
1458a260e 488d4d30 lea rcx, [rbp + 0x30]
1458a2612 e8a93f3700 call 0x145c165c0
1458a2617 90 nop
1458a2618 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a261c 4489e1 mov ecx, r12d
1458a261f c1e106 shl ecx, 6
1458a2622 c6040806 mov byte ptr [rax + rcx], 6
1458a2626 48ba020000000000003f movabs rdx, 0x3f00000000000002
1458a2630 4889540804 mov qword ptr [rax + rcx + 4], rdx
1458a2635 c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
1458a263d c644081801 mov byte ptr [rax + rcx + 0x18], 1
1458a2642 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
1458a2647 4c897c0828 mov qword ptr [rax + rcx + 0x28], r15
1458a264c 49ffc4 inc r12
1458a264f 4c89e3 mov rbx, r12
1458a2652 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a2656 488d1d04cc3501 lea rbx, [rip + 0x135cc04]
1458a265d be1b000000 mov esi, 0x1b
1458a2662 ba1b000000 mov edx, 0x1b
1458a2667 4889d9 mov rcx, rbx
1458a266a e861b70e00 call 0x14598ddd0
1458a266f 90 nop
1458a2670 4885c0 test rax, rax
1458a2673 480f44d6 cmove rdx, rsi
1458a2677 480f45d8 cmovne rbx, rax
1458a267b be17000000 mov esi, 0x17
1458a2680 488d05f5cb3501 lea rax, [rip + 0x135cbf5]
1458a2687 e90e050000 jmp 0x1458a2b9a
1458a268c 48b86661657269655f66 movabs rax, 0x665f656972656166
1458a2696 493306 xor rax, qword ptr [r14]
1458a2699 48b97269655f66697265 movabs rcx, 0x657269665f656972
1458a26a3 49334e03 xor rcx, qword ptr [r14 + 3]
1458a26a7 eb76 jmp 0x1458a271f
1458a26a9 48b8726564656d707469 movabs rax, 0x6974706d65646572
1458a26b3 493306 xor rax, qword ptr [r14]
1458a26b6 410fb74e08 movzx ecx, word ptr [r14 + 8]
1458a26bb 4881f16f6e0000 xor rcx, 0x6e6f
1458a26c2 4809c1 or rcx, rax
1458a26c5 0f85a3040000 jne 0x1458a2b6e
1458a26cb 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a26cf 750a jne 0x1458a26db
1458a26d1 488d4d30 lea rcx, [rbp + 0x30]
1458a26d5 e8e63e3700 call 0x145c165c0
1458a26da 90 nop
1458a26db 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a26df 89d9 mov ecx, ebx
1458a26e1 c1e106 shl ecx, 6
1458a26e4 c6040825 mov byte ptr [rax + rcx], 0x25
1458a26e8 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a26ed 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a26f2 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a26f7 c74408200000003f mov dword ptr [rax + rcx + 0x20], 0x3f000000
1458a26ff e95e040000 jmp 0x1458a2b62
1458a2704 48b863616c6c5f6f665f movabs rax, 0x5f666f5f6c6c6163
1458a270e 493306 xor rax, qword ptr [r14]
1458a2711 48b96f665f666c616d65 movabs rcx, 0x656d616c665f666f
1458a271b 49334e05 xor rcx, qword ptr [r14 + 5]
1458a271f 4809c1 or rcx, rax
1458a2722 0f8546040000 jne 0x1458a2b6e
1458a2728 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a272c 750a jne 0x1458a2738
1458a272e 488d4d30 lea rcx, [rbp + 0x30]
1458a2732 e8893e3700 call 0x145c165c0
1458a2737 90 nop
1458a2738 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a273c 89d9 mov ecx, ebx
1458a273e c1e106 shl ecx, 6
1458a2741 c604080d mov byte ptr [rax + rcx], 0xd
1458a2745 c74408040000003f mov dword ptr [rax + rcx + 4], 0x3f000000
1458a274d 4c89740808 mov qword ptr [rax + rcx + 8], r14
1458a2752 4c897c0810 mov qword ptr [rax + rcx + 0x10], r15
1458a2757 e90b040000 jmp 0x1458a2b67
1458a275c 48b8736c6963655f616e movabs rax, 0x6e615f6563696c73
1458a2766 493306 xor rax, qword ptr [r14]
1458a2769 48b9616e645f64696365 movabs rcx, 0x656369645f646e61
1458a2773 49334e06 xor rcx, qword ptr [r14 + 6]
1458a2777 eb35 jmp 0x1458a27ae
1458a2779 48b8626174746c655f73 movabs rax, 0x735f656c74746162
1458a2783 493306 xor rax, qword ptr [r14]
1458a2786 418b4e08 mov ecx, dword ptr [r14 + 8]
1458a278a 4881f1686f7574 xor rcx, 0x74756f68
1458a2791 eb1b jmp 0x1458a27ae
1458a2793 48b8616472656e616c69 movabs rax, 0x696c616e65726461
1458a279d 493306 xor rax, qword ptr [r14]
1458a27a0 48b9696e655f72757368 movabs rcx, 0x687375725f656e69
1458a27aa 49334e07 xor rcx, qword ptr [r14 + 7]
1458a27ae 4809c1 or rcx, rax
1458a27b1 756c jne 0x1458a281f
1458a27b3 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a27b7 750a jne 0x1458a27c3
1458a27b9 488d4d30 lea rcx, [rbp + 0x30]
1458a27bd e8fe3d3700 call 0x145c165c0
1458a27c2 90 nop
1458a27c3 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a27c7 89d9 mov ecx, ebx
1458a27c9 c1e106 shl ecx, 6
1458a27cc c6040825 mov byte ptr [rax + rcx], 0x25
1458a27d0 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a27d5 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a27da 4c897c0818 mov qword ptr [rax + rcx + 0x18], r15
1458a27df c74408200000803f mov dword ptr [rax + rcx + 0x20], 0x3f800000
1458a27e7 c644082406 mov byte ptr [rax + rcx + 0x24], 6
1458a27ec 48ffc3 inc rbx
1458a27ef 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a27f3 eb2a jmp 0x1458a281f
1458a27f5 f3410f6f06 movdqu xmm0, xmmword ptr [r14]
1458a27fa f3410f6f4e03 movdqu xmm1, xmmword ptr [r14 + 3]
1458a2800 660f740df8c53501 pcmpeqb xmm1, xmmword ptr [rip + 0x135c5f8]
1458a2808 660f740500c63501 pcmpeqb xmm0, xmmword ptr [rip + 0x135c600]
1458a2810 660fdbc1 pand xmm0, xmm1
1458a2814 660fd7c0 pmovmskb eax, xmm0
1458a2818 3dffff0000 cmp eax, 0xffff
1458a281d 7494 je 0x1458a27b3
1458a281f 418d4424fa lea eax, [r12 - 6]
1458a2824 83f807 cmp eax, 7
1458a2827 0f87b1010000 ja 0x1458a29de
1458a282d 488d0d04373601 lea rcx, [rip + 0x1363704]
1458a2834 48630481 movsxd rax, dword ptr [rcx + rax*4]
1458a2838 4801c8 add rax, rcx
1458a283b ffe0 jmp rax
1458a283d 660fefc0 pxor xmm0, xmm0
1458a2841 0f2ef0 ucomiss xmm6, xmm0
1458a2844 488b4530 mov rax, qword ptr [rbp + 0x30]
1458a2848 0f873f010000 ja 0x1458a298d
1458a284e 4839c3 cmp rbx, rax
1458a2851 750a jne 0x1458a285d
1458a2853 488d4d30 lea rcx, [rbp + 0x30]
1458a2857 e8643d3700 call 0x145c165c0
1458a285c 90 nop
1458a285d 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2861 89d9 mov ecx, ebx
1458a2863 c1e106 shl ecx, 6
1458a2866 c6040812 mov byte ptr [rax + rcx], 0x12
1458a286a f20f10059e825100 movsd xmm0, qword ptr [rip + 0x51829e]
1458a2872 f20f11440804 movsd qword ptr [rax + rcx + 4], xmm0
1458a2878 e943010000 jmp 0x1458a29c0
1458a287d 807f7401 cmp byte ptr [rdi + 0x74], 1
1458a2881 7470 je 0x1458a28f3
1458a2883 e956010000 jmp 0x1458a29de
1458a2888 0fb67774 movzx esi, byte ptr [rdi + 0x74]
1458a288c 4080fe01 cmp sil, 1
1458a2890 b8853b0000 mov eax, 0x3b85
1458a2895 b9a9050000 mov ecx, 0x5a9
1458a289a 0f44c8 cmove ecx, eax
1458a289d 4080fe04 cmp sil, 4
1458a28a1 41bc7a000000 mov r12d, 0x7a
1458a28a7 440f45e1 cmovne r12d, ecx
1458a28ab 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a28af 750a jne 0x1458a28bb
1458a28b1 488d4d30 lea rcx, [rbp + 0x30]
1458a28b5 e8063d3700 call 0x145c165c0
1458a28ba 90 nop
1458a28bb 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a28bf 89d9 mov ecx, ebx
1458a28c1 c1e106 shl ecx, 6
1458a28c4 c6040803 mov byte ptr [rax + rcx], 3
1458a28c8 4088740801 mov byte ptr [rax + rcx + 1], sil
1458a28cd f30f7e054bc53501 movq xmm0, qword ptr [rip + 0x135c54b]
1458a28d5 660fd6440804 movq qword ptr [rax + rcx + 4], xmm0
1458a28db 448964080c mov dword ptr [rax + rcx + 0xc], r12d
1458a28e0 c74408100a000000 mov dword ptr [rax + rcx + 0x10], 0xa
1458a28e8 e9ea000000 jmp 0x1458a29d7
1458a28ed 807f7401 cmp byte ptr [rdi + 0x74], 1
1458a28f1 7552 jne 0x1458a2945
1458a28f3 8b7740 mov esi, dword ptr [rdi + 0x40]
1458a28f6 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a28fa 750a jne 0x1458a2906
1458a28fc 488d4d30 lea rcx, [rbp + 0x30]
1458a2900 e8bb3c3700 call 0x145c165c0
1458a2905 90 nop
1458a2906 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a290a 89d9 mov ecx, ebx
1458a290c c1e106 shl ecx, 6
1458a290f c604080c mov byte ptr [rax + rcx], 0xc
1458a2913 89740804 mov dword ptr [rax + rcx + 4], esi
1458a2917 f30f7e0511c53501 movq xmm0, qword ptr [rip + 0x135c511]
1458a291f 660fd6440808 movq qword ptr [rax + rcx + 8], xmm0
1458a2925 48ba853b000002000000 movabs rdx, 0x200003b85
1458a292f 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
1458a2934 48ffc3 inc rbx
1458a2937 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a293b 4183fc0d cmp r12d, 0xd
1458a293f 0f8599000000 jne 0x1458a29de
1458a2945 0f2e7748 ucomiss xmm6, dword ptr [rdi + 0x48]
1458a2949 0f828f000000 jb 0x1458a29de
1458a294f 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a2953 750a jne 0x1458a295f
1458a2955 488d4d30 lea rcx, [rbp + 0x30]
1458a2959 e8623c3700 call 0x145c165c0
1458a295e 90 nop
1458a295f 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2963 89d9 mov ecx, ebx
1458a2965 c1e106 shl ecx, 6
1458a2968 c6040808 mov byte ptr [rax + rcx], 8
1458a296c 48ba0000803e03000000 movabs rdx, 0x33e800000
1458a2976 4889540804 mov qword ptr [rax + rcx + 4], rdx
1458a297b c744080c0000c03f mov dword ptr [rax + rcx + 0xc], 0x3fc00000
1458a2983 c744081808000000 mov dword ptr [rax + rcx + 0x18], 8
1458a298b eb4a jmp 0x1458a29d7
1458a298d 4839c3 cmp rbx, rax
1458a2990 750a jne 0x1458a299c
1458a2992 488d4d30 lea rcx, [rbp + 0x30]
1458a2996 e8253c3700 call 0x145c165c0
1458a299b 90 nop
1458a299c 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a29a0 89d9 mov ecx, ebx
1458a29a2 c1e106 shl ecx, 6
1458a29a5 66c704080f0e mov word ptr [rax + rcx], 0xe0f
1458a29ab 48bacdcc4c3d01000000 movabs rdx, 0x13d4ccccd
1458a29b5 4889540804 mov qword ptr [rax + rcx + 4], rdx
1458a29ba f30f1174080c movss dword ptr [rax + rcx + 0xc], xmm6
1458a29c0 c744081007000000 mov dword ptr [rax + rcx + 0x10], 7
1458a29c8 c644081801 mov byte ptr [rax + rcx + 0x18], 1
1458a29cd 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
1458a29d2 4c897c0828 mov qword ptr [rax + rcx + 0x28], r15
1458a29d7 48ffc3 inc rbx
1458a29da 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a29de 4983ff13 cmp r15, 0x13
1458a29e2 752a jne 0x1458a2a0e
1458a29e4 f3410f6f06 movdqu xmm0, xmmword ptr [r14]
1458a29e9 f3410f6f4e03 movdqu xmm1, xmmword ptr [r14 + 3]
1458a29ef 660f740d09c43501 pcmpeqb xmm1, xmmword ptr [rip + 0x135c409]
1458a29f7 660f740511c43501 pcmpeqb xmm0, xmmword ptr [rip + 0x135c411]
1458a29ff 660fdbc1 pand xmm0, xmm1
1458a2a03 660fd7c0 pmovmskb eax, xmm0
1458a2a07 3dffff0000 cmp eax, 0xffff
1458a2a0c 742f je 0x1458a2a3d
1458a2a0e 488d1d17c93501 lea rbx, [rip + 0x135c917]
1458a2a15 be14000000 mov esi, 0x14
1458a2a1a ba14000000 mov edx, 0x14
1458a2a1f 4889d9 mov rcx, rbx
1458a2a22 e8a9b30e00 call 0x14598ddd0
1458a2a27 90 nop
1458a2a28 4885c0 test rax, rax
1458a2a2b 480f44d6 cmove rdx, rsi
1458a2a2f 480f45d8 cmovne rbx, rax
1458a2a33 be17000000 mov esi, 0x17
1458a2a38 e956010000 jmp 0x1458a2b93
1458a2a3d 48897d08 mov qword ptr [rbp + 8], rdi
1458a2a41 488d0578f675fa lea rax, [rip - 0x58a0988]
1458a2a48 48894510 mov qword ptr [rbp + 0x10], rax
1458a2a4c 488d1504c93501 lea rdx, [rip + 0x135c904]
1458a2a53 488d4de8 lea rcx, [rbp - 0x18]
1458a2a57 4c8d4508 lea r8, [rbp + 8]
1458a2a5b e8d0a63300 call 0x145bdd130
1458a2a60 90 nop
1458a2a61 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458a2a65 48894520 mov qword ptr [rbp + 0x20], rax
1458a2a69 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458a2a6d 48894518 mov qword ptr [rbp + 0x18], rax
1458a2a71 488b75f8 mov rsi, qword ptr [rbp - 8]
1458a2a75 488d1de8c83501 lea rbx, [rip + 0x135c8e8]
1458a2a7c 41be1a000000 mov r14d, 0x1a
1458a2a82 ba1a000000 mov edx, 0x1a
1458a2a87 4889d9 mov rcx, rbx
1458a2a8a e841b30e00 call 0x14598ddd0
1458a2a8f 90 nop
1458a2a90 4889d7 mov rdi, rdx
1458a2a93 4885c0 test rax, rax
1458a2a96 480f45d8 cmovne rbx, rax
1458a2a9a 490f44fe cmove rdi, r14
1458a2a9e 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458a2aa7 488d4de8 lea rcx, [rbp - 0x18]
1458a2aab 41b901000000 mov r9d, 1
1458a2ab1 4889fa mov rdx, rdi
1458a2ab4 4531c0 xor r8d, r8d
1458a2ab7 e8447c90fa call 0x1401aa700
1458a2abc 4c8b75f0 mov r14, qword ptr [rbp - 0x10]
1458a2ac0 837de801 cmp dword ptr [rbp - 0x18], 1
1458a2ac4 0f8403030000 je 0x1458a2dcd
1458a2aca 4c8b7df8 mov r15, qword ptr [rbp - 8]
1458a2ace 4885ff test rdi, rdi
1458a2ad1 740e je 0x1458a2ae1
1458a2ad3 4c89f9 mov rcx, r15
1458a2ad6 4889da mov rdx, rbx
1458a2ad9 4989f8 mov r8, rdi
1458a2adc e8fa783600 call 0x145c0a3db
1458a2ae1 488b4540 mov rax, qword ptr [rbp + 0x40]
1458a2ae5 49894540 mov qword ptr [r13 + 0x40], rax
1458a2ae9 0f104530 movups xmm0, xmmword ptr [rbp + 0x30]
1458a2aed 410f114530 movups xmmword ptr [r13 + 0x30], xmm0
1458a2af2 488b4520 mov rax, qword ptr [rbp + 0x20]
1458a2af6 49894500 mov qword ptr [r13], rax
1458a2afa 488b4518 mov rax, qword ptr [rbp + 0x18]
1458a2afe 49894508 mov qword ptr [r13 + 8], rax
1458a2b02 49897510 mov qword ptr [r13 + 0x10], rsi
1458a2b06 4d897518 mov qword ptr [r13 + 0x18], r14
1458a2b0a 4d897d20 mov qword ptr [r13 + 0x20], r15
1458a2b0e 49897d28 mov qword ptr [r13 + 0x28], rdi
1458a2b12 488d0565c83501 lea rax, [rip + 0x135c865]
1458a2b19 49894548 mov qword ptr [r13 + 0x48], rax
1458a2b1d 49c7455017000000 mov qword ptr [r13 + 0x50], 0x17
1458a2b25 e924020000 jmp 0x1458a2d4e
1458a2b2a 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a2b2e 750a jne 0x1458a2b3a
1458a2b30 488d4d30 lea rcx, [rbp + 0x30]
1458a2b34 e8873a3700 call 0x145c165c0
1458a2b39 90 nop
1458a2b3a 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2b3e 89d9 mov ecx, ebx
1458a2b40 c1e106 shl ecx, 6
1458a2b43 c6040825 mov byte ptr [rax + rcx], 0x25
1458a2b47 c644080801 mov byte ptr [rax + rcx + 8], 1
1458a2b4c 4c89740810 mov qword ptr [rax + rcx + 0x10], r14
1458a2b51 48c744081809000000 mov qword ptr [rax + rcx + 0x18], 9
1458a2b5a c74408200000803f mov dword ptr [rax + rcx + 0x20], 0x3f800000
1458a2b62 c644082406 mov byte ptr [rax + rcx + 0x24], 6
1458a2b67 48ffc3 inc rbx
1458a2b6a 48895d40 mov qword ptr [rbp + 0x40], rbx
1458a2b6e 488d1d4dc83501 lea rbx, [rip + 0x135c84d]
1458a2b75 be17000000 mov esi, 0x17
1458a2b7a ba17000000 mov edx, 0x17
1458a2b7f 4889d9 mov rcx, rbx
1458a2b82 e849b20e00 call 0x14598ddd0
1458a2b87 90 nop
1458a2b88 4885c0 test rax, rax
1458a2b8b 480f44d6 cmove rdx, rsi
1458a2b8f 480f45d8 cmovne rbx, rax
1458a2b93 488d05a6c73501 lea rax, [rip + 0x135c7a6]
1458a2b9a 48894528 mov qword ptr [rbp + 0x28], rax
1458a2b9e 48895dc8 mov qword ptr [rbp - 0x38], rbx
1458a2ba2 488955d0 mov qword ptr [rbp - 0x30], rdx
1458a2ba6 48897d08 mov qword ptr [rbp + 8], rdi
1458a2baa 4c8d250ff575fa lea r12, [rip - 0x58a0af1]
1458a2bb1 4c896510 mov qword ptr [rbp + 0x10], r12
1458a2bb5 488d159bc73501 lea rdx, [rip + 0x135c79b]
1458a2bbc 488d4de8 lea rcx, [rbp - 0x18]
1458a2bc0 488d5d08 lea rbx, [rbp + 8]
1458a2bc4 4989d8 mov r8, rbx
1458a2bc7 e864a53300 call 0x145bdd130
1458a2bcc 90 nop
1458a2bcd 488975d8 mov qword ptr [rbp - 0x28], rsi
1458a2bd1 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458a2bd5 48894520 mov qword ptr [rbp + 0x20], rax
1458a2bd9 488b45f0 mov rax, qword ptr [rbp - 0x10]
1458a2bdd 48894518 mov qword ptr [rbp + 0x18], rax
1458a2be1 488b75f8 mov rsi, qword ptr [rbp - 8]
1458a2be5 4983ff0c cmp r15, 0xc
1458a2be9 743a je 0x1458a2c25
1458a2beb 4983ff05 cmp r15, 5
1458a2bef 7551 jne 0x1458a2c42
1458a2bf1 b872656e65 mov eax, 0x656e6572
1458a2bf6 413306 xor eax, dword ptr [r14]
1458a2bf9 410fb64e04 movzx ecx, byte ptr [r14 + 4]
1458a2bfe 83f177 xor ecx, 0x77
1458a2c01 09c1 or ecx, eax
1458a2c03 753d jne 0x1458a2c42
1458a2c05 4c8d35e2c73501 lea r14, [rip + 0x135c7e2]
1458a2c0c 41bf0e000000 mov r15d, 0xe
1458a2c12 ba0e000000 mov edx, 0xe
1458a2c17 4c89f1 mov rcx, r14
1458a2c1a e8b1b10e00 call 0x14598ddd0
1458a2c1f 90 nop
1458a2c20 e9a4000000 jmp 0x1458a2cc9
1458a2c25 48b872656a7576656e61 movabs rax, 0x616e6576756a6572
1458a2c2f 493306 xor rax, qword ptr [r14]
1458a2c32 418b4e08 mov ecx, dword ptr [r14 + 8]
1458a2c36 4881f174696f6e xor rcx, 0x6e6f6974
1458a2c3d 4809c1 or rcx, rax
1458a2c40 746c je 0x1458a2cae
1458a2c42 48897d08 mov qword ptr [rbp + 8], rdi
1458a2c46 4c896510 mov qword ptr [rbp + 0x10], r12
1458a2c4a 488d1566123401 lea rdx, [rip + 0x1341266]
1458a2c51 488d4de8 lea rcx, [rbp - 0x18]
1458a2c55 4c8d4508 lea r8, [rbp + 8]
1458a2c59 e8d2a43300 call 0x145bdd130
1458a2c5e 90 nop
1458a2c5f 4c89eb mov rbx, r13
1458a2c62 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1458a2c66 488b55f8 mov rdx, qword ptr [rbp - 8]
1458a2c6a 4c8b7710 mov r14, qword ptr [rdi + 0x10]
1458a2c6e 4c8b6f18 mov r13, qword ptr [rdi + 0x18]
1458a2c72 48894de0 mov qword ptr [rbp - 0x20], rcx
1458a2c76 e855b10e00 call 0x14598ddd0
1458a2c7b 90 nop
1458a2c7c 4989c7 mov r15, rax
1458a2c7f 4889d7 mov rdi, rdx
1458a2c82 488b55e8 mov rdx, qword ptr [rbp - 0x18]
1458a2c86 4885d2 test rdx, rdx
1458a2c89 740f je 0x1458a2c9a
1458a2c8b 41b801000000 mov r8d, 1
1458a2c91 488b4de0 mov rcx, qword ptr [rbp - 0x20]
1458a2c95 e836f575fa call 0x1400021d0
1458a2c9a 4d85ff test r15, r15
1458a2c9d 490f44fd cmove rdi, r13
1458a2ca1 4d0f45f7 cmovne r14, r15
1458a2ca5 4989dd mov r13, rbx
1458a2ca8 488d5d08 lea rbx, [rbp + 8]
1458a2cac eb29 jmp 0x1458a2cd7
1458a2cae 4c8d3524c73501 lea r14, [rip + 0x135c724]
1458a2cb5 41bf15000000 mov r15d, 0x15
1458a2cbb ba15000000 mov edx, 0x15
1458a2cc0 4c89f1 mov rcx, r14
1458a2cc3 e808b10e00 call 0x14598ddd0
1458a2cc8 90 nop
1458a2cc9 4889d7 mov rdi, rdx
1458a2ccc 4885c0 test rax, rax
1458a2ccf 490f44ff cmove rdi, r15
1458a2cd3 4c0f45f0 cmovne r14, rax
1458a2cd7 4c897508 mov qword ptr [rbp + 8], r14
1458a2cdb 48897d10 mov qword ptr [rbp + 0x10], rdi
1458a2cdf 488d45c8 lea rax, [rbp - 0x38]
1458a2ce3 488945e8 mov qword ptr [rbp - 0x18], rax
1458a2ce7 4c8965f0 mov qword ptr [rbp - 0x10], r12
1458a2ceb 48895df8 mov qword ptr [rbp - 8], rbx
1458a2cef 4c896500 mov qword ptr [rbp], r12
1458a2cf3 488d1502c73501 lea rdx, [rip + 0x135c702]
1458a2cfa 488d4db0 lea rcx, [rbp - 0x50]
1458a2cfe 4c8d45e8 lea r8, [rbp - 0x18]
1458a2d02 e829a43300 call 0x145bdd130
1458a2d07 90 nop
1458a2d08 488b4540 mov rax, qword ptr [rbp + 0x40]
1458a2d0c 49894540 mov qword ptr [r13 + 0x40], rax
1458a2d10 0f104530 movups xmm0, xmmword ptr [rbp + 0x30]
1458a2d14 410f114530 movups xmmword ptr [r13 + 0x30], xmm0
1458a2d19 488b4520 mov rax, qword ptr [rbp + 0x20]
1458a2d1d 49894500 mov qword ptr [r13], rax
1458a2d21 488b4518 mov rax, qword ptr [rbp + 0x18]
1458a2d25 49894508 mov qword ptr [r13 + 8], rax
1458a2d29 49897510 mov qword ptr [r13 + 0x10], rsi
1458a2d2d 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
1458a2d31 410f114518 movups xmmword ptr [r13 + 0x18], xmm0
1458a2d36 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458a2d3a 49894528 mov qword ptr [r13 + 0x28], rax
1458a2d3e 488b4528 mov rax, qword ptr [rbp + 0x28]
1458a2d42 49894548 mov qword ptr [r13 + 0x48], rax
1458a2d46 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458a2d4a 49894550 mov qword ptr [r13 + 0x50], rax
1458a2d4e 49c7455804000000 mov qword ptr [r13 + 0x58], 4
1458a2d56 49c7456004000000 mov qword ptr [r13 + 0x60], 4
1458a2d5e 41c7456801000000 mov dword ptr [r13 + 0x68], 1
1458a2d66 4c89e8 mov rax, r13
1458a2d69 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
1458a2d6d 4881c4e8000000 add rsp, 0xe8
1458a2d74 5b pop rbx
1458a2d75 5f pop rdi
1458a2d76 5e pop rsi
1458a2d77 415c pop r12
1458a2d79 415d pop r13
1458a2d7b 415e pop r14
1458a2d7d 415f pop r15
1458a2d7f 5d pop rbp
1458a2d80 c3 ret
1458a2d81 483b5d30 cmp rbx, qword ptr [rbp + 0x30]
1458a2d85 750a jne 0x1458a2d91
1458a2d87 488d4d30 lea rcx, [rbp + 0x30]
1458a2d8b e830383700 call 0x145c165c0
1458a2d90 90 nop
1458a2d91 488b4538 mov rax, qword ptr [rbp + 0x38]
1458a2d95 89d9 mov ecx, ebx
1458a2d97 c1e106 shl ecx, 6
1458a2d9a c6040806 mov byte ptr [rax + rcx], 6
1458a2d9e 48ba030000009a99993e movabs rdx, 0x3e99999a00000003
1458a2da8 4889540804 mov qword ptr [rax + rcx + 4], rdx
1458a2dad c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
1458a2db5 c644081801 mov byte ptr [rax + rcx + 0x18], 1
1458a2dba 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
1458a2dbf 48c744082809000000 mov qword ptr [rax + rcx + 0x28], 9
1458a2dc8 e99afdffff jmp 0x1458a2b67
1458a2dcd 488b55f8 mov rdx, qword ptr [rbp - 8]
1458a2dd1 4c89f1 mov rcx, r14
1458a2dd4 e812675000 call 0x145da94eb
1458a2dd9 90 nop
1458a2dda 0f0b ud2

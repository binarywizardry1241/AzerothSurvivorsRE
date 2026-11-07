1459737a1 cmp       qword ptr [r14 + 0x18], -1
1459737a6 je        0x145973d91
1459737ac movss     xmm0, dword ptr [r14 + 0x158]
1459737b5 movss     xmm1, dword ptr [r14 + 0x15c]
1459737be movaps    xmm2, xmm1
1459737c1 mulss     xmm2, dword ptr [rip + 0x45cf57] ; 145dd0720 9a99993e00000000 f32=0.300000012
1459737c9 cmp       byte ptr [r14 + 0x50], 0
1459737ce jne       0x1459737da
1459737d0 ucomiss   xmm2, xmm0
1459737d3 jbe       0x1459737da
1459737d5 mov       byte ptr [r14 + 0x50], 1
1459737da mov       rax, qword ptr [r14 + 0x30]
1459737de mov       rdx, qword ptr [rax + 0x38]
1459737e2 maxss     xmm1, dword ptr [rip + 0x423e26] ; 145d97610 0000803f0000003f f32=1
1459737ea cmp       rdx, 0x20
1459737ee mov       r9d, 0x20
1459737f4 cmovb     r9, rdx
1459737f8 test      rdx, rdx
1459737fb je        0x145973b45
145973801 mov       r11, qword ptr [rax + 0x30]
145973805 mov       r10d, dword ptr [r14 + 0x4c]
145973809 divss     xmm0, xmm1
14597380d mov       r8d, 0x40
145973813 xor       edi, edi
145973815 jmp       0x145973830
145973817 nop       word ptr [rax + rax]
145973820 inc       rdi
145973823 add       r8, 0x48
145973827 cmp       r9, rdi
14597382a je        0x145973b45
145973830 mov       esi, 1
145973835 mov       ecx, edi
145973837 shl       esi, cl
145973839 bt        r10d, edi
14597383d jb        0x145973820
14597383f cmp       rdi, rdx
145973842 jae       0x1459765ca
145973848 movss     xmm1, dword ptr [r11 + r8]
14597384e ucomiss   xmm1, xmm0
145973851 jbe       0x145973820
145973853 or        esi, r10d
145973856 mov       dword ptr [r14 + 0x4c], esi
14597385a mov       rdx, qword ptr [rax + 0x38]
14597385e cmp       rdi, rdx
145973861 jae       0x14597669c
145973867 mov       rax, qword ptr [rax + 0x30]
14597386b movups    xmm0, xmmword ptr [rax + r8 - 0x30]
145973871 movups    xmm1, xmmword ptr [rax + r8 - 0x20]
145973877 movups    xmm2, xmmword ptr [rax + r8 - 0x10]
14597387d movaps    xmmword ptr [rbp + 0x280], xmm2
145973884 movaps    xmmword ptr [rbp + 0x270], xmm1
14597388b movaps    xmmword ptr [rbp + 0x260], xmm0
145973892 mov       rsi, qword ptr [rbp + 0x238]
145973899 cmp       rsi, qword ptr [rbp + 0x228]
1459738a0 jne       0x145973903
1459738a2 mov       byte ptr [rbp + 0x337], 1
1459738a9 mov       byte ptr [rbp + 0x336], 1
1459738b0 mov       byte ptr [rbp + 0x335], 1
1459738b7 mov       byte ptr [rbp + 0x334], 1
1459738be mov       byte ptr [rbp + 0x333], 1
1459738c5 mov       byte ptr [rbp + 0x332], 1
1459738cc mov       byte ptr [rbp + 0x331], 1
1459738d3 mov       byte ptr [rbp + 0x330], 1
1459738da mov       byte ptr [rbp + 0x32f], 1
1459738e1 mov       byte ptr [rbp + 0x32e], 1
1459738e8 mov       byte ptr [rbp + 0x32d], 1
1459738ef mov       byte ptr [rbp + 0x32c], 1
1459738f6 lea       rcx, [rbp + 0x228]
1459738fd call      0x145bf4e70
145973902 nop
145973903 mov       rax, qword ptr [rbp + 0x230]
14597390a imul      rcx, rsi, 0x38
14597390e mov       rdx, qword ptr [rbp + 0x220]
145973915 mov       qword ptr [rax + rcx], rdx
145973919 movaps    xmm0, xmmword ptr [rbp + 0x260]
145973920 movaps    xmm1, xmmword ptr [rbp + 0x270]
145973927 movaps    xmm2, xmmword ptr [rbp + 0x280]
14597392e movups    xmmword ptr [rax + rcx + 8], xmm0
145973933 movups    xmmword ptr [rax + rcx + 0x18], xmm1
145973938 movups    xmmword ptr [rax + rcx + 0x28], xmm2
14597393d inc       rsi
145973940 mov       qword ptr [rbp + 0x238], rsi
145973947 mov       rax, qword ptr [rbp + 0x310]
14597394e mov       rsi, qword ptr [rax + 0x30]
145973952 mov       r15, qword ptr [rax + 0xf0]
145973959 lea       rax, [rsi + 0x40]
14597395d mov       qword ptr [rbp + 0x240], rax
145973964 lea       rax, [rip + 0x2637d5] ; 145bd7140 555657534883ec48 f32=9.2486638e+11
14597396b mov       qword ptr [rbp + 0x248], rax
145973972 mov       byte ptr [rbp + 0x337], 1
145973979 mov       byte ptr [rbp + 0x336], 1
145973980 mov       byte ptr [rbp + 0x335], 1
145973987 mov       byte ptr [rbp + 0x334], 1
14597398e mov       byte ptr [rbp + 0x333], 1
145973995 mov       byte ptr [rbp + 0x332], 1
14597399c mov       byte ptr [rbp + 0x331], 1
1459739a3 mov       byte ptr [rbp + 0x330], 1
1459739aa mov       byte ptr [rbp + 0x32f], 1
1459739b1 mov       byte ptr [rbp + 0x32e], 1
1459739b8 mov       byte ptr [rbp + 0x32d], 1
1459739bf mov       byte ptr [rbp + 0x32c], 1
1459739c6 lea       rcx, [rbp + 0x260]
1459739cd lea       rdx, [rip + 0x125836c] ; 146bcbd40 05626f73732ec005 f32=1.89658664e+31
1459739d4 lea       r8, [rbp + 0x240]
1459739db call      0x145bc5690
1459739e0 nop
1459739e1 mov       rcx, qword ptr [rbp + 0x268]
1459739e8 mov       rdx, qword ptr [rbp + 0x270]
1459739ef mov       r13, qword ptr [rsi]
1459739f2 mov       rsi, qword ptr [rsi + 8]
1459739f6 mov       qword ptr [rbp + 0x320], rcx
1459739fd call      0x1458e5790
145973a02 nop
145973a03 mov       r12, rax
145973a06 mov       r14, rdx
145973a09 mov       rdx, qword ptr [rbp + 0x260]
145973a10 test      rdx, rdx
145973a13 mov       rbx, qword ptr [rbp + 0x310]
145973a1a je        0x145973a2e
145973a1c mov       r8d, 1
145973a22 mov       rcx, qword ptr [rbp + 0x320]
145973a29 call      0x1400021d0
145973a2e mov       rcx, qword ptr [rbx + 0x30]
145973a32 mov       byte ptr [rbp + 0x337], 1
145973a39 mov       byte ptr [rbp + 0x336], 1
145973a40 mov       byte ptr [rbp + 0x335], 1
145973a47 mov       byte ptr [rbp + 0x334], 1
145973a4e mov       byte ptr [rbp + 0x333], 1
145973a55 mov       byte ptr [rbp + 0x332], 1
145973a5c mov       byte ptr [rbp + 0x331], 1
145973a63 mov       byte ptr [rbp + 0x330], 1
145973a6a mov       byte ptr [rbp + 0x32f], 1
145973a71 mov       byte ptr [rbp + 0x32e], 1
145973a78 mov       byte ptr [rbp + 0x32d], 1
145973a7f mov       byte ptr [rbp + 0x32c], 1
145973a86 mov       rdx, rdi
145973a89 call      0x145885df0
145973a8e nop
145973a8f mov       rdi, rax
145973a92 mov       rbx, rdx
145973a95 test      r12, r12
145973a98 cmove     r14, rsi
145973a9c cmovne    r13, r12
145973aa0 mov       rsi, qword ptr [rbp + 0x138]
145973aa7 cmp       rsi, qword ptr [rbp + 0x128]
145973aae jne       0x145973b11
145973ab0 mov       byte ptr [rbp + 0x337], 1
145973ab7 mov       byte ptr [rbp + 0x336], 1
145973abe mov       byte ptr [rbp + 0x335], 1
145973ac5 mov       byte ptr [rbp + 0x334], 1
145973acc mov       byte ptr [rbp + 0x333], 1
145973ad3 mov       byte ptr [rbp + 0x332], 1
145973ada mov       byte ptr [rbp + 0x331], 1
145973ae1 mov       byte ptr [rbp + 0x330], 1
145973ae8 mov       byte ptr [rbp + 0x32f], 1
145973aef mov       byte ptr [rbp + 0x32e], 1
145973af6 mov       byte ptr [rbp + 0x32d], 1
145973afd mov       byte ptr [rbp + 0x32c], 1
145973b04 lea       rcx, [rbp + 0x128]
145973b0b call      0x145bf4f50
145973b10 nop
145973b11 mov       rax, qword ptr [rbp + 0x130]
145973b18 lea       rcx, [rsi + rsi*4]
145973b1c mov       qword ptr [rax + rcx*8], r13
145973b20 mov       qword ptr [rax + rcx*8 + 8], r14
145973b25 mov       qword ptr [rax + rcx*8 + 0x10], r15
145973b2a mov       qword ptr [rax + rcx*8 + 0x18], rdi
145973b2f mov       qword ptr [rax + rcx*8 + 0x20], rbx
145973b34 inc       rsi
145973b37 mov       qword ptr [rbp + 0x138], rsi
145973b3e mov       r14, qword ptr [rbp + 0x310]

145966be0 push      rbp
145966be1 push      r15
145966be3 push      r14
145966be5 push      r13
145966be7 push      r12
145966be9 push      rsi
145966bea push      rdi
145966beb push      rbx
145966bec sub       rsp, 0x2e8
145966bf3 lea       rbp, [rsp + 0x80]
145966bfb movaps    xmmword ptr [rbp + 0x250], xmm10
145966c03 movaps    xmmword ptr [rbp + 0x240], xmm9
145966c0b movaps    xmmword ptr [rbp + 0x230], xmm8
145966c13 movdqa    xmmword ptr [rbp + 0x220], xmm7
145966c1b movaps    xmmword ptr [rbp + 0x210], xmm6
145966c22 mov       qword ptr [rbp + 0x208], 0xfffffffffffffffe
145966c2d mov       r13, rdx
145966c30 mov       rsi, rcx
145966c33 mov       rcx, qword ptr [rcx + 0x290]
145966c3a mov       rdx, qword ptr [rsi + 0x298]
145966c41 call      0x145886360
145966c46 mov       rbx, rax
145966c49 imul      rax, rax, 0xf0
145966c50 lea       r14, [rip + 0x1270f39] ; 146bd7b90 0000000000000000 f32=0
145966c57 mov       ecx, dword ptr [rsi + 0x4d0]
145966c5d mov       dword ptr [rbp + 0x1a0], ecx
145966c63 mov       rcx, qword ptr [rsi + 0x4c8]
145966c6a mov       qword ptr [rbp + 0x198], rcx
145966c71 lea       rcx, [rbp + 0x198]
145966c78 mov       qword ptr [rbp + 0x1c8], rcx
145966c7f mov       r15, qword ptr [rax + r14 + 0x68]
145966c84 mov       rdi, qword ptr [rax + r14 + 0x70]
145966c89 lea       rax, [r15 + rdi*8]
145966c8d mov       qword ptr [rbp - 0x40], r15
145966c91 mov       qword ptr [rbp - 0x38], rax
145966c95 lea       rax, [rbp + 0x1c8]
145966c9c mov       qword ptr [rbp - 0x30], rax
145966ca0 lea       rcx, [rbp + 0x1e0]
145966ca7 lea       rdx, [rbp - 0x40]
145966cab call      0x1459b56e0
145966cb0 mov       r9, qword ptr [rbp + 0x1f0]
145966cb7 test      r9, r9
145966cba je        0x145966f6f
145966cc0 bsr       rcx, r9
145966cc4 not       ecx
145966cc6 mov       r8, r9
145966cc9 shl       r8, cl
145966ccc dec       r8
145966ccf mov       r11, qword ptr [rsi + 0x9a0]
145966cd6 mov       rcx, qword ptr [rsi + 0x9a8]
145966cdd mov       rbx, qword ptr [rsi + 0x9b8]
145966ce4 mov       r10, qword ptr [rsi + 0x9b0]
145966ceb nop       dword ptr [rax + rax]
145966cf0 lea       rax, [r11 + rbx]
145966cf4 rol       rax, 0x17
145966cf8 add       rax, r11
145966cfb mov       rdi, rcx
145966cfe shl       rdi, 0x11
145966d02 xor       r10, r11
145966d05 xor       rbx, rcx
145966d08 xor       r11, rbx
145966d0b rol       rbx, 0x2d
145966d0f xor       rcx, r10
145966d12 mul       r9
145966d15 xor       r10, rdi
145966d18 cmp       r8, rax
145966d1b jb        0x145966cf0
145966d1d mov       qword ptr [rsi + 0x9a0], r11
145966d24 mov       qword ptr [rsi + 0x9b8], rbx
145966d2b mov       qword ptr [rsi + 0x9a8], rcx
145966d32 mov       qword ptr [rsi + 0x9b0], r10
145966d39 cmp       r9, rdx
145966d3c jbe       0x1459678da
145966d42 mov       rax, qword ptr [rbp + 0x1e8]
145966d49 mov       r15, qword ptr [rax + rdx*8]
145966d4d movsd     xmm6, qword ptr [r15]
145966d52 movshdup  xmm8, xmm6
145966d57 mov       rbx, qword ptr [rsi + 0x998]
145966d5e lea       rcx, [rbx + 0x10]
145966d62 movaps    xmm1, xmm6
145966d65 movaps    xmm2, xmm8
145966d69 call      0x1458d0220
145966d6e nop
145966d6f test      al, 1
145966d71 je        0x145966f2b
145966d77 movdqa    xmm7, xmm0
145966d7b mov       rdx, qword ptr [rbp + 0x1e0]
145966d82 test      rdx, rdx
145966d85 je        0x145966d9d
145966d87 mov       rcx, qword ptr [rbp + 0x1e8]
145966d8e shl       rdx, 3
145966d92 mov       r8d, 8
145966d98 call      0x1400021d0
145966d9d movlps    qword ptr [rbp + 0x1d0], xmm6
145966da4 movd      dword ptr [rbp + 0x1d8], xmm7
145966dac mov       rcx, qword ptr [rsi + 0x290]
145966db3 mov       rdx, qword ptr [rsi + 0x298]
145966dba call      0x145886360
145966dbf imul      rax, rax, 0xf0
145966dc6 add       r14, rax
145966dc9 cmp       dword ptr [rsi + 0x970], 1
145966dd0 jne       0x145966e20
145966dd2 cmp       byte ptr [rsi + 0xab8], 0
145966dd9 je        0x145966e20
145966ddb movss     xmm7, dword ptr [rsi + 0xa34]
145966de3 subss     xmm7, dword ptr [rsi + 0x974]
145966deb divss     xmm7, dword ptr [rip + 0x48b6cd] ; 145df24c0 000070421f856b3f f32=60
145966df3 pxor      xmm0, xmm0
145966df7 maxss     xmm7, xmm0
145966dfb movss     xmm0, dword ptr [rip + 0x18888fd] ; 1471ef700 ba498c3ff6289c3f f32=1.09599996
145966e03 movaps    xmm1, xmm7
145966e06 call      0x145bf29d1
145966e0b movaps    xmm6, xmm0
145966e0e movss     xmm0, dword ptr [rip + 0x18888ee] ; 1471ef704 f6289c3f0000b840 f32=1.22000003
145966e16 movaps    xmm1, xmm7
145966e19 call      0x145bf29d1
145966e1e jmp       0x145966e2b
145966e20 movss     xmm6, dword ptr [rip + 0x4307e8] ; 145d97610 0000803f0000003f f32=1
145966e28 movaps    xmm0, xmm6
145966e2b movd      xmm8, dword ptr [rsi + 0x2b4]
145966e34 movss     xmm1, dword ptr [r13 + 0x54]
145966e3a mulss     xmm1, dword ptr [rip + 0x18888c6] ; 1471ef708 0000b84000000000 f32=5.75
145966e42 movss     xmm10, dword ptr [r14 + 0xe0]
145966e4b mulss     xmm1, xmm10
145966e50 mulss     xmm1, dword ptr [rsi + 0xaa8]
145966e58 mulss     xmm1, xmm0
145966e5c movzx     eax, word ptr [rsi + 0x2b2]
145966e63 xorps     xmm7, xmm7
145966e66 cvtsi2ss  xmm7, eax
145966e6a divss     xmm7, dword ptr [rip + 0x4307ce] ; 145d97640 0000c84200000000 f32=100
145966e72 mulss     xmm7, xmm1
145966e76 mov       r14d, dword ptr [r13 + 0x40]
145966e7a mov       eax, dword ptr [rsi + 0xa60]
145966e80 inc       eax
145966e82 mov       dword ptr [rsi + 0xa60], eax
145966e88 mov       ecx, r14d
145966e8b and       ecx, 0xffffff
145966e91 shl       rcx, 0x18
145966e95 and       eax, 0xffffff
145966e9a or        rax, rcx
145966e9d movabs    rbx, 0xf130000000000000
145966ea7 or        rbx, rax
145966eaa mov       r9d, dword ptr [r13 + 0x44]
145966eae movss     xmm9, dword ptr [r13 + 0x48]
145966eb4 lea       rax, [rbp + 0x1d0]
145966ebb mov       qword ptr [rsp + 0x38], rax
145966ec0 movss     dword ptr [rsp + 0x28], xmm7
145966ec6 movss     dword ptr [rsp + 0x20], xmm9
145966ecd mov       byte ptr [rsp + 0x30], 1
145966ed2 mov       rcx, rsi
145966ed5 mov       rdx, rbx
145966ed8 mov       r8d, r14d
145966edb call      0x145968050
145966ee0 mov       r15, qword ptr [r13 + 0x10]
145966ee4 mov       r12, qword ptr [r13 + 0x18]
145966ee8 test      r12, r12
145966eeb je        0x145967018
145966ef1 mov       rdi, rbx
145966ef4 lea       rbx, [r12*4]
145966efc call      0x140002200
145966f01 mov       edx, 4
145966f06 mov       rcx, rbx
145966f09 call      0x1400021c0
145966f0e test      rax, rax
145966f11 je        0x1459678ef
145966f17 cmp       r12, 0xc
145966f1b jae       0x145967022
145966f21 xor       ecx, ecx
145966f23 mov       rbx, rdi
145966f26 jmp       0x145967102
145966f2b cmp       qword ptr [rbx + 0x68], -1
145966f30 je        0x145967051
145966f36 lea       rdx, [rbx + 0x68]
145966f3a lea       rcx, [rbp - 0x40]
145966f3e movaps    xmm2, xmm6
145966f41 movaps    xmm3, xmm8
145966f45 call      0x1458d5410
145966f4a nop
145966f4b cmp       dword ptr [rbp - 0x40], 1
145966f4f jne       0x145967051
145966f55 movd      xmm7, dword ptr [rbp - 0x34]
145966f5a mov       rdx, qword ptr [rbp + 0x1e0]
145966f61 test      rdx, rdx
145966f64 jne       0x145966d87
145966f6a jmp       0x145966d9d
145966f6f cmp       ebx, 0xb
145966f72 je        0x145966f7d
145966f74 cmp       ebx, 7
145966f77 jne       0x14596787b
145966f7d lea       rbx, [r15 + 8]
145966f81 dec       rdi
145966f84 movabs    r12, 0x1fffffffffffffff
145966f8e and       r12, rdi
145966f91 jmp       0x145966fad
145966f93 nop       word ptr cs:[rax + rax]
145966fa0 add       rbx, 8
145966fa4 dec       r12
145966fa7 je        0x145966d4d
145966fad mov       rax, qword ptr [rbp + 0x1c8]
145966fb4 movss     xmm0, dword ptr [r15]
145966fb9 movss     xmm1, dword ptr [r15 + 4]
145966fbf subss     xmm0, dword ptr [rax]
145966fc3 subss     xmm1, dword ptr [rax + 4]
145966fc8 call      0x145bf2995
145966fcd movaps    xmm6, xmm0
145966fd0 mov       rax, qword ptr [rbp + 0x1c8]
145966fd7 movss     xmm0, dword ptr [rbx]
145966fdb movss     xmm1, dword ptr [rbx + 4]
145966fe0 subss     xmm0, dword ptr [rax]
145966fe4 subss     xmm1, dword ptr [rax + 4]
145966fe9 call      0x145bf2995
145966fee unpcklps  xmm6, xmm0
145966ff1 movaps    xmm0, xmm6
145966ff4 psrad     xmm0, 0x1f
145966ff9 psrld     xmm0, 1
145966ffe pxor      xmm0, xmm6
145967002 pshufd    xmm1, xmm0, 0x55
145967007 pcmpgtd   xmm0, xmm1
14596700b movd      eax, xmm0
14596700f test      al, 1
145967011 jne       0x145966fa0
145967013 mov       r15, rbx
145967016 jmp       0x145966fa0
145967018 mov       eax, 4
14596701d jmp       0x1459671cd
145967022 lea       rcx, [rax + r12*4]
145967026 lea       rdx, [r15 + 0x30]
14596702a imul      r8, r12, 0x38
14596702e add       r8, r15
145967031 add       r8, -4
145967035 cmp       rax, r8
145967038 setb      r8b
14596703c cmp       rdx, rcx
14596703f setb      cl
145967042 test      r8b, cl
145967045 mov       rbx, rdi
145967048 je        0x14596706e
14596704a xor       ecx, ecx
14596704c jmp       0x145967102
145967051 movd      xmm7, dword ptr [rbx + 0xb8]
145967059 mov       rdx, qword ptr [rbp + 0x1e0]
145967060 test      rdx, rdx
145967063 jne       0x145966d87
145967069 jmp       0x145966d9d
14596706e mov       rcx, r12
145967071 and       rcx, 0xfffffffffffffff8
145967075 lea       rdx, [r15 + 0x1b8]
14596707c xor       r8d, r8d
14596707f movaps    xmm0, xmmword ptr [rip + 0x188868a] ; 1471ef710 9a99193f9a99193f f32=0.600000024
145967086 nop       word ptr cs:[rax + rax]
145967090 movss     xmm1, dword ptr [rdx - 0x188]
145967098 movss     xmm2, dword ptr [rdx - 0x150]
1459670a0 unpcklps  xmm1, xmm2
1459670a3 movss     xmm2, dword ptr [rdx - 0x118]
1459670ab movss     xmm3, dword ptr [rdx - 0xe0]
1459670b3 unpcklps  xmm2, xmm3
1459670b6 movlhps   xmm1, xmm2
1459670b9 movss     xmm2, dword ptr [rdx]
1459670bd movss     xmm3, dword ptr [rdx - 0x38]
1459670c2 unpcklps  xmm3, xmm2
1459670c5 movss     xmm2, dword ptr [rdx - 0x70]
1459670ca movss     xmm4, dword ptr [rdx - 0xa8]
1459670d2 unpcklps  xmm4, xmm2
1459670d5 movlhps   xmm4, xmm3
1459670d8 mulps     xmm1, xmm0
1459670db mulps     xmm4, xmm0
1459670de movups    xmmword ptr [rax + r8*4], xmm1
1459670e3 movups    xmmword ptr [rax + r8*4 + 0x10], xmm4
1459670e9 add       r8, 8
1459670ed add       rdx, 0x1c0
1459670f4 cmp       rcx, r8
1459670f7 jne       0x145967090
1459670f9 cmp       r12, rcx
1459670fc je        0x1459671cd
145967102 mov       r8, r12
145967105 mov       rdx, rcx
145967108 and       r8, 3
14596710c je        0x14596715b
14596710e imul      rdx, rcx, 0x38
145967112 lea       r9, [rdx + r15]
145967116 add       r9, 0x30
14596711a lea       rdx, [r8 + r8]
14596711e shl       r8d, 4
145967122 sub       r8, rdx
145967125 xor       r10d, r10d
145967128 movss     xmm0, dword ptr [rip + 0x43f0c8] ; 145da61f8 9a99193f00000000 f32=0.600000024
145967130 mov       rdx, rcx
145967133 nop       word ptr cs:[rax + rax]
145967140 movss     xmm1, dword ptr [r9 + r10*4]
145967146 mulss     xmm1, xmm0
14596714a movss     dword ptr [rax + rdx*4], xmm1
14596714f inc       rdx
145967152 add       r10, 0xe
145967156 cmp       r8, r10
145967159 jne       0x145967140
14596715b sub       rcx, r12
14596715e cmp       rcx, -4
145967162 ja        0x1459671cd
145967164 imul      rcx, rdx, 0x38
145967168 add       rcx, r15
14596716b add       rcx, 0xd8
145967172 movss     xmm0, dword ptr [rip + 0x43f07e] ; 145da61f8 9a99193f00000000 f32=0.600000024
14596717a nop       word ptr [rax + rax]
145967180 movss     xmm1, dword ptr [rcx - 0xa8]
145967188 mulss     xmm1, xmm0
14596718c movss     dword ptr [rax + rdx*4], xmm1
145967191 movss     xmm1, dword ptr [rcx - 0x70]
145967196 mulss     xmm1, xmm0
14596719a movss     dword ptr [rax + rdx*4 + 4], xmm1
1459671a0 movss     xmm1, dword ptr [rcx - 0x38]
1459671a5 mulss     xmm1, xmm0
1459671a9 movss     dword ptr [rax + rdx*4 + 8], xmm1
1459671af movss     xmm1, dword ptr [rcx]
1459671b3 mulss     xmm1, xmm0
1459671b7 movss     dword ptr [rax + rdx*4 + 0xc], xmm1
1459671bd add       rdx, 4
1459671c1 add       rcx, 0xe0
1459671c8 cmp       r12, rdx
1459671cb jne       0x145967180
1459671cd mov       qword ptr [rbp - 0x28], r12
1459671d1 mov       qword ptr [rbp - 0x20], rax
1459671d5 mov       qword ptr [rbp - 0x18], r12
1459671d9 mulss     xmm10, dword ptr [rsi + 0xaa8]
1459671e2 xorps     xmm0, xmm0
1459671e5 sqrtss    xmm0, xmm10
1459671ea mulss     xmm0, dword ptr [r13 + 0x58]
1459671f0 mulss     xmm6, xmm0
1459671f4 xorps     xmm0, xmm0
1459671f7 punpcklwd xmm8, xmm0
1459671fc movss     xmm1, dword ptr [rip + 0x465e4c] ; 145dcd050 0000c03f00001041 f32=1.5
145967204 movaps    xmm4, xmm9
145967208 mulss     xmm4, xmm1
14596720c addss     xmm4, dword ptr [rip + 0x761b40] ; 1460c8d54 000060404fe4bdc0 f32=3.5
145967214 minss     xmm4, dword ptr [rip + 0x465e38] ; 145dcd054 0000104100000000 f32=9
14596721c cvtdq2ps  xmm5, xmm8
145967220 movss     xmm2, dword ptr [rsi + 0xa34]
145967228 movss     xmm3, dword ptr [rip + 0x4303e0] ; 145d97610 0000803f0000003f f32=1
145967230 addss     xmm3, xmm2
145967234 addss     xmm1, xmm2
145967238 movss     xmm8, dword ptr [r13 + 0x5c]
14596723e unpcklps  xmm6, xmm8
145967242 movups    xmmword ptr [rbp + 0x108], xmm0
145967249 movups    xmmword ptr [rbp + 0xf8], xmm0
145967250 movups    xmmword ptr [rbp + 0xe8], xmm0
145967257 movups    xmmword ptr [rbp + 0xd8], xmm0
14596725e mov       qword ptr [rbp + 0xb0], rbx
145967265 mov       qword ptr [rbp + 0xb8], 0
145967270 mov       qword ptr [rbp - 0x10], r13
145967274 mov       qword ptr [rbp - 8], r15
145967278 mov       qword ptr [rbp], r12
14596727c mov       qword ptr [rbp + 8], 0
145967284 mov       byte ptr [rbp + 0x10], 0
145967288 movss     dword ptr [rbp + 0x118], xmm7
145967290 movss     dword ptr [rbp + 0x11c], xmm7
145967298 divps     xmm5, xmmword ptr [rip + 0x1179221] ; 146ae04c0 0000c8420000c842 f32=100
14596729f mulps     xmm5, xmm6
1459672a2 movlps    qword ptr [rbp + 0x120], xmm5
1459672a9 mov       dword ptr [rbp + 0x128], 0x40000000
1459672b3 movss     dword ptr [rbp + 0x12c], xmm4
1459672bb movss     dword ptr [rbp + 0x130], xmm9
1459672c4 mov       eax, dword ptr [rbp + 0x1d8]
1459672ca mov       dword ptr [rbp + 0x13c], eax
1459672d0 mov       rcx, qword ptr [rbp + 0x1d0]
1459672d7 mov       qword ptr [rbp + 0x134], rcx
1459672de mov       qword ptr [rbp + 0x140], rcx
1459672e5 mov       dword ptr [rbp + 0x148], eax
1459672eb movss     dword ptr [rbp + 0x14c], xmm2
1459672f3 mov       dword ptr [rbp + 0x150], 0
1459672fd movss     dword ptr [rbp + 0x154], xmm3
145967305 mov       dword ptr [rbp + 0x158], 0x40000000
14596730f movups    xmmword ptr [rbp + 0xc0], xmm0
145967316 mov       qword ptr [rbp + 0xd0], 0
145967321 movups    xmmword ptr [rbp + 0x15c], xmm0
145967328 movss     dword ptr [rbp + 0x16c], xmm1
145967330 movss     dword ptr [rbp + 0x170], xmm2
145967338 mov       qword ptr [rbp - 0x40], 0
145967340 mov       qword ptr [rbp - 0x38], 8
145967348 mov       qword ptr [rbp - 0x30], 0
145967350 mov       dword ptr [rbp + 0x70], 0
145967357 mov       dword ptr [rbp + 0x78], 0
14596735e mov       byte ptr [rbp + 0x194], 1
145967365 mov       qword ptr [rbp + 0x18], 0xffffffffffffffff
14596736d mov       dword ptr [rbp + 0x80], 0
145967377 movups    xmmword ptr [rbp + 0x174], xmm0
14596737e mov       dword ptr [rbp + 0x90], 0xffffffff
145967388 movups    xmmword ptr [rbp + 0x184], xmm0
14596738f mov       rdi, qword ptr [rsi + 0x568]
145967396 cmp       rdi, qword ptr [rsi + 0x558]
14596739d jne       0x1459673ac
14596739f lea       rcx, [rsi + 0x558]
1459673a6 call      0x145d78640
1459673ab nop
1459673ac lea       r15, [r13 + 0x40]
1459673b0 imul      rcx, rdi, 0x1d8
1459673b7 add       rcx, qword ptr [rsi + 0x560]
1459673be lea       rdx, [rbp - 0x40]
1459673c2 mov       r8d, 0x1d8
1459673c8 call      0x145bf293b
1459673cd inc       rdi
1459673d0 mov       qword ptr [rsi + 0x568], rdi
1459673d7 cmp       r14d, 0x2b5
1459673de je        0x145967864
1459673e4 cmp       r14d, 0x443
1459673eb jne       0x14596740a
1459673ed lea       r8, [rip + 0x1264a14] ; 146bcbe08 4304000000000000 f32=1.52881662e-42
1459673f4 cmp       byte ptr [r8 + 0x1d], 2
1459673f9 je        0x14596740a
1459673fb add       r8, 4
1459673ff mov       rcx, rsi
145967402 mov       rdx, rbx
145967405 call      0x1459467a0
14596740a mov       qword ptr [rbp + 0x1e0], r15
145967411 lea       rax, [rip + 0x26fd28] ; 145bd7140 555657534883ec48 f32=9.2486638e+11
145967418 mov       qword ptr [rbp + 0x1e8], rax
14596741f lea       rdx, [rip + 0x126491a] ; 146bcbd40 05626f73732ec005 f32=1.89658664e+31
145967426 lea       rcx, [rbp - 0x40]
14596742a lea       r8, [rbp + 0x1e0]
145967431 call      0x145bc5690
145967436 mov       rcx, qword ptr [rbp - 0x38]
14596743a mov       rdx, qword ptr [rbp - 0x30]
14596743e mov       rdi, qword ptr [r13]
145967442 mov       qword ptr [rbp + 0x1a8], r13
145967449 mov       r14, qword ptr [r13 + 8]
14596744d mov       qword ptr [rbp + 0x1f8], rcx
145967454 call      0x1458e5790
145967459 nop
14596745a mov       r12, rax
14596745d mov       r13, rdx
145967460 mov       qword ptr [rbp + 0x200], rbx
145967467 mov       rdx, qword ptr [rbp - 0x40]
14596746b test      rdx, rdx
14596746e je        0x145967482
145967470 mov       r8d, 1
145967476 mov       rcx, qword ptr [rbp + 0x1f8]
14596747d call      0x1400021d0
145967482 test      r12, r12
145967485 mov       qword ptr [rbp + 0x1b0], rdi
14596748c cmove     r12, rdi
145967490 mov       qword ptr [rbp + 0x1b8], r14
145967497 cmove     r13, r14
14596749b mov       qword ptr [rbp + 0x1f8], r15
1459674a2 mov       qword ptr [rbp + 0x1e0], r15
1459674a9 lea       rax, [rip + 0x26fc90] ; 145bd7140 555657534883ec48 f32=9.2486638e+11
1459674b0 mov       qword ptr [rbp + 0x1e8], rax
1459674b7 lea       rdx, [rip + 0x1264890] ; 146bcbd4e 05626f73732ec005 f32=1.89658664e+31
1459674be lea       rcx, [rbp - 0x40]
1459674c2 lea       r8, [rbp + 0x1e0]
1459674c9 call      0x145bc5690
1459674ce mov       rcx, qword ptr [rbp - 0x38]
1459674d2 mov       rdx, qword ptr [rbp - 0x30]
1459674d6 mov       rax, qword ptr [rbp + 0x1a8]
1459674dd mov       rdi, qword ptr [rax + 0x20]
1459674e1 mov       r14, qword ptr [rax + 0x28]
1459674e5 mov       qword ptr [rbp + 0x1c0], rcx
1459674ec call      0x1458e5790
1459674f1 nop
1459674f2 mov       rbx, rax
1459674f5 mov       r15, rdx
1459674f8 mov       rdx, qword ptr [rbp - 0x40]
1459674fc test      rdx, rdx
1459674ff je        0x145967513
145967501 mov       r8d, 1
145967507 mov       rcx, qword ptr [rbp + 0x1c0]
14596750e call      0x1400021d0
145967513 lea       rax, [rsi + 0x618]
14596751a test      rbx, rbx
14596751d cmovne    rdi, rbx
145967521 cmove     r15, r14
145967525 mov       qword ptr [rsp + 0x28], r15
14596752a mov       qword ptr [rsp + 0x20], rdi
14596752f lea       rcx, [rbp - 0x40]
145967533 mov       rdx, qword ptr [rbp + 0x200]
14596753a mov       r8, r12
14596753d mov       r9, r13
145967540 mov       r13, rax
145967543 call      0x1458bc240
145967548 mov       rdi, qword ptr [rsi + 0x628]
14596754f cmp       rdi, qword ptr [rsi + 0x618]
145967556 jne       0x145967561
145967558 mov       rcx, r13
14596755b call      0x145bf4ee0
145967560 nop
145967561 mov       rax, qword ptr [rsi + 0x620]
145967568 mov       rcx, rdi
14596756b shl       rcx, 5
14596756f movups    xmm0, xmmword ptr [rbp - 0x40]
145967573 movups    xmm1, xmmword ptr [rbp - 0x30]
145967577 movups    xmmword ptr [rax + rcx + 0x10], xmm1
14596757c movups    xmmword ptr [rax + rcx], xmm0
145967580 inc       rdi
145967583 mov       qword ptr [rsi + 0x628], rdi
14596758a mov       rax, qword ptr [rbp + 0x1f8]
145967591 mov       qword ptr [rbp + 0x1e0], rax
145967598 lea       rax, [rip + 0x26fba1] ; 145bd7140 555657534883ec48 f32=9.2486638e+11
14596759f mov       qword ptr [rbp + 0x1e8], rax
1459675a6 lea       rdx, [rip + 0x1264793] ; 146bcbd40 05626f73732ec005 f32=1.89658664e+31
1459675ad lea       rcx, [rbp - 0x40]
1459675b1 lea       r8, [rbp + 0x1e0]
1459675b8 call      0x145bc5690
1459675bd mov       rcx, qword ptr [rbp - 0x38]
1459675c1 mov       rdx, qword ptr [rbp - 0x30]
1459675c5 mov       qword ptr [rbp + 0x200], rcx
1459675cc call      0x1458e5790
1459675d1 nop
1459675d2 mov       r14, qword ptr [rbp + 0x1a8]
1459675d9 mov       rbx, rax
1459675dc mov       r12, rdx
1459675df mov       rdx, qword ptr [rbp - 0x40]
1459675e3 test      rdx, rdx
1459675e6 je        0x1459675fa
1459675e8 mov       r8d, 1
1459675ee mov       rcx, qword ptr [rbp + 0x200]
1459675f5 call      0x1400021d0
1459675fa test      rbx, rbx
1459675fd cmove     rbx, qword ptr [rbp + 0x1b0]
145967605 cmove     r12, qword ptr [rbp + 0x1b8]
14596760d lea       r15, [rip + 0x1889bac] ; 1471f11c0 257320656e746572 f32=4.73564174e+22
145967614 mov       edi, 0x1a
145967619 mov       edx, 0x1a
14596761e mov       rcx, r15
145967621 call      0x1458e5790
145967626 test      rax, rax
145967629 cmovne    r15, rax
14596762d cmove     rdx, rdi
145967631 mov       qword ptr [rsp + 0x20], rdx
145967636 lea       rcx, [rbp - 0x40]
14596763a mov       rdx, rbx
14596763d mov       r8, r12
145967640 mov       r9, r15
145967643 call      0x1458ba4f0
145967648 mov       rdi, qword ptr [rsi + 0x628]
14596764f cmp       rdi, qword ptr [rsi + 0x618]
145967656 jne       0x145967661
145967658 mov       rcx, r13
14596765b call      0x145bf4ee0
145967660 nop
145967661 mov       rax, qword ptr [rsi + 0x620]
145967668 mov       rcx, rdi
14596766b shl       rcx, 5
14596766f movups    xmm0, xmmword ptr [rbp - 0x40]
145967673 movups    xmm1, xmmword ptr [rbp - 0x30]
145967677 movups    xmmword ptr [rax + rcx + 0x10], xmm1
14596767c movups    xmmword ptr [rax + rcx], xmm0
145967680 inc       rdi
145967683 mov       qword ptr [rsi + 0x628], rdi
14596768a call      0x140002200
14596768f mov       ecx, 0x20
145967694 mov       edx, 1
145967699 call      0x1400021c0
14596769e test      rax, rax
1459676a1 je        0x1459678c9
1459676a7 mov       qword ptr [rbp + 0x200], rax
1459676ae mov       dword ptr [rax], 0x1fee
1459676b4 mov       rdi, qword ptr [rsi + 0x628]
1459676bb cmp       rdi, qword ptr [rsi + 0x618]
1459676c2 mov       rbx, qword ptr [rbp + 0x1f8]
1459676c9 jne       0x1459676d4
1459676cb mov       rcx, r13
1459676ce call      0x145bf4ee0
1459676d3 nop
1459676d4 mov       rax, qword ptr [rsi + 0x620]
1459676db mov       rcx, rdi
1459676de shl       rcx, 5
1459676e2 mov       qword ptr [rax + rcx], 0x20
1459676ea mov       rdx, qword ptr [rbp + 0x200]
1459676f1 mov       qword ptr [rax + rcx + 8], rdx
1459676f6 mov       qword ptr [rax + rcx + 0x10], 4
1459676ff mov       word ptr [rax + rcx + 0x18], 0x2d2
145967706 inc       rdi
145967709 mov       qword ptr [rsi + 0x628], rdi
145967710 mov       edi, dword ptr [r14 + 0x60]
145967714 test      edi, edi
145967716 je        0x145967793
145967718 call      0x140002200
14596771d mov       ecx, 0x20
145967722 mov       edx, 1
145967727 call      0x1400021c0
14596772c test      rax, rax
14596772f je        0x1459678c9
145967735 mov       qword ptr [rbp + 0x200], rax
14596773c mov       dword ptr [rax], edi
14596773e mov       rdi, qword ptr [rsi + 0x628]
145967745 cmp       rdi, qword ptr [rsi + 0x618]
14596774c jne       0x145967757
14596774e mov       rcx, r13
145967751 call      0x145bf4ee0
145967756 nop
145967757 mov       rax, qword ptr [rsi + 0x620]
14596775e mov       rcx, rdi
145967761 shl       rcx, 5
145967765 mov       qword ptr [rax + rcx], 0x20
14596776d mov       rdx, qword ptr [rbp + 0x200]
145967774 mov       qword ptr [rax + rcx + 8], rdx
145967779 mov       qword ptr [rax + rcx + 0x10], 4
145967782 mov       word ptr [rax + rcx + 0x18], 0x2d2
145967789 inc       rdi
14596778c mov       qword ptr [rsi + 0x628], rdi
145967793 mov       qword ptr [rbp + 0x1e0], rbx
14596779a lea       rax, [rip + 0x26f99f] ; 145bd7140 555657534883ec48 f32=9.2486638e+11
1459677a1 mov       qword ptr [rbp + 0x1e8], rax
1459677a8 lea       rdx, [rip + 0x1264591] ; 146bcbd40 05626f73732ec005 f32=1.89658664e+31
1459677af lea       rcx, [rbp - 0x40]
1459677b3 lea       r8, [rbp + 0x1e0]
1459677ba call      0x145bc5690
1459677bf mov       rcx, qword ptr [rbp - 0x38]
1459677c3 mov       rdx, qword ptr [rbp - 0x30]
1459677c7 mov       qword ptr [rbp + 0x1f8], rcx
1459677ce call      0x1458e5790
1459677d3 nop
1459677d4 mov       r15, rax
1459677d7 mov       rbx, rdx
1459677da mov       rdx, qword ptr [rbp - 0x40]
1459677de test      rdx, rdx
1459677e1 je        0x1459677f5
1459677e3 mov       r8d, 1
1459677e9 mov       rcx, qword ptr [rbp + 0x1f8]
1459677f0 call      0x1400021d0
1459677f5 test      r15, r15
1459677f8 mov       rdx, qword ptr [rbp + 0x1b0]
1459677ff cmovne    rdx, r15
145967803 cmove     rbx, qword ptr [rbp + 0x1b8]
14596780b movzx     r9d, byte ptr [r14 + 0x64]
145967810 lea       rdi, [rbp - 0x40]
145967814 mov       rcx, rdi
145967817 mov       r8, rbx
14596781a call      0x1458e3900
14596781f mov       rcx, rsi
145967822 mov       rdx, rdi
145967825 call      0x1459443e0
14596782a movaps    xmm6, xmmword ptr [rbp + 0x210]
145967831 movaps    xmm7, xmmword ptr [rbp + 0x220]
145967838 movaps    xmm8, xmmword ptr [rbp + 0x230]
145967840 movaps    xmm9, xmmword ptr [rbp + 0x240]
145967848 movaps    xmm10, xmmword ptr [rbp + 0x250]
145967850 add       rsp, 0x2e8
145967857 pop       rbx
145967858 pop       rdi
145967859 pop       rsi
14596785a pop       r12
14596785c pop       r13
14596785e pop       r14
145967860 pop       r15
145967862 pop       rbp
145967863 ret
145967864 lea       r8, [rip + 0x126457d] ; 146bcbde8 b502000000000000 f32=9.71099836e-43
14596786b cmp       byte ptr [r8 + 0x1d], 2
145967870 jne       0x1459673fb
145967876 jmp       0x14596740a
14596787b mov       rdx, qword ptr [rbp + 0x1e0]
145967882 test      rdx, rdx
145967885 je        0x14596789d
145967887 mov       rcx, qword ptr [rbp + 0x1e8]
14596788e shl       rdx, 3
145967892 mov       r8d, 8
145967898 call      0x1400021d0
14596789d mov       dword ptr [rsp + 0x20], 0
1459678a5 lea       rcx, [rbp + 0x1d0]
1459678ac movss     xmm2, dword ptr [rip + 0x4853f0] ; 145decca4 0000c0412fdd243e f32=24
1459678b4 movss     xmm3, dword ptr [rip + 0x430034] ; 145d978f0 0000e04100000000 f32=28
1459678bc mov       rdx, rsi
1459678bf call      0x145968fe0
1459678c4 jmp       0x145966dac
1459678c9 mov       ecx, 1
1459678ce mov       edx, 0x20
1459678d3 call      0x145d934fb
1459678d8 ud2
1459678da lea       r8, [rip + 0x1889b27] ; 1471f1408 68111f4701000000 f32=40721.4062
1459678e1 mov       rcx, rdx
1459678e4 mov       rdx, r9
1459678e7 call      0x145d93893
1459678ec nop
1459678ed ud2
1459678ef mov       ecx, 4
1459678f4 mov       rdx, rbx
1459678f7 call      0x145d934fb
1459678fc ud2

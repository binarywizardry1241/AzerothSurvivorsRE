14595245b mov       rdx, qword ptr [rsi + 0x568]
145952462 mov       rax, qword ptr [rbp + 0xf0]
145952469 cmp       rax, rdx
14595246c jae       0x145955f19
145952472 mov       r13d, dword ptr [rcx]
145952475 lea       r14, [rsi + 0x618]
14595247c add       rbx, qword ptr [rsi + 0x560]
145952483 mov       rcx, rbx
145952486 call      0x145906cb0
14595248b mov       rbx, rax
14595248e mov       r15, rdx
145952491 lea       r12, [rip + 0x189e358] ; 1471f07f0 4d696e696f6e732c f32=1.80138509e+25
145952498 mov       edi, 0xf
14595249d mov       edx, 0xf
1459524a2 mov       rcx, r12
1459524a5 call      0x1458e5790
1459524aa test      rax, rax
1459524ad cmove     rax, r12
1459524b1 cmove     rdx, rdi
1459524b5 mov       qword ptr [rsp + 0x28], rdx
1459524ba mov       qword ptr [rsp + 0x20], rax
1459524bf lea       r12, [rbp + 0x110]
1459524c6 mov       rcx, r12
1459524c9 mov       rdx, qword ptr [rbp + 0x180]
1459524d0 mov       r8, rbx
1459524d3 mov       r9, r15
1459524d6 call      0x1458bc240
1459524db mov       rcx, r14
1459524de mov       rdx, r12
1459524e1 call      0x141191d70
1459524e6 test      r13d, r13d
1459524e9 je        0x145950c88
1459524ef mov       eax, r13d
1459524f2 cvtsi2ss  xmm7, rax
1459524f7 xor       ebx, ebx
1459524f9 mov       r14d, 2
1459524ff movss     xmm9, dword ptr [rip + 0x453d28] ; 145da6230 db0fc9403333b3be f32=6.28318548
145952508 movaps    xmm10, xmmword ptr [rip + 0x56f340] ; 145ec1850 0000a0400000a040 f32=5
145952510 lea       rdi, [rbp + 0x110]
145952517 jmp       0x14595256f
145952519 movss     xmm0, dword ptr [r15 + 0xb8]
145952522 mov       eax, 0xaaaaaaab
145952527 imul      r12, rax
14595252b shr       r12, 0x21
14595252f lea       eax, [r12 + r12*2]
145952533 add       eax, r14d
145952536 inc       ebx
145952538 xor       edx, edx
14595253a test      eax, eax
14595253c sete      dl
14595253f movlps    qword ptr [rbp + 0x114], xmm6
145952546 movss     dword ptr [rbp + 0x11c], xmm0
14595254e mov       dword ptr [rbp + 0x110], 1
145952558 mov       rcx, rsi
14595255b mov       r8, rdi
14595255e call      0x145969870
145952563 dec       r14d
145952566 cmp       r13d, ebx
145952569 je        0x145950c88
14595256f mov       r12d, ebx
145952572 xorps     xmm8, xmm8
145952576 cvtsi2ss  xmm8, r12
14595257b divss     xmm8, xmm7
145952580 mulss     xmm8, xmm9
145952585 movaps    xmm0, xmm8
145952589 call      0x145bf297d
14595258e movaps    xmm6, xmm0
145952591 movaps    xmm0, xmm8
145952595 call      0x145bf2977
14595259a unpcklps  xmm6, xmm0
14595259d mulps     xmm6, xmm10
1459525a1 addps     xmm6, xmmword ptr [rbp + 0x150]
1459525a8 movshdup  xmm8, xmm6
1459525ad mov       r15, qword ptr [rsi + 0x998]
1459525b4 lea       rcx, [r15 + 0x10]
1459525b8 movaps    xmm1, xmm6
1459525bb movaps    xmm2, xmm8
1459525bf call      0x1458d0220
1459525c4 test      al, 1
1459525c6 jne       0x145952522
1459525cc cmp       qword ptr [r15 + 0x68], -1
1459525d1 je        0x145952519
1459525d7 lea       rdx, [r15 + 0x68]
1459525db mov       rcx, rdi
1459525de movaps    xmm2, xmm6
1459525e1 movaps    xmm3, xmm8
1459525e5 call      0x1458d5410
1459525ea cmp       dword ptr [rbp + 0x110], 1
1459525f1 jne       0x145952519
1459525f7 movss     xmm0, dword ptr [rbp + 0x11c]
1459525ff jmp       0x145952522

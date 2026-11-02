1403d2770 55 push rbp
1403d2771 4157 push r15
1403d2773 4156 push r14
1403d2775 4154 push r12
1403d2777 56 push rsi
1403d2778 57 push rdi
1403d2779 53 push rbx
1403d277a 4881ecf0020000 sub rsp, 0x2f0
1403d2781 488dac2480000000 lea rbp, [rsp + 0x80]
1403d2789 48c78568020000feffffff mov qword ptr [rbp + 0x268], 0xfffffffffffffffe
1403d2794 4889d7 mov rdi, rdx
1403d2797 4889ce mov rsi, rcx
1403d279a 4889d1 mov rcx, rdx
1403d279d e8fe86f1ff call 0x1402eaea0
1403d27a2 4889c3 mov rbx, rax
1403d27a5 4889f9 mov rcx, rdi
1403d27a8 e8e344f0ff call 0x1402d6c90
1403d27ad 4989c6 mov r14, rax
1403d27b0 4889f9 mov rcx, rdi
1403d27b3 e8f833f0ff call 0x1402d5bb0
1403d27b8 4989c7 mov r15, rax
1403d27bb 4889f9 mov rcx, rdi
1403d27be e81d81f0ff call 0x1402da8e0
1403d27c3 4989c4 mov r12, rax
1403d27c6 4889f9 mov rcx, rdi
1403d27c9 e8a24ff0ff call 0x1402d7770
1403d27ce 48899d38020000 mov qword ptr [rbp + 0x238], rbx
1403d27d5 4c89b540020000 mov qword ptr [rbp + 0x240], r14
1403d27dc 4c89bd48020000 mov qword ptr [rbp + 0x248], r15
1403d27e3 4c89a550020000 mov qword ptr [rbp + 0x250], r12
1403d27ea 48898558020000 mov qword ptr [rbp + 0x258], rax
1403d27f1 488d5d50 lea rbx, [rbp + 0x50]
1403d27f5 4889d9 mov rcx, rbx
1403d27f8 e85370aa04 call 0x144e79850
1403d27fd c6856702000001 mov byte ptr [rbp + 0x267], 1
1403d2804 488d8d38020000 lea rcx, [rbp + 0x238]
1403d280b 4889da mov rdx, rbx
1403d280e e84d09d8ff call 0x140153160
1403d2813 90 nop
1403d2814 c6856702000001 mov byte ptr [rbp + 0x267], 1
1403d281b 488d4da0 lea rcx, [rbp - 0x60]
1403d281f e82c70aa04 call 0x144e79850
1403d2824 90 nop
1403d2825 488d4d50 lea rcx, [rbp + 0x50]
1403d2829 488d55a0 lea rdx, [rbp - 0x60]
1403d282d e85e0aaa04 call 0x144e73290
1403d2832 90 nop
1403d2833 b301 mov bl, 1
1403d2835 4883bf9000000000 cmp qword ptr [rdi + 0x90], 0
1403d283d 0f8401010000 je 0x1403d2944
1403d2843 488b4778 mov rax, qword ptr [rdi + 0x78]
1403d2847 488b8f80000000 mov rcx, qword ptr [rdi + 0x80]
1403d284e 48ba1942cea89620590e movabs rdx, 0xe592096a8ce4219
1403d2858 4531c0 xor r8d, r8d
1403d285b 660f6f05ada99f05 movdqa xmm0, xmmword ptr [rip + 0x59fa9ad]
1403d2863 660f76c9 pcmpeqd xmm1, xmm1
1403d2867 660f6f1591dea205 movdqa xmm2, xmmword ptr [rip + 0x5a2de91]
1403d286f 4821ca and rdx, rcx
1403d2872 f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1403d2877 660f6fe3 movdqa xmm4, xmm3
1403d287b 660f74e0 pcmpeqb xmm4, xmm0
1403d287f 66440fd7cc pmovmskb r9d, xmm4
1403d2884 4585c9 test r9d, r9d
1403d2887 7447 je 0x1403d28d0
1403d2889 f3450fbcd1 tzcnt r10d, r9d
1403d288e 4901d2 add r10, rdx
1403d2891 4921ca and r10, rcx
1403d2894 49f7da neg r10
1403d2897 4f8d1452 lea r10, [r10 + r10*2]
1403d289b f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403d28a2 660f74e2 pcmpeqb xmm4, xmm2
1403d28a6 66440fd7dc pmovmskb r11d, xmm4
1403d28ab 4181fbffff0000 cmp r11d, 0xffff
1403d28b2 7437 je 0x1403d28eb
1403d28b4 458d51ff lea r10d, [r9 - 1]
1403d28b8 664521ca and r10w, r9w
1403d28bc 4589d1 mov r9d, r10d
1403d28bf 75c8 jne 0x1403d2889
1403d28c1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1403d28d0 660f74d9 pcmpeqb xmm3, xmm1
1403d28d4 66440fd7cb pmovmskb r9d, xmm3
1403d28d9 4585c9 test r9d, r9d
1403d28dc 7566 jne 0x1403d2944
1403d28de 4c01c2 add rdx, r8
1403d28e1 4883c210 add rdx, 0x10
1403d28e5 4983c010 add r8, 0x10
1403d28e9 eb84 jmp 0x1403d286f
1403d28eb 4a8d04d0 lea rax, [rax + r10*8]
1403d28ef 488b40f8 mov rax, qword ptr [rax - 8]
1403d28f3 483b8718020000 cmp rax, qword ptr [rdi + 0x218]
1403d28fa 7348 jae 0x1403d2944
1403d28fc 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403d2903 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1403d2907 4885c9 test rcx, rcx
1403d290a 7438 je 0x1403d2944
1403d290c 488b87e0010000 mov rax, qword ptr [rdi + 0x1e0]
1403d2913 48f7d1 not rcx
1403d2916 486bc938 imul rcx, rcx, 0x38
1403d291a 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
1403d291f 7523 jne 0x1403d2944
1403d2921 4801c8 add rax, rcx
1403d2924 488b5810 mov rbx, qword ptr [rax + 0x10]
1403d2928 488d5550 lea rdx, [rbp + 0x50]
1403d292c 4889d9 mov rcx, rbx
1403d292f e88c03a304 call 0x144e02cc0
1403d2934 90 nop
1403d2935 488d5740 lea rdx, [rdi + 0x40]
1403d2939 4889d9 mov rcx, rbx
1403d293c e8df04a304 call 0x144e02e20
1403d2941 90 nop
1403d2942 89c3 mov ebx, eax
1403d2944 4c8bb7a0050000 mov r14, qword ptr [rdi + 0x5a0]
1403d294b 488d8d40010000 lea rcx, [rbp + 0x140]
1403d2952 488d5550 lea rdx, [rbp + 0x50]
1403d2956 41b8b0000000 mov r8d, 0xb0
1403d295c e8daff8105 call 0x145bf293b
1403d2961 4c89b500010000 mov qword ptr [rbp + 0x100], r14
1403d2968 c7850801000000000000 mov dword ptr [rbp + 0x108], 0
1403d2972 48c7851001000010000000 mov qword ptr [rbp + 0x110], 0x10
1403d297d 660fefc0 pxor xmm0, xmm0
1403d2981 f30f7f8518010000 movdqu xmmword ptr [rbp + 0x118], xmm0
1403d2989 48c7852801000010000000 mov qword ptr [rbp + 0x128], 0x10
1403d2994 f30f7f8530010000 movdqu xmmword ptr [rbp + 0x130], xmm0
1403d299c 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
1403d29a7 48c785f801000004000000 mov qword ptr [rbp + 0x1f8], 4
1403d29b2 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1403d29bd 889d08020000 mov byte ptr [rbp + 0x208], bl
1403d29c3 f30f6f8538020000 movdqu xmm0, xmmword ptr [rbp + 0x238]
1403d29cb f30f6f8d48020000 movdqu xmm1, xmmword ptr [rbp + 0x248]
1403d29d3 f30f7f8510020000 movdqu xmmword ptr [rbp + 0x210], xmm0
1403d29db f30f7f8d20020000 movdqu xmmword ptr [rbp + 0x220], xmm1
1403d29e3 488b8558020000 mov rax, qword ptr [rbp + 0x258]
1403d29ea 48898530020000 mov qword ptr [rbp + 0x230], rax
1403d29f1 c6856702000000 mov byte ptr [rbp + 0x267], 0
1403d29f8 488d4da0 lea rcx, [rbp - 0x60]
1403d29fc e88feefdff call 0x1403b1890
1403d2a01 90 nop
1403d2a02 488d8d00010000 lea rcx, [rbp + 0x100]
1403d2a09 4889fa mov rdx, rdi
1403d2a0c e89f7affff call 0x1403ca4b0
1403d2a11 90 nop
1403d2a12 488d9500010000 lea rdx, [rbp + 0x100]
1403d2a19 41b838010000 mov r8d, 0x138
1403d2a1f 4889f1 mov rcx, rsi
1403d2a22 e814ff8105 call 0x145bf293b
1403d2a27 4889f0 mov rax, rsi
1403d2a2a 4881c4f0020000 add rsp, 0x2f0
1403d2a31 5b pop rbx
1403d2a32 5f pop rdi
1403d2a33 5e pop rsi
1403d2a34 415c pop r12
1403d2a36 415e pop r14
1403d2a38 415f pop r15
1403d2a3a 5d pop rbp
1403d2a3b c3 ret

1403ce6a0 55 push rbp
1403ce6a1 4157 push r15
1403ce6a3 4156 push r14
1403ce6a5 4155 push r13
1403ce6a7 4154 push r12
1403ce6a9 56 push rsi
1403ce6aa 57 push rdi
1403ce6ab 53 push rbx
1403ce6ac 4881ecc8020000 sub rsp, 0x2c8
1403ce6b3 488dac2480000000 lea rbp, [rsp + 0x80]
1403ce6bb 48c78540020000feffffff mov qword ptr [rbp + 0x240], 0xfffffffffffffffe
1403ce6c6 4889d7 mov rdi, rdx
1403ce6c9 4889ce mov rsi, rcx
1403ce6cc 4889d1 mov rcx, rdx
1403ce6cf e80cc2f0ff call 0x1402da8e0
1403ce6d4 4889c3 mov rbx, rax
1403ce6d7 4889f9 mov rcx, rdi
1403ce6da e8b185f0ff call 0x1402d6c90
1403ce6df 4989c6 mov r14, rax
1403ce6e2 4889f9 mov rcx, rdi
1403ce6e5 e8660af3ff call 0x1402ff150
1403ce6ea 4989c7 mov r15, rax
1403ce6ed 48899d28020000 mov qword ptr [rbp + 0x228], rbx
1403ce6f4 4c89b530020000 mov qword ptr [rbp + 0x230], r14
1403ce6fb 4c8d6550 lea r12, [rbp + 0x50]
1403ce6ff 4c89e1 mov rcx, r12
1403ce702 e849b1aa04 call 0x144e79850
1403ce707 c6853f02000001 mov byte ptr [rbp + 0x23f], 1
1403ce70e 488d8d28020000 lea rcx, [rbp + 0x228]
1403ce715 4c89e2 mov rdx, r12
1403ce718 e833c1d7ff call 0x14014a850
1403ce71d 90 nop
1403ce71e c6853f02000001 mov byte ptr [rbp + 0x23f], 1
1403ce725 488d4da0 lea rcx, [rbp - 0x60]
1403ce729 e822b1aa04 call 0x144e79850
1403ce72e 90 nop
1403ce72f 488d4da0 lea rcx, [rbp - 0x60]
1403ce733 4c89fa mov rdx, r15
1403ce736 e8d551aa04 call 0x144e73910
1403ce73b 90 nop
1403ce73c 488d4d50 lea rcx, [rbp + 0x50]
1403ce740 488d55a0 lea rdx, [rbp - 0x60]
1403ce744 e8474baa04 call 0x144e73290
1403ce749 90 nop
1403ce74a 41b401 mov r12b, 1
1403ce74d 4883bf9000000000 cmp qword ptr [rdi + 0x90], 0
1403ce755 0f84fa000000 je 0x1403ce855
1403ce75b 488b4778 mov rax, qword ptr [rdi + 0x78]
1403ce75f 488b8f80000000 mov rcx, qword ptr [rdi + 0x80]
1403ce766 48ba1942cea89620590e movabs rdx, 0xe592096a8ce4219
1403ce770 4531c0 xor r8d, r8d
1403ce773 660f6f0595ea9f05 movdqa xmm0, xmmword ptr [rip + 0x59fea95]
1403ce77b 660f76c9 pcmpeqd xmm1, xmm1
1403ce77f 660f6f15791fa305 movdqa xmm2, xmmword ptr [rip + 0x5a31f79]
1403ce787 4821ca and rdx, rcx
1403ce78a f30f6f1c10 movdqu xmm3, xmmword ptr [rax + rdx]
1403ce78f 660f6fe3 movdqa xmm4, xmm3
1403ce793 660f74e0 pcmpeqb xmm4, xmm0
1403ce797 66440fd7cc pmovmskb r9d, xmm4
1403ce79c 4585c9 test r9d, r9d
1403ce79f 743f je 0x1403ce7e0
1403ce7a1 f3450fbcd1 tzcnt r10d, r9d
1403ce7a6 4901d2 add r10, rdx
1403ce7a9 4921ca and r10, rcx
1403ce7ac 49f7da neg r10
1403ce7af 4f8d1452 lea r10, [r10 + r10*2]
1403ce7b3 f3420f6f64d0e8 movdqu xmm4, xmmword ptr [rax + r10*8 - 0x18]
1403ce7ba 660f74e2 pcmpeqb xmm4, xmm2
1403ce7be 66440fd7dc pmovmskb r11d, xmm4
1403ce7c3 4181fbffff0000 cmp r11d, 0xffff
1403ce7ca 742f je 0x1403ce7fb
1403ce7cc 458d51ff lea r10d, [r9 - 1]
1403ce7d0 664521ca and r10w, r9w
1403ce7d4 4589d1 mov r9d, r10d
1403ce7d7 75c8 jne 0x1403ce7a1
1403ce7d9 0f1f8000000000 nop dword ptr [rax]
1403ce7e0 660f74d9 pcmpeqb xmm3, xmm1
1403ce7e4 66440fd7cb pmovmskb r9d, xmm3
1403ce7e9 4585c9 test r9d, r9d
1403ce7ec 7567 jne 0x1403ce855
1403ce7ee 4c01c2 add rdx, r8
1403ce7f1 4883c210 add rdx, 0x10
1403ce7f5 4983c010 add r8, 0x10
1403ce7f9 eb8c jmp 0x1403ce787
1403ce7fb 4a8d04d0 lea rax, [rax + r10*8]
1403ce7ff 488b40f8 mov rax, qword ptr [rax - 8]
1403ce803 483b8718020000 cmp rax, qword ptr [rdi + 0x218]
1403ce80a 7349 jae 0x1403ce855
1403ce80c 488b8f10020000 mov rcx, qword ptr [rdi + 0x210]
1403ce813 488b0cc1 mov rcx, qword ptr [rcx + rax*8]
1403ce817 4885c9 test rcx, rcx
1403ce81a 7439 je 0x1403ce855
1403ce81c 488b87e0010000 mov rax, qword ptr [rdi + 0x1e0]
1403ce823 48f7d1 not rcx
1403ce826 486bc938 imul rcx, rcx, 0x38
1403ce82a 807c083001 cmp byte ptr [rax + rcx + 0x30], 1
1403ce82f 7524 jne 0x1403ce855
1403ce831 4801c8 add rax, rcx
1403ce834 4c8b6010 mov r12, qword ptr [rax + 0x10]
1403ce838 488d5550 lea rdx, [rbp + 0x50]
1403ce83c 4c89e1 mov rcx, r12
1403ce83f e87c44a304 call 0x144e02cc0
1403ce844 90 nop
1403ce845 488d5740 lea rdx, [rdi + 0x40]
1403ce849 4c89e1 mov rcx, r12
1403ce84c e8cf45a304 call 0x144e02e20
1403ce851 90 nop
1403ce852 4189c4 mov r12d, eax
1403ce855 4c8bafa0050000 mov r13, qword ptr [rdi + 0x5a0]
1403ce85c 488d8d40010000 lea rcx, [rbp + 0x140]
1403ce863 488d5550 lea rdx, [rbp + 0x50]
1403ce867 41b8b0000000 mov r8d, 0xb0
1403ce86d e8c9408205 call 0x145bf293b
1403ce872 4c89ad00010000 mov qword ptr [rbp + 0x100], r13
1403ce879 c7850801000000000000 mov dword ptr [rbp + 0x108], 0
1403ce883 48c7851001000010000000 mov qword ptr [rbp + 0x110], 0x10
1403ce88e 660fefc0 pxor xmm0, xmm0
1403ce892 f30f7f8518010000 movdqu xmmword ptr [rbp + 0x118], xmm0
1403ce89a 48c7852801000010000000 mov qword ptr [rbp + 0x128], 0x10
1403ce8a5 f30f7f8530010000 movdqu xmmword ptr [rbp + 0x130], xmm0
1403ce8ad 48c785f001000000000000 mov qword ptr [rbp + 0x1f0], 0
1403ce8b8 48c785f801000004000000 mov qword ptr [rbp + 0x1f8], 4
1403ce8c3 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1403ce8ce 4488a508020000 mov byte ptr [rbp + 0x208], r12b
1403ce8d5 48899d10020000 mov qword ptr [rbp + 0x210], rbx
1403ce8dc 4c89b518020000 mov qword ptr [rbp + 0x218], r14
1403ce8e3 4c89bd20020000 mov qword ptr [rbp + 0x220], r15
1403ce8ea c6853f02000000 mov byte ptr [rbp + 0x23f], 0
1403ce8f1 488d4da0 lea rcx, [rbp - 0x60]
1403ce8f5 e8962ffeff call 0x1403b1890
1403ce8fa 90 nop
1403ce8fb 488d8d00010000 lea rcx, [rbp + 0x100]
1403ce902 4889fa mov rdx, rdi
1403ce905 e82648ffff call 0x1403c3130
1403ce90a 90 nop
1403ce90b 488d9500010000 lea rdx, [rbp + 0x100]
1403ce912 41b828010000 mov r8d, 0x128
1403ce918 4889f1 mov rcx, rsi
1403ce91b e81b408205 call 0x145bf293b
1403ce920 4889f0 mov rax, rsi
1403ce923 4881c4c8020000 add rsp, 0x2c8
1403ce92a 5b pop rbx
1403ce92b 5f pop rdi
1403ce92c 5e pop rsi
1403ce92d 415c pop r12
1403ce92f 415d pop r13
1403ce931 415e pop r14
1403ce933 415f pop r15
1403ce935 5d pop rbp
1403ce936 c3 ret

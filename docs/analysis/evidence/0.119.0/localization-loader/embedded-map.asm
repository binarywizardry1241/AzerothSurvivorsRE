0000000145aa77a0  55                     push rbp
0000000145aa77a1  56                     push rsi
0000000145aa77a2  57                     push rdi
0000000145aa77a3  4881ec90000000         sub rsp, 0x90
0000000145aa77aa  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145aa77b2  48c74508feffffff       mov qword ptr [rbp + 8], 0xfffffffffffffffe
0000000145aa77ba  488955f8               mov qword ptr [rbp - 8], rdx
0000000145aa77be  4889ce                 mov rsi, rcx
0000000145aa77c1  c6450701               mov byte ptr [rbp + 7], 1
0000000145aa77c5  e8e65a4900             call 0x145f3d2b0
0000000145aa77ca  90                     nop
0000000145aa77cb  80781001               cmp byte ptr [rax + 0x10], 1
0000000145aa77cf  0f8580000000           jne 0x145aa7855
0000000145aa77d5  488b08                 mov rcx, qword ptr [rax]
0000000145aa77d8  488b5008               mov rdx, qword ptr [rax + 8]
0000000145aa77dc  4c8d4101               lea r8, [rcx + 1]
0000000145aa77e0  4c8900                 mov qword ptr [rax], r8
0000000145aa77e3  0f1005e6048201         movups xmm0, xmmword ptr [rip + 0x18204e6]
0000000145aa77ea  0f2945d0               movaps xmmword ptr [rbp - 0x30], xmm0
0000000145aa77ee  0f1005cb048201         movups xmm0, xmmword ptr [rip + 0x18204cb]
0000000145aa77f5  0f2945c0               movaps xmmword ptr [rbp - 0x40], xmm0
0000000145aa77f9  48894de0               mov qword ptr [rbp - 0x20], rcx
0000000145aa77fd  488955e8               mov qword ptr [rbp - 0x18], rdx
0000000145aa7801  488b7df8               mov rdi, qword ptr [rbp - 8]
0000000145aa7805  488b4718               mov rax, qword ptr [rdi + 0x18]
0000000145aa7809  482b4708               sub rax, qword ptr [rdi + 8]
0000000145aa780d  7569                   jne 0x145aa7878
0000000145aa780f  0f1007                 movups xmm0, xmmword ptr [rdi]
0000000145aa7812  0f104f10               movups xmm1, xmmword ptr [rdi + 0x10]
0000000145aa7816  0f294db0               movaps xmmword ptr [rbp - 0x50], xmm1
0000000145aa781a  0f2945a0               movaps xmmword ptr [rbp - 0x60], xmm0
0000000145aa781e  c6450600               mov byte ptr [rbp + 6], 0
0000000145aa7822  488d4da0               lea rcx, [rbp - 0x60]
0000000145aa7826  488d55c0               lea rdx, [rbp - 0x40]
0000000145aa782a  e851381b00             call 0x145c5b080
0000000145aa782f  90                     nop
0000000145aa7830  0f2845c0               movaps xmm0, xmmword ptr [rbp - 0x40]
0000000145aa7834  0f284dd0               movaps xmm1, xmmword ptr [rbp - 0x30]
0000000145aa7838  0f2855e0               movaps xmm2, xmmword ptr [rbp - 0x20]
0000000145aa783c  0f115620               movups xmmword ptr [rsi + 0x20], xmm2
0000000145aa7840  0f114e10               movups xmmword ptr [rsi + 0x10], xmm1
0000000145aa7844  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145aa7847  4889f0                 mov rax, rsi
0000000145aa784a  4881c490000000         add rsp, 0x90
0000000145aa7851  5f                     pop rdi
0000000145aa7852  5e                     pop rsi
0000000145aa7853  5d                     pop rbp
0000000145aa7854  c3                     ret
0000000145aa7855  c6450701               mov byte ptr [rbp + 7], 1
0000000145aa7859  4889c7                 mov rdi, rax
0000000145aa785c  e88f9a4a00             call 0x145f512f0
0000000145aa7861  90                     nop
0000000145aa7862  4889c1                 mov rcx, rax
0000000145aa7865  4889f8                 mov rax, rdi
0000000145aa7868  48890f                 mov qword ptr [rdi], rcx
0000000145aa786b  48895708               mov qword ptr [rdi + 8], rdx
0000000145aa786f  c6471001               mov byte ptr [rdi + 0x10], 1
0000000145aa7873  e964ffffff             jmp 0x145aa77dc
0000000145aa7878  4c8d45e0               lea r8, [rbp - 0x20]
0000000145aa787c  48c1e804               shr rax, 4
0000000145aa7880  48baabaaaaaaaaaaaaaa   movabs rdx, 0xaaaaaaaaaaaaaaab
0000000145aa788a  480fafd0               imul rdx, rax
0000000145aa788e  c6450601               mov byte ptr [rbp + 6], 1
0000000145aa7892  488d4dc0               lea rcx, [rbp - 0x40]
0000000145aa7896  41b101                 mov r9b, 1
0000000145aa7899  e8922f6700             call 0x14611a830
0000000145aa789e  90                     nop
0000000145aa789f  e96bffffff             jmp 0x145aa780f

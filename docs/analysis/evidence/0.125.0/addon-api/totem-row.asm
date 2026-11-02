0000000145cd5c00  55                              push rbp
0000000145cd5c01  4157                            push r15
0000000145cd5c03  4156                            push r14
0000000145cd5c05  4155                            push r13
0000000145cd5c07  4154                            push r12
0000000145cd5c09  56                              push rsi
0000000145cd5c0a  57                              push rdi
0000000145cd5c0b  53                              push rbx
0000000145cd5c0c  4881ec68010000                  sub rsp, 0x168
0000000145cd5c13  488dac2480000000                lea rbp, [rsp + 0x80]
0000000145cd5c1b  0f29bdd0000000                  movaps xmmword ptr [rbp + 0xd0], xmm7
0000000145cd5c22  0f29b5c0000000                  movaps xmmword ptr [rbp + 0xc0], xmm6
0000000145cd5c29  48c785b8000000feffffff          mov qword ptr [rbp + 0xb8], 0xfffffffffffffffe
0000000145cd5c34  498b00                          mov rax, qword ptr [r8]
0000000145cd5c37  48898588000000                  mov qword ptr [rbp + 0x88], rax
0000000145cd5c3e  4d8b4808                        mov r9, qword ptr [r8 + 8]
0000000145cd5c42  4839d1                          cmp rcx, rdx
0000000145cd5c45  0f84c9020000                    je 0x145cd5f14
0000000145cd5c4b  498b4010                        mov rax, qword ptr [r8 + 0x10]
0000000145cd5c4f  48894560                        mov qword ptr [rbp + 0x60], rax
0000000145cd5c53  4829ca                          sub rdx, rcx
0000000145cd5c56  48c1ea03                        shr rdx, 3
0000000145cd5c5a  48b8abaaaaaaaaaaaaaa            movabs rax, 0xaaaaaaaaaaaaaaab
0000000145cd5c64  480fafc2                        imul rax, rdx
0000000145cd5c68  48894568                        mov qword ptr [rbp + 0x68], rax
0000000145cd5c6c  31c0                            xor eax, eax
0000000145cd5c6e  f30f10353e9b4e00                movss xmm6, dword ptr [rip + 0x4e9b3e]
0000000145cd5c76  f30f103dd2964e00                movss xmm7, dword ptr [rip + 0x4e96d2]
0000000145cd5c7e  488d3d3bc432fa                  lea rdi, [rip - 0x5cd3bc5]
0000000145cd5c85  4c8d7dc8                        lea r15, [rbp - 0x38]
0000000145cd5c89  4c8da590000000                  lea r12, [rbp + 0x90]
0000000145cd5c90  48894d70                        mov qword ptr [rbp + 0x70], rcx
0000000145cd5c94  eb3f                            jmp 0x145cd5cd5
0000000145cd5c96  662e0f1f840000000000            nop word ptr cs:[rax + rax]
0000000145cd5ca0  4c8b4d78                        mov r9, qword ptr [rbp + 0x78]
0000000145cd5ca4  4b8d0449                        lea rax, [r9 + r9*2]
0000000145cd5ca8  488b4dc0                        mov rcx, qword ptr [rbp - 0x40]
0000000145cd5cac  488b5560                        mov rdx, qword ptr [rbp + 0x60]
0000000145cd5cb0  48894cc210                      mov qword ptr [rdx + rax*8 + 0x10], rcx
0000000145cd5cb5  0f1045b0                        movups xmm0, xmmword ptr [rbp - 0x50]
0000000145cd5cb9  0f1104c2                        movups xmmword ptr [rdx + rax*8], xmm0
0000000145cd5cbd  49ffc1                          inc r9
0000000145cd5cc0  488b4558                        mov rax, qword ptr [rbp + 0x58]
0000000145cd5cc4  48ffc0                          inc rax
0000000145cd5cc7  483b4568                        cmp rax, qword ptr [rbp + 0x68]
0000000145cd5ccb  488b4d70                        mov rcx, qword ptr [rbp + 0x70]
0000000145cd5ccf  0f843f020000                    je 0x145cd5f14
0000000145cd5cd5  48894558                        mov qword ptr [rbp + 0x58], rax
0000000145cd5cd9  488d0440                        lea rax, [rax + rax*2]
0000000145cd5cdd  488d14c1                        lea rdx, [rcx + rax*8]
0000000145cd5ce1  4883c208                        add rdx, 8
0000000145cd5ce5  48895550                        mov qword ptr [rbp + 0x50], rdx
0000000145cd5ce9  488d54c110                      lea rdx, [rcx + rax*8 + 0x10]
0000000145cd5cee  48895548                        mov qword ptr [rbp + 0x48], rdx
0000000145cd5cf2  488b04c1                        mov rax, qword ptr [rcx + rax*8]
0000000145cd5cf6  488b18                          mov rbx, qword ptr [rax]
0000000145cd5cf9  f30f104358                      movss xmm0, dword ptr [rbx + 0x58]
0000000145cd5cfe  f30f59c6                        mulss xmm0, xmm6
0000000145cd5d02  f30f594020                      mulss xmm0, dword ptr [rax + 0x20]
0000000145cd5d07  f30f594048                      mulss xmm0, dword ptr [rax + 0x48]
0000000145cd5d0c  48837b080d                      cmp qword ptr [rbx + 8], 0xd
0000000145cd5d11  4c894d78                        mov qword ptr [rbp + 0x78], r9
0000000145cd5d15  7539                            jne 0x145cd5d50
0000000145cd5d17  488b03                          mov rax, qword ptr [rbx]
0000000145cd5d1a  488b08                          mov rcx, qword ptr [rax]
0000000145cd5d1d  48ba646976696e655f73            movabs rdx, 0x735f656e69766964
0000000145cd5d27  4831d1                          xor rcx, rdx
0000000145cd5d2a  488b4005                        mov rax, qword ptr [rax + 5]
0000000145cd5d2e  48ba655f736869656c64            movabs rdx, 0x646c656968735f65
0000000145cd5d38  4831d0                          xor rax, rdx
0000000145cd5d3b  4809c8                          or rax, rcx
0000000145cd5d3e  7510                            jne 0x145cd5d50
0000000145cd5d40  f30f5dc7                        minss xmm0, xmm7
0000000145cd5d44  6666662e0f1f840000000000        nop word ptr cs:[rax + rax]
0000000145cd5d50  f30f1185b4000000                movss dword ptr [rbp + 0xb4], xmm0
0000000145cd5d58  48899d90000000                  mov qword ptr [rbp + 0x90], rbx
0000000145cd5d5f  4889fe                          mov rsi, rdi
0000000145cd5d62  4889bd98000000                  mov qword ptr [rbp + 0x98], rdi
0000000145cd5d69  4d89fe                          mov r14, r15
0000000145cd5d6c  4c89f9                          mov rcx, r15
0000000145cd5d6f  488d153f4d3001                  lea rdx, [rip + 0x1304d3f]
0000000145cd5d76  4d89e0                          mov r8, r12
0000000145cd5d79  e8f2ed3000                      call 0x145fe4b70
0000000145cd5d7e  90                              nop 
0000000145cd5d7f  488b4dd0                        mov rcx, qword ptr [rbp - 0x30]
0000000145cd5d83  488b55d8                        mov rdx, qword ptr [rbp - 0x28]
0000000145cd5d87  4c8b6b10                        mov r13, qword ptr [rbx + 0x10]
0000000145cd5d8b  4c8b6318                        mov r12, qword ptr [rbx + 0x18]
0000000145cd5d8f  48898d80000000                  mov qword ptr [rbp + 0x80], rcx
0000000145cd5d96  e8353fe2ff                      call 0x145af9cd0
0000000145cd5d9b  90                              nop 
0000000145cd5d9c  4989c7                          mov r15, rax
0000000145cd5d9f  4889d7                          mov rdi, rdx
0000000145cd5da2  488b55c8                        mov rdx, qword ptr [rbp - 0x38]
0000000145cd5da6  4885d2                          test rdx, rdx
0000000145cd5da9  7412                            je 0x145cd5dbd
0000000145cd5dab  41b801000000                    mov r8d, 1
0000000145cd5db1  488b8d80000000                  mov rcx, qword ptr [rbp + 0x80]
0000000145cd5db8  e813c432fa                      call 0x1400021d0
0000000145cd5dbd  4d85ff                          test r15, r15
0000000145cd5dc0  4d0f45ef                        cmovne r13, r15
0000000145cd5dc4  490f44fc                        cmove rdi, r12
0000000145cd5dc8  48c745c800000000                mov qword ptr [rbp - 0x38], 0
0000000145cd5dd0  48c745d001000000                mov qword ptr [rbp - 0x30], 1
0000000145cd5dd8  48c745d800000000                mov qword ptr [rbp - 0x28], 0
0000000145cd5de0  4885ff                          test rdi, rdi
0000000145cd5de3  4d89f7                          mov r15, r14
0000000145cd5de6  0f85f5000000                    jne 0x145cd5ee1
0000000145cd5dec  4c01ef                          add rdi, r13
0000000145cd5def  4c89e9                          mov rcx, r13
0000000145cd5df2  4889fa                          mov rdx, rdi
0000000145cd5df5  4d89f8                          mov r8, r15
0000000145cd5df8  e8530a0000                      call 0x145cd6850
0000000145cd5dfd  90                              nop 
0000000145cd5dfe  488b45d8                        mov rax, qword ptr [rbp - 0x28]
0000000145cd5e02  488985a0000000                  mov qword ptr [rbp + 0xa0], rax
0000000145cd5e09  488d4340                        lea rax, [rbx + 0x40]
0000000145cd5e0d  0f1045c8                        movups xmm0, xmmword ptr [rbp - 0x38]
0000000145cd5e11  48895dc8                        mov qword ptr [rbp - 0x38], rbx
0000000145cd5e15  4889f7                          mov rdi, rsi
0000000145cd5e18  488975d0                        mov qword ptr [rbp - 0x30], rsi
0000000145cd5e1c  488945d8                        mov qword ptr [rbp - 0x28], rax
0000000145cd5e20  4883c320                        add rbx, 0x20
0000000145cd5e24  488d05f5073200                  lea rax, [rip + 0x3207f5]
0000000145cd5e2b  488945e0                        mov qword ptr [rbp - 0x20], rax
0000000145cd5e2f  488d4550                        lea rax, [rbp + 0x50]
0000000145cd5e33  488945e8                        mov qword ptr [rbp - 0x18], rax
0000000145cd5e37  488d0582429bfb                  lea rax, [rip - 0x464bd7e]
0000000145cd5e3e  488945f0                        mov qword ptr [rbp - 0x10], rax
0000000145cd5e42  488d0587569f01                  lea rax, [rip + 0x19f5687]
0000000145cd5e49  488945f8                        mov qword ptr [rbp - 8], rax
0000000145cd5e4d  488d05bc163200                  lea rax, [rip + 0x3216bc]
0000000145cd5e54  48894500                        mov qword ptr [rbp], rax
0000000145cd5e58  488d4548                        lea rax, [rbp + 0x48]
0000000145cd5e5c  48894508                        mov qword ptr [rbp + 8], rax
0000000145cd5e60  488d05b99c4dfb                  lea rax, [rip - 0x4b26347]
0000000145cd5e67  48894510                        mov qword ptr [rbp + 0x10], rax
0000000145cd5e6b  488d85b4000000                  lea rax, [rbp + 0xb4]
0000000145cd5e72  48894518                        mov qword ptr [rbp + 0x18], rax
0000000145cd5e76  488d05a3fa3100                  lea rax, [rip + 0x31faa3]
0000000145cd5e7d  48894520                        mov qword ptr [rbp + 0x20], rax
0000000145cd5e81  48895d28                        mov qword ptr [rbp + 0x28], rbx
0000000145cd5e85  0f298590000000                  movaps xmmword ptr [rbp + 0x90], xmm0
0000000145cd5e8c  48897530                        mov qword ptr [rbp + 0x30], rsi
0000000145cd5e90  4c8da590000000                  lea r12, [rbp + 0x90]
0000000145cd5e97  4c896538                        mov qword ptr [rbp + 0x38], r12
0000000145cd5e9b  488d053ec232fa                  lea rax, [rip - 0x5cd3dc2]
0000000145cd5ea2  48894540                        mov qword ptr [rbp + 0x40], rax
0000000145cd5ea6  488d4db0                        lea rcx, [rbp - 0x50]
0000000145cd5eaa  488d1527569f01                  lea rdx, [rip + 0x19f5627]
0000000145cd5eb1  4d89f8                          mov r8, r15
0000000145cd5eb4  e8b7ec3000                      call 0x145fe4b70
0000000145cd5eb9  90                              nop 
0000000145cd5eba  488b9590000000                  mov rdx, qword ptr [rbp + 0x90]
0000000145cd5ec1  4885d2                          test rdx, rdx
0000000145cd5ec4  0f84d6fdffff                    je 0x145cd5ca0
0000000145cd5eca  488b8d98000000                  mov rcx, qword ptr [rbp + 0x98]
0000000145cd5ed1  41b801000000                    mov r8d, 1
0000000145cd5ed7  e8f4c232fa                      call 0x1400021d0
0000000145cd5edc  e9bffdffff                      jmp 0x145cd5ca0
0000000145cd5ee1  4989f8                          mov r8, rdi
0000000145cd5ee4  49c1e802                        shr r8, 2
0000000145cd5ee8  89f8                            mov eax, edi
0000000145cd5eea  83e003                          and eax, 3
0000000145cd5eed  4883f801                        cmp rax, 1
0000000145cd5ef1  4983d8ff                        sbb r8, -1
0000000145cd5ef5  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145cd5efe  41b901000000                    mov r9d, 1
0000000145cd5f04  4c89f9                          mov rcx, r15
0000000145cd5f07  31d2                            xor edx, edx
0000000145cd5f09  e8b2f83300                      call 0x1460157c0
0000000145cd5f0e  90                              nop 
0000000145cd5f0f  e9d8feffff                      jmp 0x145cd5dec
0000000145cd5f14  488b8588000000                  mov rax, qword ptr [rbp + 0x88]
0000000145cd5f1b  4c8908                          mov qword ptr [rax], r9
0000000145cd5f1e  0f28b5c0000000                  movaps xmm6, xmmword ptr [rbp + 0xc0]
0000000145cd5f25  0f28bdd0000000                  movaps xmm7, xmmword ptr [rbp + 0xd0]
0000000145cd5f2c  4881c468010000                  add rsp, 0x168
0000000145cd5f33  5b                              pop rbx
0000000145cd5f34  5f                              pop rdi
0000000145cd5f35  5e                              pop rsi
0000000145cd5f36  415c                            pop r12
0000000145cd5f38  415d                            pop r13
0000000145cd5f3a  415e                            pop r14
0000000145cd5f3c  415f                            pop r15
0000000145cd5f3e  5d                              pop rbp
0000000145cd5f3f  c3                              ret 

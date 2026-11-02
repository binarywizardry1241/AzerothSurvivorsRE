0000000145bfdea0  55                              push rbp
0000000145bfdea1  4157                            push r15
0000000145bfdea3  4156                            push r14
0000000145bfdea5  4155                            push r13
0000000145bfdea7  4154                            push r12
0000000145bfdea9  56                              push rsi
0000000145bfdeaa  57                              push rdi
0000000145bfdeab  53                              push rbx
0000000145bfdeac  b828180000                      mov eax, 0x1828
0000000145bfdeb1  e82a344100                      call 0x1460112e0
0000000145bfdeb6  4829c4                          sub rsp, rax
0000000145bfdeb9  488dac2480000000                lea rbp, [rsp + 0x80]
0000000145bfdec1  48c785a0170000feffffff          mov qword ptr [rbp + 0x17a0], 0xfffffffffffffffe
0000000145bfdecc  4889d7                          mov rdi, rdx
0000000145bfdecf  4889ce                          mov rsi, rcx
0000000145bfded2  4d85c0                          test r8, r8
0000000145bfded5  7413                            je 0x145bfdeea
0000000145bfded7  4c8bb7580a0000                  mov r14, qword ptr [rdi + 0xa58]
0000000145bfdede  4d89f4                          mov r12, r14
0000000145bfdee1  4d29c4                          sub r12, r8
0000000145bfdee4  0f83c9000000                    jae 0x145bfdfb3
0000000145bfdeea  498b19                          mov rbx, qword ptr [r9]
0000000145bfdeed  488d8d60170000                  lea rcx, [rbp + 0x1760]
0000000145bfdef4  4889fa                          mov rdx, rdi
0000000145bfdef7  e8c4750200                      call 0x145c254c0
0000000145bfdefc  90                              nop 
0000000145bfdefd  488d8d48170000                  lea rcx, [rbp + 0x1748]
0000000145bfdf04  4889fa                          mov rdx, rdi
0000000145bfdf07  e814f10600                      call 0x145c6d020
0000000145bfdf0c  90                              nop 
0000000145bfdf0d  488d8de0130000                  lea rcx, [rbp + 0x13e0]
0000000145bfdf14  4889fa                          mov rdx, rdi
0000000145bfdf17  e884b60100                      call 0x145c195a0
0000000145bfdf1c  90                              nop 
0000000145bfdf1d  488d4da8                        lea rcx, [rbp - 0x58]
0000000145bfdf21  4889fa                          mov rdx, rdi
0000000145bfdf24  4989d8                          mov r8, rbx
0000000145bfdf27  e8f47ff2ff                      call 0x145b25f20
0000000145bfdf2c  90                              nop 
0000000145bfdf2d  488b8570170000                  mov rax, qword ptr [rbp + 0x1770]
0000000145bfdf34  488985d0090000                  mov qword ptr [rbp + 0x9d0], rax
0000000145bfdf3b  0f108560170000                  movups xmm0, xmmword ptr [rbp + 0x1760]
0000000145bfdf42  0f2985c0090000                  movaps xmmword ptr [rbp + 0x9c0], xmm0
0000000145bfdf49  0f108548170000                  movups xmm0, xmmword ptr [rbp + 0x1748]
0000000145bfdf50  0f1185d8090000                  movups xmmword ptr [rbp + 0x9d8], xmm0
0000000145bfdf57  488b8558170000                  mov rax, qword ptr [rbp + 0x1758]
0000000145bfdf5e  488985e8090000                  mov qword ptr [rbp + 0x9e8], rax
0000000145bfdf65  0f1085e0130000                  movups xmm0, xmmword ptr [rbp + 0x13e0]
0000000145bfdf6c  0f2985f0090000                  movaps xmmword ptr [rbp + 0x9f0], xmm0
0000000145bfdf73  488b85f0130000                  mov rax, qword ptr [rbp + 0x13f0]
0000000145bfdf7a  488985000a0000                  mov qword ptr [rbp + 0xa00], rax
0000000145bfdf81  488d8d080a0000                  lea rcx, [rbp + 0xa08]
0000000145bfdf88  488d55a8                        lea rdx, [rbp - 0x58]
0000000145bfdf8c  41b820030000                    mov r8d, 0x320
0000000145bfdf92  e8843e4100                      call 0x146011e1b
0000000145bfdf97  90                              nop 
0000000145bfdf98  4889f9                          mov rcx, rdi
0000000145bfdf9b  e890840100                      call 0x145c16430
0000000145bfdfa0  90                              nop 
0000000145bfdfa1  488d95c0090000                  lea rdx, [rbp + 0x9c0]
0000000145bfdfa8  41b868030000                    mov r8d, 0x368
0000000145bfdfae  e9ac020000                      jmp 0x145bfe25f
0000000145bfdfb3  4889b588170000                  mov qword ptr [rbp + 0x1788], rsi
0000000145bfdfba  4c898d78170000                  mov qword ptr [rbp + 0x1778], r9
0000000145bfdfc1  4c898580170000                  mov qword ptr [rbp + 0x1780], r8
0000000145bfdfc8  498d40ff                        lea rax, [r8 - 1]
0000000145bfdfcc  4c39f0                          cmp rax, r14
0000000145bfdfcf  48898590170000                  mov qword ptr [rbp + 0x1790], rax
0000000145bfdfd6  0f83b7020000                    jae 0x145bfe293
0000000145bfdfdc  488bb7500a0000                  mov rsi, qword ptr [rdi + 0xa50]
0000000145bfdfe3  4869d8180a0000                  imul rbx, rax, 0xa18
0000000145bfdfea  4c8d2c1e                        lea r13, [rsi + rbx]
0000000145bfdfee  4c8b3c1e                        mov r15, qword ptr [rsi + rbx]
0000000145bfdff2  488d141e                        lea rdx, [rsi + rbx]
0000000145bfdff6  4883c208                        add rdx, 8
0000000145bfdffa  488d8dc0090000                  lea rcx, [rbp + 0x9c0]
0000000145bfe001  41b8100a0000                    mov r8d, 0xa10
0000000145bfe007  e80f3e4100                      call 0x146011e1b
0000000145bfe00c  488d141e                        lea rdx, [rsi + rbx]
0000000145bfe010  4881c2180a0000                  add rdx, 0xa18
0000000145bfe017  4d69c4180a0000                  imul r8, r12, 0xa18
0000000145bfe01e  4c89e9                          mov rcx, r13
0000000145bfe021  e8013e4100                      call 0x146011e27
0000000145bfe026  49ffce                          dec r14
0000000145bfe029  4c89b7580a0000                  mov qword ptr [rdi + 0xa58], r14
0000000145bfe030  4983ff02                        cmp r15, 2
0000000145bfe034  0f8459020000                    je 0x145bfe293
0000000145bfe03a  4c897da8                        mov qword ptr [rbp - 0x58], r15
0000000145bfe03e  488d4db0                        lea rcx, [rbp - 0x50]
0000000145bfe042  488d95c0090000                  lea rdx, [rbp + 0x9c0]
0000000145bfe049  41b8100a0000                    mov r8d, 0xa10
0000000145bfe04f  e8c73d4100                      call 0x146011e1b
0000000145bfe054  80bf7e0d000001                  cmp byte ptr [rdi + 0xd7e], 1
0000000145bfe05b  488bb590170000                  mov rsi, qword ptr [rbp + 0x1790]
0000000145bfe062  0f85f6000000                    jne 0x145bfe15e
0000000145bfe068  488b87780c0000                  mov rax, qword ptr [rdi + 0xc78]
0000000145bfe06f  488985e0130000                  mov qword ptr [rbp + 0x13e0], rax
0000000145bfe076  488d8770060000                  lea rax, [rdi + 0x670]
0000000145bfe07d  488b8f78060000                  mov rcx, qword ptr [rdi + 0x678]
0000000145bfe084  488b9780060000                  mov rdx, qword ptr [rdi + 0x680]
0000000145bfe08b  48c7878006000000000000          mov qword ptr [rdi + 0x680], 0
0000000145bfe096  488995d8090000                  mov qword ptr [rbp + 0x9d8], rdx
0000000145bfe09d  48c1e205                        shl rdx, 5
0000000145bfe0a1  4801ca                          add rdx, rcx
0000000145bfe0a4  48c785e009000000000000          mov qword ptr [rbp + 0x9e0], 0
0000000145bfe0af  48898dc0090000                  mov qword ptr [rbp + 0x9c0], rcx
0000000145bfe0b6  488995c8090000                  mov qword ptr [rbp + 0x9c8], rdx
0000000145bfe0bd  488985d0090000                  mov qword ptr [rbp + 0x9d0], rax
0000000145bfe0c4  488d8f080b0000                  lea rcx, [rdi + 0xb08]
0000000145bfe0cb  4c8dbde0130000                  lea r15, [rbp + 0x13e0]
0000000145bfe0d2  4c89bde8090000                  mov qword ptr [rbp + 0x9e8], r15
0000000145bfe0d9  c6859f17000001                  mov byte ptr [rbp + 0x179f], 1
0000000145bfe0e0  488d95c0090000                  lea rdx, [rbp + 0x9c0]
0000000145bfe0e7  e884910a00                      call 0x145ca7270
0000000145bfe0ec  90                              nop 
0000000145bfe0ed  488d8788060000                  lea rax, [rdi + 0x688]
0000000145bfe0f4  488b8f90060000                  mov rcx, qword ptr [rdi + 0x690]
0000000145bfe0fb  488b9798060000                  mov rdx, qword ptr [rdi + 0x698]
0000000145bfe102  48c7879806000000000000          mov qword ptr [rdi + 0x698], 0
0000000145bfe10d  4c8d0452                        lea r8, [rdx + rdx*2]
0000000145bfe111  4e8d04c1                        lea r8, [rcx + r8*8]
0000000145bfe115  488995d8090000                  mov qword ptr [rbp + 0x9d8], rdx
0000000145bfe11c  48c785e009000000000000          mov qword ptr [rbp + 0x9e0], 0
0000000145bfe127  48898dc0090000                  mov qword ptr [rbp + 0x9c0], rcx
0000000145bfe12e  4c8985c8090000                  mov qword ptr [rbp + 0x9c8], r8
0000000145bfe135  488985d0090000                  mov qword ptr [rbp + 0x9d0], rax
0000000145bfe13c  488d8f200b0000                  lea rcx, [rdi + 0xb20]
0000000145bfe143  4c89bde8090000                  mov qword ptr [rbp + 0x9e8], r15
0000000145bfe14a  c6859f17000001                  mov byte ptr [rbp + 0x179f], 1
0000000145bfe151  488d95c0090000                  lea rdx, [rbp + 0x9c0]
0000000145bfe158  e843900a00                      call 0x145ca71a0
0000000145bfe15d  90                              nop 
0000000145bfe15e  488d55a8                        lea rdx, [rbp - 0x58]
0000000145bfe162  4889f9                          mov rcx, rdi
0000000145bfe165  e866750500                      call 0x145c556d0
0000000145bfe16a  488b8580170000                  mov rax, qword ptr [rbp + 0x1780]
0000000145bfe171  488987780c0000                  mov qword ptr [rdi + 0xc78], rax
0000000145bfe178  488b97f0020000                  mov rdx, qword ptr [rdi + 0x2f0]
0000000145bfe17f  4c8b87f8020000                  mov r8, qword ptr [rdi + 0x2f8]
0000000145bfe186  c6859f17000001                  mov byte ptr [rbp + 0x179f], 1
0000000145bfe18d  48897c2420                      mov qword ptr [rsp + 0x20], rdi
0000000145bfe192  488d8de0130000                  lea rcx, [rbp + 0x13e0]
0000000145bfe199  4c8b8d78170000                  mov r9, qword ptr [rbp + 0x1778]
0000000145bfe1a0  e89b2aefff                      call 0x145af0c40
0000000145bfe1a5  90                              nop 
0000000145bfe1a6  c6859e17000001                  mov byte ptr [rbp + 0x179e], 1
0000000145bfe1ad  4889f9                          mov rcx, rdi
0000000145bfe1b0  e87b820100                      call 0x145c16430
0000000145bfe1b5  90                              nop 
0000000145bfe1b6  48c787780c000000000000          mov qword ptr [rdi + 0xc78], 0
0000000145bfe1c1  4c8d7da8                        lea r15, [rbp - 0x58]
0000000145bfe1c5  4889f9                          mov rcx, rdi
0000000145bfe1c8  4c89fa                          mov rdx, r15
0000000145bfe1cb  e800750500                      call 0x145c556d0
0000000145bfe1d0  488d8dc0090000                  lea rcx, [rbp + 0x9c0]
0000000145bfe1d7  41b8180a0000                    mov r8d, 0xa18
0000000145bfe1dd  4c89fa                          mov rdx, r15
0000000145bfe1e0  e8363c4100                      call 0x146011e1b
0000000145bfe1e5  4c8bbf580a0000                  mov r15, qword ptr [rdi + 0xa58]
0000000145bfe1ec  4939f7                          cmp r15, rsi
0000000145bfe1ef  0f8289000000                    jb 0x145bfe27e
0000000145bfe1f5  488d8f480a0000                  lea rcx, [rdi + 0xa48]
0000000145bfe1fc  4c3b39                          cmp r15, qword ptr [rcx]
0000000145bfe1ff  7506                            jne 0x145bfe207
0000000145bfe201  e81ab15900                      call 0x146199320
0000000145bfe206  90                              nop 
0000000145bfe207  48039f500a0000                  add rbx, qword ptr [rdi + 0xa50]
0000000145bfe20e  4c89f8                          mov rax, r15
0000000145bfe211  4829f0                          sub rax, rsi
0000000145bfe214  7616                            jbe 0x145bfe22c
0000000145bfe216  488d8b180a0000                  lea rcx, [rbx + 0xa18]
0000000145bfe21d  4c69c0180a0000                  imul r8, rax, 0xa18
0000000145bfe224  4889da                          mov rdx, rbx
0000000145bfe227  e8fb3b4100                      call 0x146011e27
0000000145bfe22c  488d95c0090000                  lea rdx, [rbp + 0x9c0]
0000000145bfe233  41b8180a0000                    mov r8d, 0xa18
0000000145bfe239  4889d9                          mov rcx, rbx
0000000145bfe23c  e8da3b4100                      call 0x146011e1b
0000000145bfe241  49ffc7                          inc r15
0000000145bfe244  4c89bf580a0000                  mov qword ptr [rdi + 0xa58], r15
0000000145bfe24b  488d95e0130000                  lea rdx, [rbp + 0x13e0]
0000000145bfe252  41b868030000                    mov r8d, 0x368
0000000145bfe258  488bb588170000                  mov rsi, qword ptr [rbp + 0x1788]
0000000145bfe25f  4889f1                          mov rcx, rsi
0000000145bfe262  e8b43b4100                      call 0x146011e1b
0000000145bfe267  4889f0                          mov rax, rsi
0000000145bfe26a  4881c428180000                  add rsp, 0x1828
0000000145bfe271  5b                              pop rbx
0000000145bfe272  5f                              pop rdi
0000000145bfe273  5e                              pop rsi
0000000145bfe274  415c                            pop r12
0000000145bfe276  415d                            pop r13
0000000145bfe278  415e                            pop r14
0000000145bfe27a  415f                            pop r15
0000000145bfe27c  5d                              pop rbp
0000000145bfe27d  c3                              ret 
0000000145bfe27e  4c8d058b7dac01                  lea r8, [rip + 0x1ac7d8b]
0000000145bfe285  4889f1                          mov rcx, rsi
0000000145bfe288  4c89fa                          mov rdx, r15
0000000145bfe28b  e844ce5b00                      call 0x1461bb0d4
0000000145bfe290  90                              nop 
0000000145bfe291  0f0b                            ud2 
0000000145bfe293  4c8d055e7dac01                  lea r8, [rip + 0x1ac7d5e]
0000000145bfe29a  488b8d90170000                  mov rcx, qword ptr [rbp + 0x1790]
0000000145bfe2a1  4c89f2                          mov rdx, r14
0000000145bfe2a4  e8b2ce5b00                      call 0x1461bb15b
0000000145bfe2a9  0f0b                            ud2 

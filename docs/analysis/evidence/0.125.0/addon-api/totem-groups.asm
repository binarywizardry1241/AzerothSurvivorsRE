0000000145c093a0  55                              push rbp
0000000145c093a1  4157                            push r15
0000000145c093a3  4156                            push r14
0000000145c093a5  4155                            push r13
0000000145c093a7  4154                            push r12
0000000145c093a9  56                              push rsi
0000000145c093aa  57                              push rdi
0000000145c093ab  53                              push rbx
0000000145c093ac  4881ecd8000000                  sub rsp, 0xd8
0000000145c093b3  488dac2480000000                lea rbp, [rsp + 0x80]
0000000145c093bb  0f297d40                        movaps xmmword ptr [rbp + 0x40], xmm7
0000000145c093bf  0f297530                        movaps xmmword ptr [rbp + 0x30], xmm6
0000000145c093c3  48c74528feffffff                mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
0000000145c093cb  4989ce                          mov r14, rcx
0000000145c093ce  48c7451000000000                mov qword ptr [rbp + 0x10], 0
0000000145c093d6  48c7451808000000                mov qword ptr [rbp + 0x18], 8
0000000145c093de  48c7452000000000                mov qword ptr [rbp + 0x20], 0
0000000145c093e6  4c6bba5006000078                imul r15, qword ptr [rdx + 0x650], 0x78
0000000145c093ee  4c8baa48060000                  mov r13, qword ptr [rdx + 0x648]
0000000145c093f5  4d01ef                          add r15, r13
0000000145c093f8  f30f10b2c00c0000                movss xmm6, dword ptr [rdx + 0xcc0]
0000000145c09400  4d39fd                          cmp r13, r15
0000000145c09403  0f84fa000000                    je 0x145c09503
0000000145c09409  f3410f107d6c                    movss xmm7, dword ptr [r13 + 0x6c]
0000000145c0940f  0f2efe                          ucomiss xmm7, xmm6
0000000145c09412  7706                            ja 0x145c0941a
0000000145c09414  4983c578                        add r13, 0x78
0000000145c09418  ebe6                            jmp 0x145c09400
0000000145c0941a  4c897500                        mov qword ptr [rbp], r14
0000000145c0941e  488b7d18                        mov rdi, qword ptr [rbp + 0x18]
0000000145c09422  488b4d20                        mov rcx, qword ptr [rbp + 0x20]
0000000145c09426  498d4578                        lea rax, [r13 + 0x78]
0000000145c0942a  48894508                        mov qword ptr [rbp + 8], rax
0000000145c0942e  48894df8                        mov qword ptr [rbp - 8], rcx
0000000145c09432  4885c9                          test rcx, rcx
0000000145c09435  0f8485000000                    je 0x145c094c0
0000000145c0943b  488b45f8                        mov rax, qword ptr [rbp - 8]
0000000145c0943f  488d04c500000000                lea rax, [rax*8]
0000000145c09447  488d3440                        lea rsi, [rax + rax*2]
0000000145c0944b  498b4500                        mov rax, qword ptr [r13]
0000000145c0944f  488b18                          mov rbx, qword ptr [rax]
0000000145c09452  4c8b7008                        mov r14, qword ptr [rax + 8]
0000000145c09456  4531e4                          xor r12d, r12d
0000000145c09459  eb0e                            jmp 0x145c09469
0000000145c0945b  0f1f440000                      nop dword ptr [rax + rax]
0000000145c09460  4983c418                        add r12, 0x18
0000000145c09464  4c39e6                          cmp rsi, r12
0000000145c09467  7457                            je 0x145c094c0
0000000145c09469  4a8b0427                        mov rax, qword ptr [rdi + r12]
0000000145c0946d  488b00                          mov rax, qword ptr [rax]
0000000145c09470  4c397008                        cmp qword ptr [rax + 8], r14
0000000145c09474  75ea                            jne 0x145c09460
0000000145c09476  488b08                          mov rcx, qword ptr [rax]
0000000145c09479  4889da                          mov rdx, rbx
0000000145c0947c  4d89f0                          mov r8, r14
0000000145c0947f  e89d894000                      call 0x146011e21
0000000145c09484  85c0                            test eax, eax
0000000145c09486  75d8                            jne 0x145c09460
0000000145c09488  f3420f10442710                  movss xmm0, dword ptr [rdi + r12 + 0x10]
0000000145c0948f  0f28c8                          movaps xmm1, xmm0
0000000145c09492  f30f5dcf                        minss xmm1, xmm7
0000000145c09496  0f28d1                          movaps xmm2, xmm1
0000000145c09499  f30fc2d103                      cmpunordss xmm2, xmm1
0000000145c0949e  0f54c2                          andps xmm0, xmm2
0000000145c094a1  0f55d1                          andnps xmm2, xmm1
0000000145c094a4  0f56d0                          orps xmm2, xmm0
0000000145c094a7  4aff442708                      inc qword ptr [rdi + r12 + 8]
0000000145c094ac  f3420f11542710                  movss dword ptr [rdi + r12 + 0x10], xmm2
0000000145c094b3  4c8b7500                        mov r14, qword ptr [rbp]
0000000145c094b7  4c8b6d08                        mov r13, qword ptr [rbp + 8]
0000000145c094bb  e940ffffff                      jmp 0x145c09400
0000000145c094c0  488b75f8                        mov rsi, qword ptr [rbp - 8]
0000000145c094c4  483b7510                        cmp rsi, qword ptr [rbp + 0x10]
0000000145c094c8  4c8b7500                        mov r14, qword ptr [rbp]
0000000145c094cc  750e                            jne 0x145c094dc
0000000145c094ce  488d4d10                        lea rcx, [rbp + 0x10]
0000000145c094d2  e889c34000                      call 0x146015860
0000000145c094d7  90                              nop 
0000000145c094d8  488b7d18                        mov rdi, qword ptr [rbp + 0x18]
0000000145c094dc  488d0476                        lea rax, [rsi + rsi*2]
0000000145c094e0  4c892cc7                        mov qword ptr [rdi + rax*8], r13
0000000145c094e4  48c744c70801000000              mov qword ptr [rdi + rax*8 + 8], 1
0000000145c094ed  f30f117cc710                    movss dword ptr [rdi + rax*8 + 0x10], xmm7
0000000145c094f3  48ffc6                          inc rsi
0000000145c094f6  48897520                        mov qword ptr [rbp + 0x20], rsi
0000000145c094fa  4c8b6d08                        mov r13, qword ptr [rbp + 8]
0000000145c094fe  e9fdfeffff                      jmp 0x145c09400
0000000145c09503  488b5d18                        mov rbx, qword ptr [rbp + 0x18]
0000000145c09507  488b7520                        mov rsi, qword ptr [rbp + 0x20]
0000000145c0950b  488d04f500000000                lea rax, [rsi*8]
0000000145c09513  488d3c40                        lea rdi, [rax + rax*2]
0000000145c09517  4885f6                          test rsi, rsi
0000000145c0951a  7427                            je 0x145c09543
0000000145c0951c  e8df8c3ffa                      call 0x140002200
0000000145c09521  ba08000000                      mov edx, 8
0000000145c09526  4889f9                          mov rcx, rdi
0000000145c09529  e8928c3ffa                      call 0x1400021c0
0000000145c0952e  4885c0                          test rax, rax
0000000145c09531  7515                            jne 0x145c09548
0000000145c09533  b908000000                      mov ecx, 8
0000000145c09538  4889fa                          mov rdx, rdi
0000000145c0953b  e84b1b5b00                      call 0x1461bb08b
0000000145c09540  90                              nop 
0000000145c09541  0f0b                            ud2 
0000000145c09543  b808000000                      mov eax, 8
0000000145c09548  4801df                          add rdi, rbx
0000000145c0954b  488975e0                        mov qword ptr [rbp - 0x20], rsi
0000000145c0954f  488945e8                        mov qword ptr [rbp - 0x18], rax
0000000145c09553  488d4df0                        lea rcx, [rbp - 0x10]
0000000145c09557  48c745f000000000                mov qword ptr [rbp - 0x10], 0
0000000145c0955f  488945d8                        mov qword ptr [rbp - 0x28], rax
0000000145c09563  48894dc8                        mov qword ptr [rbp - 0x38], rcx
0000000145c09567  48c745d000000000                mov qword ptr [rbp - 0x30], 0
0000000145c0956f  4c8d45c8                        lea r8, [rbp - 0x38]
0000000145c09573  4889d9                          mov rcx, rbx
0000000145c09576  4889fa                          mov rdx, rdi
0000000145c09579  e882c60c00                      call 0x145cd5c00
0000000145c0957e  90                              nop 
0000000145c0957f  0f1045e0                        movups xmm0, xmmword ptr [rbp - 0x20]
0000000145c09583  0f2945b0                        movaps xmmword ptr [rbp - 0x50], xmm0
0000000145c09587  488b5df0                        mov rbx, qword ptr [rbp - 0x10]
0000000145c0958b  48895dc0                        mov qword ptr [rbp - 0x40], rbx
0000000145c0958f  488b7db8                        mov rdi, qword ptr [rbp - 0x48]
0000000145c09593  48c744242001000000              mov qword ptr [rsp + 0x20], 1
0000000145c0959c  4c8d0d96d0ab01                  lea r9, [rip + 0x1abd096]
0000000145c095a3  488d4dc8                        lea rcx, [rbp - 0x38]
0000000145c095a7  4889fa                          mov rdx, rdi
0000000145c095aa  4989d8                          mov r8, rbx
0000000145c095ad  e8ee49eaff                      call 0x145aadfa0
0000000145c095b2  90                              nop 
0000000145c095b3  488b45d8                        mov rax, qword ptr [rbp - 0x28]
0000000145c095b7  49894610                        mov qword ptr [r14 + 0x10], rax
0000000145c095bb  0f1045c8                        movups xmm0, xmmword ptr [rbp - 0x38]
0000000145c095bf  410f1106                        movups xmmword ptr [r14], xmm0
0000000145c095c3  488b4510                        mov rax, qword ptr [rbp + 0x10]
0000000145c095c7  4885c0                          test rax, rax
0000000145c095ca  7417                            je 0x145c095e3
0000000145c095cc  488b4d18                        mov rcx, qword ptr [rbp + 0x18]
0000000145c095d0  48c1e003                        shl rax, 3
0000000145c095d4  488d1440                        lea rdx, [rax + rax*2]
0000000145c095d8  41b808000000                    mov r8d, 8
0000000145c095de  e8ed8b3ffa                      call 0x1400021d0
0000000145c095e3  4885db                          test rbx, rbx
0000000145c095e6  742a                            je 0x145c09612
0000000145c095e8  488d7708                        lea rsi, [rdi + 8]
0000000145c095ec  eb0b                            jmp 0x145c095f9
0000000145c095ee  6690                            nop 
0000000145c095f0  4883c618                        add rsi, 0x18
0000000145c095f4  48ffcb                          dec rbx
0000000145c095f7  7419                            je 0x145c09612
0000000145c095f9  488b56f8                        mov rdx, qword ptr [rsi - 8]
0000000145c095fd  4885d2                          test rdx, rdx
0000000145c09600  74ee                            je 0x145c095f0
0000000145c09602  488b0e                          mov rcx, qword ptr [rsi]
0000000145c09605  41b801000000                    mov r8d, 1
0000000145c0960b  e8c08b3ffa                      call 0x1400021d0
0000000145c09610  ebde                            jmp 0x145c095f0
0000000145c09612  488b45b0                        mov rax, qword ptr [rbp - 0x50]
0000000145c09616  4885c0                          test rax, rax
0000000145c09619  7416                            je 0x145c09631
0000000145c0961b  48c1e003                        shl rax, 3
0000000145c0961f  488d1440                        lea rdx, [rax + rax*2]
0000000145c09623  41b808000000                    mov r8d, 8
0000000145c09629  4889f9                          mov rcx, rdi
0000000145c0962c  e89f8b3ffa                      call 0x1400021d0
0000000145c09631  4c89f0                          mov rax, r14
0000000145c09634  0f287530                        movaps xmm6, xmmword ptr [rbp + 0x30]
0000000145c09638  0f287d40                        movaps xmm7, xmmword ptr [rbp + 0x40]
0000000145c0963c  4881c4d8000000                  add rsp, 0xd8
0000000145c09643  5b                              pop rbx
0000000145c09644  5f                              pop rdi
0000000145c09645  5e                              pop rsi
0000000145c09646  415c                            pop r12
0000000145c09648  415d                            pop r13
0000000145c0964a  415e                            pop r14
0000000145c0964c  415f                            pop r15
0000000145c0964e  5d                              pop rbp
0000000145c0964f  c3                              ret 

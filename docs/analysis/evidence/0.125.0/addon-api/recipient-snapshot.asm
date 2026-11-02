0000000145af0c40  55                              push rbp
0000000145af0c41  4156                            push r14
0000000145af0c43  56                              push rsi
0000000145af0c44  57                              push rdi
0000000145af0c45  53                              push rbx
0000000145af0c46  4881ec10070000                  sub rsp, 0x710
0000000145af0c4d  488dac2480000000                lea rbp, [rsp + 0x80]
0000000145af0c55  0f29b580060000                  movaps xmmword ptr [rbp + 0x680], xmm6
0000000145af0c5c  48c78578060000feffffff          mov qword ptr [rbp + 0x678], 0xfffffffffffffffe
0000000145af0c67  4889ce                          mov rsi, rcx
0000000145af0c6a  488bbde0060000                  mov rdi, qword ptr [rbp + 0x6e0]
0000000145af0c71  4885d2                          test rdx, rdx
0000000145af0c74  0f95c0                          setne al
0000000145af0c77  4983f802                        cmp r8, 2
0000000145af0c7b  0f94c1                          sete cl
0000000145af0c7e  20c1                            and cl, al
0000000145af0c80  80f901                          cmp cl, 1
0000000145af0c83  7571                            jne 0x145af0cf6
0000000145af0c85  66813a656e                      cmp word ptr [rdx], 0x6e65
0000000145af0c8a  746e                            je 0x145af0cfa
0000000145af0c8c  b801000000                      mov eax, 1
0000000145af0c91  66813a706c                      cmp word ptr [rdx], 0x6c70
0000000145af0c96  746b                            je 0x145af0d03
0000000145af0c98  66813a6373                      cmp word ptr [rdx], 0x7363
0000000145af0c9d  746b                            je 0x145af0d0a
0000000145af0c9f  66813a6465                      cmp word ptr [rdx], 0x6564
0000000145af0ca4  746b                            je 0x145af0d11
0000000145af0ca6  66813a7074                      cmp word ptr [rdx], 0x7470
0000000145af0cab  746b                            je 0x145af0d18
0000000145af0cad  66813a6573                      cmp word ptr [rdx], 0x7365
0000000145af0cb2  746b                            je 0x145af0d1f
0000000145af0cb4  66813a6672                      cmp word ptr [rdx], 0x7266
0000000145af0cb9  746b                            je 0x145af0d26
0000000145af0cbb  66813a726f                      cmp word ptr [rdx], 0x6f72
0000000145af0cc0  746b                            je 0x145af0d2d
0000000145af0cc2  66813a7472                      cmp word ptr [rdx], 0x7274
0000000145af0cc7  746b                            je 0x145af0d34
0000000145af0cc9  66813a7275                      cmp word ptr [rdx], 0x7572
0000000145af0cce  746b                            je 0x145af0d3b
0000000145af0cd0  66813a756b                      cmp word ptr [rdx], 0x6b75
0000000145af0cd5  746b                            je 0x145af0d42
0000000145af0cd7  66813a7a68                      cmp word ptr [rdx], 0x687a
0000000145af0cdc  746b                            je 0x145af0d49
0000000145af0cde  66813a6a61                      cmp word ptr [rdx], 0x616a
0000000145af0ce3  746b                            je 0x145af0d50
0000000145af0ce5  31c0                            xor eax, eax
0000000145af0ce7  66813a6b6f                      cmp word ptr [rdx], 0x6f6b
0000000145af0cec  0f94c0                          sete al
0000000145af0cef  b90d000000                      mov ecx, 0xd
0000000145af0cf4  eb5f                            jmp 0x145af0d55
0000000145af0cf6  31c0                            xor eax, eax
0000000145af0cf8  eb5b                            jmp 0x145af0d55
0000000145af0cfa  b801000000                      mov eax, 1
0000000145af0cff  31c9                            xor ecx, ecx
0000000145af0d01  eb52                            jmp 0x145af0d55
0000000145af0d03  b901000000                      mov ecx, 1
0000000145af0d08  eb4b                            jmp 0x145af0d55
0000000145af0d0a  b902000000                      mov ecx, 2
0000000145af0d0f  eb44                            jmp 0x145af0d55
0000000145af0d11  b903000000                      mov ecx, 3
0000000145af0d16  eb3d                            jmp 0x145af0d55
0000000145af0d18  b904000000                      mov ecx, 4
0000000145af0d1d  eb36                            jmp 0x145af0d55
0000000145af0d1f  b905000000                      mov ecx, 5
0000000145af0d24  eb2f                            jmp 0x145af0d55
0000000145af0d26  b906000000                      mov ecx, 6
0000000145af0d2b  eb28                            jmp 0x145af0d55
0000000145af0d2d  b907000000                      mov ecx, 7
0000000145af0d32  eb21                            jmp 0x145af0d55
0000000145af0d34  b908000000                      mov ecx, 8
0000000145af0d39  eb1a                            jmp 0x145af0d55
0000000145af0d3b  b909000000                      mov ecx, 9
0000000145af0d40  eb13                            jmp 0x145af0d55
0000000145af0d42  b90a000000                      mov ecx, 0xa
0000000145af0d47  eb0c                            jmp 0x145af0d55
0000000145af0d49  b90b000000                      mov ecx, 0xb
0000000145af0d4e  eb05                            jmp 0x145af0d55
0000000145af0d50  b90c000000                      mov ecx, 0xc
0000000145af0d55  8b158d06b102                    mov edx, dword ptr [rip + 0x2b1068d]
0000000145af0d5b  654c8b042558000000              mov r8, qword ptr gs:[0x58]
0000000145af0d64  4d8b34d0                        mov r14, qword ptr [r8 + rdx*8]
0000000145af0d68  410f10b660030000                movups xmm6, xmmword ptr [r14 + 0x360]
0000000145af0d70  49898660030000                  mov qword ptr [r14 + 0x360], rax
0000000145af0d77  49898e68030000                  mov qword ptr [r14 + 0x368], rcx
0000000145af0d7e  498b19                          mov rbx, qword ptr [r9]
0000000145af0d81  488d8d60060000                  lea rcx, [rbp + 0x660]
0000000145af0d88  4889fa                          mov rdx, rdi
0000000145af0d8b  e830471300                      call 0x145c254c0
0000000145af0d90  90                              nop 
0000000145af0d91  488d8d48060000                  lea rcx, [rbp + 0x648]
0000000145af0d98  4889fa                          mov rdx, rdi
0000000145af0d9b  e880c21700                      call 0x145c6d020
0000000145af0da0  90                              nop 
0000000145af0da1  488d8d30060000                  lea rcx, [rbp + 0x630]
0000000145af0da8  4889fa                          mov rdx, rdi
0000000145af0dab  e8f0871200                      call 0x145c195a0
0000000145af0db0  90                              nop 
0000000145af0db1  488d4da0                        lea rcx, [rbp - 0x60]
0000000145af0db5  4889fa                          mov rdx, rdi
0000000145af0db8  4989d8                          mov r8, rbx
0000000145af0dbb  e860510300                      call 0x145b25f20
0000000145af0dc0  90                              nop 
0000000145af0dc1  498dbe60030000                  lea rdi, [r14 + 0x360]
0000000145af0dc8  488b8570060000                  mov rax, qword ptr [rbp + 0x670]
0000000145af0dcf  488985d0020000                  mov qword ptr [rbp + 0x2d0], rax
0000000145af0dd6  0f108560060000                  movups xmm0, xmmword ptr [rbp + 0x660]
0000000145af0ddd  0f2985c0020000                  movaps xmmword ptr [rbp + 0x2c0], xmm0
0000000145af0de4  0f108548060000                  movups xmm0, xmmword ptr [rbp + 0x648]
0000000145af0deb  0f1185d8020000                  movups xmmword ptr [rbp + 0x2d8], xmm0
0000000145af0df2  488b8558060000                  mov rax, qword ptr [rbp + 0x658]
0000000145af0df9  488985e8020000                  mov qword ptr [rbp + 0x2e8], rax
0000000145af0e00  0f108530060000                  movups xmm0, xmmword ptr [rbp + 0x630]
0000000145af0e07  0f2985f0020000                  movaps xmmword ptr [rbp + 0x2f0], xmm0
0000000145af0e0e  488b8540060000                  mov rax, qword ptr [rbp + 0x640]
0000000145af0e15  48898500030000                  mov qword ptr [rbp + 0x300], rax
0000000145af0e1c  488d8d08030000                  lea rcx, [rbp + 0x308]
0000000145af0e23  488d55a0                        lea rdx, [rbp - 0x60]
0000000145af0e27  41b820030000                    mov r8d, 0x320
0000000145af0e2d  e8e90f5200                      call 0x146011e1b
0000000145af0e32  0f1137                          movups xmmword ptr [rdi], xmm6
0000000145af0e35  488d95c0020000                  lea rdx, [rbp + 0x2c0]
0000000145af0e3c  41b868030000                    mov r8d, 0x368
0000000145af0e42  4889f1                          mov rcx, rsi
0000000145af0e45  e8d10f5200                      call 0x146011e1b
0000000145af0e4a  4889f0                          mov rax, rsi
0000000145af0e4d  0f28b580060000                  movaps xmm6, xmmword ptr [rbp + 0x680]
0000000145af0e54  4881c410070000                  add rsp, 0x710
0000000145af0e5b  5b                              pop rbx
0000000145af0e5c  5f                              pop rdi
0000000145af0e5d  5e                              pop rsi
0000000145af0e5e  415e                            pop r14
0000000145af0e60  5d                              pop rbp
0000000145af0e61  c3                              ret 

0000000145ac7170  55                              push rbp
0000000145ac7171  4156                            push r14
0000000145ac7173  56                              push rsi
0000000145ac7174  57                              push rdi
0000000145ac7175  53                              push rbx
0000000145ac7176  4883ec40                        sub rsp, 0x40
0000000145ac717a  488d6c2440                      lea rbp, [rsp + 0x40]
0000000145ac717f  48c745f8feffffff                mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145ac7187  4889ce                          mov rsi, rcx
0000000145ac718a  80fa03                          cmp dl, 3
0000000145ac718d  731c                            jae 0x145ac71ab
0000000145ac718f  48c70600000000                  mov qword ptr [rsi], 0
0000000145ac7196  48c7460801000000                mov qword ptr [rsi + 8], 1
0000000145ac719e  48c7461000000000                mov qword ptr [rsi + 0x10], 0
0000000145ac71a6  e9ae000000                      jmp 0x145ac7259
0000000145ac71ab  4c89c7                          mov rdi, r8
0000000145ac71ae  89d3                            mov ebx, edx
0000000145ac71b0  48b9abaaaaaaaaaaaaaa            movabs rcx, 0xaaaaaaaaaaaaaaab
0000000145ac71ba  4c89c0                          mov rax, r8
0000000145ac71bd  48f7e1                          mul rcx
0000000145ac71c0  4989d6                          mov r14, rdx
0000000145ac71c3  e838b053fa                      call 0x140002200
0000000145ac71c8  b901000000                      mov ecx, 1
0000000145ac71cd  ba01000000                      mov edx, 1
0000000145ac71d2  e8e9af53fa                      call 0x1400021c0
0000000145ac71d7  4885c0                          test rax, rax
0000000145ac71da  0f8487000000                    je 0x145ac7267
0000000145ac71e0  49d1ee                          shr r14, 1
0000000145ac71e3  4b8d0c76                        lea rcx, [r14 + r14*2]
0000000145ac71e7  4829cf                          sub rdi, rcx
0000000145ac71ea  488d0de39a5201                  lea rcx, [rip + 0x1529ae3]
0000000145ac71f1  0fb6140f                        movzx edx, byte ptr [rdi + rcx]
0000000145ac71f5  8810                            mov byte ptr [rax], dl
0000000145ac71f7  48c745e001000000                mov qword ptr [rbp - 0x20], 1
0000000145ac71ff  488945e8                        mov qword ptr [rbp - 0x18], rax
0000000145ac7203  48c745f001000000                mov qword ptr [rbp - 0x10], 1
0000000145ac720b  80fb04                          cmp bl, 4
0000000145ac720e  7632                            jbe 0x145ac7242
0000000145ac7210  4183e601                        and r14d, 1
0000000145ac7214  4a8d0437                        lea rax, [rdi + r14]
0000000145ac7218  48ffc0                          inc rax
0000000145ac721b  4889c2                          mov rdx, rax
0000000145ac721e  4883ea03                        sub rdx, 3
0000000145ac7222  480f42d0                        cmovb rdx, rax
0000000145ac7226  8a1c0a                          mov bl, byte ptr [rdx + rcx]
0000000145ac7229  488d4de0                        lea rcx, [rbp - 0x20]
0000000145ac722d  e8ceab5700                      call 0x146041e00
0000000145ac7232  90                              nop 
0000000145ac7233  488b45e8                        mov rax, qword ptr [rbp - 0x18]
0000000145ac7237  885801                          mov byte ptr [rax + 1], bl
0000000145ac723a  48c745f002000000                mov qword ptr [rbp - 0x10], 2
0000000145ac7242  488b45f0                        mov rax, qword ptr [rbp - 0x10]
0000000145ac7246  48894610                        mov qword ptr [rsi + 0x10], rax
0000000145ac724a  488b45e0                        mov rax, qword ptr [rbp - 0x20]
0000000145ac724e  488906                          mov qword ptr [rsi], rax
0000000145ac7251  488b45e8                        mov rax, qword ptr [rbp - 0x18]
0000000145ac7255  48894608                        mov qword ptr [rsi + 8], rax
0000000145ac7259  4889f0                          mov rax, rsi
0000000145ac725c  4883c440                        add rsp, 0x40
0000000145ac7260  5b                              pop rbx
0000000145ac7261  5f                              pop rdi
0000000145ac7262  5e                              pop rsi
0000000145ac7263  415e                            pop r14
0000000145ac7265  5d                              pop rbp
0000000145ac7266  c3                              ret 
0000000145ac7267  b901000000                      mov ecx, 1
0000000145ac726c  ba01000000                      mov edx, 1
0000000145ac7271  e8fb3d6f00                      call 0x1461bb071
0000000145ac7276  0f0b                            ud2 

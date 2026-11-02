0000000145b64646  4981fc08170000                  cmp r12, 0x1708
0000000145b6464d  0f8493010000                    je 0x145b647e6
0000000145b64653  488b85800d0000                  mov rax, qword ptr [rbp + 0xd80]
0000000145b6465a  4c01e0                          add rax, r12
0000000145b6465d  4883c018                        add rax, 0x18
0000000145b64661  48898550060000                  mov qword ptr [rbp + 0x650], rax
0000000145b64668  4883fb14                        cmp rbx, 0x14
0000000145b6466c  0f847e010000                    je 0x145b647f0
0000000145b64672  488d5301                        lea rdx, [rbx + 1]
0000000145b64676  48899560060000                  mov qword ptr [rbp + 0x660], rdx
0000000145b6467d  488d049b                        lea rax, [rbx + rbx*4]
0000000145b64681  488d8d70060000                  lea rcx, [rbp + 0x670]
0000000145b64688  4c8b44c110                      mov r8, qword ptr [rcx + rax*8 + 0x10]
0000000145b6468d  4983f8ff                        cmp r8, -1
0000000145b64691  0f844c010000                    je 0x145b647e3
0000000145b64697  4c8985700d0000                  mov qword ptr [rbp + 0xd70], r8
0000000145b6469e  488995600d0000                  mov qword ptr [rbp + 0xd60], rdx
0000000145b646a5  4d8d6c2418                      lea r13, [r12 + 0x18]
0000000145b646aa  488d04c1                        lea rax, [rcx + rax*8]
0000000145b646ae  4c8b30                          mov r14, qword ptr [rax]
0000000145b646b1  4c8b7808                        mov r15, qword ptr [rax + 8]
0000000145b646b5  488b7818                        mov rdi, qword ptr [rax + 0x18]
0000000145b646b9  488b5820                        mov rbx, qword ptr [rax + 0x20]
0000000145b646bd  488bb5800d0000                  mov rsi, qword ptr [rbp + 0xd80]
0000000145b646c4  4a3b5c2610                      cmp rbx, qword ptr [rsi + r12 + 0x10]
0000000145b646c9  7518                            jne 0x145b646e3
0000000145b646cb  4a8b542608                      mov rdx, qword ptr [rsi + r12 + 8]
0000000145b646d0  4889f9                          mov rcx, rdi
0000000145b646d3  4989d8                          mov r8, rbx
0000000145b646d6  e846d74a00                      call 0x146011e21
0000000145b646db  85c0                            test eax, eax
0000000145b646dd  0f84a2000000                    je 0x145b64785
0000000145b646e3  488b96c0040000                  mov rdx, qword ptr [rsi + 0x4c0]
0000000145b646ea  48895c2428                      mov qword ptr [rsp + 0x28], rbx
0000000145b646ef  4889bd500d0000                  mov qword ptr [rbp + 0xd50], rdi
0000000145b646f6  48897c2420                      mov qword ptr [rsp + 0x20], rdi
0000000145b646fb  488d8d500c0000                  lea rcx, [rbp + 0xc50]
0000000145b64702  4d89f0                          mov r8, r14
0000000145b64705  4d89f9                          mov r9, r15
0000000145b64708  e8b30d0500                      call 0x145bb54c0
0000000145b6470d  90                              nop 
0000000145b6470e  4c8bb690060000                  mov r14, qword ptr [rsi + 0x690]
0000000145b64715  4c3bb680060000                  cmp r14, qword ptr [rsi + 0x680]
0000000145b6471c  750d                            jne 0x145b6472b
0000000145b6471e  488b8d300d0000                  mov rcx, qword ptr [rbp + 0xd30]
0000000145b64725  e846144b00                      call 0x146015b70
0000000145b6472a  90                              nop 
0000000145b6472b  488bb5800d0000                  mov rsi, qword ptr [rbp + 0xd80]
0000000145b64732  488b8688060000                  mov rax, qword ptr [rsi + 0x688]
0000000145b64739  4c89f1                          mov rcx, r14
0000000145b6473c  48c1e105                        shl rcx, 5
0000000145b64740  0f1085500c0000                  movups xmm0, xmmword ptr [rbp + 0xc50]
0000000145b64747  660f108d600c0000                movupd xmm1, xmmword ptr [rbp + 0xc60]
0000000145b6474f  660f114c0810                    movupd xmmword ptr [rax + rcx + 0x10], xmm1
0000000145b64755  0f110408                        movups xmmword ptr [rax + rcx], xmm0
0000000145b64759  49ffc6                          inc r14
0000000145b6475c  4c89b690060000                  mov qword ptr [rsi + 0x690], r14
0000000145b64763  4a8b1426                        mov rdx, qword ptr [rsi + r12]
0000000145b64767  4885d2                          test rdx, rdx
0000000145b6476a  0f84b0feffff                    je 0x145b64620
0000000145b64770  4a8b4c2608                      mov rcx, qword ptr [rsi + r12 + 8]
0000000145b64775  41b801000000                    mov r8d, 1
0000000145b6477b  e850da49fa                      call 0x1400021d0
0000000145b64780  e99bfeffff                      jmp 0x145b64620
0000000145b64785  488bb5600d0000                  mov rsi, qword ptr [rbp + 0xd60]
0000000145b6478c  4889f3                          mov rbx, rsi
0000000145b6478f  4d89ec                          mov r12, r13
0000000145b64792  488b95700d0000                  mov rdx, qword ptr [rbp + 0xd70]
0000000145b64799  4885d2                          test rdx, rdx
0000000145b6479c  0f84a4feffff                    je 0x145b64646
0000000145b647a2  41b801000000                    mov r8d, 1
0000000145b647a8  4889f9                          mov rcx, rdi
0000000145b647ab  e820da49fa                      call 0x1400021d0
0000000145b647b0  4889f3                          mov rbx, rsi
0000000145b647b3  4d89ec                          mov r12, r13
0000000145b647b6  e98bfeffff                      jmp 0x145b64646
0000000145b647bb  80be8e0d000000                  cmp byte ptr [rsi + 0xd8e], 0
0000000145b647c2  0f847e010000                    je 0x145b64946
0000000145b647c8  488d8d480b0000                  lea rcx, [rbp + 0xb48]
0000000145b647cf  488b95500d0000                  mov rdx, qword ptr [rbp + 0xd50]
0000000145b647d6  4531c0                          xor r8d, r8d
0000000145b647d9  e802f30a00                      call 0x145c13ae0
0000000145b647de  e9e3f8ffff                      jmp 0x145b640c6
0000000145b647e3  4889d3                          mov rbx, rdx

0000000145b25f20  55                              push rbp
0000000145b25f21  4157                            push r15
0000000145b25f23  4156                            push r14
0000000145b25f25  4155                            push r13
0000000145b25f27  4154                            push r12
0000000145b25f29  56                              push rsi
0000000145b25f2a  57                              push rdi
0000000145b25f2b  53                              push rbx
0000000145b25f2c  4881ec08020000                  sub rsp, 0x208
0000000145b25f33  488dac2480000000                lea rbp, [rsp + 0x80]
0000000145b25f3b  0f29b570010000                  movaps xmmword ptr [rbp + 0x170], xmm6
0000000145b25f42  48c78568010000feffffff          mov qword ptr [rbp + 0x168], 0xfffffffffffffffe
0000000145b25f4d  4c89c3                          mov rbx, r8
0000000145b25f50  4889d7                          mov rdi, rdx
0000000145b25f53  4889ce                          mov rsi, rcx
0000000145b25f56  488d4db0                        lea rcx, [rbp - 0x50]
0000000145b25f5a  e801090e00                      call 0x145c06860
0000000145b25f5f  488d05ceb5b601                  lea rax, [rip + 0x1b6b5ce]
0000000145b25f66  488945a0                        mov qword ptr [rbp - 0x60], rax
0000000145b25f6a  48c745a807000000                mov qword ptr [rbp - 0x58], 7
0000000145b25f72  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b25f79  4889fa                          mov rdx, rdi
0000000145b25f7c  e8aff70d00                      call 0x145c05730
0000000145b25f81  90                              nop 
0000000145b25f82  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b25f89  488985b8000000                  mov qword ptr [rbp + 0xb8], rax
0000000145b25f90  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b25f97  48894528                        mov qword ptr [rbp + 0x28], rax
0000000145b25f9b  4c8bbd60010000                  mov r15, qword ptr [rbp + 0x160]
0000000145b25fa2  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b25fa9  4889fa                          mov rdx, rdi
0000000145b25fac  e8af450e00                      call 0x145c0a560
0000000145b25fb1  90                              nop 
0000000145b25fb2  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b25fb9  488985c0000000                  mov qword ptr [rbp + 0xc0], rax
0000000145b25fc0  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b25fc7  48894530                        mov qword ptr [rbp + 0x30], rax
0000000145b25fcb  4c8ba560010000                  mov r12, qword ptr [rbp + 0x160]
0000000145b25fd2  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b25fd9  4889fa                          mov rdx, rdi
0000000145b25fdc  e8ef210e00                      call 0x145c081d0
0000000145b25fe1  90                              nop 
0000000145b25fe2  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b25fe9  488985c8000000                  mov qword ptr [rbp + 0xc8], rax
0000000145b25ff0  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b25ff7  48894538                        mov qword ptr [rbp + 0x38], rax
0000000145b25ffb  4c8bb560010000                  mov r14, qword ptr [rbp + 0x160]
0000000145b26002  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26009  4889fa                          mov rdx, rdi
0000000145b2600c  e86f370e00                      call 0x145c09780
0000000145b26011  90                              nop 
0000000145b26012  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b26019  488985d0000000                  mov qword ptr [rbp + 0xd0], rax
0000000145b26020  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b26027  48894540                        mov qword ptr [rbp + 0x40], rax
0000000145b2602b  4c8bad60010000                  mov r13, qword ptr [rbp + 0x160]
0000000145b26032  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26039  4889fa                          mov rdx, rdi
0000000145b2603c  4989d8                          mov r8, rbx
0000000145b2603f  e8ec2d0e00                      call 0x145c08e30
0000000145b26044  90                              nop 
0000000145b26045  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b2604c  488985d8000000                  mov qword ptr [rbp + 0xd8], rax
0000000145b26053  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b2605a  48894548                        mov qword ptr [rbp + 0x48], rax
0000000145b2605e  488b9d60010000                  mov rbx, qword ptr [rbp + 0x160]
0000000145b26065  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b2606c  4889fa                          mov rdx, rdi
0000000145b2606f  e88c2c0e00                      call 0x145c08d00
0000000145b26074  90                              nop 
0000000145b26075  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b2607c  488985e0000000                  mov qword ptr [rbp + 0xe0], rax
0000000145b26083  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b2608a  48894550                        mov qword ptr [rbp + 0x50], rax
0000000145b2608e  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b26095  488945c8                        mov qword ptr [rbp - 0x38], rax
0000000145b26099  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b260a0  4889fa                          mov rdx, rdi
0000000145b260a3  e8d8310e00                      call 0x145c09280
0000000145b260a8  90                              nop 
0000000145b260a9  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b260b0  488985e8000000                  mov qword ptr [rbp + 0xe8], rax
0000000145b260b7  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b260be  48894558                        mov qword ptr [rbp + 0x58], rax
0000000145b260c2  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b260c9  488945d0                        mov qword ptr [rbp - 0x30], rax
0000000145b260cd  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b260d4  4889fa                          mov rdx, rdi
0000000145b260d7  e854170e00                      call 0x145c07830
0000000145b260dc  90                              nop 
0000000145b260dd  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b260e4  488985f0000000                  mov qword ptr [rbp + 0xf0], rax
0000000145b260eb  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b260f2  48894560                        mov qword ptr [rbp + 0x60], rax
0000000145b260f6  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b260fd  488945d8                        mov qword ptr [rbp - 0x28], rax
0000000145b26101  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26108  4889fa                          mov rdx, rdi
0000000145b2610b  e880050e00                      call 0x145c06690
0000000145b26110  90                              nop 
0000000145b26111  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b26118  488985f8000000                  mov qword ptr [rbp + 0xf8], rax
0000000145b2611f  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b26126  48894568                        mov qword ptr [rbp + 0x68], rax
0000000145b2612a  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b26131  488945e0                        mov qword ptr [rbp - 0x20], rax
0000000145b26135  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b2613c  4889fa                          mov rdx, rdi
0000000145b2613f  e85c320e00                      call 0x145c093a0
0000000145b26144  90                              nop 
0000000145b26145  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b2614c  48898500010000                  mov qword ptr [rbp + 0x100], rax
0000000145b26153  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b2615a  48894570                        mov qword ptr [rbp + 0x70], rax
0000000145b2615e  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b26165  488945e8                        mov qword ptr [rbp - 0x18], rax
0000000145b26169  488b9740070000                  mov rdx, qword ptr [rdi + 0x740]
0000000145b26170  4c8b8748070000                  mov r8, qword ptr [rdi + 0x748]
0000000145b26177  f30f10b7c00c0000                movss xmm6, dword ptr [rdi + 0xcc0]
0000000145b2617f  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26186  0f28de                          movaps xmm3, xmm6
0000000145b26189  e882c9feff                      call 0x145b12b10
0000000145b2618e  90                              nop 
0000000145b2618f  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b26196  48898508010000                  mov qword ptr [rbp + 0x108], rax
0000000145b2619d  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b261a4  48894578                        mov qword ptr [rbp + 0x78], rax
0000000145b261a8  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b261af  488945f0                        mov qword ptr [rbp - 0x10], rax
0000000145b261b3  488b9758070000                  mov rdx, qword ptr [rdi + 0x758]
0000000145b261ba  4c8b8760070000                  mov r8, qword ptr [rdi + 0x760]
0000000145b261c1  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b261c8  0f28de                          movaps xmm3, xmm6
0000000145b261cb  e840c9feff                      call 0x145b12b10
0000000145b261d0  90                              nop 
0000000145b261d1  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b261d8  48898510010000                  mov qword ptr [rbp + 0x110], rax
0000000145b261df  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b261e6  48898580000000                  mov qword ptr [rbp + 0x80], rax
0000000145b261ed  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b261f4  488945f8                        mov qword ptr [rbp - 8], rax
0000000145b261f8  8b870c080000                    mov eax, dword ptr [rdi + 0x80c]
0000000145b261fe  83f802                          cmp eax, 2
0000000145b26201  7524                            jne 0x145b26227
0000000145b26203  b801000000                      mov eax, 1
0000000145b26208  48898528010000                  mov qword ptr [rbp + 0x128], rax
0000000145b2620f  48c7859800000000000000          mov qword ptr [rbp + 0x98], 0
0000000145b2621a  48c7854801000000000000          mov qword ptr [rbp + 0x148], 0
0000000145b26225  eb65                            jmp 0x145b2628c
0000000145b26227  488b9770070000                  mov rdx, qword ptr [rdi + 0x770]
0000000145b2622e  488d8fc00c0000                  lea rcx, [rdi + 0xcc0]
0000000145b26235  4c8d8710080000                  lea r8, [rdi + 0x810]
0000000145b2623c  a801                            test al, 1
0000000145b2623e  490f45c8                        cmovne rcx, r8
0000000145b26242  4c8b8778070000                  mov r8, qword ptr [rdi + 0x778]
0000000145b26249  f30f1019                        movss xmm3, dword ptr [rcx]
0000000145b2624d  f30f5c9f08080000                subss xmm3, dword ptr [rdi + 0x808]
0000000145b26255  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b2625c  e8afc8feff                      call 0x145b12b10
0000000145b26261  90                              nop 
0000000145b26262  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b26269  48898548010000                  mov qword ptr [rbp + 0x148], rax
0000000145b26270  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b26277  48898528010000                  mov qword ptr [rbp + 0x128], rax
0000000145b2627e  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b26285  48898598000000                  mov qword ptr [rbp + 0x98], rax
0000000145b2628c  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26293  4889fa                          mov rdx, rdi
0000000145b26296  e835180e00                      call 0x145c07ad0
0000000145b2629b  90                              nop 
0000000145b2629c  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b262a3  48898518010000                  mov qword ptr [rbp + 0x118], rax
0000000145b262aa  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b262b1  48898588000000                  mov qword ptr [rbp + 0x88], rax
0000000145b262b8  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b262bf  48894500                        mov qword ptr [rbp], rax
0000000145b262c3  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b262ca  4889fa                          mov rdx, rdi
0000000145b262cd  e86e220e00                      call 0x145c08540
0000000145b262d2  90                              nop 
0000000145b262d3  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b262da  48898520010000                  mov qword ptr [rbp + 0x120], rax
0000000145b262e1  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b262e8  48898590000000                  mov qword ptr [rbp + 0x90], rax
0000000145b262ef  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b262f6  48894508                        mov qword ptr [rbp + 8], rax
0000000145b262fa  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26301  4889fa                          mov rdx, rdi
0000000145b26304  e8f7200e00                      call 0x145c08400
0000000145b26309  90                              nop 
0000000145b2630a  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b26311  48898530010000                  mov qword ptr [rbp + 0x130], rax
0000000145b26318  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b2631f  488985a0000000                  mov qword ptr [rbp + 0xa0], rax
0000000145b26326  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b2632d  48894510                        mov qword ptr [rbp + 0x10], rax
0000000145b26331  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b26338  4889fa                          mov rdx, rdi
0000000145b2633b  e810160e00                      call 0x145c07950
0000000145b26340  90                              nop 
0000000145b26341  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b26348  48898538010000                  mov qword ptr [rbp + 0x138], rax
0000000145b2634f  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b26356  488985a8000000                  mov qword ptr [rbp + 0xa8], rax
0000000145b2635d  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b26364  48894518                        mov qword ptr [rbp + 0x18], rax
0000000145b26368  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b2636f  4889fa                          mov rdx, rdi
0000000145b26372  e8391b0e00                      call 0x145c07eb0
0000000145b26377  90                              nop 
0000000145b26378  488b8550010000                  mov rax, qword ptr [rbp + 0x150]
0000000145b2637f  48898540010000                  mov qword ptr [rbp + 0x140], rax
0000000145b26386  488b8558010000                  mov rax, qword ptr [rbp + 0x158]
0000000145b2638d  488985b0000000                  mov qword ptr [rbp + 0xb0], rax
0000000145b26394  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b2639b  48894520                        mov qword ptr [rbp + 0x20], rax
0000000145b2639f  488d8d50010000                  lea rcx, [rbp + 0x150]
0000000145b263a6  4889fa                          mov rdx, rdi
0000000145b263a9  e862e80d00                      call 0x145c04c10
0000000145b263ae  90                              nop 
0000000145b263af  488b8560010000                  mov rax, qword ptr [rbp + 0x160]
0000000145b263b6  48898618030000                  mov qword ptr [rsi + 0x318], rax
0000000145b263bd  0f108550010000                  movups xmm0, xmmword ptr [rbp + 0x150]
0000000145b263c4  0f118608030000                  movups xmmword ptr [rsi + 0x308], xmm0
0000000145b263cb  488b45c0                        mov rax, qword ptr [rbp - 0x40]
0000000145b263cf  48894620                        mov qword ptr [rsi + 0x20], rax
0000000145b263d3  0f1045a0                        movups xmm0, xmmword ptr [rbp - 0x60]
0000000145b263d7  0f104db0                        movups xmm1, xmmword ptr [rbp - 0x50]
0000000145b263db  0f114e10                        movups xmmword ptr [rsi + 0x10], xmm1
0000000145b263df  0f1106                          movups xmmword ptr [rsi], xmm0
0000000145b263e2  488d0552b1b601                  lea rax, [rip + 0x1b6b152]
0000000145b263e9  48894628                        mov qword ptr [rsi + 0x28], rax
0000000145b263ed  48c7463006000000                mov qword ptr [rsi + 0x30], 6
0000000145b263f5  488b85b8000000                  mov rax, qword ptr [rbp + 0xb8]
0000000145b263fc  48894638                        mov qword ptr [rsi + 0x38], rax
0000000145b26400  488b4528                        mov rax, qword ptr [rbp + 0x28]
0000000145b26404  48894640                        mov qword ptr [rsi + 0x40], rax
0000000145b26408  4c897e48                        mov qword ptr [rsi + 0x48], r15
0000000145b2640c  488d052eb1b601                  lea rax, [rip + 0x1b6b12e]
0000000145b26413  48894650                        mov qword ptr [rsi + 0x50], rax
0000000145b26417  48c7465809000000                mov qword ptr [rsi + 0x58], 9
0000000145b2641f  488b85c0000000                  mov rax, qword ptr [rbp + 0xc0]
0000000145b26426  48894660                        mov qword ptr [rsi + 0x60], rax
0000000145b2642a  488b4530                        mov rax, qword ptr [rbp + 0x30]
0000000145b2642e  48894668                        mov qword ptr [rsi + 0x68], rax
0000000145b26432  4c896670                        mov qword ptr [rsi + 0x70], r12
0000000145b26436  488d050db1b601                  lea rax, [rip + 0x1b6b10d]
0000000145b2643d  48894678                        mov qword ptr [rsi + 0x78], rax
0000000145b26441  48c7868000000008000000          mov qword ptr [rsi + 0x80], 8
0000000145b2644c  488b85c8000000                  mov rax, qword ptr [rbp + 0xc8]
0000000145b26453  48898688000000                  mov qword ptr [rsi + 0x88], rax
0000000145b2645a  488b4538                        mov rax, qword ptr [rbp + 0x38]
0000000145b2645e  48898690000000                  mov qword ptr [rsi + 0x90], rax
0000000145b26465  4c89b698000000                  mov qword ptr [rsi + 0x98], r14
0000000145b2646c  488d05dfb0b601                  lea rax, [rip + 0x1b6b0df]
0000000145b26473  488986a0000000                  mov qword ptr [rsi + 0xa0], rax
0000000145b2647a  48c786a80000000a000000          mov qword ptr [rsi + 0xa8], 0xa
0000000145b26485  488b85d0000000                  mov rax, qword ptr [rbp + 0xd0]
0000000145b2648c  488986b0000000                  mov qword ptr [rsi + 0xb0], rax
0000000145b26493  488b4540                        mov rax, qword ptr [rbp + 0x40]
0000000145b26497  488986b8000000                  mov qword ptr [rsi + 0xb8], rax
0000000145b2649e  4c89aec0000000                  mov qword ptr [rsi + 0xc0], r13
0000000145b264a5  488d05b0b0b601                  lea rax, [rip + 0x1b6b0b0]
0000000145b264ac  488986c8000000                  mov qword ptr [rsi + 0xc8], rax
0000000145b264b3  48c786d000000006000000          mov qword ptr [rsi + 0xd0], 6
0000000145b264be  488b85d8000000                  mov rax, qword ptr [rbp + 0xd8]
0000000145b264c5  488986d8000000                  mov qword ptr [rsi + 0xd8], rax
0000000145b264cc  488b4548                        mov rax, qword ptr [rbp + 0x48]
0000000145b264d0  488986e0000000                  mov qword ptr [rsi + 0xe0], rax
0000000145b264d7  48899ee8000000                  mov qword ptr [rsi + 0xe8], rbx
0000000145b264de  488d057db0b601                  lea rax, [rip + 0x1b6b07d]
0000000145b264e5  488986f0000000                  mov qword ptr [rsi + 0xf0], rax
0000000145b264ec  48c786f800000009000000          mov qword ptr [rsi + 0xf8], 9
0000000145b264f7  488b85e0000000                  mov rax, qword ptr [rbp + 0xe0]
0000000145b264fe  48898600010000                  mov qword ptr [rsi + 0x100], rax
0000000145b26505  488b4550                        mov rax, qword ptr [rbp + 0x50]
0000000145b26509  48898608010000                  mov qword ptr [rsi + 0x108], rax
0000000145b26510  488b45c8                        mov rax, qword ptr [rbp - 0x38]
0000000145b26514  48898610010000                  mov qword ptr [rsi + 0x110], rax
0000000145b2651b  488d0549b0b601                  lea rax, [rip + 0x1b6b049]
0000000145b26522  48898618010000                  mov qword ptr [rsi + 0x118], rax
0000000145b26529  48c7862001000009000000          mov qword ptr [rsi + 0x120], 9
0000000145b26534  488b85e8000000                  mov rax, qword ptr [rbp + 0xe8]
0000000145b2653b  48898628010000                  mov qword ptr [rsi + 0x128], rax
0000000145b26542  488b4558                        mov rax, qword ptr [rbp + 0x58]
0000000145b26546  48898630010000                  mov qword ptr [rsi + 0x130], rax
0000000145b2654d  488b45d0                        mov rax, qword ptr [rbp - 0x30]
0000000145b26551  48898638010000                  mov qword ptr [rsi + 0x138], rax
0000000145b26558  488d0515b0b601                  lea rax, [rip + 0x1b6b015]
0000000145b2655f  48898640010000                  mov qword ptr [rsi + 0x140], rax
0000000145b26566  48c7864801000008000000          mov qword ptr [rsi + 0x148], 8
0000000145b26571  488b85f0000000                  mov rax, qword ptr [rbp + 0xf0]
0000000145b26578  48898650010000                  mov qword ptr [rsi + 0x150], rax
0000000145b2657f  488b4560                        mov rax, qword ptr [rbp + 0x60]
0000000145b26583  48898658010000                  mov qword ptr [rsi + 0x158], rax
0000000145b2658a  488b45d8                        mov rax, qword ptr [rbp - 0x28]
0000000145b2658e  48898660010000                  mov qword ptr [rsi + 0x160], rax
0000000145b26595  488d05e0afb601                  lea rax, [rip + 0x1b6afe0]
0000000145b2659c  48898668010000                  mov qword ptr [rsi + 0x168], rax
0000000145b265a3  48c7867001000007000000          mov qword ptr [rsi + 0x170], 7
0000000145b265ae  488b85f8000000                  mov rax, qword ptr [rbp + 0xf8]
0000000145b265b5  48898678010000                  mov qword ptr [rsi + 0x178], rax
0000000145b265bc  488b4568                        mov rax, qword ptr [rbp + 0x68]
0000000145b265c0  48898680010000                  mov qword ptr [rsi + 0x180], rax
0000000145b265c7  488b45e0                        mov rax, qword ptr [rbp - 0x20]
0000000145b265cb  48898688010000                  mov qword ptr [rsi + 0x188], rax
0000000145b265d2  488d05aaafb601                  lea rax, [rip + 0x1b6afaa]
0000000145b265d9  48898690010000                  mov qword ptr [rsi + 0x190], rax
0000000145b265e0  48c7869801000009000000          mov qword ptr [rsi + 0x198], 9
0000000145b265eb  488b8500010000                  mov rax, qword ptr [rbp + 0x100]
0000000145b265f2  488986a0010000                  mov qword ptr [rsi + 0x1a0], rax
0000000145b265f9  488b4570                        mov rax, qword ptr [rbp + 0x70]
0000000145b265fd  488986a8010000                  mov qword ptr [rsi + 0x1a8], rax
0000000145b26604  488b45e8                        mov rax, qword ptr [rbp - 0x18]
0000000145b26608  488986b0010000                  mov qword ptr [rsi + 0x1b0], rax
0000000145b2660f  488d0576afb601                  lea rax, [rip + 0x1b6af76]
0000000145b26616  488986b8010000                  mov qword ptr [rsi + 0x1b8], rax
0000000145b2661d  48c786c001000008000000          mov qword ptr [rsi + 0x1c0], 8
0000000145b26628  488b8508010000                  mov rax, qword ptr [rbp + 0x108]
0000000145b2662f  488986c8010000                  mov qword ptr [rsi + 0x1c8], rax
0000000145b26636  488b4578                        mov rax, qword ptr [rbp + 0x78]
0000000145b2663a  488986d0010000                  mov qword ptr [rsi + 0x1d0], rax
0000000145b26641  488b45f0                        mov rax, qword ptr [rbp - 0x10]
0000000145b26645  488986d8010000                  mov qword ptr [rsi + 0x1d8], rax
0000000145b2664c  488d0541afb601                  lea rax, [rip + 0x1b6af41]
0000000145b26653  488986e0010000                  mov qword ptr [rsi + 0x1e0], rax
0000000145b2665a  48c786e801000007000000          mov qword ptr [rsi + 0x1e8], 7
0000000145b26665  488b8510010000                  mov rax, qword ptr [rbp + 0x110]
0000000145b2666c  488986f0010000                  mov qword ptr [rsi + 0x1f0], rax
0000000145b26673  488b8580000000                  mov rax, qword ptr [rbp + 0x80]
0000000145b2667a  488986f8010000                  mov qword ptr [rsi + 0x1f8], rax
0000000145b26681  488b45f8                        mov rax, qword ptr [rbp - 8]
0000000145b26685  48898600020000                  mov qword ptr [rsi + 0x200], rax
0000000145b2668c  488d0508afb601                  lea rax, [rip + 0x1b6af08]
0000000145b26693  48898608020000                  mov qword ptr [rsi + 0x208], rax
0000000145b2669a  48c786100200000a000000          mov qword ptr [rsi + 0x210], 0xa
0000000145b266a5  488b8548010000                  mov rax, qword ptr [rbp + 0x148]
0000000145b266ac  48898618020000                  mov qword ptr [rsi + 0x218], rax
0000000145b266b3  488b8528010000                  mov rax, qword ptr [rbp + 0x128]
0000000145b266ba  48898620020000                  mov qword ptr [rsi + 0x220], rax
0000000145b266c1  488b8598000000                  mov rax, qword ptr [rbp + 0x98]
0000000145b266c8  48898628020000                  mov qword ptr [rsi + 0x228], rax
0000000145b266cf  488d05cfaeb601                  lea rax, [rip + 0x1b6aecf]
0000000145b266d6  48898630020000                  mov qword ptr [rsi + 0x230], rax
0000000145b266dd  48c7863802000008000000          mov qword ptr [rsi + 0x238], 8
0000000145b266e8  488b8518010000                  mov rax, qword ptr [rbp + 0x118]
0000000145b266ef  48898640020000                  mov qword ptr [rsi + 0x240], rax
0000000145b266f6  488b8588000000                  mov rax, qword ptr [rbp + 0x88]
0000000145b266fd  48898648020000                  mov qword ptr [rsi + 0x248], rax
0000000145b26704  488b4500                        mov rax, qword ptr [rbp]
0000000145b26708  48898650020000                  mov qword ptr [rsi + 0x250], rax
0000000145b2670f  488d0597aeb601                  lea rax, [rip + 0x1b6ae97]
0000000145b26716  48898658020000                  mov qword ptr [rsi + 0x258], rax
0000000145b2671d  48c7866002000009000000          mov qword ptr [rsi + 0x260], 9
0000000145b26728  488b8520010000                  mov rax, qword ptr [rbp + 0x120]
0000000145b2672f  48898668020000                  mov qword ptr [rsi + 0x268], rax
0000000145b26736  488b8590000000                  mov rax, qword ptr [rbp + 0x90]
0000000145b2673d  48898670020000                  mov qword ptr [rsi + 0x270], rax
0000000145b26744  488b4508                        mov rax, qword ptr [rbp + 8]
0000000145b26748  48898678020000                  mov qword ptr [rsi + 0x278], rax
0000000145b2674f  488d0560aeb601                  lea rax, [rip + 0x1b6ae60]
0000000145b26756  48898680020000                  mov qword ptr [rsi + 0x280], rax
0000000145b2675d  48c7868802000009000000          mov qword ptr [rsi + 0x288], 9
0000000145b26768  488b8530010000                  mov rax, qword ptr [rbp + 0x130]
0000000145b2676f  48898690020000                  mov qword ptr [rsi + 0x290], rax
0000000145b26776  488b85a0000000                  mov rax, qword ptr [rbp + 0xa0]
0000000145b2677d  48898698020000                  mov qword ptr [rsi + 0x298], rax
0000000145b26784  488b4510                        mov rax, qword ptr [rbp + 0x10]
0000000145b26788  488986a0020000                  mov qword ptr [rsi + 0x2a0], rax
0000000145b2678f  488d0529aeb601                  lea rax, [rip + 0x1b6ae29]
0000000145b26796  488986a8020000                  mov qword ptr [rsi + 0x2a8], rax
0000000145b2679d  48c786b002000008000000          mov qword ptr [rsi + 0x2b0], 8
0000000145b267a8  488b8538010000                  mov rax, qword ptr [rbp + 0x138]
0000000145b267af  488986b8020000                  mov qword ptr [rsi + 0x2b8], rax
0000000145b267b6  488b85a8000000                  mov rax, qword ptr [rbp + 0xa8]
0000000145b267bd  488986c0020000                  mov qword ptr [rsi + 0x2c0], rax
0000000145b267c4  488b4518                        mov rax, qword ptr [rbp + 0x18]
0000000145b267c8  488986c8020000                  mov qword ptr [rsi + 0x2c8], rax
0000000145b267cf  488d05f1adb601                  lea rax, [rip + 0x1b6adf1]
0000000145b267d6  488986d0020000                  mov qword ptr [rsi + 0x2d0], rax
0000000145b267dd  48c786d802000008000000          mov qword ptr [rsi + 0x2d8], 8
0000000145b267e8  488b8540010000                  mov rax, qword ptr [rbp + 0x140]
0000000145b267ef  488986e0020000                  mov qword ptr [rsi + 0x2e0], rax
0000000145b267f6  488b85b0000000                  mov rax, qword ptr [rbp + 0xb0]
0000000145b267fd  488986e8020000                  mov qword ptr [rsi + 0x2e8], rax
0000000145b26804  488b4520                        mov rax, qword ptr [rbp + 0x20]
0000000145b26808  488986f0020000                  mov qword ptr [rsi + 0x2f0], rax
0000000145b2680f  488d05b9adb601                  lea rax, [rip + 0x1b6adb9]
0000000145b26816  488986f8020000                  mov qword ptr [rsi + 0x2f8], rax
0000000145b2681d  48c7860003000006000000          mov qword ptr [rsi + 0x300], 6
0000000145b26828  4889f0                          mov rax, rsi
0000000145b2682b  0f28b570010000                  movaps xmm6, xmmword ptr [rbp + 0x170]
0000000145b26832  4881c408020000                  add rsp, 0x208
0000000145b26839  5b                              pop rbx
0000000145b2683a  5f                              pop rdi
0000000145b2683b  5e                              pop rsi
0000000145b2683c  415c                            pop r12
0000000145b2683e  415d                            pop r13
0000000145b26840  415e                            pop r14
0000000145b26842  415f                            pop r15
0000000145b26844  5d                              pop rbp
0000000145b26845  c3                              ret 

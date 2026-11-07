1402a029e 0f10055bd6b205 movups xmm0, xmmword ptr [rip + 0x5b2d65b]
1402a02a5 0f1145b0 movups xmmword ptr [rbp - 0x50], xmm0
1402a02a9 48c745d001000000 mov qword ptr [rbp - 0x30], 1
1402a02b1 48c745d801000000 mov qword ptr [rbp - 0x28], 1
1402a02b9 48c745f000000000 mov qword ptr [rbp - 0x10], 0
1402a02c1 c645fa01 mov byte ptr [rbp - 6], 1
1402a02c5 48c745c002000000 mov qword ptr [rbp - 0x40], 2
1402a02cd 488d056ca5e1ff lea rax, [rip - 0x1e5a94]
1402a02d4 488945c8 mov qword ptr [rbp - 0x38], rax
1402a02d8 c645e002 mov byte ptr [rbp - 0x20], 2
1402a02dc 4c8d45a8 lea r8, [rbp - 0x58]
1402a02e0 4989ce mov r14, rcx
1402a02e3 4c89fa mov rdx, r15
1402a02e6 e845f0d6ff call 0x14000f330
1402a02eb 4983c618 add r14, 0x18
1402a02ef 488d154a09b505 lea rdx, [rip + 0x5b5094a]
1402a02f6 4c89f1 mov rcx, r14
1402a02f9 4d89f8 mov r8, r15
1402a02fc e87feed6ff call 0x14000f180
1402a0301 488b5f10 mov rbx, qword ptr [rdi + 0x10]
1402a0305 483b1f cmp rbx, qword ptr [rdi]
1402a0308 7508 jne 0x1402a0312
1402a030a 4889f9 mov rcx, rdi
1402a045c 4889f9 mov rcx, rdi
1402a045f e8fc820c00 call 0x140368760
1402a0464 4989c6 mov r14, rax
1402a0467 4989d7 mov r15, rdx
1402a046a 4889f9 mov rcx, rdi
1402a046d e89ed2e6ff call 0x14010d710
1402a0472 4989c4 mov r12, rax
1402a0475 4989d5 mov r13, rdx
1402a0478 4889f9 mov rcx, rdi
1402a047b e820bbe6ff call 0x14010bfa0
1402a0480 4889d3 mov rbx, rdx
1402a0483 4889f9 mov rcx, rdi
1402a0486 e8e5900c00 call 0x140369570
1402a048b 48c7465801000000 mov qword ptr [rsi + 0x58], 1
1402a0493 48895e60 mov qword ptr [rsi + 0x60], rbx
1402a0497 c6466801 mov byte ptr [rsi + 0x68], 1
1402a049b 48894648 mov qword ptr [rsi + 0x48], rax
1402a049f 48895650 mov qword ptr [rsi + 0x50], rdx
1402a04a3 4889f9 mov rcx, rdi
1402a04a6 e835dce6ff call 0x14010e0e0
1402a04ab 4c896610 mov qword ptr [rsi + 0x10], r12
1402a04af 4c896e18 mov qword ptr [rsi + 0x18], r13
1402a04b3 4c897620 mov qword ptr [rsi + 0x20], r14
1402a04b7 4c897e28 mov qword ptr [rsi + 0x28], r15
1402a04bb 48c7463001000000 mov qword ptr [rsi + 0x30], 1
1402a04c3 488b4d18 mov rcx, qword ptr [rbp + 0x18]
1402a04c7 48894e38 mov qword ptr [rsi + 0x38], rcx
1402a04cb c6464001 mov byte ptr [rsi + 0x40], 1
1402a04cf 488906 mov qword ptr [rsi], rax
1402a04d2 48895608 mov qword ptr [rsi + 8], rdx
1402a04d6 4889f0 mov rax, rsi
1402a04d9 0f287530 movaps xmm6, xmmword ptr [rbp + 0x30]
1402a04dd 4881c4c8000000 add rsp, 0xc8
1402a04e4 5b pop rbx
1402a04e5 5f pop rdi
1402a04e6 5e pop rsi
1402a04e7 415c pop r12
1402a04e9 415d pop r13
1402a04eb 415e pop r14
1402a04ed 415f pop r15
1402a04ef 5d pop rbp
1402a04f0 c3 ret

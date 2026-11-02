145896530 4157 push r15
145896532 4156 push r14
145896534 4155 push r13
145896536 4154 push r12
145896538 56 push rsi
145896539 57 push rdi
14589653a 55 push rbp
14589653b 53 push rbx
14589653c 4883ec78 sub rsp, 0x78
145896540 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
145896546 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
14589654c 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
145896551 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
145896556 4c8b31 mov r14, qword ptr [rcx]
145896559 488b7908 mov rdi, qword ptr [rcx + 8]
14589655d 4939fe cmp r14, rdi
145896560 0f8473010000 je 0x1458966d9
145896566 4889ce mov rsi, rcx
145896569 4c8b3a mov r15, qword ptr [rdx]
14589656c 4c8b6208 mov r12, qword ptr [rdx + 8]
145896570 4c8b6a10 mov r13, qword ptr [rdx + 0x10]
145896574 488b4218 mov rax, qword ptr [rdx + 0x18]
145896578 4889442428 mov qword ptr [rsp + 0x28], rax
14589657d 488b6a20 mov rbp, qword ptr [rdx + 0x20]
145896581 f30f10350bae5100 movss xmm6, dword ptr [rip + 0x51ae0b]
145896589 f30f103dffad5100 movss xmm7, dword ptr [rip + 0x51adff]
145896591 f3440f1005ca6c5100 movss xmm8, dword ptr [rip + 0x516cca]
14589659a f3440f100db5576b00 movss xmm9, dword ptr [rip + 0x6b57b5]
1458965a3 eb33 jmp 0x1458965d8
1458965a5 488b442428 mov rax, qword ptr [rsp + 0x28]
1458965aa 488b00 mov rax, qword ptr [rax]
1458965ad 48833800 cmp qword ptr [rax], 0
1458965b1 741c je 0x1458965cf
1458965b3 488b4d00 mov rcx, qword ptr [rbp]
1458965b7 488b4508 mov rax, qword ptr [rbp + 8]
1458965bb 4c8b00 mov r8, qword ptr [rax]
1458965be 89da mov edx, ebx
1458965c0 e85bce0f00 call 0x145993420
1458965c5 410f2ec1 ucomiss xmm0, xmm9
1458965c9 0f830c010000 jae 0x1458966db
1458965cf 4939fe cmp r14, rdi
1458965d2 0f8401010000 je 0x1458966d9
1458965d8 4c89f0 mov rax, r14
1458965db 49ffc6 inc r14
1458965de 4c8936 mov qword ptr [rsi], r14
1458965e1 0fb618 movzx ebx, byte ptr [rax]
1458965e4 498b0f mov rcx, qword ptr [r15]
1458965e7 89da mov edx, ebx
1458965e9 e802020000 call 0x1458967f0
1458965ee 84c0 test al, al
1458965f0 74dd je 0x1458965cf
1458965f2 0fb6c3 movzx eax, bl
1458965f5 83f804 cmp eax, 4
1458965f8 7409 je 0x145896603
1458965fa 83f801 cmp eax, 1
1458965fd 0f859d000000 jne 0x1458966a0
145896603 498b0c24 mov rcx, qword ptr [r12]
145896607 488b11 mov rdx, qword ptr [rcx]
14589660a 448b4268 mov r8d, dword ptr [rdx + 0x68]
14589660e 4183f80d cmp r8d, 0xd
145896612 0f8788000000 ja 0x1458966a0
145896618 41b900270000 mov r9d, 0x2700
14589661e 450fa3c1 bt r9d, r8d
145896622 0f8378000000 jae 0x1458966a0
145896628 807a7509 cmp byte ptr [rdx + 0x75], 9
14589662c 7572 jne 0x1458966a0
14589662e f30f104258 movss xmm0, dword ptr [rdx + 0x58]
145896633 f30f59c6 mulss xmm0, xmm6
145896637 48837a0808 cmp qword ptr [rdx + 8], 8
14589663c 0f28cf movaps xmm1, xmm7
14589663f 7516 jne 0x145896657
145896641 4c8b02 mov r8, qword ptr [rdx]
145896644 4d8b00 mov r8, qword ptr [r8]
145896647 0f28cf movaps xmm1, xmm7
14589664a 4c3b05874b9801 cmp r8, qword ptr [rip + 0x1984b87]
145896651 7504 jne 0x145896657
145896653 410f28c8 movaps xmm1, xmm8
145896657 f30f594120 mulss xmm0, dword ptr [rcx + 0x20]
14589665c f30f594148 mulss xmm0, dword ptr [rcx + 0x48]
145896661 f30f105248 movss xmm2, dword ptr [rdx + 0x48]
145896666 f30f59d6 mulss xmm2, xmm6
14589666a f30f595114 mulss xmm2, dword ptr [rcx + 0x14]
14589666f f30f59513c mulss xmm2, dword ptr [rcx + 0x3c]
145896674 498b4c2408 mov rcx, qword ptr [r12 + 8]
145896679 f30f595108 mulss xmm2, dword ptr [rcx + 8]
14589667e 0f28da movaps xmm3, xmm2
145896681 f30f5fd9 maxss xmm3, xmm1
145896685 0f28cb movaps xmm1, xmm3
145896688 f30fc2cb03 cmpunordss xmm1, xmm3
14589668d 0f54d1 andps xmm2, xmm1
145896690 0f55cb andnps xmm1, xmm3
145896693 0f56ca orps xmm1, xmm2
145896696 0f2ec1 ucomiss xmm0, xmm1
145896699 0f8330ffffff jae 0x1458965cf
14589669f 90 nop
1458966a0 83f802 cmp eax, 2
1458966a3 0f84fcfeffff je 0x1458965a5
1458966a9 83f801 cmp eax, 1
1458966ac 0f8501ffffff jne 0x1458965b3
1458966b2 498b4d00 mov rcx, qword ptr [r13]
1458966b6 488b01 mov rax, qword ptr [rcx]
1458966b9 8078750b cmp byte ptr [rax + 0x75], 0xb
1458966bd 0f85f0feffff jne 0x1458965b3
1458966c3 498b5508 mov rdx, qword ptr [r13 + 8]
1458966c7 e8c4431000 call 0x14599aa90
1458966cc 84c0 test al, al
1458966ce 0f85dffeffff jne 0x1458965b3
1458966d4 e9f6feffff jmp 0x1458965cf
1458966d9 b3ff mov bl, 0xff
1458966db 89d8 mov eax, ebx
1458966dd 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
1458966e2 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
1458966e7 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
1458966ed 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
1458966f3 4883c478 add rsp, 0x78
1458966f7 5b pop rbx
1458966f8 5d pop rbp
1458966f9 5f pop rdi
1458966fa 5e pop rsi
1458966fb 415c pop r12
1458966fd 415d pop r13
1458966ff 415e pop r14
145896701 415f pop r15
145896703 c3 ret

145a8d820 push rsi
145a8d821 push rdi
145a8d822 sub rsp, 0x28
145a8d826 mov dword ptr [rsp + 0x24], edx
145a8d82a cmp qword ptr [rcx + 0x18], 0
145a8d82f je 0x145a8d8ea
145a8d835 mov esi, edx
145a8d837 lea rax, [rcx + 0x20]
145a8d83b lea rdx, [rsp + 0x24]
145a8d840 mov rdi, rcx
145a8d843 mov rcx, rax
145a8d846 call 0x140f96f70
145a8d84b mov rcx, rax
145a8d84e shr rax, 0x39
145a8d852 mov rdx, qword ptr [rdi]
145a8d855 mov r8, qword ptr [rdi + 8]
145a8d859 movd xmm0, eax
145a8d85d punpcklbw xmm0, xmm0
145a8d861 pshuflw xmm0, xmm0, 0
145a8d866 pshufd xmm0, xmm0, 0x44
145a8d86b xor eax, eax
145a8d86d pcmpeqd xmm1, xmm1
145a8d871 xor r9d, r9d
145a8d874 and rcx, r8
145a8d877 movdqu xmm2, xmmword ptr [rdx + rcx]
145a8d87c movdqa xmm3, xmm2
145a8d880 pcmpeqb xmm3, xmm0
145a8d884 pmovmskb r10d, xmm3
145a8d889 test r10d, r10d
145a8d88c je 0x145a8d8c0
145a8d88e tzcnt edi, r10d
145a8d893 add rdi, rcx
145a8d896 and rdi, r8
145a8d899 shl rdi, 5
145a8d89d mov r11, rdx
145a8d8a0 sub r11, rdi
145a8d8a3 cmp esi, dword ptr [r11 - 0x20]
145a8d8a7 je 0x145a8d8db
145a8d8a9 lea r11d, [r10 - 1]
145a8d8ad and r11w, r10w
145a8d8b1 mov r10d, r11d
145a8d8b4 jne 0x145a8d88e
145a8d8b6 nop word ptr cs:[rax + rax]
145a8d8c0 pcmpeqb xmm2, xmm1
145a8d8c4 pmovmskb r10d, xmm2
145a8d8c9 test r10d, r10d
145a8d8cc jne 0x145a8d8ec
145a8d8ce add rcx, r9
145a8d8d1 add rcx, 0x10
145a8d8d5 add r9, 0x10
145a8d8d9 jmp 0x145a8d874
145a8d8db mov rax, qword ptr [r11 - 0x10]
145a8d8df mov rdx, qword ptr [r11 - 8]
145a8d8e3 add rsp, 0x28
145a8d8e7 pop rdi
145a8d8e8 pop rsi
145a8d8e9 ret
145a8d8ea xor eax, eax
145a8d8ec add rsp, 0x28
145a8d8f0 pop rdi
145a8d8f1 pop rsi
145a8d8f2 ret

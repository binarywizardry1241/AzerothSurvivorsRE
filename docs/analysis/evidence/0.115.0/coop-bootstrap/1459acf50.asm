1459acf50 push rbp
1459acf51 push r15
1459acf53 push r14
1459acf55 push r13
1459acf57 push r12
1459acf59 push rsi
1459acf5a push rdi
1459acf5b push rbx
1459acf5c sub rsp, 0x428
1459acf63 lea rbp, [rsp + 0x80]
1459acf6b mov qword ptr [rbp + 0x3a0], 0xfffffffffffffffe
1459acf76 mov rbx, r8
1459acf79 mov rdi, rdx
1459acf7c mov rsi, rcx
1459acf7f lea rcx, [rbp + 0x198]
1459acf86 mov r8d, 0x1e0
1459acf8c xor edx, edx
1459acf8e call 0x145d1460d
1459acf93 test rbx, rbx
1459acf96 je 0x1459ad010
1459acf98 shl rbx, 4
1459acf9c lea rcx, [rbx - 0x10]
1459acfa0 mov rax, rdi
1459acfa3 test cl, 0x10
1459acfa6 jne 0x1459acfc1
1459acfa8 lea rax, [rdi + 0x10]
1459acfac mov rdx, qword ptr [rdi]
1459acfaf cmp rdx, 0x77
1459acfb3 ja 0x1459acfc1
1459acfb5 mov r8d, dword ptr [rdi + 8]
1459acfb9 mov dword ptr [rbp + rdx*4 + 0x198], r8d
1459acfc1 test rcx, rcx
1459acfc4 je 0x1459ad010
1459acfc6 add rdi, rbx
1459acfc9 jmp 0x1459acfd9
1459acfcb nop dword ptr [rax + rax]
1459acfd0 add rax, 0x20
1459acfd4 cmp rax, rdi
1459acfd7 je 0x1459ad010
1459acfd9 mov rcx, qword ptr [rax]
1459acfdc cmp rcx, 0x78
1459acfe0 jb 0x1459acff0
1459acfe2 mov rcx, qword ptr [rax + 0x10]
1459acfe6 cmp rcx, 0x77
1459acfea ja 0x1459acfd0
1459acfec jmp 0x1459ad004
1459acfee nop
1459acff0 mov edx, dword ptr [rax + 8]
1459acff3 mov dword ptr [rbp + rcx*4 + 0x198], edx
1459acffa mov rcx, qword ptr [rax + 0x10]
1459acffe cmp rcx, 0x77
1459ad002 ja 0x1459acfd0
1459ad004 mov edx, dword ptr [rax + 0x18]
1459ad007 mov dword ptr [rbp + rcx*4 + 0x198], edx
1459ad00e jmp 0x1459acfd0
1459ad010 call 0x140002200
1459ad015 mov r14d, 0x20
1459ad01b mov ecx, 0x20
1459ad020 mov edx, 1
1459ad025 call 0x1400021c0
1459ad02a test rax, rax
1459ad02d je 0x1459ad154
1459ad033 mov rdi, rax
1459ad036 lea rcx, [rbp - 0x48]
1459ad03a lea rdx, [rbp + 0x198]
1459ad041 mov r8d, 0x1e0
1459ad047 call 0x145d145fb
1459ad04c mov ax, 0x129
1459ad050 mov r15d, 4
1459ad056 lea r12, [rbp + 0x392]
1459ad05d xor edx, edx
1459ad05f lea rbx, [rbp + 0x378]
1459ad066 nop word ptr cs:[rax + rax]
1459ad070 mov r13d, dword ptr [rbp + r15*4 - 0x58]
1459ad075 mov qword ptr [rbp + 0x378], r14
1459ad07c mov qword ptr [rbp + 0x380], rdi
1459ad083 mov qword ptr [rbp + 0x388], rdx
1459ad08a mov word ptr [rbp + 0x390], ax
1459ad091 movzx ecx, word ptr [rbp + 0x39c]
1459ad098 mov word ptr [r12 + 4], cx
1459ad09e mov ecx, dword ptr [rbp + 0x398]
1459ad0a4 mov dword ptr [r12], ecx
1459ad0a8 mov rcx, r14
1459ad0ab sub rcx, rdx
1459ad0ae cmp rcx, 3
1459ad0b2 jbe 0x1459ad0de
1459ad0b4 mov dword ptr [rdi + rdx], r13d
1459ad0b8 add rdx, 4
1459ad0bc movzx ecx, word ptr [r12 + 4]
1459ad0c2 mov word ptr [rbp + 0x39c], cx
1459ad0c9 mov ecx, dword ptr [r12]
1459ad0cd mov dword ptr [rbp + 0x398], ecx
1459ad0d3 inc r15
1459ad0d6 cmp r15, 0x7c
1459ad0da jne 0x1459ad070
1459ad0dc jmp 0x1459ad11a
1459ad0de mov qword ptr [rsp + 0x20], 1
1459ad0e7 mov r8d, 4
1459ad0ed mov r9d, 1
1459ad0f3 mov rcx, rbx
1459ad0f6 call 0x145d14a10
1459ad0fb nop
1459ad0fc mov rdx, qword ptr [rbp + 0x388]
1459ad103 mov r14, qword ptr [rbp + 0x378]
1459ad10a mov rdi, qword ptr [rbp + 0x380]
1459ad111 movzx eax, word ptr [rbp + 0x390]
1459ad118 jmp 0x1459ad0b4
1459ad11a mov qword ptr [rsi], r14
1459ad11d mov qword ptr [rsi + 8], rdi
1459ad121 mov qword ptr [rsi + 0x10], rdx
1459ad125 mov word ptr [rsi + 0x18], ax
1459ad129 mov eax, dword ptr [rbp + 0x398]
1459ad12f mov dword ptr [rsi + 0x1a], eax
1459ad132 movzx eax, word ptr [rbp + 0x39c]
1459ad139 mov word ptr [rsi + 0x1e], ax
1459ad13d mov rax, rsi
1459ad140 add rsp, 0x428
1459ad147 pop rbx
1459ad148 pop rdi
1459ad149 pop rsi
1459ad14a pop r12
1459ad14c pop r13
1459ad14e pop r14
1459ad150 pop r15
1459ad152 pop rbp
1459ad153 ret
1459ad154 mov ecx, 1
1459ad159 mov edx, 0x20
1459ad15e call 0x145eb6fcb
1459ad163 ud2

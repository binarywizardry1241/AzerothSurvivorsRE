1459b1bd0 push rbp
1459b1bd1 push r14
1459b1bd3 push rsi
1459b1bd4 push rdi
1459b1bd5 push rbx
1459b1bd6 sub rsp, 0x60
1459b1bda lea rbp, [rsp + 0x60]
1459b1bdf mov qword ptr [rbp - 8], 0xfffffffffffffffe
1459b1be7 mov r14, rcx
1459b1bea call 0x140002200
1459b1bef mov ecx, 0x20
1459b1bf4 mov edx, 1
1459b1bf9 call 0x1400021c0
1459b1bfe test rax, rax
1459b1c01 je 0x1459b1cf2
1459b1c07 mov dword ptr [rax], 0x40
1459b1c0d mov qword ptr [r14], 0x20
1459b1c14 mov qword ptr [r14 + 8], rax
1459b1c18 mov qword ptr [r14 + 0x10], 4
1459b1c20 mov word ptr [r14 + 0x18], 0x122
1459b1c27 mov edi, 0x40
1459b1c2c lea rsi, [rbp - 0x30]
1459b1c30 mov qword ptr [rbp - 0x10], r14
1459b1c34 nop word ptr cs:[rax + rax]
1459b1c40 mov rbx, qword ptr [r14 + 0x10]
1459b1c44 cmp rbx, qword ptr [r14]
1459b1c47 jne 0x1459b1c53
1459b1c49 mov rcx, qword ptr [rbp - 0x10]
1459b1c4d call 0x145eb6ec0
1459b1c52 nop
1459b1c53 mov r14, qword ptr [rbp - 0x10]
1459b1c57 mov rax, qword ptr [r14 + 8]
1459b1c5b mov byte ptr [rax + rbx], 0
1459b1c5f inc rbx
1459b1c62 mov qword ptr [r14 + 0x10], rbx
1459b1c66 mov rax, qword ptr [r14 + 0x10]
1459b1c6a mov qword ptr [rbp - 0x20], rax
1459b1c6e mov rax, qword ptr [r14 + 0x18]
1459b1c72 mov qword ptr [rbp - 0x18], rax
1459b1c76 movups xmm0, xmmword ptr [r14]
1459b1c7a movaps xmmword ptr [rbp - 0x30], xmm0
1459b1c7e mov rdx, qword ptr [rbp - 0x20]
1459b1c82 mov rax, qword ptr [rbp - 0x30]
1459b1c86 sub rax, rdx
1459b1c89 cmp rax, 3
1459b1c8d jbe 0x1459b1cc0
1459b1c8f mov rax, qword ptr [rbp - 0x28]
1459b1c93 mov dword ptr [rax + rdx], 0
1459b1c9a add rdx, 4
1459b1c9e mov qword ptr [rbp - 0x20], rdx
1459b1ca2 movaps xmm0, xmmword ptr [rbp - 0x30]
1459b1ca6 movups xmmword ptr [r14], xmm0
1459b1caa mov rax, qword ptr [rbp - 0x20]
1459b1cae mov qword ptr [r14 + 0x10], rax
1459b1cb2 mov rax, qword ptr [rbp - 0x18]
1459b1cb6 mov qword ptr [r14 + 0x18], rax
1459b1cba dec edi
1459b1cbc jne 0x1459b1c40
1459b1cbe jmp 0x1459b1ce4
1459b1cc0 mov qword ptr [rsp + 0x20], 1
1459b1cc9 mov r8d, 4
1459b1ccf mov r9d, 1
1459b1cd5 mov rcx, rsi
1459b1cd8 call 0x145d14a10
1459b1cdd nop
1459b1cde mov rdx, qword ptr [rbp - 0x20]
1459b1ce2 jmp 0x1459b1c8f
1459b1ce4 mov rax, r14
1459b1ce7 add rsp, 0x60
1459b1ceb pop rbx
1459b1cec pop rdi
1459b1ced pop rsi
1459b1cee pop r14
1459b1cf0 pop rbp
1459b1cf1 ret
1459b1cf2 mov ecx, 1
1459b1cf7 mov edx, 0x20
1459b1cfc call 0x145eb6fcb
1459b1d01 ud2

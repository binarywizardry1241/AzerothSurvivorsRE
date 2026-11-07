140024c10 push rbp
140024c11 push r15
140024c13 push r14
140024c15 push r13
140024c17 push r12
140024c19 push rsi
140024c1a push rdi
140024c1b push rbx
140024c1c sub rsp, 0xe8
140024c23 lea rbp, [rsp + 0x80]
140024c2b mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
140024c33 mov rsi, rcx
140024c36 mov r8d, dword ptr [rdx]
140024c39 mov r9d, dword ptr [rdx + 4]
140024c3d mov rax, r9
140024c40 shl rax, 0x20
140024c44 or rax, r8
140024c47 xor ecx, ecx
140024c49 cmp rax, qword ptr [rdx - 0x28]
140024c4d setl cl
140024c50 mov eax, 2
140024c55 cmovne eax, ecx
140024c58 test al, al
140024c5a je 0x140024dd4
140024c60 movzx eax, al
140024c63 cmp eax, 2
140024c66 jne 0x140024cbb
140024c68 mov rax, qword ptr [rdx + 0x10]
140024c6c mov r8, qword ptr [rdx + 0x18]
140024c70 mov rdi, qword ptr [rdx - 0x18]
140024c74 mov rbx, qword ptr [rdx - 0x10]
140024c78 lea r14, [rbp - 0x20]
140024c7c mov rcx, r14
140024c7f mov r12, rdx
140024c82 mov rdx, rax
140024c85 call 0x145ca5900
140024c8a lea r15, [rbp - 0x60]
140024c8e mov rcx, r15
140024c91 mov rdx, rdi
140024c94 mov r8, rbx
140024c97 call 0x145ca5900
140024c9c mov rcx, r14
140024c9f mov rdx, r15
140024ca2 call 0x145cb46a0
140024ca7 test al, al
140024ca9 jns 0x140024dd4
140024caf mov rdx, r12
140024cb2 mov r8d, dword ptr [r12]
140024cb6 mov r9d, dword ptr [r12 + 4]
140024cbb lea r10, [rdx - 0x28]
140024cbf mov rax, qword ptr [rdx + 8]
140024cc3 mov qword ptr [rbp + 0x50], rax
140024cc7 mov rax, qword ptr [rdx + 0x10]
140024ccb mov qword ptr [rbp + 0x58], rax
140024ccf movups xmm2, xmmword ptr [rdx + 0x18]
140024cd3 movups xmm0, xmmword ptr [r10]
140024cd7 movups xmm1, xmmword ptr [r10 + 0x10]
140024cdc movups xmmword ptr [rdx], xmm0
140024cdf movups xmmword ptr [rdx + 0x10], xmm1
140024ce3 mov rax, qword ptr [r10 + 0x20]
140024ce7 mov qword ptr [rdx + 0x20], rax
140024ceb cmp r10, rsi
140024cee mov qword ptr [rbp + 0x40], r8
140024cf2 mov qword ptr [rbp + 0x48], r9
140024cf6 je 0x140024db0
140024cfc mov eax, r8d
140024cff mov r12, r9
140024d02 shl r12, 0x20
140024d06 or r12, rax
140024d09 movlps qword ptr [rbp + 0x38], xmm2
140024d0d mov r13d, 2
140024d13 lea rdi, [rbp - 0x20]
140024d17 lea rbx, [rbp - 0x60]
140024d1b movaps xmmword ptr [rbp + 0x20], xmm2
140024d1f jmp 0x140024d5b
140024d21 nop word ptr cs:[rax + rax]
140024d30 movzx eax, al
140024d33 test eax, eax
140024d35 je 0x140024db0
140024d37 lea rax, [r10 - 0x28]
140024d3b mov rcx, qword ptr [rax + 0x20]
140024d3f mov qword ptr [r10 + 0x20], rcx
140024d43 movups xmm0, xmmword ptr [rax]
140024d46 movups xmm1, xmmword ptr [rax + 0x10]
140024d4a movups xmmword ptr [r10 + 0x10], xmm1
140024d4f movups xmmword ptr [r10], xmm0
140024d53 mov r10, rax
140024d56 cmp rax, rsi
140024d59 je 0x140024db3
140024d5b xor eax, eax
140024d5d cmp r12, qword ptr [r10 - 0x28]
140024d61 setl al
140024d64 cmove eax, r13d
140024d68 cmp al, 2
140024d6a jne 0x140024d30
140024d6c mov r14, qword ptr [r10 - 0x18]
140024d70 mov qword ptr [rbp + 0x30], r10
140024d74 mov r15, qword ptr [r10 - 0x10]
140024d78 mov rcx, rdi
140024d7b mov rdx, qword ptr [rbp + 0x58]
140024d7f mov r8, qword ptr [rbp + 0x38]
140024d83 call 0x145ca5900
140024d88 nop
140024d89 mov rcx, rbx
140024d8c mov rdx, r14
140024d8f mov r8, r15
140024d92 call 0x145ca5900
140024d97 nop
140024d98 mov rcx, rdi
140024d9b mov rdx, rbx
140024d9e call 0x145cb46a0
140024da3 nop
140024da4 test al, al
140024da6 movaps xmm2, xmmword ptr [rbp + 0x20]
140024daa mov r10, qword ptr [rbp + 0x30]
140024dae js 0x140024d37
140024db0 mov rax, r10
140024db3 mov rcx, qword ptr [rbp + 0x40]
140024db7 mov dword ptr [rax], ecx
140024db9 mov rcx, qword ptr [rbp + 0x48]
140024dbd mov dword ptr [rax + 4], ecx
140024dc0 mov rcx, qword ptr [rbp + 0x50]
140024dc4 mov qword ptr [rax + 8], rcx
140024dc8 mov rcx, qword ptr [rbp + 0x58]
140024dcc mov qword ptr [rax + 0x10], rcx
140024dd0 movups xmmword ptr [rax + 0x18], xmm2
140024dd4 add rsp, 0xe8
140024ddb pop rbx
140024ddc pop rdi
140024ddd pop rsi
140024dde pop r12
140024de0 pop r13
140024de2 pop r14
140024de4 pop r15
140024de6 pop rbp
140024de7 ret

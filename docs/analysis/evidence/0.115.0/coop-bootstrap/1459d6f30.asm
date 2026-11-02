1459d6f30 push rbp
1459d6f31 push r15
1459d6f33 push r14
1459d6f35 push r13
1459d6f37 push r12
1459d6f39 push rsi
1459d6f3a push rdi
1459d6f3b push rbx
1459d6f3c sub rsp, 0x68
1459d6f40 lea rbp, [rsp + 0x60]
1459d6f45 mov qword ptr [rbp], 0xfffffffffffffffe
1459d6f4d mov r15, r8
1459d6f50 sub r15, rdx
1459d6f53 sub r8, rdx
1459d6f56 je 0x1459d7005
1459d6f5c mov rdi, rdx
1459d6f5f mov qword ptr [rbp - 0x18], rcx
1459d6f63 mov qword ptr [rbp - 0x10], r8
1459d6f67 mov rbx, r15
1459d6f6a shr rbx, 2
1459d6f6e call 0x140002200
1459d6f73 mov edx, 4
1459d6f78 mov rcx, rbx
1459d6f7b call 0x1400021c0
1459d6f80 test rax, rax
1459d6f83 je 0x1459d7059
1459d6f89 shr r15, 4
1459d6f8d xor r12d, r12d
1459d6f90 lea r13, [rip + 0x12ed5e9]
1459d6f97 mov qword ptr [rbp - 8], rax
1459d6f9b nop dword ptr [rax + rax]
1459d6fa0 mov rax, r12
1459d6fa3 shl rax, 4
1459d6fa7 mov rbx, qword ptr [rdi + rax]
1459d6fab mov r14, qword ptr [rdi + rax + 8]
1459d6fb0 mov qword ptr [rbp - 0x28], rbx
1459d6fb4 mov qword ptr [rbp - 0x20], r14
1459d6fb8 xor esi, esi
1459d6fba jmp 0x1459d6fcd
1459d6fbc nop dword ptr [rax]
1459d6fc0 add rsi, 0x78
1459d6fc4 cmp rsi, 0x34f8
1459d6fcb je 0x1459d702c
1459d6fcd cmp qword ptr [rsi + r13 + 8], r14
1459d6fd2 jne 0x1459d6fc0
1459d6fd4 mov rcx, qword ptr [rsi + r13]
1459d6fd8 mov rdx, rbx
1459d6fdb mov r8, r14
1459d6fde call 0x145d14601
1459d6fe3 test eax, eax
1459d6fe5 jne 0x1459d6fc0
1459d6fe7 mov eax, dword ptr [rsi + r13 + 0x40]
1459d6fec mov rcx, qword ptr [rbp - 8]
1459d6ff0 mov dword ptr [rcx + r12*4], eax
1459d6ff4 inc r12
1459d6ff7 cmp r12, r15
1459d6ffa jne 0x1459d6fa0
1459d6ffc mov rax, rcx
1459d6fff mov rcx, qword ptr [rbp - 0x18]
1459d7003 jmp 0x1459d700d
1459d7005 xor r15d, r15d
1459d7008 mov eax, 4
1459d700d mov qword ptr [rcx], r15
1459d7010 mov qword ptr [rcx + 8], rax
1459d7014 mov qword ptr [rcx + 0x10], r15
1459d7018 mov rax, rcx
1459d701b add rsp, 0x68
1459d701f pop rbx
1459d7020 pop rdi
1459d7021 pop rsi
1459d7022 pop r12
1459d7024 pop r13
1459d7026 pop r14
1459d7028 pop r15
1459d702a pop rbp
1459d702b ret
1459d702c lea rax, [rbp - 0x28]
1459d7030 mov qword ptr [rbp - 0x38], rax
1459d7034 lea rax, [rip - 0x59d4f7b]
1459d703b mov qword ptr [rbp - 0x30], rax
1459d703f lea rcx, [rip + 0x12ec722]
1459d7046 lea r8, [rip + 0x12ec72b]
1459d704d lea rdx, [rbp - 0x38]
1459d7051 call 0x145eb7540
1459d7056 nop
1459d7057 ud2
1459d7059 mov ecx, 4
1459d705e mov rdx, rbx
1459d7061 call 0x145eb6fcb
1459d7066 ud2

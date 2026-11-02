1459affb0 push rbp
1459affb1 push r14
1459affb3 push rsi
1459affb4 push rdi
1459affb5 push rbx
1459affb6 sub rsp, 0x80
1459affbd lea rbp, [rsp + 0x80]
1459affc5 mov qword ptr [rbp - 8], 0xfffffffffffffffe
1459affcd mov edi, r9d
1459affd0 mov ebx, r8d
1459affd3 mov r14, rdx
1459affd6 mov rsi, rcx
1459affd9 call 0x140002200
1459affde mov ecx, 0x20
1459affe3 mov edx, 1
1459affe8 call 0x1400021c0
1459affed test rax, rax
1459afff0 je 0x1459b00f0
1459afff6 mov word ptr [rbp - 0x18], 0x155
1459afffc mov qword ptr [rbp - 0x30], 0x20
1459b0004 mov qword ptr [rbp - 0x28], rax
1459b0008 mov qword ptr [rbp - 0x20], 0
1459b0010 lea rcx, [rbp - 0x50]
1459b0014 lea rdx, [rbp - 0x30]
1459b0018 mov r8, r14
1459b001b call 0x14598cc40
1459b0020 mov rax, qword ptr [rbp - 0x50]
1459b0024 mov rdx, qword ptr [rbp - 0x40]
1459b0028 sub rax, rdx
1459b002b cmp rax, 3
1459b002f jbe 0x1459b00a0
1459b0031 mov rax, qword ptr [rbp - 0x48]
1459b0035 mov dword ptr [rax + rdx], ebx
1459b0038 add rdx, 4
1459b003c mov qword ptr [rbp - 0x40], rdx
1459b0040 movups xmm0, xmmword ptr [rbp - 0x50]
1459b0044 movaps xmmword ptr [rbp - 0x30], xmm0
1459b0048 mov rax, qword ptr [rbp - 0x40]
1459b004c mov qword ptr [rbp - 0x20], rax
1459b0050 mov rax, qword ptr [rbp - 0x38]
1459b0054 mov qword ptr [rbp - 0x18], rax
1459b0058 mov rdx, qword ptr [rbp - 0x20]
1459b005c mov rax, qword ptr [rbp - 0x30]
1459b0060 sub rax, rdx
1459b0063 cmp rax, 3
1459b0067 jbe 0x1459b00c8
1459b0069 mov rax, qword ptr [rbp - 0x28]
1459b006d mov dword ptr [rax + rdx], edi
1459b0070 add rdx, 4
1459b0074 mov qword ptr [rbp - 0x20], rdx
1459b0078 movaps xmm0, xmmword ptr [rbp - 0x30]
1459b007c movups xmmword ptr [rsi], xmm0
1459b007f mov rax, qword ptr [rbp - 0x20]
1459b0083 mov qword ptr [rsi + 0x10], rax
1459b0087 mov rax, qword ptr [rbp - 0x18]
1459b008b mov qword ptr [rsi + 0x18], rax
1459b008f mov rax, rsi
1459b0092 add rsp, 0x80
1459b0099 pop rbx
1459b009a pop rdi
1459b009b pop rsi
1459b009c pop r14
1459b009e pop rbp
1459b009f ret
1459b00a0 mov qword ptr [rsp + 0x20], 1
1459b00a9 lea rcx, [rbp - 0x50]
1459b00ad mov r8d, 4
1459b00b3 mov r9d, 1
1459b00b9 call 0x145d14a10
1459b00be nop
1459b00bf mov rdx, qword ptr [rbp - 0x40]
1459b00c3 jmp 0x1459b0031
1459b00c8 mov qword ptr [rsp + 0x20], 1
1459b00d1 lea rcx, [rbp - 0x30]
1459b00d5 mov r8d, 4
1459b00db mov r9d, 1
1459b00e1 call 0x145d14a10
1459b00e6 nop
1459b00e7 mov rdx, qword ptr [rbp - 0x20]
1459b00eb jmp 0x1459b0069
1459b00f0 mov ecx, 1
1459b00f5 mov edx, 0x20
1459b00fa call 0x145eb6fcb
1459b00ff ud2

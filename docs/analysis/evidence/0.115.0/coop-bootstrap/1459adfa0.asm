1459adfa0 push rbp
1459adfa1 push r15
1459adfa3 push r14
1459adfa5 push r13
1459adfa7 push r12
1459adfa9 push rsi
1459adfaa push rdi
1459adfab push rbx
1459adfac sub rsp, 0x98
1459adfb3 lea rbp, [rsp + 0x80]
1459adfbb mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
1459adfc3 mov rdi, r8
1459adfc6 mov rbx, rdx
1459adfc9 mov rsi, rcx
1459adfcc call 0x140002200
1459adfd1 mov ecx, 0x20
1459adfd6 mov edx, 1
1459adfdb call 0x1400021c0
1459adfe0 test rax, rax
1459adfe3 je 0x1459ae18d
1459adfe9 mov byte ptr [rax], 0
1459adfec mov qword ptr [rbp - 0x10], 0x20
1459adff4 mov qword ptr [rbp - 8], rax
1459adff8 mov word ptr [rbp + 8], 0x12a
1459adffe mov word ptr [rax + 1], di
1459ae002 mov qword ptr [rbp], 3
1459ae00a test rdi, rdi
1459ae00d je 0x1459ae117
1459ae013 shl rdi, 2
1459ae017 xor r12d, r12d
1459ae01a lea r14, [rbp - 0x50]
1459ae01e lea r15, [rbp - 0x30]
1459ae022 nop word ptr cs:[rax + rax]
1459ae030 movzx r13d, word ptr [rbx + r12]
1459ae035 movups xmm0, xmmword ptr [rbp - 0x10]
1459ae039 movups xmm1, xmmword ptr [rbp]
1459ae03d movaps xmmword ptr [rbp - 0x40], xmm1
1459ae041 movaps xmmword ptr [rbp - 0x50], xmm0
1459ae045 mov rdx, qword ptr [rbp - 0x40]
1459ae049 mov rax, qword ptr [rbp - 0x50]
1459ae04d sub rax, rdx
1459ae050 cmp rax, 1
1459ae054 jbe 0x1459ae0c9
1459ae056 mov rax, qword ptr [rbp - 0x48]
1459ae05a mov word ptr [rax + rdx], r13w
1459ae05f add rdx, 2
1459ae063 mov qword ptr [rbp - 0x40], rdx
1459ae067 movaps xmm0, xmmword ptr [rbp - 0x50]
1459ae06b movaps xmmword ptr [rbp - 0x30], xmm0
1459ae06f mov rax, qword ptr [rbp - 0x40]
1459ae073 mov qword ptr [rbp - 0x20], rax
1459ae077 mov rax, qword ptr [rbp - 0x38]
1459ae07b mov qword ptr [rbp - 0x18], rax
1459ae07f mov rdx, qword ptr [rbp - 0x20]
1459ae083 mov rax, qword ptr [rbp - 0x30]
1459ae087 sub rax, rdx
1459ae08a cmp rax, 1
1459ae08e jbe 0x1459ae0f0
1459ae090 mov rax, qword ptr [rbp - 0x28]
1459ae094 mov word ptr [rax + rdx], 0
1459ae09a add rdx, 2
1459ae09e mov qword ptr [rbp - 0x20], rdx
1459ae0a2 movaps xmm0, xmmword ptr [rbp - 0x30]
1459ae0a6 movaps xmmword ptr [rbp - 0x10], xmm0
1459ae0aa mov rax, qword ptr [rbp - 0x20]
1459ae0ae mov qword ptr [rbp], rax
1459ae0b2 mov rax, qword ptr [rbp - 0x18]
1459ae0b6 mov qword ptr [rbp + 8], rax
1459ae0ba add r12, 4
1459ae0be cmp rdi, r12
1459ae0c1 jne 0x1459ae030
1459ae0c7 jmp 0x1459ae117
1459ae0c9 mov qword ptr [rsp + 0x20], 1
1459ae0d2 mov r8d, 2
1459ae0d8 mov r9d, 1
1459ae0de mov rcx, r14
1459ae0e1 call 0x145d14a10
1459ae0e6 nop
1459ae0e7 mov rdx, qword ptr [rbp - 0x40]
1459ae0eb jmp 0x1459ae056
1459ae0f0 mov qword ptr [rsp + 0x20], 1
1459ae0f9 mov r8d, 2
1459ae0ff mov r9d, 1
1459ae105 mov rcx, r15
1459ae108 call 0x145d14a10
1459ae10d nop
1459ae10e mov rdx, qword ptr [rbp - 0x20]
1459ae112 jmp 0x1459ae090
1459ae117 mov rax, qword ptr [rbp - 0x10]
1459ae11b mov rdx, qword ptr [rbp]
1459ae11f sub rax, rdx
1459ae122 cmp rax, 1
1459ae126 jbe 0x1459ae168
1459ae128 mov rax, qword ptr [rbp - 8]
1459ae12c mov word ptr [rax + rdx], 0
1459ae132 add rdx, 2
1459ae136 mov qword ptr [rbp], rdx
1459ae13a movaps xmm0, xmmword ptr [rbp - 0x10]
1459ae13e movups xmmword ptr [rsi], xmm0
1459ae141 mov rax, qword ptr [rbp]
1459ae145 mov qword ptr [rsi + 0x10], rax
1459ae149 mov rax, qword ptr [rbp + 8]
1459ae14d mov qword ptr [rsi + 0x18], rax
1459ae151 mov rax, rsi
1459ae154 add rsp, 0x98
1459ae15b pop rbx
1459ae15c pop rdi
1459ae15d pop rsi
1459ae15e pop r12
1459ae160 pop r13
1459ae162 pop r14
1459ae164 pop r15
1459ae166 pop rbp
1459ae167 ret
1459ae168 mov qword ptr [rsp + 0x20], 1
1459ae171 lea rcx, [rbp - 0x10]
1459ae175 mov r8d, 2
1459ae17b mov r9d, 1
1459ae181 call 0x145d14a10
1459ae186 nop
1459ae187 mov rdx, qword ptr [rbp]
1459ae18b jmp 0x1459ae128
1459ae18d mov ecx, 1
1459ae192 mov edx, 0x20
1459ae197 call 0x145eb6fcb
1459ae19c ud2

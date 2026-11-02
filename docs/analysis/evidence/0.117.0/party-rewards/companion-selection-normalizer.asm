145c0ecf0 push rbp
145c0ecf1 push r15
145c0ecf3 push r14
145c0ecf5 push r13
145c0ecf7 push r12
145c0ecf9 push rsi
145c0ecfa push rdi
145c0ecfb push rbx
145c0ecfc sub rsp, 0x78
145c0ed00 lea rbp, [rsp + 0x70]
145c0ed05 mov qword ptr [rbp], 0xfffffffffffffffe
145c0ed0d mov rsi, qword ptr [rcx + 0x18]
145c0ed11 mov rax, qword ptr [rdx]
145c0ed14 mov qword ptr [rbp - 0x20], rax
145c0ed18 mov rax, qword ptr [rdx + 8]
145c0ed1c mov qword ptr [rbp - 8], rax
145c0ed20 mov r12, qword ptr [rdx + 0x10]
145c0ed24 mov r14, qword ptr [rcx]
145c0ed27 mov rax, qword ptr [rcx + 8]
145c0ed2b sub rax, r14
145c0ed2e shr rax, 3
145c0ed32 movabs r13, 0xaaaaaaaaaaaaaaab
145c0ed3c imul r13, rax
145c0ed40 mov rax, qword ptr [rcx + 0x10]
145c0ed44 cmp r13, rax
145c0ed47 cmovae r13, rax
145c0ed4b xor r15d, r15d
145c0ed4e lea rbx, [rip + 0x19c72b3]
145c0ed55 mov qword ptr [rbp - 0x28], r12
145c0ed59 mov qword ptr [rbp - 0x48], r14
145c0ed5d cmp r15, r13
145c0ed60 jae 0x145c0ef12
145c0ed66 lea rax, [r15 + r15*2]
145c0ed6a mov rcx, qword ptr [r14 + rax*8 + 8]
145c0ed6f mov rdx, qword ptr [r14 + rax*8 + 0x10]
145c0ed74 call 0x145ada7f0
145c0ed79 nop
145c0ed7a test rax, rax
145c0ed7d je 0x145c0ee67
145c0ed83 mov rdx, qword ptr [rax + 0x40]
145c0ed87 test rdx, rdx
145c0ed8a je 0x145c0ee69
145c0ed90 mov qword ptr [rbp - 0x10], r15
145c0ed94 mov r15, qword ptr [rsi + 0xb8]
145c0ed9b test r15, r15
145c0ed9e je 0x145c0eef9
145c0eda4 mov qword ptr [rbp - 0x30], r13
145c0eda8 mov qword ptr [rbp - 0x40], rax
145c0edac mov r9, qword ptr [rax + 0x48]
145c0edb0 mov qword ptr [rbp - 0x38], rsi
145c0edb4 mov r13, qword ptr [rsi + 0xb0]
145c0edbb mov r12d, 0
145c0edc1 cmp r15, 1
145c0edc5 je 0x145c0ee1f
145c0edc7 xor r12d, r12d
145c0edca nop word ptr [rax + rax]
145c0edd0 mov qword ptr [rbp - 0x50], r12
145c0edd4 mov r14, r15
145c0edd7 shr r14, 1
145c0edda add r12, r14
145c0eddd lea rax, [r12 + r12*2]
145c0ede1 mov rcx, qword ptr [r13 + rax*8 + 8]
145c0ede6 mov r8, qword ptr [r13 + rax*8 + 0x10]
145c0edeb mov rdi, r8
145c0edee sub rdi, r9
145c0edf1 cmovae r8, r9
145c0edf5 mov rbx, rdx
145c0edf8 mov rsi, r9
145c0edfb call 0x145f93ce7
145c0ee00 mov r9, rsi
145c0ee03 mov rdx, rbx
145c0ee06 cdqe
145c0ee08 test eax, eax
145c0ee0a cmovne rdi, rax
145c0ee0e test rdi, rdi
145c0ee11 cmovg r12, qword ptr [rbp - 0x50]
145c0ee16 sub r15, r14
145c0ee19 cmp r15, 1
145c0ee1d ja 0x145c0edd0
145c0ee1f lea rax, [r12 + r12*2]
145c0ee23 mov rcx, qword ptr [r13 + rax*8 + 8]
145c0ee28 mov rax, qword ptr [r13 + rax*8 + 0x10]
145c0ee2d mov rsi, rax
145c0ee30 sub rsi, r9
145c0ee33 cmovb r9, rax
145c0ee37 mov r8, r9
145c0ee3a call 0x145f93ce7
145c0ee3f cdqe
145c0ee41 test eax, eax
145c0ee43 cmovne rsi, rax
145c0ee47 test rsi, rsi
145c0ee4a mov rax, qword ptr [rbp - 0x40]
145c0ee4e mov rsi, qword ptr [rbp - 0x38]
145c0ee52 mov r12, qword ptr [rbp - 0x28]
145c0ee56 mov r13, qword ptr [rbp - 0x30]
145c0ee5a mov r15, qword ptr [rbp - 0x10]
145c0ee5e lea rbx, [rip + 0x19c71a3]
145c0ee65 je 0x145c0ee69
145c0ee67 xor eax, eax
145c0ee69 inc r15
145c0ee6c test rax, rax
145c0ee6f cmove rax, rbx
145c0ee73 mov rdi, qword ptr [rax + 8]
145c0ee77 test rdi, rdi
145c0ee7a js 0x145c0ef04
145c0ee80 je 0x145c0eec3
145c0ee82 mov r12, rsi
145c0ee85 mov rsi, rbx
145c0ee88 mov rbx, qword ptr [rax]
145c0ee8b call 0x140002200
145c0ee90 mov edx, 1
145c0ee95 mov rcx, rdi
145c0ee98 call 0x1400021c0
145c0ee9d test rax, rax
145c0eea0 je 0x145c0ef2e
145c0eea6 mov rcx, rax
145c0eea9 mov rdx, rbx
145c0eeac mov r8, rdi
145c0eeaf mov r14, rax
145c0eeb2 call 0x145f93cdb
145c0eeb7 mov rbx, rsi
145c0eeba mov rsi, r12
145c0eebd mov r12, qword ptr [rbp - 0x28]
145c0eec1 jmp 0x145c0eec9
145c0eec3 mov r14d, 1
145c0eec9 mov rcx, qword ptr [rbp - 8]
145c0eecd lea rax, [rcx + rcx*2]
145c0eed1 mov qword ptr [r12 + rax*8], rdi
145c0eed5 mov qword ptr [rbp - 0x18], r14
145c0eed9 mov qword ptr [r12 + rax*8 + 8], r14
145c0eede mov qword ptr [r12 + rax*8 + 0x10], rdi
145c0eee3 inc rcx
145c0eee6 mov qword ptr [rbp - 8], rcx
145c0eeea mov r14, qword ptr [rbp - 0x48]
145c0eeee cmp r15, r13
145c0eef1 jb 0x145c0ed66
145c0eef7 jmp 0x145c0ef12
145c0eef9 xor eax, eax
145c0eefb mov r15, qword ptr [rbp - 0x10]
145c0eeff jmp 0x145c0ee69
145c0ef04 xor ecx, ecx
145c0ef06 mov rdx, qword ptr [rbp - 0x18]
145c0ef0a call 0x14613acbb
145c0ef0f nop
145c0ef10 ud2
145c0ef12 mov rax, qword ptr [rbp - 0x20]
145c0ef16 mov rcx, qword ptr [rbp - 8]
145c0ef1a mov qword ptr [rax], rcx
145c0ef1d add rsp, 0x78
145c0ef21 pop rbx
145c0ef22 pop rdi
145c0ef23 pop rsi
145c0ef24 pop r12
145c0ef26 pop r13
145c0ef28 pop r14
145c0ef2a pop r15
145c0ef2c pop rbp
145c0ef2d ret
145c0ef2e mov qword ptr [rbp - 0x18], rdi
145c0ef32 mov ecx, 1
145c0ef37 jmp 0x145c0ef06

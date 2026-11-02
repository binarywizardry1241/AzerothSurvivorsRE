145b4af90 push r15
145b4af92 push r14
145b4af94 push r13
145b4af96 push r12
145b4af98 push rsi
145b4af99 push rdi
145b4af9a push rbp
145b4af9b push rbx
145b4af9c sub rsp, 0x28
145b4afa0 cmp rdx, qword ptr [rcx + 0x148]
145b4afa7 jae 0x145b4b089
145b4afad mov rdi, rcx
145b4afb0 mov rax, qword ptr [rcx + 0x140]
145b4afb7 lea rdx, [rdx + rdx*2]
145b4afbb mov rcx, qword ptr [rax + rdx*8 + 8]
145b4afc0 mov rdx, qword ptr [rax + rdx*8 + 0x10]
145b4afc5 call 0x145ada7f0
145b4afca test rax, rax
145b4afcd je 0x145b4b089
145b4afd3 mov rsi, qword ptr [rax + 0x40]
145b4afd7 test rsi, rsi
145b4afda je 0x145b4b08b
145b4afe0 mov r14, qword ptr [rdi + 0xb8]
145b4afe7 xor r12d, r12d
145b4afea test r14, r14
145b4afed je 0x145b4b089
145b4aff3 mov rcx, rdi
145b4aff6 mov qword ptr [rsp + 0x20], rax
145b4affb mov rdi, qword ptr [rax + 0x48]
145b4afff mov r15, qword ptr [rcx + 0xb0]
145b4b006 cmp r14, 1
145b4b00a je 0x145b4b054
145b4b00c xor r12d, r12d
145b4b00f nop
145b4b010 mov r13, r12
145b4b013 mov rbp, r14
145b4b016 shr rbp, 1
145b4b019 add r12, rbp
145b4b01c lea rax, [r12 + r12*2]
145b4b020 mov rcx, qword ptr [r15 + rax*8 + 8]
145b4b025 mov r8, qword ptr [r15 + rax*8 + 0x10]
145b4b02a mov rbx, r8
145b4b02d sub rbx, rdi
145b4b030 cmovae r8, rdi
145b4b034 mov rdx, rsi
145b4b037 call 0x145f93ce7
145b4b03c cdqe
145b4b03e test eax, eax
145b4b040 cmovne rbx, rax
145b4b044 test rbx, rbx
145b4b047 cmovg r12, r13
145b4b04b sub r14, rbp
145b4b04e cmp r14, 1
145b4b052 ja 0x145b4b010
145b4b054 lea rax, [r12 + r12*2]
145b4b058 mov rcx, qword ptr [r15 + rax*8 + 8]
145b4b05d mov rax, qword ptr [r15 + rax*8 + 0x10]
145b4b062 mov rbx, rax
145b4b065 sub rbx, rdi
145b4b068 cmovb rdi, rax
145b4b06c mov rdx, rsi
145b4b06f mov r8, rdi
145b4b072 call 0x145f93ce7
145b4b077 cdqe
145b4b079 test eax, eax
145b4b07b cmovne rbx, rax
145b4b07f test rbx, rbx
145b4b082 mov rax, qword ptr [rsp + 0x20]
145b4b087 je 0x145b4b08b
145b4b089 xor eax, eax
145b4b08b test rax, rax
145b4b08e lea rcx, [rip + 0x1a7f1a3]
145b4b095 cmovne rcx, rax
145b4b099 mov rax, rcx
145b4b09c add rsp, 0x28
145b4b0a0 pop rbx
145b4b0a1 pop rbp
145b4b0a2 pop rdi
145b4b0a3 pop rsi
145b4b0a4 pop r12
145b4b0a6 pop r13
145b4b0a8 pop r14
145b4b0aa pop r15
145b4b0ac ret

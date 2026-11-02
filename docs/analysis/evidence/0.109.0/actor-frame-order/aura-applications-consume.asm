14597c2c0: 4885f6 test rsi, rsi
14597c2c3: 741d je 0x14597c2e2
14597c2c5: 488d7810 lea rdi, [rax + 0x10]
14597c2c9: 488b10 mov rdx, qword ptr [rax]
14597c2cc: 448b4008 mov r8d, dword ptr [rax + 8]
14597c2d0: 4883c6f0 add rsi, -0x10
14597c2d4: 4c89f9 mov rcx, r15
14597c2d7: e8444d0000 call 0x145981020
14597c2dc: 90 nop 
14597c2dd: 4889f8 mov rax, rdi
14597c2e0: ebde jmp 0x14597c2c0

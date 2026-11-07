140286ce4 488b3a mov rdi, qword ptr [rdx]
140286ce7 0fb65f20 movzx ebx, byte ptr [rdi + 0x20]
140286ceb 80fb02 cmp bl, 2
140286cee 0f84e9030000 je 0x1402870dd
140286cf4 488b8540010000 mov rax, qword ptr [rbp + 0x140]
140286cfb 4c8b7210 mov r14, qword ptr [rdx + 0x10]
140286cff 448b7a1c mov r15d, dword ptr [rdx + 0x1c]
140286d03 498b08 mov rcx, qword ptr [r8]
140286d06 498b31 mov rsi, qword ptr [r9]
140286d09 440f1000 movups xmm8, xmmword ptr [rax]
140286d0d f2440f104810 movsd xmm9, qword ptr [rax + 0x10]
140286d13 f20f107f18 movsd xmm7, qword ptr [rdi + 0x18]
140286d18 f20f107724 movsd xmm6, qword ptr [rdi + 0x24]

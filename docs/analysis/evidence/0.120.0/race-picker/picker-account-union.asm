00000001402fccf5  4c89bd10080000         mov qword ptr [rbp + 0x810], r15
00000001402fccfc  498b4f08               mov rcx, qword ptr [r15 + 8]
00000001402fcd00  488b8118010000         mov rax, qword ptr [rcx + 0x118]
00000001402fcd07  48898d080b0000         mov qword ptr [rbp + 0xb08], rcx
00000001402fcd0e  488b9120010000         mov rdx, qword ptr [rcx + 0x120]
00000001402fcd15  440fb64038             movzx r8d, byte ptr [rax + 0x38]
00000001402fcd1a  488d8d60040000         lea rcx, [rbp + 0x460]
00000001402fcd21  e87aad7905             call 0x145a97aa0

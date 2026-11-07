145947dca: 498b4630 mov rax, qword ptr [r14 + 0x30]
145947dce: 488b5038 mov rdx, qword ptr [rax + 0x38]
145947dd2: f30f5f0d86544600 maxss xmm1, dword ptr [rip + 0x465486]
145947dda: 4883fa20 cmp rdx, 0x20
145947dde: 41b920000000 mov r9d, 0x20
145947de4: 4c0f42ca cmovb r9, rdx
145947de8: 4885d2 test rdx, rdx
145947deb: 0f8444030000 je 0x145948135
145947df1: 4c8b5830 mov r11, qword ptr [rax + 0x30]
145947df5: 458b564c mov r10d, dword ptr [r14 + 0x4c]
145947df9: f30f5ec1 divss xmm0, xmm1
145947dfd: 41b840000000 mov r8d, 0x40
145947e03: 31ff xor edi, edi
145947e05: eb19 jmp 0x145947e20
145947e07: 660f1f840000000000 nop word ptr [rax + rax]
145947e10: 48ffc7 inc rdi
145947e13: 4983c048 add r8, 0x48
145947e17: 4939f9 cmp r9, rdi
145947e1a: 0f8415030000 je 0x145948135

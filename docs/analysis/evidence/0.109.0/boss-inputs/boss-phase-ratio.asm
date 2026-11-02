14597a4ca: 498b4630 mov rax, qword ptr [r14 + 0x30]
14597a4ce: 488b5038 mov rdx, qword ptr [rax + 0x38]
14597a4d2: f30f5f0dc62d4200 maxss xmm1, dword ptr [rip + 0x422dc6]
14597a4da: 4883fa20 cmp rdx, 0x20
14597a4de: 41b920000000 mov r9d, 0x20
14597a4e4: 4c0f42ca cmovb r9, rdx
14597a4e8: 4885d2 test rdx, rdx
14597a4eb: 0f8444030000 je 0x14597a835
14597a4f1: 4c8b5830 mov r11, qword ptr [rax + 0x30]
14597a4f5: 458b564c mov r10d, dword ptr [r14 + 0x4c]
14597a4f9: f30f5ec1 divss xmm0, xmm1
14597a4fd: 41b840000000 mov r8d, 0x40
14597a503: 31ff xor edi, edi
14597a505: eb19 jmp 0x14597a520
14597a507: 660f1f840000000000 nop word ptr [rax + rax]
14597a510: 48ffc7 inc rdi
14597a513: 4983c048 add r8, 0x48
14597a517: 4939f9 cmp r9, rdi
14597a51a: 0f8415030000 je 0x14597a835

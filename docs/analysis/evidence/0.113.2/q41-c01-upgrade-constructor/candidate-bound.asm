00000001459657ad: 4c3ba530010000                 cmp r12, qword ptr [rbp + 0x130]
00000001459657b4: 0f849f020000                   je 0x145965a59
00000001459657ba: 48c785f000000004000000         mov qword ptr [rbp + 0xf0], 4
00000001459657c5: 488b9738030000                 mov rdx, qword ptr [rdi + 0x338]
00000001459657cc: 4939d5                         cmp r13, rdx
00000001459657cf: 0f83e7090000                   jae 0x1459661bc
00000001459657d5: 488b8730030000                 mov rax, qword ptr [rdi + 0x330]
00000001459657dc: 496bcd58                       imul rcx, r13, 0x58
00000001459657e0: 488d1408                       lea rdx, [rax + rcx]

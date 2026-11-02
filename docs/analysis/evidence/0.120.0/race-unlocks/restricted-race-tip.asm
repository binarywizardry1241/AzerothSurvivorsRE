00000001402f97e9  488b8550030000         mov rax, qword ptr [rbp + 0x350]
00000001402f97f0  803800                 cmp byte ptr [rax], 0
00000001402f97f3  488b8548030000         mov rax, qword ptr [rbp + 0x348]
00000001402f97fa  0f853c030000           jne 0x1402f9b3c
00000001402f9800  488b33                 mov rsi, qword ptr [rbx]
00000001402f9803  488b00                 mov rax, qword ptr [rax]
00000001402f9806  0fb64838               movzx ecx, byte ptr [rax + 0x38]
00000001402f980a  e8519b7805             call 0x145a83360
00000001402f980f  4889c1                 mov rcx, rax
00000001402f9812  e849517805             call 0x145a7e960
00000001402f9817  488985c8020000         mov qword ptr [rbp + 0x2c8], rax
00000001402f981e  488995d0020000         mov qword ptr [rbp + 0x2d0], rdx
00000001402f9825  488d05e7d3eb05         lea rax, [rip + 0x5ebd3e7]
00000001402f982c  488985f0050000         mov qword ptr [rbp + 0x5f0], rax
00000001402f9833  48c785f805000005000000 mov qword ptr [rbp + 0x5f8], 5
00000001402f983e  488d85c8020000         lea rax, [rbp + 0x2c8]
00000001402f9845  48898500060000         mov qword ptr [rbp + 0x600], rax
00000001402f984c  488d058dd6eb05         lea rax, [rip + 0x5ebd68d]
00000001402f9853  48898508060000         mov qword ptr [rbp + 0x608], rax
00000001402f985a  48c744242001000000     mov qword ptr [rsp + 0x20], 1
00000001402f9863  488d15bef2eb05         lea rdx, [rip + 0x5ebf2be]
00000001402f986a  488d4db0               lea rcx, [rbp - 0x50]
00000001402f986e  4c8d8df0050000         lea r9, [rbp + 0x5f0]
00000001402f9875  41b812000000           mov r8d, 0x12
00000001402f987b  e8c0b88505             call 0x145b55140
00000001402f9880  803e01                 cmp byte ptr [rsi], 1
00000001402f9883  7531                   jne 0x1402f98b6
00000001402f9885  8b4601                 mov eax, dword ptr [rsi + 1]
00000001402f9888  8b4e04                 mov ecx, dword ptr [rsi + 4]
00000001402f988b  898deb050000           mov dword ptr [rbp + 0x5eb], ecx
00000001402f9891  8985e8050000           mov dword ptr [rbp + 0x5e8], eax
00000001402f9897  488b4608               mov rax, qword ptr [rsi + 8]
00000001402f989b  0fb64e10               movzx ecx, byte ptr [rsi + 0x10]
00000001402f989f  b201                   mov dl, 1
00000001402f98a1  eb23                   jmp 0x1402f98c6
00000001402f98a3  31ff                   xor edi, edi
00000001402f98a5  4889f9                 mov rcx, rdi
00000001402f98a8  4c89fa                 mov rdx, r15
00000001402f98ab  e8bb14e505             call 0x14614ad6b
00000001402f98b0  90                     nop
00000001402f98b1  e9f3020000             jmp 0x1402f9ba9
00000001402f98b6  488b4608               mov rax, qword ptr [rsi + 8]
00000001402f98ba  f048ff00               lock inc qword ptr [rax]
00000001402f98be  0f8ee5020000           jle 0x1402f9ba9
00000001402f98c4  31d2                   xor edx, edx
00000001402f98c6  4c8b45c0               mov r8, qword ptr [rbp - 0x40]
00000001402f98ca  4c898578030000         mov qword ptr [rbp + 0x378], r8
00000001402f98d1  0f1045b0               movups xmm0, xmmword ptr [rbp - 0x50]
00000001402f98d5  0f118568030000         movups xmmword ptr [rbp + 0x368], xmm0
00000001402f98dc  0f100545ceeb05         movups xmm0, xmmword ptr [rip + 0x5ebce45]
00000001402f98e3  0f1185dc020000         movups xmmword ptr [rbp + 0x2dc], xmm0
00000001402f98ea  c785ec0200000000803f   mov dword ptr [rbp + 0x2ec], 0x3f800000
00000001402f98f4  48c7858003000000000000 mov qword ptr [rbp + 0x380], 0
00000001402f98ff  48c7858803000004000000 mov qword ptr [rbp + 0x388], 4
00000001402f990a  48c7859003000000000000 mov qword ptr [rbp + 0x390], 0
00000001402f9915  889598030000           mov byte ptr [rbp + 0x398], dl
00000001402f991b  8b95e8050000           mov edx, dword ptr [rbp + 0x5e8]
00000001402f9921  448b85eb050000         mov r8d, dword ptr [rbp + 0x5eb]
00000001402f9928  899599030000           mov dword ptr [rbp + 0x399], edx
00000001402f992e  4489859c030000         mov dword ptr [rbp + 0x39c], r8d
00000001402f9935  488985a0030000         mov qword ptr [rbp + 0x3a0], rax
00000001402f993c  48898da8030000         mov qword ptr [rbp + 0x3a8], rcx
00000001402f9943  c785b003000000004041   mov dword ptr [rbp + 0x3b0], 0x41400000
00000001402f994d  66c785b40300009001     mov word ptr [rbp + 0x3b4], 0x190
00000001402f9956  c685b603000001         mov byte ptr [rbp + 0x3b6], 1
00000001402f995d  488b85e8020000         mov rax, qword ptr [rbp + 0x2e8]
00000001402f9964  488985c4030000         mov qword ptr [rbp + 0x3c4], rax
00000001402f996b  0f1085db020000         movups xmm0, xmmword ptr [rbp + 0x2db]
00000001402f9972  0f1185b7030000         movups xmmword ptr [rbp + 0x3b7], xmm0
00000001402f9979  8b054155eb05           mov eax, dword ptr [rip + 0x5eb5541]
00000001402f997f  8985dc030000           mov dword ptr [rbp + 0x3dc], eax
00000001402f9985  0f11bdcc030000         movups xmmword ptr [rbp + 0x3cc], xmm7
00000001402f998c  f2440f1185e0030000     movsd qword ptr [rbp + 0x3e0], xmm8
00000001402f9995  4889bd60030000         mov qword ptr [rbp + 0x360], rdi
00000001402f999c  488d4db0               lea rcx, [rbp - 0x50]
00000001402f99a0  4c8d8560030000         lea r8, [rbp + 0x360]
00000001402f99a7  488d9518020000         lea rdx, [rbp + 0x218]
00000001402f99ae  e81dfdfaff             call 0x1402a96d0
00000001402f99b3  488b33                 mov rsi, qword ptr [rbx]
00000001402f99b6  488d0d7df1eb05         lea rcx, [rip + 0x5ebf17d]
00000001402f99bd  ba37000000             mov edx, 0x37
00000001402f99c2  e819b78505             call 0x145b550e0

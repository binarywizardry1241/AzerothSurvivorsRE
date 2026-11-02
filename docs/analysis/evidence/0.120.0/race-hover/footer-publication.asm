00000001402f99c7  4889d3                 mov rbx, rdx
00000001402f99ca  4885d2                 test rdx, rdx
00000001402f99cd  7910                   jns 0x1402f99df
00000001402f99cf  4531e4                 xor r12d, r12d
00000001402f99d2  4c89e1                 mov rcx, r12
00000001402f99d5  4889da                 mov rdx, rbx
00000001402f99d8  e88e13e505             call 0x14614ad6b
00000001402f99dd  0f0b                   ud2
00000001402f99df  7454                   je 0x1402f9a35
00000001402f99e1  4989c7                 mov r15, rax
00000001402f99e4  e81788d0ff             call 0x140002200
00000001402f99e9  41bc01000000           mov r12d, 1
00000001402f99ef  ba01000000             mov edx, 1
00000001402f99f4  4889d9                 mov rcx, rbx
00000001402f99f7  e8c487d0ff             call 0x1400021c0
00000001402f99fc  4885c0                 test rax, rax
00000001402f99ff  74d1                   je 0x1402f99d2
00000001402f9a01  4989c6                 mov r14, rax
00000001402f9a04  4889c1                 mov rcx, rax
00000001402f9a07  4c89fa                 mov rdx, r15
00000001402f9a0a  4989d8                 mov r8, rbx
00000001402f9a0d  e899a0ca05             call 0x145fa3aab
00000001402f9a12  803e01                 cmp byte ptr [rsi], 1
00000001402f9a15  7529                   jne 0x1402f9a40
00000001402f9a17  8b4601                 mov eax, dword ptr [rsi + 1]
00000001402f9a1a  8b4e04                 mov ecx, dword ptr [rsi + 4]
00000001402f9a1d  898de3050000           mov dword ptr [rbp + 0x5e3], ecx
00000001402f9a23  8985e0050000           mov dword ptr [rbp + 0x5e0], eax
00000001402f9a29  488b4608               mov rax, qword ptr [rsi + 8]
00000001402f9a2d  0fb64e10               movzx ecx, byte ptr [rsi + 0x10]
00000001402f9a31  b201                   mov dl, 1
00000001402f9a33  eb1b                   jmp 0x1402f9a50
00000001402f9a35  41be01000000           mov r14d, 1
00000001402f9a3b  803e01                 cmp byte ptr [rsi], 1
00000001402f9a3e  74d7                   je 0x1402f9a17
00000001402f9a40  488b4608               mov rax, qword ptr [rsi + 8]
00000001402f9a44  f048ff00               lock inc qword ptr [rax]
00000001402f9a48  0f8e5b010000           jle 0x1402f9ba9
00000001402f9a4e  31d2                   xor edx, edx
00000001402f9a50  0f1005b5cceb05         movups xmm0, xmmword ptr [rip + 0x5ebccb5]
00000001402f9a57  0f1185f1050000         movups xmmword ptr [rbp + 0x5f1], xmm0
00000001402f9a5e  c785010600000000803f   mov dword ptr [rbp + 0x601], 0x3f800000
00000001402f9a68  48899d68030000         mov qword ptr [rbp + 0x368], rbx
00000001402f9a6f  4c89b570030000         mov qword ptr [rbp + 0x370], r14
00000001402f9a76  48899d78030000         mov qword ptr [rbp + 0x378], rbx
00000001402f9a7d  48c7858003000000000000 mov qword ptr [rbp + 0x380], 0
00000001402f9a88  48c7858803000004000000 mov qword ptr [rbp + 0x388], 4
00000001402f9a93  48c7859003000000000000 mov qword ptr [rbp + 0x390], 0
00000001402f9a9e  889598030000           mov byte ptr [rbp + 0x398], dl
00000001402f9aa4  8b95e0050000           mov edx, dword ptr [rbp + 0x5e0]
00000001402f9aaa  448b85e3050000         mov r8d, dword ptr [rbp + 0x5e3]
00000001402f9ab1  899599030000           mov dword ptr [rbp + 0x399], edx
00000001402f9ab7  4489859c030000         mov dword ptr [rbp + 0x39c], r8d
00000001402f9abe  488985a0030000         mov qword ptr [rbp + 0x3a0], rax
00000001402f9ac5  48898da8030000         mov qword ptr [rbp + 0x3a8], rcx
00000001402f9acc  c785b003000000004041   mov dword ptr [rbp + 0x3b0], 0x41400000
00000001402f9ad6  66c785b40300009001     mov word ptr [rbp + 0x3b4], 0x190
00000001402f9adf  c685b603000001         mov byte ptr [rbp + 0x3b6], 1
00000001402f9ae6  0f1085f0050000         movups xmm0, xmmword ptr [rbp + 0x5f0]
00000001402f9aed  0f1185b7030000         movups xmmword ptr [rbp + 0x3b7], xmm0
00000001402f9af4  488b85fd050000         mov rax, qword ptr [rbp + 0x5fd]
00000001402f9afb  488985c4030000         mov qword ptr [rbp + 0x3c4], rax
00000001402f9b02  8b05b853eb05           mov eax, dword ptr [rip + 0x5eb53b8]
00000001402f9b08  8985dc030000           mov dword ptr [rbp + 0x3dc], eax
00000001402f9b0e  0f11bdcc030000         movups xmmword ptr [rbp + 0x3cc], xmm7
00000001402f9b15  f2440f1185e0030000     movsd qword ptr [rbp + 0x3e0], xmm8
00000001402f9b1e  4889bd60030000         mov qword ptr [rbp + 0x360], rdi
00000001402f9b25  488d4db0               lea rcx, [rbp - 0x50]
00000001402f9b29  4c8d8560030000         lea r8, [rbp + 0x360]
00000001402f9b30  488d9518020000         lea rdx, [rbp + 0x218]
00000001402f9b37  e894fbfaff             call 0x1402a96d0

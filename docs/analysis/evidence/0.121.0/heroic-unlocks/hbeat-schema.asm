0000000145aab4e6 488b8d68030000                 mov rcx, qword ptr [rbp + 0x368]
0000000145aab4ed 4883bd7003000003               cmp qword ptr [rbp + 0x370], 3
0000000145aab4f5 0f8585feffff                   jne 0x145aab380
0000000145aab4fb 4883790805                     cmp qword ptr [rcx + 8], 5
0000000145aab500 0f857afeffff                   jne 0x145aab380
0000000145aab506 488b01                         mov rax, qword ptr [rcx]
0000000145aab509 8b10                           mov edx, dword ptr [rax]
0000000145aab50b 31da                           xor edx, ebx
0000000145aab50d 0fb64004                       movzx eax, byte ptr [rax + 4]
0000000145aab511 83f074                         xor eax, 0x74
0000000145aab514 09d0                           or eax, edx
0000000145aab516 0f8564feffff                   jne 0x145aab380
0000000145aab51c 488b5118                       mov rdx, qword ptr [rcx + 0x18]
0000000145aab520 4885d2                         test rdx, rdx
0000000145aab523 0f8457feffff                   je 0x145aab380

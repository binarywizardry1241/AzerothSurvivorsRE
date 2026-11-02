0x145809ca0: add cl, 0xfe
0x145809ca3: cmp cl, 9
0x145809ca6: ja 0x145809cb7
0x145809ca8: movzx eax, cl
0x145809cab: lea rcx, [rip + 0x14c083e]
0x145809cb2: mov rax, qword ptr [rcx + rax*8]
0x145809cb6: ret
0x145809cb7: lea rax, [rip + 0x14b939a]
0x145809cbe: ret

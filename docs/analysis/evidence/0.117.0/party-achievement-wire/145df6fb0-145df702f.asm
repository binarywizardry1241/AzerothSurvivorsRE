145df6fb0 488b4108 mov rax, qword ptr [rcx + 8]
145df6fb4 4c8b4110 mov r8, qword ptr [rcx + 0x10]
145df6fb8 4d89c1 mov r9, r8
145df6fbb 4983c104 add r9, 4
145df6fbf 49c7c2ffffffff mov r10, 0xffffffffffffffff
145df6fc6 4d0f43d1 cmovae r10, r9
145df6fca 4939c2 cmp r10, rax
145df6fcd 760b jbe 0x145df6fda
145df6fcf c6411800 mov byte ptr [rcx + 0x18], 0
145df6fd3 48894110 mov qword ptr [rcx + 0x10], rax
145df6fd7 31c0 xor eax, eax
145df6fd9 c3 ret
145df6fda 4c8b19 mov r11, qword ptr [rcx]
145df6fdd 4d29c2 sub r10, r8
145df6fe0 4c894910 mov qword ptr [rcx + 0x10], r9
145df6fe4 4983fa04 cmp r10, 4
145df6fe8 7542 jne 0x145df702c
145df6fea 478b0403 mov r8d, dword ptr [r11 + r8]
145df6fee 4883fa01 cmp rdx, 1
145df6ff2 4883d200 adc rdx, 0
145df6ff6 4c29c8 sub rax, r9
145df6ff9 4989c2 mov r10, rax
145df6ffc 4989d1 mov r9, rdx
145df6fff 4909d2 or r10, rdx
145df7002 49c1ea20 shr r10, 0x20
145df7006 7411 je 0x145df7019
145df7008 31d2 xor edx, edx
145df700a 49f7f1 div r9
145df700d 4889c2 mov rdx, rax
145df7010 4c89c0 mov rax, r8
145df7013 4c39c2 cmp rdx, r8
145df7016 7210 jb 0x145df7028
145df7018 c3 ret
145df7019 31d2 xor edx, edx
145df701b 41f7f1 div r9d
145df701e 89c2 mov edx, eax
145df7020 4c89c0 mov rax, r8
145df7023 4c39c2 cmp rdx, r8
145df7026 73f0 jae 0x145df7018
145df7028 c6411800 mov byte ptr [rcx + 0x18], 0
145df702c 31c0 xor eax, eax
145df702e c3 ret

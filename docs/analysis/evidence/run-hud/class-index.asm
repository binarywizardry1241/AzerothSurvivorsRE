14588d790 80c1fe add cl, 0xfe
14588d793 80f909 cmp cl, 9
14588d796 770f ja 0x14588d7a7
14588d798 0fb6c1 movzx eax, cl
14588d79b 488d0ddea33501 lea rcx, [rip + 0x135a3de]
14588d7a2 488b04c1 mov rax, qword ptr [rcx + rax*8]
14588d7a6 c3 ret
14588d7a7 488d053a2f3501 lea rax, [rip + 0x1352f3a]
14588d7ae c3 ret

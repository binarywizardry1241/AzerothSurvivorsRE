145997ed0: fec9 dec cl
145997ed2: 80f90a cmp cl, 0xa
145997ed5: 770f ja 0x145997ee6
145997ed7: 0fb6c1 movzx eax, cl
145997eda: 488d0d87898801 lea rcx, [rip + 0x1888987]
145997ee1: 488b04c1 mov rax, qword ptr [rcx + rax*8]
145997ee5: c3 ret
145997ee6: 31c0 xor eax, eax
145997ee8: c3 ret

14599e380 488b4160 mov rax, qword ptr [rcx + 0x60]
14599e384 488b5168 mov rdx, qword ptr [rcx + 0x68]
14599e388 48c1e206 shl rdx, 6
14599e38c 4531c0 xor r8d, r8d
14599e38f 90 nop
14599e390 4c39c2 cmp rdx, r8
14599e393 741d je 0x14599e3b2
14599e395 42803c0023 cmp byte ptr [rax + r8], 0x23
14599e39a 4d8d4040 lea r8, [r8 + 0x40]
14599e39e 77f0 ja 0x14599e390
14599e3a0 80b99a00000001 cmp byte ptr [rcx + 0x9a], 1
14599e3a7 740c je 0x14599e3b5
14599e3a9 80b99b00000000 cmp byte ptr [rcx + 0x9b], 0
14599e3b0 7503 jne 0x14599e3b5
14599e3b2 31c0 xor eax, eax
14599e3b4 c3 ret
14599e3b5 0fb68198000000 movzx eax, byte ptr [rcx + 0x98]
14599e3bc a801 test al, 1
14599e3be 0f94c1 sete cl
14599e3c1 84c0 test al, al
14599e3c3 0f95c0 setne al
14599e3c6 20c8 and al, cl
14599e3c8 c3 ret

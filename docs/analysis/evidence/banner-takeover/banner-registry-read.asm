1402b220f 4c8d056b0ac705 lea r8, [rip + 0x5c70a6b]
1402b2216 488d4da8 lea rcx, [rbp - 0x58]
1402b221a 41b90a000000 mov r9d, 0xa
1402b2220 4889f2 mov rdx, rsi
1402b2223 e8f8e43100 call 0x1405d0720
1402b2228 488b45a8 mov rax, qword ptr [rbp - 0x58]
1402b222c 41b501 mov r13b, 1
1402b222f c685b800000001 mov byte ptr [rbp + 0xb8], 1
1402b2236 4883f8ff cmp rax, -1
1402b223a 744e je 0x1402b228a
1402b223c 488985c8000000 mov qword ptr [rbp + 0xc8], rax
1402b2243 488b4db0 mov rcx, qword ptr [rbp - 0x50]
1402b2247 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1402b224b 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
1402b2252 e849b8f3ff call 0x1401edaa0
1402b2257 90 nop
1402b2258 b101 mov cl, 1
1402b225a 4883fa01 cmp rdx, 1
1402b225e 7506 jne 0x1402b2266
1402b2260 803830 cmp byte ptr [rax], 0x30
1402b2263 0f95c1 setne cl
1402b2266 888db8000000 mov byte ptr [rbp + 0xb8], cl

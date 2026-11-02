0000000145bdcb8a 4989d7                         mov r15, rdx
0000000145bdcb8d 48898d080f0000                 mov qword ptr [rbp + 0xf08], rcx
0000000145bdcb94 4c898548100000                 mov qword ptr [rbp + 0x1048], r8
0000000145bdcb9b 4c8985a00f0000                 mov qword ptr [rbp + 0xfa0], r8
0000000145bdcba2 0fb682a5010000                 movzx eax, byte ptr [rdx + 0x1a5]
0000000145bdcba9 48898550100000                 mov qword ptr [rbp + 0x1050], rax
0000000145bdcbb0 8d78fe                         lea edi, [rax - 2]
0000000145bdcbb3 bb01000000                     mov ebx, 1
0000000145bdcbb8 4080ff07                       cmp dil, 7
0000000145bdcbbc 730e                           jae 0x145bdcbcc
0000000145bdcbbe 400fb6c7                       movzx eax, dil
0000000145bdcbc2 488d0daf5fab01                 lea rcx, [rip + 0x1ab5faf]
0000000145bdcbc9 8b1c81                         mov ebx, dword ptr [rcx + rax*4]
0000000145bdcbcc 418b870c010000                 mov eax, dword ptr [r15 + 0x10c]
0000000145bdcbd3 8985b00f0000                   mov dword ptr [rbp + 0xfb0], eax
0000000145bdcbd9 458ab7bf010000                 mov r14b, byte ptr [r15 + 0x1bf]
0000000145bdcbe0 31f6                           xor esi, esi
0000000145bdcbe2 4180fe03                       cmp r14b, 3
0000000145bdcbe6 0f938558100000                 setae byte ptr [rbp + 0x1058]
0000000145bdcbed 4d8ba720010000                 mov r12, qword ptr [r15 + 0x120]
0000000145bdcbf4 4d8baf28010000                 mov r13, qword ptr [r15 + 0x128]
0000000145bdcbfb 4c89e1                         mov rcx, r12
0000000145bdcbfe 4c89ea                         mov rdx, r13
0000000145bdcc01 e88af5ebff                     call 0x145a9c190
0000000145bdcc06 418b8f9c010000                 mov ecx, dword ptr [r15 + 0x19c]
0000000145bdcc0d 4c8d04c8                       lea r8, [rax + rcx*8]
0000000145bdcc11 4929c8                         sub r8, rcx
0000000145bdcc14 c6856410000001                 mov byte ptr [rbp + 0x1064], 1
0000000145bdcc1b 488d8de80e0000                 lea rcx, [rbp + 0xee8]
0000000145bdcc22 4488b561100000                 mov byte ptr [rbp + 0x1061], r14b
0000000145bdcc29 4489f2                         mov edx, r14d
0000000145bdcc2c 4c89bdb80f0000                 mov qword ptr [rbp + 0xfb8], r15
0000000145bdcc33 e83832eeff                     call 0x145abfe70

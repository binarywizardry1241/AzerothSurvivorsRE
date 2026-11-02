0000000145bb50f5 41837f1002                     cmp dword ptr [r15 + 0x10], 2
0000000145bb50fa 0f858d010000                   jne 0x145bb528d
0000000145bb5100 f20f1005a8396900               movsd xmm0, qword ptr [rip + 0x6939a8]
0000000145bb5108 f20f59c6                       mulsd xmm0, xmm6
0000000145bb510c f2480f2cc0                     cvttsd2si rax, xmm0
0000000145bb5111 4889c1                         mov rcx, rax
0000000145bb5114 48c1f93f                       sar rcx, 0x3f
0000000145bb5118 660f28c8                       movapd xmm1, xmm0
0000000145bb511c f20f5c0d34e06700               subsd xmm1, qword ptr [rip + 0x67e034]
0000000145bb5124 f24c0f2cc1                     cvttsd2si r8, xmm1
0000000145bb5129 4121c8                         and r8d, ecx
0000000145bb512c 4409c0                         or eax, r8d
0000000145bb512f 31c9                           xor ecx, ecx
0000000145bb5131 660f57c9                       xorpd xmm1, xmm1
0000000145bb5135 660f2ec1                       ucomisd xmm0, xmm1
0000000145bb5139 480f43c8                       cmovae rcx, rax
0000000145bb513d 660f2e051be06700               ucomisd xmm0, qword ptr [rip + 0x67e01b]
0000000145bb5145 48c7c7ffffffff                 mov rdi, 0xffffffffffffffff
0000000145bb514c 480f46f9                       cmovbe rdi, rcx
0000000145bb5150 4885d2                         test rdx, rdx
0000000145bb5153 0f8434010000                   je 0x145bb528d
0000000145bb5159 4d8bafd00d0000                 mov r13, qword ptr [r15 + 0xdd0]
0000000145bb5160 4c69e2e8040000                 imul r12, rdx, 0x4e8
0000000145bb5167 4d01ec                         add r12, r13
0000000145bb516a f2440f1005756b7e00             movsd xmm8, qword ptr [rip + 0x7e6b75]
0000000145bb5173 4c8db550060000                 lea r14, [rbp + 0x650]
0000000145bb517a eb27                           jmp 0x145bb51a3
0000000145bb517c 4c89f1                         mov rcx, r14
0000000145bb517f e84c54ffff                     call 0x145baa5d0
0000000145bb5184 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145bb5190 4989f5                         mov r13, rsi
0000000145bb5193 4c39e6                         cmp rsi, r12
0000000145bb5196 4c8bbd800d0000                 mov r15, qword ptr [rbp + 0xd80]
0000000145bb519d 0f84ea000000                   je 0x145bb528d
0000000145bb51a3 498db5e8040000                 lea rsi, [r13 + 0x4e8]
0000000145bb51aa 4180bde404000001               cmp byte ptr [r13 + 0x4e4], 1
0000000145bb51b2 75dc                           jne 0x145bb5190
0000000145bb51b4 41837d1001                     cmp dword ptr [r13 + 0x10], 1
0000000145bb51b9 74d5                           je 0x145bb5190
0000000145bb51bb 660f28c6                       movapd xmm0, xmm6
0000000145bb51bf f2410f5c85d8040000             subsd xmm0, qword ptr [r13 + 0x4d8]
0000000145bb51c8 66410f2ec0                     ucomisd xmm0, xmm8
0000000145bb51cd 72c1                           jb 0x145bb5190
0000000145bb51cf f2410f11b5d8040000             movsd qword ptr [r13 + 0x4d8], xmm6
0000000145bb51d8 498b8dc8040000                 mov rcx, qword ptr [r13 + 0x4c8]
0000000145bb51df 498b85d0040000                 mov rax, qword ptr [r13 + 0x4d0]
0000000145bb51e6 ff5058                         call qword ptr [rax + 0x58]
0000000145bb51e9 89bd58060000                   mov dword ptr [rbp + 0x658], edi
0000000145bb51ef 48b81600000000000080           movabs rax, 0x8000000000000016
0000000145bb51f9 48898550060000                 mov qword ptr [rbp + 0x650], rax
0000000145bb5200 498b8dc8040000                 mov rcx, qword ptr [r13 + 0x4c8]
0000000145bb5207 498b95d0040000                 mov rdx, qword ptr [r13 + 0x4d0]
0000000145bb520e 4d8d8578020000                 lea r8, [r13 + 0x278]
0000000145bb5215 e816cafdff                     call 0x145b91c30
0000000145bb521a 90                             nop 
0000000145bb521b 498b9dc8040000                 mov rbx, qword ptr [r13 + 0x4c8]
0000000145bb5222 4d8badd0040000                 mov r13, qword ptr [r13 + 0x4d0]
0000000145bb5229 488d8d00030000                 lea rcx, [rbp + 0x300]
0000000145bb5230 4c89f2                         mov rdx, r14
0000000145bb5233 e858f81500                     call 0x145d14a90
0000000145bb5238 90                             nop 
0000000145bb5239 488b9508030000                 mov rdx, qword ptr [rbp + 0x308]
0000000145bb5240 4c8b8510030000                 mov r8, qword ptr [rbp + 0x310]
0000000145bb5247 f04c0105f9bfaa02               lock add qword ptr [rip + 0x2aabff9], r8
0000000145bb524f f048ff0501c0aa02               lock inc qword ptr [rip + 0x2aac001]
0000000145bb5257 4889d9                         mov rcx, rbx
0000000145bb525a 488995700d0000                 mov qword ptr [rbp + 0xd70], rdx
0000000145bb5261 41ff5518                       call qword ptr [r13 + 0x18]
0000000145bb5265 90                             nop 
0000000145bb5266 488b9500030000                 mov rdx, qword ptr [rbp + 0x300]
0000000145bb526d 4885d2                         test rdx, rdx
0000000145bb5270 0f8406ffffff                   je 0x145bb517c
0000000145bb5276 41b801000000                   mov r8d, 1
0000000145bb527c 488b8d700d0000                 mov rcx, qword ptr [rbp + 0xd70]
0000000145bb5283 e848cf44fa                     call 0x1400021d0
0000000145bb5288 e9effeffff                     jmp 0x145bb517c

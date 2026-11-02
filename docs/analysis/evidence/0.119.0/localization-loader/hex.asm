0000000145b26f00  4157                   push r15
0000000145b26f02  4156                   push r14
0000000145b26f04  4154                   push r12
0000000145b26f06  56                     push rsi
0000000145b26f07  57                     push rdi
0000000145b26f08  55                     push rbp
0000000145b26f09  53                     push rbx
0000000145b26f0a  4883ec70               sub rsp, 0x70
0000000145b26f0e  4889ce                 mov rsi, rcx
0000000145b26f11  488b3a                 mov rdi, qword ptr [rdx]
0000000145b26f14  488b5a10               mov rbx, qword ptr [rdx + 0x10]
0000000145b26f18  4883fbfc               cmp rbx, -4
0000000145b26f1c  7209                   jb 0x145b26f27
0000000145b26f1e  4c8b7208               mov r14, qword ptr [rdx + 8]
0000000145b26f22  e97b010000             jmp 0x145b270a2
0000000145b26f27  4c8d7b04               lea r15, [rbx + 4]
0000000145b26f2b  4c8b7208               mov r14, qword ptr [rdx + 8]
0000000145b26f2f  4d39f7                 cmp r15, r14
0000000145b26f32  0f876a010000           ja 0x145b270a2
0000000145b26f38  4989d4                 mov r12, rdx
0000000145b26f3b  488d141f               lea rdx, [rdi + rbx]
0000000145b26f3f  488d4c2420             lea rcx, [rsp + 0x20]
0000000145b26f44  41b804000000           mov r8d, 4
0000000145b26f4a  e801884400             call 0x145f6f750
0000000145b26f4f  837c242001             cmp dword ptr [rsp + 0x20], 1
0000000145b26f54  0f8448010000           je 0x145b270a2
0000000145b26f5a  4c8b4c2430             mov r9, qword ptr [rsp + 0x30]
0000000145b26f5f  4d85c9                 test r9, r9
0000000145b26f62  0f843a010000           je 0x145b270a2
0000000145b26f68  488b442428             mov rax, qword ptr [rsp + 0x28]
0000000145b26f6d  4983f901               cmp r9, 1
0000000145b26f71  751d                   jne 0x145b26f90
0000000145b26f73  440fb600               movzx r8d, byte ptr [rax]
0000000145b26f77  4183f82b               cmp r8d, 0x2b
0000000145b26f7b  0f8421010000           je 0x145b270a2
0000000145b26f81  4c89e1                 mov rcx, r12
0000000145b26f84  4183f82d               cmp r8d, 0x2d
0000000145b26f88  0f8414010000           je 0x145b270a2
0000000145b26f8e  eb07                   jmp 0x145b26f97
0000000145b26f90  440fb600               movzx r8d, byte ptr [rax]
0000000145b26f94  4c89e1                 mov rcx, r12
0000000145b26f97  31d2                   xor edx, edx
0000000145b26f99  4180f82b               cmp r8b, 0x2b
0000000145b26f9d  0f94c2                 sete dl
0000000145b26fa0  4d89c8                 mov r8, r9
0000000145b26fa3  4929d0                 sub r8, rdx
0000000145b26fa6  4801d0                 add rax, rdx
0000000145b26fa9  4983f809               cmp r8, 9
0000000145b26fad  0f8381000000           jae 0x145b27034
0000000145b26fb3  4d85c0                 test r8, r8
0000000145b26fb6  0f84d7000000           je 0x145b27093
0000000145b26fbc  440fb608               movzx r9d, byte ptr [rax]
0000000145b26fc0  458d51bf               lea r10d, [r9 - 0x41]
0000000145b26fc4  4183e2df               and r10d, 0xffffffdf
0000000145b26fc8  4183c20a               add r10d, 0xa
0000000145b26fcc  418d51d0               lea edx, [r9 - 0x30]
0000000145b26fd0  4183f93a               cmp r9d, 0x3a
0000000145b26fd4  410f43d2               cmovae edx, r10d
0000000145b26fd8  83fa0f                 cmp edx, 0xf
0000000145b26fdb  0f87c1000000           ja 0x145b270a2
0000000145b26fe1  4983f801               cmp r8, 1
0000000145b26fe5  0f84aa000000           je 0x145b27095
0000000145b26feb  440fb65001             movzx r10d, byte ptr [rax + 1]
0000000145b26ff0  458d5abf               lea r11d, [r10 - 0x41]
0000000145b26ff4  4183e3df               and r11d, 0xffffffdf
0000000145b26ff8  4183c30a               add r11d, 0xa
0000000145b26ffc  458d4ad0               lea r9d, [r10 - 0x30]
0000000145b27000  4183fa3a               cmp r10d, 0x3a
0000000145b27004  450f43cb               cmovae r9d, r11d
0000000145b27008  4183f90f               cmp r9d, 0xf
0000000145b2700c  0f8790000000           ja 0x145b270a2
0000000145b27012  c1e204                 shl edx, 4
0000000145b27015  4109d1                 or r9d, edx
0000000145b27018  4983f802               cmp r8, 2
0000000145b2701c  0f8543010000           jne 0x145b27165
0000000145b27022  4489ca                 mov edx, r9d
0000000145b27025  48c1e220               shl rdx, 0x20
0000000145b27029  f6c201                 test dl, 1
0000000145b2702c  0f8417020000           je 0x145b27249
0000000145b27032  eb6e                   jmp 0x145b270a2
0000000145b27034  48f7da                 neg rdx
0000000145b27037  4901d1                 add r9, rdx
0000000145b2703a  49f7d9                 neg r9
0000000145b2703d  31d2                   xor edx, edx
0000000145b2703f  4531c0                 xor r8d, r8d
0000000145b27042  4d89ca                 mov r10, r9
0000000145b27045  4d01c2                 add r10, r8
0000000145b27048  744b                   je 0x145b27095
0000000145b2704a  81faffffff0f           cmp edx, 0xfffffff
0000000145b27050  0f87be010000           ja 0x145b27214
0000000145b27056  4189d2                 mov r10d, edx
0000000145b27059  41c1e204               shl r10d, 4
0000000145b2705d  460fb61c00             movzx r11d, byte ptr [rax + r8]
0000000145b27062  418d6bbf               lea ebp, [r11 - 0x41]
0000000145b27066  83e5df                 and ebp, 0xffffffdf
0000000145b27069  83c50a                 add ebp, 0xa
0000000145b2706c  418d53d0               lea edx, [r11 - 0x30]
0000000145b27070  4183fb3a               cmp r11d, 0x3a
0000000145b27074  0f43d5                 cmovae edx, ebp
0000000145b27077  83fa10                 cmp edx, 0x10
0000000145b2707a  410f93c3               setae r11b
0000000145b2707e  4401d2                 add edx, r10d
0000000145b27081  410f92c2               setb r10b
0000000145b27085  4508da                 or r10b, r11b
0000000145b27088  49ffc0                 inc r8
0000000145b2708b  41f6c201               test r10b, 1
0000000145b2708f  7511                   jne 0x145b270a2
0000000145b27091  ebaf                   jmp 0x145b27042
0000000145b27093  31d2                   xor edx, edx
0000000145b27095  48c1e220               shl rdx, 0x20
0000000145b27099  f6c201                 test dl, 1
0000000145b2709c  0f84a7010000           je 0x145b27249
0000000145b270a2  488d057b6e7b01         lea rax, [rip + 0x17b6e7b]
0000000145b270a9  4889442460             mov qword ptr [rsp + 0x60], rax
0000000145b270ae  48c74424680d000000     mov qword ptr [rsp + 0x68], 0xd
0000000145b270b7  4939de                 cmp r14, rbx
0000000145b270ba  490f42de               cmovb rbx, r14
0000000145b270be  4885db                 test rbx, rbx
0000000145b270c1  740f                   je 0x145b270d2
0000000145b270c3  4883fb04               cmp rbx, 4
0000000145b270c7  7310                   jae 0x145b270d9
0000000145b270c9  31c0                   xor eax, eax
0000000145b270cb  31c9                   xor ecx, ecx
0000000145b270cd  e946020000             jmp 0x145b27318
0000000145b270d2  31c9                   xor ecx, ecx
0000000145b270d4  e953020000             jmp 0x145b2732c
0000000145b270d9  4889d8                 mov rax, rbx
0000000145b270dc  4883e0fc               and rax, 0xfffffffffffffffc
0000000145b270e0  660fefc0               pxor xmm0, xmm0
0000000145b270e4  31c9                   xor ecx, ecx
0000000145b270e6  660f6f0dd2be8b00       movdqa xmm1, xmmword ptr [rip + 0x8bbed2]
0000000145b270ee  660f6f1d1acd6300       movdqa xmm3, xmmword ptr [rip + 0x63cd1a]
0000000145b270f6  660fefd2               pxor xmm2, xmm2
0000000145b270fa  660f1f440000           nop word ptr [rax + rax]
0000000145b27100  0fb7140f               movzx edx, word ptr [rdi + rcx]
0000000145b27104  660f6ee2               movd xmm4, edx
0000000145b27108  0fb7540f02             movzx edx, word ptr [rdi + rcx + 2]
0000000145b2710d  660f6eea               movd xmm5, edx
0000000145b27111  660f74e1               pcmpeqb xmm4, xmm1
0000000145b27115  660f60e4               punpcklbw xmm4, xmm4
0000000145b27119  f20f70e4d4             pshuflw xmm4, xmm4, 0xd4
0000000145b2711e  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b27123  660fdbe3               pand xmm4, xmm3
0000000145b27127  660fd4d4               paddq xmm2, xmm4
0000000145b2712b  660f74e9               pcmpeqb xmm5, xmm1
0000000145b2712f  660f60ed               punpcklbw xmm5, xmm5
0000000145b27133  f20f70e5d4             pshuflw xmm4, xmm5, 0xd4
0000000145b27138  660f70e4d4             pshufd xmm4, xmm4, 0xd4
0000000145b2713d  660fdbe3               pand xmm4, xmm3
0000000145b27141  660fd4c4               paddq xmm0, xmm4
0000000145b27145  4883c104               add rcx, 4
0000000145b27149  4839c8                 cmp rax, rcx
0000000145b2714c  75b2                   jne 0x145b27100
0000000145b2714e  660fd4c2               paddq xmm0, xmm2
0000000145b27152  660f70c8ee             pshufd xmm1, xmm0, 0xee
0000000145b27157  660fd4c8               paddq xmm1, xmm0
0000000145b2715b  66480f7ec9             movq rcx, xmm1
0000000145b27160  e9c2010000             jmp 0x145b27327
0000000145b27165  440fb65002             movzx r10d, byte ptr [rax + 2]
0000000145b2716a  458d5abf               lea r11d, [r10 - 0x41]
0000000145b2716e  4183e3df               and r11d, 0xffffffdf
0000000145b27172  4183c30a               add r11d, 0xa
0000000145b27176  418d52d0               lea edx, [r10 - 0x30]
0000000145b2717a  4183fa3a               cmp r10d, 0x3a
0000000145b2717e  410f43d3               cmovae edx, r11d
0000000145b27182  83fa0f                 cmp edx, 0xf
0000000145b27185  0f8717ffffff           ja 0x145b270a2
0000000145b2718b  41c1e104               shl r9d, 4
0000000145b2718f  4409ca                 or edx, r9d
0000000145b27192  4983f803               cmp r8, 3
0000000145b27196  0f84f9feffff           je 0x145b27095
0000000145b2719c  440fb65003             movzx r10d, byte ptr [rax + 3]
0000000145b271a1  458d5abf               lea r11d, [r10 - 0x41]
0000000145b271a5  4183e3df               and r11d, 0xffffffdf
0000000145b271a9  4183c30a               add r11d, 0xa
0000000145b271ad  458d4ad0               lea r9d, [r10 - 0x30]
0000000145b271b1  4183fa3a               cmp r10d, 0x3a
0000000145b271b5  450f43cb               cmovae r9d, r11d
0000000145b271b9  4183f90f               cmp r9d, 0xf
0000000145b271bd  0f87dffeffff           ja 0x145b270a2
0000000145b271c3  c1e204                 shl edx, 4
0000000145b271c6  4109d1                 or r9d, edx
0000000145b271c9  4983f804               cmp r8, 4
0000000145b271cd  0f844ffeffff           je 0x145b27022
0000000145b271d3  0fb64804               movzx ecx, byte ptr [rax + 4]
0000000145b271d7  448d51bf               lea r10d, [rcx - 0x41]
0000000145b271db  4183e2df               and r10d, 0xffffffdf
0000000145b271df  4183c20a               add r10d, 0xa
0000000145b271e3  8d51d0                 lea edx, [rcx - 0x30]
0000000145b271e6  83f93a                 cmp ecx, 0x3a
0000000145b271e9  410f43d2               cmovae edx, r10d
0000000145b271ed  83fa0f                 cmp edx, 0xf
0000000145b271f0  0f87acfeffff           ja 0x145b270a2
0000000145b271f6  41c1e104               shl r9d, 4
0000000145b271fa  4409ca                 or edx, r9d
0000000145b271fd  4983f805               cmp r8, 5
0000000145b27201  755d                   jne 0x145b27260
0000000145b27203  4c89e1                 mov rcx, r12
0000000145b27206  48c1e220               shl rdx, 0x20
0000000145b2720a  f6c201                 test dl, 1
0000000145b2720d  743a                   je 0x145b27249
0000000145b2720f  e98efeffff             jmp 0x145b270a2
0000000145b27214  420fb60400             movzx eax, byte ptr [rax + r8]
0000000145b27219  8d50bf                 lea edx, [rax - 0x41]
0000000145b2721c  83e2de                 and edx, 0xffffffde
0000000145b2721f  83c20a                 add edx, 0xa
0000000145b27222  448d40d0               lea r8d, [rax - 0x30]
0000000145b27226  83f83a                 cmp eax, 0x3a
0000000145b27229  440f43c2               cmovae r8d, edx
0000000145b2722d  31d2                   xor edx, edx
0000000145b2722f  4183f810               cmp r8d, 0x10
0000000145b27233  0f92c2                 setb dl
0000000145b27236  c1e208                 shl edx, 8
0000000145b27239  4881c201010000         add rdx, 0x101
0000000145b27240  f6c201                 test dl, 1
0000000145b27243  0f8559feffff           jne 0x145b270a2
0000000145b27249  48c1ea20               shr rdx, 0x20
0000000145b2724d  4c897910               mov qword ptr [rcx + 0x10], r15
0000000145b27251  895608                 mov dword ptr [rsi + 8], edx
0000000145b27254  48c706ffffffff         mov qword ptr [rsi], 0xffffffffffffffff
0000000145b2725b  e935010000             jmp 0x145b27395
0000000145b27260  440fb64805             movzx r9d, byte ptr [rax + 5]
0000000145b27265  458d51bf               lea r10d, [r9 - 0x41]
0000000145b27269  4183e2df               and r10d, 0xffffffdf
0000000145b2726d  4183c20a               add r10d, 0xa
0000000145b27271  418d49d0               lea ecx, [r9 - 0x30]
0000000145b27275  4183f93a               cmp r9d, 0x3a
0000000145b27279  410f43ca               cmovae ecx, r10d
0000000145b2727d  83f90f                 cmp ecx, 0xf
0000000145b27280  0f871cfeffff           ja 0x145b270a2
0000000145b27286  c1e204                 shl edx, 4
0000000145b27289  09d1                   or ecx, edx
0000000145b2728b  4983f806               cmp r8, 6
0000000145b2728f  7513                   jne 0x145b272a4
0000000145b27291  89ca                   mov edx, ecx
0000000145b27293  4c89e1                 mov rcx, r12
0000000145b27296  48c1e220               shl rdx, 0x20
0000000145b2729a  f6c201                 test dl, 1
0000000145b2729d  74aa                   je 0x145b27249
0000000145b2729f  e9fefdffff             jmp 0x145b270a2
0000000145b272a4  440fb64806             movzx r9d, byte ptr [rax + 6]
0000000145b272a9  458d51bf               lea r10d, [r9 - 0x41]
0000000145b272ad  4183e2df               and r10d, 0xffffffdf
0000000145b272b1  4183c20a               add r10d, 0xa
0000000145b272b5  418d51d0               lea edx, [r9 - 0x30]
0000000145b272b9  4183f93a               cmp r9d, 0x3a
0000000145b272bd  410f43d2               cmovae edx, r10d
0000000145b272c1  83fa0f                 cmp edx, 0xf
0000000145b272c4  0f87d8fdffff           ja 0x145b270a2
0000000145b272ca  c1e104                 shl ecx, 4
0000000145b272cd  09ca                   or edx, ecx
0000000145b272cf  4983f807               cmp r8, 7
0000000145b272d3  0f842affffff           je 0x145b27203
0000000145b272d9  0fb64807               movzx ecx, byte ptr [rax + 7]
0000000145b272dd  448d41bf               lea r8d, [rcx - 0x41]
0000000145b272e1  4183e0df               and r8d, 0xffffffdf
0000000145b272e5  4183c00a               add r8d, 0xa
0000000145b272e9  8d41d0                 lea eax, [rcx - 0x30]
0000000145b272ec  83f93a                 cmp ecx, 0x3a
0000000145b272ef  410f43c0               cmovae eax, r8d
0000000145b272f3  83f80f                 cmp eax, 0xf
0000000145b272f6  0f87a6fdffff           ja 0x145b270a2
0000000145b272fc  c1e204                 shl edx, 4
0000000145b272ff  09d0                   or eax, edx
0000000145b27301  89c2                   mov edx, eax
0000000145b27303  4c89e1                 mov rcx, r12
0000000145b27306  48c1e220               shl rdx, 0x20
0000000145b2730a  f6c201                 test dl, 1
0000000145b2730d  0f858ffdffff           jne 0x145b270a2
0000000145b27313  e931ffffff             jmp 0x145b27249
0000000145b27318  31d2                   xor edx, edx
0000000145b2731a  803c070a               cmp byte ptr [rdi + rax], 0xa
0000000145b2731e  0f94c2                 sete dl
0000000145b27321  4801d1                 add rcx, rdx
0000000145b27324  48ffc0                 inc rax
0000000145b27327  4839c3                 cmp rbx, rax
0000000145b2732a  75ec                   jne 0x145b27318
0000000145b2732c  48ffc1                 inc rcx
0000000145b2732f  48894c2440             mov qword ptr [rsp + 0x40], rcx
0000000145b27334  488d442440             lea rax, [rsp + 0x40]
0000000145b27339  4889442420             mov qword ptr [rsp + 0x20], rax
0000000145b2733e  488d058b254500         lea rax, [rip + 0x45258b]
0000000145b27345  4889442428             mov qword ptr [rsp + 0x28], rax
0000000145b2734a  488d442460             lea rax, [rsp + 0x60]
0000000145b2734f  4889442430             mov qword ptr [rsp + 0x30], rax
0000000145b27354  488d0565ad4dfa         lea rax, [rip - 0x5b2529b]
0000000145b2735b  4889442438             mov qword ptr [rsp + 0x38], rax
0000000145b27360  488d15ca6b7b01         lea rdx, [rip + 0x17b6bca]
0000000145b27367  488d4c2448             lea rcx, [rsp + 0x48]
0000000145b2736c  4c8d442420             lea r8, [rsp + 0x20]
0000000145b27371  e8bafb4300             call 0x145f66f30
0000000145b27376  488b442448             mov rax, qword ptr [rsp + 0x48]
0000000145b2737b  8b4c2450               mov ecx, dword ptr [rsp + 0x50]
0000000145b2737f  8b54245c               mov edx, dword ptr [rsp + 0x5c]
0000000145b27383  895614                 mov dword ptr [rsi + 0x14], edx
0000000145b27386  488b542454             mov rdx, qword ptr [rsp + 0x54]
0000000145b2738b  4889560c               mov qword ptr [rsi + 0xc], rdx
0000000145b2738f  488906                 mov qword ptr [rsi], rax
0000000145b27392  894e08                 mov dword ptr [rsi + 8], ecx
0000000145b27395  4883c470               add rsp, 0x70
0000000145b27399  5b                     pop rbx
0000000145b2739a  5d                     pop rbp
0000000145b2739b  5f                     pop rdi
0000000145b2739c  5e                     pop rsi
0000000145b2739d  415c                   pop r12
0000000145b2739f  415e                   pop r14
0000000145b273a1  415f                   pop r15
0000000145b273a3  c3                     ret

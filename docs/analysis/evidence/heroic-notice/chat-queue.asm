0000000145b134d0 55                             push rbp
0000000145b134d1 56                             push rsi
0000000145b134d2 57                             push rdi
0000000145b134d3 53                             push rbx
0000000145b134d4 4883ec58                       sub rsp, 0x58
0000000145b134d8 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145b134dd 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145b134e5 83791002                       cmp dword ptr [rcx + 0x10], 2
0000000145b134e9 7575                           jne 0x145b13560
0000000145b134eb 83b9480d000001                 cmp dword ptr [rcx + 0xd48], 1
0000000145b134f2 774a                           ja 0x145b1353e
0000000145b134f4 80b9c510000000                 cmp byte ptr [rcx + 0x10c5], 0
0000000145b134fb 7441                           je 0x145b1353e
0000000145b134fd 488b8108110000                 mov rax, qword ptr [rcx + 0x1108]
0000000145b13504 4885c0                         test rax, rax
0000000145b13507 7435                           je 0x145b1353e
0000000145b13509 488b8900110000                 mov rcx, qword ptr [rcx + 0x1100]
0000000145b13510 4c69c8b0000000                 imul r9, rax, 0xb0
0000000145b13517 4531c0                         xor r8d, r8d
0000000145b1351a 4531d2                         xor r10d, r10d
0000000145b1351d 0f1f00                         nop dword ptr [rax]
0000000145b13520 4280bc11a800000000             cmp byte ptr [rcx + r10 + 0xa8], 0
0000000145b13529 0f859e000000                   jne 0x145b135cd
0000000145b1352f 49ffc0                         inc r8
0000000145b13532 4981c2b0000000                 add r10, 0xb0
0000000145b13539 4d39d1                         cmp r9, r10
0000000145b1353c 75e2                           jne 0x145b13520
0000000145b1353e 488b02                         mov rax, qword ptr [rdx]
0000000145b13541 4885c0                         test rax, rax
0000000145b13544 747e                           je 0x145b135c4
0000000145b13546 488b4a08                       mov rcx, qword ptr [rdx + 8]
0000000145b1354a 41b801000000                   mov r8d, 1
0000000145b13550 4889c2                         mov rdx, rax
0000000145b13553 4883c458                       add rsp, 0x58
0000000145b13557 5b                             pop rbx
0000000145b13558 5f                             pop rdi
0000000145b13559 5e                             pop rsi
0000000145b1355a 5d                             pop rbp
0000000145b1355b e970ec4efa                     jmp 0x1400021d0
0000000145b13560 488bb190060000                 mov rsi, qword ptr [rcx + 0x690]
0000000145b13567 483bb180060000                 cmp rsi, qword ptr [rcx + 0x680]
0000000145b1356e 752a                           jne 0x145b1359a
0000000145b13570 488d8180060000                 lea rax, [rcx + 0x680]
0000000145b13577 4c8b02                         mov r8, qword ptr [rdx]
0000000145b1357a 4c8945f8                       mov qword ptr [rbp - 8], r8
0000000145b1357e 4c8b4208                       mov r8, qword ptr [rdx + 8]
0000000145b13582 4c8945f0                       mov qword ptr [rbp - 0x10], r8
0000000145b13586 4889cf                         mov rdi, rcx
0000000145b13589 4889c1                         mov rcx, rax
0000000145b1358c 4889d3                         mov rbx, rdx
0000000145b1358f e83c914d00                     call 0x145fec6d0
0000000145b13594 4889f9                         mov rcx, rdi
0000000145b13597 4889da                         mov rdx, rbx
0000000145b1359a 488b8188060000                 mov rax, qword ptr [rcx + 0x688]
0000000145b135a1 4989f0                         mov r8, rsi
0000000145b135a4 49c1e005                       shl r8, 5
0000000145b135a8 0f1002                         movups xmm0, xmmword ptr [rdx]
0000000145b135ab 0f104a10                       movups xmm1, xmmword ptr [rdx + 0x10]
0000000145b135af 420f114c0010                   movups xmmword ptr [rax + r8 + 0x10], xmm1
0000000145b135b5 420f110400                     movups xmmword ptr [rax + r8], xmm0
0000000145b135ba 48ffc6                         inc rsi
0000000145b135bd 4889b190060000                 mov qword ptr [rcx + 0x690], rsi
0000000145b135c4 4883c458                       add rsp, 0x58
0000000145b135c8 5b                             pop rbx
0000000145b135c9 5f                             pop rdi
0000000145b135ca 5e                             pop rsi
0000000145b135cb 5d                             pop rbp
0000000145b135cc c3                             ret
0000000145b135cd 0f1002                         movups xmm0, xmmword ptr [rdx]
0000000145b135d0 0f104a10                       movups xmm1, xmmword ptr [rdx + 0x10]
0000000145b135d4 0f294de0                       movaps xmmword ptr [rbp - 0x20], xmm1
0000000145b135d8 0f2945d0                       movaps xmmword ptr [rbp - 0x30], xmm0
0000000145b135dc 4c8d4dd0                       lea r9, [rbp - 0x30]
0000000145b135e0 4889c2                         mov rdx, rax
0000000145b135e3 e8b8fdffff                     call 0x145b133a0
0000000145b135e8 ebda                           jmp 0x145b135c4

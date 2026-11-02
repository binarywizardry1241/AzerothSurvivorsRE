0000000145bd6280 55                             push rbp
0000000145bd6281 4157                           push r15
0000000145bd6283 4156                           push r14
0000000145bd6285 4155                           push r13
0000000145bd6287 4154                           push r12
0000000145bd6289 56                             push rsi
0000000145bd628a 57                             push rdi
0000000145bd628b 53                             push rbx
0000000145bd628c 4881ec48070000                 sub rsp, 0x748
0000000145bd6293 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145bd629b 0f29b5b0060000                 movaps xmmword ptr [rbp + 0x6b0], xmm6
0000000145bd62a2 48c785a8060000feffffff         mov qword ptr [rbp + 0x6a8], 0xfffffffffffffffe
0000000145bd62ad 660f28f3                       movapd xmm6, xmm3
0000000145bd62b1 4d89c1                         mov r9, r8
0000000145bd62b4 4889ce                         mov rsi, rcx
0000000145bd62b7 48899568060000                 mov qword ptr [rbp + 0x668], rdx
0000000145bd62be 488b89980d0000                 mov rcx, qword ptr [rcx + 0xd98]
0000000145bd62c5 4883f903                       cmp rcx, 3
0000000145bd62c9 4c898598060000                 mov qword ptr [rbp + 0x698], r8
0000000145bd62d0 0f85d8010000                   jne 0x145bd64ae
0000000145bd62d6 488b86d80d0000                 mov rax, qword ptr [rsi + 0xdd8]
0000000145bd62dd 4839c2                         cmp rdx, rax
0000000145bd62e0 0f83730a0000                   jae 0x145bd6d59
0000000145bd62e6 4d8b21                         mov r12, qword ptr [r9]
0000000145bd62e9 49b80000000000000080           movabs r8, 0x8000000000000000
0000000145bd62f3 4d31e0                         xor r8, r12
0000000145bd62f6 4d85e4                         test r12, r12
0000000145bd62f9 b803000000                     mov eax, 3
0000000145bd62fe 490f48c0                       cmovs rax, r8
0000000145bd6302 4885c0                         test rax, rax
0000000145bd6305 0f84d5010000                   je 0x145bd64e0
0000000145bd630b 4883f813                       cmp rax, 0x13
0000000145bd630f 0f8488020000                   je 0x145bd659d
0000000145bd6315 488b9ed00d0000                 mov rbx, qword ptr [rsi + 0xdd0]
0000000145bd631c 4869cae8040000                 imul rcx, rdx, 0x4e8
0000000145bd6323 40b701                         mov dil, 1
0000000145bd6326 80bc0be404000000               cmp byte ptr [rbx + rcx + 0x4e4], 0
0000000145bd632e 0f849f0c0000                   je 0x145bd6fd3
0000000145bd6334 4883c0fd                       add rax, -3
0000000145bd6338 4883f814                       cmp rax, 0x14
0000000145bd633c 0f87910c0000                   ja 0x145bd6fd3
0000000145bd6342 4801cb                         add rbx, rcx
0000000145bd6345 488d0d50fa4a01                 lea rcx, [rip + 0x14afa50]
0000000145bd634c 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bd6350 4801c8                         add rax, rcx
0000000145bd6353 ffe0                           jmp rax
0000000145bd6355 488dbde0010000                 lea rdi, [rbp + 0x1e0]
0000000145bd635c 41b838020000                   mov r8d, 0x238
0000000145bd6362 4889f9                         mov rcx, rdi
0000000145bd6365 4c89ca                         mov rdx, r9
0000000145bd6368 e8aeb34800                     call 0x14606171b
0000000145bd636d c685a706000000                 mov byte ptr [rbp + 0x6a7], 0
0000000145bd6374 c685a606000001                 mov byte ptr [rbp + 0x6a6], 1
0000000145bd637b c685a506000001                 mov byte ptr [rbp + 0x6a5], 1
0000000145bd6382 c685a406000001                 mov byte ptr [rbp + 0x6a4], 1
0000000145bd6389 c685a306000001                 mov byte ptr [rbp + 0x6a3], 1
0000000145bd6390 488d8d18040000                 lea rcx, [rbp + 0x418]
0000000145bd6397 4889fa                         mov rdx, rdi
0000000145bd639a e8d1ebf7ff                     call 0x145b54f70
0000000145bd639f 90                             nop 
0000000145bd63a0 4883bd18040000ff               cmp qword ptr [rbp + 0x418], -1
0000000145bd63a8 0f8490070000                   je 0x145bd6b3e
0000000145bd63ae 488d4da8                       lea rcx, [rbp - 0x58]
0000000145bd63b2 488d9518040000                 lea rdx, [rbp + 0x418]
0000000145bd63b9 41b838020000                   mov r8d, 0x238
0000000145bd63bf e857b34800                     call 0x14606171b
0000000145bd63c4 488b9560010000                 mov rdx, qword ptr [rbp + 0x160]
0000000145bd63cb 488bbd68060000                 mov rdi, qword ptr [rbp + 0x668]
0000000145bd63d2 4889f1                         mov rcx, rsi
0000000145bd63d5 4989f8                         mov r8, rdi
0000000145bd63d8 e8f3c1ffff                     call 0x145bd25d0
0000000145bd63dd 89c3                           mov ebx, eax
0000000145bd63df 41b601                         mov r14b, 1
0000000145bd63e2 837e1002                       cmp dword ptr [rsi + 0x10], 2
0000000145bd63e6 7413                           je 0x145bd63fb
0000000145bd63e8 0fb6868e0d0000                 movzx eax, byte ptr [rsi + 0xd8e]
0000000145bd63ef 80bc30930d000000               cmp byte ptr [rax + rsi + 0xd93], 0
0000000145bd63f7 410f94c6                       sete r14b
0000000145bd63fb 488b8ec0140000                 mov rcx, qword ptr [rsi + 0x14c0]
0000000145bd6402 488b96c8140000                 mov rdx, qword ptr [rsi + 0x14c8]
0000000145bd6409 e8f2eef2ff                     call 0x145b05300
0000000145bd640e 83be980d000003                 cmp dword ptr [rsi + 0xd98], 3
0000000145bd6415 4c8bbd98060000                 mov r15, qword ptr [rbp + 0x698]
0000000145bd641c 0f85ed080000                   jne 0x145bd6d0f
0000000145bd6422 488b96d80d0000                 mov rdx, qword ptr [rsi + 0xdd8]
0000000145bd6429 4839d7                         cmp rdi, rdx
0000000145bd642c 0f8375090000                   jae 0x145bd6da7
0000000145bd6432 488b8ed00d0000                 mov rcx, qword ptr [rsi + 0xdd0]
0000000145bd6439 4c69c7e8040000                 imul r8, rdi, 0x4e8
0000000145bd6440 4a83bc0190020000ff             cmp qword ptr [rcx + r8 + 0x290], -1
0000000145bd6449 0f8443080000                   je 0x145bd6c92
0000000145bd644f 4839d7                         cmp rdi, rdx
0000000145bd6452 0f83ec080000                   jae 0x145bd6d44
0000000145bd6458 84db                           test bl, bl
0000000145bd645a 0f8524080000                   jne 0x145bd6c84
0000000145bd6460 4869c7e8040000                 imul rax, rdi, 0x4e8
0000000145bd6467 480386d00d0000                 add rax, qword ptr [rsi + 0xdd0]
0000000145bd646e 48833800                       cmp qword ptr [rax], 0
0000000145bd6472 0f94c1                         sete cl
0000000145bd6475 4184ce                         test r14b, cl
0000000145bd6478 0f8406080000                   je 0x145bd6c84
0000000145bd647e 488db090020000                 lea rsi, [rax + 0x290]
0000000145bd6485 4883b890020000ff               cmp qword ptr [rax + 0x290], -1
0000000145bd648d 7408                           je 0x145bd6497
0000000145bd648f 4889f1                         mov rcx, rsi
0000000145bd6492 e81953faff                     call 0x145b7b7b0
0000000145bd6497 488d55a8                       lea rdx, [rbp - 0x58]
0000000145bd649b 41b838020000                   mov r8d, 0x238
0000000145bd64a1 4889f1                         mov rcx, rsi
0000000145bd64a4 e872b24800                     call 0x14606171b
0000000145bd64a9 e9bc0b0000                     jmp 0x145bd706a
0000000145bd64ae 4d8b21                         mov r12, qword ptr [r9]
0000000145bd64b1 49b80000000000000080           movabs r8, 0x8000000000000000
0000000145bd64bb 4d31e0                         xor r8, r12
0000000145bd64be 4d85e4                         test r12, r12
0000000145bd64c1 b803000000                     mov eax, 3
0000000145bd64c6 490f48c0                       cmovs rax, r8
0000000145bd64ca 4883f813                       cmp rax, 0x13
0000000145bd64ce 0f84c9000000                   je 0x145bd659d
0000000145bd64d4 40b701                         mov dil, 1
0000000145bd64d7 4885c0                         test rax, rax
0000000145bd64da 0f85f30a0000                   jne 0x145bd6fd3

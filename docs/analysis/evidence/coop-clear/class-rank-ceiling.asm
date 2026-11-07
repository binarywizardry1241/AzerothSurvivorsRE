0000000145aca320 4156                           push r14
0000000145aca322 56                             push rsi
0000000145aca323 57                             push rdi
0000000145aca324 55                             push rbp
0000000145aca325 53                             push rbx
0000000145aca326 4c8b89e8000000                 mov r9, qword ptr [rcx + 0xe8]
0000000145aca32d 31c0                           xor eax, eax
0000000145aca32f 4d85c9                         test r9, r9
0000000145aca332 0f84bb000000                   je 0x145aca3f3
0000000145aca338 4c8b91e0000000                 mov r10, qword ptr [rcx + 0xe0]
0000000145aca33f 4531db                         xor r11d, r11d
0000000145aca342 4983f901                       cmp r9, 1
0000000145aca346 7445                           je 0x145aca38d
0000000145aca348 4c89c8                         mov rax, r9
0000000145aca34b 0f1f440000                     nop dword ptr [rax + rax]
0000000145aca350 4c89de                         mov rsi, r11
0000000145aca353 4889c7                         mov rdi, rax
0000000145aca356 48d1ef                         shr rdi, 1
0000000145aca359 4901fb                         add r11, rdi
0000000145aca35c 4c89db                         mov rbx, r11
0000000145aca35f 48c1e304                       shl rbx, 4
0000000145aca363 31ed                           xor ebp, ebp
0000000145aca365 4d39441a08                     cmp qword ptr [r10 + rbx + 8], r8
0000000145aca36a 400f97c5                       seta bpl
0000000145aca36e 4531f6                         xor r14d, r14d
0000000145aca371 4138141a                       cmp byte ptr [r10 + rbx], dl
0000000145aca375 410f97c6                       seta r14b
0000000145aca379 440f44f5                       cmove r14d, ebp
0000000145aca37d 4584f6                         test r14b, r14b
0000000145aca380 4c0f45de                       cmovne r11, rsi
0000000145aca384 4829f8                         sub rax, rdi
0000000145aca387 4883f801                       cmp rax, 1
0000000145aca38b 77c3                           ja 0x145aca350
0000000145aca38d 49c1e304                       shl r11, 4
0000000145aca391 31c0                           xor eax, eax
0000000145aca393 4338141a                       cmp byte ptr [r10 + r11], dl
0000000145aca397 755a                           jne 0x145aca3f3
0000000145aca399 4f39441a08                     cmp qword ptr [r10 + r11 + 8], r8
0000000145aca39e 7553                           jne 0x145aca3f3
0000000145aca3a0 49c1e104                       shl r9, 4
0000000145aca3a4 6666662e0f1f840000000000       nop word ptr cs:[rax + rax]
0000000145aca3b0 4d85c9                         test r9, r9
0000000145aca3b3 743c                           je 0x145aca3f1
0000000145aca3b5 4983c1f0                       add r9, -0x10
0000000145aca3b9 4d394208                       cmp qword ptr [r10 + 8], r8
0000000145aca3bd 4d8d5210                       lea r10, [r10 + 0x10]
0000000145aca3c1 75ed                           jne 0x145aca3b0
0000000145aca3c3 4c8b89d8010000                 mov r9, qword ptr [rcx + 0x1d8]
0000000145aca3ca b001                           mov al, 1
0000000145aca3cc 4d85c9                         test r9, r9
0000000145aca3cf 7422                           je 0x145aca3f3
0000000145aca3d1 488b89d0010000                 mov rcx, qword ptr [rcx + 0x1d0]
0000000145aca3d8 49c1e104                       shl r9, 4
0000000145aca3dc 31d2                           xor edx, edx
0000000145aca3de 6690                           nop
0000000145aca3e0 4c390411                       cmp qword ptr [rcx + rdx], r8
0000000145aca3e4 7414                           je 0x145aca3fa
0000000145aca3e6 4883c210                       add rdx, 0x10
0000000145aca3ea 4939d1                         cmp r9, rdx
0000000145aca3ed 75f1                           jne 0x145aca3e0
0000000145aca3ef eb02                           jmp 0x145aca3f3
0000000145aca3f1 31c0                           xor eax, eax
0000000145aca3f3 5b                             pop rbx
0000000145aca3f4 5d                             pop rbp
0000000145aca3f5 5f                             pop rdi
0000000145aca3f6 5e                             pop rsi
0000000145aca3f7 415e                           pop r14
0000000145aca3f9 c3                             ret
0000000145aca3fa 0fb6441109                     movzx eax, byte ptr [rcx + rdx + 9]
0000000145aca3ff 4d8d51f0                       lea r10, [r9 - 0x10]
0000000145aca403 4939d2                         cmp r10, rdx
0000000145aca406 0f849e000000                   je 0x145aca4aa
0000000145aca40c 4929d1                         sub r9, rdx
0000000145aca40f 4983c1f0                       add r9, -0x10
0000000145aca413 49c1e904                       shr r9, 4
0000000145aca417 4983f901                       cmp r9, 1
0000000145aca41b 7505                           jne 0x145aca422
0000000145aca41d 4531d2                         xor r10d, r10d
0000000145aca420 eb6b                           jmp 0x145aca48d
0000000145aca422 4c8d1c11                       lea r11, [rcx + rdx]
0000000145aca426 4983c329                       add r11, 0x29
0000000145aca42a 4c89ce                         mov rsi, r9
0000000145aca42d 4883e6fe                       and rsi, 0xfffffffffffffffe
0000000145aca431 4531d2                         xor r10d, r10d
0000000145aca434 eb17                           jmp 0x145aca44d
0000000145aca436 662e0f1f840000000000           nop word ptr cs:[rax + rax]
0000000145aca440 4983c202                       add r10, 2
0000000145aca444 4983c320                       add r11, 0x20
0000000145aca448 4c39d6                         cmp rsi, r10
0000000145aca44b 743a                           je 0x145aca487
0000000145aca44d 4d3943e7                       cmp qword ptr [r11 - 0x19], r8
0000000145aca451 740d                           je 0x145aca460
0000000145aca453 4d3943f7                       cmp qword ptr [r11 - 9], r8
0000000145aca457 75e7                           jne 0x145aca440
0000000145aca459 eb1b                           jmp 0x145aca476
0000000145aca45b 0f1f440000                     nop dword ptr [rax + rax]
0000000145aca460 0fb6c0                         movzx eax, al
0000000145aca463 410fb67bf0                     movzx edi, byte ptr [r11 - 0x10]
0000000145aca468 4038f8                         cmp al, dil
0000000145aca46b 0f47f8                         cmova edi, eax
0000000145aca46e 89f8                           mov eax, edi
0000000145aca470 4d3943f7                       cmp qword ptr [r11 - 9], r8
0000000145aca474 75ca                           jne 0x145aca440
0000000145aca476 0fb6c0                         movzx eax, al
0000000145aca479 410fb63b                       movzx edi, byte ptr [r11]
0000000145aca47d 4038f8                         cmp al, dil
0000000145aca480 0f47f8                         cmova edi, eax
0000000145aca483 89f8                           mov eax, edi
0000000145aca485 ebb9                           jmp 0x145aca440
0000000145aca487 41f6c101                       test r9b, 1
0000000145aca48b 741d                           je 0x145aca4aa
0000000145aca48d 49c1e204                       shl r10, 4
0000000145aca491 4c01d1                         add rcx, r10
0000000145aca494 4c39440a10                     cmp qword ptr [rdx + rcx + 0x10], r8
0000000145aca499 750f                           jne 0x145aca4aa
0000000145aca49b 0fb6c0                         movzx eax, al
0000000145aca49e 0fb64c0a19                     movzx ecx, byte ptr [rdx + rcx + 0x19]
0000000145aca4a3 38c8                           cmp al, cl
0000000145aca4a5 0f47c8                         cmova ecx, eax
0000000145aca4a8 89c8                           mov eax, ecx
0000000145aca4aa fec0                           inc al
0000000145aca4ac 0fb6c8                         movzx ecx, al
0000000145aca4af 80f905                         cmp cl, 5
0000000145aca4b2 b805000000                     mov eax, 5
0000000145aca4b7 0f42c1                         cmovb eax, ecx
0000000145aca4ba e934ffffff                     jmp 0x145aca3f3

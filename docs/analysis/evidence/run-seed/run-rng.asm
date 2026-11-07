0x14590c4d0: 4157                     push r15
0x14590c4d2: 4156                     push r14
0x14590c4d4: 56                       push rsi
0x14590c4d5: 57                       push rdi
0x14590c4d6: 55                       push rbp
0x14590c4d7: 53                       push rbx
0x14590c4d8: 4883ec48                 sub rsp, 0x48
0x14590c4dc: 4889ce                   mov rsi, rcx
0x14590c4df: 49bb2d7f954c2df45158     movabs r11, 0x5851f42d4c957f2d
0x14590c4e9: 490fafd3                 imul rdx, r11
0x14590c4ed: 48bff317be6fe45476a1     movabs rdi, 0xa17654e46fbe17f3
0x14590c4f7: 488d043a                 lea rax, [rdx + rdi]
0x14590c4fb: 4889c2                   mov rdx, rax
0x14590c4fe: 48c1ea2d                 shr rdx, 0x2d
0x14590c502: 4889c1                   mov rcx, rax
0x14590c505: 48c1e91b                 shr rcx, 0x1b
0x14590c509: 31ca                     xor edx, ecx
0x14590c50b: 4889c1                   mov rcx, rax
0x14590c50e: 48c1e93b                 shr rcx, 0x3b
0x14590c512: d3ca                     ror edx, cl
0x14590c514: 490fafc3                 imul rax, r11
0x14590c518: 4801f8                   add rax, rdi
0x14590c51b: 4989c0                   mov r8, rax
0x14590c51e: 49c1e82d                 shr r8, 0x2d
0x14590c522: 4889c1                   mov rcx, rax
0x14590c525: 48c1e91b                 shr rcx, 0x1b
0x14590c529: 4131c8                   xor r8d, ecx
0x14590c52c: 4889c1                   mov rcx, rax
0x14590c52f: 48c1e93b                 shr rcx, 0x3b
0x14590c533: 41d3c8                   ror r8d, cl
0x14590c536: 490fafc3                 imul rax, r11
0x14590c53a: 4801f8                   add rax, rdi
0x14590c53d: 4989c1                   mov r9, rax
0x14590c540: 49c1e92d                 shr r9, 0x2d
0x14590c544: 4889c1                   mov rcx, rax
0x14590c547: 48c1e91b                 shr rcx, 0x1b
0x14590c54b: 4131c9                   xor r9d, ecx
0x14590c54e: 4889c1                   mov rcx, rax
0x14590c551: 48c1e93b                 shr rcx, 0x3b
0x14590c555: 41d3c9                   ror r9d, cl
0x14590c558: 490fafc3                 imul rax, r11
0x14590c55c: 4801f8                   add rax, rdi
0x14590c55f: 4989c2                   mov r10, rax
0x14590c562: 49c1ea2d                 shr r10, 0x2d
0x14590c566: 4889c1                   mov rcx, rax
0x14590c569: 48c1e91b                 shr rcx, 0x1b
0x14590c56d: 4131ca                   xor r10d, ecx
0x14590c570: 4889c1                   mov rcx, rax
0x14590c573: 48c1e93b                 shr rcx, 0x3b
0x14590c577: 41d3ca                   ror r10d, cl
0x14590c57a: 490fafc3                 imul rax, r11
0x14590c57e: 4801f8                   add rax, rdi
0x14590c581: 4889c3                   mov rbx, rax
0x14590c584: 48c1eb2d                 shr rbx, 0x2d
0x14590c588: 4889c1                   mov rcx, rax
0x14590c58b: 48c1e91b                 shr rcx, 0x1b
0x14590c58f: 31cb                     xor ebx, ecx
0x14590c591: 4889c1                   mov rcx, rax
0x14590c594: 48c1e93b                 shr rcx, 0x3b
0x14590c598: d3cb                     ror ebx, cl
0x14590c59a: 490fafc3                 imul rax, r11
0x14590c59e: 4801f8                   add rax, rdi
0x14590c5a1: 4989c6                   mov r14, rax
0x14590c5a4: 49c1ee2d                 shr r14, 0x2d
0x14590c5a8: 4889c1                   mov rcx, rax
0x14590c5ab: 48c1e91b                 shr rcx, 0x1b
0x14590c5af: 4131ce                   xor r14d, ecx
0x14590c5b2: 4889c1                   mov rcx, rax
0x14590c5b5: 48c1e93b                 shr rcx, 0x3b
0x14590c5b9: 41d3ce                   ror r14d, cl
0x14590c5bc: 490fafc3                 imul rax, r11
0x14590c5c0: 4801f8                   add rax, rdi
0x14590c5c3: 4989c7                   mov r15, rax
0x14590c5c6: 49c1ef2d                 shr r15, 0x2d
0x14590c5ca: 4889c1                   mov rcx, rax
0x14590c5cd: 48c1e91b                 shr rcx, 0x1b
0x14590c5d1: 4131cf                   xor r15d, ecx
0x14590c5d4: 4889c1                   mov rcx, rax
0x14590c5d7: 48c1e93b                 shr rcx, 0x3b
0x14590c5db: 41d3cf                   ror r15d, cl
0x14590c5de: 490fafc3                 imul rax, r11
0x14590c5e2: 4801f8                   add rax, rdi
0x14590c5e5: 4989c3                   mov r11, rax
0x14590c5e8: 49c1eb2d                 shr r11, 0x2d
0x14590c5ec: 4889c1                   mov rcx, rax
0x14590c5ef: 48c1e91b                 shr rcx, 0x1b
0x14590c5f3: 4131cb                   xor r11d, ecx
0x14590c5f6: 48c1e83b                 shr rax, 0x3b
0x14590c5fa: 89c1                     mov ecx, eax
0x14590c5fc: 41d3cb                   ror r11d, cl
0x14590c5ff: 89d1                     mov ecx, edx
0x14590c601: c1e918                   shr ecx, 0x18
0x14590c604: 4489c0                   mov eax, r8d
0x14590c607: 4409c8                   or eax, r9d
0x14590c60a: 4409d0                   or eax, r10d
0x14590c60d: 09d8                     or eax, ebx
0x14590c60f: 4409f0                   or eax, r14d
0x14590c612: 4409f8                   or eax, r15d
0x14590c615: 89c7                     mov edi, eax
0x14590c617: 09d7                     or edi, edx
0x14590c619: 89fd                     mov ebp, edi
0x14590c61b: c1ed10                   shr ebp, 0x10
0x14590c61e: c1ef08                   shr edi, 8
0x14590c621: 09ef                     or edi, ebp
0x14590c623: 09d7                     or edi, edx
0x14590c625: 09c7                     or edi, eax
0x14590c627: 400fb6ff                 movzx edi, dil
0x14590c62b: 4489dd                   mov ebp, r11d
0x14590c62e: 81e5ffffff00             and ebp, 0xffffff
0x14590c634: 09cd                     or ebp, ecx
0x14590c636: 09fd                     or ebp, edi
0x14590c638: c1e818                   shr eax, 0x18
0x14590c63b: 09e8                     or eax, ebp
0x14590c63d: 7517                     jne 0x14590c656
0x14590c63f: 4181fb00000001           cmp r11d, 0x1000000
0x14590c646: 730e                     jae 0x14590c656
0x14590c648: 488d4c2428               lea rcx, [rsp + 0x28]
0x14590c64d: 31d2                     xor edx, edx
0x14590c64f: e86c311500               call 0x145a5f7c0
0x14590c654: eb26                     jmp 0x14590c67c
0x14590c656: 89542428                 mov dword ptr [rsp + 0x28], edx
0x14590c65a: 448944242c               mov dword ptr [rsp + 0x2c], r8d
0x14590c65f: 44894c2430               mov dword ptr [rsp + 0x30], r9d
0x14590c664: 4489542434               mov dword ptr [rsp + 0x34], r10d
0x14590c669: 895c2438                 mov dword ptr [rsp + 0x38], ebx
0x14590c66d: 448974243c               mov dword ptr [rsp + 0x3c], r14d
0x14590c672: 44897c2440               mov dword ptr [rsp + 0x40], r15d
0x14590c677: 44895c2444               mov dword ptr [rsp + 0x44], r11d
0x14590c67c: 8b442428                 mov eax, dword ptr [rsp + 0x28]
0x14590c680: 8b4c242c                 mov ecx, dword ptr [rsp + 0x2c]
0x14590c684: 8b542430                 mov edx, dword ptr [rsp + 0x30]
0x14590c688: 448b442434               mov r8d, dword ptr [rsp + 0x34]
0x14590c68d: 448b4c2438               mov r9d, dword ptr [rsp + 0x38]
0x14590c692: 44894e10                 mov dword ptr [rsi + 0x10], r9d
0x14590c696: 448b4c243c               mov r9d, dword ptr [rsp + 0x3c]
0x14590c69b: 44894e14                 mov dword ptr [rsi + 0x14], r9d
0x14590c69f: 448b4c2440               mov r9d, dword ptr [rsp + 0x40]
0x14590c6a4: 44894e18                 mov dword ptr [rsi + 0x18], r9d
0x14590c6a8: 448b4c2444               mov r9d, dword ptr [rsp + 0x44]
0x14590c6ad: 44894e1c                 mov dword ptr [rsi + 0x1c], r9d
0x14590c6b1: 8906                     mov dword ptr [rsi], eax
0x14590c6b3: 894e04                   mov dword ptr [rsi + 4], ecx
0x14590c6b6: 895608                   mov dword ptr [rsi + 8], edx
0x14590c6b9: 4489460c                 mov dword ptr [rsi + 0xc], r8d
0x14590c6bd: 4889f0                   mov rax, rsi
0x14590c6c0: 4883c448                 add rsp, 0x48
0x14590c6c4: 5b                       pop rbx
0x14590c6c5: 5d                       pop rbp
0x14590c6c6: 5f                       pop rdi
0x14590c6c7: 5e                       pop rsi
0x14590c6c8: 415e                     pop r14
0x14590c6ca: 415f                     pop r15
0x14590c6cc: c3                       ret

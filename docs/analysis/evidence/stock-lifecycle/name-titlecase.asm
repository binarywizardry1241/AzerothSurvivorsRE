0x1458a8fa0: 55                       push rbp
0x1458a8fa1: 4157                     push r15
0x1458a8fa3: 4156                     push r14
0x1458a8fa5: 4155                     push r13
0x1458a8fa7: 4154                     push r12
0x1458a8fa9: 56                       push rsi
0x1458a8faa: 57                       push rdi
0x1458a8fab: 53                       push rbx
0x1458a8fac: 4883ec48                 sub rsp, 0x48
0x1458a8fb0: 488d6c2440               lea rbp, [rsp + 0x40]
0x1458a8fb5: 48c74500feffffff         mov qword ptr [rbp], 0xfffffffffffffffe
0x1458a8fbd: 4c89c7                   mov rdi, r8
0x1458a8fc0: 4d85c0                   test r8, r8
0x1458a8fc3: 7910                     jns 0x1458a8fd5
0x1458a8fc5: 4531f6                   xor r14d, r14d
0x1458a8fc8: 4c89f1                   mov rcx, r14
0x1458a8fcb: 4889fa                   mov rdx, rdi
0x1458a8fce: e8e8024f00               call 0x145d992bb
0x1458a8fd3: 0f0b                     ud2
0x1458a8fd5: 4889ce                   mov rsi, rcx
0x1458a8fd8: 0f8471020000             je 0x1458a924f
0x1458a8fde: 4889d3                   mov rbx, rdx
0x1458a8fe1: e81a9275fa               call 0x140002200
0x1458a8fe6: 41be01000000             mov r14d, 1
0x1458a8fec: ba01000000               mov edx, 1
0x1458a8ff1: 4889f9                   mov rcx, rdi
0x1458a8ff4: e8c79175fa               call 0x1400021c0
0x1458a8ff9: 4885c0                   test rax, rax
0x1458a8ffc: 74ca                     je 0x1458a8fc8
0x1458a8ffe: 48897de8                 mov qword ptr [rbp - 0x18], rdi
0x1458a9002: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x1458a9006: 48c745f800000000         mov qword ptr [rbp - 8], 0
0x1458a900e: 4801df                   add rdi, rbx
0x1458a9011: 41b201                   mov r10b, 1
0x1458a9014: 4531f6                   xor r14d, r14d
0x1458a9017: 488d4de8                 lea rcx, [rbp - 0x18]
0x1458a901b: 41bc02000000             mov r12d, 2
0x1458a9021: eb35                     jmp 0x1458a9058
0x1458a9023: 80cac0                   or dl, 0xc0
0x1458a9026: 42881430                 mov byte ptr [rax + r14], dl
0x1458a902a: 46884c3001               mov byte ptr [rax + r14 + 1], r9b
0x1458a902f: ba02000000               mov edx, 2
0x1458a9034: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458a9040: 4901d6                   add r14, rdx
0x1458a9043: 4c8975f8                 mov qword ptr [rbp - 8], r14
0x1458a9047: 4183fd20                 cmp r13d, 0x20
0x1458a904b: 410f94c2                 sete r10b
0x1458a904f: 4839fb                   cmp rbx, rdi
0x1458a9052: 0f840f020000             je 0x1458a9267
0x1458a9058: 440fb603                 movzx r8d, byte ptr [rbx]
0x1458a905c: 450fb6e8                 movzx r13d, r8b
0x1458a9060: 4584ed                   test r13b, r13b
0x1458a9063: 781b                     js 0x1458a9080
0x1458a9065: 48ffc3                   inc rbx
0x1458a9068: 41f6c201                 test r10b, 1
0x1458a906c: 0f857e000000             jne 0x1458a90f0
0x1458a9072: e9a9000000               jmp 0x1458a9120
0x1458a9077: 660f1f840000000000       nop word ptr [rax + rax]
0x1458a9080: 4489ea                   mov edx, r13d
0x1458a9083: 83e21f                   and edx, 0x1f
0x1458a9086: 440fb64b01               movzx r9d, byte ptr [rbx + 1]
0x1458a908b: 4183e13f                 and r9d, 0x3f
0x1458a908f: 4180fddf                 cmp r13b, 0xdf
0x1458a9093: 763e                     jbe 0x1458a90d3
0x1458a9095: 440fb66b02               movzx r13d, byte ptr [rbx + 2]
0x1458a909a: 41c1e106                 shl r9d, 6
0x1458a909e: 4183e53f                 and r13d, 0x3f
0x1458a90a2: 4509cd                   or r13d, r9d
0x1458a90a5: 4180f8f0                 cmp r8b, 0xf0
0x1458a90a9: 725b                     jb 0x1458a9106
0x1458a90ab: 440fb64303               movzx r8d, byte ptr [rbx + 3]
0x1458a90b0: 4883c304                 add rbx, 4
0x1458a90b4: 83e207                   and edx, 7
0x1458a90b7: c1e212                   shl edx, 0x12
0x1458a90ba: 41c1e506                 shl r13d, 6
0x1458a90be: 4183e03f                 and r8d, 0x3f
0x1458a90c2: 4509e8                   or r8d, r13d
0x1458a90c5: 4109d0                   or r8d, edx
0x1458a90c8: 4589c5                   mov r13d, r8d
0x1458a90cb: 41f6c201                 test r10b, 1
0x1458a90cf: 751f                     jne 0x1458a90f0
0x1458a90d1: eb4d                     jmp 0x1458a9120
0x1458a90d3: 4883c302                 add rbx, 2
0x1458a90d7: c1e206                   shl edx, 6
0x1458a90da: 4409ca                   or edx, r9d
0x1458a90dd: 4189d5                   mov r13d, edx
0x1458a90e0: 41f6c201                 test r10b, 1
0x1458a90e4: 743a                     je 0x1458a9120
0x1458a90e6: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458a90f0: 418d559f                 lea edx, [r13 - 0x61]
0x1458a90f4: 4c8b4de8                 mov r9, qword ptr [rbp - 0x18]
0x1458a90f8: 4589ef                   mov r15d, r13d
0x1458a90fb: 83fa19                   cmp edx, 0x19
0x1458a90fe: 7736                     ja 0x1458a9136
0x1458a9100: 4183e75f                 and r15d, 0x5f
0x1458a9104: eb39                     jmp 0x1458a913f
0x1458a9106: 4883c303                 add rbx, 3
0x1458a910a: c1e20c                   shl edx, 0xc
0x1458a910d: 4109d5                   or r13d, edx
0x1458a9110: 41f6c201                 test r10b, 1
0x1458a9114: 75da                     jne 0x1458a90f0
0x1458a9116: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458a9120: 418d55bf                 lea edx, [r13 - 0x41]
0x1458a9124: 4589ef                   mov r15d, r13d
0x1458a9127: 4183cf20                 or r15d, 0x20
0x1458a912b: 83fa1a                   cmp edx, 0x1a
0x1458a912e: 450f43fd                 cmovae r15d, r13d
0x1458a9132: 4c8b4de8                 mov r9, qword ptr [rbp - 0x18]
0x1458a9136: 4181ff80000000           cmp r15d, 0x80
0x1458a913d: 7321                     jae 0x1458a9160
0x1458a913f: 4d39f1                   cmp r9, r14
0x1458a9142: 0f84bd000000             je 0x1458a9205
0x1458a9148: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x1458a914c: 46883c30                 mov byte ptr [rax + r14], r15b
0x1458a9150: ba01000000               mov edx, 1
0x1458a9155: e9e6feffff               jmp 0x1458a9040
0x1458a915a: 660f1f440000             nop word ptr [rax + rax]
0x1458a9160: 4181ff00000100           cmp r15d, 0x10000
0x1458a9167: 41b804000000             mov r8d, 4
0x1458a916d: 4983d800                 sbb r8, 0
0x1458a9171: 4181ff00080000           cmp r15d, 0x800
0x1458a9178: 4d0f42c4                 cmovb r8, r12
0x1458a917c: 4d29f1                   sub r9, r14
0x1458a917f: 4d39c8                   cmp r8, r9
0x1458a9182: 0f87a3000000             ja 0x1458a922b
0x1458a9188: 4589f9                   mov r9d, r15d
0x1458a918b: 4180e13f                 and r9b, 0x3f
0x1458a918f: 4180c980                 or r9b, 0x80
0x1458a9193: 4489fa                   mov edx, r15d
0x1458a9196: c1ea06                   shr edx, 6
0x1458a9199: 4181ff00080000           cmp r15d, 0x800
0x1458a91a0: 0f827dfeffff             jb 0x1458a9023
0x1458a91a6: 80e23f                   and dl, 0x3f
0x1458a91a9: 80ca80                   or dl, 0x80
0x1458a91ac: 4589f8                   mov r8d, r15d
0x1458a91af: 41c1e80c                 shr r8d, 0xc
0x1458a91b3: 4181ffffff0000           cmp r15d, 0xffff
0x1458a91ba: 771c                     ja 0x1458a91d8
0x1458a91bc: 4180c8e0                 or r8b, 0xe0
0x1458a91c0: 46880430                 mov byte ptr [rax + r14], r8b
0x1458a91c4: 4288543001               mov byte ptr [rax + r14 + 1], dl
0x1458a91c9: 46884c3002               mov byte ptr [rax + r14 + 2], r9b
0x1458a91ce: ba03000000               mov edx, 3
0x1458a91d3: e968feffff               jmp 0x1458a9040
0x1458a91d8: 4180e03f                 and r8b, 0x3f
0x1458a91dc: 4180c880                 or r8b, 0x80
0x1458a91e0: 41c1ef12                 shr r15d, 0x12
0x1458a91e4: 4180cff0                 or r15b, 0xf0
0x1458a91e8: 46883c30                 mov byte ptr [rax + r14], r15b
0x1458a91ec: 4688443001               mov byte ptr [rax + r14 + 1], r8b
0x1458a91f1: 4288543002               mov byte ptr [rax + r14 + 2], dl
0x1458a91f6: 46884c3003               mov byte ptr [rax + r14 + 3], r9b
0x1458a91fb: ba04000000               mov edx, 4
0x1458a9200: e93bfeffff               jmp 0x1458a9040
0x1458a9205: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x1458a920e: 41b801000000             mov r8d, 1
0x1458a9214: 41b901000000             mov r9d, 1
0x1458a921a: 4c89f2                   mov rdx, r14
0x1458a921d: e84e173500               call 0x145bfa970
0x1458a9222: 488d4de8                 lea rcx, [rbp - 0x18]
0x1458a9226: e91dffffff               jmp 0x1458a9148
0x1458a922b: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x1458a9234: 41b901000000             mov r9d, 1
0x1458a923a: 4c89f2                   mov rdx, r14
0x1458a923d: e82e173500               call 0x145bfa970
0x1458a9242: 488d4de8                 lea rcx, [rbp - 0x18]
0x1458a9246: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x1458a924a: e939ffffff               jmp 0x1458a9188
0x1458a924f: 48c745e800000000         mov qword ptr [rbp - 0x18], 0
0x1458a9257: 48c745f001000000         mov qword ptr [rbp - 0x10], 1
0x1458a925f: 48c745f800000000         mov qword ptr [rbp - 8], 0
0x1458a9267: 488b45f8                 mov rax, qword ptr [rbp - 8]
0x1458a926b: 48894610                 mov qword ptr [rsi + 0x10], rax
0x1458a926f: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0x1458a9273: 488906                   mov qword ptr [rsi], rax
0x1458a9276: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x1458a927a: 48894608                 mov qword ptr [rsi + 8], rax
0x1458a927e: 4889f0                   mov rax, rsi
0x1458a9281: 4883c448                 add rsp, 0x48
0x1458a9285: 5b                       pop rbx
0x1458a9286: 5f                       pop rdi
0x1458a9287: 5e                       pop rsi
0x1458a9288: 415c                     pop r12
0x1458a928a: 415d                     pop r13
0x1458a928c: 415e                     pop r14
0x1458a928e: 415f                     pop r15
0x1458a9290: 5d                       pop rbp
0x1458a9291: c3                       ret

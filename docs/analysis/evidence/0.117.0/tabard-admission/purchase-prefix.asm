; EXE 0.117.0 SHA-256 507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293
; Preferred VA [0x145c0e3e0, 0x145c0e64b); bytes SHA-256 f47a989dce5105e184f2fc078039d7f2de2da1105accb2266b2620eb37d220ab
; Current EXE bytes decoded with Capstone 5.0.7; no process execution.
0000000145c0e3e0: 4157                     push r15
0000000145c0e3e2: 4156                     push r14
0000000145c0e3e4: 4155                     push r13
0000000145c0e3e6: 4154                     push r12
0000000145c0e3e8: 56                       push rsi
0000000145c0e3e9: 57                       push rdi
0000000145c0e3ea: 55                       push rbp
0000000145c0e3eb: 53                       push rbx
0000000145c0e3ec: 4883ec48                 sub rsp, 0x48
0000000145c0e3f0: 80794100                 cmp byte ptr [rcx + 0x41], 0
0000000145c0e3f4: 7407                     je 0x145c0e3fd
0000000145c0e3f6: 31c0                     xor eax, eax
0000000145c0e3f8: e93d020000               jmp 0x145c0e63a
0000000145c0e3fd: 4c89c6                   mov rsi, r8
0000000145c0e400: 4889d7                   mov rdi, rdx
0000000145c0e403: 4889cb                   mov rbx, rcx
0000000145c0e406: 4c8d7110                 lea r14, [rcx + 0x10]
0000000145c0e40a: bd74616261               mov ebp, 0x61626174
0000000145c0e40f: 41bf6172647c             mov r15d, 0x7c647261
0000000145c0e415: 4889542428               mov qword ptr [rsp + 0x28], rdx
0000000145c0e41a: eb1a                     jmp 0x145c0e436
0000000145c0e41c: 488b7c2428               mov rdi, qword ptr [rsp + 0x28]
0000000145c0e421: 4c8d7310                 lea r14, [rbx + 0x10]
0000000145c0e425: bd74616261               mov ebp, 0x61626174
0000000145c0e42a: 41bf6172647c             mov r15d, 0x7c647261
0000000145c0e430: 807b4101                 cmp byte ptr [rbx + 0x41], 1
0000000145c0e434: 74c0                     je 0x145c0e3f6
0000000145c0e436: 4d8b26                   mov r12, qword ptr [r14]
0000000145c0e439: 488d4c2430               lea rcx, [rsp + 0x30]
0000000145c0e43e: 4c89f2                   mov rdx, r14
0000000145c0e441: e80a1d0100               call 0x145c20150
0000000145c0e446: 837c243001               cmp dword ptr [rsp + 0x30], 1
0000000145c0e44b: 7523                     jne 0x145c0e470
0000000145c0e44d: 488b442440               mov rax, qword ptr [rsp + 0x40]
0000000145c0e452: 488b0b                   mov rcx, qword ptr [rbx]
0000000145c0e455: 488903                   mov qword ptr [rbx], rax
0000000145c0e458: 4829c8                   sub rax, rcx
0000000145c0e45b: 4901cc                   add r12, rcx
0000000145c0e45e: 4885c0                   test rax, rax
0000000145c0e461: 7538                     jne 0x145c0e49b
0000000145c0e463: eb55                     jmp 0x145c0e4ba
0000000145c0e465: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c0e470: 807b4100                 cmp byte ptr [rbx + 0x41], 0
0000000145c0e474: 7580                     jne 0x145c0e3f6
0000000145c0e476: c6434101                 mov byte ptr [rbx + 0x41], 1
0000000145c0e47a: 4c8b23                   mov r12, qword ptr [rbx]
0000000145c0e47d: 488b4308                 mov rax, qword ptr [rbx + 8]
0000000145c0e481: 4c29e0                   sub rax, r12
0000000145c0e484: 0f95c1                   setne cl
0000000145c0e487: 0a4b40                   or cl, byte ptr [rbx + 0x40]
0000000145c0e48a: 80f901                   cmp cl, 1
0000000145c0e48d: 0f8563ffffff             jne 0x145c0e3f6
0000000145c0e493: 4d0326                   add r12, qword ptr [r14]
0000000145c0e496: 4885c0                   test rax, rax
0000000145c0e499: 741f                     je 0x145c0e4ba
0000000145c0e49b: 41807c04ff0a             cmp byte ptr [r12 + rax - 1], 0xa
0000000145c0e4a1: 4889c2                   mov rdx, rax
0000000145c0e4a4: 7517                     jne 0x145c0e4bd
0000000145c0e4a6: 4889c2                   mov rdx, rax
0000000145c0e4a9: 48ffca                   dec rdx
0000000145c0e4ac: 740f                     je 0x145c0e4bd
0000000145c0e4ae: 41807c04fe0d             cmp byte ptr [r12 + rax - 2], 0xd
0000000145c0e4b4: 7507                     jne 0x145c0e4bd
0000000145c0e4b6: 4883c0fe                 add rax, -2
0000000145c0e4ba: 4889c2                   mov rdx, rax
0000000145c0e4bd: 4c89e1                   mov rcx, r12
0000000145c0e4c0: e8cbdd51fa               call 0x14012c290
0000000145c0e4c5: 4883fa07                 cmp rdx, 7
0000000145c0e4c9: 0f8261ffffff             jb 0x145c0e430
0000000145c0e4cf: 4989c4                   mov r12, rax
0000000145c0e4d2: 8b00                     mov eax, dword ptr [rax]
0000000145c0e4d4: 31e8                     xor eax, ebp
0000000145c0e4d6: 418b4c2403               mov ecx, dword ptr [r12 + 3]
0000000145c0e4db: 4431f9                   xor ecx, r15d
0000000145c0e4de: 09c1                     or ecx, eax
0000000145c0e4e0: 0f854affffff             jne 0x145c0e430
0000000145c0e4e6: 4989d5                   mov r13, rdx
0000000145c0e4e9: 4983c407                 add r12, 7
0000000145c0e4ed: 4983c5f9                 add r13, -7
0000000145c0e4f1: 48c70600000000           mov qword ptr [rsi], 0
0000000145c0e4f8: 4c896e08                 mov qword ptr [rsi + 8], r13
0000000145c0e4fc: 4c896610                 mov qword ptr [rsi + 0x10], r12
0000000145c0e500: 4c896e18                 mov qword ptr [rsi + 0x18], r13
0000000145c0e504: 48c7462000000000         mov qword ptr [rsi + 0x20], 0
0000000145c0e50c: 4c896e28                 mov qword ptr [rsi + 0x28], r13
0000000145c0e510: 48b82c0000002c000000     movabs rax, 0x2c0000002c
0000000145c0e51a: 48894630                 mov qword ptr [rsi + 0x30], rax
0000000145c0e51e: c6463801                 mov byte ptr [rsi + 0x38], 1
0000000145c0e522: 66c746400100             mov word ptr [rsi + 0x40], 1
0000000145c0e528: 48897c2430               mov qword ptr [rsp + 0x30], rdi
0000000145c0e52d: 31ed                     xor ebp, ebp
0000000145c0e52f: 4531f6                   xor r14d, r14d
0000000145c0e532: 4531ff                   xor r15d, r15d
0000000145c0e535: 66662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c0e540: 41f6c701                 test r15b, 1
0000000145c0e544: 0f85d2feffff             jne 0x145c0e41c
0000000145c0e54a: 4d39f5                   cmp r13, r14
0000000145c0e54d: 731d                     jae 0x145c0e56c
0000000145c0e54f: 4c89f7                   mov rdi, r14
0000000145c0e552: e9ad000000               jmp 0x145c0e604
0000000145c0e557: 660f1f840000000000       nop word ptr [rax + rax]
0000000145c0e560: 4989fe                   mov r14, rdi
0000000145c0e563: 4c39ef                   cmp rdi, r13
0000000145c0e566: 0f8798000000             ja 0x145c0e604
0000000145c0e56c: 4d89e8                   mov r8, r13
0000000145c0e56f: 4d29f0                   sub r8, r14
0000000145c0e572: 4b8d0434                 lea rax, [r12 + r14]
0000000145c0e576: 4983f810                 cmp r8, 0x10
0000000145c0e57a: 7334                     jae 0x145c0e5b0
0000000145c0e57c: 31d2                     xor edx, edx
0000000145c0e57e: 4d85c0                   test r8, r8
0000000145c0e581: 741e                     je 0x145c0e5a1
0000000145c0e583: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c0e590: 803c102c                 cmp byte ptr [rax + rdx], 0x2c
0000000145c0e594: 742c                     je 0x145c0e5c2
0000000145c0e596: 48ffc2                   inc rdx
0000000145c0e599: 4939d0                   cmp r8, rdx
0000000145c0e59c: 75f2                     jne 0x145c0e590
0000000145c0e59e: 4c89c2                   mov rdx, r8
0000000145c0e5a1: 31c0                     xor eax, eax
0000000145c0e5a3: 4883f801                 cmp rax, 1
0000000145c0e5a7: 7427                     je 0x145c0e5d0
0000000145c0e5a9: eb52                     jmp 0x145c0e5fd
0000000145c0e5ab: 0f1f440000               nop dword ptr [rax + rax]
0000000145c0e5b0: b12c                     mov cl, 0x2c
0000000145c0e5b2: 4889c2                   mov rdx, rax
0000000145c0e5b5: e8a60e3600               call 0x145f6f460
0000000145c0e5ba: 4883f801                 cmp rax, 1
0000000145c0e5be: 7410                     je 0x145c0e5d0
0000000145c0e5c0: eb3b                     jmp 0x145c0e5fd
0000000145c0e5c2: b801000000               mov eax, 1
0000000145c0e5c7: 4883f801                 cmp rax, 1
0000000145c0e5cb: 7530                     jne 0x145c0e5fd
0000000145c0e5cd: 0f1f00                   nop dword ptr [rax]
0000000145c0e5d0: 4a8d3c32                 lea rdi, [rdx + r14]
0000000145c0e5d4: 48ffc7                   inc rdi
0000000145c0e5d7: 48897e20                 mov qword ptr [rsi + 0x20], rdi
0000000145c0e5db: 4c01f2                   add rdx, r14
0000000145c0e5de: 4c39ea                   cmp rdx, r13
0000000145c0e5e1: 0f8379ffffff             jae 0x145c0e560
0000000145c0e5e7: 41803c142c               cmp byte ptr [r12 + rdx], 0x2c
0000000145c0e5ec: 0f856effffff             jne 0x145c0e560
0000000145c0e5f2: 48893e                   mov qword ptr [rsi], rdi
0000000145c0e5f5: 4531ff                   xor r15d, r15d
0000000145c0e5f8: 4989fe                   mov r14, rdi
0000000145c0e5fb: eb17                     jmp 0x145c0e614
0000000145c0e5fd: 4c896e20                 mov qword ptr [rsi + 0x20], r13
0000000145c0e601: 4c89ef                   mov rdi, r13
0000000145c0e604: 4989fe                   mov r14, rdi
0000000145c0e607: c6464101                 mov byte ptr [rsi + 0x41], 1
0000000145c0e60b: 41b701                   mov r15b, 1
0000000145c0e60e: 4889ef                   mov rdi, rbp
0000000145c0e611: 4c89ea                   mov rdx, r13
0000000145c0e614: 4829ea                   sub rdx, rbp
0000000145c0e617: 4c01e5                   add rbp, r12
0000000145c0e61a: 488d4c2430               lea rcx, [rsp + 0x30]
0000000145c0e61f: 4989d0                   mov r8, rdx
0000000145c0e622: 4889ea                   mov rdx, rbp
0000000145c0e625: e8a6d5f1ff               call 0x145b2bbd0
0000000145c0e62a: 4889fd                   mov rbp, rdi
0000000145c0e62d: a801                     test al, 1
0000000145c0e62f: 0f840bffffff             je 0x145c0e540
0000000145c0e635: b801000000               mov eax, 1
0000000145c0e63a: 4883c448                 add rsp, 0x48
0000000145c0e63e: 5b                       pop rbx
0000000145c0e63f: 5d                       pop rbp
0000000145c0e640: 5f                       pop rdi
0000000145c0e641: 5e                       pop rsi
0000000145c0e642: 415c                     pop r12
0000000145c0e644: 415d                     pop r13
0000000145c0e646: 415e                     pop r14
0000000145c0e648: 415f                     pop r15
0000000145c0e64a: c3                       ret

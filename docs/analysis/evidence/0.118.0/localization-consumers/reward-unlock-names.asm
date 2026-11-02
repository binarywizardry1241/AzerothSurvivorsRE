0000000145c3e370  55                     push rbp
0000000145c3e371  4157                   push r15
0000000145c3e373  4156                   push r14
0000000145c3e375  4155                   push r13
0000000145c3e377  4154                   push r12
0000000145c3e379  56                     push rsi
0000000145c3e37a  57                     push rdi
0000000145c3e37b  53                     push rbx
0000000145c3e37c  4883ec68               sub rsp, 0x68
0000000145c3e380  488d6c2460             lea rbp, [rsp + 0x60]
0000000145c3e385  48c74500feffffff       mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c3e38d  4889d7                 mov rdi, rdx
0000000145c3e390  4889ce                 mov rsi, rcx
0000000145c3e393  488b02                 mov rax, qword ptr [rdx]
0000000145c3e396  4883f8ff               cmp rax, -1
0000000145c3e39a  0f84ec030000           je 0x145c3e78c
0000000145c3e3a0  4885c0                 test rax, rax
0000000145c3e3a3  0f84bd010000           je 0x145c3e566
0000000145c3e3a9  83f802                 cmp eax, 2
0000000145c3e3ac  0f84a3020000           je 0x145c3e655
0000000145c3e3b2  488b4708               mov rax, qword ptr [rdi + 8]
0000000145c3e3b6  4885c0                 test rax, rax
0000000145c3e3b9  0f84fa000000           je 0x145c3e4b9
0000000145c3e3bf  4c8b7f10               mov r15, qword ptr [rdi + 0x10]
0000000145c3e3c3  4c39f8                 cmp rax, r15
0000000145c3e3c6  0f84e5000000           je 0x145c3e4b1
0000000145c3e3cc  4c8b6f18               mov r13, qword ptr [rdi + 0x18]
0000000145c3e3d0  498b5d08               mov rbx, qword ptr [r13 + 8]
0000000145c3e3d4  4883c078               add rax, 0x78
0000000145c3e3d8  eb14                   jmp 0x145c3e3ee
0000000145c3e3da  660f1f440000           nop word ptr [rax + rax]
0000000145c3e3e0  498d442478             lea rax, [r12 + 0x78]
0000000145c3e3e5  4d39fc                 cmp r12, r15
0000000145c3e3e8  0f84bb000000           je 0x145c3e4a9
0000000145c3e3ee  4989c4                 mov r12, rax
0000000145c3e3f1  483958e0               cmp qword ptr [rax - 0x20], rbx
0000000145c3e3f5  75e9                   jne 0x145c3e3e0
0000000145c3e3f7  4d8b7500               mov r14, qword ptr [r13]
0000000145c3e3fb  498b4c24d8             mov rcx, qword ptr [r12 - 0x28]
0000000145c3e400  4c89f2                 mov rdx, r14
0000000145c3e403  4989d8                 mov r8, rbx
0000000145c3e406  e85c593500             call 0x145f93d67
0000000145c3e40b  85c0                   test eax, eax
0000000145c3e40d  75d1                   jne 0x145c3e3e0
0000000145c3e40f  498b4c24e8             mov rcx, qword ptr [r12 - 0x18]
0000000145c3e414  4885c9                 test rcx, rcx
0000000145c3e417  7428                   je 0x145c3e441
0000000145c3e419  498b5424f0             mov rdx, qword ptr [r12 - 0x10]
0000000145c3e41e  e8bd69f0ff             call 0x145b44de0
0000000145c3e423  4885c0                 test rax, rax
0000000145c3e426  7419                   je 0x145c3e441
0000000145c3e428  48395858               cmp qword ptr [rax + 0x58], rbx
0000000145c3e42c  7513                   jne 0x145c3e441
0000000145c3e42e  488b4850               mov rcx, qword ptr [rax + 0x50]
0000000145c3e432  4c89f2                 mov rdx, r14
0000000145c3e435  4989d8                 mov r8, rbx
0000000145c3e438  e82a593500             call 0x145f93d67
0000000145c3e43d  85c0                   test eax, eax
0000000145c3e43f  749f                   je 0x145c3e3e0
0000000145c3e441  4c896708               mov qword ptr [rdi + 8], r12
0000000145c3e445  4c8d3d38ae9a01         lea r15, [rip + 0x19aae38]
0000000145c3e44c  ba07000000             mov edx, 7
0000000145c3e451  4c89f9                 mov rcx, r15
0000000145c3e454  e8a7b5eeff             call 0x145b29a00
0000000145c3e459  4889c7                 mov rdi, rax
0000000145c3e45c  4889d3                 mov rbx, rdx
0000000145c3e45f  498b4c2498             mov rcx, qword ptr [r12 - 0x68]
0000000145c3e464  48894df0               mov qword ptr [rbp - 0x10], rcx
0000000145c3e468  4d8b6c24a0             mov r13, qword ptr [r12 - 0x60]
0000000145c3e46d  4c89ea                 mov rdx, r13
0000000145c3e470  e88bb5eeff             call 0x145b29a00
0000000145c3e475  4989c6                 mov r14, rax
0000000145c3e478  4889d8                 mov rax, rbx
0000000145c3e47b  4885ff                 test rdi, rdi
0000000145c3e47e  490f44ff               cmove rdi, r15
0000000145c3e482  b907000000             mov ecx, 7
0000000145c3e487  480f44c1               cmove rax, rcx
0000000145c3e48b  4989d7                 mov r15, rdx
0000000145c3e48e  4d85f6                 test r14, r14
0000000145c3e491  498b5c24a8             mov rbx, qword ptr [r12 - 0x58]
0000000145c3e496  4d8b6424b0             mov r12, qword ptr [r12 - 0x50]
0000000145c3e49b  4d0f44fd               cmove r15, r13
0000000145c3e49f  4c0f4475f0             cmove r14, qword ptr [rbp - 0x10]
0000000145c3e4a4  e9b9020000             jmp 0x145c3e762
0000000145c3e4a9  4883c088               add rax, -0x78
0000000145c3e4ad  48894708               mov qword ptr [rdi + 8], rax
0000000145c3e4b1  48c7470800000000       mov qword ptr [rdi + 8], 0
0000000145c3e4b9  4c8b7720               mov r14, qword ptr [rdi + 0x20]
0000000145c3e4bd  4d85f6                 test r14, r14
0000000145c3e4c0  0f8499000000           je 0x145c3e55f
0000000145c3e4c6  4c8b7f28               mov r15, qword ptr [rdi + 0x28]
0000000145c3e4ca  4c8b6730               mov r12, qword ptr [rdi + 0x30]
0000000145c3e4ce  4d39e7                 cmp r15, r12
0000000145c3e4d1  0f8488000000           je 0x145c3e55f
0000000145c3e4d7  498b5e08               mov rbx, qword ptr [r14 + 8]
0000000145c3e4db  4b8d047f               lea rax, [r15 + r15*2]
0000000145c3e4df  48c1e004               shl rax, 4
0000000145c3e4e3  4c8d2c38               lea r13, [rax + rdi]
0000000145c3e4e7  4983c560               add r13, 0x60
0000000145c3e4eb  eb0f                   jmp 0x145c3e4fc
0000000145c3e4ed  0f1f00                 nop dword ptr [rax]
0000000145c3e4f0  49ffc7                 inc r15
0000000145c3e4f3  4983c530               add r13, 0x30
0000000145c3e4f7  4d39fc                 cmp r12, r15
0000000145c3e4fa  745f                   je 0x145c3e55b
0000000145c3e4fc  49395de0               cmp qword ptr [r13 - 0x20], rbx
0000000145c3e500  75ee                   jne 0x145c3e4f0
0000000145c3e502  498b4dd8               mov rcx, qword ptr [r13 - 0x28]
0000000145c3e506  498b16                 mov rdx, qword ptr [r14]
0000000145c3e509  4989d8                 mov r8, rbx
0000000145c3e50c  e856583500             call 0x145f93d67
0000000145c3e511  85c0                   test eax, eax
0000000145c3e513  75db                   jne 0x145c3e4f0
0000000145c3e515  49ffc7                 inc r15
0000000145c3e518  4c897f28               mov qword ptr [rdi + 0x28], r15
0000000145c3e51c  4d8b75e8               mov r14, qword ptr [r13 - 0x18]
0000000145c3e520  4d8b7df0               mov r15, qword ptr [r13 - 0x10]
0000000145c3e524  498b5df8               mov rbx, qword ptr [r13 - 8]
0000000145c3e528  4d8b6500               mov r12, qword ptr [r13]
0000000145c3e52c  4c8d2d51ad9a01         lea r13, [rip + 0x19aad51]
0000000145c3e533  ba07000000             mov edx, 7
0000000145c3e538  4c89e9                 mov rcx, r13
0000000145c3e53b  e8c0b4eeff             call 0x145b29a00
0000000145c3e540  4889c7                 mov rdi, rax
0000000145c3e543  4889d0                 mov rax, rdx
0000000145c3e546  4885ff                 test rdi, rdi
0000000145c3e549  b907000000             mov ecx, 7
0000000145c3e54e  480f44c1               cmove rax, rcx
0000000145c3e552  490f44fd               cmove rdi, r13
0000000145c3e556  e907020000             jmp 0x145c3e762
0000000145c3e55b  4c896728               mov qword ptr [rdi + 0x28], r12
0000000145c3e55f  48c70700000000         mov qword ptr [rdi], 0
0000000145c3e566  4c8baf98000000         mov r13, qword ptr [rdi + 0x98]
0000000145c3e56d  4d85ed                 test r13, r13
0000000145c3e570  0f84d8000000           je 0x145c3e64e
0000000145c3e576  4c8bbfa0000000         mov r15, qword ptr [rdi + 0xa0]
0000000145c3e57d  4d39fd                 cmp r13, r15
0000000145c3e580  0f84c8000000           je 0x145c3e64e
0000000145c3e586  488b9fa8000000         mov rbx, qword ptr [rdi + 0xa8]
0000000145c3e58d  4c8bb7b0000000         mov r14, qword ptr [rdi + 0xb0]
0000000145c3e594  eb17                   jmp 0x145c3e5ad
0000000145c3e596  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c3e5a0  4983c540               add r13, 0x40
0000000145c3e5a4  4d39fd                 cmp r13, r15
0000000145c3e5a7  0f849a000000           je 0x145c3e647
0000000145c3e5ad  498b4d20               mov rcx, qword ptr [r13 + 0x20]
0000000145c3e5b1  4885c9                 test rcx, rcx
0000000145c3e5b4  74ea                   je 0x145c3e5a0
0000000145c3e5b6  4d397528               cmp qword ptr [r13 + 0x28], r14
0000000145c3e5ba  75e4                   jne 0x145c3e5a0
0000000145c3e5bc  4889da                 mov rdx, rbx
0000000145c3e5bf  4d89f0                 mov r8, r14
0000000145c3e5c2  e8a0573500             call 0x145f93d67
0000000145c3e5c7  85c0                   test eax, eax
0000000145c3e5c9  75d5                   jne 0x145c3e5a0
0000000145c3e5cb  498d4540               lea rax, [r13 + 0x40]
0000000145c3e5cf  48898798000000         mov qword ptr [rdi + 0x98], rax
0000000145c3e5d6  4c8d3598ac9a01         lea r14, [rip + 0x19aac98]
0000000145c3e5dd  bb06000000             mov ebx, 6
0000000145c3e5e2  ba06000000             mov edx, 6
0000000145c3e5e7  4c89f1                 mov rcx, r14
0000000145c3e5ea  e811b4eeff             call 0x145b29a00
0000000145c3e5ef  4889c7                 mov rdi, rax
0000000145c3e5f2  4885c0                 test rax, rax
0000000145c3e5f5  480f44d3               cmove rdx, rbx
0000000145c3e5f9  488955f0               mov qword ptr [rbp - 0x10], rdx
0000000145c3e5fd  490f44fe               cmove rdi, r14
0000000145c3e601  498d4530               lea rax, [r13 + 0x30]
0000000145c3e605  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145c3e609  488d05509f3300         lea rax, [rip + 0x339f50]
0000000145c3e610  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145c3e614  488d15a5a06801         lea rdx, [rip + 0x168a0a5]
0000000145c3e61b  488d4dd8               lea rcx, [rbp - 0x28]
0000000145c3e61f  4c8d45c8               lea r8, [rbp - 0x38]
0000000145c3e623  e888843200             call 0x145f66ab0
0000000145c3e628  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145c3e62c  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145c3e630  4d8b7500               mov r14, qword ptr [r13]
0000000145c3e634  498b5d08               mov rbx, qword ptr [r13 + 8]
0000000145c3e638  48894df8               mov qword ptr [rbp - 8], rcx
0000000145c3e63c  e8bfb3eeff             call 0x145b29a00
0000000145c3e641  90                     nop
0000000145c3e642  e9e6000000             jmp 0x145c3e72d
0000000145c3e647  4c89af98000000         mov qword ptr [rdi + 0x98], r13
0000000145c3e64e  48c70702000000         mov qword ptr [rdi], 2
0000000145c3e655  4c8bafb8000000         mov r13, qword ptr [rdi + 0xb8]
0000000145c3e65c  4d85ed                 test r13, r13
0000000145c3e65f  0f8420010000           je 0x145c3e785
0000000145c3e665  4c8bb7c0000000         mov r14, qword ptr [rdi + 0xc0]
0000000145c3e66c  4d39f5                 cmp r13, r14
0000000145c3e66f  0f8410010000           je 0x145c3e785
0000000145c3e675  4c8bbfc8000000         mov r15, qword ptr [rdi + 0xc8]
0000000145c3e67c  498b5f08               mov rbx, qword ptr [r15 + 8]
0000000145c3e680  eb1b                   jmp 0x145c3e69d
0000000145c3e682  66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c3e690  4983c540               add r13, 0x40
0000000145c3e694  4d39f5                 cmp r13, r14
0000000145c3e697  0f84e1000000           je 0x145c3e77e
0000000145c3e69d  49395d28               cmp qword ptr [r13 + 0x28], rbx
0000000145c3e6a1  75ed                   jne 0x145c3e690
0000000145c3e6a3  498b17                 mov rdx, qword ptr [r15]
0000000145c3e6a6  498b4d20               mov rcx, qword ptr [r13 + 0x20]
0000000145c3e6aa  4989d8                 mov r8, rbx
0000000145c3e6ad  e8b5563500             call 0x145f93d67
0000000145c3e6b2  85c0                   test eax, eax
0000000145c3e6b4  75da                   jne 0x145c3e690
0000000145c3e6b6  498d4540               lea rax, [r13 + 0x40]
0000000145c3e6ba  488987b8000000         mov qword ptr [rdi + 0xb8], rax
0000000145c3e6c1  4c8d35adab9a01         lea r14, [rip + 0x19aabad]
0000000145c3e6c8  bb06000000             mov ebx, 6
0000000145c3e6cd  ba06000000             mov edx, 6
0000000145c3e6d2  4c89f1                 mov rcx, r14
0000000145c3e6d5  e826b3eeff             call 0x145b29a00
0000000145c3e6da  4889c7                 mov rdi, rax
0000000145c3e6dd  4885c0                 test rax, rax
0000000145c3e6e0  480f44d3               cmove rdx, rbx
0000000145c3e6e4  488955f0               mov qword ptr [rbp - 0x10], rdx
0000000145c3e6e8  490f44fe               cmove rdi, r14
0000000145c3e6ec  498d4530               lea rax, [r13 + 0x30]
0000000145c3e6f0  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145c3e6f4  488d05659e3300         lea rax, [rip + 0x339e65]
0000000145c3e6fb  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145c3e6ff  488d15c49f6801         lea rdx, [rip + 0x1689fc4]
0000000145c3e706  488d4dd8               lea rcx, [rbp - 0x28]
0000000145c3e70a  4c8d45c8               lea r8, [rbp - 0x38]
0000000145c3e70e  e89d833200             call 0x145f66ab0
0000000145c3e713  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145c3e717  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145c3e71b  4d8b7500               mov r14, qword ptr [r13]
0000000145c3e71f  498b5d08               mov rbx, qword ptr [r13 + 8]
0000000145c3e723  48894df8               mov qword ptr [rbp - 8], rcx
0000000145c3e727  e8d4b2eeff             call 0x145b29a00
0000000145c3e72c  90                     nop
0000000145c3e72d  4989c4                 mov r12, rax
0000000145c3e730  4989d7                 mov r15, rdx
0000000145c3e733  488b55d8               mov rdx, qword ptr [rbp - 0x28]
0000000145c3e737  4885d2                 test rdx, rdx
0000000145c3e73a  740f                   je 0x145c3e74b
0000000145c3e73c  41b801000000           mov r8d, 1
0000000145c3e742  488b4df8               mov rcx, qword ptr [rbp - 8]
0000000145c3e746  e8853a3cfa             call 0x1400021d0
0000000145c3e74b  4d85e4                 test r12, r12
0000000145c3e74e  4d0f45f4               cmovne r14, r12
0000000145c3e752  4c0f44fb               cmove r15, rbx
0000000145c3e756  498b5d10               mov rbx, qword ptr [r13 + 0x10]
0000000145c3e75a  4d8b6518               mov r12, qword ptr [r13 + 0x18]
0000000145c3e75e  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145c3e762  48893e                 mov qword ptr [rsi], rdi
0000000145c3e765  48894608               mov qword ptr [rsi + 8], rax
0000000145c3e769  4c897610               mov qword ptr [rsi + 0x10], r14
0000000145c3e76d  4c897e18               mov qword ptr [rsi + 0x18], r15
0000000145c3e771  48895e20               mov qword ptr [rsi + 0x20], rbx
0000000145c3e775  4c896628               mov qword ptr [rsi + 0x28], r12
0000000145c3e779  e9ef000000             jmp 0x145c3e86d
0000000145c3e77e  4c89afb8000000         mov qword ptr [rdi + 0xb8], r13
0000000145c3e785  48c707ffffffff         mov qword ptr [rdi], 0xffffffffffffffff
0000000145c3e78c  4c8ba7d0000000         mov r12, qword ptr [rdi + 0xd0]
0000000145c3e793  4d85e4                 test r12, r12
0000000145c3e796  0f84ca000000           je 0x145c3e866
0000000145c3e79c  4c8bbfd8000000         mov r15, qword ptr [rdi + 0xd8]
0000000145c3e7a3  4d39fc                 cmp r12, r15
0000000145c3e7a6  0f84ba000000           je 0x145c3e866
0000000145c3e7ac  488b9fe0000000         mov rbx, qword ptr [rdi + 0xe0]
0000000145c3e7b3  4c8bb7e8000000         mov r14, qword ptr [rdi + 0xe8]
0000000145c3e7ba  eb11                   jmp 0x145c3e7cd
0000000145c3e7bc  0f1f4000               nop dword ptr [rax]
0000000145c3e7c0  4983c460               add r12, 0x60
0000000145c3e7c4  4d39fc                 cmp r12, r15
0000000145c3e7c7  0f8492000000           je 0x145c3e85f
0000000145c3e7cd  498b4c2440             mov rcx, qword ptr [r12 + 0x40]
0000000145c3e7d2  4885c9                 test rcx, rcx
0000000145c3e7d5  74e9                   je 0x145c3e7c0
0000000145c3e7d7  4d39742448             cmp qword ptr [r12 + 0x48], r14
0000000145c3e7dc  75e2                   jne 0x145c3e7c0
0000000145c3e7de  4889da                 mov rdx, rbx
0000000145c3e7e1  4d89f0                 mov r8, r14
0000000145c3e7e4  e87e553500             call 0x145f93d67
0000000145c3e7e9  85c0                   test eax, eax
0000000145c3e7eb  75d3                   jne 0x145c3e7c0
0000000145c3e7ed  498d442460             lea rax, [r12 + 0x60]
0000000145c3e7f2  488987d0000000         mov qword ptr [rdi + 0xd0], rax
0000000145c3e7f9  488d3d7baa9a01         lea rdi, [rip + 0x19aaa7b]
0000000145c3e800  41bf09000000           mov r15d, 9
0000000145c3e806  ba09000000             mov edx, 9
0000000145c3e80b  4889f9                 mov rcx, rdi
0000000145c3e80e  e8edb1eeff             call 0x145b29a00
0000000145c3e813  4889c3                 mov rbx, rax
0000000145c3e816  4989d6                 mov r14, rdx
0000000145c3e819  4885c0                 test rax, rax
0000000145c3e81c  480f44df               cmove rbx, rdi
0000000145c3e820  4d0f44f7               cmove r14, r15
0000000145c3e824  498b7c2410             mov rdi, qword ptr [r12 + 0x10]
0000000145c3e829  4d8b7c2418             mov r15, qword ptr [r12 + 0x18]
0000000145c3e82e  4889f9                 mov rcx, rdi
0000000145c3e831  4c89fa                 mov rdx, r15
0000000145c3e834  e8c7b1eeff             call 0x145b29a00
0000000145c3e839  4885c0                 test rax, rax
0000000145c3e83c  480f44c7               cmove rax, rdi
0000000145c3e840  490f44d7               cmove rdx, r15
0000000145c3e844  410f10442430           movups xmm0, xmmword ptr [r12 + 0x30]
0000000145c3e84a  48891e                 mov qword ptr [rsi], rbx
0000000145c3e84d  4c897608               mov qword ptr [rsi + 8], r14
0000000145c3e851  48894610               mov qword ptr [rsi + 0x10], rax
0000000145c3e855  48895618               mov qword ptr [rsi + 0x18], rdx
0000000145c3e859  0f114620               movups xmmword ptr [rsi + 0x20], xmm0
0000000145c3e85d  eb0e                   jmp 0x145c3e86d
0000000145c3e85f  4c89a7d0000000         mov qword ptr [rdi + 0xd0], r12
0000000145c3e866  48c70600000000         mov qword ptr [rsi], 0
0000000145c3e86d  4883c468               add rsp, 0x68
0000000145c3e871  5b                     pop rbx
0000000145c3e872  5f                     pop rdi
0000000145c3e873  5e                     pop rsi
0000000145c3e874  415c                   pop r12
0000000145c3e876  415d                   pop r13
0000000145c3e878  415e                   pop r14
0000000145c3e87a  415f                   pop r15
0000000145c3e87c  5d                     pop rbp
0000000145c3e87d  c3                     ret

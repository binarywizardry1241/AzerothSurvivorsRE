0000000145c3e7f0  55                     push rbp
0000000145c3e7f1  4157                   push r15
0000000145c3e7f3  4156                   push r14
0000000145c3e7f5  4155                   push r13
0000000145c3e7f7  4154                   push r12
0000000145c3e7f9  56                     push rsi
0000000145c3e7fa  57                     push rdi
0000000145c3e7fb  53                     push rbx
0000000145c3e7fc  4883ec68               sub rsp, 0x68
0000000145c3e800  488d6c2460             lea rbp, [rsp + 0x60]
0000000145c3e805  48c74500feffffff       mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c3e80d  4889d7                 mov rdi, rdx
0000000145c3e810  4889ce                 mov rsi, rcx
0000000145c3e813  488b02                 mov rax, qword ptr [rdx]
0000000145c3e816  4883f8ff               cmp rax, -1
0000000145c3e81a  0f84ec030000           je 0x145c3ec0c
0000000145c3e820  4885c0                 test rax, rax
0000000145c3e823  0f84bd010000           je 0x145c3e9e6
0000000145c3e829  83f802                 cmp eax, 2
0000000145c3e82c  0f84a3020000           je 0x145c3ead5
0000000145c3e832  488b4708               mov rax, qword ptr [rdi + 8]
0000000145c3e836  4885c0                 test rax, rax
0000000145c3e839  0f84fa000000           je 0x145c3e939
0000000145c3e83f  4c8b7f10               mov r15, qword ptr [rdi + 0x10]
0000000145c3e843  4c39f8                 cmp rax, r15
0000000145c3e846  0f84e5000000           je 0x145c3e931
0000000145c3e84c  4c8b6f18               mov r13, qword ptr [rdi + 0x18]
0000000145c3e850  498b5d08               mov rbx, qword ptr [r13 + 8]
0000000145c3e854  4883c078               add rax, 0x78
0000000145c3e858  eb14                   jmp 0x145c3e86e
0000000145c3e85a  660f1f440000           nop word ptr [rax + rax]
0000000145c3e860  498d442478             lea rax, [r12 + 0x78]
0000000145c3e865  4d39fc                 cmp r12, r15
0000000145c3e868  0f84bb000000           je 0x145c3e929
0000000145c3e86e  4989c4                 mov r12, rax
0000000145c3e871  483958e0               cmp qword ptr [rax - 0x20], rbx
0000000145c3e875  75e9                   jne 0x145c3e860
0000000145c3e877  4d8b7500               mov r14, qword ptr [r13]
0000000145c3e87b  498b4c24d8             mov rcx, qword ptr [r12 - 0x28]
0000000145c3e880  4c89f2                 mov rdx, r14
0000000145c3e883  4989d8                 mov r8, rbx
0000000145c3e886  e85c593500             call 0x145f941e7
0000000145c3e88b  85c0                   test eax, eax
0000000145c3e88d  75d1                   jne 0x145c3e860
0000000145c3e88f  498b4c24e8             mov rcx, qword ptr [r12 - 0x18]
0000000145c3e894  4885c9                 test rcx, rcx
0000000145c3e897  7428                   je 0x145c3e8c1
0000000145c3e899  498b5424f0             mov rdx, qword ptr [r12 - 0x10]
0000000145c3e89e  e8ed65f0ff             call 0x145b44e90
0000000145c3e8a3  4885c0                 test rax, rax
0000000145c3e8a6  7419                   je 0x145c3e8c1
0000000145c3e8a8  48395858               cmp qword ptr [rax + 0x58], rbx
0000000145c3e8ac  7513                   jne 0x145c3e8c1
0000000145c3e8ae  488b4850               mov rcx, qword ptr [rax + 0x50]
0000000145c3e8b2  4c89f2                 mov rdx, r14
0000000145c3e8b5  4989d8                 mov r8, rbx
0000000145c3e8b8  e82a593500             call 0x145f941e7
0000000145c3e8bd  85c0                   test eax, eax
0000000145c3e8bf  749f                   je 0x145c3e860
0000000145c3e8c1  4c896708               mov qword ptr [rdi + 8], r12
0000000145c3e8c5  4c8d3dd8a99a01         lea r15, [rip + 0x19aa9d8]
0000000145c3e8cc  ba07000000             mov edx, 7
0000000145c3e8d1  4c89f9                 mov rcx, r15
0000000145c3e8d4  e8d7b1eeff             call 0x145b29ab0
0000000145c3e8d9  4889c7                 mov rdi, rax
0000000145c3e8dc  4889d3                 mov rbx, rdx
0000000145c3e8df  498b4c2498             mov rcx, qword ptr [r12 - 0x68]
0000000145c3e8e4  48894df0               mov qword ptr [rbp - 0x10], rcx
0000000145c3e8e8  4d8b6c24a0             mov r13, qword ptr [r12 - 0x60]
0000000145c3e8ed  4c89ea                 mov rdx, r13
0000000145c3e8f0  e8bbb1eeff             call 0x145b29ab0
0000000145c3e8f5  4989c6                 mov r14, rax
0000000145c3e8f8  4889d8                 mov rax, rbx
0000000145c3e8fb  4885ff                 test rdi, rdi
0000000145c3e8fe  490f44ff               cmove rdi, r15
0000000145c3e902  b907000000             mov ecx, 7
0000000145c3e907  480f44c1               cmove rax, rcx
0000000145c3e90b  4989d7                 mov r15, rdx
0000000145c3e90e  4d85f6                 test r14, r14
0000000145c3e911  498b5c24a8             mov rbx, qword ptr [r12 - 0x58]
0000000145c3e916  4d8b6424b0             mov r12, qword ptr [r12 - 0x50]
0000000145c3e91b  4d0f44fd               cmove r15, r13
0000000145c3e91f  4c0f4475f0             cmove r14, qword ptr [rbp - 0x10]
0000000145c3e924  e9b9020000             jmp 0x145c3ebe2
0000000145c3e929  4883c088               add rax, -0x78
0000000145c3e92d  48894708               mov qword ptr [rdi + 8], rax
0000000145c3e931  48c7470800000000       mov qword ptr [rdi + 8], 0
0000000145c3e939  4c8b7720               mov r14, qword ptr [rdi + 0x20]
0000000145c3e93d  4d85f6                 test r14, r14
0000000145c3e940  0f8499000000           je 0x145c3e9df
0000000145c3e946  4c8b7f28               mov r15, qword ptr [rdi + 0x28]
0000000145c3e94a  4c8b6730               mov r12, qword ptr [rdi + 0x30]
0000000145c3e94e  4d39e7                 cmp r15, r12
0000000145c3e951  0f8488000000           je 0x145c3e9df
0000000145c3e957  498b5e08               mov rbx, qword ptr [r14 + 8]
0000000145c3e95b  4b8d047f               lea rax, [r15 + r15*2]
0000000145c3e95f  48c1e004               shl rax, 4
0000000145c3e963  4c8d2c38               lea r13, [rax + rdi]
0000000145c3e967  4983c560               add r13, 0x60
0000000145c3e96b  eb0f                   jmp 0x145c3e97c
0000000145c3e96d  0f1f00                 nop dword ptr [rax]
0000000145c3e970  49ffc7                 inc r15
0000000145c3e973  4983c530               add r13, 0x30
0000000145c3e977  4d39fc                 cmp r12, r15
0000000145c3e97a  745f                   je 0x145c3e9db
0000000145c3e97c  49395de0               cmp qword ptr [r13 - 0x20], rbx
0000000145c3e980  75ee                   jne 0x145c3e970
0000000145c3e982  498b4dd8               mov rcx, qword ptr [r13 - 0x28]
0000000145c3e986  498b16                 mov rdx, qword ptr [r14]
0000000145c3e989  4989d8                 mov r8, rbx
0000000145c3e98c  e856583500             call 0x145f941e7
0000000145c3e991  85c0                   test eax, eax
0000000145c3e993  75db                   jne 0x145c3e970
0000000145c3e995  49ffc7                 inc r15
0000000145c3e998  4c897f28               mov qword ptr [rdi + 0x28], r15
0000000145c3e99c  4d8b75e8               mov r14, qword ptr [r13 - 0x18]
0000000145c3e9a0  4d8b7df0               mov r15, qword ptr [r13 - 0x10]
0000000145c3e9a4  498b5df8               mov rbx, qword ptr [r13 - 8]
0000000145c3e9a8  4d8b6500               mov r12, qword ptr [r13]
0000000145c3e9ac  4c8d2df1a89a01         lea r13, [rip + 0x19aa8f1]
0000000145c3e9b3  ba07000000             mov edx, 7
0000000145c3e9b8  4c89e9                 mov rcx, r13
0000000145c3e9bb  e8f0b0eeff             call 0x145b29ab0
0000000145c3e9c0  4889c7                 mov rdi, rax
0000000145c3e9c3  4889d0                 mov rax, rdx
0000000145c3e9c6  4885ff                 test rdi, rdi
0000000145c3e9c9  b907000000             mov ecx, 7
0000000145c3e9ce  480f44c1               cmove rax, rcx
0000000145c3e9d2  490f44fd               cmove rdi, r13
0000000145c3e9d6  e907020000             jmp 0x145c3ebe2
0000000145c3e9db  4c896728               mov qword ptr [rdi + 0x28], r12
0000000145c3e9df  48c70700000000         mov qword ptr [rdi], 0
0000000145c3e9e6  4c8baf98000000         mov r13, qword ptr [rdi + 0x98]
0000000145c3e9ed  4d85ed                 test r13, r13
0000000145c3e9f0  0f84d8000000           je 0x145c3eace
0000000145c3e9f6  4c8bbfa0000000         mov r15, qword ptr [rdi + 0xa0]
0000000145c3e9fd  4d39fd                 cmp r13, r15
0000000145c3ea00  0f84c8000000           je 0x145c3eace
0000000145c3ea06  488b9fa8000000         mov rbx, qword ptr [rdi + 0xa8]
0000000145c3ea0d  4c8bb7b0000000         mov r14, qword ptr [rdi + 0xb0]
0000000145c3ea14  eb17                   jmp 0x145c3ea2d
0000000145c3ea16  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c3ea20  4983c540               add r13, 0x40
0000000145c3ea24  4d39fd                 cmp r13, r15
0000000145c3ea27  0f849a000000           je 0x145c3eac7
0000000145c3ea2d  498b4d20               mov rcx, qword ptr [r13 + 0x20]
0000000145c3ea31  4885c9                 test rcx, rcx
0000000145c3ea34  74ea                   je 0x145c3ea20
0000000145c3ea36  4d397528               cmp qword ptr [r13 + 0x28], r14
0000000145c3ea3a  75e4                   jne 0x145c3ea20
0000000145c3ea3c  4889da                 mov rdx, rbx
0000000145c3ea3f  4d89f0                 mov r8, r14
0000000145c3ea42  e8a0573500             call 0x145f941e7
0000000145c3ea47  85c0                   test eax, eax
0000000145c3ea49  75d5                   jne 0x145c3ea20
0000000145c3ea4b  498d4540               lea rax, [r13 + 0x40]
0000000145c3ea4f  48898798000000         mov qword ptr [rdi + 0x98], rax
0000000145c3ea56  4c8d3538a89a01         lea r14, [rip + 0x19aa838]
0000000145c3ea5d  bb06000000             mov ebx, 6
0000000145c3ea62  ba06000000             mov edx, 6
0000000145c3ea67  4c89f1                 mov rcx, r14
0000000145c3ea6a  e841b0eeff             call 0x145b29ab0
0000000145c3ea6f  4889c7                 mov rdi, rax
0000000145c3ea72  4885c0                 test rax, rax
0000000145c3ea75  480f44d3               cmove rdx, rbx
0000000145c3ea79  488955f0               mov qword ptr [rbp - 0x10], rdx
0000000145c3ea7d  490f44fe               cmove rdi, r14
0000000145c3ea81  498d4530               lea rax, [r13 + 0x30]
0000000145c3ea85  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145c3ea89  488d05509f3300         lea rax, [rip + 0x339f50]
0000000145c3ea90  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145c3ea94  488d15a59b6801         lea rdx, [rip + 0x1689ba5]
0000000145c3ea9b  488d4dd8               lea rcx, [rbp - 0x28]
0000000145c3ea9f  4c8d45c8               lea r8, [rbp - 0x38]
0000000145c3eaa3  e888843200             call 0x145f66f30
0000000145c3eaa8  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145c3eaac  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145c3eab0  4d8b7500               mov r14, qword ptr [r13]
0000000145c3eab4  498b5d08               mov rbx, qword ptr [r13 + 8]
0000000145c3eab8  48894df8               mov qword ptr [rbp - 8], rcx
0000000145c3eabc  e8efafeeff             call 0x145b29ab0
0000000145c3eac1  90                     nop
0000000145c3eac2  e9e6000000             jmp 0x145c3ebad
0000000145c3eac7  4c89af98000000         mov qword ptr [rdi + 0x98], r13
0000000145c3eace  48c70702000000         mov qword ptr [rdi], 2
0000000145c3ead5  4c8bafb8000000         mov r13, qword ptr [rdi + 0xb8]
0000000145c3eadc  4d85ed                 test r13, r13
0000000145c3eadf  0f8420010000           je 0x145c3ec05
0000000145c3eae5  4c8bb7c0000000         mov r14, qword ptr [rdi + 0xc0]
0000000145c3eaec  4d39f5                 cmp r13, r14
0000000145c3eaef  0f8410010000           je 0x145c3ec05
0000000145c3eaf5  4c8bbfc8000000         mov r15, qword ptr [rdi + 0xc8]
0000000145c3eafc  498b5f08               mov rbx, qword ptr [r15 + 8]
0000000145c3eb00  eb1b                   jmp 0x145c3eb1d
0000000145c3eb02  66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c3eb10  4983c540               add r13, 0x40
0000000145c3eb14  4d39f5                 cmp r13, r14
0000000145c3eb17  0f84e1000000           je 0x145c3ebfe
0000000145c3eb1d  49395d28               cmp qword ptr [r13 + 0x28], rbx
0000000145c3eb21  75ed                   jne 0x145c3eb10
0000000145c3eb23  498b17                 mov rdx, qword ptr [r15]
0000000145c3eb26  498b4d20               mov rcx, qword ptr [r13 + 0x20]
0000000145c3eb2a  4989d8                 mov r8, rbx
0000000145c3eb2d  e8b5563500             call 0x145f941e7
0000000145c3eb32  85c0                   test eax, eax
0000000145c3eb34  75da                   jne 0x145c3eb10
0000000145c3eb36  498d4540               lea rax, [r13 + 0x40]
0000000145c3eb3a  488987b8000000         mov qword ptr [rdi + 0xb8], rax
0000000145c3eb41  4c8d354da79a01         lea r14, [rip + 0x19aa74d]
0000000145c3eb48  bb06000000             mov ebx, 6
0000000145c3eb4d  ba06000000             mov edx, 6
0000000145c3eb52  4c89f1                 mov rcx, r14
0000000145c3eb55  e856afeeff             call 0x145b29ab0
0000000145c3eb5a  4889c7                 mov rdi, rax
0000000145c3eb5d  4885c0                 test rax, rax
0000000145c3eb60  480f44d3               cmove rdx, rbx
0000000145c3eb64  488955f0               mov qword ptr [rbp - 0x10], rdx
0000000145c3eb68  490f44fe               cmove rdi, r14
0000000145c3eb6c  498d4530               lea rax, [r13 + 0x30]
0000000145c3eb70  488945c8               mov qword ptr [rbp - 0x38], rax
0000000145c3eb74  488d05659e3300         lea rax, [rip + 0x339e65]
0000000145c3eb7b  488945d0               mov qword ptr [rbp - 0x30], rax
0000000145c3eb7f  488d15c49a6801         lea rdx, [rip + 0x1689ac4]
0000000145c3eb86  488d4dd8               lea rcx, [rbp - 0x28]
0000000145c3eb8a  4c8d45c8               lea r8, [rbp - 0x38]
0000000145c3eb8e  e89d833200             call 0x145f66f30
0000000145c3eb93  488b4de0               mov rcx, qword ptr [rbp - 0x20]
0000000145c3eb97  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145c3eb9b  4d8b7500               mov r14, qword ptr [r13]
0000000145c3eb9f  498b5d08               mov rbx, qword ptr [r13 + 8]
0000000145c3eba3  48894df8               mov qword ptr [rbp - 8], rcx
0000000145c3eba7  e804afeeff             call 0x145b29ab0
0000000145c3ebac  90                     nop
0000000145c3ebad  4989c4                 mov r12, rax
0000000145c3ebb0  4989d7                 mov r15, rdx
0000000145c3ebb3  488b55d8               mov rdx, qword ptr [rbp - 0x28]
0000000145c3ebb7  4885d2                 test rdx, rdx
0000000145c3ebba  740f                   je 0x145c3ebcb
0000000145c3ebbc  41b801000000           mov r8d, 1
0000000145c3ebc2  488b4df8               mov rcx, qword ptr [rbp - 8]
0000000145c3ebc6  e805363cfa             call 0x1400021d0
0000000145c3ebcb  4d85e4                 test r12, r12
0000000145c3ebce  4d0f45f4               cmovne r14, r12
0000000145c3ebd2  4c0f44fb               cmove r15, rbx
0000000145c3ebd6  498b5d10               mov rbx, qword ptr [r13 + 0x10]
0000000145c3ebda  4d8b6518               mov r12, qword ptr [r13 + 0x18]
0000000145c3ebde  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145c3ebe2  48893e                 mov qword ptr [rsi], rdi
0000000145c3ebe5  48894608               mov qword ptr [rsi + 8], rax
0000000145c3ebe9  4c897610               mov qword ptr [rsi + 0x10], r14
0000000145c3ebed  4c897e18               mov qword ptr [rsi + 0x18], r15
0000000145c3ebf1  48895e20               mov qword ptr [rsi + 0x20], rbx
0000000145c3ebf5  4c896628               mov qword ptr [rsi + 0x28], r12
0000000145c3ebf9  e9ef000000             jmp 0x145c3eced
0000000145c3ebfe  4c89afb8000000         mov qword ptr [rdi + 0xb8], r13
0000000145c3ec05  48c707ffffffff         mov qword ptr [rdi], 0xffffffffffffffff
0000000145c3ec0c  4c8ba7d0000000         mov r12, qword ptr [rdi + 0xd0]
0000000145c3ec13  4d85e4                 test r12, r12
0000000145c3ec16  0f84ca000000           je 0x145c3ece6
0000000145c3ec1c  4c8bbfd8000000         mov r15, qword ptr [rdi + 0xd8]
0000000145c3ec23  4d39fc                 cmp r12, r15
0000000145c3ec26  0f84ba000000           je 0x145c3ece6
0000000145c3ec2c  488b9fe0000000         mov rbx, qword ptr [rdi + 0xe0]
0000000145c3ec33  4c8bb7e8000000         mov r14, qword ptr [rdi + 0xe8]
0000000145c3ec3a  eb11                   jmp 0x145c3ec4d
0000000145c3ec3c  0f1f4000               nop dword ptr [rax]
0000000145c3ec40  4983c460               add r12, 0x60
0000000145c3ec44  4d39fc                 cmp r12, r15
0000000145c3ec47  0f8492000000           je 0x145c3ecdf
0000000145c3ec4d  498b4c2440             mov rcx, qword ptr [r12 + 0x40]
0000000145c3ec52  4885c9                 test rcx, rcx
0000000145c3ec55  74e9                   je 0x145c3ec40
0000000145c3ec57  4d39742448             cmp qword ptr [r12 + 0x48], r14
0000000145c3ec5c  75e2                   jne 0x145c3ec40
0000000145c3ec5e  4889da                 mov rdx, rbx
0000000145c3ec61  4d89f0                 mov r8, r14
0000000145c3ec64  e87e553500             call 0x145f941e7
0000000145c3ec69  85c0                   test eax, eax
0000000145c3ec6b  75d3                   jne 0x145c3ec40
0000000145c3ec6d  498d442460             lea rax, [r12 + 0x60]
0000000145c3ec72  488987d0000000         mov qword ptr [rdi + 0xd0], rax
0000000145c3ec79  488d3d1ba69a01         lea rdi, [rip + 0x19aa61b]
0000000145c3ec80  41bf09000000           mov r15d, 9
0000000145c3ec86  ba09000000             mov edx, 9
0000000145c3ec8b  4889f9                 mov rcx, rdi
0000000145c3ec8e  e81daeeeff             call 0x145b29ab0
0000000145c3ec93  4889c3                 mov rbx, rax
0000000145c3ec96  4989d6                 mov r14, rdx
0000000145c3ec99  4885c0                 test rax, rax
0000000145c3ec9c  480f44df               cmove rbx, rdi
0000000145c3eca0  4d0f44f7               cmove r14, r15
0000000145c3eca4  498b7c2410             mov rdi, qword ptr [r12 + 0x10]
0000000145c3eca9  4d8b7c2418             mov r15, qword ptr [r12 + 0x18]
0000000145c3ecae  4889f9                 mov rcx, rdi
0000000145c3ecb1  4c89fa                 mov rdx, r15
0000000145c3ecb4  e8f7adeeff             call 0x145b29ab0
0000000145c3ecb9  4885c0                 test rax, rax
0000000145c3ecbc  480f44c7               cmove rax, rdi
0000000145c3ecc0  490f44d7               cmove rdx, r15
0000000145c3ecc4  410f10442430           movups xmm0, xmmword ptr [r12 + 0x30]
0000000145c3ecca  48891e                 mov qword ptr [rsi], rbx
0000000145c3eccd  4c897608               mov qword ptr [rsi + 8], r14
0000000145c3ecd1  48894610               mov qword ptr [rsi + 0x10], rax
0000000145c3ecd5  48895618               mov qword ptr [rsi + 0x18], rdx
0000000145c3ecd9  0f114620               movups xmmword ptr [rsi + 0x20], xmm0
0000000145c3ecdd  eb0e                   jmp 0x145c3eced
0000000145c3ecdf  4c89a7d0000000         mov qword ptr [rdi + 0xd0], r12
0000000145c3ece6  48c70600000000         mov qword ptr [rsi], 0
0000000145c3eced  4883c468               add rsp, 0x68
0000000145c3ecf1  5b                     pop rbx
0000000145c3ecf2  5f                     pop rdi
0000000145c3ecf3  5e                     pop rsi
0000000145c3ecf4  415c                   pop r12
0000000145c3ecf6  415d                   pop r13
0000000145c3ecf8  415e                   pop r14
0000000145c3ecfa  415f                   pop r15
0000000145c3ecfc  5d                     pop rbp
0000000145c3ecfd  c3                     ret

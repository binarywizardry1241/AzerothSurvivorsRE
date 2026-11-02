0000000145c1e760  4157                   push r15
0000000145c1e762  4156                   push r14
0000000145c1e764  4155                   push r13
0000000145c1e766  4154                   push r12
0000000145c1e768  56                     push rsi
0000000145c1e769  57                     push rdi
0000000145c1e76a  55                     push rbp
0000000145c1e76b  53                     push rbx
0000000145c1e76c  4883ec38               sub rsp, 0x38
0000000145c1e770  80794100               cmp byte ptr [rcx + 0x41], 0
0000000145c1e774  7416                   je 0x145c1e78c
0000000145c1e776  31c0                   xor eax, eax
0000000145c1e778  4489ea                 mov edx, r13d
0000000145c1e77b  4883c438               add rsp, 0x38
0000000145c1e77f  5b                     pop rbx
0000000145c1e780  5d                     pop rbp
0000000145c1e781  5f                     pop rdi
0000000145c1e782  5e                     pop rsi
0000000145c1e783  415c                   pop r12
0000000145c1e785  415d                   pop r13
0000000145c1e787  415e                   pop r14
0000000145c1e789  415f                   pop r15
0000000145c1e78b  c3                     ret
0000000145c1e78c  4c89c6                 mov rsi, r8
0000000145c1e78f  4889cf                 mov rdi, rcx
0000000145c1e792  eb12                   jmp 0x145c1e7a6
0000000145c1e794  6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c1e7a0  807f4101               cmp byte ptr [rdi + 0x41], 1
0000000145c1e7a4  74d0                   je 0x145c1e776
0000000145c1e7a6  488d5710               lea rdx, [rdi + 0x10]
0000000145c1e7aa  4c8b3a                 mov r15, qword ptr [rdx]
0000000145c1e7ad  488d4c2420             lea rcx, [rsp + 0x20]
0000000145c1e7b2  e8791b0100             call 0x145c30330
0000000145c1e7b7  837c242001             cmp dword ptr [rsp + 0x20], 1
0000000145c1e7bc  7522                   jne 0x145c1e7e0
0000000145c1e7be  488b442430             mov rax, qword ptr [rsp + 0x30]
0000000145c1e7c3  488b0f                 mov rcx, qword ptr [rdi]
0000000145c1e7c6  488907                 mov qword ptr [rdi], rax
0000000145c1e7c9  4829c8                 sub rax, rcx
0000000145c1e7cc  4901cf                 add r15, rcx
0000000145c1e7cf  4885c0                 test rax, rax
0000000145c1e7d2  753b                   jne 0x145c1e80f
0000000145c1e7d4  eb58                   jmp 0x145c1e82e
0000000145c1e7d6  662e0f1f840000000000   nop word ptr cs:[rax + rax]
0000000145c1e7e0  807f4100               cmp byte ptr [rdi + 0x41], 0
0000000145c1e7e4  7590                   jne 0x145c1e776
0000000145c1e7e6  c6474101               mov byte ptr [rdi + 0x41], 1
0000000145c1e7ea  4c8b3f                 mov r15, qword ptr [rdi]
0000000145c1e7ed  488b4708               mov rax, qword ptr [rdi + 8]
0000000145c1e7f1  4c29f8                 sub rax, r15
0000000145c1e7f4  0f95c1                 setne cl
0000000145c1e7f7  0a4f40                 or cl, byte ptr [rdi + 0x40]
0000000145c1e7fa  80f901                 cmp cl, 1
0000000145c1e7fd  0f8573ffffff           jne 0x145c1e776
0000000145c1e803  488d4f10               lea rcx, [rdi + 0x10]
0000000145c1e807  4c0339                 add r15, qword ptr [rcx]
0000000145c1e80a  4885c0                 test rax, rax
0000000145c1e80d  741f                   je 0x145c1e82e
0000000145c1e80f  41807c07ff0a           cmp byte ptr [r15 + rax - 1], 0xa
0000000145c1e815  4889c2                 mov rdx, rax
0000000145c1e818  7517                   jne 0x145c1e831
0000000145c1e81a  4889c2                 mov rdx, rax
0000000145c1e81d  48ffca                 dec rdx
0000000145c1e820  740f                   je 0x145c1e831
0000000145c1e822  41807c07fe0d           cmp byte ptr [r15 + rax - 2], 0xd
0000000145c1e828  7507                   jne 0x145c1e831
0000000145c1e82a  4883c0fe               add rax, -2
0000000145c1e82e  4889c2                 mov rdx, rax
0000000145c1e831  4c89f9                 mov rcx, r15
0000000145c1e834  e837525dfa             call 0x1401f3a70
0000000145c1e839  4883fa06               cmp rdx, 6
0000000145c1e83d  0f825dffffff           jb 0x145c1e7a0
0000000145c1e843  4989c7                 mov r15, rax
0000000145c1e846  8b00                   mov eax, dword ptr [rax]
0000000145c1e848  b972616365             mov ecx, 0x65636172
0000000145c1e84d  31c8                   xor eax, ecx
0000000145c1e84f  410fb74f04             movzx ecx, word ptr [r15 + 4]
0000000145c1e854  81f1737c0000           xor ecx, 0x7c73
0000000145c1e85a  09c1                   or ecx, eax
0000000145c1e85c  0f853effffff           jne 0x145c1e7a0
0000000145c1e862  4989d4                 mov r12, rdx
0000000145c1e865  4983c706               add r15, 6
0000000145c1e869  4983c4fa               add r12, -6
0000000145c1e86d  48c70600000000         mov qword ptr [rsi], 0
0000000145c1e874  4c896608               mov qword ptr [rsi + 8], r12
0000000145c1e878  4c897e10               mov qword ptr [rsi + 0x10], r15
0000000145c1e87c  4c896618               mov qword ptr [rsi + 0x18], r12
0000000145c1e880  48c7462000000000       mov qword ptr [rsi + 0x20], 0
0000000145c1e888  4c896628               mov qword ptr [rsi + 0x28], r12
0000000145c1e88c  48b82c0000002c000000   movabs rax, 0x2c0000002c
0000000145c1e896  48894630               mov qword ptr [rsi + 0x30], rax
0000000145c1e89a  c6463801               mov byte ptr [rsi + 0x38], 1
0000000145c1e89e  66c746400100           mov word ptr [rsi + 0x40], 1
0000000145c1e8a4  4531f6                 xor r14d, r14d
0000000145c1e8a7  31ed                   xor ebp, ebp
0000000145c1e8a9  eb1d                   jmp 0x145c1e8c8
0000000145c1e8ab  31c0                   xor eax, eax
0000000145c1e8ad  89c1                   mov ecx, eax
0000000145c1e8af  4189c5                 mov r13d, eax
0000000145c1e8b2  e899aff2ff             call 0x145b49850
0000000145c1e8b7  84c0                   test al, al
0000000145c1e8b9  0f85c2010000           jne 0x145c1ea81
0000000145c1e8bf  90                     nop
0000000145c1e8c0  84db                   test bl, bl
0000000145c1e8c2  0f85d8feffff           jne 0x145c1e7a0
0000000145c1e8c8  4989ed                 mov r13, rbp
0000000145c1e8cb  4d39f4                 cmp r12, r14
0000000145c1e8ce  731c                   jae 0x145c1e8ec
0000000145c1e8d0  4c89f5                 mov rbp, r14
0000000145c1e8d3  e9bf000000             jmp 0x145c1e997
0000000145c1e8d8  0f1f840000000000       nop dword ptr [rax + rax]
0000000145c1e8e0  4989ee                 mov r14, rbp
0000000145c1e8e3  4c39e5                 cmp rbp, r12
0000000145c1e8e6  0f87ab000000           ja 0x145c1e997
0000000145c1e8ec  4d89e0                 mov r8, r12
0000000145c1e8ef  4d29f0                 sub r8, r14
0000000145c1e8f2  4b8d0437               lea rax, [r15 + r14]
0000000145c1e8f6  4983f810               cmp r8, 0x10
0000000145c1e8fa  7334                   jae 0x145c1e930
0000000145c1e8fc  31d2                   xor edx, edx
0000000145c1e8fe  4d85c0                 test r8, r8
0000000145c1e901  741e                   je 0x145c1e921
0000000145c1e903  666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c1e910  803c102c               cmp byte ptr [rax + rdx], 0x2c
0000000145c1e914  742c                   je 0x145c1e942
0000000145c1e916  48ffc2                 inc rdx
0000000145c1e919  4939d0                 cmp r8, rdx
0000000145c1e91c  75f2                   jne 0x145c1e910
0000000145c1e91e  4c89c2                 mov rdx, r8
0000000145c1e921  31c0                   xor eax, eax
0000000145c1e923  4883f801               cmp rax, 1
0000000145c1e927  7427                   je 0x145c1e950
0000000145c1e929  eb65                   jmp 0x145c1e990
0000000145c1e92b  0f1f440000             nop dword ptr [rax + rax]
0000000145c1e930  b12c                   mov cl, 0x2c
0000000145c1e932  4889c2                 mov rdx, rax
0000000145c1e935  e8f6083600             call 0x145f7f230
0000000145c1e93a  4883f801               cmp rax, 1
0000000145c1e93e  7410                   je 0x145c1e950
0000000145c1e940  eb4e                   jmp 0x145c1e990
0000000145c1e942  b801000000             mov eax, 1
0000000145c1e947  4883f801               cmp rax, 1
0000000145c1e94b  7543                   jne 0x145c1e990
0000000145c1e94d  0f1f00                 nop dword ptr [rax]
0000000145c1e950  4a8d2c32               lea rbp, [rdx + r14]
0000000145c1e954  48ffc5                 inc rbp
0000000145c1e957  48896e20               mov qword ptr [rsi + 0x20], rbp
0000000145c1e95b  4c01f2                 add rdx, r14
0000000145c1e95e  4c39e2                 cmp rdx, r12
0000000145c1e961  0f8379ffffff           jae 0x145c1e8e0
0000000145c1e967  41803c172c             cmp byte ptr [r15 + rdx], 0x2c
0000000145c1e96c  0f856effffff           jne 0x145c1e8e0
0000000145c1e972  48892e                 mov qword ptr [rsi], rbp
0000000145c1e975  31db                   xor ebx, ebx
0000000145c1e977  4989ee                 mov r14, rbp
0000000145c1e97a  4c29ea                 sub rdx, r13
0000000145c1e97d  7530                   jne 0x145c1e9af
0000000145c1e97f  e93cffffff             jmp 0x145c1e8c0
0000000145c1e984  6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c1e990  4c896620               mov qword ptr [rsi + 0x20], r12
0000000145c1e994  4c89e5                 mov rbp, r12
0000000145c1e997  4989ee                 mov r14, rbp
0000000145c1e99a  c6464101               mov byte ptr [rsi + 0x41], 1
0000000145c1e99e  b301                   mov bl, 1
0000000145c1e9a0  4c89ed                 mov rbp, r13
0000000145c1e9a3  4c89e2                 mov rdx, r12
0000000145c1e9a6  4c29ea                 sub rdx, r13
0000000145c1e9a9  0f8411ffffff           je 0x145c1e8c0
0000000145c1e9af  4d01fd                 add r13, r15
0000000145c1e9b2  4883fa01               cmp rdx, 1
0000000145c1e9b6  7528                   jne 0x145c1e9e0
0000000145c1e9b8  410fb64500             movzx eax, byte ptr [r13]
0000000145c1e9bd  83f82b                 cmp eax, 0x2b
0000000145c1e9c0  0f84fafeffff           je 0x145c1e8c0
0000000145c1e9c6  83f82d                 cmp eax, 0x2d
0000000145c1e9c9  0f84f1feffff           je 0x145c1e8c0
0000000145c1e9cf  eb14                   jmp 0x145c1e9e5
0000000145c1e9d1  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145c1e9e0  410fb64500             movzx eax, byte ptr [r13]
0000000145c1e9e5  31c9                   xor ecx, ecx
0000000145c1e9e7  3c2b                   cmp al, 0x2b
0000000145c1e9e9  0f94c1                 sete cl
0000000145c1e9ec  4829ca                 sub rdx, rcx
0000000145c1e9ef  4901cd                 add r13, rcx
0000000145c1e9f2  4883fa03               cmp rdx, 3
0000000145c1e9f6  7348                   jae 0x145c1ea40
0000000145c1e9f8  4885d2                 test rdx, rdx
0000000145c1e9fb  0f84aafeffff           je 0x145c1e8ab
0000000145c1ea01  410fb64500             movzx eax, byte ptr [r13]
0000000145c1ea06  83c0d0                 add eax, -0x30
0000000145c1ea09  83f809                 cmp eax, 9
0000000145c1ea0c  0f87aefeffff           ja 0x145c1e8c0
0000000145c1ea12  4883fa01               cmp rdx, 1
0000000145c1ea16  0f8491feffff           je 0x145c1e8ad
0000000145c1ea1c  410fb64d01             movzx ecx, byte ptr [r13 + 1]
0000000145c1ea21  83c1d0                 add ecx, -0x30
0000000145c1ea24  83f909                 cmp ecx, 9
0000000145c1ea27  0f8793feffff           ja 0x145c1e8c0
0000000145c1ea2d  0fb6c0                 movzx eax, al
0000000145c1ea30  01c0                   add eax, eax
0000000145c1ea32  8d0480                 lea eax, [rax + rax*4]
0000000145c1ea35  00c1                   add cl, al
0000000145c1ea37  89c8                   mov eax, ecx
0000000145c1ea39  e96ffeffff             jmp 0x145c1e8ad
0000000145c1ea3e  6690                   nop
0000000145c1ea40  31c9                   xor ecx, ecx
0000000145c1ea42  31c0                   xor eax, eax
0000000145c1ea44  4839ca                 cmp rdx, rcx
0000000145c1ea47  0f8460feffff           je 0x145c1e8ad
0000000145c1ea4d  41b00a                 mov r8b, 0xa
0000000145c1ea50  41f6e0                 mul r8b
0000000145c1ea53  0f8067feffff           jo 0x145c1e8c0
0000000145c1ea59  450fb64c0d00           movzx r9d, byte ptr [r13 + rcx]
0000000145c1ea5f  4183c1d0               add r9d, -0x30
0000000145c1ea63  4400c8                 add al, r9b
0000000145c1ea66  410f92c0               setb r8b
0000000145c1ea6a  4183f909               cmp r9d, 9
0000000145c1ea6e  0f874cfeffff           ja 0x145c1e8c0
0000000145c1ea74  48ffc1                 inc rcx
0000000145c1ea77  4584c0                 test r8b, r8b
0000000145c1ea7a  74c8                   je 0x145c1ea44
0000000145c1ea7c  e93ffeffff             jmp 0x145c1e8c0
0000000145c1ea81  b001                   mov al, 1
0000000145c1ea83  e9f0fcffff             jmp 0x145c1e778

0000000145b4a010  4157                   push r15
0000000145b4a012  4156                   push r14
0000000145b4a014  56                     push rsi
0000000145b4a015  57                     push rdi
0000000145b4a016  53                     push rbx
0000000145b4a017  4883ec20               sub rsp, 0x20
0000000145b4a01b  8bb9f8010000           mov edi, dword ptr [rcx + 0x1f8]
0000000145b4a021  83ff01                 cmp edi, 1
0000000145b4a024  774e                   ja 0x145b4a074
0000000145b4a026  4889ce                 mov rsi, rcx
0000000145b4a029  488b9918010000         mov rbx, qword ptr [rcx + 0x118]
0000000145b4a030  4885db                 test rbx, rbx
0000000145b4a033  743f                   je 0x145b4a074
0000000145b4a035  4c8bb610010000         mov r14, qword ptr [rsi + 0x110]
0000000145b4a03c  48c7861801000000000000 mov qword ptr [rsi + 0x118], 0
0000000145b4a047  48c1e305               shl rbx, 5
0000000145b4a04b  4531ff                 xor r15d, r15d
0000000145b4a04e  eb09                   jmp 0x145b4a059
0000000145b4a050  4983c720               add r15, 0x20
0000000145b4a054  4c39fb                 cmp rbx, r15
0000000145b4a057  741f                   je 0x145b4a078
0000000145b4a059  4b8b143e               mov rdx, qword ptr [r14 + r15]
0000000145b4a05d  4885d2                 test rdx, rdx
0000000145b4a060  74ee                   je 0x145b4a050
0000000145b4a062  4b8b4c3e08             mov rcx, qword ptr [r14 + r15 + 8]
0000000145b4a067  41b801000000           mov r8d, 1
0000000145b4a06d  e85e814bfa             call 0x1400021d0
0000000145b4a072  ebdc                   jmp 0x145b4a050
0000000145b4a074  31c0                   xor eax, eax
0000000145b4a076  eb0a                   jmp 0x145b4a082
0000000145b4a078  ffc7                   inc edi
0000000145b4a07a  89bef8010000           mov dword ptr [rsi + 0x1f8], edi
0000000145b4a080  b001                   mov al, 1
0000000145b4a082  4883c420               add rsp, 0x20
0000000145b4a086  5b                     pop rbx
0000000145b4a087  5f                     pop rdi
0000000145b4a088  5e                     pop rsi
0000000145b4a089  415e                   pop r14
0000000145b4a08b  415f                   pop r15
0000000145b4a08d  c3                     ret

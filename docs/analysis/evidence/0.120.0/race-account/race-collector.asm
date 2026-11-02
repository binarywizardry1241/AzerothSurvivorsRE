0000000145c42ab0  55                     push rbp
0000000145c42ab1  4157                   push r15
0000000145c42ab3  4156                   push r14
0000000145c42ab5  4154                   push r12
0000000145c42ab7  56                     push rsi
0000000145c42ab8  57                     push rdi
0000000145c42ab9  53                     push rbx
0000000145c42aba  4881ec20010000         sub rsp, 0x120
0000000145c42ac1  488dac2480000000       lea rbp, [rsp + 0x80]
0000000145c42ac9  48c78598000000feffffff mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
0000000145c42ad4  4989d7                 mov r15, rdx
0000000145c42ad7  4889ce                 mov rsi, rcx
0000000145c42ada  4889d1                 mov rcx, rdx
0000000145c42add  e8ae5c0000             call 0x145c48790
0000000145c42ae2  a801                   test al, 1
0000000145c42ae4  0f84b7000000           je 0x145c42ba1
0000000145c42aea  89d3                   mov ebx, edx
0000000145c42aec  e80ff73bfa             call 0x140002200
0000000145c42af1  bf01000000             mov edi, 1
0000000145c42af6  b908000000             mov ecx, 8
0000000145c42afb  ba01000000             mov edx, 1
0000000145c42b00  e8bbf63bfa             call 0x1400021c0
0000000145c42b05  4885c0                 test rax, rax
0000000145c42b08  0f84d6000000           je 0x145c42be4
0000000145c42b0e  4989c6                 mov r14, rax
0000000145c42b11  8818                   mov byte ptr [rax], bl
0000000145c42b13  48c7858000000008000000 mov qword ptr [rbp + 0x80], 8
0000000145c42b1e  48898588000000         mov qword ptr [rbp + 0x88], rax
0000000145c42b25  48c7859000000001000000 mov qword ptr [rbp + 0x90], 1
0000000145c42b30  488d5da8               lea rbx, [rbp - 0x58]
0000000145c42b34  41b8d8000000           mov r8d, 0xd8
0000000145c42b3a  4889d9                 mov rcx, rbx
0000000145c42b3d  4c89fa                 mov rdx, r15
0000000145c42b40  e8660f3600             call 0x145fa3aab
0000000145c42b45  4c8dbd80000000         lea r15, [rbp + 0x80]
0000000145c42b4c  eb10                   jmp 0x145c42b5e
0000000145c42b4e  6690                   nop
0000000145c42b50  4588243e               mov byte ptr [r14 + rdi], r12b
0000000145c42b54  48ffc7                 inc rdi
0000000145c42b57  4889bd90000000         mov qword ptr [rbp + 0x90], rdi
0000000145c42b5e  4889d9                 mov rcx, rbx
0000000145c42b61  e82a5c0000             call 0x145c48790
0000000145c42b66  90                     nop
0000000145c42b67  a801                   test al, 1
0000000145c42b69  744f                   je 0x145c42bba
0000000145c42b6b  4189d4                 mov r12d, edx
0000000145c42b6e  483bbd80000000         cmp rdi, qword ptr [rbp + 0x80]
0000000145c42b75  75d9                   jne 0x145c42b50
0000000145c42b77  48c744242001000000     mov qword ptr [rsp + 0x20], 1
0000000145c42b80  41b801000000           mov r8d, 1
0000000145c42b86  41b901000000           mov r9d, 1
0000000145c42b8c  4c89f9                 mov rcx, r15
0000000145c42b8f  4889fa                 mov rdx, rdi
0000000145c42b92  e829133600             call 0x145fa3ec0
0000000145c42b97  90                     nop
0000000145c42b98  4c8bb588000000         mov r14, qword ptr [rbp + 0x88]
0000000145c42b9f  ebaf                   jmp 0x145c42b50
0000000145c42ba1  48c70600000000         mov qword ptr [rsi], 0
0000000145c42ba8  48c7460801000000       mov qword ptr [rsi + 8], 1
0000000145c42bb0  48c7461000000000       mov qword ptr [rsi + 0x10], 0
0000000145c42bb8  eb15                   jmp 0x145c42bcf
0000000145c42bba  488b8590000000         mov rax, qword ptr [rbp + 0x90]
0000000145c42bc1  48894610               mov qword ptr [rsi + 0x10], rax
0000000145c42bc5  0f108580000000         movups xmm0, xmmword ptr [rbp + 0x80]
0000000145c42bcc  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145c42bcf  4889f0                 mov rax, rsi
0000000145c42bd2  4881c420010000         add rsp, 0x120
0000000145c42bd9  5b                     pop rbx
0000000145c42bda  5f                     pop rdi
0000000145c42bdb  5e                     pop rsi
0000000145c42bdc  415c                   pop r12
0000000145c42bde  415e                   pop r14
0000000145c42be0  415f                   pop r15
0000000145c42be2  5d                     pop rbp
0000000145c42be3  c3                     ret
0000000145c42be4  b901000000             mov ecx, 1
0000000145c42be9  ba08000000             mov edx, 8
0000000145c42bee  e878815000             call 0x14614ad6b
0000000145c42bf3  0f0b                   ud2

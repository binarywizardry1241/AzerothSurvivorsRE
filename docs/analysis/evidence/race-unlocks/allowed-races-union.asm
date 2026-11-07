0000000145a97aa0  55                     push rbp
0000000145a97aa1  4157                   push r15
0000000145a97aa3  4156                   push r14
0000000145a97aa5  4154                   push r12
0000000145a97aa7  56                     push rsi
0000000145a97aa8  57                     push rdi
0000000145a97aa9  53                     push rbx
0000000145a97aaa  4883ec40               sub rsp, 0x40
0000000145a97aae  488d6c2440             lea rbp, [rsp + 0x40]
0000000145a97ab3  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145a97abb  4889d7                 mov rdi, rdx
0000000145a97abe  4889ce                 mov rsi, rcx
0000000145a97ac1  41fec8                 dec r8b
0000000145a97ac4  4180f80a               cmp r8b, 0xa
0000000145a97ac8  771f                   ja 0x145a97ae9
0000000145a97aca  410fb6c0               movzx eax, r8b
0000000145a97ace  c1e003                 shl eax, 3
0000000145a97ad1  488d0d28e94e01         lea rcx, [rip + 0x14ee928]
0000000145a97ad8  488b1c08               mov rbx, qword ptr [rax + rcx]
0000000145a97adc  488d0dc5e94e01         lea rcx, [rip + 0x14ee9c5]
0000000145a97ae3  4c8b3408               mov r14, qword ptr [rax + rcx]
0000000145a97ae7  eb0c                   jmp 0x145a97af5
0000000145a97ae9  4c8d35e8e44e01         lea r14, [rip + 0x14ee4e8]
0000000145a97af0  bb01000000             mov ebx, 1
0000000145a97af5  e806a756fa             call 0x140002200
0000000145a97afa  ba01000000             mov edx, 1
0000000145a97aff  4889d9                 mov rcx, rbx
0000000145a97b02  e8b9a656fa             call 0x1400021c0
0000000145a97b07  4885c0                 test rax, rax
0000000145a97b0a  0f84e1000000           je 0x145a97bf1
0000000145a97b10  48895de0               mov qword ptr [rbp - 0x20], rbx
0000000145a97b14  488945e8               mov qword ptr [rbp - 0x18], rax
0000000145a97b18  4889c1                 mov rcx, rax
0000000145a97b1b  4c89f2                 mov rdx, r14
0000000145a97b1e  4989d8                 mov r8, rbx
0000000145a97b21  e885bf5000             call 0x145fa3aab
0000000145a97b26  48895df0               mov qword ptr [rbp - 0x10], rbx
0000000145a97b2a  4c8bb748010000         mov r14, qword ptr [rdi + 0x148]
0000000145a97b31  4d85f6                 test r14, r14
0000000145a97b34  0f8496000000           je 0x145a97bd0
0000000145a97b3a  4c8bbf40010000         mov r15, qword ptr [rdi + 0x140]
0000000145a97b41  4d01fe                 add r14, r15
0000000145a97b44  488d7de0               lea rdi, [rbp - 0x20]
0000000145a97b48  eb1d                   jmp 0x145a97b67
0000000145a97b4a  660f1f440000           nop word ptr [rax + rax]
0000000145a97b50  488b45e8               mov rax, qword ptr [rbp - 0x18]
0000000145a97b54  42881c20               mov byte ptr [rax + r12], bl
0000000145a97b58  49ffc4                 inc r12
0000000145a97b5b  4c8965f0               mov qword ptr [rbp - 0x10], r12
0000000145a97b5f  49ffc7                 inc r15
0000000145a97b62  4d39f7                 cmp r15, r14
0000000145a97b65  7469                   je 0x145a97bd0
0000000145a97b67  410fb61f               movzx ebx, byte ptr [r15]
0000000145a97b6b  488b55e8               mov rdx, qword ptr [rbp - 0x18]
0000000145a97b6f  4c8b45f0               mov r8, qword ptr [rbp - 0x10]
0000000145a97b73  4983f80f               cmp r8, 0xf
0000000145a97b77  7727                   ja 0x145a97ba0
0000000145a97b79  31c0                   xor eax, eax
0000000145a97b7b  4d85c0                 test r8, r8
0000000145a97b7e  7428                   je 0x145a97ba8
0000000145a97b80  381c02                 cmp byte ptr [rdx + rax], bl
0000000145a97b83  743e                   je 0x145a97bc3
0000000145a97b85  48ffc0                 inc rax
0000000145a97b88  4939c0                 cmp r8, rax
0000000145a97b8b  75f3                   jne 0x145a97b80
0000000145a97b8d  31c0                   xor eax, eax
0000000145a97b8f  4883f801               cmp rax, 1
0000000145a97b93  74ca                   je 0x145a97b5f
0000000145a97b95  eb17                   jmp 0x145a97bae
0000000145a97b97  660f1f840000000000     nop word ptr [rax + rax]
0000000145a97ba0  89d9                   mov ecx, ebx
0000000145a97ba2  e889764e00             call 0x145f7f230
0000000145a97ba7  90                     nop
0000000145a97ba8  4883f801               cmp rax, 1
0000000145a97bac  74b1                   je 0x145a97b5f
0000000145a97bae  4c8b65f0               mov r12, qword ptr [rbp - 0x10]
0000000145a97bb2  4c3b65e0               cmp r12, qword ptr [rbp - 0x20]
0000000145a97bb6  7598                   jne 0x145a97b50
0000000145a97bb8  4889f9                 mov rcx, rdi
0000000145a97bbb  e8a0306b00             call 0x14614ac60
0000000145a97bc0  90                     nop
0000000145a97bc1  eb8d                   jmp 0x145a97b50
0000000145a97bc3  b801000000             mov eax, 1
0000000145a97bc8  4883f801               cmp rax, 1
0000000145a97bcc  7491                   je 0x145a97b5f
0000000145a97bce  ebde                   jmp 0x145a97bae
0000000145a97bd0  488b45f0               mov rax, qword ptr [rbp - 0x10]
0000000145a97bd4  48894610               mov qword ptr [rsi + 0x10], rax
0000000145a97bd8  0f1045e0               movups xmm0, xmmword ptr [rbp - 0x20]
0000000145a97bdc  0f1106                 movups xmmword ptr [rsi], xmm0
0000000145a97bdf  4889f0                 mov rax, rsi
0000000145a97be2  4883c440               add rsp, 0x40
0000000145a97be6  5b                     pop rbx
0000000145a97be7  5f                     pop rdi
0000000145a97be8  5e                     pop rsi
0000000145a97be9  415c                   pop r12
0000000145a97beb  415e                   pop r14
0000000145a97bed  415f                   pop r15
0000000145a97bef  5d                     pop rbp
0000000145a97bf0  c3                     ret
0000000145a97bf1  b901000000             mov ecx, 1
0000000145a97bf6  4889da                 mov rdx, rbx
0000000145a97bf9  e86d316b00             call 0x14614ad6b
0000000145a97bfe  0f0b                   ud2

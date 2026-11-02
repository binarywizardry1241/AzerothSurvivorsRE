0000000145abfe70 55                             push rbp
0000000145abfe71 4156                           push r14
0000000145abfe73 56                             push rsi
0000000145abfe74 57                             push rdi
0000000145abfe75 53                             push rbx
0000000145abfe76 4883ec40                       sub rsp, 0x40
0000000145abfe7a 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145abfe7f 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145abfe87 4889ce                         mov rsi, rcx
0000000145abfe8a 80fa03                         cmp dl, 3
0000000145abfe8d 731c                           jae 0x145abfeab
0000000145abfe8f 48c70600000000                 mov qword ptr [rsi], 0
0000000145abfe96 48c7460801000000               mov qword ptr [rsi + 8], 1
0000000145abfe9e 48c7461000000000               mov qword ptr [rsi + 0x10], 0
0000000145abfea6 e9ae000000                     jmp 0x145abff59
0000000145abfeab 4c89c7                         mov rdi, r8
0000000145abfeae 89d3                           mov ebx, edx
0000000145abfeb0 48b9abaaaaaaaaaaaaaa           movabs rcx, 0xaaaaaaaaaaaaaaab
0000000145abfeba 4c89c0                         mov rax, r8
0000000145abfebd 48f7e1                         mul rcx
0000000145abfec0 4989d6                         mov r14, rdx
0000000145abfec3 e8382354fa                     call 0x140002200
0000000145abfec8 b901000000                     mov ecx, 1
0000000145abfecd ba01000000                     mov edx, 1
0000000145abfed2 e8e92254fa                     call 0x1400021c0
0000000145abfed7 4885c0                         test rax, rax
0000000145abfeda 0f8487000000                   je 0x145abff67
0000000145abfee0 49d1ee                         shr r14, 1
0000000145abfee3 4b8d0c76                       lea rcx, [r14 + r14*2]
0000000145abfee7 4829cf                         sub rdi, rcx
0000000145abfeea 488d0d21a15001                 lea rcx, [rip + 0x150a121]
0000000145abfef1 0fb6140f                       movzx edx, byte ptr [rdi + rcx]
0000000145abfef5 8810                           mov byte ptr [rax], dl
0000000145abfef7 48c745e001000000               mov qword ptr [rbp - 0x20], 1
0000000145abfeff 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145abff03 48c745f001000000               mov qword ptr [rbp - 0x10], 1
0000000145abff0b 80fb04                         cmp bl, 4
0000000145abff0e 7632                           jbe 0x145abff42
0000000145abff10 4183e601                       and r14d, 1
0000000145abff14 4a8d0437                       lea rax, [rdi + r14]
0000000145abff18 48ffc0                         inc rax
0000000145abff1b 4889c2                         mov rdx, rax
0000000145abff1e 4883ea03                       sub rdx, 3
0000000145abff22 480f42d0                       cmovb rdx, rax
0000000145abff26 8a1c0a                         mov bl, byte ptr [rdx + rcx]
0000000145abff29 488d4de0                       lea rcx, [rbp - 0x20]
0000000145abff2d e87eba5500                     call 0x14601b9b0
0000000145abff32 90                             nop
0000000145abff33 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145abff37 885801                         mov byte ptr [rax + 1], bl
0000000145abff3a 48c745f002000000               mov qword ptr [rbp - 0x10], 2
0000000145abff42 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145abff46 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145abff4a 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145abff4e 488906                         mov qword ptr [rsi], rax
0000000145abff51 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145abff55 48894608                       mov qword ptr [rsi + 8], rax
0000000145abff59 4889f0                         mov rax, rsi
0000000145abff5c 4883c440                       add rsp, 0x40
0000000145abff60 5b                             pop rbx
0000000145abff61 5f                             pop rdi
0000000145abff62 5e                             pop rsi
0000000145abff63 415e                           pop r14
0000000145abff65 5d                             pop rbp
0000000145abff66 c3                             ret
0000000145abff67 b901000000                     mov ecx, 1
0000000145abff6c ba01000000                     mov edx, 1
0000000145abff71 e82b416d00                     call 0x1461940a1
0000000145abff76 0f0b                           ud2

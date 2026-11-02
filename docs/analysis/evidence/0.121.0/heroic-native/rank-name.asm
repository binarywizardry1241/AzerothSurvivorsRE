0000000145ac00b0 4157                           push r15
0000000145ac00b2 4156                           push r14
0000000145ac00b4 56                             push rsi
0000000145ac00b5 57                             push rdi
0000000145ac00b6 53                             push rbx
0000000145ac00b7 4881eca0000000                 sub rsp, 0xa0
0000000145ac00be 4889ce                         mov rsi, rcx
0000000145ac00c1 84d2                           test dl, dl
0000000145ac00c3 0f84fd000000                   je 0x145ac01c6
0000000145ac00c9 89d3                           mov ebx, edx
0000000145ac00cb 488d3d6c9f5001                 lea rdi, [rip + 0x1509f6c]
0000000145ac00d2 41be06000000                   mov r14d, 6
0000000145ac00d8 ba06000000                     mov edx, 6
0000000145ac00dd 4889f9                         mov rcx, rdi
0000000145ac00e0 e87bae0200                     call 0x145aeaf60
0000000145ac00e5 4885c0                         test rax, rax
0000000145ac00e8 480f44c7                       cmove rax, rdi
0000000145ac00ec 490f44d6                       cmove rdx, r14
0000000145ac00f0 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145ac00f5 4889542428                     mov qword ptr [rsp + 0x28], rdx
0000000145ac00fa 488d05439f5001                 lea rax, [rip + 0x1509f43]
0000000145ac0101 4889442440                     mov qword ptr [rsp + 0x40], rax
0000000145ac0106 48c744244801000000             mov qword ptr [rsp + 0x48], 1
0000000145ac010f 488d052f9f5001                 lea rax, [rip + 0x1509f2f]
0000000145ac0116 4889442450                     mov qword ptr [rsp + 0x50], rax
0000000145ac011b 48c744245802000000             mov qword ptr [rsp + 0x58], 2
0000000145ac0124 488d051c9f5001                 lea rax, [rip + 0x1509f1c]
0000000145ac012b 4889442460                     mov qword ptr [rsp + 0x60], rax
0000000145ac0130 48c744246803000000             mov qword ptr [rsp + 0x68], 3
0000000145ac0139 488d050a9f5001                 lea rax, [rip + 0x1509f0a]
0000000145ac0140 4889442470                     mov qword ptr [rsp + 0x70], rax
0000000145ac0145 48c744247802000000             mov qword ptr [rsp + 0x78], 2
0000000145ac014e 488d05f79e5001                 lea rax, [rip + 0x1509ef7]
0000000145ac0155 4889842480000000               mov qword ptr [rsp + 0x80], rax
0000000145ac015d 48c784248800000001000000       mov qword ptr [rsp + 0x88], 1
0000000145ac0169 0fb6cb                         movzx ecx, bl
0000000145ac016c 80fb06                         cmp bl, 6
0000000145ac016f 0f83e4000000                   jae 0x145ac0259
0000000145ac0175 c1e104                         shl ecx, 4
0000000145ac0178 0f10440c30                     movups xmm0, xmmword ptr [rsp + rcx + 0x30]
0000000145ac017d 0f11842490000000               movups xmmword ptr [rsp + 0x90], xmm0
0000000145ac0185 488d442420                     lea rax, [rsp + 0x20]
0000000145ac018a 4889442430                     mov qword ptr [rsp + 0x30], rax
0000000145ac018f 488d052a1f54fa                 lea rax, [rip - 0x5abe0d6]
0000000145ac0196 4889442438                     mov qword ptr [rsp + 0x38], rax
0000000145ac019b 488d8c2490000000               lea rcx, [rsp + 0x90]
0000000145ac01a3 48894c2440                     mov qword ptr [rsp + 0x40], rcx
0000000145ac01a8 4889442448                     mov qword ptr [rsp + 0x48], rax
0000000145ac01ad 488d15b49e5001                 lea rdx, [rip + 0x1509eb4]
0000000145ac01b4 4c8d442430                     lea r8, [rsp + 0x30]
0000000145ac01b9 4889f1                         mov rcx, rsi
0000000145ac01bc e8afe74f00                     call 0x145fbe970
0000000145ac01c1 e981000000                     jmp 0x145ac0247
0000000145ac01c6 488d3d6b9e5001                 lea rdi, [rip + 0x1509e6b]
0000000145ac01cd bb06000000                     mov ebx, 6
0000000145ac01d2 ba06000000                     mov edx, 6
0000000145ac01d7 4889f9                         mov rcx, rdi
0000000145ac01da e881ad0200                     call 0x145aeaf60
0000000145ac01df 4885c0                         test rax, rax
0000000145ac01e2 480f44c7                       cmove rax, rdi
0000000145ac01e6 4889d7                         mov rdi, rdx
0000000145ac01e9 480f44fb                       cmove rdi, rbx
0000000145ac01ed 4885ff                         test rdi, rdi
0000000145ac01f0 7910                           jns 0x145ac0202
0000000145ac01f2 4531ff                         xor r15d, r15d
0000000145ac01f5 4c89f9                         mov rcx, r15
0000000145ac01f8 4889fa                         mov rdx, rdi
0000000145ac01fb e8bb3e6d00                     call 0x1461940bb
0000000145ac0200 0f0b                           ud2
0000000145ac0202 7433                           je 0x145ac0237
0000000145ac0204 4989c6                         mov r14, rax
0000000145ac0207 e8f41f54fa                     call 0x140002200
0000000145ac020c 41bf01000000                   mov r15d, 1
0000000145ac0212 ba01000000                     mov edx, 1
0000000145ac0217 4889f9                         mov rcx, rdi
0000000145ac021a e8a11f54fa                     call 0x1400021c0
0000000145ac021f 4885c0                         test rax, rax
0000000145ac0222 74d1                           je 0x145ac01f5
0000000145ac0224 4889c3                         mov rbx, rax
0000000145ac0227 4889c1                         mov rcx, rax
0000000145ac022a 4c89f2                         mov rdx, r14
0000000145ac022d 4989f8                         mov r8, rdi
0000000145ac0230 e8e6b95200                     call 0x145febc1b
0000000145ac0235 eb05                           jmp 0x145ac023c
0000000145ac0237 bb01000000                     mov ebx, 1
0000000145ac023c 48893e                         mov qword ptr [rsi], rdi
0000000145ac023f 48895e08                       mov qword ptr [rsi + 8], rbx
0000000145ac0243 48897e10                       mov qword ptr [rsi + 0x10], rdi
0000000145ac0247 4889f0                         mov rax, rsi
0000000145ac024a 4881c4a0000000                 add rsp, 0xa0
0000000145ac0251 5b                             pop rbx
0000000145ac0252 5f                             pop rdi
0000000145ac0253 5e                             pop rsi
0000000145ac0254 415e                           pop r14
0000000145ac0256 415f                           pop r15
0000000145ac0258 c3                             ret
0000000145ac0259 4c8d05f09d5001                 lea r8, [rip + 0x1509df0]
0000000145ac0260 ba06000000                     mov edx, 6
0000000145ac0265 e8e9416d00                     call 0x146194453
0000000145ac026a 0f0b                           ud2

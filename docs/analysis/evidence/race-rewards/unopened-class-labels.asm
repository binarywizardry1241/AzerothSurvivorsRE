000000014011dd50  55                     push rbp
000000014011dd51  4157                   push r15
000000014011dd53  4156                   push r14
000000014011dd55  4155                   push r13
000000014011dd57  4154                   push r12
000000014011dd59  56                     push rsi
000000014011dd5a  57                     push rdi
000000014011dd5b  53                     push rbx
000000014011dd5c  4883ec68               sub rsp, 0x68
000000014011dd60  488d6c2460             lea rbp, [rsp + 0x60]
000000014011dd65  48c74500feffffff       mov qword ptr [rbp], 0xfffffffffffffffe
000000014011dd6d  4889ce                 mov rsi, rcx
000000014011dd70  488b0a                 mov rcx, qword ptr [rdx]
000000014011dd73  4c8b6a08               mov r13, qword ptr [rdx + 8]
000000014011dd77  4c39e9                 cmp rcx, r13
000000014011dd7a  0f84fd010000           je 0x14011df7d
000000014011dd80  488b4210               mov rax, qword ptr [rdx + 0x10]
000000014011dd84  488945c8               mov qword ptr [rbp - 0x38], rax
000000014011dd88  0fb64050               movzx eax, byte ptr [rax + 0x50]
000000014011dd8c  4c8d05e5270806         lea r8, [rip + 0x60827e5]
000000014011dd93  4c8d255e290706         lea r12, [rip + 0x607295e]
000000014011dd9a  488d3daf290706         lea rdi, [rip + 0x60729af]
000000014011dda1  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
000000014011ddb0  440fb6998c000000       movzx r11d, byte ptr [rcx + 0x8c]
000000014011ddb8  41fecb                 dec r11b
000000014011ddbb  41b901000000           mov r9d, 1
000000014011ddc1  4d89c2                 mov r10, r8
000000014011ddc4  4180fb0a               cmp r11b, 0xa
000000014011ddc8  7710                   ja 0x14011ddda
000000014011ddca  450fb6d3               movzx r10d, r11b
000000014011ddce  41c1e203               shl r10d, 3
000000014011ddd2  4f8b0c22               mov r9, qword ptr [r10 + r12]
000000014011ddd6  4d8b143a               mov r10, qword ptr [r10 + rdi]
000000014011ddda  4c8db990000000         lea r15, [rcx + 0x90]
000000014011dde1  49ffc9                 dec r9
000000014011dde4  4531db                 xor r11d, r11d
000000014011dde7  660f1f840000000000     nop word ptr [rax + rax]
000000014011ddf0  430fb61c1a             movzx ebx, byte ptr [r10 + r11]
000000014011ddf5  38c3                   cmp bl, al
000000014011ddf7  7409                   je 0x14011de02
000000014011ddf9  4d39d9                 cmp r9, r11
000000014011ddfc  4d8d5b01               lea r11, [r11 + 1]
000000014011de00  75ee                   jne 0x14011ddf0
000000014011de02  38c3                   cmp bl, al
000000014011de04  750d                   jne 0x14011de13
000000014011de06  4c89f9                 mov rcx, r15
000000014011de09  4d39ef                 cmp r15, r13
000000014011de0c  75a2                   jne 0x14011ddb0
000000014011de0e  e96a010000             jmp 0x14011df7d
000000014011de13  4c893a                 mov qword ptr [rdx], r15
000000014011de16  e8450b9605             call 0x145a7e960
000000014011de1b  4885c0                 test rax, rax
000000014011de1e  0f8459010000           je 0x14011df7d
000000014011de24  4889c3                 mov rbx, rax
000000014011de27  4989d6                 mov r14, rdx
000000014011de2a  e8d143eeff             call 0x140002200
000000014011de2f  b940000000             mov ecx, 0x40
000000014011de34  ba08000000             mov edx, 8
000000014011de39  e88243eeff             call 0x1400021c0
000000014011de3e  4885c0                 test rax, rax
000000014011de41  0f8461010000           je 0x14011dfa8
000000014011de47  488918                 mov qword ptr [rax], rbx
000000014011de4a  4c897008               mov qword ptr [rax + 8], r14
000000014011de4e  48c745e004000000       mov qword ptr [rbp - 0x20], 4
000000014011de56  488945d8               mov qword ptr [rbp - 0x28], rax
000000014011de5a  488945e8               mov qword ptr [rbp - 0x18], rax
000000014011de5e  48c745f001000000       mov qword ptr [rbp - 0x10], 1
000000014011de66  4d39ef                 cmp r15, r13
000000014011de69  0f84f5000000           je 0x14011df64
000000014011de6f  b801000000             mov eax, 1
000000014011de74  488945f8               mov qword ptr [rbp - 8], rax
000000014011de78  488d1df9260806         lea rbx, [rip + 0x60826f9]
000000014011de7f  488b45c8               mov rax, qword ptr [rbp - 0x38]
000000014011de83  0fb64050               movzx eax, byte ptr [rax + 0x50]
000000014011de87  4c89f9                 mov rcx, r15
000000014011de8a  660f1f440000           nop word ptr [rax + rax]
000000014011de90  440fb6898c000000       movzx r9d, byte ptr [rcx + 0x8c]
000000014011de98  41fec9                 dec r9b
000000014011de9b  ba01000000             mov edx, 1
000000014011dea0  4989d8                 mov r8, rbx
000000014011dea3  4180f90a               cmp r9b, 0xa
000000014011dea7  7710                   ja 0x14011deb9
000000014011dea9  450fb6c1               movzx r8d, r9b
000000014011dead  41c1e003               shl r8d, 3
000000014011deb1  4b8b1420               mov rdx, qword ptr [r8 + r12]
000000014011deb5  4d8b0438               mov r8, qword ptr [r8 + rdi]
000000014011deb9  4c8db990000000         lea r15, [rcx + 0x90]
000000014011dec0  48ffca                 dec rdx
000000014011dec3  4531c9                 xor r9d, r9d
000000014011dec6  662e0f1f840000000000   nop word ptr cs:[rax + rax]
000000014011ded0  470fb61408             movzx r10d, byte ptr [r8 + r9]
000000014011ded5  4138c2                 cmp r10b, al
000000014011ded8  7409                   je 0x14011dee3
000000014011deda  4c39ca                 cmp rdx, r9
000000014011dedd  4d8d4901               lea r9, [r9 + 1]
000000014011dee1  75ed                   jne 0x14011ded0
000000014011dee3  4138c2                 cmp r10b, al
000000014011dee6  750a                   jne 0x14011def2
000000014011dee8  4c89f9                 mov rcx, r15
000000014011deeb  4d39ef                 cmp r15, r13
000000014011deee  75a0                   jne 0x14011de90
000000014011def0  eb72                   jmp 0x14011df64
000000014011def2  e8690a9605             call 0x145a7e960
000000014011def7  488955d0               mov qword ptr [rbp - 0x30], rdx
000000014011defb  4989c6                 mov r14, rax
000000014011defe  4885c0                 test rax, rax
000000014011df01  7461                   je 0x14011df64
000000014011df03  488b55f8               mov rdx, qword ptr [rbp - 8]
000000014011df07  483b55e0               cmp rdx, qword ptr [rbp - 0x20]
000000014011df0b  752b                   jne 0x14011df38
000000014011df0d  48c744242010000000     mov qword ptr [rsp + 0x20], 0x10
000000014011df16  41b801000000           mov r8d, 1
000000014011df1c  41b908000000           mov r9d, 8
000000014011df22  488d4de0               lea rcx, [rbp - 0x20]
000000014011df26  e8955fe805             call 0x145fa3ec0
000000014011df2b  90                     nop
000000014011df2c  488b45e8               mov rax, qword ptr [rbp - 0x18]
000000014011df30  488945d8               mov qword ptr [rbp - 0x28], rax
000000014011df34  488b55f8               mov rdx, qword ptr [rbp - 8]
000000014011df38  4889d0                 mov rax, rdx
000000014011df3b  48c1e004               shl rax, 4
000000014011df3f  488b4dd8               mov rcx, qword ptr [rbp - 0x28]
000000014011df43  4c893401               mov qword ptr [rcx + rax], r14
000000014011df47  4c8b45d0               mov r8, qword ptr [rbp - 0x30]
000000014011df4b  4c89440108             mov qword ptr [rcx + rax + 8], r8
000000014011df50  48ffc2                 inc rdx
000000014011df53  488955f8               mov qword ptr [rbp - 8], rdx
000000014011df57  488955f0               mov qword ptr [rbp - 0x10], rdx
000000014011df5b  4d39ef                 cmp r15, r13
000000014011df5e  0f851bffffff           jne 0x14011de7f
000000014011df64  488b45f0               mov rax, qword ptr [rbp - 0x10]
000000014011df68  48894610               mov qword ptr [rsi + 0x10], rax
000000014011df6c  488b45e0               mov rax, qword ptr [rbp - 0x20]
000000014011df70  488906                 mov qword ptr [rsi], rax
000000014011df73  488b45e8               mov rax, qword ptr [rbp - 0x18]
000000014011df77  48894608               mov qword ptr [rsi + 8], rax
000000014011df7b  eb17                   jmp 0x14011df94
000000014011df7d  48c70600000000         mov qword ptr [rsi], 0
000000014011df84  48c7460808000000       mov qword ptr [rsi + 8], 8
000000014011df8c  48c7461000000000       mov qword ptr [rsi + 0x10], 0
000000014011df94  4889f0                 mov rax, rsi
000000014011df97  4883c468               add rsp, 0x68
000000014011df9b  5b                     pop rbx
000000014011df9c  5f                     pop rdi
000000014011df9d  5e                     pop rsi
000000014011df9e  415c                   pop r12
000000014011dfa0  415d                   pop r13
000000014011dfa2  415e                   pop r14
000000014011dfa4  415f                   pop r15
000000014011dfa6  5d                     pop rbp
000000014011dfa7  c3                     ret
000000014011dfa8  b908000000             mov ecx, 8
000000014011dfad  ba40000000             mov edx, 0x40
000000014011dfb2  e8b4cd0206             call 0x14614ad6b
000000014011dfb7  0f0b                   ud2

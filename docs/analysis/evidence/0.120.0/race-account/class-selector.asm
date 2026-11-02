0000000145a8bf80  55                     push rbp
0000000145a8bf81  56                     push rsi
0000000145a8bf82  57                     push rdi
0000000145a8bf83  4883ec50               sub rsp, 0x50
0000000145a8bf87  488d6c2450             lea rbp, [rsp + 0x50]
0000000145a8bf8c  48c745f8feffffff       mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145a8bf94  4489c7                 mov edi, r8d
0000000145a8bf97  4189d0                 mov r8d, edx
0000000145a8bf9a  4889ca                 mov rdx, rcx
0000000145a8bf9d  488d4dd8               lea rcx, [rbp - 0x28]
0000000145a8bfa1  e8faba0000             call 0x145a97aa0
0000000145a8bfa6  488b55e0               mov rdx, qword ptr [rbp - 0x20]
0000000145a8bfaa  488b75e8               mov rsi, qword ptr [rbp - 0x18]
0000000145a8bfae  4883fe0f               cmp rsi, 0xf
0000000145a8bfb2  488955f0               mov qword ptr [rbp - 0x10], rdx
0000000145a8bfb6  7728                   ja 0x145a8bfe0
0000000145a8bfb8  31c0                   xor eax, eax
0000000145a8bfba  4885f6                 test rsi, rsi
0000000145a8bfbd  742c                   je 0x145a8bfeb
0000000145a8bfbf  31c9                   xor ecx, ecx
0000000145a8bfc1  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0000000145a8bfd0  40383c0a               cmp byte ptr [rdx + rcx], dil
0000000145a8bfd4  743d                   je 0x145a8c013
0000000145a8bfd6  48ffc1                 inc rcx
0000000145a8bfd9  4839ce                 cmp rsi, rcx
0000000145a8bfdc  75f2                   jne 0x145a8bfd0
0000000145a8bfde  eb0b                   jmp 0x145a8bfeb
0000000145a8bfe0  89f9                   mov ecx, edi
0000000145a8bfe2  4989f0                 mov r8, rsi
0000000145a8bfe5  e846324f00             call 0x145f7f230
0000000145a8bfea  90                     nop
0000000145a8bfeb  4883f801               cmp rax, 1
0000000145a8bfef  752d                   jne 0x145a8c01e
0000000145a8bff1  488b4df0               mov rcx, qword ptr [rbp - 0x10]
0000000145a8bff5  488b55d8               mov rdx, qword ptr [rbp - 0x28]
0000000145a8bff9  4885d2                 test rdx, rdx
0000000145a8bffc  740b                   je 0x145a8c009
0000000145a8bffe  41b801000000           mov r8d, 1
0000000145a8c004  e8c76157fa             call 0x1400021d0
0000000145a8c009  89f8                   mov eax, edi
0000000145a8c00b  4883c450               add rsp, 0x50
0000000145a8c00f  5f                     pop rdi
0000000145a8c010  5e                     pop rsi
0000000145a8c011  5d                     pop rbp
0000000145a8c012  c3                     ret
0000000145a8c013  b801000000             mov eax, 1
0000000145a8c018  4883f801               cmp rax, 1
0000000145a8c01c  74d3                   je 0x145a8bff1
0000000145a8c01e  4080ff07               cmp dil, 7
0000000145a8c022  7773                   ja 0x145a8c097
0000000145a8c024  400fb6cf               movzx ecx, dil
0000000145a8c028  b001                   mov al, 1
0000000145a8c02a  ba9a000000             mov edx, 0x9a
0000000145a8c02f  0fa3ca                 bt edx, ecx
0000000145a8c032  7363                   jae 0x145a8c097
0000000145a8c034  4531d2                 xor r10d, r10d
0000000145a8c037  41b89a000000           mov r8d, 0x9a
0000000145a8c03d  488b4df0               mov rcx, qword ptr [rbp - 0x10]
0000000145a8c041  eb0d                   jmp 0x145a8c050
0000000145a8c043  41b101                 mov r9b, 1
0000000145a8c046  4d8d5301               lea r10, [r11 + 1]
0000000145a8c04a  4438c8                 cmp al, r9b
0000000145a8c04d  7525                   jne 0x145a8c074
0000000145a8c04f  90                     nop
0000000145a8c050  4d89d3                 mov r11, r10
0000000145a8c053  4c39d6                 cmp rsi, r10
0000000145a8c056  741c                   je 0x145a8c074
0000000145a8c058  420fb61419             movzx edx, byte ptr [rcx + r11]
0000000145a8c05d  83fa07                 cmp edx, 7
0000000145a8c060  77e1                   ja 0x145a8c043
0000000145a8c062  410fa3d0               bt r8d, edx
0000000145a8c066  73db                   jae 0x145a8c043
0000000145a8c068  4531c9                 xor r9d, r9d
0000000145a8c06b  4d8d5301               lea r10, [r11 + 1]
0000000145a8c06f  4438c8                 cmp al, r9b
0000000145a8c072  74dc                   je 0x145a8c050
0000000145a8c074  4885f6                 test rsi, rsi
0000000145a8c077  7422                   je 0x145a8c09b
0000000145a8c079  4c39de                 cmp rsi, r11
0000000145a8c07c  0fb601                 movzx eax, byte ptr [rcx]
0000000145a8c07f  0fb6fa                 movzx edi, dl
0000000145a8c082  0f44f8                 cmove edi, eax
0000000145a8c085  488b55d8               mov rdx, qword ptr [rbp - 0x28]
0000000145a8c089  4885d2                 test rdx, rdx
0000000145a8c08c  0f856cffffff           jne 0x145a8bffe
0000000145a8c092  e972ffffff             jmp 0x145a8c009
0000000145a8c097  31c0                   xor eax, eax
0000000145a8c099  eb99                   jmp 0x145a8c034
0000000145a8c09b  4c8d05d69c4f01         lea r8, [rip + 0x14f9cd6]
0000000145a8c0a2  31c9                   xor ecx, ecx
0000000145a8c0a4  31d2                   xor edx, edx
0000000145a8c0a6  e858f06b00             call 0x14614b103
0000000145a8c0ab  90                     nop
0000000145a8c0ac  0f0b                   ud2

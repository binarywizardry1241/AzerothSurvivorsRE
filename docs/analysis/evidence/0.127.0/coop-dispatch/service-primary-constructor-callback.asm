0000000145ba6660 55                             push rbp
0000000145ba6661 4883ec60                       sub rsp, 0x60
0000000145ba6665 488d6c2460                     lea rbp, [rsp + 0x60]
0000000145ba666a 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145ba6672 4989d0                         mov r8, rdx
0000000145ba6675 4889ca                         mov rdx, rcx
0000000145ba6678 488d4dc0                       lea rcx, [rbp - 0x40]
0000000145ba667c e86f6ffdff                     call 0x145b7d5f0
0000000145ba6681 e87abb45fa                     call 0x140002200
0000000145ba6686 b938000000                     mov ecx, 0x38
0000000145ba668b ba08000000                     mov edx, 8
0000000145ba6690 e82bbb45fa                     call 0x1400021c0
0000000145ba6695 4885c0                         test rax, rax
0000000145ba6698 742c                           je 0x145ba66c6
0000000145ba669a 488b4df0                       mov rcx, qword ptr [rbp - 0x10]
0000000145ba669e 48894830                       mov qword ptr [rax + 0x30], rcx
0000000145ba66a2 0f1045c0                       movups xmm0, xmmword ptr [rbp - 0x40]
0000000145ba66a6 0f104dd0                       movups xmm1, xmmword ptr [rbp - 0x30]
0000000145ba66aa 0f1055e0                       movups xmm2, xmmword ptr [rbp - 0x20]
0000000145ba66ae 0f115020                       movups xmmword ptr [rax + 0x20], xmm2
0000000145ba66b2 0f114810                       movups xmmword ptr [rax + 0x10], xmm1
0000000145ba66b6 0f1100                         movups xmmword ptr [rax], xmm0
0000000145ba66b9 488d15b8bd4d01                 lea rdx, [rip + 0x14dbdb8]
0000000145ba66c0 4883c460                       add rsp, 0x60
0000000145ba66c4 5d                             pop rbp
0000000145ba66c5 c3                             ret 
0000000145ba66c6 b908000000                     mov ecx, 8
0000000145ba66cb ba38000000                     mov edx, 0x38
0000000145ba66d0 e87c226600                     call 0x146208951
0000000145ba66d5 90                             nop 
0000000145ba66d6 0f0b                           ud2 

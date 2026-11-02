0000000145bd1dd3 4889e9                         mov rcx, rbp
0000000145bd1dd6 e8a542f3ff                     call 0x145b06080
0000000145bd1ddb 90                             nop 
0000000145bd1ddc 488b75f0                       mov rsi, qword ptr [rbp - 0x10]
0000000145bd1de0 4c8b45f8                       mov r8, qword ptr [rbp - 8]
0000000145bd1de4 c6453701                       mov byte ptr [rbp + 0x37], 1
0000000145bd1de8 488d4db0                       lea rcx, [rbp - 0x50]
0000000145bd1dec 4889f2                         mov rdx, rsi
0000000145bd1def e8fcb7faff                     call 0x145b7d5f0
0000000145bd1df4 90                             nop 
0000000145bd1df5 e8060443fa                     call 0x140002200
0000000145bd1dfa b938000000                     mov ecx, 0x38
0000000145bd1dff ba08000000                     mov edx, 8
0000000145bd1e04 e8b70343fa                     call 0x1400021c0
0000000145bd1e09 4885c0                         test rax, rax
0000000145bd1e0c 0f845e010000                   je 0x145bd1f70
0000000145bd1e12 488b4de0                       mov rcx, qword ptr [rbp - 0x20]
0000000145bd1e16 48894830                       mov qword ptr [rax + 0x30], rcx
0000000145bd1e1a 0f1045b0                       movups xmm0, xmmword ptr [rbp - 0x50]
0000000145bd1e1e 0f104dc0                       movups xmm1, xmmword ptr [rbp - 0x40]
0000000145bd1e22 0f1055d0                       movups xmm2, xmmword ptr [rbp - 0x30]
0000000145bd1e26 0f115020                       movups xmmword ptr [rax + 0x20], xmm2
0000000145bd1e2a 0f114810                       movups xmmword ptr [rax + 0x10], xmm1
0000000145bd1e2e 0f1100                         movups xmmword ptr [rax], xmm0
0000000145bd1e31 4c8b4508                       mov r8, qword ptr [rbp + 8]
0000000145bd1e35 4c8b4d10                       mov r9, qword ptr [rbp + 0x10]
0000000145bd1e39 c6453701                       mov byte ptr [rbp + 0x37], 1
0000000145bd1e3d 488d1534064b01                 lea rdx, [rip + 0x14b0634]
0000000145bd1e44 4889c1                         mov rcx, rax
0000000145bd1e47 e8d4d80e00                     call 0x145cbf720

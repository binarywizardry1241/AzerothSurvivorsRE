0x1458add4e: e8ad4475fa               call 0x140002200
0x1458add53: b908000000               mov ecx, 8
0x1458add58: ba01000000               mov edx, 1
0x1458add5d: e85e4475fa               call 0x1400021c0
0x1458add62: 4885c0                   test rax, rax
0x1458add65: 0f84102a0000             je 0x1458b077b
0x1458add6b: 48b97375727669766f72     movabs rcx, 0x726f766976727573
0x1458add75: 488908                   mov qword ptr [rax], rcx
0x1458add78: 488b8d90030000           mov rcx, qword ptr [rbp + 0x390]
0x1458add7f: 488d95e0000000           lea rdx, [rbp + 0xe0]
0x1458add86: 48894a10                 mov qword ptr [rdx + 0x10], rcx
0x1458add8a: 0f288580030000           movaps xmm0, xmmword ptr [rbp + 0x380]
0x1458add91: 0f1102                   movups xmmword ptr [rdx], xmm0
0x1458add94: 48899da0000000           mov qword ptr [rbp + 0xa0], rbx
0x1458add9b: 4c89ada8000000           mov qword ptr [rbp + 0xa8], r13
0x1458adda2: 48c785b000000000000000   mov qword ptr [rbp + 0xb0], 0
0x1458addad: 48c785b800000001000000   mov qword ptr [rbp + 0xb8], 1
0x1458addb8: 48c785c000000000000000   mov qword ptr [rbp + 0xc0], 0
0x1458addc3: 48c785c800000008000000   mov qword ptr [rbp + 0xc8], 8
0x1458addce: 488985d0000000           mov qword ptr [rbp + 0xd0], rax
0x1458addd5: 48c785d800000008000000   mov qword ptr [rbp + 0xd8], 8

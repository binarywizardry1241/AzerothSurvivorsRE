0x1458ada1f: 4c8bbdb0000000           mov r15, qword ptr [rbp + 0xb0]
0x1458ada26: 4981ffff000000           cmp r15, 0xff
0x1458ada2d: b8ff000000               mov eax, 0xff
0x1458ada32: 490f42c7                 cmovb rax, r15
0x1458ada36: 884510                   mov byte ptr [rbp + 0x10], al

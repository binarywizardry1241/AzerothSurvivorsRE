0000000145cb84f7 31c0                           xor eax, eax
0000000145cb84f9 48b90b00000000000080           movabs rcx, 0x800000000000000b
0000000145cb8503 4839cb                         cmp rbx, rcx
0000000145cb8506 7508                           jne 0x145cb8510
0000000145cb8508 418b842428020000               mov eax, dword ptr [r12 + 0x228]
0000000145cb8510 418884242a020000               mov byte ptr [r12 + 0x22a], al
0000000145cb8518 e9a50a0000                     jmp 0x145cb8fc2

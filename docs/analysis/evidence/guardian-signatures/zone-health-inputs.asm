14599c230: 4889d7 mov rdi, rdx
14599c233: 4889ce mov rsi, rcx
14599c236: 488b8990020000 mov rcx, qword ptr [rcx + 0x290]
14599c23d: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
14599c244: e8870eefff call 0x14588d0d0
14599c249: 4c69f0f0000000 imul r14, rax, 0xf0
14599c250: 488d1d39212401 lea rbx, [rip + 0x1242139]
14599c257: f30f10b6340a0000 movss xmm6, dword ptr [rsi + 0xa34]
14599c25f: 440f28ce movaps xmm9, xmm6
14599c263: f3440f5e0dd4424500 divss xmm9, dword ptr [rip + 0x4542d4]
14599c26c: f3440f1096a80a0000 movss xmm10, dword ptr [rsi + 0xaa8]
14599c275: f3450f10841ee0000000 movss xmm8, dword ptr [r14 + rbx + 0xe0]
14599c27f: 498b941e88000000 mov rdx, qword ptr [r14 + rbx + 0x88]
14599c287: 4c8d8208020000 lea r8, [rdx + 0x208]
14599c28e: 488d4da8 lea rcx, [rbp - 0x58]
14599c292: e829230200 call 0x1459be5c0

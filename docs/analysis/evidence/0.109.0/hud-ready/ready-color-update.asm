140290b21: test     r11, r11
140290b24: je       0x140290b74
140290b26: mov      dword ptr [rbx], r14d
140290b29: mov      byte ptr [r11 + 0x175], al
140290b30: mov      rax, qword ptr [rbp + 0x158]
140290b37: movss    xmm0, dword ptr [rax + 0x5c]
140290b3c: mulss    xmm0, dword ptr [rip + 0x5b5fa2c]
140290b44: call     0x145bfa117
140290b49: andps    xmm0, xmmword ptr [rip + 0x5b0cbe0]
140290b50: mulss    xmm0, dword ptr [rip + 0x5b3c560]
140290b58: addss    xmm0, dword ptr [rip + 0x5b3c534]
140290b60: mov      dword ptr [rdi], r14d
140290b63: movupd   xmm1, xmmword ptr [rip + 0x5b60a39]
140290b6b: movupd   xmmword ptr [rsi], xmm1
140290b6f: movss    dword ptr [rsi + 0x10], xmm0

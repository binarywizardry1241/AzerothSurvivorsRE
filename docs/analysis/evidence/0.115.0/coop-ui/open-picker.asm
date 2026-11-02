; 0.115.0 SHA-256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Owner 0x1401003f0..0x1401007e5; curated slices only.

; Slice 0x140100738..0x1401007d6
0x140100738: mov byte ptr [rbp + 0x3b0], 0xa
0x14010073f: movups xmm0, xmmword ptr [rbp + 0x490]
0x140100746: movups xmm1, xmmword ptr [rbp + 0x4a0]
0x14010074d: movups xmm2, xmmword ptr [rbp + 0x4b0]
0x140100754: movups xmm3, xmmword ptr [rbp + 0x4bf]
0x14010075b: movups xmmword ptr [rbp + 0x3b1], xmm0
0x140100762: movups xmmword ptr [rbp + 0x3c1], xmm1
0x140100769: movups xmmword ptr [rbp + 0x3d1], xmm2
0x140100770: movups xmmword ptr [rbp + 0x3e0], xmm3
0x140100777: mov dword ptr [rbp + 0x3f0], 0x40000000
0x140100781: mov byte ptr [rbp + 0x3f4], 2
0x140100788: movups xmm0, xmmword ptr [rbp + 0x500]
0x14010078f: movups xmm1, xmmword ptr [rbp + 0x50b]
0x140100796: movups xmmword ptr [rbp + 0x3f5], xmm0
0x14010079d: movups xmmword ptr [rbp + 0x400], xmm1
0x1401007a4: mov qword ptr [rbp + 0x1c0], r14
0x1401007ab: lea r9, [rip + 0x5de038e]
0x1401007b2: lea rbx, [rbp + 0x410]
0x1401007b9: lea r8, [rbp + 0x1c0]
0x1401007c0: mov rcx, rbx
0x1401007c3: mov rdx, rdi
0x1401007c6: call 0x1402c5bc0
0x1401007cb: mov rcx, rbx
0x1401007ce: mov rdx, rsi
0x1401007d1: call 0x140324990

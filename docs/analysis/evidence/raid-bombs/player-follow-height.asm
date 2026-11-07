14594f1b5: 498b8d98090000 mov rcx, qword ptr [r13 + 0x998]
14594f1bc: 4883c110 add rcx, 0x10
14594f1c0: f2450f108dc8040000 movsd xmm9, qword ptr [r13 + 0x4c8]
14594f1c9: f3450f16d1 movshdup xmm10, xmm9
14594f1ce: f3410f10b5d0040000 movss xmm6, dword ptr [r13 + 0x4d0]
14594f1d7: 410f28c9 movaps xmm1, xmm9
14594f1db: 410f28d2 movaps xmm2, xmm10
14594f1df: e8ac7df8ff call 0x1458d6f90
14594f1e4: f30f118528020000 movss dword ptr [rbp + 0x228], xmm0
14594f1ec: a801 test al, 1
14594f1ee: 7508 jne 0x14594f1f8
14594f1f0: f30f11b528020000 movss dword ptr [rbp + 0x228], xmm6

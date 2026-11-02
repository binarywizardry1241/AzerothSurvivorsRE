14593b6e1: f3440f5996c00a0000 mulss xmm10, dword ptr [rsi + 0xac0]
14593b6ea: 488945e0 mov qword ptr [rbp - 0x20], rax
14593b6ee: 0f57c0 xorps xmm0, xmm0
14593b6f1: f3410f51c2 sqrtss xmm0, xmm10
14593b6f6: f3410f594558 mulss xmm0, dword ptr [r13 + 0x58]
14593b6fc: 4c8965e8 mov qword ptr [rbp - 0x18], r12
14593b700: f30f59f0 mulss xmm6, xmm0
14593b704: 0f57c0 xorps xmm0, xmm0
14593b707: 66440f61c8 punpcklwd xmm9, xmm0
14593b70c: 410f5be9 cvtdq2ps xmm5, xmm9
14593b710: f30f100d80f94700 movss xmm1, dword ptr [rip + 0x47f980]
14593b718: 410f28e0 movaps xmm4, xmm8
14593b71c: f30f59e1 mulss xmm4, xmm1
14593b720: f30f5825ec017a00 addss xmm4, dword ptr [rip + 0x7a01ec]
14593b728: f30f5d2520634b00 minss xmm4, dword ptr [rip + 0x4b6320]
14593b730: f30f10964c0a0000 movss xmm2, dword ptr [rsi + 0xa4c]
14593b738: f30f101d201b4700 movss xmm3, dword ptr [rip + 0x471b20]
14593b740: f30f58da addss xmm3, xmm2
14593b744: f30f58ca addss xmm1, xmm2
14593b748: f3450f104d5c movss xmm9, dword ptr [r13 + 0x5c]
14593b74e: 410f14f1 unpcklps xmm6, xmm9
14593b752: 0f118508010000 movups xmmword ptr [rbp + 0x108], xmm0
14593b759: 0f1185f8000000 movups xmmword ptr [rbp + 0xf8], xmm0
14593b760: 0f1185e8000000 movups xmmword ptr [rbp + 0xe8], xmm0
14593b767: 0f1185d8000000 movups xmmword ptr [rbp + 0xd8], xmm0
14593b76e: 48899db0000000 mov qword ptr [rbp + 0xb0], rbx
14593b775: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
14593b780: 4c896df0 mov qword ptr [rbp - 0x10], r13
14593b784: 4c897df8 mov qword ptr [rbp - 8], r15
14593b788: 4c896500 mov qword ptr [rbp], r12
14593b78c: 48c7450800000000 mov qword ptr [rbp + 8], 0
14593b794: c6451000 mov byte ptr [rbp + 0x10], 0
14593b798: f30f11bd18010000 movss dword ptr [rbp + 0x118], xmm7
14593b7a0: 0f5e2d19cf1b01 divps xmm5, xmmword ptr [rip + 0x11bcf19]
14593b7a7: f30f11bd1c010000 movss dword ptr [rbp + 0x11c], xmm7
14593b7af: 0f59ee mulps xmm5, xmm6
14593b7b2: 0f13ad20010000 movlps qword ptr [rbp + 0x120], xmm5
14593b7b9: c7852801000000000040 mov dword ptr [rbp + 0x128], 0x40000000
14593b7c3: f30f11a52c010000 movss dword ptr [rbp + 0x12c], xmm4
14593b7cb: f3440f118530010000 movss dword ptr [rbp + 0x130], xmm8
14593b7d4: 8b85d8010000 mov eax, dword ptr [rbp + 0x1d8]
14593b7da: 89853c010000 mov dword ptr [rbp + 0x13c], eax
14593b7e0: 488b8dd0010000 mov rcx, qword ptr [rbp + 0x1d0]
14593b7e7: 48898d34010000 mov qword ptr [rbp + 0x134], rcx
14593b7ee: 48898d40010000 mov qword ptr [rbp + 0x140], rcx
14593b7f5: 898548010000 mov dword ptr [rbp + 0x148], eax
14593b7fb: f30f11954c010000 movss dword ptr [rbp + 0x14c], xmm2
14593b803: c7855001000000000000 mov dword ptr [rbp + 0x150], 0
14593b80d: f30f119d54010000 movss dword ptr [rbp + 0x154], xmm3
14593b815: c7855801000000000040 mov dword ptr [rbp + 0x158], 0x40000000
14593b81f: 0f1185c0000000 movups xmmword ptr [rbp + 0xc0], xmm0
14593b826: 48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
14593b831: 0f11855c010000 movups xmmword ptr [rbp + 0x15c], xmm0
14593b838: f30f118d6c010000 movss dword ptr [rbp + 0x16c], xmm1
14593b840: f30f119570010000 movss dword ptr [rbp + 0x170], xmm2

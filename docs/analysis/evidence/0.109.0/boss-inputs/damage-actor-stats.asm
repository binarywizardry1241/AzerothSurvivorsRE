14596dec9: f3440f5996a80a0000 mulss xmm10, dword ptr [rsi + 0xaa8]
14596ded2: 0f57c0 xorps xmm0, xmm0
14596ded5: f3410f51c2 sqrtss xmm0, xmm10
14596deda: f3410f594558 mulss xmm0, dword ptr [r13 + 0x58]
14596dee0: f30f59f0 mulss xmm6, xmm0
14596dee4: 0f57c0 xorps xmm0, xmm0
14596dee7: 66440f61c0 punpcklwd xmm8, xmm0
14596deec: f30f100dd46d4600 movss xmm1, dword ptr [rip + 0x466dd4]
14596def4: 410f28e1 movaps xmm4, xmm9
14596def8: f30f59e1 mulss xmm4, xmm1
14596defc: f30f5825c0157600 addss xmm4, dword ptr [rip + 0x7615c0]
14596df04: f30f5d25e49a4700 minss xmm4, dword ptr [rip + 0x479ae4]
14596df0c: 410f5be8 cvtdq2ps xmm5, xmm8
14596df10: f30f1096340a0000 movss xmm2, dword ptr [rsi + 0xa34]
14596df18: f30f101d80f34200 movss xmm3, dword ptr [rip + 0x42f380]
14596df20: f30f58da addss xmm3, xmm2
14596df24: f30f58ca addss xmm1, xmm2
14596df28: f3450f10455c movss xmm8, dword ptr [r13 + 0x5c]
14596df2e: 410f14f0 unpcklps xmm6, xmm8
14596df32: 0f118508010000 movups xmmword ptr [rbp + 0x108], xmm0
14596df39: 0f1185f8000000 movups xmmword ptr [rbp + 0xf8], xmm0
14596df40: 0f1185e8000000 movups xmmword ptr [rbp + 0xe8], xmm0
14596df47: 0f1185d8000000 movups xmmword ptr [rbp + 0xd8], xmm0
14596df4e: 48899db0000000 mov qword ptr [rbp + 0xb0], rbx
14596df55: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
14596df60: 4c896df0 mov qword ptr [rbp - 0x10], r13
14596df64: 4c897df8 mov qword ptr [rbp - 8], r15
14596df68: 4c896500 mov qword ptr [rbp], r12
14596df6c: 48c7450800000000 mov qword ptr [rbp + 8], 0
14596df74: c6451000 mov byte ptr [rbp + 0x10], 0
14596df78: f30f11bd18010000 movss dword ptr [rbp + 0x118], xmm7
14596df80: f30f11bd1c010000 movss dword ptr [rbp + 0x11c], xmm7
14596df88: 0f5e2d318d1701 divps xmm5, xmmword ptr [rip + 0x1178d31]
14596df8f: 0f59ee mulps xmm5, xmm6
14596df92: 0f13ad20010000 movlps qword ptr [rbp + 0x120], xmm5
14596df99: c7852801000000000040 mov dword ptr [rbp + 0x128], 0x40000000
14596dfa3: f30f11a52c010000 movss dword ptr [rbp + 0x12c], xmm4
14596dfab: f3440f118d30010000 movss dword ptr [rbp + 0x130], xmm9
14596dfb4: 8b85d8010000 mov eax, dword ptr [rbp + 0x1d8]
14596dfba: 89853c010000 mov dword ptr [rbp + 0x13c], eax
14596dfc0: 488b8dd0010000 mov rcx, qword ptr [rbp + 0x1d0]
14596dfc7: 48898d34010000 mov qword ptr [rbp + 0x134], rcx
14596dfce: 48898d40010000 mov qword ptr [rbp + 0x140], rcx
14596dfd5: 898548010000 mov dword ptr [rbp + 0x148], eax
14596dfdb: f30f11954c010000 movss dword ptr [rbp + 0x14c], xmm2
14596dfe3: c7855001000000000000 mov dword ptr [rbp + 0x150], 0
14596dfed: f30f119d54010000 movss dword ptr [rbp + 0x154], xmm3
14596dff5: c7855801000000000040 mov dword ptr [rbp + 0x158], 0x40000000
14596dfff: 0f1185c0000000 movups xmmword ptr [rbp + 0xc0], xmm0
14596e006: 48c785d000000000000000 mov qword ptr [rbp + 0xd0], 0
14596e011: 0f11855c010000 movups xmmword ptr [rbp + 0x15c], xmm0
14596e018: f30f118d6c010000 movss dword ptr [rbp + 0x16c], xmm1
14596e020: f30f119570010000 movss dword ptr [rbp + 0x170], xmm2

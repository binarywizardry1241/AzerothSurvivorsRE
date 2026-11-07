1458d0ed0: mov        rax, rcx
1458d0ed3: movsd      xmm0, qword ptr [rdx + 0xc8]
1458d0edb: movss      xmm1, dword ptr [rdx + 0xd0]
1458d0ee3: mov        rcx, qword ptr [rdx + 0x10]
1458d0ee7: add        rcx, -2
1458d0eeb: cmp        rcx, 6
1458d0eef: ja         0x1458d1033
1458d0ef5: lea        r8, [rip + 0x162d97c]
1458d0efc: movsxd     rcx, dword ptr [r8 + rcx*4]
1458d0f00: add        rcx, r8
1458d0f03: jmp        rcx
1458d0f05: mov        rcx, qword ptr [rdx + 8]
1458d0f09: cmp        word ptr [rcx], 0x6d73
1458d0f0e: jne        0x1458d1033
1458d0f14: movsd      xmm0, qword ptr [rip + 0x16271c4]
1458d0f1c: movaps     xmm3, xmmword ptr [rip + 0x16271cd]
1458d0f23: movaps     xmm2, xmmword ptr [rip + 0x16271d6]
1458d0f2a: xorps      xmm4, xmm4
1458d0f2d: movss      xmm1, dword ptr [rip + 0xc8b04f]
1458d0f35: jmp        0x1458d105e
1458d0f3a: mov        rcx, qword ptr [rdx + 8]
1458d0f3e: mov        r8d, 0x6e657261
1458d0f44: xor        r8d, dword ptr [rcx]
1458d0f47: movzx      ecx, byte ptr [rcx + 4]
1458d0f4b: xor        ecx, 0x61
1458d0f4e: or         ecx, r8d
1458d0f51: jne        0x1458d1033
1458d0f57: movaps     xmm3, xmmword ptr [rip + 0x1627142]
1458d0f5e: movaps     xmm2, xmmword ptr [rip + 0x162714b]
1458d0f65: xorps      xmm4, xmm4
1458d0f68: jmp        0x1458d105e
1458d0f6d: mov        rcx, qword ptr [rdx + 8]
1458d0f71: movabs     r8, 0x646f6f776b737564
1458d0f7b: cmp        qword ptr [rcx], r8
1458d0f7e: jne        0x1458d1033
1458d0f84: movsd      xmm0, qword ptr [rip + 0x16270a4]
1458d0f8c: movsd      xmm3, qword ptr [rip + 0x16270ac]
1458d0f94: movaps     xmm2, xmmword ptr [rip + 0x16270b5]
1458d0f9b: movss      xmm4, dword ptr [rip + 0x50017d]
1458d0fa3: movss      xmm1, dword ptr [rip + 0x4f45c5]
1458d0fab: jmp        0x1458d105e
1458d0fb0: mov        rcx, qword ptr [rdx + 8]
1458d0fb4: cmp        dword ptr [rcx], 0x7878616e
1458d0fba: jne        0x1458d1033
1458d0fbc: movaps     xmm3, xmmword ptr [rip + 0x16270fd]
1458d0fc3: movaps     xmm2, xmmword ptr [rip + 0x1627106]
1458d0fca: xorps      xmm4, xmm4
1458d0fcd: jmp        0x1458d105e
1458d0fd2: mov        rcx, qword ptr [rdx + 8]
1458d0fd6: mov        r8d, 0x79776c65
1458d0fdc: xor        r8d, dword ptr [rcx]
1458d0fdf: movzx      ecx, word ptr [rcx + 4]
1458d0fe3: xor        ecx, 0x6e6e
1458d0fe9: or         ecx, r8d
1458d0fec: jne        0x1458d1033
1458d0fee: movsd      xmm0, qword ptr [rip + 0x162706a]
1458d0ff6: movsd      xmm3, qword ptr [rip + 0x1627072]
1458d0ffe: movaps     xmm2, xmmword ptr [rip + 0x162707b]
1458d1005: movss      xmm4, dword ptr [rip + 0x1627083]
1458d100d: movss      xmm1, dword ptr [rip + 0x162707f]
1458d1015: jmp        0x1458d105e
1458d1017: mov        rcx, qword ptr [rdx + 8]
1458d101b: mov        r8d, 0x61726566
1458d1021: xor        r8d, dword ptr [rcx]
1458d1024: mov        r9d, 0x73616c61
1458d102a: xor        r9d, dword ptr [rcx + 3]
1458d102e: or         r9d, r8d
1458d1031: je         0x1458d1074
1458d1033: movss      xmm3, dword ptr [rdx + 0xd8]
1458d103b: mulss      xmm3, dword ptr [rip + 0x5275a1]
1458d1043: movaps     xmm2, xmmword ptr [rip + 0x16270c6]
1458d104a: movss      xmm2, xmm3
1458d104e: movsd      xmm3, qword ptr [rip + 0x1626fba]
1458d1056: movss      xmm4, dword ptr [rip + 0x5000c2]
1458d105e: movlps     qword ptr [rax], xmm0
1458d1061: movss      dword ptr [rax + 8], xmm1
1458d1066: movups     xmmword ptr [rax + 0xc], xmm2
1458d106a: movups     xmmword ptr [rax + 0x1c], xmm3
1458d106e: movss      dword ptr [rax + 0x2c], xmm4
1458d1073: ret
1458d1074: movss      xmm3, dword ptr [rdx + 0xd8]
1458d107c: mulss      xmm3, dword ptr [rip + 0x527560]
1458d1084: movaps     xmm2, xmmword ptr [rip + 0x1626f75]
1458d108b: movss      xmm2, xmm3
1458d108f: movsd      xmm3, qword ptr [rip + 0x1626f79]
1458d1097: movss      xmm4, dword ptr [rip + 0x1626f81]
1458d109f: jmp        0x1458d105e

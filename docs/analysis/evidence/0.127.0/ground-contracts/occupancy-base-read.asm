145b9b497: xor r15d, r15d
145b9b49a: ucomiss xmm10, xmm12
145b9b49e: ja 0x145b9b630
145b9b4a4: subss xmm13, xmm15
145b9b4a9: addss xmm13, xmm13
145b9b4ae: ucomiss xmm10, xmm13
145b9b4b2: ja 0x145b9b630
145b9b4b8: ucomiss xmm12, xmm14
145b9b4bc: jae 0x145b9b630
145b9b4c2: ucomiss xmm13, xmm14
145b9b4c6: jae 0x145b9b630
145b9b4cc: cvttss2si r8, xmm13
145b9b4d1: mov rcx, r8
145b9b4d4: sar rcx, 0x3f
145b9b4d8: movaps xmm0, xmm13
145b9b4dc: subss xmm0, dword ptr [rip + 0x6b45dc]
145b9b4e4: cvttss2si rdx, xmm0
145b9b4e9: and rdx, rcx
145b9b4ec: or rdx, r8
145b9b4ef: ucomiss xmm13, xmm10
145b9b4f3: mov ecx, 0
145b9b4f8: cmovae rcx, rdx
145b9b4fc: ucomiss xmm13, dword ptr [rip + 0x6b45c0]
145b9b504: mov rdx, 0xffffffffffffffff
145b9b50b: cmova rcx, rdx
145b9b50f: add rcx, qword ptr [rbp + 0x340]
145b9b516: cmp rcx, qword ptr [rbp + 0x338]
145b9b51d: jae 0x145b9ce80
145b9b523: mov rdx, qword ptr [rbp + 0x1f8]
145b9b52a: movss xmm0, dword ptr [rdx + rcx*4]
145b9b52f: xor r15d, r15d
145b9b532: ucomiss xmm0, xmm0
145b9b535: setnp r15b
145b9b539: lea rcx, [rbx + r12]
145b9b53d: cmp rcx, r14
145b9b540: jb 0x145b9b63d
145b9b546: jmp 0x145b9b799
145b9b54b: nop dword ptr [rax + rax]
145b9b550: mov rdx, rbx
145b9b553: shr rdx, 1
145b9b556: mov ecx, ebx
145b9b558: and ecx, 1
145b9b55b: or rcx, rdx
145b9b55e: xorps xmm13, xmm13
145b9b562: cvtsi2ss xmm13, rcx
145b9b567: addss xmm13, xmm13
145b9b56c: addss xmm13, dword ptr [rip + 0x697baf]
145b9b575: addss xmm13, dword ptr [rbp + 0x290]
145b9b57e: cmp qword ptr [rbp + 0x330], -1
145b9b586: jne 0x145b9b497

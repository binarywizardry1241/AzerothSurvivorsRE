14594f950: 41837d1006 cmp dword ptr [r13 + 0x10], 6
14594f955: 0f8545010000 jne 0x14594faa0
14594f95b: 41837d3002 cmp dword ptr [r13 + 0x30], 2
14594f960: 0f853a010000 jne 0x14594faa0
14594f966: 450f28f1 movaps xmm14, xmm9
14594f96a: f3450f5c7540 subss xmm14, dword ptr [r13 + 0x40]
14594f970: f3450f104538 movss xmm8, dword ptr [r13 + 0x38]
14594f976: 450f28fa movaps xmm15, xmm10
14594f97a: f3450f5c7d44 subss xmm15, dword ptr [r13 + 0x44]
14594f980: 410f28c6 movaps xmm0, xmm14
14594f984: 410f28cf movaps xmm1, xmm15
14594f988: e8a2a72a00 call 0x145bfa12f
14594f98d: 0f28f0 movaps xmm6, xmm0
14594f990: f30f5f3508d94400 maxss xmm6, dword ptr [rip + 0x44d908]
14594f998: 410f28c7 movaps xmm0, xmm15
14594f99c: 410f28ce movaps xmm1, xmm14
14594f9a0: e87ea72a00 call 0x145bfa123
14594f9a5: f3410f11454c movss dword ptr [r13 + 0x4c], xmm0
14594f9ab: 41c7453002000000 mov dword ptr [r13 + 0x30], 2
14594f9b3: f3410f117534 movss dword ptr [r13 + 0x34], xmm6
14594f9b9: f3450f114538 movss dword ptr [r13 + 0x38], xmm8
14594f9bf: 41807d7e01 cmp byte ptr [r13 + 0x7e], 1
14594f9c4: 0f85d6000000 jne 0x14594faa0
14594f9ca: 0f28c6 movaps xmm0, xmm6
14594f9cd: f3410f5c4578 subss xmm0, dword ptr [r13 + 0x78]
14594f9d3: 410f54c3 andps xmm0, xmm11
14594f9d7: 0f2e05c2d84400 ucomiss xmm0, dword ptr [rip + 0x44d8c2]
14594f9de: 0f86bc000000 jbe 0x14594faa0
14594f9e4: f3410f117578 movss dword ptr [r13 + 0x78], xmm6
14594f9ea: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
14594f9f1: 483bb528010000 cmp rsi, qword ptr [rbp + 0x128]
14594f9f8: 0f8584000000 jne 0x14594fa82
14594f9fe: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
14594fa05: 48898568020000 mov qword ptr [rbp + 0x268], rax
14594fa0c: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
14594fa13: 48898560020000 mov qword ptr [rbp + 0x260], rax
14594fa1a: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
14594fa21: 48898558020000 mov qword ptr [rbp + 0x258], rax
14594fa28: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
14594fa2f: 48898550020000 mov qword ptr [rbp + 0x250], rax
14594fa36: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
14594fa3d: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
14594fa44: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
14594fa4b: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14594fa52: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14594fa59: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14594fa60: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
14594fa67: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
14594fa6e: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
14594fa75: 488d8d28010000 lea rcx, [rbp + 0x128]
14594fa7c: e8efb02a00 call 0x145bfab70
14594fa81: 90 nop
14594fa82: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
14594fa89: 4c8934f0 mov qword ptr [rax + rsi*8], r14
14594fa8d: 48ffc6 inc rsi
14594fa90: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
14594fa97: 660f1f840000000000 nop word ptr [rax + rax]

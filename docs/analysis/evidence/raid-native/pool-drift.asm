14594f765: f3410f104570 movss xmm0, dword ptr [r13 + 0x70]
14594f76b: 0f57c9 xorps xmm1, xmm1
14594f76e: 0f2ec1 ucomiss xmm0, xmm1
14594f771: 0f86d9010000 jbe 0x14594f950
14594f777: 41807d7d00 cmp byte ptr [r13 + 0x7d], 0
14594f77c: 0f84ce010000 je 0x14594f950
14594f782: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
14594f788: 410f28f1 movaps xmm6, xmm9
14594f78c: 0f5cf0 subps xmm6, xmm0
14594f78f: f30f16ce movshdup xmm1, xmm6
14594f793: 0f28c6 movaps xmm0, xmm6
14594f796: e894a92a00 call 0x145bfa12f
14594f79b: 0f2e05e6d64700 ucomiss xmm0, dword ptr [rip + 0x47d6e6]
14594f7a2: 0f86a8010000 jbe 0x14594f950
14594f7a8: f3410f104d70 movss xmm1, dword ptr [r13 + 0x70]
14594f7ae: f30f598dd8010000 mulss xmm1, dword ptr [rbp + 0x1d8]
14594f7b6: 0f28d1 movaps xmm2, xmm1
14594f7b9: f30f5dd0 minss xmm2, xmm0
14594f7bd: 0f28da movaps xmm3, xmm2
14594f7c0: f30fc2da03 cmpunordss xmm3, xmm2
14594f7c5: 0f54cb andps xmm1, xmm3
14594f7c8: 0f55da andnps xmm3, xmm2
14594f7cb: 0f56d9 orps xmm3, xmm1
14594f7ce: f30f12c0 movsldup xmm0, xmm0
14594f7d2: 0f5ef0 divps xmm6, xmm0
14594f7d5: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
14594f7db: f3440f12f3 movsldup xmm14, xmm3
14594f7e0: 440f59f6 mulps xmm14, xmm6
14594f7e4: 440f58f0 addps xmm14, xmm0
14594f7e8: f3450f16fe movshdup xmm15, xmm14
14594f7ed: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
14594f7f4: 488bb098090000 mov rsi, qword ptr [rax + 0x998]
14594f7fb: 488d4e10 lea rcx, [rsi + 0x10]
14594f7ff: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
14594f806: 48898568020000 mov qword ptr [rbp + 0x268], rax
14594f80d: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
14594f814: 48898560020000 mov qword ptr [rbp + 0x260], rax
14594f81b: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
14594f822: 48898558020000 mov qword ptr [rbp + 0x258], rax
14594f829: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
14594f830: 48898550020000 mov qword ptr [rbp + 0x250], rax
14594f837: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
14594f83e: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
14594f845: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
14594f84c: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14594f853: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14594f85a: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14594f861: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
14594f868: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
14594f86f: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
14594f876: 410f28ce movaps xmm1, xmm14
14594f87a: 410f28d7 movaps xmm2, xmm15
14594f87e: e80d77f8ff call 0x1458d6f90
14594f883: 90 nop
14594f884: a801 test al, 1
14594f886: 0f85b6000000 jne 0x14594f942
14594f88c: 48837e68ff cmp qword ptr [rsi + 0x68], -1
14594f891: 0f84a3000000 je 0x14594f93a
14594f897: 488d5668 lea rdx, [rsi + 0x68]
14594f89b: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
14594f8a2: 48898568020000 mov qword ptr [rbp + 0x268], rax
14594f8a9: 488b8580020000 mov rax, qword ptr [rbp + 0x280]
14594f8b0: 48898560020000 mov qword ptr [rbp + 0x260], rax
14594f8b7: 488b8588020000 mov rax, qword ptr [rbp + 0x288]
14594f8be: 48898558020000 mov qword ptr [rbp + 0x258], rax
14594f8c5: 488b8590020000 mov rax, qword ptr [rbp + 0x290]
14594f8cc: 48898550020000 mov qword ptr [rbp + 0x250], rax
14594f8d3: c685a702000001 mov byte ptr [rbp + 0x2a7], 1
14594f8da: c685a602000001 mov byte ptr [rbp + 0x2a6], 1
14594f8e1: c685a502000001 mov byte ptr [rbp + 0x2a5], 1
14594f8e8: c685a402000001 mov byte ptr [rbp + 0x2a4], 1
14594f8ef: c685a302000001 mov byte ptr [rbp + 0x2a3], 1
14594f8f6: c685a202000001 mov byte ptr [rbp + 0x2a2], 1
14594f8fd: c685a102000001 mov byte ptr [rbp + 0x2a1], 1
14594f904: c685a002000001 mov byte ptr [rbp + 0x2a0], 1
14594f90b: c6859f02000001 mov byte ptr [rbp + 0x29f], 1
14594f912: 488d8de0010000 lea rcx, [rbp + 0x1e0]
14594f919: 410f28d6 movaps xmm2, xmm14
14594f91d: 410f28df movaps xmm3, xmm15
14594f921: e85ac8f8ff call 0x1458dc180
14594f926: 90 nop
14594f927: 83bde001000001 cmp dword ptr [rbp + 0x1e0], 1
14594f92e: 750a jne 0x14594f93a
14594f930: f30f1085ec010000 movss xmm0, dword ptr [rbp + 0x1ec]
14594f938: eb08 jmp 0x14594f942
14594f93a: f30f1086b8000000 movss xmm0, dword ptr [rsi + 0xb8]
14594f942: 450f137540 movlps qword ptr [r13 + 0x40], xmm14
14594f947: f3410f114548 movss dword ptr [r13 + 0x48], xmm0
14594f94d: 0f1f00 nop dword ptr [rax]

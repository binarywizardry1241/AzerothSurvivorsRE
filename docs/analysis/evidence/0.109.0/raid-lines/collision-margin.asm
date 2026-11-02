1458d1c90: 56 push rsi
1458d1c91: 57 push rdi
1458d1c92: 53 push rbx
1458d1c93: 4883ec40 sub rsp, 0x40
1458d1c97: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1458d1c9c: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1458d1ca1: 4c89cf mov rdi, r9
1458d1ca4: 4c89c3 mov rbx, r8
1458d1ca7: 4889d0 mov rax, rdx
1458d1caa: 4889ce mov rsi, rcx
1458d1cad: f3410f7e30 movq xmm6, qword ptr [r8]
1458d1cb2: f3410f7e39 movq xmm7, qword ptr [r9]
1458d1cb7: 660f7ef2 movd edx, xmm6
1458d1cbb: f30f16c6 movshdup xmm0, xmm6
1458d1cbf: 660f7ec1 movd ecx, xmm0
1458d1cc3: 48c1e120 shl rcx, 0x20
1458d1cc7: 4809ca or rdx, rcx
1458d1cca: 66410f7ef8 movd r8d, xmm7
1458d1ccf: f30f16c7 movshdup xmm0, xmm7
1458d1cd3: 660f7ec1 movd ecx, xmm0
1458d1cd7: 48c1e120 shl rcx, 0x20
1458d1cdb: 4909c8 or r8, rcx
1458d1cde: 4889c1 mov rcx, rax
1458d1ce1: e8faf6ffff call 0x1458d13e0
1458d1ce6: 0f2e05b3b54c00 ucomiss xmm0, dword ptr [rip + 0x4cb5b3]
1458d1ced: 7360 jae 0x1458d1d4f
1458d1cef: 0f28ce movaps xmm1, xmm6
1458d1cf2: 0f5ccf subps xmm1, xmm7
1458d1cf5: 0f59c9 mulps xmm1, xmm1
1458d1cf8: f30f16d1 movshdup xmm2, xmm1
1458d1cfc: f30f58d1 addss xmm2, xmm1
1458d1d00: 0f57c9 xorps xmm1, xmm1
1458d1d03: f30f51ca sqrtss xmm1, xmm2
1458d1d07: f30f101595b54c00 movss xmm2, dword ptr [rip + 0x4cb595]
1458d1d0f: f30f5fca maxss xmm1, xmm2
1458d1d13: f30f5ed1 divss xmm2, xmm1
1458d1d17: f30f5cc2 subss xmm0, xmm2
1458d1d1b: 0f57c9 xorps xmm1, xmm1
1458d1d1e: f30f5fc1 maxss xmm0, xmm1
1458d1d22: 0f5cfe subps xmm7, xmm6
1458d1d25: f30f104b08 movss xmm1, dword ptr [rbx + 8]
1458d1d2a: f30f105708 movss xmm2, dword ptr [rdi + 8]
1458d1d2f: f30f5cd1 subss xmm2, xmm1
1458d1d33: f30f59d0 mulss xmm2, xmm0
1458d1d37: f30f58d1 addss xmm2, xmm1
1458d1d3b: f30f12c0 movsldup xmm0, xmm0
1458d1d3f: 0f59c7 mulps xmm0, xmm7
1458d1d42: 0f58c6 addps xmm0, xmm6
1458d1d45: 0f1306 movlps qword ptr [rsi], xmm0
1458d1d48: f30f115608 movss dword ptr [rsi + 8], xmm2
1458d1d4d: eb0c jmp 0x1458d1d5b
1458d1d4f: 8b4708 mov eax, dword ptr [rdi + 8]
1458d1d52: 894608 mov dword ptr [rsi + 8], eax
1458d1d55: 488b07 mov rax, qword ptr [rdi]
1458d1d58: 488906 mov qword ptr [rsi], rax
1458d1d5b: 4889f0 mov rax, rsi
1458d1d5e: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458d1d63: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1458d1d68: 4883c440 add rsp, 0x40
1458d1d6c: 5b pop rbx
1458d1d6d: 5f pop rdi
1458d1d6e: 5e pop rsi
1458d1d6f: c3 ret

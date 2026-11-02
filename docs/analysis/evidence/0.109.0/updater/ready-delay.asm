; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401c90a2..0x1401c911a SHA256 ef97843c88639ca0a651d16178bd9bd7e8981dddb40a4421578e68bfdddbd52d
0x1401c90a2: cmp ebx, 3
0x1401c90a5: jne 0x1401c90c6
0x1401c90a7: movss xmm0, dword ptr [r15 + 0x5c]
0x1401c90ad: mov dword ptr [r13], r14d
0x1401c90b1: cmp dword ptr [r12], 1
0x1401c90b6: jne 0x1401c90e6
0x1401c90b8: movss xmm1, dword ptr [r12 + 4]
0x1401c90bf: ucomiss xmm1, xmm0
0x1401c90c2: ja 0x1401c90d2
0x1401c90c4: jmp 0x1401c9106
0x1401c90c6: mov dword ptr [r13], r14d
0x1401c90ca: mov dword ptr [r12], 0
0x1401c90d2: add rsp, 0x128
0x1401c90d9: pop rbx
0x1401c90da: pop rdi
0x1401c90db: pop rsi
0x1401c90dc: pop r12
0x1401c90de: pop r13
0x1401c90e0: pop r14
0x1401c90e2: pop r15
0x1401c90e4: pop rbp
0x1401c90e5: ret
0x1401c90e6: movss xmm1, dword ptr [rip + 0x5c0bd6a]
0x1401c90ee: addss xmm1, xmm0
0x1401c90f2: mov dword ptr [r12], 1
0x1401c90fa: movss dword ptr [r12 + 4], xmm1
0x1401c9101: ucomiss xmm1, xmm0
0x1401c9104: ja 0x1401c90d2
0x1401c9106: mov dword ptr [r13], r14d
0x1401c910a: mov dword ptr [r12], 0
0x1401c9112: mov rcx, rsi
0x1401c9115: call 0x14017f830

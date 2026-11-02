14028d271 f30f1003 movss xmm0, dword ptr [rbx]
14028d275 f30f59050350b505 mulss xmm0, dword ptr [rip + 0x5b55003]
14028d27d 8b8524010000 mov eax, dword ptr [rbp + 0x124]
14028d283 8906 mov dword ptr [rsi], eax
14028d285 49c7042401000000 mov qword ptr [r12], 1
14028d28d 41c744240801000000 mov dword ptr [r12 + 8], 1
14028d296 f3410f1144240c movss dword ptr [r12 + 0xc], xmm0
14028d29d f30f1003 movss xmm0, dword ptr [rbx]
14028d2a1 f30f5905b732b605 mulss xmm0, dword ptr [rip + 0x5b632b7]
14028d2a9 f30f5805efffb005 addss xmm0, dword ptr [rip + 0x5b0ffef]
14028d2b1 8906 mov dword ptr [rsi], eax
14028d2b3 f3410f11442410 movss dword ptr [r12 + 0x10], xmm0
14028d2ba f3410f11442414 movss dword ptr [r12 + 0x14], xmm0

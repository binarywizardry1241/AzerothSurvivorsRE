0x1458f2e80: 488b8d08020000           mov rcx, qword ptr [rbp + 0x208]
0x1458f2e87: c6819800000001           mov byte ptr [rcx + 0x98], 1
0x1458f2e8e: 488b85a0020000           mov rax, qword ptr [rbp + 0x2a0]
0x1458f2e95: 488b5500                 mov rdx, qword ptr [rbp]
0x1458f2e99: 48894220                 mov qword ptr [rdx + 0x20], rax
0x1458f2e9d: f30f6f8580020000         movdqu xmm0, xmmword ptr [rbp + 0x280]
0x1458f2ea5: f30f6f8d90020000         movdqu xmm1, xmmword ptr [rbp + 0x290]
0x1458f2ead: f30f7f4a10               movdqu xmmword ptr [rdx + 0x10], xmm1
0x1458f2eb2: f30f7f02                 movdqu xmmword ptr [rdx], xmm0

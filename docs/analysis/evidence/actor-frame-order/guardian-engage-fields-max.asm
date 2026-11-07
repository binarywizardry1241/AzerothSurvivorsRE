14597ca1b: 48c785a801000000000000 mov qword ptr [rbp + 0x1a8], 0
14597ca26: 48c785b801000000000000 mov qword ptr [rbp + 0x1b8], 0
14597ca31: 488d85a8010000 lea rax, [rbp + 0x1a8]
14597ca38: 48898560020000 mov qword ptr [rbp + 0x260], rax
14597ca3f: 488d8568020000 lea rax, [rbp + 0x268]
14597ca46: 440f1110 movups xmmword ptr [rax], xmm10
14597ca4a: 48c785800200001c000000 mov qword ptr [rbp + 0x280], 0x1c
14597ca55: 488d8d00020000 lea rcx, [rbp + 0x200]
14597ca5c: 488d9560020000 lea rdx, [rbp + 0x260]
14597ca63: e8b8cbf5ff call 0x1458d9620
14597ca68: 90 nop 

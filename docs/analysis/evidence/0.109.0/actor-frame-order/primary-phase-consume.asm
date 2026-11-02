14597c373: 4939de cmp r14, rbx
14597c376: 7442 je 0x14597c3ba
14597c378: 4d8b06 mov r8, qword ptr [r14]
14597c37b: 4d85c0 test r8, r8
14597c37e: 743a je 0x14597c3ba
14597c380: 410f104618 movups xmm0, xmmword ptr [r14 + 0x18]
14597c385: 4d8b4e08 mov r9, qword ptr [r14 + 8]
14597c389: 498b5610 mov rdx, qword ptr [r14 + 0x10]
14597c38d: 0f11442420 movups xmmword ptr [rsp + 0x20], xmm0
14597c392: 4889f9 mov rcx, rdi
14597c395: e8166cf4ff call 0x1458c2fb0
14597c39a: 90 nop 
14597c39b: 498bb728060000 mov rsi, qword ptr [r15 + 0x628]
14597c3a2: 493bb718060000 cmp rsi, qword ptr [r15 + 0x618]
14597c3a9: 7595 jne 0x14597c340
14597c3ab: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14597c3b2: e859ea2700 call 0x145bfae10
14597c3b7: 90 nop 
14597c3b8: eb86 jmp 0x14597c340

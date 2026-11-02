145c3e5f6: 89f9 mov ecx, edi
145c3e5f8: e833210600 call 0x145ca0730
145c3e5fd: 450f57f6 xorps xmm14, xmm14
145c3e601: 410f2ec6 ucomiss xmm0, xmm14
145c3e605: 7629 jbe 0x145c3e630
145c3e607: f2410f108d20050000 movsd xmm1, qword ptr [r13 + 0x520]
145c3e610: 410f28d4 movaps xmm2, xmm12
145c3e614: 0f5cd1 subps xmm2, xmm1
145c3e617: 0f59d2 mulps xmm2, xmm2
145c3e61a: f30f16ca movshdup xmm1, xmm2
145c3e61e: f30f58ca addss xmm1, xmm2
145c3e622: 450f57f6 xorps xmm14, xmm14
145c3e626: f3440f51f1 sqrtss xmm14, xmm1
145c3e62b: f3440f5ef0 divss xmm14, xmm0
145c3e630: 4d8ba5b0040000 mov r12, qword ptr [r13 + 0x4b0]
145c3e637: 498bb538060000 mov rsi, qword ptr [r13 + 0x638]
145c3e63e: 493bb528060000 cmp rsi, qword ptr [r13 + 0x628]
145c3e645: 750d jne 0x145c3e654
145c3e647: 488b8db0030000 mov rcx, qword ptr [rbp + 0x3b0]
145c3e64e: e85d3f4500 call 0x1460925b0
145c3e653: 90 nop
145c3e654: f3440f58f6 addss xmm14, xmm6
145c3e659: 498b8530060000 mov rax, qword ptr [r13 + 0x630]
145c3e660: 488d0cf6 lea rcx, [rsi + rsi*8]
145c3e664: 48c1e104 shl rcx, 4
145c3e668: 48c7040800000000 mov qword ptr [rax + rcx], 0
145c3e670: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
145c3e678: c744082001000000 mov dword ptr [rax + rcx + 0x20], 1
145c3e680: 440f13640824 movlps qword ptr [rax + rcx + 0x24], xmm12
145c3e686: f3440f116c082c movss dword ptr [rax + rcx + 0x2c], xmm13
145c3e68d: c644085902 mov byte ptr [rax + rcx + 0x59], 2
145c3e692: 4c89640860 mov qword ptr [rax + rcx + 0x60], r12
145c3e697: 4c897c0868 mov qword ptr [rax + rcx + 0x68], r15
145c3e69c: c744087000000000 mov dword ptr [rax + rcx + 0x70], 0
145c3e6a4: f3440f1174087c movss dword ptr [rax + rcx + 0x7c], xmm14
145c3e6ab: 89bc0880000000 mov dword ptr [rax + rcx + 0x80], edi
145c3e6b2: f3440f118c0884000000 movss dword ptr [rax + rcx + 0x84], xmm9
145c3e6bc: 66c78408880000000000 mov word ptr [rax + rcx + 0x88], 0
145c3e6c6: c684088a00000005 mov byte ptr [rax + rcx + 0x8a], 5
145c3e6ce: 48ffc6 inc rsi
145c3e6d1: 4989b538060000 mov qword ptr [r13 + 0x638], rsi

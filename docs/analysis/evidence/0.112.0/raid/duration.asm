145896950: 4883ec38 sub rsp, 0x38
145896954: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
145896959: 0fb6412d movzx eax, byte ptr [rcx + 0x2d]
14589695d: 2c03 sub al, 3
14589695f: 0fb6c0 movzx eax, al
145896962: ba1d000000 mov edx, 0x1d
145896967: 0f43d0 cmovae edx, eax
14589696a: 0f57c0 xorps xmm0, xmm0
14589696d: 0fb6c2 movzx eax, dl
145896970: 488d1555833601 lea rdx, [rip + 0x1368355]
145896977: 48630482 movsxd rax, dword ptr [rdx + rax*4]
14589697b: 4801d0 add rax, rdx
14589697e: ffe0 jmp rax
145896980: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896985: 4883c438 add rsp, 0x38
145896989: c3 ret
14589698a: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14589698f: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896994: 4883c438 add rsp, 0x38
145896998: c3 ret
145896999: f30f104108 movss xmm0, dword ptr [rcx + 8]
14589699e: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458969a3: 4883c438 add rsp, 0x38
1458969a7: c3 ret
1458969a8: f30f104110 movss xmm0, dword ptr [rcx + 0x10]
1458969ad: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458969b2: 4883c438 add rsp, 0x38
1458969b6: c3 ret
1458969b7: f30f1005a1415200 movss xmm0, dword ptr [rip + 0x5241a1]
1458969bf: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458969c4: 4883c438 add rsp, 0x38
1458969c8: c3 ret
1458969c9: f30f104108 movss xmm0, dword ptr [rcx + 8]
1458969ce: f30f58058a685100 addss xmm0, dword ptr [rip + 0x51688a]
1458969d6: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458969db: 4883c438 add rsp, 0x38
1458969df: c3 ret
1458969e0: f30f1005a8465200 movss xmm0, dword ptr [rip + 0x5246a8]
1458969e8: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1458969ed: 4883c438 add rsp, 0x38
1458969f1: c3 ret
1458969f2: 8b4104 mov eax, dword ptr [rcx + 4]
1458969f5: 0f57c0 xorps xmm0, xmm0
1458969f8: f3480f2ac0 cvtsi2ss xmm0, rax
1458969fd: f30f590537015200 mulss xmm0, dword ptr [rip + 0x520137]
145896a05: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
145896a0a: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896a0f: 4883c438 add rsp, 0x38
145896a13: c3 ret
145896a14: 8b4104 mov eax, dword ptr [rcx + 4]
145896a17: e9d9000000 jmp 0x145896af5
145896a1c: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
145896a21: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
145896a26: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896a2b: 4883c438 add rsp, 0x38
145896a2f: c3 ret
145896a30: 8b4108 mov eax, dword ptr [rcx + 8]
145896a33: 0f57c0 xorps xmm0, xmm0
145896a36: f3480f2ac0 cvtsi2ss xmm0, rax
145896a3b: f30f594114 mulss xmm0, dword ptr [rcx + 0x14]
145896a40: f30f584110 addss xmm0, dword ptr [rcx + 0x10]
145896a45: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896a4a: 4883c438 add rsp, 0x38
145896a4e: c3 ret
145896a4f: f30f10050d685100 movss xmm0, dword ptr [rip + 0x51680d]
145896a57: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896a5c: 4883c438 add rsp, 0x38
145896a60: c3 ret
145896a61: f30f104110 movss xmm0, dword ptr [rcx + 0x10]
145896a66: f30f5905f6675100 mulss xmm0, dword ptr [rip + 0x5167f6]
145896a6e: f30f5805ea675100 addss xmm0, dword ptr [rip + 0x5167ea]
145896a76: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896a7b: 4883c438 add rsp, 0x38
145896a7f: c3 ret
145896a80: 488b5108 mov rdx, qword ptr [rcx + 8]
145896a84: 4885d2 test rdx, rdx
145896a87: 0f84f3feffff je 0x145896980
145896a8d: 48ffca dec rdx
145896a90: 488d0452 lea rax, [rdx + rdx*2]
145896a94: 48c1e004 shl rax, 4
145896a98: 480301 add rax, qword ptr [rcx]
145896a9b: 4885d2 test rdx, rdx
145896a9e: 7871 js 0x145896b11
145896aa0: 0f57f6 xorps xmm6, xmm6
145896aa3: f3480f2af2 cvtsi2ss xmm6, rdx
145896aa8: eb7f jmp 0x145896b29
145896aaa: f30f104104 movss xmm0, dword ptr [rcx + 4]
145896aaf: f30f5805ad675100 addss xmm0, dword ptr [rip + 0x5167ad]
145896ab7: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896abc: 4883c438 add rsp, 0x38
145896ac0: c3 ret
145896ac1: f30f104104 movss xmm0, dword ptr [rcx + 4]
145896ac6: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896acb: 4883c438 add rsp, 0x38
145896acf: c3 ret
145896ad0: 8b410c mov eax, dword ptr [rcx + 0xc]
145896ad3: 0f57c0 xorps xmm0, xmm0
145896ad6: f3480f2ac0 cvtsi2ss xmm0, rax
145896adb: f30f59050dac5100 mulss xmm0, dword ptr [rip + 0x51ac0d]
145896ae3: f30f584118 addss xmm0, dword ptr [rcx + 0x18]
145896ae8: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896aed: 4883c438 add rsp, 0x38
145896af1: c3 ret
145896af2: 8b4114 mov eax, dword ptr [rcx + 0x14]
145896af5: 0f57c0 xorps xmm0, xmm0
145896af8: f3480f2ac0 cvtsi2ss xmm0, rax
145896afd: f30f594110 mulss xmm0, dword ptr [rcx + 0x10]
145896b02: f30f58410c addss xmm0, dword ptr [rcx + 0xc]
145896b07: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896b0c: 4883c438 add rsp, 0x38
145896b10: c3 ret
145896b11: 4989d0 mov r8, rdx
145896b14: 49d1e8 shr r8, 1
145896b17: 83e201 and edx, 1
145896b1a: 4c09c2 or rdx, r8
145896b1d: 0f57f6 xorps xmm6, xmm6
145896b20: f3480f2af2 cvtsi2ss xmm6, rdx
145896b25: f30f58f6 addss xmm6, xmm6
145896b29: f30f597110 mulss xmm6, dword ptr [rcx + 0x10]
145896b2e: 4889c1 mov rcx, rax
145896b31: e81afeffff call 0x145896950
145896b36: f30f58c6 addss xmm0, xmm6
145896b3a: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
145896b3f: 4883c438 add rsp, 0x38
145896b43: c3 ret

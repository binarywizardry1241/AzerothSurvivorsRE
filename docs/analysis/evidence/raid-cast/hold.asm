145950630: 55 push rbp
145950631: 56 push rsi
145950632: 57 push rdi
145950633: 53 push rbx
145950634: 4881eca8000000 sub rsp, 0xa8
14595063b: 488dac2480000000 lea rbp, [rsp + 0x80]
145950643: 440f294d10 movaps xmmword ptr [rbp + 0x10], xmm9
145950648: 440f294500 movaps xmmword ptr [rbp], xmm8
14595064d: 0f297df0 movaps xmmword ptr [rbp - 0x10], xmm7
145950651: 0f2975e0 movaps xmmword ptr [rbp - 0x20], xmm6
145950655: 48c745d8feffffff mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
14595065d: 483b9168050000 cmp rdx, qword ptr [rcx + 0x568]
145950664: 0f83ea010000 jae 0x145950854
14595066a: 4489cf mov edi, r9d
14595066d: 0f28f2 movaps xmm6, xmm2
145950670: 4889ce mov rsi, rcx
145950673: 488b8160050000 mov rax, qword ptr [rcx + 0x560]
14595067a: f3440f1081340a0000 movss xmm8, dword ptr [rcx + 0xa34]
145950683: 4869d2d8010000 imul rdx, rdx, 0x1d8
14595068a: 488d1c10 lea rbx, [rax + rdx]
14595068e: 488b8998090000 mov rcx, qword ptr [rcx + 0x998]
145950695: 4883c110 add rcx, 0x10
145950699: f30f108c1090010000 movss xmm1, dword ptr [rax + rdx + 0x190]
1459506a2: 0f57c0 xorps xmm0, xmm0
1459506a5: 0f2ec1 ucomiss xmm0, xmm1
1459506a8: 735f jae 0x145950709
1459506aa: 410f28d0 movaps xmm2, xmm8
1459506ae: f30f5c938c010000 subss xmm2, dword ptr [rbx + 0x18c]
1459506b6: f30f5ed1 divss xmm2, xmm1
1459506ba: f30f5fc2 maxss xmm0, xmm2
1459506be: f30f100d4a6f4400 movss xmm1, dword ptr [rip + 0x446f4a]
1459506c6: f30f5dc8 minss xmm1, xmm0
1459506ca: f20f108374010000 movsd xmm0, qword ptr [rbx + 0x174]
1459506d2: f20f109380010000 movsd xmm2, qword ptr [rbx + 0x180]
1459506da: 0f5cd0 subps xmm2, xmm0
1459506dd: f30f12f9 movsldup xmm7, xmm1
1459506e1: 0f59fa mulps xmm7, xmm2
1459506e4: 0f58f8 addps xmm7, xmm0
1459506e7: f30f10837c010000 movss xmm0, dword ptr [rbx + 0x17c]
1459506ef: f3440f108b88010000 movss xmm9, dword ptr [rbx + 0x188]
1459506f8: f3440f5cc8 subss xmm9, xmm0
1459506fd: f3440f59c9 mulss xmm9, xmm1
145950702: f3440f58c8 addss xmm9, xmm0
145950707: eb11 jmp 0x14595071a
145950709: f20f10bb80010000 movsd xmm7, qword ptr [rbx + 0x180]
145950711: f3440f108b88010000 movss xmm9, dword ptr [rbx + 0x188]
14595071a: f30f16d7 movshdup xmm2, xmm7
14595071e: 0f28cf movaps xmm1, xmm7
145950721: e8fafaf7ff call 0x1458d0220
145950726: a801 test al, 1
145950728: 7504 jne 0x14595072e
14595072a: 410f28c1 movaps xmm0, xmm9
14595072e: 0f137dc8 movlps qword ptr [rbp - 0x38], xmm7
145950732: f30f1145d0 movss dword ptr [rbp - 0x30], xmm0
145950737: 488b45c8 mov rax, qword ptr [rbp - 0x38]
14595073b: 48898374010000 mov qword ptr [rbx + 0x174], rax
145950742: 8b45d0 mov eax, dword ptr [rbp - 0x30]
145950745: 89837c010000 mov dword ptr [rbx + 0x17c], eax
14595074b: 488b45c8 mov rax, qword ptr [rbp - 0x38]
14595074f: 48898380010000 mov qword ptr [rbx + 0x180], rax
145950756: 8b45d0 mov eax, dword ptr [rbp - 0x30]
145950759: 898388010000 mov dword ptr [rbx + 0x188], eax
14595075f: 0f57c0 xorps xmm0, xmm0
145950762: f3410f10c0 movss xmm0, xmm8
145950767: 0f13838c010000 movlps qword ptr [rbx + 0x18c], xmm0
14595076e: f30f12c6 movsldup xmm0, xmm6
145950772: 0f280dd7ee8901 movaps xmm1, xmmword ptr [rip + 0x189eed7]
145950779: f3410f10c8 movss xmm1, xmm8
14595077e: 0f58c8 addps xmm1, xmm0
145950781: f30f108398010000 movss xmm0, dword ptr [rbx + 0x198]
145950789: f30f1093c4010000 movss xmm2, dword ptr [rbx + 0x1c4]
145950791: 0f14d0 unpcklps xmm2, xmm0
145950794: 0f28c2 movaps xmm0, xmm2
145950797: 0f5fc1 maxps xmm0, xmm1
14595079a: 0f28c8 movaps xmm1, xmm0
14595079d: 0fc2c803 cmpunordps xmm1, xmm0
1459507a1: 0f54d1 andps xmm2, xmm1
1459507a4: 0f55c8 andnps xmm1, xmm0
1459507a7: 0f56ca orps xmm1, xmm2
1459507aa: f30f118bc4010000 movss dword ptr [rbx + 0x1c4], xmm1
1459507b2: 0f138b94010000 movlps qword ptr [rbx + 0x194], xmm1
1459507b9: 488b93f0000000 mov rdx, qword ptr [rbx + 0xf0]
1459507c0: 448b8e640a0000 mov r9d, dword ptr [rsi + 0xa64]
1459507c7: 41ffc1 inc r9d
1459507ca: 44898e640a0000 mov dword ptr [rsi + 0xa64], r9d
1459507d1: 40f6c701 test dil, 1
1459507d5: 742a je 0x145950801
1459507d7: f30f104570 movss xmm0, dword ptr [rbp + 0x70]
1459507dc: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1459507e2: 488d4da8 lea rcx, [rbp - 0x58]
1459507e6: 4c8d45c8 lea r8, [rbp - 0x38]
1459507ea: e8b1f9f6ff call 0x1458c01a0
1459507ef: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
1459507f6: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
1459507fd: 741f je 0x14595081e
1459507ff: eb2a jmp 0x14595082b
145950801: 488d4da8 lea rcx, [rbp - 0x58]
145950805: 4c8d45c8 lea r8, [rbp - 0x38]
145950809: e8c2f5f6ff call 0x1458bfdd0
14595080e: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
145950815: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
14595081c: 750d jne 0x14595082b
14595081e: 488d8e18060000 lea rcx, [rsi + 0x618]
145950825: e8b6462a00 call 0x145bf4ee0
14595082a: 90 nop
14595082b: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
145950832: 4889f9 mov rcx, rdi
145950835: 48c1e105 shl rcx, 5
145950839: 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
14595083d: 0f104db8 movups xmm1, xmmword ptr [rbp - 0x48]
145950841: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145950846: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14595084a: 48ffc7 inc rdi
14595084d: 4889be28060000 mov qword ptr [rsi + 0x628], rdi
145950854: 0f2875e0 movaps xmm6, xmmword ptr [rbp - 0x20]
145950858: 0f287df0 movaps xmm7, xmmword ptr [rbp - 0x10]
14595085c: 440f284500 movaps xmm8, xmmword ptr [rbp]
145950861: 440f284d10 movaps xmm9, xmmword ptr [rbp + 0x10]
145950866: 4881c4a8000000 add rsp, 0xa8
14595086d: 5b pop rbx
14595086e: 5f pop rdi
14595086f: 5e pop rsi
145950870: 5d pop rbp
145950871: c3 ret

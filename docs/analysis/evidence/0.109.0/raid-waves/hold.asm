145957320: 55 push rbp
145957321: 56 push rsi
145957322: 57 push rdi
145957323: 53 push rbx
145957324: 4881eca8000000 sub rsp, 0xa8
14595732b: 488dac2480000000 lea rbp, [rsp + 0x80]
145957333: 440f294d10 movaps xmmword ptr [rbp + 0x10], xmm9
145957338: 440f294500 movaps xmmword ptr [rbp], xmm8
14595733d: 0f297df0 movaps xmmword ptr [rbp - 0x10], xmm7
145957341: 0f2975e0 movaps xmmword ptr [rbp - 0x20], xmm6
145957345: 48c745d8feffffff mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
14595734d: 483b9168050000 cmp rdx, qword ptr [rcx + 0x568]
145957354: 0f83ea010000 jae 0x145957544
14595735a: 4489cf mov edi, r9d
14595735d: 0f28f2 movaps xmm6, xmm2
145957360: 4889ce mov rsi, rcx
145957363: 488b8160050000 mov rax, qword ptr [rcx + 0x560]
14595736a: f3440f1081340a0000 movss xmm8, dword ptr [rcx + 0xa34]
145957373: 4869d2d8010000 imul rdx, rdx, 0x1d8
14595737a: 488d1c10 lea rbx, [rax + rdx]
14595737e: 488b8998090000 mov rcx, qword ptr [rcx + 0x998]
145957385: 4883c110 add rcx, 0x10
145957389: f30f108c1090010000 movss xmm1, dword ptr [rax + rdx + 0x190]
145957392: 0f57c0 xorps xmm0, xmm0
145957395: 0f2ec1 ucomiss xmm0, xmm1
145957398: 735f jae 0x1459573f9
14595739a: 410f28d0 movaps xmm2, xmm8
14595739e: f30f5c938c010000 subss xmm2, dword ptr [rbx + 0x18c]
1459573a6: f30f5ed1 divss xmm2, xmm1
1459573aa: f30f5fc2 maxss xmm0, xmm2
1459573ae: f30f100dea5e4400 movss xmm1, dword ptr [rip + 0x445eea]
1459573b6: f30f5dc8 minss xmm1, xmm0
1459573ba: f20f108374010000 movsd xmm0, qword ptr [rbx + 0x174]
1459573c2: f20f109380010000 movsd xmm2, qword ptr [rbx + 0x180]
1459573ca: 0f5cd0 subps xmm2, xmm0
1459573cd: f30f12f9 movsldup xmm7, xmm1
1459573d1: 0f59fa mulps xmm7, xmm2
1459573d4: 0f58f8 addps xmm7, xmm0
1459573d7: f30f10837c010000 movss xmm0, dword ptr [rbx + 0x17c]
1459573df: f3440f108b88010000 movss xmm9, dword ptr [rbx + 0x188]
1459573e8: f3440f5cc8 subss xmm9, xmm0
1459573ed: f3440f59c9 mulss xmm9, xmm1
1459573f2: f3440f58c8 addss xmm9, xmm0
1459573f7: eb11 jmp 0x14595740a
1459573f9: f20f10bb80010000 movsd xmm7, qword ptr [rbx + 0x180]
145957401: f3440f108b88010000 movss xmm9, dword ptr [rbx + 0x188]
14595740a: f30f16d7 movshdup xmm2, xmm7
14595740e: 0f28cf movaps xmm1, xmm7
145957411: e87afbf7ff call 0x1458d6f90
145957416: a801 test al, 1
145957418: 7504 jne 0x14595741e
14595741a: 410f28c1 movaps xmm0, xmm9
14595741e: 0f137dc8 movlps qword ptr [rbp - 0x38], xmm7
145957422: f30f1145d0 movss dword ptr [rbp - 0x30], xmm0
145957427: 488b45c8 mov rax, qword ptr [rbp - 0x38]
14595742b: 48898374010000 mov qword ptr [rbx + 0x174], rax
145957432: 8b45d0 mov eax, dword ptr [rbp - 0x30]
145957435: 89837c010000 mov dword ptr [rbx + 0x17c], eax
14595743b: 488b45c8 mov rax, qword ptr [rbp - 0x38]
14595743f: 48898380010000 mov qword ptr [rbx + 0x180], rax
145957446: 8b45d0 mov eax, dword ptr [rbp - 0x30]
145957449: 898388010000 mov dword ptr [rbx + 0x188], eax
14595744f: 0f57c0 xorps xmm0, xmm0
145957452: f3410f10c0 movss xmm0, xmm8
145957457: 0f13838c010000 movlps qword ptr [rbx + 0x18c], xmm0
14595745e: f30f12c6 movsldup xmm0, xmm6
145957462: 0f280df7248d01 movaps xmm1, xmmword ptr [rip + 0x18d24f7]
145957469: f3410f10c8 movss xmm1, xmm8
14595746e: 0f58c8 addps xmm1, xmm0
145957471: f30f108398010000 movss xmm0, dword ptr [rbx + 0x198]
145957479: f30f1093c4010000 movss xmm2, dword ptr [rbx + 0x1c4]
145957481: 0f14d0 unpcklps xmm2, xmm0
145957484: 0f28c2 movaps xmm0, xmm2
145957487: 0f5fc1 maxps xmm0, xmm1
14595748a: 0f28c8 movaps xmm1, xmm0
14595748d: 0fc2c803 cmpunordps xmm1, xmm0
145957491: 0f54d1 andps xmm2, xmm1
145957494: 0f55c8 andnps xmm1, xmm0
145957497: 0f56ca orps xmm1, xmm2
14595749a: f30f118bc4010000 movss dword ptr [rbx + 0x1c4], xmm1
1459574a2: 0f138b94010000 movlps qword ptr [rbx + 0x194], xmm1
1459574a9: 488b93f0000000 mov rdx, qword ptr [rbx + 0xf0]
1459574b0: 448b8e640a0000 mov r9d, dword ptr [rsi + 0xa64]
1459574b7: 41ffc1 inc r9d
1459574ba: 44898e640a0000 mov dword ptr [rsi + 0xa64], r9d
1459574c1: 40f6c701 test dil, 1
1459574c5: 742a je 0x1459574f1
1459574c7: f30f104570 movss xmm0, dword ptr [rbp + 0x70]
1459574cc: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
1459574d2: 488d4da8 lea rcx, [rbp - 0x58]
1459574d6: 4c8d45c8 lea r8, [rbp - 0x38]
1459574da: e831faf6ff call 0x1458c6f10
1459574df: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
1459574e6: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
1459574ed: 741f je 0x14595750e
1459574ef: eb2a jmp 0x14595751b
1459574f1: 488d4da8 lea rcx, [rbp - 0x58]
1459574f5: 4c8d45c8 lea r8, [rbp - 0x38]
1459574f9: e842f6f6ff call 0x1458c6b40
1459574fe: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
145957505: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
14595750c: 750d jne 0x14595751b
14595750e: 488d8e18060000 lea rcx, [rsi + 0x618]
145957515: e8f6382a00 call 0x145bfae10
14595751a: 90 nop
14595751b: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
145957522: 4889f9 mov rcx, rdi
145957525: 48c1e105 shl rcx, 5
145957529: 0f1045a8 movups xmm0, xmmword ptr [rbp - 0x58]
14595752d: 0f104db8 movups xmm1, xmmword ptr [rbp - 0x48]
145957531: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145957536: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14595753a: 48ffc7 inc rdi
14595753d: 4889be28060000 mov qword ptr [rsi + 0x628], rdi
145957544: 0f2875e0 movaps xmm6, xmmword ptr [rbp - 0x20]
145957548: 0f287df0 movaps xmm7, xmmword ptr [rbp - 0x10]
14595754c: 440f284500 movaps xmm8, xmmword ptr [rbp]
145957551: 440f284d10 movaps xmm9, xmmword ptr [rbp + 0x10]
145957556: 4881c4a8000000 add rsp, 0xa8
14595755d: 5b pop rbx
14595755e: 5f pop rdi
14595755f: 5e pop rsi
145957560: 5d pop rbp
145957561: c3 ret

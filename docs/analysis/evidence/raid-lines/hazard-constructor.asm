1459575e0: 4157 push r15
1459575e2: 4156 push r14
1459575e4: 56 push rsi
1459575e5: 57 push rdi
1459575e6: 55 push rbp
1459575e7: 53 push rbx
1459575e8: 4881ecb8000000 sub rsp, 0xb8
1459575ef: 440f29a424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm12
1459575f8: 440f299c2490000000 movaps xmmword ptr [rsp + 0x90], xmm11
145957601: 440f29942480000000 movaps xmmword ptr [rsp + 0x80], xmm10
14595760a: 440f294c2470 movaps xmmword ptr [rsp + 0x70], xmm9
145957610: 440f29442460 movaps xmmword ptr [rsp + 0x60], xmm8
145957616: 0f297c2450 movaps xmmword ptr [rsp + 0x50], xmm7
14595761b: 0f29742440 movaps xmmword ptr [rsp + 0x40], xmm6
145957620: 0f28f3 movaps xmm6, xmm3
145957623: 4c89c7 mov rdi, r8
145957626: 4889d3 mov rbx, rdx
145957629: 4889ce mov rsi, rcx
14595762c: 4c8bb42438010000 mov r14, qword ptr [rsp + 0x138]
145957634: f30f10bc2410010000 movss xmm7, dword ptr [rsp + 0x110]
14595763d: 8ba9380a0000 mov ebp, dword ptr [rcx + 0xa38]
145957643: ffc5 inc ebp
145957645: 89a9380a0000 mov dword ptr [rcx + 0xa38], ebp
14595764b: f3440f1089340a0000 movss xmm9, dword ptr [rcx + 0xa34]
145957654: 4c8bb998090000 mov r15, qword ptr [rcx + 0x998]
14595765b: 498d4f10 lea rcx, [r15 + 0x10]
14595765f: 0f28cb movaps xmm1, xmm3
145957662: 0f28d7 movaps xmm2, xmm7
145957665: e826f9f7ff call 0x1458d6f90
14595766a: a801 test al, 1
14595766c: 7406 je 0x145957674
14595766e: 440f28c0 movaps xmm8, xmm0
145957672: eb34 jmp 0x1459576a8
145957674: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145957679: 7424 je 0x14595769f
14595767b: 498d5768 lea rdx, [r15 + 0x68]
14595767f: 488d4c2428 lea rcx, [rsp + 0x28]
145957684: 0f28d6 movaps xmm2, xmm6
145957687: 0f28df movaps xmm3, xmm7
14595768a: e8f14af8ff call 0x1458dc180
14595768f: 837c242801 cmp dword ptr [rsp + 0x28], 1
145957694: 7509 jne 0x14595769f
145957696: f3440f10442434 movss xmm8, dword ptr [rsp + 0x34]
14595769d: eb09 jmp 0x1459576a8
14595769f: f3450f1087b8000000 movss xmm8, dword ptr [r15 + 0xb8]
1459576a8: f3440f10942430010000 movss xmm10, dword ptr [rsp + 0x130]
1459576b2: 448bbc2428010000 mov r15d, dword ptr [rsp + 0x128]
1459576ba: f3440f109c2420010000 movss xmm11, dword ptr [rsp + 0x120]
1459576c4: f3440f10a42418010000 movss xmm12, dword ptr [rsp + 0x118]
1459576ce: 410f1006 movups xmm0, xmmword ptr [r14]
1459576d2: 0f11442430 movups xmmword ptr [rsp + 0x30], xmm0
1459576d7: 4c8bb698050000 mov r14, qword ptr [rsi + 0x598]
1459576de: 4c3bb688050000 cmp r14, qword ptr [rsi + 0x588]
1459576e5: 750c jne 0x1459576f3
1459576e7: 488d8e88050000 lea rcx, [rsi + 0x588]
1459576ee: e83d362a00 call 0x145bfad30
1459576f3: f3450f58d9 addss xmm11, xmm9
1459576f8: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
1459576ff: 4c89f1 mov rcx, r14
145957702: 48c1e107 shl rcx, 7
145957706: 48c7040800000000 mov qword ptr [rax + rcx], 0
14595770e: 0f10442428 movups xmm0, xmmword ptr [rsp + 0x28]
145957713: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
145957718: 488b542438 mov rdx, qword ptr [rsp + 0x38]
14595771d: 4889540818 mov qword ptr [rax + rcx + 0x18], rdx
145957722: 48895c0820 mov qword ptr [rax + rcx + 0x20], rbx
145957727: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145957730: 488b17 mov rdx, qword ptr [rdi]
145957733: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
145957738: 8b5708 mov edx, dword ptr [rdi + 8]
14595773b: 89540838 mov dword ptr [rax + rcx + 0x38], edx
14595773f: 896c083c mov dword ptr [rax + rcx + 0x3c], ebp
145957743: f30f11740840 movss dword ptr [rax + rcx + 0x40], xmm6
145957749: f30f117c0844 movss dword ptr [rax + rcx + 0x44], xmm7
14595774f: f3440f11440848 movss dword ptr [rax + rcx + 0x48], xmm8
145957756: f3440f1164084c movss dword ptr [rax + rcx + 0x4c], xmm12
14595775d: f3440f114c0850 movss dword ptr [rax + rcx + 0x50], xmm9
145957764: f3440f115c0854 movss dword ptr [rax + rcx + 0x54], xmm11
14595776b: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
145957773: 44897c085c mov dword ptr [rax + rcx + 0x5c], r15d
145957778: f3440f11540860 movss dword ptr [rax + rcx + 0x60], xmm10
14595777f: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145957787: 498d5601 lea rdx, [r14 + 1]
14595778b: 0f57c0 xorps xmm0, xmm0
14595778e: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
145957793: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14595779c: 48899698050000 mov qword ptr [rsi + 0x598], rdx
1459577a3: 4c89f0 mov rax, r14
1459577a6: 0f28742440 movaps xmm6, xmmword ptr [rsp + 0x40]
1459577ab: 0f287c2450 movaps xmm7, xmmword ptr [rsp + 0x50]
1459577b0: 440f28442460 movaps xmm8, xmmword ptr [rsp + 0x60]
1459577b6: 440f284c2470 movaps xmm9, xmmword ptr [rsp + 0x70]
1459577bc: 440f28942480000000 movaps xmm10, xmmword ptr [rsp + 0x80]
1459577c5: 440f289c2490000000 movaps xmm11, xmmword ptr [rsp + 0x90]
1459577ce: 440f28a424a0000000 movaps xmm12, xmmword ptr [rsp + 0xa0]
1459577d7: 4881c4b8000000 add rsp, 0xb8
1459577de: 5b pop rbx
1459577df: 5d pop rbp
1459577e0: 5f pop rdi
1459577e1: 5e pop rsi
1459577e2: 415e pop r14
1459577e4: 415f pop r15
1459577e6: c3 ret

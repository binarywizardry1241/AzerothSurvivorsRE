1459508f0: 4157 push r15
1459508f2: 4156 push r14
1459508f4: 56 push rsi
1459508f5: 57 push rdi
1459508f6: 55 push rbp
1459508f7: 53 push rbx
1459508f8: 4881ecb8000000 sub rsp, 0xb8
1459508ff: 440f29a424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm12
145950908: 440f299c2490000000 movaps xmmword ptr [rsp + 0x90], xmm11
145950911: 440f29942480000000 movaps xmmword ptr [rsp + 0x80], xmm10
14595091a: 440f294c2470 movaps xmmword ptr [rsp + 0x70], xmm9
145950920: 440f29442460 movaps xmmword ptr [rsp + 0x60], xmm8
145950926: 0f297c2450 movaps xmmword ptr [rsp + 0x50], xmm7
14595092b: 0f29742440 movaps xmmword ptr [rsp + 0x40], xmm6
145950930: 0f28f3 movaps xmm6, xmm3
145950933: 4c89c7 mov rdi, r8
145950936: 4889d3 mov rbx, rdx
145950939: 4889ce mov rsi, rcx
14595093c: 4c8bb42438010000 mov r14, qword ptr [rsp + 0x138]
145950944: f30f10bc2410010000 movss xmm7, dword ptr [rsp + 0x110]
14595094d: 8ba9380a0000 mov ebp, dword ptr [rcx + 0xa38]
145950953: ffc5 inc ebp
145950955: 89a9380a0000 mov dword ptr [rcx + 0xa38], ebp
14595095b: f3440f1089340a0000 movss xmm9, dword ptr [rcx + 0xa34]
145950964: 4c8bb998090000 mov r15, qword ptr [rcx + 0x998]
14595096b: 498d4f10 lea rcx, [r15 + 0x10]
14595096f: 0f28cb movaps xmm1, xmm3
145950972: 0f28d7 movaps xmm2, xmm7
145950975: e8a6f8f7ff call 0x1458d0220
14595097a: a801 test al, 1
14595097c: 7406 je 0x145950984
14595097e: 440f28c0 movaps xmm8, xmm0
145950982: eb34 jmp 0x1459509b8
145950984: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145950989: 7424 je 0x1459509af
14595098b: 498d5768 lea rdx, [r15 + 0x68]
14595098f: 488d4c2428 lea rcx, [rsp + 0x28]
145950994: 0f28d6 movaps xmm2, xmm6
145950997: 0f28df movaps xmm3, xmm7
14595099a: e8714af8ff call 0x1458d5410
14595099f: 837c242801 cmp dword ptr [rsp + 0x28], 1
1459509a4: 7509 jne 0x1459509af
1459509a6: f3440f10442434 movss xmm8, dword ptr [rsp + 0x34]
1459509ad: eb09 jmp 0x1459509b8
1459509af: f3450f1087b8000000 movss xmm8, dword ptr [r15 + 0xb8]
1459509b8: f3440f10942430010000 movss xmm10, dword ptr [rsp + 0x130]
1459509c2: 448bbc2428010000 mov r15d, dword ptr [rsp + 0x128]
1459509ca: f3440f109c2420010000 movss xmm11, dword ptr [rsp + 0x120]
1459509d4: f3440f10a42418010000 movss xmm12, dword ptr [rsp + 0x118]
1459509de: 410f1006 movups xmm0, xmmword ptr [r14]
1459509e2: 0f11442430 movups xmmword ptr [rsp + 0x30], xmm0
1459509e7: 4c8bb698050000 mov r14, qword ptr [rsi + 0x598]
1459509ee: 4c3bb688050000 cmp r14, qword ptr [rsi + 0x588]
1459509f5: 750c jne 0x145950a03
1459509f7: 488d8e88050000 lea rcx, [rsi + 0x588]
1459509fe: e8fd432a00 call 0x145bf4e00
145950a03: f3450f58d9 addss xmm11, xmm9
145950a08: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
145950a0f: 4c89f1 mov rcx, r14
145950a12: 48c1e107 shl rcx, 7
145950a16: 48c7040800000000 mov qword ptr [rax + rcx], 0
145950a1e: 0f10442428 movups xmm0, xmmword ptr [rsp + 0x28]
145950a23: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
145950a28: 488b542438 mov rdx, qword ptr [rsp + 0x38]
145950a2d: 4889540818 mov qword ptr [rax + rcx + 0x18], rdx
145950a32: 48895c0820 mov qword ptr [rax + rcx + 0x20], rbx
145950a37: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
145950a40: 488b17 mov rdx, qword ptr [rdi]
145950a43: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
145950a48: 8b5708 mov edx, dword ptr [rdi + 8]
145950a4b: 89540838 mov dword ptr [rax + rcx + 0x38], edx
145950a4f: 896c083c mov dword ptr [rax + rcx + 0x3c], ebp
145950a53: f30f11740840 movss dword ptr [rax + rcx + 0x40], xmm6
145950a59: f30f117c0844 movss dword ptr [rax + rcx + 0x44], xmm7
145950a5f: f3440f11440848 movss dword ptr [rax + rcx + 0x48], xmm8
145950a66: f3440f1164084c movss dword ptr [rax + rcx + 0x4c], xmm12
145950a6d: f3440f114c0850 movss dword ptr [rax + rcx + 0x50], xmm9
145950a74: f3440f115c0854 movss dword ptr [rax + rcx + 0x54], xmm11
145950a7b: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
145950a83: 44897c085c mov dword ptr [rax + rcx + 0x5c], r15d
145950a88: f3440f11540860 movss dword ptr [rax + rcx + 0x60], xmm10
145950a8f: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145950a97: 498d5601 lea rdx, [r14 + 1]
145950a9b: 0f57c0 xorps xmm0, xmm0
145950a9e: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
145950aa3: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145950aac: 48899698050000 mov qword ptr [rsi + 0x598], rdx
145950ab3: 4c89f0 mov rax, r14
145950ab6: 0f28742440 movaps xmm6, xmmword ptr [rsp + 0x40]
145950abb: 0f287c2450 movaps xmm7, xmmword ptr [rsp + 0x50]
145950ac0: 440f28442460 movaps xmm8, xmmword ptr [rsp + 0x60]
145950ac6: 440f284c2470 movaps xmm9, xmmword ptr [rsp + 0x70]
145950acc: 440f28942480000000 movaps xmm10, xmmword ptr [rsp + 0x80]
145950ad5: 440f289c2490000000 movaps xmm11, xmmword ptr [rsp + 0x90]
145950ade: 440f28a424a0000000 movaps xmm12, xmmword ptr [rsp + 0xa0]
145950ae7: 4881c4b8000000 add rsp, 0xb8
145950aee: 5b pop rbx
145950aef: 5d pop rbp
145950af0: 5f pop rdi
145950af1: 5e pop rsi
145950af2: 415e pop r14
145950af4: 415f pop r15
145950af6: c3 ret

1411a4547: mov rax, qword ptr [rbp + 0x5c0]
1411a454e: movss xmm15, dword ptr [rbp + 0x5d0]
1411a4557: inc dword ptr [rbp + 0x544]
1411a455d: addss xmm15, xmm13
1411a4562: movss xmm0, dword ptr [rax + 0x10]
1411a4567: movss xmm1, dword ptr [rax + 0x18]
1411a456c: movss dword ptr [rbp + 0x48c], xmm0
1411a4574: movss dword ptr [rbp + 0x490], xmm15
1411a457d: movss dword ptr [rbp + 0x494], xmm1
1411a4585: mov dword ptr [rbp + 0x540], 0x4080e38e
1411a458f: movabs rax, 0xbf80000000000000
1411a4599: mov qword ptr [rbp + 0x390], rax
1411a45a0: mov dword ptr [rbp + 0x398], 0
1411a45aa: mov dword ptr [rsp + 0x20], 0x4080e38e
1411a45b2: lea rcx, [rbp + 0x330]
1411a45b9: lea rdx, [rbp - 0x40]
1411a45bd: lea r8, [rbp + 0x48c]
1411a45c4: lea r9, [rbp + 0x390]
1411a45cb: call 0x141598890
1411a45d0: movss xmm2, dword ptr [rbp + 0x5d0]
1411a45d8: mov eax, dword ptr [rbp + 0x330]
1411a45de: movss dword ptr [rbp + 0x380], xmm15
1411a45e7: movaps xmm0, xmm15
1411a45eb: subss xmm0, dword ptr [rbp + 0x338]
1411a45f3: movaps xmm15, xmm2
1411a45f7: mov dword ptr [rbp + 0x598], eax
1411a45fd: test eax, eax
1411a45ff: je 0x1411a464c
1411a4601: movaps xmm15, xmm0
1411a4605: movss dword ptr [rbp + 0x300], xmm0

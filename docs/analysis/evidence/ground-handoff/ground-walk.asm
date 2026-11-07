1411a4192: mov rax, qword ptr [rbp + 0x568]
1411a4199: movss xmm4, dword ptr [rax + 0x2c]
1411a419e: movss xmm1, dword ptr [rax + 0x18]
1411a41a3: movss xmm2, dword ptr [rax + 0x1c]
1411a41a8: inc dword ptr [rbp + 0x544]
1411a41ae: inc dword ptr [rbp + 0x4e4]
1411a41b4: xorps xmm0, xmm0
1411a41b7: movaps xmm3, xmmword ptr [rbp + 0x4b0]
1411a41be: subss xmm3, xmm2
1411a41c2: addss xmm2, xmm0
1411a41c6: movaps xmm15, xmm6
1411a41ca: subss xmm15, xmm1
1411a41cf: movaps xmmword ptr [rbp + 0x300], xmm4
1411a41d6: unpcklps xmm1, xmm4
1411a41d9: addps xmm1, xmm8
1411a41dd: movlps qword ptr [rbp + 0x330], xmm1
1411a41e4: movss dword ptr [rbp + 0x338], xmm2
1411a41ec: movss dword ptr [rbp + 0x498], xmm15
1411a41f5: mov dword ptr [rbp + 0x49c], 0
1411a41ff: movaps xmmword ptr [rbp + 0x380], xmm3
1411a4206: movss dword ptr [rbp + 0x4a0], xmm3
1411a420e: test dword ptr [rbp + 0x5a4], 0x40000000
1411a4218: je 0x1411a421e
1411a421a: movaps xmm0, xmm9
1411a421e: mov dword ptr [rbp + 0x398], 0x40000000
1411a4228: movss dword ptr [rbp + 0x39c], xmm0
1411a4230: mov eax, dword ptr [rbp + 0x580]
1411a4236: mov dword ptr [rbp + 0x390], eax
1411a423c: movss xmm0, dword ptr [rbp + 0x4ec]
1411a4244: movss dword ptr [rbp + 0x394], xmm0
1411a424c: mov byte ptr [rbp + 0x3a0], 0
1411a4253: lea rax, [rbp + 0x390]
1411a425a: mov qword ptr [rsp + 0x38], rax
1411a425f: lea rax, [rbp + 0x498]
1411a4266: mov qword ptr [rsp + 0x20], rax
1411a426b: mov dword ptr [rsp + 0x30], 0
1411a4273: mov qword ptr [rsp + 0x28], 1
1411a427c: lea rcx, [rbp + 0x348]
1411a4283: lea rdx, [rbp - 0x40]
1411a4287: mov r8, qword ptr [rbp + 0x2c8]
1411a428e: lea r9, [rbp + 0x330]
1411a4295: call 0x140d25720
1411a429a: mov eax, dword ptr [rbp + 0x350]
1411a42a0: movss xmm0, dword ptr [rbp + 0x374]
1411a42a8: addss xmm0, xmm10
1411a42ad: movaps xmmword ptr [rbp + 0x580], xmm0
1411a42b4: mov dword ptr [rbp + 0x598], eax
1411a42ba: test eax, eax
1411a42bc: je 0x1411a42cd
1411a42be: movss xmm0, dword ptr [rbp + 0x5d0]
1411a42c6: movaps xmmword ptr [rbp + 0x580], xmm0

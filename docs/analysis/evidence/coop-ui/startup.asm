; 0.115.0 registered Coop resource descriptor, initializer and insertion boundary.
0x000000014020b6ef: mov r14, qword ptr [r15]
0x000000014020b6f2: lea rax, [r14 + 1]
0x000000014020b6f6: mov qword ptr [r15], rax
0x000000014020b6f9: mov word ptr [rbp + 0x300], 0x100
0x000000014020b702: mov qword ptr [rbp + 0x2b0], 1
0x000000014020b70d: movdqu xmm0, xmmword ptr [rip + 0x5d04493]
0x000000014020b715: movdqu xmmword ptr [rbp + 0x2b8], xmm0
0x000000014020b71d: mov qword ptr [rbp + 0x2d8], 8
0x000000014020b728: mov qword ptr [rbp + 0x2e0], 0x138
0x000000014020b733: lea rax, [rip - 0x17f95a]
0x000000014020b73a: mov qword ptr [rbp + 0x2f8], rax
0x000000014020b741: mov byte ptr [rbp + 0x302], 1
0x000000014020b748: mov qword ptr [rbp + 0x2c8], 0
0x000000014020b753: mov byte ptr [rbp + 0x2e8], 2
0x000000014020b75a: lea r8, [rbp + 0x2b0]
0x000000014020b761: mov rcx, rdi
0x000000014020b764: mov rdx, r14
0x000000014020b767: call 0x140028eb0
0x000000014020b76c: nop
0x000000014020b76d: lea rcx, [rsi + 0x78]
0x000000014020b771: lea rdx, [rip + 0x5d04430]
0x000000014020b778: mov r8, r14
0x000000014020b77b: call 0x140028d00
0x000000014020b780: nop
0x000000014020b781: mov rdx, qword ptr [rbp + 0x510]
0x000000014020b788: test rdx, rdx
0x000000014020b78b: je 0x14020b7a3
0x000000014020b78d: mov rcx, qword ptr [rbp + 0x518]
0x000000014020b794: shl rdx, 3
0x000000014020b798: mov r8d, 8
0x000000014020b79e: call 0x1400021d0
0x000000014020b7a3: lea rbx, [rsi + 0x1d8]
0x000000014020b7aa: cmp r14, qword ptr [rsi + 0x218]
0x000000014020b7b1: jae 0x14020b7dc
0x000000014020b7b3: mov rax, qword ptr [rsi + 0x210]
0x000000014020b7ba: mov rax, qword ptr [rax + r14*8]
0x000000014020b7be: test rax, rax
0x000000014020b7c1: je 0x14020b7dc
0x000000014020b7c3: mov rcx, qword ptr [rsi + 0x1e0]
0x000000014020b7ca: not rax
0x000000014020b7cd: imul rax, rax, 0x38
0x000000014020b7d1: cmp byte ptr [rcx + rax + 0x30], 0
0x000000014020b7d6: jne 0x14020b945
0x000000014020b7dc: pxor xmm0, xmm0
0x000000014020b7e0: movdqu xmmword ptr [rbp + 0x2c0], xmm0
0x000000014020b7e8: movdqu xmmword ptr [rbp + 0x2d8], xmm0
0x000000014020b7f0: movdqu xmmword ptr [rbp + 0x2f0], xmm0
0x000000014020b7f8: movdqu xmmword ptr [rbp + 0x308], xmm0
0x000000014020b800: movdqu xmmword ptr [rbp + 0x338], xmm0
0x000000014020b808: movdqu xmmword ptr [rbp + 0x350], xmm0
0x000000014020b810: movdqu xmmword ptr [rbp + 0x368], xmm0
0x000000014020b818: movdqu xmmword ptr [rbp + 0x380], xmm0
0x000000014020b820: movdqu xmmword ptr [rbp + 0x398], xmm0
0x000000014020b828: mov qword ptr [rbp + 0x2b0], 0
0x000000014020b833: mov qword ptr [rbp + 0x2b8], 1
0x000000014020b83e: mov qword ptr [rbp + 0x2d0], 1
0x000000014020b849: mov qword ptr [rbp + 0x2e8], 1
0x000000014020b854: mov qword ptr [rbp + 0x300], 1
0x000000014020b85f: mov qword ptr [rbp + 0x318], 8
0x000000014020b86a: movdqu xmmword ptr [rbp + 0x320], xmm0
0x000000014020b872: mov qword ptr [rbp + 0x330], 8
0x000000014020b87d: mov qword ptr [rbp + 0x348], 1
0x000000014020b888: mov qword ptr [rbp + 0x360], 1
0x000000014020b893: mov qword ptr [rbp + 0x378], 1
0x000000014020b89e: mov qword ptr [rbp + 0x390], 1
0x000000014020b8a9: mov qword ptr [rbp + 0x3a8], 1
0x000000014020b8b4: mov qword ptr [rbp + 0x3b0], 0
0x000000014020b8bf: mov qword ptr [rbp + 0x3b8], 0xffffffffffffffff
0x000000014020b8ca: movdqu xmmword ptr [rbp + 0x3d0], xmm0
0x000000014020b8d2: mov qword ptr [rbp + 0x3dd], 0
0x000000014020b8dd: mov r12d, dword ptr [rsi + 0x5b0]
0x000000014020b8e4: mov rcx, rsi
0x000000014020b8e7: call 0x144de2270
0x000000014020b8ec: mov qword ptr [rbp + 0x510], r14
0x000000014020b8f3: lea r9, [rbp + 0x510]
0x000000014020b8fa: mov rcx, rbx
0x000000014020b8fd: mov rdx, r14
0x000000014020b900: mov r8, rdi
0x000000014020b903: call 0x1401ee320
0x000000014020b908: mov r14, rax
0x000000014020b90b: cmp byte ptr [rax + 0x30], 1
0x000000014020b90f: jne 0x14020b924
0x000000014020b911: lea r8, [rbp + 0x2b0]
0x000000014020b918: mov rcx, r14
0x000000014020b91b: xor edx, edx
0x000000014020b91d: call 0x144df1880
0x000000014020b922: jmp 0x14020b941
0x000000014020b924: mov r8, qword ptr [r14 + 8]
0x000000014020b928: mov rcx, qword ptr [r14 + 0x10]
0x000000014020b92c: lea rdx, [rbp + 0x2b0]
0x000000014020b933: call 0x145d14607
0x000000014020b938: mov dword ptr [r14 + 0x28], r12d
0x000000014020b93c: mov byte ptr [r14 + 0x30], 1
0x000000014020b941: mov dword ptr [r14 + 0x2c], r12d

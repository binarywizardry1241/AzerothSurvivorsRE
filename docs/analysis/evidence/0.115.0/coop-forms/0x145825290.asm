0x145825290: push rbp
0x145825291: push rsi
0x145825292: push rdi
0x145825293: push rbx
0x145825294: sub rsp, 0x38
0x145825298: lea rbp, [rsp + 0x30]
0x14582529d: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458252a5: mov rsi, rcx
0x1458252a8: mov rbx, qword ptr [rcx]
0x1458252ab: mov cl, 1
0x1458252ad: xor eax, eax
0x1458252af: lock cmpxchg byte ptr [rbx + 0x10], cl
0x1458252b4: jne 0x14582542d
0x1458252ba: mov rdi, qword ptr [rip + 0x29ef777]
0x1458252c1: mov rax, qword ptr [rdi]
0x1458252c4: shl rax, 1
0x1458252c7: test rax, rax
0x1458252ca: jne 0x14582543b
0x1458252d0: mov dword ptr [rbp - 4], 0
0x1458252d7: movzx eax, byte ptr [rbx + 0x11]
0x1458252db: mov rcx, qword ptr [rbx + 0xa8]
0x1458252e2: mov qword ptr [rbp - 0x10], rbx
0x1458252e6: mov rax, qword ptr [rbx + 0xb0]
0x1458252ed: call qword ptr [rax + 0x28]
0x1458252f0: nop
0x1458252f1: cmp al, 2
0x1458252f3: je 0x145825320
0x1458252f5: xor eax, eax
0x1458252f7: mov rdx, qword ptr [rbp - 0x10]
0x1458252fb: cmp dword ptr [rdx + 0xa0], -1
0x145825302: sete al
0x145825305: shl eax, 5
0x145825308: mov rcx, qword ptr [rdx + rax + 0x88]
0x145825310: mov rax, qword ptr [rdx + rax + 0x90]
0x145825318: call qword ptr [rax + 0x28]
0x14582531b: nop
0x14582531c: cmp al, 2
0x14582531e: jne 0x145825353
0x145825320: xor eax, eax
0x145825322: mov rbx, qword ptr [rbp - 0x10]
0x145825326: mov edx, dword ptr [rbp - 4]
0x145825329: test dl, dl
0x14582532b: jne 0x14582533c
0x14582532d: mov rcx, qword ptr [rdi]
0x145825330: shl rcx, 1
0x145825333: test rcx, rcx
0x145825336: jne 0x14582545f
0x14582533c: xor ecx, ecx
0x14582533e: xchg byte ptr [rbx + 0x10], cl
0x145825341: cmp cl, 2
0x145825344: je 0x14582544a
0x14582534a: add rsp, 0x38
0x14582534e: pop rbx
0x14582534f: pop rdi
0x145825350: pop rsi
0x145825351: pop rbp
0x145825352: ret
0x145825353: mov rbx, qword ptr [rbp - 0x10]
0x145825357: cmp qword ptr [rbx + 0xd8], 0
0x14582535f: je 0x145825407
0x145825365: lea rdx, [rsi + 8]
0x145825369: lea rcx, [rbx + 0xe0]
0x145825370: call 0x140f02e30
0x145825375: mov r8, rax
0x145825378: shr r8, 0x39
0x14582537c: mov rcx, qword ptr [rbx + 0xc0]
0x145825383: mov rdx, qword ptr [rbx + 0xc8]
0x14582538a: movd xmm0, r8d
0x14582538f: punpcklbw xmm0, xmm0
0x145825393: pshuflw xmm0, xmm0, 0
0x145825398: pshufd xmm0, xmm0, 0x44
0x14582539d: mov r8d, dword ptr [rsi + 8]
0x1458253a1: xor r9d, r9d
0x1458253a4: pcmpeqd xmm1, xmm1
0x1458253a8: and rax, rdx
0x1458253ab: movdqu xmm2, xmmword ptr [rcx + rax]
0x1458253b0: movdqa xmm3, xmm2
0x1458253b4: pcmpeqb xmm3, xmm0
0x1458253b8: pmovmskb r10d, xmm3
0x1458253bd: test r10d, r10d
0x1458253c0: je 0x1458253ec
0x1458253c2: tzcnt r11d, r10d
0x1458253c7: add r11, rax
0x1458253ca: and r11, rdx
0x1458253cd: neg r11
0x1458253d0: lea r11, [r11 + r11*2]
0x1458253d4: shl r11, 4
0x1458253d8: cmp r8d, dword ptr [rcx + r11 - 0x30]
0x1458253dd: je 0x14582540e
0x1458253df: lea r11d, [r10 - 1]
0x1458253e3: and r11w, r10w
0x1458253e7: mov r10d, r11d
0x1458253ea: jne 0x1458253c2
0x1458253ec: pcmpeqb xmm2, xmm1
0x1458253f0: pmovmskb r10d, xmm2
0x1458253f5: test r10d, r10d
0x1458253f8: jne 0x145825407
0x1458253fa: add rax, r9
0x1458253fd: add rax, 0x10
0x145825401: add r9, 0x10
0x145825405: jmp 0x1458253a8
0x145825407: xor eax, eax
0x145825409: jmp 0x145825326
0x14582540e: add rcx, r11
0x145825411: mov al, 1
0x145825413: cmp byte ptr [rcx - 8], 0
0x145825417: mov edx, dword ptr [rbp - 4]
0x14582541a: jne 0x145825329
0x145825420: cmp qword ptr [rcx - 0x10], 0
0x145825425: setne al
0x145825428: jmp 0x145825329
0x14582542d: lea rcx, [rbx + 0x10]
0x145825431: call 0x145eb5670
0x145825436: jmp 0x1458252ba
0x14582543b: call 0x145eb6400
0x145825440: xor al, 1
0x145825442: mov dword ptr [rbp - 4], eax
0x145825445: jmp 0x1458252d7
0x14582544a: add rbx, 0x10
0x14582544e: mov rcx, rbx
0x145825451: mov esi, eax
0x145825453: call 0x145eb5730
0x145825458: mov eax, esi
0x14582545a: jmp 0x14582534a
0x14582545f: mov esi, eax
0x145825461: call 0x145eb6400
0x145825466: mov ecx, eax
0x145825468: mov eax, esi
0x14582546a: test cl, cl
0x14582546c: jne 0x14582533c
0x145825472: mov byte ptr [rbx + 0x11], 1
0x145825476: jmp 0x14582533c

0x145893fc0: push rbp
0x145893fc1: push r14
0x145893fc3: push rsi
0x145893fc4: push rdi
0x145893fc5: push rbx
0x145893fc6: sub rsp, 0x600
0x145893fcd: lea rbp, [rsp + 0x80]
0x145893fd5: mov qword ptr [rbp + 0x578], 0xfffffffffffffffe
0x145893fe0: mov rsi, rcx
0x145893fe3: mov bl, byte ptr [rcx + 0x180b]
0x145893fe9: mov dil, byte ptr [rcx + 0x180c]
0x145893ff0: mov r14b, byte ptr [rcx + 0x180d]
0x145893ff7: lea rcx, [rbp - 0x58]
0x145893ffb: mov rdx, rsi
0x145893ffe: call 0x1458916c0
0x145894003: lea rdx, [rsi + 0xf98]
0x14589400a: lea r8, [rsi + 0x1168]
0x145894011: mov r9, qword ptr [rsi + 0x17c0]
0x145894018: lea rcx, [rbp + 0x380]
0x14589401f: call 0x145816520
0x145894024: nop
0x145894025: mov rax, qword ptr [rbp + 0x500]
0x14589402c: mov qword ptr [rbp + 0x310], rax
0x145894033: movups xmm0, xmmword ptr [rbp + 0x380]
0x14589403a: movaps xmmword ptr [rbp + 0x190], xmm0
0x145894041: mov rax, qword ptr [rbp + 0x390]
0x145894048: mov qword ptr [rbp + 0x1a0], rax
0x14589404f: movzx eax, byte ptr [rbp + 0x55b]
0x145894056: mov byte ptr [rbp + 0x36b], al
0x14589405c: movzx eax, word ptr [rbp + 0x55c]
0x145894063: mov word ptr [rbp + 0x36c], ax
0x14589406a: mov eax, dword ptr [rbp + 0x55e]
0x145894070: mov dword ptr [rbp + 0x36e], eax
0x145894076: movzx eax, byte ptr [rbp + 0x562]
0x14589407d: mov byte ptr [rbp + 0x372], al
0x145894083: movups xmm0, xmmword ptr [rbp + 0x508]
0x14589408a: movups xmmword ptr [rbp + 0x318], xmm0
0x145894091: movups xmm0, xmmword ptr [rbp + 0x518]
0x145894098: movups xmmword ptr [rbp + 0x328], xmm0
0x14589409f: movups xmm0, xmmword ptr [rbp + 0x528]
0x1458940a6: movups xmmword ptr [rbp + 0x338], xmm0
0x1458940ad: movups xmm0, xmmword ptr [rbp + 0x538]
0x1458940b4: movups xmmword ptr [rbp + 0x348], xmm0
0x1458940bb: movups xmm0, xmmword ptr [rbp + 0x544]
0x1458940c2: movups xmmword ptr [rbp + 0x354], xmm0
0x1458940c9: lea rdx, [rbp + 0x438]
0x1458940d0: lea rcx, [rbp + 0x248]
0x1458940d7: mov r8d, 0x98
0x1458940dd: call 0x145d145fb
0x1458940e2: movups xmm0, xmmword ptr [rbp + 0x398]
0x1458940e9: movups xmmword ptr [rbp + 0x1a8], xmm0
0x1458940f0: mov rax, qword ptr [rbp + 0x3a8]
0x1458940f7: mov qword ptr [rbp + 0x1b8], rax
0x1458940fe: movups xmm0, xmmword ptr [rbp + 0x4d0]
0x145894105: movaps xmmword ptr [rbp + 0x2e0], xmm0
0x14589410c: movups xmm0, xmmword ptr [rbp + 0x4e0]
0x145894113: movaps xmmword ptr [rbp + 0x2f0], xmm0
0x14589411a: movups xmm0, xmmword ptr [rbp + 0x4f0]
0x145894121: movaps xmmword ptr [rbp + 0x300], xmm0
0x145894128: mov byte ptr [rbp + 0x368], bl
0x14589412e: mov byte ptr [rbp + 0x369], dil
0x145894135: mov byte ptr [rbp + 0x36a], r14b
0x14589413c: movups xmm0, xmmword ptr [rbp - 0x58]
0x145894140: movups xmm1, xmmword ptr [rbp - 0x48]
0x145894144: movups xmm2, xmmword ptr [rbp - 0x38]
0x145894148: movups xmm3, xmmword ptr [rbp - 0x28]
0x14589414c: movups xmmword ptr [rbp + 0x1d8], xmm0
0x145894153: movups xmmword ptr [rbp + 0x1e8], xmm1
0x14589415a: movups xmmword ptr [rbp + 0x1f8], xmm2
0x145894161: movups xmmword ptr [rbp + 0x208], xmm3
0x145894168: movups xmm0, xmmword ptr [rbp - 0x18]
0x14589416c: movups xmmword ptr [rbp + 0x218], xmm0
0x145894173: movups xmm0, xmmword ptr [rbp - 8]
0x145894177: movups xmmword ptr [rbp + 0x228], xmm0
0x14589417e: movups xmm0, xmmword ptr [rbp + 8]
0x145894182: movups xmmword ptr [rbp + 0x238], xmm0
0x145894189: mov eax, dword ptr [rbp + 0x554]
0x14589418f: mov dword ptr [rbp + 0x364], eax
0x145894195: movzx eax, byte ptr [rbp + 0x563]
0x14589419c: mov byte ptr [rbp + 0x373], al
0x1458941a2: movups xmm0, xmmword ptr [rbp + 0x3b0]
0x1458941a9: movaps xmmword ptr [rbp + 0x1c0], xmm0
0x1458941b0: mov rax, qword ptr [rbp + 0x3c0]
0x1458941b7: mov qword ptr [rbp + 0x1d0], rax
0x1458941be: mov rdx, qword ptr [rbp + 0x3c8]
0x1458941c5: cmp rdx, -1
0x1458941c9: je 0x14589423c
0x1458941cb: test rdx, rdx
0x1458941ce: je 0x1458941e2
0x1458941d0: mov rcx, qword ptr [rbp + 0x3d0]
0x1458941d7: mov r8d, 1
0x1458941dd: call 0x1400021d0
0x1458941e2: mov rdx, qword ptr [rbp + 0x3e0]
0x1458941e9: test rdx, rdx
0x1458941ec: je 0x145894200
0x1458941ee: mov rcx, qword ptr [rbp + 0x3e8]
0x1458941f5: mov r8d, 1
0x1458941fb: call 0x1400021d0
0x145894200: mov rdx, qword ptr [rbp + 0x3f8]
0x145894207: test rdx, rdx
0x14589420a: je 0x14589421e
0x14589420c: mov rcx, qword ptr [rbp + 0x400]
0x145894213: mov r8d, 1
0x145894219: call 0x1400021d0
0x14589421e: mov rdx, qword ptr [rbp + 0x410]
0x145894225: test rdx, rdx
0x145894228: je 0x14589423c
0x14589422a: mov rcx, qword ptr [rbp + 0x418]
0x145894231: mov r8d, 1
0x145894237: call 0x1400021d0
0x14589423c: cmp dword ptr [rsi + 0xc58], 1
0x145894243: ja 0x14589436a
0x145894249: cmp byte ptr [rsi + 0xf48], 0
0x145894250: je 0x14589436a
0x145894256: cmp qword ptr [rsi + 0xf20], 0
0x14589425e: jne 0x14589436a
0x145894264: mov byte ptr [rbp + 0x577], 1
0x14589426b: lea rcx, [rbp + 0x380]
0x145894272: lea rdx, [rbp + 0x190]
0x145894279: call 0x14589a800
0x14589427e: nop
0x14589427f: lea rcx, [rbp - 0x58]
0x145894283: lea rdx, [rbp + 0x380]
0x14589428a: mov r8d, 0x1e8
0x145894290: call 0x145d145fb
0x145894295: lea rdi, [rsi + 0xc98]
0x14589429c: cmp qword ptr [rsi + 0xc98], -1
0x1458942a4: je 0x1458942ae
0x1458942a6: mov rcx, rdi
0x1458942a9: call 0x1458132e0
0x1458942ae: lea rdx, [rbp - 0x58]
0x1458942b2: mov r8d, 0x1e8
0x1458942b8: mov rcx, rdi
0x1458942bb: call 0x145d145fb
0x1458942c0: lea rcx, [rbp + 0x380]
0x1458942c7: lea rdx, [rbp + 0x190]
0x1458942ce: mov r8d, 0x1e8
0x1458942d4: call 0x145d145fb
0x1458942d9: mov rcx, qword ptr [rsi + 0xf10]
0x1458942e0: mov rdx, qword ptr [rsi + 0xf18]
0x1458942e7: lea r8, [rsi + 0xc80]
0x1458942ee: call 0x145824200
0x1458942f3: nop
0x1458942f4: mov rdi, qword ptr [rsi + 0xf10]
0x1458942fb: mov rsi, qword ptr [rsi + 0xf18]
0x145894302: lea rcx, [rbp - 0x58]
0x145894306: lea rdx, [rbp + 0x380]
0x14589430d: call 0x14581c690
0x145894312: nop
0x145894313: mov rdx, qword ptr [rbp - 0x50]
0x145894317: mov r8, qword ptr [rbp - 0x48]
0x14589431b: lock add qword ptr [rip + 0x2982e25], r8
0x145894323: lock inc qword ptr [rip + 0x2982e2d]
0x14589432b: mov rcx, rdi
0x14589432e: mov qword ptr [rbp + 0x568], rdx
0x145894335: call qword ptr [rsi + 0x18]
0x145894338: nop
0x145894339: mov rdx, qword ptr [rbp - 0x58]
0x14589433d: test rdx, rdx
0x145894340: je 0x145894354
0x145894342: mov r8d, 1
0x145894348: mov rcx, qword ptr [rbp + 0x568]
0x14589434f: call 0x1400021d0
0x145894354: mov byte ptr [rbp + 0x577], 0
0x14589435b: lea rcx, [rbp + 0x380]
0x145894362: call 0x1458712e0
0x145894367: nop
0x145894368: jmp 0x145894377
0x14589436a: lea rcx, [rbp + 0x190]
0x145894371: call 0x1458132e0
0x145894376: nop
0x145894377: add rsp, 0x600
0x14589437e: pop rbx
0x14589437f: pop rdi
0x145894380: pop rsi
0x145894381: pop r14
0x145894383: pop rbp
0x145894384: ret

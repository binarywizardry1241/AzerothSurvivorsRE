0x1458551a0: push rsi
0x1458551a1: push rdi
0x1458551a2: push rbx
0x1458551a3: sub rsp, 0x20
0x1458551a7: mov rax, rcx
0x1458551aa: movzx ecx, byte ptr [rdx]
0x1458551ad: cmp rcx, 0x23
0x1458551b1: ja 0x1458551fa
0x1458551b3: lea r8, [rip + 0x17d6ee6]
0x1458551ba: movsxd rcx, dword ptr [r8 + rcx*4]
0x1458551be: add rcx, r8
0x1458551c1: jmp rcx
0x1458551c3: movups xmm0, xmmword ptr [rdx + 0x20]
0x1458551c7: movups xmm1, xmmword ptr [rdx + 0x30]
0x1458551cb: movups xmmword ptr [rax + 0x30], xmm1
0x1458551cf: movups xmmword ptr [rax + 0x20], xmm0
0x1458551d3: movups xmm0, xmmword ptr [rdx + 0x10]
0x1458551d7: movups xmmword ptr [rax + 0x10], xmm0
0x1458551db: movsd xmm0, qword ptr [rdx + 4]
0x1458551e0: movaps xmm1, xmmword ptr [rip + 0x68af49]
0x1458551e7: movss xmm1, xmm2
0x1458551eb: mulps xmm1, xmm0
0x1458551ee: movlps qword ptr [rax + 4], xmm1
0x1458551f2: mov byte ptr [rax], 0
0x1458551f5: jmp 0x14585561e
0x1458551fa: movups xmm0, xmmword ptr [rdx]
0x1458551fd: movups xmm1, xmmword ptr [rdx + 0x10]
0x145855201: movups xmm2, xmmword ptr [rdx + 0x20]
0x145855205: movups xmm3, xmmword ptr [rdx + 0x30]
0x145855209: movups xmmword ptr [rax + 0x30], xmm3
0x14585520d: movups xmmword ptr [rax + 0x20], xmm2
0x145855211: movups xmmword ptr [rax + 0x10], xmm1
0x145855215: movups xmmword ptr [rax], xmm0
0x145855218: jmp 0x14585561e
0x14585521d: mulss xmm2, dword ptr [rdx + 4]
0x145855222: movss dword ptr [rax + 4], xmm2
0x145855227: mov byte ptr [rax], 0x1f
0x14585522a: jmp 0x14585561e
0x14585522f: movups xmm0, xmmword ptr [rdx + 0x10]
0x145855233: movups xmm1, xmmword ptr [rdx + 0x20]
0x145855237: movups xmmword ptr [rax + 0x20], xmm1
0x14585523b: movups xmmword ptr [rax + 0x10], xmm0
0x14585523f: movsd xmm0, qword ptr [rdx + 4]
0x145855244: movaps xmm1, xmmword ptr [rip + 0x68aee5]
0x14585524b: movss xmm1, xmm2
0x14585524f: mulps xmm1, xmm0
0x145855252: movlps qword ptr [rax + 4], xmm1
0x145855256: mov byte ptr [rax], 0x10
0x145855259: jmp 0x14585561e
0x14585525e: mov ecx, dword ptr [rdx + 4]
0x145855261: mov dword ptr [rax + 4], ecx
0x145855264: movsd xmm0, qword ptr [rdx + 8]
0x145855269: movaps xmm1, xmmword ptr [rip + 0x68aec0]
0x145855270: movss xmm1, xmm2
0x145855274: mulps xmm1, xmm0
0x145855277: movlps qword ptr [rax + 8], xmm1
0x14585527b: mov rcx, qword ptr [rdx + 0x10]
0x14585527f: mov qword ptr [rax + 0x10], rcx
0x145855283: mov byte ptr [rax], 0xc
0x145855286: jmp 0x14585561e
0x14585528b: movups xmm0, xmmword ptr [rdx + 0x10]
0x14585528f: movups xmm1, xmmword ptr [rdx + 0x20]
0x145855293: movups xmmword ptr [rax + 0x20], xmm1
0x145855297: movups xmmword ptr [rax + 0x10], xmm0
0x14585529b: movzx ecx, byte ptr [rdx + 1]
0x14585529f: mov r8d, dword ptr [rdx + 8]
0x1458552a3: movss xmm0, dword ptr [rdx + 0xc]
0x1458552a8: mulss xmm2, dword ptr [rdx + 4]
0x1458552ad: mov byte ptr [rax + 1], cl
0x1458552b0: movss dword ptr [rax + 4], xmm2
0x1458552b5: mov dword ptr [rax + 8], r8d
0x1458552b9: movss dword ptr [rax + 0xc], xmm0
0x1458552be: mov byte ptr [rax], 0xf
0x1458552c1: jmp 0x14585561e
0x1458552c6: mov rdi, qword ptr [rdx + 0x10]
0x1458552ca: movaps xmm0, xmm2
0x1458552cd: mov rsi, rax
0x1458552d0: mov rbx, rdx
0x1458552d3: call 0x145d1463d
0x1458552d8: mov rax, rsi
0x1458552db: maxss xmm0, dword ptr [rip + 0x68abcd]
0x1458552e3: xorps xmm1, xmm1
0x1458552e6: maxss xmm1, xmm0
0x1458552ea: movss xmm0, dword ptr [rip + 0x68b31a]
0x1458552f2: minss xmm0, xmm1
0x1458552f6: cvttss2si ecx, xmm0
0x1458552fa: mov qword ptr [rsi + 0x10], rdi
0x1458552fe: movsd xmm0, qword ptr [rbx + 4]
0x145855303: movsd qword ptr [rsi + 4], xmm0
0x145855308: mov byte ptr [rsi + 1], cl
0x14585530b: mov byte ptr [rsi], 0x21
0x14585530e: jmp 0x14585561e
0x145855313: movups xmm0, xmmword ptr [rdx + 0x10]
0x145855317: movups xmm1, xmmword ptr [rdx + 0x20]
0x14585531b: movups xmmword ptr [rax + 0x20], xmm1
0x14585531f: movups xmmword ptr [rax + 0x10], xmm0
0x145855323: mov ecx, dword ptr [rdx + 0xc]
0x145855326: movzx r8d, byte ptr [rdx + 1]
0x14585532b: movsd xmm0, qword ptr [rdx + 4]
0x145855330: movaps xmm1, xmmword ptr [rip + 0x68adf9]
0x145855337: movss xmm1, xmm2
0x14585533b: mulps xmm1, xmm0
0x14585533e: movlps qword ptr [rax + 4], xmm1
0x145855342: mov dword ptr [rax + 0xc], ecx
0x145855345: mov byte ptr [rax + 1], r8b
0x145855349: mov byte ptr [rax], 3
0x14585534c: jmp 0x14585561e
0x145855351: movups xmm0, xmmword ptr [rdx + 0x10]
0x145855355: movups xmm1, xmmword ptr [rdx + 0x20]
0x145855359: movups xmmword ptr [rax + 0x20], xmm1
0x14585535d: movups xmmword ptr [rax + 0x10], xmm0
0x145855361: mulss xmm2, dword ptr [rdx + 8]
0x145855366: mov ecx, dword ptr [rdx + 4]
0x145855369: mov dword ptr [rax + 4], ecx
0x14585536c: movss dword ptr [rax + 8], xmm2
0x145855371: mov byte ptr [rax], 6
0x145855374: jmp 0x14585561e
0x145855379: mulss xmm2, dword ptr [rdx + 4]
0x14585537e: movups xmm0, xmmword ptr [rdx + 8]
0x145855382: movups xmmword ptr [rax + 8], xmm0
0x145855386: movss dword ptr [rax + 4], xmm2
0x14585538b: mov byte ptr [rax], 0xd
0x14585538e: jmp 0x14585561e
0x145855393: movups xmm0, xmmword ptr [rdx + 0x18]
0x145855397: movups xmm1, xmmword ptr [rdx + 0x28]
0x14585539b: movups xmmword ptr [rax + 0x28], xmm1
0x14585539f: movups xmmword ptr [rax + 0x18], xmm0
0x1458553a3: mov rcx, qword ptr [rdx + 0x10]
0x1458553a7: mov r8d, dword ptr [rdx + 0xc]
0x1458553ab: mov qword ptr [rax + 0x10], rcx
0x1458553af: movsd xmm0, qword ptr [rdx + 4]
0x1458553b4: movaps xmm1, xmmword ptr [rip + 0x68ad75]
0x1458553bb: movss xmm1, xmm2
0x1458553bf: mulps xmm1, xmm0
0x1458553c2: movlps qword ptr [rax + 4], xmm1
0x1458553c6: mov dword ptr [rax + 0xc], r8d
0x1458553ca: mov byte ptr [rax], 2
0x1458553cd: jmp 0x14585561e
0x1458553d2: movups xmm0, xmmword ptr [rdx + 0x10]
0x1458553d6: movups xmm1, xmmword ptr [rdx + 0x20]
0x1458553da: movups xmmword ptr [rax + 0x20], xmm1
0x1458553de: movups xmmword ptr [rax + 0x10], xmm0
0x1458553e2: mov ecx, dword ptr [rdx + 8]
0x1458553e5: movss xmm0, dword ptr [rdx + 0xc]
0x1458553ea: mulss xmm2, dword ptr [rdx + 4]
0x1458553ef: movss dword ptr [rax + 4], xmm2
0x1458553f4: mov dword ptr [rax + 8], ecx
0x1458553f7: movss dword ptr [rax + 0xc], xmm0
0x1458553fc: mov byte ptr [rax], 7
0x1458553ff: jmp 0x14585561e
0x145855404: cmp dword ptr [rdx + 8], -1
0x145855408: movups xmm0, xmmword ptr [rdx + 0x28]
0x14585540c: movups xmmword ptr [rax + 0x28], xmm0
0x145855410: movups xmm0, xmmword ptr [rdx + 0x18]
0x145855414: movups xmmword ptr [rax + 0x18], xmm0
0x145855418: je 0x1458555f3
0x14585541e: lea rcx, [rdx + 8]
0x145855422: mov r8d, dword ptr [rcx + 8]
0x145855426: mov dword ptr [rax + 0x10], r8d
0x14585542a: mov rcx, qword ptr [rcx]
0x14585542d: mov qword ptr [rax + 8], rcx
0x145855431: mulss xmm2, dword ptr [rdx + 4]
0x145855436: movss dword ptr [rax + 4], xmm2
0x14585543b: jmp 0x14585561b
0x145855440: movups xmm0, xmmword ptr [rdx + 0x10]
0x145855444: movups xmm1, xmmword ptr [rdx + 0x20]
0x145855448: movups xmmword ptr [rax + 0x20], xmm1
0x14585544c: movups xmmword ptr [rax + 0x10], xmm0
0x145855450: movsd xmm0, qword ptr [rdx + 4]
0x145855455: movaps xmm1, xmmword ptr [rip + 0x68acd4]
0x14585545c: movss xmm1, xmm2
0x145855460: mulps xmm1, xmm0
0x145855463: movlps qword ptr [rax + 4], xmm1
0x145855467: mov byte ptr [rax], 0x11
0x14585546a: jmp 0x14585561e
0x14585546f: movups xmm0, xmmword ptr [rdx + 0x10]
0x145855473: movups xmm1, xmmword ptr [rdx + 0x20]
0x145855477: movups xmmword ptr [rax + 0x20], xmm1
0x14585547b: movups xmmword ptr [rax + 0x10], xmm0
0x14585547f: movsd xmm0, qword ptr [rdx + 4]
0x145855484: movaps xmm1, xmmword ptr [rip + 0x68aca5]
0x14585548b: movss xmm1, xmm2
0x14585548f: mulps xmm1, xmm0
0x145855492: movlps qword ptr [rax + 4], xmm1
0x145855496: mov byte ptr [rax], 0x12
0x145855499: jmp 0x14585561e
0x14585549e: movups xmm0, xmmword ptr [rdx + 0x18]
0x1458554a2: movups xmm1, xmmword ptr [rdx + 0x28]
0x1458554a6: movups xmmword ptr [rax + 0x28], xmm1
0x1458554aa: movups xmmword ptr [rax + 0x18], xmm0
0x1458554ae: mov ecx, dword ptr [rdx + 0x14]
0x1458554b1: movsd xmm0, qword ptr [rdx + 4]
0x1458554b6: movaps xmm1, xmmword ptr [rip + 0x68ac73]
0x1458554bd: movss xmm1, xmm2
0x1458554c1: mulps xmm1, xmm0
0x1458554c4: movlps qword ptr [rax + 4], xmm1
0x1458554c8: mov rdx, qword ptr [rdx + 0xc]
0x1458554cc: mov qword ptr [rax + 0xc], rdx
0x1458554d0: mov dword ptr [rax + 0x14], ecx
0x1458554d3: mov byte ptr [rax], 4
0x1458554d6: jmp 0x14585561e
0x1458554db: movups xmm0, xmmword ptr [rdx + 8]
0x1458554df: movups xmm1, xmmword ptr [rdx + 0x18]
0x1458554e3: movups xmmword ptr [rax + 0x18], xmm1
0x1458554e7: movups xmmword ptr [rax + 8], xmm0
0x1458554eb: mulss xmm2, dword ptr [rdx + 4]
0x1458554f0: movss dword ptr [rax + 4], xmm2
0x1458554f5: mov byte ptr [rax], 5
0x1458554f8: jmp 0x14585561e
0x1458554fd: mov rcx, qword ptr [rdx + 0x28]
0x145855501: mov qword ptr [rax + 0x28], rcx
0x145855505: movups xmm0, xmmword ptr [rdx + 0x18]
0x145855509: movups xmmword ptr [rax + 0x18], xmm0
0x14585550d: movzx ecx, byte ptr [rdx + 1]
0x145855511: mov byte ptr [rax + 1], cl
0x145855514: movsd xmm0, qword ptr [rdx + 4]
0x145855519: movaps xmm1, xmmword ptr [rip + 0x68ac10]
0x145855520: movss xmm1, xmm2
0x145855524: mulps xmm1, xmm0
0x145855527: movlps qword ptr [rax + 4], xmm1
0x14585552b: mov rcx, qword ptr [rdx + 0xc]
0x14585552f: mov qword ptr [rax + 0xc], rcx
0x145855533: mov byte ptr [rax], 0xb
0x145855536: jmp 0x14585561e
0x14585553b: movups xmm0, xmmword ptr [rdx + 0x10]
0x14585553f: movups xmm1, xmmword ptr [rdx + 0x20]
0x145855543: movups xmmword ptr [rax + 0x20], xmm1
0x145855547: movups xmmword ptr [rax + 0x10], xmm0
0x14585554b: mov ecx, dword ptr [rdx + 4]
0x14585554e: mov dword ptr [rax + 4], ecx
0x145855551: movsd xmm0, qword ptr [rdx + 8]
0x145855556: movaps xmm1, xmmword ptr [rip + 0x68abd3]
0x14585555d: movss xmm1, xmm2
0x145855561: mulps xmm1, xmm0
0x145855564: movlps qword ptr [rax + 8], xmm1
0x145855568: mov byte ptr [rax], 9
0x14585556b: jmp 0x14585561e
0x145855570: movaps xmm0, xmm2
0x145855573: mov rsi, rax
0x145855576: call 0x145d1463d
0x14585557b: mov rax, rsi
0x14585557e: movss xmm1, dword ptr [rip + 0x68a92a]
0x145855586: maxss xmm1, xmm0
0x14585558a: movss xmm0, dword ptr [rip + 0x6997ca]
0x145855592: minss xmm0, xmm1
0x145855596: xorps xmm1, xmm1
0x145855599: maxss xmm1, xmm0
0x14585559d: movss xmm0, dword ptr [rip + 0x68b067]
0x1458555a5: minss xmm0, xmm1
0x1458555a9: cvttss2si ecx, xmm0
0x1458555ad: mov byte ptr [rsi + 1], cl
0x1458555b0: mov byte ptr [rsi], 0x1e
0x1458555b3: jmp 0x14585561e
0x1458555b5: mulss xmm2, dword ptr [rdx + 4]
0x1458555ba: movss dword ptr [rax + 4], xmm2
0x1458555bf: mov byte ptr [rax], 0x16
0x1458555c2: jmp 0x14585561e
0x1458555c4: addss xmm2, dword ptr [rip + 0x68a94c]
0x1458555cc: mulss xmm2, dword ptr [rip + 0x68ada8]
0x1458555d4: movss xmm0, dword ptr [rip + 0x68a8d4]
0x1458555dc: addss xmm2, xmm0
0x1458555e0: maxss xmm2, xmm0
0x1458555e4: mulss xmm2, dword ptr [rdx + 4]
0x1458555e9: movss dword ptr [rax + 4], xmm2
0x1458555ee: mov byte ptr [rax], 0x23
0x1458555f1: jmp 0x14585561e
0x1458555f3: movss xmm0, dword ptr [rdx + 4]
0x1458555f8: mov dword ptr [rax + 8], 0xffffffff
0x1458555ff: movsd xmm1, qword ptr [rdx + 0xc]
0x145855604: movaps xmm3, xmmword ptr [rip + 0x68ab25]
0x14585560b: movss xmm3, xmm2
0x14585560f: mulps xmm3, xmm1
0x145855612: movlps qword ptr [rax + 0xc], xmm3
0x145855616: movss dword ptr [rax + 4], xmm0
0x14585561b: mov byte ptr [rax], 8
0x14585561e: add rsp, 0x20
0x145855622: pop rbx
0x145855623: pop rdi
0x145855624: pop rsi
0x145855625: ret

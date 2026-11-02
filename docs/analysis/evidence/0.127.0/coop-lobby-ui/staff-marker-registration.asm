0x1402c6340: push rbp
0x1402c6341: push rsi
0x1402c6342: push rdi
0x1402c6343: push rbx
0x1402c6344: sub rsp, 0xc8
0x1402c634b: lea rbp, [rsp + 0x80]
0x1402c6353: movaps xmmword ptr [rbp + 0x30], xmm6
0x1402c6357: mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
0x1402c635f: mov rsi, rcx
0x1402c6362: mov rcx, qword ptr [rcx + 0x18]
0x1402c6366: cmp qword ptr [rcx + 0x30], 0
0x1402c636b: je 0x1402c640b
0x1402c6371: movabs rdx, 0x2e3026136b966c74
0x1402c637b: mov rax, qword ptr [rcx + 0x18]
0x1402c637f: mov r8, qword ptr [rcx + 0x20]
0x1402c6383: xor r9d, r9d
0x1402c6386: movdqa xmm0, xmmword ptr [rip + 0x5f6b752]
0x1402c638e: pcmpeqd xmm1, xmm1
0x1402c6392: movdqa xmm2, xmmword ptr [rip + 0x5f6b756]
0x1402c639a: and rdx, r8
0x1402c639d: movdqu xmm3, xmmword ptr [rax + rdx]
0x1402c63a2: movdqa xmm4, xmm3
0x1402c63a6: pcmpeqb xmm4, xmm0
0x1402c63aa: pmovmskb r10d, xmm4
0x1402c63af: test r10d, r10d
0x1402c63b2: je 0x1402c63f0
0x1402c63b4: tzcnt r11d, r10d
0x1402c63b9: add r11, rdx
0x1402c63bc: and r11, r8
0x1402c63bf: neg r11
0x1402c63c2: lea r11, [r11 + r11*2]
0x1402c63c6: movdqu xmm4, xmmword ptr [rax + r11*8 - 0x18]
0x1402c63cd: pcmpeqb xmm4, xmm2
0x1402c63d1: pmovmskb edi, xmm4
0x1402c63d5: cmp edi, 0xffff
0x1402c63db: je 0x1402c64c2
0x1402c63e1: lea r11d, [r10 - 1]
0x1402c63e5: and r11w, r10w
0x1402c63e9: mov r10d, r11d
0x1402c63ec: jne 0x1402c63b4
0x1402c63ee: nop 
0x1402c63f0: pcmpeqb xmm3, xmm1
0x1402c63f4: pmovmskb r10d, xmm3
0x1402c63f9: test r10d, r10d
0x1402c63fc: jne 0x1402c640b
0x1402c63fe: add rdx, r9
0x1402c6401: add rdx, 0x10
0x1402c6405: add r9, 0x10
0x1402c6409: jmp 0x1402c639a
0x1402c640b: movzx eax, byte ptr [rcx + 0x60]
0x1402c640f: mov rax, qword ptr [rcx + 0x80]
0x1402c6416: mov rdx, qword ptr [rcx + 0x88]
0x1402c641d: movabs r8, 0x2e3026136b966c74
0x1402c6427: xor r9d, r9d
0x1402c642a: movdqa xmm0, xmmword ptr [rip + 0x5f6b6ae]
0x1402c6432: pcmpeqd xmm1, xmm1
0x1402c6436: movdqa xmm2, xmmword ptr [rip + 0x5f6b6b2]
0x1402c643e: and r8, rdx
0x1402c6441: movdqu xmm3, xmmword ptr [rax + r8]
0x1402c6447: movdqa xmm4, xmm3
0x1402c644b: pcmpeqb xmm4, xmm0
0x1402c644f: pmovmskb edi, xmm4
0x1402c6453: test edi, edi
0x1402c6455: je 0x1402c64a0
0x1402c6457: tzcnt r11d, edi
0x1402c645c: add r11, r8
0x1402c645f: and r11, rdx
0x1402c6462: mov rbx, r11
0x1402c6465: shl rbx, 7
0x1402c6469: mov r10, rax
0x1402c646c: sub r10, rbx
0x1402c646f: movdqu xmm4, xmmword ptr [r10 - 0x80]
0x1402c6475: pcmpeqb xmm4, xmm2
0x1402c6479: pmovmskb ebx, xmm4
0x1402c647d: cmp ebx, 0xffff
0x1402c6483: je 0x1402c64df
0x1402c6485: lea r10d, [rdi - 1]
0x1402c6489: and r10w, di
0x1402c648d: mov edi, r10d
0x1402c6490: jne 0x1402c6457
0x1402c6492: nop word ptr cs:[rax + rax]
0x1402c64a0: pcmpeqb xmm3, xmm1
0x1402c64a4: pmovmskb r10d, xmm3
0x1402c64a9: test r10d, r10d
0x1402c64ac: jne 0x1402c6551
0x1402c64b2: add r8, r9
0x1402c64b5: add r8, 0x10
0x1402c64b9: add r9, 0x10
0x1402c64bd: jmp 0x1402c643e
0x1402c64c2: lea rax, [rax + r11*8]
0x1402c64c6: mov rdi, qword ptr [rax - 8]
0x1402c64ca: mov rdx, qword ptr [rsi + 8]
0x1402c64ce: mov r8, qword ptr [rsi + 0x10]
0x1402c64d2: mov r9, rdi
0x1402c64d5: call 0x14508f7a0
0x1402c64da: jmp 0x1402c6718
0x1402c64df: lea r8, [r11 - 0x10]
0x1402c64e3: and r8, rdx
0x1402c64e6: movdqu xmm0, xmmword ptr [rax + r8]
0x1402c64ec: pcmpeqd xmm1, xmm1
0x1402c64f0: pcmpeqb xmm0, xmm1
0x1402c64f4: pmovmskb edx, xmm0
0x1402c64f8: movdqu xmm0, xmmword ptr [rax + r11]
0x1402c64fe: pcmpeqb xmm0, xmm1
0x1402c6502: pmovmskb r9d, xmm0
0x1402c6507: mov di, 0x1f
0x1402c650b: bsr di, dx
0x1402c650f: xor edi, 0xf
0x1402c6512: or r9d, 0x10000
0x1402c6519: tzcnt r9d, r9d
0x1402c651e: add r9d, edi
0x1402c6521: mov dl, 0x80
0x1402c6523: cmp r9w, 0xf
0x1402c6528: ja 0x1402c6533
0x1402c652a: inc qword ptr [rcx + 0x90]
0x1402c6531: mov dl, 0xff
0x1402c6533: mov byte ptr [rax + r11], dl
0x1402c6537: mov byte ptr [rax + r8 + 0x10], dl
0x1402c653c: dec qword ptr [rcx + 0x98]
0x1402c6543: mov rax, qword ptr [r10 - 0x70]
0x1402c6547: cmp rax, 2
0x1402c654b: jne 0x1402c66bf
0x1402c6551: mov rax, qword ptr [rsi + 0x20]
0x1402c6555: mov rdi, qword ptr [rax]
0x1402c6558: lea rdx, [rdi + 1]
0x1402c655c: mov qword ptr [rax], rdx
0x1402c655f: mov word ptr [rbp], 0x100
0x1402c6565: mov qword ptr [rbp - 0x50], 1
0x1402c656d: movups xmm0, xmmword ptr [rip + 0x5fac8c4]
0x1402c6574: movups xmmword ptr [rbp - 0x48], xmm0
0x1402c6578: mov qword ptr [rbp - 0x28], 1
0x1402c6580: mov qword ptr [rbp - 0x20], 0
0x1402c6588: mov qword ptr [rbp - 8], 0
0x1402c6590: mov byte ptr [rbp + 2], 1
0x1402c6594: mov qword ptr [rbp - 0x38], 0
0x1402c659c: mov byte ptr [rbp - 0x18], 2
0x1402c65a0: lea r8, [rbp - 0x50]
0x1402c65a4: mov rbx, rcx
0x1402c65a7: mov rdx, rdi
0x1402c65aa: call 0x14006dbf0
0x1402c65af: add rbx, 0x18
0x1402c65b3: lea rdx, [rip + 0x5fb1726]
0x1402c65ba: mov rcx, rbx
0x1402c65bd: mov r8, rdi
0x1402c65c0: call 0x14006da40
0x1402c65c5: mov rbx, qword ptr [rsi + 0x10]
0x1402c65c9: cmp rbx, qword ptr [rsi]
0x1402c65cc: jne 0x1402c65d6
0x1402c65ce: mov rcx, rsi
0x1402c65d1: call 0x146061cb0
0x1402c65d6: mov rax, qword ptr [rsi + 8]
0x1402c65da: mov qword ptr [rax + rbx*8], rdi
0x1402c65de: inc rbx
0x1402c65e1: mov qword ptr [rsi + 0x10], rbx
0x1402c65e5: mov qword ptr [rbp - 0x50], 0
0x1402c65ed: mov qword ptr [rbp - 0x48], 8
0x1402c65f5: mov qword ptr [rbp - 0x40], 0
0x1402c65fd: movups xmm0, xmmword ptr [rip + 0x5fb1d5c]
0x1402c6604: movups xmmword ptr [rbp - 0x38], xmm0
0x1402c6608: movups xmm1, xmmword ptr [rip + 0x5fb1d61]
0x1402c660f: movups xmmword ptr [rbp - 0x28], xmm1
0x1402c6613: mov qword ptr [rbp - 0x18], 0
0x1402c661b: mov qword ptr [rbp - 0x10], 8
0x1402c6623: mov qword ptr [rbp - 8], 0
0x1402c662b: movups xmmword ptr [rbp], xmm0
0x1402c662f: movups xmmword ptr [rbp + 0x10], xmm1
0x1402c6633: mov rcx, qword ptr [rsi + 0x18]
0x1402c6637: mov byte ptr [rbp + 0x27], 1
0x1402c663b: lea r8, [rbp - 0x50]
0x1402c663f: mov rdx, rdi
0x1402c6642: call 0x14506a8c0
0x1402c6647: nop 
0x1402c6648: mov rax, qword ptr [rsi + 0x10]
0x1402c664c: test rax, rax
0x1402c664f: je 0x1402c6658
0x1402c6651: dec rax
0x1402c6654: mov qword ptr [rsi + 0x10], rax
0x1402c6658: mov rax, qword ptr [rsi + 0x18]
0x1402c665c: mov rax, qword ptr [rax + 8]
0x1402c6660: imul rcx, rdi, 0x130
0x1402c6667: add rcx, rax
0x1402c666a: add rcx, 0x58
0x1402c666e: mov qword ptr [rbp - 0x58], rcx
0x1402c6672: call 0x14005dc70
0x1402c6677: nop 
0x1402c6678: movdqu xmm0, xmmword ptr [rbp - 0x50]
0x1402c667d: movdqu xmm1, xmmword ptr [rbp - 0x40]
0x1402c6682: movdqu xmm2, xmmword ptr [rbp - 0x30]
0x1402c6687: movdqu xmm3, xmmword ptr [rbp - 0x20]
0x1402c668c: movdqu xmm4, xmmword ptr [rbp - 0x10]
0x1402c6691: movups xmm5, xmmword ptr [rbp]
0x1402c6695: movups xmm6, xmmword ptr [rbp + 0x10]
0x1402c6699: mov rax, qword ptr [rbp - 0x58]
0x1402c669d: movups xmmword ptr [rax + 0x60], xmm6
0x1402c66a1: movups xmmword ptr [rax + 0x50], xmm5
0x1402c66a5: movdqu xmmword ptr [rax + 0x40], xmm4
0x1402c66aa: movdqu xmmword ptr [rax + 0x30], xmm3
0x1402c66af: movdqu xmmword ptr [rax + 0x20], xmm2
0x1402c66b4: movdqu xmmword ptr [rax + 0x10], xmm1
0x1402c66b9: movdqu xmmword ptr [rax], xmm0
0x1402c66bd: jmp 0x1402c6718
0x1402c66bf: mov rcx, qword ptr [r10 - 8]
0x1402c66c3: mov qword ptr [rbp + 0x18], rcx
0x1402c66c7: movups xmm0, xmmword ptr [r10 - 0x18]
0x1402c66cc: movups xmmword ptr [rbp + 8], xmm0
0x1402c66d0: movups xmm0, xmmword ptr [r10 - 0x28]
0x1402c66d5: movups xmmword ptr [rbp - 8], xmm0
0x1402c66d9: movdqu xmm0, xmmword ptr [r10 - 0x68]
0x1402c66df: movdqu xmm1, xmmword ptr [r10 - 0x58]
0x1402c66e5: movdqu xmm2, xmmword ptr [r10 - 0x48]
0x1402c66eb: movdqu xmm3, xmmword ptr [r10 - 0x38]
0x1402c66f1: movdqu xmmword ptr [rbp - 0x18], xmm3
0x1402c66f6: movdqu xmmword ptr [rbp - 0x28], xmm2
0x1402c66fb: movdqu xmmword ptr [rbp - 0x38], xmm1
0x1402c6700: movdqu xmmword ptr [rbp - 0x48], xmm0
0x1402c6705: mov qword ptr [rbp - 0x50], rax
0x1402c6709: lea rcx, [rbp - 0x50]
0x1402c670d: mov rdx, rsi
0x1402c6710: call 0x14502ee80
0x1402c6715: mov rdi, rax
0x1402c6718: mov eax, 1
0x1402c671d: mov rdx, rdi
0x1402c6720: movaps xmm6, xmmword ptr [rbp + 0x30]
0x1402c6724: add rsp, 0xc8
0x1402c672b: pop rbx
0x1402c672c: pop rdi
0x1402c672d: pop rsi
0x1402c672e: pop rbp
0x1402c672f: ret 

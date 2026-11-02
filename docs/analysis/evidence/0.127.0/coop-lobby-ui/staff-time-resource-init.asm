0x14022c680: push rbp
0x14022c681: push r14
0x14022c683: push rsi
0x14022c684: push rdi
0x14022c685: push rbx
0x14022c686: sub rsp, 0xc0
0x14022c68d: lea rbp, [rsp + 0x80]
0x14022c695: mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
0x14022c69d: mov rax, rcx
0x14022c6a0: add rcx, 0x40
0x14022c6a4: lea rdx, [rax + 0x5a8]
0x14022c6ab: mov qword ptr [rbp + 0x28], rcx
0x14022c6af: mov qword ptr [rbp + 0x30], rdx
0x14022c6b3: mov qword ptr [rbp + 0x10], 0
0x14022c6bb: mov qword ptr [rbp + 0x18], 8
0x14022c6c3: mov qword ptr [rbp + 0x20], 0
0x14022c6cb: cmp qword ptr [rax + 0x90], 0
0x14022c6d3: je 0x14022c779
0x14022c6d9: movabs r9, 0xc33e72aacd1676c0
0x14022c6e3: mov r8, qword ptr [rax + 0x78]
0x14022c6e7: mov r10, qword ptr [rax + 0x80]
0x14022c6ee: xor r11d, r11d
0x14022c6f1: movdqa xmm0, xmmword ptr [rip + 0x6005b57]
0x14022c6f9: pcmpeqd xmm1, xmm1
0x14022c6fd: movdqa xmm2, xmmword ptr [rip + 0x601c3bb]
0x14022c705: and r9, r10
0x14022c708: movdqu xmm3, xmmword ptr [r8 + r9]
0x14022c70e: movdqa xmm4, xmm3
0x14022c712: pcmpeqb xmm4, xmm0
0x14022c716: pmovmskb esi, xmm4
0x14022c71a: test esi, esi
0x14022c71c: je 0x14022c760
0x14022c71e: tzcnt edi, esi
0x14022c722: add rdi, r9
0x14022c725: and rdi, r10
0x14022c728: neg rdi
0x14022c72b: lea rdi, [rdi + rdi*2]
0x14022c72f: movdqu xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
0x14022c736: pcmpeqb xmm4, xmm2
0x14022c73a: pmovmskb ebx, xmm4
0x14022c73e: cmp ebx, 0xffff
0x14022c744: je 0x14022c82d
0x14022c74a: lea edi, [rsi - 1]
0x14022c74d: and di, si
0x14022c750: mov esi, edi
0x14022c752: jne 0x14022c71e
0x14022c754: nop word ptr cs:[rax + rax]
0x14022c760: pcmpeqb xmm3, xmm1
0x14022c764: pmovmskb esi, xmm3
0x14022c768: test esi, esi
0x14022c76a: jne 0x14022c779
0x14022c76c: add r9, r11
0x14022c76f: add r9, 0x10
0x14022c773: add r11, 0x10
0x14022c777: jmp 0x14022c705
0x14022c779: movzx r8d, byte ptr [rax + 0xa0]
0x14022c781: mov r8, qword ptr [rax + 0xe0]
0x14022c788: mov r9, qword ptr [rax + 0xe8]
0x14022c78f: movabs r10, 0xc33e72aacd1676c0
0x14022c799: xor r11d, r11d
0x14022c79c: movdqa xmm0, xmmword ptr [rip + 0x6005aac]
0x14022c7a4: pcmpeqd xmm1, xmm1
0x14022c7a8: movdqa xmm2, xmmword ptr [rip + 0x601c310]
0x14022c7b0: and r10, r9
0x14022c7b3: movdqu xmm3, xmmword ptr [r8 + r10]
0x14022c7b9: movdqa xmm4, xmm3
0x14022c7bd: pcmpeqb xmm4, xmm0
0x14022c7c1: pmovmskb ebx, xmm4
0x14022c7c5: test ebx, ebx
0x14022c7c7: je 0x14022c810
0x14022c7c9: tzcnt edi, ebx
0x14022c7cd: add rdi, r10
0x14022c7d0: and rdi, r9
0x14022c7d3: mov r14, rdi
0x14022c7d6: shl r14, 7
0x14022c7da: mov rsi, r8
0x14022c7dd: sub rsi, r14
0x14022c7e0: movdqu xmm4, xmmword ptr [rsi - 0x80]
0x14022c7e5: pcmpeqb xmm4, xmm2
0x14022c7e9: pmovmskb r14d, xmm4
0x14022c7ee: cmp r14d, 0xffff
0x14022c7f5: je 0x14022c83a
0x14022c7f7: lea esi, [rbx - 1]
0x14022c7fa: and si, bx
0x14022c7fd: mov ebx, esi
0x14022c7ff: jne 0x14022c7c9
0x14022c801: nop word ptr cs:[rax + rax]
0x14022c810: pcmpeqb xmm3, xmm1
0x14022c814: pmovmskb esi, xmm3
0x14022c818: test esi, esi
0x14022c81a: jne 0x14022c8ac
0x14022c820: add r10, r11
0x14022c823: add r10, 0x10
0x14022c827: add r11, 0x10
0x14022c82b: jmp 0x14022c7b0
0x14022c82d: lea rax, [r8 + rdi*8]
0x14022c831: mov rsi, qword ptr [rax - 8]
0x14022c835: jmp 0x14022c993
0x14022c83a: lea r10, [rdi - 0x10]
0x14022c83e: and r10, r9
0x14022c841: movdqu xmm0, xmmword ptr [r8 + r10]
0x14022c847: pcmpeqd xmm1, xmm1
0x14022c84b: pcmpeqb xmm0, xmm1
0x14022c84f: pmovmskb r9d, xmm0
0x14022c854: movdqu xmm0, xmmword ptr [r8 + rdi]
0x14022c85a: pcmpeqb xmm0, xmm1
0x14022c85e: pmovmskb r11d, xmm0
0x14022c863: mov bx, 0x1f
0x14022c867: bsr bx, r9w
0x14022c86c: xor ebx, 0xf
0x14022c86f: or r11d, 0x10000
0x14022c876: tzcnt r11d, r11d
0x14022c87b: add r11d, ebx
0x14022c87e: mov r9b, 0x80
0x14022c881: cmp r11w, 0xf
0x14022c886: ja 0x14022c892
0x14022c888: inc qword ptr [rax + 0xf0]
0x14022c88f: mov r9b, 0xff
0x14022c892: mov byte ptr [r8 + rdi], r9b
0x14022c896: mov byte ptr [r8 + r10 + 0x10], r9b
0x14022c89b: dec qword ptr [rax + 0xf8]
0x14022c8a2: mov r8, qword ptr [rsi - 0x70]
0x14022c8a6: cmp r8, 2
0x14022c8aa: jne 0x14022c922
0x14022c8ac: mov rdi, rax
0x14022c8af: mov rsi, qword ptr [rdx]
0x14022c8b2: lea rax, [rsi + 1]
0x14022c8b6: mov qword ptr [rdx], rax
0x14022c8b9: mov word ptr [rbp - 0x10], 0x100
0x14022c8bf: mov qword ptr [rbp - 0x60], 1
0x14022c8c7: movdqu xmm0, xmmword ptr [rip + 0x60340e9]
0x14022c8cf: movdqu xmmword ptr [rbp - 0x58], xmm0
0x14022c8d4: mov qword ptr [rbp - 0x38], 8
0x14022c8dc: mov qword ptr [rbp - 0x30], 0x68
0x14022c8e4: mov qword ptr [rbp - 0x18], 0
0x14022c8ec: mov byte ptr [rbp - 0xe], 1
0x14022c8f0: mov qword ptr [rbp - 0x48], 0
0x14022c8f8: mov byte ptr [rbp - 0x28], 2
0x14022c8fc: lea r8, [rbp - 0x60]
0x14022c900: mov rdx, rsi
0x14022c903: call 0x14006dbf0
0x14022c908: nop 
0x14022c909: mov rcx, rdi
0x14022c90c: add rcx, 0x78
0x14022c910: lea rdx, [rip + 0x60340a1]
0x14022c917: mov r8, rsi
0x14022c91a: call 0x14006da40
0x14022c91f: nop 
0x14022c920: jmp 0x14022c993
0x14022c922: mov rax, qword ptr [rsi - 8]
0x14022c926: mov qword ptr [rbp + 8], rax
0x14022c92a: movups xmm0, xmmword ptr [rsi - 0x18]
0x14022c92e: movups xmmword ptr [rbp - 8], xmm0
0x14022c932: movups xmm0, xmmword ptr [rsi - 0x28]
0x14022c936: movups xmmword ptr [rbp - 0x18], xmm0
0x14022c93a: movdqu xmm0, xmmword ptr [rsi - 0x68]
0x14022c93f: movdqu xmm1, xmmword ptr [rsi - 0x58]
0x14022c944: movdqu xmm2, xmmword ptr [rsi - 0x48]
0x14022c949: movdqu xmm3, xmmword ptr [rsi - 0x38]
0x14022c94e: movdqu xmmword ptr [rbp - 0x28], xmm3
0x14022c953: movdqu xmmword ptr [rbp - 0x38], xmm2
0x14022c958: movdqu xmmword ptr [rbp - 0x48], xmm1
0x14022c95d: movdqu xmmword ptr [rbp - 0x58], xmm0
0x14022c962: mov qword ptr [rbp - 0x60], r8
0x14022c966: lea rcx, [rbp - 0x60]
0x14022c96a: lea rdx, [rbp + 0x10]
0x14022c96e: call 0x14502ee80
0x14022c973: nop 
0x14022c974: mov rsi, rax
0x14022c977: mov rdx, qword ptr [rbp + 0x10]
0x14022c97b: test rdx, rdx
0x14022c97e: je 0x14022c993
0x14022c980: mov rcx, qword ptr [rbp + 0x18]
0x14022c984: shl rdx, 3
0x14022c988: mov r8d, 8
0x14022c98e: call 0x1400021d0
0x14022c993: mov rax, rsi
0x14022c996: add rsp, 0xc0
0x14022c99d: pop rbx
0x14022c99e: pop rdi
0x14022c99f: pop rsi
0x14022c9a0: pop r14
0x14022c9a2: pop rbp
0x14022c9a3: ret 

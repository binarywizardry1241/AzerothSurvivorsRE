0x145824900: push rbp
0x145824901: push r14
0x145824903: push rsi
0x145824904: push rdi
0x145824905: push rbx
0x145824906: sub rsp, 0x40
0x14582490a: lea rbp, [rsp + 0x40]
0x14582490f: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145824917: mov rdi, rdx
0x14582491a: mov rsi, rcx
0x14582491d: mov r14, qword ptr [rdx]
0x145824920: mov cl, 1
0x145824922: xor eax, eax
0x145824924: lock cmpxchg byte ptr [r14 + 0x10], cl
0x14582492a: jne 0x145824aa3
0x145824930: mov rbx, qword ptr [rip + 0x29f0101]
0x145824937: mov rax, qword ptr [rbx]
0x14582493a: shl rax, 1
0x14582493d: test rax, rax
0x145824940: jne 0x145824ab1
0x145824946: mov dword ptr [rbp - 0xc], 0
0x14582494d: movzx eax, byte ptr [r14 + 0x11]
0x145824952: lea rcx, [r14 + 0x18]
0x145824956: mov qword ptr [rbp - 0x18], r14
0x14582495a: call 0x145816db0
0x14582495f: nop
0x145824960: mov r14, qword ptr [rbp - 0x18]
0x145824964: cmp qword ptr [r14 + 0xd8], 0
0x14582496c: je 0x145824a73
0x145824972: lea rdx, [rdi + 8]
0x145824976: lea rcx, [r14 + 0xe0]
0x14582497d: call 0x140f02e30
0x145824982: mov r8, rax
0x145824985: shr r8, 0x39
0x145824989: mov rcx, qword ptr [r14 + 0xc0]
0x145824990: mov rdx, qword ptr [r14 + 0xc8]
0x145824997: movd xmm0, r8d
0x14582499c: punpcklbw xmm0, xmm0
0x1458249a0: pshuflw xmm0, xmm0, 0
0x1458249a5: pshufd xmm0, xmm0, 0x44
0x1458249aa: mov r8d, dword ptr [rdi + 8]
0x1458249ae: xor r9d, r9d
0x1458249b1: pcmpeqd xmm1, xmm1
0x1458249b5: and rax, rdx
0x1458249b8: movdqu xmm2, xmmword ptr [rcx + rax]
0x1458249bd: movdqa xmm3, xmm2
0x1458249c1: pcmpeqb xmm3, xmm0
0x1458249c5: pmovmskb r10d, xmm3
0x1458249ca: test r10d, r10d
0x1458249cd: je 0x145824a00
0x1458249cf: tzcnt r11d, r10d
0x1458249d4: add r11, rax
0x1458249d7: and r11, rdx
0x1458249da: neg r11
0x1458249dd: lea r11, [r11 + r11*2]
0x1458249e1: shl r11, 4
0x1458249e5: cmp r8d, dword ptr [rcx + r11 - 0x30]
0x1458249ea: je 0x145824a1b
0x1458249ec: lea r11d, [r10 - 1]
0x1458249f0: and r11w, r10w
0x1458249f4: mov r10d, r11d
0x1458249f7: jne 0x1458249cf
0x1458249f9: nop dword ptr [rax]
0x145824a00: pcmpeqb xmm2, xmm1
0x145824a04: pmovmskb r10d, xmm2
0x145824a09: test r10d, r10d
0x145824a0c: jne 0x145824a73
0x145824a0e: add rax, r9
0x145824a11: add rax, 0x10
0x145824a15: add r9, 0x10
0x145824a19: jmp 0x1458249b5
0x145824a1b: add rcx, r11
0x145824a1e: mov rax, qword ptr [rcx - 0x10]
0x145824a22: test rax, rax
0x145824a25: je 0x145824a73
0x145824a27: mov rdx, qword ptr [rcx - 0x18]
0x145824a2b: lea r8, [rdx + 1]
0x145824a2f: mov r9, qword ptr [rcx - 0x28]
0x145824a33: mov r10, qword ptr [rcx - 0x20]
0x145824a37: xor r11d, r11d
0x145824a3a: cmp r8, r9
0x145824a3d: cmovae r11, r9
0x145824a41: neg r11
0x145824a44: lea r8, [rdx + r11]
0x145824a48: inc r8
0x145824a4b: mov qword ptr [rcx - 0x18], r8
0x145824a4f: dec rax
0x145824a52: mov qword ptr [rcx - 0x10], rax
0x145824a56: lea rax, [rdx + rdx*2]
0x145824a5a: movups xmm0, xmmword ptr [r10 + rax*8]
0x145824a5f: movups xmmword ptr [rsi], xmm0
0x145824a62: mov rax, qword ptr [r10 + rax*8 + 0x10]
0x145824a67: mov qword ptr [rsi + 0x10], rax
0x145824a6b: cmp byte ptr [rbp - 0xc], 0
0x145824a6f: je 0x145824a80
0x145824a71: jmp 0x145824a8b
0x145824a73: mov qword ptr [rsi], 0xffffffffffffffff
0x145824a7a: cmp byte ptr [rbp - 0xc], 0
0x145824a7e: jne 0x145824a8b
0x145824a80: mov rax, qword ptr [rbx]
0x145824a83: shl rax, 1
0x145824a86: test rax, rax
0x145824a89: jne 0x145824ace
0x145824a8b: xor eax, eax
0x145824a8d: xchg byte ptr [r14 + 0x10], al
0x145824a91: cmp al, 2
0x145824a93: je 0x145824ac0
0x145824a95: mov rax, rsi
0x145824a98: add rsp, 0x40
0x145824a9c: pop rbx
0x145824a9d: pop rdi
0x145824a9e: pop rsi
0x145824a9f: pop r14
0x145824aa1: pop rbp
0x145824aa2: ret
0x145824aa3: lea rcx, [r14 + 0x10]
0x145824aa7: call 0x145eb5670
0x145824aac: jmp 0x145824930
0x145824ab1: call 0x145eb6400
0x145824ab6: xor al, 1
0x145824ab8: mov dword ptr [rbp - 0xc], eax
0x145824abb: jmp 0x14582494d
0x145824ac0: add r14, 0x10
0x145824ac4: mov rcx, r14
0x145824ac7: call 0x145eb5730
0x145824acc: jmp 0x145824a95
0x145824ace: call 0x145eb6400
0x145824ad3: test al, al
0x145824ad5: jne 0x145824a8b
0x145824ad7: mov byte ptr [r14 + 0x11], 1
0x145824adc: jmp 0x145824a8b

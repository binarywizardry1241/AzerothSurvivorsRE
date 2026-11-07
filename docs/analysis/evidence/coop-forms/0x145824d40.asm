0x145824d40: push rbp
0x145824d41: push r15
0x145824d43: push r14
0x145824d45: push r13
0x145824d47: push r12
0x145824d49: push rsi
0x145824d4a: push rdi
0x145824d4b: push rbx
0x145824d4c: sub rsp, 0xf8
0x145824d53: lea rbp, [rsp + 0x80]
0x145824d5b: mov qword ptr [rbp + 0x70], 0xfffffffffffffffe
0x145824d63: mov rsi, rcx
0x145824d66: mov r12, qword ptr [rcx]
0x145824d69: mov cl, 1
0x145824d6b: xor eax, eax
0x145824d6d: lock cmpxchg byte ptr [r12 + 0x10], cl
0x145824d74: jne 0x145824f12
0x145824d7a: mov rbx, qword ptr [rip + 0x29efcb7]
0x145824d81: mov rax, qword ptr [rbx]
0x145824d84: shl rax, 1
0x145824d87: test rax, rax
0x145824d8a: jne 0x145824f21
0x145824d90: xor r13d, r13d
0x145824d93: movzx eax, byte ptr [r12 + 0x11]
0x145824d99: add rsi, 8
0x145824d9d: cmp qword ptr [r12 + 0xd8], 0
0x145824da6: je 0x145824f46
0x145824dac: lea rcx, [r12 + 0xe0]
0x145824db4: mov rdx, rsi
0x145824db7: call 0x140f02e30
0x145824dbc: mov r8, rax
0x145824dbf: shr r8, 0x39
0x145824dc3: mov rcx, qword ptr [r12 + 0xc0]
0x145824dcb: mov rdx, qword ptr [r12 + 0xc8]
0x145824dd3: movd xmm0, r8d
0x145824dd8: punpcklbw xmm0, xmm0
0x145824ddc: pshuflw xmm0, xmm0, 0
0x145824de1: pshufd xmm0, xmm0, 0x44
0x145824de6: mov r14d, dword ptr [rsi]
0x145824de9: xor r8d, r8d
0x145824dec: pcmpeqd xmm1, xmm1
0x145824df0: and rax, rdx
0x145824df3: movdqu xmm2, xmmword ptr [rcx + rax]
0x145824df8: movdqa xmm3, xmm2
0x145824dfc: pcmpeqb xmm3, xmm0
0x145824e00: pmovmskb r9d, xmm3
0x145824e05: test r9d, r9d
0x145824e08: je 0x145824e40
0x145824e0a: tzcnt r10d, r9d
0x145824e0f: add r10, rax
0x145824e12: and r10, rdx
0x145824e15: neg r10
0x145824e18: lea r10, [r10 + r10*2]
0x145824e1c: shl r10, 4
0x145824e20: cmp r14d, dword ptr [rcx + r10 - 0x30]
0x145824e25: je 0x145824e5f
0x145824e27: lea r10d, [r9 - 1]
0x145824e2b: and r10w, r9w
0x145824e2f: mov r9d, r10d
0x145824e32: jne 0x145824e0a
0x145824e34: nop word ptr cs:[rax + rax]
0x145824e40: pcmpeqb xmm2, xmm1
0x145824e44: pmovmskb r9d, xmm2
0x145824e49: test r9d, r9d
0x145824e4c: jne 0x145824f49
0x145824e52: add rax, r8
0x145824e55: add rax, 0x10
0x145824e59: add r8, 0x10
0x145824e5d: jmp 0x145824df0
0x145824e5f: add rcx, r10
0x145824e62: cmp byte ptr [rcx - 8], 1
0x145824e66: jne 0x145824f49
0x145824e6c: mov dword ptr [rbp + 0x6c], r13d
0x145824e70: mov dword ptr [rbp - 0x50], r14d
0x145824e74: movabs r15, 0x8000000000000006
0x145824e7e: mov qword ptr [rbp - 0x58], r15
0x145824e82: mov rdi, qword ptr [r12 + 0xa8]
0x145824e8a: mov qword ptr [rbp + 0x60], r12
0x145824e8e: mov rbx, qword ptr [r12 + 0xb0]
0x145824e96: lea rcx, [rbp + 0x48]
0x145824e9a: lea rdx, [rbp - 0x58]
0x145824e9e: call 0x145b7a740
0x145824ea3: nop
0x145824ea4: lea rdx, [rbp + 0x48]
0x145824ea8: mov rcx, rdi
0x145824eab: call qword ptr [rbx + 0x18]
0x145824eae: nop
0x145824eaf: lea rcx, [rbp - 0x58]
0x145824eb3: call 0x145811f80
0x145824eb8: mov r12, qword ptr [rbp + 0x60]
0x145824ebc: cmp dword ptr [r12 + 0xa0], -1
0x145824ec5: je 0x145824f05
0x145824ec7: mov dword ptr [rbp - 0x50], r14d
0x145824ecb: mov qword ptr [rbp - 0x58], r15
0x145824ecf: mov rdi, qword ptr [r12 + 0x88]
0x145824ed7: mov rbx, qword ptr [r12 + 0x90]
0x145824edf: lea rcx, [rbp + 0x48]
0x145824ee3: lea rdx, [rbp - 0x58]
0x145824ee7: call 0x145b7a740
0x145824eec: nop
0x145824eed: lea rdx, [rbp + 0x48]
0x145824ef1: mov rcx, rdi
0x145824ef4: call qword ptr [rbx + 0x18]
0x145824ef7: nop
0x145824ef8: lea rcx, [rbp - 0x58]
0x145824efc: call 0x145811f80
0x145824f01: mov r12, qword ptr [rbp + 0x60]
0x145824f05: mov r13d, dword ptr [rbp + 0x6c]
0x145824f09: mov rbx, qword ptr [rip + 0x29efb28]
0x145824f10: jmp 0x145824f49
0x145824f12: lea rcx, [r12 + 0x10]
0x145824f17: call 0x145eb5670
0x145824f1c: jmp 0x145824d7a
0x145824f21: call 0x145eb6400
0x145824f26: mov r13d, eax
0x145824f29: xor r13b, 1
0x145824f2d: movzx eax, byte ptr [r12 + 0x11]
0x145824f33: add rsi, 8
0x145824f37: cmp qword ptr [r12 + 0xd8], 0
0x145824f40: jne 0x145824dac
0x145824f46: mov r14d, dword ptr [rsi]
0x145824f49: lea rcx, [r12 + 0xe0]
0x145824f51: mov rdx, rsi
0x145824f54: call 0x140f02e30
0x145824f59: mov r8, rax
0x145824f5c: shr r8, 0x39
0x145824f60: mov rcx, qword ptr [r12 + 0xc0]
0x145824f68: mov rdx, qword ptr [r12 + 0xc8]
0x145824f70: movd xmm0, r8d
0x145824f75: punpcklbw xmm0, xmm0
0x145824f79: pshuflw xmm0, xmm0, 0
0x145824f7e: pshufd xmm0, xmm0, 0x44
0x145824f83: xor r9d, r9d
0x145824f86: pcmpeqd xmm1, xmm1
0x145824f8a: and rax, rdx
0x145824f8d: movdqu xmm2, xmmword ptr [rcx + rax]
0x145824f92: movdqa xmm3, xmm2
0x145824f96: pcmpeqb xmm3, xmm0
0x145824f9a: pmovmskb r10d, xmm3
0x145824f9f: test r10d, r10d
0x145824fa2: je 0x145824fe0
0x145824fa4: tzcnt r11d, r10d
0x145824fa9: add r11, rax
0x145824fac: and r11, rdx
0x145824faf: mov r8, r11
0x145824fb2: neg r8
0x145824fb5: lea r8, [r8 + r8*2]
0x145824fb9: shl r8, 4
0x145824fbd: cmp r14d, dword ptr [rcx + r8 - 0x30]
0x145824fc2: je 0x145824fff
0x145824fc4: lea r8d, [r10 - 1]
0x145824fc8: and r8w, r10w
0x145824fcc: mov r10d, r8d
0x145824fcf: jne 0x145824fa4
0x145824fd1: nop word ptr cs:[rax + rax]
0x145824fe0: pcmpeqb xmm2, xmm1
0x145824fe4: pmovmskb r8d, xmm2
0x145824fe9: test r8d, r8d
0x145824fec: jne 0x145825134
0x145824ff2: add rax, r9
0x145824ff5: add rax, 0x10
0x145824ff9: add r9, 0x10
0x145824ffd: jmp 0x145824f8a
0x145824fff: add r8, rcx
0x145825002: shl r11, 4
0x145825006: lea r9, [r11 + r11*2]
0x14582500a: sar r9, 4
0x14582500e: movabs rax, 0xaaaaaaaaaaaaaaab
0x145825018: imul rax, r9
0x14582501c: lea r9, [rax - 0x10]
0x145825020: and r9, rdx
0x145825023: movdqu xmm0, xmmword ptr [rcx + r9]
0x145825029: pcmpeqd xmm1, xmm1
0x14582502d: pcmpeqb xmm0, xmm1
0x145825031: pmovmskb edx, xmm0
0x145825035: movdqu xmm0, xmmword ptr [rcx + rax]
0x14582503a: pcmpeqb xmm0, xmm1
0x14582503e: pmovmskb r10d, xmm0
0x145825043: mov r11w, 0x1f
0x145825048: bsr r11w, dx
0x14582504d: xor r11d, 0xf
0x145825051: or r10d, 0x10000
0x145825058: tzcnt r10d, r10d
0x14582505d: add r10d, r11d
0x145825060: mov dl, 0x80
0x145825062: cmp r10w, 0xf
0x145825067: ja 0x145825073
0x145825069: inc qword ptr [r12 + 0xd0]
0x145825071: mov dl, 0xff
0x145825073: mov byte ptr [rcx + rax], dl
0x145825076: mov byte ptr [rcx + r9 + 0x10], dl
0x14582507b: dec qword ptr [r12 + 0xd8]
0x145825083: mov rdi, qword ptr [r8 - 0x28]
0x145825087: cmp rdi, -1
0x14582508b: je 0x145825134
0x145825091: mov rsi, qword ptr [r8 - 0x20]
0x145825095: mov r15, qword ptr [r8 - 0x10]
0x145825099: test r15, r15
0x14582509c: je 0x145825112
0x14582509e: mov dword ptr [rbp + 0x6c], r13d
0x1458250a2: mov qword ptr [rbp + 0x60], r12
0x1458250a6: mov rax, qword ptr [r8 - 0x18]
0x1458250aa: xor edx, edx
0x1458250ac: cmp rax, rdi
0x1458250af: mov rcx, rdi
0x1458250b2: cmovb rcx, rdx
0x1458250b6: mov r8, rax
0x1458250b9: sub r8, rcx
0x1458250bc: mov r12, rdi
0x1458250bf: sub r12, r8
0x1458250c2: lea r13, [r8 + r15]
0x1458250c6: mov r14, r15
0x1458250c9: sub r14, r12
0x1458250cc: cmovb r14, rdx
0x1458250d0: cmova r13, rdi
0x1458250d4: sub r13, r8
0x1458250d7: jne 0x145825163
0x1458250dd: cmp r12, r15
0x1458250e0: mov r12, qword ptr [rbp + 0x60]
0x1458250e4: mov r13d, dword ptr [rbp + 0x6c]
0x1458250e8: jae 0x145825112
0x1458250ea: lea rbx, [rsi + 8]
0x1458250ee: jmp 0x1458250f9
0x1458250f0: add rbx, 0x18
0x1458250f4: dec r14
0x1458250f7: je 0x145825112
0x1458250f9: mov rdx, qword ptr [rbx - 8]
0x1458250fd: test rdx, rdx
0x145825100: je 0x1458250f0
0x145825102: mov rcx, qword ptr [rbx]
0x145825105: mov r8d, 1
0x14582510b: call 0x1400021d0
0x145825110: jmp 0x1458250f0
0x145825112: test rdi, rdi
0x145825115: mov rbx, qword ptr [rip + 0x29ef91c]
0x14582511c: je 0x145825134
0x14582511e: shl rdi, 3
0x145825122: lea rdx, [rdi + rdi*2]
0x145825126: mov r8d, 8
0x14582512c: mov rcx, rsi
0x14582512f: call 0x1400021d0
0x145825134: test r13b, r13b
0x145825137: jne 0x145825144
0x145825139: mov rax, qword ptr [rbx]
0x14582513c: shl rax, 1
0x14582513f: test rax, rax
0x145825142: jne 0x1458251b4
0x145825144: xor eax, eax
0x145825146: xchg byte ptr [r12 + 0x10], al
0x14582514b: cmp al, 2
0x14582514d: je 0x1458251a6
0x14582514f: add rsp, 0xf8
0x145825156: pop rbx
0x145825157: pop rdi
0x145825158: pop rsi
0x145825159: pop r12
0x14582515b: pop r13
0x14582515d: pop r14
0x14582515f: pop r15
0x145825161: pop rbp
0x145825162: ret
0x145825163: shl rax, 3
0x145825167: lea rax, [rax + rax*2]
0x14582516b: shl rcx, 3
0x14582516f: lea rcx, [rcx + rcx*2]
0x145825173: sub rax, rcx
0x145825176: lea rbx, [rax + rsi]
0x14582517a: add rbx, 8
0x14582517e: jmp 0x14582518d
0x145825180: add rbx, 0x18
0x145825184: dec r13
0x145825187: je 0x1458250dd
0x14582518d: mov rdx, qword ptr [rbx - 8]
0x145825191: test rdx, rdx
0x145825194: je 0x145825180
0x145825196: mov rcx, qword ptr [rbx]
0x145825199: mov r8d, 1
0x14582519f: call 0x1400021d0
0x1458251a4: jmp 0x145825180
0x1458251a6: add r12, 0x10
0x1458251aa: mov rcx, r12
0x1458251ad: call 0x145eb5730
0x1458251b2: jmp 0x14582514f
0x1458251b4: call 0x145eb6400
0x1458251b9: test al, al
0x1458251bb: jne 0x145825144
0x1458251bd: mov byte ptr [r12 + 0x11], 1
0x1458251c3: jmp 0x145825144

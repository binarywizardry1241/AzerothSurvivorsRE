; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458ed780..0x1458ede1e SHA256 003690f3622b04ebac65c3b2261bcdc2ba04df3294ddc28a250dc1cf812760a0
0x1458ed780: push rbp
0x1458ed781: push r15
0x1458ed783: push r14
0x1458ed785: push r13
0x1458ed787: push r12
0x1458ed789: push rsi
0x1458ed78a: push rdi
0x1458ed78b: push rbx
0x1458ed78c: sub rsp, 0xe8
0x1458ed793: lea rbp, [rsp + 0x80]
0x1458ed79b: mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0x1458ed7a3: mov rsi, rcx
0x1458ed7a6: mov rcx, r8
0x1458ed7a9: sub rcx, rdx
0x1458ed7ac: sub rcx, r8
0x1458ed7af: xor r9d, r9d
0x1458ed7b2: jmp 0x1458ed7ed
0x1458ed7b4: nop word ptr cs:[rax + rax]
0x1458ed7c0: movzx edi, byte ptr [r9 + 3]
0x1458ed7c5: add r9, 4
0x1458ed7c9: and r11d, 7
0x1458ed7cd: shl r11d, 0x12
0x1458ed7d1: shl r10d, 6
0x1458ed7d5: and edi, 0x3f
0x1458ed7d8: or edi, r10d
0x1458ed7db: or edi, r11d
0x1458ed7de: mov r10d, edi
0x1458ed7e1: add r9, rcx
0x1458ed7e4: cmp r10d, 0xfeff
0x1458ed7eb: jne 0x1458ed845
0x1458ed7ed: cmp r9, r8
0x1458ed7f0: je 0x1458ed842
0x1458ed7f2: mov rax, r9
0x1458ed7f5: add r9, rdx
0x1458ed7f8: movzx ebx, byte ptr [r9]
0x1458ed7fc: test bl, bl
0x1458ed7fe: jns 0x1458ed845
0x1458ed800: cmp bl, 0xe0
0x1458ed803: jb 0x1458ed845
0x1458ed805: movzx r11d, bl
0x1458ed809: and r11d, 0x1f
0x1458ed80d: movzx edi, byte ptr [r9 + 1]
0x1458ed812: and edi, 0x3f
0x1458ed815: movzx r10d, byte ptr [r9 + 2]
0x1458ed81a: shl edi, 6
0x1458ed81d: and r10d, 0x3f
0x1458ed821: or r10d, edi
0x1458ed824: cmp bl, 0xf0
0x1458ed827: jae 0x1458ed7c0
0x1458ed829: add r9, 3
0x1458ed82d: shl r11d, 0xc
0x1458ed831: or r10d, r11d
0x1458ed834: add r9, rcx
0x1458ed837: cmp r10d, 0xfeff
0x1458ed83e: je 0x1458ed7ed
0x1458ed840: jmp 0x1458ed845
0x1458ed842: mov rax, r8
0x1458ed845: add rdx, rax
0x1458ed848: mov qword ptr [rbp + 8], 0
0x1458ed850: mov qword ptr [rbp + 0x10], 8
0x1458ed858: mov qword ptr [rbp + 0x18], 0
0x1458ed860: sub r8, rax
0x1458ed863: mov qword ptr [rbp + 0x30], rdx
0x1458ed867: mov qword ptr [rbp + 0x38], r8
0x1458ed86b: je 0x1458ed89e
0x1458ed86d: xor eax, eax
0x1458ed86f: movabs rcx, 0x100002600
0x1458ed879: nop dword ptr [rax]
0x1458ed880: movzx r9d, byte ptr [rdx + rax]
0x1458ed885: cmp r9, 0x20
0x1458ed889: ja 0x1458ed8a0
0x1458ed88b: bt rcx, r9
0x1458ed88f: jae 0x1458ed8a0
0x1458ed891: inc rax
0x1458ed894: cmp r8, rax
0x1458ed897: jne 0x1458ed880
0x1458ed899: mov rax, r8
0x1458ed89c: jmp 0x1458ed8a0
0x1458ed89e: xor eax, eax
0x1458ed8a0: mov qword ptr [rbp + 0x40], rax
0x1458ed8a4: lea rcx, [rbp - 0x28]
0x1458ed8a8: lea rdx, [rbp + 0x30]
0x1458ed8ac: mov r8b, 0x7b
0x1458ed8af: call 0x1458e94d0
0x1458ed8b4: nop
0x1458ed8b5: cmp qword ptr [rbp - 0x28], -1
0x1458ed8ba: je 0x1458ed961
0x1458ed8c0: mov rax, qword ptr [rbp - 0x18]
0x1458ed8c4: mov qword ptr [rsi + 0x18], rax
0x1458ed8c8: movdqu xmm0, xmmword ptr [rbp - 0x28]
0x1458ed8cd: movdqu xmmword ptr [rsi + 8], xmm0
0x1458ed8d2: mov qword ptr [rsi], 1
0x1458ed8d9: mov rdi, qword ptr [rbp + 0x18]
0x1458ed8dd: test rdi, rdi
0x1458ed8e0: je 0x1458ed92a
0x1458ed8e2: mov rbx, qword ptr [rbp + 0x10]
0x1458ed8e6: add rbx, 0x20
0x1458ed8ea: jmp 0x1458ed8f9
0x1458ed8ec: nop dword ptr [rax]
0x1458ed8f0: add rbx, 0x30
0x1458ed8f4: dec rdi
0x1458ed8f7: je 0x1458ed92a
0x1458ed8f9: mov rdx, qword ptr [rbx - 0x20]
0x1458ed8fd: test rdx, rdx
0x1458ed900: je 0x1458ed911
0x1458ed902: mov rcx, qword ptr [rbx - 0x18]
0x1458ed906: mov r8d, 1
0x1458ed90c: call 0x1400021d0
0x1458ed911: mov rdx, qword ptr [rbx - 8]
0x1458ed915: test rdx, rdx
0x1458ed918: je 0x1458ed8f0
0x1458ed91a: mov rcx, qword ptr [rbx]
0x1458ed91d: mov r8d, 1
0x1458ed923: call 0x1400021d0
0x1458ed928: jmp 0x1458ed8f0
0x1458ed92a: mov rax, qword ptr [rbp + 8]
0x1458ed92e: test rax, rax
0x1458ed931: je 0x1458ed94a
0x1458ed933: mov rcx, qword ptr [rbp + 0x10]
0x1458ed937: shl rax, 4
0x1458ed93b: lea rdx, [rax + rax*2]
0x1458ed93f: mov r8d, 8
0x1458ed945: call 0x1400021d0
0x1458ed94a: mov rax, rsi
0x1458ed94d: add rsp, 0xe8
0x1458ed954: pop rbx
0x1458ed955: pop rdi
0x1458ed956: pop rsi
0x1458ed957: pop r12
0x1458ed959: pop r13
0x1458ed95b: pop r14
0x1458ed95d: pop r15
0x1458ed95f: pop rbp
0x1458ed960: ret
0x1458ed961: mov r14, qword ptr [rbp + 0x38]
0x1458ed965: mov r12, qword ptr [rbp + 0x40]
0x1458ed969: cmp r12, r14
0x1458ed96c: jae 0x1458ed9be
0x1458ed96e: mov rax, qword ptr [rbp + 0x30]
0x1458ed972: movabs rcx, 0x100002600
0x1458ed97c: nop dword ptr [rax]
0x1458ed980: movzx edx, byte ptr [rax + r12]
0x1458ed985: cmp rdx, 0x20
0x1458ed989: ja 0x1458ed99e
0x1458ed98b: bt rcx, rdx
0x1458ed98f: jae 0x1458ed99e
0x1458ed991: inc r12
0x1458ed994: cmp r14, r12
0x1458ed997: jne 0x1458ed980
0x1458ed999: mov r12, r14
0x1458ed99c: jmp 0x1458ed9be
0x1458ed99e: cmp edx, 0x7d
0x1458ed9a1: jne 0x1458ed9be
0x1458ed9a3: mov rax, qword ptr [rbp + 0x18]
0x1458ed9a7: mov qword ptr [rsi + 0x18], rax
0x1458ed9ab: movdqu xmm0, xmmword ptr [rbp + 8]
0x1458ed9b0: movdqu xmmword ptr [rsi + 8], xmm0
0x1458ed9b5: mov qword ptr [rsi], 0
0x1458ed9bc: jmp 0x1458ed94a
0x1458ed9be: movabs r15, 0x100002600
0x1458ed9c8: lea rdi, [rbp - 0x28]
0x1458ed9cc: lea rbx, [rbp + 0x30]
0x1458ed9d0: cmp r12, r14
0x1458ed9d3: jae 0x1458ed9fc
0x1458ed9d5: mov rax, qword ptr [rbp + 0x30]
0x1458ed9d9: nop dword ptr [rax]
0x1458ed9e0: movzx ecx, byte ptr [rax + r12]
0x1458ed9e5: cmp rcx, 0x20
0x1458ed9e9: ja 0x1458ed9fc
0x1458ed9eb: bt r15, rcx
0x1458ed9ef: jae 0x1458ed9fc
0x1458ed9f1: inc r12
0x1458ed9f4: cmp r14, r12
0x1458ed9f7: jne 0x1458ed9e0
0x1458ed9f9: mov r12, r14
0x1458ed9fc: mov qword ptr [rbp + 0x40], r12
0x1458eda00: mov rcx, rdi
0x1458eda03: mov rdx, rbx
0x1458eda06: call 0x1458e96e0
0x1458eda0b: nop
0x1458eda0c: mov rax, qword ptr [rbp - 0x20]
0x1458eda10: mov qword ptr [rbp + 0x50], rax
0x1458eda14: mov rax, qword ptr [rbp - 0x18]
0x1458eda18: mov qword ptr [rbp + 0x48], rax
0x1458eda1c: mov r14, qword ptr [rbp - 0x10]
0x1458eda20: cmp dword ptr [rbp - 0x28], 1
0x1458eda24: je 0x1458edcc9
0x1458eda2a: mov rcx, qword ptr [rbp + 0x38]
0x1458eda2e: mov rax, qword ptr [rbp + 0x40]
0x1458eda32: cmp rax, rcx
0x1458eda35: jae 0x1458eda5c
0x1458eda37: mov rdx, qword ptr [rbp + 0x30]
0x1458eda3b: nop dword ptr [rax + rax]
0x1458eda40: movzx r8d, byte ptr [rdx + rax]
0x1458eda45: cmp r8, 0x20
0x1458eda49: ja 0x1458eda5c
0x1458eda4b: bt r15, r8
0x1458eda4f: jae 0x1458eda5c
0x1458eda51: inc rax
0x1458eda54: cmp rcx, rax
0x1458eda57: jne 0x1458eda40
0x1458eda59: mov rax, rcx
0x1458eda5c: mov qword ptr [rbp + 0x40], rax
0x1458eda60: mov byte ptr [rbp + 0x5f], 1
0x1458eda64: mov rcx, rdi
0x1458eda67: mov rdx, rbx
0x1458eda6a: mov r8b, 0x3a
0x1458eda6d: call 0x1458e94d0
0x1458eda72: nop
0x1458eda73: cmp qword ptr [rbp - 0x28], -1
0x1458eda78: jne 0x1458edce2
0x1458eda7e: mov rcx, qword ptr [rbp + 0x38]
0x1458eda82: mov rax, qword ptr [rbp + 0x40]
0x1458eda86: cmp rax, rcx
0x1458eda89: jae 0x1458edaac
0x1458eda8b: mov rdx, qword ptr [rbp + 0x30]
0x1458eda8f: nop
0x1458eda90: movzx r8d, byte ptr [rdx + rax]
0x1458eda95: cmp r8, 0x20
0x1458eda99: ja 0x1458edaac
0x1458eda9b: bt r15, r8
0x1458eda9f: jae 0x1458edaac
0x1458edaa1: inc rax
0x1458edaa4: cmp rcx, rax
0x1458edaa7: jne 0x1458eda90
0x1458edaa9: mov rax, rcx
0x1458edaac: mov qword ptr [rbp + 0x40], rax
0x1458edab0: mov byte ptr [rbp + 0x5f], 1
0x1458edab4: mov rcx, rdi
0x1458edab7: mov rdx, rbx
0x1458edaba: call 0x1458e96e0
0x1458edabf: nop
0x1458edac0: mov rcx, qword ptr [rbp - 0x20]
0x1458edac4: mov rax, qword ptr [rbp - 0x18]
0x1458edac8: mov qword ptr [rbp + 0x28], rax
0x1458edacc: mov rax, qword ptr [rbp - 0x10]
0x1458edad0: cmp dword ptr [rbp - 0x28], 1
0x1458edad4: je 0x1458edcfe
0x1458edada: mov qword ptr [rbp + 0x20], rcx
0x1458edade: test r14, r14
0x1458edae1: je 0x1458edaef
0x1458edae3: mov r13b, 1
0x1458edae6: mov rcx, qword ptr [rbp + 0x48]
0x1458edaea: cmp byte ptr [rcx], 0x5f
0x1458edaed: je 0x1458edb61
0x1458edaef: mov rcx, qword ptr [rbp + 0x50]
0x1458edaf3: mov qword ptr [rbp - 0x28], rcx
0x1458edaf7: mov rcx, qword ptr [rbp + 0x48]
0x1458edafb: mov qword ptr [rbp - 0x20], rcx
0x1458edaff: mov qword ptr [rbp - 0x18], r14
0x1458edb03: mov rcx, qword ptr [rbp + 0x20]
0x1458edb07: mov qword ptr [rbp - 0x10], rcx
0x1458edb0b: mov rcx, qword ptr [rbp + 0x28]
0x1458edb0f: mov qword ptr [rbp - 8], rcx
0x1458edb13: mov qword ptr [rbp], rax
0x1458edb17: mov r14, qword ptr [rbp + 0x18]
0x1458edb1b: cmp r14, qword ptr [rbp + 8]
0x1458edb1f: jne 0x1458edb2b
0x1458edb21: lea rcx, [rbp + 8]
0x1458edb25: call 0x145bfacc0
0x1458edb2a: nop
0x1458edb2b: mov rax, qword ptr [rbp + 0x10]
0x1458edb2f: lea rcx, [r14 + r14*2]
0x1458edb33: shl rcx, 4
0x1458edb37: movdqu xmm0, xmmword ptr [rbp - 0x28]
0x1458edb3c: movdqu xmm1, xmmword ptr [rbp - 0x18]
0x1458edb41: movdqu xmm2, xmmword ptr [rbp - 8]
0x1458edb46: movdqu xmmword ptr [rax + rcx + 0x20], xmm2
0x1458edb4c: movdqu xmmword ptr [rax + rcx + 0x10], xmm1
0x1458edb52: movdqu xmmword ptr [rax + rcx], xmm0
0x1458edb57: inc r14
0x1458edb5a: mov qword ptr [rbp + 0x18], r14
0x1458edb5e: xor r13d, r13d
0x1458edb61: mov rax, qword ptr [rbp + 0x30]
0x1458edb65: mov r14, qword ptr [rbp + 0x38]
0x1458edb69: mov r12, qword ptr [rbp + 0x40]
0x1458edb6d: cmp r12, r14
0x1458edb70: jae 0x1458edbf8
0x1458edb76: inc r12
0x1458edb79: mov rcx, r14
0x1458edb7c: neg rcx
0x1458edb7f: nop
0x1458edb80: movzx edx, byte ptr [rax + r12 - 1]
0x1458edb86: cmp rdx, 0x20
0x1458edb8a: ja 0x1458edba4
0x1458edb8c: bt r15, rdx
0x1458edb90: jae 0x1458edba4
0x1458edb92: lea rdx, [rcx + r12]
0x1458edb96: inc rdx
0x1458edb99: inc r12
0x1458edb9c: cmp rdx, 1
0x1458edba0: jne 0x1458edb80
0x1458edba2: jmp 0x1458edbf5
0x1458edba4: mov qword ptr [rbp + 0x40], r12
0x1458edba8: cmp edx, 0x2c
0x1458edbab: jne 0x1458edd1a
0x1458edbb1: test r13b, r13b
0x1458edbb4: je 0x1458ed9d0
0x1458edbba: mov rdx, qword ptr [rbp + 0x20]
0x1458edbbe: test rdx, rdx
0x1458edbc1: je 0x1458edbd2
0x1458edbc3: mov r8d, 1
0x1458edbc9: mov rcx, qword ptr [rbp + 0x28]
0x1458edbcd: call 0x1400021d0
0x1458edbd2: cmp qword ptr [rbp + 0x50], 0
0x1458edbd7: je 0x1458ed9d0
0x1458edbdd: mov r8d, 1
0x1458edbe3: mov rcx, qword ptr [rbp + 0x48]
0x1458edbe7: mov rdx, qword ptr [rbp + 0x50]
0x1458edbeb: call 0x1400021d0
0x1458edbf0: jmp 0x1458ed9d0
0x1458edbf5: mov r12, r14
0x1458edbf8: inc r12
0x1458edbfb: mov qword ptr [rbp + 0x40], r12
0x1458edbff: lea rcx, [rip + 0x1303ebe]
0x1458edc06: mov qword ptr [rbp - 0x40], rcx
0x1458edc0a: mov qword ptr [rbp - 0x38], 0xf
0x1458edc12: cmp r14, r12
0x1458edc15: cmovb r12, r14
0x1458edc19: test r12, r12
0x1458edc1c: je 0x1458edc2d
0x1458edc1e: cmp r12, 4
0x1458edc22: jae 0x1458edc34
0x1458edc24: xor ecx, ecx
0x1458edc26: xor edx, edx
0x1458edc28: jmp 0x1458edd67
0x1458edc2d: xor edx, edx
0x1458edc2f: jmp 0x1458edd7d
0x1458edc34: mov rcx, r12
0x1458edc37: and rcx, 0xfffffffffffffffc
0x1458edc3b: pxor xmm0, xmm0
0x1458edc3f: xor edx, edx
0x1458edc41: movdqa xmm1, xmmword ptr [rip + 0x773c27]
0x1458edc49: movdqa xmm3, xmmword ptr [rip + 0x4af80f]
0x1458edc51: pxor xmm2, xmm2
0x1458edc55: nop word ptr cs:[rax + rax]
0x1458edc60: movzx r8d, word ptr [rax + rdx]
0x1458edc65: movd xmm4, r8d
0x1458edc6a: movzx r8d, word ptr [rax + rdx + 2]
0x1458edc70: movd xmm5, r8d
0x1458edc75: pcmpeqb xmm4, xmm1
0x1458edc79: punpcklbw xmm4, xmm4
0x1458edc7d: pshuflw xmm4, xmm4, 0xd4
0x1458edc82: pshufd xmm4, xmm4, 0xd4
0x1458edc87: pand xmm4, xmm3
0x1458edc8b: paddq xmm2, xmm4
0x1458edc8f: pcmpeqb xmm5, xmm1
0x1458edc93: punpcklbw xmm5, xmm5
0x1458edc97: pshuflw xmm4, xmm5, 0xd4
0x1458edc9c: pshufd xmm4, xmm4, 0xd4
0x1458edca1: pand xmm4, xmm3
0x1458edca5: paddq xmm0, xmm4
0x1458edca9: add rdx, 4
0x1458edcad: cmp rcx, rdx
0x1458edcb0: jne 0x1458edc60
0x1458edcb2: paddq xmm0, xmm2
0x1458edcb6: pshufd xmm1, xmm0, 0xee
0x1458edcbb: paddq xmm1, xmm0
0x1458edcbf: movq rdx, xmm1
0x1458edcc4: jmp 0x1458edd78
0x1458edcc9: mov rax, qword ptr [rbp + 0x50]
0x1458edccd: mov qword ptr [rsi + 8], rax
0x1458edcd1: mov rax, qword ptr [rbp + 0x48]
0x1458edcd5: mov qword ptr [rsi + 0x10], rax
0x1458edcd9: mov qword ptr [rsi + 0x18], r14
0x1458edcdd: jmp 0x1458ed8d2
0x1458edce2: mov rax, qword ptr [rbp - 0x18]
0x1458edce6: mov qword ptr [rsi + 0x18], rax
0x1458edcea: movups xmm0, xmmword ptr [rbp - 0x28]
0x1458edcee: movups xmmword ptr [rsi + 8], xmm0
0x1458edcf2: mov qword ptr [rsi], 1
0x1458edcf9: jmp 0x1458eddfb
0x1458edcfe: mov qword ptr [rsi + 8], rcx
0x1458edd02: mov rcx, qword ptr [rbp + 0x28]
0x1458edd06: mov qword ptr [rsi + 0x10], rcx
0x1458edd0a: mov qword ptr [rsi + 0x18], rax
0x1458edd0e: mov qword ptr [rsi], 1
0x1458edd15: jmp 0x1458eddfb
0x1458edd1a: cmp edx, 0x7d
0x1458edd1d: jne 0x1458edbff
0x1458edd23: test r13b, r13b
0x1458edd26: je 0x1458ed9a3
0x1458edd2c: mov rdx, qword ptr [rbp + 0x20]
0x1458edd30: test rdx, rdx
0x1458edd33: je 0x1458edd44
0x1458edd35: mov r8d, 1
0x1458edd3b: mov rcx, qword ptr [rbp + 0x28]
0x1458edd3f: call 0x1400021d0
0x1458edd44: cmp qword ptr [rbp + 0x50], 0
0x1458edd49: je 0x1458ed9a3
0x1458edd4f: mov r8d, 1
0x1458edd55: mov rcx, qword ptr [rbp + 0x48]
0x1458edd59: mov rdx, qword ptr [rbp + 0x50]
0x1458edd5d: call 0x1400021d0
0x1458edd62: jmp 0x1458ed9a3
0x1458edd67: xor r8d, r8d
0x1458edd6a: cmp byte ptr [rax + rcx], 0xa
0x1458edd6e: sete r8b
0x1458edd72: add rdx, r8
0x1458edd75: inc rcx
0x1458edd78: cmp r12, rcx
0x1458edd7b: jne 0x1458edd67
0x1458edd7d: inc rdx
0x1458edd80: mov qword ptr [rbp - 0x30], rdx
0x1458edd84: lea rax, [rbp - 0x30]
0x1458edd88: mov qword ptr [rbp - 0x28], rax
0x1458edd8c: lea rax, [rip + 0x2f1a3d]
0x1458edd93: mov qword ptr [rbp - 0x20], rax
0x1458edd97: lea rax, [rbp - 0x40]
0x1458edd9b: mov qword ptr [rbp - 0x18], rax
0x1458edd9f: lea rax, [rip - 0x58ebce6]
0x1458edda6: mov qword ptr [rbp - 0x10], rax
0x1458eddaa: mov byte ptr [rbp + 0x5e], r13b
0x1458eddae: lea rdx, [rip + 0x130391a]
0x1458eddb5: lea rcx, [rbp - 0x58]
0x1458eddb9: lea r8, [rbp - 0x28]
0x1458eddbd: call 0x145bcce30
0x1458eddc2: nop
0x1458eddc3: mov rax, qword ptr [rbp - 0x48]
0x1458eddc7: mov qword ptr [rsi + 0x18], rax
0x1458eddcb: movups xmm0, xmmword ptr [rbp - 0x58]
0x1458eddcf: movups xmmword ptr [rsi + 8], xmm0
0x1458eddd3: mov qword ptr [rsi], 1
0x1458eddda: test r13b, r13b
0x1458edddd: je 0x1458ed8d9
0x1458edde3: mov rdx, qword ptr [rbp + 0x20]
0x1458edde7: test rdx, rdx
0x1458eddea: je 0x1458eddfb
0x1458eddec: mov r8d, 1
0x1458eddf2: mov rcx, qword ptr [rbp + 0x28]
0x1458eddf6: call 0x1400021d0
0x1458eddfb: cmp qword ptr [rbp + 0x50], 0
0x1458ede00: je 0x1458ed8d9
0x1458ede06: mov r8d, 1
0x1458ede0c: mov rcx, qword ptr [rbp + 0x48]
0x1458ede10: mov rdx, qword ptr [rbp + 0x50]
0x1458ede14: call 0x1400021d0
0x1458ede19: jmp 0x1458ed8d9

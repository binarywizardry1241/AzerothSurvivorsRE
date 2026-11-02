0x14014ba40: push rbp
0x14014ba41: push r14
0x14014ba43: push rsi
0x14014ba44: push rdi
0x14014ba45: push rbx
0x14014ba46: sub rsp, 0x2d0
0x14014ba4d: lea rbp, [rsp + 0x80]
0x14014ba55: mov qword ptr [rbp + 0x248], 0xfffffffffffffffe
0x14014ba60: mov rdi, r8
0x14014ba63: mov rsi, rdx
0x14014ba66: mov rdx, rcx
0x14014ba69: mov rcx, qword ptr [rbp + 0x2a8]
0x14014ba70: mov rax, qword ptr [rbp + 0x2a0]
0x14014ba77: mov qword ptr [rbp + 0x220], r9
0x14014ba7e: mov qword ptr [rbp + 0x228], rax
0x14014ba85: movups xmm0, xmmword ptr [rip + 0x6078684]
0x14014ba8c: movaps xmmword ptr [rbp + 0x1c0], xmm0
0x14014ba93: mov qword ptr [rbp + 0x1d0], 0
0x14014ba9e: movups xmm0, xmmword ptr [rip + 0x6078683]
0x14014baa5: movups xmmword ptr [rbp + 0x1d8], xmm0
0x14014baac: mov qword ptr [rbp + 0x1e8], 0
0x14014bab7: movups xmm0, xmmword ptr [rip + 0x6078682]
0x14014babe: movaps xmmword ptr [rbp + 0x1f0], xmm0
0x14014bac5: mov qword ptr [rbp + 0x200], 0
0x14014bad0: movups xmm0, xmmword ptr [rip + 0x6078681]
0x14014bad7: movups xmmword ptr [rbp + 0x208], xmm0
0x14014bade: mov qword ptr [rbp + 0x218], 0
0x14014bae9: cmp byte ptr [rcx + 0x4b], 0
0x14014baed: je 0x14014bb07
0x14014baef: movups xmm0, xmmword ptr [rip + 0x6079082]
0x14014baf6: movaps xmmword ptr [rbp + 0x230], xmm0
0x14014bafd: movss xmm0, dword ptr [rip + 0x60724bf]
0x14014bb05: jmp 0x14014bb1d
0x14014bb07: movups xmm0, xmmword ptr [rip + 0x6078fea]
0x14014bb0e: movaps xmmword ptr [rbp + 0x230], xmm0
0x14014bb15: movss xmm0, dword ptr [rip + 0x60666e3]
0x14014bb1d: mov rax, qword ptr [rdx]
0x14014bb20: add rdx, 8
0x14014bb24: movaps xmm1, xmmword ptr [rbp + 0x210]
0x14014bb2b: movups xmmword ptr [rbp + 0x28], xmm1
0x14014bb2f: movaps xmm1, xmmword ptr [rbp + 0x200]
0x14014bb36: movups xmmword ptr [rbp + 0x18], xmm1
0x14014bb3a: movaps xmm1, xmmword ptr [rbp + 0x1c0]
0x14014bb41: movaps xmm2, xmmword ptr [rbp + 0x1d0]
0x14014bb48: movaps xmm3, xmmword ptr [rbp + 0x1e0]
0x14014bb4f: movaps xmm4, xmmword ptr [rbp + 0x1f0]
0x14014bb56: movups xmmword ptr [rbp + 8], xmm4
0x14014bb5a: movups xmmword ptr [rbp - 8], xmm3
0x14014bb5e: movups xmmword ptr [rbp - 0x18], xmm2
0x14014bb62: movups xmmword ptr [rbp - 0x28], xmm1
0x14014bb66: xorps xmm1, xmm1
0x14014bb69: movups xmmword ptr [rbp + 0x38], xmm1
0x14014bb6d: movups xmmword ptr [rbp + 0x48], xmm1
0x14014bb71: movups xmmword ptr [rbp + 0x58], xmm1
0x14014bb75: movups xmmword ptr [rbp + 0x68], xmm1
0x14014bb79: movups xmmword ptr [rbp + 0x78], xmm1
0x14014bb7d: mov qword ptr [rbp + 0x88], 0
0x14014bb88: movups xmm1, xmmword ptr [rip + 0x6078649]
0x14014bb8f: movups xmmword ptr [rbp + 0xa0], xmm1
0x14014bb96: movups xmm1, xmmword ptr [rip + 0x607862b]
0x14014bb9d: movups xmmword ptr [rbp + 0x90], xmm1
0x14014bba4: movaps xmm1, xmmword ptr [rip + 0x6066785]
0x14014bbab: movups xmmword ptr [rbp + 0xb0], xmm1
0x14014bbb2: movaps xmm1, xmmword ptr [rip + 0x6072237]
0x14014bbb9: movups xmmword ptr [rbp + 0xc0], xmm1
0x14014bbc0: movaps xmm1, xmmword ptr [rip + 0x6066609]
0x14014bbc7: movups xmmword ptr [rbp + 0xd0], xmm1
0x14014bbce: movups xmmword ptr [rbp + 0xe0], xmm1
0x14014bbd5: movaps xmm1, xmmword ptr [rip + 0x6066684]
0x14014bbdc: movups xmmword ptr [rbp + 0xf0], xmm1
0x14014bbe3: movups xmmword ptr [rbp + 0x100], xmm1
0x14014bbea: movaps xmm1, xmmword ptr [rip + 0x60665ff]
0x14014bbf1: movups xmmword ptr [rbp + 0x110], xmm1
0x14014bbf8: mov dword ptr [rbp + 0x120], 1
0x14014bc02: movss xmm1, dword ptr [rip + 0x6066676]
0x14014bc0a: movlps qword ptr [rbp + 0x124], xmm1
0x14014bc11: mov byte ptr [rbp + 0x12c], 1
0x14014bc18: mov qword ptr [rbp + 0x130], 0
0x14014bc23: mov dword ptr [rbp + 0x138], 0x3f800000
0x14014bc2d: mov word ptr [rbp + 0x13c], 0
0x14014bc36: mov dword ptr [rbp + 0x13e], 0x10000
0x14014bc40: mov word ptr [rbp + 0x142], 0
0x14014bc49: mov word ptr [rbp + 0x148], 0
0x14014bc52: mov dword ptr [rbp + 0x144], 0x10000
0x14014bc5c: mov qword ptr [rbp + 0x14a], 0
0x14014bc67: mov dword ptr [rbp + 0x152], 5
0x14014bc71: movaps xmm1, xmmword ptr [rbp + 0x230]
0x14014bc78: movups xmmword ptr [rbp + 0x158], xmm1
0x14014bc7f: movss dword ptr [rbp + 0x168], xmm0
0x14014bc87: movups xmmword ptr [rbp + 0x16c], xmm1
0x14014bc8e: movss dword ptr [rbp + 0x17c], xmm0
0x14014bc96: movups xmmword ptr [rbp + 0x180], xmm1
0x14014bc9d: movss dword ptr [rbp + 0x190], xmm0
0x14014bca5: movups xmmword ptr [rbp + 0x194], xmm1
0x14014bcac: movss dword ptr [rbp + 0x1a4], xmm0
0x14014bcb4: movups xmm0, xmmword ptr [rip + 0x60790bd]
0x14014bcbb: movups xmmword ptr [rbp + 0x1a8], xmm0
0x14014bcc2: mov dword ptr [rbp + 0x1b8], 0x3ea3d70a
0x14014bccc: mov qword ptr [rbp - 0x30], rax
0x14014bcd0: lea r9, [rip + 0x6078051]
0x14014bcd7: lea rcx, [rbp - 0x60]
0x14014bcdb: lea r8, [rbp - 0x30]
0x14014bcdf: call 0x140244f40
0x14014bce4: nop 
0x14014bce5: mov r8, qword ptr [rbp + 0x2a8]
0x14014bcec: lea rax, [r8 + 0x4b]
0x14014bcf0: lea rcx, [r8 + 0x48]
0x14014bcf4: lea r14, [r8 + 0x18]
0x14014bcf8: lea rbx, [r8 + 0x30]
0x14014bcfc: lea rdx, [r8 + 0x4a]
0x14014bd00: mov qword ptr [rbp - 0x30], rcx
0x14014bd04: mov qword ptr [rbp - 0x28], r8
0x14014bd08: mov qword ptr [rbp - 0x20], r14
0x14014bd0c: mov qword ptr [rbp - 0x18], rax
0x14014bd10: mov qword ptr [rbp - 0x10], rbx
0x14014bd14: mov qword ptr [rbp - 8], rdx
0x14014bd18: mov qword ptr [rbp], rdi
0x14014bd1c: mov qword ptr [rbp + 8], rsi
0x14014bd20: lea rax, [rbp + 0x220]
0x14014bd27: mov qword ptr [rbp + 0x10], rax
0x14014bd2b: lea rcx, [rbp - 0x60]
0x14014bd2f: lea rdx, [rbp - 0x30]
0x14014bd33: call 0x140288f10
0x14014bd38: nop 
0x14014bd39: mov rsi, qword ptr [rbp + 0x2a8]
0x14014bd40: mov rdx, qword ptr [rsi]
0x14014bd43: test rdx, rdx
0x14014bd46: je 0x14014bd57
0x14014bd48: mov rcx, qword ptr [rsi + 8]
0x14014bd4c: mov r8d, 1
0x14014bd52: call 0x1400021d0
0x14014bd57: mov rdx, qword ptr [r14]
0x14014bd5a: test rdx, rdx
0x14014bd5d: je 0x14014bd6e
0x14014bd5f: mov rcx, qword ptr [rsi + 0x20]
0x14014bd63: mov r8d, 1
0x14014bd69: call 0x1400021d0
0x14014bd6e: mov rdx, qword ptr [rbx]
0x14014bd71: test rdx, rdx
0x14014bd74: je 0x14014bd86
0x14014bd76: mov rcx, qword ptr [rsi + 0x38]
0x14014bd7a: mov r8d, 1
0x14014bd80: call 0x1400021d0
0x14014bd85: nop 
0x14014bd86: add rsp, 0x2d0
0x14014bd8d: pop rbx
0x14014bd8e: pop rdi
0x14014bd8f: pop rsi
0x14014bd90: pop r14
0x14014bd92: pop rbp
0x14014bd93: ret 

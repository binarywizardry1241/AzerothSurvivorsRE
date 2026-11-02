0x14002c3f0: push rbp
0x14002c3f1: push r15
0x14002c3f3: push r14
0x14002c3f5: push r13
0x14002c3f7: push r12
0x14002c3f9: push rsi
0x14002c3fa: push rdi
0x14002c3fb: push rbx
0x14002c3fc: sub rsp, 0x358
0x14002c403: lea rbp, [rsp + 0x80]
0x14002c40b: movaps xmmword ptr [rbp + 0x2c0], xmm6
0x14002c412: mov qword ptr [rbp + 0x2b8], 0xfffffffffffffffe
0x14002c41d: mov rbx, r8
0x14002c420: mov rsi, rdx
0x14002c423: mov rdi, rcx
0x14002c426: lea rcx, [rbp + 0x230]
0x14002c42d: mov rdx, r8
0x14002c430: call 0x145ce7810
0x14002c435: cmp qword ptr [rbx + 0x48], -1
0x14002c43a: je 0x14002c462
0x14002c43c: lea rdx, [rbx + 0x48]
0x14002c440: mov byte ptr [rbp + 0x2b6], 1
0x14002c447: lea rcx, [rbp + 0x10]
0x14002c44b: call 0x145ce7810
0x14002c450: nop
0x14002c451: mov rax, qword ptr [rbp + 0x10]
0x14002c455: movups xmm0, xmmword ptr [rbp + 0x18]
0x14002c459: movaps xmmword ptr [rbp + 0x290], xmm0
0x14002c460: jmp 0x14002c469
0x14002c462: mov rax, 0xffffffffffffffff
0x14002c469: mov qword ptr [rbp + 0x28], rdi
0x14002c46d: mov dword ptr [rbp + 0x30], 0x41800000
0x14002c474: movups xmm0, xmmword ptr [rbp + 0x230]
0x14002c47b: movaps xmmword ptr [rbp + 0x10], xmm0
0x14002c47f: mov rcx, qword ptr [rbp + 0x240]
0x14002c486: mov qword ptr [rbp + 0x20], rcx
0x14002c48a: lea r14, [rbp + 0x38]
0x14002c48e: mov qword ptr [rbp + 0x38], rax
0x14002c492: movaps xmm0, xmmword ptr [rbp + 0x290]
0x14002c499: movaps xmmword ptr [rbp + 0x40], xmm0
0x14002c49d: mov byte ptr [rbp + 0x2b6], 0
0x14002c4a4: mov qword ptr [rsp + 0x20], r14
0x14002c4a9: movss xmm2, dword ptr [rip + 0x5eb3acf]
0x14002c4b1: lea r9, [rbp + 0x10]
0x14002c4b5: mov rcx, rsi
0x14002c4b8: mov rdx, rdi
0x14002c4bb: call 0x140026900
0x14002c4c0: nop
0x14002c4c1: cmp qword ptr [rbx + 0x60], -1
0x14002c4c6: je 0x14002c51d
0x14002c4c8: lea rdx, [rbx + 0x60]
0x14002c4cc: lea rcx, [rbp + 0x230]
0x14002c4d3: call 0x145ce7810
0x14002c4d8: mov rax, qword ptr [rbp + 0x230]
0x14002c4df: movups xmm0, xmmword ptr [rbp + 0x238]
0x14002c4e6: movups xmmword ptr [rbp + 0x18], xmm0
0x14002c4ea: mov qword ptr [rbp + 0x28], rdi
0x14002c4ee: mov dword ptr [rbp + 0x30], 0x41500000
0x14002c4f5: mov qword ptr [rbp + 0x10], rax
0x14002c4f9: mov qword ptr [rbp + 0x38], 0xffffffffffffffff
0x14002c501: mov qword ptr [rsp + 0x20], r14
0x14002c506: movss xmm2, dword ptr [rip + 0x5eb3a76]
0x14002c50e: lea r9, [rbp + 0x10]
0x14002c512: mov rcx, rsi
0x14002c515: mov rdx, rdi
0x14002c518: call 0x140026900
0x14002c51d: mov rax, qword ptr [rbx + 0x78]
0x14002c521: mov r15, qword ptr [rbx + 0x90]
0x14002c528: mov rcx, rax
0x14002c52b: and rcx, r15
0x14002c52e: cmp rcx, -1
0x14002c532: je 0x14002c5e9
0x14002c538: cmp rax, -1
0x14002c53c: je 0x14002c57d
0x14002c53e: lea rdx, [rbx + 0x78]
0x14002c542: lea rcx, [rbp + 0x230]
0x14002c549: call 0x145ce7810
0x14002c54e: cmp r15, -1
0x14002c552: je 0x14002c58e
0x14002c554: lea rdx, [rbx + 0x90]
0x14002c55b: mov byte ptr [rbp + 0x2b5], 1
0x14002c562: lea rcx, [rbp + 0x10]
0x14002c566: call 0x145ce7810
0x14002c56b: nop
0x14002c56c: mov rax, qword ptr [rbp + 0x10]
0x14002c570: movups xmm0, xmmword ptr [rbp + 0x18]
0x14002c574: movaps xmmword ptr [rbp + 0x290], xmm0
0x14002c57b: jmp 0x14002c595
0x14002c57d: mov qword ptr [rbp + 0x230], 0xffffffffffffffff
0x14002c588: cmp r15, -1
0x14002c58c: jne 0x14002c554
0x14002c58e: mov rax, 0xffffffffffffffff
0x14002c595: mov qword ptr [rbp + 0x28], rdi
0x14002c599: mov dword ptr [rbp + 0x30], 0x41500000
0x14002c5a0: movups xmm0, xmmword ptr [rbp + 0x230]
0x14002c5a7: movaps xmmword ptr [rbp + 0x10], xmm0
0x14002c5ab: mov rcx, qword ptr [rbp + 0x240]
0x14002c5b2: mov qword ptr [rbp + 0x20], rcx
0x14002c5b6: mov qword ptr [rbp + 0x38], rax
0x14002c5ba: movaps xmm0, xmmword ptr [rbp + 0x290]
0x14002c5c1: movaps xmmword ptr [rbp + 0x40], xmm0
0x14002c5c5: mov byte ptr [rbp + 0x2b5], 0
0x14002c5cc: mov qword ptr [rsp + 0x20], r14
0x14002c5d1: movss xmm2, dword ptr [rip + 0x5eb39ab]
0x14002c5d9: lea r9, [rbp + 0x10]
0x14002c5dd: mov rcx, rsi
0x14002c5e0: mov rdx, rdi
0x14002c5e3: call 0x140026900
0x14002c5e8: nop
0x14002c5e9: mov r12, qword ptr [rbx + 0x28]
0x14002c5ed: test r12, r12
0x14002c5f0: je 0x14002ce99
0x14002c5f6: mov rbx, qword ptr [rbx + 0x20]
0x14002c5fa: mov dword ptr [rbp + 0x274], 0x41500000
0x14002c604: mov qword ptr [rbp + 0x290], 0
0x14002c60f: mov qword ptr [rbp + 0x298], 8
0x14002c61a: mov qword ptr [rbp + 0x2a0], 0
0x14002c625: movups xmm6, xmmword ptr [rip + 0x5eb5118]
0x14002c62c: movaps xmmword ptr [rbp + 0x260], xmm6
0x14002c633: test r12, r12
0x14002c636: je 0x14002cb87
0x14002c63c: xor r14d, r14d
0x14002c63f: jmp 0x14002c65c
0x14002c641: nop word ptr cs:[rax + rax]
0x14002c650: mov r14, rax
0x14002c653: cmp rax, r12
0x14002c656: ja 0x14002c710
0x14002c65c: mov r8, r12
0x14002c65f: sub r8, r14
0x14002c662: lea rdx, [rbx + r14]
0x14002c666: cmp r8, 0x10
0x14002c66a: jae 0x14002c6a0
0x14002c66c: xor r13d, r13d
0x14002c66f: test r8, r8
0x14002c672: je 0x14002c692
0x14002c674: nop word ptr cs:[rax + rax]
0x14002c680: cmp byte ptr [rdx + r13], 0x7c
0x14002c685: je 0x14002c6ba
0x14002c687: inc r13
0x14002c68a: cmp r8, r13
0x14002c68d: jne 0x14002c680
0x14002c68f: mov r13, r8
0x14002c692: xor eax, eax
0x14002c694: cmp rax, 1
0x14002c698: je 0x14002c6d0
0x14002c69a: jmp 0x14002c710
0x14002c69c: nop dword ptr [rax]
0x14002c6a0: mov byte ptr [rbp + 0x2b7], 1
0x14002c6a7: mov cl, 0x7c
0x14002c6a9: call 0x145cefd80
0x14002c6ae: nop
0x14002c6af: mov r13, rdx
0x14002c6b2: cmp rax, 1
0x14002c6b6: je 0x14002c6d0
0x14002c6b8: jmp 0x14002c710
0x14002c6ba: mov eax, 1
0x14002c6bf: cmp rax, 1
0x14002c6c3: jne 0x14002c710
0x14002c6c5: nop word ptr cs:[rax + rax]
0x14002c6d0: lea rax, [r14 + r13]
0x14002c6d4: inc rax
0x14002c6d7: add r13, r14
0x14002c6da: cmp r13, r12
0x14002c6dd: jae 0x14002c650
0x14002c6e3: movzx ecx, byte ptr [rbx + r13]
0x14002c6e8: cmp rax, r12
0x14002c6eb: ja 0x14002c6f9
0x14002c6ed: mov r14, rax
0x14002c6f0: cmp cl, 0x7c
0x14002c6f3: jne 0x14002c65c
0x14002c6f9: cmp cl, 0x7c
0x14002c6fc: je 0x14002c713
0x14002c6fe: movaps xmm0, xmmword ptr [rbp + 0x260]
0x14002c705: movaps xmmword ptr [rbp + 0x10], xmm0
0x14002c709: jmp 0x14002c766
0x14002c70b: nop dword ptr [rax + rax]
0x14002c710: mov r13, r12
0x14002c713: test r13, r13
0x14002c716: je 0x14002c750
0x14002c718: movaps xmm0, xmmword ptr [rbp + 0x260]
0x14002c71f: movaps xmmword ptr [rbp + 0x10], xmm0
0x14002c723: cmp r13, r12
0x14002c726: jae 0x14002c760
0x14002c728: mov r15b, 1
0x14002c72b: cmp byte ptr [rbx + r13], 0xbf
0x14002c730: jle 0x14002cee4
0x14002c736: test r13, r13
0x14002c739: js 0x14002cb68
0x14002c73f: jmp 0x14002c775
0x14002c741: nop word ptr cs:[rax + rax]
0x14002c750: xor r8d, r8d
0x14002c753: jmp 0x14002c840
0x14002c758: nop dword ptr [rax + rax]
0x14002c760: jne 0x14002cee4
0x14002c766: xor r15d, r15d
0x14002c769: mov r13, r12
0x14002c76c: test r13, r13
0x14002c76f: js 0x14002cb68
0x14002c775: call 0x140002200
0x14002c77a: mov r14d, 1
0x14002c780: mov edx, 1
0x14002c785: mov rcx, r13
0x14002c788: call 0x1400021c0
0x14002c78d: test rax, rax
0x14002c790: je 0x14002cf32
0x14002c796: mov qword ptr [rbp + 0x280], rax
0x14002c79d: mov rcx, rax
0x14002c7a0: mov rdx, rbx
0x14002c7a3: mov qword ptr [rbp + 0x288], r13
0x14002c7aa: mov r8, r13
0x14002c7ad: call 0x145d145fb
0x14002c7b2: movaps xmm0, xmmword ptr [rbp + 0x10]
0x14002c7b6: movaps xmmword ptr [rbp + 0x230], xmm0
0x14002c7bd: mov r14, qword ptr [rbp + 0x2a0]
0x14002c7c4: cmp r14, qword ptr [rbp + 0x290]
0x14002c7cb: jne 0x14002c7da
0x14002c7cd: lea rcx, [rbp + 0x290]
0x14002c7d4: call 0x145d14fa0
0x14002c7d9: nop
0x14002c7da: mov rax, qword ptr [rbp + 0x298]
0x14002c7e1: lea rcx, [r14 + r14*2]
0x14002c7e5: shl rcx, 4
0x14002c7e9: mov dword ptr [rax + rcx], 0
0x14002c7f0: movaps xmm0, xmmword ptr [rbp + 0x230]
0x14002c7f7: movups xmmword ptr [rax + rcx + 4], xmm0
0x14002c7fc: mov r8, qword ptr [rbp + 0x288]
0x14002c803: mov qword ptr [rax + rcx + 0x18], r8
0x14002c808: mov rdx, qword ptr [rbp + 0x280]
0x14002c80f: mov qword ptr [rax + rcx + 0x20], rdx
0x14002c814: mov qword ptr [rax + rcx + 0x28], r8
0x14002c819: inc r14
0x14002c81c: mov qword ptr [rbp + 0x2a0], r14
0x14002c823: test r15b, r15b
0x14002c826: je 0x14002c834
0x14002c828: cmp byte ptr [rbx + r8], 0xbf
0x14002c82d: jg 0x14002c840
0x14002c82f: jmp 0x14002cf0e
0x14002c834: cmp r8, r12
0x14002c837: jne 0x14002cf0e
0x14002c83d: mov r8, r12
0x14002c840: mov r13, r12
0x14002c843: sub r13, r8
0x14002c846: add rbx, r8
0x14002c849: cmp r13, 2
0x14002c84d: jb 0x14002c865
0x14002c84f: cmp word ptr [rbx], 0x727c
0x14002c854: je 0x14002c920
0x14002c85a: cmp word ptr [rbx], 0x637c
0x14002c85f: je 0x14002c937
0x14002c865: cmp r12, r8
0x14002c868: mov r12d, 0
0x14002c86e: je 0x14002c633
0x14002c874: call 0x140002200
0x14002c879: mov ecx, 1
0x14002c87e: mov edx, 1
0x14002c883: call 0x1400021c0
0x14002c888: test rax, rax
0x14002c88b: je 0x14002cf3e
0x14002c891: mov qword ptr [rbp + 0x288], rax
0x14002c898: mov byte ptr [rax], 0x7c
0x14002c89b: mov r14, qword ptr [rbp + 0x2a0]
0x14002c8a2: cmp r14, qword ptr [rbp + 0x290]
0x14002c8a9: jne 0x14002c8b8
0x14002c8ab: lea rcx, [rbp + 0x290]
0x14002c8b2: call 0x145d14fa0
0x14002c8b7: nop
0x14002c8b8: mov rax, qword ptr [rbp + 0x298]
0x14002c8bf: lea rcx, [r14 + r14*2]
0x14002c8c3: shl rcx, 4
0x14002c8c7: mov dword ptr [rax + rcx], 0
0x14002c8ce: movaps xmm0, xmmword ptr [rbp + 0x260]
0x14002c8d5: movups xmmword ptr [rax + rcx + 4], xmm0
0x14002c8da: mov qword ptr [rax + rcx + 0x18], 1
0x14002c8e3: mov rdx, qword ptr [rbp + 0x288]
0x14002c8ea: mov qword ptr [rax + rcx + 0x20], rdx
0x14002c8ef: mov qword ptr [rax + rcx + 0x28], 1
0x14002c8f8: inc r14
0x14002c8fb: mov qword ptr [rbp + 0x2a0], r14
0x14002c902: cmp r13, 2
0x14002c906: jb 0x14002c912
0x14002c908: cmp byte ptr [rbx + 1], 0xc0
0x14002c90c: jl 0x14002cf57
0x14002c912: dec r13
0x14002c915: inc rbx
0x14002c918: mov r12, r13
0x14002c91b: jmp 0x14002c633
0x14002c920: add r13, -2
0x14002c924: add rbx, 2
0x14002c928: movaps xmmword ptr [rbp + 0x260], xmm6
0x14002c92f: mov r12, r13
0x14002c932: jmp 0x14002c633
0x14002c937: lea r15, [r13 - 2]
0x14002c93b: cmp r15, 8
0x14002c93f: jbe 0x14002c94d
0x14002c941: cmp byte ptr [rbx + 0xa], 0xc0
0x14002c945: jl 0x14002c865
0x14002c94b: jmp 0x14002c953
0x14002c94d: jne 0x14002c865
0x14002c953: lea r14, [rbx + 2]
0x14002c957: xor eax, eax
0x14002c959: nop dword ptr [rax]
0x14002c960: cmp rax, 8
0x14002c964: je 0x14002ca34
0x14002c96a: movzx r10d, byte ptr [r14 + rax]
0x14002c96f: movzx ecx, r10b
0x14002c973: test cl, cl
0x14002c975: js 0x14002c990
0x14002c977: inc rax
0x14002c97a: lea edx, [rcx - 0x3a]
0x14002c97d: cmp edx, -0xb
0x14002c980: jbe 0x14002ca20
0x14002c986: jmp 0x14002c960
0x14002c988: nop dword ptr [rax + rax]
0x14002c990: mov edx, ecx
0x14002c992: and edx, 0x1f
0x14002c995: movzx r9d, byte ptr [r14 + rax + 1]
0x14002c99b: and r9d, 0x3f
0x14002c99f: cmp cl, 0xdf
0x14002c9a2: jbe 0x14002c9e7
0x14002c9a4: movzx ecx, byte ptr [r14 + rax + 2]
0x14002c9aa: shl r9d, 6
0x14002c9ae: and ecx, 0x3f
0x14002c9b1: or ecx, r9d
0x14002c9b4: cmp r10b, 0xf0
0x14002c9b8: jb 0x14002ca00
0x14002c9ba: movzx r9d, byte ptr [r14 + rax + 3]
0x14002c9c0: add rax, 4
0x14002c9c4: and edx, 7
0x14002c9c7: shl edx, 0x12
0x14002c9ca: shl ecx, 6
0x14002c9cd: and r9d, 0x3f
0x14002c9d1: or r9d, ecx
0x14002c9d4: or r9d, edx
0x14002c9d7: mov ecx, r9d
0x14002c9da: lea edx, [rcx - 0x3a]
0x14002c9dd: cmp edx, -0xb
0x14002c9e0: jbe 0x14002ca20
0x14002c9e2: jmp 0x14002c960
0x14002c9e7: add rax, 2
0x14002c9eb: shl edx, 6
0x14002c9ee: or edx, r9d
0x14002c9f1: mov ecx, edx
0x14002c9f3: lea edx, [rcx - 0x3a]
0x14002c9f6: cmp edx, -0xb
0x14002c9f9: jbe 0x14002ca20
0x14002c9fb: jmp 0x14002c960
0x14002ca00: add rax, 3
0x14002ca04: shl edx, 0xc
0x14002ca07: or ecx, edx
0x14002ca09: lea edx, [rcx - 0x3a]
0x14002ca0c: cmp edx, -0xb
0x14002ca0f: ja 0x14002c960
0x14002ca15: nop word ptr cs:[rax + rax]
0x14002ca20: and ecx, 0xffffffdf
0x14002ca23: add ecx, -0x47
0x14002ca26: cmp ecx, -6
0x14002ca29: jae 0x14002c960
0x14002ca2f: jmp 0x14002c865
0x14002ca34: cmp r15, 8
0x14002ca38: jb 0x14002ceb4
0x14002ca3e: cmp byte ptr [rbx + 4], 0xc0
0x14002ca42: jl 0x14002ceb4
0x14002ca48: cmp r15, 8
0x14002ca4c: je 0x14002ca58
0x14002ca4e: cmp byte ptr [rbx + 0xa], 0xbf
0x14002ca52: jle 0x14002ceb4
0x14002ca58: lea rax, [rbx + 4]
0x14002ca5c: add rbx, 0xa
0x14002ca60: xor r9d, r9d
0x14002ca63: jmp 0x14002ca85
0x14002ca65: nop word ptr cs:[rax + rax]
0x14002ca70: lea r9, [rdx + 1]
0x14002ca74: sub r9, rbx
0x14002ca77: add r9, 6
0x14002ca7b: cmp r8d, 0x23
0x14002ca7f: jne 0x14002cb16
0x14002ca85: mov rcx, r9
0x14002ca88: lea rdx, [rax + r9]
0x14002ca8c: cmp r9, 6
0x14002ca90: je 0x14002cb16
0x14002ca96: movzx r9d, byte ptr [rdx]
0x14002ca9a: movzx r8d, r9b
0x14002ca9e: test r8b, r8b
0x14002caa1: jns 0x14002ca70
0x14002caa3: mov r10d, r8d
0x14002caa6: and r10d, 0x1f
0x14002caaa: movzx r11d, byte ptr [rdx + 1]
0x14002caaf: and r11d, 0x3f
0x14002cab3: cmp r8b, 0xdf
0x14002cab7: jbe 0x14002caf3
0x14002cab9: movzx r8d, byte ptr [rdx + 2]
0x14002cabe: shl r11d, 6
0x14002cac2: and r8d, 0x3f
0x14002cac6: or r8d, r11d
0x14002cac9: cmp r9b, 0xf0
0x14002cacd: jb 0x14002cb06
0x14002cacf: lea r9, [rdx + 4]
0x14002cad3: movzx r11d, byte ptr [rdx + 3]
0x14002cad8: and r10d, 7
0x14002cadc: shl r10d, 0x12
0x14002cae0: shl r8d, 6
0x14002cae4: and r11d, 0x3f
0x14002cae8: or r11d, r8d
0x14002caeb: or r11d, r10d
0x14002caee: mov r8d, r11d
0x14002caf1: jmp 0x14002ca74
0x14002caf3: lea r9, [rdx + 2]
0x14002caf7: shl r10d, 6
0x14002cafb: or r10d, r11d
0x14002cafe: mov r8d, r10d
0x14002cb01: jmp 0x14002ca74
0x14002cb06: lea r9, [rdx + 3]
0x14002cb0a: shl r10d, 0xc
0x14002cb0e: or r8d, r10d
0x14002cb11: jmp 0x14002ca74
0x14002cb16: mov r8d, 6
0x14002cb1c: sub r8, rcx
0x14002cb1f: mov byte ptr [rbp + 0x2b7], 1
0x14002cb26: lea rcx, [rbp + 0x10]
0x14002cb2a: call 0x1400040c0
0x14002cb2f: nop
0x14002cb30: cmp dword ptr [rbp + 0x10], 1
0x14002cb34: jne 0x14002cb3f
0x14002cb36: movups xmm0, xmmword ptr [rip + 0x5ee9273]
0x14002cb3d: jmp 0x14002cb46
0x14002cb3f: lea rax, [rbp + 0x14]
0x14002cb43: movups xmm0, xmmword ptr [rax]
0x14002cb46: movaps xmmword ptr [rbp + 0x260], xmm0
0x14002cb4d: cmp r15, 8
0x14002cb51: je 0x14002cb5c
0x14002cb53: cmp byte ptr [rbx], 0xc0
0x14002cb56: jl 0x14002cf81
0x14002cb5c: add r13, -0xa
0x14002cb60: mov r12, r13
0x14002cb63: jmp 0x14002c633
0x14002cb68: xor r14d, r14d
0x14002cb6b: mov byte ptr [rbp + 0x2b7], 1
0x14002cb72: mov rcx, r14
0x14002cb75: mov rdx, qword ptr [rbp + 0x280]
0x14002cb7c: call 0x145eb6fcb
0x14002cb81: nop
0x14002cb82: jmp 0x14002cfa9
0x14002cb87: cmp byte ptr [rsi], 1
0x14002cb8a: jne 0x14002cbab
0x14002cb8c: mov eax, dword ptr [rsi + 1]
0x14002cb8f: mov ecx, dword ptr [rsi + 4]
0x14002cb92: mov dword ptr [rbp + 0x27b], ecx
0x14002cb98: mov dword ptr [rbp + 0x278], eax
0x14002cb9e: mov rcx, qword ptr [rsi + 8]
0x14002cba2: movzx edx, byte ptr [rsi + 0x10]
0x14002cba6: mov r8b, 1
0x14002cba9: jmp 0x14002cbbc
0x14002cbab: mov rcx, qword ptr [rsi + 8]
0x14002cbaf: lock inc qword ptr [rcx]
0x14002cbb3: jle 0x14002cfa9
0x14002cbb9: xor r8d, r8d
0x14002cbbc: movups xmm0, xmmword ptr [rip + 0x5eb4b7d]
0x14002cbc3: movups xmmword ptr [rbp + 0x21c], xmm0
0x14002cbca: mov dword ptr [rbp + 0x22c], 0x3f800000
0x14002cbd4: movups xmm0, xmmword ptr [rip + 0x5eb437d]
0x14002cbdb: movaps xmmword ptr [rbp - 0x50], xmm0
0x14002cbdf: mov qword ptr [rbp - 0x40], 0
0x14002cbe7: movups xmm0, xmmword ptr [rip + 0x5eb4382]
0x14002cbee: movups xmmword ptr [rbp - 0x38], xmm0
0x14002cbf2: mov qword ptr [rbp - 0x28], 0
0x14002cbfa: movups xmm0, xmmword ptr [rip + 0x5eb4387]
0x14002cc01: movaps xmmword ptr [rbp - 0x20], xmm0
0x14002cc05: mov qword ptr [rbp - 0x10], 0
0x14002cc0d: movups xmm0, xmmword ptr [rip + 0x5eb438c]
0x14002cc14: movups xmmword ptr [rbp - 8], xmm0
0x14002cc18: mov qword ptr [rbp + 8], 0
0x14002cc20: mov rax, qword ptr [rdi]
0x14002cc23: add rdi, 8
0x14002cc27: mov qword ptr [rbp + 0x18], 0
0x14002cc2f: mov qword ptr [rbp + 0x20], 1
0x14002cc37: xorps xmm0, xmm0
0x14002cc3a: movups xmmword ptr [rbp + 0x28], xmm0
0x14002cc3e: mov qword ptr [rbp + 0x38], 4
0x14002cc46: mov qword ptr [rbp + 0x40], 0
0x14002cc4e: mov byte ptr [rbp + 0x48], r8b
0x14002cc52: mov r8d, dword ptr [rbp + 0x278]
0x14002cc59: mov r9d, dword ptr [rbp + 0x27b]
0x14002cc60: mov dword ptr [rbp + 0x49], r8d
0x14002cc64: mov dword ptr [rbp + 0x4c], r9d
0x14002cc68: mov qword ptr [rbp + 0x50], rcx
0x14002cc6c: mov qword ptr [rbp + 0x58], rdx
0x14002cc70: mov dword ptr [rbp + 0x60], 0x41500000
0x14002cc77: mov word ptr [rbp + 0x64], 0x190
0x14002cc7d: mov byte ptr [rbp + 0x66], 1
0x14002cc81: movups xmm1, xmmword ptr [rbp + 0x21b]
0x14002cc88: movups xmmword ptr [rbp + 0x67], xmm1
0x14002cc8c: mov rcx, qword ptr [rbp + 0x228]
0x14002cc93: mov qword ptr [rbp + 0x74], rcx
0x14002cc97: mov ecx, dword ptr [rip + 0x5ee8643]
0x14002cc9d: mov dword ptr [rbp + 0x8c], ecx
0x14002cca3: movups xmm1, xmmword ptr [rip + 0x5ee8626]
0x14002ccaa: movups xmmword ptr [rbp + 0x7c], xmm1
0x14002ccae: movsd xmm1, qword ptr [rip + 0x5eb32ba]
0x14002ccb6: movsd qword ptr [rbp + 0x90], xmm1
0x14002ccbe: movaps xmm1, xmmword ptr [rbp]
0x14002ccc2: movups xmmword ptr [rbp + 0xe8], xmm1
0x14002ccc9: movaps xmm1, xmmword ptr [rbp - 0x10]
0x14002cccd: movups xmmword ptr [rbp + 0xd8], xmm1
0x14002ccd4: movaps xmm1, xmmword ptr [rbp - 0x50]
0x14002ccd8: movaps xmm2, xmmword ptr [rbp - 0x40]
0x14002ccdc: movaps xmm3, xmmword ptr [rbp - 0x30]
0x14002cce0: movaps xmm4, xmmword ptr [rbp - 0x20]
0x14002cce4: movups xmmword ptr [rbp + 0xc8], xmm4
0x14002cceb: movups xmmword ptr [rbp + 0xb8], xmm3
0x14002ccf2: movups xmmword ptr [rbp + 0xa8], xmm2
0x14002ccf9: movups xmmword ptr [rbp + 0x98], xmm1
0x14002cd00: movups xmmword ptr [rbp + 0x108], xmm0
0x14002cd07: movups xmmword ptr [rbp + 0xf8], xmm0
0x14002cd0e: mov qword ptr [rbp + 0x118], 0
0x14002cd19: movabs rcx, 0x42c8000000000002
0x14002cd23: mov qword ptr [rbp + 0x120], rcx
0x14002cd2a: movups xmmword ptr [rbp + 0x138], xmm0
0x14002cd31: movups xmmword ptr [rbp + 0x128], xmm0
0x14002cd38: mov qword ptr [rbp + 0x148], 0
0x14002cd43: movups xmm0, xmmword ptr [rip + 0x5eb42d6]
0x14002cd4a: movups xmmword ptr [rbp + 0x160], xmm0
0x14002cd51: movups xmm0, xmmword ptr [rip + 0x5eb42b8]
0x14002cd58: movups xmmword ptr [rbp + 0x150], xmm0
0x14002cd5f: movups xmm0, xmmword ptr [rip + 0x5eb42da]
0x14002cd66: movups xmmword ptr [rbp + 0x180], xmm0
0x14002cd6d: movups xmm0, xmmword ptr [rip + 0x5eb42bc]
0x14002cd74: movups xmmword ptr [rbp + 0x170], xmm0
0x14002cd7b: movups xmm0, xmmword ptr [rip + 0x5eb42de]
0x14002cd82: movups xmmword ptr [rbp + 0x1a0], xmm0
0x14002cd89: movups xmm0, xmmword ptr [rip + 0x5eb42c0]
0x14002cd90: movups xmmword ptr [rbp + 0x190], xmm0
0x14002cd97: movups xmm0, xmmword ptr [rip + 0x5eb42e2]
0x14002cd9e: movups xmmword ptr [rbp + 0x1c0], xmm0
0x14002cda5: movups xmm0, xmmword ptr [rip + 0x5eb42c4]
0x14002cdac: movups xmmword ptr [rbp + 0x1b0], xmm0
0x14002cdb3: movaps xmm0, xmmword ptr [rip + 0x5eb3146]
0x14002cdba: movups xmmword ptr [rbp + 0x1d0], xmm0
0x14002cdc1: mov dword ptr [rbp + 0x1e0], 1
0x14002cdcb: mov qword ptr [rbp + 0x1e4], 0
0x14002cdd6: mov byte ptr [rbp + 0x1ec], 1
0x14002cddd: mov qword ptr [rbp + 0x1f0], 0
0x14002cde8: mov dword ptr [rbp + 0x1f8], 0x3f800000
0x14002cdf2: mov word ptr [rbp + 0x1fc], 0
0x14002cdfb: mov word ptr [rbp + 0x202], 0
0x14002ce04: mov dword ptr [rbp + 0x1fe], 0x10000
0x14002ce0e: mov word ptr [rbp + 0x208], 0
0x14002ce17: mov dword ptr [rbp + 0x204], 0x10000
0x14002ce21: mov dword ptr [rbp + 0x212], 0
0x14002ce2b: mov qword ptr [rbp + 0x20a], 0
0x14002ce36: mov qword ptr [rbp + 0x10], rax
0x14002ce3a: mov byte ptr [rbp + 0x2b7], 1
0x14002ce41: lea r9, [rip + 0x5eb3cf8]
0x14002ce48: lea rcx, [rbp + 0x230]
0x14002ce4f: lea r8, [rbp + 0x10]
0x14002ce53: mov rdx, rdi
0x14002ce56: call 0x1402cc8f0
0x14002ce5b: nop
0x14002ce5c: mov rax, qword ptr [rbp + 0x2a0]
0x14002ce63: mov qword ptr [rbp + 0x20], rax
0x14002ce67: movups xmm0, xmmword ptr [rbp + 0x290]
0x14002ce6e: movaps xmmword ptr [rbp + 0x10], xmm0
0x14002ce72: mov qword ptr [rbp + 0x28], rsi
0x14002ce76: lea rax, [rbp + 0x274]
0x14002ce7d: mov qword ptr [rbp + 0x30], rax
0x14002ce81: mov byte ptr [rbp + 0x2b7], 0
0x14002ce88: lea rcx, [rbp + 0x230]
0x14002ce8f: lea rdx, [rbp + 0x10]
0x14002ce93: call 0x1402fa330
0x14002ce98: nop
0x14002ce99: movaps xmm6, xmmword ptr [rbp + 0x2c0]
0x14002cea0: add rsp, 0x358
0x14002cea7: pop rbx
0x14002cea8: pop rdi
0x14002cea9: pop rsi
0x14002ceaa: pop r12
0x14002ceac: pop r13
0x14002ceae: pop r14
0x14002ceb0: pop r15
0x14002ceb2: pop rbp
0x14002ceb3: ret
0x14002ceb4: mov byte ptr [rbp + 0x2b7], 1
0x14002cebb: lea rax, [rip + 0x5eb4c66]
0x14002cec2: mov qword ptr [rsp + 0x20], rax
0x14002cec7: mov r8d, 2
0x14002cecd: mov r9d, 8
0x14002ced3: mov rcx, r14
0x14002ced6: mov rdx, r15
0x14002ced9: call 0x145eb71e0
0x14002cede: nop
0x14002cedf: jmp 0x14002cfa9
0x14002cee4: mov byte ptr [rbp + 0x2b7], 1
0x14002ceeb: lea rax, [rip + 0x5eb4c06]
0x14002cef2: mov qword ptr [rsp + 0x20], rax
0x14002cef7: mov rcx, rbx
0x14002cefa: mov rdx, r12
0x14002cefd: xor r8d, r8d
0x14002cf00: mov r9, r13
0x14002cf03: call 0x145eb71e0
0x14002cf08: nop
0x14002cf09: jmp 0x14002cfa9
0x14002cf0e: mov byte ptr [rbp + 0x2b7], 1
0x14002cf15: lea rax, [rip + 0x5eb4bf4]
0x14002cf1c: mov qword ptr [rsp + 0x20], rax
0x14002cf21: mov rcx, rbx
0x14002cf24: mov rdx, r12
0x14002cf27: mov r9, r12
0x14002cf2a: call 0x145eb71e0
0x14002cf2f: nop
0x14002cf30: jmp 0x14002cfa9
0x14002cf32: mov qword ptr [rbp + 0x280], r13
0x14002cf39: jmp 0x14002cb6b
0x14002cf3e: mov byte ptr [rbp + 0x2b7], 1
0x14002cf45: mov ecx, 1
0x14002cf4a: mov edx, 1
0x14002cf4f: call 0x145eb6fcb
0x14002cf54: nop
0x14002cf55: jmp 0x14002cfa9
0x14002cf57: mov byte ptr [rbp + 0x2b7], 1
0x14002cf5e: lea rax, [rip + 0x5eb4bf3]
0x14002cf65: mov qword ptr [rsp + 0x20], rax
0x14002cf6a: mov r8d, 1
0x14002cf70: mov rcx, rbx
0x14002cf73: mov rdx, r13
0x14002cf76: mov r9, r13
0x14002cf79: call 0x145eb71e0
0x14002cf7e: nop
0x14002cf7f: jmp 0x14002cfa9
0x14002cf81: mov byte ptr [rbp + 0x2b7], 1
0x14002cf88: lea rax, [rip + 0x5eb4bb1]
0x14002cf8f: mov qword ptr [rsp + 0x20], rax
0x14002cf94: mov r8d, 8
0x14002cf9a: mov rcx, r14
0x14002cf9d: mov rdx, r15
0x14002cfa0: mov r9, r15
0x14002cfa3: call 0x145eb71e0
0x14002cfa8: nop
0x14002cfa9: ud2

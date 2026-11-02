; Complements ../coop-ui/input.asm; full owner/hash belongs to its manifest.
0x14021a72e: mov ebx, dword ptr [rbp + 0x278]
0x14021a734: mov dword ptr [rdi], ebx
0x14021a736: mov rcx, r15
0x14021a739: mov rdx, qword ptr [rbp + 0x250]
0x14021a740: mov r8, qword ptr [rbp + 0x1b8]
0x14021a747: mov r9b, 1
0x14021a74a: call 0x14020f670
0x14021a74f: jmp 0x14021ae00
0x14021a7b0: mov rax, qword ptr [r9 + 8]
0x14021a7b4: cmp rax, qword ptr [r15 + 0x70]
0x14021a7b8: mov r11, qword ptr [rbp + 0x270]
0x14021a7bf: jae 0x14021a2f0
0x14021a7c5: mov rdi, qword ptr [r15 + 0x68]
0x14021a7c9: imul rbx, rax, 0xf0
0x14021a7d0: lea r14, [rdi + rbx]
0x14021a7d4: lea rcx, [rbp + 0xe8]
0x14021a7db: mov rdx, r14
0x14021a7de: call 0x145ce7810
0x14021a7e3: lea rdx, [rdi + rbx]
0x14021a7e7: add rdx, 0x18
0x14021a7eb: lea rcx, [rbp + 0xd0]
0x14021a7f2: call 0x145ce7810
0x14021a7f7: nop
0x14021a7f8: lea rdx, [r14 + 0x30]
0x14021a7fc: lea rcx, [rbp + 0xb8]
0x14021a803: call 0x145ce7810
0x14021a808: nop
0x14021a809: mov rdi, qword ptr [r14 + 0x58]
0x14021a80d: test rdi, rdi
0x14021a810: js 0x14021b402
0x14021a816: mov qword ptr [rbp + 0x258], rdi
0x14021a81d: je 0x14021ae1c
0x14021a823: mov rbx, qword ptr [r14 + 0x50]
0x14021a827: call 0x140002200
0x14021a82c: mov r12d, 1
0x14021a832: mov edx, 1
0x14021a837: mov rcx, rdi
0x14021a83a: call 0x1400021c0
0x14021a83f: test rax, rax
0x14021a842: je 0x14021b405
0x14021a848: mov qword ptr [rbp + 0x208], rax
0x14021a84f: mov rcx, rax
0x14021a852: mov rdx, rbx
0x14021a855: mov r8, rdi
0x14021a858: call 0x145d145fb
0x14021a85d: mov r12, qword ptr [rbp + 0x200]
0x14021a864: jmp 0x14021ae28
0x14021a89c: mov rax, qword ptr [rbp + 0x110]
0x14021a8a3: movss xmm0, dword ptr [rax + 0x5c]
0x14021a8a8: mov ebx, dword ptr [rbp + 0x278]
0x14021a8ae: jmp 0x14021aced
0x14021a8b3: mov ebx, dword ptr [rbp + 0x278]
0x14021a8b9: mov dword ptr [rdi], ebx
0x14021a8bb: mov rcx, r15
0x14021a8be: mov rdx, qword ptr [rbp + 0x250]
0x14021a8c5: mov r8, qword ptr [rbp + 0x1b8]
0x14021a8cc: mov r9b, 2
0x14021a8cf: call 0x14020f670
0x14021a8d4: jmp 0x14021ae00
0x14021aa48: mov dword ptr [rbp - 0x58], 0x17
0x14021aa4f: mov rcx, qword ptr [rbp + 0x250]
0x14021aa56: lea rdx, [rbp - 0x58]
0x14021aa5a: call 0x14012c6a0
0x14021aa5f: mov r14d, dword ptr [rbp + 0x278]
0x14021aa66: mov dword ptr [rdi], r14d
0x14021aa69: mov qword ptr [r15 + 0x40], 0
0x14021aa71: call 0x140002200
0x14021aa76: mov ecx, 3
0x14021aa7b: mov edx, 1
0x14021aa80: call 0x1400021c0
0x14021aa85: test rax, rax
0x14021aa88: je 0x14021b413
0x14021aa8e: mov rbx, rax
0x14021aa91: mov byte ptr [rax + 2], 0x66
0x14021aa95: mov word ptr [rax], 0x666f
0x14021aa9a: mov dword ptr [rdi], r14d
0x14021aa9d: mov rdx, qword ptr [r15]
0x14021aaa0: test rdx, rdx
0x14021aaa3: je 0x14021aab4
0x14021aaa5: mov rcx, qword ptr [r15 + 8]
0x14021aaa9: mov r8d, 1
0x14021aaaf: call 0x1400021d0
0x14021aab4: mov qword ptr [r15], 3
0x14021aabb: mov qword ptr [r15 + 8], rbx
0x14021aabf: mov qword ptr [r15 + 0x10], 3
0x14021aac7: mov eax, dword ptr [rbp + 0x278]
0x14021aacd: mov dword ptr [rdi], eax
0x14021aacf: mov rdi, qword ptr [r15 + 0x80]
0x14021aad6: mov rbx, qword ptr [r15 + 0x88]
0x14021aadd: mov qword ptr [r15 + 0x88], 0
0x14021aae8: test rbx, rbx
0x14021aaeb: je 0x14021aba0
0x14021aaf1: add rdi, 0x50
0x14021aaf5: jmp 0x14021ab0d
0x14021aaf7: nop word ptr [rax + rax]
0x14021ab00: add rdi, 0x70
0x14021ab04: dec rbx
0x14021ab07: je 0x14021aba0
0x14021ab0d: mov rdx, qword ptr [rdi - 0x50]
0x14021ab11: test rdx, rdx
0x14021ab14: je 0x14021ab25
0x14021ab16: mov rcx, qword ptr [rdi - 0x48]
0x14021ab1a: mov r8d, 1
0x14021ab20: call 0x1400021d0
0x14021ab25: mov rdx, qword ptr [rdi - 0x38]
0x14021ab29: test rdx, rdx
0x14021ab2c: je 0x14021ab3d
0x14021ab2e: mov rcx, qword ptr [rdi - 0x30]
0x14021ab32: mov r8d, 1
0x14021ab38: call 0x1400021d0
0x14021ab3d: mov rdx, qword ptr [rdi - 0x20]
0x14021ab41: test rdx, rdx
0x14021ab44: je 0x14021ab55
0x14021ab46: mov rcx, qword ptr [rdi - 0x18]
0x14021ab4a: mov r8d, 1
0x14021ab50: call 0x1400021d0
0x14021ab55: mov rdx, qword ptr [rdi - 8]
0x14021ab59: test rdx, rdx
0x14021ab5c: je 0x14021ab00
0x14021ab5e: mov rcx, qword ptr [rdi]
0x14021ab61: mov r8d, 1
0x14021ab67: call 0x1400021d0
0x14021ab6c: jmp 0x14021ab00
0x14021ab87: movzx eax, byte ptr [r9 + 1]
0x14021ab8c: mov ebx, dword ptr [rbp + 0x278]
0x14021ab92: mov dword ptr [rdi], ebx
0x14021ab94: mov byte ptr [r15 + 0x132], al
0x14021ae1c: mov eax, 1
0x14021ae21: mov qword ptr [rbp + 0x208], rax
0x14021ae28: lea rdx, [r14 + 0x60]
0x14021ae2c: lea rcx, [rbp + 0xa0]
0x14021ae33: call 0x145ce7810
0x14021ae38: nop
0x14021ae39: lea rdx, [r14 + 0x78]
0x14021ae3d: lea rcx, [rbp + 0x128]
0x14021ae44: call 0x145ce7810
0x14021ae49: nop
0x14021ae4a: lea rdx, [r14 + 0x90]
0x14021ae51: lea rcx, [rbp + 0x1e0]
0x14021ae58: call 0x145ce7810
0x14021ae5d: nop
0x14021ae5e: mov dil, byte ptr [r14 + 0xe8]
0x14021ae65: mov bl, byte ptr [r14 + 0xe9]
0x14021ae6c: lea rdx, [r14 + 0xa8]
0x14021ae73: lea rcx, [rbp + 0x180]
0x14021ae7a: call 0x145ce7810
0x14021ae7f: nop
0x14021ae80: add r14, 0xc0
0x14021ae87: lea rcx, [rbp - 0x58]
0x14021ae8b: mov rdx, r14
0x14021ae8e: call 0x145ce7810
0x14021ae93: nop
0x14021ae94: mov r9, qword ptr [rbp + 0xe8]
0x14021ae9b: mov r10, qword ptr [rbp + 0xf0]
0x14021aea2: mov rax, qword ptr [rbp + 0xd0]
0x14021aea9: mov qword ptr [rbp + 0x1d8], rax
0x14021aeb0: mov rax, qword ptr [rbp + 0xd8]
0x14021aeb7: mov qword ptr [rbp + 0x178], rax
0x14021aebe: mov rax, qword ptr [rbp + 0xb8]
0x14021aec5: mov qword ptr [rbp + 0x1d0], rax
0x14021aecc: mov rax, qword ptr [rbp + 0xc0]
0x14021aed3: mov qword ptr [rbp + 0x170], rax
0x14021aeda: mov rax, qword ptr [rbp + 0xa0]
0x14021aee1: mov qword ptr [rbp + 0x1c8], rax
0x14021aee8: mov rax, qword ptr [rbp + 0xa8]
0x14021aeef: mov qword ptr [rbp + 0x168], rax
0x14021aef6: mov rax, qword ptr [rbp + 0x128]
0x14021aefd: mov qword ptr [rbp + 0x1c0], rax
0x14021af04: mov rax, qword ptr [rbp + 0x130]
0x14021af0b: mov qword ptr [rbp + 0x160], rax
0x14021af12: mov rax, qword ptr [rbp + 0x1e0]
0x14021af19: mov qword ptr [rbp + 0x230], rax
0x14021af20: mov rax, qword ptr [rbp + 0x1e8]
0x14021af27: mov qword ptr [rbp + 0x158], rax
0x14021af2e: mov rcx, qword ptr [rbp + 0x180]
0x14021af35: mov rdx, qword ptr [rbp + 0x188]
0x14021af3c: mov rax, qword ptr [rbp - 0x58]
0x14021af40: mov qword ptr [rbp + 0x218], rax
0x14021af47: mov r14, qword ptr [rbp - 0x50]
0x14021af4b: test dil, dil
0x14021af4e: mov qword ptr [rbp + 0x220], rcx
0x14021af55: mov qword ptr [rbp + 0x150], rdx
0x14021af5c: je 0x14021aff1
0x14021af62: mov qword ptr [rbp + 0x118], r14
0x14021af69: mov r14, qword ptr [rbp + 0xf8]
0x14021af70: test bl, bl
0x14021af72: mov rdi, qword ptr [rbp + 0x260]
0x14021af79: je 0x14021b12b
0x14021af7f: mov byte ptr [r15 + 0x131], 2
0x14021af87: mov eax, dword ptr [rbp + 0x278]
0x14021af8d: mov dword ptr [rdi], eax
0x14021af8f: mov rdx, qword ptr [r15 + 0xd8]
0x14021af96: test rdx, rdx
0x14021af99: je 0x14021afc7
0x14021af9b: mov rcx, qword ptr [r15 + 0xe0]
0x14021afa2: mov r8d, 1
0x14021afa8: mov rbx, r9
0x14021afab: mov qword ptr [rbp + 0x210], r14
0x14021afb2: mov r14, r10
0x14021afb5: call 0x1400021d0
0x14021afba: mov r10, r14
0x14021afbd: mov r14, qword ptr [rbp + 0x210]
0x14021afc4: mov r9, rbx
0x14021afc7: mov qword ptr [r15 + 0xd8], r9
0x14021afce: mov qword ptr [r15 + 0xe0], r10
0x14021afd5: mov qword ptr [r15 + 0xe8], r14
0x14021afdc: mov eax, dword ptr [rbp + 0x278]
0x14021afe2: mov dword ptr [rdi], eax
0x14021afe4: mov byte ptr [r15 + 0x132], 5
0x14021afec: jmp 0x14021b2e8
0x14021aff1: test r9, r9
0x14021aff4: mov rdi, qword ptr [rbp + 0x260]
0x14021affb: je 0x14021b00e
0x14021affd: mov r8d, 1
0x14021b003: mov rcx, r10
0x14021b006: mov rdx, r9
0x14021b009: call 0x1400021d0
0x14021b00e: mov rdx, qword ptr [rbp + 0x1d8]
0x14021b015: test rdx, rdx
0x14021b018: mov rbx, qword ptr [rbp + 0x140]
0x14021b01f: je 0x14021b033
0x14021b021: mov r8d, 1
0x14021b027: mov rcx, qword ptr [rbp + 0x178]
0x14021b02e: call 0x1400021d0
0x14021b033: mov rdx, qword ptr [rbp + 0x1d0]
0x14021b03a: test rdx, rdx
0x14021b03d: je 0x14021b051
0x14021b03f: mov r8d, 1
0x14021b045: mov rcx, qword ptr [rbp + 0x170]
0x14021b04c: call 0x1400021d0
0x14021b051: mov rdx, qword ptr [rbp + 0x258]
0x14021b058: test rdx, rdx
0x14021b05b: je 0x14021b06f
0x14021b05d: mov r8d, 1
0x14021b063: mov rcx, qword ptr [rbp + 0x208]
0x14021b06a: call 0x1400021d0
0x14021b06f: mov rdx, qword ptr [rbp + 0x1c8]
0x14021b076: test rdx, rdx
0x14021b079: je 0x14021b08d
0x14021b07b: mov r8d, 1
0x14021b081: mov rcx, qword ptr [rbp + 0x168]
0x14021b088: call 0x1400021d0
0x14021b08d: mov rdx, qword ptr [rbp + 0x1c0]
0x14021b094: test rdx, rdx
0x14021b097: je 0x14021b0ab
0x14021b099: mov r8d, 1
0x14021b09f: mov rcx, qword ptr [rbp + 0x160]
0x14021b0a6: call 0x1400021d0
0x14021b0ab: mov rdx, qword ptr [rbp + 0x230]
0x14021b0b2: test rdx, rdx
0x14021b0b5: je 0x14021b0c9
0x14021b0b7: mov r8d, 1
0x14021b0bd: mov rcx, qword ptr [rbp + 0x158]
0x14021b0c4: call 0x1400021d0
0x14021b0c9: mov rdx, qword ptr [rbp + 0x220]
0x14021b0d0: test rdx, rdx
0x14021b0d3: je 0x14021b0e7
0x14021b0d5: mov r8d, 1
0x14021b0db: mov rcx, qword ptr [rbp + 0x150]
0x14021b0e2: call 0x1400021d0
0x14021b0e7: mov rdx, qword ptr [rbp + 0x218]
0x14021b0ee: test rdx, rdx
0x14021b0f1: mov r11, qword ptr [rbp + 0x270]
0x14021b0f8: je 0x14021a2f0
0x14021b0fe: mov r8d, 1
0x14021b104: mov rcx, r14
0x14021b107: call 0x1400021d0
0x14021b10c: mov r11, qword ptr [rbp + 0x270]
0x14021b113: jmp 0x14021a2f0
0x14021b12b: mov qword ptr [rbp + 0x120], r10
0x14021b132: mov qword ptr [rbp + 0x210], r9
0x14021b139: call 0x140002200
0x14021b13e: mov ecx, 7
0x14021b143: mov edx, 1
0x14021b148: call 0x1400021c0
0x14021b14d: test rax, rax
0x14021b150: je 0x14021b424
0x14021b156: mov rbx, rax
0x14021b159: mov dword ptr [rax + 3], 0x676e696e
0x14021b160: mov dword ptr [rax], 0x6e696f6a
0x14021b166: mov eax, dword ptr [rbp + 0x278]
0x14021b16c: mov dword ptr [rdi], eax
0x14021b16e: mov rdx, qword ptr [r15]
0x14021b171: test rdx, rdx
0x14021b174: je 0x14021b185
0x14021b176: mov rcx, qword ptr [r15 + 8]
0x14021b17a: mov r8d, 1
0x14021b180: call 0x1400021d0
0x14021b185: mov qword ptr [r15], 7
0x14021b18c: mov qword ptr [r15 + 8], rbx
0x14021b190: mov qword ptr [r15 + 0x10], 7
0x14021b198: mov rdx, qword ptr [rbp + 0x1b8]
0x14021b19f: mov bl, byte ptr [rdx + 0x38]
0x14021b1a2: mov dil, byte ptr [rdx + 0x39]
0x14021b1a6: mov r15b, byte ptr [rdx + 0x3a]
0x14021b1aa: mov byte ptr [rbp + 0x27f], 0
0x14021b1b1: lea rcx, [rbp + 0x128]
0x14021b1b8: call 0x145ce7810
0x14021b1bd: nop
0x14021b1be: lea rcx, [rbp + 0x1e0]
0x14021b1c5: mov rdx, qword ptr [rbp + 0x100]
0x14021b1cc: call 0x145ce7810
0x14021b1d1: nop
0x14021b1d2: mov rdx, qword ptr [rbp + 0x108]
0x14021b1d9: movzx eax, byte ptr [rdx + 4]
0x14021b1dd: lea r8, [rbp - 0x50]
0x14021b1e1: mov byte ptr [r8 + 0x3f], al
0x14021b1e5: mov eax, dword ptr [rdx]
0x14021b1e7: mov dword ptr [r8 + 0x3b], eax
0x14021b1eb: mov rax, qword ptr [rbp + 0x1b8]
0x14021b1f2: mov rax, qword ptr [rax + 0x30]
0x14021b1f6: mov rcx, qword ptr [rbp + 0x138]
0x14021b1fd: mov qword ptr [rbp + 0x190], rcx
0x14021b204: movups xmm0, xmmword ptr [rbp + 0x128]
0x14021b20b: movaps xmmword ptr [rbp + 0x180], xmm0
0x14021b212: mov rcx, qword ptr [rbp + 0x1f0]
0x14021b219: lea rdx, [rbp + 0x198]
0x14021b220: mov qword ptr [rdx + 0x10], rcx
0x14021b224: movups xmm0, xmmword ptr [rbp + 0x1e0]
0x14021b22b: movups xmmword ptr [rdx], xmm0
0x14021b22e: movaps xmm0, xmmword ptr [rbp + 0x180]
0x14021b235: mov rcx, qword ptr [rbp + 0x190]
0x14021b23c: mov rdx, qword ptr [rbp + 0x198]
0x14021b243: movaps xmm1, xmmword ptr [rbp + 0x1a0]
0x14021b24a: movups xmmword ptr [r8 + 0x20], xmm1
0x14021b24f: mov qword ptr [r8 + 0x10], rcx
0x14021b253: mov qword ptr [r8 + 0x18], rdx
0x14021b257: movups xmmword ptr [r8], xmm0
0x14021b25b: mov qword ptr [rbp - 0x20], rax
0x14021b25f: mov byte ptr [rbp - 0x18], bl
0x14021b262: mov byte ptr [rbp - 0x17], dil
0x14021b266: mov byte ptr [rbp - 0x16], r15b
0x14021b26a: mov dword ptr [rbp - 0x58], 0xc
0x14021b271: mov byte ptr [rbp + 0x27f], 0
0x14021b278: mov rcx, qword ptr [rbp + 0x250]
0x14021b27f: lea rdx, [rbp - 0x58]
0x14021b283: call 0x14012c6a0
0x14021b288: nop
0x14021b289: mov rax, qword ptr [rbp + 0x210]
0x14021b290: mov qword ptr [rbp - 0x50], rax
0x14021b294: mov rax, qword ptr [rbp + 0x120]
0x14021b29b: mov qword ptr [rbp - 0x48], rax
0x14021b29f: mov qword ptr [rbp - 0x40], r14
0x14021b2a3: mov qword ptr [rbp - 0x38], 0
0x14021b2ab: mov qword ptr [rbp - 0x30], 1
0x14021b2b3: mov qword ptr [rbp - 0x28], 0
0x14021b2bb: mov dword ptr [rbp - 0x58], 0x16
0x14021b2c2: mov byte ptr [rbp + 0x27f], 1
0x14021b2c9: mov rcx, qword ptr [rbp + 0x250]
0x14021b2d0: lea rdx, [rbp - 0x58]
0x14021b2d4: call 0x14012c6a0
0x14021b2d9: nop
0x14021b2da: mov r15, qword ptr [rbp + 0x228]
0x14021b2e1: mov rdi, qword ptr [rbp + 0x260]
0x14021b2e8: mov rdx, qword ptr [rbp + 0x1d8]
0x14021b2ef: test rdx, rdx
0x14021b2f2: je 0x14021b306
0x14021b2f4: mov r8d, 1
0x14021b2fa: mov rcx, qword ptr [rbp + 0x178]
0x14021b301: call 0x1400021d0
0x14021b306: mov rdx, qword ptr [rbp + 0x1d0]
0x14021b30d: test rdx, rdx
0x14021b310: je 0x14021b324
0x14021b312: mov r8d, 1
0x14021b318: mov rcx, qword ptr [rbp + 0x170]
0x14021b31f: call 0x1400021d0
0x14021b324: mov rdx, qword ptr [rbp + 0x258]
0x14021b32b: test rdx, rdx
0x14021b32e: je 0x14021b342
0x14021b330: mov r8d, 1
0x14021b336: mov rcx, qword ptr [rbp + 0x208]
0x14021b33d: call 0x1400021d0
0x14021b342: mov rdx, qword ptr [rbp + 0x1c8]
0x14021b349: test rdx, rdx
0x14021b34c: je 0x14021b360
0x14021b34e: mov r8d, 1
0x14021b354: mov rcx, qword ptr [rbp + 0x168]
0x14021b35b: call 0x1400021d0
0x14021b360: mov rdx, qword ptr [rbp + 0x1c0]
0x14021b367: test rdx, rdx
0x14021b36a: je 0x14021b37e
0x14021b36c: mov r8d, 1
0x14021b372: mov rcx, qword ptr [rbp + 0x160]
0x14021b379: call 0x1400021d0
0x14021b37e: mov rdx, qword ptr [rbp + 0x230]
0x14021b385: test rdx, rdx
0x14021b388: je 0x14021b39c
0x14021b38a: mov r8d, 1
0x14021b390: mov rcx, qword ptr [rbp + 0x158]
0x14021b397: call 0x1400021d0
0x14021b39c: mov rdx, qword ptr [rbp + 0x220]
0x14021b3a3: test rdx, rdx
0x14021b3a6: je 0x14021b3ba
0x14021b3a8: mov r8d, 1
0x14021b3ae: mov rcx, qword ptr [rbp + 0x150]
0x14021b3b5: call 0x1400021d0
0x14021b3ba: mov rdx, qword ptr [rbp + 0x218]
0x14021b3c1: test rdx, rdx
0x14021b3c4: mov ebx, dword ptr [rbp + 0x278]
0x14021b3ca: mov r11, qword ptr [rbp + 0x270]
0x14021b3d1: je 0x14021ae07
0x14021b3d7: mov r8d, 1

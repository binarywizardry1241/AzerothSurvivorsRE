;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1401ca600..0x1401cac22 SHA256 54c7ae5954649c0a819b163463eb9958f3a90d45172ae8c8e86b900d0ee3aa8d
0x1401ca600: push r15
0x1401ca602: push r14
0x1401ca604: push r13
0x1401ca606: push r12
0x1401ca608: push rsi
0x1401ca609: push rdi
0x1401ca60a: push rbp
0x1401ca60b: push rbx
0x1401ca60c: sub rsp, 0x2d8
0x1401ca613: mov rax, qword ptr [rsp + 0x340]
0x1401ca61b: mov rcx, qword ptr [rdx + 0x20]
0x1401ca61f: mov qword ptr [rsp + 0xd0], rcx
0x1401ca627: movups xmm0, xmmword ptr [rdx]
0x1401ca62a: movups xmm1, xmmword ptr [rdx + 0x10]
0x1401ca62e: movaps xmmword ptr [rsp + 0xc0], xmm1
0x1401ca636: movaps xmmword ptr [rsp + 0xb0], xmm0
0x1401ca63e: movups xmm0, xmmword ptr [r8]
0x1401ca642: movups xmm1, xmmword ptr [r8 + 0x10]
0x1401ca647: movups xmmword ptr [rsp + 0xe8], xmm1
0x1401ca64f: movups xmmword ptr [rsp + 0xd8], xmm0
0x1401ca657: movups xmm0, xmmword ptr [r9]
0x1401ca65b: movups xmm1, xmmword ptr [r9 + 0x10]
0x1401ca660: movups xmmword ptr [rsp + 0x108], xmm1
0x1401ca668: movups xmmword ptr [rsp + 0xf8], xmm0
0x1401ca670: mov rcx, qword ptr [rax + 0x10]
0x1401ca674: mov qword ptr [rsp + 0x128], rcx
0x1401ca67c: movups xmm0, xmmword ptr [rax]
0x1401ca67f: movups xmmword ptr [rsp + 0x118], xmm0
0x1401ca687: mov rbx, qword ptr [rsp + 0xf8]
0x1401ca68f: cmp byte ptr [rbx], 0
0x1401ca692: je 0x1401ca6bf
0x1401ca694: mov rax, qword ptr [rsp + 0xd8]
0x1401ca69c: cmp byte ptr [rax + 0xd], 0
0x1401ca6a0: je 0x1401ca6ab
0x1401ca6a2: cmp dword ptr [rax], 0
0x1401ca6a5: je 0x1401cac1b
0x1401ca6ab: mov eax, dword ptr [rsp + 0x114]
0x1401ca6b2: mov rcx, qword ptr [rsp + 0x108]
0x1401ca6ba: mov dword ptr [rcx], eax
0x1401ca6bc: mov byte ptr [rbx], 0
0x1401ca6bf: xor eax, eax
0x1401ca6c1: mov rcx, qword ptr [rsp + 0x118]
0x1401ca6c9: mov r14, qword ptr [rsp + 0x120]
0x1401ca6d1: mov r15, qword ptr [rcx + 0xf8]
0x1401ca6d8: mov rdx, qword ptr [rcx + 0x100]
0x1401ca6df: movzx ecx, byte ptr [rcx + 0x108]
0x1401ca6e6: lea r8, [rdx*4]
0x1401ca6ee: xor r9d, r9d
0x1401ca6f1: test cl, cl
0x1401ca6f3: je 0x1401ca730
0x1401ca6f5: nop word ptr cs:[rax + rax]
0x1401ca700: cmp r8, r9
0x1401ca703: je 0x1401ca75d
0x1401ca705: mov r10d, dword ptr [r15 + r9]
0x1401ca709: mov r11, qword ptr [r14 + 0x1a8]
0x1401ca710: lea r10, [r10 + r10*8]
0x1401ca714: add r9, 4
0x1401ca718: cmp qword ptr [r11 + r10*8 + 0x10], 0
0x1401ca71e: je 0x1401ca700
0x1401ca720: jmp 0x1401ca754
0x1401ca722: nop word ptr cs:[rax + rax]
0x1401ca730: cmp r8, r9
0x1401ca733: je 0x1401ca75d
0x1401ca735: mov r10d, dword ptr [r15 + r9]
0x1401ca739: mov r11, qword ptr [r14 + 0x108]
0x1401ca740: lea r10, [r10 + r10*4]
0x1401ca744: shl r10, 5
0x1401ca748: add r9, 4
0x1401ca74c: cmp qword ptr [r11 + r10 + 0x58], 0
0x1401ca752: je 0x1401ca730
0x1401ca754: test al, al
0x1401ca756: je 0x1401ca765
0x1401ca758: jmp 0x1401cac07
0x1401ca75d: test al, al
0x1401ca75f: je 0x1401cac07
0x1401ca765: lea r12, [r15 + rdx*4]
0x1401ca769: mov rax, qword ptr [rsp + 0xc0]
0x1401ca771: mov qword ptr [rsp + 0x48], rax
0x1401ca776: mov r11, qword ptr [rsp + 0xd0]
0x1401ca77e: mov r13, qword ptr [rsp + 0xc8]
0x1401ca786: mov r9, qword ptr [rsp + 0xb0]
0x1401ca78e: mov r10, qword ptr [rsp + 0xb8]
0x1401ca796: xor esi, esi
0x1401ca798: mov edi, 8
0x1401ca79d: test cl, cl
0x1401ca79f: je 0x1401ca7b1
0x1401ca7a1: lea rcx, [rsp + 0x130]
0x1401ca7a9: xor ebp, ebp
0x1401ca7ab: cmp ebp, esi
0x1401ca7ad: je 0x1401ca7f0
0x1401ca7af: jmp 0x1401ca7da
0x1401ca7b1: lea rdx, [rip + 0x5c1eaf8]
0x1401ca7b8: xor ebp, ebp
0x1401ca7ba: cmp ebp, esi
0x1401ca7bc: jne 0x1401ca8b9
0x1401ca7c2: jmp 0x1401ca8d0
0x1401ca7c7: nop word ptr [rax + rax]
0x1401ca7d0: lea rax, [rax + rdx*8]
0x1401ca7d4: mov rdi, qword ptr [rax + 8]
0x1401ca7d8: xor ebp, ebp
0x1401ca7da: mov eax, ebp
0x1401ca7dc: inc ebp
0x1401ca7de: mov rax, qword ptr [rdi + rax*8]
0x1401ca7e2: test eax, eax
0x1401ca7e4: jne 0x1401ca817
0x1401ca7e6: cmp ebp, esi
0x1401ca7e8: jne 0x1401ca7da
0x1401ca7ea: nop word ptr [rax + rax]
0x1401ca7f0: cmp r15, r12
0x1401ca7f3: je 0x1401ca98a
0x1401ca7f9: mov edx, dword ptr [r15]
0x1401ca7fc: add r15, 4
0x1401ca800: mov rax, qword ptr [r14 + 0x1a8]
0x1401ca807: lea rdx, [rdx + rdx*8]
0x1401ca80b: mov rsi, qword ptr [rax + rdx*8 + 0x10]
0x1401ca810: test rsi, rsi
0x1401ca813: je 0x1401ca7f0
0x1401ca815: jmp 0x1401ca7d0
0x1401ca817: mov rdx, qword ptr [rsp + 0x48]
0x1401ca81c: test rdx, rdx
0x1401ca81f: mov r8, qword ptr [rsp + 0x20]
0x1401ca824: cmovne r8, r11
0x1401ca828: mov qword ptr [rsp + 0x130], rax
0x1401ca830: mov qword ptr [rsp + 0x138], r9
0x1401ca838: mov qword ptr [rsp + 0x140], r10
0x1401ca840: mov qword ptr [rsp + 0x148], rdx
0x1401ca848: mov qword ptr [rsp + 0x150], r13
0x1401ca850: mov qword ptr [rsp + 0x20], r8
0x1401ca855: mov qword ptr [rsp + 0x158], r8
0x1401ca85d: mov qword ptr [rsp + 0x40], r11
0x1401ca862: lea rdx, [rip + 0x5c1ea47]
0x1401ca869: mov qword ptr [rsp + 0x38], r13
0x1401ca86e: mov qword ptr [rsp + 0x30], r9
0x1401ca873: mov qword ptr [rsp + 0x28], r10
0x1401ca878: call 0x144e7f8d0
0x1401ca87d: lea rcx, [rsp + 0x130]
0x1401ca885: mov r10, qword ptr [rsp + 0x28]
0x1401ca88a: mov r9, qword ptr [rsp + 0x30]
0x1401ca88f: mov r13, qword ptr [rsp + 0x38]
0x1401ca894: mov r11, qword ptr [rsp + 0x40]
0x1401ca899: cmp ebp, esi
0x1401ca89b: je 0x1401ca7f0
0x1401ca8a1: jmp 0x1401ca7da
0x1401ca8a6: nop word ptr cs:[rax + rax]
0x1401ca8b0: add rax, rcx
0x1401ca8b3: mov rdi, qword ptr [rax + 0x50]
0x1401ca8b7: xor ebp, ebp
0x1401ca8b9: mov eax, ebp
0x1401ca8bb: shl rax, 4
0x1401ca8bf: inc ebp
0x1401ca8c1: mov rax, qword ptr [rdi + rax]
0x1401ca8c5: test eax, eax
0x1401ca8c7: jne 0x1401ca8fb
0x1401ca8c9: cmp ebp, esi
0x1401ca8cb: jne 0x1401ca8b9
0x1401ca8cd: nop dword ptr [rax]
0x1401ca8d0: cmp r15, r12
0x1401ca8d3: je 0x1401ca98a
0x1401ca8d9: mov ecx, dword ptr [r15]
0x1401ca8dc: add r15, 4
0x1401ca8e0: mov rax, qword ptr [r14 + 0x108]
0x1401ca8e7: lea rcx, [rcx + rcx*4]
0x1401ca8eb: shl rcx, 5
0x1401ca8ef: mov rsi, qword ptr [rax + rcx + 0x58]
0x1401ca8f4: test rsi, rsi
0x1401ca8f7: je 0x1401ca8d0
0x1401ca8f9: jmp 0x1401ca8b0
0x1401ca8fb: mov r8, qword ptr [rsp + 0x48]
0x1401ca900: test r8, r8
0x1401ca903: mov rcx, qword ptr [rsp + 0x20]
0x1401ca908: cmovne rcx, r11
0x1401ca90c: mov qword ptr [rsp + 0x130], rax
0x1401ca914: mov qword ptr [rsp + 0x138], r9
0x1401ca91c: mov qword ptr [rsp + 0x140], r10
0x1401ca924: mov qword ptr [rsp + 0x148], r8
0x1401ca92c: mov qword ptr [rsp + 0x150], r13
0x1401ca934: mov qword ptr [rsp + 0x20], rcx
0x1401ca939: mov qword ptr [rsp + 0x158], rcx
0x1401ca941: lea rcx, [rsp + 0x130]
0x1401ca949: mov qword ptr [rsp + 0x40], r11
0x1401ca94e: mov qword ptr [rsp + 0x38], r13
0x1401ca953: mov qword ptr [rsp + 0x30], r9
0x1401ca958: mov qword ptr [rsp + 0x28], r10
0x1401ca95d: call 0x144e7f8d0
0x1401ca962: lea rdx, [rip + 0x5c1e947]
0x1401ca969: mov r10, qword ptr [rsp + 0x28]
0x1401ca96e: mov r9, qword ptr [rsp + 0x30]
0x1401ca973: mov r13, qword ptr [rsp + 0x38]
0x1401ca978: mov r11, qword ptr [rsp + 0x40]
0x1401ca97d: cmp ebp, esi
0x1401ca97f: je 0x1401ca8d0
0x1401ca985: jmp 0x1401ca8b9
0x1401ca98a: cmp byte ptr [rbx], 1
0x1401ca98d: jne 0x1401cac07
0x1401ca993: movups xmm0, xmmword ptr [rip + 0x5c1e3fe]
0x1401ca99a: movaps xmmword ptr [rsp + 0x50], xmm0
0x1401ca99f: mov qword ptr [rsp + 0x60], 0
0x1401ca9a8: movups xmm1, xmmword ptr [rip + 0x5c1e401]
0x1401ca9af: movups xmmword ptr [rsp + 0x68], xmm1
0x1401ca9b4: mov qword ptr [rsp + 0x78], 0
0x1401ca9bd: movups xmm1, xmmword ptr [rip + 0x5c1e404]
0x1401ca9c4: movaps xmmword ptr [rsp + 0x80], xmm1
0x1401ca9cc: mov qword ptr [rsp + 0x90], 0
0x1401ca9d8: movups xmm2, xmmword ptr [rip + 0x5c1e401]
0x1401ca9df: movups xmmword ptr [rsp + 0x98], xmm2
0x1401ca9e7: mov qword ptr [rsp + 0xa8], 0
0x1401ca9f3: movaps xmmword ptr [rsp + 0x130], xmm0
0x1401ca9fb: movaps xmmword ptr [rsp + 0x160], xmm1
0x1401caa03: mov rax, qword ptr [rsp + 0x60]
0x1401caa08: mov qword ptr [rsp + 0x140], rax
0x1401caa10: mov rax, qword ptr [rsp + 0x68]
0x1401caa15: mov qword ptr [rsp + 0x148], rax
0x1401caa1d: mov rax, qword ptr [rsp + 0x70]
0x1401caa22: mov qword ptr [rsp + 0x150], rax
0x1401caa2a: mov rax, qword ptr [rsp + 0x78]
0x1401caa2f: mov qword ptr [rsp + 0x158], rax
0x1401caa37: mov rax, qword ptr [rsp + 0x90]
0x1401caa3f: mov qword ptr [rsp + 0x170], rax
0x1401caa47: mov rax, qword ptr [rsp + 0x98]
0x1401caa4f: mov qword ptr [rsp + 0x178], rax
0x1401caa57: movaps xmm0, xmmword ptr [rsp + 0xa0]
0x1401caa5f: movaps xmmword ptr [rsp + 0x180], xmm0
0x1401caa67: xorps xmm0, xmm0
0x1401caa6a: movaps xmmword ptr [rsp + 0x1a0], xmm0
0x1401caa72: movaps xmmword ptr [rsp + 0x190], xmm0
0x1401caa7a: mov qword ptr [rsp + 0x1b0], 0
0x1401caa86: movaps xmm1, xmmword ptr [rip + 0x5bd2c93]
0x1401caa8d: movups xmmword ptr [rsp + 0x1b8], xmm1
0x1401caa95: movups xmmword ptr [rsp + 0x1d8], xmm0
0x1401caa9d: movups xmmword ptr [rsp + 0x1c8], xmm0
0x1401caaa5: movups xmm1, xmmword ptr [rip + 0x5c1e3b4]
0x1401caaac: movups xmmword ptr [rsp + 0x1f8], xmm1
0x1401caab4: movups xmm1, xmmword ptr [rip + 0x5c1e395]
0x1401caabb: movups xmmword ptr [rsp + 0x1e8], xmm1
0x1401caac3: movups xmm1, xmmword ptr [rip + 0x5c1e3b6]
0x1401caaca: movups xmmword ptr [rsp + 0x218], xmm1
0x1401caad2: movups xmm1, xmmword ptr [rip + 0x5c1e397]
0x1401caad9: movups xmmword ptr [rsp + 0x208], xmm1
0x1401caae1: movups xmm1, xmmword ptr [rip + 0x5c1e3b8]
0x1401caae8: movups xmmword ptr [rsp + 0x238], xmm1
0x1401caaf0: movups xmm1, xmmword ptr [rip + 0x5c1e399]
0x1401caaf7: movups xmmword ptr [rsp + 0x228], xmm1
0x1401caaff: movups xmm1, xmmword ptr [rip + 0x5c1e3ba]
0x1401cab06: movups xmmword ptr [rsp + 0x258], xmm1
0x1401cab0e: movups xmm1, xmmword ptr [rip + 0x5c1e39b]
0x1401cab15: movups xmmword ptr [rsp + 0x248], xmm1
0x1401cab1d: movaps xmm1, xmmword ptr [rip + 0x5bd274c]
0x1401cab24: movups xmmword ptr [rsp + 0x268], xmm1
0x1401cab2c: mov dword ptr [rsp + 0x278], 1
0x1401cab37: mov qword ptr [rsp + 0x27c], 0
0x1401cab43: mov byte ptr [rsp + 0x284], 1
0x1401cab4b: mov qword ptr [rsp + 0x288], 0
0x1401cab57: mov dword ptr [rsp + 0x290], 0x3f800000
0x1401cab62: mov word ptr [rsp + 0x294], 0
0x1401cab6c: mov word ptr [rsp + 0x29a], 0
0x1401cab76: mov dword ptr [rsp + 0x296], 0x10000
0x1401cab81: mov word ptr [rsp + 0x2a0], 0
0x1401cab8b: mov dword ptr [rsp + 0x29c], 0x10000
0x1401cab96: mov word ptr [rsp + 0x2a2], 0x100
0x1401caba0: mov word ptr [rsp + 0x2ac], 0
0x1401cabaa: mov qword ptr [rsp + 0x2a4], 0
0x1401cabb6: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x1401cabbe: movabs rax, 0x157c3f400000
0x1401cabc8: mov qword ptr [rsp + 0x2c0], rax
0x1401cabd0: mov word ptr [rsp + 0x2c8], 2
0x1401cabda: lea r9, [rip + 0x5c1e6b7]
0x1401cabe1: lea rsi, [rsp + 0x50]
0x1401cabe6: lea rdx, [rsp + 0xb0]
0x1401cabee: lea r8, [rsp + 0x130]
0x1401cabf6: mov rcx, rsi
0x1401cabf9: call 0x1401f79f0
0x1401cabfe: mov rcx, rsi
0x1401cac01: call 0x140267da0
0x1401cac06: nop
0x1401cac07: add rsp, 0x2d8
0x1401cac0e: pop rbx
0x1401cac0f: pop rbp
0x1401cac10: pop rdi
0x1401cac11: pop rsi
0x1401cac12: pop r12
0x1401cac14: pop r13
0x1401cac16: pop r14
0x1401cac18: pop r15
0x1401cac1a: ret
0x1401cac1b: mov al, 1
0x1401cac1d: jmp 0x1401ca6c1

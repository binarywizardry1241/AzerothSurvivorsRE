;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1401cac30..0x1401cb2ab SHA256 402d04a1f4d91144235944cf9f36899511c411e008fb5ddc267f504c894c94af
0x1401cac30: push rbp
0x1401cac31: push r15
0x1401cac33: push r14
0x1401cac35: push r13
0x1401cac37: push r12
0x1401cac39: push rsi
0x1401cac3a: push rdi
0x1401cac3b: push rbx
0x1401cac3c: sub rsp, 0x1d8
0x1401cac43: lea rbp, [rsp + 0x80]
0x1401cac4b: mov qword ptr [rbp + 0x150], 0xfffffffffffffffe
0x1401cac56: mov rax, qword ptr [rbp + 0x1c0]
0x1401cac5d: mov r14, qword ptr [rdx]
0x1401cac60: mov r15, qword ptr [rdx + 8]
0x1401cac64: mov r10d, dword ptr [rdx + 0x14]
0x1401cac68: mov rcx, qword ptr [r8]
0x1401cac6b: mov qword ptr [rbp + 0x108], rcx
0x1401cac72: mov rcx, qword ptr [r8 + 0x10]
0x1401cac76: mov qword ptr [rbp + 0x110], rcx
0x1401cac7d: mov ecx, dword ptr [r8 + 0x1c]
0x1401cac81: mov dword ptr [rbp + 0x124], ecx
0x1401cac87: mov rcx, qword ptr [r9]
0x1401cac8a: mov r8, qword ptr [r9 + 0x10]
0x1401cac8e: mov qword ptr [rbp + 0x118], r8
0x1401cac95: mov r8d, dword ptr [r9 + 0x1c]
0x1401cac99: mov dword ptr [rbp + 0x144], r8d
0x1401caca0: mov rax, qword ptr [rax]
0x1401caca3: mov qword ptr [rbp + 0x100], rax
0x1401cacaa: mov eax, r10d
0x1401cacad: sub eax, dword ptr [rdx + 0x10]
0x1401cacb0: cmp eax, 0xc233b000
0x1401cacb5: mov r9d, 0xc233b000
0x1401cacbb: cmovb r9d, eax
0x1401cacbf: mov rdi, qword ptr [r14 + 0xf8]
0x1401cacc6: mov rax, qword ptr [r14 + 0x100]
0x1401caccd: cmp byte ptr [r14 + 0x108], 0
0x1401cacd5: lea rsi, [rdi + rax*4]
0x1401cacd9: lea rax, [rcx + 0x30]
0x1401cacdd: mov qword ptr [rbp + 0x128], rax
0x1401cace4: mov qword ptr [rbp + 0xf8], rcx
0x1401caceb: mov rax, qword ptr [rcx + 0x30]
0x1401cacef: mov qword ptr [rbp + 0xf0], rax
0x1401cacf6: mov dword ptr [rbp + 0x13c], r10d
0x1401cacfd: mov dword ptr [rbp + 0x140], r9d
0x1401cad04: je 0x1401caf41
0x1401cad0a: xor eax, eax
0x1401cad0c: xor r13d, r13d
0x1401cad0f: xor ebx, ebx
0x1401cad11: xor r12d, r12d
0x1401cad14: mov qword ptr [rbp + 0x148], 0
0x1401cad1f: jmp 0x1401cad65
0x1401cad21: nop word ptr cs:[rax + rax]
0x1401cad30: xor r12d, r12d
0x1401cad33: mov rdx, qword ptr [r14 + 0x120]
0x1401cad3a: call 0x144e4f270
0x1401cad3f: mov r13, qword ptr [rbx]
0x1401cad42: xor ebx, ebx
0x1401cad44: mov r10d, dword ptr [rbp + 0x13c]
0x1401cad4b: mov r9d, dword ptr [rbp + 0x140]
0x1401cad52: mov ecx, ebx
0x1401cad54: inc ebx
0x1401cad56: mov edx, r10d
0x1401cad59: sub edx, dword ptr [rax + rcx*4]
0x1401cad5c: cmp edx, r9d
0x1401cad5f: jb 0x1401cae87
0x1401cad65: cmp ebx, r13d
0x1401cad68: jne 0x1401cad52
0x1401cad6a: cmp rdi, rsi
0x1401cad6d: je 0x1401cae75
0x1401cad73: mov ecx, dword ptr [rdi]
0x1401cad75: add rdi, 4
0x1401cad79: mov rdx, qword ptr [r15 + 0x1a8]
0x1401cad80: lea r8, [rcx + rcx*8]
0x1401cad84: cmp qword ptr [rdx + r8*8 + 0x10], 0
0x1401cad8a: je 0x1401cadb0
0x1401cad8c: lea rcx, [rdx + r8*8]
0x1401cad90: lea rbx, [rdx + r8*8]
0x1401cad94: add rbx, 0x10
0x1401cad98: mov rdx, qword ptr [r14 + 0x110]
0x1401cad9f: mov rax, qword ptr [rcx + 0x40]
0x1401cada3: cmp rdx, rax
0x1401cada6: jae 0x1401cae30
0x1401cadac: jmp 0x1401cadea
0x1401cadae: nop
0x1401cadb0: cmp rdi, rsi
0x1401cadb3: je 0x1401cae75
0x1401cadb9: mov edx, dword ptr [rdi]
0x1401cadbb: add rdi, 4
0x1401cadbf: mov rcx, qword ptr [r15 + 0x1a8]
0x1401cadc6: lea rdx, [rdx + rdx*8]
0x1401cadca: cmp qword ptr [rcx + rdx*8 + 0x10], 0
0x1401cadd0: je 0x1401cadb0
0x1401cadd2: lea rcx, [rcx + rdx*8]
0x1401cadd6: lea rbx, [rcx + 0x10]
0x1401cadda: mov rdx, qword ptr [r14 + 0x110]
0x1401cade1: mov rax, qword ptr [rcx + 0x40]
0x1401cade5: cmp rdx, rax
0x1401cade8: jae 0x1401cae30
0x1401cadea: mov r8, qword ptr [rcx + 0x38]
0x1401cadee: mov rdx, qword ptr [r8 + rdx*8]
0x1401cadf2: test rdx, rdx
0x1401cadf5: je 0x1401cae30
0x1401cadf7: mov r8, qword ptr [rcx + 0x18]
0x1401cadfb: not rdx
0x1401cadfe: lea rdx, [rdx + rdx*2]
0x1401cae02: shl rdx, 4
0x1401cae06: mov rdx, qword ptr [r8 + rdx + 0x10]
0x1401cae0b: mov qword ptr [rbp + 0x148], rdx
0x1401cae12: mov rdx, qword ptr [r14 + 0x118]
0x1401cae19: cmp rdx, rax
0x1401cae1c: jae 0x1401cad30
0x1401cae22: jmp 0x1401cae4b
0x1401cae24: nop word ptr cs:[rax + rax]
0x1401cae30: mov qword ptr [rbp + 0x148], 0
0x1401cae3b: mov rdx, qword ptr [r14 + 0x118]
0x1401cae42: cmp rdx, rax
0x1401cae45: jae 0x1401cad30
0x1401cae4b: mov rax, qword ptr [rcx + 0x38]
0x1401cae4f: mov rax, qword ptr [rax + rdx*8]
0x1401cae53: test rax, rax
0x1401cae56: je 0x1401cad30
0x1401cae5c: mov rdx, qword ptr [rcx + 0x18]
0x1401cae60: not rax
0x1401cae63: lea rax, [rax + rax*2]
0x1401cae67: shl rax, 4
0x1401cae6b: mov r12, qword ptr [rdx + rax + 0x10]
0x1401cae70: jmp 0x1401cad33
0x1401cae75: mov rdi, rsi
0x1401cae78: mov ebx, r13d
0x1401cae7b: xor edx, edx
0x1401cae7d: test rdx, rdx
0x1401cae80: jne 0x1401caea1
0x1401cae82: jmp 0x1401cb1ab
0x1401cae87: mov rdx, qword ptr [rbp + 0x148]
0x1401cae8e: add rdx, rcx
0x1401cae91: shl rcx, 4
0x1401cae95: add rcx, r12
0x1401cae98: test rdx, rdx
0x1401cae9b: je 0x1401cb1ab
0x1401caea1: cmp byte ptr [rdx], 0
0x1401caea4: jne 0x1401cad65
0x1401caeaa: mov edx, dword ptr [rcx]
0x1401caeac: test edx, edx
0x1401caeae: je 0x1401caedd
0x1401caeb0: cmp edx, 1
0x1401caeb3: jne 0x1401caf23
0x1401caeb5: mov rcx, qword ptr [rbp + 0x118]
0x1401caebc: mov edx, dword ptr [rbp + 0x144]
0x1401caec2: mov dword ptr [rcx], edx
0x1401caec4: mov rcx, qword ptr [rbp + 0x128]
0x1401caecb: movabs rdx, 0x64006400640064
0x1401caed5: mov qword ptr [rcx], rdx
0x1401caed8: jmp 0x1401cad65
0x1401caedd: mov rdx, qword ptr [rcx + 8]
0x1401caee1: mov r8d, dword ptr [rcx + 4]
0x1401caee5: mov rcx, qword ptr [rbp + 0x118]
0x1401caeec: mov r9d, dword ptr [rbp + 0x144]
0x1401caef3: mov dword ptr [rcx], r9d
0x1401caef6: mov rcx, qword ptr [rbp + 0x128]
0x1401caefd: mov qword ptr [rbp + 0x130], rax
0x1401caf04: call 0x14590e420
0x1401caf09: mov r9d, dword ptr [rbp + 0x140]
0x1401caf10: mov r10d, dword ptr [rbp + 0x13c]
0x1401caf17: mov rax, qword ptr [rbp + 0x130]
0x1401caf1e: jmp 0x1401cad65
0x1401caf23: mov rcx, qword ptr [rbp + 0x110]
0x1401caf2a: mov edx, dword ptr [rbp + 0x124]
0x1401caf30: mov dword ptr [rcx], edx
0x1401caf32: mov rcx, qword ptr [rbp + 0x108]
0x1401caf39: mov byte ptr [rcx], 0
0x1401caf3c: jmp 0x1401cad65
0x1401caf41: xor eax, eax
0x1401caf43: mov r13d, 8
0x1401caf49: xor r12d, r12d
0x1401caf4c: xor ebx, ebx
0x1401caf4e: mov qword ptr [rbp + 0x130], 0
0x1401caf59: mov qword ptr [rbp + 0x148], 0
0x1401caf64: jmp 0x1401cafbd
0x1401caf66: nop word ptr cs:[rax + rax]
0x1401caf70: mov qword ptr [rbp + 0x130], 0
0x1401caf7b: mov rdx, qword ptr [r14 + 0x120]
0x1401caf82: call 0x144e4f270
0x1401caf87: mov r13, qword ptr [rbx + 0x50]
0x1401caf8b: mov r12, qword ptr [r12]
0x1401caf8f: xor ebx, ebx
0x1401caf91: mov r10d, dword ptr [rbp + 0x13c]
0x1401caf98: mov r9d, dword ptr [rbp + 0x140]
0x1401caf9f: mov ecx, ebx
0x1401cafa1: shl rcx, 4
0x1401cafa5: inc ebx
0x1401cafa7: mov ecx, dword ptr [r13 + rcx + 8]
0x1401cafac: not ecx
0x1401cafae: mov edx, r10d
0x1401cafb1: sub edx, dword ptr [rax + rcx*4]
0x1401cafb4: cmp edx, r9d
0x1401cafb7: jb 0x1401cb0ee
0x1401cafbd: cmp ebx, r12d
0x1401cafc0: jne 0x1401caf9f
0x1401cafc2: cmp rdi, rsi
0x1401cafc5: je 0x1401cb0dc
0x1401cafcb: mov edx, dword ptr [rdi]
0x1401cafcd: add rdi, 4
0x1401cafd1: mov rcx, qword ptr [r15 + 0x108]
0x1401cafd8: lea rdx, [rdx + rdx*4]
0x1401cafdc: shl rdx, 5
0x1401cafe0: cmp qword ptr [rcx + rdx + 0x58], 0
0x1401cafe6: je 0x1401cb000
0x1401cafe8: lea rbx, [rcx + rdx]
0x1401cafec: lea r12, [rcx + rdx]
0x1401caff0: add r12, 0x58
0x1401caff4: jmp 0x1401cb02d
0x1401caff6: nop word ptr cs:[rax + rax]
0x1401cb000: cmp rdi, rsi
0x1401cb003: je 0x1401cb0dc
0x1401cb009: mov ecx, dword ptr [rdi]
0x1401cb00b: add rdi, 4
0x1401cb00f: mov rbx, qword ptr [r15 + 0x108]
0x1401cb016: lea rcx, [rcx + rcx*4]
0x1401cb01a: shl rcx, 5
0x1401cb01e: cmp qword ptr [rbx + rcx + 0x58], 0
0x1401cb024: je 0x1401cb000
0x1401cb026: add rbx, rcx
0x1401cb029: lea r12, [rbx + 0x58]
0x1401cb02d: mov eax, dword ptr [rbx + 0x94]
0x1401cb033: mov r8, qword ptr [r15 + 0x1a8]
0x1401cb03a: lea rax, [rax + rax*8]
0x1401cb03e: lea rcx, [r8 + rax*8]
0x1401cb042: mov rdx, qword ptr [r14 + 0x110]
0x1401cb049: mov rax, qword ptr [r8 + rax*8 + 0x40]
0x1401cb04e: cmp rdx, rax
0x1401cb051: jae 0x1401cb090
0x1401cb053: mov r8, qword ptr [rcx + 0x38]
0x1401cb057: mov rdx, qword ptr [r8 + rdx*8]
0x1401cb05b: test rdx, rdx
0x1401cb05e: je 0x1401cb090
0x1401cb060: mov r8, qword ptr [rcx + 0x18]
0x1401cb064: not rdx
0x1401cb067: lea rdx, [rdx + rdx*2]
0x1401cb06b: shl rdx, 4
0x1401cb06f: mov rdx, qword ptr [r8 + rdx + 0x10]
0x1401cb074: mov qword ptr [rbp + 0x148], rdx
0x1401cb07b: mov rdx, qword ptr [r14 + 0x118]
0x1401cb082: cmp rdx, rax
0x1401cb085: jae 0x1401caf70
0x1401cb08b: jmp 0x1401cb0ab
0x1401cb08d: nop dword ptr [rax]
0x1401cb090: mov qword ptr [rbp + 0x148], 0
0x1401cb09b: mov rdx, qword ptr [r14 + 0x118]
0x1401cb0a2: cmp rdx, rax
0x1401cb0a5: jae 0x1401caf70
0x1401cb0ab: mov rax, qword ptr [rcx + 0x38]
0x1401cb0af: mov rax, qword ptr [rax + rdx*8]
0x1401cb0b3: test rax, rax
0x1401cb0b6: je 0x1401caf70
0x1401cb0bc: mov rdx, qword ptr [rcx + 0x18]
0x1401cb0c0: not rax
0x1401cb0c3: lea rax, [rax + rax*2]
0x1401cb0c7: shl rax, 4
0x1401cb0cb: mov rax, qword ptr [rdx + rax + 0x10]
0x1401cb0d0: mov qword ptr [rbp + 0x130], rax
0x1401cb0d7: jmp 0x1401caf7b
0x1401cb0dc: mov rdi, rsi
0x1401cb0df: mov ebx, r12d
0x1401cb0e2: xor edx, edx
0x1401cb0e4: test rdx, rdx
0x1401cb0e7: jne 0x1401cb10c
0x1401cb0e9: jmp 0x1401cb1ab
0x1401cb0ee: mov rdx, qword ptr [rbp + 0x148]
0x1401cb0f5: add rdx, rcx
0x1401cb0f8: shl rcx, 4
0x1401cb0fc: add rcx, qword ptr [rbp + 0x130]
0x1401cb103: test rdx, rdx
0x1401cb106: je 0x1401cb1ab
0x1401cb10c: cmp byte ptr [rdx], 0
0x1401cb10f: jne 0x1401cafbd
0x1401cb115: mov edx, dword ptr [rcx]
0x1401cb117: cmp edx, 2
0x1401cb11a: je 0x1401cb149
0x1401cb11c: cmp edx, 1
0x1401cb11f: jne 0x1401cb167
0x1401cb121: mov rcx, qword ptr [rbp + 0x118]
0x1401cb128: mov edx, dword ptr [rbp + 0x144]
0x1401cb12e: mov dword ptr [rcx], edx
0x1401cb130: mov rcx, qword ptr [rbp + 0x128]
0x1401cb137: movabs rdx, 0x64006400640064
0x1401cb141: mov qword ptr [rcx], rdx
0x1401cb144: jmp 0x1401cafbd
0x1401cb149: mov rcx, qword ptr [rbp + 0x110]
0x1401cb150: mov edx, dword ptr [rbp + 0x124]
0x1401cb156: mov dword ptr [rcx], edx
0x1401cb158: mov rcx, qword ptr [rbp + 0x108]
0x1401cb15f: mov byte ptr [rcx], 0
0x1401cb162: jmp 0x1401cafbd
0x1401cb167: mov qword ptr [rbp + 0xe8], rax
0x1401cb16e: mov rdx, qword ptr [rcx + 8]
0x1401cb172: mov r8d, dword ptr [rcx + 4]
0x1401cb176: mov rax, qword ptr [rbp + 0x118]
0x1401cb17d: mov ecx, dword ptr [rbp + 0x144]
0x1401cb183: mov dword ptr [rax], ecx
0x1401cb185: mov rcx, qword ptr [rbp + 0x128]
0x1401cb18c: call 0x14590e420
0x1401cb191: mov rax, qword ptr [rbp + 0xe8]
0x1401cb198: mov r10d, dword ptr [rbp + 0x13c]
0x1401cb19f: mov r9d, dword ptr [rbp + 0x140]
0x1401cb1a6: jmp 0x1401cafbd
0x1401cb1ab: mov rax, qword ptr [rbp + 0x128]
0x1401cb1b2: mov rcx, qword ptr [rbp + 0xf0]
0x1401cb1b9: cmp qword ptr [rax], rcx
0x1401cb1bc: je 0x1401cb297
0x1401cb1c2: mov r14, qword ptr [rbp + 0xf8]
0x1401cb1c9: mov bl, byte ptr [r14 + 0x38]
0x1401cb1cd: mov sil, byte ptr [r14 + 0x39]
0x1401cb1d1: mov dil, byte ptr [r14 + 0x3a]
0x1401cb1d5: lea rcx, [rbp + 0xd0]
0x1401cb1dc: mov rdx, r14
0x1401cb1df: call 0x145bcd2f0
0x1401cb1e4: lea rdx, [r14 + 0x18]
0x1401cb1e8: lea rcx, [rbp + 0x88]
0x1401cb1ef: call 0x145bcd2f0
0x1401cb1f4: nop
0x1401cb1f5: movzx eax, byte ptr [r14 + 0x3f]
0x1401cb1fa: mov byte ptr [rbp - 0x19], al
0x1401cb1fd: mov eax, dword ptr [r14 + 0x3b]
0x1401cb201: mov dword ptr [rbp - 0x1d], eax
0x1401cb204: mov rax, qword ptr [r14 + 0x30]
0x1401cb208: mov rcx, qword ptr [rbp + 0xe0]
0x1401cb20f: mov qword ptr [rbp + 0xb0], rcx
0x1401cb216: movups xmm0, xmmword ptr [rbp + 0xd0]
0x1401cb21d: movaps xmmword ptr [rbp + 0xa0], xmm0
0x1401cb224: mov rcx, qword ptr [rbp + 0x98]
0x1401cb22b: mov qword ptr [rbp + 0xc8], rcx
0x1401cb232: movups xmm1, xmmword ptr [rbp + 0x88]
0x1401cb239: movups xmmword ptr [rbp + 0xb8], xmm1
0x1401cb240: movups xmmword ptr [rbp - 0x58], xmm0
0x1401cb244: mov rcx, qword ptr [rbp + 0xc0]
0x1401cb24b: mov qword ptr [rbp - 0x38], rcx
0x1401cb24f: mov rcx, qword ptr [rbp + 0xc8]
0x1401cb256: mov qword ptr [rbp - 0x30], rcx
0x1401cb25a: mov rcx, qword ptr [rbp + 0xb0]
0x1401cb261: mov qword ptr [rbp - 0x48], rcx
0x1401cb265: mov rcx, qword ptr [rbp + 0xb8]
0x1401cb26c: mov qword ptr [rbp - 0x40], rcx
0x1401cb270: mov qword ptr [rbp - 0x28], rax
0x1401cb274: mov byte ptr [rbp - 0x20], bl
0x1401cb277: mov byte ptr [rbp - 0x1f], sil
0x1401cb27b: mov byte ptr [rbp - 0x1e], dil
0x1401cb27f: mov dword ptr [rbp - 0x60], 0xc
0x1401cb286: lea rdx, [rbp - 0x60]
0x1401cb28a: mov rcx, qword ptr [rbp + 0x100]
0x1401cb291: call 0x1401838a0
0x1401cb296: nop
0x1401cb297: add rsp, 0x1d8
0x1401cb29e: pop rbx
0x1401cb29f: pop rdi
0x1401cb2a0: pop rsi
0x1401cb2a1: pop r12
0x1401cb2a3: pop r13
0x1401cb2a5: pop r14
0x1401cb2a7: pop r15
0x1401cb2a9: pop rbp
0x1401cb2aa: ret

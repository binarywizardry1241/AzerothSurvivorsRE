0x145aa8d20: push rbp
0x145aa8d21: push r15
0x145aa8d23: push r14
0x145aa8d25: push r13
0x145aa8d27: push r12
0x145aa8d29: push rsi
0x145aa8d2a: push rdi
0x145aa8d2b: push rbx
0x145aa8d2c: sub rsp, 0x98
0x145aa8d33: lea rbp, [rsp + 0x80]
0x145aa8d3b: mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
0x145aa8d43: mov rdi, r8
0x145aa8d46: cmp dx, 0x51
0x145aa8d4a: je 0x145aa8da3
0x145aa8d4c: movzx eax, dx
0x145aa8d4f: cmp eax, 0x96
0x145aa8d54: jne 0x145aa8dcf
0x145aa8d56: mov rsi, rcx
0x145aa8d59: mov r13, qword ptr [rdi + 0x10]
0x145aa8d5d: cmp r13, 5
0x145aa8d61: jb 0x145aa8f43
0x145aa8d67: mov rax, qword ptr [rdi + 8]
0x145aa8d6b: mov qword ptr [rbp - 0x18], rax
0x145aa8d6f: movzx eax, byte ptr [rax]
0x145aa8d72: cmp rax, 8
0x145aa8d76: ja 0x145aa8f43
0x145aa8d7c: lea rcx, [rip + 0x14e7861]
0x145aa8d83: movsxd rax, dword ptr [rcx + rax*4]
0x145aa8d87: add rax, rcx
0x145aa8d8a: jmp rax
0x145aa8d8c: mov edx, 0x15
0x145aa8d91: lea rcx, [rdx + 4]
0x145aa8d95: cmp rcx, r13
0x145aa8d98: jbe 0x145aa8efa
0x145aa8d9e: jmp 0x145aa8f43
0x145aa8da3: mov r12, qword ptr [rdi + 0x10]
0x145aa8da7: cmp r12, 9
0x145aa8dab: jb 0x145aa8dcf
0x145aa8dad: mov rbx, qword ptr [rdi + 8]
0x145aa8db1: lea rsi, [rbx + 8]
0x145aa8db5: lea r15, [r12 - 8]
0x145aa8dba: xor r13d, r13d
0x145aa8dbd: nop dword ptr [rax]
0x145aa8dc0: cmp byte ptr [rsi + r13], 0
0x145aa8dc5: je 0x145aa8de5
0x145aa8dc7: inc r13
0x145aa8dca: cmp r15, r13
0x145aa8dcd: jne 0x145aa8dc0
0x145aa8dcf: mov rax, qword ptr [rdi + 0x10]
0x145aa8dd3: mov qword ptr [rcx + 0x10], rax
0x145aa8dd7: movups xmm0, xmmword ptr [rdi]
0x145aa8dda: movups xmmword ptr [rcx], xmm0
0x145aa8ddd: mov rax, rcx
0x145aa8de0: jmp 0x145aa8f54
0x145aa8de5: mov qword ptr [rbp - 0x18], rcx
0x145aa8de9: call 0x140002200
0x145aa8dee: mov ecx, 8
0x145aa8df3: mov edx, 1
0x145aa8df8: call 0x1400021c0
0x145aa8dfd: test rax, rax
0x145aa8e00: mov qword ptr [rbp - 0x20], rdi
0x145aa8e04: je 0x145aa95c7
0x145aa8e0a: lea rdx, [r13 + 8]
0x145aa8e0e: mov qword ptr [rbp - 0x10], 8
0x145aa8e16: mov qword ptr [rbp - 8], rax
0x145aa8e1a: mov rcx, qword ptr [rbx]
0x145aa8e1d: mov qword ptr [rax], rcx
0x145aa8e20: mov qword ptr [rbp], 8
0x145aa8e28: cmp r13, -9
0x145aa8e2c: mov qword ptr [rbp - 0x48], rbx
0x145aa8e30: ja 0x145aa94c4
0x145aa8e36: cmp rdx, r12
0x145aa8e39: ja 0x145aa94c4
0x145aa8e3f: lea rbx, [rsi + r13]
0x145aa8e43: test r13, r13
0x145aa8e46: je 0x145aa8ecc
0x145aa8e4c: mov qword ptr [rbp - 0x40], r12
0x145aa8e50: mov r14d, 8
0x145aa8e56: jmp 0x145aa8e76
0x145aa8e58: nop dword ptr [rax + rax]
0x145aa8e60: lea r14, [r12 + 1]
0x145aa8e65: mov byte ptr [rax + r12], dil
0x145aa8e69: mov qword ptr [rbp], r14
0x145aa8e6d: cmp rbx, rsi
0x145aa8e70: je 0x145aa8f6d
0x145aa8e76: mov r12, r14
0x145aa8e79: nop dword ptr [rax]
0x145aa8e80: movzx edi, byte ptr [rsi]
0x145aa8e83: inc rsi
0x145aa8e86: cmp dil, 0x7c
0x145aa8e8a: jne 0x145aa8e91
0x145aa8e8c: cmp rbx, rsi
0x145aa8e8f: jne 0x145aa8e80
0x145aa8e91: mov rcx, qword ptr [rbp - 0x10]
0x145aa8e95: cmp dil, 0x7c
0x145aa8e99: je 0x145aa8f68
0x145aa8e9f: cmp r12, rcx
0x145aa8ea2: jne 0x145aa8e60
0x145aa8ea4: mov qword ptr [rsp + 0x20], 1
0x145aa8ead: mov r8d, 1
0x145aa8eb3: mov r9d, 1
0x145aa8eb9: lea rcx, [rbp - 0x10]
0x145aa8ebd: mov rdx, r12
0x145aa8ec0: call 0x145fa3ec0
0x145aa8ec5: nop
0x145aa8ec6: mov rax, qword ptr [rbp - 8]
0x145aa8eca: jmp 0x145aa8e60
0x145aa8ecc: mov ecx, 8
0x145aa8ed1: mov r14d, 8
0x145aa8ed7: jmp 0x145aa8f75
0x145aa8edc: mov rax, qword ptr [rbp - 0x18]
0x145aa8ee0: cmp dword ptr [rax + 1], -1
0x145aa8ee4: jne 0x145aa8d8c
0x145aa8eea: jmp 0x145aa8f43
0x145aa8eec: mov edx, 0xd
0x145aa8ef1: lea rcx, [rdx + 4]
0x145aa8ef5: cmp rcx, r13
0x145aa8ef8: ja 0x145aa8f43
0x145aa8efa: mov rax, qword ptr [rbp - 0x18]
0x145aa8efe: mov r8d, dword ptr [rax + rdx]
0x145aa8f02: cmp r8, 1
0x145aa8f06: mov qword ptr [rbp - 0x48], r8
0x145aa8f0a: adc r8, -1
0x145aa8f0e: lea rax, [r8 + rcx]
0x145aa8f12: cmp rax, r13
0x145aa8f15: ja 0x145aa8f43
0x145aa8f17: mov qword ptr [rbp - 0x40], rdx
0x145aa8f1b: mov qword ptr [rbp - 0x20], rdi
0x145aa8f1f: mov rax, qword ptr [rbp - 0x18]
0x145aa8f23: mov qword ptr [rbp - 0x58], rcx
0x145aa8f27: lea rdx, [rax + rcx]
0x145aa8f2b: lea rcx, [rbp - 0x10]
0x145aa8f2f: call 0x145f7f020
0x145aa8f34: nop
0x145aa8f35: cmp dword ptr [rbp - 0x10], 1
0x145aa8f39: jne 0x145aa8fe6
0x145aa8f3f: mov rdi, qword ptr [rbp - 0x20]
0x145aa8f43: mov rcx, qword ptr [rdi + 0x10]
0x145aa8f47: mov rax, rsi
0x145aa8f4a: mov qword ptr [rsi + 0x10], rcx
0x145aa8f4e: movups xmm0, xmmword ptr [rdi]
0x145aa8f51: movups xmmword ptr [rsi], xmm0
0x145aa8f54: add rsp, 0x98
0x145aa8f5b: pop rbx
0x145aa8f5c: pop rdi
0x145aa8f5d: pop rsi
0x145aa8f5e: pop r12
0x145aa8f60: pop r13
0x145aa8f62: pop r14
0x145aa8f64: pop r15
0x145aa8f66: pop rbp
0x145aa8f67: ret
0x145aa8f68: mov r14, r12
0x145aa8f6b: jmp 0x145aa8f71
0x145aa8f6d: mov rcx, qword ptr [rbp - 0x10]
0x145aa8f71: mov r12, qword ptr [rbp - 0x40]
0x145aa8f75: mov r8, r12
0x145aa8f78: sub r8, r13
0x145aa8f7b: add r8, -8
0x145aa8f7f: sub rcx, r14
0x145aa8f82: cmp r8, rcx
0x145aa8f85: ja 0x145aa94de
0x145aa8f8b: cmp r15, r13
0x145aa8f8e: je 0x145aa8f9f
0x145aa8f90: mov rcx, qword ptr [rbp - 8]
0x145aa8f94: add rcx, r14
0x145aa8f97: mov rdx, rbx
0x145aa8f9a: call 0x145fa3aab
0x145aa8f9f: add r12, r14
0x145aa8fa2: sub r12, r13
0x145aa8fa5: add r12, -8
0x145aa8fa9: mov qword ptr [rbp], r12
0x145aa8fad: mov rcx, qword ptr [rbp - 0x18]
0x145aa8fb1: mov qword ptr [rcx + 0x10], r12
0x145aa8fb5: movups xmm0, xmmword ptr [rbp - 0x10]
0x145aa8fb9: movups xmmword ptr [rcx], xmm0
0x145aa8fbc: mov rax, qword ptr [rbp - 0x20]
0x145aa8fc0: mov rdx, qword ptr [rax]
0x145aa8fc3: test rdx, rdx
0x145aa8fc6: je 0x145aa8ddd
0x145aa8fcc: mov rsi, rcx
0x145aa8fcf: mov r8d, 1
0x145aa8fd5: mov rcx, qword ptr [rbp - 0x48]
0x145aa8fd9: call 0x1400021d0
0x145aa8fde: mov rax, rsi
0x145aa8fe1: jmp 0x145aa8f54
0x145aa8fe6: mov r14, qword ptr [rbp - 8]
0x145aa8fea: mov r15, qword ptr [rbp]
0x145aa8fee: mov qword ptr [rsp + 0x20], 1
0x145aa8ff7: lea rcx, [rbp - 0x10]
0x145aa8ffb: mov r9d, 1
0x145aa9001: mov rdx, r15
0x145aa9004: xor r8d, r8d
0x145aa9007: call 0x1400154b0
0x145aa900c: mov rcx, qword ptr [rbp - 8]
0x145aa9010: cmp dword ptr [rbp - 0x10], 1
0x145aa9014: je 0x145aa9512
0x145aa901a: mov rax, qword ptr [rbp]
0x145aa901e: mov qword ptr [rbp - 0x38], rcx
0x145aa9022: mov qword ptr [rbp - 0x30], rax
0x145aa9026: mov qword ptr [rbp - 0x28], 0
0x145aa902e: add r15, r14
0x145aa9031: mov r12d, 0xfffffffe
0x145aa9037: xor ebx, ebx
0x145aa9039: lea rcx, [rbp - 0x38]
0x145aa903d: jmp 0x145aa905c
0x145aa903f: or dl, 0xc0
0x145aa9042: mov byte ptr [rax + rbx], dl
0x145aa9045: mov byte ptr [rax + rbx + 1], r9b
0x145aa904a: mov edx, 2
0x145aa904f: add rbx, rdx
0x145aa9052: mov qword ptr [rbp - 0x28], rbx
0x145aa9056: mov r12d, 0xfffffffe
0x145aa905c: cmp r12d, -2
0x145aa9060: je 0x145aa90a0
0x145aa9062: cmp r12d, -1
0x145aa9066: je 0x145aa936c
0x145aa906c: cmp r12d, 0x80
0x145aa9073: jae 0x145aa919d
0x145aa9079: cmp qword ptr [rbp - 0x38], rbx
0x145aa907d: je 0x145aa92f1
0x145aa9083: mov rax, qword ptr [rbp - 0x30]
0x145aa9087: mov byte ptr [rax + rbx], r12b
0x145aa908b: mov edx, 1
0x145aa9090: jmp 0x145aa904f
0x145aa9092: nop word ptr cs:[rax + rax]
0x145aa90a0: cmp r14, r15
0x145aa90a3: je 0x145aa936c
0x145aa90a9: movzx edx, byte ptr [r14]
0x145aa90ad: movzx r12d, dl
0x145aa90b1: test r12b, r12b
0x145aa90b4: js 0x145aa9113
0x145aa90b6: inc r14
0x145aa90b9: mov rdi, r14
0x145aa90bc: cmp r12d, 0x7c
0x145aa90c0: jne 0x145aa918d
0x145aa90c6: mov rdx, qword ptr [rbp - 0x38]
0x145aa90ca: sub rdx, rbx
0x145aa90cd: cmp rdx, 1
0x145aa90d1: jbe 0x145aa933b
0x145aa90d7: mov word ptr [rax + rbx], 0x7c7c
0x145aa90dd: add rbx, 2
0x145aa90e1: mov qword ptr [rbp - 0x28], rbx
0x145aa90e5: mov r12d, 0xffffffff
0x145aa90eb: mov r14, r15
0x145aa90ee: cmp rdi, r15
0x145aa90f1: je 0x145aa905c
0x145aa90f7: movzx r8d, byte ptr [rdi]
0x145aa90fb: movzx r10d, r8b
0x145aa90ff: test r10b, r10b
0x145aa9102: js 0x145aa924d
0x145aa9108: inc rdi
0x145aa910b: mov r14, rdi
0x145aa910e: jmp 0x145aa92ca
0x145aa9113: mov r9d, r12d
0x145aa9116: and r9d, 0x1f
0x145aa911a: movzx r8d, byte ptr [r14 + 1]
0x145aa911f: and r8d, 0x3f
0x145aa9123: cmp r12b, 0xdf
0x145aa9127: jbe 0x145aa9172
0x145aa9129: movzx r12d, byte ptr [r14 + 2]
0x145aa912e: shl r8d, 6
0x145aa9132: and r12d, 0x3f
0x145aa9136: or r12d, r8d
0x145aa9139: cmp dl, 0xf0
0x145aa913c: jb 0x145aa929d
0x145aa9142: movzx edx, byte ptr [r14 + 3]
0x145aa9147: add r14, 4
0x145aa914b: and r9d, 7
0x145aa914f: shl r9d, 0x12
0x145aa9153: shl r12d, 6
0x145aa9157: and edx, 0x3f
0x145aa915a: or edx, r12d
0x145aa915d: or edx, r9d
0x145aa9160: mov rdi, r14
0x145aa9163: mov r12d, edx
0x145aa9166: cmp r12d, 0x7c
0x145aa916a: je 0x145aa90c6
0x145aa9170: jmp 0x145aa918d
0x145aa9172: add r14, 2
0x145aa9176: shl r9d, 6
0x145aa917a: or r9d, r8d
0x145aa917d: mov rdi, r14
0x145aa9180: mov r12d, r9d
0x145aa9183: cmp r12d, 0x7c
0x145aa9187: je 0x145aa90c6
0x145aa918d: mov r14, rdi
0x145aa9190: cmp r12d, 0x80
0x145aa9197: jb 0x145aa9079
0x145aa919d: cmp r12d, 0x10000
0x145aa91a4: mov r8d, 4
0x145aa91aa: sbb r8, 0
0x145aa91ae: cmp r12d, 0x800
0x145aa91b5: mov eax, 2
0x145aa91ba: cmovb r8, rax
0x145aa91be: mov rax, qword ptr [rbp - 0x38]
0x145aa91c2: sub rax, rbx
0x145aa91c5: cmp r8, rax
0x145aa91c8: ja 0x145aa9319
0x145aa91ce: mov r9d, r12d
0x145aa91d1: and r9b, 0x3f
0x145aa91d5: or r9b, 0x80
0x145aa91d9: mov edx, r12d
0x145aa91dc: shr edx, 6
0x145aa91df: mov rax, qword ptr [rbp - 0x30]
0x145aa91e3: cmp r12d, 0x800
0x145aa91ea: jb 0x145aa903f
0x145aa91f0: and dl, 0x3f
0x145aa91f3: or dl, 0x80
0x145aa91f6: mov r8d, r12d
0x145aa91f9: shr r8d, 0xc
0x145aa91fd: cmp r12d, 0xffff
0x145aa9204: ja 0x145aa9221
0x145aa9206: or r8b, 0xe0
0x145aa920a: mov byte ptr [rax + rbx], r8b
0x145aa920e: mov byte ptr [rax + rbx + 1], dl
0x145aa9212: mov byte ptr [rax + rbx + 2], r9b
0x145aa9217: mov edx, 3
0x145aa921c: jmp 0x145aa904f
0x145aa9221: and r8b, 0x3f
0x145aa9225: or r8b, 0x80
0x145aa9229: shr r12d, 0x12
0x145aa922d: or r12b, 0xf0
0x145aa9231: mov byte ptr [rax + rbx], r12b
0x145aa9235: mov byte ptr [rax + rbx + 1], r8b
0x145aa923a: mov byte ptr [rax + rbx + 2], dl
0x145aa923e: mov byte ptr [rax + rbx + 3], r9b
0x145aa9243: mov edx, 4
0x145aa9248: jmp 0x145aa904f
0x145aa924d: mov edx, r10d
0x145aa9250: and edx, 0x1f
0x145aa9253: movzx r9d, byte ptr [rdi + 1]
0x145aa9258: and r9d, 0x3f
0x145aa925c: cmp r10b, 0xdf
0x145aa9260: jbe 0x145aa92ba
0x145aa9262: movzx r10d, byte ptr [rdi + 2]
0x145aa9267: shl r9d, 6
0x145aa926b: and r10d, 0x3f
0x145aa926f: or r10d, r9d
0x145aa9272: cmp r8b, 0xf0
0x145aa9276: jb 0x145aa92e2
0x145aa9278: movzx r8d, byte ptr [rdi + 3]
0x145aa927d: add rdi, 4
0x145aa9281: and edx, 7
0x145aa9284: shl edx, 0x12
0x145aa9287: shl r10d, 6
0x145aa928b: and r8d, 0x3f
0x145aa928f: or r8d, r10d
0x145aa9292: or r8d, edx
0x145aa9295: mov r14, rdi
0x145aa9298: mov r10d, r8d
0x145aa929b: jmp 0x145aa92ca
0x145aa929d: add r14, 3
0x145aa92a1: shl r9d, 0xc
0x145aa92a5: or r12d, r9d
0x145aa92a8: mov rdi, r14
0x145aa92ab: cmp r12d, 0x7c
0x145aa92af: je 0x145aa90c6
0x145aa92b5: jmp 0x145aa918d
0x145aa92ba: add rdi, 2
0x145aa92be: shl edx, 6
0x145aa92c1: or edx, r9d
0x145aa92c4: mov r14, rdi
0x145aa92c7: mov r10d, edx
0x145aa92ca: mov r12d, 0xfffffffe
0x145aa92d0: cmp r10d, 0x7c
0x145aa92d4: je 0x145aa905c
0x145aa92da: mov r12d, r10d
0x145aa92dd: jmp 0x145aa905c
0x145aa92e2: add rdi, 3
0x145aa92e6: shl edx, 0xc
0x145aa92e9: or r10d, edx
0x145aa92ec: jmp 0x145aa910b
0x145aa92f1: mov qword ptr [rsp + 0x20], 1
0x145aa92fa: mov r8d, 1
0x145aa9300: mov r9d, 1
0x145aa9306: mov rdx, rbx
0x145aa9309: mov rdi, rcx
0x145aa930c: call 0x145fa3ec0
0x145aa9311: mov rcx, rdi
0x145aa9314: jmp 0x145aa9083
0x145aa9319: mov qword ptr [rsp + 0x20], 1
0x145aa9322: mov r9d, 1
0x145aa9328: mov rdx, rbx
0x145aa932b: mov rdi, rcx
0x145aa932e: call 0x145fa3ec0
0x145aa9333: mov rcx, rdi
0x145aa9336: jmp 0x145aa91ce
0x145aa933b: mov qword ptr [rsp + 0x20], 1
0x145aa9344: mov r8d, 2
0x145aa934a: mov r9d, 1
0x145aa9350: mov rdx, rbx
0x145aa9353: mov rbx, rcx
0x145aa9356: call 0x145fa3ec0
0x145aa935b: nop
0x145aa935c: mov rcx, rbx
0x145aa935f: mov rax, qword ptr [rbp - 0x30]
0x145aa9363: mov rbx, qword ptr [rbp - 0x28]
0x145aa9367: jmp 0x145aa90d7
0x145aa936c: mov qword ptr [rsp + 0x20], 1
0x145aa9375: lea rcx, [rbp - 0x10]
0x145aa9379: mov r9d, 1
0x145aa937f: mov rdi, qword ptr [rbp - 0x40]
0x145aa9383: mov rdx, rdi
0x145aa9386: xor r8d, r8d
0x145aa9389: call 0x1400154b0
0x145aa938e: mov r15, qword ptr [rbp - 8]
0x145aa9392: cmp byte ptr [rbp - 0x10], 0
0x145aa9396: jne 0x145aa9521
0x145aa939c: mov r12, qword ptr [rbp]
0x145aa93a0: mov qword ptr [rbp - 0x10], r15
0x145aa93a4: mov qword ptr [rbp - 8], r12
0x145aa93a8: mov rcx, r12
0x145aa93ab: mov rdx, qword ptr [rbp - 0x18]
0x145aa93af: mov r8, rdi
0x145aa93b2: call 0x145fa3aab
0x145aa93b7: mov qword ptr [rbp], rdi
0x145aa93bb: mov rax, r15
0x145aa93be: sub rax, rdi
0x145aa93c1: cmp rax, 3
0x145aa93c5: jbe 0x145aa9533
0x145aa93cb: lea r14, [rdi + 4]
0x145aa93cf: lea eax, [rbx + 1]
0x145aa93d2: mov dword ptr [r12 + rdi], eax
0x145aa93d6: mov qword ptr [rbp], r14
0x145aa93da: mov rdi, qword ptr [rbp - 0x30]
0x145aa93de: mov rax, r15
0x145aa93e1: sub rax, r14
0x145aa93e4: cmp rbx, rax
0x145aa93e7: ja 0x145aa9566
0x145aa93ed: test rbx, rbx
0x145aa93f0: je 0x145aa9401
0x145aa93f2: lea rcx, [r12 + r14]
0x145aa93f6: mov rdx, rdi
0x145aa93f9: mov r8, rbx
0x145aa93fc: call 0x145fa3aab
0x145aa9401: add r14, rbx
0x145aa9404: mov qword ptr [rbp], r14
0x145aa9408: cmp r14, r15
0x145aa940b: jne 0x145aa941b
0x145aa940d: lea rcx, [rbp - 0x10]
0x145aa9411: call 0x14614ac60
0x145aa9416: nop
0x145aa9417: mov r12, qword ptr [rbp - 8]
0x145aa941b: mov byte ptr [r12 + r14], 0
0x145aa9420: inc r14
0x145aa9423: mov qword ptr [rbp], r14
0x145aa9427: mov r15, qword ptr [rbp - 0x58]
0x145aa942b: add r15, qword ptr [rbp - 0x48]
0x145aa942f: cmp r13, r15
0x145aa9432: mov r12, r15
0x145aa9435: cmovb r15, r13
0x145aa9439: mov rbx, r13
0x145aa943c: sub rbx, r15
0x145aa943f: mov rax, qword ptr [rbp - 0x10]
0x145aa9443: sub rax, r14
0x145aa9446: cmp rbx, rax
0x145aa9449: ja 0x145aa9596
0x145aa944f: cmp r13, r12
0x145aa9452: jbe 0x145aa946e
0x145aa9454: add r15, qword ptr [rbp - 0x18]
0x145aa9458: add r14, qword ptr [rbp - 8]
0x145aa945c: mov rcx, r14
0x145aa945f: mov rdx, r15
0x145aa9462: mov r8, rbx
0x145aa9465: call 0x145fa3aab
0x145aa946a: mov r14, qword ptr [rbp]
0x145aa946e: mov rcx, rsi
0x145aa9471: add r14, rbx
0x145aa9474: mov qword ptr [rbp], r14
0x145aa9478: mov qword ptr [rsi + 0x10], r14
0x145aa947c: movups xmm0, xmmword ptr [rbp - 0x10]
0x145aa9480: movups xmmword ptr [rsi], xmm0
0x145aa9483: mov rdx, qword ptr [rbp - 0x38]
0x145aa9487: test rdx, rdx
0x145aa948a: je 0x145aa949d
0x145aa948c: mov r8d, 1
0x145aa9492: mov rcx, rdi
0x145aa9495: call 0x1400021d0
0x145aa949a: mov rcx, rsi
0x145aa949d: mov rax, qword ptr [rbp - 0x20]
0x145aa94a1: mov rdx, qword ptr [rax]
0x145aa94a4: test rdx, rdx
0x145aa94a7: je 0x145aa8ddd
0x145aa94ad: mov r8d, 1
0x145aa94b3: mov rcx, qword ptr [rbp - 0x18]
0x145aa94b7: call 0x1400021d0
0x145aa94bc: mov rcx, rsi
0x145aa94bf: jmp 0x145aa8ddd
0x145aa94c4: lea r9, [rip + 0x14e510d]
0x145aa94cb: mov ecx, 8
0x145aa94d0: mov r8, r12
0x145aa94d3: call 0x14614b310
0x145aa94d8: nop
0x145aa94d9: jmp 0x145aa95df
0x145aa94de: mov qword ptr [rsp + 0x20], 1
0x145aa94e7: lea rcx, [rbp - 0x10]
0x145aa94eb: mov r9d, 1
0x145aa94f1: mov rdx, r14
0x145aa94f4: mov rsi, r8
0x145aa94f7: call 0x145fa3ec0
0x145aa94fc: nop
0x145aa94fd: mov r14, qword ptr [rbp]
0x145aa9501: mov r8, rsi
0x145aa9504: cmp r15, r13
0x145aa9507: jne 0x145aa8f90
0x145aa950d: jmp 0x145aa8f9f
0x145aa9512: mov rdx, qword ptr [rbp]
0x145aa9516: call 0x14614ad6b
0x145aa951b: nop
0x145aa951c: jmp 0x145aa95df
0x145aa9521: mov rdx, qword ptr [rbp]
0x145aa9525: mov rcx, r15
0x145aa9528: call 0x14614ad6b
0x145aa952d: nop
0x145aa952e: jmp 0x145aa95df
0x145aa9533: mov qword ptr [rsp + 0x20], 1
0x145aa953c: lea rcx, [rbp - 0x10]
0x145aa9540: mov r8d, 4
0x145aa9546: mov r9d, 1
0x145aa954c: mov rdx, rdi
0x145aa954f: call 0x145fa3ec0
0x145aa9554: nop
0x145aa9555: mov rdi, qword ptr [rbp]
0x145aa9559: mov r15, qword ptr [rbp - 0x10]
0x145aa955d: mov r12, qword ptr [rbp - 8]
0x145aa9561: jmp 0x145aa93cb
0x145aa9566: mov qword ptr [rsp + 0x20], 1
0x145aa956f: lea rcx, [rbp - 0x10]
0x145aa9573: mov r9d, 1
0x145aa9579: mov rdx, r14
0x145aa957c: mov r8, rbx
0x145aa957f: call 0x145fa3ec0
0x145aa9584: nop
0x145aa9585: mov r14, qword ptr [rbp]
0x145aa9589: mov r15, qword ptr [rbp - 0x10]
0x145aa958d: mov r12, qword ptr [rbp - 8]
0x145aa9591: jmp 0x145aa93f2
0x145aa9596: mov qword ptr [rsp + 0x20], 1
0x145aa959f: lea rcx, [rbp - 0x10]
0x145aa95a3: mov r9d, 1
0x145aa95a9: mov rdx, r14
0x145aa95ac: mov r8, rbx
0x145aa95af: call 0x145fa3ec0
0x145aa95b4: nop
0x145aa95b5: mov r14, qword ptr [rbp]
0x145aa95b9: cmp r13, r12
0x145aa95bc: ja 0x145aa9454
0x145aa95c2: jmp 0x145aa946e
0x145aa95c7: mov qword ptr [rbp - 0x50], rbx
0x145aa95cb: mov byte ptr [rbp + 0xf], 1
0x145aa95cf: mov ecx, 1
0x145aa95d4: mov edx, 8
0x145aa95d9: call 0x14614ad6b
0x145aa95de: nop
0x145aa95df: ud2

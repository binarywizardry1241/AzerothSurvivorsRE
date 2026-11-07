;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14096fa20..0x14096fd1a SHA256 7e846e973ee8127daba19ea0e2a549d52509a2ac8a155c9d5fe0840294ca6a12
0x14096fa20: push r15
0x14096fa22: push r14
0x14096fa24: push r13
0x14096fa26: push r12
0x14096fa28: push rsi
0x14096fa29: push rdi
0x14096fa2a: push rbp
0x14096fa2b: push rbx
0x14096fa2c: sub rsp, 0x28
0x14096fa30: mov rcx, qword ptr [rsp + 0x90]
0x14096fa38: mov rax, qword ptr [rdx]
0x14096fa3b: mov r10, qword ptr [rdx + 0x10]
0x14096fa3f: mov r11d, dword ptr [rdx + 0x1c]
0x14096fa43: mov r8, qword ptr [r8]
0x14096fa46: mov dl, 1
0x14096fa48: cmp byte ptr [r8 + 0x15], 0
0x14096fa4d: je 0x14096fb0f
0x14096fa53: movzx r8d, byte ptr [rcx]
0x14096fa57: cmp r8b, 2
0x14096fa5b: je 0x14096fa6a
0x14096fa5d: xor r8b, dl
0x14096fa60: test r8b, 1
0x14096fa64: je 0x14096fafe
0x14096fa6a: mov byte ptr [rcx], dl
0x14096fa6c: mov dword ptr [r10], r11d
0x14096fa6f: cmp dword ptr [rax], 2
0x14096fa72: je 0x14096fafe
0x14096fa78: movzx ecx, byte ptr [rax + 0x418]
0x14096fa7f: cmp rcx, 3
0x14096fa83: jae 0x14096fd07
0x14096fa89: xorps xmm0, xmm0
0x14096fa8c: test dl, dl
0x14096fa8e: jne 0x14096fa98
0x14096fa90: movss xmm0, dword ptr [rip + 0x5560eb8]
0x14096fa98: mov rdx, qword ptr [rax + 0x410]
0x14096fa9f: mov r8d, ecx
0x14096faa2: shl r8d, 7
0x14096faa6: mov qword ptr [rdx + r8 + 0x80], 0
0x14096fab2: mov dword ptr [rdx + r8 + 0xa8], 0
0x14096fabe: mov qword ptr [rdx + r8 + 0xb8], 0
0x14096faca: mov dword ptr [rdx + r8 + 0xc0], 0xe4e1c0
0x14096fad6: mov dword ptr [rdx + r8 + 0xc8], 7
0x14096fae2: movss dword ptr [rdx + r8 + 0xcc], xmm0
0x14096faec: or cl, 4
0x14096faef: xchg byte ptr [rdx + 0x200], cl
0x14096faf5: and cl, 3
0x14096faf8: mov byte ptr [rax + 0x418], cl
0x14096fafe: add rsp, 0x28
0x14096fb02: pop rbx
0x14096fb03: pop rbp
0x14096fb04: pop rdi
0x14096fb05: pop rsi
0x14096fb06: pop r12
0x14096fb08: pop r13
0x14096fb0a: pop r14
0x14096fb0c: pop r15
0x14096fb0e: ret
0x14096fb0f: mov r14, qword ptr [r9]
0x14096fb12: mov r8, qword ptr [r9 + 8]
0x14096fb16: mov rsi, qword ptr [r14 + 0xf8]
0x14096fb1d: mov rdi, qword ptr [r14 + 0x100]
0x14096fb24: lea r12, [rdi*4]
0x14096fb2c: lea r9, [rsi + rdi*4]
0x14096fb30: movzx ebx, byte ptr [r14 + 0x108]
0x14096fb38: test bl, bl
0x14096fb3a: je 0x14096fb71
0x14096fb3c: test rdi, rdi
0x14096fb3f: je 0x14096fbf7
0x14096fb45: mov r15, qword ptr [r8 + 0x1a8]
0x14096fb4c: add rsi, 4
0x14096fb50: mov edi, dword ptr [rsi - 4]
0x14096fb53: lea r13, [rdi + rdi*8]
0x14096fb57: mov rdi, qword ptr [r15 + r13*8 + 0x10]
0x14096fb5c: test rdi, rdi
0x14096fb5f: jne 0x14096fc1d
0x14096fb65: add rsi, 4
0x14096fb69: add r12, -4
0x14096fb6d: jne 0x14096fb50
0x14096fb6f: jmp 0x14096fbb3
0x14096fb71: test rdi, rdi
0x14096fb74: je 0x14096fbff
0x14096fb7a: mov r15, qword ptr [r8 + 0x108]
0x14096fb81: add rsi, 4
0x14096fb85: nop word ptr cs:[rax + rax]
0x14096fb90: mov edi, dword ptr [rsi - 4]
0x14096fb93: lea r13, [rdi + rdi*4]
0x14096fb97: shl r13, 5
0x14096fb9b: mov rdi, qword ptr [r15 + r13 + 0x58]
0x14096fba0: test rdi, rdi
0x14096fba3: jne 0x14096fc51
0x14096fba9: add rsi, 4
0x14096fbad: add r12, -4
0x14096fbb1: jne 0x14096fb90
0x14096fbb3: xor edi, edi
0x14096fbb5: mov rsi, r9
0x14096fbb8: xor ebp, ebp
0x14096fbba: xor r14d, r14d
0x14096fbbd: test bl, bl
0x14096fbbf: jne 0x14096fcc9
0x14096fbc5: cmp ebp, edi
0x14096fbc7: jne 0x14096fa53
0x14096fbcd: nop dword ptr [rax]
0x14096fbd0: cmp rsi, r9
0x14096fbd3: je 0x14096fc07
0x14096fbd5: mov edi, dword ptr [rsi]
0x14096fbd7: add rsi, 4
0x14096fbdb: mov rbx, qword ptr [r8 + 0x108]
0x14096fbe2: lea rdi, [rdi + rdi*4]
0x14096fbe6: shl rdi, 5
0x14096fbea: cmp qword ptr [rbx + rdi + 0x58], 0
0x14096fbf0: je 0x14096fbd0
0x14096fbf2: jmp 0x14096fa53
0x14096fbf7: xor r14d, r14d
0x14096fbfa: jmp 0x14096fce0
0x14096fbff: xor r14d, r14d
0x14096fc02: cmp rsi, r9
0x14096fc05: jne 0x14096fbd5
0x14096fc07: test r14, r14
0x14096fc0a: je 0x14096fa53
0x14096fc10: movzx edx, byte ptr [r14 + 0xde]
0x14096fc18: jmp 0x14096fa53
0x14096fc1d: lea r15, [r15 + r13*8]
0x14096fc21: mov r14, qword ptr [r14 + 0x110]
0x14096fc28: cmp r14, qword ptr [r15 + 0x40]
0x14096fc2c: jae 0x14096fc9f
0x14096fc2e: mov r12, qword ptr [r15 + 0x38]
0x14096fc32: mov r14, qword ptr [r12 + r14*8]
0x14096fc36: test r14, r14
0x14096fc39: je 0x14096fc9f
0x14096fc3b: mov r15, qword ptr [r15 + 0x18]
0x14096fc3f: not r14
0x14096fc42: lea r14, [r14 + r14*2]
0x14096fc46: shl r14, 4
0x14096fc4a: mov r14, qword ptr [r15 + r14 + 0x10]
0x14096fc4f: jmp 0x14096fcbc
0x14096fc51: add r15, r13
0x14096fc54: mov r13d, dword ptr [r15 + 0x94]
0x14096fc5b: mov r12, qword ptr [r8 + 0x1a8]
0x14096fc62: lea r13, [r13 + r13*8]
0x14096fc67: mov r14, qword ptr [r14 + 0x110]
0x14096fc6e: cmp r14, qword ptr [r12 + r13*8 + 0x40]
0x14096fc73: jae 0x14096fca4
0x14096fc75: lea r12, [r12 + r13*8]
0x14096fc79: mov r13, qword ptr [r12 + 0x38]
0x14096fc7e: mov r14, qword ptr [r13 + r14*8]
0x14096fc83: test r14, r14
0x14096fc86: je 0x14096fca4
0x14096fc88: mov r12, qword ptr [r12 + 0x18]
0x14096fc8d: not r14
0x14096fc90: lea r14, [r14 + r14*2]
0x14096fc94: shl r14, 4
0x14096fc98: mov r12, qword ptr [r12 + r14 + 0x10]
0x14096fc9d: jmp 0x14096fca7
0x14096fc9f: xor r14d, r14d
0x14096fca2: jmp 0x14096fcbc
0x14096fca4: xor r12d, r12d
0x14096fca7: mov r14, qword ptr [r15 + 0x50]
0x14096fcab: mov r14d, dword ptr [r14 + 8]
0x14096fcaf: not r14d
0x14096fcb2: imul r14, r14, 0xf8
0x14096fcb9: add r14, r12
0x14096fcbc: mov ebp, 1
0x14096fcc1: test bl, bl
0x14096fcc3: je 0x14096fbc5
0x14096fcc9: cmp ebp, edi
0x14096fccb: jne 0x14096fa53
0x14096fcd1: nop word ptr cs:[rax + rax]
0x14096fce0: cmp rsi, r9
0x14096fce3: je 0x14096fc07
0x14096fce9: mov edi, dword ptr [rsi]
0x14096fceb: add rsi, 4
0x14096fcef: mov rbx, qword ptr [r8 + 0x1a8]
0x14096fcf6: lea rdi, [rdi + rdi*8]
0x14096fcfa: cmp qword ptr [rbx + rdi*8 + 0x10], 0
0x14096fd00: je 0x14096fce0
0x14096fd02: jmp 0x14096fa53
0x14096fd07: lea r8, [rip + 0x5566902]
0x14096fd0e: mov edx, 3
0x14096fd13: call 0x145d99653
0x14096fd18: ud2

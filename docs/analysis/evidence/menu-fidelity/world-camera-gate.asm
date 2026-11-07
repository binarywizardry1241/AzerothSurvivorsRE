140c14d90: push      r15
140c14d92: push      r14
140c14d94: push      rsi
140c14d95: push      rdi
140c14d96: push      rbp
140c14d97: push      rbx
140c14d98: sub       rsp, 0x28
140c14d9c: mov       rcx, qword ptr [rsp + 0x80]
140c14da4: mov       rdx, qword ptr [rdx]
140c14da7: mov       rax, qword ptr [r9]
140c14daa: mov       rsi, qword ptr [rcx]
140c14dad: mov       rdi, qword ptr [rcx + 8]
140c14db1: mov       ebx, dword ptr [rcx + 0x14]
140c14db4: cmp       byte ptr [rdx], 2
140c14db7: je        0x140c14dc2
140c14db9: mov       rcx, qword ptr [r8]
140c14dbc: cmp       byte ptr [rcx + 0x48], 1
140c14dc0: jne       0x140c14dce
140c14dc2: mov       ecx, dword ptr [rax]
140c14dc4: add       ecx, -3
140c14dc7: mov       al, 1
140c14dc9: cmp       ecx, -2
140c14dcc: jb        0x140c14dd3
140c14dce: call      0x140811980
140c14dd3: mov       rcx, qword ptr [rsi + 0xf8]
140c14dda: mov       rdx, qword ptr [rsi + 0x100]
140c14de1: lea       rdx, [rcx + rdx*4]
140c14de5: cmp       byte ptr [rsi + 0x108], 0
140c14dec: je        0x140c14e7b
140c14df2: xor       r8d, r8d
140c14df5: xor       r10d, r10d
140c14df8: xor       r11d, r11d
140c14dfb: cmp       r11d, r8d
140c14dfe: jne       0x140c14e54
140c14e00: cmp       rcx, rdx
140c14e03: je        0x140c14f37
140c14e09: mov       r8d, dword ptr [rcx]
140c14e0c: add       rcx, 4
140c14e10: mov       r9, qword ptr [rdi + 0x1a8]
140c14e17: lea       r10, [r8 + r8*8]
140c14e1b: mov       r8, qword ptr [r9 + r10*8 + 0x10]
140c14e20: test      r8, r8
140c14e23: je        0x140c14e00
140c14e25: lea       r9, [r9 + r10*8]
140c14e29: mov       r10, qword ptr [rsi + 0x110]
140c14e30: mov       r11, qword ptr [r9 + 0x18]
140c14e34: mov       r9, qword ptr [r9 + 0x38]
140c14e38: mov       r9, qword ptr [r9 + r10*8]
140c14e3c: not       r9
140c14e3f: lea       r9, [r9 + r9*2]
140c14e43: shl       r9, 4
140c14e47: mov       r10, qword ptr [r11 + r9 + 0x10]
140c14e4c: mov       r9, qword ptr [r11 + r9 + 0x28]
140c14e51: xor       r11d, r11d
140c14e54: mov       r14d, r11d
140c14e57: inc       r11d
140c14e5a: imul      r15, r14, 0x110
140c14e61: cmp       al, byte ptr [r10 + r15 + 0x100]
140c14e69: je        0x140c14dfb
140c14e6b: add       r15, r10
140c14e6e: mov       dword ptr [r9 + r14*4], ebx
140c14e72: mov       byte ptr [r15 + 0x100], al
140c14e79: jmp       0x140c14dfb
140c14e7b: xor       r8d, r8d
140c14e7e: mov       r9d, 8
140c14e84: xor       r11d, r11d
140c14e87: xor       ebp, ebp
140c14e89: cmp       ebp, r8d
140c14e8c: jne       0x140c14efe
140c14e8e: nop
140c14e90: cmp       rcx, rdx
140c14e93: je        0x140c14f37
140c14e99: mov       r8d, dword ptr [rcx]
140c14e9c: add       rcx, 4
140c14ea0: mov       r9, qword ptr [rdi + 0x108]
140c14ea7: lea       r10, [r8 + r8*4]
140c14eab: shl       r10, 5
140c14eaf: mov       r8, qword ptr [r9 + r10 + 0x58]
140c14eb4: test      r8, r8
140c14eb7: je        0x140c14e90
140c14eb9: add       r9, r10
140c14ebc: mov       r10d, dword ptr [r9 + 0x94]
140c14ec3: mov       r11, qword ptr [rdi + 0x1a8]
140c14eca: lea       r10, [r10 + r10*8]
140c14ece: mov       r14, qword ptr [rsi + 0x110]
140c14ed5: mov       r15, qword ptr [r11 + r10*8 + 0x18]
140c14eda: mov       r10, qword ptr [r11 + r10*8 + 0x38]
140c14edf: mov       r10, qword ptr [r10 + r14*8]
140c14ee3: not       r10
140c14ee6: lea       r10, [r10 + r10*2]
140c14eea: shl       r10, 4
140c14eee: mov       r11, qword ptr [r15 + r10 + 0x10]
140c14ef3: mov       r10, qword ptr [r15 + r10 + 0x28]
140c14ef8: mov       r9, qword ptr [r9 + 0x50]
140c14efc: xor       ebp, ebp
140c14efe: mov       r14d, ebp
140c14f01: shl       r14, 4
140c14f05: inc       ebp
140c14f07: mov       r14d, dword ptr [r9 + r14 + 8]
140c14f0c: not       r14d
140c14f0f: imul      r15, r14, 0x110
140c14f16: cmp       al, byte ptr [r11 + r15 + 0x100]
140c14f1e: je        0x140c14e89
140c14f24: add       r15, r11
140c14f27: mov       dword ptr [r10 + r14*4], ebx
140c14f2b: mov       byte ptr [r15 + 0x100], al
140c14f32: jmp       0x140c14e89
140c14f37: add       rsp, 0x28
140c14f3b: pop       rbx
140c14f3c: pop       rbp
140c14f3d: pop       rdi
140c14f3e: pop       rsi
140c14f3f: pop       r14
140c14f41: pop       r15
140c14f43: ret

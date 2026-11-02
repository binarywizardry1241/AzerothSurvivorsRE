140196df0: push      r15
140196df2: push      r14
140196df4: push      r13
140196df6: push      r12
140196df8: push      rsi
140196df9: push      rdi
140196dfa: push      rbp
140196dfb: push      rbx
140196dfc: sub       rsp, 0xb8
140196e03: movaps    xmmword ptr [rsp + 0xa0], xmm7
140196e0b: movaps    xmmword ptr [rsp + 0x90], xmm6
140196e13: mov       r14, qword ptr [rdx]
140196e16: cmp       dword ptr [r14], 0
140196e1a: je        0x140197053
140196e20: mov       rax, qword ptr [rsp + 0x130]
140196e28: mov       r10, qword ptr [rsp + 0x128]
140196e30: mov       r11, qword ptr [rsp + 0x120]
140196e38: mov       rcx, qword ptr [rdx + 0x10]
140196e3c: mov       qword ptr [rsp + 0x50], rcx
140196e41: mov       ecx, dword ptr [rdx + 0x1c]
140196e44: mov       dword ptr [rsp + 0x2c], ecx
140196e48: mov       rcx, qword ptr [r8]
140196e4b: mov       rdx, qword ptr [r9]
140196e4e: mov       rdi, qword ptr [r11]
140196e51: mov       rbx, qword ptr [r11 + 8]
140196e55: mov       r8, qword ptr [r10]
140196e58: mov       qword ptr [rsp + 0x38], r8
140196e5d: mov       r12, qword ptr [r10 + 8]
140196e61: mov       r8, qword ptr [rax]
140196e64: mov       qword ptr [rsp + 0x30], r8
140196e69: mov       rbp, qword ptr [rax + 8]
140196e6d: mov       eax, dword ptr [rax + 0x14]
140196e70: mov       dword ptr [rsp + 0x44], eax
140196e74: mov       r13, qword ptr [r14]
140196e77: mov       r15, qword ptr [r14 + 8]
140196e7b: movss     xmm7, dword ptr [r14 + 0x10]
140196e81: movss     xmm6, dword ptr [r14 + 0x14]
140196e87: cmp       qword ptr [rcx + 0x18], 0
140196e8c: mov       qword ptr [rsp + 0x48], rdx
140196e91: je        0x140196f1d
140196e97: mov       rax, qword ptr [rcx]
140196e9a: mov       rcx, qword ptr [rcx + 8]
140196e9e: movabs    r8, 0x5317300c6b349d75
140196ea8: xor       esi, esi
140196eaa: movdqa    xmm0, xmmword ptr [rip + 0x5c362ce]
140196eb2: pcmpeqd   xmm1, xmm1
140196eb6: and       r8, rcx
140196eb9: movdqu    xmm2, xmmword ptr [rax + r8]
140196ebf: movdqa    xmm3, xmm2
140196ec3: pcmpeqb   xmm3, xmm0
140196ec7: pmovmskb  r9d, xmm3
140196ecc: test      r9d, r9d
140196ecf: je        0x140196f02
140196ed1: tzcnt     r10d, r9d
140196ed6: add       r10, r8
140196ed9: and       r10, rcx
140196edc: shl       r10, 2
140196ee0: mov       r11, rax
140196ee3: sub       r11, r10
140196ee6: mov       dl, 1
140196ee8: cmp       word ptr [r11 - 4], 0
140196eee: je        0x140196f54
140196ef0: lea       r10d, [r9 - 1]
140196ef4: and       r10w, r9w
140196ef8: mov       r9d, r10d
140196efb: mov       rdx, qword ptr [rsp + 0x48]
140196f00: jne       0x140196ed1
140196f02: pcmpeqb   xmm2, xmm1
140196f06: pmovmskb  r9d, xmm2
140196f0b: test      r9d, r9d
140196f0e: jne       0x140196f1d
140196f10: add       r8, rsi
140196f13: add       r8, 0x10
140196f17: add       rsi, 0x10
140196f1b: jmp       0x140196eb6
140196f1d: lea       rcx, [rsp + 0x58]
140196f22: call      0x14361df00
140196f27: cmp       qword ptr [rsp + 0x78], 0
140196f2d: setne     dl
140196f30: je        0x140196f54
140196f32: cmp       word ptr [rsp + 0x70], 0
140196f38: jne       0x140196f54
140196f3a: mov       rax, qword ptr [rsp + 0x60]
140196f3f: nop
140196f40: movdqa    xmm0, xmmword ptr [rax]
140196f44: add       rax, 0x10
140196f48: pmovmskb  ecx, xmm0
140196f4c: cmp       ecx, 0xffff
140196f52: je        0x140196f40
140196f54: mov       esi, edx
140196f56: lea       rcx, [rsp + 0x80]
140196f5e: mov       rdx, rdi
140196f61: mov       r8, rbx
140196f64: call      0x140180b10
140196f69: mov       eax, r15d
140196f6c: not       eax
140196f6e: lea       rcx, [rax + rax*2]
140196f72: shl       rcx, 3
140196f76: add       rcx, qword ptr [r12 + 8]
140196f7b: shr       r15, 0x20
140196f7f: cmp       rax, qword ptr [r12 + 0x10]
140196f84: lea       rax, [rip + 0x5c4e4bd]
140196f8b: cmovae    rcx, rax
140196f8f: cmp       dword ptr [rcx + 0x10], r15d
140196f93: jne       0x14019701b
140196f99: cmp       dword ptr [rcx], 0
140196f9c: je        0x14019701b
140196f9e: mov       rdi, qword ptr [rcx + 4]
140196fa2: mov       rdx, rdi
140196fa5: shr       rdx, 0x20
140196fa9: mov       r8, qword ptr [rsp + 0x38]
140196fae: cmp       qword ptr [r8 + 0x38], rdx
140196fb2: jbe       0x14019701b
140196fb4: mov       r8, rdi
140196fb7: shr       r8, 0x26
140196fbb: mov       r9, qword ptr [rsp + 0x38]
140196fc0: mov       r9, qword ptr [r9 + 0x28]
140196fc4: mov       r8, qword ptr [r9 + r8*8]
140196fc8: bt        r8, rdx
140196fcc: jae       0x14019701b
140196fce: mov       ecx, dword ptr [rcx + 0xc]
140196fd1: mov       rdx, qword ptr [r12 + 0x1a8]
140196fd9: lea       r8, [rcx + rcx*8]
140196fdd: mov       rcx, qword ptr [rsp + 0x38]
140196fe2: mov       rcx, qword ptr [rcx + 0x110]
140196fe9: cmp       rcx, qword ptr [rdx + r8*8 + 0x40]
140196fee: jae       0x140197077
140196ff4: lea       rdx, [rdx + r8*8]
140196ff8: mov       r8, qword ptr [rdx + 0x38]
140196ffc: mov       rcx, qword ptr [r8 + rcx*8]
140197000: test      rcx, rcx
140197003: je        0x140197077
140197005: mov       rdx, qword ptr [rdx + 0x18]
140197009: not       rcx
14019700c: lea       rcx, [rcx + rcx*2]
140197010: shl       rcx, 4
140197014: mov       rbx, qword ptr [rdx + rcx + 0x10]
140197019: jmp       0x140197079
14019701b: mov       ecx, r13d
14019701e: not       ecx
140197020: shr       r13, 0x20
140197024: lea       rdx, [rcx + rcx*2]
140197028: shl       rdx, 3
14019702c: add       rdx, qword ptr [rbp + 8]
140197030: cmp       rcx, qword ptr [rbp + 0x10]
140197034: cmovb     rax, rdx
140197038: cmp       dword ptr [rax + 0x10], r13d
14019703c: jne       0x140197041
14019703e: cmp       dword ptr [rax], 0
140197041: mov       rax, qword ptr [rsp + 0x50]
140197046: mov       ecx, dword ptr [rsp + 0x2c]
14019704a: mov       dword ptr [rax], ecx
14019704c: mov       dword ptr [r14], 0
140197053: movaps    xmm6, xmmword ptr [rsp + 0x90]
14019705b: movaps    xmm7, xmmword ptr [rsp + 0xa0]
140197063: add       rsp, 0xb8
14019706a: pop       rbx
14019706b: pop       rbp
14019706c: pop       rdi
14019706d: pop       rsi
14019706e: pop       r12
140197070: pop       r13
140197072: pop       r14
140197074: pop       r15
140197076: ret
140197077: xor       ebx, ebx
140197079: mov       ecx, r13d
14019707c: not       ecx
14019707e: shr       r13, 0x20
140197082: lea       rdx, [rcx + rcx*2]
140197086: shl       rdx, 3
14019708a: add       rdx, qword ptr [rbp + 8]
14019708e: cmp       rcx, qword ptr [rbp + 0x10]
140197092: cmovb     rax, rdx
140197096: cmp       dword ptr [rax + 0x10], r13d
14019709a: jne       0x140197041
14019709c: cmp       dword ptr [rax], 0
14019709f: je        0x140197041
1401970a1: mov       r12, qword ptr [rax + 4]
1401970a5: mov       rcx, r12
1401970a8: shr       rcx, 0x20
1401970ac: mov       rdx, qword ptr [rsp + 0x30]
1401970b1: cmp       qword ptr [rdx + 0x38], rcx
1401970b5: jbe       0x140197041
1401970b7: mov       rdx, r12
1401970ba: shr       rdx, 0x26
1401970be: mov       r8, qword ptr [rsp + 0x30]
1401970c3: mov       r8, qword ptr [r8 + 0x28]
1401970c7: mov       rdx, qword ptr [r8 + rdx*8]
1401970cb: bt        rdx, rcx
1401970cf: jae       0x140197041
1401970d5: mov       eax, dword ptr [rax + 0xc]
1401970d8: mov       r8, qword ptr [rbp + 0x1a8]
1401970df: lea       r9, [rax + rax*8]
1401970e3: mov       rax, qword ptr [rsp + 0x30]
1401970e8: mov       rdx, qword ptr [rax + 0x118]
1401970ef: mov       rax, qword ptr [r8 + r9*8 + 0x18]
1401970f4: mov       rcx, qword ptr [r8 + r9*8 + 0x38]
1401970f9: cmp       rdx, qword ptr [r8 + r9*8 + 0x40]
1401970fe: jae       0x14019711b
140197100: mov       rdx, qword ptr [rcx + rdx*8]
140197104: test      rdx, rdx
140197107: je        0x14019711b
140197109: not       rdx
14019710c: lea       rdx, [rdx + rdx*2]
140197110: shl       rdx, 4
140197114: mov       r13, qword ptr [rax + rdx + 0x10]
140197119: jmp       0x14019711e
14019711b: xor       r13d, r13d
14019711e: cmp       byte ptr [rsp + 0x80], 1
140197126: je        0x140197041
14019712c: test      sil, sil
14019712f: je        0x140197041
140197135: mov       rdx, qword ptr [rsp + 0x30]
14019713a: mov       rdx, qword ptr [rdx + 0x110]
140197141: mov       rcx, qword ptr [rcx + rdx*8]
140197145: not       rcx
140197148: lea       rcx, [rcx + rcx*2]
14019714c: shl       rcx, 4
140197150: mov       r14, qword ptr [rax + rcx + 0x10]
140197155: mov       r15, qword ptr [rax + rcx + 0x28]
14019715a: mov       rsi, qword ptr [rsp + 0x88]
140197162: cmp       dword ptr [rsi], 1
140197165: jne       0x1401971cf
140197167: movsd     xmm1, qword ptr [rsi + 8]
14019716c: pxor      xmm2, xmm2
140197170: ucomisd   xmm1, xmm2
140197174: jb        0x1401971cf
140197176: movsd     xmm0, qword ptr [rsi + 0x10]
14019717b: ucomisd   xmm0, xmm2
14019717f: jb        0x1401971cf
140197181: mov       eax, dword ptr [rsi + 0xc0]
140197187: xorps     xmm2, xmm2
14019718a: cvtsi2sd  xmm2, rax
14019718f: ucomisd   xmm2, xmm1
140197193: jbe       0x1401971cf
140197195: mov       eax, dword ptr [rsi + 0xc4]
14019719b: xorps     xmm1, xmm1
14019719e: cvtsi2sd  xmm1, rax
1401971a3: ucomisd   xmm1, xmm0
1401971a7: jbe       0x1401971cf
1401971a9: cvtsd2ss  xmm0, xmm0
1401971ad: lea       rax, [rsi + 0xc8]
1401971b4: lea       rcx, [rsi + 0xbc]
1401971bb: cmp       byte ptr [rsi + 0xb8], 0
1401971c2: cmovne    rax, rcx
1401971c6: divss     xmm0, dword ptr [rax]
1401971ca: jmp       0x140197257
1401971cf: lea       rcx, [rsp + 0x58]
1401971d4: mov       rdx, qword ptr [rsp + 0x48]
1401971d9: call      0x14361df00
1401971de: mov       rax, qword ptr [rsp + 0x78]
1401971e3: test      rax, rax
1401971e6: je        0x140197053
1401971ec: movzx     edx, word ptr [rsp + 0x70]
1401971f1: mov       rcx, qword ptr [rsp + 0x58]
1401971f6: test      dx, dx
1401971f9: jne       0x140197226
1401971fb: mov       r8, qword ptr [rsp + 0x60]
140197200: movdqa    xmm0, xmmword ptr [r8]
140197205: add       rcx, -0x880
14019720c: add       r8, 0x10
140197210: pmovmskb  edx, xmm0
140197214: xor       edx, 0xffff
14019721a: je        0x140197200
14019721c: mov       qword ptr [rsp + 0x60], r8
140197221: mov       qword ptr [rsp + 0x58], rcx
140197226: lea       r8d, [rdx - 1]
14019722a: tzcnt     r9d, edx
14019722f: and       r8d, edx
140197232: mov       word ptr [rsp + 0x70], r8w
140197238: mov       rdx, r9
14019723b: neg       rdx
14019723e: shl       r9d, 3
140197242: shl       rdx, 7
140197246: sub       rdx, r9
140197249: dec       rax
14019724c: mov       qword ptr [rsp + 0x78], rax
140197251: movss     xmm0, dword ptr [rcx + rdx - 4]
140197257: not       edi
140197259: imul      rax, rdi, 0x68
14019725d: add       rbx, rax
140197260: not       r12d
140197263: imul      rax, r12, 0x68
140197267: add       r13, rax
14019726a: movss     xmm1, dword ptr [r13 + 0x64]
140197270: movss     xmm4, dword ptr [r13 + 0x34]
140197276: mulss     xmm4, xmm1
14019727a: mulss     xmm1, dword ptr [r13 + 0x3c]
140197280: movss     xmm2, dword ptr [rip + 0x5c06018]
140197288: movaps    xmm3, xmm1
14019728b: maxss     xmm3, xmm2
14019728f: movaps    xmm5, xmm4
140197292: divss     xmm5, xmm3
140197296: movss     xmm3, dword ptr [rip + 0x5c3d82a]
14019729e: maxss     xmm3, xmm5
1401972a2: movaps    xmm5, xmm2
1401972a5: minss     xmm5, xmm3
1401972a9: subss     xmm2, xmm5
1401972ad: mulss     xmm2, dword ptr [rbx + 0x34]
1401972b2: xorps     xmm3, xmm3
1401972b5: ucomiss   xmm3, xmm2
1401972b8: jae       0x140197053
1401972be: subss     xmm1, xmm4
1401972c2: maxss     xmm1, xmm3
1401972c6: subss     xmm0, xmm7
1401972ca: lea       rax, [rsi + 0xc8]
1401972d1: lea       rcx, [rsi + 0xbc]
1401972d8: cmp       byte ptr [rsi + 0xb8], 0
1401972df: cmovne    rax, rcx
1401972e3: mulss     xmm0, dword ptr [rax]
1401972e7: divss     xmm0, xmm2
1401972eb: mulss     xmm0, xmm1
1401972ef: addss     xmm6, xmm0
1401972f3: maxss     xmm3, xmm6
1401972f7: minss     xmm1, xmm3
1401972fb: movss     xmm0, dword ptr [r14 + r12*8 + 4]
140197302: ucomiss   xmm0, xmm1
140197305: jne       0x14019730d
140197307: jnp       0x140197053
14019730d: mov       eax, dword ptr [rsp + 0x44]
140197311: mov       dword ptr [r15 + r12*4], eax
140197315: movss     dword ptr [r14 + r12*8 + 4], xmm1
14019731c: jmp       0x140197053

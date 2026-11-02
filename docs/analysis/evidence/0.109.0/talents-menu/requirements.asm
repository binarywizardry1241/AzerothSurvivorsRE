1459a00c0: push      r15
1459a00c2: push      r14
1459a00c4: push      r13
1459a00c6: push      r12
1459a00c8: push      rsi
1459a00c9: push      rdi
1459a00ca: push      rbp
1459a00cb: push      rbx
1459a00cc: sub       rsp, 0x28
1459a00d0: mov       rsi, r8
1459a00d3: mov       rdi, rdx
1459a00d6: mov       rbx, rcx
1459a00d9: cmp       dword ptr [rcx], 1
1459a00dc: jne       0x1459a0186
1459a00e2: mov       r15, qword ptr [rbx + 8]
1459a00e6: mov       r12, qword ptr [rbx + 0x10]
1459a00ea: mov       qword ptr [rbx + 8], 0
1459a00f2: test      r15, r15
1459a00f5: je        0x1459a017f
1459a00fb: movzx     ecx, byte ptr [rdi]
1459a00fe: mov       rdx, r15
1459a0101: mov       r8, r12
1459a0104: call      0x145912d90
1459a0109: test      rdx, rdx
1459a010c: je        0x1459a017f
1459a010e: mov       r13, qword ptr [rsi + 0x10]
1459a0112: test      r13, r13
1459a0115: je        0x1459a0172
1459a0117: mov       qword ptr [rsp + 0x20], rdx
1459a011c: mov       rbp, qword ptr [rsi + 8]
1459a0120: shl       r13, 4
1459a0124: xor       r14d, r14d
1459a0127: jmp       0x1459a0139
1459a0129: nop       dword ptr [rax]
1459a0130: add       r14, 0x10
1459a0134: cmp       r13, r14
1459a0137: je        0x1459a015f
1459a0139: mov       rax, qword ptr [rbp + r14]
1459a013e: cmp       qword ptr [rax + 0x28], r12
1459a0142: jne       0x1459a0130
1459a0144: mov       rcx, qword ptr [rax + 0x20]
1459a0148: mov       rdx, r15
1459a014b: mov       r8, r12
1459a014e: call      0x145bfa0e1
1459a0153: test      eax, eax
1459a0155: jne       0x1459a0130
1459a0157: movzx     ecx, byte ptr [rbp + r14 + 8]
1459a015d: jmp       0x1459a0161
1459a015f: xor       ecx, ecx
1459a0161: mov       rdx, qword ptr [rsp + 0x20]
1459a0166: mov       al, 1
1459a0168: cmp       cl, byte ptr [rdx + 0x72]
1459a016b: jb        0x1459a017f
1459a016d: jmp       0x1459a0220
1459a0172: xor       ecx, ecx
1459a0174: mov       al, 1
1459a0176: cmp       cl, byte ptr [rdx + 0x72]
1459a0179: jae       0x1459a0220
1459a017f: mov       qword ptr [rbx], 0
1459a0186: cmp       byte ptr [rbx + 0x18], 0
1459a018a: je        0x1459a021e
1459a0190: mov       r14, qword ptr [rbx + 0x20]
1459a0194: mov       r15, qword ptr [rbx + 0x28]
1459a0198: mov       qword ptr [rbx + 0x20], 0
1459a01a0: test      r14, r14
1459a01a3: je        0x1459a021e
1459a01a5: movzx     ecx, byte ptr [rdi]
1459a01a8: mov       rdx, r14
1459a01ab: mov       r8, r15
1459a01ae: call      0x145912d90
1459a01b3: test      rdx, rdx
1459a01b6: je        0x1459a021e
1459a01b8: mov       rdi, rdx
1459a01bb: mov       rbx, qword ptr [rsi + 0x10]
1459a01bf: test      rbx, rbx
1459a01c2: je        0x1459a0215
1459a01c4: mov       rsi, qword ptr [rsi + 8]
1459a01c8: shl       rbx, 4
1459a01cc: xor       r12d, r12d
1459a01cf: jmp       0x1459a01e9
1459a01d1: nop       word ptr cs:[rax + rax]
1459a01e0: add       r12, 0x10
1459a01e4: cmp       rbx, r12
1459a01e7: je        0x1459a0215
1459a01e9: mov       rax, qword ptr [rsi + r12]
1459a01ed: cmp       qword ptr [rax + 0x28], r15
1459a01f1: jne       0x1459a01e0
1459a01f3: mov       rcx, qword ptr [rax + 0x20]
1459a01f7: mov       rdx, r14
1459a01fa: mov       r8, r15
1459a01fd: call      0x145bfa0e1
1459a0202: test      eax, eax
1459a0204: jne       0x1459a01e0
1459a0206: movzx     ecx, byte ptr [rsi + r12 + 8]
1459a020c: mov       al, 1
1459a020e: cmp       cl, byte ptr [rdi + 0x72]
1459a0211: jb        0x1459a021e
1459a0213: jmp       0x1459a0220
1459a0215: xor       ecx, ecx
1459a0217: mov       al, 1
1459a0219: cmp       cl, byte ptr [rdi + 0x72]
1459a021c: jae       0x1459a0220
1459a021e: xor       eax, eax
1459a0220: add       rsp, 0x28
1459a0224: pop       rbx
1459a0225: pop       rbp
1459a0226: pop       rdi
1459a0227: pop       rsi
1459a0228: pop       r12
1459a022a: pop       r13
1459a022c: pop       r14
1459a022e: pop       r15
1459a0230: ret

; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e8400..0x1458e85e8 (488 bytes), SHA256 d3390a3aaa2514e5a475607ed0d88e6ec5a05cb89092bbd9b7abddeb5ab5a7c4
0x1458e8400: push rbp
0x1458e8401: push rsi
0x1458e8402: sub rsp, 0xa8
0x1458e8409: lea rbp, [rsp + 0x80]
0x1458e8411: mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
0x1458e8419: mov rsi, rcx
0x1458e841c: lea rdx, [rip + 0x15b0249]
0x1458e8423: lea rcx, [rbp - 0x38]
0x1458e8427: mov r8d, 0xe
0x1458e842d: call 0x145bb21f0
0x1458e8432: mov rax, qword ptr [rbp - 0x38]
0x1458e8436: cmp rax, -1
0x1458e843a: je 0x1458e846d
0x1458e843c: mov qword ptr [rbp + 0x18], rax
0x1458e8440: mov rcx, qword ptr [rbp - 0x30]
0x1458e8444: mov rdx, qword ptr [rbp - 0x28]
0x1458e8448: mov qword ptr [rbp + 0x10], rcx
0x1458e844c: call 0x145b9f6d0
0x1458e8451: nop
0x1458e8452: test rax, rax
0x1458e8455: je 0x1458e84f1
0x1458e845b: mov r8, rdx
0x1458e845e: lea rcx, [rbp - 0x10]
0x1458e8462: mov rdx, rax
0x1458e8465: call 0x145bc4e10
0x1458e846a: nop
0x1458e846b: jmp 0x1458e84d7
0x1458e846d: lea rdx, [rip + 0x15b0206]
0x1458e8474: lea rcx, [rbp - 0x10]
0x1458e8478: mov r8d, 7
0x1458e847e: call 0x145bb21f0
0x1458e8483: mov rax, qword ptr [rbp - 0x10]
0x1458e8487: cmp rax, -1
0x1458e848b: jne 0x1458e84ad
0x1458e848d: lea rdx, [rip + 0x13029ab]
0x1458e8494: lea rcx, [rbp - 0x10]
0x1458e8498: mov r8d, 0xd
0x1458e849e: call 0x145bb21f0
0x1458e84a3: mov rax, qword ptr [rbp - 0x10]
0x1458e84a7: cmp rax, -1
0x1458e84ab: je 0x1458e851d
0x1458e84ad: mov qword ptr [rbp + 0x18], rax
0x1458e84b1: mov rdx, qword ptr [rbp - 8]
0x1458e84b5: mov r8, qword ptr [rbp]
0x1458e84b9: mov qword ptr [rsp + 0x20], 0xd
0x1458e84c2: lea r9, [rip + 0x15b01b8]
0x1458e84c9: lea rcx, [rbp - 0x10]
0x1458e84cd: mov qword ptr [rbp + 0x10], rdx
0x1458e84d1: call 0x145b9f5a0
0x1458e84d6: nop
0x1458e84d7: movups xmm0, xmmword ptr [rbp - 0x10]
0x1458e84db: movups xmm1, xmmword ptr [rbp]
0x1458e84df: movups xmmword ptr [rsi + 0x10], xmm1
0x1458e84e3: movups xmmword ptr [rsi], xmm0
0x1458e84e6: mov rdx, qword ptr [rbp + 0x18]
0x1458e84ea: test rdx, rdx
0x1458e84ed: jne 0x1458e8501
0x1458e84ef: jmp 0x1458e8510
0x1458e84f1: mov qword ptr [rsi], 0xffffffffffffffff
0x1458e84f8: mov rdx, qword ptr [rbp + 0x18]
0x1458e84fc: test rdx, rdx
0x1458e84ff: je 0x1458e8510
0x1458e8501: mov r8d, 1
0x1458e8507: mov rcx, qword ptr [rbp + 0x10]
0x1458e850b: call 0x1400021d0
0x1458e8510: mov rax, rsi
0x1458e8513: add rsp, 0xa8
0x1458e851a: pop rsi
0x1458e851b: pop rbp
0x1458e851c: ret
0x1458e851d: lea rdx, [rip + 0x1302855]
0x1458e8524: lea rcx, [rbp - 0x58]
0x1458e8528: mov r8d, 4
0x1458e852e: call 0x145bb21f0
0x1458e8533: mov rax, qword ptr [rbp - 0x58]
0x1458e8537: cmp rax, -1
0x1458e853b: je 0x1458e85dc
0x1458e8541: mov qword ptr [rbp + 0x18], rax
0x1458e8545: mov rdx, qword ptr [rbp - 0x50]
0x1458e8549: mov r8, qword ptr [rbp - 0x48]
0x1458e854d: mov qword ptr [rsp + 0x20], 6
0x1458e8556: lea r9, [rip + 0x1302811]
0x1458e855d: lea rcx, [rbp - 0x10]
0x1458e8561: mov qword ptr [rbp + 0x10], rdx
0x1458e8565: call 0x145b9f5a0
0x1458e856a: nop
0x1458e856b: mov rdx, qword ptr [rbp - 8]
0x1458e856f: mov r8, qword ptr [rbp]
0x1458e8573: mov qword ptr [rsp + 0x20], 5
0x1458e857c: lea r9, [rip + 0x13027f1]
0x1458e8583: lea rcx, [rbp - 0x38]
0x1458e8587: mov qword ptr [rbp - 0x18], rdx
0x1458e858b: call 0x145b9f5a0
0x1458e8590: nop
0x1458e8591: mov rdx, qword ptr [rbp - 0x10]
0x1458e8595: test rdx, rdx
0x1458e8598: je 0x1458e85a9
0x1458e859a: mov r8d, 1
0x1458e85a0: mov rcx, qword ptr [rbp - 0x18]
0x1458e85a4: call 0x1400021d0
0x1458e85a9: mov rdx, qword ptr [rbp + 0x18]
0x1458e85ad: test rdx, rdx
0x1458e85b0: je 0x1458e85c1
0x1458e85b2: mov r8d, 1
0x1458e85b8: mov rcx, qword ptr [rbp + 0x10]
0x1458e85bc: call 0x1400021d0
0x1458e85c1: mov rax, qword ptr [rbp - 0x38]
0x1458e85c5: cmp rax, -1
0x1458e85c9: je 0x1458e85dc
0x1458e85cb: mov qword ptr [rbp + 0x18], rax
0x1458e85cf: mov rdx, qword ptr [rbp - 0x30]
0x1458e85d3: mov r8, qword ptr [rbp - 0x28]
0x1458e85d7: jmp 0x1458e84b9
0x1458e85dc: mov qword ptr [rsi], 0xffffffffffffffff
0x1458e85e3: jmp 0x1458e8510

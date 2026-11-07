; 0.115.0 selected button color/Node construction, ending before allocation seam.
000000014020e190: push rbp
000000014020e191: push r15
000000014020e193: push r14
000000014020e195: push r13
000000014020e197: push r12
000000014020e199: push rsi
000000014020e19a: push rdi
000000014020e19b: push rbx
000000014020e19c: sub rsp, 0x5a8
000000014020e1a3: lea rbp, [rsp + 0x80]
000000014020e1ab: movaps xmmword ptr [rbp + 0x510], xmm6
000000014020e1b2: mov qword ptr [rbp + 0x508], 0xfffffffffffffffe
000000014020e1bd: mov rdi, r9
000000014020e1c0: mov r14, r8
000000014020e1c3: mov rsi, rdx
000000014020e1c6: mov rbx, rcx
000000014020e1c9: lea rax, [rbp + 0x474]
000000014020e1d0: cmp byte ptr [rbp + 0x598], 0
000000014020e1d7: je 0x14020e21d
000000014020e1d9: movups xmm0, xmmword ptr [rip + 0x5d02a10]
000000014020e1e0: movaps xmmword ptr [rbp + 0x4e0], xmm0
000000014020e1e7: mov dword ptr [rbp + 0x4f0], 0x3f800000
000000014020e1f1: movaps xmmword ptr [rbp + 0x4c0], xmm0
000000014020e1f8: mov dword ptr [rbp + 0x4d0], 0x3f800000
000000014020e202: movaps xmmword ptr [rbp + 0x460], xmm0
000000014020e209: mov dword ptr [rbp + 0x470], 0x3f800000
000000014020e213: movss xmm0, dword ptr [rip + 0x5cd2095]
000000014020e21b: jmp 0x14020e266
000000014020e21d: movups xmm0, xmmword ptr [rip + 0x5d022b8]
000000014020e224: movaps xmmword ptr [rbp + 0x4e0], xmm0
000000014020e22b: mov dword ptr [rbp + 0x4f0], 0x3f800000
000000014020e235: movups xmm1, xmmword ptr [rip + 0x5d0228c]
000000014020e23c: movaps xmmword ptr [rbp + 0x4c0], xmm1
000000014020e243: mov dword ptr [rbp + 0x4d0], 0x3f800000
000000014020e24d: movaps xmmword ptr [rbp + 0x460], xmm0
000000014020e254: mov dword ptr [rbp + 0x470], 0x3f800000
000000014020e25e: movss xmm0, dword ptr [rip + 0x5cd1c4a]
000000014020e266: movups xmm1, xmmword ptr [rip + 0x5d02983]
000000014020e26d: movups xmmword ptr [rax], xmm1
000000014020e270: mov dword ptr [rax + 0x10], 0x3f800000
000000014020e277: mov word ptr [rbp + 0x344], 0
000000014020e280: mov byte ptr [rbp + 0x334], 1
000000014020e287: xorps xmm1, xmm1
000000014020e28a: movups xmmword ptr [rbp + 0x248], xmm1
000000014020e291: movups xmmword ptr [rbp + 0x258], xmm1
000000014020e298: movups xmmword ptr [rbp + 0x268], xmm1
000000014020e29f: movabs rax, 0x4210000000000001
000000014020e2a9: mov qword ptr [rbp + 0x278], rax
000000014020e2b0: mov qword ptr [rbp + 0x240], 0
000000014020e2bb: movaps xmmword ptr [rbp + 0x280], xmm1
000000014020e2c2: mov qword ptr [rbp + 0x290], 0
000000014020e2cd: mov dword ptr [rbp + 0x358], 0
000000014020e2d7: mov word ptr [rbp + 0x35c], 0x500
000000014020e2e0: movups xmm1, xmmword ptr [rip + 0x5d02719]
000000014020e2e7: movups xmmword ptr [rbp + 0x298], xmm1
000000014020e2ee: movups xmm1, xmmword ptr [rip + 0x5d0271b]
000000014020e2f5: movups xmmword ptr [rbp + 0x2a8], xmm1
000000014020e2fc: movaps xmm1, xmmword ptr [rip + 0x5cd1f5d]
000000014020e303: movups xmmword ptr [rbp + 0x2b8], xmm1
000000014020e30a: movaps xmm1, xmmword ptr [rip + 0x5cd1c8f]
000000014020e311: movups xmmword ptr [rbp + 0x2c8], xmm1
000000014020e318: mov dword ptr [rbp + 0x2d8], 1
000000014020e322: movss dword ptr [rbp + 0x2dc], xmm0
000000014020e32a: mov dword ptr [rbp + 0x2e0], 1
000000014020e334: movss dword ptr [rbp + 0x2e4], xmm0
000000014020e33c: mov dword ptr [rbp + 0x2e8], 1
000000014020e346: movss dword ptr [rbp + 0x2ec], xmm0
000000014020e34e: mov dword ptr [rbp + 0x2f0], 1
000000014020e358: movss dword ptr [rbp + 0x2f4], xmm0
000000014020e360: movaps xmm0, xmmword ptr [rip + 0x5cd1f79]
000000014020e367: movups xmmword ptr [rbp + 0x2f8], xmm0
000000014020e36e: movups xmmword ptr [rbp + 0x308], xmm0
000000014020e375: mov byte ptr [rbp + 0x356], 0
000000014020e37c: mov dword ptr [rbp + 0x352], 0
000000014020e386: mov qword ptr [rbp + 0x338], 0
000000014020e391: mov dword ptr [rbp + 0x340], 0x3f800000
000000014020e39b: movaps xmm0, xmmword ptr [rip + 0x5cd1b5e]
000000014020e3a2: movups xmmword ptr [rbp + 0x318], xmm0
000000014020e3a9: mov dword ptr [rbp + 0x328], 1
000000014020e3b3: mov qword ptr [rbp + 0x32c], 0
000000014020e3be: mov byte ptr [rbp + 0x357], 0
000000014020e3c5: movups xmm0, xmmword ptr [rip + 0x5d0257c]
000000014020e3cc: movaps xmmword ptr [rbp + 0x1e0], xmm0
000000014020e3d3: mov qword ptr [rbp + 0x1f0], 0
000000014020e3de: movups xmm0, xmmword ptr [rip + 0x5d0257b]
000000014020e3e5: movups xmmword ptr [rbp + 0x1f8], xmm0
000000014020e3ec: mov qword ptr [rbp + 0x208], 0
000000014020e3f7: movups xmm0, xmmword ptr [rip + 0x5d0257a]
000000014020e3fe: movaps xmmword ptr [rbp + 0x210], xmm0
000000014020e405: mov qword ptr [rbp + 0x220], 0
000000014020e410: movups xmm0, xmmword ptr [rip + 0x5d02579]
000000014020e417: movups xmmword ptr [rbp + 0x228], xmm0
000000014020e41e: mov qword ptr [rbp + 0x238], 0
000000014020e429: mov word ptr [rbp + 0x34a], 0
000000014020e432: mov dword ptr [rbp + 0x346], 0x10000
000000014020e43c: mov word ptr [rbp + 0x350], 0
000000014020e445: mov dword ptr [rbp + 0x34c], 0x10000
000000014020e44f: mov eax, dword ptr [rbp + 0x4f0]
000000014020e455: mov dword ptr [rbp + 0x420], eax
000000014020e45b: movaps xmm0, xmmword ptr [rbp + 0x4e0]
000000014020e462: movaps xmmword ptr [rbp + 0x410], xmm0
000000014020e469: movups xmmword ptr [rbp + 0x424], xmm0
000000014020e470: mov dword ptr [rbp + 0x434], eax
000000014020e476: movups xmmword ptr [rbp + 0x438], xmm0
000000014020e47d: mov dword ptr [rbp + 0x448], eax
000000014020e483: movups xmmword ptr [rbp + 0x44c], xmm0
000000014020e48a: mov dword ptr [rbp + 0x45c], eax

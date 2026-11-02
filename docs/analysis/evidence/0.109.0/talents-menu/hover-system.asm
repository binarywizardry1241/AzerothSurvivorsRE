14007f3b0: push      r14
14007f3b2: push      rsi
14007f3b3: push      rdi
14007f3b4: push      rbp
14007f3b5: push      rbx
14007f3b6: sub       rsp, 0x50
14007f3ba: mov       ebp, 1
14007f3bf: lock xadd dword ptr [r8 + 0x5b0], ebp
14007f3c8: cmp       qword ptr [rdx + 0x40], -1
14007f3cd: je        0x14007f437
14007f3cf: mov       rbx, r8
14007f3d2: mov       rsi, rdx
14007f3d5: mov       rax, qword ptr [r8 + 0x5a0]
14007f3dc: mov       qword ptr [rsp + 0x38], rax
14007f3e1: cmp       qword ptr [rdx + 0x138], rax
14007f3e8: jne       0x14007f451
14007f3ea: mov       rdi, rcx
14007f3ed: mov       r14d, dword ptr [rsi + 0x140]
14007f3f4: mov       rcx, rsi
14007f3f7: mov       rdx, rbx
14007f3fa: call      0x1403aa3a0
14007f3ff: mov       qword ptr [rsp + 0x38], rsi
14007f404: mov       qword ptr [rsp + 0x40], rbx
14007f409: mov       dword ptr [rsp + 0x48], r14d
14007f40e: mov       dword ptr [rsp + 0x4c], ebp
14007f412: lea       rdx, [rsp + 0x38]
14007f417: call      0x140076b00
14007f41c: mov       dword ptr [rsi + 0x140], ebp
14007f422: mov       qword ptr [rdi], 0xfffffffffffffffd
14007f429: mov       rax, rdi
14007f42c: add       rsp, 0x50
14007f430: pop       rbx
14007f431: pop       rbp
14007f432: pop       rdi
14007f433: pop       rsi
14007f434: pop       r14
14007f436: ret
14007f437: lea       rcx, [rip + 0x5d51672]
14007f43e: lea       r8, [rip + 0x5d516cb]
14007f445: mov       edx, 0x59
14007f44a: call      0x145d99570
14007f44f: ud2
14007f451: add       rsi, 0x138
14007f458: lea       rax, [rip + 0x5d51739]
14007f45f: mov       qword ptr [rsp + 0x28], rax
14007f464: mov       qword ptr [rsp + 0x20], 0xdf
14007f46d: lea       r9, [rip + 0x5d516b4]
14007f474: lea       r8, [rsp + 0x38]
14007f479: xor       ecx, ecx
14007f47b: mov       rdx, rsi
14007f47e: call      0x145d4891d
14007f483: ud2

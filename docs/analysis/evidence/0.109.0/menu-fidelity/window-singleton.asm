14019bd00: push      r15
14019bd02: push      r14
14019bd04: push      r12
14019bd06: push      rsi
14019bd07: push      rdi
14019bd08: push      rbp
14019bd09: push      rbx
14019bd0a: sub       rsp, 0x50
14019bd0e: mov       ebp, 1
14019bd13: lock xadd dword ptr [r8 + 0x5b0], ebp
14019bd1c: cmp       qword ptr [rdx + 0x100], -1
14019bd24: je        0x14019bdc7
14019bd2a: mov       rbx, r8
14019bd2d: mov       rsi, rdx
14019bd30: mov       rax, qword ptr [r8 + 0x5a0]
14019bd37: mov       qword ptr [rsp + 0x30], rax
14019bd3c: cmp       qword ptr [rdx + 8], rax
14019bd40: jne       0x14019bde1
14019bd46: mov       rdi, rcx
14019bd49: lea       r14, [rsi + 0x10]
14019bd4d: mov       r15d, dword ptr [rsi]
14019bd50: lea       r12, [rsi + 0x128]
14019bd57: mov       rcx, r14
14019bd5a: mov       rdx, rbx
14019bd5d: call      0x140382bb0
14019bd62: mov       qword ptr [rsp + 0x48], r12
14019bd67: cmp       byte ptr [rsi + 0x128], 0
14019bd6e: jne       0x14019bdac
14019bd70: mov       qword ptr [rsp + 0x38], rbx
14019bd75: mov       qword ptr [rsp + 0x30], r14
14019bd7a: mov       dword ptr [rsp + 0x40], r15d
14019bd7f: mov       dword ptr [rsp + 0x44], ebp
14019bd83: lea       rcx, [rsp + 0x30]
14019bd88: call      0x1401808f0
14019bd8d: test      eax, eax
14019bd8f: je        0x14019bdac
14019bd91: mov       qword ptr [rsp + 0x30], rax
14019bd96: lea       rcx, [rip + 0x5c498c3]
14019bd9d: lea       rdx, [rsp + 0x30]
14019bda2: lea       r8, [rsp + 0x48]
14019bda7: call      0x140041730
14019bdac: mov       dword ptr [rsi], ebp
14019bdae: mov       qword ptr [rdi], 0xfffffffffffffffd
14019bdb5: mov       rax, rdi
14019bdb8: add       rsp, 0x50
14019bdbc: pop       rbx
14019bdbd: pop       rbp
14019bdbe: pop       rdi
14019bdbf: pop       rsi
14019bdc0: pop       r12
14019bdc2: pop       r14
14019bdc4: pop       r15
14019bdc6: ret
14019bdc7: lea       rcx, [rip + 0x5c4b29a]
14019bdce: lea       r8, [rip + 0x5c4b2f3]
14019bdd5: mov       edx, 0x59
14019bdda: call      0x145d99570
14019bddf: ud2
14019bde1: add       rsi, 8
14019bde5: lea       rax, [rip + 0x5c4b364]
14019bdec: mov       qword ptr [rsp + 0x28], rax
14019bdf1: mov       qword ptr [rsp + 0x20], 0xdf
14019bdfa: lea       r9, [rip + 0x5c4b2df]
14019be01: lea       r8, [rsp + 0x30]
14019be06: xor       ecx, ecx
14019be08: mov       rdx, rsi
14019be0b: call      0x145d4891d
14019be10: ud2

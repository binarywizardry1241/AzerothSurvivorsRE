14590fd60: push      r14
14590fd62: push      rsi
14590fd63: push      rdi
14590fd64: push      rbp
14590fd65: push      rbx
14590fd66: sub       rsp, 0x20
14590fd6a: mov       ebx, r8d
14590fd6d: mov       rdi, rdx
14590fd70: mov       rsi, rcx
14590fd73: mov       rcx, rdx
14590fd76: mov       edx, r8d
14590fd79: xor       r8d, r8d
14590fd7c: mov       r9b, 7
14590fd7f: call      0x145910430
14590fd84: mov       ebp, eax
14590fd86: mov       r8d, 1
14590fd8c: mov       rcx, rdi
14590fd8f: mov       edx, ebx
14590fd91: mov       r9b, 7
14590fd94: call      0x145910430
14590fd99: mov       r14d, eax
14590fd9c: mov       r8d, 2
14590fda2: mov       rcx, rdi
14590fda5: mov       edx, ebx
14590fda7: mov       r9b, 7
14590fdaa: call      0x145910430
14590fdaf: mov       dword ptr [rsi], ebp
14590fdb1: mov       dword ptr [rsi + 4], r14d
14590fdb5: mov       dword ptr [rsi + 8], eax
14590fdb8: mov       rax, rsi
14590fdbb: add       rsp, 0x20
14590fdbf: pop       rbx
14590fdc0: pop       rbp
14590fdc1: pop       rdi
14590fdc2: pop       rsi
14590fdc3: pop       r14
14590fdc5: ret

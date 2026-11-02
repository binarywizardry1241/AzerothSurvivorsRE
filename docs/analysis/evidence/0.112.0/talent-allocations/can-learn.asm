14599f980: push      r15
14599f982: push      r14
14599f984: push      r13
14599f986: push      r12
14599f988: push      rsi
14599f989: push      rdi
14599f98a: push      rbp
14599f98b: push      rbx
14599f98c: sub       rsp, 0x68
14599f990: mov       r14, r9
14599f993: mov       r15, r8
14599f996: mov       ebx, edx
14599f998: mov       rsi, rcx
14599f99b: mov       ecx, edx
14599f99d: mov       rdx, r8
14599f9a0: mov       r8, r9
14599f9a3: call      0x1459a2ab0
14599f9a8: test      rdx, rdx
14599f9ab: je        0x14599fb10
14599f9b1: mov       r8, rax
14599f9b4: mov       rdi, rdx
14599f9b7: mov       ecx, dword ptr [rsp + 0xd0]
14599f9be: mov       r13, qword ptr [rsi + 0x10]
14599f9c2: test      r13, r13
14599f9c5: je        0x14599f9e3
14599f9c7: mov       qword ptr [rsp + 0x30], r8
14599f9cc: mov       rbp, qword ptr [rsi + 8]
14599f9d0: mov       eax, r13d
14599f9d3: and       eax, 3
14599f9d6: cmp       r13, 4
14599f9da: jae       0x14599f9fe
14599f9dc: xor       r8d, r8d
14599f9df: xor       edx, edx
14599f9e1: jmp       0x14599fa41
14599f9e3: xor       eax, eax
14599f9e5: test      ecx, ecx
14599f9e7: je        0x14599fb12
14599f9ed: cmp       al, byte ptr [rdi + 0x9a]
14599f9f3: jae       0x14599fb10
14599f9f9: jmp       0x14599fadb
14599f9fe: mov       r9, r13
14599fa01: and       r9, 0xfffffffffffffffc
14599fa05: lea       r10, [rbp + 0x38]
14599fa09: xor       r8d, r8d
14599fa0c: xor       edx, edx
14599fa0e: nop
14599fa10: movzx     r11d, byte ptr [r10 - 0x30]
14599fa15: add       r11d, edx
14599fa18: movzx     edx, byte ptr [r10 - 0x20]
14599fa1d: movzx     r12d, byte ptr [r10 - 0x10]
14599fa22: add       r12d, edx
14599fa25: add       r12d, r11d
14599fa28: movzx     edx, byte ptr [r10]
14599fa2c: add       edx, r12d
14599fa2f: add       r8, 4
14599fa33: add       r10, 0x40
14599fa37: cmp       r9, r8
14599fa3a: jne       0x14599fa10
14599fa3c: test      rax, rax
14599fa3f: je        0x14599fa71
14599fa41: shl       r8, 4
14599fa45: add       r8, rbp
14599fa48: add       r8, 8
14599fa4c: shl       eax, 4
14599fa4f: xor       r9d, r9d
14599fa52: nop       word ptr cs:[rax + rax]
14599fa60: movzx     r10d, byte ptr [r8 + r9]
14599fa65: add       edx, r10d
14599fa68: add       r9, 0x10
14599fa6c: cmp       rax, r9
14599fa6f: jne       0x14599fa60
14599fa71: cmp       edx, ecx
14599fa73: jae       0x14599fb10
14599fa79: shl       r13, 4
14599fa7d: xor       r12d, r12d
14599fa80: jmp       0x14599fa99
14599fa82: nop       word ptr cs:[rax + rax]
14599fa90: add       r12, 0x10
14599fa94: cmp       r13, r12
14599fa97: je        0x14599facc
14599fa99: mov       rax, qword ptr [rbp + r12]
14599fa9e: cmp       qword ptr [rax + 0x38], r14
14599faa2: jne       0x14599fa90
14599faa4: mov       rcx, qword ptr [rax + 0x30]
14599faa8: mov       rdx, r15
14599faab: mov       r8, r14
14599faae: call      0x145c0a3e7
14599fab3: test      eax, eax
14599fab5: jne       0x14599fa90
14599fab7: movzx     eax, byte ptr [rbp + r12 + 8]
14599fabd: mov       r8, qword ptr [rsp + 0x30]
14599fac2: cmp       al, byte ptr [rdi + 0x9a]
14599fac8: jb        0x14599fadb
14599faca: jmp       0x14599fb10
14599facc: xor       eax, eax
14599face: mov       r8, qword ptr [rsp + 0x30]
14599fad3: cmp       al, byte ptr [rdi + 0x9a]
14599fad9: jae       0x14599fb10
14599fadb: movzx     r9d, byte ptr [rdi + 0x98]
14599fae3: mov       rcx, rsi
14599fae6: mov       edx, ebx
14599fae8: call      0x14599fb70
14599faed: movzx     ecx, byte ptr [rdi + 0x98]
14599faf4: lea       ecx, [rcx + rcx*4]
14599faf7: cmp       eax, ecx
14599faf9: jb        0x14599fb10
14599fafb: mov       rcx, rsi
14599fafe: mov       edx, ebx
14599fb00: mov       r8, r15
14599fb03: mov       r9, r14
14599fb06: call      0x14599f210
14599fb0b: test      rax, rax
14599fb0e: je        0x14599fb23
14599fb10: xor       eax, eax
14599fb12: add       rsp, 0x68
14599fb16: pop       rbx
14599fb17: pop       rbp
14599fb18: pop       rdi
14599fb19: pop       rsi
14599fb1a: pop       r12
14599fb1c: pop       r13
14599fb1e: pop       r14
14599fb20: pop       r15
14599fb22: ret
14599fb23: mov       byte ptr [rsp + 0x2f], bl
14599fb27: mov       rax, qword ptr [rdi]
14599fb2a: test      rax, rax
14599fb2d: je        0x14599fb6c
14599fb2f: mov       rcx, qword ptr [rdi + 8]
14599fb33: movups    xmm0, xmmword ptr [rdi + 0x10]
14599fb37: mov       qword ptr [rsp + 0x38], 1
14599fb40: mov       qword ptr [rsp + 0x40], rax
14599fb45: mov       qword ptr [rsp + 0x48], rcx
14599fb4a: mov       qword ptr [rsp + 0x50], 1
14599fb53: movups    xmmword ptr [rsp + 0x58], xmm0
14599fb58: lea       rcx, [rsp + 0x38]
14599fb5d: lea       rdx, [rsp + 0x2f]
14599fb62: mov       r8, rsi
14599fb65: call      0x1459924d0
14599fb6a: jmp       0x14599fb12
14599fb6c: mov       al, 1
14599fb6e: jmp       0x14599fb12

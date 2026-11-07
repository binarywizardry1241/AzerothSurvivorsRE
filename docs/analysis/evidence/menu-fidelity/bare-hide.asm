14007e830: push      r14
14007e832: push      rsi
14007e833: push      rdi
14007e834: push      rbp
14007e835: push      rbx
14007e836: sub       rsp, 0x40
14007e83a: mov       ebp, 1
14007e83f: lock xadd dword ptr [r8 + 0x5b0], ebp
14007e848: cmp       qword ptr [rdx + 0x100], -1
14007e850: je        0x14007e9f0
14007e856: mov       rdi, r8
14007e859: mov       rsi, rdx
14007e85c: mov       rax, qword ptr [r8 + 0x5a0]
14007e863: mov       qword ptr [rsp + 0x38], rax
14007e868: cmp       qword ptr [rdx + 8], rax
14007e86c: jne       0x14007ea0a
14007e872: mov       rbx, rcx
14007e875: lea       rcx, [rsi + 0x10]
14007e879: mov       rdx, rdi
14007e87c: call      0x140387410
14007e881: mov       rax, qword ptr [rsi + 0x108]
14007e888: mov       rcx, qword ptr [rsi + 0x110]
14007e88f: lea       rcx, [rax + rcx*4]
14007e893: cmp       byte ptr [rsi + 0x118], 0
14007e89a: je        0x14007e8a6
14007e89c: xor       edx, edx
14007e89e: xor       r9d, r9d
14007e8a1: xor       r10d, r10d
14007e8a4: jmp       0x14007e8fe
14007e8a6: xor       edx, edx
14007e8a8: mov       r8d, 8
14007e8ae: xor       r10d, r10d
14007e8b1: xor       r11d, r11d
14007e8b4: jmp       0x14007e9a1
14007e8b9: nop       dword ptr [rax]
14007e8c0: lea       r8, [r8 + r9*8]
14007e8c4: mov       r9, qword ptr [rsi + 0x120]
14007e8cb: mov       r10, qword ptr [r8 + 0x18]
14007e8cf: mov       r8, qword ptr [r8 + 0x38]
14007e8d3: mov       r8, qword ptr [r8 + r9*8]
14007e8d7: not       r8
14007e8da: lea       r8, [r8 + r8*2]
14007e8de: shl       r8, 4
14007e8e2: mov       r9, qword ptr [r10 + r8 + 0x10]
14007e8e7: mov       r8, qword ptr [r10 + r8 + 0x28]
14007e8ec: xor       r10d, r10d
14007e8ef: mov       r11d, r10d
14007e8f2: inc       r10d
14007e8f5: mov       dword ptr [r8 + r11*4], ebp
14007e8f9: mov       byte ptr [r9 + r11], 1
14007e8fe: cmp       r10d, edx
14007e901: jne       0x14007e8ef
14007e903: nop       word ptr cs:[rax + rax]
14007e910: cmp       rax, rcx
14007e913: je        0x14007e9d9
14007e919: mov       edx, dword ptr [rax]
14007e91b: add       rax, 4
14007e91f: mov       r8, qword ptr [rdi + 0x1a8]
14007e926: lea       r9, [rdx + rdx*8]
14007e92a: mov       rdx, qword ptr [r8 + r9*8 + 0x10]
14007e92f: test      rdx, rdx
14007e932: je        0x14007e910
14007e934: jmp       0x14007e8c0
14007e936: nop       word ptr cs:[rax + rax]
14007e940: add       r8, r9
14007e943: mov       r9d, dword ptr [r8 + 0x94]
14007e94a: mov       r10, qword ptr [rdi + 0x1a8]
14007e951: lea       r9, [r9 + r9*8]
14007e955: mov       r11, qword ptr [rsi + 0x120]
14007e95c: mov       r14, qword ptr [r10 + r9*8 + 0x18]
14007e961: mov       r9, qword ptr [r10 + r9*8 + 0x38]
14007e966: mov       r9, qword ptr [r9 + r11*8]
14007e96a: not       r9
14007e96d: lea       r9, [r9 + r9*2]
14007e971: shl       r9, 4
14007e975: mov       r10, qword ptr [r14 + r9 + 0x10]
14007e97a: mov       r9, qword ptr [r14 + r9 + 0x28]
14007e97f: mov       r8, qword ptr [r8 + 0x50]
14007e983: xor       r11d, r11d
14007e986: mov       r14d, r11d
14007e989: shl       r14, 4
14007e98d: inc       r11d
14007e990: mov       r14d, dword ptr [r8 + r14 + 8]
14007e995: not       r14d
14007e998: mov       dword ptr [r9 + r14*4], ebp
14007e99c: mov       byte ptr [r10 + r14], 1
14007e9a1: cmp       r11d, edx
14007e9a4: jne       0x14007e986
14007e9a6: nop       word ptr cs:[rax + rax]
14007e9b0: cmp       rax, rcx
14007e9b3: je        0x14007e9d9
14007e9b5: mov       edx, dword ptr [rax]
14007e9b7: add       rax, 4
14007e9bb: mov       r8, qword ptr [rdi + 0x108]
14007e9c2: lea       r9, [rdx + rdx*4]
14007e9c6: shl       r9, 5
14007e9ca: mov       rdx, qword ptr [r8 + r9 + 0x58]
14007e9cf: test      rdx, rdx
14007e9d2: je        0x14007e9b0
14007e9d4: jmp       0x14007e940
14007e9d9: mov       dword ptr [rsi], ebp
14007e9db: mov       qword ptr [rbx], 0xfffffffffffffffd
14007e9e2: mov       rax, rbx
14007e9e5: add       rsp, 0x40
14007e9e9: pop       rbx
14007e9ea: pop       rbp
14007e9eb: pop       rdi
14007e9ec: pop       rsi
14007e9ed: pop       r14
14007e9ef: ret
14007e9f0: lea       rcx, [rip + 0x5d520b9]
14007e9f7: lea       r8, [rip + 0x5d52112]
14007e9fe: mov       edx, 0x59
14007ea03: call      0x145d99570
14007ea08: ud2
14007ea0a: add       rsi, 8
14007ea0e: lea       rax, [rip + 0x5d52183]
14007ea15: mov       qword ptr [rsp + 0x28], rax
14007ea1a: mov       qword ptr [rsp + 0x20], 0xdf
14007ea23: lea       r9, [rip + 0x5d520fe]
14007ea2a: lea       r8, [rsp + 0x38]
14007ea2f: xor       ecx, ecx
14007ea31: mov       rdx, rsi
14007ea34: call      0x145d4891d
14007ea39: ud2

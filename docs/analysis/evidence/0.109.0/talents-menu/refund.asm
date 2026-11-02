14590fdd0: push      rbp
14590fdd1: push      r15
14590fdd3: push      r14
14590fdd5: push      r13
14590fdd7: push      r12
14590fdd9: push      rsi
14590fdda: push      rdi
14590fddb: push      rbx
14590fddc: sub       rsp, 0x68
14590fde0: lea       rbp, [rsp + 0x60]
14590fde5: mov       qword ptr [rbp], 0xfffffffffffffffe
14590fded: mov       r13, qword ptr [rcx + 0x10]
14590fdf1: test      r13, r13
14590fdf4: je        0x145910146
14590fdfa: mov       r14, r9
14590fdfd: mov       r15, r8
14590fe00: mov       ebx, edx
14590fe02: mov       rsi, rcx
14590fe05: mov       rdi, qword ptr [rcx + 8]
14590fe09: mov       r8, r13
14590fe0c: shl       r8, 4
14590fe10: xor       r12d, r12d
14590fe13: mov       qword ptr [rbp - 0x10], r8
14590fe17: jmp       0x14590fe2d
14590fe19: nop       dword ptr [rax]
14590fe20: add       r12, 0x10
14590fe24: cmp       r8, r12
14590fe27: je        0x145910146
14590fe2d: mov       rax, qword ptr [rdi + r12]
14590fe31: cmp       qword ptr [rax + 0x28], r14
14590fe35: jne       0x14590fe20
14590fe37: mov       rcx, qword ptr [rax + 0x20]
14590fe3b: mov       rdx, r15
14590fe3e: mov       r8, r14
14590fe41: call      0x145bfa0e1
14590fe46: mov       r8, qword ptr [rbp - 0x10]
14590fe4a: test      eax, eax
14590fe4c: jne       0x14590fe20
14590fe4e: mov       rax, r13
14590fe51: shr       rax, 0x3c
14590fe55: setne     al
14590fe58: movabs    rcx, 0x7ffffffffffffff8
14590fe62: cmp       r8, rcx
14590fe65: seta      cl
14590fe68: or        cl, al
14590fe6a: je        0x14590fe7c
14590fe6c: xor       r14d, r14d
14590fe6f: mov       rcx, r14
14590fe72: mov       rdx, r8
14590fe75: call      0x145d992bb
14590fe7a: ud2
14590fe7c: call      0x140002200
14590fe81: mov       r14d, 8
14590fe87: mov       edx, 8
14590fe8c: mov       rcx, qword ptr [rbp - 0x10]
14590fe90: call      0x1400021c0
14590fe95: mov       r8, qword ptr [rbp - 0x10]
14590fe99: test      rax, rax
14590fe9c: je        0x14590fe6f
14590fe9e: mov       r15, rax
14590fea1: mov       rcx, rax
14590fea4: mov       rdx, rdi
14590fea7: call      0x145bfa0e7
14590feac: dec       byte ptr [r15 + r12 + 8]
14590feb1: lea       rax, [r15 + 0x18]
14590feb5: xor       r14d, r14d
14590feb8: nop       dword ptr [rax + rax]
14590fec0: cmp       byte ptr [rax - 0x10], 0
14590fec4: je        0x145910159
14590feca: inc       r14
14590fecd: add       rax, 0x10
14590fed1: cmp       r13, r14
14590fed4: jne       0x14590fec0
14590fed6: mov       r14, r13
14590fed9: movabs    r9, 0x7ffffffffffffff8
14590fee3: mov       qword ptr [rbp - 8], r15
14590fee7: mov       r15, r14
14590feea: shl       r15, 4
14590feee: mov       rax, r14
14590fef1: shr       rax, 0x3c
14590fef5: setne     al
14590fef8: cmp       r15, r9
14590fefb: seta      cl
14590fefe: or        cl, al
14590ff00: je        0x14590ff13
14590ff02: xor       r12d, r12d
14590ff05: mov       rcx, r12
14590ff08: mov       rdx, r15
14590ff0b: call      0x145d992bb
14590ff10: nop
14590ff11: ud2
14590ff13: test      r15, r15
14590ff16: je        0x14590ffa8
14590ff1c: call      0x140002200
14590ff21: mov       r12d, 8
14590ff27: mov       edx, 8
14590ff2c: mov       rcx, r15
14590ff2f: call      0x1400021c0
14590ff34: test      rax, rax
14590ff37: je        0x14590ff05
14590ff39: mov       r12, r14
14590ff3c: test      r14, r14
14590ff3f: je        0x14590ff56
14590ff41: mov       rcx, rax
14590ff44: mov       rdx, qword ptr [rbp - 8]
14590ff48: mov       r8, r15
14590ff4b: mov       r15, rax
14590ff4e: call      0x145bfa0e7
14590ff53: mov       rax, r15
14590ff56: mov       qword ptr [rbp - 0x40], r12
14590ff5a: mov       qword ptr [rbp - 0x38], rax
14590ff5e: mov       qword ptr [rbp - 0x30], r14
14590ff62: lea       rcx, [rbp - 0x28]
14590ff66: lea       rdx, [rbp - 0x40]
14590ff6a: mov       r8d, ebx
14590ff6d: mov       r9d, 0xffffffff
14590ff73: call      0x1459106e0
14590ff78: nop
14590ff79: mov       rbx, qword ptr [rbp - 0x20]
14590ff7d: mov       r8, qword ptr [rbp - 0x18]
14590ff81: xor       eax, eax
14590ff83: mov       ecx, 0
14590ff88: test      r8, r8
14590ff8b: mov       r15, qword ptr [rbp - 8]
14590ff8f: je        0x145910031
14590ff95: mov       edx, r8d
14590ff98: and       edx, 3
14590ff9b: cmp       r8, 4
14590ff9f: jae       0x14590ffb7
14590ffa1: xor       r9d, r9d
14590ffa4: xor       ecx, ecx
14590ffa6: jmp       0x145910005
14590ffa8: mov       eax, 8
14590ffad: xor       r12d, r12d
14590ffb0: test      r14, r14
14590ffb3: jne       0x14590ff41
14590ffb5: jmp       0x14590ff56
14590ffb7: and       r8, 0xfffffffffffffffc
14590ffbb: lea       r10, [rbx + 0x38]
14590ffbf: xor       r9d, r9d
14590ffc2: xor       ecx, ecx
14590ffc4: nop       word ptr cs:[rax + rax]
14590ffd0: movzx     r11d, byte ptr [r10 - 0x30]
14590ffd5: add       r11d, ecx
14590ffd8: movzx     ecx, byte ptr [r10 - 0x20]
14590ffdd: movzx     r15d, byte ptr [r10 - 0x10]
14590ffe2: add       r15d, ecx
14590ffe5: add       r15d, r11d
14590ffe8: movzx     ecx, byte ptr [r10]
14590ffec: add       ecx, r15d
14590ffef: add       r9, 4
14590fff3: add       r10, 0x40
14590fff7: cmp       r8, r9
14590fffa: jne       0x14590ffd0
14590fffc: test      rdx, rdx
14590ffff: mov       r15, qword ptr [rbp - 8]
145910003: je        0x145910031
145910005: shl       r9, 4
145910009: lea       r8, [r9 + rbx]
14591000d: add       r8, 8
145910011: shl       edx, 4
145910014: xor       r9d, r9d
145910017: nop       word ptr [rax + rax]
145910020: movzx     r10d, byte ptr [r8 + r9]
145910025: add       ecx, r10d
145910028: add       r9, 0x10
14591002c: cmp       rdx, r9
14591002f: jne       0x145910020
145910031: test      r14, r14
145910034: je        0x1459100d1
14591003a: mov       edx, r14d
14591003d: and       edx, 3
145910040: cmp       r14, 4
145910044: jae       0x14591004d
145910046: xor       r8d, r8d
145910049: xor       eax, eax
14591004b: jmp       0x1459100a5
14591004d: movabs    r9, 0xffffffffffffffc
145910057: and       r9, r14
14591005a: lea       r10, [r15 + 0x38]
14591005e: xor       r8d, r8d
145910061: xor       eax, eax
145910063: nop       word ptr cs:[rax + rax]
145910070: movzx     r11d, byte ptr [r10 - 0x30]
145910075: add       r11d, eax
145910078: movzx     eax, byte ptr [r10 - 0x20]
14591007d: movzx     r15d, byte ptr [r10 - 0x10]
145910082: add       r15d, eax
145910085: add       r15d, r11d
145910088: movzx     eax, byte ptr [r10]
14591008c: add       eax, r15d
14591008f: add       r8, 4
145910093: add       r10, 0x40
145910097: cmp       r9, r8
14591009a: jne       0x145910070
14591009c: test      rdx, rdx
14591009f: mov       r15, qword ptr [rbp - 8]
1459100a3: je        0x1459100d1
1459100a5: shl       r8, 4
1459100a9: add       r8, r15
1459100ac: add       r8, 8
1459100b0: shl       edx, 4
1459100b3: xor       r9d, r9d
1459100b6: nop       word ptr cs:[rax + rax]
1459100c0: movzx     r10d, byte ptr [r8 + r9]
1459100c5: add       eax, r10d
1459100c8: add       r9, 0x10
1459100cc: cmp       rdx, r9
1459100cf: jne       0x1459100c0
1459100d1: cmp       ecx, eax
1459100d3: jne       0x145910119
1459100d5: mov       rdx, qword ptr [rsi]
1459100d8: test      rdx, rdx
1459100db: je        0x1459100ef
1459100dd: shl       rdx, 4
1459100e1: mov       r8d, 8
1459100e7: mov       rcx, rdi
1459100ea: call      0x1400021d0
1459100ef: mov       qword ptr [rsi], r13
1459100f2: mov       qword ptr [rsi + 8], r15
1459100f6: mov       qword ptr [rsi + 0x10], r14
1459100fa: mov       rdx, qword ptr [rbp - 0x28]
1459100fe: test      rdx, rdx
145910101: je        0x145910115
145910103: shl       rdx, 4
145910107: mov       r8d, 8
14591010d: mov       rcx, rbx
145910110: call      0x1400021d0
145910115: mov       al, 1
145910117: jmp       0x145910148
145910119: mov       rdx, qword ptr [rbp - 0x28]
14591011d: test      rdx, rdx
145910120: je        0x145910134
145910122: shl       rdx, 4
145910126: mov       r8d, 8
14591012c: mov       rcx, rbx
14591012f: call      0x1400021d0
145910134: mov       r8d, 8
14591013a: mov       rcx, r15
14591013d: mov       rdx, qword ptr [rbp - 0x10]
145910141: call      0x1400021d0
145910146: xor       eax, eax
145910148: add       rsp, 0x68
14591014c: pop       rbx
14591014d: pop       rdi
14591014e: pop       rsi
14591014f: pop       r12
145910151: pop       r13
145910153: pop       r14
145910155: pop       r15
145910157: pop       rbp
145910158: ret
145910159: lea       rdx, [r14 + 1]
14591015d: cmp       rdx, r13
145910160: jae       0x14590fed9
145910166: lea       rcx, [r13 - 2]
14591016a: lea       r9d, [r14 + r13]
14591016e: mov       r8, r14
145910171: test      r9b, 1
145910175: movabs    r9, 0x7ffffffffffffff8
14591017f: jne       0x14591019c
145910181: cmp       byte ptr [rax], 0
145910184: mov       r8, r14
145910187: je        0x145910198
145910189: lea       rdx, [rax - 8]
14591018d: movups    xmm0, xmmword ptr [rdx]
145910190: movups    xmmword ptr [rax - 0x18], xmm0
145910194: lea       r8, [r14 + 1]
145910198: lea       rdx, [r14 + 2]
14591019c: cmp       rcx, r14
14591019f: mov       r14, r8
1459101a2: je        0x14590fee3
1459101a8: mov       rax, r13
1459101ab: sub       rax, rdx
1459101ae: shl       rdx, 4
1459101b2: lea       rcx, [rdx + r15]
1459101b6: add       rcx, 0x18
1459101ba: mov       r14, r8
1459101bd: jmp       0x1459101cd
1459101bf: add       rcx, 0x20
1459101c3: add       rax, -2
1459101c7: je        0x14590fee3
1459101cd: cmp       byte ptr [rcx - 0x10], 0
1459101d1: je        0x1459101e9
1459101d3: lea       rdx, [rcx - 0x18]
1459101d7: mov       r8, r14
1459101da: shl       r8, 4
1459101de: movups    xmm0, xmmword ptr [rdx]
1459101e1: movups    xmmword ptr [r15 + r8], xmm0
1459101e6: inc       r14
1459101e9: cmp       byte ptr [rcx], 0
1459101ec: je        0x1459101bf
1459101ee: mov       rdx, r14
1459101f1: shl       rdx, 4
1459101f5: movups    xmm0, xmmword ptr [rcx - 8]
1459101f9: movups    xmmword ptr [r15 + rdx], xmm0
1459101fe: inc       r14
145910201: jmp       0x1459101bf
